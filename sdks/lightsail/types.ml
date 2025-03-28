open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "lightsail";
      endpointPrefix = "lightsail";
      version = "2016-11-28";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec timestamp_ = Timestamp.t
type nonrec string_ = string
type nonrec non_empty_string = string
type nonrec resource_name = string
type nonrec setup_domain_name = string
type nonrec setup_domain_name_list = string list option list
type nonrec base_unit = unit
type nonrec certificate_provider =
  | LetsEncrypt 
type nonrec setup_request =
  {
  certificate_provider: certificate_provider option ;
  domain_names: string list option ;
  instance_name: string option }
type nonrec iso_date = Timestamp.t
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
  created_at: float option ;
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
  date_time: float option ;
  command: string option }
type nonrec setup_execution_details_list =
  setup_execution_details list option list
type nonrec setup_history =
  {
  status: setup_status option ;
  execution_details: setup_execution_details list option ;
  resource: setup_history_resource option ;
  request: setup_request option ;
  operation_id: string option }
type nonrec setup_history_list = setup_history list option list
type nonrec long = int
type nonrec integer_ = int
type nonrec float_ = float
type nonrec double = float
type nonrec boolean_ = bool
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
  status_changed_at: float option ;
  status: operation_status option ;
  operation_type: operation_type option ;
  operation_details: string option ;
  is_terminal: bool option ;
  location: resource_location option ;
  created_at: float option ;
  resource_type: resource_type option ;
  resource_name: string option ;
  id: string option }
type nonrec operation_list = operation list option list
type nonrec update_relational_database_result =
  {
  operations: operation list option }
type nonrec sensitive_string = string
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
type nonrec relational_database_parameter_list =
  relational_database_parameter list option list
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
type nonrec string_max256 = string
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
type nonrec domain_name = string
type nonrec domain_entry_type = string
type nonrec domain_entry_options_keys = string
type nonrec domain_entry_options = (string_ option * string_ option) list
type nonrec domain_entry =
  {
  options: (string * string) list option ;
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
type nonrec string_list = string list option list
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
type nonrec header_forward_list = header_enum list option list
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
type nonrec cache_behavior_list = cache_behavior_per_path list option list
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
type nonrec container_service_name = string
type nonrec tag_key = string
type nonrec tag_value = string
type nonrec tag = {
  value: string option ;
  key: string option }
type nonrec tag_list = tag list option list
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
type nonrec container_service_scale = int
type nonrec container_service_deployment_state =
  | FAILED 
  | INACTIVE 
  | ACTIVE 
  | ACTIVATING 
type nonrec environment = (string_ option * string_ option) list
type nonrec container_service_protocol =
  | UDP 
  | TCP 
  | HTTPS 
  | HTTP 
type nonrec port_map =
  (string_ option * container_service_protocol option) list
type nonrec container =
  {
  ports: (string * container_service_protocol) list option ;
  environment: (string * string) list option ;
  command: string list option ;
  image: string option }
type nonrec container_name = string
type nonrec container_map = (string_ option * container option) list
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
  created_at: float option ;
  public_endpoint: container_service_endpoint option ;
  containers: (string * container) list option ;
  state: container_service_deployment_state option ;
  version: int option }
type nonrec container_service_public_domains_list = string list option list
type nonrec container_service_public_domains =
  (string_ option * string list option) list
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
  public_domain_names: (string * string list) list option ;
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
  created_at: float option ;
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
  public_domain_names: (string * string list) list option ;
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
type nonrec bucket_name = string
type nonrec partner_id_list = string list option list
type nonrec resource_receiving_access =
  {
  resource_type: string option ;
  name: string option }
type nonrec access_receiver_list = resource_receiving_access list option list
type nonrec bucket_state = {
  message: string option ;
  code: string option }
type nonrec bucket_access_log_prefix = string
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
  created_at: float option ;
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
type nonrec resource_arn = string
type nonrec tag_key_list = string list option list
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
type nonrec time_period = {
  end_: float option ;
  start: float option }
