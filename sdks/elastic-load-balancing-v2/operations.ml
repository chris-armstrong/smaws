open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module AddListenerCertificates = struct
  let error_to_string = function
    | `CertificateNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#CertificateNotFoundException"
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `TooManyCertificatesException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyCertificatesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_exception_of_xml
        with
        | Ok s -> `CertificateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyCertificates" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_certificates_exception_of_xml
        with
        | Ok s -> `TooManyCertificatesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_listener_certificates_input) =
    let fields = add_listener_certificates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddListenerCertificates"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:add_listener_certificates_output_of_xml ~error_deserializer

  let request_with_metadata context (request : add_listener_certificates_input) =
    let fields = add_listener_certificates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddListenerCertificates"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:add_listener_certificates_output_of_xml ~error_deserializer
end

module AddTags = struct
  let error_to_string = function
    | `DuplicateTagKeysException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateTagKeysException"
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `RuleNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#RuleNotFoundException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTagsException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DuplicateTagKeys" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_tag_keys_exception_of_xml
        with
        | Ok s -> `DuplicateTagKeysException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_not_found_exception_of_xml
        with
        | Ok s -> `RuleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_tags_input) =
    let fields = add_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:add_tags_output_of_xml ~error_deserializer

  let request_with_metadata context (request : add_tags_input) =
    let fields = add_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:add_tags_output_of_xml ~error_deserializer
end

module AddTrustStoreRevocations = struct
  let error_to_string = function
    | `InvalidRevocationContentException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidRevocationContentException"
    | `RevocationContentNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#RevocationContentNotFoundException"
    | `TooManyTrustStoreRevocationEntriesException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyTrustStoreRevocationEntriesException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidRevocationContent" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_revocation_content_exception_of_xml
        with
        | Ok s -> `InvalidRevocationContentException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RevocationContentNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:revocation_content_not_found_exception_of_xml
        with
        | Ok s -> `RevocationContentNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTrustStoreRevocationEntries" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_trust_store_revocation_entries_exception_of_xml
        with
        | Ok s -> `TooManyTrustStoreRevocationEntriesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_trust_store_revocations_input) =
    let fields = add_trust_store_revocations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddTrustStoreRevocations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:add_trust_store_revocations_output_of_xml ~error_deserializer

  let request_with_metadata context (request : add_trust_store_revocations_input) =
    let fields = add_trust_store_revocations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddTrustStoreRevocations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:add_trust_store_revocations_output_of_xml ~error_deserializer
end

