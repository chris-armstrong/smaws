(** 
    Resource Groups Tagging API client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec error_code =
  | INVALID_PARAMETER_EXCEPTION 
  | INTERNAL_SERVICE_EXCEPTION 
type nonrec failure_info =
  {
  error_message: string option ;
  error_code: error_code option ;
  status_code: int option }
type nonrec failed_resources_map = (string * failure_info) list
type nonrec untag_resources_output =
  {
  failed_resources_map: failed_resources_map option }
type nonrec untag_resources_input =
  {
  tag_keys: string list ;
  resource_arn_list: string list }
type nonrec throttled_exception = {
  message: string option }
type nonrec invalid_parameter_exception = {
  message: string option }
type nonrec internal_service_exception = {
  message: string option }
type nonrec target_id_type =
  | ROOT 
  | OU 
  | ACCOUNT 
type nonrec tag_resources_output =
  {
  failed_resources_map: failed_resources_map option }
type nonrec tag_map = (string * string) list
type nonrec tag_resources_input =
  {
  tags: tag_map ;
  resource_arn_list: string list }
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_filter = {
  values: string list option ;
  key: string option }
type nonrec summary =
  {
  non_compliant_resources: int option ;
  resource_type: string option ;
  region: string option ;
  target_id_type: target_id_type option ;
  target_id: string option ;
  last_updated: string option }
type nonrec start_report_creation_output = unit
type nonrec start_report_creation_input = {
  s3_bucket: string }
type nonrec constraint_violation_exception = {
  message: string option }
type nonrec concurrent_modification_exception = {
  message: string option }
type nonrec compliance_details =
  {
  compliance_status: bool option ;
  keys_with_noncompliant_values: string list option ;
  noncompliant_keys: string list option }
type nonrec resource_tag_mapping =
  {
  compliance_details: compliance_details option ;
  tags: tag list option ;
  resource_ar_n: string option }
type nonrec pagination_token_expired_exception = {
  message: string option }
type nonrec get_tag_values_output =
  {
  tag_values: string list option ;
  pagination_token: string option }
type nonrec get_tag_values_input =
  {
  key: string ;
  pagination_token: string option }
type nonrec get_tag_keys_output =
  {
  tag_keys: string list option ;
  pagination_token: string option }
type nonrec get_tag_keys_input = {
  pagination_token: string option }
type nonrec get_resources_output =
  {
  resource_tag_mapping_list: resource_tag_mapping list option ;
  pagination_token: string option }
type nonrec get_resources_input =
  {
  resource_arn_list: string list option ;
  exclude_compliant_resources: bool option ;
  include_compliance_details: bool option ;
  resource_type_filters: string list option ;
  tags_per_page: int option ;
  resources_per_page: int option ;
  tag_filters: tag_filter list option ;
  pagination_token: string option }
type nonrec get_compliance_summary_output =
  {
  pagination_token: string option ;
  summary_list: summary list option }
type nonrec group_by_attribute =
  | RESOURCE_TYPE 
  | REGION 
  | TARGET_ID 
type nonrec get_compliance_summary_input =
  {
  pagination_token: string option ;
  max_results: int option ;
  group_by: group_by_attribute list option ;
  tag_key_filters: string list option ;
  resource_type_filters: string list option ;
  region_filters: string list option ;
  target_id_filters: string list option }
type nonrec describe_report_creation_output =
  {
  error_message: string option ;
  start_date: string option ;
  s3_location: string option ;
  status: string option }
type nonrec describe_report_creation_input = unit(** {1:builders Builders} *)

val make_failure_info :
  ?error_message:string ->
    ?error_code:error_code -> ?status_code:int -> unit -> failure_info
val make_untag_resources_output :
  ?failed_resources_map:failed_resources_map ->
    unit -> untag_resources_output
val make_untag_resources_input :
  tag_keys:string list ->
    resource_arn_list:string list -> unit -> untag_resources_input
val make_tag_resources_output :
  ?failed_resources_map:failed_resources_map -> unit -> tag_resources_output
val make_tag_resources_input :
  tags:tag_map ->
    resource_arn_list:string list -> unit -> tag_resources_input
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_filter :
  ?values:string list -> ?key:string -> unit -> tag_filter
val make_summary :
  ?non_compliant_resources:int ->
    ?resource_type:string ->
      ?region:string ->
        ?target_id_type:target_id_type ->
          ?target_id:string -> ?last_updated:string -> unit -> summary
val make_start_report_creation_output : unit -> start_report_creation_output
val make_start_report_creation_input :
  s3_bucket:string -> unit -> start_report_creation_input
val make_compliance_details :
  ?compliance_status:bool ->
    ?keys_with_noncompliant_values:string list ->
      ?noncompliant_keys:string list -> unit -> compliance_details
val make_resource_tag_mapping :
  ?compliance_details:compliance_details ->
    ?tags:tag list -> ?resource_ar_n:string -> unit -> resource_tag_mapping
val make_get_tag_values_output :
  ?tag_values:string list ->
    ?pagination_token:string -> unit -> get_tag_values_output
val make_get_tag_values_input :
  ?pagination_token:string -> key:string -> unit -> get_tag_values_input
val make_get_tag_keys_output :
  ?tag_keys:string list ->
    ?pagination_token:string -> unit -> get_tag_keys_output
val make_get_tag_keys_input :
  ?pagination_token:string -> unit -> get_tag_keys_input
val make_get_resources_output :
  ?resource_tag_mapping_list:resource_tag_mapping list ->
    ?pagination_token:string -> unit -> get_resources_output
val make_get_resources_input :
  ?resource_arn_list:string list ->
    ?exclude_compliant_resources:bool ->
      ?include_compliance_details:bool ->
        ?resource_type_filters:string list ->
          ?tags_per_page:int ->
            ?resources_per_page:int ->
              ?tag_filters:tag_filter list ->
                ?pagination_token:string -> unit -> get_resources_input
val make_get_compliance_summary_output :
  ?pagination_token:string ->
    ?summary_list:summary list -> unit -> get_compliance_summary_output
val make_get_compliance_summary_input :
  ?pagination_token:string ->
    ?max_results:int ->
      ?group_by:group_by_attribute list ->
        ?tag_key_filters:string list ->
          ?resource_type_filters:string list ->
            ?region_filters:string list ->
              ?target_id_filters:string list ->
                unit -> get_compliance_summary_input
val make_describe_report_creation_output :
  ?error_message:string ->
    ?start_date:string ->
      ?s3_location:string ->
        ?status:string -> unit -> describe_report_creation_output
val make_describe_report_creation_input :
  unit -> describe_report_creation_input(** {1:operations Operations} *)

module DescribeReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_report_creation_input ->
        (describe_report_creation_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Describes the status of the [StartReportCreation] operation.
    
     You can call this operation only from the organization's management account and from the us-east-1 Region.
      *)

  
end

module GetComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
      get_compliance_summary_input ->
        (get_compliance_summary_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns a table that shows counts of resources that are noncompliant with their tag policies.
    
     For more information on tag policies, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}Tag Policies} in the {i Organizations User Guide.}
     
      You can call this operation only from the organization's management account and from the us-east-1 Region.
      
       This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
        *)

  
