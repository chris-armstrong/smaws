(** 
    ServiceDiscovery client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

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
  name: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_update_service_response :
  ?operation_id:string -> unit -> update_service_response
val make_dns_record : tt_l:int -> type_:record_type -> unit -> dns_record
val make_dns_config_change :
  dns_records:dns_record list -> unit -> dns_config_change
val make_health_check_config :
  ?failure_threshold:int ->
    ?resource_path:string ->
      type_:health_check_type -> unit -> health_check_config
val make_service_change :
  ?health_check_config:health_check_config ->
    ?dns_config:dns_config_change ->
      ?description:string -> unit -> service_change
val make_update_service_request :
  service:service_change -> id:string -> unit -> update_service_request
val make_update_public_dns_namespace_response :
  ?operation_id:string -> unit -> update_public_dns_namespace_response
val make_soa_change : tt_l:int -> unit -> soa_change
val make_public_dns_properties_mutable_change :
  so_a:soa_change -> unit -> public_dns_properties_mutable_change
val make_public_dns_namespace_properties_change :
  dns_properties:public_dns_properties_mutable_change ->
    unit -> public_dns_namespace_properties_change
val make_public_dns_namespace_change :
  ?properties:public_dns_namespace_properties_change ->
    ?description:string -> unit -> public_dns_namespace_change
val make_update_public_dns_namespace_request :
  ?updater_request_id:string ->
    namespace:public_dns_namespace_change ->
      id:string -> unit -> update_public_dns_namespace_request
val make_update_private_dns_namespace_response :
  ?operation_id:string -> unit -> update_private_dns_namespace_response
val make_private_dns_properties_mutable_change :
  so_a:soa_change -> unit -> private_dns_properties_mutable_change
val make_private_dns_namespace_properties_change :
  dns_properties:private_dns_properties_mutable_change ->
    unit -> private_dns_namespace_properties_change
val make_private_dns_namespace_change :
  ?properties:private_dns_namespace_properties_change ->
    ?description:string -> unit -> private_dns_namespace_change
val make_update_private_dns_namespace_request :
  ?updater_request_id:string ->
    namespace:private_dns_namespace_change ->
      id:string -> unit -> update_private_dns_namespace_request
val make_update_instance_custom_health_status_request :
  status:custom_health_status ->
    instance_id:string ->
      service_id:string ->
        unit -> update_instance_custom_health_status_request
val make_update_http_namespace_response :
  ?operation_id:string -> unit -> update_http_namespace_response
val make_http_namespace_change :
  description:string -> unit -> http_namespace_change
val make_update_http_namespace_request :
  ?updater_request_id:string ->
    namespace:http_namespace_change ->
      id:string -> unit -> update_http_namespace_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_tag_resource_response : unit -> tag_resource_response
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_dns_config :
  ?routing_policy:routing_policy ->
    ?namespace_id:string -> dns_records:dns_record list -> unit -> dns_config
val make_health_check_custom_config :
  ?failure_threshold:int -> unit -> health_check_custom_config
val make_service_summary :
  ?create_date:CoreTypes.Timestamp.t ->
    ?health_check_custom_config:health_check_custom_config ->
      ?health_check_config:health_check_config ->
        ?dns_config:dns_config ->
          ?instance_count:int ->
            ?description:string ->
              ?type_:service_type ->
                ?name:string ->
                  ?arn:string -> ?id:string -> unit -> service_summary
val make_service_filter :
  ?condition:filter_condition ->
    values:string list -> name:service_filter_name -> unit -> service_filter
val make_service :
  ?creator_request_id:string ->
    ?create_date:CoreTypes.Timestamp.t ->
      ?health_check_custom_config:health_check_custom_config ->
        ?health_check_config:health_check_config ->
          ?type_:service_type ->
            ?dns_config:dns_config ->
              ?instance_count:int ->
                ?description:string ->
                  ?namespace_id:string ->
                    ?name:string ->
                      ?arn:string -> ?id:string -> unit -> service
val make_so_a : tt_l:int -> unit -> so_a
val make_register_instance_response :
  ?operation_id:string -> unit -> register_instance_response
val make_register_instance_request :
  ?creator_request_id:string ->
    attributes:attributes ->
      instance_id:string ->
        service_id:string -> unit -> register_instance_request
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_list_services_response :
  ?next_token:string ->
    ?services:service_summary list -> unit -> list_services_response
val make_list_services_request :
  ?filters:service_filter list ->
    ?max_results:int -> ?next_token:string -> unit -> list_services_request
val make_operation_summary :
  ?status:operation_status -> ?id:string -> unit -> operation_summary
val make_list_operations_response :
  ?next_token:string ->
    ?operations:operation_summary list -> unit -> list_operations_response
val make_operation_filter :
  ?condition:filter_condition ->
    values:string list ->
      name:operation_filter_name -> unit -> operation_filter
val make_list_operations_request :
  ?filters:operation_filter list ->
    ?max_results:int -> ?next_token:string -> unit -> list_operations_request
val make_dns_properties :
  ?so_a:so_a -> ?hosted_zone_id:string -> unit -> dns_properties
val make_http_properties : ?http_name:string -> unit -> http_properties
val make_namespace_properties :
  ?http_properties:http_properties ->
    ?dns_properties:dns_properties -> unit -> namespace_properties
val make_namespace_summary :
  ?create_date:CoreTypes.Timestamp.t ->
    ?properties:namespace_properties ->
      ?service_count:int ->
        ?description:string ->
          ?type_:namespace_type ->
            ?name:string ->
              ?arn:string -> ?id:string -> unit -> namespace_summary
val make_list_namespaces_response :
  ?next_token:string ->
    ?namespaces:namespace_summary list -> unit -> list_namespaces_response
val make_namespace_filter :
  ?condition:filter_condition ->
    values:string list ->
      name:namespace_filter_name -> unit -> namespace_filter
val make_list_namespaces_request :
  ?filters:namespace_filter list ->
    ?max_results:int -> ?next_token:string -> unit -> list_namespaces_request
val make_instance_summary :
  ?attributes:attributes -> ?id:string -> unit -> instance_summary
val make_list_instances_response :
  ?next_token:string ->
    ?instances:instance_summary list -> unit -> list_instances_response
val make_list_instances_request :
  ?max_results:int ->
    ?next_token:string -> service_id:string -> unit -> list_instances_request
val make_get_service_response :
  ?service:service -> unit -> get_service_response
val make_get_service_request : id:string -> unit -> get_service_request
val make_operation :
  ?targets:operation_targets_map ->
    ?update_date:CoreTypes.Timestamp.t ->
      ?create_date:CoreTypes.Timestamp.t ->
        ?error_code:string ->
          ?error_message:string ->
            ?status:operation_status ->
              ?type_:operation_type -> ?id:string -> unit -> operation
val make_get_operation_response :
  ?operation:operation -> unit -> get_operation_response
val make_get_operation_request :
  operation_id:string -> unit -> get_operation_request
val make_namespace :
  ?creator_request_id:string ->
    ?create_date:CoreTypes.Timestamp.t ->
      ?properties:namespace_properties ->
        ?service_count:int ->
          ?description:string ->
            ?type_:namespace_type ->
              ?name:string -> ?arn:string -> ?id:string -> unit -> namespace
val make_get_namespace_response :
  ?namespace:namespace -> unit -> get_namespace_response
val make_get_namespace_request : id:string -> unit -> get_namespace_request
val make_get_instances_health_status_response :
  ?next_token:string ->
    ?status:instance_health_status_map ->
      unit -> get_instances_health_status_response
val make_get_instances_health_status_request :
  ?next_token:string ->
    ?max_results:int ->
      ?instances:string list ->
        service_id:string -> unit -> get_instances_health_status_request
val make_instance :
  ?attributes:attributes ->
    ?creator_request_id:string -> id:string -> unit -> instance
val make_get_instance_response :
  ?instance:instance -> unit -> get_instance_response
val make_get_instance_request :
  instance_id:string -> service_id:string -> unit -> get_instance_request
val make_discover_instances_revision_response :
  ?instances_revision:int -> unit -> discover_instances_revision_response
val make_discover_instances_revision_request :
  service_name:string ->
    namespace_name:string -> unit -> discover_instances_revision_request
val make_http_instance_summary :
  ?attributes:attributes ->
    ?health_status:health_status ->
      ?service_name:string ->
        ?namespace_name:string ->
          ?instance_id:string -> unit -> http_instance_summary
val make_discover_instances_response :
  ?instances_revision:int ->
    ?instances:http_instance_summary list ->
      unit -> discover_instances_response
val make_discover_instances_request :
  ?health_status:health_status_filter ->
    ?optional_parameters:attributes ->
      ?query_parameters:attributes ->
        ?max_results:int ->
          service_name:string ->
            namespace_name:string -> unit -> discover_instances_request
val make_deregister_instance_response :
  ?operation_id:string -> unit -> deregister_instance_response
val make_deregister_instance_request :
  instance_id:string ->
    service_id:string -> unit -> deregister_instance_request
val make_delete_service_response : unit -> delete_service_response
val make_delete_service_request : id:string -> unit -> delete_service_request
val make_delete_namespace_response :
  ?operation_id:string -> unit -> delete_namespace_response
val make_delete_namespace_request :
  id:string -> unit -> delete_namespace_request
val make_create_service_response :
  ?service:service -> unit -> create_service_response
val make_create_service_request :
  ?type_:service_type_option ->
    ?tags:tag list ->
      ?health_check_custom_config:health_check_custom_config ->
        ?health_check_config:health_check_config ->
          ?dns_config:dns_config ->
            ?description:string ->
              ?creator_request_id:string ->
                ?namespace_id:string ->
                  name:string -> unit -> create_service_request
val make_create_public_dns_namespace_response :
  ?operation_id:string -> unit -> create_public_dns_namespace_response
val make_public_dns_properties_mutable :
  so_a:so_a -> unit -> public_dns_properties_mutable
val make_public_dns_namespace_properties :
  dns_properties:public_dns_properties_mutable ->
    unit -> public_dns_namespace_properties
val make_create_public_dns_namespace_request :
  ?properties:public_dns_namespace_properties ->
    ?tags:tag list ->
      ?description:string ->
        ?creator_request_id:string ->
          name:string -> unit -> create_public_dns_namespace_request
val make_create_private_dns_namespace_response :
  ?operation_id:string -> unit -> create_private_dns_namespace_response
val make_private_dns_properties_mutable :
  so_a:so_a -> unit -> private_dns_properties_mutable
val make_private_dns_namespace_properties :
  dns_properties:private_dns_properties_mutable ->
    unit -> private_dns_namespace_properties
val make_create_private_dns_namespace_request :
  ?properties:private_dns_namespace_properties ->
    ?tags:tag list ->
      ?description:string ->
        ?creator_request_id:string ->
          vpc:string ->
            name:string -> unit -> create_private_dns_namespace_request
val make_create_http_namespace_response :
  ?operation_id:string -> unit -> create_http_namespace_response
val make_create_http_namespace_request :
  ?tags:tag list ->
    ?description:string ->
      ?creator_request_id:string ->
        name:string -> unit -> create_http_namespace_request(** {1:operations Operations} *)

module CreateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_http_namespace_request ->
        (create_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** Creates an HTTP namespace. Service instances registered using an HTTP namespace can be discovered using a [DiscoverInstances] request but can't be discovered using DNS.

 For the current quota on the number of namespaces that you can create using the same Amazon Web Services account, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
  *)

  
end

module CreatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_private_dns_namespace_request ->
        (create_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** Creates a private namespace based on DNS, which is visible only inside a specified Amazon VPC. The namespace defines your service naming scheme. For example, if you name your namespace [example.com] and name your service [backend], the resulting DNS name for the service is [backend.example.com]. Service instances that are registered using a private DNS namespace can be discovered using either a [DiscoverInstances] request or using DNS. For the current quota on the number of namespaces that you can create using the same Amazon Web Services account, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
 *)

  
end

module CreatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_public_dns_namespace_request ->
        (create_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** Creates a public namespace based on DNS, which is visible on the internet. The namespace defines your service naming scheme. For example, if you name your namespace [example.com] and name your service [backend], the resulting DNS name for the service is [backend.example.com]. You can discover instances that were registered with a public DNS namespace by using either a [DiscoverInstances] request or using DNS. For the current quota on the number of namespaces that you can create using the same Amazon Web Services account, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.

  The [CreatePublicDnsNamespace] API operation is not supported in the Amazon Web Services GovCloud (US) Regions.
  
    *)

  
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_request ->
        (create_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceAlreadyExists of service_already_exists
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** Creates a service. This action defines the configuration for the following entities:

 {ul
       {-  For public and private DNS namespaces, one of the following combinations of DNS records in Amazon Route 53:
           
            {ul
                  {-   [A] 
                      
                       }
                  {-   [AAAA] 
                      
                       }
                  {-   [A] and [AAAA] 
                      
                       }
                  {-   [SRV] 
                      
                       }
                  {-   [CNAME] 
                      
                       }
                  
        }
         }
       {-  Optionally, a health check
           
            }
       }
   After you create the service, you can submit a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} request, and Cloud Map uses the values in the configuration to create the specified entities.
   
    For the current quota on the number of instances that you can register using the same namespace and using the same service, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
     *)

  