module CreateListener = struct
  let error_to_string = function
    | `ALPNPolicyNotSupportedException _ ->
        "com.amazonaws.elasticloadbalancingv2#ALPNPolicyNotSupportedException"
    | `CertificateNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#CertificateNotFoundException"
    | `DuplicateListenerException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateListenerException"
    | `IncompatibleProtocolsException _ ->
        "com.amazonaws.elasticloadbalancingv2#IncompatibleProtocolsException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `InvalidLoadBalancerActionException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidLoadBalancerActionException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `SSLPolicyNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#SSLPolicyNotFoundException"
    | `TargetGroupAssociationLimitException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupAssociationLimitException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TooManyActionsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyActionsException"
    | `TooManyCertificatesException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyCertificatesException"
    | `TooManyListenersException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyListenersException"
    | `TooManyRegistrationsForTargetIdException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyRegistrationsForTargetIdException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTagsException"
    | `TooManyTargetsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTargetsException"
    | `TooManyUniqueTargetGroupsPerLoadBalancerException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyUniqueTargetGroupsPerLoadBalancerException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | `TrustStoreNotReadyException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotReadyException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancingv2#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ALPNPolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:alpn_policy_not_supported_exception_of_xml
        with
        | Ok s -> `ALPNPolicyNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_exception_of_xml
        with
        | Ok s -> `CertificateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateListener" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_listener_exception_of_xml
        with
        | Ok s -> `DuplicateListenerException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IncompatibleProtocols" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:incompatible_protocols_exception_of_xml
        with
        | Ok s -> `IncompatibleProtocolsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidLoadBalancerAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_load_balancer_action_exception_of_xml
        with
        | Ok s -> `InvalidLoadBalancerActionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SSLPolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ssl_policy_not_found_exception_of_xml
        with
        | Ok s -> `SSLPolicyNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupAssociationLimit" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_association_limit_exception_of_xml
        with
        | Ok s -> `TargetGroupAssociationLimitException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyActions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_actions_exception_of_xml
        with
        | Ok s -> `TooManyActionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyCertificates" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_certificates_exception_of_xml
        with
        | Ok s -> `TooManyCertificatesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyListeners" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_listeners_exception_of_xml
        with
        | Ok s -> `TooManyListenersException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyRegistrationsForTargetId" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_registrations_for_target_id_exception_of_xml
        with
        | Ok s -> `TooManyRegistrationsForTargetIdException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTargets" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_targets_exception_of_xml
        with
        | Ok s -> `TooManyTargetsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyUniqueTargetGroupsPerLoadBalancer" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_unique_target_groups_per_load_balancer_exception_of_xml
        with
        | Ok s -> `TooManyUniqueTargetGroupsPerLoadBalancerException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotReady" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_ready_exception_of_xml
        with
        | Ok s -> `TrustStoreNotReadyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_listener_input) =
    let fields = create_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_listener_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_listener_input) =
    let fields = create_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_listener_output_of_xml ~error_deserializer
end

module CreateLoadBalancer = struct
  let error_to_string = function
    | `AllocationIdNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#AllocationIdNotFoundException"
    | `AvailabilityZoneNotSupportedException _ ->
        "com.amazonaws.elasticloadbalancingv2#AvailabilityZoneNotSupportedException"
    | `DuplicateLoadBalancerNameException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateLoadBalancerNameException"
    | `DuplicateTagKeysException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateTagKeysException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `InvalidSchemeException _ -> "com.amazonaws.elasticloadbalancingv2#InvalidSchemeException"
    | `InvalidSecurityGroupException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidSecurityGroupException"
    | `InvalidSubnetException _ -> "com.amazonaws.elasticloadbalancingv2#InvalidSubnetException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancingv2#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.elasticloadbalancingv2#ResourceInUseException"
    | `SubnetNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#SubnetNotFoundException"
    | `TooManyLoadBalancersException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyLoadBalancersException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AllocationIdNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:allocation_id_not_found_exception_of_xml
        with
        | Ok s -> `AllocationIdNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "AvailabilityZoneNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:availability_zone_not_supported_exception_of_xml
        with
        | Ok s -> `AvailabilityZoneNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateLoadBalancerName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_load_balancer_name_exception_of_xml
        with
        | Ok s -> `DuplicateLoadBalancerNameException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateTagKeys" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_tag_keys_exception_of_xml
        with
        | Ok s -> `DuplicateTagKeysException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidScheme" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_scheme_exception_of_xml
        with
        | Ok s -> `InvalidSchemeException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurityGroup" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_group_exception_of_xml
        with
        | Ok s -> `InvalidSecurityGroupException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_exception_of_xml
        with
        | Ok s -> `InvalidSubnetException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotPermitted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_permitted_exception_of_xml
        with
        | Ok s -> `OperationNotPermittedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_exception_of_xml
        with
        | Ok s -> `ResourceInUseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubnetNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subnet_not_found_exception_of_xml
        with
        | Ok s -> `SubnetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyLoadBalancers" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_load_balancers_exception_of_xml
        with
        | Ok s -> `TooManyLoadBalancersException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_load_balancer_input) =
    let fields = create_load_balancer_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_load_balancer_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_load_balancer_input) =
    let fields = create_load_balancer_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_load_balancer_output_of_xml ~error_deserializer
end

module CreateRule = struct
  let error_to_string = function
    | `IncompatibleProtocolsException _ ->
        "com.amazonaws.elasticloadbalancingv2#IncompatibleProtocolsException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `InvalidLoadBalancerActionException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidLoadBalancerActionException"
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `PriorityInUseException _ -> "com.amazonaws.elasticloadbalancingv2#PriorityInUseException"
    | `TargetGroupAssociationLimitException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupAssociationLimitException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TooManyActionsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyActionsException"
    | `TooManyRegistrationsForTargetIdException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyRegistrationsForTargetIdException"
    | `TooManyRulesException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyRulesException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTagsException"
    | `TooManyTargetGroupsException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyTargetGroupsException"
    | `TooManyTargetsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTargetsException"
    | `TooManyUniqueTargetGroupsPerLoadBalancerException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyUniqueTargetGroupsPerLoadBalancerException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancingv2#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "IncompatibleProtocols" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:incompatible_protocols_exception_of_xml
        with
        | Ok s -> `IncompatibleProtocolsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidLoadBalancerAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_load_balancer_action_exception_of_xml
        with
        | Ok s -> `InvalidLoadBalancerActionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PriorityInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:priority_in_use_exception_of_xml
        with
        | Ok s -> `PriorityInUseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupAssociationLimit" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_association_limit_exception_of_xml
        with
        | Ok s -> `TargetGroupAssociationLimitException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyActions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_actions_exception_of_xml
        with
        | Ok s -> `TooManyActionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyRegistrationsForTargetId" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_registrations_for_target_id_exception_of_xml
        with
        | Ok s -> `TooManyRegistrationsForTargetIdException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyRules" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_rules_exception_of_xml
        with
        | Ok s -> `TooManyRulesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTargetGroups" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_target_groups_exception_of_xml
        with
        | Ok s -> `TooManyTargetGroupsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTargets" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_targets_exception_of_xml
        with
        | Ok s -> `TooManyTargetsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyUniqueTargetGroupsPerLoadBalancer" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_unique_target_groups_per_load_balancer_exception_of_xml
        with
        | Ok s -> `TooManyUniqueTargetGroupsPerLoadBalancerException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_rule_input) =
    let fields = create_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateRule"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_rule_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_rule_input) =
    let fields = create_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateRule"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_rule_output_of_xml ~error_deserializer
end

module CreateTargetGroup = struct
  let error_to_string = function
    | `DuplicateTargetGroupNameException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateTargetGroupNameException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTagsException"
    | `TooManyTargetGroupsException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyTargetGroupsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DuplicateTargetGroupName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_target_group_name_exception_of_xml
        with
        | Ok s -> `DuplicateTargetGroupNameException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTargetGroups" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_target_groups_exception_of_xml
        with
        | Ok s -> `TooManyTargetGroupsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_target_group_input) =
    let fields = create_target_group_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateTargetGroup"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_target_group_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_target_group_input) =
    let fields = create_target_group_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateTargetGroup"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_target_group_output_of_xml ~error_deserializer
end

module CreateTrustStore = struct
  let error_to_string = function
    | `CaCertificatesBundleNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#CaCertificatesBundleNotFoundException"
    | `DuplicateTagKeysException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateTagKeysException"
    | `DuplicateTrustStoreNameException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateTrustStoreNameException"
    | `InvalidCaCertificatesBundleException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidCaCertificatesBundleException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTagsException"
    | `TooManyTrustStoresException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyTrustStoresException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CaCertificatesBundleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ca_certificates_bundle_not_found_exception_of_xml
        with
        | Ok s -> `CaCertificatesBundleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateTagKeys" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_tag_keys_exception_of_xml
        with
        | Ok s -> `DuplicateTagKeysException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateTrustStoreName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_trust_store_name_exception_of_xml
        with
        | Ok s -> `DuplicateTrustStoreNameException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCaCertificatesBundle" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_ca_certificates_bundle_exception_of_xml
        with
        | Ok s -> `InvalidCaCertificatesBundleException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTrustStores" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_trust_stores_exception_of_xml
        with
        | Ok s -> `TooManyTrustStoresException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_trust_store_input) =
    let fields = create_trust_store_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateTrustStore"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_trust_store_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_trust_store_input) =
    let fields = create_trust_store_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateTrustStore"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:create_trust_store_output_of_xml ~error_deserializer
end

module DeleteListener = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `ResourceInUseException _ -> "com.amazonaws.elasticloadbalancingv2#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_exception_of_xml
        with
        | Ok s -> `ResourceInUseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_listener_input) =
    let fields = delete_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_listener_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_listener_input) =
    let fields = delete_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_listener_output_of_xml ~error_deserializer
end

module DeleteLoadBalancer = struct
  let error_to_string = function
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancingv2#OperationNotPermittedException"
    | `ResourceInUseException _ -> "com.amazonaws.elasticloadbalancingv2#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotPermitted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_permitted_exception_of_xml
        with
        | Ok s -> `OperationNotPermittedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_exception_of_xml
        with
        | Ok s -> `ResourceInUseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_load_balancer_input) =
    let fields = delete_load_balancer_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_load_balancer_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_load_balancer_input) =
    let fields = delete_load_balancer_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_load_balancer_output_of_xml ~error_deserializer
