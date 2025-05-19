open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "tagging";
      endpointPrefix = "tagging";
      version = "2017-01-26";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec error_code =
  | INVALID_PARAMETER_EXCEPTION 
  | INTERNAL_SERVICE_EXCEPTION [@@ocaml.doc ""]
type nonrec failure_info =
  {
  error_message: string option ;
  error_code: error_code option ;
  status_code: int option }[@@ocaml.doc
                             "Information about the errors that are returned for each failed resource. This information can include [InternalServiceException] and [InvalidParameterException] errors. It can also include any valid error code returned by the Amazon Web Services service that hosts the resource that the ARN key represents.\n\n The following are common error codes that you might receive from other Amazon Web Services services:\n \n  {ul\n        {-   {b InternalServiceException} \226\128\147 This can mean that the Resource Groups Tagging API didn't receive a response from another Amazon Web Services service. It can also mean that the resource type in the request is not supported by the Resource Groups Tagging API. In these cases, it's safe to retry the request and then call {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_GetResources.html}GetResources} to verify the changes.\n            \n             }\n        {-   {b AccessDeniedException} \226\128\147 This can mean that you need permission to call the tagging operations in the Amazon Web Services service that contains the resource. For example, to use the Resource Groups Tagging API to tag a Amazon CloudWatch alarm resource, you need permission to call both {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/API_TagResources.html} [TagResources] } {i and} {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_TagResource.html} [TagResource] } in the CloudWatch API. \n            \n             }\n        }\n   For more information on errors that are generated from other Amazon Web Services services, see the documentation for that service. \n   "]
type nonrec failed_resources_map = (string * failure_info) list[@@ocaml.doc
                                                                 ""]
type nonrec untag_resources_output =
  {
  failed_resources_map: failed_resources_map option }[@@ocaml.doc ""]
type nonrec untag_resources_input =
  {
  tag_keys: string list ;
  resource_arn_list: string list }[@@ocaml.doc ""]
type nonrec throttled_exception = {
  message: string option }[@@ocaml.doc
                            "The request was denied to limit the frequency of submitted requests.\n"]
type nonrec invalid_parameter_exception = {
  message: string option }[@@ocaml.doc
                            "This error indicates one of the following:\n\n {ul\n       {-  A parameter is missing.\n           \n            }\n       {-  A malformed string was supplied for the request parameter.\n           \n            }\n       {-  An out-of-range value was supplied for the request parameter.\n           \n            }\n       {-  The target ID is invalid, unsupported, or doesn't exist.\n           \n            }\n       {-  You can't access the Amazon S3 bucket for report storage. For more information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies-prereqs.html#bucket-policies-org-report}Additional Requirements for Organization-wide Tag Compliance Reports} in the {i Organizations User Guide.} \n           \n            }\n       }\n  "]
type nonrec internal_service_exception = {
  message: string option }[@@ocaml.doc
                            "The request processing failed because of an unknown error, exception, or failure. You can retry the request.\n"]
type nonrec target_id_type =
  | ROOT 
  | OU 
  | ACCOUNT [@@ocaml.doc ""]
type nonrec tag_resources_output =
  {
  failed_resources_map: failed_resources_map option }[@@ocaml.doc ""]
type nonrec tag_map = (string * string) list[@@ocaml.doc ""]
type nonrec tag_resources_input =
  {
  tags: tag_map ;
  resource_arn_list: string list }[@@ocaml.doc ""]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "The metadata that you apply to Amazon Web Services resources to help you categorize and organize them. Each tag consists of a key and a value, both of which you define. For more information, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web Services Resources} in the {i Amazon Web Services General Reference}.\n"]
type nonrec tag_filter = {
  values: string list option ;
  key: string option }[@@ocaml.doc
                        "A list of tags (keys and values) that are used to specify the associated resources.\n"]
