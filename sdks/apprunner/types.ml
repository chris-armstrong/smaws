open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "apprunner";
      endpointPrefix = "apprunner";
      version = "2020-05-15";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec vpc_ingress_connection_summary =
  {
  service_arn: string option ;
  vpc_ingress_connection_arn: string option }[@@ocaml.doc
                                               "Provides summary information about an VPC Ingress Connection, which includes its VPC Ingress Connection ARN and its associated Service ARN.\n"]
type nonrec vpc_ingress_connection_status =
  | DELETED 
  | FAILED_DELETION 
  | FAILED_UPDATE 
  | FAILED_CREATION 
  | PENDING_DELETION 
  | PENDING_UPDATE 
  | PENDING_CREATION 
  | AVAILABLE [@@ocaml.doc ""]
type nonrec ingress_vpc_configuration =
  {
  vpc_endpoint_id: string option ;
  vpc_id: string option }[@@ocaml.doc
                           "The configuration of your VPC and the associated VPC endpoint. The VPC endpoint is an Amazon Web Services PrivateLink resource that allows access to your App Runner services from within an Amazon VPC.\n"]
type nonrec vpc_ingress_connection =
  {
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  ingress_vpc_configuration: ingress_vpc_configuration option ;
  domain_name: string option ;
  account_id: string option ;
  status: vpc_ingress_connection_status option ;
  service_arn: string option ;
  vpc_ingress_connection_name: string option ;
  vpc_ingress_connection_arn: string option }[@@ocaml.doc
                                               "The App Runner resource that specifies an App Runner endpoint for incoming traffic. It establishes a connection between a VPC interface endpoint and a App Runner service, to make your App Runner service accessible from only within an Amazon VPC.\n"]
type nonrec vpc_dns_target =
  {
  domain_name: string option ;
  vpc_id: string option ;
  vpc_ingress_connection_arn: string option }[@@ocaml.doc
                                               "DNS Target record for a custom domain of this Amazon VPC.\n"]
type nonrec vpc_connector_status =
  | INACTIVE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec vpc_connector =
  {
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: vpc_connector_status option ;
  security_groups: string list option ;
  subnets: string list option ;
  vpc_connector_revision: int option ;
  vpc_connector_arn: string option ;
  vpc_connector_name: string option }[@@ocaml.doc
                                       "Describes an App Runner VPC connector resource. A VPC connector describes the Amazon Virtual Private Cloud (Amazon VPC) that an App Runner service is associated with, and the subnets and security group that are used.\n\n Multiple revisions of a connector might have the same [Name] and different [Revision] values.\n \n   At this time, App Runner supports only one revision per name.\n   \n    "]
type nonrec update_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }[@@ocaml.doc ""]
type nonrec update_vpc_ingress_connection_request =
  {
  ingress_vpc_configuration: ingress_vpc_configuration ;
  vpc_ingress_connection_arn: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "A resource doesn't exist for the specified Amazon Resource Name (ARN) in your Amazon Web Services account.\n"]
type nonrec invalid_state_exception = {
  message: string option }[@@ocaml.doc
                            "You can't perform this action when the resource is in its current state.\n"]
type nonrec invalid_request_exception = {
  message: string option }[@@ocaml.doc
                            "One or more input parameters aren't valid. Refer to the API action's document page, correct the input parameters, and try the action again.\n"]
type nonrec internal_service_error_exception = {
  message: string option }[@@ocaml.doc
                            "An unexpected service exception occurred.\n"]
type nonrec service_status =
  | OPERATION_IN_PROGRESS 
  | PAUSED 
  | DELETE_FAILED 
  | DELETED 
  | RUNNING 
  | CREATE_FAILED [@@ocaml.doc ""]
type nonrec source_code_version_type =
  | BRANCH [@@ocaml.doc ""]
type nonrec source_code_version =
  {
  value: string ;
  type_: source_code_version_type }[@@ocaml.doc
                                     "Identifies a version of code that App Runner refers to within a source code repository.\n"]
type nonrec configuration_source =
  | API 
  | REPOSITORY [@@ocaml.doc ""]
type nonrec runtime =
  | NODEJS_18 
  | PYTHON_311 
  | RUBY_31 
  | PHP_81 
  | DOTNET_6 
  | GO_1 
  | NODEJS_16 
  | CORRETTO_11 
  | CORRETTO_8 
  | NODEJS_14 
  | NODEJS_12 
  | PYTHON_3 [@@ocaml.doc ""]