end

module DeleteRule = struct
  let error_to_string = function
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancingv2#OperationNotPermittedException"
    | `RuleNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#RuleNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationNotPermitted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_permitted_exception_of_xml
        with
        | Ok s -> `OperationNotPermittedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_not_found_exception_of_xml
        with
        | Ok s -> `RuleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_rule_input) =
    let fields = delete_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteRule"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_rule_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_rule_input) =
    let fields = delete_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteRule"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_rule_output_of_xml ~error_deserializer
end

module DeleteSharedTrustStoreAssociation = struct
  let error_to_string = function
    | `DeleteAssociationSameAccountException _ ->
        "com.amazonaws.elasticloadbalancingv2#DeleteAssociationSameAccountException"
    | `TrustStoreAssociationNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreAssociationNotFoundException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "DeleteAssociationSameAccount" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:delete_association_same_account_exception_of_xml
        with
        | Ok s -> `DeleteAssociationSameAccountException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "AssociationNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_association_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreAssociationNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_shared_trust_store_association_input) =
    let fields = delete_shared_trust_store_association_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteSharedTrustStoreAssociation"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_shared_trust_store_association_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : delete_shared_trust_store_association_input) =
    let fields = delete_shared_trust_store_association_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteSharedTrustStoreAssociation"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_shared_trust_store_association_output_of_xml
      ~error_deserializer
end

module DeleteTargetGroup = struct
  let error_to_string = function
    | `ResourceInUseException _ -> "com.amazonaws.elasticloadbalancingv2#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_in_use_exception_of_xml
        with
        | Ok s -> `ResourceInUseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_target_group_input) =
    let fields = delete_target_group_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteTargetGroup"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_target_group_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_target_group_input) =
    let fields = delete_target_group_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteTargetGroup"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_target_group_output_of_xml ~error_deserializer
