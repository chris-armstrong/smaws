type nonrec zone_name = string [@@ocaml.doc ""]

type nonrec capacity_reservation_state_enum =
  | FAILED [@ocaml.doc ""]
  | REBALANCING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec state_reason = string [@@ocaml.doc ""]

type nonrec capacity_reservation_status = {
  reason : state_reason option; [@ocaml.doc "The reason code for the status.\n"]
  code : capacity_reservation_state_enum option; [@ocaml.doc "The status code.\n"]
}
[@@ocaml.doc "The status of a capacity reservation.\n"]

type nonrec capacity_units_double = float [@@ocaml.doc ""]

type nonrec zonal_capacity_reservation_state = {
  effective_capacity_units : capacity_units_double option;
      [@ocaml.doc "The number of effective capacity units.\n"]
  availability_zone : zone_name option; [@ocaml.doc "Information about the Availability Zone.\n"]
  state : capacity_reservation_status option; [@ocaml.doc "The state of the capacity reservation.\n"]
}
[@@ocaml.doc "The capacity reservation status for each Availability Zone.\n"]

type nonrec zonal_capacity_reservation_states = zonal_capacity_reservation_state list
[@@ocaml.doc ""]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec string_value = string [@@ocaml.doc ""]

type nonrec rewrite_config = {
  replace : string_value;
      [@ocaml.doc
        "The replacement string to use when rewriting the matched input. The maximum length of the \
         string is 1,024 characters. You can specify capture groups in the regular expression (for \
         example, $1 and $2).\n"]
  regex : string_value;
      [@ocaml.doc
        "The regular expression to match in the input string. The maximum length of the string is \
         1,024 characters.\n"]
}
[@@ocaml.doc
  "Information about a rewrite transform. This transform matches a pattern and replaces it with \
   the specified string.\n"]

type nonrec rewrite_config_list = rewrite_config list [@@ocaml.doc ""]

type nonrec url_rewrite_config = {
  rewrites : rewrite_config_list option;
      [@ocaml.doc
        "The URL rewrite transform to apply to the request. The transform consists of a regular \
         expression to match and a replacement string.\n"]
}
[@@ocaml.doc
  "Information about a URL rewrite transform. This transform matches a pattern in the request URL \
   and replaces it with the specified string.\n"]

type nonrec error_description = string [@@ocaml.doc ""]

type nonrec unsupported_protocol_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified protocol is not supported.\n"]

type nonrec trust_store_name = string [@@ocaml.doc ""]

type nonrec trust_store_arn = string [@@ocaml.doc ""]

type nonrec trust_store_status = CREATING [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec number_of_ca_certificates = int [@@ocaml.doc ""]

type nonrec total_revoked_entries = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec trust_store = {
  total_revoked_entries : total_revoked_entries option;
      [@ocaml.doc "The number of revoked certificates in the trust store.\n"]
  number_of_ca_certificates : number_of_ca_certificates option;
      [@ocaml.doc "The number of ca certificates in the trust store.\n"]
  status : trust_store_status option; [@ocaml.doc "The current status of the trust store.\n"]
  trust_store_arn : trust_store_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
  name : trust_store_name option; [@ocaml.doc "The name of the trust store.\n"]
}
[@@ocaml.doc "Information about a trust store.\n"]

type nonrec trust_stores = trust_store list [@@ocaml.doc ""]

type nonrec revocation_id = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec revocation_type = CRL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec number_of_revoked_entries = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec trust_store_revocation = {
  number_of_revoked_entries : number_of_revoked_entries option;
      [@ocaml.doc "The number of revoked certificates.\n"]
  revocation_type : revocation_type option; [@ocaml.doc "The type of revocation file.\n"]
  revocation_id : revocation_id option; [@ocaml.doc "The revocation ID of the revocation file.\n"]
  trust_store_arn : trust_store_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc "Information about a revocation file in use by a trust store.\n"]

type nonrec trust_store_revocations = trust_store_revocation list [@@ocaml.doc ""]

type nonrec trust_store_not_ready_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified trust store is not active.\n"]

type nonrec trust_store_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified trust store does not exist.\n"]

type nonrec trust_store_names = trust_store_name list [@@ocaml.doc ""]

type nonrec trust_store_in_use_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified trust store is currently in use.\n"]

type nonrec trust_store_association_resource_arn = string [@@ocaml.doc ""]

type nonrec trust_store_association = {
  resource_arn : trust_store_association_resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc "Information about the resources a trust store is associated with.\n"]

type nonrec trust_store_associations = trust_store_association list [@@ocaml.doc ""]

type nonrec trust_store_association_status_enum = REMOVED [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec trust_store_association_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified association does not exist.\n"]

type nonrec trust_store_arns = trust_store_arn list [@@ocaml.doc ""]

type nonrec transform_type_enum =
  | URL_REWRITE [@ocaml.doc ""]
  | HOST_HEADER_REWRITE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec too_many_unique_target_groups_per_load_balancer_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You've reached the limit on the number of unique target groups per load balancer across all \
   listeners. If a target group is used by multiple actions for a load balancer, it is counted as \
   only one use.\n"]

type nonrec too_many_trust_stores_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "You've reached the limit on the number of trust stores for your Amazon Web Services account.\n"]

type nonrec too_many_trust_store_revocation_entries_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified trust store has too many revocation entries.\n"]

type nonrec too_many_targets_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "You've reached the limit on the number of targets.\n"]

type nonrec too_many_target_groups_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You've reached the limit on the number of target groups for your Amazon Web Services account.\n"]

type nonrec too_many_tags_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "You've reached the limit on the number of tags for this resource.\n"]

type nonrec too_many_rules_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "You've reached the limit on the number of rules per load balancer.\n"]

type nonrec too_many_registrations_for_target_id_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You've reached the limit on the number of times a target can be registered with a load balancer.\n"]

type nonrec too_many_load_balancers_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You've reached the limit on the number of load balancers for your Amazon Web Services account.\n"]

type nonrec too_many_listeners_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "You've reached the limit on the number of listeners per load balancer.\n"]

type nonrec too_many_certificates_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "You've reached the limit on the number of certificates per load balancer.\n"]

type nonrec too_many_actions_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "You've reached the limit on the number of actions per rule.\n"]

type nonrec target_type_enum =
  | ALB [@ocaml.doc ""]
  | LAMBDA [@ocaml.doc ""]
  | IP [@ocaml.doc ""]
  | INSTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_id = string [@@ocaml.doc ""]

