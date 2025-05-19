open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec certificate_provider =
  | LetsEncrypt [@@ocaml.doc ""]
type nonrec setup_request =
  {
  certificate_provider: certificate_provider option ;
  domain_names: string list option ;
  instance_name: string option }[@@ocaml.doc
                                  "Returns information that was submitted during the [SetupInstanceHttps] request. Email information is redacted for privacy.\n"]
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
  | US_EAST_1 [@@ocaml.doc ""]
type nonrec resource_location =
  {
  region_name: region_name option ;
  availability_zone: string option }[@@ocaml.doc
                                      "Describes the resource location.\n"]
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
  | ContainerService [@@ocaml.doc ""]
type nonrec setup_history_resource =
  {
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option }[@@ocaml.doc
                         "The Lightsail resource that [SetupHistory] was ran on. \n"]
type nonrec setup_status =
  | InProgress 
  | Failed 
  | Succeeded [@@ocaml.doc ""]
type nonrec setup_execution_details =
  {
  version: string option ;
  standard_output: string option ;
  standard_error: string option ;
  status: setup_status option ;
  name: string option ;
  date_time: CoreTypes.Timestamp.t option ;
  command: string option }[@@ocaml.doc
                            "Returns details about the commands that were run.\n"]
type nonrec setup_history =
  {
  status: setup_status option ;
  execution_details: setup_execution_details list option ;
  resource: setup_history_resource option ;
  request: setup_request option ;
  operation_id: string option }[@@ocaml.doc
                                 "Returns a list of the commands that were ran on the target resource.\n\n The status of each command is also returned.\n "]
type nonrec viewer_minimum_tls_protocol_version_enum =
  | TLSv12_2021 
  | TLSv12_2019 
  | TLSv12_2018 
  | TLSv11_2016 [@@ocaml.doc ""]
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
  | DeleteKnownHostKeys [@@ocaml.doc ""]
type nonrec operation_status =
  | Succeeded 
  | Completed 
  | Failed 
  | Started 
  | NotStarted [@@ocaml.doc ""]
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
  id: string option }[@@ocaml.doc "Describes the API operation.\n"]
type nonrec update_relational_database_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
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
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec update_relational_database_parameters_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec relational_database_parameter =
  {
  parameter_value: string option ;
  parameter_name: string option ;
  is_modifiable: bool option ;
  description: string option ;
  data_type: string option ;
  apply_type: string option ;
  apply_method: string option ;
  allowed_values: string option }[@@ocaml.doc
                                   "Describes the parameters of a database.\n"]
type nonrec update_relational_database_parameters_request =
  {
  parameters: relational_database_parameter list ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec unauthenticated_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }[@@ocaml.doc
                         "Lightsail throws this exception when the user has not been authenticated.\n"]
type nonrec service_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }[@@ocaml.doc "A general service exception.\n"]
type nonrec operation_failure_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }[@@ocaml.doc
                         "Lightsail throws this exception when an operation fails to execute.\n"]
type nonrec not_found_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }[@@ocaml.doc
                         "Lightsail throws this exception when it cannot find a resource.\n"]
type nonrec invalid_input_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }[@@ocaml.doc
                         "Lightsail throws this exception when user input does not conform to the validation rules of an input field.\n\n  Domain and distribution APIs are only available in the N. Virginia ([us-east-1]) Amazon Web Services Region. Please set your Amazon Web Services Region configuration to [us-east-1] to create, view, or edit these resources.\n  \n   "]
type nonrec account_setup_in_progress_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }[@@ocaml.doc
                         "Lightsail throws this exception when an account is still in the setup in progress state.\n"]
type nonrec access_denied_exception =
  {
  tip: string option ;
  message: string option ;
  docs: string option ;
  code: string option }[@@ocaml.doc
                         "Lightsail throws this exception when the user cannot be authenticated or uses invalid credentials to access a resource.\n"]
type nonrec update_load_balancer_attribute_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec load_balancer_attribute_name =
  | TlsPolicyName 
  | HttpsRedirectionEnabled 
  | SessionStickiness_LB_CookieDurationSeconds 
  | SessionStickinessEnabled 
  | HealthCheckPath [@@ocaml.doc ""]
type nonrec update_load_balancer_attribute_request =
  {
  attribute_value: string ;
  attribute_name: load_balancer_attribute_name ;
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec update_instance_metadata_options_result =
  {
  operation: operation option }[@@ocaml.doc ""]
type nonrec http_tokens =
  | Required 
  | Optional [@@ocaml.doc ""]
type nonrec http_endpoint =
  | Enabled 
  | Disabled [@@ocaml.doc ""]
type nonrec http_protocol_ipv6 =
  | Enabled 
  | Disabled [@@ocaml.doc ""]
type nonrec update_instance_metadata_options_request =
  {
  http_protocol_ipv6: http_protocol_ipv6 option ;
  http_put_response_hop_limit: int option ;
  http_endpoint: http_endpoint option ;
  http_tokens: http_tokens option ;
  instance_name: string }[@@ocaml.doc ""]
type nonrec update_domain_entry_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec domain_entry_options = (string * string) list[@@ocaml.doc ""]
type nonrec domain_entry =
  {
  options: domain_entry_options option ;
  type_: string option ;
  is_alias: bool option ;
  target: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc "Describes a domain recordset entry.\n"]
type nonrec update_domain_entry_request =
  {
  domain_entry: domain_entry ;
  domain_name: string }[@@ocaml.doc ""]
type nonrec update_distribution_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec origin_protocol_policy_enum =
  | HTTPSOnly 
  | HTTPOnly [@@ocaml.doc ""]
type nonrec input_origin =
  {
  response_timeout: int option ;
  protocol_policy: origin_protocol_policy_enum option ;
  region_name: region_name option ;
  name: string option }[@@ocaml.doc
                         "Describes the origin resource of an Amazon Lightsail content delivery network (CDN) distribution.\n\n An origin can be a Lightsail instance, bucket, container service, or load balancer. A distribution pulls content from an origin, caches it, and serves it to viewers via a worldwide network of edge servers.\n "]
type nonrec behavior_enum =
  | CacheSetting 
  | DontCacheSetting [@@ocaml.doc ""]
type nonrec cache_behavior = {
  behavior: behavior_enum option }[@@ocaml.doc
                                    "Describes the default cache behavior of an Amazon Lightsail content delivery network (CDN) distribution.\n"]
type nonrec forward_values =
  | All 
  | AllowList 
  | None [@@ocaml.doc ""]
type nonrec cookie_object =
  {
  cookies_allow_list: string list option ;
  option_: forward_values option }[@@ocaml.doc
                                    "Describes whether an Amazon Lightsail content delivery network (CDN) distribution forwards cookies to the origin and, if so, which ones.\n\n For the cookies that you specify, your distribution caches separate versions of the specified content based on the cookie values in viewer requests.\n "]
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
  | Accept [@@ocaml.doc ""]
type nonrec header_object =
  {
  headers_allow_list: header_enum list option ;
  option_: forward_values option }[@@ocaml.doc
                                    "Describes the request headers that a Lightsail distribution bases caching on.\n\n For the headers that you specify, your distribution caches separate versions of the specified content based on the header values in viewer requests. For example, suppose viewer requests for [logo.jpg] contain a custom [product] header that has a value of either [acme] or [apex], and you configure your distribution to cache your content based on values in the [product] header. Your distribution forwards the [product] header to the origin and caches the response from the origin once for each header value. \n "]
type nonrec query_string_object =
  {
  query_strings_allow_list: string list option ;
  option_: bool option }[@@ocaml.doc
                          "Describes the query string parameters that an Amazon Lightsail content delivery network (CDN) distribution to bases caching on.\n\n For the query strings that you specify, your distribution caches separate versions of the specified content based on the query string values in viewer requests.\n "]
type nonrec cache_settings =
  {
  forwarded_query_strings: query_string_object option ;
  forwarded_headers: header_object option ;
  forwarded_cookies: cookie_object option ;
  cached_http_methods: string option ;
  allowed_http_methods: string option ;
  maximum_tt_l: int option ;
  minimum_tt_l: int option ;
  default_tt_l: int option }[@@ocaml.doc
                              "Describes the cache settings of an Amazon Lightsail content delivery network (CDN) distribution.\n\n These settings apply only to your distribution's [cacheBehaviors] (including the [defaultCacheBehavior]) that have a [behavior] of [cache].\n "]
type nonrec cache_behavior_per_path =
  {
  behavior: behavior_enum option ;
  path: string option }[@@ocaml.doc
                         "Describes the per-path cache behavior of an Amazon Lightsail content delivery network (CDN) distribution.\n\n A per-path cache behavior is used to override, or add an exception to, the default cache behavior of a distribution. For example, if the [cacheBehavior] is set to [cache], then a per-path cache behavior can be used to specify a directory, file, or file type that your distribution will cache. Alternately, if the distribution's [cacheBehavior] is [dont-cache], then a per-path cache behavior can be used to specify a directory, file, or file type that your distribution will not cache.\n "]
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
  distribution_name: string }[@@ocaml.doc ""]
type nonrec update_distribution_bundle_result =
  {
  operation: operation option }[@@ocaml.doc ""]
type nonrec update_distribution_bundle_request =
  {
  bundle_id: string option ;
  distribution_name: string option }[@@ocaml.doc ""]
type nonrec tag = {
  value: string option ;
  key: string option }[@@ocaml.doc
                        "Describes a tag key and optional value assigned to an Amazon Lightsail resource.\n\n For more information about tags in Lightsail, see the {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n "]
type nonrec container_service_power_name =
  | Xlarge 
  | Large 
  | Medium 
  | Small 
  | Micro 
  | Nano [@@ocaml.doc ""]
type nonrec container_service_state =
  | DEPLOYING 
  | DISABLED 
  | DELETING 
  | UPDATING 
  | RUNNING 
  | READY 
  | PENDING [@@ocaml.doc ""]