type nonrec time_of_day = string
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
type nonrec subject_alternative_name_list = string list option list
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
type nonrec ip_address = string
type nonrec static_ip =
  {
  is_attached: bool option ;
  attached_to: string option ;
  ip_address: string option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec static_ip_list = static_ip list option list
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
type nonrec email_address = string
type nonrec setup_instance_https_request =
  {
  certificate_provider: certificate_provider ;
  domain_names: string list ;
  email_address: string ;
  instance_name: string }
type nonrec setup_history_page_token = string
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
type nonrec sensitive_non_empty_string = string
type nonrec session =
  {
  is_primary: bool option ;
  url: string option ;
  name: string option }
type nonrec sessions = session list option list
type nonrec serial_number = string
type nonrec send_contact_method_verification_result =
  {
  operations: operation list option }
type nonrec contact_method_verification_protocol =
  | Email 
type nonrec send_contact_method_verification_request =
  {
  protocol: contact_method_verification_protocol }
type nonrec revocation_reason = string
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
type nonrec estimates_by_time = estimate_by_time list option list
type nonrec cost_estimate =
  {
  results_by_time: estimate_by_time list option ;
  usage_type: string option }
type nonrec cost_estimates = cost_estimate list option list
type nonrec resource_budget_estimate =
  {
  end_time: float option ;
  start_time: float option ;
  cost_estimates: cost_estimate list option ;
  resource_type: resource_type option ;
  resource_name: string option }
type nonrec resources_budget_estimate =
  resource_budget_estimate list option list
type nonrec resource_record =
  {
  value: string option ;
  type_: string option ;
  name: string option }
type nonrec resource_name_list = string list option list
type nonrec reset_distribution_cache_result =
  {
  operation: operation option ;
  create_time: float option ;
  status: string option }
type nonrec reset_distribution_cache_request =
  {
  distribution_name: string option }
type nonrec request_failure_reason = string
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
type nonrec domain_validation_record_list =
  domain_validation_record list option list
type nonrec renewal_status =
  | Failed 
  | Success 
  | PendingValidation 
  | PendingAutoRenewal 
type nonrec renewal_status_reason = string
type nonrec renewal_summary =
  {
  updated_at: float option ;
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec relational_database_snapshot_list =
  relational_database_snapshot list option list
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
  current_apply_date: float option ;
  description: string option ;
  action: string option }
type nonrec pending_maintenance_action_list =
  pending_maintenance_action list option list
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
  latest_restorable_time: float option ;
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec relational_database_list = relational_database list option list
type nonrec relational_database_event =
  {
  event_categories: string list option ;
  message: string option ;
  created_at: float option ;
  resource: string option }
type nonrec relational_database_event_list =
  relational_database_event list option list
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
type nonrec relational_database_bundle_list =
  relational_database_bundle list option list
type nonrec relational_database_blueprint =
  {
  is_engine_default: bool option ;
  engine_version_description: string option ;
  engine_description: string option ;
  engine_version: string option ;
  engine: relational_database_engine option ;
  blueprint_id: string option }
type nonrec relational_database_blueprint_list =
  relational_database_blueprint list option list
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
  created_at: float option ;
  digest: string option ;
  image: string option }
type nonrec register_container_image_result =
  {
  container_image: container_image option }
type nonrec container_label = string
type nonrec register_container_image_request =
  {
  digest: string ;
  label: string ;
  service_name: string }
type nonrec availability_zone =
  {
  state: string option ;
  zone_name: string option }
type nonrec availability_zone_list = availability_zone list option list
type nonrec region =
  {
  relational_database_availability_zones: availability_zone list option ;
  availability_zones: availability_zone list option ;
  name: region_name option ;
  display_name: string option ;
  description: string option ;
  continent_code: string option }
type nonrec region_list = region list option list
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
type nonrec port = int
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
type nonrec port_info_list = port_info list option list
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
type nonrec contact_protocols_list = contact_protocol list option list
type nonrec notification_trigger_list = alarm_state list option list
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
type nonrec port_list = int list option list
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
type nonrec metric_statistic_list = metric_statistic list option list
type nonrec metric_period = int
type nonrec metric_datapoint =
  {
  unit_: metric_unit option ;
  timestamp_: float option ;
  sum: float option ;
  sample_count: float option ;
  minimum: float option ;
  maximum: float option ;
  average: float option }
type nonrec metric_datapoint_list = metric_datapoint list option list
type nonrec log_event = {
  message: string option ;
  created_at: float option }
type nonrec log_event_list = log_event list option list
type nonrec load_balancer_tls_policy =
  {
  ciphers: string list option ;
  protocols: string list option ;
  description: string option ;
  is_default: bool option ;
  name: string option }
type nonrec load_balancer_tls_policy_list =
  load_balancer_tls_policy list option list
type nonrec load_balancer_tls_certificate_summary =
  {
  is_attached: bool option ;
  name: string option }
type nonrec load_balancer_tls_certificate_summary_list =
  load_balancer_tls_certificate_summary list option list
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
type nonrec load_balancer_tls_certificate_domain_validation_option_list =
  load_balancer_tls_certificate_domain_validation_option list option list
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
type nonrec load_balancer_tls_certificate_domain_validation_record_list =
  load_balancer_tls_certificate_domain_validation_record list option list
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
  revoked_at: float option ;
  revocation_reason: load_balancer_tls_certificate_revocation_reason option ;
  renewal_summary: load_balancer_tls_certificate_renewal_summary option ;
  not_before: float option ;
  not_after: float option ;
  key_algorithm: string option ;
  issuer: string option ;
  issued_at: float option ;
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec load_balancer_tls_certificate_list =
  load_balancer_tls_certificate list option list
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
type nonrec instance_health_summary_list =
  instance_health_summary list option list
