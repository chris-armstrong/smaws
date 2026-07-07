type nonrec zoned_date_time = string [@@ocaml.doc ""]

type nonrec year_month_day = string [@@ocaml.doc ""]

type nonrec value = string [@@ocaml.doc ""]

type nonrec values = value list [@@ocaml.doc ""]

type nonrec date_interval = {
  end_ : year_month_day;
      [@ocaml.doc
        "The end of the time period. The end date is exclusive. For example, if [end] is \
         [2017-05-01], Amazon Web Services retrieves cost and usage data from the start date up \
         to, but not including, [2017-05-01].\n"]
  start : year_month_day;
      [@ocaml.doc
        "The beginning of the time period. The start date is inclusive. For example, if [start] is \
         [2017-01-01], Amazon Web Services retrieves cost and usage data starting at [2017-01-01] \
         up to the end date. The start date must be equal to or no later than the current date to \
         avoid a validation error.\n"]
}
[@@ocaml.doc "The time period of the request. \n"]

type nonrec reservation_group_key = string [@@ocaml.doc ""]

type nonrec reservation_group_value = string [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute_type = string [@@ocaml.doc ""]

type nonrec attributes = (attribute_type * attribute_value) list [@@ocaml.doc ""]

type nonrec utilization_percentage = string [@@ocaml.doc ""]

type nonrec utilization_percentage_in_units = string [@@ocaml.doc ""]

type nonrec purchased_hours = string [@@ocaml.doc ""]

type nonrec purchased_units = string [@@ocaml.doc ""]

type nonrec total_actual_hours = string [@@ocaml.doc ""]

type nonrec total_actual_units = string [@@ocaml.doc ""]

type nonrec unused_hours = string [@@ocaml.doc ""]

type nonrec unused_units = string [@@ocaml.doc ""]

type nonrec on_demand_cost_of_ri_hours_used = string [@@ocaml.doc ""]

type nonrec net_ri_savings = string [@@ocaml.doc ""]

type nonrec total_potential_ri_savings = string [@@ocaml.doc ""]

type nonrec amortized_upfront_fee = string [@@ocaml.doc ""]

type nonrec amortized_recurring_fee = string [@@ocaml.doc ""]

type nonrec total_amortized_fee = string [@@ocaml.doc ""]

type nonrec ri_cost_for_unused_hours = string [@@ocaml.doc ""]

type nonrec realized_savings = string [@@ocaml.doc ""]

type nonrec unrealized_savings = string [@@ocaml.doc ""]

type nonrec reservation_aggregates = {
  unrealized_savings : unrealized_savings option;
      [@ocaml.doc "The unrealized savings because of purchasing and using a reservation.\n"]
  realized_savings : realized_savings option;
      [@ocaml.doc "The realized savings because of purchasing and using a reservation.\n"]
  ri_cost_for_unused_hours : ri_cost_for_unused_hours option;
      [@ocaml.doc "The cost of unused hours for your reservation.\n"]
  total_amortized_fee : total_amortized_fee option;
      [@ocaml.doc
        "The total cost of your reservation. It's amortized over the reservation period.\n"]
  amortized_recurring_fee : amortized_recurring_fee option;
      [@ocaml.doc
        "The monthly cost of your reservation. It's amortized over the reservation period.\n"]
  amortized_upfront_fee : amortized_upfront_fee option;
      [@ocaml.doc
        "The upfront cost of your reservation. It's amortized over the reservation period.\n"]
  total_potential_ri_savings : total_potential_ri_savings option;
      [@ocaml.doc "How much you might save if you use your entire reservation.\n"]
  net_ri_savings : net_ri_savings option;
      [@ocaml.doc
        "How much you saved due to purchasing and utilizing reservation. Amazon Web Services \
         calculates this by subtracting [TotalAmortizedFee] from [OnDemandCostOfRIHoursUsed].\n"]
  on_demand_cost_of_ri_hours_used : on_demand_cost_of_ri_hours_used option;
      [@ocaml.doc "How much your reservation costs if charged On-Demand rates.\n"]
  unused_units : unused_units option;
      [@ocaml.doc
        "The number of Amazon EC2 reservation hours that you didn't use. It's converted to \
         normalized units. Normalized units are available only for Amazon EC2 usage after November \
         11, 2017.\n"]
  unused_hours : unused_hours option;
      [@ocaml.doc "The number of reservation hours that you didn't use.\n"]
  total_actual_units : total_actual_units option;
      [@ocaml.doc
        "The total number of Amazon EC2 reservation hours that you used. It's converted to \
         normalized units. Normalized units are available only for Amazon EC2 usage after November \
         11, 2017.\n"]
  total_actual_hours : total_actual_hours option;
      [@ocaml.doc "The total number of reservation hours that you used.\n"]
  purchased_units : purchased_units option;
      [@ocaml.doc
        "The number of Amazon EC2 reservation hours that you purchased. It's converted to \
         normalized units. Normalized units are available only for Amazon EC2 usage after November \
         11, 2017.\n"]
  purchased_hours : purchased_hours option;
      [@ocaml.doc "How many reservation hours that you purchased.\n"]
  utilization_percentage_in_units : utilization_percentage_in_units option;
      [@ocaml.doc
        "The percentage of Amazon EC2 reservation time that you used. It's converted to normalized \
         units. Normalized units are available only for Amazon EC2 usage after November 11, 2017.\n"]
  utilization_percentage : utilization_percentage option;
      [@ocaml.doc "The percentage of reservation time that you used.\n"]
}
[@@ocaml.doc "The aggregated numbers for your reservation usage.\n"]

type nonrec reservation_utilization_group = {
  utilization : reservation_aggregates option;
      [@ocaml.doc "How much you used this group of reservations.\n"]
  attributes : attributes option; [@ocaml.doc "The attributes for this group of reservations.\n"]
  value : reservation_group_value option;
      [@ocaml.doc "The value of a specific reservation attribute.\n"]
  key : reservation_group_key option; [@ocaml.doc "The key for a specific reservation attribute.\n"]
}
[@@ocaml.doc "A group of reservations that share a set of attributes.\n"]

type nonrec reservation_utilization_groups = reservation_utilization_group list [@@ocaml.doc ""]

type nonrec utilization_by_time = {
  total : reservation_aggregates option;
      [@ocaml.doc "The total number of reservation hours that were used.\n"]
  groups : reservation_utilization_groups option;
      [@ocaml.doc "The groups that this utilization result uses.\n"]
  time_period : date_interval option;
      [@ocaml.doc "The period of time that this utilization was used for.\n"]
}
[@@ocaml.doc "The amount of utilization, in hours.\n"]

type nonrec utilizations_by_time = utilization_by_time list [@@ocaml.doc ""]

type nonrec generic_string = string [@@ocaml.doc ""]

type nonrec usage_services = generic_string list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec update_cost_category_definition_response = {
  effective_start : zoned_date_time option;
      [@ocaml.doc
        "The cost category's effective start date. It can only be a billing start date (first day \
         of the month).\n"]
  cost_category_arn : arn option; [@ocaml.doc "The unique identifier for your cost category. \n"]
}
[@@ocaml.doc ""]

type nonrec cost_category_rule_version = CostCategoryExpressionV1 [@ocaml.doc ""]
[@@ocaml.doc "The rule schema version in this particular cost category.\n"]

type nonrec cost_category_value = string [@@ocaml.doc ""]

type nonrec dimension =
  | ANOMALY_TOTAL_IMPACT_PERCENTAGE [@ocaml.doc ""]
  | ANOMALY_TOTAL_IMPACT_ABSOLUTE [@ocaml.doc ""]
  | INVOICING_ENTITY [@ocaml.doc ""]
  | AGREEMENT_END_DATE_TIME_BEFORE [@ocaml.doc ""]
  | AGREEMENT_END_DATE_TIME_AFTER [@ocaml.doc ""]
  | PAYMENT_OPTION [@ocaml.doc ""]
  | SAVINGS_PLAN_ARN [@ocaml.doc ""]
  | SAVINGS_PLANS_TYPE [@ocaml.doc ""]
  | RIGHTSIZING_TYPE [@ocaml.doc ""]
  | RESOURCE_ID [@ocaml.doc ""]
  | RESERVATION_ID [@ocaml.doc ""]
  | BILLING_ENTITY [@ocaml.doc ""]
  | INSTANCE_TYPE_FAMILY [@ocaml.doc ""]
  | CACHE_ENGINE [@ocaml.doc ""]
  | DATABASE_ENGINE [@ocaml.doc ""]
  | DEPLOYMENT_OPTION [@ocaml.doc ""]
  | LEGAL_ENTITY_NAME [@ocaml.doc ""]
  | SUBSCRIPTION_ID [@ocaml.doc ""]
  | PLATFORM [@ocaml.doc ""]
  | SCOPE [@ocaml.doc ""]
  | TENANCY [@ocaml.doc ""]
  | OPERATING_SYSTEM [@ocaml.doc ""]
  | RECORD_TYPE [@ocaml.doc ""]
  | USAGE_TYPE_GROUP [@ocaml.doc ""]
  | USAGE_TYPE [@ocaml.doc ""]
  | SERVICE_CODE [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
  | REGION [@ocaml.doc ""]
  | PURCHASE_TYPE [@ocaml.doc ""]
  | OPERATION [@ocaml.doc ""]
  | LINKED_ACCOUNT_NAME [@ocaml.doc ""]
  | PAYER_ACCOUNT [@ocaml.doc ""]
  | LINKED_ACCOUNT [@ocaml.doc ""]
  | INSTANCE_TYPE [@ocaml.doc ""]
  | AZ [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_option =
  | GREATER_THAN_OR_EQUAL [@ocaml.doc ""]
  | CASE_INSENSITIVE [@ocaml.doc ""]
  | CASE_SENSITIVE [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | ENDS_WITH [@ocaml.doc ""]
  | STARTS_WITH [@ocaml.doc ""]
  | ABSENT [@ocaml.doc ""]
  | EQUALS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec match_options = match_option list [@@ocaml.doc ""]

type nonrec dimension_values = {
  match_options : match_options option;
      [@ocaml.doc
        "The match options that you can use to filter your results.\n\n\
        \  [MatchOptions] is only applicable for actions related to cost category and Anomaly \
         Subscriptions. Refer to the documentation for each specific API to see what is supported.\n\
        \ \n\
        \  The default values for [MatchOptions] are [EQUALS] and [CASE_SENSITIVE].\n\
        \  "]
  values : values option;
      [@ocaml.doc
        "The metadata values that you can use to filter and group your results. You can use \
         [GetDimensionValues] to find specific values.\n"]
  key : dimension option;
      [@ocaml.doc
        "The names of the metadata types that you can use to filter and group your results. For \
         example, [AZ] returns a list of Availability Zones.\n\n\
        \ Not all dimensions are supported in each API. Refer to the documentation for each \
         specific API to see what is supported.\n\
        \ \n\
        \   [LINKED_ACCOUNT_NAME] and [SERVICE_CODE] can only be used in \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html}CostCategoryRule}.\n\
        \  \n\
        \    [ANOMALY_TOTAL_IMPACT_ABSOLUTE] and [ANOMALY_TOTAL_IMPACT_PERCENTAGE] can only be \
         used in \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalySubscription.html}AnomalySubscriptions}.\n\
        \   "]
}
[@@ocaml.doc
  "The metadata that you can use to filter and group your results. You can use \
   [GetDimensionValues] to find specific values.\n"]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_values = {
  match_options : match_options option;
      [@ocaml.doc
        "The match options that you can use to filter your results. [MatchOptions] is only \
         applicable for actions related to cost category. The default values for [MatchOptions] \
         are [EQUALS] and [CASE_SENSITIVE].\n"]
  values : values option; [@ocaml.doc "The specific value of the tag.\n"]
  key : tag_key option; [@ocaml.doc "The key for the tag.\n"]
}
[@@ocaml.doc
  "The values that are available for a tag.\n\n\
  \ If [Values] and [Key] aren't specified, the [ABSENT] [MatchOption] is applied to all tags. \
   That is, it's filtered on resources with no tags.\n\
  \ \n\
  \  If [Key] is provided and [Values] isn't specified, the [ABSENT] [MatchOption] is applied to \
   the tag [Key] only. That is, it's filtered on resources without the given tag key.\n\
  \  "]

type nonrec cost_category_name = string [@@ocaml.doc ""]

type nonrec cost_category_values = {
  match_options : match_options option;
      [@ocaml.doc
        "The match options that you can use to filter your results. MatchOptions is only \
         applicable for actions related to cost category. The default values for [MatchOptions] is \
         [EQUALS] and [CASE_SENSITIVE]. \n"]
  values : values option; [@ocaml.doc "The specific value of the cost category.\n"]
  key : cost_category_name option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The Cost Categories values used for filtering the costs.\n\n\
  \ If [Values] and [Key] are not specified, the [ABSENT] [MatchOption] is applied to all Cost \
   Categories. That is, it filters on resources that aren't mapped to any Cost Categories.\n\
  \ \n\
  \  If [Values] is provided and [Key] isn't specified, the [ABSENT] [MatchOption] is applied to \
   the Cost Categories [Key] only. That is, it filters on resources without the given Cost \
   Categories key.\n\
  \  "]

type expression = {
  cost_categories : cost_category_values option;
      [@ocaml.doc "The filter that's based on [CostCategory] values.\n"]
  tags : tag_values option; [@ocaml.doc "The specific [Tag] to use for [Expression].\n"]
  dimensions : dimension_values option;
      [@ocaml.doc "The specific [Dimension] to use for [Expression].\n"]
  not : expression option; [@ocaml.doc "Return results that don't match a [Dimension] object.\n"]
  and_ : expressions option; [@ocaml.doc "Return results that match both [Dimension] objects.\n"]
  \#or : expressions option; [@ocaml.doc "Return results that match either [Dimension] object.\n"]
}
[@@ocaml.doc
  "Use [Expression] to filter in various Cost Explorer APIs.\n\n\
  \ Not all [Expression] types are supported in each API. Refer to the documentation for each \
   specific API to see what is supported.\n\
  \ \n\
  \  There are two patterns:\n\
  \  \n\
  \   {ul\n\
  \         {-  Simple dimension values.\n\
  \             \n\
  \              {ul\n\
  \                    {-  There are three types of simple dimension values: [CostCategories], \
   [Tags], and [Dimensions].\n\
  \                        \n\
  \                         {ul\n\
  \                               {-  Specify the [CostCategories] field to define a filter that \
   acts on Cost Categories.\n\
  \                                   \n\
  \                                    }\n\
  \                               {-  Specify the [Tags] field to define a filter that acts on \
   Cost Allocation Tags.\n\
  \                                   \n\
  \                                    }\n\
  \                               {-  Specify the [Dimensions] field to define a filter that acts \
   on the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_DimensionValues.html} \
   [DimensionValues] }.\n\
  \                                   \n\
  \                                    }\n\
  \                               \n\
  \                     }\n\
  \                      }\n\
  \                    {-  For each filter type, you can set the dimension name and values for the \
   filters that you plan to use.\n\
  \                        \n\
  \                         {ul\n\
  \                               {-  For example, you can filter for [REGION==us-east-1 OR\n\
  \                                        REGION==us-west-1]. For [GetRightsizingRecommendation], \
   the Region is a full name (for example, [REGION==US East (N.\n\
  \                                        Virginia)].\n\
  \                                   \n\
  \                                    }\n\
  \                               {-  The corresponding [Expression] for this example is as \
   follows: [{ \"Dimensions\": { \"Key\": \"REGION\", \"Values\": \\[\n\
  \                                        \"us-east-1\", \"us-west-1\" \\] } }] \n\
  \                                   \n\
  \                                    }\n\
  \                               {-  As shown in the previous example, lists of dimension values \
   are combined with [OR] when applying the filter.\n\
  \                                   \n\
  \                                    }\n\
  \                               \n\
  \                     }\n\
  \                      }\n\
  \                    {-  You can also set different match options to further control how the \
   filter behaves. Not all APIs support match options. Refer to the documentation for each \
   specific API to see what is supported.\n\
  \                        \n\
  \                         {ul\n\
  \                               {-  For example, you can filter for linked account names that \
   start with \"a\".\n\
  \                                   \n\
  \                                    }\n\
  \                               {-  The corresponding [Expression] for this example is as \
   follows: [{ \"Dimensions\": { \"Key\":\n\
  \                                        \"LINKED_ACCOUNT_NAME\", \"MatchOptions\": \\[ \
   \"STARTS_WITH\" \\],\n\
  \                                        \"Values\": \\[ \"a\" \\] } }] \n\
  \                                   \n\
  \                                    }\n\
  \                               \n\
  \                     }\n\
  \                      }\n\
  \                    \n\
  \          }\n\
  \           }\n\
  \         {-  Compound [Expression] types with logical operations.\n\
  \             \n\
  \              {ul\n\
  \                    {-  You can use multiple [Expression] types and the logical operators \
   [AND/OR/NOT] to create a list of one or more [Expression] objects. By doing this, you can \
   filter by more advanced options.\n\
  \                        \n\
  \                         }\n\
  \                    {-  For example, you can filter by [((REGION == us-east-1 OR REGION\n\
  \                                == us-west-1) OR (TAG.Type == Type1)) AND (USAGE_TYPE !=\n\
  \                                DataTransfer)].\n\
  \                        \n\
  \                         }\n\
  \                    {-  The corresponding [Expression] for this example is as follows: [{ \
   \"And\": \\[ {\"Or\": \\[ {\"Dimensions\": { \"Key\": \"REGION\",\n\
  \                                \"Values\": \\[ \"us-east-1\", \"us-west-1\" \\] }}, {\"Tags\": \
   { \"Key\":\n\
  \                                \"TagName\", \"Values\": \\[\"Value1\"\\] } } \\]}, {\"Not\": \
   {\"Dimensions\": {\n\
  \                                \"Key\": \"USAGE_TYPE\", \"Values\": \\[\"DataTransfer\"\\] }}} \
   \\] }\n\
  \                            ] \n\
  \                        \n\
  \                         }\n\
  \                    \n\
  \          }\n\
  \            Because each [Expression] can have only one operator, the service returns an error \
   if more than one is specified. The following example shows an [Expression] object that creates \
   an error: [ { \"And\": \\[ ... \\], \"Dimensions\": { \"Key\": \"USAGE_TYPE\", \"Values\":\n\
  \                            \\[ \"DataTransfer\" \\] } } ] \n\
  \            \n\
  \             The following is an example of the corresponding error message: [\"Expression has \
   more than one roots. Only one root operator is\n\
  \                            allowed for each expression: And, Or, Not, Dimensions, Tags,\n\
  \                            CostCategories\"] \n\
  \             \n\
  \               }\n\
  \         }\n\
  \    For the [GetRightsizingRecommendation] action, a combination of OR and NOT isn't supported. \
   OR isn't supported between different dimensions, or dimensions and tags. NOT operators aren't \
   supported. Dimensions are also limited to [LINKED_ACCOUNT], [REGION], or [RIGHTSIZING_TYPE].\n\
  \    \n\
  \     For the [GetReservationPurchaseRecommendation] action, only NOT is supported. AND and OR \
   aren't supported. Dimensions are limited to [LINKED_ACCOUNT].\n\
  \     \n\
  \      "]

and expressions = expression list [@@ocaml.doc ""]

type nonrec cost_category_inherited_value_dimension_name =
  | TAG [@ocaml.doc ""]
  | LINKED_ACCOUNT_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_category_inherited_value_dimension = {
  dimension_key : generic_string option; [@ocaml.doc "The key to extract cost category values.\n"]
  dimension_name : cost_category_inherited_value_dimension_name option;
      [@ocaml.doc
        "The name of the dimension that's used to group costs.\n\n\
        \ If you specify [LINKED_ACCOUNT_NAME], the cost category value is based on account name. \
         If you specify [TAG], the cost category value is based on the value of the specified tag \
         key.\n\
        \ "]
}
[@@ocaml.doc
  "When you create or update a cost category, you can define the [CostCategoryRule] rule type as \
   [INHERITED_VALUE]. This rule type adds the flexibility to define a rule that dynamically \
   inherits the cost category value from the dimension value that's defined by \
   [CostCategoryInheritedValueDimension]. For example, suppose that you want to dynamically group \
   costs that are based on the value of a specific tag key. First, choose an inherited value rule \
   type, and then choose the tag dimension and specify the tag key to use.\n"]

type nonrec cost_category_rule_type = INHERITED_VALUE [@ocaml.doc ""] | REGULAR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_category_rule = {
  type_ : cost_category_rule_type option;
      [@ocaml.doc
        "You can define the [CostCategoryRule] rule type as either [REGULAR] or [INHERITED_VALUE]. \
         The [INHERITED_VALUE] rule type adds the flexibility to define a rule that dynamically \
         inherits the cost category value. This value is from the dimension value that's defined \
         by [CostCategoryInheritedValueDimension]. For example, suppose that you want to costs to \
         be dynamically grouped based on the value of a specific tag key. First, choose an \
         inherited value rule type, and then choose the tag dimension and specify the tag key to \
         use.\n"]
  inherited_value : cost_category_inherited_value_dimension option;
      [@ocaml.doc
        "The value the line item is categorized as if the line item contains the matched dimension.\n"]
  rule : expression option;
      [@ocaml.doc
        "An \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object used to categorize costs. This supports dimensions, tags, and nested expressions. \
         Currently the only dimensions supported are [LINKED_ACCOUNT], [SERVICE_CODE], \
         [RECORD_TYPE], [LINKED_ACCOUNT_NAME], [REGION], and [USAGE_TYPE].\n\n\
        \  [RECORD_TYPE] is a dimension used for Cost Explorer APIs, and is also supported for \
         cost category expressions. This dimension uses different terms, depending on whether \
         you're using the console or API/JSON editor. For a detailed comparison, see \
         {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-cost-categories.html#cost-categories-terms}Term \
         Comparisons} in the {i Billing and Cost Management User Guide}.\n\
        \ "]
  value : cost_category_value option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Rules are processed in order. If there are multiple rules that match the line item, then the \
   first rule to match is used to determine that cost category value.\n"]

type nonrec cost_category_rules_list = cost_category_rule list [@@ocaml.doc ""]

type nonrec cost_category_split_charge_rule_targets_list = generic_string list [@@ocaml.doc ""]

type nonrec cost_category_split_charge_method =
  | EVEN [@ocaml.doc ""]
  | PROPORTIONAL [@ocaml.doc ""]
  | FIXED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_category_split_charge_rule_parameter_type =
  | ALLOCATION_PERCENTAGES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_category_split_charge_rule_parameter_values_list = generic_string list
[@@ocaml.doc ""]

type nonrec cost_category_split_charge_rule_parameter = {
  values : cost_category_split_charge_rule_parameter_values_list;
      [@ocaml.doc "The parameter values. \n"]
  type_ : cost_category_split_charge_rule_parameter_type; [@ocaml.doc "The parameter type. \n"]
}
[@@ocaml.doc "The parameters for a split charge method. \n"]

type nonrec cost_category_split_charge_rule_parameters_list =
  cost_category_split_charge_rule_parameter list
[@@ocaml.doc ""]

type nonrec cost_category_split_charge_rule = {
  parameters : cost_category_split_charge_rule_parameters_list option;
      [@ocaml.doc
        "The parameters for a split charge method. This is only required for the [FIXED] method. \n"]
  method_ : cost_category_split_charge_method;
      [@ocaml.doc
        "The method that's used to define how to split your source costs across your targets. \n\n\
        \  [Proportional] - Allocates charges across your targets based on the proportional \
         weighted cost of each target.\n\
        \ \n\
        \   [Fixed] - Allocates charges across your targets based on your defined allocation \
         percentage.\n\
        \  \n\
        \   >[Even] - Allocates costs evenly across all targets.\n\
        \   "]
  targets : cost_category_split_charge_rule_targets_list;
      [@ocaml.doc
        "The cost category values that you want to split costs across. These values can't be used \
         as a source in other split charge rules. \n"]
  source : generic_string;
      [@ocaml.doc
        "The cost category value that you want to split. That value can't be used as a source or a \
         target in other split charge rules. To indicate uncategorized costs, you can use an empty \
         string as the source.\n"]
}
[@@ocaml.doc
  "Use the split charge rule to split the cost of one cost category value across several other \
   target values. \n"]

type nonrec cost_category_split_charge_rules_list = cost_category_split_charge_rule list
[@@ocaml.doc ""]

type nonrec update_cost_category_definition_request = {
  split_charge_rules : cost_category_split_charge_rules_list option;
      [@ocaml.doc
        " The split charge rules used to allocate your charges between your cost category values. \n"]
  default_value : cost_category_value option; [@ocaml.doc ""]
  rules : cost_category_rules_list;
      [@ocaml.doc
        "The [Expression] object used to categorize costs. For more information, see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html}CostCategoryRule \
         }. \n"]
  rule_version : cost_category_rule_version; [@ocaml.doc ""]
  effective_start : zoned_date_time option;
      [@ocaml.doc
        "The cost category's effective start date. It can only be a billing start date (first day \
         of the month). If the date isn't provided, it's the first day of the current month. Dates \
         can't be before the previous twelve months, or in the future.\n"]
  cost_category_arn : arn; [@ocaml.doc "The unique identifier for your cost category.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  " You've reached the limit on the number of resources you can create, or exceeded the size of an \
   individual resource. \n"]

type nonrec resource_not_found_exception = {
  resource_name : arn option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc " The specified ARN in the request doesn't exist. \n"]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You made too many calls in a short period of time. Try again later.\n"]

type nonrec update_cost_allocation_tags_status_error = {
  message : error_message option;
      [@ocaml.doc "A message explaining why the action failed on this entry. \n"]
  code : generic_string option;
      [@ocaml.doc "An error code representing why the action failed on this entry. \n"]
  tag_key : tag_key option; [@ocaml.doc "The key for the cost allocation tag. \n"]
}
[@@ocaml.doc
  "Gives a detailed description of the result of an action. It's on each cost allocation tag entry \
   in the request. \n"]

type nonrec update_cost_allocation_tags_status_errors =
  update_cost_allocation_tags_status_error list
[@@ocaml.doc ""]

type nonrec update_cost_allocation_tags_status_response = {
  errors : update_cost_allocation_tags_status_errors option;
      [@ocaml.doc
        "A list of [UpdateCostAllocationTagsStatusError] objects with error details about each \
         cost allocation tag that can't be updated. If there's no failure, an empty array returns. \n"]
}
[@@ocaml.doc ""]

type nonrec cost_allocation_tag_status = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_allocation_tag_status_entry = {
  status : cost_allocation_tag_status; [@ocaml.doc "The status of a cost allocation tag. \n"]
  tag_key : tag_key; [@ocaml.doc "The key for the cost allocation tag. \n"]
}
[@@ocaml.doc
  "The cost allocation tag status. The status of a key can either be active or inactive. \n"]

type nonrec cost_allocation_tag_status_list = cost_allocation_tag_status_entry list [@@ocaml.doc ""]

type nonrec update_cost_allocation_tags_status_request = {
  cost_allocation_tags_status : cost_allocation_tag_status_list;
      [@ocaml.doc
        "The list of [CostAllocationTagStatusEntry] objects that are used to update cost \
         allocation tags status for this request. \n"]
}
[@@ocaml.doc ""]

type nonrec update_anomaly_subscription_response = {
  subscription_arn : generic_string; [@ocaml.doc "A cost anomaly subscription ARN. \n"]
}
[@@ocaml.doc ""]

type nonrec nullable_non_negative_double = float [@@ocaml.doc ""]

type nonrec anomaly_subscription_frequency =
  | WEEKLY [@ocaml.doc ""]
  | IMMEDIATE [@ocaml.doc ""]
  | DAILY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec monitor_arn_list = arn list [@@ocaml.doc ""]

type nonrec subscriber_address = string [@@ocaml.doc ""]

type nonrec subscriber_type = SNS [@ocaml.doc ""] | EMAIL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec subscriber_status = DECLINED [@ocaml.doc ""] | CONFIRMED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec subscriber = {
  status : subscriber_status option;
      [@ocaml.doc "Indicates if the subscriber accepts the notifications. \n"]
  type_ : subscriber_type option; [@ocaml.doc "The notification delivery channel. \n"]
  address : subscriber_address option;
      [@ocaml.doc
        "The email address or SNS Amazon Resource Name (ARN). This depends on the [Type]. \n"]
}
[@@ocaml.doc "The recipient of [AnomalySubscription] notifications. \n"]

type nonrec subscribers = subscriber list [@@ocaml.doc ""]

type nonrec update_anomaly_subscription_request = {
  threshold_expression : expression option;
      [@ocaml.doc
        "The update to the \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object used to specify the anomalies that you want to generate alerts for. This supports \
         dimensions and nested expressions. The supported dimensions are \
         [ANOMALY_TOTAL_IMPACT_ABSOLUTE] and [ANOMALY_TOTAL_IMPACT_PERCENTAGE], corresponding to \
         an anomaly\226\128\153s TotalImpact and TotalImpactPercentage, respectively (see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Impact.html}Impact} \
         for more details). The supported nested expression types are [AND] and [OR]. The match \
         option [GREATER_THAN_OR_EQUAL] is required. Values must be numbers between 0 and \
         10,000,000,000 in string format.\n\n\
        \ You can specify either Threshold or ThresholdExpression, but not both.\n\
        \ \n\
        \  The following are examples of valid ThresholdExpressions:\n\
        \  \n\
        \   {ul\n\
        \         {-  Absolute threshold: [{ \"Dimensions\": { \"Key\": \
         \"ANOMALY_TOTAL_IMPACT_ABSOLUTE\",\n\
        \            \"MatchOptions\": \\[ \"GREATER_THAN_OR_EQUAL\" \\], \"Values\": \\[ \"100\" \
         \\] } }] \n\
        \             \n\
        \              }\n\
        \         {-  Percentage threshold: [{ \"Dimensions\": { \"Key\":\n\
        \            \"ANOMALY_TOTAL_IMPACT_PERCENTAGE\", \"MatchOptions\": \\[ \
         \"GREATER_THAN_OR_EQUAL\" \\],\n\
        \            \"Values\": \\[ \"100\" \\] } }] \n\
        \             \n\
        \              }\n\
        \         {-   [AND] two thresholds together: [{ \"And\": \\[ { \"Dimensions\": { \"Key\":\n\
        \            \"ANOMALY_TOTAL_IMPACT_ABSOLUTE\", \"MatchOptions\": \\[ \
         \"GREATER_THAN_OR_EQUAL\" \\], \"Values\":\n\
        \            \\[ \"100\" \\] } }, { \"Dimensions\": { \"Key\": \
         \"ANOMALY_TOTAL_IMPACT_PERCENTAGE\",\n\
        \            \"MatchOptions\": \\[ \"GREATER_THAN_OR_EQUAL\" \\], \"Values\": \\[ \"100\" \
         \\] } } \\] }] \n\
        \             \n\
        \              }\n\
        \         {-   [OR] two thresholds together: [{ \"Or\": \\[ { \"Dimensions\": { \"Key\":\n\
        \            \"ANOMALY_TOTAL_IMPACT_ABSOLUTE\", \"MatchOptions\": \\[ \
         \"GREATER_THAN_OR_EQUAL\" \\], \"Values\":\n\
        \            \\[ \"100\" \\] } }, { \"Dimensions\": { \"Key\": \
         \"ANOMALY_TOTAL_IMPACT_PERCENTAGE\",\n\
        \            \"MatchOptions\": \\[ \"GREATER_THAN_OR_EQUAL\" \\], \"Values\": \\[ \"100\" \
         \\] } } \\] }] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  subscription_name : generic_string option; [@ocaml.doc "The new name of the subscription. \n"]
  subscribers : subscribers option; [@ocaml.doc "The update to the subscriber list. \n"]
  monitor_arn_list : monitor_arn_list option; [@ocaml.doc "A list of cost anomaly monitor ARNs. \n"]
  frequency : anomaly_subscription_frequency option;
      [@ocaml.doc "The update to the frequency value that subscribers receive notifications. \n"]
  threshold : nullable_non_negative_double option;
      [@ocaml.doc
        "(deprecated)\n\n\
        \ The update to the threshold value for receiving notifications. \n\
        \ \n\
        \  This field has been deprecated. To update a threshold, use ThresholdExpression. \
         Continued use of Threshold will be treated as shorthand syntax for a ThresholdExpression.\n\
        \  \n\
        \   You can specify either Threshold or ThresholdExpression, but not both.\n\
        \   "]
  subscription_arn : generic_string;
      [@ocaml.doc "A cost anomaly subscription Amazon Resource Name (ARN). \n"]
}
[@@ocaml.doc ""]

type nonrec unknown_subscription_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The cost anomaly subscription does not exist for the account. \n"]

type nonrec unknown_monitor_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The cost anomaly monitor does not exist for the account. \n"]

type nonrec update_anomaly_monitor_response = {
  monitor_arn : generic_string; [@ocaml.doc "A cost anomaly monitor ARN. \n"]
}
[@@ocaml.doc ""]

type nonrec update_anomaly_monitor_request = {
  monitor_name : generic_string option; [@ocaml.doc "The new name for the cost anomaly monitor. \n"]
  monitor_arn : generic_string; [@ocaml.doc "Cost anomaly monitor Amazon Resource Names (ARNs). \n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_key = string [@@ocaml.doc ""]

type nonrec resource_tag_key_list = resource_tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_tag_keys : resource_tag_key_list;
      [@ocaml.doc
        "A list of tag keys associated with tags that need to be removed from the resource. If you \
         specify a tag key that doesn't exist, it's ignored. Although the maximum number of array \
         members is 200, user-tag maximum is 50. The remaining are reserved for Amazon Web \
         Services use. \n"]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource. For a list of supported resources, see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_ResourceTag.html}ResourceTag}. \n"]
}
[@@ocaml.doc ""]

type nonrec unresolvable_usage_unit_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Cost Explorer was unable to identify the usage unit. Provide [UsageType/UsageTypeGroup] filter \
   selections that contain matching units, for example: [hours].\n"]

type nonrec total_running_normalized_units = string [@@ocaml.doc ""]

type nonrec total_running_hours = string [@@ocaml.doc ""]

type nonrec numeric_operator =
  | BETWEEN [@ocaml.doc ""]
  | LESS_THAN [@ocaml.doc ""]
  | GREATER_THAN [@ocaml.doc ""]
  | LESS_THAN_OR_EQUAL [@ocaml.doc ""]
  | GREATER_THAN_OR_EQUAL [@ocaml.doc ""]
  | EQUAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec generic_double = float [@@ocaml.doc ""]

type nonrec total_impact_filter = {
  end_value : generic_double option;
      [@ocaml.doc "The upper bound dollar value that's used in the filter. \n"]
  start_value : generic_double;
      [@ocaml.doc "The lower bound dollar value that's used in the filter. \n"]
  numeric_operator : numeric_operator;
      [@ocaml.doc "The comparing value that's used in the filter. \n"]
}
[@@ocaml.doc "Filters cost anomalies based on the total impact. \n"]

type nonrec too_many_tags_exception = {
  resource_name : arn option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Can occur if you specify a number of tags for a resource greater than the maximum 50 user tags \
   per resource.\n"]

type nonrec terminate_recommendation_detail = {
  currency_code : generic_string option;
      [@ocaml.doc
        "The currency code that Amazon Web Services used to calculate the costs for this instance.\n"]
  estimated_monthly_savings : generic_string option;
      [@ocaml.doc "The estimated savings that result from modification, on a monthly basis.\n"]
}
[@@ocaml.doc "Details on termination recommendation. \n"]

type nonrec term_in_years = THREE_YEARS [@ocaml.doc ""] | ONE_YEAR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec generic_boolean = bool [@@ocaml.doc ""]

type nonrec ec2_resource_details = {
  vcpu : generic_string option;
      [@ocaml.doc "The number of VCPU cores in the Amazon Web Services instance type.\n"]
  storage : generic_string option;
      [@ocaml.doc
        "The disk storage of the Amazon Web Services instance. This doesn't include EBS storage.\n"]
  network_performance : generic_string option;
      [@ocaml.doc "The network performance capacity of the Amazon Web Services instance.\n"]
  memory : generic_string option;
      [@ocaml.doc "The memory capacity of the Amazon Web Services instance.\n"]
  sku : generic_string option; [@ocaml.doc "The SKU of the product.\n"]
  region : generic_string option; [@ocaml.doc "The Amazon Web Services Region of the instance.\n"]
  platform : generic_string option;
      [@ocaml.doc
        "The platform of the Amazon Web Services instance. The platform is the specific \
         combination of operating system, license model, and software on an instance.\n"]
  instance_type : generic_string option; [@ocaml.doc "The type of Amazon Web Services instance.\n"]
  hourly_on_demand_rate : generic_string option;
      [@ocaml.doc "The hourly public On-Demand rate for the instance type.\n"]
}
[@@ocaml.doc "Details on the Amazon EC2 Resource.\n"]

type nonrec resource_details = {
  ec2_resource_details : ec2_resource_details option;
      [@ocaml.doc "Details for the Amazon EC2 resource.\n"]
}
[@@ocaml.doc "Details for the resource.\n"]

type nonrec ebs_resource_utilization = {
  ebs_write_bytes_per_second : generic_string option;
      [@ocaml.doc "The maximum size of write operations per second. \n"]
  ebs_read_bytes_per_second : generic_string option;
      [@ocaml.doc "The maximum size of read operations per second \n"]
  ebs_write_ops_per_second : generic_string option;
      [@ocaml.doc "The maximum number of write operations per second. \n"]
  ebs_read_ops_per_second : generic_string option;
      [@ocaml.doc "The maximum number of read operations per second. \n"]
}
[@@ocaml.doc
  "The EBS field that contains a list of EBS metrics that are associated with the current instance. \n"]

type nonrec disk_resource_utilization = {
  disk_write_bytes_per_second : generic_string option;
      [@ocaml.doc "The maximum write throughput operations per second. \n"]
  disk_read_bytes_per_second : generic_string option;
      [@ocaml.doc "The maximum read throughput operations per second. \n"]
  disk_write_ops_per_second : generic_string option;
      [@ocaml.doc "The maximum number of write operations per second. \n"]
  disk_read_ops_per_second : generic_string option;
      [@ocaml.doc "The maximum number of read operations per second. \n"]
}
[@@ocaml.doc
  "The field that contains a list of disk (local storage) metrics that are associated with the \
   current instance. \n"]

type nonrec network_resource_utilization = {
  network_packets_out_per_second : generic_string option;
      [@ocaml.doc "The network outbound packets that are measured in packets per second. \n"]
  network_packets_in_per_second : generic_string option;
      [@ocaml.doc "The network inbound packets that are measured in packets per second. \n"]
  network_out_bytes_per_second : generic_string option;
      [@ocaml.doc
        "The network outbound throughput utilization measured in Bytes per second (Bps). \n"]
  network_in_bytes_per_second : generic_string option;
      [@ocaml.doc
        "The network inbound throughput utilization measured in Bytes per second (Bps). \n"]
}
[@@ocaml.doc
  "The network field that contains a list of network metrics that are associated with the current \
   instance. \n"]

type nonrec ec2_resource_utilization = {
  network_resource_utilization : network_resource_utilization option;
      [@ocaml.doc
        "The network field that contains a list of network metrics that are associated with the \
         current instance. \n"]
  disk_resource_utilization : disk_resource_utilization option;
      [@ocaml.doc
        "The field that contains a list of disk (local storage) metrics that are associated with \
         the current instance. \n"]
  ebs_resource_utilization : ebs_resource_utilization option;
      [@ocaml.doc
        "The EBS field that contains a list of EBS metrics that are associated with the current \
         instance. \n"]
  max_storage_utilization_percentage : generic_string option;
      [@ocaml.doc
        "The maximum observed or expected storage utilization of the instance. This doesn't \
         include EBS storage.\n"]
  max_memory_utilization_percentage : generic_string option;
      [@ocaml.doc "The maximum observed or expected memory utilization of the instance.\n"]
  max_cpu_utilization_percentage : generic_string option;
      [@ocaml.doc "The maximum observed or expected CPU utilization of the instance.\n"]
}
[@@ocaml.doc "Utilization metrics for the instance. \n"]

type nonrec resource_utilization = {
  ec2_resource_utilization : ec2_resource_utilization option;
      [@ocaml.doc "The utilization of current Amazon EC2 instance. \n"]
}
[@@ocaml.doc "Resource utilization of current resource. \n"]

type nonrec platform_difference =
  | VIRTUALIZATION_TYPE [@ocaml.doc ""]
  | INSTANCE_STORE_AVAILABILITY [@ocaml.doc ""]
  | STORAGE_INTERFACE [@ocaml.doc ""]
  | NETWORK_INTERFACE [@ocaml.doc ""]
  | HYPERVISOR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec platform_differences = platform_difference list [@@ocaml.doc ""]

type nonrec target_instance = {
  platform_differences : platform_differences option;
      [@ocaml.doc
        "Explains the actions that you might need to take to successfully migrate your workloads \
         from the current instance type to the recommended instance type. \n"]
  expected_resource_utilization : resource_utilization option;
      [@ocaml.doc "The expected utilization metrics for target instance type.\n"]
  resource_details : resource_details option; [@ocaml.doc "Details on the target instance type. \n"]
  default_target_instance : generic_boolean option;
      [@ocaml.doc
        "Determines whether this recommendation is the defaulted Amazon Web Services recommendation.\n"]
  currency_code : generic_string option;
      [@ocaml.doc
        "The currency code that Amazon Web Services used to calculate the costs for this instance.\n"]
  estimated_monthly_savings : generic_string option;
      [@ocaml.doc "The estimated savings that result from modification, on a monthly basis.\n"]
  estimated_monthly_cost : generic_string option;
      [@ocaml.doc "The expected cost to operate this instance type on a monthly basis.\n"]
}
[@@ocaml.doc "Details on recommended instance.\n"]

type nonrec target_instances_list = target_instance list [@@ocaml.doc ""]

type nonrec tag_values_list = tag_values list [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec resource_tag_value = string [@@ocaml.doc ""]

type nonrec resource_tag = {
  value : resource_tag_value; [@ocaml.doc "The value that's associated with the tag. \n"]
  key : resource_tag_key; [@ocaml.doc "The key that's associated with the tag. \n"]
}
[@@ocaml.doc
  "The tag structure that contains a tag key and value. \n\n\
  \  Tagging is supported only for the following Cost Explorer resource types: \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalyMonitor.html} \
   [AnomalyMonitor] }, \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalySubscription.html} \
   [AnomalySubscription] }, \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategory.html} \
   [CostCategory] }.\n\
  \  \n\
  \   "]

type nonrec resource_tag_list = resource_tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_tags : resource_tag_list;
      [@ocaml.doc
        " A list of tag key-value pairs to be added to the resource.\n\n\
        \ Each tag consists of a key and a value, and each key must be unique for the resource. \
         The following restrictions apply to resource tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Although the maximum number of array members is 200, you can assign a maximum \
         of 50 user-tags to one resource. The remaining are reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a key is 128 characters\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a value is 256 characters\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values can only contain alphanumeric characters, spaces, and any of \
         the following: [_.:/=+@-] \n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are case sensitive\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are trimmed for any leading or trailing whitespaces\n\
        \            \n\
        \             }\n\
        \        {-  Don\226\128\153t use [aws:] as a prefix for your keys. This prefix is \
         reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource. For a list of supported resources, see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_ResourceTag.html}ResourceTag}. \n"]
}
[@@ocaml.doc ""]

type nonrec entity = string [@@ocaml.doc ""]

type nonrec tag_list = entity list [@@ocaml.doc ""]

type nonrec supported_savings_plans_type =
  | DATABASE_SP [@ocaml.doc ""]
  | SAGEMAKER_SP [@ocaml.doc ""]
  | EC2_INSTANCE_SP [@ocaml.doc ""]
  | COMPUTE_SP [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recommendation_id = string [@@ocaml.doc ""]

type nonrec start_savings_plans_purchase_recommendation_generation_response = {
  estimated_completion_time : zoned_date_time option;
      [@ocaml.doc "The estimated time for when the recommendation generation will complete.\n"]
  generation_started_time : zoned_date_time option;
      [@ocaml.doc "The start time of the recommendation generation.\n"]
  recommendation_id : recommendation_id option;
      [@ocaml.doc "The ID for this specific recommendation.\n"]
}
[@@ocaml.doc ""]

type nonrec start_savings_plans_purchase_recommendation_generation_request = unit [@@ocaml.doc ""]

type nonrec generation_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A request to generate a recommendation or analysis is already in progress.\n"]

type nonrec data_unavailable_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested data is unavailable.\n"]

type nonrec cost_allocation_tag_backfill_status =
  | FAILED [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_allocation_tag_backfill_request = {
  last_updated_at : zoned_date_time option;
      [@ocaml.doc " The time when the backfill status was last updated. \n"]
  backfill_status : cost_allocation_tag_backfill_status option;
      [@ocaml.doc " The status of the cost allocation tag backfill request. \n"]
  completed_at : zoned_date_time option; [@ocaml.doc " The backfill completion time. \n"]
  requested_at : zoned_date_time option;
      [@ocaml.doc " The time when the backfill was requested. \n"]
  backfill_from : zoned_date_time option; [@ocaml.doc " The date the backfill starts from. \n"]
}
[@@ocaml.doc
  " The cost allocation tag backfill request structure that contains metadata and details of a \
   certain backfill.\n"]

type nonrec start_cost_allocation_tag_backfill_response = {
  backfill_request : cost_allocation_tag_backfill_request option;
      [@ocaml.doc " An object containing detailed metadata of your new backfill request. \n"]
}
[@@ocaml.doc ""]

type nonrec start_cost_allocation_tag_backfill_request = {
  backfill_from : zoned_date_time;
      [@ocaml.doc
        " The date you want the backfill to start from. The date can only be a first day of the \
         month (a billing start date). Dates can't precede the previous twelve months, or in the \
         future.\n"]
}
[@@ocaml.doc ""]

type nonrec backfill_limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  " A request to backfill is already in progress. Once the previous request is complete, you can \
   create another request. \n"]

type nonrec analysis_id = string [@@ocaml.doc ""]

type nonrec start_commitment_purchase_analysis_response = {
  estimated_completion_time : zoned_date_time;
      [@ocaml.doc "The estimated time for when the analysis will complete.\n"]
  analysis_started_time : zoned_date_time; [@ocaml.doc "The start time of the analysis.\n"]
  analysis_id : analysis_id;
      [@ocaml.doc "The analysis ID that's associated with the commitment purchase analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec account_scope = LINKED [@ocaml.doc ""] | PAYER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec analysis_type =
  | TARGET_AVERAGE_COVERAGE [@ocaml.doc ""]
  | CUSTOM_COMMITMENT [@ocaml.doc ""]
  | MAX_SAVINGS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec payment_option =
  | HEAVY_UTILIZATION [@ocaml.doc ""]
  | MEDIUM_UTILIZATION [@ocaml.doc ""]
  | LIGHT_UTILIZATION [@ocaml.doc ""]
  | ALL_UPFRONT [@ocaml.doc ""]
  | PARTIAL_UPFRONT [@ocaml.doc ""]
  | NO_UPFRONT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec savings_plans_commitment = float [@@ocaml.doc ""]

type nonrec savings_plans = {
  offering_id : generic_string option;
      [@ocaml.doc
        "The unique ID that's used to distinguish Savings Plans commitments from one another.\n"]
  savings_plans_commitment : savings_plans_commitment option;
      [@ocaml.doc "The Savings Plans commitment.\n"]
  term_in_years : term_in_years option;
      [@ocaml.doc "The term that you want the Savings Plans commitment for.\n"]
  instance_family : generic_string option;
      [@ocaml.doc "The instance family of the Savings Plans commitment.\n"]
  region : generic_string option;
      [@ocaml.doc "The Region associated with the Savings Plans commitment.\n"]
  savings_plans_type : supported_savings_plans_type option; [@ocaml.doc "The Savings Plans type.\n"]
  payment_option : payment_option option;
      [@ocaml.doc "The payment option for the Savings Plans commitment.\n"]
}
[@@ocaml.doc "The Savings Plans commitment details.\n"]

type nonrec savings_plans_to_add = savings_plans list [@@ocaml.doc ""]

type nonrec savings_plans_id = string [@@ocaml.doc ""]

type nonrec savings_plans_to_exclude = savings_plans_id list [@@ocaml.doc ""]

type nonrec savings_plans_target_coverage = int [@@ocaml.doc ""]

type nonrec savings_plans_purchase_analysis_configuration = {
  savings_plans_target_coverage : savings_plans_target_coverage option;
      [@ocaml.doc
        "Specifies the target Savings Plans coverage as a percentage from [10] to [100]. This \
         field is required when [AnalysisType] is [TARGET_AVERAGE_COVERAGE]. It defines the target \
         average hourly coverage that the recommended Savings Plans commitment should achieve over \
         the lookback period.\n"]
  look_back_time_period : date_interval;
      [@ocaml.doc "The time period associated with the analysis.\n"]
  savings_plans_to_exclude : savings_plans_to_exclude option;
      [@ocaml.doc "Savings Plans to exclude from the analysis.\n"]
  savings_plans_to_add : savings_plans_to_add;
      [@ocaml.doc "Savings Plans to include in the analysis.\n"]
  analysis_type : analysis_type; [@ocaml.doc "The type of analysis.\n"]
  account_id : account_id option; [@ocaml.doc "The account that the analysis is for.\n"]
  account_scope : account_scope option;
      [@ocaml.doc "The account scope that you want your analysis for.\n"]
}
[@@ocaml.doc "The configuration for the Savings Plans purchase analysis.\n"]

type nonrec commitment_purchase_analysis_configuration = {
  savings_plans_purchase_analysis_configuration :
    savings_plans_purchase_analysis_configuration option;
      [@ocaml.doc "The configuration for the Savings Plans purchase analysis.\n"]
}
[@@ocaml.doc "The configuration for the commitment purchase analysis.\n"]

type nonrec start_commitment_purchase_analysis_request = {
  commitment_purchase_analysis_configuration : commitment_purchase_analysis_configuration;
      [@ocaml.doc "The configuration for the commitment purchase analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec sort_order = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_definition_key = string [@@ocaml.doc ""]

type nonrec sort_definition = {
  sort_order : sort_order option; [@ocaml.doc "The order that's used to sort the data.\n"]
  key : sort_definition_key; [@ocaml.doc "The key that's used to sort the data.\n"]
}
[@@ocaml.doc "The details for how to sort the data.\n"]

type nonrec sort_definitions = sort_definition list [@@ocaml.doc ""]

type nonrec offering_class = CONVERTIBLE [@ocaml.doc ""] | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ec2_specification = {
  offering_class : offering_class option;
      [@ocaml.doc
        "Indicates whether you want a recommendation for standard or convertible reservations.\n"]
}
[@@ocaml.doc
  "The Amazon EC2 hardware specifications that you want Amazon Web Services to provide \
   recommendations for.\n"]

type nonrec service_specification = {
  ec2_specification : ec2_specification option;
      [@ocaml.doc
        "The Amazon EC2 hardware specifications that you want Amazon Web Services to provide \
         recommendations for.\n"]
}
[@@ocaml.doc "Hardware specifications for the service that you want recommendations for.\n"]

type nonrec search_string = string [@@ocaml.doc ""]

type nonrec savings_plans_utilization = {
  utilization_percentage : generic_string option;
      [@ocaml.doc
        "The amount of [UsedCommitment] divided by the [TotalCommitment] for your Savings Plans.\n"]
  unused_commitment : generic_string option;
      [@ocaml.doc
        "The amount of your Savings Plans commitment that wasn't consumed from Savings Plans \
         eligible usage in a specific period.\n"]
  used_commitment : generic_string option;
      [@ocaml.doc
        "The amount of your Savings Plans commitment that was consumed from Savings Plans eligible \
         usage in a specific period.\n"]
  total_commitment : generic_string option;
      [@ocaml.doc
        "The total amount of Savings Plans commitment that's been purchased in an account (or set \
         of accounts).\n"]
}
[@@ocaml.doc "The measurement of how well you're using your existing Savings Plans.\n"]

type nonrec savings_plans_savings = {
  on_demand_cost_equivalent : generic_string option;
      [@ocaml.doc
        "How much the amount that the usage would have cost if it was accrued at the On-Demand rate.\n"]
  net_savings : generic_string option;
      [@ocaml.doc
        "The savings amount that you're accumulating for the usage that's covered by a Savings \
         Plans, when compared to the On-Demand equivalent of the same usage.\n"]
}
[@@ocaml.doc
  "The amount of savings that you're accumulating, against the public On-Demand rate of the usage \
   accrued in an account.\n"]

type nonrec savings_plans_amortized_commitment = {
  total_amortized_commitment : generic_string option;
      [@ocaml.doc
        "The total amortized amount of your Savings Plans commitment, regardless of your Savings \
         Plans purchase method. \n"]
  amortized_upfront_commitment : generic_string option;
      [@ocaml.doc
        "The amortized amount of your Savings Plans commitment that was purchased with an \
         [Upfront] or [PartialUpfront] Savings Plans.\n"]
  amortized_recurring_commitment : generic_string option;
      [@ocaml.doc
        "The amortized amount of your Savings Plans commitment that was purchased with either a \
         [Partial] or a [NoUpfront].\n"]
}
[@@ocaml.doc
  "The amortized amount of Savings Plans purchased in a specific account during a specific time \
   interval.\n"]

type nonrec savings_plans_utilization_by_time = {
  amortized_commitment : savings_plans_amortized_commitment option;
      [@ocaml.doc
        "The total amortized commitment for a Savings Plans. This includes the sum of the upfront \
         and recurring Savings Plans fees.\n"]
  savings : savings_plans_savings option;
      [@ocaml.doc
        "The amount that's saved by using existing Savings Plans. Savings returns both net savings \
         from Savings Plans and also the [onDemandCostEquivalent] of the Savings Plans when \
         considering the utilization rate.\n"]
  utilization : savings_plans_utilization;
      [@ocaml.doc
        "A ratio of your effectiveness of using existing Savings Plans to apply to workloads that \
         are Savings Plans eligible.\n"]
  time_period : date_interval; [@ocaml.doc ""]
}
[@@ocaml.doc "The amount of Savings Plans utilization (in hours).\n"]

type nonrec savings_plans_utilizations_by_time = savings_plans_utilization_by_time list
[@@ocaml.doc ""]

type nonrec savings_plan_arn = string [@@ocaml.doc ""]

type nonrec savings_plans_utilization_detail = {
  amortized_commitment : savings_plans_amortized_commitment option;
      [@ocaml.doc
        "The total amortized commitment for a Savings Plans. Includes the sum of the upfront and \
         recurring Savings Plans fees.\n"]
  savings : savings_plans_savings option;
      [@ocaml.doc
        "The amount saved by using existing Savings Plans. Savings returns both net savings from \
         savings plans and also the [onDemandCostEquivalent] of the Savings Plans when considering \
         the utilization rate.\n"]
  utilization : savings_plans_utilization option;
      [@ocaml.doc
        "A ratio of your effectiveness of using existing Savings Plans to apply to workloads that \
         are Savings Plans eligible.\n"]
  attributes : attributes option;
      [@ocaml.doc "The attribute that applies to a specific [Dimension].\n"]
  savings_plan_arn : savings_plan_arn option;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) for a particular Savings Plan.\n"]
}
[@@ocaml.doc
  "A single daily or monthly Savings Plans utilization rate and details for your account. A \
   management account in an organization have access to member accounts. You can use \
   [GetDimensionValues] to determine the possible dimension values. \n"]

type nonrec savings_plans_utilization_details = savings_plans_utilization_detail list
[@@ocaml.doc ""]

type nonrec savings_plans_utilization_aggregates = {
  amortized_commitment : savings_plans_amortized_commitment option;
      [@ocaml.doc
        "The total amortized commitment for a Savings Plans. This includes the sum of the upfront \
         and recurring Savings Plans fees.\n"]
  savings : savings_plans_savings option;
      [@ocaml.doc
        "The amount that's saved by using existing Savings Plans. Savings returns both net savings \
         from Savings Plans and also the [onDemandCostEquivalent] of the Savings Plans when \
         considering the utilization rate.\n"]
  utilization : savings_plans_utilization;
      [@ocaml.doc
        "A ratio of your effectiveness of using existing Savings Plans to apply to workloads that \
         are Savings Plans eligible.\n"]
}
[@@ocaml.doc "The aggregated utilization metrics for your Savings Plans usage.\n"]

type nonrec savings_plans_purchase_recommendation_summary = {
  estimated_on_demand_cost_with_current_commitment : generic_string option;
      [@ocaml.doc
        "The estimated On-Demand costs you expect with no additional commitment. It's based on \
         your usage of the selected time period and the Savings Plans you own. \n"]
  estimated_monthly_savings_amount : generic_string option;
      [@ocaml.doc
        "The estimated monthly savings amount that's based on the recommended Savings Plans \
         purchase.\n"]
  estimated_savings_percentage : generic_string option;
      [@ocaml.doc
        "The estimated savings relative to the total cost of On-Demand usage, over the lookback \
         period. This is calculated as [estimatedSavingsAmount]/ [CurrentOnDemandSpend]*100.\n"]
  hourly_commitment_to_purchase : generic_string option;
      [@ocaml.doc
        "The recommended hourly commitment that's based on the recommendation parameters.\n"]
  daily_commitment_to_purchase : generic_string option;
      [@ocaml.doc "The recommended Savings Plans cost on a daily (24 hourly) basis.\n"]
  total_recommendation_count : generic_string option;
      [@ocaml.doc
        "The aggregate number of Savings Plans recommendations that exist for your account.\n"]
  estimated_savings_amount : generic_string option;
      [@ocaml.doc
        "The estimated total savings over the lookback period, based on the purchase of the \
         recommended Savings Plans.\n"]
  current_on_demand_spend : generic_string option;
      [@ocaml.doc
        "The current total on demand spend of the applicable usage types over the lookback period.\n"]
  estimated_total_cost : generic_string option;
      [@ocaml.doc
        "The estimated total cost of the usage after purchasing the recommended Savings Plans. \
         This is a sum of the cost of Savings Plans during this term, and the remaining On-Demand \
         usage.\n"]
  currency_code : generic_string option;
      [@ocaml.doc
        "The currency code that Amazon Web Services used to generate the recommendations and \
         present potential savings.\n"]
  estimated_ro_i : generic_string option;
      [@ocaml.doc
        "The estimated return on investment that's based on the recommended Savings Plans and \
         estimated savings.\n"]
}
[@@ocaml.doc "Summary metrics for your Savings Plans Purchase Recommendations.\n"]

type nonrec savings_plans_purchase_recommendation_metadata = {
  additional_metadata : generic_string option;
      [@ocaml.doc "Additional metadata that might be applicable to the recommendation.\n"]
  generation_timestamp : generic_string option;
      [@ocaml.doc "The timestamp that shows when the recommendations were generated.\n"]
  recommendation_id : generic_string option;
      [@ocaml.doc "The unique identifier for the recommendation set.\n"]
}
[@@ocaml.doc "Metadata about your Savings Plans Purchase Recommendations.\n"]

type nonrec savings_plans_details = {
  offering_id : generic_string option;
      [@ocaml.doc "The unique ID that's used to distinguish Savings Plans from one another.\n"]
  instance_family : generic_string option;
      [@ocaml.doc "A group of instance types that Savings Plans applies to.\n"]
  region : generic_string option;
      [@ocaml.doc
        "A collection of Amazon Web Services resources in a geographic area. Each Amazon Web \
         Services Region is isolated and independent of the other Regions.\n"]
}
[@@ocaml.doc "The attribute details on a specific Savings Plan.\n"]

type nonrec recommendation_detail_id = string [@@ocaml.doc ""]

type nonrec savings_plans_purchase_recommendation_detail = {
  recommendation_detail_id : recommendation_detail_id option;
      [@ocaml.doc "Contains detailed information about a specific Savings Plan recommendation.\n"]
  current_average_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc
        "The average value of hourly On-Demand spend over the lookback period of the applicable \
         usage type.\n"]
  current_maximum_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc
        "The highest value of hourly On-Demand spend over the lookback period of the applicable \
         usage type.\n"]
  current_minimum_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc
        "The lowest value of hourly On-Demand spend over the lookback period of the applicable \
         usage type.\n"]
  estimated_monthly_savings_amount : generic_string option;
      [@ocaml.doc "The estimated monthly savings amount based on the recommended Savings Plans.\n"]
  estimated_average_utilization : generic_string option;
      [@ocaml.doc "The estimated utilization of the recommended Savings Plans.\n"]
  hourly_commitment_to_purchase : generic_string option;
      [@ocaml.doc
        "The recommended hourly commitment level for the Savings Plans type and the configuration \
         that's based on the usage during the lookback period.\n"]
  estimated_savings_percentage : generic_string option;
      [@ocaml.doc
        "The estimated savings percentage relative to the total cost of applicable On-Demand usage \
         over the lookback period.\n"]
  estimated_savings_amount : generic_string option;
      [@ocaml.doc
        "The estimated savings amount that's based on the recommended Savings Plans over the \
         length of the lookback period.\n"]
  estimated_on_demand_cost_with_current_commitment : generic_string option;
      [@ocaml.doc
        " The estimated On-Demand costs you expect with no additional commitment, based on your \
         usage of the selected time period and the Savings Plans you own. \n"]
  estimated_on_demand_cost : generic_string option;
      [@ocaml.doc
        "The remaining On-Demand cost estimated to not be covered by the recommended Savings \
         Plans, over the length of the lookback period.\n"]
  estimated_sp_cost : generic_string option;
      [@ocaml.doc
        "The cost of the recommended Savings Plans over the length of the lookback period.\n"]
  currency_code : generic_string option;
      [@ocaml.doc
        "The currency code that Amazon Web Services used to generate the recommendations and \
         present potential savings.\n"]
  estimated_ro_i : generic_string option;
      [@ocaml.doc
        "The estimated return on investment that's based on the recommended Savings Plans that you \
         purchased. This is calculated as [estimatedSavingsAmount]/ [estimatedSPCost]*100.\n"]
  upfront_cost : generic_string option;
      [@ocaml.doc
        "The upfront cost of the recommended Savings Plans, based on the selected payment option.\n"]
  account_id : generic_string option;
      [@ocaml.doc "The [AccountID] the recommendation is generated for.\n"]
  savings_plans_details : savings_plans_details option;
      [@ocaml.doc "Details for your recommended Savings Plans.\n"]
}
[@@ocaml.doc "Details for your recommended Savings Plans.\n"]

type nonrec savings_plans_purchase_recommendation_detail_list =
  savings_plans_purchase_recommendation_detail list
[@@ocaml.doc ""]

type nonrec lookback_period_in_days =
  | SIXTY_DAYS [@ocaml.doc ""]
  | THIRTY_DAYS [@ocaml.doc ""]
  | SEVEN_DAYS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec savings_plans_purchase_recommendation = {
  savings_plans_purchase_recommendation_summary :
    savings_plans_purchase_recommendation_summary option;
      [@ocaml.doc "Summary metrics for your Savings Plans Recommendations. \n"]
  savings_plans_purchase_recommendation_details :
    savings_plans_purchase_recommendation_detail_list option;
      [@ocaml.doc
        "Details for the Savings Plans that we recommend that you purchase to cover existing \
         Savings Plans eligible workloads.\n"]
  lookback_period_in_days : lookback_period_in_days option;
      [@ocaml.doc "The lookback period in days that's used to generate the recommendation.\n"]
  payment_option : payment_option option;
      [@ocaml.doc "The payment option that's used to generate the recommendation.\n"]
  term_in_years : term_in_years option;
      [@ocaml.doc
        "The Savings Plans recommendation term in years. It's used to generate the recommendation.\n"]
  savings_plans_type : supported_savings_plans_type option;
      [@ocaml.doc "The requested Savings Plans recommendation type.\n"]
  account_scope : account_scope option;
      [@ocaml.doc
        "The account scope that you want your recommendations for. Amazon Web Services calculates \
         recommendations that include the management account and member accounts if the value is \
         set to [PAYER]. If the value is [LINKED], recommendations are calculated for individual \
         member accounts only.\n"]
}
[@@ocaml.doc
  "Contains your request parameters, Savings Plan Recommendations Summary, and Details.\n"]

type nonrec recommendation_detail_hourly_metrics = {
  estimated_new_commitment_utilization : generic_string option;
      [@ocaml.doc "The estimated utilization for the recommended Savings Plan.\n"]
  estimated_coverage : generic_string option;
      [@ocaml.doc "The estimated coverage amount based on the recommended Savings Plan.\n"]
  current_coverage : generic_string option;
      [@ocaml.doc
        "The current amount of Savings Plans eligible usage that the Savings Plan covered.\n"]
  estimated_on_demand_cost : generic_string option;
      [@ocaml.doc
        "The remaining On-Demand cost estimated to not be covered by the recommended Savings Plan, \
         over the length of the lookback period.\n"]
  start_time : zoned_date_time option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Contains the hourly metrics for the given recommendation over the lookback period. \n"]

type nonrec metrics_over_lookback_period = recommendation_detail_hourly_metrics list
[@@ocaml.doc ""]

type nonrec savings_plans_purchase_analysis_details = {
  metrics_over_lookback_period : metrics_over_lookback_period option;
      [@ocaml.doc
        "The related hourly cost, coverage, and utilization metrics over the lookback period.\n"]
  additional_metadata : generic_string option;
      [@ocaml.doc "Additional metadata that might be applicable to the commitment.\n"]
  upfront_cost : generic_string option;
      [@ocaml.doc "The upfront cost of the Savings Plan based on the selected payment option.\n"]
  latest_usage_timestamp : generic_string option;
      [@ocaml.doc "The date and time of the last hour that went into the analysis.\n"]
  estimated_commitment_cost : generic_string option;
      [@ocaml.doc
        "The estimated cost of the Savings Plan over the length of the lookback period.\n"]
  estimated_savings_percentage : generic_string option;
      [@ocaml.doc
        "The estimated savings percentage relative to the total cost over the cost calculation \
         lookback period.\n"]
  estimated_savings_amount : generic_string option;
      [@ocaml.doc
        "The estimated savings amount that's based on the Savings Plan over the length of the \
         lookback period.\n"]
  estimated_ro_i : generic_string option;
      [@ocaml.doc
        "The estimated return on investment that's based on the Savings Plan and estimated \
         savings. This is calculated as estimatedSavingsAmount/estimatedSPCost*100.\n"]
  estimated_on_demand_cost_with_current_commitment : generic_string option;
      [@ocaml.doc
        "The estimated On-Demand cost you expect with no additional commitment based on your usage \
         of the selected time period and the Savings Plan you own.\n"]
  estimated_on_demand_cost : generic_string option;
      [@ocaml.doc
        "The remaining On-Demand cost estimated to not be covered by the Savings Plan over the \
         length of the lookback period.\n"]
  estimated_monthly_savings_amount : generic_string option;
      [@ocaml.doc "The estimated monthly savings amount based on the Savings Plan.\n"]
  estimated_average_utilization : generic_string option;
      [@ocaml.doc "The estimated utilization of the Savings Plan.\n"]
  estimated_average_coverage : generic_string option;
      [@ocaml.doc "The estimated coverage of the Savings Plan.\n"]
  hourly_commitment_to_purchase : generic_string option;
      [@ocaml.doc "The recommended or custom hourly commitment.\n"]
  existing_hourly_commitment : generic_string option;
      [@ocaml.doc "The existing hourly commitment for the Savings Plan type.\n"]
  current_on_demand_spend : generic_string option;
      [@ocaml.doc "The current total On-Demand spend over the lookback period.\n"]
  current_minimum_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc "The lowest value of hourly On-Demand spend over the lookback period.\n"]
  current_maximum_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc "The highest value of hourly On-Demand spend over the lookback period.\n"]
  current_average_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc "The average value of hourly On-Demand spend over the lookback period.\n"]
  current_average_coverage : generic_string option;
      [@ocaml.doc "The average value of hourly coverage over the lookback period.\n"]
  lookback_period_in_hours : generic_string option;
      [@ocaml.doc "The lookback period in hours that's used to generate the analysis.\n"]
  currency_code : generic_string option; [@ocaml.doc "The currency code used for the analysis.\n"]
}
[@@ocaml.doc "Details about the Savings Plans purchase analysis.\n"]

type nonrec savings_plans_data_type =
  | SAVINGS [@ocaml.doc ""]
  | AMORTIZED_COMMITMENT [@ocaml.doc ""]
  | UTILIZATION [@ocaml.doc ""]
  | ATTRIBUTES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec savings_plans_data_types = savings_plans_data_type list [@@ocaml.doc ""]

type nonrec savings_plans_coverage_data = {
  coverage_percentage : generic_string option;
      [@ocaml.doc
        "The percentage of your existing Savings Plans covered usage, divided by all of your \
         eligible Savings Plans usage in an account (or set of accounts).\n"]
  total_cost : generic_string option;
      [@ocaml.doc
        "The total cost of your Amazon Web Services usage, regardless of your purchase option.\n"]
  on_demand_cost : generic_string option;
      [@ocaml.doc "The cost of your Amazon Web Services usage at the public On-Demand rate.\n"]
  spend_covered_by_savings_plans : generic_string option;
      [@ocaml.doc
        "The amount of your Amazon Web Services usage that's covered by a Savings Plans.\n"]
}
[@@ocaml.doc
  "Specific coverage percentage, On-Demand costs, and spend covered by Savings Plans, and total \
   Savings Plans costs for an account.\n"]

type nonrec savings_plans_coverage = {
  time_period : date_interval option; [@ocaml.doc ""]
  coverage : savings_plans_coverage_data option;
      [@ocaml.doc "The amount of Savings Plans eligible usage that the Savings Plans covered.\n"]
  attributes : attributes option;
      [@ocaml.doc "The attribute that applies to a specific [Dimension].\n"]
}
[@@ocaml.doc
  "The amount of Savings Plans eligible usage that's covered by Savings Plans. All calculations \
   consider the On-Demand equivalent of your Savings Plans usage.\n"]

type nonrec savings_plans_coverages = savings_plans_coverage list [@@ocaml.doc ""]

type nonrec root_cause_impact = {
  contribution : generic_double;
      [@ocaml.doc
        "The dollar amount that this root cause contributed to the anomaly's TotalImpact.\n"]
}
[@@ocaml.doc "The dollar value of the root cause.\n"]

type nonrec root_cause = {
  impact : root_cause_impact option; [@ocaml.doc "The dollar impact for the root cause.\n"]
  usage_type : generic_string option;
      [@ocaml.doc "The [UsageType] value that's associated with the cost anomaly. \n"]
  linked_account_name : generic_string option;
      [@ocaml.doc "The member account name value that's associated with the cost anomaly.\n"]
  linked_account : generic_string option;
      [@ocaml.doc "The member account value that's associated with the cost anomaly. \n"]
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region that's associated with the cost anomaly. \n"]
  service : generic_string option;
      [@ocaml.doc
        "The Amazon Web Services service name that's associated with the cost anomaly. \n"]
}
[@@ocaml.doc
  "The combination of Amazon Web Services service, linked account, linked account name, Region, \
   and usage type where a cost anomaly is observed, along with the dollar and percentage amount of \
   the anomaly impact. The linked account name will only be available when the account name can be \
   identified.\n"]

type nonrec root_causes = root_cause list [@@ocaml.doc ""]

type nonrec rightsizing_type = MODIFY [@ocaml.doc ""] | TERMINATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rightsizing_recommendation_summary = {
  savings_percentage : generic_string option;
      [@ocaml.doc
        " The savings percentage based on the recommended modifications. It's relative to the \
         total On-Demand costs that are associated with these instances.\n"]
  savings_currency_code : generic_string option;
      [@ocaml.doc "The currency code that Amazon Web Services used to calculate the savings.\n"]
  estimated_total_monthly_savings_amount : generic_string option;
      [@ocaml.doc "The estimated total savings resulting from modifications, on a monthly basis.\n"]
  total_recommendation_count : generic_string option;
      [@ocaml.doc "The total number of instance recommendations.\n"]
}
[@@ocaml.doc "The summary of rightsizing recommendations \n"]

type nonrec rightsizing_recommendation_metadata = {
  additional_metadata : generic_string option;
      [@ocaml.doc "Additional metadata that might be applicable to the recommendation.\n"]
  lookback_period_in_days : lookback_period_in_days option;
      [@ocaml.doc
        "The number of days of previous usage that Amazon Web Services considers when making the \
         recommendation.\n"]
  generation_timestamp : generic_string option;
      [@ocaml.doc "The timestamp for when Amazon Web Services made the recommendation.\n"]
  recommendation_id : generic_string option; [@ocaml.doc "The ID for the recommendation.\n"]
}
[@@ocaml.doc "Metadata for a recommendation set.\n"]

type nonrec current_instance = {
  currency_code : generic_string option;
      [@ocaml.doc
        "The currency code that Amazon Web Services used to calculate the costs for this instance.\n"]
  monthly_cost : generic_string option;
      [@ocaml.doc "The current On-Demand cost of operating this instance on a monthly basis.\n"]
  total_running_hours_in_lookback_period : generic_string option;
      [@ocaml.doc "The total number of hours that the instance ran during the lookback period.\n"]
  on_demand_hours_in_lookback_period : generic_string option;
      [@ocaml.doc
        "The number of hours during the lookback period that's billed at On-Demand rates.\n"]
  savings_plans_covered_hours_in_lookback_period : generic_string option;
      [@ocaml.doc
        "The number of hours during the lookback period that's covered by Savings Plans.\n"]
  reservation_covered_hours_in_lookback_period : generic_string option;
      [@ocaml.doc
        "The number of hours during the lookback period that's covered by reservations.\n"]
  resource_utilization : resource_utilization option;
      [@ocaml.doc "Utilization information of the current instance during the lookback period.\n"]
  resource_details : resource_details option;
      [@ocaml.doc "Details about the resource and utilization.\n"]
  tags : tag_values_list option;
      [@ocaml.doc "Cost allocation resource tags that are applied to the instance.\n"]
  instance_name : generic_string option;
      [@ocaml.doc
        "The name that you given an instance. This field shows as blank if you haven't given the \
         instance a name.\n"]
  resource_id : generic_string option; [@ocaml.doc "Resource ID of the current instance.\n"]
}
[@@ocaml.doc "Context about the current instance.\n"]

type nonrec modify_recommendation_detail = {
  target_instances : target_instances_list option;
      [@ocaml.doc
        "Determines whether this instance type is the Amazon Web Services default recommendation.\n"]
}
[@@ocaml.doc "Details for the modification recommendation.\n"]

type nonrec finding_reason_code =
  | DISK_THROUGHPUT_UNDER_PROVISIONED [@ocaml.doc ""]
  | DISK_THROUGHPUT_OVER_PROVISIONED [@ocaml.doc ""]
  | DISK_IOPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | DISK_IOPS_OVER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_PPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_PPS_OVER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_BANDWIDTH_OVER_PROVISIONED [@ocaml.doc ""]
  | EBS_IOPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | EBS_IOPS_OVER_PROVISIONED [@ocaml.doc ""]
  | EBS_THROUGHPUT_UNDER_PROVISIONED [@ocaml.doc ""]
  | EBS_THROUGHPUT_OVER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_UNDER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_OVER_PROVISIONED [@ocaml.doc ""]
  | CPU_UNDER_PROVISIONED [@ocaml.doc ""]
  | CPU_OVER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec finding_reason_codes = finding_reason_code list [@@ocaml.doc ""]

type nonrec rightsizing_recommendation = {
  finding_reason_codes : finding_reason_codes option;
      [@ocaml.doc
        "The list of possible reasons why the recommendation is generated, such as under- or \
         over-utilization of specific metrics (for example, CPU, Memory, Network). \n"]
  terminate_recommendation_detail : terminate_recommendation_detail option;
      [@ocaml.doc "The details for termination recommendations.\n"]
  modify_recommendation_detail : modify_recommendation_detail option;
      [@ocaml.doc "The details for the modification recommendations. \n"]
  rightsizing_type : rightsizing_type option;
      [@ocaml.doc "A recommendation to either terminate or modify the resource.\n"]
  current_instance : current_instance option;
      [@ocaml.doc "Context regarding the current instance.\n"]
  account_id : generic_string option; [@ocaml.doc "The account that this recommendation is for.\n"]
}
[@@ocaml.doc "Recommendations to rightsize resources.\n"]

type nonrec rightsizing_recommendation_list = rightsizing_recommendation list [@@ocaml.doc ""]

type nonrec recommendation_target =
  | CROSS_INSTANCE_FAMILY [@ocaml.doc ""]
  | SAME_INSTANCE_FAMILY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rightsizing_recommendation_configuration = {
  benefits_considered : generic_boolean;
      [@ocaml.doc
        "The option to consider RI or Savings Plans discount benefits in your savings calculation. \
         The default value is [TRUE]. \n"]
  recommendation_target : recommendation_target;
      [@ocaml.doc
        "The option to see recommendations within the same instance family or recommendations for \
         instances across other families. The default value is [SAME_INSTANCE_FAMILY]. \n"]
}
[@@ocaml.doc
  "You can use [RightsizingRecommendationConfiguration] to customize recommendations across two \
   attributes. You can choose to view recommendations for instances within the same instance \
   families or across different instance families. You can also choose to view your estimated \
   savings that are associated with recommendations with consideration of existing Savings Plans \
   or Reserved Instance (RI) benefits, or neither. \n"]

type nonrec metric_amount = string [@@ocaml.doc ""]

type nonrec metric_unit = string [@@ocaml.doc ""]

type nonrec metric_value = {
  unit_ : metric_unit option; [@ocaml.doc "The unit that the metric is given in.\n"]
  amount : metric_amount option; [@ocaml.doc "The actual number that represents the metric.\n"]
}
[@@ocaml.doc "The aggregated value for a metric.\n"]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec metrics = (metric_name * metric_value) list [@@ocaml.doc ""]

type nonrec key = string [@@ocaml.doc ""]

type nonrec keys = key list [@@ocaml.doc ""]

type nonrec group = {
  metrics : metrics option; [@ocaml.doc "The metrics that are included in this group.\n"]
  keys : keys option; [@ocaml.doc "The keys that are included in this group.\n"]
}
[@@ocaml.doc "One level of grouped data in the results.\n"]

type nonrec groups = group list [@@ocaml.doc ""]

type nonrec estimated = bool [@@ocaml.doc ""]

type nonrec result_by_time = {
  estimated : estimated option; [@ocaml.doc "Determines whether the result is estimated.\n"]
  groups : groups option; [@ocaml.doc "The groups that this time period includes.\n"]
  total : metrics option;
      [@ocaml.doc "The total amount of cost or usage accrued during the time period.\n"]
  time_period : date_interval option; [@ocaml.doc "The time period that the result covers.\n"]
}
[@@ocaml.doc "The result that's associated with a time period.\n"]

type nonrec results_by_time = result_by_time list [@@ocaml.doc ""]

type nonrec resource_type = string [@@ocaml.doc ""]

type nonrec resource_types_filter_input = resource_type list [@@ocaml.doc ""]

type nonrec resource_types = resource_type list [@@ocaml.doc ""]

type nonrec reserved_normalized_units = string [@@ocaml.doc ""]

type nonrec reserved_hours = string [@@ocaml.doc ""]

type nonrec dynamo_db_capacity_details = {
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region of the recommended reservation.\n"]
  capacity_units : generic_string option;
      [@ocaml.doc "The capacity unit of the recommended reservation.\n"]
}
[@@ocaml.doc "The DynamoDB reservations that Amazon Web Services recommends that you purchase.\n"]

type nonrec reserved_capacity_details = {
  dynamo_db_capacity_details : dynamo_db_capacity_details option;
      [@ocaml.doc
        "The DynamoDB reservations that Amazon Web Services recommends that you purchase.\n"]
}
[@@ocaml.doc
  "Details about the reservations that Amazon Web Services recommends that you purchase.\n"]

type nonrec ec2_instance_details = {
  size_flex_eligible : generic_boolean option;
      [@ocaml.doc "Determines whether the recommended reservation is size flexible.\n"]
  current_generation : generic_boolean option;
      [@ocaml.doc "Determines whether the recommendation is for a current-generation instance. \n"]
  tenancy : generic_string option;
      [@ocaml.doc "Determines whether the recommended reservation is dedicated or shared.\n"]
  platform : generic_string option;
      [@ocaml.doc
        "The platform of the recommended reservation. The platform is the specific combination of \
         operating system, license model, and software on an instance.\n"]
  availability_zone : generic_string option;
      [@ocaml.doc "The Availability Zone of the recommended reservation.\n"]
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region of the recommended reservation.\n"]
  instance_type : generic_string option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  family : generic_string option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
}
[@@ocaml.doc
  "Details about the Amazon EC2 reservations that Amazon Web Services recommends that you purchase.\n"]

type nonrec rds_instance_details = {
  deployment_model : generic_string option;
      [@ocaml.doc "Determines whether the recommendation is for a reservation for RDS Custom.\n"]
  size_flex_eligible : generic_boolean option;
      [@ocaml.doc "Determines whether the recommended reservation is size flexible.\n"]
  current_generation : generic_boolean option;
      [@ocaml.doc "Determines whether the recommendation is for a current-generation instance. \n"]
  license_model : generic_string option;
      [@ocaml.doc "The license model that the recommended reservation supports.\n"]
  deployment_option : generic_string option;
      [@ocaml.doc
        "Determines whether the recommendation is for a reservation in a single Availability Zone \
         or a reservation with a backup in a second Availability Zone.\n"]
  database_edition : generic_string option;
      [@ocaml.doc "The database edition that the recommended reservation supports.\n"]
  database_engine : generic_string option;
      [@ocaml.doc "The database engine that the recommended reservation supports.\n"]
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region of the recommended reservation.\n"]
  instance_type : generic_string option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  family : generic_string option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
}
[@@ocaml.doc
  "Details about the Amazon RDS reservations that Amazon Web Services recommends that you purchase.\n"]

type nonrec redshift_instance_details = {
  size_flex_eligible : generic_boolean option;
      [@ocaml.doc "Determines whether the recommended reservation is size flexible.\n"]
  current_generation : generic_boolean option;
      [@ocaml.doc "Determines whether the recommendation is for a current-generation instance.\n"]
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region of the recommended reservation.\n"]
  node_type : generic_string option;
      [@ocaml.doc "The type of node that Amazon Web Services recommends.\n"]
  family : generic_string option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
}
[@@ocaml.doc
  "Details about the Amazon Redshift reservations that Amazon Web Services recommends that you \
   purchase.\n"]

type nonrec elasti_cache_instance_details = {
  size_flex_eligible : generic_boolean option;
      [@ocaml.doc "Determines whether the recommended reservation is size flexible.\n"]
  current_generation : generic_boolean option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
  product_description : generic_string option;
      [@ocaml.doc "The description of the recommended reservation.\n"]
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region of the recommended reservation.\n"]
  node_type : generic_string option;
      [@ocaml.doc "The type of node that Amazon Web Services recommends.\n"]
  family : generic_string option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
}
[@@ocaml.doc
  "Details about the Amazon ElastiCache reservations that Amazon Web Services recommends that you \
   purchase.\n"]

type nonrec es_instance_details = {
  size_flex_eligible : generic_boolean option;
      [@ocaml.doc "Determines whether the recommended reservation is size flexible.\n"]
  current_generation : generic_boolean option;
      [@ocaml.doc "Determines whether the recommendation is for a current-generation instance.\n"]
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region of the recommended reservation.\n"]
  instance_size : generic_string option;
      [@ocaml.doc "The size of instance that Amazon Web Services recommends.\n"]
  instance_class : generic_string option;
      [@ocaml.doc "The class of instance that Amazon Web Services recommends.\n"]
}
[@@ocaml.doc
  "Details about the Amazon OpenSearch Service reservations that Amazon Web Services recommends \
   that you purchase.\n"]

type nonrec memory_db_instance_details = {
  size_flex_eligible : generic_boolean option;
      [@ocaml.doc "Determines whether the recommended reservation is size flexible.\n"]
  current_generation : generic_boolean option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
  region : generic_string option;
      [@ocaml.doc "The Amazon Web Services Region of the recommended reservation.\n"]
  node_type : generic_string option; [@ocaml.doc "The node type of the recommended reservation.\n"]
  family : generic_string option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
}
[@@ocaml.doc
  "Details about the MemoryDB reservations that Amazon Web Services recommends that you purchase.\n"]

type nonrec instance_details = {
  memory_db_instance_details : memory_db_instance_details option;
      [@ocaml.doc
        "The MemoryDB reservations that Amazon Web Services recommends that you purchase.\n"]
  es_instance_details : es_instance_details option;
      [@ocaml.doc
        "The Amazon OpenSearch Service reservations that Amazon Web Services recommends that you \
         purchase.\n"]
  elasti_cache_instance_details : elasti_cache_instance_details option;
      [@ocaml.doc
        "The ElastiCache reservations that Amazon Web Services recommends that you purchase.\n"]
  redshift_instance_details : redshift_instance_details option;
      [@ocaml.doc
        "The Amazon Redshift reservations that Amazon Web Services recommends that you purchase.\n"]
  rds_instance_details : rds_instance_details option;
      [@ocaml.doc
        "The Amazon RDS reservations that Amazon Web Services recommends that you purchase.\n"]
  ec2_instance_details : ec2_instance_details option;
      [@ocaml.doc
        "The Amazon EC2 reservations that Amazon Web Services recommends that you purchase.\n"]
}
[@@ocaml.doc
  "Details about the reservations that Amazon Web Services recommends that you purchase.\n"]

type nonrec reservation_purchase_recommendation_detail = {
  average_number_of_capacity_units_used_per_hour : generic_string option;
      [@ocaml.doc
        "The average number of provisioned capacity units that you used in an hour during the \
         historical period. Amazon Web Services uses this to calculate your recommended \
         reservation purchases.\n"]
  maximum_number_of_capacity_units_used_per_hour : generic_string option;
      [@ocaml.doc
        "The maximum number of provisioned capacity units that you used in an hour during the \
         historical period. Amazon Web Services uses this to calculate your recommended \
         reservation purchases.\n"]
  minimum_number_of_capacity_units_used_per_hour : generic_string option;
      [@ocaml.doc
        "The minimum number of provisioned capacity units that you used in an hour during the \
         historical period. Amazon Web Services uses this to calculate your recommended \
         reservation purchases.\n"]
  recommended_number_of_capacity_units_to_purchase : generic_string option;
      [@ocaml.doc
        "The number of reserved capacity units that Amazon Web Services recommends that you \
         purchase.\n"]
  reserved_capacity_details : reserved_capacity_details option;
      [@ocaml.doc
        "Details about the reservations that Amazon Web Services recommends that you purchase.\n"]
  recurring_standard_monthly_cost : generic_string option;
      [@ocaml.doc "How much purchasing this instance costs you on a monthly basis.\n"]
  upfront_cost : generic_string option;
      [@ocaml.doc "How much purchasing this instance costs you upfront.\n"]
  estimated_reservation_cost_for_lookback_period : generic_string option;
      [@ocaml.doc
        "How much Amazon Web Services estimates that you might spend for all usage during the \
         specified historical period if you had a reservation.\n"]
  estimated_monthly_on_demand_cost : generic_string option;
      [@ocaml.doc
        "How much Amazon Web Services estimates that you spend on On-Demand Instances in a month.\n"]
  estimated_monthly_savings_percentage : generic_string option;
      [@ocaml.doc
        "How much Amazon Web Services estimates that this specific recommendation might save you \
         in a month, as a percentage of your overall costs.\n"]
  estimated_monthly_savings_amount : generic_string option;
      [@ocaml.doc
        "How much Amazon Web Services estimates that this specific recommendation might save you \
         in a month.\n"]
  currency_code : generic_string option;
      [@ocaml.doc
        "The currency code that Amazon Web Services used to calculate the costs for this instance.\n"]
  estimated_break_even_in_months : generic_string option;
      [@ocaml.doc
        "How long Amazon Web Services estimates that it takes for this instance to start saving \
         you money, in months.\n"]
  average_utilization : generic_string option;
      [@ocaml.doc
        "The average utilization of your instances. Amazon Web Services uses this to calculate \
         your recommended reservation purchases.\n"]
  average_normalized_units_used_per_hour : generic_string option;
      [@ocaml.doc
        "The average number of normalized units that you used in an hour during the historical \
         period. Amazon Web Services uses this to calculate your recommended reservation purchases.\n"]
  average_number_of_instances_used_per_hour : generic_string option;
      [@ocaml.doc
        "The average number of instances that you used in an hour during the historical period. \
         Amazon Web Services uses this to calculate your recommended reservation purchases.\n"]
  maximum_normalized_units_used_per_hour : generic_string option;
      [@ocaml.doc
        "The maximum number of normalized units that you used in an hour during the historical \
         period. Amazon Web Services uses this to calculate your recommended reservation purchases.\n"]
  maximum_number_of_instances_used_per_hour : generic_string option;
      [@ocaml.doc
        "The maximum number of instances that you used in an hour during the historical period. \
         Amazon Web Services uses this to calculate your recommended reservation purchases.\n"]
  minimum_normalized_units_used_per_hour : generic_string option;
      [@ocaml.doc
        "The minimum number of normalized units that you used in an hour during the historical \
         period. Amazon Web Services uses this to calculate your recommended reservation purchases.\n"]
  minimum_number_of_instances_used_per_hour : generic_string option;
      [@ocaml.doc
        "The minimum number of instances that you used in an hour during the historical period. \
         Amazon Web Services uses this to calculate your recommended reservation purchases.\n"]
  recommended_normalized_units_to_purchase : generic_string option;
      [@ocaml.doc
        "The number of normalized units that Amazon Web Services recommends that you purchase.\n"]
  recommended_number_of_instances_to_purchase : generic_string option;
      [@ocaml.doc
        "The number of instances that Amazon Web Services recommends that you purchase.\n"]
  instance_details : instance_details option;
      [@ocaml.doc
        "Details about the reservations that Amazon Web Services recommends that you purchase.\n"]
  account_id : generic_string option;
      [@ocaml.doc "The account that this Reserved Instance (RI) recommendation is for.\n"]
}
[@@ocaml.doc "Details about your recommended reservation purchase.\n"]

type nonrec reservation_purchase_recommendation_details =
  reservation_purchase_recommendation_detail list
[@@ocaml.doc ""]

type nonrec reservation_purchase_recommendation_summary = {
  currency_code : generic_string option;
      [@ocaml.doc "The currency code used for this recommendation.\n"]
  total_estimated_monthly_savings_percentage : generic_string option;
      [@ocaml.doc
        "The total amount that Amazon Web Services estimates that this recommendation could save \
         you in a month, as a percentage of your costs.\n"]
  total_estimated_monthly_savings_amount : generic_string option;
      [@ocaml.doc
        "The total amount that Amazon Web Services estimates that this recommendation could save \
         you in a month.\n"]
}
[@@ocaml.doc
  "A summary about this recommendation, such as the currency code, the amount that Amazon Web \
   Services estimates that you could save, and the total amount of reservation to purchase.\n"]

type nonrec reservation_purchase_recommendation = {
  recommendation_summary : reservation_purchase_recommendation_summary option;
      [@ocaml.doc "A summary about the recommended purchase.\n"]
  recommendation_details : reservation_purchase_recommendation_details option;
      [@ocaml.doc "Details about the recommended purchases.\n"]
  service_specification : service_specification option;
      [@ocaml.doc "Hardware specifications for the service that you want recommendations for.\n"]
  payment_option : payment_option option;
      [@ocaml.doc
        "The payment option for the reservation (for example, [AllUpfront] or [NoUpfront]).\n"]
  term_in_years : term_in_years option;
      [@ocaml.doc "The term of the reservation that you want recommendations for, in years.\n"]
  lookback_period_in_days : lookback_period_in_days option;
      [@ocaml.doc
        "How many days of previous usage that Amazon Web Services considers when making this \
         recommendation.\n"]
  account_scope : account_scope option;
      [@ocaml.doc
        "The account scope that Amazon Web Services recommends that you purchase this instance \
         for. For example, you can purchase this reservation for an entire organization in Amazon \
         Web Services Organizations.\n"]
}
[@@ocaml.doc "A specific reservation that Amazon Web Services recommends for purchase.\n"]

type nonrec reservation_purchase_recommendations = reservation_purchase_recommendation list
[@@ocaml.doc ""]

type nonrec reservation_purchase_recommendation_metadata = {
  additional_metadata : generic_string option;
      [@ocaml.doc "Additional metadata that might be applicable to the recommendation.\n"]
  generation_timestamp : generic_string option;
      [@ocaml.doc "The timestamp for when Amazon Web Services made the recommendation.\n"]
  recommendation_id : generic_string option; [@ocaml.doc "The ID for the recommendation.\n"]
}
[@@ocaml.doc
  "Information about a recommendation, such as the timestamp for when Amazon Web Services made a \
   specific recommendation.\n"]

type nonrec on_demand_hours = string [@@ocaml.doc ""]

type nonrec coverage_hours_percentage = string [@@ocaml.doc ""]

type nonrec coverage_hours = {
  coverage_hours_percentage : coverage_hours_percentage option;
      [@ocaml.doc "The percentage of instance hours that a reservation covered.\n"]
  total_running_hours : total_running_hours option;
      [@ocaml.doc "The total instance usage, in hours.\n"]
  reserved_hours : reserved_hours option;
      [@ocaml.doc "The number of instance running hours that reservations covered.\n"]
  on_demand_hours : on_demand_hours option;
      [@ocaml.doc "The number of instance running hours that On-Demand Instances covered.\n"]
}
[@@ocaml.doc "How long a running instance either used a reservation or was On-Demand.\n"]

type nonrec on_demand_normalized_units = string [@@ocaml.doc ""]

type nonrec coverage_normalized_units_percentage = string [@@ocaml.doc ""]

type nonrec coverage_normalized_units = {
  coverage_normalized_units_percentage : coverage_normalized_units_percentage option;
      [@ocaml.doc
        "The percentage of your used instance normalized units that a reservation covers.\n"]
  total_running_normalized_units : total_running_normalized_units option;
      [@ocaml.doc "The total number of normalized units that you used.\n"]
  reserved_normalized_units : reserved_normalized_units option;
      [@ocaml.doc "The number of normalized units that a reservation covers.\n"]
  on_demand_normalized_units : on_demand_normalized_units option;
      [@ocaml.doc
        "The number of normalized units that are covered by On-Demand Instances instead of a \
         reservation.\n"]
}
[@@ocaml.doc
  "The amount of instance usage, in normalized units. You can use normalized units to see your EC2 \
   usage for multiple sizes of instances in a uniform way. For example, suppose that you run an \
   xlarge instance and a 2xlarge instance. If you run both instances for the same amount of time, \
   the 2xlarge instance uses twice as much of your reservation as the xlarge instance, even though \
   both instances show only one instance-hour. When you use normalized units instead of \
   instance-hours, the xlarge instance used 8 normalized units, and the 2xlarge instance used 16 \
   normalized units.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ri-modifying.html}Modifying Reserved \
   Instances} in the {i Amazon Elastic Compute Cloud User Guide for Linux Instances}.\n\
  \ "]

type nonrec on_demand_cost = string [@@ocaml.doc ""]

type nonrec coverage_cost = {
  on_demand_cost : on_demand_cost option; [@ocaml.doc "How much an On-Demand Instance costs.\n"]
}
[@@ocaml.doc "How much it costs to run an instance.\n"]

type nonrec coverage = {
  coverage_cost : coverage_cost option;
      [@ocaml.doc "The amount of cost that the reservation covered.\n"]
  coverage_normalized_units : coverage_normalized_units option;
      [@ocaml.doc
        "The amount of instance usage that the reservation covered, in normalized units.\n"]
  coverage_hours : coverage_hours option;
      [@ocaml.doc "The amount of instance usage that the reservation covered, in hours.\n"]
}
[@@ocaml.doc "The amount of instance usage that a reservation covered.\n"]

type nonrec reservation_coverage_group = {
  coverage : coverage option;
      [@ocaml.doc "How much instance usage this group of reservations covered.\n"]
  attributes : attributes option; [@ocaml.doc "The attributes for this group of reservations.\n"]
}
[@@ocaml.doc "A group of reservations that share a set of attributes.\n"]

type nonrec reservation_coverage_groups = reservation_coverage_group list [@@ocaml.doc ""]

type nonrec request_changed_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Your request parameters changed between pages. Try again with the old parameters or without a \
   pagination token.\n"]

type nonrec recommendations_page_size = int [@@ocaml.doc ""]

type nonrec recommendation_id_list = recommendation_id list [@@ocaml.doc ""]

type nonrec recommendation_detail_data = {
  metrics_over_lookback_period : metrics_over_lookback_period option;
      [@ocaml.doc
        "The related hourly cost, coverage, and utilization metrics over the lookback period.\n"]
  estimated_average_coverage : generic_string option;
      [@ocaml.doc "The estimated coverage of the recommended Savings Plan.\n"]
  current_average_coverage : generic_string option;
      [@ocaml.doc "The average value of hourly coverage over the lookback period.\n"]
  upfront_cost : generic_string option;
      [@ocaml.doc
        "The upfront cost of the recommended Savings Plan, based on the selected payment option.\n"]
  hourly_commitment_to_purchase : generic_string option;
      [@ocaml.doc
        "The recommended hourly commitment level for the Savings Plan type and the configuration \
         that's based on the usage during the lookback period.\n"]
  existing_hourly_commitment : generic_string option;
      [@ocaml.doc "The existing hourly commitment for the Savings Plan type.\n"]
  estimated_savings_percentage : generic_string option;
      [@ocaml.doc
        "The estimated savings percentage relative to the total cost of applicable On-Demand usage \
         over the lookback period.\n"]
  estimated_savings_amount : generic_string option;
      [@ocaml.doc
        "The estimated savings amount that's based on the recommended Savings Plan over the length \
         of the lookback period.\n"]
  estimated_sp_cost : generic_string option;
      [@ocaml.doc
        "The cost of the recommended Savings Plan over the length of the lookback period.\n"]
  estimated_ro_i : generic_string option;
      [@ocaml.doc
        "The estimated return on investment that's based on the recommended Savings Plan that you \
         purchased. This is calculated as estimatedSavingsAmount/estimatedSPCost*100.\n"]
  estimated_on_demand_cost_with_current_commitment : generic_string option;
      [@ocaml.doc
        "The estimated On-Demand costs you expect with no additional commitment, based on your \
         usage of the selected time period and the Savings Plan you own.\n"]
  estimated_on_demand_cost : generic_string option;
      [@ocaml.doc
        "The remaining On-Demand cost estimated to not be covered by the recommended Savings Plan, \
         over the length of the lookback period.\n"]
  estimated_monthly_savings_amount : generic_string option;
      [@ocaml.doc "The estimated monthly savings amount based on the recommended Savings Plan.\n"]
  estimated_average_utilization : generic_string option;
      [@ocaml.doc "The estimated utilization of the recommended Savings Plan.\n"]
  current_minimum_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc
        "The lowest value of hourly On-Demand spend over the lookback period of the applicable \
         usage type.\n"]
  current_maximum_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc
        "The highest value of hourly On-Demand spend over the lookback period of the applicable \
         usage type.\n"]
  current_average_hourly_on_demand_spend : generic_string option;
      [@ocaml.doc
        "The average value of hourly On-Demand spend over the lookback period of the applicable \
         usage type.\n"]
  latest_usage_timestamp : zoned_date_time option; [@ocaml.doc ""]
  generation_timestamp : zoned_date_time option; [@ocaml.doc ""]
  offering_id : generic_string option;
      [@ocaml.doc "The unique ID that's used to distinguish Savings Plans from one another.\n"]
  region : generic_string option; [@ocaml.doc "The region the recommendation is generated for.\n"]
  instance_family : generic_string option;
      [@ocaml.doc "The instance family of the recommended Savings Plan.\n"]
  currency_code : generic_string option;
      [@ocaml.doc
        "The currency code that Amazon Web Services used to generate the recommendation and \
         present potential savings.\n"]
  account_id : generic_string option;
      [@ocaml.doc "The AccountID that the recommendation is generated for.\n"]
  payment_option : payment_option option;
      [@ocaml.doc
        "The payment option for the commitment (for example, All Upfront or No Upfront).\n"]
  term_in_years : term_in_years option; [@ocaml.doc "The term of the commitment in years.\n"]
  savings_plans_type : supported_savings_plans_type option;
      [@ocaml.doc "The requested Savings Plan recommendation type.\n"]
  lookback_period_in_days : lookback_period_in_days option;
      [@ocaml.doc
        "How many days of previous usage that Amazon Web Services considers when making this \
         recommendation.\n"]
  account_scope : account_scope option;
      [@ocaml.doc
        "The account scope that you want your recommendations for. Amazon Web Services calculates \
         recommendations including the management account and member accounts if the value is set \
         to PAYER. If the value is LINKED, recommendations are calculated for individual member \
         accounts only.\n"]
}
[@@ocaml.doc "The details and metrics for the given recommendation.\n"]

type nonrec provide_anomaly_feedback_response = {
  anomaly_id : generic_string; [@ocaml.doc "The ID of the modified cost anomaly. \n"]
}
[@@ocaml.doc ""]

type nonrec anomaly_feedback_type =
  | PLANNED_ACTIVITY [@ocaml.doc ""]
  | NO [@ocaml.doc ""]
  | YES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec provide_anomaly_feedback_request = {
  feedback : anomaly_feedback_type;
      [@ocaml.doc
        "Describes whether the cost anomaly was a planned activity or you considered it an anomaly. \n"]
  anomaly_id : generic_string; [@ocaml.doc "A cost anomaly ID. \n"]
}
[@@ocaml.doc ""]

type nonrec prediction_interval_level = int [@@ocaml.doc ""]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec non_negative_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec non_negative_integer = int [@@ocaml.doc ""]

type nonrec next_page_token = string [@@ocaml.doc ""]

type nonrec monitor_type = CUSTOM [@ocaml.doc ""] | DIMENSIONAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec monitor_dimension =
  | COST_CATEGORY [@ocaml.doc ""]
  | TAG [@ocaml.doc ""]
  | LINKED_ACCOUNT [@ocaml.doc ""]
  | SERVICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_names = metric_name list [@@ocaml.doc ""]

type nonrec metric =
  | NORMALIZED_USAGE_AMOUNT [@ocaml.doc ""]
  | USAGE_QUANTITY [@ocaml.doc ""]
  | NET_AMORTIZED_COST [@ocaml.doc ""]
  | NET_UNBLENDED_COST [@ocaml.doc ""]
  | AMORTIZED_COST [@ocaml.doc ""]
  | UNBLENDED_COST [@ocaml.doc ""]
  | BLENDED_COST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc "A list of tag key value pairs that are associated with the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource. For a list of supported resources, see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_ResourceTag.html}ResourceTag}.\n"]
}
[@@ocaml.doc ""]

type nonrec generation_status =
  | FAILED [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec generation_summary = {
  estimated_completion_time : zoned_date_time option;
      [@ocaml.doc
        "Indicates the estimated time for when the recommendation generation will complete.\n"]
  generation_completion_time : zoned_date_time option;
      [@ocaml.doc "Indicates the completion time of the recommendation generation.\n"]
  generation_started_time : zoned_date_time option;
      [@ocaml.doc "Indicates the start time of the recommendation generation.\n"]
  generation_status : generation_status option;
      [@ocaml.doc
        "Indicates whether the recommendation generation succeeded, is processing, or failed.\n"]
  recommendation_id : recommendation_id option;
      [@ocaml.doc "Indicates the ID for this specific recommendation.\n"]
}
[@@ocaml.doc "The summary of the Savings Plans recommendation generation.\n"]

type nonrec generation_summary_list = generation_summary list [@@ocaml.doc ""]

type nonrec list_savings_plans_purchase_recommendation_generation_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  generation_summary_list : generation_summary_list option;
      [@ocaml.doc "The list of historical recommendation generations.\n"]
}
[@@ocaml.doc ""]

type nonrec list_savings_plans_purchase_recommendation_generation_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  page_size : recommendations_page_size option;
      [@ocaml.doc
        "The number of recommendations that you want returned in a single response object.\n"]
  recommendation_ids : recommendation_id_list option;
      [@ocaml.doc "The IDs for each specific recommendation.\n"]
  generation_status : generation_status option;
      [@ocaml.doc "The status of the recommendation generation.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The pagination token is invalid. Try again without a pagination token.\n"]

type nonrec generic_arn = string [@@ocaml.doc ""]

type nonrec cost_category_resource_association = {
  cost_category_arn : arn option; [@ocaml.doc "The unique identifier for your cost category. \n"]
  cost_category_name : cost_category_name option; [@ocaml.doc ""]
  resource_arn : generic_arn option;
      [@ocaml.doc " The unique identifier for an associated resource. \n"]
}
[@@ocaml.doc
  "A reference to a cost category association that contains information on an associated resource. \n"]

type nonrec cost_category_resource_associations = cost_category_resource_association list
[@@ocaml.doc ""]

type nonrec list_cost_category_resource_associations_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  cost_category_resource_associations : cost_category_resource_associations option;
      [@ocaml.doc
        " A reference to a cost category association that contains information on an associated \
         resource. \n"]
}
[@@ocaml.doc ""]

type nonrec cost_category_max_results = int [@@ocaml.doc ""]

type nonrec list_cost_category_resource_associations_request = {
  max_results : cost_category_max_results option;
      [@ocaml.doc " The number of entries a paginated response contains. \n"]
  next_token : next_page_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  cost_category_arn : arn option; [@ocaml.doc "The unique identifier for your cost category.\n"]
}
[@@ocaml.doc ""]

type nonrec cost_category_status_component = COST_EXPLORER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec cost_category_status = APPLIED [@ocaml.doc ""] | PROCESSING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_category_processing_status = {
  status : cost_category_status option;
      [@ocaml.doc "The process status for a specific cost category. \n"]
  component : cost_category_status_component option;
      [@ocaml.doc "The Cost Management product name of the applied status. \n"]
}
[@@ocaml.doc
  "The list of processing statuses for Cost Management products for a specific cost category. \n"]

type nonrec cost_category_processing_status_list = cost_category_processing_status list
[@@ocaml.doc ""]

type nonrec cost_category_values_list = cost_category_value list [@@ocaml.doc ""]

type nonrec cost_category_reference = {
  supported_resource_types : resource_types option;
      [@ocaml.doc " The resource types supported by a specific cost category. \n"]
  default_value : cost_category_value option; [@ocaml.doc ""]
  values : cost_category_values_list option;
      [@ocaml.doc "A list of unique cost category values in a specific cost category. \n"]
  processing_status : cost_category_processing_status_list option;
      [@ocaml.doc
        "The list of processing statuses for Cost Management products for a specific cost category. \n"]
  number_of_rules : non_negative_integer option;
      [@ocaml.doc "The number of rules that are associated with a specific cost category. \n"]
  effective_end : zoned_date_time option; [@ocaml.doc "The cost category's effective end date.\n"]
  effective_start : zoned_date_time option;
      [@ocaml.doc "The cost category's effective start date.\n"]
  name : cost_category_name option; [@ocaml.doc ""]
  cost_category_arn : arn option; [@ocaml.doc "The unique identifier for your cost category. \n"]
}
[@@ocaml.doc
  "A reference to a cost category containing only enough information to identify the Cost \
   Category.\n\n\
  \ You can use this information to retrieve the full cost category information using \
   [DescribeCostCategory].\n\
  \ "]

type nonrec cost_category_references_list = cost_category_reference list [@@ocaml.doc ""]

type nonrec list_cost_category_definitions_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  cost_category_references : cost_category_references_list option;
      [@ocaml.doc
        "A reference to a cost category that contains enough information to identify the Cost \
         Category. \n"]
}
[@@ocaml.doc ""]

type nonrec list_cost_category_definitions_request = {
  supported_resource_types : resource_types_filter_input option;
      [@ocaml.doc
        " Filter cost category definitions that are supported by given resource types based on the \
         latest version. If the filter is present, the result only includes Cost Categories that \
         supports input resource type. If the filter isn't provided, no filtering is applied. The \
         valid values are [billing:rispgroupsharing] and [billing:billingview]. \n"]
  max_results : cost_category_max_results option;
      [@ocaml.doc "The number of entries a paginated response contains. \n"]
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  effective_on : zoned_date_time option;
      [@ocaml.doc "The date when the cost category was effective. \n"]
}
[@@ocaml.doc ""]

type nonrec cost_allocation_tag_type =
  | USER_DEFINED [@ocaml.doc ""]
  | AWS_GENERATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cost_allocation_tag = {
  last_used_date : zoned_date_time option;
      [@ocaml.doc "The last month that the tag was used on an Amazon Web Services resource.\n"]
  last_updated_date : zoned_date_time option;
      [@ocaml.doc "The last date that the tag was either activated or deactivated.\n"]
  status : cost_allocation_tag_status; [@ocaml.doc "The status of a cost allocation tag. \n"]
  type_ : cost_allocation_tag_type;
      [@ocaml.doc
        "The type of cost allocation tag. You can use [AWSGenerated] or [UserDefined] type tags. \
         [AWSGenerated] type tags are tags that Amazon Web Services defines and applies to support \
         Amazon Web Services resources for cost allocation purposes. [UserDefined] type tags are \
         tags that you define, create, and apply to resources. \n"]
  tag_key : tag_key; [@ocaml.doc "The key for the cost allocation tag. \n"]
}
[@@ocaml.doc
  "The cost allocation tag structure. This includes detailed metadata for the [CostAllocationTag] \
   object. \n"]

type nonrec cost_allocation_tag_list = cost_allocation_tag list [@@ocaml.doc ""]

type nonrec list_cost_allocation_tags_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  cost_allocation_tags : cost_allocation_tag_list option;
      [@ocaml.doc
        "A list of cost allocation tags that includes the detailed metadata for each one. \n"]
}
[@@ocaml.doc ""]

type nonrec cost_allocation_tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec cost_allocation_tags_max_results = int [@@ocaml.doc ""]

type nonrec list_cost_allocation_tags_request = {
  max_results : cost_allocation_tags_max_results option;
      [@ocaml.doc
        "The maximum number of objects that are returned for this request. By default, the request \
         returns 100 results. \n"]
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  type_ : cost_allocation_tag_type option;
      [@ocaml.doc
        "The type of [CostAllocationTag] object that are returned for this request. The \
         [AWSGenerated] type tags are tags that Amazon Web Services defines and applies to support \
         Amazon Web Services resources for cost allocation purposes. The [UserDefined] type tags \
         are tags that you define, create, and apply to resources. \n"]
  tag_keys : cost_allocation_tag_key_list option;
      [@ocaml.doc "The list of cost allocation tag keys that are returned for this request. \n"]
  status : cost_allocation_tag_status option;
      [@ocaml.doc "The status of cost allocation tag keys that are returned for this request. \n"]
}
[@@ocaml.doc ""]

type nonrec cost_allocation_tag_backfill_request_list = cost_allocation_tag_backfill_request list
[@@ocaml.doc ""]

type nonrec list_cost_allocation_tag_backfill_history_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  backfill_requests : cost_allocation_tag_backfill_request_list option;
      [@ocaml.doc " The list of historical cost allocation tag backfill requests. \n"]
}
[@@ocaml.doc ""]