end

module DeleteTrustStore = struct
  let error_to_string = function
    | `TrustStoreInUseException _ -> "com.amazonaws.elasticloadbalancingv2#TrustStoreInUseException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TrustStoreInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_in_use_exception_of_xml
        with
        | Ok s -> `TrustStoreInUseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_trust_store_input) =
    let fields = delete_trust_store_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteTrustStore"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_trust_store_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_trust_store_input) =
    let fields = delete_trust_store_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteTrustStore"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:delete_trust_store_output_of_xml ~error_deserializer
end

module DeregisterTargets = struct
  let error_to_string = function
    | `InvalidTargetException _ -> "com.amazonaws.elasticloadbalancingv2#InvalidTargetException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidTarget" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_target_exception_of_xml
        with
        | Ok s -> `InvalidTargetException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deregister_targets_input) =
    let fields = deregister_targets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeregisterTargets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:deregister_targets_output_of_xml ~error_deserializer

  let request_with_metadata context (request : deregister_targets_input) =
    let fields = deregister_targets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeregisterTargets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:deregister_targets_output_of_xml ~error_deserializer
end

module DescribeAccountLimits = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_account_limits_input) =
    let fields = describe_account_limits_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_account_limits_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_account_limits_input) =
    let fields = describe_account_limits_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_account_limits_output_of_xml ~error_deserializer
end

module DescribeCapacityReservation = struct
  let error_to_string = function
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_capacity_reservation_input) =
    let fields = describe_capacity_reservation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeCapacityReservation"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_capacity_reservation_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_capacity_reservation_input) =
    let fields = describe_capacity_reservation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeCapacityReservation"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_capacity_reservation_output_of_xml ~error_deserializer
end

module DescribeListenerAttributes = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_listener_attributes_input) =
    let fields = describe_listener_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeListenerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_listener_attributes_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_listener_attributes_input) =
    let fields = describe_listener_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeListenerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_listener_attributes_output_of_xml ~error_deserializer
end

module DescribeListenerCertificates = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_listener_certificates_input) =
    let fields = describe_listener_certificates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeListenerCertificates"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_listener_certificates_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_listener_certificates_input) =
    let fields = describe_listener_certificates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeListenerCertificates"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_listener_certificates_output_of_xml ~error_deserializer
end

module DescribeListeners = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancingv2#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_listeners_input) =
    let fields = describe_listeners_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeListeners"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_listeners_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_listeners_input) =
    let fields = describe_listeners_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeListeners"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_listeners_output_of_xml ~error_deserializer
end

module DescribeLoadBalancerAttributes = struct
  let error_to_string = function
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_load_balancer_attributes_input) =
    let fields = describe_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_attributes_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_load_balancer_attributes_input) =
    let fields = describe_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_attributes_output_of_xml
      ~error_deserializer
end

module DescribeLoadBalancers = struct
  let error_to_string = function
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_load_balancers_input) =
    let fields = describe_load_balancers_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancers"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancers_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_load_balancers_input) =
    let fields = describe_load_balancers_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancers"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancers_output_of_xml ~error_deserializer
end

module DescribeRules = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `RuleNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#RuleNotFoundException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancingv2#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_not_found_exception_of_xml
        with
        | Ok s -> `RuleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_rules_input) =
    let fields = describe_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeRules"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_rules_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_rules_input) =
    let fields = describe_rules_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeRules"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_rules_output_of_xml ~error_deserializer
end

