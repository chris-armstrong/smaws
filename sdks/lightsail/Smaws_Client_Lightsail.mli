(** 
    Lightsail client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec certificate_provider =
  | LetsEncrypt 
type nonrec setup_request =
  {
  certificate_provider: certificate_provider option ;
  domain_names: string list option ;
  instance_name: string option }
type nonrec region_name =
  | EU_NORTH_1 
  | AP_NORTHEAST_2 
  | AP_NORTHEAST_1 
  | AP_SOUTHEAST_2 
  | AP_SOUTHEAST_1 
  | AP_SOUTH_1 
  | CA_CENTRAL_1 
  | EU_CENTRAL_1 
  | EU_WEST_3 
  | EU_WEST_2 
  | EU_WEST_1 
  | US_WEST_2 
  | US_WEST_1 
  | US_EAST_2 
  | US_EAST_1 
type nonrec resource_location =
  {
  region_name: region_name option ;
  availability_zone: string option }
type nonrec resource_type =
  | Bucket 
  | Certificate 
  | Distribution 
  | ContactMethod 
  | Alarm 
  | CloudFormationStackRecord 
  | ExportSnapshotRecord 
  | RelationalDatabaseSnapshot 
  | RelationalDatabase 
  | DiskSnapshot 
  | Disk 
  | LoadBalancerTlsCertificate 
  | LoadBalancer 
  | PeeredVpc 
  | Domain 
  | InstanceSnapshot 
  | KeyPair 
  | StaticIp 
  | Instance 
  | ContainerService 
type nonrec setup_history_resource =
  {
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option }
type nonrec setup_status =
  | InProgress 
  | Failed 
  | Succeeded 
type nonrec setup_execution_details =
  {
  version: string option ;
  standard_output: string option ;
  standard_error: string option ;
  status: setup_status option ;
  name: string option ;
  date_time: CoreTypes.Timestamp.t option ;
  command: string option }
type nonrec setup_history =
  {
  status: setup_status option ;
  execution_details: setup_execution_details list option ;
  resource: setup_history_resource option ;
  request: setup_request option ;
  operation_id: string option }
type nonrec viewer_minimum_tls_protocol_version_enum =
  | TLSv12_2021 
  | TLSv12_2019 
  | TLSv12_2018 
  | TLSv11_2016 
type nonrec operation_type =
  | SetupInstanceHttps 
  | StopGUISession 
  | StartGUISession 
  | UpdateInstanceMetadataOptions 
  | SetResourceAccessForBucket 
  | UpdateBucket 
  | UpdateBucketBundle 
  | DeleteBucketAccessKey 
  | CreateBucketAccessKey 
  | DeleteBucket 
  | CreateBucket 
  | DeleteContainerImage 
  | RegisterContainerImage 
  | CreateContainerServiceRegistryLogin 
  | CreateContainerServiceDeployment 
  | DeleteContainerService 
  | UpdateContainerService 
  | CreateContainerService 
  | DeleteCertificate 
  | CreateCertificate 
  | SetIpAddressType 
  | UpdateDistributionBundle 
  | DetachCertificateFromDistribution 
  | AttachCertificateToDistribution 
  | ResetDistributionCache 
  | DeleteDistribution 
  | UpdateDistribution 
  | CreateDistribution 
  | DeleteContactMethod 
  | SendContactMethodVerification 
  | GetContactMethods 
  | CreateContactMethod 
  | TestAlarm 
  | DeleteAlarm 
  | GetAlarms 
  | PutAlarm 
  | DisableAddOn 
  | EnableAddOn 
  | StopRelationalDatabase 
  | RebootRelationalDatabase 
  | StartRelationalDatabase 
  | UpdateRelationalDatabaseParameters 
  | DeleteRelationalDatabaseSnapshot 
  | CreateRelationalDatabaseSnapshot 
  | CreateRelationalDatabaseFromSnapshot 
  | DeleteRelationalDatabase 
  | UpdateRelationalDatabase 
  | CreateRelationalDatabase 
  | CreateDiskFromSnapshot 
  | DeleteDiskSnapshot 
  | CreateDiskSnapshot 
  | DetachDisk 
  | AttachDisk 
  | DeleteDisk 
  | CreateDisk 
  | AttachLoadBalancerTlsCertificate 
  | DeleteLoadBalancerTlsCertificate 
  | CreateLoadBalancerTlsCertificate 
  | UpdateLoadBalancerAttribute 
  | DetachInstancesFromLoadBalancer 
  | AttachInstancesToLoadBalancer 
  | DeleteLoadBalancer 
  | CreateLoadBalancer 
  | CreateInstancesFromSnapshot 
  | DeleteInstanceSnapshot 
  | CreateInstanceSnapshot 
  | DeleteDomain 
  | CreateDomain 
  | DeleteDomainEntry 
  | UpdateDomainEntry 
  | DetachStaticIp 
  | AttachStaticIp 
  | ReleaseStaticIp 
  | AllocateStaticIp 
  | CloseInstancePublicPorts 
  | PutInstancePublicPorts 
  | OpenInstancePublicPorts 
  | RebootInstance 
  | StartInstance 
  | StopInstance 
  | CreateInstance 
  | DeleteInstance 
  | DeleteKnownHostKeys 
type nonrec operation_status =
  | Succeeded 
  | Completed 
  | Failed 
  | Started 
  | NotStarted 
type nonrec operation =
  {
  error_details: string option ;
  error_code: string option ;
  status_changed_at: CoreTypes.Timestamp.t option ;
  status: operation_status option ;
  operation_type: operation_type option ;
  operation_details: string option ;
  is_terminal: bool option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  resource_type: resource_type option ;
  resource_name: string option ;
  id: string option }
type nonrec update_relational_database_result =
  {
  operations: operation list option }
type nonrec update_relational_database_request =
  {
  relational_database_blueprint_id: string option ;
  ca_certificate_identifier: string option ;
  apply_immediately: bool option ;
  publicly_accessible: bool option ;
  disable_backup_retention: bool option ;
  enable_backup_retention: bool option ;
  preferred_maintenance_window: string option ;
  preferred_backup_window: string option ;
  rotate_master_user_password: bool option ;
  master_user_password: string option ;
  relational_database_name: string }
type nonrec update_relational_database_parameters_result =
  {
  operations: operation list option }
type nonrec relational_database_parameter =
  {
  parameter_value: string option ;
  parameter_name: string option ;
  is_modifiable: bool option ;
  description: string option ;
  data_type: string option ;
  apply_type: string option ;
  apply_method: string option ;
  allowed_values: string option }
type nonrec update_relational_database_parameters_request =
  {
  parameters: relational_database_parameter list ;
  relational_database_name: string }
type nonrec unauthenticated_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }
type nonrec service_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }
type nonrec operation_failure_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }
type nonrec not_found_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }
type nonrec invalid_input_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }
type nonrec account_setup_in_progress_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }
type nonrec access_denied_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }
type nonrec update_load_balancer_attribute_result =
  {
  operations: operation list option }
type nonrec load_balancer_attribute_name =
  | TlsPolicyName 
  | HttpsRedirectionEnabled 
  | SessionStickiness_LB_CookieDurationSeconds 
  | SessionStickinessEnabled 
  | HealthCheckPath 
type nonrec update_load_balancer_attribute_request =
  {
  attribute_value: string ;
  attribute_name: load_balancer_attribute_name ;
  load_balancer_name: string }
type nonrec update_instance_metadata_options_result =
  {
  operation: operation option }
type nonrec http_tokens =
  | Required 
  | Optional 
type nonrec http_endpoint =
  | Enabled 
  | Disabled 
type nonrec http_protocol_ipv6 =
  | Enabled 
  | Disabled 
type nonrec update_instance_metadata_options_request =
  {
  http_protocol_ipv6: http_protocol_ipv6 option ;
  http_put_response_hop_limit: int option ;
  http_endpoint: http_endpoint option ;
  http_tokens: http_tokens option ;
  instance_name: string }
type nonrec update_domain_entry_result = {
  operations: operation list option }
type nonrec domain_entry_options = (string * string) list
type nonrec domain_entry =
  {
  options: domain_entry_options option ;
  type_: string option ;
  is_alias: bool option ;
  target: string option ;
  name: string option ;
  id: string option }
type nonrec update_domain_entry_request =
  {
  domain_entry: domain_entry ;
  domain_name: string }
type nonrec update_distribution_result = {
  operation: operation option }
type nonrec origin_protocol_policy_enum =
  | HTTPSOnly 
  | HTTPOnly 
type nonrec input_origin =
  {
  response_timeout: int option ;
  protocol_policy: origin_protocol_policy_enum option ;
  region_name: region_name option ;
  name: string option }
type nonrec behavior_enum =
  | CacheSetting 
  | DontCacheSetting 
type nonrec cache_behavior = {
  behavior: behavior_enum option }
type nonrec forward_values =
  | All 
  | AllowList 
  | None 
type nonrec cookie_object =
  {
  cookies_allow_list: string list option ;
  option_: forward_values option }
type nonrec header_enum =
  | Referer 
  | Origin 
  | Host 
  | CloudFrontViewerCountry 
  | CloudFrontIsTabletViewer 
  | CloudFrontIsSmartTVViewer 
  | CloudFrontIsMobileViewer 
  | CloudFrontIsDesktopViewer 
  | CloudFrontForwardedProto 
  | Authorization 
  | AcceptLanguage 
  | AcceptEncoding 
  | AcceptDatetime 
  | AcceptCharset 
  | Accept 
type nonrec header_object =
  {
  headers_allow_list: header_enum list option ;
  option_: forward_values option }
type nonrec query_string_object =
  {
  query_strings_allow_list: string list option ;
  option_: bool option }
type nonrec cache_settings =
  {
  forwarded_query_strings: query_string_object option ;
  forwarded_headers: header_object option ;
  forwarded_cookies: cookie_object option ;
  cached_http_methods: string option ;
  allowed_http_methods: string option ;
  maximum_tt_l: int option ;
  minimum_tt_l: int option ;
  default_tt_l: int option }
type nonrec cache_behavior_per_path =
  {
  behavior: behavior_enum option ;
  path: string option }
type nonrec update_distribution_request =
  {
  use_default_certificate: bool option ;
  certificate_name: string option ;
  viewer_minimum_tls_protocol_version:
    viewer_minimum_tls_protocol_version_enum option ;
  is_enabled: bool option ;
  cache_behaviors: cache_behavior_per_path list option ;
  cache_behavior_settings: cache_settings option ;
  default_cache_behavior: cache_behavior option ;
  origin: input_origin option ;
  distribution_name: string }
type nonrec update_distribution_bundle_result =
  {
  operation: operation option }
type nonrec update_distribution_bundle_request =
  {
  bundle_id: string option ;
  distribution_name: string option }
type nonrec tag = {
  value: string option ;
  key: string option }
type nonrec container_service_power_name =
  | Xlarge 
  | Large 
  | Medium 
  | Small 
  | Micro 
  | Nano 
type nonrec container_service_state =
  | DEPLOYING 
  | DISABLED 
  | DELETING 
  | UPDATING 
  | RUNNING 
  | READY 
  | PENDING 
type nonrec container_service_state_detail_code =
  | UNKNOWN_ERROR 
  | CERTIFICATE_LIMIT_EXCEEDED 
  | ACTIVATING_DEPLOYMENT 
  | EVALUATING_HEALTH_CHECK 
  | CREATING_DEPLOYMENT 
  | PROVISIONING_SERVICE 
  | PROVISIONING_CERTIFICATE 
  | CREATING_NETWORK_INFRASTRUCTURE 
  | CREATING_SYSTEM_RESOURCES 
type nonrec container_service_state_detail =
  {
  message: string option ;
  code: container_service_state_detail_code option }
type nonrec container_service_deployment_state =
  | FAILED 
  | INACTIVE 
  | ACTIVE 
  | ACTIVATING 
type nonrec environment = (string * string) list
type nonrec container_service_protocol =
  | UDP 
  | TCP 
  | HTTPS 
  | HTTP 
type nonrec port_map = (string * container_service_protocol) list
type nonrec container =
  {
  ports: port_map option ;
  environment: environment option ;
  command: string list option ;
  image: string option }
type nonrec container_map = (string * container) list
type nonrec container_service_health_check_config =
  {
  success_codes: string option ;
  path: string option ;
  interval_seconds: int option ;
  timeout_seconds: int option ;
  unhealthy_threshold: int option ;
  healthy_threshold: int option }
type nonrec container_service_endpoint =
  {
  health_check: container_service_health_check_config option ;
  container_port: int option ;
  container_name: string option }
type nonrec container_service_deployment =
  {
  created_at: CoreTypes.Timestamp.t option ;
  public_endpoint: container_service_endpoint option ;
  containers: container_map option ;
  state: container_service_deployment_state option ;
  version: int option }
type nonrec container_service_public_domains = (string * string list) list
type nonrec container_service_ecr_image_puller_role =
  {
  principal_arn: string option ;
  is_active: bool option }
type nonrec private_registry_access =
  {
  ecr_image_puller_role: container_service_ecr_image_puller_role option }
type nonrec container_service =
  {
  private_registry_access: private_registry_access option ;
  url: string option ;
  public_domain_names: container_service_public_domains option ;
  private_domain_name: string option ;
  principal_arn: string option ;
  is_disabled: bool option ;
  next_deployment: container_service_deployment option ;
  current_deployment: container_service_deployment option ;
  scale: int option ;
  state_detail: container_service_state_detail option ;
  state: container_service_state option ;
  power_id: string option ;
  power: container_service_power_name option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  container_service_name: string option }
type nonrec update_container_service_result =
  {
  container_service: container_service option }
type nonrec container_service_ecr_image_puller_role_request =
  {
  is_active: bool option }
type nonrec private_registry_access_request =
  {
  ecr_image_puller_role:
    container_service_ecr_image_puller_role_request option }
type nonrec update_container_service_request =
  {
  private_registry_access: private_registry_access_request option ;
  public_domain_names: container_service_public_domains option ;
  is_disabled: bool option ;
  scale: int option ;
  power: container_service_power_name option ;
  service_name: string }
type nonrec access_type =
  | Private 
  | Public 
type nonrec access_rules =
  {
  allow_public_overrides: bool option ;
  get_object: access_type option }
type nonrec resource_receiving_access =
  {
  resource_type: string option ;
  name: string option }
type nonrec bucket_state = {
  message: string option ;
  code: string option }
type nonrec bucket_access_log_config =
  {
  prefix: string option ;
  destination: string option ;
  enabled: bool }
type nonrec bucket =
  {
  access_log_config: bucket_access_log_config option ;
  state: bucket_state option ;
  resources_receiving_access: resource_receiving_access list option ;
  readonly_access_accounts: string list option ;
  able_to_update_bundle: bool option ;
  object_versioning: string option ;
  tags: tag list option ;
  support_code: string option ;
  name: string option ;
  location: resource_location option ;
  url: string option ;
  created_at: CoreTypes.Timestamp.t option ;
  bundle_id: string option ;
  arn: string option ;
  access_rules: access_rules option ;
  resource_type: string option }
type nonrec update_bucket_result =
  {
  operations: operation list option ;
  bucket: bucket option }
type nonrec update_bucket_request =
  {
  access_log_config: bucket_access_log_config option ;
  readonly_access_accounts: string list option ;
  versioning: string option ;
  access_rules: access_rules option ;
  bucket_name: string }
type nonrec update_bucket_bundle_result =
  {
  operations: operation list option }
type nonrec update_bucket_bundle_request =
  {
  bundle_id: string ;
  bucket_name: string }
type nonrec untag_resource_result = {
  operations: operation list option }
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string option ;
  resource_name: string }
type nonrec unpeer_vpc_result = {
  operation: operation option }
type nonrec unpeer_vpc_request = unit
type nonrec treat_missing_data =
  | Missing 
  | Ignore 
  | NotBreaching 
  | Breaching 
type nonrec time_period =
  {
  end_: CoreTypes.Timestamp.t option ;
  start: CoreTypes.Timestamp.t option }
type nonrec test_alarm_result = {
  operations: operation list option }
type nonrec alarm_state =
  | INSUFFICIENT_DATA 
  | ALARM 
  | OK 
type nonrec test_alarm_request = {
  state: alarm_state ;
  alarm_name: string }
type nonrec tag_resource_result = {
  operations: operation list option }
type nonrec tag_resource_request =
  {
  tags: tag list ;
  resource_arn: string option ;
  resource_name: string }
type nonrec stop_relational_database_result =
  {
  operations: operation list option }
type nonrec stop_relational_database_request =
  {
  relational_database_snapshot_name: string option ;
  relational_database_name: string }
type nonrec stop_instance_result = {
  operations: operation list option }
type nonrec stop_instance_request =
  {
  force: bool option ;
  instance_name: string }
type nonrec stop_instance_on_idle_request =
  {
  duration: string option ;
  threshold: string option }
type nonrec stop_gui_session_result = {
  operations: operation list option }
type nonrec stop_gui_session_request = {
  resource_name: string }
type nonrec status_type =
  | Inactive 
  | Active 
type nonrec status =
  | FailedStoppingGUISession 
  | FailedStartingGUISession 
  | FailedInstanceCreation 
  | SettingUpInstance 
  | Stopping 
  | Stopped 
  | Starting 
  | Started 
  | NotStarted 
  | StartExpired 
type nonrec static_ip =
  {
  is_attached: bool option ;
  attached_to: string option ;
  ip_address: string option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec start_relational_database_result =
  {
  operations: operation list option }
type nonrec start_relational_database_request =
  {
  relational_database_name: string }
type nonrec start_instance_result = {
  operations: operation list option }
type nonrec start_instance_request = {
  instance_name: string }
type nonrec start_gui_session_result = {
  operations: operation list option }
type nonrec start_gui_session_request = {
  resource_name: string }
type nonrec setup_instance_https_result =
  {
  operations: operation list option }
type nonrec setup_instance_https_request =
  {
  certificate_provider: certificate_provider ;
  domain_names: string list ;
  email_address: string ;
  instance_name: string }
type nonrec set_resource_access_for_bucket_result =
  {
  operations: operation list option }
type nonrec resource_bucket_access =
  | Deny 
  | Allow 
type nonrec set_resource_access_for_bucket_request =
  {
  access: resource_bucket_access ;
  bucket_name: string ;
  resource_name: string }
type nonrec set_ip_address_type_result = {
  operations: operation list option }
type nonrec ip_address_type =
  | IPV6 
  | IPV4 
  | DUALSTACK 
type nonrec set_ip_address_type_request =
  {
  accept_bundle_update: bool option ;
  ip_address_type: ip_address_type ;
  resource_name: string ;
  resource_type: resource_type }
type nonrec session =
  {
  is_primary: bool option ;
  url: string option ;
  name: string option }
type nonrec send_contact_method_verification_result =
  {
  operations: operation list option }
type nonrec contact_method_verification_protocol =
  | Email 
type nonrec send_contact_method_verification_request =
  {
  protocol: contact_method_verification_protocol }
type nonrec pricing_unit =
  | Queries 
  | Bundles 
  | GBMo 
  | Hrs 
  | GB 
type nonrec currency =
  | USD 
type nonrec estimate_by_time =
  {
  time_period: time_period option ;
  currency: currency option ;
  unit_: float option ;
  pricing_unit: pricing_unit option ;
  usage_cost: float option }
type nonrec cost_estimate =
  {
  results_by_time: estimate_by_time list option ;
  usage_type: string option }
type nonrec resource_budget_estimate =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  cost_estimates: cost_estimate list option ;
  resource_type: resource_type option ;
  resource_name: string option }
type nonrec resource_record =
  {
  value: string option ;
  type_: string option ;
  name: string option }
type nonrec reset_distribution_cache_result =
  {
  operation: operation option ;
  create_time: CoreTypes.Timestamp.t option ;
  status: string option }
type nonrec reset_distribution_cache_request =
  {
  distribution_name: string option }
type nonrec dns_record_creation_state_code =
  | Failed 
  | Started 
  | Succeeded 
type nonrec dns_record_creation_state =
  {
  message: string option ;
  code: dns_record_creation_state_code option }
type nonrec certificate_domain_validation_status =
  | Success 
  | Failed 
  | PendingValidation 
type nonrec domain_validation_record =
  {
  validation_status: certificate_domain_validation_status option ;
  dns_record_creation_state: dns_record_creation_state option ;
  resource_record: resource_record option ;
  domain_name: string option }
type nonrec renewal_status =
  | Failed 
  | Success 
  | PendingValidation 
  | PendingAutoRenewal 
type nonrec renewal_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  renewal_status_reason: string option ;
  renewal_status: renewal_status option ;
  domain_validation_records: domain_validation_record list option }
type nonrec release_static_ip_result = {
  operations: operation list option }
type nonrec release_static_ip_request = {
  static_ip_name: string }
