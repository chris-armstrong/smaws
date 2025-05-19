open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "ds";
      endpointPrefix = "ds";
      version = "2015-04-16";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec verify_trust_result = {
  trust_id: string option }[@@ocaml.doc "Result of a VerifyTrust request.\n"]
type nonrec verify_trust_request = {
  trust_id: string }[@@ocaml.doc
                      "Initiates the verification of an existing trust relationship between an Managed Microsoft AD directory and an external domain.\n"]
type nonrec unsupported_operation_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc "The operation is not supported.\n"]
type nonrec service_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "An exception has occurred in Directory Service.\n"]
type nonrec invalid_parameter_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "One or more parameters are not valid.\n"]
type nonrec entity_does_not_exist_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified entity could not be found.\n"]
type nonrec client_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc "A client exception has occurred.\n"]
type nonrec user_does_not_exist_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The user provided a username that does not exist in your directory.\n"]
type nonrec os_version =
  | VERSION_2019 
  | VERSION_2012 [@@ocaml.doc ""]
type nonrec os_update_settings = {
  os_version: os_version option }[@@ocaml.doc
                                   " OS version that the directory needs to be updated to. \n"]
type nonrec update_value = {
  os_update_settings: os_update_settings option }[@@ocaml.doc
                                                   " The value for a given type of [UpdateSettings]. \n"]
type nonrec update_type =
  | OS [@@ocaml.doc ""]
type nonrec update_trust_result =
  {
  trust_id: string option ;
  request_id: string option }[@@ocaml.doc ""]
type nonrec selective_auth =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec update_trust_request =
  {
  selective_auth: selective_auth option ;
  trust_id: string }[@@ocaml.doc ""]
type nonrec update_status =
  | UPDATE_FAILED 
  | UPDATING 
  | UPDATED [@@ocaml.doc ""]
type nonrec update_settings_result = {
  directory_id: string option }[@@ocaml.doc ""]
type nonrec setting = {
  value: string ;
  name: string }[@@ocaml.doc
                  "Contains information about the configurable settings for a directory.\n"]
