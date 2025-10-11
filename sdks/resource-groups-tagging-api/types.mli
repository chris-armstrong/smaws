type nonrec status_code = int[@@ocaml.doc ""]
type nonrec error_code =
  | INVALID_PARAMETER_EXCEPTION [@ocaml.doc ""]
  | INTERNAL_SERVICE_EXCEPTION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec error_message = string[@@ocaml.doc ""]
type nonrec failure_info =
  {
  error_message: error_message option
    [@ocaml.doc "The message of the common error.\n"];
  error_code: error_code option
    [@ocaml.doc
      "The code of the common error. Valid values include [InternalServiceException], [InvalidParameterException], and any valid error code returned by the Amazon Web Services service that hosts the resource that you want to tag.\n"];
  status_code: status_code option
    [@ocaml.doc "The HTTP status code of the common error.\n"]}[@@ocaml.doc
                                                                 "Information about the errors that are returned for each failed resource. This information can include [InternalServiceException] and [InvalidParameterException] errors. It can also include any valid error code returned by the Amazon Web Services service that hosts the resource that the ARN key represents.\n\n The following are common error codes that you might receive from other Amazon Web Services services:\n \n  {ul\n        {-   {b InternalServiceException} \226\128\147 This can mean that the Resource Groups Tagging API didn't receive a response from another Amazon Web Services service. It can also mean that the resource type in the request is not supported by the Resource Groups Tagging API. In these cases, it's safe to retry the request and then call {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html}GetResources} to verify the changes.\n            \n             }\n        {-   {b AccessDeniedException} \226\128\147 This can mean that you need permission to call the tagging operations in the Amazon Web Services service that contains the resource. For example, to use the Resource Groups Tagging API to tag a Amazon CloudWatch alarm resource, you need permission to call both {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_TagResources.html} [TagResources] } {i and} {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html} [TagResource] } in the CloudWatch API. \n            \n             }\n        }\n   For more information on errors that are generated from other Amazon Web Services services, see the documentation for that service. \n   "]
type nonrec resource_ar_n = string[@@ocaml.doc ""]
type nonrec failed_resources_map = (resource_ar_n * failure_info) list
[@@ocaml.doc ""]
type nonrec untag_resources_output =
  {
  failed_resources_map: failed_resources_map option
    [@ocaml.doc
      "A map containing a key-value pair for each failed item that couldn't be untagged. The key is the ARN of the failed resource. The value is a [FailureInfo] object that contains an error code, a status code, and an error message. If there are no errors, the [FailedResourcesMap] is empty.\n"]}
[@@ocaml.doc ""]
type nonrec resource_arn_list_for_tag_untag = resource_ar_n list[@@ocaml.doc
                                                                  ""]
type nonrec tag_key = string[@@ocaml.doc ""]
type nonrec tag_key_list_for_untag = tag_key list[@@ocaml.doc ""]
type nonrec untag_resources_input =
  {
  tag_keys: tag_key_list_for_untag
    [@ocaml.doc
      "Specifies a list of tag keys that you want to remove from the specified resources.\n"];
  resource_arn_list: resource_arn_list_for_tag_untag
    [@ocaml.doc
      "Specifies a list of ARNs of the resources that you want to remove tags from.\n\n An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n "]}
[@@ocaml.doc ""]
type nonrec exception_message = string[@@ocaml.doc ""]
type nonrec throttled_exception =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was denied to limit the frequency of submitted requests.\n"]
type nonrec invalid_parameter_exception =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "This error indicates one of the following:\n\n {ul\n       {-  A parameter is missing.\n           \n            }\n       {-  A malformed string was supplied for the request parameter.\n           \n            }\n       {-  An out-of-range value was supplied for the request parameter.\n           \n            }\n       {-  The target ID is invalid, unsupported, or doesn't exist.\n           \n            }\n       {-  You can't access the Amazon S3 bucket for report storage. For more information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies-prereqs.html#bucket-policies-org-report}Additional Requirements for Organization-wide Tag Compliance Reports} in the {i Organizations User Guide.} \n           \n            }\n       }\n  "]
type nonrec internal_service_exception =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request processing failed because of an unknown error, exception, or failure. You can retry the request.\n"]
type nonrec target_id_type =
  | ROOT [@ocaml.doc ""]
  | OU [@ocaml.doc ""]
  | ACCOUNT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec target_id = string[@@ocaml.doc ""]
