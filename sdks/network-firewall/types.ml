type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec status_message = string [@@ocaml.doc ""]

type nonrec attachment_status =
  | CREATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | SCALING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec endpoint_id = string [@@ocaml.doc ""]

type nonrec az_subnet = string [@@ocaml.doc ""]

type nonrec attachment = {
  subnet_id : az_subnet option;
      [@ocaml.doc
        "The unique identifier of the subnet that you've specified to be used for a firewall \
         endpoint. \n"]
  endpoint_id : endpoint_id option;
      [@ocaml.doc
        "The identifier of the firewall endpoint that Network Firewall has instantiated in the \
         subnet. You use this to identify the firewall endpoint in the VPC route tables, when you \
         redirect the VPC traffic through the endpoint. \n"]
  status : attachment_status option;
      [@ocaml.doc
        "The current status of the firewall endpoint instantiation in the subnet. \n\n\
        \ When this value is [READY], the endpoint is available to handle network traffic. \
         Otherwise, this value reflects its state, for example [CREATING] or [DELETING].\n\
        \ "]
  status_message : status_message option;
      [@ocaml.doc
        "If Network Firewall fails to create or delete the firewall endpoint in the subnet, it \
         populates this with the reason for the error or failure and how to resolve it. A [FAILED] \
         status indicates a non-recoverable state, and a [ERROR] status indicates an issue that \
         you can fix. Depending on the error, it can take as many as 15 minutes to populate this \
         field. For more information about the causes for failiure or errors and solutions \
         available for this field, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-troubleshooting-endpoint-failures.html}Troubleshooting \
         firewall endpoint failures} in the {i Network Firewall Developer Guide}.\n"]
}
[@@ocaml.doc
  "The definition and status of the firewall endpoint for a single subnet. In each configured \
   subnet, Network Firewall instantiates a firewall endpoint to handle network traffic. \n\n\
  \ This data type is used for any firewall endpoint type: \n\
  \ \n\
  \  {ul\n\
  \        {-  For [Firewall.SubnetMappings], this [Attachment] is part of the [FirewallStatus] \
   sync states information. You define firewall subnets using [CreateFirewall] and \
   [AssociateSubnets]. \n\
  \            \n\
  \             }\n\
  \        {-  For [VpcEndpointAssociation], this [Attachment] is part of the \
   [VpcEndpointAssociationStatus] sync states information. You define these subnets using \
   [CreateVpcEndpointAssociation]. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec az_sync_state = { attachment : attachment option [@ocaml.doc ""] }
[@@ocaml.doc "The status of the firewall endpoint defined by a [VpcEndpointAssociation]. \n"]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Unable to process the request due to throttling limitations.\n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Unable to locate a resource using the parameters that you provided.\n"]

type nonrec invalid_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because of a problem with your request. Examples include: \n\n\
  \ {ul\n\
  \       {-  You specified an unsupported parameter name or value.\n\
  \           \n\
  \            }\n\
  \       {-  You tried to update a property with a value that isn't among the available types.\n\
  \           \n\
  \            }\n\
  \       {-  Your request references an ARN that is malformed, or corresponds to a resource that \
   isn't valid in the context of the request.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec internal_server_error = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Your request is valid, but Network Firewall couldn't perform the operation because of a system \
   problem. Retry your request. \n"]

type nonrec transit_gateway_attachment_status =
  | CREATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | PENDING_ACCEPTANCE [@ocaml.doc ""]
  | REJECTING [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec transit_gateway_attachment_id = string [@@ocaml.doc ""]

type nonrec accept_network_firewall_transit_gateway_attachment_response = {
  transit_gateway_attachment_id : transit_gateway_attachment_id;
      [@ocaml.doc "The unique identifier of the transit gateway attachment that was accepted.\n"]
  transit_gateway_attachment_status : transit_gateway_attachment_status;
      [@ocaml.doc
        "The current status of the transit gateway attachment. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [CREATING] - The attachment is being created\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - The attachment is being deleted\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The attachment has been deleted\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The attachment creation has failed and cannot be recovered\n\
        \           \n\
        \            }\n\
        \       {-   [ERROR] - The attachment is in an error state that might be recoverable\n\
        \           \n\
        \            }\n\
        \       {-   [READY] - The attachment is active and processing traffic\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_ACCEPTANCE] - The attachment is waiting to be accepted\n\
        \           \n\
        \            }\n\
        \       {-   [REJECTING] - The attachment is in the process of being rejected\n\
        \           \n\
        \            }\n\
        \       {-   [REJECTED] - The attachment has been rejected\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec accept_network_firewall_transit_gateway_attachment_request = {
  transit_gateway_attachment_id : transit_gateway_attachment_id;
      [@ocaml.doc
        "Required. The unique identifier of the transit gateway attachment to accept. This ID is \
         returned in the response when creating a transit gateway-attached firewall.\n"]
}
[@@ocaml.doc ""]

type nonrec dimension_value = string [@@ocaml.doc ""]

type nonrec dimension = {
  value : dimension_value; [@ocaml.doc "The value to use in the custom metric dimension.\n"]
}
[@@ocaml.doc
  "The value to use in an Amazon CloudWatch custom metric dimension. This is used in the \
   [PublishMetrics] [CustomAction]. A CloudWatch custom metric dimension is a name/value pair \
   that's part of the identity of a metric. \n\n\
  \ Network Firewall sets the dimension name to [CustomAction] and you provide the dimension value. \n\
  \ \n\
  \  For more information about CloudWatch custom metric dimensions, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html#usingDimensions}Publishing \
   Custom Metrics} in the \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
   CloudWatch User Guide}.\n\
  \  "]

type nonrec dimensions = dimension list [@@ocaml.doc ""]

type nonrec publish_metric_action = { dimensions : dimensions [@ocaml.doc "\n"] }
[@@ocaml.doc
  "Stateless inspection criteria that publishes the specified metrics to Amazon CloudWatch for the \
   matching packet. This setting defines a CloudWatch dimension value to be published.\n"]

type nonrec action_definition = {
  publish_metric_action : publish_metric_action option;
      [@ocaml.doc
        "Stateless inspection criteria that publishes the specified metrics to Amazon CloudWatch \
         for the matching packet. This setting defines a CloudWatch dimension value to be \
         published.\n\n\
        \ You can pair this custom action with any of the standard stateless rule actions. For \
         example, you could pair this in a rule action with the standard action that forwards the \
         packet for stateful inspection. Then, when a packet matches the rule, Network Firewall \
         publishes metrics for the packet and forwards it. \n\
        \ "]
}
[@@ocaml.doc
  "A custom action to use in stateless rule actions settings. This is used in [CustomAction].\n"]

type nonrec action_name = string [@@ocaml.doc ""]

type nonrec address_definition = string [@@ocaml.doc ""]

type nonrec address = {
  address_definition : address_definition;
      [@ocaml.doc
        "Specify an IP address or a block of IP addresses in Classless Inter-Domain Routing (CIDR) \
         notation. Network Firewall supports all address ranges for IPv4 and IPv6. \n\n\
        \ Examples: \n\
        \ \n\
        \  {ul\n\
        \        {-  To configure Network Firewall to inspect for the IP address 192.0.2.44, \
         specify [192.0.2.44/32].\n\
        \            \n\
        \             }\n\
        \        {-  To configure Network Firewall to inspect for IP addresses from 192.0.2.0 to \
         192.0.2.255, specify [192.0.2.0/24].\n\
        \            \n\
        \             }\n\
        \        {-  To configure Network Firewall to inspect for the IP address \
         1111:0000:0000:0000:0000:0000:0000:0111, specify \
         [1111:0000:0000:0000:0000:0000:0000:0111/128].\n\
        \            \n\
        \             }\n\
        \        {-  To configure Network Firewall to inspect for IP addresses from \
         1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, \
         specify [1111:0000:0000:0000:0000:0000:0000:0000/64].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about CIDR notation, see the Wikipedia entry \
         {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain \
         Routing}.\n\
        \   "]
}
[@@ocaml.doc
  "A single IP address specification. This is used in the [MatchAttributes] source and destination \
   specifications.\n"]

type nonrec addresses = address list [@@ocaml.doc ""]

type nonrec age = int [@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec report_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec enabled_analysis_type = TLS_SNI [@ocaml.doc ""] | HTTP_HOST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec analysis_report_id = string [@@ocaml.doc ""]

type nonrec analysis_report = {
  analysis_report_id : analysis_report_id option;
      [@ocaml.doc "The unique ID of the query that ran when you requested an analysis report. \n"]
  analysis_type : enabled_analysis_type option;
      [@ocaml.doc "The type of traffic that will be used to generate a report. \n"]
  report_time : report_time option; [@ocaml.doc "The date and time the analysis report was ran. \n"]
  status : status option;
      [@ocaml.doc
        "The status of the analysis report you specify. Statuses include [RUNNING], [COMPLETED], \
         or [FAILED].\n"]
}
[@@ocaml.doc
  "A report that captures key activity from the last 30 days of network traffic monitored by your \
   firewall.\n\n\
  \ You can generate up to one report per traffic type, per 30 day period. For example, when you \
   successfully create an HTTP traffic report, you cannot create another HTTP traffic report until \
   30 days pass. Alternatively, if you generate a report that combines metrics on both HTTP and \
   HTTPS traffic, you cannot create another report for either traffic type until 30 days pass.\n\
  \ "]

type nonrec analysis_report_next_token = string [@@ocaml.doc ""]

type nonrec count = int [@@ocaml.doc ""]

type nonrec unique_sources = {
  count : count option;
      [@ocaml.doc "The number of unique source IP addresses that connected to a domain.\n"]
}
[@@ocaml.doc "A unique source IP address that connected to a domain.\n"]

type nonrec hits = {
  count : count option; [@ocaml.doc "The number of attempts made to access a domain.\n"]
}
[@@ocaml.doc "Attempts made to a access domain.\n"]

type nonrec domain = string [@@ocaml.doc ""]

type nonrec last_accessed = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec first_accessed = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec collection_member__string = string [@@ocaml.doc ""]

type nonrec analysis_type_report_result = {
  protocol : collection_member__string option;
      [@ocaml.doc "The type of traffic captured by the analysis report.\n"]
  first_accessed : first_accessed option;
      [@ocaml.doc
        "The date and time any domain was first accessed (within the last 30 day period).\n"]
  last_accessed : last_accessed option;
      [@ocaml.doc
        "The date and time any domain was last accessed (within the last 30 day period).\n"]
  domain : domain option; [@ocaml.doc "The most frequently accessed domains.\n"]
  hits : hits option; [@ocaml.doc "The number of attempts made to access a observed domain.\n"]
  unique_sources : unique_sources option;
      [@ocaml.doc "The number of unique source IP addresses that connected to a domain.\n"]
}
[@@ocaml.doc
  "The results of a [COMPLETED] analysis report generated with [StartAnalysisReport].\n\n\
  \ For an example of traffic analysis report results, see the response syntax of \
   [GetAnalysisReportResults].\n\
  \ "]

type nonrec analysis_report_results = analysis_type_report_result list [@@ocaml.doc ""]

type nonrec analysis_reports = analysis_report list [@@ocaml.doc ""]

type nonrec identified_type =
  | STATELESS_RULE_FORWARDING_ASYMMETRICALLY [@ocaml.doc ""]
  | STATELESS_RULE_CONTAINS_TCP_FLAGS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_id_list = collection_member__string list [@@ocaml.doc ""]

type nonrec analysis_result = {
  identified_rule_ids : rule_id_list option;
      [@ocaml.doc "The priority number of the stateless rules identified in the analysis.\n"]
  identified_type : identified_type option;
      [@ocaml.doc
        "The types of rule configurations that Network Firewall analyzes your rule groups for. \
         Network Firewall analyzes stateless rule groups for the following types of rule \
         configurations:\n\n\
        \ {ul\n\
        \       {-   [STATELESS_RULE_FORWARDING_ASYMMETRICALLY] \n\
        \           \n\
        \            Cause: One or more stateless rules with the action [pass] or [forward] are \
         forwarding traffic asymmetrically. Specifically, the rule's set of source IP addresses or \
         their associated port numbers, don't match the set of destination IP addresses or their \
         associated port numbers.\n\
        \            \n\
        \             To mitigate: Make sure that there's an existing return path. For example, if \
         the rule allows traffic from source 10.1.0.0/24 to destination 20.1.0.0/24, you should \
         allow return traffic from source 20.1.0.0/24 to destination 10.1.0.0/24.\n\
        \             \n\
        \              }\n\
        \       {-   [STATELESS_RULE_CONTAINS_TCP_FLAGS] \n\
        \           \n\
        \            Cause: At least one stateless rule with the action [pass] or[forward] \
         contains TCP flags that are inconsistent in the forward and return directions.\n\
        \            \n\
        \             To mitigate: Prevent asymmetric routing issues caused by TCP flags by \
         following these actions:\n\
        \             \n\
        \              {ul\n\
        \                    {-  Remove unnecessary TCP flag inspections from the rules.\n\
        \                        \n\
        \                         }\n\
        \                    {-  If you need to inspect TCP flags, check that the rules correctly \
         account for changes in TCP flags throughout the TCP connection cycle, for example [SYN] \
         and [ACK] flags used in a 3-way TCP handshake.\n\
        \                        \n\
        \                         }\n\
        \                    \n\
        \        }\n\
        \         }\n\
        \       }\n\
        \  "]
  analysis_detail : collection_member__string option;
      [@ocaml.doc "Provides analysis details for the identified rule.\n"]
}
[@@ocaml.doc
  "The analysis result for Network Firewall's stateless rule group analyzer. Every time you call \
   [CreateRuleGroup], [UpdateRuleGroup], or [DescribeRuleGroup] on a stateless rule group, Network \
   Firewall analyzes the stateless rule groups in your account and identifies the rules that might \
   adversely effect your firewall's functionality. For example, if Network Firewall detects a rule \
   that's routing traffic asymmetrically, which impacts the service's ability to properly process \
   traffic, the service includes the rule in a list of analysis results.\n\n\
  \ The [AnalysisResult] data type is not related to traffic analysis reports you generate using \
   [StartAnalysisReport]. For information on traffic analysis report results, see \
   [AnalysisTypeReportResult].\n\
  \ "]

type nonrec analysis_result_list = analysis_result list [@@ocaml.doc ""]

type nonrec invalid_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The token you provided is stale or isn't valid for the operation. \n"]

type nonrec invalid_operation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation failed because it's not valid. For example, you might have tried to delete a rule \
   group or firewall policy that's in use.\n"]

type nonrec insufficient_capacity_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Amazon Web Services doesn't currently have enough available capacity to fulfill your request. \
   Try your request later. \n"]

type nonrec update_token = string [@@ocaml.doc ""]

type nonrec availability_zone_mapping_string = string [@@ocaml.doc ""]

type nonrec availability_zone_mapping = {
  availability_zone : availability_zone_mapping_string;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall endpoint is located. For example, \
         [us-east-2a]. The Availability Zone must be in the same Region as the transit gateway.\n"]
}
[@@ocaml.doc
  "Defines the mapping between an Availability Zone and a firewall endpoint for a transit \
   gateway-attached firewall. Each mapping represents where the firewall can process traffic. You \
   use these mappings when calling [CreateFirewall], [AssociateAvailabilityZones], and \
   [DisassociateAvailabilityZones].\n\n\
  \ To retrieve the current Availability Zone mappings for a firewall, use [DescribeFirewall].\n\
  \ "]

type nonrec availability_zone_mappings = availability_zone_mapping list [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec associate_availability_zones_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  availability_zone_mappings : availability_zone_mappings option;
      [@ocaml.doc
        "The Availability Zones where Network Firewall created firewall endpoints. Each mapping \
         specifies an Availability Zone where the firewall processes traffic.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec associate_availability_zones_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  availability_zone_mappings : availability_zone_mappings;
      [@ocaml.doc
        "Required. The Availability Zones where you want to create firewall endpoints. You must \
         specify at least one Availability Zone.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_firewall_policy_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  firewall_policy_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall policy.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec associate_firewall_policy_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_policy_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall policy.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_address_type =
  | DUALSTACK [@ocaml.doc ""]
  | IPV4 [@ocaml.doc ""]
  | IPV6 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec subnet_mapping = {
  subnet_id : collection_member__string; [@ocaml.doc "The unique identifier for the subnet. \n"]
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The subnet's IP address type. You can't change the IP address type after you create the \
         subnet.\n"]
}
[@@ocaml.doc
  "The ID for a subnet that's used in an association with a firewall. This is used in \
   [CreateFirewall], [AssociateSubnets], and [CreateVpcEndpointAssociation]. Network Firewall \
   creates an instance of the associated firewall in each subnet that you specify, to filter \
   traffic in the subnet's Availability Zone.\n"]

type nonrec subnet_mappings = subnet_mapping list [@@ocaml.doc ""]

type nonrec associate_subnets_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  subnet_mappings : subnet_mappings option;
      [@ocaml.doc "The IDs of the subnets that are associated with the firewall. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec associate_subnets_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  subnet_mappings : subnet_mappings;
      [@ocaml.doc "The IDs of the subnets that you want to associate with the firewall. \n"]
}
[@@ocaml.doc ""]

type nonrec availability_zone = string [@@ocaml.doc ""]

type nonrec association_sync_state = (availability_zone * az_sync_state) list [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "The part of the key:value pair that defines a tag. You can use a tag key to describe a \
         category of information, such as \"customer.\" Tag keys are case-sensitive.\n"]
  value : tag_value;
      [@ocaml.doc
        "The part of the key:value pair that defines a tag. You can use a tag value to describe a \
         specific value within a category, such as \"companyA\" or \"companyB.\" Tag values are \
         case-sensitive.\n"]
}
[@@ocaml.doc
  "A key:value pair associated with an Amazon Web Services resource. The key:value pair can be \
   anything you define. Typically, the tag key represents a category (such as \"environment\") and \
   the tag value represents a specific value within that category (such as \"test,\" \
   \"development,\" or \"production\"). You can add up to 50 tags to each Amazon Web Services \
   resource. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec proxy_rule_phase_action =
  | ALLOW [@ocaml.doc ""]
  | DENY [@ocaml.doc ""]
  | ALERT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec proxy_config_default_rule_phase_actions_request = {
  pre_dn_s : proxy_rule_phase_action option; [@ocaml.doc "Before domain resolution. \n"]
  pre_reques_t : proxy_rule_phase_action option; [@ocaml.doc "After DNS, before request.\n"]
  post_respons_e : proxy_rule_phase_action option; [@ocaml.doc "After receiving response.\n"]
}
[@@ocaml.doc
  "Evaluation points in the traffic flow where rules are applied. There are three phases in a \
   traffic where the rule match is applied. \n\n\
  \ This data type is used specifically for the [CreateProxyConfiguration] and \
   [UpdateProxyConfiguration] APIs.\n\
  \ "]

type nonrec proxy_config_rule_group_priority = int [@@ocaml.doc ""]

type nonrec proxy_config_rule_group_type = string [@@ocaml.doc ""]

type nonrec proxy_config_rule_group = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy rule group.\n"]
  type_ : proxy_config_rule_group_type option; [@ocaml.doc "Proxy rule group type. \n"]
  priority : proxy_config_rule_group_priority option;
      [@ocaml.doc "Priority of the proxy rule group in the proxy configuration. \n"]
}
[@@ocaml.doc "Proxy rule group contained within a proxy configuration. \n"]

type nonrec proxy_config_rule_group_set = proxy_config_rule_group list [@@ocaml.doc ""]

type nonrec delete_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec create_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec proxy_configuration = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n"]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy configuration.\n"]
  description : description option; [@ocaml.doc "A description of the proxy configuration. \n"]
  create_time : create_time option; [@ocaml.doc "Time the Proxy Configuration was created. \n"]
  delete_time : delete_time option; [@ocaml.doc "Time the Proxy Configuration was deleted. \n"]
  rule_groups : proxy_config_rule_group_set option;
      [@ocaml.doc "Proxy rule groups within the proxy configuration. \n"]
  default_rule_phase_actions : proxy_config_default_rule_phase_actions_request option;
      [@ocaml.doc
        "Evaluation points in the traffic flow where rules are applied. There are three phases in \
         a traffic where the rule match is applied. \n\n\
        \ Pre-DNS - before domain resolution.\n\
        \ \n\
        \  Pre-Request - after DNS, before request.\n\
        \  \n\
        \   Post-Response - after receiving response.\n\
        \   "]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc
  "A Proxy Configuration defines the monitoring and protection behavior for a Proxy. The details \
   of the behavior are defined in the rule groups that you add to your configuration. \n"]

type nonrec attach_rule_groups_to_proxy_configuration_response = {
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc
        "The updated proxy configuration resource that reflects the updates from the request.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec insert_position = int [@@ocaml.doc ""]

type nonrec proxy_rule_group_attachment = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  insert_position : insert_position option;
      [@ocaml.doc "Where to insert a proxy rule group in a proxy configuration. \n"]
}
[@@ocaml.doc "The proxy rule group(s) to attach to the proxy configuration\n"]

type nonrec proxy_rule_group_attachment_list = proxy_rule_group_attachment list [@@ocaml.doc ""]

type nonrec attach_rule_groups_to_proxy_configuration_request = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_groups : proxy_rule_group_attachment_list;
      [@ocaml.doc "The proxy rule group(s) to attach to the proxy configuration\n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec attachment_id = string [@@ocaml.doc ""]

type nonrec availability_zone_metadata = {
  ip_address_type : ip_address_type option;
      [@ocaml.doc
        "The IP address type of the Firewall subnet in the Availability Zone. You can't change the \
         IP address type after you create the subnet.\n"]
}
[@@ocaml.doc
  "High-level information about an Availability Zone where the firewall has an endpoint defined. \n"]

type nonrec az_subnets = az_subnet list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec byte_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec cidr_count = int [@@ocaml.doc ""]

type nonrec ip_set_metadata = {
  resolved_cidr_count : cidr_count option;
      [@ocaml.doc
        "Describes the total number of CIDR blocks currently in use by the IP set references in a \
         firewall. To determine how many CIDR blocks are available for you to use in a firewall, \
         you can call [AvailableCIDRCount].\n"]
}
[@@ocaml.doc "General information about the IP set.\n"]

type nonrec ip_set_arn = string [@@ocaml.doc ""]

type nonrec ip_set_metadata_map = (ip_set_arn * ip_set_metadata) list [@@ocaml.doc ""]

type nonrec cidr_summary = {
  available_cidr_count : cidr_count option;
      [@ocaml.doc
        "The number of CIDR blocks available for use by the IP set references in a firewall.\n"]
  utilized_cidr_count : cidr_count option;
      [@ocaml.doc "The number of CIDR blocks used by the IP set references in a firewall.\n"]
  ip_set_references : ip_set_metadata_map option;
      [@ocaml.doc "The list of the IP set references used by a firewall.\n"]
}
[@@ocaml.doc
  "Summarizes the CIDR blocks used by the IP set references in a firewall. Network Firewall \
   calculates the number of CIDRs by taking an aggregated count of all CIDRs used by the IP sets \
   you are referencing.\n"]

type nonrec capacity_usage_summary = {
  cid_rs : cidr_summary option;
      [@ocaml.doc
        "Describes the capacity usage of the CIDR blocks used by the IP set references in a \
         firewall.\n"]
}
[@@ocaml.doc
  "The capacity usage summary of the resources used by the [ReferenceSets] in a firewall.\n"]

type nonrec status_reason = string [@@ocaml.doc ""]

type nonrec tls_certificate_data = {
  certificate_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the certificate.\n"]
  certificate_serial : collection_member__string option;
      [@ocaml.doc "The serial number of the certificate.\n"]
  status : collection_member__string option; [@ocaml.doc "The status of the certificate.\n"]
  status_message : status_reason option;
      [@ocaml.doc
        "Contains details about the certificate status, including information about certificate \
         errors.\n"]
}
[@@ocaml.doc "Contains metadata about an Certificate Manager certificate.\n"]

type nonrec certificates = tls_certificate_data list [@@ocaml.doc ""]

type nonrec revocation_check_action =
  | PASS [@ocaml.doc ""]
  | DROP [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec check_certificate_revocation_status_actions = {
  revoked_status_action : revocation_check_action option;
      [@ocaml.doc
        "Configures how Network Firewall processes traffic when it determines that the certificate \
         presented by the server in the SSL/TLS connection has a revoked status.\n\n\
        \ {ul\n\
        \       {-   {b PASS} - Allow the connection to continue, and pass subsequent packets to \
         the stateful engine for inspection.\n\
        \           \n\
        \            }\n\
        \       {-   {b DROP} - Network Firewall closes the connection and drops subsequent \
         packets for that connection.\n\
        \           \n\
        \            }\n\
        \       {-   {b REJECT} - Network Firewall sends a TCP reject packet back to your client. \
         The service closes the connection and drops subsequent packets for that connection. \
         [REJECT] is available only for TCP traffic.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  unknown_status_action : revocation_check_action option;
      [@ocaml.doc
        "Configures how Network Firewall processes traffic when it determines that the certificate \
         presented by the server in the SSL/TLS connection has an unknown status, or a status that \
         cannot be determined for any other reason, including when the service is unable to \
         connect to the OCSP and CRL endpoints for the certificate.\n\n\
        \ {ul\n\
        \       {-   {b PASS} - Allow the connection to continue, and pass subsequent packets to \
         the stateful engine for inspection.\n\
        \           \n\
        \            }\n\
        \       {-   {b DROP} - Network Firewall closes the connection and drops subsequent \
         packets for that connection.\n\
        \           \n\
        \            }\n\
        \       {-   {b REJECT} - Network Firewall sends a TCP reject packet back to your client. \
         The service closes the connection and drops subsequent packets for that connection. \
         [REJECT] is available only for TCP traffic.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Defines the actions to take on the SSL/TLS connection if the certificate presented by the \
   server in the connection has a revoked or unknown status.\n"]

type nonrec condition_key = string [@@ocaml.doc ""]

type nonrec condition_operator = string [@@ocaml.doc ""]

type nonrec configuration_sync_state =
  | PENDING [@ocaml.doc ""]
  | IN_SYNC [@ocaml.doc ""]
  | CAPACITY_CONSTRAINED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_association_last_updated_time = Smaws_Lib.CoreTypes.Timestamp.t
[@@ocaml.doc ""]

type nonrec container_association_status =
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_association_summary = {
  arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the container association.\n"]
  name : resource_name option; [@ocaml.doc "The descriptive name of the container association.\n"]
}
[@@ocaml.doc
  "High-level information about a container association, returned by the \
   [ListContainerAssociations] operation. You can use this information to retrieve the full \
   details of a container association using [DescribeContainerAssociation].\n"]

type nonrec container_associations = container_association_summary list [@@ocaml.doc ""]

type nonrec container_attribute_value = string [@@ocaml.doc ""]

type nonrec container_attribute_key = string [@@ocaml.doc ""]

type nonrec container_attribute = {
  key : container_attribute_key; [@ocaml.doc "The key of the container attribute to filter on.\n"]
  value : container_attribute_value;
      [@ocaml.doc "The value of the container attribute to filter on.\n"]
}
[@@ocaml.doc
  "A key-value pair that defines a container attribute filter for a container monitoring \
   configuration.\n"]

type nonrec container_attributes = container_attribute list [@@ocaml.doc ""]

type nonrec container_monitoring_configuration = {
  cluster_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the container cluster to monitor.\n"]
  attribute_filters : container_attributes option;
      [@ocaml.doc
        "A list of key-value pairs that filter which containers within the cluster are monitored. \
         Only containers that match the specified attributes are included.\n"]
}
[@@ocaml.doc
  "Defines a container cluster to monitor, along with optional attribute filters that narrow the \
   scope of monitored containers within the cluster.\n"]

type nonrec container_monitoring_configurations = container_monitoring_configuration list
[@@ocaml.doc ""]

type nonrec container_monitoring_type = ECS [@ocaml.doc ""] | EKS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Unable to perform the operation because doing so would violate a limit setting. \n"]

type nonrec create_container_association_response = {
  container_association_name : resource_name option;
      [@ocaml.doc "The descriptive name of the container association.\n"]
  container_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the container association.\n"]
  description : description option; [@ocaml.doc "A description of the container association.\n"]
  type_ : container_monitoring_type option;
      [@ocaml.doc "The type of container orchestration platform. Either [ECS] or [EKS].\n"]
  container_monitoring_configurations : container_monitoring_configurations option;
      [@ocaml.doc "The container monitoring configurations for this container association.\n"]
  status : container_association_status option;
      [@ocaml.doc "The current status of the container association.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs associated with the resource.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the container association. The token marks the state of the container \
         association resource at the time of the request. To make an update to the container \
         association, provide the token in your request. Network Firewall uses the token to ensure \
         that the container association hasn't changed since you last retrieved it. If it has \
         changed, the operation fails with an [InvalidTokenException]. If this happens, retrieve \
         the container association again to get a current copy of it with a new token. Reapply \
         your changes as needed, then try the operation again using the new token.\n"]
}
[@@ocaml.doc ""]

type nonrec create_container_association_request = {
  container_association_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the container association. You can't change the name of a \
         container association after you create it.\n"]
  description : description option; [@ocaml.doc "A description of the container association.\n"]
  type_ : container_monitoring_type;
      [@ocaml.doc
        "The type of container orchestration platform for the clusters in this association. Valid \
         values are [ECS] and [EKS]. You can't change the type after creation.\n"]
  container_monitoring_configurations : container_monitoring_configurations;
      [@ocaml.doc
        "The list of container monitoring configurations that define which clusters and container \
         attributes to monitor.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec transit_gateway_attachment_sync_state_message = string [@@ocaml.doc ""]

type nonrec transit_gateway_attachment_sync_state = {
  attachment_id : attachment_id option;
      [@ocaml.doc "The unique identifier of the transit gateway attachment.\n"]
  transit_gateway_attachment_status : transit_gateway_attachment_status option;
      [@ocaml.doc
        "The current status of the transit gateway attachment.\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [CREATING] - The attachment is being created\n\
        \            \n\
        \             }\n\
        \        {-   [DELETING] - The attachment is being deleted\n\
        \            \n\
        \             }\n\
        \        {-   [DELETED] - The attachment has been deleted\n\
        \            \n\
        \             }\n\
        \        {-   [FAILED] - The attachment creation has failed and cannot be recovered\n\
        \            \n\
        \             }\n\
        \        {-   [ERROR] - The attachment is in an error state that might be recoverable\n\
        \            \n\
        \             }\n\
        \        {-   [READY] - The attachment is active and processing traffic\n\
        \            \n\
        \             }\n\
        \        {-   [PENDING_ACCEPTANCE] - The attachment is waiting to be accepted\n\
        \            \n\
        \             }\n\
        \        {-   [REJECTING] - The attachment is in the process of being rejected\n\
        \            \n\
        \             }\n\
        \        {-   [REJECTED] - The attachment has been rejected\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  status_message : transit_gateway_attachment_sync_state_message option;
      [@ocaml.doc
        "A message providing additional information about the current status, particularly useful \
         when the transit gateway attachment is in a non-[READY] state.\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [CREATING] - The attachment is being created\n\
        \            \n\
        \             }\n\
        \        {-   [DELETING] - The attachment is being deleted\n\
        \            \n\
        \             }\n\
        \        {-   [DELETED] - The attachment has been deleted\n\
        \            \n\
        \             }\n\
        \        {-   [FAILED] - The attachment creation has failed and cannot be recovered\n\
        \            \n\
        \             }\n\
        \        {-   [ERROR] - The attachment is in an error state that might be recoverable\n\
        \            \n\
        \             }\n\
        \        {-   [READY] - The attachment is active and processing traffic\n\
        \            \n\
        \             }\n\
        \        {-   [PENDING_ACCEPTANCE] - The attachment is waiting to be accepted\n\
        \            \n\
        \             }\n\
        \        {-   [REJECTING] - The attachment is in the process of being rejected\n\
        \            \n\
        \             }\n\
        \        {-   [REJECTED] - The attachment has been rejected\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For information about troubleshooting endpoint failures, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-troubleshooting-endpoint-failures.html}Troubleshooting \
         firewall endpoint failures} in the {i Network Firewall Developer Guide}.\n\
        \   "]
}
[@@ocaml.doc
  "Contains information about the synchronization state of a transit gateway attachment, including \
   its current status and any error messages. Network Firewall uses this to track the state of \
   your transit gateway configuration changes.\n"]

type nonrec per_object_sync_status =
  | PENDING [@ocaml.doc ""]
  | IN_SYNC [@ocaml.doc ""]
  | CAPACITY_CONSTRAINED [@ocaml.doc ""]
  | NOT_SUBSCRIBED [@ocaml.doc ""]
  | DEPRECATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec per_object_status = {
  sync_status : per_object_sync_status option;
      [@ocaml.doc
        "Indicates whether this object is in sync with the version indicated in the update token.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "The current version of the object that is either in sync or pending synchronization. \n"]
}
[@@ocaml.doc
  "Provides configuration status for a single policy or rule group that is used for a firewall \
   endpoint. Network Firewall provides each endpoint with the rules that are configured in the \
   firewall policy. Each time you add a subnet or modify the associated firewall policy, Network \
   Firewall synchronizes the rules in the endpoint, so it can properly filter network traffic. \
   This is part of a [SyncState] for a firewall.\n"]

type nonrec sync_state_config = (resource_name * per_object_status) list [@@ocaml.doc ""]

type nonrec sync_state = {
  attachment : attachment option;
      [@ocaml.doc
        "The configuration and status for a single firewall subnet. For each configured subnet, \
         Network Firewall creates the attachment by instantiating the firewall endpoint in the \
         subnet so that it's ready to take traffic. \n"]
  config : sync_state_config option;
      [@ocaml.doc
        "The configuration status of the firewall endpoint in a single VPC subnet. Network \
         Firewall provides each endpoint with the rules that are configured in the firewall \
         policy. Each time you add a subnet or modify the associated firewall policy, Network \
         Firewall synchronizes the rules in the endpoint, so it can properly filter network \
         traffic. \n"]
}
[@@ocaml.doc
  "The status of the firewall endpoint and firewall policy configuration for a single VPC subnet. \
   This is part of the [FirewallStatus]. \n\n\
  \ For each VPC subnet that you associate with a firewall, Network Firewall does the following: \n\
  \ \n\
  \  {ul\n\
  \        {-  Instantiates a firewall endpoint in the subnet, ready to take traffic.\n\
  \            \n\
  \             }\n\
  \        {-  Configures the endpoint with the current firewall policy settings, to provide the \
   filtering behavior for the endpoint.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   When you update a firewall, for example to add a subnet association or change a rule group \
   in the firewall policy, the affected sync states reflect out-of-sync or not ready status until \
   the changes are complete. \n\
  \   "]

type nonrec sync_states = (availability_zone * sync_state) list [@@ocaml.doc ""]

type nonrec firewall_status_value =
  | PROVISIONING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec firewall_status = {
  status : firewall_status_value;
      [@ocaml.doc
        "The readiness of the configured firewall to handle network traffic across all of the \
         Availability Zones where you have it configured. This setting is [READY] only when the \
         [ConfigurationSyncStateSummary] value is [IN_SYNC] and the [Attachment] [Status] values \
         for all of the configured subnets are [READY]. \n"]
  configuration_sync_state_summary : configuration_sync_state;
      [@ocaml.doc
        "The configuration sync state for the firewall. This summarizes the [Config] settings in \
         the [SyncStates] for this firewall status object. \n\n\
        \ When you create a firewall or update its configuration, for example by adding a rule \
         group to its firewall policy, Network Firewall distributes the configuration changes to \
         all Availability Zones that have subnets defined for the firewall. This summary indicates \
         whether the configuration changes have been applied everywhere. \n\
        \ \n\
        \  This status must be [IN_SYNC] for the firewall to be ready for use, but it doesn't \
         indicate that the firewall is ready. The [Status] setting indicates firewall readiness. \
         It's based on this setting and the readiness of the firewall endpoints to take traffic. \n\
        \  "]
  sync_states : sync_states option;
      [@ocaml.doc
        "Status for the subnets that you've configured in the firewall. This contains one array \
         element per Availability Zone where you've configured a subnet in the firewall. \n\n\
        \ These objects provide detailed information for the settings \
         [ConfigurationSyncStateSummary] and [Status]. \n\
        \ "]
  capacity_usage_summary : capacity_usage_summary option;
      [@ocaml.doc
        "Describes the capacity usage of the resources contained in a firewall's reference sets. \
         Network Firewall calculates the capacity usage by taking an aggregated count of all of \
         the resources used by all of the reference sets in a firewall.\n"]
  transit_gateway_attachment_sync_state : transit_gateway_attachment_sync_state option;
      [@ocaml.doc
        "The synchronization state of the transit gateway attachment. This indicates whether the \
         firewall's transit gateway configuration is properly synchronized and operational. Use \
         this to verify that your transit gateway configuration changes have been applied.\n"]
}
[@@ocaml.doc
  "Detailed information about the current status of a [Firewall]. You can retrieve this for a \
   firewall by calling [DescribeFirewall] and providing the firewall name and ARN.\n\n\
  \ The firewall status indicates a combined status. It indicates whether all subnets are \
   up-to-date with the latest firewall configurations, which is based on the sync states config \
   values, and also whether all subnets have their endpoints fully enabled, based on their sync \
   states attachment values. \n\
  \ "]

type nonrec transit_gateway_id = string [@@ocaml.doc ""]

type nonrec enabled_analysis_types = enabled_analysis_type list [@@ocaml.doc ""]

type nonrec number_of_associations = int [@@ocaml.doc ""]

type nonrec encryption_type = CUSTOMER_KMS [@ocaml.doc ""] | AWS_OWNED_KMS_KEY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec key_id = string [@@ocaml.doc ""]

type nonrec encryption_configuration = {
  key_id : key_id option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Key Management Service (KMS) customer managed key. You \
         can use any of the key identifiers that KMS supports, unless you're using a key that's \
         managed by another account. If you're using a key managed by another account, then \
         specify the key ARN. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#key-id}Key ID} in \
         the {i Amazon Web Services KMS Developer Guide}.\n"]
  type_ : encryption_type;
      [@ocaml.doc
        "The type of Amazon Web Services KMS key to use for encryption of your Network Firewall \
         resources.\n"]
}
[@@ocaml.doc
  "A complex type that contains optional Amazon Web Services Key Management Service (KMS) \
   encryption settings for your Network Firewall resources. Your data is encrypted by default with \
   an Amazon Web Services owned key that Amazon Web Services owns and manages for you. You can use \
   either the Amazon Web Services owned key, or provide your own customer managed key. To learn \
   more about KMS encryption of your Network Firewall resources, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/kms-encryption-at-rest.html}Encryption \
   at rest with Amazon Web Services Key Managment Service} in the {i Network Firewall Developer \
   Guide}.\n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec firewall = {
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_policy_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall policy.\n\n\
        \ The relationship of firewall to firewall policy is many to one. Each firewall requires \
         one firewall policy association, and you can use the same firewall policy for multiple \
         firewalls. \n\
        \ "]
  vpc_id : vpc_id; [@ocaml.doc "The unique identifier of the VPC where the firewall is in use. \n"]
  subnet_mappings : subnet_mappings;
      [@ocaml.doc
        "The primary public subnets that Network Firewall is using for the firewall. Network \
         Firewall creates a firewall endpoint in each subnet. Create a subnet mapping for each \
         Availability Zone where you want to use the firewall.\n\n\
        \ These subnets are all defined for a single, primary VPC, and each must belong to a \
         different Availability Zone. Each of these subnets establishes the availability of the \
         firewall in its Availability Zone. \n\
        \ \n\
        \  In addition to these subnets, you can define other endpoints for the firewall in \
         [VpcEndpointAssociation] resources. You can define these additional endpoints for any \
         VPC, and for any of the Availability Zones where the firewall resource already has a \
         subnet mapping. VPC endpoint associations give you the ability to protect multiple VPCs \
         using a single firewall, and to define multiple firewall endpoints for a VPC in a single \
         Availability Zone. \n\
        \  "]
  delete_protection : boolean_ option;
      [@ocaml.doc
        "A flag indicating whether it is possible to delete the firewall. A setting of [TRUE] \
         indicates that the firewall is protected against deletion. Use this setting to protect \
         against accidentally deleting a firewall that is in use. When you create a firewall, the \
         operation initializes this flag to [TRUE].\n"]
  subnet_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against changes to the subnet \
         associations. Use this setting to protect against accidentally modifying the subnet \
         associations for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
  firewall_policy_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against a change to the firewall \
         policy association. Use this setting to protect against accidentally modifying the \
         firewall policy for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
  description : description option; [@ocaml.doc "A description of the firewall.\n"]
  firewall_id : resource_id; [@ocaml.doc "The unique identifier for the firewall. \n"]
  tags : tag_list option; [@ocaml.doc "\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains the Amazon Web Services KMS encryption configuration \
         settings for your firewall.\n"]
  number_of_associations : number_of_associations option;
      [@ocaml.doc "The number of [VpcEndpointAssociation] resources that use this firewall. \n"]
  enabled_analysis_types : enabled_analysis_types option;
      [@ocaml.doc
        "An optional setting indicating the specific traffic analysis types to enable on the \
         firewall. \n"]
  transit_gateway_id : transit_gateway_id option;
      [@ocaml.doc
        "The unique identifier of the transit gateway associated with this firewall. This field is \
         only present for transit gateway-attached firewalls.\n"]
  transit_gateway_owner_account_id : aws_account_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that owns the transit gateway. This may be different \
         from the firewall owner's account ID when using a shared transit gateway.\n"]
  availability_zone_mappings : availability_zone_mappings option;
      [@ocaml.doc
        "The Availability Zones where the firewall endpoints are created for a transit \
         gateway-attached firewall. Each mapping specifies an Availability Zone where the firewall \
         processes traffic.\n"]
  availability_zone_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against changes to its \
         Availability Zone configuration. When set to [TRUE], you must first disable this \
         protection before adding or removing Availability Zones.\n"]
}
[@@ocaml.doc
  "A firewall defines the behavior of a firewall, the main VPC where the firewall is used, the \
   Availability Zones where the firewall can be used, and one subnet to use for a firewall \
   endpoint within each of the Availability Zones. The Availability Zones are defined implicitly \
   in the subnet specifications.\n\n\
  \ In addition to the firewall endpoints that you define in this [Firewall] specification, you \
   can create firewall endpoints in [VpcEndpointAssociation] resources for any VPC, in any \
   Availability Zone where the firewall is already in use. \n\
  \ \n\
  \  The status of the firewall, for example whether it's ready to filter network traffic, is \
   provided in the corresponding [FirewallStatus]. You can retrieve both the firewall and firewall \
   status by calling [DescribeFirewall].\n\
  \  "]

type nonrec create_firewall_response = {
  firewall : firewall option;
      [@ocaml.doc
        "The configuration settings for the firewall. These settings include the firewall policy \
         and the subnets in your VPC to use for the firewall endpoints. \n"]
  firewall_status : firewall_status option;
      [@ocaml.doc
        "Detailed information about the current status of a [Firewall]. You can retrieve this for \
         a firewall by calling [DescribeFirewall] and providing the firewall name and ARN.\n\n\
        \ The firewall status indicates a combined status. It indicates whether all subnets are \
         up-to-date with the latest firewall configurations, which is based on the sync states \
         config values, and also whether all subnets have their endpoints fully enabled, based on \
         their sync states attachment values. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_firewall_request = {
  firewall_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  firewall_policy_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the [FirewallPolicy] that you want to use for the \
         firewall.\n"]
  vpc_id : vpc_id option;
      [@ocaml.doc
        "The unique identifier of the VPC where Network Firewall should create the firewall. \n\n\
        \ You can't change this setting after you create the firewall. \n\
        \ "]
  subnet_mappings : subnet_mappings option;
      [@ocaml.doc
        "The public subnets to use for your Network Firewall firewalls. Each subnet must belong to \
         a different Availability Zone in the VPC. Network Firewall creates a firewall endpoint in \
         each subnet. \n"]
  delete_protection : boolean_ option;
      [@ocaml.doc
        "A flag indicating whether it is possible to delete the firewall. A setting of [TRUE] \
         indicates that the firewall is protected against deletion. Use this setting to protect \
         against accidentally deleting a firewall that is in use. When you create a firewall, the \
         operation initializes this flag to [TRUE].\n"]
  subnet_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against changes to the subnet \
         associations. Use this setting to protect against accidentally modifying the subnet \
         associations for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
  firewall_policy_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against a change to the firewall \
         policy association. Use this setting to protect against accidentally modifying the \
         firewall policy for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
  description : description option; [@ocaml.doc "A description of the firewall.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains settings for encryption of your firewall resources.\n"]
  enabled_analysis_types : enabled_analysis_types option;
      [@ocaml.doc
        "An optional setting indicating the specific traffic analysis types to enable on the \
         firewall. \n"]
  transit_gateway_id : transit_gateway_id option;
      [@ocaml.doc
        "Required when creating a transit gateway-attached firewall. The unique identifier of the \
         transit gateway to attach to this firewall. You can provide either a transit gateway from \
         your account or one that has been shared with you through Resource Access Manager.\n\n\
        \  After creating the firewall, you cannot change the transit gateway association. To use \
         a different transit gateway, you must create a new firewall.\n\
        \  \n\
        \    For information about creating firewalls, see [CreateFirewall]. For specific guidance \
         about transit gateway-attached firewalls, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tgw-firewall-considerations.html}Considerations \
         for transit gateway-attached firewalls} in the {i Network Firewall Developer Guide}.\n\
        \    "]
  availability_zone_mappings : availability_zone_mappings option;
      [@ocaml.doc
        "Required. The Availability Zones where you want to create firewall endpoints for a \
         transit gateway-attached firewall. You must specify at least one Availability Zone. \
         Consider enabling the firewall in every Availability Zone where you have workloads to \
         maintain Availability Zone isolation.\n\n\
        \ You can modify Availability Zones later using [AssociateAvailabilityZones] or \
         [DisassociateAvailabilityZones], but this may briefly disrupt traffic. The \
         [AvailabilityZoneChangeProtection] setting controls whether you can make these \
         modifications.\n\
        \ "]
  availability_zone_change_protection : boolean_ option;
      [@ocaml.doc
        "Optional. A setting indicating whether the firewall is protected against changes to its \
         Availability Zone configuration. When set to [TRUE], you cannot add or remove \
         Availability Zones without first disabling this protection using \
         [UpdateAvailabilityZoneChangeProtection].\n\n\
        \ Default value: [FALSE] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec last_update_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec rule_capacity = int [@@ocaml.doc ""]

type nonrec resource_status =
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec firewall_policy_response = {
  firewall_policy_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the firewall policy. You can't change the name of a firewall \
         policy after you create it.\n"]
  firewall_policy_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall policy.\n\n\
        \  If this response is for a create request that had [DryRun] set to [TRUE], then this ARN \
         is a placeholder that isn't attached to a valid resource.\n\
        \  \n\
        \   "]
  firewall_policy_id : resource_id; [@ocaml.doc "The unique identifier for the firewall policy. \n"]
  description : description option; [@ocaml.doc "A description of the firewall policy.\n"]
  firewall_policy_status : resource_status option;
      [@ocaml.doc
        "The current status of the firewall policy. You can retrieve this for a firewall policy by \
         calling [DescribeFirewallPolicy] and providing the firewall policy's name or ARN.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
  consumed_stateless_rule_capacity : rule_capacity option;
      [@ocaml.doc
        "The number of capacity units currently consumed by the policy's stateless rules.\n"]
  consumed_stateful_rule_capacity : rule_capacity option;
      [@ocaml.doc
        "The number of capacity units currently consumed by the policy's stateful rules.\n"]
  consumed_stateful_domain_capacity : rule_capacity option;
      [@ocaml.doc
        "The total number of domain name specifications across all domain list rule groups in the \
         firewall policy that use the [stateful-domain-rulegroup] resource type.\n"]
  number_of_associations : number_of_associations option;
      [@ocaml.doc "The number of firewalls that are associated with this firewall policy.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains the Amazon Web Services KMS encryption configuration \
         settings for your firewall policy.\n"]
  last_modified_time : last_update_time option;
      [@ocaml.doc "The last time that the firewall policy was changed.\n"]
}
[@@ocaml.doc
  "The high-level properties of a firewall policy. This, along with the [FirewallPolicy], define \
   the policy. You can retrieve all objects for a firewall policy by calling \
   [DescribeFirewallPolicy]. \n"]

type nonrec create_firewall_policy_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the firewall policy. The token marks the state of the policy resource at the \
         time of the request. \n\n\
        \ To make changes to the policy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the policy hasn't changed since you last retrieved it. If \
         it has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the firewall policy again to get a current copy of it with current token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  firewall_policy_response : firewall_policy_response;
      [@ocaml.doc
        "The high-level properties of a firewall policy. This, along with the [FirewallPolicy], \
         define the policy. You can retrieve all objects for a firewall policy by calling \
         [DescribeFirewallPolicy]. \n"]
}
[@@ocaml.doc ""]

type nonrec enable_tls_session_holding = bool [@@ocaml.doc ""]

type nonrec variable_definition = string [@@ocaml.doc ""]

type nonrec variable_definition_list = variable_definition list [@@ocaml.doc ""]

type nonrec ip_set = {
  definition : variable_definition_list;
      [@ocaml.doc "The list of IP addresses and address ranges, in CIDR notation. \n"]
}
[@@ocaml.doc
  "A list of IP addresses and address ranges, in CIDR notation. This is part of a [RuleVariables]. \n"]

type nonrec rule_variable_name = string [@@ocaml.doc ""]

type nonrec ip_sets = (rule_variable_name * ip_set) list [@@ocaml.doc ""]

type nonrec policy_variables = {
  rule_variables : ip_sets option;
      [@ocaml.doc
        "The IPv4 or IPv6 addresses in CIDR notation to use for the Suricata [HOME_NET] variable. \
         If your firewall uses an inspection VPC, you might want to override the [HOME_NET] \
         variable with the CIDRs of your home networks. If you don't override [HOME_NET] with your \
         own CIDRs, Network Firewall by default uses the CIDR of your inspection VPC.\n"]
}
[@@ocaml.doc
  "Contains variables that you can use to override default Suricata settings in your firewall \
   policy.\n"]

type nonrec tcp_idle_timeout_range_bound = int [@@ocaml.doc ""]

type nonrec flow_timeouts = {
  tcp_idle_timeout_seconds : tcp_idle_timeout_range_bound option;
      [@ocaml.doc
        "The number of seconds that can pass without any TCP traffic sent through the firewall \
         before the firewall determines that the connection is idle. After the idle timeout \
         passes, data packets are dropped, however, the next TCP SYN packet is considered a new \
         flow and is processed by the firewall. Clients or targets can use TCP keepalive packets \
         to reset the idle timeout. \n\n\
        \ You can define the [TcpIdleTimeoutSeconds] value to be between 60 and 6000 seconds. If \
         no value is provided, it defaults to 350 seconds. \n\
        \ "]
}
[@@ocaml.doc
  "Describes the amount of time that can pass without any traffic sent through the firewall before \
   the firewall determines that the connection is idle and Network Firewall removes the flow entry \
   from its flow table. When you update this value, existing connections will be treated according \
   to your stream exception policy configuration. \n"]

type nonrec stream_exception_policy =
  | DROP [@ocaml.doc ""]
  | CONTINUE [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_order = DEFAULT_ACTION_ORDER [@ocaml.doc ""] | STRICT_ORDER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stateful_engine_options = {
  rule_order : rule_order option;
      [@ocaml.doc
        "Indicates how to manage the order of stateful rule evaluation for the policy. \
         [STRICT_ORDER] is the recommended option, but [DEFAULT_ACTION_ORDER] is the default \
         option. With [STRICT_ORDER], provide your rules in the order that you want them to be \
         evaluated. You can then choose one or more default actions for packets that don't match \
         any rules. Choose [STRICT_ORDER] to have the stateful rules engine determine the \
         evaluation order of your rules. The default action for this rule order is [PASS], \
         followed by [DROP], [REJECT], and [ALERT] actions. Stateful rules are provided to the \
         rule engine as Suricata compatible strings, and Suricata evaluates them based on your \
         settings. For more information, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html}Evaluation \
         order for stateful rules} in the {i Network Firewall Developer Guide}. \n"]
  stream_exception_policy : stream_exception_policy option;
      [@ocaml.doc
        "Configures how Network Firewall processes traffic when a network connection breaks \
         midstream. Network connections can break due to disruptions in external networks or \
         within the firewall itself.\n\n\
        \ {ul\n\
        \       {-   [DROP] - Network Firewall fails closed and drops all subsequent traffic going \
         to the firewall. This is the default behavior.\n\
        \           \n\
        \            }\n\
        \       {-   [CONTINUE] - Network Firewall continues to apply rules to the subsequent \
         traffic without context from traffic before the break. This impacts the behavior of rules \
         that depend on this context. For example, if you have a stateful rule to [drop http] \
         traffic, Network Firewall won't match the traffic for this rule because the service won't \
         have the context from session initialization defining the application layer protocol as \
         HTTP. However, this behavior is rule dependent\226\128\148a TCP-layer rule using a \
         [flow:stateless] rule would still match, as would the [aws:drop_strict] default action.\n\
        \           \n\
        \            }\n\
        \       {-   [REJECT] - Network Firewall fails closed and drops all subsequent traffic \
         going to the firewall. Network Firewall also sends a TCP reject packet back to your \
         client so that the client can immediately establish a new session. Network Firewall will \
         have context about the new session and will apply rules to the subsequent traffic.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  flow_timeouts : flow_timeouts option;
      [@ocaml.doc
        "Configures the amount of time that can pass without any traffic sent through the firewall \
         before the firewall determines that the connection is idle. \n"]
}
[@@ocaml.doc
  "Configuration settings for the handling of the stateful rule groups in a firewall policy. \n"]

type nonrec stateful_actions = collection_member__string list [@@ocaml.doc ""]

type nonrec deep_threat_inspection = bool [@@ocaml.doc ""]

type nonrec override_action = DROP_TO_ALERT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec stateful_rule_group_override = {
  action : override_action option;
      [@ocaml.doc
        "The action that changes the rule group from [DROP] to [ALERT]. This only applies to \
         managed rule groups.\n"]
}
[@@ocaml.doc
  "The setting that allows the policy owner to change the behavior of the rule group within a \
   policy. \n"]

type nonrec priority = int [@@ocaml.doc ""]

type nonrec stateful_rule_group_reference = {
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the stateful rule group.\n"]
  priority : priority option;
      [@ocaml.doc
        "An integer setting that indicates the order in which to run the stateful rule groups in a \
         single [FirewallPolicy]. This setting only applies to firewall policies that specify the \
         [STRICT_ORDER] rule order in the stateful engine options settings.\n\n\
        \ Network Firewall evalutes each stateful rule group against a packet starting with the \
         group that has the lowest priority setting. You must ensure that the priority settings \
         are unique within each policy.\n\
        \ \n\
        \  You can change the priority settings of your rule groups at any time. To make it easier \
         to insert rule groups later, number them so there's a wide range in between, for example \
         use 100, 200, and so on. \n\
        \  "]
  override : stateful_rule_group_override option;
      [@ocaml.doc
        "The action that allows the policy owner to override the behavior of the rule group within \
         a policy.\n"]
  deep_threat_inspection : deep_threat_inspection option;
      [@ocaml.doc
        "Network Firewall plans to augment the active threat defense managed rule group with an \
         additional deep threat inspection capability. When this capability is released, Amazon \
         Web Services will analyze service logs of network traffic processed by these rule groups \
         to identify threat indicators across customers. Amazon Web Services will use these threat \
         indicators to improve the active threat defense managed rule groups and protect the \
         security of Amazon Web Services customers and services.\n\n\
        \  Customers can opt-out of deep threat inspection at any time through the Network \
         Firewall console or API. When customers opt out, Network Firewall will not use the \
         network traffic processed by those customers' active threat defense rule groups for rule \
         group improvement.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Identifier for a single stateful rule group, used in a firewall policy to refer to a rule group. \n"]

type nonrec stateful_rule_group_references = stateful_rule_group_reference list [@@ocaml.doc ""]

type nonrec custom_action = {
  action_name : action_name;
      [@ocaml.doc
        "The descriptive name of the custom action. You can't change the name of a custom action \
         after you create it.\n"]
  action_definition : action_definition;
      [@ocaml.doc "The custom action associated with the action name.\n"]
}
[@@ocaml.doc
  "An optional, non-standard action to use for stateless packet handling. You can define this in \
   addition to the standard action that you must specify. \n\n\
  \ You define and name the custom actions that you want to be able to use, and then you reference \
   them by name in your actions settings. \n\
  \ \n\
  \  You can use custom actions in the following places: \n\
  \  \n\
  \   {ul\n\
  \         {-  In a rule group's [StatelessRulesAndCustomActions] specification. The custom \
   actions are available for use by name inside the [StatelessRulesAndCustomActions] where you \
   define them. You can use them for your stateless rule actions to specify what to do with a \
   packet that matches the rule's match attributes. \n\
  \             \n\
  \              }\n\
  \         {-  In a [FirewallPolicy] specification, in [StatelessCustomActions]. The custom \
   actions are available for use inside the policy where you define them. You can use them for the \
   policy's default stateless actions settings to specify what to do with packets that don't match \
   any of the policy's stateless rules. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

type nonrec custom_actions = custom_action list [@@ocaml.doc ""]

type nonrec stateless_actions = collection_member__string list [@@ocaml.doc ""]

type nonrec stateless_rule_group_reference = {
  resource_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the stateless rule group.\n"]
  priority : priority;
      [@ocaml.doc
        "An integer setting that indicates the order in which to run the stateless rule groups in \
         a single [FirewallPolicy]. Network Firewall applies each stateless rule group to a packet \
         starting with the group that has the lowest priority setting. You must ensure that the \
         priority settings are unique within each policy.\n"]
}
[@@ocaml.doc
  "Identifier for a single stateless rule group, used in a firewall policy to refer to the rule \
   group. \n"]

type nonrec stateless_rule_group_references = stateless_rule_group_reference list [@@ocaml.doc ""]

type nonrec firewall_policy = {
  stateless_rule_group_references : stateless_rule_group_references option;
      [@ocaml.doc
        "References to the stateless rule groups that are used in the policy. These define the \
         matching criteria in stateless rules. \n"]
  stateless_default_actions : stateless_actions;
      [@ocaml.doc
        "The actions to take on a packet if it doesn't match any of the stateless rules in the \
         policy. If you want non-matching packets to be forwarded for stateful inspection, specify \
         [aws:forward_to_sfe]. \n\n\
        \ You must specify one of the standard actions: [aws:pass], [aws:drop], or \
         [aws:forward_to_sfe]. In addition, you can specify custom actions that are compatible \
         with your standard section choice.\n\
        \ \n\
        \  For example, you could specify [\\[\"aws:pass\"\\]] or you could specify \
         [\\[\"aws:pass\", \226\128\156customActionName\226\128\157\\]]. For information about \
         compatibility, see the custom action descriptions under [CustomAction].\n\
        \  "]
  stateless_fragment_default_actions : stateless_actions;
      [@ocaml.doc
        "The actions to take on a fragmented UDP packet if it doesn't match any of the stateless \
         rules in the policy. Network Firewall only manages UDP packet fragments and silently \
         drops packet fragments for other protocols. If you want non-matching fragmented UDP \
         packets to be forwarded for stateful inspection, specify [aws:forward_to_sfe]. \n\n\
        \ You must specify one of the standard actions: [aws:pass], [aws:drop], or \
         [aws:forward_to_sfe]. In addition, you can specify custom actions that are compatible \
         with your standard section choice.\n\
        \ \n\
        \  For example, you could specify [\\[\"aws:pass\"\\]] or you could specify \
         [\\[\"aws:pass\", \226\128\156customActionName\226\128\157\\]]. For information about \
         compatibility, see the custom action descriptions under [CustomAction].\n\
        \  "]
  stateless_custom_actions : custom_actions option;
      [@ocaml.doc
        "The custom action definitions that are available for use in the firewall policy's \
         [StatelessDefaultActions] setting. You name each custom action that you define, and then \
         you can use it by name in your default actions specifications.\n"]
  stateful_rule_group_references : stateful_rule_group_references option;
      [@ocaml.doc
        "References to the stateful rule groups that are used in the policy. These define the \
         inspection criteria in stateful rules. \n"]
  stateful_default_actions : stateful_actions option;
      [@ocaml.doc
        "The default actions to take on a packet that doesn't match any stateful rules. The \
         stateful default action is optional, and is only valid when using the strict rule order.\n\n\
        \ Valid values of the stateful default action:\n\
        \ \n\
        \  {ul\n\
        \        {-  aws:drop_strict\n\
        \            \n\
        \             }\n\
        \        {-  aws:drop_established\n\
        \            \n\
        \             }\n\
        \        {-  aws:alert_strict\n\
        \            \n\
        \             }\n\
        \        {-  aws:alert_established\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html#suricata-strict-rule-evaluation-order.html}Strict \
         evaluation order} in the {i Network Firewall Developer Guide}. \n\
        \   "]
  stateful_engine_options : stateful_engine_options option;
      [@ocaml.doc
        "Additional options governing how Network Firewall handles stateful rules. The stateful \
         rule groups that you use in your policy must have stateful rule options settings that are \
         compatible with these settings.\n"]
  tls_inspection_configuration_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the TLS inspection configuration.\n"]
  policy_variables : policy_variables option;
      [@ocaml.doc
        "Contains variables that you can use to override default Suricata settings in your \
         firewall policy.\n"]
  enable_tls_session_holding : enable_tls_session_holding option;
      [@ocaml.doc
        "When true, prevents TCP and TLS packets from reaching destination servers until TLS \
         Inspection has evaluated Server Name Indication (SNI) rules. Requires an associated TLS \
         Inspection configuration.\n"]
}
[@@ocaml.doc
  "The firewall policy defines the behavior of a firewall using a collection of stateless and \
   stateful rule groups and other settings. You can use one firewall policy for multiple \
   firewalls. \n\n\
  \ This, along with [FirewallPolicyResponse], define the policy. You can retrieve all objects for \
   a firewall policy by calling [DescribeFirewallPolicy].\n\
  \ "]

type nonrec create_firewall_policy_request = {
  firewall_policy_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the firewall policy. You can't change the name of a firewall \
         policy after you create it.\n"]
  firewall_policy : firewall_policy;
      [@ocaml.doc "The rule groups and policy actions to use in the firewall policy.\n"]
  description : description option; [@ocaml.doc "A description of the firewall policy.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
  dry_run : boolean_ option;
      [@ocaml.doc
        "Indicates whether you want Network Firewall to just check the validity of the request, \
         rather than run the request. \n\n\
        \ If set to [TRUE], Network Firewall checks whether the request can run successfully, but \
         doesn't actually make the requested changes. The call returns the value that the request \
         would return if you ran it with dry run set to [FALSE], but doesn't make additions or \
         changes to your resources. This option allows you to make sure that you have the required \
         permissions to run the request and that your request parameters are valid. \n\
        \ \n\
        \  If set to [FALSE], Network Firewall makes the requested changes to your resources. \n\
        \  "]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains settings for encryption of your firewall policy resources.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_operation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The operation you requested isn't supported by Network Firewall. \n"]

type nonrec tls_intercept_mode = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tls_intercept_properties = {
  pca_arn : resource_arn option;
      [@ocaml.doc
        "Private Certificate Authority (PCA) used to issue private TLS certificates so that the \
         proxy can present PCA-signed certificates which applications trust through the same root, \
         establishing a secure and consistent trust model for encrypted communication.\n"]
  tls_intercept_mode : tls_intercept_mode option;
      [@ocaml.doc "Specifies whether to enable or disable TLS Intercept Mode. \n"]
}
[@@ocaml.doc "TLS decryption on traffic to filter on attributes in the HTTP header. \n"]

type nonrec listener_property_type = HTTP [@ocaml.doc ""] | HTTPS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec nat_gateway_port = int [@@ocaml.doc ""]

type nonrec listener_property = {
  port : nat_gateway_port option; [@ocaml.doc "Port for processing traffic.\n"]
  type_ : listener_property_type option; [@ocaml.doc "Selection of HTTP or HTTPS traffic.\n"]
}
[@@ocaml.doc "Open port for taking HTTP or HTTPS traffic. \n"]

type nonrec listener_properties = listener_property list [@@ocaml.doc ""]

type nonrec nat_gateway_id = string [@@ocaml.doc ""]

type nonrec proxy_modify_state =
  | MODIFYING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec proxy_state =
  | ATTACHING [@ocaml.doc ""]
  | ATTACHED [@ocaml.doc ""]
  | DETACHING [@ocaml.doc ""]
  | DETACHED [@ocaml.doc ""]
  | ATTACH_FAILED [@ocaml.doc ""]
  | DETACH_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec failure_message = string [@@ocaml.doc ""]

type nonrec failure_code = string [@@ocaml.doc ""]

type nonrec update_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec proxy = {
  create_time : create_time option; [@ocaml.doc "Time the Proxy was created. \n"]
  delete_time : delete_time option; [@ocaml.doc "Time the Proxy was deleted. \n"]
  update_time : update_time option; [@ocaml.doc "Time the Proxy was updated. \n"]
  failure_code : failure_code option;
      [@ocaml.doc "Failure code for cases when the Proxy fails to attach or update. \n"]
  failure_message : failure_message option;
      [@ocaml.doc "Failure message for cases when the Proxy fails to attach or update. \n"]
  proxy_state : proxy_state option;
      [@ocaml.doc "Current attachment/detachment status of the Proxy. \n"]
  proxy_modify_state : proxy_modify_state option;
      [@ocaml.doc "Current modification status of the Proxy. \n"]
  nat_gateway_id : nat_gateway_id option; [@ocaml.doc "The NAT Gateway for the proxy. \n"]
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n"]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy configuration.\n"]
  proxy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n"]
  proxy_arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy.\n"]
  listener_properties : listener_properties option;
      [@ocaml.doc "Listener properties for HTTP and HTTPS traffic. \n"]
  tls_intercept_properties : tls_intercept_properties option;
      [@ocaml.doc "TLS decryption on traffic to filter on attributes in the HTTP header. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc "Proxy attached to a NAT gateway. \n"]

type nonrec create_proxy_response = {
  proxy : proxy option; [@ocaml.doc "Proxy attached to a NAT gateway. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy. The token marks the state of the proxy resource at the time of the \
         request. \n\n\
        \ To make changes to the proxy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the proxy hasn't changed since you last retrieved it. If it \
         has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the proxy again to get a current copy of it with a current token. Reapply your \
         changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tls_intercept_properties_request = {
  pca_arn : resource_arn option;
      [@ocaml.doc
        "Private Certificate Authority (PCA) used to issue private TLS certificates so that the \
         proxy can present PCA-signed certificates which applications trust through the same root, \
         establishing a secure and consistent trust model for encrypted communication.\n"]
  tls_intercept_mode : tls_intercept_mode option;
      [@ocaml.doc "Specifies whether to enable or disable TLS Intercept Mode. \n"]
}
[@@ocaml.doc
  "This data type is used specifically for the [CreateProxy] and [UpdateProxy] APIs.\n\n\
  \ TLS decryption on traffic to filter on attributes in the HTTP header. \n\
  \ "]

type nonrec listener_property_request = {
  port : nat_gateway_port; [@ocaml.doc "Port for processing traffic.\n"]
  type_ : listener_property_type; [@ocaml.doc "Selection of HTTP or HTTPS traffic.\n"]
}
[@@ocaml.doc
  "This data type is used specifically for the [CreateProxy] and [UpdateProxy] APIs.\n\n\
  \ Open port for taking HTTP or HTTPS traffic.\n\
  \ "]

type nonrec listener_properties_request = listener_property_request list [@@ocaml.doc ""]

type nonrec create_proxy_request = {
  proxy_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n"]
  nat_gateway_id : nat_gateway_id;
      [@ocaml.doc "A unique identifier for the NAT gateway to use with proxy resources.\n"]
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  listener_properties : listener_properties_request option;
      [@ocaml.doc "Listener properties for HTTP and HTTPS traffic.\n"]
  tls_intercept_properties : tls_intercept_properties_request;
      [@ocaml.doc "TLS decryption on traffic to filter on attributes in the HTTP header. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_proxy_configuration_response = {
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc "The properties that define the proxy configuration. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec resource_arn_list = resource_arn list [@@ocaml.doc ""]

type nonrec resource_name_list = resource_name list [@@ocaml.doc ""]

type nonrec create_proxy_configuration_request = {
  proxy_configuration_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n"]
  description : description option; [@ocaml.doc "A description of the proxy configuration. \n"]
  rule_group_names : resource_name_list option;
      [@ocaml.doc
        "The proxy rule group name(s) to attach to the proxy configuration.\n\n\
        \ You must specify the ARNs or the names, and you can specify both. \n\
        \ "]
  rule_group_arns : resource_arn_list option;
      [@ocaml.doc
        "The proxy rule group arn(s) to attach to the proxy configuration.\n\n\
        \ You must specify the ARNs or the names, and you can specify both. \n\
        \ "]
  default_rule_phase_actions : proxy_config_default_rule_phase_actions_request;
      [@ocaml.doc
        "Evaluation points in the traffic flow where rules are applied. There are three phases in \
         a traffic where the rule match is applied. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec proxy_condition_value = string [@@ocaml.doc ""]

type nonrec proxy_condition_value_list = proxy_condition_value list [@@ocaml.doc ""]

type nonrec proxy_rule_condition = {
  condition_operator : condition_operator option; [@ocaml.doc "Defines how to perform a match.\n"]
  condition_key : condition_key option; [@ocaml.doc "Defines what is to be matched.\n"]
  condition_values : proxy_condition_value_list option;
      [@ocaml.doc "Specifes the exact value that needs to be matched against.\n"]
}
[@@ocaml.doc "Match criteria that specify what traffic attributes to examine.\n"]

type nonrec proxy_rule_condition_list = proxy_rule_condition list [@@ocaml.doc ""]

type nonrec create_proxy_rule = {
  proxy_rule_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule. You can't change the name of a proxy rule after \
         you create it.\n"]
  description : description option; [@ocaml.doc "A description of the proxy rule. \n"]
  action : proxy_rule_phase_action option; [@ocaml.doc "Action to take. \n"]
  conditions : proxy_rule_condition_list option;
      [@ocaml.doc
        "Match criteria that specify what traffic attributes to examine. Conditions include \
         operators (StringEquals, StringLike) and values to match against. \n"]
  insert_position : insert_position option;
      [@ocaml.doc "Where to insert a proxy rule in a proxy rule group. \n"]
}
[@@ocaml.doc
  "Individual rules that define match conditions and actions for application-layer traffic. Rules \
   specify what to inspect (domains, headers, methods) and what action to take (allow, deny, \
   alert). \n"]

type nonrec proxy_rule = {
  proxy_rule_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule. You can't change the name of a proxy rule after \
         you create it.\n"]
  description : description option; [@ocaml.doc "A description of the proxy rule. \n"]
  action : proxy_rule_phase_action option; [@ocaml.doc "Action to take. \n"]
  conditions : proxy_rule_condition_list option;
      [@ocaml.doc
        "Match criteria that specify what traffic attributes to examine. Conditions include \
         operators (StringEquals, StringLike) and values to match against. \n"]
}
[@@ocaml.doc
  "Individual rules that define match conditions and actions for application-layer traffic. Rules \
   specify what to inspect (domains, headers, methods) and what action to take (allow, deny, \
   alert). \n"]

type nonrec proxy_rule_list = proxy_rule list [@@ocaml.doc ""]

type nonrec proxy_rules_by_request_phase = {
  pre_dn_s : proxy_rule_list option; [@ocaml.doc "Before domain resolution. \n"]
  pre_reques_t : proxy_rule_list option; [@ocaml.doc "After DNS, before request.\n"]
  post_respons_e : proxy_rule_list option; [@ocaml.doc "After receiving response.\n"]
}
[@@ocaml.doc
  "Evaluation points in the traffic flow where rules are applied. There are three phases in a \
   traffic where the rule match is applied. \n"]

type nonrec proxy_rule_group = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy rule group.\n"]
  create_time : create_time option; [@ocaml.doc "Time the Proxy Rule Group was created. \n"]
  delete_time : delete_time option; [@ocaml.doc "Time the Proxy Rule Group was deleted. \n"]
  rules : proxy_rules_by_request_phase option;
      [@ocaml.doc
        "Individual rules that define match conditions and actions for application-layer traffic. \
         Rules specify what to inspect (domains, headers, methods) and what action to take (allow, \
         deny, alert). \n"]
  description : description option; [@ocaml.doc "A description of the proxy rule group. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc
  "Collections of related proxy filtering rules. Rule groups help you manage and reuse sets of \
   rules across multiple proxy configurations. \n"]

type nonrec create_proxy_rule_group_response = {
  proxy_rule_group : proxy_rule_group option;
      [@ocaml.doc "The properties that define the proxy rule group. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule group. The token marks the state of the proxy rule group \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule group again to get a current copy of it with a \
         current token. Reapply your changes as needed, then try the operation again using the new \
         token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_proxy_rule_group_request = {
  proxy_rule_group_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  description : description option; [@ocaml.doc "A description of the proxy rule group. \n"]
  rules : proxy_rules_by_request_phase option;
      [@ocaml.doc
        "Individual rules that define match conditions and actions for application-layer traffic. \
         Rules specify what to inspect (domains, headers, methods) and what action to take (allow, \
         deny, alert). \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_proxy_rule_list = create_proxy_rule list [@@ocaml.doc ""]

type nonrec create_proxy_rules_response = {
  proxy_rule_group : proxy_rule_group option;
      [@ocaml.doc
        "The properties that define the proxy rule group with the newly created proxy rule(s). \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule. The token marks the state of the proxy rule resource at the \
         time of the request. \n\n\
        \ To make changes to the proxy rule, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_proxy_rules_by_request_phase = {
  pre_dn_s : create_proxy_rule_list option; [@ocaml.doc "Before domain resolution. \n"]
  pre_reques_t : create_proxy_rule_list option; [@ocaml.doc "After DNS, before request.\n"]
  post_respons_e : create_proxy_rule_list option; [@ocaml.doc "After receiving response.\n"]
}
[@@ocaml.doc
  "Evaluation points in the traffic flow where rules are applied. There are three phases in a \
   traffic where the rule match is applied. \n\n\
  \ This data type is used specifically for the [CreateProxyRules] API.\n\
  \ \n\
  \  Pre-DNS - before domain resolution.\n\
  \  \n\
  \   Pre-Request - after DNS, before request.\n\
  \   \n\
  \    Post-Response - after receiving response.\n\
  \    "]

type nonrec create_proxy_rules_request = {
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rules : create_proxy_rules_by_request_phase;
      [@ocaml.doc
        "Individual rules that define match conditions and actions for application-layer traffic. \
         Rules specify what to inspect (domains, headers, methods) and what action to take (allow, \
         deny, alert). \n"]
}
[@@ocaml.doc ""]

type nonrec summary_rule_option =
  | SID [@ocaml.doc ""]
  | MSG [@ocaml.doc ""]
  | METADATA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec summary_rule_options = summary_rule_option list [@@ocaml.doc ""]

type nonrec summary_configuration = {
  rule_options : summary_rule_options option;
      [@ocaml.doc "Specifies the selected rule options returned by [DescribeRuleGroupSummary].\n"]
}
[@@ocaml.doc
  "A complex type that specifies which Suricata rule metadata fields to use when displaying threat \
   information. Contains:\n\n\
  \ {ul\n\
  \       {-   [RuleOptions] - The Suricata rule options fields to extract and display\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   These settings affect how threat information appears in both the console and API responses. \
   Summaries are available for rule groups you manage and for active threat defense Amazon Web \
   Services managed rule groups.\n\
  \   "]

type nonrec source_metadata = {
  source_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule group that your own rule group is copied from.\n"]
  source_update_token : update_token option;
      [@ocaml.doc
        "The update token of the Amazon Web Services managed rule group that your own rule group \
         is copied from. To determine the update token for the managed rule group, call \
         {{:https://docs.aws.amazon.com/network-firewall/latest/APIReference/API_DescribeRuleGroup.html#networkfirewall-DescribeRuleGroup-response-UpdateToken}DescribeRuleGroup}.\n"]
}
[@@ocaml.doc
  "High-level information about the managed rule group that your own rule group is copied from. \
   You can use the the metadata to track version updates made to the originating rule group. You \
   can retrieve all objects for a rule group by calling \
   {{:https://docs.aws.amazon.com/network-firewall/latest/APIReference/API_DescribeRuleGroup.html}DescribeRuleGroup}.\n"]

type nonrec rule_group_type =
  | STATELESS [@ocaml.doc ""]
  | STATEFUL [@ocaml.doc ""]
  | STATEFUL_DOMAIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rule_group_response = {
  rule_group_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule group.\n\n\
        \  If this response is for a create request that had [DryRun] set to [TRUE], then this ARN \
         is a placeholder that isn't attached to a valid resource.\n\
        \  \n\
        \   "]
  rule_group_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n"]
  rule_group_id : resource_id; [@ocaml.doc "The unique identifier for the rule group. \n"]
  description : description option; [@ocaml.doc "A description of the rule group. \n"]
  type_ : rule_group_type option;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules. \n"]
  capacity : rule_capacity option;
      [@ocaml.doc
        "The maximum operating resources that this rule group can use. Rule group capacity is \
         fixed at creation. When you update a rule group, you are limited to this capacity. When \
         you reference a rule group from a firewall policy, Network Firewall reserves this \
         capacity for the rule group. \n\n\
        \ You can retrieve the capacity that would be required for a rule group before you create \
         the rule group by calling [CreateRuleGroup] with [DryRun] set to [TRUE]. \n\
        \ "]
  rule_group_status : resource_status option;
      [@ocaml.doc "Detailed information about the current status of a rule group. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
  consumed_capacity : rule_capacity option;
      [@ocaml.doc "The number of capacity units currently consumed by the rule group rules. \n"]
  number_of_associations : number_of_associations option;
      [@ocaml.doc "The number of firewall policies that use this rule group.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains the Amazon Web Services KMS encryption configuration \
         settings for your rule group.\n"]
  source_metadata : source_metadata option;
      [@ocaml.doc
        "A complex type that contains metadata about the rule group that your own rule group is \
         copied from. You can use the metadata to track the version updates made to the \
         originating rule group.\n"]
  sns_topic : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Simple Notification Service SNS topic that's \
         used to record changes to the managed rule group. You can subscribe to the SNS topic to \
         receive notifications when the managed rule group is modified, such as for new versions \
         and for version expiration. For more information, see the \
         {{:https://docs.aws.amazon.com/sns/latest/dg/welcome.html}Amazon Simple Notification \
         Service Developer Guide.}.\n"]
  last_modified_time : last_update_time option;
      [@ocaml.doc "The last time that the rule group was changed.\n"]
  analysis_results : analysis_result_list option;
      [@ocaml.doc
        "The list of analysis results for [AnalyzeRuleGroup]. If you set [AnalyzeRuleGroup] to \
         [TRUE] in [CreateRuleGroup], [UpdateRuleGroup], or [DescribeRuleGroup], Network Firewall \
         analyzes the rule group and identifies the rules that might adversely effect your \
         firewall's functionality. For example, if Network Firewall detects a rule that's routing \
         traffic asymmetrically, which impacts the service's ability to properly process traffic, \
         the service includes the rule in the list of analysis results.\n"]
  summary_configuration : summary_configuration option;
      [@ocaml.doc
        "A complex type containing the currently selected rule option fields that will be \
         displayed for rule summarization returned by [DescribeRuleGroupSummary].\n\n\
        \ {ul\n\
        \       {-  The [RuleOptions] specified in [SummaryConfiguration] \n\
        \           \n\
        \            }\n\
        \       {-  Rule metadata organization preferences\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "The high-level properties of a rule group. This, along with the [RuleGroup], define the rule \
   group. You can retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n"]

type nonrec create_rule_group_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the rule group. The token marks the state of the rule group resource at the \
         time of the request. \n\n\
        \ To make changes to the rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the rule group again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  rule_group_response : rule_group_response;
      [@ocaml.doc
        "The high-level properties of a rule group. This, along with the [RuleGroup], define the \
         rule group. You can retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n"]
}
[@@ocaml.doc ""]

type nonrec rules_string = string [@@ocaml.doc ""]

type nonrec stateful_rule_options = {
  rule_order : rule_order option;
      [@ocaml.doc
        "Indicates how to manage the order of the rule evaluation for the rule group. \
         [DEFAULT_ACTION_ORDER] is the default behavior. Stateful rules are provided to the rule \
         engine as Suricata compatible strings, and Suricata evaluates them based on certain \
         settings. For more information, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-rule-evaluation-order.html}Evaluation \
         order for stateful rules} in the {i Network Firewall Developer Guide}. \n"]
}
[@@ocaml.doc
  "Additional options governing how Network Firewall handles the rule group. You can only use \
   these for stateful rule groups.\n"]

type nonrec tcp_flag =
  | FIN [@ocaml.doc ""]
  | SYN [@ocaml.doc ""]
  | RST [@ocaml.doc ""]
  | PSH [@ocaml.doc ""]
  | ACK [@ocaml.doc ""]
  | URG [@ocaml.doc ""]
  | ECE [@ocaml.doc ""]
  | CWR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec flags = tcp_flag list [@@ocaml.doc ""]

type nonrec tcp_flag_field = {
  flags : flags;
      [@ocaml.doc
        "Used in conjunction with the [Masks] setting to define the flags that must be set and \
         flags that must not be set in order for the packet to match. This setting can only \
         specify values that are also specified in the [Masks] setting.\n\n\
        \ For the flags that are specified in the masks setting, the following must be true for \
         the packet to match: \n\
        \ \n\
        \  {ul\n\
        \        {-  The ones that are set in this flags setting must be set in the packet. \n\
        \            \n\
        \             }\n\
        \        {-  The ones that are not set in this flags setting must also not be set in the \
         packet. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  masks : flags option;
      [@ocaml.doc
        "The set of flags to consider in the inspection. To inspect all flags in the valid values \
         list, leave this with no setting.\n"]
}
[@@ocaml.doc
  "TCP flags and masks to inspect packets for, used in stateless rules [MatchAttributes] settings.\n"]

type nonrec tcp_flags = tcp_flag_field list [@@ocaml.doc ""]

type nonrec protocol_number = int [@@ocaml.doc ""]

type nonrec protocol_numbers = protocol_number list [@@ocaml.doc ""]

type nonrec port_range_bound = int [@@ocaml.doc ""]

type nonrec port_range = {
  from_port : port_range_bound;
      [@ocaml.doc
        "The lower limit of the port range. This must be less than or equal to the [ToPort] \
         specification. \n"]
  to_port : port_range_bound;
      [@ocaml.doc
        "The upper limit of the port range. This must be greater than or equal to the [FromPort] \
         specification. \n"]
}
[@@ocaml.doc
  "A single port range specification. This is used for source and destination port ranges in the \
   stateless rule [MatchAttributes], [SourcePorts], and [DestinationPorts] settings. \n"]

type nonrec port_ranges = port_range list [@@ocaml.doc ""]

type nonrec match_attributes = {
  sources : addresses option;
      [@ocaml.doc
        "The source IP addresses and address ranges to inspect for, in CIDR notation. If not \
         specified, this matches with any source address. \n"]
  destinations : addresses option;
      [@ocaml.doc
        "The destination IP addresses and address ranges to inspect for, in CIDR notation. If not \
         specified, this matches with any destination address. \n"]
  source_ports : port_ranges option;
      [@ocaml.doc
        "The source port to inspect for. You can specify an individual port, for example [1994] \
         and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n\n\
        \  If not specified, this matches with any source port.\n\
        \ \n\
        \  This setting is only used for protocols 6 (TCP) and 17 (UDP).\n\
        \  "]
  destination_ports : port_ranges option;
      [@ocaml.doc
        "The destination port to inspect for. You can specify an individual port, for example \
         [1994] and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n\n\
        \ This setting is only used for protocols 6 (TCP) and 17 (UDP). \n\
        \ "]
  protocols : protocol_numbers option;
      [@ocaml.doc
        "The protocols to inspect for, specified using the assigned internet protocol number \
         (IANA) for each protocol. If not specified, this matches with any protocol.\n"]
  tcp_flags : tcp_flags option;
      [@ocaml.doc
        "The TCP flags and masks to inspect for. If not specified, this matches with any settings. \
         This setting is only used for protocol 6 (TCP).\n"]
}
[@@ocaml.doc
  "Criteria for Network Firewall to use to inspect an individual packet in stateless rule \
   inspection. Each match attributes set can include one or more items such as IP address, CIDR \
   range, port number, protocol, and TCP flags. \n"]

type nonrec rule_definition = {
  match_attributes : match_attributes;
      [@ocaml.doc
        "Criteria for Network Firewall to use to inspect an individual packet in stateless rule \
         inspection. Each match attributes set can include one or more items such as IP address, \
         CIDR range, port number, protocol, and TCP flags. \n"]
  actions : stateless_actions;
      [@ocaml.doc
        "The actions to take on a packet that matches one of the stateless rule definition's match \
         attributes. You must specify a standard action and you can add custom actions. \n\n\
        \  Network Firewall only forwards a packet for stateful rule inspection if you specify \
         [aws:forward_to_sfe] for a rule that the packet matches, or if the packet doesn't match \
         any stateless rule and you specify [aws:forward_to_sfe] for the [StatelessDefaultActions] \
         setting for the [FirewallPolicy].\n\
        \  \n\
        \    For every rule, you must specify exactly one of the following standard actions. \n\
        \    \n\
        \     {ul\n\
        \           {-   {b aws:pass} - Discontinues all inspection of the packet and permits it \
         to go to its intended destination.\n\
        \               \n\
        \                }\n\
        \           {-   {b aws:drop} - Discontinues all inspection of the packet and blocks it \
         from going to its intended destination.\n\
        \               \n\
        \                }\n\
        \           {-   {b aws:forward_to_sfe} - Discontinues stateless inspection of the packet \
         and forwards it to the stateful rule engine for inspection. \n\
        \               \n\
        \                }\n\
        \           }\n\
        \   Additionally, you can specify a custom action. To do this, you define a custom action \
         by name and type, then provide the name you've assigned to the action in this [Actions] \
         setting. For information about the options, see [CustomAction]. \n\
        \   \n\
        \    To provide more than one action in this setting, separate the settings with a comma. \
         For example, if you have a custom [PublishMetrics] action that you've named \
         [MyMetricsAction], then you could specify the standard action [aws:pass] and the custom \
         action with [\\[\226\128\156aws:pass\226\128\157,\n\
        \            \226\128\156MyMetricsAction\226\128\157\\]]. \n\
        \    "]
}
[@@ocaml.doc
  "The inspection criteria and action for a single stateless rule. Network Firewall inspects each \
   packet for the specified matching criteria. When a packet matches the criteria, Network \
   Firewall performs the rule's actions on the packet.\n"]

type nonrec stateless_rule = {
  rule_definition : rule_definition;
      [@ocaml.doc
        "Defines the stateless 5-tuple packet inspection criteria and the action to take on a \
         packet that matches the criteria. \n"]
  priority : priority;
      [@ocaml.doc
        "Indicates the order in which to run this rule relative to all of the rules that are \
         defined for a stateless rule group. Network Firewall evaluates the rules in a rule group \
         starting with the lowest priority setting. You must ensure that the priority settings are \
         unique for the rule group. \n\n\
        \ Each stateless rule group uses exactly one [StatelessRulesAndCustomActions] object, and \
         each [StatelessRulesAndCustomActions] contains exactly one [StatelessRules] object. To \
         ensure unique priority settings for your rule groups, set unique priorities for the \
         stateless rules that you define inside any single [StatelessRules] object.\n\
        \ \n\
        \  You can change the priority settings of your rules at any time. To make it easier to \
         insert rules later, number them so there's a wide range in between, for example use 100, \
         200, and so on. \n\
        \  "]
}
[@@ocaml.doc "A single stateless rule. This is used in [StatelessRulesAndCustomActions].\n"]

type nonrec stateless_rules = stateless_rule list [@@ocaml.doc ""]

type nonrec stateless_rules_and_custom_actions = {
  stateless_rules : stateless_rules;
      [@ocaml.doc "Defines the set of stateless rules for use in a stateless rule group. \n"]
  custom_actions : custom_actions option;
      [@ocaml.doc
        "Defines an array of individual custom action definitions that are available for use by \
         the stateless rules in this [StatelessRulesAndCustomActions] specification. You name each \
         custom action that you define, and then you can use it by name in your [StatelessRule] \
         [RuleDefinition] [Actions] specification.\n"]
}
[@@ocaml.doc
  "Stateless inspection criteria. Each stateless rule group uses exactly one of these data types \
   to define its stateless rules. \n"]

type nonrec setting = string [@@ocaml.doc ""]

type nonrec settings = setting list [@@ocaml.doc ""]

type nonrec keyword = string [@@ocaml.doc ""]

type nonrec rule_option = {
  keyword : keyword;
      [@ocaml.doc
        "The keyword for the Suricata compatible rule option. You must include a [sid] (signature \
         ID), and can optionally include other keywords. For information about Suricata compatible \
         keywords, see \
         {{:https://suricata.readthedocs.io/en/suricata-7.0.3/rules/intro.html#rule-options}Rule \
         options} in the Suricata documentation.\n"]
  settings : settings option;
      [@ocaml.doc
        "The settings of the Suricata compatible rule option. Rule options have zero or more \
         setting values, and the number of possible and required settings depends on the \
         [Keyword]. For more information about the settings for specific options, see \
         {{:https://suricata.readthedocs.io/en/suricata-7.0.3/rules/intro.html#rule-options}Rule \
         options}.\n"]
}
[@@ocaml.doc
  "Additional settings for a stateful rule. This is part of the [StatefulRule] configuration.\n"]

type nonrec rule_options = rule_option list [@@ocaml.doc ""]

type nonrec port = string [@@ocaml.doc ""]

type nonrec destination = string [@@ocaml.doc ""]

type nonrec stateful_rule_direction = FORWARD [@ocaml.doc ""] | ANY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec source = string [@@ocaml.doc ""]

type nonrec stateful_rule_protocol =
  | ANY [@ocaml.doc ""]
  | TCP [@ocaml.doc ""]
  | UDP [@ocaml.doc ""]
  | ICMP [@ocaml.doc ""]
  | HTTP [@ocaml.doc ""]
  | FTP [@ocaml.doc ""]
  | TLS [@ocaml.doc ""]
  | SMB [@ocaml.doc ""]
  | DNS [@ocaml.doc ""]
  | DCERPC [@ocaml.doc ""]
  | SSH [@ocaml.doc ""]
  | SMTP [@ocaml.doc ""]
  | IMAP [@ocaml.doc ""]
  | MSN [@ocaml.doc ""]
  | KRB5 [@ocaml.doc ""]
  | IKEV2 [@ocaml.doc ""]
  | TFTP [@ocaml.doc ""]
  | NTP [@ocaml.doc ""]
  | DHCP [@ocaml.doc ""]
  | HTTP2 [@ocaml.doc ""]
  | QUIC [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec header = {
  protocol : stateful_rule_protocol;
      [@ocaml.doc
        "The protocol to inspect for. To specify all, you can use [IP], because all traffic on \
         Amazon Web Services and on the internet is IP.\n"]
  source : source;
      [@ocaml.doc
        "The source IP address or address range to inspect for, in CIDR notation. To match with \
         any address, specify [ANY]. \n\n\
        \ Specify an IP address or a block of IP addresses in Classless Inter-Domain Routing \
         (CIDR) notation. Network Firewall supports all address ranges for IPv4 and IPv6. \n\
        \ \n\
        \  Examples: \n\
        \  \n\
        \   {ul\n\
        \         {-  To configure Network Firewall to inspect for the IP address 192.0.2.44, \
         specify [192.0.2.44/32].\n\
        \             \n\
        \              }\n\
        \         {-  To configure Network Firewall to inspect for IP addresses from 192.0.2.0 to \
         192.0.2.255, specify [192.0.2.0/24].\n\
        \             \n\
        \              }\n\
        \         {-  To configure Network Firewall to inspect for the IP address \
         1111:0000:0000:0000:0000:0000:0000:0111, specify \
         [1111:0000:0000:0000:0000:0000:0000:0111/128].\n\
        \             \n\
        \              }\n\
        \         {-  To configure Network Firewall to inspect for IP addresses from \
         1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, \
         specify [1111:0000:0000:0000:0000:0000:0000:0000/64].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   For more information about CIDR notation, see the Wikipedia entry \
         {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain \
         Routing}.\n\
        \   "]
  source_port : port;
      [@ocaml.doc
        "The source port to inspect for. You can specify an individual port, for example [1994] \
         and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n"]
  direction : stateful_rule_direction;
      [@ocaml.doc
        "The direction of traffic flow to inspect. If set to [ANY], the inspection matches \
         bidirectional traffic, both from the source to the destination and from the destination \
         to the source. If set to [FORWARD], the inspection only matches traffic going from the \
         source to the destination. \n"]
  destination : destination;
      [@ocaml.doc
        "The destination IP address or address range to inspect for, in CIDR notation. To match \
         with any address, specify [ANY]. \n\n\
        \ Specify an IP address or a block of IP addresses in Classless Inter-Domain Routing \
         (CIDR) notation. Network Firewall supports all address ranges for IPv4 and IPv6. \n\
        \ \n\
        \  Examples: \n\
        \  \n\
        \   {ul\n\
        \         {-  To configure Network Firewall to inspect for the IP address 192.0.2.44, \
         specify [192.0.2.44/32].\n\
        \             \n\
        \              }\n\
        \         {-  To configure Network Firewall to inspect for IP addresses from 192.0.2.0 to \
         192.0.2.255, specify [192.0.2.0/24].\n\
        \             \n\
        \              }\n\
        \         {-  To configure Network Firewall to inspect for the IP address \
         1111:0000:0000:0000:0000:0000:0000:0111, specify \
         [1111:0000:0000:0000:0000:0000:0000:0111/128].\n\
        \             \n\
        \              }\n\
        \         {-  To configure Network Firewall to inspect for IP addresses from \
         1111:0000:0000:0000:0000:0000:0000:0000 to 1111:0000:0000:0000:ffff:ffff:ffff:ffff, \
         specify [1111:0000:0000:0000:0000:0000:0000:0000/64].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   For more information about CIDR notation, see the Wikipedia entry \
         {{:https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing}Classless Inter-Domain \
         Routing}.\n\
        \   "]
  destination_port : port;
      [@ocaml.doc
        "The destination port to inspect for. You can specify an individual port, for example \
         [1994] and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n"]
}
[@@ocaml.doc
  "The basic rule criteria for Network Firewall to use to inspect packet headers in stateful \
   traffic flow inspection. Traffic flows that match the criteria are a match for the \
   corresponding [StatefulRule]. \n"]

type nonrec stateful_action =
  | PASS [@ocaml.doc ""]
  | DROP [@ocaml.doc ""]
  | ALERT [@ocaml.doc ""]
  | REJECT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stateful_rule = {
  action : stateful_action;
      [@ocaml.doc
        "Defines what Network Firewall should do with the packets in a traffic flow when the flow \
         matches the stateful rule criteria. For all actions, Network Firewall performs the \
         specified action and discontinues stateful inspection of the traffic flow. \n\n\
        \ The actions for a stateful rule are defined as follows: \n\
        \ \n\
        \  {ul\n\
        \        {-   {b PASS} - Permits the packets to go to the intended destination.\n\
        \            \n\
        \             }\n\
        \        {-   {b DROP} - Blocks the packets from going to the intended destination and \
         sends an alert log message, if alert logging is configured in the [Firewall] \
         [LoggingConfiguration]. \n\
        \            \n\
        \             }\n\
        \        {-   {b ALERT} - Sends an alert log message, if alert logging is configured in \
         the [Firewall] [LoggingConfiguration]. \n\
        \            \n\
        \             You can use this action to test a rule that you intend to use to drop \
         traffic. You can enable the rule with [ALERT] action, verify in the logs that the rule is \
         filtering as you want, then change the action to [DROP].\n\
        \             \n\
        \              }\n\
        \        {-   {b REJECT} - Drops traffic that matches the conditions of the stateful rule, \
         and sends a TCP reset packet back to sender of the packet. A TCP reset packet is a packet \
         with no payload and an RST bit contained in the TCP header flags. REJECT is available \
         only for TCP traffic. This option doesn't support FTP or IMAP protocols.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  header : header;
      [@ocaml.doc
        "The stateful inspection criteria for this rule, used to inspect traffic flows. \n"]
  rule_options : rule_options;
      [@ocaml.doc
        "Additional options for the rule. These are the Suricata [RuleOptions] settings.\n"]
}
[@@ocaml.doc
  "A single Suricata rules specification, for use in a stateful rule group. Use this option to \
   specify a simple Suricata rule with protocol, source and destination, ports, direction, and \
   rule options. For information about the Suricata [Rules] format, see \
   {{:https://suricata.readthedocs.io/en/suricata-7.0.3/rules/intro.html}Rules Format}. \n"]

type nonrec stateful_rules = stateful_rule list [@@ocaml.doc ""]

type nonrec generated_rules_type =
  | ALLOWLIST [@ocaml.doc ""]
  | DENYLIST [@ocaml.doc ""]
  | REJECTLIST [@ocaml.doc ""]
  | ALERTLIST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_type = TLS_SNI [@ocaml.doc ""] | HTTP_HOST [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec target_types = target_type list [@@ocaml.doc ""]

type nonrec rule_targets = collection_member__string list [@@ocaml.doc ""]

type nonrec rules_source_list = {
  targets : rule_targets;
      [@ocaml.doc
        "The domains that you want to inspect for in your traffic flows. Valid domain \
         specifications are the following:\n\n\
        \ {ul\n\
        \       {-  Explicit names. For example, [abc.example.com] matches only the domain \
         [abc.example.com].\n\
        \           \n\
        \            }\n\
        \       {-  Names that use a domain wildcard, which you indicate with an initial '[.]'. \
         For example,[.example.com] matches [example.com] and matches all subdomains of \
         [example.com], such as [abc.example.com] and [www.example.com]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  target_types : target_types;
      [@ocaml.doc
        "The protocols you want to inspect. Specify [TLS_SNI] for [HTTPS]. Specify [HTTP_HOST] for \
         [HTTP]. You can specify either or both. \n"]
  generated_rules_type : generated_rules_type;
      [@ocaml.doc
        "Whether you want to apply allow, reject, alert, or drop behavior to the domains in your \
         target list.\n\n\
        \  When logging is enabled and you choose Alert, traffic that matches the domain \
         specifications generates an alert in the firewall's logs. Then, traffic either passes, is \
         rejected, or drops based on other rules in the firewall policy.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Stateful inspection criteria for a domain list rule group. \n\n\
  \ For HTTPS traffic, domain filtering is SNI-based. It uses the server name indicator extension \
   of the TLS handshake.\n\
  \ \n\
  \  By default, Network Firewall domain list inspection only includes traffic coming from the VPC \
   where you deploy the firewall. To inspect traffic from IP addresses outside of the deployment \
   VPC, you set the [HOME_NET] rule variable to include the CIDR range of the deployment VPC plus \
   the other CIDR ranges. For more information, see [RuleVariables] in this guide and \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/stateful-rule-groups-domain-names.html}Stateful \
   domain list rule groups in Network Firewall} in the {i Network Firewall Developer Guide}.\n\
  \  "]

type nonrec rules_source = {
  rules_string : rules_string option;
      [@ocaml.doc
        "Stateful inspection criteria, provided in Suricata compatible rules. Suricata is an \
         open-source threat detection framework that includes a standard rule-based language for \
         network traffic inspection.\n\n\
        \ These rules contain the inspection criteria and the action to take for traffic that \
         matches the criteria, so this type of rule group doesn't have a separate action setting.\n\
        \ \n\
        \   You can't use the [priority] keyword if the [RuleOrder] option in \
         [StatefulRuleOptions] is set to [STRICT_ORDER].\n\
        \   \n\
        \    "]
  rules_source_list : rules_source_list option;
      [@ocaml.doc "Stateful inspection criteria for a domain list rule group. \n"]
  stateful_rules : stateful_rules option;
      [@ocaml.doc
        "An array of individual stateful rules inspection criteria to be used together in a \
         stateful rule group. Use this option to specify simple Suricata rules with protocol, \
         source and destination, ports, direction, and rule options. For information about the \
         Suricata [Rules] format, see \
         {{:https://suricata.readthedocs.io/en/suricata-7.0.3/rules/intro.html}Rules Format}. \n"]
  stateless_rules_and_custom_actions : stateless_rules_and_custom_actions option;
      [@ocaml.doc "Stateless inspection criteria to be used in a stateless rule group. \n"]
}
[@@ocaml.doc
  "The stateless or stateful rules definitions for use in a single rule group. Each rule group \
   requires a single [RulesSource]. You can use an instance of this for either stateless rules or \
   stateful rules. \n"]

type nonrec ip_set_reference = {
  reference_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that you are referencing in your rule group.\n"]
}
[@@ocaml.doc
  "Configures one or more IP set references for a Suricata-compatible rule group. This is used in \
   [CreateRuleGroup] or [UpdateRuleGroup]. An IP set reference is a rule variable that references \
   resources that you create and manage in another Amazon Web Services service, such as an Amazon \
   VPC prefix list. Network Firewall IP set references enable you to dynamically update the \
   contents of your rules. When you create, update, or delete the resource you are referencing in \
   your rule, Network Firewall automatically updates the rule's content with the changes. For more \
   information about IP set references in Network Firewall, see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/rule-groups-ip-set-references}Using \
   IP set references} in the {i Network Firewall Developer Guide}.\n\n\
  \  Network Firewall currently supports \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/managed-prefix-lists.html}Amazon VPC prefix \
   lists} and \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/rule-groups-ip-set-references.html#rule-groups-referencing-resource-groups}resource \
   groups} in IP set references. \n\
  \ "]

type nonrec ip_set_reference_name = string [@@ocaml.doc ""]

type nonrec ip_set_reference_map = (ip_set_reference_name * ip_set_reference) list [@@ocaml.doc ""]

type nonrec reference_sets = {
  ip_set_references : ip_set_reference_map option; [@ocaml.doc "The list of IP set references.\n"]
}
[@@ocaml.doc "Contains a set of IP set references.\n"]

type nonrec port_set = {
  definition : variable_definition_list option; [@ocaml.doc "The set of port ranges. \n"]
}
[@@ocaml.doc "A set of port ranges for use in the rules in a rule group. \n"]

type nonrec port_sets = (rule_variable_name * port_set) list [@@ocaml.doc ""]

type nonrec rule_variables = {
  ip_sets : ip_sets option;
      [@ocaml.doc "A list of IP addresses and address ranges, in CIDR notation. \n"]
  port_sets : port_sets option; [@ocaml.doc "A list of port ranges. \n"]
}
[@@ocaml.doc
  "Settings that are available for use in the rules in the [RuleGroup] where this is defined. See \
   [CreateRuleGroup] or [UpdateRuleGroup] for usage.\n"]

type nonrec rule_group = {
  rule_variables : rule_variables option;
      [@ocaml.doc
        "Settings that are available for use in the rules in the rule group. You can only use \
         these for stateful rule groups. \n"]
  reference_sets : reference_sets option;
      [@ocaml.doc "The list of a rule group's reference sets.\n"]
  rules_source : rules_source;
      [@ocaml.doc "The stateful rules or stateless rules for the rule group. \n"]
  stateful_rule_options : stateful_rule_options option;
      [@ocaml.doc
        "Additional options governing how Network Firewall handles stateful rules. The policies \
         where you use your stateful rule group must have stateful rule options settings that are \
         compatible with these settings. Some limitations apply; for more information, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/suricata-limitations-caveats.html}Strict \
         evaluation order} in the {i Network Firewall Developer Guide}.\n"]
}
[@@ocaml.doc
  "The object that defines the rules in a rule group. This, along with [RuleGroupResponse], define \
   the rule group. You can retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n\n\
  \ Network Firewall uses a rule group to inspect and control network traffic. You define \
   stateless rule groups to inspect individual packets and you define stateful rule groups to \
   inspect packets in the context of their traffic flow. \n\
  \ \n\
  \  To use a rule group, you include it by reference in an Network Firewall firewall policy, then \
   you use the policy in a firewall. You can reference a rule group from more than one firewall \
   policy, and you can use a firewall policy in more than one firewall. \n\
  \  "]

type nonrec create_rule_group_request = {
  rule_group_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n"]
  rule_group : rule_group option;
      [@ocaml.doc
        "An object that defines the rule group rules. \n\n\
        \  You must provide either this rule group setting or a [Rules] setting, but not both. \n\
        \  \n\
        \   "]
  rules : rules_string option;
      [@ocaml.doc
        "A string containing stateful rule group rules specifications in Suricata flat format, \
         with one rule per line. Use this to import your existing Suricata compatible rule groups. \
         \n\n\
        \  You must provide either this rules setting or a populated [RuleGroup] setting, but not \
         both. \n\
        \  \n\
        \    You can provide your rule group specification in Suricata flat format through this \
         setting when you create or update your rule group. The call response returns a \
         [RuleGroup] object that Network Firewall has populated from your string. \n\
        \    "]
  type_ : rule_group_type;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules. \n"]
  description : description option; [@ocaml.doc "A description of the rule group. \n"]
  capacity : rule_capacity;
      [@ocaml.doc
        "The maximum operating resources that this rule group can use. Rule group capacity is \
         fixed at creation. When you update a rule group, you are limited to this capacity. When \
         you reference a rule group from a firewall policy, Network Firewall reserves this \
         capacity for the rule group. \n\n\
        \ You can retrieve the capacity that would be required for a rule group before you create \
         the rule group by calling [CreateRuleGroup] with [DryRun] set to [TRUE]. \n\
        \ \n\
        \   You can't change or exceed this capacity when you update the rule group, so leave room \
         for your rule group to grow. \n\
        \   \n\
        \      {b Capacity for a stateless rule group} \n\
        \     \n\
        \      For a stateless rule group, the capacity required is the sum of the capacity \
         requirements of the individual rules that you expect to have in the rule group. \n\
        \      \n\
        \       To calculate the capacity requirement of a single rule, multiply the capacity \
         requirement values of each of the rule's match settings:\n\
        \       \n\
        \        {ul\n\
        \              {-  A match setting with no criteria specified has a value of 1. \n\
        \                  \n\
        \                   }\n\
        \              {-  A match setting with [Any] specified has a value of 1. \n\
        \                  \n\
        \                   }\n\
        \              {-  All other match settings have a value equal to the number of elements \
         provided in the setting. For example, a protocol setting \\[\"UDP\"\\] and a source \
         setting \\[\"10.0.0.0/24\"\\] each have a value of 1. A protocol setting \
         \\[\"UDP\",\"TCP\"\\] has a value of 2. A source setting \
         \\[\"10.0.0.0/24\",\"10.0.0.1/24\",\"10.0.0.2/24\"\\] has a value of 3. \n\
        \                  \n\
        \                   }\n\
        \              }\n\
        \   A rule with no criteria specified in any of its match settings has a capacity \
         requirement of 1. A rule with protocol setting \\[\"UDP\",\"TCP\"\\], source setting \
         \\[\"10.0.0.0/24\",\"10.0.0.1/24\",\"10.0.0.2/24\"\\], and a single specification or no \
         specification for each of the other match settings has a capacity requirement of 6. \n\
        \   \n\
        \     {b Capacity for a stateful rule group} \n\
        \    \n\
        \     For a stateful rule group, the minimum capacity required is the number of individual \
         rules that you expect to have in the rule group. \n\
        \     "]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
  dry_run : boolean_ option;
      [@ocaml.doc
        "Indicates whether you want Network Firewall to just check the validity of the request, \
         rather than run the request. \n\n\
        \ If set to [TRUE], Network Firewall checks whether the request can run successfully, but \
         doesn't actually make the requested changes. The call returns the value that the request \
         would return if you ran it with dry run set to [FALSE], but doesn't make additions or \
         changes to your resources. This option allows you to make sure that you have the required \
         permissions to run the request and that your request parameters are valid. \n\
        \ \n\
        \  If set to [FALSE], Network Firewall makes the requested changes to your resources. \n\
        \  "]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains settings for encryption of your rule group resources.\n"]
  source_metadata : source_metadata option;
      [@ocaml.doc
        "A complex type that contains metadata about the rule group that your own rule group is \
         copied from. You can use the metadata to keep track of updates made to the originating \
         rule group.\n"]
  analyze_rule_group : boolean_ option;
      [@ocaml.doc
        "Indicates whether you want Network Firewall to analyze the stateless rules in the rule \
         group for rule behavior such as asymmetric routing. If set to [TRUE], Network Firewall \
         runs the analysis and then creates the rule group for you. To run the stateless rule \
         group analyzer without creating the rule group, set [DryRun] to [TRUE].\n"]
  summary_configuration : summary_configuration option;
      [@ocaml.doc
        "An object that contains a [RuleOptions] array of strings. You use [RuleOptions] to \
         determine which of the following [RuleSummary] values are returned in response to \
         [DescribeRuleGroupSummary].\n\n\
        \ {ul\n\
        \       {-   [Metadata] - returns\n\
        \           \n\
        \            }\n\
        \       {-   [Msg] \n\
        \           \n\
        \            }\n\
        \       {-   [SID] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec tls_inspection_configuration_response = {
  tls_inspection_configuration_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the TLS inspection configuration.\n"]
  tls_inspection_configuration_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the TLS inspection configuration. You can't change the name of a \
         TLS inspection configuration after you create it.\n"]
  tls_inspection_configuration_id : resource_id;
      [@ocaml.doc
        "A unique identifier for the TLS inspection configuration. This ID is returned in the \
         responses to create and list commands. You provide it to operations such as update and \
         delete.\n"]
  tls_inspection_configuration_status : resource_status option;
      [@ocaml.doc
        "Detailed information about the current status of a [TLSInspectionConfiguration]. You can \
         retrieve this for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration] and providing the TLS inspection configuration name \
         and ARN.\n"]
  description : description option;
      [@ocaml.doc "A description of the TLS inspection configuration. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
  last_modified_time : last_update_time option;
      [@ocaml.doc "The last time that the TLS inspection configuration was changed.\n"]
  number_of_associations : number_of_associations option;
      [@ocaml.doc "The number of firewall policies that use this TLS inspection configuration.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains the Amazon Web Services KMS encryption configuration \
         settings for your TLS inspection configuration.\n"]
  certificates : certificates option;
      [@ocaml.doc "A list of the certificates associated with the TLS inspection configuration.\n"]
  certificate_authority : tls_certificate_data option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The high-level properties of a TLS inspection configuration. This, along with the \
   [TLSInspectionConfiguration], define the TLS inspection configuration. You can retrieve all \
   objects for a TLS inspection configuration by calling [DescribeTLSInspectionConfiguration].\n"]

type nonrec create_tls_inspection_configuration_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the TLS inspection configuration. The token marks the state of the TLS \
         inspection configuration resource at the time of the request. \n\n\
        \ To make changes to the TLS inspection configuration, you provide the token in your \
         request. Network Firewall uses the token to ensure that the TLS inspection configuration \
         hasn't changed since you last retrieved it. If it has changed, the operation fails with \
         an [InvalidTokenException]. If this happens, retrieve the TLS inspection configuration \
         again to get a current copy of it with a current token. Reapply your changes as needed, \
         then try the operation again using the new token. \n\
        \ "]
  tls_inspection_configuration_response : tls_inspection_configuration_response;
      [@ocaml.doc
        "The high-level properties of a TLS inspection configuration. This, along with the \
         [TLSInspectionConfiguration], define the TLS inspection configuration. You can retrieve \
         all objects for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration]. \n"]
}
[@@ocaml.doc ""]

type nonrec server_certificate_scope = {
  sources : addresses option;
      [@ocaml.doc
        "The source IP addresses and address ranges to decrypt for inspection, in CIDR notation. \
         If not specified, this matches with any source address.\n"]
  destinations : addresses option;
      [@ocaml.doc
        "The destination IP addresses and address ranges to decrypt for inspection, in CIDR \
         notation. If not specified, this matches with any destination address.\n"]
  source_ports : port_ranges option;
      [@ocaml.doc
        "The source ports to decrypt for inspection, in Transmission Control Protocol (TCP) \
         format. If not specified, this matches with any source port.\n\n\
        \ You can specify individual ports, for example [1994], and you can specify port ranges, \
         such as [1990:1994].\n\
        \ "]
  destination_ports : port_ranges option;
      [@ocaml.doc
        "The destination ports to decrypt for inspection, in Transmission Control Protocol (TCP) \
         format. If not specified, this matches with any destination port.\n\n\
        \ You can specify individual ports, for example [1994], and you can specify port ranges, \
         such as [1990:1994].\n\
        \ "]
  protocols : protocol_numbers option;
      [@ocaml.doc
        "The protocols to inspect for, specified using the assigned internet protocol number \
         (IANA) for each protocol. If not specified, this matches with any protocol.\n\n\
        \ Network Firewall currently supports only TCP.\n\
        \ "]
}
[@@ocaml.doc
  "Settings that define the Secure Sockets Layer/Transport Layer Security (SSL/TLS) traffic that \
   Network Firewall should decrypt for inspection by the stateful rule engine.\n"]

type nonrec server_certificate_scopes = server_certificate_scope list [@@ocaml.doc ""]

type nonrec server_certificate = {
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Certificate Manager SSL/TLS server certificate \
         that's used for inbound SSL/TLS inspection.\n"]
}
[@@ocaml.doc
  "Any Certificate Manager (ACM) Secure Sockets Layer/Transport Layer Security (SSL/TLS) server \
   certificate that's associated with a [ServerCertificateConfiguration]. Used in a \
   [TLSInspectionConfiguration] for inspection of inbound traffic to your firewall. You must \
   request or import a SSL/TLS certificate into ACM for each domain Network Firewall needs to \
   decrypt and inspect. Network Firewall uses the SSL/TLS certificates to decrypt specified \
   inbound SSL/TLS traffic going to your firewall. For information about working with certificates \
   in Certificate Manager, see \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html}Request a public \
   certificate } or \
   {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
   certificates} in the {i Certificate Manager User Guide}.\n"]

type nonrec server_certificates = server_certificate list [@@ocaml.doc ""]

type nonrec server_certificate_configuration = {
  server_certificates : server_certificates option;
      [@ocaml.doc "The list of server certificates to use for inbound SSL/TLS inspection.\n"]
  scopes : server_certificate_scopes option; [@ocaml.doc "A list of scopes.\n"]
  certificate_authority_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the imported certificate authority (CA) certificate \
         within Certificate Manager (ACM) to use for outbound SSL/TLS inspection.\n\n\
        \ The following limitations apply:\n\
        \ \n\
        \  {ul\n\
        \        {-  You can use CA certificates that you imported into ACM, but you can't \
         generate CA certificates with ACM.\n\
        \            \n\
        \             }\n\
        \        {-  You can't use certificates issued by Private Certificate Authority.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about configuring certificates for outbound inspection, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection-certificate-requirements.html}Using \
         SSL/TLS certificates with TLS inspection configurations} in the {i Network Firewall \
         Developer Guide}. \n\
        \   \n\
        \    For information about working with certificates in ACM, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/import-certificate.html}Importing \
         certificates} in the {i Certificate Manager User Guide}.\n\
        \    "]
  check_certificate_revocation_status : check_certificate_revocation_status_actions option;
      [@ocaml.doc
        "When enabled, Network Firewall checks if the server certificate presented by the server \
         in the SSL/TLS connection has a revoked or unkown status. If the certificate has an \
         unknown or revoked status, you must specify the actions that Network Firewall takes on \
         outbound traffic. To check the certificate revocation status, you must also specify a \
         [CertificateAuthorityArn] in [ServerCertificateConfiguration].\n"]
}
[@@ocaml.doc
  "Configures the Certificate Manager certificates and scope that Network Firewall uses to decrypt \
   and re-encrypt traffic using a [TLSInspectionConfiguration]. You can configure \
   [ServerCertificates] for inbound SSL/TLS inspection, a [CertificateAuthorityArn] for outbound \
   SSL/TLS inspection, or both. For information about working with certificates for TLS \
   inspection, see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection-certificate-requirements.html} \
   Using SSL/TLS server certficiates with TLS inspection configurations} in the {i Network \
   Firewall Developer Guide}.\n\n\
  \  If a server certificate that's associated with your [TLSInspectionConfiguration] is revoked, \
   deleted, or expired it can result in client-side TLS errors.\n\
  \  \n\
  \   "]

type nonrec server_certificate_configurations = server_certificate_configuration list
[@@ocaml.doc ""]

type nonrec tls_inspection_configuration = {
  server_certificate_configurations : server_certificate_configurations option;
      [@ocaml.doc
        "Lists the server certificate configurations that are associated with the TLS configuration.\n"]
}
[@@ocaml.doc
  "The object that defines a TLS inspection configuration. This, along with \
   [TLSInspectionConfigurationResponse], define the TLS inspection configuration. You can retrieve \
   all objects for a TLS inspection configuration by calling [DescribeTLSInspectionConfiguration]. \
   \n\n\
  \ Network Firewall uses a TLS inspection configuration to decrypt traffic. Network Firewall \
   re-encrypts the traffic before sending it to its destination.\n\
  \ \n\
  \  To use a TLS inspection configuration, you add it to a new Network Firewall firewall policy, \
   then you apply the firewall policy to a firewall. Network Firewall acts as a proxy service to \
   decrypt and inspect the traffic traveling through your firewalls. You can reference a TLS \
   inspection configuration from more than one firewall policy, and you can use a firewall policy \
   in more than one firewall. For more information about using TLS inspection configurations, see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html}Inspecting \
   SSL/TLS traffic with TLS inspection configurations} in the {i Network Firewall Developer Guide}.\n\
  \  "]

type nonrec create_tls_inspection_configuration_request = {
  tls_inspection_configuration_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the TLS inspection configuration. You can't change the name of a \
         TLS inspection configuration after you create it.\n"]
  tls_inspection_configuration : tls_inspection_configuration;
      [@ocaml.doc
        "The object that defines a TLS inspection configuration. This, along with \
         [TLSInspectionConfigurationResponse], define the TLS inspection configuration. You can \
         retrieve all objects for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration]. \n\n\
        \ Network Firewall uses a TLS inspection configuration to decrypt traffic. Network \
         Firewall re-encrypts the traffic before sending it to its destination.\n\
        \ \n\
        \  To use a TLS inspection configuration, you add it to a new Network Firewall firewall \
         policy, then you apply the firewall policy to a firewall. Network Firewall acts as a \
         proxy service to decrypt and inspect the traffic traveling through your firewalls. You \
         can reference a TLS inspection configuration from more than one firewall policy, and you \
         can use a firewall policy in more than one firewall. For more information about using TLS \
         inspection configurations, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html}Inspecting \
         SSL/TLS traffic with TLS inspection configurations} in the {i Network Firewall Developer \
         Guide}.\n\
        \  "]
  description : description option;
      [@ocaml.doc "A description of the TLS inspection configuration. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
  encryption_configuration : encryption_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint_association_status = {
  status : firewall_status_value;
      [@ocaml.doc "The readiness of the configured firewall endpoint to handle network traffic. \n"]
  association_sync_state : association_sync_state option;
      [@ocaml.doc
        "The list of the Availability Zone sync states for all subnets that are defined by the \
         firewall. \n"]
}
[@@ocaml.doc
  "Detailed information about the current status of a [VpcEndpointAssociation]. You can retrieve \
   this by calling [DescribeVpcEndpointAssociation] and providing the VPC endpoint association ARN.\n"]

type nonrec vpc_endpoint_association = {
  vpc_endpoint_association_id : resource_id option;
      [@ocaml.doc "The unique identifier of the VPC endpoint association. \n"]
  vpc_endpoint_association_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
  firewall_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  vpc_id : vpc_id; [@ocaml.doc "The unique identifier of the VPC for the endpoint association. \n"]
  subnet_mapping : subnet_mapping; [@ocaml.doc ""]
  description : description option; [@ocaml.doc "A description of the VPC endpoint association. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc
  "A VPC endpoint association defines a single subnet to use for a firewall endpoint for a \
   [Firewall]. You can define VPC endpoint associations only in the Availability Zones that \
   already have a subnet mapping defined in the [Firewall] resource. \n\n\
  \  You can retrieve the list of Availability Zones that are available for use by calling \
   [DescribeFirewallMetadata].\n\
  \  \n\
  \    To manage firewall endpoints, first, in the [Firewall] specification, you specify a single \
   VPC and one subnet for each of the Availability Zones where you want to use the firewall. Then \
   you can define additional endpoints as VPC endpoint associations. \n\
  \    \n\
  \     You can use VPC endpoint associations to expand the protections of the firewall as follows: \n\
  \     \n\
  \      {ul\n\
  \            {-   {b Protect multiple VPCs with a single firewall} - You can use the firewall to \
   protect other VPCs, either in your account or in accounts where the firewall is shared. You can \
   only specify Availability Zones that already have a firewall endpoint defined in the [Firewall] \
   subnet mappings.\n\
  \                \n\
  \                 }\n\
  \            {-   {b Define multiple firewall endpoints for a VPC in an Availability Zone} - You \
   can create additional firewall endpoints for the VPC that you have defined in the firewall, in \
   any Availability Zone that already has an endpoint defined in the [Firewall] subnet mappings. \
   You can create multiple VPC endpoint associations for any other VPC where you use the firewall.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   You can use Resource Access Manager to share a [Firewall] that you own with other accounts, \
   which gives them the ability to use the firewall to create VPC endpoint associations. For \
   information about sharing a firewall, see [PutResourcePolicy] in this guide and see \
   {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/sharing.html}Sharing \
   Network Firewall resources} in the {i Network Firewall Developer Guide}.\n\
  \   \n\
  \    The status of the VPC endpoint association, which indicates whether it's ready to filter \
   network traffic, is provided in the corresponding [VpcEndpointAssociationStatus]. You can \
   retrieve both the association and its status by calling [DescribeVpcEndpointAssociation].\n\
  \    "]

type nonrec create_vpc_endpoint_association_response = {
  vpc_endpoint_association : vpc_endpoint_association option;
      [@ocaml.doc
        "The configuration settings for the VPC endpoint association. These settings include the \
         firewall and the VPC and subnet to use for the firewall endpoint. \n"]
  vpc_endpoint_association_status : vpc_endpoint_association_status option;
      [@ocaml.doc
        "Detailed information about the current status of a [VpcEndpointAssociation]. You can \
         retrieve this by calling [DescribeVpcEndpointAssociation] and providing the VPC endpoint \
         association ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec create_vpc_endpoint_association_request = {
  firewall_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  vpc_id : vpc_id;
      [@ocaml.doc
        "The unique identifier of the VPC where you want to create a firewall endpoint. \n"]
  subnet_mapping : subnet_mapping; [@ocaml.doc ""]
  description : description option; [@ocaml.doc "A description of the VPC endpoint association. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_container_association_response = {
  container_association_name : resource_name option;
      [@ocaml.doc "The descriptive name of the container association.\n"]
  container_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the container association.\n"]
  status : container_association_status option;
      [@ocaml.doc "The current status of the container association.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_container_association_request = {
  container_association_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the container association. You must specify the ARN or the name, \
         and you can specify both.\n"]
  container_association_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the container association. You must specify the ARN or \
         the name, and you can specify both.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_response = {
  firewall : firewall option; [@ocaml.doc ""]
  firewall_status : firewall_status option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_request = {
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_policy_response = {
  firewall_policy_response : firewall_policy_response;
      [@ocaml.doc
        "The object containing the definition of the [FirewallPolicyResponse] that you asked to \
         delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_firewall_policy_request = {
  firewall_policy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall policy. You can't change the name of a firewall \
         policy after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_policy_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall policy.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_network_firewall_transit_gateway_attachment_response = {
  transit_gateway_attachment_id : transit_gateway_attachment_id;
      [@ocaml.doc "The ID of the transit gateway attachment that was deleted.\n"]
  transit_gateway_attachment_status : transit_gateway_attachment_status;
      [@ocaml.doc
        "The current status of the transit gateway attachment deletion process.\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [CREATING] - The attachment is being created\n\
        \            \n\
        \             }\n\
        \        {-   [DELETING] - The attachment is being deleted\n\
        \            \n\
        \             }\n\
        \        {-   [DELETED] - The attachment has been deleted\n\
        \            \n\
        \             }\n\
        \        {-   [FAILED] - The attachment creation has failed and cannot be recovered\n\
        \            \n\
        \             }\n\
        \        {-   [ERROR] - The attachment is in an error state that might be recoverable\n\
        \            \n\
        \             }\n\
        \        {-   [READY] - The attachment is active and processing traffic\n\
        \            \n\
        \             }\n\
        \        {-   [PENDING_ACCEPTANCE] - The attachment is waiting to be accepted\n\
        \            \n\
        \             }\n\
        \        {-   [REJECTING] - The attachment is in the process of being rejected\n\
        \            \n\
        \             }\n\
        \        {-   [REJECTED] - The attachment has been rejected\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_network_firewall_transit_gateway_attachment_request = {
  transit_gateway_attachment_id : transit_gateway_attachment_id;
      [@ocaml.doc "Required. The unique identifier of the transit gateway attachment to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_response = {
  nat_gateway_id : nat_gateway_id option;
      [@ocaml.doc "The NAT Gateway the Proxy was attached to. \n"]
  proxy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n"]
  proxy_arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_request = {
  nat_gateway_id : nat_gateway_id; [@ocaml.doc "The NAT Gateway the proxy is attached to. \n"]
  proxy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_configuration_response = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n"]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_configuration_request = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_rule_group_response = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy rule group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_rule_group_request = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_rules_response = {
  proxy_rule_group : proxy_rule_group option;
      [@ocaml.doc
        "The properties that define the proxy rule group with the newly created proxy rule(s). \n"]
}
[@@ocaml.doc ""]

type nonrec delete_proxy_rules_request = {
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rules : resource_name_list;
      [@ocaml.doc "The proxy rule(s) to remove from the existing proxy rule group. \n"]
}
[@@ocaml.doc ""]

type nonrec invalid_resource_policy_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The policy statement failed validation.\n"]

type nonrec delete_resource_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule group or firewall policy whose resource policy \
         you want to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_group_response = {
  rule_group_response : rule_group_response;
      [@ocaml.doc
        "The high-level properties of a rule group. This, along with the [RuleGroup], define the \
         rule group. You can retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_group_request = {
  rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  type_ : rule_group_type option;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules. \n\n\
        \  This setting is required for requests that do not include the [RuleGroupARN].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec delete_tls_inspection_configuration_response = {
  tls_inspection_configuration_response : tls_inspection_configuration_response;
      [@ocaml.doc
        "The high-level properties of a TLS inspection configuration. This, along with the \
         [TLSInspectionConfiguration], define the TLS inspection configuration. You can retrieve \
         all objects for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration]. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_tls_inspection_configuration_request = {
  tls_inspection_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the TLS inspection configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  tls_inspection_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the TLS inspection configuration. You can't change the name of a \
         TLS inspection configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delete_vpc_endpoint_association_response = {
  vpc_endpoint_association : vpc_endpoint_association option;
      [@ocaml.doc
        "The configuration settings for the VPC endpoint association. These settings include the \
         firewall and the VPC and subnet to use for the firewall endpoint. \n"]
  vpc_endpoint_association_status : vpc_endpoint_association_status option;
      [@ocaml.doc
        "Detailed information about the current status of a [VpcEndpointAssociation]. You can \
         retrieve this by calling [DescribeVpcEndpointAssociation] and providing the VPC endpoint \
         association ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_vpc_endpoint_association_request = {
  vpc_endpoint_association_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_association_response = {
  container_association_name : resource_name option;
      [@ocaml.doc "The descriptive name of the container association.\n"]
  container_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the container association.\n"]
  description : description option; [@ocaml.doc "A description of the container association.\n"]
  type_ : container_monitoring_type option;
      [@ocaml.doc "The type of container orchestration platform. Either [ECS] or [EKS].\n"]
  container_monitoring_configurations : container_monitoring_configurations option;
      [@ocaml.doc "The container monitoring configurations for this container association.\n"]
  status : container_association_status option;
      [@ocaml.doc "The current status of the container association.\n"]
  resolved_cidr_count : cidr_count option;
      [@ocaml.doc
        "The number of CIDR blocks that have been resolved from the monitored containers for this \
         container association.\n"]
  last_updated_time : container_association_last_updated_time option;
      [@ocaml.doc
        "The last time that the container association was updated or resolved new container IP \
         addresses.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs associated with the resource.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the container association. The token marks the state of the container \
         association resource at the time of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_association_request = {
  container_association_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the container association. You must specify the ARN or the name, \
         and you can specify both.\n"]
  container_association_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the container association. You must specify the ARN or \
         the name, and you can specify both.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_firewall_response = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall : firewall option;
      [@ocaml.doc
        "The configuration settings for the firewall. These settings include the firewall policy \
         and the subnets in your VPC to use for the firewall endpoints. \n"]
  firewall_status : firewall_status option;
      [@ocaml.doc
        "Detailed information about the current status of a [Firewall]. You can retrieve this for \
         a firewall by calling [DescribeFirewall] and providing the firewall name and ARN.\n\n\
        \ The firewall status indicates a combined status. It indicates whether all subnets are \
         up-to-date with the latest firewall configurations, which is based on the sync states \
         config values, and also whether all subnets have their endpoints fully enabled, based on \
         their sync states attachment values. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_firewall_request = {
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec supported_availability_zones = (availability_zone * availability_zone_metadata) list
[@@ocaml.doc ""]

type nonrec describe_firewall_metadata_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_policy_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall policy.\n"]
  description : description option; [@ocaml.doc "A description of the firewall.\n"]
  status : firewall_status_value option;
      [@ocaml.doc
        "The readiness of the configured firewall to handle network traffic across all of the \
         Availability Zones where you have it configured. This setting is [READY] only when the \
         [ConfigurationSyncStateSummary] value is [IN_SYNC] and the [Attachment] [Status] values \
         for all of the configured subnets are [READY]. \n"]
  supported_availability_zones : supported_availability_zones option;
      [@ocaml.doc
        "The Availability Zones that the firewall currently supports. This includes all \
         Availability Zones for which the firewall has a subnet defined. \n"]
  transit_gateway_attachment_id : transit_gateway_attachment_id option;
      [@ocaml.doc
        "The unique identifier of the transit gateway attachment associated with this firewall. \
         This field is only present for transit gateway-attached firewalls.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_firewall_metadata_request = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_firewall_policy_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the firewall policy. The token marks the state of the policy resource at the \
         time of the request. \n\n\
        \ To make changes to the policy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the policy hasn't changed since you last retrieved it. If \
         it has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the firewall policy again to get a current copy of it with current token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  firewall_policy_response : firewall_policy_response;
      [@ocaml.doc
        "The high-level properties of a firewall policy. This, along with the [FirewallPolicy], \
         define the policy. You can retrieve all objects for a firewall policy by calling \
         [DescribeFirewallPolicy]. \n"]
  firewall_policy : firewall_policy option;
      [@ocaml.doc "The policy for the specified firewall policy. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_firewall_policy_request = {
  firewall_policy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall policy. You can't change the name of a firewall \
         policy after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_policy_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall policy.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec protocol_string = string [@@ocaml.doc ""]

type nonrec protocol_strings = protocol_string list [@@ocaml.doc ""]

type nonrec flow_filter = {
  source_address : address option; [@ocaml.doc ""]
  destination_address : address option; [@ocaml.doc ""]
  source_port : port option;
      [@ocaml.doc
        "The source port to inspect for. You can specify an individual port, for example [1994] \
         and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n"]
  destination_port : port option;
      [@ocaml.doc
        "The destination port to inspect for. You can specify an individual port, for example \
         [1994] and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n"]
  protocols : protocol_strings option;
      [@ocaml.doc
        "The protocols to inspect for, specified using the assigned internet protocol number \
         (IANA) for each protocol. If not specified, this matches with any protocol.\n"]
}
[@@ocaml.doc
  "Defines the scope a flow operation. You can use up to 20 filters to configure a single flow \
   operation.\n"]

type nonrec flow_filters = flow_filter list [@@ocaml.doc ""]

type nonrec flow_operation = {
  minimum_flow_age_in_seconds : age option;
      [@ocaml.doc
        "The reqested [FlowOperation] ignores flows with an age (in seconds) lower than \
         [MinimumFlowAgeInSeconds]. You provide this for start commands.\n"]
  flow_filters : flow_filters option;
      [@ocaml.doc
        "Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n"]
}
[@@ocaml.doc
  "Contains information about a flow operation, such as related statuses, unique identifiers, and \
   all filters defined in the operation.\n\n\
  \ Flow operations let you manage the flows tracked in the flow table, also known as the firewall \
   table.\n\
  \ \n\
  \  A flow is network traffic that is monitored by a firewall, either by stateful or stateless \
   rules. For traffic to be considered part of a flow, it must share Destination, DestinationPort, \
   Direction, Protocol, Source, and SourcePort. \n\
  \  "]

type nonrec flow_request_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec flow_operation_status =
  | COMPLETED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED_WITH_ERRORS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec flow_operation_type = FLOW_FLUSH [@ocaml.doc ""] | FLOW_CAPTURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec flow_operation_id = string [@@ocaml.doc ""]

type nonrec vpc_endpoint_id = string [@@ocaml.doc ""]

type nonrec describe_flow_operation_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall is located. For example, [us-east-2a].\n\n\
        \ Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n\
        \ "]
  vpc_endpoint_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "A unique identifier for the primary endpoint associated with a firewall.\n"]
  flow_operation_id : flow_operation_id option;
      [@ocaml.doc
        "A unique identifier for the flow operation. This ID is returned in the responses to start \
         and list commands. You provide to describe commands.\n"]
  flow_operation_type : flow_operation_type option;
      [@ocaml.doc "Defines the type of [FlowOperation].\n"]
  flow_operation_status : flow_operation_status option;
      [@ocaml.doc
        "Returns the status of the flow operation. This string is returned in the responses to \
         start, list, and describe commands.\n\n\
        \ If the status is [COMPLETED_WITH_ERRORS], results may be returned with any number of \
         [Flows] missing from the response. If the status is [FAILED], [Flows] returned will be \
         empty.\n\
        \ "]
  status_message : status_reason option;
      [@ocaml.doc
        "If the asynchronous operation fails, Network Firewall populates this with the reason for \
         the error or failure. Options include [Flow operation error] and [Flow timeout].\n"]
  flow_request_timestamp : flow_request_timestamp option;
      [@ocaml.doc
        "A timestamp indicating when the Suricata engine identified flows impacted by an operation. \n"]
  flow_operation : flow_operation option;
      [@ocaml.doc
        "Returns key information about a flow operation, such as related statuses, unique \
         identifiers, and all filters defined in the operation.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_flow_operation_request = {
  firewall_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall is located. For example, [us-east-2a].\n\n\
        \ Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n\
        \ "]
  vpc_endpoint_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "A unique identifier for the primary endpoint associated with a firewall.\n"]
  flow_operation_id : flow_operation_id;
      [@ocaml.doc
        "A unique identifier for the flow operation. This ID is returned in the responses to start \
         and list commands. You provide to describe commands.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_monitoring_dashboard = bool [@@ocaml.doc ""]

type nonrec hash_map_value = string [@@ocaml.doc ""]

type nonrec hash_map_key = string [@@ocaml.doc ""]

type nonrec log_destination_map = (hash_map_key * hash_map_value) list [@@ocaml.doc ""]

type nonrec log_destination_type =
  | S3 [@ocaml.doc ""]
  | CLOUDWATCH_LOGS [@ocaml.doc ""]
  | KINESIS_DATA_FIREHOSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_type = ALERT [@ocaml.doc ""] | FLOW [@ocaml.doc ""] | TLS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_destination_config = {
  log_type : log_type;
      [@ocaml.doc
        "The type of log to record. You can record the following types of logs from your Network \
         Firewall stateful engine.\n\n\
        \ {ul\n\
        \       {-   [ALERT] - Logs for traffic that matches your stateful rules and that have an \
         action that sends an alert. A stateful rule sends alerts for the rule actions DROP, \
         ALERT, and REJECT. For more information, see [StatefulRule].\n\
        \           \n\
        \            }\n\
        \       {-   [FLOW] - Standard network traffic flow logs. The stateful rules engine \
         records flow logs for all network traffic that it receives. Each flow log record captures \
         the network flow for a specific standard stateless rule group.\n\
        \           \n\
        \            }\n\
        \       {-   [TLS] - Logs for events that are related to TLS inspection. For more \
         information, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection-configurations.html}Inspecting \
         SSL/TLS traffic with TLS inspection configurations} in the {i Network Firewall Developer \
         Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  log_destination_type : log_destination_type;
      [@ocaml.doc
        "The type of storage destination to send these logs to. You can send logs to an Amazon S3 \
         bucket, a CloudWatch log group, or a Firehose delivery stream.\n"]
  log_destination : log_destination_map;
      [@ocaml.doc
        "The named location for the logs, provided in a key:value mapping that is specific to the \
         chosen destination type. \n\n\
        \ {ul\n\
        \       {-  For an Amazon S3 bucket, provide the name of the bucket, with key \
         [bucketName], and optionally provide a prefix, with key [prefix]. \n\
        \           \n\
        \            The following example specifies an Amazon S3 bucket named \
         [DOC-EXAMPLE-BUCKET] and the prefix [alerts]: \n\
        \            \n\
        \              [\"LogDestination\": { \"bucketName\": \"DOC-EXAMPLE-BUCKET\", \"prefix\": \
         \"alerts\"\n\
        \                  }] \n\
        \             \n\
        \              }\n\
        \       {-  For a CloudWatch log group, provide the name of the CloudWatch log group, with \
         key [logGroup]. The following example specifies a log group named [alert-log-group]: \n\
        \           \n\
        \             [\"LogDestination\": { \"logGroup\": \"alert-log-group\" }] \n\
        \            \n\
        \             }\n\
        \       {-  For a Firehose delivery stream, provide the name of the delivery stream, with \
         key [deliveryStream]. The following example specifies a delivery stream named \
         [alert-delivery-stream]: \n\
        \           \n\
        \             [\"LogDestination\": { \"deliveryStream\": \"alert-delivery-stream\"\n\
        \               }] \n\
        \            \n\
        \             }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Defines where Network Firewall sends logs for the firewall for one log type. This is used in \
   [LoggingConfiguration]. You can send each type of log to an Amazon S3 bucket, a CloudWatch log \
   group, or a Firehose delivery stream.\n\n\
  \ Network Firewall generates logs for stateful rule groups. You can save alert, flow, and TLS \
   log types. \n\
  \ "]

type nonrec log_destination_configs = log_destination_config list [@@ocaml.doc ""]

type nonrec logging_configuration = {
  log_destination_configs : log_destination_configs;
      [@ocaml.doc
        "Defines the logging destinations for the logs for a firewall. Network Firewall generates \
         logs for stateful rule groups. \n"]
}
[@@ocaml.doc "Defines how Network Firewall performs logging for a [Firewall]. \n"]

type nonrec describe_logging_configuration_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  logging_configuration : logging_configuration option; [@ocaml.doc ""]
  enable_monitoring_dashboard : enable_monitoring_dashboard option;
      [@ocaml.doc
        "A boolean that reflects whether or not the firewall monitoring dashboard is enabled on a \
         firewall.\n\n\
        \  Returns [TRUE] when the firewall monitoring dashboard is enabled on the firewall. \
         Returns [FALSE] when the firewall monitoring dashboard is not enabled on the firewall. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_logging_configuration_request = {
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec private_dns_name = string [@@ocaml.doc ""]

type nonrec vpc_endpoint_service_name = string [@@ocaml.doc ""]

type nonrec describe_proxy_resource = {
  proxy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n"]
  proxy_arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy.\n"]
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n"]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy configuration.\n"]
  nat_gateway_id : nat_gateway_id option; [@ocaml.doc "The NAT Gateway for the proxy. \n"]
  proxy_state : proxy_state option;
      [@ocaml.doc "Current attachment/detachment status of the Proxy. \n"]
  proxy_modify_state : proxy_modify_state option;
      [@ocaml.doc "Current modification status of the Proxy. \n"]
  listener_properties : listener_properties option;
      [@ocaml.doc "Listener properties for HTTP and HTTPS traffic. \n"]
  tls_intercept_properties : tls_intercept_properties option;
      [@ocaml.doc "TLS decryption on traffic to filter on attributes in the HTTP header. \n"]
  vpc_endpoint_service_name : vpc_endpoint_service_name option;
      [@ocaml.doc "The service endpoint created in the VPC. \n"]
  private_dns_name : private_dns_name option; [@ocaml.doc "The private DNS name of the Proxy. \n"]
  create_time : create_time option; [@ocaml.doc "Time the Proxy was created. \n"]
  delete_time : delete_time option; [@ocaml.doc "Time the Proxy was deleted. \n"]
  update_time : update_time option; [@ocaml.doc "Time the Proxy was updated. \n"]
  failure_code : failure_code option;
      [@ocaml.doc "Failure code for cases when the Proxy fails to attach or update. \n"]
  failure_message : failure_message option;
      [@ocaml.doc "Failure message for cases when the Proxy fails to attach or update. \n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs to associate with the resource.\n"]
}
[@@ocaml.doc "Proxy attached to a NAT gateway. \n"]

type nonrec describe_proxy_response = {
  proxy : describe_proxy_resource option; [@ocaml.doc "Proxy attached to a NAT gateway. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy. The token marks the state of the proxy resource at the time of the \
         request. \n\n\
        \ To make changes to the proxy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the proxy hasn't changed since you last retrieved it. If it \
         has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the proxy again to get a current copy of it with a current token. Reapply your \
         changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_proxy_request = {
  proxy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_proxy_configuration_response = {
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc "The configuration for the specified proxy configuration. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_proxy_configuration_request = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_proxy_rule_response = {
  proxy_rule : proxy_rule option; [@ocaml.doc "The configuration for the specified proxy rule. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule. The token marks the state of the proxy rule resource at the \
         time of the request. \n\n\
        \ To make changes to the proxy rule, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_proxy_rule_request = {
  proxy_rule_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the proxy rule. You can't change the name of a proxy rule after \
         you create it.\n"]
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_proxy_rule_group_response = {
  proxy_rule_group : proxy_rule_group option;
      [@ocaml.doc "The configuration for the specified proxy rule group. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule group. The token marks the state of the proxy rule group \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule group again to get a current copy of it with a \
         current token. Reapply your changes as needed, then try the operation again using the new \
         token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_proxy_rule_group_request = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec policy_string = string [@@ocaml.doc ""]

type nonrec describe_resource_policy_response = {
  policy : policy_string option; [@ocaml.doc "The IAM policy for the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule group or firewall policy whose resource policy \
         you want to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_rule_group_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the rule group. The token marks the state of the rule group resource at the \
         time of the request. \n\n\
        \ To make changes to the rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the rule group again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  rule_group : rule_group option;
      [@ocaml.doc
        "The object that defines the rules in a rule group. This, along with [RuleGroupResponse], \
         define the rule group. You can retrieve all objects for a rule group by calling \
         [DescribeRuleGroup]. \n\n\
        \ Network Firewall uses a rule group to inspect and control network traffic. You define \
         stateless rule groups to inspect individual packets and you define stateful rule groups \
         to inspect packets in the context of their traffic flow. \n\
        \ \n\
        \  To use a rule group, you include it by reference in an Network Firewall firewall \
         policy, then you use the policy in a firewall. You can reference a rule group from more \
         than one firewall policy, and you can use a firewall policy in more than one firewall. \n\
        \  "]
  rule_group_response : rule_group_response;
      [@ocaml.doc
        "The high-level properties of a rule group. This, along with the [RuleGroup], define the \
         rule group. You can retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_rule_group_request = {
  rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  type_ : rule_group_type option;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules. \n\n\
        \  This setting is required for requests that do not include the [RuleGroupARN].\n\
        \  \n\
        \   "]
  analyze_rule_group : boolean_ option;
      [@ocaml.doc
        "Indicates whether you want Network Firewall to analyze the stateless rules in the rule \
         group for rule behavior such as asymmetric routing. If set to [TRUE], Network Firewall \
         runs the analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec listing_name = string [@@ocaml.doc ""]

type nonrec product_id = string [@@ocaml.doc ""]

type nonrec vendor_name = string [@@ocaml.doc ""]

type nonrec describe_rule_group_metadata_response = {
  rule_group_arn : resource_arn;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  description : description option;
      [@ocaml.doc "Returns the metadata objects for the specified rule group. \n"]
  type_ : rule_group_type option;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules. \n\n\
        \  This setting is required for requests that do not include the [RuleGroupARN].\n\
        \  \n\
        \   "]
  capacity : rule_capacity option;
      [@ocaml.doc
        "The maximum operating resources that this rule group can use. Rule group capacity is \
         fixed at creation. When you update a rule group, you are limited to this capacity. When \
         you reference a rule group from a firewall policy, Network Firewall reserves this \
         capacity for the rule group. \n\n\
        \ You can retrieve the capacity that would be required for a rule group before you create \
         the rule group by calling [CreateRuleGroup] with [DryRun] set to [TRUE]. \n\
        \ "]
  stateful_rule_options : stateful_rule_options option; [@ocaml.doc ""]
  last_modified_time : last_update_time option;
      [@ocaml.doc "A timestamp indicating when the rule group was last modified.\n"]
  vendor_name : vendor_name option;
      [@ocaml.doc
        "The name of the Amazon Web Services Marketplace vendor that provides this rule group.\n"]
  product_id : product_id option;
      [@ocaml.doc
        "The unique identifier for the product listing associated with this rule group.\n"]
  listing_name : listing_name option;
      [@ocaml.doc "The display name of the product listing for this rule group.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rule_group_metadata_request = {
  rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  type_ : rule_group_type option;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules. \n\n\
        \  This setting is required for requests that do not include the [RuleGroupARN].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec rule_summary = {
  si_d : collection_member__string option;
      [@ocaml.doc "The unique identifier (Signature ID) of the Suricata rule.\n"]
  msg : collection_member__string option;
      [@ocaml.doc "The contents taken from the rule's msg field.\n"]
  metadata : collection_member__string option; [@ocaml.doc "The contents of the rule's metadata.\n"]
}
[@@ocaml.doc
  "A complex type containing details about a Suricata rule. Contains:\n\n\
  \ {ul\n\
  \       {-   [SID] \n\
  \           \n\
  \            }\n\
  \       {-   [Msg] \n\
  \           \n\
  \            }\n\
  \       {-   [Metadata] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Summaries are available for rule groups you manage and for active threat defense Amazon Web \
   Services managed rule groups.\n\
  \   "]

type nonrec rule_summaries = rule_summary list [@@ocaml.doc ""]

type nonrec summary = {
  rule_summaries : rule_summaries option;
      [@ocaml.doc
        "An array of [RuleSummary] objects containing individual rule details that had been \
         configured by the rulegroup's SummaryConfiguration.\n"]
}
[@@ocaml.doc
  "A complex type containing summaries of security protections provided by a rule group.\n\n\
  \ Network Firewall extracts this information from selected fields in the rule group's Suricata \
   rules, based on your [SummaryConfiguration] settings.\n\
  \ "]

type nonrec describe_rule_group_summary_response = {
  rule_group_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n"]
  description : description option; [@ocaml.doc "A description of the rule group. \n"]
  summary : summary option;
      [@ocaml.doc
        "A complex type that contains rule information based on the rule group's configured \
         summary settings. The content varies depending on the fields that you specified to \
         extract in your SummaryConfiguration. When you haven't configured any summary settings, \
         this returns an empty array. The response might include:\n\n\
        \ {ul\n\
        \       {-  Rule identifiers\n\
        \           \n\
        \            }\n\
        \       {-  Rule descriptions\n\
        \           \n\
        \            }\n\
        \       {-  Any metadata fields that you specified in your SummaryConfiguration\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_rule_group_summary_request = {
  rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_arn : resource_arn option;
      [@ocaml.doc
        "Required. The Amazon Resource Name (ARN) of the rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  type_ : rule_group_type option;
      [@ocaml.doc
        "The type of rule group you want a summary for. This is a required field.\n\n\
        \ Valid value: [STATEFUL] \n\
        \ \n\
        \  Note that [STATELESS] exists but is not currently supported. If you provide \
         [STATELESS], an exception is returned.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_tls_inspection_configuration_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the TLS inspection configuration. The token marks the state of the TLS \
         inspection configuration resource at the time of the request. \n\n\
        \ To make changes to the TLS inspection configuration, you provide the token in your \
         request. Network Firewall uses the token to ensure that the TLS inspection configuration \
         hasn't changed since you last retrieved it. If it has changed, the operation fails with \
         an [InvalidTokenException]. If this happens, retrieve the TLS inspection configuration \
         again to get a current copy of it with a current token. Reapply your changes as needed, \
         then try the operation again using the new token. \n\
        \ "]
  tls_inspection_configuration : tls_inspection_configuration option;
      [@ocaml.doc
        "The object that defines a TLS inspection configuration. This, along with \
         [TLSInspectionConfigurationResponse], define the TLS inspection configuration. You can \
         retrieve all objects for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration]. \n\n\
        \ Network Firewall uses a TLS inspection configuration to decrypt traffic. Network \
         Firewall re-encrypts the traffic before sending it to its destination.\n\
        \ \n\
        \  To use a TLS inspection configuration, you add it to a new Network Firewall firewall \
         policy, then you apply the firewall policy to a firewall. Network Firewall acts as a \
         proxy service to decrypt and inspect the traffic traveling through your firewalls. You \
         can reference a TLS inspection configuration from more than one firewall policy, and you \
         can use a firewall policy in more than one firewall. For more information about using TLS \
         inspection configurations, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html}Inspecting \
         SSL/TLS traffic with TLS inspection configurations} in the {i Network Firewall Developer \
         Guide}.\n\
        \  "]
  tls_inspection_configuration_response : tls_inspection_configuration_response;
      [@ocaml.doc
        "The high-level properties of a TLS inspection configuration. This, along with the \
         [TLSInspectionConfiguration], define the TLS inspection configuration. You can retrieve \
         all objects for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration]. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_tls_inspection_configuration_request = {
  tls_inspection_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the TLS inspection configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  tls_inspection_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the TLS inspection configuration. You can't change the name of a \
         TLS inspection configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_vpc_endpoint_association_response = {
  vpc_endpoint_association : vpc_endpoint_association option;
      [@ocaml.doc
        "The configuration settings for the VPC endpoint association. These settings include the \
         firewall and the VPC and subnet to use for the firewall endpoint. \n"]
  vpc_endpoint_association_status : vpc_endpoint_association_status option;
      [@ocaml.doc
        "Detailed information about the current status of a [VpcEndpointAssociation]. You can \
         retrieve this by calling [DescribeVpcEndpointAssociation] and providing the VPC endpoint \
         association ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_vpc_endpoint_association_request = {
  vpc_endpoint_association_arn : resource_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_rule_groups_from_proxy_configuration_response = {
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc
        "The updated proxy configuration resource that reflects the updates from the request.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec detach_rule_groups_from_proxy_configuration_request = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_names : resource_name_list option;
      [@ocaml.doc "The proxy rule group names to detach from the proxy configuration\n"]
  rule_group_arns : resource_arn_list option;
      [@ocaml.doc "The proxy rule group arns to detach from the proxy configuration\n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec disassociate_availability_zones_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  availability_zone_mappings : availability_zone_mappings option;
      [@ocaml.doc
        "The remaining Availability Zones where the firewall has endpoints after the disassociation.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec disassociate_availability_zones_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  availability_zone_mappings : availability_zone_mappings;
      [@ocaml.doc "Required. The Availability Zones to remove from the firewall's configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_subnets_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  subnet_mappings : subnet_mappings option;
      [@ocaml.doc "The IDs of the subnets that are associated with the firewall. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec disassociate_subnets_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  subnet_ids : az_subnets;
      [@ocaml.doc "The unique identifiers for the subnets that you want to disassociate. \n"]
}
[@@ocaml.doc ""]

type nonrec end_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec firewall_metadata = {
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  transit_gateway_attachment_id : transit_gateway_attachment_id option;
      [@ocaml.doc
        "The unique identifier of the transit gateway attachment associated with this firewall. \
         This field is only present for transit gateway-attached firewalls.\n"]
}
[@@ocaml.doc
  "High-level information about a firewall, returned by operations like create and describe. You \
   can use the information provided in the metadata to retrieve and manage a firewall.\n"]

type nonrec firewall_policy_metadata = {
  name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall policy. You can't change the name of a firewall \
         policy after you create it.\n"]
  arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall policy.\n"]
}
[@@ocaml.doc
  "High-level information about a firewall policy, returned by operations like create and \
   describe. You can use the information provided in the metadata to retrieve and manage a \
   firewall policy. You can retrieve all objects for a firewall policy by calling \
   [DescribeFirewallPolicy]. \n"]

type nonrec firewall_policies = firewall_policy_metadata list [@@ocaml.doc ""]

type nonrec firewalls = firewall_metadata list [@@ocaml.doc ""]

type nonrec packet_count = int [@@ocaml.doc ""]

type nonrec flow = {
  source_address : address option; [@ocaml.doc ""]
  destination_address : address option; [@ocaml.doc ""]
  source_port : port option;
      [@ocaml.doc
        "The source port to inspect for. You can specify an individual port, for example [1994] \
         and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n"]
  destination_port : port option;
      [@ocaml.doc
        "The destination port to inspect for. You can specify an individual port, for example \
         [1994] and you can specify a port range, for example [1990:1994]. To match with any port, \
         specify [ANY].\n"]
  protocol : protocol_string option;
      [@ocaml.doc
        "The protocols to inspect for, specified using the assigned internet protocol number \
         (IANA) for each protocol. If not specified, this matches with any protocol.\n"]
  age : age option;
      [@ocaml.doc "Returned as info about age of the flows identified by the flow operation.\n"]
  packet_count : packet_count option;
      [@ocaml.doc "Returns the total number of data packets received or transmitted in a flow.\n"]
  byte_count : byte_count option;
      [@ocaml.doc "Returns the number of bytes received or transmitted in a specific flow.\n"]
}
[@@ocaml.doc
  "Any number of arrays, where each array is a single flow identified in the scope of the \
   operation. If multiple flows were in the scope of the operation, multiple [Flows] arrays are \
   returned.\n"]

type nonrec flow_operation_metadata = {
  flow_operation_id : flow_operation_id option;
      [@ocaml.doc
        "A unique identifier for the flow operation. This ID is returned in the responses to start \
         and list commands. You provide to describe commands.\n"]
  flow_operation_type : flow_operation_type option;
      [@ocaml.doc "Defines the type of [FlowOperation].\n"]
  flow_request_timestamp : flow_request_timestamp option;
      [@ocaml.doc
        "A timestamp indicating when the Suricata engine identified flows impacted by an operation. \n"]
  flow_operation_status : flow_operation_status option;
      [@ocaml.doc
        "Returns the status of the flow operation. This string is returned in the responses to \
         start, list, and describe commands.\n\n\
        \ If the status is [COMPLETED_WITH_ERRORS], results may be returned with any number of \
         [Flows] missing from the response. If the status is [FAILED], [Flows] returned will be \
         empty.\n\
        \ "]
}
[@@ocaml.doc "An array of objects with metadata about the requested [FlowOperation].\n"]

type nonrec flow_operations = flow_operation_metadata list [@@ocaml.doc ""]

type nonrec flows = flow list [@@ocaml.doc ""]

type nonrec start_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec get_analysis_report_results_response = {
  status : status option;
      [@ocaml.doc
        "The status of the analysis report you specify. Statuses include [RUNNING], [COMPLETED], \
         or [FAILED].\n"]
  start_time : start_time option;
      [@ocaml.doc
        " The date and time within the last 30 days from which to start retrieving analysis data, \
         in UTC format (for example, [YYYY-MM-DDTHH:MM:SSZ]. \n"]
  end_time : end_time option;
      [@ocaml.doc
        "The date and time, up to the current date, from which to stop retrieving analysis data, \
         in UTC format (for example, [YYYY-MM-DDTHH:MM:SSZ]). \n"]
  report_time : report_time option; [@ocaml.doc "The date and time the analysis report was ran. \n"]
  analysis_type : enabled_analysis_type option;
      [@ocaml.doc "The type of traffic that will be used to generate a report. \n"]
  next_token : analysis_report_next_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  analysis_report_results : analysis_report_results option;
      [@ocaml.doc "Retrieves the results of a traffic analysis report.\n"]
}
[@@ocaml.doc ""]

type nonrec pagination_max_results = int [@@ocaml.doc ""]

type nonrec get_analysis_report_results_request = {
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  analysis_report_id : analysis_report_id;
      [@ocaml.doc "The unique ID of the query that ran when you requested an analysis report. \n"]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  next_token : analysis_report_next_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec list_analysis_reports_response = {
  analysis_reports : analysis_reports option;
      [@ocaml.doc
        "The [id] and [ReportTime] associated with a requested analysis report. Does not provide \
         the status of the analysis report. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_analysis_reports_request = {
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_associations_response = {
  container_associations : container_associations option;
      [@ocaml.doc "The container association metadata objects.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_associations_request = {
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_policies_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  firewall_policies : firewall_policies option;
      [@ocaml.doc
        "The metadata for the firewall policies. Depending on your setting for max results and the \
         number of firewall policies that you have, this might not be the full list. \n"]
}
[@@ocaml.doc ""]

type nonrec list_firewall_policies_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_firewalls_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  firewalls : firewalls option;
      [@ocaml.doc
        "The firewall metadata objects for the VPCs that you specified. Depending on your setting \
         for max results and the number of firewalls you have, a single call might not be the full \
         list. \n"]
}
[@@ocaml.doc ""]

type nonrec vpc_ids = vpc_id list [@@ocaml.doc ""]

type nonrec list_firewalls_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  vpc_ids : vpc_ids option;
      [@ocaml.doc
        "The unique identifiers of the VPCs that you want Network Firewall to retrieve the \
         firewalls for. Leave this blank to retrieve all firewalls that you have defined.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_flow_operation_results_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall is located. For example, [us-east-2a].\n\n\
        \ Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n\
        \ "]
  vpc_endpoint_association_arn : resource_arn option; [@ocaml.doc "\n"]
  vpc_endpoint_id : vpc_endpoint_id option; [@ocaml.doc "\n"]
  flow_operation_id : flow_operation_id option;
      [@ocaml.doc
        "A unique identifier for the flow operation. This ID is returned in the responses to start \
         and list commands. You provide to describe commands.\n"]
  flow_operation_status : flow_operation_status option;
      [@ocaml.doc
        "Returns the status of the flow operation. This string is returned in the responses to \
         start, list, and describe commands.\n\n\
        \ If the status is [COMPLETED_WITH_ERRORS], results may be returned with any number of \
         [Flows] missing from the response. If the status is [FAILED], [Flows] returned will be \
         empty.\n\
        \ "]
  status_message : status_reason option;
      [@ocaml.doc
        "If the asynchronous operation fails, Network Firewall populates this with the reason for \
         the error or failure. Options include [Flow operation error] and [Flow timeout].\n"]
  flow_request_timestamp : flow_request_timestamp option;
      [@ocaml.doc
        "A timestamp indicating when the Suricata engine identified flows impacted by an operation. \n"]
  flows : flows option;
      [@ocaml.doc
        "Any number of arrays, where each array is a single flow identified in the scope of the \
         operation. If multiple flows were in the scope of the operation, multiple [Flows] arrays \
         are returned.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_flow_operation_results_request = {
  firewall_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  flow_operation_id : flow_operation_id;
      [@ocaml.doc
        "A unique identifier for the flow operation. This ID is returned in the responses to start \
         and list commands. You provide to describe commands.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall is located. For example, [us-east-2a].\n\n\
        \ Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n\
        \ "]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "A unique identifier for the primary endpoint associated with a firewall.\n"]
  vpc_endpoint_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
}
[@@ocaml.doc ""]

type nonrec list_flow_operations_response = {
  flow_operations : flow_operations option;
      [@ocaml.doc
        "Flow operations let you manage the flows tracked in the flow table, also known as the \
         firewall table.\n\n\
        \ A flow is network traffic that is monitored by a firewall, either by stateful or \
         stateless rules. For traffic to be considered part of a flow, it must share Destination, \
         DestinationPort, Direction, Protocol, Source, and SourcePort. \n\
        \ "]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_flow_operations_request = {
  firewall_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall is located. For example, [us-east-2a].\n\n\
        \ Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n\
        \ "]
  vpc_endpoint_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "A unique identifier for the primary endpoint associated with a firewall.\n"]
  flow_operation_type : flow_operation_type option;
      [@ocaml.doc
        "An optional string that defines whether any or all operation types are returned.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec proxy_metadata = {
  name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n"]
  arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy.\n"]
}
[@@ocaml.doc
  "High-level information about a proxy, returned by operations like create and describe. You can \
   use the information provided in the metadata to retrieve and manage a proxy. You can retrieve \
   all objects for a proxy by calling [DescribeProxy]. \n"]

type nonrec proxies = proxy_metadata list [@@ocaml.doc ""]

type nonrec list_proxies_response = {
  proxies : proxies option;
      [@ocaml.doc
        "The metadata for the proxies. Depending on your setting for max results and the number of \
         proxies that you have, this might not be the full list. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_proxies_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec proxy_configuration_metadata = {
  name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n"]
  arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy configuration.\n"]
}
[@@ocaml.doc
  "High-level information about a proxy configuration, returned by operations like create and \
   describe. You can use the information provided in the metadata to retrieve and manage a proxy \
   configuration. You can retrieve all objects for a proxy configuration by calling \
   [DescribeProxyConfiguration]. \n"]

type nonrec proxy_configurations = proxy_configuration_metadata list [@@ocaml.doc ""]

type nonrec list_proxy_configurations_response = {
  proxy_configurations : proxy_configurations option;
      [@ocaml.doc
        "The metadata for the proxy configurations. Depending on your setting for max results and \
         the number of proxy configurations that you have, this might not be the full list. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_proxy_configurations_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec proxy_rule_group_metadata = {
  name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy rule group.\n"]
}
[@@ocaml.doc
  "High-level information about a proxy rule group, returned by operations like create and \
   describe. You can use the information provided in the metadata to retrieve and manage a proxy \
   rule group. You can retrieve all objects for a proxy rule group by calling \
   [DescribeProxyRuleGroup]. \n"]

type nonrec proxy_rule_groups = proxy_rule_group_metadata list [@@ocaml.doc ""]

type nonrec list_proxy_rule_groups_response = {
  proxy_rule_groups : proxy_rule_groups option;
      [@ocaml.doc
        "The metadata for the proxy rule groups. Depending on your setting for max results and the \
         number of proxy rule groups that you have, this might not be the full list. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_proxy_rule_groups_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_group_metadata = {
  name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n"]
  arn : resource_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the rule group.\n"]
  vendor_name : vendor_name option;
      [@ocaml.doc
        "The name of the Amazon Web Services Marketplace seller that provides this rule group.\n"]
}
[@@ocaml.doc
  "High-level information about a rule group, returned by [ListRuleGroups]. You can use the \
   information provided in the metadata to retrieve and manage a rule group.\n"]

type nonrec rule_groups = rule_group_metadata list [@@ocaml.doc ""]

type nonrec list_rule_groups_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  rule_groups : rule_groups option;
      [@ocaml.doc
        "The rule group metadata objects that you've defined. Depending on your setting for max \
         results and the number of rule groups, this might not be the full list. \n"]
}
[@@ocaml.doc ""]

type nonrec subscription_status = NOT_SUBSCRIBED [@ocaml.doc ""] | SUBSCRIBED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_managed_type =
  | AWS_MANAGED_THREAT_SIGNATURES [@ocaml.doc ""]
  | AWS_MANAGED_DOMAIN_LISTS [@ocaml.doc ""]
  | ACTIVE_THREAT_DEFENSE [@ocaml.doc ""]
  | PARTNER_MANAGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_managed_status = MANAGED [@ocaml.doc ""] | ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_rule_groups_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
  scope : resource_managed_status option;
      [@ocaml.doc
        "The scope of the request. The default setting of [ACCOUNT] or a setting of [NULL] returns \
         all of the rule groups in your account. A setting of [MANAGED] returns all available \
         managed rule groups.\n"]
  managed_type : resource_managed_type option;
      [@ocaml.doc "Indicates the general category of the Amazon Web Services managed rule group.\n"]
  subscription_status : subscription_status option;
      [@ocaml.doc
        "Filters the results to show only rule groups with the specified subscription status. Use \
         this to find subscribed or unsubscribed rule groups.\n"]
  type_ : rule_group_type option;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules.\n"]
}
[@@ocaml.doc ""]

type nonrec tls_inspection_configuration_metadata = {
  name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the TLS inspection configuration. You can't change the name of a \
         TLS inspection configuration after you create it.\n"]
  arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the TLS inspection configuration.\n"]
}
[@@ocaml.doc
  "High-level information about a TLS inspection configuration, returned by \
   [ListTLSInspectionConfigurations]. You can use the information provided in the metadata to \
   retrieve and manage a TLS configuration.\n"]

type nonrec tls_inspection_configurations = tls_inspection_configuration_metadata list
[@@ocaml.doc ""]

type nonrec list_tls_inspection_configurations_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  tls_inspection_configurations : tls_inspection_configurations option;
      [@ocaml.doc
        "The TLS inspection configuration metadata objects that you've defined. Depending on your \
         setting for max results and the number of TLS inspection configurations, this might not \
         be the full list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tls_inspection_configurations_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  tags : tag_list option; [@ocaml.doc "The tags that are associated with the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec tags_pagination_max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : tags_pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
  resource_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint_association_metadata = {
  vpc_endpoint_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
}
[@@ocaml.doc
  "High-level information about a VPC endpoint association, returned by \
   [ListVpcEndpointAssociations]. You can use the information provided in the metadata to retrieve \
   and manage a VPC endpoint association.\n"]

type nonrec vpc_endpoint_associations = vpc_endpoint_association_metadata list [@@ocaml.doc ""]

type nonrec list_vpc_endpoint_associations_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  vpc_endpoint_associations : vpc_endpoint_associations option;
      [@ocaml.doc
        "The VPC endpoint assocation metadata objects for the firewall that you specified. If you \
         didn't specify a firewall, this is all VPC endpoint associations that you have defined. \n\n\
        \ Depending on your setting for max results and the number of firewalls you have, a single \
         call might not be the full list. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec list_vpc_endpoint_associations_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "When you request a list of objects with a [MaxResults] setting, if the number of objects \
         that are still available for retrieval exceeds the maximum you requested, Network \
         Firewall returns a [NextToken] value in the response. To retrieve the next batch of \
         objects, use the token returned from the prior request in your next request.\n"]
  max_results : pagination_max_results option;
      [@ocaml.doc
        "The maximum number of objects that you want Network Firewall to return for this request. \
         If more objects are available, in the response, Network Firewall provides a [NextToken] \
         value that you can use in a subsequent call to get the next batch of objects.\n"]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ If you don't specify this, Network Firewall retrieves all VPC endpoint associations that \
         you have defined.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec log_destination_permission_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Unable to send logs to a configured logging destination. \n"]

type nonrec update_tls_inspection_configuration_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the TLS inspection configuration. The token marks the state of the TLS \
         inspection configuration resource at the time of the request. \n\n\
        \ To make changes to the TLS inspection configuration, you provide the token in your \
         request. Network Firewall uses the token to ensure that the TLS inspection configuration \
         hasn't changed since you last retrieved it. If it has changed, the operation fails with \
         an [InvalidTokenException]. If this happens, retrieve the TLS inspection configuration \
         again to get a current copy of it with a current token. Reapply your changes as needed, \
         then try the operation again using the new token. \n\
        \ "]
  tls_inspection_configuration_response : tls_inspection_configuration_response;
      [@ocaml.doc
        "The high-level properties of a TLS inspection configuration. This, along with the \
         [TLSInspectionConfiguration], define the TLS inspection configuration. You can retrieve \
         all objects for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration]. \n"]
}
[@@ocaml.doc ""]

type nonrec update_tls_inspection_configuration_request = {
  tls_inspection_configuration_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the TLS inspection configuration.\n"]
  tls_inspection_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the TLS inspection configuration. You can't change the name of a \
         TLS inspection configuration after you create it.\n"]
  tls_inspection_configuration : tls_inspection_configuration;
      [@ocaml.doc
        "The object that defines a TLS inspection configuration. This, along with \
         [TLSInspectionConfigurationResponse], define the TLS inspection configuration. You can \
         retrieve all objects for a TLS inspection configuration by calling \
         [DescribeTLSInspectionConfiguration]. \n\n\
        \ Network Firewall uses a TLS inspection configuration to decrypt traffic. Network \
         Firewall re-encrypts the traffic before sending it to its destination.\n\
        \ \n\
        \  To use a TLS inspection configuration, you add it to a new Network Firewall firewall \
         policy, then you apply the firewall policy to a firewall. Network Firewall acts as a \
         proxy service to decrypt and inspect the traffic traveling through your firewalls. You \
         can reference a TLS inspection configuration from more than one firewall policy, and you \
         can use a firewall policy in more than one firewall. For more information about using TLS \
         inspection configurations, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/tls-inspection.html}Inspecting \
         SSL/TLS traffic with TLS inspection configurations} in the {i Network Firewall Developer \
         Guide}.\n\
        \  "]
  description : description option;
      [@ocaml.doc "A description of the TLS inspection configuration. \n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains the Amazon Web Services KMS encryption configuration \
         settings for your TLS inspection configuration.\n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the TLS inspection configuration. The token marks the state of the TLS \
         inspection configuration resource at the time of the request. \n\n\
        \ To make changes to the TLS inspection configuration, you provide the token in your \
         request. Network Firewall uses the token to ensure that the TLS inspection configuration \
         hasn't changed since you last retrieved it. If it has changed, the operation fails with \
         an [InvalidTokenException]. If this happens, retrieve the TLS inspection configuration \
         again to get a current copy of it with a current token. Reapply your changes as needed, \
         then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec resource_owner_check_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Unable to change the resource because your account doesn't own it. \n"]

type nonrec update_subnet_change_protection_response = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  subnet_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against changes to the subnet \
         associations. Use this setting to protect against accidentally modifying the subnet \
         associations for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
}
[@@ocaml.doc ""]

type nonrec update_subnet_change_protection_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  subnet_change_protection : boolean_;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against changes to the subnet \
         associations. Use this setting to protect against accidentally modifying the subnet \
         associations for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
}
[@@ocaml.doc ""]

type nonrec update_rule_group_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the rule group. The token marks the state of the rule group resource at the \
         time of the request. \n\n\
        \ To make changes to the rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the rule group again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  rule_group_response : rule_group_response;
      [@ocaml.doc
        "The high-level properties of a rule group. This, along with the [RuleGroup], define the \
         rule group. You can retrieve all objects for a rule group by calling [DescribeRuleGroup]. \n"]
}
[@@ocaml.doc ""]

type nonrec update_rule_group_request = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the rule group. The token marks the state of the rule group resource at the \
         time of the request. \n\n\
        \ To make changes to the rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the rule group again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the rule group. You can't change the name of a rule group after \
         you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group : rule_group option;
      [@ocaml.doc
        "An object that defines the rule group rules. \n\n\
        \  You must provide either this rule group setting or a [Rules] setting, but not both. \n\
        \  \n\
        \   "]
  rules : rules_string option;
      [@ocaml.doc
        "A string containing stateful rule group rules specifications in Suricata flat format, \
         with one rule per line. Use this to import your existing Suricata compatible rule groups. \
         \n\n\
        \  You must provide either this rules setting or a populated [RuleGroup] setting, but not \
         both. \n\
        \  \n\
        \    You can provide your rule group specification in Suricata flat format through this \
         setting when you create or update your rule group. The call response returns a \
         [RuleGroup] object that Network Firewall has populated from your string. \n\
        \    "]
  type_ : rule_group_type option;
      [@ocaml.doc
        "Indicates whether the rule group is stateless or stateful. If the rule group is \
         stateless, it contains stateless rules. If it is stateful, it contains stateful rules. \n\n\
        \  This setting is required for requests that do not include the [RuleGroupARN].\n\
        \  \n\
        \   "]
  description : description option; [@ocaml.doc "A description of the rule group. \n"]
  dry_run : boolean_ option;
      [@ocaml.doc
        "Indicates whether you want Network Firewall to just check the validity of the request, \
         rather than run the request. \n\n\
        \ If set to [TRUE], Network Firewall checks whether the request can run successfully, but \
         doesn't actually make the requested changes. The call returns the value that the request \
         would return if you ran it with dry run set to [FALSE], but doesn't make additions or \
         changes to your resources. This option allows you to make sure that you have the required \
         permissions to run the request and that your request parameters are valid. \n\
        \ \n\
        \  If set to [FALSE], Network Firewall makes the requested changes to your resources. \n\
        \  "]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains settings for encryption of your rule group resources.\n"]
  source_metadata : source_metadata option;
      [@ocaml.doc
        "A complex type that contains metadata about the rule group that your own rule group is \
         copied from. You can use the metadata to keep track of updates made to the originating \
         rule group.\n"]
  analyze_rule_group : boolean_ option;
      [@ocaml.doc
        "Indicates whether you want Network Firewall to analyze the stateless rules in the rule \
         group for rule behavior such as asymmetric routing. If set to [TRUE], Network Firewall \
         runs the analysis and then updates the rule group for you. To run the stateless rule \
         group analyzer without updating the rule group, set [DryRun] to [TRUE]. \n"]
  summary_configuration : summary_configuration option;
      [@ocaml.doc
        "Updates the selected summary configuration for a rule group.\n\n\
        \ Changes affect subsequent responses from [DescribeRuleGroupSummary].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec proxy_rule_priority = {
  proxy_rule_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule. You can't change the name of a proxy rule after \
         you create it.\n"]
  new_position : insert_position option;
      [@ocaml.doc "Where to move a proxy rule in a proxy rule group. \n"]
}
[@@ocaml.doc "Proxy rule name and new desired position. \n"]

type nonrec proxy_rule_priority_list = proxy_rule_priority list [@@ocaml.doc ""]

type nonrec rule_group_request_phase =
  | PRE_DNS [@ocaml.doc ""]
  | PRE_REQ [@ocaml.doc ""]
  | POST_RES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_proxy_rule_priorities_response = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a proxy rule group.\n"]
  rule_group_request_phase : rule_group_request_phase option;
      [@ocaml.doc
        "Evaluation points in the traffic flow where rules are applied. There are three phases in \
         a traffic where the rule match is applied. \n"]
  rules : proxy_rule_priority_list option;
      [@ocaml.doc "The updated proxy rule hierarchy that reflects the updates from the request.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule group. The token marks the state of the proxy rule group \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule group again to get a current copy of it with a \
         current token. Reapply your changes as needed, then try the operation again using the new \
         token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_proxy_rule_priorities_request = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_group_request_phase : rule_group_request_phase;
      [@ocaml.doc
        "Evaluation points in the traffic flow where rules are applied. There are three phases in \
         a traffic where the rule match is applied. \n"]
  rules : proxy_rule_priority_list;
      [@ocaml.doc "proxy rule resources to update to new positions. \n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule group. The token marks the state of the proxy rule group \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy rule group, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule group hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule group again to get a current copy of it with a \
         current token. Reapply your changes as needed, then try the operation again using the new \
         token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec proxy_rule_group_priority_result_priority = int [@@ocaml.doc ""]

type nonrec proxy_rule_group_priority_result = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  priority : proxy_rule_group_priority_result_priority option;
      [@ocaml.doc "Priority of the proxy rule group in the proxy configuration. \n"]
}
[@@ocaml.doc "Proxy rule group along with its priority. \n"]

type nonrec proxy_rule_group_priority_result_list = proxy_rule_group_priority_result list
[@@ocaml.doc ""]

type nonrec update_proxy_rule_group_priorities_response = {
  proxy_rule_groups : proxy_rule_group_priority_result_list option;
      [@ocaml.doc
        "The updated proxy rule group hierarchy that reflects the updates from the request.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec proxy_rule_group_priority = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n"]
  new_position : insert_position option;
      [@ocaml.doc "Where to move a proxy rule group in a proxy configuration. \n"]
}
[@@ocaml.doc "Proxy rule group name and new desired position. \n"]

type nonrec proxy_rule_group_priority_list = proxy_rule_group_priority list [@@ocaml.doc ""]

type nonrec update_proxy_rule_group_priorities_request = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  rule_groups : proxy_rule_group_priority_list;
      [@ocaml.doc "proxy rule group resources to update to new positions. \n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_proxy_rule_response = {
  proxy_rule : proxy_rule option;
      [@ocaml.doc "The updated proxy rule resource that reflects the updates from the request.\n"]
  removed_conditions : proxy_rule_condition_list option;
      [@ocaml.doc "Proxy rule conditions removed from the rule. \n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule. The token marks the state of the proxy rule resource at the \
         time of the request. \n\n\
        \ To make changes to the proxy rule, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_proxy_rule_request = {
  proxy_rule_group_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy rule group. You can't change the name of a proxy rule \
         group after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_group_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy rule group.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_rule_name : resource_name;
      [@ocaml.doc
        "The descriptive name of the proxy rule. You can't change the name of a proxy rule after \
         you create it.\n"]
  description : description option; [@ocaml.doc "A description of the proxy rule. \n"]
  action : proxy_rule_phase_action option;
      [@ocaml.doc
        "Depending on the match action, the proxy either stops the evaluation (if the action is \
         terminal - allow or deny), or continues it (if the action is alert) until it matches a \
         rule with a terminal action. \n"]
  add_conditions : proxy_rule_condition_list option;
      [@ocaml.doc
        "Proxy rule conditions to add. Match criteria that specify what traffic attributes to \
         examine. Conditions include operators (StringEquals, StringLike) and values to match \
         against. \n"]
  remove_conditions : proxy_rule_condition_list option;
      [@ocaml.doc
        "Proxy rule conditions to remove. Match criteria that specify what traffic attributes to \
         examine. Conditions include operators (StringEquals, StringLike) and values to match \
         against. \n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy rule. The token marks the state of the proxy rule resource at the \
         time of the request. \n\n\
        \ To make changes to the proxy rule, you provide the token in your request. Network \
         Firewall uses the token to ensure that the proxy rule hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the proxy rule again to get a current copy of it with a current \
         token. Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_proxy_configuration_response = {
  proxy_configuration : proxy_configuration option;
      [@ocaml.doc
        "The updated proxy configuration resource that reflects the updates from the request.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_proxy_configuration_request = {
  proxy_configuration_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy configuration. You can't change the name of a proxy \
         configuration after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_configuration_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy configuration.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  default_rule_phase_actions : proxy_config_default_rule_phase_actions_request;
      [@ocaml.doc
        "Evaluation points in the traffic flow where rules are applied. There are three phases in \
         a traffic where the rule match is applied. \n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy configuration. The token marks the state of the proxy configuration \
         resource at the time of the request. \n\n\
        \ To make changes to the proxy configuration, you provide the token in your request. \
         Network Firewall uses the token to ensure that the proxy configuration hasn't changed \
         since you last retrieved it. If it has changed, the operation fails with an \
         [InvalidTokenException]. If this happens, retrieve the proxy configuration again to get a \
         current copy of it with a current token. Reapply your changes as needed, then try the \
         operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_proxy_response = {
  proxy : proxy option;
      [@ocaml.doc "The updated proxy resource that reflects the updates from the request.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy. The token marks the state of the proxy resource at the time of the \
         request. \n\n\
        \ To make changes to the proxy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the proxy hasn't changed since you last retrieved it. If it \
         has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the proxy again to get a current copy of it with a current token. Reapply your \
         changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_proxy_request = {
  nat_gateway_id : nat_gateway_id; [@ocaml.doc "The NAT Gateway the proxy is attached to. \n"]
  proxy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the proxy. You can't change the name of a proxy after you create \
         it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  proxy_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a proxy.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  listener_properties_to_add : listener_properties_request option;
      [@ocaml.doc "Listener properties for HTTP and HTTPS traffic to add. \n"]
  listener_properties_to_remove : listener_properties_request option;
      [@ocaml.doc "Listener properties for HTTP and HTTPS traffic to remove. \n"]
  tls_intercept_properties : tls_intercept_properties_request option;
      [@ocaml.doc "TLS decryption on traffic to filter on attributes in the HTTP header. \n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the proxy. The token marks the state of the proxy resource at the time of the \
         request. \n\n\
        \ To make changes to the proxy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the proxy hasn't changed since you last retrieved it. If it \
         has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the proxy again to get a current copy of it with a current token. Reapply your \
         changes as needed, then try the operation again using the new token. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_logging_configuration_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  logging_configuration : logging_configuration option; [@ocaml.doc ""]
  enable_monitoring_dashboard : enable_monitoring_dashboard option;
      [@ocaml.doc
        "A boolean that reflects whether or not the firewall monitoring dashboard is enabled on a \
         firewall.\n\n\
        \  Returns [TRUE] when the firewall monitoring dashboard is enabled on the firewall. \
         Returns [FALSE] when the firewall monitoring dashboard is not enabled on the firewall. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_logging_configuration_request = {
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  logging_configuration : logging_configuration option;
      [@ocaml.doc
        "Defines how Network Firewall performs logging for a firewall. If you omit this setting, \
         Network Firewall disables logging for the firewall.\n"]
  enable_monitoring_dashboard : enable_monitoring_dashboard option;
      [@ocaml.doc
        "A boolean that lets you enable or disable the detailed firewall monitoring dashboard on \
         the firewall. \n\n\
        \ The monitoring dashboard provides comprehensive visibility into your firewall's flow \
         logs and alert logs. After you enable detailed monitoring, you can access these \
         dashboards directly from the {b Monitoring} page of the Network Firewall console.\n\
        \ \n\
        \   Specify [TRUE] to enable the the detailed monitoring dashboard on the firewall. \
         Specify [FALSE] to disable the the detailed monitoring dashboard on the firewall. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_firewall_policy_change_protection_response = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  firewall_policy_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against a change to the firewall \
         policy association. Use this setting to protect against accidentally modifying the \
         firewall policy for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_policy_change_protection_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_policy_change_protection : boolean_;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against a change to the firewall \
         policy association. Use this setting to protect against accidentally modifying the \
         firewall policy for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_policy_response = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the firewall policy. The token marks the state of the policy resource at the \
         time of the request. \n\n\
        \ To make changes to the policy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the policy hasn't changed since you last retrieved it. If \
         it has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the firewall policy again to get a current copy of it with current token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  firewall_policy_response : firewall_policy_response;
      [@ocaml.doc
        "The high-level properties of a firewall policy. This, along with the [FirewallPolicy], \
         define the policy. You can retrieve all objects for a firewall policy by calling \
         [DescribeFirewallPolicy]. \n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_policy_request = {
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the firewall policy. The token marks the state of the policy resource at the \
         time of the request. \n\n\
        \ To make changes to the policy, you provide the token in your request. Network Firewall \
         uses the token to ensure that the policy hasn't changed since you last retrieved it. If \
         it has changed, the operation fails with an [InvalidTokenException]. If this happens, \
         retrieve the firewall policy again to get a current copy of it with current token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \ "]
  firewall_policy_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall policy.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_policy_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall policy. You can't change the name of a firewall \
         policy after you create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_policy : firewall_policy;
      [@ocaml.doc
        "The updated firewall policy to use for the firewall. You can't add or remove a \
         [TLSInspectionConfiguration] after you create a firewall policy. However, you can replace \
         an existing TLS inspection configuration with another [TLSInspectionConfiguration].\n"]
  description : description option; [@ocaml.doc "A description of the firewall policy.\n"]
  dry_run : boolean_ option;
      [@ocaml.doc
        "Indicates whether you want Network Firewall to just check the validity of the request, \
         rather than run the request. \n\n\
        \ If set to [TRUE], Network Firewall checks whether the request can run successfully, but \
         doesn't actually make the requested changes. The call returns the value that the request \
         would return if you ran it with dry run set to [FALSE], but doesn't make additions or \
         changes to your resources. This option allows you to make sure that you have the required \
         permissions to run the request and that your request parameters are valid. \n\
        \ \n\
        \  If set to [FALSE], Network Firewall makes the requested changes to your resources. \n\
        \  "]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "A complex type that contains settings for encryption of your firewall policy resources.\n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_encryption_configuration_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  encryption_configuration : encryption_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_firewall_encryption_configuration_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  encryption_configuration : encryption_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_firewall_description_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  description : description option; [@ocaml.doc "A description of the firewall.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_firewall_description_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  description : description option;
      [@ocaml.doc
        "The new description for the firewall. If you omit this setting, Network Firewall removes \
         the description for the firewall.\n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_delete_protection_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  delete_protection : boolean_ option;
      [@ocaml.doc
        "A flag indicating whether it is possible to delete the firewall. A setting of [TRUE] \
         indicates that the firewall is protected against deletion. Use this setting to protect \
         against accidentally deleting a firewall that is in use. When you create a firewall, the \
         operation initializes this flag to [TRUE].\n"]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_firewall_delete_protection_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  delete_protection : boolean_;
      [@ocaml.doc
        "A flag indicating whether it is possible to delete the firewall. A setting of [TRUE] \
         indicates that the firewall is protected against deletion. Use this setting to protect \
         against accidentally deleting a firewall that is in use. When you create a firewall, the \
         operation initializes this flag to [TRUE].\n"]
}
[@@ocaml.doc ""]

type nonrec update_firewall_analysis_settings_response = {
  enabled_analysis_types : enabled_analysis_types option;
      [@ocaml.doc
        "An optional setting indicating the specific traffic analysis types to enable on the \
         firewall. \n"]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_firewall_analysis_settings_request = {
  enabled_analysis_types : enabled_analysis_types option;
      [@ocaml.doc
        "An optional setting indicating the specific traffic analysis types to enable on the \
         firewall. \n"]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_container_association_response = {
  container_association_name : resource_name option;
      [@ocaml.doc "The descriptive name of the container association.\n"]
  container_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the container association.\n"]
  description : description option; [@ocaml.doc "A description of the container association.\n"]
  type_ : container_monitoring_type option;
      [@ocaml.doc "The type of container orchestration platform. Either [ECS] or [EKS].\n"]
  container_monitoring_configurations : container_monitoring_configurations option;
      [@ocaml.doc "The container monitoring configurations for this container association.\n"]
  status : container_association_status option;
      [@ocaml.doc "The current status of the container association.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs associated with the resource.\n"]
  update_token : update_token option;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the container association. The token marks the state of the container \
         association resource at the time of the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_container_association_request = {
  container_association_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the container association. You must specify the ARN or the name, \
         and you can specify both.\n"]
  container_association_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the container association. You must specify the ARN or \
         the name, and you can specify both.\n"]
  description : description option; [@ocaml.doc "A description of the container association.\n"]
  type_ : container_monitoring_type;
      [@ocaml.doc
        "The type of container orchestration platform. This must match the type specified when the \
         container association was created.\n"]
  container_monitoring_configurations : container_monitoring_configurations;
      [@ocaml.doc
        "The updated list of container monitoring configurations that define which clusters and \
         container attributes to monitor.\n"]
  tags : tag_list option; [@ocaml.doc "The key:value pairs associated with the resource.\n"]
  update_token : update_token;
      [@ocaml.doc
        "A token used for optimistic locking. Network Firewall returns a token to your requests \
         that access the container association. The token marks the state of the container \
         association resource at the time of the request. To make an update to the container \
         association, provide the token in your request. Network Firewall uses the token to ensure \
         that the container association hasn't changed since you last retrieved it. If it has \
         changed, the operation fails with an [InvalidTokenException]. If this happens, retrieve \
         the container association again to get a current copy of it with a new token. Reapply \
         your changes as needed, then try the operation again using the new token.\n"]
}
[@@ocaml.doc ""]

type nonrec update_availability_zone_change_protection_response = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n"]
  availability_zone_change_protection : boolean_ option;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against changes to the subnet \
         associations. Use this setting to protect against accidentally modifying the subnet \
         associations for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
}
[@@ocaml.doc ""]

type nonrec update_availability_zone_change_protection_request = {
  update_token : update_token option;
      [@ocaml.doc
        "An optional token that you can use for optimistic locking. Network Firewall returns a \
         token to your requests that access the firewall. The token marks the state of the \
         firewall resource at the time of the request. \n\n\
        \ To make an unconditional change to the firewall, omit the token in your update request. \
         Without the token, Network Firewall performs your updates regardless of whether the \
         firewall has changed since you last retrieved it.\n\
        \ \n\
        \  To make a conditional change to the firewall, provide the token in your update request. \
         Network Firewall uses the token to ensure that the firewall hasn't changed since you last \
         retrieved it. If it has changed, the operation fails with an [InvalidTokenException]. If \
         this happens, retrieve the firewall again to get a current copy of it with a new token. \
         Reapply your changes as needed, then try the operation again using the new token. \n\
        \  "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  availability_zone_change_protection : boolean_;
      [@ocaml.doc
        "A setting indicating whether the firewall is protected against changes to the subnet \
         associations. Use this setting to protect against accidentally modifying the subnet \
         associations for a firewall that is in use. When you create a firewall, the operation \
         initializes this setting to [TRUE].\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  tags : tag_list; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec start_flow_flush_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  flow_operation_id : flow_operation_id option;
      [@ocaml.doc
        "A unique identifier for the flow operation. This ID is returned in the responses to start \
         and list commands. You provide to describe commands.\n"]
  flow_operation_status : flow_operation_status option;
      [@ocaml.doc
        "Returns the status of the flow operation. This string is returned in the responses to \
         start, list, and describe commands.\n\n\
        \ If the status is [COMPLETED_WITH_ERRORS], results may be returned with any number of \
         [Flows] missing from the response. If the status is [FAILED], [Flows] returned will be \
         empty.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec start_flow_flush_request = {
  firewall_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall is located. For example, [us-east-2a].\n\n\
        \ Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n\
        \ "]
  vpc_endpoint_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "A unique identifier for the primary endpoint associated with a firewall.\n"]
  minimum_flow_age_in_seconds : age option;
      [@ocaml.doc
        "The reqested [FlowOperation] ignores flows with an age (in seconds) lower than \
         [MinimumFlowAgeInSeconds]. You provide this for start commands.\n"]
  flow_filters : flow_filters;
      [@ocaml.doc
        "Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_flow_capture_response = {
  firewall_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  flow_operation_id : flow_operation_id option;
      [@ocaml.doc
        "A unique identifier for the flow operation. This ID is returned in the responses to start \
         and list commands. You provide to describe commands.\n"]
  flow_operation_status : flow_operation_status option;
      [@ocaml.doc
        "Returns the status of the flow operation. This string is returned in the responses to \
         start, list, and describe commands.\n\n\
        \ If the status is [COMPLETED_WITH_ERRORS], results may be returned with any number of \
         [Flows] missing from the response. If the status is [FAILED], [Flows] returned will be \
         empty.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec start_flow_capture_request = {
  firewall_arn : resource_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the firewall.\n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        "The ID of the Availability Zone where the firewall is located. For example, [us-east-2a].\n\n\
        \ Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n\
        \ "]
  vpc_endpoint_association_arn : resource_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a VPC endpoint association.\n"]
  vpc_endpoint_id : vpc_endpoint_id option;
      [@ocaml.doc "A unique identifier for the primary endpoint associated with a firewall.\n"]
  minimum_flow_age_in_seconds : age option;
      [@ocaml.doc
        "The reqested [FlowOperation] ignores flows with an age (in seconds) lower than \
         [MinimumFlowAgeInSeconds]. You provide this for start commands.\n\n\
        \  We recommend setting this value to at least 1 minute (60 seconds) to reduce chance of \
         capturing flows that are not yet established.\n\
        \  \n\
        \   "]
  flow_filters : flow_filters;
      [@ocaml.doc
        "Defines the scope a flow operation. You can use up to 20 filters to configure a single \
         flow operation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_analysis_report_response = {
  analysis_report_id : analysis_report_id;
      [@ocaml.doc "The unique ID of the query that ran when you requested an analysis report. \n"]
}
[@@ocaml.doc ""]

type nonrec start_analysis_report_request = {
  firewall_name : resource_name option;
      [@ocaml.doc
        "The descriptive name of the firewall. You can't change the name of a firewall after you \
         create it.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  firewall_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the firewall.\n\n\
        \ You must specify the ARN or the name, and you can specify both. \n\
        \ "]
  analysis_type : enabled_analysis_type;
      [@ocaml.doc "The type of traffic that will be used to generate a report. \n"]
}
[@@ocaml.doc ""]

type nonrec reject_network_firewall_transit_gateway_attachment_response = {
  transit_gateway_attachment_id : transit_gateway_attachment_id;
      [@ocaml.doc "The unique identifier of the transit gateway attachment that was rejected.\n"]
  transit_gateway_attachment_status : transit_gateway_attachment_status;
      [@ocaml.doc
        "The current status of the transit gateway attachment. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [CREATING] - The attachment is being created\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - The attachment is being deleted\n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The attachment has been deleted\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The attachment creation has failed and cannot be recovered\n\
        \           \n\
        \            }\n\
        \       {-   [ERROR] - The attachment is in an error state that might be recoverable\n\
        \           \n\
        \            }\n\
        \       {-   [READY] - The attachment is active and processing traffic\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_ACCEPTANCE] - The attachment is waiting to be accepted\n\
        \           \n\
        \            }\n\
        \       {-   [REJECTING] - The attachment is in the process of being rejected\n\
        \           \n\
        \            }\n\
        \       {-   [REJECTED] - The attachment has been rejected\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For information about troubleshooting endpoint failures, see \
         {{:https://docs.aws.amazon.com/network-firewall/latest/developerguide/firewall-troubleshooting-endpoint-failures.html}Troubleshooting \
         firewall endpoint failures} in the {i Network Firewall Developer Guide}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec reject_network_firewall_transit_gateway_attachment_request = {
  transit_gateway_attachment_id : transit_gateway_attachment_id;
      [@ocaml.doc
        "Required. The unique identifier of the transit gateway attachment to reject. This ID is \
         returned in the response when creating a transit gateway-attached firewall.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_response = unit [@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the account that you want to share your Network \
         Firewall resources with.\n"]
  policy : policy_string;
      [@ocaml.doc
        "The IAM policy statement that lists the accounts that you want to share your Network \
         Firewall resources with and the operations that you want the accounts to be able to \
         perform. \n\n\
        \ For a rule group resource, you can specify the following operations in the Actions \
         section of the statement:\n\
        \ \n\
        \  {ul\n\
        \        {-  network-firewall:CreateFirewallPolicy\n\
        \            \n\
        \             }\n\
        \        {-  network-firewall:UpdateFirewallPolicy\n\
        \            \n\
        \             }\n\
        \        {-  network-firewall:ListRuleGroups\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For a firewall policy resource, you can specify the following operations in the \
         Actions section of the statement:\n\
        \   \n\
        \    {ul\n\
        \          {-  network-firewall:AssociateFirewallPolicy\n\
        \              \n\
        \               }\n\
        \          {-  network-firewall:ListFirewallPolicies\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   For a firewall resource, you can specify the following operations in the Actions \
         section of the statement:\n\
        \   \n\
        \    {ul\n\
        \          {-  network-firewall:CreateVpcEndpointAssociation\n\
        \              \n\
        \               }\n\
        \          {-  network-firewall:DescribeFirewallMetadata\n\
        \              \n\
        \               }\n\
        \          {-  network-firewall:ListFirewalls\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   In the Resource section of the statement, you specify the ARNs for the Network \
         Firewall resources that you want to share with the account that you specified in [Arn].\n\
        \   "]
}
[@@ocaml.doc ""]
