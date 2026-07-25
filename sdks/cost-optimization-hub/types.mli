type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "You are not authorized to use this operation with the given parameters.\n"]

type nonrec enrollment_status = ACTIVE [@ocaml.doc ""] | INACTIVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec account_enrollment_status = {
  account_id : account_id option; [@ocaml.doc "The Amazon Web Services account ID.\n"]
  status : enrollment_status option; [@ocaml.doc "The account enrollment status.\n"]
  last_updated_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the account enrollment status was last updated.\n"]
  created_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when the account enrollment status was created.\n"]
}
[@@ocaml.doc
  "Describes the enrollment status of an organization's member accounts in Cost Optimization Hub.\n"]

type nonrec account_enrollment_statuses = account_enrollment_status list [@@ocaml.doc ""]

type nonrec account_id_list = account_id list [@@ocaml.doc ""]

type nonrec action_type =
  | RIGHTSIZE [@ocaml.doc ""]
  | STOP [@ocaml.doc ""]
  | UPGRADE [@ocaml.doc ""]
  | PURCHASE_SAVINGS_PLANS [@ocaml.doc ""]
  | PURCHASE_RESERVED_INSTANCES [@ocaml.doc ""]
  | MIGRATE_TO_GRAVITON [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | SCALE_IN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec action_type_list = action_type list [@@ocaml.doc ""]

type nonrec allocation_strategy = PRIORITIZED [@ocaml.doc ""] | LOWEST_PRICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec estimated_discounts = {
  savings_plans_discount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "Estimated Savings Plans discounts.\n"]
  reserved_instances_discount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "Estimated reserved instance discounts.\n"]
  other_discount : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "Estimated other discounts include all discounts that are not itemized. Itemized discounts \
         include [reservedInstanceDiscount] and [savingsPlansDiscount].\n"]
}
[@@ocaml.doc
  "Estimated discount details of the current and recommended resource configuration for a \
   recommendation.\n"]

type nonrec resource_pricing = {
  estimated_cost_before_discounts : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The savings estimate using Amazon Web Services public pricing without incorporating any \
         discounts.\n"]
  estimated_net_unused_amortized_commitments : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The estimated net unused amortized commitment for the recommendation.\n"]
  estimated_discounts : estimated_discounts option;
      [@ocaml.doc "The estimated discounts for a recommendation.\n"]
  estimated_cost_after_discounts : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The savings estimate incorporating all discounts with Amazon Web Services, such as \
         Reserved Instances and Savings Plans.\n"]
}
[@@ocaml.doc "Contains pricing information about the specified resource.\n"]

type nonrec usage = {
  usage_type : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The usage type.\n"]
  usage_amount : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc "The usage amount.\n"]
  operation : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The operation value.\n"]
  product_code : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The product code.\n"]
  unit_ : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The usage unit.\n"]
}
[@@ocaml.doc "Details about the usage.\n"]

type nonrec usage_list = usage list [@@ocaml.doc ""]

type nonrec resource_cost_calculation = {
  usages : usage_list option; [@ocaml.doc "Usage details of the resource recommendation.\n"]
  pricing : resource_pricing option; [@ocaml.doc "Pricing details of the resource recommendation.\n"]
}
[@@ocaml.doc "Cost impact of the resource recommendation.\n"]

type nonrec aurora_db_cluster_storage_configuration = {
  storage_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The storage type to associate with the Aurora DB cluster.\n"]
}
[@@ocaml.doc "The Aurora DB cluster storage configuration used for recommendations.\n"]

type nonrec aurora_db_cluster_storage = {
  configuration : aurora_db_cluster_storage_configuration option;
      [@ocaml.doc "The Aurora DB cluster storage configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "Contains the details of an Aurora DB cluster storage.\n"]

type nonrec block_storage_performance_configuration = {
  iops : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The number of I/O operations per second.\n"]
  throughput : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The throughput that the volume supports.\n"]
}
[@@ocaml.doc
  "Describes the Amazon Elastic Block Store performance configuration of the current and \
   recommended resource configuration for a recommendation.\n"]

type nonrec compute_configuration = {
  v_cpu : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The number of vCPU cores in the resource.\n"]
  memory_size_in_m_b : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The memory size of the resource.\n"]
  architecture : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The architecture of the resource.\n"]
  platform : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The platform of the resource. The platform is the specific combination of operating \
         system, license model, and software on an instance.\n"]
}
[@@ocaml.doc
  "Describes the performance configuration for compute services such as Amazon EC2, Lambda, and ECS.\n"]

type nonrec savings_plans_pricing = {
  monthly_savings_plans_eligible_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The cost of paying for the recommended Savings Plans monthly.\n"]
  estimated_monthly_commitment : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "Estimated monthly commitment for the Savings Plans.\n"]
  savings_percentage : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "Estimated savings as a percentage of your overall costs after buying the Savings Plans.\n"]
  estimated_on_demand_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "Estimated On-Demand cost you will pay after buying the Savings Plans.\n"]
}
[@@ocaml.doc "Pricing information about a Savings Plans.\n"]

type nonrec savings_plans_cost_calculation = {
  pricing : savings_plans_pricing option;
      [@ocaml.doc "Pricing details of the purchase recommendation.\n"]
}
[@@ocaml.doc "Cost impact of the purchase recommendation.\n"]

type nonrec compute_savings_plans_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The account scope for which you want recommendations. Amazon Web Services calculates \
         recommendations including the management account and member accounts if the value is set \
         to [PAYER]. If the value is [LINKED], recommendations are calculated for individual \
         member accounts only.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Savings Plans recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  hourly_commitment : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The hourly commitment for the Savings Plans type.\n"]
}
[@@ocaml.doc "The Compute Savings Plans configuration used for recommendations.\n"]

type nonrec compute_savings_plans = {
  configuration : compute_savings_plans_configuration option;
      [@ocaml.doc "Configuration details of the Compute Savings Plans to purchase.\n"]
  cost_calculation : savings_plans_cost_calculation option;
      [@ocaml.doc "Cost impact of the Savings Plans purchase recommendation.\n"]
}
[@@ocaml.doc "The Compute Savings Plans recommendation details.\n"]

