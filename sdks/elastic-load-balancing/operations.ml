open Types
open Service_metadata
open Query_deserializers
open Query_serializers

module EnableAvailabilityZonesForLoadBalancer = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_availability_zones_input) =
    let fields = add_availability_zones_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"EnableAvailabilityZonesForLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:add_availability_zones_output_of_xml ~error_deserializer

  let request_with_metadata context (request : add_availability_zones_input) =
    let fields = add_availability_zones_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"EnableAvailabilityZonesForLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:add_availability_zones_output_of_xml ~error_deserializer
end

module ModifyLoadBalancerAttributes = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `LoadBalancerAttributeNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#LoadBalancerAttributeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerAttributeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_attribute_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerAttributeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : modify_load_balancer_attributes_input) =
    let fields = modify_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ModifyLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:modify_load_balancer_attributes_output_of_xml ~error_deserializer

  let request_with_metadata context (request : modify_load_balancer_attributes_input) =
    let fields = modify_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ModifyLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:modify_load_balancer_attributes_output_of_xml ~error_deserializer
end

module RegisterInstancesWithLoadBalancer = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidEndPointException _ -> "com.amazonaws.elasticloadbalancing#InvalidEndPointException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInstance" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_end_point_exception_of_xml
        with
        | Ok s -> `InvalidEndPointException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : register_end_points_input) =
    let fields = register_end_points_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RegisterInstancesWithLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:register_end_points_output_of_xml ~error_deserializer

  let request_with_metadata context (request : register_end_points_input) =
    let fields = register_end_points_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RegisterInstancesWithLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:register_end_points_output_of_xml ~error_deserializer
end

module RemoveTags = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_tags_input) =
    let fields = remove_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"RemoveTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:remove_tags_output_of_xml ~error_deserializer

  let request_with_metadata context (request : remove_tags_input) =
    let fields = remove_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"RemoveTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:remove_tags_output_of_xml ~error_deserializer
end

module SetLoadBalancerListenerSSLCertificate = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `CertificateNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#CertificateNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `ListenerNotFoundException _ -> "com.amazonaws.elasticloadbalancing#ListenerNotFoundException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancing#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "CertificateNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:certificate_not_found_exception_of_xml
        with
        | Ok s -> `CertificateNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
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
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_load_balancer_listener_ssl_certificate_input) =
    let fields = set_load_balancer_listener_ssl_certificate_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetLoadBalancerListenerSSLCertificate"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:set_load_balancer_listener_ssl_certificate_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : set_load_balancer_listener_ssl_certificate_input) =
    let fields = set_load_balancer_listener_ssl_certificate_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"SetLoadBalancerListenerSSLCertificate"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:set_load_balancer_listener_ssl_certificate_output_of_xml
      ~error_deserializer
end

module SetLoadBalancerPoliciesForBackendServer = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `PolicyNotFoundException _ -> "com.amazonaws.elasticloadbalancing#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_found_exception_of_xml
        with
        | Ok s -> `PolicyNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_load_balancer_policies_for_backend_server_input) =
    let fields = set_load_balancer_policies_for_backend_server_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetLoadBalancerPoliciesForBackendServer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:set_load_balancer_policies_for_backend_server_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : set_load_balancer_policies_for_backend_server_input)
      =
    let fields = set_load_balancer_policies_for_backend_server_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"SetLoadBalancerPoliciesForBackendServer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:set_load_balancer_policies_for_backend_server_output_of_xml
      ~error_deserializer
end

module SetLoadBalancerPoliciesOfListener = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `ListenerNotFoundException _ -> "com.amazonaws.elasticloadbalancing#ListenerNotFoundException"
    | `PolicyNotFoundException _ -> "com.amazonaws.elasticloadbalancing#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
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
    | "PolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_found_exception_of_xml
        with
        | Ok s -> `PolicyNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : set_load_balancer_policies_of_listener_input) =
    let fields = set_load_balancer_policies_of_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"SetLoadBalancerPoliciesOfListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:set_load_balancer_policies_of_listener_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : set_load_balancer_policies_of_listener_input) =
    let fields = set_load_balancer_policies_of_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"SetLoadBalancerPoliciesOfListener"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:set_load_balancer_policies_of_listener_output_of_xml
      ~error_deserializer
end

module DisableAvailabilityZonesForLoadBalancer = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : remove_availability_zones_input) =
    let fields = remove_availability_zones_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DisableAvailabilityZonesForLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:remove_availability_zones_output_of_xml ~error_deserializer

  let request_with_metadata context (request : remove_availability_zones_input) =
    let fields = remove_availability_zones_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata
      ~action:"DisableAvailabilityZonesForLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:remove_availability_zones_output_of_xml ~error_deserializer
end