end

module DeleteNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_namespace_request ->
        (delete_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** Deletes a namespace from the current account. If the namespace still contains one or more services, the request fails.
 *)

  
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_request ->
        (delete_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Deletes a specified service. If the service still contains one or more registered instances, the request fails.
 *)

  
end

module DeregisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_instance_request ->
        (deregister_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Deletes the Amazon Route 53 DNS records and health check, if any, that Cloud Map created for the specified instance.
 *)

  
end

module DiscoverInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_request ->
        (discover_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Discovers registered instances for a specified namespace and service. You can use [DiscoverInstances] to discover instances for any type of namespace. [DiscoverInstances] returns a randomized list of instances allowing customers to distribute traffic evenly across instances. For public and private DNS namespaces, you can also use DNS queries to discover instances.
 *)

  
end

module DiscoverInstancesRevision : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_revision_request ->
        (discover_instances_revision_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Discovers the increasing revision associated with an instance.
 *)

  
end

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Gets information about a specified instance.
 *)

  
end

module GetInstancesHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_health_status_request ->
        (get_instances_health_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Gets the current health status ([Healthy], [Unhealthy], or [Unknown]) of one or more instances that are associated with a specified service.

  There's a brief delay between when you register an instance and when the health status for the instance is available. 
  
    *)

  