type nonrec validation_exception_detail = {
  field_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The field name where the invalid entry was detected.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A message with the reason for the validation exception error.\n"]
}
[@@ocaml.doc
  "The input failed to meet the constraints specified by the Amazon Web Services service in a \
   specified field.\n"]

type nonrec validation_exception_details = validation_exception_detail list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  reason : validation_exception_reason option;
      [@ocaml.doc "The reason for the validation exception.\n"]
  fields : validation_exception_details option; [@ocaml.doc "The list of fields that are invalid.\n"]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "An error on the server occurred during the processing of your request. Try again later.\n"]

type nonrec payment_option =
  | ALL_UPFRONT [@ocaml.doc ""]
  | PARTIAL_UPFRONT [@ocaml.doc ""]
  | NO_UPFRONT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec term = ONE_YEAR [@ocaml.doc ""] | THREE_YEARS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec preferred_commitment = {
  term : term option;
      [@ocaml.doc
        "The preferred length of the commitment period. If the value is null, it will default to \
         [ThreeYears] (highest savings) where applicable.\n"]
  payment_option : payment_option option;
      [@ocaml.doc
        "The preferred upfront payment structure for commitments. If the value is null, it will \
         default to [AllUpfront] (highest savings) where applicable.\n"]
}
[@@ocaml.doc
  "The preferred configuration for Reserved Instances and Savings Plans commitment-based \
   discounts, consisting of a payment option and a commitment duration.\n"]

type nonrec member_account_discount_visibility = ALL [@ocaml.doc ""] | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec savings_estimation_mode =
  | BEFORE_DISCOUNTS [@ocaml.doc ""]
  | AFTER_DISCOUNTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_preferences_response = {
  savings_estimation_mode : savings_estimation_mode option;
      [@ocaml.doc "Shows the status of the \"savings estimation mode\" preference.\n"]
  member_account_discount_visibility : member_account_discount_visibility option;
      [@ocaml.doc "Shows the status of the \"member account discount visibility\" preference.\n"]
  preferred_commitment : preferred_commitment option;
      [@ocaml.doc
        "Shows the updated preferences for how Reserved Instances and Savings Plans cost-saving \
         opportunities are prioritized in terms of payment option and term length.\n"]
}
[@@ocaml.doc ""]

type nonrec update_preferences_request = {
  savings_estimation_mode : savings_estimation_mode option;
      [@ocaml.doc "Sets the \"savings estimation mode\" preference.\n"]
  member_account_discount_visibility : member_account_discount_visibility option;
      [@ocaml.doc "Sets the \"member account discount visibility\" preference.\n"]
  preferred_commitment : preferred_commitment option;
      [@ocaml.doc
        "Sets the preferences for how Reserved Instances and Savings Plans cost-saving \
         opportunities are prioritized in terms of payment option and term length.\n"]
}
[@@ocaml.doc ""]

type nonrec update_enrollment_status_response = {
  status : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The enrollment status of the account.\n"]
}
[@@ocaml.doc ""]

type nonrec update_enrollment_status_request = {
  status : enrollment_status; [@ocaml.doc "Sets the account status.\n"]
  include_member_accounts : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Indicates whether to enroll member accounts of the organization if the account is the \
         management account or delegated administrator.\n"]
}
[@@ocaml.doc ""]