type nonrec runtime_environment_variables = (string * string) list[@@ocaml.doc
                                                                    ""]
type nonrec runtime_environment_secrets = (string * string) list[@@ocaml.doc
                                                                  ""]
type nonrec code_configuration_values =
  {
  runtime_environment_secrets: runtime_environment_secrets option ;
  runtime_environment_variables: runtime_environment_variables option ;
  port: string option ;
  start_command: string option ;
  build_command: string option ;
  runtime: runtime }[@@ocaml.doc
                      "Describes the basic configuration needed for building and running an App Runner service. This type doesn't support the full set of possible configuration options. Fur full configuration capabilities, use a [apprunner.yaml] file in the source code repository.\n"]
type nonrec code_configuration =
  {
  code_configuration_values: code_configuration_values option ;
  configuration_source: configuration_source }[@@ocaml.doc
                                                "Describes the configuration that App Runner uses to build and run an App Runner service from a source code repository.\n"]
type nonrec code_repository =
  {
  source_directory: string option ;
  code_configuration: code_configuration option ;
  source_code_version: source_code_version ;
  repository_url: string }[@@ocaml.doc
                            "Describes a source code repository.\n"]
type nonrec image_configuration =
  {
  runtime_environment_secrets: runtime_environment_secrets option ;
  port: string option ;
  start_command: string option ;
  runtime_environment_variables: runtime_environment_variables option }
[@@ocaml.doc
  "Describes the configuration that App Runner uses to run an App Runner service using an image pulled from a source image repository.\n"]
type nonrec image_repository_type =
  | ECR_PUBLIC 
  | ECR [@@ocaml.doc ""]
type nonrec image_repository =
  {
  image_repository_type: image_repository_type ;
  image_configuration: image_configuration option ;
  image_identifier: string }[@@ocaml.doc
                              "Describes a source image repository.\n"]
type nonrec authentication_configuration =
  {
  access_role_arn: string option ;
  connection_arn: string option }[@@ocaml.doc
                                   "Describes resources needed to authenticate access to some source repositories. The specific resource depends on the repository provider.\n"]
type nonrec source_configuration =
  {
  authentication_configuration: authentication_configuration option ;
  auto_deployments_enabled: bool option ;
  image_repository: image_repository option ;
  code_repository: code_repository option }[@@ocaml.doc
                                             "Describes the source deployed to an App Runner service. It can be a code or an image repository.\n"]
type nonrec instance_configuration =
  {
  instance_role_arn: string option ;
  memory: string option ;
  cpu: string option }[@@ocaml.doc
                        "Describes the runtime configuration of an App Runner service instance (scaling unit).\n"]
type nonrec encryption_configuration = {
  kms_key: string }[@@ocaml.doc
                     "Describes a custom encryption key that App Runner uses to encrypt copies of the source repository and service logs.\n"]
type nonrec health_check_protocol =
  | HTTP 
  | TCP [@@ocaml.doc ""]
type nonrec health_check_configuration =
  {
  unhealthy_threshold: int option ;
  healthy_threshold: int option ;
  timeout: int option ;
  interval: int option ;
  path: string option ;
  protocol: health_check_protocol option }[@@ocaml.doc
                                            "Describes the settings for the health check that App Runner performs to monitor the health of a service.\n"]
type nonrec auto_scaling_configuration_status =
  | INACTIVE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec auto_scaling_configuration_summary =
  {
  is_default: bool option ;
  has_associated_service: bool option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: auto_scaling_configuration_status option ;
  auto_scaling_configuration_revision: int option ;
  auto_scaling_configuration_name: string option ;
  auto_scaling_configuration_arn: string option }[@@ocaml.doc
                                                   "Provides summary information about an App Runner automatic scaling configuration resource.\n\n This type contains limited information about an auto scaling configuration. It includes only identification information, without configuration details. It's returned by the [ListAutoScalingConfigurations] action. Complete configuration information is returned by the [CreateAutoScalingConfiguration], [DescribeAutoScalingConfiguration], and [DeleteAutoScalingConfiguration] actions using the [AutoScalingConfiguration] type.\n "]
type nonrec egress_type =
  | VPC 
  | DEFAULT [@@ocaml.doc ""]
type nonrec egress_configuration =
  {
  vpc_connector_arn: string option ;
  egress_type: egress_type option }[@@ocaml.doc
                                     "Describes configuration settings related to outbound network traffic of an App Runner service.\n"]