module DetachLoadBalancerFromSubnets = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : detach_load_balancer_from_subnets_input) =
    let fields = detach_load_balancer_from_subnets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DetachLoadBalancerFromSubnets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:detach_load_balancer_from_subnets_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : detach_load_balancer_from_subnets_input) =
    let fields = detach_load_balancer_from_subnets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DetachLoadBalancerFromSubnets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:detach_load_balancer_from_subnets_output_of_xml
      ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_tags_input) =
    let fields = describe_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_tags_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_tags_input) =
    let fields = describe_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_tags_output_of_xml ~error_deserializer
end

module DescribeLoadBalancers = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `DependencyThrottleException _ ->
        "com.amazonaws.elasticloadbalancing#DependencyThrottleException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DependencyThrottle" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:dependency_throttle_exception_of_xml
        with
        | Ok s -> `DependencyThrottleException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_access_points_input) =
    let fields = describe_access_points_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancers"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_access_points_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_access_points_input) =
    let fields = describe_access_points_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancers"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_access_points_output_of_xml ~error_deserializer
end

module DescribeLoadBalancerPolicyTypes = struct
  let error_to_string = function
    | `PolicyTypeNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#PolicyTypeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "PolicyTypeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_type_not_found_exception_of_xml
        with
        | Ok s -> `PolicyTypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_load_balancer_policy_types_input) =
    let fields = describe_load_balancer_policy_types_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancerPolicyTypes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_policy_types_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_load_balancer_policy_types_input) =
    let fields = describe_load_balancer_policy_types_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancerPolicyTypes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_policy_types_output_of_xml
      ~error_deserializer
end

module DescribeLoadBalancerPolicies = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `PolicyNotFoundException _ -> "com.amazonaws.elasticloadbalancing#PolicyNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_not_found_exception_of_xml
        with
        | Ok s -> `PolicyNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_load_balancer_policies_input) =
    let fields = describe_load_balancer_policies_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancerPolicies"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_policies_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_load_balancer_policies_input) =
    let fields = describe_load_balancer_policies_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancerPolicies"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_policies_output_of_xml ~error_deserializer
end

module DescribeLoadBalancerAttributes = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `LoadBalancerAttributeNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#LoadBalancerAttributeNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "LoadBalancerAttributeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:load_balancer_attribute_not_found_exception_of_xml
        with
        | Ok s -> `LoadBalancerAttributeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_load_balancer_attributes_input) =
    let fields = describe_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_attributes_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : describe_load_balancer_attributes_input) =
    let fields = describe_load_balancer_attributes_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeLoadBalancerAttributes"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_load_balancer_attributes_output_of_xml
      ~error_deserializer
end

module DescribeInstanceHealth = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidEndPointException _ -> "com.amazonaws.elasticloadbalancing#InvalidEndPointException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInstance" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_end_point_exception_of_xml
        with
        | Ok s -> `InvalidEndPointException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_end_point_state_input) =
    let fields = describe_end_point_state_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeInstanceHealth"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_end_point_state_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_end_point_state_input) =
    let fields = describe_end_point_state_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeInstanceHealth"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_end_point_state_output_of_xml ~error_deserializer
end

module DescribeAccountLimits = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : describe_account_limits_input) =
    let fields = describe_account_limits_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_account_limits_output_of_xml ~error_deserializer

  let request_with_metadata context (request : describe_account_limits_input) =
    let fields = describe_account_limits_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DescribeAccountLimits"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:describe_account_limits_output_of_xml ~error_deserializer
end

module DeregisterInstancesFromLoadBalancer = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidEndPointException _ -> "com.amazonaws.elasticloadbalancing#InvalidEndPointException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidInstance" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_end_point_exception_of_xml
        with
        | Ok s -> `InvalidEndPointException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : deregister_end_points_input) =
    let fields = deregister_end_points_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeregisterInstancesFromLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:deregister_end_points_output_of_xml ~error_deserializer

  let request_with_metadata context (request : deregister_end_points_input) =
    let fields = deregister_end_points_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeregisterInstancesFromLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:deregister_end_points_output_of_xml ~error_deserializer
end

module DeleteLoadBalancerPolicy = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_load_balancer_policy_input) =
    let fields = delete_load_balancer_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteLoadBalancerPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:delete_load_balancer_policy_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_load_balancer_policy_input) =
    let fields = delete_load_balancer_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteLoadBalancerPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:delete_load_balancer_policy_output_of_xml ~error_deserializer
end

module DeleteLoadBalancerListeners = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_load_balancer_listener_input) =
    let fields = delete_load_balancer_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteLoadBalancerListeners"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:delete_load_balancer_listener_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_load_balancer_listener_input) =
    let fields = delete_load_balancer_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteLoadBalancerListeners"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:delete_load_balancer_listener_output_of_xml ~error_deserializer