end

module GetResources : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resources_input ->
        (get_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns all the tagged or previously tagged resources that are located in the specified Amazon Web Services Region for the account.
    
     Depending on what information you want returned, you can also specify the following:
     
      {ul
           {- {i Filters} that specify what tags and resource types you want returned. The response includes all tags that are associated with the requested resources.
              
              }
            {- Information about compliance with the account's effective tag policy. For more information on tag policies, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}Tag Policies} in the {i Organizations User Guide.}
               
               }
           
      }
       This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
        *)

  
end

module GetTagKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      get_tag_keys_input ->
        (get_tag_keys_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns all tag keys currently in use in the specified Amazon Web Services Region for the calling account.
    
     This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
      *)

  
end

module GetTagValues : sig
  val request :
    Smaws_Lib.Context.t ->
      get_tag_values_input ->
        (get_tag_values_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `PaginationTokenExpiredException of pagination_token_expired_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Returns all tag values for the specified key that are used in the specified Amazon Web Services Region for the calling account.
    
     This operation supports pagination, where the response can be sent in multiple pages. You should check the [PaginationToken] response parameter to determine if there are additional results available to return. Repeat the query, passing the [PaginationToken] response parameter value as an input to the next request until you recieve a [null] value. A null value for [PaginationToken] indicates that there are no more results waiting to be returned.
      *)

  
end

module StartReportCreation : sig
  val request :
    Smaws_Lib.Context.t ->
      start_report_creation_input ->
        (start_report_creation_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `ConstraintViolationException of constraint_violation_exception
            | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Generates a report that lists all tagged resources in the accounts across your organization and tells whether each resource is compliant with the effective tag policy. Compliance data is refreshed daily. The report is generated asynchronously.
    
     The generated report is saved to the following location:
     
      [s3://example-bucket/AwsTagPolicies/o-exampleorgid/YYYY-MM-ddTHH:mm:ssZ/report.csv]
      
       You can call this operation only from the organization's management account and from the us-east-1 Region.
        *)

  
end

module TagResources : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resources_input ->
        (tag_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Applies one or more tags to the specified resources. Note the following:
    
     {ul
          {- Not all resources can have tags. For a list of services with resources that support tagging using this operation, see {{:https://docs.aws.amazon.com/resourcegroupstagging/latest/APIReference/supported-services.html}Services that support the Resource Groups Tagging API}. If the resource doesn't yet support this operation, the resource's service might support tagging using its own API operations. For more information, refer to the documentation for that service.
             
             }
           {- Each resource can have up to 50 tags. For other limits, see {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html#tag-conventions}Tag Naming and Usage Conventions} in the {i Amazon Web Services General Reference.}
              
              }
           {- You can only tag resources that are located in the specified Amazon Web Services Region for the Amazon Web Services account.
              
              }
           {- To add tags to a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for adding tags. For more information, see the documentation for each service.
              
              }
          
      }
       Do not store personally identifiable information (PII) or other confidential or sensitive information in tags. We use tags to provide you with billing and administration services. Tags are not intended to be used for private or sensitive data.
       
        {b Minimum permissions}
        
         In addition to the [tag:TagResources] permission required by this operation, you must also have the tagging permission defined by the service that created the resource. For example, to tag an Amazon EC2 instance using the [TagResources] operation, you must have both of the following permissions:
         
          {ul
               {- [tag:TagResource]
                  
                  }
                {- [ec2:CreateTags]
                   
                   }
               
      }
       *)

  
end

module UntagResources : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resources_input ->
        (untag_resources_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalServiceException of internal_service_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ThrottledException of throttled_exception
            
        ]
      ) result
  (** 
    Removes the specified tags from the specified resources. When you specify a tag key, the action removes both that key and its associated value. The operation succeeds even if you attempt to remove tags from a resource that were already removed. Note the following:
    
     {ul
          {- To remove tags from a resource, you need the necessary permissions for the service that the resource belongs to as well as permissions for removing tags. For more information, see the documentation for the service whose resource you want to untag.
             
             }
           {- You can only tag resources that are located in the specified Amazon Web Services Region for the calling Amazon Web Services account.
              
              }
          
      }
       {b Minimum permissions}
       
        In addition to the [tag:UntagResources] permission required by this operation, you must also have the remove tags permission defined by the service that created the resource. For example, to remove the tags from an Amazon EC2 instance using the [UntagResources] operation, you must have both of the following permissions:
        
         {ul
              {- [tag:UntagResource]
                 
                 }
               {- [ec2:DeleteTags]
                  
                  }
              
      }
       *)

  
end

