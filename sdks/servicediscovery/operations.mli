open Types

module CreateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    create_http_namespace_request ->
    ( create_http_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `NamespaceAlreadyExists of namespace_already_exists
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Creates an HTTP namespace. Service instances registered using an HTTP namespace can be \
   discovered using a [DiscoverInstances] request but can't be discovered using DNS.\n\n\
  \ For the current quota on the number of namespaces that you can create using the same Amazon \
   Web Services account, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in \
   the {i Cloud Map Developer Guide}.\n\
  \ "]

module CreatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    create_private_dns_namespace_request ->
    ( create_private_dns_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `NamespaceAlreadyExists of namespace_already_exists
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Creates a private namespace based on DNS, which is visible only inside a specified Amazon VPC. \
   The namespace defines your service naming scheme. For example, if you name your namespace \
   [example.com] and name your service [backend], the resulting DNS name for the service is \
   [backend.example.com]. Service instances that are registered using a private DNS namespace can \
   be discovered using either a [DiscoverInstances] request or using DNS. For the current quota on \
   the number of namespaces that you can create using the same Amazon Web Services account, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in \
   the {i Cloud Map Developer Guide}.\n"]

module CreatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    create_public_dns_namespace_request ->
    ( create_public_dns_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `NamespaceAlreadyExists of namespace_already_exists
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Creates a public namespace based on DNS, which is visible on the internet. The namespace \
   defines your service naming scheme. For example, if you name your namespace [example.com] and \
   name your service [backend], the resulting DNS name for the service is [backend.example.com]. \
   You can discover instances that were registered with a public DNS namespace by using either a \
   [DiscoverInstances] request or using DNS. For the current quota on the number of namespaces \
   that you can create using the same Amazon Web Services account, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in \
   the {i Cloud Map Developer Guide}.\n\n\
  \  The [CreatePublicDnsNamespace] API operation is not supported in the Amazon Web Services \
   GovCloud (US) Regions.\n\
  \  \n\
  \   "]

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
    create_service_request ->
    ( create_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ServiceAlreadyExists of service_already_exists
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc
  "Creates a service. This action defines the configuration for the following entities:\n\n\
  \ {ul\n\
  \       {-  For public and private DNS namespaces, one of the following combinations of DNS \
   records in Amazon Route\194\16053:\n\
  \           \n\
  \            {ul\n\
  \                  {-   [A] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [AAAA] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [A] and [AAAA] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [SRV] \n\
  \                      \n\
  \                       }\n\
  \                  {-   [CNAME] \n\
  \                      \n\
  \                       }\n\
  \                  \n\
  \        }\n\
  \         }\n\
  \       {-  Optionally, a health check\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   After you create the service, you can submit a \
   {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} \
   request, and Cloud Map uses the values in the configuration to create the specified entities.\n\
  \   \n\
  \    For the current quota on the number of instances that you can register using the same \
   namespace and using the same service, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in \
   the {i Cloud Map Developer Guide}.\n\
  \    "]

module DeleteNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_namespace_request ->
    ( delete_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found
      | `ResourceInUse of resource_in_use ] )
    result
end
[@@ocaml.doc
  "Deletes a namespace from the current account. If the namespace still contains one or more \
   services, the request fails.\n"]

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_service_request ->
    ( delete_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ResourceInUse of resource_in_use
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Deletes a specified service and all associated service attributes. If the service still \
   contains one or more registered instances, the request fails.\n"]

module DeleteServiceAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_service_attributes_request ->
    ( delete_service_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc "Deletes specific attributes associated with a service.\n"]

module DeregisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
    deregister_instance_request ->
    ( deregister_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InstanceNotFound of instance_not_found
      | `InvalidInput of invalid_input
      | `ResourceInUse of resource_in_use
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Deletes the Amazon Route\194\16053 DNS records and health check, if any, that Cloud Map created \
   for the specified instance.\n"]

module DiscoverInstances : sig
  val request :
    Smaws_Lib.Context.t ->
    discover_instances_request ->
    ( discover_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found
      | `RequestLimitExceeded of request_limit_exceeded
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Discovers registered instances for a specified namespace and service. You can use \
   [DiscoverInstances] to discover instances for any type of namespace. [DiscoverInstances] \
   returns a randomized list of instances allowing customers to distribute traffic evenly across \
   instances. For public and private DNS namespaces, you can also use DNS queries to discover \
   instances.\n"]

module DiscoverInstancesRevision : sig
  val request :
    Smaws_Lib.Context.t ->
    discover_instances_revision_request ->
    ( discover_instances_revision_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found
      | `RequestLimitExceeded of request_limit_exceeded
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc "Discovers the increasing revision associated with an instance.\n"]

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
    get_instance_request ->
    ( get_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceNotFound of instance_not_found
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc "Gets information about a specified instance.\n"]

module GetInstancesHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    get_instances_health_status_request ->
    ( get_instances_health_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InstanceNotFound of instance_not_found
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Gets the current health status ([Healthy], [Unhealthy], or [Unknown]) of one or more instances \
   that are associated with a specified service.\n\n\
  \  There's a brief delay between when you register an instance and when the health status for \
   the instance is available. \n\
  \  \n\
  \   "]

module GetNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    get_namespace_request ->
    ( get_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found ] )
    result
end
[@@ocaml.doc "Gets information about a namespace.\n"]

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
    get_operation_request ->
    ( get_operation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationNotFound of operation_not_found ] )
    result
end
[@@ocaml.doc
  "Gets information about any operation that returns an operation ID in the response, such as a \
   [CreateHttpNamespace] request.\n\n\
  \  To get a list of operations that match specified criteria, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html}ListOperations}.\n\
  \  \n\
  \   "]

module GetService : sig
  val request :
    Smaws_Lib.Context.t ->
    get_service_request ->
    ( get_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc "Gets the settings for a specified service.\n"]

module GetServiceAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
    get_service_attributes_request ->
    ( get_service_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc "Returns the attributes associated with a specified service.\n"]

module ListInstances : sig
  val request :
    Smaws_Lib.Context.t ->
    list_instances_request ->
    ( list_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Lists summary information about the instances that you registered by using a specified service.\n"]

module ListNamespaces : sig
  val request :
    Smaws_Lib.Context.t ->
    list_namespaces_request ->
    ( list_namespaces_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] )
    result
end
[@@ocaml.doc
  "Lists summary information about the namespaces that were created by the current Amazon Web \
   Services account.\n"]

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
    list_operations_request ->
    ( list_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] )
    result