type nonrec target_id_filter_list = target_id list[@@ocaml.doc ""]
type nonrec tags_per_page = int[@@ocaml.doc ""]
type nonrec tag_value = string[@@ocaml.doc ""]
type nonrec tag_values_output_list = tag_value list[@@ocaml.doc ""]
type nonrec tag_value_list = tag_value list[@@ocaml.doc ""]
type nonrec tag_resources_output =
  {
  failed_resources_map: failed_resources_map option
    [@ocaml.doc
      "A map containing a key-value pair for each failed item that couldn't be tagged. The key is the ARN of the failed resource. The value is a [FailureInfo] object that contains an error code, a status code, and an error message. If there are no errors, the [FailedResourcesMap] is empty.\n"]}
[@@ocaml.doc ""]
type nonrec tag_map = (tag_key * tag_value) list[@@ocaml.doc ""]
type nonrec tag_resources_input =
  {
  tags: tag_map
    [@ocaml.doc
      "Specifies a list of tags that you want to add to the specified resources. A tag consists of a key and a value that you define.\n"];
  resource_arn_list: resource_arn_list_for_tag_untag
    [@ocaml.doc
      "Specifies the list of ARNs of the resources that you want to apply tags to.\n\n An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n "]}
[@@ocaml.doc ""]
type nonrec tag =
  {
  value: tag_value
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). The value can be empty or null.\n"];
  key: tag_key
    [@ocaml.doc
      "One part of a key-value pair that makes up a tag. A key is a general label that acts like a category for more specific tag values.\n"]}
[@@ocaml.doc
  "The metadata that you apply to Amazon Web Services resources to help you categorize and organize them. Each tag consists of a key and a value, both of which you define. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services Resources} in the {i Amazon Web Services General Reference}.\n"]
type nonrec tag_list = tag list[@@ocaml.doc ""]
type nonrec tag_key_list = tag_key list[@@ocaml.doc ""]
type nonrec tag_key_filter_list = tag_key list[@@ocaml.doc ""]
type nonrec tag_filter =
  {
  values: tag_value_list option
    [@ocaml.doc
      "One part of a key-value pair that make up a tag. A value acts as a descriptor within a tag category (key). The value can be empty or null.\n"];
  key: tag_key option
    [@ocaml.doc
      "One part of a key-value pair that makes up a tag. A key is a general label that acts like a category for more specific tag values.\n"]}
[@@ocaml.doc
  "A list of tags (keys and values) that are used to specify the associated resources.\n"]
type nonrec tag_filter_list = tag_filter list[@@ocaml.doc ""]
type nonrec last_updated = string[@@ocaml.doc ""]
type nonrec region = string[@@ocaml.doc ""]
type nonrec amazon_resource_type = string[@@ocaml.doc ""]
type nonrec non_compliant_resources = int[@@ocaml.doc ""]
type nonrec summary =
  {
  non_compliant_resources: non_compliant_resources option
    [@ocaml.doc "The count of noncompliant resources.\n"];
  resource_type: amazon_resource_type option
    [@ocaml.doc "The Amazon Web Services resource type.\n"];
  region: region option
    [@ocaml.doc
      "The Amazon Web Services Region that the summary applies to.\n"];
  target_id_type: target_id_type option
    [@ocaml.doc
      "Whether the target is an account, an OU, or the organization root.\n"];
  target_id: target_id option
    [@ocaml.doc
      "The account identifier or the root identifier of the organization. If you don't know the root ID, you can call the Organizations {{:https://docs.aws.amazon.com/organizations/latest/APIReference/API_ListRoots.html}ListRoots} API.\n"];
  last_updated: last_updated option
    [@ocaml.doc
      "The timestamp that shows when this summary was generated in this Region. \n"]}
[@@ocaml.doc "A count of noncompliant resources.\n"]
type nonrec summary_list = summary list[@@ocaml.doc ""]
type nonrec status = string[@@ocaml.doc ""]
type nonrec start_report_creation_output = unit[@@ocaml.doc ""]
type nonrec s3_bucket = string[@@ocaml.doc ""]
type nonrec start_report_creation_input =
  {
  s3_bucket: s3_bucket
    [@ocaml.doc
      "The name of the Amazon S3 bucket where the report will be stored; for example:\n\n  [awsexamplebucket] \n \n  For more information on S3 bucket requirements, including an example bucket policy, see the example S3 bucket policy on this page.\n  "]}
