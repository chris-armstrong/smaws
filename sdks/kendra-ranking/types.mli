type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The input fails to satisfy the constraints set by the Amazon Kendra Intelligent Ranking \
   service. Please provide the correct input and try again.\n"]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request was denied due to request throttling. Please reduce the number of requests and try \
   again.\n"]

type nonrec service_quota_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You have exceeded the set limits for your Amazon Kendra Intelligent Ranking service. Please see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas} for more information, or \
   contact {{:http://aws.amazon.com/contact-us/}Support} to inquire about an increase of limits.\n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource you want to use doesn't exist. Please check you have provided the correct resource \
   and try again.\n"]

type nonrec internal_server_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An issue occurred with the internal server used for your Amazon Kendra Intelligent Ranking \
   service. Please wait a few minutes and try again, or contact \
   {{:http://aws.amazon.com/contact-us/}Support} for help.\n"]

type nonrec conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A conflict occurred with the request. Please fix any inconsistencies with your resources and \
   try again.\n"]

type nonrec access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You don\226\128\153t have sufficient access to perform this action. Please ensure you have the \
   required permission policies and user accounts and try again.\n"]

type nonrec rescore_capacity_unit = int [@@ocaml.doc ""]

type nonrec capacity_units_configuration = {
  rescore_capacity_units : rescore_capacity_unit;
      [@ocaml.doc
        "The amount of extra capacity for your rescore execution plan.\n\n\
        \ A single extra capacity unit for a rescore execution plan provides 0.01 rescore requests \
         per second. You can add up to 1000 extra capacity units.\n\
        \ "]
}
[@@ocaml.doc
  "Sets additional capacity units configured for your rescore execution plan. A rescore execution \
   plan is an Amazon Kendra Intelligent Ranking resource used for provisioning the [Rescore] API. \
   You can add and remove capacity units to fit your usage requirements.\n"]

type nonrec description = string [@@ocaml.doc ""]

type nonrec rescore_execution_plan_name = string [@@ocaml.doc ""]

type nonrec rescore_execution_plan_id = string [@@ocaml.doc ""]

type nonrec update_rescore_execution_plan_request = {
  id : rescore_execution_plan_id;
      [@ocaml.doc "The identifier of the rescore execution plan that you want to update.\n"]
  name : rescore_execution_plan_name option;
      [@ocaml.doc "A new name for the rescore execution plan.\n"]
  description : description option;
      [@ocaml.doc "A new description for the rescore execution plan.\n"]
  capacity_units : capacity_units_configuration option;
      [@ocaml.doc
        "You can set additional capacity units to meet the needs of your rescore execution plan. \
         You are given a single capacity unit by default. If you want to use the default capacity, \
         you don't set additional capacity units. For more information on the default capacity and \
         additional capacity units, see \
         {{:https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html}Adjusting \
         capacity}.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_unavailable_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The resource you want to use is unavailable. Please check you have provided the correct \
   resource information and try again.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rescore execution plan to remove the tag.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        "A list of tag keys to remove from the rescore execution plan. If a tag key does not exist \
         on the resource, it is ignored.\n"]
}
[@@ocaml.doc
  "The request information to remove a tag from a rescore execution plan. A rescore execution plan \
   is an Amazon Kendra Intelligent Ranking resource used for provisioning the [Rescore] API.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc "The key for the tag. Keys are not case sensitive and must be unique.\n"]
  value : tag_value;
      [@ocaml.doc
        "The value associated with the tag. The value can be an empty string but it can't be null.\n"]
}
[@@ocaml.doc
  "A key-value pair that identifies or categorizes a rescore execution plan. A rescore execution \
   plan is an Amazon Kendra Intelligent Ranking resource used for provisioning the [Rescore] API. \
   You can also use a tag to help control access to a rescore execution plan. A tag key and value \
   can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / \
   = + - \\@.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rescore execution plan to tag.\n"]
  tags : tag_list;
      [@ocaml.doc
        "A list of tag keys to add to a rescore execution plan. If a tag already exists, the \
         existing value is replaced with the new value.\n"]
}
[@@ocaml.doc
  "The request information for tagging a rescore execution plan. A rescore execution plan is an \
   Amazon Kendra Intelligent Ranking resource used for provisioning the [Rescore] API.\n"]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec document_id = string [@@ocaml.doc ""]

type nonrec rescore_result_item = {
  document_id : document_id option;
      [@ocaml.doc "The identifier of the document from the search service.\n"]
  score : float_ option;
      [@ocaml.doc
        "The relevancy score or rank that Amazon Kendra Intelligent Ranking gives to the result.\n"]
}
[@@ocaml.doc "A result item for a document with a new relevancy score.\n"]

type nonrec rescore_result_item_list = rescore_result_item list [@@ocaml.doc ""]

type nonrec rescore_id = string [@@ocaml.doc ""]

type nonrec rescore_result = {
  rescore_id : rescore_id option;
      [@ocaml.doc
        "The identifier associated with the scores that Amazon Kendra Intelligent Ranking gives to \
         the results. Amazon Kendra Intelligent Ranking rescores or re-ranks the results for the \
         search service.\n"]
  result_items : rescore_result_item_list option;
      [@ocaml.doc
        "A list of result items for documents with new relevancy scores. The results are in \
         descending order.\n"]
}
[@@ocaml.doc ""]

type nonrec tokens = string [@@ocaml.doc ""]

type nonrec body_tokens_list = tokens list [@@ocaml.doc ""]

type nonrec title_tokens_list = tokens list [@@ocaml.doc ""]

type nonrec document_body = string [@@ocaml.doc ""]

type nonrec document_title = string [@@ocaml.doc ""]

type nonrec group_id = string [@@ocaml.doc ""]

type nonrec document = {
  id : document_id; [@ocaml.doc "The identifier of the document from the search service.\n"]
  group_id : group_id option;
      [@ocaml.doc
        "The optional group identifier of the document from the search service. Documents with the \
         same group identifier are grouped together and processed as one document within the \
         service.\n"]
  title : document_title option; [@ocaml.doc "The title of the search service's document.\n"]
  body : document_body option; [@ocaml.doc "The body text of the search service's document.\n"]
  tokenized_title : title_tokens_list option;
      [@ocaml.doc
        "The title of the search service's document represented as a list of tokens or words. You \
         must choose to provide [Title] or [TokenizedTitle]. You cannot provide both.\n"]
  tokenized_body : body_tokens_list option;
      [@ocaml.doc
        "The body text of the search service's document represented as a list of tokens or words. \
         You must choose to provide [Body] or [TokenizedBody]. You cannot provide both.\n"]
  original_score : float_;
      [@ocaml.doc
        "The original document score or rank from the search service. Amazon Kendra Intelligent \
         Ranking gives the document a new score or rank based on its intelligent search algorithms.\n"]
}
[@@ocaml.doc
  "Information about a document from a search service such as OpenSearch (self managed). Amazon \
   Kendra Intelligent Ranking uses this information to rank and score on.\n"]

type nonrec document_list = document list [@@ocaml.doc ""]

type nonrec search_query = string [@@ocaml.doc ""]

type nonrec rescore_request = {
  rescore_execution_plan_id : rescore_execution_plan_id;
      [@ocaml.doc
        "The identifier of the rescore execution plan. A rescore execution plan is an Amazon \
         Kendra Intelligent Ranking resource used for provisioning the [Rescore] API.\n"]
  search_query : search_query; [@ocaml.doc "The input query from the search service.\n"]
  documents : document_list;
      [@ocaml.doc
        "The list of documents for Amazon Kendra Intelligent Ranking to rescore or rank on.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "A list of tags associated with the rescore execution plan.\n"]
}
[@@ocaml.doc "If the action is successful, the service sends back an HTTP 200 response.\n"]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rescore execution plan to get a list of tags for.\n"]
}
[@@ocaml.doc
  "The request information for listing tags associated with a rescore execution plan. A rescore \
   execution plan is an Amazon Kendra Intelligent Ranking resource used for provisioning the \
   [Rescore] API.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec rescore_execution_plan_status =
  | CREATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec rescore_execution_plan_summary = {
  name : rescore_execution_plan_name option;
      [@ocaml.doc "The name of the rescore execution plan.\n"]
  id : rescore_execution_plan_id option;
      [@ocaml.doc "The identifier of the rescore execution plan.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp when the rescore execution plan was created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp when the rescore execution plan was last updated.\n"]
  status : rescore_execution_plan_status option;
      [@ocaml.doc
        "The current status of the rescore execution plan. When the value is [ACTIVE], the rescore \
         execution plan is ready for use.\n"]
}
[@@ocaml.doc
  "Summary information for a rescore execution plan. A rescore execution plan is an Amazon Kendra \
   Intelligent Ranking resource used for provisioning the [Rescore] API.\n"]

type nonrec rescore_execution_plan_summary_list = rescore_execution_plan_summary list
[@@ocaml.doc ""]

type nonrec list_rescore_execution_plans_response = {
  summary_items : rescore_execution_plan_summary_list option;
      [@ocaml.doc "An array of summary information for one or more rescore execution plans.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Kendra Intelligent Ranking returns a pagination \
         token in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_integer_for_list_rescore_execution_plans_request = int [@@ocaml.doc ""]

type nonrec list_rescore_execution_plans_request = {
  next_token : next_token option;
      [@ocaml.doc
        "If the response is truncated, Amazon Kendra Intelligent Ranking returns a pagination \
         token in the response. You can use this pagination token to retrieve the next set of \
         rescore execution plans.\n"]
  max_results : max_results_integer_for_list_rescore_execution_plans_request option;
      [@ocaml.doc "The maximum number of rescore execution plans to return.\n"]
}
[@@ocaml.doc ""]

type nonrec rescore_execution_plan_arn = string [@@ocaml.doc ""]

type nonrec describe_rescore_execution_plan_response = {
  id : rescore_execution_plan_id option;
      [@ocaml.doc "The identifier of the rescore execution plan.\n"]
  arn : rescore_execution_plan_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rescore execution plan.\n"]
  name : rescore_execution_plan_name option;
      [@ocaml.doc "The name for the rescore execution plan.\n"]
  description : description option; [@ocaml.doc "The description for the rescore execution plan.\n"]
  capacity_units : capacity_units_configuration option;
      [@ocaml.doc
        "The capacity units set for the rescore execution plan. A capacity of zero indicates that \
         the rescore execution plan is using the default capacity. For more information on the \
         default capacity and additional capacity units, see \
         {{:https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html}Adjusting \
         capacity}.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The Unix timestamp of when the rescore execution plan was created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The Unix timestamp of when the rescore execution plan was last updated.\n"]
  status : rescore_execution_plan_status option;
      [@ocaml.doc
        "The current status of the rescore execution plan. When the value is [ACTIVE], the rescore \
         execution plan is ready for use. If the [Status] field value is [FAILED], the \
         [ErrorMessage] field contains a message that explains why.\n"]
  error_message : error_message option;
      [@ocaml.doc
        "When the [Status] field value is [FAILED], the [ErrorMessage] field contains a message \
         that explains why.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_rescore_execution_plan_request = {
  id : rescore_execution_plan_id;
      [@ocaml.doc
        "The identifier of the rescore execution plan that you want to get information on.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rescore_execution_plan_request = {
  id : rescore_execution_plan_id;
      [@ocaml.doc "The identifier of the rescore execution plan that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rescore_execution_plan_response = {
  id : rescore_execution_plan_id; [@ocaml.doc "The identifier of the rescore execution plan.\n"]
  arn : rescore_execution_plan_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rescore execution plan.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token_name = string [@@ocaml.doc ""]

type nonrec create_rescore_execution_plan_request = {
  name : rescore_execution_plan_name; [@ocaml.doc "A name for the rescore execution plan.\n"]
  description : description option; [@ocaml.doc "A description for the rescore execution plan.\n"]
  capacity_units : capacity_units_configuration option;
      [@ocaml.doc
        "You can set additional capacity units to meet the needs of your rescore execution plan. \
         You are given a single capacity unit by default. If you want to use the default capacity, \
         you don't set additional capacity units. For more information on the default capacity and \
         additional capacity units, see \
         {{:https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html}Adjusting \
         capacity}.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of key-value pairs that identify or categorize your rescore execution plan. You \
         can also use tags to help control access to the rescore execution plan. Tag keys and \
         values can consist of Unicode letters, digits, white space, and any of the following \
         symbols: _ . : / = + - \\@.\n"]
  client_token : client_token_name option;
      [@ocaml.doc
        "A token that you provide to identify the request to create a rescore execution plan. \
         Multiple calls to the [CreateRescoreExecutionPlanRequest] API with the same client token \
         will create only one rescore execution plan.\n"]
}
[@@ocaml.doc ""]