type nonrec update_settings_request =
  {
  settings: setting list ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec unsupported_settings_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified directory setting is not supported.\n"]
type nonrec incompatible_settings_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified directory setting is not compatible with other settings.\n"]
type nonrec directory_unavailable_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified directory is unavailable or could not be found.\n"]
type nonrec directory_does_not_exist_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified directory does not exist in the system.\n"]
type nonrec update_radius_result = unit
type nonrec radius_authentication_protocol =
  | MSCHAPV2 
  | MSCHAPV1 
  | CHAP 
  | PAP [@@ocaml.doc ""]
type nonrec radius_settings =
  {
  use_same_username: bool option ;
  display_label: string option ;
  authentication_protocol: radius_authentication_protocol option ;
  shared_secret: string option ;
  radius_retries: int option ;
  radius_timeout: int option ;
  radius_port: int option ;
  radius_servers: string list option }[@@ocaml.doc
                                        "Contains information about a Remote Authentication Dial In User Service (RADIUS) server.\n"]
type nonrec update_radius_request =
  {
  radius_settings: radius_settings ;
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [UpdateRadius] operation.\n"]
type nonrec update_number_of_domain_controllers_result = unit
type nonrec update_number_of_domain_controllers_request =
  {
  desired_number: int ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec domain_controller_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The maximum allowed number of domain controllers per directory was exceeded. The default limit per directory is 20 domain controllers.\n"]
type nonrec update_info_entry =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  previous_value: update_value option ;
  new_value: update_value option ;
  initiated_by: string option ;
  status_reason: string option ;
  status: update_status option ;
  region: string option }[@@ocaml.doc
                           " An entry of update information related to a requested update type. \n"]
type nonrec update_directory_setup_result = unit
type nonrec update_directory_setup_request =
  {
  create_snapshot_before_update: bool option ;
  os_update_settings: os_update_settings option ;
  update_type: update_type ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec snapshot_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The maximum number of manual snapshots for the directory has been reached. You can use the [GetSnapshotLimits] operation to determine the snapshot limits for a directory.\n"]
type nonrec directory_in_desired_state_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            " The directory is already updated to desired update type settings. \n"]
type nonrec access_denied_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "Client authentication is not available in this region at this time.\n"]
type nonrec update_conditional_forwarder_result = unit
type nonrec update_conditional_forwarder_request =
  {
  dns_ip_addrs: string list ;
  remote_domain_name: string ;
  directory_id: string }[@@ocaml.doc "Updates a conditional forwarder.\n"]
type nonrec target_type =
  | ACCOUNT [@@ocaml.doc ""]
type nonrec unshare_target = {
  type_: target_type ;
  id: string }[@@ocaml.doc
                "Identifier that contains details about the directory consumer account with whom the directory is being unshared.\n"]
type nonrec unshare_directory_result = {
  shared_directory_id: string option }[@@ocaml.doc ""]
type nonrec unshare_directory_request =
  {
  unshare_target: unshare_target ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec invalid_target_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified shared target is not valid.\n"]
type nonrec directory_not_shared_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified directory has not been shared with this Amazon Web Services account.\n"]
type nonrec trust_type =
  | EXTERNAL 
  | FOREST [@@ocaml.doc ""]
type nonrec trust_direction =
  | TWO_WAY 
  | ONE_WAY_INCOMING 
  | ONE_WAY_OUTGOING [@@ocaml.doc ""]
type nonrec trust_state =
  | FAILED 
  | DELETED 
  | DELETING 
  | UPDATED 
  | UPDATE_FAILED 
  | UPDATING 
  | VERIFIED 
  | VERIFY_FAILED 
  | VERIFYING 
  | CREATED 
  | CREATING [@@ocaml.doc ""]
type nonrec trust =
  {
  selective_auth: selective_auth option ;
  trust_state_reason: string option ;
  state_last_updated_date_time: CoreTypes.Timestamp.t option ;
  last_updated_date_time: CoreTypes.Timestamp.t option ;
  created_date_time: CoreTypes.Timestamp.t option ;
  trust_state: trust_state option ;
  trust_direction: trust_direction option ;
  trust_type: trust_type option ;
  remote_domain_name: string option ;
  trust_id: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Describes a trust relationship between an Managed Microsoft AD directory and an external domain.\n"]
type nonrec topic_status =
  | DELETED 
  | FAILED 
  | TOPIC_NOT_FOUND 
  | REGISTERED [@@ocaml.doc ""]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "Metadata assigned to a directory consisting of a key-value pair.\n"]
type nonrec tag_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The maximum allowed number of tags was exceeded.\n"]
type nonrec start_schema_extension_result =
  {
  schema_extension_id: string option }[@@ocaml.doc ""]
type nonrec start_schema_extension_request =
  {
  description: string ;
  ldif_content: string ;
  create_snapshot_before_schema_extension: bool ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec snapshot_type =
  | MANUAL 
  | AUTO [@@ocaml.doc ""]
type nonrec snapshot_status =
  | FAILED 
  | COMPLETED 
  | CREATING [@@ocaml.doc ""]
type nonrec snapshot =
  {
  start_time: CoreTypes.Timestamp.t option ;
  status: snapshot_status option ;
  name: string option ;
  type_: snapshot_type option ;
  snapshot_id: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Describes a directory snapshot.\n"]
type nonrec snapshot_limits =
  {
  manual_snapshots_limit_reached: bool option ;
  manual_snapshots_current_count: int option ;
  manual_snapshots_limit: int option }[@@ocaml.doc
                                        "Contains manual snapshot limit information for a directory.\n"]
type nonrec share_method =
  | HANDSHAKE 
  | ORGANIZATIONS [@@ocaml.doc ""]
type nonrec share_status =
  | DELETING 
  | DELETED 
  | SHARE_FAILED 
  | SHARING 
  | REJECT_FAILED 
  | REJECTING 
  | REJECTED 
  | PENDING_ACCEPTANCE 
  | SHARED [@@ocaml.doc ""]
type nonrec shared_directory =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option ;
  created_date_time: CoreTypes.Timestamp.t option ;
  share_notes: string option ;
  share_status: share_status option ;
  shared_directory_id: string option ;
  shared_account_id: string option ;
  share_method: share_method option ;
  owner_directory_id: string option ;
  owner_account_id: string option }[@@ocaml.doc
                                     "Details about the shared directory in the directory owner account for which the share request in the directory consumer account has been accepted.\n"]
type nonrec share_target = {
  type_: target_type ;
  id: string }[@@ocaml.doc
                "Identifier that contains details about the directory consumer account.\n"]
type nonrec share_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The maximum number of Amazon Web Services accounts that you can share with this directory has been reached.\n"]
type nonrec share_directory_result = {
  shared_directory_id: string option }[@@ocaml.doc ""]
type nonrec share_directory_request =
  {
  share_method: share_method ;
  share_target: share_target ;
  share_notes: string option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec organizations_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "Exception encountered while trying to access your Amazon Web Services organization.\n"]
type nonrec directory_already_shared_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified directory has already been shared with this Amazon Web Services account.\n"]
type nonrec directory_configuration_status =
  | DEFAULT 
  | FAILED 
  | UPDATED 
  | UPDATING 
  | REQUESTED [@@ocaml.doc ""]
type nonrec directory_configuration_setting_request_detailed_status =
  (string * directory_configuration_status) list[@@ocaml.doc ""]
type nonrec setting_entry =
  {
  data_type: string option ;
  last_requested_date_time: CoreTypes.Timestamp.t option ;
  last_updated_date_time: CoreTypes.Timestamp.t option ;
  request_status_message: string option ;
  request_detailed_status:
    directory_configuration_setting_request_detailed_status option ;
  request_status: directory_configuration_status option ;
  requested_value: string option ;
  applied_value: string option ;
  allowed_values: string option ;
  name: string option ;
  type_: string option }[@@ocaml.doc
                          "Contains information about the specified configurable setting for a directory.\n"]
type nonrec schema_extension_status =
  | COMPLETED 
  | FAILED 
  | CANCELLED 
  | ROLLBACK_IN_PROGRESS 
  | CANCEL_IN_PROGRESS 
  | REPLICATING 
  | UPDATING_SCHEMA 
  | CREATING_SNAPSHOT 
  | INITIALIZING [@@ocaml.doc ""]
type nonrec schema_extension_info =
  {
  end_date_time: CoreTypes.Timestamp.t option ;
  start_date_time: CoreTypes.Timestamp.t option ;
  schema_extension_status_reason: string option ;
  schema_extension_status: schema_extension_status option ;
  description: string option ;
  schema_extension_id: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Information about a schema extension.\n"]
type nonrec restore_from_snapshot_result = unit
type nonrec restore_from_snapshot_request = {
  snapshot_id: string }[@@ocaml.doc
                         "An object representing the inputs for the [RestoreFromSnapshot] operation.\n"]
type nonrec reset_user_password_result = unit
type nonrec reset_user_password_request =
  {
  new_password: string ;
  user_name: string ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec invalid_password_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The new password provided by the user does not meet the password complexity requirements defined in your directory.\n"]
type nonrec replication_scope =
  | Domain [@@ocaml.doc ""]
type nonrec remove_tags_from_resource_result = unit
type nonrec remove_tags_from_resource_request =
  {
  tag_keys: string list ;
  resource_id: string }[@@ocaml.doc ""]
type nonrec remove_region_result = unit
type nonrec remove_region_request = {
  directory_id: string }[@@ocaml.doc ""]
type nonrec remove_ip_routes_result = unit
type nonrec remove_ip_routes_request =
  {
  cidr_ips: string list ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec reject_shared_directory_result =
  {
  shared_directory_id: string option }[@@ocaml.doc ""]
type nonrec reject_shared_directory_request = {
  shared_directory_id: string }[@@ocaml.doc ""]
type nonrec register_event_topic_result = unit
type nonrec register_event_topic_request =
  {
  topic_name: string ;
  directory_id: string }[@@ocaml.doc "Registers a new event topic.\n"]
type nonrec register_certificate_result = {
  certificate_id: string option }[@@ocaml.doc ""]
type nonrec certificate_type =
  | CLIENT_LDAPS 
  | CLIENT_CERT_AUTH [@@ocaml.doc ""]
type nonrec client_cert_auth_settings = {
  ocsp_url: string option }[@@ocaml.doc
                             "Contains information about the client certificate authentication settings for the [RegisterCertificate] and [DescribeCertificate] operations. \n"]
type nonrec register_certificate_request =
  {
  client_cert_auth_settings: client_cert_auth_settings option ;
  type_: certificate_type option ;
  certificate_data: string ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec invalid_certificate_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The certificate PEM that was provided has incorrect encoding.\n"]
type nonrec certificate_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The certificate could not be added because the certificate limit has been reached.\n"]
type nonrec certificate_already_exists_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The certificate has already been registered into the system.\n"]
type nonrec regions_info =
  {
  additional_regions: string list option ;
  primary_region: string option }[@@ocaml.doc
                                   "Provides information about the Regions that are configured for multi-Region replication.\n"]
type nonrec region_type =
  | ADDITIONAL 
  | PRIMARY [@@ocaml.doc ""]
type nonrec directory_stage =
  | FAILED 
  | DELETED 
  | DELETING 
  | RESTOREFAILED 
  | RESTORING 
  | IMPAIRED 
  | INOPERABLE 
  | ACTIVE 
  | CREATED 
  | CREATING 
  | REQUESTED [@@ocaml.doc ""]
type nonrec directory_vpc_settings =
  {
  subnet_ids: string list ;
  vpc_id: string }[@@ocaml.doc
                    "Contains VPC information for the [CreateDirectory] or [CreateMicrosoftAD] operation.\n"]
type nonrec region_description =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option ;
  status_last_updated_date_time: CoreTypes.Timestamp.t option ;
  launch_time: CoreTypes.Timestamp.t option ;
  desired_number_of_domain_controllers: int option ;
  vpc_settings: directory_vpc_settings option ;
  status: directory_stage option ;
  region_type: region_type option ;
  region_name: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "The replicated Region information for a directory.\n"]
type nonrec region_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "You have reached the limit for maximum number of simultaneous Region replications per directory.\n"]
type nonrec radius_status =
  | FAILED 
  | COMPLETED 
  | CREATING [@@ocaml.doc ""]
type nonrec directory_vpc_settings_description =
  {
  availability_zones: string list option ;
  security_group_id: string option ;
  subnet_ids: string list option ;
  vpc_id: string option }[@@ocaml.doc
                           "Contains information about the directory.\n"]
type nonrec owner_directory_description =
  {
  radius_status: radius_status option ;
  radius_settings: radius_settings option ;
  vpc_settings: directory_vpc_settings_description option ;
  dns_ip_addrs: string list option ;
  account_id: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Describes the directory owner account details that have been shared to the directory consumer account.\n"]
type nonrec no_available_certificate_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "Client authentication setup could not be completed because at least one valid certificate must be registered in the system.\n"]
type nonrec log_subscription =
  {
  subscription_created_date_time: CoreTypes.Timestamp.t option ;
  log_group_name: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Represents a log subscription, which tracks real-time data from a chosen log group to a specified destination.\n"]
type nonrec list_tags_for_resource_result =
  {
  next_token: string option ;
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  limit: int option ;
  next_token: string option ;
  resource_id: string }[@@ocaml.doc ""]
type nonrec invalid_next_token_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The [NextToken] value is not valid.\n"]
type nonrec list_schema_extensions_result =
  {
  next_token: string option ;
  schema_extensions_info: schema_extension_info list option }[@@ocaml.doc ""]
type nonrec list_schema_extensions_request =
  {
  limit: int option ;
  next_token: string option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec list_log_subscriptions_result =
  {
  next_token: string option ;
  log_subscriptions: log_subscription list option }[@@ocaml.doc ""]
type nonrec list_log_subscriptions_request =
  {
  limit: int option ;
  next_token: string option ;
  directory_id: string option }[@@ocaml.doc ""]
type nonrec ip_route_status_msg =
  | REMOVE_FAILED 
  | ADD_FAILED 
  | REMOVED 
  | REMOVING 
  | ADDED 
  | ADDING [@@ocaml.doc ""]
type nonrec ip_route_info =
  {
  description: string option ;
  ip_route_status_reason: string option ;
  added_date_time: CoreTypes.Timestamp.t option ;
  ip_route_status_msg: ip_route_status_msg option ;
  cidr_ip: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Information about one or more IP address blocks.\n"]
type nonrec list_ip_routes_result =
  {
  next_token: string option ;
  ip_routes_info: ip_route_info list option }[@@ocaml.doc ""]
type nonrec list_ip_routes_request =
  {
  limit: int option ;
  next_token: string option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec certificate_state =
  | DEREGISTER_FAILED 
  | DEREGISTERED 
  | DEREGISTERING 
  | REGISTER_FAILED 
  | REGISTERED 
  | REGISTERING [@@ocaml.doc ""]
type nonrec certificate_info =
  {
  type_: certificate_type option ;
  expiry_date_time: CoreTypes.Timestamp.t option ;
  state: certificate_state option ;
  common_name: string option ;
  certificate_id: string option }[@@ocaml.doc
                                   "Contains general information about a certificate.\n"]
type nonrec list_certificates_result =
  {
  certificates_info: certificate_info list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_certificates_request =
  {
  limit: int option ;
  next_token: string option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec ldaps_type =
  | CLIENT [@@ocaml.doc ""]
type nonrec ldaps_status =
  | DISABLED 
  | ENABLE_FAILED 
  | ENABLED 
  | ENABLING [@@ocaml.doc ""]
type nonrec ldaps_setting_info =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option ;
  ldaps_status_reason: string option ;
  ldaps_status: ldaps_status option }[@@ocaml.doc
                                       "Contains general information about the LDAPS settings.\n"]
type nonrec ip_route = {
  description: string option ;
  cidr_ip: string option }[@@ocaml.doc
                            "IP address block. This is often the address block of the DNS server used for your self-managed domain. \n"]
type nonrec ip_route_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The maximum allowed number of IP addresses was exceeded. The default limit is 100 IP address blocks.\n"]
type nonrec invalid_ldaps_status_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The LDAP activities could not be performed because they are limited by the LDAPS status.\n"]
type nonrec invalid_client_auth_status_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "Client authentication is already enabled.\n"]
type nonrec insufficient_permissions_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The account does not have sufficient permission to perform the operation.\n"]
type nonrec get_snapshot_limits_result =
  {
  snapshot_limits: snapshot_limits option }[@@ocaml.doc
                                             "Contains the results of the [GetSnapshotLimits] operation.\n"]
type nonrec get_snapshot_limits_request = {
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [GetSnapshotLimits] operation.\n"]
type nonrec directory_limits =
  {
  connected_directories_limit_reached: bool option ;
  connected_directories_current_count: int option ;
  connected_directories_limit: int option ;
  cloud_only_microsoft_ad_limit_reached: bool option ;
  cloud_only_microsoft_ad_current_count: int option ;
  cloud_only_microsoft_ad_limit: int option ;
  cloud_only_directories_limit_reached: bool option ;
  cloud_only_directories_current_count: int option ;
  cloud_only_directories_limit: int option }[@@ocaml.doc
                                              "Contains directory limit information for a Region.\n"]
type nonrec get_directory_limits_result =
  {
  directory_limits: directory_limits option }[@@ocaml.doc
                                               "Contains the results of the [GetDirectoryLimits] operation.\n"]
type nonrec get_directory_limits_request = unit
type nonrec event_topic =
  {
  status: topic_status option ;
  created_date_time: CoreTypes.Timestamp.t option ;
  topic_arn: string option ;
  topic_name: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Information about Amazon SNS topic and Directory Service directory associations.\n"]
type nonrec entity_already_exists_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The specified entity already exists.\n"]
type nonrec enable_sso_result = unit
type nonrec enable_sso_request =
  {
  password: string option ;
  user_name: string option ;
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [EnableSso] operation.\n"]
type nonrec authentication_failed_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc "An authentication error occurred.\n"]
type nonrec enable_radius_result = unit
type nonrec enable_radius_request =
  {
  radius_settings: radius_settings ;
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [EnableRadius] operation.\n"]
type nonrec enable_ldaps_result = unit
type nonrec enable_ldaps_request = {
  type_: ldaps_type ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec enable_client_authentication_result = unit
type nonrec client_authentication_type =
  | SMART_CARD_OR_PASSWORD 
  | SMART_CARD [@@ocaml.doc ""]
type nonrec enable_client_authentication_request =
  {
  type_: client_authentication_type ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec domain_controller_status =
  | FAILED 
  | DELETED 
  | DELETING 
  | RESTORING 
  | IMPAIRED 
  | ACTIVE 
  | CREATING [@@ocaml.doc ""]
type nonrec domain_controller =
  {
  status_last_updated_date_time: CoreTypes.Timestamp.t option ;
  launch_time: CoreTypes.Timestamp.t option ;
  status_reason: string option ;
  status: domain_controller_status option ;
  availability_zone: string option ;
  subnet_id: string option ;
  vpc_id: string option ;
  dns_ip_addr: string option ;
  domain_controller_id: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Contains information about the domain controllers for a specified directory.\n"]
type nonrec disable_sso_result = unit
type nonrec disable_sso_request =
  {
  password: string option ;
  user_name: string option ;
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [DisableSso] operation.\n"]
type nonrec disable_radius_result = unit
type nonrec disable_radius_request = {
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [DisableRadius] operation.\n"]
type nonrec disable_ldaps_result = unit
type nonrec disable_ldaps_request =
  {
  type_: ldaps_type ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec disable_client_authentication_result = unit
type nonrec disable_client_authentication_request =
  {
  type_: client_authentication_type ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec directory_type =
  | SHARED_MICROSOFT_AD 
  | MICROSOFT_AD 
  | AD_CONNECTOR 
  | SIMPLE_AD [@@ocaml.doc ""]
type nonrec directory_size =
  | LARGE 
  | SMALL [@@ocaml.doc ""]
type nonrec describe_update_directory_result =
  {
  next_token: string option ;
  update_activities: update_info_entry list option }[@@ocaml.doc ""]
type nonrec describe_update_directory_request =
  {
  next_token: string option ;
  region_name: string option ;
  update_type: update_type ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec describe_trusts_result =
  {
  next_token: string option ;
  trusts: trust list option }[@@ocaml.doc
                               "The result of a DescribeTrust request.\n"]
type nonrec describe_trusts_request =
  {
  limit: int option ;
  next_token: string option ;
  trust_ids: string list option ;
  directory_id: string option }[@@ocaml.doc
                                 "Describes the trust relationships for a particular Managed Microsoft AD directory. If no input parameters are provided, such as directory ID or trust ID, this request describes all the trust relationships.\n"]
type nonrec describe_snapshots_result =
  {
  next_token: string option ;
  snapshots: snapshot list option }[@@ocaml.doc
                                     "Contains the results of the [DescribeSnapshots] operation.\n"]
type nonrec describe_snapshots_request =
  {
  limit: int option ;
  next_token: string option ;
  snapshot_ids: string list option ;
  directory_id: string option }[@@ocaml.doc
                                 "Contains the inputs for the [DescribeSnapshots] operation.\n"]
type nonrec describe_shared_directories_result =
  {
  next_token: string option ;
  shared_directories: shared_directory list option }[@@ocaml.doc ""]
type nonrec describe_shared_directories_request =
  {
  limit: int option ;
  next_token: string option ;
  shared_directory_ids: string list option ;
  owner_directory_id: string }[@@ocaml.doc ""]
type nonrec describe_settings_result =
  {
  next_token: string option ;
  setting_entries: setting_entry list option ;
  directory_id: string option }[@@ocaml.doc ""]
type nonrec describe_settings_request =
  {
  next_token: string option ;
  status: directory_configuration_status option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec describe_regions_result =
  {
  next_token: string option ;
  regions_description: region_description list option }[@@ocaml.doc ""]
type nonrec describe_regions_request =
  {
  next_token: string option ;
  region_name: string option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec describe_ldaps_settings_result =
  {
  next_token: string option ;
  ldaps_settings_info: ldaps_setting_info list option }[@@ocaml.doc ""]
type nonrec describe_ldaps_settings_request =
  {
  limit: int option ;
  next_token: string option ;
  type_: ldaps_type option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec describe_event_topics_result =
  {
  event_topics: event_topic list option }[@@ocaml.doc
                                           "The result of a DescribeEventTopic request.\n"]
type nonrec describe_event_topics_request =
  {
  topic_names: string list option ;
  directory_id: string option }[@@ocaml.doc "Describes event topics.\n"]
type nonrec describe_domain_controllers_result =
  {
  next_token: string option ;
  domain_controllers: domain_controller list option }[@@ocaml.doc ""]
type nonrec describe_domain_controllers_request =
  {
  limit: int option ;
  next_token: string option ;
  domain_controller_ids: string list option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec directory_edition =
  | STANDARD 
  | ENTERPRISE [@@ocaml.doc ""]
type nonrec directory_connect_settings_description =
  {
  connect_ips: string list option ;
  availability_zones: string list option ;
  security_group_id: string option ;
  customer_user_name: string option ;
  subnet_ids: string list option ;
  vpc_id: string option }[@@ocaml.doc
                           "Contains information about an AD Connector directory.\n"]
type nonrec directory_description =
  {
  os_version: os_version option ;
  regions_info: regions_info option ;
  owner_directory_description: owner_directory_description option ;
  desired_number_of_domain_controllers: int option ;
  sso_enabled: bool option ;
  stage_reason: string option ;
  radius_status: radius_status option ;
  radius_settings: radius_settings option ;
  connect_settings: directory_connect_settings_description option ;
  vpc_settings: directory_vpc_settings_description option ;
  type_: directory_type option ;
  stage_last_updated_date_time: CoreTypes.Timestamp.t option ;
  launch_time: CoreTypes.Timestamp.t option ;
  share_notes: string option ;
  share_method: share_method option ;
  share_status: share_status option ;
  stage: directory_stage option ;
  dns_ip_addrs: string list option ;
  description: string option ;
  access_url: string option ;
  alias: string option ;
  edition: directory_edition option ;
  size: directory_size option ;
  short_name: string option ;
  name: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Contains information about an Directory Service directory.\n"]
type nonrec describe_directories_result =
  {
  next_token: string option ;
  directory_descriptions: directory_description list option }[@@ocaml.doc
                                                               "Contains the results of the [DescribeDirectories] operation.\n"]
type nonrec describe_directories_request =
  {
  limit: int option ;
  next_token: string option ;
  directory_ids: string list option }[@@ocaml.doc
                                       "Contains the inputs for the [DescribeDirectories] operation.\n"]
type nonrec conditional_forwarder =
  {
  replication_scope: replication_scope option ;
  dns_ip_addrs: string list option ;
  remote_domain_name: string option }[@@ocaml.doc
                                       "Points to a remote domain with which you are setting up a trust relationship. Conditional forwarders are required in order to set up a trust relationship with another domain.\n"]
type nonrec describe_conditional_forwarders_result =
  {
  conditional_forwarders: conditional_forwarder list option }[@@ocaml.doc
                                                               "The result of a DescribeConditionalForwarder request.\n"]
type nonrec describe_conditional_forwarders_request =
  {
  remote_domain_names: string list option ;
  directory_id: string }[@@ocaml.doc "Describes a conditional forwarder.\n"]
type nonrec client_authentication_status =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec client_authentication_setting_info =
  {
  last_updated_date_time: CoreTypes.Timestamp.t option ;
  status: client_authentication_status option ;
  type_: client_authentication_type option }[@@ocaml.doc
                                              "Contains information about a client authentication method for a directory.\n"]
type nonrec describe_client_authentication_settings_result =
  {
  next_token: string option ;
  client_authentication_settings_info:
    client_authentication_setting_info list option }[@@ocaml.doc ""]
type nonrec describe_client_authentication_settings_request =
  {
  limit: int option ;
  next_token: string option ;
  type_: client_authentication_type option ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec certificate_does_not_exist_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The certificate is not present in the system for describe or deregister activities.\n"]
type nonrec certificate =
  {
  client_cert_auth_settings: client_cert_auth_settings option ;
  type_: certificate_type option ;
  expiry_date_time: CoreTypes.Timestamp.t option ;
  registered_date_time: CoreTypes.Timestamp.t option ;
  common_name: string option ;
  state_reason: string option ;
  state: certificate_state option ;
  certificate_id: string option }[@@ocaml.doc
                                   "Information about the certificate.\n"]
type nonrec describe_certificate_result = {
  certificate: certificate option }[@@ocaml.doc ""]
type nonrec describe_certificate_request =
  {
  certificate_id: string ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec deregister_event_topic_result = unit
type nonrec deregister_event_topic_request =
  {
  topic_name: string ;
  directory_id: string }[@@ocaml.doc
                          "Removes the specified directory as a publisher to the specified Amazon SNS topic.\n"]
type nonrec certificate_in_use_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The certificate is being used for the LDAP security connection and cannot be removed without disabling LDAP security.\n"]
type nonrec deregister_certificate_result = unit
type nonrec deregister_certificate_request =
  {
  certificate_id: string ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec delete_trust_result = {
  trust_id: string option }[@@ocaml.doc
                             "The result of a DeleteTrust request.\n"]
type nonrec delete_trust_request =
  {
  delete_associated_conditional_forwarder: bool option ;
  trust_id: string }[@@ocaml.doc
                      "Deletes the local side of an existing trust relationship between the Managed Microsoft AD directory and the external domain.\n"]
type nonrec delete_snapshot_result = {
  snapshot_id: string option }[@@ocaml.doc
                                "Contains the results of the [DeleteSnapshot] operation.\n"]
type nonrec delete_snapshot_request = {
  snapshot_id: string }[@@ocaml.doc
                         "Contains the inputs for the [DeleteSnapshot] operation.\n"]
type nonrec delete_log_subscription_result = unit
type nonrec delete_log_subscription_request = {
  directory_id: string }[@@ocaml.doc ""]
type nonrec delete_directory_result = {
  directory_id: string option }[@@ocaml.doc
                                 "Contains the results of the [DeleteDirectory] operation.\n"]
type nonrec delete_directory_request = {
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [DeleteDirectory] operation.\n"]
type nonrec delete_conditional_forwarder_result = unit
type nonrec delete_conditional_forwarder_request =
  {
  remote_domain_name: string ;
  directory_id: string }[@@ocaml.doc "Deletes a conditional forwarder.\n"]
type nonrec create_trust_result = {
  trust_id: string option }[@@ocaml.doc
                             "The result of a CreateTrust request.\n"]
type nonrec create_trust_request =
  {
  selective_auth: selective_auth option ;
  conditional_forwarder_ip_addrs: string list option ;
  trust_type: trust_type option ;
  trust_direction: trust_direction ;
  trust_password: string ;
  remote_domain_name: string ;
  directory_id: string }[@@ocaml.doc
                          "Directory Service for Microsoft Active Directory allows you to configure trust relationships. For example, you can establish a trust between your Managed Microsoft AD directory, and your existing self-managed Microsoft Active Directory. This would allow you to provide users and groups access to resources in either domain, with a single set of credentials.\n\n This action initiates the creation of the Amazon Web Services side of a trust relationship between an Managed Microsoft AD directory and an external domain.\n "]
type nonrec create_snapshot_result = {
  snapshot_id: string option }[@@ocaml.doc
                                "Contains the results of the [CreateSnapshot] operation.\n"]
type nonrec create_snapshot_request =
  {
  name: string option ;
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [CreateSnapshot] operation.\n"]
type nonrec directory_limit_exceeded_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The maximum number of directories in the region has been reached. You can use the [GetDirectoryLimits] operation to determine your directory limits in the region.\n"]
type nonrec create_microsoft_ad_result = {
  directory_id: string option }[@@ocaml.doc
                                 "Result of a CreateMicrosoftAD request.\n"]
type nonrec create_microsoft_ad_request =
  {
  tags: tag list option ;
  edition: directory_edition option ;
  vpc_settings: directory_vpc_settings ;
  description: string option ;
  password: string ;
  short_name: string option ;
  name: string }[@@ocaml.doc "Creates an Managed Microsoft AD directory.\n"]
type nonrec create_log_subscription_result = unit
type nonrec create_log_subscription_request =
  {
  log_group_name: string ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec create_directory_result = {
  directory_id: string option }[@@ocaml.doc
                                 "Contains the results of the [CreateDirectory] operation.\n"]
type nonrec create_directory_request =
  {
  tags: tag list option ;
  vpc_settings: directory_vpc_settings option ;
  size: directory_size ;
  description: string option ;
  password: string ;
  short_name: string option ;
  name: string }[@@ocaml.doc
                  "Contains the inputs for the [CreateDirectory] operation. \n"]
type nonrec create_conditional_forwarder_result = unit
type nonrec create_conditional_forwarder_request =
  {
  dns_ip_addrs: string list ;
  remote_domain_name: string ;
  directory_id: string }[@@ocaml.doc
                          "Initiates the creation of a conditional forwarder for your Directory Service for Microsoft Active Directory. Conditional forwarders are required in order to set up a trust relationship with another domain.\n"]
type nonrec attribute = {
  value: string option ;
  name: string option }[@@ocaml.doc
                         "Represents a named directory attribute.\n"]
type nonrec computer =
  {
  computer_attributes: attribute list option ;
  computer_name: string option ;
  computer_id: string option }[@@ocaml.doc
                                "Contains information about a computer account in a directory.\n"]
type nonrec create_computer_result = {
  computer: computer option }[@@ocaml.doc
                               "Contains the results for the [CreateComputer] operation.\n"]
type nonrec create_computer_request =
  {
  computer_attributes: attribute list option ;
  organizational_unit_distinguished_name: string option ;
  password: string ;
  computer_name: string ;
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [CreateComputer] operation.\n"]
type nonrec create_alias_result =
  {
  alias: string option ;
  directory_id: string option }[@@ocaml.doc
                                 "Contains the results of the [CreateAlias] operation.\n"]
type nonrec create_alias_request = {
  alias: string ;
  directory_id: string }[@@ocaml.doc
                          "Contains the inputs for the [CreateAlias] operation.\n"]
type nonrec connect_directory_result = {
  directory_id: string option }[@@ocaml.doc
                                 "Contains the results of the [ConnectDirectory] operation.\n"]
type nonrec directory_connect_settings =
  {
  customer_user_name: string ;
  customer_dns_ips: string list ;
  subnet_ids: string list ;
  vpc_id: string }[@@ocaml.doc
                    "Contains information for the [ConnectDirectory] operation when an AD Connector directory is being created.\n"]
type nonrec connect_directory_request =
  {
  tags: tag list option ;
  connect_settings: directory_connect_settings ;
  size: directory_size ;
  description: string option ;
  password: string ;
  short_name: string option ;
  name: string }[@@ocaml.doc
                  "Contains the inputs for the [ConnectDirectory] operation.\n"]
type nonrec cancel_schema_extension_result = unit
type nonrec cancel_schema_extension_request =
  {
  schema_extension_id: string ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec add_tags_to_resource_result = unit
type nonrec add_tags_to_resource_request =
  {
  tags: tag list ;
  resource_id: string }[@@ocaml.doc ""]
type nonrec directory_already_in_region_exception =
  {
  request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The Region you specified is the same Region where the Managed Microsoft AD directory was created. Specify a different Region and try again.\n"]
type nonrec add_region_result = unit
type nonrec add_region_request =
  {
  vpc_settings: directory_vpc_settings ;
  region_name: string ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec add_ip_routes_result = unit
type nonrec add_ip_routes_request =
  {
  update_security_group_for_directory_controllers: bool option ;
  ip_routes: ip_route list ;
  directory_id: string }[@@ocaml.doc ""]
type nonrec accept_shared_directory_result =
  {
  shared_directory: shared_directory option }[@@ocaml.doc ""]
type nonrec accept_shared_directory_request = {
  shared_directory_id: string }[@@ocaml.doc ""]