type nonrec summary_metrics_result = {
  savings_percentage : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The savings percentage based on your Amazon Web Services spend over the past 30 days.\n\n\
        \  Savings percentage is only supported when filtering by Region, account ID, or tags.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The results or descriptions for the additional metrics, based on whether the metrics were or \
   were not requested.\n"]

type nonrec recommendation_summary = {
  group : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The grouping of recommendations.\n"]
  estimated_monthly_savings : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The estimated total savings resulting from modifications, on a monthly basis.\n"]
  recommendation_count : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The total number of instance recommendations.\n"]
}
[@@ocaml.doc
  "The summary of rightsizing recommendations, including de-duped savings from all types of \
   recommendations.\n"]

type nonrec recommendation_summaries_list = recommendation_summary list [@@ocaml.doc ""]

type nonrec list_recommendation_summaries_response = {
  estimated_total_deduped_savings : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total overall savings for the aggregated view.\n"]
  items : recommendation_summaries_list option;
      [@ocaml.doc "A list of all savings recommendations.\n"]
  group_by : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The dimension used to group the recommendations by.\n"]
  currency_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The currency code used for the recommendation.\n"]
  metrics : summary_metrics_result option;
      [@ocaml.doc
        "The results or descriptions for the additional metrics, based on whether the metrics were \
         or were not requested.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec summary_metrics = SAVINGS_PERCENTAGE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec summary_metrics_list = summary_metrics list [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec recommendation_id_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec resource_arn_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec resource_id_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec tag = {
  key : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The key that's associated with the tag.\n"]
  value : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The value that's associated with the tag.\n"]
}
[@@ocaml.doc "The tag structure that contains a tag key and value.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec resource_type =
  | EC2_INSTANCE [@ocaml.doc ""]
  | LAMBDA_FUNCTION [@ocaml.doc ""]
  | EBS_VOLUME [@ocaml.doc ""]
  | ECS_SERVICE [@ocaml.doc ""]
  | EC2_AUTO_SCALING_GROUP [@ocaml.doc ""]
  | EC2_INSTANCE_SAVINGS_PLANS [@ocaml.doc ""]
  | COMPUTE_SAVINGS_PLANS [@ocaml.doc ""]
  | SAGE_MAKER_SAVINGS_PLANS [@ocaml.doc ""]
  | EC2_RESERVED_INSTANCES [@ocaml.doc ""]
  | RDS_RESERVED_INSTANCES [@ocaml.doc ""]
  | OPEN_SEARCH_RESERVED_INSTANCES [@ocaml.doc ""]
  | REDSHIFT_RESERVED_INSTANCES [@ocaml.doc ""]
  | ELASTI_CACHE_RESERVED_INSTANCES [@ocaml.doc ""]
  | RDS_DB_INSTANCE_STORAGE [@ocaml.doc ""]
  | RDS_DB_INSTANCE [@ocaml.doc ""]
  | AURORA_DB_CLUSTER_STORAGE [@ocaml.doc ""]
  | DYNAMO_DB_RESERVED_CAPACITY [@ocaml.doc ""]
  | MEMORY_DB_RESERVED_INSTANCES [@ocaml.doc ""]
  | NAT_GATEWAY [@ocaml.doc ""]
  | DYNAMO_DB_TABLE [@ocaml.doc ""]
  | ELASTI_CACHE_CLUSTER [@ocaml.doc ""]
  | MEMORY_DB_CLUSTER [@ocaml.doc ""]
  | DOCUMENT_DB_CLUSTER [@ocaml.doc ""]
  | WORK_SPACES [@ocaml.doc ""]
  | SAGE_MAKER_ENDPOINT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_type_list = resource_type list [@@ocaml.doc ""]

type nonrec region_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec implementation_effort =
  | VERY_LOW [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | HIGH [@ocaml.doc ""]
  | VERY_HIGH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec implementation_effort_list = implementation_effort list [@@ocaml.doc ""]

type nonrec filter = {
  restart_needed : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Whether or not implementing the recommendation requires a restart.\n"]
  rollback_possible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Whether or not implementing the recommendation can be rolled back.\n"]
  implementation_efforts : implementation_effort_list option;
      [@ocaml.doc "The effort required to implement the recommendation.\n"]
  account_ids : account_id_list option;
      [@ocaml.doc "The account to which the recommendation applies.\n"]
  regions : region_list option; [@ocaml.doc "The Amazon Web Services Region of the resource.\n"]
  resource_types : resource_type_list option;
      [@ocaml.doc "The resource type of the recommendation.\n"]
  action_types : action_type_list option;
      [@ocaml.doc "The type of action you can take by adopting the recommendation.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags assigned to the recommendation.\n"]
  resource_ids : resource_id_list option; [@ocaml.doc "The resource ID of the recommendation.\n"]
  resource_arns : resource_arn_list option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recommendation.\n"]
  recommendation_ids : recommendation_id_list option;
      [@ocaml.doc "The IDs for the recommendations.\n"]
}
[@@ocaml.doc
  "Describes a filter that returns a more specific list of recommendations. Filters \
   recommendations by different dimensions.\n"]

type nonrec list_recommendation_summaries_request = {
  filter : filter option; [@ocaml.doc ""]
  group_by : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The grouping of recommendations by a dimension.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of recommendations to be returned for the request.\n"]
  metrics : summary_metrics_list option;
      [@ocaml.doc
        "Additional metrics to be returned for the request. The only valid value is \
         [savingsPercentage].\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec source = COMPUTE_OPTIMIZER [@ocaml.doc ""] | COST_EXPLORER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec datetime = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec recommendation = {
  recommendation_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID for the recommendation.\n"]
  account_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account to which the recommendation applies.\n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the resource.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The resource ID for the recommendation.\n"]
  resource_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) for the recommendation.\n"]
  current_resource_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The current resource type.\n"]
  recommended_resource_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The recommended resource type.\n"]
  estimated_monthly_savings : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The estimated monthly savings amount for the recommendation.\n"]
  estimated_savings_percentage : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The estimated savings percentage relative to the total cost over the cost calculation \
         lookback period.\n"]
  estimated_monthly_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The estimated monthly cost of the current resource. For Reserved Instances and Savings \
         Plans, it refers to the cost for eligible usage.\n"]
  currency_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The currency code used for the recommendation.\n"]
  implementation_effort : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The effort required to implement the recommendation.\n"]
  restart_needed : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Whether or not implementing the recommendation requires a restart.\n"]
  action_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of tasks that can be carried out by this action.\n"]
  rollback_possible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Whether or not implementing the recommendation can be rolled back.\n"]
  current_resource_summary : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Describes the current resource.\n"]
  recommended_resource_summary : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Describes the recommended resource.\n"]
  last_refresh_timestamp : datetime option;
      [@ocaml.doc "The time when the recommendation was last generated.\n"]
  recommendation_lookback_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The lookback period that's used to generate the recommendation.\n"]
  source : source option; [@ocaml.doc "The source of the recommendation.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags assigned to the recommendation.\n"]
}
[@@ocaml.doc "Describes a recommendation.\n"]

type nonrec recommendation_list = recommendation list [@@ocaml.doc ""]

type nonrec list_recommendations_response = {
  items : recommendation_list option; [@ocaml.doc "List of all savings recommendations.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec order = ASC [@ocaml.doc ""] | DESC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec order_by = {
  dimension : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "Sorts by dimension values.\n"]
  order : order option; [@ocaml.doc "The order that's used to sort the data.\n"]
}
[@@ocaml.doc "Defines how rows will be sorted in the response.\n"]

type nonrec list_recommendations_request = {
  filter : filter option;
      [@ocaml.doc "The constraints that you want all returned recommendations to match.\n"]
  order_by : order_by option; [@ocaml.doc "The ordering of recommendations by a dimension.\n"]
  include_all_recommendations : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc
        "List of all recommendations for a resource, or a single recommendation if de-duped by \
         [resourceId].\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of recommendations that are returned for the request.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_enrollment_statuses_response = {
  items : account_enrollment_statuses option;
      [@ocaml.doc
        "The enrollment status of a specific account ID, including creation and last updated \
         timestamps.\n"]
  include_member_accounts : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "The enrollment status of all member accounts in the organization if the account is the \
         management account or delegated administrator.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_enrollment_statuses_request = {
  include_organization_info : Smaws_Lib.Smithy_api.Types.primitive_boolean option;
      [@ocaml.doc "Indicates whether to return the enrollment status for the organization.\n"]
  account_id : account_id option;
      [@ocaml.doc "The account ID of a member account in the organization.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The token to retrieve the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of objects that are returned for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec metrics_by_time = {
  score : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The efficiency score for this time period. The score represents a measure of how \
         effectively the cloud resources are being optimized, with higher scores indicating better \
         optimization performance.\n"]
  savings : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The estimated savings amount for this time period, representing the potential cost \
         reduction achieved through optimization recommendations.\n"]
  spend : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The total spending amount for this time period.\n"]
  timestamp : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The timestamp for this data point. The format depends on the granularity: YYYY-MM-DD for \
         daily metrics, or YYYY-MM for monthly metrics.\n"]
}
[@@ocaml.doc
  "Contains efficiency metrics for a specific point in time, including an efficiency score, \
   potential savings, optimizable spend, and timestamp.\n"]

type nonrec metrics_by_time_list = metrics_by_time list [@@ocaml.doc ""]

type nonrec efficiency_metrics_by_group = {
  metrics_by_time : metrics_by_time_list option;
      [@ocaml.doc
        "A list of time-series data points containing efficiency metrics for this group. Each data \
         point includes an efficiency score, estimated savings, spending, and a timestamp \
         corresponding to the specified granularity. This field is null when efficiency metrics \
         cannot be calculated for the group, in which case the message field provides an \
         explanation.\n"]
  group : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The value of the grouping dimension for this set of metrics. For example, if grouped by \
         account ID, this field contains the account ID. If no grouping is specified, this field \
         is empty.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "An explanation of why efficiency metrics could not be calculated for this group when the \
         metricsByTime field is null. Common reasons include insufficient or inconclusive cost and \
         usage data during the specified time period. This field is null or empty when metrics are \
         successfully calculated.\n"]
}
[@@ocaml.doc
  "Contains cost efficiency metrics for a specific group over time. The group is defined by the \
   grouping dimension specified in the request, such as account ID, Amazon Web Services Region.\n"]

type nonrec efficiency_metrics_by_group_list = efficiency_metrics_by_group list [@@ocaml.doc ""]

type nonrec list_efficiency_metrics_response = {
  efficiency_metrics_by_group : efficiency_metrics_by_group_list option;
      [@ocaml.doc
        "A list of cost efficiency metrics grouped by the specified dimension. Each group contains \
         time-series data points with cost efficiency, potential savings, and optimzable spend for \
         the specified time period.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to retrieve the next page of results. When this value is present in the \
         response, additional groups are available. Pass this token in the [nextToken] parameter \
         of a subsequent request to retrieve the next page.\n"]
}
[@@ocaml.doc ""]

type nonrec time_period = {
  start : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The beginning of the time period (inclusive). Specify the date in ISO 8601 format, such \
         as 2024-01-01.\n"]
  end_ : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The end of the time period (exclusive). Specify the date in ISO 8601 format, such as \
         2024-12-31.\n"]
}
[@@ocaml.doc
  "Specifies a date range for retrieving efficiency metrics. The start date is inclusive and the \
   end date is exclusive.\n"]

type nonrec granularity_type =
  | DAILY
      [@ocaml.doc
        "Metrics are aggregated daily, with each data point representing a single day's worth of \
         efficiency data. Timestamps are formatted as YYYY-MM-DD.\n"]
  | MONTHLY
      [@ocaml.doc
        "Metrics are aggregated monthly, with each data point representing a full month's worth of \
         efficiency data. Timestamps are formatted as YYYY-MM.\n"]
[@@ocaml.doc "The time granularity for aggregating the cost efficiency metrics.\n"]

type nonrec list_efficiency_metrics_request = {
  group_by : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The dimension by which to group the cost efficiency metrics. Valid values include account \
         ID, Amazon Web Services Region. When no grouping is specified, metrics are aggregated \
         across all resources in the specified time period.\n"]
  granularity : granularity_type;
      [@ocaml.doc
        "The time granularity for the cost efficiency metrics. Specify [Daily] for metrics \
         aggregated by day, or [Monthly] for metrics aggregated by month.\n"]
  time_period : time_period;
      [@ocaml.doc
        "The time period for which to retrieve the cost efficiency metrics. The start date is \
         inclusive and the end date is exclusive. Dates can be specified in either YYYY-MM-DD \
         format or YYYY-MM format depending on the desired granularity.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of groups to return in the response. Valid values range from 0 to \
         1000. Use in conjunction with [nextToken] to paginate through results when the total \
         number of groups exceeds this limit.\n"]
  order_by : order_by option;
      [@ocaml.doc
        "The ordering specification for the results. Defines which dimension to sort by and \
         whether to sort in ascending or descending order.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The token to retrieve the next page of results. This value is returned in the response \
         when the number of groups exceeds the specified [maxResults] value.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The identifier of the resource that was not found.\n"]
}
[@@ocaml.doc "The specified Amazon Resource Name (ARN) in the request doesn't exist.\n"]

type nonrec sage_maker_endpoint = {
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "The SageMaker endpoint recommendation details.\n"]

type nonrec work_spaces = { cost_calculation : resource_cost_calculation option [@ocaml.doc ""] }
[@@ocaml.doc "The WorkSpaces recommendation details.\n"]

type nonrec document_db_cluster = {
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "The Amazon DocumentDB cluster recommendation details.\n"]

type nonrec memory_db_cluster = {
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "The MemoryDB cluster recommendation details.\n"]

type nonrec elasti_cache_cluster = {
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "The ElastiCache cluster recommendation details.\n"]

type nonrec dynamo_db_table = {
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "The DynamoDB table recommendation details.\n"]

type nonrec nat_gateway_configuration = {
  active_connection_count : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of active connections through the NAT Gateway.\n"]
  packets_in_from_source : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of packets received from the source through the NAT Gateway.\n"]
  packets_in_from_destination : Smaws_Lib.Smithy_api.Types.long option;
      [@ocaml.doc "The number of packets received from the destination through the NAT Gateway.\n"]
}
[@@ocaml.doc "The NAT Gateway configuration used for recommendations.\n"]

type nonrec nat_gateway = {
  configuration : nat_gateway_configuration option;
      [@ocaml.doc "The NAT Gateway configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "The NAT Gateway recommendation details.\n"]

type nonrec reserved_instances_pricing = {
  estimated_on_demand_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The remaining On-Demand cost estimated to not be covered by the recommended reserved \
         instance, over the length of the lookback period.\n"]
  monthly_reservation_eligible_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The cost of paying for the recommended reserved instance monthly.\n"]
  savings_percentage : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The savings percentage relative to the total On-Demand costs that are associated with \
         this instance.\n"]
  estimated_monthly_amortized_reservation_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The estimated cost of your recurring monthly fees for the recommended reserved instance \
         across the month.\n"]
}
[@@ocaml.doc "Pricing details for your recommended reserved instance.\n"]

type nonrec reserved_instances_cost_calculation = {
  pricing : reserved_instances_pricing option;
      [@ocaml.doc "Pricing details of the purchase recommendation.\n"]
}
[@@ocaml.doc "Cost impact of the purchase recommendation.\n"]

type nonrec memory_db_reserved_instances_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  service : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reserved instances recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  reserved_instances_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
  upfront_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing these reserved instances costs you upfront.\n"]
  monthly_recurring_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing these reserved instances costs you on a monthly basis.\n"]
  normalized_units_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of normalized units that Amazon Web Services recommends that you purchase.\n"]
  number_of_instances_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of instances that Amazon Web Services recommends that you purchase.\n"]
  instance_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  instance_family : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
  size_flex_eligible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines whether the recommendation is size flexible.\n"]
  current_generation : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
}
[@@ocaml.doc
  "The MemoryDB reserved instances configuration used for recommendations.\n\n\
  \  While the API reference uses \"MemoryDB reserved instances\", the user guide and other \
   documentation refer to them as \"MemoryDB reserved nodes\", as the terms are used \
   interchangeably.\n\
  \  \n\
  \   "]

type nonrec memory_db_reserved_instances = {
  configuration : memory_db_reserved_instances_configuration option;
      [@ocaml.doc "The MemoryDB reserved instances configuration used for recommendations.\n"]
  cost_calculation : reserved_instances_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The MemoryDB reserved instances recommendation details.\n\n\
  \  While the API reference uses \"MemoryDB reserved instances\", the user guide and other \
   documentation refer to them as \"MemoryDB reserved nodes\", as the terms are used \
   interchangeably.\n\
  \  \n\
  \   "]

type nonrec dynamo_db_reserved_capacity_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  service : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reserved capacity recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  reserved_instances_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
  upfront_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this reserved capacity costs you upfront.\n"]
  monthly_recurring_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this reserved capacity costs you on a monthly basis.\n"]
  number_of_capacity_units_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of reserved capacity units that Amazon Web Services recommends that you \
         purchase.\n"]
  capacity_units : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The capacity unit of the recommended reservation.\n"]
}
[@@ocaml.doc "The DynamoDB reserved capacity configuration used for recommendations.\n"]

type nonrec dynamo_db_reserved_capacity = {
  configuration : dynamo_db_reserved_capacity_configuration option;
      [@ocaml.doc "The DynamoDB reserved capacity configuration used for recommendations.\n"]
  cost_calculation : reserved_instances_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "The DynamoDB reserved capacity recommendation details.\n"]

type nonrec rds_db_instance_storage_configuration = {
  storage_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The storage type to associate with the DB instance.\n"]
  allocated_storage_in_gb : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The new amount of storage in GB to allocate for the DB instance.\n"]
  iops : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The amount of Provisioned IOPS (input/output operations per second) to be initially \
         allocated for the DB instance.\n"]
  storage_throughput : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The storage throughput for the DB instance.\n"]
}
[@@ocaml.doc "The Amazon RDS DB instance storage configuration used for recommendations.\n"]

type nonrec rds_db_instance_storage = {
  configuration : rds_db_instance_storage_configuration option;
      [@ocaml.doc "The Amazon RDS DB instance storage configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "Contains the details of an Amazon RDS DB instance storage.\n"]

type nonrec db_instance_configuration = {
  db_instance_class : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The DB instance class of the DB instance.\n"]
}
[@@ocaml.doc "The DB instance configuration used for recommendations.\n"]

type nonrec rds_db_instance_configuration = {
  instance : db_instance_configuration option;
      [@ocaml.doc "Details about the instance configuration.\n"]
}
[@@ocaml.doc "The Amazon RDS DB instance configuration used for recommendations.\n"]

type nonrec rds_db_instance = {
  configuration : rds_db_instance_configuration option;
      [@ocaml.doc "The Amazon RDS DB instance configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option; [@ocaml.doc ""]
}
[@@ocaml.doc "Contains the details of an Amazon RDS DB instance.\n"]

type nonrec sage_maker_savings_plans_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Savings Plans recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  hourly_commitment : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The hourly commitment for the Savings Plans type.\n"]
}
[@@ocaml.doc "The SageMaker Savings Plans configuration used for recommendations.\n"]

type nonrec sage_maker_savings_plans = {
  configuration : sage_maker_savings_plans_configuration option;
      [@ocaml.doc "The SageMaker Savings Plans configuration used for recommendations.\n"]
  cost_calculation : savings_plans_cost_calculation option;
      [@ocaml.doc "Cost impact of the Savings Plans purchase recommendation.\n"]
}
[@@ocaml.doc "The SageMaker Savings Plans recommendation details.\n"]

type nonrec ec2_instance_savings_plans_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Savings Plans recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  hourly_commitment : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The hourly commitment for the Savings Plans type.\n"]
  instance_family : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance family of the recommended Savings Plans.\n"]
  savings_plans_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
}
[@@ocaml.doc "The EC2 instance Savings Plans configuration used for recommendations.\n"]

type nonrec ec2_instance_savings_plans = {
  configuration : ec2_instance_savings_plans_configuration option;
      [@ocaml.doc "The EC2 instance Savings Plans configuration used for recommendations.\n"]
  cost_calculation : savings_plans_cost_calculation option;
      [@ocaml.doc "Cost impact of the Savings Plans purchase recommendation.\n"]
}
[@@ocaml.doc "The EC2 instance Savings Plans recommendation details.\n"]

type nonrec redshift_reserved_instances_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  service : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reserved instances recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  reserved_instances_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
  upfront_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this instance costs you upfront.\n"]
  monthly_recurring_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing these reserved instances costs you on a monthly basis.\n"]
  normalized_units_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of normalized units that Amazon Web Services recommends that you purchase.\n"]
  number_of_instances_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of instances that Amazon Web Services recommends that you purchase.\n"]
  instance_family : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
  instance_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  size_flex_eligible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines whether the recommendation is size flexible.\n"]
  current_generation : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
}
[@@ocaml.doc "The Redshift reserved instances configuration used for recommendations.\n"]

type nonrec redshift_reserved_instances = {
  configuration : redshift_reserved_instances_configuration option;
      [@ocaml.doc "The Redshift reserved instances configuration used for recommendations.\n"]
  cost_calculation : reserved_instances_cost_calculation option;
      [@ocaml.doc "Cost impact of the purchase recommendation.\n"]
}
[@@ocaml.doc "The Redshift reserved instances recommendation details.\n"]

type nonrec open_search_reserved_instances_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  service : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reserved instances recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  reserved_instances_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
  upfront_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this instance costs you upfront.\n"]
  monthly_recurring_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing these reserved instances costs you on a monthly basis.\n"]
  normalized_units_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of normalized units that Amazon Web Services recommends that you purchase.\n"]
  number_of_instances_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of instances that Amazon Web Services recommends that you purchase.\n"]
  instance_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  current_generation : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
  size_flex_eligible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines whether the recommendation is size flexible.\n"]
}
[@@ocaml.doc "The OpenSearch reserved instances configuration used for recommendations.\n"]

type nonrec open_search_reserved_instances = {
  configuration : open_search_reserved_instances_configuration option;
      [@ocaml.doc "The OpenSearch reserved instances configuration used for recommendations.\n"]
  cost_calculation : reserved_instances_cost_calculation option;
      [@ocaml.doc "Cost impact of the purchase recommendation.\n"]
}
[@@ocaml.doc "The OpenSearch reserved instances recommendation details.\n"]

type nonrec elasti_cache_reserved_instances_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  service : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reserved instances recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  reserved_instances_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
  upfront_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this instance costs you upfront.\n"]
  monthly_recurring_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing these reserved instances costs you on a monthly basis.\n"]
  normalized_units_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of normalized units that Amazon Web Services recommends that you purchase.\n"]
  number_of_instances_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of instances that Amazon Web Services recommends that you purchase.\n"]
  instance_family : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
  instance_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  current_generation : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
  size_flex_eligible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines whether the recommendation is size flexible.\n"]
}
[@@ocaml.doc "The ElastiCache reserved instances configuration used for recommendations.\n"]

type nonrec elasti_cache_reserved_instances = {
  configuration : elasti_cache_reserved_instances_configuration option;
      [@ocaml.doc "The ElastiCache reserved instances configuration used for recommendations.\n"]
  cost_calculation : reserved_instances_cost_calculation option;
      [@ocaml.doc "Cost impact of the purchase recommendation.\n"]
}
[@@ocaml.doc "The ElastiCache reserved instances recommendation details.\n"]

type nonrec rds_reserved_instances_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  service : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reserved instances recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  reserved_instances_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
  upfront_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this instance costs you upfront.\n"]
  monthly_recurring_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this instance costs you on a monthly basis.\n"]
  normalized_units_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of normalized units that Amazon Web Services recommends that you purchase.\n"]
  number_of_instances_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of instances that Amazon Web Services recommends that you purchase.\n"]
  instance_family : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
  instance_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  size_flex_eligible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines whether the recommendation is size flexible.\n"]
  current_generation : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
  license_model : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The license model that the recommended reservation supports.\n"]
  database_edition : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The database edition that the recommended reservation supports.\n"]
  database_engine : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The database engine that the recommended reservation supports.\n"]
  deployment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Determines whether the recommendation is for a reservation in a single Availability Zone \
         or a reservation with a backup in a second Availability Zone.\n"]
}
[@@ocaml.doc "The RDS reserved instances configuration used for recommendations.\n"]

type nonrec rds_reserved_instances = {
  configuration : rds_reserved_instances_configuration option;
      [@ocaml.doc "The RDS reserved instances configuration used for recommendations.\n"]
  cost_calculation : reserved_instances_cost_calculation option;
      [@ocaml.doc "Cost impact of the purchase recommendation.\n"]
}
[@@ocaml.doc "The RDS reserved instances recommendation details.\n"]

type nonrec ec2_reserved_instances_configuration = {
  account_scope : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account scope for which you want recommendations.\n"]
  service : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The service for which you want recommendations.\n"]
  term : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The reserved instances recommendation term in years.\n"]
  payment_option : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The payment option for the commitment.\n"]
  reserved_instances_region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the commitment.\n"]
  upfront_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing this instance costs you upfront.\n"]
  monthly_recurring_cost : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "How much purchasing these reserved instances costs you on a monthly basis.\n"]
  normalized_units_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of normalized units that Amazon Web Services recommends that you purchase.\n"]
  number_of_instances_to_purchase : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The number of instances that Amazon Web Services recommends that you purchase.\n"]
  offering_class : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "Indicates whether the recommendation is for standard or convertible reservations.\n"]
  instance_family : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance family of the recommended reservation.\n"]
  instance_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The type of instance that Amazon Web Services recommends.\n"]
  current_generation : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Determines whether the recommendation is for a current generation instance.\n"]
  platform : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The platform of the recommended reservation. The platform is the specific combination of \
         operating system, license model, and software on an instance.\n"]
  tenancy : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "Determines whether the recommended reservation is dedicated or shared.\n"]
  size_flex_eligible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines whether the recommendation is size flexible.\n"]
}
[@@ocaml.doc "The EC2 reserved instances configuration used for recommendations.\n"]