type nonrec target_health_state_enum =
  | UNAVAILABLE [@ocaml.doc ""]
  | DRAINING [@ocaml.doc ""]
  | UNUSED [@ocaml.doc ""]
  | UNHEALTHY_DRAINING [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
  | INITIAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_health_reason_enum =
  | INTERNAL_ERROR [@ocaml.doc ""]
  | HEALTH_CHECK_DISABLED [@ocaml.doc ""]
  | IP_UNUSABLE [@ocaml.doc ""]
  | INVALID_STATE [@ocaml.doc ""]
  | DEREGISTRATION_IN_PROGRESS [@ocaml.doc ""]
  | NOT_IN_USE [@ocaml.doc ""]
  | NOT_REGISTERED [@ocaml.doc ""]
  | FAILED_HEALTH_CHECKS [@ocaml.doc ""]
  | TIMEOUT [@ocaml.doc ""]
  | RESPONSE_CODE_MISMATCH [@ocaml.doc ""]
  | INITIAL_HEALTH_CHECKING [@ocaml.doc ""]
  | REGISTRATION_IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec port = int [@@ocaml.doc ""]

type nonrec quic_server_id = string [@@ocaml.doc ""]

type nonrec target_description = {
  quic_server_id : quic_server_id option;
      [@ocaml.doc
        "The server ID for the targets. This value is required if the protocol is [QUIC] or \
         [TCP_QUIC] and can't be used with other protocols.\n\n\
        \ The ID consists of the [0x] prefix followed by 16 hexadecimal characters. Any letters \
         must be lowercase. The value must be unique at the listener level. You can't modify the \
         server ID for a registered target. You must deregister the target and then provide a new \
         server ID when you register the target again.\n\
        \ "]
  availability_zone : zone_name option;
      [@ocaml.doc
        "An Availability Zone or [all]. This determines whether the target receives traffic from \
         the load balancer nodes in the specified Availability Zone or from all enabled \
         Availability Zones for the load balancer.\n\n\
        \ For Application Load Balancer target groups, the specified Availability Zone value is \
         only applicable when cross-zone load balancing is off. Otherwise the parameter is ignored \
         and treated as [all].\n\
        \ \n\
        \  This parameter is not supported if the target type of the target group is [instance] or \
         [alb].\n\
        \  \n\
        \   If the target type is [ip] and the IP address is in a subnet of the VPC for the target \
         group, the Availability Zone is automatically detected and this parameter is optional. If \
         the IP address is outside the VPC, this parameter is required.\n\
        \   \n\
        \    For Application Load Balancer target groups with cross-zone load balancing off, if \
         the target type is [ip] and the IP address is outside of the VPC for the target group, \
         this should be an Availability Zone inside the VPC for the target group.\n\
        \    \n\
        \     If the target type is [lambda], this parameter is optional and the only supported \
         value is [all].\n\
        \     "]
  port : port option;
      [@ocaml.doc
        "The port on which the target is listening. If the target group protocol is GENEVE, the \
         supported port is 6081. If the target type is [alb], the targeted Application Load \
         Balancer must have at least one listener whose port matches the target group port. This \
         parameter is not used if the target is a Lambda function.\n"]
  id : target_id;
      [@ocaml.doc
        "The ID of the target. If the target type of the target group is [instance], specify an \
         instance ID. If the target type is [ip], specify an IP address. If the target type is \
         [lambda], specify the ARN of the Lambda function. If the target type is [alb], specify \
         the ARN of the Application Load Balancer target. \n"]
}
[@@ocaml.doc "Information about a target.\n"]

type nonrec health_check_port = string [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec target_health = {
  description : description option;
      [@ocaml.doc
        "A description of the target health that provides additional details. If the state is \
         [healthy], a description is not provided.\n"]
  reason : target_health_reason_enum option;
      [@ocaml.doc
        "The reason code.\n\n\
        \ If the target state is [healthy], a reason code is not provided.\n\
        \ \n\
        \  If the target state is [initial], the reason code can be one of the following values:\n\
        \  \n\
        \   {ul\n\
        \         {-   [Elb.RegistrationInProgress] - The target is in the process of being \
         registered with the load balancer.\n\
        \             \n\
        \              }\n\
        \         {-   [Elb.InitialHealthChecking] - The load balancer is still sending the target \
         the minimum number of health checks required to determine its health status.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   If the target state is [unhealthy], the reason code can be one of the following values:\n\
        \   \n\
        \    {ul\n\
        \          {-   [Target.ResponseCodeMismatch] - The health checks did not return an \
         expected HTTP code.\n\
        \              \n\
        \               }\n\
        \          {-   [Target.Timeout] - The health check requests timed out.\n\
        \              \n\
        \               }\n\
        \          {-   [Target.FailedHealthChecks] - The load balancer received an error while \
         establishing a connection to the target or the target response was malformed.\n\
        \              \n\
        \               }\n\
        \          {-   [Elb.InternalError] - The health checks failed due to an internal error.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If the target state is [unused], the reason code can be one of the following values:\n\
        \   \n\
        \    {ul\n\
        \          {-   [Target.NotRegistered] - The target is not registered with the target group.\n\
        \              \n\
        \               }\n\
        \          {-   [Target.NotInUse] - The target group is not used by any load balancer or \
         the target is in an Availability Zone that is not enabled for its load balancer.\n\
        \              \n\
        \               }\n\
        \          {-   [Target.InvalidState] - The target is in the stopped or terminated state.\n\
        \              \n\
        \               }\n\
        \          {-   [Target.IpUnusable] - The target IP address is reserved for use by a load \
         balancer.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If the target state is [draining], the reason code can be the following value:\n\
        \   \n\
        \    {ul\n\
        \          {-   [Target.DeregistrationInProgress] - The target is in the process of being \
         deregistered and the deregistration delay period has not expired.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If the target state is [unavailable], the reason code can be the following value:\n\
        \   \n\
        \    {ul\n\
        \          {-   [Target.HealthCheckDisabled] - Health checks are disabled for the target \
         group.\n\
        \              \n\
        \               }\n\
        \          {-   [Elb.InternalError] - Target health is unavailable due to an internal error.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  state : target_health_state_enum option; [@ocaml.doc "The state of the target.\n"]
}
[@@ocaml.doc "Information about the current health of a target.\n"]

type nonrec anomaly_result_enum = NORMAL [@ocaml.doc ""] | ANOMALOUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mitigation_in_effect_enum = NO [@ocaml.doc ""] | YES [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec anomaly_detection = {
  mitigation_in_effect : mitigation_in_effect_enum option;
      [@ocaml.doc "Indicates whether anomaly mitigation is in progress.\n"]
  result_ : anomaly_result_enum option; [@ocaml.doc "The latest anomaly detection result.\n"]
}
[@@ocaml.doc "Information about anomaly detection and mitigation.\n"]

type nonrec target_administrative_override_state_enum =
  | ZONAL_SHIFT_DELEGATED_TO_DNS [@ocaml.doc ""]
  | ZONAL_SHIFT_ACTIVE [@ocaml.doc ""]
  | NO_OVERRIDE [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_administrative_override_reason_enum =
  | ZONAL_SHIFT_DELEGATED_TO_DNS [@ocaml.doc ""]
  | ZONAL_SHIFT_ENGAGED [@ocaml.doc ""]
  | NO_OVERRIDE_ENGAGED [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec administrative_override = {
  description : description option;
      [@ocaml.doc "A description of the override state that provides additional details.\n"]
  reason : target_administrative_override_reason_enum option;
      [@ocaml.doc "The reason code for the state.\n"]
  state : target_administrative_override_state_enum option;
      [@ocaml.doc "The state of the override.\n"]
}
[@@ocaml.doc "Information about the override status applied to a target.\n"]

type nonrec target_health_description = {
  administrative_override : administrative_override option;
      [@ocaml.doc "The administrative override information for the target.\n"]
  anomaly_detection : anomaly_detection option;
      [@ocaml.doc
        "The anomaly detection result for the target.\n\n\
        \ If no anomalies were detected, the result is [normal].\n\
        \ \n\
        \  If anomalies were detected, the result is [anomalous].\n\
        \  "]
  target_health : target_health option; [@ocaml.doc "The health information for the target.\n"]
  health_check_port : health_check_port option;
      [@ocaml.doc "The port to use to connect with the target.\n"]
  target : target_description option; [@ocaml.doc "The description of the target.\n"]
}
[@@ocaml.doc "Information about the health of a target.\n"]

type nonrec target_health_descriptions = target_health_description list [@@ocaml.doc ""]

type nonrec target_group_arn = string [@@ocaml.doc ""]

type nonrec target_group_name = string [@@ocaml.doc ""]

type nonrec protocol_enum =
  | TCP_QUIC [@ocaml.doc ""]
  | QUIC [@ocaml.doc ""]
  | GENEVE [@ocaml.doc ""]
  | TCP_UDP [@ocaml.doc ""]
  | UDP [@ocaml.doc ""]
  | TLS [@ocaml.doc ""]
  | TCP [@ocaml.doc ""]
  | HTTPS [@ocaml.doc ""]
  | HTTP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec health_check_enabled = bool [@@ocaml.doc ""]

type nonrec health_check_interval_seconds = int [@@ocaml.doc ""]

type nonrec health_check_timeout_seconds = int [@@ocaml.doc ""]

type nonrec health_check_threshold_count = int [@@ocaml.doc ""]

type nonrec path = string [@@ocaml.doc ""]

type nonrec http_code = string [@@ocaml.doc ""]

type nonrec grpc_code = string [@@ocaml.doc ""]

type nonrec matcher = {
  grpc_code : grpc_code option;
      [@ocaml.doc
        "You can specify values between 0 and 99. You can specify multiple values (for example, \
         \"0,1\") or a range of values (for example, \"0-5\"). The default value is 12.\n"]
  http_code : http_code option;
      [@ocaml.doc
        "For Application Load Balancers, you can specify values between 200 and 499, with the \
         default value being 200. You can specify multiple values (for example, \"200,202\") or a \
         range of values (for example, \"200-299\").\n\n\
        \ For Network Load Balancers, you can specify values between 200 and 599, with the default \
         value being 200-399. You can specify multiple values (for example, \"200,202\") or a \
         range of values (for example, \"200-299\").\n\
        \ \n\
        \  For Gateway Load Balancers, this must be \"200\226\128\147399\".\n\
        \  \n\
        \   Note that when using shorthand syntax, some values such as commas need to be escaped.\n\
        \   "]
}
[@@ocaml.doc
  "The codes to use when checking for a successful response from a target. If the protocol version \
   is gRPC, these are gRPC codes. Otherwise, these are HTTP codes. \n"]

type nonrec load_balancer_arn = string [@@ocaml.doc ""]

type nonrec load_balancer_arns = load_balancer_arn list [@@ocaml.doc ""]

type nonrec protocol_version = string [@@ocaml.doc ""]

type nonrec target_group_ip_address_type_enum = IPV6 [@ocaml.doc ""] | IPV4 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_control_port = int [@@ocaml.doc ""]

type nonrec target_group = {
  target_control_port : target_control_port option;
      [@ocaml.doc
        "The port on which the target control agent and application load balancer exchange \
         management traffic for the target optimizer feature.\n"]
  ip_address_type : target_group_ip_address_type_enum option;
      [@ocaml.doc "The IP address type. The default value is [ipv4].\n"]
  protocol_version : protocol_version option;
      [@ocaml.doc
        "\\[HTTP/HTTPS protocol\\] The protocol version. The possible values are [GRPC], [HTTP1], \
         and [HTTP2].\n"]
  target_type : target_type_enum option;
      [@ocaml.doc
        "The type of target that you must specify when registering targets with this target group. \
         The possible values are [instance] (register targets by instance ID), [ip] (register \
         targets by IP address), [lambda] (register a single Lambda function as a target), or \
         [alb] (register a single Application Load Balancer as a target).\n"]
  load_balancer_arns : load_balancer_arns option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the load balancer that routes traffic to this target \
         group. You can use each target group with only one load balancer.\n"]
  matcher : matcher option;
      [@ocaml.doc
        "The HTTP or gRPC codes to use when checking for a successful response from a target.\n"]
  health_check_path : path option;
      [@ocaml.doc "The destination for health checks on the targets.\n"]
  unhealthy_threshold_count : health_check_threshold_count option;
      [@ocaml.doc
        "The number of consecutive health check failures required before considering the target \
         unhealthy.\n"]
  healthy_threshold_count : health_check_threshold_count option;
      [@ocaml.doc
        "The number of consecutive health checks successes required before considering an \
         unhealthy target healthy.\n"]
  health_check_timeout_seconds : health_check_timeout_seconds option;
      [@ocaml.doc
        "The amount of time, in seconds, during which no response means a failed health check.\n"]
  health_check_interval_seconds : health_check_interval_seconds option;
      [@ocaml.doc
        "The approximate amount of time, in seconds, between health checks of an individual target.\n"]
  health_check_enabled : health_check_enabled option;
      [@ocaml.doc "Indicates whether health checks are enabled.\n"]
  health_check_port : health_check_port option;
      [@ocaml.doc "The port to use to connect with the target.\n"]
  health_check_protocol : protocol_enum option;
      [@ocaml.doc
        "The protocol to use to connect with the target. The GENEVE, TLS, UDP, and TCP_UDP \
         protocols are not supported for health checks.\n"]
  vpc_id : vpc_id option; [@ocaml.doc "The ID of the VPC for the targets.\n"]
  port : port option;
      [@ocaml.doc
        "The port on which the targets are listening. This parameter is not used if the target is \
         a Lambda function.\n"]
  protocol : protocol_enum option;
      [@ocaml.doc "The protocol to use for routing traffic to the targets.\n"]
  target_group_name : target_group_name option; [@ocaml.doc "The name of the target group.\n"]
  target_group_arn : target_group_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc "Information about a target group.\n"]

type nonrec target_groups = target_group list [@@ocaml.doc ""]

type nonrec target_group_weight = int [@@ocaml.doc ""]

type nonrec target_group_tuple = {
  weight : target_group_weight option; [@ocaml.doc "The weight. The range is 0 to 999.\n"]
  target_group_arn : target_group_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc
  "Information about how traffic will be distributed between multiple target groups in a forward \
   rule.\n"]

type nonrec target_group_stickiness_enabled = bool [@@ocaml.doc ""]

type nonrec target_group_stickiness_duration_seconds = int [@@ocaml.doc ""]

type nonrec target_group_stickiness_config = {
  duration_seconds : target_group_stickiness_duration_seconds option;
      [@ocaml.doc
        "\\[Application Load Balancers\\] The time period, in seconds, during which requests from \
         a client should be routed to the same target group. The range is 1-604800 seconds (7 \
         days). You must specify this value when enabling target group stickiness.\n"]
  enabled : target_group_stickiness_enabled option;
      [@ocaml.doc "Indicates whether target group stickiness is enabled.\n"]
}
[@@ocaml.doc "Information about the target group stickiness for a rule.\n"]

type nonrec target_group_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified target group does not exist.\n"]

type nonrec target_group_names = target_group_name list [@@ocaml.doc ""]

type nonrec target_group_list = target_group_tuple list [@@ocaml.doc ""]

type nonrec target_group_attribute_key = string [@@ocaml.doc ""]

type nonrec target_group_attribute_value = string [@@ocaml.doc ""]

type nonrec target_group_attribute = {
  value : target_group_attribute_value option; [@ocaml.doc "The value of the attribute.\n"]
  key : target_group_attribute_key option;
      [@ocaml.doc
        "The name of the attribute.\n\n\
        \ The following attributes are supported by all load balancers:\n\
        \ \n\
        \  {ul\n\
        \        {-   [deregistration_delay.timeout_seconds] - The amount of time, in seconds, for \
         Elastic Load Balancing to wait before changing the state of a deregistering target from \
         [draining] to [unused]. The range is 0-3600 seconds. The default value is 300 seconds. If \
         the target is a Lambda function, this attribute is not supported.\n\
        \            \n\
        \             }\n\
        \        {-   [stickiness.enabled] - Indicates whether target stickiness is enabled. The \
         value is [true] or [false]. The default is [false].\n\
        \            \n\
        \             }\n\
        \        {-   [stickiness.type] - Indicates the type of stickiness. The possible values are:\n\
        \            \n\
        \             {ul\n\
        \                   {-   [lb_cookie] and [app_cookie] for Application Load Balancers.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [source_ip] for Network Load Balancers.\n\
        \                       \n\
        \                        }\n\
        \                   {-   [source_ip_dest_ip] and [source_ip_dest_ip_proto] for Gateway \
         Load Balancers.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \   The following attributes are supported by Application Load Balancers and Network Load \
         Balancers:\n\
        \   \n\
        \    {ul\n\
        \          {-   [load_balancing.cross_zone.enabled] - Indicates whether cross zone load \
         balancing is enabled. The value is [true], [false] or [use_load_balancer_configuration]. \
         The default is [use_load_balancer_configuration].\n\
        \              \n\
        \               }\n\
        \          {-   [target_group_health.dns_failover.minimum_healthy_targets.count] - The \
         minimum number of targets that must be healthy. If the number of healthy targets is below \
         this value, mark the zone as unhealthy in DNS, so that traffic is routed only to healthy \
         zones. The possible values are [off] or an integer from 1 to the maximum number of \
         targets. The default is 1.\n\
        \              \n\
        \               }\n\
        \          {-   [target_group_health.dns_failover.minimum_healthy_targets.percentage] - \
         The minimum percentage of targets that must be healthy. If the percentage of healthy \
         targets is below this value, mark the zone as unhealthy in DNS, so that traffic is routed \
         only to healthy zones. The possible values are [off] or an integer from 1 to 100. The \
         default is [off].\n\
        \              \n\
        \               }\n\
        \          {-   \
         [target_group_health.unhealthy_state_routing.minimum_healthy_targets.count] - The minimum \
         number of targets that must be healthy. If the number of healthy targets is below this \
         value, send traffic to all targets, including unhealthy targets. The possible values are \
         1 to the maximum number of targets. The default is 1.\n\
        \              \n\
        \               }\n\
        \          {-   \
         [target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage] - The \
         minimum percentage of targets that must be healthy. If the percentage of healthy targets \
         is below this value, send traffic to all targets, including unhealthy targets. The \
         possible values are [off] or an integer from 1 to 100. The default is [off].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following attributes are supported only if the load balancer is an Application \
         Load Balancer and the target is an instance or an IP address:\n\
        \   \n\
        \    {ul\n\
        \          {-   [load_balancing.algorithm.type] - The load balancing algorithm determines \
         how the load balancer selects targets when routing requests. The value is [round_robin], \
         [least_outstanding_requests], or [weighted_random]. The default is [round_robin].\n\
        \              \n\
        \               }\n\
        \          {-   [load_balancing.algorithm.anomaly_mitigation] - Only available when \
         [load_balancing.algorithm.type] is [weighted_random]. Indicates whether anomaly \
         mitigation is enabled. The value is [on] or [off]. The default is [off].\n\
        \              \n\
        \               }\n\
        \          {-   [slow_start.duration_seconds] - The time period, in seconds, during which \
         a newly registered target receives an increasing share of the traffic to the target \
         group. After this time period ends, the target receives its full share of traffic. The \
         range is 30-900 seconds (15 minutes). The default is 0 seconds (disabled).\n\
        \              \n\
        \               }\n\
        \          {-   [stickiness.app_cookie.cookie_name] - Indicates the name of the \
         application-based cookie. Names that start with the following prefixes are not allowed: \
         [AWSALB], [AWSALBAPP], and [AWSALBTG]; they're reserved for use by the load balancer.\n\
        \              \n\
        \               }\n\
        \          {-   [stickiness.app_cookie.duration_seconds] - The time period, in seconds, \
         during which requests from a client should be routed to the same target. After this time \
         period expires, the application-based cookie is considered stale. The range is 1 second \
         to 1 week (604800 seconds). The default value is 1 day (86400 seconds).\n\
        \              \n\
        \               }\n\
        \          {-   [stickiness.lb_cookie.duration_seconds] - The time period, in seconds, \
         during which requests from a client should be routed to the same target. After this time \
         period expires, the load balancer-generated cookie is considered stale. The range is 1 \
         second to 1 week (604800 seconds). The default value is 1 day (86400 seconds). \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following attribute is supported only if the load balancer is an Application Load \
         Balancer and the target is a Lambda function:\n\
        \   \n\
        \    {ul\n\
        \          {-   [lambda.multi_value_headers.enabled] - Indicates whether the request and \
         response headers that are exchanged between the load balancer and the Lambda function \
         include arrays of values or strings. The value is [true] or [false]. The default is \
         [false]. If the value is [false] and the request contains a duplicate header field name \
         or query parameter key, the load balancer uses the last value sent by the client.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following attributes are supported only by Network Load Balancers:\n\
        \   \n\
        \    {ul\n\
        \          {-   [deregistration_delay.connection_termination.enabled] - Indicates whether \
         the load balancer terminates connections at the end of the deregistration timeout. The \
         value is [true] or [false]. For new UDP/TCP_UDP target groups the default is [true]. \
         Otherwise, the default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [preserve_client_ip.enabled] - Indicates whether client IP preservation is \
         enabled. The value is [true] or [false]. The default is disabled if the target group type \
         is IP address and the target group protocol is TCP or TLS. Otherwise, the default is \
         enabled. Client IP preservation can't be disabled for UDP and TCP_UDP target groups.\n\
        \              \n\
        \               }\n\
        \          {-   [proxy_protocol_v2.enabled] - Indicates whether Proxy Protocol version 2 \
         is enabled. The value is [true] or [false]. The default is [false]. \n\
        \              \n\
        \               }\n\
        \          {-   [target_health_state.unhealthy.connection_termination.enabled] - Indicates \
         whether the load balancer terminates connections to unhealthy targets. The value is \
         [true] or [false]. The default is [true]. This attribute can't be enabled for UDP and \
         TCP_UDP target groups.\n\
        \              \n\
        \               }\n\
        \          {-   [target_health_state.unhealthy.draining_interval_seconds] - The amount of \
         time for Elastic Load Balancing to wait before changing the state of an unhealthy target \
         from [unhealthy.draining] to [unhealthy]. The range is 0-360000 seconds. The default \
         value is 0 seconds.\n\
        \              \n\
        \               Note: This attribute can only be configured when \
         [target_health_state.unhealthy.connection_termination.enabled] is [false].\n\
        \               \n\
        \                }\n\
        \          }\n\
        \   The following attributes are supported only by Gateway Load Balancers:\n\
        \   \n\
        \    {ul\n\
        \          {-   [target_failover.on_deregistration] - Indicates how the Gateway Load \
         Balancer handles existing flows when a target is deregistered. The possible values are \
         [rebalance] and [no_rebalance]. The default is [no_rebalance]. The two attributes \
         ([target_failover.on_deregistration] and [target_failover.on_unhealthy]) can't be set \
         independently. The value you set for both attributes must be the same. \n\
        \              \n\
        \               }\n\
        \          {-   [target_failover.on_unhealthy] - Indicates how the Gateway Load Balancer \
         handles existing flows when a target is unhealthy. The possible values are [rebalance] \
         and [no_rebalance]. The default is [no_rebalance]. The two attributes \
         ([target_failover.on_deregistration] and [target_failover.on_unhealthy]) can't be set \
         independently. The value you set for both attributes must be the same. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "Information about a target group attribute.\n"]

type nonrec target_group_attributes = target_group_attribute list [@@ocaml.doc ""]

type nonrec target_group_association_limit_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "You've reached the limit on the number of load balancers per target group.\n"]

type nonrec target_group_arns = target_group_arn list [@@ocaml.doc ""]

type nonrec target_descriptions = target_description list [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option; [@ocaml.doc "The value of the tag.\n"]
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
}
[@@ocaml.doc "Information about a tag.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec tag_description = {
  tags : tag_list option; [@ocaml.doc "Information about the tags.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc "The tags associated with a resource.\n"]

type nonrec tag_descriptions = tag_description list [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnets = subnet_id list [@@ocaml.doc ""]

type nonrec subnet_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified subnet does not exist.\n"]

type nonrec allocation_id = string [@@ocaml.doc ""]

type nonrec private_i_pv4_address = string [@@ocaml.doc ""]

type nonrec i_pv6_address = string [@@ocaml.doc ""]

type nonrec source_nat_ipv6_prefix = string [@@ocaml.doc ""]

type nonrec subnet_mapping = {
  source_nat_ipv6_prefix : source_nat_ipv6_prefix option;
      [@ocaml.doc
        "\\[Network Load Balancers with UDP listeners\\] The IPv6 prefix to use for source NAT. \
         Specify an IPv6 prefix (/80 netmask) from the subnet CIDR block or [auto_assigned] to use \
         an IPv6 prefix selected at random from the subnet CIDR block.\n"]
  i_pv6_address : i_pv6_address option;
      [@ocaml.doc "\\[Network Load Balancers\\] The IPv6 address.\n"]
  private_i_pv4_address : private_i_pv4_address option;
      [@ocaml.doc
        "\\[Network Load Balancers\\] The private IPv4 address for an internal load balancer.\n"]
  allocation_id : allocation_id option;
      [@ocaml.doc
        "\\[Network Load Balancers\\] The allocation ID of the Elastic IP address for an \
         internet-facing load balancer.\n"]
  subnet_id : subnet_id option; [@ocaml.doc "The ID of the subnet.\n"]
}
[@@ocaml.doc "Information about a subnet mapping.\n"]

type nonrec subnet_mappings = subnet_mapping list [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec ssl_protocol = string [@@ocaml.doc ""]

type nonrec ssl_protocols = ssl_protocol list [@@ocaml.doc ""]

type nonrec ssl_policy_name = string [@@ocaml.doc ""]

type nonrec ssl_policy_names = ssl_policy_name list [@@ocaml.doc ""]

type nonrec cipher_name = string [@@ocaml.doc ""]

type nonrec cipher_priority = int [@@ocaml.doc ""]

type nonrec cipher = {
  priority : cipher_priority option; [@ocaml.doc "The priority of the cipher.\n"]
  name : cipher_name option; [@ocaml.doc "The name of the cipher.\n"]
}
[@@ocaml.doc "Information about a cipher used in a policy.\n"]

type nonrec ciphers = cipher list [@@ocaml.doc ""]

type nonrec list_of_string = string_value list [@@ocaml.doc ""]

type nonrec ssl_policy = {
  supported_load_balancer_types : list_of_string option;
      [@ocaml.doc " The supported load balancers. \n"]
  name : ssl_policy_name option; [@ocaml.doc "The name of the policy.\n"]
  ciphers : ciphers option; [@ocaml.doc "The ciphers.\n"]
  ssl_protocols : ssl_protocols option; [@ocaml.doc "The protocols.\n"]
}
[@@ocaml.doc "Information about a policy used for SSL negotiation.\n"]

type nonrec ssl_policies = ssl_policy list [@@ocaml.doc ""]

type nonrec source_nat_ipv6_prefixes = source_nat_ipv6_prefix list [@@ocaml.doc ""]

type nonrec source_ip_condition_config = {
  values : list_of_string option;
      [@ocaml.doc
        "The source IP addresses, in CIDR format. You can use both IPv4 and IPv6 addresses. \
         Wildcards are not supported.\n\n\
        \ If you specify multiple addresses, the condition is satisfied if the source IP address \
         of the request matches one of the CIDR blocks. This condition is not satisfied by the \
         addresses in the X-Forwarded-For header. To search for addresses in the X-Forwarded-For \
         header, use an \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#http-header-conditions}HTTP \
         header condition}.\n\
        \ \n\
        \  The total number of values must be less than, or equal to five.\n\
        \  "]
}
[@@ocaml.doc
  "Information about a source IP condition.\n\n\
  \ You can use this condition to route based on the IP address of the source that connects to the \
   load balancer. If a client is behind a proxy, this is the IP address of the proxy not the IP \
   address of the client.\n\
  \ "]

type nonrec outpost_id = string [@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec load_balancer_address = {
  i_pv6_address : i_pv6_address option;
      [@ocaml.doc "\\[Network Load Balancers\\] The IPv6 address.\n"]
  private_i_pv4_address : private_i_pv4_address option;
      [@ocaml.doc
        "\\[Network Load Balancers\\] The private IPv4 address for an internal load balancer.\n"]
  allocation_id : allocation_id option;
      [@ocaml.doc
        "\\[Network Load Balancers\\] The allocation ID of the Elastic IP address for an \
         internal-facing load balancer.\n"]
  ip_address : ip_address option; [@ocaml.doc "The static IP address.\n"]
}
[@@ocaml.doc "Information about a static IP address for a load balancer.\n"]

type nonrec load_balancer_addresses = load_balancer_address list [@@ocaml.doc ""]

type nonrec availability_zone = {
  source_nat_ipv6_prefixes : source_nat_ipv6_prefixes option;
      [@ocaml.doc
        "\\[Network Load Balancers with UDP listeners\\] The IPv6 prefixes to use for source NAT. \
         For each subnet, specify an IPv6 prefix (/80 netmask) from the subnet CIDR block or \
         [auto_assigned] to use an IPv6 prefix selected at random from the subnet CIDR block.\n"]
  load_balancer_addresses : load_balancer_addresses option;
      [@ocaml.doc
        "\\[Network Load Balancers\\] If you need static IP addresses for your load balancer, you \
         can specify one Elastic IP address per Availability Zone when you create an \
         internal-facing load balancer. For internal load balancers, you can specify a private IP \
         address from the IPv4 range of the subnet.\n"]
  outpost_id : outpost_id option;
      [@ocaml.doc "\\[Application Load Balancers on Outposts\\] The ID of the Outpost.\n"]
  subnet_id : subnet_id option;
      [@ocaml.doc "The ID of the subnet. You can specify one subnet per Availability Zone.\n"]
  zone_name : zone_name option; [@ocaml.doc "The name of the Availability Zone.\n"]
}
[@@ocaml.doc "Information about an Availability Zone.\n"]

type nonrec availability_zones = availability_zone list [@@ocaml.doc ""]

type nonrec ip_address_type =
  | DUALSTACK_WITHOUT_PUBLIC_IPV4 [@ocaml.doc ""]
  | DUALSTACK [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec enable_prefix_for_ipv6_source_nat_enum = OFF [@ocaml.doc ""] | ON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec set_subnets_output = {
  enable_prefix_for_ipv6_source_nat : enable_prefix_for_ipv6_source_nat_enum option;
      [@ocaml.doc
        "\\[Network Load Balancers\\] Indicates whether to use an IPv6 prefix from each subnet for \
         source NAT.\n"]
  ip_address_type : ip_address_type option; [@ocaml.doc "The IP address type.\n"]
  availability_zones : availability_zones option; [@ocaml.doc "Information about the subnets.\n"]
}
[@@ocaml.doc ""]

type nonrec set_subnets_input = {
  enable_prefix_for_ipv6_source_nat : enable_prefix_for_ipv6_source_nat_enum option;
      [@ocaml.doc
        "\\[Network Load Balancers with UDP listeners\\] Indicates whether to use an IPv6 prefix \
         from each subnet for source NAT. The IP address type must be [dualstack]. The default \
         value is [off].\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type.\n\n\
        \ \\[Application Load Balancers\\] The possible values are [ipv4] (IPv4 addresses), \
         [dualstack] (IPv4 and IPv6 addresses), and [dualstack-without-public-ipv4] (public IPv6 \
         addresses and private IPv4 and IPv6 addresses).\n\
        \ \n\
        \  \\[Network Load Balancers and Gateway Load Balancers\\] The possible values are [ipv4] \
         (IPv4 addresses) and [dualstack] (IPv4 and IPv6 addresses).\n\
        \  "]
  subnet_mappings : subnet_mappings option;
      [@ocaml.doc
        "The IDs of the public subnets. You can specify only one subnet per Availability Zone. You \
         must specify either subnets or subnet mappings.\n\n\
        \ \\[Application Load Balancers\\] You must specify subnets from at least two Availability \
         Zones. You can't specify Elastic IP addresses for your subnets.\n\
        \ \n\
        \  \\[Application Load Balancers on Outposts\\] You must specify one Outpost subnet.\n\
        \  \n\
        \   \\[Application Load Balancers on Local Zones\\] You can specify subnets from one or \
         more Local Zones.\n\
        \   \n\
        \    \\[Network Load Balancers\\] You can specify subnets from one or more Availability \
         Zones. You can specify one Elastic IP address per subnet if you need static IP addresses \
         for your internet-facing load balancer. For internal load balancers, you can specify one \
         private IP address per subnet from the IPv4 range of the subnet. For internet-facing load \
         balancer, you can specify one IPv6 address per subnet.\n\
        \    \n\
        \     \\[Gateway Load Balancers\\] You can specify subnets from one or more Availability \
         Zones.\n\
        \     "]
  subnets : subnets option;
      [@ocaml.doc
        "The IDs of the public subnets. You can specify only one subnet per Availability Zone. You \
         must specify either subnets or subnet mappings.\n\n\
        \ \\[Application Load Balancers\\] You must specify subnets from at least two Availability \
         Zones.\n\
        \ \n\
        \  \\[Application Load Balancers on Outposts\\] You must specify one Outpost subnet.\n\
        \  \n\
        \   \\[Application Load Balancers on Local Zones\\] You can specify subnets from one or \
         more Local Zones.\n\
        \   \n\
        \    \\[Network Load Balancers\\] You can specify subnets from one or more Availability \
         Zones.\n\
        \    \n\
        \     \\[Gateway Load Balancers\\] You can specify subnets from one or more Availability \
         Zones. You must include all subnets that were enabled previously, with their existing \
         configurations, plus any additional subnets.\n\
        \     "]
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec load_balancer_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified load balancer does not exist.\n"]

type nonrec invalid_subnet_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified subnet is out of available addresses.\n"]

type nonrec invalid_configuration_request_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested configuration is not valid.\n"]

type nonrec capacity_reservation_pending_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "There is a pending capacity reservation.\n"]

type nonrec availability_zone_not_supported_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified Availability Zone is not supported.\n"]

type nonrec allocation_id_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified allocation ID does not exist.\n"]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_groups = security_group_id list [@@ocaml.doc ""]

type nonrec enforce_security_group_inbound_rules_on_private_link_traffic_enum =
  | Off [@ocaml.doc ""]
  | On [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec set_security_groups_output = {
  enforce_security_group_inbound_rules_on_private_link_traffic :
    enforce_security_group_inbound_rules_on_private_link_traffic_enum option;
      [@ocaml.doc
        "Indicates whether to evaluate inbound security group rules for traffic sent to a Network \
         Load Balancer through Amazon Web Services PrivateLink.\n"]
  security_group_ids : security_groups option;
      [@ocaml.doc "The IDs of the security groups associated with the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec set_security_groups_input = {
  enforce_security_group_inbound_rules_on_private_link_traffic :
    enforce_security_group_inbound_rules_on_private_link_traffic_enum option;
      [@ocaml.doc
        "Indicates whether to evaluate inbound security group rules for traffic sent to a Network \
         Load Balancer through Amazon Web Services PrivateLink. Applies only if the load balancer \
         has an associated security group. The default is [on].\n"]
  security_groups : security_groups; [@ocaml.doc "The IDs of the security groups.\n"]
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_security_group_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified security group does not exist.\n"]

type nonrec rule_arn = string [@@ocaml.doc ""]

type nonrec condition_field_name = string [@@ocaml.doc ""]

type nonrec host_header_condition_config = {
  regex_values : list_of_string option;
      [@ocaml.doc
        "The regular expressions to compare against the host header. The maximum length of each \
         string is 128 characters.\n"]
  values : list_of_string option;
      [@ocaml.doc
        "The host names. The maximum length of each string is 128 characters. The comparison is \
         case insensitive. The following wildcard characters are supported: * (matches 0 or more \
         characters) and ? (matches exactly 1 character). You must include at least one \".\" \
         character. You can include only alphabetical characters after the final \".\" character.\n\n\
        \ If you specify multiple strings, the condition is satisfied if one of the strings \
         matches the host name.\n\
        \ "]
}
[@@ocaml.doc "Information about a host header condition.\n"]

type nonrec path_pattern_condition_config = {
  regex_values : list_of_string option;
      [@ocaml.doc
        "The regular expressions to compare against the request URL. The maximum length of each \
         string is 128 characters.\n"]
  values : list_of_string option;
      [@ocaml.doc
        "The path patterns to compare against the request URL. The maximum length of each string \
         is 128 characters. The comparison is case sensitive. The following wildcard characters \
         are supported: * (matches 0 or more characters) and ? (matches exactly 1 character).\n\n\
        \ If you specify multiple strings, the condition is satisfied if one of them matches the \
         request URL. The path pattern is compared only to the path of the URL, not to its query \
         string. To compare against the query string, use a \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#query-string-conditions}query \
         string condition}.\n\
        \ "]
}
[@@ocaml.doc "Information about a path pattern condition.\n"]

type nonrec http_header_condition_name = string [@@ocaml.doc ""]

type nonrec http_header_condition_config = {
  regex_values : list_of_string option;
      [@ocaml.doc
        "The regular expression to compare against the HTTP header. The maximum length of each \
         string is 128 characters.\n"]
  values : list_of_string option;
      [@ocaml.doc
        "The strings to compare against the value of the HTTP header. The maximum length of each \
         string is 128 characters. The comparison strings are case insensitive. The following \
         wildcard characters are supported: * (matches 0 or more characters) and ? (matches \
         exactly 1 character).\n\n\
        \ If the same header appears multiple times in the request, we search them in order until \
         a match is found.\n\
        \ \n\
        \  If you specify multiple strings, the condition is satisfied if one of the strings \
         matches the value of the HTTP header. To require that all of the strings are a match, \
         create one condition per string.\n\
        \  "]
  http_header_name : http_header_condition_name option;
      [@ocaml.doc
        "The name of the HTTP header field. The maximum length is 40 characters. The header name \
         is case insensitive. The allowed characters are specified by RFC 7230. Wildcards are not \
         supported.\n\n\
        \ You can't use an HTTP header condition to specify the host header. Instead, use a \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html#host-conditions}host \
         condition}.\n\
        \ "]
}
[@@ocaml.doc
  "Information about an HTTP header condition.\n\n\
  \ There is a set of standard HTTP header fields. You can also define custom HTTP header fields.\n\
  \ "]

type nonrec query_string_key_value_pair = {
  value : string_value option; [@ocaml.doc "The value.\n"]
  key : string_value option; [@ocaml.doc "The key. You can omit the key.\n"]
}
[@@ocaml.doc "Information about a key/value pair.\n"]

type nonrec query_string_key_value_pair_list = query_string_key_value_pair list [@@ocaml.doc ""]

type nonrec query_string_condition_config = {
  values : query_string_key_value_pair_list option;
      [@ocaml.doc
        "The key/value pairs or values to find in the query string. The maximum length of each \
         string is 128 characters. The comparison is case insensitive. The following wildcard \
         characters are supported: * (matches 0 or more characters) and ? (matches exactly 1 \
         character). To search for a literal '*' or '?' character in a query string, you must \
         escape these characters in [Values] using a '\\' character.\n\n\
        \ If you specify multiple key/value pairs or values, the condition is satisfied if one of \
         them is found in the query string.\n\
        \ "]
}
[@@ocaml.doc
  "Information about a query string condition.\n\n\
  \ The query string component of a URI starts after the first '?' character and is terminated by \
   either a '#' character or the end of the URI. A typical query string contains key/value pairs \
   separated by '&' characters. The allowed characters are specified by RFC 3986. Any character \
   can be percentage encoded.\n\
  \ "]

type nonrec http_request_method_condition_config = {
  values : list_of_string option;
      [@ocaml.doc
        "The name of the request method. The maximum length is 40 characters. The allowed \
         characters are A-Z, hyphen (-), and underscore (_). The comparison is case sensitive. \
         Wildcards are not supported; therefore, the method name must be an exact match.\n\n\
        \ If you specify multiple strings, the condition is satisfied if one of the strings \
         matches the HTTP request method. We recommend that you route GET and HEAD requests in the \
         same way, because the response to a HEAD request may be cached.\n\
        \ "]
}
[@@ocaml.doc
  "Information about an HTTP method condition.\n\n\
  \ HTTP defines a set of request methods, also referred to as HTTP verbs. For more information, \
   see the {{:https://www.iana.org/assignments/http-methods/http-methods.xhtml}HTTP Method \
   Registry}. You can also define custom HTTP methods.\n\
  \ "]

type nonrec rule_condition = {
  regex_values : list_of_string option;
      [@ocaml.doc
        "The regular expressions to match against the condition field. The maximum length of each \
         string is 128 characters. Specify only when [Field] is [http-header], [host-header], or \
         [path-pattern].\n"]
  source_ip_config : source_ip_condition_config option;
      [@ocaml.doc
        "Information for a source IP condition. Specify only when [Field] is [source-ip].\n"]
  http_request_method_config : http_request_method_condition_config option;
      [@ocaml.doc
        "Information for an HTTP method condition. Specify only when [Field] is \
         [http-request-method].\n"]
  query_string_config : query_string_condition_config option;
      [@ocaml.doc
        "Information for a query string condition. Specify only when [Field] is [query-string].\n"]
  http_header_config : http_header_condition_config option;
      [@ocaml.doc
        "Information for an HTTP header condition. Specify only when [Field] is [http-header].\n"]
  path_pattern_config : path_pattern_condition_config option;
      [@ocaml.doc
        "Information for a path pattern condition. Specify only when [Field] is [path-pattern].\n"]
  host_header_config : host_header_condition_config option;
      [@ocaml.doc
        "Information for a host header condition. Specify only when [Field] is [host-header].\n"]
  values : list_of_string option;
      [@ocaml.doc
        "The condition value. Specify only when [Field] is [host-header] or [path-pattern]. \
         Alternatively, to specify multiple host names or multiple path patterns, use \
         [HostHeaderConfig] or [PathPatternConfig].\n\n\
        \ If [Field] is [host-header] and you are not using [HostHeaderConfig], you can specify a \
         single host name (for example, my.example.com) in [Values]. A host name is case \
         insensitive, can be up to 128 characters in length, and can contain any of the following \
         characters.\n\
        \ \n\
        \  {ul\n\
        \        {-  A-Z, a-z, 0-9\n\
        \            \n\
        \             }\n\
        \        {-  - .\n\
        \            \n\
        \             }\n\
        \        {-  * (matches 0 or more characters)\n\
        \            \n\
        \             }\n\
        \        {-  ? (matches exactly 1 character)\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If [Field] is [path-pattern] and you are not using [PathPatternConfig], you can \
         specify a single path pattern (for example, /img/*) in [Values]. A path pattern is \
         case-sensitive, can be up to 128 characters in length, and can contain any of the \
         following characters.\n\
        \   \n\
        \    {ul\n\
        \          {-  A-Z, a-z, 0-9\n\
        \              \n\
        \               }\n\
        \          {-  _ - . $ / ~ \" ' \\@ : +\n\
        \              \n\
        \               }\n\
        \          {-  & (using &)\n\
        \              \n\
        \               }\n\
        \          {-  * (matches 0 or more characters)\n\
        \              \n\
        \               }\n\
        \          {-  ? (matches exactly 1 character)\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  field : condition_field_name option;
      [@ocaml.doc
        "The field in the HTTP request. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [http-header] \n\
        \           \n\
        \            }\n\
        \       {-   [http-request-method] \n\
        \           \n\
        \            }\n\
        \       {-   [host-header] \n\
        \           \n\
        \            }\n\
        \       {-   [path-pattern] \n\
        \           \n\
        \            }\n\
        \       {-   [query-string] \n\
        \           \n\
        \            }\n\
        \       {-   [source-ip] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Information about a condition for a rule.\n\n\
  \ Each rule can optionally include up to one of each of the following conditions: \
   [http-request-method], [host-header], [path-pattern], and [source-ip]. Each rule can also \
   optionally include one or more of each of the following conditions: [http-header] and \
   [query-string]. Note that the value for a condition can't be empty.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-limits.html}Quotas \
   for your Application Load Balancers}.\n\
  \  "]

type nonrec rule_condition_list = rule_condition list [@@ocaml.doc ""]

type nonrec action_type_enum =
  | JWT_VALIDATION [@ocaml.doc ""]
  | FIXED_RESPONSE [@ocaml.doc ""]
  | REDIRECT [@ocaml.doc ""]
  | AUTHENTICATE_COGNITO [@ocaml.doc ""]
  | AUTHENTICATE_OIDC [@ocaml.doc ""]
  | FORWARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authenticate_oidc_action_issuer = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_authorization_endpoint = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_token_endpoint = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_user_info_endpoint = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_client_id = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_client_secret = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_session_cookie_name = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_scope = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_session_timeout = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_authentication_request_param_value = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_authentication_request_param_name = string [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_authentication_request_extra_params =
  (authenticate_oidc_action_authentication_request_param_name
  * authenticate_oidc_action_authentication_request_param_value)
  list
[@@ocaml.doc ""]

type nonrec authenticate_oidc_action_conditional_behavior_enum =
  | AUTHENTICATE [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""]
  | DENY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authenticate_oidc_action_use_existing_client_secret = bool [@@ocaml.doc ""]

type nonrec authenticate_oidc_action_config = {
  use_existing_client_secret : authenticate_oidc_action_use_existing_client_secret option;
      [@ocaml.doc
        "Indicates whether to use the existing client secret when modifying a rule. If you are \
         creating a rule, you can omit this parameter or set it to false.\n"]
  on_unauthenticated_request : authenticate_oidc_action_conditional_behavior_enum option;
      [@ocaml.doc
        "The behavior if the user is not authenticated. The following are possible values:\n\n\
        \ {ul\n\
        \       {-  deny - Return an HTTP 401 Unauthorized error.\n\
        \           \n\
        \            }\n\
        \       {-  allow - Allow the request to be forwarded to the target.\n\
        \           \n\
        \            }\n\
        \       {-  authenticate - Redirect the request to the IdP authorization endpoint. This is \
         the default value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  authentication_request_extra_params :
    authenticate_oidc_action_authentication_request_extra_params option;
      [@ocaml.doc
        "The query parameters (up to 10) to include in the redirect request to the authorization \
         endpoint.\n"]
  session_timeout : authenticate_oidc_action_session_timeout option;
      [@ocaml.doc
        "The maximum duration of the authentication session, in seconds. The default is 604800 \
         seconds (7 days).\n"]
  scope : authenticate_oidc_action_scope option;
      [@ocaml.doc
        "The set of user claims to be requested from the IdP. The default is [openid].\n\n\
        \ To verify which scope values your IdP supports and how to separate multiple values, see \
         the documentation for your IdP.\n\
        \ "]
  session_cookie_name : authenticate_oidc_action_session_cookie_name option;
      [@ocaml.doc
        "The name of the cookie used to maintain session information. The default is \
         AWSELBAuthSessionCookie.\n"]
  client_secret : authenticate_oidc_action_client_secret option;
      [@ocaml.doc
        "The OAuth 2.0 client secret. This parameter is required if you are creating a rule. If \
         you are modifying a rule, you can omit this parameter if you set \
         [UseExistingClientSecret] to true.\n"]
  client_id : authenticate_oidc_action_client_id; [@ocaml.doc "The OAuth 2.0 client identifier.\n"]
  user_info_endpoint : authenticate_oidc_action_user_info_endpoint;
      [@ocaml.doc
        "The user info endpoint of the IdP. This must be a full URL, including the HTTPS protocol, \
         the domain, and the path.\n"]
  token_endpoint : authenticate_oidc_action_token_endpoint;
      [@ocaml.doc
        "The token endpoint of the IdP. This must be a full URL, including the HTTPS protocol, the \
         domain, and the path.\n"]
  authorization_endpoint : authenticate_oidc_action_authorization_endpoint;
      [@ocaml.doc
        "The authorization endpoint of the IdP. This must be a full URL, including the HTTPS \
         protocol, the domain, and the path.\n"]
  issuer : authenticate_oidc_action_issuer;
      [@ocaml.doc
        "The OIDC issuer identifier of the IdP. This must be a full URL, including the HTTPS \
         protocol, the domain, and the path.\n"]
}
[@@ocaml.doc
  "Request parameters when using an identity provider (IdP) that is compliant with OpenID Connect \
   (OIDC) to authenticate users.\n"]

type nonrec authenticate_cognito_action_user_pool_arn = string [@@ocaml.doc ""]

type nonrec authenticate_cognito_action_user_pool_client_id = string [@@ocaml.doc ""]

type nonrec authenticate_cognito_action_user_pool_domain = string [@@ocaml.doc ""]

type nonrec authenticate_cognito_action_session_cookie_name = string [@@ocaml.doc ""]

type nonrec authenticate_cognito_action_scope = string [@@ocaml.doc ""]

type nonrec authenticate_cognito_action_session_timeout = Smaws_Lib.CoreTypes.Int64.t
[@@ocaml.doc ""]

type nonrec authenticate_cognito_action_authentication_request_param_value = string [@@ocaml.doc ""]

type nonrec authenticate_cognito_action_authentication_request_param_name = string [@@ocaml.doc ""]

type nonrec authenticate_cognito_action_authentication_request_extra_params =
  (authenticate_cognito_action_authentication_request_param_name
  * authenticate_cognito_action_authentication_request_param_value)
  list
[@@ocaml.doc ""]

type nonrec authenticate_cognito_action_conditional_behavior_enum =
  | AUTHENTICATE [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""]
  | DENY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec authenticate_cognito_action_config = {
  on_unauthenticated_request : authenticate_cognito_action_conditional_behavior_enum option;
      [@ocaml.doc
        "The behavior if the user is not authenticated. The following are possible values:\n\n\
        \ {ul\n\
        \       {-  deny - Return an HTTP 401 Unauthorized error.\n\
        \           \n\
        \            }\n\
        \       {-  allow - Allow the request to be forwarded to the target.\n\
        \           \n\
        \            }\n\
        \       {-  authenticate - Redirect the request to the IdP authorization endpoint. This is \
         the default value.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  authentication_request_extra_params :
    authenticate_cognito_action_authentication_request_extra_params option;
      [@ocaml.doc
        "The query parameters (up to 10) to include in the redirect request to the authorization \
         endpoint.\n"]
  session_timeout : authenticate_cognito_action_session_timeout option;
      [@ocaml.doc
        "The maximum duration of the authentication session, in seconds. The default is 604800 \
         seconds (7 days).\n"]
  scope : authenticate_cognito_action_scope option;
      [@ocaml.doc
        "The set of user claims to be requested from the IdP. The default is [openid].\n\n\
        \ To verify which scope values your IdP supports and how to separate multiple values, see \
         the documentation for your IdP.\n\
        \ "]
  session_cookie_name : authenticate_cognito_action_session_cookie_name option;
      [@ocaml.doc
        "The name of the cookie used to maintain session information. The default is \
         AWSELBAuthSessionCookie.\n"]
  user_pool_domain : authenticate_cognito_action_user_pool_domain;
      [@ocaml.doc
        "The domain prefix or fully-qualified domain name of the Amazon Cognito user pool.\n"]
  user_pool_client_id : authenticate_cognito_action_user_pool_client_id;
      [@ocaml.doc "The ID of the Amazon Cognito user pool client.\n"]
  user_pool_arn : authenticate_cognito_action_user_pool_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon Cognito user pool.\n"]
}
[@@ocaml.doc
  "Request parameters to use when integrating with Amazon Cognito to authenticate users.\n"]

type nonrec action_order = int [@@ocaml.doc ""]

type nonrec redirect_action_protocol = string [@@ocaml.doc ""]

type nonrec redirect_action_port = string [@@ocaml.doc ""]

type nonrec redirect_action_host = string [@@ocaml.doc ""]

type nonrec redirect_action_path = string [@@ocaml.doc ""]

type nonrec redirect_action_query = string [@@ocaml.doc ""]

type nonrec redirect_action_status_code_enum = HTTP_302 [@ocaml.doc ""] | HTTP_301 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec redirect_action_config = {
  status_code : redirect_action_status_code_enum;
      [@ocaml.doc
        "The HTTP redirect code. The redirect is either permanent (HTTP 301) or temporary (HTTP \
         302).\n"]
  query : redirect_action_query option;
      [@ocaml.doc
        "The query parameters, URL-encoded when necessary, but not percent-encoded. Do not include \
         the leading \"?\", as it is automatically added. You can specify any of the reserved \
         keywords.\n"]
  path : redirect_action_path option;
      [@ocaml.doc
        "The absolute path, starting with the leading \"/\". This component is not \
         percent-encoded. The path can contain #\\{host\\}, #\\{path\\}, and #\\{port\\}.\n"]
  host : redirect_action_host option;
      [@ocaml.doc
        "The hostname. This component is not percent-encoded. The hostname can contain #\\{host\\}.\n"]
  port : redirect_action_port option;
      [@ocaml.doc "The port. You can specify a value from 1 to 65535 or #\\{port\\}.\n"]
  protocol : redirect_action_protocol option;
      [@ocaml.doc
        "The protocol. You can specify HTTP, HTTPS, or #\\{protocol\\}. You can redirect HTTP to \
         HTTP, HTTP to HTTPS, and HTTPS to HTTPS. You can't redirect HTTPS to HTTP.\n"]
}
[@@ocaml.doc
  "Information about a redirect action.\n\n\
  \ A URI consists of the following components: protocol://hostname:port/path?query. You must \
   modify at least one of the following components to avoid a redirect loop: protocol, hostname, \
   port, or path. Any components that you do not modify retain their original values.\n\
  \ \n\
  \  You can reuse URI components using the following reserved keywords:\n\
  \  \n\
  \   {ul\n\
  \         {-  #\\{protocol\\}\n\
  \             \n\
  \              }\n\
  \         {-  #\\{host\\}\n\
  \             \n\
  \              }\n\
  \         {-  #\\{port\\}\n\
  \             \n\
  \              }\n\
  \         {-  #\\{path\\} (the leading \"/\" is removed)\n\
  \             \n\
  \              }\n\
  \         {-  #\\{query\\}\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For example, you can change the path to \"/new/#\\{path\\}\", the hostname to \
   \"example.#\\{host\\}\", or the query to \"#\\{query\\}&value=xyz\".\n\
  \   "]

type nonrec fixed_response_action_message = string [@@ocaml.doc ""]

type nonrec fixed_response_action_status_code = string [@@ocaml.doc ""]

type nonrec fixed_response_action_content_type = string [@@ocaml.doc ""]

type nonrec fixed_response_action_config = {
  content_type : fixed_response_action_content_type option;
      [@ocaml.doc
        "The content type.\n\n\
        \ Valid Values: text/plain | text/css | text/html | application/javascript | \
         application/json\n\
        \ "]
  status_code : fixed_response_action_status_code;
      [@ocaml.doc "The HTTP response code (2XX, 4XX, or 5XX).\n"]
  message_body : fixed_response_action_message option; [@ocaml.doc "The message.\n"]
}
[@@ocaml.doc "Information about an action that returns a custom HTTP response.\n"]

type nonrec forward_action_config = {
  target_group_stickiness_config : target_group_stickiness_config option;
      [@ocaml.doc "The target group stickiness for the rule.\n"]
  target_groups : target_group_list option; [@ocaml.doc "The target groups.\n"]
}
[@@ocaml.doc "Information about a forward action.\n"]

type nonrec jwt_validation_action_jwks_endpoint = string [@@ocaml.doc ""]

type nonrec jwt_validation_action_issuer = string [@@ocaml.doc ""]

type nonrec jwt_validation_action_additional_claim_format_enum =
  | SPACE_SEPARATED_VALUES [@ocaml.doc ""]
  | STRING_ARRAY [@ocaml.doc ""]
  | SINGLE_STRING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec jwt_validation_action_additional_claim_name = string [@@ocaml.doc ""]

type nonrec jwt_validation_action_additional_claim_value = string [@@ocaml.doc ""]

type nonrec jwt_validation_action_additional_claim_values =
  jwt_validation_action_additional_claim_value list
[@@ocaml.doc ""]

type nonrec jwt_validation_action_additional_claim = {
  values : jwt_validation_action_additional_claim_values;
      [@ocaml.doc
        "The claim value. The maximum size of the list is 10. Each value can be up to 256 \
         characters in length. If the format is [space-separated-values], the values can't include \
         spaces.\n"]
  name : jwt_validation_action_additional_claim_name;
      [@ocaml.doc
        "The name of the claim. You can't specify [exp], [iss], [nbf], or [iat] because we \
         validate them by default.\n"]
  format : jwt_validation_action_additional_claim_format_enum;
      [@ocaml.doc "The format of the claim value.\n"]
}
[@@ocaml.doc "Information about an additional claim to validate.\n"]

type nonrec jwt_validation_action_additional_claims = jwt_validation_action_additional_claim list
[@@ocaml.doc ""]

type nonrec jwt_validation_action_config = {
  additional_claims : jwt_validation_action_additional_claims option;
      [@ocaml.doc
        "Additional claims to validate. The maximum size of the list is 10. We validate the [exp], \
         [iss], [nbf], and [iat] claims by default.\n"]
  issuer : jwt_validation_action_issuer;
      [@ocaml.doc "The issuer of the JWT. The maximum length is 256 characters.\n"]
  jwks_endpoint : jwt_validation_action_jwks_endpoint;
      [@ocaml.doc
        "The JSON Web Key Set (JWKS) endpoint. This endpoint contains JSON Web Keys (JWK) that are \
         used to validate signatures from the provider.\n\n\
        \ This must be a full URL, including the HTTPS protocol, the domain, and the path. The \
         maximum length is 256 characters.\n\
        \ "]
}
[@@ocaml.doc "Information about a JSON Web Token (JWT) validation action.\n"]

type nonrec action = {
  jwt_validation_config : jwt_validation_action_config option;
      [@ocaml.doc
        "\\[HTTPS listeners\\] Information for validating JWT access tokens in client requests. \
         Specify only when [Type] is [jwt-validation].\n"]
  forward_config : forward_action_config option;
      [@ocaml.doc
        "Information for creating an action that distributes requests among multiple target \
         groups. Specify only when [Type] is [forward].\n\n\
        \ If you specify both [ForwardConfig] and [TargetGroupArn], you can specify only one \
         target group using [ForwardConfig] and it must be the same target group specified in \
         [TargetGroupArn].\n\
        \ "]
  fixed_response_config : fixed_response_action_config option;
      [@ocaml.doc
        "\\[Application Load Balancer\\] Information for creating an action that returns a custom \
         HTTP response. Specify only when [Type] is [fixed-response].\n"]
  redirect_config : redirect_action_config option;
      [@ocaml.doc
        "\\[Application Load Balancer\\] Information for creating a redirect action. Specify only \
         when [Type] is [redirect].\n"]
  order : action_order option;
      [@ocaml.doc
        "The order for the action. This value is required for rules with multiple actions. The \
         action with the lowest value for order is performed first.\n"]
  authenticate_cognito_config : authenticate_cognito_action_config option;
      [@ocaml.doc
        "\\[HTTPS listeners\\] Information for using Amazon Cognito to authenticate users. Specify \
         only when [Type] is [authenticate-cognito].\n"]
  authenticate_oidc_config : authenticate_oidc_action_config option;
      [@ocaml.doc
        "\\[HTTPS listeners\\] Information about an identity provider that is compliant with \
         OpenID Connect (OIDC). Specify only when [Type] is [authenticate-oidc].\n"]
  target_group_arn : target_group_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the target group. Specify only when [Type] is [forward] \
         and you want to route to a single target group. To route to multiple target groups, you \
         must use [ForwardConfig] instead.\n"]
  type_ : action_type_enum; [@ocaml.doc "The type of action.\n"]
}
[@@ocaml.doc
  "Information about an action.\n\n\
  \ Each rule must include exactly one of the following routing actions: [forward], \
   [fixed-response], or [redirect], and it must be the last action to be performed.\n\
  \ \n\
  \  Optionally, a rule for an HTTPS listener can also include one of the following user \
   authentication actions: [authenticate-oidc], [authenticate-cognito], or [jwt-validation].\n\
  \  "]

type nonrec actions = action list [@@ocaml.doc ""]

type nonrec is_default = bool [@@ocaml.doc ""]

type nonrec host_header_rewrite_config = {
  rewrites : rewrite_config_list option;
      [@ocaml.doc
        "The host header rewrite transform. Each transform consists of a regular expression to \
         match and a replacement string.\n"]
}
[@@ocaml.doc
  "Information about a host header rewrite transform. This transform matches a pattern in the host \
   header in an HTTP request and replaces it with the specified string.\n"]

type nonrec rule_transform = {
  url_rewrite_config : url_rewrite_config option;
      [@ocaml.doc
        "Information about a URL rewrite transform. This transform modifies the request URL. \
         Specify only when [Type] is [url-rewrite].\n"]
  host_header_rewrite_config : host_header_rewrite_config option;
      [@ocaml.doc
        "Information about a host header rewrite transform. This transform modifies the host \
         header in an HTTP request. Specify only when [Type] is [host-header-rewrite].\n"]
  type_ : transform_type_enum;
      [@ocaml.doc
        "The type of transform. \n\n\
        \ {ul\n\
        \       {-   [host-header-rewrite] - Rewrite the host header.\n\
        \           \n\
        \            }\n\
        \       {-   [url-rewrite] - Rewrite the request URL.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Information about a transform to apply to requests that match a rule. Transforms are applied to \
   requests before they are sent to targets.\n"]

type nonrec rule_transform_list = rule_transform list [@@ocaml.doc ""]

type nonrec rule = {
  transforms : rule_transform_list option; [@ocaml.doc "The transforms for the rule.\n"]
  is_default : is_default option; [@ocaml.doc "Indicates whether this is the default rule.\n"]
  actions : actions option;
      [@ocaml.doc
        "The actions. Each rule must include exactly one of the following types of actions: \
         [forward], [redirect], or [fixed-response], and it must be the last action to be \
         performed.\n"]
  conditions : rule_condition_list option;
      [@ocaml.doc
        "The conditions. Each rule can include zero or one of the following conditions: \
         [http-request-method], [host-header], [path-pattern], and [source-ip], and zero or more \
         of the following conditions: [http-header] and [query-string].\n"]
  priority : string_ option; [@ocaml.doc "The priority.\n"]
  rule_arn : rule_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]
}
[@@ocaml.doc "Information about a rule.\n"]

type nonrec rules = rule list [@@ocaml.doc ""]

type nonrec set_rule_priorities_output = {
  rules : rules option; [@ocaml.doc "Information about the rules.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_priority = int [@@ocaml.doc ""]

type nonrec rule_priority_pair = {
  priority : rule_priority option; [@ocaml.doc "The rule priority.\n"]
  rule_arn : rule_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]
}
[@@ocaml.doc "Information about the priorities for the rules for a listener.\n"]

type nonrec rule_priority_list = rule_priority_pair list [@@ocaml.doc ""]

type nonrec set_rule_priorities_input = {
  rule_priorities : rule_priority_list; [@ocaml.doc "The rule priorities.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified rule does not exist.\n"]

type nonrec priority_in_use_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified priority is in use.\n"]

type nonrec operation_not_permitted_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "This operation is not allowed.\n"]

type nonrec set_ip_address_type_output = {
  ip_address_type : ip_address_type option; [@ocaml.doc "The IP address type.\n"]
}
[@@ocaml.doc ""]

type nonrec set_ip_address_type_input = {
  ip_address_type : ip_address_type;
      [@ocaml.doc
        "The IP address type. Internal load balancers must use [ipv4].\n\n\
        \ \\[Application Load Balancers\\] The possible values are [ipv4] (IPv4 addresses), \
         [dualstack] (IPv4 and IPv6 addresses), and [dualstack-without-public-ipv4] (public IPv6 \
         addresses and private IPv4 and IPv6 addresses).\n\
        \ \n\
        \  Application Load Balancer authentication supports IPv4 addresses only when connecting \
         to an Identity Provider (IdP) or Amazon Cognito endpoint. Without a public IPv4 address \
         the load balancer can't complete the authentication process, resulting in HTTP 500 errors.\n\
        \  \n\
        \   \\[Network Load Balancers and Gateway Load Balancers\\] The possible values are [ipv4] \
         (IPv4 addresses) and [dualstack] (IPv4 and IPv6 addresses).\n\
        \   "]
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec ssl_policy_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified SSL policy does not exist.\n"]

type nonrec s3_object_version = string [@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec rule_arns = rule_arn list [@@ocaml.doc ""]

type nonrec revocation_ids = revocation_id list [@@ocaml.doc ""]

type nonrec revocation_id_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified revocation ID does not exist.\n"]

type nonrec revocation_content = {
  revocation_type : revocation_type option; [@ocaml.doc "The type of revocation file.\n"]
  s3_object_version : s3_object_version option;
      [@ocaml.doc "The Amazon S3 object version of the revocation file.\n"]
  s3_key : s3_key option; [@ocaml.doc "The Amazon S3 path for the revocation file.\n"]
  s3_bucket : s3_bucket option; [@ocaml.doc "The Amazon S3 bucket for the revocation file.\n"]
}
[@@ocaml.doc "Information about a revocation file.\n"]

type nonrec revocation_contents = revocation_content list [@@ocaml.doc ""]

type nonrec revocation_content_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified revocation file does not exist.\n"]

type nonrec resource_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource does not exist.\n"]

type nonrec resource_in_use_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "A specified resource is in use.\n"]

type nonrec resource_arns = resource_arn list [@@ocaml.doc ""]

type nonrec reset_transforms = bool [@@ocaml.doc ""]

type nonrec reset_capacity_reservation = bool [@@ocaml.doc ""]

type nonrec remove_trust_store_revocations_output = unit [@@ocaml.doc ""]

type nonrec remove_trust_store_revocations_input = {
  revocation_ids : revocation_ids;
      [@ocaml.doc "The revocation IDs of the revocation files you want to remove.\n"]
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec remove_tags_output = unit [@@ocaml.doc ""]

type nonrec remove_tags_input = {
  tag_keys : tag_keys; [@ocaml.doc "The tag keys for the tags to remove.\n"]
  resource_arns : resource_arns; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec listener_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified listener does not exist.\n"]

type nonrec remove_listener_certificates_output = unit [@@ocaml.doc ""]

type nonrec listener_arn = string [@@ocaml.doc ""]

type nonrec certificate_arn = string [@@ocaml.doc ""]

type nonrec default = bool [@@ocaml.doc ""]

type nonrec certificate = {
  is_default : default option;
      [@ocaml.doc
        "Indicates whether the certificate is the default certificate. Do not set this value when \
         specifying a certificate as an input. This value is not included in the output when \
         describing a listener, but is included when describing listener certificates.\n"]
  certificate_arn : certificate_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate.\n"]
}
[@@ocaml.doc "Information about an SSL server certificate.\n"]

type nonrec certificate_list = certificate list [@@ocaml.doc ""]

type nonrec remove_listener_certificates_input = {
  certificates : certificate_list;
      [@ocaml.doc
        "The certificate to remove. You can specify one certificate per call. Set [CertificateArn] \
         to the certificate ARN but do not set [IsDefault].\n"]
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec remove_ipam_pool_enum = Ipv4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec remove_ipam_pools = remove_ipam_pool_enum list [@@ocaml.doc ""]

type nonrec register_targets_output = unit [@@ocaml.doc ""]

type nonrec register_targets_input = {
  targets : target_descriptions; [@ocaml.doc "The targets.\n"]
  target_group_arn : target_group_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_target_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified target does not exist, is not in the same VPC as the target group, or has an \
   unsupported instance type.\n"]

type nonrec prior_request_not_complete_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "This operation is not allowed while a prior request has not been completed.\n"]

type nonrec policy = string [@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec mode = string [@@ocaml.doc ""]

type nonrec ignore_client_certificate_expiry = bool [@@ocaml.doc ""]

type nonrec advertise_trust_store_ca_names_enum = Off [@ocaml.doc ""] | On [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mutual_authentication_attributes = {
  advertise_trust_store_ca_names : advertise_trust_store_ca_names_enum option;
      [@ocaml.doc "Indicates whether trust store CA certificate names are advertised.\n"]
  trust_store_association_status : trust_store_association_status_enum option;
      [@ocaml.doc "Indicates a shared trust stores association status.\n"]
  ignore_client_certificate_expiry : ignore_client_certificate_expiry option;
      [@ocaml.doc "Indicates whether expired client certificates are ignored.\n"]
  trust_store_arn : trust_store_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
  mode : mode option;
      [@ocaml.doc
        "The client certificate handling method. Options are [off], [passthrough] or [verify]. The \
         default value is [off].\n"]
}
[@@ocaml.doc "Information about the mutual authentication attributes of a listener.\n"]

type nonrec modify_trust_store_output = {
  trust_stores : trust_stores option; [@ocaml.doc "Information about the modified trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_trust_store_input = {
  ca_certificates_bundle_s3_object_version : s3_object_version option;
      [@ocaml.doc
        "The Amazon S3 object version for the ca certificates bundle. If undefined the current \
         version is used.\n"]
  ca_certificates_bundle_s3_key : s3_key;
      [@ocaml.doc "The Amazon S3 path for the ca certificates bundle.\n"]
  ca_certificates_bundle_s3_bucket : s3_bucket;
      [@ocaml.doc "The Amazon S3 bucket for the ca certificates bundle.\n"]
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_ca_certificates_bundle_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified ca certificate bundle is in an invalid format, or corrupt.\n"]

type nonrec ca_certificates_bundle_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified ca certificate bundle does not exist.\n"]

type nonrec modify_target_group_output = {
  target_groups : target_groups option; [@ocaml.doc "Information about the modified target group.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_target_group_input = {
  matcher : matcher option;
      [@ocaml.doc
        "\\[HTTP/HTTPS health checks\\] The HTTP or gRPC codes to use when checking for a \
         successful response from a target. For target groups with a protocol of TCP, TCP_UDP, UDP \
         or TLS the range is 200-599. For target groups with a protocol of HTTP or HTTPS, the \
         range is 200-499. For target groups with a protocol of GENEVE, the range is 200-399.\n"]
  unhealthy_threshold_count : health_check_threshold_count option;
      [@ocaml.doc
        "The number of consecutive health check failures required before considering the target \
         unhealthy.\n"]
  healthy_threshold_count : health_check_threshold_count option;
      [@ocaml.doc
        "The number of consecutive health checks successes required before considering an \
         unhealthy target healthy.\n"]
  health_check_timeout_seconds : health_check_timeout_seconds option;
      [@ocaml.doc
        "\\[HTTP/HTTPS health checks\\] The amount of time, in seconds, during which no response \
         means a failed health check.\n"]
  health_check_interval_seconds : health_check_interval_seconds option;
      [@ocaml.doc
        "The approximate amount of time, in seconds, between health checks of an individual target.\n"]
  health_check_enabled : health_check_enabled option;
      [@ocaml.doc
        "Indicates whether health checks are enabled. If the target type is [lambda], health \
         checks are disabled by default but can be enabled. If the target type is [instance], \
         [ip], or [alb], health checks are always enabled and can't be disabled.\n"]
  health_check_path : path option;
      [@ocaml.doc
        "\\[HTTP/HTTPS health checks\\] The destination for health checks on the targets.\n\n\
        \ \\[HTTP1 or HTTP2 protocol version\\] The ping path. The default is /.\n\
        \ \n\
        \  \\[GRPC protocol version\\] The path of a custom health check method with the format \
         /package.service/method. The default is /Amazon Web Services.ALB/healthcheck.\n\
        \  "]
  health_check_port : health_check_port option;
      [@ocaml.doc "The port the load balancer uses when performing health checks on targets.\n"]
  health_check_protocol : protocol_enum option;
      [@ocaml.doc
        "The protocol the load balancer uses when performing health checks on targets. For \
         Application Load Balancers, the default is HTTP. For Network Load Balancers and Gateway \
         Load Balancers, the default is TCP. The TCP protocol is not supported for health checks \
         if the protocol of the target group is HTTP or HTTPS. It is supported for health checks \
         only if the protocol of the target group is TCP, TLS, UDP, or TCP_UDP. The GENEVE, TLS, \
         UDP, TCP_UDP, QUIC, and TCP_QUIC protocols are not supported for health checks.\n"]
  target_group_arn : target_group_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_target_group_attributes_output = {
  attributes : target_group_attributes option;
      [@ocaml.doc "Information about the target group attributes.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_target_group_attributes_input = {
  attributes : target_group_attributes; [@ocaml.doc "The target group attributes.\n"]
  target_group_arn : target_group_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_rule_output = {
  rules : rules option; [@ocaml.doc "Information about the modified rule.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_rule_input = {
  reset_transforms : reset_transforms option;
      [@ocaml.doc
        "Indicates whether to remove all transforms from the rule. If you specify \
         [ResetTransforms], you can't specify [Transforms].\n"]
  transforms : rule_transform_list option;
      [@ocaml.doc
        "The transforms to apply to requests that match this rule. You can add one host header \
         rewrite transform and one URL rewrite transform. If you specify [Transforms], you can't \
         specify [ResetTransforms].\n"]
  actions : actions option; [@ocaml.doc "The actions.\n"]
  conditions : rule_condition_list option; [@ocaml.doc "The conditions.\n"]
  rule_arn : rule_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_load_balancer_action_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested action is not valid.\n"]

type nonrec incompatible_protocols_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified configuration is not valid with this protocol.\n"]

type nonrec load_balancer_attribute_key = string [@@ocaml.doc ""]

type nonrec load_balancer_attribute_value = string [@@ocaml.doc ""]

type nonrec load_balancer_attribute = {
  value : load_balancer_attribute_value option; [@ocaml.doc "The value of the attribute.\n"]
  key : load_balancer_attribute_key option;
      [@ocaml.doc
        "The name of the attribute.\n\n\
        \ The following attributes are supported by all load balancers:\n\
        \ \n\
        \  {ul\n\
        \        {-   [deletion_protection.enabled] - Indicates whether deletion protection is \
         enabled. The value is [true] or [false]. The default is [false].\n\
        \            \n\
        \             }\n\
        \        {-   [load_balancing.cross_zone.enabled] - Indicates whether cross-zone load \
         balancing is enabled. The possible values are [true] and [false]. The default for Network \
         Load Balancers and Gateway Load Balancers is [false]. The default for Application Load \
         Balancers is [true], and can't be changed.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following attributes are supported by both Application Load Balancers and Network \
         Load Balancers:\n\
        \   \n\
        \    {ul\n\
        \          {-   [access_logs.s3.enabled] - Indicates whether access logs are enabled. The \
         value is [true] or [false]. The default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [access_logs.s3.bucket] - The name of the S3 bucket for the access logs. \
         This attribute is required if access logs are enabled. The bucket must exist in the same \
         region as the load balancer and have a bucket policy that grants Elastic Load Balancing \
         permissions to write to the bucket.\n\
        \              \n\
        \               }\n\
        \          {-   [access_logs.s3.prefix] - The prefix for the location in the S3 bucket for \
         the access logs.\n\
        \              \n\
        \               }\n\
        \          {-   [ipv6.deny_all_igw_traffic] - Blocks internet gateway (IGW) access to the \
         load balancer. It is set to [false] for internet-facing load balancers and [true] for \
         internal load balancers, preventing unintended access to your internal load balancer \
         through an internet gateway.\n\
        \              \n\
        \               }\n\
        \          {-   [zonal_shift.config.enabled] - Indicates whether zonal shift is enabled. \
         The possible values are [true] and [false]. The default is [false].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following attributes are supported by only Application Load Balancers:\n\
        \   \n\
        \    {ul\n\
        \          {-   [idle_timeout.timeout_seconds] - The idle timeout value, in seconds. The \
         valid range is 1-4000 seconds. The default is 60 seconds.\n\
        \              \n\
        \               }\n\
        \          {-   [client_keep_alive.seconds] - The client keep alive value, in seconds. The \
         valid range is 60-604800 seconds. The default is 3600 seconds.\n\
        \              \n\
        \               }\n\
        \          {-   [connection_logs.s3.enabled] - Indicates whether connection logs are \
         enabled. The value is [true] or [false]. The default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [connection_logs.s3.bucket] - The name of the S3 bucket for the connection \
         logs. This attribute is required if connection logs are enabled. The bucket must exist in \
         the same region as the load balancer and have a bucket policy that grants Elastic Load \
         Balancing permissions to write to the bucket.\n\
        \              \n\
        \               }\n\
        \          {-   [connection_logs.s3.prefix] - The prefix for the location in the S3 bucket \
         for the connection logs.\n\
        \              \n\
        \               }\n\
        \          {-   [health_check_logs.s3.enabled] - Indicates whether health check logs are \
         enabled. The value is [true] or [false]. The default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [health_check_logs.s3.bucket] - The name of the S3 bucket for the health \
         check logs. This attribute is required if health check logs are enabled. The bucket must \
         exist in the same region as the load balancer and have a bucket policy that grants \
         Elastic Load Balancing permissions to write to the bucket.\n\
        \              \n\
        \               }\n\
        \          {-   [health_check_logs.s3.prefix] - The prefix for the location in the S3 \
         bucket for the health check logs.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.desync_mitigation_mode] - Determines how the load balancer \
         handles requests that might pose a security risk to your application. The possible values \
         are [monitor], [defensive], and [strictest]. The default is [defensive].\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.drop_invalid_header_fields.enabled] - Indicates whether HTTP \
         headers with invalid header fields are removed by the load balancer ([true]) or routed to \
         targets ([false]). The default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.preserve_host_header.enabled] - Indicates whether the \
         Application Load Balancer should preserve the [Host] header in the HTTP request and send \
         it to the target without any change. The possible values are [true] and [false]. The \
         default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.x_amzn_tls_version_and_cipher_suite.enabled] - Indicates \
         whether the two headers ([x-amzn-tls-version] and [x-amzn-tls-cipher-suite]), which \
         contain information about the negotiated TLS version and cipher suite, are added to the \
         client request before sending it to the target. The [x-amzn-tls-version] header has \
         information about the TLS protocol version negotiated with the client, and the \
         [x-amzn-tls-cipher-suite] header has information about the cipher suite negotiated with \
         the client. Both headers are in OpenSSL format. The possible values for the attribute are \
         [true] and [false]. The default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.xff_client_port.enabled] - Indicates whether the \
         [X-Forwarded-For] header should preserve the source port that the client used to connect \
         to the load balancer. The possible values are [true] and [false]. The default is [false].\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.xff_header_processing.mode] - Enables you to modify, \
         preserve, or remove the [X-Forwarded-For] header in the HTTP request before the \
         Application Load Balancer sends the request to the target. The possible values are \
         [append], [preserve], and [remove]. The default is [append].\n\
        \              \n\
        \               {ul\n\
        \                     {-  If the value is [append], the Application Load Balancer adds the \
         client IP address (of the last hop) to the [X-Forwarded-For] header in the HTTP request \
         before it sends it to targets.\n\
        \                         \n\
        \                          }\n\
        \                     {-  If the value is [preserve] the Application Load Balancer \
         preserves the [X-Forwarded-For] header in the HTTP request, and sends it to targets \
         without any change.\n\
        \                         \n\
        \                          }\n\
        \                     {-  If the value is [remove], the Application Load Balancer removes \
         the [X-Forwarded-For] header in the HTTP request before it sends it to targets.\n\
        \                         \n\
        \                          }\n\
        \                     \n\
        \           }\n\
        \            }\n\
        \          {-   [routing.http2.enabled] - Indicates whether clients can connect to the \
         load balancer using HTTP/2. If [true], clients can connect using HTTP/2 or HTTP/1.1. \
         However, all client requests are subject to the stricter HTTP/2 header validation rules. \
         For example, message header names must contain only alphanumeric characters and hyphens. \
         If [false], clients must connect using HTTP/1.1. The default is [true].\n\
        \              \n\
        \               }\n\
        \          {-   [waf.fail_open.enabled] - Indicates whether to allow a WAF-enabled load \
         balancer to route requests to targets if it is unable to forward the request to Amazon \
         Web Services WAF. The possible values are [true] and [false]. The default is [false].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The following attributes are supported by only Network Load Balancers:\n\
        \   \n\
        \    {ul\n\
        \          {-   [dns_record.client_routing_policy] - Indicates how traffic is distributed \
         among the load balancer Availability Zones. The possible values are \
         [availability_zone_affinity] with 100 percent zonal affinity, \
         [partial_availability_zone_affinity] with 85 percent zonal affinity, and \
         [any_availability_zone] with 0 percent zonal affinity.\n\
        \              \n\
        \               }\n\
        \          {-   [secondary_ips.auto_assigned.per_subnet] - The number of secondary IP \
         addresses to configure for your load balancer nodes. Use to address port allocation \
         errors if you can't add targets. The valid range is 0 to 7. The default is 0. After you \
         set this value, you can't decrease it.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "Information about a load balancer attribute.\n"]

type nonrec load_balancer_attributes = load_balancer_attribute list [@@ocaml.doc ""]

type nonrec modify_load_balancer_attributes_output = {
  attributes : load_balancer_attributes option;
      [@ocaml.doc "Information about the load balancer attributes.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_load_balancer_attributes_input = {
  attributes : load_balancer_attributes; [@ocaml.doc "The load balancer attributes.\n"]
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec alpn_policy_value = string [@@ocaml.doc ""]

type nonrec alpn_policy_name = alpn_policy_value list [@@ocaml.doc ""]

type nonrec listener = {
  mutual_authentication : mutual_authentication_attributes option;
      [@ocaml.doc "The mutual authentication configuration information.\n"]
  alpn_policy : alpn_policy_name option;
      [@ocaml.doc
        "\\[TLS listener\\] The name of the Application-Layer Protocol Negotiation (ALPN) policy.\n"]
  default_actions : actions option; [@ocaml.doc "The default actions for the listener.\n"]
  ssl_policy : ssl_policy_name option;
      [@ocaml.doc
        "\\[HTTPS or TLS listener\\] The security policy that defines which protocols and ciphers \
         are supported.\n"]
  certificates : certificate_list option;
      [@ocaml.doc "\\[HTTPS or TLS listener\\] The default certificate for the listener.\n"]
  protocol : protocol_enum option;
      [@ocaml.doc "The protocol for connections from clients to the load balancer.\n"]
  port : port option; [@ocaml.doc "The port on which the load balancer is listening.\n"]
  load_balancer_arn : load_balancer_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
  listener_arn : listener_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc "Information about a listener.\n"]

type nonrec listeners = listener list [@@ocaml.doc ""]

type nonrec modify_listener_output = {
  listeners : listeners option; [@ocaml.doc "Information about the modified listener.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_listener_input = {
  mutual_authentication : mutual_authentication_attributes option;
      [@ocaml.doc "\\[HTTPS listeners\\] The mutual authentication configuration information.\n"]
  alpn_policy : alpn_policy_name option;
      [@ocaml.doc
        "\\[TLS listeners\\] The name of the Application-Layer Protocol Negotiation (ALPN) policy. \
         You can specify one policy name. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [HTTP1Only] \n\
        \           \n\
        \            }\n\
        \       {-   [HTTP2Only] \n\
        \           \n\
        \            }\n\
        \       {-   [HTTP2Optional] \n\
        \           \n\
        \            }\n\
        \       {-   [HTTP2Preferred] \n\
        \           \n\
        \            }\n\
        \       {-   [None] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html#alpn-policies}ALPN \
         policies} in the {i Network Load Balancers Guide}.\n\
        \   "]
  default_actions : actions option; [@ocaml.doc "The actions for the default rule.\n"]
  certificates : certificate_list option;
      [@ocaml.doc
        "\\[HTTPS and TLS listeners\\] The default certificate for the listener. You must provide \
         exactly one certificate. Set [CertificateArn] to the certificate ARN but do not set \
         [IsDefault].\n"]
  ssl_policy : ssl_policy_name option;
      [@ocaml.doc
        "\\[HTTPS and TLS listeners\\] The security policy that defines which protocols and \
         ciphers are supported.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/describe-ssl-policies.html}Security \
         policies} in the {i Application Load Balancers Guide} or \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/describe-ssl-policies.html}Security \
         policies} in the {i Network Load Balancers Guide}.\n\
        \ "]
  protocol : protocol_enum option;
      [@ocaml.doc
        "The protocol for connections from clients to the load balancer. Application Load \
         Balancers support the HTTP and HTTPS protocols. Network Load Balancers support the TCP, \
         TLS, UDP, TCP_UDP, QUIC, and TCP_QUIC protocols. You can\226\128\153t change the protocol \
         to UDP, TCP_UDP, QUIC, or TCP_QUIC if dual-stack mode is enabled. You can't specify a \
         protocol for a Gateway Load Balancer.\n"]
  port : port option;
      [@ocaml.doc
        "The port for connections from clients to the load balancer. You can't specify a port for \
         a Gateway Load Balancer.\n"]
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec listener_attribute_key = string [@@ocaml.doc ""]

type nonrec listener_attribute_value = string [@@ocaml.doc ""]

type nonrec listener_attribute = {
  value : listener_attribute_value option; [@ocaml.doc "The value of the attribute.\n"]
  key : listener_attribute_key option;
      [@ocaml.doc
        "The name of the attribute.\n\n\
        \ The following attribute is supported by Network Load Balancers, and Gateway Load \
         Balancers.\n\
        \ \n\
        \  {ul\n\
        \        {-   [tcp.idle_timeout.seconds] - The tcp idle timeout value, in seconds. The \
         valid range is 60-6000 seconds. The default is 350 seconds.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The following attributes are only supported by Application Load Balancers.\n\
        \   \n\
        \    {ul\n\
        \          {-   [routing.http.request.x_amzn_mtls_clientcert_serial_number.header_name] - \
         Enables you to modify the header name of the {b X-Amzn-Mtls-Clientcert-Serial-Number} \
         HTTP request header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.request.x_amzn_mtls_clientcert_issuer.header_name] - Enables \
         you to modify the header name of the {b X-Amzn-Mtls-Clientcert-Issuer} HTTP request \
         header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.request.x_amzn_mtls_clientcert_subject.header_name] - \
         Enables you to modify the header name of the {b X-Amzn-Mtls-Clientcert-Subject} HTTP \
         request header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.request.x_amzn_mtls_clientcert_validity.header_name] - \
         Enables you to modify the header name of the {b X-Amzn-Mtls-Clientcert-Validity} HTTP \
         request header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.request.x_amzn_mtls_clientcert_leaf.header_name] - Enables \
         you to modify the header name of the {b X-Amzn-Mtls-Clientcert-Leaf} HTTP request header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.request.x_amzn_mtls_clientcert.header_name] - Enables you to \
         modify the header name of the {b X-Amzn-Mtls-Clientcert} HTTP request header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.request.x_amzn_tls_version.header_name] - Enables you to \
         modify the header name of the {b X-Amzn-Tls-Version} HTTP request header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.request.x_amzn_tls_cipher_suite.header_name] - Enables you \
         to modify the header name of the {b X-Amzn-Tls-Cipher-Suite} HTTP request header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.server.enabled] - Enables you to allow or remove \
         the HTTP response server header.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.strict_transport_security.header_value] - Informs \
         browsers that the site should only be accessed using HTTPS, and that any future attempts \
         to access it using HTTP should automatically be converted to HTTPS.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.access_control_allow_origin.header_value] - \
         Specifies which origins are allowed to access the server.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.access_control_allow_methods.header_value] - \
         Returns which HTTP methods are allowed when accessing the server from a different origin.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.access_control_allow_headers.header_value] - \
         Specifies which headers can be used during the request.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.access_control_allow_credentials.header_value] - \
         Indicates whether the browser should include credentials such as cookies or \
         authentication when making requests.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.access_control_expose_headers.header_value] - \
         Returns which headers the browser can expose to the requesting client.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.access_control_max_age.header_value] - Specifies \
         how long the results of a preflight request can be cached, in seconds.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.content_security_policy.header_value] - Specifies \
         restrictions enforced by the browser to help minimize the risk of certain types of \
         security threats.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.x_content_type_options.header_value] - Indicates \
         whether the MIME types advertised in the {b Content-Type} headers should be followed and \
         not be changed.\n\
        \              \n\
        \               }\n\
        \          {-   [routing.http.response.x_frame_options.header_value] - Indicates whether \
         the browser is allowed to render a page in a {b frame}, {b iframe}, {b embed} or {b \
         object}.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc "Information about a listener attribute.\n"]

type nonrec listener_attributes = listener_attribute list [@@ocaml.doc ""]

type nonrec modify_listener_attributes_output = {
  attributes : listener_attributes option;
      [@ocaml.doc "Information about the listener attributes.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_listener_attributes_input = {
  attributes : listener_attributes; [@ocaml.doc "The listener attributes.\n"]
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec duplicate_listener_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "A listener with the specified port already exists.\n"]

type nonrec certificate_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified certificate does not exist.\n"]

type nonrec alpn_policy_not_supported_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified ALPN policy is not supported.\n"]

type nonrec ipam_pool_id = string [@@ocaml.doc ""]

type nonrec ipam_pools = {
  ipv4_ipam_pool_id : ipam_pool_id option; [@ocaml.doc "The ID of the IPv4 IPAM pool.\n"]
}
[@@ocaml.doc
  "An IPAM pool is a collection of IP address CIDRs. IPAM pools enable you to organize your IP \
   addresses according to your routing and security needs.\n"]

type nonrec modify_ip_pools_output = {
  ipam_pools : ipam_pools option; [@ocaml.doc "The IPAM pool ID.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_ip_pools_input = {
  remove_ipam_pools : remove_ipam_pools option;
      [@ocaml.doc "Remove the IP pools in use by the load balancer.\n"]
  ipam_pools : ipam_pools option; [@ocaml.doc "The IPAM pools to be modified.\n"]
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec last_modified_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec decrease_requests_remaining = int [@@ocaml.doc ""]

type nonrec capacity_units = int [@@ocaml.doc ""]

type nonrec minimum_load_balancer_capacity = {
  capacity_units : capacity_units option; [@ocaml.doc "The number of capacity units.\n"]
}
[@@ocaml.doc "The minimum capacity for a load balancer.\n"]

type nonrec modify_capacity_reservation_output = {
  capacity_reservation_state : zonal_capacity_reservation_states option;
      [@ocaml.doc "The state of the capacity reservation.\n"]
  minimum_load_balancer_capacity : minimum_load_balancer_capacity option;
      [@ocaml.doc "The requested minimum capacity reservation for the load balancer\n"]
  decrease_requests_remaining : decrease_requests_remaining option;
      [@ocaml.doc "The amount of daily capacity decreases remaining.\n"]
  last_modified_time : last_modified_time option;
      [@ocaml.doc "The last time the capacity reservation was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_capacity_reservation_input = {
  reset_capacity_reservation : reset_capacity_reservation option;
      [@ocaml.doc "Resets the capacity reservation.\n"]
  minimum_load_balancer_capacity : minimum_load_balancer_capacity option;
      [@ocaml.doc "The minimum load balancer capacity reserved.\n"]
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec insufficient_capacity_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "There is insufficient capacity to reserve.\n"]

type nonrec capacity_units_limit_exceeded_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "You've exceeded the capacity units limit.\n"]

type nonrec capacity_decrease_requests_limit_exceeded_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "You've exceeded the daily capacity decrease limit for this reservation.\n"]

type nonrec max = string [@@ocaml.doc ""]

type nonrec marker = string [@@ocaml.doc ""]

type nonrec location = string [@@ocaml.doc ""]

type nonrec dns_name = string [@@ocaml.doc ""]

type nonrec canonical_hosted_zone_id = string [@@ocaml.doc ""]

type nonrec created_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec load_balancer_name = string [@@ocaml.doc ""]

type nonrec load_balancer_scheme_enum = INTERNAL [@ocaml.doc ""] | INTERNET_FACING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec load_balancer_state_enum =
  | FAILED [@ocaml.doc ""]
  | ACTIVE_IMPAIRED [@ocaml.doc ""]
  | PROVISIONING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec load_balancer_state = {
  reason : state_reason option; [@ocaml.doc "A description of the state.\n"]
  code : load_balancer_state_enum option;
      [@ocaml.doc
        "The state code. The initial state of the load balancer is [provisioning]. After the load \
         balancer is fully set up and ready to route traffic, its state is [active]. If load \
         balancer is routing traffic but does not have the resources it needs to scale, its state \
         is[active_impaired]. If the load balancer could not be set up, its state is [failed].\n"]
}
[@@ocaml.doc "Information about the state of the load balancer.\n"]

type nonrec load_balancer_type_enum =
  | GATEWAY [@ocaml.doc ""]
  | NETWORK [@ocaml.doc ""]
  | APPLICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec customer_owned_ipv4_pool = string [@@ocaml.doc ""]

type nonrec enforce_security_group_inbound_rules_on_private_link_traffic = string [@@ocaml.doc ""]

type nonrec load_balancer = {
  ipam_pools : ipam_pools option;
      [@ocaml.doc
        "\\[Application Load Balancers\\] The IPAM pool in use by the load balancer, if configured.\n"]
  enable_prefix_for_ipv6_source_nat : enable_prefix_for_ipv6_source_nat_enum option;
      [@ocaml.doc
        "\\[Network Load Balancers with UDP listeners\\] Indicates whether to use an IPv6 prefix \
         from each subnet for source NAT. The IP address type must be [dualstack]. The default \
         value is [off].\n"]
  enforce_security_group_inbound_rules_on_private_link_traffic :
    enforce_security_group_inbound_rules_on_private_link_traffic option;
      [@ocaml.doc
        "Indicates whether to evaluate inbound security group rules for traffic sent to a Network \
         Load Balancer through Amazon Web Services PrivateLink.\n"]
  customer_owned_ipv4_pool : customer_owned_ipv4_pool option;
      [@ocaml.doc
        "\\[Application Load Balancers on Outposts\\] The ID of the customer-owned address pool.\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The type of IP addresses used for public or private connections by the subnets attached \
         to your load balancer.\n\n\
        \ \\[Application Load Balancers\\] The possible values are [ipv4] (IPv4 addresses), \
         [dualstack] (IPv4 and IPv6 addresses), and [dualstack-without-public-ipv4] (public IPv6 \
         addresses and private IPv4 and IPv6 addresses).\n\
        \ \n\
        \  \\[Network Load Balancers and Gateway Load Balancers\\] The possible values are [ipv4] \
         (IPv4 addresses) and [dualstack] (IPv4 and IPv6 addresses).\n\
        \  "]
  security_groups : security_groups option;
      [@ocaml.doc "The IDs of the security groups for the load balancer.\n"]
  availability_zones : availability_zones option;
      [@ocaml.doc "The subnets for the load balancer.\n"]
  type_ : load_balancer_type_enum option; [@ocaml.doc "The type of load balancer.\n"]
  state : load_balancer_state option; [@ocaml.doc "The state of the load balancer.\n"]
  vpc_id : vpc_id option; [@ocaml.doc "The ID of the VPC for the load balancer.\n"]
  scheme : load_balancer_scheme_enum option;
      [@ocaml.doc
        "The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of \
         an Internet-facing load balancer is publicly resolvable to the public IP addresses of the \
         nodes. Therefore, Internet-facing load balancers can route requests from clients over the \
         internet.\n\n\
        \ The nodes of an internal load balancer have only private IP addresses. The DNS name of \
         an internal load balancer is publicly resolvable to the private IP addresses of the \
         nodes. Therefore, internal load balancers can route requests only from clients with \
         access to the VPC for the load balancer.\n\
        \ "]
  load_balancer_name : load_balancer_name option; [@ocaml.doc "The name of the load balancer.\n"]
  created_time : created_time option;
      [@ocaml.doc "The date and time the load balancer was created.\n"]
  canonical_hosted_zone_id : canonical_hosted_zone_id option;
      [@ocaml.doc "The ID of the Amazon Route 53 hosted zone associated with the load balancer.\n"]
  dns_name : dns_name option; [@ocaml.doc "The public DNS name of the load balancer.\n"]
  load_balancer_arn : load_balancer_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc "Information about a load balancer.\n"]

type nonrec load_balancers = load_balancer list [@@ocaml.doc ""]

type nonrec load_balancer_names = load_balancer_name list [@@ocaml.doc ""]

type nonrec listener_arns = listener_arn list [@@ocaml.doc ""]

type nonrec describe_target_health_input_include_enum =
  | ALL [@ocaml.doc ""]
  | ANOMALY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_of_describe_target_health_include_options =
  describe_target_health_input_include_enum list
[@@ocaml.doc ""]

type nonrec limit = {
  max : max option; [@ocaml.doc "The maximum value of the limit.\n"]
  name : name option; [@ocaml.doc "The name of the limit.\n"]
}
[@@ocaml.doc
  "Information about an Elastic Load Balancing resource limit for your Amazon Web Services \
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

type nonrec limits = limit list [@@ocaml.doc ""]

type nonrec invalid_scheme_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The requested scheme is not valid.\n"]

type nonrec invalid_revocation_content_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The provided revocation file is an invalid format, or uses an incorrect algorithm.\n"]

type nonrec health_unavailable_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "The health of the specified targets could not be retrieved due to an internal error.\n"]

type nonrec get_trust_store_revocation_content_output = {
  location : location option; [@ocaml.doc "The revocation files Amazon S3 URI.\n"]
}
[@@ocaml.doc ""]

type nonrec get_trust_store_revocation_content_input = {
  revocation_id : revocation_id; [@ocaml.doc "The revocation ID of the revocation file.\n"]
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec get_trust_store_ca_certificates_bundle_output = {
  location : location option; [@ocaml.doc "The ca certificate bundles Amazon S3 URI.\n"]
}
[@@ocaml.doc ""]

type nonrec get_trust_store_ca_certificates_bundle_input = {
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_output = {
  policy : policy option; [@ocaml.doc "The content of the resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_input = {
  resource_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trust_stores_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  trust_stores : trust_stores option; [@ocaml.doc "Information about the trust stores.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trust_stores_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  names : trust_store_names option; [@ocaml.doc "The names of the trust stores.\n"]
  trust_store_arns : trust_store_arns option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trust_store_revocation = {
  number_of_revoked_entries : number_of_revoked_entries option;
      [@ocaml.doc "The number of revoked certificates.\n"]
  revocation_type : revocation_type option; [@ocaml.doc "The type of revocation file.\n"]
  revocation_id : revocation_id option;
      [@ocaml.doc "The revocation ID of a revocation file in use.\n"]
  trust_store_arn : trust_store_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc "Information about the revocations used by a trust store.\n"]

type nonrec describe_trust_store_revocation_response = describe_trust_store_revocation list
[@@ocaml.doc ""]

type nonrec describe_trust_store_revocations_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  trust_store_revocations : describe_trust_store_revocation_response option;
      [@ocaml.doc "Information about the revocation file in the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trust_store_revocations_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  revocation_ids : revocation_ids option;
      [@ocaml.doc "The revocation IDs of the revocation files you want to describe.\n"]
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trust_store_associations_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  trust_store_associations : trust_store_associations option;
      [@ocaml.doc "Information about the resources the trust store is associated to.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_trust_store_associations_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_target_health_output = {
  target_health_descriptions : target_health_descriptions option;
      [@ocaml.doc "Information about the health of the targets.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_target_health_input = {
  include_ : list_of_describe_target_health_include_options option;
      [@ocaml.doc "Used to include anomaly detection information.\n"]
  targets : target_descriptions option; [@ocaml.doc "The targets.\n"]
  target_group_arn : target_group_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_target_groups_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  target_groups : target_groups option; [@ocaml.doc "Information about the target groups.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_target_groups_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  names : target_group_names option; [@ocaml.doc "The names of the target groups.\n"]
  target_group_arns : target_group_arns option;
      [@ocaml.doc "The Amazon Resource Names (ARN) of the target groups.\n"]
  load_balancer_arn : load_balancer_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_target_group_attributes_output = {
  attributes : target_group_attributes option;
      [@ocaml.doc "Information about the target group attributes\n"]
}
[@@ocaml.doc ""]

type nonrec describe_target_group_attributes_input = {
  target_group_arn : target_group_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tags_output = {
  tag_descriptions : tag_descriptions option; [@ocaml.doc "Information about the tags.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tags_input = {
  resource_arns : resource_arns;
      [@ocaml.doc
        "The Amazon Resource Names (ARN) of the resources. You can specify up to 20 resources in a \
         single call.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_ssl_policies_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  ssl_policies : ssl_policies option; [@ocaml.doc "Information about the security policies.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_ssl_policies_input = {
  load_balancer_type : load_balancer_type_enum option;
      [@ocaml.doc
        " The type of load balancer. The default lists the SSL policies for all load balancers.\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  names : ssl_policy_names option; [@ocaml.doc "The names of the policies.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rules_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  rules : rules option; [@ocaml.doc "Information about the rules.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rules_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  rule_arns : rule_arns option; [@ocaml.doc "The Amazon Resource Names (ARN) of the rules.\n"]
  listener_arn : listener_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_load_balancers_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  load_balancers : load_balancers option; [@ocaml.doc "Information about the load balancers.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_load_balancers_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  names : load_balancer_names option; [@ocaml.doc "The names of the load balancers.\n"]
  load_balancer_arns : load_balancer_arns option;
      [@ocaml.doc
        "The Amazon Resource Names (ARN) of the load balancers. You can specify up to 20 load \
         balancers in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_load_balancer_attributes_output = {
  attributes : load_balancer_attributes option;
      [@ocaml.doc "Information about the load balancer attributes.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_load_balancer_attributes_input = {
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_listeners_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  listeners : listeners option; [@ocaml.doc "Information about the listeners.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_listeners_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  listener_arns : listener_arns option;
      [@ocaml.doc "The Amazon Resource Names (ARN) of the listeners.\n"]
  load_balancer_arn : load_balancer_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_listener_certificates_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  certificates : certificate_list option; [@ocaml.doc "Information about the certificates.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_listener_certificates_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Names (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_listener_attributes_output = {
  attributes : listener_attributes option;
      [@ocaml.doc "Information about the listener attributes.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_listener_attributes_input = {
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_capacity_reservation_output = {
  capacity_reservation_state : zonal_capacity_reservation_states option;
      [@ocaml.doc "The state of the capacity reservation.\n"]
  minimum_load_balancer_capacity : minimum_load_balancer_capacity option;
      [@ocaml.doc "The requested minimum capacity reservation for the load balancer\n"]
  decrease_requests_remaining : decrease_requests_remaining option;
      [@ocaml.doc "The amount of daily capacity decreases remaining.\n"]
  last_modified_time : last_modified_time option;
      [@ocaml.doc "The last time the capacity reservation was modified.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_capacity_reservation_input = {
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_limits_output = {
  next_marker : marker option;
      [@ocaml.doc
        "If there are additional results, this is the marker for the next set of results. \
         Otherwise, this is null.\n"]
  limits : limits option; [@ocaml.doc "Information about the limits.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_limits_input = {
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_targets_output = unit [@@ocaml.doc ""]

type nonrec deregister_targets_input = {
  targets : target_descriptions;
      [@ocaml.doc
        "The targets. If you specified a port override when you registered a target, you must \
         specify both the target ID and the port when you deregister it.\n"]
  target_group_arn : target_group_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_trust_store_output = unit [@@ocaml.doc ""]

type nonrec delete_trust_store_input = {
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_target_group_output = unit [@@ocaml.doc ""]

type nonrec delete_target_group_input = {
  target_group_arn : target_group_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_association_same_account_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified association can't be within the same account.\n"]

type nonrec delete_shared_trust_store_association_output = unit [@@ocaml.doc ""]

type nonrec delete_shared_trust_store_association_input = {
  resource_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_output = unit [@@ocaml.doc ""]

type nonrec delete_rule_input = {
  rule_arn : rule_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_load_balancer_output = unit [@@ocaml.doc ""]

type nonrec delete_load_balancer_input = {
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_listener_output = unit [@@ocaml.doc ""]

type nonrec delete_listener_input = {
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec duplicate_trust_store_name_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "A trust store with the specified name already exists.\n"]

type nonrec duplicate_tag_keys_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "A tag key was specified more than once.\n"]

type nonrec create_trust_store_output = {
  trust_stores : trust_stores option; [@ocaml.doc "Information about the trust store created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_trust_store_input = {
  tags : tag_list option; [@ocaml.doc "The tags to assign to the trust store.\n"]
  ca_certificates_bundle_s3_object_version : s3_object_version option;
      [@ocaml.doc
        "The Amazon S3 object version for the ca certificates bundle. If undefined the current \
         version is used.\n"]
  ca_certificates_bundle_s3_key : s3_key;
      [@ocaml.doc "The Amazon S3 path for the ca certificates bundle.\n"]
  ca_certificates_bundle_s3_bucket : s3_bucket;
      [@ocaml.doc "The Amazon S3 bucket for the ca certificates bundle.\n"]
  name : trust_store_name;
      [@ocaml.doc
        "The name of the trust store.\n\n\
        \ This name must be unique per region and can't be changed after creation.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec duplicate_target_group_name_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "A target group with the specified name already exists.\n"]

type nonrec create_target_group_output = {
  target_groups : target_groups option; [@ocaml.doc "Information about the target group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_target_group_input = {
  target_control_port : target_control_port option;
      [@ocaml.doc
        "The port on which the target control agent and application load balancer exchange \
         management traffic for the target optimizer feature.\n"]
  ip_address_type : target_group_ip_address_type_enum option;
      [@ocaml.doc "The IP address type. The default value is [ipv4].\n"]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the target group.\n"]
  target_type : target_type_enum option;
      [@ocaml.doc
        "The type of target that you must specify when registering targets with this target group. \
         You can't specify targets for a target group using more than one target type.\n\n\
        \ {ul\n\
        \       {-   [instance] - Register targets by instance ID. This is the default value.\n\
        \           \n\
        \            }\n\
        \       {-   [ip] - Register targets by IP address. You can specify IP addresses from the \
         subnets of the virtual private cloud (VPC) for the target group, the RFC 1918 range \
         (10.0.0.0/8, 172.16.0.0/12, and 192.168.0.0/16), and the RFC 6598 range (100.64.0.0/10). \
         You can't specify publicly routable IP addresses.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda] - Register a single Lambda function as a target.\n\
        \           \n\
        \            }\n\
        \       {-   [alb] - Register a single Application Load Balancer as a target.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  matcher : matcher option;
      [@ocaml.doc
        "\\[HTTP/HTTPS health checks\\] The HTTP or gRPC codes to use when checking for a \
         successful response from a target. For target groups with a protocol of TCP, TCP_UDP, \
         UDP, QUIC, TCP_QUIC, or TLS the range is 200-599. For target groups with a protocol of \
         HTTP or HTTPS, the range is 200-499. For target groups with a protocol of GENEVE, the \
         range is 200-399.\n"]
  unhealthy_threshold_count : health_check_threshold_count option;
      [@ocaml.doc
        "The number of consecutive health check failures required before considering a target \
         unhealthy. The range is 2-10. If the target group protocol is TCP, TCP_UDP, UDP, TLS, \
         QUIC, TCP_QUIC, HTTP or HTTPS, the default is 2. For target groups with a protocol of \
         GENEVE, the default is 2. If the target type is [lambda], the default is 5.\n"]
  healthy_threshold_count : health_check_threshold_count option;
      [@ocaml.doc
        "The number of consecutive health check successes required before considering a target \
         healthy. The range is 2-10. If the target group protocol is TCP, TCP_UDP, UDP, TLS, HTTP \
         or HTTPS, the default is 5. For target groups with a protocol of GENEVE, the default is \
         5. If the target type is [lambda], the default is 5.\n"]
  health_check_timeout_seconds : health_check_timeout_seconds option;
      [@ocaml.doc
        "The amount of time, in seconds, during which no response from a target means a failed \
         health check. The range is 2\226\128\147120 seconds. For target groups with a protocol of \
         HTTP, the default is 6 seconds. For target groups with a protocol of TCP, TLS or HTTPS, \
         the default is 10 seconds. For target groups with a protocol of GENEVE, the default is 5 \
         seconds. If the target type is [lambda], the default is 30 seconds.\n"]
  health_check_interval_seconds : health_check_interval_seconds option;
      [@ocaml.doc
        "The approximate amount of time, in seconds, between health checks of an individual \
         target. The range is 5-300. If the target group protocol is TCP, TLS, UDP, TCP_UDP, QUIC, \
         TCP_QUIC, HTTP or HTTPS, the default is 30 seconds. If the target group protocol is \
         GENEVE, the default is 10 seconds. If the target type is [lambda], the default is 35 \
         seconds.\n"]
  health_check_path : path option;
      [@ocaml.doc
        "\\[HTTP/HTTPS health checks\\] The destination for health checks on the targets.\n\n\
        \ \\[HTTP1 or HTTP2 protocol version\\] The ping path. The default is /.\n\
        \ \n\
        \  \\[GRPC protocol version\\] The path of a custom health check method with the format \
         /package.service/method. The default is /Amazon Web Services.ALB/healthcheck.\n\
        \  "]
  health_check_enabled : health_check_enabled option;
      [@ocaml.doc
        "Indicates whether health checks are enabled. If the target type is [lambda], health \
         checks are disabled by default but can be enabled. If the target type is [instance], \
         [ip], or [alb], health checks are always enabled and can't be disabled.\n"]
  health_check_port : health_check_port option;
      [@ocaml.doc
        "The port the load balancer uses when performing health checks on targets. If the protocol \
         is HTTP, HTTPS, TCP, TLS, UDP, TCP_UDP, QUIC, or TCP_QUIC the default is [traffic-port], \
         which is the port on which each target receives traffic from the load balancer. If the \
         protocol is GENEVE, the default is port 80.\n"]
  health_check_protocol : protocol_enum option;
      [@ocaml.doc
        "The protocol the load balancer uses when performing health checks on targets. For \
         Application Load Balancers, the default is HTTP. For Network Load Balancers and Gateway \
         Load Balancers, the default is TCP. The TCP protocol is not supported for health checks \
         if the protocol of the target group is HTTP or HTTPS. The GENEVE, TLS, UDP, TCP_UDP, \
         QUIC, and TCP_QUIC protocols are not supported for health checks.\n"]
  vpc_id : vpc_id option;
      [@ocaml.doc
        "The identifier of the virtual private cloud (VPC). If the target is a Lambda function, \
         this parameter does not apply. Otherwise, this parameter is required.\n"]
  port : port option;
      [@ocaml.doc
        "The port on which the targets receive traffic. This port is used unless you specify a \
         port override when registering the target. If the target is a Lambda function, this \
         parameter does not apply. If the protocol is GENEVE, the supported port is 6081.\n"]
  protocol_version : protocol_version option;
      [@ocaml.doc
        "\\[HTTP/HTTPS protocol\\] The protocol version. Specify [GRPC] to send requests to \
         targets using gRPC. Specify [HTTP2] to send requests to targets using HTTP/2. The default \
         is [HTTP1], which sends requests to targets using HTTP/1.1.\n"]
  protocol : protocol_enum option;
      [@ocaml.doc
        "The protocol to use for routing traffic to the targets. For Application Load Balancers, \
         the supported protocols are HTTP and HTTPS. For Network Load Balancers, the supported \
         protocols are TCP, TLS, UDP, TCP_UDP, QUIC, or TCP_QUIC. For Gateway Load Balancers, the \
         supported protocol is GENEVE. A TCP_UDP listener must be associated with a TCP_UDP target \
         group. A TCP_QUIC listener must be associated with a TCP_QUIC target group. If the target \
         is a Lambda function, this parameter does not apply.\n"]
  name : target_group_name;
      [@ocaml.doc
        "The name of the target group.\n\n\
        \ This name must be unique per region per account, can have a maximum of 32 characters, \
         must contain only alphanumeric characters or hyphens, and must not begin or end with a \
         hyphen.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_rule_output = {
  rules : rules option; [@ocaml.doc "Information about the rule.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rule_input = {
  transforms : rule_transform_list option;
      [@ocaml.doc
        "The transforms to apply to requests that match this rule. You can add one host header \
         rewrite transform and one URL rewrite transform.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the rule.\n"]
  actions : actions; [@ocaml.doc "The actions.\n"]
  priority : rule_priority;
      [@ocaml.doc
        "The rule priority. A listener can't have multiple rules with the same priority.\n"]
  conditions : rule_condition_list; [@ocaml.doc "The conditions.\n"]
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec duplicate_load_balancer_name_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "A load balancer with the specified name already exists.\n"]

type nonrec create_load_balancer_output = {
  load_balancers : load_balancers option; [@ocaml.doc "Information about the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec create_load_balancer_input = {
  ipam_pools : ipam_pools option;
      [@ocaml.doc
        "\\[Application Load Balancers\\] The IPAM pools to use with the load balancer.\n"]
  enable_prefix_for_ipv6_source_nat : enable_prefix_for_ipv6_source_nat_enum option;
      [@ocaml.doc
        "\\[Network Load Balancers with UDP listeners\\] Indicates whether to use an IPv6 prefix \
         from each subnet for source NAT. The IP address type must be [dualstack]. The default \
         value is [off].\n"]
  customer_owned_ipv4_pool : customer_owned_ipv4_pool option;
      [@ocaml.doc
        "\\[Application Load Balancers on Outposts\\] The ID of the customer-owned address pool \
         (CoIP pool).\n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type. Internal load balancers must use [ipv4].\n\n\
        \ \\[Application Load Balancers\\] The possible values are [ipv4] (IPv4 addresses), \
         [dualstack] (IPv4 and IPv6 addresses), and [dualstack-without-public-ipv4] (public IPv6 \
         addresses and private IPv4 and IPv6 addresses).\n\
        \ \n\
        \  \\[Network Load Balancers and Gateway Load Balancers\\] The possible values are [ipv4] \
         (IPv4 addresses) and [dualstack] (IPv4 and IPv6 addresses).\n\
        \  "]
  type_ : load_balancer_type_enum option;
      [@ocaml.doc "The type of load balancer. The default is [application].\n"]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the load balancer.\n"]
  scheme : load_balancer_scheme_enum option;
      [@ocaml.doc
        "The nodes of an Internet-facing load balancer have public IP addresses. The DNS name of \
         an Internet-facing load balancer is publicly resolvable to the public IP addresses of the \
         nodes. Therefore, Internet-facing load balancers can route requests from clients over the \
         internet.\n\n\
        \ The nodes of an internal load balancer have only private IP addresses. The DNS name of \
         an internal load balancer is publicly resolvable to the private IP addresses of the \
         nodes. Therefore, internal load balancers can route requests only from clients with \
         access to the VPC for the load balancer.\n\
        \ \n\
        \  The default is an Internet-facing load balancer.\n\
        \  \n\
        \   You can't specify a scheme for a Gateway Load Balancer.\n\
        \   "]
  security_groups : security_groups option;
      [@ocaml.doc
        "\\[Application Load Balancers and Network Load Balancers\\] The IDs of the security \
         groups for the load balancer.\n"]
  subnet_mappings : subnet_mappings option;
      [@ocaml.doc
        "The IDs of the subnets. You can specify only one subnet per Availability Zone. You must \
         specify either subnets or subnet mappings, but not both.\n\n\
        \ \\[Application Load Balancers\\] You must specify subnets from at least two Availability \
         Zones. You can't specify Elastic IP addresses for your subnets.\n\
        \ \n\
        \  \\[Application Load Balancers on Outposts\\] You must specify one Outpost subnet.\n\
        \  \n\
        \   \\[Application Load Balancers on Local Zones\\] You can specify subnets from one or \
         more Local Zones.\n\
        \   \n\
        \    \\[Network Load Balancers\\] You can specify subnets from one or more Availability \
         Zones. You can specify one Elastic IP address per subnet if you need static IP addresses \
         for your internet-facing load balancer. For internal load balancers, you can specify one \
         private IP address per subnet from the IPv4 range of the subnet. For internet-facing load \
         balancer, you can specify one IPv6 address per subnet.\n\
        \    \n\
        \     \\[Gateway Load Balancers\\] You can specify subnets from one or more Availability \
         Zones. You can't specify Elastic IP addresses for your subnets.\n\
        \     "]
  subnets : subnets option;
      [@ocaml.doc
        "The IDs of the subnets. You can specify only one subnet per Availability Zone. You must \
         specify either subnets or subnet mappings, but not both. To specify an Elastic IP \
         address, specify subnet mappings instead of subnets.\n\n\
        \ \\[Application Load Balancers\\] You must specify subnets from at least two Availability \
         Zones.\n\
        \ \n\
        \  \\[Application Load Balancers on Outposts\\] You must specify one Outpost subnet.\n\
        \  \n\
        \   \\[Application Load Balancers on Local Zones\\] You can specify subnets from one or \
         more Local Zones.\n\
        \   \n\
        \    \\[Network Load Balancers and Gateway Load Balancers\\] You can specify subnets from \
         one or more Availability Zones.\n\
        \    "]
  name : load_balancer_name;
      [@ocaml.doc
        "The name of the load balancer.\n\n\
        \ This name must be unique per region per account, can have a maximum of 32 characters, \
         must contain only alphanumeric characters or hyphens, must not begin or end with a \
         hyphen, and must not begin with \"internal-\".\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_listener_output = {
  listeners : listeners option; [@ocaml.doc "Information about the listener.\n"]
}
[@@ocaml.doc ""]

type nonrec create_listener_input = {
  mutual_authentication : mutual_authentication_attributes option;
      [@ocaml.doc "\\[HTTPS listeners\\] The mutual authentication configuration information.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the listener.\n"]
  alpn_policy : alpn_policy_name option;
      [@ocaml.doc
        "\\[TLS listeners\\] The name of the Application-Layer Protocol Negotiation (ALPN) policy. \
         You can specify one policy name. The following are the possible values:\n\n\
        \ {ul\n\
        \       {-   [HTTP1Only] \n\
        \           \n\
        \            }\n\
        \       {-   [HTTP2Only] \n\
        \           \n\
        \            }\n\
        \       {-   [HTTP2Optional] \n\
        \           \n\
        \            }\n\
        \       {-   [HTTP2Preferred] \n\
        \           \n\
        \            }\n\
        \       {-   [None] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/load-balancer-listeners.html#alpn-policies}ALPN \
         policies} in the {i Network Load Balancers Guide}.\n\
        \   "]
  default_actions : actions; [@ocaml.doc "The actions for the default rule.\n"]
  certificates : certificate_list option;
      [@ocaml.doc
        "\\[HTTPS and TLS listeners\\] The default certificate for the listener. You must provide \
         exactly one certificate. Set [CertificateArn] to the certificate ARN but do not set \
         [IsDefault].\n"]
  ssl_policy : ssl_policy_name option;
      [@ocaml.doc
        "\\[HTTPS and TLS listeners\\] The security policy that defines which protocols and \
         ciphers are supported.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/application/describe-ssl-policies.html}Security \
         policies} in the {i Application Load Balancers Guide} and \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/network/describe-ssl-policies.html}Security \
         policies} in the {i Network Load Balancers Guide}.\n\
        \ "]
  port : port option;
      [@ocaml.doc
        "The port on which the load balancer is listening. You can't specify a port for a Gateway \
         Load Balancer.\n"]
  protocol : protocol_enum option;
      [@ocaml.doc
        "The protocol for connections from clients to the load balancer. For Application Load \
         Balancers, the supported protocols are HTTP and HTTPS. For Network Load Balancers, the \
         supported protocols are TCP, TLS, UDP, TCP_UDP, QUIC, and TCP_QUIC. You can\226\128\153t \
         specify the UDP, TCP_UDP, QUIC, or TCP_QUIC protocol if dual-stack mode is enabled. You \
         can't specify a protocol for a Gateway Load Balancer.\n"]
  load_balancer_arn : load_balancer_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the load balancer.\n"]
}
[@@ocaml.doc ""]

type nonrec add_trust_store_revocations_output = {
  trust_store_revocations : trust_store_revocations option;
      [@ocaml.doc "Information about the revocation file added to the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec add_trust_store_revocations_input = {
  revocation_contents : revocation_contents option; [@ocaml.doc "The revocation file to add.\n"]
  trust_store_arn : trust_store_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the trust store.\n"]
}
[@@ocaml.doc ""]

type nonrec add_tags_output = unit [@@ocaml.doc ""]

type nonrec add_tags_input = {
  tags : tag_list; [@ocaml.doc "The tags.\n"]
  resource_arns : resource_arns; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec add_listener_certificates_output = {
  certificates : certificate_list option;
      [@ocaml.doc "Information about the certificates in the certificate list.\n"]
}
[@@ocaml.doc ""]

type nonrec add_listener_certificates_input = {
  certificates : certificate_list;
      [@ocaml.doc
        "The certificate to add. You can specify one certificate per call. Set [CertificateArn] to \
         the certificate ARN but do not set [IsDefault].\n"]
  listener_arn : listener_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the listener.\n"]
}
[@@ocaml.doc ""]
