open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "ds";
      endpointPrefix = "ds";
      version = "2015-04-16";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec verify_trust_result =
  {
  trust_id: string option
    [@ocaml.doc
      "The unique Trust ID of the trust relationship that was verified.\n"]}
[@@ocaml.doc "Result of a VerifyTrust request.\n"]
type nonrec verify_trust_request =
  {
  trust_id: string
    [@ocaml.doc "The unique Trust ID of the trust relationship to verify.\n"]}
[@@ocaml.doc
  "Initiates the verification of an existing trust relationship between an Managed Microsoft AD directory and an external domain.\n"]
type nonrec unsupported_operation_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation is not supported.\n"]
type nonrec service_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "An exception has occurred in Directory Service.\n"]
type nonrec invalid_parameter_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "One or more parameters are not valid.\n"]
type nonrec entity_does_not_exist_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified entity could not be found.\n"]
type nonrec client_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A client exception has occurred.\n"]
type nonrec user_does_not_exist_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The user provided a username that does not exist in your directory.\n"]
type nonrec os_version =
  | VERSION_2019 [@ocaml.doc ""]
  | VERSION_2012 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec os_update_settings =
  {
  os_version: os_version option
    [@ocaml.doc " OS version that the directory needs to be updated to. \n"]}
[@@ocaml.doc " OS version that the directory needs to be updated to. \n"]
type nonrec update_value =
  {
  os_update_settings: os_update_settings option
    [@ocaml.doc " The OS update related settings. \n"]}[@@ocaml.doc
                                                         " The value for a given type of [UpdateSettings]. \n"]
type nonrec update_type =
  | OS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_trust_result =
  {
  trust_id: string option
    [@ocaml.doc "Identifier of the trust relationship.\n"];
  request_id: string option [@ocaml.doc ""]}[@@ocaml.doc ""]
type nonrec selective_auth =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_trust_request =
  {
  selective_auth: selective_auth option
    [@ocaml.doc "Updates selective authentication for the trust.\n"];
  trust_id: string [@ocaml.doc "Identifier of the trust relationship.\n"]}
[@@ocaml.doc ""]
type nonrec update_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | UPDATED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_settings_result =
  {
  directory_id: string option
    [@ocaml.doc "The identifier of the directory.\n"]}[@@ocaml.doc ""]
type nonrec setting =
  {
  value: string
    [@ocaml.doc
      "The value of the directory setting for which to retrieve information. For example, for [TLS_1_0], the valid values are: [Enable] and [Disable].\n"];
  name: string
    [@ocaml.doc
      "The name of the directory setting. For example:\n\n  [TLS_1_0] \n "]}
[@@ocaml.doc
  "Contains information about the configurable settings for a directory.\n"]
type nonrec update_settings_request =
  {
  settings: setting list [@ocaml.doc "The list of [Setting] objects.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to update settings.\n"]}
[@@ocaml.doc ""]
type nonrec unsupported_settings_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified directory setting is not supported.\n"]
type nonrec incompatible_settings_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified directory setting is not compatible with other settings.\n"]
type nonrec directory_unavailable_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified directory is unavailable or could not be found.\n"]
type nonrec directory_does_not_exist_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified directory does not exist in the system.\n"]
type nonrec radius_authentication_protocol =
  | MSCHAPV2 [@ocaml.doc ""]
  | MSCHAPV1 [@ocaml.doc ""]
  | CHAP [@ocaml.doc ""]
  | PAP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec radius_settings =
  {
  use_same_username: bool option [@ocaml.doc "Not currently used.\n"];
  display_label: string option [@ocaml.doc "Not currently used.\n"];
  authentication_protocol: radius_authentication_protocol option
    [@ocaml.doc "The protocol specified for your RADIUS endpoints.\n"];
  shared_secret: string option
    [@ocaml.doc "Required for enabling RADIUS on the directory.\n"];
  radius_retries: int option
    [@ocaml.doc
      "The maximum number of times that communication with the RADIUS server is attempted.\n"];
  radius_timeout: int option
    [@ocaml.doc
      "The amount of time, in seconds, to wait for the RADIUS server to respond.\n"];
  radius_port: int option
    [@ocaml.doc
      "The port that your RADIUS server is using for communications. Your self-managed network must allow inbound traffic over this port from the Directory Service servers.\n"];
  radius_servers: string list option
    [@ocaml.doc
      "An array of strings that contains the fully qualified domain name (FQDN) or IP addresses of the RADIUS server endpoints, or the FQDN or IP addresses of your RADIUS server load balancer.\n"]}
[@@ocaml.doc
  "Contains information about a Remote Authentication Dial In User Service (RADIUS) server.\n"]
type nonrec update_radius_request =
  {
  radius_settings: radius_settings
    [@ocaml.doc
      "A [RadiusSettings] object that contains information about the RADIUS server.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to update the RADIUS server information.\n"]}
[@@ocaml.doc "Contains the inputs for the [UpdateRadius] operation.\n"]
type nonrec update_number_of_domain_controllers_request =
  {
  desired_number: int
    [@ocaml.doc
      "The number of domain controllers desired in the directory.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier of the directory to which the domain controllers will be added or removed.\n"]}
[@@ocaml.doc ""]
type nonrec domain_controller_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum allowed number of domain controllers per directory was exceeded. The default limit per directory is 20 domain controllers.\n"]
type nonrec update_info_entry =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The last updated date and time of a particular directory setting. \n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The start time of the [UpdateDirectorySetup] for the particular type. \n"];
  previous_value: update_value option
    [@ocaml.doc " The old value of the target setting. \n"];
  new_value: update_value option
    [@ocaml.doc " The new value of the target setting. \n"];
  initiated_by: string option
    [@ocaml.doc
      " This specifies if the update was initiated by the customer or by the service team. \n"];
  status_reason: string option
    [@ocaml.doc
      " The reason for the current status of the update type activity. \n"];
  status: update_status option
    [@ocaml.doc " The status of the update performed on the directory. \n"];
  region: string option [@ocaml.doc " The name of the Region. \n"]}[@@ocaml.doc
                                                                    " An entry of update information related to a requested update type. \n"]
type nonrec update_directory_setup_request =
  {
  create_snapshot_before_update: bool option
    [@ocaml.doc
      " The boolean that specifies if a snapshot for the directory needs to be taken before updating the directory. \n"];
  os_update_settings: os_update_settings option
    [@ocaml.doc
      " The settings for the OS update that needs to be performed on the directory. \n"];
  update_type: update_type
    [@ocaml.doc
      " The type of update that needs to be performed on the directory. For example, OS. \n"];
  directory_id: string
    [@ocaml.doc
      " The identifier of the directory on which you want to perform the update. \n"]}
[@@ocaml.doc ""]
type nonrec snapshot_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum number of manual snapshots for the directory has been reached. You can use the [GetSnapshotLimits] operation to determine the snapshot limits for a directory.\n"]
type nonrec directory_in_desired_state_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           " The directory is already updated to desired update type settings. \n"]
type nonrec access_denied_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Client authentication is not available in this region at this time.\n"]
type nonrec update_conditional_forwarder_request =
  {
  dns_ip_addrs: string list
    [@ocaml.doc
      "The updated IP addresses of the remote DNS server associated with the conditional forwarder.\n"];
  remote_domain_name: string
    [@ocaml.doc
      "The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust relationship.\n"];
  directory_id: string
    [@ocaml.doc
      "The directory ID of the Amazon Web Services directory for which to update the conditional forwarder.\n"]}
[@@ocaml.doc "Updates a conditional forwarder.\n"]
type nonrec target_type =
  | ACCOUNT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec unshare_target =
  {
  type_: target_type
    [@ocaml.doc "Type of identifier to be used in the {i Id} field.\n"];
  id: string [@ocaml.doc "Identifier of the directory consumer account.\n"]}
[@@ocaml.doc
  "Identifier that contains details about the directory consumer account with whom the directory is being unshared.\n"]
type nonrec unshare_directory_result =
  {
  shared_directory_id: string option
    [@ocaml.doc
      "Identifier of the directory stored in the directory consumer account that is to be unshared from the specified directory ([DirectoryId]).\n"]}