module DescribeSSLPolicies = struct
  let error_to_string = function
    | `SSLPolicyNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#SSLPolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "SSLPolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ssl_policy_not_found_exception_of_xml
        with
        | Ok s -> `SSLPolicyNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_ssl_policies_input) =
    let fields = describe_ssl_policies_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeSSLPolicies"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_ssl_policies_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_ssl_policies_input) =
    let fields = describe_ssl_policies_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeSSLPolicies"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_ssl_policies_output_of_xml ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `RuleNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#RuleNotFoundException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_not_found_exception_of_xml
        with
        | Ok s -> `RuleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_tags_input) =
    let fields = describe_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_tags_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_tags_input) =
    let fields = describe_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_tags_output_of_xml ~error_deserializer
end

module DescribeTargetGroupAttributes = struct
  let error_to_string = function
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_target_group_attributes_input) =
    let fields = describe_target_group_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTargetGroupAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_target_group_attributes_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_target_group_attributes_input) =
    let fields = describe_target_group_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTargetGroupAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_target_group_attributes_output_of_xml
      ~error_deserializer
end

module DescribeTargetGroups = struct
  let error_to_string = function
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_target_groups_input) =
    let fields = describe_target_groups_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTargetGroups"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_target_groups_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_target_groups_input) =
    let fields = describe_target_groups_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTargetGroups"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_target_groups_output_of_xml ~error_deserializer
end

module DescribeTargetHealth = struct
  let error_to_string = function
    | `HealthUnavailableException _ ->
        "com.amazonaws.elasticloadbalancingv2#HealthUnavailableException"
    | `InvalidTargetException _ -> "com.amazonaws.elasticloadbalancingv2#InvalidTargetException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "HealthUnavailable" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:health_unavailable_exception_of_xml
        with
        | Ok s -> `HealthUnavailableException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidTarget" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_target_exception_of_xml
        with
        | Ok s -> `InvalidTargetException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_target_health_input) =
    let fields = describe_target_health_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTargetHealth"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_target_health_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_target_health_input) =
    let fields = describe_target_health_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTargetHealth"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_target_health_output_of_xml ~error_deserializer
end

module DescribeTrustStoreAssociations = struct
  let error_to_string = function
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_trust_store_associations_input) =
    let fields = describe_trust_store_associations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTrustStoreAssociations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_trust_store_associations_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_trust_store_associations_input) =
    let fields = describe_trust_store_associations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTrustStoreAssociations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_trust_store_associations_output_of_xml
      ~error_deserializer
end

module DescribeTrustStoreRevocations = struct
  let error_to_string = function
    | `RevocationIdNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#RevocationIdNotFoundException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RevocationIdNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:revocation_id_not_found_exception_of_xml
        with
        | Ok s -> `RevocationIdNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_trust_store_revocations_input) =
    let fields = describe_trust_store_revocations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTrustStoreRevocations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_trust_store_revocations_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_trust_store_revocations_input) =
    let fields = describe_trust_store_revocations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTrustStoreRevocations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_trust_store_revocations_output_of_xml
      ~error_deserializer
end

module DescribeTrustStores = struct
  let error_to_string = function
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_trust_stores_input) =
    let fields = describe_trust_stores_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTrustStores"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_trust_stores_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_trust_stores_input) =
    let fields = describe_trust_stores_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTrustStores"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:describe_trust_stores_output_of_xml ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `ResourceNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ResourceNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:resource_not_found_exception_of_xml
        with
        | Ok s -> `ResourceNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_resource_policy_input) =
    let fields = get_resource_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetResourcePolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:get_resource_policy_output_of_xml ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_input) =
    let fields = get_resource_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetResourcePolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:get_resource_policy_output_of_xml ~error_deserializer
end

module GetTrustStoreCaCertificatesBundle = struct
  let error_to_string = function
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_trust_store_ca_certificates_bundle_input) =
    let fields = get_trust_store_ca_certificates_bundle_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetTrustStoreCaCertificatesBundle"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:get_trust_store_ca_certificates_bundle_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : get_trust_store_ca_certificates_bundle_input) =
    let fields = get_trust_store_ca_certificates_bundle_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetTrustStoreCaCertificatesBundle"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:get_trust_store_ca_certificates_bundle_output_of_xml
      ~error_deserializer
end

module GetTrustStoreRevocationContent = struct
  let error_to_string = function
    | `RevocationIdNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#RevocationIdNotFoundException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RevocationIdNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:revocation_id_not_found_exception_of_xml
        with
        | Ok s -> `RevocationIdNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : get_trust_store_revocation_content_input) =
    let fields = get_trust_store_revocation_content_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"GetTrustStoreRevocationContent"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:get_trust_store_revocation_content_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : get_trust_store_revocation_content_input) =
    let fields = get_trust_store_revocation_content_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"GetTrustStoreRevocationContent"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:get_trust_store_revocation_content_output_of_xml
      ~error_deserializer
end

module ModifyCapacityReservation = struct
  let error_to_string = function
    | `CapacityDecreaseRequestsLimitExceededException _ ->
        "com.amazonaws.elasticloadbalancingv2#CapacityDecreaseRequestsLimitExceededException"
    | `CapacityReservationPendingException _ ->
        "com.amazonaws.elasticloadbalancingv2#CapacityReservationPendingException"
    | `CapacityUnitsLimitExceededException _ ->
        "com.amazonaws.elasticloadbalancingv2#CapacityUnitsLimitExceededException"
    | `InsufficientCapacityException _ ->
        "com.amazonaws.elasticloadbalancingv2#InsufficientCapacityException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancingv2#OperationNotPermittedException"
    | `PriorRequestNotCompleteException _ ->
        "com.amazonaws.elasticloadbalancingv2#PriorRequestNotCompleteException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CapacityDecreaseRequestLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:capacity_decrease_requests_limit_exceeded_exception_of_xml
        with
        | Ok s -> `CapacityDecreaseRequestsLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CapacityReservationPending" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:capacity_reservation_pending_exception_of_xml
        with
        | Ok s -> `CapacityReservationPendingException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CapacityUnitsLimitExceeded" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:capacity_units_limit_exceeded_exception_of_xml
        with
        | Ok s -> `CapacityUnitsLimitExceededException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InsufficientCapacity" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:insufficient_capacity_exception_of_xml
        with
        | Ok s -> `InsufficientCapacityException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotPermitted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_permitted_exception_of_xml
        with
        | Ok s -> `OperationNotPermittedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PriorRequestNotComplete" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:prior_request_not_complete_exception_of_xml
        with
        | Ok s -> `PriorRequestNotCompleteException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_capacity_reservation_input) =
    let fields = modify_capacity_reservation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyCapacityReservation"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_capacity_reservation_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_capacity_reservation_input) =
    let fields = modify_capacity_reservation_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyCapacityReservation"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_capacity_reservation_output_of_xml ~error_deserializer