type nonrec load_balancer_configuration_options =
  (string_ option * string_ option) list
type nonrec load_balancer =
  {
  tls_policy_name: string option ;
  https_redirection_enabled: bool option ;
  ip_address_type: ip_address_type option ;
  configuration_options: (string * string) list option ;
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec load_balancer_list = load_balancer list option list
type nonrec is_vpc_peered_result = {
  is_peered: bool option }
type nonrec is_vpc_peered_request = unit
type nonrec import_key_pair_result = {
  operation: operation option }
type nonrec base64 = string
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
  end_time: float ;
  start_time: float ;
  period: int ;
  metric_name: relational_database_metric_name ;
  relational_database_name: string }
type nonrec get_relational_database_master_user_password_result =
  {
  created_at: float option ;
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
  end_time: float option ;
  start_time: float option ;
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
  end_time: float ;
  start_time: float ;
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec key_pair_list = key_pair list option list
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
type nonrec add_on_list = add_on list option list
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec disk_list = disk list option list
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec instance_snapshot_list = instance_snapshot list option list
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
type nonrec ipv6_address = string
type nonrec ipv6_address_list = string list option list
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
type nonrec instance_port_info_list = instance_port_info list option list
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec instance_list = instance list option list
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
type nonrec instance_port_state_list = instance_port_state list option list
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
  end_time: float ;
  start_time: float ;
  period: int ;
  metric_name: instance_metric_name ;
  instance_name: string }
type nonrec instance_access_protocol =
  | Rdp 
  | Ssh 
type nonrec host_key_attributes =
  {
  not_valid_after: float option ;
  not_valid_before: float option ;
  fingerprint_sh_a256: string option ;
  fingerprint_sh_a1: string option ;
  witnessed_at: float option ;
  public_key: string option ;
  algorithm: string option }
type nonrec host_keys_list = host_key_attributes list option list
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
  expires_at: float option ;
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
type nonrec disk_info_list = disk_info list option list
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
  created_at: float option ;
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
  created_at: float option ;
  arn: string option ;
  name: string option }
type nonrec export_snapshot_record_list =
  export_snapshot_record list option list
type nonrec get_export_snapshot_records_result =
  {
  next_page_token: string option ;
  export_snapshot_records: export_snapshot_record list option }
type nonrec get_export_snapshot_records_request =
  {
  page_token: string option }
type nonrec domain_entry_list = domain_entry list option list
type nonrec domain =
  {
  registered_domain_delegation_info: registered_domain_delegation_info option ;
  domain_entries: domain_entry list option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec domain_list = domain list option list
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec distribution_list = lightsail_distribution list option list
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
  end_time: float ;
  start_time: float ;
  metric_name: distribution_metric_name ;
  distribution_name: string }
type nonrec get_distribution_latest_cache_reset_result =
  {
  create_time: float option ;
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
type nonrec distribution_bundle_list = distribution_bundle list option list
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
  created_at: float option ;
  support_code: string option ;
  arn: string option ;
  name: string option }
type nonrec disk_snapshot_list = disk_snapshot list option list
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
  end_time: float ;
  start_time: float ;
  resource_name: string }
type nonrec container_service_list = container_service list option list
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
type nonrec container_service_power_list =
  container_service_power list option list
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
  end_time: float ;
  start_time: float ;
  metric_name: container_service_metric_name ;
  service_name: string }
type nonrec container_service_deployment_list =
  container_service_deployment list option list
type nonrec get_container_service_deployments_result =
  {
  deployments: container_service_deployment list option }
type nonrec get_container_service_deployments_request =
  {
  service_name: string }
type nonrec container_service_log_event =
  {
  message: string option ;
  created_at: float option }
type nonrec container_service_log_event_list =
  container_service_log_event list option list
type nonrec get_container_log_result =
  {
  next_page_token: string option ;
  log_events: container_service_log_event list option }
type nonrec get_container_log_request =
  {
  page_token: string option ;
  filter_pattern: string option ;
  end_time: float option ;
  start_time: float option ;
  container_name: string ;
  service_name: string }
type nonrec container_image_list = container_image list option list
type nonrec get_container_images_result =
  {
  container_images: container_image list option }
type nonrec get_container_images_request = {
  service_name: string }
type nonrec container_service_metadata_entry =
  (string_ option * string_ option) list
type nonrec container_service_metadata_entry_list =
  (string * string) list list option list
type nonrec get_container_api_metadata_result =
  {
  metadata: (string * string) list list option }
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
  created_at: float option ;
  arn: string option ;
  name: string option ;
  protocol: contact_protocol option ;
  status: contact_method_status option ;
  contact_endpoint: string option }
