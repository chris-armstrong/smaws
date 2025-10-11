type nonrec operation_id = string [@@ocaml.doc ""]

type nonrec update_service_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource_description = string [@@ocaml.doc ""]

type nonrec record_type =
  | CNAME [@ocaml.doc ""]
  | AAAA [@ocaml.doc ""]
  | A [@ocaml.doc ""]
  | SRV [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec record_tt_l = int [@@ocaml.doc ""]

type nonrec dns_record = {
  tt_l : record_tt_l;
      [@ocaml.doc
        "The amount of time, in seconds, that you want DNS resolvers to cache the settings for \
         this record.\n\n\
        \  Alias records don't include a TTL because Route\194\16053 uses the TTL for the Amazon \
         Web Services resource that an alias record routes traffic to. If you include the \
         [AWS_ALIAS_DNS_NAME] attribute when you submit a \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} \
         request, the [TTL] value is ignored. Always specify a TTL for the service; you can use a \
         service to register instances that create either alias or non-alias records.\n\
        \  \n\
        \   "]
  type_ : record_type;
      [@ocaml.doc
        "The type of the resource, which indicates the type of value that Route\194\16053 returns \
         in response to DNS queries. You can specify values for [Type] in the following \
         combinations:\n\n\
        \ {ul\n\
        \       {-   {b  [A] } \n\
        \           \n\
        \            }\n\
        \       {-   {b  [AAAA] } \n\
        \           \n\
        \            }\n\
        \       {-   {b  [A] } and {b  [AAAA] } \n\
        \           \n\
        \            }\n\
        \       {-   {b  [SRV] } \n\
        \           \n\
        \            }\n\
        \       {-   {b  [CNAME] } \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you want Cloud Map to create a Route\194\16053 alias record when you register an \
         instance, specify [A] or [AAAA] for [Type].\n\
        \   \n\
        \    You specify other settings, such as the IP address for [A] and [AAAA] records, when \
         you register an instance. For more information, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance}.\n\
        \    \n\
        \     The following values are supported:\n\
        \     \n\
        \       A  Route\194\16053 returns the IP address of the resource in IPv4 format, such as \
         192.0.2.44.\n\
        \          \n\
        \            AAAA  Route\194\16053 returns the IP address of the resource in IPv6 format, \
         such as 2001:0db8:85a3:0000:0000:abcd:0001:2345.\n\
        \                  \n\
        \                    CNAME  Route\194\16053 returns the domain name of the resource, such \
         as www.example.com. Note the following:\n\
        \                           \n\
        \                            {ul\n\
        \                                  {-  You specify the domain name that you want to route \
         traffic to when you register an instance. For more information, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html#cloudmap-RegisterInstance-request-Attributes}Attributes} \
         in the topic \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance}.\n\
        \                                      \n\
        \                                       }\n\
        \                                  {-  You must specify [WEIGHTED] for the value of \
         [RoutingPolicy].\n\
        \                                      \n\
        \                                       }\n\
        \                                  {-  You can't specify both [CNAME] for [Type] and \
         settings for [HealthCheckConfig]. If you do, the request will fail with an [InvalidInput] \
         error.\n\
        \                                      \n\
        \                                       }\n\
        \                                  }\n\
        \    SRV  Route\194\16053 returns the value for an [SRV] record. The value for an [SRV] \
         record uses the following values:\n\
        \         \n\
        \           [priority weight port service-hostname] \n\
        \          \n\
        \           Note the following about the values:\n\
        \           \n\
        \            {ul\n\
        \                  {-  The values of [priority] and [weight] are both set to [1] and can't \
         be changed. \n\
        \                      \n\
        \                       }\n\
        \                  {-  The value of [port] comes from the value that you specify for the \
         [AWS_INSTANCE_PORT] attribute when you submit a \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} \
         request.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The value of [service-hostname] is a concatenation of the following \
         values:\n\
        \                      \n\
        \                       {ul\n\
        \                             {-  The value that you specify for [InstanceId] when you \
         register an instance.\n\
        \                                 \n\
        \                                  }\n\
        \                             {-  The name of the service.\n\
        \                                 \n\
        \                                  }\n\
        \                             {-  The name of the namespace. \n\
        \                                 \n\
        \                                  }\n\
        \                             \n\
        \                   }\n\
        \                    For example, if the value of [InstanceId] is [test], the name of the \
         service is [backend], and the name of the namespace is [example.com], the value of \
         [service-hostname] is the following:\n\
        \                    \n\
        \                      [test.backend.example.com] \n\
        \                     \n\
        \                      }\n\
        \                  }\n\
        \   If you specify settings for an [SRV] record, note the following:\n\
        \   \n\
        \    {ul\n\
        \          {-  If you specify values for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both \
         in the [RegisterInstance] request, Cloud Map automatically creates [A] and/or [AAAA] \
         records that have the same name as the value of [service-hostname] in the [SRV] record. \
         You can ignore these records.\n\
        \              \n\
        \               }\n\
        \          {-  If you're using a system that requires a specific [SRV] format, such as \
         HAProxy, see the \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html#cloudmap-CreateService-request-Name}Name} \
         element in the documentation about [CreateService] for information about how to specify \
         the correct name format.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    "]
}
[@@ocaml.doc
  "A complex type that contains information about the Route\194\16053 DNS records that you want \
   Cloud Map to create when you register an instance.\n"]

type nonrec dns_record_list = dns_record list [@@ocaml.doc ""]

type nonrec dns_config_change = {
  dns_records : dns_record_list;
      [@ocaml.doc
        "An array that contains one [DnsRecord] object for each Route\194\16053 record that you \
         want Cloud Map to create when you register an instance.\n"]
}
[@@ocaml.doc
  "A complex type that contains information about changes to the Route\194\16053 DNS records that \
   Cloud Map creates when you register an instance.\n"]

type nonrec health_check_type = TCP [@ocaml.doc ""] | HTTPS [@ocaml.doc ""] | HTTP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_path = string [@@ocaml.doc ""]

type nonrec failure_threshold = int [@@ocaml.doc ""]

type nonrec health_check_config = {
  failure_threshold : failure_threshold option;
      [@ocaml.doc
        "The number of consecutive health checks that an endpoint must pass or fail for \
         Route\194\16053 to change the current status of the endpoint from unhealthy to healthy or \
         the other way around. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html}How \
         Route\194\16053 Determines Whether an Endpoint Is Healthy} in the {i Route\194\16053 \
         Developer Guide}.\n"]
  resource_path : resource_path option;
      [@ocaml.doc
        "The path that you want Route\194\16053 to request when performing health checks. The path \
         can be any value that your endpoint returns an HTTP status code of a 2xx or 3xx format \
         for when the endpoint is healthy. An example file is [/docs/route53-health-check.html]. \
         Route\194\16053 automatically adds the DNS name for the service. If you don't specify a \
         value for [ResourcePath], the default value is [/].\n\n\
        \ If you specify [TCP] for [Type], you must {i not} specify a value for [ResourcePath].\n\
        \ "]
  type_ : health_check_type;
      [@ocaml.doc
        "The type of health check that you want to create, which indicates how Route\194\16053 \
         determines whether an endpoint is healthy.\n\n\
        \  You can't change the value of [Type] after you create a health check.\n\
        \  \n\
        \    You can create the following types of health checks:\n\
        \    \n\
        \     {ul\n\
        \           {-   {b HTTP}: Route\194\16053 tries to establish a TCP connection. If \
         successful, Route\194\16053 submits an HTTP request and waits for an HTTP status code of \
         200 or greater and less than 400.\n\
        \               \n\
        \                }\n\
        \           {-   {b HTTPS}: Route\194\16053 tries to establish a TCP connection. If \
         successful, Route\194\16053 submits an HTTPS request and waits for an HTTP status code of \
         200 or greater and less than 400.\n\
        \               \n\
        \                 If you specify HTTPS for the value of [Type], the endpoint must support \
         TLS v1.0 or later.\n\
        \                 \n\
        \                   }\n\
        \           {-   {b TCP}: Route\194\16053 tries to establish a TCP connection.\n\
        \               \n\
        \                If you specify [TCP] for [Type], don't specify a value for [ResourcePath].\n\
        \                \n\
        \                 }\n\
        \           }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-determining-health-of-endpoints.html}How \
         Route\194\16053 Determines Whether an Endpoint Is Healthy} in the {i Route\194\16053 \
         Developer Guide}.\n\
        \   "]
}
[@@ocaml.doc
  " {i Public DNS and HTTP namespaces only.} A complex type that contains settings for an optional \
   health check. If you specify settings for a health check, Cloud Map associates the health check \
   with the records that you specify in [DnsConfig].\n\n\
  \  If you specify a health check configuration, you can specify either [HealthCheckCustomConfig] \
   or [HealthCheckConfig] but not both.\n\
  \  \n\
  \    Health checks are basic Route\194\16053 health checks that monitor an Amazon Web Services \
   endpoint. For information about pricing for health checks, see \
   {{:http://aws.amazon.com/route53/pricing/}Amazon Route\194\16053 Pricing}.\n\
  \    \n\
  \     Note the following about configuring health checks.\n\
  \     \n\
  \       A and AAAA records  If [DnsConfig] includes configurations for both [A] and [AAAA] \
   records, Cloud Map creates a health check that uses the IPv4 address to check the health of the \
   resource. If the endpoint tthat's specified by the IPv4 address is unhealthy, Route\194\16053 \
   considers both the [A] and [AAAA] records to be unhealthy. \n\
  \                           \n\
  \                             CNAME records  You can't specify settings for [HealthCheckConfig] \
   when the [DNSConfig] includes [CNAME] for the value of [Type]. If you do, the [CreateService] \
   request will fail with an [InvalidInput] error.\n\
  \                                            \n\
  \                                              Request interval  A Route\194\16053 health \
   checker in each health-checking Amazon Web Services Region sends a health check request to an \
   endpoint every 30 seconds. On average, your endpoint receives a health check request about \
   every two seconds. However, health checkers don't coordinate with one another. Therefore, you \
   might sometimes see several requests in one second that's followed by a few seconds with no \
   health checks at all.\n\
  \                                                                \n\
  \                                                                  Health checking regions  \n\
   Health checkers perform checks from all Route\194\16053 health-checking Regions. For a list of \
   the current Regions, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_HealthCheckConfig.html#Route53-Type-HealthCheckConfig-Regions}Regions}.\n\n\
  \  Alias records  When you register an instance, if you include the [AWS_ALIAS_DNS_NAME] \
   attribute, Cloud Map creates a Route\194\16053 alias record. Note the following:\n\
  \                 \n\
  \                  {ul\n\
  \                        {-  Route\194\16053 automatically sets [EvaluateTargetHealth] to true \
   for alias records. When [EvaluateTargetHealth] is true, the alias record inherits the health of \
   the referenced Amazon Web Services resource. such as an ELB load balancer. For more \
   information, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-EvaluateTargetHealth}EvaluateTargetHealth}.\n\
  \                            \n\
  \                             }\n\
  \                        {-  If you include [HealthCheckConfig] and then use the service to \
   register an instance that creates an alias record, Route\194\16053 doesn't create the health \
   check.\n\
  \                            \n\
  \                             }\n\
  \                        }\n\
  \    Charges for health checks  Health checks are basic Route\194\16053 health checks that \
   monitor an Amazon Web Services endpoint. For information about pricing for health checks, see \
   {{:http://aws.amazon.com/route53/pricing/}Amazon Route\194\16053 Pricing}.\n\
  \                               \n\
  \                                 "]

type nonrec service_change = {
  health_check_config : health_check_config option;
      [@ocaml.doc
        " {i Public DNS and HTTP namespaces only.} Settings for an optional health check. If you \
         specify settings for a health check, Cloud Map associates the health check with the \
         records that you specify in [DnsConfig].\n"]
  dns_config : dns_config_change option;
      [@ocaml.doc
        "Information about the Route\194\16053 DNS records that you want Cloud Map to create when \
         you register an instance.\n"]
  description : resource_description option; [@ocaml.doc "A description for the service.\n"]
}
[@@ocaml.doc "A complex type that contains changes to an existing service.\n"]

type nonrec update_service_request = {
  service : service_change;
      [@ocaml.doc
        "A complex type that contains the new settings for the service. You can specify a maximum \
         of 30 attributes (key-value pairs).\n"]
  id : resource_id; [@ocaml.doc "The ID of the service that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec update_service_attributes_response = unit [@@ocaml.doc ""]

type nonrec service_attribute_value = string [@@ocaml.doc ""]

type nonrec service_attribute_key = string [@@ocaml.doc ""]

type nonrec service_attributes_map = (service_attribute_key * service_attribute_value) list
[@@ocaml.doc ""]

type nonrec update_service_attributes_request = {
  attributes : service_attributes_map;
      [@ocaml.doc "A string map that contains attribute key-value pairs.\n"]
  service_id : resource_id; [@ocaml.doc "The ID of the service that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec service_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No service exists with the specified ID.\n"]

type nonrec service_attributes_limit_exceeded_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The attribute can't be added to the service because you've exceeded the quota for the number of \
   attributes you can add to a service.\n"]

type nonrec invalid_input = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "One or more specified values aren't valid. For example, a required value might be missing, a \
   numeric value might be outside the allowed range, or a string value might exceed length \
   constraints.\n"]

type nonrec duplicate_request = {
  duplicate_operation_id : resource_id option;
      [@ocaml.doc "The ID of the operation that's already in progress.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation is already in progress.\n"]

type nonrec update_public_dns_namespace_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec soa_change = {
  tt_l : record_tt_l;
      [@ocaml.doc "The updated time to live (TTL) for purposes of negative caching.\n"]
}
[@@ocaml.doc "Updated Start of Authority (SOA) properties for a public or private DNS namespace.\n"]

type nonrec public_dns_properties_mutable_change = {
  so_a : soa_change;
      [@ocaml.doc
        "Updated fields for the Start of Authority (SOA) record for the hosted zone for the public \
         DNS namespace.\n"]
}
[@@ocaml.doc "Updated DNS properties for the public DNS namespace.\n"]

type nonrec public_dns_namespace_properties_change = {
  dns_properties : public_dns_properties_mutable_change;
      [@ocaml.doc "Updated DNS properties for the hosted zone for the public DNS namespace.\n"]
}
[@@ocaml.doc "Updated properties for the public DNS namespace.\n"]

type nonrec public_dns_namespace_change = {
  properties : public_dns_namespace_properties_change option;
      [@ocaml.doc "Properties to be updated in the public DNS namespace.\n"]
  description : resource_description option;
      [@ocaml.doc "An updated description for the public DNS namespace.\n"]
}
[@@ocaml.doc "Updated properties for the public DNS namespace.\n"]

type nonrec update_public_dns_namespace_request = {
  namespace : public_dns_namespace_change;
      [@ocaml.doc "Updated properties for the public DNS namespace.\n"]
  updater_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed \
         [UpdatePublicDnsNamespace] requests to be retried without the risk of running the \
         operation twice. [UpdaterRequestId] can be any unique string (for example, a \
         date/timestamp).\n"]
  id : resource_id; [@ocaml.doc "The ID of the namespace being updated.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_in_use = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified resource can't be deleted because it contains other resources. For example, you \
   can't delete a service that contains any instances.\n"]

type nonrec namespace_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No namespace exists with the specified ID.\n"]

type nonrec update_private_dns_namespace_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec private_dns_properties_mutable_change = {
  so_a : soa_change;
      [@ocaml.doc
        "Updated fields for the Start of Authority (SOA) record for the hosted zone for the \
         private DNS namespace.\n"]
}
[@@ocaml.doc "Updated DNS properties for the private DNS namespace.\n"]

type nonrec private_dns_namespace_properties_change = {
  dns_properties : private_dns_properties_mutable_change;
      [@ocaml.doc "Updated DNS properties for the private DNS namespace.\n"]
}
[@@ocaml.doc "Updated properties for the private DNS namespace.\n"]

type nonrec private_dns_namespace_change = {
  properties : private_dns_namespace_properties_change option;
      [@ocaml.doc "Properties to be updated in the private DNS namespace.\n"]
  description : resource_description option;
      [@ocaml.doc "An updated description for the private DNS namespace.\n"]
}
[@@ocaml.doc "Updated properties for the private DNS namespace.\n"]

type nonrec update_private_dns_namespace_request = {
  namespace : private_dns_namespace_change;
      [@ocaml.doc "Updated properties for the private DNS namespace.\n"]
  updater_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed \
         [UpdatePrivateDnsNamespace] requests to be retried without the risk of running the \
         operation twice. [UpdaterRequestId] can be any unique string (for example, a \
         date/timestamp).\n"]
  id : resource_id; [@ocaml.doc "The ID of the namespace that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_health_status = UNHEALTHY [@ocaml.doc ""] | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_instance_custom_health_status_request = {
  status : custom_health_status;
      [@ocaml.doc "The new status of the instance, [HEALTHY] or [UNHEALTHY].\n"]
  instance_id : resource_id;
      [@ocaml.doc "The ID of the instance that you want to change the health status for.\n"]
  service_id : resource_id;
      [@ocaml.doc
        "The ID of the service that includes the configuration for the custom health check that \
         you want to change the status for.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "No instance exists with the specified ID, or the instance was recently registered, and \
   information about the instance hasn't propagated yet.\n"]

type nonrec custom_health_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The health check for the instance that's specified by [ServiceId] and [InstanceId] isn't a \
   custom health check. \n"]

type nonrec update_http_namespace_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec http_namespace_change = {
  description : resource_description; [@ocaml.doc "An updated description for the HTTP namespace.\n"]
}
[@@ocaml.doc "Updated properties for the HTTP namespace.\n"]

type nonrec update_http_namespace_request = {
  namespace : http_namespace_change; [@ocaml.doc "Updated properties for the the HTTP namespace.\n"]
  updater_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed [UpdateHttpNamespace] \
         requests to be retried without the risk of running the operation twice. \
         [UpdaterRequestId] can be any unique string (for example, a date/timestamp).\n"]
  id : resource_id; [@ocaml.doc "The ID of the namespace that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "The tag keys to remove from the specified resource.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation can't be completed because the resource was not found.\n"]

type nonrec too_many_tags_exception = {
  resource_name : amazon_resource_name option; [@ocaml.doc "The name of the resource.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The list of tags on the resource is over the quota. The maximum number of tags that can be \
   applied to a resource is 50.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "The string value that's associated with the key of the tag. You can set the value of a \
         tag to an empty string, but you can't set the value of a tag to null.\n"]
  key : tag_key; [@ocaml.doc "The key identifier, or name, of the tag.\n"]
}
[@@ocaml.doc "A custom key-value pair that's associated with a resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "The tags to add to the specified resource. Specifying the tag key is required. You can \
         set the value of a tag to an empty string, but you can't set the value of a tag to null.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec service_type_option = HTTP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec service_type = DNS [@ocaml.doc ""] | DNS_HTTP [@ocaml.doc ""] | HTTP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec service_name = string [@@ocaml.doc ""]

type nonrec resource_count = int [@@ocaml.doc ""]

type nonrec routing_policy = WEIGHTED [@ocaml.doc ""] | MULTIVALUE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dns_config = {
  dns_records : dns_record_list;
      [@ocaml.doc
        "An array that contains one [DnsRecord] object for each Route\194\16053 DNS record that \
         you want Cloud Map to create when you register an instance.\n\n\
        \  The record type of a service specified in a [DnsRecord] object can't be updated. To \
         change a record type, you need to delete the service and recreate it with a new \
         [DnsConfig].\n\
        \  \n\
        \   "]
  routing_policy : routing_policy option;
      [@ocaml.doc
        "The routing policy that you want to apply to all Route\194\16053 DNS records that Cloud \
         Map creates when you register an instance and specify this service.\n\n\
        \  If you want to use this service to register instances that create alias records, \
         specify [WEIGHTED] for the routing policy.\n\
        \  \n\
        \    You can specify the following values:\n\
        \    \n\
        \      MULTIVALUE  If you define a health check for the service and the health check is \
         healthy, Route\194\16053 returns the applicable value for up to eight instances.\n\
        \                  \n\
        \                   For example, suppose that the service includes configurations for one \
         [A] record and a health check. You use the service to register 10 instances. \
         Route\194\16053 responds to DNS queries with IP addresses for up to eight healthy \
         instances. If fewer than eight instances are healthy, Route\194\16053 responds to every \
         DNS query with the IP addresses for all of the healthy instances.\n\
        \                   \n\
        \                    If you don't define a health check for the service, Route\194\16053 \
         assumes that all instances are healthy and returns the values for up to eight instances.\n\
        \                    \n\
        \                     For more information about the multivalue routing policy, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-multivalue}Multivalue \
         Answer Routing} in the {i Route\194\16053 Developer Guide}.\n\
        \                     \n\
        \                       WEIGHTED  Route\194\16053 returns the applicable value from one \
         randomly selected instance from among the instances that you registered using the same \
         service. Currently, all records have the same weight, so you can't route more or less \
         traffic to any instances.\n\
        \                                 \n\
        \                                  For example, suppose that the service includes \
         configurations for one [A] record and a health check. You use the service to register 10 \
         instances. Route\194\16053 responds to DNS queries with the IP address for one randomly \
         selected instance from among the healthy instances. If no instances are healthy, \
         Route\194\16053 responds to DNS queries as if all of the instances were healthy.\n\
        \                                  \n\
        \                                   If you don't define a health check for the service, \
         Route\194\16053 assumes that all instances are healthy and returns the applicable value \
         for one randomly selected instance.\n\
        \                                   \n\
        \                                    For more information about the weighted routing \
         policy, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html#routing-policy-weighted}Weighted \
         Routing} in the {i Route\194\16053 Developer Guide}.\n\
        \                                    \n\
        \                                      "]
  namespace_id : resource_id option;
      [@ocaml.doc
        " {i Use NamespaceId in \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_Service.html}Service} instead.} \n\n\
        \ The ID of the namespace to use for DNS configuration.\n\
        \ "]
}
[@@ocaml.doc
  "A complex type that contains information about the Amazon Route\194\16053 DNS records that you \
   want Cloud Map to create when you register an instance.\n"]

type nonrec health_check_custom_config = {
  failure_threshold : failure_threshold option;
      [@ocaml.doc
        " This parameter is no longer supported and is always set to 1. Cloud Map waits for \
         approximately 30 seconds after receiving an [UpdateInstanceCustomHealthStatus] request \
         before changing the status of the service instance.\n\
        \ \n\
        \   The number of 30-second intervals that you want Cloud Map to wait after receiving an \
         [UpdateInstanceCustomHealthStatus] request before it changes the health status of a \
         service instance.\n\
        \   \n\
        \    Sending a second or subsequent [UpdateInstanceCustomHealthStatus] request with the \
         same value before 30 seconds has passed doesn't accelerate the change. Cloud Map still \
         waits [30] seconds after the first request to make the change.\n\
        \    "]
}
[@@ocaml.doc
  "A complex type that contains information about an optional custom health check. A custom health \
   check, which requires that you use a third-party health checker to evaluate the health of your \
   resources, is useful in the following circumstances:\n\n\
  \ {ul\n\
  \       {-  You can't use a health check that's defined by [HealthCheckConfig] because the \
   resource isn't available over the internet. For example, you can use a custom health check when \
   the instance is in an Amazon VPC. (To check the health of resources in a VPC, the health \
   checker must also be in the VPC.)\n\
  \           \n\
  \            }\n\
  \       {-  You want to use a third-party health checker regardless of where your resources are \
   located.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    If you specify a health check configuration, you can specify either \
   [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.\n\
  \    \n\
  \      To change the status of a custom health check, submit an \
   [UpdateInstanceCustomHealthStatus] request. Cloud Map doesn't monitor the status of the \
   resource, it just keeps a record of the status specified in the most recent \
   [UpdateInstanceCustomHealthStatus] request.\n\
  \      \n\
  \       Here's how custom health checks work:\n\
  \       \n\
  \        {ol\n\
  \              {-  You create a service.\n\
  \                  \n\
  \                   }\n\
  \              {-  You register an instance.\n\
  \                  \n\
  \                   }\n\
  \              {-  You configure a third-party health checker to monitor the resource that's \
   associated with the new instance. \n\
  \                  \n\
  \                    Cloud Map doesn't check the health of the resource directly. \n\
  \                    \n\
  \                      }\n\
  \              {-  The third-party health-checker determines that the resource is unhealthy and \
   notifies your application.\n\
  \                  \n\
  \                   }\n\
  \              {-  Your application submits an [UpdateInstanceCustomHealthStatus] request.\n\
  \                  \n\
  \                   }\n\
  \              {-  Cloud Map waits for 30 seconds.\n\
  \                  \n\
  \                   }\n\
  \              {-  If another [UpdateInstanceCustomHealthStatus] request doesn't arrive during \
   that time to change the status back to healthy, Cloud Map stops routing traffic to the resource.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

type nonrec service_summary = {
  create_date : timestamp option; [@ocaml.doc "The date and time that the service was created.\n"]
  health_check_custom_config : health_check_custom_config option;
      [@ocaml.doc
        "Information about an optional custom health check. A custom health check, which requires \
         that you use a third-party health checker to evaluate the health of your resources, is \
         useful in the following circumstances:\n\n\
        \ {ul\n\
        \       {-  You can't use a health check that's defined by [HealthCheckConfig] because the \
         resource isn't available over the internet. For example, you can use a custom health \
         check when the instance is in an Amazon VPC. (To check the health of resources in a VPC, \
         the health checker must also be in the VPC.)\n\
        \           \n\
        \            }\n\
        \       {-  You want to use a third-party health checker regardless of where your \
         resources are located.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    If you specify a health check configuration, you can specify either \
         [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.\n\
        \    \n\
        \     "]
  health_check_config : health_check_config option;
      [@ocaml.doc
        " {i Public DNS and HTTP namespaces only.} Settings for an optional health check. If you \
         specify settings for a health check, Cloud Map associates the health check with the \
         records that you specify in [DnsConfig].\n"]
  dns_config : dns_config option;
      [@ocaml.doc
        "Information about the Route\194\16053 DNS records that you want Cloud Map to create when \
         you register an instance.\n"]
  instance_count : resource_count option;
      [@ocaml.doc
        "The number of instances that are currently associated with the service. Instances that \
         were previously associated with the service but that are deleted aren't included in the \
         count. The count might not reflect pending registrations and deregistrations.\n"]
  description : resource_description option;
      [@ocaml.doc "The description that you specify when you create the service.\n"]
  type_ : service_type option;
      [@ocaml.doc
        "Describes the systems that can be used to discover the service instances.\n\n\
        \  DNS_HTTP  The service instances can be discovered using either DNS queries or the \
         [DiscoverInstances] API operation.\n\
        \            \n\
        \              HTTP  The service instances can only be discovered using the \
         [DiscoverInstances] API operation.\n\
        \                    \n\
        \                      DNS  Reserved.\n\
        \                           \n\
        \                             "]
  name : service_name option; [@ocaml.doc "The name of the service.\n"]
  arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that Cloud Map assigns to the service when you create it.\n"]
  id : resource_id option;
      [@ocaml.doc "The ID that Cloud Map assigned to the service when you created it.\n"]
}
[@@ocaml.doc "A complex type that contains information about a specified service.\n"]

type nonrec service_summaries_list = service_summary list [@@ocaml.doc ""]

type nonrec service_filter_name = NAMESPACE_ID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec filter_condition =
  | BEGINS_WITH [@ocaml.doc ""]
  | BETWEEN [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | EQ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_filter = {
  condition : filter_condition option;
      [@ocaml.doc
        "The operator that you want to use to determine whether a service is returned by \
         [ListServices]. Valid values for [Condition] include the following:\n\n\
        \ {ul\n\
        \       {-   [EQ]: When you specify [EQ], specify one namespace ID for [Values]. [EQ] is \
         the default condition and can be omitted.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  values : filter_values;
      [@ocaml.doc
        "The values that are applicable to the value that you specify for [Condition] to filter \
         the list of services.\n"]
  name : service_filter_name; [@ocaml.doc "Specify [NAMESPACE_ID].\n"]
}
[@@ocaml.doc
  "A complex type that lets you specify the namespaces that you want to list services for.\n"]

type nonrec service_filters = service_filter list [@@ocaml.doc ""]

type nonrec service_attributes = {
  attributes : service_attributes_map option;
      [@ocaml.doc
        "A string map that contains the following information for the service that you specify in \
         [ServiceArn]:\n\n\
        \ {ul\n\
        \       {-  The attributes that apply to the service. \n\
        \           \n\
        \            }\n\
        \       {-  For each attribute, the applicable value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You can specify a total of 30 attributes.\n\
        \   "]
  service_arn : arn option;
      [@ocaml.doc "The ARN of the service that the attributes are associated with.\n"]
}
[@@ocaml.doc
  "A complex type that contains information about attributes associated with a specific service.\n"]

type nonrec service_attribute_key_list = service_attribute_key list [@@ocaml.doc ""]

type nonrec service_already_exists = {
  service_id : resource_id option; [@ocaml.doc "The ID of the existing service.\n"]
  creator_request_id : resource_id option;
      [@ocaml.doc "The [CreatorRequestId] that was used to create the service.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The service can't be created because a service with the same name already exists.\n"]

type nonrec service = {
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed requests to be retried \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string (for example, a date/timestamp).\n"]
  create_date : timestamp option;
      [@ocaml.doc
        "The date and time that the service was created, in Unix format and Coordinated Universal \
         Time (UTC). The value of [CreateDate] is accurate to milliseconds. For example, the value \
         [1516925490.087] represents Friday, January 26, 2018 12:11:30.087 AM.\n"]
  health_check_custom_config : health_check_custom_config option;
      [@ocaml.doc
        "A complex type that contains information about an optional custom health check.\n\n\
        \  If you specify a health check configuration, you can specify either \
         [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.\n\
        \  \n\
        \   "]
  health_check_config : health_check_config option;
      [@ocaml.doc
        " {i Public DNS and HTTP namespaces only.} A complex type that contains settings for an \
         optional health check. If you specify settings for a health check, Cloud Map associates \
         the health check with the records that you specify in [DnsConfig].\n\n\
        \ For information about the charges for health checks, see \
         {{:http://aws.amazon.com/route53/pricing/}Amazon Route\194\16053 Pricing}.\n\
        \ "]
  type_ : service_type option;
      [@ocaml.doc
        "Describes the systems that can be used to discover the service instances.\n\n\
        \  DNS_HTTP  The service instances can be discovered using either DNS queries or the \
         [DiscoverInstances] API operation.\n\
        \            \n\
        \              HTTP  The service instances can only be discovered using the \
         [DiscoverInstances] API operation.\n\
        \                    \n\
        \                      DNS  Reserved.\n\
        \                           \n\
        \                             "]
  dns_config : dns_config option;
      [@ocaml.doc
        "A complex type that contains information about the Route\194\16053 DNS records that you \
         want Cloud Map to create when you register an instance.\n\n\
        \  The record types of a service can only be changed by deleting the service and \
         recreating it with a new [Dnsconfig].\n\
        \  \n\
        \   "]
  instance_count : resource_count option;
      [@ocaml.doc
        "The number of instances that are currently associated with the service. Instances that \
         were previously associated with the service but that are deleted aren't included in the \
         count. The count might not reflect pending registrations and deregistrations.\n"]
  description : resource_description option; [@ocaml.doc "The description of the service.\n"]
  namespace_id : resource_id option;
      [@ocaml.doc "The ID of the namespace that was used to create the service.\n"]
  name : service_name option; [@ocaml.doc "The name of the service.\n"]
  arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that Cloud Map assigns to the service when you create it.\n"]
  id : resource_id option;
      [@ocaml.doc "The ID that Cloud Map assigned to the service when you created it.\n"]
}
[@@ocaml.doc "A complex type that contains information about the specified service.\n"]

type nonrec so_a = {
  tt_l : record_tt_l; [@ocaml.doc "The time to live (TTL) for purposes of negative caching.\n"]
}
[@@ocaml.doc "Start of Authority (SOA) properties for a public or private DNS namespace.\n"]

type nonrec resource_limit_exceeded = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource can't be created because you've reached the quota on the number of resources.\n"]

type nonrec register_instance_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec attr_value = string [@@ocaml.doc ""]

type nonrec attr_key = string [@@ocaml.doc ""]

type nonrec attributes = (attr_key * attr_value) list [@@ocaml.doc ""]

type nonrec register_instance_request = {
  attributes : attributes;
      [@ocaml.doc
        "A string map that contains the following information for the service that you specify in \
         [ServiceId]:\n\n\
        \ {ul\n\
        \       {-  The attributes that apply to the records that are defined in the service. \n\
        \           \n\
        \            }\n\
        \       {-  For each attribute, the applicable value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Do not include sensitive information in the attributes if the namespace is \
         discoverable by public DNS queries.\n\
        \    \n\
        \      The following are the supported attribute keys.\n\
        \      \n\
        \        AWS_ALIAS_DNS_NAME  If you want Cloud Map to create an Amazon Route\194\16053 \
         alias record that routes traffic to an Elastic Load Balancing load balancer, specify the \
         DNS name that's associated with the load balancer. For information about how to get the \
         DNS name, see \"DNSName\" in the topic \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html}AliasTarget} \
         in the {i Route\194\16053 API Reference}.\n\
        \                            \n\
        \                             Note the following:\n\
        \                             \n\
        \                              {ul\n\
        \                                    {-  The configuration for the service that's \
         specified by [ServiceId] must include settings for an [A] record, an [AAAA] record, or \
         both.\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  In the service that's specified by [ServiceId], \
         the value of [RoutingPolicy] must be [WEIGHTED].\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  If the service that's specified by [ServiceId] \
         includes [HealthCheckConfig] settings, Cloud Map will create the Route\194\16053 health \
         check, but it doesn't associate the health check with the alias record.\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  Cloud Map currently doesn't support creating \
         alias records that route traffic to Amazon Web Services resources other than Elastic Load \
         Balancing load balancers.\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  If you specify a value for [AWS_ALIAS_DNS_NAME], \
         don't specify values for any of the [AWS_INSTANCE] attributes.\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  The [AWS_ALIAS_DNS_NAME] is not supported in the \
         GovCloud (US) Regions.\n\
        \                                        \n\
        \                                         }\n\
        \                                    }\n\
        \    AWS_EC2_INSTANCE_ID   {i HTTP namespaces only.} The Amazon EC2 instance ID for the \
         instance. If the [AWS_EC2_INSTANCE_ID] attribute is specified, then the only other \
         attribute that can be specified is [AWS_INIT_HEALTH_STATUS]. When the \
         [AWS_EC2_INSTANCE_ID] attribute is specified, then the [AWS_INSTANCE_IPV4] attribute will \
         be filled out with the primary private IPv4 address.\n\
        \                         \n\
        \                           AWS_INIT_HEALTH_STATUS  If the service configuration includes \
         [HealthCheckCustomConfig], you can optionally use [AWS_INIT_HEALTH_STATUS] to specify the \
         initial status of the custom health check, [HEALTHY] or [UNHEALTHY]. If you don't specify \
         a value for [AWS_INIT_HEALTH_STATUS], the initial status is [HEALTHY].\n\
        \                                                   \n\
        \                                                     AWS_INSTANCE_CNAME  If the service \
         configuration includes a [CNAME] record, the domain name that you want Route\194\16053 to \
         return in response to DNS queries (for example, [example.com]).\n\
        \                                                                         \n\
        \                                                                          This value is \
         required if the service specified by [ServiceId] includes settings for an [CNAME] record.\n\
        \                                                                          \n\
        \                                                                            \
         AWS_INSTANCE_IPV4  \n\
         If the service configuration includes an [A] record, the IPv4 address that you want \
         Route\194\16053 to return in response to DNS queries (for example, [192.0.2.44]).\n\n\
        \ This value is required if the service specified by [ServiceId] includes settings for an \
         [A] record. If the service includes settings for an [SRV] record, you must specify a \
         value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.\n\
        \ \n\
        \   AWS_INSTANCE_IPV6  If the service configuration includes an [AAAA] record, the IPv6 \
         address that you want Route\194\16053 to return in response to DNS queries (for example, \
         [2001:0db8:85a3:0000:0000:abcd:0001:2345]).\n\
        \                      \n\
        \                       This value is required if the service specified by [ServiceId] \
         includes settings for an [AAAA] record. If the service includes settings for an [SRV] \
         record, you must specify a value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.\n\
        \                       \n\
        \                         AWS_INSTANCE_PORT  If the service includes an [SRV] record, the \
         value that you want Route\194\16053 to return for the port.\n\
        \                                            \n\
        \                                             If the service includes [HealthCheckConfig], \
         the port on the endpoint that you want Route\194\16053 to send requests to. \n\
        \                                             \n\
        \                                              This value is required if you specified \
         settings for an [SRV] record or a Route\194\16053 health check when you created the \
         service.\n\
        \                                              \n\
        \                                                Custom attributes  You can add up to 30 \
         custom attributes. For each key-value pair, the maximum length of the attribute name is \
         255 characters, and the maximum length of the attribute value is 1,024 characters. The \
         total size of all provided attributes (sum of all keys and values) must not exceed 5,000 \
         characters.\n\
        \                                                                   \n\
        \                                                                     "]
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed [RegisterInstance] \
         requests to be retried without the risk of executing the operation twice. You must use a \
         unique [CreatorRequestId] string every time you submit a [RegisterInstance] request if \
         you're registering additional instances for the same namespace and service. \
         [CreatorRequestId] can be any unique string (for example, a date/time stamp).\n"]
  instance_id : instance_id;
      [@ocaml.doc
        "An identifier that you want to associate with the instance. Note the following:\n\n\
        \ {ul\n\
        \       {-  If the service that's specified by [ServiceId] includes settings for an [SRV] \
         record, the value of [InstanceId] is automatically included as part of the value for the \
         [SRV] record. For more information, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_DnsRecord.html#cloudmap-Type-DnsRecord-Type}DnsRecord \
         > Type}.\n\
        \           \n\
        \            }\n\
        \       {-  You can use this value to update an existing instance.\n\
        \           \n\
        \            }\n\
        \       {-  To register a new instance, you must specify a value that's unique among \
         instances that you register by using the same service. \n\
        \           \n\
        \            }\n\
        \       {-  If you specify an existing [InstanceId] and [ServiceId], Cloud Map updates the \
         existing DNS records, if any. If there's also an existing health check, Cloud Map deletes \
         the old health check and creates a new one. \n\
        \           \n\
        \             The health check isn't deleted immediately, so it will still appear for a \
         while if you submit a [ListHealthChecks] request, for example.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \    Do not include sensitive information in [InstanceId] if the namespace is discoverable \
         by public DNS queries and any [Type] member of [DnsRecord] for the service contains [SRV] \
         because the [InstanceId] is discoverable by public DNS queries.\n\
        \    \n\
        \     "]
  service_id : resource_id;
      [@ocaml.doc "The ID of the service that you want to use for settings for the instance.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The tags that are assigned to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that you want to retrieve tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_services_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If the response contains [NextToken], submit another [ListServices] request to get the \
         next group of results. Specify the value of [NextToken] from the previous response in the \
         next request.\n\n\
        \  Cloud Map gets [MaxResults] services and then filters them based on the specified \
         criteria. It's possible that no services in the first [MaxResults] services matched the \
         specified criteria but that subsequent groups of [MaxResults] services do contain \
         services that match the criteria.\n\
        \  \n\
        \   "]
  services : service_summaries_list option;
      [@ocaml.doc
        "An array that contains one [ServiceSummary] object for each service that matches the \
         specified filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_services_request = {
  filters : service_filters option;
      [@ocaml.doc
        "A complex type that contains specifications for the namespaces that you want to list \
         services for. \n\n\
        \ If you specify more than one filter, an operation must match all filters to be returned \
         by [ListServices].\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of services that you want Cloud Map to return in the response to a \
         [ListServices] request. If you don't specify a value for [MaxResults], Cloud Map returns \
         up to 100 services.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListServices] request, omit this value.\n\n\
        \ If the response contains [NextToken], submit another [ListServices] request to get the \
         next group of results. Specify the value of [NextToken] from the previous response in the \
         next request.\n\
        \ \n\
        \   Cloud Map gets [MaxResults] services and then filters them based on the specified \
         criteria. It's possible that no services in the first [MaxResults] services matched the \
         specified criteria but that subsequent groups of [MaxResults] services do contain \
         services that match the criteria.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec operation_status =
  | FAIL [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | SUBMITTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_summary = {
  status : operation_status option;
      [@ocaml.doc
        "The status of the operation. Values include the following:\n\n\
        \ {ul\n\
        \       {-   {b SUBMITTED}: This is the initial state immediately after you submit a \
         request.\n\
        \           \n\
        \            }\n\
        \       {-   {b PENDING}: Cloud Map is performing the operation.\n\
        \           \n\
        \            }\n\
        \       {-   {b SUCCESS}: The operation succeeded.\n\
        \           \n\
        \            }\n\
        \       {-   {b FAIL}: The operation failed. For the failure reason, see [ErrorMessage].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  id : operation_id option; [@ocaml.doc "The ID for an operation.\n"]
}
[@@ocaml.doc
  "A complex type that contains information about an operation that matches the criteria that you \
   specified in a \
   {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html}ListOperations} \
   request.\n"]

type nonrec operation_summary_list = operation_summary list [@@ocaml.doc ""]

type nonrec list_operations_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If the response contains [NextToken], submit another [ListOperations] request to get the \
         next group of results. Specify the value of [NextToken] from the previous response in the \
         next request.\n\n\
        \  Cloud Map gets [MaxResults] operations and then filters them based on the specified \
         criteria. It's possible that no operations in the first [MaxResults] operations matched \
         the specified criteria but that subsequent groups of [MaxResults] operations do contain \
         operations that match the criteria.\n\
        \  \n\
        \   "]
  operations : operation_summary_list option;
      [@ocaml.doc "Summary information about the operations that match the specified criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_filter_name =
  | UPDATE_DATE [@ocaml.doc ""]
  | TYPE [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
  | SERVICE_ID [@ocaml.doc ""]
  | NAMESPACE_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_filter = {
  condition : filter_condition option;
      [@ocaml.doc
        "The operator that you want to use to determine whether an operation matches the specified \
         value. Valid values for condition include:\n\n\
        \ {ul\n\
        \       {-   [EQ]: When you specify [EQ] for the condition, you can specify only one \
         value. [EQ] is supported for [NAMESPACE_ID], [SERVICE_ID], [STATUS], and [TYPE]. [EQ] is \
         the default condition and can be omitted.\n\
        \           \n\
        \            }\n\
        \       {-   [IN]: When you specify [IN] for the condition, you can specify a list of one \
         or more values. [IN] is supported for [STATUS] and [TYPE]. An operation must match one of \
         the specified values to be returned in the response.\n\
        \           \n\
        \            }\n\
        \       {-   [BETWEEN]: Specify a start date and an end date in Unix date/time format and \
         Coordinated Universal Time (UTC). The start date must be the first value. [BETWEEN] is \
         supported for [UPDATE_DATE]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  values : filter_values;
      [@ocaml.doc
        "Specify values that are applicable to the value that you specify for [Name]: \n\n\
        \ {ul\n\
        \       {-   {b NAMESPACE_ID}: Specify one namespace ID.\n\
        \           \n\
        \            }\n\
        \       {-   {b SERVICE_ID}: Specify one service ID.\n\
        \           \n\
        \            }\n\
        \       {-   {b STATUS}: Specify one or more statuses: [SUBMITTED], [PENDING], [SUCCEED], \
         or [FAIL].\n\
        \           \n\
        \            }\n\
        \       {-   {b TYPE}: Specify one or more of the following types: [CREATE_NAMESPACE], \
         [DELETE_NAMESPACE], [UPDATE_SERVICE], [REGISTER_INSTANCE], or [DEREGISTER_INSTANCE].\n\
        \           \n\
        \            }\n\
        \       {-   {b UPDATE_DATE}: Specify a start date and an end date in Unix date/time \
         format and Coordinated Universal Time (UTC). The start date must be the first value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : operation_filter_name;
      [@ocaml.doc
        "Specify the operations that you want to get:\n\n\
        \ {ul\n\
        \       {-   {b NAMESPACE_ID}: Gets operations related to specified namespaces.\n\
        \           \n\
        \            }\n\
        \       {-   {b SERVICE_ID}: Gets operations related to specified services.\n\
        \           \n\
        \            }\n\
        \       {-   {b STATUS}: Gets operations based on the status of the operations: \
         [SUBMITTED], [PENDING], [SUCCEED], or [FAIL].\n\
        \           \n\
        \            }\n\
        \       {-   {b TYPE}: Gets specified types of operation.\n\
        \           \n\
        \            }\n\
        \       {-   {b UPDATE_DATE}: Gets operations that changed status during a specified \
         date/time range. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "A complex type that lets you select the operations that you want to list.\n"]

type nonrec operation_filters = operation_filter list [@@ocaml.doc ""]

type nonrec list_operations_request = {
  filters : operation_filters option;
      [@ocaml.doc
        "A complex type that contains specifications for the operations that you want to list, for \
         example, operations that you started between a specified start date and end date.\n\n\
        \ If you specify more than one filter, an operation must match all filters to be returned \
         by [ListOperations].\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items that you want Cloud Map to return in the response to a \
         [ListOperations] request. If you don't specify a value for [MaxResults], Cloud Map \
         returns up to 100 operations.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListOperations] request, omit this value.\n\n\
        \ If the response contains [NextToken], submit another [ListOperations] request to get the \
         next group of results. Specify the value of [NextToken] from the previous response in the \
         next request.\n\
        \ \n\
        \   Cloud Map gets [MaxResults] operations and then filters them based on the specified \
         criteria. It's possible that no operations in the first [MaxResults] operations matched \
         the specified criteria but that subsequent groups of [MaxResults] operations do contain \
         operations that match the criteria.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec namespace_name = string [@@ocaml.doc ""]

type nonrec namespace_type =
  | HTTP [@ocaml.doc ""]
  | DNS_PRIVATE [@ocaml.doc ""]
  | DNS_PUBLIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dns_properties = {
  so_a : so_a option; [@ocaml.doc "Start of Authority (SOA) record for the hosted zone.\n"]
  hosted_zone_id : resource_id option;
      [@ocaml.doc
        "The ID for the Route\194\16053 hosted zone that Cloud Map creates when you create a \
         namespace.\n"]
}
[@@ocaml.doc
  "A complex type that contains the ID for the Route\194\16053 hosted zone that Cloud Map creates \
   when you create a namespace.\n"]

type nonrec http_properties = {
  http_name : namespace_name option; [@ocaml.doc "The name of an HTTP namespace.\n"]
}
[@@ocaml.doc "A complex type that contains the name of an HTTP namespace.\n"]

type nonrec namespace_properties = {
  http_properties : http_properties option;
      [@ocaml.doc "A complex type that contains the name of an HTTP namespace.\n"]
  dns_properties : dns_properties option;
      [@ocaml.doc
        "A complex type that contains the ID for the Route\194\16053 hosted zone that Cloud Map \
         creates when you create a namespace.\n"]
}
[@@ocaml.doc "A complex type that contains information that's specific to the namespace type.\n"]

type nonrec namespace_summary = {
  create_date : timestamp option; [@ocaml.doc "The date and time that the namespace was created.\n"]
  properties : namespace_properties option; [@ocaml.doc "The properties of the namespace.\n"]
  service_count : resource_count option;
      [@ocaml.doc "The number of services that were created using the namespace.\n"]
  description : resource_description option; [@ocaml.doc "A description for the namespace.\n"]
  type_ : namespace_type option;
      [@ocaml.doc "The type of the namespace, either public or private.\n"]
  name : namespace_name option;
      [@ocaml.doc
        "The name of the namespace. When you create a namespace, Cloud Map automatically creates a \
         Route\194\16053 hosted zone that has the same name as the namespace.\n"]
  arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when you create it.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the namespace.\n"]
}
[@@ocaml.doc "A complex type that contains information about a namespace.\n"]

type nonrec namespace_summaries_list = namespace_summary list [@@ocaml.doc ""]

type nonrec list_namespaces_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If the response contains [NextToken], submit another [ListNamespaces] request to get the \
         next group of results. Specify the value of [NextToken] from the previous response in the \
         next request.\n\n\
        \  Cloud Map gets [MaxResults] namespaces and then filters them based on the specified \
         criteria. It's possible that no namespaces in the first [MaxResults] namespaces matched \
         the specified criteria but that subsequent groups of [MaxResults] namespaces do contain \
         namespaces that match the criteria.\n\
        \  \n\
        \   "]
  namespaces : namespace_summaries_list option;
      [@ocaml.doc
        "An array that contains one [NamespaceSummary] object for each namespace that matches the \
         specified filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_filter_name =
  | HTTP_NAME [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec namespace_filter = {
  condition : filter_condition option;
      [@ocaml.doc
        "Specify the operator that you want to use to determine whether a namespace matches the \
         specified value. Valid values for [Condition] are one of the following.\n\n\
        \ {ul\n\
        \       {-   [EQ]: When you specify [EQ] for [Condition], you can specify only one value. \
         [EQ] is supported for [TYPE], [NAME], and [HTTP_NAME]. [EQ] is the default condition and \
         can be omitted.\n\
        \           \n\
        \            }\n\
        \       {-   [BEGINS_WITH]: When you specify [BEGINS_WITH] for [Condition], you can \
         specify only one value. [BEGINS_WITH] is supported for [TYPE], [NAME], and [HTTP_NAME].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  values : filter_values;
      [@ocaml.doc
        "Specify the values that are applicable to the value that you specify for [Name].\n\n\
        \ {ul\n\
        \       {-   [TYPE]: Specify [HTTP], [DNS_PUBLIC], or [DNS_PRIVATE].\n\
        \           \n\
        \            }\n\
        \       {-   [NAME]: Specify the name of the namespace, which is found in [Namespace.Name].\n\
        \           \n\
        \            }\n\
        \       {-   [HTTP_NAME]: Specify the HTTP name of the namespace, which is found in \
         [Namespace.Properties.HttpProperties.HttpName].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : namespace_filter_name;
      [@ocaml.doc
        "Specify the namespaces that you want to get using one of the following.\n\n\
        \ {ul\n\
        \       {-   [TYPE]: Gets the namespaces of the specified type.\n\
        \           \n\
        \            }\n\
        \       {-   [NAME]: Gets the namespaces with the specified name.\n\
        \           \n\
        \            }\n\
        \       {-   [HTTP_NAME]: Gets the namespaces with the specified HTTP name.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A complex type that identifies the namespaces that you want to list. You can choose to list \
   public or private namespaces.\n"]

type nonrec namespace_filters = namespace_filter list [@@ocaml.doc ""]

type nonrec list_namespaces_request = {
  filters : namespace_filters option;
      [@ocaml.doc
        "A complex type that contains specifications for the namespaces that you want to list.\n\n\
        \ If you specify more than one filter, a namespace must match all filters to be returned \
         by [ListNamespaces].\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of namespaces that you want Cloud Map to return in the response to a \
         [ListNamespaces] request. If you don't specify a value for [MaxResults], Cloud Map \
         returns up to 100 namespaces.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListNamespaces] request, omit this value.\n\n\
        \ If the response contains [NextToken], submit another [ListNamespaces] request to get the \
         next group of results. Specify the value of [NextToken] from the previous response in the \
         next request.\n\
        \ \n\
        \   Cloud Map gets [MaxResults] namespaces and then filters them based on the specified \
         criteria. It's possible that no namespaces in the first [MaxResults] namespaces matched \
         the specified criteria but that subsequent groups of [MaxResults] namespaces do contain \
         namespaces that match the criteria.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec instance_summary = {
  attributes : attributes option;
      [@ocaml.doc
        "A string map that contains the following information:\n\n\
        \ {ul\n\
        \       {-  The attributes that are associated with the instance. \n\
        \           \n\
        \            }\n\
        \       {-  For each attribute, the applicable value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Supported attribute keys include the following:\n\
        \   \n\
        \     AWS_ALIAS_DNS_NAME  For an alias record that routes traffic to an Elastic Load \
         Balancing load balancer, the DNS name that's associated with the load balancer. \n\
        \                         \n\
        \                           AWS_EC2_INSTANCE_ID (HTTP namespaces only)  The Amazon EC2 \
         instance ID for the instance. When the [AWS_EC2_INSTANCE_ID] attribute is specified, then \
         the [AWS_INSTANCE_IPV4] attribute contains the primary private IPv4 address.\n\
        \                                                                       \n\
        \                                                                         \
         AWS_INIT_HEALTH_STATUS  \n\
         If the service configuration includes [HealthCheckCustomConfig], you can optionally use \
         [AWS_INIT_HEALTH_STATUS] to specify the initial status of the custom health check, \
         [HEALTHY] or [UNHEALTHY]. If you don't specify a value for [AWS_INIT_HEALTH_STATUS], the \
         initial status is [HEALTHY].\n\n\
        \  AWS_INSTANCE_CNAME  For a [CNAME] record, the domain name that Route\194\16053 returns \
         in response to DNS queries (for example, [example.com]).\n\
        \                      \n\
        \                        AWS_INSTANCE_IPV4  For an [A] record, the IPv4 address that \
         Route\194\16053 returns in response to DNS queries (for example, [192.0.2.44]).\n\
        \                                           \n\
        \                                             AWS_INSTANCE_IPV6  For an [AAAA] record, the \
         IPv6 address that Route\194\16053 returns in response to DNS queries (for example, \
         [2001:0db8:85a3:0000:0000:abcd:0001:2345]).\n\
        \                                                                \n\
        \                                                                  AWS_INSTANCE_PORT  \n\
         For an [SRV] record, the value that Route\194\16053 returns for the port. In addition, if \
         the service includes [HealthCheckConfig], the port on the endpoint that Route\194\16053 \
         sends requests to.\n\n\
        \  "]
  id : resource_id option;
      [@ocaml.doc "The ID for an instance that you created by using a specified service.\n"]
}
[@@ocaml.doc
  "A complex type that contains information about the instances that you registered by using a \
   specified service.\n"]

type nonrec instance_summary_list = instance_summary list [@@ocaml.doc ""]

type nonrec list_instances_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If more than [MaxResults] instances match the specified criteria, you can submit another \
         [ListInstances] request to get the next group of results. Specify the value of \
         [NextToken] from the previous response in the next request.\n"]
  instances : instance_summary_list option;
      [@ocaml.doc
        "Summary information about the instances that are associated with the specified service.\n"]
}
[@@ocaml.doc ""]

type nonrec list_instances_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of instances that you want Cloud Map to return in the response to a \
         [ListInstances] request. If you don't specify a value for [MaxResults], Cloud Map returns \
         up to 100 instances.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListInstances] request, omit this value.\n\n\
        \ If more than [MaxResults] instances match the specified criteria, you can submit another \
         [ListInstances] request to get the next group of results. Specify the value of \
         [NextToken] from the previous response in the next request.\n\
        \ "]
  service_id : resource_id;
      [@ocaml.doc "The ID of the service that you want to list instances for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_attributes_response = {
  service_attributes : service_attributes option;
      [@ocaml.doc
        "A complex type that contains the service ARN and a list of attribute key-value pairs \
         associated with the service.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_attributes_request = {
  service_id : resource_id;
      [@ocaml.doc "The ID of the service that you want to get attributes for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_response = {
  service : service option;
      [@ocaml.doc "A complex type that contains information about the service.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_request = {
  id : resource_id; [@ocaml.doc "The ID of the service that you want to get settings for.\n"]
}
[@@ocaml.doc ""]

type nonrec operation_not_found = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No operation exists with the specified ID.\n"]

type nonrec operation_type =
  | DEREGISTER_INSTANCE [@ocaml.doc ""]
  | REGISTER_INSTANCE [@ocaml.doc ""]
  | UPDATE_SERVICE [@ocaml.doc ""]
  | UPDATE_NAMESPACE [@ocaml.doc ""]
  | DELETE_NAMESPACE [@ocaml.doc ""]
  | CREATE_NAMESPACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec code = string [@@ocaml.doc ""]

type nonrec operation_target_type =
  | INSTANCE [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
  | NAMESPACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operation_targets_map = (operation_target_type * resource_id) list [@@ocaml.doc ""]

type nonrec operation = {
  targets : operation_targets_map option;
      [@ocaml.doc
        "The name of the target entity that's associated with the operation:\n\n\
        \  NAMESPACE  The namespace ID is returned in the [ResourceId] property.\n\
        \             \n\
        \               SERVICE  The service ID is returned in the [ResourceId] property.\n\
        \                        \n\
        \                          INSTANCE  The instance ID is returned in the [ResourceId] \
         property.\n\
        \                                    \n\
        \                                      "]
  update_date : timestamp option;
      [@ocaml.doc
        "The date and time that the value of [Status] changed to the current value, in Unix \
         date/time format and Coordinated Universal Time (UTC). The value of [UpdateDate] is \
         accurate to milliseconds. For example, the value [1516925490.087] represents Friday, \
         January 26, 2018 12:11:30.087 AM.\n"]
  create_date : timestamp option;
      [@ocaml.doc
        "The date and time that the request was submitted, in Unix date/time format and \
         Coordinated Universal Time (UTC). The value of [CreateDate] is accurate to milliseconds. \
         For example, the value [1516925490.087] represents Friday, January 26, 2018 12:11:30.087 \
         AM.\n"]
  error_code : code option;
      [@ocaml.doc
        "The code associated with [ErrorMessage]. Values for [ErrorCode] include the following:\n\n\
        \ {ul\n\
        \       {-   [ACCESS_DENIED] \n\
        \           \n\
        \            }\n\
        \       {-   [CANNOT_CREATE_HOSTED_ZONE] \n\
        \           \n\
        \            }\n\
        \       {-   [EXPIRED_TOKEN] \n\
        \           \n\
        \            }\n\
        \       {-   [HOSTED_ZONE_NOT_FOUND] \n\
        \           \n\
        \            }\n\
        \       {-   [INTERNAL_FAILURE] \n\
        \           \n\
        \            }\n\
        \       {-   [INVALID_CHANGE_BATCH] \n\
        \           \n\
        \            }\n\
        \       {-   [THROTTLED_REQUEST] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  error_message : message option;
      [@ocaml.doc "If the value of [Status] is [FAIL], the reason that the operation failed.\n"]
  status : operation_status option;
      [@ocaml.doc
        "The status of the operation. Values include the following:\n\n\
        \  SUBMITTED  This is the initial state that occurs immediately after you submit a request.\n\
        \             \n\
        \               PENDING  Cloud Map is performing the operation.\n\
        \                        \n\
        \                          SUCCESS  The operation succeeded.\n\
        \                                   \n\
        \                                     FAIL  The operation failed. For the failure reason, \
         see [ErrorMessage].\n\
        \                                           \n\
        \                                             "]
  type_ : operation_type option;
      [@ocaml.doc "The name of the operation that's associated with the specified ID.\n"]
  id : operation_id option;
      [@ocaml.doc "The ID of the operation that you want to get information about.\n"]
}
[@@ocaml.doc "A complex type that contains information about a specified operation.\n"]

type nonrec get_operation_response = {
  operation : operation option;
      [@ocaml.doc "A complex type that contains information about the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_operation_request = {
  operation_id : resource_id;
      [@ocaml.doc "The ID of the operation that you want to get more information about.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace = {
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed requests to be retried \
         without the risk of running an operation twice. \n"]
  create_date : timestamp option;
      [@ocaml.doc
        "The date that the namespace was created, in Unix date/time format and Coordinated \
         Universal Time (UTC). The value of [CreateDate] is accurate to milliseconds. For example, \
         the value [1516925490.087] represents Friday, January 26, 2018 12:11:30.087 AM.\n"]
  properties : namespace_properties option;
      [@ocaml.doc
        "A complex type that contains information that's specific to the type of the namespace.\n"]
  service_count : resource_count option;
      [@ocaml.doc "The number of services that are associated with the namespace.\n"]
  description : resource_description option;
      [@ocaml.doc "The description that you specify for the namespace when you create it.\n"]
  type_ : namespace_type option;
      [@ocaml.doc
        "The type of the namespace. The methods for discovering instances depends on the value \
         that you specify:\n\n\
        \  HTTP  Instances can be discovered only programmatically, using the Cloud Map \
         [DiscoverInstances] API.\n\
        \        \n\
        \          DNS_PUBLIC  Instances can be discovered using public DNS queries and using the \
         [DiscoverInstances] API.\n\
        \                      \n\
        \                        DNS_PRIVATE  Instances can be discovered using DNS queries in \
         VPCs and using the [DiscoverInstances] API.\n\
        \                                     \n\
        \                                       "]
  name : namespace_name option; [@ocaml.doc "The name of the namespace, such as [example.com].\n"]
  arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that Cloud Map assigns to the namespace when you create it.\n"]
  id : resource_id option; [@ocaml.doc "The ID of a namespace.\n"]
}
[@@ocaml.doc "A complex type that contains information about a specified namespace.\n"]

type nonrec get_namespace_response = {
  namespace : namespace option;
      [@ocaml.doc "A complex type that contains information about the specified namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec get_namespace_request = {
  id : resource_id; [@ocaml.doc "The ID of the namespace that you want to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec health_status =
  | UNKNOWN [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_health_status_map = (resource_id * health_status) list [@@ocaml.doc ""]

type nonrec get_instances_health_status_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If more than [MaxResults] instances match the specified criteria, you can submit another \
         [GetInstancesHealthStatus] request to get the next group of results. Specify the value of \
         [NextToken] from the previous response in the next request.\n"]
  status : instance_health_status_map option;
      [@ocaml.doc
        "A complex type that contains the IDs and the health status of the instances that you \
         specified in the [GetInstancesHealthStatus] request.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_id_list = resource_id list [@@ocaml.doc ""]

type nonrec get_instances_health_status_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first [GetInstancesHealthStatus] request, omit this value.\n\n\
        \ If more than [MaxResults] instances match the specified criteria, you can submit another \
         [GetInstancesHealthStatus] request to get the next group of results. Specify the value of \
         [NextToken] from the previous response in the next request.\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of instances that you want Cloud Map to return in the response to a \
         [GetInstancesHealthStatus] request. If you don't specify a value for [MaxResults], Cloud \
         Map returns up to 100 instances.\n"]
  instances : instance_id_list option;
      [@ocaml.doc
        "An array that contains the IDs of all the instances that you want to get the health \
         status for.\n\n\
        \ If you omit [Instances], Cloud Map returns the health status for all the instances that \
         are associated with the specified service.\n\
        \ \n\
        \   To get the IDs for the instances that you've registered by using a specified service, \
         submit a \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListInstances.html}ListInstances} \
         request.\n\
        \   \n\
        \    "]
  service_id : resource_id;
      [@ocaml.doc "The ID of the service that the instance is associated with.\n"]
}
[@@ocaml.doc ""]

type nonrec instance = {
  attributes : attributes option;
      [@ocaml.doc
        "A string map that contains the following information for the service that you specify in \
         [ServiceId]:\n\n\
        \ {ul\n\
        \       {-  The attributes that apply to the records that are defined in the service. \n\
        \           \n\
        \            }\n\
        \       {-  For each attribute, the applicable value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Do not include sensitive information in the attributes if the namespace is \
         discoverable by public DNS queries.\n\
        \    \n\
        \      Supported attribute keys include the following:\n\
        \      \n\
        \        AWS_ALIAS_DNS_NAME  If you want Cloud Map to create a Route\194\16053 alias \
         record that routes traffic to an Elastic Load Balancing load balancer, specify the DNS \
         name that's associated with the load balancer. For information about how to get the DNS \
         name, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_AliasTarget.html#Route53-Type-AliasTarget-DNSName}AliasTarget->DNSName} \
         in the {i Route\194\16053 API Reference}.\n\
        \                            \n\
        \                             Note the following:\n\
        \                             \n\
        \                              {ul\n\
        \                                    {-  The configuration for the service that's \
         specified by [ServiceId] must include settings for an [A] record, an [AAAA] record, or \
         both.\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  In the service that's specified by [ServiceId], \
         the value of [RoutingPolicy] must be [WEIGHTED].\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  If the service that's specified by [ServiceId] \
         includes [HealthCheckConfig] settings, Cloud Map creates the health check, but it won't \
         associate the health check with the alias record.\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  Auto naming currently doesn't support creating \
         alias records that route traffic to Amazon Web Services resources other than ELB load \
         balancers.\n\
        \                                        \n\
        \                                         }\n\
        \                                    {-  If you specify a value for [AWS_ALIAS_DNS_NAME], \
         don't specify values for any of the [AWS_INSTANCE] attributes.\n\
        \                                        \n\
        \                                         }\n\
        \                                    }\n\
        \    AWS_EC2_INSTANCE_ID   {i HTTP namespaces only.} The Amazon EC2 instance ID for the \
         instance. The [AWS_INSTANCE_IPV4] attribute contains the primary private IPv4 address.\n\
        \                         \n\
        \                           AWS_INIT_HEALTH_STATUS  If the service configuration includes \
         [HealthCheckCustomConfig], you can optionally use [AWS_INIT_HEALTH_STATUS] to specify the \
         initial status of the custom health check, [HEALTHY] or [UNHEALTHY]. If you don't specify \
         a value for [AWS_INIT_HEALTH_STATUS], the initial status is [HEALTHY].\n\
        \                                                   \n\
        \                                                     AWS_INSTANCE_CNAME  If the service \
         configuration includes a [CNAME] record, the domain name that you want Route\194\16053 to \
         return in response to DNS queries (for example, [example.com]).\n\
        \                                                                         \n\
        \                                                                          This value is \
         required if the service specified by [ServiceId] includes settings for an [CNAME] record.\n\
        \                                                                          \n\
        \                                                                            \
         AWS_INSTANCE_IPV4  \n\
         If the service configuration includes an [A] record, the IPv4 address that you want \
         Route\194\16053 to return in response to DNS queries (for example, [192.0.2.44]).\n\n\
        \ This value is required if the service specified by [ServiceId] includes settings for an \
         [A] record. If the service includes settings for an [SRV] record, you must specify a \
         value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.\n\
        \ \n\
        \   AWS_INSTANCE_IPV6  If the service configuration includes an [AAAA] record, the IPv6 \
         address that you want Route\194\16053 to return in response to DNS queries (for example, \
         [2001:0db8:85a3:0000:0000:abcd:0001:2345]).\n\
        \                      \n\
        \                       This value is required if the service specified by [ServiceId] \
         includes settings for an [AAAA] record. If the service includes settings for an [SRV] \
         record, you must specify a value for [AWS_INSTANCE_IPV4], [AWS_INSTANCE_IPV6], or both.\n\
        \                       \n\
        \                         AWS_INSTANCE_PORT  If the service includes an [SRV] record, the \
         value that you want Route\194\16053 to return for the port.\n\
        \                                            \n\
        \                                             If the service includes [HealthCheckConfig], \
         the port on the endpoint that you want Route\194\16053 to send requests to. \n\
        \                                             \n\
        \                                              This value is required if you specified \
         settings for an [SRV] record or a Route\194\16053 health check when you created the \
         service.\n\
        \                                              \n\
        \                                                "]
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed [RegisterInstance] \
         requests to be retried without the risk of executing the operation twice. You must use a \
         unique [CreatorRequestId] string every time you submit a [RegisterInstance] request if \
         you're registering additional instances for the same namespace and service. \
         [CreatorRequestId] can be any unique string (for example, a date/time stamp).\n"]
  id : resource_id;
      [@ocaml.doc
        "An identifier that you want to associate with the instance. Note the following:\n\n\
        \ {ul\n\
        \       {-  If the service that's specified by [ServiceId] includes settings for an [SRV] \
         record, the value of [InstanceId] is automatically included as part of the value for the \
         [SRV] record. For more information, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_DnsRecord.html#cloudmap-Type-DnsRecord-Type}DnsRecord \
         > Type}.\n\
        \           \n\
        \            }\n\
        \       {-  You can use this value to update an existing instance.\n\
        \           \n\
        \            }\n\
        \       {-  To register a new instance, you must specify a value that's unique among \
         instances that you register by using the same service. \n\
        \           \n\
        \            }\n\
        \       {-  If you specify an existing [InstanceId] and [ServiceId], Cloud Map updates the \
         existing DNS records. If there's also an existing health check, Cloud Map deletes the old \
         health check and creates a new one. \n\
        \           \n\
        \             The health check isn't deleted immediately, so it will still appear for a \
         while if you submit a [ListHealthChecks] request, for example.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A complex type that contains information about an instance that Cloud Map creates when you \
   submit a [RegisterInstance] request.\n"]

type nonrec get_instance_response = {
  instance : instance option;
      [@ocaml.doc "A complex type that contains information about a specified instance.\n"]
}
[@@ocaml.doc ""]

type nonrec get_instance_request = {
  instance_id : resource_id;
      [@ocaml.doc "The ID of the instance that you want to get information about.\n"]
  service_id : resource_id;
      [@ocaml.doc "The ID of the service that the instance is associated with.\n"]
}
[@@ocaml.doc ""]

type nonrec request_limit_exceeded = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation can't be completed because you've reached the quota for the number of requests. \
   For more information, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/dg/throttling.html}Cloud Map API request \
   throttling quota} in the {i Cloud Map Developer Guide}.\n"]

type nonrec revision = int [@@ocaml.doc ""]

type nonrec discover_instances_revision_response = {
  instances_revision : revision option;
      [@ocaml.doc
        "The increasing revision associated to the response Instances list. If a new instance is \
         registered or deregistered, the [InstancesRevision] updates. The health status updates \
         don't update [InstancesRevision].\n"]
}
[@@ocaml.doc ""]

type nonrec discover_instances_revision_request = {
  service_name : service_name;
      [@ocaml.doc "The name of the service that you specified when you registered the instance.\n"]
  namespace_name : namespace_name;
      [@ocaml.doc
        "The [HttpName] name of the namespace. It's found in the [HttpProperties] member of the \
         [Properties] member of the namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_name_http = string [@@ocaml.doc ""]

type nonrec http_instance_summary = {
  attributes : attributes option;
      [@ocaml.doc
        "If you included any attributes when you registered the instance, the values of those \
         attributes.\n"]
  health_status : health_status option;
      [@ocaml.doc
        "If you configured health checking in the service, the current health status of the \
         service instance.\n"]
  service_name : service_name option;
      [@ocaml.doc "The name of the service that you specified when you registered the instance.\n"]
  namespace_name : namespace_name_http option;
      [@ocaml.doc
        "    \n\n\
        \ The [HttpName] name of the namespace. It's found in the [HttpProperties] member of the \
         [Properties] member of the namespace.\n\
        \ "]
  instance_id : resource_id option;
      [@ocaml.doc
        "The ID of an instance that matches the values that you specified in the request.\n"]
}
[@@ocaml.doc
  "In a response to a \
   {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_DiscoverInstances.html}DiscoverInstances} \
   request, [HttpInstanceSummary] contains information about one instance that matches the values \
   that you specified in the request.\n"]

type nonrec http_instance_summary_list = http_instance_summary list [@@ocaml.doc ""]

type nonrec discover_instances_response = {
  instances_revision : revision option;
      [@ocaml.doc
        "The increasing revision associated to the response Instances list. If a new instance is \
         registered or deregistered, the [InstancesRevision] updates. The health status updates \
         don't update [InstancesRevision].\n"]
  instances : http_instance_summary_list option;
      [@ocaml.doc
        "A complex type that contains one [HttpInstanceSummary] for each registered instance.\n"]
}
[@@ocaml.doc ""]

type nonrec discover_max_results = int [@@ocaml.doc ""]

type nonrec health_status_filter =
  | HEALTHY_OR_ELSE_ALL [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec discover_instances_request = {
  health_status : health_status_filter option;
      [@ocaml.doc
        "The health status of the instances that you want to discover. This parameter is ignored \
         for services that don't have a health check configured, and all instances are returned.\n\n\
        \  HEALTHY  Returns healthy instances.\n\
        \           \n\
        \             UNHEALTHY  Returns unhealthy instances.\n\
        \                        \n\
        \                          ALL  Returns all instances.\n\
        \                               \n\
        \                                 HEALTHY_OR_ELSE_ALL  Returns healthy instances, unless \
         none are reporting a healthy state. In that case, return all instances. This is also \
         called failing open.\n\
        \                                                      \n\
        \                                                        "]
  optional_parameters : attributes option;
      [@ocaml.doc
        "Opportunistic filters to scope the results based on custom attributes. If there are \
         instances that match both the filters specified in both the [QueryParameters] parameter \
         and this parameter, all of these instances are returned. Otherwise, the filters are \
         ignored, and only instances that match the filters that are specified in the \
         [QueryParameters] parameter are returned.\n"]
  query_parameters : attributes option;
      [@ocaml.doc
        "Filters to scope the results based on custom attributes for the instance (for example, \
         [{version=v1,\n\
        \    az=1a}]). Only instances that match all the specified key-value pairs are returned.\n"]
  max_results : discover_max_results option;
      [@ocaml.doc
        "The maximum number of instances that you want Cloud Map to return in the response to a \
         [DiscoverInstances] request. If you don't specify a value for [MaxResults], Cloud Map \
         returns up to 100 instances.\n"]
  service_name : service_name;
      [@ocaml.doc "The name of the service that you specified when you registered the instance.\n"]
  namespace_name : namespace_name;
      [@ocaml.doc
        "The [HttpName] name of the namespace. It's found in the [HttpProperties] member of the \
         [Properties] member of the namespace. In most cases, [Name] and [HttpName] match. \
         However, if you reuse [Name] for namespace creation, a generated hash is added to \
         [HttpName] to distinguish the two.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_instance_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_instance_request = {
  instance_id : resource_id;
      [@ocaml.doc
        "The value that you specified for [Id] in the \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} \
         request.\n"]
  service_id : resource_id;
      [@ocaml.doc "The ID of the service that the instance is associated with.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_service_attributes_response = unit [@@ocaml.doc ""]

type nonrec delete_service_attributes_request = {
  attributes : service_attribute_key_list;
      [@ocaml.doc "A list of keys corresponding to each attribute that you want to delete.\n"]
  service_id : resource_id;
      [@ocaml.doc "The ID of the service from which the attributes will be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_service_response = unit [@@ocaml.doc ""]

type nonrec delete_service_request = {
  id : resource_id; [@ocaml.doc "The ID of the service that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_namespace_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_namespace_request = {
  id : resource_id; [@ocaml.doc "The ID of the namespace that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_service_response = {
  service : service option;
      [@ocaml.doc "A complex type that contains information about the new service.\n"]
}
[@@ocaml.doc ""]

type nonrec create_service_request = {
  type_ : service_type_option option;
      [@ocaml.doc
        "If present, specifies that the service instances are only discoverable using the \
         [DiscoverInstances] API operation. No DNS records is registered for the service \
         instances. The only valid value is [HTTP].\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags to add to the service. Each tag consists of a key and an optional value that you \
         define. Tags keys can be up to 128 characters in length, and tag values can be up to 256 \
         characters in length.\n"]
  health_check_custom_config : health_check_custom_config option;
      [@ocaml.doc
        "A complex type that contains information about an optional custom health check.\n\n\
        \  If you specify a health check configuration, you can specify either \
         [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.\n\
        \  \n\
        \    You can't add, update, or delete a [HealthCheckCustomConfig] configuration from an \
         existing service.\n\
        \    "]
  health_check_config : health_check_config option;
      [@ocaml.doc
        " {i Public DNS and HTTP namespaces only.} A complex type that contains settings for an \
         optional Route\194\16053 health check. If you specify settings for a health check, Cloud \
         Map associates the health check with all the Route\194\16053 DNS records that you specify \
         in [DnsConfig].\n\n\
        \  If you specify a health check configuration, you can specify either \
         [HealthCheckCustomConfig] or [HealthCheckConfig] but not both.\n\
        \  \n\
        \    For information about the charges for health checks, see \
         {{:http://aws.amazon.com/cloud-map/pricing/}Cloud Map Pricing}.\n\
        \    "]
  dns_config : dns_config option;
      [@ocaml.doc
        "A complex type that contains information about the Amazon Route\194\16053 records that \
         you want Cloud Map to create when you register an instance. \n"]
  description : resource_description option; [@ocaml.doc "A description for the service.\n"]
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed [CreateService] \
         requests to be retried without the risk of running the operation twice. \
         [CreatorRequestId] can be any unique string (for example, a date/timestamp).\n"]
  namespace_id : resource_id option;
      [@ocaml.doc
        "The ID of the namespace that you want to use to create the service. The namespace ID must \
         be specified, but it can be specified either here or in the [DnsConfig] object.\n"]
  name : service_name;
      [@ocaml.doc
        "The name that you want to assign to the service.\n\n\
        \  Do not include sensitive information in the name if the namespace is discoverable by \
         public DNS queries.\n\
        \  \n\
        \    If you want Cloud Map to create an [SRV] record when you register an instance and \
         you're using a system that requires a specific [SRV] format, such as \
         {{:http://www.haproxy.org/}HAProxy}, specify the following for [Name]:\n\
        \    \n\
        \     {ul\n\
        \           {-  Start the name with an underscore (_), such as [_exampleservice].\n\
        \               \n\
        \                }\n\
        \           {-  End the name with {i ._protocol}, such as [._tcp].\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   When you register an instance, Cloud Map creates an [SRV] record and assigns a name to \
         the record by concatenating the service name and the namespace name (for example,\n\
        \   \n\
        \     [_exampleservice._tcp.example.com]).\n\
        \    \n\
        \      For services that are accessible by DNS queries, you can't create multiple services \
         with names that differ only by case (such as EXAMPLE and example). Otherwise, these \
         services have the same DNS name and can't be distinguished. However, if you use a \
         namespace that's only accessible by API calls, then you can create services that with \
         names that differ only by case.\n\
        \      \n\
        \       "]
}
[@@ocaml.doc ""]

type nonrec namespace_already_exists = {
  namespace_id : resource_id option; [@ocaml.doc "The ID of the existing namespace.\n"]
  creator_request_id : resource_id option;
      [@ocaml.doc "The [CreatorRequestId] that was used to create the namespace.\n"]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The namespace that you're trying to create already exists.\n"]

type nonrec create_public_dns_namespace_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_name_public = string [@@ocaml.doc ""]

type nonrec public_dns_properties_mutable = {
  so_a : so_a;
      [@ocaml.doc
        "Start of Authority (SOA) record for the hosted zone for the public DNS namespace.\n"]
}
[@@ocaml.doc "DNS properties for the public DNS namespace.\n"]

type nonrec public_dns_namespace_properties = {
  dns_properties : public_dns_properties_mutable;
      [@ocaml.doc "DNS properties for the public DNS namespace.\n"]
}
[@@ocaml.doc "DNS properties for the public DNS namespace.\n"]

type nonrec create_public_dns_namespace_request = {
  properties : public_dns_namespace_properties option;
      [@ocaml.doc "Properties for the public DNS namespace.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags to add to the namespace. Each tag consists of a key and an optional value that \
         you define. Tags keys can be up to 128 characters in length, and tag values can be up to \
         256 characters in length.\n"]
  description : resource_description option; [@ocaml.doc "A description for the namespace.\n"]
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed \
         [CreatePublicDnsNamespace] requests to be retried without the risk of running the \
         operation twice. [CreatorRequestId] can be any unique string (for example, a \
         date/timestamp).\n"]
  name : namespace_name_public;
      [@ocaml.doc
        "The name that you want to assign to this namespace.\n\n\
        \  Do not include sensitive information in the name. The name is publicly available using \
         DNS queries.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_private_dns_namespace_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_name_private = string [@@ocaml.doc ""]

type nonrec private_dns_properties_mutable = {
  so_a : so_a;
      [@ocaml.doc
        "Fields for the Start of Authority (SOA) record for the hosted zone for the private DNS \
         namespace.\n"]
}
[@@ocaml.doc "DNS properties for the private DNS namespace.\n"]

type nonrec private_dns_namespace_properties = {
  dns_properties : private_dns_properties_mutable;
      [@ocaml.doc "DNS properties for the private DNS namespace.\n"]
}
[@@ocaml.doc "DNS properties for the private DNS namespace.\n"]

type nonrec create_private_dns_namespace_request = {
  properties : private_dns_namespace_properties option;
      [@ocaml.doc "Properties for the private DNS namespace.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags to add to the namespace. Each tag consists of a key and an optional value that \
         you define. Tags keys can be up to 128 characters in length, and tag values can be up to \
         256 characters in length.\n"]
  vpc : resource_id;
      [@ocaml.doc "The ID of the Amazon VPC that you want to associate the namespace with.\n"]
  description : resource_description option; [@ocaml.doc "A description for the namespace.\n"]
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed \
         [CreatePrivateDnsNamespace] requests to be retried without the risk of running the \
         operation twice. [CreatorRequestId] can be any unique string (for example, a \
         date/timestamp).\n"]
  name : namespace_name_private;
      [@ocaml.doc
        "The name that you want to assign to this namespace. When you create a private DNS \
         namespace, Cloud Map automatically creates an Amazon Route\194\16053 private hosted zone \
         that has the same name as the namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec create_http_namespace_response = {
  operation_id : operation_id option;
      [@ocaml.doc
        "A value that you can use to determine whether the request completed successfully. To get \
         the status of the operation, see \
         {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_GetOperation.html}GetOperation}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_http_namespace_request = {
  tags : tag_list option;
      [@ocaml.doc
        "The tags to add to the namespace. Each tag consists of a key and an optional value that \
         you define. Tags keys can be up to 128 characters in length, and tag values can be up to \
         256 characters in length.\n"]
  description : resource_description option; [@ocaml.doc "A description for the namespace.\n"]
  creator_request_id : resource_id option;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed [CreateHttpNamespace] \
         requests to be retried without the risk of running the operation twice. \
         [CreatorRequestId] can be any unique string (for example, a date/time stamp).\n"]
  name : namespace_name_http; [@ocaml.doc "The name that you want to assign to this namespace.\n"]
}
[@@ocaml.doc ""]