end

module GetNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      get_namespace_request ->
        (get_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            
        ]
      ) result
  (** Gets information about a namespace.
 *)

  
end

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `OperationNotFound of operation_not_found
            
        ]
      ) result
  (** Gets information about any operation that returns an operation ID in the response, such as a [CreateHttpNamespace] request.

  To get a list of operations that match specified criteria, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html}ListOperations}.
  
    *)

  
end

module GetService : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_request ->
        (get_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Gets the settings for a specified service.
 *)

  
end

module ListInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      list_instances_request ->
        (list_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Lists summary information about the instances that you registered by using a specified service.
 *)

  
end

module ListNamespaces : sig
  val request :
    Smaws_Lib.Context.t ->
      list_namespaces_request ->
        (list_namespaces_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
  (** Lists summary information about the namespaces that were created by the current Amazon Web Services account.
 *)

  
end

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_operations_request ->
        (list_operations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
  (** Lists operations that match the criteria that you specify.
 *)

  
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_request ->
        (list_services_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
  (** Lists summary information for all the services that are associated with one or more namespaces.
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Lists tags for the specified resource.
 *)

  
end

module RegisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      register_instance_request ->
        (register_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Creates or updates one or more records and, optionally, creates a health check based on the settings in a specified service. When you submit a [RegisterInstance] request, the following occurs:

 {ul
       {-  For each DNS record that you define in the service that's specified by [ServiceId], a record is created or updated in the hosted zone that's associated with the corresponding namespace.
           
            }
       {-  If the service includes [HealthCheckConfig], a health check is created based on the settings in the health check configuration.
           
            }
       {-  The health check, if any, is associated with each of the new or updated records.
           
            }
       }
    One [RegisterInstance] request must complete before you can submit another request and specify the same service ID and instance ID.
    
      For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html}CreateService}.
      
       When Cloud Map receives a DNS query for the specified DNS name, it returns the applicable value:
       
        {ul
              {-   {b If the health check is healthy}: returns all the records
                  
                   }
              {-   {b If the health check is unhealthy}: returns the applicable value for the last healthy instance
                  
                   }
              {-   {b If you didn't specify a health check configuration}: returns all the records
                  
                   }
              }
   For the current quota on the number of instances that you can register using the same namespace and using the same service, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
    *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** Adds one or more tags to the specified resource.
 *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes one or more tags from the specified resource.
 *)

  
end

module UpdateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_http_namespace_request ->
        (update_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** Updates an HTTP namespace.
 *)

  
end

module UpdateInstanceCustomHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_custom_health_status_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomHealthNotFound of custom_health_not_found
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Submits a request to change the health status of a custom health check to healthy or unhealthy.

 You can use [UpdateInstanceCustomHealthStatus] to change the status only for custom health checks, which you define using [HealthCheckCustomConfig] when you create a service. You can't use it to change the status for Route 53 health checks, which you define using [HealthCheckConfig].
 
  For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_HealthCheckCustomConfig.html}HealthCheckCustomConfig}.
   *)

  
end

module UpdatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_private_dns_namespace_request ->
        (update_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** Updates a private DNS namespace.
 *)

  
end

module UpdatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_public_dns_namespace_request ->
        (update_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** Updates a public DNS namespace.
 *)

  
end

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_request ->
        (update_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** Submits a request to perform the following operations:

 {ul
       {-  Update the TTL setting for existing [DnsRecords] configurations
           
            }
       {-  Add, update, or delete [HealthCheckConfig] for a specified service
           
             You can't add, update, or delete a [HealthCheckCustomConfig] configuration.
             
               }
       }
   For public and private DNS namespaces, note the following:
   
    {ul
          {-  If you omit any existing [DnsRecords] or [HealthCheckConfig] configurations from an [UpdateService] request, the configurations are deleted from the service.
              
               }
          {-  If you omit an existing [HealthCheckCustomConfig] configuration from an [UpdateService] request, the configuration isn't deleted from the service.
              
               }
          }
   When you update settings for a service, Cloud Map also updates the corresponding settings in all the records and health checks that were created by using the specified service.
    *)

  
end