type nonrec ingress_configuration = {
  is_publicly_accessible: bool option }[@@ocaml.doc
                                         "Network configuration settings for inbound network traffic.\n"]
type nonrec ip_address_type =
  | DUAL_STACK 
  | IPV4 [@@ocaml.doc ""]
type nonrec network_configuration =
  {
  ip_address_type: ip_address_type option ;
  ingress_configuration: ingress_configuration option ;
  egress_configuration: egress_configuration option }[@@ocaml.doc
                                                       "Describes configuration settings related to network traffic of an App Runner service. Consists of embedded objects for each configurable network feature.\n"]
type nonrec service_observability_configuration =
  {
  observability_configuration_arn: string option ;
  observability_enabled: bool }[@@ocaml.doc
                                 "Describes the observability configuration of an App Runner service. These are additional observability features, like tracing, that you choose to enable. They're configured in a separate resource that you associate with your service.\n"]
type nonrec service =
  {
  observability_configuration: service_observability_configuration option ;
  network_configuration: network_configuration ;
  auto_scaling_configuration_summary: auto_scaling_configuration_summary ;
  health_check_configuration: health_check_configuration option ;
  encryption_configuration: encryption_configuration option ;
  instance_configuration: instance_configuration ;
  source_configuration: source_configuration ;
  status: service_status ;
  deleted_at: CoreTypes.Timestamp.t option ;
  updated_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  service_url: string option ;
  service_arn: string ;
  service_id: string ;
  service_name: string }[@@ocaml.doc
                          "Describes an App Runner service. It can describe a service in any state, including deleted services.\n\n This type contains the full information about a service, including configuration details. It's returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html}CreateService}, {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html}DescribeService}, and {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html}DeleteService} actions. A subset of this information is returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html}ListServices} action using the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ServiceSummary.html}ServiceSummary} type.\n "]
type nonrec update_service_response =
  {
  operation_id: string ;
  service: service }[@@ocaml.doc ""]
type nonrec update_service_request =
  {
  observability_configuration: service_observability_configuration option ;
  network_configuration: network_configuration option ;
  health_check_configuration: health_check_configuration option ;
  auto_scaling_configuration_arn: string option ;
  instance_configuration: instance_configuration option ;
  source_configuration: source_configuration option ;
  service_arn: string }[@@ocaml.doc ""]
type nonrec auto_scaling_configuration =
  {
  is_default: bool option ;
  has_associated_service: bool option ;
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  max_size: int option ;
  min_size: int option ;
  max_concurrency: int option ;
  status: auto_scaling_configuration_status option ;
  latest: bool option ;
  auto_scaling_configuration_revision: int option ;
  auto_scaling_configuration_name: string option ;
  auto_scaling_configuration_arn: string option }[@@ocaml.doc
                                                   "Describes an App Runner automatic scaling configuration resource.\n\n A higher [MinSize] increases the spread of your App Runner service over more Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.\n \n  A lower [MaxSize] controls your cost. The tradeoff is lower responsiveness during peak demand.\n  \n   Multiple revisions of a configuration might have the same [AutoScalingConfigurationName] and different [AutoScalingConfigurationRevision] values.\n   "]
type nonrec update_default_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }[@@ocaml.doc ""]
type nonrec update_default_auto_scaling_configuration_request =
  {
  auto_scaling_configuration_arn: string }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec tracing_vendor =
  | AWSXRAY [@@ocaml.doc ""]
type nonrec trace_configuration = {
  vendor: tracing_vendor }[@@ocaml.doc
                            "Describes the configuration of the tracing feature within an App Runner observability configuration.\n"]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string option ;
  key: string option }[@@ocaml.doc
                        "Describes a tag that is applied to an App Runner resource. A tag is a metadata item consisting of a key-value pair.\n"]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec start_deployment_response = {
  operation_id: string }[@@ocaml.doc ""]
type nonrec start_deployment_request = {
  service_arn: string }[@@ocaml.doc ""]
type nonrec service_summary =
  {
  status: service_status option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  service_url: string option ;
  service_arn: string option ;
  service_id: string option ;
  service_name: string option }[@@ocaml.doc
                                 "Provides summary information for an App Runner service.\n\n This type contains limited information about a service. It doesn't include configuration details. It's returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html}ListServices} action. Complete service information is returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html}CreateService}, {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html}DescribeService}, and {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html}DeleteService} actions using the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_Service.html}Service} type.\n "]
