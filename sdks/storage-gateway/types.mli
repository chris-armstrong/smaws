type nonrec string_ = string [@@ocaml.doc ""]

type nonrec error_details = (string_ * string_) list [@@ocaml.doc ""]

type nonrec error_code =
  | ActivationKeyExpired [@ocaml.doc ""]
  | ActivationKeyInvalid [@ocaml.doc ""]
  | ActivationKeyNotFound [@ocaml.doc ""]
  | GatewayInternalError [@ocaml.doc ""]
  | GatewayNotConnected [@ocaml.doc ""]
  | GatewayNotFound [@ocaml.doc ""]
  | GatewayProxyNetworkConnectionBusy [@ocaml.doc ""]
  | AuthenticationFailure [@ocaml.doc ""]
  | BandwidthThrottleScheduleNotFound [@ocaml.doc ""]
  | Blocked [@ocaml.doc ""]
  | CannotExportSnapshot [@ocaml.doc ""]
  | ChapCredentialNotFound [@ocaml.doc ""]
  | DiskAlreadyAllocated [@ocaml.doc ""]
  | DiskDoesNotExist [@ocaml.doc ""]
  | DiskSizeGreaterThanVolumeMaxSize [@ocaml.doc ""]
  | DiskSizeLessThanVolumeSize [@ocaml.doc ""]
  | DiskSizeNotGigAligned [@ocaml.doc ""]
  | DuplicateCertificateInfo [@ocaml.doc ""]
  | DuplicateSchedule [@ocaml.doc ""]
  | EndpointNotFound [@ocaml.doc ""]
  | IAMNotSupported [@ocaml.doc ""]
  | InitiatorInvalid [@ocaml.doc ""]
  | InitiatorNotFound [@ocaml.doc ""]
  | InternalError [@ocaml.doc ""]
  | InvalidGateway [@ocaml.doc ""]
  | InvalidEndpoint [@ocaml.doc ""]
  | InvalidParameters [@ocaml.doc ""]
  | InvalidSchedule [@ocaml.doc ""]
  | LocalStorageLimitExceeded [@ocaml.doc ""]
  | LunAlreadyAllocated_ [@ocaml.doc ""]
  | LunInvalid [@ocaml.doc ""]
  | JoinDomainInProgress [@ocaml.doc ""]
  | MaximumContentLengthExceeded [@ocaml.doc ""]
  | MaximumTapeCartridgeCountExceeded [@ocaml.doc ""]
  | MaximumVolumeCountExceeded [@ocaml.doc ""]
  | NetworkConfigurationChanged [@ocaml.doc ""]
  | NoDisksAvailable [@ocaml.doc ""]
  | NotImplemented [@ocaml.doc ""]
  | NotSupported [@ocaml.doc ""]
  | OperationAborted [@ocaml.doc ""]
  | OutdatedGateway [@ocaml.doc ""]
  | ParametersNotImplemented [@ocaml.doc ""]
  | RegionInvalid [@ocaml.doc ""]
  | RequestTimeout [@ocaml.doc ""]
  | ServiceUnavailable [@ocaml.doc ""]
  | SnapshotDeleted [@ocaml.doc ""]
  | SnapshotIdInvalid [@ocaml.doc ""]
  | SnapshotInProgress [@ocaml.doc ""]
  | SnapshotNotFound [@ocaml.doc ""]
  | SnapshotScheduleNotFound [@ocaml.doc ""]
  | StagingAreaFull [@ocaml.doc ""]
  | StorageFailure [@ocaml.doc ""]
  | TapeCartridgeNotFound [@ocaml.doc ""]
  | TargetAlreadyExists [@ocaml.doc ""]
  | TargetInvalid [@ocaml.doc ""]
  | TargetNotFound [@ocaml.doc ""]
  | UnauthorizedOperation [@ocaml.doc ""]
  | VolumeAlreadyExists [@ocaml.doc ""]
  | VolumeIdInvalid [@ocaml.doc ""]
  | VolumeInUse [@ocaml.doc ""]
  | VolumeNotFound [@ocaml.doc ""]
  | VolumeNotReady [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec storage_gateway_error = {
  error_code : error_code option; [@ocaml.doc "Additional information about the error.\n"]
  error_details : error_details option;
      [@ocaml.doc "Human-readable text that provides detail about the error that occurred.\n"]
}
[@@ocaml.doc
  "Provides additional information about an error that was returned by the service. See the \
   [errorCode] and [errorDetails] members for more information about the error.\n"]

type nonrec invalid_gateway_request_exception = {
  message : string_ option;
      [@ocaml.doc "A human-readable message describing the error that occurred.\n"]
  error : storage_gateway_error option;
      [@ocaml.doc
        "A [StorageGatewayError] that provides more detail about the cause of the error.\n"]
}
[@@ocaml.doc
  "An exception occurred because an invalid gateway request was issued to the service. For more \
   information, see the error and message fields.\n"]

type nonrec internal_server_error = {
  message : string_ option;
      [@ocaml.doc "A human-readable message describing the error that occurred.\n"]
  error : storage_gateway_error option;
      [@ocaml.doc
        "A [StorageGatewayError] that provides more information about the cause of the error.\n"]
}
[@@ocaml.doc
  "An internal server error has occurred during the request. For more information, see the error \
   and message fields.\n"]

type nonrec gateway_ar_n = string [@@ocaml.doc ""]

type nonrec activate_gateway_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc
  "Storage Gateway returns the Amazon Resource Name (ARN) of the activated gateway. It is a string \
   made of information such as your account, gateway name, and Amazon Web Services Region. This \
   ARN is used to reference the gateway in other API operations as well as resource-based \
   authorization.\n\n\
  \  For gateways activated prior to September 02, 2015, the gateway ARN contains the gateway name \
   rather than the gateway ID. Changing the name of the gateway has no effect on the gateway ARN.\n\
  \  \n\
  \   "]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "Tag key. The key can't start with aws:.\n"]
  value : tag_value; [@ocaml.doc "Value of the tag key.\n"]
}
[@@ocaml.doc
  "A key-value pair that helps you manage, filter, and search for your resource. Allowed \
   characters: letters, white space, and numbers, representable in UTF-8, and the following \
   characters: + - = . _ : /.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec medium_changer_type = string [@@ocaml.doc ""]

type nonrec tape_drive_type = string [@@ocaml.doc ""]

type nonrec gateway_type = string [@@ocaml.doc ""]

type nonrec region_id = string [@@ocaml.doc ""]

type nonrec gateway_timezone = string [@@ocaml.doc ""]

type nonrec gateway_name = string [@@ocaml.doc ""]

type nonrec activation_key = string [@@ocaml.doc ""]

type nonrec activate_gateway_input = {
  activation_key : activation_key;
      [@ocaml.doc
        "Your gateway activation key. You can obtain the activation key by sending an HTTP GET \
         request with redirects enabled to the gateway IP address (port 80). The redirect URL \
         returned in the response provides you the activation key for your gateway in the query \
         string parameter [activationKey]. It may also include other activation-related \
         parameters, however, these are merely defaults -- the arguments you pass to the \
         [ActivateGateway] API call determine the actual configuration of your gateway.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/get-activation-key.html}Getting \
         activation key} in the {i Storage Gateway User Guide}.\n\
        \ "]
  gateway_name : gateway_name; [@ocaml.doc "The name you configured for your gateway.\n"]
  gateway_timezone : gateway_timezone;
      [@ocaml.doc
        "A value that indicates the time zone you want to set for the gateway. The time zone is of \
         the format \"GMT\", \"GMT-hr:mm\", or \"GMT+hr:mm\". For example, GMT indicates Greenwich \
         Mean Time without any offset. GMT-4:00 indicates the time is 4 hours behind GMT. GMT+2:00 \
         indicates the time is 2 hours ahead of GMT. The time zone is used, for example, for \
         scheduling snapshots and your gateway's maintenance schedule.\n"]
  gateway_region : region_id;
      [@ocaml.doc
        "A value that indicates the Amazon Web Services Region where you want to store your data. \
         The gateway Amazon Web Services Region specified must be the same Amazon Web Services \
         Region as the Amazon Web Services Region in your [Host] header in the request. For more \
         information about available Amazon Web Services Regions and endpoints for Storage \
         Gateway, see {{:https://docs.aws.amazon.com/general/latest/gr/sg.html} Storage Gateway \
         endpoints and quotas} in the {i Amazon Web Services General Reference}.\n\n\
        \ Valid Values: See {{:https://docs.aws.amazon.com/general/latest/gr/sg.html} Storage \
         Gateway endpoints and quotas} in the {i Amazon Web Services General Reference}. \n\
        \ "]
  gateway_type : gateway_type option;
      [@ocaml.doc
        "A value that defines the type of gateway to activate. The type specified is critical to \
         all later functions of the gateway and cannot be changed after activation. The default \
         value is [CACHED].\n\n\
        \  Amazon FSx File Gateway is no longer available to new customers. Existing customers of \
         FSx File Gateway can continue to use the service normally. For capabilities similar to \
         FSx File Gateway, visit \
         {{:https://aws.amazon.com/blogs/storage/switch-your-file-share-access-from-amazon-fsx-file-gateway-to-amazon-fsx-for-windows-file-server/}this \
         blog post}.\n\
        \  \n\
        \    Valid Values: [STORED] | [CACHED] | [VTL] | [FILE_S3] | [FILE_FSX_SMB] \n\
        \    "]
  tape_drive_type : tape_drive_type option;
      [@ocaml.doc
        "The value that indicates the type of tape drive to use for tape gateway. This field is \
         optional.\n\n\
        \ Valid Values: [IBM-ULT3580-TD5] \n\
        \ "]
  medium_changer_type : medium_changer_type option;
      [@ocaml.doc
        "The value that indicates the type of medium changer to use for tape gateway. This field \
         is optional.\n\n\
        \ Valid Values: [STK-L700] | [AWS-Gateway-VTL] | [IBM-03584L32-0402] \n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that you can assign to the gateway. Each tag is a key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers that can be \
         represented in UTF-8 format, and the following special characters: + - = . _ : / \\@. The \
         maximum length of a tag's key is 128 characters, and the maximum length for a tag's value \
         is 256 characters.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [ActivateGatewayInput$ActivationKey] \n\
  \           \n\
  \            }\n\
  \       {-   [ActivateGatewayInput$GatewayName] \n\
  \           \n\
  \            }\n\
  \       {-   [ActivateGatewayInput$GatewayRegion] \n\
  \           \n\
  \            }\n\
  \       {-   [ActivateGatewayInput$GatewayTimezone] \n\
  \           \n\
  \            }\n\
  \       {-   [ActivateGatewayInput$GatewayType] \n\
  \           \n\
  \            }\n\
  \       {-   [ActivateGatewayInput$MediumChangerType] \n\
  \           \n\
  \            }\n\
  \       {-   [ActivateGatewayInput$TapeDriveType] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec active_directory_status =
  | ACCESS_DENIED [@ocaml.doc ""]
  | DETACHED [@ocaml.doc ""]
  | JOINED [@ocaml.doc ""]
  | JOINING [@ocaml.doc ""]
  | NETWORK_ERROR [@ocaml.doc ""]
  | TIMEOUT [@ocaml.doc ""]
  | UNKNOWN_ERROR [@ocaml.doc ""]
  | INSUFFICIENT_PERMISSIONS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec add_cache_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec disk_id = string [@@ocaml.doc ""]

type nonrec disk_ids = disk_id list [@@ocaml.doc ""]

type nonrec add_cache_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  disk_ids : disk_ids;
      [@ocaml.doc
        "An array of strings that identify disks that are to be configured as working storage. \
         Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs \
         from the [ListLocalDisks] API.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_ar_n = string [@@ocaml.doc ""]

type nonrec add_tags_to_resource_output = {
  resource_ar_n : resource_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource you want to add tags to.\n"]
}
[@@ocaml.doc "AddTagsToResourceOutput\n"]

type nonrec add_tags_to_resource_input = {
  resource_ar_n : resource_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource you want to add tags to.\n"]
  tags : tags;
      [@ocaml.doc
        "The key-value pair that represents the tag you want to add to the resource. The value can \
         be an empty string.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "AddTagsToResourceInput\n"]

type nonrec add_upload_buffer_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec add_upload_buffer_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  disk_ids : disk_ids;
      [@ocaml.doc
        "An array of strings that identify disks that are to be configured as working storage. \
         Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs \
         from the [ListLocalDisks] API.\n"]
}
[@@ocaml.doc ""]

type nonrec add_working_storage_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway for which working \
   storage was configured.\n"]

type nonrec add_working_storage_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  disk_ids : disk_ids;
      [@ocaml.doc
        "An array of strings that identify disks that are to be configured as working storage. \
         Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs \
         from the [ListLocalDisks] API.\n"]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [AddWorkingStorageInput$DiskIds] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec tape_ar_n = string [@@ocaml.doc ""]

type nonrec assign_tape_pool_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc
        "The unique Amazon Resource Names (ARN) of the virtual tape that was added to the tape pool.\n"]
}
[@@ocaml.doc ""]

type nonrec boolean2 = bool [@@ocaml.doc ""]

type nonrec pool_id = string [@@ocaml.doc ""]

type nonrec assign_tape_pool_input = {
  tape_ar_n : tape_ar_n;
      [@ocaml.doc
        "The unique Amazon Resource Name (ARN) of the virtual tape that you want to add to the \
         tape pool.\n"]
  pool_id : pool_id;
      [@ocaml.doc
        "The ID of the pool that you want to add your tape to for archiving. The tape in this pool \
         is archived in the S3 storage class that is associated with the pool. When you use your \
         backup application to eject the tape, the tape is archived directly into the storage \
         class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.\n"]
  bypass_governance_retention : boolean2 option;
      [@ocaml.doc
        "Set permissions to bypass governance retention. If the lock type of the archived tape is \
         [Governance], the tape's archived age is not older than [RetentionLockInDays], and the \
         user does not already have [BypassGovernanceRetention], setting this to TRUE enables the \
         user to bypass the retention lock. This parameter is set to true by default for calls \
         from the console.\n\n\
        \ Valid values: [TRUE] | [FALSE] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec file_system_association_ar_n = string [@@ocaml.doc ""]

type nonrec associate_file_system_output = {
  file_system_association_ar_n : file_system_association_ar_n option;
      [@ocaml.doc "The ARN of the newly created file system association.\n"]
}
[@@ocaml.doc ""]

type nonrec ipv4_address = string [@@ocaml.doc ""]

type nonrec ip_address_list = ipv4_address list [@@ocaml.doc ""]

type nonrec endpoint_network_configuration = {
  ip_addresses : ip_address_list option;
      [@ocaml.doc
        "A list of gateway IP addresses on which the associated Amazon FSx file system is \
         available.\n\n\
        \  If multiple file systems are associated with this gateway, this field is required.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Specifies network configuration information for the gateway associated with the Amazon FSx file \
   system.\n"]

type nonrec cache_stale_timeout_in_seconds = int [@@ocaml.doc ""]

type nonrec cache_attributes = {
  cache_stale_timeout_in_seconds : cache_stale_timeout_in_seconds option;
      [@ocaml.doc
        "Refreshes a file share's cache by using Time To Live (TTL). TTL is the length of time \
         since the last refresh after which access to the directory would cause the file gateway \
         to first refresh that directory's contents from the Amazon S3 bucket or Amazon FSx file \
         system. The TTL duration is in seconds.\n\n\
        \ Valid Values:0, 300 to 2,592,000 seconds (5 minutes to 30 days)\n\
        \ "]
}
[@@ocaml.doc "The refresh cache information for the file share or FSx file systems.\n"]

type nonrec audit_destination_ar_n = string [@@ocaml.doc ""]

type nonrec file_system_location_ar_n = string [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec domain_user_password = string [@@ocaml.doc ""]

type nonrec domain_user_name = string [@@ocaml.doc ""]

type nonrec associate_file_system_input = {
  user_name : domain_user_name;
      [@ocaml.doc
        "The user name of the user credential that has permission to access the root share D$ of \
         the Amazon FSx file system. The user account must belong to the Amazon FSx delegated \
         admin user group.\n"]
  password : domain_user_password; [@ocaml.doc "The password of the user credential.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique string value that you supply that is used by the FSx File Gateway to ensure \
         idempotent file system association creation.\n"]
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  location_ar_n : file_system_location_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon FSx file system to associate with the FSx \
         File Gateway.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to the file system association. Each tag is \
         a key-value pair.\n"]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for the audit logs.\n"]
  cache_attributes : cache_attributes option; [@ocaml.doc ""]
  endpoint_network_configuration : endpoint_network_configuration option;
      [@ocaml.doc
        "Specifies the network configuration information for the gateway associated with the \
         Amazon FSx file system.\n\n\
        \  If multiple file systems are associated with this gateway, this parameter's \
         [IpAddresses] field is required.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec target_ar_n = string [@@ocaml.doc ""]

type nonrec volume_ar_n = string [@@ocaml.doc ""]

type nonrec attach_volume_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume that was attached to the gateway.\n"]
  target_ar_n : target_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name for \
         the initiator that was used to connect to the target.\n"]
}
[@@ocaml.doc "AttachVolumeOutput\n"]

type nonrec network_interface_id = string [@@ocaml.doc ""]

type nonrec target_name = string [@@ocaml.doc ""]

type nonrec attach_volume_input = {
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway that you want to attach the volume to.\n"]
  target_name : target_name option;
      [@ocaml.doc
        "The name of the iSCSI target used by an initiator to connect to a volume and used as a \
         suffix for the target ARN. For example, specifying [TargetName] as {i myvolume} results \
         in the target ARN of \
         [arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume]. \
         The target name must be unique across all volumes on a gateway.\n\n\
        \ If you don't specify a value, Storage Gateway uses the value that was previously used \
         for this volume as the new target name.\n\
        \ "]
  volume_ar_n : volume_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume to attach to the specified gateway.\n"]
  network_interface_id : network_interface_id;
      [@ocaml.doc
        "The network interface of the gateway on which to expose the iSCSI target. Accepts IPv4 \
         and IPv6 addresses. Use [DescribeGatewayInformation] to get a list of the network \
         interfaces available on a gateway.\n\n\
        \ Valid Values: A valid IP address.\n\
        \ "]
  disk_id : disk_id option;
      [@ocaml.doc
        "The unique device ID or other distinguishing data that identifies the local disk used to \
         create the volume. This value is only required when you are attaching a stored volume.\n"]
}
[@@ocaml.doc "AttachVolumeInput\n"]

type nonrec authentication = string [@@ocaml.doc ""]

type nonrec minimum_num_tapes = int [@@ocaml.doc ""]

type nonrec tape_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec tape_barcode_prefix = string [@@ocaml.doc ""]

type nonrec automatic_tape_creation_rule = {
  tape_barcode_prefix : tape_barcode_prefix;
      [@ocaml.doc
        "A prefix that you append to the barcode of the virtual tape that you are creating. This \
         prefix makes the barcode unique.\n\n\
        \  The prefix must be 1-4 characters in length and must be one of the uppercase letters \
         from A to Z.\n\
        \  \n\
        \   "]
  pool_id : pool_id;
      [@ocaml.doc
        "The ID of the pool that you want to add your tape to for archiving. The tape in this pool \
         is archived in the Amazon S3 storage class that is associated with the pool. When you use \
         your backup application to eject the tape, the tape is archived directly into the storage \
         class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.\n"]
  tape_size_in_bytes : tape_size; [@ocaml.doc "The size, in bytes, of the virtual tape capacity.\n"]
  minimum_num_tapes : minimum_num_tapes;
      [@ocaml.doc
        "The minimum number of available virtual tapes that the gateway maintains at all times. If \
         the number of tapes on the gateway goes below this value, the gateway creates as many new \
         tapes as are needed to have [MinimumNumTapes] on the gateway. For more information about \
         automatic tape creation, see \
         {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/GettingStartedCreateTapes.html#CreateTapesAutomatically}Creating \
         Tapes Automatically}.\n"]
  worm : boolean2 option;
      [@ocaml.doc
        "Set to [true] to indicate that tapes are to be archived as write-once-read-many (WORM). \
         Set to [false] when WORM is not enabled for tapes.\n"]
}
[@@ocaml.doc
  "An automatic tape creation policy consists of automatic tape creation rules where each rule \
   defines when and how to create new tapes. For more information about automatic tape creation, \
   see \
   {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/GettingStartedCreateTapes.html#CreateTapesAutomatically}Creating \
   Tapes Automatically}.\n"]

type nonrec automatic_tape_creation_rules = automatic_tape_creation_rule list [@@ocaml.doc ""]

type nonrec automatic_tape_creation_policy_info = {
  automatic_tape_creation_rules : automatic_tape_creation_rules option;
      [@ocaml.doc
        "An automatic tape creation policy consists of a list of automatic tape creation rules. \
         This returns the rules that determine when and how to automatically create new tapes.\n"]
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Information about the gateway's automatic tape creation policies, including the automatic tape \
   creation rules and the gateway that is using the policies.\n"]

type nonrec automatic_tape_creation_policy_infos = automatic_tape_creation_policy_info list
[@@ocaml.doc ""]

type nonrec automatic_update_policy =
  | ALL_VERSIONS [@ocaml.doc ""]
  | EMERGENCY_VERSIONS_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec availability_monitor_test_status =
  | COMPLETE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec bandwidth_download_rate_limit = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec bandwidth_upload_rate_limit = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec day_of_week = int [@@ocaml.doc ""]

type nonrec days_of_week = day_of_week list [@@ocaml.doc ""]

type nonrec minute_of_hour = int [@@ocaml.doc ""]

type nonrec hour_of_day = int [@@ocaml.doc ""]

type nonrec bandwidth_rate_limit_interval = {
  start_hour_of_day : hour_of_day;
      [@ocaml.doc " The hour of the day to start the bandwidth rate limit interval. \n"]
  start_minute_of_hour : minute_of_hour;
      [@ocaml.doc
        " The minute of the hour to start the bandwidth rate limit interval. The interval begins \
         at the start of that minute. To begin an interval exactly at the start of the hour, use \
         the value [0]. \n"]
  end_hour_of_day : hour_of_day;
      [@ocaml.doc " The hour of the day to end the bandwidth rate limit interval. \n"]
  end_minute_of_hour : minute_of_hour;
      [@ocaml.doc
        " The minute of the hour to end the bandwidth rate limit interval. \n\n\
        \   The bandwidth rate limit interval ends at the end of the minute. To end an interval at \
         the end of an hour, use the value [59]. \n\
        \  \n\
        \   "]
  days_of_week : days_of_week;
      [@ocaml.doc
        " The days of the week component of the bandwidth rate limit interval, represented as \
         ordinal numbers from 0 to 6, where 0 represents Sunday and 6 represents Saturday. \n"]
  average_upload_rate_limit_in_bits_per_sec : bandwidth_upload_rate_limit option;
      [@ocaml.doc
        " The average upload rate limit component of the bandwidth rate limit interval, in bits \
         per second. This field does not appear in the response if the upload rate limit is not \
         set. \n\n\
        \  For Tape Gateway and Volume Gateway, the minimum value is [51200].\n\
        \  \n\
        \   This field is required for S3 File Gateway, and the minimum value is [104857600].\n\
        \   \n\
        \    "]
  average_download_rate_limit_in_bits_per_sec : bandwidth_download_rate_limit option;
      [@ocaml.doc
        " The average download rate limit component of the bandwidth rate limit interval, in bits \
         per second. This field does not appear in the response if the download rate limit is not \
         set. \n\n\
        \  S3 File Gateway does not support this feature.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Describes a bandwidth rate limit interval for a gateway. A bandwidth rate limit schedule \
   consists of one or more bandwidth rate limit intervals. A bandwidth rate limit interval defines \
   a period of time on one or more days of the week, during which bandwidth rate limits are \
   specified for uploading, downloading, or both.\n\n\
  \  FSx File Gateway does not support this feature.\n\
  \  \n\
  \   "]

type nonrec bandwidth_rate_limit_intervals = bandwidth_rate_limit_interval list [@@ocaml.doc ""]

type nonrec bandwidth_type = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec cache_report_ar_n = string [@@ocaml.doc ""]

type nonrec cache_report_filter_value = string [@@ocaml.doc ""]

type nonrec cache_report_filter_values = cache_report_filter_value list [@@ocaml.doc ""]

type nonrec cache_report_filter_name =
  | UploadState [@ocaml.doc ""]
  | UploadFailureReason [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cache_report_filter = {
  name : cache_report_filter_name;
      [@ocaml.doc
        "The parameter name for a filter that determines which files are included or excluded from \
         a cache report.\n\n\
        \  {b Valid Names:} \n\
        \ \n\
        \  UploadFailureReason | UploadState\n\
        \  "]
  values : cache_report_filter_values;
      [@ocaml.doc
        "The parameter value for a filter that determines which files are included or excluded \
         from a cache report.\n\n\
        \  {b Valid [UploadFailureReason] Values:} \n\
        \ \n\
        \   [InaccessibleStorageClass] | [InvalidObjectState] | [ObjectMissing] | [S3AccessDenied] \n\
        \  \n\
        \    {b Valid [UploadState] Values:} \n\
        \   \n\
        \     [FailingUpload] \n\
        \    "]
}
[@@ocaml.doc
  "A list of filter parameters and associated values that determine which files are included or \
   excluded from a cache report created by a [StartCacheReport] request. Multiple instances of the \
   same filter parameter are combined with an OR operation, while different parameters are \
   combined with an AND operation.\n"]

type nonrec cache_report_filter_list = cache_report_filter list [@@ocaml.doc ""]

type nonrec cache_report_name = string [@@ocaml.doc ""]

type nonrec time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec location_ar_n = string [@@ocaml.doc ""]

type nonrec file_share_ar_n = string [@@ocaml.doc ""]

type nonrec role = string [@@ocaml.doc ""]

type nonrec report_completion_percent = int [@@ocaml.doc ""]

type nonrec cache_report_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cache_report_info = {
  cache_report_ar_n : cache_report_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cache report you want to describe.\n"]
  cache_report_status : cache_report_status option;
      [@ocaml.doc "The status of the specified cache report.\n"]
  report_completion_percent : report_completion_percent option;
      [@ocaml.doc
        "The percentage of the report generation process that has been completed at time of inquiry.\n"]
  end_time : time option;
      [@ocaml.doc "The time at which the gateway stopped generating the cache report.\n"]
  role : role option; [@ocaml.doc ""]
  file_share_ar_n : file_share_ar_n option; [@ocaml.doc ""]
  location_ar_n : location_ar_n option;
      [@ocaml.doc "The ARN of the Amazon S3 bucket location where the cache report is saved.\n"]
  start_time : time option;
      [@ocaml.doc "The time at which the gateway started generating the cache report.\n"]
  inclusion_filters : cache_report_filter_list option;
      [@ocaml.doc
        "The list of filters and parameters that determine which files are included in the report.\n"]
  exclusion_filters : cache_report_filter_list option;
      [@ocaml.doc
        "The list of filters and parameters that determine which files are excluded from the report.\n"]
  report_name : cache_report_name option;
      [@ocaml.doc "The file name of the completed cache report object stored in Amazon S3.\n"]
  tags : tags option; [@ocaml.doc "The list of key/value tags associated with the report.\n"]
}
[@@ocaml.doc
  "Contains all informational fields associated with a cache report. Includes name, ARN, tags, \
   status, progress, filters, start time, and end time.\n"]

type nonrec cache_report_list = cache_report_info list [@@ocaml.doc ""]

type nonrec kms_key = string [@@ocaml.doc ""]

type nonrec volume_used_in_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec created_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec positive_int_object = int [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec volumei_scsi_attributes = {
  target_ar_n : target_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the volume target.\n"]
  network_interface_id : network_interface_id option;
      [@ocaml.doc "The network interface identifier.\n"]
  network_interface_port : integer option;
      [@ocaml.doc "The port used to communicate with iSCSI targets.\n"]
  lun_number : positive_int_object option; [@ocaml.doc "The logical disk number.\n"]
  chap_enabled : boolean2 option;
      [@ocaml.doc "Indicates whether mutual CHAP is enabled for the iSCSI target.\n"]
}
[@@ocaml.doc "Lists iSCSI information about a volume.\n"]

type nonrec snapshot_id = string [@@ocaml.doc ""]

type nonrec double_object = float [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec volume_attachment_status = string [@@ocaml.doc ""]

type nonrec volume_status = string [@@ocaml.doc ""]

type nonrec volume_type = string [@@ocaml.doc ""]

type nonrec volume_id = string [@@ocaml.doc ""]

type nonrec cachedi_scsi_volume = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage volume.\n"]
  volume_id : volume_id option;
      [@ocaml.doc "The unique identifier of the volume, e.g., vol-AE4B946D.\n"]
  volume_type : volume_type option;
      [@ocaml.doc
        "One of the VolumeType enumeration values that describes the type of the volume.\n"]
  volume_status : volume_status option;
      [@ocaml.doc
        "One of the VolumeStatus values that indicates the state of the storage volume.\n"]
  volume_attachment_status : volume_attachment_status option;
      [@ocaml.doc
        "A value that indicates whether a storage volume is attached to or detached from a \
         gateway. For more information, see \
         {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume}Moving \
         your volumes to a different gateway}.\n"]
  volume_size_in_bytes : long option; [@ocaml.doc "The size, in bytes, of the volume capacity.\n"]
  volume_progress : double_object option;
      [@ocaml.doc
        "Represents the percentage complete if the volume is restoring or bootstrapping that \
         represents the percent of data transferred. This field does not appear in the response if \
         the cached volume is not restoring or bootstrapping.\n"]
  source_snapshot_id : snapshot_id option;
      [@ocaml.doc
        "If the cached volume was created from a snapshot, this field contains the snapshot ID \
         used, e.g., snap-78e22663. Otherwise, this field is not included.\n"]
  volumei_scsi_attributes : volumei_scsi_attributes option;
      [@ocaml.doc
        "An [VolumeiSCSIAttributes] object that represents a collection of iSCSI attributes for \
         one stored volume.\n"]
  created_date : created_date option;
      [@ocaml.doc
        "The date the volume was created. Volumes created prior to March 28, 2017 don\226\128\153t \
         have this timestamp.\n"]
  volume_used_in_bytes : volume_used_in_bytes option;
      [@ocaml.doc
        "The size of the data stored on the volume in bytes. This value is calculated based on the \
         number of blocks that are touched, instead of the actual amount of data written. This \
         value can be useful for sequential write patterns but less accurate for random write \
         patterns. [VolumeUsedInBytes] is different from the compressed size of the volume, which \
         is the value that is used to calculate your bill.\n\n\
        \  This value is not available for volumes created prior to May 13, 2015, until you store \
         data on the volume.\n\
        \  \n\
        \   If you use a delete tool that overwrites the data on your volume with random data, \
         your usage will not be reduced. This is because the random data is not compressible. If \
         you want to reduce the amount of billed storage on your volume, we recommend overwriting \
         your files with zeros to compress the data to a negligible amount of actual storage.\n\
        \   \n\
        \    "]
  kms_key : kms_key option; [@ocaml.doc ""]
  target_name : target_name option;
      [@ocaml.doc
        "The name of the iSCSI target used by an initiator to connect to a volume and used as a \
         suffix for the target ARN. For example, specifying [TargetName] as {i myvolume} results \
         in the target ARN of \
         [arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume]. \
         The target name must be unique across all volumes on a gateway.\n\n\
        \ If you don't specify a value, Storage Gateway uses the value that was previously used \
         for this volume as the new target name.\n\
        \ "]
}
[@@ocaml.doc "Describes an iSCSI cached volume.\n"]

type nonrec cachedi_scsi_volumes = cachedi_scsi_volume list [@@ocaml.doc ""]

type nonrec cancel_archival_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape for which archiving was canceled.\n"]
}
[@@ocaml.doc "CancelArchivalOutput\n"]

type nonrec cancel_archival_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  tape_ar_n : tape_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape you want to cancel archiving for.\n"]
}
[@@ocaml.doc "CancelArchivalInput\n"]

type nonrec cancel_cache_report_output = {
  cache_report_ar_n : cache_report_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cache report you want to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_cache_report_input = {
  cache_report_ar_n : cache_report_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cache report you want to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_retrieval_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape for which retrieval was canceled.\n"]
}
[@@ocaml.doc "CancelRetrievalOutput\n"]

type nonrec cancel_retrieval_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  tape_ar_n : tape_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape you want to cancel retrieval for.\n"]
}
[@@ocaml.doc "CancelRetrievalInput\n"]

type nonrec case_sensitivity = ClientSpecified [@ocaml.doc ""] | CaseSensitive [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec chap_secret = string [@@ocaml.doc ""]

type nonrec iqn_name = string [@@ocaml.doc ""]

type nonrec chap_info = {
  target_ar_n : target_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume.\n\n\
        \ Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).\n\
        \ "]
  secret_to_authenticate_initiator : chap_secret option;
      [@ocaml.doc
        "The secret key that the initiator (for example, the Windows client) must provide to \
         participate in mutual CHAP with the target.\n"]
  initiator_name : iqn_name option;
      [@ocaml.doc "The iSCSI initiator that connects to the target.\n"]
  secret_to_authenticate_target : chap_secret option;
      [@ocaml.doc
        "The secret key that the target must provide to participate in mutual CHAP with the \
         initiator (e.g., Windows client).\n"]
}
[@@ocaml.doc
  "Describes Challenge-Handshake Authentication Protocol (CHAP) information that supports \
   authentication between your gateway and iSCSI initiators.\n"]

type nonrec chap_credentials = chap_info list [@@ocaml.doc ""]

type nonrec cloud_watch_log_group_ar_n = string [@@ocaml.doc ""]

type nonrec create_cachedi_scsi_volume_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the configured volume.\n"]
  target_ar_n : target_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name that \
         initiators can use to connect to the target.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cachedi_scsi_volume_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  volume_size_in_bytes : long; [@ocaml.doc "The size of the volume in bytes.\n"]
  snapshot_id : snapshot_id option;
      [@ocaml.doc
        "The snapshot ID (e.g. \"snap-1122aabb\") of the snapshot to restore as the new cached \
         volume. Specify this field if you want to create the iSCSI storage volume from a \
         snapshot; otherwise, do not include this field. To list snapshots for your account use \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html}DescribeSnapshots} \
         in the {i Amazon Elastic Compute Cloud API Reference}.\n"]
  target_name : target_name;
      [@ocaml.doc
        "The name of the iSCSI target used by an initiator to connect to a volume and used as a \
         suffix for the target ARN. For example, specifying [TargetName] as {i myvolume} results \
         in the target ARN of \
         [arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume]. \
         The target name must be unique across all volumes on a gateway.\n\n\
        \ If you don't specify a value, Storage Gateway uses the value that was previously used \
         for this volume as the new target name.\n\
        \ "]
  source_volume_ar_n : volume_ar_n option;
      [@ocaml.doc
        "The ARN for an existing volume. Specifying this ARN makes the new volume into an exact \
         copy of the specified existing volume's latest recovery point. The [VolumeSizeInBytes] \
         value for this new volume must be equal to or larger than the size of the existing \
         volume, in bytes.\n"]
  network_interface_id : network_interface_id;
      [@ocaml.doc
        "The network interface of the gateway on which to expose the iSCSI target. Accepts IPv4 \
         and IPv6 addresses. Use [DescribeGatewayInformation] to get a list of the network \
         interfaces available on a gateway.\n\n\
        \ Valid Values: A valid IP address.\n\
        \ "]
  client_token : client_token;
      [@ocaml.doc
        "A unique identifier that you use to retry a request. If you retry a request, use the same \
         [ClientToken] you specified in the initial request.\n"]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Set to [true] to use Amazon S3 server-side encryption with your own KMS key, or [false] \
         to use a key managed by Amazon S3. Optional.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  kms_key : kms_key option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon \
         S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value \
         can only be set when [KMSEncrypted] is [true]. Optional.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that you can assign to a cached volume. Each tag is a key-value \
         pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers that you can \
         represent in UTF-8 format, and the following special characters: + - = . _ : / \\@. The \
         maximum length of a tag's key is 128 characters, and the maximum length for a tag's value \
         is 256 characters.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_nfs_file_share_output = {
  file_share_ar_n : file_share_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the newly created file share.\n"]
}
[@@ocaml.doc "CreateNFSFileShareOutput\n"]

type nonrec dns_host_name = string [@@ocaml.doc ""]

type nonrec notification_policy = string [@@ocaml.doc ""]

type nonrec file_share_name = string [@@ocaml.doc ""]

type nonrec squash = string [@@ocaml.doc ""]

type nonrec ipv4_or_ipv6_address_cid_r = string [@@ocaml.doc ""]

type nonrec file_share_client_list = ipv4_or_ipv6_address_cid_r list [@@ocaml.doc ""]

type nonrec object_ac_l =
  | Private [@ocaml.doc ""]
  | Public_read [@ocaml.doc ""]
  | Public_read_write [@ocaml.doc ""]
  | Authenticated_read [@ocaml.doc ""]
  | Bucket_owner_read [@ocaml.doc ""]
  | Bucket_owner_full_control [@ocaml.doc ""]
  | Aws_exec_read [@ocaml.doc ""]
[@@ocaml.doc
  "A value that sets the access control list (ACL) permission for objects in the S3 bucket that an \
   S3 File Gateway puts objects into. The default value is [private].\n"]

type nonrec storage_class = string [@@ocaml.doc ""]

type nonrec encryption_type =
  | SseS3 [@ocaml.doc ""]
  | SseKms [@ocaml.doc ""]
  | DsseKms [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec permission_id = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec permission_mode = string [@@ocaml.doc ""]

type nonrec nfs_file_share_defaults = {
  file_mode : permission_mode option;
      [@ocaml.doc
        "The Unix file mode in the form \"nnnn\". For example, [0666] represents the default file \
         mode inside the file share. The default value is [0666].\n"]
  directory_mode : permission_mode option;
      [@ocaml.doc
        "The Unix directory mode in the form \"nnnn\". For example, [0666] represents the default \
         access mode for all directories inside the file share. The default value is [0777].\n"]
  group_id : permission_id option;
      [@ocaml.doc
        "The default group ID for the file share (unless the files have another group ID \
         specified). The default value is [nfsnobody].\n"]
  owner_id : permission_id option;
      [@ocaml.doc
        "The default owner ID for files in the file share (unless the files have another owner ID \
         specified). The default value is [nfsnobody].\n"]
}
[@@ocaml.doc
  "Describes Network File System (NFS) file share default values. Files and folders stored as \
   Amazon S3 objects in S3 buckets don't, by default, have Unix file permissions assigned to them. \
   Upon discovery in an S3 bucket by Storage Gateway, the S3 objects that represent files and \
   folders are assigned these default Unix permissions. This operation is only supported for S3 \
   File Gateways.\n"]

type nonrec create_nfs_file_share_input = {
  client_token : client_token;
      [@ocaml.doc
        "A unique string value that you supply that is used by S3 File Gateway to ensure \
         idempotent file share creation.\n"]
  nfs_file_share_defaults : nfs_file_share_defaults option;
      [@ocaml.doc "File share default values. Optional.\n"]
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the S3 File Gateway on which you want to create a file \
         share.\n"]
  encryption_type : encryption_type option;
      [@ocaml.doc
        "A value that specifies the type of server-side encryption that the file share will use \
         for the data that it stores in Amazon S3.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \    "]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Optional. Set to [true] to use Amazon S3 server-side encryption with your own KMS key \
         (SSE-KMS), or [false] to use a key managed by Amazon S3 (SSE-S3). To use dual-layer \
         encryption (DSSE-KMS), set the [EncryptionType] parameter instead.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \     Valid Values: [true] | [false] \n\
        \     "]
  kms_key : kms_key option;
      [@ocaml.doc
        "Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used \
         for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. \
         This value must be set if [KMSEncrypted] is [true], or if [EncryptionType] is [SseKms] or \
         [DsseKms].\n"]
  role : role;
      [@ocaml.doc
        "The ARN of the Identity and Access Management (IAM) role that an S3 File Gateway assumes \
         when it accesses the underlying storage.\n"]
  location_ar_n : location_ar_n;
      [@ocaml.doc
        "A custom ARN for the backend storage used for storing data for file shares. It includes a \
         resource ARN with an optional prefix concatenation. The prefix must end with a forward \
         slash (/).\n\n\
        \  You can specify LocationARN as a bucket ARN, access point ARN or access point alias, as \
         shown in the following examples.\n\
        \  \n\
        \   Bucket ARN:\n\
        \   \n\
        \     [arn:aws:s3:::amzn-s3-demo-bucket/prefix/] \n\
        \    \n\
        \     Access point ARN:\n\
        \     \n\
        \       [arn:aws:s3:region:account-id:accesspoint/access-point-name/prefix/] \n\
        \      \n\
        \       If you specify an access point, the bucket policy must be configured to delegate \
         access control to the access point. For information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-policies.html#access-points-delegating-control}Delegating \
         access control to access points} in the {i Amazon S3 User Guide}.\n\
        \       \n\
        \        Access point alias:\n\
        \        \n\
        \          [test-ap-ab123cdef4gehijklmn5opqrstuvuse1a-s3alias] \n\
        \         \n\
        \          "]
  default_storage_class : storage_class option;
      [@ocaml.doc
        "The default storage class for objects put into an Amazon S3 bucket by the S3 File \
         Gateway. The default value is [S3_STANDARD]. Optional.\n\n\
        \ Valid Values: [S3_STANDARD] | [S3_INTELLIGENT_TIERING] | [S3_STANDARD_IA] | \
         [S3_ONEZONE_IA] \n\
        \ "]
  object_ac_l : object_ac_l option;
      [@ocaml.doc
        "A value that sets the access control list (ACL) permission for objects in the S3 bucket \
         that a S3 File Gateway puts objects into. The default value is [private].\n"]
  client_list : file_share_client_list option;
      [@ocaml.doc
        "The list of clients that are allowed to access the S3 File Gateway. The list must contain \
         either valid IPv4/IPv6 addresses or valid CIDR blocks.\n"]
  squash : squash option;
      [@ocaml.doc
        "A value that maps a user to anonymous user.\n\n\
        \ Valid values are the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   [RootSquash]: Only root is mapped to anonymous user.\n\
        \            \n\
        \             }\n\
        \        {-   [NoSquash]: No one is mapped to anonymous user.\n\
        \            \n\
        \             }\n\
        \        {-   [AllSquash]: Everyone is mapped to anonymous user.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  read_only : boolean_ option;
      [@ocaml.doc
        "A value that sets the write status of a file share. Set this value to [true] to set the \
         write status to read-only, otherwise set to [false].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  guess_mime_type_enabled : boolean_ option;
      [@ocaml.doc
        "A value that enables guessing of the MIME type for uploaded objects based on file \
         extensions. Set this value to [true] to enable MIME type guessing, otherwise set to \
         [false]. The default value is [true].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  requester_pays : boolean_ option;
      [@ocaml.doc
        "A value that sets who pays the cost of the request and the cost associated with data \
         download from the S3 bucket. If this value is set to [true], the requester pays the \
         costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the \
         cost of storing data.\n\n\
        \   [RequesterPays] is a configuration for the S3 bucket that backs the file share, so \
         make sure that the configuration on the file share is the same as the S3 bucket \
         configuration.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a \
         key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
  file_share_name : file_share_name option;
      [@ocaml.doc
        "The name of the file share. Optional.\n\n\
        \   [FileShareName] must be set if an S3 prefix name is set in [LocationARN], or if an \
         access point or access point alias is used.\n\
        \  \n\
        \   A valid NFS file share name can only contain the following characters: [a]-[z], \
         [A]-[Z], [0]-[9], [-], [.], and [_].\n\
        \   \n\
        \    "]
  cache_attributes : cache_attributes option;
      [@ocaml.doc "Specifies refresh cache information for the file share.\n"]
  notification_policy : notification_policy option;
      [@ocaml.doc
        "The notification policy of the file share. [SettlingTimeInSeconds] controls the number of \
         seconds to wait after the last point in time a client wrote to a file before generating \
         an [ObjectUploaded] notification. Because clients can make many small writes to files, \
         it's best to set this parameter for as long as possible to avoid generating multiple \
         notifications for the same file in a small time period.\n\n\
        \   [SettlingTimeInSeconds] has no effect on the timing of the object uploading to Amazon \
         S3, only the timing of the notification.\n\
        \  \n\
        \   This setting is not meant to specify an exact time at which the notification will be \
         sent. In some cases, the gateway might require more than the specified delay time to \
         generate and send notifications.\n\
        \   \n\
        \     The following example sets [NotificationPolicy] on with [SettlingTimeInSeconds] set \
         to 60.\n\
        \     \n\
        \       [{\\\"Upload\\\": {\\\"SettlingTimeInSeconds\\\": 60}}] \n\
        \      \n\
        \       The following example sets [NotificationPolicy] off.\n\
        \       \n\
        \         [{}] \n\
        \        "]
  vpc_endpoint_dns_name : dns_host_name option;
      [@ocaml.doc
        "Specifies the DNS name for the VPC endpoint that the NFS file share uses to connect to \
         Amazon S3.\n\n\
        \  This parameter is required for NFS file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  bucket_region : region_id option;
      [@ocaml.doc
        "Specifies the Region of the S3 bucket where the NFS file share stores files.\n\n\
        \  This parameter is required for NFS file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for audit logs.\n"]
}
[@@ocaml.doc "CreateNFSFileShareInput\n"]

type nonrec create_smb_file_share_output = {
  file_share_ar_n : file_share_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the newly created file share.\n"]
}
[@@ocaml.doc "CreateSMBFileShareOutput\n"]

type nonrec user_list_user = string [@@ocaml.doc ""]

type nonrec user_list = user_list_user list [@@ocaml.doc ""]

type nonrec create_smb_file_share_input = {
  client_token : client_token;
      [@ocaml.doc
        "A unique string value that you supply that is used by S3 File Gateway to ensure \
         idempotent file share creation.\n"]
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc "The ARN of the S3 File Gateway on which you want to create a file share.\n"]
  encryption_type : encryption_type option;
      [@ocaml.doc
        "A value that specifies the type of server-side encryption that the file share will use \
         for the data that it stores in Amazon S3.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \    "]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Optional. Set to [true] to use Amazon S3 server-side encryption with your own KMS key \
         (SSE-KMS), or [false] to use a key managed by Amazon S3 (SSE-S3). To use dual-layer \
         encryption (DSSE-KMS), set the [EncryptionType] parameter instead.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \     Valid Values: [true] | [false] \n\
        \     "]
  kms_key : kms_key option;
      [@ocaml.doc
        "Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used \
         for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. \
         This value must be set if [KMSEncrypted] is [true], or if [EncryptionType] is [SseKms] or \
         [DsseKms].\n"]
  role : role;
      [@ocaml.doc
        "The ARN of the Identity and Access Management (IAM) role that an S3 File Gateway assumes \
         when it accesses the underlying storage.\n"]
  location_ar_n : location_ar_n;
      [@ocaml.doc
        "A custom ARN for the backend storage used for storing data for file shares. It includes a \
         resource ARN with an optional prefix concatenation. The prefix must end with a forward \
         slash (/).\n\n\
        \  You can specify LocationARN as a bucket ARN, access point ARN or access point alias, as \
         shown in the following examples.\n\
        \  \n\
        \   Bucket ARN:\n\
        \   \n\
        \     [arn:aws:s3:::amzn-s3-demo-bucket/prefix/] \n\
        \    \n\
        \     Access point ARN:\n\
        \     \n\
        \       [arn:aws:s3:region:account-id:accesspoint/access-point-name/prefix/] \n\
        \      \n\
        \       If you specify an access point, the bucket policy must be configured to delegate \
         access control to the access point. For information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-points-policies.html#access-points-delegating-control}Delegating \
         access control to access points} in the {i Amazon S3 User Guide}.\n\
        \       \n\
        \        Access point alias:\n\
        \        \n\
        \          [test-ap-ab123cdef4gehijklmn5opqrstuvuse1a-s3alias] \n\
        \         \n\
        \          "]
  default_storage_class : storage_class option;
      [@ocaml.doc
        "The default storage class for objects put into an Amazon S3 bucket by the S3 File \
         Gateway. The default value is [S3_STANDARD]. Optional.\n\n\
        \ Valid Values: [S3_STANDARD] | [S3_INTELLIGENT_TIERING] | [S3_STANDARD_IA] | \
         [S3_ONEZONE_IA] \n\
        \ "]
  object_ac_l : object_ac_l option;
      [@ocaml.doc
        "A value that sets the access control list (ACL) permission for objects in the S3 bucket \
         that a S3 File Gateway puts objects into. The default value is [private].\n"]
  read_only : boolean_ option;
      [@ocaml.doc
        "A value that sets the write status of a file share. Set this value to [true] to set the \
         write status to read-only, otherwise set to [false].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  guess_mime_type_enabled : boolean_ option;
      [@ocaml.doc
        "A value that enables guessing of the MIME type for uploaded objects based on file \
         extensions. Set this value to [true] to enable MIME type guessing, otherwise set to \
         [false]. The default value is [true].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  requester_pays : boolean_ option;
      [@ocaml.doc
        "A value that sets who pays the cost of the request and the cost associated with data \
         download from the S3 bucket. If this value is set to [true], the requester pays the \
         costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the \
         cost of storing data.\n\n\
        \   [RequesterPays] is a configuration for the S3 bucket that backs the file share, so \
         make sure that the configuration on the file share is the same as the S3 bucket \
         configuration.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
  smbacl_enabled : boolean_ option;
      [@ocaml.doc
        "Set this value to [true] to enable access control list (ACL) on the SMB file share. Set \
         it to [false] to map file and directory permissions to the POSIX permissions.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/filegateway/latest/files3/smb-acl.html}Using Windows ACLs \
         to limit SMB file share access} in the {i Amazon S3 File Gateway User Guide}.\n\
        \ \n\
        \  Valid Values: [true] | [false] \n\
        \  "]
  access_based_enumeration : boolean_ option;
      [@ocaml.doc
        "The files and folders on this share will only be visible to users with read access.\n"]
  admin_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that will be granted administrator \
         privileges on the file share. These users can do all file operations as the super-user. \
         Acceptable formats include: [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1].\n\n\
        \  Use this option very carefully, because any user in this list can do anything they like \
         on the file share, regardless of file permissions.\n\
        \  \n\
        \   "]
  valid_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that are allowed to access the file \
         {{:}} share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  invalid_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that are not allowed to access the file \
         share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for audit logs.\n"]
  authentication : authentication option;
      [@ocaml.doc
        "The authentication method that users use to access the file share. The default is \
         [ActiveDirectory].\n\n\
        \ Valid Values: [ActiveDirectory] | [GuestAccess] \n\
        \ "]
  case_sensitivity : case_sensitivity option;
      [@ocaml.doc
        "The case of an object name in an Amazon S3 bucket. For [ClientSpecified], the client \
         determines the case sensitivity. For [CaseSensitive], the gateway determines the case \
         sensitivity. The default value is [ClientSpecified].\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to the NFS file share. Each tag is a \
         key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
  file_share_name : file_share_name option;
      [@ocaml.doc
        "The name of the file share. Optional.\n\n\
        \   [FileShareName] must be set if an S3 prefix name is set in [LocationARN], or if an \
         access point or access point alias is used.\n\
        \  \n\
        \   A valid SMB file share name cannot contain the following characters: \
         [\\[],[\\]],[#],[;],[<],[>],[:],[\"],[\\],[/],[|],[?],[*],[+], or ASCII control \
         characters [1-31].\n\
        \   \n\
        \    "]
  cache_attributes : cache_attributes option;
      [@ocaml.doc "Specifies refresh cache information for the file share.\n"]
  notification_policy : notification_policy option;
      [@ocaml.doc
        "The notification policy of the file share. [SettlingTimeInSeconds] controls the number of \
         seconds to wait after the last point in time a client wrote to a file before generating \
         an [ObjectUploaded] notification. Because clients can make many small writes to files, \
         it's best to set this parameter for as long as possible to avoid generating multiple \
         notifications for the same file in a small time period.\n\n\
        \   [SettlingTimeInSeconds] has no effect on the timing of the object uploading to Amazon \
         S3, only the timing of the notification.\n\
        \  \n\
        \   This setting is not meant to specify an exact time at which the notification will be \
         sent. In some cases, the gateway might require more than the specified delay time to \
         generate and send notifications.\n\
        \   \n\
        \     The following example sets [NotificationPolicy] on with [SettlingTimeInSeconds] set \
         to 60.\n\
        \     \n\
        \       [{\\\"Upload\\\": {\\\"SettlingTimeInSeconds\\\": 60}}] \n\
        \      \n\
        \       The following example sets [NotificationPolicy] off.\n\
        \       \n\
        \         [{}] \n\
        \        "]
  vpc_endpoint_dns_name : dns_host_name option;
      [@ocaml.doc
        "Specifies the DNS name for the VPC endpoint that the SMB file share uses to connect to \
         Amazon S3.\n\n\
        \  This parameter is required for SMB file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  bucket_region : region_id option;
      [@ocaml.doc
        "Specifies the Region of the S3 bucket where the SMB file share stores files.\n\n\
        \  This parameter is required for SMB file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  oplocks_enabled : boolean_ option;
      [@ocaml.doc
        "Specifies whether opportunistic locking is enabled for the SMB file share.\n\n\
        \  Enabling opportunistic locking on case-sensitive shares is not recommended for \
         workloads that involve access to files with the same name in different case.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
}
[@@ocaml.doc "CreateSMBFileShareInput\n"]

type nonrec service_unavailable_error = {
  message : string_ option;
      [@ocaml.doc "A human-readable message describing the error that occurred.\n"]
  error : storage_gateway_error option;
      [@ocaml.doc
        "A [StorageGatewayError] that provides more information about the cause of the error.\n"]
}
[@@ocaml.doc
  "An internal server error has occurred because the service is unavailable. For more information, \
   see the error and message fields.\n"]

type nonrec create_snapshot_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the volume of which the snapshot was taken.\n"]
  snapshot_id : snapshot_id option;
      [@ocaml.doc
        "The snapshot ID that is used to refer to the snapshot in future operations such as \
         describing snapshots (Amazon Elastic Compute Cloud API [DescribeSnapshots]) or creating a \
         volume from a snapshot ([CreateStorediSCSIVolume]).\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec snapshot_description = string [@@ocaml.doc ""]

type nonrec create_snapshot_input = {
  volume_ar_n : volume_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume. Use the [ListVolumes] operation to return a \
         list of gateway volumes.\n"]
  snapshot_description : snapshot_description;
      [@ocaml.doc
        "Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block \
         Store snapshots panel in the {b Description} field, and in the Storage Gateway snapshot \
         {b Details} pane, {b Description} field.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [CreateSnapshotInput$SnapshotDescription] \n\
  \           \n\
  \            }\n\
  \       {-   [CreateSnapshotInput$VolumeARN] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec create_snapshot_from_volume_recovery_point_output = {
  snapshot_id : snapshot_id option; [@ocaml.doc "The ID of the snapshot.\n"]
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the \
         [DescribeStorediSCSIVolumes] operation to return to retrieve the TargetARN for specified \
         VolumeARN.\n"]
  volume_recovery_point_time : string_ option;
      [@ocaml.doc "The time the volume was created from the recovery point.\n"]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_from_volume_recovery_point_input = {
  volume_ar_n : volume_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the \
         [DescribeStorediSCSIVolumes] operation to return to retrieve the TargetARN for specified \
         VolumeARN.\n"]
  snapshot_description : snapshot_description;
      [@ocaml.doc
        "Textual description of the snapshot that appears in the Amazon EC2 console, Elastic Block \
         Store snapshots panel in the {b Description} field, and in the Storage Gateway snapshot \
         {b Details} pane, {b Description} field.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_storedi_scsi_volume_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the configured volume.\n"]
  volume_size_in_bytes : long option; [@ocaml.doc "The size of the volume in bytes.\n"]
  target_ar_n : target_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume target, which includes the iSCSI name that \
         initiators can use to connect to the target.\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec create_storedi_scsi_volume_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  disk_id : disk_id;
      [@ocaml.doc
        "The unique identifier for the gateway local disk that is configured as a stored volume. \
         Use \
         {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/API_ListLocalDisks.html}ListLocalDisks} \
         to list disk IDs for a gateway.\n"]
  snapshot_id : snapshot_id option;
      [@ocaml.doc
        "The snapshot ID (e.g., \"snap-1122aabb\") of the snapshot to restore as the new stored \
         volume. Specify this field if you want to create the iSCSI storage volume from a \
         snapshot; otherwise, do not include this field. To list snapshots for your account use \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSnapshots.html}DescribeSnapshots} \
         in the {i Amazon Elastic Compute Cloud API Reference}.\n"]
  preserve_existing_data : boolean2;
      [@ocaml.doc
        "Set to [true] if you want to preserve the data on the local disk. Otherwise, set to \
         [false] to create an empty volume.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  target_name : target_name;
      [@ocaml.doc
        "The name of the iSCSI target used by an initiator to connect to a volume and used as a \
         suffix for the target ARN. For example, specifying [TargetName] as {i myvolume} results \
         in the target ARN of \
         [arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume]. \
         The target name must be unique across all volumes on a gateway.\n\n\
        \ If you don't specify a value, Storage Gateway uses the value that was previously used \
         for this volume as the new target name.\n\
        \ "]
  network_interface_id : network_interface_id;
      [@ocaml.doc
        "The network interface of the gateway on which to expose the iSCSI target. Accepts IPv4 \
         and IPv6 addresses. Use [DescribeGatewayInformation] to get a list of the network \
         interfaces available on a gateway.\n\n\
        \ Valid Values: A valid IP address.\n\
        \ "]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Set to [true] to use Amazon S3 server-side encryption with your own KMS key, or [false] \
         to use a key managed by Amazon S3. Optional.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  kms_key : kms_key option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon \
         S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value \
         can only be set when [KMSEncrypted] is [true]. Optional.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to a stored volume. Each tag is a key-value \
         pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [CreateStorediSCSIVolumeInput$DiskId] \n\
  \           \n\
  \            }\n\
  \       {-   [CreateStorediSCSIVolumeInput$NetworkInterfaceId] \n\
  \           \n\
  \            }\n\
  \       {-   [CreateStorediSCSIVolumeInput$PreserveExistingData] \n\
  \           \n\
  \            }\n\
  \       {-   [CreateStorediSCSIVolumeInput$SnapshotId] \n\
  \           \n\
  \            }\n\
  \       {-   [CreateStorediSCSIVolumeInput$TargetName] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec pool_ar_n = string [@@ocaml.doc ""]

type nonrec create_tape_pool_output = {
  pool_ar_n : pool_ar_n option;
      [@ocaml.doc
        "The unique Amazon Resource Name (ARN) that represents the custom tape pool. Use the \
         [ListTapePools] operation to return a list of tape pools for your account and Amazon Web \
         Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec retention_lock_time_in_days = int [@@ocaml.doc ""]

type nonrec retention_lock_type =
  | COMPLIANCE [@ocaml.doc ""]
  | GOVERNANCE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tape_storage_class = DEEP_ARCHIVE [@ocaml.doc ""] | GLACIER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec pool_name = string [@@ocaml.doc ""]

type nonrec create_tape_pool_input = {
  pool_name : pool_name; [@ocaml.doc "The name of the new custom tape pool.\n"]
  storage_class : tape_storage_class;
      [@ocaml.doc
        "The storage class that is associated with the new custom pool. When you use your backup \
         application to eject the tape, the tape is archived directly into the storage class (S3 \
         Glacier or S3 Glacier Deep Archive) that corresponds to the pool.\n"]
  retention_lock_type : retention_lock_type option;
      [@ocaml.doc
        "Tape retention lock can be configured in two modes. When configured in governance mode, \
         Amazon Web Services accounts with specific IAM permissions are authorized to remove the \
         tape retention lock from archived virtual tapes. When configured in compliance mode, the \
         tape retention lock cannot be removed by any user, including the root Amazon Web Services \
         account.\n"]
  retention_lock_time_in_days : retention_lock_time_in_days option;
      [@ocaml.doc
        "Tape retention lock time is set in days. Tape retention lock can be enabled for up to 100 \
         years (36,500 days).\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to tape pool. Each tag is a key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_tape_with_barcode_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc
        "A unique Amazon Resource Name (ARN) that represents the virtual tape that was created.\n"]
}
[@@ocaml.doc "CreateTapeOutput\n"]

type nonrec tape_barcode = string [@@ocaml.doc ""]

type nonrec create_tape_with_barcode_input = {
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The unique Amazon Resource Name (ARN) that represents the gateway to associate the \
         virtual tape with. Use the [ListGateways] operation to return a list of gateways for your \
         account and Amazon Web Services Region.\n"]
  tape_size_in_bytes : tape_size;
      [@ocaml.doc
        "The size, in bytes, of the virtual tape that you want to create.\n\n\
        \  The size must be aligned by gigabyte (1024*1024*1024 bytes).\n\
        \  \n\
        \   "]
  tape_barcode : tape_barcode;
      [@ocaml.doc
        "The barcode that you want to assign to the tape.\n\n\
        \  Barcodes cannot be reused. This includes barcodes used for tapes that have been deleted.\n\
        \  \n\
        \   "]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Set to [true] to use Amazon S3 server-side encryption with your own KMS key, or [false] \
         to use a key managed by Amazon S3. Optional.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  kms_key : kms_key option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon \
         S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value \
         can only be set when [KMSEncrypted] is [true]. Optional.\n"]
  pool_id : pool_id option;
      [@ocaml.doc
        "The ID of the pool that you want to add your tape to for archiving. The tape in this pool \
         is archived in the S3 storage class that is associated with the pool. When you use your \
         backup application to eject the tape, the tape is archived directly into the storage \
         class (S3 Glacier or S3 Deep Archive) that corresponds to the pool.\n"]
  worm : boolean2 option;
      [@ocaml.doc
        "Set to [TRUE] if the tape you are creating is to be configured as a write-once-read-many \
         (WORM) tape.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to a virtual tape that has a barcode. Each \
         tag is a key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "CreateTapeWithBarcodeInput\n"]

type nonrec tape_ar_ns = tape_ar_n list [@@ocaml.doc ""]

type nonrec create_tapes_output = {
  tape_ar_ns : tape_ar_ns option;
      [@ocaml.doc
        "A list of unique Amazon Resource Names (ARNs) that represents the virtual tapes that were \
         created.\n"]
}
[@@ocaml.doc "CreateTapeOutput\n"]

type nonrec num_tapes_to_create = int [@@ocaml.doc ""]

type nonrec create_tapes_input = {
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The unique Amazon Resource Name (ARN) that represents the gateway to associate the \
         virtual tapes with. Use the [ListGateways] operation to return a list of gateways for \
         your account and Amazon Web Services Region.\n"]
  tape_size_in_bytes : tape_size;
      [@ocaml.doc
        "The size, in bytes, of the virtual tapes that you want to create.\n\n\
        \  The size must be aligned by gigabyte (1024*1024*1024 bytes).\n\
        \  \n\
        \   "]
  client_token : client_token;
      [@ocaml.doc
        "A unique identifier that you use to retry a request. If you retry a request, use the same \
         [ClientToken] you specified in the initial request.\n\n\
        \  Using the same [ClientToken] prevents creating the tape multiple times.\n\
        \  \n\
        \   "]
  num_tapes_to_create : num_tapes_to_create;
      [@ocaml.doc "The number of virtual tapes that you want to create.\n"]
  tape_barcode_prefix : tape_barcode_prefix;
      [@ocaml.doc
        "A prefix that you append to the barcode of the virtual tape you are creating. This prefix \
         makes the barcode unique.\n\n\
        \  The prefix must be 1-4 characters in length and must be one of the uppercase letters \
         from A to Z.\n\
        \  \n\
        \   "]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Set to [true] to use Amazon S3 server-side encryption with your own KMS key, or [false] \
         to use a key managed by Amazon S3. Optional.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  kms_key : kms_key option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used for Amazon \
         S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. This value \
         can only be set when [KMSEncrypted] is [true]. Optional.\n"]
  pool_id : pool_id option;
      [@ocaml.doc
        "The ID of the pool that you want to add your tape to for archiving. The tape in this pool \
         is archived in the S3 storage class that is associated with the pool. When you use your \
         backup application to eject the tape, the tape is archived directly into the storage \
         class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.\n"]
  worm : boolean2 option;
      [@ocaml.doc
        "Set to [TRUE] if the tape you are creating is to be configured as a write-once-read-many \
         (WORM) tape.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to a virtual tape. Each tag is a key-value \
         pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "CreateTapesInput\n"]

type nonrec day_of_month = int [@@ocaml.doc ""]

type nonrec delete_automatic_tape_creation_policy_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_automatic_tape_creation_policy_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_bandwidth_rate_limit_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway whose bandwidth rate \
   information was deleted.\n"]

type nonrec delete_bandwidth_rate_limit_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  bandwidth_type : bandwidth_type;
      [@ocaml.doc
        "One of the BandwidthType values that indicates the gateway bandwidth rate limit to \
         delete.\n\n\
        \ Valid Values: [UPLOAD] | [DOWNLOAD] | [ALL] \n\
        \ "]
}
[@@ocaml.doc
  "A JSON object containing the following fields:\n\n\
  \ {ul\n\
  \       {-   [DeleteBandwidthRateLimitInput$BandwidthType] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec delete_cache_report_output = {
  cache_report_ar_n : cache_report_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cache report you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cache_report_input = {
  cache_report_ar_n : cache_report_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cache report you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_chap_credentials_output = {
  target_ar_n : target_ar_n option; [@ocaml.doc "The Amazon Resource Name (ARN) of the target.\n"]
  initiator_name : iqn_name option; [@ocaml.doc "The iSCSI initiator that connects to the target.\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec delete_chap_credentials_input = {
  target_ar_n : target_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the \
         [DescribeStorediSCSIVolumes] operation to return to retrieve the TargetARN for specified \
         VolumeARN.\n"]
  initiator_name : iqn_name; [@ocaml.doc "The iSCSI initiator that connects to the target.\n"]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [DeleteChapCredentialsInput$InitiatorName] \n\
  \           \n\
  \            }\n\
  \       {-   [DeleteChapCredentialsInput$TargetARN] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec delete_file_share_output = {
  file_share_ar_n : file_share_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted file share.\n"]
}
[@@ocaml.doc "DeleteFileShareOutput\n"]

type nonrec delete_file_share_input = {
  file_share_ar_n : file_share_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the file share to be deleted.\n"]
  force_delete : boolean2 option;
      [@ocaml.doc
        "If this value is set to [true], the operation deletes a file share immediately and aborts \
         all data uploads to Amazon Web Services. Otherwise, the file share is not deleted until \
         all data is uploaded to Amazon Web Services. This process aborts the data upload process, \
         and the file share enters the [FORCE_DELETING] status.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
}
[@@ocaml.doc "DeleteFileShareInput\n"]

type nonrec delete_gateway_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the ID of the deleted gateway.\n"]

type nonrec delete_gateway_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the ID of the gateway to delete.\n"]

type nonrec delete_snapshot_schedule_output = {
  volume_ar_n : volume_ar_n option; [@ocaml.doc "The volume which snapshot schedule was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_snapshot_schedule_input = {
  volume_ar_n : volume_ar_n; [@ocaml.doc "The volume which snapshot schedule to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_tape_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted virtual tape.\n"]
}
[@@ocaml.doc "DeleteTapeOutput\n"]

type nonrec delete_tape_input = {
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The unique Amazon Resource Name (ARN) of the gateway that the virtual tape to delete is \
         associated with. Use the [ListGateways] operation to return a list of gateways for your \
         account and Amazon Web Services Region.\n"]
  tape_ar_n : tape_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the virtual tape to delete.\n"]
  bypass_governance_retention : boolean2 option;
      [@ocaml.doc
        "Set to [TRUE] to delete an archived tape that belongs to a custom pool with tape \
         retention lock. Only archived tapes with tape retention lock set to [governance] can be \
         deleted. Archived tapes with tape retention lock set to [compliance] can't be deleted.\n"]
}
[@@ocaml.doc "DeleteTapeInput\n"]

type nonrec delete_tape_archive_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape that was deleted from the virtual tape \
         shelf (VTS).\n"]
}
[@@ocaml.doc "DeleteTapeArchiveOutput\n"]

type nonrec delete_tape_archive_input = {
  tape_ar_n : tape_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape to delete from the virtual tape shelf \
         (VTS).\n"]
  bypass_governance_retention : boolean2 option;
      [@ocaml.doc
        "Set to [TRUE] to delete an archived tape that belongs to a custom pool with tape \
         retention lock. Only archived tapes with tape retention lock set to [governance] can be \
         deleted. Archived tapes with tape retention lock set to [compliance] can't be deleted.\n"]
}
[@@ocaml.doc "DeleteTapeArchiveInput\n"]

type nonrec delete_tape_pool_output = {
  pool_ar_n : pool_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the custom tape pool being deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_tape_pool_input = {
  pool_ar_n : pool_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the custom tape pool to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_volume_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the storage volume that was deleted. It is the same ARN \
         you provided in the request.\n"]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the storage volume that was deleted.\n"]

type nonrec delete_volume_input = {
  volume_ar_n : volume_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume. Use the [ListVolumes] operation to return a \
         list of gateway volumes.\n"]
}
[@@ocaml.doc "A JSON object containing the [DeleteVolumeInput$VolumeARN] to delete.\n"]

type nonrec deprecation_date = string [@@ocaml.doc ""]

type nonrec describe_availability_monitor_test_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  status : availability_monitor_test_status option;
      [@ocaml.doc
        "The status of the high availability monitoring test. If a test hasn't been performed, the \
         value of this field is null.\n"]
  start_time : time option;
      [@ocaml.doc
        "The time the high availability monitoring test was started. If a test hasn't been \
         performed, the value of this field is null.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_availability_monitor_test_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_bandwidth_rate_limit_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  average_upload_rate_limit_in_bits_per_sec : bandwidth_upload_rate_limit option;
      [@ocaml.doc
        "The average upload bandwidth rate limit in bits per second. This field does not appear in \
         the response if the upload rate limit is not set.\n"]
  average_download_rate_limit_in_bits_per_sec : bandwidth_download_rate_limit option;
      [@ocaml.doc
        "The average download bandwidth rate limit in bits per second. This field does not appear \
         in the response if the download rate limit is not set.\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec describe_bandwidth_rate_limit_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the Amazon Resource Name (ARN) of the gateway.\n"]

type nonrec describe_bandwidth_rate_limit_schedule_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  bandwidth_rate_limit_intervals : bandwidth_rate_limit_intervals option;
      [@ocaml.doc
        " An array that contains the bandwidth rate limit intervals for a tape or volume gateway. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_bandwidth_rate_limit_schedule_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec describe_cache_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  disk_ids : disk_ids option;
      [@ocaml.doc
        "An array of strings that identify disks that are to be configured as working storage. \
         Each string has a minimum length of 1 and maximum length of 300. You can get the disk IDs \
         from the [ListLocalDisks] API.\n"]
  cache_allocated_in_bytes : long option;
      [@ocaml.doc "The amount of cache in bytes allocated to a gateway.\n"]
  cache_used_percentage : double option;
      [@ocaml.doc
        "Percent use of the gateway's cache storage. This metric applies only to the \
         gateway-cached volume setup. The sample is taken at the end of the reporting period.\n"]
  cache_dirty_percentage : double option;
      [@ocaml.doc
        "The file share's contribution to the overall percentage of the gateway's cache that has \
         not been persisted to Amazon Web Services. The sample is taken at the end of the \
         reporting period.\n"]
  cache_hit_percentage : double option;
      [@ocaml.doc
        "Percent of application read operations from the file shares that are served from cache. \
         The sample is taken at the end of the reporting period.\n"]
  cache_miss_percentage : double option;
      [@ocaml.doc
        "Percent of application read operations from the file shares that are not served from \
         cache. The sample is taken at the end of the reporting period.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cache_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec describe_cache_report_output = {
  cache_report_info : cache_report_info option;
      [@ocaml.doc
        "Contains all informational fields associated with a cache report. Includes name, ARN, \
         tags, status, progress, filters, start time, and end time.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cache_report_input = {
  cache_report_ar_n : cache_report_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cache report you want to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cachedi_scsi_volumes_output = {
  cachedi_scsi_volumes : cachedi_scsi_volumes option;
      [@ocaml.doc
        "An array of objects where each object contains metadata about one cached volume.\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec volume_ar_ns = volume_ar_n list [@@ocaml.doc ""]

type nonrec describe_cachedi_scsi_volumes_input = {
  volume_ar_ns : volume_ar_ns;
      [@ocaml.doc
        "An array of strings where each string represents the Amazon Resource Name (ARN) of a \
         cached volume. All of the specified cached volumes must be from the same gateway. Use \
         [ListVolumes] to get volume ARNs for a gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_chap_credentials_output = {
  chap_credentials : chap_credentials option;
      [@ocaml.doc
        "An array of [ChapInfo] objects that represent CHAP credentials. Each object in the array \
         contains CHAP credential information for one target-initiator pair. If no CHAP \
         credentials are set, an empty array is returned. CHAP credential information is provided \
         in a JSON object with the following fields:\n\n\
        \ {ul\n\
        \       {-   {b InitiatorName}: The iSCSI initiator that connects to the target.\n\
        \           \n\
        \            }\n\
        \       {-   {b SecretToAuthenticateInitiator}: The secret key that the initiator (for \
         example, the Windows client) must provide to participate in mutual CHAP with the target.\n\
        \           \n\
        \            }\n\
        \       {-   {b SecretToAuthenticateTarget}: The secret key that the target must provide \
         to participate in mutual CHAP with the initiator (e.g. Windows client).\n\
        \           \n\
        \            }\n\
        \       {-   {b TargetARN}: The Amazon Resource Name (ARN) of the storage volume.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec describe_chap_credentials_input = {
  target_ar_n : target_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the \
         [DescribeStorediSCSIVolumes] operation to return to retrieve the TargetARN for specified \
         VolumeARN.\n"]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the iSCSI volume target.\n"]

type nonrec file_system_association_sync_error_code = string [@@ocaml.doc ""]

type nonrec file_system_association_status_detail = {
  error_code : file_system_association_sync_error_code option;
      [@ocaml.doc "The error code for a given file system association status.\n"]
}
[@@ocaml.doc "Detailed information on file system association status.\n"]

type nonrec file_system_association_status_details = file_system_association_status_detail list
[@@ocaml.doc ""]

type nonrec file_system_association_status = string [@@ocaml.doc ""]

type nonrec file_system_association_info = {
  file_system_association_ar_n : file_system_association_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the file system association.\n"]
  location_ar_n : file_system_location_ar_n option;
      [@ocaml.doc
        "The ARN of the backend Amazon FSx file system used for storing file data. For \
         information, see \
         {{:https://docs.aws.amazon.com/fsx/latest/APIReference/API_FileSystem.html}FileSystem} in \
         the {i Amazon FSx API Reference}.\n"]
  file_system_association_status : file_system_association_status option;
      [@ocaml.doc
        "The status of the file system association. Valid Values: [AVAILABLE] | [CREATING] | \
         [DELETING] | [FORCE_DELETING] | [UPDATING] | [ERROR] \n"]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for the audit logs.\n"]
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags assigned to the SMB file share, sorted alphabetically by key \
         name. Each tag is a key-value pair.\n"]
  cache_attributes : cache_attributes option; [@ocaml.doc ""]
  endpoint_network_configuration : endpoint_network_configuration option;
      [@ocaml.doc
        "Specifies network configuration information for the gateway associated with the Amazon \
         FSx file system.\n\n\
        \  If multiple file systems are associated with this gateway, this parameter's \
         [IpAddresses] field is required.\n\
        \  \n\
        \   "]
  file_system_association_status_details : file_system_association_status_details option;
      [@ocaml.doc
        "An array containing the FileSystemAssociationStatusDetail data type, which provides \
         detailed information on file system association status.\n"]
}
[@@ocaml.doc
  "Describes the object returned by [DescribeFileSystemAssociations] that describes a created file \
   system association.\n"]

type nonrec file_system_association_info_list = file_system_association_info list [@@ocaml.doc ""]

type nonrec describe_file_system_associations_output = {
  file_system_association_info_list : file_system_association_info_list option;
      [@ocaml.doc
        "An array containing the [FileSystemAssociationInfo] data type of each file system \
         association to be described. \n"]
}
[@@ocaml.doc ""]

type nonrec file_system_association_arn_list = file_system_association_ar_n list [@@ocaml.doc ""]

type nonrec describe_file_system_associations_input = {
  file_system_association_arn_list : file_system_association_arn_list;
      [@ocaml.doc
        "An array containing the Amazon Resource Name (ARN) of each file system association to be \
         described.\n"]
}
[@@ocaml.doc ""]

type nonrec software_version = string [@@ocaml.doc ""]

type nonrec host_environment_id = string [@@ocaml.doc ""]

type nonrec gateway_capacity =
  | Small [@ocaml.doc ""]
  | Medium [@ocaml.doc ""]
  | Large [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec supported_gateway_capacities = gateway_capacity list [@@ocaml.doc ""]

type nonrec software_updates_end_date = string [@@ocaml.doc ""]

type nonrec endpoint_type = string [@@ocaml.doc ""]

type nonrec host_environment =
  | VMWARE [@ocaml.doc ""]
  | HYPER_V [@ocaml.doc ""]
  | EC2 [@ocaml.doc ""]
  | KVM [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | SNOWBALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ec2_instance_region = string [@@ocaml.doc ""]

type nonrec ec2_instance_id = string [@@ocaml.doc ""]

type nonrec last_software_update = string [@@ocaml.doc ""]

type nonrec next_update_availability_date = string [@@ocaml.doc ""]

type nonrec network_interface = {
  ipv4_address : string_ option;
      [@ocaml.doc "The Internet Protocol version 4 (IPv4) address of the interface.\n"]
  mac_address : string_ option;
      [@ocaml.doc
        "The Media Access Control (MAC) address of the interface.\n\n\
        \  This is currently unsupported and will not be returned in output.\n\
        \  \n\
        \   "]
  ipv6_address : string_ option;
      [@ocaml.doc
        "The Internet Protocol version 6 (IPv6) address of the interface.\n\n\
        \  This element returns IPv6 addresses for all gateway types except FSx File Gateway.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "Describes a gateway's network interface.\n"]

type nonrec gateway_network_interfaces = network_interface list [@@ocaml.doc ""]

type nonrec gateway_state = string [@@ocaml.doc ""]

type nonrec gateway_id = string [@@ocaml.doc ""]

type nonrec describe_gateway_information_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  gateway_id : gateway_id option;
      [@ocaml.doc
        "The unique identifier assigned to your gateway during activation. This ID becomes part of \
         the gateway Amazon Resource Name (ARN), which you use as input for other operations.\n"]
  gateway_name : string_ option; [@ocaml.doc "The name you configured for your gateway.\n"]
  gateway_timezone : gateway_timezone option;
      [@ocaml.doc "A value that indicates the time zone configured for the gateway.\n"]
  gateway_state : gateway_state option;
      [@ocaml.doc "A value that indicates the operating state of the gateway.\n"]
  gateway_network_interfaces : gateway_network_interfaces option;
      [@ocaml.doc
        "A [NetworkInterface] array that contains descriptions of the gateway network interfaces.\n"]
  gateway_type : gateway_type option;
      [@ocaml.doc
        "The type of the gateway.\n\n\
        \  Amazon FSx File Gateway is no longer available to new customers. Existing customers of \
         FSx File Gateway can continue to use the service normally. For capabilities similar to \
         FSx File Gateway, visit \
         {{:https://aws.amazon.com/blogs/storage/switch-your-file-share-access-from-amazon-fsx-file-gateway-to-amazon-fsx-for-windows-file-server/}this \
         blog post}.\n\
        \  \n\
        \   "]
  next_update_availability_date : next_update_availability_date option;
      [@ocaml.doc
        "The date on which an update to the gateway is available. This date is in the time zone of \
         the gateway. If the gateway is not available for an update this field is not returned in \
         the response.\n"]
  last_software_update : last_software_update option;
      [@ocaml.doc
        "The date on which the last software update was applied to the gateway. If the gateway has \
         never been updated, this field does not return a value in the response. This only only \
         exist and returns once it have been chosen and set by the SGW service, based on the OS \
         version of the gateway VM\n"]
  ec2_instance_id : ec2_instance_id option;
      [@ocaml.doc "The ID of the Amazon EC2 instance that was used to launch the gateway.\n"]
  ec2_instance_region : ec2_instance_region option;
      [@ocaml.doc "The Amazon Web Services Region where the Amazon EC2 instance is located.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags assigned to the gateway, sorted alphabetically by key name. Each \
         tag is a key-value pair. For a gateway with more than 10 tags assigned, you can view all \
         tags using the [ListTagsForResource] API operation.\n"]
  vpc_endpoint : string_ option;
      [@ocaml.doc
        "The configuration settings for the virtual private cloud (VPC) endpoint for your gateway.\n"]
  cloud_watch_log_group_ar_n : cloud_watch_log_group_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is used to monitor \
         events in the gateway. This field only only exist and returns once it have been chosen \
         and set by the SGW service, based on the OS version of the gateway VM\n"]
  host_environment : host_environment option;
      [@ocaml.doc
        "The type of hardware or software platform on which the gateway is running.\n\n\
        \  Tape Gateway is no longer available on Snow Family devices.\n\
        \  \n\
        \   "]
  endpoint_type : endpoint_type option;
      [@ocaml.doc
        "The type of endpoint for your gateway.\n\n Valid Values: [STANDARD] | [FIPS] \n "]
  software_updates_end_date : software_updates_end_date option;
      [@ocaml.doc
        "Date after which this gateway will not receive software updates for new features.\n"]
  deprecation_date : deprecation_date option;
      [@ocaml.doc
        "Date after which this gateway will not receive software updates for new features and bug \
         fixes.\n"]
  gateway_capacity : gateway_capacity option;
      [@ocaml.doc "Specifies the size of the gateway's metadata cache.\n"]
  supported_gateway_capacities : supported_gateway_capacities option;
      [@ocaml.doc
        "A list of the metadata cache sizes that the gateway can support based on its current \
         hardware specifications.\n"]
  host_environment_id : host_environment_id option;
      [@ocaml.doc
        "A unique identifier for the specific instance of the host platform running the gateway. \
         This value is only available for certain host environments, and its format depends on the \
         host environment type.\n"]
  software_version : software_version option;
      [@ocaml.doc "The version number of the software running on the gateway appliance.\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec describe_gateway_information_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the ID of the gateway.\n"]

type nonrec software_update_preferences = {
  automatic_update_policy : automatic_update_policy option;
      [@ocaml.doc
        "Indicates the automatic update policy for a gateway.\n\n\
        \  [ALL_VERSIONS] - Enables regular gateway maintenance updates.\n\
        \ \n\
        \   [EMERGENCY_VERSIONS_ONLY] - Disables regular gateway maintenance updates. The gateway \
         will still receive emergency version updates on rare occasions if necessary to remedy \
         highly critical security or durability issues. You will be notified before an emergency \
         version update is applied. These updates are applied during your gateway's scheduled \
         maintenance window.\n\
        \  "]
}
[@@ocaml.doc "A set of variables indicating the software update preferences for the gateway.\n"]

type nonrec describe_maintenance_start_time_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  hour_of_day : hour_of_day option;
      [@ocaml.doc
        "The hour component of the maintenance start time represented as {i hh}, where {i hh} is \
         the hour (0 to 23). The hour of the day is in the time zone of the gateway.\n"]
  minute_of_hour : minute_of_hour option;
      [@ocaml.doc
        "The minute component of the maintenance start time represented as {i mm}, where {i mm} is \
         the minute (0 to 59). The minute of the hour is in the time zone of the gateway.\n"]
  day_of_week : day_of_week option;
      [@ocaml.doc
        "An ordinal number between 0 and 6 that represents the day of the week, where 0 represents \
         Sunday and 6 represents Saturday. The day of week is in the time zone of the gateway.\n"]
  day_of_month : day_of_month option;
      [@ocaml.doc
        "The day of the month component of the maintenance start time represented as an ordinal \
         number from 1 to 28, where 1 represents the first day of the month. It is not possible to \
         set the maintenance schedule to start on days 29 through 31.\n"]
  timezone : gateway_timezone option;
      [@ocaml.doc
        "A value that indicates the time zone that is set for the gateway. The start time and day \
         of week specified should be in the time zone of the gateway.\n"]
  software_update_preferences : software_update_preferences option;
      [@ocaml.doc
        "A set of variables indicating the software update preferences for the gateway.\n\n\
        \ Includes [AutomaticUpdatePolicy] parameter with the following inputs:\n\
        \ \n\
        \   [ALL_VERSIONS] - Enables regular gateway maintenance updates.\n\
        \  \n\
        \    [EMERGENCY_VERSIONS_ONLY] - Disables regular gateway maintenance updates. The gateway \
         will still receive emergency version updates on rare occasions if necessary to remedy \
         highly critical security or durability issues. You will be notified before an emergency \
         version update is applied. These updates are applied during your gateway's scheduled \
         maintenance window.\n\
        \   "]
}
[@@ocaml.doc
  "A JSON object containing the following fields:\n\n\
  \ {ul\n\
  \       {-   [DescribeMaintenanceStartTimeOutput$SoftwareUpdatePreferences] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeMaintenanceStartTimeOutput$DayOfMonth] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeMaintenanceStartTimeOutput$DayOfWeek] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeMaintenanceStartTimeOutput$HourOfDay] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeMaintenanceStartTimeOutput$MinuteOfHour] \n\
  \           \n\
  \            }\n\
  \       {-   [DescribeMaintenanceStartTimeOutput$Timezone] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec describe_maintenance_start_time_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the Amazon Resource Name (ARN) of the gateway.\n"]

type nonrec path = string [@@ocaml.doc ""]

type nonrec file_share_status = string [@@ocaml.doc ""]

type nonrec file_share_id = string [@@ocaml.doc ""]

type nonrec nfs_file_share_info = {
  nfs_file_share_defaults : nfs_file_share_defaults option; [@ocaml.doc ""]
  file_share_ar_n : file_share_ar_n option; [@ocaml.doc ""]
  file_share_id : file_share_id option; [@ocaml.doc ""]
  file_share_status : file_share_status option; [@ocaml.doc ""]
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  encryption_type : encryption_type option;
      [@ocaml.doc
        "A value that specifies the type of server-side encryption that the file share will use \
         for the data that it stores in Amazon S3.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \    "]
  kms_encrypted : boolean2 option;
      [@ocaml.doc
        "Optional. Set to [true] to use Amazon S3 server-side encryption with your own KMS key \
         (SSE-KMS), or [false] to use a key managed by Amazon S3 (SSE-S3). To use dual-layer \
         encryption (DSSE-KMS), set the [EncryptionType] parameter instead.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \     Valid Values: [true] | [false] \n\
        \     "]
  kms_key : kms_key option; [@ocaml.doc ""]
  path : path option; [@ocaml.doc ""]
  role : role option; [@ocaml.doc ""]
  location_ar_n : location_ar_n option; [@ocaml.doc ""]
  default_storage_class : storage_class option;
      [@ocaml.doc
        "The default storage class for objects put into an Amazon S3 bucket by the S3 File \
         Gateway. The default value is [S3_STANDARD]. Optional.\n\n\
        \ Valid Values: [S3_STANDARD] | [S3_INTELLIGENT_TIERING] | [S3_STANDARD_IA] | \
         [S3_ONEZONE_IA] \n\
        \ "]
  object_ac_l : object_ac_l option; [@ocaml.doc ""]
  client_list : file_share_client_list option; [@ocaml.doc ""]
  squash : squash option; [@ocaml.doc ""]
  read_only : boolean_ option;
      [@ocaml.doc
        "A value that sets the write status of a file share. Set this value to [true] to set the \
         write status to read-only, otherwise set to [false].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  guess_mime_type_enabled : boolean_ option;
      [@ocaml.doc
        "A value that enables guessing of the MIME type for uploaded objects based on file \
         extensions. Set this value to [true] to enable MIME type guessing, otherwise set to \
         [false]. The default value is [true].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  requester_pays : boolean_ option;
      [@ocaml.doc
        "A value that sets who pays the cost of the request and the cost associated with data \
         download from the S3 bucket. If this value is set to [true], the requester pays the \
         costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the \
         cost of storing data.\n\n\
        \   [RequesterPays] is a configuration for the S3 bucket that backs the file share, so \
         make sure that the configuration on the file share is the same as the S3 bucket \
         configuration.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags assigned to the NFS file share, sorted alphabetically by key \
         name. Each tag is a key-value pair. For a gateway with more than 10 tags assigned, you \
         can view all tags using the [ListTagsForResource] API operation.\n"]
  file_share_name : file_share_name option;
      [@ocaml.doc
        "The name of the file share. Optional.\n\n\
        \   [FileShareName] must be set if an S3 prefix name is set in [LocationARN], or if an \
         access point or access point alias is used.\n\
        \  \n\
        \   "]
  cache_attributes : cache_attributes option;
      [@ocaml.doc "Refresh cache information for the file share.\n"]
  notification_policy : notification_policy option;
      [@ocaml.doc
        "The notification policy of the file share. [SettlingTimeInSeconds] controls the number of \
         seconds to wait after the last point in time a client wrote to a file before generating \
         an [ObjectUploaded] notification. Because clients can make many small writes to files, \
         it's best to set this parameter for as long as possible to avoid generating multiple \
         notifications for the same file in a small time period.\n\n\
        \   [SettlingTimeInSeconds] has no effect on the timing of the object uploading to Amazon \
         S3, only the timing of the notification.\n\
        \  \n\
        \   This setting is not meant to specify an exact time at which the notification will be \
         sent. In some cases, the gateway might require more than the specified delay time to \
         generate and send notifications.\n\
        \   \n\
        \     The following example sets [NotificationPolicy] on with [SettlingTimeInSeconds] set \
         to 60.\n\
        \     \n\
        \       [{\\\"Upload\\\": {\\\"SettlingTimeInSeconds\\\": 60}}] \n\
        \      \n\
        \       The following example sets [NotificationPolicy] off.\n\
        \       \n\
        \         [{}] \n\
        \        "]
  vpc_endpoint_dns_name : dns_host_name option;
      [@ocaml.doc
        "Specifies the DNS name for the VPC endpoint that the NFS file share uses to connect to \
         Amazon S3.\n\n\
        \  This parameter is required for NFS file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  bucket_region : region_id option;
      [@ocaml.doc
        "Specifies the Region of the S3 bucket where the NFS file share stores files.\n\n\
        \  This parameter is required for NFS file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for audit logs.\n"]
}
[@@ocaml.doc
  "The Unix file permissions and ownership information assigned, by default, to native S3 objects \
   when an S3 File Gateway discovers them in S3 buckets. This operation is only supported in S3 \
   File Gateways.\n"]

type nonrec nfs_file_share_info_list = nfs_file_share_info list [@@ocaml.doc ""]

type nonrec describe_nfs_file_shares_output = {
  nfs_file_share_info_list : nfs_file_share_info_list option;
      [@ocaml.doc "An array containing a description for each requested file share.\n"]
}
[@@ocaml.doc "DescribeNFSFileSharesOutput\n"]

type nonrec file_share_arn_list = file_share_ar_n list [@@ocaml.doc ""]

type nonrec describe_nfs_file_shares_input = {
  file_share_arn_list : file_share_arn_list;
      [@ocaml.doc
        "An array containing the Amazon Resource Name (ARN) of each file share to be described.\n"]
}
[@@ocaml.doc "DescribeNFSFileSharesInput\n"]

type nonrec smb_file_share_info = {
  file_share_ar_n : file_share_ar_n option; [@ocaml.doc ""]
  file_share_id : file_share_id option; [@ocaml.doc ""]
  file_share_status : file_share_status option; [@ocaml.doc ""]
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  encryption_type : encryption_type option;
      [@ocaml.doc
        "A value that specifies the type of server-side encryption that the file share will use \
         for the data that it stores in Amazon S3.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \    "]
  kms_encrypted : boolean2 option;
      [@ocaml.doc
        "Optional. Set to [true] to use Amazon S3 server-side encryption with your own KMS key \
         (SSE-KMS), or [false] to use a key managed by Amazon S3 (SSE-S3). To use dual-layer \
         encryption (DSSE-KMS), set the [EncryptionType] parameter instead.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \     Valid Values: [true] | [false] \n\
        \     "]
  kms_key : kms_key option; [@ocaml.doc ""]
  path : path option;
      [@ocaml.doc "The file share path used by the SMB client to identify the mount point.\n"]
  role : role option; [@ocaml.doc ""]
  location_ar_n : location_ar_n option; [@ocaml.doc ""]
  default_storage_class : storage_class option;
      [@ocaml.doc
        "The default storage class for objects put into an Amazon S3 bucket by the S3 File \
         Gateway. The default value is [S3_STANDARD]. Optional.\n\n\
        \ Valid Values: [S3_STANDARD] | [S3_INTELLIGENT_TIERING] | [S3_STANDARD_IA] | \
         [S3_ONEZONE_IA] \n\
        \ "]
  object_ac_l : object_ac_l option; [@ocaml.doc ""]
  read_only : boolean_ option;
      [@ocaml.doc
        "A value that sets the write status of a file share. Set this value to [true] to set the \
         write status to read-only, otherwise set to [false].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  guess_mime_type_enabled : boolean_ option;
      [@ocaml.doc
        "A value that enables guessing of the MIME type for uploaded objects based on file \
         extensions. Set this value to [true] to enable MIME type guessing, otherwise set to \
         [false]. The default value is [true].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  requester_pays : boolean_ option;
      [@ocaml.doc
        "A value that sets who pays the cost of the request and the cost associated with data \
         download from the S3 bucket. If this value is set to [true], the requester pays the \
         costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the \
         cost of storing data.\n\n\
        \   [RequesterPays] is a configuration for the S3 bucket that backs the file share, so \
         make sure that the configuration on the file share is the same as the S3 bucket \
         configuration.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
  smbacl_enabled : boolean_ option;
      [@ocaml.doc
        "If this value is set to [true], it indicates that access control list (ACL) is enabled on \
         the SMB file share. If it is set to [false], it indicates that file and directory \
         permissions are mapped to the POSIX permission.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/filegateway/latest/files3/smb-acl.html}Using Windows ACLs \
         to limit SMB file share access} in the {i Amazon S3 File Gateway User Guide}.\n\
        \ "]
  access_based_enumeration : boolean_ option;
      [@ocaml.doc "Indicates whether [AccessBasedEnumeration] is enabled.\n"]
  admin_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that have administrator rights to the \
         file share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  valid_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that are allowed to access the file \
         share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  invalid_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that are not allowed to access the file \
         share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for audit logs.\n"]
  authentication : authentication option; [@ocaml.doc ""]
  case_sensitivity : case_sensitivity option;
      [@ocaml.doc
        "The case of an object name in an Amazon S3 bucket. For [ClientSpecified], the client \
         determines the case sensitivity. For [CaseSensitive], the gateway determines the case \
         sensitivity. The default value is [ClientSpecified].\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags assigned to the SMB file share, sorted alphabetically by key \
         name. Each tag is a key-value pair. For a gateway with more than 10 tags assigned, you \
         can view all tags using the [ListTagsForResource] API operation.\n"]
  file_share_name : file_share_name option;
      [@ocaml.doc
        "The name of the file share. Optional.\n\n\
        \   [FileShareName] must be set if an S3 prefix name is set in [LocationARN], or if an \
         access point or access point alias is used.\n\
        \  \n\
        \   "]
  cache_attributes : cache_attributes option;
      [@ocaml.doc "Refresh cache information for the file share.\n"]
  notification_policy : notification_policy option;
      [@ocaml.doc
        "The notification policy of the file share. [SettlingTimeInSeconds] controls the number of \
         seconds to wait after the last point in time a client wrote to a file before generating \
         an [ObjectUploaded] notification. Because clients can make many small writes to files, \
         it's best to set this parameter for as long as possible to avoid generating multiple \
         notifications for the same file in a small time period.\n\n\
        \   [SettlingTimeInSeconds] has no effect on the timing of the object uploading to Amazon \
         S3, only the timing of the notification.\n\
        \  \n\
        \   This setting is not meant to specify an exact time at which the notification will be \
         sent. In some cases, the gateway might require more than the specified delay time to \
         generate and send notifications.\n\
        \   \n\
        \     The following example sets [NotificationPolicy] on with [SettlingTimeInSeconds] set \
         to 60.\n\
        \     \n\
        \       [{\\\"Upload\\\": {\\\"SettlingTimeInSeconds\\\": 60}}] \n\
        \      \n\
        \       The following example sets [NotificationPolicy] off.\n\
        \       \n\
        \         [{}] \n\
        \        "]
  vpc_endpoint_dns_name : dns_host_name option;
      [@ocaml.doc
        "Specifies the DNS name for the VPC endpoint that the SMB file share uses to connect to \
         Amazon S3.\n\n\
        \  This parameter is required for SMB file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  bucket_region : region_id option;
      [@ocaml.doc
        "Specifies the Region of the S3 bucket where the SMB file share stores files.\n\n\
        \  This parameter is required for SMB file shares that connect to Amazon S3 through a VPC \
         endpoint, a VPC access point, or an access point alias that points to a VPC access point.\n\
        \  \n\
        \   "]
  oplocks_enabled : boolean_ option;
      [@ocaml.doc
        "Specifies whether opportunistic locking is enabled for the SMB file share.\n\n\
        \  Enabling opportunistic locking on case-sensitive shares is not recommended for \
         workloads that involve access to files with the same name in different case.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
}
[@@ocaml.doc
  "The Windows file permissions and ownership information assigned, by default, to native S3 \
   objects when S3 File Gateway discovers them in S3 buckets. This operation is only supported for \
   S3 File Gateways.\n"]

type nonrec smb_file_share_info_list = smb_file_share_info list [@@ocaml.doc ""]

type nonrec describe_smb_file_shares_output = {
  smb_file_share_info_list : smb_file_share_info_list option;
      [@ocaml.doc "An array containing a description for each requested file share.\n"]
}
[@@ocaml.doc "DescribeSMBFileSharesOutput\n"]

type nonrec describe_smb_file_shares_input = {
  file_share_arn_list : file_share_arn_list;
      [@ocaml.doc
        "An array containing the Amazon Resource Name (ARN) of each file share to be described.\n"]
}
[@@ocaml.doc "DescribeSMBFileSharesInput\n"]

type nonrec smb_local_groups = {
  gateway_admins : user_list option;
      [@ocaml.doc
        "A list of Active Directory users and groups that have local Gateway Admin permissions. \
         Acceptable formats include: [DOMAIN\\User1], [user1], [DOMAIN\\group1], and [group1].\n\n\
        \ Gateway Admins can use the Shared Folders Microsoft Management Console snap-in to \
         force-close files that are open and locked.\n\
        \ "]
}
[@@ocaml.doc
  "A list of Active Directory users and groups that have special permissions for SMB file shares \
   on the gateway.\n"]

type nonrec smb_security_strategy =
  | ClientSpecified [@ocaml.doc ""]
  | MandatorySigning [@ocaml.doc ""]
  | MandatoryEncryption [@ocaml.doc ""]
  | MandatoryEncryptionNoAes128 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec describe_smb_settings_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  domain_name : domain_name option;
      [@ocaml.doc "The name of the domain that the gateway is joined to.\n"]
  active_directory_status : active_directory_status option;
      [@ocaml.doc
        "Indicates the status of a gateway that is a member of the Active Directory domain.\n\n\
        \  This field is only used as part of a [JoinDomain] request. It is not affected by Active \
         Directory connectivity changes that occur after the [JoinDomain] request succeeds.\n\
        \  \n\
        \    {ul\n\
        \          {-   [ACCESS_DENIED]: Indicates that the [JoinDomain] operation failed due to \
         an authentication error.\n\
        \              \n\
        \               }\n\
        \          {-   [DETACHED]: Indicates that gateway is not joined to a domain.\n\
        \              \n\
        \               }\n\
        \          {-   [JOINED]: Indicates that the gateway has successfully joined a domain.\n\
        \              \n\
        \               }\n\
        \          {-   [JOINING]: Indicates that a [JoinDomain] operation is in progress.\n\
        \              \n\
        \               }\n\
        \          {-   [NETWORK_ERROR]: Indicates that [JoinDomain] operation failed due to a \
         network or connectivity error.\n\
        \              \n\
        \               }\n\
        \          {-   [TIMEOUT]: Indicates that the [JoinDomain] operation failed because the \
         operation didn't complete within the allotted time.\n\
        \              \n\
        \               }\n\
        \          {-   [UNKNOWN_ERROR]: Indicates that the [JoinDomain] operation failed due to \
         another type of error.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  smb_guest_password_set : boolean_ option;
      [@ocaml.doc
        "This value is [true] if a password for the guest user [smbguest] is set, otherwise \
         [false]. Only supported for S3 File Gateways.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  smb_security_strategy : smb_security_strategy option;
      [@ocaml.doc
        "The type of security strategy that was specified for file gateway.\n\n\
        \ {ul\n\
        \       {-   [ClientSpecified]: If you choose this option, requests are established based \
         on what is negotiated by the client. This option is recommended when you want to maximize \
         compatibility across different clients in your environment. Supported only for S3 File \
         Gateway.\n\
        \           \n\
        \            }\n\
        \       {-   [MandatorySigning]: If you choose this option, File Gateway only allows \
         connections from SMBv2 or SMBv3 clients that have signing turned on. This option works \
         with SMB clients on Microsoft Windows Vista, Windows Server 2008, or later. \n\
        \           \n\
        \            }\n\
        \       {-   [MandatoryEncryption]: If you choose this option, File Gateway only allows \
         connections from SMBv3 clients that have encryption turned on. Both 256-bit and 128-bit \
         algorithms are allowed. This option is recommended for environments that handle sensitive \
         data. It works with SMB clients on Microsoft Windows 8, Windows Server 2012, or later.\n\
        \           \n\
        \            }\n\
        \       {-   [MandatoryEncryptionNoAes128]: If you choose this option, File Gateway only \
         allows connections from SMBv3 clients that use 256-bit AES encryption algorithms. 128-bit \
         algorithms are not allowed. This option is recommended for environments that handle \
         sensitive data. It works with SMB clients on Microsoft Windows 8, Windows Server 2012, or \
         later.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  file_shares_visible : boolean_ option;
      [@ocaml.doc
        "The shares on this gateway appear when listing shares. Only supported for S3 File \
         Gateways. \n"]
  smb_local_groups : smb_local_groups option;
      [@ocaml.doc
        "A list of Active Directory users and groups that have special permissions for SMB file \
         shares on the gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_smb_settings_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec recurrence_in_hours = int [@@ocaml.doc ""]

type nonrec describe_snapshot_schedule_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume that was specified in the request.\n"]
  start_at : hour_of_day option;
      [@ocaml.doc
        "The hour of the day at which the snapshot schedule begins represented as {i hh}, where {i \
         hh} is the hour (0 to 23). The hour of the day is in the time zone of the gateway.\n"]
  recurrence_in_hours : recurrence_in_hours option;
      [@ocaml.doc "The number of hours between snapshots.\n"]
  description : description option; [@ocaml.doc "The snapshot description.\n"]
  timezone : gateway_timezone option;
      [@ocaml.doc "A value that indicates the time zone of the gateway.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags assigned to the snapshot schedule, sorted alphabetically by key \
         name. Each tag is a key-value pair. For a gateway with more than 10 tags assigned, you \
         can view all tags using the [ListTagsForResource] API operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_snapshot_schedule_input = {
  volume_ar_n : volume_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume. Use the [ListVolumes] operation to return a \
         list of gateway volumes.\n"]
}
[@@ocaml.doc
  "A JSON object containing the [DescribeSnapshotScheduleInput$VolumeARN] of the volume.\n"]

type nonrec storedi_scsi_volume = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage volume.\n"]
  volume_id : volume_id option;
      [@ocaml.doc "The unique identifier of the volume, e.g., vol-AE4B946D.\n"]
  volume_type : volume_type option;
      [@ocaml.doc "One of the VolumeType enumeration values describing the type of the volume.\n"]
  volume_status : volume_status option;
      [@ocaml.doc
        "One of the VolumeStatus values that indicates the state of the storage volume.\n"]
  volume_attachment_status : volume_attachment_status option;
      [@ocaml.doc
        "A value that indicates whether a storage volume is attached to, detached from, or is in \
         the process of detaching from a gateway. For more information, see \
         {{:https://docs.aws.amazon.com/storagegateway/latest/userguide/managing-volumes.html#attach-detach-volume}Moving \
         your volumes to a different gateway}.\n"]
  volume_size_in_bytes : long option; [@ocaml.doc "The size of the volume in bytes.\n"]
  volume_progress : double_object option;
      [@ocaml.doc
        "Represents the percentage complete if the volume is restoring or bootstrapping that \
         represents the percent of data transferred. This field does not appear in the response if \
         the stored volume is not restoring or bootstrapping.\n"]
  volume_disk_id : disk_id option;
      [@ocaml.doc
        "The ID of the local disk that was specified in the [CreateStorediSCSIVolume] operation.\n"]
  source_snapshot_id : snapshot_id option;
      [@ocaml.doc
        "If the stored volume was created from a snapshot, this field contains the snapshot ID \
         used, e.g. snap-78e22663. Otherwise, this field is not included.\n"]
  preserved_existing_data : boolean2 option;
      [@ocaml.doc
        "Indicates if when the stored volume was created, existing data on the underlying local \
         disk was preserved.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  volumei_scsi_attributes : volumei_scsi_attributes option;
      [@ocaml.doc
        "An [VolumeiSCSIAttributes] object that represents a collection of iSCSI attributes for \
         one stored volume.\n"]
  created_date : created_date option;
      [@ocaml.doc
        "The date the volume was created. Volumes created prior to March 28, 2017 don\226\128\153t \
         have this timestamp.\n"]
  volume_used_in_bytes : volume_used_in_bytes option;
      [@ocaml.doc
        "The size of the data stored on the volume in bytes. This value is calculated based on the \
         number of blocks that are touched, instead of the actual amount of data written. This \
         value can be useful for sequential write patterns but less accurate for random write \
         patterns. [VolumeUsedInBytes] is different from the compressed size of the volume, which \
         is the value that is used to calculate your bill.\n\n\
        \  This value is not available for volumes created prior to May 13, 2015, until you store \
         data on the volume.\n\
        \  \n\
        \   "]
  kms_key : kms_key option; [@ocaml.doc ""]
  target_name : target_name option;
      [@ocaml.doc
        "The name of the iSCSI target used by an initiator to connect to a volume and used as a \
         suffix for the target ARN. For example, specifying [TargetName] as {i myvolume} results \
         in the target ARN of \
         [arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/target/iqn.1997-05.com.amazon:myvolume]. \
         The target name must be unique across all volumes on a gateway.\n\n\
        \ If you don't specify a value, Storage Gateway uses the value that was previously used \
         for this volume as the new target name.\n\
        \ "]
}
[@@ocaml.doc "Describes an iSCSI stored volume.\n"]

type nonrec storedi_scsi_volumes = storedi_scsi_volume list [@@ocaml.doc ""]

type nonrec describe_storedi_scsi_volumes_output = {
  storedi_scsi_volumes : storedi_scsi_volumes option;
      [@ocaml.doc
        "Describes a single unit of output from [DescribeStorediSCSIVolumes]. The following fields \
         are returned:\n\n\
        \ {ul\n\
        \       {-   [ChapEnabled]: Indicates whether mutual CHAP is enabled for the iSCSI target.\n\
        \           \n\
        \            }\n\
        \       {-   [LunNumber]: The logical disk number.\n\
        \           \n\
        \            }\n\
        \       {-   [NetworkInterfaceId]: The network interface ID of the stored volume that \
         initiator use to map the stored volume as an iSCSI target.\n\
        \           \n\
        \            }\n\
        \       {-   [NetworkInterfacePort]: The port used to communicate with iSCSI targets.\n\
        \           \n\
        \            }\n\
        \       {-   [PreservedExistingData]: Indicates when the stored volume was created, \
         existing data on the underlying local disk was preserved.\n\
        \           \n\
        \            }\n\
        \       {-   [SourceSnapshotId]: If the stored volume was created from a snapshot, this \
         field contains the snapshot ID used, e.g. [snap-1122aabb]. Otherwise, this field is not \
         included.\n\
        \           \n\
        \            }\n\
        \       {-   [StorediSCSIVolumes]: An array of StorediSCSIVolume objects where each object \
         contains metadata about one stored volume.\n\
        \           \n\
        \            }\n\
        \       {-   [TargetARN]: The Amazon Resource Name (ARN) of the volume target.\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeARN]: The Amazon Resource Name (ARN) of the stored volume.\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeDiskId]: The disk ID of the local disk that was specified in the \
         [CreateStorediSCSIVolume] operation.\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeId]: The unique identifier of the storage volume, e.g. [vol-1122AABB].\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeiSCSIAttributes]: An [VolumeiSCSIAttributes] object that represents a \
         collection of iSCSI attributes for one stored volume.\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeProgress]: Represents the percentage complete if the volume is \
         restoring or bootstrapping that represents the percent of data transferred. This field \
         does not appear in the response if the stored volume is not restoring or bootstrapping.\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeSizeInBytes]: The size of the volume in bytes.\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeStatus]: One of the [VolumeStatus] values that indicates the state of \
         the volume.\n\
        \           \n\
        \            }\n\
        \       {-   [VolumeType]: One of the enumeration values describing the type of the \
         volume. Currently, only [STORED] volumes are supported.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_storedi_scsi_volumes_input = {
  volume_ar_ns : volume_ar_ns;
      [@ocaml.doc
        "An array of strings where each string represents the Amazon Resource Name (ARN) of a \
         stored volume. All of the specified stored volumes must be from the same gateway. Use \
         [ListVolumes] to get volume ARNs for a gateway.\n"]
}
[@@ocaml.doc "A JSON object containing a list of [DescribeStorediSCSIVolumesInput$VolumeARNs].\n"]

type nonrec marker = string [@@ocaml.doc ""]

type nonrec tape_usage = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec tape_archive_status = string [@@ocaml.doc ""]

type nonrec tape_archive = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of an archived virtual tape.\n"]
  tape_barcode : tape_barcode option;
      [@ocaml.doc "The barcode that identifies the archived virtual tape.\n"]
  tape_created_date : time option; [@ocaml.doc "The date the virtual tape was created.\n"]
  tape_size_in_bytes : tape_size option;
      [@ocaml.doc "The size, in bytes, of the archived virtual tape.\n"]
  completion_time : time option;
      [@ocaml.doc
        "The time that the archiving of the virtual tape was completed.\n\n\
        \ The default timestamp format is in the ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.\n\
        \ "]
  retrieved_to : gateway_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the tape gateway that the virtual tape is being \
         retrieved to.\n\n\
        \ The virtual tape is retrieved from the virtual tape shelf (VTS).\n\
        \ "]
  tape_status : tape_archive_status option;
      [@ocaml.doc "The current state of the archived virtual tape.\n"]
  tape_used_in_bytes : tape_usage option;
      [@ocaml.doc
        "The size, in bytes, of data stored on the virtual tape.\n\n\
        \  This value is not available for tapes created prior to May 13, 2015.\n\
        \  \n\
        \   "]
  kms_key : kms_key option; [@ocaml.doc ""]
  pool_id : pool_id option;
      [@ocaml.doc
        "The ID of the pool that was used to archive the tape. The tapes in this pool are archived \
         in the S3 storage class that is associated with the pool.\n"]
  worm : boolean2 option;
      [@ocaml.doc "Set to [true] if the archived tape is stored as write-once-read-many (WORM).\n"]
  retention_start_date : time option;
      [@ocaml.doc
        "If the archived tape is subject to tape retention lock, the date that the archived tape \
         started being retained.\n"]
  pool_entry_date : time option;
      [@ocaml.doc
        "The time that the tape entered the custom tape pool.\n\n\
        \ The default timestamp format is in the ISO8601 extended YYYY-MM-DD'T'HH:MM:SS'Z' format.\n\
        \ "]
}
[@@ocaml.doc "Represents a virtual tape that is archived in the virtual tape shelf (VTS).\n"]

type nonrec tape_archives = tape_archive list [@@ocaml.doc ""]

type nonrec describe_tape_archives_output = {
  tape_archives : tape_archives option;
      [@ocaml.doc
        "An array of virtual tape objects in the virtual tape shelf (VTS). The description \
         includes of the Amazon Resource Name (ARN) of the virtual tapes. The information returned \
         includes the Amazon Resource Names (ARNs) of the tapes, size of the tapes, status of the \
         tapes, progress of the description, and tape barcode.\n"]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which the virtual tapes that were fetched \
         for description ended. Use this marker in your next request to fetch the next set of \
         virtual tapes in the virtual tape shelf (VTS). If there are no more virtual tapes to \
         describe, this field does not appear in the response.\n"]
}
[@@ocaml.doc "DescribeTapeArchivesOutput\n"]

type nonrec describe_tape_archives_input = {
  tape_ar_ns : tape_ar_ns option;
      [@ocaml.doc
        "Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual \
         tapes you want to describe.\n"]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin describing virtual tapes.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "Specifies that the number of virtual tapes described be limited to the specified number.\n"]
}
[@@ocaml.doc "DescribeTapeArchivesInput\n"]

type nonrec tape_recovery_point_status = string [@@ocaml.doc ""]

type nonrec tape_recovery_point_info = {
  tape_ar_n : tape_ar_n option; [@ocaml.doc "The Amazon Resource Name (ARN) of the virtual tape.\n"]
  tape_recovery_point_time : time option;
      [@ocaml.doc
        "The time when the point-in-time view of the virtual tape was replicated for later \
         recovery.\n\n\
        \ The default timestamp format of the tape recovery point time is in the ISO8601 extended \
         YYYY-MM-DD'T'HH:MM:SS'Z' format.\n\
        \ "]
  tape_size_in_bytes : tape_size option;
      [@ocaml.doc "The size, in bytes, of the virtual tapes to recover.\n"]
  tape_status : tape_recovery_point_status option; [@ocaml.doc "The status of the virtual tapes.\n"]
}
[@@ocaml.doc "Describes a recovery point.\n"]

type nonrec tape_recovery_point_infos = tape_recovery_point_info list [@@ocaml.doc ""]

type nonrec describe_tape_recovery_points_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  tape_recovery_point_infos : tape_recovery_point_infos option;
      [@ocaml.doc
        "An array of TapeRecoveryPointInfos that are available for the specified gateway.\n"]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which the virtual tape recovery points \
         that were listed for description ended.\n\n\
        \ Use this marker in your next request to list the next set of virtual tape recovery \
         points in the list. If there are no more recovery points to describe, this field does not \
         appear in the response.\n\
        \ "]
}
[@@ocaml.doc "DescribeTapeRecoveryPointsOutput\n"]

type nonrec describe_tape_recovery_points_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin describing the virtual \
         tape recovery points.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "Specifies that the number of virtual tape recovery points that are described be limited \
         to the specified number.\n"]
}
[@@ocaml.doc "DescribeTapeRecoveryPointsInput\n"]

type nonrec vtl_device_ar_n = string [@@ocaml.doc ""]

type nonrec tape_status = string [@@ocaml.doc ""]

type nonrec tape = {
  tape_ar_n : tape_ar_n option; [@ocaml.doc "The Amazon Resource Name (ARN) of the virtual tape.\n"]
  tape_barcode : tape_barcode option;
      [@ocaml.doc "The barcode that identifies a specific virtual tape.\n"]
  tape_created_date : time option; [@ocaml.doc "The date the virtual tape was created.\n"]
  tape_size_in_bytes : tape_size option;
      [@ocaml.doc "The size, in bytes, of the virtual tape capacity.\n"]
  tape_status : tape_status option; [@ocaml.doc "The current state of the virtual tape.\n"]
  vtl_device : vtl_device_ar_n option;
      [@ocaml.doc
        "The virtual tape library (VTL) device that the virtual tape is associated with.\n"]
  progress : double_object option;
      [@ocaml.doc
        "For archiving virtual tapes, indicates how much data remains to be uploaded before \
         archiving is complete.\n\n\
        \ Range: 0 (not started) to 100 (complete).\n\
        \ "]
  tape_used_in_bytes : tape_usage option;
      [@ocaml.doc
        "The size, in bytes, of data stored on the virtual tape.\n\n\
        \  This value is not available for tapes created prior to May 13, 2015.\n\
        \  \n\
        \   "]
  kms_key : kms_key option; [@ocaml.doc ""]
  pool_id : pool_id option;
      [@ocaml.doc
        "The ID of the pool that contains tapes that will be archived. The tapes in this pool are \
         archived in the S3 storage class that is associated with the pool. When you use your \
         backup application to eject the tape, the tape is archived directly into the storage \
         class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.\n"]
  worm : boolean2 option;
      [@ocaml.doc "If the tape is archived as write-once-read-many (WORM), this value is [true].\n"]
  retention_start_date : time option;
      [@ocaml.doc "The date that the tape is first archived with tape retention lock enabled.\n"]
  pool_entry_date : time option; [@ocaml.doc "The date that the tape enters a custom tape pool.\n"]
}
[@@ocaml.doc "Describes a virtual tape object.\n"]

type nonrec tapes = tape list [@@ocaml.doc ""]

type nonrec describe_tapes_output = {
  tapes : tapes option; [@ocaml.doc "An array of virtual tape descriptions.\n"]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that can be used as part of a subsequent [DescribeTapes] call to \
         retrieve the next page of results.\n\n\
        \ If a response does not contain a marker, then there are no more results to be retrieved.\n\
        \ "]
}
[@@ocaml.doc "DescribeTapesOutput\n"]

type nonrec describe_tapes_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  tape_ar_ns : tape_ar_ns option;
      [@ocaml.doc
        "Specifies one or more unique Amazon Resource Names (ARNs) that represent the virtual \
         tapes you want to describe. If this parameter is not specified, Tape gateway returns a \
         description of all virtual tapes associated with the specified gateway.\n"]
  marker : marker option;
      [@ocaml.doc
        "A marker value, obtained in a previous call to [DescribeTapes]. This marker indicates \
         which page of results to retrieve.\n\n\
        \ If not specified, the first page of results is retrieved.\n\
        \ "]
  limit : positive_int_object option;
      [@ocaml.doc
        "Specifies that the number of virtual tapes described be limited to the specified number.\n\n\
        \  Amazon Web Services may impose its own limit, if this field is not set.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "DescribeTapesInput\n"]

type nonrec describe_upload_buffer_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  disk_ids : disk_ids option;
      [@ocaml.doc
        "An array of the gateway's local disk IDs that are configured as working storage. Each \
         local disk ID is specified as a string (minimum length of 1 and maximum length of 300). \
         If no local disks are configured as working storage, then the DiskIds array is empty.\n"]
  upload_buffer_used_in_bytes : long option;
      [@ocaml.doc "The total number of bytes being used in the gateway's upload buffer.\n"]
  upload_buffer_allocated_in_bytes : long option;
      [@ocaml.doc "The total number of bytes allocated in the gateway's as upload buffer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_upload_buffer_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec devicei_scsi_attributes = {
  target_ar_n : target_ar_n option;
      [@ocaml.doc
        "Specifies the unique Amazon Resource Name (ARN) that encodes the iSCSI qualified \
         name(iqn) of a tape drive or media changer target.\n"]
  network_interface_id : network_interface_id option;
      [@ocaml.doc "The network interface identifier of the VTL device.\n"]
  network_interface_port : integer option;
      [@ocaml.doc "The port used to communicate with iSCSI VTL device targets.\n"]
  chap_enabled : boolean2 option;
      [@ocaml.doc "Indicates whether mutual CHAP is enabled for the iSCSI target.\n"]
}
[@@ocaml.doc "Lists iSCSI information about a VTL device.\n"]

type nonrec vtl_device_product_identifier = string [@@ocaml.doc ""]

type nonrec vtl_device_vendor = string [@@ocaml.doc ""]

type nonrec vtl_device_type = string [@@ocaml.doc ""]

type nonrec vtl_device = {
  vtl_device_ar_n : vtl_device_ar_n option;
      [@ocaml.doc
        "Specifies the unique Amazon Resource Name (ARN) of the device (tape drive or media \
         changer).\n"]
  vtl_device_type : vtl_device_type option;
      [@ocaml.doc "Specifies the type of device that the VTL device emulates.\n"]
  vtl_device_vendor : vtl_device_vendor option;
      [@ocaml.doc "Specifies the vendor of the device that the VTL device object emulates.\n"]
  vtl_device_product_identifier : vtl_device_product_identifier option;
      [@ocaml.doc "Specifies the model number of device that the VTL device emulates.\n"]
  devicei_scsi_attributes : devicei_scsi_attributes option;
      [@ocaml.doc "A list of iSCSI information about a VTL device.\n"]
}
[@@ocaml.doc "Represents a device object associated with a tape gateway.\n"]

type nonrec vtl_devices = vtl_device list [@@ocaml.doc ""]

type nonrec describe_vtl_devices_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  vtl_devices : vtl_devices option;
      [@ocaml.doc
        "An array of VTL device objects composed of the Amazon Resource Name (ARN) of the VTL \
         devices.\n"]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which the VTL devices that were fetched \
         for description ended. Use the marker in your next request to fetch the next set of VTL \
         devices in the list. If there are no more VTL devices to describe, this field does not \
         appear in the response.\n"]
}
[@@ocaml.doc "DescribeVTLDevicesOutput\n"]

type nonrec vtl_device_ar_ns = vtl_device_ar_n list [@@ocaml.doc ""]

type nonrec describe_vtl_devices_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  vtl_device_ar_ns : vtl_device_ar_ns option;
      [@ocaml.doc
        "An array of strings, where each string represents the Amazon Resource Name (ARN) of a VTL \
         device.\n\n\
        \  All of the specified VTL devices must be from the same gateway. If no VTL devices are \
         specified, the result will contain all devices on the specified gateway.\n\
        \  \n\
        \   "]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin describing the VTL devices.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "Specifies that the number of VTL devices described be limited to the specified number.\n"]
}
[@@ocaml.doc "DescribeVTLDevicesInput\n"]

type nonrec describe_working_storage_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  disk_ids : disk_ids option;
      [@ocaml.doc
        "An array of the gateway's local disk IDs that are configured as working storage. Each \
         local disk ID is specified as a string (minimum length of 1 and maximum length of 300). \
         If no local disks are configured as working storage, then the DiskIds array is empty.\n"]
  working_storage_used_in_bytes : long option;
      [@ocaml.doc
        "The total working storage in bytes in use by the gateway. If no working storage is \
         configured for the gateway, this field returns 0.\n"]
  working_storage_allocated_in_bytes : long option;
      [@ocaml.doc
        "The total working storage in bytes allocated for the gateway. If no working storage is \
         configured for the gateway, this field returns 0.\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec describe_working_storage_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the Amazon Resource Name (ARN) of the gateway.\n"]

type nonrec detach_volume_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the volume that was detached.\n"]
}
[@@ocaml.doc "AttachVolumeOutput\n"]

type nonrec detach_volume_input = {
  volume_ar_n : volume_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the volume to detach from the gateway.\n"]
  force_detach : boolean_ option;
      [@ocaml.doc
        "Set to [true] to forcibly remove the iSCSI connection of the target volume and detach the \
         volume. The default is [false]. If this value is set to [false], you must manually \
         disconnect the iSCSI connection from the target volume.\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
}
[@@ocaml.doc "AttachVolumeInput\n"]

type nonrec device_type = string [@@ocaml.doc ""]

type nonrec disable_gateway_output = {
  gateway_ar_n : gateway_ar_n option;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the disabled gateway.\n"]
}
[@@ocaml.doc "DisableGatewayOutput\n"]

type nonrec disable_gateway_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "DisableGatewayInput\n"]

type nonrec disassociate_file_system_output = {
  file_system_association_ar_n : file_system_association_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the deleted file system association.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_file_system_input = {
  file_system_association_ar_n : file_system_association_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the file system association to be deleted.\n"]
  force_delete : boolean2 option;
      [@ocaml.doc
        "If this value is set to true, the operation disassociates an Amazon FSx file system \
         immediately. It ends all data uploads to the file system, and the file system association \
         enters the [FORCE_DELETING] status. If this value is set to false, the Amazon FSx file \
         system does not disassociate until all data is uploaded.\n"]
}
[@@ocaml.doc ""]

type nonrec disk_attribute = string [@@ocaml.doc ""]

type nonrec disk_attribute_list = disk_attribute list [@@ocaml.doc ""]

type nonrec disk_allocation_type = string [@@ocaml.doc ""]

type nonrec disk = {
  disk_id : disk_id option;
      [@ocaml.doc
        "The unique device ID or other distinguishing data that identifies a local disk.\n"]
  disk_path : string_ option;
      [@ocaml.doc "The path of a local disk in the gateway virtual machine (VM).\n"]
  disk_node : string_ option;
      [@ocaml.doc
        "The device node of a local disk as assigned by the virtualization environment.\n"]
  disk_status : string_ option; [@ocaml.doc "A value that represents the status of a local disk.\n"]
  disk_size_in_bytes : long option; [@ocaml.doc "The local disk size in bytes.\n"]
  disk_allocation_type : disk_allocation_type option; [@ocaml.doc ""]
  disk_allocation_resource : string_ option;
      [@ocaml.doc
        "The iSCSI qualified name (IQN) that is defined for a disk. This field is not included in \
         the response if the local disk is not defined as an iSCSI target. The format of this \
         field is {i targetIqn::LUNNumber::region-volumeId}.\n"]
  disk_attribute_list : disk_attribute_list option; [@ocaml.doc ""]
}
[@@ocaml.doc "Represents a gateway's local disk.\n"]

type nonrec disks = disk list [@@ocaml.doc ""]

type nonrec evict_files_failing_upload_output = {
  notification_id : string_ option;
      [@ocaml.doc
        "The randomly generated ID of the CloudWatch notification associated with the cache clean \
         operation. This ID is in UUID format.\n"]
}
[@@ocaml.doc ""]

type nonrec evict_files_failing_upload_input = {
  file_share_ar_n : file_share_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the file share for which you want to start the cache \
         clean operation.\n"]
  force_remove : boolean2 option;
      [@ocaml.doc
        "Specifies whether cache entries with full or partial file data currently stored on the \
         gateway will be forcibly removed by the cache clean operation.\n\n\
        \ Valid arguments:\n\
        \ \n\
        \  {ul\n\
        \        {-   [False] - The cache clean operation skips cache entries failing upload if \
         they are associated with data currently stored on the gateway. This preserves the cached \
         data.\n\
        \            \n\
        \             }\n\
        \        {-   [True] - The cache clean operation removes cache entries failing upload even \
         if they are associated with data currently stored on the gateway. This deletes the cached \
         data.\n\
        \            \n\
        \              If [ForceRemove] is set to [True], the cache clean operation will delete \
         file data from the gateway which might otherwise be recoverable.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec file_share_type = NFS [@ocaml.doc ""] | SMB [@ocaml.doc ""]
[@@ocaml.doc "The type of the file share.\n"]

type nonrec file_share_info = {
  file_share_type : file_share_type option; [@ocaml.doc ""]
  file_share_ar_n : file_share_ar_n option; [@ocaml.doc ""]
  file_share_id : file_share_id option; [@ocaml.doc ""]
  file_share_status : file_share_status option; [@ocaml.doc ""]
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc "Describes a file share. Only supported S3 File Gateway.\n"]

type nonrec file_share_info_list = file_share_info list [@@ocaml.doc ""]

type nonrec file_system_association_id = string [@@ocaml.doc ""]

type nonrec file_system_association_summary = {
  file_system_association_id : file_system_association_id option;
      [@ocaml.doc "The ID of the file system association.\n"]
  file_system_association_ar_n : file_system_association_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the file system association.\n"]
  file_system_association_status : file_system_association_status option;
      [@ocaml.doc
        "The status of the file share. Valid Values: [AVAILABLE] | [CREATING] | [DELETING] | \
         [FORCE_DELETING] | [UPDATING] | [ERROR] \n"]
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Gets the summary returned by [ListFileSystemAssociation], which is a summary of a created file \
   system association.\n"]

type nonrec file_system_association_summary_list = file_system_association_summary list
[@@ocaml.doc ""]

type nonrec folder = string [@@ocaml.doc ""]

type nonrec folder_list = folder list [@@ocaml.doc ""]

type nonrec gateway_operational_state = string [@@ocaml.doc ""]

type nonrec gateway_info = {
  gateway_id : gateway_id option;
      [@ocaml.doc
        "The unique identifier assigned to your gateway during activation. This ID becomes part of \
         the gateway Amazon Resource Name (ARN), which you use as input for other operations.\n"]
  gateway_ar_n : gateway_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return \
         a list of gateways for your account and Amazon Web Services Region.\n"]
  gateway_type : gateway_type option;
      [@ocaml.doc
        "The type of the gateway.\n\n\
        \  Amazon FSx File Gateway is no longer available to new customers. Existing customers of \
         FSx File Gateway can continue to use the service normally. For capabilities similar to \
         FSx File Gateway, visit \
         {{:https://aws.amazon.com/blogs/storage/switch-your-file-share-access-from-amazon-fsx-file-gateway-to-amazon-fsx-for-windows-file-server/}this \
         blog post}.\n\
        \  \n\
        \   "]
  gateway_operational_state : gateway_operational_state option;
      [@ocaml.doc "The state of the gateway.\n\n Valid Values: [DISABLED] | [ACTIVE] \n "]
  gateway_name : string_ option; [@ocaml.doc "The name of the gateway.\n"]
  ec2_instance_id : ec2_instance_id option;
      [@ocaml.doc "The ID of the Amazon EC2 instance that was used to launch the gateway.\n"]
  ec2_instance_region : ec2_instance_region option;
      [@ocaml.doc "The Amazon Web Services Region where the Amazon EC2 instance is located.\n"]
  host_environment : host_environment option;
      [@ocaml.doc
        "The type of hardware or software platform on which the gateway is running.\n\n\
        \  Tape Gateway is no longer available on Snow Family devices.\n\
        \  \n\
        \   "]
  host_environment_id : host_environment_id option;
      [@ocaml.doc
        "A unique identifier for the specific instance of the host platform running the gateway. \
         This value is only available for certain host environments, and its format depends on the \
         host environment type.\n"]
  deprecation_date : deprecation_date option;
      [@ocaml.doc
        "Date after which this gateway will not receive software updates for new features and bug \
         fixes.\n"]
  software_version : software_version option;
      [@ocaml.doc "The version number of the software running on the gateway appliance.\n"]
}
[@@ocaml.doc "Describes a gateway object.\n"]

type nonrec gateways = gateway_info list [@@ocaml.doc ""]

type nonrec host = string [@@ocaml.doc ""]

type nonrec hosts = host list [@@ocaml.doc ""]

type nonrec initiator = string [@@ocaml.doc ""]

type nonrec initiators = initiator list [@@ocaml.doc ""]

type nonrec join_domain_output = {
  gateway_ar_n : gateway_ar_n option;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the gateway that joined the domain.\n"]
  active_directory_status : active_directory_status option;
      [@ocaml.doc
        "Indicates the status of the gateway as a member of the Active Directory domain.\n\n\
        \  This field is only used as part of a [JoinDomain] request. It is not affected by Active \
         Directory connectivity changes that occur after the [JoinDomain] request succeeds.\n\
        \  \n\
        \    {ul\n\
        \          {-   [ACCESS_DENIED]: Indicates that the [JoinDomain] operation failed due to \
         an authentication error.\n\
        \              \n\
        \               }\n\
        \          {-   [DETACHED]: Indicates that gateway is not joined to a domain.\n\
        \              \n\
        \               }\n\
        \          {-   [JOINED]: Indicates that the gateway has successfully joined a domain.\n\
        \              \n\
        \               }\n\
        \          {-   [JOINING]: Indicates that a [JoinDomain] operation is in progress.\n\
        \              \n\
        \               }\n\
        \          {-   [INSUFFICIENT_PERMISSIONS]: Indicates that the [JoinDomain] operation \
         failed because the specified user lacks the necessary permissions to join the domain.\n\
        \              \n\
        \               }\n\
        \          {-   [NETWORK_ERROR]: Indicates that [JoinDomain] operation failed due to a \
         network or connectivity error.\n\
        \              \n\
        \               }\n\
        \          {-   [TIMEOUT]: Indicates that the [JoinDomain] operation failed because the \
         operation didn't complete within the allotted time.\n\
        \              \n\
        \               }\n\
        \          {-   [UNKNOWN_ERROR]: Indicates that the [JoinDomain] operation failed due to \
         another type of error.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "JoinDomainOutput\n"]

type nonrec timeout_in_seconds = int [@@ocaml.doc ""]

type nonrec organizational_unit = string [@@ocaml.doc ""]

type nonrec join_domain_input = {
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return \
         a list of gateways for your account and Amazon Web Services Region.\n"]
  domain_name : domain_name;
      [@ocaml.doc "The name of the domain that you want the gateway to join.\n"]
  organizational_unit : organizational_unit option;
      [@ocaml.doc
        "The organizational unit (OU) is a container in an Active Directory that can hold users, \
         groups, computers, and other OUs and this parameter specifies the OU that the gateway \
         will join within the AD domain.\n"]
  domain_controllers : hosts option;
      [@ocaml.doc
        "List of IP addresses, NetBIOS names, or host names of your domain server. If you need to \
         specify the port number include it after the colon (\226\128\156:\226\128\157). For \
         example, [mydc.mydomain.com:389].\n\n\
        \  S3 File Gateway supports IPv6 addresses in addition to IPv4 and other existing formats.\n\
        \  \n\
        \   FSx File Gateway does not support IPv6.\n\
        \   \n\
        \    "]
  timeout_in_seconds : timeout_in_seconds option;
      [@ocaml.doc
        "Specifies the time in seconds, in which the [JoinDomain] operation must complete. The \
         default is 20 seconds.\n"]
  user_name : domain_user_name;
      [@ocaml.doc
        "Sets the user name of user who has permission to add the gateway to the Active Directory \
         domain. The domain user account should be enabled to join computers to the domain. For \
         example, you can use the domain administrator account or an account with delegated \
         permissions to join computers to the domain.\n"]
  password : domain_user_password;
      [@ocaml.doc
        "Sets the password of the user who has permission to add the gateway to the Active \
         Directory domain.\n"]
}
[@@ocaml.doc "JoinDomainInput\n"]

type nonrec list_automatic_tape_creation_policies_output = {
  automatic_tape_creation_policy_infos : automatic_tape_creation_policy_infos option;
      [@ocaml.doc
        "Gets a listing of information about the gateway's automatic tape creation policies, \
         including the automatic tape creation rules and the gateway that is using the policies.\n"]
}
[@@ocaml.doc ""]

type nonrec list_automatic_tape_creation_policies_input = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec list_cache_reports_output = {
  cache_report_list : cache_report_list option;
      [@ocaml.doc
        "A list of existing cache reports for all file shares associated with your Amazon Web \
         Services account. This list includes all information provided by the \
         [DescribeCacheReport] action, such as report status, completion progress, start time, end \
         time, filters, and tags.\n"]
  marker : marker option;
      [@ocaml.doc
        "If the request includes [Marker], the response returns that value in this field.\n"]
}
[@@ocaml.doc ""]

type nonrec list_cache_reports_input = {
  marker : marker option;
      [@ocaml.doc
        "Opaque pagination token returned from a previous [ListCacheReports] operation. If \
         present, [Marker] specifies where to continue the list from after a previous call to \
         [ListCacheReports]. Optional.\n"]
}
[@@ocaml.doc ""]

type nonrec list_file_shares_output = {
  marker : marker option;
      [@ocaml.doc
        "If the request includes [Marker], the response returns that value in this field.\n"]
  next_marker : marker option;
      [@ocaml.doc
        "If a value is present, there are more file shares to return. In a subsequent request, use \
         [NextMarker] as the value for [Marker] to retrieve the next set of file shares.\n"]
  file_share_info_list : file_share_info_list option;
      [@ocaml.doc "An array of information about the S3 File Gateway's file shares.\n"]
}
[@@ocaml.doc "ListFileShareOutput\n"]

type nonrec list_file_shares_input = {
  gateway_ar_n : gateway_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway whose file shares you want to list. If this \
         field is not present, all file shares under your account are listed.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "The maximum number of file shares to return in the response. The value must be an integer \
         with a value greater than zero. Optional.\n"]
  marker : marker option;
      [@ocaml.doc
        "Opaque pagination token returned from a previous ListFileShares operation. If present, \
         [Marker] specifies where to continue the list from after a previous call to \
         ListFileShares. Optional.\n"]
}
[@@ocaml.doc "ListFileShareInput\n"]

type nonrec list_file_system_associations_output = {
  marker : marker option;
      [@ocaml.doc
        "If the request includes [Marker], the response returns that value in this field.\n"]
  next_marker : marker option;
      [@ocaml.doc
        "If a value is present, there are more file system associations to return. In a subsequent \
         request, use [NextMarker] as the value for [Marker] to retrieve the next set of file \
         system associations.\n"]
  file_system_association_summary_list : file_system_association_summary_list option;
      [@ocaml.doc
        "An array of information about the Amazon FSx gateway's file system associations.\n"]
}
[@@ocaml.doc ""]

type nonrec list_file_system_associations_input = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  limit : positive_int_object option;
      [@ocaml.doc
        "The maximum number of file system associations to return in the response. If present, \
         [Limit] must be an integer with a value greater than zero. Optional.\n"]
  marker : marker option;
      [@ocaml.doc
        "Opaque pagination token returned from a previous [ListFileSystemAssociations] operation. \
         If present, [Marker] specifies where to continue the list from after a previous call to \
         [ListFileSystemAssociations]. Optional.\n"]
}
[@@ocaml.doc ""]

type nonrec list_gateways_output = {
  gateways : gateways option; [@ocaml.doc "An array of [GatewayInfo] objects.\n"]
  marker : marker option;
      [@ocaml.doc
        "Use the marker in your next request to fetch the next set of gateways in the list. If \
         there are no more gateways to list, this field does not appear in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec list_gateways_input = {
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin the returned list of \
         gateways.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "Specifies that the list of gateways returned be limited to the specified number of items.\n"]
}
[@@ocaml.doc
  "A JSON object containing zero or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [ListGatewaysInput$Limit] \n\
  \           \n\
  \            }\n\
  \       {-   [ListGatewaysInput$Marker] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec list_local_disks_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  disks : disks option;
      [@ocaml.doc
        "A JSON object containing the following fields:\n\n\
        \ {ul\n\
        \       {-   [ListLocalDisksOutput$Disks] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec list_local_disks_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the Amazon Resource Name (ARN) of the gateway.\n"]

type nonrec list_tags_for_resource_output = {
  resource_ar_n : resource_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which you want to list tags.\n"]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to stop returning the list of tags.\n"]
  tags : tags option; [@ocaml.doc "An array that contains the tags for the specified resource.\n"]
}
[@@ocaml.doc "ListTagsForResourceOutput\n"]

type nonrec list_tags_for_resource_input = {
  resource_ar_n : resource_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which you want to list tags.\n"]
  marker : marker option;
      [@ocaml.doc
        "An opaque string that indicates the position at which to begin returning the list of tags.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "Specifies that the list of tags returned be limited to the specified number of items.\n"]
}
[@@ocaml.doc "ListTagsForResourceInput\n"]

type nonrec pool_status = ACTIVE [@ocaml.doc ""] | DELETED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec pool_info = {
  pool_ar_n : pool_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom tape pool. Use the [ListTapePools] operation \
         to return a list of custom tape pools for your account and Amazon Web Services Region.\n"]
  pool_name : pool_name option;
      [@ocaml.doc
        "The name of the custom tape pool. [PoolName] can use all ASCII characters, except '/' and \
         '\\'.\n"]
  storage_class : tape_storage_class option;
      [@ocaml.doc
        "The storage class that is associated with the custom pool. When you use your backup \
         application to eject the tape, the tape is archived directly into the storage class (S3 \
         Glacier or S3 Glacier Deep Archive) that corresponds to the pool.\n"]
  retention_lock_type : retention_lock_type option;
      [@ocaml.doc
        "Tape retention lock type, which can be configured in two modes. When configured in \
         governance mode, Amazon Web Services accounts with specific IAM permissions are \
         authorized to remove the tape retention lock from archived virtual tapes. When configured \
         in compliance mode, the tape retention lock cannot be removed by any user, including the \
         root Amazon Web Services account.\n"]
  retention_lock_time_in_days : retention_lock_time_in_days option;
      [@ocaml.doc
        "Tape retention lock time is set in days. Tape retention lock can be enabled for up to 100 \
         years (36,500 days).\n"]
  pool_status : pool_status option;
      [@ocaml.doc "Status of the custom tape pool. Pool can be [ACTIVE] or [DELETED].\n"]
}
[@@ocaml.doc "Describes a custom tape pool.\n"]

type nonrec pool_infos = pool_info list [@@ocaml.doc ""]

type nonrec list_tape_pools_output = {
  pool_infos : pool_infos option;
      [@ocaml.doc
        "An array of [PoolInfo] objects, where each object describes a single custom tape pool. If \
         there are no custom tape pools, the [PoolInfos] is an empty array. \n"]
  marker : marker option;
      [@ocaml.doc
        "A string that indicates the position at which to begin the returned list of tape pools. \
         Use the marker in your next request to continue pagination of tape pools. If there are no \
         more tape pools to list, this element does not appear in the response body. \n"]
}
[@@ocaml.doc ""]

type nonrec pool_ar_ns = pool_ar_n list [@@ocaml.doc ""]

type nonrec list_tape_pools_input = {
  pool_ar_ns : pool_ar_ns option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of each of the custom tape pools you want to list. If you \
         don't specify a custom tape pool ARN, the response lists all custom tape pools. \n"]
  marker : marker option;
      [@ocaml.doc
        "A string that indicates the position at which to begin the returned list of tape pools.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "An optional number limit for the tape pools in the list returned by this call.\n"]
}
[@@ocaml.doc ""]

type nonrec tape_info = {
  tape_ar_n : tape_ar_n option; [@ocaml.doc "The Amazon Resource Name (ARN) of a virtual tape.\n"]
  tape_barcode : tape_barcode option;
      [@ocaml.doc "The barcode that identifies a specific virtual tape.\n"]
  tape_size_in_bytes : tape_size option; [@ocaml.doc "The size, in bytes, of a virtual tape.\n"]
  tape_status : tape_status option; [@ocaml.doc "The status of the tape.\n"]
  gateway_ar_n : gateway_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway. Use the [ListGateways] operation to return \
         a list of gateways for your account and Amazon Web Services Region.\n"]
  pool_id : pool_id option;
      [@ocaml.doc
        "The ID of the pool that you want to add your tape to for archiving. The tape in this pool \
         is archived in the S3 storage class that is associated with the pool. When you use your \
         backup application to eject the tape, the tape is archived directly into the storage \
         class (S3 Glacier or S3 Glacier Deep Archive) that corresponds to the pool.\n"]
  retention_start_date : time option;
      [@ocaml.doc "The date that the tape became subject to tape retention lock.\n"]
  pool_entry_date : time option;
      [@ocaml.doc
        "The date that the tape entered the custom tape pool with tape retention lock enabled.\n"]
}
[@@ocaml.doc "Describes a virtual tape.\n"]

type nonrec tape_infos = tape_info list [@@ocaml.doc ""]

type nonrec list_tapes_output = {
  tape_infos : tape_infos option; [@ocaml.doc ""]
  marker : marker option;
      [@ocaml.doc
        "A string that indicates the position at which to begin returning the next list of tapes. \
         Use the marker in your next request to continue pagination of tapes. If there are no more \
         tapes to list, this element does not appear in the response body.\n"]
}
[@@ocaml.doc
  "A JSON object containing the following fields:\n\n\
  \ {ul\n\
  \       {-   [ListTapesOutput$Marker] \n\
  \           \n\
  \            }\n\
  \       {-   [ListTapesOutput$VolumeInfos] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec list_tapes_input = {
  tape_ar_ns : tape_ar_ns option; [@ocaml.doc ""]
  marker : marker option;
      [@ocaml.doc
        "A string that indicates the position at which to begin the returned list of tapes.\n"]
  limit : positive_int_object option;
      [@ocaml.doc "An optional number limit for the tapes in the list returned by this call.\n"]
}
[@@ocaml.doc
  "A JSON object that contains one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [ListTapesInput$Limit] \n\
  \           \n\
  \            }\n\
  \       {-   [ListTapesInput$Marker] \n\
  \           \n\
  \            }\n\
  \       {-   [ListTapesInput$TapeARNs] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec list_volume_initiators_output = {
  initiators : initiators option;
      [@ocaml.doc
        "The host names and port numbers of all iSCSI initiators that are connected to the gateway.\n"]
}
[@@ocaml.doc "ListVolumeInitiatorsOutput\n"]

type nonrec list_volume_initiators_input = {
  volume_ar_n : volume_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume. Use the [ListVolumes] operation to return a \
         list of gateway volumes for the gateway.\n"]
}
[@@ocaml.doc "ListVolumeInitiatorsInput\n"]

type nonrec volume_recovery_point_info = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the volume target.\n"]
  volume_size_in_bytes : long option; [@ocaml.doc "The size of the volume in bytes.\n"]
  volume_usage_in_bytes : long option;
      [@ocaml.doc
        "The size of the data stored on the volume in bytes.\n\n\
        \  This value is not available for volumes created prior to May 13, 2015, until you store \
         data on the volume.\n\
        \  \n\
        \   "]
  volume_recovery_point_time : string_ option;
      [@ocaml.doc "The time the recovery point was taken.\n"]
}
[@@ocaml.doc "Describes a storage volume recovery point object.\n"]

type nonrec volume_recovery_point_infos = volume_recovery_point_info list [@@ocaml.doc ""]

type nonrec list_volume_recovery_points_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  volume_recovery_point_infos : volume_recovery_point_infos option;
      [@ocaml.doc "An array of [VolumeRecoveryPointInfo] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_volume_recovery_points_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec volume_info = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the storage volume. For example, the following is a \
         valid ARN:\n\n\
        \  [arn:aws:storagegateway:us-east-2:111122223333:gateway/sgw-12A3456B/volume/vol-1122AABB] \n\
        \ \n\
        \  Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).\n\
        \  "]
  volume_id : volume_id option;
      [@ocaml.doc
        "The unique identifier assigned to the volume. This ID becomes part of the volume Amazon \
         Resource Name (ARN), which you use as input for other operations.\n\n\
        \ Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).\n\
        \ "]
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  gateway_id : gateway_id option;
      [@ocaml.doc
        "The unique identifier assigned to your gateway during activation. This ID becomes part of \
         the gateway Amazon Resource Name (ARN), which you use as input for other operations.\n\n\
        \ Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).\n\
        \ "]
  volume_type : volume_type option;
      [@ocaml.doc "One of the VolumeType enumeration values describing the type of the volume.\n"]
  volume_size_in_bytes : long option;
      [@ocaml.doc
        "The size of the volume in bytes.\n\n\
        \ Valid Values: 50 to 500 lowercase letters, numbers, periods (.), and hyphens (-).\n\
        \ "]
  volume_attachment_status : volume_attachment_status option;
      [@ocaml.doc
        "One of the VolumeStatus values that indicates the state of the storage volume.\n"]
}
[@@ocaml.doc "Describes a storage volume object.\n"]

type nonrec volume_infos = volume_info list [@@ocaml.doc ""]

type nonrec list_volumes_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  marker : marker option;
      [@ocaml.doc
        "Use the marker in your next request to continue pagination of iSCSI volumes. If there are \
         no more volumes to list, this field does not appear in the response body.\n"]
  volume_infos : volume_infos option;
      [@ocaml.doc
        "An array of [VolumeInfo] objects, where each object describes an iSCSI volume. If no \
         volumes are defined for the gateway, then [VolumeInfos] is an empty array \"\\[\\]\".\n"]
}
[@@ocaml.doc
  "A JSON object containing the following fields:\n\n\
  \ {ul\n\
  \       {-   [ListVolumesOutput$Marker] \n\
  \           \n\
  \            }\n\
  \       {-   [ListVolumesOutput$VolumeInfos] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec list_volumes_input = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  marker : marker option;
      [@ocaml.doc
        "A string that indicates the position at which to begin the returned list of volumes. \
         Obtain the marker from the response of a previous List iSCSI Volumes request.\n"]
  limit : positive_int_object option;
      [@ocaml.doc
        "Specifies that the list of volumes returned be limited to the specified number of items.\n"]
}
[@@ocaml.doc
  "A JSON object that contains one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [ListVolumesInput$Limit] \n\
  \           \n\
  \            }\n\
  \       {-   [ListVolumesInput$Marker] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec local_console_password = string [@@ocaml.doc ""]

type nonrec notification_id = string [@@ocaml.doc ""]

type nonrec notify_when_uploaded_output = {
  file_share_ar_n : file_share_ar_n option; [@ocaml.doc ""]
  notification_id : notification_id option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec notify_when_uploaded_input = { file_share_ar_n : file_share_ar_n [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec refresh_cache_output = {
  file_share_ar_n : file_share_ar_n option; [@ocaml.doc ""]
  notification_id : notification_id option; [@ocaml.doc ""]
}
[@@ocaml.doc "RefreshCacheOutput\n"]

type nonrec refresh_cache_input = {
  file_share_ar_n : file_share_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the file share you want to refresh.\n"]
  folder_list : folder_list option;
      [@ocaml.doc
        "A comma-separated list of the paths of folders to refresh in the cache. The default is \
         \\[[\"/\"]\\]. The default refreshes objects and folders at the root of the Amazon S3 \
         bucket. If [Recursive] is set to [true], the entire S3 bucket that the file share has \
         access to is refreshed.\n\n\
        \ Do not include [/] when specifying folder names. For example, you would specify \
         [samplefolder] rather than [samplefolder/].\n\
        \ "]
  recursive : boolean_ option;
      [@ocaml.doc
        "A value that specifies whether to recursively refresh folders in the cache. The refresh \
         includes folders that were in the cache the last time the gateway listed the folder's \
         contents. If this value set to [true], each folder that is listed in [FolderList] is \
         recursively updated. Otherwise, subfolders listed in [FolderList] are not refreshed. Only \
         objects that are in folders listed directly under [FolderList] are found and used for the \
         update. The default is [true].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
}
[@@ocaml.doc "RefreshCacheInput\n"]

type nonrec remove_tags_from_resource_output = {
  resource_ar_n : resource_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that the tags were removed from.\n"]
}
[@@ocaml.doc "RemoveTagsFromResourceOutput\n"]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec remove_tags_from_resource_input = {
  resource_ar_n : resource_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource you want to remove the tags from.\n"]
  tag_keys : tag_keys;
      [@ocaml.doc
        "The keys of the tags you want to remove from the specified resource. A tag is composed of \
         a key-value pair.\n"]
}
[@@ocaml.doc "RemoveTagsFromResourceInput\n"]

type nonrec reset_cache_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec reset_cache_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec retrieve_tape_archive_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the retrieved virtual tape.\n"]
}
[@@ocaml.doc "RetrieveTapeArchiveOutput\n"]

type nonrec retrieve_tape_archive_input = {
  tape_ar_n : tape_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape you want to retrieve from the virtual \
         tape shelf (VTS).\n"]
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the gateway you want to retrieve the virtual tape to. \
         Use the [ListGateways] operation to return a list of gateways for your account and Amazon \
         Web Services Region.\n\n\
        \ You retrieve archived virtual tapes to only one gateway and the gateway must be a tape \
         gateway.\n\
        \ "]
}
[@@ocaml.doc "RetrieveTapeArchiveInput\n"]

type nonrec retrieve_tape_recovery_point_output = {
  tape_ar_n : tape_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape for which the recovery point was \
         retrieved.\n"]
}
[@@ocaml.doc "RetrieveTapeRecoveryPointOutput\n"]

type nonrec retrieve_tape_recovery_point_input = {
  tape_ar_n : tape_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the virtual tape for which you want to retrieve the \
         recovery point.\n"]
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
}
[@@ocaml.doc "RetrieveTapeRecoveryPointInput\n"]

type nonrec smb_guest_password = string [@@ocaml.doc ""]

type nonrec set_local_console_password_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec set_local_console_password_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  local_console_password : local_console_password;
      [@ocaml.doc "The password you want to set for your VM local console.\n"]
}
[@@ocaml.doc "SetLocalConsolePasswordInput\n"]

type nonrec set_smb_guest_password_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec set_smb_guest_password_input = {
  gateway_ar_n : gateway_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the S3 File Gateway the SMB file share is associated \
         with.\n"]
  password : smb_guest_password;
      [@ocaml.doc "The password that you want to set for your SMB server.\n"]
}
[@@ocaml.doc "SetSMBGuestPasswordInput\n"]

type nonrec shutdown_gateway_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway that was shut down.\n"]

type nonrec shutdown_gateway_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway to shut down.\n"]

type nonrec start_availability_monitor_test_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec start_availability_monitor_test_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec start_cache_report_output = {
  cache_report_ar_n : cache_report_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the cache report generated by the [StartCacheReport] \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec start_cache_report_input = {
  file_share_ar_n : file_share_ar_n; [@ocaml.doc ""]
  role : role;
      [@ocaml.doc "The ARN of the IAM role used when saving the cache report to Amazon S3.\n"]
  location_ar_n : location_ar_n;
      [@ocaml.doc
        "The ARN of the Amazon S3 bucket where you want to save the cache report.\n\n\
        \  We do not recommend saving the cache report to the same Amazon S3 bucket for which you \
         are generating the report.\n\
        \  \n\
        \   This field does not accept access point ARNs.\n\
        \   \n\
        \    "]
  bucket_region : region_id;
      [@ocaml.doc
        "The Amazon Web Services Region of the Amazon S3 bucket where you want to save the cache \
         report.\n"]
  vpc_endpoint_dns_name : dns_host_name option;
      [@ocaml.doc
        "The DNS name of the VPC endpoint associated with the Amazon S3 where you want to save the \
         cache report. Optional.\n"]
  inclusion_filters : cache_report_filter_list option;
      [@ocaml.doc
        "The list of filters and parameters that determine which files are included in the report. \
         You must specify at least one value for [InclusionFilters] or [ExclusionFilters] in a \
         [StartCacheReport] request.\n"]
  exclusion_filters : cache_report_filter_list option;
      [@ocaml.doc
        "The list of filters and parameters that determine which files are excluded from the \
         report. You must specify at least one value for [InclusionFilters] or [ExclusionFilters] \
         in a [StartCacheReport] request.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique identifier that you use to ensure idempotent report generation if you need to \
         retry an unsuccessful [StartCacheReport] request. If you retry a request, use the same \
         [ClientToken] you specified in the initial request.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 key/value tags that you can assign to the cache report. Using tags can \
         help you categorize your reports and more easily locate them in search results.\n"]
}
[@@ocaml.doc ""]

type nonrec start_gateway_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway that was restarted.\n"]

type nonrec start_gateway_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the Amazon Resource Name (ARN) of the gateway to start.\n"]

type nonrec update_vtl_device_type_output = {
  vtl_device_ar_n : vtl_device_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the medium changer you have selected.\n"]
}
[@@ocaml.doc "UpdateVTLDeviceTypeOutput\n"]

type nonrec update_vtl_device_type_input = {
  vtl_device_ar_n : vtl_device_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the medium changer you want to select.\n"]
  device_type : device_type;
      [@ocaml.doc
        "The type of medium changer you want to select.\n\n\
        \ Valid Values: [STK-L700] | [AWS-Gateway-VTL] | [IBM-03584L32-0402] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_snapshot_schedule_output = {
  volume_ar_n : volume_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume. Use the [ListVolumes] operation to return a \
         list of gateway volumes.\n"]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the updated storage volume.\n"]

type nonrec update_snapshot_schedule_input = {
  volume_ar_n : volume_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volume. Use the [ListVolumes] operation to return a \
         list of gateway volumes.\n"]
  start_at : hour_of_day;
      [@ocaml.doc
        "The hour of the day at which the snapshot schedule begins represented as {i hh}, where {i \
         hh} is the hour (0 to 23). The hour of the day is in the time zone of the gateway.\n"]
  recurrence_in_hours : recurrence_in_hours;
      [@ocaml.doc "Frequency of snapshots. Specify the number of hours between snapshots.\n"]
  description : description option;
      [@ocaml.doc
        "Optional description of the snapshot that overwrites the existing description.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of up to 50 tags that can be assigned to a snapshot. Each tag is a key-value pair.\n\n\
        \  Valid characters for key and value are letters, spaces, and numbers representable in \
         UTF-8 format, and the following special characters: + - = . _ : / \\@. The maximum length \
         of a tag's key is 128 characters, and the maximum length for a tag's value is 256.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [UpdateSnapshotScheduleInput$Description] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateSnapshotScheduleInput$RecurrenceInHours] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateSnapshotScheduleInput$StartAt] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateSnapshotScheduleInput$VolumeARN] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec update_smb_security_strategy_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_smb_security_strategy_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  smb_security_strategy : smb_security_strategy;
      [@ocaml.doc
        "Specifies the type of security strategy.\n\n\
        \  [ClientSpecified]: If you choose this option, requests are established based on what is \
         negotiated by the client. This option is recommended when you want to maximize \
         compatibility across different clients in your environment. Supported only for S3 File \
         Gateway.\n\
        \ \n\
        \   [MandatorySigning]: If you choose this option, File Gateway only allows connections \
         from SMBv2 or SMBv3 clients that have signing enabled. This option works with SMB clients \
         on Microsoft Windows Vista, Windows Server 2008 or newer.\n\
        \  \n\
        \    [MandatoryEncryption]: If you choose this option, File Gateway only allows \
         connections from SMBv3 clients that have encryption enabled. This option is recommended \
         for environments that handle sensitive data. This option works with SMB clients on \
         Microsoft Windows 8, Windows Server 2012 or newer.\n\
        \   \n\
        \     [MandatoryEncryptionNoAes128]: If you choose this option, File Gateway only allows \
         connections from SMBv3 clients that use 256-bit AES encryption algorithms. 128-bit \
         algorithms are not allowed. This option is recommended for environments that handle \
         sensitive data. It works with SMB clients on Microsoft Windows 8, Windows Server 2012, or \
         later.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec update_smb_local_groups_output = { gateway_ar_n : gateway_ar_n option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec update_smb_local_groups_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  smb_local_groups : smb_local_groups;
      [@ocaml.doc
        "A list of Active Directory users and groups that you want to grant special permissions \
         for SMB file shares on the gateway.\n"]
}
[@@ocaml.doc ""]

type nonrec update_smb_file_share_visibility_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_smb_file_share_visibility_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  file_shares_visible : boolean_;
      [@ocaml.doc "The shares on this gateway appear when listing shares.\n"]
}
[@@ocaml.doc ""]

type nonrec update_smb_file_share_output = {
  file_share_ar_n : file_share_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated SMB file share.\n"]
}
[@@ocaml.doc "UpdateSMBFileShareOutput\n"]

type nonrec update_smb_file_share_input = {
  file_share_ar_n : file_share_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the SMB file share that you want to update.\n"]
  encryption_type : encryption_type option;
      [@ocaml.doc
        "A value that specifies the type of server-side encryption that the file share will use \
         for the data that it stores in Amazon S3.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \    "]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Optional. Set to [true] to use Amazon S3 server-side encryption with your own KMS key \
         (SSE-KMS), or [false] to use a key managed by Amazon S3 (SSE-S3). To use dual-layer \
         encryption (DSSE-KMS), set the [EncryptionType] parameter instead.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \     Valid Values: [true] | [false] \n\
        \     "]
  kms_key : kms_key option;
      [@ocaml.doc
        "Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used \
         for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. \
         This value must be set if [KMSEncrypted] is [true], or if [EncryptionType] is [SseKms] or \
         [DsseKms].\n"]
  default_storage_class : storage_class option;
      [@ocaml.doc
        "The default storage class for objects put into an Amazon S3 bucket by the S3 File \
         Gateway. The default value is [S3_STANDARD]. Optional.\n\n\
        \ Valid Values: [S3_STANDARD] | [S3_INTELLIGENT_TIERING] | [S3_STANDARD_IA] | \
         [S3_ONEZONE_IA] \n\
        \ "]
  object_ac_l : object_ac_l option;
      [@ocaml.doc
        "A value that sets the access control list (ACL) permission for objects in the S3 bucket \
         that a S3 File Gateway puts objects into. The default value is [private].\n"]
  read_only : boolean_ option;
      [@ocaml.doc
        "A value that sets the write status of a file share. Set this value to [true] to set write \
         status to read-only, otherwise set to [false].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  guess_mime_type_enabled : boolean_ option;
      [@ocaml.doc
        "A value that enables guessing of the MIME type for uploaded objects based on file \
         extensions. Set this value to [true] to enable MIME type guessing, otherwise set to \
         [false]. The default value is [true].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  requester_pays : boolean_ option;
      [@ocaml.doc
        "A value that sets who pays the cost of the request and the cost associated with data \
         download from the S3 bucket. If this value is set to [true], the requester pays the \
         costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the \
         cost of storing data.\n\n\
        \   [RequesterPays] is a configuration for the S3 bucket that backs the file share, so \
         make sure that the configuration on the file share is the same as the S3 bucket \
         configuration.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
  smbacl_enabled : boolean_ option;
      [@ocaml.doc
        "Set this value to [true] to enable access control list (ACL) on the SMB file share. Set \
         it to [false] to map file and directory permissions to the POSIX permissions.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/filegateway/latest/files3/smb-acl.html}Using Windows ACLs \
         to limit SMB file share access} in the {i Amazon S3 File Gateway User Guide}.\n\
        \ \n\
        \  Valid Values: [true] | [false] \n\
        \  "]
  access_based_enumeration : boolean_ option;
      [@ocaml.doc
        "The files and folders on this share will only be visible to users with read access.\n"]
  admin_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that have administrator rights to the \
         file share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  valid_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that are allowed to access the file \
         share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  invalid_user_list : user_list option;
      [@ocaml.doc
        "A list of users or groups in the Active Directory that are not allowed to access the file \
         share. A group must be prefixed with the \\@ character. Acceptable formats include: \
         [DOMAIN\\User1], [user1], [@group1], and [@DOMAIN\\group1]. Can only be set if \
         Authentication is set to [ActiveDirectory].\n"]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for audit logs.\n"]
  case_sensitivity : case_sensitivity option;
      [@ocaml.doc
        "The case of an object name in an Amazon S3 bucket. For [ClientSpecified], the client \
         determines the case sensitivity. For [CaseSensitive], the gateway determines the case \
         sensitivity. The default value is [ClientSpecified].\n"]
  file_share_name : file_share_name option;
      [@ocaml.doc
        "The name of the file share. Optional.\n\n\
        \   [FileShareName] must be set if an S3 prefix name is set in [LocationARN], or if an \
         access point or access point alias is used.\n\
        \  \n\
        \   A valid SMB file share name cannot contain the following characters: \
         [\\[],[\\]],[#],[;],[<],[>],[:],[\"],[\\],[/],[|],[?],[*],[+], or ASCII control \
         characters [1-31].\n\
        \   \n\
        \    "]
  cache_attributes : cache_attributes option;
      [@ocaml.doc "Specifies refresh cache information for the file share.\n"]
  notification_policy : notification_policy option;
      [@ocaml.doc
        "The notification policy of the file share. [SettlingTimeInSeconds] controls the number of \
         seconds to wait after the last point in time a client wrote to a file before generating \
         an [ObjectUploaded] notification. Because clients can make many small writes to files, \
         it's best to set this parameter for as long as possible to avoid generating multiple \
         notifications for the same file in a small time period.\n\n\
        \   [SettlingTimeInSeconds] has no effect on the timing of the object uploading to Amazon \
         S3, only the timing of the notification.\n\
        \  \n\
        \   This setting is not meant to specify an exact time at which the notification will be \
         sent. In some cases, the gateway might require more than the specified delay time to \
         generate and send notifications.\n\
        \   \n\
        \     The following example sets [NotificationPolicy] on with [SettlingTimeInSeconds] set \
         to 60.\n\
        \     \n\
        \       [{\\\"Upload\\\": {\\\"SettlingTimeInSeconds\\\": 60}}] \n\
        \      \n\
        \       The following example sets [NotificationPolicy] off.\n\
        \       \n\
        \         [{}] \n\
        \        "]
  oplocks_enabled : boolean_ option;
      [@ocaml.doc
        "Specifies whether opportunistic locking is enabled for the SMB file share.\n\n\
        \  Enabling opportunistic locking on case-sensitive shares is not recommended for \
         workloads that involve access to files with the same name in different case.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
}
[@@ocaml.doc "UpdateSMBFileShareInput\n"]

type nonrec update_nfs_file_share_output = {
  file_share_ar_n : file_share_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the updated file share.\n"]
}
[@@ocaml.doc "UpdateNFSFileShareOutput\n"]

type nonrec update_nfs_file_share_input = {
  file_share_ar_n : file_share_ar_n;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the file share to be updated.\n"]
  encryption_type : encryption_type option;
      [@ocaml.doc
        "A value that specifies the type of server-side encryption that the file share will use \
         for the data that it stores in Amazon S3.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \    "]
  kms_encrypted : boolean_ option;
      [@ocaml.doc
        "Optional. Set to [true] to use Amazon S3 server-side encryption with your own KMS key \
         (SSE-KMS), or [false] to use a key managed by Amazon S3 (SSE-S3). To use dual-layer \
         encryption (DSSE-KMS), set the [EncryptionType] parameter instead.\n\n\
        \  We recommend using [EncryptionType] instead of [KMSEncrypted] to set the file share \
         encryption method. You do not need to provide values for both parameters.\n\
        \  \n\
        \   If values for both parameters exist in the same request, then the specified encryption \
         methods must not conflict. For example, if [EncryptionType] is [SseS3], then \
         [KMSEncrypted] must be [false]. If [EncryptionType] is [SseKms] or [DsseKms], then \
         [KMSEncrypted] must be [true].\n\
        \   \n\
        \     Valid Values: [true] | [false] \n\
        \     "]
  kms_key : kms_key option;
      [@ocaml.doc
        "Optional. The Amazon Resource Name (ARN) of a symmetric customer master key (CMK) used \
         for Amazon S3 server-side encryption. Storage Gateway does not support asymmetric CMKs. \
         This value must be set if [KMSEncrypted] is [true], or if [EncryptionType] is [SseKms] or \
         [DsseKms].\n"]
  nfs_file_share_defaults : nfs_file_share_defaults option;
      [@ocaml.doc "The default values for the file share. Optional.\n"]
  default_storage_class : storage_class option;
      [@ocaml.doc
        "The default storage class for objects put into an Amazon S3 bucket by the S3 File \
         Gateway. The default value is [S3_STANDARD]. Optional.\n\n\
        \ Valid Values: [S3_STANDARD] | [S3_INTELLIGENT_TIERING] | [S3_STANDARD_IA] | \
         [S3_ONEZONE_IA] \n\
        \ "]
  object_ac_l : object_ac_l option;
      [@ocaml.doc
        "A value that sets the access control list (ACL) permission for objects in the S3 bucket \
         that a S3 File Gateway puts objects into. The default value is [private].\n"]
  client_list : file_share_client_list option;
      [@ocaml.doc
        "The list of clients that are allowed to access the S3 File Gateway. The list must contain \
         either valid IPv4/IPv6 addresses or valid CIDR blocks.\n"]
  squash : squash option;
      [@ocaml.doc
        "The user mapped to anonymous user.\n\n\
        \ Valid values are the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   [RootSquash]: Only root is mapped to anonymous user.\n\
        \            \n\
        \             }\n\
        \        {-   [NoSquash]: No one is mapped to anonymous user.\n\
        \            \n\
        \             }\n\
        \        {-   [AllSquash]: Everyone is mapped to anonymous user.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  read_only : boolean_ option;
      [@ocaml.doc
        "A value that sets the write status of a file share. Set this value to [true] to set the \
         write status to read-only, otherwise set to [false].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  guess_mime_type_enabled : boolean_ option;
      [@ocaml.doc
        "A value that enables guessing of the MIME type for uploaded objects based on file \
         extensions. Set this value to [true] to enable MIME type guessing, otherwise set to \
         [false]. The default value is [true].\n\n\
        \ Valid Values: [true] | [false] \n\
        \ "]
  requester_pays : boolean_ option;
      [@ocaml.doc
        "A value that sets who pays the cost of the request and the cost associated with data \
         download from the S3 bucket. If this value is set to [true], the requester pays the \
         costs; otherwise, the S3 bucket owner pays. However, the S3 bucket owner always pays the \
         cost of storing data.\n\n\
        \   [RequesterPays] is a configuration for the S3 bucket that backs the file share, so \
         make sure that the configuration on the file share is the same as the S3 bucket \
         configuration.\n\
        \  \n\
        \    Valid Values: [true] | [false] \n\
        \    "]
  file_share_name : file_share_name option;
      [@ocaml.doc
        "The name of the file share. Optional.\n\n\
        \   [FileShareName] must be set if an S3 prefix name is set in [LocationARN], or if an \
         access point or access point alias is used.\n\
        \  \n\
        \   A valid NFS file share name can only contain the following characters: [a]-[z], \
         [A]-[Z], [0]-[9], [-], [.], and [_].\n\
        \   \n\
        \    "]
  cache_attributes : cache_attributes option;
      [@ocaml.doc "Specifies refresh cache information for the file share.\n"]
  notification_policy : notification_policy option;
      [@ocaml.doc
        "The notification policy of the file share. [SettlingTimeInSeconds] controls the number of \
         seconds to wait after the last point in time a client wrote to a file before generating \
         an [ObjectUploaded] notification. Because clients can make many small writes to files, \
         it's best to set this parameter for as long as possible to avoid generating multiple \
         notifications for the same file in a small time period.\n\n\
        \   [SettlingTimeInSeconds] has no effect on the timing of the object uploading to Amazon \
         S3, only the timing of the notification.\n\
        \  \n\
        \   This setting is not meant to specify an exact time at which the notification will be \
         sent. In some cases, the gateway might require more than the specified delay time to \
         generate and send notifications.\n\
        \   \n\
        \     The following example sets [NotificationPolicy] on with [SettlingTimeInSeconds] set \
         to 60.\n\
        \     \n\
        \       [{\\\"Upload\\\": {\\\"SettlingTimeInSeconds\\\": 60}}] \n\
        \      \n\
        \       The following example sets [NotificationPolicy] off.\n\
        \       \n\
        \         [{}] \n\
        \        "]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for audit logs.\n"]
}
[@@ocaml.doc "UpdateNFSFileShareInput\n"]

type nonrec update_maintenance_start_time_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway whose maintenance start \
   time is updated.\n"]

type nonrec update_maintenance_start_time_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  hour_of_day : hour_of_day option;
      [@ocaml.doc
        "The hour component of the maintenance start time represented as {i hh}, where {i hh} is \
         the hour (00 to 23). The hour of the day is in the time zone of the gateway.\n"]
  minute_of_hour : minute_of_hour option;
      [@ocaml.doc
        "The minute component of the maintenance start time represented as {i mm}, where {i mm} is \
         the minute (00 to 59). The minute of the hour is in the time zone of the gateway.\n"]
  day_of_week : day_of_week option;
      [@ocaml.doc
        "The day of the week component of the maintenance start time week represented as an \
         ordinal number from 0 to 6, where 0 represents Sunday and 6 represents Saturday.\n"]
  day_of_month : day_of_month option;
      [@ocaml.doc
        "The day of the month component of the maintenance start time represented as an ordinal \
         number from 1 to 28, where 1 represents the first day of the month. It is not possible to \
         set the maintenance schedule to start on days 29 through 31.\n"]
  software_update_preferences : software_update_preferences option;
      [@ocaml.doc
        "A set of variables indicating the software update preferences for the gateway.\n\n\
        \ Includes [AutomaticUpdatePolicy] field with the following inputs:\n\
        \ \n\
        \   [ALL_VERSIONS] - Enables regular gateway maintenance updates.\n\
        \  \n\
        \    [EMERGENCY_VERSIONS_ONLY] - Disables regular gateway maintenance updates. The gateway \
         will still receive emergency version updates on rare occasions if necessary to remedy \
         highly critical security or durability issues. You will be notified before an emergency \
         version update is applied. These updates are applied during your gateway's scheduled \
         maintenance window.\n\
        \   "]
}
[@@ocaml.doc
  "A JSON object containing the following fields:\n\n\
  \ {ul\n\
  \       {-   [UpdateMaintenanceStartTimeInput$SoftwareUpdatePreferences] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateMaintenanceStartTimeInput$DayOfMonth] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateMaintenanceStartTimeInput$DayOfWeek] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateMaintenanceStartTimeInput$HourOfDay] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateMaintenanceStartTimeInput$MinuteOfHour] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec update_gateway_software_now_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway that was updated.\n"]

type nonrec update_gateway_software_now_input = { gateway_ar_n : gateway_ar_n [@ocaml.doc ""] }
[@@ocaml.doc "A JSON object containing the Amazon Resource Name (ARN) of the gateway to update.\n"]

type nonrec update_gateway_information_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
  gateway_name : string_ option; [@ocaml.doc "The name you configured for your gateway.\n"]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway that was updated.\n"]

type nonrec update_gateway_information_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  gateway_name : gateway_name option; [@ocaml.doc ""]
  gateway_timezone : gateway_timezone option;
      [@ocaml.doc "A value that indicates the time zone of the gateway.\n"]
  cloud_watch_log_group_ar_n : cloud_watch_log_group_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that you want to use to \
         monitor and log events in the gateway.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/WhatIsCloudWatchLogs.html}What \
         is Amazon CloudWatch Logs?} \n\
        \ "]
  gateway_capacity : gateway_capacity option;
      [@ocaml.doc
        "Specifies the size of the gateway's metadata cache. This setting impacts gateway \
         performance and hardware recommendations. For more information, see \
         {{:https://docs.aws.amazon.com/filegateway/latest/files3/performance-multiple-file-shares.html}Performance \
         guidance for gateways with multiple file shares} in the {i Amazon S3 File Gateway User \
         Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec update_file_system_association_output = {
  file_system_association_ar_n : file_system_association_ar_n option;
      [@ocaml.doc "The ARN of the updated file system association.\n"]
}
[@@ocaml.doc ""]

type nonrec update_file_system_association_input = {
  file_system_association_ar_n : file_system_association_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the file system association that you want to update.\n"]
  user_name : domain_user_name option;
      [@ocaml.doc
        "The user name of the user credential that has permission to access the root share D$ of \
         the Amazon FSx file system. The user account must belong to the Amazon FSx delegated \
         admin user group.\n"]
  password : domain_user_password option; [@ocaml.doc "The password of the user credential.\n"]
  audit_destination_ar_n : audit_destination_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the storage used for the audit logs.\n"]
  cache_attributes : cache_attributes option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_chap_credentials_output = {
  target_ar_n : target_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target. This is the same target specified in the \
         request.\n"]
  initiator_name : iqn_name option;
      [@ocaml.doc
        "The iSCSI initiator that connects to the target. This is the same initiator name \
         specified in the request.\n"]
}
[@@ocaml.doc "A JSON object containing the following fields:\n"]

type nonrec update_chap_credentials_input = {
  target_ar_n : target_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the iSCSI volume target. Use the \
         [DescribeStorediSCSIVolumes] operation to return the TargetARN for specified VolumeARN.\n"]
  secret_to_authenticate_initiator : chap_secret;
      [@ocaml.doc
        "The secret key that the initiator (for example, the Windows client) must provide to \
         participate in mutual CHAP with the target.\n\n\
        \  The secret key must be between 12 and 16 bytes when encoded in UTF-8.\n\
        \  \n\
        \   "]
  initiator_name : iqn_name; [@ocaml.doc "The iSCSI initiator that connects to the target.\n"]
  secret_to_authenticate_target : chap_secret option;
      [@ocaml.doc
        "The secret key that the target must provide to participate in mutual CHAP with the \
         initiator (e.g. Windows client).\n\n\
        \ Byte constraints: Minimum bytes of 12. Maximum bytes of 16.\n\
        \ \n\
        \   The secret key must be between 12 and 16 bytes when encoded in UTF-8.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [UpdateChapCredentialsInput$InitiatorName] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateChapCredentialsInput$SecretToAuthenticateInitiator] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateChapCredentialsInput$SecretToAuthenticateTarget] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateChapCredentialsInput$TargetARN] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec update_bandwidth_rate_limit_schedule_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_bandwidth_rate_limit_schedule_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  bandwidth_rate_limit_intervals : bandwidth_rate_limit_intervals;
      [@ocaml.doc
        " An array containing bandwidth rate limit schedule intervals for a gateway. When no \
         bandwidth rate limit intervals have been scheduled, the array is empty. \n"]
}
[@@ocaml.doc ""]

type nonrec update_bandwidth_rate_limit_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A JSON object containing the Amazon Resource Name (ARN) of the gateway whose throttle \
   information was updated.\n"]

type nonrec update_bandwidth_rate_limit_input = {
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
  average_upload_rate_limit_in_bits_per_sec : bandwidth_upload_rate_limit option;
      [@ocaml.doc "The average upload bandwidth rate limit in bits per second.\n"]
  average_download_rate_limit_in_bits_per_sec : bandwidth_download_rate_limit option;
      [@ocaml.doc "The average download bandwidth rate limit in bits per second.\n"]
}
[@@ocaml.doc
  "A JSON object containing one or more of the following fields:\n\n\
  \ {ul\n\
  \       {-   [UpdateBandwidthRateLimitInput$AverageDownloadRateLimitInBitsPerSec] \n\
  \           \n\
  \            }\n\
  \       {-   [UpdateBandwidthRateLimitInput$AverageUploadRateLimitInBitsPerSec] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec update_automatic_tape_creation_policy_output = {
  gateway_ar_n : gateway_ar_n option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_automatic_tape_creation_policy_input = {
  automatic_tape_creation_rules : automatic_tape_creation_rules;
      [@ocaml.doc
        "An automatic tape creation policy consists of a list of automatic tape creation rules. \
         The rules determine when and how to automatically create new tapes.\n"]
  gateway_ar_n : gateway_ar_n; [@ocaml.doc ""]
}
[@@ocaml.doc ""]