type nonrec container_service_state_detail_code =
  | UNKNOWN_ERROR 
  | CERTIFICATE_LIMIT_EXCEEDED 
  | ACTIVATING_DEPLOYMENT 
  | EVALUATING_HEALTH_CHECK 
  | CREATING_DEPLOYMENT 
  | PROVISIONING_SERVICE 
  | PROVISIONING_CERTIFICATE 
  | CREATING_NETWORK_INFRASTRUCTURE 
  | CREATING_SYSTEM_RESOURCES [@@ocaml.doc ""]
type nonrec container_service_state_detail =
  {
  message: string option ;
  code: container_service_state_detail_code option }[@@ocaml.doc
                                                      "Describes the current state of a container service.\n"]
type nonrec container_service_deployment_state =
  | FAILED 
  | INACTIVE 
  | ACTIVE 
  | ACTIVATING [@@ocaml.doc ""]
type nonrec environment = (string * string) list[@@ocaml.doc ""]
type nonrec container_service_protocol =
  | UDP 
  | TCP 
  | HTTPS 
  | HTTP [@@ocaml.doc ""]
type nonrec port_map = (string * container_service_protocol) list[@@ocaml.doc
                                                                   ""]
type nonrec container =
  {
  ports: port_map option ;
  environment: environment option ;
  command: string list option ;
  image: string option }[@@ocaml.doc
                          "Describes the settings of a container that will be launched, or that is launched, to an Amazon Lightsail container service.\n"]
type nonrec container_map = (string * container) list[@@ocaml.doc ""]
type nonrec container_service_health_check_config =
  {
  success_codes: string option ;
  path: string option ;
  interval_seconds: int option ;
  timeout_seconds: int option ;
  unhealthy_threshold: int option ;
  healthy_threshold: int option }[@@ocaml.doc
                                   "Describes the health check configuration of an Amazon Lightsail container service.\n"]
type nonrec container_service_endpoint =
  {
  health_check: container_service_health_check_config option ;
  container_port: int option ;
  container_name: string option }[@@ocaml.doc
                                   "Describes the public endpoint configuration of a deployment of an Amazon Lightsail container service.\n"]
type nonrec container_service_deployment =
  {
  created_at: CoreTypes.Timestamp.t option ;
  public_endpoint: container_service_endpoint option ;
  containers: container_map option ;
  state: container_service_deployment_state option ;
  version: int option }[@@ocaml.doc
                         "Describes a container deployment configuration of an Amazon Lightsail container service.\n\n A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service.\n "]