type nonrec service_quota_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "App Runner can't create this resource. You've reached your account quota for this resource type.\n\n For App Runner per-resource quotas, see {{:https://docs.aws.amazon.com/general/latest/gr/apprunner.html}App Runner endpoints and quotas} in the {i Amazon Web Services General Reference}.\n "]
type nonrec resume_service_response =
  {
  operation_id: string option ;
  service: service }[@@ocaml.doc ""]
type nonrec resume_service_request = {
  service_arn: string }[@@ocaml.doc ""]
type nonrec provider_type =
  | BITBUCKET 
  | GITHUB [@@ocaml.doc ""]
type nonrec pause_service_response =
  {
  operation_id: string option ;
  service: service }[@@ocaml.doc ""]
type nonrec pause_service_request = {
  service_arn: string }[@@ocaml.doc ""]
type nonrec operation_type =
  | UPDATE_SERVICE 
  | DELETE_SERVICE 
  | RESUME_SERVICE 
  | PAUSE_SERVICE 
  | CREATE_SERVICE 
  | START_DEPLOYMENT [@@ocaml.doc ""]
type nonrec operation_status =
  | ROLLBACK_SUCCEEDED 
  | ROLLBACK_FAILED 
  | ROLLBACK_IN_PROGRESS 
  | SUCCEEDED 
  | FAILED 
  | IN_PROGRESS 
  | PENDING [@@ocaml.doc ""]
type nonrec operation_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  ended_at: CoreTypes.Timestamp.t option ;
  started_at: CoreTypes.Timestamp.t option ;
  target_arn: string option ;
  status: operation_status option ;
  type_: operation_type option ;
  id: string option }[@@ocaml.doc
                       "Provides summary information for an operation that occurred on an App Runner service.\n"]
type nonrec observability_configuration_summary =
  {
  observability_configuration_revision: int option ;
  observability_configuration_name: string option ;
  observability_configuration_arn: string option }[@@ocaml.doc
                                                    "Provides summary information about an App Runner observability configuration resource.\n\n This type contains limited information about an observability configuration. It includes only identification information, without configuration details. It's returned by the [ListObservabilityConfigurations] action. Complete configuration information is returned by the [CreateObservabilityConfiguration], [DescribeObservabilityConfiguration], and [DeleteObservabilityConfiguration] actions using the [ObservabilityConfiguration] type.\n "]
type nonrec observability_configuration_status =
  | INACTIVE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec observability_configuration =
  {
  deleted_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: observability_configuration_status option ;
  latest: bool option ;
  observability_configuration_revision: int option ;
  trace_configuration: trace_configuration option ;
  observability_configuration_name: string option ;
  observability_configuration_arn: string option }[@@ocaml.doc
                                                    "Describes an App Runner observability configuration resource. Multiple revisions of a configuration have the same [ObservabilityConfigurationName] and different [ObservabilityConfigurationRevision] values.\n\n The resource is designed to configure multiple features (currently one feature, tracing). This type contains optional members that describe the configuration of these features (currently one member, [TraceConfiguration]). If a feature member isn't specified, the feature isn't enabled.\n "]
type nonrec list_vpc_ingress_connections_response =
  {
  next_token: string option ;
  vpc_ingress_connection_summary_list: vpc_ingress_connection_summary list }
[@@ocaml.doc ""]
type nonrec list_vpc_ingress_connections_filter =
  {
  vpc_endpoint_id: string option ;
  service_arn: string option }[@@ocaml.doc
                                "Returns a list of VPC Ingress Connections based on the filter provided. It can return either [ServiceArn] or [VpcEndpointId], or both.\n"]
type nonrec list_vpc_ingress_connections_request =
  {
  next_token: string option ;
  max_results: int option ;
  filter: list_vpc_ingress_connections_filter option }[@@ocaml.doc ""]
type nonrec list_vpc_connectors_response =
  {
  next_token: string option ;
  vpc_connectors: vpc_connector list }[@@ocaml.doc ""]
type nonrec list_vpc_connectors_request =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_services_response =
  {
  next_token: string option ;
  service_summary_list: service_summary list }[@@ocaml.doc ""]
type nonrec list_services_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_services_for_auto_scaling_configuration_response =
  {
  next_token: string option ;
  service_arn_list: string list }[@@ocaml.doc ""]
type nonrec list_services_for_auto_scaling_configuration_request =
  {
  next_token: string option ;
  max_results: int option ;
  auto_scaling_configuration_arn: string }[@@ocaml.doc ""]
