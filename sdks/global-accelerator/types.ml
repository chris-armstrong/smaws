type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec byoip_cidr_state =
  | FAILED_DEPROVISION [@ocaml.doc ""]
  | FAILED_WITHDRAW [@ocaml.doc ""]
  | FAILED_ADVERTISING [@ocaml.doc ""]
  | FAILED_PROVISION [@ocaml.doc ""]
  | DEPROVISIONED [@ocaml.doc ""]
  | PENDING_DEPROVISIONING [@ocaml.doc ""]
  | PENDING_WITHDRAWING [@ocaml.doc ""]
  | ADVERTISING [@ocaml.doc ""]
  | PENDING_ADVERTISING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | PENDING_PROVISIONING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec byoip_cidr_event = {
  timestamp : timestamp option;
      [@ocaml.doc
        "A timestamp for when you make a status change for an IP address range that you bring to \
         Global Accelerator through bring your own IP address (BYOIP).\n"]
  message : generic_string option;
      [@ocaml.doc
        "A string that contains an [Event] message describing changes that you make in the status \
         of an IP address range that you bring to Global Accelerator through bring your own IP \
         address (BYOIP).\n"]
}
[@@ocaml.doc
  "A complex type that contains a [Message] and a [Timestamp] value for changes that you make in \
   the status of an IP address range that you bring to Global Accelerator through bring your own \
   IP address (BYOIP).\n"]

type nonrec byoip_cidr_events = byoip_cidr_event list [@@ocaml.doc ""]

type nonrec byoip_cidr = {
  events : byoip_cidr_events option;
      [@ocaml.doc
        "A history of status changes for an IP address range that you bring to Global Accelerator \
         through bring your own IP address (BYOIP).\n"]
  state : byoip_cidr_state option; [@ocaml.doc "The state of the address pool.\n"]
  cidr : generic_string option;
      [@ocaml.doc
        "The address range, in CIDR notation.\n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the Global Accelerator Developer Guide.\n\
        \ "]
}
[@@ocaml.doc
  "Information about an IP address range that is provisioned for use with your Amazon Web Services \
   resources through bring your own IP address (BYOIP).\n\n\
  \ The following describes each BYOIP [State] that your IP address range can be in.\n\
  \ \n\
  \  {ul\n\
  \        {-   {b PENDING_PROVISIONING} \226\128\148 You\226\128\153ve submitted a request to \
   provision an IP address range but it is not yet provisioned with Global Accelerator.\n\
  \            \n\
  \             }\n\
  \        {-   {b READY} \226\128\148 The address range is provisioned with Global Accelerator \
   and can be advertised.\n\
  \            \n\
  \             }\n\
  \        {-   {b PENDING_ADVERTISING} \226\128\148 You\226\128\153ve submitted a request for \
   Global Accelerator to advertise an address range but it is not yet being advertised.\n\
  \            \n\
  \             }\n\
  \        {-   {b ADVERTISING} \226\128\148 The address range is being advertised by Global \
   Accelerator.\n\
  \            \n\
  \             }\n\
  \        {-   {b PENDING_WITHDRAWING} \226\128\148 You\226\128\153ve submitted a request to \
   withdraw an address range from being advertised but it is still being advertised by Global \
   Accelerator.\n\
  \            \n\
  \             }\n\
  \        {-   {b PENDING_DEPROVISIONING} \226\128\148 You\226\128\153ve submitted a request to \
   deprovision an address range from Global Accelerator but it is still provisioned.\n\
  \            \n\
  \             }\n\
  \        {-   {b DEPROVISIONED} \226\128\148 The address range is deprovisioned from Global \
   Accelerator.\n\
  \            \n\
  \             }\n\
  \        {-   {b FAILED_PROVISION } \226\128\148 The request to provision the address range from \
   Global Accelerator was not successful. Please make sure that you provide all of the correct \
   information, and try again. If the request fails a second time, contact Amazon Web Services \
   support.\n\
  \            \n\
  \             }\n\
  \        {-   {b FAILED_ADVERTISING} \226\128\148 The request for Global Accelerator to \
   advertise the address range was not successful. Please make sure that you provide all of the \
   correct information, and try again. If the request fails a second time, contact Amazon Web \
   Services support.\n\
  \            \n\
  \             }\n\
  \        {-   {b FAILED_WITHDRAW} \226\128\148 The request to withdraw the address range from \
   advertising by Global Accelerator was not successful. Please make sure that you provide all of \
   the correct information, and try again. If the request fails a second time, contact Amazon Web \
   Services support.\n\
  \            \n\
  \             }\n\
  \        {-   {b FAILED_DEPROVISION } \226\128\148 The request to deprovision the address range \
   from Global Accelerator was not successful. Please make sure that you provide all of the \
   correct information, and try again. If the request fails a second time, contact Amazon Web \
   Services support.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec withdraw_byoip_cidr_response = {
  byoip_cidr : byoip_cidr option; [@ocaml.doc "Information about the BYOIP address pool.\n"]
}
[@@ocaml.doc ""]

type nonrec withdraw_byoip_cidr_request = {
  cidr : generic_string;
      [@ocaml.doc
        "The address range, in CIDR notation.\n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the Global Accelerator Developer Guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec invalid_argument_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An argument that you specified is invalid.\n"]

type nonrec internal_service_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "There was an internal error for Global Accelerator.\n"]

type nonrec incorrect_cidr_state_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The CIDR that you specified is not valid for this action. For example, the state of the CIDR \
   might be incorrect for this action.\n"]

type nonrec byoip_cidr_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The CIDR that you specified was not found or is incorrect.\n"]

type nonrec access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You don't have access permission.\n"]

type nonrec port_number = int [@@ocaml.doc ""]

type nonrec port_range = {
  to_port : port_number option; [@ocaml.doc "The last port in the range of ports, inclusive.\n"]
  from_port : port_number option; [@ocaml.doc "The first port in the range of ports, inclusive.\n"]
}
[@@ocaml.doc "A complex type for a range of ports for a listener.\n"]

type nonrec port_ranges = port_range list [@@ocaml.doc ""]

type nonrec protocol = UDP [@ocaml.doc ""] | TCP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec client_affinity = SOURCE_IP [@ocaml.doc ""] | NONE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec listener = {
  client_affinity : client_affinity option;
      [@ocaml.doc
        "Client affinity lets you direct all requests from a user to the same endpoint, if you \
         have stateful applications, regardless of the port and protocol of the client request. \
         Client affinity gives you control over whether to always route each client to the same \
         specific endpoint.\n\n\
        \ Global Accelerator uses a consistent-flow hashing algorithm to choose the optimal \
         endpoint for a connection. If client affinity is [NONE], Global Accelerator uses the \
         \"five-tuple\" (5-tuple) properties\226\128\148source IP address, source port, \
         destination IP address, destination port, and protocol\226\128\148to select the hash \
         value, and then chooses the best endpoint. However, with this setting, if someone uses \
         different ports to connect to Global Accelerator, their connections might not be always \
         routed to the same endpoint because the hash value changes. \n\
        \ \n\
        \  If you want a given client to always be routed to the same endpoint, set client \
         affinity to [SOURCE_IP] instead. When you use the [SOURCE_IP] setting, Global Accelerator \
         uses the \"two-tuple\" (2-tuple) properties\226\128\148 source (client) IP address and \
         destination IP address\226\128\148to select the hash value.\n\
        \  \n\
        \   The default value is [NONE].\n\
        \   "]
  protocol : protocol option;
      [@ocaml.doc "The protocol for the connections from clients to the accelerator.\n"]
  port_ranges : port_ranges option;
      [@ocaml.doc "The list of port ranges for the connections from clients to the accelerator.\n"]
  listener_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc "A complex type for a listener.\n"]

type nonrec update_listener_response = {
  listener : listener option; [@ocaml.doc "Information for the updated listener.\n"]
}
[@@ocaml.doc ""]

type nonrec update_listener_request = {
  client_affinity : client_affinity option;
      [@ocaml.doc
        "Client affinity lets you direct all requests from a user to the same endpoint, if you \
         have stateful applications, regardless of the port and protocol of the client request. \
         Client affinity gives you control over whether to always route each client to the same \
         specific endpoint.\n\n\
        \ Global Accelerator uses a consistent-flow hashing algorithm to choose the optimal \
         endpoint for a connection. If client affinity is [NONE], Global Accelerator uses the \
         \"five-tuple\" (5-tuple) properties\226\128\148source IP address, source port, \
         destination IP address, destination port, and protocol\226\128\148to select the hash \
         value, and then chooses the best endpoint. However, with this setting, if someone uses \
         different ports to connect to Global Accelerator, their connections might not be always \
         routed to the same endpoint because the hash value changes. \n\
        \ \n\
        \  If you want a given client to always be routed to the same endpoint, set client \
         affinity to [SOURCE_IP] instead. When you use the [SOURCE_IP] setting, Global Accelerator \
         uses the \"two-tuple\" (2-tuple) properties\226\128\148 source (client) IP address and \
         destination IP address\226\128\148to select the hash value.\n\
        \  \n\
        \   The default value is [NONE].\n\
        \   "]
  protocol : protocol option;
      [@ocaml.doc "The updated protocol for the connections from clients to the accelerator.\n"]
  port_ranges : port_ranges option;
      [@ocaml.doc
        "The updated list of port ranges for the connections from clients to the accelerator.\n"]
  listener_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener to update.\n"]
}
[@@ocaml.doc ""]

type nonrec listener_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The listener that you specified doesn't exist.\n"]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Processing your request would cause you to exceed an Global Accelerator limit.\n"]