end
[@@ocaml.doc "Lists operations that match the criteria that you specify.\n"]

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
    list_services_request ->
    ( list_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] )
    result
end
[@@ocaml.doc
  "Lists summary information for all the services that are associated with one or more namespaces.\n"]

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Lists tags for the specified resource.\n"]

module RegisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
    register_instance_request ->
    ( register_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `ResourceInUse of resource_in_use
      | `ResourceLimitExceeded of resource_limit_exceeded
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Creates or updates one or more records and, optionally, creates a health check based on the \
   settings in a specified service. When you submit a [RegisterInstance] request, the following \
   occurs:\n\n\
  \ {ul\n\
  \       {-  For each DNS record that you define in the service that's specified by [ServiceId], \
   a record is created or updated in the hosted zone that's associated with the corresponding \
   namespace.\n\
  \           \n\
  \            }\n\
  \       {-  If the service includes [HealthCheckConfig], a health check is created based on the \
   settings in the health check configuration.\n\
  \           \n\
  \            }\n\
  \       {-  The health check, if any, is associated with each of the new or updated records.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    One [RegisterInstance] request must complete before you can submit another request and \
   specify the same service ID and instance ID.\n\
  \    \n\
  \      For more information, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html}CreateService}.\n\
  \      \n\
  \       When Cloud Map receives a DNS query for the specified DNS name, it returns the \
   applicable value:\n\
  \       \n\
  \        {ul\n\
  \              {-   {b If the health check is healthy}: returns all the records\n\
  \                  \n\
  \                   }\n\
  \              {-   {b If the health check is unhealthy}: returns the applicable value for the \
   last healthy instance\n\
  \                  \n\
  \                   }\n\
  \              {-   {b If you didn't specify a health check configuration}: returns all the \
   records\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   For the current quota on the number of instances that you can register using the same \
   namespace and using the same service, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in \
   the {i Cloud Map Developer Guide}.\n\
  \   "]

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result
end
[@@ocaml.doc "Adds one or more tags to the specified resource.\n"]

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Removes one or more tags from the specified resource.\n"]

module UpdateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    update_http_namespace_request ->
    ( update_http_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found
      | `ResourceInUse of resource_in_use ] )
    result
end
[@@ocaml.doc "Updates an HTTP namespace.\n"]

module UpdateInstanceCustomHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    update_instance_custom_health_status_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CustomHealthNotFound of custom_health_not_found
      | `InstanceNotFound of instance_not_found
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Submits a request to change the health status of a custom health check to healthy or unhealthy.\n\n\
  \ You can use [UpdateInstanceCustomHealthStatus] to change the status only for custom health \
   checks, which you define using [HealthCheckCustomConfig] when you create a service. You can't \
   use it to change the status for Route\194\16053 health checks, which you define using \
   [HealthCheckConfig].\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_HealthCheckCustomConfig.html}HealthCheckCustomConfig}.\n\
  \  "]

module UpdatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    update_private_dns_namespace_request ->
    ( update_private_dns_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found
      | `ResourceInUse of resource_in_use ] )
    result
end
[@@ocaml.doc "Updates a private DNS namespace.\n"]

module UpdatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
    update_public_dns_namespace_request ->
    ( update_public_dns_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `NamespaceNotFound of namespace_not_found
      | `ResourceInUse of resource_in_use ] )
    result
end
[@@ocaml.doc "Updates a public DNS namespace.\n"]

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
    update_service_request ->
    ( update_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc
  "Submits a request to perform the following operations:\n\n\
  \ {ul\n\
  \       {-  Update the TTL setting for existing [DnsRecords] configurations\n\
  \           \n\
  \            }\n\
  \       {-  Add, update, or delete [HealthCheckConfig] for a specified service\n\
  \           \n\
  \             You can't add, update, or delete a [HealthCheckCustomConfig] configuration.\n\
  \             \n\
  \               }\n\
  \       }\n\
  \   For public and private DNS namespaces, note the following:\n\
  \   \n\
  \    {ul\n\
  \          {-  If you omit any existing [DnsRecords] or [HealthCheckConfig] configurations from \
   an [UpdateService] request, the configurations are deleted from the service.\n\
  \              \n\
  \               }\n\
  \          {-  If you omit an existing [HealthCheckCustomConfig] configuration from an \
   [UpdateService] request, the configuration isn't deleted from the service.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   When you update settings for a service, Cloud Map also updates the corresponding settings in \
   all the records and health checks that were created by using the specified service.\n\
  \   "]

module UpdateServiceAttributes : sig
  val request :
    Smaws_Lib.Context.t ->
    update_service_attributes_request ->
    ( update_service_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `ServiceAttributesLimitExceededException of service_attributes_limit_exceeded_exception
      | `ServiceNotFound of service_not_found ] )
    result
end
[@@ocaml.doc "Submits a request to update a specified service to add service-level attributes.\n"]