type nonrec ec2_reserved_instances = {
  configuration : ec2_reserved_instances_configuration option;
      [@ocaml.doc "The EC2 reserved instances configuration used for recommendations.\n"]
  cost_calculation : reserved_instances_cost_calculation option;
      [@ocaml.doc "Cost impact of the purchase recommendation.\n"]
}
[@@ocaml.doc "The EC2 reserved instances recommendation details.\n"]

type nonrec ec2_auto_scaling_group_type =
  | SINGLE_INSTANCE_TYPE [@ocaml.doc ""]
  | MIXED_INSTANCE_TYPES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mixed_instance_configuration = {
  type_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance type of the configuration.\n"]
}
[@@ocaml.doc "The configuration for the EC2 Auto Scaling group with mixed instance types.\n"]

type nonrec mixed_instance_configuration_list = mixed_instance_configuration list [@@ocaml.doc ""]

type nonrec instance_configuration = {
  type_ : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The instance type of the configuration.\n"]
}
[@@ocaml.doc "The instance configuration used for recommendations.\n"]

type nonrec ec2_auto_scaling_group_configuration = {
  instance : instance_configuration option;
      [@ocaml.doc
        "Details about the instance for the EC2 Auto Scaling group with a single instance type.\n"]
  mixed_instances : mixed_instance_configuration_list option;
      [@ocaml.doc
        "A list of instance types for an EC2 Auto Scaling group with mixed instance types.\n"]
  type_ : ec2_auto_scaling_group_type option;
      [@ocaml.doc
        "The type of EC2 Auto Scaling group, showing whether it consists of a single instance type \
         or mixed instance types.\n"]
  allocation_strategy : allocation_strategy option;
      [@ocaml.doc
        "The strategy used for allocating instances, based on a predefined priority order or based \
         on the lowest available price.\n"]
}
[@@ocaml.doc "The EC2 Auto Scaling group configuration used for recommendations.\n"]