type nonrec relational_database_snapshot =
  {
  from_relational_database_blueprint_id: string option ;
  from_relational_database_bundle_id: string option ;
  from_relational_database_arn: string option ;
  from_relational_database_name: string option ;
  state: string option ;
  size_in_gb: int option ;
  engine_version: string option ;
  engine: string option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec relational_database_password_version =
  | PENDING 
  | PREVIOUS 
  | CURRENT 
type nonrec relational_database_metric_name =
  | NetworkTransmitThroughput 
  | NetworkReceiveThroughput 
  | FreeStorageSpace 
  | DiskQueueDepth 
  | DatabaseConnections 
  | CPUUtilization 
type nonrec relational_database_hardware =
  {
  ram_size_in_gb: float option ;
  disk_size_in_gb: int option ;
  cpu_count: int option }
type nonrec pending_modified_relational_database_values =
  {
  backup_retention_enabled: bool option ;
  engine_version: string option ;
  master_user_password: string option }
type nonrec relational_database_endpoint =
  {
  address: string option ;
  port: int option }
type nonrec pending_maintenance_action =
  {
  current_apply_date: CoreTypes.Timestamp.t option ;
  description: string option ;
  action: string option }
type nonrec relational_database =
  {
  ca_certificate_identifier: string option ;
  pending_maintenance_actions: pending_maintenance_action list option ;
  master_endpoint: relational_database_endpoint option ;
  publicly_accessible: bool option ;
  preferred_maintenance_window: string option ;
  preferred_backup_window: string option ;
  parameter_apply_status: string option ;
  master_username: string option ;
  latest_restorable_time: CoreTypes.Timestamp.t option ;
  engine_version: string option ;
  engine: string option ;
  pending_modified_values: pending_modified_relational_database_values option ;
  backup_retention_enabled: bool option ;
  secondary_availability_zone: string option ;
  state: string option ;
  hardware: relational_database_hardware option ;
  master_database_name: string option ;
  relational_database_bundle_id: string option ;
  relational_database_blueprint_id: string option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec relational_database_event =
  {
  event_categories: string list option ;
  message: string option ;
  created_at: CoreTypes.Timestamp.t option ;
  resource: string option }
type nonrec relational_database_engine =
  | MYSQL 
type nonrec relational_database_bundle =
  {
  is_active: bool option ;
  is_encrypted: bool option ;
  cpu_count: int option ;
  transfer_per_month_in_gb: int option ;
  disk_size_in_gb: int option ;
  ram_size_in_gb: float option ;
  price: float option ;
  name: string option ;
  bundle_id: string option }
type nonrec relational_database_blueprint =
  {
  is_engine_default: bool option ;
  engine_version_description: string option ;
  engine_description: string option ;
  engine_version: string option ;
  engine: relational_database_engine option ;
  blueprint_id: string option }
type nonrec name_servers_update_state_code =
  | Started 
  | Failed 
  | Pending 
  | Succeeded 
type nonrec name_servers_update_state =
  {
  message: string option ;
  code: name_servers_update_state_code option }
type nonrec r53_hosted_zone_deletion_state_code =
  | Started 
  | Failed 
  | Pending 
  | Succeeded 
type nonrec r53_hosted_zone_deletion_state =
  {
  message: string option ;
  code: r53_hosted_zone_deletion_state_code option }
type nonrec registered_domain_delegation_info =
  {
  r53_hosted_zone_deletion_state: r53_hosted_zone_deletion_state option ;
  name_servers_update_state: name_servers_update_state option }
type nonrec container_image =
  {
  created_at: CoreTypes.Timestamp.t option ;
  digest: string option ;
  image: string option }
type nonrec register_container_image_result =
  {
  container_image: container_image option }
type nonrec register_container_image_request =
  {
  digest: string ;
  label: string ;
  service_name: string }
type nonrec availability_zone =
  {
  state: string option ;
  zone_name: string option }
type nonrec region =
  {
  relational_database_availability_zones: availability_zone list option ;
  availability_zones: availability_zone list option ;
  name: region_name option ;
  display_name: string option ;
  description: string option ;
  continent_code: string option }
type nonrec record_state =
  | Failed 
  | Succeeded 
  | Started 
type nonrec reboot_relational_database_result =
  {
  operations: operation list option }
type nonrec reboot_relational_database_request =
  {
  relational_database_name: string }
type nonrec reboot_instance_result = {
  operations: operation list option }
type nonrec reboot_instance_request = {
  instance_name: string }
type nonrec put_instance_public_ports_result = {
  operation: operation option }
type nonrec network_protocol =
  | ICMPV6 
  | ICMP 
  | UDP 
  | ALL 
  | TCP 
type nonrec port_info =
  {
  cidr_list_aliases: string list option ;
  ipv6_cidrs: string list option ;
  cidrs: string list option ;
  protocol: network_protocol option ;
  to_port: int option ;
  from_port: int option }
type nonrec put_instance_public_ports_request =
  {
  instance_name: string ;
  port_infos: port_info list }
type nonrec put_alarm_result = {
  operations: operation list option }
type nonrec metric_name =
  | BurstCapacityPercentage 
  | BurstCapacityTime 
  | NetworkTransmitThroughput 
  | NetworkReceiveThroughput 
  | FreeStorageSpace 
  | DiskQueueDepth 
  | DatabaseConnections 
  | RequestCount 
  | RejectedConnectionCount 
  | InstanceResponseTime 
  | HTTPCode_Instance_5XX_Count 
  | HTTPCode_Instance_4XX_Count 
  | HTTPCode_Instance_3XX_Count 
  | HTTPCode_Instance_2XX_Count 
  | HTTPCode_LB_5XX_Count 
  | HTTPCode_LB_4XX_Count 
  | UnhealthyHostCount 
  | HealthyHostCount 
  | ClientTLSNegotiationErrorCount 
  | StatusCheckFailed_System 
  | StatusCheckFailed_Instance 
  | StatusCheckFailed 
  | NetworkOut 
  | NetworkIn 
  | CPUUtilization 
type nonrec comparison_operator =
  | LessThanOrEqualToThreshold 
  | LessThanThreshold 
  | GreaterThanThreshold 
  | GreaterThanOrEqualToThreshold 
type nonrec contact_protocol =
  | SMS 
  | Email 
type nonrec put_alarm_request =
  {
  notification_enabled: bool option ;
  notification_triggers: alarm_state list option ;
  contact_protocols: contact_protocol list option ;
  treat_missing_data: treat_missing_data option ;
  datapoints_to_alarm: int option ;
  evaluation_periods: int ;
  threshold: float ;
  comparison_operator: comparison_operator ;
  monitored_resource_name: string ;
  metric_name: metric_name ;
  alarm_name: string }
type nonrec port_state =
  | Closed 
  | Open 
type nonrec port_info_source_type =
  | Closed 
  | None 
  | Instance 
  | Default 
type nonrec port_access_type =
  | Private 
  | Public 
type nonrec peer_vpc_result = {
  operation: operation option }
type nonrec peer_vpc_request = unit
type nonrec password_data =
  {
  key_pair_name: string option ;
  ciphertext: string option }
type nonrec origin =
  {
  response_timeout: int option ;
  protocol_policy: origin_protocol_policy_enum option ;
  region_name: region_name option ;
  resource_type: resource_type option ;
  name: string option }
type nonrec open_instance_public_ports_result =
  {
  operation: operation option }
type nonrec open_instance_public_ports_request =
  {
  instance_name: string ;
  port_info: port_info }
type nonrec monthly_transfer = {
  gb_per_month_allocated: int option }
type nonrec monitored_resource_info =
  {
  resource_type: resource_type option ;
  name: string option ;
  arn: string option }
type nonrec metric_unit =
  | None 
  | CountSecond 
  | TerabitsSecond 
  | GigabitsSecond 
  | MegabitsSecond 
  | KilobitsSecond 
  | BitsSecond 
  | TerabytesSecond 
  | GigabytesSecond 
  | MegabytesSecond 
  | KilobytesSecond 
  | BytesSecond 
  | Count 
  | Percent 
  | Terabits 
  | Gigabits 
  | Megabits 
  | Kilobits 
  | Bits 
  | Terabytes 
  | Gigabytes 
  | Megabytes 
  | Kilobytes 
  | Bytes 
  | Milliseconds 
  | Microseconds 
  | Seconds 
type nonrec metric_statistic =
  | SampleCount 
  | Average 
  | Sum 
  | Maximum 
  | Minimum 
type nonrec metric_datapoint =
  {
  unit_: metric_unit option ;
  timestamp_: CoreTypes.Timestamp.t option ;
  sum: float option ;
  sample_count: float option ;
  minimum: float option ;
  maximum: float option ;
  average: float option }
type nonrec log_event =
  {
  message: string option ;
  created_at: CoreTypes.Timestamp.t option }
type nonrec load_balancer_tls_policy =
  {
  ciphers: string list option ;
  protocols: string list option ;
  description: string option ;
  is_default: bool option ;
  name: string option }
type nonrec load_balancer_tls_certificate_summary =
  {
  is_attached: bool option ;
  name: string option }
type nonrec load_balancer_tls_certificate_status =
  | Unknown 
  | Failed 
  | Revoked 
  | ValidationTimedOut 
  | Expired 
  | Inactive 
  | Issued 
  | PendingValidation 
type nonrec load_balancer_tls_certificate_revocation_reason =
  | AACompromise 
  | PrivilegeWithdrawn 
  | RemoveFromCrl 
  | CertificateHold 
  | CessationOfOperation 
  | Superceded 
  | AffiliationChanged 
  | CaCompromise 
  | KeyCompromise 
  | Unspecified 
type nonrec load_balancer_tls_certificate_renewal_status =
  | Failed 
  | Success 
  | PendingValidation 
  | PendingAutoRenewal 
type nonrec load_balancer_tls_certificate_domain_status =
  | Success 
  | Failed 
  | PendingValidation 
type nonrec load_balancer_tls_certificate_domain_validation_option =
  {
  validation_status: load_balancer_tls_certificate_domain_status option ;
  domain_name: string option }
type nonrec load_balancer_tls_certificate_renewal_summary =
  {
  domain_validation_options:
    load_balancer_tls_certificate_domain_validation_option list option ;
  renewal_status: load_balancer_tls_certificate_renewal_status option }
type nonrec load_balancer_tls_certificate_dns_record_creation_state_code =
  | Failed 
  | Started 
  | Succeeded 
type nonrec load_balancer_tls_certificate_dns_record_creation_state =
  {
  message: string option ;
  code: load_balancer_tls_certificate_dns_record_creation_state_code option }
type nonrec load_balancer_tls_certificate_domain_validation_record =
  {
  dns_record_creation_state:
    load_balancer_tls_certificate_dns_record_creation_state option ;
  domain_name: string option ;
  validation_status: load_balancer_tls_certificate_domain_status option ;
  value: string option ;
  type_: string option ;
  name: string option }
type nonrec load_balancer_tls_certificate_failure_reason =
  | Other 
  | InvalidPublicDomain 
  | DomainNotAllowed 
  | AdditionalVerificationRequired 
  | NoAvailableContacts 
type nonrec load_balancer_tls_certificate =
  {
  subject_alternative_names: string list option ;
  subject: string option ;
  signature_algorithm: string option ;
  serial: string option ;
  revoked_at: CoreTypes.Timestamp.t option ;
  revocation_reason: load_balancer_tls_certificate_revocation_reason option ;
  renewal_summary: load_balancer_tls_certificate_renewal_summary option ;
  not_before: CoreTypes.Timestamp.t option ;
  not_after: CoreTypes.Timestamp.t option ;
  key_algorithm: string option ;
  issuer: string option ;
  issued_at: CoreTypes.Timestamp.t option ;
  failure_reason: load_balancer_tls_certificate_failure_reason option ;
  domain_validation_records:
    load_balancer_tls_certificate_domain_validation_record list option ;
  domain_name: string option ;
  status: load_balancer_tls_certificate_status option ;
  is_attached: bool option ;
  load_balancer_name: string option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec load_balancer_state =
  | Unknown 
  | Failed 
  | ActiveImpaired 
  | Provisioning 
  | Active 
type nonrec load_balancer_protocol =
  | HTTP 
  | HTTP_HTTPS 
type nonrec load_balancer_metric_name =
  | RequestCount 
  | RejectedConnectionCount 
  | InstanceResponseTime 
  | HTTPCode_Instance_5XX_Count 
  | HTTPCode_Instance_4XX_Count 
  | HTTPCode_Instance_3XX_Count 
  | HTTPCode_Instance_2XX_Count 
  | HTTPCode_LB_5XX_Count 
  | HTTPCode_LB_4XX_Count 
  | UnhealthyHostCount 
  | HealthyHostCount 
  | ClientTLSNegotiationErrorCount 
type nonrec instance_health_state =
  | Unavailable 
  | Draining 
  | Unused 
  | Unhealthy 
  | Healthy 
  | Initial 
type nonrec instance_health_reason =
  | InstanceIpUnusable 
  | InstanceInvalidState 
  | InstanceDeregistrationInProgress 
  | InstanceNotInUse 
  | InstanceNotRegistered 
  | InstanceFailedHealthChecks 
  | InstanceTimeout 
  | InstanceResponseCodeMismatch 
  | LbInternalError 
  | LbInitialHealthChecking 
  | LbRegistrationInProgress 
type nonrec instance_health_summary =
  {
  instance_health_reason: instance_health_reason option ;
  instance_health: instance_health_state option ;
  instance_name: string option }
type nonrec load_balancer_configuration_options =
  (load_balancer_attribute_name * string) list
type nonrec load_balancer =
  {
  tls_policy_name: string option ;
  https_redirection_enabled: bool option ;
  ip_address_type: ip_address_type option ;
  configuration_options: load_balancer_configuration_options option ;
  tls_certificate_summaries:
    load_balancer_tls_certificate_summary list option ;
  instance_health_summary: instance_health_summary list option ;
  instance_port: int option ;
  health_check_path: string option ;
  public_ports: int list option ;
  protocol: load_balancer_protocol option ;
  state: load_balancer_state option ;
  dns_name: string option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec is_vpc_peered_result = {
  is_peered: bool option }
type nonrec is_vpc_peered_request = unit
type nonrec import_key_pair_result = {
  operation: operation option }
type nonrec import_key_pair_request =
  {
  public_key_base64: string ;
  key_pair_name: string }
type nonrec get_static_ips_result =
  {
  next_page_token: string option ;
  static_ips: static_ip list option }
type nonrec get_static_ips_request = {
  page_token: string option }
type nonrec get_static_ip_result = {
  static_ip: static_ip option }
type nonrec get_static_ip_request = {
  static_ip_name: string }
type nonrec get_setup_history_result =
  {
  next_page_token: string option ;
  setup_history: setup_history list option }
type nonrec get_setup_history_request =
  {
  page_token: string option ;
  resource_name: string }
type nonrec get_relational_database_snapshots_result =
  {
  next_page_token: string option ;
  relational_database_snapshots: relational_database_snapshot list option }
type nonrec get_relational_database_snapshots_request =
  {
  page_token: string option }
type nonrec get_relational_database_snapshot_result =
  {
  relational_database_snapshot: relational_database_snapshot option }
type nonrec get_relational_database_snapshot_request =
  {
  relational_database_snapshot_name: string }
type nonrec get_relational_databases_result =
  {
  next_page_token: string option ;
  relational_databases: relational_database list option }
type nonrec get_relational_databases_request = {
  page_token: string option }
type nonrec get_relational_database_parameters_result =
  {
  next_page_token: string option ;
  parameters: relational_database_parameter list option }
type nonrec get_relational_database_parameters_request =
  {
  page_token: string option ;
  relational_database_name: string }
type nonrec get_relational_database_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: relational_database_metric_name option }
type nonrec get_relational_database_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  period: int ;
  metric_name: relational_database_metric_name ;
  relational_database_name: string }
type nonrec get_relational_database_master_user_password_result =
  {
  created_at: CoreTypes.Timestamp.t option ;
  master_user_password: string option }
type nonrec get_relational_database_master_user_password_request =
  {
  password_version: relational_database_password_version option ;
  relational_database_name: string }
type nonrec get_relational_database_log_streams_result =
  {
  log_streams: string list option }
type nonrec get_relational_database_log_streams_request =
  {
  relational_database_name: string }
type nonrec get_relational_database_log_events_result =
  {
  next_forward_token: string option ;
  next_backward_token: string option ;
  resource_log_events: log_event list option }
type nonrec get_relational_database_log_events_request =
  {
  page_token: string option ;
  start_from_head: bool option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  log_stream_name: string ;
  relational_database_name: string }
type nonrec get_relational_database_events_result =
  {
  next_page_token: string option ;
  relational_database_events: relational_database_event list option }
type nonrec get_relational_database_events_request =
  {
  page_token: string option ;
  duration_in_minutes: int option ;
  relational_database_name: string }
type nonrec get_relational_database_bundles_result =
  {
  next_page_token: string option ;
  bundles: relational_database_bundle list option }
type nonrec get_relational_database_bundles_request =
  {
  include_inactive: bool option ;
  page_token: string option }
type nonrec get_relational_database_blueprints_result =
  {
  next_page_token: string option ;
  blueprints: relational_database_blueprint list option }
type nonrec get_relational_database_blueprints_request =
  {
  page_token: string option }
type nonrec get_relational_database_result =
  {
  relational_database: relational_database option }
type nonrec get_relational_database_request =
  {
  relational_database_name: string }
type nonrec get_regions_result = {
  regions: region list option }
type nonrec get_regions_request =
  {
  include_relational_database_availability_zones: bool option ;
  include_availability_zones: bool option }
type nonrec get_operations_for_resource_result =
  {
  next_page_token: string option ;
  next_page_count: string option ;
  operations: operation list option }
type nonrec get_operations_for_resource_request =
  {
  page_token: string option ;
  resource_name: string }
type nonrec get_operations_result =
  {
  next_page_token: string option ;
  operations: operation list option }
type nonrec get_operations_request = {
  page_token: string option }
type nonrec get_operation_result = {
  operation: operation option }
type nonrec get_operation_request = {
  operation_id: string }
type nonrec get_load_balancer_tls_policies_result =
  {
  next_page_token: string option ;
  tls_policies: load_balancer_tls_policy list option }
type nonrec get_load_balancer_tls_policies_request =
  {
  page_token: string option }
type nonrec get_load_balancer_tls_certificates_result =
  {
  tls_certificates: load_balancer_tls_certificate list option }
type nonrec get_load_balancer_tls_certificates_request =
  {
  load_balancer_name: string }
type nonrec get_load_balancers_result =
  {
  next_page_token: string option ;
  load_balancers: load_balancer list option }
type nonrec get_load_balancers_request = {
  page_token: string option }
type nonrec get_load_balancer_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: load_balancer_metric_name option }
type nonrec get_load_balancer_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  period: int ;
  metric_name: load_balancer_metric_name ;
  load_balancer_name: string }
type nonrec get_load_balancer_result = {
  load_balancer: load_balancer option }
type nonrec get_load_balancer_request = {
  load_balancer_name: string }
