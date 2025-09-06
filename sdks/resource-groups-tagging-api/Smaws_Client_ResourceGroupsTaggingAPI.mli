(** Resource Groups Tagging API client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_failure_info :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?status_code:status_code ->
  unit ->
  failure_info

val make_untag_resources_output :
  ?failed_resources_map:failed_resources_map -> unit -> untag_resources_output

val make_untag_resources_input :
  tag_keys:tag_key_list_for_untag ->
  resource_arn_list:resource_arn_list_for_tag_untag ->
  unit ->
  untag_resources_input

val make_tag_resources_output :
  ?failed_resources_map:failed_resources_map -> unit -> tag_resources_output

val make_tag_resources_input :
  tags:tag_map -> resource_arn_list:resource_arn_list_for_tag_untag -> unit -> tag_resources_input

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_filter : ?values:tag_value_list -> ?key:tag_key -> unit -> tag_filter

val make_summary :
  ?non_compliant_resources:non_compliant_resources ->
  ?resource_type:amazon_resource_type ->
  ?region:region ->
  ?target_id_type:target_id_type ->
  ?target_id:target_id ->
  ?last_updated:last_updated ->
  unit ->
  summary

val make_start_report_creation_output : unit -> unit
val make_start_report_creation_input : s3_bucket:s3_bucket -> unit -> start_report_creation_input

val make_compliance_details :
  ?compliance_status:compliance_status ->
  ?keys_with_noncompliant_values:tag_key_list ->
  ?noncompliant_keys:tag_key_list ->
  unit ->
  compliance_details

val make_resource_tag_mapping :
  ?compliance_details:compliance_details ->
  ?tags:tag_list ->
  ?resource_ar_n:resource_ar_n ->
  unit ->
  resource_tag_mapping

val make_get_tag_values_output :
  ?tag_values:tag_values_output_list ->
  ?pagination_token:pagination_token ->
  unit ->
  get_tag_values_output

val make_get_tag_values_input :
  ?pagination_token:pagination_token -> key:tag_key -> unit -> get_tag_values_input

val make_get_tag_keys_output :
  ?tag_keys:tag_key_list -> ?pagination_token:pagination_token -> unit -> get_tag_keys_output

val make_get_tag_keys_input : ?pagination_token:pagination_token -> unit -> get_tag_keys_input

val make_get_resources_output :
  ?resource_tag_mapping_list:resource_tag_mapping_list ->
  ?pagination_token:pagination_token ->
  unit ->
  get_resources_output

val make_get_resources_input :
  ?resource_arn_list:resource_arn_list_for_get ->
  ?exclude_compliant_resources:exclude_compliant_resources ->
  ?include_compliance_details:include_compliance_details ->
  ?resource_type_filters:resource_type_filter_list ->
  ?tags_per_page:tags_per_page ->
  ?resources_per_page:resources_per_page ->
  ?tag_filters:tag_filter_list ->
  ?pagination_token:pagination_token ->
  unit ->
  get_resources_input

val make_get_compliance_summary_output :
  ?pagination_token:pagination_token ->
  ?summary_list:summary_list ->
  unit ->
  get_compliance_summary_output

val make_get_compliance_summary_input :
  ?pagination_token:pagination_token ->
  ?max_results:max_results_get_compliance_summary ->
  ?group_by:group_by ->
  ?tag_key_filters:tag_key_filter_list ->
  ?resource_type_filters:resource_type_filter_list ->
  ?region_filters:region_filter_list ->
  ?target_id_filters:target_id_filter_list ->
  unit ->
  get_compliance_summary_input

val make_describe_report_creation_output :
  ?error_message:error_message ->
  ?start_date:start_date ->
  ?s3_location:s3_location ->
  ?status:status ->
  unit ->
  describe_report_creation_output

val make_describe_report_creation_input : unit -> unit
(** {1:operations Operations} *)

module DescribeReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_report_creation_input ->
    ( describe_report_creation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConstraintViolationException of constraint_violation_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Describes the status of the [StartReportCreation] operation. \n\n\
  \ You can call this operation only from the organization's management account and from the \
   us-east-1 Region.\n\
  \ "]

module GetComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
    get_compliance_summary_input ->
    ( get_compliance_summary_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConstraintViolationException of constraint_violation_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Returns a table that shows counts of resources that are noncompliant with their tag policies.\n\n\
  \ For more information on tag policies, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}Tag \
   Policies} in the {i Organizations User Guide.} \n\
  \ \n\
  \  You can call this operation only from the organization's management account and from the \
   us-east-1 Region.\n\
  \  \n\
  \   This operation supports pagination, where the response can be sent in multiple pages. You \
   should check the [PaginationToken] response parameter to determine if there are additional \
   results available to return. Repeat the query, passing the [PaginationToken] response parameter \
   value as an input to the next request until you recieve a [null] value. A null value for \
   [PaginationToken] indicates that there are no more results waiting to be returned.\n\
  \   "]

module GetResources : sig
  val request :
    Smaws_Lib.Context.t ->
    get_resources_input ->
    ( get_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PaginationTokenExpiredException of pagination_token_expired_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Returns all the tagged or previously tagged resources that are located in the specified Amazon \
   Web Services Region for the account.\n\n\
  \ Depending on what information you want returned, you can also specify the following:\n\
  \ \n\
  \  {ul\n\
  \        {-   {i Filters} that specify what tags and resource types you want returned. The \
   response includes all tags that are associated with the requested resources.\n\
  \            \n\
  \             }\n\
  \        {-  Information about compliance with the account's effective tag policy. For more \
   information on tag policies, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}Tag \
   Policies} in the {i Organizations User Guide.} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation supports pagination, where the response can be sent in multiple pages. You \
   should check the [PaginationToken] response parameter to determine if there are additional \
   results available to return. Repeat the query, passing the [PaginationToken] response parameter \
   value as an input to the next request until you recieve a [null] value. A null value for \
   [PaginationToken] indicates that there are no more results waiting to be returned.\n\
  \   "]

module GetTagKeys : sig
  val request :
    Smaws_Lib.Context.t ->
    get_tag_keys_input ->
    ( get_tag_keys_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PaginationTokenExpiredException of pagination_token_expired_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Returns all tag keys currently in use in the specified Amazon Web Services Region for the \
   calling account.\n\n\
  \ This operation supports pagination, where the response can be sent in multiple pages. You \
   should check the [PaginationToken] response parameter to determine if there are additional \
   results available to return. Repeat the query, passing the [PaginationToken] response parameter \
   value as an input to the next request until you recieve a [null] value. A null value for \
   [PaginationToken] indicates that there are no more results waiting to be returned.\n\
  \ "]

module GetTagValues : sig
  val request :
    Smaws_Lib.Context.t ->
    get_tag_values_input ->
    ( get_tag_values_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PaginationTokenExpiredException of pagination_token_expired_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Returns all tag values for the specified key that are used in the specified Amazon Web Services \
   Region for the calling account.\n\n\
  \ This operation supports pagination, where the response can be sent in multiple pages. You \
   should check the [PaginationToken] response parameter to determine if there are additional \
   results available to return. Repeat the query, passing the [PaginationToken] response parameter \
   value as an input to the next request until you recieve a [null] value. A null value for \
   [PaginationToken] indicates that there are no more results waiting to be returned.\n\
  \ "]

module StartReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
    start_report_creation_input ->
    ( start_report_creation_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Generates a report that lists all tagged resources in the accounts across your organization and \
   tells whether each resource is compliant with the effective tag policy. Compliance data is \
   refreshed daily. The report is generated asynchronously.\n\n\
  \ The generated report is saved to the following location:\n\
  \ \n\
  \   [s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv] \n\
  \  \n\
  \   You can call this operation only from the organization's management account and from the \
   us-east-1 Region.\n\
  \   "]

module TagResources : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resources_input ->
    ( tag_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Applies one or more tags to the specified resources. Note the following:\n\n\
  \ {ul\n\
  \       {-  Not all resources can have tags. For a list of services with resources that support \
   tagging using this operation, see \
   {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html}Services \
   that support the Resource Groups Tagging API}. If the resource doesn't yet support this \
   operation, the resource's service might support tagging using its own API operations. For more \
   information, refer to the documentation for that service.\n\
  \           \n\
  \            }\n\
  \       {-  Each resource can have up to 50 tags. For other limits, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions}Tag Naming \
   and Usage Conventions} in the {i Amazon Web Services General Reference.} \n\
  \           \n\
  \            }\n\
  \       {-  You can only tag resources that are located in the specified Amazon Web Services \
   Region for the Amazon Web Services account.\n\
  \           \n\
  \            }\n\
  \       {-  To add tags to a resource, you need the necessary permissions for the service that \
   the resource belongs to as well as permissions for adding tags. For more information, see the \
   documentation for each service.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    Do not store personally identifiable information (PII) or other confidential or sensitive \
   information in tags. We use tags to provide you with billing and administration services. Tags \
   are not intended to be used for private or sensitive data.\n\
  \    \n\
  \       {b Minimum permissions} \n\
  \      \n\
  \       In addition to the [tag:TagResources] permission required by this operation, you must \
   also have the tagging permission defined by the service that created the resource. For example, \
   to tag an Amazon EC2 instance using the [TagResources] operation, you must have both of the \
   following permissions:\n\
  \       \n\
  \        {ul\n\
  \              {-   [tag:TagResource] \n\
  \                  \n\
  \                   }\n\
  \              {-   [ec2:CreateTags] \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module UntagResources : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resources_input ->
    ( untag_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottledException of throttled_exception ] )
    result
end
[@@ocaml.doc
  "Removes the specified tags from the specified resources. When you specify a tag key, the action \
   removes both that key and its associated value. The operation succeeds even if you attempt to \
   remove tags from a resource that were already removed. Note the following:\n\n\
  \ {ul\n\
  \       {-  To remove tags from a resource, you need the necessary permissions for the service \
   that the resource belongs to as well as permissions for removing tags. For more information, \
   see the documentation for the service whose resource you want to untag.\n\
  \           \n\
  \            }\n\
  \       {-  You can only tag resources that are located in the specified Amazon Web Services \
   Region for the calling Amazon Web Services account.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    {b Minimum permissions} \n\
  \   \n\
  \    In addition to the [tag:UntagResources] permission required by this operation, you must \
   also have the remove tags permission defined by the service that created the resource. For \
   example, to remove the tags from an Amazon EC2 instance using the [UntagResources] operation, \
   you must have both of the following permissions:\n\
  \    \n\
  \     {ul\n\
  \           {-   [tag:UntagResource] \n\
  \               \n\
  \                }\n\
  \           {-   [ec2:DeleteTags] \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