type nonrec invalid_port_range_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The port numbers that you specified are not valid numbers or are not unique for this accelerator.\n"]

type nonrec endpoint_weight = int [@@ocaml.doc ""]

type nonrec health_state =
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
  | INITIAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec generic_boolean = bool [@@ocaml.doc ""]

type nonrec endpoint_description = {
  client_ip_preservation_enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether client IP address preservation is enabled for an endpoint. The value is \
         true or false. The default value is true for Application Load Balancers endpoints. \n\n\
        \ If the value is set to true, the client's IP address is preserved in the \
         [X-Forwarded-For] request header as traffic travels to applications on the endpoint \
         fronted by the accelerator.\n\
        \ \n\
        \  Client IP address preservation is supported, in specific Amazon Web Services Regions, \
         for endpoints that are Application Load Balancers, Amazon EC2 instances, and Network Load \
         Balancers with security groups. IMPORTANT: You cannot use client IP address preservation \
         with Network Load Balancers with TLS listeners.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/preserve-client-ip-address.html} \
         Preserve client IP addresses in Global Accelerator} in the {i Global Accelerator \
         Developer Guide}.\n\
        \   "]
  health_reason : generic_string option; [@ocaml.doc "Returns a null result.\n"]
  health_state : health_state option; [@ocaml.doc "The health status of the endpoint.\n"]
  weight : endpoint_weight option;
      [@ocaml.doc
        "The weight associated with the endpoint. When you add weights to endpoints, you configure \
         Global Accelerator to route traffic based on proportions that you specify. For example, \
         you might specify endpoint weights of 4, 5, 5, and 6 (sum=20). The result is that 4/20 of \
         your traffic, on average, is routed to the first endpoint, 5/20 is routed both to the \
         second and third endpoints, and 6/20 is routed to the last endpoint. For more \
         information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints-endpoint-weights.html}Endpoint \
         weights} in the {i Global Accelerator Developer Guide}. \n"]
  endpoint_id : generic_string option;
      [@ocaml.doc
        "An ID for the endpoint. If the endpoint is a Network Load Balancer or Application Load \
         Balancer, this is the Amazon Resource Name (ARN) of the resource. If the endpoint is an \
         Elastic IP address, this is the Elastic IP address allocation ID. For Amazon EC2 \
         instances, this is the EC2 instance ID. \n\n\
        \ An Application Load Balancer can be either internal or internet-facing.\n\
        \ "]
}
[@@ocaml.doc
  "A complex type for an endpoint. Each endpoint group can include one or more endpoints, such as \
   load balancers.\n"]

type nonrec endpoint_descriptions = endpoint_description list [@@ocaml.doc ""]

type nonrec traffic_dial_percentage = float [@@ocaml.doc ""]

type nonrec health_check_port = int [@@ocaml.doc ""]

type nonrec health_check_protocol =
  | HTTPS [@ocaml.doc ""]
  | HTTP [@ocaml.doc ""]
  | TCP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec health_check_path = string [@@ocaml.doc ""]

type nonrec health_check_interval_seconds = int [@@ocaml.doc ""]

type nonrec threshold_count = int [@@ocaml.doc ""]

type nonrec port_override = {
  endpoint_port : port_number option;
      [@ocaml.doc
        "The endpoint port that you want a listener port to be mapped to. This is the port on the \
         endpoint, such as the Application Load Balancer or Amazon EC2 instance.\n"]
  listener_port : port_number option;
      [@ocaml.doc
        "The listener port that you want to map to a specific endpoint port. This is the port that \
         user traffic arrives to the Global Accelerator on.\n"]
}
[@@ocaml.doc
  "Override specific listener ports used to route traffic to endpoints that are part of an \
   endpoint group. For example, you can create a port override in which the listener receives user \
   traffic on ports 80 and 443, but your accelerator routes that traffic to ports 1080 and 1443, \
   respectively, on the endpoints.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoint-groups-port-override.html} \
   Overriding listener ports} in the {i Global Accelerator Developer Guide}.\n\
  \ "]

type nonrec port_overrides = port_override list [@@ocaml.doc ""]

type nonrec endpoint_group = {
  port_overrides : port_overrides option;
      [@ocaml.doc
        "Allows you to override the destination ports used to route traffic to an endpoint. Using \
         a port override lets you map a list of external destination ports (that your users send \
         traffic to) to a list of internal destination ports that you want an application endpoint \
         to receive traffic on. \n"]
  threshold_count : threshold_count option;
      [@ocaml.doc
        "The number of consecutive health checks required to set the state of a healthy endpoint \
         to unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.\n"]
  health_check_interval_seconds : health_check_interval_seconds option;
      [@ocaml.doc
        "The time\226\128\14810 seconds or 30 seconds\226\128\148between health checks for each \
         endpoint. The default value is 30.\n"]
  health_check_path : health_check_path option;
      [@ocaml.doc
        "If the protocol is HTTP/S, then this value provides the ping path that Global Accelerator \
         uses for the destination on the endpoints for health checks. The default is slash (/).\n"]
  health_check_protocol : health_check_protocol option;
      [@ocaml.doc
        "The protocol that Global Accelerator uses to perform health checks on endpoints that are \
         part of this endpoint group. The default value is TCP.\n"]
  health_check_port : health_check_port option;
      [@ocaml.doc
        "The port that Global Accelerator uses to perform health checks on endpoints that are part \
         of this endpoint group. \n\n\
        \ The default port is the port for the listener that this endpoint group is associated \
         with. If the listener port is a list, Global Accelerator uses the first specified port in \
         the list of ports.\n\
        \ "]
  traffic_dial_percentage : traffic_dial_percentage option;
      [@ocaml.doc
        "The percentage of traffic to send to an Amazon Web Services Region. Additional traffic is \
         distributed to other endpoint groups for this listener. \n\n\
        \ Use this action to increase (dial up) or decrease (dial down) traffic to a specific \
         Region. The percentage is applied to the traffic that would otherwise have been routed to \
         the Region based on optimal routing.\n\
        \ \n\
        \  The default value is 100.\n\
        \  "]
  endpoint_descriptions : endpoint_descriptions option;
      [@ocaml.doc "The list of endpoint objects.\n"]
  endpoint_group_region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region where the endpoint group is located.\n"]
  endpoint_group_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
}
[@@ocaml.doc
  "A complex type for the endpoint group. An Amazon Web Services Region can have only one endpoint \
   group for a specific listener. \n"]

