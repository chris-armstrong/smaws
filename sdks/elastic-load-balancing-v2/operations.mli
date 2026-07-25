open Types

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_input ->
    ( get_resource_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the resource policy for a specified resource.\n"]

module GetTrustStoreCaCertificatesBundle : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_ca_certificates_bundle_input ->
    ( get_trust_store_ca_certificates_bundle_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_ca_certificates_bundle_input ->
    ( get_trust_store_ca_certificates_bundle_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the ca certificate bundle.\n\n\
  \ This action returns a pre-signed S3 URI which is active for ten minutes.\n\
  \ "]

module GetTrustStoreRevocationContent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RevocationIdNotFoundException of revocation_id_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_revocation_content_input ->
    ( get_trust_store_revocation_content_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_trust_store_revocation_content_input ->
    ( get_trust_store_revocation_content_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the specified revocation file.\n\n\
  \ This action returns a pre-signed S3 URI which is active for ten minutes.\n\
  \ "]

module ModifyCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CapacityDecreaseRequestsLimitExceededException of
      capacity_decrease_requests_limit_exceeded_exception
    | `CapacityReservationPendingException of capacity_reservation_pending_exception
    | `CapacityUnitsLimitExceededException of capacity_units_limit_exceeded_exception
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `PriorRequestNotCompleteException of prior_request_not_complete_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_capacity_reservation_input ->
    ( modify_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CapacityDecreaseRequestsLimitExceededException of
        capacity_decrease_requests_limit_exceeded_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `CapacityUnitsLimitExceededException of capacity_units_limit_exceeded_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorRequestNotCompleteException of prior_request_not_complete_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_capacity_reservation_input ->
    ( modify_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CapacityDecreaseRequestsLimitExceededException of
        capacity_decrease_requests_limit_exceeded_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `CapacityUnitsLimitExceededException of capacity_units_limit_exceeded_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorRequestNotCompleteException of prior_request_not_complete_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the capacity reservation of the specified load balancer.\n\n\
  \ When modifying capacity reservation, you must include at least one \
   [MinimumLoadBalancerCapacity] or [ResetCapacityReservation].\n\
  \ "]

module ModifyIpPools : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_ip_pools_input ->
    ( modify_ip_pools_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_ip_pools_input ->
    ( modify_ip_pools_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "\\[Application Load Balancers\\] Modify the IP pool associated to a load balancer.\n"]

module ModifyListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
    | `CertificateNotFoundException of certificate_not_found_exception
    | `DuplicateListenerException of duplicate_listener_exception
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyCertificatesException of too_many_certificates_exception
    | `TooManyListenersException of too_many_listeners_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception
    | `TrustStoreNotReadyException of trust_store_not_ready_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_input ->
    ( modify_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_input ->
    ( modify_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the specified properties of the specified listener. Any properties that you do not \
   specify remain unchanged.\n\n\
  \ Changing the protocol from HTTPS to HTTP, or from TLS to TCP, removes the security policy and \
   default certificate properties. If you change the protocol from HTTP to HTTPS, or from TCP to \
   TLS, you must add the security policy and default certificate properties.\n\
  \ \n\
  \  To add an item to a list, remove an item from a list, or update an item in a list, you must \
   provide the entire list. For example, to add an action, specify a list with the current actions \
   plus the new action.\n\
  \  "]

module ModifyListenerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_attributes_input ->
    ( modify_listener_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_listener_attributes_input ->
    ( modify_listener_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the specified attributes of the specified listener.\n"]

module ModifyLoadBalancerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_load_balancer_attributes_input ->
    ( modify_load_balancer_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_load_balancer_attributes_input ->
    ( modify_load_balancer_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the specified attributes of the specified Application Load Balancer, Network Load \
   Balancer, or Gateway Load Balancer.\n\n\
  \ If any of the specified attributes can't be modified as requested, the call fails. Any \
   existing attributes that you do not modify retain their current values.\n\
  \ "]

module ModifyRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_rule_input ->
    ( modify_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_rule_input ->
    ( modify_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the specified properties of the specified rule. Any properties that you do not specify \
   are unchanged.\n\n\
  \ To add an item to a list, remove an item from a list, or update an item in a list, you must \
   provide the entire list. For example, to add an action, specify a list with the current actions \
   plus the new action.\n\
  \ "]

module ModifyTargetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_input ->
    ( modify_target_group_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_input ->
    ( modify_target_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the health checks used when evaluating the health state of the targets in the \
   specified target group.\n"]

module ModifyTargetGroupAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_attributes_input ->
    ( modify_target_group_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_target_group_attributes_input ->
    ( modify_target_group_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the specified attributes of the specified target group.\n"]

module ModifyTrustStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
    | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_trust_store_input ->
    ( modify_trust_store_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_trust_store_input ->
    ( modify_trust_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update the ca certificate bundle for the specified trust store.\n"]

module RegisterTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTargetException of invalid_target_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTargetsException of too_many_targets_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_targets_input ->
    ( register_targets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_targets_input ->
    ( register_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTargetsException of too_many_targets_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers the specified targets with the specified target group.\n\n\
  \ If the target is an EC2 instance, it must be in the [running] state when you register it.\n\
  \ \n\
  \  By default, the load balancer routes requests to registered targets using the protocol and \
   port for the target group. Alternatively, you can override the port for a target when you \
   register it. You can register each EC2 instance or IP address with the same target group \
   multiple times using different ports.\n\
  \  \n\
  \   For more information, see the following:\n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/target-group-register-targets.html}Register \
   targets for your Application Load Balancer} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/target-group-register-targets.html}Register \
   targets for your Network Load Balancer} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-group-register-targets.html}Register \
   targets for your Gateway Load Balancer} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module RemoveListenerCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_listener_certificates_input ->
    ( remove_listener_certificates_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_listener_certificates_input ->
    ( remove_listener_certificates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified certificate from the certificate list for the specified HTTPS or TLS \
   listener.\n"]

module RemoveTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the specified Elastic Load Balancing resources. You can remove \
   the tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load \
   Balancers, target groups, listeners, or rules.\n"]

module RemoveTrustStoreRevocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RevocationIdNotFoundException of revocation_id_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_trust_store_revocations_input ->
    ( remove_trust_store_revocations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_trust_store_revocations_input ->
    ( remove_trust_store_revocations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified revocation file from the specified trust store.\n"]

module SetIpAddressType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_ip_address_type_input ->
    ( set_ip_address_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_ip_address_type_input ->
    ( set_ip_address_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sets the type of IP addresses used by the subnets of the specified load balancer.\n"]

module SetRulePriorities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `PriorityInUseException of priority_in_use_exception
    | `RuleNotFoundException of rule_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_rule_priorities_input ->
    ( set_rule_priorities_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorityInUseException of priority_in_use_exception
      | `RuleNotFoundException of rule_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_rule_priorities_input ->
    ( set_rule_priorities_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `PriorityInUseException of priority_in_use_exception
      | `RuleNotFoundException of rule_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the priorities of the specified rules.\n\n\
  \ You can reorder the rules as long as there are no priority conflicts in the new order. Any \
   existing rules that you do not specify retain their current priority.\n\
  \ "]

module SetSecurityGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSecurityGroupException of invalid_security_group_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_security_groups_input ->
    ( set_security_groups_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_security_groups_input ->
    ( set_security_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified security groups with the specified Application Load Balancer or \
   Network Load Balancer. The specified security groups override the previously associated \
   security groups.\n\n\
  \ You can't perform this operation on a Network Load Balancer unless you specified a security \
   group for the load balancer when you created it.\n\
  \ \n\
  \  You can't associate a security group with a Gateway Load Balancer.\n\
  \  "]

module SetSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AllocationIdNotFoundException of allocation_id_not_found_exception
    | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
    | `CapacityReservationPendingException of capacity_reservation_pending_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `SubnetNotFoundException of subnet_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_subnets_input ->
    ( set_subnets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SubnetNotFoundException of subnet_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_subnets_input ->
    ( set_subnets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `CapacityReservationPendingException of capacity_reservation_pending_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SubnetNotFoundException of subnet_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the Availability Zones for the specified public subnets for the specified Application \
   Load Balancer, Network Load Balancer or Gateway Load Balancer. The specified subnets replace \
   the previously enabled subnets.\n"]

module DescribeTrustStores : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_stores_input ->
    ( describe_trust_stores_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_stores_input ->
    ( describe_trust_stores_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes all trust stores for the specified account.\n"]

module DescribeTrustStoreRevocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `RevocationIdNotFoundException of revocation_id_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_revocations_input ->
    ( describe_trust_store_revocations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_revocations_input ->
    ( describe_trust_store_revocations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `RevocationIdNotFoundException of revocation_id_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the revocation files in use by the specified trust store or revocation files.\n"]

module DescribeTrustStoreAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_associations_input ->
    ( describe_trust_store_associations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_trust_store_associations_input ->
    ( describe_trust_store_associations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes all resources associated with the specified trust store.\n"]

module DescribeTargetHealth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HealthUnavailableException of health_unavailable_exception
    | `InvalidTargetException of invalid_target_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_target_health_input ->
    ( describe_target_health_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HealthUnavailableException of health_unavailable_exception
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_target_health_input ->
    ( describe_target_health_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HealthUnavailableException of health_unavailable_exception
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the health of the specified targets or all of your targets.\n"]

module DescribeTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_target_groups_input ->
    ( describe_target_groups_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_target_groups_input ->
    ( describe_target_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified target groups or all of your target groups. By default, all target \
   groups are described. Alternatively, you can specify one of the following to filter the \
   results: the ARN of the load balancer, the names of one or more target groups, or the ARNs of \
   one or more target groups.\n"]

module DescribeTargetGroupAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_target_group_attributes_input ->
    ( describe_target_group_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_target_group_attributes_input ->
    ( describe_target_group_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the attributes for the specified target group.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html#target-group-attributes}Target \
   group attributes} in the {i Application Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html#target-group-attributes}Target \
   group attributes} in the {i Network Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html#target-group-attributes}Target \
   group attributes} in the {i Gateway Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the tags for the specified Elastic Load Balancing resources. You can describe the \
   tags for one or more Application Load Balancers, Network Load Balancers, Gateway Load \
   Balancers, target groups, listeners, or rules.\n"]

module DescribeSSLPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `SSLPolicyNotFoundException of ssl_policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ssl_policies_input ->
    ( describe_ssl_policies_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ssl_policies_input ->
    ( describe_ssl_policies_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified policies or all policies used for SSL negotiation.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/describe-ssl-policies.html}Security \
   policies} in the {i Application Load Balancers Guide} and \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/describe-ssl-policies.html}Security \
   policies} in the {i Network Load Balancers Guide}.\n\
  \ "]

module DescribeRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_input ->
    ( describe_rules_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_input ->
    ( describe_rules_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified rules or the rules for the specified listener. You must specify either \
   a listener or rules.\n"]

module DescribeLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_input ->
    ( describe_load_balancers_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_input ->
    ( describe_load_balancers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified load balancers or all of your load balancers.\n"]

module DescribeLoadBalancerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_attributes_input ->
    ( describe_load_balancer_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_attributes_input ->
    ( describe_load_balancer_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the attributes for the specified Application Load Balancer, Network Load Balancer, or \
   Gateway Load Balancer.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html#load-balancer-attributes}Load \
   balancer attributes} in the {i Application Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html#load-balancer-attributes}Load \
   balancer attributes} in the {i Network Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html#load-balancer-attributes}Load \
   balancer attributes} in the {i Gateway Load Balancers Guide} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeListeners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_listeners_input ->
    ( describe_listeners_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_listeners_input ->
    ( describe_listeners_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified listeners or the listeners for the specified Application Load Balancer, \
   Network Load Balancer, or Gateway Load Balancer. You must specify either a load balancer or one \
   or more listeners.\n"]

module DescribeListenerCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_certificates_input ->
    ( describe_listener_certificates_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_certificates_input ->
    ( describe_listener_certificates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the default certificate and the certificate list for the specified HTTPS or TLS \
   listener.\n\n\
  \ If the default certificate is also in the certificate list, it appears twice in the results \
   (once with [IsDefault] set to true and once with [IsDefault] set to false).\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/https-listener-certificates.html}SSL \
   certificates} in the {i Application Load Balancers Guide} or \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/tls-listener-certificates.html}Server \
   certificates} in the {i Network Load Balancers Guide}.\n\
  \  "]

module DescribeListenerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_attributes_input ->
    ( describe_listener_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_listener_attributes_input ->
    ( describe_listener_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the attributes for the specified listener.\n"]

module DescribeCapacityReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_capacity_reservation_input ->
    ( describe_capacity_reservation_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_capacity_reservation_input ->
    ( describe_capacity_reservation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the capacity reservation status for the specified load balancer.\n"]

module DescribeAccountLimits : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    (describe_account_limits_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    ( describe_account_limits_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current Elastic Load Balancing resource limits for your Amazon Web Services \
   account.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html}Quotas \
   for your Application Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-limits.html}Quotas \
   for your Network Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/quotas-limits.html}Quotas \
   for your Gateway Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DeregisterTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidTargetException of invalid_target_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_targets_input ->
    ( deregister_targets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_targets_input ->
    ( deregister_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidTargetException of invalid_target_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters the specified targets from the specified target group. After the targets are \
   deregistered, they no longer receive traffic from the load balancer.\n\n\
  \ The load balancer stops sending requests to targets that are deregistering, but uses \
   connection draining to ensure that in-flight traffic completes on the existing connections. \
   This deregistration delay is configured by default but can be updated for each target group.\n\
  \ \n\
  \  For more information, see the following:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/edit-target-group-attributes.html#deregistration-delay} \
   Deregistration delay} in the {i Application Load Balancers User Guide} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/edit-target-group-attributes.html#deregistration-delay} \
   Deregistration delay} in the {i Network Load Balancers User Guide} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/edit-target-group-attributes.html#deregistration-delay} \
   Deregistration delay} in the {i Gateway Load Balancers User Guide} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Note: If the specified target does not exist, the action returns successfully.\n\
  \   "]

module DeleteTrustStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TrustStoreInUseException of trust_store_in_use_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_store_input ->
    ( delete_trust_store_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreInUseException of trust_store_in_use_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trust_store_input ->
    ( delete_trust_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TrustStoreInUseException of trust_store_in_use_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a trust store.\n"]

module DeleteTargetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_target_group_input ->
    ( delete_target_group_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceInUseException of resource_in_use_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_target_group_input ->
    ( delete_target_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified target group.\n\n\
  \ You can delete a target group if it is not referenced by any actions. Deleting a target group \
   also deletes any associated health checks. Deleting a target group does not affect its \
   registered targets. For example, any EC2 instances continue to run until you stop or terminate \
   them.\n\
  \ "]

module DeleteSharedTrustStoreAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DeleteAssociationSameAccountException of delete_association_same_account_exception
    | `TrustStoreAssociationNotFoundException of trust_store_association_not_found_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_shared_trust_store_association_input ->
    ( delete_shared_trust_store_association_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteAssociationSameAccountException of delete_association_same_account_exception
      | `TrustStoreAssociationNotFoundException of trust_store_association_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_shared_trust_store_association_input ->
    ( delete_shared_trust_store_association_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DeleteAssociationSameAccountException of delete_association_same_account_exception
      | `TrustStoreAssociationNotFoundException of trust_store_association_not_found_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a shared trust store association.\n"]

module DeleteRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RuleNotFoundException of rule_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_input ->
    ( delete_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_input ->
    ( delete_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RuleNotFoundException of rule_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified rule.\n\n You can't delete the default rule.\n "]

module DeleteLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_input ->
    ( delete_load_balancer_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_input ->
    ( delete_load_balancer_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Application Load Balancer, Network Load Balancer, or Gateway Load \
   Balancer. Deleting a load balancer also deletes its listeners.\n\n\
  \ You can't delete a load balancer if deletion protection is enabled. If the load balancer does \
   not exist or has already been deleted, the call succeeds.\n\
  \ \n\
  \  Deleting a load balancer does not affect its registered targets. For example, your EC2 \
   instances continue to run and are still registered to their target groups. If you no longer \
   need these EC2 instances, you can stop or terminate them.\n\
  \  "]

module DeleteListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ListenerNotFoundException of listener_not_found_exception
    | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_listener_input ->
    ( delete_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_listener_input ->
    ( delete_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ListenerNotFoundException of listener_not_found_exception
      | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified listener.\n\n\
  \ Alternatively, your listener is deleted when you delete the load balancer to which it is \
   attached.\n\
  \ "]

module CreateTrustStore : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `DuplicateTrustStoreNameException of duplicate_trust_store_name_exception
    | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTrustStoresException of too_many_trust_stores_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trust_store_input ->
    ( create_trust_store_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `DuplicateTrustStoreNameException of duplicate_trust_store_name_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTrustStoresException of too_many_trust_stores_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trust_store_input ->
    ( create_trust_store_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CaCertificatesBundleNotFoundException of ca_certificates_bundle_not_found_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `DuplicateTrustStoreNameException of duplicate_trust_store_name_exception
      | `InvalidCaCertificatesBundleException of invalid_ca_certificates_bundle_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTrustStoresException of too_many_trust_stores_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a trust store.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/mutual-authentication.html}Mutual \
   TLS for Application Load Balancers}.\n\
  \ "]

module CreateTargetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DuplicateTargetGroupNameException of duplicate_target_group_name_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTargetGroupsException of too_many_target_groups_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_target_group_input ->
    ( create_target_group_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTargetGroupNameException of duplicate_target_group_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_target_group_input ->
    ( create_target_group_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTargetGroupNameException of duplicate_target_group_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a target group.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html}Target \
   groups for your Application Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-target-groups.html}Target \
   groups for your Network Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/target-groups.html}Target \
   groups for your Gateway Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is idempotent, which means that it completes at most one time. If you attempt \
   to create multiple target groups with the same settings, each call succeeds.\n\
  \   "]

module CreateRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `PriorityInUseException of priority_in_use_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyRulesException of too_many_rules_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTargetGroupsException of too_many_target_groups_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_rule_input ->
    ( create_rule_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `PriorityInUseException of priority_in_use_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyRulesException of too_many_rules_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_rule_input ->
    ( create_rule_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `PriorityInUseException of priority_in_use_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyRulesException of too_many_rules_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetGroupsException of too_many_target_groups_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a rule for the specified listener. The listener must be associated with an Application \
   Load Balancer.\n\n\
  \ Each rule consists of a priority, one or more actions, one or more conditions, and up to two \
   optional transforms. Rules are evaluated in priority order, from the lowest value to the \
   highest value. When the conditions for a rule are met, its actions are performed. If the \
   conditions for no rules are met, the actions for the default rule are performed. For more \
   information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#listener-rules}Listener \
   rules} in the {i Application Load Balancers Guide}.\n\
  \ "]

module CreateLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AllocationIdNotFoundException of allocation_id_not_found_exception
    | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
    | `DuplicateLoadBalancerNameException of duplicate_load_balancer_name_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSchemeException of invalid_scheme_exception
    | `InvalidSecurityGroupException of invalid_security_group_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `SubnetNotFoundException of subnet_not_found_exception
    | `TooManyLoadBalancersException of too_many_load_balancers_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_input ->
    ( create_load_balancer_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `DuplicateLoadBalancerNameException of duplicate_load_balancer_name_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSchemeException of invalid_scheme_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `SubnetNotFoundException of subnet_not_found_exception
      | `TooManyLoadBalancersException of too_many_load_balancers_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_input ->
    ( create_load_balancer_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AllocationIdNotFoundException of allocation_id_not_found_exception
      | `AvailabilityZoneNotSupportedException of availability_zone_not_supported_exception
      | `DuplicateLoadBalancerNameException of duplicate_load_balancer_name_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSchemeException of invalid_scheme_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `SubnetNotFoundException of subnet_not_found_exception
      | `TooManyLoadBalancersException of too_many_load_balancers_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Application Load Balancer, Network Load Balancer, or Gateway Load Balancer.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/application-load-balancers.html}Application \
   Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/network-load-balancers.html}Network \
   Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-load-balancers.html}Gateway \
   Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is idempotent, which means that it completes at most one time. If you attempt \
   to create multiple load balancers with the same settings, each call succeeds.\n\
  \   "]

module CreateListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
    | `CertificateNotFoundException of certificate_not_found_exception
    | `DuplicateListenerException of duplicate_listener_exception
    | `IncompatibleProtocolsException of incompatible_protocols_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
    | `TargetGroupAssociationLimitException of target_group_association_limit_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyActionsException of too_many_actions_exception
    | `TooManyCertificatesException of too_many_certificates_exception
    | `TooManyListenersException of too_many_listeners_exception
    | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TooManyTargetsException of too_many_targets_exception
    | `TooManyUniqueTargetGroupsPerLoadBalancerException of
      too_many_unique_target_groups_per_load_balancer_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception
    | `TrustStoreNotReadyException of trust_store_not_ready_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_listener_input ->
    ( create_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_listener_input ->
    ( create_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ALPNPolicyNotSupportedException of alpn_policy_not_supported_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `IncompatibleProtocolsException of incompatible_protocols_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidLoadBalancerActionException of invalid_load_balancer_action_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `SSLPolicyNotFoundException of ssl_policy_not_found_exception
      | `TargetGroupAssociationLimitException of target_group_association_limit_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyActionsException of too_many_actions_exception
      | `TooManyCertificatesException of too_many_certificates_exception
      | `TooManyListenersException of too_many_listeners_exception
      | `TooManyRegistrationsForTargetIdException of too_many_registrations_for_target_id_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TooManyTargetsException of too_many_targets_exception
      | `TooManyUniqueTargetGroupsPerLoadBalancerException of
        too_many_unique_target_groups_per_load_balancer_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception
      | `TrustStoreNotReadyException of trust_store_not_ready_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a listener for the specified Application Load Balancer, Network Load Balancer, or \
   Gateway Load Balancer.\n\n\
  \ For more information, see the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html}Listeners \
   for your Application Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html}Listeners \
   for your Network Load Balancers} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/gateway/gateway-listeners.html}Listeners \
   for your Gateway Load Balancers} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is idempotent, which means that it completes at most one time. If you attempt \
   to create multiple listeners with the same settings, each call succeeds.\n\
  \   "]

module AddTrustStoreRevocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidRevocationContentException of invalid_revocation_content_exception
    | `RevocationContentNotFoundException of revocation_content_not_found_exception
    | `TooManyTrustStoreRevocationEntriesException of
      too_many_trust_store_revocation_entries_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_trust_store_revocations_input ->
    ( add_trust_store_revocations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidRevocationContentException of invalid_revocation_content_exception
      | `RevocationContentNotFoundException of revocation_content_not_found_exception
      | `TooManyTrustStoreRevocationEntriesException of
        too_many_trust_store_revocation_entries_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_trust_store_revocations_input ->
    ( add_trust_store_revocations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidRevocationContentException of invalid_revocation_content_exception
      | `RevocationContentNotFoundException of revocation_content_not_found_exception
      | `TooManyTrustStoreRevocationEntriesException of
        too_many_trust_store_revocation_entries_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds the specified revocation file to the specified trust store.\n"]

module AddTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `LoadBalancerNotFoundException of load_balancer_not_found_exception
    | `RuleNotFoundException of rule_not_found_exception
    | `TargetGroupNotFoundException of target_group_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `TrustStoreNotFoundException of trust_store_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `LoadBalancerNotFoundException of load_balancer_not_found_exception
      | `RuleNotFoundException of rule_not_found_exception
      | `TargetGroupNotFoundException of target_group_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `TrustStoreNotFoundException of trust_store_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified Elastic Load Balancing resource. You can tag your \
   Application Load Balancers, Network Load Balancers, Gateway Load Balancers, target groups, \
   trust stores, listeners, and rules.\n\n\
  \ Each tag consists of a key and an optional value. If a resource already has a tag with the \
   same key, [AddTags] updates its value.\n\
  \ "]

module AddListenerCertificates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CertificateNotFoundException of certificate_not_found_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `TooManyCertificatesException of too_many_certificates_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_listener_certificates_input ->
    ( add_listener_certificates_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundException of certificate_not_found_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `TooManyCertificatesException of too_many_certificates_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_listener_certificates_input ->
    ( add_listener_certificates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundException of certificate_not_found_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `TooManyCertificatesException of too_many_certificates_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified SSL server certificate to the certificate list for the specified HTTPS or \
   TLS listener.\n\n\
  \ If the certificate in already in the certificate list, the call is successful but the \
   certificate is not added again.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/https-listener-certificates.html}SSL \
   certificates} in the {i Application Load Balancers Guide} or \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/tls-listener-certificates.html}Server \
   certificates} in the {i Network Load Balancers Guide}.\n\
  \  "]