type nonrec list_cost_allocation_tag_backfill_history_request = {
  max_results : cost_allocation_tags_max_results option;
      [@ocaml.doc " The maximum number of objects that are returned for this request. \n"]
  next_token : next_page_token option;
      [@ocaml.doc
        " The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
}
[@@ocaml.doc ""]

type nonrec analysis_status =
  | FAILED [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_code =
  | INVALID_ACCOUNT_ID [@ocaml.doc ""]
  | INVALID_SAVINGS_PLANS_TO_EXCLUDE [@ocaml.doc ""]
  | INVALID_SAVINGS_PLANS_TO_ADD [@ocaml.doc ""]
  | INTERNAL_FAILURE [@ocaml.doc ""]
  | NO_USAGE_FOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec analysis_summary = {
  commitment_purchase_analysis_configuration : commitment_purchase_analysis_configuration option;
      [@ocaml.doc "The configuration for the commitment purchase analysis.\n"]
  analysis_id : analysis_id option;
      [@ocaml.doc "The analysis ID that's associated with the commitment purchase analysis.\n"]
  error_code : error_code option; [@ocaml.doc "The error code used for the analysis.\n"]
  analysis_status : analysis_status option; [@ocaml.doc "The status of the analysis.\n"]
  analysis_started_time : zoned_date_time option; [@ocaml.doc "The start time of the analysis.\n"]
  analysis_completion_time : zoned_date_time option;
      [@ocaml.doc "The completion time of the analysis.\n"]
  estimated_completion_time : zoned_date_time option;
      [@ocaml.doc "The estimated time for when the analysis will complete.\n"]
}
[@@ocaml.doc "A summary of the analysis.\n"]

type nonrec analysis_summary_list = analysis_summary list [@@ocaml.doc ""]

type nonrec list_commitment_purchase_analyses_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  analysis_summary_list : analysis_summary_list option; [@ocaml.doc "The list of analyses.\n"]
}
[@@ocaml.doc ""]

type nonrec analyses_page_size = int [@@ocaml.doc ""]

type nonrec analysis_ids = analysis_id list [@@ocaml.doc ""]

type nonrec list_commitment_purchase_analyses_request = {
  analysis_ids : analysis_ids option;
      [@ocaml.doc "The analysis IDs associated with the commitment purchase analyses.\n"]
  page_size : analyses_page_size option;
      [@ocaml.doc "The number of analyses that you want returned in a single response object.\n"]
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  analysis_status : analysis_status option; [@ocaml.doc "The status of the analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec impact = {
  total_impact_percentage : nullable_non_negative_double option;
      [@ocaml.doc
        "The cumulative percentage difference between the total actual spend and total expected \
         spend. It is calculated as [(TotalImpact / TotalExpectedSpend) * 100]. When \
         [TotalExpectedSpend] is zero, this field is omitted. Expected spend can be zero in \
         situations such as when you start to use a service for the first time.\n"]
  total_expected_spend : nullable_non_negative_double option;
      [@ocaml.doc
        "The cumulative dollar amount that was expected to be spent during the anomaly. It is \
         calculated using advanced machine learning models to determine the typical spending \
         pattern based on historical data for a customer.\n"]
  total_actual_spend : nullable_non_negative_double option;
      [@ocaml.doc "The cumulative dollar amount that was actually spent during the anomaly.\n"]
  total_impact : generic_double option;
      [@ocaml.doc
        "The cumulative dollar difference between the total actual spend and total expected spend. \
         It is calculated as [TotalActualSpend - TotalExpectedSpend].\n"]
  max_impact : generic_double;
      [@ocaml.doc "The maximum dollar value that's observed for an anomaly.\n"]
}
[@@ocaml.doc "The dollar value of the anomaly. \n"]

type nonrec group_definition_type =
  | COST_CATEGORY [@ocaml.doc ""]
  | TAG [@ocaml.doc ""]
  | DIMENSION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec group_definition_key = string [@@ocaml.doc ""]

type nonrec group_definition = {
  key : group_definition_key option;
      [@ocaml.doc "The string that represents a key for a specified group.\n"]
  type_ : group_definition_type option;
      [@ocaml.doc "The string that represents the type of group.\n"]
}
[@@ocaml.doc
  "Represents a group when you specify a group by criteria or in the response to a query with a \
   specific grouping.\n"]

type nonrec group_definitions = group_definition list [@@ocaml.doc ""]

type nonrec granularity = HOURLY [@ocaml.doc ""] | MONTHLY [@ocaml.doc ""] | DAILY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec forecast_result = {
  prediction_interval_upper_bound : generic_string option;
      [@ocaml.doc "The upper limit for the prediction interval. \n"]
  prediction_interval_lower_bound : generic_string option;
      [@ocaml.doc "The lower limit for the prediction interval. \n"]
  mean_value : generic_string option; [@ocaml.doc "The mean value of the forecast.\n"]
  time_period : date_interval option; [@ocaml.doc "The period of time that the forecast covers.\n"]
}
[@@ocaml.doc "The forecast that's created for your query.\n"]

type nonrec forecast_results_by_time = forecast_result list [@@ocaml.doc ""]

type nonrec get_usage_forecast_response = {
  forecast_results_by_time : forecast_results_by_time option;
      [@ocaml.doc
        "The forecasts for your query, in order. For [DAILY] forecasts, this is a list of days. \
         For [MONTHLY] forecasts, this is a list of months.\n"]
  total : metric_value option;
      [@ocaml.doc "How much you're forecasted to use over the forecast period.\n"]
}
[@@ocaml.doc ""]

type nonrec billing_view_arn = string [@@ocaml.doc ""]

type nonrec get_usage_forecast_request = {
  prediction_interval_level : prediction_interval_level option;
      [@ocaml.doc
        "Amazon Web Services Cost Explorer always returns the mean forecast as a single point. You \
         can request a prediction interval around the mean by specifying a confidence level. The \
         higher the confidence level, the more confident Cost Explorer is about the actual value \
         falling in the prediction interval. Higher confidence levels result in wider prediction \
         intervals.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  filter : expression option;
      [@ocaml.doc
        "The filters that you want to use to filter your forecast. The [GetUsageForecast] API \
         supports filtering by the following dimensions:\n\n\
        \ {ul\n\
        \       {-   [AZ] \n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [LINKED_ACCOUNT] \n\
        \           \n\
        \            }\n\
        \       {-   [LINKED_ACCOUNT_NAME] \n\
        \           \n\
        \            }\n\
        \       {-   [OPERATION] \n\
        \           \n\
        \            }\n\
        \       {-   [PURCHASE_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [REGION] \n\
        \           \n\
        \            }\n\
        \       {-   [SERVICE] \n\
        \           \n\
        \            }\n\
        \       {-   [USAGE_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [USAGE_TYPE_GROUP] \n\
        \           \n\
        \            }\n\
        \       {-   [RECORD_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [OPERATING_SYSTEM] \n\
        \           \n\
        \            }\n\
        \       {-   [TENANCY] \n\
        \           \n\
        \            }\n\
        \       {-   [SCOPE] \n\
        \           \n\
        \            }\n\
        \       {-   [PLATFORM] \n\
        \           \n\
        \            }\n\
        \       {-   [SUBSCRIPTION_ID] \n\
        \           \n\
        \            }\n\
        \       {-   [LEGAL_ENTITY_NAME] \n\
        \           \n\
        \            }\n\
        \       {-   [DEPLOYMENT_OPTION] \n\
        \           \n\
        \            }\n\
        \       {-   [DATABASE_ENGINE] \n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_TYPE_FAMILY] \n\
        \           \n\
        \            }\n\
        \       {-   [BILLING_ENTITY] \n\
        \           \n\
        \            }\n\
        \       {-   [RESERVATION_ID] \n\
        \           \n\
        \            }\n\
        \       {-   [SAVINGS_PLAN_ARN] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  granularity : granularity;
      [@ocaml.doc
        "How granular you want the forecast to be. You can get 3 months of [DAILY] forecasts or 18 \
         months of [MONTHLY] forecasts.\n\n\
        \ The [GetUsageForecast] operation supports only [DAILY] and [MONTHLY] granularities.\n\
        \ "]
  metric : metric;
      [@ocaml.doc
        "Which metric Cost Explorer uses to create your forecast.\n\n\
        \ Valid values for a [GetUsageForecast] call are the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  USAGE_QUANTITY\n\
        \            \n\
        \             }\n\
        \        {-  NORMALIZED_USAGE_AMOUNT\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  time_period : date_interval;
      [@ocaml.doc
        "The start and end dates of the period that you want to retrieve usage forecast for. The \
         start date is included in the period, but the end date isn't included in the period. For \
         example, if [start] is [2017-01-01] and [end] is [2017-05-01], then the cost and usage \
         data is retrieved from [2017-01-01] up to and including [2017-04-30] but not including \
         [2017-05-01]. The start date must be equal to or later than the current date to avoid a \
         validation error.\n"]
}
[@@ocaml.doc ""]

type nonrec billing_view_health_status_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The billing view status must be [HEALTHY] to perform this action. Try again when the status is \
   [HEALTHY]. \n"]

type nonrec get_tags_response = {
  total_size : page_size; [@ocaml.doc "The total number of query results.\n"]
  return_size : page_size;
      [@ocaml.doc "The number of query results that Amazon Web Services returns at a time.\n"]
  tags : tag_list; [@ocaml.doc "The tags that match your request.\n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token for the next set of retrievable results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
}
[@@ocaml.doc ""]

type nonrec get_tags_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "This field is only used when SortBy is provided in the request. The maximum number of \
         objects that are returned for this request. If MaxResults isn't specified with SortBy, \
         the request returns 1000 results as the default value for this parameter.\n\n\
        \ For [GetTags], MaxResults has an upper quota of 1000.\n\
        \ "]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  sort_by : sort_definitions option;
      [@ocaml.doc
        "The value that you want to sort the data by.\n\n\
        \ The key represents cost and usage metrics. The following values are supported:\n\
        \ \n\
        \  {ul\n\
        \        {-   [BlendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [UnblendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [AmortizedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [NetAmortizedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [NetUnblendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [UsageQuantity] \n\
        \            \n\
        \             }\n\
        \        {-   [NormalizedUsageAmount] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The supported values for [SortOrder] are [ASCENDING] and [DESCENDING].\n\
        \   \n\
        \    When you use [SortBy], [NextPageToken] and [SearchString] aren't supported.\n\
        \    "]
  filter : expression option; [@ocaml.doc ""]
  tag_key : tag_key option; [@ocaml.doc "The key of the tag that you want to return values for.\n"]
  time_period : date_interval;
      [@ocaml.doc
        "The start and end dates for retrieving the dimension values. The start date is inclusive, \
         but the end date is exclusive. For example, if [start] is [2017-01-01] and [end] is \
         [2017-05-01], then the cost and usage data is retrieved from [2017-01-01] up to and \
         including [2017-04-30] but not including [2017-05-01].\n"]
  search_string : search_string option; [@ocaml.doc "The value that you want to search for.\n"]
}
[@@ocaml.doc ""]

type nonrec bill_expiration_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested report expired. Update the date interval and try again.\n"]

type nonrec get_savings_plans_utilization_response = {
  total : savings_plans_utilization_aggregates;
      [@ocaml.doc
        "The total amount of cost/commitment that you used your Savings Plans, regardless of date \
         ranges.\n"]
  savings_plans_utilizations_by_time : savings_plans_utilizations_by_time option;
      [@ocaml.doc
        "The amount of cost/commitment that you used your Savings Plans. You can use it to specify \
         date ranges.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plans_utilization_request = {
  sort_by : sort_definition option;
      [@ocaml.doc
        "The value that you want to sort the data by.\n\n\
        \ The following values are supported for [Key]:\n\
        \ \n\
        \  {ul\n\
        \        {-   [UtilizationPercentage] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalCommitment] \n\
        \            \n\
        \             }\n\
        \        {-   [UsedCommitment] \n\
        \            \n\
        \             }\n\
        \        {-   [UnusedCommitment] \n\
        \            \n\
        \             }\n\
        \        {-   [NetSavings] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The supported values for [SortOrder] are [ASCENDING] and [DESCENDING].\n\
        \   "]
  filter : expression option;
      [@ocaml.doc
        "Filters Savings Plans utilization coverage data for active Savings Plans dimensions. You \
         can filter data with the following dimensions:\n\n\
        \ {ul\n\
        \       {-   [LINKED_ACCOUNT] \n\
        \           \n\
        \            }\n\
        \       {-   [SAVINGS_PLAN_ARN] \n\
        \           \n\
        \            }\n\
        \       {-   [SAVINGS_PLANS_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [REGION] \n\
        \           \n\
        \            }\n\
        \       {-   [PAYMENT_OPTION] \n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_TYPE_FAMILY] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [GetSavingsPlansUtilization] uses the same \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object as the other operations, but only [AND] is supported among each dimension.\n\
        \   "]
  granularity : granularity option;
      [@ocaml.doc
        "The granularity of the Amazon Web Services utillization data for your Savings Plans.\n\n\
        \ The [GetSavingsPlansUtilization] operation supports only [DAILY] and [MONTHLY] \
         granularities.\n\
        \ "]
  time_period : date_interval;
      [@ocaml.doc
        "The time period that you want the usage and costs for. The [Start] date must be within 13 \
         months. The [End] date must be after the [Start] date, and before the current date. \
         Future dates can't be used as an [End] date.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plans_utilization_details_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  time_period : date_interval; [@ocaml.doc ""]
  total : savings_plans_utilization_aggregates option;
      [@ocaml.doc "The total Savings Plans utilization, regardless of time period.\n"]
  savings_plans_utilization_details : savings_plans_utilization_details;
      [@ocaml.doc
        "Retrieves a single daily or monthly Savings Plans utilization rate and details for your \
         account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plans_utilization_details_request = {
  sort_by : sort_definition option;
      [@ocaml.doc
        "The value that you want to sort the data by.\n\n\
        \ The following values are supported for [Key]:\n\
        \ \n\
        \  {ul\n\
        \        {-   [UtilizationPercentage] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalCommitment] \n\
        \            \n\
        \             }\n\
        \        {-   [UsedCommitment] \n\
        \            \n\
        \             }\n\
        \        {-   [UnusedCommitment] \n\
        \            \n\
        \             }\n\
        \        {-   [NetSavings] \n\
        \            \n\
        \             }\n\
        \        {-   [AmortizedRecurringCommitment] \n\
        \            \n\
        \             }\n\
        \        {-   [AmortizedUpfrontCommitment] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The supported values for [SortOrder] are [ASCENDING] and [DESCENDING].\n\
        \   "]
  max_results : max_results option;
      [@ocaml.doc
        "The number of items to be returned in a response. The default is [20], with a minimum \
         value of [1].\n"]
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  data_type : savings_plans_data_types option; [@ocaml.doc "The data type.\n"]
  filter : expression option;
      [@ocaml.doc
        "Filters Savings Plans utilization coverage data for active Savings Plans dimensions. You \
         can filter data with the following dimensions:\n\n\
        \ {ul\n\
        \       {-   [LINKED_ACCOUNT] \n\
        \           \n\
        \            }\n\
        \       {-   [SAVINGS_PLAN_ARN] \n\
        \           \n\
        \            }\n\
        \       {-   [REGION] \n\
        \           \n\
        \            }\n\
        \       {-   [PAYMENT_OPTION] \n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_TYPE_FAMILY] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [GetSavingsPlansUtilizationDetails] uses the same \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object as the other operations, but only [AND] is supported among each dimension.\n\
        \   "]
  time_period : date_interval;
      [@ocaml.doc
        "The time period that you want the usage and costs for. The [Start] date must be within 13 \
         months. The [End] date must be after the [Start] date, and before the current date. \
         Future dates can't be used as an [End] date.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plans_purchase_recommendation_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token for the next set of retrievable results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  savings_plans_purchase_recommendation : savings_plans_purchase_recommendation option;
      [@ocaml.doc
        "Contains your request parameters, Savings Plan Recommendations Summary, and Details.\n"]
  metadata : savings_plans_purchase_recommendation_metadata option;
      [@ocaml.doc "Information that regards this specific recommendation set.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plans_purchase_recommendation_request = {
  filter : expression option;
      [@ocaml.doc
        "You can filter your recommendations by Account ID with the [LINKED_ACCOUNT] dimension. To \
         filter your recommendations by Account ID, specify [Key] as [LINKED_ACCOUNT] and [Value] \
         as the comma-separated Acount ID(s) that you want to see Savings Plans purchase \
         recommendations for.\n\n\
        \ For GetSavingsPlansPurchaseRecommendation, the [Filter] doesn't include [CostCategories] \
         or [Tags]. It only includes [Dimensions]. With [Dimensions], [Key] must be \
         [LINKED_ACCOUNT] and [Value] can be a single Account ID or multiple comma-separated \
         Account IDs that you want to see Savings Plans Purchase Recommendations for. [AND] and \
         [OR] operators are not supported.\n\
        \ "]
  lookback_period_in_days : lookback_period_in_days;
      [@ocaml.doc "The lookback period that's used to generate the recommendation.\n"]
  page_size : recommendations_page_size option;
      [@ocaml.doc
        "The number of recommendations that you want returned in a single response object.\n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  account_scope : account_scope option;
      [@ocaml.doc
        "The account scope that you want your recommendations for. Amazon Web Services calculates \
         recommendations including the management account and member accounts if the value is set \
         to [PAYER]. If the value is [LINKED], recommendations are calculated for individual \
         member accounts only.\n"]
  payment_option : payment_option;
      [@ocaml.doc "The payment option that's used to generate these recommendations.\n"]
  term_in_years : term_in_years;
      [@ocaml.doc
        "The savings plan recommendation term that's used to generate these recommendations.\n"]
  savings_plans_type : supported_savings_plans_type;
      [@ocaml.doc "The Savings Plans recommendation type that's requested.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plans_coverage_response = {
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  savings_plans_coverages : savings_plans_coverages;
      [@ocaml.doc "The amount of spend that your Savings Plans covered.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plans_coverage_request = {
  sort_by : sort_definition option;
      [@ocaml.doc
        "The value that you want to sort the data by.\n\n\
        \ The following values are supported for [Key]:\n\
        \ \n\
        \  {ul\n\
        \        {-   [SpendCoveredBySavingsPlan] \n\
        \            \n\
        \             }\n\
        \        {-   [OnDemandCost] \n\
        \            \n\
        \             }\n\
        \        {-   [CoveragePercentage] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalCost] \n\
        \            \n\
        \             }\n\
        \        {-   [InstanceFamily] \n\
        \            \n\
        \             }\n\
        \        {-   [Region] \n\
        \            \n\
        \             }\n\
        \        {-   [Service] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The supported values for [SortOrder] are [ASCENDING] and [DESCENDING].\n\
        \   "]
  max_results : max_results option;
      [@ocaml.doc
        "The number of items to be returned in a response. The default is [20], with a minimum \
         value of [1].\n"]
  next_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  metrics : metric_names option;
      [@ocaml.doc
        "The measurement that you want your Savings Plans coverage reported in. The only valid \
         value is [SpendCoveredBySavingsPlans].\n"]
  filter : expression option;
      [@ocaml.doc
        "Filters Savings Plans coverage data by dimensions. You can filter data for Savings Plans \
         usage with the following dimensions:\n\n\
        \ {ul\n\
        \       {-   [LINKED_ACCOUNT] \n\
        \           \n\
        \            }\n\
        \       {-   [REGION] \n\
        \           \n\
        \            }\n\
        \       {-   [SERVICE] \n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_FAMILY] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [GetSavingsPlansCoverage] uses the same \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object as the other operations, but only [AND] is supported among each dimension. If \
         there are multiple values for a dimension, they are OR'd together.\n\
        \   \n\
        \    Cost category is also supported.\n\
        \    "]
  granularity : granularity option;
      [@ocaml.doc
        "The granularity of the Amazon Web Services cost data for your Savings Plans. \
         [Granularity] can't be set if [GroupBy] is set.\n\n\
        \ The [GetSavingsPlansCoverage] operation supports only [DAILY] and [MONTHLY] granularities.\n\
        \ "]
  group_by : group_definitions option;
      [@ocaml.doc
        "You can group the data using the attributes [INSTANCE_FAMILY], [REGION], or [SERVICE].\n"]
  time_period : date_interval;
      [@ocaml.doc
        "The time period that you want the usage and costs for. The [Start] date must be within 13 \
         months. The [End] date must be after the [Start] date, and before the current date. \
         Future dates can't be used as an [End] date.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plan_purchase_recommendation_details_response = {
  recommendation_detail_data : recommendation_detail_data option;
      [@ocaml.doc "Contains detailed information about a specific Savings Plan recommendation.\n"]
  recommendation_detail_id : recommendation_detail_id option;
      [@ocaml.doc "The ID that is associated with the Savings Plan recommendation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_savings_plan_purchase_recommendation_details_request = {
  recommendation_detail_id : recommendation_detail_id;
      [@ocaml.doc "The ID that is associated with the Savings Plan recommendation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rightsizing_recommendation_response = {
  configuration : rightsizing_recommendation_configuration option;
      [@ocaml.doc
        "You can use Configuration to customize recommendations across two attributes. You can \
         choose to view recommendations for instances within the same instance families or across \
         different instance families. You can also choose to view your estimated savings that are \
         associated with recommendations with consideration of existing Savings Plans or RI \
         benefits, or neither. \n"]
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  rightsizing_recommendations : rightsizing_recommendation_list option;
      [@ocaml.doc "Recommendations to rightsize resources.\n"]
  summary : rightsizing_recommendation_summary option;
      [@ocaml.doc "Summary of this recommendation set.\n"]
  metadata : rightsizing_recommendation_metadata option;
      [@ocaml.doc "Information regarding this specific recommendation set.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rightsizing_recommendation_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
  page_size : recommendations_page_size option;
      [@ocaml.doc
        "The number of recommendations that you want returned in a single response object.\n"]
  service : generic_string;
      [@ocaml.doc
        "The specific service that you want recommendations for. The only valid value for \
         [GetRightsizingRecommendation] is \"[AmazonEC2]\".\n"]
  configuration : rightsizing_recommendation_configuration option;
      [@ocaml.doc
        "You can use Configuration to customize recommendations across two attributes. You can \
         choose to view recommendations for instances within the same instance families or across \
         different instance families. You can also choose to view your estimated savings that are \
         associated with recommendations with consideration of existing Savings Plans or RI \
         benefits, or neither. \n"]
  filter : expression option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_reservation_utilization_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token for the next set of retrievable results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  total : reservation_aggregates option;
      [@ocaml.doc "The total amount of time that you used your Reserved Instances (RIs).\n"]
  utilizations_by_time : utilizations_by_time;
      [@ocaml.doc "The amount of time that you used your Reserved Instances (RIs).\n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_utilization_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of objects that you returned for this request. If more objects are \
         available, in the response, Amazon Web Services provides a NextPageToken value that you \
         can use in a subsequent call to get the next batch of objects.\n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  sort_by : sort_definition option;
      [@ocaml.doc
        "The value that you want to sort the data by.\n\n\
        \ The following values are supported for [Key]:\n\
        \ \n\
        \  {ul\n\
        \        {-   [UtilizationPercentage] \n\
        \            \n\
        \             }\n\
        \        {-   [UtilizationPercentageInUnits] \n\
        \            \n\
        \             }\n\
        \        {-   [PurchasedHours] \n\
        \            \n\
        \             }\n\
        \        {-   [PurchasedUnits] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalActualHours] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalActualUnits] \n\
        \            \n\
        \             }\n\
        \        {-   [UnusedHours] \n\
        \            \n\
        \             }\n\
        \        {-   [UnusedUnits] \n\
        \            \n\
        \             }\n\
        \        {-   [OnDemandCostOfRIHoursUsed] \n\
        \            \n\
        \             }\n\
        \        {-   [NetRISavings] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalPotentialRISavings] \n\
        \            \n\
        \             }\n\
        \        {-   [AmortizedUpfrontFee] \n\
        \            \n\
        \             }\n\
        \        {-   [AmortizedRecurringFee] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalAmortizedFee] \n\
        \            \n\
        \             }\n\
        \        {-   [RICostForUnusedHours] \n\
        \            \n\
        \             }\n\
        \        {-   [RealizedSavings] \n\
        \            \n\
        \             }\n\
        \        {-   [UnrealizedSavings] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The supported values for [SortOrder] are [ASCENDING] and [DESCENDING].\n\
        \   "]
  filter : expression option;
      [@ocaml.doc
        "Filters utilization data by dimensions. You can filter by the following dimensions:\n\n\
        \ {ul\n\
        \       {-  AZ\n\
        \           \n\
        \            }\n\
        \       {-  CACHE_ENGINE\n\
        \           \n\
        \            }\n\
        \       {-  DEPLOYMENT_OPTION\n\
        \           \n\
        \            }\n\
        \       {-  INSTANCE_TYPE\n\
        \           \n\
        \            }\n\
        \       {-  LINKED_ACCOUNT\n\
        \           \n\
        \            }\n\
        \       {-  OPERATING_SYSTEM\n\
        \           \n\
        \            }\n\
        \       {-  PLATFORM\n\
        \           \n\
        \            }\n\
        \       {-  REGION\n\
        \           \n\
        \            }\n\
        \       {-  SERVICE\n\
        \           \n\
        \             If not specified, the [SERVICE] filter defaults to Amazon Elastic Compute \
         Cloud - Compute. Supported values for [SERVICE] are Amazon Elastic Compute Cloud - \
         Compute, Amazon Relational Database Service, Amazon ElastiCache, Amazon Redshift, and \
         Amazon Elasticsearch Service. The value for the [SERVICE] filter should not exceed \"1\".\n\
        \             \n\
        \               }\n\
        \       {-  SCOPE\n\
        \           \n\
        \            }\n\
        \       {-  TENANCY\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [GetReservationUtilization] uses the same \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object as the other operations, but only [AND] is supported among each dimension, and \
         nesting is supported up to only one level deep. If there are multiple values for a \
         dimension, they are OR'd together.\n\
        \   "]
  granularity : granularity option;
      [@ocaml.doc
        "If [GroupBy] is set, [Granularity] can't be set. If [Granularity] isn't set, the response \
         object doesn't include [Granularity], either [MONTHLY] or [DAILY]. If both [GroupBy] and \
         [Granularity] aren't set, [GetReservationUtilization] defaults to [DAILY].\n\n\
        \ The [GetReservationUtilization] operation supports only [DAILY] and [MONTHLY] \
         granularities.\n\
        \ "]
  group_by : group_definitions option;
      [@ocaml.doc "Groups only by [SUBSCRIPTION_ID]. Metadata is included.\n"]
  time_period : date_interval;
      [@ocaml.doc
        "Sets the start and end dates for retrieving Reserved Instance (RI) utilization. The start \
         date is inclusive, but the end date is exclusive. For example, if [start] is [2017-01-01] \
         and [end] is [2017-05-01], then the cost and usage data is retrieved from [2017-01-01] up \
         to and including [2017-04-30] but not including [2017-05-01]. \n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_purchase_recommendation_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The pagination token for the next set of retrievable results.\n"]
  recommendations : reservation_purchase_recommendations option;
      [@ocaml.doc "Recommendations for reservations to purchase.\n"]
  metadata : reservation_purchase_recommendation_metadata option;
      [@ocaml.doc
        "Information about this specific recommendation call, such as the time stamp for when Cost \
         Explorer generated this recommendation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_purchase_recommendation_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
  page_size : recommendations_page_size option;
      [@ocaml.doc
        "The number of recommendations that you want returned in a single response object.\n"]
  service_specification : service_specification option;
      [@ocaml.doc
        "The hardware specifications for the service instances that you want recommendations for, \
         such as standard or convertible Amazon EC2 instances.\n"]
  payment_option : payment_option option;
      [@ocaml.doc "The reservation purchase option that you want recommendations for.\n"]
  term_in_years : term_in_years option;
      [@ocaml.doc "The reservation term that you want recommendations for.\n"]
  lookback_period_in_days : lookback_period_in_days option;
      [@ocaml.doc
        "The number of previous days that you want Amazon Web Services to consider when it \
         calculates your recommendations.\n"]
  account_scope : account_scope option;
      [@ocaml.doc
        "The account scope that you want your recommendations for. Amazon Web Services calculates \
         recommendations including the management account and member accounts if the value is set \
         to [PAYER]. If the value is [LINKED], recommendations are calculated for individual \
         member accounts only.\n"]
  filter : expression option; [@ocaml.doc ""]
  service : generic_string; [@ocaml.doc "The specific service that you want recommendations for.\n"]
  account_id : generic_string option;
      [@ocaml.doc "The account ID that's associated with the recommendation. \n"]
}
[@@ocaml.doc ""]

type nonrec coverage_by_time = {
  total : coverage option; [@ocaml.doc "The total reservation coverage, in hours.\n"]
  groups : reservation_coverage_groups option;
      [@ocaml.doc "The groups of instances that the reservation covered.\n"]
  time_period : date_interval option; [@ocaml.doc "The period that this coverage was used over.\n"]
}
[@@ocaml.doc "Reservation coverage for a specified period, in hours.\n"]

type nonrec coverages_by_time = coverage_by_time list [@@ocaml.doc ""]

type nonrec get_reservation_coverage_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token for the next set of retrievable results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  total : coverage option;
      [@ocaml.doc "The total amount of instance usage that a reservation covered.\n"]
  coverages_by_time : coverages_by_time;
      [@ocaml.doc "The amount of time that your reservations covered.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reservation_coverage_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of objects that you returned for this request. If more objects are \
         available, in the response, Amazon Web Services provides a NextPageToken value that you \
         can use in a subsequent call to get the next batch of objects.\n"]
  sort_by : sort_definition option;
      [@ocaml.doc
        "The value by which you want to sort the data.\n\n\
        \ The following values are supported for [Key]:\n\
        \ \n\
        \  {ul\n\
        \        {-   [OnDemandCost] \n\
        \            \n\
        \             }\n\
        \        {-   [CoverageHoursPercentage] \n\
        \            \n\
        \             }\n\
        \        {-   [OnDemandHours] \n\
        \            \n\
        \             }\n\
        \        {-   [ReservedHours] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalRunningHours] \n\
        \            \n\
        \             }\n\
        \        {-   [CoverageNormalizedUnitsPercentage] \n\
        \            \n\
        \             }\n\
        \        {-   [OnDemandNormalizedUnits] \n\
        \            \n\
        \             }\n\
        \        {-   [ReservedNormalizedUnits] \n\
        \            \n\
        \             }\n\
        \        {-   [TotalRunningNormalizedUnits] \n\
        \            \n\
        \             }\n\
        \        {-   [Time] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Supported values for [SortOrder] are [ASCENDING] or [DESCENDING].\n\
        \   "]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  metrics : metric_names option;
      [@ocaml.doc
        "The measurement that you want your reservation coverage reported in.\n\n\
        \ Valid values are [Hour], [Unit], and [Cost]. You can use multiple values in a request.\n\
        \ "]
  filter : expression option;
      [@ocaml.doc
        "Filters utilization data by dimensions. You can filter by the following dimensions:\n\n\
        \ {ul\n\
        \       {-  AZ\n\
        \           \n\
        \            }\n\
        \       {-  CACHE_ENGINE\n\
        \           \n\
        \            }\n\
        \       {-  DATABASE_ENGINE\n\
        \           \n\
        \            }\n\
        \       {-  DEPLOYMENT_OPTION\n\
        \           \n\
        \            }\n\
        \       {-  INSTANCE_TYPE\n\
        \           \n\
        \            }\n\
        \       {-  LINKED_ACCOUNT\n\
        \           \n\
        \            }\n\
        \       {-  OPERATING_SYSTEM\n\
        \           \n\
        \            }\n\
        \       {-  PLATFORM\n\
        \           \n\
        \            }\n\
        \       {-  REGION\n\
        \           \n\
        \            }\n\
        \       {-  SERVICE\n\
        \           \n\
        \            }\n\
        \       {-  TAG\n\
        \           \n\
        \            }\n\
        \       {-  TENANCY\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [GetReservationCoverage] uses the same \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object as the other operations, but only [AND] is supported among each dimension. You can \
         nest only one level deep. If there are multiple values for a dimension, they are OR'd \
         together.\n\
        \   \n\
        \    If you don't provide a [SERVICE] filter, Cost Explorer defaults to EC2.\n\
        \    \n\
        \     Cost category is also supported.\n\
        \     "]
  granularity : granularity option;
      [@ocaml.doc
        "The granularity of the Amazon Web Services cost data for the reservation. Valid values \
         are [MONTHLY] and [DAILY].\n\n\
        \ If [GroupBy] is set, [Granularity] can't be set. If [Granularity] isn't set, the \
         response object doesn't include [Granularity], either [MONTHLY] or [DAILY].\n\
        \ \n\
        \  The [GetReservationCoverage] operation supports only [DAILY] and [MONTHLY] granularities.\n\
        \  "]
  group_by : group_definitions option;
      [@ocaml.doc
        "You can group the data by the following attributes:\n\n\
        \ {ul\n\
        \       {-  AZ\n\
        \           \n\
        \            }\n\
        \       {-  CACHE_ENGINE\n\
        \           \n\
        \            }\n\
        \       {-  DATABASE_ENGINE\n\
        \           \n\
        \            }\n\
        \       {-  DEPLOYMENT_OPTION\n\
        \           \n\
        \            }\n\
        \       {-  INSTANCE_TYPE\n\
        \           \n\
        \            }\n\
        \       {-  INVOICING_ENTITY\n\
        \           \n\
        \            }\n\
        \       {-  LINKED_ACCOUNT\n\
        \           \n\
        \            }\n\
        \       {-  OPERATING_SYSTEM\n\
        \           \n\
        \            }\n\
        \       {-  PLATFORM\n\
        \           \n\
        \            }\n\
        \       {-  REGION\n\
        \           \n\
        \            }\n\
        \       {-  TENANCY\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  time_period : date_interval;
      [@ocaml.doc
        "The start and end dates of the period that you want to retrieve data about reservation \
         coverage for. You can retrieve data for a maximum of 13 months: the last 12 months and \
         the current month. The start date is inclusive, but the end date is exclusive. For \
         example, if [start] is [2017-01-01] and [end] is [2017-05-01], then the cost and usage \
         data is retrieved from [2017-01-01] up to and including [2017-04-30] but not including \
         [2017-05-01]. \n"]
}
[@@ocaml.doc
  "You can use the following request parameters to query for how much of your instance usage a \
   reservation covered.\n"]

type nonrec dimension_values_with_attributes = {
  attributes : attributes option;
      [@ocaml.doc "The attribute that applies to a specific [Dimension].\n"]
  value : value option; [@ocaml.doc "The value of a dimension with a specific attribute.\n"]
}
[@@ocaml.doc
  "The metadata of a specific type that you can use to filter and group your results. You can use \
   [GetDimensionValues] to find specific values.\n"]

type nonrec dimension_values_with_attributes_list = dimension_values_with_attributes list
[@@ocaml.doc ""]

type nonrec get_dimension_values_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token for the next set of retrievable results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  total_size : page_size; [@ocaml.doc "The total number of search results.\n"]
  return_size : page_size;
      [@ocaml.doc "The number of results that Amazon Web Services returned at one time.\n"]
  dimension_values : dimension_values_with_attributes_list;
      [@ocaml.doc
        "The filters that you used to filter your request. Some dimensions are available only for \
         a specific context.\n\n\
        \ If you set the context to [COST_AND_USAGE], you can use the following dimensions for \
         searching:\n\
        \ \n\
        \  {ul\n\
        \        {-  AZ - The Availability Zone. An example is [us-east-1a].\n\
        \            \n\
        \             }\n\
        \        {-  DATABASE_ENGINE - The Amazon Relational Database Service database. Examples \
         are Aurora or MySQL.\n\
        \            \n\
        \             }\n\
        \        {-  INSTANCE_TYPE - The type of Amazon EC2 instance. An example is [m4.xlarge].\n\
        \            \n\
        \             }\n\
        \        {-  LEGAL_ENTITY_NAME - The name of the organization that sells you Amazon Web \
         Services services, such as Amazon Web Services.\n\
        \            \n\
        \             }\n\
        \        {-  LINKED_ACCOUNT - The description in the attribute map that includes the full \
         name of the member account. The value field contains the Amazon Web Services ID of the \
         member account.\n\
        \            \n\
        \             }\n\
        \        {-  OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.\n\
        \            \n\
        \             }\n\
        \        {-  OPERATION - The action performed. Examples include [RunInstance] and \
         [CreateBucket].\n\
        \            \n\
        \             }\n\
        \        {-  PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.\n\
        \            \n\
        \             }\n\
        \        {-  PURCHASE_TYPE - The reservation type of the purchase to which this usage is \
         related. Examples include On-Demand Instances and Standard Reserved Instances.\n\
        \            \n\
        \             }\n\
        \        {-  SERVICE - The Amazon Web Services service such as Amazon DynamoDB.\n\
        \            \n\
        \             }\n\
        \        {-  USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The \
         response for the [GetDimensionValues] operation includes a unit attribute. Examples \
         include GB and Hrs.\n\
        \            \n\
        \             }\n\
        \        {-  USAGE_TYPE_GROUP - The grouping of common usage types. An example is Amazon \
         EC2: CloudWatch \226\128\147 Alarms. The response for this operation includes a unit \
         attribute.\n\
        \            \n\
        \             }\n\
        \        {-  RECORD_TYPE - The different types of charges such as RI fees, usage costs, \
         tax refunds, and credits.\n\
        \            \n\
        \             }\n\
        \        {-  RESOURCE_ID - The unique identifier of the resource. ResourceId is an opt-in \
         feature only available for last 14 days for EC2-Compute Service. You can opt-in by \
         enabling [Hourly] and [Resource Level Data] in Cost Management Console preferences.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you set the context to [RESERVATIONS], you can use the following dimensions for \
         searching:\n\
        \   \n\
        \    {ul\n\
        \          {-  AZ - The Availability Zone. An example is [us-east-1a].\n\
        \              \n\
        \               }\n\
        \          {-  CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are \
         Windows or Linux.\n\
        \              \n\
        \               }\n\
        \          {-  DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service \
         deployments. Valid values are [SingleAZ] and [MultiAZ].\n\
        \              \n\
        \               }\n\
        \          {-  INSTANCE_TYPE - The type of Amazon EC2 instance. An example is [m4.xlarge].\n\
        \              \n\
        \               }\n\
        \          {-  LINKED_ACCOUNT - The description in the attribute map that includes the \
         full name of the member account. The value field contains the Amazon Web Services ID of \
         the member account.\n\
        \              \n\
        \               }\n\
        \          {-  PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.\n\
        \              \n\
        \               }\n\
        \          {-  REGION - The Amazon Web Services Region.\n\
        \              \n\
        \               }\n\
        \          {-  SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values \
         are regional or a single Availability Zone.\n\
        \              \n\
        \               }\n\
        \          {-  TAG (Coverage only) - The tags that are associated with a Reserved Instance \
         (RI).\n\
        \              \n\
        \               }\n\
        \          {-  TENANCY - The tenancy of a resource. Examples are shared or dedicated.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If you set the context to [SAVINGS_PLANS], you can use the following dimensions for \
         searching:\n\
        \   \n\
        \    {ul\n\
        \          {-  SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)\n\
        \              \n\
        \               }\n\
        \          {-  PAYMENT_OPTION - Payment option for the given Savings Plans (for example, \
         All Upfront)\n\
        \              \n\
        \               }\n\
        \          {-  REGION - The Amazon Web Services Region.\n\
        \              \n\
        \               }\n\
        \          {-  INSTANCE_TYPE_FAMILY - The family of instances (For example, [m5])\n\
        \              \n\
        \               }\n\
        \          {-  LINKED_ACCOUNT - The description in the attribute map that includes the \
         full name of the member account. The value field contains the Amazon Web Services ID of \
         the member account.\n\
        \              \n\
        \               }\n\
        \          {-  SAVINGS_PLAN_ARN - The unique identifier for your Savings Plan\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec context =
  | SAVINGS_PLANS [@ocaml.doc ""]
  | RESERVATIONS [@ocaml.doc ""]
  | COST_AND_USAGE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_dimension_values_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "This field is only used when SortBy is provided in the request. The maximum number of \
         objects that are returned for this request. If MaxResults isn't specified with SortBy, \
         the request returns 1000 results as the default value for this parameter.\n\n\
        \ For [GetDimensionValues], MaxResults has an upper limit of 1000.\n\
        \ "]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  sort_by : sort_definitions option;
      [@ocaml.doc
        "The value that you want to sort the data by.\n\n\
        \ The key represents cost and usage metrics. The following values are supported:\n\
        \ \n\
        \  {ul\n\
        \        {-   [BlendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [UnblendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [AmortizedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [NetAmortizedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [NetUnblendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [UsageQuantity] \n\
        \            \n\
        \             }\n\
        \        {-   [NormalizedUsageAmount] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The supported values for the [SortOrder] key are [ASCENDING] or [DESCENDING].\n\
        \   \n\
        \    When you specify a [SortBy] paramater, the context must be [COST_AND_USAGE]. Further, \
         when using [SortBy], [NextPageToken] and [SearchString] aren't supported.\n\
        \    "]
  filter : expression option; [@ocaml.doc ""]
  context : context option;
      [@ocaml.doc
        "The context for the call to [GetDimensionValues]. This can be [RESERVATIONS] or \
         [COST_AND_USAGE]. The default value is [COST_AND_USAGE]. If the context is set to \
         [RESERVATIONS], the resulting dimension values can be used in the \
         [GetReservationUtilization] operation. If the context is set to [COST_AND_USAGE], the \
         resulting dimension values can be used in the [GetCostAndUsage] operation.\n\n\
        \ If you set the context to [COST_AND_USAGE], you can use the following dimensions for \
         searching:\n\
        \ \n\
        \  {ul\n\
        \        {-  AZ - The Availability Zone. An example is [us-east-1a].\n\
        \            \n\
        \             }\n\
        \        {-  BILLING_ENTITY - The Amazon Web Services seller that your account is with. \
         Possible values are the following:\n\
        \            \n\
        \             - Amazon Web Services(Amazon Web Services): The entity that sells Amazon Web \
         Services services.\n\
        \             \n\
        \              - AISPL (Amazon Internet Services Pvt. Ltd.): The local Indian entity \
         that's an acting reseller for Amazon Web Services services in India.\n\
        \              \n\
        \               - Amazon Web Services Marketplace: The entity that supports the sale of \
         solutions that are built on Amazon Web Services by third-party software providers.\n\
        \               \n\
        \                }\n\
        \        {-  CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are Windows \
         or Linux.\n\
        \            \n\
        \             }\n\
        \        {-  DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service \
         deployments. Valid values are [SingleAZ] and [MultiAZ].\n\
        \            \n\
        \             }\n\
        \        {-  DATABASE_ENGINE - The Amazon Relational Database Service database. Examples \
         are Aurora or MySQL.\n\
        \            \n\
        \             }\n\
        \        {-  INSTANCE_TYPE - The type of Amazon EC2 instance. An example is [m4.xlarge].\n\
        \            \n\
        \             }\n\
        \        {-  INSTANCE_TYPE_FAMILY - A family of instance types optimized to fit different \
         use cases. Examples are [Compute Optimized] (for example, [C4], [C5], [C6g], and [C7g]), \
         [Memory\n\
        \            Optimization] (for example, [R4], [R5n], [R5b], and [R6g]).\n\
        \            \n\
        \             }\n\
        \        {-  INVOICING_ENTITY - The name of the entity that issues the Amazon Web Services \
         invoice.\n\
        \            \n\
        \             }\n\
        \        {-  LEGAL_ENTITY_NAME - The name of the organization that sells you Amazon Web \
         Services services, such as Amazon Web Services.\n\
        \            \n\
        \             }\n\
        \        {-  LINKED_ACCOUNT - The description in the attribute map that includes the full \
         name of the member account. The value field contains the Amazon Web Services ID of the \
         member account.\n\
        \            \n\
        \             }\n\
        \        {-  OPERATING_SYSTEM - The operating system. Examples are Windows or Linux.\n\
        \            \n\
        \             }\n\
        \        {-  OPERATION - The action performed. Examples include [RunInstance] and \
         [CreateBucket].\n\
        \            \n\
        \             }\n\
        \        {-  PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.\n\
        \            \n\
        \             }\n\
        \        {-  PURCHASE_TYPE - The reservation type of the purchase that this usage is \
         related to. Examples include On-Demand Instances and Standard Reserved Instances.\n\
        \            \n\
        \             }\n\
        \        {-  RESERVATION_ID - The unique identifier for an Amazon Web Services Reservation \
         Instance.\n\
        \            \n\
        \             }\n\
        \        {-  SAVINGS_PLAN_ARN - The unique identifier for your Savings Plans.\n\
        \            \n\
        \             }\n\
        \        {-  SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute).\n\
        \            \n\
        \             }\n\
        \        {-  SERVICE - The Amazon Web Services service such as Amazon DynamoDB.\n\
        \            \n\
        \             }\n\
        \        {-  TENANCY - The tenancy of a resource. Examples are shared or dedicated.\n\
        \            \n\
        \             }\n\
        \        {-  USAGE_TYPE - The type of usage. An example is DataTransfer-In-Bytes. The \
         response for the [GetDimensionValues] operation includes a unit attribute. Examples \
         include GB and Hrs.\n\
        \            \n\
        \             }\n\
        \        {-  USAGE_TYPE_GROUP - The grouping of common usage types. An example is Amazon \
         EC2: CloudWatch \226\128\147 Alarms. The response for this operation includes a unit \
         attribute.\n\
        \            \n\
        \             }\n\
        \        {-  REGION - The Amazon Web Services Region.\n\
        \            \n\
        \             }\n\
        \        {-  RECORD_TYPE - The different types of charges such as Reserved Instance (RI) \
         fees, usage costs, tax refunds, and credits.\n\
        \            \n\
        \             }\n\
        \        {-  RESOURCE_ID - The unique identifier of the resource. ResourceId is an opt-in \
         feature only available for last 14 days for EC2-Compute Service.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you set the context to [RESERVATIONS], you can use the following dimensions for \
         searching:\n\
        \   \n\
        \    {ul\n\
        \          {-  AZ - The Availability Zone. An example is [us-east-1a].\n\
        \              \n\
        \               }\n\
        \          {-  CACHE_ENGINE - The Amazon ElastiCache operating system. Examples are \
         Windows or Linux.\n\
        \              \n\
        \               }\n\
        \          {-  DEPLOYMENT_OPTION - The scope of Amazon Relational Database Service \
         deployments. Valid values are [SingleAZ] and [MultiAZ].\n\
        \              \n\
        \               }\n\
        \          {-  INSTANCE_TYPE - The type of Amazon EC2 instance. An example is [m4.xlarge].\n\
        \              \n\
        \               }\n\
        \          {-  LINKED_ACCOUNT - The description in the attribute map that includes the \
         full name of the member account. The value field contains the Amazon Web Services ID of \
         the member account.\n\
        \              \n\
        \               }\n\
        \          {-  PLATFORM - The Amazon EC2 operating system. Examples are Windows or Linux.\n\
        \              \n\
        \               }\n\
        \          {-  REGION - The Amazon Web Services Region.\n\
        \              \n\
        \               }\n\
        \          {-  SCOPE (Utilization only) - The scope of a Reserved Instance (RI). Values \
         are regional or a single Availability Zone.\n\
        \              \n\
        \               }\n\
        \          {-  TAG (Coverage only) - The tags that are associated with a Reserved Instance \
         (RI).\n\
        \              \n\
        \               }\n\
        \          {-  TENANCY - The tenancy of a resource. Examples are shared or dedicated.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   If you set the context to [SAVINGS_PLANS], you can use the following dimensions for \
         searching:\n\
        \   \n\
        \    {ul\n\
        \          {-  SAVINGS_PLANS_TYPE - Type of Savings Plans (EC2 Instance or Compute)\n\
        \              \n\
        \               }\n\
        \          {-  PAYMENT_OPTION - The payment option for the given Savings Plans (for \
         example, All Upfront)\n\
        \              \n\
        \               }\n\
        \          {-  REGION - The Amazon Web Services Region.\n\
        \              \n\
        \               }\n\
        \          {-  INSTANCE_TYPE_FAMILY - The family of instances (For example, [m5])\n\
        \              \n\
        \               }\n\
        \          {-  LINKED_ACCOUNT - The description in the attribute map that includes the \
         full name of the member account. The value field contains the Amazon Web Services ID of \
         the member account.\n\
        \              \n\
        \               }\n\
        \          {-  SAVINGS_PLAN_ARN - The unique identifier for your Savings Plans.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  dimension : dimension;
      [@ocaml.doc
        "The name of the dimension. Each [Dimension] is available for a different [Context]. For \
         more information, see [Context]. [LINK_ACCOUNT_NAME] and [SERVICE_CODE] can only be used \
         in \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/AAPI_CostCategoryRule.html}CostCategoryRule}. \n"]
  time_period : date_interval;
      [@ocaml.doc
        "The start date and end date for retrieving the dimension values. The start date is \
         inclusive, but the end date is exclusive. For example, if [start] is [2017-01-01] and \
         [end] is [2017-05-01], then the cost and usage data is retrieved from [2017-01-01] up to \
         and including [2017-04-30] but not including [2017-05-01].\n"]
  search_string : search_string option;
      [@ocaml.doc "The value that you want to search the filter values for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cost_forecast_response = {
  forecast_results_by_time : forecast_results_by_time option;
      [@ocaml.doc
        "The forecasts for your query, in order. For [DAILY] forecasts, this is a list of days. \
         For [MONTHLY] forecasts, this is a list of months.\n"]
  total : metric_value option;
      [@ocaml.doc "How much you are forecasted to spend over the forecast period, in [USD].\n"]
}
[@@ocaml.doc ""]

type nonrec get_cost_forecast_request = {
  prediction_interval_level : prediction_interval_level option;
      [@ocaml.doc
        "Cost Explorer always returns the mean forecast as a single point. You can request a \
         prediction interval around the mean by specifying a confidence level. The higher the \
         confidence level, the more confident Cost Explorer is about the actual value falling in \
         the prediction interval. Higher confidence levels result in wider prediction intervals.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  filter : expression option;
      [@ocaml.doc
        "The filters that you want to use to filter your forecast. The [GetCostForecast] API \
         supports filtering by the following dimensions:\n\n\
        \ {ul\n\
        \       {-   [AZ] \n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [LINKED_ACCOUNT] \n\
        \           \n\
        \            }\n\
        \       {-   [OPERATION] \n\
        \           \n\
        \            }\n\
        \       {-   [PURCHASE_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [REGION] \n\
        \           \n\
        \            }\n\
        \       {-   [SERVICE] \n\
        \           \n\
        \            }\n\
        \       {-   [USAGE_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [USAGE_TYPE_GROUP] \n\
        \           \n\
        \            }\n\
        \       {-   [RECORD_TYPE] \n\
        \           \n\
        \            }\n\
        \       {-   [OPERATING_SYSTEM] \n\
        \           \n\
        \            }\n\
        \       {-   [TENANCY] \n\
        \           \n\
        \            }\n\
        \       {-   [SCOPE] \n\
        \           \n\
        \            }\n\
        \       {-   [PLATFORM] \n\
        \           \n\
        \            }\n\
        \       {-   [SUBSCRIPTION_ID] \n\
        \           \n\
        \            }\n\
        \       {-   [LEGAL_ENTITY_NAME] \n\
        \           \n\
        \            }\n\
        \       {-   [DEPLOYMENT_OPTION] \n\
        \           \n\
        \            }\n\
        \       {-   [DATABASE_ENGINE] \n\
        \           \n\
        \            }\n\
        \       {-   [INSTANCE_TYPE_FAMILY] \n\
        \           \n\
        \            }\n\
        \       {-   [BILLING_ENTITY] \n\
        \           \n\
        \            }\n\
        \       {-   [RESERVATION_ID] \n\
        \           \n\
        \            }\n\
        \       {-   [SAVINGS_PLAN_ARN] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  granularity : granularity;
      [@ocaml.doc
        "How granular you want the forecast to be. You can get 3 months of [DAILY] forecasts or 18 \
         months of [MONTHLY] forecasts.\n\n\
        \ The [GetCostForecast] operation supports only [DAILY] and [MONTHLY] granularities.\n\
        \ "]
  metric : metric;
      [@ocaml.doc
        "Which metric Cost Explorer uses to create your forecast. For more information about \
         blended and unblended rates, see \
         {{:http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/}Why does \
         the \"blended\" annotation appear on some line items in my bill?}. \n\n\
        \ Valid values for a [GetCostForecast] call are the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  AMORTIZED_COST\n\
        \            \n\
        \             }\n\
        \        {-  BLENDED_COST\n\
        \            \n\
        \             }\n\
        \        {-  NET_AMORTIZED_COST\n\
        \            \n\
        \             }\n\
        \        {-  NET_UNBLENDED_COST\n\
        \            \n\
        \             }\n\
        \        {-  UNBLENDED_COST\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  time_period : date_interval;
      [@ocaml.doc
        "The period of time that you want the forecast to cover. The start date must be equal to \
         or no later than the current date to avoid a validation error.\n"]
}
[@@ocaml.doc ""]

type nonrec comparison_metric_value = {
  unit_ : generic_string option;
      [@ocaml.doc "The unit of measurement applicable to all numeric values in this comparison.\n"]
  difference : generic_string option;
      [@ocaml.doc
        "The calculated difference between [ComparisonTimePeriodAmount] and \
         [BaselineTimePeriodAmount].\n"]
  comparison_time_period_amount : generic_string option;
      [@ocaml.doc "The numeric value for the comparison time period measurement.\n"]
  baseline_time_period_amount : generic_string option;
      [@ocaml.doc "The numeric value for the baseline time period measurement.\n"]
}
[@@ocaml.doc
  "Contains cost or usage metric values for comparing two time periods. Each value includes \
   amounts for the baseline and comparison time periods, their difference, and the unit of \
   measurement.\n"]

type nonrec comparison_metrics = (metric_name * comparison_metric_value) list [@@ocaml.doc ""]

type nonrec cost_driver = {
  metrics : comparison_metrics option;
      [@ocaml.doc
        "A mapping of metric names to their comparison values, measuring the impact of this cost \
         driver.\n"]
  name : generic_string option; [@ocaml.doc "The specific identifier of the cost driver.\n"]
  type_ : generic_string option;
      [@ocaml.doc
        "The category or classification of the cost driver.\n\n\
        \ Values include: BUNDLED_DISCOUNT, CREDIT, OUT_OF_CYCLE_CHARGE, REFUND, \
         RECURRING_RESERVATION_FEE, RESERVATION_USAGE, RI_VOLUME_DISCOUNT, SAVINGS_PLAN_USAGE, \
         SAVINGS_PLAN_RECURRING_FEE, SUPPORT_FEE, TAX, UPFRONT_RESERVATION_FEE, USAGE_CHANGE, \
         COMMITMENT\n\
        \ "]
}
[@@ocaml.doc
  "Represents factors that contribute to cost variations between the baseline and comparison time \
   periods, including the type of driver, an identifier of the driver, and associated metrics.\n"]

type nonrec cost_drivers = cost_driver list [@@ocaml.doc ""]

type nonrec cost_comparison_driver = {
  cost_drivers : cost_drivers option;
      [@ocaml.doc
        "An array of cost drivers, each representing a cost difference between the baseline and \
         comparison time periods. Each entry also includes a metric delta (for example, usage \
         change) that contributed to the cost variance, along with the identifier and type of \
         change.\n"]
  metrics : comparison_metrics option;
      [@ocaml.doc "A mapping of metric names to their comparison values.\n"]
  cost_selector : expression option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Represents a collection of cost drivers and their associated metrics for cost comparison \
   analysis.\n"]

type nonrec cost_comparison_drivers = cost_comparison_driver list [@@ocaml.doc ""]

type nonrec get_cost_comparison_drivers_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of paginated results.\n"]
  cost_comparison_drivers : cost_comparison_drivers option;
      [@ocaml.doc
        "An array of comparison results showing factors that drive significant cost differences \
         between [BaselineTimePeriod] and [ComparisonTimePeriod].\n"]
}
[@@ocaml.doc ""]

type nonrec cost_comparison_drivers_max_results = int [@@ocaml.doc ""]

type nonrec get_cost_comparison_drivers_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of paginated results.\n"]
  max_results : cost_comparison_drivers_max_results option;
      [@ocaml.doc "The maximum number of results that are returned for the request.\n"]
  group_by : group_definitions option;
      [@ocaml.doc
        "You can group results using the attributes [DIMENSION], [TAG], and [COST_CATEGORY]. Note \
         that [SERVICE] and [USAGE_TYPE] dimensions are automatically included in the cost \
         comparison drivers analysis.\n"]
  filter : expression option; [@ocaml.doc ""]
  metric_for_comparison : metric_name;
      [@ocaml.doc
        "The cost and usage metric to compare. Valid values are [AmortizedCost], [BlendedCost], \
         [NetAmortizedCost], [NetUnblendedCost], [NormalizedUsageAmount], [UnblendedCost], and \
         [UsageQuantity].\n"]
  comparison_time_period : date_interval;
      [@ocaml.doc
        "The comparison time period for analysis. This time period's cost and usage data will be \
         compared against the baseline time period. The interval must start and end on the first \
         day of a month, with a duration of exactly one month.\n"]
  baseline_time_period : date_interval;
      [@ocaml.doc
        "The reference time period for comparison. This time period serves as the baseline against \
         which other cost and usage data will be compared. The interval must start and end on the \
         first day of a month, with a duration of exactly one month.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
}
[@@ocaml.doc ""]

type nonrec cost_category_names_list = cost_category_name list [@@ocaml.doc ""]

type nonrec get_cost_categories_response = {
  total_size : page_size; [@ocaml.doc "The total number of objects.\n"]
  return_size : page_size; [@ocaml.doc "The number of objects that are returned.\n"]
  cost_category_values : cost_category_values_list option;
      [@ocaml.doc
        "The cost category values.\n\n\
        \ If the [CostCategoryName] key isn't specified in the request, the [CostCategoryValues] \
         fields aren't returned. \n\
        \ "]
  cost_category_names : cost_category_names_list option;
      [@ocaml.doc "The names of the cost categories.\n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "If the number of objects that are still available for retrieval exceeds the quota, Amazon \
         Web Services returns a NextPageToken value in the response. To retrieve the next batch of \
         objects, provide the marker from the prior call in your next request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cost_categories_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "If the number of objects that are still available for retrieval exceeds the quota, Amazon \
         Web Services returns a NextPageToken value in the response. To retrieve the next batch of \
         objects, provide the NextPageToken from the previous call in your next request.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "This field is only used when the [SortBy] value is provided in the request.\n\n\
        \ The maximum number of objects that are returned for this request. If [MaxResults] isn't \
         specified with the [SortBy] value, the request returns 1000 results as the default value \
         for this parameter.\n\
        \ \n\
        \  For [GetCostCategories], MaxResults has an upper quota of 1000.\n\
        \  "]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  sort_by : sort_definitions option;
      [@ocaml.doc
        "The value that you sort the data by.\n\n\
        \ The key represents the cost and usage metrics. The following values are supported:\n\
        \ \n\
        \  {ul\n\
        \        {-   [BlendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [UnblendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [AmortizedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [NetAmortizedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [NetUnblendedCost] \n\
        \            \n\
        \             }\n\
        \        {-   [UsageQuantity] \n\
        \            \n\
        \             }\n\
        \        {-   [NormalizedUsageAmount] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   The supported key values for the [SortOrder] value are [ASCENDING] and [DESCENDING].\n\
        \   \n\
        \    When you use the [SortBy] value, the [NextPageToken] and [SearchString] key values \
         aren't supported.\n\
        \    "]
  filter : expression option; [@ocaml.doc ""]
  cost_category_name : cost_category_name option; [@ocaml.doc ""]
  time_period : date_interval; [@ocaml.doc ""]
  search_string : search_string option;
      [@ocaml.doc
        "The value that you want to search the filter values for.\n\n\
        \ If you don't specify a [CostCategoryName], [SearchString] is used to filter cost \
         category names that match the [SearchString] pattern. If you specify a \
         [CostCategoryName], [SearchString] is used to filter cost category values that match the \
         [SearchString] pattern.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_cost_and_usage_with_resources_response = {
  dimension_value_attributes : dimension_values_with_attributes_list option;
      [@ocaml.doc
        "The attributes that apply to a specific dimension value. For example, if the value is a \
         linked account, the attribute is that account name.\n"]
  results_by_time : results_by_time option;
      [@ocaml.doc "The time period that's covered by the results in the response.\n"]
  group_definitions : group_definitions option;
      [@ocaml.doc
        "The groups that are specified by the [Filter] or [GroupBy] parameters in the request.\n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token for the next set of retrievable results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cost_and_usage_with_resources_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  group_by : group_definitions option;
      [@ocaml.doc
        "You can group Amazon Web Services costs using up to two different groups: [DIMENSION], \
         [TAG], [COST_CATEGORY].\n"]
  metrics : metric_names option;
      [@ocaml.doc
        "Which metrics are returned in the query. For more information about blended and unblended \
         rates, see \
         {{:http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/}Why does \
         the \"blended\" annotation appear on some line items in my bill?}. \n\n\
        \ Valid values are [AmortizedCost], [BlendedCost], [NetAmortizedCost], [NetUnblendedCost], \
         [NormalizedUsageAmount], [UnblendedCost], and [UsageQuantity]. \n\
        \ \n\
        \   If you return the [UsageQuantity] metric, the service aggregates all usage numbers \
         without taking the units into account. For example, if you aggregate [usageQuantity] \
         across all of Amazon EC2, the results aren't meaningful because Amazon EC2 compute hours \
         and data transfer are measured in different units (for example, hour or GB). To get more \
         meaningful [UsageQuantity] metrics, filter by [UsageType] or [UsageTypeGroups]. \n\
        \   \n\
        \      [Metrics] is required for [GetCostAndUsageWithResources] requests.\n\
        \     "]
  filter : expression;
      [@ocaml.doc
        "Filters Amazon Web Services costs by different dimensions. For example, you can specify \
         [SERVICE] and [LINKED_ACCOUNT] and get the costs that are associated with that account's \
         usage of that service. You can nest [Expression] objects to define any combination of \
         dimension filters. For more information, see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression}. \
         \n\n\
        \ The [GetCostAndUsageWithResources] operation requires that you either group by or filter \
         by a [ResourceId]. It requires the \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         [\"SERVICE = Amazon Elastic Compute Cloud - Compute\"] in the filter.\n\
        \ \n\
        \  Valid values for [MatchOptions] for [Dimensions] are [EQUALS] and [CASE_SENSITIVE].\n\
        \  \n\
        \   Valid values for [MatchOptions] for [CostCategories] and [Tags] are [EQUALS], \
         [ABSENT], and [CASE_SENSITIVE]. Default values are [EQUALS] and [CASE_SENSITIVE].\n\
        \   "]
  granularity : granularity;
      [@ocaml.doc
        "Sets the Amazon Web Services cost granularity to [MONTHLY], [DAILY], or [HOURLY]. If \
         [Granularity] isn't set, the response object doesn't include the [Granularity], \
         [MONTHLY], [DAILY], or [HOURLY]. \n"]
  time_period : date_interval;
      [@ocaml.doc
        "Sets the start and end dates for retrieving Amazon Web Services costs. The range must be \
         within the last 14 days (the start date cannot be earlier than 14 days ago). The start \
         date is inclusive, but the end date is exclusive. For example, if [start] is [2017-01-01] \
         and [end] is [2017-05-01], then the cost and usage data is retrieved from [2017-01-01] up \
         to and including [2017-04-30] but not including [2017-05-01].\n"]
}
[@@ocaml.doc ""]

type nonrec get_cost_and_usage_response = {
  dimension_value_attributes : dimension_values_with_attributes_list option;
      [@ocaml.doc
        "The attributes that apply to a specific dimension value. For example, if the value is a \
         linked account, the attribute is that account name.\n"]
  results_by_time : results_by_time option;
      [@ocaml.doc "The time period that's covered by the results in the response.\n"]
  group_definitions : group_definitions option;
      [@ocaml.doc
        "The groups that are specified by the [Filter] or [GroupBy] parameters in the request.\n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token for the next set of retrievable results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cost_and_usage_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
  group_by : group_definitions option;
      [@ocaml.doc
        "You can group Amazon Web Services costs using up to two different groups, either \
         dimensions, tag keys, cost categories, or any two group by types.\n\n\
        \ Valid values for the [DIMENSION] type are [AZ], [INSTANCE_TYPE], [LEGAL_ENTITY_NAME], \
         [INVOICING_ENTITY], [LINKED_ACCOUNT], [OPERATION], [PLATFORM], [PURCHASE_TYPE], \
         [SERVICE], [TENANCY], [RECORD_TYPE], and [USAGE_TYPE].\n\
        \ \n\
        \  When you group by the [TAG] type and include a valid tag key, you get all tag values, \
         including empty strings.\n\
        \  "]
  metrics : metric_names;
      [@ocaml.doc
        "Which metrics are returned in the query. For more information about blended and unblended \
         rates, see \
         {{:http://aws.amazon.com/premiumsupport/knowledge-center/blended-rates-intro/}Why does \
         the \"blended\" annotation appear on some line items in my bill?}. \n\n\
        \ Valid values are [AmortizedCost], [BlendedCost], [NetAmortizedCost], [NetUnblendedCost], \
         [NormalizedUsageAmount], [UnblendedCost], and [UsageQuantity]. \n\
        \ \n\
        \   If you return the [UsageQuantity] metric, the service aggregates all usage numbers \
         without taking into account the units. For example, if you aggregate [usageQuantity] \
         across all of Amazon EC2, the results aren't meaningful because Amazon EC2 compute hours \
         and data transfer are measured in different units (for example, hours and GB). To get \
         more meaningful [UsageQuantity] metrics, filter by [UsageType] or [UsageTypeGroups]. \n\
        \   \n\
        \      [Metrics] is required for [GetCostAndUsage] requests.\n\
        \     "]
  filter : expression option;
      [@ocaml.doc
        "Filters Amazon Web Services costs by different dimensions. For example, you can specify \
         [SERVICE] and [LINKED_ACCOUNT] and get the costs that are associated with that account's \
         usage of that service. You can nest [Expression] objects to define any combination of \
         dimension filters. For more information, see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression}. \
         \n\n\
        \ Valid values for [MatchOptions] for [Dimensions] are [EQUALS] and [CASE_SENSITIVE].\n\
        \ \n\
        \  Valid values for [MatchOptions] for [CostCategories] and [Tags] are [EQUALS], [ABSENT], \
         and [CASE_SENSITIVE]. Default values are [EQUALS] and [CASE_SENSITIVE].\n\
        \  "]
  granularity : granularity;
      [@ocaml.doc
        "Sets the Amazon Web Services cost granularity to [MONTHLY] or [DAILY], or [HOURLY]. If \
         [Granularity] isn't set, the response object doesn't include the [Granularity], either \
         [MONTHLY] or [DAILY], or [HOURLY]. \n"]
  time_period : date_interval;
      [@ocaml.doc
        "Sets the start date and end date for retrieving Amazon Web Services costs. The start date \
         is inclusive, but the end date is exclusive. For example, if [start] is [2017-01-01] and \
         [end] is [2017-05-01], then the cost and usage data is retrieved from [2017-01-01] up to \
         and including [2017-04-30] but not including [2017-05-01].\n"]
}
[@@ocaml.doc ""]

type nonrec cost_and_usage_comparison = {
  metrics : comparison_metrics option;
      [@ocaml.doc "A mapping of metric names to their comparison values.\n"]
  cost_and_usage_selector : expression option; [@ocaml.doc ""]
}
[@@ocaml.doc "Represents a comparison of cost and usage metrics between two time periods.\n"]

type nonrec cost_and_usage_comparisons = cost_and_usage_comparison list [@@ocaml.doc ""]

type nonrec get_cost_and_usage_comparisons_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of paginated results.\n"]
  total_cost_and_usage : comparison_metrics option;
      [@ocaml.doc
        "A summary of the total cost and usage, comparing amounts between [BaselineTimePeriod] and \
         [ComparisonTimePeriod] and their differences. This total represents the aggregate total \
         across all paginated results, if the response spans multiple pages.\n"]
  cost_and_usage_comparisons : cost_and_usage_comparisons option;
      [@ocaml.doc
        "An array of comparison results showing cost and usage metrics between \
         [BaselineTimePeriod] and [ComparisonTimePeriod].\n"]
}
[@@ocaml.doc ""]

type nonrec cost_and_usage_comparisons_max_results = int [@@ocaml.doc ""]

type nonrec get_cost_and_usage_comparisons_request = {
  next_page_token : next_page_token option;
      [@ocaml.doc "The token to retrieve the next set of paginated results.\n"]
  max_results : cost_and_usage_comparisons_max_results option;
      [@ocaml.doc "The maximum number of results that are returned for the request.\n"]
  group_by : group_definitions option;
      [@ocaml.doc
        "You can group results using the attributes [DIMENSION], [TAG], and [COST_CATEGORY]. \n"]
  filter : expression option; [@ocaml.doc ""]
  metric_for_comparison : metric_name;
      [@ocaml.doc
        "The cost and usage metric to compare. Valid values are [AmortizedCost], [BlendedCost], \
         [NetAmortizedCost], [NetUnblendedCost], [NormalizedUsageAmount], [UnblendedCost], and \
         [UsageQuantity].\n"]
  comparison_time_period : date_interval;
      [@ocaml.doc
        "The comparison time period for analysis. This time period's cost and usage data will be \
         compared against the baseline time period. The interval must start and end on the first \
         day of a month, with a duration of exactly one month.\n"]
  baseline_time_period : date_interval;
      [@ocaml.doc
        "The reference time period for comparison. This time period serves as the baseline against \
         which other cost and usage data will be compared. The interval must start and end on the \
         first day of a month, with a duration of exactly one month.\n"]
  billing_view_arn : billing_view_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that uniquely identifies a specific billing view. The ARN \
         is used to specify which particular billing view you want to interact with or retrieve \
         information from when making API calls related to Amazon Web Services Billing and Cost \
         Management features. The BillingViewArn can be retrieved by calling the ListBillingViews \
         API.\n"]
}
[@@ocaml.doc ""]

type nonrec analysis_details = {
  savings_plans_purchase_analysis_details : savings_plans_purchase_analysis_details option;
      [@ocaml.doc "Details about the Savings Plans purchase analysis.\n"]
}
[@@ocaml.doc "Details about the analysis.\n"]

type nonrec get_commitment_purchase_analysis_response = {
  commitment_purchase_analysis_configuration : commitment_purchase_analysis_configuration;
      [@ocaml.doc "The configuration for the commitment purchase analysis.\n"]
  analysis_details : analysis_details option; [@ocaml.doc "Details about the analysis.\n"]
  error_code : error_code option; [@ocaml.doc "The error code used for the analysis.\n"]
  analysis_status : analysis_status; [@ocaml.doc "The status of the analysis.\n"]
  analysis_id : analysis_id;
      [@ocaml.doc "The analysis ID that's associated with the commitment purchase analysis.\n"]
  analysis_started_time : zoned_date_time; [@ocaml.doc "The start time of the analysis.\n"]
  analysis_completion_time : zoned_date_time option;
      [@ocaml.doc "The completion time of the analysis.\n"]
  estimated_completion_time : zoned_date_time;
      [@ocaml.doc "The estimated time for when the analysis will complete.\n"]
}
[@@ocaml.doc ""]

type nonrec get_commitment_purchase_analysis_request = {
  analysis_id : analysis_id;
      [@ocaml.doc "The analysis ID that's associated with the commitment purchase analysis.\n"]
}
[@@ocaml.doc ""]

type nonrec analysis_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested analysis can't be found.\n"]

type nonrec approximate_usage_records_per_service = (generic_string * non_negative_long) list
[@@ocaml.doc ""]

type nonrec get_approximate_usage_records_response = {
  lookback_period : date_interval option;
      [@ocaml.doc "The lookback period that's used for the estimation.\n"]
  total_records : non_negative_long option;
      [@ocaml.doc "The total number of usage records for all services in the services list.\n"]
  services : approximate_usage_records_per_service option;
      [@ocaml.doc "The service metadata for the service or services in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec approximation_dimension = RESOURCE [@ocaml.doc ""] | SERVICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_approximate_usage_records_request = {
  approximation_dimension : approximation_dimension;
      [@ocaml.doc
        "The service to evaluate for the usage records. You can choose resource-level data at \
         daily granularity, or hourly granularity with or without resource-level data.\n"]
  services : usage_services option;
      [@ocaml.doc
        "The service metadata for the service or services you want to query. If not specified, all \
         elements are returned.\n"]
  granularity : granularity;
      [@ocaml.doc
        "How granular you want the data to be. You can enable data at hourly or daily granularity.\n"]
}
[@@ocaml.doc ""]

type nonrec anomaly_subscription = {
  threshold_expression : expression option;
      [@ocaml.doc
        "An \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object used to specify the anomalies that you want to generate alerts for. This supports \
         dimensions and nested expressions. The supported dimensions are \
         [ANOMALY_TOTAL_IMPACT_ABSOLUTE] and [ANOMALY_TOTAL_IMPACT_PERCENTAGE], corresponding to \
         an anomaly\226\128\153s TotalImpact and TotalImpactPercentage, respectively (see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Impact.html}Impact} \
         for more details). The supported nested expression types are [AND] and [OR]. The match \
         option [GREATER_THAN_OR_EQUAL] is required. Values must be numbers between 0 and \
         10,000,000,000 in string format.\n\n\
        \ One of Threshold or ThresholdExpression is required for this resource. You cannot \
         specify both.\n\
        \ \n\
        \  The following are examples of valid ThresholdExpressions:\n\
        \  \n\
        \   {ul\n\
        \         {-  Absolute threshold: [{ \"Dimensions\": { \"Key\":\n\
        \                        \"ANOMALY_TOTAL_IMPACT_ABSOLUTE\", \"MatchOptions\": \\[ \
         \"GREATER_THAN_OR_EQUAL\"\n\
        \                        \\], \"Values\": \\[ \"100\" \\] } }] \n\
        \             \n\
        \              }\n\
        \         {-  Percentage threshold: [{ \"Dimensions\": { \"Key\":\n\
        \                        \"ANOMALY_TOTAL_IMPACT_PERCENTAGE\", \"MatchOptions\": \\[ \
         \"GREATER_THAN_OR_EQUAL\"\n\
        \                        \\], \"Values\": \\[ \"100\" \\] } }] \n\
        \             \n\
        \              }\n\
        \         {-   [AND] two thresholds together: [{ \"And\": \\[ { \"Dimensions\": {\n\
        \                        \"Key\": \"ANOMALY_TOTAL_IMPACT_ABSOLUTE\", \"MatchOptions\": \\[\n\
        \                        \"GREATER_THAN_OR_EQUAL\" \\], \"Values\": \\[ \"100\" \\] } }, { \
         \"Dimensions\": { \"Key\":\n\
        \                        \"ANOMALY_TOTAL_IMPACT_PERCENTAGE\", \"MatchOptions\": \\[ \
         \"GREATER_THAN_OR_EQUAL\"\n\
        \                        \\], \"Values\": \\[ \"100\" \\] } } \\] }] \n\
        \             \n\
        \              }\n\
        \         {-   [OR] two thresholds together: [{ \"Or\": \\[ { \"Dimensions\": {\n\
        \                        \"Key\": \"ANOMALY_TOTAL_IMPACT_ABSOLUTE\", \"MatchOptions\": \\[\n\
        \                        \"GREATER_THAN_OR_EQUAL\" \\], \"Values\": \\[ \"100\" \\] } }, { \
         \"Dimensions\": { \"Key\":\n\
        \                        \"ANOMALY_TOTAL_IMPACT_PERCENTAGE\", \"MatchOptions\": \\[ \
         \"GREATER_THAN_OR_EQUAL\"\n\
        \                        \\], \"Values\": \\[ \"100\" \\] } } \\] }] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  subscription_name : generic_string; [@ocaml.doc "The name for the subscription. \n"]
  frequency : anomaly_subscription_frequency;
      [@ocaml.doc
        "The frequency that anomaly notifications are sent. Notifications are sent either over \
         email (for DAILY and WEEKLY frequencies) or SNS (for IMMEDIATE frequency). For more \
         information, see \
         {{:https://docs.aws.amazon.com/cost-management/latest/userguide/ad-SNS.html}Creating an \
         Amazon SNS topic for anomaly notifications}.\n"]
  threshold : nullable_non_negative_double option;
      [@ocaml.doc
        "(deprecated)\n\n\
        \ An absolute dollar value that must be exceeded by the anomaly's total impact (see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Impact.html}Impact} \
         for more details) for an anomaly notification to be generated.\n\
        \ \n\
        \  This field has been deprecated. To specify a threshold, use ThresholdExpression. \
         Continued use of Threshold will be treated as shorthand syntax for a ThresholdExpression.\n\
        \  \n\
        \   One of Threshold or ThresholdExpression is required for this resource. You cannot \
         specify both.\n\
        \   "]
  subscribers : subscribers; [@ocaml.doc "A list of subscribers to notify. \n"]
  monitor_arn_list : monitor_arn_list; [@ocaml.doc "A list of cost anomaly monitors. \n"]
  account_id : generic_string option; [@ocaml.doc "Your unique account identifier. \n"]
  subscription_arn : generic_string option;
      [@ocaml.doc "The [AnomalySubscription] Amazon Resource Name (ARN). \n"]
}
[@@ocaml.doc
  "An [AnomalySubscription] resource (also referred to as an alert subscription) sends \
   notifications about specific anomalies that meet an alerting criteria defined by you.\n\n\
  \ You can specify the frequency of the alerts and the subscribers to notify.\n\
  \ \n\
  \  Anomaly subscriptions can be associated with one or more \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalyMonitor.html} \
   [AnomalyMonitor] } resources, and they only send notifications about anomalies detected by \
   those associated monitors. You can also configure a threshold to further control which \
   anomalies are included in the notifications.\n\
  \  \n\
  \   Anomalies that don\226\128\153t exceed the chosen threshold and therefore don\226\128\153t \
   trigger notifications from an anomaly subscription will still be available on the console and \
   from the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_GetAnomalies.html} \
   [GetAnomalies] } API.\n\
  \   "]

type nonrec anomaly_subscriptions = anomaly_subscription list [@@ocaml.doc ""]

type nonrec get_anomaly_subscriptions_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  anomaly_subscriptions : anomaly_subscriptions;
      [@ocaml.doc
        "A list of cost anomaly subscriptions that includes the detailed metadata for each one. \n"]
}
[@@ocaml.doc ""]

type nonrec get_anomaly_subscriptions_request = {
  max_results : page_size option;
      [@ocaml.doc "The number of entries a paginated response contains. \n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  monitor_arn : generic_string option; [@ocaml.doc "Cost anomaly monitor ARNs. \n"]
  subscription_arn_list : values option; [@ocaml.doc "A list of cost anomaly subscription ARNs. \n"]
}
[@@ocaml.doc ""]

type nonrec anomaly_monitor = {
  dimensional_value_count : non_negative_integer option;
      [@ocaml.doc "The value for evaluated dimensions. \n"]
  monitor_specification : expression option;
      [@ocaml.doc
        "An \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_Expression.html}Expression} \
         object used to control what costs the monitor analyzes for anomalies.\n\n\
        \ For Amazon Web Services managed monitors:\n\
        \ \n\
        \  {ul\n\
        \        {-  If MonitorDimension is [SERVICE] or [LINKED_ACCOUNT], do not specify this field\n\
        \            \n\
        \             }\n\
        \        {-  If MonitorDimension is [TAG], set this field to [{ \"Tags\": {\n\
        \                        \"Key\": \"your tag key\" } }] \n\
        \            \n\
        \             }\n\
        \        {-  If MonitorDimension is [COST_CATEGORY], set this field to [{\n\
        \                        \"CostCategories\": { \"Key\": \"your cost category key\" } }] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For customer managed monitors:\n\
        \   \n\
        \    {ul\n\
        \          {-  To track linked accounts, set this field to [{ \"Dimensions\": { \"Key\":\n\
        \                        \"LINKED_ACCOUNT\", \"Values\": \\[ \"your list of up to 10 \
         account IDs\" \\] } }\n\
        \                        ] \n\
        \              \n\
        \               }\n\
        \          {-  To track cost allocation tags, set this field to [{ \"Tags\": { \"Key\":\n\
        \                        \"your tag key\", \"Values\": \\[ \"your list of up to 10 tag \
         values\" \\] } }\n\
        \                        ] \n\
        \              \n\
        \               }\n\
        \          {-  To track cost categories, set this field to[{ \"CostCategories\": { \"Key\":\n\
        \                        \"your cost category key\", \"Values\": \\[ \"your cost category \
         value\" \\] } }\n\
        \                        ] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  monitor_dimension : monitor_dimension option;
      [@ocaml.doc
        "For customer managed monitors, do not specify this field.\n\n\
        \ For Amazon Web Services managed monitors, this field controls which cost dimension is \
         automatically analyzed by the monitor. For [TAG] and [COST_CATEGORY\n\
        \            ] dimensions, you must also specify MonitorSpecification to configure the \
         specific tag or cost category key to analyze.\n\
        \ "]
  monitor_type : monitor_type;
      [@ocaml.doc
        "The type of the monitor. \n\n\
        \ Set this to [DIMENSIONAL] for an Amazon Web Services managed monitor. Amazon Web \
         Services managed monitors automatically track up to the top 5,000 values by cost within a \
         dimension of your choosing. Each dimension value is evaluated independently. If you start \
         incurring cost in a new value of your chosen dimension, it will automatically be analyzed \
         by an Amazon Web Services managed monitor.\n\
        \ \n\
        \  Set this to [CUSTOM] for a customer managed monitor. Customer managed monitors let you \
         select specific dimension values that get monitored in aggregate. \n\
        \  \n\
        \   For more information about monitor types, see \
         {{:https://docs.aws.amazon.com/cost-management/latest/userguide/getting-started-ad.html#monitor-type-def}Monitor \
         types} in the {i Billing and Cost Management User Guide}.\n\
        \   "]
  last_evaluated_date : year_month_day option;
      [@ocaml.doc "The date when the monitor last evaluated for anomalies. \n"]
  last_updated_date : year_month_day option;
      [@ocaml.doc "The date when the monitor was last updated. \n"]
  creation_date : year_month_day option; [@ocaml.doc "The date when the monitor was created. \n"]
  monitor_name : generic_string; [@ocaml.doc "The name of the monitor. \n"]
  monitor_arn : generic_string option; [@ocaml.doc "The Amazon Resource Name (ARN) value. \n"]
}
[@@ocaml.doc
  "This object continuously inspects your account's cost data for anomalies. It's based on \
   [MonitorType] and [MonitorSpecification]. The content consists of detailed metadata and the \
   current status of the monitor object. \n"]

type nonrec anomaly_monitors = anomaly_monitor list [@@ocaml.doc ""]

type nonrec get_anomaly_monitors_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  anomaly_monitors : anomaly_monitors;
      [@ocaml.doc
        "A list of cost anomaly monitors that includes the detailed metadata for each monitor. \n"]
}
[@@ocaml.doc ""]

type nonrec get_anomaly_monitors_request = {
  max_results : page_size option;
      [@ocaml.doc "The number of entries that a paginated response contains. \n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  monitor_arn_list : values option; [@ocaml.doc "A list of cost anomaly monitor ARNs. \n"]
}
[@@ocaml.doc ""]

type nonrec anomaly_score = {
  current_score : generic_double; [@ocaml.doc "The last observed score. \n"]
  max_score : generic_double;
      [@ocaml.doc "The maximum score that's observed during the [AnomalyDateInterval]. \n"]
}
[@@ocaml.doc "Quantifies the anomaly. The higher score means that it's more anomalous. \n"]

type nonrec anomaly = {
  feedback : anomaly_feedback_type option; [@ocaml.doc "The feedback value. \n"]
  monitor_arn : generic_string;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the cost monitor that generated this anomaly. \n"]
  impact : impact; [@ocaml.doc "The dollar impact for the anomaly. \n"]
  anomaly_score : anomaly_score; [@ocaml.doc "The latest and maximum score for the anomaly. \n"]
  root_causes : root_causes option;
      [@ocaml.doc "The list of identified root causes for the anomaly. \n"]
  dimension_value : generic_string option;
      [@ocaml.doc
        "The dimension for the anomaly (for example, an Amazon Web Services service in a service \
         monitor). \n"]
  anomaly_end_date : year_month_day option; [@ocaml.doc "The last day the anomaly is detected. \n"]
  anomaly_start_date : year_month_day option;
      [@ocaml.doc "The first day the anomaly is detected. \n"]
  anomaly_id : generic_string; [@ocaml.doc "The unique identifier for the anomaly. \n"]
}
[@@ocaml.doc
  "An unusual cost pattern. This consists of the detailed metadata and the current status of the \
   anomaly object. \n"]

type nonrec anomalies = anomaly list [@@ocaml.doc ""]

type nonrec get_anomalies_response = {
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  anomalies : anomalies; [@ocaml.doc "A list of cost anomalies. \n"]
}
[@@ocaml.doc ""]

type nonrec anomaly_date_interval = {
  end_date : year_month_day option; [@ocaml.doc "The last date an anomaly was observed. \n"]
  start_date : year_month_day; [@ocaml.doc "The first date an anomaly was observed. \n"]
}
[@@ocaml.doc "The time period for an anomaly. \n"]

type nonrec get_anomalies_request = {
  max_results : page_size option;
      [@ocaml.doc "The number of entries a paginated response contains. \n"]
  next_page_token : next_page_token option;
      [@ocaml.doc
        "The token to retrieve the next set of results. Amazon Web Services provides the token \
         when the response from a previous call has more results than the maximum page size. \n"]
  total_impact : total_impact_filter option;
      [@ocaml.doc
        "Filters anomaly results by the total impact field on the anomaly object. For example, you \
         can filter anomalies [GREATER_THAN 200.00] to retrieve anomalies, with an estimated \
         dollar impact greater than 200. \n"]
  feedback : anomaly_feedback_type option;
      [@ocaml.doc "Filters anomaly results by the feedback field on the anomaly object. \n"]
  date_interval : anomaly_date_interval;
      [@ocaml.doc
        "Assigns the start and end dates for retrieving cost anomalies. The returned anomaly \
         object will have an [AnomalyEndDate] in the specified time range. \n"]
  monitor_arn : generic_string option;
      [@ocaml.doc
        "Retrieves all of the cost anomalies detected for a specific cost anomaly monitor Amazon \
         Resource Name (ARN). \n"]
}
[@@ocaml.doc ""]

type nonrec cost_category = {
  default_value : cost_category_value option; [@ocaml.doc ""]
  processing_status : cost_category_processing_status_list option;
      [@ocaml.doc
        "The list of processing statuses for Cost Management products for a specific cost category. \n"]
  split_charge_rules : cost_category_split_charge_rules_list option;
      [@ocaml.doc
        " The split charge rules that are used to allocate your charges between your cost category \
         values. \n"]
  rules : cost_category_rules_list;
      [@ocaml.doc
        "The rules are processed in order. If there are multiple rules that match the line item, \
         then the first rule to match is used to determine that cost category value. \n"]
  rule_version : cost_category_rule_version; [@ocaml.doc ""]
  name : cost_category_name; [@ocaml.doc ""]
  effective_end : zoned_date_time option;
      [@ocaml.doc "The effective end date of your cost category.\n"]
  effective_start : zoned_date_time;
      [@ocaml.doc "The effective start date of your cost category.\n"]
  cost_category_arn : arn; [@ocaml.doc "The unique identifier for your cost category. \n"]
}
[@@ocaml.doc
  "The structure of Cost Categories. This includes detailed metadata and the set of rules for the \
   [CostCategory] object.\n"]

type nonrec describe_cost_category_definition_response = {
  cost_category : cost_category option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_cost_category_definition_request = {
  effective_on : zoned_date_time option;
      [@ocaml.doc "The date when the cost category was effective. \n"]
  cost_category_arn : arn; [@ocaml.doc "The unique identifier for your cost category. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_cost_category_definition_response = {
  effective_end : zoned_date_time option;
      [@ocaml.doc
        "The effective end date of the cost category as a result of deleting it. No costs after \
         this date is categorized by the deleted cost category. \n"]
  cost_category_arn : arn option; [@ocaml.doc "The unique identifier for your cost category. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_cost_category_definition_request = {
  cost_category_arn : arn; [@ocaml.doc "The unique identifier for your cost category. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_anomaly_subscription_response = unit [@@ocaml.doc ""]

type nonrec delete_anomaly_subscription_request = {
  subscription_arn : generic_string;
      [@ocaml.doc
        "The unique identifier of the cost anomaly subscription that you want to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_anomaly_monitor_response = unit [@@ocaml.doc ""]

type nonrec delete_anomaly_monitor_request = {
  monitor_arn : generic_string;
      [@ocaml.doc "The unique identifier of the cost anomaly monitor that you want to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec create_cost_category_definition_response = {
  effective_start : zoned_date_time option;
      [@ocaml.doc
        "The cost category's effective start date. It can only be a billing start date (first day \
         of the month).\n"]
  cost_category_arn : arn option;
      [@ocaml.doc "The unique identifier for your newly created cost category. \n"]
}
[@@ocaml.doc ""]

type nonrec create_cost_category_definition_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "An optional list of tags to associate with the specified \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategory.html} \
         [CostCategory] }. You can use resource tags to control access to your [cost category] \
         using IAM policies.\n\n\
        \ Each tag consists of a key and a value, and each key must be unique for the resource. \
         The following restrictions apply to resource tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Although the maximum number of array members is 200, you can assign a maximum \
         of 50 user-tags to one resource. The remaining are reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a key is 128 characters\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a value is 256 characters\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values can only contain alphanumeric characters, spaces, and any of \
         the following: [_.:/=+@-] \n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are case sensitive\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are trimmed for any leading or trailing whitespaces\n\
        \            \n\
        \             }\n\
        \        {-  Don\226\128\153t use [aws:] as a prefix for your keys. This prefix is \
         reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  split_charge_rules : cost_category_split_charge_rules_list option;
      [@ocaml.doc
        " The split charge rules used to allocate your charges between your cost category values. \n"]
  default_value : cost_category_value option; [@ocaml.doc ""]
  rules : cost_category_rules_list;
      [@ocaml.doc
        "The cost category rules used to categorize costs. For more information, see \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_CostCategoryRule.html}CostCategoryRule}.\n"]
  rule_version : cost_category_rule_version; [@ocaml.doc ""]
  effective_start : zoned_date_time option;
      [@ocaml.doc
        "The cost category's effective start date. It can only be a billing start date (first day \
         of the month). If the date isn't provided, it's the first day of the current month. Dates \
         can't be before the previous twelve months, or in the future.\n"]
  name : cost_category_name; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_anomaly_subscription_response = {
  subscription_arn : generic_string;
      [@ocaml.doc "The unique identifier of your newly created cost anomaly subscription. \n"]
}
[@@ocaml.doc ""]

type nonrec create_anomaly_subscription_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "An optional list of tags to associate with the specified \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalySubscription.html} \
         [AnomalySubscription] }. You can use resource tags to control access to your \
         [subscription] using IAM policies.\n\n\
        \ Each tag consists of a key and a value, and each key must be unique for the resource. \
         The following restrictions apply to resource tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Although the maximum number of array members is 200, you can assign a maximum \
         of 50 user-tags to one resource. The remaining are reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a key is 128 characters\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a value is 256 characters\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values can only contain alphanumeric characters, spaces, and any of \
         the following: [_.:/=+@-] \n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are case sensitive\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are trimmed for any leading or trailing whitespaces\n\
        \            \n\
        \             }\n\
        \        {-  Don\226\128\153t use [aws:] as a prefix for your keys. This prefix is \
         reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  anomaly_subscription : anomaly_subscription;
      [@ocaml.doc "The cost anomaly subscription object that you want to create. \n"]
}
[@@ocaml.doc ""]

type nonrec create_anomaly_monitor_response = {
  monitor_arn : generic_string;
      [@ocaml.doc "The unique identifier of your newly created cost anomaly detection monitor.\n"]
}
[@@ocaml.doc ""]

type nonrec create_anomaly_monitor_request = {
  resource_tags : resource_tag_list option;
      [@ocaml.doc
        "An optional list of tags to associate with the specified \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AnomalyMonitor.html} \
         [AnomalyMonitor] }. You can use resource tags to control access to your [monitor] using \
         IAM policies.\n\n\
        \ Each tag consists of a key and a value, and each key must be unique for the resource. \
         The following restrictions apply to resource tags:\n\
        \ \n\
        \  {ul\n\
        \        {-  Although the maximum number of array members is 200, you can assign a maximum \
         of 50 user-tags to one resource. The remaining are reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a key is 128 characters\n\
        \            \n\
        \             }\n\
        \        {-  The maximum length of a value is 256 characters\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values can only contain alphanumeric characters, spaces, and any of \
         the following: [_.:/=+@-] \n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are case sensitive\n\
        \            \n\
        \             }\n\
        \        {-  Keys and values are trimmed for any leading or trailing whitespaces\n\
        \            \n\
        \             }\n\
        \        {-  Don\226\128\153t use [aws:] as a prefix for your keys. This prefix is \
         reserved for Amazon Web Services use\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  anomaly_monitor : anomaly_monitor;
      [@ocaml.doc "The cost anomaly detection monitor object that you want to create.\n"]
}
[@@ocaml.doc ""]