type nonrec container_service_public_domains = (string * string list) list
[@@ocaml.doc ""]
type nonrec container_service_ecr_image_puller_role =
  {
  principal_arn: string option ;
  is_active: bool option }[@@ocaml.doc
                            "Describes the activation status of the role that you can use to grant an Amazon Lightsail container service access to Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n When activated, Lightsail creates an Identity and Access Management (IAM) role for the specified Lightsail container service. You can use the ARN of the role to create a trust relationship between your Lightsail container service and an Amazon ECR private repository in your Amazon Web Services account. This allows your container service to pull images from Amazon ECR private repositories. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec private_registry_access =
  {
  ecr_image_puller_role: container_service_ecr_image_puller_role option }
[@@ocaml.doc
  "Describes the configuration for an Amazon Lightsail container service to access private container image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
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
  container_service_name: string option }[@@ocaml.doc
                                           "Describes an Amazon Lightsail container service.\n"]
type nonrec update_container_service_result =
  {
  container_service: container_service option }[@@ocaml.doc ""]
type nonrec container_service_ecr_image_puller_role_request =
  {
  is_active: bool option }[@@ocaml.doc
                            "Describes a request to activate or deactivate the role that you can use to grant an Amazon Lightsail container service access to Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n When activated, Lightsail creates an Identity and Access Management (IAM) role for the specified Lightsail container service. You can use the ARN of the role to create a trust relationship between your Lightsail container service and an Amazon ECR private repository in your Amazon Web Services account. This allows your container service to pull images from Amazon ECR private repositories. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec private_registry_access_request =
  {
  ecr_image_puller_role:
    container_service_ecr_image_puller_role_request option }[@@ocaml.doc
                                                              "Describes a request to configure an Amazon Lightsail container service to access private container image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec update_container_service_request =
  {
  private_registry_access: private_registry_access_request option ;
  public_domain_names: container_service_public_domains option ;
  is_disabled: bool option ;
  scale: int option ;
  power: container_service_power_name option ;
  service_name: string }[@@ocaml.doc ""]
type nonrec access_type =
  | Private 
  | Public [@@ocaml.doc ""]
type nonrec access_rules =
  {
  allow_public_overrides: bool option ;
  get_object: access_type option }[@@ocaml.doc
                                    "Describes the anonymous access permissions for an Amazon Lightsail bucket and its objects.\n\n For more information about bucket access permissions, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-understanding-bucket-permissions}Understanding bucket permissions in Amazon Lightsail} in the \n \n   {i Amazon Lightsail Developer Guide}.\n  "]
type nonrec resource_receiving_access =
  {
  resource_type: string option ;
  name: string option }[@@ocaml.doc
                         "Describes an Amazon Lightsail instance that has access to a Lightsail bucket.\n"]
type nonrec bucket_state = {
  message: string option ;
  code: string option }[@@ocaml.doc
                         "Describes the state of an Amazon Lightsail bucket.\n"]
type nonrec bucket_access_log_config =
  {
  prefix: string option ;
  destination: string option ;
  enabled: bool }[@@ocaml.doc
                   "Describes the access log configuration for a bucket in the Amazon Lightsail object storage service.\n\n For more information about bucket access logs, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-bucket-access-logs}Logging bucket requests using access logging in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
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
  resource_type: string option }[@@ocaml.doc
                                  "Describes an Amazon Lightsail bucket.\n"]
type nonrec update_bucket_result =
  {
  operations: operation list option ;
  bucket: bucket option }[@@ocaml.doc ""]
type nonrec update_bucket_request =
  {
  access_log_config: bucket_access_log_config option ;
  readonly_access_accounts: string list option ;
  versioning: string option ;
  access_rules: access_rules option ;
  bucket_name: string }[@@ocaml.doc ""]
type nonrec update_bucket_bundle_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec update_bucket_bundle_request =
  {
  bundle_id: string ;
  bucket_name: string }[@@ocaml.doc ""]
type nonrec untag_resource_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string option ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec unpeer_vpc_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec unpeer_vpc_request = unit
type nonrec treat_missing_data =
  | Missing 
  | Ignore 
  | NotBreaching 
  | Breaching [@@ocaml.doc ""]
type nonrec time_period =
  {
  end_: CoreTypes.Timestamp.t option ;
  start: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                         "Sets the start date and end date for retrieving a cost estimate. The start date is inclusive, but the end date is exclusive. For example, if [start] is [2017-01-01] and [end] is [2017-05-01], then the cost and usage data is retrieved from [2017-01-01] up to and including [2017-04-30] but not including [2017-05-01].\n"]
type nonrec test_alarm_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec alarm_state =
  | INSUFFICIENT_DATA 
  | ALARM 
  | OK [@@ocaml.doc ""]
type nonrec test_alarm_request = {
  state: alarm_state ;
  alarm_name: string }[@@ocaml.doc ""]
type nonrec tag_resource_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag list ;
  resource_arn: string option ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec stop_relational_database_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec stop_relational_database_request =
  {
  relational_database_snapshot_name: string option ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec stop_instance_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec stop_instance_request =
  {
  force: bool option ;
  instance_name: string }[@@ocaml.doc ""]
type nonrec stop_instance_on_idle_request =
  {
  duration: string option ;
  threshold: string option }[@@ocaml.doc
                              "Describes a request to create or edit the [StopInstanceOnIdle] add-on.\n\n  This add-on only applies to Lightsail for Research resources.\n  \n   "]
type nonrec stop_gui_session_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec stop_gui_session_request = {
  resource_name: string }[@@ocaml.doc ""]
type nonrec status_type =
  | Inactive 
  | Active [@@ocaml.doc ""]
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
  | StartExpired [@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc "Describes a static IP.\n"]
type nonrec start_relational_database_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec start_relational_database_request =
  {
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec start_instance_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec start_instance_request = {
  instance_name: string }[@@ocaml.doc ""]
type nonrec start_gui_session_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec start_gui_session_request = {
  resource_name: string }[@@ocaml.doc ""]
type nonrec setup_instance_https_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec setup_instance_https_request =
  {
  certificate_provider: certificate_provider ;
  domain_names: string list ;
  email_address: string ;
  instance_name: string }[@@ocaml.doc ""]
type nonrec set_resource_access_for_bucket_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec resource_bucket_access =
  | Deny 
  | Allow [@@ocaml.doc ""]
type nonrec set_resource_access_for_bucket_request =
  {
  access: resource_bucket_access ;
  bucket_name: string ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec set_ip_address_type_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec ip_address_type =
  | IPV6 
  | IPV4 
  | DUALSTACK [@@ocaml.doc ""]
type nonrec set_ip_address_type_request =
  {
  accept_bundle_update: bool option ;
  ip_address_type: ip_address_type ;
  resource_name: string ;
  resource_type: resource_type }[@@ocaml.doc ""]
type nonrec session =
  {
  is_primary: bool option ;
  url: string option ;
  name: string option }[@@ocaml.doc
                         "Describes a web-based, remote graphical user interface (GUI), NICE DCV session. The session is used to access a virtual computer\226\128\153s operating system or application.\n"]
type nonrec send_contact_method_verification_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec contact_method_verification_protocol =
  | Email [@@ocaml.doc ""]
type nonrec send_contact_method_verification_request =
  {
  protocol: contact_method_verification_protocol }[@@ocaml.doc ""]
type nonrec pricing_unit =
  | Queries 
  | Bundles 
  | GBMo 
  | Hrs 
  | GB [@@ocaml.doc ""]
type nonrec currency =
  | USD [@@ocaml.doc ""]
type nonrec estimate_by_time =
  {
  time_period: time_period option ;
  currency: currency option ;
  unit_: float option ;
  pricing_unit: pricing_unit option ;
  usage_cost: float option }[@@ocaml.doc
                              "An estimate that's associated with a time period. \n"]
type nonrec cost_estimate =
  {
  results_by_time: estimate_by_time list option ;
  usage_type: string option }[@@ocaml.doc
                               "Describes the estimated cost for resources in your Lightsail for Research account.\n"]
type nonrec resource_budget_estimate =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  cost_estimates: cost_estimate list option ;
  resource_type: resource_type option ;
  resource_name: string option }[@@ocaml.doc
                                  "Describes the estimated cost or usage that a budget tracks.\n"]
type nonrec resource_record =
  {
  value: string option ;
  type_: string option ;
  name: string option }[@@ocaml.doc
                         "Describes the domain name system (DNS) records to add to your domain's DNS to validate it for an Amazon Lightsail certificate.\n"]
type nonrec reset_distribution_cache_result =
  {
  operation: operation option ;
  create_time: CoreTypes.Timestamp.t option ;
  status: string option }[@@ocaml.doc ""]
type nonrec reset_distribution_cache_request =
  {
  distribution_name: string option }[@@ocaml.doc ""]
type nonrec dns_record_creation_state_code =
  | Failed 
  | Started 
  | Succeeded [@@ocaml.doc ""]
type nonrec dns_record_creation_state =
  {
  message: string option ;
  code: dns_record_creation_state_code option }[@@ocaml.doc
                                                 "Describes the creation state of the canonical name (CNAME) records that are automatically added by Amazon Lightsail to the DNS of a domain to validate domain ownership for an SSL/TLS certificate.\n\n When you create an SSL/TLS certificate for a Lightsail resource, you must add a set of CNAME records to the DNS of the domains for the certificate to validate that you own the domains. Lightsail can automatically add the CNAME records to the DNS of the domain if the DNS zone for the domain exists within your Lightsail account. If automatic record addition fails, or if you manage the DNS of your domain using a third-party service, then you must manually add the CNAME records to the DNS of your domain. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/verify-tls-ssl-certificate-using-dns-cname-https}Verify an SSL/TLS certificate in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec certificate_domain_validation_status =
  | Success 
  | Failed 
  | PendingValidation [@@ocaml.doc ""]
type nonrec domain_validation_record =
  {
  validation_status: certificate_domain_validation_status option ;
  dns_record_creation_state: dns_record_creation_state option ;
  resource_record: resource_record option ;
  domain_name: string option }[@@ocaml.doc
                                "Describes the domain name system (DNS) records that you must add to the DNS of your registered domain to validate ownership for an Amazon Lightsail SSL/TLS certificate.\n"]
type nonrec renewal_status =
  | Failed 
  | Success 
  | PendingValidation 
  | PendingAutoRenewal [@@ocaml.doc ""]
type nonrec renewal_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  renewal_status_reason: string option ;
  renewal_status: renewal_status option ;
  domain_validation_records: domain_validation_record list option }[@@ocaml.doc
                                                                    "Describes the status of a SSL/TLS certificate renewal managed by Amazon Lightsail.\n"]
type nonrec release_static_ip_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec release_static_ip_request = {
  static_ip_name: string }[@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc "Describes a database snapshot.\n"]
type nonrec relational_database_password_version =
  | PENDING 
  | PREVIOUS 
  | CURRENT [@@ocaml.doc ""]
type nonrec relational_database_metric_name =
  | NetworkTransmitThroughput 
  | NetworkReceiveThroughput 
  | FreeStorageSpace 
  | DiskQueueDepth 
  | DatabaseConnections 
  | CPUUtilization [@@ocaml.doc ""]
type nonrec relational_database_hardware =
  {
  ram_size_in_gb: float option ;
  disk_size_in_gb: int option ;
  cpu_count: int option }[@@ocaml.doc
                           "Describes the hardware of a database.\n"]
type nonrec pending_modified_relational_database_values =
  {
  backup_retention_enabled: bool option ;
  engine_version: string option ;
  master_user_password: string option }[@@ocaml.doc
                                         "Describes a pending database value modification.\n"]
type nonrec relational_database_endpoint =
  {
  address: string option ;
  port: int option }[@@ocaml.doc "Describes an endpoint for a database.\n"]
type nonrec pending_maintenance_action =
  {
  current_apply_date: CoreTypes.Timestamp.t option ;
  description: string option ;
  action: string option }[@@ocaml.doc
                           "Describes a pending database maintenance action.\n"]
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
  name: string option }[@@ocaml.doc "Describes a database.\n"]
type nonrec relational_database_event =
  {
  event_categories: string list option ;
  message: string option ;
  created_at: CoreTypes.Timestamp.t option ;
  resource: string option }[@@ocaml.doc
                             "Describes an event for a database.\n"]
type nonrec relational_database_engine =
  | MYSQL [@@ocaml.doc ""]
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
  bundle_id: string option }[@@ocaml.doc
                              "Describes a database bundle. A bundle describes the performance specifications of the database.\n"]
type nonrec relational_database_blueprint =
  {
  is_engine_default: bool option ;
  engine_version_description: string option ;
  engine_description: string option ;
  engine_version: string option ;
  engine: relational_database_engine option ;
  blueprint_id: string option }[@@ocaml.doc
                                 "Describes a database image, or blueprint. A blueprint describes the major engine version of a database.\n"]
type nonrec name_servers_update_state_code =
  | Started 
  | Failed 
  | Pending 
  | Succeeded [@@ocaml.doc ""]
type nonrec name_servers_update_state =
  {
  message: string option ;
  code: name_servers_update_state_code option }[@@ocaml.doc
                                                 "Describes the state of the name server records update made by Amazon Lightsail to an Amazon Route\194\16053 registered domain.\n\n For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/understanding-dns-in-amazon-lightsail}DNS in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec r53_hosted_zone_deletion_state_code =
  | Started 
  | Failed 
  | Pending 
  | Succeeded [@@ocaml.doc ""]
type nonrec r53_hosted_zone_deletion_state =
  {
  message: string option ;
  code: r53_hosted_zone_deletion_state_code option }[@@ocaml.doc
                                                      "Describes the deletion state of an Amazon Route\194\16053 hosted zone for a domain that is being automatically delegated to an Amazon Lightsail DNS zone.\n"]
type nonrec registered_domain_delegation_info =
  {
  r53_hosted_zone_deletion_state: r53_hosted_zone_deletion_state option ;
  name_servers_update_state: name_servers_update_state option }[@@ocaml.doc
                                                                 "Describes the delegation state of an Amazon Route\194\16053 registered domain to Amazon Lightsail.\n\n When you delegate an Amazon Route\194\16053 registered domain to Lightsail, you can manage the DNS of the domain using a Lightsail DNS zone. You no longer use the Route\194\16053 hosted zone to manage the DNS of the domain. To delegate the domain, Lightsail automatically updates the domain's name servers in Route\194\16053 to the name servers of the Lightsail DNS zone. Then, Lightsail automatically deletes the Route\194\16053 hosted zone for the domain.\n \n  All of the following conditions must be true for automatic domain delegation to be successful:\n  \n   {ul\n         {-  The registered domain must be in the same Amazon Web Services account as the Lightsail account making the request.\n             \n              }\n         {-  The user or entity making the request must have permission to manage domains in Route\194\16053.\n             \n              }\n         {-  The Route\194\16053 hosted zone for the domain must be empty. It cannot contain DNS records other than start of authority (SOA) and name server records.\n             \n              }\n         }\n   If automatic domain delegation fails, or if you manage the DNS of your domain using a service other than Route\194\16053, then you must manually add the Lightsail DNS zone name servers to your domain in order to delegate management of its DNS to Lightsail. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/lightsail-how-to-create-dns-entry}Creating a DNS zone to manage your domain\226\128\153s records in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n   "]
type nonrec container_image =
  {
  created_at: CoreTypes.Timestamp.t option ;
  digest: string option ;
  image: string option }[@@ocaml.doc
                          "Describes a container image that is registered to an Amazon Lightsail container service.\n"]
type nonrec register_container_image_result =
  {
  container_image: container_image option }[@@ocaml.doc ""]
type nonrec register_container_image_request =
  {
  digest: string ;
  label: string ;
  service_name: string }[@@ocaml.doc ""]
type nonrec availability_zone =
  {
  state: string option ;
  zone_name: string option }[@@ocaml.doc
                              "Describes an Availability Zone. This is returned only as part of a [GetRegions] request.\n"]
type nonrec region =
  {
  relational_database_availability_zones: availability_zone list option ;
  availability_zones: availability_zone list option ;
  name: region_name option ;
  display_name: string option ;
  description: string option ;
  continent_code: string option }[@@ocaml.doc
                                   "Describes the Amazon Web Services Region.\n"]
type nonrec record_state =
  | Failed 
  | Succeeded 
  | Started [@@ocaml.doc ""]
type nonrec reboot_relational_database_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec reboot_relational_database_request =
  {
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec reboot_instance_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec reboot_instance_request = {
  instance_name: string }[@@ocaml.doc ""]
type nonrec put_instance_public_ports_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec network_protocol =
  | ICMPV6 
  | ICMP 
  | UDP 
  | ALL 
  | TCP [@@ocaml.doc ""]
type nonrec port_info =
  {
  cidr_list_aliases: string list option ;
  ipv6_cidrs: string list option ;
  cidrs: string list option ;
  protocol: network_protocol option ;
  to_port: int option ;
  from_port: int option }[@@ocaml.doc
                           "Describes ports to open on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.\n"]
type nonrec put_instance_public_ports_request =
  {
  instance_name: string ;
  port_infos: port_info list }[@@ocaml.doc ""]
type nonrec put_alarm_result = {
  operations: operation list option }[@@ocaml.doc ""]
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
  | CPUUtilization [@@ocaml.doc ""]
type nonrec comparison_operator =
  | LessThanOrEqualToThreshold 
  | LessThanThreshold 
  | GreaterThanThreshold 
  | GreaterThanOrEqualToThreshold [@@ocaml.doc ""]
type nonrec contact_protocol =
  | SMS 
  | Email [@@ocaml.doc ""]
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
  alarm_name: string }[@@ocaml.doc ""]
type nonrec port_state =
  | Closed 
  | Open [@@ocaml.doc ""]
type nonrec port_info_source_type =
  | Closed 
  | None 
  | Instance 
  | Default [@@ocaml.doc ""]
type nonrec port_access_type =
  | Private 
  | Public [@@ocaml.doc ""]
type nonrec peer_vpc_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec peer_vpc_request = unit
type nonrec password_data =
  {
  key_pair_name: string option ;
  ciphertext: string option }[@@ocaml.doc
                               "The password data for the Windows Server-based instance, including the ciphertext and the key pair name.\n"]
type nonrec origin =
  {
  response_timeout: int option ;
  protocol_policy: origin_protocol_policy_enum option ;
  region_name: region_name option ;
  resource_type: resource_type option ;
  name: string option }[@@ocaml.doc
                         "Describes the origin resource of an Amazon Lightsail content delivery network (CDN) distribution.\n\n An origin can be a Lightsail instance, bucket, or load balancer. A distribution pulls content from an origin, caches it, and serves it to viewers via a worldwide network of edge servers.\n "]
type nonrec open_instance_public_ports_result =
  {
  operation: operation option }[@@ocaml.doc ""]
type nonrec open_instance_public_ports_request =
  {
  instance_name: string ;
  port_info: port_info }[@@ocaml.doc ""]
type nonrec monthly_transfer = {
  gb_per_month_allocated: int option }[@@ocaml.doc
                                        "Describes the monthly data transfer in and out of your virtual private server (or {i instance}).\n"]
type nonrec monitored_resource_info =
  {
  resource_type: resource_type option ;
  name: string option ;
  arn: string option }[@@ocaml.doc
                        "Describes resource being monitored by an alarm.\n\n An alarm is a way to monitor your Amazon Lightsail resource metrics. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n "]
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
  | Seconds [@@ocaml.doc ""]
type nonrec metric_statistic =
  | SampleCount 
  | Average 
  | Sum 
  | Maximum 
  | Minimum [@@ocaml.doc ""]
type nonrec metric_datapoint =
  {
  unit_: metric_unit option ;
  timestamp_: CoreTypes.Timestamp.t option ;
  sum: float option ;
  sample_count: float option ;
  minimum: float option ;
  maximum: float option ;
  average: float option }[@@ocaml.doc "Describes the metric data point.\n"]
type nonrec log_event =
  {
  message: string option ;
  created_at: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                              "Describes a database log event.\n"]
type nonrec load_balancer_tls_policy =
  {
  ciphers: string list option ;
  protocols: string list option ;
  description: string option ;
  is_default: bool option ;
  name: string option }[@@ocaml.doc
                         "Describes the TLS security policies that are available for Lightsail load balancers.\n\n For more information about load balancer TLS security policies, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-configure-load-balancer-tls-security-policy}Configuring TLS security policies on your Amazon Lightsail load balancers} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec load_balancer_tls_certificate_summary =
  {
  is_attached: bool option ;
  name: string option }[@@ocaml.doc
                         "Provides a summary of SSL/TLS certificate metadata.\n"]
type nonrec load_balancer_tls_certificate_status =
  | Unknown 
  | Failed 
  | Revoked 
  | ValidationTimedOut 
  | Expired 
  | Inactive 
  | Issued 
  | PendingValidation [@@ocaml.doc ""]
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
  | Unspecified [@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_renewal_status =
  | Failed 
  | Success 
  | PendingValidation 
  | PendingAutoRenewal [@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_domain_status =
  | Success 
  | Failed 
  | PendingValidation [@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_domain_validation_option =
  {
  validation_status: load_balancer_tls_certificate_domain_status option ;
  domain_name: string option }[@@ocaml.doc
                                "Contains information about the domain names on an SSL/TLS certificate that you will use to validate domain ownership.\n"]
type nonrec load_balancer_tls_certificate_renewal_summary =
  {
  domain_validation_options:
    load_balancer_tls_certificate_domain_validation_option list option ;
  renewal_status: load_balancer_tls_certificate_renewal_status option }
[@@ocaml.doc
  "Contains information about the status of Lightsail's managed renewal for the certificate.\n\n The renewal status of the certificate.\n \n  The following renewal status are possible:\n  \n   {ul\n         {-   {b  [PendingAutoRenewal] } - Lightsail is attempting to automatically validate the domain names in the certificate. No further action is required. \n             \n              }\n         {-   {b  [PendingValidation] } - Lightsail couldn't automatically validate one or more domain names in the certificate. You must take action to validate these domain names or the certificate won't be renewed. If you used DNS validation, check to make sure your certificate's domain validation records exist in your domain's DNS, and that your certificate remains in use.\n             \n              }\n         {-   {b  [Success] } - All domain names in the certificate are validated, and Lightsail renewed the certificate. No further action is required. \n             \n              }\n         {-   {b  [Failed] } - One or more domain names were not validated before the certificate expired, and Lightsail did not renew the certificate. You can request a new certificate using the [CreateCertificate] action.\n             \n              }\n         }\n  "]
type nonrec load_balancer_tls_certificate_dns_record_creation_state_code =
  | Failed 
  | Started 
  | Succeeded [@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_dns_record_creation_state =
  {
  message: string option ;
  code: load_balancer_tls_certificate_dns_record_creation_state_code option }
[@@ocaml.doc
  "An object that describes the state of the canonical name (CNAME) records that are automatically added by Lightsail to the DNS of the domain to validate domain ownership.\n"]
type nonrec load_balancer_tls_certificate_domain_validation_record =
  {
  dns_record_creation_state:
    load_balancer_tls_certificate_dns_record_creation_state option ;
  domain_name: string option ;
  validation_status: load_balancer_tls_certificate_domain_status option ;
  value: string option ;
  type_: string option ;
  name: string option }[@@ocaml.doc
                         "Describes the validation record of each domain name in the SSL/TLS certificate.\n"]
type nonrec load_balancer_tls_certificate_failure_reason =
  | Other 
  | InvalidPublicDomain 
  | DomainNotAllowed 
  | AdditionalVerificationRequired 
  | NoAvailableContacts [@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc
                         "Describes a load balancer SSL/TLS certificate.\n\n TLS is just an updated, more secure version of Secure Socket Layer (SSL).\n "]
type nonrec load_balancer_state =
  | Unknown 
  | Failed 
  | ActiveImpaired 
  | Provisioning 
  | Active [@@ocaml.doc ""]
type nonrec load_balancer_protocol =
  | HTTP 
  | HTTP_HTTPS [@@ocaml.doc ""]
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
  | ClientTLSNegotiationErrorCount [@@ocaml.doc ""]
type nonrec instance_health_state =
  | Unavailable 
  | Draining 
  | Unused 
  | Unhealthy 
  | Healthy 
  | Initial [@@ocaml.doc ""]
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
  | LbRegistrationInProgress [@@ocaml.doc ""]
type nonrec instance_health_summary =
  {
  instance_health_reason: instance_health_reason option ;
  instance_health: instance_health_state option ;
  instance_name: string option }[@@ocaml.doc
                                  "Describes information about the health of the instance.\n"]
type nonrec load_balancer_configuration_options =
  (load_balancer_attribute_name * string) list[@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc "Describes a load balancer.\n"]
type nonrec is_vpc_peered_result = {
  is_peered: bool option }[@@ocaml.doc ""]
type nonrec is_vpc_peered_request = unit
type nonrec import_key_pair_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec import_key_pair_request =
  {
  public_key_base64: string ;
  key_pair_name: string }[@@ocaml.doc ""]
type nonrec get_static_ips_result =
  {
  next_page_token: string option ;
  static_ips: static_ip list option }[@@ocaml.doc ""]
type nonrec get_static_ips_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_static_ip_result = {
  static_ip: static_ip option }[@@ocaml.doc ""]
type nonrec get_static_ip_request = {
  static_ip_name: string }[@@ocaml.doc ""]
type nonrec get_setup_history_result =
  {
  next_page_token: string option ;
  setup_history: setup_history list option }[@@ocaml.doc ""]
type nonrec get_setup_history_request =
  {
  page_token: string option ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec get_relational_database_snapshots_result =
  {
  next_page_token: string option ;
  relational_database_snapshots: relational_database_snapshot list option }
[@@ocaml.doc ""]
type nonrec get_relational_database_snapshots_request =
  {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_relational_database_snapshot_result =
  {
  relational_database_snapshot: relational_database_snapshot option }
[@@ocaml.doc ""]
type nonrec get_relational_database_snapshot_request =
  {
  relational_database_snapshot_name: string }[@@ocaml.doc ""]
type nonrec get_relational_databases_result =
  {
  next_page_token: string option ;
  relational_databases: relational_database list option }[@@ocaml.doc ""]
type nonrec get_relational_databases_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_relational_database_parameters_result =
  {
  next_page_token: string option ;
  parameters: relational_database_parameter list option }[@@ocaml.doc ""]
type nonrec get_relational_database_parameters_request =
  {
  page_token: string option ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec get_relational_database_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: relational_database_metric_name option }[@@ocaml.doc ""]
type nonrec get_relational_database_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  period: int ;
  metric_name: relational_database_metric_name ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec get_relational_database_master_user_password_result =
  {
  created_at: CoreTypes.Timestamp.t option ;
  master_user_password: string option }[@@ocaml.doc ""]
type nonrec get_relational_database_master_user_password_request =
  {
  password_version: relational_database_password_version option ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec get_relational_database_log_streams_result =
  {
  log_streams: string list option }[@@ocaml.doc ""]
type nonrec get_relational_database_log_streams_request =
  {
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec get_relational_database_log_events_result =
  {
  next_forward_token: string option ;
  next_backward_token: string option ;
  resource_log_events: log_event list option }[@@ocaml.doc ""]
type nonrec get_relational_database_log_events_request =
  {
  page_token: string option ;
  start_from_head: bool option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  log_stream_name: string ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec get_relational_database_events_result =
  {
  next_page_token: string option ;
  relational_database_events: relational_database_event list option }
[@@ocaml.doc ""]
type nonrec get_relational_database_events_request =
  {
  page_token: string option ;
  duration_in_minutes: int option ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec get_relational_database_bundles_result =
  {
  next_page_token: string option ;
  bundles: relational_database_bundle list option }[@@ocaml.doc ""]
type nonrec get_relational_database_bundles_request =
  {
  include_inactive: bool option ;
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_relational_database_blueprints_result =
  {
  next_page_token: string option ;
  blueprints: relational_database_blueprint list option }[@@ocaml.doc ""]
type nonrec get_relational_database_blueprints_request =
  {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_relational_database_result =
  {
  relational_database: relational_database option }[@@ocaml.doc ""]
type nonrec get_relational_database_request =
  {
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec get_regions_result = {
  regions: region list option }[@@ocaml.doc ""]
type nonrec get_regions_request =
  {
  include_relational_database_availability_zones: bool option ;
  include_availability_zones: bool option }[@@ocaml.doc ""]
type nonrec get_operations_for_resource_result =
  {
  next_page_token: string option ;
  next_page_count: string option ;
  operations: operation list option }[@@ocaml.doc ""]
type nonrec get_operations_for_resource_request =
  {
  page_token: string option ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec get_operations_result =
  {
  next_page_token: string option ;
  operations: operation list option }[@@ocaml.doc ""]
type nonrec get_operations_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_operation_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec get_operation_request = {
  operation_id: string }[@@ocaml.doc ""]
type nonrec get_load_balancer_tls_policies_result =
  {
  next_page_token: string option ;
  tls_policies: load_balancer_tls_policy list option }[@@ocaml.doc ""]
type nonrec get_load_balancer_tls_policies_request =
  {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_load_balancer_tls_certificates_result =
  {
  tls_certificates: load_balancer_tls_certificate list option }[@@ocaml.doc
                                                                 ""]
type nonrec get_load_balancer_tls_certificates_request =
  {
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec get_load_balancers_result =
  {
  next_page_token: string option ;
  load_balancers: load_balancer list option }[@@ocaml.doc ""]
type nonrec get_load_balancers_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_load_balancer_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: load_balancer_metric_name option }[@@ocaml.doc ""]
type nonrec get_load_balancer_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  period: int ;
  metric_name: load_balancer_metric_name ;
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec get_load_balancer_result = {
  load_balancer: load_balancer option }[@@ocaml.doc ""]
type nonrec get_load_balancer_request = {
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec key_pair =
  {
  fingerprint: string option ;
  tags: tag list option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  support_code: string option ;
  arn: string option ;
  name: string option }[@@ocaml.doc "Describes an SSH key pair.\n"]
type nonrec get_key_pairs_result =
  {
  next_page_token: string option ;
  key_pairs: key_pair list option }[@@ocaml.doc ""]
type nonrec get_key_pairs_request =
  {
  include_default_key_pair: bool option ;
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_key_pair_result = {
  key_pair: key_pair option }[@@ocaml.doc ""]
type nonrec get_key_pair_request = {
  key_pair_name: string }[@@ocaml.doc ""]
type nonrec instance_state = {
  name: string option ;
  code: int option }[@@ocaml.doc
                      "Describes the virtual private server (or {i instance}) status.\n"]
type nonrec get_instance_state_result = {
  state: instance_state option }[@@ocaml.doc ""]
type nonrec get_instance_state_request = {
  instance_name: string }[@@ocaml.doc ""]
type nonrec instance_snapshot_state =
  | Available 
  | Error 
  | Pending [@@ocaml.doc ""]
type nonrec add_on =
  {
  duration: string option ;
  threshold: string option ;
  next_snapshot_time_of_day: string option ;
  snapshot_time_of_day: string option ;
  status: string option ;
  name: string option }[@@ocaml.doc
                         "Describes an add-on that is enabled for an Amazon Lightsail resource.\n"]
type nonrec disk_state =
  | Unknown 
  | InUse 
  | Available 
  | Error 
  | Pending [@@ocaml.doc ""]
type nonrec auto_mount_status =
  | NotMounted 
  | Mounted 
  | Pending 
  | Failed [@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc "Describes a block storage disk.\n"]
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
  name: string option }[@@ocaml.doc "Describes an instance snapshot.\n"]
type nonrec get_instance_snapshots_result =
  {
  next_page_token: string option ;
  instance_snapshots: instance_snapshot list option }[@@ocaml.doc ""]
type nonrec get_instance_snapshots_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_instance_snapshot_result =
  {
  instance_snapshot: instance_snapshot option }[@@ocaml.doc ""]
type nonrec get_instance_snapshot_request = {
  instance_snapshot_name: string }[@@ocaml.doc ""]
type nonrec instance_hardware =
  {
  ram_size_in_gb: float option ;
  disks: disk list option ;
  cpu_count: int option }[@@ocaml.doc
                           "Describes the hardware for the instance.\n"]
type nonrec access_direction =
  | Outbound 
  | Inbound [@@ocaml.doc ""]
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
  from_port: int option }[@@ocaml.doc
                           "Describes information about ports for an Amazon Lightsail instance.\n"]
type nonrec instance_networking =
  {
  ports: instance_port_info list option ;
  monthly_transfer: monthly_transfer option }[@@ocaml.doc
                                               "Describes monthly data transfer rates and port information for an instance.\n"]
type nonrec instance_metadata_state =
  | Applied 
  | Pending [@@ocaml.doc ""]
type nonrec instance_metadata_options =
  {
  http_protocol_ipv6: http_protocol_ipv6 option ;
  http_put_response_hop_limit: int option ;
  http_endpoint: http_endpoint option ;
  http_tokens: http_tokens option ;
  state: instance_metadata_state option }[@@ocaml.doc
                                           "The metadata options for the instance.\n"]
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
  name: string option }[@@ocaml.doc
                         "Describes an instance (a virtual private server).\n"]
type nonrec get_instances_result =
  {
  next_page_token: string option ;
  instances: instance list option }[@@ocaml.doc ""]
type nonrec get_instances_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec instance_port_state =
  {
  cidr_list_aliases: string list option ;
  ipv6_cidrs: string list option ;
  cidrs: string list option ;
  state: port_state option ;
  protocol: network_protocol option ;
  to_port: int option ;
  from_port: int option }[@@ocaml.doc
                           "Describes open ports on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.\n"]
type nonrec get_instance_port_states_result =
  {
  port_states: instance_port_state list option }[@@ocaml.doc ""]
type nonrec get_instance_port_states_request = {
  instance_name: string }[@@ocaml.doc ""]
type nonrec instance_metric_name =
  | MetadataNoToken 
  | BurstCapacityPercentage 
  | BurstCapacityTime 
  | StatusCheckFailed_System 
  | StatusCheckFailed_Instance 
  | StatusCheckFailed 
  | NetworkOut 
  | NetworkIn 
  | CPUUtilization [@@ocaml.doc ""]
type nonrec get_instance_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: instance_metric_name option }[@@ocaml.doc ""]
type nonrec get_instance_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  period: int ;
  metric_name: instance_metric_name ;
  instance_name: string }[@@ocaml.doc ""]
type nonrec instance_access_protocol =
  | Rdp 
  | Ssh [@@ocaml.doc ""]
type nonrec host_key_attributes =
  {
  not_valid_after: CoreTypes.Timestamp.t option ;
  not_valid_before: CoreTypes.Timestamp.t option ;
  fingerprint_sh_a256: string option ;
  fingerprint_sh_a1: string option ;
  witnessed_at: CoreTypes.Timestamp.t option ;
  public_key: string option ;
  algorithm: string option }[@@ocaml.doc
                              "Describes the public SSH host keys or the RDP certificate.\n"]
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
  cert_key: string option }[@@ocaml.doc
                             "The parameters for gaining temporary access to one of your Amazon Lightsail instances.\n"]
type nonrec get_instance_access_details_result =
  {
  access_details: instance_access_details option }[@@ocaml.doc ""]
type nonrec get_instance_access_details_request =
  {
  protocol: instance_access_protocol option ;
  instance_name: string }[@@ocaml.doc ""]
type nonrec get_instance_result = {
  instance: instance option }[@@ocaml.doc ""]
type nonrec get_instance_request = {
  instance_name: string }[@@ocaml.doc ""]
type nonrec export_snapshot_record_source_type =
  | DiskSnapshot 
  | InstanceSnapshot [@@ocaml.doc ""]
type nonrec disk_info =
  {
  is_system_disk: bool option ;
  size_in_gb: int option ;
  path: string option ;
  name: string option }[@@ocaml.doc "Describes a disk.\n"]
type nonrec instance_snapshot_info =
  {
  from_disk_info: disk_info list option ;
  from_blueprint_id: string option ;
  from_bundle_id: string option }[@@ocaml.doc
                                   "Describes an instance snapshot.\n"]
type nonrec disk_snapshot_info = {
  size_in_gb: int option }[@@ocaml.doc "Describes a disk snapshot.\n"]
type nonrec export_snapshot_record_source_info =
  {
  disk_snapshot_info: disk_snapshot_info option ;
  instance_snapshot_info: instance_snapshot_info option ;
  from_resource_arn: string option ;
  from_resource_name: string option ;
  arn: string option ;
  name: string option ;
  created_at: CoreTypes.Timestamp.t option ;
  resource_type: export_snapshot_record_source_type option }[@@ocaml.doc
                                                              "Describes the source of an export snapshot record.\n"]
type nonrec destination_info = {
  service: string option ;
  id: string option }[@@ocaml.doc "Describes the destination of a record.\n"]
type nonrec export_snapshot_record =
  {
  destination_info: destination_info option ;
  source_info: export_snapshot_record_source_info option ;
  state: record_state option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option }[@@ocaml.doc "Describes an export snapshot record.\n"]
type nonrec get_export_snapshot_records_result =
  {
  next_page_token: string option ;
  export_snapshot_records: export_snapshot_record list option }[@@ocaml.doc
                                                                 ""]
type nonrec get_export_snapshot_records_request =
  {
  page_token: string option }[@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc
                         "Describes a domain where you are storing recordsets.\n"]
type nonrec get_domains_result =
  {
  next_page_token: string option ;
  domains: domain list option }[@@ocaml.doc ""]
type nonrec get_domains_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_domain_result = {
  domain: domain option }[@@ocaml.doc ""]
type nonrec get_domain_request = {
  domain_name: string }[@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc
                         "Describes an Amazon Lightsail content delivery network (CDN) distribution.\n"]
type nonrec get_distributions_result =
  {
  next_page_token: string option ;
  distributions: lightsail_distribution list option }[@@ocaml.doc ""]
type nonrec get_distributions_request =
  {
  page_token: string option ;
  distribution_name: string option }[@@ocaml.doc ""]
type nonrec distribution_metric_name =
  | Http5xxErrorRate 
  | Http4xxErrorRate 
  | TotalErrorRate 
  | BytesUploaded 
  | BytesDownloaded 
  | Requests [@@ocaml.doc ""]
type nonrec get_distribution_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: distribution_metric_name option }[@@ocaml.doc ""]
type nonrec get_distribution_metric_data_request =
  {
  statistics: metric_statistic list ;
  unit_: metric_unit ;
  period: int ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  metric_name: distribution_metric_name ;
  distribution_name: string }[@@ocaml.doc ""]
type nonrec get_distribution_latest_cache_reset_result =
  {
  create_time: CoreTypes.Timestamp.t option ;
  status: string option }[@@ocaml.doc ""]
type nonrec get_distribution_latest_cache_reset_request =
  {
  distribution_name: string option }[@@ocaml.doc ""]
type nonrec distribution_bundle =
  {
  is_active: bool option ;
  transfer_per_month_in_gb: int option ;
  price: float option ;
  name: string option ;
  bundle_id: string option }[@@ocaml.doc
                              "Describes the specifications of a distribution bundle.\n"]
type nonrec get_distribution_bundles_result =
  {
  bundles: distribution_bundle list option }[@@ocaml.doc ""]
type nonrec get_distribution_bundles_request = unit
type nonrec disk_snapshot_state =
  | Unknown 
  | Error 
  | Completed 
  | Pending [@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc
                         "Describes a block storage disk snapshot.\n"]
type nonrec get_disk_snapshots_result =
  {
  next_page_token: string option ;
  disk_snapshots: disk_snapshot list option }[@@ocaml.doc ""]
type nonrec get_disk_snapshots_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_disk_snapshot_result = {
  disk_snapshot: disk_snapshot option }[@@ocaml.doc ""]
type nonrec get_disk_snapshot_request = {
  disk_snapshot_name: string }[@@ocaml.doc ""]
type nonrec get_disks_result =
  {
  next_page_token: string option ;
  disks: disk list option }[@@ocaml.doc ""]
type nonrec get_disks_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec get_disk_result = {
  disk: disk option }[@@ocaml.doc ""]
type nonrec get_disk_request = {
  disk_name: string }[@@ocaml.doc ""]
type nonrec get_cost_estimate_result =
  {
  resources_budget_estimate: resource_budget_estimate list option }[@@ocaml.doc
                                                                    ""]
type nonrec get_cost_estimate_request =
  {
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec container_services_list_result =
  {
  container_services: container_service list option }[@@ocaml.doc ""]
type nonrec get_container_services_request = {
  service_name: string option }[@@ocaml.doc ""]
type nonrec container_service_power =
  {
  is_active: bool option ;
  name: string option ;
  ram_size_in_gb: float option ;
  cpu_count: float option ;
  price: float option ;
  power_id: string option }[@@ocaml.doc
                             "Describes the powers that can be specified for an Amazon Lightsail container service.\n\n The power specifies the amount of RAM, the number of vCPUs, and the base price of the container service.\n "]
type nonrec get_container_service_powers_result =
  {
  powers: container_service_power list option }[@@ocaml.doc ""]
type nonrec get_container_service_powers_request = unit
type nonrec container_service_metric_name =
  | MemoryUtilization 
  | CPUUtilization [@@ocaml.doc ""]
type nonrec get_container_service_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: container_service_metric_name option }[@@ocaml.doc ""]
type nonrec get_container_service_metric_data_request =
  {
  statistics: metric_statistic list ;
  period: int ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  metric_name: container_service_metric_name ;
  service_name: string }[@@ocaml.doc ""]
type nonrec get_container_service_deployments_result =
  {
  deployments: container_service_deployment list option }[@@ocaml.doc ""]
type nonrec get_container_service_deployments_request =
  {
  service_name: string }[@@ocaml.doc ""]
type nonrec container_service_log_event =
  {
  message: string option ;
  created_at: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                              "Describes the log events of a container of an Amazon Lightsail container service.\n"]
type nonrec get_container_log_result =
  {
  next_page_token: string option ;
  log_events: container_service_log_event list option }[@@ocaml.doc ""]
type nonrec get_container_log_request =
  {
  page_token: string option ;
  filter_pattern: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  container_name: string ;
  service_name: string }[@@ocaml.doc ""]
type nonrec get_container_images_result =
  {
  container_images: container_image list option }[@@ocaml.doc ""]
type nonrec get_container_images_request = {
  service_name: string }[@@ocaml.doc ""]
type nonrec container_service_metadata_entry = (string * string) list
[@@ocaml.doc ""]
type nonrec get_container_api_metadata_result =
  {
  metadata: container_service_metadata_entry list option }[@@ocaml.doc ""]
type nonrec get_container_api_metadata_request = unit
type nonrec contact_method_status =
  | Invalid 
  | Valid 
  | PendingVerification [@@ocaml.doc ""]
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
  contact_endpoint: string option }[@@ocaml.doc
                                     "Describes a contact method.\n\n A contact method is a way to send you notifications. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.\n "]
type nonrec get_contact_methods_result =
  {
  contact_methods: contact_method list option }[@@ocaml.doc ""]
type nonrec get_contact_methods_request =
  {
  protocols: contact_protocol list option }[@@ocaml.doc ""]
type nonrec cloud_formation_stack_record_source_type =
  | ExportSnapshotRecord [@@ocaml.doc ""]
type nonrec cloud_formation_stack_record_source_info =
  {
  arn: string option ;
  name: string option ;
  resource_type: cloud_formation_stack_record_source_type option }[@@ocaml.doc
                                                                    "Describes the source of a CloudFormation stack record (i.e., the export snapshot record).\n"]
type nonrec cloud_formation_stack_record =
  {
  destination_info: destination_info option ;
  source_info: cloud_formation_stack_record_source_info list option ;
  state: record_state option ;
  resource_type: resource_type option ;
  location: resource_location option ;
  created_at: CoreTypes.Timestamp.t option ;
  arn: string option ;
  name: string option }[@@ocaml.doc
                         "Describes a CloudFormation stack record created as a result of the [create cloud\n        formation stack] action.\n\n A CloudFormation stack record provides information about the AWS CloudFormation stack used to create a new Amazon Elastic Compute Cloud instance from an exported Lightsail instance snapshot.\n "]
type nonrec get_cloud_formation_stack_records_result =
  {
  next_page_token: string option ;
  cloud_formation_stack_records: cloud_formation_stack_record list option }
[@@ocaml.doc ""]
type nonrec get_cloud_formation_stack_records_request =
  {
  page_token: string option }[@@ocaml.doc ""]
type nonrec certificate_status =
  | Failed 
  | Revoked 
  | ValidationTimedOut 
  | Expired 
  | Inactive 
  | Issued 
  | PendingValidation [@@ocaml.doc ""]
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
  arn: string option }[@@ocaml.doc
                        "Describes the full details of an Amazon Lightsail SSL/TLS certificate.\n\n  To get a summary of a certificate, use the [GetCertificates] action and omit [includeCertificateDetails] from your request. The response will include only the certificate Amazon Resource Name (ARN), certificate name, domain name, and tags.\n  \n   "]
type nonrec certificate_summary =
  {
  tags: tag list option ;
  certificate_detail: certificate option ;
  domain_name: string option ;
  certificate_name: string option ;
  certificate_arn: string option }[@@ocaml.doc
                                    "Describes an Amazon Lightsail SSL/TLS certificate.\n"]
type nonrec get_certificates_result =
  {
  next_page_token: string option ;
  certificates: certificate_summary list option }[@@ocaml.doc ""]
type nonrec get_certificates_request =
  {
  page_token: string option ;
  certificate_name: string option ;
  include_certificate_details: bool option ;
  certificate_statuses: certificate_status list option }[@@ocaml.doc ""]
type nonrec instance_platform =
  | Windows 
  | LinuxUnix [@@ocaml.doc ""]
type nonrec app_category =
  | LfR [@@ocaml.doc ""]
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
  price: float option }[@@ocaml.doc
                         "Describes a bundle, which is a set of specs describing your virtual private server (or {i instance}).\n"]
type nonrec get_bundles_result =
  {
  next_page_token: string option ;
  bundles: bundle list option }[@@ocaml.doc ""]
type nonrec get_bundles_request =
  {
  app_category: app_category option ;
  page_token: string option ;
  include_inactive: bool option }[@@ocaml.doc ""]
type nonrec account_level_bpa_sync_status =
  | Defaulted 
  | NeverSynced 
  | Failed 
  | InSync [@@ocaml.doc ""]
type nonrec bpa_status_message =
  | Unknown 
  | DEFAULTED_FOR_SLR_MISSING_ON_HOLD 
  | SYNC_ON_HOLD 
  | DEFAULTED_FOR_SLR_MISSING [@@ocaml.doc ""]
type nonrec account_level_bpa_sync =
  {
  bpa_impacts_lightsail: bool option ;
  message: bpa_status_message option ;
  last_synced_at: CoreTypes.Timestamp.t option ;
  status: account_level_bpa_sync_status option }[@@ocaml.doc
                                                  "Describes the synchronization status of the Amazon Simple Storage Service (Amazon S3) account-level block public access (BPA) feature for your Lightsail buckets.\n\n The account-level BPA feature of Amazon S3 provides centralized controls to limit public access to all Amazon S3 buckets in an account. BPA can make all Amazon S3 buckets in an Amazon Web Services account private regardless of the individual bucket and object permissions that are configured. Lightsail buckets take into account the Amazon S3 account-level BPA configuration when allowing or denying public access. To do this, Lightsail periodically fetches the account-level BPA configuration from Amazon S3. When the account-level BPA status is [InSync], the Amazon S3 account-level BPA configuration is synchronized and it applies to your Lightsail buckets. For more information about Amazon Simple Storage Service account-level BPA and how it affects Lightsail buckets, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-block-public-access-for-buckets}Block public access for buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec get_buckets_result =
  {
  account_level_bpa_sync: account_level_bpa_sync option ;
  next_page_token: string option ;
  buckets: bucket list option }[@@ocaml.doc ""]
type nonrec get_buckets_request =
  {
  include_connected_resources: bool option ;
  page_token: string option ;
  bucket_name: string option }[@@ocaml.doc ""]
type nonrec bucket_metric_name =
  | NumberOfObjects 
  | BucketSizeBytes [@@ocaml.doc ""]
type nonrec get_bucket_metric_data_result =
  {
  metric_data: metric_datapoint list option ;
  metric_name: bucket_metric_name option }[@@ocaml.doc ""]
type nonrec get_bucket_metric_data_request =
  {
  unit_: metric_unit ;
  statistics: metric_statistic list ;
  period: int ;
  end_time: CoreTypes.Timestamp.t ;
  start_time: CoreTypes.Timestamp.t ;
  metric_name: bucket_metric_name ;
  bucket_name: string }[@@ocaml.doc ""]
type nonrec bucket_bundle =
  {
  is_active: bool option ;
  transfer_per_month_in_gb: int option ;
  storage_per_month_in_gb: int option ;
  price: float option ;
  name: string option ;
  bundle_id: string option }[@@ocaml.doc
                              "Describes the specifications of a bundle that can be applied to an Amazon Lightsail bucket.\n\n A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket.\n "]
type nonrec get_bucket_bundles_result = {
  bundles: bucket_bundle list option }[@@ocaml.doc ""]
type nonrec get_bucket_bundles_request = {
  include_inactive: bool option }[@@ocaml.doc ""]
type nonrec access_key_last_used =
  {
  service_name: string option ;
  region: string option ;
  last_used_date: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                  "Describes the last time an access key was used.\n\n  This object does not include data in the response of a {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action.\n  \n   "]
type nonrec access_key =
  {
  last_used: access_key_last_used option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: status_type option ;
  secret_access_key: string option ;
  access_key_id: string option }[@@ocaml.doc
                                  "Describes an access key for an Amazon Lightsail bucket.\n\n Access keys grant full programmatic access to the specified bucket and its objects. You can have a maximum of two access keys per bucket. Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action to create an access key for a specific bucket. For more information about access keys, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n \n   The [secretAccessKey] value is returned only in response to the [CreateBucketAccessKey] action. You can get a secret access key only when you first create an access key; you cannot get the secret access key later. If you lose the secret access key, you must create a new access key.\n   \n    "]
type nonrec get_bucket_access_keys_result =
  {
  access_keys: access_key list option }[@@ocaml.doc ""]
type nonrec get_bucket_access_keys_request = {
  bucket_name: string }[@@ocaml.doc ""]
type nonrec blueprint_type =
  | App 
  | Os [@@ocaml.doc ""]
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
  blueprint_id: string option }[@@ocaml.doc
                                 "Describes a blueprint (a virtual private server image).\n"]
type nonrec get_blueprints_result =
  {
  next_page_token: string option ;
  blueprints: blueprint list option }[@@ocaml.doc ""]
type nonrec get_blueprints_request =
  {
  app_category: app_category option ;
  page_token: string option ;
  include_inactive: bool option }[@@ocaml.doc ""]
type nonrec auto_snapshot_status =
  | NOT_FOUND 
  | IN_PROGRESS 
  | FAILED 
  | SUCCESS [@@ocaml.doc ""]
type nonrec attached_disk = {
  size_in_gb: int option ;
  path: string option }[@@ocaml.doc
                         "Describes a block storage disk that is attached to an instance, and is included in an automatic snapshot.\n"]
type nonrec auto_snapshot_details =
  {
  from_attached_disks: attached_disk list option ;
  status: auto_snapshot_status option ;
  created_at: CoreTypes.Timestamp.t option ;
  date: string option }[@@ocaml.doc "Describes an automatic snapshot.\n"]
type nonrec get_auto_snapshots_result =
  {
  auto_snapshots: auto_snapshot_details list option ;
  resource_type: resource_type option ;
  resource_name: string option }[@@ocaml.doc ""]
type nonrec get_auto_snapshots_request = {
  resource_name: string }[@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc
                         "Describes an alarm.\n\n An alarm is a way to monitor your Lightsail resource metrics. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n "]
type nonrec get_alarms_result =
  {
  next_page_token: string option ;
  alarms: alarm list option }[@@ocaml.doc ""]
type nonrec get_alarms_request =
  {
  monitored_resource_name: string option ;
  page_token: string option ;
  alarm_name: string option }[@@ocaml.doc ""]
type nonrec get_active_names_result =
  {
  next_page_token: string option ;
  active_names: string list option }[@@ocaml.doc ""]
type nonrec get_active_names_request = {
  page_token: string option }[@@ocaml.doc ""]
type nonrec export_snapshot_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec export_snapshot_request = {
  source_snapshot_name: string }[@@ocaml.doc ""]
type nonrec enable_add_on_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec add_on_type =
  | StopInstanceOnIdle 
  | AutoSnapshot [@@ocaml.doc ""]
type nonrec auto_snapshot_add_on_request =
  {
  snapshot_time_of_day: string option }[@@ocaml.doc
                                         "Describes a request to enable or modify the automatic snapshot add-on for an Amazon Lightsail instance or disk.\n\n When you modify the automatic snapshot time for a resource, it is typically effective immediately except under the following conditions:\n \n  {ul\n        {-  If an automatic snapshot has been created for the current day, and you change the snapshot time to a later time of day, then the new snapshot time will be effective the following day. This ensures that two snapshots are not created for the current day.\n            \n             }\n        {-  If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to an earlier time of day, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day.\n            \n             }\n        {-  If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to a time that is within 30 minutes from your current time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.\n            \n             }\n        {-  If an automatic snapshot is scheduled to be created within 30 minutes from your current time and you change the snapshot time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.\n            \n             }\n        }\n  "]
type nonrec add_on_request =
  {
  stop_instance_on_idle_request: stop_instance_on_idle_request option ;
  auto_snapshot_add_on_request: auto_snapshot_add_on_request option ;
  add_on_type: add_on_type }[@@ocaml.doc
                              "Describes a request to enable, modify, or disable an add-on for an Amazon Lightsail resource.\n\n  An additional cost may be associated with enabling add-ons. For more information, see the {{:https://aws.amazon.com/lightsail/pricing/}Lightsail pricing page}.\n  \n   "]
type nonrec enable_add_on_request =
  {
  add_on_request: add_on_request ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec download_default_key_pair_result =
  {
  created_at: CoreTypes.Timestamp.t option ;
  private_key_base64: string option ;
  public_key_base64: string option }[@@ocaml.doc ""]
type nonrec download_default_key_pair_request = unit
type nonrec disable_add_on_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec disable_add_on_request =
  {
  resource_name: string ;
  add_on_type: add_on_type }[@@ocaml.doc ""]
type nonrec detach_static_ip_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec detach_static_ip_request = {
  static_ip_name: string }[@@ocaml.doc ""]
type nonrec detach_instances_from_load_balancer_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec detach_instances_from_load_balancer_request =
  {
  instance_names: string list ;
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec detach_disk_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec detach_disk_request = {
  disk_name: string }[@@ocaml.doc ""]
type nonrec detach_certificate_from_distribution_result =
  {
  operation: operation option }[@@ocaml.doc ""]
type nonrec detach_certificate_from_distribution_request =
  {
  distribution_name: string }[@@ocaml.doc ""]
type nonrec delete_relational_database_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_relational_database_snapshot_request =
  {
  relational_database_snapshot_name: string }[@@ocaml.doc ""]
type nonrec delete_relational_database_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_relational_database_request =
  {
  final_relational_database_snapshot_name: string option ;
  skip_final_snapshot: bool option ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec delete_load_balancer_tls_certificate_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_load_balancer_tls_certificate_request =
  {
  force: bool option ;
  certificate_name: string ;
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec delete_load_balancer_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_load_balancer_request = {
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec delete_known_host_keys_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_known_host_keys_request = {
  instance_name: string }[@@ocaml.doc ""]
type nonrec delete_key_pair_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec delete_key_pair_request =
  {
  expected_fingerprint: string option ;
  key_pair_name: string }[@@ocaml.doc ""]
type nonrec delete_instance_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_instance_snapshot_request =
  {
  instance_snapshot_name: string }[@@ocaml.doc ""]
type nonrec delete_instance_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_instance_request =
  {
  force_delete_add_ons: bool option ;
  instance_name: string }[@@ocaml.doc ""]
type nonrec delete_domain_entry_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec delete_domain_entry_request =
  {
  domain_entry: domain_entry ;
  domain_name: string }[@@ocaml.doc ""]
type nonrec delete_domain_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec delete_domain_request = {
  domain_name: string }[@@ocaml.doc ""]
type nonrec delete_distribution_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec delete_distribution_request = {
  distribution_name: string option }[@@ocaml.doc ""]
type nonrec delete_disk_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_disk_snapshot_request = {
  disk_snapshot_name: string }[@@ocaml.doc ""]
type nonrec delete_disk_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_disk_request =
  {
  force_delete_add_ons: bool option ;
  disk_name: string }[@@ocaml.doc ""]
type nonrec delete_container_service_result = unit
type nonrec delete_container_service_request = {
  service_name: string }[@@ocaml.doc ""]
type nonrec delete_container_image_result = unit
type nonrec delete_container_image_request =
  {
  image: string ;
  service_name: string }[@@ocaml.doc ""]
type nonrec delete_contact_method_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_contact_method_request = {
  protocol: contact_protocol }[@@ocaml.doc ""]
type nonrec delete_certificate_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_certificate_request = {
  certificate_name: string }[@@ocaml.doc ""]
type nonrec delete_bucket_access_key_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_bucket_access_key_request =
  {
  access_key_id: string ;
  bucket_name: string }[@@ocaml.doc ""]
type nonrec delete_bucket_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_bucket_request =
  {
  force_delete: bool option ;
  bucket_name: string }[@@ocaml.doc ""]
type nonrec delete_auto_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_auto_snapshot_request =
  {
  date: string ;
  resource_name: string }[@@ocaml.doc ""]
type nonrec delete_alarm_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec delete_alarm_request = {
  alarm_name: string }[@@ocaml.doc ""]
type nonrec create_relational_database_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec create_relational_database_snapshot_request =
  {
  tags: tag list option ;
  relational_database_snapshot_name: string ;
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec create_relational_database_from_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
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
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec create_relational_database_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
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
  relational_database_name: string }[@@ocaml.doc ""]
type nonrec create_load_balancer_tls_certificate_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec create_load_balancer_tls_certificate_request =
  {
  tags: tag list option ;
  certificate_alternative_names: string list option ;
  certificate_domain_name: string ;
  certificate_name: string ;
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec create_load_balancer_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
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
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec create_key_pair_result =
  {
  operation: operation option ;
  private_key_base64: string option ;
  public_key_base64: string option ;
  key_pair: key_pair option }[@@ocaml.doc ""]
type nonrec create_key_pair_request =
  {
  tags: tag list option ;
  key_pair_name: string }[@@ocaml.doc ""]
type nonrec create_instance_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec create_instance_snapshot_request =
  {
  tags: tag list option ;
  instance_name: string ;
  instance_snapshot_name: string }[@@ocaml.doc ""]
type nonrec create_instances_from_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec disk_map =
  {
  new_disk_name: string option ;
  original_disk_path: string option }[@@ocaml.doc
                                       "Describes a block storage disk mapping.\n"]
type nonrec attached_disk_map = (string * disk_map list) list[@@ocaml.doc ""]
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
  instance_names: string list }[@@ocaml.doc ""]
type nonrec create_instances_result = {
  operations: operation list option }[@@ocaml.doc ""]
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
  instance_names: string list }[@@ocaml.doc ""]
type nonrec create_gui_session_access_details_result =
  {
  sessions: session list option ;
  failure_reason: string option ;
  percentage_complete: int option ;
  status: status option ;
  resource_name: string option }[@@ocaml.doc ""]
type nonrec create_gui_session_access_details_request =
  {
  resource_name: string }[@@ocaml.doc ""]
type nonrec create_domain_entry_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec create_domain_entry_request =
  {
  domain_entry: domain_entry ;
  domain_name: string }[@@ocaml.doc ""]
type nonrec create_domain_result = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec create_domain_request =
  {
  tags: tag list option ;
  domain_name: string }[@@ocaml.doc ""]
type nonrec create_distribution_result =
  {
  operation: operation option ;
  distribution: lightsail_distribution option }[@@ocaml.doc ""]
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
  distribution_name: string }[@@ocaml.doc ""]
type nonrec create_disk_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec create_disk_snapshot_request =
  {
  tags: tag list option ;
  instance_name: string option ;
  disk_snapshot_name: string ;
  disk_name: string option }[@@ocaml.doc ""]
type nonrec create_disk_from_snapshot_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
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
  disk_name: string }[@@ocaml.doc ""]
type nonrec create_disk_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec create_disk_request =
  {
  add_ons: add_on_request list option ;
  tags: tag list option ;
  size_in_gb: int ;
  availability_zone: string ;
  disk_name: string }[@@ocaml.doc ""]
type nonrec container_service_registry_login =
  {
  registry: string option ;
  expires_at: CoreTypes.Timestamp.t option ;
  password: string option ;
  username: string option }[@@ocaml.doc
                             "Describes the sign-in credentials for the container image registry of an Amazon Lightsail account.\n"]
type nonrec create_container_service_registry_login_result =
  {
  registry_login: container_service_registry_login option }[@@ocaml.doc ""]
type nonrec create_container_service_registry_login_request = unit
type nonrec create_container_service_deployment_result =
  {
  container_service: container_service option }[@@ocaml.doc ""]
type nonrec endpoint_request =
  {
  health_check: container_service_health_check_config option ;
  container_port: int ;
  container_name: string }[@@ocaml.doc
                            "Describes the settings of a public endpoint for an Amazon Lightsail container service.\n"]
type nonrec create_container_service_deployment_request =
  {
  public_endpoint: endpoint_request option ;
  containers: container_map option ;
  service_name: string }[@@ocaml.doc ""]
type nonrec create_container_service_result =
  {
  container_service: container_service option }[@@ocaml.doc ""]
type nonrec container_service_deployment_request =
  {
  public_endpoint: endpoint_request option ;
  containers: container_map option }[@@ocaml.doc
                                      "Describes a container deployment configuration of an Amazon Lightsail container service.\n\n A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service.\n "]
type nonrec create_container_service_request =
  {
  private_registry_access: private_registry_access_request option ;
  deployment: container_service_deployment_request option ;
  public_domain_names: container_service_public_domains option ;
  tags: tag list option ;
  scale: int ;
  power: container_service_power_name ;
  service_name: string }[@@ocaml.doc ""]
type nonrec create_contact_method_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec create_contact_method_request =
  {
  contact_endpoint: string ;
  protocol: contact_protocol }[@@ocaml.doc ""]
type nonrec create_cloud_formation_stack_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec instance_entry =
  {
  availability_zone: string ;
  user_data: string option ;
  port_info_source: port_info_source_type ;
  instance_type: string ;
  source_name: string }[@@ocaml.doc
                         "Describes the Amazon Elastic Compute Cloud instance and related resources to be created using the [create cloud formation stack] operation.\n"]
type nonrec create_cloud_formation_stack_request =
  {
  instances: instance_entry list }[@@ocaml.doc ""]
type nonrec create_certificate_result =
  {
  operations: operation list option ;
  certificate: certificate_summary option }[@@ocaml.doc ""]
type nonrec create_certificate_request =
  {
  tags: tag list option ;
  subject_alternative_names: string list option ;
  domain_name: string ;
  certificate_name: string }[@@ocaml.doc ""]
type nonrec create_bucket_access_key_result =
  {
  operations: operation list option ;
  access_key: access_key option }[@@ocaml.doc ""]
type nonrec create_bucket_access_key_request = {
  bucket_name: string }[@@ocaml.doc ""]
type nonrec create_bucket_result =
  {
  operations: operation list option ;
  bucket: bucket option }[@@ocaml.doc ""]
type nonrec create_bucket_request =
  {
  enable_object_versioning: bool option ;
  tags: tag list option ;
  bundle_id: string ;
  bucket_name: string }[@@ocaml.doc ""]
type nonrec copy_snapshot_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec copy_snapshot_request =
  {
  source_region: region_name ;
  target_snapshot_name: string ;
  use_latest_restorable_auto_snapshot: bool option ;
  restore_date: string option ;
  source_resource_name: string option ;
  source_snapshot_name: string option }[@@ocaml.doc ""]
type nonrec close_instance_public_ports_result =
  {
  operation: operation option }[@@ocaml.doc ""]
type nonrec close_instance_public_ports_request =
  {
  instance_name: string ;
  port_info: port_info }[@@ocaml.doc ""]
type nonrec attach_static_ip_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec attach_static_ip_request =
  {
  instance_name: string ;
  static_ip_name: string }[@@ocaml.doc ""]
type nonrec attach_load_balancer_tls_certificate_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec attach_load_balancer_tls_certificate_request =
  {
  certificate_name: string ;
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec attach_instances_to_load_balancer_result =
  {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec attach_instances_to_load_balancer_request =
  {
  instance_names: string list ;
  load_balancer_name: string }[@@ocaml.doc ""]
type nonrec attach_disk_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec attach_disk_request =
  {
  auto_mounting: bool option ;
  disk_path: string ;
  instance_name: string ;
  disk_name: string }[@@ocaml.doc ""]
type nonrec attach_certificate_to_distribution_result =
  {
  operation: operation option }[@@ocaml.doc ""]
type nonrec attach_certificate_to_distribution_request =
  {
  certificate_name: string ;
  distribution_name: string }[@@ocaml.doc ""]
type nonrec allocate_static_ip_result = {
  operations: operation list option }[@@ocaml.doc ""]
type nonrec allocate_static_ip_request = {
  static_ip_name: string }[@@ocaml.doc ""]