end

module ModifyIpPools = struct
  let error_to_string = function
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_ip_pools_input) =
    let fields = modify_ip_pools_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyIpPools"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_ip_pools_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_ip_pools_input) =
    let fields = modify_ip_pools_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyIpPools"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_ip_pools_output_of_xml ~error_deserializer
end

module ModifyListener = struct
  let error_to_string = function
    | `ALPNPolicyNotSupportedException _ ->
        "com.amazonaws.elasticloadbalancingv2#ALPNPolicyNotSupportedException"
    | `CertificateNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#CertificateNotFoundException"
    | `DuplicateListenerException _ ->
        "com.amazonaws.elasticloadbalancingv2#DuplicateListenerException"
    | `IncompatibleProtocolsException _ ->
        "com.amazonaws.elasticloadbalancingv2#IncompatibleProtocolsException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `InvalidLoadBalancerActionException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidLoadBalancerActionException"
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `SSLPolicyNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#SSLPolicyNotFoundException"
    | `TargetGroupAssociationLimitException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupAssociationLimitException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TooManyActionsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyActionsException"
    | `TooManyCertificatesException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyCertificatesException"
    | `TooManyListenersException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyListenersException"
    | `TooManyRegistrationsForTargetIdException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyRegistrationsForTargetIdException"
    | `TooManyTargetsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTargetsException"
    | `TooManyUniqueTargetGroupsPerLoadBalancerException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyUniqueTargetGroupsPerLoadBalancerException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | `TrustStoreNotReadyException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotReadyException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancingv2#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ALPNPolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:alpn_policy_not_supported_exception_of_xml
        with
        | Ok s -> `ALPNPolicyNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_exception_of_xml
        with
        | Ok s -> `CertificateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateListener" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_listener_exception_of_xml
        with
        | Ok s -> `DuplicateListenerException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "IncompatibleProtocols" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:incompatible_protocols_exception_of_xml
        with
        | Ok s -> `IncompatibleProtocolsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidLoadBalancerAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_load_balancer_action_exception_of_xml
        with
        | Ok s -> `InvalidLoadBalancerActionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SSLPolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ssl_policy_not_found_exception_of_xml
        with
        | Ok s -> `SSLPolicyNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupAssociationLimit" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_association_limit_exception_of_xml
        with
        | Ok s -> `TargetGroupAssociationLimitException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyActions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_actions_exception_of_xml
        with
        | Ok s -> `TooManyActionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyCertificates" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_certificates_exception_of_xml
        with
        | Ok s -> `TooManyCertificatesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyListeners" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_listeners_exception_of_xml
        with
        | Ok s -> `TooManyListenersException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyRegistrationsForTargetId" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_registrations_for_target_id_exception_of_xml
        with
        | Ok s -> `TooManyRegistrationsForTargetIdException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTargets" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_targets_exception_of_xml
        with
        | Ok s -> `TooManyTargetsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyUniqueTargetGroupsPerLoadBalancer" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_unique_target_groups_per_load_balancer_exception_of_xml
        with
        | Ok s -> `TooManyUniqueTargetGroupsPerLoadBalancerException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotReady" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_ready_exception_of_xml
        with
        | Ok s -> `TrustStoreNotReadyException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_listener_input) =
    let fields = modify_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_listener_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_listener_input) =
    let fields = modify_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_listener_output_of_xml ~error_deserializer
end

module ModifyListenerAttributes = struct
  let error_to_string = function
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_listener_attributes_input) =
    let fields = modify_listener_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyListenerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_listener_attributes_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_listener_attributes_input) =
    let fields = modify_listener_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyListenerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_listener_attributes_output_of_xml ~error_deserializer
end

module ModifyLoadBalancerAttributes = struct
  let error_to_string = function
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_load_balancer_attributes_input) =
    let fields = modify_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_load_balancer_attributes_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_load_balancer_attributes_input) =
    let fields = modify_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_load_balancer_attributes_output_of_xml ~error_deserializer
end