[@@ocaml.doc ""]
type nonrec constraint_violation_exception =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The request was denied because performing this operation violates a constraint. \n\n Some of the reasons in the following list might not apply to this specific operation.\n \n  {ul\n        {-  You must meet the prerequisites for using tag policies. For information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies-prereqs.html}Prerequisites and Permissions for Using Tag Policies} in the {i Organizations User Guide.} \n            \n             }\n        {-  You must enable the tag policies service principal ([tagpolicies.tag.amazonaws.com]) to integrate with Organizations For information, see {{:https://docs.aws.amazon.com/organizations/latest/APIReference/API_EnableAWSServiceAccess.html}EnableAWSServiceAccess}.\n            \n             }\n        {-  You must have a tag policy attached to the organization root, an OU, or an account.\n            \n             }\n        }\n  "]
type nonrec concurrent_modification_exception =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "The target of the operation is currently being modified by a different request. Try again later.\n"]
type nonrec start_date = string[@@ocaml.doc ""]
type nonrec s3_location = string[@@ocaml.doc ""]
type nonrec resources_per_page = int[@@ocaml.doc ""]
type nonrec resource_type_filter_list = amazon_resource_type list[@@ocaml.doc
                                                                   ""]
type nonrec compliance_status = bool[@@ocaml.doc ""]
type nonrec compliance_details =
  {
  compliance_status: compliance_status option
    [@ocaml.doc
      "Whether a resource is compliant with the effective tag policy.\n"];
  keys_with_noncompliant_values: tag_key_list option
    [@ocaml.doc
      "These are keys defined in the effective policy that are on the resource with either incorrect case treatment or noncompliant values. \n"];
  noncompliant_keys: tag_key_list option
    [@ocaml.doc
      "These tag keys on the resource are noncompliant with the effective tag policy.\n"]}
[@@ocaml.doc
  "Information that shows whether a resource is compliant with the effective tag policy, including details on any noncompliant tag keys.\n"]
type nonrec resource_tag_mapping =
  {
  compliance_details: compliance_details option
    [@ocaml.doc
      "Information that shows whether a resource is compliant with the effective tag policy, including details on any noncompliant tag keys.\n"];
  tags: tag_list option
    [@ocaml.doc
      "The tags that have been applied to one or more Amazon Web Services resources.\n"];
  resource_ar_n: resource_ar_n option
    [@ocaml.doc "The ARN of the resource.\n"]}[@@ocaml.doc
                                                "A list of resource ARNs and the tags (keys and values) that are associated with each.\n"]
type nonrec resource_tag_mapping_list = resource_tag_mapping list[@@ocaml.doc
                                                                   ""]
type nonrec pagination_token_expired_exception =
  {
  message: exception_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                      "A [PaginationToken] is valid for a maximum of 15 minutes. Your request was denied because the specified [PaginationToken] has expired.\n"]
type nonrec pagination_token = string[@@ocaml.doc ""]
type nonrec get_tag_values_output =
  {
  tag_values: tag_values_output_list option
    [@ocaml.doc
      "A list of all tag values for the specified key currently used in the specified Amazon Web Services Region for the calling account.\n"];
  pagination_token: pagination_token option
    [@ocaml.doc
      "A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.\n"]}
[@@ocaml.doc ""]
type nonrec get_tag_values_input =
  {
  key: tag_key
    [@ocaml.doc
      "Specifies the tag key for which you want to list all existing values that are currently used in the specified Amazon Web Services Region for the calling account.\n"];
  pagination_token: pagination_token option
    [@ocaml.doc
      "Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.\n"]}
[@@ocaml.doc ""]
type nonrec get_tag_keys_output =
  {
  tag_keys: tag_key_list option
    [@ocaml.doc
      "A list of all tag keys in the Amazon Web Services account.\n"];
  pagination_token: pagination_token option
    [@ocaml.doc
      "A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.\n"]}
[@@ocaml.doc ""]
type nonrec get_tag_keys_input =
  {
  pagination_token: pagination_token option
    [@ocaml.doc
      "Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.\n"]}
[@@ocaml.doc ""]
type nonrec get_resources_output =
  {
  resource_tag_mapping_list: resource_tag_mapping_list option
    [@ocaml.doc
      "A list of resource ARNs and the tags (keys and values) associated with each.\n"];
  pagination_token: pagination_token option
    [@ocaml.doc
      "A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.\n"]}
[@@ocaml.doc ""]
type nonrec include_compliance_details = bool[@@ocaml.doc ""]
type nonrec exclude_compliant_resources = bool[@@ocaml.doc ""]
type nonrec resource_arn_list_for_get = resource_ar_n list[@@ocaml.doc ""]
type nonrec get_resources_input =
  {
  resource_arn_list: resource_arn_list_for_get option
    [@ocaml.doc
      "Specifies a list of ARNs of resources for which you want to retrieve tag data. You can't specify both this parameter and any of the pagination parameters ([ResourcesPerPage], [TagsPerPage], [PaginationToken]) in the same request. If you specify both, you get an [Invalid Parameter] exception.\n\n If a resource specified by this parameter doesn't exist, it doesn't generate an error; it simply isn't included in the response.\n \n  An ARN (Amazon Resource Name) uniquely identifies a resource. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces} in the {i Amazon Web Services General Reference}.\n  "];
  exclude_compliant_resources: exclude_compliant_resources option
    [@ocaml.doc
      "Specifies whether to exclude resources that are compliant with the tag policy. Set this to [true] if you are interested in retrieving information on noncompliant resources only.\n\n You can use this parameter only if the [IncludeComplianceDetails] parameter is also set to [true].\n "];
  include_compliance_details: include_compliance_details option
    [@ocaml.doc
      "Specifies whether to include details regarding the compliance with the effective tag policy. Set this to [true] to determine whether resources are compliant with the tag policy and to get details.\n"];
  resource_type_filters: resource_type_filter_list option
    [@ocaml.doc
      "Specifies the resource types that you want included in the response. The format of each resource type is [service\\[:resourceType\\]]. For example, specifying a resource type of [ec2] returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of [ec2:instance] returns only EC2 instances. \n\n The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). For the list of services whose resources you can use in this parameter, see {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html}Services that support the Resource Groups Tagging API}.\n \n  You can specify multiple resource types by using an array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter. For example, the following string would limit the response to only Amazon EC2 instances, Amazon S3 buckets, or any Audit Manager resource:\n  \n    [ec2:instance,s3:bucket,auditmanager] \n   "];
  tags_per_page: tags_per_page option
    [@ocaml.doc
      "Amazon Web Services recommends using [ResourcesPerPage] instead of this parameter.\n\n A limit that restricts the number of tags (key and value pairs) returned by [GetResources] in paginated output. A resource with no tags is counted as having one tag (one key and value pair).\n \n   [GetResources] does not split a resource and its associated tags across pages. If the specified [TagsPerPage] would cause such a break, a [PaginationToken] is returned in place of the affected resource and its tags. Use that token in another request to get the remaining data. For example, if you specify a [TagsPerPage] of [100] and the account has 22 resources with 10 tags each (meaning that each resource has 10 key and value pairs), the output will consist of three pages. The first page displays the first 10 resources, each with its 10 tags. The second page displays the next 10 resources, each with its 10 tags. The third page displays the remaining 2 resources, each with its 10 tags.\n  \n   You can set [TagsPerPage] to a minimum of 100 items up to a maximum of 500 items.\n   "];
  resources_per_page: resources_per_page option
    [@ocaml.doc
      "Specifies the maximum number of results to be returned in each page. A query can return fewer than this maximum, even if there are more results still to return. You should always check the [PaginationToken] response value to see if there are more results. You can specify a minimum of 1 and a maximum value of 100.\n"];
  tag_filters: tag_filter_list option
    [@ocaml.doc
      "Specifies a list of TagFilters (keys and values) to restrict the output to only those resources that have tags with the specified keys and, if included, the specified values. Each [TagFilter] must contain a key with values optional. A request can include up to 50 keys, and each key can include up to 20 values. \n\n Note the following when deciding how to use TagFilters:\n \n  {ul\n        {-  If you {i don't} specify a [TagFilter], the response includes all resources that are currently tagged or ever had a tag. Resources that currently don't have tags are shown with an empty tag set, like this: [\"Tags\": \\[\\]].\n            \n             }\n        {-  If you specify more than one filter in a single request, the response returns only those resources that satisfy all filters.\n            \n             }\n        {-  If you specify a filter that contains more than one value for a key, the response returns resources that match {i any} of the specified values for that key.\n            \n             }\n        {-  If you don't specify a value for a key, the response returns all resources that are tagged with that key, with any or no value.\n            \n             For example, for the following filters: [filter1= {keyA,{value1}}], [filter2={keyB,{value2,value3,value4}}], [filter3=\n                        {keyC}]:\n             \n              {ul\n                    {-   [GetResources({filter1})] returns resources tagged with [key1=value1] \n                        \n                         }\n                    {-   [GetResources({filter2})] returns resources tagged with [key2=value2] or [key2=value3] or [key2=value4] \n                        \n                         }\n                    {-   [GetResources({filter3})] returns resources tagged with any tag with the key [key3], and with any or no value\n                        \n                         }\n                    {-   [GetResources({filter1,filter2,filter3})] returns resources tagged with [(key1=value1) and (key2=value2 or key2=value3 or\n                                key2=value4) and (key3, any or no value)] \n                        \n                         }\n                    \n         }\n          }\n        }\n  "];
  pagination_token: pagination_token option
    [@ocaml.doc
      "Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.\n"]}
[@@ocaml.doc ""]
type nonrec get_compliance_summary_output =
  {
  pagination_token: pagination_token option
    [@ocaml.doc
      "A string that indicates that there is more data available than this response contains. To receive the next part of the response, specify this response value as the [PaginationToken] value in the request for the next page.\n"];
  summary_list: summary_list option
    [@ocaml.doc "A table that shows counts of noncompliant resources.\n"]}
[@@ocaml.doc ""]
type nonrec region_filter_list = region list[@@ocaml.doc ""]
type nonrec group_by_attribute =
  | RESOURCE_TYPE [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | TARGET_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec group_by = group_by_attribute list[@@ocaml.doc ""]
type nonrec max_results_get_compliance_summary = int[@@ocaml.doc ""]
type nonrec get_compliance_summary_input =
  {
  pagination_token: pagination_token option
    [@ocaml.doc
      "Specifies a [PaginationToken] response value from a previous request to indicate that you want the next page of results. Leave this parameter empty in your initial request.\n"];
  max_results: max_results_get_compliance_summary option
    [@ocaml.doc
      "Specifies the maximum number of results to be returned in each page. A query can return fewer than this maximum, even if there are more results still to return. You should always check the [PaginationToken] response value to see if there are more results. You can specify a minimum of 1 and a maximum value of 100.\n"];
  group_by: group_by option
    [@ocaml.doc
      "Specifies a list of attributes to group the counts of noncompliant resources by. If supplied, the counts are sorted by those attributes.\n"];
  tag_key_filters: tag_key_filter_list option
    [@ocaml.doc
      "Specifies that you want the response to include information for only resources that have tags with the specified tag keys. If you use this parameter, the count of returned noncompliant resources includes only resources that have the specified tag keys.\n"];
  resource_type_filters: resource_type_filter_list option
    [@ocaml.doc
      "Specifies that you want the response to include information for only resources of the specified types. The format of each resource type is [service\\[:resourceType\\]]. For example, specifying a resource type of [ec2] returns all Amazon EC2 resources (which includes EC2 instances). Specifying a resource type of [ec2:instance] returns only EC2 instances.\n\n The string for each service name and resource type is the same as that embedded in a resource's Amazon Resource Name (ARN). Consult the {i  {{:https://docs.aws.amazon.com/general/latest/gr/}Amazon Web Services General Reference} } for the following:\n \n  {ul\n        {-  For a list of service name strings, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces}Amazon Web Services Service Namespaces}.\n            \n             }\n        {-  For resource type strings, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arns-syntax}Example ARNs}.\n            \n             }\n        {-  For more information about ARNs, see {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n            \n             }\n        }\n   You can specify multiple resource types by using a comma separated array. The array can include up to 100 items. Note that the length constraint requirement applies to each resource type filter. \n   "];
  region_filters: region_filter_list option
    [@ocaml.doc
      "Specifies a list of Amazon Web Services Regions to limit the output to. If you use this parameter, the count of returned noncompliant resources includes only resources in the specified Regions.\n"];
  target_id_filters: target_id_filter_list option
    [@ocaml.doc
      "Specifies target identifiers (usually, specific account IDs) to limit the output by. If you use this parameter, the count of returned noncompliant resources includes only resources with the specified target IDs.\n"]}
[@@ocaml.doc ""]
type nonrec describe_report_creation_output =
  {
  error_message: error_message option
    [@ocaml.doc "Details of the common errors that all operations return.\n"];
  start_date: start_date option
    [@ocaml.doc "The date and time that the report was started. \n"];
  s3_location: s3_location option
    [@ocaml.doc
      "The path to the Amazon S3 bucket where the report was stored on creation.\n"];
  status: status option
    [@ocaml.doc
      "Reports the status of the operation.\n\n The operation status can be one of the following:\n \n  {ul\n        {-   [RUNNING] - Report creation is in progress.\n            \n             }\n        {-   [SUCCEEDED] - Report creation is complete. You can open the report from the Amazon S3 bucket that you specified when you ran [StartReportCreation].\n            \n             }\n        {-   [FAILED] - Report creation timed out or the Amazon S3 bucket is not accessible. \n            \n             }\n        {-   [NO REPORT] - No report was generated in the last 90 days.\n            \n             }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec describe_report_creation_input = unit[@@ocaml.doc ""]