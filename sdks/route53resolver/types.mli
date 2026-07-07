type nonrec vendor_name = string [@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You have provided an invalid command. If you ran the [UpdateFirewallDomains] request. supported \
   values are [ADD], [REMOVE], or [REPLACE] a domain.\n"]

type nonrec validation =
  | USE_LOCAL_RESOURCE_SETTING [@ocaml.doc ""]
  | DISABLE [@ocaml.doc ""]
  | ENABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec creator_request_id = string [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec resolver_rule_status =
  | Failed [@ocaml.doc ""]
  | Updating [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Complete [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec status_message = string [@@ocaml.doc ""]

type nonrec rule_type_option =
  | Delegate [@ocaml.doc ""]
  | Recursive [@ocaml.doc ""]
  | System [@ocaml.doc ""]
  | Forward [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec ip = string [@@ocaml.doc ""]

type nonrec port = int [@@ocaml.doc ""]

type nonrec ipv6 = string [@@ocaml.doc ""]

type nonrec protocol = DOHFIPS [@ocaml.doc ""] | DO53 [@ocaml.doc ""] | DOH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec server_name_indication = string [@@ocaml.doc ""]

type nonrec target_address = {
  server_name_indication : server_name_indication option;
      [@ocaml.doc
        " The Server Name Indication of the DoH server that you want to forward queries to. This \
         is only used if the Protocol of the [TargetAddress] is [DoH]. \n"]
  protocol : protocol option;
      [@ocaml.doc
        " The protocols for the target address. The protocol you choose needs to be supported by \
         the outbound endpoint of the Resolver rule.\n"]
  ipv6 : ipv6 option; [@ocaml.doc " One IPv6 address that you want to forward DNS queries to. \n"]
  port : port option; [@ocaml.doc "The port at [Ip] that you want to forward DNS queries to.\n"]
  ip : ip option; [@ocaml.doc "One IPv4 address that you want to forward DNS queries to.\n"]
}
[@@ocaml.doc
  "In a \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html}CreateResolverRule} \
   request, an array of the IPs that you want to forward DNS queries to.\n"]

type nonrec target_list = target_address list [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec share_status =
  | SharedByMe [@ocaml.doc ""]
  | SharedWithMe [@ocaml.doc ""]
  | NotShared [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rfc3339_time_string = string [@@ocaml.doc ""]

type nonrec delegation_record = string [@@ocaml.doc ""]

type nonrec resolver_rule = {
  delegation_record : delegation_record option;
      [@ocaml.doc
        " DNS queries with delegation records that point to this domain name are forwarded to \
         resolvers on your network. \n"]
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the Resolver rule was last updated, in Unix time format and \
         Coordinated Universal Time (UTC).\n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the Resolver rule was created, in Unix time format and Coordinated \
         Universal Time (UTC).\n"]
  share_status : share_status option;
      [@ocaml.doc
        "Whether the rule is shared and, if so, whether the current account is sharing the rule \
         with another account, or another account is sharing the rule with the current account.\n"]
  owner_id : account_id option;
      [@ocaml.doc
        "When a rule is shared with another Amazon Web Services account, the account ID of the \
         account that the rule is shared with.\n"]
  resolver_endpoint_id : resource_id option;
      [@ocaml.doc "The ID of the endpoint that the rule is associated with.\n"]
  target_ips : target_list option;
      [@ocaml.doc
        "An array that contains the IP addresses and ports that an outbound endpoint forwards DNS \
         queries to. Typically, these are the IP addresses of DNS resolvers on your network. \n"]
  name : name option;
      [@ocaml.doc
        "The name for the Resolver rule, which you specified when you created the Resolver rule.\n\n\
        \ The name can be up to 64 characters long and can contain letters (a-z, A-Z), numbers \
         (0-9), hyphens (-), underscores (_), and spaces. The name cannot consist of only numbers.\n\
        \ "]
  rule_type : rule_type_option option;
      [@ocaml.doc
        "When you want to forward DNS queries for specified domain name to resolvers on your \
         network, specify [FORWARD] or [DELEGATE]. If a query matches multiple Resolver rules \
         (example.com and www.example.com), outbound DNS queries are routed using the Resolver \
         rule that contains the most specific domain name (www.example.com).\n\n\
        \ When you have a forwarding rule to forward DNS queries for a domain to your network and \
         you want Resolver to process queries for a subdomain of that domain, specify [SYSTEM].\n\
        \ \n\
        \  For example, to forward DNS queries for example.com to resolvers on your network, you \
         create a rule and specify [FORWARD] for [RuleType]. To then have Resolver process queries \
         for apex.example.com, you create a rule and specify [SYSTEM] for [RuleType].\n\
        \  \n\
        \   Currently, only Resolver can create rules that have a value of [RECURSIVE] for \
         [RuleType].\n\
        \   "]
  status_message : status_message option;
      [@ocaml.doc "A detailed description of the status of a Resolver rule.\n"]
  status : resolver_rule_status option;
      [@ocaml.doc "A code that specifies the current status of the Resolver rule.\n"]
  domain_name : domain_name option;
      [@ocaml.doc
        "DNS queries for this domain name are forwarded to the IP addresses that are specified in \
         [TargetIps]. If a query matches multiple Resolver rules (example.com and \
         www.example.com), the query is routed using the Resolver rule that contains the most \
         specific domain name (www.example.com).\n"]
  arn : arn option;
      [@ocaml.doc "The ARN (Amazon Resource Name) for the Resolver rule specified by [Id].\n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string that you specified when you created the Resolver rule. [CreatorRequestId] \
         identifies the request and allows failed requests to be retried without the risk of \
         running the operation twice. \n"]
  id : resource_id option;
      [@ocaml.doc "The ID that Resolver assigned to the Resolver rule when you created it.\n"]
}
[@@ocaml.doc
  "For queries that originate in your VPC, detailed information about a Resolver rule, which \
   specifies how to route DNS queries out of the VPC. The [ResolverRule] parameter appears in the \
   response to a \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverRule.html}CreateResolverRule}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DeleteResolverRule.html}DeleteResolverRule}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRule.html}GetResolverRule}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html}ListResolverRules}, \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverRule.html}UpdateResolverRule} \
   request.\n"]

type nonrec update_resolver_rule_response = {
  resolver_rule : resolver_rule option;
      [@ocaml.doc "The response to an [UpdateResolverRule] request.\n"]
}
[@@ocaml.doc ""]

type nonrec resolver_rule_config = {
  resolver_endpoint_id : resource_id option;
      [@ocaml.doc
        "The ID of the new outbound Resolver endpoint that you want to use to route DNS queries to \
         the IP addresses that you specify in [TargetIps].\n"]
  target_ips : target_list option;
      [@ocaml.doc
        "For DNS queries that originate in your VPC, the new IP addresses that you want to route \
         outbound DNS queries to.\n"]
  name : name option;
      [@ocaml.doc
        "The new name for the Resolver rule. The name that you specify appears in the Resolver \
         dashboard in the Route 53 console. \n\n\
        \ The name can be up to 64 characters long and can contain letters (a-z, A-Z), numbers \
         (0-9), hyphens (-), underscores (_), and spaces. The name cannot consist of only numbers.\n\
        \ "]
}
[@@ocaml.doc
  "In an \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverRule.html}UpdateResolverRule} \
   request, information about the changes that you want to make.\n"]

type nonrec update_resolver_rule_request = {
  config : resolver_rule_config; [@ocaml.doc "The new settings for the Resolver rule.\n"]
  resolver_rule_id : resource_id;
      [@ocaml.doc "The ID of the Resolver rule that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request was throttled. Try again in a few minutes.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec resource_unavailable_exception = {
  resource_type : string_ option;
      [@ocaml.doc
        "For a [ResourceUnavailableException] error, the type of resource that isn't available.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified resource isn't available.\n"]

type nonrec resource_not_found_exception = {
  resource_type : string_ option;
      [@ocaml.doc
        "For a [ResourceNotFoundException] error, the type of resource that doesn't exist.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified resource doesn't exist.\n"]

type nonrec limit_exceeded_exception = {
  resource_type : string_ option;
      [@ocaml.doc
        "For a [LimitExceededException] error, the type of resource that exceeded the current limit.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request caused one or more limits to be exceeded.\n"]

type nonrec invalid_request_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request is invalid.\n"]

type nonrec invalid_parameter_exception = {
  field_name : string_ option;
      [@ocaml.doc
        "For an [InvalidParameterException] error, the name of the parameter that's invalid.\n"]
  message : exception_message; [@ocaml.doc ""]
}
[@@ocaml.doc "One or more parameters in this request are not valid.\n"]

type nonrec internal_service_error_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "We encountered an unknown error. Try again in a few minutes.\n"]

type nonrec access_denied_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The current account doesn't have the IAM permissions required to perform the specified Resolver \
   operation.\n\n\
  \ This error can also be thrown when a customer has reached the 5120 character limit for a \
   resource policy for CloudWatch Logs.\n\
  \ "]

type nonrec security_group_ids = resource_id list [@@ocaml.doc ""]

type nonrec resolver_endpoint_direction =
  | InboundDelegation [@ocaml.doc ""]
  | Outbound [@ocaml.doc ""]
  | Inbound [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ip_address_count = int [@@ocaml.doc ""]

type nonrec resolver_endpoint_status =
  | Deleting [@ocaml.doc ""]
  | ActionNeeded [@ocaml.doc ""]
  | AutoRecovering [@ocaml.doc ""]
  | Updating [@ocaml.doc ""]
  | Operational [@ocaml.doc ""]
  | Creating [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec outpost_arn = string [@@ocaml.doc ""]

type nonrec outpost_instance_type = string [@@ocaml.doc ""]

type nonrec resolver_endpoint_type =
  | DUALSTACK [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""]
  | IPV6 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec protocol_list = protocol list [@@ocaml.doc ""]

type nonrec rni_enhanced_metrics_enabled = bool [@@ocaml.doc ""]

type nonrec target_name_server_metrics_enabled = bool [@@ocaml.doc ""]

type nonrec dns64_enabled = bool [@@ocaml.doc ""]

type nonrec ipv6_internet_access_enabled = bool [@@ocaml.doc ""]

type nonrec resolver_endpoint = {
  ipv6_internet_access_enabled : ipv6_internet_access_enabled option;
      [@ocaml.doc
        "Indicates whether IPv6 internet access is enabled for the outbound Resolver endpoint. \
         When [true], the endpoint elastic network interfaces (ENIs) can forward DNS queries to \
         public IPv6 targets through an internet gateway.\n"]
  dns64_enabled : dns64_enabled option;
      [@ocaml.doc
        "Indicates whether DNS64 is enabled for the inbound Resolver endpoint. When [true], Route \
         53 Resolver synthesizes AAAA (IPv6) records for IPv4-only services by prepending the \
         [64:ff9b::/96] prefix to the IPv4 address.\n"]
  target_name_server_metrics_enabled : target_name_server_metrics_enabled option;
      [@ocaml.doc
        "Indicates whether target name server metrics are enabled for the outbound Resolver \
         endpoint. When enabled, one-minute granular metrics are published in CloudWatch for each \
         target name server associated with this endpoint. When disabled, these metrics are not \
         published. This feature is not supported for inbound Resolver endpoint.\n"]
  rni_enhanced_metrics_enabled : rni_enhanced_metrics_enabled option;
      [@ocaml.doc
        "Indicates whether RNI enhanced metrics are enabled for the Resolver endpoint. When \
         enabled, one-minute granular metrics are published in CloudWatch for each RNI associated \
         with this endpoint. When disabled, these metrics are not published.\n"]
  protocols : protocol_list option;
      [@ocaml.doc
        " Protocols used for the endpoint. DoH-FIPS is applicable for a default inbound endpoints \
         only. \n\n\
        \ For an inbound endpoint you can apply the protocols as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   Do53 and DoH in combination.\n\
        \            \n\
        \             }\n\
        \        {-  Do53 and DoH-FIPS in combination.\n\
        \            \n\
        \             }\n\
        \        {-  Do53 alone.\n\
        \            \n\
        \             }\n\
        \        {-  DoH alone.\n\
        \            \n\
        \             }\n\
        \        {-  DoH-FIPS alone.\n\
        \            \n\
        \             }\n\
        \        {-  None, which is treated as Do53.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For a delegation inbound endpoint you can use Do53 only.\n\
        \   \n\
        \    For an outbound endpoint you can apply the protocols as follows:\n\
        \    \n\
        \     {ul\n\
        \           {-   Do53 and DoH in combination.\n\
        \               \n\
        \                }\n\
        \           {-  Do53 alone.\n\
        \               \n\
        \                }\n\
        \           {-  DoH alone.\n\
        \               \n\
        \                }\n\
        \           {-  None, which is treated as Do53.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  resolver_endpoint_type : resolver_endpoint_type option;
      [@ocaml.doc " The Resolver endpoint IP address type. \n"]
  preferred_instance_type : outpost_instance_type option;
      [@ocaml.doc " The Amazon EC2 instance type. \n"]
  outpost_arn : outpost_arn option; [@ocaml.doc "The ARN (Amazon Resource Name) for the Outpost.\n"]
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the endpoint was last modified, in Unix time format and \
         Coordinated Universal Time (UTC).\n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the endpoint was created, in Unix time format and Coordinated \
         Universal Time (UTC).\n"]
  status_message : status_message option;
      [@ocaml.doc "A detailed description of the status of the Resolver endpoint.\n"]
  status : resolver_endpoint_status option;
      [@ocaml.doc
        "A code that specifies the current status of the Resolver endpoint. Valid values include \
         the following:\n\n\
        \ {ul\n\
        \       {-   [CREATING]: Resolver is creating and configuring one or more Amazon VPC \
         network interfaces for this endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [OPERATIONAL]: The Amazon VPC network interfaces for this endpoint are \
         correctly configured and able to pass inbound or outbound DNS queries between your \
         network and Resolver.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING]: Resolver is associating or disassociating one or more network \
         interfaces with this endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [AUTO_RECOVERING]: Resolver is trying to recover one or more of the network \
         interfaces that are associated with this endpoint. During the recovery process, the \
         endpoint functions with limited capacity because of the limit on the number of DNS \
         queries per IP address (per network interface). For the current limit, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html#limits-api-entities-resolver}Limits \
         on Route 53 Resolver}.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTION_NEEDED]: This endpoint is unhealthy, and Resolver can't automatically \
         recover it. To resolve the problem, we recommend that you check each IP address that you \
         associated with the endpoint. For each IP address that isn't available, add another IP \
         address and then delete the IP address that isn't available. (An endpoint must always \
         include at least two IP addresses.) A status of [ACTION_NEEDED] can have a variety of \
         causes. Here are two common causes:\n\
        \           \n\
        \            {ul\n\
        \                  {-  One or more of the network interfaces that are associated with the \
         endpoint were deleted using Amazon VPC.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The network interface couldn't be created for some reason that's \
         outside the control of Resolver.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   [DELETING]: Resolver is deleting this endpoint and the associated network \
         interfaces.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  host_vpc_id : resource_id option;
      [@ocaml.doc "The ID of the VPC that you want to create the Resolver endpoint in.\n"]
  ip_address_count : ip_address_count option;
      [@ocaml.doc
        "The number of IP addresses that the Resolver endpoint can use for DNS queries.\n"]
  direction : resolver_endpoint_direction option;
      [@ocaml.doc
        "Indicates whether the Resolver endpoint allows inbound or outbound DNS queries:\n\n\
        \ {ul\n\
        \       {-   [INBOUND]: allows DNS queries to your VPC from your network\n\
        \           \n\
        \            }\n\
        \       {-   [OUTBOUND]: allows DNS queries from your VPC to your network\n\
        \           \n\
        \            }\n\
        \       {-   [INBOUND_DELEGATION]: Resolver delegates queries to Route 53 private hosted \
         zones from your network.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  security_group_ids : security_group_ids option;
      [@ocaml.doc
        "The ID of one or more security groups that control access to this VPC. The security group \
         must include one or more inbound rules (for inbound endpoints) or outbound rules (for \
         outbound endpoints). Inbound and outbound rules must allow TCP and UDP access. For \
         inbound access, open port 53. For outbound access, open the port that you're using for \
         DNS queries on your network.\n"]
  name : name option;
      [@ocaml.doc
        "The name that you assigned to the Resolver endpoint when you submitted a \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html}CreateResolverEndpoint} \
         request.\n"]
  arn : arn option; [@ocaml.doc "The ARN (Amazon Resource Name) for the Resolver endpoint.\n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string that identifies the request that created the Resolver endpoint. The \
         [CreatorRequestId] allows failed requests to be retried without the risk of running the \
         operation twice.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the Resolver endpoint.\n"]
}
[@@ocaml.doc
  "In the response to a \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html}CreateResolverEndpoint}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DeleteResolverEndpoint.html}DeleteResolverEndpoint}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html}GetResolverEndpoint}, \
   Updates the name, or ResolverEndpointType for an endpoint, or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html}UpdateResolverEndpoint} \
   request, a complex type that contains settings for an existing inbound or outbound Resolver \
   endpoint.\n"]

type nonrec update_resolver_endpoint_response = {
  resolver_endpoint : resolver_endpoint option;
      [@ocaml.doc "The response to an [UpdateResolverEndpoint] request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_ip_address = {
  ipv6 : ipv6; [@ocaml.doc " The IPv6 address that you want to use for DNS queries. \n"]
  ip_id : resource_id;
      [@ocaml.doc " The ID of the IP address, specified by the [ResolverEndpointId]. \n"]
}
[@@ocaml.doc
  " Provides information about the IP address type in response to \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html}UpdateResolverEndpoint}. \n"]

type nonrec update_ip_addresses = update_ip_address list [@@ocaml.doc ""]

type nonrec update_resolver_endpoint_request = {
  ipv6_internet_access_enabled : ipv6_internet_access_enabled option;
      [@ocaml.doc
        "Specifies whether IPv6 internet access is enabled for the outbound Resolver endpoint. \
         When set to [true], the endpoint elastic network interfaces (ENIs) can forward DNS \
         queries to public IPv6 targets through an internet gateway.\n\n\
        \  When you enable IPv6 internet access, use network controls like security groups, NACLs, \
         or egress-only internet gateways to protect the endpoint ENIs from unsolicited ingress \
         traffic. Be aware that some network controls can affect DNS query throughput due to \
         connection tracking. For more information, see \
         {{:https://docs.aws.amazon.com/ec2/latest/userguide/security-group-connection-tracking.html}Amazon \
         EC2 security group connection tracking} and \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/best-practices-resolver-endpoint-scaling.html}Resolver \
         endpoint scaling}.\n\
        \  \n\
        \   "]
  dns64_enabled : dns64_enabled option;
      [@ocaml.doc
        "Specifies whether DNS64 is enabled for the inbound Resolver endpoint. When set to [true], \
         Route 53 Resolver synthesizes AAAA (IPv6) records for IPv4-only services by prepending \
         the [64:ff9b::/96] prefix to the IPv4 address. This enables IPv6-only clients that send \
         queries through the inbound endpoint to reach IPv4-only services. DNS64 works with NAT64 \
         to provide complete IPv6-to-IPv4 translation.\n"]
  target_name_server_metrics_enabled : target_name_server_metrics_enabled option;
      [@ocaml.doc
        "Updates whether target name server metrics are enabled for the outbound Resolver \
         endpoints. When set to true, one-minute granular metrics are published in CloudWatch for \
         each target name server associated with this endpoint. When set to false, metrics are not \
         published. This setting is not supported for inbound Resolver endpoints.\n\n\
        \  Standard CloudWatch pricing and charges are applied for using the Route 53 Resolver \
         endpoint target name server metrics. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/monitoring-resolver-with-cloudwatch.html}Detailed \
         metrics}.\n\
        \  \n\
        \   "]
  rni_enhanced_metrics_enabled : rni_enhanced_metrics_enabled option;
      [@ocaml.doc
        "Updates whether RNI enhanced metrics are enabled for the Resolver endpoints. When set to \
         true, one-minute granular metrics are published in CloudWatch for each RNI associated \
         with this endpoint. When set to false, metrics are not published.\n\n\
        \  Standard CloudWatch pricing and charges are applied for using the Route 53 Resolver \
         endpoint RNI enhanced metrics. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/monitoring-resolver-with-cloudwatch.html}Detailed \
         metrics}.\n\
        \  \n\
        \   "]
  protocols : protocol_list option;
      [@ocaml.doc
        " The protocols you want to use for the endpoint. DoH-FIPS is applicable for default \
         inbound endpoints only. \n\n\
        \ For a default inbound endpoint you can apply the protocols as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   Do53 and DoH in combination.\n\
        \            \n\
        \             }\n\
        \        {-  Do53 and DoH-FIPS in combination.\n\
        \            \n\
        \             }\n\
        \        {-  Do53 alone.\n\
        \            \n\
        \             }\n\
        \        {-  DoH alone.\n\
        \            \n\
        \             }\n\
        \        {-  DoH-FIPS alone.\n\
        \            \n\
        \             }\n\
        \        {-  None, which is treated as Do53.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For a delegation inbound endpoint you can use Do53 only.\n\
        \   \n\
        \    For an outbound endpoint you can apply the protocols as follows:\n\
        \    \n\
        \     {ul\n\
        \           {-   Do53 and DoH in combination.\n\
        \               \n\
        \                }\n\
        \           {-  Do53 alone.\n\
        \               \n\
        \                }\n\
        \           {-  DoH alone.\n\
        \               \n\
        \                }\n\
        \           {-  None, which is treated as Do53.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \     You can't change the protocol of an inbound endpoint directly from only Do53 to only \
         DoH, or DoH-FIPS. This is to prevent a sudden disruption to incoming traffic that relies \
         on Do53. To change the protocol from Do53 to DoH, or DoH-FIPS, you must first enable both \
         Do53 and DoH, or Do53 and DoH-FIPS, to make sure that all incoming traffic has \
         transferred to using the DoH protocol, or DoH-FIPS, and then remove the Do53.\n\
        \    \n\
        \     "]
  update_ip_addresses : update_ip_addresses option;
      [@ocaml.doc
        " Specifies the IPv6 address when you update the Resolver endpoint from IPv4 to \
         dual-stack. If you don't specify an IPv6 address, one will be automatically chosen from \
         your subnet. \n"]
  resolver_endpoint_type : resolver_endpoint_type option;
      [@ocaml.doc
        " Specifies the endpoint type for what type of IP address the endpoint uses to forward DNS \
         queries. \n\n\
        \ Updating to [IPV6] type isn't currently supported.\n\
        \ "]
  name : name option; [@ocaml.doc "The name of the Resolver endpoint that you want to update.\n"]
  resolver_endpoint_id : resource_id;
      [@ocaml.doc "The ID of the Resolver endpoint that you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec resolver_dnssec_validation_status =
  | UseLocalResourceSetting [@ocaml.doc ""]
  | UpdateToUseLocalResourceSetting [@ocaml.doc ""]
  | Disabled [@ocaml.doc ""]
  | Disabling [@ocaml.doc ""]
  | Enabled [@ocaml.doc ""]
  | Enabling [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resolver_dnssec_config = {
  validation_status : resolver_dnssec_validation_status option;
      [@ocaml.doc
        "The validation status for a DNSSEC configuration. The status can be one of the following:\n\n\
        \ {ul\n\
        \       {-   {b ENABLING:} DNSSEC validation is being enabled but is not complete.\n\
        \           \n\
        \            }\n\
        \       {-   {b ENABLED:} DNSSEC validation is enabled.\n\
        \           \n\
        \            }\n\
        \       {-   {b DISABLING:} DNSSEC validation is being disabled but is not complete.\n\
        \           \n\
        \            }\n\
        \       {-   {b DISABLED} DNSSEC validation is disabled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id option;
      [@ocaml.doc
        "The ID of the virtual private cloud (VPC) that you're configuring the DNSSEC validation \
         status for.\n"]
  owner_id : account_id option;
      [@ocaml.doc
        "The owner account ID of the virtual private cloud (VPC) for a configuration for DNSSEC \
         validation.\n"]
  id : resource_id option; [@ocaml.doc "The ID for a configuration for DNSSEC validation.\n"]
}
[@@ocaml.doc
  "A complex type that contains information about a configuration for DNSSEC validation.\n"]

type nonrec update_resolver_dnssec_config_response = {
  resolver_dnssec_config : resolver_dnssec_config option;
      [@ocaml.doc "A complex type that contains settings for the specified DNSSEC configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec update_resolver_dnssec_config_request = {
  validation : validation;
      [@ocaml.doc
        "The new value that you are specifying for DNSSEC validation for the VPC. The value can be \
         [ENABLE] or [DISABLE]. Be aware that it can take time for a validation status change to \
         be completed.\n"]
  resource_id : resource_id;
      [@ocaml.doc
        "The ID of the virtual private cloud (VPC) that you're updating the DNSSEC validation \
         status for.\n"]
}
[@@ocaml.doc ""]

type nonrec resolver_autodefined_reverse_status =
  | UseLocalResourceSetting [@ocaml.doc ""]
  | UpdatingToUseLocalResourceSetting [@ocaml.doc ""]
  | Disabled [@ocaml.doc ""]
  | Disabling [@ocaml.doc ""]
  | Enabled [@ocaml.doc ""]
  | Enabling [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resolver_config = {
  autodefined_reverse : resolver_autodefined_reverse_status option;
      [@ocaml.doc
        " The status of whether or not the Resolver will create autodefined rules for reverse DNS \
         lookups. This is enabled by default. The status can be one of following:\n\n\
        \ {ul\n\
        \       {-   {b ENABLING:} Autodefined rules for reverse DNS lookups are being enabled but \
         are not complete.\n\
        \           \n\
        \            }\n\
        \       {-   {b ENABLED:} Autodefined rules for reverse DNS lookups are enabled.\n\
        \           \n\
        \            }\n\
        \       {-   {b DISABLING:} Autodefined rules for reverse DNS lookups are being disabled \
         but are not complete.\n\
        \           \n\
        \            }\n\
        \       {-   {b DISABLED:} Autodefined rules for reverse DNS lookups are disabled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  owner_id : account_id option;
      [@ocaml.doc "The owner account ID of the Amazon Virtual Private Cloud VPC.\n"]
  resource_id : resource_id option;
      [@ocaml.doc
        "The ID of the Amazon Virtual Private Cloud VPC or a Route 53 Profile that you're \
         configuring Resolver for.\n"]
  id : resource_id option; [@ocaml.doc "ID for the Resolver configuration.\n"]
}
[@@ocaml.doc "A complex type that contains information about a Resolver configuration for a VPC.\n"]

type nonrec update_resolver_config_response = {
  resolver_config : resolver_config option;
      [@ocaml.doc "An array that contains settings for the specified Resolver configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec autodefined_reverse_flag =
  | USE_LOCAL_RESOURCE_SETTING [@ocaml.doc ""]
  | DISABLE [@ocaml.doc ""]
  | ENABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_resolver_config_request = {
  autodefined_reverse_flag : autodefined_reverse_flag;
      [@ocaml.doc
        "Indicates whether or not the Resolver will create autodefined rules for reverse DNS \
         lookups. This is enabled by default. Disabling this option will also affect EC2-Classic \
         instances using ClassicLink. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-classiclink.html}ClassicLink} \
         in the {i Amazon EC2 guide}.\n\n\
        \  We are retiring EC2-Classic on August 15, 2022. We recommend that you migrate from \
         EC2-Classic to a VPC. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/vpc-migrate.html}Migrate from \
         EC2-Classic to a VPC} in the {i Amazon EC2 guide} and the blog \
         {{:http://aws.amazon.com/blogs/aws/ec2-classic-is-retiring-heres-how-to-prepare/}EC2-Classic \
         Networking is Retiring \226\128\147 Here\226\128\153s How to Prepare}.\n\
        \  \n\
        \     It can take some time for the status change to be completed.\n\
        \     \n\
        \       \n\
        \       "]
  resource_id : resource_id;
      [@ocaml.doc
        "The ID of the Amazon Virtual Private Cloud VPC or a Route 53 Profile that you're \
         configuring Resolver for.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_count = int [@@ocaml.doc ""]

type nonrec outpost_resolver_name = string [@@ocaml.doc ""]

type nonrec outpost_resolver_status =
  | FAILED_DELETION [@ocaml.doc ""]
  | FAILED_CREATION [@ocaml.doc ""]
  | ACTION_NEEDED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | OPERATIONAL [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec outpost_resolver_status_message = string [@@ocaml.doc ""]

type nonrec outpost_resolver = {
  outpost_arn : outpost_arn option; [@ocaml.doc "The ARN (Amazon Resource Name) for the Outpost.\n"]
  status_message : outpost_resolver_status_message option;
      [@ocaml.doc "A detailed description of the Resolver.\n"]
  status : outpost_resolver_status option; [@ocaml.doc "Status of the Resolver.\n"]
  name : outpost_resolver_name option; [@ocaml.doc "Name of the Resolver.\n"]
  preferred_instance_type : outpost_instance_type option;
      [@ocaml.doc " The Amazon EC2 instance type. \n"]
  instance_count : instance_count option;
      [@ocaml.doc "Amazon EC2 instance count for the Resolver on the Outpost.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the Resolver on Outpost.\n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string that identifies the request that created the Resolver endpoint. The \
         [CreatorRequestId] allows failed requests to be retried without the risk of running the \
         operation twice.\n"]
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the Outpost Resolver was modified, in Unix time format and \
         Coordinated Universal Time (UTC).\n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the Outpost Resolver was created, in Unix time format and \
         Coordinated Universal Time (UTC).\n"]
  arn : arn option; [@ocaml.doc "The ARN (Amazon Resource Name) for the Resolver on an Outpost.\n"]
}
[@@ocaml.doc "A complex type that contains settings for an existing Resolver on an Outpost.\n"]

type nonrec update_outpost_resolver_response = {
  outpost_resolver : outpost_resolver option;
      [@ocaml.doc "The response to an [UpdateOutpostResolver] request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_outpost_resolver_request = {
  preferred_instance_type : outpost_instance_type option;
      [@ocaml.doc " Amazon EC2 instance type. \n"]
  instance_count : instance_count option;
      [@ocaml.doc "The Amazon EC2 instance count for a Resolver on the Outpost.\n"]
  name : outpost_resolver_name option; [@ocaml.doc "Name of the Resolver on the Outpost.\n"]
  id : resource_id; [@ocaml.doc "A unique string that identifies Resolver on an Outpost.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Fulfilling the request would cause one or more quotas to be exceeded.\n"]

type nonrec conflict_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requested state transition isn't valid. For example, you can't delete a firewall domain \
   list if it is in the process of being deleted, or you can't import domains into a domain list \
   that is in the process of being deleted.\n"]

type nonrec priority = int [@@ocaml.doc ""]

type nonrec action = ALERT [@ocaml.doc ""] | BLOCK [@ocaml.doc ""] | ALLOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec block_response =
  | OVERRIDE [@ocaml.doc ""]
  | NXDOMAIN [@ocaml.doc ""]
  | NODATA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec block_override_domain = string [@@ocaml.doc ""]

type nonrec block_override_dns_type = CNAME [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec unsigned = int [@@ocaml.doc ""]

type nonrec firewall_domain_redirection_action =
  | TRUST_REDIRECTION_DOMAIN [@ocaml.doc ""]
  | INSPECT_REDIRECTION_DOMAIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec qtype = string [@@ocaml.doc ""]

type nonrec dns_threat_protection =
  | DICTIONARY_DGA [@ocaml.doc ""]
  | DNS_TUNNELING [@ocaml.doc ""]
  | DGA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec confidence_threshold =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
[@@ocaml.doc
  "The confidence threshold for a DNS Firewall Advanced rule. One of:\n\n\
  \ {ul\n\
  \       {-   [LOW] \226\128\148 Provides the highest detection rate for threats, but also \
   increases false positives.\n\
  \           \n\
  \            }\n\
  \       {-   [MEDIUM] \226\128\148 Provides a balance between detecting threats and false \
   positives.\n\
  \           \n\
  \            }\n\
  \       {-   [HIGH] \226\128\148 Detects only the most well-corroborated threats with a low rate \
   of false positives.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec partner_value = string [@@ocaml.doc ""]

type nonrec partner_threat_protection_config = {
  partner : partner_value;
      [@ocaml.doc
        "The identifier of the partner threat-protection product, exactly as returned in the \
         [Value] field of a [FirewallRuleTypeDefinition] with [RuleType] set to \
         [PartnerThreatProtection]. The calling account must hold an active AWS Marketplace \
         subscription to this product.\n"]
}
[@@ocaml.doc
  "The configuration for a partner threat-protection rule. To enumerate the partners available in \
   your account, call [ListFirewallRuleTypes] with [RuleType] set to [PartnerThreatProtection] \
   \226\128\148 each returned [FirewallRuleTypeDefinition] includes a [SubscriptionInfo] \
   identifying the AWS Marketplace product that backs it.\n"]

type nonrec firewall_advanced_content_category_value = string [@@ocaml.doc ""]

type nonrec firewall_advanced_content_category_config = {
  category : firewall_advanced_content_category_value;
      [@ocaml.doc
        "The content category identifier. To retrieve the list of available content categories, \
         call [ListFirewallRuleTypes] with [RuleType] set to [FirewallAdvancedContentCategory].\n"]
}
[@@ocaml.doc
  "The configuration for a content category-based filtering rule. This specifies which content \
   category to use for DNS query evaluation.\n"]

type nonrec firewall_advanced_threat_category_value = string [@@ocaml.doc ""]

type nonrec firewall_advanced_threat_category_config = {
  category : firewall_advanced_threat_category_value;
      [@ocaml.doc
        "The threat category identifier. To retrieve the list of available threat categories, call \
         [ListFirewallRuleTypes] with [RuleType] set to [FirewallAdvancedThreatCategory].\n"]
}
[@@ocaml.doc
  "The configuration for a threat category-based filtering rule. This specifies which threat \
   category to use for DNS query evaluation.\n"]

type nonrec dns_threat_protection_rule_type_value = string [@@ocaml.doc ""]

type nonrec dns_threat_protection_rule_type_config = {
  confidence_threshold : confidence_threshold;
      [@ocaml.doc
        "The confidence threshold for DNS Firewall Advanced. You must provide this value when you \
         create or update a DNS Firewall Advanced rule. The confidence level values mean:\n\n\
        \ {ul\n\
        \       {-   [LOW]: Provides the highest detection rate for threats, but also increases \
         false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: Provides a balance between detecting threats and false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [HIGH]: Detects only the most well corroborated threats with a low rate of \
         false positives.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  value : dns_threat_protection_rule_type_value;
      [@ocaml.doc
        "The type of DNS threat protection. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [DGA]: Domain generation algorithms detection. DGAs are used by attackers to \
         generate a large number of domains to launch malware attacks.\n\
        \           \n\
        \            }\n\
        \       {-   [DNS_TUNNELING]: DNS tunneling detection. DNS tunneling is used by attackers \
         to exfiltrate data from the client by using the DNS tunnel without making a network \
         connection to the client.\n\
        \           \n\
        \            }\n\
        \       {-   [DICTIONARY_DGA]: Dictionary-based domain generation algorithms detection. \
         Dictionary DGAs use wordlists to generate domains that appear more legitimate, making \
         them harder to detect than traditional DGAs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The configuration for a DNS threat protection rule type within the rule type framework.\n"]

type nonrec firewall_rule_type = {
  dns_threat_protection : dns_threat_protection_rule_type_config option;
      [@ocaml.doc
        "Configures the rule to match a built-in DNS Firewall Advanced threat detector \
         \226\128\148 [DGA], [DNS_TUNNELING], or [DICTIONARY_DGA]. See \
         [DnsThreatProtectionRuleTypeConfig].\n"]
  firewall_advanced_threat_category : firewall_advanced_threat_category_config option;
      [@ocaml.doc
        "Configures the rule to match an AWS-managed advanced threat category (for example, \
         [PHISHING]). See [FirewallAdvancedThreatCategoryConfig].\n"]
  firewall_advanced_content_category : firewall_advanced_content_category_config option;
      [@ocaml.doc
        "Configures the rule to match an AWS-managed content category (for example, \
         [VIOLENCE_AND_HATE_SPEECH]). See [FirewallAdvancedContentCategoryConfig].\n"]
  partner_threat_protection : partner_threat_protection_config option;
      [@ocaml.doc
        "Configures the rule to match a third-party threat feed delivered through AWS Marketplace. \
         The calling account must hold an active subscription to the partner product named in \
         [Partner]; if the subscription is missing or revoked, the rule is created with [Status] \
         [CREATION_FAILED] and cannot be modified \226\128\148 only deleted. See \
         [PartnerThreatProtectionConfig].\n"]
}
[@@ocaml.doc
  "The rule-type configuration for a DNS Firewall rule. [FirewallRuleType] is a tagged union \
   \226\128\148 exactly one member must be set per rule, and the member determines what the rule \
   matches against. This shape is mutually exclusive with the top-level [FirewallDomainListId] and \
   [DnsThreatProtection] fields on [CreateFirewallRule] and [UpdateFirewallRule].\n\n\
  \ Call [ListFirewallRuleTypes] to discover which rule-type variants and which values within each \
   variant are available in your account and Region.\n\
  \ "]

type nonrec firewall_rule_status = string [@@ocaml.doc ""]

type nonrec firewall_rule_status_message = string [@@ocaml.doc ""]

type nonrec firewall_rule = {
  status_message : firewall_rule_status_message option;
      [@ocaml.doc
        "An additional message about the rule's lifecycle state. Populated when [Status] is \
         [CREATION_FAILED] to describe why provisioning failed.\n"]
  status : firewall_rule_status option;
      [@ocaml.doc
        "The lifecycle state of the firewall rule. Possible values:\n\n\
        \ {ul\n\
        \       {-   [CREATING] \226\128\148 DNS Firewall is provisioning the rule. Rules created \
         with the [PartnerThreatProtection] rule type begin in this state while DNS Firewall \
         verifies the calling account's AWS Marketplace entitlement.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE] \226\128\148 The rule is provisioned and enforcing matches.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATION_FAILED] \226\128\148 Provisioning failed. [StatusMessage] contains \
         a human-readable reason. A rule in this state is immutable: [UpdateFirewallRule] rejects \
         the request, and the rule must be removed with [DeleteFirewallRule].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For rules that do not require asynchronous provisioning, this field may be absent.\n\
        \   "]
  firewall_rule_type : firewall_rule_type option;
      [@ocaml.doc
        "The rule type configuration for the firewall rule. This is a tagged union \226\128\148 \
         exactly one of its members will be populated. Possible members are:\n\n\
        \ {ul\n\
        \       {-   [FirewallAdvancedContentCategory] \226\128\148 an AWS-managed content \
         category (for example, [VIOLENCE_AND_HATE_SPEECH]).\n\
        \           \n\
        \            }\n\
        \       {-   [FirewallAdvancedThreatCategory] \226\128\148 an AWS-managed advanced threat \
         category (for example, [PHISHING]).\n\
        \           \n\
        \            }\n\
        \       {-   [DnsThreatProtection] \226\128\148 a built-in DNS Firewall Advanced threat \
         detector ([DGA], [DNS_TUNNELING], or [DICTIONARY_DGA]).\n\
        \           \n\
        \            }\n\
        \       {-   [PartnerThreatProtection] \226\128\148 a third-party threat feed delivered \
         through AWS Marketplace.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   To enumerate the values supported in your account, call [ListFirewallRuleTypes].\n\
        \   "]
  confidence_threshold : confidence_threshold option;
      [@ocaml.doc
        " The confidence threshold for DNS Firewall Advanced. You must provide this value when you \
         create a DNS Firewall Advanced rule. The confidence level values mean: \n\n\
        \ {ul\n\
        \       {-   [LOW]: Provides the highest detection rate for threats, but also increases \
         false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: Provides a balance between detecting threats and false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [HIGH]: Detects only the most well corroborated threats with a low rate of \
         false positives. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dns_threat_protection : dns_threat_protection option;
      [@ocaml.doc
        " The type of the DNS Firewall Advanced rule. Valid values are: \n\n\
        \ {ul\n\
        \       {-   [DGA]: Domain generation algorithms detection. DGAs are used by attackers to \
         generate a large number of domains to launch malware attacks.\n\
        \           \n\
        \            }\n\
        \       {-   [DNS_TUNNELING]: DNS tunneling detection. DNS tunneling is used by attackers \
         to exfiltrate data from the client by using the DNS tunnel without making a network \
         connection to the client.\n\
        \           \n\
        \            }\n\
        \       {-   [DICTIONARY_DGA]: Dictionary-based domain generation algorithms detection. \
         Dictionary DGAs use wordlists to generate domains that appear more legitimate, making \
         them harder to detect than traditional DGAs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  qtype : qtype option;
      [@ocaml.doc
        " The DNS query type you want the rule to evaluate. Allowed values are; \n\n\
        \ {ul\n\
        \       {-   A: Returns an IPv4 address.\n\
        \           \n\
        \            }\n\
        \       {-  AAAA: Returns an Ipv6 address.\n\
        \           \n\
        \            }\n\
        \       {-  CAA: Restricts CAs that can create SSL/TLS certifications for the domain.\n\
        \           \n\
        \            }\n\
        \       {-  CNAME: Returns another domain name.\n\
        \           \n\
        \            }\n\
        \       {-  DS: Record that identifies the DNSSEC signing key of a delegated zone.\n\
        \           \n\
        \            }\n\
        \       {-  MX: Specifies mail servers.\n\
        \           \n\
        \            }\n\
        \       {-  NAPTR: Regular-expression-based rewriting of domain names.\n\
        \           \n\
        \            }\n\
        \       {-  NS: Authoritative name servers.\n\
        \           \n\
        \            }\n\
        \       {-  PTR: Maps an IP address to a domain name.\n\
        \           \n\
        \            }\n\
        \       {-  SOA: Start of authority record for the zone.\n\
        \           \n\
        \            }\n\
        \       {-  SPF: Lists the servers authorized to send emails from a domain.\n\
        \           \n\
        \            }\n\
        \       {-  SRV: Application specific values that identify servers.\n\
        \           \n\
        \            }\n\
        \       {-  TXT: Verifies email senders and application-specific values.\n\
        \           \n\
        \            }\n\
        \       {-  A query type you define by using the DNS type ID, for example 28 for AAAA. The \
         values must be defined as TYPENUMBER, where the NUMBER can be 1-65534, for example, \
         TYPE28. For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_DNS_record_types}List of DNS record types}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  firewall_domain_redirection_action : firewall_domain_redirection_action option;
      [@ocaml.doc
        " How you want the the rule to evaluate DNS redirection in the DNS redirection chain, such \
         as CNAME or DNAME. \n\n\
        \  [INSPECT_REDIRECTION_DOMAIN]: (Default) inspects all domains in the redirection chain. \
         The individual domains in the redirection chain must be added to the domain list.\n\
        \ \n\
        \   [TRUST_REDIRECTION_DOMAIN]: Inspects only the first domain in the redirection chain. \
         You don't need to add the subsequent domains in the domain in the redirection list to the \
         domain list.\n\
        \  "]
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the rule was last modified, in Unix time format and Coordinated \
         Universal Time (UTC).\n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the rule was created, in Unix time format and Coordinated \
         Universal Time (UTC). \n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string defined by you to identify the request. This allows you to retry failed \
         requests without the risk of executing the operation twice. This can be any unique \
         string, for example, a timestamp. \n"]
  block_override_ttl : unsigned option;
      [@ocaml.doc
        "The recommended amount of time, in seconds, for the DNS resolver or web browser to cache \
         the provided override record. Used for the rule action [BLOCK] with a [BlockResponse] \
         setting of [OVERRIDE].\n"]
  block_override_dns_type : block_override_dns_type option;
      [@ocaml.doc
        "The DNS record's type. This determines the format of the record value that you provided \
         in [BlockOverrideDomain]. Used for the rule action [BLOCK] with a [BlockResponse] setting \
         of [OVERRIDE].\n"]
  block_override_domain : block_override_domain option;
      [@ocaml.doc
        "The custom DNS record to send back in response to the query. Used for the rule action \
         [BLOCK] with a [BlockResponse] setting of [OVERRIDE].\n"]
  block_response : block_response option;
      [@ocaml.doc
        "The way that you want DNS Firewall to block the request. Used for the rule action setting \
         [BLOCK].\n\n\
        \ {ul\n\
        \       {-   [NODATA] - Respond indicating that the query was successful, but no response \
         is available for it.\n\
        \           \n\
        \            }\n\
        \       {-   [NXDOMAIN] - Respond indicating that the domain name that's in the query \
         doesn't exist.\n\
        \           \n\
        \            }\n\
        \       {-   [OVERRIDE] - Provide a custom override in the response. This option requires \
         custom handling details in the rule's [BlockOverride*] settings. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  action : action option;
      [@ocaml.doc
        "The action that DNS Firewall should take on a DNS query when it matches one of the \
         domains in the rule's domain list, or a threat in a DNS Firewall Advanced rule:\n\n\
        \ {ul\n\
        \       {-   [ALLOW] - Permit the request to go through. Not available for DNS Firewall \
         Advanced rules.\n\
        \           \n\
        \            }\n\
        \       {-   [ALERT] - Permit the request to go through but send an alert to the logs.\n\
        \           \n\
        \            }\n\
        \       {-   [BLOCK] - Disallow the request. If this is specified, additional handling \
         details are provided in the rule's [BlockResponse] setting. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  priority : priority option;
      [@ocaml.doc
        "The priority of the rule in the rule group. This value must be unique within the rule \
         group. DNS Firewall processes the rules in a rule group by order of priority, starting \
         from the lowest setting.\n"]
  name : name option; [@ocaml.doc "The name of the rule. \n"]
  firewall_threat_protection_id : resource_id option;
      [@ocaml.doc " ID of the DNS Firewall Advanced rule. \n"]
  firewall_domain_list_id : resource_id option;
      [@ocaml.doc "The ID of the domain list that's used in the rule. \n"]
  firewall_rule_group_id : resource_id option;
      [@ocaml.doc "The unique identifier of the Firewall rule group of the rule. \n"]
}
[@@ocaml.doc "A single firewall rule in a rule group.\n"]

type nonrec update_firewall_rule_response = {
  firewall_rule : firewall_rule option; [@ocaml.doc "The firewall rule that you just updated. \n"]
}
[@@ocaml.doc ""]

type nonrec block_override_ttl = int [@@ocaml.doc ""]

type nonrec update_firewall_rule_request = {
  firewall_rule_type : firewall_rule_type option;
      [@ocaml.doc
        "The rule type configuration for the firewall rule. This is a tagged union \226\128\148 \
         set exactly one of its members. This setting is mutually exclusive with the top-level \
         [FirewallDomainListId] and [DnsThreatProtection] fields. Use one of:\n\n\
        \ {ul\n\
        \       {-   [FirewallAdvancedContentCategory] \226\128\148 match an AWS-managed content \
         category (for example, [VIOLENCE_AND_HATE_SPEECH]).\n\
        \           \n\
        \            }\n\
        \       {-   [FirewallAdvancedThreatCategory] \226\128\148 match an AWS-managed advanced \
         threat category (for example, [PHISHING]).\n\
        \           \n\
        \            }\n\
        \       {-   [DnsThreatProtection] \226\128\148 match a built-in DNS Firewall Advanced \
         threat detector ([DGA], [DNS_TUNNELING], or [DICTIONARY_DGA]).\n\
        \           \n\
        \            }\n\
        \       {-   [PartnerThreatProtection] \226\128\148 match a third-party threat feed \
         delivered through AWS Marketplace. The selected partner must be an active subscription on \
         the calling account.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   To enumerate the values supported in your account, call [ListFirewallRuleTypes].\n\
        \   "]
  confidence_threshold : confidence_threshold option;
      [@ocaml.doc
        " The confidence threshold for DNS Firewall Advanced. You must provide this value when you \
         create a DNS Firewall Advanced rule. The confidence level values mean: \n\n\
        \ {ul\n\
        \       {-   [LOW]: Provides the highest detection rate for threats, but also increases \
         false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: Provides a balance between detecting threats and false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [HIGH]: Detects only the most well corroborated threats with a low rate of \
         false positives. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dns_threat_protection : dns_threat_protection option;
      [@ocaml.doc
        " The type of the DNS Firewall Advanced rule. This setting is mutually exclusive with \
         [FirewallDomainListId] and [FirewallRuleType]. Valid values are: \n\n\
        \ {ul\n\
        \       {-   [DGA]: Domain generation algorithms detection. DGAs are used by attackers to \
         generate a large number of domains to launch malware attacks.\n\
        \           \n\
        \            }\n\
        \       {-   [DNS_TUNNELING]: DNS tunneling detection. DNS tunneling is used by attackers \
         to exfiltrate data from the client by using the DNS tunnel without making a network \
         connection to the client.\n\
        \           \n\
        \            }\n\
        \       {-   [DICTIONARY_DGA]: Dictionary-based domain generation algorithms detection. \
         Dictionary DGAs use wordlists to generate domains that appear more legitimate, making \
         them harder to detect than traditional DGAs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  qtype : qtype option;
      [@ocaml.doc
        " The DNS query type you want the rule to evaluate. Allowed values are; \n\n\
        \ {ul\n\
        \       {-   A: Returns an IPv4 address.\n\
        \           \n\
        \            }\n\
        \       {-  AAAA: Returns an Ipv6 address.\n\
        \           \n\
        \            }\n\
        \       {-  CAA: Restricts CAs that can create SSL/TLS certifications for the domain.\n\
        \           \n\
        \            }\n\
        \       {-  CNAME: Returns another domain name.\n\
        \           \n\
        \            }\n\
        \       {-  DS: Record that identifies the DNSSEC signing key of a delegated zone.\n\
        \           \n\
        \            }\n\
        \       {-  MX: Specifies mail servers.\n\
        \           \n\
        \            }\n\
        \       {-  NAPTR: Regular-expression-based rewriting of domain names.\n\
        \           \n\
        \            }\n\
        \       {-  NS: Authoritative name servers.\n\
        \           \n\
        \            }\n\
        \       {-  PTR: Maps an IP address to a domain name.\n\
        \           \n\
        \            }\n\
        \       {-  SOA: Start of authority record for the zone.\n\
        \           \n\
        \            }\n\
        \       {-  SPF: Lists the servers authorized to send emails from a domain.\n\
        \           \n\
        \            }\n\
        \       {-  SRV: Application specific values that identify servers.\n\
        \           \n\
        \            }\n\
        \       {-  TXT: Verifies email senders and application-specific values.\n\
        \           \n\
        \            }\n\
        \       {-  A query type you define by using the DNS type ID, for example 28 for AAAA. The \
         values must be defined as TYPENUMBER, where the NUMBER can be 1-65534, for example, \
         TYPE28. For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_DNS_record_types}List of DNS record types}.\n\
        \           \n\
        \             If you set up a firewall BLOCK rule with action NXDOMAIN on query type \
         equals AAAA, this action will not be applied to synthetic IPv6 addresses generated when \
         DNS64 is enabled. \n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  firewall_domain_redirection_action : firewall_domain_redirection_action option;
      [@ocaml.doc
        " How you want the the rule to evaluate DNS redirection in the DNS redirection chain, such \
         as CNAME or DNAME. \n\n\
        \  [INSPECT_REDIRECTION_DOMAIN]: (Default) inspects all domains in the redirection chain. \
         The individual domains in the redirection chain must be added to the domain list.\n\
        \ \n\
        \   [TRUST_REDIRECTION_DOMAIN]: Inspects only the first domain in the redirection chain. \
         You don't need to add the subsequent domains in the domain in the redirection list to the \
         domain list.\n\
        \  "]
  name : name option; [@ocaml.doc "The name of the rule.\n"]
  block_override_ttl : block_override_ttl option;
      [@ocaml.doc
        "The recommended amount of time, in seconds, for the DNS resolver or web browser to cache \
         the provided override record. Used for the rule action [BLOCK] with a [BlockResponse] \
         setting of [OVERRIDE].\n"]
  block_override_dns_type : block_override_dns_type option;
      [@ocaml.doc
        "The DNS record's type. This determines the format of the record value that you provided \
         in [BlockOverrideDomain]. Used for the rule action [BLOCK] with a [BlockResponse] setting \
         of [OVERRIDE].\n"]
  block_override_domain : block_override_domain option;
      [@ocaml.doc
        "The custom DNS record to send back in response to the query. Used for the rule action \
         [BLOCK] with a [BlockResponse] setting of [OVERRIDE].\n"]
  block_response : block_response option;
      [@ocaml.doc
        "The way that you want DNS Firewall to block the request. Used for the rule action setting \
         [BLOCK].\n\n\
        \ {ul\n\
        \       {-   [NODATA] - Respond indicating that the query was successful, but no response \
         is available for it.\n\
        \           \n\
        \            }\n\
        \       {-   [NXDOMAIN] - Respond indicating that the domain name that's in the query \
         doesn't exist.\n\
        \           \n\
        \            }\n\
        \       {-   [OVERRIDE] - Provide a custom override in the response. This option requires \
         custom handling details in the rule's [BlockOverride*] settings. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  action : action option;
      [@ocaml.doc
        "The action that DNS Firewall should take on a DNS query when it matches one of the \
         domains in the rule's domain list, or a threat in a DNS Firewall Advanced rule:\n\n\
        \ {ul\n\
        \       {-   [ALLOW] - Permit the request to go through. Not available for DNS Firewall \
         Advanced rules.\n\
        \           \n\
        \            }\n\
        \       {-   [ALERT] - Permit the request to go through but send an alert to the logs.\n\
        \           \n\
        \            }\n\
        \       {-   [BLOCK] - Disallow the request. This option requires additional details in \
         the rule's [BlockResponse]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  priority : priority option;
      [@ocaml.doc
        "The setting that determines the processing order of the rule in the rule group. DNS \
         Firewall processes the rules in a rule group by order of priority, starting from the \
         lowest setting.\n\n\
        \ You must specify a unique priority for each rule in a rule group. To make it easier to \
         insert rules later, leave space between the numbers, for example, use 100, 200, and so \
         on. You can change the priority setting for the rules in a rule group at any time.\n\
        \ "]
  firewall_threat_protection_id : resource_id option;
      [@ocaml.doc " The DNS Firewall Advanced rule ID. \n"]
  firewall_domain_list_id : resource_id option;
      [@ocaml.doc "The ID of the domain list to use in the rule. \n"]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc "The unique identifier of the firewall rule group for the rule. \n"]
}
[@@ocaml.doc ""]

type nonrec mutation_protection_status = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_principle = string [@@ocaml.doc ""]

type nonrec firewall_rule_group_association_status =
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec firewall_rule_group_association = {
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the association was last modified, in Unix time format and \
         Coordinated Universal Time (UTC).\n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the association was created, in Unix time format and Coordinated \
         Universal Time (UTC). \n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string defined by you to identify the request. This allows you to retry failed \
         requests without the risk of running the operation twice. This can be any unique string, \
         for example, a timestamp. \n"]
  status_message : status_message option;
      [@ocaml.doc "Additional information about the status of the response, if available.\n"]
  status : firewall_rule_group_association_status option;
      [@ocaml.doc "The current status of the association.\n"]
  managed_owner_name : service_principle option;
      [@ocaml.doc
        "The owner of the association, used only for associations that are not managed by you. If \
         you use Firewall Manager to manage your DNS Firewalls, then this reports Firewall Manager \
         as the managed owner.\n"]
  mutation_protection : mutation_protection_status option;
      [@ocaml.doc
        "If enabled, this setting disallows modification or removal of the association, to help \
         prevent against accidentally altering DNS firewall protections. \n"]
  priority : priority option;
      [@ocaml.doc
        "The setting that determines the processing order of the rule group among the rule groups \
         that are associated with a single VPC. DNS Firewall filters VPC traffic starting from \
         rule group with the lowest numeric priority setting. \n"]
  name : name option; [@ocaml.doc "The name of the association.\n"]
  vpc_id : resource_id option;
      [@ocaml.doc "The unique identifier of the VPC that is associated with the rule group. \n"]
  firewall_rule_group_id : resource_id option;
      [@ocaml.doc "The unique identifier of the firewall rule group. \n"]
  arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall rule group association.\n"]
  id : resource_id option; [@ocaml.doc "The identifier for the association.\n"]
}
[@@ocaml.doc
  "An association between a firewall rule group and a VPC, which enables DNS filtering for the VPC. \n"]

type nonrec update_firewall_rule_group_association_response = {
  firewall_rule_group_association : firewall_rule_group_association option;
      [@ocaml.doc "The association that you just updated. \n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_rule_group_association_request = {
  name : name option; [@ocaml.doc "The name of the rule group association.\n"]
  mutation_protection : mutation_protection_status option;
      [@ocaml.doc
        "If enabled, this setting disallows modification or removal of the association, to help \
         prevent against accidentally altering DNS firewall protections. \n"]
  priority : priority option;
      [@ocaml.doc
        "The setting that determines the processing order of the rule group among the rule groups \
         that you associate with the specified VPC. DNS Firewall filters VPC traffic starting from \
         the rule group with the lowest numeric priority setting. \n\n\
        \ You must specify a unique priority for each rule group that you associate with a single \
         VPC. To make it easier to insert rule groups later, leave space between the numbers, for \
         example, use 100, 200, and so on. You can change the priority setting for a rule group \
         association after you create it.\n\
        \ "]
  firewall_rule_group_association_id : resource_id;
      [@ocaml.doc "The identifier of the [FirewallRuleGroupAssociation]. \n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_rule_entry = {
  firewall_rule_type : firewall_rule_type option;
      [@ocaml.doc
        "The rule type configuration for the firewall rule. This is a tagged union \226\128\148 \
         set exactly one of its members. This setting is mutually exclusive with the top-level \
         [FirewallDomainListId] and [DnsThreatProtection] fields. Use one of:\n\n\
        \ {ul\n\
        \       {-   [FirewallAdvancedContentCategory] \226\128\148 match an AWS-managed content \
         category (for example, [VIOLENCE_AND_HATE_SPEECH]).\n\
        \           \n\
        \            }\n\
        \       {-   [FirewallAdvancedThreatCategory] \226\128\148 match an AWS-managed advanced \
         threat category (for example, [PHISHING]).\n\
        \           \n\
        \            }\n\
        \       {-   [DnsThreatProtection] \226\128\148 match a built-in DNS Firewall Advanced \
         threat detector ([DGA], [DNS_TUNNELING], or [DICTIONARY_DGA]).\n\
        \           \n\
        \            }\n\
        \       {-   [PartnerThreatProtection] \226\128\148 match a third-party threat feed \
         delivered through AWS Marketplace. The selected partner must be an active subscription on \
         the calling account.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   To enumerate the values supported in your account, call [ListFirewallRuleTypes].\n\
        \   "]
  confidence_threshold : confidence_threshold option;
      [@ocaml.doc
        "The confidence threshold for DNS Firewall Advanced. You must provide this value when you \
         create or update a DNS Firewall Advanced rule. The confidence level values mean:\n\n\
        \ {ul\n\
        \       {-   [LOW]: Provides the highest detection rate for threats, but also increases \
         false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: Provides a balance between detecting threats and false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [HIGH]: Detects only the most well corroborated threats with a low rate of \
         false positives.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dns_threat_protection : dns_threat_protection option;
      [@ocaml.doc
        "The type of the DNS Firewall Advanced rule. This setting is mutually exclusive with \
         [FirewallDomainListId] and [FirewallRuleType]. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [DGA]: Domain generation algorithms detection. DGAs are used by attackers to \
         generate a large number of domains to launch malware attacks.\n\
        \           \n\
        \            }\n\
        \       {-   [DNS_TUNNELING]: DNS tunneling detection. DNS tunneling is used by attackers \
         to exfiltrate data from the client by using the DNS tunnel without making a network \
         connection to the client.\n\
        \           \n\
        \            }\n\
        \       {-   [DICTIONARY_DGA]: Dictionary-based domain generation algorithms detection. \
         Dictionary DGAs use wordlists to generate domains that appear more legitimate, making \
         them harder to detect than traditional DGAs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  qtype : qtype option;
      [@ocaml.doc
        "The DNS query type you want the rule to evaluate. Allowed values are:\n\n\
        \ {ul\n\
        \       {-  A: Returns an IPv4 address.\n\
        \           \n\
        \            }\n\
        \       {-  AAAA: Returns an IPv6 address.\n\
        \           \n\
        \            }\n\
        \       {-  CAA: Restricts CAs that can create SSL/TLS certifications for the domain.\n\
        \           \n\
        \            }\n\
        \       {-  CNAME: Returns another domain name.\n\
        \           \n\
        \            }\n\
        \       {-  DS: Record that identifies the DNSSEC signing key of a delegated zone.\n\
        \           \n\
        \            }\n\
        \       {-  MX: Specifies mail servers.\n\
        \           \n\
        \            }\n\
        \       {-  NAPTR: Regular-expression-based rewriting of domain names.\n\
        \           \n\
        \            }\n\
        \       {-  NS: Authoritative name servers.\n\
        \           \n\
        \            }\n\
        \       {-  PTR: Maps an IP address to a domain name.\n\
        \           \n\
        \            }\n\
        \       {-  SOA: Start of authority record for the zone.\n\
        \           \n\
        \            }\n\
        \       {-  SPF: Lists the servers authorized to send emails from a domain.\n\
        \           \n\
        \            }\n\
        \       {-  SRV: Application specific values that identify servers.\n\
        \           \n\
        \            }\n\
        \       {-  TXT: Verifies email senders and application-specific values.\n\
        \           \n\
        \            }\n\
        \       {-  A query type you define by using the DNS type ID, for example 28 for AAAA. The \
         values must be defined as TYPENUMBER, where the NUMBER can be 1-65534, for example, \
         TYPE28. For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_DNS_record_types}List of DNS record types}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  firewall_domain_redirection_action : firewall_domain_redirection_action option;
      [@ocaml.doc
        "How you want the rule to evaluate DNS redirection in the DNS redirection chain, such as \
         CNAME or DNAME.\n\n\
        \  [INSPECT_REDIRECTION_DOMAIN]: (Default) inspects all domains in the redirection chain. \
         The individual domains in the redirection chain must be added to the domain list.\n\
        \ \n\
        \   [TRUST_REDIRECTION_DOMAIN]: Inspects only the first domain in the redirection chain. \
         You don't need to add the subsequent domains in the redirection list to the domain list.\n\
        \  "]
  name : name option; [@ocaml.doc "The name of the rule.\n"]
  block_override_ttl : block_override_ttl option;
      [@ocaml.doc
        "The recommended amount of time, in seconds, for the DNS resolver or web browser to cache \
         the provided override record. Used for the rule action [BLOCK] with a [BlockResponse] \
         setting of [OVERRIDE].\n\n\
        \ This setting is required if the [BlockResponse] setting is [OVERRIDE].\n\
        \ "]
  block_override_dns_type : block_override_dns_type option;
      [@ocaml.doc
        "The DNS record's type. This determines the format of the record value that you provided \
         in [BlockOverrideDomain]. Used for the rule action [BLOCK] with a [BlockResponse] setting \
         of [OVERRIDE].\n"]
  block_override_domain : block_override_domain option;
      [@ocaml.doc
        "The custom DNS record to send back in response to the query. Used for the rule action \
         [BLOCK] with a [BlockResponse] setting of [OVERRIDE].\n"]
  block_response : block_response option;
      [@ocaml.doc
        "The way that you want DNS Firewall to block the request, used with the rule action \
         setting [BLOCK].\n\n\
        \ {ul\n\
        \       {-   [NODATA] - Respond indicating that the query was successful, but no response \
         is available for it.\n\
        \           \n\
        \            }\n\
        \       {-   [NXDOMAIN] - Respond indicating that the domain name that's in the query \
         doesn't exist.\n\
        \           \n\
        \            }\n\
        \       {-   [OVERRIDE] - Provide a custom override in the response. This option requires \
         custom handling details in the rule's [BlockOverride*] settings.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  action : action option;
      [@ocaml.doc
        "The action that DNS Firewall should take on a DNS query when it matches one of the \
         domains in the rule's domain list, or a threat in a DNS Firewall Advanced rule:\n\n\
        \ {ul\n\
        \       {-   [ALLOW] - Permit the request to go through. Not available for DNS Firewall \
         Advanced rules.\n\
        \           \n\
        \            }\n\
        \       {-   [ALERT] - Permit the request and send metrics and logs to CloudWatch.\n\
        \           \n\
        \            }\n\
        \       {-   [BLOCK] - Disallow the request. This option requires additional details in \
         the rule's [BlockResponse].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  priority : priority option;
      [@ocaml.doc
        "The setting that determines the processing order of the rule in the rule group. DNS \
         Firewall processes the rules in a rule group by order of priority, starting from the \
         lowest setting.\n"]
  firewall_threat_protection_id : resource_id option;
      [@ocaml.doc "The ID of the DNS Firewall Advanced rule.\n"]
  firewall_domain_list_id : resource_id option;
      [@ocaml.doc
        "The ID of the domain list to use in the rule. This setting is mutually exclusive with \
         [DnsThreatProtection] and [FirewallRuleType].\n"]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc "The unique identifier of the firewall rule group for the rule.\n"]
}
[@@ocaml.doc "The details for updating a single firewall rule in a batch operation.\n"]

type nonrec update_firewall_rule_entries = update_firewall_rule_entry list [@@ocaml.doc ""]

type nonrec firewall_domain_list_status =
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | IMPORTING [@ocaml.doc ""]
  | COMPLETE_IMPORT_FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_firewall_domains_response = {
  status_message : status_message option;
      [@ocaml.doc "Additional information about the status of the list, if available.\n"]
  status : firewall_domain_list_status option;
      [@ocaml.doc "Status of the [UpdateFirewallDomains] request.\n"]
  name : name option; [@ocaml.doc "The name of the domain list. \n"]
  id : resource_id option;
      [@ocaml.doc "The ID of the firewall domain list that DNS Firewall just updated.\n"]
}
[@@ocaml.doc ""]

type nonrec firewall_domain_update_operation =
  | REPLACE [@ocaml.doc ""]
  | REMOVE [@ocaml.doc ""]
  | ADD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec firewall_domain_name = string [@@ocaml.doc ""]

type nonrec firewall_domains = firewall_domain_name list [@@ocaml.doc ""]

type nonrec update_firewall_domains_request = {
  domains : firewall_domains;
      [@ocaml.doc
        "A list of domains to use in the update operation.\n\n\
        \  There is a limit of 1000 domains per request.\n\
        \  \n\
        \    Each domain specification in your domain list must satisfy the following requirements: \n\
        \    \n\
        \     {ul\n\
        \           {-  It can optionally start with [*] (asterisk).\n\
        \               \n\
        \                }\n\
        \           {-  With the exception of the optional starting asterisk, it must only contain \
         the following characters: [A-Z], [a-z], [0-9], [-] (hyphen).\n\
        \               \n\
        \                }\n\
        \           {-  It must be from 1-255 characters in length. \n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  operation : firewall_domain_update_operation;
      [@ocaml.doc
        "What you want DNS Firewall to do with the domains that you are providing: \n\n\
        \ {ul\n\
        \       {-   [ADD] - Add the domains to the ones that are already in the domain list. \n\
        \           \n\
        \            }\n\
        \       {-   [REMOVE] - Search the domain list for the domains and remove them from the \
         list.\n\
        \           \n\
        \            }\n\
        \       {-   [REPLACE] - Update the domain list to exactly match the list that you are \
         providing. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  firewall_domain_list_id : resource_id;
      [@ocaml.doc "The ID of the domain list whose domains you want to update. \n"]
}
[@@ocaml.doc ""]

type nonrec firewall_fail_open_status =
  | USE_LOCAL_RESOURCE_SETTING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec firewall_config = {
  firewall_fail_open : firewall_fail_open_status option;
      [@ocaml.doc
        "Determines how DNS Firewall operates during failures, for example when all traffic that \
         is sent to DNS Firewall fails to receive a reply. \n\n\
        \ {ul\n\
        \       {-  By default, fail open is disabled, which means the failure mode is closed. \
         This approach favors security over availability. DNS Firewall returns a failure error \
         when it is unable to properly evaluate a query. \n\
        \           \n\
        \            }\n\
        \       {-  If you enable this option, the failure mode is open. This approach favors \
         availability over security. DNS Firewall allows queries to proceed if it is unable to \
         properly evaluate them. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   This behavior is only enforced for VPCs that have at least one DNS Firewall rule group \
         association. \n\
        \   "]
  owner_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID of the owner of the VPC that this firewall \
         configuration applies to.\n"]
  resource_id : resource_id option;
      [@ocaml.doc "The ID of the VPC that this firewall configuration applies to.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the firewall configuration.\n"]
}
[@@ocaml.doc
  "Configuration of the firewall behavior provided by DNS Firewall for a single VPC from Amazon \
   Virtual Private Cloud (Amazon VPC). \n"]

type nonrec update_firewall_config_response = {
  firewall_config : firewall_config option;
      [@ocaml.doc
        "Configuration of the firewall behavior provided by DNS Firewall for a single VPC. \n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_config_request = {
  firewall_fail_open : firewall_fail_open_status;
      [@ocaml.doc
        "Determines how Route 53 Resolver handles queries during failures, for example when all \
         traffic that is sent to DNS Firewall fails to receive a reply. \n\n\
        \ {ul\n\
        \       {-  By default, fail open is disabled, which means the failure mode is closed. \
         This approach favors security over availability. DNS Firewall blocks queries that it is \
         unable to evaluate properly. \n\
        \           \n\
        \            }\n\
        \       {-  If you enable this option, the failure mode is open. This approach favors \
         availability over security. DNS Firewall allows queries to proceed if it is unable to \
         properly evaluate them. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   This behavior is only enforced for VPCs that have at least one DNS Firewall rule group \
         association. \n\
        \   "]
  resource_id : resource_id; [@ocaml.doc "The ID of the VPC that the configuration is for.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc "The tags that you want to remove to the specified resource.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the resource that you want to remove tags from. To get \
         the ARN for a resource, use the applicable [Get] or [List] command: \n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html}GetResolverEndpoint} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRule.html}GetResolverRule} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRuleAssociation.html}GetResolverRuleAssociation} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html}ListResolverEndpoints} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html}ListResolverRuleAssociations} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html}ListResolverRules} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec unknown_resource_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource doesn't exist.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "The value for the tag. For example, if [Key] is [account-id], then [Value] might be the \
         ID of the customer account that you're creating the resource for.\n"]
  key : tag_key;
      [@ocaml.doc
        "The name for the tag. For example, if you want to associate Resolver resources with the \
         account IDs of your customers for billing purposes, the value of [Key] might be \
         [account-id].\n"]
}
[@@ocaml.doc
  "One tag that you want to add to the specified resource. A tag consists of a [Key] (a name for \
   the tag) and a [Value].\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list; [@ocaml.doc "The tags that you want to add to the specified resource.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the resource that you want to add tags to. To get the \
         ARN for a resource, use the applicable [Get] or [List] command: \n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html}GetResolverEndpoint} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRule.html}GetResolverRule} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverRuleAssociation.html}GetResolverRuleAssociation} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html}ListResolverEndpoints} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html}ListResolverRuleAssociations} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html}ListResolverRules} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec invalid_tag_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified tag is invalid.\n"]

type nonrec product_id = string [@@ocaml.doc ""]

type nonrec subscription_info = {
  product_id : product_id option;
      [@ocaml.doc
        "The AWS Marketplace product identifier of the partner threat-protection product. Use this \
         value to verify or manage the calling account's subscription in AWS Marketplace.\n"]
  vendor_name : vendor_name option;
      [@ocaml.doc
        "The name of the AWS Marketplace seller (vendor) that publishes the partner \
         threat-protection product (for example, [Palo Alto Networks]).\n"]
}
[@@ocaml.doc
  "Identifies the AWS Marketplace product that backs a partner-managed rule type. Returned as part \
   of [FirewallRuleTypeDefinition] when the rule type variant requires an active customer \
   subscription to the named product.\n"]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec sort_order = Descending [@ocaml.doc ""] | Ascending [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_by_key = string [@@ocaml.doc ""]

type nonrec rule_type_value = string [@@ocaml.doc ""]

type nonrec rule_type_name = string [@@ocaml.doc ""]

type nonrec rule_type_description = string [@@ocaml.doc ""]

type nonrec invalid_policy_document = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified Resolver rule policy is invalid.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec put_resolver_rule_policy_response = {
  return_value : boolean_ option;
      [@ocaml.doc "Whether the [PutResolverRulePolicy] request was successful.\n"]
}
[@@ocaml.doc "The response to a [PutResolverRulePolicy] request.\n"]

type nonrec resolver_rule_policy = string [@@ocaml.doc ""]

type nonrec put_resolver_rule_policy_request = {
  resolver_rule_policy : resolver_rule_policy;
      [@ocaml.doc
        "An Identity and Access Management policy statement that lists the rules that you want to \
         share with another Amazon Web Services account and the operations that you want the \
         account to be able to perform. You can specify the following operations in the [Action] \
         section of the statement:\n\n\
        \ {ul\n\
        \       {-   [route53resolver:GetResolverRule] \n\
        \           \n\
        \            }\n\
        \       {-   [route53resolver:AssociateResolverRule] \n\
        \           \n\
        \            }\n\
        \       {-   [route53resolver:DisassociateResolverRule] \n\
        \           \n\
        \            }\n\
        \       {-   [route53resolver:ListResolverRules] \n\
        \           \n\
        \            }\n\
        \       {-   [route53resolver:ListResolverRuleAssociations] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   In the [Resource] section of the statement, specify the ARN for the rule that you want \
         to share with another account. Specify the same ARN that you specified in [Arn].\n\
        \   "]
  arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule that you want to share with another account.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resolver_query_log_config_policy_response = {
  return_value : boolean_ option;
      [@ocaml.doc "Whether the [PutResolverQueryLogConfigPolicy] request was successful.\n"]
}
[@@ocaml.doc "The response to a [PutResolverQueryLogConfigPolicy] request.\n"]

type nonrec resolver_query_log_config_policy = string [@@ocaml.doc ""]

type nonrec put_resolver_query_log_config_policy_request = {
  resolver_query_log_config_policy : resolver_query_log_config_policy;
      [@ocaml.doc
        "An Identity and Access Management policy statement that lists the query logging \
         configurations that you want to share with another Amazon Web Services account and the \
         operations that you want the account to be able to perform. You can specify the following \
         operations in the [Actions] section of the statement:\n\n\
        \ {ul\n\
        \       {-   [route53resolver:AssociateResolverQueryLogConfig] \n\
        \           \n\
        \            }\n\
        \       {-   [route53resolver:DisassociateResolverQueryLogConfig] \n\
        \           \n\
        \            }\n\
        \       {-   [route53resolver:ListResolverQueryLogConfigs] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   In the [Resource] section of the statement, you specify the ARNs for the query logging \
         configurations that you want to share with the account that you specified in [Arn]. \n\
        \   "]
  arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the account that you want to share rules with.\n"]
}
[@@ocaml.doc ""]

type nonrec put_firewall_rule_group_policy_response = {
  return_value : boolean_ option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec firewall_rule_group_policy = string [@@ocaml.doc ""]

type nonrec put_firewall_rule_group_policy_request = {
  firewall_rule_group_policy : firewall_rule_group_policy;
      [@ocaml.doc
        "The Identity and Access Management (Amazon Web Services IAM) policy to attach to the rule \
         group.\n"]
  arn : arn;
      [@ocaml.doc "The ARN (Amazon Resource Name) for the rule group that you want to share.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The value that you specified for [NextToken] in a [List] request isn't valid.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If more than [MaxResults] tags match the specified criteria, you can submit another \
         [ListTagsForResource] request to get the next group of results. In the next request, \
         specify the value of [NextToken] from the previous response. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "The tags that are associated with the resource that you specified in the \
         [ListTagsForResource] request.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListTagsForResource] request, omit this value.\n\n\
        \ If you have more than [MaxResults] tags, you can submit another [ListTagsForResource] \
         request to get the next group of tags for the resource. In the next request, specify the \
         value of [NextToken] from the previous response. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of tags that you want to return in the response to a \
         [ListTagsForResource] request. If you don't specify a value for [MaxResults], Resolver \
         returns up to 100 tags.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the resource that you want to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec resolver_rules = resolver_rule list [@@ocaml.doc ""]

type nonrec list_resolver_rules_response = {
  resolver_rules : resolver_rules option;
      [@ocaml.doc
        "The Resolver rules that were created using the current Amazon Web Services account and \
         that match the specified filters, if any.\n"]
  max_results : max_results option;
      [@ocaml.doc "The value that you specified for [MaxResults] in the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If more than [MaxResults] Resolver rules match the specified criteria, you can submit \
         another [ListResolverRules] request to get the next group of results. In the next \
         request, specify the value of [NextToken] from the previous response. \n"]
}
[@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec filter = {
  values : filter_values option;
      [@ocaml.doc
        "When you're using a [List] operation and you want the operation to return a subset of \
         objects, such as Resolver endpoints or Resolver rules, the value of the parameter that \
         you want to use to filter objects. For example, to list only inbound Resolver endpoints, \
         specify [Direction] for [Name] and specify [INBOUND] for [Values].\n"]
  name : filter_name option;
      [@ocaml.doc
        "The name of the parameter that you want to use to filter objects.\n\n\
        \ The valid values for [Name] depend on the action that you're including the filter in, \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html}ListResolverEndpoints}, \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html}ListResolverRules}, \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html}ListResolverRuleAssociations}, \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigs.html}ListResolverQueryLogConfigs}, \
         or \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigAssociations.html}ListResolverQueryLogConfigAssociations}.\n\
        \ \n\
        \   In early versions of Resolver, values for [Name] were listed as uppercase, with \
         underscore (_) delimiters. For example, [CreatorRequestId] was originally listed as \
         [CREATOR_REQUEST_ID]. Uppercase values for [Name] are still supported.\n\
        \   \n\
        \      {b ListResolverEndpoints} \n\
        \     \n\
        \      Valid values for [Name] include the following:\n\
        \      \n\
        \       {ul\n\
        \             {-   [CreatorRequestId]: The value that you specified when you created the \
         Resolver endpoint.\n\
        \                 \n\
        \                  }\n\
        \             {-   [Direction]: Whether you want to return inbound or outbound Resolver \
         endpoints. If you specify [DIRECTION] for [Name], specify [INBOUND] or [OUTBOUND] for \
         [Values].\n\
        \                 \n\
        \                  }\n\
        \             {-   [HostVPCId]: The ID of the VPC that inbound DNS queries pass through on \
         the way from your network to your VPCs in a region, or the VPC that outbound queries pass \
         through on the way from your VPCs to your network. In a \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html}CreateResolverEndpoint} \
         request, [SubnetId] indirectly identifies the VPC. In a \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html}GetResolverEndpoint} \
         request, the VPC ID for a Resolver endpoint is returned in the [HostVPCId] element. \n\
        \                 \n\
        \                  }\n\
        \             {-   [IpAddressCount]: The number of IP addresses that you have associated \
         with the Resolver endpoint.\n\
        \                 \n\
        \                  }\n\
        \             {-   [Name]: The name of the Resolver endpoint.\n\
        \                 \n\
        \                  }\n\
        \             {-   [SecurityGroupIds]: The IDs of the VPC security groups that you \
         specified when you created the Resolver endpoint.\n\
        \                 \n\
        \                  }\n\
        \             {-   [Status]: The status of the Resolver endpoint. If you specify [Status] \
         for [Name], specify one of the following status codes for [Values]: [CREATING], \
         [OPERATIONAL], [UPDATING], [AUTO_RECOVERING], [ACTION_NEEDED], or [DELETING]. For more \
         information, see [Status] in \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ResolverEndpoint.html}ResolverEndpoint}.\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \    {b ListResolverRules} \n\
        \   \n\
        \    Valid values for [Name] include the following:\n\
        \    \n\
        \     {ul\n\
        \           {-   [CreatorRequestId]: The value that you specified when you created the \
         Resolver rule.\n\
        \               \n\
        \                }\n\
        \           {-   [DomainName]: The domain name for which Resolver is forwarding DNS \
         queries to your network. In the value that you specify for [Values], include a trailing \
         dot (.) after the domain name. For example, if the domain name is example.com, specify \
         the following value. Note the \".\" after [com]:\n\
        \               \n\
        \                 [example.com.] \n\
        \                \n\
        \                 }\n\
        \           {-   [Name]: The name of the Resolver rule.\n\
        \               \n\
        \                }\n\
        \           {-   [ResolverEndpointId]: The ID of the Resolver endpoint that the Resolver \
         rule is associated with.\n\
        \               \n\
        \                 You can filter on the Resolver endpoint only for rules that have a value \
         of [FORWARD] for [RuleType].\n\
        \                 \n\
        \                   }\n\
        \           {-   [Status]: The status of the Resolver rule. If you specify [Status] for \
         [Name], specify one of the following status codes for [Values]: [COMPLETE], [DELETING], \
         [UPDATING], or [FAILED].\n\
        \               \n\
        \                }\n\
        \           {-   [Type]: The type of the Resolver rule. If you specify [TYPE] for [Name], \
         specify [FORWARD] or [SYSTEM] for [Values].\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    {b ListResolverRuleAssociations} \n\
        \   \n\
        \    Valid values for [Name] include the following:\n\
        \    \n\
        \     {ul\n\
        \           {-   [Name]: The name of the Resolver rule association.\n\
        \               \n\
        \                }\n\
        \           {-   [ResolverRuleId]: The ID of the Resolver rule that is associated with one \
         or more VPCs.\n\
        \               \n\
        \                }\n\
        \           {-   [Status]: The status of the Resolver rule association. If you specify \
         [Status] for [Name], specify one of the following status codes for [Values]: [CREATING], \
         [COMPLETE], [DELETING], or [FAILED].\n\
        \               \n\
        \                }\n\
        \           {-   [VPCId]: The ID of the VPC that the Resolver rule is associated with.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \    {b ListResolverQueryLogConfigs} \n\
        \   \n\
        \    Valid values for [Name] include the following:\n\
        \    \n\
        \     {ul\n\
        \           {-   [Arn]: The ARN for the query logging configuration.\n\
        \               \n\
        \                }\n\
        \           {-   [AssociationCount]: The number of VPCs that are associated with the query \
         logging configuration.\n\
        \               \n\
        \                }\n\
        \           {-   [CreationTime]: The date and time that the query logging configuration \
         was created, in Unix time format and Coordinated Universal Time (UTC). \n\
        \               \n\
        \                }\n\
        \           {-   [CreatorRequestId]: A unique string that identifies the request that \
         created the query logging configuration.\n\
        \               \n\
        \                }\n\
        \           {-   [Destination]: The Amazon Web Services service that you want to forward \
         query logs to. Valid values include the following:\n\
        \               \n\
        \                {ul\n\
        \                      {-   [S3] \n\
        \                          \n\
        \                           }\n\
        \                      {-   [CloudWatchLogs] \n\
        \                          \n\
        \                           }\n\
        \                      {-   [KinesisFirehose] \n\
        \                          \n\
        \                           }\n\
        \                      \n\
        \            }\n\
        \             }\n\
        \           {-   [DestinationArn]: The ARN of the location that Resolver is sending query \
         logs to. This value can be the ARN for an S3 bucket, a CloudWatch Logs log group, or a \
         Kinesis Data Firehose delivery stream.\n\
        \               \n\
        \                }\n\
        \           {-   [Id]: The ID of the query logging configuration\n\
        \               \n\
        \                }\n\
        \           {-   [Name]: The name of the query logging configuration\n\
        \               \n\
        \                }\n\
        \           {-   [OwnerId]: The Amazon Web Services account ID for the account that \
         created the query logging configuration.\n\
        \               \n\
        \                }\n\
        \           {-   [ShareStatus]: An indication of whether the query logging configuration \
         is shared with other Amazon Web Services accounts, or was shared with the current account \
         by another Amazon Web Services account. Valid values include: [NOT_SHARED], \
         [SHARED_WITH_ME], or [SHARED_BY_ME].\n\
        \               \n\
        \                }\n\
        \           {-   [Status]: The status of the query logging configuration. If you specify \
         [Status] for [Name], specify the applicable status code for [Values]: [CREATING], \
         [CREATED], [DELETING], or [FAILED]. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ResolverQueryLogConfig.html#Route53Resolver-Type-route53resolver_ResolverQueryLogConfig-Status}Status}. \n\
        \               \n\
        \                }\n\
        \           }\n\
        \    {b ListResolverQueryLogConfigAssociations} \n\
        \   \n\
        \    Valid values for [Name] include the following:\n\
        \    \n\
        \     {ul\n\
        \           {-   [CreationTime]: The date and time that the VPC was associated with the \
         query logging configuration, in Unix time format and Coordinated Universal Time (UTC).\n\
        \               \n\
        \                }\n\
        \           {-   [Error]: If the value of [Status] is [FAILED], specify the cause: \
         [DESTINATION_NOT_FOUND] or [ACCESS_DENIED].\n\
        \               \n\
        \                }\n\
        \           {-   [Id]: The ID of the query logging association.\n\
        \               \n\
        \                }\n\
        \           {-   [ResolverQueryLogConfigId]: The ID of the query logging configuration \
         that a VPC is associated with.\n\
        \               \n\
        \                }\n\
        \           {-   [ResourceId]: The ID of the Amazon VPC that is associated with the query \
         logging configuration.\n\
        \               \n\
        \                }\n\
        \           {-   [Status]: The status of the query logging association. If you specify \
         [Status] for [Name], specify the applicable status code for [Values]: [CREATING], \
         [CREATED], [DELETING], or [FAILED]. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ResolverQueryLogConfigAssociation.html#Route53Resolver-Type-route53resolver_ResolverQueryLogConfigAssociation-Status}Status}. \n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
}
[@@ocaml.doc
  "For Resolver list operations \
   ({{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverEndpoints.html}ListResolverEndpoints}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html}ListResolverRules}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html}ListResolverRuleAssociations}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigs.html}ListResolverQueryLogConfigs}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigAssociations.html}ListResolverQueryLogConfigAssociations}), \
   and \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverDnssecConfigs.html}ListResolverDnssecConfigs}), \
   an optional specification to return a subset of objects.\n\n\
  \ To filter objects, such as Resolver endpoints or Resolver rules, you specify [Name] and \
   [Values]. For example, to list only inbound Resolver endpoints, specify [Direction] for [Name] \
   and specify [INBOUND] for [Values]. \n\
  \ "]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec list_resolver_rules_request = {
  filters : filters option;
      [@ocaml.doc
        "An optional specification to return a subset of Resolver rules, such as all Resolver \
         rules that are associated with the same Resolver endpoint.\n\n\
        \  If you submit a second or subsequent [ListResolverRules] request and specify the \
         [NextToken] parameter, you must use the same values for [Filters], if any, as in the \
         previous request.\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListResolverRules] request, omit this value.\n\n\
        \ If you have more than [MaxResults] Resolver rules, you can submit another \
         [ListResolverRules] request to get the next group of Resolver rules. In the next request, \
         specify the value of [NextToken] from the previous response. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of Resolver rules that you want to return in the response to a \
         [ListResolverRules] request. If you don't specify a value for [MaxResults], Resolver \
         returns up to 100 Resolver rules.\n"]
}
[@@ocaml.doc ""]

type nonrec resolver_rule_association_status =
  | Overridden [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Complete [@ocaml.doc ""]
  | Creating [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resolver_rule_association = {
  status_message : status_message option;
      [@ocaml.doc
        "A detailed description of the status of the association between a Resolver rule and a VPC.\n"]
  status : resolver_rule_association_status option;
      [@ocaml.doc
        "A code that specifies the current status of the association between a Resolver rule and a \
         VPC.\n"]
  vpc_id : resource_id option;
      [@ocaml.doc "The ID of the VPC that you associated the Resolver rule with.\n"]
  name : name option;
      [@ocaml.doc
        "The name of an association between a Resolver rule and a VPC.\n\n\
        \ The name can be up to 64 characters long and can contain letters (a-z, A-Z), numbers \
         (0-9), hyphens (-), underscores (_), and spaces. The name cannot consist of only numbers.\n\
        \ "]
  resolver_rule_id : resource_id option;
      [@ocaml.doc
        "The ID of the Resolver rule that you associated with the VPC that is specified by [VPCId].\n"]
  id : resource_id option;
      [@ocaml.doc
        "The ID of the association between a Resolver rule and a VPC. Resolver assigns this value \
         when you submit an \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html}AssociateResolverRule} \
         request.\n"]
}
[@@ocaml.doc
  "In the response to an \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverRule.html}AssociateResolverRule}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverRule.html}DisassociateResolverRule}, \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRuleAssociations.html}ListResolverRuleAssociations} \
   request, provides information about an association between a Resolver rule and a VPC. The \
   association determines which DNS queries that originate in the VPC are forwarded to your \
   network. \n"]

type nonrec resolver_rule_associations = resolver_rule_association list [@@ocaml.doc ""]

type nonrec list_resolver_rule_associations_response = {
  resolver_rule_associations : resolver_rule_associations option;
      [@ocaml.doc
        "The associations that were created between Resolver rules and VPCs using the current \
         Amazon Web Services account, and that match the specified filters, if any.\n"]
  max_results : max_results option;
      [@ocaml.doc "The value that you specified for [MaxResults] in the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If more than [MaxResults] rule associations match the specified criteria, you can submit \
         another [ListResolverRuleAssociation] request to get the next group of results. In the \
         next request, specify the value of [NextToken] from the previous response. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resolver_rule_associations_request = {
  filters : filters option;
      [@ocaml.doc
        "An optional specification to return a subset of Resolver rules, such as Resolver rules \
         that are associated with the same VPC ID.\n\n\
        \  If you submit a second or subsequent [ListResolverRuleAssociations] request and specify \
         the [NextToken] parameter, you must use the same values for [Filters], if any, as in the \
         previous request.\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListResolverRuleAssociation] request, omit this value.\n\n\
        \ If you have more than [MaxResults] rule associations, you can submit another \
         [ListResolverRuleAssociation] request to get the next group of rule associations. In the \
         next request, specify the value of [NextToken] from the previous response. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of rule associations that you want to return in the response to a \
         [ListResolverRuleAssociations] request. If you don't specify a value for [MaxResults], \
         Resolver returns up to 100 rule associations. \n"]
}
[@@ocaml.doc ""]

type nonrec count = int [@@ocaml.doc ""]

type nonrec resolver_query_log_config_status =
  | Failed [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | Created [@ocaml.doc ""]
  | Creating [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resolver_query_log_config_name = string [@@ocaml.doc ""]

type nonrec destination_arn = string [@@ocaml.doc ""]

type nonrec resolver_query_log_config = {
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the query logging configuration was created, in Unix time format \
         and Coordinated Universal Time (UTC).\n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string that identifies the request that created the query logging configuration. \
         The [CreatorRequestId] allows failed requests to be retried without the risk of running \
         the operation twice.\n"]
  destination_arn : destination_arn option;
      [@ocaml.doc
        "The ARN of the resource that you want Resolver to send query logs: an Amazon S3 bucket, a \
         CloudWatch Logs log group, or a Kinesis Data Firehose delivery stream.\n"]
  name : resolver_query_log_config_name option;
      [@ocaml.doc "The name of the query logging configuration. \n"]
  arn : arn option; [@ocaml.doc "The ARN for the query logging configuration.\n"]
  association_count : count option;
      [@ocaml.doc "The number of VPCs that are associated with the query logging configuration.\n"]
  share_status : share_status option;
      [@ocaml.doc
        "An indication of whether the query logging configuration is shared with other Amazon Web \
         Services accounts, or was shared with the current account by another Amazon Web Services \
         account. Sharing is configured through Resource Access Manager (RAM).\n"]
  status : resolver_query_log_config_status option;
      [@ocaml.doc
        "The status of the specified query logging configuration. Valid values include the \
         following:\n\n\
        \ {ul\n\
        \       {-   [CREATING]: Resolver is creating the query logging configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATED]: The query logging configuration was successfully created. Resolver \
         is logging queries that originate in the specified VPC.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING]: Resolver is deleting this query logging configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED]: Resolver can't deliver logs to the location that is specified in \
         the query logging configuration. Here are two common causes:\n\
        \           \n\
        \            {ul\n\
        \                  {-  The specified destination (for example, an Amazon S3 bucket) was \
         deleted.\n\
        \                      \n\
        \                       }\n\
        \                  {-  Permissions don't allow sending logs to the destination.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
  owner_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID for the account that created the query logging \
         configuration. \n"]
  id : resource_id option; [@ocaml.doc "The ID for the query logging configuration.\n"]
}
[@@ocaml.doc
  "In the response to a \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverQueryLogConfig.html}CreateResolverQueryLogConfig}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DeleteResolverQueryLogConfig.html}DeleteResolverQueryLogConfig}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverQueryLogConfig.html}GetResolverQueryLogConfig}, \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigs.html}ListResolverQueryLogConfigs} \
   request, a complex type that contains settings for one query logging configuration.\n"]

type nonrec resolver_query_log_config_list = resolver_query_log_config list [@@ocaml.doc ""]

type nonrec list_resolver_query_log_configs_response = {
  resolver_query_log_configs : resolver_query_log_config_list option;
      [@ocaml.doc
        "A list that contains one [ResolverQueryLogConfig] element for each query logging \
         configuration that matches the values that you specified for [Filter].\n"]
  total_filtered_count : count option;
      [@ocaml.doc
        "The total number of query logging configurations that were created by the current account \
         in the specified Region and that match the filters that were specified in the \
         [ListResolverQueryLogConfigs] request. For the total number of query logging \
         configurations that were created by the current account in the specified Region, see \
         [TotalCount].\n"]
  total_count : count option;
      [@ocaml.doc
        "The total number of query logging configurations that were created by the current account \
         in the specified Region. This count can differ from the number of query logging \
         configurations that are returned in a [ListResolverQueryLogConfigs] response, depending \
         on the values that you specify in the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If there are more than [MaxResults] query logging configurations, you can submit another \
         [ListResolverQueryLogConfigs] request to get the next group of configurations. In the \
         next request, specify the value of [NextToken] from the previous response. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resolver_query_log_configs_request = {
  sort_order : sort_order option;
      [@ocaml.doc
        "If you specified a value for [SortBy], the order that you want query logging \
         configurations to be listed in, [ASCENDING] or [DESCENDING].\n\n\
        \  If you submit a second or subsequent [ListResolverQueryLogConfigs] request and specify \
         the [NextToken] parameter, you must use the same value for [SortOrder], if any, as in the \
         previous request.\n\
        \  \n\
        \   "]
  sort_by : sort_by_key option;
      [@ocaml.doc
        "The element that you want Resolver to sort query logging configurations by. \n\n\
        \  If you submit a second or subsequent [ListResolverQueryLogConfigs] request and specify \
         the [NextToken] parameter, you must use the same value for [SortBy], if any, as in the \
         previous request.\n\
        \  \n\
        \    Valid values include the following elements:\n\
        \    \n\
        \     {ul\n\
        \           {-   [Arn]: The ARN of the query logging configuration\n\
        \               \n\
        \                }\n\
        \           {-   [AssociationCount]: The number of VPCs that are associated with the \
         specified configuration \n\
        \               \n\
        \                }\n\
        \           {-   [CreationTime]: The date and time that Resolver returned when the \
         configuration was created\n\
        \               \n\
        \                }\n\
        \           {-   [CreatorRequestId]: The value that was specified for [CreatorRequestId] \
         when the configuration was created\n\
        \               \n\
        \                }\n\
        \           {-   [DestinationArn]: The location that logs are sent to\n\
        \               \n\
        \                }\n\
        \           {-   [Id]: The ID of the configuration\n\
        \               \n\
        \                }\n\
        \           {-   [Name]: The name of the configuration\n\
        \               \n\
        \                }\n\
        \           {-   [OwnerId]: The Amazon Web Services account number of the account that \
         created the configuration\n\
        \               \n\
        \                }\n\
        \           {-   [ShareStatus]: Whether the configuration is shared with other Amazon Web \
         Services accounts or shared with the current account by another Amazon Web Services \
         account. Sharing is configured through Resource Access Manager (RAM).\n\
        \               \n\
        \                }\n\
        \           {-   [Status]: The current status of the configuration. Valid values include \
         the following:\n\
        \               \n\
        \                {ul\n\
        \                      {-   [CREATING]: Resolver is creating the query logging \
         configuration.\n\
        \                          \n\
        \                           }\n\
        \                      {-   [CREATED]: The query logging configuration was successfully \
         created. Resolver is logging queries that originate in the specified VPC.\n\
        \                          \n\
        \                           }\n\
        \                      {-   [DELETING]: Resolver is deleting this query logging \
         configuration.\n\
        \                          \n\
        \                           }\n\
        \                      {-   [FAILED]: Resolver either couldn't create or couldn't delete \
         the query logging configuration. Here are two common causes:\n\
        \                          \n\
        \                           {ul\n\
        \                                 {-  The specified destination (for example, an Amazon S3 \
         bucket) was deleted.\n\
        \                                     \n\
        \                                      }\n\
        \                                 {-  Permissions don't allow sending logs to the \
         destination.\n\
        \                                     \n\
        \                                      }\n\
        \                                 \n\
        \                       }\n\
        \                        }\n\
        \                      \n\
        \            }\n\
        \             }\n\
        \           }\n\
        \  "]
  filters : filters option;
      [@ocaml.doc
        "An optional specification to return a subset of query logging configurations.\n\n\
        \  If you submit a second or subsequent [ListResolverQueryLogConfigs] request and specify \
         the [NextToken] parameter, you must use the same values for [Filters], if any, as in the \
         previous request.\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListResolverQueryLogConfigs] request, omit this value.\n\n\
        \ If there are more than [MaxResults] query logging configurations that match the values \
         that you specify for [Filters], you can submit another [ListResolverQueryLogConfigs] \
         request to get the next group of configurations. In the next request, specify the value \
         of [NextToken] from the previous response. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of query logging configurations that you want to return in the \
         response to a [ListResolverQueryLogConfigs] request. If you don't specify a value for \
         [MaxResults], Resolver returns up to 100 query logging configurations. \n"]
}
[@@ocaml.doc ""]

type nonrec resolver_query_log_config_association_status =
  | Failed [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | ActionNeeded [@ocaml.doc ""]
  | Active [@ocaml.doc ""]
  | Creating [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resolver_query_log_config_association_error =
  | InternalServiceError [@ocaml.doc ""]
  | AccessDenied [@ocaml.doc ""]
  | DestinationNotFound [@ocaml.doc ""]
  | None_ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resolver_query_log_config_association_error_message = string [@@ocaml.doc ""]

type nonrec resolver_query_log_config_association = {
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the VPC was associated with the query logging configuration, in \
         Unix time format and Coordinated Universal Time (UTC).\n"]
  error_message : resolver_query_log_config_association_error_message option;
      [@ocaml.doc
        "Contains additional information about the error. If the value or [Error] is null, the \
         value of [ErrorMessage] also is null.\n"]
  error : resolver_query_log_config_association_error option;
      [@ocaml.doc
        "If the value of [Status] is [FAILED], the value of [Error] indicates the cause:\n\n\
        \ {ul\n\
        \       {-   [DESTINATION_NOT_FOUND]: The specified destination (for example, an Amazon S3 \
         bucket) was deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [ACCESS_DENIED]: Permissions don't allow sending logs to the destination.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If the value of [Status] is a value other than [FAILED], [Error] is null. \n\
        \   "]
  status : resolver_query_log_config_association_status option;
      [@ocaml.doc
        "The status of the specified query logging association. Valid values include the \
         following:\n\n\
        \ {ul\n\
        \       {-   [CREATING]: Resolver is creating an association between an Amazon VPC and a \
         query logging configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE]: The association between an Amazon VPC and a query logging \
         configuration was successfully created. Resolver is logging queries that originate in the \
         specified VPC.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING]: Resolver is deleting this query logging association.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED]: Resolver either couldn't create or couldn't delete the query \
         logging association.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id option;
      [@ocaml.doc
        "The ID of the Amazon VPC that is associated with the query logging configuration.\n"]
  resolver_query_log_config_id : resource_id option;
      [@ocaml.doc "The ID of the query logging configuration that a VPC is associated with.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the query logging association.\n"]
}
[@@ocaml.doc
  "In the response to an \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_AssociateResolverQueryLogConfig.html}AssociateResolverQueryLogConfig}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_DisassociateResolverQueryLogConfig.html}DisassociateResolverQueryLogConfig}, \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverQueryLogConfigAssociation.html}GetResolverQueryLogConfigAssociation}, \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverQueryLogConfigAssociations.html}ListResolverQueryLogConfigAssociations}, \
   request, a complex type that contains settings for a specified association between an Amazon \
   VPC and a query logging configuration.\n"]

type nonrec resolver_query_log_config_association_list = resolver_query_log_config_association list
[@@ocaml.doc ""]

type nonrec list_resolver_query_log_config_associations_response = {
  resolver_query_log_config_associations : resolver_query_log_config_association_list option;
      [@ocaml.doc
        "A list that contains one [ResolverQueryLogConfigAssociations] element for each query \
         logging association that matches the values that you specified for [Filter].\n"]
  total_filtered_count : count option;
      [@ocaml.doc
        "The total number of query logging associations that were created by the current account \
         in the specified Region and that match the filters that were specified in the \
         [ListResolverQueryLogConfigAssociations] request. For the total number of associations \
         that were created by the current account in the specified Region, see [TotalCount].\n"]
  total_count : count option;
      [@ocaml.doc
        "The total number of query logging associations that were created by the current account \
         in the specified Region. This count can differ from the number of associations that are \
         returned in a [ListResolverQueryLogConfigAssociations] response, depending on the values \
         that you specify in the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If there are more than [MaxResults] query logging associations, you can submit another \
         [ListResolverQueryLogConfigAssociations] request to get the next group of associations. \
         In the next request, specify the value of [NextToken] from the previous response. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resolver_query_log_config_associations_request = {
  sort_order : sort_order option;
      [@ocaml.doc
        "If you specified a value for [SortBy], the order that you want query logging associations \
         to be listed in, [ASCENDING] or [DESCENDING].\n\n\
        \  If you submit a second or subsequent [ListResolverQueryLogConfigAssociations] request \
         and specify the [NextToken] parameter, you must use the same value for [SortOrder], if \
         any, as in the previous request.\n\
        \  \n\
        \   "]
  sort_by : sort_by_key option;
      [@ocaml.doc
        "The element that you want Resolver to sort query logging associations by. \n\n\
        \  If you submit a second or subsequent [ListResolverQueryLogConfigAssociations] request \
         and specify the [NextToken] parameter, you must use the same value for [SortBy], if any, \
         as in the previous request.\n\
        \  \n\
        \    Valid values include the following elements:\n\
        \    \n\
        \     {ul\n\
        \           {-   [CreationTime]: The ID of the query logging association.\n\
        \               \n\
        \                }\n\
        \           {-   [Error]: If the value of [Status] is [FAILED], the value of [Error] \
         indicates the cause: \n\
        \               \n\
        \                {ul\n\
        \                      {-   [DESTINATION_NOT_FOUND]: The specified destination (for \
         example, an Amazon S3 bucket) was deleted.\n\
        \                          \n\
        \                           }\n\
        \                      {-   [ACCESS_DENIED]: Permissions don't allow sending logs to the \
         destination.\n\
        \                          \n\
        \                           }\n\
        \                      \n\
        \            }\n\
        \             If [Status] is a value other than [FAILED], [ERROR] is null.\n\
        \             \n\
        \              }\n\
        \           {-   [Id]: The ID of the query logging association\n\
        \               \n\
        \                }\n\
        \           {-   [ResolverQueryLogConfigId]: The ID of the query logging configuration\n\
        \               \n\
        \                }\n\
        \           {-   [ResourceId]: The ID of the VPC that is associated with the query logging \
         configuration\n\
        \               \n\
        \                }\n\
        \           {-   [Status]: The current status of the configuration. Valid values include \
         the following:\n\
        \               \n\
        \                {ul\n\
        \                      {-   [CREATING]: Resolver is creating an association between an \
         Amazon VPC and a query logging configuration.\n\
        \                          \n\
        \                           }\n\
        \                      {-   [CREATED]: The association between an Amazon VPC and a query \
         logging configuration was successfully created. Resolver is logging queries that \
         originate in the specified VPC.\n\
        \                          \n\
        \                           }\n\
        \                      {-   [DELETING]: Resolver is deleting this query logging association.\n\
        \                          \n\
        \                           }\n\
        \                      {-   [FAILED]: Resolver either couldn't create or couldn't delete \
         the query logging association. Here are two common causes:\n\
        \                          \n\
        \                           {ul\n\
        \                                 {-  The specified destination (for example, an Amazon S3 \
         bucket) was deleted.\n\
        \                                     \n\
        \                                      }\n\
        \                                 {-  Permissions don't allow sending logs to the \
         destination.\n\
        \                                     \n\
        \                                      }\n\
        \                                 \n\
        \                       }\n\
        \                        }\n\
        \                      \n\
        \            }\n\
        \             }\n\
        \           }\n\
        \  "]
  filters : filters option;
      [@ocaml.doc
        "An optional specification to return a subset of query logging associations.\n\n\
        \  If you submit a second or subsequent [ListResolverQueryLogConfigAssociations] request \
         and specify the [NextToken] parameter, you must use the same values for [Filters], if \
         any, as in the previous request.\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListResolverQueryLogConfigAssociations] request, omit this value.\n\n\
        \ If there are more than [MaxResults] query logging associations that match the values \
         that you specify for [Filters], you can submit another \
         [ListResolverQueryLogConfigAssociations] request to get the next group of associations. \
         In the next request, specify the value of [NextToken] from the previous response. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of query logging associations that you want to return in the response \
         to a [ListResolverQueryLogConfigAssociations] request. If you don't specify a value for \
         [MaxResults], Resolver returns up to 100 query logging associations. \n"]
}
[@@ocaml.doc ""]

type nonrec resolver_endpoints = resolver_endpoint list [@@ocaml.doc ""]

type nonrec list_resolver_endpoints_response = {
  resolver_endpoints : resolver_endpoints option;
      [@ocaml.doc
        "The Resolver endpoints that were created by using the current Amazon Web Services \
         account, and that match the specified filters, if any.\n"]
  max_results : max_results option;
      [@ocaml.doc "The value that you specified for [MaxResults] in the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If more than [MaxResults] IP addresses match the specified criteria, you can submit \
         another [ListResolverEndpoint] request to get the next group of results. In the next \
         request, specify the value of [NextToken] from the previous response. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resolver_endpoints_request = {
  filters : filters option;
      [@ocaml.doc
        "An optional specification to return a subset of Resolver endpoints, such as all inbound \
         Resolver endpoints.\n\n\
        \  If you submit a second or subsequent [ListResolverEndpoints] request and specify the \
         [NextToken] parameter, you must use the same values for [Filters], if any, as in the \
         previous request.\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListResolverEndpoints] request, omit this value.\n\n\
        \ If you have more than [MaxResults] Resolver endpoints, you can submit another \
         [ListResolverEndpoints] request to get the next group of Resolver endpoints. In the next \
         request, specify the value of [NextToken] from the previous response. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of Resolver endpoints that you want to return in the response to a \
         [ListResolverEndpoints] request. If you don't specify a value for [MaxResults], Resolver \
         returns up to 100 Resolver endpoints. \n"]
}
[@@ocaml.doc ""]

type nonrec ip_address_status =
  | Isolated [@ocaml.doc ""]
  | UpdateFailed [@ocaml.doc ""]
  | Updating [@ocaml.doc ""]
  | DeleteFailedFasExpired [@ocaml.doc ""]
  | Deleting [@ocaml.doc ""]
  | FailedResourceGone [@ocaml.doc ""]
  | Detaching [@ocaml.doc ""]
  | RemapAttaching [@ocaml.doc ""]
  | RemapDetaching [@ocaml.doc ""]
  | Attached [@ocaml.doc ""]
  | Attaching [@ocaml.doc ""]
  | FailedCreationInsufficientEC2CapacityInOutpost [@ocaml.doc ""]
  | FailedCreation [@ocaml.doc ""]
  | Creating [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ip_address_response = {
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the IP address was last modified, in Unix time format and \
         Coordinated Universal Time (UTC).\n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the IP address was created, in Unix time format and Coordinated \
         Universal Time (UTC).\n"]
  status_message : status_message option;
      [@ocaml.doc
        "A message that provides additional information about the status of the request.\n"]
  status : ip_address_status option;
      [@ocaml.doc "A status code that gives the current status of the request.\n"]
  ipv6 : ipv6 option;
      [@ocaml.doc " One IPv6 address that the Resolver endpoint uses for DNS queries. \n"]
  ip : ip option; [@ocaml.doc "One IPv4 address that the Resolver endpoint uses for DNS queries.\n"]
  subnet_id : subnet_id option; [@ocaml.doc "The ID of one subnet.\n"]
  ip_id : resource_id option; [@ocaml.doc "The ID of one IP address.\n"]
}
[@@ocaml.doc
  "In the response to a \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html}GetResolverEndpoint} \
   request, information about the IP addresses that the Resolver endpoint uses for DNS queries.\n"]

type nonrec ip_addresses_response = ip_address_response list [@@ocaml.doc ""]

type nonrec list_resolver_endpoint_ip_addresses_response = {
  ip_addresses : ip_addresses_response option;
      [@ocaml.doc
        "Information about the IP addresses in your VPC that DNS queries originate from (for \
         outbound endpoints) or that you forward DNS queries to (for inbound endpoints).\n"]
  max_results : max_results option;
      [@ocaml.doc "The value that you specified for [MaxResults] in the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the specified endpoint has more than [MaxResults] IP addresses, you can submit another \
         [ListResolverEndpointIpAddresses] request to get the next group of IP addresses. In the \
         next request, specify the value of [NextToken] from the previous response. \n"]
}
[@@ocaml.doc ""]

type nonrec list_resolver_endpoint_ip_addresses_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first [ListResolverEndpointIpAddresses] request, omit this value.\n\n\
        \ If the specified Resolver endpoint has more than [MaxResults] IP addresses, you can \
         submit another [ListResolverEndpointIpAddresses] request to get the next group of IP \
         addresses. In the next request, specify the value of [NextToken] from the previous \
         response. \n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of IP addresses that you want to return in the response to a \
         [ListResolverEndpointIpAddresses] request. If you don't specify a value for [MaxResults], \
         Resolver returns up to 100 IP addresses. \n"]
  resolver_endpoint_id : resource_id;
      [@ocaml.doc "The ID of the Resolver endpoint that you want to get IP addresses for.\n"]
}
[@@ocaml.doc ""]

type nonrec resolver_dnssec_config_list = resolver_dnssec_config list [@@ocaml.doc ""]

type nonrec list_resolver_dnssec_configs_response = {
  resolver_dnssec_configs : resolver_dnssec_config_list option;
      [@ocaml.doc
        "An array that contains one \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_ResolverDnssecConfig.html}ResolverDnssecConfig} \
         element for each configuration for DNSSEC validation that is associated with the current \
         Amazon Web Services account. It doesn't contain disabled DNSSEC configurations for the \
         resource.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a response includes the last of the DNSSEC configurations that are associated with the \
         current Amazon Web Services account, [NextToken] doesn't appear in the response.\n\n\
        \ If a response doesn't include the last of the configurations, you can get more \
         configurations by submitting another \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_ListResolverDnssecConfigs.html}ListResolverDnssecConfigs} \
         request. Get the value of [NextToken] that Amazon Route 53 returned in the previous \
         response and include it in [NextToken] in the next request.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_resolver_dnssec_configs_request = {
  filters : filters option;
      [@ocaml.doc "An optional specification to return a subset of objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "(Optional) If the current Amazon Web Services account has more than [MaxResults] DNSSEC \
         configurations, use [NextToken] to get the second and subsequent pages of results.\n\n\
        \ For the first [ListResolverDnssecConfigs] request, omit this value.\n\
        \ \n\
        \  For the second and subsequent requests, get the value of [NextToken] from the previous \
         response and specify that value for [NextToken] in the request.\n\
        \  "]
  max_results : max_results option;
      [@ocaml.doc
        " {i Optional}: An integer that specifies the maximum number of DNSSEC configuration \
         results that you want Amazon Route 53 to return. If you don't specify a value for \
         [MaxResults], Route 53 returns up to 100 configuration per page.\n"]
}
[@@ocaml.doc ""]

type nonrec resolver_config_list = resolver_config list [@@ocaml.doc ""]

type nonrec list_resolver_configs_response = {
  resolver_configs : resolver_config_list option;
      [@ocaml.doc
        "An array that contains one [ResolverConfigs] element for each Resolver configuration that \
         is associated with the current Amazon Web Services account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If a response includes the last of the Resolver configurations that are associated with \
         the current Amazon Web Services account, [NextToken] doesn't appear in the response.\n\n\
        \ If a response doesn't include the last of the configurations, you can get more \
         configurations by submitting another [ListResolverConfigs] request. Get the value of \
         [NextToken] that Amazon Route\194\16053 returned in the previous response and include it \
         in [NextToken] in the next request.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_resolver_configs_max_result = int [@@ocaml.doc ""]

type nonrec list_resolver_configs_request = {
  next_token : next_token option;
      [@ocaml.doc
        "(Optional) If the current Amazon Web Services account has more than [MaxResults] Resolver \
         configurations, use [NextToken] to get the second and subsequent pages of results.\n\n\
        \ For the first [ListResolverConfigs] request, omit this value.\n\
        \ \n\
        \  For the second and subsequent requests, get the value of [NextToken] from the previous \
         response and specify that value for [NextToken] in the request.\n\
        \  "]
  max_results : list_resolver_configs_max_result option;
      [@ocaml.doc
        "The maximum number of Resolver configurations that you want to return in the response to \
         a [ListResolverConfigs] request. If you don't specify a value for [MaxResults], up to 100 \
         Resolver configurations are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec outpost_resolver_list = outpost_resolver list [@@ocaml.doc ""]

type nonrec list_outpost_resolvers_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If more than [MaxResults] Resolvers match the specified criteria, you can submit another \
         [ListOutpostResolver] request to get the next group of results. In the next request, \
         specify the value of [NextToken] from the previous response.\n"]
  outpost_resolvers : outpost_resolver_list option;
      [@ocaml.doc
        "The Resolvers on Outposts that were created by using the current Amazon Web Services \
         account, and that match the specified filters, if any.\n"]
}
[@@ocaml.doc ""]

type nonrec list_outpost_resolvers_request = {
  next_token : next_token option;
      [@ocaml.doc "For the first [ListOutpostResolver] request, omit this value.\n\n \n "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of Resolvers on the Outpost that you want to return in the response to \
         a [ListOutpostResolver] request. If you don't specify a value for [MaxResults], the \
         request returns up to 100 Resolvers.\n"]
  outpost_arn : outpost_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the Outpost.\n"]
}
[@@ocaml.doc ""]

type nonrec display_name = string [@@ocaml.doc ""]

type nonrec firewall_rule_type_definition = {
  subscription_info : subscription_info option;
      [@ocaml.doc
        "For rule types that require an external subscription (today, only the \
         [PartnerThreatProtection] variant), describes the AWS Marketplace product that backs the \
         rule type. Absent for rule types that are managed by AWS and do not require a separate \
         subscription. See [SubscriptionInfo].\n"]
  description : rule_type_description option; [@ocaml.doc "A description of the rule type.\n"]
  display_name : display_name option; [@ocaml.doc "The display name of the rule type.\n"]
  value : rule_type_value option;
      [@ocaml.doc
        "The specific identifier within the rule type category, such as [VIOLENCE_AND_HATE_SPEECH] \
         or [PHISHING].\n"]
  rule_type : rule_type_name option;
      [@ocaml.doc
        "The category or class of the rule type, such as [FirewallAdvancedContentCategory] or \
         [FirewallAdvancedThreatCategory].\n"]
}
[@@ocaml.doc
  "The definition of an available rule type that can be used in DNS Firewall rules. This is \
   returned by [ListFirewallRuleTypes].\n"]

type nonrec firewall_rule_type_definitions = firewall_rule_type_definition list [@@ocaml.doc ""]

type nonrec list_firewall_rule_types_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If objects are still available for retrieval, Resolver returns this token in the \
         response. To retrieve the next batch of objects, provide this token in your next request.\n"]
  firewall_rule_types : firewall_rule_type_definitions option;
      [@ocaml.doc "A list of the available rule type definitions.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_rule_types_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first call to this list request, omit this value. When you request a list of \
         objects, Resolver returns at most the number of objects specified in [MaxResults]. If \
         more objects are available for retrieval, Resolver provides a [NextToken] value in the \
         response. To retrieve the next batch of objects, use the token that was returned for the \
         prior request in your next request.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Resolver to return for this request. If more \
         objects are available, in the response, Resolver provides a [NextToken] value that you \
         can use in a subsequent call to get the next batch of objects.\n"]
  rule_type : rule_type_name option;
      [@ocaml.doc
        "An optional filter that restricts the response to a single [FirewallRuleType] variant. \
         Supported values: [FirewallAdvancedContentCategory], [FirewallAdvancedThreatCategory], \
         [DnsThreatProtection], and [PartnerThreatProtection]. If omitted, definitions across all \
         variants are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec firewall_rules = firewall_rule list [@@ocaml.doc ""]

type nonrec list_firewall_rules_response = {
  firewall_rules : firewall_rules option;
      [@ocaml.doc
        "A list of the rules that you have defined. \n\n\
        \ This might be a partial list of the firewall rules that you've defined. For information, \
         see [MaxResults]. \n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "If objects are still available for retrieval, Resolver returns this token in the \
         response. To retrieve the next batch of objects, provide this token in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_rules_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first call to this list request, omit this value.\n\n\
        \ When you request a list of objects, Resolver returns at most the number of objects \
         specified in [MaxResults]. If more objects are available for retrieval, Resolver returns \
         a [NextToken] value in the response. To retrieve the next batch of objects, use the token \
         that was returned for the prior request in your next request.\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Resolver to return for this request. If more \
         objects are available, in the response, Resolver provides a [NextToken] value that you \
         can use in a subsequent call to get the next batch of objects.\n\n\
        \ If you don't specify a value for [MaxResults], Resolver returns up to 100 objects. \n\
        \ "]
  action : action option;
      [@ocaml.doc
        "Optional additional filter for the rules to retrieve.\n\n\
        \ The action that DNS Firewall should take on a DNS query when it matches one of the \
         domains in the rule's domain list, or a threat in a DNS Firewall Advanced rule:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ALLOW] - Permit the request to go through. Not availabe for DNS Firewall \
         Advanced rules.\n\
        \            \n\
        \             }\n\
        \        {-   [ALERT] - Permit the request to go through but send an alert to the logs.\n\
        \            \n\
        \             }\n\
        \        {-   [BLOCK] - Disallow the request. If this is specified, additional handling \
         details are provided in the rule's [BlockResponse] setting. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  priority : priority option;
      [@ocaml.doc
        "Optional additional filter for the rules to retrieve.\n\n\
        \ The setting that determines the processing order of the rules in a rule group. DNS \
         Firewall processes the rules in a rule group by order of priority, starting from the \
         lowest setting.\n\
        \ "]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the firewall rule group that you want to retrieve the rules for. \n"]
}
[@@ocaml.doc ""]

type nonrec firewall_rule_group_metadata = {
  share_status : share_status option;
      [@ocaml.doc
        "Whether the rule group is shared with other Amazon Web Services accounts, or was shared \
         with the current account by another Amazon Web Services account. Sharing is configured \
         through Resource Access Manager (RAM).\n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string defined by you to identify the request. This allows you to retry failed \
         requests without the risk of running the operation twice. This can be any unique string, \
         for example, a timestamp. \n"]
  owner_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID for the account that created the rule group. When a \
         rule group is shared with your account, this is the account that has shared the rule \
         group with you. \n"]
  name : name option; [@ocaml.doc "The name of the rule group.\n"]
  arn : arn option; [@ocaml.doc "The ARN (Amazon Resource Name) of the rule group.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the rule group. \n"]
}
[@@ocaml.doc
  "Minimal high-level information for a firewall rule group. The action [ListFirewallRuleGroups] \
   returns an array of these objects. \n\n\
  \ To retrieve full information for a firewall rule group, call [GetFirewallRuleGroup] and \
   [ListFirewallRules].\n\
  \ "]

type nonrec firewall_rule_group_metadata_list = firewall_rule_group_metadata list [@@ocaml.doc ""]

type nonrec list_firewall_rule_groups_response = {
  firewall_rule_groups : firewall_rule_group_metadata_list option;
      [@ocaml.doc
        "A list of your firewall rule groups.\n\n\
        \ This might be a partial list of the rule groups that you have defined. For information, \
         see [MaxResults]. \n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "If objects are still available for retrieval, Resolver returns this token in the \
         response. To retrieve the next batch of objects, provide this token in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_rule_groups_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first call to this list request, omit this value.\n\n\
        \ When you request a list of objects, Resolver returns at most the number of objects \
         specified in [MaxResults]. If more objects are available for retrieval, Resolver returns \
         a [NextToken] value in the response. To retrieve the next batch of objects, use the token \
         that was returned for the prior request in your next request.\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Resolver to return for this request. If more \
         objects are available, in the response, Resolver provides a [NextToken] value that you \
         can use in a subsequent call to get the next batch of objects.\n\n\
        \ If you don't specify a value for [MaxResults], Resolver returns up to 100 objects. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec firewall_rule_group_associations = firewall_rule_group_association list [@@ocaml.doc ""]

type nonrec list_firewall_rule_group_associations_response = {
  firewall_rule_group_associations : firewall_rule_group_associations option;
      [@ocaml.doc
        "A list of your firewall rule group associations.\n\n\
        \ This might be a partial list of the associations that you have defined. For information, \
         see [MaxResults]. \n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "If objects are still available for retrieval, Resolver returns this token in the \
         response. To retrieve the next batch of objects, provide this token in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_rule_group_associations_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first call to this list request, omit this value.\n\n\
        \ When you request a list of objects, Resolver returns at most the number of objects \
         specified in [MaxResults]. If more objects are available for retrieval, Resolver returns \
         a [NextToken] value in the response. To retrieve the next batch of objects, use the token \
         that was returned for the prior request in your next request.\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Resolver to return for this request. If more \
         objects are available, in the response, Resolver provides a [NextToken] value that you \
         can use in a subsequent call to get the next batch of objects.\n\n\
        \ If you don't specify a value for [MaxResults], Resolver returns up to 100 objects. \n\
        \ "]
  status : firewall_rule_group_association_status option;
      [@ocaml.doc
        "The association [Status] setting that you want DNS Firewall to filter on for the list. If \
         you don't specify this, then DNS Firewall returns all associations, regardless of status.\n"]
  priority : priority option;
      [@ocaml.doc
        "The setting that determines the processing order of the rule group among the rule groups \
         that are associated with a single VPC. DNS Firewall filters VPC traffic starting from the \
         rule group with the lowest numeric priority setting. \n"]
  vpc_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the VPC that you want to retrieve the associations for. Leave \
         this blank to retrieve associations for any VPC. \n"]
  firewall_rule_group_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the firewall rule group that you want to retrieve the \
         associations for. Leave this blank to retrieve associations for any rule group. \n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_domains_response = {
  domains : firewall_domains option;
      [@ocaml.doc
        "A list of the domains in the firewall domain list. \n\n\
        \ This might be a partial list of the domains that you've defined in the domain list. For \
         information, see [MaxResults]. \n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "If objects are still available for retrieval, Resolver returns this token in the \
         response. To retrieve the next batch of objects, provide this token in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_domain_max_results = int [@@ocaml.doc ""]

type nonrec list_firewall_domains_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first call to this list request, omit this value.\n\n\
        \ When you request a list of objects, Resolver returns at most the number of objects \
         specified in [MaxResults]. If more objects are available for retrieval, Resolver returns \
         a [NextToken] value in the response. To retrieve the next batch of objects, use the token \
         that was returned for the prior request in your next request.\n\
        \ "]
  max_results : list_domain_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Resolver to return for this request. If more \
         objects are available, in the response, Resolver provides a [NextToken] value that you \
         can use in a subsequent call to get the next batch of objects.\n\n\
        \ If you don't specify a value for [MaxResults], Resolver returns up to 100 objects. \n\
        \ "]
  firewall_domain_list_id : resource_id;
      [@ocaml.doc "The ID of the domain list whose domains you want to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec domain_list_type = CONTENT [@ocaml.doc ""] | THREAT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec category = string [@@ocaml.doc ""]

type nonrec firewall_domain_list_metadata = {
  category : category option; [@ocaml.doc "The category of the domain list.\n"]
  managed_list_type : domain_list_type option;
      [@ocaml.doc "The type of the managed domain list, for example [THREAT].\n"]
  managed_owner_name : service_principle option;
      [@ocaml.doc
        "The owner of the list, used only for lists that are not managed by you. For example, the \
         managed domain list [AWSManagedDomainsMalwareDomainList] has the managed owner name \
         [Route 53 Resolver DNS Firewall].\n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string defined by you to identify the request. This allows you to retry failed \
         requests without the risk of running the operation twice. This can be any unique string, \
         for example, a timestamp. \n"]
  name : name option; [@ocaml.doc "The name of the domain list. \n"]
  arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall domain list metadata.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the domain list. \n"]
}
[@@ocaml.doc
  "Minimal high-level information for a firewall domain list. The action [ListFirewallDomainLists] \
   returns an array of these objects. \n\n\
  \ To retrieve full information for a firewall domain list, call [GetFirewallDomainList] and \
   [ListFirewallDomains].\n\
  \ "]

type nonrec firewall_domain_list_metadata_list = firewall_domain_list_metadata list [@@ocaml.doc ""]

type nonrec list_firewall_domain_lists_response = {
  firewall_domain_lists : firewall_domain_list_metadata_list option;
      [@ocaml.doc
        "A list of the domain lists that you have defined. \n\n\
        \ This might be a partial list of the domain lists that you've defined. For information, \
         see [MaxResults]. \n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "If objects are still available for retrieval, Resolver returns this token in the \
         response. To retrieve the next batch of objects, provide this token in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_domain_lists_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first call to this list request, omit this value.\n\n\
        \ When you request a list of objects, Resolver returns at most the number of objects \
         specified in [MaxResults]. If more objects are available for retrieval, Resolver returns \
         a [NextToken] value in the response. To retrieve the next batch of objects, use the token \
         that was returned for the prior request in your next request.\n\
        \ "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Resolver to return for this request. If more \
         objects are available, in the response, Resolver provides a [NextToken] value that you \
         can use in a subsequent call to get the next batch of objects.\n\n\
        \ If you don't specify a value for [MaxResults], Resolver returns up to 100 objects. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec firewall_config_list = firewall_config list [@@ocaml.doc ""]

type nonrec list_firewall_configs_response = {
  firewall_configs : firewall_config_list option;
      [@ocaml.doc
        "The configurations for the firewall behavior provided by DNS Firewall for VPCs from \
         Amazon Virtual Private Cloud (Amazon VPC). \n"]
  next_token : next_token option;
      [@ocaml.doc
        "If objects are still available for retrieval, Resolver returns this token in the \
         response. To retrieve the next batch of objects, provide this token in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_configs_max_result = int [@@ocaml.doc ""]

type nonrec list_firewall_configs_request = {
  next_token : next_token option;
      [@ocaml.doc
        "For the first call to this list request, omit this value.\n\n\
        \ When you request a list of objects, Resolver returns at most the number of objects \
         specified in [MaxResults]. If more objects are available for retrieval, Resolver returns \
         a [NextToken] value in the response. To retrieve the next batch of objects, use the token \
         that was returned for the prior request in your next request.\n\
        \ "]
  max_results : list_firewall_configs_max_result option;
      [@ocaml.doc
        "The maximum number of objects that you want Resolver to return for this request. If more \
         objects are available, in the response, Resolver provides a [NextToken] value that you \
         can use in a subsequent call to get the next batch of objects.\n\n\
        \ If you don't specify a value for [MaxResults], Resolver returns up to 100 objects. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec import_firewall_domains_response = {
  status_message : status_message option;
      [@ocaml.doc "Additional information about the status of the list, if available.\n"]
  status : firewall_domain_list_status option; [@ocaml.doc "Status of the import request.\n"]
  name : name option; [@ocaml.doc "The name of the domain list. \n"]
  id : resource_id option;
      [@ocaml.doc "The Id of the firewall domain list that DNS Firewall just updated.\n"]
}
[@@ocaml.doc ""]

type nonrec firewall_domain_import_operation = REPLACE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec domain_list_file_url = string [@@ocaml.doc ""]

type nonrec import_firewall_domains_request = {
  domain_file_url : domain_list_file_url;
      [@ocaml.doc
        "The fully qualified URL or URI of the file stored in Amazon Simple Storage Service \
         (Amazon S3) that contains the list of domains to import.\n\n\
        \ The file must be in an S3 bucket that's in the same Region as your DNS Firewall. The \
         file must be a text file and must contain a single domain per line.\n\
        \ "]
  operation : firewall_domain_import_operation;
      [@ocaml.doc
        "What you want DNS Firewall to do with the domains that are listed in the file. This must \
         be set to [REPLACE], which updates the domain list to exactly match the list in the file. \n"]
  firewall_domain_list_id : resource_id;
      [@ocaml.doc "The ID of the domain list that you want to modify with the import operation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_rule_policy_response = {
  resolver_rule_policy : resolver_rule_policy option;
      [@ocaml.doc
        "The Resolver rule policy for the rule that you specified in a [GetResolverRulePolicy] \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_rule_policy_request = {
  arn : arn;
      [@ocaml.doc
        "The ID of the Resolver rule that you want to get the Resolver rule policy for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_rule_association_response = {
  resolver_rule_association : resolver_rule_association option;
      [@ocaml.doc
        "Information about the Resolver rule association that you specified in a \
         [GetResolverRuleAssociation] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_rule_association_request = {
  resolver_rule_association_id : resource_id;
      [@ocaml.doc
        "The ID of the Resolver rule association that you want to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_rule_response = {
  resolver_rule : resolver_rule option;
      [@ocaml.doc
        "Information about the Resolver rule that you specified in a [GetResolverRule] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_rule_request = {
  resolver_rule_id : resource_id;
      [@ocaml.doc "The ID of the Resolver rule that you want to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_query_log_config_policy_response = {
  resolver_query_log_config_policy : resolver_query_log_config_policy option;
      [@ocaml.doc
        "Information about the query logging policy for the query logging configuration that you \
         specified in a [GetResolverQueryLogConfigPolicy] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_query_log_config_policy_request = {
  arn : arn;
      [@ocaml.doc
        "The ARN of the query logging configuration that you want to get the query logging policy \
         for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_query_log_config_association_response = {
  resolver_query_log_config_association : resolver_query_log_config_association option;
      [@ocaml.doc
        "Information about the Resolver query logging configuration association that you specified \
         in a [GetQueryLogConfigAssociation] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_query_log_config_association_request = {
  resolver_query_log_config_association_id : resource_id;
      [@ocaml.doc
        "The ID of the Resolver query logging configuration association that you want to get \
         information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_query_log_config_response = {
  resolver_query_log_config : resolver_query_log_config option;
      [@ocaml.doc
        "Information about the Resolver query logging configuration that you specified in a \
         [GetQueryLogConfig] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_query_log_config_request = {
  resolver_query_log_config_id : resource_id;
      [@ocaml.doc
        "The ID of the Resolver query logging configuration that you want to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_endpoint_response = {
  resolver_endpoint : resolver_endpoint option;
      [@ocaml.doc
        "Information about the Resolver endpoint that you specified in a [GetResolverEndpoint] \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_endpoint_request = {
  resolver_endpoint_id : resource_id;
      [@ocaml.doc "The ID of the Resolver endpoint that you want to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_dnssec_config_response = {
  resolver_dnssec_config : resolver_dnssec_config option;
      [@ocaml.doc "The information about a configuration for DNSSEC validation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_dnssec_config_request = {
  resource_id : resource_id;
      [@ocaml.doc "The ID of the virtual private cloud (VPC) for the DNSSEC validation status.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_config_response = {
  resolver_config : resolver_config option;
      [@ocaml.doc
        "Information about the behavior configuration of Route\194\16053 Resolver behavior for the \
         VPC you specified in the [GetResolverConfig] request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resolver_config_request = {
  resource_id : resource_id;
      [@ocaml.doc "Resource ID of the Amazon VPC that you want to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_outpost_resolver_response = {
  outpost_resolver : outpost_resolver option;
      [@ocaml.doc
        "Information about the [GetOutpostResolver] request, including the status of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_outpost_resolver_request = {
  id : resource_id; [@ocaml.doc "The ID of the Resolver on the Outpost.\n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_rule_group_policy_response = {
  firewall_rule_group_policy : firewall_rule_group_policy option;
      [@ocaml.doc
        "The Identity and Access Management (Amazon Web Services IAM) policy for sharing the \
         specified rule group. You can use the policy to share the rule group using Resource \
         Access Manager (RAM). \n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_rule_group_policy_request = {
  arn : arn; [@ocaml.doc "The ARN (Amazon Resource Name) for the rule group.\n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_rule_group_association_response = {
  firewall_rule_group_association : firewall_rule_group_association option;
      [@ocaml.doc "The association that you requested. \n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_rule_group_association_request = {
  firewall_rule_group_association_id : resource_id;
      [@ocaml.doc "The identifier of the [FirewallRuleGroupAssociation]. \n"]
}
[@@ocaml.doc ""]

type nonrec firewall_rule_group_status =
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec firewall_rule_group = {
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the rule group was last modified, in Unix time format and \
         Coordinated Universal Time (UTC).\n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the rule group was created, in Unix time format and Coordinated \
         Universal Time (UTC). \n"]
  share_status : share_status option;
      [@ocaml.doc
        "Whether the rule group is shared with other Amazon Web Services accounts, or was shared \
         with the current account by another Amazon Web Services account. Sharing is configured \
         through Resource Access Manager (RAM).\n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string defined by you to identify the request. This allows you to retry failed \
         requests without the risk of running the operation twice. This can be any unique string, \
         for example, a timestamp. \n"]
  owner_id : account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID for the account that created the rule group. When a \
         rule group is shared with your account, this is the account that has shared the rule \
         group with you. \n"]
  status_message : status_message option;
      [@ocaml.doc "Additional information about the status of the rule group, if available.\n"]
  status : firewall_rule_group_status option; [@ocaml.doc "The status of the domain list. \n"]
  rule_count : unsigned option; [@ocaml.doc "The number of rules in the rule group.\n"]
  name : name option; [@ocaml.doc "The name of the rule group.\n"]
  arn : arn option; [@ocaml.doc "The ARN (Amazon Resource Name) of the rule group.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the rule group. \n"]
}
[@@ocaml.doc
  "High-level information for a firewall rule group. A firewall rule group is a collection of \
   rules that DNS Firewall uses to filter DNS network traffic for a VPC. To retrieve the rules for \
   the rule group, call [ListFirewallRules].\n"]

type nonrec get_firewall_rule_group_response = {
  firewall_rule_group : firewall_rule_group option;
      [@ocaml.doc "A collection of rules used to filter DNS network traffic. \n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_rule_group_request = {
  firewall_rule_group_id : resource_id;
      [@ocaml.doc "The unique identifier of the firewall rule group. \n"]
}
[@@ocaml.doc ""]

type nonrec firewall_domain_list = {
  managed_list_type : domain_list_type option;
      [@ocaml.doc "The type of the managed domain list, for example [THREAT].\n"]
  category : category option; [@ocaml.doc "The category of the domain list.\n"]
  modification_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the domain list was last modified, in Unix time format and \
         Coordinated Universal Time (UTC). \n"]
  creation_time : rfc3339_time_string option;
      [@ocaml.doc
        "The date and time that the domain list was created, in Unix time format and Coordinated \
         Universal Time (UTC). \n"]
  creator_request_id : creator_request_id option;
      [@ocaml.doc
        "A unique string defined by you to identify the request. This allows you to retry failed \
         requests without the risk of running the operation twice. This can be any unique string, \
         for example, a timestamp. \n"]
  managed_owner_name : service_principle option;
      [@ocaml.doc
        "The owner of the list, used only for lists that are not managed by you. For example, the \
         managed domain list [AWSManagedDomainsMalwareDomainList] has the managed owner name \
         [Route 53 Resolver DNS Firewall].\n"]
  status_message : status_message option;
      [@ocaml.doc "Additional information about the status of the list, if available.\n"]
  status : firewall_domain_list_status option; [@ocaml.doc "The status of the domain list. \n"]
  domain_count : unsigned option;
      [@ocaml.doc "The number of domain names that are specified in the domain list.\n"]
  name : name option; [@ocaml.doc "The name of the domain list. \n"]
  arn : arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall domain list.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the domain list. \n"]
}
[@@ocaml.doc
  "High-level information about a list of firewall domains for use in a [FirewallRule]. This is \
   returned by [GetFirewallDomainList].\n\n\
  \ To retrieve the domains that are defined for this domain list, call [ListFirewallDomains].\n\
  \ "]

type nonrec get_firewall_domain_list_response = {
  firewall_domain_list : firewall_domain_list option;
      [@ocaml.doc "The domain list that you requested. \n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_domain_list_request = {
  firewall_domain_list_id : resource_id; [@ocaml.doc "The ID of the domain list. \n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_config_response = {
  firewall_config : firewall_config option;
      [@ocaml.doc
        "Configuration of the firewall behavior provided by DNS Firewall for a single VPC from \
         AmazonVPC. \n"]
}
[@@ocaml.doc ""]

type nonrec get_firewall_config_request = {
  resource_id : resource_id;
      [@ocaml.doc "The ID of the VPC from Amazon VPC that the configuration is for.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_resolver_rule_response = {
  resolver_rule_association : resolver_rule_association option;
      [@ocaml.doc
        "Information about the [DisassociateResolverRule] request, including the status of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_resolver_rule_request = {
  resolver_rule_id : resource_id;
      [@ocaml.doc
        "The ID of the Resolver rule that you want to disassociate from the specified VPC.\n"]
  vpc_id : resource_id;
      [@ocaml.doc "The ID of the VPC that you want to disassociate the Resolver rule from.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_resolver_query_log_config_response = {
  resolver_query_log_config_association : resolver_query_log_config_association option;
      [@ocaml.doc
        "A complex type that contains settings for the association that you deleted between an \
         Amazon VPC and a query logging configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_resolver_query_log_config_request = {
  resource_id : resource_id;
      [@ocaml.doc
        "The ID of the Amazon VPC that you want to disassociate from a specified query logging \
         configuration.\n"]
  resolver_query_log_config_id : resource_id;
      [@ocaml.doc
        "The ID of the query logging configuration that you want to disassociate a specified VPC \
         from.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_exists_exception = {
  resource_type : string_ option;
      [@ocaml.doc
        "For a [ResourceExistsException] error, the type of resource that the error applies to.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The resource that you tried to create already exists.\n"]

type nonrec disassociate_resolver_endpoint_ip_address_response = {
  resolver_endpoint : resolver_endpoint option;
      [@ocaml.doc "The response to an [DisassociateResolverEndpointIpAddress] request.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_address_update = {
  ipv6 : ipv6 option; [@ocaml.doc " The new IPv6 address. \n"]
  ip : ip option; [@ocaml.doc "The new IPv4 address.\n"]
  subnet_id : subnet_id option;
      [@ocaml.doc
        "The ID of the subnet that includes the IP address that you want to update. To get this \
         ID, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html}GetResolverEndpoint}.\n"]
  ip_id : resource_id option;
      [@ocaml.doc
        " {i Only when removing an IP address from a Resolver endpoint}: The ID of the IP address \
         that you want to remove. To get this ID, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_GetResolverEndpoint.html}GetResolverEndpoint}.\n"]
}
[@@ocaml.doc
  "In an \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_UpdateResolverEndpoint.html}UpdateResolverEndpoint} \
   request, information about an IP address to update.\n"]

type nonrec disassociate_resolver_endpoint_ip_address_request = {
  ip_address : ip_address_update;
      [@ocaml.doc "The IPv4 address that you want to remove from a Resolver endpoint.\n"]
  resolver_endpoint_id : resource_id;
      [@ocaml.doc
        "The ID of the Resolver endpoint that you want to disassociate an IP address from.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_firewall_rule_group_response = {
  firewall_rule_group_association : firewall_rule_group_association option;
      [@ocaml.doc "The firewall rule group association that you just removed. \n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_firewall_rule_group_request = {
  firewall_rule_group_association_id : resource_id;
      [@ocaml.doc "The identifier of the [FirewallRuleGroupAssociation]. \n"]
}
[@@ocaml.doc ""]

type nonrec resource_in_use_exception = {
  resource_type : string_ option;
      [@ocaml.doc
        "For a [ResourceInUseException] error, the type of resource that is currently in use.\n"]
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The resource that you tried to update or delete is currently in use.\n"]

type nonrec delete_resolver_rule_response = {
  resolver_rule : resolver_rule option;
      [@ocaml.doc
        "Information about the [DeleteResolverRule] request, including the status of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resolver_rule_request = {
  resolver_rule_id : resource_id;
      [@ocaml.doc "The ID of the Resolver rule that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resolver_query_log_config_response = {
  resolver_query_log_config : resolver_query_log_config option;
      [@ocaml.doc
        "Information about the query logging configuration that you deleted, including the status \
         of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resolver_query_log_config_request = {
  resolver_query_log_config_id : resource_id;
      [@ocaml.doc "The ID of the query logging configuration that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resolver_endpoint_response = {
  resolver_endpoint : resolver_endpoint option;
      [@ocaml.doc
        "Information about the [DeleteResolverEndpoint] request, including the status of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resolver_endpoint_request = {
  resolver_endpoint_id : resource_id;
      [@ocaml.doc "The ID of the Resolver endpoint that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_outpost_resolver_response = {
  outpost_resolver : outpost_resolver option;
      [@ocaml.doc
        "Information about the [DeleteOutpostResolver] request, including the status of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_outpost_resolver_request = {
  id : resource_id; [@ocaml.doc "A unique string that identifies the Resolver on the Outpost.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_rule_group_response = {
  firewall_rule_group : firewall_rule_group option;
      [@ocaml.doc "A collection of rules used to filter DNS network traffic. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_rule_group_request = {
  firewall_rule_group_id : resource_id;
      [@ocaml.doc "The unique identifier of the firewall rule group that you want to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_rule_response = {
  firewall_rule : firewall_rule option;
      [@ocaml.doc "The specification for the firewall rule that you just deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_rule_request = {
  qtype : qtype option;
      [@ocaml.doc
        " The DNS query type that the rule you are deleting evaluates. Allowed values are; \n\n\
        \ {ul\n\
        \       {-   A: Returns an IPv4 address.\n\
        \           \n\
        \            }\n\
        \       {-  AAAA: Returns an Ipv6 address.\n\
        \           \n\
        \            }\n\
        \       {-  CAA: Restricts CAs that can create SSL/TLS certifications for the domain.\n\
        \           \n\
        \            }\n\
        \       {-  CNAME: Returns another domain name.\n\
        \           \n\
        \            }\n\
        \       {-  DS: Record that identifies the DNSSEC signing key of a delegated zone.\n\
        \           \n\
        \            }\n\
        \       {-  MX: Specifies mail servers.\n\
        \           \n\
        \            }\n\
        \       {-  NAPTR: Regular-expression-based rewriting of domain names.\n\
        \           \n\
        \            }\n\
        \       {-  NS: Authoritative name servers.\n\
        \           \n\
        \            }\n\
        \       {-  PTR: Maps an IP address to a domain name.\n\
        \           \n\
        \            }\n\
        \       {-  SOA: Start of authority record for the zone.\n\
        \           \n\
        \            }\n\
        \       {-  SPF: Lists the servers authorized to send emails from a domain.\n\
        \           \n\
        \            }\n\
        \       {-  SRV: Application specific values that identify servers.\n\
        \           \n\
        \            }\n\
        \       {-  TXT: Verifies email senders and application-specific values.\n\
        \           \n\
        \            }\n\
        \       {-  A query type you define by using the DNS type ID, for example 28 for AAAA. The \
         values must be defined as TYPENUMBER, where the NUMBER can be 1-65534, for example, \
         TYPE28. For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_DNS_record_types}List of DNS record types}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  firewall_threat_protection_id : resource_id option;
      [@ocaml.doc " The ID that is created for a DNS Firewall Advanced rule. \n"]
  firewall_domain_list_id : resource_id option;
      [@ocaml.doc "The ID of the domain list that's used in the rule. \n"]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the firewall rule group that you want to delete the rule from. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_domain_list_response = {
  firewall_domain_list : firewall_domain_list option;
      [@ocaml.doc "The domain list that you just deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_domain_list_request = {
  firewall_domain_list_id : resource_id;
      [@ocaml.doc "The ID of the domain list that you want to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec create_resolver_rule_response = {
  resolver_rule : resolver_rule option;
      [@ocaml.doc
        "Information about the [CreateResolverRule] request, including the status of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_resolver_rule_request = {
  delegation_record : delegation_record option;
      [@ocaml.doc
        " DNS queries with the delegation records that match this domain name are forwarded to the \
         resolvers on your network. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of the tag keys and values that you want to associate with the endpoint.\n"]
  resolver_endpoint_id : resource_id option;
      [@ocaml.doc
        "The ID of the outbound Resolver endpoint that you want to use to route DNS queries to the \
         IP addresses that you specify in [TargetIps].\n"]
  target_ips : target_list option;
      [@ocaml.doc
        "The IPs that you want Resolver to forward DNS queries to. You can specify either Ipv4 or \
         Ipv6 addresses but not both in the same rule. Separate IP addresses with a space.\n\n\
        \  [TargetIps] is available only when the value of [Rule type] is [FORWARD]. You should \
         not provide TargetIps when the Rule type is [DELEGATE].\n\
        \ \n\
        \   when creating a DELEGATE rule, you must not provide the [TargetIps] parameter. If you \
         provide the [TargetIps], you may receive an ERROR message similar to \"Delegate resolver \
         rules need to specify a nameserver name\". This error means you should not provide \
         [TargetIps].\n\
        \   \n\
        \    "]
  domain_name : domain_name option;
      [@ocaml.doc
        "DNS queries for this domain name are forwarded to the IP addresses that you specify in \
         [TargetIps]. If a query matches multiple Resolver rules (example.com and \
         www.example.com), outbound DNS queries are routed using the Resolver rule that contains \
         the most specific domain name (www.example.com).\n"]
  rule_type : rule_type_option;
      [@ocaml.doc
        "When you want to forward DNS queries for specified domain name to resolvers on your \
         network, specify [FORWARD] or [DELEGATE].\n\n\
        \ When you have a forwarding rule to forward DNS queries for a domain to your network and \
         you want Resolver to process queries for a subdomain of that domain, specify [SYSTEM].\n\
        \ \n\
        \  For example, to forward DNS queries for example.com to resolvers on your network, you \
         create a rule and specify [FORWARD] for [RuleType]. To then have Resolver process queries \
         for apex.example.com, you create a rule and specify [SYSTEM] for [RuleType].\n\
        \  \n\
        \   Currently, only Resolver can create rules that have a value of [RECURSIVE] for \
         [RuleType].\n\
        \   "]
  name : name option;
      [@ocaml.doc
        "A friendly name that lets you easily find a rule in the Resolver dashboard in the Route \
         53 console.\n\n\
        \ The name can be up to 64 characters long and can contain letters (a-z, A-Z), numbers \
         (0-9), hyphens (-), underscores (_), and spaces. The name cannot consist of only numbers.\n\
        \ "]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed requests to be retried \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string, for example, a date/time stamp. \n"]
}
[@@ocaml.doc ""]

type nonrec create_resolver_query_log_config_response = {
  resolver_query_log_config : resolver_query_log_config option;
      [@ocaml.doc
        "Information about the [CreateResolverQueryLogConfig] request, including the status of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_resolver_query_log_config_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of the tag keys and values that you want to associate with the query logging \
         configuration.\n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed requests to be retried \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string, for example, a date/time stamp. \n"]
  destination_arn : destination_arn;
      [@ocaml.doc
        "The ARN of the resource that you want Resolver to send query logs. You can send query \
         logs to an S3 bucket, a CloudWatch Logs log group, or a Kinesis Data Firehose delivery \
         stream. Examples of valid values include the following:\n\n\
        \ {ul\n\
        \       {-   {b S3 bucket}: \n\
        \           \n\
        \             [arn:aws:s3:::amzn-s3-demo-bucket] \n\
        \            \n\
        \             You can optionally append a file prefix to the end of the ARN.\n\
        \             \n\
        \               [arn:aws:s3:::amzn-s3-demo-bucket/development/] \n\
        \              \n\
        \               }\n\
        \       {-   {b CloudWatch Logs log group}: \n\
        \           \n\
        \             \
         [arn:aws:logs:us-west-1:123456789012:log-group:/mystack-testgroup-12ABC1AB12A1:*] \n\
        \            \n\
        \             }\n\
        \       {-   {b Kinesis Data Firehose delivery stream}:\n\
        \           \n\
        \             [arn:aws:kinesis:us-east-2:0123456789:stream/my_stream_name] \n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
  name : resolver_query_log_config_name;
      [@ocaml.doc "The name that you want to give the query logging configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_resolver_endpoint_response = {
  resolver_endpoint : resolver_endpoint option;
      [@ocaml.doc
        "Information about the [CreateResolverEndpoint] request, including the status of the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_address_request = {
  ipv6 : ipv6 option; [@ocaml.doc " The IPv6 address that you want to use for DNS queries. \n"]
  ip : ip option; [@ocaml.doc "The IPv4 address that you want to use for DNS queries.\n"]
  subnet_id : subnet_id; [@ocaml.doc "The ID of the subnet that contains the IP address. \n"]
}
[@@ocaml.doc
  "In a \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_CreateResolverEndpoint.html}CreateResolverEndpoint} \
   request, the IP address that DNS queries originate from (for outbound endpoints) or that you \
   forward DNS queries to (for inbound endpoints). [IpAddressRequest] also includes the ID of the \
   subnet that contains the IP address.\n"]

type nonrec ip_addresses_request = ip_address_request list [@@ocaml.doc ""]

type nonrec create_resolver_endpoint_request = {
  ipv6_internet_access_enabled : ipv6_internet_access_enabled option;
      [@ocaml.doc
        "Specifies whether IPv6 internet access is enabled for the outbound Resolver endpoint. \
         When set to [true], the endpoint elastic network interfaces (ENIs) can forward DNS \
         queries to public IPv6 targets through an internet gateway. Default is false.\n\n\
        \  When you enable IPv6 internet access, use network controls like security groups, NACLs, \
         or egress-only internet gateways to protect the endpoint ENIs from unsolicited ingress \
         traffic. Be aware that some network controls can affect DNS query throughput due to \
         connection tracking. For more information, see \
         {{:https://docs.aws.amazon.com/ec2/latest/userguide/security-group-connection-tracking.html}Amazon \
         EC2 security group connection tracking} and \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/best-practices-resolver-endpoint-scaling.html}Resolver \
         endpoint scaling}.\n\
        \  \n\
        \   "]
  dns64_enabled : dns64_enabled option;
      [@ocaml.doc
        "Specifies whether DNS64 is enabled for the inbound Resolver endpoint. When set to [true], \
         Route 53 Resolver synthesizes AAAA (IPv6) records for IPv4-only services by prepending \
         the [64:ff9b::/96] prefix to the IPv4 address. This enables IPv6-only clients that send \
         queries through the inbound endpoint to reach IPv4-only services. DNS64 works with NAT64 \
         to provide complete IPv6-to-IPv4 translation. Default is false.\n"]
  target_name_server_metrics_enabled : target_name_server_metrics_enabled option;
      [@ocaml.doc
        "Specifies whether target name server metrics are enabled for the outbound Resolver \
         endpoints. When set to true, one-minute granular metrics are published in CloudWatch for \
         each target name server associated with this endpoint. When set to false, metrics are not \
         published. Default is false. This is not supported for inbound Resolver endpoints.\n\n\
        \  Standard CloudWatch pricing and charges are applied for using the Route 53 Resolver \
         endpoint target name server metrics. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/monitoring-resolver-with-cloudwatch.html}Detailed \
         metrics}.\n\
        \  \n\
        \   "]
  rni_enhanced_metrics_enabled : rni_enhanced_metrics_enabled option;
      [@ocaml.doc
        "Specifies whether RNI enhanced metrics are enabled for the Resolver endpoints. When set \
         to true, one-minute granular metrics are published in CloudWatch for each RNI associated \
         with this endpoint. When set to false, metrics are not published. Default is false.\n\n\
        \  Standard CloudWatch pricing and charges are applied for using the Route 53 Resolver \
         endpoint RNI enhanced metrics. For more information, see \
         {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/monitoring-resolver-with-cloudwatch.html}Detailed \
         metrics}.\n\
        \  \n\
        \   "]
  protocols : protocol_list option;
      [@ocaml.doc
        " The protocols you want to use for the endpoint. DoH-FIPS is applicable for default \
         inbound endpoints only. \n\n\
        \ For a default inbound endpoint you can apply the protocols as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   Do53 and DoH in combination.\n\
        \            \n\
        \             }\n\
        \        {-  Do53 and DoH-FIPS in combination.\n\
        \            \n\
        \             }\n\
        \        {-  Do53 alone.\n\
        \            \n\
        \             }\n\
        \        {-  DoH alone.\n\
        \            \n\
        \             }\n\
        \        {-  DoH-FIPS alone.\n\
        \            \n\
        \             }\n\
        \        {-  None, which is treated as Do53.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For a delegation inbound endpoint you can use Do53 only.\n\
        \   \n\
        \    For an outbound endpoint you can apply the protocols as follows:\n\
        \    \n\
        \     {ul\n\
        \           {-   Do53 and DoH in combination.\n\
        \               \n\
        \                }\n\
        \           {-  Do53 alone.\n\
        \               \n\
        \                }\n\
        \           {-  DoH alone.\n\
        \               \n\
        \                }\n\
        \           {-  None, which is treated as Do53.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  resolver_endpoint_type : resolver_endpoint_type option;
      [@ocaml.doc
        " For the endpoint type you can choose either IPv4, IPv6, or dual-stack. A dual-stack \
         endpoint means that it will resolve via both IPv4 and IPv6. This endpoint type is applied \
         to all IP addresses. \n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of the tag keys and values that you want to associate with the endpoint.\n"]
  preferred_instance_type : outpost_instance_type option;
      [@ocaml.doc
        "The instance type. If you specify this, you must also specify a value for the [OutpostArn].\n"]
  outpost_arn : outpost_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Outpost. If you specify this, you must also specify \
         a value for the [PreferredInstanceType]. \n"]
  ip_addresses : ip_addresses_request;
      [@ocaml.doc
        "The subnets and IP addresses in your VPC that DNS queries originate from (for outbound \
         endpoints) or that you forward DNS queries to (for inbound endpoints). The subnet ID \
         uniquely identifies a VPC. \n\n\
        \  Even though the minimum is 1, Route\194\16053 requires that you create at least two.\n\
        \  \n\
        \   "]
  direction : resolver_endpoint_direction;
      [@ocaml.doc
        "Specify the applicable value:\n\n\
        \ {ul\n\
        \       {-   [INBOUND]: Resolver forwards DNS queries to the DNS service for a VPC from \
         your network.\n\
        \           \n\
        \            }\n\
        \       {-   [OUTBOUND]: Resolver forwards DNS queries from the DNS service for a VPC to \
         your network.\n\
        \           \n\
        \            }\n\
        \       {-   [INBOUND_DELEGATION]: Resolver delegates queries to Route 53 private hosted \
         zones from your network.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  security_group_ids : security_group_ids;
      [@ocaml.doc
        "The ID of one or more security groups that you want to use to control access to this VPC. \
         The security group that you specify must include one or more inbound rules (for inbound \
         Resolver endpoints) or outbound rules (for outbound Resolver endpoints). Inbound and \
         outbound rules must allow TCP and UDP access. For inbound access, open port 53. For \
         outbound access, open the port that you're using for DNS queries on your network.\n\n\
        \ Some security group rules will cause your connection to be tracked. For outbound \
         resolver endpoint, it can potentially impact the maximum queries per second from outbound \
         endpoint to your target name server. For inbound resolver endpoint, it can bring down the \
         overall maximum queries per second per IP address to as low as 1500. To avoid connection \
         tracking caused by security group, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/security-group-connection-tracking.html#untracked-connectionsl}Untracked \
         connections}.\n\
        \ "]
  name : name option;
      [@ocaml.doc
        "A friendly name that lets you easily find a configuration in the Resolver dashboard in \
         the Route 53 console.\n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed requests to be retried \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string, for example, a date/time stamp. \n"]
}
[@@ocaml.doc ""]

type nonrec create_outpost_resolver_response = {
  outpost_resolver : outpost_resolver option;
      [@ocaml.doc
        "Information about the [CreateOutpostResolver] request, including the status of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_outpost_resolver_request = {
  tags : tag_list option;
      [@ocaml.doc " A string that helps identify the Route\194\16053 Resolvers on Outpost. \n"]
  outpost_arn : outpost_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Outpost. If you specify this, you must also specify \
         a value for the [PreferredInstanceType].\n"]
  preferred_instance_type : outpost_instance_type;
      [@ocaml.doc
        " The Amazon EC2 instance type. If you specify this, you must also specify a value for the \
         [OutpostArn]. \n"]
  instance_count : instance_count option;
      [@ocaml.doc
        "Number of Amazon EC2 instances for the Resolver on Outpost. The default and minimal value \
         is 4.\n"]
  name : outpost_resolver_name;
      [@ocaml.doc
        "A friendly name that lets you easily find a configuration in the Resolver dashboard in \
         the Route\194\16053 console.\n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed requests to be retried \
         without the risk of running the operation twice. \n\n\
        \  [CreatorRequestId] can be any unique string, for example, a date/time stamp.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_firewall_rule_group_response = {
  firewall_rule_group : firewall_rule_group option;
      [@ocaml.doc "A collection of rules used to filter DNS network traffic. \n"]
}
[@@ocaml.doc ""]

type nonrec create_firewall_rule_group_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of the tag keys and values that you want to associate with the rule group. \n"]
  name : name; [@ocaml.doc "A name that lets you identify the rule group, to manage and use it.\n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string defined by you to identify the request. This allows you to retry failed \
         requests without the risk of running the operation twice. This can be any unique string, \
         for example, a timestamp. \n"]
}
[@@ocaml.doc ""]

type nonrec create_firewall_rule_response = {
  firewall_rule : firewall_rule option; [@ocaml.doc "The firewall rule that you just created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_firewall_rule_request = {
  firewall_rule_type : firewall_rule_type option;
      [@ocaml.doc
        "The rule type configuration for the firewall rule. This is a tagged union \226\128\148 \
         set exactly one of its members. This setting is mutually exclusive with the top-level \
         [FirewallDomainListId] and [DnsThreatProtection] fields. Use one of:\n\n\
        \ {ul\n\
        \       {-   [FirewallAdvancedContentCategory] \226\128\148 match an AWS-managed content \
         category (for example, [VIOLENCE_AND_HATE_SPEECH]).\n\
        \           \n\
        \            }\n\
        \       {-   [FirewallAdvancedThreatCategory] \226\128\148 match an AWS-managed advanced \
         threat category (for example, [PHISHING]).\n\
        \           \n\
        \            }\n\
        \       {-   [DnsThreatProtection] \226\128\148 match a built-in DNS Firewall Advanced \
         threat detector ([DGA], [DNS_TUNNELING], or [DICTIONARY_DGA]).\n\
        \           \n\
        \            }\n\
        \       {-   [PartnerThreatProtection] \226\128\148 match a third-party threat feed \
         delivered through AWS Marketplace. The selected partner must be an active subscription on \
         the calling account.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   To enumerate the values supported in your account, call [ListFirewallRuleTypes].\n\
        \   "]
  confidence_threshold : confidence_threshold option;
      [@ocaml.doc
        " The confidence threshold for DNS Firewall Advanced. You must provide this value when you \
         create a DNS Firewall Advanced rule. The confidence level values mean: \n\n\
        \ {ul\n\
        \       {-   [LOW]: Provides the highest detection rate for threats, but also increases \
         false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: Provides a balance between detecting threats and false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [HIGH]: Detects only the most well corroborated threats with a low rate of \
         false positives. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dns_threat_protection : dns_threat_protection option;
      [@ocaml.doc
        " The type of the DNS Firewall Advanced rule. This setting is mutually exclusive with \
         [FirewallDomainListId] and [FirewallRuleType]. Valid values are: \n\n\
        \ {ul\n\
        \       {-   [DGA]: Domain generation algorithms detection. DGAs are used by attackers to \
         generate a large number of domains to launch malware attacks.\n\
        \           \n\
        \            }\n\
        \       {-   [DNS_TUNNELING]: DNS tunneling detection. DNS tunneling is used by attackers \
         to exfiltrate data from the client by using the DNS tunnel without making a network \
         connection to the client.\n\
        \           \n\
        \            }\n\
        \       {-   [DICTIONARY_DGA]: Dictionary-based domain generation algorithms detection. \
         Dictionary DGAs use wordlists to generate domains that appear more legitimate, making \
         them harder to detect than traditional DGAs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  qtype : qtype option;
      [@ocaml.doc
        " The DNS query type you want the rule to evaluate. Allowed values are; \n\n\
        \ {ul\n\
        \       {-   A: Returns an IPv4 address.\n\
        \           \n\
        \            }\n\
        \       {-  AAAA: Returns an Ipv6 address.\n\
        \           \n\
        \            }\n\
        \       {-  CAA: Restricts CAs that can create SSL/TLS certifications for the domain.\n\
        \           \n\
        \            }\n\
        \       {-  CNAME: Returns another domain name.\n\
        \           \n\
        \            }\n\
        \       {-  DS: Record that identifies the DNSSEC signing key of a delegated zone.\n\
        \           \n\
        \            }\n\
        \       {-  MX: Specifies mail servers.\n\
        \           \n\
        \            }\n\
        \       {-  NAPTR: Regular-expression-based rewriting of domain names.\n\
        \           \n\
        \            }\n\
        \       {-  NS: Authoritative name servers.\n\
        \           \n\
        \            }\n\
        \       {-  PTR: Maps an IP address to a domain name.\n\
        \           \n\
        \            }\n\
        \       {-  SOA: Start of authority record for the zone.\n\
        \           \n\
        \            }\n\
        \       {-  SPF: Lists the servers authorized to send emails from a domain.\n\
        \           \n\
        \            }\n\
        \       {-  SRV: Application specific values that identify servers.\n\
        \           \n\
        \            }\n\
        \       {-  TXT: Verifies email senders and application-specific values.\n\
        \           \n\
        \            }\n\
        \       {-  A query type you define by using the DNS type ID, for example 28 for AAAA. The \
         values must be defined as TYPENUMBER, where the NUMBER can be 1-65534, for example, \
         TYPE28. For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_DNS_record_types}List of DNS record types}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  firewall_domain_redirection_action : firewall_domain_redirection_action option;
      [@ocaml.doc
        " How you want the the rule to evaluate DNS redirection in the DNS redirection chain, such \
         as CNAME or DNAME. \n\n\
        \  [INSPECT_REDIRECTION_DOMAIN]: (Default) inspects all domains in the redirection chain. \
         The individual domains in the redirection chain must be added to the domain list.\n\
        \ \n\
        \   [TRUST_REDIRECTION_DOMAIN]: Inspects only the first domain in the redirection chain. \
         You don't need to add the subsequent domains in the domain in the redirection list to the \
         domain list.\n\
        \  "]
  name : name; [@ocaml.doc "A name that lets you identify the rule in the rule group.\n"]
  block_override_ttl : block_override_ttl option;
      [@ocaml.doc
        "The recommended amount of time, in seconds, for the DNS resolver or web browser to cache \
         the provided override record. Used for the rule action [BLOCK] with a [BlockResponse] \
         setting of [OVERRIDE].\n\n\
        \ This setting is required if the [BlockResponse] setting is [OVERRIDE].\n\
        \ "]
  block_override_dns_type : block_override_dns_type option;
      [@ocaml.doc
        "The DNS record's type. This determines the format of the record value that you provided \
         in [BlockOverrideDomain]. Used for the rule action [BLOCK] with a [BlockResponse] setting \
         of [OVERRIDE].\n\n\
        \ This setting is required if the [BlockResponse] setting is [OVERRIDE].\n\
        \ "]
  block_override_domain : block_override_domain option;
      [@ocaml.doc
        "The custom DNS record to send back in response to the query. Used for the rule action \
         [BLOCK] with a [BlockResponse] setting of [OVERRIDE].\n\n\
        \ This setting is required if the [BlockResponse] setting is [OVERRIDE].\n\
        \ "]
  block_response : block_response option;
      [@ocaml.doc
        "The way that you want DNS Firewall to block the request, used with the rule action \
         setting [BLOCK]. \n\n\
        \ {ul\n\
        \       {-   [NODATA] - Respond indicating that the query was successful, but no response \
         is available for it.\n\
        \           \n\
        \            }\n\
        \       {-   [NXDOMAIN] - Respond indicating that the domain name that's in the query \
         doesn't exist.\n\
        \           \n\
        \            }\n\
        \       {-   [OVERRIDE] - Provide a custom override in the response. This option requires \
         custom handling details in the rule's [BlockOverride*] settings. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   This setting is required if the rule action setting is [BLOCK].\n\
        \   "]
  action : action;
      [@ocaml.doc
        "The action that DNS Firewall should take on a DNS query when it matches one of the \
         domains in the rule's domain list, or a threat in a DNS Firewall Advanced rule:\n\n\
        \ {ul\n\
        \       {-   [ALLOW] - Permit the request to go through. Not available for DNS Firewall \
         Advanced rules.\n\
        \           \n\
        \            }\n\
        \       {-   [ALERT] - Permit the request and send metrics and logs to Cloud Watch.\n\
        \           \n\
        \            }\n\
        \       {-   [BLOCK] - Disallow the request. This option requires additional details in \
         the rule's [BlockResponse]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  priority : priority;
      [@ocaml.doc
        "The setting that determines the processing order of the rule in the rule group. DNS \
         Firewall processes the rules in a rule group by order of priority, starting from the \
         lowest setting.\n\n\
        \ You must specify a unique priority for each rule in a rule group. To make it easier to \
         insert rules later, leave space between the numbers, for example, use 100, 200, and so \
         on. You can change the priority setting for the rules in a rule group at any time.\n\
        \ "]
  firewall_domain_list_id : resource_id option;
      [@ocaml.doc
        "The ID of the domain list that you want to use in the rule. Can't be used together with \
         [DnsThreatProtecton].\n"]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the firewall rule group where you want to create the rule. \n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows you to retry failed requests \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string, for example, a date/time stamp. \n"]
}
[@@ocaml.doc ""]

type nonrec create_firewall_domain_list_response = {
  firewall_domain_list : firewall_domain_list option;
      [@ocaml.doc "The domain list that you just created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_firewall_domain_list_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of the tag keys and values that you want to associate with the domain list. \n"]
  name : name; [@ocaml.doc "A name that lets you identify the domain list to manage and use it.\n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows you to retry failed requests \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string, for example, a date/time stamp. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_firewall_rule_error = {
  message : string_ option; [@ocaml.doc "A message that provides details about the error.\n"]
  code : string_ option; [@ocaml.doc "The error code for the failure.\n"]
  firewall_rule : update_firewall_rule_entry option;
      [@ocaml.doc "The firewall rule entry that caused the error.\n"]
}
[@@ocaml.doc "An error that occurred while updating a firewall rule in a batch operation.\n"]

type nonrec batch_update_firewall_rule_errors = batch_update_firewall_rule_error list
[@@ocaml.doc ""]

type nonrec batch_update_firewall_rule_response = {
  update_errors : batch_update_firewall_rule_errors option;
      [@ocaml.doc "A list of errors that occurred while updating the firewall rules.\n"]
  updated_firewall_rules : firewall_rules option;
      [@ocaml.doc "The firewall rules that were successfully updated by the request.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_firewall_rule_request = {
  update_firewall_rule_entries : update_firewall_rule_entries;
      [@ocaml.doc "The list of firewall rules to update.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_rule_entry = {
  qtype : qtype option; [@ocaml.doc "The DNS query type that the rule evaluates.\n"]
  firewall_threat_protection_id : resource_id option;
      [@ocaml.doc "The ID of the DNS Firewall Advanced rule.\n"]
  firewall_domain_list_id : resource_id option;
      [@ocaml.doc "The ID of the domain list that's used in the rule.\n"]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc "The unique identifier of the firewall rule group for the rule.\n"]
}
[@@ocaml.doc "The details for deleting a single firewall rule in a batch operation.\n"]

type nonrec batch_delete_firewall_rule_error = {
  message : string_ option; [@ocaml.doc "A message that provides details about the error.\n"]
  code : string_ option; [@ocaml.doc "The error code for the failure.\n"]
  firewall_rule : delete_firewall_rule_entry option;
      [@ocaml.doc "The firewall rule entry that caused the error.\n"]
}
[@@ocaml.doc "An error that occurred while deleting a firewall rule in a batch operation.\n"]

type nonrec batch_delete_firewall_rule_errors = batch_delete_firewall_rule_error list
[@@ocaml.doc ""]

type nonrec batch_delete_firewall_rule_response = {
  delete_errors : batch_delete_firewall_rule_errors option;
      [@ocaml.doc "A list of errors that occurred while deleting the firewall rules.\n"]
  deleted_firewall_rules : firewall_rules option;
      [@ocaml.doc "The firewall rules that were successfully deleted by the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_rule_entries = delete_firewall_rule_entry list [@@ocaml.doc ""]

type nonrec batch_delete_firewall_rule_request = {
  delete_firewall_rule_entries : delete_firewall_rule_entries;
      [@ocaml.doc "The list of firewall rules to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_firewall_rule_entry = {
  firewall_rule_type : firewall_rule_type option;
      [@ocaml.doc
        "The rule type configuration for the firewall rule. This is a tagged union \226\128\148 \
         set exactly one of its members. This setting is mutually exclusive with the top-level \
         [FirewallDomainListId] and [DnsThreatProtection] fields. Use one of:\n\n\
        \ {ul\n\
        \       {-   [FirewallAdvancedContentCategory] \226\128\148 match an AWS-managed content \
         category (for example, [VIOLENCE_AND_HATE_SPEECH]).\n\
        \           \n\
        \            }\n\
        \       {-   [FirewallAdvancedThreatCategory] \226\128\148 match an AWS-managed advanced \
         threat category (for example, [PHISHING]).\n\
        \           \n\
        \            }\n\
        \       {-   [DnsThreatProtection] \226\128\148 match a built-in DNS Firewall Advanced \
         threat detector ([DGA], [DNS_TUNNELING], or [DICTIONARY_DGA]).\n\
        \           \n\
        \            }\n\
        \       {-   [PartnerThreatProtection] \226\128\148 match a third-party threat feed \
         delivered through AWS Marketplace. The selected partner must be an active subscription on \
         the calling account.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   To enumerate the values supported in your account, call [ListFirewallRuleTypes].\n\
        \   "]
  confidence_threshold : confidence_threshold option;
      [@ocaml.doc
        "The confidence threshold for DNS Firewall Advanced. You must provide this value when you \
         create or update a DNS Firewall Advanced rule. The confidence level values mean:\n\n\
        \ {ul\n\
        \       {-   [LOW]: Provides the highest detection rate for threats, but also increases \
         false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: Provides a balance between detecting threats and false positives.\n\
        \           \n\
        \            }\n\
        \       {-   [HIGH]: Detects only the most well corroborated threats with a low rate of \
         false positives.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  dns_threat_protection : dns_threat_protection option;
      [@ocaml.doc
        "The type of the DNS Firewall Advanced rule. This setting is mutually exclusive with \
         [FirewallDomainListId] and [FirewallRuleType]. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [DGA]: Domain generation algorithms detection. DGAs are used by attackers to \
         generate a large number of domains to launch malware attacks.\n\
        \           \n\
        \            }\n\
        \       {-   [DNS_TUNNELING]: DNS tunneling detection. DNS tunneling is used by attackers \
         to exfiltrate data from the client by using the DNS tunnel without making a network \
         connection to the client.\n\
        \           \n\
        \            }\n\
        \       {-   [DICTIONARY_DGA]: Dictionary-based domain generation algorithms detection. \
         Dictionary DGAs use wordlists to generate domains that appear more legitimate, making \
         them harder to detect than traditional DGAs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  qtype : qtype option;
      [@ocaml.doc
        "The DNS query type you want the rule to evaluate. Allowed values are:\n\n\
        \ {ul\n\
        \       {-  A: Returns an IPv4 address.\n\
        \           \n\
        \            }\n\
        \       {-  AAAA: Returns an IPv6 address.\n\
        \           \n\
        \            }\n\
        \       {-  CAA: Restricts CAs that can create SSL/TLS certifications for the domain.\n\
        \           \n\
        \            }\n\
        \       {-  CNAME: Returns another domain name.\n\
        \           \n\
        \            }\n\
        \       {-  DS: Record that identifies the DNSSEC signing key of a delegated zone.\n\
        \           \n\
        \            }\n\
        \       {-  MX: Specifies mail servers.\n\
        \           \n\
        \            }\n\
        \       {-  NAPTR: Regular-expression-based rewriting of domain names.\n\
        \           \n\
        \            }\n\
        \       {-  NS: Authoritative name servers.\n\
        \           \n\
        \            }\n\
        \       {-  PTR: Maps an IP address to a domain name.\n\
        \           \n\
        \            }\n\
        \       {-  SOA: Start of authority record for the zone.\n\
        \           \n\
        \            }\n\
        \       {-  SPF: Lists the servers authorized to send emails from a domain.\n\
        \           \n\
        \            }\n\
        \       {-  SRV: Application specific values that identify servers.\n\
        \           \n\
        \            }\n\
        \       {-  TXT: Verifies email senders and application-specific values.\n\
        \           \n\
        \            }\n\
        \       {-  A query type you define by using the DNS type ID, for example 28 for AAAA. The \
         values must be defined as TYPENUMBER, where the NUMBER can be 1-65534, for example, \
         TYPE28. For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_DNS_record_types}List of DNS record types}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  firewall_domain_redirection_action : firewall_domain_redirection_action option;
      [@ocaml.doc
        "How you want the rule to evaluate DNS redirection in the DNS redirection chain, such as \
         CNAME or DNAME.\n\n\
        \  [INSPECT_REDIRECTION_DOMAIN]: (Default) inspects all domains in the redirection chain. \
         The individual domains in the redirection chain must be added to the domain list.\n\
        \ \n\
        \   [TRUST_REDIRECTION_DOMAIN]: Inspects only the first domain in the redirection chain. \
         You don't need to add the subsequent domains in the redirection list to the domain list.\n\
        \  "]
  name : name; [@ocaml.doc "A name that lets you identify the rule in the rule group.\n"]
  block_override_ttl : block_override_ttl option;
      [@ocaml.doc
        "The recommended amount of time, in seconds, for the DNS resolver or web browser to cache \
         the provided override record. Used for the rule action [BLOCK] with a [BlockResponse] \
         setting of [OVERRIDE].\n\n\
        \ This setting is required if the [BlockResponse] setting is [OVERRIDE].\n\
        \ "]
  block_override_dns_type : block_override_dns_type option;
      [@ocaml.doc
        "The DNS record's type. This determines the format of the record value that you provided \
         in [BlockOverrideDomain]. Used for the rule action [BLOCK] with a [BlockResponse] setting \
         of [OVERRIDE].\n"]
  block_override_domain : block_override_domain option;
      [@ocaml.doc
        "The custom DNS record to send back in response to the query. Used for the rule action \
         [BLOCK] with a [BlockResponse] setting of [OVERRIDE].\n"]
  block_response : block_response option;
      [@ocaml.doc
        "The way that you want DNS Firewall to block the request, used with the rule action \
         setting [BLOCK].\n\n\
        \ {ul\n\
        \       {-   [NODATA] - Respond indicating that the query was successful, but no response \
         is available for it.\n\
        \           \n\
        \            }\n\
        \       {-   [NXDOMAIN] - Respond indicating that the domain name that's in the query \
         doesn't exist.\n\
        \           \n\
        \            }\n\
        \       {-   [OVERRIDE] - Provide a custom override in the response. This option requires \
         custom handling details in the rule's [BlockOverride*] settings.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  action : action;
      [@ocaml.doc
        "The action that DNS Firewall should take on a DNS query when it matches one of the \
         domains in the rule's domain list, or a threat in a DNS Firewall Advanced rule:\n\n\
        \ {ul\n\
        \       {-   [ALLOW] - Permit the request to go through. Not available for DNS Firewall \
         Advanced rules.\n\
        \           \n\
        \            }\n\
        \       {-   [ALERT] - Permit the request and send metrics and logs to CloudWatch.\n\
        \           \n\
        \            }\n\
        \       {-   [BLOCK] - Disallow the request. This option requires additional details in \
         the rule's [BlockResponse].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  priority : priority;
      [@ocaml.doc
        "The setting that determines the processing order of the rule in the rule group. DNS \
         Firewall processes the rules in a rule group by order of priority, starting from the \
         lowest setting.\n"]
  firewall_domain_list_id : resource_id option;
      [@ocaml.doc
        "The ID of the domain list that you want to use in the rule. This setting is mutually \
         exclusive with [DnsThreatProtection] and [FirewallRuleType].\n"]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the firewall rule group where you want to create the rule.\n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows you to retry failed requests \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string, for example, a date/time stamp.\n"]
}
[@@ocaml.doc "The details for creating a single firewall rule in a batch operation.\n"]

type nonrec batch_create_firewall_rule_error = {
  message : string_ option; [@ocaml.doc "A message that provides details about the error.\n"]
  code : string_ option; [@ocaml.doc "The error code for the failure.\n"]
  firewall_rule : create_firewall_rule_entry option;
      [@ocaml.doc "The firewall rule entry that caused the error.\n"]
}
[@@ocaml.doc "An error that occurred while creating a firewall rule in a batch operation.\n"]

type nonrec batch_create_firewall_rule_errors = batch_create_firewall_rule_error list
[@@ocaml.doc ""]

type nonrec batch_create_firewall_rule_response = {
  create_errors : batch_create_firewall_rule_errors option;
      [@ocaml.doc "A list of errors that occurred while creating the firewall rules.\n"]
  created_firewall_rules : firewall_rules option;
      [@ocaml.doc "The firewall rules that were successfully created by the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_firewall_rule_entries = create_firewall_rule_entry list [@@ocaml.doc ""]

type nonrec batch_create_firewall_rule_request = {
  create_firewall_rule_entries : create_firewall_rule_entries;
      [@ocaml.doc "The list of firewall rules to create.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_resolver_rule_response = {
  resolver_rule_association : resolver_rule_association option;
      [@ocaml.doc
        "Information about the [AssociateResolverRule] request, including the status of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_resolver_rule_request = {
  vpc_id : resource_id;
      [@ocaml.doc "The ID of the VPC that you want to associate the Resolver rule with.\n"]
  name : name option;
      [@ocaml.doc
        "A name for the association that you're creating between a Resolver rule and a VPC.\n\n\
        \ The name can be up to 64 characters long and can contain letters (a-z, A-Z), numbers \
         (0-9), hyphens (-), underscores (_), and spaces. The name cannot consist of only numbers.\n\
        \ "]
  resolver_rule_id : resource_id;
      [@ocaml.doc
        "The ID of the Resolver rule that you want to associate with the VPC. To list the existing \
         Resolver rules, use \
         {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_route53resolver_ListResolverRules.html}ListResolverRules}.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_resolver_query_log_config_response = {
  resolver_query_log_config_association : resolver_query_log_config_association option;
      [@ocaml.doc
        "A complex type that contains settings for a specified association between an Amazon VPC \
         and a query logging configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_resolver_query_log_config_request = {
  resource_id : resource_id;
      [@ocaml.doc
        "The ID of an Amazon VPC that you want this query logging configuration to log queries \
         for.\n\n\
        \  The VPCs and the query logging configuration must be in the same Region.\n\
        \  \n\
        \   "]
  resolver_query_log_config_id : resource_id;
      [@ocaml.doc
        "The ID of the query logging configuration that you want to associate a VPC with.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_resolver_endpoint_ip_address_response = {
  resolver_endpoint : resolver_endpoint option;
      [@ocaml.doc "The response to an [AssociateResolverEndpointIpAddress] request.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_resolver_endpoint_ip_address_request = {
  ip_address : ip_address_update;
      [@ocaml.doc
        "Either the IPv4 address that you want to add to a Resolver endpoint or a subnet ID. If \
         you specify a subnet ID, Resolver chooses an IP address for you from the available IPs in \
         the specified subnet.\n"]
  resolver_endpoint_id : resource_id;
      [@ocaml.doc "The ID of the Resolver endpoint that you want to associate IP addresses with.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_firewall_rule_group_response = {
  firewall_rule_group_association : firewall_rule_group_association option;
      [@ocaml.doc
        "The association that you just created. The association has an ID that you can use to \
         identify it in other requests, like update and delete.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_firewall_rule_group_request = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of the tag keys and values that you want to associate with the rule group \
         association. \n"]
  mutation_protection : mutation_protection_status option;
      [@ocaml.doc
        "If enabled, this setting disallows modification or removal of the association, to help \
         prevent against accidentally altering DNS firewall protections. When you create the \
         association, the default setting is [DISABLED]. \n"]
  name : name; [@ocaml.doc "A name that lets you identify the association, to manage and use it.\n"]
  priority : priority;
      [@ocaml.doc
        "The setting that determines the processing order of the rule group among the rule groups \
         that you associate with the specified VPC. DNS Firewall filters VPC traffic starting from \
         the rule group with the lowest numeric priority setting. \n\n\
        \ You must specify a unique priority for each rule group that you associate with a single \
         VPC. To make it easier to insert rule groups later, leave space between the numbers, for \
         example, use 101, 200, and so on. You can change the priority setting for a rule group \
         association after you create it.\n\
        \ \n\
        \  The allowed values for [Priority] are between 100 and 9900.\n\
        \  "]
  vpc_id : resource_id;
      [@ocaml.doc
        "The unique identifier of the VPC that you want to associate with the rule group. \n"]
  firewall_rule_group_id : resource_id;
      [@ocaml.doc "The unique identifier of the firewall rule group. \n"]
  creator_request_id : creator_request_id;
      [@ocaml.doc
        "A unique string that identifies the request and that allows failed requests to be retried \
         without the risk of running the operation twice. [CreatorRequestId] can be any unique \
         string, for example, a date/time stamp. \n"]
}
[@@ocaml.doc ""]