type nonrec update_endpoint_group_response = {
  endpoint_group : endpoint_group option;
      [@ocaml.doc "The information about the endpoint group that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_configuration = {
  attachment_arn : generic_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the cross-account attachment that specifies the \
         endpoints (resources) that can be added to accelerators and principals that have \
         permission to add the endpoints.\n"]
  client_ip_preservation_enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether client IP address preservation is enabled for an endpoint. The value is \
         true or false. The default value is true for Application Load Balancer endpoints. \n\n\
        \ If the value is set to true, the client's IP address is preserved in the \
         [X-Forwarded-For] request header as traffic travels to applications on the endpoint \
         fronted by the accelerator.\n\
        \ \n\
        \  Client IP address preservation is supported, in specific Amazon Web Services Regions, \
         for endpoints that are Application Load Balancers, Amazon EC2 instances, and Network Load \
         Balancers with security groups. IMPORTANT: You cannot use client IP address preservation \
         with Network Load Balancers with TLS listeners.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/preserve-client-ip-address.html} \
         Preserve client IP addresses in Global Accelerator} in the {i Global Accelerator \
         Developer Guide}.\n\
        \   "]
  weight : endpoint_weight option;
      [@ocaml.doc
        "The weight associated with the endpoint. When you add weights to endpoints, you configure \
         Global Accelerator to route traffic based on proportions that you specify. For example, \
         you might specify endpoint weights of 4, 5, 5, and 6 (sum=20). The result is that 4/20 of \
         your traffic, on average, is routed to the first endpoint, 5/20 is routed both to the \
         second and third endpoints, and 6/20 is routed to the last endpoint. For more \
         information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoints-endpoint-weights.html}Endpoint \
         weights} in the {i Global Accelerator Developer Guide}.\n"]
  endpoint_id : generic_string option;
      [@ocaml.doc
        "An ID for the endpoint. If the endpoint is a Network Load Balancer or Application Load \
         Balancer, this is the Amazon Resource Name (ARN) of the resource. If the endpoint is an \
         Elastic IP address, this is the Elastic IP address allocation ID. For Amazon EC2 \
         instances, this is the EC2 instance ID. A resource must be valid and active when you add \
         it as an endpoint.\n\n\
        \ For cross-account endpoints, this must be the ARN of the resource.\n\
        \ "]
}
[@@ocaml.doc
  "A complex type for endpoints. A resource must be valid and active when you add it as an endpoint.\n"]

type nonrec endpoint_configurations = endpoint_configuration list [@@ocaml.doc ""]

type nonrec update_endpoint_group_request = {
  port_overrides : port_overrides option;
      [@ocaml.doc
        "Override specific listener ports used to route traffic to endpoints that are part of this \
         endpoint group. For example, you can create a port override in which the listener \
         receives user traffic on ports 80 and 443, but your accelerator routes that traffic to \
         ports 1080 and 1443, respectively, on the endpoints.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoint-groups-port-override.html} \
         Overriding listener ports} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
  threshold_count : threshold_count option;
      [@ocaml.doc
        "The number of consecutive health checks required to set the state of a healthy endpoint \
         to unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.\n"]
  health_check_interval_seconds : health_check_interval_seconds option;
      [@ocaml.doc
        "The time\226\128\14810 seconds or 30 seconds\226\128\148between each health check for an \
         endpoint. The default value is 30.\n"]
  health_check_path : health_check_path option;
      [@ocaml.doc
        "If the protocol is HTTP/S, then this specifies the path that is the destination for \
         health check targets. The default value is slash (/).\n"]
  health_check_protocol : health_check_protocol option;
      [@ocaml.doc
        "The protocol that Global Accelerator uses to check the health of endpoints that are part \
         of this endpoint group. The default value is TCP.\n"]
  health_check_port : health_check_port option;
      [@ocaml.doc
        "The port that Global Accelerator uses to check the health of endpoints that are part of \
         this endpoint group. The default port is the listener port that this endpoint group is \
         associated with. If the listener port is a list of ports, Global Accelerator uses the \
         first port in the list.\n"]
  traffic_dial_percentage : traffic_dial_percentage option;
      [@ocaml.doc
        "The percentage of traffic to send to an Amazon Web Services Region. Additional traffic is \
         distributed to other endpoint groups for this listener. \n\n\
        \ Use this action to increase (dial up) or decrease (dial down) traffic to a specific \
         Region. The percentage is applied to the traffic that would otherwise have been routed to \
         the Region based on optimal routing.\n\
        \ \n\
        \  The default value is 100.\n\
        \  "]
  endpoint_configurations : endpoint_configurations option;
      [@ocaml.doc
        "The list of endpoint objects. A resource must be valid and active when you add it as an \
         endpoint.\n"]
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_group_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The endpoint group that you specified doesn't exist.\n"]

type nonrec custom_routing_listener = {
  port_ranges : port_ranges option;
      [@ocaml.doc
        "The port range to support for connections from clients to your accelerator.\n\n\
        \ Separately, you set port ranges for endpoints. For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-custom-routing-endpoints.html}About \
         endpoints for custom routing accelerators}.\n\
        \ "]
  listener_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc "A complex type for a listener for a custom routing accelerator.\n"]

type nonrec update_custom_routing_listener_response = {
  listener : custom_routing_listener option;
      [@ocaml.doc "Information for the updated listener for a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec update_custom_routing_listener_request = {
  port_ranges : port_ranges;
      [@ocaml.doc
        "The updated port range to support for connections from clients to your accelerator. If \
         you remove ports that are currently being used by a subnet endpoint, the call fails.\n\n\
        \ Separately, you set port ranges for endpoints. For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-custom-routing-endpoints.html}About \
         endpoints for custom routing accelerators}.\n\
        \ "]
  listener_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener to update.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_address_type = DUAL_STACK [@ocaml.doc ""] | IPV4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec ip_addresses = ip_address list [@@ocaml.doc ""]

type nonrec ip_address_family = IPv6 [@ocaml.doc ""] | IPv4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ip_set = {
  ip_address_family : ip_address_family option;
      [@ocaml.doc "The types of IP addresses included in this IP set. \n"]
  ip_addresses : ip_addresses option;
      [@ocaml.doc
        "The array of IP addresses in the IP address set. An IP address set can have a maximum of \
         two IP addresses.\n"]
  ip_family : generic_string option;
      [@ocaml.doc "IpFamily is deprecated and has been replaced by IpAddressFamily.\n"]
}
[@@ocaml.doc "A complex type for the set of IP addresses for an accelerator.\n"]

type nonrec ip_sets = ip_set list [@@ocaml.doc ""]

type nonrec custom_routing_accelerator_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | DEPLOYED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec custom_routing_accelerator = {
  last_modified_time : timestamp option;
      [@ocaml.doc "The date and time that the accelerator was last modified.\n"]
  created_time : timestamp option;
      [@ocaml.doc "The date and time that the accelerator was created.\n"]
  status : custom_routing_accelerator_status option;
      [@ocaml.doc "Describes the deployment status of the accelerator.\n"]
  dns_name : generic_string option;
      [@ocaml.doc
        "The Domain Name System (DNS) name that Global Accelerator creates that points to an \
         accelerator's static IPv4 addresses. \n\n\
        \ The naming convention for the DNS name is the following: A lowercase letter a, followed \
         by a 16-bit random hex string, followed by .awsglobalaccelerator.com. For example: \
         a1234567890abcdef.awsglobalaccelerator.com.\n\
        \ \n\
        \  If you have a dual-stack accelerator, you also have a second DNS name, \
         [DualStackDnsName], that points to both the A record and the AAAA record for all four \
         static addresses for the accelerator: two IPv4 addresses and two IPv6 addresses.\n\
        \  \n\
        \   For more information about the default DNS name, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/dns-addressing-custom-domains.dns-addressing.html} \
         Support for DNS addressing in Global Accelerator} in the {i Global Accelerator Developer \
         Guide}.\n\
        \   "]
  ip_sets : ip_sets option;
      [@ocaml.doc
        "The static IP addresses that Global Accelerator associates with the accelerator.\n"]
  enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether the accelerator is enabled. The value is true or false. The default \
         value is true. \n\n\
        \ If the value is set to true, the accelerator cannot be deleted. If set to false, \
         accelerator can be deleted.\n\
        \ "]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that an accelerator supports. For a custom routing accelerator, the \
         value must be IPV4.\n"]
  name : generic_string option;
      [@ocaml.doc
        "The name of the accelerator. The name must contain only alphanumeric characters or \
         hyphens (-), and must not begin or end with a hyphen.\n"]
  accelerator_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the custom routing accelerator.\n"]
}
[@@ocaml.doc "Attributes of a custom routing accelerator.\n"]

type nonrec update_custom_routing_accelerator_response = {
  accelerator : custom_routing_accelerator option;
      [@ocaml.doc "Information about the updated custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec update_custom_routing_accelerator_request = {
  enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether an accelerator is enabled. The value is true or false. The default \
         value is true. \n\n\
        \ If the value is set to true, the accelerator cannot be deleted. If set to false, the \
         accelerator can be deleted.\n\
        \ "]
  ip_addresses : ip_addresses option; [@ocaml.doc "The IP addresses for an accelerator.\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that an accelerator supports. For a custom routing accelerator, the \
         value must be IPV4.\n"]
  name : generic_string option;
      [@ocaml.doc
        "The name of the accelerator. The name can have a maximum of 64 characters, must contain \
         only alphanumeric characters, periods (.), or hyphens (-), and must not begin or end with \
         a hyphen or period.\n"]
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the accelerator to update.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_routing_accelerator_attributes = {
  flow_logs_s3_prefix : generic_string option;
      [@ocaml.doc
        "The prefix for the location in the Amazon S3 bucket for the flow logs. Attribute is \
         required if [FlowLogsEnabled] is [true].\n\n\
        \ If you don\226\128\153t specify a prefix, the flow logs are stored in the root of the \
         bucket. If you specify slash (/) for the S3 bucket prefix, the log file bucket folder \
         structure will include a double slash (//), like the following:\n\
        \ \n\
        \  DOC-EXAMPLE-BUCKET//AWSLogs/aws_account_id\n\
        \  "]
  flow_logs_s3_bucket : generic_string option;
      [@ocaml.doc
        "The name of the Amazon S3 bucket for the flow logs. Attribute is required if \
         [FlowLogsEnabled] is [true]. The bucket must exist and have a bucket policy that grants \
         Global Accelerator permission to write to the bucket.\n"]
  flow_logs_enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether flow logs are enabled. The default value is false. If the value is \
         true, [FlowLogsS3Bucket] and [FlowLogsS3Prefix] must be specified.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html}Flow \
         logs} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc "Attributes of a custom routing accelerator.\n"]

type nonrec update_custom_routing_accelerator_attributes_response = {
  accelerator_attributes : custom_routing_accelerator_attributes option;
      [@ocaml.doc "Updated custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec update_custom_routing_accelerator_attributes_request = {
  flow_logs_s3_prefix : generic_string option;
      [@ocaml.doc
        "Update the prefix for the location in the Amazon S3 bucket for the flow logs. Attribute \
         is required if [FlowLogsEnabled] is [true]. \n\n\
        \ If you don\226\128\153t specify a prefix, the flow logs are stored in the root of the \
         bucket. If you specify slash (/) for the S3 bucket prefix, the log file bucket folder \
         structure will include a double slash (//), like the following:\n\
        \ \n\
        \  DOC-EXAMPLE-BUCKET//AWSLogs/aws_account_id\n\
        \  "]
  flow_logs_s3_bucket : generic_string option;
      [@ocaml.doc
        "The name of the Amazon S3 bucket for the flow logs. Attribute is required if \
         [FlowLogsEnabled] is [true]. The bucket must exist and have a bucket policy that grants \
         Global Accelerator permission to write to the bucket.\n"]
  flow_logs_enabled : generic_boolean option;
      [@ocaml.doc
        "Update whether flow logs are enabled. The default value is false. If the value is true, \
         [FlowLogsS3Bucket] and [FlowLogsS3Prefix] must be specified.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html}Flow \
         logs} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
  accelerator_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom routing accelerator to update attributes for.\n"]
}
[@@ocaml.doc ""]

type nonrec transaction_in_progress_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "There's already a transaction in progress. Another transaction can't be processed.\n"]

type nonrec accelerator_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The accelerator that you specified doesn't exist.\n"]

type nonrec conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You can't use both of those options.\n"]

type nonrec attachment_name = string [@@ocaml.doc ""]

type nonrec principal = string [@@ocaml.doc ""]

type nonrec principals = principal list [@@ocaml.doc ""]

type nonrec resource = {
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region where a shared endpoint resource is located.\n"]
  cidr : generic_string option;
      [@ocaml.doc
        "An IP address range, in CIDR format, that is specified as resource. The address must be \
         provisioned and advertised in Global Accelerator by following the bring your own IP \
         address (BYOIP) process for Global Accelerator\n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the Global Accelerator Developer Guide.\n\
        \ "]
  endpoint_id : generic_string option;
      [@ocaml.doc
        "The endpoint ID for the endpoint that is specified as a Amazon Web Services resource. \n\n\
        \ An endpoint ID for the cross-account feature is the ARN of an Amazon Web Services \
         resource, such as a Network Load Balancer, that Global Accelerator supports as an \
         endpoint for an accelerator.\n\
        \ "]
}
[@@ocaml.doc
  "A resource is one of the following: the ARN for an Amazon Web Services resource that is \
   supported by Global Accelerator to be added as an endpoint, or a CIDR range that specifies a \
   bring your own IP (BYOIP) address pool.\n"]

type nonrec resources = resource list [@@ocaml.doc ""]

type nonrec attachment = {
  created_time : timestamp option;
      [@ocaml.doc "The date and time that the cross-account attachment was created.\n"]
  last_modified_time : timestamp option;
      [@ocaml.doc "The date and time that the cross-account attachment was last modified.\n"]
  resources : resources option;
      [@ocaml.doc "The resources included in the cross-account attachment.\n"]
  principals : principals option;
      [@ocaml.doc "The principals included in the cross-account attachment.\n"]
  name : attachment_name option; [@ocaml.doc "The name of the cross-account attachment.\n"]
  attachment_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cross-account attachment.\n"]
}
[@@ocaml.doc
  "A cross-account attachment in Global Accelerator. A cross-account attachment specifies the {i \
   principals} who have permission to work with {i resources} in your account, which you also list \
   in the attachment.\n"]

type nonrec update_cross_account_attachment_response = {
  cross_account_attachment : attachment option;
      [@ocaml.doc "Information about the updated cross-account attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec update_cross_account_attachment_request = {
  remove_resources : resources option;
      [@ocaml.doc
        "The resources to remove from the cross-account attachment. A resource listed in a \
         cross-account attachment can be used with an accelerator by the principals that are \
         listed in the attachment.\n\n\
        \ To remove more than one resource, separate the resource ARNs with commas.\n\
        \ "]
  add_resources : resources option;
      [@ocaml.doc
        "The resources to add to the cross-account attachment. A resource listed in a \
         cross-account attachment can be used with an accelerator by the principals that are \
         listed in the attachment.\n\n\
        \ To add more than one resource, separate the resource ARNs with commas.\n\
        \ "]
  remove_principals : principals option;
      [@ocaml.doc
        "The principals to remove from the cross-account attachment. A principal is an account or \
         the Amazon Resource Name (ARN) of an accelerator that the attachment gives permission to \
         work with resources from another account. The resources are also listed in the \
         attachment.\n\n\
        \ To remove more than one principal, separate the account numbers or accelerator ARNs, or \
         both, with commas.\n\
        \ "]
  add_principals : principals option;
      [@ocaml.doc
        "The principals to add to the cross-account attachment. A principal is an account or the \
         Amazon Resource Name (ARN) of an accelerator that the attachment gives permission to work \
         with resources from another account. The resources are also listed in the attachment.\n\n\
        \ To add more than one principal, separate the account numbers or accelerator ARNs, or \
         both, with commas.\n\
        \ "]
  name : attachment_name option; [@ocaml.doc "The name of the cross-account attachment. \n"]
  attachment_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the cross-account attachment to update.\n"]
}
[@@ocaml.doc ""]

type nonrec attachment_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "No cross-account attachment was found.\n"]

type nonrec accelerator_status = IN_PROGRESS [@ocaml.doc ""] | DEPLOYED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerator_event = {
  timestamp : timestamp option;
      [@ocaml.doc
        "A timestamp for when you update an accelerator in Global Accelerator from IPv4 to \
         dual-stack, or dual-stack to IPv4.\n"]
  message : generic_string option;
      [@ocaml.doc
        "A string that contains an [Event] message describing changes or errors when you update an \
         accelerator in Global Accelerator from IPv4 to dual-stack, or dual-stack to IPv4.\n"]
}
[@@ocaml.doc
  "A complex type that contains a [Timestamp] value and [Message] for changes that you make to an \
   accelerator in Global Accelerator. Messages stored here provide progress or error information \
   when you update an accelerator from IPv4 to dual-stack, or from dual-stack to IPv4. Global \
   Accelerator stores a maximum of ten event messages. \n"]

type nonrec accelerator_events = accelerator_event list [@@ocaml.doc ""]

type nonrec accelerator = {
  events : accelerator_events option;
      [@ocaml.doc "A history of changes that you make to an accelerator in Global Accelerator.\n"]
  dual_stack_dns_name : generic_string option;
      [@ocaml.doc
        "The Domain Name System (DNS) name that Global Accelerator creates that points to a \
         dual-stack accelerator's four static IP addresses: two IPv4 addresses and two IPv6 \
         addresses.\n\n\
        \ The naming convention for the dual-stack DNS name is the following: A lowercase letter \
         a, followed by a 16-bit random hex string, followed by \
         .dualstack.awsglobalaccelerator.com. For example: \
         a1234567890abcdef.dualstack.awsglobalaccelerator.com.\n\
        \ \n\
        \  Note: Global Accelerator also assigns a default DNS name, [DnsName], to your \
         accelerator that points just to the static IPv4 addresses. \n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-accelerators.html#about-accelerators.dns-addressing} \
         Support for DNS addressing in Global Accelerator} in the {i Global Accelerator Developer \
         Guide}.\n\
        \   "]
  last_modified_time : timestamp option;
      [@ocaml.doc "The date and time that the accelerator was last modified.\n"]
  created_time : timestamp option;
      [@ocaml.doc "The date and time that the accelerator was created.\n"]
  status : accelerator_status option;
      [@ocaml.doc "Describes the deployment status of the accelerator.\n"]
  dns_name : generic_string option;
      [@ocaml.doc
        "The Domain Name System (DNS) name that Global Accelerator creates that points to an \
         accelerator's static IPv4 addresses.\n\n\
        \ The naming convention for the DNS name for an accelerator is the following: A lowercase \
         letter a, followed by a 16-bit random hex string, followed by .awsglobalaccelerator.com. \
         For example: a1234567890abcdef.awsglobalaccelerator.com.\n\
        \ \n\
        \  If you have a dual-stack accelerator, you also have a second DNS name, \
         [DualStackDnsName], that points to both the A record and the AAAA record for all four \
         static addresses for the accelerator: two IPv4 addresses and two IPv6 addresses.\n\
        \  \n\
        \   For more information about the default DNS name, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/dns-addressing-custom-domains.dns-addressing.html} \
         Support for DNS addressing in Global Accelerator} in the {i Global Accelerator Developer \
         Guide}.\n\
        \   "]
  ip_sets : ip_sets option;
      [@ocaml.doc
        "The static IP addresses that Global Accelerator associates with the accelerator.\n"]
  enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether the accelerator is enabled. The value is true or false. The default \
         value is true. \n\n\
        \ If the value is set to true, the accelerator cannot be deleted. If set to false, \
         accelerator can be deleted.\n\
        \ "]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that an accelerator supports. For a standard accelerator, the value \
         can be IPV4 or DUAL_STACK.\n"]
  name : generic_string option;
      [@ocaml.doc
        "The name of the accelerator. The name must contain only alphanumeric characters or \
         hyphens (-), and must not begin or end with a hyphen.\n"]
  accelerator_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the accelerator.\n"]
}
[@@ocaml.doc
  "An accelerator is a complex type that includes one or more listeners that process inbound \
   connections and then direct traffic to one or more endpoint groups, each of which includes \
   endpoints, such as load balancers.\n"]

type nonrec update_accelerator_response = {
  accelerator : accelerator option; [@ocaml.doc "Information about the updated accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec update_accelerator_request = {
  enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether an accelerator is enabled. The value is true or false. The default \
         value is true. \n\n\
        \ If the value is set to true, the accelerator cannot be deleted. If set to false, the \
         accelerator can be deleted.\n\
        \ "]
  ip_addresses : ip_addresses option; [@ocaml.doc "The IP addresses for an accelerator.\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that an accelerator supports. For a standard accelerator, the value \
         can be IPV4 or DUAL_STACK.\n"]
  name : generic_string option;
      [@ocaml.doc
        "The name of the accelerator. The name can have a maximum of 64 characters, must contain \
         only alphanumeric characters, periods (.), or hyphens (-), and must not begin or end with \
         a hyphen or period.\n"]
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the accelerator to update.\n"]
}
[@@ocaml.doc ""]

type nonrec accelerator_attributes = {
  flow_logs_s3_prefix : generic_string option;
      [@ocaml.doc
        "The prefix for the location in the Amazon S3 bucket for the flow logs. Attribute is \
         required if [FlowLogsEnabled] is [true].\n\n\
        \ If you specify slash (/) for the S3 bucket prefix, the log file bucket folder structure \
         will include a double slash (//), like the following:\n\
        \ \n\
        \  s3-bucket_name//AWSLogs/aws_account_id\n\
        \  "]
  flow_logs_s3_bucket : generic_string option;
      [@ocaml.doc
        "The name of the Amazon S3 bucket for the flow logs. Attribute is required if \
         [FlowLogsEnabled] is [true]. The bucket must exist and have a bucket policy that grants \
         Global Accelerator permission to write to the bucket.\n"]
  flow_logs_enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether flow logs are enabled. The default value is false. If the value is \
         true, [FlowLogsS3Bucket] and [FlowLogsS3Prefix] must be specified.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html}Flow \
         logs} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc "Attributes of an accelerator.\n"]

type nonrec update_accelerator_attributes_response = {
  accelerator_attributes : accelerator_attributes option;
      [@ocaml.doc "Updated attributes for the accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec update_accelerator_attributes_request = {
  flow_logs_s3_prefix : generic_string option;
      [@ocaml.doc
        "Update the prefix for the location in the Amazon S3 bucket for the flow logs. Attribute \
         is required if [FlowLogsEnabled] is [true]. \n\n\
        \ If you specify slash (/) for the S3 bucket prefix, the log file bucket folder structure \
         will include a double slash (//), like the following:\n\
        \ \n\
        \  s3-bucket_name//AWSLogs/aws_account_id\n\
        \  "]
  flow_logs_s3_bucket : generic_string option;
      [@ocaml.doc
        "The name of the Amazon S3 bucket for the flow logs. Attribute is required if \
         [FlowLogsEnabled] is [true]. The bucket must exist and have a bucket policy that grants \
         Global Accelerator permission to write to the bucket.\n"]
  flow_logs_enabled : generic_boolean option;
      [@ocaml.doc
        "Update whether flow logs are enabled. The default value is false. If the value is true, \
         [FlowLogsS3Bucket] and [FlowLogsS3Prefix] must be specified.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/monitoring-global-accelerator.flow-logs.html}Flow \
         Logs} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the accelerator that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_keys;
      [@ocaml.doc "The tag key pairs that you want to remove from the specified resources.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Global Accelerator resource to remove tags from. An \
         ARN uniquely identifies a resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "A string that contains a [Tag] value.\n"]
  key : tag_key; [@ocaml.doc "A string that contains a [Tag] key.\n"]
}
[@@ocaml.doc "A complex type that contains a [Tag] key and [Tag] value.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags;
      [@ocaml.doc
        "The tags to add to a resource. A tag consists of a key and a value that you define.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Global Accelerator resource to add tags to. An ARN \
         uniquely identifies a resource.\n"]
}
[@@ocaml.doc ""]

type nonrec socket_address = {
  port : port_number option; [@ocaml.doc "The port for the socket address.\n"]
  ip_address : generic_string option; [@ocaml.doc "The IP address for the socket address.\n"]
}
[@@ocaml.doc "An IP address/port combination.\n"]

type nonrec socket_addresses = socket_address list [@@ocaml.doc ""]

type nonrec endpoint_identifier = {
  client_ip_preservation_enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether client IP address preservation is enabled for an endpoint. The value is \
         true or false. \n\n\
        \ If the value is set to true, the client's IP address is preserved in the \
         [X-Forwarded-For] request header as traffic travels to applications on the endpoint \
         fronted by the accelerator.\n\
        \ "]
  endpoint_id : generic_string;
      [@ocaml.doc
        "An ID for the endpoint. If the endpoint is a Network Load Balancer or Application Load \
         Balancer, this is the Amazon Resource Name (ARN) of the resource. If the endpoint is an \
         Elastic IP address, this is the Elastic IP address allocation ID. For Amazon EC2 \
         instances, this is the EC2 instance ID. \n\n\
        \ An Application Load Balancer can be either internal or internet-facing.\n\
        \ "]
}
[@@ocaml.doc
  "A complex type for an endpoint. Specifies information about the endpoint to remove from the \
   endpoint group.\n"]

type nonrec endpoint_identifiers = endpoint_identifier list [@@ocaml.doc ""]

type nonrec remove_endpoints_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
  endpoint_identifiers : endpoint_identifiers;
      [@ocaml.doc "The identifiers of the endpoints that you want to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_ids = generic_string list [@@ocaml.doc ""]

type nonrec remove_custom_routing_endpoints_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the endpoint group to remove endpoints from.\n"]
  endpoint_ids : endpoint_ids;
      [@ocaml.doc
        "The IDs for the endpoints. For custom routing accelerators, endpoint IDs are the virtual \
         private cloud (VPC) subnet IDs. \n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The endpoint that you specified doesn't exist.\n"]

type nonrec provision_byoip_cidr_response = {
  byoip_cidr : byoip_cidr option; [@ocaml.doc "Information about the address range.\n"]
}
[@@ocaml.doc ""]

type nonrec cidr_authorization_context = {
  signature : generic_string;
      [@ocaml.doc "The signed authorization message for the prefix and account.\n"]
  message : generic_string;
      [@ocaml.doc "The plain-text authorization message for the prefix and account.\n"]
}
[@@ocaml.doc
  "Provides authorization for Amazon to bring a specific IP address range to a specific Amazon Web \
   Services account using bring your own IP addresses (BYOIP). \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your own IP \
   addresses (BYOIP)} in the {i Global Accelerator Developer Guide}.\n\
  \ "]

type nonrec provision_byoip_cidr_request = {
  cidr_authorization_context : cidr_authorization_context;
      [@ocaml.doc
        "A signed document that proves that you are authorized to bring the specified IP address \
         range to Amazon using BYOIP. \n"]
  cidr : generic_string;
      [@ocaml.doc
        "The public IPv4 address range, in CIDR notation. The most specific IP prefix that you can \
         specify is /24. The address range cannot overlap with another address range that you've \
         brought to this Amazon Web Services Region or another Region.\n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the Global Accelerator Developer Guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec protocols = protocol list [@@ocaml.doc ""]

type nonrec port_mappings_max_results = int [@@ocaml.doc ""]

type nonrec custom_routing_protocol = UDP [@ocaml.doc ""] | TCP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec custom_routing_protocols = custom_routing_protocol list [@@ocaml.doc ""]

type nonrec custom_routing_destination_traffic_state =
  | DENY [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec port_mapping = {
  destination_traffic_state : custom_routing_destination_traffic_state option;
      [@ocaml.doc
        "Indicates whether or not a port mapping destination can receive traffic. The value is \
         either ALLOW, if traffic is allowed to the destination, or DENY, if traffic is not \
         allowed to the destination.\n"]
  protocols : custom_routing_protocols option;
      [@ocaml.doc "The protocols supported by the endpoint group.\n"]
  destination_socket_address : socket_address option;
      [@ocaml.doc
        "The EC2 instance IP address and port number in the virtual private cloud (VPC) subnet.\n"]
  endpoint_id : generic_string option;
      [@ocaml.doc "The IP address of the VPC subnet (the subnet ID).\n"]
  endpoint_group_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
  accelerator_port : port_number option; [@ocaml.doc "The accelerator port.\n"]
}
[@@ocaml.doc
  "Returns the ports and associated IP addresses and ports of Amazon EC2 instances in your virtual \
   private cloud (VPC) subnets. Custom routing is a port mapping protocol in Global Accelerator \
   that statically associates port ranges with VPC subnets, which allows Global Accelerator to \
   route to specific instances and ports within one or more subnets. \n"]

type nonrec port_mappings = port_mapping list [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec listeners = listener list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "Root level tag for the Tags parameters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the accelerator to list tags for. An ARN uniquely \
         identifies an accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec list_listeners_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  listeners : listeners option; [@ocaml.doc "The list of listeners for an accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec list_listeners_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of listener objects that you want to return with this call. The default value \
         is 10.\n"]
  accelerator_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the accelerator for which you want to list listener \
         objects.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "There isn't another item to return.\n"]

type nonrec endpoint_groups = endpoint_group list [@@ocaml.doc ""]

type nonrec list_endpoint_groups_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  endpoint_groups : endpoint_groups option;
      [@ocaml.doc "The list of the endpoint groups associated with a listener.\n"]
}
[@@ocaml.doc ""]

type nonrec list_endpoint_groups_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of endpoint group objects that you want to return with this call. The default \
         value is 10.\n"]
  listener_arn : generic_string; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_routing_port_mappings_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  port_mappings : port_mappings option;
      [@ocaml.doc "The port mappings for a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_routing_port_mappings_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : port_mappings_max_results option;
      [@ocaml.doc
        "The number of destination port mappings that you want to return with this call. The \
         default value is 10.\n"]
  endpoint_group_arn : generic_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the endpoint group to list the custom routing port \
         mappings for.\n"]
  accelerator_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the accelerator to list the custom routing port \
         mappings for.\n"]
}
[@@ocaml.doc ""]

type nonrec destination_port_mapping = {
  destination_traffic_state : custom_routing_destination_traffic_state option;
      [@ocaml.doc
        "Indicates whether or not a port mapping destination can receive traffic. The value is \
         either ALLOW, if traffic is allowed to the destination, or DENY, if traffic is not \
         allowed to the destination.\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that an accelerator supports. For a custom routing accelerator, the \
         value must be IPV4.\n"]
  destination_socket_address : socket_address option;
      [@ocaml.doc
        "The endpoint IP address/port combination for traffic received on the accelerator socket \
         address.\n"]
  endpoint_group_region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region for the endpoint group.\n"]
  endpoint_id : generic_string option;
      [@ocaml.doc "The ID for the virtual private cloud (VPC) subnet.\n"]
  endpoint_group_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
  accelerator_socket_addresses : socket_addresses option;
      [@ocaml.doc
        "The IP address/port combinations (sockets) that map to a given destination socket address.\n"]
  accelerator_arn : generic_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom routing accelerator that you have port \
         mappings for.\n"]
}
[@@ocaml.doc "The port mappings for a specified endpoint IP address (destination).\n"]

type nonrec destination_port_mappings = destination_port_mapping list [@@ocaml.doc ""]

type nonrec list_custom_routing_port_mappings_by_destination_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  destination_port_mappings : destination_port_mappings option;
      [@ocaml.doc
        "The port mappings for the endpoint IP address that you specified in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_routing_port_mappings_by_destination_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : port_mappings_max_results option;
      [@ocaml.doc
        "The number of destination port mappings that you want to return with this call. The \
         default value is 10.\n"]
  destination_address : generic_string;
      [@ocaml.doc
        "The endpoint IP address in a virtual private cloud (VPC) subnet for which you want to \
         receive back port mappings.\n"]
  endpoint_id : generic_string; [@ocaml.doc "The ID for the virtual private cloud (VPC) subnet.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_routing_listeners = custom_routing_listener list [@@ocaml.doc ""]

type nonrec list_custom_routing_listeners_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  listeners : custom_routing_listeners option;
      [@ocaml.doc "The list of listeners for a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_routing_listeners_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of listener objects that you want to return with this call. The default value \
         is 10.\n"]
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the accelerator to list listeners for.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_routing_destination_description = {
  protocols : protocols option;
      [@ocaml.doc
        "The protocol for the endpoint group that is associated with a custom routing accelerator. \
         The protocol can be either TCP or UDP.\n"]
  to_port : port_number option;
      [@ocaml.doc
        "The last port, inclusive, in the range of ports for the endpoint group that is associated \
         with a custom routing accelerator.\n"]
  from_port : port_number option;
      [@ocaml.doc
        "The first port, inclusive, in the range of ports for the endpoint group that is \
         associated with a custom routing accelerator.\n"]
}
[@@ocaml.doc
  "For a custom routing accelerator, describes the port range and protocol for all endpoints \
   (virtual private cloud subnets) in an endpoint group to accept client traffic on.\n"]

type nonrec custom_routing_destination_descriptions = custom_routing_destination_description list
[@@ocaml.doc ""]

type nonrec custom_routing_endpoint_description = {
  endpoint_id : generic_string option;
      [@ocaml.doc
        "An ID for the endpoint. For custom routing accelerators, this is the virtual private \
         cloud (VPC) subnet ID. \n"]
}
[@@ocaml.doc
  "A complex type for an endpoint for a custom routing accelerator. Each endpoint group can \
   include one or more endpoints, which are virtual private cloud (VPC) subnets.\n"]

type nonrec custom_routing_endpoint_descriptions = custom_routing_endpoint_description list
[@@ocaml.doc ""]

type nonrec custom_routing_endpoint_group = {
  endpoint_descriptions : custom_routing_endpoint_descriptions option;
      [@ocaml.doc
        "For a custom routing accelerator, describes the endpoints (virtual private cloud subnets) \
         in an endpoint group to accept client traffic on.\n"]
  destination_descriptions : custom_routing_destination_descriptions option;
      [@ocaml.doc
        "For a custom routing accelerator, describes the port range and protocol for all endpoints \
         (virtual private cloud subnets) in an endpoint group to accept client traffic on.\n"]
  endpoint_group_region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region where the endpoint group is located.\n"]
  endpoint_group_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
}
[@@ocaml.doc
  "A complex type for the endpoint group for a custom routing accelerator. An Amazon Web Services \
   Region can have only one endpoint group for a specific listener. \n"]

type nonrec custom_routing_endpoint_groups = custom_routing_endpoint_group list [@@ocaml.doc ""]

type nonrec list_custom_routing_endpoint_groups_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  endpoint_groups : custom_routing_endpoint_groups option;
      [@ocaml.doc
        "The list of the endpoint groups associated with a listener for a custom routing \
         accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_routing_endpoint_groups_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of endpoint group objects that you want to return with this call. The default \
         value is 10.\n"]
  listener_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener to list endpoint groups for.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_routing_accelerators = custom_routing_accelerator list [@@ocaml.doc ""]

type nonrec list_custom_routing_accelerators_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  accelerators : custom_routing_accelerators option;
      [@ocaml.doc "The list of custom routing accelerators for a customer account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_custom_routing_accelerators_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of custom routing Global Accelerator objects that you want to return with this \
         call. The default value is 10.\n"]
}
[@@ocaml.doc ""]

type nonrec cross_account_resource = {
  attachment_arn : generic_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the cross-account attachment that specifies the \
         resources (endpoints or CIDR range) that can be added to accelerators and principals that \
         have permission to add them.\n"]
  cidr : generic_string option;
      [@ocaml.doc
        "An IP address range, in CIDR format, that is specified as an Amazon Web Services \
         resource. The address must be provisioned and advertised in Global Accelerator by \
         following the bring your own IP address (BYOIP) process for Global Accelerator.\n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the Global Accelerator Developer Guide.\n\
        \ "]
  endpoint_id : generic_string option;
      [@ocaml.doc
        "The endpoint ID for the endpoint that is listed in a cross-account attachment and can be \
         added to an accelerator by specified principals.\n"]
}
[@@ocaml.doc
  "An endpoint (Amazon Web Services resource) or an IP address range, in CIDR format, that is \
   listed in a cross-account attachment. A cross-account resource can be added to an accelerator \
   by specified principals, which are also listed in the attachment.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/cross-account-resources.html} \
   Working with cross-account attachments and resources in Global Accelerator} in the {i  Global \
   Accelerator Developer Guide}.\n\
  \ "]

type nonrec cross_account_resources = cross_account_resource list [@@ocaml.doc ""]

type nonrec list_cross_account_resources_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  cross_account_resources : cross_account_resources option;
      [@ocaml.doc "The cross-account resources used with an accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec list_cross_account_resources_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of cross-account resource objects that you want to return with this call. The \
         default value is 10.\n"]
  resource_owner_aws_account_id : aws_account_id;
      [@ocaml.doc "The account ID of a resource owner in a cross-account attachment.\n"]
  accelerator_arn : generic_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an accelerator in a cross-account attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec aws_account_ids = aws_account_id list [@@ocaml.doc ""]

type nonrec list_cross_account_resource_accounts_response = {
  resource_owner_aws_account_ids : aws_account_ids option;
      [@ocaml.doc
        "The account IDs of principals (resource owners) in a cross-account attachment who can \
         work with resources listed in the same attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_cross_account_resource_accounts_request = unit [@@ocaml.doc ""]

type nonrec attachments = attachment list [@@ocaml.doc ""]

type nonrec list_cross_account_attachments_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  cross_account_attachments : attachments option;
      [@ocaml.doc "Information about the cross-account attachments.\n"]
}
[@@ocaml.doc ""]

type nonrec list_cross_account_attachments_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of cross-account attachment objects that you want to return with this call. \
         The default value is 10.\n"]
}
[@@ocaml.doc ""]

type nonrec byoip_cidrs = byoip_cidr list [@@ocaml.doc ""]

type nonrec list_byoip_cidrs_response = {
  next_token : generic_string option; [@ocaml.doc "The token for the next page of results.\n"]
  byoip_cidrs : byoip_cidrs option; [@ocaml.doc "Information about your address ranges.\n"]
}
[@@ocaml.doc ""]

type nonrec list_byoip_cidrs_request = {
  next_token : generic_string option; [@ocaml.doc "The token for the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return with a single call. To retrieve the remaining \
         results, make another call with the returned [nextToken] value.\n"]
}
[@@ocaml.doc ""]

type nonrec accelerators = accelerator list [@@ocaml.doc ""]

type nonrec list_accelerators_response = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  accelerators : accelerators option;
      [@ocaml.doc "The list of accelerators for a customer account.\n"]
}
[@@ocaml.doc ""]

type nonrec list_accelerators_request = {
  next_token : generic_string option;
      [@ocaml.doc
        "The token for the next set of results. You receive this token from a previous call.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The number of Global Accelerator objects that you want to return with this call. The \
         default value is 10.\n"]
}
[@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec describe_listener_response = {
  listener : listener option; [@ocaml.doc "The description of a listener.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_listener_request = {
  listener_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoint_group_response = {
  endpoint_group : endpoint_group option; [@ocaml.doc "The description of an endpoint group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoint_group_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_listener_response = {
  listener : custom_routing_listener option;
      [@ocaml.doc "The description of a listener for a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_listener_request = {
  listener_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_endpoint_group_response = {
  endpoint_group : custom_routing_endpoint_group option;
      [@ocaml.doc "The description of an endpoint group for a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_endpoint_group_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_accelerator_attributes_response = {
  accelerator_attributes : custom_routing_accelerator_attributes option;
      [@ocaml.doc "The attributes of the custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_accelerator_attributes_request = {
  accelerator_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the custom routing accelerator to describe the \
         attributes for.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_accelerator_response = {
  accelerator : custom_routing_accelerator option;
      [@ocaml.doc "The description of the custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_custom_routing_accelerator_request = {
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the accelerator to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cross_account_attachment_response = {
  cross_account_attachment : attachment option;
      [@ocaml.doc "Information about the cross-account attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cross_account_attachment_request = {
  attachment_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the cross-account attachment to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_accelerator_attributes_response = {
  accelerator_attributes : accelerator_attributes option;
      [@ocaml.doc "The attributes of the accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_accelerator_attributes_request = {
  accelerator_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the accelerator with the attributes that you want to \
         describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_accelerator_response = {
  accelerator : accelerator option; [@ocaml.doc "The description of the accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_accelerator_request = {
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the accelerator to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec deprovision_byoip_cidr_response = {
  byoip_cidr : byoip_cidr option; [@ocaml.doc "Information about the address range.\n"]
}
[@@ocaml.doc ""]

type nonrec deprovision_byoip_cidr_request = {
  cidr : generic_string;
      [@ocaml.doc
        "The address range, in CIDR notation. The prefix must be the same prefix that you \
         specified when you provisioned the address range.\n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the Global Accelerator Developer Guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec destination_addresses = ip_address list [@@ocaml.doc ""]

type nonrec destination_ports = port_number list [@@ocaml.doc ""]

type nonrec deny_custom_routing_traffic_request = {
  deny_all_traffic_to_endpoint : generic_boolean option;
      [@ocaml.doc
        "Indicates whether all destination IP addresses and ports for a specified VPC subnet \
         endpoint {i cannot} receive traffic from a custom routing accelerator. The value is TRUE \
         or FALSE. \n\n\
        \ When set to TRUE, {i no} destinations in the custom routing VPC subnet can receive \
         traffic. Note that you cannot specify destination IP addresses and ports when the value \
         is set to TRUE.\n\
        \ \n\
        \  When set to FALSE (or not specified), you {i must} specify a list of destination IP \
         addresses that cannot receive traffic. A list of ports is optional. If you don't specify \
         a list of ports, the ports that can accept traffic is the same as the ports configured \
         for the endpoint group.\n\
        \  \n\
        \   The default value is FALSE.\n\
        \   "]
  destination_ports : destination_ports option;
      [@ocaml.doc
        "A list of specific Amazon EC2 instance ports (destination ports) in a subnet endpoint \
         that you want to prevent from receiving traffic.\n"]
  destination_addresses : destination_addresses option;
      [@ocaml.doc
        "A list of specific Amazon EC2 instance IP addresses (destination addresses) in a subnet \
         that you want to prevent from receiving traffic. The IP addresses must be a subset of the \
         IP addresses allowed for the VPC subnet associated with the endpoint group.\n"]
  endpoint_id : generic_string;
      [@ocaml.doc
        "An ID for the endpoint. For custom routing accelerators, this is the virtual private \
         cloud (VPC) subnet ID.\n"]
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
}
[@@ocaml.doc ""]

type nonrec associated_endpoint_group_found_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The listener that you specified has an endpoint group associated with it. You must remove all \
   dependent resources from a listener before you can delete it.\n"]

type nonrec delete_listener_request = {
  listener_arn : generic_string; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_endpoint_group_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_custom_routing_listener_request = {
  listener_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_custom_routing_endpoint_group_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec associated_listener_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The accelerator that you specified has a listener associated with it. You must remove all \
   dependent resources from an accelerator before you can delete it.\n"]

type nonrec accelerator_not_disabled_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The accelerator that you specified could not be disabled.\n"]

type nonrec delete_custom_routing_accelerator_request = {
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the custom routing accelerator to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cross_account_attachment_request = {
  attachment_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the cross-account attachment to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_accelerator_request = {
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of an accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec create_listener_response = {
  listener : listener option; [@ocaml.doc "The listener that you've created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_listener_request = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the \
         idempotency\226\128\148that is, the uniqueness\226\128\148of the request.\n"]
  client_affinity : client_affinity option;
      [@ocaml.doc
        "Client affinity lets you direct all requests from a user to the same endpoint, if you \
         have stateful applications, regardless of the port and protocol of the client request. \
         Client affinity gives you control over whether to always route each client to the same \
         specific endpoint.\n\n\
        \ Global Accelerator uses a consistent-flow hashing algorithm to choose the optimal \
         endpoint for a connection. If client affinity is [NONE], Global Accelerator uses the \
         \"five-tuple\" (5-tuple) properties\226\128\148source IP address, source port, \
         destination IP address, destination port, and protocol\226\128\148to select the hash \
         value, and then chooses the best endpoint. However, with this setting, if someone uses \
         different ports to connect to Global Accelerator, their connections might not be always \
         routed to the same endpoint because the hash value changes. \n\
        \ \n\
        \  If you want a given client to always be routed to the same endpoint, set client \
         affinity to [SOURCE_IP] instead. When you use the [SOURCE_IP] setting, Global Accelerator \
         uses the \"two-tuple\" (2-tuple) properties\226\128\148 source (client) IP address and \
         destination IP address\226\128\148to select the hash value.\n\
        \  \n\
        \   The default value is [NONE].\n\
        \   "]
  protocol : protocol;
      [@ocaml.doc "The protocol for connections from clients to your accelerator.\n"]
  port_ranges : port_ranges;
      [@ocaml.doc
        "The list of port ranges to support for connections from clients to your accelerator.\n"]
  accelerator_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of your accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_group_already_exists_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The endpoint group that you specified already exists.\n"]

type nonrec create_endpoint_group_response = {
  endpoint_group : endpoint_group option;
      [@ocaml.doc "The information about the endpoint group that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_endpoint_group_request = {
  port_overrides : port_overrides option;
      [@ocaml.doc
        "Override specific listener ports used to route traffic to endpoints that are part of this \
         endpoint group. For example, you can create a port override in which the listener \
         receives user traffic on ports 80 and 443, but your accelerator routes that traffic to \
         ports 1080 and 1443, respectively, on the endpoints.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-endpoint-groups-port-override.html} \
         Overriding listener ports} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the \
         idempotency\226\128\148that is, the uniqueness\226\128\148of the request.\n"]
  threshold_count : threshold_count option;
      [@ocaml.doc
        "The number of consecutive health checks required to set the state of a healthy endpoint \
         to unhealthy, or to set an unhealthy endpoint to healthy. The default value is 3.\n"]
  health_check_interval_seconds : health_check_interval_seconds option;
      [@ocaml.doc
        "The time\226\128\14810 seconds or 30 seconds\226\128\148between each health check for an \
         endpoint. The default value is 30.\n"]
  health_check_path : health_check_path option;
      [@ocaml.doc
        "If the protocol is HTTP/S, then this specifies the path that is the destination for \
         health check targets. The default value is slash (/).\n"]
  health_check_protocol : health_check_protocol option;
      [@ocaml.doc
        "The protocol that Global Accelerator uses to check the health of endpoints that are part \
         of this endpoint group. The default value is TCP.\n"]
  health_check_port : health_check_port option;
      [@ocaml.doc
        "The port that Global Accelerator uses to check the health of endpoints that are part of \
         this endpoint group. The default port is the listener port that this endpoint group is \
         associated with. If listener port is a list of ports, Global Accelerator uses the first \
         port in the list.\n"]
  traffic_dial_percentage : traffic_dial_percentage option;
      [@ocaml.doc
        "The percentage of traffic to send to an Amazon Web Services Region. Additional traffic is \
         distributed to other endpoint groups for this listener. \n\n\
        \ Use this action to increase (dial up) or decrease (dial down) traffic to a specific \
         Region. The percentage is applied to the traffic that would otherwise have been routed to \
         the Region based on optimal routing.\n\
        \ \n\
        \  The default value is 100.\n\
        \  "]
  endpoint_configurations : endpoint_configurations option;
      [@ocaml.doc "The list of endpoint objects.\n"]
  endpoint_group_region : generic_string;
      [@ocaml.doc
        "The Amazon Web Services Region where the endpoint group is located. A listener can have \
         only one endpoint group in a specific Region.\n"]
  listener_arn : generic_string; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_routing_listener_response = {
  listener : custom_routing_listener option;
      [@ocaml.doc "The listener that you've created for a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_routing_listener_request = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the \
         idempotency\226\128\148that is, the uniqueness\226\128\148of the request.\n"]
  port_ranges : port_ranges;
      [@ocaml.doc
        "The port range to support for connections from clients to your accelerator.\n\n\
        \ Separately, you set port ranges for endpoints. For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/about-custom-routing-endpoints.html}About \
         endpoints for custom routing accelerators}.\n\
        \ "]
  accelerator_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the accelerator for a custom routing listener.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_routing_endpoint_group_response = {
  endpoint_group : custom_routing_endpoint_group option;
      [@ocaml.doc
        "The information about the endpoint group created for a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_routing_destination_configuration = {
  protocols : custom_routing_protocols;
      [@ocaml.doc
        "The protocol for the endpoint group that is associated with a custom routing accelerator. \
         The protocol can be either TCP or UDP.\n"]
  to_port : port_number;
      [@ocaml.doc
        "The last port, inclusive, in the range of ports for the endpoint group that is associated \
         with a custom routing accelerator.\n"]
  from_port : port_number;
      [@ocaml.doc
        "The first port, inclusive, in the range of ports for the endpoint group that is \
         associated with a custom routing accelerator.\n"]
}
[@@ocaml.doc
  "For a custom routing accelerator, sets the port range and protocol for all endpoints (virtual \
   private cloud subnets) in an endpoint group to accept client traffic on.\n"]

type nonrec custom_routing_destination_configurations =
  custom_routing_destination_configuration list
[@@ocaml.doc ""]

type nonrec create_custom_routing_endpoint_group_request = {
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the \
         idempotency\226\128\148that is, the uniqueness\226\128\148of the request.\n"]
  destination_configurations : custom_routing_destination_configurations;
      [@ocaml.doc
        "Sets the port range and protocol for all endpoints (virtual private cloud subnets) in a \
         custom routing endpoint group to accept client traffic on.\n"]
  endpoint_group_region : generic_string;
      [@ocaml.doc
        "The Amazon Web Services Region where the endpoint group is located. A listener can have \
         only one endpoint group in a specific Region.\n"]
  listener_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener for a custom routing endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_routing_accelerator_response = {
  accelerator : custom_routing_accelerator option; [@ocaml.doc "The accelerator that is created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_routing_accelerator_request = {
  tags : tags option;
      [@ocaml.doc
        "Create tags for an accelerator.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html}Tagging \
         in Global Accelerator} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the \
         idempotency\226\128\148that is, the uniqueness\226\128\148of the request.\n"]
  enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether an accelerator is enabled. The value is true or false. The default \
         value is true. \n\n\
        \ If the value is set to true, an accelerator cannot be deleted. If set to false, the \
         accelerator can be deleted.\n\
        \ "]
  ip_addresses : ip_addresses option;
      [@ocaml.doc
        "Optionally, if you've added your own IP address pool to Global Accelerator (BYOIP), you \
         can choose an IPv4 address from your own pool to use for the accelerator's static IPv4 \
         address when you create an accelerator. \n\n\
        \ After you bring an address range to Amazon Web Services, it appears in your account as \
         an address pool. When you create an accelerator, you can assign one IPv4 address from \
         your range to it. Global Accelerator assigns you a second static IPv4 address from an \
         Amazon IP address range. If you bring two IPv4 address ranges to Amazon Web Services, you \
         can assign one IPv4 address from each range to your accelerator. This restriction is \
         because Global Accelerator assigns each address range to a different network zone, for \
         high availability.\n\
        \ \n\
        \  You can specify one or two addresses, separated by a space. Do not include the /32 \
         suffix.\n\
        \  \n\
        \   Note that you can't update IP addresses for an existing accelerator. To change them, \
         you must create a new accelerator with the new addresses.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the {i Global Accelerator Developer Guide}.\n\
        \    "]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that an accelerator supports. For a custom routing accelerator, the \
         value must be IPV4.\n"]
  name : generic_string;
      [@ocaml.doc
        "The name of a custom routing accelerator. The name can have a maximum of 64 characters, \
         must contain only alphanumeric characters or hyphens (-), and must not begin or end with \
         a hyphen.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cross_account_attachment_response = {
  cross_account_attachment : attachment option;
      [@ocaml.doc "Information about the cross-account attachment.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cross_account_attachment_request = {
  tags : tags option;
      [@ocaml.doc
        "Add tags for a cross-account attachment.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html}Tagging \
         in Global Accelerator} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the \
         idempotency\226\128\148that is, the uniqueness\226\128\148of the request.\n"]
  resources : resources option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) for the resources to include in the cross-account \
         attachment. A resource can be any supported Amazon Web Services resource type for Global \
         Accelerator or a CIDR range for a bring your own IP address (BYOIP) address pool. \n"]
  principals : principals option;
      [@ocaml.doc
        "The principals to include in the cross-account attachment. A principal can be an Amazon \
         Web Services account number or the Amazon Resource Name (ARN) for an accelerator. \n"]
  name : attachment_name; [@ocaml.doc "The name of the cross-account attachment. \n"]
}
[@@ocaml.doc ""]

type nonrec create_accelerator_response = {
  accelerator : accelerator option;
      [@ocaml.doc
        "The accelerator that is created by specifying a listener and the supported IP address \
         types.\n"]
}
[@@ocaml.doc ""]

type nonrec create_accelerator_request = {
  tags : tags option;
      [@ocaml.doc
        "Create tags for an accelerator.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/tagging-in-global-accelerator.html}Tagging \
         in Global Accelerator} in the {i Global Accelerator Developer Guide}.\n\
        \ "]
  idempotency_token : idempotency_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the \
         idempotency\226\128\148that is, the uniqueness\226\128\148of an accelerator.\n"]
  enabled : generic_boolean option;
      [@ocaml.doc
        "Indicates whether an accelerator is enabled. The value is true or false. The default \
         value is true. \n\n\
        \ If the value is set to true, an accelerator cannot be deleted. If set to false, the \
         accelerator can be deleted.\n\
        \ "]
  ip_addresses : ip_addresses option;
      [@ocaml.doc
        "Optionally, if you've added your own IP address pool to Global Accelerator (BYOIP), you \
         can choose an IPv4 address from your own pool to use for the accelerator's static IPv4 \
         address when you create an accelerator. \n\n\
        \ After you bring an address range to Amazon Web Services, it appears in your account as \
         an address pool. When you create an accelerator, you can assign one IPv4 address from \
         your range to it. Global Accelerator assigns you a second static IPv4 address from an \
         Amazon IP address range. If you bring two IPv4 address ranges to Amazon Web Services, you \
         can assign one IPv4 address from each range to your accelerator. This restriction is \
         because Global Accelerator assigns each address range to a different network zone, for \
         high availability.\n\
        \ \n\
        \  You can specify one or two addresses, separated by a space. Do not include the /32 \
         suffix.\n\
        \  \n\
        \   Note that you can't update IP addresses for an existing accelerator. To change them, \
         you must create a new accelerator with the new addresses.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the {i Global Accelerator Developer Guide}.\n\
        \    "]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type that an accelerator supports. For a standard accelerator, the value \
         can be IPV4 or DUAL_STACK.\n"]
  name : generic_string;
      [@ocaml.doc
        "The name of the accelerator. The name can have a maximum of 64 characters, must contain \
         only alphanumeric characters, periods (.), or hyphens (-), and must not begin or end with \
         a hyphen or period.\n"]
}
[@@ocaml.doc ""]

type nonrec allow_custom_routing_traffic_request = {
  allow_all_traffic_to_endpoint : generic_boolean option;
      [@ocaml.doc
        "Indicates whether all destination IP addresses and ports for a specified VPC subnet \
         endpoint can receive traffic from a custom routing accelerator. The value is TRUE or \
         FALSE. \n\n\
        \ When set to TRUE, {i all} destinations in the custom routing VPC subnet can receive \
         traffic. Note that you cannot specify destination IP addresses and ports when the value \
         is set to TRUE.\n\
        \ \n\
        \  When set to FALSE (or not specified), you {i must} specify a list of destination IP \
         addresses that are allowed to receive traffic. A list of ports is optional. If you don't \
         specify a list of ports, the ports that can accept traffic is the same as the ports \
         configured for the endpoint group.\n\
        \  \n\
        \   The default value is FALSE.\n\
        \   "]
  destination_ports : destination_ports option;
      [@ocaml.doc
        "A list of specific Amazon EC2 instance ports (destination ports) that you want to allow \
         to receive traffic.\n"]
  destination_addresses : destination_addresses option;
      [@ocaml.doc
        "A list of specific Amazon EC2 instance IP addresses (destination addresses) in a subnet \
         that you want to allow to receive traffic. The IP addresses must be a subset of the IP \
         addresses that you specified for the endpoint group.\n\n\
        \  [DestinationAddresses] is required if [AllowAllTrafficToEndpoint] is [FALSE] or is not \
         specified.\n\
        \ "]
  endpoint_id : generic_string;
      [@ocaml.doc
        "An ID for the endpoint. For custom routing accelerators, this is the virtual private \
         cloud (VPC) subnet ID.\n"]
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
}
[@@ocaml.doc ""]

type nonrec advertise_byoip_cidr_response = {
  byoip_cidr : byoip_cidr option; [@ocaml.doc "Information about the address range.\n"]
}
[@@ocaml.doc ""]

type nonrec advertise_byoip_cidr_request = {
  cidr : generic_string;
      [@ocaml.doc
        "The address range, in CIDR notation. This must be the exact range that you provisioned. \
         You can't advertise only a portion of the provisioned range.\n\n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/global-accelerator/latest/dg/using-byoip.html}Bring your \
         own IP addresses (BYOIP)} in the Global Accelerator Developer Guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec add_endpoints_response = {
  endpoint_group_arn : generic_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
  endpoint_descriptions : endpoint_descriptions option;
      [@ocaml.doc "The list of endpoint objects.\n"]
}
[@@ocaml.doc ""]

type nonrec add_endpoints_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the endpoint group.\n"]
  endpoint_configurations : endpoint_configurations; [@ocaml.doc "The list of endpoint objects.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_already_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The endpoint that you specified doesn't exist.\n"]

type nonrec add_custom_routing_endpoints_response = {
  endpoint_group_arn : generic_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the endpoint group for the custom routing endpoint.\n"]
  endpoint_descriptions : custom_routing_endpoint_descriptions option;
      [@ocaml.doc "The endpoint objects added to the custom routing accelerator.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_routing_endpoint_configuration = {
  attachment_arn : generic_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the cross-account attachment that specifies the \
         endpoints (resources) that can be added to accelerators and principals that have \
         permission to add the endpoints.\n"]
  endpoint_id : generic_string option;
      [@ocaml.doc
        "An ID for the endpoint. For custom routing accelerators, this is the virtual private \
         cloud (VPC) subnet ID. \n"]
}
[@@ocaml.doc
  "The list of endpoint objects. For custom routing, this is a list of virtual private cloud (VPC) \
   subnet IDs.\n"]

type nonrec custom_routing_endpoint_configurations = custom_routing_endpoint_configuration list
[@@ocaml.doc ""]

type nonrec add_custom_routing_endpoints_request = {
  endpoint_group_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the endpoint group for the custom routing endpoint.\n"]
  endpoint_configurations : custom_routing_endpoint_configurations;
      [@ocaml.doc "The list of endpoint objects to add to a custom routing accelerator.\n"]
}
[@@ocaml.doc ""]