module ModifyRule = struct
  let error_to_string = function
    | `IncompatibleProtocolsException _ ->
        "com.amazonaws.elasticloadbalancingv2#IncompatibleProtocolsException"
    | `InvalidLoadBalancerActionException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidLoadBalancerActionException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancingv2#OperationNotPermittedException"
    | `RuleNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#RuleNotFoundException"
    | `TargetGroupAssociationLimitException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupAssociationLimitException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TooManyActionsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyActionsException"
    | `TooManyRegistrationsForTargetIdException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyRegistrationsForTargetIdException"
    | `TooManyTargetsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTargetsException"
    | `TooManyUniqueTargetGroupsPerLoadBalancerException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyUniqueTargetGroupsPerLoadBalancerException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancingv2#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "IncompatibleProtocols" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:incompatible_protocols_exception_of_xml
        with
        | Ok s -> `IncompatibleProtocolsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidLoadBalancerAction" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_load_balancer_action_exception_of_xml
        with
        | Ok s -> `InvalidLoadBalancerActionException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotPermitted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_permitted_exception_of_xml
        with
        | Ok s -> `OperationNotPermittedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_not_found_exception_of_xml
        with
        | Ok s -> `RuleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupAssociationLimit" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_association_limit_exception_of_xml
        with
        | Ok s -> `TargetGroupAssociationLimitException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyActions" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_actions_exception_of_xml
        with
        | Ok s -> `TooManyActionsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyRegistrationsForTargetId" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_registrations_for_target_id_exception_of_xml
        with
        | Ok s -> `TooManyRegistrationsForTargetIdException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTargets" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_targets_exception_of_xml
        with
        | Ok s -> `TooManyTargetsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyUniqueTargetGroupsPerLoadBalancer" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_unique_target_groups_per_load_balancer_exception_of_xml
        with
        | Ok s -> `TooManyUniqueTargetGroupsPerLoadBalancerException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_rule_input) =
    let fields = modify_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyRule"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_rule_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_rule_input) =
    let fields = modify_rule_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyRule"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_rule_output_of_xml ~error_deserializer
end

module ModifyTargetGroup = struct
  let error_to_string = function
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_target_group_input) =
    let fields = modify_target_group_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyTargetGroup"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_target_group_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_target_group_input) =
    let fields = modify_target_group_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyTargetGroup"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_target_group_output_of_xml ~error_deserializer
end

module ModifyTargetGroupAttributes = struct
  let error_to_string = function
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_target_group_attributes_input) =
    let fields = modify_target_group_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyTargetGroupAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_target_group_attributes_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_target_group_attributes_input) =
    let fields = modify_target_group_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyTargetGroupAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_target_group_attributes_output_of_xml ~error_deserializer
end

module ModifyTrustStore = struct
  let error_to_string = function
    | `CaCertificatesBundleNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#CaCertificatesBundleNotFoundException"
    | `InvalidCaCertificatesBundleException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidCaCertificatesBundleException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "CaCertificatesBundleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:ca_certificates_bundle_not_found_exception_of_xml
        with
        | Ok s -> `CaCertificatesBundleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidCaCertificatesBundle" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_ca_certificates_bundle_exception_of_xml
        with
        | Ok s -> `InvalidCaCertificatesBundleException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_trust_store_input) =
    let fields = modify_trust_store_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyTrustStore"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_trust_store_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_trust_store_input) =
    let fields = modify_trust_store_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyTrustStore"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:modify_trust_store_output_of_xml ~error_deserializer
end

module RegisterTargets = struct
  let error_to_string = function
    | `InvalidTargetException _ -> "com.amazonaws.elasticloadbalancingv2#InvalidTargetException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TooManyRegistrationsForTargetIdException _ ->
        "com.amazonaws.elasticloadbalancingv2#TooManyRegistrationsForTargetIdException"
    | `TooManyTargetsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTargetsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidTarget" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_target_exception_of_xml
        with
        | Ok s -> `InvalidTargetException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyRegistrationsForTargetId" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_registrations_for_target_id_exception_of_xml
        with
        | Ok s -> `TooManyRegistrationsForTargetIdException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTargets" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_targets_exception_of_xml
        with
        | Ok s -> `TooManyTargetsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : register_targets_input) =
    let fields = register_targets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RegisterTargets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:register_targets_output_of_xml ~error_deserializer

  let request_with_metadata context (request : register_targets_input) =
    let fields = register_targets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RegisterTargets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:register_targets_output_of_xml ~error_deserializer
end

module RemoveListenerCertificates = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancingv2#OperationNotPermittedException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "OperationNotPermitted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_permitted_exception_of_xml
        with
        | Ok s -> `OperationNotPermittedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_listener_certificates_input) =
    let fields = remove_listener_certificates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveListenerCertificates"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:remove_listener_certificates_output_of_xml ~error_deserializer

  let request_with_metadata context (request : remove_listener_certificates_input) =
    let fields = remove_listener_certificates_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveListenerCertificates"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:remove_listener_certificates_output_of_xml ~error_deserializer
end

module RemoveTags = struct
  let error_to_string = function
    | `ListenerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#ListenerNotFoundException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `RuleNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#RuleNotFoundException"
    | `TargetGroupNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TargetGroupNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancingv2#TooManyTagsException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "ListenerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:listener_not_found_exception_of_xml
        with
        | Ok s -> `ListenerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_not_found_exception_of_xml
        with
        | Ok s -> `RuleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TargetGroupNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:target_group_not_found_exception_of_xml
        with
        | Ok s -> `TargetGroupNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_tags_input) =
    let fields = remove_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:remove_tags_output_of_xml ~error_deserializer

  let request_with_metadata context (request : remove_tags_input) =
    let fields = remove_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:remove_tags_output_of_xml ~error_deserializer
