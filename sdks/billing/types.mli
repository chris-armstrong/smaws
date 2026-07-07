type nonrec value = string [@@ocaml.doc ""]

type nonrec values = value list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec field_name = string [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : error_message; [@ocaml.doc "The message describing why the field failed validation.\n"]
  name : field_name; [@ocaml.doc "The name of the field.\n"]
}
[@@ocaml.doc "The field's information of a request that resulted in an exception. \n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc
        "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]
  reason : validation_exception_reason;
      [@ocaml.doc
        "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service. \n"]

type nonrec billing_view_arn = string [@@ocaml.doc ""]

type nonrec update_billing_view_response = {
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The time when the billing view was last updated. \n"]
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec billing_view_name = string [@@ocaml.doc ""]

type nonrec billing_view_description = string [@@ocaml.doc ""]

type nonrec dimension = LINKED_ACCOUNT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec dimension_values = {
  values : values;
      [@ocaml.doc " The metadata values that you can use to filter and group your results. \n"]
  key : dimension;
      [@ocaml.doc
        " The names of the metadata types that you can use to filter and group your results. \n"]
}
[@@ocaml.doc " The metadata that you can use to filter and group your results. \n"]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_values = {
  values : values; [@ocaml.doc " The specific value of the tag. \n"]
  key : tag_key; [@ocaml.doc " The key for the tag. \n"]
}
[@@ocaml.doc " The values that are available for a tag. \n"]

type nonrec cost_category_name = string [@@ocaml.doc ""]

type nonrec cost_category_values = {
  values : values; [@ocaml.doc " The specific value of the Cost Category. \n"]
  key : cost_category_name; [@ocaml.doc " The unique name of the Cost Category. \n"]
}
[@@ocaml.doc " The Cost Categories values used for filtering the costs. \n"]

type nonrec time_range = {
  end_date_inclusive : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The inclusive end date of the time range. \n"]
  begin_date_inclusive : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The inclusive start date of the time range. \n"]
}
[@@ocaml.doc " Specifies a time range with inclusive begin and end dates. \n"]

type nonrec expression = {
  time_range : time_range option;
      [@ocaml.doc " Specifies a time range filter for the billing view data. \n"]
  cost_categories : cost_category_values option;
      [@ocaml.doc " The filter that's based on [CostCategory] values. \n"]
  tags : tag_values option; [@ocaml.doc " The specific [Tag] to use for [Expression]. \n"]
  dimensions : dimension_values option;
      [@ocaml.doc " The specific [Dimension] to use for [Expression]. \n"]
}
[@@ocaml.doc
  " See \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html}Expression}. \
   Billing view only supports [LINKED_ACCOUNT], [Tags], and [CostCategories]. \n"]

type nonrec update_billing_view_request = {
  data_filter_expression : expression option;
      [@ocaml.doc
        "See \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html}Expression}. \
         Billing view only supports [LINKED_ACCOUNT], [Tags], and [CostCategories]. \n"]
  description : billing_view_description option;
      [@ocaml.doc " The description of the billing view. \n"]
  name : billing_view_name option; [@ocaml.doc " The name of the billing view. \n"]
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling. \n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec service_code = string [@@ocaml.doc ""]

type nonrec quota_code = string [@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  quota_code : quota_code; [@ocaml.doc " The container for the [quotaCode]. \n"]
  service_code : service_code; [@ocaml.doc " The container for the [serviceCode]. \n"]
  resource_type : resource_type; [@ocaml.doc " The type of Amazon Web Services resource. \n"]
  resource_id : resource_id; [@ocaml.doc " The ID of the resource. \n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  " You've reached the limit of resources you can create, or exceeded the size of an individual \
   resource. \n"]

type nonrec resource_not_found_exception = {
  resource_type : resource_type;
      [@ocaml.doc " Value is the type of resource that was not found. \n"]
  resource_id : resource_id; [@ocaml.doc " Value is a list of resource IDs that were not found. \n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc " The specified ARN in the request doesn't exist. \n"]

type nonrec internal_server_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc "The request processing failed because of an unknown error, exception, or failure. \n"]

type nonrec conflict_exception = {
  resource_type : resource_type;
      [@ocaml.doc " The type of resource associated with the request. \n"]
  resource_id : resource_id;
      [@ocaml.doc " The identifier for the service resource associated with the request. \n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The requested operation would cause a conflict with the current state of a service resource \
   associated with the request. Resolve the conflict before retrying this request. \n"]

type nonrec billing_view_health_status_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc
  " Exception thrown when a billing view's health status prevents an operation from being \
   performed. This may occur if the billing view is in a state other than [HEALTHY].\n"]

type nonrec access_denied_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc "You don't have sufficient access to perform this action.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec resource_tag_key = string [@@ocaml.doc ""]

type nonrec resource_tag_key_list = resource_tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_tag_keys : resource_tag_key_list;
      [@ocaml.doc " A list of tag key value pairs that are associated with the resource. \n"]
  resource_arn : resource_arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_value = string [@@ocaml.doc ""]

type nonrec resource_tag = {
  value : resource_tag_value option; [@ocaml.doc " The value that's associated with the tag. \n"]
  key : resource_tag_key; [@ocaml.doc " The key that's associated with the tag. \n"]
}
[@@ocaml.doc " The tag structure that contains a tag key and value. \n"]

type nonrec resource_tag_list = resource_tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_tags : resource_tag_list;
      [@ocaml.doc " A list of tag key value pairs that are associated with the resource. \n"]
  resource_arn : resource_arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec search_option = STARTS_WITH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec search_value = string [@@ocaml.doc ""]

type nonrec string_search = {
  search_value : search_value;
      [@ocaml.doc
        " The string value to use in the search operation. This value is compared against the \
         target field using the specified search option. \n"]
  search_option : search_option;
      [@ocaml.doc
        " The type of search operation to perform on the string value. Determines how the search \
         value is matched against the target field. \n"]
}
[@@ocaml.doc
  " A structure that defines how to search for string values. You can specify a search option and \
   the value to search for. \n"]

type nonrec string_searches = string_search list [@@ocaml.doc ""]

type nonrec policy_document = string [@@ocaml.doc ""]

type nonrec page_token = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc " A list of tag key value pairs that are associated with the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : resource_arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec billing_view_source_views_list = billing_view_arn list [@@ocaml.doc ""]

type nonrec list_source_views_for_billing_view_response = {
  next_token : page_token option;
      [@ocaml.doc
        " The pagination token that is used on subsequent calls to list billing views. \n"]
  source_views : billing_view_source_views_list;
      [@ocaml.doc "A list of billing views used as the data source for the custom billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec billing_views_max_results = int [@@ocaml.doc ""]

type nonrec list_source_views_for_billing_view_request = {
  next_token : page_token option;
      [@ocaml.doc
        " The pagination token that is used on subsequent calls to list billing views. \n"]
  max_results : billing_views_max_results option;
      [@ocaml.doc " The number of entries a paginated response contains. \n"]
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec billing_view_type =
  | BILLING_TRANSFER_SHOWBACK [@ocaml.doc ""]
  | BILLING_TRANSFER [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
  | BILLING_GROUP [@ocaml.doc ""]
  | PRIMARY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec billing_view_status =
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | UNHEALTHY [@ocaml.doc ""]
  | HEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec billing_view_status_reason =
  | VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT [@ocaml.doc ""]
  | AGGREGATE_SOURCE [@ocaml.doc ""]
  | SOURCE_VIEW_DEPTH_EXCEEDED [@ocaml.doc ""]
  | CYCLIC_DEPENDENCY [@ocaml.doc ""]
  | SOURCE_VIEW_NOT_FOUND [@ocaml.doc ""]
  | SOURCE_VIEW_ACCESS_DENIED [@ocaml.doc ""]
  | SOURCE_VIEW_UPDATING [@ocaml.doc ""]
  | SOURCE_VIEW_UNHEALTHY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec billing_view_status_reasons = billing_view_status_reason list [@@ocaml.doc ""]

type nonrec billing_view_health_status = {
  status_reasons : billing_view_status_reasons option;
      [@ocaml.doc "A list of reasons explaining the current health status, if applicable.\n"]
  status_code : billing_view_status option;
      [@ocaml.doc "The current health status code of the billing view.\n"]
}
[@@ocaml.doc
  " Represents the health status of a billing view, including a status code and optional reasons \
   for the status. \n"]

type nonrec billing_view_list_element = {
  health_status : billing_view_health_status option;
      [@ocaml.doc " The current health status of the billing view. \n"]
  billing_view_type : billing_view_type option; [@ocaml.doc "The type of billing view.\n"]
  source_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID that owns the source billing view, if this is a \
         derived billing view. \n"]
  owner_account_id : account_id option; [@ocaml.doc " The list of owners of the Billing view. \n"]
  description : billing_view_description option;
      [@ocaml.doc " The description of the billing view. \n"]
  name : billing_view_name option; [@ocaml.doc " A list of names of the Billing view. \n"]
  arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc "A representation of a billing view.\n"]

type nonrec billing_view_list = billing_view_list_element list [@@ocaml.doc ""]

type nonrec list_billing_views_response = {
  next_token : page_token option;
      [@ocaml.doc "The pagination token to use on subsequent calls to list billing views. \n"]
  billing_views : billing_view_list; [@ocaml.doc "A list of [BillingViewListElement] retrieved.\n"]
}
[@@ocaml.doc ""]

type nonrec active_time_range = {
  active_before_inclusive : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc " The inclusive time range end date. \n"]
  active_after_inclusive : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The inclusive time range start date.\n"]
}
[@@ocaml.doc "A time range with a start and end time.\n"]

type nonrec billing_view_arn_list = billing_view_arn list [@@ocaml.doc ""]

type nonrec billing_view_type_list = billing_view_type list [@@ocaml.doc ""]

type nonrec list_billing_views_request = {
  next_token : page_token option;
      [@ocaml.doc "The pagination token that is used on subsequent calls to list billing views.\n"]
  max_results : billing_views_max_results option;
      [@ocaml.doc "The maximum number of billing views to retrieve. Default is 100. \n"]
  source_account_id : account_id option;
      [@ocaml.doc
        " Filters the results to include only billing views that use the specified account as a \
         source. \n"]
  owner_account_id : account_id option; [@ocaml.doc " The list of owners of the billing view. \n"]
  names : string_searches option;
      [@ocaml.doc
        " Filters the list of billing views by name. You can specify search criteria to match \
         billing view names based on the search option provided. \n"]
  billing_view_types : billing_view_type_list option; [@ocaml.doc "The type of billing view.\n"]
  arns : billing_view_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
  active_time_range : active_time_range option;
      [@ocaml.doc
        " The time range for the billing views listed. [PRIMARY] billing view is always listed. \
         [BILLING_GROUP] billing views are listed for time ranges when the associated billing \
         group resource in Billing Conductor is active. The time range must be within one calendar \
         month. \n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_response = {
  policy : policy_document option;
      [@ocaml.doc
        "The resource-based policy document attached to the resource in [JSON] format. \n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the billing view resource to which the policy is \
         attached to. \n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the billing view resource to which the policy is \
         attached to. \n"]
}
[@@ocaml.doc ""]

type nonrec billing_view_element = {
  health_status : billing_view_health_status option;
      [@ocaml.doc " The current health status of the billing view. \n"]
  view_definition_last_updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp of when the billing view definition was last updated. \n"]
  source_view_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc " The number of source views associated with this billing view. \n"]
  derived_view_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc " The number of billing views that use this billing view as a source. \n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the billing view was last updated. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the billing view was created. \n"]
  data_filter_expression : expression option;
      [@ocaml.doc
        " See \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html}Expression}. \
         Billing view only supports [LINKED_ACCOUNT], [Tags], and [CostCategories]. \n"]
  source_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID that owns the source billing view, if this is a \
         derived billing view. \n"]
  owner_account_id : account_id option; [@ocaml.doc "The account owner of the billing view. \n"]
  billing_view_type : billing_view_type option; [@ocaml.doc "The type of billing group. \n"]
  description : billing_view_description option;
      [@ocaml.doc " The description of the billing view. \n"]
  name : billing_view_name option; [@ocaml.doc " The account name of the billing view. \n"]
  arn : billing_view_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc "The metadata associated to the billing view. \n"]

type nonrec get_billing_view_response = {
  billing_view : billing_view_element;
      [@ocaml.doc "The billing view element associated with the specified ARN. \n"]
}
[@@ocaml.doc ""]

type nonrec get_billing_view_request = {
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_source_views_response = {
  arn : billing_view_arn;
      [@ocaml.doc " The ARN of the billing view that the source views were disassociated from. \n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_source_views_request = {
  source_views : billing_view_source_views_list;
      [@ocaml.doc " A list of ARNs of the source billing views to disassociate. \n"]
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the billing view to disassociate source views from. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_billing_view_response = {
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_billing_view_request = {
  force : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        " If set to true, forces deletion of the billing view even if it has derived resources \
         (e.g. other billing views or budgets). Use with caution as this may break dependent \
         resources. \n"]
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec create_billing_view_response = {
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The time when the billing view was created. \n"]
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) that can be used to uniquely identify the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec create_billing_view_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "A list of key value map specifying tags associated to the billing view being created. \n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier you specify to ensure idempotency of the request. \
         Idempotency ensures that an API request completes no more than one time. If the original \
         request completes successfully, any subsequent retries complete successfully without \
         performing any further actions with an idempotent request. \n"]
  data_filter_expression : expression option;
      [@ocaml.doc
        " See \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_billing_Expression.html}Expression}. \
         Billing view only supports [LINKED_ACCOUNT], [Tags], and [CostCategories]. \n"]
  source_views : billing_view_source_views_list;
      [@ocaml.doc "A list of billing views used as the data source for the custom billing view.\n"]
  description : billing_view_description option;
      [@ocaml.doc " The description of the billing view. \n"]
  name : billing_view_name; [@ocaml.doc " The name of the billing view. \n"]
}
[@@ocaml.doc ""]

type nonrec associate_source_views_response = {
  arn : billing_view_arn;
      [@ocaml.doc " The ARN of the billing view that the source views were associated with. \n"]
}
[@@ocaml.doc ""]

type nonrec associate_source_views_request = {
  source_views : billing_view_source_views_list;
      [@ocaml.doc " A list of ARNs of the source billing views to associate. \n"]
  arn : billing_view_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the billing view to associate source views with. \n"]
}
[@@ocaml.doc ""]
