open Types

module AssociateCustomDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_custom_domain_request ->
    ( associate_custom_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception ] )
    result
end
[@@ocaml.doc
  "Associate your own domain name with the App Runner subdomain URL of your App Runner service.\n\n\
  \ After you call [AssociateCustomDomain] and receive a successful response, use the information \
   in the [CustomDomain] record that's returned to add CNAME records to your Domain Name System \
   (DNS). For each mapped domain name, add a mapping to the target App Runner subdomain and one or \
   more certificate validation records. App Runner then performs DNS validation to verify that you \
   own or control the domain name that you associated. App Runner tracks domain validity in a \
   certificate stored in {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate \
   Manager (ACM)}.\n\
  \ "]

module CreateAutoScalingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_auto_scaling_configuration_request ->
    ( create_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner automatic scaling configuration resource. App Runner requires this \
   resource when you create or update App Runner services and you require non-default auto scaling \
   settings. You can share an auto scaling configuration across multiple services.\n\n\
  \ Create multiple revisions of a configuration by calling this action multiple times using the \
   same [AutoScalingConfigurationName]. The call returns incremental \
   [AutoScalingConfigurationRevision] values. When you create a service and configure an auto \
   scaling configuration resource, the service uses the latest active revision of the auto scaling \
   configuration by default. You can optionally configure the service to use a specific revision.\n\
  \ \n\
  \  Configure a higher [MinSize] to increase the spread of your App Runner service over more \
   Availability Zones in the Amazon Web Services Region. The tradeoff is a higher minimal cost.\n\
  \  \n\
  \   Configure a lower [MaxSize] to control your cost. The tradeoff is lower responsiveness \
   during peak demand.\n\
  \   "]

module CreateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner connection resource. App Runner requires a connection resource when you \
   create App Runner services that access private repositories from certain third-party providers. \
   You can share a connection across multiple services.\n\n\
  \ A connection resource is needed to access GitHub and Bitbucket repositories. Both require a \
   user interface approval process through the App Runner console before you can use the \
   connection.\n\
  \ "]

module CreateObservabilityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_observability_configuration_request ->
    ( create_observability_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner observability configuration resource. App Runner requires this resource \
   when you create or update App Runner services and you want to enable non-default observability \
   features. You can share an observability configuration across multiple services.\n\n\
  \ Create multiple revisions of a configuration by calling this action multiple times using the \
   same [ObservabilityConfigurationName]. The call returns incremental \
   [ObservabilityConfigurationRevision] values. When you create a service and configure an \
   observability configuration resource, the service uses the latest active revision of the \
   observability configuration by default. You can optionally configure the service to use a \
   specific revision.\n\
  \ \n\
  \  The observability configuration resource is designed to configure multiple features \
   (currently one feature, tracing). This action takes optional parameters that describe the \
   configuration of these features (currently one parameter, [TraceConfiguration]). If you don't \
   specify a feature parameter, App Runner doesn't enable the feature.\n\
  \  "]

module CreateService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_request ->
    ( create_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner service. After the service is created, the action also automatically \
   starts a deployment.\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the \
   {{:https://docs.aws.amazon.com/apprunner/latest/api/API_ListOperations.html}ListOperations} \
   call to track the operation's progress.\n\
  \ "]

module CreateVpcConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_connector_request ->
    ( create_vpc_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner VPC connector resource. App Runner requires this resource when you want to \
   associate your App Runner service to a custom Amazon Virtual Private Cloud (Amazon VPC).\n"]

module CreateVpcIngressConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_vpc_ingress_connection_request ->
    ( create_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Create an App Runner VPC Ingress Connection resource. App Runner requires this resource when \
   you want to associate your App Runner service with an Amazon VPC endpoint.\n"]

module DeleteAutoScalingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_auto_scaling_configuration_request ->
    ( delete_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner automatic scaling configuration resource. You can delete a top level auto \
   scaling configuration, a specific revision of one, or all revisions associated with the top \
   level configuration. You can't delete the default auto scaling configuration or a configuration \
   that's used by one or more App Runner services.\n"]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner connection. You must first ensure that there are no running App Runner \
   services that use this connection. If there are any, the [DeleteConnection] action fails.\n"]

module DeleteObservabilityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_observability_configuration_request ->
    ( delete_observability_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner observability configuration resource. You can delete a specific revision \
   or the latest active revision. You can't delete a configuration that's used by one or more App \
   Runner services.\n"]

module DeleteService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_request ->
    ( delete_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner service.\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \ \n\
  \   Make sure that you don't have any active VPCIngressConnections associated with the service \
   you want to delete. \n\
  \   \n\
  \    "]

module DeleteVpcConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_connector_request ->
    ( delete_vpc_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner VPC connector resource. You can't delete a connector that's used by one or \
   more App Runner services.\n"]

module DeleteVpcIngressConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_vpc_ingress_connection_request ->
    ( delete_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Delete an App Runner VPC Ingress Connection resource that's associated with an App Runner \
   service. The VPC Ingress Connection must be in one of the following states to be deleted: \n\n\
  \ {ul\n\
  \       {-   [AVAILABLE] \n\
  \           \n\
  \            }\n\
  \       {-   [FAILED_CREATION] \n\
  \           \n\
  \            }\n\
  \       {-   [FAILED_UPDATE] \n\
  \           \n\
  \            }\n\
  \       {-   [FAILED_DELETION] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribeAutoScalingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_scaling_configuration_request ->
    ( describe_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Return a full description of an App Runner automatic scaling configuration resource.\n"]

module DescribeCustomDomains : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_custom_domains_request ->
    ( describe_custom_domains_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Return a description of custom domain names that are associated with an App Runner service.\n"]

module DescribeObservabilityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_observability_configuration_request ->
    ( describe_observability_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a full description of an App Runner observability configuration resource.\n"]

module DescribeService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_request ->
    ( describe_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a full description of an App Runner service.\n"]

module DescribeVpcConnector : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_connector_request ->
    ( describe_vpc_connector_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a description of an App Runner VPC connector resource.\n"]

module DescribeVpcIngressConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_vpc_ingress_connection_request ->
    ( describe_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Return a full description of an App Runner VPC Ingress Connection resource.\n"]

module DisassociateCustomDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_custom_domain_request ->
    ( disassociate_custom_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Disassociate a custom domain name from an App Runner service.\n\n\
  \ Certificates tracking domain validity are associated with a custom domain and are stored in \
   {{:https://docs.aws.amazon.com/acm/latest/userguide}AWS Certificate Manager (ACM)}. These \
   certificates aren't deleted as part of this action. App Runner delays certificate deletion for \
   30 days after a domain is disassociated from your service.\n\
  \ "]

module ListAutoScalingConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_auto_scaling_configurations_request ->
    ( list_auto_scaling_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of active App Runner automatic scaling configurations in your Amazon Web \
   Services account. You can query the revisions for a specific configuration name or the \
   revisions for all active configurations in your account. You can optionally query only the \
   latest revision of each requested name.\n\n\
  \ To retrieve a full description of a particular configuration revision, call and provide one of \
   the ARNs returned by [ListAutoScalingConfigurations].\n\
  \ "]

module ListConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connections_request ->
    ( list_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of App Runner connections that are associated with your Amazon Web Services \
   account.\n"]

module ListObservabilityConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_observability_configurations_request ->
    ( list_observability_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of active App Runner observability configurations in your Amazon Web Services \
   account. You can query the revisions for a specific configuration name or the revisions for all \
   active configurations in your account. You can optionally query only the latest revision of \
   each requested name.\n\n\
  \ To retrieve a full description of a particular configuration revision, call and provide one of \
   the ARNs returned by [ListObservabilityConfigurations].\n\
  \ "]

module ListOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_operations_request ->
    ( list_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Return a list of operations that occurred on an App Runner service.\n\n\
  \ The resulting list of [OperationSummary] objects is sorted in reverse chronological order. The \
   first object on the list represents the last started operation.\n\
  \ "]

module ListServices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_services_request ->
    ( list_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc "Returns a list of running App Runner services in your Amazon Web Services account.\n"]

module ListServicesForAutoScalingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_services_for_auto_scaling_configuration_request ->
    ( list_services_for_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of the associated App Runner services using an auto scaling configuration.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "List tags that are associated with for an App Runner resource. The response contains a list of \
   tag key-value pairs.\n"]

module ListVpcConnectors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_vpc_connectors_request ->
    ( list_vpc_connectors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc "Returns a list of App Runner VPC connectors in your Amazon Web Services account.\n"]

module ListVpcIngressConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_vpc_ingress_connections_request ->
    ( list_vpc_ingress_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result
end
[@@ocaml.doc
  "Return a list of App Runner VPC Ingress Connections in your Amazon Web Services account.\n"]

module PauseService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    pause_service_request ->
    ( pause_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Pause an active App Runner service. App Runner reduces compute capacity for the service to zero \
   and loses state (for example, ephemeral storage is removed).\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \ "]

module ResumeService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_service_request ->
    ( resume_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Resume an active App Runner service. App Runner provisions compute capacity for the service.\n\n\
  \ This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \ "]

module StartDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_deployment_request ->
    ( start_deployment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Initiate a manual deployment of the latest commit in a source code repository or the latest \
   image in a source image repository to an App Runner service.\n\n\
  \ For a source code repository, App Runner retrieves the commit and builds a Docker image. For a \
   source image repository, App Runner retrieves the latest Docker image. In both cases, App \
   Runner then deploys the new image to your service and starts a new container instance.\n\
  \ \n\
  \  This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Add tags to, or update the tag values of, an App Runner resource. A tag is a key-value pair.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc "Remove tags from an App Runner resource.\n"]

module UpdateDefaultAutoScalingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_default_auto_scaling_configuration_request ->
    ( update_default_auto_scaling_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Update an auto scaling configuration to be the default. The existing default auto scaling \
   configuration will be set to non-default automatically.\n"]

module UpdateService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_request ->
    ( update_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Update an App Runner service. You can update the source configuration and instance \
   configuration of the service. You can also update the ARN of the auto scaling configuration \
   resource that's associated with the service. However, you can't change the name or the \
   encryption configuration of the service. These can be set only when you create the service.\n\n\
  \ To update the tags applied to your service, use the separate actions [TagResource] and \
   [UntagResource].\n\
  \ \n\
  \  This is an asynchronous operation. On a successful call, you can use the returned \
   [OperationId] and the [ListOperations] call to track the operation's progress.\n\
  \  "]

module UpdateVpcIngressConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidRequestException of invalid_request_exception
    | `InvalidStateException of invalid_state_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_vpc_ingress_connection_request ->
    ( update_vpc_ingress_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidRequestException of invalid_request_exception
      | `InvalidStateException of invalid_state_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Update an existing App Runner VPC Ingress Connection resource. The VPC Ingress Connection must \
   be in one of the following states to be updated:\n\n\
  \ {ul\n\
  \       {-   AVAILABLE \n\
  \           \n\
  \            }\n\
  \       {-   FAILED_CREATION \n\
  \           \n\
  \            }\n\
  \       {-   FAILED_UPDATE \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]