end

module RemoveTrustStoreRevocations = struct
  let error_to_string = function
    | `RevocationIdNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#RevocationIdNotFoundException"
    | `TrustStoreNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#TrustStoreNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "RevocationIdNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:revocation_id_not_found_exception_of_xml
        with
        | Ok s -> `RevocationIdNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TrustStoreNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:trust_store_not_found_exception_of_xml
        with
        | Ok s -> `TrustStoreNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_trust_store_revocations_input) =
    let fields = remove_trust_store_revocations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveTrustStoreRevocations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:remove_trust_store_revocations_output_of_xml ~error_deserializer

  let request_with_metadata context (request : remove_trust_store_revocations_input) =
    let fields = remove_trust_store_revocations_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveTrustStoreRevocations"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:remove_trust_store_revocations_output_of_xml ~error_deserializer
end

module SetIpAddressType = struct
  let error_to_string = function
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `InvalidSubnetException _ -> "com.amazonaws.elasticloadbalancingv2#InvalidSubnetException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_exception_of_xml
        with
        | Ok s -> `InvalidSubnetException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_ip_address_type_input) =
    let fields = set_ip_address_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetIpAddressType"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_ip_address_type_output_of_xml ~error_deserializer

  let request_with_metadata context (request : set_ip_address_type_input) =
    let fields = set_ip_address_type_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetIpAddressType"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_ip_address_type_output_of_xml ~error_deserializer
end

module SetRulePriorities = struct
  let error_to_string = function
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancingv2#OperationNotPermittedException"
    | `PriorityInUseException _ -> "com.amazonaws.elasticloadbalancingv2#PriorityInUseException"
    | `RuleNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#RuleNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "OperationNotPermitted" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:operation_not_permitted_exception_of_xml
        with
        | Ok s -> `OperationNotPermittedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PriorityInUse" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:priority_in_use_exception_of_xml
        with
        | Ok s -> `PriorityInUseException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "RuleNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:rule_not_found_exception_of_xml
        with
        | Ok s -> `RuleNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_rule_priorities_input) =
    let fields = set_rule_priorities_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetRulePriorities"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_rule_priorities_output_of_xml ~error_deserializer

  let request_with_metadata context (request : set_rule_priorities_input) =
    let fields = set_rule_priorities_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetRulePriorities"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_rule_priorities_output_of_xml ~error_deserializer
end

module SetSecurityGroups = struct
  let error_to_string = function
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `InvalidSecurityGroupException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidSecurityGroupException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSecurityGroup" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_security_group_exception_of_xml
        with
        | Ok s -> `InvalidSecurityGroupException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_security_groups_input) =
    let fields = set_security_groups_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetSecurityGroups"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_security_groups_output_of_xml ~error_deserializer

  let request_with_metadata context (request : set_security_groups_input) =
    let fields = set_security_groups_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetSecurityGroups"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_security_groups_output_of_xml ~error_deserializer
end

module SetSubnets = struct
  let error_to_string = function
    | `AllocationIdNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#AllocationIdNotFoundException"
    | `AvailabilityZoneNotSupportedException _ ->
        "com.amazonaws.elasticloadbalancingv2#AvailabilityZoneNotSupportedException"
    | `CapacityReservationPendingException _ ->
        "com.amazonaws.elasticloadbalancingv2#CapacityReservationPendingException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancingv2#InvalidConfigurationRequestException"
    | `InvalidSubnetException _ -> "com.amazonaws.elasticloadbalancingv2#InvalidSubnetException"
    | `LoadBalancerNotFoundException _ ->
        "com.amazonaws.elasticloadbalancingv2#LoadBalancerNotFoundException"
    | `SubnetNotFoundException _ -> "com.amazonaws.elasticloadbalancingv2#SubnetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "AllocationIdNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:allocation_id_not_found_exception_of_xml
        with
        | Ok s -> `AllocationIdNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "AvailabilityZoneNotSupported" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:availability_zone_not_supported_exception_of_xml
        with
        | Ok s -> `AvailabilityZoneNotSupportedException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CapacityReservationPending" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:capacity_reservation_pending_exception_of_xml
        with
        | Ok s -> `CapacityReservationPendingException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidSubnet" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_subnet_exception_of_xml
        with
        | Ok s -> `InvalidSubnetException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "SubnetNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subnet_not_found_exception_of_xml
        with
        | Ok s -> `SubnetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_subnets_input) =
    let fields = set_subnets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetSubnets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_subnets_output_of_xml ~error_deserializer

  let request_with_metadata context (request : set_subnets_input) =
    let fields = set_subnets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetSubnets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2015-12-01/" ~service ~context
      ~fields ~output_deserializer:set_subnets_output_of_xml ~error_deserializer
end
