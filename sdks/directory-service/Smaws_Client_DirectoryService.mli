(** 
    Directory Service client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
  shared_directory_id: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_verify_trust_request :
  trust_id:string -> unit -> verify_trust_request
val make_os_update_settings :
  ?os_version:os_version -> unit -> os_update_settings
val make_update_value :
  ?os_update_settings:os_update_settings -> unit -> update_value
val make_update_trust_request :
  ?selective_auth:selective_auth ->
    trust_id:string -> unit -> update_trust_request
val make_setting : value:string -> name:string -> unit -> setting
val make_update_settings_request :
  settings:setting list ->
    directory_id:string -> unit -> update_settings_request
val make_radius_settings :
  ?use_same_username:bool ->
    ?display_label:string ->
      ?authentication_protocol:radius_authentication_protocol ->
        ?shared_secret:string ->
          ?radius_retries:int ->
            ?radius_timeout:int ->
              ?radius_port:int ->
                ?radius_servers:string list -> unit -> radius_settings
val make_update_radius_request :
  radius_settings:radius_settings ->
    directory_id:string -> unit -> update_radius_request
val make_update_number_of_domain_controllers_request :
  desired_number:int ->
    directory_id:string ->
      unit -> update_number_of_domain_controllers_request
val make_update_info_entry :
  ?last_updated_date_time:CoreTypes.Timestamp.t ->
    ?start_time:CoreTypes.Timestamp.t ->
      ?previous_value:update_value ->
        ?new_value:update_value ->
          ?initiated_by:string ->
            ?status_reason:string ->
              ?status:update_status ->
                ?region:string -> unit -> update_info_entry
val make_update_directory_setup_request :
  ?create_snapshot_before_update:bool ->
    ?os_update_settings:os_update_settings ->
      update_type:update_type ->
        directory_id:string -> unit -> update_directory_setup_request
val make_update_conditional_forwarder_request :
  dns_ip_addrs:string list ->
    remote_domain_name:string ->
      directory_id:string -> unit -> update_conditional_forwarder_request
val make_unshare_target :
  type_:target_type -> id:string -> unit -> unshare_target
val make_unshare_directory_request :
  unshare_target:unshare_target ->
    directory_id:string -> unit -> unshare_directory_request
val make_trust :
  ?selective_auth:selective_auth ->
    ?trust_state_reason:string ->
      ?state_last_updated_date_time:CoreTypes.Timestamp.t ->
        ?last_updated_date_time:CoreTypes.Timestamp.t ->
          ?created_date_time:CoreTypes.Timestamp.t ->
            ?trust_state:trust_state ->
              ?trust_direction:trust_direction ->
                ?trust_type:trust_type ->
                  ?remote_domain_name:string ->
                    ?trust_id:string -> ?directory_id:string -> unit -> trust
val make_tag : value:string -> key:string -> unit -> tag
val make_start_schema_extension_request :
  description:string ->
    ldif_content:string ->
      create_snapshot_before_schema_extension:bool ->
        directory_id:string -> unit -> start_schema_extension_request
val make_snapshot :
  ?start_time:CoreTypes.Timestamp.t ->
    ?status:snapshot_status ->
      ?name:string ->
        ?type_:snapshot_type ->
          ?snapshot_id:string -> ?directory_id:string -> unit -> snapshot
val make_snapshot_limits :
  ?manual_snapshots_limit_reached:bool ->
    ?manual_snapshots_current_count:int ->
      ?manual_snapshots_limit:int -> unit -> snapshot_limits
val make_shared_directory :
  ?last_updated_date_time:CoreTypes.Timestamp.t ->
    ?created_date_time:CoreTypes.Timestamp.t ->
      ?share_notes:string ->
        ?share_status:share_status ->
          ?shared_directory_id:string ->
            ?shared_account_id:string ->
              ?share_method:share_method ->
                ?owner_directory_id:string ->
                  ?owner_account_id:string -> unit -> shared_directory
val make_share_target :
  type_:target_type -> id:string -> unit -> share_target
val make_share_directory_request :
  ?share_notes:string ->
    share_method:share_method ->
      share_target:share_target ->
        directory_id:string -> unit -> share_directory_request
val make_setting_entry :
  ?data_type:string ->
    ?last_requested_date_time:CoreTypes.Timestamp.t ->
      ?last_updated_date_time:CoreTypes.Timestamp.t ->
        ?request_status_message:string ->
          ?request_detailed_status:directory_configuration_setting_request_detailed_status
            ->
            ?request_status:directory_configuration_status ->
              ?requested_value:string ->
                ?applied_value:string ->
                  ?allowed_values:string ->
                    ?name:string -> ?type_:string -> unit -> setting_entry
val make_schema_extension_info :
  ?end_date_time:CoreTypes.Timestamp.t ->
    ?start_date_time:CoreTypes.Timestamp.t ->
      ?schema_extension_status_reason:string ->
        ?schema_extension_status:schema_extension_status ->
          ?description:string ->
            ?schema_extension_id:string ->
              ?directory_id:string -> unit -> schema_extension_info
val make_restore_from_snapshot_request :
  snapshot_id:string -> unit -> restore_from_snapshot_request
val make_reset_user_password_request :
  new_password:string ->
    user_name:string ->
      directory_id:string -> unit -> reset_user_password_request
val make_remove_tags_from_resource_request :
  tag_keys:string list ->
    resource_id:string -> unit -> remove_tags_from_resource_request
val make_remove_region_request :
  directory_id:string -> unit -> remove_region_request
val make_remove_ip_routes_request :
  cidr_ips:string list ->
    directory_id:string -> unit -> remove_ip_routes_request
val make_reject_shared_directory_request :
  shared_directory_id:string -> unit -> reject_shared_directory_request
val make_register_event_topic_request :
  topic_name:string ->
    directory_id:string -> unit -> register_event_topic_request
val make_client_cert_auth_settings :
  ?ocsp_url:string -> unit -> client_cert_auth_settings
val make_register_certificate_request :
  ?client_cert_auth_settings:client_cert_auth_settings ->
    ?type_:certificate_type ->
      certificate_data:string ->
        directory_id:string -> unit -> register_certificate_request
val make_regions_info :
  ?additional_regions:string list ->
    ?primary_region:string -> unit -> regions_info
val make_directory_vpc_settings :
  subnet_ids:string list -> vpc_id:string -> unit -> directory_vpc_settings
val make_region_description :
  ?last_updated_date_time:CoreTypes.Timestamp.t ->
    ?status_last_updated_date_time:CoreTypes.Timestamp.t ->
      ?launch_time:CoreTypes.Timestamp.t ->
        ?desired_number_of_domain_controllers:int ->
          ?vpc_settings:directory_vpc_settings ->
            ?status:directory_stage ->
              ?region_type:region_type ->
                ?region_name:string ->
                  ?directory_id:string -> unit -> region_description
val make_directory_vpc_settings_description :
  ?availability_zones:string list ->
    ?security_group_id:string ->
      ?subnet_ids:string list ->
        ?vpc_id:string -> unit -> directory_vpc_settings_description
val make_owner_directory_description :
  ?radius_status:radius_status ->
    ?radius_settings:radius_settings ->
      ?vpc_settings:directory_vpc_settings_description ->
        ?dns_ip_addrs:string list ->
          ?account_id:string ->
            ?directory_id:string -> unit -> owner_directory_description
val make_log_subscription :
  ?subscription_created_date_time:CoreTypes.Timestamp.t ->
    ?log_group_name:string ->
      ?directory_id:string -> unit -> log_subscription
val make_list_tags_for_resource_request :
  ?limit:int ->
    ?next_token:string ->
      resource_id:string -> unit -> list_tags_for_resource_request
val make_list_schema_extensions_request :
  ?limit:int ->
    ?next_token:string ->
      directory_id:string -> unit -> list_schema_extensions_request
val make_list_log_subscriptions_request :
  ?limit:int ->
    ?next_token:string ->
      ?directory_id:string -> unit -> list_log_subscriptions_request
val make_ip_route_info :
  ?description:string ->
    ?ip_route_status_reason:string ->
      ?added_date_time:CoreTypes.Timestamp.t ->
        ?ip_route_status_msg:ip_route_status_msg ->
          ?cidr_ip:string -> ?directory_id:string -> unit -> ip_route_info
val make_list_ip_routes_request :
  ?limit:int ->
    ?next_token:string ->
      directory_id:string -> unit -> list_ip_routes_request
val make_certificate_info :
  ?type_:certificate_type ->
    ?expiry_date_time:CoreTypes.Timestamp.t ->
      ?state:certificate_state ->
        ?common_name:string ->
          ?certificate_id:string -> unit -> certificate_info
val make_list_certificates_request :
  ?limit:int ->
    ?next_token:string ->
      directory_id:string -> unit -> list_certificates_request
val make_ldaps_setting_info :
  ?last_updated_date_time:CoreTypes.Timestamp.t ->
    ?ldaps_status_reason:string ->
      ?ldaps_status:ldaps_status -> unit -> ldaps_setting_info
val make_ip_route :
  ?description:string -> ?cidr_ip:string -> unit -> ip_route
val make_get_snapshot_limits_request :
  directory_id:string -> unit -> get_snapshot_limits_request
val make_directory_limits :
  ?connected_directories_limit_reached:bool ->
    ?connected_directories_current_count:int ->
      ?connected_directories_limit:int ->
        ?cloud_only_microsoft_ad_limit_reached:bool ->
          ?cloud_only_microsoft_ad_current_count:int ->
            ?cloud_only_microsoft_ad_limit:int ->
              ?cloud_only_directories_limit_reached:bool ->
                ?cloud_only_directories_current_count:int ->
                  ?cloud_only_directories_limit:int ->
                    unit -> directory_limits
val make_get_directory_limits_request : unit -> get_directory_limits_request
val make_event_topic :
  ?status:topic_status ->
    ?created_date_time:CoreTypes.Timestamp.t ->
      ?topic_arn:string ->
        ?topic_name:string -> ?directory_id:string -> unit -> event_topic
val make_enable_sso_request :
  ?password:string ->
    ?user_name:string -> directory_id:string -> unit -> enable_sso_request
val make_enable_radius_request :
  radius_settings:radius_settings ->
    directory_id:string -> unit -> enable_radius_request
val make_enable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit -> enable_ldaps_request
val make_enable_client_authentication_request :
  type_:client_authentication_type ->
    directory_id:string -> unit -> enable_client_authentication_request
val make_domain_controller :
  ?status_last_updated_date_time:CoreTypes.Timestamp.t ->
    ?launch_time:CoreTypes.Timestamp.t ->
      ?status_reason:string ->
        ?status:domain_controller_status ->
          ?availability_zone:string ->
            ?subnet_id:string ->
              ?vpc_id:string ->
                ?dns_ip_addr:string ->
                  ?domain_controller_id:string ->
                    ?directory_id:string -> unit -> domain_controller
val make_disable_sso_request :
  ?password:string ->
    ?user_name:string -> directory_id:string -> unit -> disable_sso_request
val make_disable_radius_request :
  directory_id:string -> unit -> disable_radius_request
val make_disable_ldaps_request :
  type_:ldaps_type -> directory_id:string -> unit -> disable_ldaps_request
val make_disable_client_authentication_request :
  type_:client_authentication_type ->
    directory_id:string -> unit -> disable_client_authentication_request
val make_describe_update_directory_request :
  ?next_token:string ->
    ?region_name:string ->
      update_type:update_type ->
        directory_id:string -> unit -> describe_update_directory_request
val make_describe_trusts_request :
  ?limit:int ->
    ?next_token:string ->
      ?trust_ids:string list ->
        ?directory_id:string -> unit -> describe_trusts_request
val make_describe_snapshots_request :
  ?limit:int ->
    ?next_token:string ->
      ?snapshot_ids:string list ->
        ?directory_id:string -> unit -> describe_snapshots_request
val make_describe_shared_directories_request :
  ?limit:int ->
    ?next_token:string ->
      ?shared_directory_ids:string list ->
        owner_directory_id:string ->
          unit -> describe_shared_directories_request
val make_describe_settings_request :
  ?next_token:string ->
    ?status:directory_configuration_status ->
      directory_id:string -> unit -> describe_settings_request
val make_describe_regions_request :
  ?next_token:string ->
    ?region_name:string ->
      directory_id:string -> unit -> describe_regions_request
val make_describe_ldaps_settings_request :
  ?limit:int ->
    ?next_token:string ->
      ?type_:ldaps_type ->
        directory_id:string -> unit -> describe_ldaps_settings_request
val make_describe_event_topics_request :
  ?topic_names:string list ->
    ?directory_id:string -> unit -> describe_event_topics_request
val make_describe_domain_controllers_request :
  ?limit:int ->
    ?next_token:string ->
      ?domain_controller_ids:string list ->
        directory_id:string -> unit -> describe_domain_controllers_request
val make_directory_connect_settings_description :
  ?connect_ips:string list ->
    ?availability_zones:string list ->
      ?security_group_id:string ->
        ?customer_user_name:string ->
          ?subnet_ids:string list ->
            ?vpc_id:string -> unit -> directory_connect_settings_description
val make_directory_description :
  ?os_version:os_version ->
    ?regions_info:regions_info ->
      ?owner_directory_description:owner_directory_description ->
        ?desired_number_of_domain_controllers:int ->
          ?sso_enabled:bool ->
            ?stage_reason:string ->
              ?radius_status:radius_status ->
                ?radius_settings:radius_settings ->
                  ?connect_settings:directory_connect_settings_description ->
                    ?vpc_settings:directory_vpc_settings_description ->
                      ?type_:directory_type ->
                        ?stage_last_updated_date_time:CoreTypes.Timestamp.t
                          ->
                          ?launch_time:CoreTypes.Timestamp.t ->
                            ?share_notes:string ->
                              ?share_method:share_method ->
                                ?share_status:share_status ->
                                  ?stage:directory_stage ->
                                    ?dns_ip_addrs:string list ->
                                      ?description:string ->
                                        ?access_url:string ->
                                          ?alias:string ->
                                            ?edition:directory_edition ->
                                              ?size:directory_size ->
                                                ?short_name:string ->
                                                  ?name:string ->
                                                    ?directory_id:string ->
                                                      unit ->
                                                        directory_description
val make_describe_directories_request :
  ?limit:int ->
    ?next_token:string ->
      ?directory_ids:string list -> unit -> describe_directories_request
val make_conditional_forwarder :
  ?replication_scope:replication_scope ->
    ?dns_ip_addrs:string list ->
      ?remote_domain_name:string -> unit -> conditional_forwarder
val make_describe_conditional_forwarders_request :
  ?remote_domain_names:string list ->
    directory_id:string -> unit -> describe_conditional_forwarders_request
val make_client_authentication_setting_info :
  ?last_updated_date_time:CoreTypes.Timestamp.t ->
    ?status:client_authentication_status ->
      ?type_:client_authentication_type ->
        unit -> client_authentication_setting_info
val make_describe_client_authentication_settings_request :
  ?limit:int ->
    ?next_token:string ->
      ?type_:client_authentication_type ->
        directory_id:string ->
          unit -> describe_client_authentication_settings_request
val make_certificate :
  ?client_cert_auth_settings:client_cert_auth_settings ->
    ?type_:certificate_type ->
      ?expiry_date_time:CoreTypes.Timestamp.t ->
        ?registered_date_time:CoreTypes.Timestamp.t ->
          ?common_name:string ->
            ?state_reason:string ->
              ?state:certificate_state ->
                ?certificate_id:string -> unit -> certificate
val make_describe_certificate_request :
  certificate_id:string ->
    directory_id:string -> unit -> describe_certificate_request
val make_deregister_event_topic_request :
  topic_name:string ->
    directory_id:string -> unit -> deregister_event_topic_request
val make_deregister_certificate_request :
  certificate_id:string ->
    directory_id:string -> unit -> deregister_certificate_request
val make_delete_trust_request :
  ?delete_associated_conditional_forwarder:bool ->
    trust_id:string -> unit -> delete_trust_request
val make_delete_snapshot_request :
  snapshot_id:string -> unit -> delete_snapshot_request
val make_delete_log_subscription_request :
  directory_id:string -> unit -> delete_log_subscription_request
val make_delete_directory_request :
  directory_id:string -> unit -> delete_directory_request
val make_delete_conditional_forwarder_request :
  remote_domain_name:string ->
    directory_id:string -> unit -> delete_conditional_forwarder_request
val make_create_trust_request :
  ?selective_auth:selective_auth ->
    ?conditional_forwarder_ip_addrs:string list ->
      ?trust_type:trust_type ->
        trust_direction:trust_direction ->
          trust_password:string ->
            remote_domain_name:string ->
              directory_id:string -> unit -> create_trust_request
val make_create_snapshot_request :
  ?name:string -> directory_id:string -> unit -> create_snapshot_request
val make_create_microsoft_ad_request :
  ?tags:tag list ->
    ?edition:directory_edition ->
      ?description:string ->
        ?short_name:string ->
          vpc_settings:directory_vpc_settings ->
            password:string ->
              name:string -> unit -> create_microsoft_ad_request
val make_create_log_subscription_request :
  log_group_name:string ->
    directory_id:string -> unit -> create_log_subscription_request
val make_create_directory_request :
  ?tags:tag list ->
    ?vpc_settings:directory_vpc_settings ->
      ?description:string ->
        ?short_name:string ->
          size:directory_size ->
            password:string ->
              name:string -> unit -> create_directory_request
val make_create_conditional_forwarder_request :
  dns_ip_addrs:string list ->
    remote_domain_name:string ->
      directory_id:string -> unit -> create_conditional_forwarder_request
val make_attribute : ?value:string -> ?name:string -> unit -> attribute
val make_computer :
  ?computer_attributes:attribute list ->
    ?computer_name:string -> ?computer_id:string -> unit -> computer
val make_create_computer_request :
  ?computer_attributes:attribute list ->
    ?organizational_unit_distinguished_name:string ->
      password:string ->
        computer_name:string ->
          directory_id:string -> unit -> create_computer_request
val make_create_alias_request :
  alias:string -> directory_id:string -> unit -> create_alias_request
val make_directory_connect_settings :
  customer_user_name:string ->
    customer_dns_ips:string list ->
      subnet_ids:string list ->
        vpc_id:string -> unit -> directory_connect_settings
val make_connect_directory_request :
  ?tags:tag list ->
    ?description:string ->
      ?short_name:string ->
        connect_settings:directory_connect_settings ->
          size:directory_size ->
            password:string ->
              name:string -> unit -> connect_directory_request
val make_cancel_schema_extension_request :
  schema_extension_id:string ->
    directory_id:string -> unit -> cancel_schema_extension_request
val make_add_tags_to_resource_request :
  tags:tag list -> resource_id:string -> unit -> add_tags_to_resource_request
val make_add_region_request :
  vpc_settings:directory_vpc_settings ->
    region_name:string -> directory_id:string -> unit -> add_region_request
val make_add_ip_routes_request :
  ?update_security_group_for_directory_controllers:bool ->
    ip_routes:ip_route list ->
      directory_id:string -> unit -> add_ip_routes_request
val make_accept_shared_directory_request :
  shared_directory_id:string -> unit -> accept_shared_directory_request(** {1:operations Operations} *)

module AcceptSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      accept_shared_directory_request ->
        (accept_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Accepts a directory sharing request that was sent from the directory owner account.
 *)

  
end

module AddIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      add_ip_routes_request ->
        (add_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `IpRouteLimitExceededException of ip_route_limit_exceeded_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** If the DNS server for your self-managed domain uses a publicly addressable IP address, you must add a CIDR address block to correctly route traffic to and from your Microsoft AD on Amazon Web Services. {i AddIpRoutes} adds this address block. You can also use {i AddIpRoutes} to facilitate routing traffic that uses public IP ranges from your Microsoft AD on Amazon Web Services to a peer VPC. 

 Before you call {i AddIpRoutes}, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the {i AddIpRoutes} operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
  *)

  
end

module AddRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      add_region_request ->
        (add_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadyInRegionException of directory_already_in_region_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `RegionLimitExceededException of region_limit_exceeded_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Adds two domain controllers in the specified Region for the specified directory.
 *)

  
end

module AddTagsToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_to_resource_request ->
        (add_tags_to_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `TagLimitExceededException of tag_limit_exceeded_exception
            
        ]
      ) result
  (** Adds or overwrites one or more tags for the specified directory. Each directory can have a maximum of 50 tags. Each tag consists of a key and optional value. Tag keys must be unique to each resource.
 *)

  
end

module CancelSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_schema_extension_request ->
        (cancel_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Cancels an in-progress schema extension to a Microsoft AD directory. Once a schema extension has started replicating to all domain controllers, the task can no longer be canceled. A schema extension can be canceled during any of the following states; [Initializing], [CreatingSnapshot], and [UpdatingSchema].
 *)

  
end

module ConnectDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      connect_directory_request ->
        (connect_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Creates an AD Connector to connect to a self-managed directory.

 Before you call [ConnectDirectory], ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the [ConnectDirectory] operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
  *)

  
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Creates an alias for a directory and assigns the alias to the directory. The alias is used to construct the access URL for the directory, such as 
{[
http://.awsapps.com
]}
.

  After an alias has been created, it cannot be deleted or reused, so this operation should only be used when absolutely necessary.
  
    *)

  
end

module CreateComputer : sig
  val request :
    Smaws_Lib.Context.t ->
      create_computer_request ->
        (create_computer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Creates an Active Directory computer object in the specified directory.
 *)

  
end

module CreateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      create_conditional_forwarder_request ->
        (create_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Creates a conditional forwarder associated with your Amazon Web Services directory. Conditional forwarders are required in order to set up a trust relationship with another domain. The conditional forwarder points to the trusted domain.
 *)

  
end

module CreateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      create_directory_request ->
        (create_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Creates a Simple AD directory. For more information, see {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_simple_ad.html}Simple Active Directory} in the {i Directory Service Admin Guide}.

 Before you call [CreateDirectory], ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the [CreateDirectory] operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
  *)

  
end

module CreateLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      create_log_subscription_request ->
        (create_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Creates a subscription to forward real-time Directory Service domain controller security logs to the specified Amazon CloudWatch log group in your Amazon Web Services account.
 *)

  
end

module CreateMicrosoftAD : sig
  val request :
    Smaws_Lib.Context.t ->
      create_microsoft_ad_request ->
        (create_microsoft_ad_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryLimitExceededException of directory_limit_exceeded_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Creates a Microsoft AD directory in the Amazon Web Services Cloud. For more information, see {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/directory_microsoft_ad.html}Managed Microsoft AD} in the {i Directory Service Admin Guide}.

 Before you call {i CreateMicrosoftAD}, ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the {i CreateMicrosoftAD} operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
  *)

  
end

module CreateSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_snapshot_request ->
        (create_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
  (** Creates a snapshot of a Simple AD or Microsoft AD directory in the Amazon Web Services cloud.

  You cannot take snapshots of AD Connector directories.
  
    *)

  
end

module CreateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      create_trust_request ->
        (create_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Directory Service for Microsoft Active Directory allows you to configure trust relationships. For example, you can establish a trust between your Managed Microsoft AD directory, and your existing self-managed Microsoft Active Directory. This would allow you to provide users and groups access to resources in either domain, with a single set of credentials.

 This action initiates the creation of the Amazon Web Services side of a trust relationship between an Managed Microsoft AD directory and an external domain. You can create either a forest trust or an external trust.
  *)

  
end

module DeleteConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_conditional_forwarder_request ->
        (delete_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deletes a conditional forwarder that has been set up for your Amazon Web Services directory.
 *)

  
end

module DeleteDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_directory_request ->
        (delete_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Deletes an Directory Service directory.

 Before you call [DeleteDirectory], ensure that all of the required permissions have been explicitly granted through a policy. For details about what permissions are required to run the [DeleteDirectory] operation, see {{:http://docs.aws.amazon.com/directoryservice/latest/admin-guide/UsingWithDS_IAM_ResourcePermissions.html}Directory Service API Permissions: Actions, Resources, and Conditions Reference}.
  *)

  
end

module DeleteLogSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_log_subscription_request ->
        (delete_log_subscription_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deletes the specified log subscription.
 *)

  
end

module DeleteSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_snapshot_request ->
        (delete_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Deletes a directory snapshot.
 *)

  
end

module DeleteTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_trust_request ->
        (delete_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deletes an existing trust relationship between your Managed Microsoft AD directory and an external domain.
 *)

  
end

module DeregisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_certificate_request ->
        (deregister_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `CertificateInUseException of certificate_in_use_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deletes from the system the certificate that was registered for secure LDAP or client certificate authentication.
 *)

  
end

module DeregisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_event_topic_request ->
        (deregister_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Removes the specified directory as a publisher to the specified Amazon SNS topic.
 *)

  
end

module DescribeCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_certificate_request ->
        (describe_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateDoesNotExistException of certificate_does_not_exist_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Displays information about the certificate registered for secure LDAP or client certificate authentication.
 *)

  
end

module DescribeClientAuthenticationSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_client_authentication_settings_request ->
        (describe_client_authentication_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Retrieves information about the type of client authentication for the specified directory, if the type is specified. If no type is specified, information about all client authentication types that are supported for the specified directory is retrieved. Currently, only [SmartCard] is supported. 
 *)

  
end

module DescribeConditionalForwarders : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_conditional_forwarders_request ->
        (describe_conditional_forwarders_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Obtains information about the conditional forwarders for this account.

 If no input parameters are provided for RemoteDomainNames, this request describes all conditional forwarders for the specified directory ID.
  *)

  
end

module DescribeDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_directories_request ->
        (describe_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Obtains information about the directories that belong to this account.

 You can retrieve information about specific directories by passing the directory identifiers in the [DirectoryIds] parameter. Otherwise, all directories that belong to the current account are returned.
 
  This operation supports pagination with the use of the [NextToken] request and response parameters. If more results are available, the [DescribeDirectoriesResult.NextToken] member contains a token that you pass in the next call to [DescribeDirectories] to retrieve the next set of items.
  
   You can also specify a maximum number of return results with the [Limit] parameter.
    *)

  
end

module DescribeDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_controllers_request ->
        (describe_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Provides information about any domain controllers in your directory.
 *)

  
end

module DescribeEventTopics : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_topics_request ->
        (describe_event_topics_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Obtains information about which Amazon SNS topics receive status messages from the specified directory.

 If no input parameters are provided, such as DirectoryId or TopicName, this request describes all of the associations in the account.
  *)

  
end

module DescribeLDAPSSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_ldaps_settings_request ->
        (describe_ldaps_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Describes the status of LDAP security for the specified directory.
 *)

  
end

module DescribeRegions : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_regions_request ->
        (describe_regions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Provides information about the Regions that are configured for multi-Region replication.
 *)

  
end

module DescribeSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_settings_request ->
        (describe_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Retrieves information about the configurable settings for the specified directory.
 *)

  
end

module DescribeSharedDirectories : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_shared_directories_request ->
        (describe_shared_directories_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Returns the shared directories in your account. 
 *)

  
end

module DescribeSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_snapshots_request ->
        (describe_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Obtains information about the directory snapshots that belong to this account.

 This operation supports pagination with the use of the {i NextToken} request and response parameters. If more results are available, the {i DescribeSnapshots.NextToken} member contains a token that you pass in the next call to [DescribeSnapshots] to retrieve the next set of items.
 
  You can also specify a maximum number of return results with the {i Limit} parameter.
   *)

  
end

module DescribeTrusts : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_trusts_request ->
        (describe_trusts_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Obtains information about the trust relationships for this account.

 If no input parameters are provided, such as DirectoryId or TrustIds, this request describes all the trust relationships belonging to the account.
  *)

  
end

module DescribeUpdateDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_update_directory_request ->
        (describe_update_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (**  Describes the updates of a directory for a particular update type. 
 *)

  
end

module DisableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_client_authentication_request ->
        (disable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Disables alternative client authentication methods for the specified directory. 
 *)

  
end

module DisableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_ldaps_request ->
        (disable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deactivates LDAP secure calls for the specified directory.
 *)

  
end

module DisableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_radius_request ->
        (disable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Disables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD directory.
 *)

  
end

module DisableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_sso_request ->
        (disable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Disables single-sign on for a directory.
 *)

  
end

module EnableClientAuthentication : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_client_authentication_request ->
        (enable_client_authentication_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidClientAuthStatusException of invalid_client_auth_status_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Enables alternative client authentication methods for the specified directory.
 *)

  
end

module EnableLDAPS : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_ldaps_request ->
        (enable_ldaps_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidLDAPSStatusException of invalid_ldaps_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoAvailableCertificateException of no_available_certificate_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Activates the switch for the specific directory to always use LDAP secure calls.
 *)

  
end

module EnableRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_radius_request ->
        (enable_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityAlreadyExistsException of entity_already_exists_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Enables multi-factor authentication (MFA) with the Remote Authentication Dial In User Service (RADIUS) server for an AD Connector or Microsoft AD directory.
 *)

  
end

module EnableSso : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_sso_request ->
        (enable_sso_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AuthenticationFailedException of authentication_failed_exception
            | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InsufficientPermissionsException of insufficient_permissions_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Enables single sign-on for a directory. Single sign-on allows users in your directory to access certain Amazon Web Services services from a computer joined to the directory without having to enter their credentials separately.
 *)

  
end

module GetDirectoryLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_directory_limits_request ->
        (get_directory_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Obtains directory limit information for the current Region.
 *)

  
end

module GetSnapshotLimits : sig
  val request :
    Smaws_Lib.Context.t ->
      get_snapshot_limits_request ->
        (get_snapshot_limits_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Obtains the manual snapshot limits for a directory.
 *)

  
end

module ListCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_certificates_request ->
        (list_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** For the specified directory, lists all the certificates registered for a secure LDAP or client certificate authentication.
 *)

  
end

module ListIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_routes_request ->
        (list_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Lists the address blocks that you have added to a directory.
 *)

  
end

module ListLogSubscriptions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_log_subscriptions_request ->
        (list_log_subscriptions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Lists the active log subscriptions for the Amazon Web Services account.
 *)

  
end

module ListSchemaExtensions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_schema_extensions_request ->
        (list_schema_extensions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Lists all schema extensions applied to a Microsoft AD Directory.
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Lists all tags on a directory.
 *)

  
end

module RegisterCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      register_certificate_request ->
        (register_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CertificateAlreadyExistsException of certificate_already_exists_exception
            | `CertificateLimitExceededException of certificate_limit_exceeded_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidCertificateException of invalid_certificate_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Registers a certificate for a secure LDAP or client certificate authentication.
 *)

  
end

module RegisterEventTopic : sig
  val request :
    Smaws_Lib.Context.t ->
      register_event_topic_request ->
        (register_event_topic_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Associates a directory with an Amazon SNS topic. This establishes the directory as a publisher to the specified Amazon SNS topic. You can then receive email or text (SMS) messages when the status of your directory changes. You get notified if your directory goes from an Active status to an Impaired or Inoperable status. You also receive a notification when the directory returns to an Active status.
 *)

  
end

module RejectSharedDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      reject_shared_directory_request ->
        (reject_shared_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Rejects a directory sharing request that was sent from the directory owner account.
 *)

  
end

module RemoveIpRoutes : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_ip_routes_request ->
        (remove_ip_routes_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Removes IP address blocks from a directory.
 *)

  
end

module RemoveRegion : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_region_request ->
        (remove_region_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Stops all replication and removes the domain controllers from the specified Region. You cannot remove the primary Region with this operation. Instead, use the [DeleteDirectory] API.
 *)

  
end

module RemoveTagsFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_from_resource_request ->
        (remove_tags_from_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Removes tags from a directory.
 *)

  
end

module ResetUserPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_user_password_request ->
        (reset_user_password_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidPasswordException of invalid_password_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UserDoesNotExistException of user_does_not_exist_exception
            
        ]
      ) result
  (** Resets the password for any user in your Managed Microsoft AD or Simple AD directory.

 You can reset the password for any user in your directory with the following exceptions:
 
  {ul
        {-  For Simple AD, you cannot reset the password for any user that is a member of either the {b Domain Admins} or {b Enterprise Admins} group except for the administrator user.
            
             }
        {-  For Managed Microsoft AD, you can only reset the password for a user that is in an OU based off of the NetBIOS name that you typed when you created your directory. For example, you cannot reset the password for a user in the {b Amazon Web Services Reserved} OU. For more information about the OU structure for an Managed Microsoft AD directory, see {{:https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_getting_started_what_gets_created.html}What Gets Created} in the {i Directory Service Administration Guide}.
            
             }
        }
   *)

  
end

module RestoreFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_from_snapshot_request ->
        (restore_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Restores a directory using an existing directory snapshot.

 When you restore a directory from a snapshot, any changes made to the directory after the snapshot date are overwritten.
 
  This action returns as soon as the restore operation is initiated. You can monitor the progress of the restore operation by calling the [DescribeDirectories] operation with the directory identifier. When the {b DirectoryDescription.Stage} value changes to [Active], the restore operation is complete.
   *)

  
end

module ShareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      share_directory_request ->
        (share_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryAlreadySharedException of directory_already_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTargetException of invalid_target_exception
            | `OrganizationsException of organizations_exception
            | `ServiceException of service_exception
            | `ShareLimitExceededException of share_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Shares a specified directory ([DirectoryId]) in your Amazon Web Services account (directory owner) with another Amazon Web Services account (directory consumer). With this operation you can use your directory from any Amazon Web Services account and from any Amazon VPC within an Amazon Web Services Region.

 When you share your Managed Microsoft AD directory, Directory Service creates a shared directory in the directory consumer account. This shared directory contains the metadata to provide access to the directory within the directory owner account. The shared directory is visible in all VPCs in the directory consumer account.
 
  The [ShareMethod] parameter determines whether the specified directory can be shared between Amazon Web Services accounts inside the same Amazon Web Services organization ([ORGANIZATIONS]). It also determines whether you can share the directory with any other Amazon Web Services account either inside or outside of the organization ([HANDSHAKE]).
  
   The [ShareNotes] parameter is only used when [HANDSHAKE] is called, which sends a directory sharing request to the directory consumer. 
    *)

  
end

module StartSchemaExtension : sig
  val request :
    Smaws_Lib.Context.t ->
      start_schema_extension_request ->
        (start_schema_extension_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            
        ]
      ) result
  (** Applies a schema extension to a Microsoft AD directory.
 *)

  
end

module UnshareDirectory : sig
  val request :
    Smaws_Lib.Context.t ->
      unshare_directory_request ->
        (unshare_directory_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryNotSharedException of directory_not_shared_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidTargetException of invalid_target_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Stops the directory sharing between the directory owner and consumer accounts. 
 *)

  
end

module UpdateConditionalForwarder : sig
  val request :
    Smaws_Lib.Context.t ->
      update_conditional_forwarder_request ->
        (update_conditional_forwarder_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Updates a conditional forwarder that has been set up for your Amazon Web Services directory.
 *)

  
end

module UpdateDirectorySetup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_directory_setup_request ->
        (update_directory_setup_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryInDesiredStateException of directory_in_desired_state_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `SnapshotLimitExceededException of snapshot_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (**  Updates the directory for a particular update type. 
 *)

  
end

module UpdateNumberOfDomainControllers : sig
  val request :
    Smaws_Lib.Context.t ->
      update_number_of_domain_controllers_request ->
        (update_number_of_domain_controllers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `DomainControllerLimitExceededException of domain_controller_limit_exceeded_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Adds or removes domain controllers to or from the directory. Based on the difference between current value and new value (provided through this API call), domain controllers will be added or removed. It may take up to 45 minutes for any new domain controllers to become fully active once the requested number of domain controllers is updated. During this time, you cannot make another update request.
 *)

  
end

module UpdateRadius : sig
  val request :
    Smaws_Lib.Context.t ->
      update_radius_request ->
        (update_radius_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Updates the Remote Authentication Dial In User Service (RADIUS) server information for an AD Connector or Microsoft AD directory.
 *)

  
end

module UpdateSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_settings_request ->
        (update_settings_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `DirectoryDoesNotExistException of directory_does_not_exist_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `IncompatibleSettingsException of incompatible_settings_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            | `UnsupportedSettingsException of unsupported_settings_exception
            
        ]
      ) result
  (** Updates the configurable settings for the specified directory.
 *)

  
end

module UpdateTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      update_trust_request ->
        (update_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            
        ]
      ) result
  (** Updates the trust that has been set up between your Managed Microsoft AD directory and an self-managed Active Directory.
 *)

  
end

module VerifyTrust : sig
  val request :
    Smaws_Lib.Context.t ->
      verify_trust_request ->
        (verify_trust_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ClientException of client_exception
            | `EntityDoesNotExistException of entity_does_not_exist_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ServiceException of service_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Directory Service for Microsoft Active Directory allows you to configure and verify trust relationships.

 This action verifies a trust relationship between your Managed Microsoft AD directory and an external domain.
  *)

  
end