[@@ocaml.doc ""]
type nonrec unshare_directory_request =
  {
  unshare_target: unshare_target
    [@ocaml.doc
      "Identifier for the directory consumer account with whom the directory has to be unshared.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the Managed Microsoft AD directory that you want to stop sharing.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_target_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified shared target is not valid.\n"]
type nonrec directory_not_shared_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified directory has not been shared with this Amazon Web Services account.\n"]
type nonrec trust_type =
  | EXTERNAL [@ocaml.doc ""]
  | FOREST [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec trust_direction =
  | TWO_WAY [@ocaml.doc ""]
  | ONE_WAY_INCOMING [@ocaml.doc ""]
  | ONE_WAY_OUTGOING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec trust_state =
  | FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | VERIFIED [@ocaml.doc ""]
  | VERIFY_FAILED [@ocaml.doc ""]
  | VERIFYING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec trust =
  {
  selective_auth: selective_auth option
    [@ocaml.doc "Current state of selective authentication for the trust.\n"];
  trust_state_reason: string option
    [@ocaml.doc "The reason for the TrustState.\n"];
  state_last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the TrustState was last updated.\n"];
  last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the trust relationship was last updated.\n"];
  created_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the trust relationship was created.\n"];
  trust_state: trust_state option
    [@ocaml.doc "The trust relationship state.\n"];
  trust_direction: trust_direction option
    [@ocaml.doc "The trust relationship direction.\n"];
  trust_type: trust_type option
    [@ocaml.doc "The trust relationship type. [Forest] is the default.\n"];
  remote_domain_name: string option
    [@ocaml.doc
      "The Fully Qualified Domain Name (FQDN) of the external domain involved in the trust relationship.\n"];
  trust_id: string option
    [@ocaml.doc "The unique ID of the trust relationship.\n"];
  directory_id: string option
    [@ocaml.doc
      "The Directory ID of the Amazon Web Services directory involved in the trust relationship.\n"]}
[@@ocaml.doc
  "Describes a trust relationship between an Managed Microsoft AD directory and an external domain.\n"]
type nonrec topic_status =
  | DELETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | TOPIC_NOT_FOUND [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec tag =
  {
  value: string
    [@ocaml.doc
      "The optional value of the tag. The string value can be Unicode characters. The string can contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex: \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"];
  key: string
    [@ocaml.doc
      "Required name of the tag. The string value can be Unicode characters and cannot be prefixed with \"aws:\". The string can contain only the set of Unicode letters, digits, white-space, '_', '.', '/', '=', '+', '-' (Java regex: \"^(\\[\\\\p\\{L\\}\\\\p\\{Z\\}\\\\p\\{N\\}_.:/=+\\\\-\\]*)$\").\n"]}
[@@ocaml.doc
  "Metadata assigned to a directory consisting of a key-value pair.\n"]
type nonrec tag_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum allowed number of tags was exceeded.\n"]
type nonrec start_schema_extension_result =
  {
  schema_extension_id: string option
    [@ocaml.doc
      "The identifier of the schema extension that will be applied.\n"]}
[@@ocaml.doc ""]
type nonrec start_schema_extension_request =
  {
  description: string [@ocaml.doc "A description of the schema extension.\n"];
  ldif_content: string
    [@ocaml.doc
      "The LDIF file represented as a string. To construct the LdifContent string, precede each line as it would be formatted in an ldif file with \\n. See the example request below for more details. The file size can be no larger than 1MB.\n"];
  create_snapshot_before_schema_extension: bool
    [@ocaml.doc
      "If true, creates a snapshot of the directory before applying the schema extension.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which the schema extension will be applied to.\n"]}
[@@ocaml.doc ""]
type nonrec snapshot_type =
  | MANUAL [@ocaml.doc ""]
  | AUTO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec snapshot_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec snapshot =
  {
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the snapshot was taken.\n"];
  status: snapshot_status option [@ocaml.doc "The snapshot status.\n"];
  name: string option [@ocaml.doc "The descriptive name of the snapshot.\n"];
  type_: snapshot_type option [@ocaml.doc "The snapshot type.\n"];
  snapshot_id: string option [@ocaml.doc "The snapshot identifier.\n"];
  directory_id: string option [@ocaml.doc "The directory identifier.\n"]}
[@@ocaml.doc "Describes a directory snapshot.\n"]
type nonrec snapshot_limits =
  {
  manual_snapshots_limit_reached: bool option
    [@ocaml.doc "Indicates if the manual snapshot limit has been reached.\n"];
  manual_snapshots_current_count: int option
    [@ocaml.doc "The current number of manual snapshots of the directory.\n"];
  manual_snapshots_limit: int option
    [@ocaml.doc "The maximum number of manual snapshots allowed.\n"]}
[@@ocaml.doc "Contains manual snapshot limit information for a directory.\n"]
type nonrec share_method =
  | HANDSHAKE [@ocaml.doc ""]
  | ORGANIZATIONS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec share_status =
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | SHARE_FAILED [@ocaml.doc ""]
  | SHARING [@ocaml.doc ""]
  | REJECT_FAILED [@ocaml.doc ""]
  | REJECTING [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | PENDING_ACCEPTANCE [@ocaml.doc ""]
  | SHARED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec shared_directory =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the shared directory was last updated.\n"];
  created_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the shared directory was created.\n"];
  share_notes: string option
    [@ocaml.doc
      "A directory share request that is sent by the directory owner to the directory consumer. The request includes a typed message to help the directory consumer administrator determine whether to approve or reject the share invitation.\n"];
  share_status: share_status option
    [@ocaml.doc
      "Current directory status of the shared Managed Microsoft AD directory.\n"];
  shared_directory_id: string option
    [@ocaml.doc
      "Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account.\n"];
  shared_account_id: string option
    [@ocaml.doc
      "Identifier of the directory consumer account that has access to the shared directory ([OwnerDirectoryId]) in the directory owner account.\n"];
  share_method: share_method option
    [@ocaml.doc
      "The method used when sharing a directory to determine whether the directory should be shared within your Amazon Web Services organization ([ORGANIZATIONS]) or with any Amazon Web Services account by sending a shared directory request ([HANDSHAKE]).\n"];
  owner_directory_id: string option
    [@ocaml.doc
      "Identifier of the directory in the directory owner account. \n"];
  owner_account_id: string option
    [@ocaml.doc
      "Identifier of the directory owner account, which contains the directory that has been shared to the consumer account.\n"]}
[@@ocaml.doc
  "Details about the shared directory in the directory owner account for which the share request in the directory consumer account has been accepted.\n"]
type nonrec share_target =
  {
  type_: target_type
    [@ocaml.doc "Type of identifier to be used in the [Id] field.\n"];
  id: string [@ocaml.doc "Identifier of the directory consumer account.\n"]}
[@@ocaml.doc
  "Identifier that contains details about the directory consumer account.\n"]
type nonrec share_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum number of Amazon Web Services accounts that you can share with this directory has been reached.\n"]
type nonrec share_directory_result =
  {
  shared_directory_id: string option
    [@ocaml.doc
      "Identifier of the directory that is stored in the directory consumer account that is shared from the specified directory ([DirectoryId]).\n"]}
[@@ocaml.doc ""]
type nonrec share_directory_request =
  {
  share_method: share_method
    [@ocaml.doc
      "The method used when sharing a directory to determine whether the directory should be shared within your Amazon Web Services organization ([ORGANIZATIONS]) or with any Amazon Web Services account by sending a directory sharing request ([HANDSHAKE]).\n"];
  share_target: share_target
    [@ocaml.doc
      "Identifier for the directory consumer account with whom the directory is to be shared.\n"];
  share_notes: string option
    [@ocaml.doc
      "A directory share request that is sent by the directory owner to the directory consumer. The request includes a typed message to help the directory consumer administrator determine whether to approve or reject the share invitation.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier of the Managed Microsoft AD directory that you want to share with other Amazon Web Services accounts.\n"]}
[@@ocaml.doc ""]
type nonrec organizations_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception encountered while trying to access your Amazon Web Services organization.\n"]
type nonrec directory_already_shared_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified directory has already been shared with this Amazon Web Services account.\n"]
type nonrec directory_configuration_status =
  | DEFAULT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | REQUESTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec directory_configuration_setting_request_detailed_status =
  (string * directory_configuration_status) list[@@ocaml.doc ""]
type nonrec setting_entry =
  {
  data_type: string option
    [@ocaml.doc
      "The data type of a directory setting. This is used to define the [AllowedValues] of a setting. For example a data type can be [Boolean], [DurationInSeconds], or [Enum].\n"];
  last_requested_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when the request to update a directory setting was last submitted.\n"];
  last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when the directory setting was last updated.\n"];
  request_status_message: string option
    [@ocaml.doc
      "The last status message for the directory status request.\n"];
  request_detailed_status:
    directory_configuration_setting_request_detailed_status option
    [@ocaml.doc
      "Details about the status of the request to update the directory setting. If the directory setting is deployed in more than one region, status is returned for the request in each region where the setting is deployed.\n"];
  request_status: directory_configuration_status option
    [@ocaml.doc
      "The overall status of the request to update the directory setting request. If the directory setting is deployed in more than one region, and the request fails in any region, the overall status is [Failed].\n"];
  requested_value: string option
    [@ocaml.doc
      "The value that was last requested for the directory setting.\n"];
  applied_value: string option
    [@ocaml.doc
      "The value of the directory setting that is applied to the directory.\n"];
  allowed_values: string option
    [@ocaml.doc
      "The valid range of values for the directory setting. These values depend on the [DataType] of your directory.\n"];
  name: string option
    [@ocaml.doc
      "The name of the directory setting. For example:\n\n  [TLS_1_0] \n "];
  type_: string option
    [@ocaml.doc
      "The type, or category, of a directory setting. Similar settings have the same type. For example, [Protocol], [Cipher], or [Certificate-Based Authentication].\n"]}
[@@ocaml.doc
  "Contains information about the specified configurable setting for a directory.\n"]
type nonrec schema_extension_status =
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | CANCEL_IN_PROGRESS [@ocaml.doc ""]
  | REPLICATING [@ocaml.doc ""]
  | UPDATING_SCHEMA [@ocaml.doc ""]
  | CREATING_SNAPSHOT [@ocaml.doc ""]
  | INITIALIZING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec schema_extension_info =
  {
  end_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the schema extension was completed.\n"];
  start_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the schema extension started being applied to the directory.\n"];
  schema_extension_status_reason: string option
    [@ocaml.doc "The reason for the [SchemaExtensionStatus].\n"];
  schema_extension_status: schema_extension_status option
    [@ocaml.doc "The current status of the schema extension.\n"];
  description: string option
    [@ocaml.doc "A description of the schema extension.\n"];
  schema_extension_id: string option
    [@ocaml.doc "The identifier of the schema extension.\n"];
  directory_id: string option
    [@ocaml.doc
      "The identifier of the directory to which the schema extension is applied.\n"]}
[@@ocaml.doc "Information about a schema extension.\n"]
type nonrec restore_from_snapshot_request =
  {
  snapshot_id: string
    [@ocaml.doc "The identifier of the snapshot to restore from.\n"]}
[@@ocaml.doc
  "An object representing the inputs for the [RestoreFromSnapshot] operation.\n"]
type nonrec reset_user_password_request =
  {
  new_password: string [@ocaml.doc "The new password that will be reset.\n"];
  user_name: string
    [@ocaml.doc "The user name of the user whose password will be reset.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier of the Managed Microsoft AD or Simple AD directory in which the user resides.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_password_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The new password provided by the user does not meet the password complexity requirements defined in your directory.\n"]
type nonrec replication_scope =
  | Domain [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec remove_tags_from_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc "The tag key (name) of the tag to be removed.\n"];
  resource_id: string
    [@ocaml.doc
      "Identifier (ID) of the directory from which to remove the tag.\n"]}
[@@ocaml.doc ""]
type nonrec remove_region_request =
  {
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which you want to remove Region replication.\n"]}
[@@ocaml.doc ""]
type nonrec remove_ip_routes_request =
  {
  cidr_ips: string list
    [@ocaml.doc "IP address blocks that you want to remove.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier (ID) of the directory from which you want to remove the IP addresses.\n"]}
[@@ocaml.doc ""]
type nonrec reject_shared_directory_result =
  {
  shared_directory_id: string option
    [@ocaml.doc
      "Identifier of the shared directory in the directory consumer account.\n"]}
[@@ocaml.doc ""]
type nonrec reject_shared_directory_request =
  {
  shared_directory_id: string
    [@ocaml.doc
      "Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account.\n"]}
[@@ocaml.doc ""]
type nonrec register_event_topic_request =
  {
  topic_name: string
    [@ocaml.doc
      "The Amazon SNS topic name to which the directory will publish status messages. This Amazon SNS topic must be in the same region as the specified Directory ID.\n"];
  directory_id: string
    [@ocaml.doc
      "The Directory ID that will publish status messages to the Amazon SNS topic.\n"]}
[@@ocaml.doc "Registers a new event topic.\n"]
type nonrec register_certificate_result =
  {
  certificate_id: string option
    [@ocaml.doc "The identifier of the certificate.\n"]}[@@ocaml.doc ""]
type nonrec certificate_type =
  | CLIENT_LDAPS [@ocaml.doc ""]
  | CLIENT_CERT_AUTH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec client_cert_auth_settings =
  {
  ocsp_url: string option
    [@ocaml.doc
      "Specifies the URL of the default OCSP server used to check for revocation status. A secondary value to any OCSP address found in the AIA extension of the user certificate.\n"]}
[@@ocaml.doc
  "Contains information about the client certificate authentication settings for the [RegisterCertificate] and [DescribeCertificate] operations. \n"]
type nonrec register_certificate_request =
  {
  client_cert_auth_settings: client_cert_auth_settings option
    [@ocaml.doc
      "A [ClientCertAuthSettings] object that contains client certificate authentication settings.\n"];
  type_: certificate_type option
    [@ocaml.doc
      "The function that the registered certificate performs. Valid values include [ClientLDAPS] or [ClientCertAuth]. The default value is [ClientLDAPS].\n"];
  certificate_data: string
    [@ocaml.doc "The certificate PEM string that needs to be registered.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_certificate_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The certificate PEM that was provided has incorrect encoding.\n"]
type nonrec certificate_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The certificate could not be added because the certificate limit has been reached.\n"]
type nonrec certificate_already_exists_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The certificate has already been registered into the system.\n"]
type nonrec regions_info =
  {
  additional_regions: string list option
    [@ocaml.doc
      "Lists the Regions where the directory has been replicated, excluding the primary Region.\n"];
  primary_region: string option
    [@ocaml.doc
      "The Region where the Managed Microsoft AD directory was originally created.\n"]}
[@@ocaml.doc
  "Provides information about the Regions that are configured for multi-Region replication.\n"]
type nonrec region_type =
  | ADDITIONAL [@ocaml.doc ""]
  | PRIMARY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec directory_stage =
  | FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | RESTOREFAILED [@ocaml.doc ""]
  | RESTORING [@ocaml.doc ""]
  | IMPAIRED [@ocaml.doc ""]
  | INOPERABLE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | REQUESTED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec directory_vpc_settings =
  {
  subnet_ids: string list
    [@ocaml.doc
      "The identifiers of the subnets for the directory servers. The two subnets must be in different Availability Zones. Directory Service creates a directory server and a DNS server in each of these subnets.\n"];
  vpc_id: string
    [@ocaml.doc
      "The identifier of the VPC in which to create the directory.\n"]}
[@@ocaml.doc
  "Contains VPC information for the [CreateDirectory] or [CreateMicrosoftAD] operation.\n"]
type nonrec region_description =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the Region description was last updated.\n"];
  status_last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the Region status was last updated.\n"];
  launch_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Specifies when the Region replication began.\n"];
  desired_number_of_domain_controllers: int option
    [@ocaml.doc
      "The desired number of domain controllers in the specified Region for the specified directory.\n"];
  vpc_settings: directory_vpc_settings option [@ocaml.doc ""];
  status: directory_stage option
    [@ocaml.doc
      "The status of the replication process for the specified Region.\n"];
  region_type: region_type option
    [@ocaml.doc
      "Specifies whether the Region is the primary Region or an additional Region.\n"];
  region_name: string option
    [@ocaml.doc "The name of the Region. For example, [us-east-1].\n"];
  directory_id: string option
    [@ocaml.doc "The identifier of the directory.\n"]}[@@ocaml.doc
                                                        "The replicated Region information for a directory.\n"]
type nonrec region_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You have reached the limit for maximum number of simultaneous Region replications per directory.\n"]
type nonrec radius_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec directory_vpc_settings_description =
  {
  availability_zones: string list option
    [@ocaml.doc "The list of Availability Zones that the directory is in.\n"];
  security_group_id: string option
    [@ocaml.doc
      "The domain controller security group identifier for the directory.\n"];
  subnet_ids: string list option
    [@ocaml.doc
      "The identifiers of the subnets for the directory servers.\n"];
  vpc_id: string option
    [@ocaml.doc "The identifier of the VPC that the directory is in.\n"]}
[@@ocaml.doc "Contains information about the directory.\n"]
type nonrec owner_directory_description =
  {
  radius_status: radius_status option
    [@ocaml.doc "Information about the status of the RADIUS server.\n"];
  radius_settings: radius_settings option
    [@ocaml.doc
      "A [RadiusSettings] object that contains information about the RADIUS server.\n"];
  vpc_settings: directory_vpc_settings_description option
    [@ocaml.doc "Information about the VPC settings for the directory.\n"];
  dns_ip_addrs: string list option
    [@ocaml.doc
      "IP address of the directory\226\128\153s domain controllers.\n"];
  account_id: string option
    [@ocaml.doc "Identifier of the directory owner account.\n"];
  directory_id: string option
    [@ocaml.doc
      "Identifier of the Managed Microsoft AD directory in the directory owner account.\n"]}
[@@ocaml.doc
  "Describes the directory owner account details that have been shared to the directory consumer account.\n"]
type nonrec no_available_certificate_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Client authentication setup could not be completed because at least one valid certificate must be registered in the system.\n"]
type nonrec log_subscription =
  {
  subscription_created_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the log subscription was created.\n"];
  log_group_name: string option [@ocaml.doc "The name of the log group.\n"];
  directory_id: string option
    [@ocaml.doc
      "Identifier (ID) of the directory that you want to associate with the log subscription.\n"]}
[@@ocaml.doc
  "Represents a log subscription, which tracks real-time data from a chosen log group to a specified destination.\n"]
type nonrec list_tags_for_resource_result =
  {
  next_token: string option [@ocaml.doc "Reserved for future use.\n"];
  tags: tag list option
    [@ocaml.doc
      "List of tags returned by the ListTagsForResource operation.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  limit: int option [@ocaml.doc "Reserved for future use.\n"];
  next_token: string option [@ocaml.doc "Reserved for future use.\n"];
  resource_id: string
    [@ocaml.doc
      "Identifier (ID) of the directory for which you want to retrieve tags.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_next_token_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The [NextToken] value is not valid.\n"]
type nonrec list_schema_extensions_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [ListSchemaExtensions] to retrieve the next set of items.\n"];
  schema_extensions_info: schema_extension_info list option
    [@ocaml.doc
      "Information about the schema extensions applied to the directory.\n"]}
[@@ocaml.doc ""]
type nonrec list_schema_extensions_request =
  {
  limit: int option [@ocaml.doc "The maximum number of items to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The [ListSchemaExtensions.NextToken] value from a previous call to [ListSchemaExtensions]. Pass null if this is the first call.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory from which to retrieve the schema extension information.\n"]}
[@@ocaml.doc ""]
type nonrec list_log_subscriptions_result =
  {
  next_token: string option
    [@ocaml.doc "The token for the next set of items to return.\n"];
  log_subscriptions: log_subscription list option
    [@ocaml.doc
      "A list of active [LogSubscription] objects for calling the Amazon Web Services account.\n"]}
[@@ocaml.doc ""]
type nonrec list_log_subscriptions_request =
  {
  limit: int option [@ocaml.doc "The maximum number of items returned.\n"];
  next_token: string option
    [@ocaml.doc "The token for the next set of items to return.\n"];
  directory_id: string option
    [@ocaml.doc
      "If a {i DirectoryID} is provided, lists only the log subscription associated with that directory. If no {i DirectoryId} is provided, lists all log subscriptions associated with your Amazon Web Services account. If there are no log subscriptions for the Amazon Web Services account or the directory, an empty list will be returned.\n"]}
[@@ocaml.doc ""]
type nonrec ip_route_status_msg =
  | REMOVE_FAILED [@ocaml.doc ""]
  | ADD_FAILED [@ocaml.doc ""]
  | REMOVED [@ocaml.doc ""]
  | REMOVING [@ocaml.doc ""]
  | ADDED [@ocaml.doc ""]
  | ADDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ip_route_info =
  {
  description: string option
    [@ocaml.doc "Description of the [IpRouteInfo].\n"];
  ip_route_status_reason: string option
    [@ocaml.doc "The reason for the IpRouteStatusMsg.\n"];
  added_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time the address block was added to the directory.\n"];
  ip_route_status_msg: ip_route_status_msg option
    [@ocaml.doc "The status of the IP address block.\n"];
  cidr_ip: string option [@ocaml.doc "IP address block in the [IpRoute].\n"];
  directory_id: string option
    [@ocaml.doc
      "Identifier (ID) of the directory associated with the IP addresses.\n"]}
[@@ocaml.doc "Information about one or more IP address blocks.\n"]
type nonrec list_ip_routes_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, more results are available. Pass this value for the {i NextToken} parameter in a subsequent call to [ListIpRoutes] to retrieve the next set of items.\n"];
  ip_routes_info: ip_route_info list option
    [@ocaml.doc "A list of [IpRoute]s.\n"]}[@@ocaml.doc ""]
type nonrec list_ip_routes_request =
  {
  limit: int option
    [@ocaml.doc
      "Maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation.\n"];
  next_token: string option
    [@ocaml.doc
      "The {i ListIpRoutes.NextToken} value from a previous call to [ListIpRoutes]. Pass null if this is the first call.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier (ID) of the directory for which you want to retrieve the IP addresses.\n"]}
[@@ocaml.doc ""]
type nonrec certificate_state =
  | DEREGISTER_FAILED [@ocaml.doc ""]
  | DEREGISTERED [@ocaml.doc ""]
  | DEREGISTERING [@ocaml.doc ""]
  | REGISTER_FAILED [@ocaml.doc ""]
  | REGISTERED [@ocaml.doc ""]
  | REGISTERING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec certificate_info =
  {
  type_: certificate_type option
    [@ocaml.doc
      "The function that the registered certificate performs. Valid values include [ClientLDAPS] or [ClientCertAuth]. The default value is [ClientLDAPS].\n"];
  expiry_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time when the certificate will expire.\n"];
  state: certificate_state option
    [@ocaml.doc "The state of the certificate.\n"];
  common_name: string option
    [@ocaml.doc "The common name for the certificate.\n"];
  certificate_id: string option
    [@ocaml.doc "The identifier of the certificate.\n"]}[@@ocaml.doc
                                                          "Contains general information about a certificate.\n"]
type nonrec list_certificates_result =
  {
  certificates_info: certificate_info list option
    [@ocaml.doc
      "A list of certificates with basic details including certificate ID, certificate common name, certificate state.\n"];
  next_token: string option
    [@ocaml.doc
      "Indicates whether another page of certificates is available when the number of available certificates exceeds the page limit.\n"]}
[@@ocaml.doc ""]
type nonrec list_certificates_request =
  {
  limit: int option
    [@ocaml.doc "The number of items that should show up on one page\n"];
  next_token: string option
    [@ocaml.doc
      "A token for requesting another page of certificates if the [NextToken] response element indicates that more certificates are available. Use the value of the returned [NextToken] element in your request until the token comes back as [null]. Pass [null] if this is the first call.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec ldaps_type =
  | CLIENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ldaps_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLE_FAILED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ldaps_setting_info =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when the LDAPS settings were last updated.\n"];
  ldaps_status_reason: string option
    [@ocaml.doc "Describes a state change for LDAPS.\n"];
  ldaps_status: ldaps_status option
    [@ocaml.doc "The state of the LDAPS settings.\n"]}[@@ocaml.doc
                                                        "Contains general information about the LDAPS settings.\n"]
type nonrec ip_route =
  {
  description: string option
    [@ocaml.doc "Description of the address block.\n"];
  cidr_ip: string option
    [@ocaml.doc
      "IP address block using CIDR format, for example 10.0.0.0/24. This is often the address block of the DNS server used for your self-managed domain. For a single IP address use a CIDR address block with /32. For example 10.0.0.0/32.\n"]}
[@@ocaml.doc
  "IP address block. This is often the address block of the DNS server used for your self-managed domain. \n"]
type nonrec ip_route_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum allowed number of IP addresses was exceeded. The default limit is 100 IP address blocks.\n"]
type nonrec invalid_ldaps_status_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The LDAP activities could not be performed because they are limited by the LDAPS status.\n"]
type nonrec invalid_client_auth_status_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Client authentication is already enabled.\n"]
type nonrec insufficient_permissions_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The account does not have sufficient permission to perform the operation.\n"]
type nonrec get_snapshot_limits_result =
  {
  snapshot_limits: snapshot_limits option
    [@ocaml.doc
      "A [SnapshotLimits] object that contains the manual snapshot limits for the specified directory.\n"]}
[@@ocaml.doc "Contains the results of the [GetSnapshotLimits] operation.\n"]
type nonrec get_snapshot_limits_request =
  {
  directory_id: string
    [@ocaml.doc
      "Contains the identifier of the directory to obtain the limits for.\n"]}
[@@ocaml.doc "Contains the inputs for the [GetSnapshotLimits] operation.\n"]
type nonrec directory_limits =
  {
  connected_directories_limit_reached: bool option
    [@ocaml.doc
      "Indicates if the connected directory limit has been reached.\n"];
  connected_directories_current_count: int option
    [@ocaml.doc
      "The current number of connected directories in the Region.\n"];
  connected_directories_limit: int option
    [@ocaml.doc
      "The maximum number of connected directories allowed in the Region.\n"];
  cloud_only_microsoft_ad_limit_reached: bool option
    [@ocaml.doc
      "Indicates if the Managed Microsoft AD directory limit has been reached.\n"];
  cloud_only_microsoft_ad_current_count: int option
    [@ocaml.doc
      "The current number of Managed Microsoft AD directories in the region.\n"];
  cloud_only_microsoft_ad_limit: int option
    [@ocaml.doc
      "The maximum number of Managed Microsoft AD directories allowed in the region.\n"];
  cloud_only_directories_limit_reached: bool option
    [@ocaml.doc "Indicates if the cloud directory limit has been reached.\n"];
  cloud_only_directories_current_count: int option
    [@ocaml.doc "The current number of cloud directories in the Region.\n"];
  cloud_only_directories_limit: int option
    [@ocaml.doc
      "The maximum number of cloud directories allowed in the Region.\n"]}
[@@ocaml.doc "Contains directory limit information for a Region.\n"]
type nonrec get_directory_limits_result =
  {
  directory_limits: directory_limits option
    [@ocaml.doc
      "A [DirectoryLimits] object that contains the directory limits for the current Region.\n"]}
[@@ocaml.doc "Contains the results of the [GetDirectoryLimits] operation.\n"]
type nonrec event_topic =
  {
  status: topic_status option [@ocaml.doc "The topic registration status.\n"];
  created_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time of when you associated your directory with the Amazon SNS topic.\n"];
  topic_arn: string option
    [@ocaml.doc "The Amazon SNS topic ARN (Amazon Resource Name).\n"];
  topic_name: string option
    [@ocaml.doc
      "The name of an Amazon SNS topic the receives status messages from the directory.\n"];
  directory_id: string option
    [@ocaml.doc
      "The Directory ID of an Directory Service directory that will publish status messages to an Amazon SNS topic.\n"]}
[@@ocaml.doc
  "Information about Amazon SNS topic and Directory Service directory associations.\n"]
type nonrec entity_already_exists_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified entity already exists.\n"]
type nonrec enable_sso_request =
  {
  password: string option
    [@ocaml.doc
      "The password of an alternate account to use to enable single-sign on. This is only used for AD Connector directories. For more information, see the {i UserName} parameter.\n"];
  user_name: string option
    [@ocaml.doc
      "The username of an alternate account to use to enable single-sign on. This is only used for AD Connector directories. This account must have privileges to add a service principal name.\n\n If the AD Connector service account does not have privileges to add a service principal name, you can specify an alternate account with the {i UserName} and {i Password} parameters. These credentials are only used to enable single sign-on and are not stored by the service. The AD Connector service account is not changed.\n "];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to enable single-sign on.\n"]}
[@@ocaml.doc "Contains the inputs for the [EnableSso] operation.\n"]
type nonrec authentication_failed_exception =
  {
  request_id: string option
    [@ocaml.doc "The identifier of the request that caused the exception.\n"];
  message: string option
    [@ocaml.doc "The textual message for the exception.\n"]}[@@ocaml.doc
                                                              "An authentication error occurred.\n"]
type nonrec enable_radius_request =
  {
  radius_settings: radius_settings
    [@ocaml.doc
      "A [RadiusSettings] object that contains information about the RADIUS server.\n"];
  directory_id: string
    [@ocaml.doc "The identifier of the directory for which to enable MFA.\n"]}
[@@ocaml.doc "Contains the inputs for the [EnableRadius] operation.\n"]
type nonrec enable_ldaps_request =
  {
  type_: ldaps_type
    [@ocaml.doc
      "The type of LDAP security to enable. Currently only the value [Client] is supported.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec client_authentication_type =
  | SMART_CARD_OR_PASSWORD [@ocaml.doc ""]
  | SMART_CARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec enable_client_authentication_request =
  {
  type_: client_authentication_type
    [@ocaml.doc
      "The type of client authentication to enable. Currently only the value [SmartCard] is supported. Smart card authentication in AD Connector requires that you enable Kerberos Constrained Delegation for the Service User to the LDAP service in your self-managed AD. \n"];
  directory_id: string
    [@ocaml.doc "The identifier of the specified directory. \n"]}[@@ocaml.doc
                                                                   ""]
type nonrec domain_controller_status =
  | FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | RESTORING [@ocaml.doc ""]
  | IMPAIRED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec domain_controller =
  {
  status_last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the status was last updated.\n"];
  launch_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Specifies when the domain controller was created.\n"];
  status_reason: string option
    [@ocaml.doc "A description of the domain controller state.\n"];
  status: domain_controller_status option
    [@ocaml.doc "The status of the domain controller.\n"];
  availability_zone: string option
    [@ocaml.doc
      "The Availability Zone where the domain controller is located.\n"];
  subnet_id: string option
    [@ocaml.doc
      "Identifier of the subnet in the VPC that contains the domain controller.\n"];
  vpc_id: string option
    [@ocaml.doc
      "The identifier of the VPC that contains the domain controller.\n"];
  dns_ip_addr: string option
    [@ocaml.doc "The IP address of the domain controller.\n"];
  domain_controller_id: string option
    [@ocaml.doc
      "Identifies a specific domain controller in the directory.\n"];
  directory_id: string option
    [@ocaml.doc
      "Identifier of the directory where the domain controller resides.\n"]}
[@@ocaml.doc
  "Contains information about the domain controllers for a specified directory.\n"]
type nonrec disable_sso_request =
  {
  password: string option
    [@ocaml.doc
      "The password of an alternate account to use to disable single-sign on. This is only used for AD Connector directories. For more information, see the {i UserName} parameter.\n"];
  user_name: string option
    [@ocaml.doc
      "The username of an alternate account to use to disable single-sign on. This is only used for AD Connector directories. This account must have privileges to remove a service principal name.\n\n If the AD Connector service account does not have privileges to remove a service principal name, you can specify an alternate account with the {i UserName} and {i Password} parameters. These credentials are only used to disable single sign-on and are not stored by the service. The AD Connector service account is not changed.\n "];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to disable single-sign on.\n"]}
[@@ocaml.doc "Contains the inputs for the [DisableSso] operation.\n"]
type nonrec disable_radius_request =
  {
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to disable MFA.\n"]}
[@@ocaml.doc "Contains the inputs for the [DisableRadius] operation.\n"]
type nonrec disable_ldaps_request =
  {
  type_: ldaps_type
    [@ocaml.doc
      "The type of LDAP security to enable. Currently only the value [Client] is supported.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec disable_client_authentication_request =
  {
  type_: client_authentication_type
    [@ocaml.doc
      "The type of client authentication to disable. Currently, only the parameter, [SmartCard] is supported.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory \n"]}
[@@ocaml.doc ""]
type nonrec directory_type =
  | SHARED_MICROSOFT_AD [@ocaml.doc ""]
  | MICROSOFT_AD [@ocaml.doc ""]
  | AD_CONNECTOR [@ocaml.doc ""]
  | SIMPLE_AD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec directory_size =
  | LARGE [@ocaml.doc ""]
  | SMALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec describe_update_directory_result =
  {
  next_token: string option
    [@ocaml.doc
      " If not null, more results are available. Pass this value for the [NextToken] parameter. \n"];
  update_activities: update_info_entry list option
    [@ocaml.doc
      " The list of update activities on a directory for the requested update type. \n"]}
[@@ocaml.doc ""]
type nonrec describe_update_directory_request =
  {
  next_token: string option
    [@ocaml.doc
      " The [DescribeUpdateDirectoryResult]. NextToken value from a previous call to [DescribeUpdateDirectory]. Pass null if this is the first call. \n"];
  region_name: string option [@ocaml.doc " The name of the Region. \n"];
  update_type: update_type
    [@ocaml.doc
      " The type of updates you want to describe for the directory. \n"];
  directory_id: string
    [@ocaml.doc " The unique identifier of the directory. \n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_trusts_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, more results are available. Pass this value for the {i NextToken} parameter in a subsequent call to [DescribeTrusts] to retrieve the next set of items.\n"];
  trusts: trust list option
    [@ocaml.doc
      "The list of Trust objects that were retrieved.\n\n It is possible that this list contains less than the number of items specified in the {i Limit} member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.\n "]}
[@@ocaml.doc "The result of a DescribeTrust request.\n"]
type nonrec describe_trusts_request =
  {
  limit: int option [@ocaml.doc "The maximum number of objects to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The {i DescribeTrustsResult.NextToken} value from a previous call to [DescribeTrusts]. Pass null if this is the first call.\n"];
  trust_ids: string list option
    [@ocaml.doc
      "A list of identifiers of the trust relationships for which to obtain the information. If this member is null, all trust relationships that belong to the current account are returned.\n\n An empty list results in an [InvalidParameterException] being thrown.\n "];
  directory_id: string option
    [@ocaml.doc
      "The Directory ID of the Amazon Web Services directory that is a part of the requested trust relationship.\n"]}
[@@ocaml.doc
  "Describes the trust relationships for a particular Managed Microsoft AD directory. If no input parameters are provided, such as directory ID or trust ID, this request describes all the trust relationships.\n"]
type nonrec describe_snapshots_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, more results are available. Pass this value in the {i NextToken} member of a subsequent call to [DescribeSnapshots].\n"];
  snapshots: snapshot list option
    [@ocaml.doc
      "The list of [Snapshot] objects that were retrieved.\n\n It is possible that this list contains less than the number of items specified in the {i Limit} member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.\n "]}
[@@ocaml.doc "Contains the results of the [DescribeSnapshots] operation.\n"]
type nonrec describe_snapshots_request =
  {
  limit: int option [@ocaml.doc "The maximum number of objects to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The {i DescribeSnapshotsResult.NextToken} value from a previous call to [DescribeSnapshots]. Pass null if this is the first call.\n"];
  snapshot_ids: string list option
    [@ocaml.doc
      "A list of identifiers of the snapshots to obtain the information for. If this member is null or empty, all snapshots are returned using the {i Limit} and {i NextToken} members.\n"];
  directory_id: string option
    [@ocaml.doc
      "The identifier of the directory for which to retrieve snapshot information.\n"]}
[@@ocaml.doc "Contains the inputs for the [DescribeSnapshots] operation.\n"]
type nonrec describe_shared_directories_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, token that indicates that more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeSharedDirectories] to retrieve the next set of items.\n"];
  shared_directories: shared_directory list option
    [@ocaml.doc "A list of all shared directories in your account.\n"]}
[@@ocaml.doc ""]
type nonrec describe_shared_directories_request =
  {
  limit: int option
    [@ocaml.doc
      "The number of shared directories to return in the response object.\n"];
  next_token: string option
    [@ocaml.doc
      "The [DescribeSharedDirectoriesResult.NextToken] value from a previous call to [DescribeSharedDirectories]. Pass null if this is the first call. \n"];
  shared_directory_ids: string list option
    [@ocaml.doc
      "A list of identifiers of all shared directories in your account. \n"];
  owner_directory_id: string
    [@ocaml.doc
      "Returns the identifier of the directory in the directory owner account. \n"]}
[@@ocaml.doc ""]
type nonrec describe_settings_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, token that indicates that more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeSettings] to retrieve the next set of items. \n"];
  setting_entries: setting_entry list option
    [@ocaml.doc
      "The list of [SettingEntry] objects that were retrieved.\n\n It is possible that this list contains less than the number of items specified in the [Limit] member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.\n "];
  directory_id: string option
    [@ocaml.doc "The identifier of the directory.\n"]}[@@ocaml.doc ""]
type nonrec describe_settings_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [DescribeSettingsResult.NextToken] value from a previous call to [DescribeSettings]. Pass null if this is the first call.\n"];
  status: directory_configuration_status option
    [@ocaml.doc
      "The status of the directory settings for which to retrieve information.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to retrieve information.\n"]}
[@@ocaml.doc ""]
type nonrec describe_regions_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeRegions] to retrieve the next set of items.\n"];
  regions_description: region_description list option
    [@ocaml.doc
      "List of Region information related to the directory for each replicated Region.\n"]}
[@@ocaml.doc ""]
type nonrec describe_regions_request =
  {
  next_token: string option
    [@ocaml.doc
      "The [DescribeRegionsResult.NextToken] value from a previous call to [DescribeRegions]. Pass null if this is the first call.\n"];
  region_name: string option
    [@ocaml.doc "The name of the Region. For example, [us-east-1].\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec describe_ldaps_settings_result =
  {
  next_token: string option
    [@ocaml.doc
      "The next token used to retrieve the LDAPS settings if the number of setting types exceeds page limit and there is another page.\n"];
  ldaps_settings_info: ldaps_setting_info list option
    [@ocaml.doc
      "Information about LDAP security for the specified directory, including status of enablement, state last updated date time, and the reason for the state.\n"]}
[@@ocaml.doc ""]
type nonrec describe_ldaps_settings_request =
  {
  limit: int option
    [@ocaml.doc
      "Specifies the number of items that should be displayed on one page.\n"];
  next_token: string option
    [@ocaml.doc "The type of next token used for pagination.\n"];
  type_: ldaps_type option
    [@ocaml.doc
      "The type of LDAP security to enable. Currently only the value [Client] is supported.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec describe_event_topics_result =
  {
  event_topics: event_topic list option
    [@ocaml.doc
      "A list of Amazon SNS topic names that receive status messages from the specified Directory ID.\n"]}
[@@ocaml.doc "The result of a DescribeEventTopic request.\n"]
type nonrec describe_event_topics_request =
  {
  topic_names: string list option
    [@ocaml.doc
      "A list of Amazon SNS topic names for which to obtain the information. If this member is null, all associations for the specified Directory ID are returned.\n\n An empty list results in an [InvalidParameterException] being thrown.\n "];
  directory_id: string option
    [@ocaml.doc
      "The Directory ID for which to get the list of associated Amazon SNS topics. If this member is null, associations for all Directory IDs are returned.\n"]}
[@@ocaml.doc "Describes event topics.\n"]
type nonrec describe_domain_controllers_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeDomainControllers] retrieve the next set of items.\n"];
  domain_controllers: domain_controller list option
    [@ocaml.doc
      "List of the [DomainController] objects that were retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec describe_domain_controllers_request =
  {
  limit: int option [@ocaml.doc "The maximum number of items to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The {i DescribeDomainControllers.NextToken} value from a previous call to [DescribeDomainControllers]. Pass null if this is the first call. \n"];
  domain_controller_ids: string list option
    [@ocaml.doc
      "A list of identifiers for the domain controllers whose information will be provided.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier of the directory for which to retrieve the domain controller information.\n"]}
[@@ocaml.doc ""]
type nonrec directory_edition =
  | STANDARD [@ocaml.doc ""]
  | ENTERPRISE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec directory_connect_settings_description =
  {
  connect_ips: string list option
    [@ocaml.doc "The IP addresses of the AD Connector servers.\n"];
  availability_zones: string list option
    [@ocaml.doc
      "A list of the Availability Zones that the directory is in.\n"];
  security_group_id: string option
    [@ocaml.doc
      "The security group identifier for the AD Connector directory.\n"];
  customer_user_name: string option
    [@ocaml.doc
      "The user name of the service account in your self-managed directory.\n"];
  subnet_ids: string list option
    [@ocaml.doc
      "A list of subnet identifiers in the VPC that the AD Connector is in.\n"];
  vpc_id: string option
    [@ocaml.doc "The identifier of the VPC that the AD Connector is in.\n"]}
[@@ocaml.doc "Contains information about an AD Connector directory.\n"]
type nonrec directory_description =
  {
  os_version: os_version option
    [@ocaml.doc "The operating system (OS) version of the directory.\n"];
  regions_info: regions_info option
    [@ocaml.doc "Lists the Regions where the directory has replicated.\n"];
  owner_directory_description: owner_directory_description option
    [@ocaml.doc
      "Describes the Managed Microsoft AD directory in the directory owner account.\n"];
  desired_number_of_domain_controllers: int option
    [@ocaml.doc
      "The desired number of domain controllers in the directory if the directory is Microsoft AD.\n"];
  sso_enabled: bool option
    [@ocaml.doc
      "Indicates if single sign-on is enabled for the directory. For more information, see [EnableSso] and [DisableSso].\n"];
  stage_reason: string option
    [@ocaml.doc "Additional information about the directory stage.\n"];
  radius_status: radius_status option
    [@ocaml.doc "The status of the RADIUS MFA server connection.\n"];
  radius_settings: radius_settings option
    [@ocaml.doc
      "A [RadiusSettings] object that contains information about the RADIUS server configured for this directory.\n"];
  connect_settings: directory_connect_settings_description option
    [@ocaml.doc
      "A [DirectoryConnectSettingsDescription] object that contains additional information about an AD Connector directory. This member is only present if the directory is an AD Connector directory.\n"];
  vpc_settings: directory_vpc_settings_description option
    [@ocaml.doc
      "A [DirectoryVpcSettingsDescription] object that contains additional information about a directory. This member is only present if the directory is a Simple AD or Managed Microsoft AD directory.\n"];
  type_: directory_type option [@ocaml.doc "The directory size.\n"];
  stage_last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the stage was last updated.\n"];
  launch_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "Specifies when the directory was created.\n"];
  share_notes: string option
    [@ocaml.doc
      "A directory share request that is sent by the directory owner to the directory consumer. The request includes a typed message to help the directory consumer administrator determine whether to approve or reject the share invitation.\n"];
  share_method: share_method option
    [@ocaml.doc
      "The method used when sharing a directory to determine whether the directory should be shared within your Amazon Web Services organization ([ORGANIZATIONS]) or with any Amazon Web Services account by sending a shared directory request ([HANDSHAKE]).\n"];
  share_status: share_status option
    [@ocaml.doc
      "Current directory status of the shared Managed Microsoft AD directory.\n"];
  stage: directory_stage option
    [@ocaml.doc "The current stage of the directory.\n"];
  dns_ip_addrs: string list option
    [@ocaml.doc
      "The IP addresses of the DNS servers for the directory. For a Simple AD or Microsoft AD directory, these are the IP addresses of the Simple AD or Microsoft AD directory servers. For an AD Connector directory, these are the IP addresses of the DNS servers or domain controllers in your self-managed directory to which the AD Connector is connected.\n"];
  description: string option
    [@ocaml.doc "The description for the directory.\n"];
  access_url: string option
    [@ocaml.doc
      "The access URL for the directory, such as \n{[\nhttp://.awsapps.com\n]}\n. If no alias has been created for the directory, \n{[\n\n]}\n is the directory identifier, such as [d-XXXXXXXXXX].\n"];
  alias: string option
    [@ocaml.doc
      "The alias for the directory. If no alias has been created for the directory, the alias is the directory identifier, such as [d-XXXXXXXXXX].\n"];
  edition: directory_edition option
    [@ocaml.doc "The edition associated with this directory.\n"];
  size: directory_size option [@ocaml.doc "The directory size.\n"];
  short_name: string option [@ocaml.doc "The short name of the directory.\n"];
  name: string option
    [@ocaml.doc "The fully qualified name of the directory.\n"];
  directory_id: string option [@ocaml.doc "The directory identifier.\n"]}
[@@ocaml.doc "Contains information about an Directory Service directory.\n"]
type nonrec describe_directories_result =
  {
  next_token: string option
    [@ocaml.doc
      "If not null, more results are available. Pass this value for the [NextToken] parameter in a subsequent call to [DescribeDirectories] to retrieve the next set of items.\n"];
  directory_descriptions: directory_description list option
    [@ocaml.doc
      "The list of [DirectoryDescription] objects that were retrieved.\n\n It is possible that this list contains less than the number of items specified in the [Limit] member of the request. This occurs if there are less than the requested number of items left to retrieve, or if the limitations of the operation have been exceeded.\n "]}
[@@ocaml.doc
  "Contains the results of the [DescribeDirectories] operation.\n"]
type nonrec describe_directories_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation.\n"];
  next_token: string option
    [@ocaml.doc
      "The [DescribeDirectoriesResult.NextToken] value from a previous call to [DescribeDirectories]. Pass null if this is the first call.\n"];
  directory_ids: string list option
    [@ocaml.doc
      "A list of identifiers of the directories for which to obtain the information. If this member is null, all directories that belong to the current account are returned.\n\n An empty list results in an [InvalidParameterException] being thrown.\n "]}
[@@ocaml.doc
  "Contains the inputs for the [DescribeDirectories] operation.\n"]
type nonrec conditional_forwarder =
  {
  replication_scope: replication_scope option
    [@ocaml.doc
      "The replication scope of the conditional forwarder. The only allowed value is [Domain], which will replicate the conditional forwarder to all of the domain controllers for your Amazon Web Services directory.\n"];
  dns_ip_addrs: string list option
    [@ocaml.doc
      "The IP addresses of the remote DNS server associated with RemoteDomainName. This is the IP address of the DNS server that your conditional forwarder points to.\n"];
  remote_domain_name: string option
    [@ocaml.doc
      "The fully qualified domain name (FQDN) of the remote domains pointed to by the conditional forwarder.\n"]}
[@@ocaml.doc
  "Points to a remote domain with which you are setting up a trust relationship. Conditional forwarders are required in order to set up a trust relationship with another domain.\n"]
type nonrec describe_conditional_forwarders_result =
  {
  conditional_forwarders: conditional_forwarder list option
    [@ocaml.doc
      "The list of conditional forwarders that have been created.\n"]}
[@@ocaml.doc "The result of a DescribeConditionalForwarder request.\n"]
type nonrec describe_conditional_forwarders_request =
  {
  remote_domain_names: string list option
    [@ocaml.doc
      "The fully qualified domain names (FQDN) of the remote domains for which to get the list of associated conditional forwarders. If this member is null, all conditional forwarders are returned.\n"];
  directory_id: string
    [@ocaml.doc
      "The directory ID for which to get the list of associated conditional forwarders.\n"]}
[@@ocaml.doc "Describes a conditional forwarder.\n"]
type nonrec client_authentication_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec client_authentication_setting_info =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when the status of the client authentication type was last updated.\n"];
  status: client_authentication_status option
    [@ocaml.doc
      "Whether the client authentication type is enabled or disabled for the specified directory.\n"];
  type_: client_authentication_type option
    [@ocaml.doc
      "The type of client authentication for the specified directory. If no type is specified, a list of all client authentication types that are supported for the directory is retrieved. \n"]}
[@@ocaml.doc
  "Contains information about a client authentication method for a directory.\n"]
type nonrec describe_client_authentication_settings_result =
  {
  next_token: string option
    [@ocaml.doc
      "The next token used to retrieve the client authentication settings if the number of setting types exceeds page limit and there is another page.\n"];
  client_authentication_settings_info:
    client_authentication_setting_info list option
    [@ocaml.doc
      "Information about the type of client authentication for the specified directory. The following information is retrieved: The date and time when the status of the client authentication type was last updated, whether the client authentication type is enabled or disabled, and the type of client authentication.\n"]}
[@@ocaml.doc ""]
type nonrec describe_client_authentication_settings_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of items to return. If this value is zero, the maximum number of items is specified by the limitations of the operation. \n"];
  next_token: string option
    [@ocaml.doc
      "The {i DescribeClientAuthenticationSettingsResult.NextToken} value from a previous call to [DescribeClientAuthenticationSettings]. Pass null if this is the first call.\n"];
  type_: client_authentication_type option
    [@ocaml.doc
      "The type of client authentication for which to retrieve information. If no type is specified, a list of all client authentication types that are supported for the specified directory is retrieved.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to retrieve information.\n"]}
[@@ocaml.doc ""]
type nonrec certificate_does_not_exist_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The certificate is not present in the system for describe or deregister activities.\n"]
type nonrec certificate =
  {
  client_cert_auth_settings: client_cert_auth_settings option
    [@ocaml.doc
      "A [ClientCertAuthSettings] object that contains client certificate authentication settings.\n"];
  type_: certificate_type option
    [@ocaml.doc
      "The function that the registered certificate performs. Valid values include [ClientLDAPS] or [ClientCertAuth]. The default value is [ClientLDAPS].\n"];
  expiry_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time when the certificate will expire.\n"];
  registered_date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the certificate was registered.\n"];
  common_name: string option
    [@ocaml.doc "The common name for the certificate.\n"];
  state_reason: string option
    [@ocaml.doc "Describes a state change for the certificate.\n"];
  state: certificate_state option
    [@ocaml.doc "The state of the certificate.\n"];
  certificate_id: string option
    [@ocaml.doc "The identifier of the certificate.\n"]}[@@ocaml.doc
                                                          "Information about the certificate.\n"]
type nonrec describe_certificate_result =
  {
  certificate: certificate option
    [@ocaml.doc
      "Information about the certificate, including registered date time, certificate state, the reason for the state, expiration date time, and certificate common name.\n"]}
[@@ocaml.doc ""]
type nonrec describe_certificate_request =
  {
  certificate_id: string [@ocaml.doc "The identifier of the certificate.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_event_topic_request =
  {
  topic_name: string
    [@ocaml.doc
      "The name of the Amazon SNS topic from which to remove the directory as a publisher.\n"];
  directory_id: string
    [@ocaml.doc
      "The Directory ID to remove as a publisher. This directory will no longer send messages to the specified Amazon SNS topic.\n"]}
[@@ocaml.doc
  "Removes the specified directory as a publisher to the specified Amazon SNS topic.\n"]
type nonrec certificate_in_use_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The certificate is being used for the LDAP security connection and cannot be removed without disabling LDAP security.\n"]
type nonrec deregister_certificate_request =
  {
  certificate_id: string [@ocaml.doc "The identifier of the certificate.\n"];
  directory_id: string [@ocaml.doc "The identifier of the directory.\n"]}
[@@ocaml.doc ""]
type nonrec delete_trust_result =
  {
  trust_id: string option
    [@ocaml.doc "The Trust ID of the trust relationship that was deleted.\n"]}
[@@ocaml.doc "The result of a DeleteTrust request.\n"]
type nonrec delete_trust_request =
  {
  delete_associated_conditional_forwarder: bool option
    [@ocaml.doc
      "Delete a conditional forwarder as part of a DeleteTrustRequest.\n"];
  trust_id: string
    [@ocaml.doc "The Trust ID of the trust relationship to be deleted.\n"]}
[@@ocaml.doc
  "Deletes the local side of an existing trust relationship between the Managed Microsoft AD directory and the external domain.\n"]
type nonrec delete_snapshot_result =
  {
  snapshot_id: string option
    [@ocaml.doc
      "The identifier of the directory snapshot that was deleted.\n"]}
[@@ocaml.doc "Contains the results of the [DeleteSnapshot] operation.\n"]
type nonrec delete_snapshot_request =
  {
  snapshot_id: string
    [@ocaml.doc "The identifier of the directory snapshot to be deleted.\n"]}
[@@ocaml.doc "Contains the inputs for the [DeleteSnapshot] operation.\n"]
type nonrec delete_log_subscription_request =
  {
  directory_id: string
    [@ocaml.doc
      "Identifier of the directory whose log subscription you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_directory_result =
  {
  directory_id: string option [@ocaml.doc "The directory identifier.\n"]}
[@@ocaml.doc "Contains the results of the [DeleteDirectory] operation.\n"]
type nonrec delete_directory_request =
  {
  directory_id: string
    [@ocaml.doc "The identifier of the directory to delete.\n"]}[@@ocaml.doc
                                                                  "Contains the inputs for the [DeleteDirectory] operation.\n"]
type nonrec delete_conditional_forwarder_request =
  {
  remote_domain_name: string
    [@ocaml.doc
      "The fully qualified domain name (FQDN) of the remote domain with which you are deleting the conditional forwarder.\n"];
  directory_id: string
    [@ocaml.doc
      "The directory ID for which you are deleting the conditional forwarder.\n"]}
[@@ocaml.doc "Deletes a conditional forwarder.\n"]
type nonrec create_trust_result =
  {
  trust_id: string option
    [@ocaml.doc
      "A unique identifier for the trust relationship that was created.\n"]}
[@@ocaml.doc "The result of a CreateTrust request.\n"]
type nonrec create_trust_request =
  {
  selective_auth: selective_auth option
    [@ocaml.doc
      "Optional parameter to enable selective authentication for the trust.\n"];
  conditional_forwarder_ip_addrs: string list option
    [@ocaml.doc
      "The IP addresses of the remote DNS server associated with RemoteDomainName.\n"];
  trust_type: trust_type option
    [@ocaml.doc "The trust relationship type. [Forest] is the default.\n"];
  trust_direction: trust_direction
    [@ocaml.doc "The direction of the trust relationship.\n"];
  trust_password: string
    [@ocaml.doc
      "The trust password. The must be the same password that was used when creating the trust relationship on the external domain.\n"];
  remote_domain_name: string
    [@ocaml.doc
      "The Fully Qualified Domain Name (FQDN) of the external domain for which to create the trust relationship.\n"];
  directory_id: string
    [@ocaml.doc
      "The Directory ID of the Managed Microsoft AD directory for which to establish the trust relationship.\n"]}
[@@ocaml.doc
  "Directory Service for Microsoft Active Directory allows you to configure trust relationships. For example, you can establish a trust between your Managed Microsoft AD directory, and your existing self-managed Microsoft Active Directory. This would allow you to provide users and groups access to resources in either domain, with a single set of credentials.\n\n This action initiates the creation of the Amazon Web Services side of a trust relationship between an Managed Microsoft AD directory and an external domain.\n "]
type nonrec create_snapshot_result =
  {
  snapshot_id: string option
    [@ocaml.doc "The identifier of the snapshot that was created.\n"]}
[@@ocaml.doc "Contains the results of the [CreateSnapshot] operation.\n"]
type nonrec create_snapshot_request =
  {
  name: string option
    [@ocaml.doc "The descriptive name to apply to the snapshot.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory of which to take a snapshot.\n"]}
[@@ocaml.doc "Contains the inputs for the [CreateSnapshot] operation.\n"]
type nonrec directory_limit_exceeded_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum number of directories in the region has been reached. You can use the [GetDirectoryLimits] operation to determine your directory limits in the region.\n"]
type nonrec create_microsoft_ad_result =
  {
  directory_id: string option
    [@ocaml.doc "The identifier of the directory that was created.\n"]}
[@@ocaml.doc "Result of a CreateMicrosoftAD request.\n"]
type nonrec create_microsoft_ad_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tags to be assigned to the Managed Microsoft AD directory.\n"];
  edition: directory_edition option
    [@ocaml.doc
      "Managed Microsoft AD is available in two editions: [Standard] and [Enterprise]. [Enterprise] is the default.\n"];
  vpc_settings: directory_vpc_settings
    [@ocaml.doc
      "Contains VPC information for the [CreateDirectory] or [CreateMicrosoftAD] operation.\n"];
  description: string option
    [@ocaml.doc
      "A description for the directory. This label will appear on the Amazon Web Services console [Directory Details] page after the directory is created.\n"];
  password: string
    [@ocaml.doc
      "The password for the default administrative user named [Admin].\n\n If you need to change the password for the administrator account, you can use the [ResetUserPassword] API call.\n "];
  short_name: string option
    [@ocaml.doc
      "The NetBIOS name for your domain, such as [CORP]. If you don't specify a NetBIOS name, it will default to the first part of your directory DNS. For example, [CORP] for the directory DNS [corp.example.com]. \n"];
  name: string
    [@ocaml.doc
      "The fully qualified domain name for the Managed Microsoft AD directory, such as [corp.example.com]. This name will resolve inside your VPC only. It does not need to be publicly resolvable.\n"]}
[@@ocaml.doc "Creates an Managed Microsoft AD directory.\n"]
type nonrec create_log_subscription_request =
  {
  log_group_name: string
    [@ocaml.doc
      "The name of the CloudWatch log group where the real-time domain controller logs are forwarded.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier of the directory to which you want to subscribe and receive real-time logs to your specified CloudWatch log group.\n"]}
[@@ocaml.doc ""]
type nonrec create_directory_result =
  {
  directory_id: string option
    [@ocaml.doc "The identifier of the directory that was created.\n"]}
[@@ocaml.doc "Contains the results of the [CreateDirectory] operation.\n"]
type nonrec create_directory_request =
  {
  tags: tag list option
    [@ocaml.doc "The tags to be assigned to the Simple AD directory.\n"];
  vpc_settings: directory_vpc_settings option
    [@ocaml.doc
      "A [DirectoryVpcSettings] object that contains additional information for the operation.\n"];
  size: directory_size [@ocaml.doc "The size of the directory.\n"];
  description: string option
    [@ocaml.doc "A description for the directory.\n"];
  password: string
    [@ocaml.doc
      "The password for the directory administrator. The directory creation process creates a directory administrator account with the user name [Administrator] and this password.\n\n If you need to change the password for the administrator account, you can use the [ResetUserPassword] API call.\n \n  The regex pattern for this string is made up of the following conditions:\n  \n   {ul\n         {-  Length (?=^.\\{8,64\\}$) \226\128\147 Must be between 8 and 64 characters\n             \n              }\n         }\n   AND any 3 of the following password complexity rules required by Active Directory:\n   \n    {ul\n          {-  Numbers and upper case and lowercase (?=.*\\d)(?=.*\\[A-Z\\])(?=.*\\[a-z\\])\n              \n               }\n          {-  Numbers and special characters and lower case (?=.*\\d)(?=.*\\[^A-Za-z0-9\\s\\])(?=.*\\[a-z\\])\n              \n               }\n          {-  Special characters and upper case and lower case (?=.*\\[^A-Za-z0-9\\s\\])(?=.*\\[A-Z\\])(?=.*\\[a-z\\])\n              \n               }\n          {-  Numbers and upper case and special characters (?=.*\\d)(?=.*\\[A-Z\\])(?=.*\\[^A-Za-z0-9\\s\\])\n              \n               }\n          }\n   For additional information about how Active Directory passwords are enforced, see {{:https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/password-must-meet-complexity-requirements}Password must meet complexity requirements} on the Microsoft website.\n   "];
  short_name: string option
    [@ocaml.doc "The NetBIOS name of the directory, such as [CORP].\n"];
  name: string
    [@ocaml.doc
      "The fully qualified name for the directory, such as [corp.example.com].\n"]}
[@@ocaml.doc "Contains the inputs for the [CreateDirectory] operation. \n"]
type nonrec create_conditional_forwarder_request =
  {
  dns_ip_addrs: string list
    [@ocaml.doc
      "The IP addresses of the remote DNS server associated with RemoteDomainName.\n"];
  remote_domain_name: string
    [@ocaml.doc
      "The fully qualified domain name (FQDN) of the remote domain with which you will set up a trust relationship.\n"];
  directory_id: string
    [@ocaml.doc
      "The directory ID of the Amazon Web Services directory for which you are creating the conditional forwarder.\n"]}
[@@ocaml.doc
  "Initiates the creation of a conditional forwarder for your Directory Service for Microsoft Active Directory. Conditional forwarders are required in order to set up a trust relationship with another domain.\n"]
type nonrec attribute =
  {
  value: string option [@ocaml.doc "The value of the attribute.\n"];
  name: string option [@ocaml.doc "The name of the attribute.\n"]}[@@ocaml.doc
                                                                    "Represents a named directory attribute.\n"]
type nonrec computer =
  {
  computer_attributes: attribute list option
    [@ocaml.doc
      "An array of [Attribute] objects containing the LDAP attributes that belong to the computer account.\n"];
  computer_name: string option [@ocaml.doc "The computer name.\n"];
  computer_id: string option [@ocaml.doc "The identifier of the computer.\n"]}
[@@ocaml.doc
  "Contains information about a computer account in a directory.\n"]
type nonrec create_computer_result =
  {
  computer: computer option
    [@ocaml.doc
      "A [Computer] object that represents the computer account.\n"]}
[@@ocaml.doc "Contains the results for the [CreateComputer] operation.\n"]
type nonrec create_computer_request =
  {
  computer_attributes: attribute list option
    [@ocaml.doc
      "An array of [Attribute] objects that contain any LDAP attributes to apply to the computer account.\n"];
  organizational_unit_distinguished_name: string option
    [@ocaml.doc
      "The fully-qualified distinguished name of the organizational unit to place the computer account in.\n"];
  password: string
    [@ocaml.doc
      "A one-time password that is used to join the computer to the directory. You should generate a random, strong password to use for this parameter.\n"];
  computer_name: string [@ocaml.doc "The name of the computer account.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory in which to create the computer account.\n"]}
[@@ocaml.doc "Contains the inputs for the [CreateComputer] operation.\n"]
type nonrec create_alias_result =
  {
  alias: string option [@ocaml.doc "The alias for the directory.\n"];
  directory_id: string option
    [@ocaml.doc "The identifier of the directory.\n"]}[@@ocaml.doc
                                                        "Contains the results of the [CreateAlias] operation.\n"]
type nonrec create_alias_request =
  {
  alias: string
    [@ocaml.doc
      "The requested alias.\n\n The alias must be unique amongst all aliases in Amazon Web Services. This operation throws an [EntityAlreadyExistsException] error if the alias already exists.\n "];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory for which to create the alias.\n"]}
[@@ocaml.doc "Contains the inputs for the [CreateAlias] operation.\n"]
type nonrec connect_directory_result =
  {
  directory_id: string option
    [@ocaml.doc "The identifier of the new directory.\n"]}[@@ocaml.doc
                                                            "Contains the results of the [ConnectDirectory] operation.\n"]
type nonrec directory_connect_settings =
  {
  customer_user_name: string
    [@ocaml.doc
      "The user name of an account in your self-managed directory that is used to connect to the directory. This account must have the following permissions:\n\n {ul\n       {-  Read users and groups\n           \n            }\n       {-  Create computer objects\n           \n            }\n       {-  Join computers to the domain\n           \n            }\n       }\n  "];
  customer_dns_ips: string list
    [@ocaml.doc
      "A list of one or more IP addresses of DNS servers or domain controllers in your self-managed directory.\n"];
  subnet_ids: string list
    [@ocaml.doc
      "A list of subnet identifiers in the VPC in which the AD Connector is created.\n"];
  vpc_id: string
    [@ocaml.doc
      "The identifier of the VPC in which the AD Connector is created.\n"]}
[@@ocaml.doc
  "Contains information for the [ConnectDirectory] operation when an AD Connector directory is being created.\n"]
type nonrec connect_directory_request =
  {
  tags: tag list option
    [@ocaml.doc "The tags to be assigned to AD Connector.\n"];
  connect_settings: directory_connect_settings
    [@ocaml.doc
      "A [DirectoryConnectSettings] object that contains additional information for the operation.\n"];
  size: directory_size [@ocaml.doc "The size of the directory.\n"];
  description: string option
    [@ocaml.doc "A description for the directory.\n"];
  password: string
    [@ocaml.doc "The password for your self-managed user account.\n"];
  short_name: string option
    [@ocaml.doc
      "The NetBIOS name of your self-managed directory, such as [CORP].\n"];
  name: string
    [@ocaml.doc
      "The fully qualified name of your self-managed directory, such as [corp.example.com].\n"]}
[@@ocaml.doc "Contains the inputs for the [ConnectDirectory] operation.\n"]
type nonrec cancel_schema_extension_request =
  {
  schema_extension_id: string
    [@ocaml.doc
      "The identifier of the schema extension that will be canceled.\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory whose schema extension will be canceled.\n"]}
[@@ocaml.doc ""]
type nonrec add_tags_to_resource_request =
  {
  tags: tag list [@ocaml.doc "The tags to be assigned to the directory.\n"];
  resource_id: string
    [@ocaml.doc
      "Identifier (ID) for the directory to which to add the tag.\n"]}
[@@ocaml.doc ""]
type nonrec directory_already_in_region_exception =
  {
  request_id: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The Region you specified is the same Region where the Managed Microsoft AD directory was created. Specify a different Region and try again.\n"]
type nonrec add_region_request =
  {
  vpc_settings: directory_vpc_settings [@ocaml.doc ""];
  region_name: string
    [@ocaml.doc
      "The name of the Region where you want to add domain controllers for replication. For example, [us-east-1].\n"];
  directory_id: string
    [@ocaml.doc
      "The identifier of the directory to which you want to add Region replication.\n"]}
[@@ocaml.doc ""]
type nonrec add_ip_routes_request =
  {
  update_security_group_for_directory_controllers: bool option
    [@ocaml.doc
      "If set to true, updates the inbound and outbound rules of the security group that has the description: \"Amazon Web Services created security group for {i directory ID} directory controllers.\" Following are the new rules: \n\n Inbound:\n \n  {ul\n        {-  Type: Custom UDP Rule, Protocol: UDP, Range: 88, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom UDP Rule, Protocol: UDP, Range: 123, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom UDP Rule, Protocol: UDP, Range: 138, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom UDP Rule, Protocol: UDP, Range: 389, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom UDP Rule, Protocol: UDP, Range: 464, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom UDP Rule, Protocol: UDP, Range: 445, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom TCP Rule, Protocol: TCP, Range: 88, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom TCP Rule, Protocol: TCP, Range: 135, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom TCP Rule, Protocol: TCP, Range: 445, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom TCP Rule, Protocol: TCP, Range: 464, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom TCP Rule, Protocol: TCP, Range: 636, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom TCP Rule, Protocol: TCP, Range: 1024-65535, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: Custom TCP Rule, Protocol: TCP, Range: 3268-33269, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: DNS (UDP), Protocol: UDP, Range: 53, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: DNS (TCP), Protocol: TCP, Range: 53, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: LDAP, Protocol: TCP, Range: 389, Source: 0.0.0.0/0\n            \n             }\n        {-  Type: All ICMP, Protocol: All, Range: N/A, Source: 0.0.0.0/0\n            \n             }\n        }\n   \n   \n    Outbound:\n    \n     {ul\n           {-  Type: All traffic, Protocol: All, Range: All, Destination: 0.0.0.0/0\n               \n                }\n           }\n   These security rules impact an internal network interface that is not exposed publicly.\n   "];
  ip_routes: ip_route list
    [@ocaml.doc
      "IP address blocks, using CIDR format, of the traffic to route. This is often the IP address block of the DNS server used for your self-managed domain.\n"];
  directory_id: string
    [@ocaml.doc
      "Identifier (ID) of the directory to which to add the address block.\n"]}
[@@ocaml.doc ""]
type nonrec accept_shared_directory_result =
  {
  shared_directory: shared_directory option
    [@ocaml.doc "The shared directory in the directory consumer account.\n"]}
[@@ocaml.doc ""]
type nonrec accept_shared_directory_request =
  {
  shared_directory_id: string
    [@ocaml.doc
      "Identifier of the shared directory in the directory consumer account. This identifier is different for each directory owner account. \n"]}
[@@ocaml.doc ""]