type nonrec contact_methods_list = contact_method list option list
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
type nonrec cloud_formation_stack_record_source_info_list =
  cloud_formation_stack_record_source_info list option list
type nonrec cloud_formation_stack_record =
  {
  destination_info: destination_info option ;
  source_info: cloud_formation_stack_record_source_info list option ;
  state: record_state option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: float option ;
  arn: string option ;
  name: string option }
type nonrec cloud_formation_stack_record_list =
  cloud_formation_stack_record list option list
type nonrec get_cloud_formation_stack_records_result =
  {
  next_page_token: string option ;
  cloud_formation_stack_records: cloud_formation_stack_record list option }
type nonrec get_cloud_formation_stack_records_request =
  {
  page_token: string option }
type nonrec certificate_name = string
type nonrec certificate_status =
  | Failed 
  | Revoked 
  | ValidationTimedOut 
  | Expired 
  | Inactive 
  | Issued 
  | PendingValidation 
type nonrec in_use_resource_count = int
type nonrec key_algorithm = string
type nonrec issuer_c_a = string
type nonrec eligible_to_renew = string
type nonrec certificate =
  {
  support_code: string option ;
  tags: tag list option ;
  revocation_reason: string option ;
  revoked_at: float option ;
  renewal_summary: renewal_summary option ;
  eligible_to_renew: string option ;
  not_after: float option ;
  not_before: float option ;
  issuer_c_a: string option ;
  issued_at: float option ;
  created_at: float option ;
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
type nonrec certificate_summary_list = certificate_summary list option list
type nonrec get_certificates_result =
  {
  next_page_token: string option ;
  certificates: certificate_summary list option }
type nonrec certificate_status_list = certificate_status list option list
type nonrec include_certificate_details = bool
type nonrec get_certificates_request =
  {
  page_token: string option ;
  certificate_name: string option ;
  include_certificate_details: bool option ;
  certificate_statuses: certificate_status list option }
type nonrec instance_platform =
  | Windows 
  | LinuxUnix 
type nonrec instance_platform_list = instance_platform list option list
type nonrec app_category =
  | LfR 
type nonrec app_category_list = app_category list option list
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
type nonrec bundle_list = bundle list option list
type nonrec get_bundles_result =
  {
  next_page_token: string option ;
  bundles: bundle list option }
type nonrec get_bundles_request =
  {
  app_category: app_category option ;
  page_token: string option ;
  include_inactive: bool option }
type nonrec bucket_list = bucket list option list
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
  last_synced_at: float option ;
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
  end_time: float ;
  start_time: float ;
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
type nonrec bucket_bundle_list = bucket_bundle list option list
type nonrec get_bucket_bundles_result = {
  bundles: bucket_bundle list option }
type nonrec get_bucket_bundles_request = {
  include_inactive: bool option }
type nonrec iam_access_key_id = string
type nonrec access_key_last_used =
  {
  service_name: string option ;
  region: string option ;
  last_used_date: float option }
type nonrec access_key =
  {
  last_used: access_key_last_used option ;
  created_at: float option ;
  status: status_type option ;
  secret_access_key: string option ;
  access_key_id: string option }
type nonrec access_key_list = access_key list option list
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
type nonrec blueprint_list = blueprint list option list
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
type nonrec attached_disk_list = attached_disk list option list
type nonrec auto_snapshot_details =
  {
  from_attached_disks: attached_disk list option ;
  status: auto_snapshot_status option ;
  created_at: float option ;
  date: string option }
type nonrec auto_snapshot_details_list =
  auto_snapshot_details list option list
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
  created_at: float option ;
  arn: string option ;
  name: string option }
type nonrec alarms_list = alarm list option list
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
  created_at: float option ;
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
type nonrec auto_snapshot_date = string
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
  restore_time: float option ;
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
type nonrec domain_name_list = string list option list
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
type nonrec disk_map_list = disk_map list option list
type nonrec attached_disk_map = (string_ option * disk_map list option) list
type nonrec add_on_request_list = add_on_request list option list
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
  attached_disk_mapping: (string * disk_map list) list option ;
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
  expires_at: float option ;
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
  containers: (string * container) list option ;
  service_name: string }
type nonrec create_container_service_result =
  {
  container_service: container_service option }
type nonrec container_service_deployment_request =
  {
  public_endpoint: endpoint_request option ;
  containers: (string * container) list option }
type nonrec create_container_service_request =
  {
  private_registry_access: private_registry_access_request option ;
  deployment: container_service_deployment_request option ;
  public_domain_names: (string * string list) list option ;
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
type nonrec instance_entry_list = instance_entry list option list
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
  static_ip_name: string }
type nonrec lightsail_20161128 = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t