type nonrec list_operations_response =
  {
  next_token: string option ;
  operation_summary_list: operation_summary list option }[@@ocaml.doc ""]
type nonrec list_operations_request =
  {
  max_results: int option ;
  next_token: string option ;
  service_arn: string }[@@ocaml.doc ""]
type nonrec list_observability_configurations_response =
  {
  next_token: string option ;
  observability_configuration_summary_list:
    observability_configuration_summary list }[@@ocaml.doc ""]
type nonrec list_observability_configurations_request =
  {
  next_token: string option ;
  max_results: int option ;
  latest_only: bool option ;
  observability_configuration_name: string option }[@@ocaml.doc ""]
type nonrec connection_status =
  | DELETED 
  | ERROR 
  | AVAILABLE 
  | PENDING_HANDSHAKE [@@ocaml.doc ""]
type nonrec connection_summary =
  {
  created_at: CoreTypes.Timestamp.t option ;
  status: connection_status option ;
  provider_type: provider_type option ;
  connection_arn: string option ;
  connection_name: string option }[@@ocaml.doc
                                    "Provides summary information about an App Runner connection resource.\n"]
type nonrec list_connections_response =
  {
  next_token: string option ;
  connection_summary_list: connection_summary list }[@@ocaml.doc ""]
type nonrec list_connections_request =
  {
  next_token: string option ;
  max_results: int option ;
  connection_name: string option }[@@ocaml.doc ""]
type nonrec list_auto_scaling_configurations_response =
  {
  next_token: string option ;
  auto_scaling_configuration_summary_list:
    auto_scaling_configuration_summary list }[@@ocaml.doc ""]
type nonrec list_auto_scaling_configurations_request =
  {
  next_token: string option ;
  max_results: int option ;
  latest_only: bool option ;
  auto_scaling_configuration_name: string option }[@@ocaml.doc ""]
type nonrec certificate_validation_record_status =
  | FAILED 
  | SUCCESS 
  | PENDING_VALIDATION [@@ocaml.doc ""]
type nonrec certificate_validation_record =
  {
  status: certificate_validation_record_status option ;
  value: string option ;
  type_: string option ;
  name: string option }[@@ocaml.doc
                         "Describes a certificate CNAME record to add to your DNS. For more information, see {{:https://docs.aws.amazon.com/apprunner/latest/api/API_AssociateCustomDomain.html}AssociateCustomDomain}.\n"]
type nonrec custom_domain_association_status =
  | BINDING_CERTIFICATE 
  | PENDING_CERTIFICATE_DNS_VALIDATION 
  | DELETE_FAILED 
  | DELETING 
  | ACTIVE 
  | CREATE_FAILED 
  | CREATING [@@ocaml.doc ""]
type nonrec custom_domain =
  {
  status: custom_domain_association_status ;
  certificate_validation_records: certificate_validation_record list option ;
  enable_www_subdomain: bool ;
  domain_name: string }[@@ocaml.doc
                         "Describes a custom domain that's associated with an App Runner service.\n"]
type nonrec disassociate_custom_domain_response =
  {
  vpc_dns_targets: vpc_dns_target list ;
  custom_domain: custom_domain ;
  service_arn: string ;
  dns_target: string }[@@ocaml.doc ""]
type nonrec disassociate_custom_domain_request =
  {
  domain_name: string ;
  service_arn: string }[@@ocaml.doc ""]
type nonrec describe_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }[@@ocaml.doc ""]
type nonrec describe_vpc_ingress_connection_request =
  {
  vpc_ingress_connection_arn: string }[@@ocaml.doc ""]
type nonrec describe_vpc_connector_response = {
  vpc_connector: vpc_connector }[@@ocaml.doc ""]
type nonrec describe_vpc_connector_request = {
  vpc_connector_arn: string }[@@ocaml.doc ""]
type nonrec describe_service_response = {
  service: service }[@@ocaml.doc ""]
type nonrec describe_service_request = {
  service_arn: string }[@@ocaml.doc ""]
type nonrec describe_observability_configuration_response =
  {
  observability_configuration: observability_configuration }[@@ocaml.doc ""]
type nonrec describe_observability_configuration_request =
  {
  observability_configuration_arn: string }[@@ocaml.doc ""]
type nonrec describe_custom_domains_response =
  {
  next_token: string option ;
  vpc_dns_targets: vpc_dns_target list ;
  custom_domains: custom_domain list ;
  service_arn: string ;
  dns_target: string }[@@ocaml.doc ""]