end

module DeleteLoadBalancer = struct
  let error_to_string = Smaws_Lib.Protocols.AwsQuery.error_to_string

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body:_ =
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : delete_access_point_input) =
    let fields = delete_access_point_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"DeleteLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:delete_access_point_output_of_xml ~error_deserializer

  let request_with_metadata context (request : delete_access_point_input) =
    let fields = delete_access_point_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"DeleteLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:delete_access_point_output_of_xml ~error_deserializer
end

module CreateLoadBalancerPolicy = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `DuplicatePolicyNameException _ ->
        "com.amazonaws.elasticloadbalancing#DuplicatePolicyNameException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `PolicyTypeNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#PolicyTypeNotFoundException"
    | `TooManyPoliciesException _ -> "com.amazonaws.elasticloadbalancing#TooManyPoliciesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicatePolicyName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_policy_name_exception_of_xml
        with
        | Ok s -> `DuplicatePolicyNameException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "PolicyTypeNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:policy_type_not_found_exception_of_xml
        with
        | Ok s -> `PolicyTypeNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyPolicies" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_policies_exception_of_xml
        with
        | Ok s -> `TooManyPoliciesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_load_balancer_policy_input) =
    let fields = create_load_balancer_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateLoadBalancerPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_load_balancer_policy_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_load_balancer_policy_input) =
    let fields = create_load_balancer_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateLoadBalancerPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_load_balancer_policy_output_of_xml ~error_deserializer
end

module CreateLoadBalancerListeners = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `CertificateNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#CertificateNotFoundException"
    | `DuplicateListenerException _ ->
        "com.amazonaws.elasticloadbalancing#DuplicateListenerException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancing#UnsupportedProtocolException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
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
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_load_balancer_listener_input) =
    let fields = create_load_balancer_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateLoadBalancerListeners"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_load_balancer_listener_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_load_balancer_listener_input) =
    let fields = create_load_balancer_listener_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateLoadBalancerListeners"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_load_balancer_listener_output_of_xml ~error_deserializer
end

module CreateLoadBalancer = struct
  let error_to_string = function
    | `CertificateNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#CertificateNotFoundException"
    | `DuplicateAccessPointNameException _ ->
        "com.amazonaws.elasticloadbalancing#DuplicateAccessPointNameException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.elasticloadbalancing#DuplicateTagKeysException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `InvalidSchemeException _ -> "com.amazonaws.elasticloadbalancing#InvalidSchemeException"
    | `InvalidSecurityGroupException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidSecurityGroupException"
    | `InvalidSubnetException _ -> "com.amazonaws.elasticloadbalancing#InvalidSubnetException"
    | `OperationNotPermittedException _ ->
        "com.amazonaws.elasticloadbalancing#OperationNotPermittedException"
    | `SubnetNotFoundException _ -> "com.amazonaws.elasticloadbalancing#SubnetNotFoundException"
    | `TooManyAccessPointsException _ ->
        "com.amazonaws.elasticloadbalancing#TooManyAccessPointsException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancing#TooManyTagsException"
    | `UnsupportedProtocolException _ ->
        "com.amazonaws.elasticloadbalancing#UnsupportedProtocolException"
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
    | "DuplicateLoadBalancerName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_access_point_name_exception_of_xml
        with
        | Ok s -> `DuplicateAccessPointNameException s
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
            ~structParser:too_many_access_points_exception_of_xml
        with
        | Ok s -> `TooManyAccessPointsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "UnsupportedProtocol" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:unsupported_protocol_exception_of_xml
        with
        | Ok s -> `UnsupportedProtocolException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_access_point_input) =
    let fields = create_access_point_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_access_point_output_of_xml ~error_deserializer

  let request_with_metadata context (request : create_access_point_input) =
    let fields = create_access_point_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_access_point_output_of_xml ~error_deserializer
end

module CreateLBCookieStickinessPolicy = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `DuplicatePolicyNameException _ ->
        "com.amazonaws.elasticloadbalancing#DuplicatePolicyNameException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `TooManyPoliciesException _ -> "com.amazonaws.elasticloadbalancing#TooManyPoliciesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicatePolicyName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_policy_name_exception_of_xml
        with
        | Ok s -> `DuplicatePolicyNameException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyPolicies" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_policies_exception_of_xml
        with
        | Ok s -> `TooManyPoliciesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_lb_cookie_stickiness_policy_input) =
    let fields = create_lb_cookie_stickiness_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateLBCookieStickinessPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_lb_cookie_stickiness_policy_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : create_lb_cookie_stickiness_policy_input) =
    let fields = create_lb_cookie_stickiness_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateLBCookieStickinessPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_lb_cookie_stickiness_policy_output_of_xml
      ~error_deserializer
end

