(** 
    Lightsail client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec certificate_provider =
  | LetsEncrypt [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec setup_request =
  {
  certificate_provider: certificate_provider option
    [@ocaml.doc
      "The Certificate Authority (CA) that issues the SSL/TLS certificate.\n"];
  domain_names: string list option
    [@ocaml.doc
      "The name of the domain and subdomains that the SSL/TLS certificate secures.\n"];
  instance_name: string option
    [@ocaml.doc "The name of the Lightsail instance.\n"]}[@@ocaml.doc
                                                           "Returns information that was submitted during the [SetupInstanceHttps] request. Email information is redacted for privacy.\n"]
type nonrec region_name =
  | EU_NORTH_1 [@ocaml.doc ""]
  | AP_NORTHEAST_2 [@ocaml.doc ""]
  | AP_NORTHEAST_1 [@ocaml.doc ""]
  | AP_SOUTHEAST_2 [@ocaml.doc ""]
  | AP_SOUTHEAST_1 [@ocaml.doc ""]
  | AP_SOUTH_1 [@ocaml.doc ""]
  | CA_CENTRAL_1 [@ocaml.doc ""]
  | EU_CENTRAL_1 [@ocaml.doc ""]
  | EU_WEST_3 [@ocaml.doc ""]
  | EU_WEST_2 [@ocaml.doc ""]
  | EU_WEST_1 [@ocaml.doc ""]
  | US_WEST_2 [@ocaml.doc ""]
  | US_WEST_1 [@ocaml.doc ""]
  | US_EAST_2 [@ocaml.doc ""]
  | US_EAST_1 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_location =
  {
  region_name: region_name option
    [@ocaml.doc "The Amazon Web Services Region name.\n"];
  availability_zone: string option
    [@ocaml.doc
      "The Availability Zone. Follows the format [us-east-2a] (case-sensitive).\n"]}
[@@ocaml.doc "Describes the resource location.\n"]
type nonrec resource_type =
  | Bucket [@ocaml.doc ""]
  | Certificate [@ocaml.doc ""]
  | Distribution [@ocaml.doc ""]
  | ContactMethod [@ocaml.doc ""]
  | Alarm [@ocaml.doc ""]
  | CloudFormationStackRecord [@ocaml.doc ""]
  | ExportSnapshotRecord [@ocaml.doc ""]
  | RelationalDatabaseSnapshot [@ocaml.doc ""]
  | RelationalDatabase [@ocaml.doc ""]
  | DiskSnapshot [@ocaml.doc ""]
  | Disk [@ocaml.doc ""]
  | LoadBalancerTlsCertificate [@ocaml.doc ""]
  | LoadBalancer [@ocaml.doc ""]
  | PeeredVpc [@ocaml.doc ""]
  | Domain [@ocaml.doc ""]
  | InstanceSnapshot [@ocaml.doc ""]
  | KeyPair [@ocaml.doc ""]
  | StaticIp [@ocaml.doc ""]
  | Instance [@ocaml.doc ""]
  | ContainerService [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec setup_history_resource =
  {
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type. For example, [Instance].\n"];
  location: resource_location option [@ocaml.doc ""];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp for when the resource was created.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Lightsail resource.\n"];
  name: string option [@ocaml.doc "The name of the Lightsail resource.\n"]}
[@@ocaml.doc "The Lightsail resource that [SetupHistory] was ran on. \n"]
type nonrec setup_status =
  | InProgress [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec setup_execution_details =
  {
  version: string option [@ocaml.doc "The current version of the script..\n"];
  standard_output: string option
    [@ocaml.doc "The text written by the command to stdout.\n"];
  standard_error: string option
    [@ocaml.doc "The text written by the command to stderr.\n"];
  status: setup_status option
    [@ocaml.doc "The status of the [SetupInstanceHttps] request.\n"];
  name: string option [@ocaml.doc "The name of the target resource.\n"];
  date_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp for when the request was run.\n"];
  command: string option [@ocaml.doc "The command that was executed.\n"]}
[@@ocaml.doc "Returns details about the commands that were run.\n"]
type nonrec setup_history =
  {
  status: setup_status option [@ocaml.doc "The status of the request.\n"];
  execution_details: setup_execution_details list option
    [@ocaml.doc "Describes the full details of the request.\n"];
  resource: setup_history_resource option
    [@ocaml.doc "The target resource name for the request.\n"];
  request: setup_request option
    [@ocaml.doc "Information about the specified request.\n"];
  operation_id: string option
    [@ocaml.doc "A GUID that's used to identify the operation.\n"]}[@@ocaml.doc
                                                                    "Returns a list of the commands that were ran on the target resource.\n\n The status of each command is also returned.\n "]
type nonrec viewer_minimum_tls_protocol_version_enum =
  | TLSv12_2021 [@ocaml.doc ""]
  | TLSv12_2019 [@ocaml.doc ""]
  | TLSv12_2018 [@ocaml.doc ""]
  | TLSv11_2016 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec operation_type =
  | SetupInstanceHttps [@ocaml.doc ""]
  | StopGUISession [@ocaml.doc ""]
  | StartGUISession [@ocaml.doc ""]
  | UpdateInstanceMetadataOptions [@ocaml.doc ""]
  | SetResourceAccessForBucket [@ocaml.doc ""]
  | UpdateBucket [@ocaml.doc ""]
  | UpdateBucketBundle [@ocaml.doc ""]
  | DeleteBucketAccessKey [@ocaml.doc ""]
  | CreateBucketAccessKey [@ocaml.doc ""]
  | DeleteBucket [@ocaml.doc ""]
  | CreateBucket [@ocaml.doc ""]
  | DeleteContainerImage [@ocaml.doc ""]
  | RegisterContainerImage [@ocaml.doc ""]
  | CreateContainerServiceRegistryLogin [@ocaml.doc ""]
  | CreateContainerServiceDeployment [@ocaml.doc ""]
  | DeleteContainerService [@ocaml.doc ""]
  | UpdateContainerService [@ocaml.doc ""]
  | CreateContainerService [@ocaml.doc ""]
  | DeleteCertificate [@ocaml.doc ""]
  | CreateCertificate [@ocaml.doc ""]
  | SetIpAddressType [@ocaml.doc ""]
  | UpdateDistributionBundle [@ocaml.doc ""]
  | DetachCertificateFromDistribution [@ocaml.doc ""]
  | AttachCertificateToDistribution [@ocaml.doc ""]
  | ResetDistributionCache [@ocaml.doc ""]
  | DeleteDistribution [@ocaml.doc ""]
  | UpdateDistribution [@ocaml.doc ""]
  | CreateDistribution [@ocaml.doc ""]
  | DeleteContactMethod [@ocaml.doc ""]
  | SendContactMethodVerification [@ocaml.doc ""]
  | GetContactMethods [@ocaml.doc ""]
  | CreateContactMethod [@ocaml.doc ""]
  | TestAlarm [@ocaml.doc ""]
  | DeleteAlarm [@ocaml.doc ""]
  | GetAlarms [@ocaml.doc ""]
  | PutAlarm [@ocaml.doc ""]
  | DisableAddOn [@ocaml.doc ""]
  | EnableAddOn [@ocaml.doc ""]
  | StopRelationalDatabase [@ocaml.doc ""]
  | RebootRelationalDatabase [@ocaml.doc ""]
  | StartRelationalDatabase [@ocaml.doc ""]
  | UpdateRelationalDatabaseParameters [@ocaml.doc ""]
  | DeleteRelationalDatabaseSnapshot [@ocaml.doc ""]
  | CreateRelationalDatabaseSnapshot [@ocaml.doc ""]
  | CreateRelationalDatabaseFromSnapshot [@ocaml.doc ""]
  | DeleteRelationalDatabase [@ocaml.doc ""]
  | UpdateRelationalDatabase [@ocaml.doc ""]
  | CreateRelationalDatabase [@ocaml.doc ""]
  | CreateDiskFromSnapshot [@ocaml.doc ""]
  | DeleteDiskSnapshot [@ocaml.doc ""]
  | CreateDiskSnapshot [@ocaml.doc ""]
  | DetachDisk [@ocaml.doc ""]
  | AttachDisk [@ocaml.doc ""]
  | DeleteDisk [@ocaml.doc ""]
  | CreateDisk [@ocaml.doc ""]
  | AttachLoadBalancerTlsCertificate [@ocaml.doc ""]
  | DeleteLoadBalancerTlsCertificate [@ocaml.doc ""]
  | CreateLoadBalancerTlsCertificate [@ocaml.doc ""]
  | UpdateLoadBalancerAttribute [@ocaml.doc ""]
  | DetachInstancesFromLoadBalancer [@ocaml.doc ""]
  | AttachInstancesToLoadBalancer [@ocaml.doc ""]
  | DeleteLoadBalancer [@ocaml.doc ""]
  | CreateLoadBalancer [@ocaml.doc ""]
  | CreateInstancesFromSnapshot [@ocaml.doc ""]
  | DeleteInstanceSnapshot [@ocaml.doc ""]
  | CreateInstanceSnapshot [@ocaml.doc ""]
  | DeleteDomain [@ocaml.doc ""]
  | CreateDomain [@ocaml.doc ""]
  | DeleteDomainEntry [@ocaml.doc ""]
  | UpdateDomainEntry [@ocaml.doc ""]
  | DetachStaticIp [@ocaml.doc ""]
  | AttachStaticIp [@ocaml.doc ""]
  | ReleaseStaticIp [@ocaml.doc ""]
  | AllocateStaticIp [@ocaml.doc ""]
  | CloseInstancePublicPorts [@ocaml.doc ""]
  | PutInstancePublicPorts [@ocaml.doc ""]
  | OpenInstancePublicPorts [@ocaml.doc ""]
  | RebootInstance [@ocaml.doc ""]
  | StartInstance [@ocaml.doc ""]
  | StopInstance [@ocaml.doc ""]
  | CreateInstance [@ocaml.doc ""]
  | DeleteInstance [@ocaml.doc ""]
  | DeleteKnownHostKeys [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec operation_status =
  | Succeeded [@ocaml.doc ""]
  | Completed [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Started [@ocaml.doc ""]
  | NotStarted [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec operation =
  {
  error_details: string option [@ocaml.doc "The error details.\n"];
  error_code: string option [@ocaml.doc "The error code.\n"];
  status_changed_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the status was changed ([1479816991.349]).\n"];
  status: operation_status option
    [@ocaml.doc "The status of the operation. \n"];
  operation_type: operation_type option
    [@ocaml.doc "The type of operation. \n"];
  operation_details: string option
    [@ocaml.doc "Details about the operation ([Debian-1GB-Ohio-1]).\n"];
  is_terminal: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the operation is terminal.\n"];
  location: resource_location option
    [@ocaml.doc "The Amazon Web Services Region and Availability Zone.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the operation was initialized ([1479816991.349]).\n"];
  resource_type: resource_type option [@ocaml.doc "The resource type. \n"];
  resource_name: string option [@ocaml.doc "The resource name.\n"];
  id: string option [@ocaml.doc "The ID of the operation.\n"]}[@@ocaml.doc
                                                                "Describes the API operation.\n"]
type nonrec update_relational_database_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec update_relational_database_request =
  {
  relational_database_blueprint_id: string option
    [@ocaml.doc
      "This parameter is used to update the major version of the database. Enter the [blueprintId] for the major version that you want to update to.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRelationalDatabaseBlueprints.html}GetRelationalDatabaseBlueprints} action to get a list of available blueprint IDs.\n "];
  ca_certificate_identifier: string option
    [@ocaml.doc
      "Indicates the certificate that needs to be associated with the database.\n"];
  apply_immediately: bool option
    [@ocaml.doc
      "When [true], applies changes immediately. When [false], applies changes during the preferred maintenance window. Some changes may cause an outage.\n\n Default: [false] \n "];
  publicly_accessible: bool option
    [@ocaml.doc
      "Specifies the accessibility options for your database. A value of [true] specifies a database that is available to resources outside of your Lightsail account. A value of [false] specifies a database that is available only to your Lightsail resources in the same region as your database.\n"];
  disable_backup_retention: bool option
    [@ocaml.doc
      "When [true], disables automated backup retention for your database.\n\n Disabling backup retention deletes all automated database backups. Before disabling this, you may want to create a snapshot of your database using the [create relational database\n        snapshot] operation.\n \n  Updates are applied during the next maintenance window because this can result in an outage.\n  "];
  enable_backup_retention: bool option
    [@ocaml.doc
      "When [true], enables automated backup retention for your database.\n\n Updates are applied during the next maintenance window because this can result in an outage.\n "];
  preferred_maintenance_window: string option
    [@ocaml.doc
      "The weekly time range during which system maintenance can occur on your database.\n\n The default is a 30-minute window selected at random from an 8-hour block of time for each Amazon Web Services Region, occurring on a random day of the week.\n \n  Constraints:\n  \n   {ul\n         {-  Must be in the [ddd:hh24:mi-ddd:hh24:mi] format.\n             \n              }\n         {-  Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.\n             \n              }\n         {-  Must be at least 30 minutes.\n             \n              }\n         {-  Specified in Coordinated Universal Time (UTC).\n             \n              }\n         {-  Example: [Tue:17:00-Tue:17:30] \n             \n              }\n         }\n  "];
  preferred_backup_window: string option
    [@ocaml.doc
      "The daily time range during which automated backups are created for your database if automated backups are enabled.\n\n Constraints:\n \n  {ul\n        {-  Must be in the [hh24:mi-hh24:mi] format.\n            \n             Example: [16:00-16:30] \n             \n              }\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Must not conflict with the preferred maintenance window.\n            \n             }\n        {-  Must be at least 30 minutes.\n            \n             }\n        }\n  "];
  rotate_master_user_password: bool option
    [@ocaml.doc
      "When [true], the master user password is changed to a new strong password generated by Lightsail.\n\n Use the [get relational database master user password] operation to get the new password.\n "];
  master_user_password: string option
    [@ocaml.doc
      "The password for the master user. The password can include any printable ASCII character except \"/\", \"\"\", or \"\\@\".\n\n My{b SQL} \n \n  Constraints: Must contain from 8 to 41 characters.\n  \n    {b PostgreSQL} \n   \n    Constraints: Must contain from 8 to 128 characters.\n    "];
  relational_database_name: string
    [@ocaml.doc "The name of your Lightsail database resource to update.\n"]}
[@@ocaml.doc ""]
type nonrec update_relational_database_parameters_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec relational_database_parameter =
  {
  parameter_value: string option
    [@ocaml.doc "Specifies the value of the parameter.\n"];
  parameter_name: string option
    [@ocaml.doc "Specifies the name of the parameter.\n"];
  is_modifiable: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the parameter can be modified.\n"];
  description: string option
    [@ocaml.doc "Provides a description of the parameter.\n"];
  data_type: string option
    [@ocaml.doc "Specifies the valid data type for the parameter.\n"];
  apply_type: string option
    [@ocaml.doc "Specifies the engine-specific parameter type.\n"];
  apply_method: string option
    [@ocaml.doc
      "Indicates when parameter updates are applied.\n\n Can be [immediate] or [pending-reboot].\n "];
  allowed_values: string option
    [@ocaml.doc "Specifies the valid range of values for the parameter.\n"]}
[@@ocaml.doc "Describes the parameters of a database.\n"]
type nonrec update_relational_database_parameters_request =
  {
  parameters: relational_database_parameter list
    [@ocaml.doc "The database parameters to update.\n"];
  relational_database_name: string
    [@ocaml.doc
      "The name of your database for which to update parameters.\n"]}
[@@ocaml.doc ""]
type nonrec unauthenticated_exception =
  {
  tip: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""];
  docs: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc
                                        "Lightsail throws this exception when the user has not been authenticated.\n"]
type nonrec service_exception =
  {
  tip: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""];
  docs: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc
                                        "A general service exception.\n"]
type nonrec operation_failure_exception =
  {
  tip: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""];
  docs: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc
                                        "Lightsail throws this exception when an operation fails to execute.\n"]
type nonrec not_found_exception =
  {
  tip: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""];
  docs: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc
                                        "Lightsail throws this exception when it cannot find a resource.\n"]
type nonrec invalid_input_exception =
  {
  tip: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""];
  docs: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc
                                        "Lightsail throws this exception when user input does not conform to the validation rules of an input field.\n\n  Domain and distribution APIs are only available in the N. Virginia ([us-east-1]) Amazon Web Services Region. Please set your Amazon Web Services Region configuration to [us-east-1] to create, view, or edit these resources.\n  \n   "]
type nonrec account_setup_in_progress_exception =
  {
  tip: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""];
  docs: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc
                                        "Lightsail throws this exception when an account is still in the setup in progress state.\n"]
type nonrec access_denied_exception =
  {
  tip: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""];
  docs: string option [@ocaml.doc ""];
  code: string option [@ocaml.doc ""]}[@@ocaml.doc
                                        "Lightsail throws this exception when the user cannot be authenticated or uses invalid credentials to access a resource.\n"]
type nonrec update_load_balancer_attribute_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec load_balancer_attribute_name =
  | TlsPolicyName [@ocaml.doc ""]
  | HttpsRedirectionEnabled [@ocaml.doc ""]
  | SessionStickiness_LB_CookieDurationSeconds [@ocaml.doc ""]
  | SessionStickinessEnabled [@ocaml.doc ""]
  | HealthCheckPath [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_load_balancer_attribute_request =
  {
  attribute_value: string
    [@ocaml.doc
      "The value that you want to specify for the attribute name.\n\n The following values are supported depending on what you specify for the [attributeName] request parameter:\n \n  {ul\n        {-  If you specify [HealthCheckPath] for the [attributeName] request parameter, then the [attributeValue] request parameter must be the path to ping on the target (for example, [/weather/us/wa/seattle]).\n            \n             }\n        {-  If you specify [SessionStickinessEnabled] for the [attributeName] request parameter, then the [attributeValue] request parameter must be [true] to activate session stickiness or [false] to deactivate session stickiness.\n            \n             }\n        {-  If you specify [SessionStickiness_LB_CookieDurationSeconds] for the [attributeName] request parameter, then the [attributeValue] request parameter must be an interger that represents the cookie duration in seconds.\n            \n             }\n        {-  If you specify [HttpsRedirectionEnabled] for the [attributeName] request parameter, then the [attributeValue] request parameter must be [true] to activate HTTP to HTTPS redirection or [false] to deactivate HTTP to HTTPS redirection.\n            \n             }\n        {-  If you specify [TlsPolicyName] for the [attributeName] request parameter, then the [attributeValue] request parameter must be the name of the TLS policy.\n            \n             Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetLoadBalancerTlsPolicies.html}GetLoadBalancerTlsPolicies} action to get a list of TLS policy names that you can specify.\n             \n              }\n        }\n  "];
  attribute_name: load_balancer_attribute_name
    [@ocaml.doc "The name of the attribute you want to update.\n"];
  load_balancer_name: string
    [@ocaml.doc
      "The name of the load balancer that you want to modify ([my-load-balancer].\n"]}
[@@ocaml.doc ""]
type nonrec update_instance_metadata_options_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec http_tokens =
  | Required [@ocaml.doc ""]
  | Optional [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec http_endpoint =
  | Enabled [@ocaml.doc ""]
  | Disabled [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec http_protocol_ipv6 =
  | Enabled [@ocaml.doc ""]
  | Disabled [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_instance_metadata_options_request =
  {
  http_protocol_ipv6: http_protocol_ipv6 option
    [@ocaml.doc
      "Enables or disables the IPv6 endpoint for the instance metadata service. This setting applies only when the HTTP metadata endpoint is enabled.\n\n  This parameter is available only for instances in the Europe (Stockholm) Amazon Web Services Region ([eu-north-1]).\n  \n   "];
  http_put_response_hop_limit: int option
    [@ocaml.doc
      "The desired HTTP PUT response hop limit for instance metadata requests. A larger number means that the instance metadata requests can travel farther. If no parameter is specified, the existing state is maintained.\n"];
  http_endpoint: http_endpoint option
    [@ocaml.doc
      "Enables or disables the HTTP metadata endpoint on your instances. If this parameter is not specified, the existing state is maintained.\n\n If you specify a value of [disabled], you cannot access your instance metadata.\n "];
  http_tokens: http_tokens option
    [@ocaml.doc
      "The state of token usage for your instance metadata requests. If the parameter is not specified in the request, the default state is [optional].\n\n If the state is [optional], you can choose whether to retrieve instance metadata with a signed token header on your request. If you retrieve the IAM role credentials without a token, the version 1.0 role credentials are returned. If you retrieve the IAM role credentials by using a valid signed token, the version 2.0 role credentials are returned.\n \n  If the state is [required], you must send a signed token header with all instance metadata retrieval requests. In this state, retrieving the IAM role credential always returns the version 2.0 credentials. The version 1.0 credentials are not available.\n  "];
  instance_name: string
    [@ocaml.doc
      "The name of the instance for which to update metadata parameters.\n"]}
[@@ocaml.doc ""]
type nonrec update_domain_entry_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec domain_entry_options = (string * string) list[@@ocaml.doc ""]
type nonrec domain_entry =
  {
  options: domain_entry_options option
    [@ocaml.doc
      "(Discontinued) The options for the domain entry.\n\n  In releases prior to November 29, 2017, this parameter was not included in the API response. It is now discontinued.\n  \n   "];
  type_: string option
    [@ocaml.doc
      "The type of domain entry, such as address for IPv4 (A), address for IPv6 (AAAA), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).\n\n The following domain entry types can be used:\n \n  {ul\n        {-   [A] \n            \n             }\n        {-   [AAAA] \n            \n             }\n        {-   [CNAME] \n            \n             }\n        {-   [MX] \n            \n             }\n        {-   [NS] \n            \n             }\n        {-   [SOA] \n            \n             }\n        {-   [SRV] \n            \n             }\n        {-   [TXT] \n            \n             }\n        }\n  "];
  is_alias: bool option
    [@ocaml.doc
      "When [true], specifies whether the domain entry is an alias used by the Lightsail load balancer, Lightsail container service, Lightsail content delivery network (CDN) distribution, or another Amazon Web Services resource. You can include an alias (A type) record in your request, which points to the DNS name of a load balancer, container service, CDN distribution, or other Amazon Web Services resource and routes traffic to that resource.\n"];
  target: string option
    [@ocaml.doc
      "The target IP address ([192.0.2.0]), or AWS name server ([ns-111.awsdns-22.com.]).\n\n For Lightsail load balancers, the value looks like [ab1234c56789c6b86aba6fb203d443bc-123456789.us-east-2.elb.amazonaws.com]. For Lightsail distributions, the value looks like [exampled1182ne.cloudfront.net]. For Lightsail container services, the value looks like [container-service-1.example23scljs.us-west-2.cs.amazonlightsail.com]. Be sure to also set [isAlias] to [true] when setting up an A record for a Lightsail load balancer, distribution, or container service.\n "];
  name: string option [@ocaml.doc "The name of the domain.\n"];
  id: string option [@ocaml.doc "The ID of the domain recordset entry.\n"]}
[@@ocaml.doc "Describes a domain recordset entry.\n"]
type nonrec update_domain_entry_request =
  {
  domain_entry: domain_entry
    [@ocaml.doc
      "An array of key-value pairs containing information about the domain entry.\n"];
  domain_name: string
    [@ocaml.doc "The name of the domain recordset to update.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec update_distribution_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec origin_protocol_policy_enum =
  | HTTPSOnly [@ocaml.doc ""]
  | HTTPOnly [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec input_origin =
  {
  response_timeout: int option
    [@ocaml.doc
      "The amount of time, in seconds, that the distribution waits for a response after forwarding a request to the origin. The minimum timeout is 1 second, the maximum is 60 seconds, and the default (if you don't specify otherwise) is 30 seconds.\n"];
  protocol_policy: origin_protocol_policy_enum option
    [@ocaml.doc
      "The protocol that your Amazon Lightsail distribution uses when establishing a connection with your origin to pull content.\n"];
  region_name: region_name option
    [@ocaml.doc "The AWS Region name of the origin resource.\n"];
  name: string option [@ocaml.doc "The name of the origin resource.\n"]}
[@@ocaml.doc
  "Describes the origin resource of an Amazon Lightsail content delivery network (CDN) distribution.\n\n An origin can be a Lightsail instance, bucket, container service, or load balancer. A distribution pulls content from an origin, caches it, and serves it to viewers via a worldwide network of edge servers.\n "]
type nonrec behavior_enum =
  | CacheSetting [@ocaml.doc ""]
  | DontCacheSetting [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cache_behavior =
  {
  behavior: behavior_enum option
    [@ocaml.doc
      "The cache behavior of the distribution.\n\n The following cache behaviors can be specified:\n \n  {ul\n        {-   {b  [cache] } - This option is best for static sites. When specified, your distribution caches and serves your entire website as static content. This behavior is ideal for websites with static content that doesn't change depending on who views it, or for websites that don't use cookies, headers, or query strings to personalize content.\n            \n             }\n        {-   {b  [dont-cache] } - This option is best for sites that serve a mix of static and dynamic content. When specified, your distribution caches and serve only the content that is specified in the distribution's [CacheBehaviorPerPath] parameter. This behavior is ideal for websites or web applications that use cookies, headers, and query strings to personalize content for individual users.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes the default cache behavior of an Amazon Lightsail content delivery network (CDN) distribution.\n"]
type nonrec forward_values =
  | All [@ocaml.doc ""]
  | AllowList [@ocaml.doc ""]
  | None [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cookie_object =
  {
  cookies_allow_list: string list option
    [@ocaml.doc
      "The specific cookies to forward to your distribution's origin.\n"];
  option_: forward_values option
    [@ocaml.doc
      "Specifies which cookies to forward to the distribution's origin for a cache behavior: [all], [none], or [allow-list] to forward only the cookies specified in the [cookiesAllowList] parameter.\n"]}
[@@ocaml.doc
  "Describes whether an Amazon Lightsail content delivery network (CDN) distribution forwards cookies to the origin and, if so, which ones.\n\n For the cookies that you specify, your distribution caches separate versions of the specified content based on the cookie values in viewer requests.\n "]
type nonrec header_enum =
  | Referer [@ocaml.doc ""]
  | Origin [@ocaml.doc ""]
  | Host [@ocaml.doc ""]
  | CloudFrontViewerCountry [@ocaml.doc ""]
  | CloudFrontIsTabletViewer [@ocaml.doc ""]
  | CloudFrontIsSmartTVViewer [@ocaml.doc ""]
  | CloudFrontIsMobileViewer [@ocaml.doc ""]
  | CloudFrontIsDesktopViewer [@ocaml.doc ""]
  | CloudFrontForwardedProto [@ocaml.doc ""]
  | Authorization [@ocaml.doc ""]
  | AcceptLanguage [@ocaml.doc ""]
  | AcceptEncoding [@ocaml.doc ""]
  | AcceptDatetime [@ocaml.doc ""]
  | AcceptCharset [@ocaml.doc ""]
  | Accept [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec header_object =
  {
  headers_allow_list: header_enum list option
    [@ocaml.doc
      "The specific headers to forward to your distribution's origin.\n"];
  option_: forward_values option
    [@ocaml.doc
      "The headers that you want your distribution to forward to your origin and base caching on.\n\n You can configure your distribution to do one of the following:\n \n  {ul\n        {-   {b  [all] } - Forward all headers to your origin.\n            \n             }\n        {-   {b  [none] } - Forward only the default headers.\n            \n             }\n        {-   {b  [allow-list] } - Forward only the headers you specify using the [headersAllowList] parameter.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes the request headers that a Lightsail distribution bases caching on.\n\n For the headers that you specify, your distribution caches separate versions of the specified content based on the header values in viewer requests. For example, suppose viewer requests for [logo.jpg] contain a custom [product] header that has a value of either [acme] or [apex], and you configure your distribution to cache your content based on values in the [product] header. Your distribution forwards the [product] header to the origin and caches the response from the origin once for each header value. \n "]
type nonrec query_string_object =
  {
  query_strings_allow_list: string list option
    [@ocaml.doc
      "The specific query strings that the distribution forwards to the origin.\n\n Your distribution will cache content based on the specified query strings.\n \n  If the [option] parameter is true, then your distribution forwards all query strings, regardless of what you specify using the [queryStringsAllowList] parameter.\n  "];
  option_: bool option
    [@ocaml.doc
      "Indicates whether the distribution forwards and caches based on query strings.\n"]}
[@@ocaml.doc
  "Describes the query string parameters that an Amazon Lightsail content delivery network (CDN) distribution to bases caching on.\n\n For the query strings that you specify, your distribution caches separate versions of the specified content based on the query string values in viewer requests.\n "]
type nonrec cache_settings =
  {
  forwarded_query_strings: query_string_object option
    [@ocaml.doc
      "An object that describes the query strings that are forwarded to the origin. Your content is cached based on the query strings that are forwarded.\n"];
  forwarded_headers: header_object option
    [@ocaml.doc
      "An object that describes the headers that are forwarded to the origin. Your content is cached based on the headers that are forwarded.\n"];
  forwarded_cookies: cookie_object option
    [@ocaml.doc
      "An object that describes the cookies that are forwarded to the origin. Your content is cached based on the cookies that are forwarded.\n"];
  cached_http_methods: string option
    [@ocaml.doc
      "The HTTP method responses that are cached by your distribution.\n\n You can specify the following options:\n \n  {ul\n        {-   [GET,HEAD] - The distribution caches responses to the [GET] and [HEAD] methods.\n            \n             }\n        {-   [GET,HEAD,OPTIONS] - The distribution caches responses to the [GET], [HEAD], and [OPTIONS] methods.\n            \n             }\n        }\n  "];
  allowed_http_methods: string option
    [@ocaml.doc
      "The HTTP methods that are processed and forwarded to the distribution's origin.\n\n You can specify the following options:\n \n  {ul\n        {-   [GET,HEAD] - The distribution forwards the [GET] and [HEAD] methods.\n            \n             }\n        {-   [GET,HEAD,OPTIONS] - The distribution forwards the [GET], [HEAD], and [OPTIONS] methods.\n            \n             }\n        {-   [GET,HEAD,OPTIONS,PUT,PATCH,POST,DELETE] - The distribution forwards the [GET], [HEAD], [OPTIONS], [PUT], [PATCH], [POST], and [DELETE] methods.\n            \n             }\n        }\n   If you specify the third option, you might need to restrict access to your distribution's origin so users can't perform operations that you don't want them to. For example, you might not want users to have permission to delete objects from your origin.\n   "];
  maximum_tt_l: int option
    [@ocaml.doc
      "The maximum amount of time that objects stay in the distribution's cache before the distribution forwards another request to the origin to determine whether the object has been updated.\n\n The value specified applies only when the origin adds HTTP headers such as [Cache-Control max-age], [Cache-Control s-maxage], and [Expires] to objects.\n "];
  minimum_tt_l: int option
    [@ocaml.doc
      "The minimum amount of time that objects stay in the distribution's cache before the distribution forwards another request to the origin to determine whether the object has been updated.\n\n A value of [0] must be specified for [minimumTTL] if the distribution is configured to forward all headers to the origin.\n "];
  default_tt_l: int option
    [@ocaml.doc
      "The default amount of time that objects stay in the distribution's cache before the distribution forwards another request to the origin to determine whether the content has been updated.\n\n  The value specified applies only when the origin does not add HTTP headers such as [Cache-Control max-age], [Cache-Control s-maxage], and [Expires] to objects.\n  \n   "]}
[@@ocaml.doc
  "Describes the cache settings of an Amazon Lightsail content delivery network (CDN) distribution.\n\n These settings apply only to your distribution's [cacheBehaviors] (including the [defaultCacheBehavior]) that have a [behavior] of [cache].\n "]
type nonrec cache_behavior_per_path =
  {
  behavior: behavior_enum option
    [@ocaml.doc
      "The cache behavior for the specified path.\n\n You can specify one of the following per-path cache behaviors:\n \n  {ul\n        {-   {b  [cache] } - This behavior caches the specified path. \n            \n             }\n        {-   {b  [dont-cache] } - This behavior doesn't cache the specified path. \n            \n             }\n        }\n  "];
  path: string option
    [@ocaml.doc
      "The path to a directory or file to cached, or not cache. Use an asterisk symbol to specify wildcard directories ([path/to/assets/*]), and file types ([*.html, *jpg,\n        *js]). Directories and file paths are case-sensitive.\n\n Examples:\n \n  {ul\n        {-  Specify the following to cache all files in the document root of an Apache web server running on a Lightsail instance.\n            \n              [var/www/html/] \n             \n              }\n        {-  Specify the following file to cache only the index page in the document root of an Apache web server.\n            \n              [var/www/html/index.html] \n             \n              }\n        {-  Specify the following to cache only the .html files in the document root of an Apache web server.\n            \n              [var/www/html/*.html] \n             \n              }\n        {-  Specify the following to cache only the .jpg, .png, and .gif files in the images sub-directory of the document root of an Apache web server.\n            \n              [var/www/html/images/*.jpg] \n             \n               [var/www/html/images/*.png] \n              \n                [var/www/html/images/*.gif] \n               \n                Specify the following to cache all files in the images sub-directory of the document root of an Apache web server.\n                \n                  [var/www/html/images/] \n                 \n                  }\n        }\n  "]}
[@@ocaml.doc
  "Describes the per-path cache behavior of an Amazon Lightsail content delivery network (CDN) distribution.\n\n A per-path cache behavior is used to override, or add an exception to, the default cache behavior of a distribution. For example, if the [cacheBehavior] is set to [cache], then a per-path cache behavior can be used to specify a directory, file, or file type that your distribution will cache. Alternately, if the distribution's [cacheBehavior] is [dont-cache], then a per-path cache behavior can be used to specify a directory, file, or file type that your distribution will not cache.\n "]
type nonrec update_distribution_request =
  {
  use_default_certificate: bool option
    [@ocaml.doc
      "Indicates whether the default SSL/TLS certificate is attached to the distribution. The default value is [true]. When [true], the distribution uses the default domain name such as [d111111abcdef8.cloudfront.net].\n\n  Set this value to [false] to attach a new certificate to the distribution.\n "];
  certificate_name: string option
    [@ocaml.doc
      "The name of the SSL/TLS certificate that you want to attach to the distribution.\n\n Only certificates with a status of [ISSUED] can be attached to a distribution.\n \n  Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetCertificates.html}GetCertificates} action to get a list of certificate names that you can specify.\n  "];
  viewer_minimum_tls_protocol_version:
    viewer_minimum_tls_protocol_version_enum option
    [@ocaml.doc
      "Use this parameter to update the minimum TLS protocol version for the SSL/TLS certificate that's attached to the distribution.\n"];
  is_enabled: bool option
    [@ocaml.doc "Indicates whether to enable the distribution.\n"];
  cache_behaviors: cache_behavior_per_path list option
    [@ocaml.doc
      "An array of objects that describe the per-path cache behavior for the distribution.\n"];
  cache_behavior_settings: cache_settings option
    [@ocaml.doc
      "An object that describes the cache behavior settings for the distribution.\n\n  The [cacheBehaviorSettings] specified in your [UpdateDistributionRequest] will replace your distribution's existing settings.\n  \n   "];
  default_cache_behavior: cache_behavior option
    [@ocaml.doc
      "An object that describes the default cache behavior for the distribution.\n"];
  origin: input_origin option
    [@ocaml.doc
      "An object that describes the origin resource for the distribution, such as a Lightsail instance, bucket, or load balancer.\n\n The distribution pulls, caches, and serves content from the origin.\n "];
  distribution_name: string
    [@ocaml.doc
      "The name of the distribution to update.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec update_distribution_bundle_result =
  {
  operation: operation option
    [@ocaml.doc
      "An object that describes the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec update_distribution_bundle_request =
  {
  bundle_id: string option
    [@ocaml.doc
      "The bundle ID of the new bundle to apply to your distribution.\n\n Use the [GetDistributionBundles] action to get a list of distribution bundle IDs that you can specify.\n "];
  distribution_name: string option
    [@ocaml.doc
      "The name of the distribution for which to update the bundle.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec tag =
  {
  value: string option
    [@ocaml.doc
      "The value of the tag.\n\n Constraints: Tag values accept a maximum of 256 letters, numbers, spaces in UTF-8, or the following characters: + - = . _ : / \\@\n "];
  key: string option
    [@ocaml.doc
      "The key of the tag.\n\n Constraints: Tag keys accept a maximum of 128 letters, numbers, spaces in UTF-8, or the following characters: + - = . _ : / \\@\n "]}
[@@ocaml.doc
  "Describes a tag key and optional value assigned to an Amazon Lightsail resource.\n\n For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n "]
type nonrec container_service_power_name =
  | Xlarge [@ocaml.doc ""]
  | Large [@ocaml.doc ""]
  | Medium [@ocaml.doc ""]
  | Small [@ocaml.doc ""]
  | Micro [@ocaml.doc ""]
  | Nano [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec container_service_state =
  | DEPLOYING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec container_service_state_detail_code =
  | UNKNOWN_ERROR [@ocaml.doc ""]
  | CERTIFICATE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ACTIVATING_DEPLOYMENT [@ocaml.doc ""]
  | EVALUATING_HEALTH_CHECK [@ocaml.doc ""]
  | CREATING_DEPLOYMENT [@ocaml.doc ""]
  | PROVISIONING_SERVICE [@ocaml.doc ""]
  | PROVISIONING_CERTIFICATE [@ocaml.doc ""]
  | CREATING_NETWORK_INFRASTRUCTURE [@ocaml.doc ""]
  | CREATING_SYSTEM_RESOURCES [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec container_service_state_detail =
  {
  message: string option
    [@ocaml.doc
      "A message that provides more information for the state code.\n\n  The state detail is populated only when a container service is in a [PENDING], [DEPLOYING], or [UPDATING] state.\n  \n   "];
  code: container_service_state_detail_code option
    [@ocaml.doc
      "The state code of the container service.\n\n The following state codes are possible:\n \n  {ul\n        {-  The following state codes are possible if your container service is in a [DEPLOYING] or [UPDATING] state:\n            \n             {ul\n                   {-   [CREATING_SYSTEM_RESOURCES] - The system resources for your container service are being created.\n                       \n                        }\n                   {-   [CREATING_NETWORK_INFRASTRUCTURE] - The network infrastructure for your container service are being created.\n                       \n                        }\n                   {-   [PROVISIONING_CERTIFICATE] - The SSL/TLS certificate for your container service is being created.\n                       \n                        }\n                   {-   [PROVISIONING_SERVICE] - Your container service is being provisioned.\n                       \n                        }\n                   {-   [CREATING_DEPLOYMENT] - Your deployment is being created on your container service.\n                       \n                        }\n                   {-   [EVALUATING_HEALTH_CHECK] - The health of your deployment is being evaluated.\n                       \n                        }\n                   {-   [ACTIVATING_DEPLOYMENT] - Your deployment is being activated.\n                       \n                        }\n                   \n         }\n          }\n        {-  The following state codes are possible if your container service is in a [PENDING] state:\n            \n             {ul\n                   {-   [CERTIFICATE_LIMIT_EXCEEDED] - The SSL/TLS certificate required for your container service exceeds the maximum number of certificates allowed for your account.\n                       \n                        }\n                   {-   [UNKNOWN_ERROR] - An error was experienced when your container service was being created.\n                       \n                        }\n                   \n         }\n          }\n        }\n  "]}
[@@ocaml.doc "Describes the current state of a container service.\n"]
type nonrec container_service_deployment_state =
  | FAILED [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec environment = (string * string) list[@@ocaml.doc ""]
type nonrec container_service_protocol =
  | UDP [@ocaml.doc ""]
  | TCP [@ocaml.doc ""]
  | HTTPS [@ocaml.doc ""]
  | HTTP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec port_map = (string * container_service_protocol) list[@@ocaml.doc
                                                                   ""]
type nonrec container =
  {
  ports: port_map option
    [@ocaml.doc "The open firewall ports of the container.\n"];
  environment: environment option
    [@ocaml.doc "The environment variables of the container.\n"];
  command: string list option
    [@ocaml.doc "The launch command for the container.\n"];
  image: string option
    [@ocaml.doc
      "The name of the image used for the container.\n\n Container images sourced from your Lightsail container service, that are registered and stored on your service, start with a colon ([:]). For example, if your container service name is [container-service-1], the container image label is [mystaticsite], and you want to use the third ([3]) version of the registered container image, then you should specify [:container-service-1.mystaticsite.3]. To use the latest version of a container image, specify [latest] instead of a version number (for example, [:container-service-1.mystaticsite.latest]). Lightsail will automatically use the highest numbered version of the registered container image.\n \n  Container images sourced from a public registry like Docker Hub don't start with a colon. For example, [nginx:latest] or [nginx].\n  "]}
[@@ocaml.doc
  "Describes the settings of a container that will be launched, or that is launched, to an Amazon Lightsail container service.\n"]
type nonrec container_map = (string * container) list[@@ocaml.doc ""]
type nonrec container_service_health_check_config =
  {
  success_codes: string option
    [@ocaml.doc
      "The HTTP codes to use when checking for a successful response from a container. You can specify values between [200] and [499]. You can specify multiple values (for example, [200,202]) or a range of values (for example, [200-299]).\n"];
  path: string option
    [@ocaml.doc
      "The path on the container on which to perform the health check. The default value is [/].\n"];
  interval_seconds: int option
    [@ocaml.doc
      "The approximate interval, in seconds, between health checks of an individual container. You can specify between 5 and 300 seconds. The default value is [5].\n"];
  timeout_seconds: int option
    [@ocaml.doc
      "The amount of time, in seconds, during which no response means a failed health check. You can specify between 2 and 60 seconds. The default value is [2].\n"];
  unhealthy_threshold: int option
    [@ocaml.doc
      "The number of consecutive health check failures required before moving the container to the [Unhealthy] state. The default value is [2].\n"];
  healthy_threshold: int option
    [@ocaml.doc
      "The number of consecutive health checks successes required before moving the container to the [Healthy] state. The default value is [2].\n"]}
[@@ocaml.doc
  "Describes the health check configuration of an Amazon Lightsail container service.\n"]
type nonrec container_service_endpoint =
  {
  health_check: container_service_health_check_config option
    [@ocaml.doc
      "An object that describes the health check configuration of the container.\n"];
  container_port: int option
    [@ocaml.doc
      "The port of the specified container to which traffic is forwarded to.\n"];
  container_name: string option
    [@ocaml.doc
      "The name of the container entry of the deployment that the endpoint configuration applies to.\n"]}
[@@ocaml.doc
  "Describes the public endpoint configuration of a deployment of an Amazon Lightsail container service.\n"]
type nonrec container_service_deployment =
  {
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the deployment was created.\n"];
  public_endpoint: container_service_endpoint option
    [@ocaml.doc "An object that describes the endpoint of the deployment.\n"];
  containers: container_map option
    [@ocaml.doc
      "An object that describes the configuration for the containers of the deployment.\n"];
  state: container_service_deployment_state option
    [@ocaml.doc
      "The state of the deployment.\n\n A deployment can be in one of the following states:\n \n  {ul\n        {-   [ACTIVATING] - The deployment is being created.\n            \n             }\n        {-   [ACTIVE] - The deployment was successfully created, and it's currently running on the container service. The container service can have only one deployment in an active state at a time.\n            \n             }\n        {-   [INACTIVE] - The deployment was previously successfully created, but it is not currently running on the container service.\n            \n             }\n        {-   [FAILED] - The deployment failed. Use the [GetContainerLog] action to view the log events for the containers in the deployment to try to determine the reason for the failure.\n            \n             }\n        }\n  "];
  version: int option [@ocaml.doc "The version number of the deployment.\n"]}
[@@ocaml.doc
  "Describes a container deployment configuration of an Amazon Lightsail container service.\n\n A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service.\n "]
type nonrec container_service_public_domains = (string * string list) list
[@@ocaml.doc ""]
type nonrec container_service_ecr_image_puller_role =
  {
  principal_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the role, if it is activated.\n"];
  is_active: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether the role is activated.\n"]}
[@@ocaml.doc
  "Describes the activation status of the role that you can use to grant an Amazon Lightsail container service access to Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n When activated, Lightsail creates an Identity and Access Management (IAM) role for the specified Lightsail container service. You can use the ARN of the role to create a trust relationship between your Lightsail container service and an Amazon ECR private repository in your Amazon Web Services account. This allows your container service to pull images from Amazon ECR private repositories. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec private_registry_access =
  {
  ecr_image_puller_role: container_service_ecr_image_puller_role option
    [@ocaml.doc
      "An object that describes the activation status of the role that you can use to grant a Lightsail container service access to Amazon ECR private repositories. If the role is activated, the Amazon Resource Name (ARN) of the role is also listed.\n"]}
[@@ocaml.doc
  "Describes the configuration for an Amazon Lightsail container service to access private container image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec container_service =
  {
  private_registry_access: private_registry_access option
    [@ocaml.doc
      "An object that describes the configuration for the container service to access private container image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "];
  url: string option
    [@ocaml.doc
      "The publicly accessible URL of the container service.\n\n If no public endpoint is specified in the [currentDeployment], this URL returns a 404 response.\n "];
  public_domain_names: container_service_public_domains option
    [@ocaml.doc
      "The public domain name of the container service, such as [example.com] and [www.example.com].\n\n You can specify up to four public domain names for a container service. The domain names that you specify are used when you create a deployment with a container configured as the public endpoint of your container service.\n \n  If you don't specify public domain names, then you can use the default domain of the container service.\n  \n    You must create and validate an SSL/TLS certificate before you can use public domain names with your container service. Use the [CreateCertificate] action to create a certificate for the public domain names you want to use with your container service.\n    \n      See [CreateContainerService] or [UpdateContainerService] for information about how to specify public domain names for your Lightsail container service.\n      "];
  private_domain_name: string option
    [@ocaml.doc
      "The private domain name of the container service.\n\n The private domain name is accessible only by other resources within the default virtual private cloud (VPC) of your Lightsail account.\n "];
  principal_arn: string option
    [@ocaml.doc
      "The principal ARN of the container service.\n\n The principal ARN can be used to create a trust relationship between your standard Amazon Web Services account and your Lightsail container service. This allows you to give your service permission to access resources in your standard Amazon Web Services account.\n "];
  is_disabled: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the container service is disabled.\n"];
  next_deployment: container_service_deployment option
    [@ocaml.doc
      "An object that describes the next deployment of the container service.\n\n This value is [null] when there is no deployment in a [pending] state.\n "];
  current_deployment: container_service_deployment option
    [@ocaml.doc
      "An object that describes the current container deployment of the container service.\n"];
  scale: int option
    [@ocaml.doc
      "The scale specification of the container service.\n\n The scale specifies the allocated compute nodes of the container service.\n "];
  state_detail: container_service_state_detail option
    [@ocaml.doc
      "An object that describes the current state of the container service.\n\n  The state detail is populated only when a container service is in a [PENDING], [DEPLOYING], or [UPDATING] state.\n  \n   "];
  state: container_service_state option
    [@ocaml.doc
      "The current state of the container service.\n\n The following container service states are possible:\n \n  {ul\n        {-   [PENDING] - The container service is being created.\n            \n             }\n        {-   [READY] - The container service is running but it does not have an active container deployment.\n            \n             }\n        {-   [DEPLOYING] - The container service is launching a container deployment.\n            \n             }\n        {-   [RUNNING] - The container service is running and it has an active container deployment.\n            \n             }\n        {-   [UPDATING] - The container service capacity or its custom domains are being updated.\n            \n             }\n        {-   [DELETING] - The container service is being deleted.\n            \n             }\n        {-   [DISABLED] - The container service is disabled, and its active deployment and containers, if any, are shut down.\n            \n             }\n        }\n  "];
  power_id: string option
    [@ocaml.doc "The ID of the power of the container service.\n"];
  power: container_service_power_name option
    [@ocaml.doc
      "The power specification of the container service.\n\n The power specifies the amount of RAM, the number of vCPUs, and the base price of the container service.\n "];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type of the container service.\n"];
  location: resource_location option
    [@ocaml.doc
      "An object that describes the location of the container service, such as the Amazon Web Services Region and Availability Zone.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the container service was created.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the container service.\n"];
  container_service_name: string option
    [@ocaml.doc "The name of the container service.\n"]}[@@ocaml.doc
                                                          "Describes an Amazon Lightsail container service.\n"]
type nonrec update_container_service_result =
  {
  container_service: container_service option
    [@ocaml.doc "An object that describes a container service.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec container_service_ecr_image_puller_role_request =
  {
  is_active: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to activate the role.\n"]}
[@@ocaml.doc
  "Describes a request to activate or deactivate the role that you can use to grant an Amazon Lightsail container service access to Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n When activated, Lightsail creates an Identity and Access Management (IAM) role for the specified Lightsail container service. You can use the ARN of the role to create a trust relationship between your Lightsail container service and an Amazon ECR private repository in your Amazon Web Services account. This allows your container service to pull images from Amazon ECR private repositories. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec private_registry_access_request =
  {
  ecr_image_puller_role:
    container_service_ecr_image_puller_role_request option
    [@ocaml.doc
      "An object to describe a request to activate or deactivate the role that you can use to grant an Amazon Lightsail container service access to Amazon Elastic Container Registry (Amazon ECR) private repositories.\n"]}
[@@ocaml.doc
  "Describes a request to configure an Amazon Lightsail container service to access private container image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec update_container_service_request =
  {
  private_registry_access: private_registry_access_request option
    [@ocaml.doc
      "An object to describe the configuration for the container service to access private container image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "];
  public_domain_names: container_service_public_domains option
    [@ocaml.doc
      "The public domain names to use with the container service, such as [example.com] and [www.example.com].\n\n You can specify up to four public domain names for a container service. The domain names that you specify are used when you create a deployment with a container configured as the public endpoint of your container service.\n \n  If you don't specify public domain names, then you can use the default domain of the container service.\n  \n    You must create and validate an SSL/TLS certificate before you can use public domain names with your container service. Use the [CreateCertificate] action to create a certificate for the public domain names you want to use with your container service.\n    \n      You can specify public domain names using a string to array map as shown in the example later on this page.\n      "];
  is_disabled: bool option
    [@ocaml.doc
      "A Boolean value to indicate whether the container service is disabled.\n"];
  scale: int option
    [@ocaml.doc
      "The scale for the container service.\n\n The scale specifies the allocated compute nodes of the container service. The [power] and [scale] of a container service makes up its configured capacity. To determine the monthly price of your container service, multiply the base price of the [power] with the [scale] (the number of nodes) of the service.\n "];
  power: container_service_power_name option
    [@ocaml.doc
      "The power for the container service.\n\n The power specifies the amount of memory, vCPUs, and base monthly cost of each node of the container service. The [power] and [scale] of a container service makes up its configured capacity. To determine the monthly price of your container service, multiply the base price of the [power] with the [scale] (the number of nodes) of the service.\n \n  Use the [GetContainerServicePowers] action to view the specifications of each power option.\n  "];
  service_name: string
    [@ocaml.doc "The name of the container service to update.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec access_type =
  | Private [@ocaml.doc ""]
  | Public [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec access_rules =
  {
  allow_public_overrides: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether the access control list (ACL) permissions that are applied to individual objects override the [getObject] option that is currently specified.\n\n When this is true, you can use the {{:https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObjectAcl.html}PutObjectAcl} Amazon S3 API action to set individual objects to public (read-only) using the [public-read] ACL, or to private using the [private] ACL.\n "];
  get_object: access_type option
    [@ocaml.doc
      "Specifies the anonymous access to all objects in a bucket.\n\n The following options can be specified:\n \n  {ul\n        {-   [public] - Sets all objects in the bucket to public (read-only), making them readable by anyone in the world.\n            \n             If the [getObject] value is set to [public], then all objects in the bucket default to public regardless of the [allowPublicOverrides] value.\n             \n              }\n        {-   [private] - Sets all objects in the bucket to private, making them readable only by you or anyone you give access to.\n            \n             If the [getObject] value is set to [private], and the [allowPublicOverrides] value is set to [true], then all objects in the bucket default to private unless they are configured with a [public-read] ACL. Individual objects with a [public-read] ACL are readable by anyone in the world.\n             \n              }\n        }\n  "]}
[@@ocaml.doc
  "Describes the anonymous access permissions for an Amazon Lightsail bucket and its objects.\n\n For more information about bucket access permissions, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-understanding-bucket-permissions}Understanding bucket permissions in Amazon Lightsail} in the \n \n   {i Amazon Lightsail Developer Guide}.\n  "]
type nonrec resource_receiving_access =
  {
  resource_type: string option
    [@ocaml.doc "The Lightsail resource type (for example, [Instance]).\n"];
  name: string option [@ocaml.doc "The name of the Lightsail instance.\n"]}
[@@ocaml.doc
  "Describes an Amazon Lightsail instance that has access to a Lightsail bucket.\n"]
type nonrec bucket_state =
  {
  message: string option
    [@ocaml.doc "A message that describes the state of the bucket.\n"];
  code: string option
    [@ocaml.doc
      "The state code of the bucket.\n\n The following codes are possible:\n \n  {ul\n        {-   [OK] - The bucket is in a running state.\n            \n             }\n        {-   [Unknown] - Creation of the bucket might have timed-out. You might want to delete the bucket and create a new one.\n            \n             }\n        }\n  "]}
[@@ocaml.doc "Describes the state of an Amazon Lightsail bucket.\n"]
type nonrec bucket_access_log_config =
  {
  prefix: string option
    [@ocaml.doc
      "The optional object prefix for the bucket access log.\n\n The prefix is an optional addition to the object key that organizes your access log files in the destination bucket. For example, if you specify a [logs/] prefix, then each log object will begin with the [logs/] prefix in its key (for example, [logs/2021-11-01-21-32-16-E568B2907131C0C0]).\n \n   This parameter can be optionally specified when enabling the access log for a bucket, and should be omitted when disabling the access log.\n   \n    "];
  destination: string option
    [@ocaml.doc
      "The name of the bucket where the access logs are saved. The destination can be a Lightsail bucket in the same account, and in the same Amazon Web Services Region as the source bucket.\n\n  This parameter is required when enabling the access log for a bucket, and should be omitted when disabling the access log.\n  \n   "];
  enabled: bool
    [@ocaml.doc
      "A Boolean value that indicates whether bucket access logging is enabled for the bucket.\n"]}
[@@ocaml.doc
  "Describes the access log configuration for a bucket in the Amazon Lightsail object storage service.\n\n For more information about bucket access logs, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-bucket-access-logs}Logging bucket requests using access logging in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec bucket =
  {
  access_log_config: bucket_access_log_config option
    [@ocaml.doc
      "An object that describes the access log configuration for the bucket.\n"];
  state: bucket_state option
    [@ocaml.doc "An object that describes the state of the bucket.\n"];
  resources_receiving_access: resource_receiving_access list option
    [@ocaml.doc
      "An array of objects that describe Lightsail instances that have access to the bucket.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html}SetResourceAccessForBucket} action to update the instances that have access to a bucket.\n "];
  readonly_access_accounts: string list option
    [@ocaml.doc
      "An array of strings that specify the Amazon Web Services account IDs that have read-only access to the bucket.\n"];
  able_to_update_bundle: bool option
    [@ocaml.doc
      "Indicates whether the bundle that is currently applied to a bucket can be changed to another bundle.\n\n You can update a bucket's bundle only one time within a monthly Amazon Web Services billing cycle.\n \n  Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html}UpdateBucketBundle} action to change a bucket's bundle.\n  "];
  object_versioning: string option
    [@ocaml.doc
      "Indicates whether object versioning is enabled for the bucket.\n\n The following options can be configured:\n \n  {ul\n        {-   [Enabled] - Object versioning is enabled.\n            \n             }\n        {-   [Suspended] - Object versioning was previously enabled but is currently suspended. Existing object versions are retained.\n            \n             }\n        {-   [NeverEnabled] - Object versioning has never been enabled.\n            \n             }\n        }\n  "];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the bucket. For more information, see {{:https://lightsail.aws.amazon.com/ls/docs/en/articles/amazon-lightsail-tags}Tags in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code for a bucket. Include this code in your email to support when you have questions about a Lightsail bucket. This code enables our support team to look up your Lightsail information more easily.\n"];
  name: string option [@ocaml.doc "The name of the bucket.\n"];
  location: resource_location option
    [@ocaml.doc
      "An object that describes the location of the bucket, such as the Amazon Web Services Region and Availability Zone.\n"];
  url: string option [@ocaml.doc "The URL of the bucket.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the distribution was created.\n"];
  bundle_id: string option
    [@ocaml.doc
      "The ID of the bundle currently applied to the bucket.\n\n A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket.\n \n  Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html}UpdateBucketBundle} action to change the bundle of a bucket.\n  "];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the bucket.\n"];
  access_rules: access_rules option
    [@ocaml.doc "An object that describes the access rules of the bucket.\n"];
  resource_type: string option
    [@ocaml.doc "The Lightsail resource type of the bucket.\n"]}[@@ocaml.doc
                                                                  "Describes an Amazon Lightsail bucket.\n"]
type nonrec update_bucket_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"];
  bucket: bucket option
    [@ocaml.doc "An object that describes the bucket that is updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_bucket_request =
  {
  access_log_config: bucket_access_log_config option
    [@ocaml.doc
      "An object that describes the access log configuration for the bucket.\n"];
  readonly_access_accounts: string list option
    [@ocaml.doc
      "An array of strings to specify the Amazon Web Services account IDs that can access the bucket.\n\n You can give a maximum of 10 Amazon Web Services accounts access to a bucket.\n "];
  versioning: string option
    [@ocaml.doc
      "Specifies whether to enable or suspend versioning of objects in the bucket.\n\n The following options can be specified:\n \n  {ul\n        {-   [Enabled] - Enables versioning of objects in the specified bucket.\n            \n             }\n        {-   [Suspended] - Suspends versioning of objects in the specified bucket. Existing object versions are retained.\n            \n             }\n        }\n  "];
  access_rules: access_rules option
    [@ocaml.doc
      "An object that sets the public accessibility of objects in the specified bucket.\n"];
  bucket_name: string [@ocaml.doc "The name of the bucket to update.\n"]}
[@@ocaml.doc ""]
type nonrec update_bucket_bundle_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec update_bucket_bundle_request =
  {
  bundle_id: string
    [@ocaml.doc
      "The ID of the new bundle to apply to the bucket.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketBundles.html}GetBucketBundles} action to get a list of bundle IDs that you can specify.\n "];
  bucket_name: string
    [@ocaml.doc "The name of the bucket for which to update the bundle.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc "The tag keys to delete from the specified resource.\n"];
  resource_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource from which you want to remove a tag.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the resource from which you are removing a tag.\n"]}
[@@ocaml.doc ""]
type nonrec unpeer_vpc_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec treat_missing_data =
  | Missing [@ocaml.doc ""]
  | Ignore [@ocaml.doc ""]
  | NotBreaching [@ocaml.doc ""]
  | Breaching [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec time_period =
  {
  end_: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The end of the time period. The end date is exclusive. For example, if [end] is [2017-05-01], Lightsail for Research retrieves cost and usage data from the start date up to, but not including, [2017-05-01].\n"];
  start: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The beginning of the time period. The start date is inclusive. For example, if [start] is [2017-01-01], Lightsail for Research retrieves cost and usage data starting at [2017-01-01] up to the end date. The start date must be equal to or no later than the current date to avoid a validation error.\n"]}
[@@ocaml.doc
  "Sets the start date and end date for retrieving a cost estimate. The start date is inclusive, but the end date is exclusive. For example, if [start] is [2017-01-01] and [end] is [2017-05-01], then the cost and usage data is retrieved from [2017-01-01] up to and including [2017-04-30] but not including [2017-05-01].\n"]
type nonrec test_alarm_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec alarm_state =
  | INSUFFICIENT_DATA [@ocaml.doc ""]
  | ALARM [@ocaml.doc ""]
  | OK [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec test_alarm_request =
  {
  state: alarm_state
    [@ocaml.doc
      "The alarm state to test.\n\n An alarm has the following possible states that can be tested:\n \n  {ul\n        {-   [ALARM] - The metric is outside of the defined threshold.\n            \n             }\n        {-   [INSUFFICIENT_DATA] - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.\n            \n             }\n        {-   [OK] - The metric is within the defined threshold.\n            \n             }\n        }\n  "];
  alarm_name: string [@ocaml.doc "The name of the alarm to test.\n"]}
[@@ocaml.doc ""]
type nonrec tag_resource_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag list [@ocaml.doc "The tag key and optional value.\n"];
  resource_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to which you want to add a tag.\n"];
  resource_name: string
    [@ocaml.doc "The name of the resource to which you are adding tags.\n"]}
[@@ocaml.doc ""]
type nonrec stop_relational_database_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec stop_relational_database_request =
  {
  relational_database_snapshot_name: string option
    [@ocaml.doc
      "The name of your new database snapshot to be created before stopping your database.\n"];
  relational_database_name: string
    [@ocaml.doc "The name of your database to stop.\n"]}[@@ocaml.doc ""]
type nonrec stop_instance_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec stop_instance_request =
  {
  force: bool option
    [@ocaml.doc
      "When set to [True], forces a Lightsail instance that is stuck in a [stopping] state to stop.\n\n  Only use the [force] parameter if your instance is stuck in the [stopping] state. In any other state, your instance should stop normally without adding this parameter to your API request.\n  \n   "];
  instance_name: string
    [@ocaml.doc
      "The name of the instance (a virtual private server) to stop.\n"]}
[@@ocaml.doc ""]
type nonrec stop_instance_on_idle_request =
  {
  duration: string option
    [@ocaml.doc
      "The amount of idle time in minutes after which your virtual computer will automatically stop.\n"];
  threshold: string option
    [@ocaml.doc "The value to compare with the duration.\n"]}[@@ocaml.doc
                                                               "Describes a request to create or edit the [StopInstanceOnIdle] add-on.\n\n  This add-on only applies to Lightsail for Research resources.\n  \n   "]
type nonrec stop_gui_session_result =
  {
  operations: operation list option
    [@ocaml.doc "The available API operations.\n"]}[@@ocaml.doc ""]
type nonrec stop_gui_session_request =
  {
  resource_name: string [@ocaml.doc "The resource name.\n"]}[@@ocaml.doc ""]
type nonrec status_type =
  | Inactive [@ocaml.doc ""]
  | Active [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec status =
  | FailedStoppingGUISession [@ocaml.doc ""]
  | FailedStartingGUISession [@ocaml.doc ""]
  | FailedInstanceCreation [@ocaml.doc ""]
  | SettingUpInstance [@ocaml.doc ""]
  | Stopping [@ocaml.doc ""]
  | Stopped [@ocaml.doc ""]
  | Starting [@ocaml.doc ""]
  | Started [@ocaml.doc ""]
  | NotStarted [@ocaml.doc ""]
  | StartExpired [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec static_ip =
  {
  is_attached: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the static IP is attached.\n"];
  attached_to: string option
    [@ocaml.doc
      "The instance where the static IP is attached ([Amazon_Linux-1GB-Ohio-1]).\n"];
  ip_address: string option [@ocaml.doc "The static IP address.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The resource type (usually [StaticIp]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The region and Availability Zone where the static IP was created.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the static IP was created ([1479735304.222]).\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the static IP ([arn:aws:lightsail:us-east-2:123456789101:StaticIp/9cbb4a9e-f8e3-4dfe-b57e-12345EXAMPLE]).\n"];
  name: string option
    [@ocaml.doc "The name of the static IP ([StaticIP-Ohio-EXAMPLE]).\n"]}
[@@ocaml.doc "Describes a static IP.\n"]
type nonrec start_relational_database_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec start_relational_database_request =
  {
  relational_database_name: string
    [@ocaml.doc "The name of your database to start.\n"]}[@@ocaml.doc ""]
type nonrec start_instance_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec start_instance_request =
  {
  instance_name: string
    [@ocaml.doc
      "The name of the instance (a virtual private server) to start.\n"]}
[@@ocaml.doc ""]
type nonrec start_gui_session_result =
  {
  operations: operation list option
    [@ocaml.doc "The available API operations.\n"]}[@@ocaml.doc ""]
type nonrec start_gui_session_request =
  {
  resource_name: string [@ocaml.doc "The resource name.\n"]}[@@ocaml.doc ""]
type nonrec setup_instance_https_result =
  {
  operations: operation list option
    [@ocaml.doc "The available API operations for [SetupInstanceHttps].\n"]}
[@@ocaml.doc ""]
type nonrec setup_instance_https_request =
  {
  certificate_provider: certificate_provider
    [@ocaml.doc
      "The certificate authority that issues the SSL/TLS certificate.\n"];
  domain_names: string list
    [@ocaml.doc
      "The name of the domain and subdomains that were specified for the SSL/TLS certificate.\n"];
  email_address: string
    [@ocaml.doc
      "The contact method for SSL/TLS certificate renewal alerts. You can enter one email address. \n"];
  instance_name: string [@ocaml.doc "The name of the Lightsail instance.\n"]}
[@@ocaml.doc ""]
type nonrec set_resource_access_for_bucket_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec resource_bucket_access =
  | Deny [@ocaml.doc ""]
  | Allow [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec set_resource_access_for_bucket_request =
  {
  access: resource_bucket_access
    [@ocaml.doc
      "The access setting.\n\n The following access settings are available:\n \n  {ul\n        {-   [allow] - Allows access to the bucket and its objects.\n            \n             }\n        {-   [deny] - Denies access to the bucket and its objects. Use this setting to remove access for a resource previously set to [allow].\n            \n             }\n        }\n  "];
  bucket_name: string
    [@ocaml.doc
      "The name of the bucket for which to set access to another Lightsail resource.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the Lightsail instance for which to set bucket access. The instance must be in a running or stopped state.\n"]}
[@@ocaml.doc ""]
type nonrec set_ip_address_type_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec ip_address_type =
  | IPV6 [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""]
  | DUALSTACK [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec set_ip_address_type_request =
  {
  accept_bundle_update: bool option
    [@ocaml.doc
      "Required parameter to accept the instance bundle update when changing to, and from, IPv6-only.\n\n  An instance bundle will change when switching from [dual-stack] or [ipv4], to [ipv6]. It also changes when switching from [ipv6], to [dual-stack] or [ipv4].\n  \n   You must include this parameter in the command to update the bundle. For example, if you switch from [dual-stack] to [ipv6], the bundle will be updated, and billing for the IPv6-only instance bundle begins immediately.\n   \n    "];
  ip_address_type: ip_address_type
    [@ocaml.doc
      "The IP address type to set for the specified resource.\n\n The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and [dualstack] for IPv4 and IPv6.\n "];
  resource_name: string
    [@ocaml.doc
      "The name of the resource for which to set the IP address type.\n"];
  resource_type: resource_type
    [@ocaml.doc
      "The resource type.\n\n The resource values are [Distribution], [Instance], and [LoadBalancer].\n \n   Distribution-related APIs are available only in the N. Virginia ([us-east-1]) Amazon Web Services Region. Set your Amazon Web Services Region configuration to [us-east-1] to create, view, or edit distributions.\n   \n    "]}
[@@ocaml.doc ""]
type nonrec session =
  {
  is_primary: bool option
    [@ocaml.doc
      "When true, this Boolean value indicates the primary session for the specified resource.\n"];
  url: string option [@ocaml.doc "The session URL.\n"];
  name: string option [@ocaml.doc "The session name.\n"]}[@@ocaml.doc
                                                           "Describes a web-based, remote graphical user interface (GUI), Amazon DCV session. The session is used to access a virtual computer\226\128\153s operating system or application.\n"]
type nonrec send_contact_method_verification_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec contact_method_verification_protocol =
  | Email [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec send_contact_method_verification_request =
  {
  protocol: contact_method_verification_protocol
    [@ocaml.doc
      "The protocol to verify, such as [Email] or [SMS] (text messaging).\n"]}
[@@ocaml.doc ""]
type nonrec pricing_unit =
  | Queries [@ocaml.doc ""]
  | Bundles [@ocaml.doc ""]
  | GBMo [@ocaml.doc ""]
  | Hrs [@ocaml.doc ""]
  | GB [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec currency =
  | USD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec estimate_by_time =
  {
  time_period: time_period option
    [@ocaml.doc
      "The period of time, in days, that an estimate covers. The period has a start date and an end date. The start date must come before the end date.\n"];
  currency: currency option
    [@ocaml.doc "The currency of the estimate in USD.\n"];
  unit_: float option
    [@ocaml.doc
      "The number of pricing units used to calculate the total number of hours. For example, 1 unit equals 1 hour.\n"];
  pricing_unit: pricing_unit option
    [@ocaml.doc
      "The unit of measurement that's used for the cost estimate.\n"];
  usage_cost: float option
    [@ocaml.doc
      "The amount of cost or usage that's measured for the cost estimate.\n"]}
[@@ocaml.doc "An estimate that's associated with a time period. \n"]
type nonrec cost_estimate =
  {
  results_by_time: estimate_by_time list option
    [@ocaml.doc
      "The cost estimate result that's associated with a time period.\n"];
  usage_type: string option
    [@ocaml.doc
      "The types of usage that are included in the estimate, such as costs, usage, or data transfer.\n"]}
[@@ocaml.doc
  "Describes the estimated cost for resources in your Lightsail for Research account.\n"]
type nonrec resource_budget_estimate =
  {
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The estimate end time.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The estimate start time.\n"];
  cost_estimates: cost_estimate list option
    [@ocaml.doc "The cost estimate for the specified budget.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of resource the budget will track.\n"];
  resource_name: string option [@ocaml.doc "The resource name.\n"]}[@@ocaml.doc
                                                                    "Describes the estimated cost or usage that a budget tracks.\n"]
type nonrec resource_record =
  {
  value: string option [@ocaml.doc "The value for the DNS record.\n"];
  type_: string option [@ocaml.doc "The DNS record type.\n"];
  name: string option [@ocaml.doc "The name of the record.\n"]}[@@ocaml.doc
                                                                 "Describes the domain name system (DNS) records to add to your domain's DNS to validate it for an Amazon Lightsail certificate.\n"]
type nonrec reset_distribution_cache_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"];
  create_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp of the reset cache request ([1479734909.17]) in Unix time format.\n"];
  status: string option
    [@ocaml.doc "The status of the reset cache request.\n"]}[@@ocaml.doc ""]
type nonrec reset_distribution_cache_request =
  {
  distribution_name: string option
    [@ocaml.doc
      "The name of the distribution for which to reset cache.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec dns_record_creation_state_code =
  | Failed [@ocaml.doc ""]
  | Started [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec dns_record_creation_state =
  {
  message: string option
    [@ocaml.doc
      "The message that describes the reason for the status code.\n"];
  code: dns_record_creation_state_code option
    [@ocaml.doc
      "The status code for the automated DNS record creation.\n\n Following are the possible values:\n \n  {ul\n        {-   [SUCCEEDED] - The validation records were successfully added to the domain.\n            \n             }\n        {-   [STARTED] - The automatic DNS record creation has started.\n            \n             }\n        {-   [FAILED] - The validation records failed to be added to the domain.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes the creation state of the canonical name (CNAME) records that are automatically added by Amazon Lightsail to the DNS of a domain to validate domain ownership for an SSL/TLS certificate.\n\n When you create an SSL/TLS certificate for a Lightsail resource, you must add a set of CNAME records to the DNS of the domains for the certificate to validate that you own the domains. Lightsail can automatically add the CNAME records to the DNS of the domain if the DNS zone for the domain exists within your Lightsail account. If automatic record addition fails, or if you manage the DNS of your domain using a third-party service, then you must manually add the CNAME records to the DNS of your domain. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/verify-tls-ssl-certificate-using-dns-cname-https}Verify an SSL/TLS certificate in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec certificate_domain_validation_status =
  | Success [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | PendingValidation [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec domain_validation_record =
  {
  validation_status: certificate_domain_validation_status option
    [@ocaml.doc "The validation status of the record.\n"];
  dns_record_creation_state: dns_record_creation_state option
    [@ocaml.doc
      "An object that describes the state of the canonical name (CNAME) records that are automatically added by Lightsail to the DNS of the domain to validate domain ownership.\n"];
  resource_record: resource_record option
    [@ocaml.doc
      "An object that describes the DNS records to add to your domain's DNS to validate it for the certificate.\n"];
  domain_name: string option
    [@ocaml.doc
      "The domain name of the certificate validation record. For example, [example.com] or [www.example.com].\n"]}
[@@ocaml.doc
  "Describes the domain name system (DNS) records that you must add to the DNS of your registered domain to validate ownership for an Amazon Lightsail SSL/TLS certificate.\n"]
type nonrec renewal_status =
  | Failed [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | PendingValidation [@ocaml.doc ""]
  | PendingAutoRenewal [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec renewal_summary =
  {
  updated_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the certificate was last updated.\n"];
  renewal_status_reason: string option
    [@ocaml.doc "The reason for the renewal status of the certificate.\n"];
  renewal_status: renewal_status option
    [@ocaml.doc
      "The renewal status of the certificate.\n\n The following renewal status are possible:\n \n  {ul\n        {-   {b  [PendingAutoRenewal] } - Lightsail is attempting to automatically validate the domain names of the certificate. No further action is required. \n            \n             }\n        {-   {b  [PendingValidation] } - Lightsail couldn't automatically validate one or more domain names of the certificate. You must take action to validate these domain names or the certificate won't be renewed. Check to make sure your certificate's domain validation records exist in your domain's DNS, and that your certificate remains in use.\n            \n             }\n        {-   {b  [Success] } - All domain names in the certificate are validated, and Lightsail renewed the certificate. No further action is required. \n            \n             }\n        {-   {b  [Failed] } - One or more domain names were not validated before the certificate expired, and Lightsail did not renew the certificate. You can request a new certificate using the [CreateCertificate] action.\n            \n             }\n        }\n  "];
  domain_validation_records: domain_validation_record list option
    [@ocaml.doc
      "An array of objects that describe the domain validation records of the certificate.\n"]}
[@@ocaml.doc
  "Describes the status of a SSL/TLS certificate renewal managed by Amazon Lightsail.\n"]
type nonrec release_static_ip_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec release_static_ip_request =
  {
  static_ip_name: string
    [@ocaml.doc "The name of the static IP to delete.\n"]}[@@ocaml.doc ""]
type nonrec relational_database_snapshot =
  {
  from_relational_database_blueprint_id: string option
    [@ocaml.doc
      "The blueprint ID of the database from which the database snapshot was created. A blueprint describes the major engine version of a database.\n"];
  from_relational_database_bundle_id: string option
    [@ocaml.doc
      "The bundle ID of the database from which the database snapshot was created.\n"];
  from_relational_database_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the database from which the database snapshot was created.\n"];
  from_relational_database_name: string option
    [@ocaml.doc
      "The name of the source database from which the database snapshot was created.\n"];
  state: string option [@ocaml.doc "The state of the database snapshot.\n"];
  size_in_gb: int option
    [@ocaml.doc
      "The size of the disk in GB (for example, [32]) for the database snapshot.\n"];
  engine_version: string option
    [@ocaml.doc
      "The database engine version for the database snapshot (for example, [5.7.23]).\n"];
  engine: string option
    [@ocaml.doc
      "The software of the database snapshot (for example, [MySQL])\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type.\n"];
  location: resource_location option
    [@ocaml.doc
      "The Region name and Availability Zone where the database snapshot is located.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the database snapshot was created.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code for the database snapshot. Include this code in your email to support when you have questions about a database snapshot in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the database snapshot.\n"];
  name: string option [@ocaml.doc "The name of the database snapshot.\n"]}
[@@ocaml.doc "Describes a database snapshot.\n"]
type nonrec relational_database_password_version =
  | PENDING [@ocaml.doc ""]
  | PREVIOUS [@ocaml.doc ""]
  | CURRENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec relational_database_metric_name =
  | NetworkTransmitThroughput [@ocaml.doc ""]
  | NetworkReceiveThroughput [@ocaml.doc ""]
  | FreeStorageSpace [@ocaml.doc ""]
  | DiskQueueDepth [@ocaml.doc ""]
  | DatabaseConnections [@ocaml.doc ""]
  | CPUUtilization [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec relational_database_hardware =
  {
  ram_size_in_gb: float option
    [@ocaml.doc "The amount of RAM in GB for the database.\n"];
  disk_size_in_gb: int option
    [@ocaml.doc "The size of the disk for the database.\n"];
  cpu_count: int option
    [@ocaml.doc "The number of vCPUs for the database.\n"]}[@@ocaml.doc
                                                             "Describes the hardware of a database.\n"]
type nonrec pending_modified_relational_database_values =
  {
  backup_retention_enabled: bool option
    [@ocaml.doc
      "A Boolean value indicating whether automated backup retention is enabled.\n"];
  engine_version: string option [@ocaml.doc "The database engine version.\n"];
  master_user_password: string option
    [@ocaml.doc "The password for the master user of the database.\n"]}
[@@ocaml.doc "Describes a pending database value modification.\n"]
type nonrec relational_database_endpoint =
  {
  address: string option
    [@ocaml.doc "Specifies the DNS address of the database.\n"];
  port: int option
    [@ocaml.doc "Specifies the port that the database is listening on.\n"]}
[@@ocaml.doc "Describes an endpoint for a database.\n"]
type nonrec pending_maintenance_action =
  {
  current_apply_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The effective date of the pending database maintenance action.\n"];
  description: string option
    [@ocaml.doc
      "Additional detail about the pending database maintenance action.\n"];
  action: string option
    [@ocaml.doc "The type of pending database maintenance action.\n"]}
[@@ocaml.doc "Describes a pending database maintenance action.\n"]
type nonrec relational_database =
  {
  ca_certificate_identifier: string option
    [@ocaml.doc "The certificate associated with the database.\n"];
  pending_maintenance_actions: pending_maintenance_action list option
    [@ocaml.doc
      "Describes the pending maintenance actions for the database.\n"];
  master_endpoint: relational_database_endpoint option
    [@ocaml.doc "The master endpoint for the database.\n"];
  publicly_accessible: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the database is publicly accessible.\n"];
  preferred_maintenance_window: string option
    [@ocaml.doc
      "The weekly time range during which system maintenance can occur on the database.\n\n In the format [ddd:hh24:mi-ddd:hh24:mi]. For example, [Tue:17:00-Tue:17:30].\n "];
  preferred_backup_window: string option
    [@ocaml.doc
      "The daily time range during which automated backups are created for the database (for example, [16:00-16:30]).\n"];
  parameter_apply_status: string option
    [@ocaml.doc "The status of parameter updates for the database.\n"];
  master_username: string option
    [@ocaml.doc "The master user name of the database.\n"];
  latest_restorable_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The latest point in time to which the database can be restored. Formatted in Unix time.\n"];
  engine_version: string option
    [@ocaml.doc "The database engine version (for example, [5.7.23]).\n"];
  engine: string option
    [@ocaml.doc "The database software (for example, [MySQL]).\n"];
  pending_modified_values: pending_modified_relational_database_values option
    [@ocaml.doc "Describes pending database value modifications.\n"];
  backup_retention_enabled: bool option
    [@ocaml.doc
      "A Boolean value indicating whether automated backup retention is enabled for the database.\n"];
  secondary_availability_zone: string option
    [@ocaml.doc
      "Describes the secondary Availability Zone of a high availability database.\n\n The secondary database is used for failover support of a high availability database.\n "];
  state: string option
    [@ocaml.doc "Describes the current state of the database.\n"];
  hardware: relational_database_hardware option
    [@ocaml.doc "Describes the hardware of the database.\n"];
  master_database_name: string option
    [@ocaml.doc
      "The name of the master database created when the Lightsail database resource is created.\n"];
  relational_database_bundle_id: string option
    [@ocaml.doc
      "The bundle ID for the database. A bundle describes the performance specifications for your database.\n"];
  relational_database_blueprint_id: string option
    [@ocaml.doc
      "The blueprint ID for the database. A blueprint describes the major engine version of a database.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The Lightsail resource type for the database (for example, [RelationalDatabase]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The Region name and Availability Zone where the database is located.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the database was created. Formatted in Unix time.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code for the database. Include this code in your email to support when you have questions about a database in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the database.\n"];
  name: string option
    [@ocaml.doc "The unique name of the database resource in Lightsail.\n"]}
[@@ocaml.doc "Describes a database.\n"]
type nonrec relational_database_event =
  {
  event_categories: string list option
    [@ocaml.doc "The category that the database event belongs to.\n"];
  message: string option [@ocaml.doc "The message of the database event.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the database event was created.\n"];
  resource: string option
    [@ocaml.doc "The database that the database event relates to.\n"]}
[@@ocaml.doc "Describes an event for a database.\n"]
type nonrec relational_database_engine =
  | MYSQL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec relational_database_bundle =
  {
  is_active: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the database bundle is active.\n"];
  is_encrypted: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the database bundle is encrypted.\n"];
  cpu_count: int option
    [@ocaml.doc
      "The number of virtual CPUs (vCPUs) for the database bundle.\n"];
  transfer_per_month_in_gb: int option
    [@ocaml.doc
      "The data transfer rate per month in GB for the database bundle.\n"];
  disk_size_in_gb: int option
    [@ocaml.doc "The size of the disk for the database bundle.\n"];
  ram_size_in_gb: float option
    [@ocaml.doc
      "The amount of RAM in GB (for example, [2.0]) for the database bundle.\n"];
  price: float option
    [@ocaml.doc "The cost of the database bundle in US currency.\n"];
  name: string option [@ocaml.doc "The name for the database bundle.\n"];
  bundle_id: string option [@ocaml.doc "The ID for the database bundle.\n"]}
[@@ocaml.doc
  "Describes a database bundle. A bundle describes the performance specifications of the database.\n"]
type nonrec relational_database_blueprint =
  {
  is_engine_default: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the engine version is the default for the database blueprint.\n"];
  engine_version_description: string option
    [@ocaml.doc
      "The description of the database engine version for the database blueprint.\n"];
  engine_description: string option
    [@ocaml.doc
      "The description of the database engine for the database blueprint.\n"];
  engine_version: string option
    [@ocaml.doc
      "The database engine version for the database blueprint (for example, [5.7.23]).\n"];
  engine: relational_database_engine option
    [@ocaml.doc
      "The database software of the database blueprint (for example, [MySQL]).\n"];
  blueprint_id: string option
    [@ocaml.doc "The ID for the database blueprint.\n"]}[@@ocaml.doc
                                                          "Describes a database image, or blueprint. A blueprint describes the major engine version of a database.\n"]
type nonrec name_servers_update_state_code =
  | Started [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec name_servers_update_state =
  {
  message: string option
    [@ocaml.doc
      "The message that describes the reason for the status code.\n"];
  code: name_servers_update_state_code option
    [@ocaml.doc
      "The status code for the name servers update.\n\n Following are the possible values:\n \n  {ul\n        {-   [SUCCEEDED] - The name server records were successfully updated.\n            \n             }\n        {-   [PENDING] - The name server record update is in progress.\n            \n             }\n        {-   [FAILED] - The name server record update failed.\n            \n             }\n        {-   [STARTED] - The automatic name server record update started.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes the state of the name server records update made by Amazon Lightsail to an Amazon Route\194\16053 registered domain.\n\n For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/understanding-dns-in-amazon-lightsail}DNS in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec r53_hosted_zone_deletion_state_code =
  | Started [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec r53_hosted_zone_deletion_state =
  {
  message: string option
    [@ocaml.doc
      "The message that describes the reason for the status code.\n"];
  code: r53_hosted_zone_deletion_state_code option
    [@ocaml.doc
      "The status code for the deletion state.\n\n Following are the possible values:\n \n  {ul\n        {-   [SUCCEEDED] - The hosted zone was successfully deleted.\n            \n             }\n        {-   [PENDING] - The hosted zone deletion is in progress.\n            \n             }\n        {-   [FAILED] - The hosted zone deletion failed.\n            \n             }\n        {-   [STARTED] - The hosted zone deletion started.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes the deletion state of an Amazon Route\194\16053 hosted zone for a domain that is being automatically delegated to an Amazon Lightsail DNS zone.\n"]
type nonrec registered_domain_delegation_info =
  {
  r53_hosted_zone_deletion_state: r53_hosted_zone_deletion_state option
    [@ocaml.doc
      "Describes the deletion state of an Amazon Route\194\16053 hosted zone for a domain that is being automatically delegated to an Amazon Lightsail DNS zone.\n"];
  name_servers_update_state: name_servers_update_state option
    [@ocaml.doc
      "An object that describes the state of the name server records that are automatically added to the Route\194\16053 domain by Lightsail.\n"]}
[@@ocaml.doc
  "Describes the delegation state of an Amazon Route\194\16053 registered domain to Amazon Lightsail.\n\n When you delegate an Amazon Route\194\16053 registered domain to Lightsail, you can manage the DNS of the domain using a Lightsail DNS zone. You no longer use the Route\194\16053 hosted zone to manage the DNS of the domain. To delegate the domain, Lightsail automatically updates the domain's name servers in Route\194\16053 to the name servers of the Lightsail DNS zone. Then, Lightsail automatically deletes the Route\194\16053 hosted zone for the domain.\n \n  All of the following conditions must be true for automatic domain delegation to be successful:\n  \n   {ul\n         {-  The registered domain must be in the same Amazon Web Services account as the Lightsail account making the request.\n             \n              }\n         {-  The user or entity making the request must have permission to manage domains in Route\194\16053.\n             \n              }\n         {-  The Route\194\16053 hosted zone for the domain must be empty. It cannot contain DNS records other than start of authority (SOA) and name server records.\n             \n              }\n         }\n   If automatic domain delegation fails, or if you manage the DNS of your domain using a service other than Route\194\16053, then you must manually add the Lightsail DNS zone name servers to your domain in order to delegate management of its DNS to Lightsail. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/lightsail-how-to-create-dns-entry}Creating a DNS zone to manage your domain\226\128\153s records in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n   "]
type nonrec container_image =
  {
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the container image was created.\n"];
  digest: string option [@ocaml.doc "The digest of the container image.\n"];
  image: string option [@ocaml.doc "The name of the container image.\n"]}
[@@ocaml.doc
  "Describes a container image that is registered to an Amazon Lightsail container service.\n"]
type nonrec register_container_image_result =
  {
  container_image: container_image option
    [@ocaml.doc
      "An object that describes a container image that is registered to a Lightsail container service\n"]}
[@@ocaml.doc ""]
type nonrec register_container_image_request =
  {
  digest: string
    [@ocaml.doc "The digest of the container image to be registered.\n"];
  label: string
    [@ocaml.doc
      "The label for the container image when it's registered to the container service.\n\n Use a descriptive label that you can use to track the different versions of your registered container images.\n \n  Use the [GetContainerImages] action to return the container images registered to a Lightsail container service. The label is the \n  {[\n  \n  ]}\n   portion of the following image name example:\n  \n   {ul\n         {-   \n             {[\n             :container-service-1..1\n             ]}\n              \n             \n              }\n         }\n   If the name of your container service is [mycontainerservice], and the label that you specify is [mystaticwebsite], then the name of the registered container image will be [:mycontainerservice.mystaticwebsite.1].\n   \n    The number at the end of these image name examples represents the version of the registered container image. If you push and register another container image to the same Lightsail container service, with the same label, then the version number for the new registered container image will be [2]. If you push and register another container image, the version number will be [3], and so on.\n    "];
  service_name: string
    [@ocaml.doc
      "The name of the container service for which to register a container image.\n"]}
[@@ocaml.doc ""]
type nonrec availability_zone =
  {
  state: string option [@ocaml.doc "The state of the Availability Zone.\n"];
  zone_name: string option
    [@ocaml.doc
      "The name of the Availability Zone. The format is [us-east-2a] (case-sensitive).\n"]}
[@@ocaml.doc
  "Describes an Availability Zone. This is returned only as part of a [GetRegions] request.\n"]
type nonrec region =
  {
  relational_database_availability_zones: availability_zone list option
    [@ocaml.doc
      "The Availability Zones for databases. Follows the format [us-east-2a] (case-sensitive).\n"];
  availability_zones: availability_zone list option
    [@ocaml.doc
      "The Availability Zones. Follows the format [us-east-2a] (case-sensitive).\n"];
  name: region_name option [@ocaml.doc "The region name ([us-east-2]).\n"];
  display_name: string option [@ocaml.doc "The display name ([Ohio]).\n"];
  description: string option
    [@ocaml.doc
      "The description of the Amazon Web Services Region ([This region is recommended to\n        serve users in the eastern United States and eastern Canada]).\n"];
  continent_code: string option
    [@ocaml.doc "The continent code ([NA], meaning North America).\n"]}
[@@ocaml.doc "Describes the Amazon Web Services Region.\n"]
type nonrec record_state =
  | Failed [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""]
  | Started [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec reboot_relational_database_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec reboot_relational_database_request =
  {
  relational_database_name: string
    [@ocaml.doc "The name of your database to reboot.\n"]}[@@ocaml.doc ""]
type nonrec reboot_instance_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec reboot_instance_request =
  {
  instance_name: string [@ocaml.doc "The name of the instance to reboot.\n"]}
[@@ocaml.doc ""]
type nonrec put_instance_public_ports_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec network_protocol =
  | ICMPV6 [@ocaml.doc ""]
  | ICMP [@ocaml.doc ""]
  | UDP [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
  | TCP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec port_info =
  {
  cidr_list_aliases: string list option
    [@ocaml.doc
      "An alias that defines access for a preconfigured range of IP addresses.\n\n The only alias currently supported is [lightsail-connect], which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.\n "];
  ipv6_cidrs: string list option
    [@ocaml.doc
      "The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are allowed to connect to an instance through the ports, and the protocol. Only devices with an IPv6 address can connect to an instance through IPv6; otherwise, IPv4 should be used.\n\n  The [cidrs] parameter lists the IPv4 addresses that are allowed to connect to an instance.\n  \n    For more information about CIDR block notation, see {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation}Classless Inter-Domain Routing} on {i Wikipedia}.\n    "];
  cidrs: string list option
    [@ocaml.doc
      "The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are allowed to connect to an instance through the ports, and the protocol.\n\n  The [ipv6Cidrs] parameter lists the IPv6 addresses that are allowed to connect to an instance.\n  \n    Examples:\n    \n     {ul\n           {-  To allow the IP address [192.0.2.44], specify [192.0.2.44] or [192.0.2.44/32]. \n               \n                }\n           {-  To allow the IP addresses [192.0.2.0] to [192.0.2.255], specify [192.0.2.0/24].\n               \n                }\n           }\n   For more information about CIDR block notation, see {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation}Classless Inter-Domain Routing} on {i Wikipedia}.\n   "];
  protocol: network_protocol option
    [@ocaml.doc
      "The IP protocol name.\n\n The name can be one of the following:\n \n  {ul\n        {-   [tcp] - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.\n            \n             }\n        {-   [all] - All transport layer protocol types. For more general information, see {{:https://en.wikipedia.org/wiki/Transport_layer}Transport layer} on {i Wikipedia}.\n            \n             }\n        {-   [udp] - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.\n            \n             }\n        {-   [icmp] - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached. When you specify [icmp] as the [protocol], you must specify the ICMP type using the [fromPort] parameter, and ICMP code using the [toPort] parameter.\n            \n             }\n        {-   [icmp6] - Internet Control Message Protocol (ICMP) for IPv6. When you specify [icmp6] as the [protocol], you must specify the ICMP type using the [fromPort] parameter, and ICMP code using the [toPort] parameter.\n            \n             }\n        }\n  "];
  to_port: int option
    [@ocaml.doc
      "The last port in a range of open ports on an instance.\n\n Allowed ports:\n \n  {ul\n        {-  TCP and UDP - [0] to [65535] \n            \n             }\n        {-  ICMP - The ICMP code for IPv4 addresses. For example, specify [8] as the [fromPort] (ICMP type), and [-1] as the [toPort] (ICMP code), to enable ICMP Ping. For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages}Control Messages} on {i Wikipedia}.\n            \n             }\n        {-  ICMPv6 - The ICMP code for IPv6 addresses. For example, specify [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort] (ICMPv6 code). For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6}Internet Control Message Protocol for IPv6}.\n            \n             }\n        }\n  "];
  from_port: int option
    [@ocaml.doc
      "The first port in a range of open ports on an instance.\n\n Allowed ports:\n \n  {ul\n        {-  TCP and UDP - [0] to [65535] \n            \n             }\n        {-  ICMP - The ICMP type for IPv4 addresses. For example, specify [8] as the [fromPort] (ICMP type), and [-1] as the [toPort] (ICMP code), to enable ICMP Ping. For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages}Control Messages} on {i Wikipedia}.\n            \n             }\n        {-  ICMPv6 - The ICMP type for IPv6 addresses. For example, specify [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort] (ICMPv6 code). For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6}Internet Control Message Protocol for IPv6}.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes ports to open on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.\n"]
type nonrec put_instance_public_ports_request =
  {
  instance_name: string
    [@ocaml.doc "The name of the instance for which to open ports.\n"];
  port_infos: port_info list
    [@ocaml.doc
      "An array of objects to describe the ports to open for the specified instance.\n"]}
[@@ocaml.doc ""]
type nonrec put_alarm_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec metric_name =
  | BurstCapacityPercentage [@ocaml.doc ""]
  | BurstCapacityTime [@ocaml.doc ""]
  | NetworkTransmitThroughput [@ocaml.doc ""]
  | NetworkReceiveThroughput [@ocaml.doc ""]
  | FreeStorageSpace [@ocaml.doc ""]
  | DiskQueueDepth [@ocaml.doc ""]
  | DatabaseConnections [@ocaml.doc ""]
  | RequestCount [@ocaml.doc ""]
  | RejectedConnectionCount [@ocaml.doc ""]
  | InstanceResponseTime [@ocaml.doc ""]
  | HTTPCode_Instance_5XX_Count [@ocaml.doc ""]
  | HTTPCode_Instance_4XX_Count [@ocaml.doc ""]
  | HTTPCode_Instance_3XX_Count [@ocaml.doc ""]
  | HTTPCode_Instance_2XX_Count [@ocaml.doc ""]
  | HTTPCode_LB_5XX_Count [@ocaml.doc ""]
  | HTTPCode_LB_4XX_Count [@ocaml.doc ""]
  | UnhealthyHostCount [@ocaml.doc ""]
  | HealthyHostCount [@ocaml.doc ""]
  | ClientTLSNegotiationErrorCount [@ocaml.doc ""]
  | StatusCheckFailed_System [@ocaml.doc ""]
  | StatusCheckFailed_Instance [@ocaml.doc ""]
  | StatusCheckFailed [@ocaml.doc ""]
  | NetworkOut [@ocaml.doc ""]
  | NetworkIn [@ocaml.doc ""]
  | CPUUtilization [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec comparison_operator =
  | LessThanOrEqualToThreshold [@ocaml.doc ""]
  | LessThanThreshold [@ocaml.doc ""]
  | GreaterThanThreshold [@ocaml.doc ""]
  | GreaterThanOrEqualToThreshold [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec contact_protocol =
  | SMS [@ocaml.doc ""]
  | Email [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec put_alarm_request =
  {
  notification_enabled: bool option
    [@ocaml.doc
      "Indicates whether the alarm is enabled.\n\n Notifications are enabled by default if you don't specify this parameter.\n "];
  notification_triggers: alarm_state list option
    [@ocaml.doc
      "The alarm states that trigger a notification.\n\n An alarm has the following possible states:\n \n  {ul\n        {-   [ALARM] - The metric is outside of the defined threshold.\n            \n             }\n        {-   [INSUFFICIENT_DATA] - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.\n            \n             }\n        {-   [OK] - The metric is within the defined threshold.\n            \n             }\n        }\n   When you specify a notification trigger, the [ALARM] state must be specified. The [INSUFFICIENT_DATA] and [OK] states can be specified in addition to the [ALARM] state.\n   \n    {ul\n          {-  If you specify [OK] as an alarm trigger, a notification is sent when the alarm switches from an [ALARM] or [INSUFFICIENT_DATA] alarm state to an [OK] state. This can be thought of as an {i all clear} alarm notification.\n              \n               }\n          {-  If you specify [INSUFFICIENT_DATA] as the alarm trigger, a notification is sent when the alarm switches from an [OK] or [ALARM] alarm state to an [INSUFFICIENT_DATA] state.\n              \n               }\n          }\n   The notification trigger defaults to [ALARM] if you don't specify this parameter.\n   "];
  contact_protocols: contact_protocol list option
    [@ocaml.doc
      "The contact protocols to use for the alarm, such as [Email], [SMS] (text messaging), or both.\n\n A notification is sent via the specified contact protocol if notifications are enabled for the alarm, and when the alarm is triggered.\n \n  A notification is not sent if a contact protocol is not specified, if the specified contact protocol is not configured in the Amazon Web Services Region, or if notifications are not enabled for the alarm using the [notificationEnabled] paramater.\n  \n   Use the [CreateContactMethod] action to configure a contact protocol in an Amazon Web Services Region.\n   "];
  treat_missing_data: treat_missing_data option
    [@ocaml.doc
      "Sets how this alarm will handle missing data points.\n\n An alarm can treat missing data in the following ways:\n \n  {ul\n        {-   [breaching] - Assume the missing data is not within the threshold. Missing data counts towards the number of times the metric is not within the threshold.\n            \n             }\n        {-   [notBreaching] - Assume the missing data is within the threshold. Missing data does not count towards the number of times the metric is not within the threshold.\n            \n             }\n        {-   [ignore] - Ignore the missing data. Maintains the current alarm state.\n            \n             }\n        {-   [missing] - Missing data is treated as missing.\n            \n             }\n        }\n   If [treatMissingData] is not specified, the default behavior of [missing] is used.\n   "];
  datapoints_to_alarm: int option
    [@ocaml.doc
      "The number of data points that must be not within the specified threshold to trigger the alarm. If you are setting an \"M out of N\" alarm, this value ([datapointsToAlarm]) is the M.\n"];
  evaluation_periods: int
    [@ocaml.doc
      "The number of most recent periods over which data is compared to the specified threshold. If you are setting an \"M out of N\" alarm, this value ([evaluationPeriods]) is the N.\n\n If you are setting an alarm that requires that a number of consecutive data points be breaching to trigger the alarm, this value specifies the rolling period of time in which data points are evaluated.\n \n  Each evaluation period is five minutes long. For example, specify an evaluation period of 24 to evaluate a metric over a rolling period of two hours.\n  \n   You can specify a minimum valuation period of 1 (5 minutes), and a maximum evaluation period of 288 (24 hours).\n   "];
  threshold: float
    [@ocaml.doc
      "The value against which the specified statistic is compared.\n"];
  comparison_operator: comparison_operator
    [@ocaml.doc
      "The arithmetic operation to use when comparing the specified statistic to the threshold. The specified statistic value is used as the first operand.\n"];
  monitored_resource_name: string
    [@ocaml.doc
      "The name of the Lightsail resource that will be monitored.\n\n Instances, load balancers, and relational databases are the only Lightsail resources that can currently be monitored by alarms.\n "];
  metric_name: metric_name
    [@ocaml.doc
      "The name of the metric to associate with the alarm.\n\n You can configure up to two alarms per metric.\n \n  The following metrics are available for each resource type:\n  \n   {ul\n         {-   {b Instances}: [BurstCapacityPercentage], [BurstCapacityTime], [CPUUtilization], [NetworkIn], [NetworkOut], [StatusCheckFailed], [StatusCheckFailed_Instance], and [StatusCheckFailed_System].\n             \n              }\n         {-   {b Load balancers}: [ClientTLSNegotiationErrorCount], [HealthyHostCount], [UnhealthyHostCount], [HTTPCode_LB_4XX_Count], [HTTPCode_LB_5XX_Count], [HTTPCode_Instance_2XX_Count], [HTTPCode_Instance_3XX_Count], [HTTPCode_Instance_4XX_Count], [HTTPCode_Instance_5XX_Count], [InstanceResponseTime], [RejectedConnectionCount], and [RequestCount].\n             \n              }\n         {-   {b Relational databases}: [CPUUtilization], [DatabaseConnections], [DiskQueueDepth], [FreeStorageSpace], [NetworkReceiveThroughput], and [NetworkTransmitThroughput].\n             \n              }\n         }\n   For more information about these metrics, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-resource-health-metrics#available-metrics}Metrics available in Lightsail}.\n   "];
  alarm_name: string
    [@ocaml.doc
      "The name for the alarm. Specify the name of an existing alarm to update, and overwrite the previous configuration of the alarm.\n"]}
[@@ocaml.doc ""]
type nonrec port_state =
  | Closed [@ocaml.doc ""]
  | Open [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec port_info_source_type =
  | Closed [@ocaml.doc ""]
  | None [@ocaml.doc ""]
  | Instance [@ocaml.doc ""]
  | Default [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec port_access_type =
  | Private [@ocaml.doc ""]
  | Public [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec peer_vpc_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec password_data =
  {
  key_pair_name: string option
    [@ocaml.doc
      "The name of the key pair that you used when creating your instance. If no key pair name was specified when creating the instance, Lightsail uses the default key pair ([LightsailDefaultKeyPair]).\n\n If you are using a custom key pair, you need to use your own means of decrypting your password using the [ciphertext]. Lightsail creates the ciphertext by encrypting your password with the public key part of this key pair.\n "];
  ciphertext: string option
    [@ocaml.doc
      "The encrypted password. Ciphertext will be an empty string if access to your new instance is not ready yet. When you create an instance, it can take up to 15 minutes for the instance to be ready.\n\n  If you use the default key pair ([LightsailDefaultKeyPair]), the decrypted password will be available in the password field.\n  \n   If you are using a custom key pair, you need to use your own means of decryption.\n   \n    If you change the Administrator password on the instance, Lightsail will continue to return the original ciphertext value. When accessing the instance using RDP, you need to manually enter the Administrator password after changing it from the default.\n    \n     "]}
[@@ocaml.doc
  "The password data for the Windows Server-based instance, including the ciphertext and the key pair name.\n"]
type nonrec origin =
  {
  response_timeout: int option
    [@ocaml.doc
      "The amount of time, in seconds, that the distribution waits for a response after forwarding a request to the origin. The minimum timeout is 1 second, the maximum is 60 seconds, and the default (if you don't specify otherwise) is 30 seconds.\n"];
  protocol_policy: origin_protocol_policy_enum option
    [@ocaml.doc
      "The protocol that your Amazon Lightsail distribution uses when establishing a connection with your origin to pull content.\n"];
  region_name: region_name option
    [@ocaml.doc "The AWS Region name of the origin resource.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The resource type of the origin resource ({i Instance}).\n"];
  name: string option [@ocaml.doc "The name of the origin resource.\n"]}
[@@ocaml.doc
  "Describes the origin resource of an Amazon Lightsail content delivery network (CDN) distribution.\n\n An origin can be a Lightsail instance, bucket, or load balancer. A distribution pulls content from an origin, caches it, and serves it to viewers via a worldwide network of edge servers.\n "]
type nonrec open_instance_public_ports_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec open_instance_public_ports_request =
  {
  instance_name: string
    [@ocaml.doc "The name of the instance for which to open ports.\n"];
  port_info: port_info
    [@ocaml.doc
      "An object to describe the ports to open for the specified instance.\n"]}
[@@ocaml.doc ""]
type nonrec monthly_transfer =
  {
  gb_per_month_allocated: int option
    [@ocaml.doc "The amount allocated per month (in GB).\n"]}[@@ocaml.doc
                                                               "Describes the monthly data transfer in and out of your virtual private server (or {i instance}).\n"]
type nonrec monitored_resource_info =
  {
  resource_type: resource_type option
    [@ocaml.doc
      "The Lightsail resource type of the resource being monitored.\n\n Instances, load balancers, and relational databases are the only Lightsail resources that can currently be monitored by alarms.\n "];
  name: string option
    [@ocaml.doc "The name of the Lightsail resource being monitored.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource being monitored.\n"]}
[@@ocaml.doc
  "Describes resource being monitored by an alarm.\n\n An alarm is a way to monitor your Amazon Lightsail resource metrics. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n "]
type nonrec metric_unit =
  | None [@ocaml.doc ""]
  | CountSecond [@ocaml.doc ""]
  | TerabitsSecond [@ocaml.doc ""]
  | GigabitsSecond [@ocaml.doc ""]
  | MegabitsSecond [@ocaml.doc ""]
  | KilobitsSecond [@ocaml.doc ""]
  | BitsSecond [@ocaml.doc ""]
  | TerabytesSecond [@ocaml.doc ""]
  | GigabytesSecond [@ocaml.doc ""]
  | MegabytesSecond [@ocaml.doc ""]
  | KilobytesSecond [@ocaml.doc ""]
  | BytesSecond [@ocaml.doc ""]
  | Count [@ocaml.doc ""]
  | Percent [@ocaml.doc ""]
  | Terabits [@ocaml.doc ""]
  | Gigabits [@ocaml.doc ""]
  | Megabits [@ocaml.doc ""]
  | Kilobits [@ocaml.doc ""]
  | Bits [@ocaml.doc ""]
  | Terabytes [@ocaml.doc ""]
  | Gigabytes [@ocaml.doc ""]
  | Megabytes [@ocaml.doc ""]
  | Kilobytes [@ocaml.doc ""]
  | Bytes [@ocaml.doc ""]
  | Milliseconds [@ocaml.doc ""]
  | Microseconds [@ocaml.doc ""]
  | Seconds [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec metric_statistic =
  | SampleCount [@ocaml.doc ""]
  | Average [@ocaml.doc ""]
  | Sum [@ocaml.doc ""]
  | Maximum [@ocaml.doc ""]
  | Minimum [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec metric_datapoint =
  {
  unit_: metric_unit option [@ocaml.doc "The unit. \n"];
  timestamp_: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp ([1479816991.349]).\n"];
  sum: float option [@ocaml.doc "The sum.\n"];
  sample_count: float option [@ocaml.doc "The sample count.\n"];
  minimum: float option [@ocaml.doc "The minimum.\n"];
  maximum: float option [@ocaml.doc "The maximum.\n"];
  average: float option [@ocaml.doc "The average.\n"]}[@@ocaml.doc
                                                        "Describes the metric data point.\n"]
type nonrec log_event =
  {
  message: string option
    [@ocaml.doc "The message of the database log event.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the database log event was created.\n"]}
[@@ocaml.doc "Describes a database log event.\n"]
type nonrec load_balancer_tls_policy =
  {
  ciphers: string list option
    [@ocaml.doc
      "The ciphers used by the TLS security policy.\n\n The ciphers are listed in order of preference.\n "];
  protocols: string list option
    [@ocaml.doc "The protocols used in a given TLS security policy.\n"];
  description: string option
    [@ocaml.doc "The description of the TLS security policy.\n"];
  is_default: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether the TLS security policy is the default.\n"];
  name: string option [@ocaml.doc "The name of the TLS security policy.\n"]}
[@@ocaml.doc
  "Describes the TLS security policies that are available for Lightsail load balancers.\n\n For more information about load balancer TLS security policies, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configure-load-balancer-tls-security-policy}Configuring TLS security policies on your Amazon Lightsail load balancers} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec load_balancer_tls_certificate_summary =
  {
  is_attached: bool option
    [@ocaml.doc
      "When [true], the SSL/TLS certificate is attached to the Lightsail load balancer.\n"];
  name: string option [@ocaml.doc "The name of the SSL/TLS certificate.\n"]}
[@@ocaml.doc "Provides a summary of SSL/TLS certificate metadata.\n"]
type nonrec load_balancer_tls_certificate_status =
  | Unknown [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Revoked [@ocaml.doc ""]
  | ValidationTimedOut [@ocaml.doc ""]
  | Expired [@ocaml.doc ""]
  | Inactive [@ocaml.doc ""]
  | Issued [@ocaml.doc ""]
  | PendingValidation [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_revocation_reason =
  | AACompromise [@ocaml.doc ""]
  | PrivilegeWithdrawn [@ocaml.doc ""]
  | RemoveFromCrl [@ocaml.doc ""]
  | CertificateHold [@ocaml.doc ""]
  | CessationOfOperation [@ocaml.doc ""]
  | Superceded [@ocaml.doc ""]
  | AffiliationChanged [@ocaml.doc ""]
  | CaCompromise [@ocaml.doc ""]
  | KeyCompromise [@ocaml.doc ""]
  | Unspecified [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_renewal_status =
  | Failed [@ocaml.doc ""]
  | Success [@ocaml.doc ""]
  | PendingValidation [@ocaml.doc ""]
  | PendingAutoRenewal [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_domain_status =
  | Success [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | PendingValidation [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_domain_validation_option =
  {
  validation_status: load_balancer_tls_certificate_domain_status option
    [@ocaml.doc
      "The status of the domain validation. Valid values are listed below.\n"];
  domain_name: string option
    [@ocaml.doc
      "The fully qualified domain name in the certificate request.\n"]}
[@@ocaml.doc
  "Contains information about the domain names on an SSL/TLS certificate that you will use to validate domain ownership.\n"]
type nonrec load_balancer_tls_certificate_renewal_summary =
  {
  domain_validation_options:
    load_balancer_tls_certificate_domain_validation_option list option
    [@ocaml.doc
      "Contains information about the validation of each domain name in the certificate, as it pertains to Lightsail's managed renewal. This is different from the initial validation that occurs as a result of the RequestCertificate request.\n"];
  renewal_status: load_balancer_tls_certificate_renewal_status option
    [@ocaml.doc
      "The renewal status of the certificate.\n\n The following renewal status are possible:\n \n  {ul\n        {-   {b  [PendingAutoRenewal] } - Lightsail is attempting to automatically validate the domain names of the certificate. No further action is required. \n            \n             }\n        {-   {b  [PendingValidation] } - Lightsail couldn't automatically validate one or more domain names of the certificate. You must take action to validate these domain names or the certificate won't be renewed. Check to make sure your certificate's domain validation records exist in your domain's DNS, and that your certificate remains in use.\n            \n             }\n        {-   {b  [Success] } - All domain names in the certificate are validated, and Lightsail renewed the certificate. No further action is required. \n            \n             }\n        {-   {b  [Failed] } - One or more domain names were not validated before the certificate expired, and Lightsail did not renew the certificate. You can request a new certificate using the [CreateCertificate] action.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Contains information about the status of Lightsail's managed renewal for the certificate.\n\n The renewal status of the certificate.\n \n  The following renewal status are possible:\n  \n   {ul\n         {-   {b  [PendingAutoRenewal] } - Lightsail is attempting to automatically validate the domain names in the certificate. No further action is required. \n             \n              }\n         {-   {b  [PendingValidation] } - Lightsail couldn't automatically validate one or more domain names in the certificate. You must take action to validate these domain names or the certificate won't be renewed. If you used DNS validation, check to make sure your certificate's domain validation records exist in your domain's DNS, and that your certificate remains in use.\n             \n              }\n         {-   {b  [Success] } - All domain names in the certificate are validated, and Lightsail renewed the certificate. No further action is required. \n             \n              }\n         {-   {b  [Failed] } - One or more domain names were not validated before the certificate expired, and Lightsail did not renew the certificate. You can request a new certificate using the [CreateCertificate] action.\n             \n              }\n         }\n  "]
type nonrec load_balancer_tls_certificate_dns_record_creation_state_code =
  | Failed [@ocaml.doc ""]
  | Started [@ocaml.doc ""]
  | Succeeded [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate_dns_record_creation_state =
  {
  message: string option
    [@ocaml.doc
      "The message that describes the reason for the status code.\n"];
  code: load_balancer_tls_certificate_dns_record_creation_state_code option
    [@ocaml.doc
      "The status code for the automated DNS record creation.\n\n Following are the possible values:\n \n  {ul\n        {-   [SUCCEEDED] - The validation records were successfully added.\n            \n             }\n        {-   [STARTED] - The automatic DNS record creation has started.\n            \n             }\n        {-   [FAILED] - The validation record addition failed.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "An object that describes the state of the canonical name (CNAME) records that are automatically added by Lightsail to the DNS of the domain to validate domain ownership.\n"]
type nonrec load_balancer_tls_certificate_domain_validation_record =
  {
  dns_record_creation_state:
    load_balancer_tls_certificate_dns_record_creation_state option
    [@ocaml.doc
      "An object that describes the state of the canonical name (CNAME) records that are automatically added by Lightsail to the DNS of a domain to validate domain ownership.\n"];
  domain_name: string option
    [@ocaml.doc
      "The domain name against which your SSL/TLS certificate was validated.\n"];
  validation_status: load_balancer_tls_certificate_domain_status option
    [@ocaml.doc "The validation status. Valid values are listed below.\n"];
  value: string option [@ocaml.doc "The value for that type.\n"];
  type_: string option
    [@ocaml.doc
      "The type of validation record. For example, [CNAME] for domain validation.\n"];
  name: string option
    [@ocaml.doc
      "A fully qualified domain name in the certificate. For example, [example.com].\n"]}
[@@ocaml.doc
  "Describes the validation record of each domain name in the SSL/TLS certificate.\n"]
type nonrec load_balancer_tls_certificate_failure_reason =
  | Other [@ocaml.doc ""]
  | InvalidPublicDomain [@ocaml.doc ""]
  | DomainNotAllowed [@ocaml.doc ""]
  | AdditionalVerificationRequired [@ocaml.doc ""]
  | NoAvailableContacts [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_tls_certificate =
  {
  subject_alternative_names: string list option
    [@ocaml.doc
      "An array of strings that specify the alternate domains ([example2.com]) and subdomains ([blog.example.com]) for the certificate.\n"];
  subject: string option
    [@ocaml.doc
      "The name of the entity that is associated with the public key contained in the certificate.\n"];
  signature_algorithm: string option
    [@ocaml.doc "The algorithm that was used to sign the certificate.\n"];
  serial: string option
    [@ocaml.doc "The serial number of the certificate.\n"];
  revoked_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the certificate was revoked. This value is present only when the certificate status is [REVOKED].\n"];
  revocation_reason: load_balancer_tls_certificate_revocation_reason option
    [@ocaml.doc
      "The reason the certificate was revoked. This value is present only when the certificate status is [REVOKED].\n"];
  renewal_summary: load_balancer_tls_certificate_renewal_summary option
    [@ocaml.doc
      "An object that describes the status of the certificate renewal managed by Lightsail.\n"];
  not_before: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the SSL/TLS certificate is first valid.\n"];
  not_after: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the SSL/TLS certificate expires.\n"];
  key_algorithm: string option
    [@ocaml.doc
      "The algorithm used to generate the key pair (the public and private key).\n"];
  issuer: string option [@ocaml.doc "The issuer of the certificate.\n"];
  issued_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time when the SSL/TLS certificate was issued.\n"];
  failure_reason: load_balancer_tls_certificate_failure_reason option
    [@ocaml.doc
      "The validation failure reason, if any, of the certificate.\n\n The following failure reasons are possible:\n \n  {ul\n        {-   {b  [NO_AVAILABLE_CONTACTS] } - This failure applies to email validation, which is not available for Lightsail certificates.\n            \n             }\n        {-   {b  [ADDITIONAL_VERIFICATION_REQUIRED] } - Lightsail requires additional information to process this certificate request. This can happen as a fraud-protection measure, such as when the domain ranks within the Alexa top 1000 websites. To provide the required information, use the {{:https://console.aws.amazon.com/support/home}AWS Support Center} to contact AWS Support.\n            \n              You cannot request a certificate for Amazon-owned domain names such as those ending in amazonaws.com, cloudfront.net, or elasticbeanstalk.com.\n              \n                }\n        {-   {b  [DOMAIN_NOT_ALLOWED] } - One or more of the domain names in the certificate request was reported as an unsafe domain by {{:https://www.virustotal.com/gui/home/url}VirusTotal}. To correct the problem, search for your domain name on the {{:https://www.virustotal.com/gui/home/url}VirusTotal} website. If your domain is reported as suspicious, see {{:https://developers.google.com/web/fundamentals/security/hacked}Google Help for Hacked Websites} to learn what you can do.\n            \n             If you believe that the result is a false positive, notify the organization that is reporting the domain. VirusTotal is an aggregate of several antivirus and URL scanners and cannot remove your domain from a block list itself. After you correct the problem and the VirusTotal registry has been updated, request a new certificate.\n             \n              If you see this error and your domain is not included in the VirusTotal list, visit the {{:https://console.aws.amazon.com/support/home}AWS Support Center} and create a case.\n              \n               }\n        {-   {b  [INVALID_PUBLIC_DOMAIN] } - One or more of the domain names in the certificate request is not valid. Typically, this is because a domain name in the request is not a valid top-level domain. Try to request a certificate again, correcting any spelling errors or typos that were in the failed request, and ensure that all domain names in the request are for valid top-level domains. For example, you cannot request a certificate for [example.invalidpublicdomain] because [invalidpublicdomain] is not a valid top-level domain.\n            \n             }\n        {-   {b  [OTHER] } - Typically, this failure occurs when there is a typographical error in one or more of the domain names in the certificate request. Try to request a certificate again, correcting any spelling errors or typos that were in the failed request. \n            \n             }\n        }\n  "];
  domain_validation_records:
    load_balancer_tls_certificate_domain_validation_record list option
    [@ocaml.doc
      "An array of LoadBalancerTlsCertificateDomainValidationRecord objects describing the records.\n"];
  domain_name: string option
    [@ocaml.doc "The domain name for your SSL/TLS certificate.\n"];
  status: load_balancer_tls_certificate_status option
    [@ocaml.doc
      "The validation status of the SSL/TLS certificate. Valid values are below.\n"];
  is_attached: bool option
    [@ocaml.doc
      "When [true], the SSL/TLS certificate is attached to the Lightsail load balancer.\n"];
  load_balancer_name: string option
    [@ocaml.doc
      "The load balancer name where your SSL/TLS certificate is attached.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The resource type ([LoadBalancerTlsCertificate]).\n\n {ul\n       {-   {b  [Instance] } - A Lightsail instance (a virtual private server)\n           \n            }\n       {-   {b  [StaticIp] } - A static IP address\n           \n            }\n       {-   {b  [KeyPair] } - The key pair used to connect to a Lightsail instance\n           \n            }\n       {-   {b  [InstanceSnapshot] } - A Lightsail instance snapshot\n           \n            }\n       {-   {b  [Domain] } - A DNS zone\n           \n            }\n       {-   {b  [PeeredVpc] } - A peered VPC\n           \n            }\n       {-   {b  [LoadBalancer] } - A Lightsail load balancer\n           \n            }\n       {-   {b  [LoadBalancerTlsCertificate] } - An SSL/TLS certificate associated with a Lightsail load balancer\n           \n            }\n       {-   {b  [Disk] } - A Lightsail block storage disk\n           \n            }\n       {-   {b  [DiskSnapshot] } - A block storage disk snapshot\n           \n            }\n       }\n  "];
  location: resource_location option
    [@ocaml.doc
      "The Amazon Web Services Region and Availability Zone where you created your certificate.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time when you created your SSL/TLS certificate.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about your Lightsail load balancer or SSL/TLS certificate. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the SSL/TLS certificate.\n"];
  name: string option
    [@ocaml.doc "The name of the SSL/TLS certificate ([my-certificate]).\n"]}
[@@ocaml.doc
  "Describes a load balancer SSL/TLS certificate.\n\n TLS is just an updated, more secure version of Secure Socket Layer (SSL).\n "]
type nonrec load_balancer_state =
  | Unknown [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | ActiveImpaired [@ocaml.doc ""]
  | Provisioning [@ocaml.doc ""]
  | Active [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_protocol =
  | HTTP [@ocaml.doc ""]
  | HTTP_HTTPS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec load_balancer_metric_name =
  | RequestCount [@ocaml.doc ""]
  | RejectedConnectionCount [@ocaml.doc ""]
  | InstanceResponseTime [@ocaml.doc ""]
  | HTTPCode_Instance_5XX_Count [@ocaml.doc ""]
  | HTTPCode_Instance_4XX_Count [@ocaml.doc ""]
  | HTTPCode_Instance_3XX_Count [@ocaml.doc ""]
  | HTTPCode_Instance_2XX_Count [@ocaml.doc ""]
  | HTTPCode_LB_5XX_Count [@ocaml.doc ""]
  | HTTPCode_LB_4XX_Count [@ocaml.doc ""]
  | UnhealthyHostCount [@ocaml.doc ""]
  | HealthyHostCount [@ocaml.doc ""]
  | ClientTLSNegotiationErrorCount [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_health_state =
  | Unavailable [@ocaml.doc ""]
  | Draining [@ocaml.doc ""]
  | Unused [@ocaml.doc ""]
  | Unhealthy [@ocaml.doc ""]
  | Healthy [@ocaml.doc ""]
  | Initial [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_health_reason =
  | InstanceIpUnusable [@ocaml.doc ""]
  | InstanceInvalidState [@ocaml.doc ""]
  | InstanceDeregistrationInProgress [@ocaml.doc ""]
  | InstanceNotInUse [@ocaml.doc ""]
  | InstanceNotRegistered [@ocaml.doc ""]
  | InstanceFailedHealthChecks [@ocaml.doc ""]
  | InstanceTimeout [@ocaml.doc ""]
  | InstanceResponseCodeMismatch [@ocaml.doc ""]
  | LbInternalError [@ocaml.doc ""]
  | LbInitialHealthChecking [@ocaml.doc ""]
  | LbRegistrationInProgress [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_health_summary =
  {
  instance_health_reason: instance_health_reason option
    [@ocaml.doc
      "More information about the instance health. If the [instanceHealth] is [healthy], then an [instanceHealthReason] value is not provided.\n\n If {b  [instanceHealth] } is [initial], the {b  [instanceHealthReason] } value can be one of the following:\n \n  {ul\n        {-   {b  [Lb.RegistrationInProgress] } - The target instance is in the process of being registered with the load balancer.\n            \n             }\n        {-   {b  [Lb.InitialHealthChecking] } - The Lightsail load balancer is still sending the target instance the minimum number of health checks required to determine its health status.\n            \n             }\n        }\n   If {b  [instanceHealth] } is [unhealthy], the {b  [instanceHealthReason] } value can be one of the following:\n   \n    {ul\n          {-   {b  [Instance.ResponseCodeMismatch] } - The health checks did not return an expected HTTP code.\n              \n               }\n          {-   {b  [Instance.Timeout] } - The health check requests timed out.\n              \n               }\n          {-   {b  [Instance.FailedHealthChecks] } - The health checks failed because the connection to the target instance timed out, the target instance response was malformed, or the target instance failed the health check for an unknown reason.\n              \n               }\n          {-   {b  [Lb.InternalError] } - The health checks failed due to an internal error.\n              \n               }\n          }\n   If {b  [instanceHealth] } is [unused], the {b  [instanceHealthReason] } value can be one of the following:\n   \n    {ul\n          {-   {b  [Instance.NotRegistered] } - The target instance is not registered with the target group.\n              \n               }\n          {-   {b  [Instance.NotInUse] } - The target group is not used by any load balancer, or the target instance is in an Availability Zone that is not enabled for its load balancer.\n              \n               }\n          {-   {b  [Instance.IpUnusable] } - The target IP address is reserved for use by a Lightsail load balancer.\n              \n               }\n          {-   {b  [Instance.InvalidState] } - The target is in the stopped or terminated state.\n              \n               }\n          }\n   If {b  [instanceHealth] } is [draining], the {b  [instanceHealthReason] } value can be one of the following:\n   \n    {ul\n          {-   {b  [Instance.DeregistrationInProgress] } - The target instance is in the process of being deregistered and the deregistration delay period has not expired.\n              \n               }\n          }\n  "];
  instance_health: instance_health_state option
    [@ocaml.doc
      "Describes the overall instance health. Valid values are below.\n"];
  instance_name: string option
    [@ocaml.doc
      "The name of the Lightsail instance for which you are requesting health check data.\n"]}
[@@ocaml.doc "Describes information about the health of the instance.\n"]
type nonrec load_balancer_configuration_options =
  (load_balancer_attribute_name * string) list[@@ocaml.doc ""]
type nonrec load_balancer =
  {
  tls_policy_name: string option
    [@ocaml.doc
      "The name of the TLS security policy for the load balancer.\n"];
  https_redirection_enabled: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether HTTPS redirection is enabled for the load balancer.\n"];
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "The IP address type of the load balancer.\n\n The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and [dualstack] for IPv4 and IPv6.\n "];
  configuration_options: load_balancer_configuration_options option
    [@ocaml.doc
      "A string to string map of the configuration options for your load balancer. Valid values are listed below.\n"];
  tls_certificate_summaries:
    load_balancer_tls_certificate_summary list option
    [@ocaml.doc
      "An array of LoadBalancerTlsCertificateSummary objects that provide additional information about the SSL/TLS certificates. For example, if [true], the certificate is attached to the load balancer.\n"];
  instance_health_summary: instance_health_summary list option
    [@ocaml.doc
      "An array of InstanceHealthSummary objects describing the health of the load balancer.\n"];
  instance_port: int option
    [@ocaml.doc
      "The port where the load balancer will direct traffic to your Lightsail instances. For HTTP traffic, it's port 80. For HTTPS traffic, it's port 443.\n"];
  health_check_path: string option
    [@ocaml.doc
      "The path you specified to perform your health checks. If no path is specified, the load balancer tries to make a request to the default (root) page.\n"];
  public_ports: int list option
    [@ocaml.doc
      "An array of public port settings for your load balancer. For HTTP, use port 80. For HTTPS, use port 443.\n"];
  protocol: load_balancer_protocol option
    [@ocaml.doc
      "The protocol you have enabled for your load balancer. Valid values are below.\n\n You can't just have [HTTP_HTTPS], but you can have just [HTTP].\n "];
  state: load_balancer_state option
    [@ocaml.doc
      "The status of your load balancer. Valid values are below.\n"];
  dns_name: string option
    [@ocaml.doc "The DNS name of your Lightsail load balancer.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The resource type ([LoadBalancer].\n"];
  location: resource_location option
    [@ocaml.doc
      "The AWS Region where your load balancer was created ([us-east-2a]). Lightsail automatically creates your load balancer across Availability Zones.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when your load balancer was created.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about your Lightsail load balancer. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"];
  name: string option
    [@ocaml.doc "The name of the load balancer ([my-load-balancer]).\n"]}
[@@ocaml.doc "Describes a load balancer.\n"]
type nonrec is_vpc_peered_result =
  {
  is_peered: bool option
    [@ocaml.doc
      "Returns [true] if the Lightsail VPC is peered; otherwise, [false].\n"]}
[@@ocaml.doc ""]
type nonrec import_key_pair_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec import_key_pair_request =
  {
  public_key_base64: string
    [@ocaml.doc "A base64-encoded public key of the [ssh-rsa] type.\n"];
  key_pair_name: string
    [@ocaml.doc
      "The name of the key pair for which you want to import the public key.\n"]}
[@@ocaml.doc ""]
type nonrec get_static_ips_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetStaticIps] request and specify the next page token using the [pageToken] parameter.\n  "];
  static_ips: static_ip list option
    [@ocaml.doc
      "An array of key-value pairs containing information about your get static IPs request.\n"]}
[@@ocaml.doc ""]
type nonrec get_static_ips_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetStaticIps] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_static_ip_result =
  {
  static_ip: static_ip option
    [@ocaml.doc
      "An array of key-value pairs containing information about the requested static IP.\n"]}
[@@ocaml.doc ""]
type nonrec get_static_ip_request =
  {
  static_ip_name: string
    [@ocaml.doc "The name of the static IP in Lightsail.\n"]}[@@ocaml.doc ""]
type nonrec get_setup_history_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetSetupHistory] request and specify the next page token using the pageToken parameter.\n  "];
  setup_history: setup_history list option
    [@ocaml.doc "The historical information that's returned.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec get_setup_history_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetSetupHistory] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  resource_name: string
    [@ocaml.doc
      "The name of the resource for which you are requesting information.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_snapshots_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetRelationalDatabaseSnapshots] request and specify the next page token using the [pageToken] parameter.\n  "];
  relational_database_snapshots: relational_database_snapshot list option
    [@ocaml.doc
      "An object describing the result of your get relational database snapshots request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_snapshots_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetRelationalDatabaseSnapshots] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_relational_database_snapshot_result =
  {
  relational_database_snapshot: relational_database_snapshot option
    [@ocaml.doc "An object describing the specified database snapshot.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_snapshot_request =
  {
  relational_database_snapshot_name: string
    [@ocaml.doc
      "The name of the database snapshot for which to get information.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_databases_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetRelationalDatabases] request and specify the next page token using the [pageToken] parameter.\n  "];
  relational_databases: relational_database list option
    [@ocaml.doc
      "An object describing the result of your get relational databases request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_databases_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetRelationalDatabases] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_relational_database_parameters_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetRelationalDatabaseParameters] request and specify the next page token using the [pageToken] parameter.\n  "];
  parameters: relational_database_parameter list option
    [@ocaml.doc
      "An object describing the result of your get relational database parameters request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_parameters_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetRelationalDatabaseParameters] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  relational_database_name: string
    [@ocaml.doc "The name of your database for which to get parameters.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_metric_data_result =
  {
  metric_data: metric_datapoint list option
    [@ocaml.doc
      "An array of objects that describe the metric data returned.\n"];
  metric_name: relational_database_metric_name option
    [@ocaml.doc "The name of the metric returned.\n"]}[@@ocaml.doc ""]
type nonrec get_relational_database_metric_data_request =
  {
  statistics: metric_statistic list
    [@ocaml.doc
      "The statistic for the metric.\n\n The following statistics are available:\n \n  {ul\n        {-   [Minimum] - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.\n            \n             }\n        {-   [Maximum] - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.\n            \n             }\n        {-   [Sum] - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.\n            \n             }\n        {-   [Average] - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.\n            \n             }\n        {-   [SampleCount] - The count, or number, of data points used for the statistical calculation.\n            \n             }\n        }\n  "];
  unit_: metric_unit
    [@ocaml.doc
      "The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units with each available metric, see the [metricName] parameter.\n"];
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The end of the time interval from which to get metric data.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you input [1538424000] as the end time.\n             \n              }\n        }\n  "];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The start of the time interval from which to get metric data.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you input [1538424000] as the start time.\n             \n              }\n        }\n  "];
  period: int
    [@ocaml.doc
      "The granularity, in seconds, of the returned data points.\n\n All relational database metric data is available in 1-minute (60 seconds) granularity.\n "];
  metric_name: relational_database_metric_name
    [@ocaml.doc
      "The metric for which you want to return information.\n\n Valid relational database metric names are listed below, along with the most useful [statistics] to include in your request, and the published [unit] value. All relational database metric data is available in 1-minute (60 seconds) granularity.\n \n  {ul\n        {-   {b  [CPUUtilization] } - The percentage of CPU utilization currently in use on the database.\n            \n              [Statistics]: The most useful statistics are [Maximum] and [Average].\n             \n               [Unit]: The published unit is [Percent].\n              \n               }\n        {-   {b  [DatabaseConnections] } - The number of database connections in use.\n            \n              [Statistics]: The most useful statistics are [Maximum] and [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [DiskQueueDepth] } - The number of outstanding IOs (read/write requests) that are waiting to access the disk.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [FreeStorageSpace] } - The amount of available storage space.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Bytes].\n              \n               }\n        {-   {b  [NetworkReceiveThroughput] } - The incoming (Receive) network traffic on the database, including both customer database traffic and AWS traffic used for monitoring and replication.\n            \n              [Statistics]: The most useful statistic is [Average].\n             \n               [Unit]: The published unit is [Bytes/Second].\n              \n               }\n        {-   {b  [NetworkTransmitThroughput] } - The outgoing (Transmit) network traffic on the database, including both customer database traffic and AWS traffic used for monitoring and replication.\n            \n              [Statistics]: The most useful statistic is [Average].\n             \n               [Unit]: The published unit is [Bytes/Second].\n              \n               }\n        }\n  "];
  relational_database_name: string
    [@ocaml.doc "The name of your database from which to get metric data.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_master_user_password_result =
  {
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the specified version of the master user password was created.\n"];
  master_user_password: string option
    [@ocaml.doc
      "The master user password for the [password version] specified.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_master_user_password_request =
  {
  password_version: relational_database_password_version option
    [@ocaml.doc
      "The password version to return.\n\n Specifying [CURRENT] or [PREVIOUS] returns the current or previous passwords respectively. Specifying [PENDING] returns the newest version of the password that will rotate to [CURRENT]. After the [PENDING] password rotates to [CURRENT], the [PENDING] password is no longer available.\n \n  Default: [CURRENT] \n  "];
  relational_database_name: string
    [@ocaml.doc
      "The name of your database for which to get the master user password.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_log_streams_result =
  {
  log_streams: string list option
    [@ocaml.doc
      "An object describing the result of your get relational database log streams request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_log_streams_request =
  {
  relational_database_name: string
    [@ocaml.doc "The name of your database for which to get log streams.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_log_events_result =
  {
  next_forward_token: string option
    [@ocaml.doc
      "A token used for advancing to the next page of results from your get relational database log events request.\n"];
  next_backward_token: string option
    [@ocaml.doc
      "A token used for advancing to the previous page of results from your get relational database log events request.\n"];
  resource_log_events: log_event list option
    [@ocaml.doc
      "An object describing the result of your get relational database log events request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_log_events_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next or previous page of results from your request.\n\n To get a page token, perform an initial [GetRelationalDatabaseLogEvents] request. If your results are paginated, the response will return a next forward token and/or next backward token that you can specify as the page token in a subsequent request.\n "];
  start_from_head: bool option
    [@ocaml.doc
      "Parameter to specify if the log should start from head or tail. If [true] is specified, the log event starts from the head of the log. If [false] is specified, the log event starts from the tail of the log.\n\n  For PostgreSQL, the default value of [false] is the only option available.\n  \n   "];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The end of the time interval from which to get log events.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use an end time of October 1, 2018, at 8 PM UTC, then you input [1538424000] as the end time.\n             \n              }\n        }\n  "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The start of the time interval from which to get log events.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, then you input [1538424000] as the start time.\n             \n              }\n        }\n  "];
  log_stream_name: string
    [@ocaml.doc
      "The name of the log stream.\n\n Use the [get relational database log streams] operation to get a list of available log streams.\n "];
  relational_database_name: string
    [@ocaml.doc "The name of your database for which to get log events.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_events_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetRelationalDatabaseEvents] request and specify the next page token using the [pageToken] parameter.\n  "];
  relational_database_events: relational_database_event list option
    [@ocaml.doc
      "An object describing the result of your get relational database events request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_events_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetRelationalDatabaseEvents] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  duration_in_minutes: int option
    [@ocaml.doc
      "The number of minutes in the past from which to retrieve events. For example, to get all events from the past 2 hours, enter 120.\n\n Default: [60] \n \n  The minimum is 1 and the maximum is 14 days (20160 minutes).\n  "];
  relational_database_name: string
    [@ocaml.doc "The name of the database from which to get events.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_bundles_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetRelationalDatabaseBundles] request and specify the next page token using the [pageToken] parameter.\n  "];
  bundles: relational_database_bundle list option
    [@ocaml.doc
      "An object describing the result of your get relational database bundles request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_bundles_request =
  {
  include_inactive: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to include inactive (unavailable) bundles in the response of your request.\n"];
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetRelationalDatabaseBundles] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_relational_database_blueprints_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetRelationalDatabaseBlueprints] request and specify the next page token using the [pageToken] parameter.\n  "];
  blueprints: relational_database_blueprint list option
    [@ocaml.doc
      "An object describing the result of your get relational database blueprints request.\n"]}
[@@ocaml.doc ""]
type nonrec get_relational_database_blueprints_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetRelationalDatabaseBlueprints] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_relational_database_result =
  {
  relational_database: relational_database option
    [@ocaml.doc "An object describing the specified database.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_relational_database_request =
  {
  relational_database_name: string
    [@ocaml.doc "The name of the database that you are looking up.\n"]}
[@@ocaml.doc ""]
type nonrec get_regions_result =
  {
  regions: region list option
    [@ocaml.doc
      "An array of key-value pairs containing information about your get regions request.\n"]}
[@@ocaml.doc ""]
type nonrec get_regions_request =
  {
  include_relational_database_availability_zones: bool option
    [@ocaml.doc
      "A Boolean value indicating whether to also include Availability Zones for databases in your get regions request. Availability Zones are indicated with a letter ([us-east-2a]).\n"];
  include_availability_zones: bool option
    [@ocaml.doc
      "A Boolean value indicating whether to also include Availability Zones in your get regions request. Availability Zones are indicated with a letter: [us-east-2a].\n"]}
[@@ocaml.doc ""]
type nonrec get_operations_for_resource_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetOperationsForResource] request and specify the next page token using the [pageToken] parameter.\n  "];
  next_page_count: string option
    [@ocaml.doc
      "(Discontinued) Returns the number of pages of results that remain.\n\n  In releases prior to June 12, 2017, this parameter returned [null] by the API. It is now discontinued, and the API returns the [next page token] parameter instead.\n  \n   "];
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec get_operations_for_resource_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetOperationsForResource] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  resource_name: string
    [@ocaml.doc
      "The name of the resource for which you are requesting information.\n"]}
[@@ocaml.doc ""]
type nonrec get_operations_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetOperations] request and specify the next page token using the [pageToken] parameter.\n  "];
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec get_operations_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetOperations] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_operation_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec get_operation_request =
  {
  operation_id: string
    [@ocaml.doc "A GUID used to identify the operation.\n"]}[@@ocaml.doc ""]
type nonrec get_load_balancer_tls_policies_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetLoadBalancerTlsPolicies] request and specify the next page token using the [pageToken] parameter.\n  "];
  tls_policies: load_balancer_tls_policy list option
    [@ocaml.doc
      "An array of objects that describe the TLS security policies that are available.\n"]}
[@@ocaml.doc ""]
type nonrec get_load_balancer_tls_policies_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetLoadBalancerTlsPolicies] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_load_balancer_tls_certificates_result =
  {
  tls_certificates: load_balancer_tls_certificate list option
    [@ocaml.doc
      "An array of LoadBalancerTlsCertificate objects describing your SSL/TLS certificates.\n"]}
[@@ocaml.doc ""]
type nonrec get_load_balancer_tls_certificates_request =
  {
  load_balancer_name: string
    [@ocaml.doc
      "The name of the load balancer you associated with your SSL/TLS certificate.\n"]}
[@@ocaml.doc ""]
type nonrec get_load_balancers_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetLoadBalancers] request and specify the next page token using the [pageToken] parameter.\n  "];
  load_balancers: load_balancer list option
    [@ocaml.doc
      "An array of LoadBalancer objects describing your load balancers.\n"]}
[@@ocaml.doc ""]
type nonrec get_load_balancers_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetLoadBalancers] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_load_balancer_metric_data_result =
  {
  metric_data: metric_datapoint list option
    [@ocaml.doc
      "An array of objects that describe the metric data returned.\n"];
  metric_name: load_balancer_metric_name option
    [@ocaml.doc "The name of the metric returned.\n"]}[@@ocaml.doc ""]
type nonrec get_load_balancer_metric_data_request =
  {
  statistics: metric_statistic list
    [@ocaml.doc
      "The statistic for the metric.\n\n The following statistics are available:\n \n  {ul\n        {-   [Minimum] - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.\n            \n             }\n        {-   [Maximum] - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.\n            \n             }\n        {-   [Sum] - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.\n            \n             }\n        {-   [Average] - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.\n            \n             }\n        {-   [SampleCount] - The count, or number, of data points used for the statistical calculation.\n            \n             }\n        }\n  "];
  unit_: metric_unit
    [@ocaml.doc
      "The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units with each available metric, see the [metricName] parameter.\n"];
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The end time of the period.\n"];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The start time of the period.\n"];
  period: int
    [@ocaml.doc
      "The granularity, in seconds, of the returned data points.\n"];
  metric_name: load_balancer_metric_name
    [@ocaml.doc
      "The metric for which you want to return information.\n\n Valid load balancer metric names are listed below, along with the most useful [statistics] to include in your request, and the published [unit] value.\n \n  {ul\n        {-   {b  [ClientTLSNegotiationErrorCount] } - The number of TLS connections initiated by the client that did not establish a session with the load balancer due to a TLS error generated by the load balancer. Possible causes include a mismatch of ciphers or protocols.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [HealthyHostCount] } - The number of target instances that are considered healthy.\n            \n              [Statistics]: The most useful statistic are [Average], [Minimum], and [Maximum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [HTTPCode_Instance_2XX_Count] } - The number of HTTP 2XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.\n            \n              [Statistics]: The most useful statistic is [Sum]. Note that [Minimum], [Maximum], and [Average] all return [1].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [HTTPCode_Instance_3XX_Count] } - The number of HTTP 3XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.\n            \n              [Statistics]: The most useful statistic is [Sum]. Note that [Minimum], [Maximum], and [Average] all return [1].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [HTTPCode_Instance_4XX_Count] } - The number of HTTP 4XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.\n            \n              [Statistics]: The most useful statistic is [Sum]. Note that [Minimum], [Maximum], and [Average] all return [1].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [HTTPCode_Instance_5XX_Count] } - The number of HTTP 5XX response codes generated by the target instances. This does not include any response codes generated by the load balancer.\n            \n              [Statistics]: The most useful statistic is [Sum]. Note that [Minimum], [Maximum], and [Average] all return [1].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [HTTPCode_LB_4XX_Count] } - The number of HTTP 4XX client error codes that originated from the load balancer. Client errors are generated when requests are malformed or incomplete. These requests were not received by the target instance. This count does not include response codes generated by the target instances.\n            \n              [Statistics]: The most useful statistic is [Sum]. Note that [Minimum], [Maximum], and [Average] all return [1].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [HTTPCode_LB_5XX_Count] } - The number of HTTP 5XX server error codes that originated from the load balancer. This does not include any response codes generated by the target instance. This metric is reported if there are no healthy instances attached to the load balancer, or if the request rate exceeds the capacity of the instances (spillover) or the load balancer.\n            \n              [Statistics]: The most useful statistic is [Sum]. Note that [Minimum], [Maximum], and [Average] all return [1].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [InstanceResponseTime] } - The time elapsed, in seconds, after the request leaves the load balancer until a response from the target instance is received.\n            \n              [Statistics]: The most useful statistic is [Average].\n             \n               [Unit]: The published unit is [Seconds].\n              \n               }\n        {-   {b  [RejectedConnectionCount] } - The number of connections that were rejected because the load balancer had reached its maximum number of connections.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [RequestCount] } - The number of requests processed over IPv4. This count includes only the requests with a response generated by a target instance of the load balancer.\n            \n              [Statistics]: The most useful statistic is [Sum]. Note that [Minimum], [Maximum], and [Average] all return [1].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [UnhealthyHostCount] } - The number of target instances that are considered unhealthy.\n            \n              [Statistics]: The most useful statistic are [Average], [Minimum], and [Maximum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        }\n  "];
  load_balancer_name: string [@ocaml.doc "The name of the load balancer.\n"]}
[@@ocaml.doc ""]
type nonrec get_load_balancer_result =
  {
  load_balancer: load_balancer option
    [@ocaml.doc
      "An object containing information about your load balancer.\n"]}
[@@ocaml.doc ""]
type nonrec get_load_balancer_request =
  {
  load_balancer_name: string [@ocaml.doc "The name of the load balancer.\n"]}
[@@ocaml.doc ""]
type nonrec key_pair =
  {
  fingerprint: string option
    [@ocaml.doc "The RSA fingerprint of the key pair.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The resource type (usually [KeyPair]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The region name and Availability Zone where the key pair was created.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the key pair was created ([1479816991.349]).\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the key pair ([arn:aws:lightsail:us-east-2:123456789101:KeyPair/05859e3d-331d-48ba-9034-12345EXAMPLE]).\n"];
  name: string option [@ocaml.doc "The friendly name of the SSH key pair.\n"]}
[@@ocaml.doc "Describes an SSH key pair.\n"]
type nonrec get_key_pairs_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetKeyPairs] request and specify the next page token using the [pageToken] parameter.\n  "];
  key_pairs: key_pair list option
    [@ocaml.doc
      "An array of key-value pairs containing information about the key pairs.\n"]}
[@@ocaml.doc ""]
type nonrec get_key_pairs_request =
  {
  include_default_key_pair: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to include the default key pair in the response of your request.\n"];
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetKeyPairs] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_key_pair_result =
  {
  key_pair: key_pair option
    [@ocaml.doc
      "An array of key-value pairs containing information about the key pair.\n"]}
[@@ocaml.doc ""]
type nonrec get_key_pair_request =
  {
  key_pair_name: string
    [@ocaml.doc
      "The name of the key pair for which you are requesting information.\n"]}
[@@ocaml.doc ""]
type nonrec instance_state =
  {
  name: string option
    [@ocaml.doc "The state of the instance ([running] or [pending]).\n"];
  code: int option [@ocaml.doc "The status code for the instance.\n"]}
[@@ocaml.doc
  "Describes the virtual private server (or {i instance}) status.\n"]
type nonrec get_instance_state_result =
  {
  state: instance_state option [@ocaml.doc "The state of the instance.\n"]}
[@@ocaml.doc ""]
type nonrec get_instance_state_request =
  {
  instance_name: string
    [@ocaml.doc "The name of the instance to get state information about.\n"]}
[@@ocaml.doc ""]
type nonrec instance_snapshot_state =
  | Available [@ocaml.doc ""]
  | Error [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec add_on =
  {
  duration: string option
    [@ocaml.doc
      "The amount of idle time in minutes after which your virtual computer will automatically stop.\n\n  This add-on only applies to Lightsail for Research resources.\n  \n   "];
  threshold: string option
    [@ocaml.doc
      "The trigger threshold of the action.\n\n  This add-on only applies to Lightsail for Research resources.\n  \n   "];
  next_snapshot_time_of_day: string option
    [@ocaml.doc
      "The next daily time an automatic snapshot will be created.\n\n The time shown is in [HH:00] format, and in Coordinated Universal Time (UTC).\n \n  The snapshot is automatically created between the time shown and up to 45 minutes after.\n  "];
  snapshot_time_of_day: string option
    [@ocaml.doc
      "The daily time when an automatic snapshot is created.\n\n The time shown is in [HH:00] format, and in Coordinated Universal Time (UTC).\n \n  The snapshot is automatically created between the time shown and up to 45 minutes after.\n  "];
  status: string option [@ocaml.doc "The status of the add-on.\n"];
  name: string option [@ocaml.doc "The name of the add-on.\n"]}[@@ocaml.doc
                                                                 "Describes an add-on that is enabled for an Amazon Lightsail resource.\n"]
type nonrec disk_state =
  | Unknown [@ocaml.doc ""]
  | InUse [@ocaml.doc ""]
  | Available [@ocaml.doc ""]
  | Error [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec auto_mount_status =
  | NotMounted [@ocaml.doc ""]
  | Mounted [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
  | Failed [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec disk =
  {
  auto_mount_status: auto_mount_status option
    [@ocaml.doc
      "The status of automatically mounting a storage disk to a virtual computer.\n\n  This parameter only applies to Lightsail for Research resources.\n  \n   "];
  gb_in_use: int option
    [@ocaml.doc
      "(Discontinued) The number of GB in use by the disk.\n\n  In releases prior to November 14, 2017, this parameter was not included in the API response. It is now discontinued.\n  \n   "];
  attachment_state: string option
    [@ocaml.doc
      "(Discontinued) The attachment state of the disk.\n\n  In releases prior to November 14, 2017, this parameter returned [attached] for system disks in the API response. It is now discontinued, but still included in the response. Use [isAttached] instead.\n  \n   "];
  is_attached: bool option
    [@ocaml.doc "A Boolean value indicating whether the disk is attached.\n"];
  attached_to: string option
    [@ocaml.doc "The resources to which the disk is attached.\n"];
  state: disk_state option [@ocaml.doc "Describes the status of the disk.\n"];
  path: string option [@ocaml.doc "The disk path.\n"];
  iops: int option
    [@ocaml.doc
      "The input/output operations per second (IOPS) of the disk.\n"];
  is_system_disk: bool option
    [@ocaml.doc
      "A Boolean value indicating whether this disk is a system disk (has an operating system loaded on it).\n"];
  size_in_gb: int option [@ocaml.doc "The size of the disk in GB.\n"];
  add_ons: add_on list option
    [@ocaml.doc
      "An array of objects representing the add-ons enabled on the disk.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type ([Disk]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The AWS Region and Availability Zone where the disk is located.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the disk was created.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the disk.\n"];
  name: string option [@ocaml.doc "The unique name of the disk.\n"]}[@@ocaml.doc
                                                                    "Describes a block storage disk.\n"]
type nonrec instance_snapshot =
  {
  size_in_gb: int option [@ocaml.doc "The size in GB of the SSD.\n"];
  is_from_auto_snapshot: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the snapshot was created from an automatic snapshot.\n"];
  from_bundle_id: string option
    [@ocaml.doc
      "The bundle ID from which you created the snapshot ([micro_x_x]).\n"];
  from_blueprint_id: string option
    [@ocaml.doc
      "The blueprint ID from which you created the snapshot ([amazon_linux_2023]). A blueprint is a virtual private server (or {i instance}) image used to create instances quickly.\n"];
  from_instance_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the instance from which the snapshot was created ([arn:aws:lightsail:us-east-2:123456789101:Instance/64b8404c-ccb1-430b-8daf-12345EXAMPLE]).\n"];
  from_instance_name: string option
    [@ocaml.doc "The instance from which the snapshot was created.\n"];
  from_attached_disks: disk list option
    [@ocaml.doc
      "An array of disk objects containing information about all block storage disks.\n"];
  progress: string option
    [@ocaml.doc
      "The progress of the snapshot.\n\n  This is populated only for disk snapshots, and is [null] for instance snapshots.\n  \n   "];
  state: instance_snapshot_state option
    [@ocaml.doc "The state the snapshot is in.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of resource (usually [InstanceSnapshot]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The region name and Availability Zone where you created the snapshot.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the snapshot was created ([1479907467.024]).\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the snapshot ([arn:aws:lightsail:us-east-2:123456789101:InstanceSnapshot/d23b5706-3322-4d83-81e5-12345EXAMPLE]).\n"];
  name: string option [@ocaml.doc "The name of the snapshot.\n"]}[@@ocaml.doc
                                                                   "Describes an instance snapshot.\n"]
type nonrec get_instance_snapshots_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetInstanceSnapshots] request and specify the next page token using the [pageToken] parameter.\n  "];
  instance_snapshots: instance_snapshot list option
    [@ocaml.doc
      "An array of key-value pairs containing information about the results of your get instance snapshots request.\n"]}
[@@ocaml.doc ""]
type nonrec get_instance_snapshots_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetInstanceSnapshots] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_instance_snapshot_result =
  {
  instance_snapshot: instance_snapshot option
    [@ocaml.doc
      "An array of key-value pairs containing information about the results of your get instance snapshot request.\n"]}
[@@ocaml.doc ""]
type nonrec get_instance_snapshot_request =
  {
  instance_snapshot_name: string
    [@ocaml.doc
      "The name of the snapshot for which you are requesting information.\n"]}
[@@ocaml.doc ""]
type nonrec instance_hardware =
  {
  ram_size_in_gb: float option
    [@ocaml.doc "The amount of RAM in GB on the instance ([1.0]).\n"];
  disks: disk list option
    [@ocaml.doc "The disks attached to the instance.\n"];
  cpu_count: int option
    [@ocaml.doc "The number of vCPUs the instance has.\n"]}[@@ocaml.doc
                                                             "Describes the hardware for the instance.\n"]
type nonrec access_direction =
  | Outbound [@ocaml.doc ""]
  | Inbound [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_port_info =
  {
  cidr_list_aliases: string list option
    [@ocaml.doc
      "An alias that defines access for a preconfigured range of IP addresses.\n\n The only alias currently supported is [lightsail-connect], which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.\n "];
  ipv6_cidrs: string list option
    [@ocaml.doc
      "The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are allowed to connect to an instance through the ports, and the protocol. Only devices with an IPv6 address can connect to an instance through IPv6; otherwise, IPv4 should be used.\n\n  The [cidrs] parameter lists the IPv4 addresses that are allowed to connect to an instance.\n  \n    For more information about CIDR block notation, see {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation}Classless Inter-Domain Routing} on {i Wikipedia}.\n    "];
  cidrs: string list option
    [@ocaml.doc
      "The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are allowed to connect to an instance through the ports, and the protocol.\n\n  The [ipv6Cidrs] parameter lists the IPv6 addresses that are allowed to connect to an instance.\n  \n    For more information about CIDR block notation, see {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation}Classless Inter-Domain Routing} on {i Wikipedia}.\n    "];
  access_direction: access_direction option
    [@ocaml.doc
      "The access direction ([inbound] or [outbound]).\n\n  Lightsail currently supports only [inbound] access direction.\n  \n   "];
  common_name: string option
    [@ocaml.doc "The common name of the port information.\n"];
  access_type: port_access_type option
    [@ocaml.doc "The type of access ([Public] or [Private]).\n"];
  access_from: string option
    [@ocaml.doc
      "The location from which access is allowed. For example, [Anywhere (0.0.0.0/0)], or [Custom] if a specific IP address or range of IP addresses is allowed.\n"];
  protocol: network_protocol option
    [@ocaml.doc
      "The IP protocol name.\n\n The name can be one of the following:\n \n  {ul\n        {-   [tcp] - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.\n            \n             }\n        {-   [all] - All transport layer protocol types. For more general information, see {{:https://en.wikipedia.org/wiki/Transport_layer}Transport layer} on {i Wikipedia}.\n            \n             }\n        {-   [udp] - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.\n            \n             }\n        {-   [icmp] - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached. When you specify [icmp] as the [protocol], you must specify the ICMP type using the [fromPort] parameter, and ICMP code using the [toPort] parameter.\n            \n             }\n        {-   [icmp6] - Internet Control Message Protocol (ICMP) for IPv6. When you specify [icmp6] as the [protocol], you must specify the ICMP type using the [fromPort] parameter, and ICMP code using the [toPort] parameter.\n            \n             }\n        }\n  "];
  to_port: int option
    [@ocaml.doc
      "The last port in a range of open ports on an instance.\n\n Allowed ports:\n \n  {ul\n        {-  TCP and UDP - [0] to [65535] \n            \n             }\n        {-  ICMP - The ICMP code for IPv4 addresses. For example, specify [8] as the [fromPort] (ICMP type), and [-1] as the [toPort] (ICMP code), to enable ICMP Ping. For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages}Control Messages} on {i Wikipedia}.\n            \n             }\n        {-  ICMPv6 - The ICMP code for IPv6 addresses. For example, specify [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort] (ICMPv6 code). For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6}Internet Control Message Protocol for IPv6}.\n            \n             }\n        }\n  "];
  from_port: int option
    [@ocaml.doc
      "The first port in a range of open ports on an instance.\n\n Allowed ports:\n \n  {ul\n        {-  TCP and UDP - [0] to [65535] \n            \n             }\n        {-  ICMP - The ICMP type for IPv4 addresses. For example, specify [8] as the [fromPort] (ICMP type), and [-1] as the [toPort] (ICMP code), to enable ICMP Ping. For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages}Control Messages} on {i Wikipedia}.\n            \n             }\n        {-  ICMPv6 - The ICMP type for IPv6 addresses. For example, specify [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort] (ICMPv6 code). For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6}Internet Control Message Protocol for IPv6}.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes information about ports for an Amazon Lightsail instance.\n"]
type nonrec instance_networking =
  {
  ports: instance_port_info list option
    [@ocaml.doc
      "An array of key-value pairs containing information about the ports on the instance.\n"];
  monthly_transfer: monthly_transfer option
    [@ocaml.doc
      "The amount of data in GB allocated for monthly data transfers.\n"]}
[@@ocaml.doc
  "Describes monthly data transfer rates and port information for an instance.\n"]
type nonrec instance_metadata_state =
  | Applied [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec instance_metadata_options =
  {
  http_protocol_ipv6: http_protocol_ipv6 option
    [@ocaml.doc
      "Indicates whether the IPv6 endpoint for the instance metadata service is enabled or disabled.\n"];
  http_put_response_hop_limit: int option
    [@ocaml.doc
      "The desired HTTP PUT response hop limit for instance metadata requests. A larger number means that the instance metadata requests can travel farther.\n"];
  http_endpoint: http_endpoint option
    [@ocaml.doc
      "Indicates whether the HTTP metadata endpoint on your instances is enabled or disabled.\n\n If the value is [disabled], you cannot access your instance metadata.\n "];
  http_tokens: http_tokens option
    [@ocaml.doc
      "The state of token usage for your instance metadata requests.\n\n If the state is [optional], you can choose whether to retrieve instance metadata with a signed token header on your request. If you retrieve the IAM role credentials without a token, the version 1.0 role credentials are returned. If you retrieve the IAM role credentials by using a valid signed token, the version 2.0 role credentials are returned.\n \n  If the state is [required], you must send a signed token header with all instance metadata retrieval requests. In this state, retrieving the IAM role credential always returns the version 2.0 credentials. The version 1.0 credentials are not available.\n  \n    Not all instance blueprints in Lightsail support version 2.0 credentials. Use the [MetadataNoToken] instance metric to track the number of calls to the instance metadata service that are using version 1.0 credentials. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-viewing-instance-health-metrics}Viewing instance metrics in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n    \n     "];
  state: instance_metadata_state option
    [@ocaml.doc
      "The state of the metadata option changes.\n\n The following states are possible:\n \n  {ul\n        {-   [pending] - The metadata options are being updated. The instance is not yet ready to process metadata traffic with the new selection.\n            \n             }\n        {-   [applied] - The metadata options have been successfully applied to the instance.\n            \n             }\n        }\n  "]}
[@@ocaml.doc "The metadata options for the instance.\n"]
type nonrec instance =
  {
  metadata_options: instance_metadata_options option
    [@ocaml.doc "The metadata options for the Amazon Lightsail instance.\n"];
  ssh_key_name: string option
    [@ocaml.doc
      "The name of the SSH key being used to connect to the instance ([LightsailDefaultKeyPair]).\n"];
  username: string option
    [@ocaml.doc
      "The user name for connecting to the instance ([ec2-user]).\n"];
  state: instance_state option
    [@ocaml.doc
      "The status code and the state ([running]) for the instance.\n"];
  networking: instance_networking option
    [@ocaml.doc
      "Information about the public ports and monthly data transfer rates for the instance.\n"];
  hardware: instance_hardware option
    [@ocaml.doc
      "The size of the vCPU and the amount of RAM for the instance.\n"];
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "The IP address type of the instance.\n\n The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and [dualstack] for IPv4 and IPv6.\n "];
  ipv6_addresses: string list option
    [@ocaml.doc "The IPv6 addresses of the instance.\n"];
  public_ip_address: string option
    [@ocaml.doc "The public IP address of the instance.\n"];
  private_ip_address: string option
    [@ocaml.doc "The private IP address of the instance.\n"];
  is_static_ip: bool option
    [@ocaml.doc
      "A Boolean value indicating whether this instance has a static IP assigned to it.\n"];
  add_ons: add_on list option
    [@ocaml.doc
      "An array of objects representing the add-ons enabled on the instance.\n"];
  bundle_id: string option
    [@ocaml.doc "The bundle for the instance ([micro_x_x]).\n"];
  blueprint_name: string option
    [@ocaml.doc
      "The friendly name of the blueprint ([Amazon Linux 2023]).\n"];
  blueprint_id: string option
    [@ocaml.doc "The blueprint ID ([amazon_linux_2023]).\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The type of resource (usually [Instance]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The region name and Availability Zone where the instance is located.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the instance was created ([1479734909.17]) in Unix time format.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the instance ([arn:aws:lightsail:us-east-2:123456789101:Instance/244ad76f-8aad-4741-809f-12345EXAMPLE]).\n"];
  name: string option
    [@ocaml.doc
      "The name the user gave the instance ([Amazon_Linux_2023-1]).\n"]}
[@@ocaml.doc "Describes an instance (a virtual private server).\n"]
type nonrec get_instances_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetInstances] request and specify the next page token using the [pageToken] parameter.\n  "];
  instances: instance list option
    [@ocaml.doc
      "An array of key-value pairs containing information about your instances.\n"]}
[@@ocaml.doc ""]
type nonrec get_instances_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetInstances] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec instance_port_state =
  {
  cidr_list_aliases: string list option
    [@ocaml.doc
      "An alias that defines access for a preconfigured range of IP addresses.\n\n The only alias currently supported is [lightsail-connect], which allows IP addresses of the browser-based RDP/SSH client in the Lightsail console to connect to your instance.\n "];
  ipv6_cidrs: string list option
    [@ocaml.doc
      "The IPv6 address, or range of IPv6 addresses (in CIDR notation) that are allowed to connect to an instance through the ports, and the protocol. Only devices with an IPv6 address can connect to an instance through IPv6; otherwise, IPv4 should be used.\n\n  The [cidrs] parameter lists the IPv4 addresses that are allowed to connect to an instance.\n  \n    For more information about CIDR block notation, see {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation}Classless Inter-Domain Routing} on {i Wikipedia}.\n    "];
  cidrs: string list option
    [@ocaml.doc
      "The IPv4 address, or range of IPv4 addresses (in CIDR notation) that are allowed to connect to an instance through the ports, and the protocol.\n\n  The [ipv6Cidrs] parameter lists the IPv6 addresses that are allowed to connect to an instance.\n  \n    For more information about CIDR block notation, see {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation}Classless Inter-Domain Routing} on {i Wikipedia}.\n    "];
  state: port_state option
    [@ocaml.doc
      "Specifies whether the instance port is [open] or [closed].\n\n  The port state for Lightsail instances is always [open].\n  \n   "];
  protocol: network_protocol option
    [@ocaml.doc
      "The IP protocol name.\n\n The name can be one of the following:\n \n  {ul\n        {-   [tcp] - Transmission Control Protocol (TCP) provides reliable, ordered, and error-checked delivery of streamed data between applications running on hosts communicating by an IP network. If you have an application that doesn't require reliable data stream service, use UDP instead.\n            \n             }\n        {-   [all] - All transport layer protocol types. For more general information, see {{:https://en.wikipedia.org/wiki/Transport_layer}Transport layer} on {i Wikipedia}.\n            \n             }\n        {-   [udp] - With User Datagram Protocol (UDP), computer applications can send messages (or datagrams) to other hosts on an Internet Protocol (IP) network. Prior communications are not required to set up transmission channels or data paths. Applications that don't require reliable data stream service can use UDP, which provides a connectionless datagram service that emphasizes reduced latency over reliability. If you do require reliable data stream service, use TCP instead.\n            \n             }\n        {-   [icmp] - Internet Control Message Protocol (ICMP) is used to send error messages and operational information indicating success or failure when communicating with an instance. For example, an error is indicated when an instance could not be reached. When you specify [icmp] as the [protocol], you must specify the ICMP type using the [fromPort] parameter, and ICMP code using the [toPort] parameter.\n            \n             }\n        {-   [icmp6] - Internet Control Message Protocol (ICMP) for IPv6. When you specify [icmp6] as the [protocol], you must specify the ICMP type using the [fromPort] parameter, and ICMP code using the [toPort] parameter.\n            \n             }\n        }\n  "];
  to_port: int option
    [@ocaml.doc
      "The last port in a range of open ports on an instance.\n\n Allowed ports:\n \n  {ul\n        {-  TCP and UDP - [0] to [65535] \n            \n             }\n        {-  ICMP - The ICMP code for IPv4 addresses. For example, specify [8] as the [fromPort] (ICMP type), and [-1] as the [toPort] (ICMP code), to enable ICMP Ping. For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages}Control Messages} on {i Wikipedia}.\n            \n             }\n        {-  ICMPv6 - The ICMP code for IPv6 addresses. For example, specify [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort] (ICMPv6 code). For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6}Internet Control Message Protocol for IPv6}.\n            \n             }\n        }\n  "];
  from_port: int option
    [@ocaml.doc
      "The first port in a range of open ports on an instance.\n\n Allowed ports:\n \n  {ul\n        {-  TCP and UDP - [0] to [65535] \n            \n             }\n        {-  ICMP - The ICMP type for IPv4 addresses. For example, specify [8] as the [fromPort] (ICMP type), and [-1] as the [toPort] (ICMP code), to enable ICMP Ping. For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol#Control_messages}Control Messages} on {i Wikipedia}.\n            \n             }\n        {-  ICMPv6 - The ICMP type for IPv6 addresses. For example, specify [128] as the [fromPort] (ICMPv6 type), and [0] as [toPort] (ICMPv6 code). For more information, see {{:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol_for_IPv6}Internet Control Message Protocol for IPv6}.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes open ports on an instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.\n"]
type nonrec get_instance_port_states_result =
  {
  port_states: instance_port_state list option
    [@ocaml.doc
      "An array of objects that describe the firewall port states for the specified instance.\n"]}
[@@ocaml.doc ""]
type nonrec get_instance_port_states_request =
  {
  instance_name: string
    [@ocaml.doc
      "The name of the instance for which to return firewall port states.\n"]}
[@@ocaml.doc ""]
type nonrec instance_metric_name =
  | MetadataNoToken [@ocaml.doc ""]
  | BurstCapacityPercentage [@ocaml.doc ""]
  | BurstCapacityTime [@ocaml.doc ""]
  | StatusCheckFailed_System [@ocaml.doc ""]
  | StatusCheckFailed_Instance [@ocaml.doc ""]
  | StatusCheckFailed [@ocaml.doc ""]
  | NetworkOut [@ocaml.doc ""]
  | NetworkIn [@ocaml.doc ""]
  | CPUUtilization [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_instance_metric_data_result =
  {
  metric_data: metric_datapoint list option
    [@ocaml.doc
      "An array of objects that describe the metric data returned.\n"];
  metric_name: instance_metric_name option
    [@ocaml.doc "The name of the metric returned.\n"]}[@@ocaml.doc ""]
type nonrec get_instance_metric_data_request =
  {
  statistics: metric_statistic list
    [@ocaml.doc
      "The statistic for the metric.\n\n The following statistics are available:\n \n  {ul\n        {-   [Minimum] - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.\n            \n             }\n        {-   [Maximum] - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.\n            \n             }\n        {-   [Sum] - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.\n            \n             }\n        {-   [Average] - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.\n            \n             }\n        {-   [SampleCount] - The count, or number, of data points used for the statistical calculation.\n            \n             }\n        }\n  "];
  unit_: metric_unit
    [@ocaml.doc
      "The unit for the metric data request. Valid units depend on the metric data being requested. For the valid units to specify with each available metric, see the [metricName] parameter.\n"];
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The end time of the time period.\n"];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The start time of the time period.\n"];
  period: int
    [@ocaml.doc
      "The granularity, in seconds, of the returned data points.\n\n The [StatusCheckFailed], [StatusCheckFailed_Instance], and [StatusCheckFailed_System] instance metric data is available in 1-minute (60 seconds) granularity. All other instance metric data is available in 5-minute (300 seconds) granularity.\n "];
  metric_name: instance_metric_name
    [@ocaml.doc
      "The metric for which you want to return information.\n\n Valid instance metric names are listed below, along with the most useful [statistics] to include in your request, and the published [unit] value.\n \n  {ul\n        {-   {b  [BurstCapacityPercentage] } - The percentage of CPU performance available for your instance to burst above its baseline. Your instance continuously accrues and consumes burst capacity. Burst capacity stops accruing when your instance's [BurstCapacityPercentage] reaches 100%. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-viewing-instance-burst-capacity}Viewing instance burst capacity in Amazon Lightsail}.\n            \n              [Statistics]: The most useful statistics are [Maximum] and [Average].\n             \n               [Unit]: The published unit is [Percent].\n              \n               }\n        {-   {b  [BurstCapacityTime] } - The available amount of time for your instance to burst at 100% CPU utilization. Your instance continuously accrues and consumes burst capacity. Burst capacity time stops accruing when your instance's [BurstCapacityPercentage] metric reaches 100%.\n            \n             Burst capacity time is consumed at the full rate only when your instance operates at 100% CPU utilization. For example, if your instance operates at 50% CPU utilization in the burstable zone for a 5-minute period, then it consumes CPU burst capacity minutes at a 50% rate in that period. Your instance consumed 2 minutes and 30 seconds of CPU burst capacity minutes in the 5-minute period. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-viewing-instance-burst-capacity}Viewing instance burst capacity in Amazon Lightsail}.\n             \n               [Statistics]: The most useful statistics are [Maximum] and [Average].\n              \n                [Unit]: The published unit is [Seconds].\n               \n                }\n        {-   {b  [CPUUtilization] } - The percentage of allocated compute units that are currently in use on the instance. This metric identifies the processing power to run the applications on the instance. Tools in your operating system can show a lower percentage than Lightsail when the instance is not allocated a full processor core.\n            \n              [Statistics]: The most useful statistics are [Maximum] and [Average].\n             \n               [Unit]: The published unit is [Percent].\n              \n               }\n        {-   {b  [NetworkIn] } - The number of bytes received on all network interfaces by the instance. This metric identifies the volume of incoming network traffic to the instance. The number reported is the number of bytes received during the period. Because this metric is reported in 5-minute intervals, divide the reported number by 300 to find Bytes/second.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Bytes].\n              \n               }\n        {-   {b  [NetworkOut] } - The number of bytes sent out on all network interfaces by the instance. This metric identifies the volume of outgoing network traffic from the instance. The number reported is the number of bytes sent during the period. Because this metric is reported in 5-minute intervals, divide the reported number by 300 to find Bytes/second.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Bytes].\n              \n               }\n        {-   {b  [StatusCheckFailed] } - Reports whether the instance passed or failed both the instance status check and the system status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [StatusCheckFailed_Instance] } - Reports whether the instance passed or failed the instance status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [StatusCheckFailed_System] } - Reports whether the instance passed or failed the system status check. This metric can be either 0 (passed) or 1 (failed). This metric data is available in 1-minute (60 seconds) granularity.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        {-   {b  [MetadataNoToken] } - Reports the number of times that the instance metadata service was successfully accessed without a token. This metric determines if there are any processes accessing instance metadata by using Instance Metadata Service Version 1, which doesn't use a token. If all requests use token-backed sessions, such as Instance Metadata Service Version 2, then the value is 0.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [Count].\n              \n               }\n        }\n  "];
  instance_name: string
    [@ocaml.doc
      "The name of the instance for which you want to get metrics data.\n"]}
[@@ocaml.doc ""]
type nonrec instance_access_protocol =
  | Rdp [@ocaml.doc ""]
  | Ssh [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec host_key_attributes =
  {
  not_valid_after: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The returned RDP certificate is not valid after this point in time.\n\n This value is listed only for RDP certificates.\n "];
  not_valid_before: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The returned RDP certificate is valid after this point in time.\n\n This value is listed only for RDP certificates.\n "];
  fingerprint_sh_a256: string option
    [@ocaml.doc
      "The SHA-256 fingerprint of the returned SSH host key or RDP certificate.\n\n {ul\n       {-  Example of an SHA-256 SSH fingerprint:\n           \n             [SHA256:KTsMnRBh1IhD17HpdfsbzeGA4jOijm5tyXsMjKVbB8o] \n            \n             }\n       {-  Example of an SHA-256 RDP fingerprint:\n           \n             [03:9b:36:9f:4b:de:4e:61:70:fc:7c:c9:78:e7:d2:1a:1c:25:a8:0c:91:f6:7c:e4:d6:a0:85:c8:b4:53:99:68] \n            \n             }\n       }\n  "];
  fingerprint_sh_a1: string option
    [@ocaml.doc
      "The SHA-1 fingerprint of the returned SSH host key or RDP certificate.\n\n {ul\n       {-  Example of an SHA-1 SSH fingerprint:\n           \n             [SHA1:1CHH6FaAaXjtFOsR/t83vf91SR0] \n            \n             }\n       {-  Example of an SHA-1 RDP fingerprint:\n           \n             [af:34:51:fe:09:f0:e0:da:b8:4e:56:ca:60:c2:10:ff:38:06:db:45] \n            \n             }\n       }\n  "];
  witnessed_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time that the SSH host key or RDP certificate was recorded by Lightsail.\n"];
  public_key: string option
    [@ocaml.doc "The public SSH host key or the RDP certificate.\n"];
  algorithm: string option
    [@ocaml.doc
      "The SSH host key algorithm or the RDP certificate format.\n\n For SSH host keys, the algorithm may be [ssh-rsa], [ecdsa-sha2-nistp256], [ssh-ed25519], etc. For RDP certificates, the algorithm is always [x509-cert].\n "]}
[@@ocaml.doc "Describes the public SSH host keys or the RDP certificate.\n"]
type nonrec instance_access_details =
  {
  host_keys: host_key_attributes list option
    [@ocaml.doc
      "Describes the public SSH host keys or the RDP certificate.\n"];
  username: string option
    [@ocaml.doc
      "The user name to use when logging in to the Amazon Lightsail instance.\n"];
  instance_name: string option
    [@ocaml.doc "The name of this Amazon Lightsail instance.\n"];
  protocol: instance_access_protocol option
    [@ocaml.doc
      "The protocol for these Amazon Lightsail instance access details.\n"];
  private_key: string option
    [@ocaml.doc
      "For SSH access, the temporary private key. For OpenSSH clients (command line SSH), you should save this value to [tempkey]).\n"];
  password_data: password_data option
    [@ocaml.doc
      "For a Windows Server-based instance, an object with the data you can use to retrieve your password. This is only needed if [password] is empty and the instance is not new (and therefore the password is not ready yet). When you create an instance, it can take up to 15 minutes for the instance to be ready.\n"];
  password: string option
    [@ocaml.doc
      "For RDP access, the password for your Amazon Lightsail instance. Password will be an empty string if the password for your new instance is not ready yet. When you create an instance, it can take up to 15 minutes for the instance to be ready.\n\n  If you create an instance using any key pair other than the default ([LightsailDefaultKeyPair]), [password] will always be an empty string.\n  \n   If you change the Administrator password on the instance, Lightsail will continue to return the original password value. When accessing the instance using RDP, you need to manually enter the Administrator password after changing it from the default.\n   \n    "];
  ipv6_addresses: string list option
    [@ocaml.doc "The IPv6 address of the Amazon Lightsail instance.\n"];
  ip_address: string option
    [@ocaml.doc "The public IP address of the Amazon Lightsail instance.\n"];
  expires_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "For SSH access, the date on which the temporary keys expire.\n"];
  cert_key: string option
    [@ocaml.doc
      "For SSH access, the public key to use when accessing your instance For OpenSSH clients (command line SSH), you should save this value to [tempkey-cert.pub].\n"]}
[@@ocaml.doc
  "The parameters for gaining temporary access to one of your Amazon Lightsail instances.\n"]
type nonrec get_instance_access_details_result =
  {
  access_details: instance_access_details option
    [@ocaml.doc
      "An array of key-value pairs containing information about a get instance access request.\n"]}
[@@ocaml.doc ""]
type nonrec get_instance_access_details_request =
  {
  protocol: instance_access_protocol option
    [@ocaml.doc
      "The protocol to use to connect to your instance. Defaults to [ssh].\n"];
  instance_name: string [@ocaml.doc "The name of the instance to access.\n"]}
[@@ocaml.doc ""]
type nonrec get_instance_result =
  {
  instance: instance option
    [@ocaml.doc
      "An array of key-value pairs containing information about the specified instance.\n"]}
[@@ocaml.doc ""]
type nonrec get_instance_request =
  {
  instance_name: string [@ocaml.doc "The name of the instance.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec export_snapshot_record_source_type =
  | DiskSnapshot [@ocaml.doc ""]
  | InstanceSnapshot [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec disk_info =
  {
  is_system_disk: bool option
    [@ocaml.doc
      "A Boolean value indicating whether this disk is a system disk (has an operating system loaded on it).\n"];
  size_in_gb: int option [@ocaml.doc "The size of the disk in GB ([32]).\n"];
  path: string option [@ocaml.doc "The disk path.\n"];
  name: string option [@ocaml.doc "The disk name.\n"]}[@@ocaml.doc
                                                        "Describes a disk.\n"]
type nonrec instance_snapshot_info =
  {
  from_disk_info: disk_info list option
    [@ocaml.doc
      "A list of objects describing the disks that were attached to the source instance.\n"];
  from_blueprint_id: string option
    [@ocaml.doc
      "The blueprint ID from which the source instance ([amazon_linux_2023]).\n"];
  from_bundle_id: string option
    [@ocaml.doc
      "The bundle ID from which the source instance was created ([micro_x_x]).\n"]}
[@@ocaml.doc "Describes an instance snapshot.\n"]
type nonrec disk_snapshot_info =
  {
  size_in_gb: int option [@ocaml.doc "The size of the disk in GB ([32]).\n"]}
[@@ocaml.doc "Describes a disk snapshot.\n"]
type nonrec export_snapshot_record_source_info =
  {
  disk_snapshot_info: disk_snapshot_info option
    [@ocaml.doc "A list of objects describing a disk snapshot.\n"];
  instance_snapshot_info: instance_snapshot_info option
    [@ocaml.doc "A list of objects describing an instance snapshot.\n"];
  from_resource_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the snapshot's source instance or disk.\n"];
  from_resource_name: string option
    [@ocaml.doc "The name of the snapshot's source instance or disk.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the source instance or disk snapshot.\n"];
  name: string option
    [@ocaml.doc "The name of the source instance or disk snapshot.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date when the source instance or disk snapshot was created.\n"];
  resource_type: export_snapshot_record_source_type option
    [@ocaml.doc
      "The Lightsail resource type ([InstanceSnapshot] or [DiskSnapshot]).\n"]}
[@@ocaml.doc "Describes the source of an export snapshot record.\n"]
type nonrec destination_info =
  {
  service: string option
    [@ocaml.doc "The destination service of the record.\n"];
  id: string option
    [@ocaml.doc "The ID of the resource created at the destination.\n"]}
[@@ocaml.doc "Describes the destination of a record.\n"]
type nonrec export_snapshot_record =
  {
  destination_info: destination_info option
    [@ocaml.doc
      "A list of objects describing the destination of the export snapshot record.\n"];
  source_info: export_snapshot_record_source_info option
    [@ocaml.doc
      "A list of objects describing the source of the export snapshot record.\n"];
  state: record_state option
    [@ocaml.doc "The state of the export snapshot record.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type ([ExportSnapshotRecord]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The AWS Region and Availability Zone where the export snapshot record is located.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the export snapshot record was created.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the export snapshot record.\n"];
  name: string option [@ocaml.doc "The export snapshot record name.\n"]}
[@@ocaml.doc "Describes an export snapshot record.\n"]
type nonrec get_export_snapshot_records_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetExportSnapshotRecords] request and specify the next page token using the [pageToken] parameter.\n  "];
  export_snapshot_records: export_snapshot_record list option
    [@ocaml.doc
      "A list of objects describing the export snapshot records.\n"]}
[@@ocaml.doc ""]
type nonrec get_export_snapshot_records_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetExportSnapshotRecords] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec domain =
  {
  registered_domain_delegation_info: registered_domain_delegation_info option
    [@ocaml.doc
      "An object that describes the state of the Route\194\16053 domain delegation to a Lightsail DNS zone.\n"];
  domain_entries: domain_entry list option
    [@ocaml.doc
      "An array of key-value pairs containing information about the domain entries.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option [@ocaml.doc "The resource type. \n"];
  location: resource_location option
    [@ocaml.doc
      "The AWS Region and Availability Zones where the domain recordset was created.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the domain recordset was created.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the domain recordset ([arn:aws:lightsail:global:123456789101:Domain/824cede0-abc7-4f84-8dbc-12345EXAMPLE]).\n"];
  name: string option [@ocaml.doc "The name of the domain.\n"]}[@@ocaml.doc
                                                                 "Describes a domain where you are storing recordsets.\n"]
type nonrec get_domains_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetDomains] request and specify the next page token using the [pageToken] parameter.\n  "];
  domains: domain list option
    [@ocaml.doc
      "An array of key-value pairs containing information about each of the domain entries in the user's account.\n"]}
[@@ocaml.doc ""]
type nonrec get_domains_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetDomains] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_domain_result =
  {
  domain: domain option
    [@ocaml.doc
      "An array of key-value pairs containing information about your get domain request.\n"]}
[@@ocaml.doc ""]
type nonrec get_domain_request =
  {
  domain_name: string
    [@ocaml.doc
      "The domain name for which your want to return information about.\n"]}
[@@ocaml.doc ""]
type nonrec lightsail_distribution =
  {
  viewer_minimum_tls_protocol_version: string option
    [@ocaml.doc
      "The minimum TLS protocol version that the distribution can use to communicate with viewers.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "The IP address type of the distribution.\n\n The possible values are [ipv4] for IPv4 only, and [dualstack] for IPv4 and IPv6.\n "];
  able_to_update_bundle: bool option
    [@ocaml.doc
      "Indicates whether the bundle that is currently applied to your distribution, specified using the [distributionName] parameter, can be changed to another bundle.\n\n Use the [UpdateDistributionBundle] action to change your distribution's bundle.\n "];
  cache_behaviors: cache_behavior_per_path list option
    [@ocaml.doc
      "An array of objects that describe the per-path cache behavior of the distribution.\n"];
  cache_behavior_settings: cache_settings option
    [@ocaml.doc
      "An object that describes the cache behavior settings of the distribution.\n"];
  default_cache_behavior: cache_behavior option
    [@ocaml.doc
      "An object that describes the default cache behavior of the distribution.\n"];
  origin_public_dn_s: string option
    [@ocaml.doc "The public DNS of the origin.\n"];
  origin: origin option
    [@ocaml.doc
      "An object that describes the origin resource of the distribution, such as a Lightsail instance, bucket, or load balancer.\n\n The distribution pulls, caches, and serves content from the origin.\n "];
  certificate_name: string option
    [@ocaml.doc
      "The name of the SSL/TLS certificate attached to the distribution, if any.\n"];
  bundle_id: string option
    [@ocaml.doc
      "The ID of the bundle currently applied to the distribution.\n"];
  domain_name: string option
    [@ocaml.doc "The domain name of the distribution.\n"];
  is_enabled: bool option
    [@ocaml.doc "Indicates whether the distribution is enabled.\n"];
  status: string option [@ocaml.doc "The status of the distribution.\n"];
  alternative_domain_names: string list option
    [@ocaml.doc "The alternate domain names of the distribution.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type ([Distribution]).\n"];
  location: resource_location option
    [@ocaml.doc
      "An object that describes the location of the distribution, such as the Amazon Web Services Region and Availability Zone.\n\n  Lightsail distributions are global resources that can reference an origin in any Amazon Web Services Region, and distribute its content globally. However, all distributions are located in the [us-east-1] Region.\n  \n   "];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the distribution was created.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about your Lightsail distribution. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the distribution.\n"];
  name: string option [@ocaml.doc "The name of the distribution.\n"]}
[@@ocaml.doc
  "Describes an Amazon Lightsail content delivery network (CDN) distribution.\n"]
type nonrec get_distributions_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetDistributions] request and specify the next page token using the [pageToken] parameter.\n  "];
  distributions: lightsail_distribution list option
    [@ocaml.doc "An array of objects that describe your distributions.\n"]}
[@@ocaml.doc ""]
type nonrec get_distributions_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetDistributions] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  distribution_name: string option
    [@ocaml.doc
      "The name of the distribution for which to return information.\n\n When omitted, the response includes all of your distributions in the Amazon Web Services Region where the request is made.\n "]}
[@@ocaml.doc ""]
type nonrec distribution_metric_name =
  | Http5xxErrorRate [@ocaml.doc ""]
  | Http4xxErrorRate [@ocaml.doc ""]
  | TotalErrorRate [@ocaml.doc ""]
  | BytesUploaded [@ocaml.doc ""]
  | BytesDownloaded [@ocaml.doc ""]
  | Requests [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_distribution_metric_data_result =
  {
  metric_data: metric_datapoint list option
    [@ocaml.doc
      "An array of objects that describe the metric data returned.\n"];
  metric_name: distribution_metric_name option
    [@ocaml.doc "The name of the metric returned.\n"]}[@@ocaml.doc ""]
type nonrec get_distribution_metric_data_request =
  {
  statistics: metric_statistic list
    [@ocaml.doc
      "The statistic for the metric.\n\n The following statistics are available:\n \n  {ul\n        {-   [Minimum] - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.\n            \n             }\n        {-   [Maximum] - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.\n            \n             }\n        {-   [Sum] - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.\n            \n             }\n        {-   [Average] - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.\n            \n             }\n        {-   [SampleCount] - The count, or number, of data points used for the statistical calculation.\n            \n             }\n        }\n  "];
  unit_: metric_unit
    [@ocaml.doc
      "The unit for the metric data request.\n\n Valid units depend on the metric data being requested. For the valid units with each available metric, see the [metricName] parameter.\n "];
  period: int
    [@ocaml.doc
      "The granularity, in seconds, for the metric data points that will be returned.\n"];
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The end of the time interval for which to get metric data.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use an end time of October 1, 2018, at 9 PM UTC, specify [1538427600] as the end time.\n             \n              }\n        }\n   You can convert a human-friendly time to Unix time format using a converter like {{:https://www.epochconverter.com/}Epoch converter}.\n   "];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The start of the time interval for which to get metric data.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, specify [1538424000] as the start time.\n             \n              }\n        }\n   You can convert a human-friendly time to Unix time format using a converter like {{:https://www.epochconverter.com/}Epoch converter}.\n   "];
  metric_name: distribution_metric_name
    [@ocaml.doc
      "The metric for which you want to return information.\n\n Valid distribution metric names are listed below, along with the most useful [statistics] to include in your request, and the published [unit] value.\n \n  {ul\n        {-   {b  [Requests] } - The total number of viewer requests received by your Lightsail distribution, for all HTTP methods, and for both HTTP and HTTPS requests.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [None].\n              \n               }\n        {-   {b  [BytesDownloaded] } - The number of bytes downloaded by viewers for GET, HEAD, and OPTIONS requests.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [None].\n              \n               }\n        {-   {b  [BytesUploaded ] } - The number of bytes uploaded to your origin by your Lightsail distribution, using POST and PUT requests.\n            \n              [Statistics]: The most useful statistic is [Sum].\n             \n               [Unit]: The published unit is [None].\n              \n               }\n        {-   {b  [TotalErrorRate] } - The percentage of all viewer requests for which the response's HTTP status code was 4xx or 5xx.\n            \n              [Statistics]: The most useful statistic is [Average].\n             \n               [Unit]: The published unit is [Percent].\n              \n               }\n        {-   {b  [4xxErrorRate] } - The percentage of all viewer requests for which the response's HTTP status cod was 4xx. In these cases, the client or client viewer may have made an error. For example, a status code of 404 (Not Found) means that the client requested an object that could not be found.\n            \n              [Statistics]: The most useful statistic is [Average].\n             \n               [Unit]: The published unit is [Percent].\n              \n               }\n        {-   {b  [5xxErrorRate] } - The percentage of all viewer requests for which the response's HTTP status code was 5xx. In these cases, the origin server did not satisfy the requests. For example, a status code of 503 (Service Unavailable) means that the origin server is currently unavailable.\n            \n              [Statistics]: The most useful statistic is [Average].\n             \n               [Unit]: The published unit is [Percent].\n              \n               }\n        }\n  "];
  distribution_name: string
    [@ocaml.doc
      "The name of the distribution for which to get metric data.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec get_distribution_latest_cache_reset_result =
  {
  create_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp of the last cache reset ([1479734909.17]) in Unix time format.\n"];
  status: string option [@ocaml.doc "The status of the last cache reset.\n"]}
[@@ocaml.doc ""]
type nonrec get_distribution_latest_cache_reset_request =
  {
  distribution_name: string option
    [@ocaml.doc
      "The name of the distribution for which to return the timestamp of the last cache reset.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n \n  When omitted, the response includes the latest cache reset timestamp of all your distributions.\n  "]}
[@@ocaml.doc ""]
type nonrec distribution_bundle =
  {
  is_active: bool option
    [@ocaml.doc
      "Indicates whether the bundle is active, and can be specified for a new or existing distribution.\n"];
  transfer_per_month_in_gb: int option
    [@ocaml.doc "The monthly network transfer quota of the bundle.\n"];
  price: float option
    [@ocaml.doc "The monthly price, in US dollars, of the bundle.\n"];
  name: string option [@ocaml.doc "The name of the distribution bundle.\n"];
  bundle_id: string option [@ocaml.doc "The ID of the bundle.\n"]}[@@ocaml.doc
                                                                    "Describes the specifications of a distribution bundle.\n"]
type nonrec get_distribution_bundles_result =
  {
  bundles: distribution_bundle list option
    [@ocaml.doc "An object that describes a distribution bundle.\n"]}
[@@ocaml.doc ""]
type nonrec disk_snapshot_state =
  | Unknown [@ocaml.doc ""]
  | Error [@ocaml.doc ""]
  | Completed [@ocaml.doc ""]
  | Pending [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec disk_snapshot =
  {
  is_from_auto_snapshot: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the snapshot was created from an automatic snapshot.\n"];
  from_instance_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the source instance from which the disk (system volume) snapshot was created.\n"];
  from_instance_name: string option
    [@ocaml.doc
      "The unique name of the source instance from which the disk (system volume) snapshot was created.\n"];
  from_disk_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the source disk from which the disk snapshot was created.\n"];
  from_disk_name: string option
    [@ocaml.doc
      "The unique name of the source disk from which the disk snapshot was created.\n"];
  progress: string option [@ocaml.doc "The progress of the snapshot.\n"];
  state: disk_snapshot_state option
    [@ocaml.doc "The status of the disk snapshot operation.\n"];
  size_in_gb: int option [@ocaml.doc "The size of the disk in GB.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type ([DiskSnapshot]).\n"];
  location: resource_location option
    [@ocaml.doc
      "The AWS Region and Availability Zone where the disk snapshot was created.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the disk snapshot was created.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about an instance or another resource in Lightsail. This code enables our support team to look up your Lightsail information more easily.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the disk snapshot.\n"];
  name: string option
    [@ocaml.doc "The name of the disk snapshot ([my-disk-snapshot]).\n"]}
[@@ocaml.doc "Describes a block storage disk snapshot.\n"]
type nonrec get_disk_snapshots_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetDiskSnapshots] request and specify the next page token using the [pageToken] parameter.\n  "];
  disk_snapshots: disk_snapshot list option
    [@ocaml.doc
      "An array of objects containing information about all block storage disk snapshots.\n"]}
[@@ocaml.doc ""]
type nonrec get_disk_snapshots_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetDiskSnapshots] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_disk_snapshot_result =
  {
  disk_snapshot: disk_snapshot option
    [@ocaml.doc
      "An object containing information about the disk snapshot.\n"]}
[@@ocaml.doc ""]
type nonrec get_disk_snapshot_request =
  {
  disk_snapshot_name: string
    [@ocaml.doc "The name of the disk snapshot ([my-disk-snapshot]).\n"]}
[@@ocaml.doc ""]
type nonrec get_disks_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetDisks] request and specify the next page token using the [pageToken] parameter.\n  "];
  disks: disk list option
    [@ocaml.doc
      "An array of objects containing information about all block storage disks.\n"]}
[@@ocaml.doc ""]
type nonrec get_disks_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetDisks] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec get_disk_result =
  {
  disk: disk option
    [@ocaml.doc "An object containing information about the disk.\n"]}
[@@ocaml.doc ""]
type nonrec get_disk_request =
  {
  disk_name: string [@ocaml.doc "The name of the disk ([my-disk]).\n"]}
[@@ocaml.doc ""]
type nonrec get_cost_estimate_result =
  {
  resources_budget_estimate: resource_budget_estimate list option
    [@ocaml.doc "Returns the estimate's forecasted cost or usage.\n"]}
[@@ocaml.doc ""]
type nonrec get_cost_estimate_request =
  {
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The cost estimate end time.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you want to use an end time of October 1, 2018, at 9 PM UTC, specify [1538427600] as the end time.\n             \n              }\n        }\n   You can convert a human-friendly time to Unix time format using a converter like {{:https://www.epochconverter.com/}Epoch converter}.\n   "];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The cost estimate start time.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you want to use a start time of October 1, 2018, at 8 PM UTC, specify [1538424000] as the start time.\n             \n              }\n        }\n   You can convert a human-friendly time to Unix time format using a converter like {{:https://www.epochconverter.com/}Epoch converter}.\n   "];
  resource_name: string [@ocaml.doc "The resource name.\n"]}[@@ocaml.doc ""]
type nonrec container_services_list_result =
  {
  container_services: container_service list option
    [@ocaml.doc
      "An array of objects that describe one or more container services.\n"]}
[@@ocaml.doc ""]
type nonrec get_container_services_request =
  {
  service_name: string option
    [@ocaml.doc
      "The name of the container service for which to return information.\n\n When omitted, the response includes all of your container services in the Amazon Web Services Region where the request is made.\n "]}
[@@ocaml.doc ""]
type nonrec container_service_power =
  {
  is_active: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the power is active and can be specified for container services.\n"];
  name: string option
    [@ocaml.doc "The friendly name of the power ([nano]).\n"];
  ram_size_in_gb: float option
    [@ocaml.doc "The amount of RAM (in GB) of the power.\n"];
  cpu_count: float option
    [@ocaml.doc "The number of vCPUs included in the power.\n"];
  price: float option [@ocaml.doc "The monthly price of the power in USD.\n"];
  power_id: string option [@ocaml.doc "The ID of the power ([nano-1]).\n"]}
[@@ocaml.doc
  "Describes the powers that can be specified for an Amazon Lightsail container service.\n\n The power specifies the amount of RAM, the number of vCPUs, and the base price of the container service.\n "]
type nonrec get_container_service_powers_result =
  {
  powers: container_service_power list option
    [@ocaml.doc
      "An array of objects that describe the powers that can be specified for a container service.\n"]}
[@@ocaml.doc ""]
type nonrec container_service_metric_name =
  | MemoryUtilization [@ocaml.doc ""]
  | CPUUtilization [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_container_service_metric_data_result =
  {
  metric_data: metric_datapoint list option
    [@ocaml.doc
      "An array of objects that describe the metric data returned.\n"];
  metric_name: container_service_metric_name option
    [@ocaml.doc "The name of the metric returned. \n"]}[@@ocaml.doc ""]
type nonrec get_container_service_metric_data_request =
  {
  statistics: metric_statistic list
    [@ocaml.doc
      "The statistic for the metric.\n\n The following statistics are available:\n \n  {ul\n        {-   [Minimum] - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.\n            \n             }\n        {-   [Maximum] - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.\n            \n             }\n        {-   [Sum] - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.\n            \n             }\n        {-   [Average] - The value of [Sum] / [SampleCount] during the specified period. By comparing this statistic with the [Minimum] and [Maximum] values, you can determine the full scope of a metric and how close the average use is to the [Minimum] and [Maximum] values. This comparison helps you to know when to increase or decrease your resources.\n            \n             }\n        {-   [SampleCount] - The count, or number, of data points used for the statistical calculation.\n            \n             }\n        }\n  "];
  period: int
    [@ocaml.doc
      "The granularity, in seconds, of the returned data points.\n\n All container service metric data is available in 5-minute (300 seconds) granularity.\n "];
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The end time of the time period.\n"];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The start time of the time period.\n"];
  metric_name: container_service_metric_name
    [@ocaml.doc
      "The metric for which you want to return information.\n\n Valid container service metric names are listed below, along with the most useful statistics to include in your request, and the published unit value.\n \n  {ul\n        {-   [CPUUtilization] - The average percentage of compute units that are currently in use across all nodes of the container service. This metric identifies the processing power required to run containers on each node of the container service.\n            \n             Statistics: The most useful statistics are [Maximum] and [Average].\n             \n              Unit: The published unit is [Percent].\n              \n               }\n        {-   [MemoryUtilization] - The average percentage of available memory that is currently in use across all nodes of the container service. This metric identifies the memory required to run containers on each node of the container service.\n            \n             Statistics: The most useful statistics are [Maximum] and [Average].\n             \n              Unit: The published unit is [Percent].\n              \n               }\n        }\n  "];
  service_name: string
    [@ocaml.doc
      "The name of the container service for which to get metric data.\n"]}
[@@ocaml.doc ""]
type nonrec get_container_service_deployments_result =
  {
  deployments: container_service_deployment list option
    [@ocaml.doc
      "An array of objects that describe deployments for a container service.\n"]}
[@@ocaml.doc ""]
type nonrec get_container_service_deployments_request =
  {
  service_name: string
    [@ocaml.doc
      "The name of the container service for which to return deployments.\n"]}
[@@ocaml.doc ""]
type nonrec container_service_log_event =
  {
  message: string option
    [@ocaml.doc "The message of the container service log event.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the container service log event was created.\n"]}
[@@ocaml.doc
  "Describes the log events of a container of an Amazon Lightsail container service.\n"]
type nonrec get_container_log_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetContainerLog] request and specify the next page token using the [pageToken] parameter.\n  "];
  log_events: container_service_log_event list option
    [@ocaml.doc
      "An array of objects that describe the log events of a container.\n"]}
[@@ocaml.doc ""]
type nonrec get_container_log_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetContainerLog] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  filter_pattern: string option
    [@ocaml.doc
      "The pattern to use to filter the returned log events to a specific term.\n\n The following are a few examples of filter patterns that you can specify:\n \n  {ul\n        {-  To return all log events, specify a filter pattern of [\"\"].\n            \n             }\n        {-  To exclude log events that contain the [ERROR] term, and return all other log events, specify a filter pattern of [\"-ERROR\"].\n            \n             }\n        {-  To return log events that contain the [ERROR] term, specify a filter pattern of [\"ERROR\"].\n            \n             }\n        {-  To return log events that contain both the [ERROR] and [Exception] terms, specify a filter pattern of [\"ERROR\n          Exception\"].\n            \n             }\n        {-  To return log events that contain the [ERROR] {i or} the [Exception] term, specify a filter pattern of [\"?ERROR ?Exception\"].\n            \n             }\n        }\n  "];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The end of the time interval for which to get log data.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use an end time of October 1, 2018, at 9 PM UTC, specify [1538427600] as the end time.\n             \n              }\n        }\n   You can convert a human-friendly time to Unix time format using a converter like {{:https://www.epochconverter.com/}Epoch converter}.\n   "];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The start of the time interval for which to get log data.\n\n Constraints:\n \n  {ul\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use a start time of October 1, 2018, at 8 PM UTC, specify [1538424000] as the start time.\n             \n              }\n        }\n   You can convert a human-friendly time to Unix time format using a converter like {{:https://www.epochconverter.com/}Epoch converter}.\n   "];
  container_name: string
    [@ocaml.doc
      "The name of the container that is either running or previously ran on the container service for which to return a log.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the container service for which to get a container log.\n"]}
[@@ocaml.doc ""]
type nonrec get_container_images_result =
  {
  container_images: container_image list option
    [@ocaml.doc
      "An array of objects that describe container images that are registered to the container service.\n"]}
[@@ocaml.doc ""]
type nonrec get_container_images_request =
  {
  service_name: string
    [@ocaml.doc
      "The name of the container service for which to return registered container images.\n"]}
[@@ocaml.doc ""]
type nonrec container_service_metadata_entry = (string * string) list
[@@ocaml.doc ""]
type nonrec get_container_api_metadata_result =
  {
  metadata: container_service_metadata_entry list option
    [@ocaml.doc
      "Metadata about Lightsail containers, such as the current version of the Lightsail Control (lightsailctl) plugin.\n"]}
[@@ocaml.doc ""]
type nonrec contact_method_status =
  | Invalid [@ocaml.doc ""]
  | Valid [@ocaml.doc ""]
  | PendingVerification [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec contact_method =
  {
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about your Lightsail contact method. This code enables our support team to look up your Lightsail information more easily.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type of the contact method.\n"];
  location: resource_location option
    [@ocaml.doc
      "An object that describes the location of the contact method, such as the Amazon Web Services Region and Availability Zone.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the contact method was created.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the contact method.\n"];
  name: string option [@ocaml.doc "The name of the contact method.\n"];
  protocol: contact_protocol option
    [@ocaml.doc
      "The protocol of the contact method, such as email or SMS (text messaging).\n"];
  status: contact_method_status option
    [@ocaml.doc
      "The current status of the contact method.\n\n A contact method has the following possible status:\n \n  {ul\n        {-   [PendingVerification] - The contact method has not yet been verified, and the verification has not yet expired.\n            \n             }\n        {-   [Valid] - The contact method has been verified.\n            \n             }\n        {-   [InValid] - An attempt was made to verify the contact method, but the verification has expired.\n            \n             }\n        }\n  "];
  contact_endpoint: string option
    [@ocaml.doc
      "The destination of the contact method, such as an email address or a mobile phone number.\n"]}
[@@ocaml.doc
  "Describes a contact method.\n\n A contact method is a way to send you notifications. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.\n "]
type nonrec get_contact_methods_result =
  {
  contact_methods: contact_method list option
    [@ocaml.doc "An array of objects that describe the contact methods.\n"]}
[@@ocaml.doc ""]
type nonrec get_contact_methods_request =
  {
  protocols: contact_protocol list option
    [@ocaml.doc
      "The protocols used to send notifications, such as [Email], or [SMS] (text messaging).\n\n Specify a protocol in your request to return information about a specific contact method protocol.\n "]}
[@@ocaml.doc ""]
type nonrec cloud_formation_stack_record_source_type =
  | ExportSnapshotRecord [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cloud_formation_stack_record_source_info =
  {
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the export snapshot record.\n"];
  name: string option [@ocaml.doc "The name of the record.\n"];
  resource_type: cloud_formation_stack_record_source_type option
    [@ocaml.doc "The Lightsail resource type ([ExportSnapshotRecord]).\n"]}
[@@ocaml.doc
  "Describes the source of a CloudFormation stack record (i.e., the export snapshot record).\n"]
type nonrec cloud_formation_stack_record =
  {
  destination_info: destination_info option
    [@ocaml.doc
      "A list of objects describing the destination service, which is AWS CloudFormation, and the Amazon Resource Name (ARN) of the AWS CloudFormation stack.\n"];
  source_info: cloud_formation_stack_record_source_info list option
    [@ocaml.doc
      "A list of objects describing the source of the CloudFormation stack record.\n"];
  state: record_state option
    [@ocaml.doc "The current state of the CloudFormation stack record.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The Lightsail resource type ([CloudFormationStackRecord]).\n"];
  location: resource_location option
    [@ocaml.doc
      "A list of objects describing the Availability Zone and Amazon Web Services Region of the CloudFormation stack record.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date when the CloudFormation stack record was created.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the CloudFormation stack record.\n"];
  name: string option
    [@ocaml.doc
      "The name of the CloudFormation stack record. It starts with [CloudFormationStackRecord] followed by a GUID.\n"]}
[@@ocaml.doc
  "Describes a CloudFormation stack record created as a result of the [create cloud\n        formation stack] action.\n\n A CloudFormation stack record provides information about the AWS CloudFormation stack used to create a new Amazon Elastic Compute Cloud instance from an exported Lightsail instance snapshot.\n "]
type nonrec get_cloud_formation_stack_records_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetCloudFormationStackRecords] request and specify the next page token using the [pageToken] parameter.\n  "];
  cloud_formation_stack_records: cloud_formation_stack_record list option
    [@ocaml.doc
      "A list of objects describing the CloudFormation stack records.\n"]}
[@@ocaml.doc ""]
type nonrec get_cloud_formation_stack_records_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetClouFormationStackRecords] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec certificate_status =
  | Failed [@ocaml.doc ""]
  | Revoked [@ocaml.doc ""]
  | ValidationTimedOut [@ocaml.doc ""]
  | Expired [@ocaml.doc ""]
  | Inactive [@ocaml.doc ""]
  | Issued [@ocaml.doc ""]
  | PendingValidation [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec certificate =
  {
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about your Lightsail certificate. This code enables our support team to look up your Lightsail information more easily.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  revocation_reason: string option
    [@ocaml.doc
      "The reason the certificate was revoked. This value is present only when the certificate status is [REVOKED].\n"];
  revoked_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp when the certificate was revoked. This value is present only when the certificate status is [REVOKED].\n"];
  renewal_summary: renewal_summary option
    [@ocaml.doc
      "An object that describes the status of the certificate renewal managed by Lightsail.\n"];
  eligible_to_renew: string option
    [@ocaml.doc "The renewal eligibility of the certificate.\n"];
  not_after: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the certificate expires.\n"];
  not_before: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the certificate is first valid.\n"];
  issuer_c_a: string option
    [@ocaml.doc "The certificate authority that issued the certificate.\n"];
  issued_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the certificate was issued.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the certificate was created.\n"];
  key_algorithm: string option
    [@ocaml.doc
      "The algorithm used to generate the key pair (the public and private key) of the certificate.\n"];
  in_use_resource_count: int option
    [@ocaml.doc
      "The number of Lightsail resources that the certificate is attached to.\n"];
  request_failure_reason: string option
    [@ocaml.doc
      "The validation failure reason, if any, of the certificate.\n\n The following failure reasons are possible:\n \n  {ul\n        {-   {b  [NO_AVAILABLE_CONTACTS] } - This failure applies to email validation, which is not available for Lightsail certificates.\n            \n             }\n        {-   {b  [ADDITIONAL_VERIFICATION_REQUIRED] } - Lightsail requires additional information to process this certificate request. This can happen as a fraud-protection measure, such as when the domain ranks within the Alexa top 1000 websites. To provide the required information, use the {{:https://console.aws.amazon.com/support/home}Amazon Web Services Support Center} to contact Amazon Web Services Support.\n            \n              You cannot request a certificate for Amazon-owned domain names such as those ending in amazonaws.com, cloudfront.net, or elasticbeanstalk.com.\n              \n                }\n        {-   {b  [DOMAIN_NOT_ALLOWED] } - One or more of the domain names in the certificate request was reported as an unsafe domain by {{:https://www.virustotal.com/gui/home/url}VirusTotal}. To correct the problem, search for your domain name on the {{:https://www.virustotal.com/gui/home/url}VirusTotal} website. If your domain is reported as suspicious, see {{:https://developers.google.com/web/fundamentals/security/hacked}Google Help for Hacked Websites} to learn what you can do.\n            \n             If you believe that the result is a false positive, notify the organization that is reporting the domain. VirusTotal is an aggregate of several antivirus and URL scanners and cannot remove your domain from a block list itself. After you correct the problem and the VirusTotal registry has been updated, request a new certificate.\n             \n              If you see this error and your domain is not included in the VirusTotal list, visit the {{:https://console.aws.amazon.com/support/home}Amazon Web Services Support Center} and create a case.\n              \n               }\n        {-   {b  [INVALID_PUBLIC_DOMAIN] } - One or more of the domain names in the certificate request is not valid. Typically, this is because a domain name in the request is not a valid top-level domain. Try to request a certificate again, correcting any spelling errors or typos that were in the failed request, and ensure that all domain names in the request are for valid top-level domains. For example, you cannot request a certificate for [example.invalidpublicdomain] because [invalidpublicdomain] is not a valid top-level domain.\n            \n             }\n        {-   {b  [OTHER] } - Typically, this failure occurs when there is a typographical error in one or more of the domain names in the certificate request. Try to request a certificate again, correcting any spelling errors or typos that were in the failed request. \n            \n             }\n        }\n  "];
  domain_validation_records: domain_validation_record list option
    [@ocaml.doc
      "An array of objects that describe the domain validation records of the certificate.\n"];
  subject_alternative_names: string list option
    [@ocaml.doc
      "An array of strings that specify the alternate domains ([example2.com]) and subdomains ([blog.example.com]) of the certificate.\n"];
  serial_number: string option
    [@ocaml.doc "The serial number of the certificate.\n"];
  status: certificate_status option
    [@ocaml.doc "The validation status of the certificate.\n"];
  domain_name: string option
    [@ocaml.doc "The domain name of the certificate.\n"];
  name: string option
    [@ocaml.doc "The name of the certificate ([my-certificate]).\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate.\n"]}
[@@ocaml.doc
  "Describes the full details of an Amazon Lightsail SSL/TLS certificate.\n\n  To get a summary of a certificate, use the [GetCertificates] action and omit [includeCertificateDetails] from your request. The response will include only the certificate Amazon Resource Name (ARN), certificate name, domain name, and tags.\n  \n   "]
type nonrec certificate_summary =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values for the resource. For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n"];
  certificate_detail: certificate option
    [@ocaml.doc "An object that describes a certificate in detail.\n"];
  domain_name: string option
    [@ocaml.doc "The domain name of the certificate.\n"];
  certificate_name: string option
    [@ocaml.doc "The name of the certificate.\n"];
  certificate_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate.\n"]}
[@@ocaml.doc "Describes an Amazon Lightsail SSL/TLS certificate.\n"]
type nonrec get_certificates_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "If [NextPageToken] is returned there are more results available. The value of [NextPageToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged.\n"];
  certificates: certificate_summary list option
    [@ocaml.doc "An object that describes certificates.\n"]}[@@ocaml.doc ""]
type nonrec get_certificates_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetCertificates] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  certificate_name: string option
    [@ocaml.doc
      "The name for the certificate for which to return information.\n\n When omitted, the response includes all of your certificates in the Amazon Web Services Region where the request is made.\n "];
  include_certificate_details: bool option
    [@ocaml.doc
      "Indicates whether to include detailed information about the certificates in the response.\n\n When omitted, the response includes only the certificate names, Amazon Resource Names (ARNs), domain names, and tags.\n "];
  certificate_statuses: certificate_status list option
    [@ocaml.doc
      "The status of the certificates for which to return information.\n\n For example, specify [ISSUED] to return only certificates with an [ISSUED] status.\n \n  When omitted, the response includes all of your certificates in the Amazon Web Services Region where the request is made, regardless of their current status.\n  "]}
[@@ocaml.doc ""]
type nonrec instance_platform =
  | Windows [@ocaml.doc ""]
  | LinuxUnix [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec app_category =
  | LfR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec bundle =
  {
  public_ipv4_address_count: int option
    [@ocaml.doc
      "An integer that indicates the public ipv4 address count included in the bundle, the value is either 0 or 1.\n"];
  supported_app_categories: app_category list option
    [@ocaml.doc
      "Virtual computer blueprints that are supported by a Lightsail for Research bundle.\n\n  This parameter only applies to Lightsail for Research resources.\n  \n   "];
  supported_platforms: instance_platform list option
    [@ocaml.doc
      "The operating system platform (Linux/Unix-based or Windows Server-based) that the bundle supports. You can only launch a [WINDOWS] bundle on a blueprint that supports the [WINDOWS] platform. [LINUX_UNIX] blueprints require a [LINUX_UNIX] bundle.\n"];
  transfer_per_month_in_gb: int option
    [@ocaml.doc "The data transfer rate per month in GB ([2000]).\n"];
  ram_size_in_gb: float option
    [@ocaml.doc "The amount of RAM in GB ([2.0]).\n"];
  power: int option
    [@ocaml.doc
      "A numeric value that represents the power of the bundle ([500]). You can use the bundle's power value in conjunction with a blueprint's minimum power value to determine whether the blueprint will run on the bundle. For example, you need a bundle with a power value of 500 or more to create an instance that uses a blueprint with a minimum power value of 500.\n"];
  name: string option
    [@ocaml.doc "A friendly name for the bundle ([Micro]).\n"];
  is_active: bool option
    [@ocaml.doc "A Boolean value indicating whether the bundle is active.\n"];
  instance_type: string option [@ocaml.doc "The instance type ([micro]).\n"];
  bundle_id: string option [@ocaml.doc "The bundle ID ([micro_x_x]).\n"];
  disk_size_in_gb: int option [@ocaml.doc "The size of the SSD ([30]).\n"];
  cpu_count: int option
    [@ocaml.doc "The number of vCPUs included in the bundle ([2]).\n"];
  price: float option
    [@ocaml.doc "The price in US dollars ([5.0]) of the bundle.\n"]}[@@ocaml.doc
                                                                    "Describes a bundle, which is a set of specs describing your virtual private server (or {i instance}).\n"]
type nonrec get_bundles_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetBundles] request and specify the next page token using the [pageToken] parameter.\n  "];
  bundles: bundle list option
    [@ocaml.doc
      "An array of key-value pairs that contains information about the available bundles.\n"]}
[@@ocaml.doc ""]
type nonrec get_bundles_request =
  {
  app_category: app_category option
    [@ocaml.doc
      "Returns a list of bundles that are specific to Lightsail for Research.\n\n  You must use this parameter to view Lightsail for Research bundles.\n  \n   "];
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetBundles] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  include_inactive: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to include inactive (unavailable) bundles in the response of your request.\n"]}
[@@ocaml.doc ""]
type nonrec account_level_bpa_sync_status =
  | Defaulted [@ocaml.doc ""]
  | NeverSynced [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | InSync [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec bpa_status_message =
  | Unknown [@ocaml.doc ""]
  | DEFAULTED_FOR_SLR_MISSING_ON_HOLD [@ocaml.doc ""]
  | SYNC_ON_HOLD [@ocaml.doc ""]
  | DEFAULTED_FOR_SLR_MISSING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec account_level_bpa_sync =
  {
  bpa_impacts_lightsail: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether account-level block public access is affecting your Lightsail buckets.\n"];
  message: bpa_status_message option
    [@ocaml.doc
      "A message that provides a reason for a [Failed] or [Defaulted] synchronization status.\n\n The following messages are possible:\n \n  {ul\n        {-   [SYNC_ON_HOLD] - The synchronization has not yet happened. This status message occurs immediately after you create your first Lightsail bucket. This status message should change after the first synchronization happens, approximately 1 hour after the first bucket is created.\n            \n             }\n        {-   [DEFAULTED_FOR_SLR_MISSING] - The synchronization failed because the required service-linked role is missing from your Amazon Web Services account. The account-level BPA configuration for your Lightsail buckets is defaulted to {i active} until the synchronization can occur. This means that all your buckets are private and not publicly accessible. For more information about how to create the required service-linked role to allow synchronization, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-using-service-linked-roles}Using Service-Linked Roles for Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n            \n             }\n        {-   [DEFAULTED_FOR_SLR_MISSING_ON_HOLD] - The synchronization failed because the required service-linked role is missing from your Amazon Web Services account. Account-level BPA is not yet configured for your Lightsail buckets. Therefore, only the bucket access permissions and individual object access permissions apply to your Lightsail buckets. For more information about how to create the required service-linked role to allow synchronization, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-using-service-linked-roles}Using Service-Linked Roles for Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n            \n             }\n        {-   [Unknown] - The reason that synchronization failed is unknown. Contact Amazon Web ServicesSupport for more information.\n            \n             }\n        }\n  "];
  last_synced_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp of when the account-level BPA configuration was last synchronized. This value is null when the account-level BPA configuration has not been synchronized.\n"];
  status: account_level_bpa_sync_status option
    [@ocaml.doc
      "The status of the account-level BPA synchronization.\n\n The following statuses are possible:\n \n  {ul\n        {-   [InSync] - Account-level BPA is synchronized. The Amazon S3 account-level BPA configuration applies to your Lightsail buckets.\n            \n             }\n        {-   [NeverSynced] - Synchronization has not yet happened. The Amazon S3 account-level BPA configuration does not apply to your Lightsail buckets.\n            \n             }\n        {-   [Failed] - Synchronization failed. The Amazon S3 account-level BPA configuration does not apply to your Lightsail buckets.\n            \n             }\n        {-   [Defaulted] - Synchronization failed and account-level BPA for your Lightsail buckets is defaulted to {i active}.\n            \n             }\n        }\n    You might need to complete further actions if the status is [Failed] or [Defaulted]. The [message] parameter provides more information for those statuses.\n    \n     "]}
[@@ocaml.doc
  "Describes the synchronization status of the Amazon Simple Storage Service (Amazon S3) account-level block public access (BPA) feature for your Lightsail buckets.\n\n The account-level BPA feature of Amazon S3 provides centralized controls to limit public access to all Amazon S3 buckets in an account. BPA can make all Amazon S3 buckets in an Amazon Web Services account private regardless of the individual bucket and object permissions that are configured. Lightsail buckets take into account the Amazon S3 account-level BPA configuration when allowing or denying public access. To do this, Lightsail periodically fetches the account-level BPA configuration from Amazon S3. When the account-level BPA status is [InSync], the Amazon S3 account-level BPA configuration is synchronized and it applies to your Lightsail buckets. For more information about Amazon Simple Storage Service account-level BPA and how it affects Lightsail buckets, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-block-public-access-for-buckets}Block public access for buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
type nonrec get_buckets_result =
  {
  account_level_bpa_sync: account_level_bpa_sync option
    [@ocaml.doc
      "An object that describes the synchronization status of the Amazon S3 account-level block public access feature for your Lightsail buckets.\n\n For more information about this feature and how it affects Lightsail buckets, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-block-public-access-for-buckets}Block public access for buckets in Amazon Lightsail}.\n "];
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetBuckets] request and specify the next page token using the [pageToken] parameter.\n  "];
  buckets: bucket list option
    [@ocaml.doc "An array of objects that describe buckets.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_buckets_request =
  {
  include_connected_resources: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to include Lightsail instances that were given access to the bucket using the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html}SetResourceAccessForBucket} action.\n"];
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetBuckets] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  bucket_name: string option
    [@ocaml.doc
      "The name of the bucket for which to return information.\n\n When omitted, the response includes all of your buckets in the Amazon Web Services Region where the request is made.\n "]}
[@@ocaml.doc ""]
type nonrec bucket_metric_name =
  | NumberOfObjects [@ocaml.doc ""]
  | BucketSizeBytes [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_bucket_metric_data_result =
  {
  metric_data: metric_datapoint list option
    [@ocaml.doc
      "An array of objects that describe the metric data returned.\n"];
  metric_name: bucket_metric_name option
    [@ocaml.doc "The name of the metric returned.\n"]}[@@ocaml.doc ""]
type nonrec get_bucket_metric_data_request =
  {
  unit_: metric_unit
    [@ocaml.doc
      "The unit for the metric data request.\n\n Valid units depend on the metric data being requested. For the valid units with each available metric, see the [metricName] parameter.\n "];
  statistics: metric_statistic list
    [@ocaml.doc
      "The statistic for the metric.\n\n The following statistics are available:\n \n  {ul\n        {-   [Minimum] - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.\n            \n             }\n        {-   [Maximum] - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.\n            \n             }\n        {-   [Sum] - The sum of all values submitted for the matching metric. You can use this statistic to determine the total volume of a metric.\n            \n             }\n        {-   [Average] - The value of [Sum] / [SampleCount] during the specified period. By comparing this statistic with the [Minimum] and [Maximum] values, you can determine the full scope of a metric and how close the average use is to the [Minimum] and [Maximum] values. This comparison helps you to know when to increase or decrease your resources.\n            \n             }\n        {-   [SampleCount] - The count, or number, of data points used for the statistical calculation.\n            \n             }\n        }\n  "];
  period: int
    [@ocaml.doc
      "The granularity, in seconds, of the returned data points.\n\n  Bucket storage metrics are reported once per day. Therefore, you should specify a period of 86400 seconds, which is the number of seconds in a day.\n  \n   "];
  end_time: CoreTypes.Timestamp.t
    [@ocaml.doc "The timestamp indicating the latest data to be returned.\n"];
  start_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The timestamp indicating the earliest data to be returned.\n"];
  metric_name: bucket_metric_name
    [@ocaml.doc
      "The metric for which you want to return information.\n\n Valid bucket metric names are listed below, along with the most useful statistics to include in your request, and the published unit value.\n \n   These bucket metrics are reported once per day.\n   \n     {ul\n           {-   {b  [BucketSizeBytes] } - The amount of data in bytes stored in a bucket. This value is calculated by summing the size of all objects in the bucket (including object versions), including the size of all parts for all incomplete multipart uploads to the bucket.\n               \n                Statistics: The most useful statistic is [Maximum].\n                \n                 Unit: The published unit is [Bytes].\n                 \n                  }\n           {-   {b  [NumberOfObjects] } - The total number of objects stored in a bucket. This value is calculated by counting all objects in the bucket (including object versions) and the total number of parts for all incomplete multipart uploads to the bucket.\n               \n                Statistics: The most useful statistic is [Average].\n                \n                 Unit: The published unit is [Count].\n                 \n                  }\n           }\n  "];
  bucket_name: string
    [@ocaml.doc "The name of the bucket for which to get metric data.\n"]}
[@@ocaml.doc ""]
type nonrec bucket_bundle =
  {
  is_active: bool option
    [@ocaml.doc
      "Indicates whether the bundle is active. Use for a new or existing bucket.\n"];
  transfer_per_month_in_gb: int option
    [@ocaml.doc "The monthly network transfer quota of the bundle.\n"];
  storage_per_month_in_gb: int option
    [@ocaml.doc "The storage size of the bundle, in GB.\n"];
  price: float option
    [@ocaml.doc "The monthly price of the bundle, in US dollars.\n"];
  name: string option [@ocaml.doc "The name of the bundle.\n"];
  bundle_id: string option [@ocaml.doc "The ID of the bundle.\n"]}[@@ocaml.doc
                                                                    "Describes the specifications of a bundle that can be applied to an Amazon Lightsail bucket.\n\n A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket.\n "]
type nonrec get_bucket_bundles_result =
  {
  bundles: bucket_bundle list option
    [@ocaml.doc "An object that describes bucket bundles.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec get_bucket_bundles_request =
  {
  include_inactive: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to include inactive (unavailable) bundles in the response of your request.\n"]}
[@@ocaml.doc ""]
type nonrec access_key_last_used =
  {
  service_name: string option
    [@ocaml.doc
      "The name of the Amazon Web Services service with which this access key was most recently used.\n\n This value is [N/A] if the access key has not been used.\n "];
  region: string option
    [@ocaml.doc
      "The Amazon Web Services Region where this access key was most recently used.\n\n This value is [N/A] if the access key has not been used.\n "];
  last_used_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when the access key was most recently used.\n\n This value is null if the access key has not been used.\n "]}
[@@ocaml.doc
  "Describes the last time an access key was used.\n\n  This object does not include data in the response of a {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action.\n  \n   "]
type nonrec access_key =
  {
  last_used: access_key_last_used option
    [@ocaml.doc
      "An object that describes the last time the access key was used.\n\n  This object does not include data in the response of a {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action. If the access key has not been used, the [region] and [serviceName] values are [N/A], and the [lastUsedDate] value is null.\n  \n   "];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the access key was created.\n"];
  status: status_type option
    [@ocaml.doc
      "The status of the access key.\n\n A status of [Active] means that the key is valid, while [Inactive] means it is not.\n "];
  secret_access_key: string option
    [@ocaml.doc
      "The secret access key used to sign requests.\n\n You should store the secret access key in a safe location. We recommend that you delete the access key if the secret access key is compromised.\n "];
  access_key_id: string option [@ocaml.doc "The ID of the access key.\n"]}
[@@ocaml.doc
  "Describes an access key for an Amazon Lightsail bucket.\n\n Access keys grant full programmatic access to the specified bucket and its objects. You can have a maximum of two access keys per bucket. Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action to create an access key for a specific bucket. For more information about access keys, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n \n   The [secretAccessKey] value is returned only in response to the [CreateBucketAccessKey] action. You can get a secret access key only when you first create an access key; you cannot get the secret access key later. If you lose the secret access key, you must create a new access key.\n   \n    "]
type nonrec get_bucket_access_keys_result =
  {
  access_keys: access_key list option
    [@ocaml.doc
      "An object that describes the access keys for the specified bucket.\n"]}
[@@ocaml.doc ""]
type nonrec get_bucket_access_keys_request =
  {
  bucket_name: string
    [@ocaml.doc "The name of the bucket for which to return access keys.\n"]}
[@@ocaml.doc ""]
type nonrec blueprint_type =
  | App [@ocaml.doc ""]
  | Os [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec blueprint =
  {
  app_category: app_category option
    [@ocaml.doc
      "Virtual computer blueprints that are supported by Lightsail for Research.\n\n  This parameter only applies to Lightsail for Research resources.\n  \n   "];
  platform: instance_platform option
    [@ocaml.doc
      "The operating system platform (either Linux/Unix-based or Windows Server-based) of the blueprint.\n"];
  license_url: string option
    [@ocaml.doc
      "The end-user license agreement URL for the image or blueprint.\n"];
  product_url: string option
    [@ocaml.doc
      "The product URL to learn more about the image or blueprint.\n"];
  version_code: string option [@ocaml.doc "The version code.\n"];
  version: string option
    [@ocaml.doc
      "The version number of the operating system, application, or stack ( [2016.03.0]).\n"];
  min_power: int option
    [@ocaml.doc
      "The minimum bundle power required to run this blueprint. For example, you need a bundle with a power value of 500 or more to create an instance that uses a blueprint with a minimum power value of 500. [0] indicates that the blueprint runs on all instance sizes. \n"];
  is_active: bool option
    [@ocaml.doc
      "A Boolean value indicating whether the blueprint is active. Inactive blueprints are listed to support customers with existing instances but are not necessarily available for launch of new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.\n"];
  description: string option
    [@ocaml.doc "The description of the blueprint.\n"];
  type_: blueprint_type option
    [@ocaml.doc "The type of the blueprint ([os] or [app]).\n"];
  group: string option
    [@ocaml.doc "The group name of the blueprint ([amazon-linux]).\n"];
  name: string option
    [@ocaml.doc "The friendly name of the blueprint ([Amazon Linux]).\n"];
  blueprint_id: string option
    [@ocaml.doc
      "The ID for the virtual private server image ([app_wordpress_x_x] or [app_lamp_x_x]).\n"]}
[@@ocaml.doc "Describes a blueprint (a virtual private server image).\n"]
type nonrec get_blueprints_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetBlueprints] request and specify the next page token using the [pageToken] parameter.\n  "];
  blueprints: blueprint list option
    [@ocaml.doc
      "An array of key-value pairs that contains information about the available blueprints.\n"]}
[@@ocaml.doc ""]
type nonrec get_blueprints_request =
  {
  app_category: app_category option
    [@ocaml.doc
      "Returns a list of blueprints that are specific to Lightsail for Research.\n\n  You must use this parameter to view Lightsail for Research blueprints.\n  \n   "];
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetBlueprints] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  include_inactive: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to include inactive (unavailable) blueprints in the response of your request.\n"]}
[@@ocaml.doc ""]
type nonrec auto_snapshot_status =
  | NOT_FOUND [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attached_disk =
  {
  size_in_gb: int option [@ocaml.doc "The size of the disk in GB.\n"];
  path: string option [@ocaml.doc "The path of the disk ([/dev/xvdf]).\n"]}
[@@ocaml.doc
  "Describes a block storage disk that is attached to an instance, and is included in an automatic snapshot.\n"]
type nonrec auto_snapshot_details =
  {
  from_attached_disks: attached_disk list option
    [@ocaml.doc
      "An array of objects that describe the block storage disks attached to the instance when the automatic snapshot was created.\n"];
  status: auto_snapshot_status option
    [@ocaml.doc "The status of the automatic snapshot.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the automatic snapshot was created.\n"];
  date: string option
    [@ocaml.doc
      "The date of the automatic snapshot in [YYYY-MM-DD] format.\n"]}
[@@ocaml.doc "Describes an automatic snapshot.\n"]
type nonrec get_auto_snapshots_result =
  {
  auto_snapshots: auto_snapshot_details list option
    [@ocaml.doc
      "An array of objects that describe the automatic snapshots that are available for the specified source instance or disk.\n"];
  resource_type: resource_type option
    [@ocaml.doc
      "The resource type of the automatic snapshot. The possible values are [Instance], and [Disk].\n"];
  resource_name: string option
    [@ocaml.doc
      "The name of the source instance or disk for the automatic snapshots.\n"]}
[@@ocaml.doc ""]
type nonrec get_auto_snapshots_request =
  {
  resource_name: string
    [@ocaml.doc
      "The name of the source instance or disk from which to get automatic snapshot information.\n"]}
[@@ocaml.doc ""]
type nonrec alarm =
  {
  notification_enabled: bool option
    [@ocaml.doc "Indicates whether the alarm is enabled.\n"];
  notification_triggers: alarm_state list option
    [@ocaml.doc "The alarm states that trigger a notification.\n"];
  contact_protocols: contact_protocol list option
    [@ocaml.doc
      "The contact protocols for the alarm, such as [Email], [SMS] (text messaging), or both.\n"];
  unit_: metric_unit option
    [@ocaml.doc "The unit of the metric associated with the alarm.\n"];
  state: alarm_state option
    [@ocaml.doc
      "The current state of the alarm.\n\n An alarm has the following possible states:\n \n  {ul\n        {-   [ALARM] - The metric is outside of the defined threshold.\n            \n             }\n        {-   [INSUFFICIENT_DATA] - The alarm has just started, the metric is not available, or not enough data is available for the metric to determine the alarm state.\n            \n             }\n        {-   [OK] - The metric is within the defined threshold.\n            \n             }\n        }\n  "];
  metric_name: metric_name option
    [@ocaml.doc "The name of the metric associated with the alarm.\n"];
  statistic: metric_statistic option
    [@ocaml.doc
      "The statistic for the metric associated with the alarm.\n\n The following statistics are available:\n \n  {ul\n        {-   [Minimum] - The lowest value observed during the specified period. Use this value to determine low volumes of activity for your application.\n            \n             }\n        {-   [Maximum] - The highest value observed during the specified period. Use this value to determine high volumes of activity for your application.\n            \n             }\n        {-   [Sum] - All values submitted for the matching metric added together. You can use this statistic to determine the total volume of a metric.\n            \n             }\n        {-   [Average] - The value of Sum / SampleCount during the specified period. By comparing this statistic with the Minimum and Maximum values, you can determine the full scope of a metric and how close the average use is to the Minimum and Maximum values. This comparison helps you to know when to increase or decrease your resources.\n            \n             }\n        {-   [SampleCount] - The count, or number, of data points used for the statistical calculation.\n            \n             }\n        }\n  "];
  treat_missing_data: treat_missing_data option
    [@ocaml.doc
      "Specifies how the alarm handles missing data points.\n\n An alarm can treat missing data in the following ways:\n \n  {ul\n        {-   [breaching] - Assume the missing data is not within the threshold. Missing data counts towards the number of times the metric is not within the threshold.\n            \n             }\n        {-   [notBreaching] - Assume the missing data is within the threshold. Missing data does not count towards the number of times the metric is not within the threshold.\n            \n             }\n        {-   [ignore] - Ignore the missing data. Maintains the current alarm state.\n            \n             }\n        {-   [missing] - Missing data is treated as missing.\n            \n             }\n        }\n  "];
  datapoints_to_alarm: int option
    [@ocaml.doc
      "The number of data points that must not within the specified threshold to trigger the alarm.\n"];
  threshold: float option
    [@ocaml.doc
      "The value against which the specified statistic is compared.\n"];
  period: int option
    [@ocaml.doc
      "The period, in seconds, over which the statistic is applied.\n"];
  evaluation_periods: int option
    [@ocaml.doc
      "The number of periods over which data is compared to the specified threshold.\n"];
  comparison_operator: comparison_operator option
    [@ocaml.doc
      "The arithmetic operation used when comparing the specified statistic and threshold.\n"];
  monitored_resource_info: monitored_resource_info option
    [@ocaml.doc
      "An object that lists information about the resource monitored by the alarm.\n"];
  support_code: string option
    [@ocaml.doc
      "The support code. Include this code in your email to support when you have questions about your Lightsail alarm. This code enables our support team to look up your Lightsail information more easily.\n"];
  resource_type: resource_type option
    [@ocaml.doc "The Lightsail resource type of the alarm.\n"];
  location: resource_location option
    [@ocaml.doc
      "An object that lists information about the location of the alarm.\n"];
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the alarm was created.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm.\n"];
  name: string option [@ocaml.doc "The name of the alarm.\n"]}[@@ocaml.doc
                                                                "Describes an alarm.\n\n An alarm is a way to monitor your Lightsail resource metrics. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n "]
type nonrec get_alarms_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetAlarms] request and specify the next page token using the [pageToken] parameter.\n  "];
  alarms: alarm list option
    [@ocaml.doc "An array of objects that describe the alarms.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_alarms_request =
  {
  monitored_resource_name: string option
    [@ocaml.doc
      "The name of the Lightsail resource being monitored by the alarm.\n\n Specify a monitored resource name to return information about all alarms for a specific resource.\n "];
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetAlarms] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "];
  alarm_name: string option
    [@ocaml.doc
      "The name of the alarm.\n\n Specify an alarm name to return information about a specific alarm.\n "]}
[@@ocaml.doc ""]
type nonrec get_active_names_result =
  {
  next_page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n A next page token is not returned if there are no more results to display.\n \n  To get the next page of results, perform another [GetActiveNames] request and specify the next page token using the [pageToken] parameter.\n  "];
  active_names: string list option
    [@ocaml.doc
      "The list of active names returned by the get active names request.\n"]}
[@@ocaml.doc ""]
type nonrec get_active_names_request =
  {
  page_token: string option
    [@ocaml.doc
      "The token to advance to the next page of results from your request.\n\n To get a page token, perform an initial [GetActiveNames] request. If your results are paginated, the response will return a next page token that you can specify as the page token in a subsequent request.\n "]}
[@@ocaml.doc ""]
type nonrec export_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec export_snapshot_request =
  {
  source_snapshot_name: string
    [@ocaml.doc
      "The name of the instance or disk snapshot to be exported to Amazon EC2.\n"]}
[@@ocaml.doc ""]
type nonrec enable_add_on_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec add_on_type =
  | StopInstanceOnIdle [@ocaml.doc ""]
  | AutoSnapshot [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec auto_snapshot_add_on_request =
  {
  snapshot_time_of_day: string option
    [@ocaml.doc
      "The daily time when an automatic snapshot will be created.\n\n Constraints:\n \n  {ul\n        {-  Must be in [HH:00] format, and in an hourly increment.\n            \n             }\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  The snapshot will be automatically created between the time specified and up to 45 minutes after.\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Describes a request to enable or modify the automatic snapshot add-on for an Amazon Lightsail instance or disk.\n\n When you modify the automatic snapshot time for a resource, it is typically effective immediately except under the following conditions:\n \n  {ul\n        {-  If an automatic snapshot has been created for the current day, and you change the snapshot time to a later time of day, then the new snapshot time will be effective the following day. This ensures that two snapshots are not created for the current day.\n            \n             }\n        {-  If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to an earlier time of day, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day.\n            \n             }\n        {-  If an automatic snapshot has not yet been created for the current day, and you change the snapshot time to a time that is within 30 minutes from your current time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.\n            \n             }\n        {-  If an automatic snapshot is scheduled to be created within 30 minutes from your current time and you change the snapshot time, then the new snapshot time will be effective the following day and a snapshot is automatically created at the previously set time for the current day. This ensures that a snapshot is created for the current day, because 30 minutes is required between your current time and the new snapshot time that you specify.\n            \n             }\n        }\n  "]
type nonrec add_on_request =
  {
  stop_instance_on_idle_request: stop_instance_on_idle_request option
    [@ocaml.doc
      "An object that represents additional parameters when enabling or modifying the [StopInstanceOnIdle] add-on.\n\n  This object only applies to Lightsail for Research resources.\n  \n   "];
  auto_snapshot_add_on_request: auto_snapshot_add_on_request option
    [@ocaml.doc
      "An object that represents additional parameters when enabling or modifying the automatic snapshot add-on.\n"];
  add_on_type: add_on_type [@ocaml.doc "The add-on type.\n"]}[@@ocaml.doc
                                                               "Describes a request to enable, modify, or disable an add-on for an Amazon Lightsail resource.\n\n  An additional cost may be associated with enabling add-ons. For more information, see the {{:https://aws.amazon.com/lightsail/pricing/}Lightsail pricing page}.\n  \n   "]
type nonrec enable_add_on_request =
  {
  add_on_request: add_on_request
    [@ocaml.doc
      "An array of strings representing the add-on to enable or modify.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the source resource for which to enable or modify the add-on.\n"]}
[@@ocaml.doc ""]
type nonrec download_default_key_pair_result =
  {
  created_at: CoreTypes.Timestamp.t option
    [@ocaml.doc "The timestamp when the default key pair was created.\n"];
  private_key_base64: string option
    [@ocaml.doc "A base64-encoded RSA private key.\n"];
  public_key_base64: string option
    [@ocaml.doc "A base64-encoded public key of the [ssh-rsa] type.\n"]}
[@@ocaml.doc ""]
type nonrec disable_add_on_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec disable_add_on_request =
  {
  resource_name: string
    [@ocaml.doc
      "The name of the source resource for which to disable the add-on.\n"];
  add_on_type: add_on_type [@ocaml.doc "The add-on type to disable.\n"]}
[@@ocaml.doc ""]
type nonrec detach_static_ip_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec detach_static_ip_request =
  {
  static_ip_name: string
    [@ocaml.doc "The name of the static IP to detach from the instance.\n"]}
[@@ocaml.doc ""]
type nonrec detach_instances_from_load_balancer_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec detach_instances_from_load_balancer_request =
  {
  instance_names: string list
    [@ocaml.doc
      "An array of strings containing the names of the instances you want to detach from the load balancer.\n"];
  load_balancer_name: string
    [@ocaml.doc "The name of the Lightsail load balancer.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec detach_disk_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec detach_disk_request =
  {
  disk_name: string
    [@ocaml.doc
      "The unique name of the disk you want to detach from your instance ([my-disk]).\n"]}
[@@ocaml.doc ""]
type nonrec detach_certificate_from_distribution_result =
  {
  operation: operation option
    [@ocaml.doc
      "An object that describes the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec detach_certificate_from_distribution_request =
  {
  distribution_name: string
    [@ocaml.doc
      "The name of the distribution from which to detach the certificate.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec delete_relational_database_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_relational_database_snapshot_request =
  {
  relational_database_snapshot_name: string
    [@ocaml.doc "The name of the database snapshot that you are deleting.\n"]}
[@@ocaml.doc ""]
type nonrec delete_relational_database_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_relational_database_request =
  {
  final_relational_database_snapshot_name: string option
    [@ocaml.doc
      "The name of the database snapshot created if [skip final snapshot] is [false], which is the default value for that parameter.\n\n  Specifying this parameter and also specifying the [skip final snapshot] parameter to [true] results in an error.\n  \n    Constraints:\n    \n     {ul\n           {-  Must contain from 2 to 255 alphanumeric characters, or hyphens.\n               \n                }\n           {-  The first and last character must be a letter or number.\n               \n                }\n           }\n  "];
  skip_final_snapshot: bool option
    [@ocaml.doc
      "Determines whether a final database snapshot is created before your database is deleted. If [true] is specified, no database snapshot is created. If [false] is specified, a database snapshot is created before your database is deleted.\n\n You must specify the [final relational database snapshot name] parameter if the [skip final snapshot] parameter is [false].\n \n  Default: [false] \n  "];
  relational_database_name: string
    [@ocaml.doc "The name of the database that you are deleting.\n"]}
[@@ocaml.doc ""]
type nonrec delete_load_balancer_tls_certificate_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_load_balancer_tls_certificate_request =
  {
  force: bool option
    [@ocaml.doc
      "When [true], forces the deletion of an SSL/TLS certificate.\n\n There can be two certificates associated with a Lightsail load balancer: the primary and the backup. The [force] parameter is required when the primary SSL/TLS certificate is in use by an instance attached to the load balancer.\n "];
  certificate_name: string [@ocaml.doc "The SSL/TLS certificate name.\n"];
  load_balancer_name: string [@ocaml.doc "The load balancer name.\n"]}
[@@ocaml.doc ""]
type nonrec delete_load_balancer_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_load_balancer_request =
  {
  load_balancer_name: string
    [@ocaml.doc "The name of the load balancer you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_known_host_keys_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_known_host_keys_request =
  {
  instance_name: string
    [@ocaml.doc
      "The name of the instance for which you want to reset the host key or certificate.\n"]}
[@@ocaml.doc ""]
type nonrec delete_key_pair_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_key_pair_request =
  {
  expected_fingerprint: string option
    [@ocaml.doc
      "The RSA fingerprint of the Lightsail default key pair to delete.\n\n  The [expectedFingerprint] parameter is required only when specifying to delete a Lightsail default key pair.\n  \n   "];
  key_pair_name: string [@ocaml.doc "The name of the key pair to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_instance_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_instance_snapshot_request =
  {
  instance_snapshot_name: string
    [@ocaml.doc "The name of the snapshot to delete.\n"]}[@@ocaml.doc ""]
type nonrec delete_instance_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_instance_request =
  {
  force_delete_add_ons: bool option
    [@ocaml.doc
      "A Boolean value to indicate whether to delete all add-ons for the instance.\n"];
  instance_name: string [@ocaml.doc "The name of the instance to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_domain_entry_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_domain_entry_request =
  {
  domain_entry: domain_entry
    [@ocaml.doc
      "An array of key-value pairs containing information about your domain entries.\n"];
  domain_name: string
    [@ocaml.doc "The name of the domain entry to delete.\n"]}[@@ocaml.doc ""]
type nonrec delete_domain_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_domain_request =
  {
  domain_name: string [@ocaml.doc "The specific domain name to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_distribution_result =
  {
  operation: operation option
    [@ocaml.doc
      "An object that describes the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_distribution_request =
  {
  distribution_name: string option
    [@ocaml.doc
      "The name of the distribution to delete.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec delete_disk_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_disk_snapshot_request =
  {
  disk_snapshot_name: string
    [@ocaml.doc
      "The name of the disk snapshot you want to delete ([my-disk-snapshot]).\n"]}
[@@ocaml.doc ""]
type nonrec delete_disk_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_disk_request =
  {
  force_delete_add_ons: bool option
    [@ocaml.doc
      "A Boolean value to indicate whether to delete all add-ons for the disk.\n"];
  disk_name: string
    [@ocaml.doc
      "The unique name of the disk you want to delete ([my-disk]).\n"]}
[@@ocaml.doc ""]
type nonrec delete_container_service_request =
  {
  service_name: string
    [@ocaml.doc "The name of the container service to delete.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_container_image_request =
  {
  image: string
    [@ocaml.doc
      "The name of the container image to delete from the container service.\n\n Use the [GetContainerImages] action to get the name of the container images that are registered to a container service.\n \n   Container images sourced from your Lightsail container service, that are registered and stored on your service, start with a colon ([:]). For example, [:container-service-1.mystaticwebsite.1]. Container images sourced from a public registry like Docker Hub don't start with a colon. For example, [nginx:latest] or [nginx].\n   \n    "];
  service_name: string
    [@ocaml.doc
      "The name of the container service for which to delete a registered container image.\n"]}
[@@ocaml.doc ""]
type nonrec delete_contact_method_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_contact_method_request =
  {
  protocol: contact_protocol
    [@ocaml.doc
      "The protocol that will be deleted, such as [Email] or [SMS] (text messaging).\n\n  To delete an [Email] and an [SMS] contact method if you added both, you must run separate [DeleteContactMethod] actions to delete each protocol.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec delete_certificate_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_certificate_request =
  {
  certificate_name: string
    [@ocaml.doc
      "The name of the certificate to delete.\n\n Use the [GetCertificates] action to get a list of certificate names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec delete_bucket_access_key_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_bucket_access_key_request =
  {
  access_key_id: string
    [@ocaml.doc
      "The ID of the access key to delete.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketAccessKeys.html}GetBucketAccessKeys} action to get a list of access key IDs that you can specify.\n "];
  bucket_name: string
    [@ocaml.doc "The name of the bucket that the access key belongs to.\n"]}
[@@ocaml.doc ""]
type nonrec delete_bucket_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_bucket_request =
  {
  force_delete: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to force delete the bucket.\n\n You must force delete the bucket if it has one of the following conditions:\n \n  {ul\n        {-  The bucket is the origin of a distribution.\n            \n             }\n        {-  The bucket has instances that were granted access to it using the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_SetResourceAccessForBucket.html}SetResourceAccessForBucket} action.\n            \n             }\n        {-  The bucket has objects.\n            \n             }\n        {-  The bucket has access keys.\n            \n             }\n        }\n    Force deleting a bucket might impact other resources that rely on the bucket, such as instances, distributions, or software that use the issued access keys.\n    \n     "];
  bucket_name: string
    [@ocaml.doc
      "The name of the bucket to delete.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBuckets.html}GetBuckets} action to get a list of bucket names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec delete_auto_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_auto_snapshot_request =
  {
  date: string
    [@ocaml.doc
      "The date of the automatic snapshot to delete in [YYYY-MM-DD] format. Use the [get auto snapshots] operation to get the available automatic snapshots for a resource.\n"];
  resource_name: string
    [@ocaml.doc
      "The name of the source instance or disk from which to delete the automatic snapshot.\n"]}
[@@ocaml.doc ""]
type nonrec delete_alarm_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_alarm_request =
  {
  alarm_name: string [@ocaml.doc "The name of the alarm to delete.\n"]}
[@@ocaml.doc ""]
type nonrec create_relational_database_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_relational_database_snapshot_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  relational_database_snapshot_name: string
    [@ocaml.doc
      "The name for your new database snapshot.\n\n Constraints:\n \n  {ul\n        {-  Must contain from 2 to 255 alphanumeric characters, or hyphens.\n            \n             }\n        {-  The first and last character must be a letter or number.\n            \n             }\n        }\n  "];
  relational_database_name: string
    [@ocaml.doc
      "The name of the database on which to base your new snapshot.\n"]}
[@@ocaml.doc ""]
type nonrec create_relational_database_from_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_relational_database_from_snapshot_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  use_latest_restorable_time: bool option
    [@ocaml.doc
      "Specifies whether your database is restored from the latest backup time. A value of [true] restores from the latest backup time. \n\n Default: [false] \n \n  Constraints: Cannot be specified if the [restore time] parameter is provided.\n  "];
  restore_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time to restore your database from.\n\n Constraints:\n \n  {ul\n        {-  Must be before the latest restorable time for the database.\n            \n             }\n        {-  Cannot be specified if the [use latest restorable time] parameter is [true].\n            \n             }\n        {-  Specified in Coordinated Universal Time (UTC).\n            \n             }\n        {-  Specified in the Unix time format.\n            \n             For example, if you wish to use a restore time of October 1, 2018, at 8 PM UTC, then you input [1538424000] as the restore time.\n             \n              }\n        }\n  "];
  source_relational_database_name: string option
    [@ocaml.doc "The name of the source database.\n"];
  relational_database_bundle_id: string option
    [@ocaml.doc
      "The bundle ID for your new database. A bundle describes the performance specifications for your database.\n\n You can get a list of database bundle IDs by using the [get relational database\n        bundles] operation.\n \n  When creating a new database from a snapshot, you cannot choose a bundle that is smaller than the bundle of the source database.\n  "];
  relational_database_snapshot_name: string option
    [@ocaml.doc
      "The name of the database snapshot from which to create your new database.\n"];
  publicly_accessible: bool option
    [@ocaml.doc
      "Specifies the accessibility options for your new database. A value of [true] specifies a database that is available to resources outside of your Lightsail account. A value of [false] specifies a database that is available only to your Lightsail resources in the same region as your database.\n"];
  availability_zone: string option
    [@ocaml.doc
      "The Availability Zone in which to create your new database. Use the [us-east-2a] case-sensitive format.\n\n You can get a list of Availability Zones by using the [get regions] operation. Be sure to add the [include relational database Availability Zones] parameter to your request.\n "];
  relational_database_name: string
    [@ocaml.doc
      "The name to use for your new Lightsail database resource.\n\n Constraints:\n \n  {ul\n        {-  Must contain from 2 to 255 alphanumeric characters, or hyphens.\n            \n             }\n        {-  The first and last character must be a letter or number.\n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec create_relational_database_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_relational_database_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  publicly_accessible: bool option
    [@ocaml.doc
      "Specifies the accessibility options for your new database. A value of [true] specifies a database that is available to resources outside of your Lightsail account. A value of [false] specifies a database that is available only to your Lightsail resources in the same region as your database.\n"];
  preferred_maintenance_window: string option
    [@ocaml.doc
      "The weekly time range during which system maintenance can occur on your new database.\n\n The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region, occurring on a random day of the week.\n \n  Constraints:\n  \n   {ul\n         {-  Must be in the [ddd:hh24:mi-ddd:hh24:mi] format.\n             \n              }\n         {-  Valid days: Mon, Tue, Wed, Thu, Fri, Sat, Sun.\n             \n              }\n         {-  Must be at least 30 minutes.\n             \n              }\n         {-  Specified in Coordinated Universal Time (UTC).\n             \n              }\n         {-  Example: [Tue:17:00-Tue:17:30] \n             \n              }\n         }\n  "];
  preferred_backup_window: string option
    [@ocaml.doc
      "The daily time range during which automated backups are created for your new database if automated backups are enabled.\n\n The default is a 30-minute window selected at random from an 8-hour block of time for each AWS Region. For more information about the preferred backup window time blocks for each region, see the {{:https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_WorkingWithAutomatedBackups.html#USER_WorkingWithAutomatedBackups.BackupWindow}Working With Backups} guide in the Amazon Relational Database Service documentation.\n \n  Constraints:\n  \n   {ul\n         {-  Must be in the [hh24:mi-hh24:mi] format.\n             \n              Example: [16:00-16:30] \n              \n               }\n         {-  Specified in Coordinated Universal Time (UTC).\n             \n              }\n         {-  Must not conflict with the preferred maintenance window.\n             \n              }\n         {-  Must be at least 30 minutes.\n             \n              }\n         }\n  "];
  master_user_password: string option
    [@ocaml.doc
      "The password for the master user. The password can include any printable ASCII character except \"/\", \"\"\", or \"\\@\". It cannot contain spaces.\n\n  {b MySQL} \n \n  Constraints: Must contain from 8 to 41 characters.\n  \n    {b PostgreSQL} \n   \n    Constraints: Must contain from 8 to 128 characters.\n    "];
  master_username: string
    [@ocaml.doc
      "The name for the master user.\n\n  {b MySQL} \n \n  Constraints:\n  \n   {ul\n         {-  Required for MySQL.\n             \n              }\n         {-  Must be 1 to 16 letters or numbers. Can contain underscores.\n             \n              }\n         {-  First character must be a letter.\n             \n              }\n         {-  Can't be a reserved word for the chosen database engine.\n             \n              For more information about reserved words in MySQL 5.6 or 5.7, see the Keywords and Reserved Words articles for {{:https://dev.mysql.com/doc/refman/5.6/en/keywords.html}MySQL 5.6}, {{:https://dev.mysql.com/doc/refman/5.7/en/keywords.html}MySQL 5.7}, or {{:https://dev.mysql.com/doc/refman/8.0/en/keywords.html}MySQL 8.0}.\n              \n               }\n         }\n    {b PostgreSQL} \n   \n    Constraints:\n    \n     {ul\n           {-  Required for PostgreSQL.\n               \n                }\n           {-  Must be 1 to 63 letters or numbers. Can contain underscores.\n               \n                }\n           {-  First character must be a letter.\n               \n                }\n           {-  Can't be a reserved word for the chosen database engine.\n               \n                For more information about reserved words in MySQL 5.6 or 5.7, see the Keywords and Reserved Words articles for {{:https://www.postgresql.org/docs/9.6/sql-keywords-appendix.html}PostgreSQL 9.6}, {{:https://www.postgresql.org/docs/10/sql-keywords-appendix.html}PostgreSQL 10}, {{:https://www.postgresql.org/docs/11/sql-keywords-appendix.html}PostgreSQL 11}, and {{:https://www.postgresql.org/docs/12/sql-keywords-appendix.html}PostgreSQL 12}.\n                \n                 }\n           }\n  "];
  master_database_name: string
    [@ocaml.doc
      "The meaning of this parameter differs according to the database engine you use.\n\n  {b MySQL} \n \n  The name of the database to create when the Lightsail database resource is created. If this parameter isn't specified, no database is created in the database resource.\n  \n   Constraints:\n   \n    {ul\n          {-  Must contain 1 to 64 letters or numbers.\n              \n               }\n          {-  Must begin with a letter. Subsequent characters can be letters, underscores, or digits (0- 9).\n              \n               }\n          {-  Can't be a word reserved by the specified database engine.\n              \n               For more information about reserved words in MySQL, see the Keywords and Reserved Words articles for {{:https://dev.mysql.com/doc/refman/5.6/en/keywords.html}MySQL 5.6}, {{:https://dev.mysql.com/doc/refman/5.7/en/keywords.html}MySQL 5.7}, and {{:https://dev.mysql.com/doc/refman/8.0/en/keywords.html}MySQL 8.0}.\n               \n                }\n          }\n    {b PostgreSQL} \n   \n    The name of the database to create when the Lightsail database resource is created. If this parameter isn't specified, a database named [postgres] is created in the database resource.\n    \n     Constraints:\n     \n      {ul\n            {-  Must contain 1 to 63 letters or numbers.\n                \n                 }\n            {-  Must begin with a letter. Subsequent characters can be letters, underscores, or digits (0- 9).\n                \n                 }\n            {-  Can't be a word reserved by the specified database engine.\n                \n                 For more information about reserved words in PostgreSQL, see the SQL Key Words articles for {{:https://www.postgresql.org/docs/9.6/sql-keywords-appendix.html}PostgreSQL 9.6}, {{:https://www.postgresql.org/docs/10/sql-keywords-appendix.html}PostgreSQL 10}, {{:https://www.postgresql.org/docs/11/sql-keywords-appendix.html}PostgreSQL 11}, and {{:https://www.postgresql.org/docs/12/sql-keywords-appendix.html}PostgreSQL 12}.\n                 \n                  }\n            }\n  "];
  relational_database_bundle_id: string
    [@ocaml.doc
      "The bundle ID for your new database. A bundle describes the performance specifications for your database.\n\n You can get a list of database bundle IDs by using the [get relational database\n        bundles] operation.\n "];
  relational_database_blueprint_id: string
    [@ocaml.doc
      "The blueprint ID for your new database. A blueprint describes the major engine version of a database.\n\n You can get a list of database blueprints IDs by using the [get relational database\n        blueprints] operation.\n "];
  availability_zone: string option
    [@ocaml.doc
      "The Availability Zone in which to create your new database. Use the [us-east-2a] case-sensitive format.\n\n You can get a list of Availability Zones by using the [get regions] operation. Be sure to add the [include relational database Availability Zones] parameter to your request.\n "];
  relational_database_name: string
    [@ocaml.doc
      "The name to use for your new Lightsail database resource.\n\n Constraints:\n \n  {ul\n        {-  Must contain from 2 to 255 alphanumeric characters, or hyphens.\n            \n             }\n        {-  The first and last character must be a letter or number.\n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec create_load_balancer_tls_certificate_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_load_balancer_tls_certificate_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  certificate_alternative_names: string list option
    [@ocaml.doc
      "An array of strings listing alternative domains and subdomains for your SSL/TLS certificate. Lightsail will de-dupe the names for you. You can have a maximum of 9 alternative names (in addition to the 1 primary domain). We do not support wildcards ([*.example.com]).\n"];
  certificate_domain_name: string
    [@ocaml.doc
      "The domain name ([example.com]) for your SSL/TLS certificate.\n"];
  certificate_name: string
    [@ocaml.doc
      "The SSL/TLS certificate name.\n\n You can have up to 10 certificates in your account at one time. Each Lightsail load balancer can have up to 2 certificates associated with it at one time. There is also an overall limit to the number of certificates that can be issue in a 365-day period. For more information, see {{:http://docs.aws.amazon.com/acm/latest/userguide/acm-limits.html}Limits}.\n "];
  load_balancer_name: string
    [@ocaml.doc
      "The load balancer name where you want to create the SSL/TLS certificate.\n"]}
[@@ocaml.doc ""]
type nonrec create_load_balancer_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_load_balancer_request =
  {
  tls_policy_name: string option
    [@ocaml.doc
      "The name of the TLS policy to apply to the load balancer.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetLoadBalancerTlsPolicies.html}GetLoadBalancerTlsPolicies} action to get a list of TLS policy names that you can specify.\n \n  For more information about load balancer TLS policies, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configure-load-balancer-tls-security-policy}Configuring TLS security policies on your Amazon Lightsail load balancers} in the {i Amazon Lightsail Developer Guide}.\n  "];
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "The IP address type for the load balancer.\n\n The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and [dualstack] for IPv4 and IPv6.\n \n  The default value is [dualstack].\n  "];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  certificate_alternative_names: string list option
    [@ocaml.doc
      "The optional alternative domains and subdomains to use with your SSL/TLS certificate ([www.example.com], [example.com], [m.example.com], [blog.example.com]).\n"];
  certificate_domain_name: string option
    [@ocaml.doc
      "The domain name with which your certificate is associated ([example.com]).\n\n If you specify [certificateDomainName], then [certificateName] is required (and vice-versa).\n "];
  certificate_name: string option
    [@ocaml.doc
      "The name of the SSL/TLS certificate.\n\n If you specify [certificateName], then [certificateDomainName] is required (and vice-versa).\n "];
  health_check_path: string option
    [@ocaml.doc
      "The path you provided to perform the load balancer health check. If you didn't specify a health check path, Lightsail uses the root path of your website ([\"/\"]).\n\n You may want to specify a custom health check path other than the root of your application if your home page loads slowly or has a lot of media or scripting on it.\n "];
  instance_port: int
    [@ocaml.doc
      "The instance port where you're creating your load balancer.\n"];
  load_balancer_name: string [@ocaml.doc "The name of your load balancer.\n"]}
[@@ocaml.doc ""]
type nonrec create_key_pair_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"];
  private_key_base64: string option
    [@ocaml.doc "A base64-encoded RSA private key.\n"];
  public_key_base64: string option
    [@ocaml.doc "A base64-encoded public key of the [ssh-rsa] type.\n"];
  key_pair: key_pair option
    [@ocaml.doc
      "An array of key-value pairs containing information about the new key pair you just created.\n"]}
[@@ocaml.doc ""]
type nonrec create_key_pair_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  key_pair_name: string [@ocaml.doc "The name for your new key pair.\n"]}
[@@ocaml.doc ""]
type nonrec create_instance_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_instance_snapshot_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  instance_name: string
    [@ocaml.doc "The Lightsail instance on which to base your snapshot.\n"];
  instance_snapshot_name: string
    [@ocaml.doc "The name for your new snapshot.\n"]}[@@ocaml.doc ""]
type nonrec create_instances_from_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec disk_map =
  {
  new_disk_name: string option
    [@ocaml.doc "The new disk name ([my-new-disk]).\n"];
  original_disk_path: string option
    [@ocaml.doc
      "The original disk path exposed to the instance (for example, [/dev/sdh]).\n"]}
[@@ocaml.doc "Describes a block storage disk mapping.\n"]
type nonrec attached_disk_map = (string * disk_map list) list[@@ocaml.doc ""]
type nonrec create_instances_from_snapshot_request =
  {
  use_latest_restorable_auto_snapshot: bool option
    [@ocaml.doc
      "A Boolean value to indicate whether to use the latest available automatic snapshot.\n\n Constraints:\n \n  {ul\n        {-  This parameter cannot be defined together with the [restore date] parameter. The [use latest restorable auto snapshot] and [restore\n            date] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  restore_date: string option
    [@ocaml.doc
      "The date of the automatic snapshot to use for the new instance. Use the [get auto\n        snapshots] operation to identify the dates of the available automatic snapshots.\n\n Constraints:\n \n  {ul\n        {-  Must be specified in [YYYY-MM-DD] format.\n            \n             }\n        {-  This parameter cannot be defined together with the [use latest restorable auto\n            snapshot] parameter. The [restore date] and [use latest restorable\n            auto snapshot] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  source_instance_name: string option
    [@ocaml.doc
      "The name of the source instance from which the source automatic snapshot was created.\n\n Constraints:\n \n  {ul\n        {-  This parameter cannot be defined together with the [instance snapshot name] parameter. The [source instance name] and [instance snapshot name] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when creating a new instance from an automatic snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "The IP address type for the instance.\n\n The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and [dualstack] for IPv4 and IPv6.\n \n  The default value is [dualstack].\n  "];
  add_ons: add_on_request list option
    [@ocaml.doc
      "An array of objects representing the add-ons to enable for the new instance.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  key_pair_name: string option [@ocaml.doc "The name for your key pair.\n"];
  user_data: string option
    [@ocaml.doc
      "You can create a launch script that configures a server with additional user data. For example, [apt-get -y update].\n\n  Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use [yum], Debian and Ubuntu use [apt-get], and FreeBSD uses [pkg]. For a complete list, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/compare-options-choose-lightsail-instance-image}Amazon Lightsail Developer Guide}.\n  \n   "];
  bundle_id: string
    [@ocaml.doc
      "The bundle of specification information for your virtual private server (or {i instance}), including the pricing plan ([micro_x_x]).\n"];
  instance_snapshot_name: string option
    [@ocaml.doc
      "The name of the instance snapshot on which you are basing your new instances. Use the get instance snapshots operation to return information about your existing snapshots.\n\n Constraint:\n \n  {ul\n        {-  This parameter cannot be defined together with the [source instance name] parameter. The [instance snapshot name] and [source instance name] parameters are mutually exclusive.\n            \n             }\n        }\n  "];
  availability_zone: string
    [@ocaml.doc
      "The Availability Zone where you want to create your instances. Use the following formatting: [us-east-2a] (case sensitive). You can get a list of Availability Zones by using the {{:http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html}get regions} operation. Be sure to add the [include Availability Zones] parameter to your request.\n"];
  attached_disk_mapping: attached_disk_map option
    [@ocaml.doc
      "An object containing information about one or more disk mappings.\n"];
  instance_names: string list
    [@ocaml.doc "The names for your new instances.\n"]}[@@ocaml.doc ""]
type nonrec create_instances_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_instances_request =
  {
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "The IP address type for the instance.\n\n The possible values are [ipv4] for IPv4 only, [ipv6] for IPv6 only, and [dualstack] for IPv4 and IPv6.\n \n  The default value is [dualstack].\n  "];
  add_ons: add_on_request list option
    [@ocaml.doc
      "An array of objects representing the add-ons to enable for the new instance.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  key_pair_name: string option [@ocaml.doc "The name of your key pair.\n"];
  user_data: string option
    [@ocaml.doc
      "A launch script you can create that configures a server with additional user data. For example, you might want to run [apt-get -y update].\n\n  Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use [yum], Debian and Ubuntu use [apt-get], and FreeBSD uses [pkg]. For a complete list, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/compare-options-choose-lightsail-instance-image}Amazon Lightsail Developer Guide}.\n  \n   "];
  bundle_id: string
    [@ocaml.doc
      "The bundle of specification information for your virtual private server (or {i instance}), including the pricing plan ([medium_x_x]).\n"];
  blueprint_id: string
    [@ocaml.doc
      "The ID for a virtual private server image ([app_wordpress_x_x] or [app_lamp_x_x]). Use the [get blueprints] operation to return a list of available images (or {i blueprints}).\n\n  Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.\n  \n   "];
  custom_image_name: string option
    [@ocaml.doc
      "(Discontinued) The name for your custom image.\n\n  In releases prior to June 12, 2017, this parameter was ignored by the API. It is now discontinued.\n  \n   "];
  availability_zone: string
    [@ocaml.doc
      "The Availability Zone in which to create your instance. Use the following format: [us-east-2a] (case sensitive). You can get a list of Availability Zones by using the {{:http://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetRegions.html}get regions} operation. Be sure to add the [include Availability Zones] parameter to your request.\n"];
  instance_names: string list
    [@ocaml.doc
      "The names to use for your new Lightsail instances. Separate multiple values using quotation marks and commas, for example: [\\[\"MyFirstInstance\",\"MySecondInstance\"\\]] \n"]}
[@@ocaml.doc ""]
type nonrec create_gui_session_access_details_result =
  {
  sessions: session list option
    [@ocaml.doc
      "Returns information about the specified Amazon DCV GUI session.\n"];
  failure_reason: string option
    [@ocaml.doc "The reason the operation failed.\n"];
  percentage_complete: int option
    [@ocaml.doc "The percentage of completion for the operation.\n"];
  status: status option [@ocaml.doc "The status of the operation.\n"];
  resource_name: string option [@ocaml.doc "The resource name.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_gui_session_access_details_request =
  {
  resource_name: string [@ocaml.doc "The resource name.\n"]}[@@ocaml.doc ""]
type nonrec create_domain_entry_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_domain_entry_request =
  {
  domain_entry: domain_entry
    [@ocaml.doc
      "An array of key-value pairs containing information about the domain entry request.\n"];
  domain_name: string
    [@ocaml.doc
      "The domain name ([example.com]) for which you want to create the domain entry.\n"]}
[@@ocaml.doc ""]
type nonrec create_domain_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_domain_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  domain_name: string
    [@ocaml.doc "The domain name to manage ([example.com]).\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec create_distribution_result =
  {
  operation: operation option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"];
  distribution: lightsail_distribution option
    [@ocaml.doc "An object that describes the distribution created.\n"]}
[@@ocaml.doc ""]
type nonrec create_distribution_request =
  {
  viewer_minimum_tls_protocol_version:
    viewer_minimum_tls_protocol_version_enum option
    [@ocaml.doc
      "The minimum TLS protocol version for the SSL/TLS certificate.\n"];
  certificate_name: string option
    [@ocaml.doc
      "The name of the SSL/TLS certificate that you want to attach to the distribution.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetCertificates.html}GetCertificates} action to get a list of certificate names that you can specify.\n "];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the distribution during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  ip_address_type: ip_address_type option
    [@ocaml.doc
      "The IP address type for the distribution.\n\n The possible values are [ipv4] for IPv4 only, and [dualstack] for IPv4 and IPv6.\n \n  The default value is [dualstack].\n  "];
  bundle_id: string
    [@ocaml.doc
      "The bundle ID to use for the distribution.\n\n A distribution bundle describes the specifications of your distribution, such as the monthly cost and monthly network transfer quota.\n \n  Use the [GetDistributionBundles] action to get a list of distribution bundle IDs that you can specify.\n  "];
  cache_behaviors: cache_behavior_per_path list option
    [@ocaml.doc
      "An array of objects that describe the per-path cache behavior for the distribution.\n"];
  cache_behavior_settings: cache_settings option
    [@ocaml.doc
      "An object that describes the cache behavior settings for the distribution.\n"];
  default_cache_behavior: cache_behavior
    [@ocaml.doc
      "An object that describes the default cache behavior for the distribution.\n"];
  origin: input_origin
    [@ocaml.doc
      "An object that describes the origin resource for the distribution, such as a Lightsail instance, bucket, or load balancer.\n\n The distribution pulls, caches, and serves content from the origin.\n "];
  distribution_name: string [@ocaml.doc "The name for the distribution.\n"]}
[@@ocaml.doc ""]
type nonrec create_disk_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_disk_snapshot_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  instance_name: string option
    [@ocaml.doc
      "The unique name of the source instance ([Amazon_Linux-512MB-Virginia-1]). When this is defined, a snapshot of the instance's system volume is created.\n\n  This parameter cannot be defined together with the [disk name] parameter. The [instance name] and [disk name] parameters are mutually exclusive.\n  \n   "];
  disk_snapshot_name: string
    [@ocaml.doc
      "The name of the destination disk snapshot ([my-disk-snapshot]) based on the source disk.\n"];
  disk_name: string option
    [@ocaml.doc
      "The unique name of the source disk ([Disk-Virginia-1]).\n\n  This parameter cannot be defined together with the [instance name] parameter. The [disk name] and [instance name] parameters are mutually exclusive.\n  \n   "]}
[@@ocaml.doc ""]
type nonrec create_disk_from_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_disk_from_snapshot_request =
  {
  use_latest_restorable_auto_snapshot: bool option
    [@ocaml.doc
      "A Boolean value to indicate whether to use the latest available automatic snapshot.\n\n Constraints:\n \n  {ul\n        {-  This parameter cannot be defined together with the [restore date] parameter. The [use latest restorable auto snapshot] and [restore\n            date] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  restore_date: string option
    [@ocaml.doc
      "The date of the automatic snapshot to use for the new disk. Use the [get auto\n        snapshots] operation to identify the dates of the available automatic snapshots.\n\n Constraints:\n \n  {ul\n        {-  Must be specified in [YYYY-MM-DD] format.\n            \n             }\n        {-  This parameter cannot be defined together with the [use latest restorable auto\n            snapshot] parameter. The [restore date] and [use latest restorable\n            auto snapshot] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  source_disk_name: string option
    [@ocaml.doc
      "The name of the source disk from which the source automatic snapshot was created.\n\n Constraints:\n \n  {ul\n        {-  This parameter cannot be defined together with the [disk snapshot name] parameter. The [source disk name] and [disk snapshot name] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when creating a new disk from an automatic snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  add_ons: add_on_request list option
    [@ocaml.doc
      "An array of objects that represent the add-ons to enable for the new disk.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  size_in_gb: int [@ocaml.doc "The size of the disk in GB ([32]).\n"];
  availability_zone: string
    [@ocaml.doc
      "The Availability Zone where you want to create the disk ([us-east-2a]). Choose the same Availability Zone as the Lightsail instance where you want to create the disk.\n\n Use the GetRegions operation to list the Availability Zones where Lightsail is currently available.\n "];
  disk_snapshot_name: string option
    [@ocaml.doc
      "The name of the disk snapshot ([my-snapshot]) from which to create the new storage disk.\n\n Constraint:\n \n  {ul\n        {-  This parameter cannot be defined together with the [source disk name] parameter. The [disk snapshot name] and [source disk name] parameters are mutually exclusive.\n            \n             }\n        }\n  "];
  disk_name: string
    [@ocaml.doc "The unique Lightsail disk name ([my-disk]).\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec create_disk_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_disk_request =
  {
  add_ons: add_on_request list option
    [@ocaml.doc
      "An array of objects that represent the add-ons to enable for the new disk.\n"];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the resource during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  size_in_gb: int [@ocaml.doc "The size of the disk in GB ([32]).\n"];
  availability_zone: string
    [@ocaml.doc
      "The Availability Zone where you want to create the disk ([us-east-2a]). Use the same Availability Zone as the Lightsail instance to which you want to attach the disk.\n\n Use the [get regions] operation to list the Availability Zones where Lightsail is currently available.\n "];
  disk_name: string
    [@ocaml.doc "The unique Lightsail disk name ([my-disk]).\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec container_service_registry_login =
  {
  registry: string option
    [@ocaml.doc
      "The address to use to push container images to the container image registry of a Lightsail account.\n"];
  expires_at: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The timestamp of when the container image registry sign-in credentials expire.\n\n The log in credentials expire 12 hours after they are created, at which point you will need to create a new set of log in credentials using the [CreateContainerServiceRegistryLogin] action.\n "];
  password: string option
    [@ocaml.doc
      "The container service registry password to use to push container images to the container image registry of a Lightsail account\n"];
  username: string option
    [@ocaml.doc
      "The container service registry username to use to push container images to the container image registry of a Lightsail account.\n"]}
[@@ocaml.doc
  "Describes the sign-in credentials for the container image registry of an Amazon Lightsail account.\n"]
type nonrec create_container_service_registry_login_result =
  {
  registry_login: container_service_registry_login option
    [@ocaml.doc
      "An object that describes the log in information for the container service registry of your Lightsail account.\n"]}
[@@ocaml.doc ""]
type nonrec create_container_service_deployment_result =
  {
  container_service: container_service option
    [@ocaml.doc "An object that describes a container service.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec endpoint_request =
  {
  health_check: container_service_health_check_config option
    [@ocaml.doc
      "An object that describes the health check configuration of the container.\n"];
  container_port: int
    [@ocaml.doc
      "The port of the container to which traffic is forwarded to.\n"];
  container_name: string
    [@ocaml.doc "The name of the container for the endpoint.\n"]}[@@ocaml.doc
                                                                   "Describes the settings of a public endpoint for an Amazon Lightsail container service.\n"]
type nonrec create_container_service_deployment_request =
  {
  public_endpoint: endpoint_request option
    [@ocaml.doc
      "An object that describes the settings of the public endpoint for the container service.\n"];
  containers: container_map option
    [@ocaml.doc
      "An object that describes the settings of the containers that will be launched on the container service.\n"];
  service_name: string
    [@ocaml.doc
      "The name of the container service for which to create the deployment.\n"]}
[@@ocaml.doc ""]
type nonrec create_container_service_result =
  {
  container_service: container_service option
    [@ocaml.doc "An object that describes a container service.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec container_service_deployment_request =
  {
  public_endpoint: endpoint_request option
    [@ocaml.doc "An object that describes the endpoint of the deployment.\n"];
  containers: container_map option
    [@ocaml.doc
      "An object that describes the configuration for the containers of the deployment.\n"]}
[@@ocaml.doc
  "Describes a container deployment configuration of an Amazon Lightsail container service.\n\n A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service.\n "]
type nonrec create_container_service_request =
  {
  private_registry_access: private_registry_access_request option
    [@ocaml.doc
      "An object to describe the configuration for the container service to access private container image repositories, such as Amazon Elastic Container Registry (Amazon ECR) private repositories.\n\n For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-service-ecr-private-repo-access}Configuring access to an Amazon ECR private repository for an Amazon Lightsail container service} in the {i Amazon Lightsail Developer Guide}.\n "];
  deployment: container_service_deployment_request option
    [@ocaml.doc
      "An object that describes a deployment for the container service.\n\n A deployment specifies the containers that will be launched on the container service and their settings, such as the ports to open, the environment variables to apply, and the launch command to run. It also specifies the container that will serve as the public endpoint of the deployment and its settings, such as the HTTP or HTTPS port to use, and the health check configuration.\n "];
  public_domain_names: container_service_public_domains option
    [@ocaml.doc
      "The public domain names to use with the container service, such as [example.com] and [www.example.com].\n\n You can specify up to four public domain names for a container service. The domain names that you specify are used when you create a deployment with a container configured as the public endpoint of your container service.\n \n  If you don't specify public domain names, then you can use the default domain of the container service.\n  \n    You must create and validate an SSL/TLS certificate before you can use public domain names with your container service. Use the [CreateCertificate] action to create a certificate for the public domain names you want to use with your container service.\n    \n      You can specify public domain names using a string to array map as shown in the example later on this page.\n      "];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the container service during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n \n  For more information about tags in Lightsail, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n  "];
  scale: int
    [@ocaml.doc
      "The scale specification for the container service.\n\n The scale specifies the allocated compute nodes of the container service. The [power] and [scale] of a container service makes up its configured capacity. To determine the monthly price of your container service, multiply the base price of the [power] with the [scale] (the number of nodes) of the service.\n "];
  power: container_service_power_name
    [@ocaml.doc
      "The power specification for the container service.\n\n The power specifies the amount of memory, vCPUs, and base monthly cost of each node of the container service. The [power] and [scale] of a container service makes up its configured capacity. To determine the monthly price of your container service, multiply the base price of the [power] with the [scale] (the number of nodes) of the service.\n \n  Use the [GetContainerServicePowers] action to get a list of power options that you can specify using this parameter, and their base monthly cost.\n  "];
  service_name: string
    [@ocaml.doc
      "The name for the container service.\n\n The name that you specify for your container service will make up part of its default domain. The default domain of a container service is typically \n {[\n https://...cs.amazonlightsail.com\n ]}\n . If the name of your container service is [container-service-1], and it's located in the US East (Ohio) Amazon Web Services Region ([us-east-2]), then the domain for your container service will be like the following example: [https://container-service-1.ur4EXAMPLE2uq.us-east-2.cs.amazonlightsail.com] \n \n  The following are the requirements for container service names:\n  \n   {ul\n         {-  Must be unique within each Amazon Web Services Region in your Lightsail account.\n             \n              }\n         {-  Must contain 1 to 63 characters.\n             \n              }\n         {-  Must contain only alphanumeric characters and hyphens.\n             \n              }\n         {-  A hyphen (-) can separate words but cannot be at the start or end of the name.\n             \n              }\n         }\n  "]}
[@@ocaml.doc ""]
type nonrec create_contact_method_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_contact_method_request =
  {
  contact_endpoint: string
    [@ocaml.doc
      "The destination of the contact method, such as an email address or a mobile phone number.\n\n Use the E.164 format when specifying a mobile phone number. E.164 is a standard for the phone number structure used for international telecommunication. Phone numbers that follow this format can have a maximum of 15 digits, and they are prefixed with the plus character (+) and the country code. For example, a U.S. phone number in E.164 format would be specified as +1XXX5550100. For more information, see {{:https://en.wikipedia.org/wiki/E.164}E.164} on {i Wikipedia}.\n "];
  protocol: contact_protocol
    [@ocaml.doc
      "The protocol of the contact method, such as [Email] or [SMS] (text messaging).\n\n The [SMS] protocol is supported only in the following Amazon Web Services Regions.\n \n  {ul\n        {-  US East (N. Virginia) ([us-east-1])\n            \n             }\n        {-  US West (Oregon) ([us-west-2])\n            \n             }\n        {-  Europe (Ireland) ([eu-west-1])\n            \n             }\n        {-  Asia Pacific (Tokyo) ([ap-northeast-1])\n            \n             }\n        {-  Asia Pacific (Singapore) ([ap-southeast-1])\n            \n             }\n        {-  Asia Pacific (Sydney) ([ap-southeast-2])\n            \n             }\n        }\n   For a list of countries/regions where SMS text messages can be sent, and the latest Amazon Web Services Regions where SMS text messaging is supported, see {{:https://docs.aws.amazon.com/sns/latest/dg/sns-supported-regions-countries.html}Supported Regions and Countries} in the {i Amazon SNS Developer Guide}.\n   \n    For more information about notifications in Amazon Lightsail, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.\n    "]}
[@@ocaml.doc ""]
type nonrec create_cloud_formation_stack_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec instance_entry =
  {
  availability_zone: string
    [@ocaml.doc "The Availability Zone for the new Amazon EC2 instance.\n"];
  user_data: string option
    [@ocaml.doc
      "A launch script you can create that configures a server with additional user data. For example, you might want to run [apt-get -y update].\n\n  Depending on the machine image you choose, the command to get software on your instance varies. Amazon Linux and CentOS use [yum], Debian and Ubuntu use [apt-get], and FreeBSD uses [pkg].\n  \n   "];
  port_info_source: port_info_source_type
    [@ocaml.doc
      "The port configuration to use for the new Amazon EC2 instance.\n\n The following configuration options are available:\n \n  {ul\n        {-   [DEFAULT] - Use the default firewall settings from the Lightsail instance blueprint. If this is specified, then IPv4 and IPv6 will be configured for the new instance that is created in Amazon EC2.\n            \n             }\n        {-   [INSTANCE] - Use the configured firewall settings from the source Lightsail instance. If this is specified, the new instance that is created in Amazon EC2 will be configured to match the configuration of the source Lightsail instance. For example, if the source instance is configured for dual-stack (IPv4 and IPv6), then IPv4 and IPv6 will be configured for the new instance that is created in Amazon EC2. If the source instance is configured for IPv4 only, then only IPv4 will be configured for the new instance that is created in Amazon EC2.\n            \n             }\n        {-   [NONE] - Use the default Amazon EC2 security group. If this is specified, then only IPv4 will be configured for the new instance that is created in Amazon EC2.\n            \n             }\n        {-   [CLOSED] - All ports closed. If this is specified, then only IPv4 will be configured for the new instance that is created in Amazon EC2.\n            \n             }\n        }\n    If you configured [lightsail-connect] as a [cidrListAliases] on your instance, or if you chose to allow the Lightsail browser-based SSH or RDP clients to connect to your instance, that configuration is not carried over to your new Amazon EC2 instance.\n    \n     "];
  instance_type: string
    [@ocaml.doc
      "The instance type ([t2.micro]) to use for the new Amazon EC2 instance.\n"];
  source_name: string
    [@ocaml.doc
      "The name of the export snapshot record, which contains the exported Lightsail instance snapshot that will be used as the source of the new Amazon EC2 instance.\n\n Use the [get export snapshot records] operation to get a list of export snapshot records that you can use to create a CloudFormation stack.\n "]}
[@@ocaml.doc
  "Describes the Amazon Elastic Compute Cloud instance and related resources to be created using the [create cloud formation stack] operation.\n"]
type nonrec create_cloud_formation_stack_request =
  {
  instances: instance_entry list
    [@ocaml.doc
      "An array of parameters that will be used to create the new Amazon EC2 instance. You can only pass one instance entry at a time in this array. You will get an invalid parameter error if you pass more than one instance entry in this array.\n"]}
[@@ocaml.doc ""]
type nonrec create_certificate_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"];
  certificate: certificate_summary option
    [@ocaml.doc "An object that describes the certificate created.\n"]}
[@@ocaml.doc ""]
type nonrec create_certificate_request =
  {
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the certificate during create.\n\n Use the [TagResource] action to tag a resource after it's created.\n "];
  subject_alternative_names: string list option
    [@ocaml.doc
      "An array of strings that specify the alternate domains ([example2.com]) and subdomains ([blog.example.com]) for the certificate.\n\n You can specify a maximum of nine alternate domains (in addition to the primary domain name).\n \n  Wildcard domain entries ([*.example.com]) are not supported.\n  "];
  domain_name: string
    [@ocaml.doc "The domain name ([example.com]) for the certificate.\n"];
  certificate_name: string [@ocaml.doc "The name for the certificate.\n"]}
[@@ocaml.doc ""]
type nonrec create_bucket_access_key_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"];
  access_key: access_key option
    [@ocaml.doc "An object that describes the access key that is created.\n"]}
[@@ocaml.doc ""]
type nonrec create_bucket_access_key_request =
  {
  bucket_name: string
    [@ocaml.doc
      "The name of the bucket that the new access key will belong to, and grant access to.\n"]}
[@@ocaml.doc ""]
type nonrec create_bucket_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"];
  bucket: bucket option
    [@ocaml.doc "An object that describes the bucket that is created.\n"]}
[@@ocaml.doc ""]
type nonrec create_bucket_request =
  {
  enable_object_versioning: bool option
    [@ocaml.doc
      "A Boolean value that indicates whether to enable versioning of objects in the bucket.\n\n For more information about versioning, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-managing-bucket-object-versioning}Enabling and suspending object versioning in a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "];
  tags: tag list option
    [@ocaml.doc
      "The tag keys and optional values to add to the bucket during creation.\n\n Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_TagResource.html}TagResource} action to tag the bucket after it's created.\n "];
  bundle_id: string
    [@ocaml.doc
      "The ID of the bundle to use for the bucket.\n\n A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket.\n \n  Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketBundles.html}GetBucketBundles} action to get a list of bundle IDs that you can specify.\n  \n   Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html}UpdateBucketBundle} action to change the bundle after the bucket is created.\n   "];
  bucket_name: string
    [@ocaml.doc
      "The name for the bucket.\n\n For more information about bucket names, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/bucket-naming-rules-in-amazon-lightsail}Bucket naming rules in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]}
[@@ocaml.doc ""]
type nonrec copy_snapshot_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec copy_snapshot_request =
  {
  source_region: region_name
    [@ocaml.doc
      "The Amazon Web Services Region where the source manual or automatic snapshot is located.\n"];
  target_snapshot_name: string
    [@ocaml.doc
      "The name of the new manual snapshot to be created as a copy.\n"];
  use_latest_restorable_auto_snapshot: bool option
    [@ocaml.doc
      "A Boolean value to indicate whether to use the latest available automatic snapshot of the specified source instance or disk.\n\n Constraints:\n \n  {ul\n        {-  This parameter cannot be defined together with the [restore date] parameter. The [use latest restorable auto snapshot] and [restore\n            date] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-keeping-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  restore_date: string option
    [@ocaml.doc
      "The date of the source automatic snapshot to copy. Use the [get auto snapshots] operation to identify the dates of the available automatic snapshots.\n\n Constraints:\n \n  {ul\n        {-  Must be specified in [YYYY-MM-DD] format.\n            \n             }\n        {-  This parameter cannot be defined together with the [use latest restorable auto\n            snapshot] parameter. The [restore date] and [use latest restorable\n            auto snapshot] parameters are mutually exclusive.\n            \n             }\n        {-  Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-keeping-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  source_resource_name: string option
    [@ocaml.doc
      "The name of the source instance or disk from which the source automatic snapshot was created.\n\n Constraint:\n \n  {ul\n        {-  Define this parameter only when copying an automatic snapshot as a manual snapshot. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-keeping-automatic-snapshots}Amazon Lightsail Developer Guide}.\n            \n             }\n        }\n  "];
  source_snapshot_name: string option
    [@ocaml.doc
      "The name of the source manual snapshot to copy.\n\n Constraint:\n \n  {ul\n        {-  Define this parameter only when copying a manual snapshot as another manual snapshot.\n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec close_instance_public_ports_result =
  {
  operation: operation option
    [@ocaml.doc
      "An object that describes the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec close_instance_public_ports_request =
  {
  instance_name: string
    [@ocaml.doc "The name of the instance for which to close ports.\n"];
  port_info: port_info
    [@ocaml.doc
      "An object to describe the ports to close for the specified instance.\n"]}
[@@ocaml.doc ""]
type nonrec attach_static_ip_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec attach_static_ip_request =
  {
  instance_name: string
    [@ocaml.doc
      "The instance name to which you want to attach the static IP address.\n"];
  static_ip_name: string [@ocaml.doc "The name of the static IP.\n"]}
[@@ocaml.doc ""]
type nonrec attach_load_balancer_tls_certificate_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n\n These SSL/TLS certificates are only usable by Lightsail load balancers. You can't get the certificate and use it for another purpose.\n "]}
[@@ocaml.doc ""]
type nonrec attach_load_balancer_tls_certificate_request =
  {
  certificate_name: string
    [@ocaml.doc "The name of your SSL/TLS certificate.\n"];
  load_balancer_name: string
    [@ocaml.doc
      "The name of the load balancer to which you want to associate the SSL/TLS certificate.\n"]}
[@@ocaml.doc ""]
type nonrec attach_instances_to_load_balancer_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec attach_instances_to_load_balancer_request =
  {
  instance_names: string list
    [@ocaml.doc
      "An array of strings representing the instance name(s) you want to attach to your load balancer.\n\n An instance must be [running] before you can attach it to your load balancer.\n \n  There are no additional limits on the number of instances you can attach to your load balancer, aside from the limit of Lightsail instances you can create in your account (20).\n  "];
  load_balancer_name: string [@ocaml.doc "The name of the load balancer.\n"]}
[@@ocaml.doc ""]
type nonrec attach_disk_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec attach_disk_request =
  {
  auto_mounting: bool option
    [@ocaml.doc
      "A Boolean value used to determine the automatic mounting of a storage volume to a virtual computer. The default value is [False].\n\n  This value only applies to Lightsail for Research resources.\n  \n   "];
  disk_path: string
    [@ocaml.doc "The disk path to expose to the instance ([/dev/xvdf]).\n"];
  instance_name: string
    [@ocaml.doc
      "The name of the Lightsail instance where you want to utilize the storage disk.\n"];
  disk_name: string
    [@ocaml.doc "The unique Lightsail disk name ([my-disk]).\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec attach_certificate_to_distribution_result =
  {
  operation: operation option
    [@ocaml.doc
      "An object that describes the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec attach_certificate_to_distribution_request =
  {
  certificate_name: string
    [@ocaml.doc
      "The name of the certificate to attach to a distribution.\n\n Only certificates with a status of [ISSUED] can be attached to a distribution.\n \n  Use the [GetCertificates] action to get a list of certificate names that you can specify.\n  \n    This is the name of the certificate resource type and is used only to reference the certificate in other API actions. It can be different than the domain name of the certificate. For example, your certificate name might be [WordPress-Blog-Certificate] and the domain name of the certificate might be [example.com].\n    \n     "];
  distribution_name: string
    [@ocaml.doc
      "The name of the distribution that the certificate will be attached to.\n\n Use the [GetDistributions] action to get a list of distribution names that you can specify.\n "]}
[@@ocaml.doc ""]
type nonrec allocate_static_ip_result =
  {
  operations: operation list option
    [@ocaml.doc
      "An array of objects that describe the result of the action, such as the status of the request, the timestamp of the request, and the resources affected by the request.\n"]}
[@@ocaml.doc ""]
type nonrec allocate_static_ip_request =
  {
  static_ip_name: string [@ocaml.doc "The name of the static IP address.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

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
val make_unpeer_vpc_request : unit -> unit
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
val make_peer_vpc_request : unit -> unit
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
val make_is_vpc_peered_request : unit -> unit
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
val make_get_distribution_bundles_request : unit -> unit
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
val make_get_container_service_powers_request : unit -> unit
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
val make_get_container_api_metadata_request : unit -> unit
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
val make_download_default_key_pair_request : unit -> unit
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
val make_create_container_service_registry_login_request : unit -> unit
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

module AllocateStaticIp :
sig
  val request :
    Smaws_Lib.Context.t ->
      allocate_static_ip_request ->
        (allocate_static_ip_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Allocates a static IP address.\n"]
module AttachCertificateToDistribution :
sig
  val request :
    Smaws_Lib.Context.t ->
      attach_certificate_to_distribution_request ->
        (attach_certificate_to_distribution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Attaches an SSL/TLS certificate to your Amazon Lightsail content delivery network (CDN) distribution.\n\n After the certificate is attached, your distribution accepts HTTPS traffic for all of the domains that are associated with the certificate.\n \n  Use the [CreateCertificate] action to create a certificate that you can attach to your distribution.\n  \n    Only certificates created in the [us-east-1] Amazon Web Services Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any Amazon Web Services Region, and distribute its content globally. However, all distributions are located in the [us-east-1] Region.\n    \n     "]
module AttachDisk :
sig
  val request :
    Smaws_Lib.Context.t ->
      attach_disk_request ->
        (attach_disk_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Attaches a block storage disk to a running or stopped Lightsail instance and exposes it to the instance with the specified disk name.\n\n The [attach disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module AttachInstancesToLoadBalancer :
sig
  val request :
    Smaws_Lib.Context.t ->
      attach_instances_to_load_balancer_request ->
        (attach_instances_to_load_balancer_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Attaches one or more Lightsail instances to a load balancer.\n\n After some time, the instances are attached to the load balancer and the health check status is available.\n \n  The [attach instances to load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer\n        name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Lightsail Developer Guide}.\n  "]
module AttachLoadBalancerTlsCertificate :
sig
  val request :
    Smaws_Lib.Context.t ->
      attach_load_balancer_tls_certificate_request ->
        (attach_load_balancer_tls_certificate_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Attaches a Transport Layer Security (TLS) certificate to your load balancer. TLS is just an updated, more secure version of Secure Socket Layer (SSL).\n\n Once you create and validate your certificate, you can attach it to your load balancer. You can also use this API to rotate the certificates on your account. Use the [AttachLoadBalancerTlsCertificate] action with the non-attached certificate, and it will replace the existing one and become the attached certificate.\n \n  The [AttachLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer\n        name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module AttachStaticIp :
sig
  val request :
    Smaws_Lib.Context.t ->
      attach_static_ip_request ->
        (attach_static_ip_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Attaches a static IP address to a specific Amazon Lightsail instance.\n"]
module CloseInstancePublicPorts :
sig
  val request :
    Smaws_Lib.Context.t ->
      close_instance_public_ports_request ->
        (close_instance_public_ports_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Closes ports for a specific Amazon Lightsail instance.\n\n The [CloseInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CopySnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      copy_snapshot_request ->
        (copy_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Copies a manual snapshot of an instance or disk as another manual snapshot, or copies an automatic snapshot of an instance or disk as a manual snapshot. This operation can also be used to copy a manual or automatic snapshot of an instance or a disk from one Amazon Web Services Region to another in Amazon Lightsail.\n\n When copying a {i manual snapshot}, be sure to define the [source\n        region], [source snapshot name], and [target snapshot name] parameters.\n \n  When copying an {i automatic snapshot}, be sure to define the [source region], [source resource name], [target snapshot\n        name], and either the [restore date] or the [use latest restorable\n        auto snapshot] parameters.\n  "]
module CreateBucket :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_request ->
        (create_bucket_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an Amazon Lightsail bucket.\n\n A bucket is a cloud storage resource available in the Lightsail object storage service. Use buckets to store objects such as data and its descriptive metadata. For more information about buckets, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/buckets-in-amazon-lightsail}Buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
module CreateBucketAccessKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_bucket_access_key_request ->
        (create_bucket_access_key_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a new access key for the specified Amazon Lightsail bucket. Access keys consist of an access key ID and corresponding secret access key.\n\n Access keys grant full programmatic access to the specified bucket and its objects. You can have a maximum of two access keys per bucket. Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBucketAccessKeys.html}GetBucketAccessKeys} action to get a list of current access keys for a specific bucket. For more information about access keys, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n \n   The [secretAccessKey] value is returned only in response to the [CreateBucketAccessKey] action. You can get a secret access key only when you first create an access key; you cannot get the secret access key later. If you lose the secret access key, you must create a new access key.\n   \n    "]
module CreateCertificate :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_certificate_request ->
        (create_certificate_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an SSL/TLS certificate for an Amazon Lightsail content delivery network (CDN) distribution and a container service.\n\n After the certificate is valid, use the [AttachCertificateToDistribution] action to use the certificate and its domains with your distribution. Or use the [UpdateContainerService] action to use the certificate and its domains with your container service.\n \n   Only certificates created in the [us-east-1] Amazon Web Services Region can be attached to Lightsail distributions. Lightsail distributions are global resources that can reference an origin in any Amazon Web Services Region, and distribute its content globally. However, all distributions are located in the [us-east-1] Region.\n   \n    "]
module CreateCloudFormationStack :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_cloud_formation_stack_request ->
        (create_cloud_formation_stack_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an AWS CloudFormation stack, which creates a new Amazon EC2 instance from an exported Amazon Lightsail snapshot. This operation results in a CloudFormation stack record that can be used to track the AWS CloudFormation stack created. Use the [get cloud formation stack\n        records] operation to get a list of the CloudFormation stacks created.\n\n  Wait until after your new Amazon EC2 instance is created before running the [create\n          cloud formation stack] operation again with the same export snapshot record.\n  \n   "]
module CreateContactMethod :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_contact_method_request ->
        (create_contact_method_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an email or SMS text message contact method.\n\n A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.\n "]
module CreateContainerService :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_request ->
        (create_container_service_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an Amazon Lightsail container service.\n\n A Lightsail container service is a compute resource to which you can deploy containers. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-container-services}Container services in Amazon Lightsail} in the {i Lightsail Dev Guide}.\n "]
module CreateContainerServiceDeployment :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_container_service_deployment_request ->
        (create_container_service_deployment_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a deployment for your Amazon Lightsail container service.\n\n A deployment specifies the containers that will be launched on the container service and their settings, such as the ports to open, the environment variables to apply, and the launch command to run. It also specifies the container that will serve as the public endpoint of the deployment and its settings, such as the HTTP or HTTPS port to use, and the health check configuration.\n \n  You can deploy containers to your container service using container images from a public registry such as Amazon ECR Public, or from your local machine. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-creating-container-images}Creating container images for your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.\n  "]
module CreateContainerServiceRegistryLogin :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (create_container_service_registry_login_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a temporary set of log in credentials that you can use to log in to the Docker process on your local machine. After you're logged in, you can use the native Docker commands to push your local container images to the container image registry of your Amazon Lightsail account so that you can use them with your Lightsail container service. The log in credentials expire 12 hours after they are created, at which point you will need to create a new set of log in credentials.\n\n  You can only push container images to the container service registry of your Lightsail account. You cannot pull container images or perform any other container image management actions on the container service registry.\n  \n    After you push your container images to the container image registry of your Lightsail account, use the [RegisterContainerImage] action to register the pushed images to a specific Lightsail container service.\n    \n      This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-pushing-container-images}Pushing and managing container images on your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.\n      \n       "]
module CreateDisk :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_request ->
        (create_disk_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a block storage disk that can be attached to an Amazon Lightsail instance in the same Availability Zone ([us-east-2a]).\n\n The [create disk] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CreateDiskFromSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_from_snapshot_request ->
        (create_disk_from_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a block storage disk from a manual or automatic snapshot of a disk. The resulting disk can be attached to an Amazon Lightsail instance in the same Availability Zone ([us-east-2a]).\n\n The [create disk from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [disk snapshot\n        name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CreateDiskSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_disk_snapshot_request ->
        (create_disk_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a snapshot of a block storage disk. You can use snapshots for backups, to make copies of disks, and to save data before shutting down a Lightsail instance.\n\n You can take a snapshot of an attached disk that is in use; however, snapshots only capture data that has been written to your disk at the time the snapshot command is issued. This may exclude any data that has been cached by any applications or the operating system. If you can pause any file systems on the disk long enough to take a snapshot, your snapshot should be complete. Nevertheless, if you cannot pause all file writes to the disk, you should unmount the disk from within the Lightsail instance, issue the create disk snapshot command, and then remount the disk to ensure a consistent and complete snapshot. You may remount and use your disk while the snapshot status is pending.\n \n  You can also use this operation to create a snapshot of an instance's system volume. You might want to do this, for example, to recover data from the system volume of a botched instance or to create a backup of the system volume like you would for a block storage disk. To create a snapshot of a system volume, just define the [instance name] parameter when issuing the snapshot command, and a snapshot of the defined instance's system volume will be created. After the snapshot is available, you can create a block storage disk from the snapshot and attach it to a running instance to access the data on the disk.\n  \n   The [create disk snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n   "]
module CreateDistribution :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_distribution_request ->
        (create_distribution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an Amazon Lightsail content delivery network (CDN) distribution.\n\n A distribution is a globally distributed network of caching servers that improve the performance of your website or web application hosted on a Lightsail instance. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-content-delivery-network-distributions}Content delivery networks in Amazon Lightsail}.\n "]
module CreateDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_request ->
        (create_domain_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a domain resource for the specified domain (example.com).\n\n The [create domain] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CreateDomainEntry :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_domain_entry_request ->
        (create_domain_entry_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates one of the following domain name system (DNS) records in a domain DNS zone: Address (A), canonical name (CNAME), mail exchanger (MX), name server (NS), start of authority (SOA), service locator (SRV), or text (TXT).\n\n The [create domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CreateGUISessionAccessDetails :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_gui_session_access_details_request ->
        (create_gui_session_access_details_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates two URLs that are used to access a virtual computer\226\128\153s graphical user interface (GUI) session. The primary URL initiates a web-based Amazon DCV session to the virtual computer's application. The secondary URL initiates a web-based Amazon DCV session to the virtual computer's operating session. \n\n Use [StartGUISession] to open the session.\n "]
module CreateInstances :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_request ->
        (create_instances_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates one or more Amazon Lightsail instances.\n\n The [create instances] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Lightsail Developer Guide}.\n "]
module CreateInstancesFromSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_instances_from_snapshot_request ->
        (create_instances_from_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates one or more new instances from a manual or automatic snapshot of an instance.\n\n The [create instances from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [instance snapshot name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CreateInstanceSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_instance_snapshot_request ->
        (create_instance_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a snapshot of a specific virtual private server, or {i instance}. You can use a snapshot to create a new instance that is based on that snapshot.\n\n The [create instance snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CreateKeyPair :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_key_pair_request ->
        (create_key_pair_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a custom SSH key pair that you can use with an Amazon Lightsail instance.\n\n  Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html}DownloadDefaultKeyPair} action to create a Lightsail default key pair in an Amazon Web Services Region where a default key pair does not currently exist.\n  \n    The [create key pair] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n    "]
module CreateLoadBalancer :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_request ->
        (create_load_balancer_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a Lightsail load balancer. To learn more about deciding whether to load balance your application, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/configure-lightsail-instances-for-load-balancing}Configure your Lightsail instances for load balancing}. You can create up to 5 load balancers per AWS Region in your account.\n\n When you create a load balancer, you can specify a unique name and port settings. To change additional load balancer settings, use the [UpdateLoadBalancerAttribute] operation.\n \n  The [create load balancer] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module CreateLoadBalancerTlsCertificate :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_load_balancer_tls_certificate_request ->
        (create_load_balancer_tls_certificate_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an SSL/TLS certificate for an Amazon Lightsail load balancer.\n\n TLS is just an updated, more secure version of Secure Socket Layer (SSL).\n \n  The [CreateLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer\n        name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module CreateRelationalDatabase :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_request ->
        (create_relational_database_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a new database in Amazon Lightsail.\n\n The [create relational database] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module CreateRelationalDatabaseFromSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_from_snapshot_request ->
        (create_relational_database_from_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a new database from an existing database snapshot in Amazon Lightsail.\n\n You can create a new database from a snapshot in if something goes wrong with your original database, or to change it to a different plan, such as a high availability or standard plan.\n \n  The [create relational database from snapshot] operation supports tag-based access control via request tags and resource tags applied to the resource identified by relationalDatabaseSnapshotName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module CreateRelationalDatabaseSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_relational_database_snapshot_request ->
        (create_relational_database_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates a snapshot of your database in Amazon Lightsail. You can use snapshots for backups, to make copies of a database, and to save data before deleting a database.\n\n The [create relational database snapshot] operation supports tag-based access control via request tags. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteAlarm :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alarm_request ->
        (delete_alarm_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes an alarm.\n\n An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n "]
module DeleteAutoSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_auto_snapshot_request ->
        (delete_auto_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes an automatic snapshot of an instance or disk. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n"]
module DeleteBucket :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_request ->
        (delete_bucket_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a Amazon Lightsail bucket.\n\n  When you delete your bucket, the bucket name is released and can be reused for a new bucket in your account or another Amazon Web Services account.\n  \n   "]
module DeleteBucketAccessKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_bucket_access_key_request ->
        (delete_bucket_access_key_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes an access key for the specified Amazon Lightsail bucket.\n\n We recommend that you delete an access key if the secret access key is compromised.\n \n  For more information about access keys, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-creating-bucket-access-keys}Creating access keys for a bucket in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n  "]
module DeleteCertificate :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_certificate_request ->
        (delete_certificate_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes an SSL/TLS certificate for your Amazon Lightsail content delivery network (CDN) distribution.\n\n Certificates that are currently attached to a distribution cannot be deleted. Use the [DetachCertificateFromDistribution] action to detach a certificate from a distribution.\n "]
module DeleteContactMethod :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_contact_method_request ->
        (delete_contact_method_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a contact method.\n\n A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.\n "]
module DeleteContainerImage :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_image_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a container image that is registered to your Amazon Lightsail container service.\n"]
module DeleteContainerService :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_container_service_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Deletes your Amazon Lightsail container service.\n"]
module DeleteDisk :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_request ->
        (delete_disk_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes the specified block storage disk. The disk must be in the [available] state (not attached to a Lightsail instance).\n\n  The disk may remain in the [deleting] state for several minutes.\n  \n    The [delete disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n    "]
module DeleteDiskSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_disk_snapshot_request ->
        (delete_disk_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes the specified disk snapshot.\n\n When you make periodic snapshots of a disk, the snapshots are incremental, and only the blocks on the device that have changed since your last snapshot are saved in the new snapshot. When you delete a snapshot, only the data not needed for any other snapshot is removed. So regardless of which prior snapshots have been deleted, all active snapshots will have access to all the information needed to restore the disk.\n \n  The [delete disk snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [disk snapshot name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module DeleteDistribution :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_distribution_request ->
        (delete_distribution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes your Amazon Lightsail content delivery network (CDN) distribution.\n"]
module DeleteDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_request ->
        (delete_domain_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes the specified domain recordset and all of its domain records.\n\n The [delete domain] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteDomainEntry :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_domain_entry_request ->
        (delete_domain_entry_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a specific domain entry.\n\n The [delete domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteInstance :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_request ->
        (delete_instance_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes an Amazon Lightsail instance.\n\n The [delete instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteInstanceSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_instance_snapshot_request ->
        (delete_instance_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a specific snapshot of a virtual private server (or {i instance}).\n\n The [delete instance snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [instance snapshot name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteKeyPair :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_key_pair_request ->
        (delete_key_pair_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes the specified key pair by removing the public key from Amazon Lightsail.\n\n You can delete key pairs that were created using the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_ImportKeyPair.html}ImportKeyPair} and {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateKeyPair.html}CreateKeyPair} actions, as well as the Lightsail default key pair. A new default key pair will not be created unless you launch an instance without specifying a custom key pair, or you call the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_DownloadDefaultKeyPair.html}DownloadDefaultKeyPair} API. \n \n  The [delete key pair] operation supports tag-based access control via resource tags applied to the resource identified by [key pair name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module DeleteKnownHostKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_known_host_keys_request ->
        (delete_known_host_keys_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes the known host key or certificate used by the Amazon Lightsail browser-based SSH or RDP clients to authenticate an instance. This operation enables the Lightsail browser-based SSH or RDP clients to connect to the instance after a host key mismatch.\n\n  Perform this operation only if you were expecting the host key or certificate mismatch or if you are familiar with the new host key or certificate on the instance. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-troubleshooting-browser-based-ssh-rdp-client-connection}Troubleshooting connection issues when using the Amazon Lightsail browser-based SSH or RDP client}.\n  \n   "]
module DeleteLoadBalancer :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_request ->
        (delete_load_balancer_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a Lightsail load balancer and all its associated SSL/TLS certificates. Once the load balancer is deleted, you will need to create a new load balancer, create a new certificate, and verify domain ownership again.\n\n The [delete load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteLoadBalancerTlsCertificate :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_load_balancer_tls_certificate_request ->
        (delete_load_balancer_tls_certificate_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes an SSL/TLS certificate associated with a Lightsail load balancer.\n\n The [DeleteLoadBalancerTlsCertificate] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer\n        name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteRelationalDatabase :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_request ->
        (delete_relational_database_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a database in Amazon Lightsail.\n\n The [delete relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DeleteRelationalDatabaseSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_relational_database_snapshot_request ->
        (delete_relational_database_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes a database snapshot in Amazon Lightsail.\n\n The [delete relational database snapshot] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DetachCertificateFromDistribution :
sig
  val request :
    Smaws_Lib.Context.t ->
      detach_certificate_from_distribution_request ->
        (detach_certificate_from_distribution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Detaches an SSL/TLS certificate from your Amazon Lightsail content delivery network (CDN) distribution.\n\n After the certificate is detached, your distribution stops accepting traffic for all of the domains that are associated with the certificate.\n "]
module DetachDisk :
sig
  val request :
    Smaws_Lib.Context.t ->
      detach_disk_request ->
        (detach_disk_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Detaches a stopped block storage disk from a Lightsail instance. Make sure to unmount any file systems on the device within your operating system before stopping the instance and detaching the disk.\n\n The [detach disk] operation supports tag-based access control via resource tags applied to the resource identified by [disk name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module DetachInstancesFromLoadBalancer :
sig
  val request :
    Smaws_Lib.Context.t ->
      detach_instances_from_load_balancer_request ->
        (detach_instances_from_load_balancer_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Detaches the specified instances from a Lightsail load balancer.\n\n This operation waits until the instances are no longer needed before they are detached from the load balancer.\n \n  The [detach instances from load balancer] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer\n        name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module DetachStaticIp :
sig
  val request :
    Smaws_Lib.Context.t ->
      detach_static_ip_request ->
        (detach_static_ip_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Detaches a static IP from the Amazon Lightsail instance to which it is attached.\n"]
module DisableAddOn :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_add_on_request ->
        (disable_add_on_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Disables an add-on for an Amazon Lightsail resource. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n"]
module DownloadDefaultKeyPair :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (download_default_key_pair_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Downloads the regional Amazon Lightsail default key pair.\n\n This action also creates a Lightsail default key pair if a default key pair does not currently exist in the Amazon Web Services Region.\n "]
module EnableAddOn :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_add_on_request ->
        (enable_add_on_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Enables or modifies an add-on for an Amazon Lightsail resource. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n"]
module ExportSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      export_snapshot_request ->
        (export_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Exports an Amazon Lightsail instance or block storage disk snapshot to Amazon Elastic Compute Cloud (Amazon EC2). This operation results in an export snapshot record that can be used with the [create\n        cloud formation stack] operation to create new Amazon EC2 instances.\n\n Exported instance snapshots appear in Amazon EC2 as Amazon Machine Images (AMIs), and the instance system disk appears as an Amazon Elastic Block Store (Amazon EBS) volume. Exported disk snapshots appear in Amazon EC2 as Amazon EBS volumes. Snapshots are exported to the same Amazon Web Services Region in Amazon EC2 as the source Lightsail snapshot.\n \n  \n  \n   The [export snapshot] operation supports tag-based access control via resource tags applied to the resource identified by [source snapshot name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n   \n     Use the [get instance snapshots] or [get disk snapshots] operations to get a list of snapshots that you can export to Amazon EC2.\n     \n      "]
module GetActiveNames :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_active_names_request ->
        (get_active_names_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns the names of all active (not deleted) resources.\n"]
module GetAlarms :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_alarms_request ->
        (get_alarms_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about the configured alarms. Specify an alarm name in your request to return information about a specific alarm, or specify a monitored resource name to return information about all alarms for a specific resource.\n\n An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n "]
module GetAutoSnapshots :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_auto_snapshots_request ->
        (get_auto_snapshots_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the available automatic snapshots for an instance or disk. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-automatic-snapshots}Amazon Lightsail Developer Guide}.\n"]
module GetBlueprints :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_blueprints_request ->
        (get_blueprints_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the list of available instance images, or {i blueprints}. You can use a blueprint to create a new instance already running a specific operating system, as well as a preinstalled app or development stack. The software each instance is running depends on the blueprint image you choose.\n\n  Use active blueprints when creating new instances. Inactive blueprints are listed to support customers with existing instances and are not necessarily available to create new instances. Blueprints are marked inactive when they become outdated due to operating system updates or new application releases.\n  \n   "]
module GetBucketAccessKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_access_keys_request ->
        (get_bucket_access_keys_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the existing access key IDs for the specified Amazon Lightsail bucket.\n\n  This action does not return the secret access key value of an access key. You can get a secret access key only when you create it from the response of the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateBucketAccessKey.html}CreateBucketAccessKey} action. If you lose the secret access key, you must create a new access key.\n  \n   "]
module GetBucketBundles :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_bundles_request ->
        (get_bucket_bundles_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the bundles that you can apply to a Amazon Lightsail bucket.\n\n The bucket bundle specifies the monthly cost, storage quota, and data transfer quota for a bucket.\n \n  Use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_UpdateBucketBundle.html}UpdateBucketBundle} action to update the bundle for a bucket.\n  "]
module GetBucketMetricData :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_bucket_metric_data_request ->
        (get_bucket_metric_data_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the data points of a specific metric for an Amazon Lightsail bucket.\n\n Metrics report the utilization of a bucket. View and collect metric data regularly to monitor the number of objects stored in a bucket (including object versions) and the storage space used by those objects.\n "]
module GetBuckets :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_buckets_request ->
        (get_buckets_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about one or more Amazon Lightsail buckets. The information returned includes the synchronization status of the Amazon Simple Storage Service (Amazon S3) account-level block public access feature for your Lightsail buckets.\n\n For more information about buckets, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/buckets-in-amazon-lightsail}Buckets in Amazon Lightsail} in the {i Amazon Lightsail Developer Guide}.\n "]
module GetBundles :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_bundles_request ->
        (get_bundles_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the bundles that you can apply to an Amazon Lightsail instance when you create it.\n\n A bundle describes the specifications of an instance, such as the monthly cost, amount of memory, the number of vCPUs, amount of storage space, and monthly network data transfer quota.\n \n   Bundles are referred to as {i instance plans} in the Lightsail console.\n   \n    "]
module GetCertificates :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_certificates_request ->
        (get_certificates_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about one or more Amazon Lightsail SSL/TLS certificates.\n\n  To get a summary of a certificate, omit [includeCertificateDetails] from your request. The response will include only the certificate Amazon Resource Name (ARN), certificate name, domain name, and tags.\n  \n   "]
module GetCloudFormationStackRecords :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_cloud_formation_stack_records_request ->
        (get_cloud_formation_stack_records_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the CloudFormation stack record created as a result of the [create cloud\n        formation stack] operation.\n\n An AWS CloudFormation stack is used to create a new Amazon EC2 instance from an exported Lightsail snapshot.\n "]
module GetContactMethods :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_contact_methods_request ->
        (get_contact_methods_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about the configured contact methods. Specify a protocol in your request to return information about a specific contact method.\n\n A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.\n "]
module GetContainerAPIMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_container_api_metadata_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about Amazon Lightsail containers, such as the current version of the Lightsail Control (lightsailctl) plugin.\n"]
module GetContainerImages :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_images_request ->
        (get_container_images_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the container images that are registered to your Amazon Lightsail container service.\n\n  If you created a deployment on your Lightsail container service that uses container images from a public registry like Docker Hub, those images are not returned as part of this action. Those images are not registered to your Lightsail container service.\n  \n   "]
module GetContainerLog :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_log_request ->
        (get_container_log_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the log events of a container of your Amazon Lightsail container service.\n\n If your container service has more than one node (i.e., a scale greater than 1), then the log events that are returned for the specified container are merged from all nodes on your container service.\n \n   Container logs are retained for a certain amount of time. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/lightsail.html}Amazon Lightsail endpoints and quotas} in the {i Amazon Web Services General Reference}.\n   \n    "]
module GetContainerServiceDeployments :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_deployments_request ->
        (get_container_service_deployments_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the deployments for your Amazon Lightsail container service\n\n A deployment specifies the settings, such as the ports and launch command, of containers that are deployed to your container service.\n \n  The deployments are ordered by version in ascending order. The newest version is listed at the top of the response.\n  \n    A set number of deployments are kept before the oldest one is replaced with the newest one. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/lightsail.html}Amazon Lightsail endpoints and quotas} in the {i Amazon Web Services General Reference}.\n    \n     "]
module GetContainerServiceMetricData :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_service_metric_data_request ->
        (get_container_service_metric_data_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the data points of a specific metric of your Amazon Lightsail container service.\n\n Metrics report the utilization of your resources. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.\n "]
module GetContainerServicePowers :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_container_service_powers_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the list of powers that can be specified for your Amazon Lightsail container services.\n\n The power specifies the amount of memory, the number of vCPUs, and the base price of the container service.\n "]
module GetContainerServices :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_container_services_request ->
        (container_services_list_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about one or more of your Amazon Lightsail container services.\n"]
module GetCostEstimate :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_cost_estimate_request ->
        (get_cost_estimate_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Retrieves information about the cost estimate for a specified resource. A cost estimate will not generate for a resource that has been deleted.\n"]
module GetDisk :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_request ->
        (get_disk_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns information about a specific block storage disk.\n"]
module GetDisks :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_disks_request ->
        (get_disks_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all block storage disks in your AWS account and region.\n"]
module GetDiskSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshot_request ->
        (get_disk_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about a specific block storage disk snapshot.\n"]
module GetDiskSnapshots :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_disk_snapshots_request ->
        (get_disk_snapshots_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all block storage disk snapshots in your AWS account and region.\n"]
module GetDistributionBundles :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_distribution_bundles_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the bundles that can be applied to your Amazon Lightsail content delivery network (CDN) distributions.\n\n A distribution bundle specifies the monthly network transfer quota and monthly cost of your distribution.\n "]
module GetDistributionLatestCacheReset :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_latest_cache_reset_request ->
        (get_distribution_latest_cache_reset_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the timestamp and status of the last cache reset of a specific Amazon Lightsail content delivery network (CDN) distribution.\n"]
module GetDistributionMetricData :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_distribution_metric_data_request ->
        (get_distribution_metric_data_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the data points of a specific metric for an Amazon Lightsail content delivery network (CDN) distribution.\n\n Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.\n "]
module GetDistributions :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_distributions_request ->
        (get_distributions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about one or more of your Amazon Lightsail content delivery network (CDN) distributions.\n"]
module GetDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_domain_request ->
        (get_domain_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns information about a specific domain recordset.\n"]
module GetDomains :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_domains_request ->
        (get_domains_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns a list of all domains in the user's account.\n"]
module GetExportSnapshotRecords :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_export_snapshot_records_request ->
        (get_export_snapshot_records_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns all export snapshot records created as a result of the [export\n        snapshot] operation.\n\n An export snapshot record can be used to create a new Amazon EC2 instance and its related resources with the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_CreateCloudFormationStack.html}CreateCloudFormationStack} action.\n "]
module GetInstance :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about a specific Amazon Lightsail instance, which is a virtual private server.\n"]
module GetInstanceAccessDetails :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_access_details_request ->
        (get_instance_access_details_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns temporary SSH keys you can use to connect to a specific virtual private server, or {i instance}.\n\n The [get instance access details] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module GetInstanceMetricData :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_metric_data_request ->
        (get_instance_metric_data_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the data points for the specified Amazon Lightsail instance metric, given an instance name.\n\n Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.\n "]
module GetInstancePortStates :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_port_states_request ->
        (get_instance_port_states_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the firewall port states for a specific Amazon Lightsail instance, the IP addresses allowed to connect to the instance through the ports, and the protocol.\n"]
module GetInstances :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_request ->
        (get_instances_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all Amazon Lightsail virtual private servers, or {i instances}.\n"]
module GetInstanceSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshot_request ->
        (get_instance_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns information about a specific instance snapshot.\n"]
module GetInstanceSnapshots :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_snapshots_request ->
        (get_instance_snapshots_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns all instance snapshots for the user's account.\n"]
module GetInstanceState :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_state_request ->
        (get_instance_state_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the state of a specific instance. Works on one instance at a time.\n"]
module GetKeyPair :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pair_request ->
        (get_key_pair_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns information about a specific key pair.\n"]
module GetKeyPairs :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_key_pairs_request ->
        (get_key_pairs_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all key pairs in the user's account.\n"]
module GetLoadBalancer :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_request ->
        (get_load_balancer_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about the specified Lightsail load balancer.\n"]
module GetLoadBalancerMetricData :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_metric_data_request ->
        (get_load_balancer_metric_data_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about health metrics for your Lightsail load balancer.\n\n Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.\n "]
module GetLoadBalancers :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancers_request ->
        (get_load_balancers_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all load balancers in an account.\n"]
module GetLoadBalancerTlsCertificates :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_certificates_request ->
        (get_load_balancer_tls_certificates_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about the TLS certificates that are associated with the specified Lightsail load balancer.\n\n TLS is just an updated, more secure version of Secure Socket Layer (SSL).\n \n  You can have a maximum of 2 certificates associated with a Lightsail load balancer. One is active and the other is inactive.\n  "]
module GetLoadBalancerTlsPolicies :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_load_balancer_tls_policies_request ->
        (get_load_balancer_tls_policies_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns a list of TLS security policies that you can apply to Lightsail load balancers.\n\n For more information about load balancer TLS security policies, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configure-load-balancer-tls-security-policy}Configuring TLS security policies on your Amazon Lightsail load balancers} in the {i Amazon Lightsail Developer Guide}.\n "]
module GetOperation :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about a specific operation. Operations include events such as when you create an instance, allocate a static IP, attach a static IP, and so on.\n"]
module GetOperations :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_request ->
        (get_operations_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all operations.\n\n Results are returned from oldest to newest, up to a maximum of 200. Results can be paged by making each subsequent call to [GetOperations] use the maximum (last) [statusChangedAt] value from the previous request.\n "]
module GetOperationsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_operations_for_resource_request ->
        (get_operations_for_resource_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Gets operations for a specific resource (an instance or a static IP).\n"]
module GetRegions :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_regions_request ->
        (get_regions_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns a list of all valid regions for Amazon Lightsail. Use the [include\n        availability zones] parameter to also return the Availability Zones in a region.\n"]
module GetRelationalDatabase :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_request ->
        (get_relational_database_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about a specific database in Amazon Lightsail.\n"]
module GetRelationalDatabaseBlueprints :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_blueprints_request ->
        (get_relational_database_blueprints_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns a list of available database blueprints in Amazon Lightsail. A blueprint describes the major engine version of a database.\n\n You can use a blueprint ID to create a new database that runs a specific database engine.\n "]
module GetRelationalDatabaseBundles :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_bundles_request ->
        (get_relational_database_bundles_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the list of bundles that are available in Amazon Lightsail. A bundle describes the performance specifications for a database.\n\n You can use a bundle ID to create a new database with explicit performance specifications.\n "]
module GetRelationalDatabaseEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_events_request ->
        (get_relational_database_events_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns a list of events for a specific database in Amazon Lightsail.\n"]
module GetRelationalDatabaseLogEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_events_request ->
        (get_relational_database_log_events_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns a list of log events for a database in Amazon Lightsail.\n"]
module GetRelationalDatabaseLogStreams :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_log_streams_request ->
        (get_relational_database_log_streams_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns a list of available log streams for a specific database in Amazon Lightsail.\n"]
module GetRelationalDatabaseMasterUserPassword :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_master_user_password_request ->
        (get_relational_database_master_user_password_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the current, previous, or pending versions of the master user password for a Lightsail database.\n\n The [GetRelationalDatabaseMasterUserPassword] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName.\n "]
module GetRelationalDatabaseMetricData :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_metric_data_request ->
        (get_relational_database_metric_data_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns the data points of the specified metric for a database in Amazon Lightsail.\n\n Metrics report the utilization of your resources, and the error counts generated by them. Monitor and collect metric data regularly to maintain the reliability, availability, and performance of your resources.\n "]
module GetRelationalDatabaseParameters :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_parameters_request ->
        (get_relational_database_parameters_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns all of the runtime parameters offered by the underlying database software, or engine, for a specific database in Amazon Lightsail.\n\n In addition to the parameter names and values, this operation returns other information about each parameter. This information includes whether changes require a reboot, whether the parameter is modifiable, the allowed values, and the data types.\n "]
module GetRelationalDatabases :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_databases_request ->
        (get_relational_databases_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all of your databases in Amazon Lightsail.\n"]
module GetRelationalDatabaseSnapshot :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshot_request ->
        (get_relational_database_snapshot_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about a specific database snapshot in Amazon Lightsail.\n"]
module GetRelationalDatabaseSnapshots :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_relational_database_snapshots_request ->
        (get_relational_database_snapshots_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all of your database snapshots in Amazon Lightsail.\n"]
module GetSetupHistory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_setup_history_request ->
        (get_setup_history_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns detailed information for five of the most recent [SetupInstanceHttps] requests that were ran on the target instance.\n"]
module GetStaticIp :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ip_request ->
        (get_static_ip_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Returns information about an Amazon Lightsail static IP.\n"]
module GetStaticIps :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_static_ips_request ->
        (get_static_ips_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns information about all static IPs in the user's account.\n"]
module ImportKeyPair :
sig
  val request :
    Smaws_Lib.Context.t ->
      import_key_pair_request ->
        (import_key_pair_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Imports a public SSH key from a specific key pair.\n"]
module IsVpcPeered :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (is_vpc_peered_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Returns a Boolean value indicating whether your Lightsail VPC is peered.\n"]
module OpenInstancePublicPorts :
sig
  val request :
    Smaws_Lib.Context.t ->
      open_instance_public_ports_request ->
        (open_instance_public_ports_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol.\n\n The [OpenInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module PeerVpc :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (peer_vpc_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Peers the Lightsail VPC with the user's default VPC.\n"]
module PutAlarm :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_alarm_request ->
        (put_alarm_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates or updates an alarm, and associates it with the specified metric.\n\n An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n \n  When this action creates an alarm, the alarm state is immediately set to [INSUFFICIENT_DATA]. The alarm is then evaluated and its state is set appropriately. Any actions associated with the new state are then executed.\n  \n   When you update an existing alarm, its state is left unchanged, but the update completely overwrites the previous configuration of the alarm. The alarm is then evaluated with the updated configuration.\n   "]
module PutInstancePublicPorts :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_instance_public_ports_request ->
        (put_instance_public_ports_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Opens ports for a specific Amazon Lightsail instance, and specifies the IP addresses allowed to connect to the instance through the ports, and the protocol. This action also closes all currently open ports that are not included in the request. Include all of the ports and the protocols you want to open in your [PutInstancePublicPorts]request. Or use the [OpenInstancePublicPorts] action to open ports without closing currently open ports.\n\n The [PutInstancePublicPorts] action supports tag-based access control via resource tags applied to the resource identified by [instanceName]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module RebootInstance :
sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_instance_request ->
        (reboot_instance_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Restarts a specific instance.\n\n The [reboot instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module RebootRelationalDatabase :
sig
  val request :
    Smaws_Lib.Context.t ->
      reboot_relational_database_request ->
        (reboot_relational_database_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Restarts a specific database in Amazon Lightsail.\n\n The [reboot relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module RegisterContainerImage :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_container_image_request ->
        (register_container_image_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Registers a container image to your Amazon Lightsail container service.\n\n  This action is not required if you install and use the Lightsail Control (lightsailctl) plugin to push container images to your Lightsail container service. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-pushing-container-images}Pushing and managing container images on your Amazon Lightsail container services} in the {i Amazon Lightsail Developer Guide}.\n  \n   "]
module ReleaseStaticIp :
sig
  val request :
    Smaws_Lib.Context.t ->
      release_static_ip_request ->
        (release_static_ip_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Deletes a specific static IP from your account.\n"]
module ResetDistributionCache :
sig
  val request :
    Smaws_Lib.Context.t ->
      reset_distribution_cache_request ->
        (reset_distribution_cache_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes currently cached content from your Amazon Lightsail content delivery network (CDN) distribution.\n\n After resetting the cache, the next time a content request is made, your distribution pulls, serves, and caches it from the origin.\n "]
module SendContactMethodVerification :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_contact_method_verification_request ->
        (send_contact_method_verification_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Sends a verification request to an email contact method to ensure it's owned by the requester. SMS contact methods don't need to be verified.\n\n A contact method is used to send you notifications about your Amazon Lightsail resources. You can add one email address and one mobile phone number contact method in each Amazon Web Services Region. However, SMS text messaging is not supported in some Amazon Web Services Regions, and SMS text messages cannot be sent to some countries/regions. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-notifications}Notifications in Amazon Lightsail}.\n \n  A verification request is sent to the contact method when you initially create it. Use this action to send another verification request if a previous verification request was deleted, or has expired.\n  \n    Notifications are not sent to an email contact method until after it is verified, and confirmed as valid.\n    \n     "]
module SetIpAddressType :
sig
  val request :
    Smaws_Lib.Context.t ->
      set_ip_address_type_request ->
        (set_ip_address_type_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Sets the IP address type for an Amazon Lightsail resource.\n\n Use this action to enable dual-stack for a resource, which enables IPv4 and IPv6 for the specified resource. Alternately, you can use this action to disable dual-stack, and enable IPv4 only.\n "]
module SetResourceAccessForBucket :
sig
  val request :
    Smaws_Lib.Context.t ->
      set_resource_access_for_bucket_request ->
        (set_resource_access_for_bucket_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Sets the Amazon Lightsail resources that can access the specified Lightsail bucket.\n\n Lightsail buckets currently support setting access for Lightsail instances in the same Amazon Web Services Region.\n "]
module SetupInstanceHttps :
sig
  val request :
    Smaws_Lib.Context.t ->
      setup_instance_https_request ->
        (setup_instance_https_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Creates an SSL/TLS certificate that secures traffic for your website. After the certificate is created, it is installed on the specified Lightsail instance.\n\n If you provide more than one domain name in the request, at least one name must be less than or equal to 63 characters in length.\n "]
module StartGUISession :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_gui_session_request ->
        (start_gui_session_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Initiates a graphical user interface (GUI) session that\226\128\153s used to access a virtual computer\226\128\153s operating system and application. The session will be active for 1 hour. Use this action to resume the session after it expires. \n"]
module StartInstance :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_instance_request ->
        (start_instance_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Starts a specific Amazon Lightsail instance from a stopped state. To restart an instance, use the [reboot instance] operation.\n\n  When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/lightsail-create-static-ip}Amazon Lightsail Developer Guide}.\n  \n    The [start instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n    "]
module StartRelationalDatabase :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_relational_database_request ->
        (start_relational_database_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Starts a specific database from a stopped state in Amazon Lightsail. To restart a database, use the [reboot relational database] operation.\n\n The [start relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module StopGUISession :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_gui_session_request ->
        (stop_gui_session_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Terminates a web-based Amazon DCV session that\226\128\153s used to access a virtual computer\226\128\153s operating system or application. The session will close and any unsaved data will be lost.\n"]
module StopInstance :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_instance_request ->
        (stop_instance_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Stops a specific Amazon Lightsail instance that is currently running.\n\n  When you start a stopped instance, Lightsail assigns a new public IP address to the instance. To use the same IP address after stopping and starting an instance, create a static IP address and attach it to the instance. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/lightsail-create-static-ip}Amazon Lightsail Developer Guide}.\n  \n    The [stop instance] operation supports tag-based access control via resource tags applied to the resource identified by [instance name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n    "]
module StopRelationalDatabase :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_relational_database_request ->
        (stop_relational_database_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Stops a specific database that is currently running in Amazon Lightsail.\n\n  If you don't manually start your database instance after it has been stopped for seven consecutive days, Amazon Lightsail automatically starts it for you. This action helps ensure that your database instance doesn't fall behind on any required maintenance updates.\n  \n    The [stop relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n    "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Adds one or more tags to the specified Amazon Lightsail resource. Each resource can have a maximum of 50 tags. Each tag consists of a key and an optional value. Tag keys must be unique per resource. For more information about tags, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-tags}Amazon Lightsail Developer Guide}.\n\n The [tag resource] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [resource name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module TestAlarm :
sig
  val request :
    Smaws_Lib.Context.t ->
      test_alarm_request ->
        (test_alarm_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Tests an alarm by displaying a banner on the Amazon Lightsail console. If a notification trigger is configured for the specified alarm, the test also sends a notification to the notification protocol ([Email] and/or [SMS]) configured for the alarm.\n\n An alarm is used to monitor a single metric for one of your resources. When a metric condition is met, the alarm can notify you by email, SMS text message, and a banner displayed on the Amazon Lightsail console. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-alarms}Alarms in Amazon Lightsail}.\n "]
module UnpeerVpc :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (unpeer_vpc_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc "Unpeers the Lightsail VPC from the user's default VPC.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Deletes the specified set of tag keys and their values from the specified Amazon Lightsail resource.\n\n The [untag resource] operation supports tag-based access control via request tags and resource tags applied to the resource identified by [resource name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module UpdateBucket :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_request ->
        (update_bucket_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Updates an existing Amazon Lightsail bucket.\n\n Use this action to update the configuration of an existing bucket, such as versioning, public accessibility, and the Amazon Web Services accounts that can access the bucket.\n "]
module UpdateBucketBundle :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_bucket_bundle_request ->
        (update_bucket_bundle_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Updates the bundle, or storage plan, of an existing Amazon Lightsail bucket.\n\n A bucket bundle specifies the monthly cost, storage space, and data transfer quota for a bucket. You can update a bucket's bundle only one time within a monthly Amazon Web Services billing cycle. To determine if you can update a bucket's bundle, use the {{:https://docs.aws.amazon.com/lightsail/2016-11-28/api-reference/API_GetBuckets.html}GetBuckets} action. The [ableToUpdateBundle] parameter in the response will indicate whether you can currently update a bucket's bundle.\n \n  Update a bucket's bundle if it's consistently going over its storage space or data transfer quota, or if a bucket's usage is consistently in the lower range of its storage space or data transfer quota. Due to the unpredictable usage fluctuations that a bucket might experience, we strongly recommend that you update a bucket's bundle only as a long-term strategy, instead of as a short-term, monthly cost-cutting measure. Choose a bucket bundle that will provide the bucket with ample storage space and data transfer for a long time to come.\n  "]
module UpdateContainerService :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_container_service_request ->
        (update_container_service_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Updates the configuration of your Amazon Lightsail container service, such as its power, scale, and public domain names.\n"]
module UpdateDistribution :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_request ->
        (update_distribution_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Updates an existing Amazon Lightsail content delivery network (CDN) distribution.\n\n Use this action to update the configuration of your existing distribution.\n "]
module UpdateDistributionBundle :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_distribution_bundle_request ->
        (update_distribution_bundle_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Updates the bundle of your Amazon Lightsail content delivery network (CDN) distribution.\n\n A distribution bundle specifies the monthly network transfer quota and monthly cost of your distribution.\n \n  Update your distribution's bundle if your distribution is going over its monthly network transfer quota and is incurring an overage fee.\n  \n   You can update your distribution's bundle only one time within your monthly Amazon Web Services billing cycle. To determine if you can update your distribution's bundle, use the [GetDistributions] action. The [ableToUpdateBundle] parameter in the result will indicate whether you can currently update your distribution's bundle.\n   "]
module UpdateDomainEntry :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_domain_entry_request ->
        (update_domain_entry_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Updates a domain recordset after it is created.\n\n The [update domain entry] operation supports tag-based access control via resource tags applied to the resource identified by [domain name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module UpdateInstanceMetadataOptions :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_metadata_options_request ->
        (update_instance_metadata_options_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Modifies the Amazon Lightsail instance metadata parameters on a running or stopped instance. When you modify the parameters on a running instance, the [GetInstance] or [GetInstances] API operation initially responds with a state of [pending]. After the parameter modifications are successfully applied, the state changes to [applied] in subsequent [GetInstance] or [GetInstances] API calls. For more information, see {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-configuring-instance-metadata-service}Use IMDSv2 with an Amazon Lightsail instance} in the {i Amazon Lightsail Developer Guide}.\n"]
module UpdateLoadBalancerAttribute :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_load_balancer_attribute_request ->
        (update_load_balancer_attribute_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Updates the specified attribute for a load balancer. You can only update one attribute at a time.\n\n The [update load balancer attribute] operation supports tag-based access control via resource tags applied to the resource identified by [load balancer\n        name]. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n "]
module UpdateRelationalDatabase :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_request ->
        (update_relational_database_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Allows the update of one or more attributes of a database in Amazon Lightsail.\n\n Updates are applied immediately, or in cases where the updates could result in an outage, are applied during the database's predefined maintenance window.\n \n  The [update relational database] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]
module UpdateRelationalDatabaseParameters :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_relational_database_parameters_request ->
        (update_relational_database_parameters_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `AccountSetupInProgressException of
              account_setup_in_progress_exception 
          | `InvalidInputException of invalid_input_exception 
          | `NotFoundException of not_found_exception 
          | `OperationFailureException of operation_failure_exception 
          | `ServiceException of service_exception 
          | `UnauthenticatedException of unauthenticated_exception ]) result
end[@@ocaml.doc
     "Allows the update of one or more parameters of a database in Amazon Lightsail.\n\n Parameter updates don't cause outages; therefore, their application is not subject to the preferred maintenance window. However, there are two ways in which parameter updates are applied: [dynamic] or [pending-reboot]. Parameters marked with a [dynamic] apply type are applied immediately. Parameters marked with a [pending-reboot] apply type are applied only after the database is rebooted using the [reboot relational database] operation.\n \n  The [update relational database parameters] operation supports tag-based access control via resource tags applied to the resource identified by relationalDatabaseName. For more information, see the {{:https://docs.aws.amazon.com/lightsail/latest/userguide/amazon-lightsail-controlling-access-using-tags}Amazon Lightsail Developer Guide}.\n  "]