type nonrec summary =
  {
  non_compliant_resources: int option ;
  resource_type: string option ;
  region: string option ;
  target_id_type: target_id_type option ;
  target_id: string option ;
  last_updated: string option }[@@ocaml.doc
                                 "A count of noncompliant resources.\n"]
type nonrec start_report_creation_output = unit
type nonrec start_report_creation_input = {
  s3_bucket: string }[@@ocaml.doc ""]
type nonrec constraint_violation_exception = {
  message: string option }[@@ocaml.doc
                            "The request was denied because performing this operation violates a constraint. \n\n Some of the reasons in the following list might not apply to this specific operation.\n \n  {ul\n        {-  You must meet the prerequisites for using tag policies. For information, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies-prereqs.html}Prerequisites and Permissions for Using Tag Policies} in the {i Organizations User Guide.} \n            \n             }\n        {-  You must enable the tag policies service principal ([tagpolicies.tag.amazonaws.com]) to integrate with Organizations For information, see {{:https://docs.aws.amazon.com/organizations/latest/APIReference/API_EnableAWSServiceAccess.html}EnableAWSServiceAccess}.\n            \n             }\n        {-  You must have a tag policy attached to the organization root, an OU, or an account.\n            \n             }\n        }\n  "]
type nonrec concurrent_modification_exception = {
  message: string option }[@@ocaml.doc
                            "The target of the operation is currently being modified by a different request. Try again later.\n"]
type nonrec compliance_details =
  {
  compliance_status: bool option ;
  keys_with_noncompliant_values: string list option ;
  noncompliant_keys: string list option }[@@ocaml.doc
                                           "Information that shows whether a resource is compliant with the effective tag policy, including details on any noncompliant tag keys.\n"]
type nonrec resource_tag_mapping =
  {
  compliance_details: compliance_details option ;
  tags: tag list option ;
  resource_ar_n: string option }[@@ocaml.doc
                                  "A list of resource ARNs and the tags (keys and values) that are associated with each.\n"]
type nonrec pagination_token_expired_exception = {
  message: string option }[@@ocaml.doc
                            "A [PaginationToken] is valid for a maximum of 15 minutes. Your request was denied because the specified [PaginationToken] has expired.\n"]
type nonrec get_tag_values_output =
  {
  tag_values: string list option ;
  pagination_token: string option }[@@ocaml.doc ""]
type nonrec get_tag_values_input =
  {
  key: string ;
  pagination_token: string option }[@@ocaml.doc ""]
type nonrec get_tag_keys_output =
  {
  tag_keys: string list option ;
  pagination_token: string option }[@@ocaml.doc ""]
type nonrec get_tag_keys_input = {
  pagination_token: string option }[@@ocaml.doc ""]
type nonrec get_resources_output =
  {
  resource_tag_mapping_list: resource_tag_mapping list option ;
  pagination_token: string option }[@@ocaml.doc ""]
type nonrec get_resources_input =
  {
  resource_arn_list: string list option ;
  exclude_compliant_resources: bool option ;
  include_compliance_details: bool option ;
  resource_type_filters: string list option ;
  tags_per_page: int option ;
  resources_per_page: int option ;
  tag_filters: tag_filter list option ;
  pagination_token: string option }[@@ocaml.doc ""]
type nonrec get_compliance_summary_output =
  {
  pagination_token: string option ;
  summary_list: summary list option }[@@ocaml.doc ""]
type nonrec group_by_attribute =
  | RESOURCE_TYPE 
  | REGION 
  | TARGET_ID [@@ocaml.doc ""]
type nonrec get_compliance_summary_input =
  {
  pagination_token: string option ;
  max_results: int option ;
  group_by: group_by_attribute list option ;
  tag_key_filters: string list option ;
  resource_type_filters: string list option ;
  region_filters: string list option ;
  target_id_filters: string list option }[@@ocaml.doc ""]
type nonrec describe_report_creation_output =
  {
  error_message: string option ;
  start_date: string option ;
  s3_location: string option ;
  status: string option }[@@ocaml.doc ""]
type nonrec describe_report_creation_input = unit