module CreateAppCookieStickinessPolicy = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `DuplicatePolicyNameException _ ->
        "com.amazonaws.elasticloadbalancing#DuplicatePolicyNameException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `TooManyPoliciesException _ -> "com.amazonaws.elasticloadbalancing#TooManyPoliciesException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicatePolicyName" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_policy_name_exception_of_xml
        with
        | Ok s -> `DuplicatePolicyNameException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "InvalidConfigurationRequest" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:invalid_configuration_request_exception_of_xml
        with
        | Ok s -> `InvalidConfigurationRequestException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyPolicies" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_policies_exception_of_xml
        with
        | Ok s -> `TooManyPoliciesException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : create_app_cookie_stickiness_policy_input) =
    let fields = create_app_cookie_stickiness_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"CreateAppCookieStickinessPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_app_cookie_stickiness_policy_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : create_app_cookie_stickiness_policy_input) =
    let fields = create_app_cookie_stickiness_policy_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"CreateAppCookieStickinessPolicy"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:create_app_cookie_stickiness_policy_output_of_xml
      ~error_deserializer
end

module ConfigureHealthCheck = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : configure_health_check_input) =
    let fields = configure_health_check_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ConfigureHealthCheck"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:configure_health_check_output_of_xml ~error_deserializer

  let request_with_metadata context (request : configure_health_check_input) =
    let fields = configure_health_check_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ConfigureHealthCheck"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:configure_health_check_output_of_xml ~error_deserializer
end

module AttachLoadBalancerToSubnets = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `InvalidSubnetException _ -> "com.amazonaws.elasticloadbalancing#InvalidSubnetException"
    | `SubnetNotFoundException _ -> "com.amazonaws.elasticloadbalancing#SubnetNotFoundException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
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
    | "SubnetNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:subnet_not_found_exception_of_xml
        with
        | Ok s -> `SubnetNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : attach_load_balancer_to_subnets_input) =
    let fields = attach_load_balancer_to_subnets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AttachLoadBalancerToSubnets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:attach_load_balancer_to_subnets_output_of_xml ~error_deserializer

  let request_with_metadata context (request : attach_load_balancer_to_subnets_input) =
    let fields = attach_load_balancer_to_subnets_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AttachLoadBalancerToSubnets"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:attach_load_balancer_to_subnets_output_of_xml ~error_deserializer
end

module ApplySecurityGroupsToLoadBalancer = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `InvalidConfigurationRequestException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidConfigurationRequestException"
    | `InvalidSecurityGroupException _ ->
        "com.amazonaws.elasticloadbalancing#InvalidSecurityGroupException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
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
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : apply_security_groups_to_load_balancer_input) =
    let fields = apply_security_groups_to_load_balancer_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"ApplySecurityGroupsToLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:apply_security_groups_to_load_balancer_output_of_xml
      ~error_deserializer

  let request_with_metadata context (request : apply_security_groups_to_load_balancer_input) =
    let fields = apply_security_groups_to_load_balancer_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"ApplySecurityGroupsToLoadBalancer"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:apply_security_groups_to_load_balancer_output_of_xml
      ~error_deserializer
end

module AddTags = struct
  let error_to_string = function
    | `AccessPointNotFoundException _ ->
        "com.amazonaws.elasticloadbalancing#AccessPointNotFoundException"
    | `DuplicateTagKeysException _ -> "com.amazonaws.elasticloadbalancing#DuplicateTagKeysException"
    | `TooManyTagsException _ -> "com.amazonaws.elasticloadbalancing#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ~body =
    match error.Smaws_Lib.Protocols.AwsQuery.Error.code with
    | "LoadBalancerNotFound" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:access_point_not_found_exception_of_xml
        with
        | Ok s -> `AccessPointNotFoundException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "DuplicateTagKeys" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:duplicate_tag_keys_exception_of_xml
        with
        | Ok s -> `DuplicateTagKeysException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | "TooManyTags" -> (
        match
          Smaws_Lib.Protocols.AwsQuery.Response.parse_error_struct ~body
            ~structParser:too_many_tags_exception_of_xml
        with
        | Ok s -> `TooManyTagsException s
        | Error (Smaws_Lib.Xml.Parse.XmlParseError msg) -> `XmlParseError msg)
    | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : add_tags_input) =
    let fields = add_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request ~action:"AddTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:add_tags_output_of_xml ~error_deserializer

  let request_with_metadata context (request : add_tags_input) =
    let fields = add_tags_input_to_query [] request in
    Smaws_Lib.Protocols.AwsQuery.request_with_metadata ~action:"AddTags"
      ~xmlNamespace:"http://elasticloadbalancing.amazonaws.com/doc/2012-06-01/" ~service ~context
      ~fields ~output_deserializer:add_tags_output_of_xml ~error_deserializer
end