type nonrec key_pair =
  {
  fingerprint: string option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec get_key_pairs_result =
  {
  next_page_token: string option ;
  key_pairs: key_pair list option }
type nonrec get_key_pairs_request =
  {
  include_default_key_pair: bool option ;
  page_token: string option }
type nonrec get_key_pair_result = {
  key_pair: key_pair option }
type nonrec get_key_pair_request = {
  key_pair_name: string }
type nonrec instance_state = {
  name: string option ;
  code: int option }
type nonrec get_instance_state_result = {
  state: instance_state option }
type nonrec get_instance_state_request = {
  instance_name: string }
type nonrec instance_snapshot_state =
  | Available 
  | Error 
  | Pending 
type nonrec add_on =
  {
  duration: string option ;
  threshold: string option ;
  next_snapshot_time_of_day: string option ;
  snapshot_time_of_day: string option ;
  status: string option ;
  name: string option }
type nonrec disk_state =
  | Unknown 
  | InUse 
  | Available 
  | Error 
  | Pending 
type nonrec auto_mount_status =
  | NotMounted 
  | Mounted 
  | Pending 
  | Failed 
type nonrec disk =
  {
  auto_mount_status: auto_mount_status option ;
  gb_in_use: int option ;
  attachment_state: string option ;
  is_attached: bool option ;
  attached_to: string option ;
  state: disk_state option ;
  path: string option ;
  iops: int option ;
  is_system_disk: bool option ;
  size_in_gb: int option ;
  add_ons: add_on list option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec instance_snapshot =
  {
  size_in_gb: int option ;
  is_from_auto_snapshot: bool option ;
  from_bundle_id: string option ;
  from_blueprint_id: string option ;
  from_instance_arn: string option ;
  from_instance_name: string option ;
  from_attached_disks: disk list option ;
  progress: string option ;
  state: instance_snapshot_state option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec get_instance_snapshots_result =
  {
  next_page_token: string option ;
  instance_snapshots: instance_snapshot list option }
type nonrec get_instance_snapshots_request = {
  page_token: string option }
type nonrec get_instance_snapshot_result =
  {
  instance_snapshot: instance_snapshot option }
type nonrec get_instance_snapshot_request = {
  instance_snapshot_name: string }
type nonrec instance_hardware =
  {
  ram_size_in_gb: float option ;
  disks: disk list option ;
  cpu_count: int option }
type nonrec access_direction =
  | Outbound 
  | Inbound 
type nonrec instance_port_info =
  {
  cidr_list_aliases: string list option ;
  ipv6_cidrs: string list option ;
  cidrs: string list option ;
  access_direction: access_direction option ;
  common_name: string option ;
  access_type: port_access_type option ;
  access_from: string option ;
  protocol: network_protocol option ;
  to_port: int option ;
  from_port: int option }
type nonrec instance_networking =
  {
  ports: instance_port_info list option ;
  monthly_transfer: monthly_transfer option }
type nonrec instance_metadata_state =
  | Applied 
  | Pending 
type nonrec instance_metadata_options =
  {
  http_protocol_ipv6: http_protocol_ipv6 option ;
  http_put_response_hop_limit: int option ;
  http_endpoint: http_endpoint option ;
  http_tokens: http_tokens option ;
  state: instance_metadata_state option }
type nonrec instance =
  {
  metadata_options: instance_metadata_options option ;
  ssh_key_name: string option ;
  username: string option ;
  state: instance_state option ;
  networking: instance_networking option ;
  hardware: instance_hardware option ;
  ip_address_type: ip_address_type option ;
  ipv6_addresses: string list option ;
  public_ip_address: string option ;
  private_ip_address: string option ;
  is_static_ip: bool option ;
  add_ons: add_on list option ;
  bundle_id: string option ;
  blueprint_name: string option ;
  blueprint_id: string option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec get_instances_result =
  {
  next_page_token: string option ;
  instances: instance list option }
type nonrec get_instances_request = {
  page_token: string option }
type nonrec instance_port_state =
  {
  cidr_list_aliases: string list option ;
  ipv6_cidrs: string list option ;
  cidrs: string list option ;
  state: port_state option ;
  protocol: network_protocol option ;
  to_port: int option ;
  from_port: int option }
type nonrec get_instance_port_states_result =
  {
  port_states: instance_port_state list option }
type nonrec get_instance_port_states_request = {
  instance_name: string }
type nonrec instance_metric_name =
  | MetadataNoToken 
  | BurstCapacityPercentage 
  | BurstCapacityTime 
  | StatusCheckFailed_System 
  | StatusCheckFailed_Instance 
  | StatusCheckFailed 
  | NetworkOut 
  | NetworkIn 
  | CPUUtilization 
type nonrec get_instance_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: instance_metric_name option }
type nonrec get_instance_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  period: int ;
  metric_name: instance_metric_name ;
  instance_name: string }
type nonrec instance_access_protocol =
  | Rdp 
  | Ssh 
type nonrec host_key_attributes =
  {
  not_valid_after: CoreTypes.Timestamp.t option ;
  not_valid_before: CoreTypes.Timestamp.t option ;
  fingerprint_sh_a256: string option ;
  fingerprint_sh_a1: string option ;
  witnessed_at: CoreTypes.Timestamp.t option ;
  public_key: string option ;
  algorithm: string option }
type nonrec instance_access_details =
  {
  host_keys: host_key_attributes list option ;
  username: string option ;
  instance_name: string option ;
  protocol: instance_access_protocol option ;
  private_key: string option ;
  password_data: password_data option ;
  password: string option ;
  ipv6_addresses: string list option ;
  ip_address: string option ;
  expires_at: CoreTypes.Timestamp.t option ;
  cert_key: string option }
type nonrec get_instance_access_details_result =
  {
  access_details: instance_access_details option }
type nonrec get_instance_access_details_request =
  {
  protocol: instance_access_protocol option ;
  instance_name: string }
type nonrec get_instance_result = {
  instance: instance option }
type nonrec get_instance_request = {
  instance_name: string }
type nonrec export_snapshot_record_source_type =
  | DiskSnapshot 
  | InstanceSnapshot 
type nonrec disk_info =
  {
  is_system_disk: bool option ;
  size_in_gb: int option ;
  path: string option ;
  name: string option }
type nonrec instance_snapshot_info =
  {
  from_disk_info: disk_info list option ;
  from_blueprint_id: string option ;
  from_bundle_id: string option }
type nonrec disk_snapshot_info = {
  size_in_gb: int option }
type nonrec export_snapshot_record_source_info =
  {
  disk_snapshot_info: disk_snapshot_info option ;
  instance_snapshot_info: instance_snapshot_info option ;
  from_resource_arn: string option ;
  from_resource_name: string option ;
  arn: string option ;
  name: string option ;
  created_at: CoreTypes.Timestamp.t option ;
  resource_type: export_snapshot_record_source_type option }
type nonrec destination_info = {
  service: string option ;
  id: string option }
type nonrec export_snapshot_record =
  {
  destination_info: destination_info option ;
  source_info: export_snapshot_record_source_info option ;
  state: record_state option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option }
type nonrec get_export_snapshot_records_result =
  {
  next_page_token: string option ;
  export_snapshot_records: export_snapshot_record list option }
type nonrec get_export_snapshot_records_request =
  {
  page_token: string option }
type nonrec domain =
  {
  registered_domain_delegation_info: registered_domain_delegation_info option ;
  domain_entries: domain_entry list option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec get_domains_result =
  {
  next_page_token: string option ;
  domains: domain list option }
type nonrec get_domains_request = {
  page_token: string option }
type nonrec get_domain_result = {
  domain: domain option }
type nonrec get_domain_request = {
  domain_name: string }
type nonrec lightsail_distribution =
  {
  viewer_minimum_tls_protocol_version: string option ;
  tags: tag list option ;
  ip_address_type: ip_address_type option ;
  able_to_update_bundle: bool option ;
  cache_behaviors: cache_behavior_per_path list option ;
  cache_behavior_settings: cache_settings option ;
  default_cache_behavior: cache_behavior option ;
  origin_public_dn_s: string option ;
  origin: origin option ;
  certificate_name: string option ;
  bundle_id: string option ;
  domain_name: string option ;
  is_enabled: bool option ;
  status: string option ;
  alternative_domain_names: string list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec get_distributions_result =
  {
  next_page_token: string option ;
  distributions: lightsail_distribution list option }
type nonrec get_distributions_request =
  {
  page_token: string option ;
  distribution_name: string option }
type nonrec distribution_metric_name =
  | Http5xxErrorRate 
  | Http4xxErrorRate 
  | TotalErrorRate 
  | BytesUploaded 
  | BytesDownloaded 
  | Requests 
type nonrec get_distribution_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: distribution_metric_name option }
type nonrec get_distribution_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  period: int ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  metric_name: distribution_metric_name ;
  distribution_name: string }
type nonrec get_distribution_latest_cache_reset_result =
  {
  create_time: CoreTypes.Timestamp.t option ;
  status: string option }
type nonrec get_distribution_latest_cache_reset_request =
  {
  distribution_name: string option }
type nonrec distribution_bundle =
  {
  is_active: bool option ;
  transfer_per_month_in_gb: int option ;
  price: float option ;
  name: string option ;
  bundle_id: string option }
type nonrec get_distribution_bundles_result =
  {
  bundles: distribution_bundle list option }
type nonrec get_distribution_bundles_request = unit
type nonrec disk_snapshot_state =
  | Unknown 
  | Error 
  | Completed 
  | Pending 
type nonrec disk_snapshot =
  {
  is_from_auto_snapshot: bool option ;
  from_instance_arn: string option ;
  from_instance_name: string option ;
  from_disk_arn: string option ;
  from_disk_name: string option ;
  progress: string option ;
  state: disk_snapshot_state option ;
  size_in_gb: int option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec get_disk_snapshots_result =
  {
  next_page_token: string option ;
  disk_snapshots: disk_snapshot list option }
type nonrec get_disk_snapshots_request = {
  page_token: string option }
type nonrec get_disk_snapshot_result = {
  disk_snapshot: disk_snapshot option }
type nonrec get_disk_snapshot_request = {
  disk_snapshot_name: string }
type nonrec get_disks_result =
  {
  next_page_token: string option ;
  disks: disk list option }
type nonrec get_disks_request = {
  page_token: string option }
type nonrec get_disk_result = {
  disk: disk option }
type nonrec get_disk_request = {
  disk_name: string }
type nonrec get_cost_estimate_result =
  {
  resources_budget_estimate: resource_budget_estimate list option }
type nonrec get_cost_estimate_request =
  {
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  resource_name: string }
type nonrec container_services_list_result =
  {
  container_services: container_service list option }
type nonrec get_container_services_request = {
  service_name: string option }
type nonrec container_service_power =
  {
  is_active: bool option ;
  name: string option ;
  ram_size_in_gb: float option ;
  cpu_count: float option ;
  price: float option ;
  power_id: string option }
type nonrec get_container_service_powers_result =
  {
  powers: container_service_power list option }
type nonrec get_container_service_powers_request = unit
type nonrec container_service_metric_name =
  | MemoryUtilization 
  | CPUUtilization 
type nonrec get_container_service_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: container_service_metric_name option }
type nonrec get_container_service_metric_data_request =
  {
  statistics: metric_statistic list ;
  period: int ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  metric_name: container_service_metric_name ;
  service_name: string }
type nonrec get_container_service_deployments_result =
  {
  deployments: container_service_deployment list option }
type nonrec get_container_service_deployments_request =
  {
  service_name: string }
type nonrec container_service_log_event =
  {
  message: string option ;
  created_at: CoreTypes.Timestamp.t option }
type nonrec get_container_log_result =
  {
  next_page_token: string option ;
  log_events: container_service_log_event list option }
type nonrec get_container_log_request =
  {
  page_token: string option ;
  filter_pattern: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  container_name: string ;
  service_name: string }
type nonrec get_container_images_result =
  {
  container_images: container_image list option }
type nonrec get_container_images_request = {
  service_name: string }
type nonrec container_service_metadata_entry = (string * string) list
type nonrec get_container_api_metadata_result =
  {
  metadata: container_service_metadata_entry list option }
type nonrec get_container_api_metadata_request = unit
type nonrec contact_method_status =
  | Invalid 
  | Valid 
  | PendingVerification 
type nonrec contact_method =
  {
  support_code: string option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option ;
  protocol: contact_protocol option ;
  status: contact_method_status option ;
  contact_endpoint: string option }
type nonrec get_contact_methods_result =
  {
  contact_methods: contact_method list option }
type nonrec get_contact_methods_request =
  {
  protocols: contact_protocol list option }
type nonrec cloud_formation_stack_record_source_type =
  | ExportSnapshotRecord 
type nonrec cloud_formation_stack_record_source_info =
  {
  arn: string option ;
  name: string option ;
  resource_type: cloud_formation_stack_record_source_type option }
type nonrec cloud_formation_stack_record =
  {
  destination_info: destination_info option ;
  source_info: cloud_formation_stack_record_source_info list option ;
  state: record_state option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option }
type nonrec get_cloud_formation_stack_records_result =
  {
  next_page_token: string option ;
  cloud_formation_stack_records: cloud_formation_stack_record list option }
type nonrec get_cloud_formation_stack_records_request =
  {
  page_token: string option }
type nonrec certificate_status =
  | Failed 
  | Revoked 
  | ValidationTimedOut 
  | Expired 
  | Inactive 
  | Issued 
  | PendingValidation 
type nonrec certificate =
  {
  support_code: string option ;
  tags: tag list option ;
  revocation_reason: string option ;
  revoked_at: CoreTypes.Timestamp.t option ;
  renewal_summary: renewal_summary option ;
  eligible_to_renew: string option ;
  not_after: CoreTypes.Timestamp.t option ;
  not_before: CoreTypes.Timestamp.t option ;
  issuer_c_a: string option ;
  issued_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  key_algorithm: string option ;
  in_use_resource_count: int option ;
  request_failure_reason: string option ;
  domain_validation_records: domain_validation_record list option ;
  subject_alternative_names: string list option ;
  serial_number: string option ;
  status: certificate_status option ;
  domain_name: string option ;
  name: string option ;
  arn: string option }
type nonrec certificate_summary =
  {
  tags: tag list option ;
  certificate_detail: certificate option ;
  domain_name: string option ;
  certificate_name: string option ;
  certificate_arn: string option }
type nonrec get_certificates_result =
  {
  next_page_token: string option ;
  certificates: certificate_summary list option }
type nonrec get_certificates_request =
  {
  page_token: string option ;
  certificate_name: string option ;
  include_certificate_details: bool option ;
  certificate_statuses: certificate_status list option }
type nonrec instance_platform =
  | Windows 
  | LinuxUnix 
type nonrec app_category =
  | LfR 
type nonrec bundle =
  {
  public_ipv4_address_count: int option ;
  supported_app_categories: app_category list option ;
  supported_platforms: instance_platform list option ;
  transfer_per_month_in_gb: int option ;
  ram_size_in_gb: float option ;
  power: int option ;
  name: string option ;
  is_active: bool option ;
  instance_type: string option ;
  bundle_id: string option ;
  disk_size_in_gb: int option ;
  cpu_count: int option ;
  price: float option }
type nonrec get_bundles_result =
  {
  next_page_token: string option ;
  bundles: bundle list option }
type nonrec get_bundles_request =
  {
  app_category: app_category option ;
  page_token: string option ;
  include_inactive: bool option }
type nonrec account_level_bpa_sync_status =
  | Defaulted 
  | NeverSynced 
  | Failed 
  | InSync 
type nonrec bpa_status_message =
  | Unknown 
  | DEFAULTED_FOR_SLR_MISSING_ON_HOLD 
  | SYNC_ON_HOLD 
  | DEFAULTED_FOR_SLR_MISSING 
type nonrec account_level_bpa_sync =
  {
  bpa_impacts_lightsail: bool option ;
  message: bpa_status_message option ;
  last_synced_at: CoreTypes.Timestamp.t option ;
  status: account_level_bpa_sync_status option }
type nonrec get_buckets_result =
  {
  account_level_bpa_sync: account_level_bpa_sync option ;
  next_page_token: string option ;
  buckets: bucket list option }
type nonrec get_buckets_request =
  {
  include_connected_resources: bool option ;
  page_token: string option ;
  bucket_name: string option }
type nonrec bucket_metric_name =
  | NumberOfObjects 
  | BucketSizeBytes 
type nonrec get_bucket_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: bucket_metric_name option }
type nonrec get_bucket_metric_data_request =
  {
  unit_: metric_unit ;
  statistics: metric_statistic list ;
  period: int ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  metric_name: bucket_metric_name ;
  bucket_name: string }
type nonrec bucket_bundle =
  {
  is_active: bool option ;
  transfer_per_month_in_gb: int option ;
  storage_per_month_in_gb: int option ;
  price: float option ;
  name: string option ;
  bundle_id: string option }
type nonrec get_bucket_bundles_result = {
  bundles: bucket_bundle list option }
type nonrec get_bucket_bundles_request = {
  include_inactive: bool option }
type nonrec access_key_last_used =
  {
  service_name: string option ;
  region: string option ;
  last_used_date: CoreTypes.Timestamp.t option }
type nonrec access_key =
  {
  last_used: access_key_last_used option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: status_type option ;
  secret_access_key: string option ;
  access_key_id: string option }
type nonrec get_bucket_access_keys_result =
  {
  access_keys: access_key list option }
type nonrec get_bucket_access_keys_request = {
  bucket_name: string }
type nonrec blueprint_type =
  | App 
  | Os 
type nonrec blueprint =
  {
  app_category: app_category option ;
  platform: instance_platform option ;
  license_url: string option ;
  product_url: string option ;
  version_code: string option ;
  version: string option ;
  min_power: int option ;
  is_active: bool option ;
  description: string option ;
  type_: blueprint_type option ;
  group: string option ;
  name: string option ;
  blueprint_id: string option }
type nonrec get_blueprints_result =
  {
  next_page_token: string option ;
  blueprints: blueprint list option }
type nonrec get_blueprints_request =
  {
  app_category: app_category option ;
  page_token: string option ;
  include_inactive: bool option }
type nonrec auto_snapshot_status =
  | NOT_FOUND 
  | IN_PROGRESS 
  | FAILED 
  | SUCCESS 
type nonrec attached_disk = {
  size_in_gb: int option ;
  path: string option }
type nonrec auto_snapshot_details =
  {
  from_attached_disks: attached_disk list option ;
  status: auto_snapshot_status option ;
  created_at: CoreTypes.Timestamp.t option ;
  date: string option }
type nonrec get_auto_snapshots_result =
  {
  auto_snapshots: auto_snapshot_details list option ;
  resource_type: resource_type option ;
  resource_name: string option }
type nonrec get_auto_snapshots_request = {
  resource_name: string }
type nonrec alarm =
  {
  notification_enabled: bool option ;
  notification_triggers: alarm_state list option ;
  contact_protocols: contact_protocol list option ;
  unit_: metric_unit option ;
  state: alarm_state option ;
  metric_name: metric_name option ;
  statistic: metric_statistic option ;
  treat_missing_data: treat_missing_data option ;
  datapoints_to_alarm: int option ;
  threshold: float option ;
  period: int option ;
  evaluation_periods: int option ;
  comparison_operator: comparison_operator option ;
  monitored_resource_info: monitored_resource_info option ;
  support_code: string option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option }
type nonrec get_alarms_result =
  {
  next_page_token: string option ;
  alarms: alarm list option }
type nonrec get_alarms_request =
  {
  monitored_resource_name: string option ;
  page_token: string option ;
  alarm_name: string option }
type nonrec get_active_names_result =
  {
  next_page_token: string option ;
  active_names: string list option }
type nonrec get_active_names_request = {
  page_token: string option }
type nonrec export_snapshot_result = {
  operations: operation list option }
type nonrec export_snapshot_request = {
  source_snapshot_name: string }
type nonrec enable_add_on_result = {
  operations: operation list option }
type nonrec add_on_type =
  | StopInstanceOnIdle 
  | AutoSnapshot 
type nonrec auto_snapshot_add_on_request =
  {
  snapshot_time_of_day: string option }
type nonrec add_on_request =
  {
  stop_instance_on_idle_request: stop_instance_on_idle_request option ;
  auto_snapshot_add_on_request: auto_snapshot_add_on_request option ;
  add_on_type: add_on_type }
type nonrec enable_add_on_request =
  {
  add_on_request: add_on_request ;
  resource_name: string }
type nonrec download_default_key_pair_result =
  {
  created_at: CoreTypes.Timestamp.t option ;
  private_key_base64: string option ;
  public_key_base64: string option }
type nonrec download_default_key_pair_request = unit
type nonrec disable_add_on_result = {
  operations: operation list option }
type nonrec disable_add_on_request =
  {
  resource_name: string ;
  add_on_type: add_on_type }
type nonrec detach_static_ip_result = {
  operations: operation list option }
type nonrec detach_static_ip_request = {
  static_ip_name: string }
type nonrec detach_instances_from_load_balancer_result =
  {
  operations: operation list option }
type nonrec detach_instances_from_load_balancer_request =
  {
  instance_names: string list ;
  load_balancer_name: string }
type nonrec detach_disk_result = {
  operations: operation list option }
type nonrec detach_disk_request = {
  disk_name: string }
type nonrec detach_certificate_from_distribution_result =
  {
  operation: operation option }
type nonrec detach_certificate_from_distribution_request =
  {
  distribution_name: string }
type nonrec delete_relational_database_snapshot_result =
  {
  operations: operation list option }
type nonrec delete_relational_database_snapshot_request =
  {
  relational_database_snapshot_name: string }
type nonrec delete_relational_database_result =
  {
  operations: operation list option }
type nonrec delete_relational_database_request =
  {
  final_relational_database_snapshot_name: string option ;
  skip_final_snapshot: bool option ;
  relational_database_name: string }
type nonrec delete_load_balancer_tls_certificate_result =
  {
  operations: operation list option }
type nonrec delete_load_balancer_tls_certificate_request =
  {
  force: bool option ;
  certificate_name: string ;
  load_balancer_name: string }
type nonrec delete_load_balancer_result =
  {
  operations: operation list option }
type nonrec delete_load_balancer_request = {
  load_balancer_name: string }
type nonrec delete_known_host_keys_result =
  {
  operations: operation list option }
type nonrec delete_known_host_keys_request = {
  instance_name: string }
type nonrec delete_key_pair_result = {
  operation: operation option }
type nonrec delete_key_pair_request =
  {
  expected_fingerprint: string option ;
  key_pair_name: string }
type nonrec delete_instance_snapshot_result =
  {
  operations: operation list option }
type nonrec delete_instance_snapshot_request =
  {
  instance_snapshot_name: string }
type nonrec delete_instance_result = {
  operations: operation list option }
type nonrec delete_instance_request =
  {
  force_delete_add_ons: bool option ;
  instance_name: string }
type nonrec delete_domain_entry_result = {
  operation: operation option }
type nonrec delete_domain_entry_request =
  {
  domain_entry: domain_entry ;
  domain_name: string }
type nonrec delete_domain_result = {
  operation: operation option }
type nonrec delete_domain_request = {
  domain_name: string }
type nonrec delete_distribution_result = {
  operation: operation option }
type nonrec delete_distribution_request = {
  distribution_name: string option }
type nonrec delete_disk_snapshot_result =
  {
  operations: operation list option }
type nonrec delete_disk_snapshot_request = {
  disk_snapshot_name: string }
type nonrec delete_disk_result = {
  operations: operation list option }
type nonrec delete_disk_request =
  {
  force_delete_add_ons: bool option ;
  disk_name: string }
type nonrec delete_container_service_result = unit
type nonrec delete_container_service_request = {
  service_name: string }
type nonrec delete_container_image_result = unit
type nonrec delete_container_image_request =
  {
  image: string ;
  service_name: string }
type nonrec delete_contact_method_result =
  {
  operations: operation list option }
type nonrec delete_contact_method_request = {
  protocol: contact_protocol }
type nonrec delete_certificate_result = {
  operations: operation list option }
type nonrec delete_certificate_request = {
  certificate_name: string }
type nonrec delete_bucket_access_key_result =
  {
  operations: operation list option }
type nonrec delete_bucket_access_key_request =
  {
  access_key_id: string ;
  bucket_name: string }
type nonrec delete_bucket_result = {
  operations: operation list option }
type nonrec delete_bucket_request =
  {
  force_delete: bool option ;
  bucket_name: string }
type nonrec delete_auto_snapshot_result =
  {
  operations: operation list option }
type nonrec delete_auto_snapshot_request =
  {
  date: string ;
  resource_name: string }
type nonrec delete_alarm_result = {
  operations: operation list option }
type nonrec delete_alarm_request = {
  alarm_name: string }
type nonrec create_relational_database_snapshot_result =
  {
  operations: operation list option }
type nonrec create_relational_database_snapshot_request =
  {
  tags: tag list option ;
  relational_database_snapshot_name: string ;
  relational_database_name: string }
type nonrec create_relational_database_from_snapshot_result =
  {
  operations: operation list option }
type nonrec create_relational_database_from_snapshot_request =
  {
  tags: tag list option ;
  use_latest_restorable_time: bool option ;
  restore_time: CoreTypes.Timestamp.t option ;
  source_relational_database_name: string option ;
  relational_database_bundle_id: string option ;
  relational_database_snapshot_name: string option ;
  publicly_accessible: bool option ;
  availability_zone: string option ;
  relational_database_name: string }
type nonrec create_relational_database_result =
  {
  operations: operation list option }
type nonrec create_relational_database_request =
  {
  tags: tag list option ;
  publicly_accessible: bool option ;
  preferred_maintenance_window: string option ;
  preferred_backup_window: string option ;
  master_user_password: string option ;
  master_username: string ;
  master_database_name: string ;
  relational_database_bundle_id: string ;
  relational_database_blueprint_id: string ;
  availability_zone: string option ;
  relational_database_name: string }
type nonrec create_load_balancer_tls_certificate_result =
  {
  operations: operation list option }
type nonrec create_load_balancer_tls_certificate_request =
  {
  tags: tag list option ;
  certificate_alternative_names: string list option ;
  certificate_domain_name: string ;
  certificate_name: string ;
  load_balancer_name: string }
type nonrec create_load_balancer_result =
  {
  operations: operation list option }
type nonrec create_load_balancer_request =
  {
  tls_policy_name: string option ;
  ip_address_type: ip_address_type option ;
  tags: tag list option ;
  certificate_alternative_names: string list option ;
  certificate_domain_name: string option ;
  certificate_name: string option ;
  health_check_path: string option ;
  instance_port: int ;
  load_balancer_name: string }
type nonrec create_key_pair_result =
  {
  operation: operation option ;
  private_key_base64: string option ;
  public_key_base64: string option ;
  key_pair: key_pair option }
type nonrec create_key_pair_request =
  {
  tags: tag list option ;
  key_pair_name: string }
type nonrec create_instance_snapshot_result =
  {
  operations: operation list option }
type nonrec create_instance_snapshot_request =
  {
  tags: tag list option ;
  instance_name: string ;
  instance_snapshot_name: string }
type nonrec create_instances_from_snapshot_result =
  {
  operations: operation list option }
type nonrec disk_map =
  {
  new_disk_name: string option ;
  original_disk_path: string option }
type nonrec attached_disk_map = (string * disk_map list) list
type nonrec create_instances_from_snapshot_request =
  {
  use_latest_restorable_auto_snapshot: bool option ;
  restore_date: string option ;
  source_instance_name: string option ;
  ip_address_type: ip_address_type option ;
  add_ons: add_on_request list option ;
  tags: tag list option ;
  key_pair_name: string option ;
  user_data: string option ;
  bundle_id: string ;
  instance_snapshot_name: string option ;
  availability_zone: string ;
  attached_disk_mapping: attached_disk_map option ;
  instance_names: string list }
type nonrec create_instances_result = {
  operations: operation list option }
type nonrec create_instances_request =
  {
  ip_address_type: ip_address_type option ;
  add_ons: add_on_request list option ;
  tags: tag list option ;
  key_pair_name: string option ;
  user_data: string option ;
  bundle_id: string ;
  blueprint_id: string ;
  custom_image_name: string option ;
  availability_zone: string ;
  instance_names: string list }
type nonrec create_gui_session_access_details_result =
  {
  sessions: session list option ;
  failure_reason: string option ;
  percentage_complete: int option ;
  status: status option ;
  resource_name: string option }
type nonrec create_gui_session_access_details_request =
  {
  resource_name: string }
type nonrec create_domain_entry_result = {
  operation: operation option }
type nonrec create_domain_entry_request =
  {
  domain_entry: domain_entry ;
  domain_name: string }
type nonrec create_domain_result = {
  operation: operation option }
type nonrec create_domain_request =
  {
  tags: tag list option ;
  domain_name: string }
type nonrec create_distribution_result =
  {
  operation: operation option ;
  distribution: lightsail_distribution option }
type nonrec create_distribution_request =
  {
  viewer_minimum_tls_protocol_version:
    viewer_minimum_tls_protocol_version_enum option ;
  certificate_name: string option ;
  tags: tag list option ;
  ip_address_type: ip_address_type option ;
  bundle_id: string ;
  cache_behaviors: cache_behavior_per_path list option ;
  cache_behavior_settings: cache_settings option ;
  default_cache_behavior: cache_behavior ;
  origin: input_origin ;
  distribution_name: string }
type nonrec create_disk_snapshot_result =
  {
  operations: operation list option }
type nonrec create_disk_snapshot_request =
  {
  tags: tag list option ;
  instance_name: string option ;
  disk_snapshot_name: string ;
  disk_name: string option }
type nonrec create_disk_from_snapshot_result =
  {
  operations: operation list option }
type nonrec create_disk_from_snapshot_request =
  {
  use_latest_restorable_auto_snapshot: bool option ;
  restore_date: string option ;
  source_disk_name: string option ;
  add_ons: add_on_request list option ;
  tags: tag list option ;
  size_in_gb: int ;
  availability_zone: string ;
  disk_snapshot_name: string option ;
  disk_name: string }
type nonrec create_disk_result = {
  operations: operation list option }
type nonrec create_disk_request =
  {
  add_ons: add_on_request list option ;
  tags: tag list option ;
  size_in_gb: int ;
  availability_zone: string ;
  disk_name: string }
type nonrec container_service_registry_login =
  {
  registry: string option ;
  expires_at: CoreTypes.Timestamp.t option ;
  password: string option ;
  username: string option }
type nonrec create_container_service_registry_login_result =
  {
  registry_login: container_service_registry_login option }
type nonrec create_container_service_registry_login_request = unit
type nonrec create_container_service_deployment_result =
  {
  container_service: container_service option }
type nonrec endpoint_request =
  {
  health_check: container_service_health_check_config option ;
  container_port: int ;
  container_name: string }
type nonrec create_container_service_deployment_request =
  {
  public_endpoint: endpoint_request option ;
  containers: container_map option ;
  service_name: string }
type nonrec create_container_service_result =
  {
  container_service: container_service option }
type nonrec container_service_deployment_request =
  {
  public_endpoint: endpoint_request option ;
  containers: container_map option }
type nonrec create_container_service_request =
  {
  private_registry_access: private_registry_access_request option ;
  deployment: container_service_deployment_request option ;
  public_domain_names: container_service_public_domains option ;
  tags: tag list option ;
  scale: int ;
  power: container_service_power_name ;
  service_name: string }
type nonrec create_contact_method_result =
  {
  operations: operation list option }
type nonrec create_contact_method_request =
  {
  contact_endpoint: string ;
  protocol: contact_protocol }
type nonrec create_cloud_formation_stack_result =
  {
  operations: operation list option }
type nonrec instance_entry =
  {
  availability_zone: string ;
  user_data: string option ;
  port_info_source: port_info_source_type ;
  instance_type: string ;
  source_name: string }
type nonrec create_cloud_formation_stack_request =
  {
  instances: instance_entry list }
type nonrec create_certificate_result =
  {
  operations: operation list option ;
  certificate: certificate_summary option }
type nonrec create_certificate_request =
  {
  tags: tag list option ;
  subject_alternative_names: string list option ;
  domain_name: string ;
  certificate_name: string }
type nonrec create_bucket_access_key_result =
  {
  operations: operation list option ;
  access_key: access_key option }
type nonrec create_bucket_access_key_request = {
  bucket_name: string }
type nonrec create_bucket_result =
  {
  operations: operation list option ;
  bucket: bucket option }
type nonrec create_bucket_request =
  {
  enable_object_versioning: bool option ;
  tags: tag list option ;
  bundle_id: string ;
  bucket_name: string }
type nonrec copy_snapshot_result = {
  operations: operation list option }
type nonrec copy_snapshot_request =
  {
  source_region: region_name ;
  target_snapshot_name: string ;
  use_latest_restorable_auto_snapshot: bool option ;
  restore_date: string option ;
  source_resource_name: string option ;
  source_snapshot_name: string option }
type nonrec close_instance_public_ports_result =
  {
  operation: operation option }
type nonrec close_instance_public_ports_request =
  {
  instance_name: string ;
  port_info: port_info }
type nonrec attach_static_ip_result = {
  operations: operation list option }
type nonrec attach_static_ip_request =
  {
  instance_name: string ;
  static_ip_name: string }
type nonrec attach_load_balancer_tls_certificate_result =
  {
  operations: operation list option }
type nonrec attach_load_balancer_tls_certificate_request =
  {
  certificate_name: string ;
  load_balancer_name: string }
type nonrec attach_instances_to_load_balancer_result =
  {
  operations: operation list option }
type nonrec attach_instances_to_load_balancer_request =
  {
  instance_names: string list ;
  load_balancer_name: string }
type nonrec attach_disk_result = {
  operations: operation list option }
type nonrec attach_disk_request =
  {
  auto_mounting: bool option ;
  disk_path: string ;
  instance_name: string ;
  disk_name: string }
type nonrec attach_certificate_to_distribution_result =
  {
  operation: operation option }
type nonrec attach_certificate_to_distribution_request =
  {
  certificate_name: string ;
  distribution_name: string }
type nonrec allocate_static_ip_result = {
  operations: operation list option }
type nonrec allocate_static_ip_request = {
  static_ip_name: string }(** {1:builders Builders} *)

val make_setup_request :
  ?certificate_provider:certificate_provider ->
    ?domain_names:string list ->
      ?instance_name:string -> unit -> setup_request
val make_resource_location :
  ?region_name:region_name ->
    ?availability_zone:string -> unit -> resource_location
val make_setup_history_resource :
  ?resource_type:resource_type ->
    ?location:resource_location ->
      ?created_at:CoreTypes.Timestamp.t ->
        ?arn:string -> ?name:string -> unit -> setup_history_resource
val make_setup_execution_details :
  ?version:string ->
    ?standard_output:string ->
      ?standard_error:string ->
        ?status:setup_status ->
          ?name:string ->
            ?date_time:CoreTypes.Timestamp.t ->
              ?command:string -> unit -> setup_execution_details
val make_setup_history :
  ?status:setup_status ->
    ?execution_details:setup_execution_details list ->
      ?resource:setup_history_resource ->
        ?request:setup_request ->
          ?operation_id:string -> unit -> setup_history
val make_operation :
  ?error_details:string ->
    ?error_code:string ->
      ?status_changed_at:CoreTypes.Timestamp.t ->
        ?status:operation_status ->
          ?operation_type:operation_type ->
            ?operation_details:string ->
              ?is_terminal:bool ->
                ?location:resource_location ->
                  ?created_at:CoreTypes.Timestamp.t ->
                    ?resource_type:resource_type ->
                      ?resource_name:string ->
                        ?id:string -> unit -> operation
val make_update_relational_database_request :
  ?relational_database_blueprint_id:string ->
    ?ca_certificate_identifier:string ->
      ?apply_immediately:bool ->
        ?publicly_accessible:bool ->
          ?disable_backup_retention:bool ->
            ?enable_backup_retention:bool ->
              ?preferred_maintenance_window:string ->
                ?preferred_backup_window:string ->
                  ?rotate_master_user_password:bool ->
                    ?master_user_password:string ->
                      relational_database_name:string ->
                        unit -> update_relational_database_request
val make_relational_database_parameter :
  ?parameter_value:string ->
    ?parameter_name:string ->
      ?is_modifiable:bool ->
        ?description:string ->
          ?data_type:string ->
            ?apply_type:string ->
              ?apply_method:string ->
                ?allowed_values:string ->
                  unit -> relational_database_parameter
val make_update_relational_database_parameters_request :
  parameters:relational_database_parameter list ->
    relational_database_name:string ->
      unit -> update_relational_database_parameters_request
val make_update_load_balancer_attribute_request :
  attribute_value:string ->
    attribute_name:load_balancer_attribute_name ->
      load_balancer_name:string ->
        unit -> update_load_balancer_attribute_request
val make_update_instance_metadata_options_request :
  ?http_protocol_ipv6:http_protocol_ipv6 ->
    ?http_put_response_hop_limit:int ->
      ?http_endpoint:http_endpoint ->
        ?http_tokens:http_tokens ->
          instance_name:string ->
            unit -> update_instance_metadata_options_request
val make_domain_entry :
  ?options:domain_entry_options ->
    ?type_:string ->
      ?is_alias:bool ->
        ?target:string -> ?name:string -> ?id:string -> unit -> domain_entry
val make_update_domain_entry_request :
  domain_entry:domain_entry ->
    domain_name:string -> unit -> update_domain_entry_request
val make_input_origin :
  ?response_timeout:int ->
    ?protocol_policy:origin_protocol_policy_enum ->
      ?region_name:region_name -> ?name:string -> unit -> input_origin
val make_cache_behavior : ?behavior:behavior_enum -> unit -> cache_behavior
val make_cookie_object :
  ?cookies_allow_list:string list ->
    ?option_:forward_values -> unit -> cookie_object
val make_header_object :
  ?headers_allow_list:header_enum list ->
    ?option_:forward_values -> unit -> header_object
val make_query_string_object :
  ?query_strings_allow_list:string list ->
    ?option_:bool -> unit -> query_string_object
val make_cache_settings :
  ?forwarded_query_strings:query_string_object ->
    ?forwarded_headers:header_object ->
      ?forwarded_cookies:cookie_object ->
        ?cached_http_methods:string ->
          ?allowed_http_methods:string ->
            ?maximum_tt_l:int ->
              ?minimum_tt_l:int ->
                ?default_tt_l:int -> unit -> cache_settings
val make_cache_behavior_per_path :
  ?behavior:behavior_enum -> ?path:string -> unit -> cache_behavior_per_path
val make_update_distribution_request :
  ?use_default_certificate:bool ->
    ?certificate_name:string ->
      ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum
        ->
        ?is_enabled:bool ->
          ?cache_behaviors:cache_behavior_per_path list ->
            ?cache_behavior_settings:cache_settings ->
              ?default_cache_behavior:cache_behavior ->
                ?origin:input_origin ->
                  distribution_name:string ->
                    unit -> update_distribution_request
val make_update_distribution_bundle_request :
  ?bundle_id:string ->
    ?distribution_name:string -> unit -> update_distribution_bundle_request
val make_tag : ?value:string -> ?key:string -> unit -> tag
val make_container_service_state_detail :
  ?message:string ->
    ?code:container_service_state_detail_code ->
      unit -> container_service_state_detail
val make_container :
  ?ports:port_map ->
    ?environment:environment ->
      ?command:string list -> ?image:string -> unit -> container
val make_container_service_health_check_config :
  ?success_codes:string ->
    ?path:string ->
      ?interval_seconds:int ->
        ?timeout_seconds:int ->
          ?unhealthy_threshold:int ->
            ?healthy_threshold:int ->
              unit -> container_service_health_check_config
val make_container_service_endpoint :
  ?health_check:container_service_health_check_config ->
    ?container_port:int ->
      ?container_name:string -> unit -> container_service_endpoint
val make_container_service_deployment :
  ?created_at:CoreTypes.Timestamp.t ->
    ?public_endpoint:container_service_endpoint ->
      ?containers:container_map ->
        ?state:container_service_deployment_state ->
          ?version:int -> unit -> container_service_deployment
val make_container_service_ecr_image_puller_role :
  ?principal_arn:string ->
    ?is_active:bool -> unit -> container_service_ecr_image_puller_role
val make_private_registry_access :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role ->
    unit -> private_registry_access
val make_container_service :
  ?private_registry_access:private_registry_access ->
    ?url:string ->
      ?public_domain_names:container_service_public_domains ->
        ?private_domain_name:string ->
          ?principal_arn:string ->
            ?is_disabled:bool ->
              ?next_deployment:container_service_deployment ->
                ?current_deployment:container_service_deployment ->
                  ?scale:int ->
                    ?state_detail:container_service_state_detail ->
                      ?state:container_service_state ->
                        ?power_id:string ->
                          ?power:container_service_power_name ->
                            ?tags:tag list ->
                              ?resource_type:resource_type ->
                                ?location:resource_location ->
                                  ?created_at:CoreTypes.Timestamp.t ->
                                    ?arn:string ->
                                      ?container_service_name:string ->
                                        unit -> container_service
val make_container_service_ecr_image_puller_role_request :
  ?is_active:bool -> unit -> container_service_ecr_image_puller_role_request
val make_private_registry_access_request :
  ?ecr_image_puller_role:container_service_ecr_image_puller_role_request ->
    unit -> private_registry_access_request
val make_update_container_service_request :
  ?private_registry_access:private_registry_access_request ->
    ?public_domain_names:container_service_public_domains ->
      ?is_disabled:bool ->
        ?scale:int ->
          ?power:container_service_power_name ->
            service_name:string -> unit -> update_container_service_request
val make_access_rules :
  ?allow_public_overrides:bool ->
    ?get_object:access_type -> unit -> access_rules
val make_resource_receiving_access :
  ?resource_type:string -> ?name:string -> unit -> resource_receiving_access
val make_bucket_state :
  ?message:string -> ?code:string -> unit -> bucket_state
val make_bucket_access_log_config :
  ?prefix:string ->
    ?destination:string -> enabled:bool -> unit -> bucket_access_log_config
val make_bucket :
  ?access_log_config:bucket_access_log_config ->
    ?state:bucket_state ->
      ?resources_receiving_access:resource_receiving_access list ->
        ?readonly_access_accounts:string list ->
          ?able_to_update_bundle:bool ->
            ?object_versioning:string ->
              ?tags:tag list ->
                ?support_code:string ->
                  ?name:string ->
                    ?location:resource_location ->
                      ?url:string ->
                        ?created_at:CoreTypes.Timestamp.t ->
                          ?bundle_id:string ->
                            ?arn:string ->
                              ?access_rules:access_rules ->
                                ?resource_type:string -> unit -> bucket
val make_update_bucket_request :
  ?access_log_config:bucket_access_log_config ->
    ?readonly_access_accounts:string list ->
      ?versioning:string ->
        ?access_rules:access_rules ->
          bucket_name:string -> unit -> update_bucket_request
val make_update_bucket_bundle_request :
  bundle_id:string ->
    bucket_name:string -> unit -> update_bucket_bundle_request
val make_untag_resource_request :
  ?resource_arn:string ->
    tag_keys:string list ->
      resource_name:string -> unit -> untag_resource_request
val make_unpeer_vpc_request : unit -> unpeer_vpc_request
val make_time_period :
  ?end_:CoreTypes.Timestamp.t ->
    ?start:CoreTypes.Timestamp.t -> unit -> time_period
val make_test_alarm_request :
  state:alarm_state -> alarm_name:string -> unit -> test_alarm_request
val make_tag_resource_request :
  ?resource_arn:string ->
    tags:tag list -> resource_name:string -> unit -> tag_resource_request
val make_stop_relational_database_request :
  ?relational_database_snapshot_name:string ->
    relational_database_name:string ->
      unit -> stop_relational_database_request
val make_stop_instance_request :
  ?force:bool -> instance_name:string -> unit -> stop_instance_request
val make_stop_instance_on_idle_request :
  ?duration:string ->
    ?threshold:string -> unit -> stop_instance_on_idle_request
val make_stop_gui_session_request :
  resource_name:string -> unit -> stop_gui_session_request
val make_static_ip :
  ?is_attached:bool ->
    ?attached_to:string ->
      ?ip_address:string ->
        ?resource_type:resource_type ->
          ?location:resource_location ->
            ?created_at:CoreTypes.Timestamp.t ->
              ?support_code:string ->
                ?arn:string -> ?name:string -> unit -> static_ip
val make_start_relational_database_request :
  relational_database_name:string ->
    unit -> start_relational_database_request
val make_start_instance_request :
  instance_name:string -> unit -> start_instance_request
val make_start_gui_session_request :
  resource_name:string -> unit -> start_gui_session_request
val make_setup_instance_https_request :
  certificate_provider:certificate_provider ->
    domain_names:string list ->
      email_address:string ->
        instance_name:string -> unit -> setup_instance_https_request
val make_set_resource_access_for_bucket_request :
  access:resource_bucket_access ->
    bucket_name:string ->
      resource_name:string -> unit -> set_resource_access_for_bucket_request
val make_set_ip_address_type_request :
  ?accept_bundle_update:bool ->
    ip_address_type:ip_address_type ->
      resource_name:string ->
        resource_type:resource_type -> unit -> set_ip_address_type_request
val make_session :
  ?is_primary:bool -> ?url:string -> ?name:string -> unit -> session
val make_send_contact_method_verification_request :
  protocol:contact_method_verification_protocol ->
    unit -> send_contact_method_verification_request
val make_estimate_by_time :
  ?time_period:time_period ->
    ?currency:currency ->
      ?unit_:float ->
        ?pricing_unit:pricing_unit ->
          ?usage_cost:float -> unit -> estimate_by_time
val make_cost_estimate :
  ?results_by_time:estimate_by_time list ->
    ?usage_type:string -> unit -> cost_estimate
val make_resource_budget_estimate :
  ?end_time:CoreTypes.Timestamp.t ->
    ?start_time:CoreTypes.Timestamp.t ->
      ?cost_estimates:cost_estimate list ->
        ?resource_type:resource_type ->
          ?resource_name:string -> unit -> resource_budget_estimate
val make_resource_record :
  ?value:string -> ?type_:string -> ?name:string -> unit -> resource_record
val make_reset_distribution_cache_request :
  ?distribution_name:string -> unit -> reset_distribution_cache_request
val make_dns_record_creation_state :
  ?message:string ->
    ?code:dns_record_creation_state_code -> unit -> dns_record_creation_state
val make_domain_validation_record :
  ?validation_status:certificate_domain_validation_status ->
    ?dns_record_creation_state:dns_record_creation_state ->
      ?resource_record:resource_record ->
        ?domain_name:string -> unit -> domain_validation_record
val make_renewal_summary :
  ?updated_at:CoreTypes.Timestamp.t ->
    ?renewal_status_reason:string ->
      ?renewal_status:renewal_status ->
        ?domain_validation_records:domain_validation_record list ->
          unit -> renewal_summary
val make_release_static_ip_request :
  static_ip_name:string -> unit -> release_static_ip_request
val make_relational_database_snapshot :
  ?from_relational_database_blueprint_id:string ->
    ?from_relational_database_bundle_id:string ->
      ?from_relational_database_arn:string ->
        ?from_relational_database_name:string ->
          ?state:string ->
            ?size_in_gb:int ->
              ?engine_version:string ->
                ?engine:string ->
                  ?tags:tag list ->
                    ?resource_type:resource_type ->
                      ?location:resource_location ->
                        ?created_at:CoreTypes.Timestamp.t ->
                          ?support_code:string ->
                            ?arn:string ->
                              ?name:string ->
                                unit -> relational_database_snapshot
val make_relational_database_hardware :
  ?ram_size_in_gb:float ->
    ?disk_size_in_gb:int ->
      ?cpu_count:int -> unit -> relational_database_hardware
val make_pending_modified_relational_database_values :
  ?backup_retention_enabled:bool ->
    ?engine_version:string ->
      ?master_user_password:string ->
        unit -> pending_modified_relational_database_values
val make_relational_database_endpoint :
  ?address:string -> ?port:int -> unit -> relational_database_endpoint
val make_pending_maintenance_action :
  ?current_apply_date:CoreTypes.Timestamp.t ->
    ?description:string ->
      ?action:string -> unit -> pending_maintenance_action
val make_relational_database :
  ?ca_certificate_identifier:string ->
    ?pending_maintenance_actions:pending_maintenance_action list ->
      ?master_endpoint:relational_database_endpoint ->
        ?publicly_accessible:bool ->
          ?preferred_maintenance_window:string ->
            ?preferred_backup_window:string ->
              ?parameter_apply_status:string ->
                ?master_username:string ->
                  ?latest_restorable_time:CoreTypes.Timestamp.t ->
                    ?engine_version:string ->
                      ?engine:string ->
                        ?pending_modified_values:pending_modified_relational_database_values
                          ->
                          ?backup_retention_enabled:bool ->
                            ?secondary_availability_zone:string ->
                              ?state:string ->
                                ?hardware:relational_database_hardware ->
                                  ?master_database_name:string ->
                                    ?relational_database_bundle_id:string ->
                                      ?relational_database_blueprint_id:string
                                        ->
                                        ?tags:tag list ->
                                          ?resource_type:resource_type ->
                                            ?location:resource_location ->
                                              ?created_at:CoreTypes.Timestamp.t
                                                ->
                                                ?support_code:string ->
                                                  ?arn:string ->
                                                    ?name:string ->
                                                      unit ->
                                                        relational_database
val make_relational_database_event :
  ?event_categories:string list ->
    ?message:string ->
      ?created_at:CoreTypes.Timestamp.t ->
        ?resource:string -> unit -> relational_database_event
val make_relational_database_bundle :
  ?is_active:bool ->
    ?is_encrypted:bool ->
      ?cpu_count:int ->
        ?transfer_per_month_in_gb:int ->
          ?disk_size_in_gb:int ->
            ?ram_size_in_gb:float ->
              ?price:float ->
                ?name:string ->
                  ?bundle_id:string -> unit -> relational_database_bundle
val make_relational_database_blueprint :
  ?is_engine_default:bool ->
    ?engine_version_description:string ->
      ?engine_description:string ->
        ?engine_version:string ->
          ?engine:relational_database_engine ->
            ?blueprint_id:string -> unit -> relational_database_blueprint
val make_name_servers_update_state :
  ?message:string ->
    ?code:name_servers_update_state_code -> unit -> name_servers_update_state
val make_r53_hosted_zone_deletion_state :
  ?message:string ->
    ?code:r53_hosted_zone_deletion_state_code ->
      unit -> r53_hosted_zone_deletion_state
val make_registered_domain_delegation_info :
  ?r53_hosted_zone_deletion_state:r53_hosted_zone_deletion_state ->
    ?name_servers_update_state:name_servers_update_state ->
      unit -> registered_domain_delegation_info
val make_container_image :
  ?created_at:CoreTypes.Timestamp.t ->
    ?digest:string -> ?image:string -> unit -> container_image
val make_register_container_image_request :
  digest:string ->
    label:string ->
      service_name:string -> unit -> register_container_image_request
val make_availability_zone :
  ?state:string -> ?zone_name:string -> unit -> availability_zone
val make_region :
  ?relational_database_availability_zones:availability_zone list ->
    ?availability_zones:availability_zone list ->
      ?name:region_name ->
        ?display_name:string ->
          ?description:string -> ?continent_code:string -> unit -> region
val make_reboot_relational_database_request :
  relational_database_name:string ->
    unit -> reboot_relational_database_request
val make_reboot_instance_request :
  instance_name:string -> unit -> reboot_instance_request
val make_port_info :
  ?cidr_list_aliases:string list ->
    ?ipv6_cidrs:string list ->
      ?cidrs:string list ->
        ?protocol:network_protocol ->
          ?to_port:int -> ?from_port:int -> unit -> port_info
val make_put_instance_public_ports_request :
  instance_name:string ->
    port_infos:port_info list -> unit -> put_instance_public_ports_request
val make_put_alarm_request :
  ?notification_enabled:bool ->
    ?notification_triggers:alarm_state list ->
      ?contact_protocols:contact_protocol list ->
        ?treat_missing_data:treat_missing_data ->
          ?datapoints_to_alarm:int ->
            evaluation_periods:int ->
              threshold:float ->
                comparison_operator:comparison_operator ->
                  monitored_resource_name:string ->
                    metric_name:metric_name ->
                      alarm_name:string -> unit -> put_alarm_request
val make_peer_vpc_request : unit -> peer_vpc_request
val make_password_data :
  ?key_pair_name:string -> ?ciphertext:string -> unit -> password_data
val make_origin :
  ?response_timeout:int ->
    ?protocol_policy:origin_protocol_policy_enum ->
      ?region_name:region_name ->
        ?resource_type:resource_type -> ?name:string -> unit -> origin
val make_open_instance_public_ports_request :
  instance_name:string ->
    port_info:port_info -> unit -> open_instance_public_ports_request
val make_monthly_transfer :
  ?gb_per_month_allocated:int -> unit -> monthly_transfer
val make_monitored_resource_info :
  ?resource_type:resource_type ->
    ?name:string -> ?arn:string -> unit -> monitored_resource_info
val make_metric_datapoint :
  ?unit_:metric_unit ->
    ?timestamp_:CoreTypes.Timestamp.t ->
      ?sum:float ->
        ?sample_count:float ->
          ?minimum:float ->
            ?maximum:float -> ?average:float -> unit -> metric_datapoint
val make_log_event :
  ?message:string -> ?created_at:CoreTypes.Timestamp.t -> unit -> log_event
val make_load_balancer_tls_policy :
  ?ciphers:string list ->
    ?protocols:string list ->
      ?description:string ->
        ?is_default:bool -> ?name:string -> unit -> load_balancer_tls_policy
val make_load_balancer_tls_certificate_summary :
  ?is_attached:bool ->
    ?name:string -> unit -> load_balancer_tls_certificate_summary
val make_load_balancer_tls_certificate_domain_validation_option :
  ?validation_status:load_balancer_tls_certificate_domain_status ->
    ?domain_name:string ->
      unit -> load_balancer_tls_certificate_domain_validation_option
val make_load_balancer_tls_certificate_renewal_summary :
  ?domain_validation_options:load_balancer_tls_certificate_domain_validation_option
    list ->
    ?renewal_status:load_balancer_tls_certificate_renewal_status ->
      unit -> load_balancer_tls_certificate_renewal_summary
val make_load_balancer_tls_certificate_dns_record_creation_state :
  ?message:string ->
    ?code:load_balancer_tls_certificate_dns_record_creation_state_code ->
      unit -> load_balancer_tls_certificate_dns_record_creation_state
val make_load_balancer_tls_certificate_domain_validation_record :
  ?dns_record_creation_state:load_balancer_tls_certificate_dns_record_creation_state
    ->
    ?domain_name:string ->
      ?validation_status:load_balancer_tls_certificate_domain_status ->
        ?value:string ->
          ?type_:string ->
            ?name:string ->
              unit -> load_balancer_tls_certificate_domain_validation_record
val make_load_balancer_tls_certificate :
  ?subject_alternative_names:string list ->
    ?subject:string ->
      ?signature_algorithm:string ->
        ?serial:string ->
          ?revoked_at:CoreTypes.Timestamp.t ->
            ?revocation_reason:load_balancer_tls_certificate_revocation_reason
              ->
              ?renewal_summary:load_balancer_tls_certificate_renewal_summary
                ->
                ?not_before:CoreTypes.Timestamp.t ->
                  ?not_after:CoreTypes.Timestamp.t ->
                    ?key_algorithm:string ->
                      ?issuer:string ->
                        ?issued_at:CoreTypes.Timestamp.t ->
                          ?failure_reason:load_balancer_tls_certificate_failure_reason
                            ->
                            ?domain_validation_records:load_balancer_tls_certificate_domain_validation_record
                              list ->
                              ?domain_name:string ->
                                ?status:load_balancer_tls_certificate_status
                                  ->
                                  ?is_attached:bool ->
                                    ?load_balancer_name:string ->
                                      ?tags:tag list ->
                                        ?resource_type:resource_type ->
                                          ?location:resource_location ->
                                            ?created_at:CoreTypes.Timestamp.t
                                              ->
                                              ?support_code:string ->
                                                ?arn:string ->
                                                  ?name:string ->
                                                    unit ->
                                                      load_balancer_tls_certificate
val make_instance_health_summary :
  ?instance_health_reason:instance_health_reason ->
    ?instance_health:instance_health_state ->
      ?instance_name:string -> unit -> instance_health_summary
val make_load_balancer :
  ?tls_policy_name:string ->
    ?https_redirection_enabled:bool ->
      ?ip_address_type:ip_address_type ->
        ?configuration_options:load_balancer_configuration_options ->
          ?tls_certificate_summaries:load_balancer_tls_certificate_summary
            list ->
            ?instance_health_summary:instance_health_summary list ->
              ?instance_port:int ->
                ?health_check_path:string ->
                  ?public_ports:int list ->
                    ?protocol:load_balancer_protocol ->
                      ?state:load_balancer_state ->
                        ?dns_name:string ->
                          ?tags:tag list ->
                            ?resource_type:resource_type ->
                              ?location:resource_location ->
                                ?created_at:CoreTypes.Timestamp.t ->
                                  ?support_code:string ->
                                    ?arn:string ->
                                      ?name:string -> unit -> load_balancer
val make_is_vpc_peered_request : unit -> is_vpc_peered_request
val make_import_key_pair_request :
  public_key_base64:string ->
    key_pair_name:string -> unit -> import_key_pair_request
val make_get_static_ips_request :
  ?page_token:string -> unit -> get_static_ips_request
val make_get_static_ip_request :
  static_ip_name:string -> unit -> get_static_ip_request
val make_get_setup_history_request :
  ?page_token:string ->
    resource_name:string -> unit -> get_setup_history_request
val make_get_relational_database_snapshots_request :
  ?page_token:string -> unit -> get_relational_database_snapshots_request
val make_get_relational_database_snapshot_request :
  relational_database_snapshot_name:string ->
    unit -> get_relational_database_snapshot_request
val make_get_relational_databases_request :
  ?page_token:string -> unit -> get_relational_databases_request
val make_get_relational_database_parameters_request :
  ?page_token:string ->
    relational_database_name:string ->
      unit -> get_relational_database_parameters_request
val make_get_relational_database_metric_data_request :
  statistics:metric_statistic list ->
    unit_:metric_unit ->
      end_time:CoreTypes.Timestamp.t ->
        start_time:CoreTypes.Timestamp.t ->
          period:int ->
            metric_name:relational_database_metric_name ->
              relational_database_name:string ->
                unit -> get_relational_database_metric_data_request
val make_get_relational_database_master_user_password_request :
  ?password_version:relational_database_password_version ->
    relational_database_name:string ->
      unit -> get_relational_database_master_user_password_request
val make_get_relational_database_log_streams_request :
  relational_database_name:string ->
    unit -> get_relational_database_log_streams_request
val make_get_relational_database_log_events_request :
  ?page_token:string ->
    ?start_from_head:bool ->
      ?end_time:CoreTypes.Timestamp.t ->
        ?start_time:CoreTypes.Timestamp.t ->
          log_stream_name:string ->
            relational_database_name:string ->
              unit -> get_relational_database_log_events_request
val make_get_relational_database_events_request :
  ?page_token:string ->
    ?duration_in_minutes:int ->
      relational_database_name:string ->
        unit -> get_relational_database_events_request
val make_get_relational_database_bundles_request :
  ?include_inactive:bool ->
    ?page_token:string -> unit -> get_relational_database_bundles_request
val make_get_relational_database_blueprints_request :
  ?page_token:string -> unit -> get_relational_database_blueprints_request
val make_get_relational_database_request :
  relational_database_name:string -> unit -> get_relational_database_request
val make_get_regions_request :
  ?include_relational_database_availability_zones:bool ->
    ?include_availability_zones:bool -> unit -> get_regions_request
val make_get_operations_for_resource_request :
  ?page_token:string ->
    resource_name:string -> unit -> get_operations_for_resource_request
val make_get_operations_request :
  ?page_token:string -> unit -> get_operations_request
val make_get_operation_request :
  operation_id:string -> unit -> get_operation_request
val make_get_load_balancer_tls_policies_request :
  ?page_token:string -> unit -> get_load_balancer_tls_policies_request
val make_get_load_balancer_tls_certificates_request :
  load_balancer_name:string ->
    unit -> get_load_balancer_tls_certificates_request
val make_get_load_balancers_request :
  ?page_token:string -> unit -> get_load_balancers_request
val make_get_load_balancer_metric_data_request :
  statistics:metric_statistic list ->
    unit_:metric_unit ->
      end_time:CoreTypes.Timestamp.t ->
        start_time:CoreTypes.Timestamp.t ->
          period:int ->
            metric_name:load_balancer_metric_name ->
              load_balancer_name:string ->
                unit -> get_load_balancer_metric_data_request
val make_get_load_balancer_request :
  load_balancer_name:string -> unit -> get_load_balancer_request
val make_key_pair :
  ?fingerprint:string ->
    ?tags:tag list ->
      ?resource_type:resource_type ->
        ?location:resource_location ->
          ?created_at:CoreTypes.Timestamp.t ->
            ?support_code:string ->
              ?arn:string -> ?name:string -> unit -> key_pair
val make_get_key_pairs_request :
  ?include_default_key_pair:bool ->
    ?page_token:string -> unit -> get_key_pairs_request
val make_get_key_pair_request :
  key_pair_name:string -> unit -> get_key_pair_request
val make_instance_state : ?name:string -> ?code:int -> unit -> instance_state
val make_get_instance_state_request :
  instance_name:string -> unit -> get_instance_state_request
val make_add_on :
  ?duration:string ->
    ?threshold:string ->
      ?next_snapshot_time_of_day:string ->
        ?snapshot_time_of_day:string ->
          ?status:string -> ?name:string -> unit -> add_on
val make_disk :
  ?auto_mount_status:auto_mount_status ->
    ?gb_in_use:int ->
      ?attachment_state:string ->
        ?is_attached:bool ->
          ?attached_to:string ->
            ?state:disk_state ->
              ?path:string ->
                ?iops:int ->
                  ?is_system_disk:bool ->
                    ?size_in_gb:int ->
                      ?add_ons:add_on list ->
                        ?tags:tag list ->
                          ?resource_type:resource_type ->
                            ?location:resource_location ->
                              ?created_at:CoreTypes.Timestamp.t ->
                                ?support_code:string ->
                                  ?arn:string -> ?name:string -> unit -> disk
val make_instance_snapshot :
  ?size_in_gb:int ->
    ?is_from_auto_snapshot:bool ->
      ?from_bundle_id:string ->
        ?from_blueprint_id:string ->
          ?from_instance_arn:string ->
            ?from_instance_name:string ->
              ?from_attached_disks:disk list ->
                ?progress:string ->
                  ?state:instance_snapshot_state ->
                    ?tags:tag list ->
                      ?resource_type:resource_type ->
                        ?location:resource_location ->
                          ?created_at:CoreTypes.Timestamp.t ->
                            ?support_code:string ->
                              ?arn:string ->
                                ?name:string -> unit -> instance_snapshot
val make_get_instance_snapshots_request :
  ?page_token:string -> unit -> get_instance_snapshots_request
val make_get_instance_snapshot_request :
  instance_snapshot_name:string -> unit -> get_instance_snapshot_request
val make_instance_hardware :
  ?ram_size_in_gb:float ->
    ?disks:disk list -> ?cpu_count:int -> unit -> instance_hardware
val make_instance_port_info :
  ?cidr_list_aliases:string list ->
    ?ipv6_cidrs:string list ->
      ?cidrs:string list ->
        ?access_direction:access_direction ->
          ?common_name:string ->
            ?access_type:port_access_type ->
              ?access_from:string ->
                ?protocol:network_protocol ->
                  ?to_port:int ->
                    ?from_port:int -> unit -> instance_port_info
val make_instance_networking :
  ?ports:instance_port_info list ->
    ?monthly_transfer:monthly_transfer -> unit -> instance_networking
val make_instance_metadata_options :
  ?http_protocol_ipv6:http_protocol_ipv6 ->
    ?http_put_response_hop_limit:int ->
      ?http_endpoint:http_endpoint ->
        ?http_tokens:http_tokens ->
          ?state:instance_metadata_state -> unit -> instance_metadata_options
val make_instance :
  ?metadata_options:instance_metadata_options ->
    ?ssh_key_name:string ->
      ?username:string ->
        ?state:instance_state ->
          ?networking:instance_networking ->
            ?hardware:instance_hardware ->
              ?ip_address_type:ip_address_type ->
                ?ipv6_addresses:string list ->
                  ?public_ip_address:string ->
                    ?private_ip_address:string ->
                      ?is_static_ip:bool ->
                        ?add_ons:add_on list ->
                          ?bundle_id:string ->
                            ?blueprint_name:string ->
                              ?blueprint_id:string ->
                                ?tags:tag list ->
                                  ?resource_type:resource_type ->
                                    ?location:resource_location ->
                                      ?created_at:CoreTypes.Timestamp.t ->
                                        ?support_code:string ->
                                          ?arn:string ->
                                            ?name:string -> unit -> instance
val make_get_instances_request :
  ?page_token:string -> unit -> get_instances_request
val make_instance_port_state :
  ?cidr_list_aliases:string list ->
    ?ipv6_cidrs:string list ->
      ?cidrs:string list ->
        ?state:port_state ->
          ?protocol:network_protocol ->
            ?to_port:int -> ?from_port:int -> unit -> instance_port_state
val make_get_instance_port_states_request :
  instance_name:string -> unit -> get_instance_port_states_request
val make_get_instance_metric_data_request :
  statistics:metric_statistic list ->
    unit_:metric_unit ->
      end_time:CoreTypes.Timestamp.t ->
        start_time:CoreTypes.Timestamp.t ->
          period:int ->
            metric_name:instance_metric_name ->
              instance_name:string ->
                unit -> get_instance_metric_data_request
val make_host_key_attributes :
  ?not_valid_after:CoreTypes.Timestamp.t ->
    ?not_valid_before:CoreTypes.Timestamp.t ->
      ?fingerprint_sh_a256:string ->
        ?fingerprint_sh_a1:string ->
          ?witnessed_at:CoreTypes.Timestamp.t ->
            ?public_key:string ->
              ?algorithm:string -> unit -> host_key_attributes
val make_instance_access_details :
  ?host_keys:host_key_attributes list ->
    ?username:string ->
      ?instance_name:string ->
        ?protocol:instance_access_protocol ->
          ?private_key:string ->
            ?password_data:password_data ->
              ?password:string ->
                ?ipv6_addresses:string list ->
                  ?ip_address:string ->
                    ?expires_at:CoreTypes.Timestamp.t ->
                      ?cert_key:string -> unit -> instance_access_details
val make_get_instance_access_details_request :
  ?protocol:instance_access_protocol ->
    instance_name:string -> unit -> get_instance_access_details_request
val make_get_instance_request :
  instance_name:string -> unit -> get_instance_request
val make_disk_info :
  ?is_system_disk:bool ->
    ?size_in_gb:int -> ?path:string -> ?name:string -> unit -> disk_info
val make_instance_snapshot_info :
  ?from_disk_info:disk_info list ->
    ?from_blueprint_id:string ->
      ?from_bundle_id:string -> unit -> instance_snapshot_info
val make_disk_snapshot_info : ?size_in_gb:int -> unit -> disk_snapshot_info
val make_export_snapshot_record_source_info :
  ?disk_snapshot_info:disk_snapshot_info ->
    ?instance_snapshot_info:instance_snapshot_info ->
      ?from_resource_arn:string ->
        ?from_resource_name:string ->
          ?arn:string ->
            ?name:string ->
              ?created_at:CoreTypes.Timestamp.t ->
                ?resource_type:export_snapshot_record_source_type ->
                  unit -> export_snapshot_record_source_info
val make_destination_info :
  ?service:string -> ?id:string -> unit -> destination_info
val make_export_snapshot_record :
  ?destination_info:destination_info ->
    ?source_info:export_snapshot_record_source_info ->
      ?state:record_state ->
        ?resource_type:resource_type ->
          ?location:resource_location ->
            ?created_at:CoreTypes.Timestamp.t ->
              ?arn:string -> ?name:string -> unit -> export_snapshot_record
val make_get_export_snapshot_records_request :
  ?page_token:string -> unit -> get_export_snapshot_records_request
val make_domain :
  ?registered_domain_delegation_info:registered_domain_delegation_info ->
    ?domain_entries:domain_entry list ->
      ?tags:tag list ->
        ?resource_type:resource_type ->
          ?location:resource_location ->
            ?created_at:CoreTypes.Timestamp.t ->
              ?support_code:string ->
                ?arn:string -> ?name:string -> unit -> domain
val make_get_domains_request :
  ?page_token:string -> unit -> get_domains_request
val make_get_domain_request :
  domain_name:string -> unit -> get_domain_request
val make_lightsail_distribution :
  ?viewer_minimum_tls_protocol_version:string ->
    ?tags:tag list ->
      ?ip_address_type:ip_address_type ->
        ?able_to_update_bundle:bool ->
          ?cache_behaviors:cache_behavior_per_path list ->
            ?cache_behavior_settings:cache_settings ->
              ?default_cache_behavior:cache_behavior ->
                ?origin_public_dn_s:string ->
                  ?origin:origin ->
                    ?certificate_name:string ->
                      ?bundle_id:string ->
                        ?domain_name:string ->
                          ?is_enabled:bool ->
                            ?status:string ->
                              ?alternative_domain_names:string list ->
                                ?resource_type:resource_type ->
                                  ?location:resource_location ->
                                    ?created_at:CoreTypes.Timestamp.t ->
                                      ?support_code:string ->
                                        ?arn:string ->
                                          ?name:string ->
                                            unit -> lightsail_distribution
val make_get_distributions_request :
  ?page_token:string ->
    ?distribution_name:string -> unit -> get_distributions_request
val make_get_distribution_metric_data_request :
  statistics:metric_statistic list ->
    unit_:metric_unit ->
      period:int ->
        end_time:CoreTypes.Timestamp.t ->
          start_time:CoreTypes.Timestamp.t ->
            metric_name:distribution_metric_name ->
              distribution_name:string ->
                unit -> get_distribution_metric_data_request
val make_get_distribution_latest_cache_reset_request :
  ?distribution_name:string ->
    unit -> get_distribution_latest_cache_reset_request
val make_distribution_bundle :
  ?is_active:bool ->
    ?transfer_per_month_in_gb:int ->
      ?price:float ->
        ?name:string -> ?bundle_id:string -> unit -> distribution_bundle
val make_get_distribution_bundles_request :
  unit -> get_distribution_bundles_request
val make_disk_snapshot :
  ?is_from_auto_snapshot:bool ->
    ?from_instance_arn:string ->
      ?from_instance_name:string ->
        ?from_disk_arn:string ->
          ?from_disk_name:string ->
            ?progress:string ->
              ?state:disk_snapshot_state ->
                ?size_in_gb:int ->
                  ?tags:tag list ->
                    ?resource_type:resource_type ->
                      ?location:resource_location ->
                        ?created_at:CoreTypes.Timestamp.t ->
                          ?support_code:string ->
                            ?arn:string ->
                              ?name:string -> unit -> disk_snapshot
val make_get_disk_snapshots_request :
  ?page_token:string -> unit -> get_disk_snapshots_request
val make_get_disk_snapshot_request :
  disk_snapshot_name:string -> unit -> get_disk_snapshot_request
val make_get_disks_request : ?page_token:string -> unit -> get_disks_request
val make_get_disk_request : disk_name:string -> unit -> get_disk_request
val make_get_cost_estimate_request :
  end_time:CoreTypes.Timestamp.t ->
    start_time:CoreTypes.Timestamp.t ->
      resource_name:string -> unit -> get_cost_estimate_request
val make_get_container_services_request :
  ?service_name:string -> unit -> get_container_services_request
val make_container_service_power :
  ?is_active:bool ->
    ?name:string ->
      ?ram_size_in_gb:float ->
        ?cpu_count:float ->
          ?price:float -> ?power_id:string -> unit -> container_service_power
val make_get_container_service_powers_request :
  unit -> get_container_service_powers_request
val make_get_container_service_metric_data_request :
  statistics:metric_statistic list ->
    period:int ->
      end_time:CoreTypes.Timestamp.t ->
        start_time:CoreTypes.Timestamp.t ->
          metric_name:container_service_metric_name ->
            service_name:string ->
              unit -> get_container_service_metric_data_request
val make_get_container_service_deployments_request :
  service_name:string -> unit -> get_container_service_deployments_request
val make_container_service_log_event :
  ?message:string ->
    ?created_at:CoreTypes.Timestamp.t -> unit -> container_service_log_event
val make_get_container_log_request :
  ?page_token:string ->
    ?filter_pattern:string ->
      ?end_time:CoreTypes.Timestamp.t ->
        ?start_time:CoreTypes.Timestamp.t ->
          container_name:string ->
            service_name:string -> unit -> get_container_log_request
val make_get_container_images_request :
  service_name:string -> unit -> get_container_images_request
val make_get_container_api_metadata_request :
  unit -> get_container_api_metadata_request
val make_contact_method :
  ?support_code:string ->
    ?resource_type:resource_type ->
      ?location:resource_location ->
        ?created_at:CoreTypes.Timestamp.t ->
          ?arn:string ->
            ?name:string ->
              ?protocol:contact_protocol ->
                ?status:contact_method_status ->
                  ?contact_endpoint:string -> unit -> contact_method
val make_get_contact_methods_request :
  ?protocols:contact_protocol list -> unit -> get_contact_methods_request
val make_cloud_formation_stack_record_source_info :
  ?arn:string ->
    ?name:string ->
      ?resource_type:cloud_formation_stack_record_source_type ->
        unit -> cloud_formation_stack_record_source_info
val make_cloud_formation_stack_record :
  ?destination_info:destination_info ->
    ?source_info:cloud_formation_stack_record_source_info list ->
      ?state:record_state ->
        ?resource_type:resource_type ->
          ?location:resource_location ->
            ?created_at:CoreTypes.Timestamp.t ->
              ?arn:string ->
                ?name:string -> unit -> cloud_formation_stack_record
val make_get_cloud_formation_stack_records_request :
  ?page_token:string -> unit -> get_cloud_formation_stack_records_request
val make_certificate :
  ?support_code:string ->
    ?tags:tag list ->
      ?revocation_reason:string ->
        ?revoked_at:CoreTypes.Timestamp.t ->
          ?renewal_summary:renewal_summary ->
            ?eligible_to_renew:string ->
              ?not_after:CoreTypes.Timestamp.t ->
                ?not_before:CoreTypes.Timestamp.t ->
                  ?issuer_c_a:string ->
                    ?issued_at:CoreTypes.Timestamp.t ->
                      ?created_at:CoreTypes.Timestamp.t ->
                        ?key_algorithm:string ->
                          ?in_use_resource_count:int ->
                            ?request_failure_reason:string ->
                              ?domain_validation_records:domain_validation_record
                                list ->
                                ?subject_alternative_names:string list ->
                                  ?serial_number:string ->
                                    ?status:certificate_status ->
                                      ?domain_name:string ->
                                        ?name:string ->
                                          ?arn:string -> unit -> certificate
val make_certificate_summary :
  ?tags:tag list ->
    ?certificate_detail:certificate ->
      ?domain_name:string ->
        ?certificate_name:string ->
          ?certificate_arn:string -> unit -> certificate_summary
val make_get_certificates_request :
  ?page_token:string ->
    ?certificate_name:string ->
      ?include_certificate_details:bool ->
        ?certificate_statuses:certificate_status list ->
          unit -> get_certificates_request
val make_bundle :
  ?public_ipv4_address_count:int ->
    ?supported_app_categories:app_category list ->
      ?supported_platforms:instance_platform list ->
        ?transfer_per_month_in_gb:int ->
          ?ram_size_in_gb:float ->
            ?power:int ->
              ?name:string ->
                ?is_active:bool ->
                  ?instance_type:string ->
                    ?bundle_id:string ->
                      ?disk_size_in_gb:int ->
                        ?cpu_count:int -> ?price:float -> unit -> bundle
val make_get_bundles_request :
  ?app_category:app_category ->
    ?page_token:string ->
      ?include_inactive:bool -> unit -> get_bundles_request
val make_account_level_bpa_sync :
  ?bpa_impacts_lightsail:bool ->
    ?message:bpa_status_message ->
      ?last_synced_at:CoreTypes.Timestamp.t ->
        ?status:account_level_bpa_sync_status ->
          unit -> account_level_bpa_sync
val make_get_buckets_request :
  ?include_connected_resources:bool ->
    ?page_token:string -> ?bucket_name:string -> unit -> get_buckets_request
val make_get_bucket_metric_data_request :
  unit_:metric_unit ->
    statistics:metric_statistic list ->
      period:int ->
        end_time:CoreTypes.Timestamp.t ->
          start_time:CoreTypes.Timestamp.t ->
            metric_name:bucket_metric_name ->
              bucket_name:string -> unit -> get_bucket_metric_data_request
val make_bucket_bundle :
  ?is_active:bool ->
    ?transfer_per_month_in_gb:int ->
      ?storage_per_month_in_gb:int ->
        ?price:float ->
          ?name:string -> ?bundle_id:string -> unit -> bucket_bundle
val make_get_bucket_bundles_request :
  ?include_inactive:bool -> unit -> get_bucket_bundles_request
val make_access_key_last_used :
  ?service_name:string ->
    ?region:string ->
      ?last_used_date:CoreTypes.Timestamp.t -> unit -> access_key_last_used
val make_access_key :
  ?last_used:access_key_last_used ->
    ?created_at:CoreTypes.Timestamp.t ->
      ?status:status_type ->
        ?secret_access_key:string ->
          ?access_key_id:string -> unit -> access_key
val make_get_bucket_access_keys_request :
  bucket_name:string -> unit -> get_bucket_access_keys_request
val make_blueprint :
  ?app_category:app_category ->
    ?platform:instance_platform ->
      ?license_url:string ->
        ?product_url:string ->
          ?version_code:string ->
            ?version:string ->
              ?min_power:int ->
                ?is_active:bool ->
                  ?description:string ->
                    ?type_:blueprint_type ->
                      ?group:string ->
                        ?name:string ->
                          ?blueprint_id:string -> unit -> blueprint
val make_get_blueprints_request :
  ?app_category:app_category ->
    ?page_token:string ->
      ?include_inactive:bool -> unit -> get_blueprints_request
val make_attached_disk :
  ?size_in_gb:int -> ?path:string -> unit -> attached_disk
val make_auto_snapshot_details :
  ?from_attached_disks:attached_disk list ->
    ?status:auto_snapshot_status ->
      ?created_at:CoreTypes.Timestamp.t ->
        ?date:string -> unit -> auto_snapshot_details
val make_get_auto_snapshots_request :
  resource_name:string -> unit -> get_auto_snapshots_request
val make_alarm :
  ?notification_enabled:bool ->
    ?notification_triggers:alarm_state list ->
      ?contact_protocols:contact_protocol list ->
        ?unit_:metric_unit ->
          ?state:alarm_state ->
            ?metric_name:metric_name ->
              ?statistic:metric_statistic ->
                ?treat_missing_data:treat_missing_data ->
                  ?datapoints_to_alarm:int ->
                    ?threshold:float ->
                      ?period:int ->
                        ?evaluation_periods:int ->
                          ?comparison_operator:comparison_operator ->
                            ?monitored_resource_info:monitored_resource_info
                              ->
                              ?support_code:string ->
                                ?resource_type:resource_type ->
                                  ?location:resource_location ->
                                    ?created_at:CoreTypes.Timestamp.t ->
                                      ?arn:string ->
                                        ?name:string -> unit -> alarm
val make_get_alarms_request :
  ?monitored_resource_name:string ->
    ?page_token:string -> ?alarm_name:string -> unit -> get_alarms_request
val make_get_active_names_request :
  ?page_token:string -> unit -> get_active_names_request
val make_export_snapshot_request :
  source_snapshot_name:string -> unit -> export_snapshot_request
val make_auto_snapshot_add_on_request :
  ?snapshot_time_of_day:string -> unit -> auto_snapshot_add_on_request
val make_add_on_request :
  ?stop_instance_on_idle_request:stop_instance_on_idle_request ->
    ?auto_snapshot_add_on_request:auto_snapshot_add_on_request ->
      add_on_type:add_on_type -> unit -> add_on_request
val make_enable_add_on_request :
  add_on_request:add_on_request ->
    resource_name:string -> unit -> enable_add_on_request
val make_download_default_key_pair_request :
  unit -> download_default_key_pair_request
val make_disable_add_on_request :
  resource_name:string ->
    add_on_type:add_on_type -> unit -> disable_add_on_request
val make_detach_static_ip_request :
  static_ip_name:string -> unit -> detach_static_ip_request
val make_detach_instances_from_load_balancer_request :
  instance_names:string list ->
    load_balancer_name:string ->
      unit -> detach_instances_from_load_balancer_request
val make_detach_disk_request :
  disk_name:string -> unit -> detach_disk_request
val make_detach_certificate_from_distribution_request :
  distribution_name:string ->
    unit -> detach_certificate_from_distribution_request
val make_delete_relational_database_snapshot_request :
  relational_database_snapshot_name:string ->
    unit -> delete_relational_database_snapshot_request
val make_delete_relational_database_request :
  ?final_relational_database_snapshot_name:string ->
    ?skip_final_snapshot:bool ->
      relational_database_name:string ->
        unit -> delete_relational_database_request
val make_delete_load_balancer_tls_certificate_request :
  ?force:bool ->
    certificate_name:string ->
      load_balancer_name:string ->
        unit -> delete_load_balancer_tls_certificate_request
val make_delete_load_balancer_request :
  load_balancer_name:string -> unit -> delete_load_balancer_request
val make_delete_known_host_keys_request :
  instance_name:string -> unit -> delete_known_host_keys_request
val make_delete_key_pair_request :
  ?expected_fingerprint:string ->
    key_pair_name:string -> unit -> delete_key_pair_request
val make_delete_instance_snapshot_request :
  instance_snapshot_name:string -> unit -> delete_instance_snapshot_request
val make_delete_instance_request :
  ?force_delete_add_ons:bool ->
    instance_name:string -> unit -> delete_instance_request
val make_delete_domain_entry_request :
  domain_entry:domain_entry ->
    domain_name:string -> unit -> delete_domain_entry_request
val make_delete_domain_request :
  domain_name:string -> unit -> delete_domain_request
val make_delete_distribution_request :
  ?distribution_name:string -> unit -> delete_distribution_request
val make_delete_disk_snapshot_request :
  disk_snapshot_name:string -> unit -> delete_disk_snapshot_request
val make_delete_disk_request :
  ?force_delete_add_ons:bool ->
    disk_name:string -> unit -> delete_disk_request
val make_delete_container_service_request :
  service_name:string -> unit -> delete_container_service_request
val make_delete_container_image_request :
  image:string ->
    service_name:string -> unit -> delete_container_image_request
val make_delete_contact_method_request :
  protocol:contact_protocol -> unit -> delete_contact_method_request
val make_delete_certificate_request :
  certificate_name:string -> unit -> delete_certificate_request
val make_delete_bucket_access_key_request :
  access_key_id:string ->
    bucket_name:string -> unit -> delete_bucket_access_key_request
val make_delete_bucket_request :
  ?force_delete:bool -> bucket_name:string -> unit -> delete_bucket_request
val make_delete_auto_snapshot_request :
  date:string -> resource_name:string -> unit -> delete_auto_snapshot_request
val make_delete_alarm_request :
  alarm_name:string -> unit -> delete_alarm_request
val make_create_relational_database_snapshot_request :
  ?tags:tag list ->
    relational_database_snapshot_name:string ->
      relational_database_name:string ->
        unit -> create_relational_database_snapshot_request
val make_create_relational_database_from_snapshot_request :
  ?tags:tag list ->
    ?use_latest_restorable_time:bool ->
      ?restore_time:CoreTypes.Timestamp.t ->
        ?source_relational_database_name:string ->
          ?relational_database_bundle_id:string ->
            ?relational_database_snapshot_name:string ->
              ?publicly_accessible:bool ->
                ?availability_zone:string ->
                  relational_database_name:string ->
                    unit -> create_relational_database_from_snapshot_request
val make_create_relational_database_request :
  ?tags:tag list ->
    ?publicly_accessible:bool ->
      ?preferred_maintenance_window:string ->
        ?preferred_backup_window:string ->
          ?master_user_password:string ->
            ?availability_zone:string ->
              master_username:string ->
                master_database_name:string ->
                  relational_database_bundle_id:string ->
                    relational_database_blueprint_id:string ->
                      relational_database_name:string ->
                        unit -> create_relational_database_request
val make_create_load_balancer_tls_certificate_request :
  ?tags:tag list ->
    ?certificate_alternative_names:string list ->
      certificate_domain_name:string ->
        certificate_name:string ->
          load_balancer_name:string ->
            unit -> create_load_balancer_tls_certificate_request
val make_create_load_balancer_request :
  ?tls_policy_name:string ->
    ?ip_address_type:ip_address_type ->
      ?tags:tag list ->
        ?certificate_alternative_names:string list ->
          ?certificate_domain_name:string ->
            ?certificate_name:string ->
              ?health_check_path:string ->
                instance_port:int ->
                  load_balancer_name:string ->
                    unit -> create_load_balancer_request
val make_create_key_pair_request :
  ?tags:tag list -> key_pair_name:string -> unit -> create_key_pair_request
val make_create_instance_snapshot_request :
  ?tags:tag list ->
    instance_name:string ->
      instance_snapshot_name:string ->
        unit -> create_instance_snapshot_request
val make_disk_map :
  ?new_disk_name:string -> ?original_disk_path:string -> unit -> disk_map
val make_create_instances_from_snapshot_request :
  ?use_latest_restorable_auto_snapshot:bool ->
    ?restore_date:string ->
      ?source_instance_name:string ->
        ?ip_address_type:ip_address_type ->
          ?add_ons:add_on_request list ->
            ?tags:tag list ->
              ?key_pair_name:string ->
                ?user_data:string ->
                  ?instance_snapshot_name:string ->
                    ?attached_disk_mapping:attached_disk_map ->
                      bundle_id:string ->
                        availability_zone:string ->
                          instance_names:string list ->
                            unit -> create_instances_from_snapshot_request
val make_create_instances_request :
  ?ip_address_type:ip_address_type ->
    ?add_ons:add_on_request list ->
      ?tags:tag list ->
        ?key_pair_name:string ->
          ?user_data:string ->
            ?custom_image_name:string ->
              bundle_id:string ->
                blueprint_id:string ->
                  availability_zone:string ->
                    instance_names:string list ->
                      unit -> create_instances_request
val make_create_gui_session_access_details_request :
  resource_name:string -> unit -> create_gui_session_access_details_request
val make_create_domain_entry_request :
  domain_entry:domain_entry ->
    domain_name:string -> unit -> create_domain_entry_request
val make_create_domain_request :
  ?tags:tag list -> domain_name:string -> unit -> create_domain_request
val make_create_distribution_request :
  ?viewer_minimum_tls_protocol_version:viewer_minimum_tls_protocol_version_enum
    ->
    ?certificate_name:string ->
      ?tags:tag list ->
        ?ip_address_type:ip_address_type ->
          ?cache_behaviors:cache_behavior_per_path list ->
            ?cache_behavior_settings:cache_settings ->
              bundle_id:string ->
                default_cache_behavior:cache_behavior ->
                  origin:input_origin ->
                    distribution_name:string ->
                      unit -> create_distribution_request
val make_create_disk_snapshot_request :
  ?tags:tag list ->
    ?instance_name:string ->
      ?disk_name:string ->
        disk_snapshot_name:string -> unit -> create_disk_snapshot_request
val make_create_disk_from_snapshot_request :
  ?use_latest_restorable_auto_snapshot:bool ->
    ?restore_date:string ->
      ?source_disk_name:string ->
        ?add_ons:add_on_request list ->
          ?tags:tag list ->
            ?disk_snapshot_name:string ->
              size_in_gb:int ->
                availability_zone:string ->
                  disk_name:string ->
                    unit -> create_disk_from_snapshot_request
val make_create_disk_request :
  ?add_ons:add_on_request list ->
    ?tags:tag list ->
      size_in_gb:int ->
        availability_zone:string ->
          disk_name:string -> unit -> create_disk_request
val make_container_service_registry_login :
  ?registry:string ->
    ?expires_at:CoreTypes.Timestamp.t ->
      ?password:string ->
        ?username:string -> unit -> container_service_registry_login
val make_create_container_service_registry_login_request :
  unit -> create_container_service_registry_login_request
val make_endpoint_request :
  ?health_check:container_service_health_check_config ->
    container_port:int -> container_name:string -> unit -> endpoint_request
val make_create_container_service_deployment_request :
  ?public_endpoint:endpoint_request ->
    ?containers:container_map ->
      service_name:string ->
        unit -> create_container_service_deployment_request
val make_container_service_deployment_request :
  ?public_endpoint:endpoint_request ->
    ?containers:container_map -> unit -> container_service_deployment_request
val make_create_container_service_request :
  ?private_registry_access:private_registry_access_request ->
    ?deployment:container_service_deployment_request ->
      ?public_domain_names:container_service_public_domains ->
        ?tags:tag list ->
          scale:int ->
            power:container_service_power_name ->
              service_name:string -> unit -> create_container_service_request
val make_create_contact_method_request :
  contact_endpoint:string ->
    protocol:contact_protocol -> unit -> create_contact_method_request
val make_instance_entry :
  ?user_data:string ->
    availability_zone:string ->
      port_info_source:port_info_source_type ->
        instance_type:string -> source_name:string -> unit -> instance_entry
val make_create_cloud_formation_stack_request :
  instances:instance_entry list ->
    unit -> create_cloud_formation_stack_request
val make_create_certificate_request :
  ?tags:tag list ->
    ?subject_alternative_names:string list ->
      domain_name:string ->
        certificate_name:string -> unit -> create_certificate_request
val make_create_bucket_access_key_request :
  bucket_name:string -> unit -> create_bucket_access_key_request
val make_create_bucket_request :
  ?enable_object_versioning:bool ->
    ?tags:tag list ->
      bundle_id:string -> bucket_name:string -> unit -> create_bucket_request
val make_copy_snapshot_request :
  ?use_latest_restorable_auto_snapshot:bool ->
    ?restore_date:string ->
      ?source_resource_name:string ->
        ?source_snapshot_name:string ->
          source_region:region_name ->
            target_snapshot_name:string -> unit -> copy_snapshot_request
val make_close_instance_public_ports_request :
  instance_name:string ->
    port_info:port_info -> unit -> close_instance_public_ports_request
val make_attach_static_ip_request :
  instance_name:string ->
    static_ip_name:string -> unit -> attach_static_ip_request
val make_attach_load_balancer_tls_certificate_request :
  certificate_name:string ->
    load_balancer_name:string ->
      unit -> attach_load_balancer_tls_certificate_request
val make_attach_instances_to_load_balancer_request :
  instance_names:string list ->
    load_balancer_name:string ->
      unit -> attach_instances_to_load_balancer_request
val make_attach_disk_request :
  ?auto_mounting:bool ->
    disk_path:string ->
      instance_name:string -> disk_name:string -> unit -> attach_disk_request
val make_attach_certificate_to_distribution_request :
  certificate_name:string ->
    distribution_name:string ->
      unit -> attach_certificate_to_distribution_request
val make_allocate_static_ip_request :
  static_ip_name:string -> unit -> allocate_static_ip_request(** {1:operations Operations} *)

module AllocateStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      allocate_static_ip_request ->
        (allocate_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Allocates a static IP address.
     *)

  
end

module AttachCertificateToDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_certificate_to_distribution_request ->
        (attach_certificate_to_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches an SSL/TLS certificate to your Amazon Lightsail content delivery network (CDN) distribution.
    
     After the certificate is attached, your distribution accepts HTTPS traffic for all of the domains that are associated with the certificate.
     
      Use the [CreateCertificate] action to create a certificate that you can attach to your distribution.
      
       Only certificates created in the [us-east-1] Amazon Web Services Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any Amazon Web Services Region, and distribute its content globally. However, all distributions are located in the [us-east-1] Region.
       
        *)

  
end

module AttachDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_disk_request ->
        (attach_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the instance with the specified disk name.
    
     The [attach disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module AttachInstancesToLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_instances_to_load_balancer_request ->
        (attach_instances_to_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches one or more Lightsail instances to a load balancer.
    
     After some time, the instances are attached to the load balancer and the health check status is available.
     
      The [attach instances to load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Lightsail Developer Guide}.
       *)

  
end

module AttachLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_load_balancer_tls_certificate_request ->
        (attach_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL).
    
     Once you create and validate your certificate, you can attach it to your load balancer. You can also use this API to rotate the certificates on your account. Use the [AttachLoadBalancerTlsCertificate] action with the non-attached certificate, and it will replace the existing one and become the attached certificate.
     
      The [AttachLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module AttachStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      attach_static_ip_request ->
        (attach_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Attaches a static IP address to a specific Amazon Lightsail instance.
     *)

  
end

module CloseInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      close_instance_public_ports_request ->
        (close_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Closes ports for a specific Amazon Lightsail instance.
    
     The [CloseInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CopySnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      copy_snapshot_request ->
        (copy_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a manual or automatic snapshot of an instance or a disk from one Amazon Web Services Region to another in Amazon Lightsail.
    
     When copying a {i manual snapshot}, be sure to define the [source
        region], [source snapshot name], and [target snapshot name] parameters.
     
      When copying an {i automatic snapshot}, be sure to define the [source region], [source resource name], [target snapshot
        name], and either the [restore date] or the [use latest restorable
        auto snapshot] parameters.
       *)

  
end

module CreateBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_request ->
        (create_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an Amazon Lightsail bucket.
    
     A bucket is a cloud storage resource available in the Lightsail object storage service. Use buckets to store objects such as data and its descriptive metadata. For more information about buckets, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail}Buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateBucketAccessKey : sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_access_key_request ->
        (create_bucket_access_key_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a new access key for the specified Amazon Lightsail bucket. Access keys consist of an access key ID and corresponding secret access key.
    
     Access keys grant full programmatic access to the specified bucket and its objects. You can have a maximum of two access keys per bucket. Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketAccessKeys.html}GetBucketAccessKeys} action to get a list of current access keys for a specific bucket. For more information about access keys, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
     
      The [secretAccessKey] value is returned only in response to the [CreateBucketAccessKey] action. You can get a secret access key only when you first create an access key; you cannot get the secret access key later. If you lose the secret access key, you must create a new access key.
      
       *)

  
end

module CreateCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_certificate_request ->
        (create_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an SSL/TLS certificate for an Amazon Lightsail content delivery network (CDN) distribution and a container service.
    
     After the certificate is valid, use the [AttachCertificateToDistribution] action to use the certificate and its domains with your distribution. Or use the [UpdateContainerService] action to use the certificate and its domains with your container service.
     
      Only certificates created in the [us-east-1] Amazon Web Services Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any Amazon Web Services Region, and distribute its content globally. However, all distributions are located in the [us-east-1] Region.
      
       *)

  
end

module CreateCloudFormationStack : sig
  val request :
    Smaws_Lib.Context.t ->
      create_cloud_formation_stack_request ->
        (create_cloud_formation_stack_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to track the AWS CloudFormation stack created. Use the [get cloud formation stack
        records] operation to get a list of the CloudFormation stacks created.
    
     Wait until after your new Amazon EC2 instance is created before running the [create
          cloud formation stack] operation again with the same export snapshot record.
     
      *)

  
end

module CreateContactMethod : sig
  val request :
    Smaws_Lib.Context.t ->
      create_contact_method_request ->
        (create_contact_method_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an email or SMS text message contact method.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
      *)

  
end

module CreateContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_request ->
        (create_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an Amazon Lightsail container service.
    
     A Lightsail container service is a compute resource to which you can deploy containers. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-services}Container services in Amazon Lightsail} in the {i Lightsail Dev Guide}.
      *)

  
end

module CreateContainerServiceDeployment : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_deployment_request ->
        (create_container_service_deployment_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a deployment for your Amazon Lightsail container service.
    
     A deployment specifies the containers that will be launched on the container service and their settings, such as the ports to open, the environment variables to apply, and the launch command to run. It also specifies the container that will serve as the public endpoint of the deployment and its settings, such as the HTTP or HTTPS port to use, and the health check configuration.
     
      You can deploy containers to your container service using container images from a public registry such as Amazon ECR Public, or from your local machine. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-images}Creating container images for your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateContainerServiceRegistryLogin : sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_registry_login_request ->
        (create_container_service_registry_login_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a temporary set of log in credentials that you can use to log in to the Docker process on your local machine. After you're logged in, you can use the native Docker commands to push your local container images to the container image registry of your Amazon Lightsail account so that you can use them with your Lightsail container service. The log in credentials expire 12 hours after they are created, at which point you will need to create a new set of log in credentials.
    
     You can only push container images to the container service registry of your Lightsail account. You cannot pull container images or perform any other container image management actions on the container service registry.
     
      After you push your container images to the container image registry of your Lightsail account, use the [RegisterContainerImage] action to register the pushed images to a specific Lightsail container service.
      
       This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images}Pushing and managing container images on your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.
       
        *)

  
end

module CreateDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_request ->
        (create_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same Availability Zone ([us-east-2a]).
    
     The [create disk] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateDiskFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_from_snapshot_request ->
        (create_disk_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can be attached to an Amazon Lightsail instance in the same Availability Zone ([us-east-2a]).
    
     The [create disk from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [disk snapshot
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_snapshot_request ->
        (create_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance.
    
     You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending.
     
      You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the [instance name] parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk.
      
       The [create disk snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
        *)

  
end

module CreateDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      create_distribution_request ->
        (create_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an Amazon Lightsail content delivery network (CDN) distribution.
    
     A distribution is a globally distributed network of caching servers that improve the performance of your website or web application hosted on a Lightsail instance. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-content-delivery-network-distributions}Content delivery networks in Amazon Lightsail}.
      *)

  
end

module CreateDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_request ->
        (create_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a domain resource for the specified domain (example.com).
    
     The [create domain] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_entry_request ->
        (create_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates one of the following domain name system (DNS) records in a domain DNS zone: Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).
    
     The [create domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateGUISessionAccessDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      create_gui_session_access_details_request ->
        (create_gui_session_access_details_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates two URLs that are used to access a virtual computer’s graphical user interface (GUI) session. The primary URL initiates a web-based NICE DCV session to the virtual computer's application. The secondary URL initiates a web-based NICE DCV session to the virtual computer's operating session.
    
     Use [StartGUISession] to open the session.
      *)

  
end

module CreateInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_request ->
        (create_instances_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates one or more Amazon Lightsail instances.
    
     The [create instances] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Lightsail Developer Guide}.
      *)

  
end

module CreateInstancesFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_from_snapshot_request ->
        (create_instances_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates one or more new instances from a manual or automatic snapshot of an instance.
    
     The [create instances from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [instance snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_instance_snapshot_request ->
        (create_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of a specific virtual private server, or {i instance}. You can use a snapshot to create a new instance that is based on that snapshot.
    
     The [create instance snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      create_key_pair_request ->
        (create_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a custom SSH key pair that you can use with an Amazon Lightsail instance.
    
     Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html}DownloadDefaultKeyPair} action to create a Lightsail default key pair in an Amazon Web Services Region where a default key pair does not currently exist.
     
      The [create key pair] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_request ->
        (create_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a Lightsail load balancer. To learn more about deciding whether to load balance your application, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/configure-lightsail-instances-for-load-balancing}Configure your Lightsail instances for load balancing}. You can create up to 5 load balancers per AWS Region in your account.
    
     When you create a load balancer, you can specify a unique name and port settings. To change additional load balancer settings, use the [UpdateLoadBalancerAttribute] operation.
     
      The [create load balancer] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_tls_certificate_request ->
        (create_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an SSL/TLS certificate for an Amazon Lightsail load balancer.
    
     TLS is just an updated, more secure version of Secure Socket Layer (SSL).
     
      The [CreateLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_request ->
        (create_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a new database in Amazon Lightsail.
    
     The [create relational database] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module CreateRelationalDatabaseFromSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_from_snapshot_request ->
        (create_relational_database_from_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a new database from an existing database snapshot in Amazon Lightsail.
    
     You can create a new database from a snapshot in if something goes wrong with your original database, or to change it to a different plan, such as a high availability or standard plan.
     
      The [create relational database from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by relationalDatabaseSnapshotName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module CreateRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_snapshot_request ->
        (create_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make copies of a database, and to save data before deleting a database.
    
     The [create relational database snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alarm_request ->
        (delete_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an alarm.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
      *)

  
end

module DeleteAutoSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_auto_snapshot_request ->
        (delete_auto_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an automatic snapshot of an instance or disk. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module DeleteBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_request ->
        (delete_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a Amazon Lightsail bucket.
    
     When you delete your bucket, the bucket name is released and can be reused for a new bucket in your account or another Amazon Web Services account.
     
      *)

  
end

module DeleteBucketAccessKey : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_access_key_request ->
        (delete_bucket_access_key_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an access key for the specified Amazon Lightsail bucket.
    
     We recommend that you delete an access key if the secret access key is compromised.
     
      For more information about access keys, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (delete_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an SSL/TLS certificate for your Amazon Lightsail content delivery network (CDN) distribution.
    
     Certificates that are currently attached to a distribution cannot be deleted. Use the [DetachCertificateFromDistribution] action to detach a certificate from a distribution.
      *)

  
end

module DeleteContactMethod : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_contact_method_request ->
        (delete_contact_method_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a contact method.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
      *)

  
end

module DeleteContainerImage : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_image_request ->
        (delete_container_image_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a container image that is registered to your Amazon Lightsail container service.
     *)

  
end

module DeleteContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_service_request ->
        (delete_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes your Amazon Lightsail container service.
     *)

  
end

module DeleteDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_request ->
        (delete_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified block storage disk. The disk must be in the [available] state (not attached to a Lightsail instance).
    
     The disk may remain in the [deleting] state for several minutes.
     
      The [delete disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_snapshot_request ->
        (delete_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified disk snapshot.
    
     When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk.
     
      The [delete disk snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [disk snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_distribution_request ->
        (delete_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes your Amazon Lightsail content delivery network (CDN) distribution.
     *)

  
end

module DeleteDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_request ->
        (delete_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified domain recordset and all of its domain records.
    
     The [delete domain] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_entry_request ->
        (delete_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a specific domain entry.
    
     The [delete domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_request ->
        (delete_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an Amazon Lightsail instance.
    
     The [delete instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_snapshot_request ->
        (delete_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a specific snapshot of a virtual private server (or {i instance}).
    
     The [delete instance snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [instance snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_key_pair_request ->
        (delete_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified key pair by removing the public key from Amazon Lightsail.
    
     You can delete key pairs that were created using the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_ImportKeyPair.html}ImportKeyPair} and {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateKeyPair.html}CreateKeyPair} actions, as well as the Lightsail default key pair. A new default key pair will not be created unless you launch an instance without specifying a custom key pair, or you call the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html}DownloadDefaultKeyPair} API.
     
      The [delete key pair] operation supports tag-based access control via resource tags applied to the resource identified by [key pair name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DeleteKnownHostKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_known_host_keys_request ->
        (delete_known_host_keys_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP clients to connect to the instance after a host key mismatch.
    
     Perform this operation only if you were expecting the host key or certificate mismatch or if you are familiar with the new host key or certificate on the instance. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection}Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client}.
     
      *)

  
end

module DeleteLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_request ->
        (delete_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again.
    
     The [delete load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteLoadBalancerTlsCertificate : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_tls_certificate_request ->
        (delete_load_balancer_tls_certificate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes an SSL/TLS certificate associated with a Lightsail load balancer.
    
     The [DeleteLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_request ->
        (delete_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a database in Amazon Lightsail.
    
     The [delete relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DeleteRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_snapshot_request ->
        (delete_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a database snapshot in Amazon Lightsail.
    
     The [delete relational database snapshot] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DetachCertificateFromDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_certificate_from_distribution_request ->
        (detach_certificate_from_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches an SSL/TLS certificate from your Amazon Lightsail content delivery network (CDN) distribution.
    
     After the certificate is detached, your distribution stops accepting traffic for all of the domains that are associated with the certificate.
      *)

  
end

module DetachDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_disk_request ->
        (detach_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file systems on the device within your operating system before stopping the instance and detaching the disk.
    
     The [detach disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module DetachInstancesFromLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_instances_from_load_balancer_request ->
        (detach_instances_from_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches the specified instances from a Lightsail load balancer.
    
     This operation waits until the instances are no longer needed before they are detached from the load balancer.
     
      The [detach instances from load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module DetachStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      detach_static_ip_request ->
        (detach_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Detaches a static IP from the Amazon Lightsail instance to which it is attached.
     *)

  
end

module DisableAddOn : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_add_on_request ->
        (disable_add_on_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Disables an add-on for an Amazon Lightsail resource. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module DownloadDefaultKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      download_default_key_pair_request ->
        (download_default_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Downloads the regional Amazon Lightsail default key pair.
    
     This action also creates a Lightsail default key pair if a default key pair does not currently exist in the Amazon Web Services Region.
      *)

  
end

module EnableAddOn : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_add_on_request ->
        (enable_add_on_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module ExportSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      export_snapshot_request ->
        (export_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an export snapshot record that can be used with the [create
        cloud formation stack] operation to create new Amazon EC2 instances.
    
     Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the source Lightsail snapshot.
     
      
      
       The [export snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [source snapshot name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       
        Use the [get instance snapshots] or [get disk snapshots] operations to get a list of snapshots that you can export to Amazon EC2.
        
         *)

  
end

module GetActiveNames : sig
  val request :
    Smaws_Lib.Context.t ->
      get_active_names_request ->
        (get_active_names_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the names of all active (not deleted) resources.
     *)

  
end

module GetAlarms : sig
  val request :
    Smaws_Lib.Context.t ->
      get_alarms_request ->
        (get_alarms_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the configured alarms. Specify an alarm name in your request to return information about a specific alarm, or specify a monitored resource name to return information about all alarms for a specific resource.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
      *)

  
end

module GetAutoSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_auto_snapshots_request ->
        (get_auto_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the available automatic snapshots for an instance or disk. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.
     *)

  
end

module GetBlueprints : sig
  val request :
    Smaws_Lib.Context.t ->
      get_blueprints_request ->
        (get_blueprints_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the list of available instance images, or {i blueprints}. You can use a blueprint to create a new instance already running a specific operating system, as well as a preinstalled app or development stack. The software each instance is running depends on the blueprint image you choose.
    
     Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.
     
      *)

  
end

module GetBucketAccessKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_access_keys_request ->
        (get_bucket_access_keys_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the existing access key IDs for the specified Amazon Lightsail bucket.
    
     This action does not return the secret access key value of an access key. You can get a secret access key only when you create it from the response of the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action. If you lose the secret access key, you must create a new access key.
     
      *)

  
end

module GetBucketBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_bundles_request ->
        (get_bucket_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the bundles that you can apply to a Amazon Lightsail bucket.
    
     The bucket bundle specifies the monthly cost, storage quota, and data transfer quota for a bucket.
     
      Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html}UpdateBucketBundle} action to update the bundle for a bucket.
       *)

  
end

module GetBucketMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_metric_data_request ->
        (get_bucket_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of a specific metric for an Amazon Lightsail bucket.
    
     Metrics report the utilization of a bucket. View and collect metric data regularly to monitor the number of objects stored in a bucket (including object versions) and the storage space used by those objects.
      *)

  
end

module GetBuckets : sig
  val request :
    Smaws_Lib.Context.t ->
      get_buckets_request ->
        (get_buckets_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more Amazon Lightsail buckets. The information returned includes the synchronization status of the Amazon Simple Storage Service (Amazon S3) account-level block public access feature for your Lightsail buckets.
    
     For more information about buckets, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/buckets-in-amazon-lightsail}Buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.
      *)

  
end

module GetBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_bundles_request ->
        (get_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the bundles that you can apply to an Amazon Lightsail instance when you create it.
    
     A bundle describes the specifications of an instance, such as the monthly cost, amount of memory, the number of vCPUs, amount of storage space, and monthly network data transfer quota.
     
      Bundles are referred to as {i instance plans} in the Lightsail console.
      
       *)

  
end

module GetCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificates_request ->
        (get_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more Amazon Lightsail SSL/TLS certificates.
    
     To get a summary of a certificate, omit [includeCertificateDetails] from your request. The response will include only the certificate Amazon Resource Name (ARN), certificate name, domain name, and tags.
     
      *)

  
end

module GetCloudFormationStackRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      get_cloud_formation_stack_records_request ->
        (get_cloud_formation_stack_records_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the CloudFormation stack record created as a result of the [create cloud
        formation stack] operation.
    
     An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail snapshot.
      *)

  
end

module GetContactMethods : sig
  val request :
    Smaws_Lib.Context.t ->
      get_contact_methods_request ->
        (get_contact_methods_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the configured contact methods. Specify a protocol in your request to return information about a specific contact method.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
      *)

  
end

module GetContainerAPIMetadata : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_api_metadata_request ->
        (get_container_api_metadata_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about Amazon Lightsail containers, such as the current version of the Lightsail Control (lightsailctl) plugin.
     *)

  
end

module GetContainerImages : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_images_request ->
        (get_container_images_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the container images that are registered to your Amazon Lightsail container service.
    
     If you created a deployment on your Lightsail container service that uses container images from a public registry like Docker Hub, those images are not returned as part of this action. Those images are not registered to your Lightsail container service.
     
      *)

  
end

module GetContainerLog : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_log_request ->
        (get_container_log_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the log events of a container of your Amazon Lightsail container service.
    
     If your container service has more than one node (i.e., a scale greater than 1), then the log events that are returned for the specified container are merged from all nodes on your container service.
     
      Container logs are retained for a certain amount of time. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/lightsail.html}Amazon Lightsail endpoints and quotas} in the {i Amazon Web Services General Reference}.
      
       *)

  
end

module GetContainerServiceDeployments : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_deployments_request ->
        (get_container_service_deployments_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the deployments for your Amazon Lightsail container service
    
     A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service.
     
      The deployments are ordered by version in ascending order. The newest version is listed at the top of the response.
      
       A set number of deployments are kept before the oldest one is replaced with the newest one. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/lightsail.html}Amazon Lightsail endpoints and quotas} in the {i Amazon Web Services General Reference}.
       
        *)

  
end

module GetContainerServiceMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_metric_data_request ->
        (get_container_service_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of a specific metric of your Amazon Lightsail container service.
    
     Metrics report the utilization of your resources. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetContainerServicePowers : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_powers_request ->
        (get_container_service_powers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the list of powers that can be specified for your Amazon Lightsail container services.
    
     The power specifies the amount of memory, the number of vCPUs, and the base price of the container service.
      *)

  
end

module GetContainerServices : sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_services_request ->
        (container_services_list_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more of your Amazon Lightsail container services.
     *)

  
end

module GetCostEstimate : sig
  val request :
    Smaws_Lib.Context.t ->
      get_cost_estimate_request ->
        (get_cost_estimate_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Retrieves information about the cost estimate for a specified resource. A cost estimate will not generate for a resource that has been deleted.
     *)

  
end

module GetDisk : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_request ->
        (get_disk_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific block storage disk.
     *)

  
end

module GetDisks : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disks_request ->
        (get_disks_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all block storage disks in your AWS account and region.
     *)

  
end

module GetDiskSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshot_request ->
        (get_disk_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific block storage disk snapshot.
     *)

  
end

module GetDiskSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshots_request ->
        (get_disk_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all block storage disk snapshots in your AWS account and region.
     *)

  
end

module GetDistributionBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_bundles_request ->
        (get_distribution_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the bundles that can be applied to your Amazon Lightsail content delivery network (CDN) distributions.
    
     A distribution bundle specifies the monthly network transfer quota and monthly cost of your distribution.
      *)

  
end

module GetDistributionLatestCacheReset : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_latest_cache_reset_request ->
        (get_distribution_latest_cache_reset_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the timestamp and status of the last cache reset of a specific Amazon Lightsail content delivery network (CDN) distribution.
     *)

  
end

module GetDistributionMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_metric_data_request ->
        (get_distribution_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of a specific metric for an Amazon Lightsail content delivery network (CDN) distribution.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetDistributions : sig
  val request :
    Smaws_Lib.Context.t ->
      get_distributions_request ->
        (get_distributions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about one or more of your Amazon Lightsail content delivery network (CDN) distributions.
     *)

  
end

module GetDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      get_domain_request ->
        (get_domain_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific domain recordset.
     *)

  
end

module GetDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      get_domains_request ->
        (get_domains_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of all domains in the user's account.
     *)

  
end

module GetExportSnapshotRecords : sig
  val request :
    Smaws_Lib.Context.t ->
      get_export_snapshot_records_request ->
        (get_export_snapshot_records_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns all export snapshot records created as a result of the [export
        snapshot] operation.
    
     An export snapshot record can be used to create a new Amazon EC2 instance and its related resources with the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateCloudFormationStack.html}CreateCloudFormationStack} action.
      *)

  
end

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific Amazon Lightsail instance, which is a virtual private server.
     *)

  
end

module GetInstanceAccessDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_access_details_request ->
        (get_instance_access_details_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns temporary SSH keys you can use to connect to a specific virtual private server, or {i instance}.
    
     The [get instance access details] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module GetInstanceMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_metric_data_request ->
        (get_instance_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points for the specified Amazon Lightsail instance metric, given an instance name.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetInstancePortStates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_port_states_request ->
        (get_instance_port_states_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.
     *)

  
end

module GetInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_request ->
        (get_instances_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all Amazon Lightsail virtual private servers, or {i instances}.
     *)

  
end

module GetInstanceSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshot_request ->
        (get_instance_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific instance snapshot.
     *)

  
end

module GetInstanceSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshots_request ->
        (get_instance_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns all instance snapshots for the user's account.
     *)

  
end

module GetInstanceState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_state_request ->
        (get_instance_state_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the state of a specific instance. Works on one instance at a time.
     *)

  
end

module GetKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pair_request ->
        (get_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific key pair.
     *)

  
end

module GetKeyPairs : sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pairs_request ->
        (get_key_pairs_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all key pairs in the user's account.
     *)

  
end

module GetLoadBalancer : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_request ->
        (get_load_balancer_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the specified Lightsail load balancer.
     *)

  
end

module GetLoadBalancerMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_metric_data_request ->
        (get_load_balancer_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about health metrics for your Lightsail load balancer.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetLoadBalancers : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancers_request ->
        (get_load_balancers_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all load balancers in an account.
     *)

  
end

module GetLoadBalancerTlsCertificates : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_certificates_request ->
        (get_load_balancer_tls_certificates_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about the TLS certificates that are associated with the specified Lightsail load balancer.
    
     TLS is just an updated, more secure version of Secure Socket Layer (SSL).
     
      You can have a maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is inactive.
       *)

  
end

module GetLoadBalancerTlsPolicies : sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_policies_request ->
        (get_load_balancer_tls_policies_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of TLS security policies that you can apply to Lightsail load balancers.
    
     For more information about load balancer TLS security policies, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy}Configuring TLS security policies on your Amazon Lightsail load balancers} in the {i Amazon Lightsail Developer Guide}.
      *)

  
end

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific operation. Operations include events such as when you create an instance, allocate a static IP, attach a static IP, and so on.
     *)

  
end

module GetOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_request ->
        (get_operations_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all operations.
    
     Results are returned from oldest to newest, up to a maximum of 200. Results can be paged by making each subsequent call to [GetOperations] use the maximum (last) [statusChangedAt] value from the previous request.
      *)

  
end

module GetOperationsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_for_resource_request ->
        (get_operations_for_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Gets operations for a specific resource (an instance or a static IP).
     *)

  
end

module GetRegions : sig
  val request :
    Smaws_Lib.Context.t ->
      get_regions_request ->
        (get_regions_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of all valid regions for Amazon Lightsail. Use the [include
        availability zones] parameter to also return the Availability Zones in a region.
     *)

  
end

module GetRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_request ->
        (get_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseBlueprints : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_blueprints_request ->
        (get_relational_database_blueprints_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major engine version of a database.
    
     You can use a blueprint ID to create a new database that runs a specific database engine.
      *)

  
end

module GetRelationalDatabaseBundles : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_bundles_request ->
        (get_relational_database_bundles_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the performance specifications for a database.
    
     You can use a bundle ID to create a new database with explicit performance specifications.
      *)

  
end

module GetRelationalDatabaseEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_events_request ->
        (get_relational_database_events_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of events for a specific database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseLogEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_events_request ->
        (get_relational_database_log_events_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of log events for a database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseLogStreams : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_streams_request ->
        (get_relational_database_log_streams_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a list of available log streams for a specific database in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseMasterUserPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_master_user_password_request ->
        (get_relational_database_master_user_password_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the current, previous, or pending versions of the master user password for a Lightsail database.
    
     The [GetRelationalDatabaseMasterUserPassword] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName.
      *)

  
end

module GetRelationalDatabaseMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_metric_data_request ->
        (get_relational_database_metric_data_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns the data points of the specified metric for a database in Amazon Lightsail.
    
     Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.
      *)

  
end

module GetRelationalDatabaseParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_parameters_request ->
        (get_relational_database_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns all of the runtime parameters offered by the underlying database software, or engine, for a specific database in Amazon Lightsail.
    
     In addition to the parameter names and values, this operation returns other information about each parameter. This information includes whether changes require a reboot, whether the parameter is modifiable, the allowed values, and the data types.
      *)

  
end

module GetRelationalDatabases : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_databases_request ->
        (get_relational_databases_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all of your databases in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshot_request ->
        (get_relational_database_snapshot_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about a specific database snapshot in Amazon Lightsail.
     *)

  
end

module GetRelationalDatabaseSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshots_request ->
        (get_relational_database_snapshots_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all of your database snapshots in Amazon Lightsail.
     *)

  
end

module GetSetupHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_setup_history_request ->
        (get_setup_history_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns detailed information for five of the most recent [SetupInstanceHttps] requests that were ran on the target instance.
     *)

  
end

module GetStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ip_request ->
        (get_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about an Amazon Lightsail static IP.
     *)

  
end

module GetStaticIps : sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ips_request ->
        (get_static_ips_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns information about all static IPs in the user's account.
     *)

  
end

module ImportKeyPair : sig
  val request :
    Smaws_Lib.Context.t ->
      import_key_pair_request ->
        (import_key_pair_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Imports a public SSH key from a specific key pair.
     *)

  
end

module IsVpcPeered : sig
  val request :
    Smaws_Lib.Context.t ->
      is_vpc_peered_request ->
        (is_vpc_peered_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Returns a Boolean value indicating whether your Lightsail VPC is peered.
     *)

  
end

module OpenInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      open_instance_public_ports_request ->
        (open_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol.
    
     The [OpenInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module PeerVpc : sig
  val request :
    Smaws_Lib.Context.t ->
      peer_vpc_request ->
        (peer_vpc_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Peers the Lightsail VPC with the user's default VPC.
     *)

  
end

module PutAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      put_alarm_request ->
        (put_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates or updates an alarm, and associates it with the specified metric.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
     
      When this action creates an alarm, the alarm state is immediately set to [INSUFFICIENT_DATA]. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.
      
       When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. The alarm is then evaluated with the updated configuration.
        *)

  
end

module PutInstancePublicPorts : sig
  val request :
    Smaws_Lib.Context.t ->
      put_instance_public_ports_request ->
        (put_instance_public_ports_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your [PutInstancePublicPorts]request. Or use the [OpenInstancePublicPorts] action to open ports without closing currently open ports.
    
     The [PutInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module RebootInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_instance_request ->
        (reboot_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Restarts a specific instance.
    
     The [reboot instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module RebootRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_relational_database_request ->
        (reboot_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Restarts a specific database in Amazon Lightsail.
    
     The [reboot relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module RegisterContainerImage : sig
  val request :
    Smaws_Lib.Context.t ->
      register_container_image_request ->
        (register_container_image_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Registers a container image to your Amazon Lightsail container service.
    
     This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-pushing-container-images}Pushing and managing container images on your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.
     
      *)

  
end

module ReleaseStaticIp : sig
  val request :
    Smaws_Lib.Context.t ->
      release_static_ip_request ->
        (release_static_ip_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes a specific static IP from your account.
     *)

  
end

module ResetDistributionCache : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_distribution_cache_request ->
        (reset_distribution_cache_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes currently cached content from your Amazon Lightsail content delivery network (CDN) distribution.
    
     After resetting the cache, the next time a content request is made, your distribution pulls, serves, and caches it from the origin.
      *)

  
end

module SendContactMethodVerification : sig
  val request :
    Smaws_Lib.Context.t ->
      send_contact_method_verification_request ->
        (send_contact_method_verification_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Sends a verification request to an email contact method to ensure it's owned by the requester. SMS contact methods don't need to be verified.
    
     A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.
     
      A verification request is sent to the contact method when you initially create it. Use this action to send another verification request if a previous verification request was deleted, or has expired.
      
       Notifications are not sent to an email contact method until after it is verified, and confirmed as valid.
       
        *)

  
end

module SetIpAddressType : sig
  val request :
    Smaws_Lib.Context.t ->
      set_ip_address_type_request ->
        (set_ip_address_type_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Sets the IP address type for an Amazon Lightsail resource.
    
     Use this action to enable dual-stack for a resource, which enables IPv4 and IPv6 for the specified resource. Alternately, you can use this action to disable dual-stack, and enable IPv4 only.
      *)

  
end

module SetResourceAccessForBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      set_resource_access_for_bucket_request ->
        (set_resource_access_for_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Sets the Amazon Lightsail resources that can access the specified Lightsail bucket.
    
     Lightsail buckets currently support setting access for Lightsail instances in the same Amazon Web Services Region.
      *)

  
end

module SetupInstanceHttps : sig
  val request :
    Smaws_Lib.Context.t ->
      setup_instance_https_request ->
        (setup_instance_https_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Creates an SSL/TLS certificate that secures traffic for your website. After the certificate is created, it is installed on the specified Lightsail instance.
    
     If you provide more than one domain name in the request, at least one name must be less than or equal to 63 characters in length.
      *)

  
end

module StartGUISession : sig
  val request :
    Smaws_Lib.Context.t ->
      start_gui_session_request ->
        (start_gui_session_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Initiates a graphical user interface (GUI) session that’s used to access a virtual computer’s operating system and application. The session will be active for 1 hour. Use this action to resume the session after it expires.
     *)

  
end

module StartInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      start_instance_request ->
        (start_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the [reboot instance] operation.
    
     When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip}Amazon Lightsail Developer Guide}.
     
      The [start instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module StartRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      start_relational_database_request ->
        (start_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the [reboot relational database] operation.
    
     The [start relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module StopGUISession : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_gui_session_request ->
        (stop_gui_session_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Terminates a web-based NICE DCV session that’s used to access a virtual computer’s operating system or application. The session will close and any unsaved data will be lost.
     *)

  
end

module StopInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_instance_request ->
        (stop_instance_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Stops a specific Amazon Lightsail instance that is currently running.
    
     When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-create-static-ip}Amazon Lightsail Developer Guide}.
     
      The [stop instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module StopRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_relational_database_request ->
        (stop_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Stops a specific database that is currently running in Amazon Lightsail.
    
     The [stop relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.
    
     The [tag resource] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [resource name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module TestAlarm : sig
  val request :
    Smaws_Lib.Context.t ->
      test_alarm_request ->
        (test_alarm_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is configured for the specified alarm, the test also sends a notification to the notification protocol ([Email] and/or [SMS]) configured for the alarm.
    
     An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.
      *)

  
end

module UnpeerVpc : sig
  val request :
    Smaws_Lib.Context.t ->
      unpeer_vpc_request ->
        (unpeer_vpc_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Unpeers the Lightsail VPC from the user's default VPC.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource.
    
     The [untag resource] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [resource name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module UpdateBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_request ->
        (update_bucket_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates an existing Amazon Lightsail bucket.
    
     Use this action to update the configuration of an existing bucket, such as versioning, public accessibility, and the Amazon Web Services accounts that can access the bucket.
      *)

  
end

module UpdateBucketBundle : sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_bundle_request ->
        (update_bucket_bundle_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the bundle, or storage plan, of an existing Amazon Lightsail bucket.
    
     A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket. You can update a bucket's bundle only one time within a monthly Amazon Web Services billing cycle. To determine if you can update a bucket's bundle, use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBuckets.html}GetBuckets} action. The [ableToUpdateBundle] parameter in the response will indicate whether you can currently update a bucket's bundle.
     
      Update a bucket's bundle if it's consistently going over its storage space or data transfer quota, or if a bucket's usage is consistently in the lower range of its storage space or data transfer quota. Due to the unpredictable usage fluctuations that a bucket might experience, we strongly recommend that you update a bucket's bundle only as a long-term strategy, instead of as a short-term, monthly cost-cutting measure. Choose a bucket bundle that will provide the bucket with ample storage space and data transfer for a long time to come.
       *)

  
end

module UpdateContainerService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_container_service_request ->
        (update_container_service_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the configuration of your Amazon Lightsail container service, such as its power, scale, and public domain names.
     *)

  
end

module UpdateDistribution : sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_request ->
        (update_distribution_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates an existing Amazon Lightsail content delivery network (CDN) distribution.
    
     Use this action to update the configuration of your existing distribution.
      *)

  
end

module UpdateDistributionBundle : sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_bundle_request ->
        (update_distribution_bundle_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the bundle of your Amazon Lightsail content delivery network (CDN) distribution.
    
     A distribution bundle specifies the monthly network transfer quota and monthly cost of your distribution.
     
      Update your distribution's bundle if your distribution is going over its monthly network transfer quota and is incurring an overage fee.
      
       You can update your distribution's bundle only one time within your monthly Amazon Web Services billing cycle. To determine if you can update your distribution's bundle, use the [GetDistributions] action. The [ableToUpdateBundle] parameter in the result will indicate whether you can currently update your distribution's bundle.
        *)

  
end

module UpdateDomainEntry : sig
  val request :
    Smaws_Lib.Context.t ->
      update_domain_entry_request ->
        (update_domain_entry_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates a domain recordset after it is created.
    
     The [update domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module UpdateInstanceMetadataOptions : sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_metadata_options_request ->
        (update_instance_metadata_options_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Modifies the Amazon Lightsail instance metadata parameters on a running or stopped instance. When you modify the parameters on a running instance, the [GetInstance] or [GetInstances] API operation initially responds with a state of [pending]. After the parameter modifications are successfully applied, the state changes to [applied] in subsequent [GetInstance] or [GetInstances] API calls. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configuring-instance-metadata-service}Use IMDSv2 with an Amazon Lightsail instance} in the {i Amazon Lightsail Developer Guide}.
     *)

  
end

module UpdateLoadBalancerAttribute : sig
  val request :
    Smaws_Lib.Context.t ->
      update_load_balancer_attribute_request ->
        (update_load_balancer_attribute_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Updates the specified attribute for a load balancer. You can only update one attribute at a time.
    
     The [update load balancer attribute] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer
        name]. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
      *)

  
end

module UpdateRelationalDatabase : sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_request ->
        (update_relational_database_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Allows the update of one or more attributes of a database in Amazon Lightsail.
    
     Updates are applied immediately, or in cases where the updates could result in an outage, are applied during the database's predefined maintenance window.
     
      The [update relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

module UpdateRelationalDatabaseParameters : sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_parameters_request ->
        (update_relational_database_parameters_result,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `AccountSetupInProgressException of account_setup_in_progress_exception
            | `InvalidInputException of invalid_input_exception
            | `NotFoundException of not_found_exception
            | `OperationFailureException of operation_failure_exception
            | `ServiceException of service_exception
            | `UnauthenticatedException of unauthenticated_exception
            
        ]
      ) result
  (** 
    Allows the update of one or more parameters of a database in Amazon Lightsail.
    
     Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: [dynamic] or [pending-reboot]. Parameters marked with a [dynamic] apply type are applied immediately. Parameters marked with a [pending-reboot] apply type are applied only after the database is rebooted using the [reboot relational database] operation.
     
      The [update relational database parameters] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.
       *)

  
end

