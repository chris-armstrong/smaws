(** 
    AppRunner client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec vpc_ingress_connection_summary =
  {
  service_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service associated with the VPC Ingress Connection. \n"];
  vpc_ingress_connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the VPC Ingress Connection. \n"]}
[@@ocaml.doc
  "Provides summary information about an VPC Ingress Connection, which includes its VPC Ingress Connection ARN and its associated Service ARN.\n"]
type nonrec vpc_ingress_connection_status =
  | DELETED [@ocaml.doc ""]
  | FAILED_DELETION [@ocaml.doc ""]
  | FAILED_UPDATE [@ocaml.doc ""]
  | FAILED_CREATION [@ocaml.doc ""]
  | PENDING_DELETION [@ocaml.doc ""]
  | PENDING_UPDATE [@ocaml.doc ""]
  | PENDING_CREATION [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec ingress_vpc_configuration =
  {
  vpc_endpoint_id: string option
    [@ocaml.doc
      "The ID of the VPC endpoint that your App Runner service connects to. \n"];
  vpc_id: string option
    [@ocaml.doc "The ID of the VPC that is used for the VPC endpoint.\n"]}
[@@ocaml.doc
  "The configuration of your VPC and the associated VPC endpoint. The VPC endpoint is an Amazon Web Services PrivateLink resource that allows access to your App Runner services from within an Amazon VPC.\n"]
type nonrec vpc_ingress_connection =
  {
  deleted_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the App Runner service was deleted. It's in the Unix time stamp format.\n\n {ul\n       {-   Type: Timestamp \n           \n            }\n       {-   Required: No \n           \n            }\n       }\n  "];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the VPC Ingress Connection was created. It's in the Unix time stamp format.\n\n {ul\n       {-   Type: Timestamp \n           \n            }\n       {-   Required: Yes \n           \n            }\n       }\n  "];
  ingress_vpc_configuration: ingress_vpc_configuration option
    [@ocaml.doc
      "Specifications for the customer\226\128\153s VPC and related PrivateLink VPC endpoint that are used to associate with the VPC Ingress Connection resource.\n"];
  domain_name: string option
    [@ocaml.doc
      "The domain name associated with the VPC Ingress Connection resource.\n"];
  account_id: string option
    [@ocaml.doc
      "The Account Id you use to create the VPC Ingress Connection resource.\n"];
  status: vpc_ingress_connection_status option
    [@ocaml.doc
      "The current status of the VPC Ingress Connection. The VPC Ingress Connection displays one of the following statuses: [AVAILABLE], [PENDING_CREATION], [PENDING_UPDATE], [PENDING_DELETION],[FAILED_CREATION], [FAILED_UPDATE], [FAILED_DELETION], and [DELETED].. \n"];
  service_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the service associated with the VPC Ingress Connection. \n"];
  vpc_ingress_connection_name: string option
    [@ocaml.doc "The customer-provided VPC Ingress Connection name.\n"];
  vpc_ingress_connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the VPC Ingress Connection. \n"]}
[@@ocaml.doc
  "The App Runner resource that specifies an App Runner endpoint for incoming traffic. It establishes a connection between a VPC interface endpoint and a App Runner service, to make your App Runner service accessible from only within an Amazon VPC.\n"]
type nonrec vpc_dns_target =
  {
  domain_name: string option
    [@ocaml.doc
      "The domain name of your target DNS that is associated with the Amazon VPC.\n"];
  vpc_id: string option
    [@ocaml.doc
      "The ID of the Amazon VPC that is associated with the custom domain name of the target DNS.\n"];
  vpc_ingress_connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the VPC Ingress Connection that is associated with your service.\n"]}
[@@ocaml.doc "DNS Target record for a custom domain of this Amazon VPC.\n"]
type nonrec vpc_connector_status =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec vpc_connector =
  {
  deleted_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the VPC connector was deleted. It's in Unix time stamp format.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the VPC connector was created. It's in Unix time stamp format.\n"];
  status: vpc_connector_status option
    [@ocaml.doc
      "The current state of the VPC connector. If the status of a connector revision is [INACTIVE], it was deleted and can't be used. Inactive connector revisions are permanently removed some time after they are deleted.\n"];
  security_groups: string list option
    [@ocaml.doc
      "A list of IDs of security groups that App Runner uses for access to Amazon Web Services resources under the specified subnets. If not specified, App Runner uses the default security group of the Amazon VPC. The default security group allows all outbound traffic.\n"];
  subnets: string list option
    [@ocaml.doc
      "A list of IDs of subnets that App Runner uses for your service. All IDs are of subnets of a single Amazon VPC.\n"];
  vpc_connector_revision: int option
    [@ocaml.doc
      "The revision of this VPC connector. It's unique among all the active connectors ([\"Status\": \"ACTIVE\"]) that share the same [Name].\n\n  At this time, App Runner supports only one revision per name.\n  \n   "];
  vpc_connector_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of this VPC connector.\n"];
  vpc_connector_name: string option
    [@ocaml.doc "The customer-provided VPC connector name.\n"]}[@@ocaml.doc
                                                                 "Describes an App Runner VPC connector resource. A VPC connector describes the Amazon Virtual Private Cloud (Amazon VPC) that an App Runner service is associated with, and the subnets and security group that are used.\n\n Multiple revisions of a connector might have the same [Name] and different [Revision] values.\n \n   At this time, App Runner supports only one revision per name.\n   \n    "]
type nonrec update_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection
    [@ocaml.doc
      "A description of the App Runner VPC Ingress Connection resource that's updated by this request.\n"]}
[@@ocaml.doc ""]
type nonrec update_vpc_ingress_connection_request =
  {
  ingress_vpc_configuration: ingress_vpc_configuration
    [@ocaml.doc
      "Specifications for the customer\226\128\153s Amazon VPC and the related Amazon Web Services PrivateLink VPC endpoint that are used to update the VPC Ingress Connection resource.\n"];
  vpc_ingress_connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (Arn) for the App Runner VPC Ingress Connection resource that you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A resource doesn't exist for the specified Amazon Resource Name (ARN) in your Amazon Web Services account.\n"]
type nonrec invalid_state_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You can't perform this action when the resource is in its current state.\n"]
type nonrec invalid_request_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "One or more input parameters aren't valid. Refer to the API action's document page, correct the input parameters, and try the action again.\n"]
type nonrec internal_service_error_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "An unexpected service exception occurred.\n"]
type nonrec service_status =
  | OPERATION_IN_PROGRESS [@ocaml.doc ""]
  | PAUSED [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec source_code_version_type =
  | BRANCH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec source_code_version =
  {
  value: string
    [@ocaml.doc
      "A source code version.\n\n For a git-based repository, a branch name maps to a specific version. App Runner uses the most recent commit to the branch.\n "];
  type_: source_code_version_type
    [@ocaml.doc
      "The type of version identifier.\n\n For a git-based repository, branches represent versions.\n "]}
[@@ocaml.doc
  "Identifies a version of code that App Runner refers to within a source code repository.\n"]
type nonrec configuration_source =
  | API [@ocaml.doc ""]
  | REPOSITORY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec runtime =
  | NODEJS_18 [@ocaml.doc ""]
  | PYTHON_311 [@ocaml.doc ""]
  | RUBY_31 [@ocaml.doc ""]
  | PHP_81 [@ocaml.doc ""]
  | DOTNET_6 [@ocaml.doc ""]
  | GO_1 [@ocaml.doc ""]
  | NODEJS_16 [@ocaml.doc ""]
  | CORRETTO_11 [@ocaml.doc ""]
  | CORRETTO_8 [@ocaml.doc ""]
  | NODEJS_14 [@ocaml.doc ""]
  | NODEJS_12 [@ocaml.doc ""]
  | PYTHON_3 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec runtime_environment_variables = (string * string) list[@@ocaml.doc
                                                                    ""]
type nonrec runtime_environment_secrets = (string * string) list[@@ocaml.doc
                                                                  ""]
type nonrec code_configuration_values =
  {
  runtime_environment_secrets: runtime_environment_secrets option
    [@ocaml.doc
      "An array of key-value pairs representing the secrets and parameters that get referenced to your service as an environment variable. The supported values are either the full Amazon Resource Name (ARN) of the Secrets Manager secret or the full ARN of the parameter in the Amazon Web Services Systems Manager Parameter Store.\n\n  {ul\n        {-   If the Amazon Web Services Systems Manager Parameter Store parameter exists in the same Amazon Web Services Region as the service that you're launching, you can use either the full ARN or name of the secret. If the parameter exists in a different Region, then the full ARN must be specified. \n            \n             }\n        {-   Currently, cross account referencing of Amazon Web Services Systems Manager Parameter Store parameter is not supported. \n            \n             }\n        }\n   "];
  runtime_environment_variables: runtime_environment_variables option
    [@ocaml.doc
      "The environment variables that are available to your running App Runner service. An array of key-value pairs.\n"];
  port: string option
    [@ocaml.doc
      "The port that your application listens to in the container.\n\n Default: [8080] \n "];
  start_command: string option
    [@ocaml.doc "The command App Runner runs to start your application.\n"];
  build_command: string option
    [@ocaml.doc "The command App Runner runs to build your application.\n"];
  runtime: runtime
    [@ocaml.doc
      "A runtime environment type for building and running an App Runner service. It represents a programming language runtime.\n"]}
[@@ocaml.doc
  "Describes the basic configuration needed for building and running an App Runner service. This type doesn't support the full set of possible configuration options. Fur full configuration capabilities, use a [apprunner.yaml] file in the source code repository.\n"]
type nonrec code_configuration =
  {
  code_configuration_values: code_configuration_values option
    [@ocaml.doc
      "The basic configuration for building and running the App Runner service. Use it to quickly launch an App Runner service without providing a [apprunner.yaml] file in the source code repository (or ignoring the file if it exists).\n"];
  configuration_source: configuration_source
    [@ocaml.doc
      "The source of the App Runner configuration. Values are interpreted as follows:\n\n {ul\n       {-   [REPOSITORY] \226\128\147 App Runner reads configuration values from the [apprunner.yaml] file in the source code repository and ignores [CodeConfigurationValues].\n           \n            }\n       {-   [API] \226\128\147 App Runner uses configuration values provided in [CodeConfigurationValues] and ignores the [apprunner.yaml] file in the source code repository.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Describes the configuration that App Runner uses to build and run an App Runner service from a source code repository.\n"]
type nonrec code_repository =
  {
  source_directory: string option
    [@ocaml.doc
      "The path of the directory that stores source code and configuration files. The build and start commands also execute from here. The path is absolute from root and, if not specified, defaults to the repository root.\n"];
  code_configuration: code_configuration option
    [@ocaml.doc
      "Configuration for building and running the service from a source code repository.\n\n   [CodeConfiguration] is required only for [CreateService] request.\n  \n   "];
  source_code_version: source_code_version
    [@ocaml.doc
      "The version that should be used within the source code repository.\n"];
  repository_url: string
    [@ocaml.doc
      "The location of the repository that contains the source code.\n"]}
[@@ocaml.doc "Describes a source code repository.\n"]
type nonrec image_configuration =
  {
  runtime_environment_secrets: runtime_environment_secrets option
    [@ocaml.doc
      "An array of key-value pairs representing the secrets and parameters that get referenced to your service as an environment variable. The supported values are either the full Amazon Resource Name (ARN) of the Secrets Manager secret or the full ARN of the parameter in the Amazon Web Services Systems Manager Parameter Store.\n\n  {ul\n        {-   If the Amazon Web Services Systems Manager Parameter Store parameter exists in the same Amazon Web Services Region as the service that you're launching, you can use either the full ARN or name of the secret. If the parameter exists in a different Region, then the full ARN must be specified. \n            \n             }\n        {-   Currently, cross account referencing of Amazon Web Services Systems Manager Parameter Store parameter is not supported. \n            \n             }\n        }\n   "];
  port: string option
    [@ocaml.doc
      "The port that your application listens to in the container.\n\n Default: [8080] \n "];
  start_command: string option
    [@ocaml.doc
      "An optional command that App Runner runs to start the application in the source image. If specified, this command overrides the Docker image\226\128\153s default start command.\n"];
  runtime_environment_variables: runtime_environment_variables option
    [@ocaml.doc
      "Environment variables that are available to your running App Runner service. An array of key-value pairs.\n"]}
[@@ocaml.doc
  "Describes the configuration that App Runner uses to run an App Runner service using an image pulled from a source image repository.\n"]
type nonrec image_repository_type =
  | ECR_PUBLIC [@ocaml.doc ""]
  | ECR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec image_repository =
  {
  image_repository_type: image_repository_type
    [@ocaml.doc
      "The type of the image repository. This reflects the repository provider and whether the repository is private or public.\n"];
  image_configuration: image_configuration option
    [@ocaml.doc "Configuration for running the identified image.\n"];
  image_identifier: string
    [@ocaml.doc
      "The identifier of an image.\n\n For an image in Amazon Elastic Container Registry (Amazon ECR), this is an image name. For the image name format, see {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html}Pulling an image} in the {i Amazon ECR User Guide}.\n "]}
[@@ocaml.doc "Describes a source image repository.\n"]
type nonrec authentication_configuration =
  {
  access_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role that grants the App Runner service access to a source repository. It's required for ECR image repositories (but not for ECR Public repositories).\n"];
  connection_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner connection that enables the App Runner service to connect to a source repository. It's required for GitHub code repositories.\n"]}
[@@ocaml.doc
  "Describes resources needed to authenticate access to some source repositories. The specific resource depends on the repository provider.\n"]
type nonrec source_configuration =
  {
  authentication_configuration: authentication_configuration option
    [@ocaml.doc
      "Describes the resources that are needed to authenticate access to some source repositories.\n"];
  auto_deployments_enabled: bool option
    [@ocaml.doc
      "If [true], continuous integration from the source repository is enabled for the App Runner service. Each repository change (including any source code commit or new image version) starts a deployment.\n\n Default: App Runner sets to [false] for a source image that uses an ECR Public repository or an ECR repository that's in an Amazon Web Services account other than the one that the service is in. App Runner sets to [true] in all other cases (which currently include a source code repository or a source image using a same-account ECR repository).\n "];
  image_repository: image_repository option
    [@ocaml.doc
      "The description of a source image repository.\n\n You must provide either this member or [CodeRepository] (but not both).\n "];
  code_repository: code_repository option
    [@ocaml.doc
      "The description of a source code repository.\n\n You must provide either this member or [ImageRepository] (but not both).\n "]}
[@@ocaml.doc
  "Describes the source deployed to an App Runner service. It can be a code or an image repository.\n"]
type nonrec instance_configuration =
  {
  instance_role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that provides permissions to your App Runner service. These are permissions that your code needs when it calls any Amazon Web Services APIs.\n"];
  memory: string option
    [@ocaml.doc
      "The amount of memory, in MB or GB, reserved for each instance of your App Runner service.\n\n Default: [2 GB] \n "];
  cpu: string option
    [@ocaml.doc
      "The number of CPU units reserved for each instance of your App Runner service.\n\n Default: [1 vCPU] \n "]}
[@@ocaml.doc
  "Describes the runtime configuration of an App Runner service instance (scaling unit).\n"]
type nonrec encryption_configuration =
  {
  kms_key: string
    [@ocaml.doc "The ARN of the KMS key that's used for encryption.\n"]}
[@@ocaml.doc
  "Describes a custom encryption key that App Runner uses to encrypt copies of the source repository and service logs.\n"]
type nonrec health_check_protocol =
  | HTTP [@ocaml.doc ""]
  | TCP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec health_check_configuration =
  {
  unhealthy_threshold: int option
    [@ocaml.doc
      "The number of consecutive checks that must fail before App Runner decides that the service is unhealthy.\n\n Default: [5] \n "];
  healthy_threshold: int option
    [@ocaml.doc
      "The number of consecutive checks that must succeed before App Runner decides that the service is healthy.\n\n Default: [1] \n "];
  timeout: int option
    [@ocaml.doc
      "The time, in seconds, to wait for a health check response before deciding it failed.\n\n Default: [2] \n "];
  interval: int option
    [@ocaml.doc
      "The time interval, in seconds, between health checks.\n\n Default: [5] \n "];
  path: string option
    [@ocaml.doc
      "The URL that health check requests are sent to.\n\n  [Path] is only applicable when you set [Protocol] to [HTTP].\n \n  Default: [\"/\"] \n  "];
  protocol: health_check_protocol option
    [@ocaml.doc
      "The IP protocol that App Runner uses to perform health checks for your service.\n\n If you set [Protocol] to [HTTP], App Runner sends health check requests to the HTTP path specified by [Path].\n \n  Default: [TCP] \n  "]}
[@@ocaml.doc
  "Describes the settings for the health check that App Runner performs to monitor the health of a service.\n"]
type nonrec auto_scaling_configuration_status =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec auto_scaling_configuration_summary =
  {
  is_default: bool option
    [@ocaml.doc
      "Indicates if this auto scaling configuration should be used as the default for a new App Runner service that does not have an auto scaling configuration ARN specified during creation. Each account can have only one default [AutoScalingConfiguration] per region. The default [AutoScalingConfiguration] can be any revision under the same [AutoScalingConfigurationName].\n"];
  has_associated_service: bool option
    [@ocaml.doc
      "Indicates if this auto scaling configuration has an App Runner service associated with it. A value of [true] indicates one or more services are associated. A value of [false] indicates no services are associated.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the auto scaling configuration was created. It's in Unix time stamp format.\n"];
  status: auto_scaling_configuration_status option
    [@ocaml.doc
      "The current state of the auto scaling configuration. If the status of a configuration revision is [INACTIVE], it was deleted and can't be used. Inactive configuration revisions are permanently removed some time after they are deleted.\n"];
  auto_scaling_configuration_revision: int option
    [@ocaml.doc
      "The revision of this auto scaling configuration. It's unique among all the active configurations ([\"Status\": \"ACTIVE\"]) with the same [AutoScalingConfigurationName].\n"];
  auto_scaling_configuration_name: string option
    [@ocaml.doc
      "The customer-provided auto scaling configuration name. It can be used in multiple revisions of a configuration.\n"];
  auto_scaling_configuration_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of this auto scaling configuration.\n"]}
[@@ocaml.doc
  "Provides summary information about an App Runner automatic scaling configuration resource.\n\n This type contains limited information about an auto scaling configuration. It includes only identification information, without configuration details. It's returned by the [ListAutoScalingConfigurations] action. Complete configuration information is returned by the [CreateAutoScalingConfiguration], [DescribeAutoScalingConfiguration], and [DeleteAutoScalingConfiguration] actions using the [AutoScalingConfiguration] type.\n "]
type nonrec egress_type =
  | VPC [@ocaml.doc ""]
  | DEFAULT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec egress_configuration =
  {
  vpc_connector_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner VPC connector that you want to associate with your App Runner service. Only valid when [EgressType =\n        VPC].\n"];
  egress_type: egress_type option
    [@ocaml.doc
      "The type of egress configuration.\n\n Set to [DEFAULT] for access to resources hosted on public networks.\n \n  Set to [VPC] to associate your service to a custom VPC specified by [VpcConnectorArn].\n  "]}
[@@ocaml.doc
  "Describes configuration settings related to outbound network traffic of an App Runner service.\n"]
type nonrec ingress_configuration =
  {
  is_publicly_accessible: bool option
    [@ocaml.doc
      "Specifies whether your App Runner service is publicly accessible. To make the service publicly accessible set it to [True]. To make the service privately accessible, from only within an Amazon VPC set it to [False]. \n"]}
[@@ocaml.doc "Network configuration settings for inbound network traffic.\n"]
type nonrec ip_address_type =
  | DUAL_STACK [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec network_configuration =
  {
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "App Runner provides you with the option to choose between {i Internet Protocol version 4 (IPv4)} and {i dual stack} (IPv4 and IPv6) for your incoming public network configuration. This is an optional parameter. If you do not specify an [IpAddressType], it defaults to select IPv4.\n\n   Currently, App Runner supports dual stack for only Public endpoint. Only IPv4 is supported for Private endpoint. If you update a service that's using dual-stack Public endpoint to a Private endpoint, your App Runner service will default to support only IPv4 for Private endpoint and fail to receive traffic originating from IPv6 endpoint. \n  \n   "];
  ingress_configuration: ingress_configuration option
    [@ocaml.doc
      "Network configuration settings for inbound message traffic.\n"];
  egress_configuration: egress_configuration option
    [@ocaml.doc
      "Network configuration settings for outbound message traffic.\n"]}
[@@ocaml.doc
  "Describes configuration settings related to network traffic of an App Runner service. Consists of embedded objects for each configurable network feature.\n"]
type nonrec service_observability_configuration =
  {
  observability_configuration_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the observability configuration that is associated with the service. Specified only when [ObservabilityEnabled] is [true].\n\n Specify an ARN with a name and a revision number to associate that revision. For example: [arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing/3] \n \n  Specify just the name to associate the latest revision. For example: [arn:aws:apprunner:us-east-1:123456789012:observabilityconfiguration/xray-tracing] \n  "];
  observability_enabled: bool
    [@ocaml.doc
      "When [true], an observability configuration resource is associated with the service, and an [ObservabilityConfigurationArn] is specified.\n"]}
[@@ocaml.doc
  "Describes the observability configuration of an App Runner service. These are additional observability features, like tracing, that you choose to enable. They're configured in a separate resource that you associate with your service.\n"]
type nonrec service =
  {
  observability_configuration: service_observability_configuration option
    [@ocaml.doc "The observability configuration of this service.\n"];
  network_configuration: network_configuration
    [@ocaml.doc
      "Configuration settings related to network traffic of the web application that this service runs.\n"];
  auto_scaling_configuration_summary: auto_scaling_configuration_summary
    [@ocaml.doc
      "Summary information for the App Runner automatic scaling configuration resource that's associated with this service.\n"];
  health_check_configuration: health_check_configuration option
    [@ocaml.doc
      "The settings for the health check that App Runner performs to monitor the health of this service.\n"];
  encryption_configuration: encryption_configuration option
    [@ocaml.doc
      "The encryption key that App Runner uses to encrypt the service logs and the copy of the source repository that App Runner maintains for the service. It can be either a customer-provided encryption key or an Amazon Web Services managed key.\n"];
  instance_configuration: instance_configuration
    [@ocaml.doc
      "The runtime configuration of instances (scaling units) of this service.\n"];
  source_configuration: source_configuration
    [@ocaml.doc
      "The source deployed to the App Runner service. It can be a code or an image repository.\n"];
  status: service_status
    [@ocaml.doc
      "The current state of the App Runner service. These particular values mean the following.\n\n {ul\n       {-   [CREATE_FAILED] \226\128\147 The service failed to create. The failed service isn't usable, and still counts towards your service quota. To troubleshoot this failure, read the failure events and logs, change any parameters that need to be fixed, and rebuild your service using [UpdateService].\n           \n            }\n       {-   [DELETE_FAILED] \226\128\147 The service failed to delete and can't be successfully recovered. Retry the service deletion call to ensure that all related resources are removed.\n           \n            }\n       }\n  "];
  deleted_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the App Runner service was deleted. It's in the Unix time stamp format.\n"];
  updated_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the App Runner service was last updated at. It's in the Unix time stamp format.\n"];
  created_at: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The time when the App Runner service was created. It's in the Unix time stamp format.\n"];
  service_url: string option
    [@ocaml.doc
      "A subdomain URL that App Runner generated for this service. You can use this URL to access your service web application.\n"];
  service_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of this service.\n"];
  service_id: string
    [@ocaml.doc
      "An ID that App Runner generated for this service. It's unique within the Amazon Web Services Region.\n"];
  service_name: string [@ocaml.doc "The customer-provided service name.\n"]}
[@@ocaml.doc
  "Describes an App Runner service. It can describe a service in any state, including deleted services.\n\n This type contains the full information about a service, including configuration details. It's returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html}CreateService}, {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html}DescribeService}, and {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html}DeleteService} actions. A subset of this information is returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html}ListServices} action using the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ServiceSummary.html}ServiceSummary} type.\n "]
type nonrec update_service_response =
  {
  operation_id: string
    [@ocaml.doc
      "The unique ID of the asynchronous operation that this request started. You can use it combined with the [ListOperations] call to track the operation's progress.\n"];
  service: service
    [@ocaml.doc
      "A description of the App Runner service updated by this request. All configuration values in the returned [Service] structure reflect configuration changes that are being applied by this request.\n"]}
[@@ocaml.doc ""]
type nonrec update_service_request =
  {
  observability_configuration: service_observability_configuration option
    [@ocaml.doc "The observability configuration of your service.\n"];
  network_configuration: network_configuration option
    [@ocaml.doc
      "Configuration settings related to network traffic of the web application that the App Runner service runs.\n"];
  health_check_configuration: health_check_configuration option
    [@ocaml.doc
      "The settings for the health check that App Runner performs to monitor the health of the App Runner service.\n"];
  auto_scaling_configuration_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an App Runner automatic scaling configuration resource that you want to associate with the App Runner service.\n"];
  instance_configuration: instance_configuration option
    [@ocaml.doc
      "The runtime configuration to apply to instances (scaling units) of your service.\n"];
  source_configuration: source_configuration option
    [@ocaml.doc
      "The source configuration to apply to the App Runner service.\n\n You can change the configuration of the code or image repository that the service uses. However, you can't switch from code to image or the other way around. This means that you must provide the same structure member of [SourceConfiguration] that you originally included when you created the service. Specifically, you can include either [CodeRepository] or [ImageRepository]. To update the source configuration, set the values to members of the structure that you include.\n "];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec auto_scaling_configuration =
  {
  is_default: bool option
    [@ocaml.doc
      "Indicates if this auto scaling configuration should be used as the default for a new App Runner service that does not have an auto scaling configuration ARN specified during creation. Each account can have only one default [AutoScalingConfiguration] per region. The default [AutoScalingConfiguration] can be any revision under the same [AutoScalingConfigurationName].\n"];
  has_associated_service: bool option
    [@ocaml.doc
      "Indicates if this auto scaling configuration has an App Runner service associated with it. A value of [true] indicates one or more services are associated. A value of [false] indicates no services are associated.\n"];
  deleted_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the auto scaling configuration was deleted. It's in Unix time stamp format.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the auto scaling configuration was created. It's in Unix time stamp format.\n"];
  max_size: int option
    [@ocaml.doc
      "The maximum number of instances that a service scales up to. At most [MaxSize] instances actively serve traffic for your service.\n"];
  min_size: int option
    [@ocaml.doc
      "The minimum number of instances that App Runner provisions for a service. The service always has at least [MinSize] provisioned instances. Some of them actively serve traffic. The rest of them (provisioned and inactive instances) are a cost-effective compute capacity reserve and are ready to be quickly activated. You pay for memory usage of all the provisioned instances. You pay for CPU usage of only the active subset.\n\n App Runner temporarily doubles the number of provisioned instances during deployments, to maintain the same capacity for both old and new code.\n "];
  max_concurrency: int option
    [@ocaml.doc
      "The maximum number of concurrent requests that an instance processes. If the number of concurrent requests exceeds this limit, App Runner scales the service up.\n"];
  status: auto_scaling_configuration_status option
    [@ocaml.doc
      "The current state of the auto scaling configuration. If the status of a configuration revision is [INACTIVE], it was deleted and can't be used. Inactive configuration revisions are permanently removed some time after they are deleted.\n"];
  latest: bool option
    [@ocaml.doc
      "It's set to [true] for the configuration with the highest [Revision] among all configurations that share the same [AutoScalingConfigurationName]. It's set to [false] otherwise.\n"];
  auto_scaling_configuration_revision: int option
    [@ocaml.doc
      "The revision of this auto scaling configuration. It's unique among all the active configurations ([\"Status\": \"ACTIVE\"]) that share the same [AutoScalingConfigurationName].\n"];
  auto_scaling_configuration_name: string option
    [@ocaml.doc
      "The customer-provided auto scaling configuration name. It can be used in multiple revisions of a configuration.\n"];
  auto_scaling_configuration_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of this auto scaling configuration.\n"]}
[@@ocaml.doc
  "Describes an App Runner automatic scaling configuration resource.\n\n A higher [MinSize] increases the spread of your App Runner service over more Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.\n \n  A lower [MaxSize] controls your cost. The tradeoff is lower responsiveness during peak demand.\n  \n   Multiple revisions of a configuration might have the same [AutoScalingConfigurationName] and different [AutoScalingConfigurationRevision] values.\n   "]
type nonrec update_default_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration
    [@ocaml.doc
      "A description of the App Runner auto scaling configuration that was set as default.\n"]}
[@@ocaml.doc ""]
type nonrec update_default_auto_scaling_configuration_request =
  {
  auto_scaling_configuration_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want to set as the default.\n\n The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with either \n {[\n .../{i name} \n ]}\n  or \n {[\n .../{i name}/{i revision} \n ]}\n . If a revision isn't specified, the latest active revision is set as the default.\n "]}
[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc "A list of tag keys that you want to remove.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource that you want to remove tags from.\n\n It must be the ARN of an App Runner resource.\n "]}
[@@ocaml.doc ""]
type nonrec tracing_vendor =
  | AWSXRAY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec trace_configuration =
  {
  vendor: tracing_vendor
    [@ocaml.doc
      "The implementation provider chosen for tracing App Runner services.\n"]}
[@@ocaml.doc
  "Describes the configuration of the tracing feature within an App Runner observability configuration.\n"]
type nonrec tag =
  {
  value: string option [@ocaml.doc "The value of the tag.\n"];
  key: string option [@ocaml.doc "The key of the tag.\n"]}[@@ocaml.doc
                                                            "Describes a tag that is applied to an App Runner resource. A tag is a metadata item consisting of a key-value pair.\n"]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "A list of tag key-value pairs to add or update. If a key is new to the resource, the tag is added with the provided value. If a key is already associated with the resource, the value of the tag is updated.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource that you want to update tags for.\n\n It must be the ARN of an App Runner resource.\n "]}
[@@ocaml.doc ""]
type nonrec start_deployment_response =
  {
  operation_id: string
    [@ocaml.doc
      "The unique ID of the asynchronous operation that this request started. You can use it combined with the [ListOperations] call to track the operation's progress.\n"]}
[@@ocaml.doc ""]
type nonrec start_deployment_request =
  {
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want to manually deploy to.\n"]}
[@@ocaml.doc ""]
type nonrec service_summary =
  {
  status: service_status option
    [@ocaml.doc
      "The current state of the App Runner service. These particular values mean the following.\n\n {ul\n       {-   [CREATE_FAILED] \226\128\147 The service failed to create. The failed service isn't usable, and still counts towards your service quota. To troubleshoot this failure, read the failure events and logs, change any parameters that need to be fixed, and rebuild your service using [UpdateService].\n           \n            }\n       {-   [DELETE_FAILED] \226\128\147 The service failed to delete and can't be successfully recovered. Retry the service deletion call to ensure that all related resources are removed.\n           \n            }\n       }\n  "];
  updated_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the App Runner service was last updated. It's in theUnix time stamp format.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the App Runner service was created. It's in the Unix time stamp format.\n"];
  service_url: string option
    [@ocaml.doc
      "A subdomain URL that App Runner generated for this service. You can use this URL to access your service web application.\n"];
  service_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of this service.\n"];
  service_id: string option
    [@ocaml.doc
      "An ID that App Runner generated for this service. It's unique within the Amazon Web Services Region.\n"];
  service_name: string option
    [@ocaml.doc "The customer-provided service name.\n"]}[@@ocaml.doc
                                                           "Provides summary information for an App Runner service.\n\n This type contains limited information about a service. It doesn't include configuration details. It's returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListServices.html}ListServices} action. Complete service information is returned by the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_CreateService.html}CreateService}, {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DescribeService.html}DescribeService}, and {{:https://docs.aws.amazon.com/apprunner/latest/api/API_DeleteService.html}DeleteService} actions using the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_Service.html}Service} type.\n "]
type nonrec service_quota_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "App Runner can't create this resource. You've reached your account quota for this resource type.\n\n For App Runner per-resource quotas, see {{:https://docs.aws.amazon.com/general/latest/gr/apprunner.html}App Runner endpoints and quotas} in the {i Amazon Web Services General Reference}.\n "]
type nonrec resume_service_response =
  {
  operation_id: string option
    [@ocaml.doc
      "The unique ID of the asynchronous operation that this request started. You can use it combined with the [ListOperations] call to track the operation's progress.\n"];
  service: service
    [@ocaml.doc
      "A description of the App Runner service that this request just resumed.\n"]}
[@@ocaml.doc ""]
type nonrec resume_service_request =
  {
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want to resume.\n"]}
[@@ocaml.doc ""]
type nonrec provider_type =
  | BITBUCKET [@ocaml.doc ""]
  | GITHUB [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec pause_service_response =
  {
  operation_id: string option
    [@ocaml.doc
      "The unique ID of the asynchronous operation that this request started. You can use it combined with the [ListOperations] call to track the operation's progress.\n"];
  service: service
    [@ocaml.doc
      "A description of the App Runner service that this request just paused.\n"]}
[@@ocaml.doc ""]
type nonrec pause_service_request =
  {
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want to pause.\n"]}
[@@ocaml.doc ""]
type nonrec operation_type =
  | UPDATE_SERVICE [@ocaml.doc ""]
  | DELETE_SERVICE [@ocaml.doc ""]
  | RESUME_SERVICE [@ocaml.doc ""]
  | PAUSE_SERVICE [@ocaml.doc ""]
  | CREATE_SERVICE [@ocaml.doc ""]
  | START_DEPLOYMENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec operation_status =
  | ROLLBACK_SUCCEEDED [@ocaml.doc ""]
  | ROLLBACK_FAILED [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec operation_summary =
  {
  updated_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the operation was last updated. It's in the Unix time stamp format.\n"];
  ended_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the operation ended. It's in the Unix time stamp format.\n"];
  started_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the operation started. It's in the Unix time stamp format.\n"];
  target_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource that the operation acted on (for example, an App Runner service).\n"];
  status: operation_status option
    [@ocaml.doc "The current state of the operation.\n"];
  type_: operation_type option
    [@ocaml.doc
      "The type of operation. It indicates a specific action that occured.\n"];
  id: string option
    [@ocaml.doc
      "A unique ID of this operation. It's unique in the scope of the App Runner service.\n"]}
[@@ocaml.doc
  "Provides summary information for an operation that occurred on an App Runner service.\n"]
type nonrec observability_configuration_summary =
  {
  observability_configuration_revision: int option
    [@ocaml.doc
      "The revision of this observability configuration. It's unique among all the active configurations ([\"Status\": \"ACTIVE\"]) that share the same [ObservabilityConfigurationName].\n"];
  observability_configuration_name: string option
    [@ocaml.doc
      "The customer-provided observability configuration name. It can be used in multiple revisions of a configuration.\n"];
  observability_configuration_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of this observability configuration.\n"]}
[@@ocaml.doc
  "Provides summary information about an App Runner observability configuration resource.\n\n This type contains limited information about an observability configuration. It includes only identification information, without configuration details. It's returned by the [ListObservabilityConfigurations] action. Complete configuration information is returned by the [CreateObservabilityConfiguration], [DescribeObservabilityConfiguration], and [DeleteObservabilityConfiguration] actions using the [ObservabilityConfiguration] type.\n "]
type nonrec observability_configuration_status =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec observability_configuration =
  {
  deleted_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the observability configuration was deleted. It's in Unix time stamp format.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time when the observability configuration was created. It's in Unix time stamp format.\n"];
  status: observability_configuration_status option
    [@ocaml.doc
      "The current state of the observability configuration. If the status of a configuration revision is [INACTIVE], it was deleted and can't be used. Inactive configuration revisions are permanently removed some time after they are deleted.\n"];
  latest: bool option
    [@ocaml.doc
      "It's set to [true] for the configuration with the highest [Revision] among all configurations that share the same [ObservabilityConfigurationName]. It's set to [false] otherwise.\n"];
  observability_configuration_revision: int option
    [@ocaml.doc
      "The revision of this observability configuration. It's unique among all the active configurations ([\"Status\": \"ACTIVE\"]) that share the same [ObservabilityConfigurationName].\n"];
  trace_configuration: trace_configuration option
    [@ocaml.doc
      "The configuration of the tracing feature within this observability configuration. If not specified, tracing isn't enabled.\n"];
  observability_configuration_name: string option
    [@ocaml.doc
      "The customer-provided observability configuration name. It can be used in multiple revisions of a configuration.\n"];
  observability_configuration_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of this observability configuration.\n"]}
[@@ocaml.doc
  "Describes an App Runner observability configuration resource. Multiple revisions of a configuration have the same [ObservabilityConfigurationName] and different [ObservabilityConfigurationRevision] values.\n\n The resource is designed to configure multiple features (currently one feature, tracing). This type contains optional members that describe the configuration of these features (currently one member, [TraceConfiguration]). If a feature member isn't specified, the feature isn't enabled.\n "]
type nonrec list_vpc_ingress_connections_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  vpc_ingress_connection_summary_list: vpc_ingress_connection_summary list
    [@ocaml.doc
      "A list of summary information records for VPC Ingress Connections. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_vpc_ingress_connections_filter =
  {
  vpc_endpoint_id: string option
    [@ocaml.doc "The ID of a VPC Endpoint to filter by. \n"];
  service_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a service to filter by. \n"]}
[@@ocaml.doc
  "Returns a list of VPC Ingress Connections based on the filter provided. It can return either [ServiceArn] or [VpcEndpointId], or both.\n"]
type nonrec list_vpc_ingress_connections_request =
  {
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. It's used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones that are specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  filter: list_vpc_ingress_connections_filter option
    [@ocaml.doc
      "The VPC Ingress Connections to be listed based on either the Service Arn or Vpc Endpoint Id, or both.\n"]}
[@@ocaml.doc ""]
type nonrec list_vpc_connectors_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  vpc_connectors: vpc_connector list
    [@ocaml.doc
      "A list of information records for VPC connectors. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_vpc_connectors_request =
  {
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. It's used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones that are specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of the tag key-value pairs that are associated with the resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource that a tag list is requested for.\n\n It must be the ARN of an App Runner resource.\n "]}
[@@ocaml.doc ""]
type nonrec list_services_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  service_summary_list: service_summary list
    [@ocaml.doc
      "A list of service summary information records. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_services_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. Used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "]}
[@@ocaml.doc ""]
type nonrec list_services_for_auto_scaling_configuration_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  service_arn_list: string list
    [@ocaml.doc
      "A list of service ARN records. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_services_for_auto_scaling_configuration_request =
  {
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. It's used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  auto_scaling_configuration_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want to list the services for.\n\n The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with either \n {[\n .../{i name} \n ]}\n  or \n {[\n .../{i name}/{i revision} \n ]}\n . If a revision isn't specified, the latest active revision is used.\n "]}
[@@ocaml.doc ""]
type nonrec list_operations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  operation_summary_list: operation_summary list option
    [@ocaml.doc
      "A list of operation summary information records. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_operations_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. It's used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want a list of operations for.\n"]}
[@@ocaml.doc ""]
type nonrec list_observability_configurations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  observability_configuration_summary_list:
    observability_configuration_summary list
    [@ocaml.doc
      "A list of summary information records for observability configurations. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_observability_configurations_request =
  {
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. It's used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones that are specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  latest_only: bool option
    [@ocaml.doc
      "Set to [true] to list only the latest revision for each requested configuration name.\n\n Set to [false] to list all revisions for each requested configuration name.\n \n  Default: [true] \n  "];
  observability_configuration_name: string option
    [@ocaml.doc
      "The name of the App Runner observability configuration that you want to list. If specified, App Runner lists revisions that share this name. If not specified, App Runner returns revisions of all active configurations.\n"]}
[@@ocaml.doc ""]
type nonrec connection_status =
  | DELETED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
  | PENDING_HANDSHAKE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec connection_summary =
  {
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The App Runner connection creation time, expressed as a Unix time stamp.\n"];
  status: connection_status option
    [@ocaml.doc
      "The current state of the App Runner connection. When the state is [AVAILABLE], you can use the connection to create an App Runner service.\n"];
  provider_type: provider_type option
    [@ocaml.doc "The source repository provider.\n"];
  connection_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of this connection.\n"];
  connection_name: string option
    [@ocaml.doc "The customer-provided connection name.\n"]}[@@ocaml.doc
                                                              "Provides summary information about an App Runner connection resource.\n"]
type nonrec list_connections_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. Returned in a paginated request.\n"];
  connection_summary_list: connection_summary list
    [@ocaml.doc
      "A list of summary information records for connections. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_connections_request =
  {
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. Used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). Used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  connection_name: string option
    [@ocaml.doc
      "If specified, only this connection is returned. If not specified, the result isn't filtered by name.\n"]}
[@@ocaml.doc ""]
type nonrec list_auto_scaling_configurations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  auto_scaling_configuration_summary_list:
    auto_scaling_configuration_summary list
    [@ocaml.doc
      "A list of summary information records for auto scaling configurations. In a paginated request, the request returns up to [MaxResults] records for each call.\n"]}
[@@ocaml.doc ""]
type nonrec list_auto_scaling_configurations_request =
  {
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. It's used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones that are specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to include in each response (result page). It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  latest_only: bool option
    [@ocaml.doc
      "Set to [true] to list only the latest revision for each requested configuration name.\n\n Set to [false] to list all revisions for each requested configuration name.\n \n  Default: [true] \n  "];
  auto_scaling_configuration_name: string option
    [@ocaml.doc
      "The name of the App Runner auto scaling configuration that you want to list. If specified, App Runner lists revisions that share this name. If not specified, App Runner returns revisions of all active configurations.\n"]}
[@@ocaml.doc ""]
type nonrec certificate_validation_record_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | PENDING_VALIDATION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec certificate_validation_record =
  {
  status: certificate_validation_record_status option
    [@ocaml.doc
      "The current state of the certificate CNAME record validation. It should change to [SUCCESS] after App Runner completes validation with your DNS.\n"];
  value: string option [@ocaml.doc "The certificate CNAME record value.\n"];
  type_: string option [@ocaml.doc "The record type, always [CNAME].\n"];
  name: string option [@ocaml.doc "The certificate CNAME record name.\n"]}
[@@ocaml.doc
  "Describes a certificate CNAME record to add to your DNS. For more information, see {{:https://docs.aws.amazon.com/apprunner/latest/api/API_AssociateCustomDomain.html}AssociateCustomDomain}.\n"]
type nonrec custom_domain_association_status =
  | BINDING_CERTIFICATE [@ocaml.doc ""]
  | PENDING_CERTIFICATE_DNS_VALIDATION [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec custom_domain =
  {
  status: custom_domain_association_status
    [@ocaml.doc "The current state of the domain name association.\n"];
  certificate_validation_records: certificate_validation_record list option
    [@ocaml.doc
      "A list of certificate CNAME records that's used for this domain name.\n"];
  enable_www_subdomain: bool
    [@ocaml.doc
      "When [true], the subdomain \n{[\nwww.{i DomainName} \n]}\n is associated with the App Runner service in addition to the base domain.\n"];
  domain_name: string
    [@ocaml.doc
      "An associated custom domain endpoint. It can be a root domain (for example, [example.com]), a subdomain (for example, [login.example.com] or [admin.login.example.com]), or a wildcard (for example, [*.example.com]).\n"]}
[@@ocaml.doc
  "Describes a custom domain that's associated with an App Runner service.\n"]
type nonrec disassociate_custom_domain_response =
  {
  vpc_dns_targets: vpc_dns_target list
    [@ocaml.doc
      "DNS Target records for the custom domains of this Amazon VPC. \n"];
  custom_domain: custom_domain
    [@ocaml.doc
      "A description of the domain name that's being disassociated.\n"];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that a custom domain name is disassociated from.\n"];
  dns_target: string
    [@ocaml.doc
      "The App Runner subdomain of the App Runner service. The disassociated custom domain name was mapped to this target name.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_custom_domain_request =
  {
  domain_name: string
    [@ocaml.doc
      "The domain name that you want to disassociate from the App Runner service.\n"];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want to disassociate a custom domain name from.\n"]}
[@@ocaml.doc ""]
type nonrec describe_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection
    [@ocaml.doc
      "A description of the App Runner VPC Ingress Connection that you specified in this request.\n"]}
[@@ocaml.doc ""]
type nonrec describe_vpc_ingress_connection_request =
  {
  vpc_ingress_connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection that you want a description for.\n"]}
[@@ocaml.doc ""]
type nonrec describe_vpc_connector_response =
  {
  vpc_connector: vpc_connector
    [@ocaml.doc
      "A description of the App Runner VPC connector that you specified in this request.\n"]}
[@@ocaml.doc ""]
type nonrec describe_vpc_connector_request =
  {
  vpc_connector_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner VPC connector that you want a description for.\n\n The ARN must be a full VPC connector ARN.\n "]}
[@@ocaml.doc ""]
type nonrec describe_service_response =
  {
  service: service
    [@ocaml.doc
      "A full description of the App Runner service that you specified in this request.\n"]}
[@@ocaml.doc ""]
type nonrec describe_service_request =
  {
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want a description for.\n"]}
[@@ocaml.doc ""]
type nonrec describe_observability_configuration_response =
  {
  observability_configuration: observability_configuration
    [@ocaml.doc
      "A full description of the App Runner observability configuration that you specified in this request.\n"]}
[@@ocaml.doc ""]
type nonrec describe_observability_configuration_request =
  {
  observability_configuration_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner observability configuration that you want a description for.\n\n The ARN can be a full observability configuration ARN, or a partial ARN ending with either \n {[\n .../{i name} \n ]}\n  or \n {[\n .../{i name}/{i revision} \n ]}\n . If a revision isn't specified, the latest active revision is described.\n "]}
[@@ocaml.doc ""]
type nonrec describe_custom_domains_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token that you can pass in a subsequent request to get the next result page. It's returned in a paginated request.\n"];
  vpc_dns_targets: vpc_dns_target list
    [@ocaml.doc
      "DNS Target records for the custom domains of this Amazon VPC. \n"];
  custom_domains: custom_domain list
    [@ocaml.doc
      "A list of descriptions of custom domain names that are associated with the service. In a paginated request, the request returns up to [MaxResults] records per call.\n"];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service whose associated custom domain names you want to describe.\n"];
  dns_target: string
    [@ocaml.doc
      "The App Runner subdomain of the App Runner service. The associated custom domain names are mapped to this target name.\n"]}
[@@ocaml.doc ""]
type nonrec describe_custom_domains_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that each response (result page) can include. It's used for a paginated request.\n\n If you don't specify [MaxResults], the request retrieves all available results in a single response.\n "];
  next_token: string option
    [@ocaml.doc
      "A token from a previous result page. It's used for a paginated request. The request retrieves the next result page. All other parameter values must be identical to the ones that are specified in the initial request.\n\n If you don't specify [NextToken], the request retrieves the first result page.\n "];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want associated custom domain names to be described for.\n"]}
[@@ocaml.doc ""]
type nonrec describe_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration
    [@ocaml.doc
      "A full description of the App Runner auto scaling configuration that you specified in this request.\n"]}
[@@ocaml.doc ""]
type nonrec describe_auto_scaling_configuration_request =
  {
  auto_scaling_configuration_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want a description for.\n\n The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with either \n {[\n .../{i name} \n ]}\n  or \n {[\n .../{i name}/{i revision} \n ]}\n . If a revision isn't specified, the latest active revision is described.\n "]}
[@@ocaml.doc ""]
type nonrec delete_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection
    [@ocaml.doc
      "A description of the App Runner VPC Ingress Connection that this request just deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_vpc_ingress_connection_request =
  {
  vpc_ingress_connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner VPC Ingress Connection that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_vpc_connector_response =
  {
  vpc_connector: vpc_connector
    [@ocaml.doc
      "A description of the App Runner VPC connector that this request just deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_vpc_connector_request =
  {
  vpc_connector_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner VPC connector that you want to delete.\n\n The ARN must be a full VPC connector ARN.\n "]}
[@@ocaml.doc ""]
type nonrec delete_service_response =
  {
  operation_id: string
    [@ocaml.doc
      "The unique ID of the asynchronous operation that this request started. You can use it combined with the [ListOperations] call to track the operation's progress.\n"];
  service: service
    [@ocaml.doc
      "A description of the App Runner service that this request just deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_service_request =
  {
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_observability_configuration_response =
  {
  observability_configuration: observability_configuration
    [@ocaml.doc
      "A description of the App Runner observability configuration that this request just deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_observability_configuration_request =
  {
  observability_configuration_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner observability configuration that you want to delete.\n\n The ARN can be a full observability configuration ARN, or a partial ARN ending with either \n {[\n .../{i name} \n ]}\n  or \n {[\n .../{i name}/{i revision} \n ]}\n . If a revision isn't specified, the latest active revision is deleted.\n "]}
[@@ocaml.doc ""]
type nonrec connection =
  {
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The App Runner connection creation time, expressed as a Unix time stamp.\n"];
  status: connection_status option
    [@ocaml.doc
      "The current state of the App Runner connection. When the state is [AVAILABLE], you can use the connection to create an App Runner service.\n"];
  provider_type: provider_type option
    [@ocaml.doc "The source repository provider.\n"];
  connection_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of this connection.\n"];
  connection_name: string option
    [@ocaml.doc "The customer-provided connection name.\n"]}[@@ocaml.doc
                                                              "Describes an App Runner connection resource.\n"]
type nonrec delete_connection_response =
  {
  connection: connection option
    [@ocaml.doc
      "A description of the App Runner connection that this request just deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_connection_request =
  {
  connection_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner connection that you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration
    [@ocaml.doc
      "A description of the App Runner auto scaling configuration that this request just deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_auto_scaling_configuration_request =
  {
  delete_all_revisions: bool option
    [@ocaml.doc
      "Set to [true] to delete all of the revisions associated with the [AutoScalingConfigurationArn] parameter value.\n\n When [DeleteAllRevisions] is set to [true], the only valid value for the Amazon Resource Name (ARN) is a partial ARN ending with: [.../name].\n "];
  auto_scaling_configuration_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner auto scaling configuration that you want to delete.\n\n The ARN can be a full auto scaling configuration ARN, or a partial ARN ending with either \n {[\n .../{i name} \n ]}\n  or \n {[\n .../{i name}/{i revision} \n ]}\n . If a revision isn't specified, the latest active revision is deleted.\n "]}
[@@ocaml.doc ""]
type nonrec create_vpc_ingress_connection_response =
  {
  vpc_ingress_connection: vpc_ingress_connection
    [@ocaml.doc
      "A description of the App Runner VPC Ingress Connection resource that's created by this request. \n"]}
[@@ocaml.doc ""]
type nonrec create_vpc_ingress_connection_request =
  {
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the VPC Ingress Connection resource. A tag is a key-value pair.\n"];
  ingress_vpc_configuration: ingress_vpc_configuration
    [@ocaml.doc
      "Specifications for the customer\226\128\153s Amazon VPC and the related Amazon Web Services PrivateLink VPC endpoint that are used to create the VPC Ingress Connection resource.\n"];
  vpc_ingress_connection_name: string
    [@ocaml.doc
      "A name for the VPC Ingress Connection resource. It must be unique across all the active VPC Ingress Connections in your Amazon Web Services account in the Amazon Web Services Region. \n"];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for this App Runner service that is used to create the VPC Ingress Connection resource.\n"]}
[@@ocaml.doc ""]
type nonrec create_vpc_connector_response =
  {
  vpc_connector: vpc_connector
    [@ocaml.doc
      "A description of the App Runner VPC connector that's created by this request.\n"]}
[@@ocaml.doc ""]
type nonrec create_vpc_connector_request =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of metadata items that you can associate with your VPC connector resource. A tag is a key-value pair.\n"];
  security_groups: string list option
    [@ocaml.doc
      "A list of IDs of security groups that App Runner should use for access to Amazon Web Services resources under the specified subnets. If not specified, App Runner uses the default security group of the Amazon VPC. The default security group allows all outbound traffic.\n"];
  subnets: string list
    [@ocaml.doc
      "A list of IDs of subnets that App Runner should use when it associates your service with a custom Amazon VPC. Specify IDs of subnets of a single Amazon VPC. App Runner determines the Amazon VPC from the subnets you specify.\n\n   App Runner currently only provides support for IPv4. \n  \n   "];
  vpc_connector_name: string [@ocaml.doc "A name for the VPC connector.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_response =
  {
  operation_id: string
    [@ocaml.doc
      "The unique ID of the asynchronous operation that this request started. You can use it combined with the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html}ListOperations} call to track the operation's progress.\n"];
  service: service
    [@ocaml.doc
      "A description of the App Runner service that's created by this request.\n"]}
[@@ocaml.doc ""]
type nonrec create_service_request =
  {
  observability_configuration: service_observability_configuration option
    [@ocaml.doc "The observability configuration of your service.\n"];
  network_configuration: network_configuration option
    [@ocaml.doc
      "Configuration settings related to network traffic of the web application that the App Runner service runs.\n"];
  auto_scaling_configuration_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an App Runner automatic scaling configuration resource that you want to associate with your service. If not provided, App Runner associates the latest revision of a default auto scaling configuration.\n\n Specify an ARN with a name and a revision number to associate that revision. For example: [arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability/3] \n \n  Specify just the name to associate the latest revision. For example: [arn:aws:apprunner:us-east-1:123456789012:autoscalingconfiguration/high-availability] \n  "];
  health_check_configuration: health_check_configuration option
    [@ocaml.doc
      "The settings for the health check that App Runner performs to monitor the health of the App Runner service.\n"];
  encryption_configuration: encryption_configuration option
    [@ocaml.doc
      "An optional custom encryption key that App Runner uses to encrypt the copy of your source repository that it maintains and your service logs. By default, App Runner uses an Amazon Web Services managed key.\n"];
  tags: tag list option
    [@ocaml.doc
      "An optional list of metadata items that you can associate with the App Runner service resource. A tag is a key-value pair.\n"];
  instance_configuration: instance_configuration option
    [@ocaml.doc
      "The runtime configuration of instances (scaling units) of your service.\n"];
  source_configuration: source_configuration
    [@ocaml.doc
      "The source to deploy to the App Runner service. It can be a code or an image repository.\n"];
  service_name: string
    [@ocaml.doc
      "A name for the App Runner service. It must be unique across all the running App Runner services in your Amazon Web Services account in the Amazon Web Services Region.\n"]}
[@@ocaml.doc ""]
type nonrec create_observability_configuration_response =
  {
  observability_configuration: observability_configuration
    [@ocaml.doc
      "A description of the App Runner observability configuration that's created by this request.\n"]}
[@@ocaml.doc ""]
type nonrec create_observability_configuration_request =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of metadata items that you can associate with your observability configuration resource. A tag is a key-value pair.\n"];
  trace_configuration: trace_configuration option
    [@ocaml.doc
      "The configuration of the tracing feature within this observability configuration. If you don't specify it, App Runner doesn't enable tracing.\n"];
  observability_configuration_name: string
    [@ocaml.doc
      "A name for the observability configuration. When you use it for the first time in an Amazon Web Services Region, App Runner creates revision number [1] of this name. When you use the same name in subsequent calls, App Runner creates incremental revisions of the configuration.\n\n  The name [DefaultConfiguration] is reserved. You can't use it to create a new observability configuration, and you can't create a revision of it.\n  \n   When you want to use your own observability configuration for your App Runner service, {i create a configuration with a different name}, and then provide it when you create or update your service.\n   \n    "]}
[@@ocaml.doc ""]
type nonrec create_connection_response =
  {
  connection: connection
    [@ocaml.doc
      "A description of the App Runner connection that's created by this request.\n"]}
[@@ocaml.doc ""]
type nonrec create_connection_request =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of metadata items that you can associate with your connection resource. A tag is a key-value pair.\n"];
  provider_type: provider_type
    [@ocaml.doc "The source repository provider.\n"];
  connection_name: string
    [@ocaml.doc
      "A name for the new connection. It must be unique across all App Runner connections for the Amazon Web Services account in the Amazon Web Services Region.\n"]}
[@@ocaml.doc ""]
type nonrec create_auto_scaling_configuration_response =
  {
  auto_scaling_configuration: auto_scaling_configuration
    [@ocaml.doc
      "A description of the App Runner auto scaling configuration that's created by this request.\n"]}
[@@ocaml.doc ""]
type nonrec create_auto_scaling_configuration_request =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of metadata items that you can associate with your auto scaling configuration resource. A tag is a key-value pair.\n"];
  max_size: int option
    [@ocaml.doc
      "The maximum number of instances that your service scales up to. At most [MaxSize] instances actively serve traffic for your service.\n\n Default: [25] \n "];
  min_size: int option
    [@ocaml.doc
      "The minimum number of instances that App Runner provisions for your service. The service always has at least [MinSize] provisioned instances. Some of them actively serve traffic. The rest of them (provisioned and inactive instances) are a cost-effective compute capacity reserve and are ready to be quickly activated. You pay for memory usage of all the provisioned instances. You pay for CPU usage of only the active subset.\n\n App Runner temporarily doubles the number of provisioned instances during deployments, to maintain the same capacity for both old and new code.\n \n  Default: [1] \n  "];
  max_concurrency: int option
    [@ocaml.doc
      "The maximum number of concurrent requests that you want an instance to process. If the number of concurrent requests exceeds this limit, App Runner scales up your service.\n\n Default: [100] \n "];
  auto_scaling_configuration_name: string
    [@ocaml.doc
      "A name for the auto scaling configuration. When you use it for the first time in an Amazon Web Services Region, App Runner creates revision number [1] of this name. When you use the same name in subsequent calls, App Runner creates incremental revisions of the configuration.\n\n  Prior to the release of {{:https://docs.aws.amazon.com/apprunner/latest/relnotes/release-2023-09-22-auto-scale-config.html}Auto scale configuration enhancements}, the name [DefaultConfiguration] was reserved. \n  \n   This restriction is no longer in place. You can now manage [DefaultConfiguration] the same way you manage your custom auto scaling configurations. This means you can do the following with the [DefaultConfiguration] that App Runner provides:\n   \n    {ul\n          {-  Create new revisions of the [DefaultConfiguration].\n              \n               }\n          {-  Delete the revisions of the [DefaultConfiguration].\n              \n               }\n          {-  Delete the auto scaling configuration for which the App Runner [DefaultConfiguration] was created.\n              \n               }\n          {-  If you delete the auto scaling configuration you can create another custom auto scaling configuration with the same [DefaultConfiguration] name. The original [DefaultConfiguration] resource provided by App Runner remains in your account unless you make changes to it.\n              \n               }\n          }\n   "]}
[@@ocaml.doc ""]
type nonrec associate_custom_domain_response =
  {
  vpc_dns_targets: vpc_dns_target list
    [@ocaml.doc
      "DNS Target records for the custom domains of this Amazon VPC. \n"];
  custom_domain: custom_domain
    [@ocaml.doc
      "A description of the domain name that's being associated.\n"];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service with which a custom domain name is associated.\n"];
  dns_target: string
    [@ocaml.doc
      "The App Runner subdomain of the App Runner service. The custom domain name is mapped to this target name.\n"]}
[@@ocaml.doc ""]
type nonrec associate_custom_domain_request =
  {
  enable_www_subdomain: bool option
    [@ocaml.doc
      "Set to [true] to associate the subdomain \n{[\nwww.{i DomainName} \n]}\n with the App Runner service in addition to the base domain.\n\n Default: [true] \n "];
  domain_name: string
    [@ocaml.doc
      "A custom domain endpoint to associate. Specify a root domain (for example, [example.com]), a subdomain (for example, [login.example.com] or [admin.login.example.com]), or a wildcard (for example, [*.example.com]).\n"];
  service_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the App Runner service that you want to associate a custom domain name with.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_vpc_ingress_connection_summary :
  ?service_arn:string ->
    ?vpc_ingress_connection_arn:string ->
      unit -> vpc_ingress_connection_summary
val make_ingress_vpc_configuration :
  ?vpc_endpoint_id:string ->
    ?vpc_id:string -> unit -> ingress_vpc_configuration
val make_vpc_ingress_connection :
  ?deleted_at:CoreTypes.Timestamp.t ->
    ?created_at:CoreTypes.Timestamp.t ->
      ?ingress_vpc_configuration:ingress_vpc_configuration ->
        ?domain_name:string ->
          ?account_id:string ->
            ?status:vpc_ingress_connection_status ->
              ?service_arn:string ->
                ?vpc_ingress_connection_name:string ->
                  ?vpc_ingress_connection_arn:string ->
                    unit -> vpc_ingress_connection
val make_vpc_dns_target :
  ?domain_name:string ->
    ?vpc_id:string ->
      ?vpc_ingress_connection_arn:string -> unit -> vpc_dns_target
val make_vpc_connector :
  ?deleted_at:CoreTypes.Timestamp.t ->
    ?created_at:CoreTypes.Timestamp.t ->
      ?status:vpc_connector_status ->
        ?security_groups:string list ->
          ?subnets:string list ->
            ?vpc_connector_revision:int ->
              ?vpc_connector_arn:string ->
                ?vpc_connector_name:string -> unit -> vpc_connector
val make_update_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> update_vpc_ingress_connection_response
val make_update_vpc_ingress_connection_request :
  ingress_vpc_configuration:ingress_vpc_configuration ->
    vpc_ingress_connection_arn:string ->
      unit -> update_vpc_ingress_connection_request
val make_source_code_version :
  value:string ->
    type_:source_code_version_type -> unit -> source_code_version
val make_code_configuration_values :
  ?runtime_environment_secrets:runtime_environment_secrets ->
    ?runtime_environment_variables:runtime_environment_variables ->
      ?port:string ->
        ?start_command:string ->
          ?build_command:string ->
            runtime:runtime -> unit -> code_configuration_values
val make_code_configuration :
  ?code_configuration_values:code_configuration_values ->
    configuration_source:configuration_source -> unit -> code_configuration
val make_code_repository :
  ?source_directory:string ->
    ?code_configuration:code_configuration ->
      source_code_version:source_code_version ->
        repository_url:string -> unit -> code_repository
val make_image_configuration :
  ?runtime_environment_secrets:runtime_environment_secrets ->
    ?port:string ->
      ?start_command:string ->
        ?runtime_environment_variables:runtime_environment_variables ->
          unit -> image_configuration
val make_image_repository :
  ?image_configuration:image_configuration ->
    image_repository_type:image_repository_type ->
      image_identifier:string -> unit -> image_repository
val make_authentication_configuration :
  ?access_role_arn:string ->
    ?connection_arn:string -> unit -> authentication_configuration
val make_source_configuration :
  ?authentication_configuration:authentication_configuration ->
    ?auto_deployments_enabled:bool ->
      ?image_repository:image_repository ->
        ?code_repository:code_repository -> unit -> source_configuration
val make_instance_configuration :
  ?instance_role_arn:string ->
    ?memory:string -> ?cpu:string -> unit -> instance_configuration
val make_encryption_configuration :
  kms_key:string -> unit -> encryption_configuration
val make_health_check_configuration :
  ?unhealthy_threshold:int ->
    ?healthy_threshold:int ->
      ?timeout:int ->
        ?interval:int ->
          ?path:string ->
            ?protocol:health_check_protocol ->
              unit -> health_check_configuration
val make_auto_scaling_configuration_summary :
  ?is_default:bool ->
    ?has_associated_service:bool ->
      ?created_at:CoreTypes.Timestamp.t ->
        ?status:auto_scaling_configuration_status ->
          ?auto_scaling_configuration_revision:int ->
            ?auto_scaling_configuration_name:string ->
              ?auto_scaling_configuration_arn:string ->
                unit -> auto_scaling_configuration_summary
val make_egress_configuration :
  ?vpc_connector_arn:string ->
    ?egress_type:egress_type -> unit -> egress_configuration
val make_ingress_configuration :
  ?is_publicly_accessible:bool -> unit -> ingress_configuration
val make_network_configuration :
  ?ip_address_type:ip_address_type ->
    ?ingress_configuration:ingress_configuration ->
      ?egress_configuration:egress_configuration ->
        unit -> network_configuration
val make_service_observability_configuration :
  ?observability_configuration_arn:string ->
    observability_enabled:bool -> unit -> service_observability_configuration
val make_service :
  ?observability_configuration:service_observability_configuration ->
    ?health_check_configuration:health_check_configuration ->
      ?encryption_configuration:encryption_configuration ->
        ?deleted_at:CoreTypes.Timestamp.t ->
          ?service_url:string ->
            network_configuration:network_configuration ->
              auto_scaling_configuration_summary:auto_scaling_configuration_summary
                ->
                instance_configuration:instance_configuration ->
                  source_configuration:source_configuration ->
                    status:service_status ->
                      updated_at:CoreTypes.Timestamp.t ->
                        created_at:CoreTypes.Timestamp.t ->
                          service_arn:string ->
                            service_id:string ->
                              service_name:string -> unit -> service
val make_update_service_response :
  operation_id:string -> service:service -> unit -> update_service_response
val make_update_service_request :
  ?observability_configuration:service_observability_configuration ->
    ?network_configuration:network_configuration ->
      ?health_check_configuration:health_check_configuration ->
        ?auto_scaling_configuration_arn:string ->
          ?instance_configuration:instance_configuration ->
            ?source_configuration:source_configuration ->
              service_arn:string -> unit -> update_service_request
val make_auto_scaling_configuration :
  ?is_default:bool ->
    ?has_associated_service:bool ->
      ?deleted_at:CoreTypes.Timestamp.t ->
        ?created_at:CoreTypes.Timestamp.t ->
          ?max_size:int ->
            ?min_size:int ->
              ?max_concurrency:int ->
                ?status:auto_scaling_configuration_status ->
                  ?latest:bool ->
                    ?auto_scaling_configuration_revision:int ->
                      ?auto_scaling_configuration_name:string ->
                        ?auto_scaling_configuration_arn:string ->
                          unit -> auto_scaling_configuration
val make_update_default_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> update_default_auto_scaling_configuration_response
val make_update_default_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:string ->
    unit -> update_default_auto_scaling_configuration_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:string list ->
    resource_arn:string -> unit -> untag_resource_request
val make_trace_configuration :
  vendor:tracing_vendor -> unit -> trace_configuration
val make_tag_resource_response : unit -> unit
val make_tag : ?value:string -> ?key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_request
val make_start_deployment_response :
  operation_id:string -> unit -> start_deployment_response
val make_start_deployment_request :
  service_arn:string -> unit -> start_deployment_request
val make_service_summary :
  ?status:service_status ->
    ?updated_at:CoreTypes.Timestamp.t ->
      ?created_at:CoreTypes.Timestamp.t ->
        ?service_url:string ->
          ?service_arn:string ->
            ?service_id:string ->
              ?service_name:string -> unit -> service_summary
val make_resume_service_response :
  ?operation_id:string -> service:service -> unit -> resume_service_response
val make_resume_service_request :
  service_arn:string -> unit -> resume_service_request
val make_pause_service_response :
  ?operation_id:string -> service:service -> unit -> pause_service_response
val make_pause_service_request :
  service_arn:string -> unit -> pause_service_request
val make_operation_summary :
  ?updated_at:CoreTypes.Timestamp.t ->
    ?ended_at:CoreTypes.Timestamp.t ->
      ?started_at:CoreTypes.Timestamp.t ->
        ?target_arn:string ->
          ?status:operation_status ->
            ?type_:operation_type -> ?id:string -> unit -> operation_summary
val make_observability_configuration_summary :
  ?observability_configuration_revision:int ->
    ?observability_configuration_name:string ->
      ?observability_configuration_arn:string ->
        unit -> observability_configuration_summary
val make_observability_configuration :
  ?deleted_at:CoreTypes.Timestamp.t ->
    ?created_at:CoreTypes.Timestamp.t ->
      ?status:observability_configuration_status ->
        ?latest:bool ->
          ?observability_configuration_revision:int ->
            ?trace_configuration:trace_configuration ->
              ?observability_configuration_name:string ->
                ?observability_configuration_arn:string ->
                  unit -> observability_configuration
val make_list_vpc_ingress_connections_response :
  ?next_token:string ->
    vpc_ingress_connection_summary_list:vpc_ingress_connection_summary list
      -> unit -> list_vpc_ingress_connections_response
val make_list_vpc_ingress_connections_filter :
  ?vpc_endpoint_id:string ->
    ?service_arn:string -> unit -> list_vpc_ingress_connections_filter
val make_list_vpc_ingress_connections_request :
  ?next_token:string ->
    ?max_results:int ->
      ?filter:list_vpc_ingress_connections_filter ->
        unit -> list_vpc_ingress_connections_request
val make_list_vpc_connectors_response :
  ?next_token:string ->
    vpc_connectors:vpc_connector list -> unit -> list_vpc_connectors_response
val make_list_vpc_connectors_request :
  ?next_token:string ->
    ?max_results:int -> unit -> list_vpc_connectors_request
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:string -> unit -> list_tags_for_resource_request
val make_list_services_response :
  ?next_token:string ->
    service_summary_list:service_summary list ->
      unit -> list_services_response
val make_list_services_request :
  ?max_results:int -> ?next_token:string -> unit -> list_services_request
val make_list_services_for_auto_scaling_configuration_response :
  ?next_token:string ->
    service_arn_list:string list ->
      unit -> list_services_for_auto_scaling_configuration_response
val make_list_services_for_auto_scaling_configuration_request :
  ?next_token:string ->
    ?max_results:int ->
      auto_scaling_configuration_arn:string ->
        unit -> list_services_for_auto_scaling_configuration_request
val make_list_operations_response :
  ?next_token:string ->
    ?operation_summary_list:operation_summary list ->
      unit -> list_operations_response
val make_list_operations_request :
  ?max_results:int ->
    ?next_token:string ->
      service_arn:string -> unit -> list_operations_request
val make_list_observability_configurations_response :
  ?next_token:string ->
    observability_configuration_summary_list:observability_configuration_summary
      list -> unit -> list_observability_configurations_response
val make_list_observability_configurations_request :
  ?next_token:string ->
    ?max_results:int ->
      ?latest_only:bool ->
        ?observability_configuration_name:string ->
          unit -> list_observability_configurations_request
val make_connection_summary :
  ?created_at:CoreTypes.Timestamp.t ->
    ?status:connection_status ->
      ?provider_type:provider_type ->
        ?connection_arn:string ->
          ?connection_name:string -> unit -> connection_summary
val make_list_connections_response :
  ?next_token:string ->
    connection_summary_list:connection_summary list ->
      unit -> list_connections_response
val make_list_connections_request :
  ?next_token:string ->
    ?max_results:int ->
      ?connection_name:string -> unit -> list_connections_request
val make_list_auto_scaling_configurations_response :
  ?next_token:string ->
    auto_scaling_configuration_summary_list:auto_scaling_configuration_summary
      list -> unit -> list_auto_scaling_configurations_response
val make_list_auto_scaling_configurations_request :
  ?next_token:string ->
    ?max_results:int ->
      ?latest_only:bool ->
        ?auto_scaling_configuration_name:string ->
          unit -> list_auto_scaling_configurations_request
val make_certificate_validation_record :
  ?status:certificate_validation_record_status ->
    ?value:string ->
      ?type_:string -> ?name:string -> unit -> certificate_validation_record
val make_custom_domain :
  ?certificate_validation_records:certificate_validation_record list ->
    status:custom_domain_association_status ->
      enable_www_subdomain:bool ->
        domain_name:string -> unit -> custom_domain
val make_disassociate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target list ->
    custom_domain:custom_domain ->
      service_arn:string ->
        dns_target:string -> unit -> disassociate_custom_domain_response
val make_disassociate_custom_domain_request :
  domain_name:string ->
    service_arn:string -> unit -> disassociate_custom_domain_request
val make_describe_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> describe_vpc_ingress_connection_response
val make_describe_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:string ->
    unit -> describe_vpc_ingress_connection_request
val make_describe_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> describe_vpc_connector_response
val make_describe_vpc_connector_request :
  vpc_connector_arn:string -> unit -> describe_vpc_connector_request
val make_describe_service_response :
  service:service -> unit -> describe_service_response
val make_describe_service_request :
  service_arn:string -> unit -> describe_service_request
val make_describe_observability_configuration_response :
  observability_configuration:observability_configuration ->
    unit -> describe_observability_configuration_response
val make_describe_observability_configuration_request :
  observability_configuration_arn:string ->
    unit -> describe_observability_configuration_request
val make_describe_custom_domains_response :
  ?next_token:string ->
    vpc_dns_targets:vpc_dns_target list ->
      custom_domains:custom_domain list ->
        service_arn:string ->
          dns_target:string -> unit -> describe_custom_domains_response
val make_describe_custom_domains_request :
  ?max_results:int ->
    ?next_token:string ->
      service_arn:string -> unit -> describe_custom_domains_request
val make_describe_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> describe_auto_scaling_configuration_response
val make_describe_auto_scaling_configuration_request :
  auto_scaling_configuration_arn:string ->
    unit -> describe_auto_scaling_configuration_request
val make_delete_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> delete_vpc_ingress_connection_response
val make_delete_vpc_ingress_connection_request :
  vpc_ingress_connection_arn:string ->
    unit -> delete_vpc_ingress_connection_request
val make_delete_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> delete_vpc_connector_response
val make_delete_vpc_connector_request :
  vpc_connector_arn:string -> unit -> delete_vpc_connector_request
val make_delete_service_response :
  operation_id:string -> service:service -> unit -> delete_service_response
val make_delete_service_request :
  service_arn:string -> unit -> delete_service_request
val make_delete_observability_configuration_response :
  observability_configuration:observability_configuration ->
    unit -> delete_observability_configuration_response
val make_delete_observability_configuration_request :
  observability_configuration_arn:string ->
    unit -> delete_observability_configuration_request
val make_connection :
  ?created_at:CoreTypes.Timestamp.t ->
    ?status:connection_status ->
      ?provider_type:provider_type ->
        ?connection_arn:string ->
          ?connection_name:string -> unit -> connection
val make_delete_connection_response :
  ?connection:connection -> unit -> delete_connection_response
val make_delete_connection_request :
  connection_arn:string -> unit -> delete_connection_request
val make_delete_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> delete_auto_scaling_configuration_response
val make_delete_auto_scaling_configuration_request :
  ?delete_all_revisions:bool ->
    auto_scaling_configuration_arn:string ->
      unit -> delete_auto_scaling_configuration_request
val make_create_vpc_ingress_connection_response :
  vpc_ingress_connection:vpc_ingress_connection ->
    unit -> create_vpc_ingress_connection_response
val make_create_vpc_ingress_connection_request :
  ?tags:tag list ->
    ingress_vpc_configuration:ingress_vpc_configuration ->
      vpc_ingress_connection_name:string ->
        service_arn:string -> unit -> create_vpc_ingress_connection_request
val make_create_vpc_connector_response :
  vpc_connector:vpc_connector -> unit -> create_vpc_connector_response
val make_create_vpc_connector_request :
  ?tags:tag list ->
    ?security_groups:string list ->
      subnets:string list ->
        vpc_connector_name:string -> unit -> create_vpc_connector_request
val make_create_service_response :
  operation_id:string -> service:service -> unit -> create_service_response
val make_create_service_request :
  ?observability_configuration:service_observability_configuration ->
    ?network_configuration:network_configuration ->
      ?auto_scaling_configuration_arn:string ->
        ?health_check_configuration:health_check_configuration ->
          ?encryption_configuration:encryption_configuration ->
            ?tags:tag list ->
              ?instance_configuration:instance_configuration ->
                source_configuration:source_configuration ->
                  service_name:string -> unit -> create_service_request
val make_create_observability_configuration_response :
  observability_configuration:observability_configuration ->
    unit -> create_observability_configuration_response
val make_create_observability_configuration_request :
  ?tags:tag list ->
    ?trace_configuration:trace_configuration ->
      observability_configuration_name:string ->
        unit -> create_observability_configuration_request
val make_create_connection_response :
  connection:connection -> unit -> create_connection_response
val make_create_connection_request :
  ?tags:tag list ->
    provider_type:provider_type ->
      connection_name:string -> unit -> create_connection_request
val make_create_auto_scaling_configuration_response :
  auto_scaling_configuration:auto_scaling_configuration ->
    unit -> create_auto_scaling_configuration_response
val make_create_auto_scaling_configuration_request :
  ?tags:tag list ->
    ?max_size:int ->
      ?min_size:int ->
        ?max_concurrency:int ->
          auto_scaling_configuration_name:string ->
            unit -> create_auto_scaling_configuration_request
val make_associate_custom_domain_response :
  vpc_dns_targets:vpc_dns_target list ->
    custom_domain:custom_domain ->
      service_arn:string ->
        dns_target:string -> unit -> associate_custom_domain_response
val make_associate_custom_domain_request :
  ?enable_www_subdomain:bool ->
    domain_name:string ->
      service_arn:string -> unit -> associate_custom_domain_request(** {1:operations Operations} *)

module AssociateCustomDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_custom_domain_request ->
        (associate_custom_domain_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception ]) result
end[@@ocaml.doc
     "Associate your own domain name with the App Runner subdomain URL of your App Runner service.\n\n After you call [AssociateCustomDomain] and receive a successful response, use the information in the [CustomDomain] record that's returned to add CNAME records to your Domain Name System (DNS). For each mapped domain name, add a mapping to the target App Runner subdomain and one or more certificate validation records. App Runner then performs DNS validation to verify that you own or control the domain name that you associated. App Runner tracks domain validity in a certificate stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}.\n "]
module CreateAutoScalingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_auto_scaling_configuration_request ->
        (create_auto_scaling_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception ])
          result
end[@@ocaml.doc
     "Create an App Runner automatic scaling configuration resource. App Runner requires this resource when you create or update App Runner services and you require non-default auto scaling settings. You can share an auto scaling configuration across multiple services.\n\n Create multiple revisions of a configuration by calling this action multiple times using the same [AutoScalingConfigurationName]. The call returns incremental [AutoScalingConfigurationRevision] values. When you create a service and configure an auto scaling configuration resource, the service uses the latest active revision of the auto scaling configuration by default. You can optionally configure the service to use a specific revision.\n \n  Configure a higher [MinSize] to increase the spread of your App Runner service over more Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.\n  \n   Configure a lower [MaxSize] to control your cost. The tradeoff is lower responsiveness during peak demand.\n   "]
module CreateConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception ])
          result
end[@@ocaml.doc
     "Create an App Runner connection resource. App Runner requires a connection resource when you create App Runner services that access private repositories from certain third-party providers. You can share a connection across multiple services.\n\n A connection resource is needed to access GitHub and Bitbucket repositories. Both require a user interface approval process through the App Runner console before you can use the connection.\n "]
module CreateObservabilityConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_observability_configuration_request ->
        (create_observability_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception ])
          result
end[@@ocaml.doc
     "Create an App Runner observability configuration resource. App Runner requires this resource when you create or update App Runner services and you want to enable non-default observability features. You can share an observability configuration across multiple services.\n\n Create multiple revisions of a configuration by calling this action multiple times using the same [ObservabilityConfigurationName]. The call returns incremental [ObservabilityConfigurationRevision] values. When you create a service and configure an observability configuration resource, the service uses the latest active revision of the observability configuration by default. You can optionally configure the service to use a specific revision.\n \n  The observability configuration resource is designed to configure multiple features (currently one feature, tracing). This action takes optional parameters that describe the configuration of these features (currently one parameter, [TraceConfiguration]). If you don't specify a feature parameter, App Runner doesn't enable the feature.\n  "]
module CreateService :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_request ->
        (create_service_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception ])
          result
end[@@ocaml.doc
     "Create an App Runner service. After the service is created, the action also automatically starts a deployment.\n\n This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html}ListOperations} call to track the operation's progress.\n "]
module CreateVpcConnector :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_connector_request ->
        (create_vpc_connector_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception ])
          result
end[@@ocaml.doc
     "Create an App Runner VPC connector resource. App Runner requires this resource when you want to associate your App Runner service to a custom Amazon Virtual Private Cloud (Amazon VPC).\n"]
module CreateVpcIngressConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_vpc_ingress_connection_request ->
        (create_vpc_ingress_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception ])
          result
end[@@ocaml.doc
     "Create an App Runner VPC Ingress Connection resource. App Runner requires this resource when you want to associate your App Runner service with an Amazon VPC endpoint.\n"]
module DeleteAutoScalingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_auto_scaling_configuration_request ->
        (delete_auto_scaling_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an App Runner automatic scaling configuration resource. You can delete a top level auto scaling configuration, a specific revision of one, or all revisions associated with the top level configuration. You can't delete the default auto scaling configuration or a configuration that's used by one or more App Runner services.\n"]
module DeleteConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an App Runner connection. You must first ensure that there are no running App Runner services that use this connection. If there are any, the [DeleteConnection] action fails.\n"]
module DeleteObservabilityConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_observability_configuration_request ->
        (delete_observability_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an App Runner observability configuration resource. You can delete a specific revision or the latest active revision. You can't delete a configuration that's used by one or more App Runner services.\n"]
module DeleteService :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_request ->
        (delete_service_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an App Runner service.\n\n This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.\n \n   Make sure that you don't have any active VPCIngressConnections associated with the service you want to delete. \n   \n    "]
module DeleteVpcConnector :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_connector_request ->
        (delete_vpc_connector_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an App Runner VPC connector resource. You can't delete a connector that's used by one or more App Runner services.\n"]
module DeleteVpcIngressConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_vpc_ingress_connection_request ->
        (delete_vpc_ingress_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an App Runner VPC Ingress Connection resource that's associated with an App Runner service. The VPC Ingress Connection must be in one of the following states to be deleted: \n\n {ul\n       {-   [AVAILABLE] \n           \n            }\n       {-   [FAILED_CREATION] \n           \n            }\n       {-   [FAILED_UPDATE] \n           \n            }\n       {-   [FAILED_DELETION] \n           \n            }\n       }\n  "]
module DescribeAutoScalingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_auto_scaling_configuration_request ->
        (describe_auto_scaling_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Return a full description of an App Runner automatic scaling configuration resource.\n"]
module DescribeCustomDomains :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_custom_domains_request ->
        (describe_custom_domains_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Return a description of custom domain names that are associated with an App Runner service.\n"]
module DescribeObservabilityConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_observability_configuration_request ->
        (describe_observability_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Return a full description of an App Runner observability configuration resource.\n"]
module DescribeService :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_service_request ->
        (describe_service_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Return a full description of an App Runner service.\n"]
module DescribeVpcConnector :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_vpc_connector_request ->
        (describe_vpc_connector_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Return a description of an App Runner VPC connector resource.\n"]
module DescribeVpcIngressConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_vpc_ingress_connection_request ->
        (describe_vpc_ingress_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Return a full description of an App Runner VPC Ingress Connection resource.\n"]
module DisassociateCustomDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_custom_domain_request ->
        (disassociate_custom_domain_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disassociate a custom domain name from an App Runner service.\n\n Certificates tracking domain validity are associated with a custom domain and are stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}. These certificates aren't deleted as part of this action. App Runner delays certificate deletion for 30 days after a domain is disassociated from your service.\n "]
module ListAutoScalingConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_auto_scaling_configurations_request ->
        (list_auto_scaling_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception ]) result
end[@@ocaml.doc
     "Returns a list of active App Runner automatic scaling configurations in your Amazon Web Services account. You can query the revisions for a specific configuration name or the revisions for all active configurations in your account. You can optionally query only the latest revision of each requested name.\n\n To retrieve a full description of a particular configuration revision, call and provide one of the ARNs returned by [ListAutoScalingConfigurations].\n "]
module ListConnections :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception ]) result
end[@@ocaml.doc
     "Returns a list of App Runner connections that are associated with your Amazon Web Services account.\n"]
module ListObservabilityConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_observability_configurations_request ->
        (list_observability_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception ]) result
end[@@ocaml.doc
     "Returns a list of active App Runner observability configurations in your Amazon Web Services account. You can query the revisions for a specific configuration name or the revisions for all active configurations in your account. You can optionally query only the latest revision of each requested name.\n\n To retrieve a full description of a particular configuration revision, call and provide one of the ARNs returned by [ListObservabilityConfigurations].\n "]
module ListOperations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_operations_request ->
        (list_operations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Return a list of operations that occurred on an App Runner service.\n\n The resulting list of [OperationSummary] objects is sorted in reverse chronological order. The first object on the list represents the last started operation.\n "]
module ListServices :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_request ->
        (list_services_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception ]) result
end[@@ocaml.doc
     "Returns a list of running App Runner services in your Amazon Web Services account.\n"]
module ListServicesForAutoScalingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_for_auto_scaling_configuration_request ->
        (list_services_for_auto_scaling_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns a list of the associated App Runner services using an auto scaling configuration.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "List tags that are associated with for an App Runner resource. The response contains a list of tag key-value pairs.\n"]
module ListVpcConnectors :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_connectors_request ->
        (list_vpc_connectors_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception ]) result
end[@@ocaml.doc
     "Returns a list of App Runner VPC connectors in your Amazon Web Services account.\n"]
module ListVpcIngressConnections :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_vpc_ingress_connections_request ->
        (list_vpc_ingress_connections_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception ]) result
end[@@ocaml.doc
     "Return a list of App Runner VPC Ingress Connections in your Amazon Web Services account.\n"]
module PauseService :
sig
  val request :
    Smaws_Lib.Context.t ->
      pause_service_request ->
        (pause_service_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Pause an active App Runner service. App Runner reduces compute capacity for the service to zero and loses state (for example, ephemeral storage is removed).\n\n This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.\n "]
module ResumeService :
sig
  val request :
    Smaws_Lib.Context.t ->
      resume_service_request ->
        (resume_service_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Resume an active App Runner service. App Runner provisions compute capacity for the service.\n\n This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.\n "]
module StartDeployment :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_deployment_request ->
        (start_deployment_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Initiate a manual deployment of the latest commit in a source code repository or the latest image in a source image repository to an App Runner service.\n\n For a source code repository, App Runner retrieves the commit and builds a Docker image. For a source image repository, App Runner retrieves the latest Docker image. In both cases, App Runner then deploys the new image to your service and starts a new container instance.\n \n  This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.\n  "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Add tags to, or update the tag values of, an App Runner resource. A tag is a key-value pair.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Remove tags from an App Runner resource.\n"]
module UpdateDefaultAutoScalingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_default_auto_scaling_configuration_request ->
        (update_default_auto_scaling_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Update an auto scaling configuration to be the default. The existing default auto scaling configuration will be set to non-default automatically.\n"]
module UpdateService :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_request ->
        (update_service_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Update an App Runner service. You can update the source configuration and instance configuration of the service. You can also update the ARN of the auto scaling configuration resource that's associated with the service. However, you can't change the name or the encryption configuration of the service. These can be set only when you create the service.\n\n To update the tags applied to your service, use the separate actions [TagResource] and [UntagResource].\n \n  This is an asynchronous operation. On a successful call, you can use the returned [OperationId] and the [ListOperations] call to track the operation's progress.\n  "]
module UpdateVpcIngressConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_vpc_ingress_connection_request ->
        (update_vpc_ingress_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalServiceErrorException of
              internal_service_error_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `InvalidStateException of invalid_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Update an existing App Runner VPC Ingress Connection resource. The VPC Ingress Connection must be in one of the following states to be updated:\n\n {ul\n       {-   AVAILABLE \n           \n            }\n       {-   FAILED_CREATION \n           \n            }\n       {-   FAILED_UPDATE \n           \n            }\n       }\n  "]