type nonrec describe_custom_domains_request =
  {
  max_results: int option ;
  next_token: string option ;
  service_arn: string }[@@ocaml.doc ""]
type nonrec describe_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }[@@ocaml.doc ""]
type nonrec describe_auto_scaling_configuration_request =
  {
  auto_scaling_configuration_arn: string }[@@ocaml.doc ""]
type nonrec delete_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }[@@ocaml.doc ""]
type nonrec delete_vpc_ingress_connection_request =
  {
  vpc_ingress_connection_arn: string }[@@ocaml.doc ""]
type nonrec delete_vpc_connector_response = {
  vpc_connector: vpc_connector }[@@ocaml.doc ""]
type nonrec delete_vpc_connector_request = {
  vpc_connector_arn: string }[@@ocaml.doc ""]
type nonrec delete_service_response =
  {
  operation_id: string ;
  service: service }[@@ocaml.doc ""]
type nonrec delete_service_request = {
  service_arn: string }[@@ocaml.doc ""]
type nonrec delete_observability_configuration_response =
  {
  observability_configuration: observability_configuration }[@@ocaml.doc ""]
type nonrec delete_observability_configuration_request =
  {
  observability_configuration_arn: string }[@@ocaml.doc ""]
type nonrec connection =
  {
  created_at: CoreTypes.Timestamp.t option ;
  status: connection_status option ;
  provider_type: provider_type option ;
  connection_arn: string option ;
  connection_name: string option }[@@ocaml.doc
                                    "Describes an App Runner connection resource.\n"]
type nonrec delete_connection_response = {
  connection: connection option }[@@ocaml.doc ""]
type nonrec delete_connection_request = {
  connection_arn: string }[@@ocaml.doc ""]
type nonrec delete_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }[@@ocaml.doc ""]
type nonrec delete_auto_scaling_configuration_request =
  {
  delete_all_revisions: bool option ;
  auto_scaling_configuration_arn: string }[@@ocaml.doc ""]
type nonrec create_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection }[@@ocaml.doc ""]
type nonrec create_vpc_ingress_connection_request =
  {
  tags: tag list option ;
  ingress_vpc_configuration: ingress_vpc_configuration ;
  vpc_ingress_connection_name: string ;
  service_arn: string }[@@ocaml.doc ""]
type nonrec create_vpc_connector_response = {
  vpc_connector: vpc_connector }[@@ocaml.doc ""]
type nonrec create_vpc_connector_request =
  {
  tags: tag list option ;
  security_groups: string list option ;
  subnets: string list ;
  vpc_connector_name: string }[@@ocaml.doc ""]
type nonrec create_service_response =
  {
  operation_id: string ;
  service: service }[@@ocaml.doc ""]
type nonrec create_service_request =
  {
  observability_configuration: service_observability_configuration option ;
  network_configuration: network_configuration option ;
  auto_scaling_configuration_arn: string option ;
  health_check_configuration: health_check_configuration option ;
  encryption_configuration: encryption_configuration option ;
  tags: tag list option ;
  instance_configuration: instance_configuration option ;
  source_configuration: source_configuration ;
  service_name: string }[@@ocaml.doc ""]
type nonrec create_observability_configuration_response =
  {
  observability_configuration: observability_configuration }[@@ocaml.doc ""]
type nonrec create_observability_configuration_request =
  {
  tags: tag list option ;
  trace_configuration: trace_configuration option ;
  observability_configuration_name: string }[@@ocaml.doc ""]
type nonrec create_connection_response = {
  connection: connection }[@@ocaml.doc ""]
type nonrec create_connection_request =
  {
  tags: tag list option ;
  provider_type: provider_type ;
  connection_name: string }[@@ocaml.doc ""]
type nonrec create_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration }[@@ocaml.doc ""]
type nonrec create_auto_scaling_configuration_request =
  {
  tags: tag list option ;
  max_size: int option ;
  min_size: int option ;
  max_concurrency: int option ;
  auto_scaling_configuration_name: string }[@@ocaml.doc ""]
type nonrec associate_custom_domain_response =
  {
  vpc_dns_targets: vpc_dns_target list ;
  custom_domain: custom_domain ;
  service_arn: string ;
  dns_target: string }[@@ocaml.doc ""]
type nonrec associate_custom_domain_request =
  {
  enable_www_subdomain: bool option ;
  domain_name: string ;
  service_arn: string }[@@ocaml.doc ""]