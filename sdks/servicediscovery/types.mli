open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec update_service_response = {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec record_type =
  | CNAME 
  | AAAA 
  | A 
  | SRV [@@ocaml.doc ""]
type nonrec dns_record = {
  tt_l: int ;
  type_: record_type }[@@ocaml.doc
                        "A complex type that contains information about the Route\194\16053 DNS records that you want Cloud Map to create when you register an instance.\n"]
type nonrec dns_config_change = {
  dns_records: dns_record list }[@@ocaml.doc
                                  "A complex type that contains information about changes to the Route\194\16053 DNS records that Cloud Map creates when you register an instance.\n"]
type nonrec health_check_type =
  | TCP 
  | HTTPS 
  | HTTP [@@ocaml.doc ""]
type nonrec health_check_config =
  {
  failure_threshold: int option ;
  resource_path: string option ;
  type_: health_check_type }[@@ocaml.doc
                              " {i Public DNS and HTTP namespaces only.} A complex type that contains settings for an optional health check. If you specify settings for a health check, Cloud Map associates the health check with the records that you specify in [DnsConfig].\n\n  If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.\n  \n    Health checks are basic Route\194\16053 health checks that monitor an Amazon Web Services endpoint. For information about pricing for health checks, see {{:http://aws.amazon.com/route53/pricing/}Amazon Route\194\16053 Pricing}.\n    \n     Note the following about configuring health checks.\n     \n       A and AAAA records  If [DnsConfig] includes configurations for both [A] and [AAAA] records, Cloud Map creates a health check that uses the IPv4 address to check the health of the resource. If the endpoint tthat's specified by the IPv4 address is unhealthy, Route\194\16053 considers both the [A] and [AAAA] records to be unhealthy. \n                           \n                             CNAME records  You can't specify settings for [HealthCheckConfig] when the [DNSConfig] includes [CNAME] for the value of [Type]. If you do, the [CreateService] request will fail with an [InvalidInput] error.\n                                            \n                                              Request interval  A Route\194\16053 health checker in each health-checking Amazon Web Services Region sends a health check request to an endpoint every 30 seconds. On average, your endpoint receives a health check request about every two seconds. However, health checkers don't coordinate with one another. Therefore, you might sometimes see several requests in one second that's followed by a few seconds with no health checks at all.\n                                                                \n                                                                  Health checking regions  \nHealth checkers perform checks from all Route\194\16053 health-checking Regions. For a list of the current Regions, see {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions}Regions}.\n\n  Alias records  When you register an instance, if you include the [AWS_ALIAS_DNS_NAME] attribute, Cloud Map creates a Route\194\16053 alias record. Note the following:\n                 \n                  {ul\n                        {-  Route\194\16053 automatically sets [EvaluateTargetHealth] to true for alias records. When [EvaluateTargetHealth] is true, the alias record inherits the health of the referenced Amazon Web Services resource. such as an ELB load balancer. For more information, see {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-EvaluateTargetHealth}EvaluateTargetHealth}.\n                            \n                             }\n                        {-  If you include [HealthCheckConfig] and then use the service to register an instance that creates an alias record, Route\194\16053 doesn't create the health check.\n                            \n                             }\n                        }\n    Charges for health checks  Health checks are basic Route\194\16053 health checks that monitor an Amazon Web Services endpoint. For information about pricing for health checks, see {{:http://aws.amazon.com/route53/pricing/}Amazon Route\194\16053 Pricing}.\n                               \n                                 "]
type nonrec service_change =
  {
  health_check_config: health_check_config option ;
  dns_config: dns_config_change option ;
  description: string option }[@@ocaml.doc
                                "A complex type that contains changes to an existing service.\n"]
type nonrec update_service_request = {
  service: service_change ;
  id: string }[@@ocaml.doc ""]
type nonrec service_not_found = {
  message: string option }[@@ocaml.doc
                            "No service exists with the specified ID.\n"]
type nonrec invalid_input = {
  message: string option }[@@ocaml.doc
                            "One or more specified values aren't valid. For example, a required value might be missing, a numeric value might be outside the allowed range, or a string value might exceed length constraints.\n"]
type nonrec duplicate_request =
  {
  duplicate_operation_id: string option ;
  message: string option }[@@ocaml.doc
                            "The operation is already in progress.\n"]
type nonrec update_public_dns_namespace_response =
  {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec soa_change = {
  tt_l: int }[@@ocaml.doc
               "Updated Start of Authority (SOA) properties for a public or private DNS namespace.\n"]
type nonrec public_dns_properties_mutable_change = {
  so_a: soa_change }[@@ocaml.doc
                      "Updated DNS properties for the public DNS namespace.\n"]
type nonrec public_dns_namespace_properties_change =
  {
  dns_properties: public_dns_properties_mutable_change }[@@ocaml.doc
                                                          "Updated properties for the public DNS namespace.\n"]
type nonrec public_dns_namespace_change =
  {
  properties: public_dns_namespace_properties_change option ;
  description: string option }[@@ocaml.doc
                                "Updated properties for the public DNS namespace.\n"]
type nonrec update_public_dns_namespace_request =
  {
  namespace: public_dns_namespace_change ;
  updater_request_id: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec resource_in_use = {
  message: string option }[@@ocaml.doc
                            "The specified resource can't be deleted because it contains other resources. For example, you can't delete a service that contains any instances.\n"]
type nonrec namespace_not_found = {
  message: string option }[@@ocaml.doc
                            "No namespace exists with the specified ID.\n"]
type nonrec update_private_dns_namespace_response =
  {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec private_dns_properties_mutable_change = {
  so_a: soa_change }[@@ocaml.doc
                      "Updated DNS properties for the private DNS namespace.\n"]
type nonrec private_dns_namespace_properties_change =
  {
  dns_properties: private_dns_properties_mutable_change }[@@ocaml.doc
                                                           "Updated properties for the private DNS namespace.\n"]
type nonrec private_dns_namespace_change =
  {
  properties: private_dns_namespace_properties_change option ;
  description: string option }[@@ocaml.doc
                                "Updated properties for the private DNS namespace.\n"]
type nonrec update_private_dns_namespace_request =
  {
  namespace: private_dns_namespace_change ;
  updater_request_id: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec custom_health_status =
  | UNHEALTHY 
  | HEALTHY [@@ocaml.doc ""]
type nonrec update_instance_custom_health_status_request =
  {
  status: custom_health_status ;
  instance_id: string ;
  service_id: string }[@@ocaml.doc ""]
type nonrec instance_not_found = {
  message: string option }[@@ocaml.doc
                            "No instance exists with the specified ID, or the instance was recently registered, and information about the instance hasn't propagated yet.\n"]
type nonrec custom_health_not_found = {
  message: string option }[@@ocaml.doc
                            "The health check for the instance that's specified by [ServiceId] and [InstanceId] isn't a custom health check. \n"]
type nonrec update_http_namespace_response = {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec http_namespace_change = {
  description: string }[@@ocaml.doc
                         "Updated properties for the HTTP namespace.\n"]
type nonrec update_http_namespace_request =
  {
  namespace: http_namespace_change ;
  updater_request_id: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The operation can't be completed because the resource was not found.\n"]
type nonrec too_many_tags_exception =
  {
  resource_name: string option ;
  message: string option }[@@ocaml.doc
                            "The list of tags on the resource is over the quota. The maximum number of tags that can be applied to a resource is 50.\n"]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A custom key-value pair that's associated with a resource.\n"]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec service_type_option =
  | HTTP [@@ocaml.doc ""]
type nonrec service_type =
  | DNS 
  | DNS_HTTP 
  | HTTP [@@ocaml.doc ""]
type nonrec routing_policy =
  | WEIGHTED 
  | MULTIVALUE [@@ocaml.doc ""]
type nonrec dns_config =
  {
  dns_records: dns_record list ;
  routing_policy: routing_policy option ;
  namespace_id: string option }[@@ocaml.doc
                                 "A complex type that contains information about the Amazon Route\194\16053 DNS records that you want Cloud Map to create when you register an instance.\n\n  The record types of a service can only be changed by deleting the service and recreating it with a new [Dnsconfig].\n  \n   "]
type nonrec health_check_custom_config = {
  failure_threshold: int option }[@@ocaml.doc
                                   "A complex type that contains information about an optional custom health check. A custom health check, which requires that you use a third-party health checker to evaluate the health of your resources, is useful in the following circumstances:\n\n {ul\n       {-  You can't use a health check that's defined by [HealthCheckConfig] because the resource isn't available over the internet. For example, you can use a custom health check when the instance is in an Amazon VPC. (To check the health of resources in a VPC, the health checker must also be in the VPC.)\n           \n            }\n       {-  You want to use a third-party health checker regardless of where your resources are located.\n           \n            }\n       }\n    If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.\n    \n      To change the status of a custom health check, submit an [UpdateInstanceCustomHealthStatus] request. Cloud Map doesn't monitor the status of the resource, it just keeps a record of the status specified in the most recent [UpdateInstanceCustomHealthStatus] request.\n      \n       Here's how custom health checks work:\n       \n        {ol\n              {-  You create a service.\n                  \n                   }\n              {-  You register an instance.\n                  \n                   }\n              {-  You configure a third-party health checker to monitor the resource that's associated with the new instance. \n                  \n                    Cloud Map doesn't check the health of the resource directly. \n                    \n                      }\n              {-  The third-party health-checker determines that the resource is unhealthy and notifies your application.\n                  \n                   }\n              {-  Your application submits an [UpdateInstanceCustomHealthStatus] request.\n                  \n                   }\n              {-  Cloud Map waits for 30 seconds.\n                  \n                   }\n              {-  If another [UpdateInstanceCustomHealthStatus] request doesn't arrive during that time to change the status back to healthy, Cloud Map stops routing traffic to the resource.\n                  \n                   }\n              }\n  "]
type nonrec service_summary =
  {
  create_date: CoreTypes.Timestamp.t option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  dns_config: dns_config option ;
  instance_count: int option ;
  description: string option ;
  type_: service_type option ;
  name: string option ;
  arn: string option ;
  id: string option }[@@ocaml.doc
                       "A complex type that contains information about a specified service.\n"]
type nonrec service_filter_name =
  | NAMESPACE_ID [@@ocaml.doc ""]
type nonrec filter_condition =
  | BEGINS_WITH 
  | BETWEEN 
  | IN 
  | EQ [@@ocaml.doc ""]
type nonrec service_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: service_filter_name }[@@ocaml.doc
                               "A complex type that lets you specify the namespaces that you want to list services for.\n"]
type nonrec service_already_exists =
  {
  service_id: string option ;
  creator_request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The service can't be created because a service with the same name already exists.\n"]
type nonrec service =
  {
  creator_request_id: string option ;
  create_date: CoreTypes.Timestamp.t option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  type_: service_type option ;
  dns_config: dns_config option ;
  instance_count: int option ;
  description: string option ;
  namespace_id: string option ;
  name: string option ;
  arn: string option ;
  id: string option }[@@ocaml.doc
                       "A complex type that contains information about the specified service.\n"]
type nonrec so_a = {
  tt_l: int }[@@ocaml.doc
               "Start of Authority (SOA) properties for a public or private DNS namespace.\n"]
type nonrec resource_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "The resource can't be created because you've reached the quota on the number of resources.\n"]
type nonrec register_instance_response = {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec attributes = (string * string) list[@@ocaml.doc ""]
type nonrec register_instance_request =
  {
  attributes: attributes ;
  creator_request_id: string option ;
  instance_id: string ;
  service_id: string }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec list_services_response =
  {
  next_token: string option ;
  services: service_summary list option }[@@ocaml.doc ""]
type nonrec list_services_request =
  {
  filters: service_filter list option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec operation_status =
  | FAIL 
  | SUCCESS 
  | PENDING 
  | SUBMITTED [@@ocaml.doc ""]
type nonrec operation_summary =
  {
  status: operation_status option ;
  id: string option }[@@ocaml.doc
                       "A complex type that contains information about an operation that matches the criteria that you specified in a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html}ListOperations} request.\n"]
type nonrec list_operations_response =
  {
  next_token: string option ;
  operations: operation_summary list option }[@@ocaml.doc ""]
type nonrec operation_filter_name =
  | UPDATE_DATE 
  | TYPE 
  | STATUS 
  | SERVICE_ID 
  | NAMESPACE_ID [@@ocaml.doc ""]
type nonrec operation_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: operation_filter_name }[@@ocaml.doc
                                 "A complex type that lets you select the operations that you want to list.\n"]
type nonrec list_operations_request =
  {
  filters: operation_filter list option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec namespace_type =
  | HTTP 
  | DNS_PRIVATE 
  | DNS_PUBLIC [@@ocaml.doc ""]
type nonrec dns_properties =
  {
  so_a: so_a option ;
  hosted_zone_id: string option }[@@ocaml.doc
                                   "A complex type that contains the ID for the Route\194\16053 hosted zone that Cloud Map creates when you create a namespace.\n"]
type nonrec http_properties = {
  http_name: string option }[@@ocaml.doc
                              "A complex type that contains the name of an HTTP namespace.\n"]
type nonrec namespace_properties =
  {
  http_properties: http_properties option ;
  dns_properties: dns_properties option }[@@ocaml.doc
                                           "A complex type that contains information that's specific to the namespace type.\n"]
type nonrec namespace_summary =
  {
  create_date: CoreTypes.Timestamp.t option ;
  properties: namespace_properties option ;
  service_count: int option ;
  description: string option ;
  type_: namespace_type option ;
  name: string option ;
  arn: string option ;
  id: string option }[@@ocaml.doc
                       "A complex type that contains information about a namespace.\n"]
type nonrec list_namespaces_response =
  {
  next_token: string option ;
  namespaces: namespace_summary list option }[@@ocaml.doc ""]
type nonrec namespace_filter_name =
  | HTTP_NAME 
  | NAME 
  | TYPE [@@ocaml.doc ""]
type nonrec namespace_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: namespace_filter_name }[@@ocaml.doc
                                 "A complex type that identifies the namespaces that you want to list. You can choose to list public or private namespaces.\n"]
type nonrec list_namespaces_request =
  {
  filters: namespace_filter list option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec instance_summary =
  {
  attributes: attributes option ;
  id: string option }[@@ocaml.doc
                       "A complex type that contains information about the instances that you registered by using a specified service.\n"]
type nonrec list_instances_response =
  {
  next_token: string option ;
  instances: instance_summary list option }[@@ocaml.doc ""]
type nonrec list_instances_request =
  {
  max_results: int option ;
  next_token: string option ;
  service_id: string }[@@ocaml.doc ""]
type nonrec get_service_response = {
  service: service option }[@@ocaml.doc ""]
type nonrec get_service_request = {
  id: string }[@@ocaml.doc ""]
type nonrec operation_not_found = {
  message: string option }[@@ocaml.doc
                            "No operation exists with the specified ID.\n"]
type nonrec operation_type =
  | DEREGISTER_INSTANCE 
  | REGISTER_INSTANCE 
  | UPDATE_SERVICE 
  | UPDATE_NAMESPACE 
  | DELETE_NAMESPACE 
  | CREATE_NAMESPACE [@@ocaml.doc ""]
type nonrec operation_target_type =
  | INSTANCE 
  | SERVICE 
  | NAMESPACE [@@ocaml.doc ""]
type nonrec operation_targets_map = (operation_target_type * string) list
[@@ocaml.doc ""]
type nonrec operation =
  {
  targets: operation_targets_map option ;
  update_date: CoreTypes.Timestamp.t option ;
  create_date: CoreTypes.Timestamp.t option ;
  error_code: string option ;
  error_message: string option ;
  status: operation_status option ;
  type_: operation_type option ;
  id: string option }[@@ocaml.doc
                       "A complex type that contains information about a specified operation.\n"]
type nonrec get_operation_response = {
  operation: operation option }[@@ocaml.doc ""]
type nonrec get_operation_request = {
  operation_id: string }[@@ocaml.doc ""]
type nonrec namespace =
  {
  creator_request_id: string option ;
  create_date: CoreTypes.Timestamp.t option ;
  properties: namespace_properties option ;
  service_count: int option ;
  description: string option ;
  type_: namespace_type option ;
  name: string option ;
  arn: string option ;
  id: string option }[@@ocaml.doc
                       "A complex type that contains information about a specified namespace.\n"]
type nonrec get_namespace_response = {
  namespace: namespace option }[@@ocaml.doc ""]
type nonrec get_namespace_request = {
  id: string }[@@ocaml.doc ""]
type nonrec health_status =
  | UNKNOWN 
  | UNHEALTHY 
  | HEALTHY [@@ocaml.doc ""]
type nonrec instance_health_status_map = (string * health_status) list
[@@ocaml.doc ""]
type nonrec get_instances_health_status_response =
  {
  next_token: string option ;
  status: instance_health_status_map option }[@@ocaml.doc ""]
type nonrec get_instances_health_status_request =
  {
  next_token: string option ;
  max_results: int option ;
  instances: string list option ;
  service_id: string }[@@ocaml.doc ""]
type nonrec instance =
  {
  attributes: attributes option ;
  creator_request_id: string option ;
  id: string }[@@ocaml.doc
                "A complex type that contains information about an instance that Cloud Map creates when you submit a [RegisterInstance] request.\n"]
type nonrec get_instance_response = {
  instance: instance option }[@@ocaml.doc ""]
type nonrec get_instance_request = {
  instance_id: string ;
  service_id: string }[@@ocaml.doc ""]
type nonrec request_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "The operation can't be completed because you've reached the quota for the number of requests. For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/throttling.html}Cloud Map API request throttling quota} in the {i Cloud Map Developer Guide}.\n"]
type nonrec discover_instances_revision_response =
  {
  instances_revision: int option }[@@ocaml.doc ""]
type nonrec discover_instances_revision_request =
  {
  service_name: string ;
  namespace_name: string }[@@ocaml.doc ""]
type nonrec http_instance_summary =
  {
  attributes: attributes option ;
  health_status: health_status option ;
  service_name: string option ;
  namespace_name: string option ;
  instance_id: string option }[@@ocaml.doc
                                "In a response to a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html}DiscoverInstances} request, [HttpInstanceSummary] contains information about one instance that matches the values that you specified in the request.\n"]
type nonrec discover_instances_response =
  {
  instances_revision: int option ;
  instances: http_instance_summary list option }[@@ocaml.doc ""]
type nonrec health_status_filter =
  | HEALTHY_OR_ELSE_ALL 
  | ALL 
  | UNHEALTHY 
  | HEALTHY [@@ocaml.doc ""]
type nonrec discover_instances_request =
  {
  health_status: health_status_filter option ;
  optional_parameters: attributes option ;
  query_parameters: attributes option ;
  max_results: int option ;
  service_name: string ;
  namespace_name: string }[@@ocaml.doc ""]
type nonrec deregister_instance_response = {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec deregister_instance_request =
  {
  instance_id: string ;
  service_id: string }[@@ocaml.doc ""]
type nonrec delete_service_response = unit
type nonrec delete_service_request = {
  id: string }[@@ocaml.doc ""]
type nonrec delete_namespace_response = {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec delete_namespace_request = {
  id: string }[@@ocaml.doc ""]
type nonrec create_service_response = {
  service: service option }[@@ocaml.doc ""]
type nonrec create_service_request =
  {
  type_: service_type_option option ;
  tags: tag list option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  dns_config: dns_config option ;
  description: string option ;
  creator_request_id: string option ;
  namespace_id: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec namespace_already_exists =
  {
  namespace_id: string option ;
  creator_request_id: string option ;
  message: string option }[@@ocaml.doc
                            "The namespace that you're trying to create already exists.\n"]
type nonrec create_public_dns_namespace_response =
  {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec public_dns_properties_mutable = {
  so_a: so_a }[@@ocaml.doc "DNS properties for the public DNS namespace.\n"]
type nonrec public_dns_namespace_properties =
  {
  dns_properties: public_dns_properties_mutable }[@@ocaml.doc
                                                   "DNS properties for the public DNS namespace.\n"]
type nonrec create_public_dns_namespace_request =
  {
  properties: public_dns_namespace_properties option ;
  tags: tag list option ;
  description: string option ;
  creator_request_id: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_private_dns_namespace_response =
  {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec private_dns_properties_mutable = {
  so_a: so_a }[@@ocaml.doc "DNS properties for the private DNS namespace.\n"]
type nonrec private_dns_namespace_properties =
  {
  dns_properties: private_dns_properties_mutable }[@@ocaml.doc
                                                    "DNS properties for the private DNS namespace.\n"]
type nonrec create_private_dns_namespace_request =
  {
  properties: private_dns_namespace_properties option ;
  tags: tag list option ;
  vpc: string ;
  description: string option ;
  creator_request_id: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_http_namespace_response = {
  operation_id: string option }[@@ocaml.doc ""]
type nonrec create_http_namespace_request =
  {
  tags: tag list option ;
  description: string option ;
  creator_request_id: string option ;
  name: string }[@@ocaml.doc ""]