type nonrec ec2_auto_scaling_group = {
  configuration : ec2_auto_scaling_group_configuration option;
      [@ocaml.doc "The EC2 Auto Scaling group configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option;
      [@ocaml.doc "Cost impact of the recommendation.\n"]
}
[@@ocaml.doc "The EC2 Auto Scaling group recommendation details.\n"]

type nonrec storage_configuration = {
  type_ : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The storage type.\n"]
  size_in_gb : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc "The storage volume.\n"]
}
[@@ocaml.doc "The storage configuration used for recommendations.\n"]

type nonrec ebs_volume_configuration = {
  storage : storage_configuration option;
      [@ocaml.doc "The disk storage of the Amazon Elastic Block Store volume.\n"]
  performance : block_storage_performance_configuration option;
      [@ocaml.doc "The Amazon Elastic Block Store performance configuration.\n"]
  attachment_state : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Elastic Block Store attachment state.\n"]
}
[@@ocaml.doc "The Amazon Elastic Block Store volume configuration used for recommendations.\n"]

type nonrec ebs_volume = {
  configuration : ebs_volume_configuration option;
      [@ocaml.doc "The Amazon Elastic Block Store volume configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option;
      [@ocaml.doc "Cost impact of the recommendation.\n"]
}
[@@ocaml.doc
  "Describes the Amazon Elastic Block Store volume configuration of the current and recommended \
   resource configuration for a recommendation.\n"]

type nonrec ec2_instance_configuration = {
  instance : instance_configuration option; [@ocaml.doc "Details about the instance.\n"]
}
[@@ocaml.doc "The EC2 instance configuration used for recommendations.\n"]

type nonrec ec2_instance = {
  configuration : ec2_instance_configuration option;
      [@ocaml.doc "The EC2 instance configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option;
      [@ocaml.doc "Cost impact of the recommendation.\n"]
}
[@@ocaml.doc
  "Describes the EC2 instance configuration of the current and recommended resource configuration \
   for a recommendation.\n"]

type nonrec ecs_service_configuration = {
  compute : compute_configuration option; [@ocaml.doc "Details about the compute configuration.\n"]
}
[@@ocaml.doc "The ECS service configuration used for recommendations.\n"]

type nonrec ecs_service = {
  configuration : ecs_service_configuration option;
      [@ocaml.doc "The ECS service configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option;
      [@ocaml.doc "Cost impact of the recommendation.\n"]
}
[@@ocaml.doc "The ECS service recommendation details.\n"]

type nonrec lambda_function_configuration = {
  compute : compute_configuration option; [@ocaml.doc "Details about the compute configuration.\n"]
}
[@@ocaml.doc "The Lambda function configuration used for recommendations.\n"]

type nonrec lambda_function = {
  configuration : lambda_function_configuration option;
      [@ocaml.doc "The Lambda function configuration used for recommendations.\n"]
  cost_calculation : resource_cost_calculation option;
      [@ocaml.doc "Cost impact of the recommendation.\n"]
}
[@@ocaml.doc "The Lambda function recommendation details.\n"]

type nonrec resource_details =
  | LambdaFunction of lambda_function [@ocaml.doc "The Lambda function recommendation details.\n"]
  | EcsService of ecs_service [@ocaml.doc "The ECS service recommendation details.\n"]
  | Ec2Instance of ec2_instance [@ocaml.doc "The EC2 instance recommendation details.\n"]
  | EbsVolume of ebs_volume
      [@ocaml.doc "The Amazon Elastic Block Store volume recommendation details.\n"]
  | Ec2AutoScalingGroup of ec2_auto_scaling_group
      [@ocaml.doc "The EC2 Auto Scaling group recommendation details.\n"]
  | Ec2ReservedInstances of ec2_reserved_instances
      [@ocaml.doc "The EC2 reserved instances recommendation details.\n"]
  | RdsReservedInstances of rds_reserved_instances
      [@ocaml.doc "The RDS reserved instances recommendation details.\n"]
  | ElastiCacheReservedInstances of elasti_cache_reserved_instances
      [@ocaml.doc "The ElastiCache reserved instances recommendation details.\n"]
  | OpenSearchReservedInstances of open_search_reserved_instances
      [@ocaml.doc "The OpenSearch reserved instances recommendation details.\n"]
  | RedshiftReservedInstances of redshift_reserved_instances
      [@ocaml.doc "The Redshift reserved instances recommendation details.\n"]
  | Ec2InstanceSavingsPlans of ec2_instance_savings_plans
      [@ocaml.doc "The EC2 instance Savings Plans recommendation details.\n"]
  | ComputeSavingsPlans of compute_savings_plans
      [@ocaml.doc "The Compute Savings Plans recommendation details.\n"]
  | SageMakerSavingsPlans of sage_maker_savings_plans
      [@ocaml.doc "The SageMaker AI Savings Plans recommendation details.\n"]
  | RdsDbInstance of rds_db_instance [@ocaml.doc "The DB instance recommendation details.\n"]
  | RdsDbInstanceStorage of rds_db_instance_storage
      [@ocaml.doc "The DB instance storage recommendation details.\n"]
  | AuroraDbClusterStorage of aurora_db_cluster_storage
      [@ocaml.doc "The Aurora DB cluster storage recommendation details.\n"]
  | DynamoDbReservedCapacity of dynamo_db_reserved_capacity
      [@ocaml.doc "The DynamoDB reserved capacity recommendation details.\n"]
  | MemoryDbReservedInstances of memory_db_reserved_instances
      [@ocaml.doc "The MemoryDB reserved instances recommendation details.\n"]
  | NatGateway of nat_gateway [@ocaml.doc "The NAT Gateway recommendation details.\n"]
  | DynamoDbTable of dynamo_db_table [@ocaml.doc "The DynamoDB table recommendation details.\n"]
  | ElastiCacheCluster of elasti_cache_cluster
      [@ocaml.doc "The ElastiCache cluster recommendation details.\n"]
  | MemoryDbCluster of memory_db_cluster
      [@ocaml.doc "The MemoryDB cluster recommendation details.\n"]
  | DocumentDbCluster of document_db_cluster
      [@ocaml.doc "The Amazon DocumentDB cluster recommendation details.\n"]
  | WorkSpaces of work_spaces [@ocaml.doc "The WorkSpaces recommendation details.\n"]
  | SageMakerEndpoint of sage_maker_endpoint
      [@ocaml.doc "The SageMaker endpoint recommendation details.\n"]
[@@ocaml.doc "Contains detailed information about the specified resource.\n"]

type nonrec get_recommendation_response = {
  recommendation_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The ID for the recommendation.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The unique identifier for the resource. This is the same as the Amazon Resource Name \
         (ARN), if available.\n"]
  resource_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
  account_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The account to which the recommendation applies.\n"]
  currency_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The currency code used for the recommendation.\n"]
  recommendation_lookback_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The lookback period that's used to generate the recommendation.\n"]
  cost_calculation_lookback_period_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The lookback period used to calculate cost impact for a recommendation.\n"]
  estimated_savings_percentage : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The estimated savings percentage relative to the total cost over the cost calculation \
         lookback period.\n"]
  estimated_savings_over_cost_calculation_lookback_period :
    Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The estimated savings amount over the lookback period used to calculate cost impact for a \
         recommendation.\n"]
  current_resource_type : resource_type option; [@ocaml.doc "The type of resource.\n"]
  recommended_resource_type : resource_type option;
      [@ocaml.doc "The resource type of the recommendation.\n"]
  region : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The Amazon Web Services Region of the resource.\n"]
  source : source option; [@ocaml.doc "The source of the recommendation.\n"]
  last_refresh_timestamp : datetime option;
      [@ocaml.doc "The time when the recommendation was last generated.\n"]
  estimated_monthly_savings : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc "The estimated monthly savings amount for the recommendation.\n"]
  estimated_monthly_cost : Smaws_Lib.Smithy_api.Types.double option;
      [@ocaml.doc
        "The estimated monthly cost of the current resource. For Reserved Instances and Savings \
         Plans, it refers to the cost for eligible usage.\n"]
  implementation_effort : implementation_effort option;
      [@ocaml.doc "The effort required to implement the recommendation.\n"]
  restart_needed : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Whether or not implementing the recommendation requires a restart.\n"]
  action_type : action_type option;
      [@ocaml.doc "The type of action you can take by adopting the recommendation.\n"]
  rollback_possible : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Whether or not implementing the recommendation can be rolled back.\n"]
  current_resource_details : resource_details option; [@ocaml.doc "The details for the resource.\n"]
  recommended_resource_details : resource_details option;
      [@ocaml.doc "The details about the recommended resource.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags associated with the resource for which the recommendation exists.\n"]
}
[@@ocaml.doc ""]

type nonrec get_recommendation_request = {
  recommendation_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID for the recommendation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_preferences_response = {
  savings_estimation_mode : savings_estimation_mode option;
      [@ocaml.doc "Retrieves the status of the \"savings estimation mode\" preference.\n"]
  member_account_discount_visibility : member_account_discount_visibility option;
      [@ocaml.doc
        "Retrieves the status of the \"member account discount visibility\" preference.\n"]
  preferred_commitment : preferred_commitment option;
      [@ocaml.doc
        "Retrieves the current preferences for how Reserved Instances and Savings Plans \
         cost-saving opportunities are prioritized in terms of payment option and term length.\n"]
}
[@@ocaml.doc ""]

type nonrec get_preferences_request = unit [@@ocaml.doc ""]
