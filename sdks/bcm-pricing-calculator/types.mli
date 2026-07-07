type nonrec workload_estimate_usage_quantity = {
  amount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The numeric value of the usage quantity. \n"]
  unit_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The unit of measurement for the usage quantity. \n"]
}
[@@ocaml.doc " Represents a usage quantity for a workload estimate. \n"]

type nonrec workload_estimate_usage_max_results = int [@@ocaml.doc ""]

type nonrec service_code = string [@@ocaml.doc ""]

type nonrec usage_type = string [@@ocaml.doc ""]

type nonrec operation = string [@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec usage_group = string [@@ocaml.doc ""]

type nonrec currency_code = USD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec workload_estimate_cost_status =
  | STALE [@ocaml.doc ""]
  | INVALID [@ocaml.doc ""]
  | VALID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec bill_interval = {
  end_ : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The end date and time of the interval. \n"]
  start : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The start date and time of the interval. \n"]
}
[@@ocaml.doc " Represents a time interval for a bill or estimate. \n"]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec expression_filter = {
  values : string_list option; [@ocaml.doc " The values to match against. \n"]
  match_options : string_list option;
      [@ocaml.doc " The match options for the filter (e.g., equals, contains). \n"]
  key : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The key or attribute to filter on. \n"]
}
[@@ocaml.doc " Represents a filter used within an expression. \n"]

type expression = {
  tags : expression_filter option; [@ocaml.doc " Filters based on resource tags. \n"]
  dimensions : expression_filter option;
      [@ocaml.doc " Filters based on dimensions (e.g., service, operation). \n"]
  cost_categories : expression_filter option; [@ocaml.doc " Filters based on cost categories. \n"]
  not : expression option; [@ocaml.doc " An expression to be negated. \n"]
  \#or : expression_list option;
      [@ocaml.doc " A list of expressions to be combined with OR logic. \n"]
  and_ : expression_list option;
      [@ocaml.doc " A list of expressions to be combined with AND logic. \n"]
}
[@@ocaml.doc " Represents a complex filtering expression for cost and usage data. \n"]

and expression_list = expression list [@@ocaml.doc ""]

type nonrec historical_usage_entity = {
  filter_expression : expression;
      [@ocaml.doc " An optional filter expression to apply to the historical usage data. \n"]
  bill_interval : bill_interval; [@ocaml.doc " The time interval for the historical usage data. \n"]
  usage_account_id : account_id;
      [@ocaml.doc " The Amazon Web Services account ID associated with the usage. \n"]
  location : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The location associated with the usage. \n"]
  operation : operation; [@ocaml.doc " The specific operation associated with the usage. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code associated with the usage. \n"]
}
[@@ocaml.doc " Represents historical usage data for a specific entity. \n"]

type nonrec workload_estimate_usage_item = {
  historical_usage : historical_usage_entity option;
      [@ocaml.doc " Historical usage data associated with this item, if available. \n"]
  status : workload_estimate_cost_status option;
      [@ocaml.doc " The current status of this usage item. \n"]
  currency : currency_code option; [@ocaml.doc " The currency of the estimated cost. \n"]
  cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The estimated cost for this usage item. \n"]
  quantity : workload_estimate_usage_quantity option;
      [@ocaml.doc " The estimated usage quantity for this item. \n"]
  group : usage_group option; [@ocaml.doc " The group identifier for this usage item. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID associated with this usage item. \n"]
  id : resource_id option; [@ocaml.doc " The unique identifier of this usage item. \n"]
  location : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The location associated with this usage item. \n"]
  operation : operation; [@ocaml.doc " The specific operation associated with this usage item. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage for this item. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code associated with this usage item. \n"]
}
[@@ocaml.doc " Represents a usage item in a workload estimate. \n"]

type nonrec workload_estimate_usage_items = workload_estimate_usage_item list [@@ocaml.doc ""]

type nonrec workload_estimate_usage = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec workload_estimate_update_usage_error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workload_estimate_name = string [@@ocaml.doc ""]

type nonrec workload_estimate_rate_type =
  | AFTER_DISCOUNTS_AND_COMMITMENTS [@ocaml.doc ""]
  | AFTER_DISCOUNTS [@ocaml.doc ""]
  | BEFORE_DISCOUNTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workload_estimate_status =
  | ACTION_NEEDED [@ocaml.doc ""]
  | INVALID [@ocaml.doc ""]
  | VALID [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec workload_estimate_summary = {
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the workload estimate creation or processing failed. \n"]
  cost_currency : currency_code option; [@ocaml.doc " The currency of the estimated cost. \n"]
  total_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The total estimated cost for the workload. \n"]
  status : workload_estimate_status option;
      [@ocaml.doc " The current status of the workload estimate. \n"]
  rate_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp of the pricing rates used for the estimate. \n"]
  rate_type : workload_estimate_rate_type option;
      [@ocaml.doc " The type of pricing rates used for the estimate. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the workload estimate will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the workload estimate was created. \n"]
  name : workload_estimate_name option; [@ocaml.doc " The name of the workload estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the workload estimate. \n"]
}
[@@ocaml.doc " Provides a summary of a workload estimate. \n"]

type nonrec workload_estimate_summaries = workload_estimate_summary list [@@ocaml.doc ""]

type nonrec workload_estimate = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | DISALLOWED_RATE [@ocaml.doc ""]
  | INVALID_REQUEST_FROM_MEMBER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The error message describing why the field failed validation. \n"]
  name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The name of the field that failed validation. \n"]
}
[@@ocaml.doc " Represents a field that failed validation in a request. \n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc " The list of fields that are invalid. \n"]
  reason : validation_exception_reason option;
      [@ocaml.doc " The reason for the validation exception. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The input provided fails to satisfy the constraints specified by an Amazon Web Services \
   service. \n"]

type nonrec uuid = string [@@ocaml.doc ""]

type nonrec usage_quantity_result = {
  unit_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The unit of measurement for the usage quantity result. \n"]
  amount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The numeric value of the usage quantity result. \n"]
}
[@@ocaml.doc " Represents the result of a usage quantity calculation. \n"]

type nonrec usage_quantity = {
  amount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The numeric value of the usage quantity. \n"]
  unit_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The unit of measurement for the usage quantity. \n"]
  start_hour : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The start hour of the usage period. \n"]
}
[@@ocaml.doc " Represents a usage quantity with associated unit and time period. \n"]

type nonrec usage_quantities = usage_quantity list [@@ocaml.doc ""]

type nonrec usage_amount = {
  amount : Smaws_Lib.Smithy_api.Types.double; [@ocaml.doc " The usage amount for the period. \n"]
  start_hour : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc " The start hour of the usage period. \n"]
}
[@@ocaml.doc " Represents a usage amount for a specific time period. \n"]

type nonrec usage_amounts = usage_amount list [@@ocaml.doc ""]

type nonrec update_workload_estimate_response = {
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the workload estimate update failed. \n"]
  cost_currency : currency_code option;
      [@ocaml.doc " The currency of the updated estimated cost. \n"]
  total_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The updated total estimated cost for the workload. \n"]
  status : workload_estimate_status option;
      [@ocaml.doc " The current status of the updated workload estimate. \n"]
  rate_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp of the pricing rates used for the updated estimate. \n"]
  rate_type : workload_estimate_rate_type option;
      [@ocaml.doc " The type of pricing rates used for the updated estimate. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The updated expiration timestamp for the workload estimate. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the workload estimate was originally created. \n"]
  name : workload_estimate_name option;
      [@ocaml.doc " The updated name of the workload estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the updated workload estimate. \n"]
}
[@@ocaml.doc "Mixin for common fields returned by CRUD APIs"]

type nonrec update_workload_estimate_request = {
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The new expiration date for the workload estimate. \n"]
  name : workload_estimate_name option; [@ocaml.doc " The new name for the workload estimate. \n"]
  identifier : resource_id;
      [@ocaml.doc " The unique identifier of the workload estimate to update. \n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The type of the resource that was not found. \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The identifier of the resource that was not found. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc " The specified resource was not found. \n"]

type nonrec data_unavailable_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc " The requested data is currently unavailable. \n"]

type nonrec conflict_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The type of the resource that was not found. \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The identifier of the resource that was not found. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The request could not be processed because of conflict in the current state of the resource. \n"]

type nonrec rate_type =
  | AFTER_DISCOUNTS_AND_COMMITMENTS [@ocaml.doc ""]
  | AFTER_DISCOUNTS [@ocaml.doc ""]
  | BEFORE_DISCOUNTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rate_types = rate_type list [@@ocaml.doc ""]

type nonrec update_preferences_response = {
  standalone_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The updated preferred rate types for a standalone account. \n"]
  member_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The updated preferred rate types for member accounts. \n"]
  management_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The updated preferred rate types for the management account. \n"]
}
[@@ocaml.doc ""]

type nonrec update_preferences_request = {
  standalone_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The updated preferred rate types for a standalone account. \n"]
  member_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The updated preferred rate types for member accounts. \n"]
  management_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The updated preferred rate types for the management account. \n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The quota code that was exceeded. \n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The service code that exceeded quota. \n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The type of the resource that exceeded quota. \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The identifier of the resource that exceeded quota. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc " The request would cause you to exceed your service quota. \n"]

type nonrec bill_scenario_name = string [@@ocaml.doc ""]

type nonrec bill_scenario_status =
  | STALE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | LOCKED [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec group_sharing_preference_enum =
  | RESTRICTED [@ocaml.doc ""]
  | PRIORITIZED [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_category_arn = string [@@ocaml.doc ""]

type nonrec update_bill_scenario_response = {
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the bill scenario update failed. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The updated expiration timestamp for the bill scenario. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill scenario was originally created. \n"]
  status : bill_scenario_status option;
      [@ocaml.doc " The current status of the updated bill scenario. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc " The time period covered by the updated bill scenario. \n"]
  name : bill_scenario_name option; [@ocaml.doc " The updated name of the bill scenario. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the updated bill scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec update_bill_scenario_request = {
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The new expiration date for the bill scenario. \n"]
  name : bill_scenario_name option; [@ocaml.doc " The new name for the bill scenario. \n"]
  identifier : resource_id; [@ocaml.doc " The unique identifier of the bill scenario to update. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_estimate_name = string [@@ocaml.doc ""]

type nonrec bill_estimate_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_amount = {
  currency : currency_code option; [@ocaml.doc " The currency code for the cost amount. \n"]
  amount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The numeric value of the cost. \n"]
}
[@@ocaml.doc " Represents a monetary amount with associated currency. \n"]

type nonrec cost_difference = {
  estimated_cost : cost_amount option; [@ocaml.doc " The estimated cost amount. \n"]
  historical_cost : cost_amount option; [@ocaml.doc " The historical cost amount. \n"]
}
[@@ocaml.doc " Represents the difference between historical and estimated costs. \n"]

type nonrec service_cost_difference_map =
  (Smaws_Lib.Smithy_api.Types.string_ * cost_difference) list
[@@ocaml.doc ""]

type nonrec bill_estimate_cost_summary = {
  service_cost_differences : service_cost_difference_map option;
      [@ocaml.doc " A breakdown of cost differences by Amazon Web Services service. \n"]
  total_cost_difference : cost_difference option;
      [@ocaml.doc " The total difference in cost between the estimated and historical costs. \n"]
}
[@@ocaml.doc " Provides a summary of cost-related information for a bill estimate. \n"]

type nonrec update_bill_estimate_response = {
  cost_category_group_sharing_preference_effective_date :
    Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "Timestamp of the effective date of the cost category used in the group sharing settings.\n"]
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The updated expiration timestamp for the bill estimate. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill estimate was originally created. \n"]
  cost_summary : bill_estimate_cost_summary option;
      [@ocaml.doc " A summary of the updated estimated costs. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc " The time period covered by the updated bill estimate. \n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the bill estimate update failed. \n"]
  status : bill_estimate_status option;
      [@ocaml.doc " The current status of the updated bill estimate. \n"]
  name : bill_estimate_name option; [@ocaml.doc " The updated name of the bill estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the updated bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec update_bill_estimate_request = {
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The new expiration date for the bill estimate. \n"]
  name : bill_estimate_name option; [@ocaml.doc " The new name for the bill estimate. \n"]
  identifier : resource_id; [@ocaml.doc " The unique identifier of the bill estimate to update. \n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec resource_tag_key = string [@@ocaml.doc ""]

type nonrec resource_tag_keys = resource_tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : resource_tag_keys; [@ocaml.doc " The keys of the tags to remove from the resource. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the resource to remove tags from. \n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The service code that exceeded the throttling limit. Retry your request, but if the \
         problem persists, contact Amazon Web Services support.\n"]
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The quota code that exceeded the throttling limit.\n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service code that exceeded the throttling limit.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc " The request was denied due to request throttling. \n"]

type nonrec resource_tag_value = string [@@ocaml.doc ""]

type nonrec tags = (resource_tag_key * resource_tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags; [@ocaml.doc " The tags to add to the resource. \n"]
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the resource to add tags to. \n"]
}
[@@ocaml.doc ""]

type nonrec savings_plan_commitment = float [@@ocaml.doc ""]

type nonrec savings_plan_arns = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec reserved_instance_instance_count = int [@@ocaml.doc ""]

type nonrec purchase_agreement_type =
  | RESERVED_INSTANCE [@ocaml.doc ""]
  | SAVINGS_PLANS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec next_page_token = string [@@ocaml.doc ""]

type nonrec negate_savings_plan_action = {
  savings_plan_id : uuid option; [@ocaml.doc " The ID of the Savings Plan to remove. \n"]
}
[@@ocaml.doc
  " Represents an action to remove a Savings Plan from a bill scenario. \n\n\
  \  This is the ID of an existing Savings Plan in your account. \n\
  \ "]

type nonrec negate_reserved_instance_action = {
  reserved_instances_id : uuid option; [@ocaml.doc " The ID of the Reserved Instance to remove. \n"]
}
[@@ocaml.doc
  " Represents an action to remove a Reserved Instance from a bill scenario. \n\n\
  \  This is the ID of an existing Reserved Instance in your account. \n\
  \ "]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec match_option =
  | CONTAINS [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_workload_estimates_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : workload_estimate_summaries option;
      [@ocaml.doc " The list of workload estimates for the account. \n"]
}
[@@ocaml.doc ""]

type nonrec filter_timestamp = {
  before_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " Include results before this timestamp. \n"]
  after_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " Include results after this timestamp. \n"]
}
[@@ocaml.doc " Represents a time-based filter. \n"]

type nonrec list_workload_estimates_filter_name = NAME [@ocaml.doc ""] | STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_workload_estimates_filter_values = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""]

type nonrec list_workload_estimates_filter = {
  match_option : match_option option;
      [@ocaml.doc " The match option for the filter (e.g., equals, contains). \n"]
  values : list_workload_estimates_filter_values; [@ocaml.doc " The values to filter by. \n"]
  name : list_workload_estimates_filter_name; [@ocaml.doc " The name of the filter attribute. \n"]
}
[@@ocaml.doc " Represents a filter for listing workload estimates. \n"]

type nonrec list_workload_estimates_filters = list_workload_estimates_filter list [@@ocaml.doc ""]

type nonrec list_workload_estimates_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  filters : list_workload_estimates_filters option;
      [@ocaml.doc " Filters to apply to the list of workload estimates. \n"]
  expires_at_filter : filter_timestamp option;
      [@ocaml.doc " Filter workload estimates based on the expiration date. \n"]
  created_at_filter : filter_timestamp option;
      [@ocaml.doc " Filter workload estimates based on the creation date. \n"]
}
[@@ocaml.doc ""]

type nonrec list_workload_estimate_usage_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : workload_estimate_usage_items option;
      [@ocaml.doc " The list of usage items associated with the workload estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec list_usage_filter_name =
  | HISTORICAL_LOCATION [@ocaml.doc ""]
  | HISTORICAL_OPERATION [@ocaml.doc ""]
  | HISTORICAL_USAGE_TYPE [@ocaml.doc ""]
  | HISTORICAL_SERVICE_CODE [@ocaml.doc ""]
  | HISTORICAL_USAGE_ACCOUNT_ID [@ocaml.doc ""]
  | USAGE_GROUP [@ocaml.doc ""]
  | LOCATION [@ocaml.doc ""]
  | OPERATION [@ocaml.doc ""]
  | USAGE_TYPE [@ocaml.doc ""]
  | SERVICE_CODE [@ocaml.doc ""]
  | USAGE_ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_usage_filter_values = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec list_usage_filter = {
  match_option : match_option option;
      [@ocaml.doc " The match option for the filter (e.g., equals, contains). \n"]
  values : list_usage_filter_values; [@ocaml.doc " The values to filter by. \n"]
  name : list_usage_filter_name; [@ocaml.doc " The name of the filter attribute. \n"]
}
[@@ocaml.doc " Represents a filter for listing usage data. \n"]

type nonrec list_usage_filters = list_usage_filter list [@@ocaml.doc ""]

type nonrec list_workload_estimate_usage_request = {
  max_results : workload_estimate_usage_max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  filters : list_usage_filters option;
      [@ocaml.doc " Filters to apply to the list of usage items. \n"]
  workload_estimate_id : resource_id;
      [@ocaml.doc " The unique identifier of the workload estimate to list usage for. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc " The list of tags associated with the specified resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  arn : arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the resource to list tags for. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_scenario_summary = {
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the bill scenario creation or processing failed. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill scenario will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill scenario was created. \n"]
  status : bill_scenario_status option; [@ocaml.doc " The current status of the bill scenario. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc " The time period covered by the bill scenario. \n"]
  name : bill_scenario_name option; [@ocaml.doc " The name of the bill scenario. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the bill scenario. \n"]
}
[@@ocaml.doc " Provides a summary of a bill scenario. \n"]

type nonrec bill_scenario_summaries = bill_scenario_summary list [@@ocaml.doc ""]

type nonrec list_bill_scenarios_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_scenario_summaries option;
      [@ocaml.doc " The list of bill scenarios for the account. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_scenarios_filter_name =
  | COST_CATEGORY_ARN [@ocaml.doc ""]
  | GROUP_SHARING_PREFERENCE [@ocaml.doc ""]
  | NAME [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_bill_scenarios_filter_values = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""]

type nonrec list_bill_scenarios_filter = {
  match_option : match_option option;
      [@ocaml.doc " The match option for the filter (e.g., equals, contains). \n"]
  values : list_bill_scenarios_filter_values; [@ocaml.doc " The values to filter by. \n"]
  name : list_bill_scenarios_filter_name; [@ocaml.doc " The name of the filter attribute. \n"]
}
[@@ocaml.doc " Represents a filter for listing bill scenarios. \n"]

type nonrec list_bill_scenarios_filters = list_bill_scenarios_filter list [@@ocaml.doc ""]

type nonrec list_bill_scenarios_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  expires_at_filter : filter_timestamp option;
      [@ocaml.doc " Filter bill scenarios based on the expiration date. \n"]
  created_at_filter : filter_timestamp option;
      [@ocaml.doc " Filter bill scenarios based on the creation date. \n"]
  filters : list_bill_scenarios_filters option;
      [@ocaml.doc " Filters to apply to the list of bill scenarios. \n"]
}
[@@ocaml.doc ""]

type nonrec availability_zone = string [@@ocaml.doc ""]

type nonrec bill_scenario_usage_modification_item = {
  historical_usage : historical_usage_entity option;
      [@ocaml.doc " Historical usage data associated with this modification, if available. \n"]
  quantities : usage_quantities option; [@ocaml.doc " The modified usage quantities. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID associated with this usage modification. \n"]
  group : usage_group option; [@ocaml.doc " The group identifier for the usage modification. \n"]
  id : resource_id option; [@ocaml.doc " The unique identifier of the usage modification. \n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        " The availability zone associated with this usage modification, if applicable. \n"]
  location : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The location associated with this usage modification. \n"]
  operation : operation;
      [@ocaml.doc " The specific operation associated with this usage modification. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage being modified. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code for this usage modification. \n"]
}
[@@ocaml.doc " Represents a usage modification item in a bill scenario. \n"]

type nonrec bill_scenario_usage_modification_items = bill_scenario_usage_modification_item list
[@@ocaml.doc ""]

type nonrec list_bill_scenario_usage_modifications_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_scenario_usage_modification_items option;
      [@ocaml.doc " The list of usage modifications associated with the bill scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_scenario_usage_modifications_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  filters : list_usage_filters option;
      [@ocaml.doc " Filters to apply to the list of usage modifications. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc " The unique identifier of the bill scenario to list usage modifications for. \n"]
}
[@@ocaml.doc ""]

type nonrec add_reserved_instance_action = {
  instance_count : reserved_instance_instance_count option;
      [@ocaml.doc " The number of instances to add for this Reserved Instance offering. \n"]
  reserved_instances_offering_id : uuid option;
      [@ocaml.doc
        " The ID of the Reserved Instance offering to add. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeReservedInstancesOfferings.html} \
         DescribeReservedInstancesOfferings}. \n"]
}
[@@ocaml.doc " Represents an action to add a Reserved Instance to a bill scenario. \n"]

type nonrec add_savings_plan_action = {
  commitment : savings_plan_commitment option;
      [@ocaml.doc
        " The hourly commitment, in the same currency of the [savingsPlanOfferingId]. This is a \
         value between 0.001 and 1 million. You cannot specify more than five digits after the \
         decimal point. \n"]
  savings_plan_offering_id : uuid option;
      [@ocaml.doc
        " The ID of the Savings Plan offering to add. For more information, see \
         {{:https://docs.aws.amazon.com/savingsplans/latest/APIReference/API_DescribeSavingsPlansOfferings.html} \
         DescribeSavingsPlansOfferings}. \n"]
}
[@@ocaml.doc " Represents an action to add a Savings Plan to a bill scenario. \n"]

type nonrec bill_scenario_commitment_modification_action =
  | NegateSavingsPlanAction of negate_savings_plan_action
      [@ocaml.doc " Action to remove a Savings Plan from the scenario. \n"]
  | NegateReservedInstanceAction of negate_reserved_instance_action
      [@ocaml.doc " Action to remove a Reserved Instance from the scenario. \n"]
  | AddSavingsPlanAction of add_savings_plan_action
      [@ocaml.doc " Action to add a Savings Plan to the scenario. \n"]
  | AddReservedInstanceAction of add_reserved_instance_action
      [@ocaml.doc " Action to add a Reserved Instance to the scenario. \n"]
[@@ocaml.doc " Represents an action to modify commitments in a bill scenario. \n"]

type nonrec bill_scenario_commitment_modification_item = {
  commitment_action : bill_scenario_commitment_modification_action option;
      [@ocaml.doc " The specific commitment action taken in this modification. \n"]
  group : usage_group option;
      [@ocaml.doc " The group identifier for the commitment modification. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID associated with this commitment modification. \n"]
  id : resource_id option; [@ocaml.doc " The unique identifier of the commitment modification. \n"]
}
[@@ocaml.doc " Represents a commitment modification item in a bill scenario. \n"]

type nonrec bill_scenario_commitment_modification_items =
  bill_scenario_commitment_modification_item list
[@@ocaml.doc ""]

type nonrec list_bill_scenario_commitment_modifications_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_scenario_commitment_modification_items option;
      [@ocaml.doc " The list of commitment modifications associated with the bill scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_scenario_commitment_modifications_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc
        " The unique identifier of the bill scenario to list commitment modifications for. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_estimate_summary = {
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill estimate will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill estimate was created. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc " The time period covered by the bill estimate. \n"]
  status : bill_estimate_status option; [@ocaml.doc " The current status of the bill estimate. \n"]
  name : bill_estimate_name option; [@ocaml.doc " The name of the bill estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the bill estimate. \n"]
}
[@@ocaml.doc " Provides a summary of a bill estimate. \n"]

type nonrec bill_estimate_summaries = bill_estimate_summary list [@@ocaml.doc ""]

type nonrec list_bill_estimates_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_estimate_summaries option;
      [@ocaml.doc " The list of bill estimates for the account. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_estimates_filter_name = NAME [@ocaml.doc ""] | STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_bill_estimates_filter_values = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""]

type nonrec list_bill_estimates_filter = {
  match_option : match_option option;
      [@ocaml.doc " The match option for the filter (e.g., equals, contains). \n"]
  values : list_bill_estimates_filter_values; [@ocaml.doc " The values to filter by. \n"]
  name : list_bill_estimates_filter_name; [@ocaml.doc " The name of the filter attribute. \n"]
}
[@@ocaml.doc " Represents a filter for listing bill estimates. \n"]

type nonrec list_bill_estimates_filters = list_bill_estimates_filter list [@@ocaml.doc ""]

type nonrec list_bill_estimates_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  expires_at_filter : filter_timestamp option;
      [@ocaml.doc " Filter bill estimates based on the expiration date. \n"]
  created_at_filter : filter_timestamp option;
      [@ocaml.doc " Filter bill estimates based on the creation date. \n"]
  filters : list_bill_estimates_filters option;
      [@ocaml.doc " Filters to apply to the list of bill estimates. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_estimate_line_item_summary = {
  savings_plan_arns : savings_plan_arns option;
      [@ocaml.doc
        " The Amazon Resource Names (ARNs) of any Savings Plans applied to this line item. \n"]
  historical_cost : cost_amount option; [@ocaml.doc " The historical cost for this line item. \n"]
  historical_usage_quantity : usage_quantity_result option;
      [@ocaml.doc " The historical usage quantity for this line item. \n"]
  estimated_cost : cost_amount option; [@ocaml.doc " The estimated cost for this line item. \n"]
  estimated_usage_quantity : usage_quantity_result option;
      [@ocaml.doc " The estimated usage quantity for this line item. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID associated with the usage for this line item. \n"]
  payer_account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID of the payer for this line item. \n"]
  line_item_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The type of this line item (e.g., Usage, Tax, Credit). \n"]
  line_item_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The line item identifier from the original bill. \n"]
  id : resource_id option; [@ocaml.doc " The unique identifier of this line item. \n"]
  availability_zone : availability_zone option;
      [@ocaml.doc " The availability zone associated with this line item, if applicable. \n"]
  location : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The location associated with this line item. \n"]
  operation : operation; [@ocaml.doc " The specific operation associated with this line item. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage for this line item. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code associated with this line item. \n"]
}
[@@ocaml.doc " Provides a summary of a line item in a bill estimate. \n"]

type nonrec bill_estimate_line_item_summaries = bill_estimate_line_item_summary list
[@@ocaml.doc ""]

type nonrec list_bill_estimate_line_items_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_estimate_line_item_summaries option;
      [@ocaml.doc " The list of line items associated with the bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_estimate_line_items_filter_name =
  | LINE_ITEM_TYPE [@ocaml.doc ""]
  | LOCATION [@ocaml.doc ""]
  | OPERATION [@ocaml.doc ""]
  | USAGE_TYPE [@ocaml.doc ""]
  | SERVICE_CODE [@ocaml.doc ""]
  | USAGE_ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_bill_estimate_line_items_filter_values = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""]

type nonrec list_bill_estimate_line_items_filter = {
  match_option : match_option option;
      [@ocaml.doc " The match option for the filter (e.g., equals, contains). \n"]
  values : list_bill_estimate_line_items_filter_values; [@ocaml.doc " The values to filter by. \n"]
  name : list_bill_estimate_line_items_filter_name;
      [@ocaml.doc " The name of the filter attribute. \n"]
}
[@@ocaml.doc " Represents a filter for listing bill estimate line items. \n"]

type nonrec list_bill_estimate_line_items_filters = list_bill_estimate_line_items_filter list
[@@ocaml.doc ""]

type nonrec list_bill_estimate_line_items_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  filters : list_bill_estimate_line_items_filters option;
      [@ocaml.doc " Filters to apply to the list of line items. \n"]
  bill_estimate_id : resource_id;
      [@ocaml.doc " The unique identifier of the bill estimate to list line items for. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_estimate_input_usage_modification_summary = {
  historical_usage : historical_usage_entity option;
      [@ocaml.doc " Historical usage data associated with this modification, if available. \n"]
  quantities : usage_quantities option; [@ocaml.doc " The modified usage quantities. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID associated with this usage modification. \n"]
  group : usage_group option; [@ocaml.doc " The group identifier for the usage modification. \n"]
  id : resource_id option; [@ocaml.doc " The unique identifier of the usage modification. \n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        " The availability zone associated with this usage modification, if applicable. \n"]
  location : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The location associated with this usage modification. \n"]
  operation : operation;
      [@ocaml.doc " The specific operation associated with this usage modification. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage being modified. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code for this usage modification. \n"]
}
[@@ocaml.doc " Summarizes an input usage modification for a bill estimate. \n"]

type nonrec bill_estimate_input_usage_modification_summaries =
  bill_estimate_input_usage_modification_summary list
[@@ocaml.doc ""]

type nonrec list_bill_estimate_input_usage_modifications_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_estimate_input_usage_modification_summaries option;
      [@ocaml.doc " The list of input usage modifications associated with the bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_estimate_input_usage_modifications_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  filters : list_usage_filters option;
      [@ocaml.doc " Filters to apply to the list of input usage modifications. \n"]
  bill_estimate_id : resource_id;
      [@ocaml.doc
        " The unique identifier of the bill estimate to list input usage modifications for. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_estimate_input_commitment_modification_summary = {
  commitment_action : bill_scenario_commitment_modification_action option;
      [@ocaml.doc " The specific commitment action taken in this modification. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID associated with this commitment modification. \n"]
  group : usage_group option;
      [@ocaml.doc " The group identifier for the commitment modification. \n"]
  id : resource_id option; [@ocaml.doc " The unique identifier of the commitment modification. \n"]
}
[@@ocaml.doc " Summarizes an input commitment modification for a bill estimate. \n"]

type nonrec bill_estimate_input_commitment_modification_summaries =
  bill_estimate_input_commitment_modification_summary list
[@@ocaml.doc ""]

type nonrec list_bill_estimate_input_commitment_modifications_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_estimate_input_commitment_modification_summaries option;
      [@ocaml.doc
        " The list of input commitment modifications associated with the bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_estimate_input_commitment_modifications_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  bill_estimate_id : resource_id;
      [@ocaml.doc
        " The unique identifier of the bill estimate to list input commitment modifications for. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_estimate_commitment_summary = {
  monthly_payment : cost_amount option;
      [@ocaml.doc " The monthly payment amount for this commitment, if applicable. \n"]
  upfront_payment : cost_amount option;
      [@ocaml.doc " The upfront payment amount for this commitment, if applicable. \n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " The payment option chosen for this commitment (e.g., All Upfront, Partial Upfront, No \
         Upfront). \n"]
  term_length : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The length of the commitment term. \n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The Amazon Web Services region associated with this commitment. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID associated with this commitment. \n"]
  offering_id : uuid option;
      [@ocaml.doc " The identifier of the specific offering associated with this commitment. \n"]
  purchase_agreement_type : purchase_agreement_type option;
      [@ocaml.doc " The type of purchase agreement (e.g., Reserved Instance, Savings Plan). \n"]
  id : resource_id option; [@ocaml.doc " The unique identifier of the commitment. \n"]
}
[@@ocaml.doc " Provides a summary of commitment-related information for a bill estimate. \n"]

type nonrec bill_estimate_commitment_summaries = bill_estimate_commitment_summary list
[@@ocaml.doc ""]

type nonrec list_bill_estimate_commitments_response = {
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results, if any. \n"]
  items : bill_estimate_commitment_summaries option;
      [@ocaml.doc " The list of commitments associated with the bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec list_bill_estimate_commitments_request = {
  max_results : max_results option;
      [@ocaml.doc " The maximum number of results to return per page. \n"]
  next_token : next_page_token option;
      [@ocaml.doc " A token to retrieve the next page of results. \n"]
  bill_estimate_id : resource_id;
      [@ocaml.doc " The unique identifier of the bill estimate to list commitments for. \n"]
}
[@@ocaml.doc ""]

type nonrec key = string [@@ocaml.doc ""]

type nonrec internal_server_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        " An internal error has occurred. Retry your request, but if the problem persists, contact \
         Amazon Web Services support. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  " An internal error has occurred. Retry your request, but if the problem persists, contact \
   Amazon Web Services support. \n"]

type nonrec get_workload_estimate_response = {
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the workload estimate retrieval failed. \n"]
  cost_currency : currency_code option; [@ocaml.doc " The currency of the estimated cost. \n"]
  total_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The total estimated cost for the workload. \n"]
  status : workload_estimate_status option;
      [@ocaml.doc " The current status of the workload estimate. \n"]
  rate_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp of the pricing rates used for the estimate. \n"]
  rate_type : workload_estimate_rate_type option;
      [@ocaml.doc " The type of pricing rates used for the estimate. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the workload estimate will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the workload estimate was created. \n"]
  name : workload_estimate_name option;
      [@ocaml.doc " The name of the retrieved workload estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the retrieved workload estimate. \n"]
}
[@@ocaml.doc "Mixin for common fields returned by CRUD APIs"]

type nonrec get_workload_estimate_request = {
  identifier : resource_id;
      [@ocaml.doc " The unique identifier of the workload estimate to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec get_preferences_response = {
  standalone_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The preferred rate types for a standalone account. \n"]
  member_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The preferred rate types for member accounts. \n"]
  management_account_rate_type_selections : rate_types option;
      [@ocaml.doc " The preferred rate types for the management account. \n"]
}
[@@ocaml.doc ""]

type nonrec get_preferences_request = unit [@@ocaml.doc ""]

type nonrec get_bill_scenario_response = {
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the bill scenario retrieval failed. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill scenario will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill scenario was created. \n"]
  status : bill_scenario_status option; [@ocaml.doc " The current status of the bill scenario. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc " The time period covered by the bill scenario. \n"]
  name : bill_scenario_name option; [@ocaml.doc " The name of the retrieved bill scenario. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the retrieved bill scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec get_bill_scenario_request = {
  identifier : resource_id;
      [@ocaml.doc " The unique identifier of the bill scenario to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec get_bill_estimate_response = {
  cost_category_group_sharing_preference_effective_date :
    Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "Timestamp of the effective date of the cost category used in the group sharing settings.\n"]
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill estimate will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill estimate was created. \n"]
  cost_summary : bill_estimate_cost_summary option;
      [@ocaml.doc " A summary of the estimated costs. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc " The time period covered by the bill estimate. \n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the bill estimate retrieval failed. \n"]
  status : bill_estimate_status option; [@ocaml.doc " The current status of the bill estimate. \n"]
  name : bill_estimate_name option; [@ocaml.doc " The name of the retrieved bill estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the retrieved bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec get_bill_estimate_request = {
  identifier : resource_id;
      [@ocaml.doc " The unique identifier of the bill estimate to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_workload_estimate_response = unit [@@ocaml.doc ""]

type nonrec delete_workload_estimate_request = {
  identifier : resource_id;
      [@ocaml.doc " The unique identifier of the workload estimate to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_bill_scenario_response = unit [@@ocaml.doc ""]

type nonrec delete_bill_scenario_request = {
  identifier : resource_id; [@ocaml.doc " The unique identifier of the bill scenario to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_bill_estimate_response = unit [@@ocaml.doc ""]

type nonrec delete_bill_estimate_request = {
  identifier : resource_id; [@ocaml.doc " The unique identifier of the bill estimate to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec create_workload_estimate_response = {
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the workload estimate creation failed. \n"]
  cost_currency : currency_code option; [@ocaml.doc " The currency of the estimated cost. \n"]
  total_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The total estimated cost for the workload. \n"]
  status : workload_estimate_status option;
      [@ocaml.doc " The current status of the workload estimate. \n"]
  rate_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp of the pricing rates used for the estimate. \n"]
  rate_type : workload_estimate_rate_type option;
      [@ocaml.doc " The type of pricing rates used for the estimate. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the workload estimate will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the workload estimate was created. \n"]
  name : workload_estimate_name option;
      [@ocaml.doc " The name of the created workload estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier for the created workload estimate. \n"]
}
[@@ocaml.doc "Mixin for common fields returned by CRUD APIs"]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec create_workload_estimate_request = {
  tags : tags option; [@ocaml.doc " The tags to apply to the workload estimate. \n"]
  rate_type : workload_estimate_rate_type option;
      [@ocaml.doc " The type of pricing rates to use for the estimate. \n"]
  client_token : client_token option;
      [@ocaml.doc " A unique, case-sensitive identifier to ensure idempotency of the request. \n"]
  name : workload_estimate_name; [@ocaml.doc " A descriptive name for the workload estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec create_bill_scenario_response = {
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " An error message if the bill scenario creation failed. \n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill scenario will expire. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The timestamp when the bill scenario was created. \n"]
  status : bill_scenario_status option; [@ocaml.doc " The current status of the bill scenario. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc " The time period covered by the bill scenario. \n"]
  name : bill_scenario_name option; [@ocaml.doc " The name of the created bill scenario. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier for the created bill scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec create_bill_scenario_request = {
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  tags : tags option; [@ocaml.doc " The tags to apply to the bill scenario. \n"]
  client_token : client_token option;
      [@ocaml.doc " A unique, case-sensitive identifier to ensure idempotency of the request. \n"]
  name : bill_scenario_name; [@ocaml.doc " A descriptive name for the bill scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec create_bill_estimate_response = {
  cost_category_group_sharing_preference_effective_date :
    Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        "Timestamp of the effective date of the cost category used in the group sharing settings.\n"]
  cost_category_group_sharing_preference_arn : cost_category_arn option;
      [@ocaml.doc
        "The arn of the cost category used in the reserved and prioritized group sharing.\n"]
  group_sharing_preference : group_sharing_preference_enum option;
      [@ocaml.doc
        "The setting for the reserved instance and savings plan group sharing used in this estimate.\n"]
  expires_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        " The timestamp of when the Bill estimate will expire. A Bill estimate becomes \
         inaccessible after expiration. \n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc
        " The timestamp of when the Bill estimate create process was started (not when it \
         successfully completed or failed). \n"]
  cost_summary : bill_estimate_cost_summary option;
      [@ocaml.doc
        " Returns summary-level cost information once a Bill estimate is successfully generated. \
         This summary includes: 1) the total cost difference, showing the pre-tax cost change for \
         the consolidated billing family between the completed anniversary bill and the estimated \
         bill, and 2) total cost differences per service, detailing the pre-tax cost of each \
         service, comparing the completed anniversary bill to the estimated bill on a per-service \
         basis. \n"]
  bill_interval : bill_interval option;
      [@ocaml.doc
        " The bill month start and end timestamp that was used to create the Bill estimate. This \
         is set to the last complete anniversary bill month start and end timestamp. \n"]
  failure_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        " This attribute provides the reason if a Bill estimate result generation fails. \n"]
  status : bill_estimate_status option;
      [@ocaml.doc
        " The status of your newly created Bill estimate. Bill estimate creation can take anywhere \
         between 8 to 12 hours. The status will allow you to identify when the Bill estimate is \
         complete or has failed. \n"]
  name : bill_estimate_name option; [@ocaml.doc " The name of your newly created Bill estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of your newly created Bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec create_bill_estimate_request = {
  tags : tags option;
      [@ocaml.doc
        " An optional list of tags to associate with the specified BillEstimate. You can use \
         resource tags to control access to your BillEstimate using IAM policies. Each tag \
         consists of a key and a value, and each key must be unique for the resource. The \
         following restrictions apply to resource tags: \n\n\
        \ {ul\n\
        \       {-  Although the maximum number of array members is 200, you can assign a maximum \
         of 50 user-tags to one resource. The remaining are reserved for Amazon Web Services. \n\
        \           \n\
        \            }\n\
        \       {-  The maximum length of a key is 128 characters.\n\
        \           \n\
        \            }\n\
        \       {-  The maximum length of a value is 256 characters.\n\
        \           \n\
        \            }\n\
        \       {-  Keys and values can only contain alphanumeric characters, spaces, and any of \
         the following: [_.:/=+@-].\n\
        \           \n\
        \            }\n\
        \       {-  Keys and values are case sensitive.\n\
        \           \n\
        \            }\n\
        \       {-  Keys and values are trimmed for any leading or trailing whitespaces.\n\
        \           \n\
        \            }\n\
        \       {-  Don't use [aws:] as a prefix for your keys. This prefix is reserved for Amazon \
         Web Services.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  client_token : client_token option;
      [@ocaml.doc
        " A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. \n"]
  name : bill_estimate_name;
      [@ocaml.doc
        " The name of the Bill estimate that will be created. Names must be unique for an account. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc " The ID of the Bill Scenario for which you want to create a Bill estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec bill_scenario_usage_modification = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec bill_scenario_commitment_modification = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec bill_scenario = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec bill_estimate_line_item = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec bill_estimate_input_usage_modification = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec bill_estimate_input_commitment_modification = Smaws_Lib.CoreTypes.Resource.t
[@@ocaml.doc ""]

type nonrec bill_estimate_commitment = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec bill_estimate = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec batch_update_workload_estimate_usage_error = {
  error_code : workload_estimate_update_usage_error_code option;
      [@ocaml.doc " The code associated with the error. \n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The message that describes the error. \n"]
  id : resource_id option; [@ocaml.doc " The ID of the error. \n"]
}
[@@ocaml.doc " Represents an error that occurred when updating usage in a workload estimate. \n"]

type nonrec batch_update_workload_estimate_usage_errors =
  batch_update_workload_estimate_usage_error list
[@@ocaml.doc ""]

type nonrec batch_update_workload_estimate_usage_response = {
  errors : batch_update_workload_estimate_usage_errors option;
      [@ocaml.doc
        " Returns the list of error reasons and usage line item IDs that could not be updated for \
         the Workload estimate. \n"]
  items : workload_estimate_usage_items option;
      [@ocaml.doc
        " Returns the list of successful usage line items that were updated for a Workload \
         estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_workload_estimate_usage_entry = {
  amount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The updated estimated usage amount. \n"]
  group : usage_group option;
      [@ocaml.doc " The updated group identifier for the usage estimate. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the usage estimate to update. \n"]
}
[@@ocaml.doc " Represents an entry in a batch operation to update workload estimate usage. \n"]

type nonrec batch_update_workload_estimate_usage_entries =
  batch_update_workload_estimate_usage_entry list
[@@ocaml.doc ""]

type nonrec batch_update_workload_estimate_usage_request = {
  usage : batch_update_workload_estimate_usage_entries;
      [@ocaml.doc
        " List of usage line amounts and usage group that you want to update in a Workload \
         estimate identified by the usage ID. \n"]
  workload_estimate_id : resource_id;
      [@ocaml.doc
        " The ID of the Workload estimate for which you want to modify the usage lines. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_usage_modification_error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_usage_modification_error = {
  error_code : batch_update_bill_scenario_usage_modification_error_code option;
      [@ocaml.doc " The code associated with the error. \n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The message that describes the error. \n"]
  id : resource_id option; [@ocaml.doc " The ID of the error. \n"]
}
[@@ocaml.doc " Represents an error that occurred when updating usage in a Bill Scenario. \n"]

type nonrec batch_update_bill_scenario_usage_modification_errors =
  batch_update_bill_scenario_usage_modification_error list
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_usage_modification_response = {
  errors : batch_update_bill_scenario_usage_modification_errors option;
      [@ocaml.doc
        " Returns the list of error reasons and usage line item IDs that could not be updated for \
         the Bill Scenario. \n"]
  items : bill_scenario_usage_modification_items option;
      [@ocaml.doc
        " Returns the list of successful usage line items that were updated for a Bill Scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_usage_modification_entry = {
  amounts : usage_amounts option; [@ocaml.doc " The updated usage amounts for the modification. \n"]
  group : usage_group option;
      [@ocaml.doc " The updated group identifier for the usage modification. \n"]
  id : resource_id; [@ocaml.doc " The unique identifier of the usage modification to update. \n"]
}
[@@ocaml.doc
  " Represents an entry in a batch operation to update bill scenario usage modifications. \n"]

type nonrec batch_update_bill_scenario_usage_modification_entries =
  batch_update_bill_scenario_usage_modification_entry list
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_usage_modification_request = {
  usage_modifications : batch_update_bill_scenario_usage_modification_entries;
      [@ocaml.doc
        " List of usage lines that you want to update in a Bill Scenario identified by the usage \
         ID. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc " The ID of the Bill Scenario for which you want to modify the usage lines. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_commitment_modification_error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_commitment_modification_error = {
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The message that describes the error. \n"]
  error_code : batch_update_bill_scenario_commitment_modification_error_code option;
      [@ocaml.doc " The code associated with the error. \n"]
  id : resource_id option; [@ocaml.doc " The ID of the error. \n"]
}
[@@ocaml.doc " Represents an error that occurred when updating a commitment in a Bill Scenario. \n"]

type nonrec batch_update_bill_scenario_commitment_modification_errors =
  batch_update_bill_scenario_commitment_modification_error list
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_commitment_modification_response = {
  errors : batch_update_bill_scenario_commitment_modification_errors option;
      [@ocaml.doc
        " Returns the list of error reasons and commitment line item IDs that could not be updated \
         for the Bill Scenario. \n"]
  items : bill_scenario_commitment_modification_items option;
      [@ocaml.doc
        " Returns the list of successful commitment line items that were updated for a Bill \
         Scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_commitment_modification_entry = {
  group : usage_group option;
      [@ocaml.doc " The updated group identifier for the commitment modification. \n"]
  id : resource_id;
      [@ocaml.doc " The unique identifier of the commitment modification to update. \n"]
}
[@@ocaml.doc
  " Represents an entry in a batch operation to update bill scenario commitment modifications. \n"]

type nonrec batch_update_bill_scenario_commitment_modification_entries =
  batch_update_bill_scenario_commitment_modification_entry list
[@@ocaml.doc ""]

type nonrec batch_update_bill_scenario_commitment_modification_request = {
  commitment_modifications : batch_update_bill_scenario_commitment_modification_entries;
      [@ocaml.doc " List of commitments that you want to update in a Bill Scenario. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc
        " The ID of the Bill Scenario for which you want to modify the commitment group of a \
         modeled commitment. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_workload_estimate_usage_error = {
  error_code : workload_estimate_update_usage_error_code option;
      [@ocaml.doc " The code associated with the error. \n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The message that describes the error. \n"]
  id : resource_id option; [@ocaml.doc " The ID of the error. \n"]
}
[@@ocaml.doc " Represents an error that occurred when deleting usage in a workload estimate. \n"]

type nonrec batch_delete_workload_estimate_usage_errors =
  batch_delete_workload_estimate_usage_error list
[@@ocaml.doc ""]

type nonrec batch_delete_workload_estimate_usage_response = {
  errors : batch_delete_workload_estimate_usage_errors option;
      [@ocaml.doc
        " Returns the list of errors reason and the usage item keys that cannot be deleted from \
         the Workload estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_workload_estimate_usage_entries = resource_id list [@@ocaml.doc ""]

type nonrec batch_delete_workload_estimate_usage_request = {
  ids : batch_delete_workload_estimate_usage_entries;
      [@ocaml.doc " List of usage that you want to delete from the Workload estimate. \n"]
  workload_estimate_id : resource_id;
      [@ocaml.doc
        " The ID of the Workload estimate for which you want to delete the modeled usage. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_usage_modification_error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_usage_modification_error = {
  error_code : batch_delete_bill_scenario_usage_modification_error_code option;
      [@ocaml.doc " The code associated with the error. \n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The message that describes the error. \n"]
  id : resource_id option; [@ocaml.doc " The ID of the error. \n"]
}
[@@ocaml.doc " Represents an error that occurred when deleting usage in a Bill Scenario. \n"]

type nonrec batch_delete_bill_scenario_usage_modification_errors =
  batch_delete_bill_scenario_usage_modification_error list
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_usage_modification_response = {
  errors : batch_delete_bill_scenario_usage_modification_errors option;
      [@ocaml.doc
        " Returns the list of errors reason and the usage item keys that cannot be deleted from \
         the Bill Scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_usage_modification_entries = resource_id list
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_usage_modification_request = {
  ids : batch_delete_bill_scenario_usage_modification_entries;
      [@ocaml.doc " List of usage that you want to delete from the Bill Scenario. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc " The ID of the Bill Scenario for which you want to delete the modeled usage. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_commitment_modification_error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_commitment_modification_error = {
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The message that describes the error. \n"]
  error_code : batch_delete_bill_scenario_commitment_modification_error_code option;
      [@ocaml.doc " The code associated with the error. \n"]
  id : resource_id option; [@ocaml.doc " The ID of the error. \n"]
}
[@@ocaml.doc " Represents an error that occurred when deleting a commitment in a Bill Scenario. \n"]

type nonrec batch_delete_bill_scenario_commitment_modification_errors =
  batch_delete_bill_scenario_commitment_modification_error list
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_commitment_modification_response = {
  errors : batch_delete_bill_scenario_commitment_modification_errors option;
      [@ocaml.doc
        " Returns the list of errors reason and the commitment item keys that cannot be deleted \
         from the Bill Scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_commitment_modification_entries = resource_id list
[@@ocaml.doc ""]

type nonrec batch_delete_bill_scenario_commitment_modification_request = {
  ids : batch_delete_bill_scenario_commitment_modification_entries;
      [@ocaml.doc " List of commitments that you want to delete from the Bill Scenario. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc
        " The ID of the Bill Scenario for which you want to delete the modeled commitment. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_workload_estimate_usage_item = {
  key : key option; [@ocaml.doc " The key of the successfully created entry. \n"]
  historical_usage : historical_usage_entity option;
      [@ocaml.doc " Historical usage data associated with this estimate, if available. \n"]
  status : workload_estimate_cost_status option;
      [@ocaml.doc " The current status of the created usage estimate. \n"]
  currency : currency_code option; [@ocaml.doc " The currency of the estimated cost. \n"]
  cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc " The estimated cost associated with this usage. \n"]
  quantity : workload_estimate_usage_quantity option;
      [@ocaml.doc " The estimated usage quantity. \n"]
  group : usage_group option;
      [@ocaml.doc " The group identifier for the created usage estimate. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID associated with the created usage estimate. \n"]
  id : resource_id option;
      [@ocaml.doc " The unique identifier assigned to the created usage estimate. \n"]
  location : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The location associated with this usage estimate. \n"]
  operation : operation;
      [@ocaml.doc " The specific operation associated with this usage estimate. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage that was estimated. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code for this usage estimate. \n"]
}
[@@ocaml.doc
  " Represents a successfully created item in a batch operation for workload estimate usage. \n"]

type nonrec batch_create_workload_estimate_usage_items =
  batch_create_workload_estimate_usage_item list
[@@ocaml.doc ""]

type nonrec batch_create_workload_estimate_usage_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_create_workload_estimate_usage_error = {
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " A descriptive message for the error that occurred. \n"]
  error_code : batch_create_workload_estimate_usage_code option;
      [@ocaml.doc " The error code associated with the failed operation. \n"]
  key : key option; [@ocaml.doc " The key of the entry that caused the error. \n"]
}
[@@ocaml.doc
  " Represents an error that occurred during a batch create operation for workload estimate usage. \n"]

type nonrec batch_create_workload_estimate_usage_errors =
  batch_create_workload_estimate_usage_error list
[@@ocaml.doc ""]

type nonrec batch_create_workload_estimate_usage_response = {
  errors : batch_create_workload_estimate_usage_errors option;
      [@ocaml.doc
        " Returns the list of errors reason and the usage item keys that cannot be created in the \
         Workload estimate. \n"]
  items : batch_create_workload_estimate_usage_items option;
      [@ocaml.doc
        " Returns the list of successful usage line items that were created for the Workload \
         estimate. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_workload_estimate_usage_entry = {
  historical_usage : historical_usage_entity option;
      [@ocaml.doc " Historical usage data associated with this estimate, if available. \n"]
  amount : Smaws_Lib.Smithy_api.Types.double; [@ocaml.doc " The estimated usage amount. \n"]
  usage_account_id : account_id;
      [@ocaml.doc " The Amazon Web Services account ID associated with this usage estimate. \n"]
  group : usage_group option;
      [@ocaml.doc " An optional group identifier for the usage estimate. \n"]
  key : key; [@ocaml.doc " A unique identifier for this entry in the batch operation. \n"]
  operation : operation;
      [@ocaml.doc " The specific operation associated with this usage estimate. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage being estimated. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code for this usage estimate. \n"]
}
[@@ocaml.doc " Represents an entry in a batch operation to create workload estimate usage. \n"]

type nonrec batch_create_workload_estimate_usage_entries =
  batch_create_workload_estimate_usage_entry list
[@@ocaml.doc ""]

type nonrec batch_create_workload_estimate_usage_request = {
  client_token : client_token option;
      [@ocaml.doc
        " A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. \n"]
  usage : batch_create_workload_estimate_usage_entries;
      [@ocaml.doc " List of usage that you want to model in the Workload estimate. \n"]
  workload_estimate_id : resource_id;
      [@ocaml.doc
        " The ID of the Workload estimate for which you want to create the modeled usage. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_usage_modification_item = {
  key : key option; [@ocaml.doc " The key of the successfully created entry. \n"]
  historical_usage : historical_usage_entity option;
      [@ocaml.doc " Historical usage data associated with this modification, if available. \n"]
  quantities : usage_quantities option; [@ocaml.doc " The modified usage quantities. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID associated with the created usage modification. \n"]
  group : usage_group option;
      [@ocaml.doc " The group identifier for the created usage modification. \n"]
  id : resource_id option;
      [@ocaml.doc " The unique identifier assigned to the created usage modification. \n"]
  availability_zone : availability_zone option;
      [@ocaml.doc
        " The availability zone associated with this usage modification, if applicable. \n"]
  location : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The location associated with this usage modification. \n"]
  operation : operation;
      [@ocaml.doc " The specific operation associated with this usage modification. \n"]
  usage_type : usage_type; [@ocaml.doc " The type of usage that was modified. \n"]
  service_code : service_code;
      [@ocaml.doc " The Amazon Web Services service code for this usage modification. \n"]
}
[@@ocaml.doc
  " Represents a successfully created item in a batch operation for bill scenario usage \
   modifications. \n"]

type nonrec batch_create_bill_scenario_usage_modification_items =
  batch_create_bill_scenario_usage_modification_item list
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_usage_modification_error_code =
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""]
  | BAD_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_usage_modification_error = {
  error_code : batch_create_bill_scenario_usage_modification_error_code option;
      [@ocaml.doc " The error code associated with the failed operation. \n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " A descriptive message for the error that occurred. \n"]
  key : key option; [@ocaml.doc " The key of the entry that caused the error. \n"]
}
[@@ocaml.doc
  " Represents an error that occurred during a batch create operation for bill scenario usage \
   modifications. \n"]

type nonrec batch_create_bill_scenario_usage_modification_errors =
  batch_create_bill_scenario_usage_modification_error list
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_usage_modification_response = {
  errors : batch_create_bill_scenario_usage_modification_errors option;
      [@ocaml.doc
        " Returns the list of errors reason and the usage item keys that cannot be created in the \
         Bill Scenario. \n"]
  items : batch_create_bill_scenario_usage_modification_items option;
      [@ocaml.doc
        " Returns the list of successful usage line items that were created for the Bill Scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_usage_modification_entry = {
  historical_usage : historical_usage_entity option;
      [@ocaml.doc " Historical usage data associated with this modification, if available. \n"]
  amounts : usage_amounts option;
      [@ocaml.doc
        " The amount of usage you want to create for the service use you are modeling. \n"]
  usage_account_id : account_id;
      [@ocaml.doc " The Amazon Web Services account ID to which this usage will be applied to. \n"]
  group : usage_group option;
      [@ocaml.doc " An optional group identifier for the usage modification. \n"]
  key : key;
      [@ocaml.doc
        " A unique identifier for this entry in the batch operation. This can be any valid string. \
         This key is useful to identify errors associated with any usage entry as any error is \
         returned with this key. \n"]
  availability_zone : availability_zone option;
      [@ocaml.doc " The Availability Zone that this usage line uses. \n"]
  operation : operation;
      [@ocaml.doc
        " The specific operation associated with this usage modification. Describes the specific \
         Amazon Web Services operation that this usage line models. For example, [RunInstances] \
         indicates the operation of an Amazon EC2 instance. \n"]
  usage_type : usage_type; [@ocaml.doc " Describes the usage details of the usage line item. \n"]
  service_code : service_code;
      [@ocaml.doc
        " The Amazon Web Services service code for this usage modification. This identifies the \
         specific Amazon Web Services service to the customer as a unique short abbreviation. For \
         example, [AmazonEC2] and [AWSKMS]. \n"]
}
[@@ocaml.doc
  " Represents an entry in a batch operation to create bill scenario usage modifications. \n"]

type nonrec batch_create_bill_scenario_usage_modification_entries =
  batch_create_bill_scenario_usage_modification_entry list
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_usage_modification_request = {
  client_token : client_token option;
      [@ocaml.doc
        " A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. \n"]
  usage_modifications : batch_create_bill_scenario_usage_modification_entries;
      [@ocaml.doc " List of usage that you want to model in the Bill Scenario. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc " The ID of the Bill Scenario for which you want to create the modeled usage. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_commitment_modification_item = {
  commitment_action : bill_scenario_commitment_modification_action option;
      [@ocaml.doc " The specific commitment action that was taken. \n"]
  usage_account_id : account_id option;
      [@ocaml.doc
        " The Amazon Web Services account ID associated with the created commitment modification. \n"]
  group : usage_group option;
      [@ocaml.doc " The group identifier for the created commitment modification. \n"]
  id : resource_id option;
      [@ocaml.doc " The unique identifier assigned to the created commitment modification. \n"]
  key : key option;
      [@ocaml.doc
        " The key of the successfully created entry. This can be any valid string. This key is \
         useful to identify errors associated with any commitment entry as any error is returned \
         with this key. \n"]
}
[@@ocaml.doc
  " Represents a successfully created item in a batch operation for bill scenario commitment \
   modifications. \n"]

type nonrec batch_create_bill_scenario_commitment_modification_items =
  batch_create_bill_scenario_commitment_modification_item list
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_commitment_modification_error_code =
  | INVALID_ACCOUNT [@ocaml.doc ""]
  | INTERNAL_SERVER_ERROR [@ocaml.doc ""]
  | CONFLICT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_commitment_modification_error = {
  error_code : batch_create_bill_scenario_commitment_modification_error_code option;
      [@ocaml.doc " The error code associated with the failed operation. \n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " A descriptive message for the error that occurred. \n"]
  key : key option; [@ocaml.doc " The key of the entry that caused the error. \n"]
}
[@@ocaml.doc
  " Represents an error that occurred during a batch create operation for bill scenario commitment \
   modifications. \n"]

type nonrec batch_create_bill_scenario_commitment_modification_errors =
  batch_create_bill_scenario_commitment_modification_error list
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_commitment_modification_response = {
  errors : batch_create_bill_scenario_commitment_modification_errors option;
      [@ocaml.doc
        " Returns the list of errors reason and the commitment item keys that cannot be created in \
         the Bill Scenario. \n"]
  items : batch_create_bill_scenario_commitment_modification_items option;
      [@ocaml.doc
        " Returns the list of successful commitment line items that were created for the Bill \
         Scenario. \n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_commitment_modification_entry = {
  commitment_action : bill_scenario_commitment_modification_action;
      [@ocaml.doc
        " The specific commitment action to be taken (e.g., adding a Reserved Instance or Savings \
         Plan). \n"]
  usage_account_id : account_id;
      [@ocaml.doc
        " The Amazon Web Services account ID to which this commitment will be applied to. \n"]
  group : usage_group option;
      [@ocaml.doc " An optional group identifier for the commitment modification. \n"]
  key : key;
      [@ocaml.doc
        " A unique identifier for this entry in the batch operation. This can be any valid string. \
         This key is useful to identify errors associated with any commitment entry as any error \
         is returned with this key. \n"]
}
[@@ocaml.doc
  " Represents an entry object in the batch operation to create bill scenario commitment \
   modifications. \n"]

type nonrec batch_create_bill_scenario_commitment_modification_entries =
  batch_create_bill_scenario_commitment_modification_entry list
[@@ocaml.doc ""]

type nonrec batch_create_bill_scenario_commitment_modification_request = {
  client_token : client_token option;
      [@ocaml.doc
        " A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. \n"]
  commitment_modifications : batch_create_bill_scenario_commitment_modification_entries;
      [@ocaml.doc " List of commitments that you want to model in the Bill Scenario. \n"]
  bill_scenario_id : resource_id;
      [@ocaml.doc
        " The ID of the Bill Scenario for which you want to create the modeled commitment. \n"]
}
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc " You do not have sufficient access to perform this action. \n"]
