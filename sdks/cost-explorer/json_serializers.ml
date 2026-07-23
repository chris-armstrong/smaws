open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let arn_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ResourceName", option_to_yojson arn_to_yojson x.resource_name);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let zoned_date_time_to_yojson = string_to_yojson

let update_cost_category_definition_response_to_yojson
    (x : update_cost_category_definition_response) =
  assoc_to_yojson
    [
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
    ]

let generic_string_to_yojson = string_to_yojson

let cost_category_split_charge_rule_parameter_values_list_to_yojson tree =
  list_to_yojson generic_string_to_yojson tree

let cost_category_split_charge_rule_parameter_type_to_yojson
    (x : cost_category_split_charge_rule_parameter_type) =
  match x with ALLOCATION_PERCENTAGES -> `String "ALLOCATION_PERCENTAGES"

let cost_category_split_charge_rule_parameter_to_yojson
    (x : cost_category_split_charge_rule_parameter) =
  assoc_to_yojson
    [
      ("Type", Some (cost_category_split_charge_rule_parameter_type_to_yojson x.type_));
      ("Values", Some (cost_category_split_charge_rule_parameter_values_list_to_yojson x.values));
    ]

let cost_category_split_charge_rule_parameters_list_to_yojson tree =
  list_to_yojson cost_category_split_charge_rule_parameter_to_yojson tree

let cost_category_split_charge_method_to_yojson (x : cost_category_split_charge_method) =
  match x with
  | FIXED -> `String "FIXED"
  | PROPORTIONAL -> `String "PROPORTIONAL"
  | EVEN -> `String "EVEN"

let cost_category_split_charge_rule_targets_list_to_yojson tree =
  list_to_yojson generic_string_to_yojson tree

let cost_category_split_charge_rule_to_yojson (x : cost_category_split_charge_rule) =
  assoc_to_yojson
    [
      ("Source", Some (generic_string_to_yojson x.source));
      ("Targets", Some (cost_category_split_charge_rule_targets_list_to_yojson x.targets));
      ("Method", Some (cost_category_split_charge_method_to_yojson x.method_));
      ( "Parameters",
        option_to_yojson cost_category_split_charge_rule_parameters_list_to_yojson x.parameters );
    ]

let cost_category_split_charge_rules_list_to_yojson tree =
  list_to_yojson cost_category_split_charge_rule_to_yojson tree

let cost_category_value_to_yojson = string_to_yojson

let cost_category_rule_type_to_yojson (x : cost_category_rule_type) =
  match x with REGULAR -> `String "REGULAR" | INHERITED_VALUE -> `String "INHERITED_VALUE"

let cost_category_inherited_value_dimension_name_to_yojson
    (x : cost_category_inherited_value_dimension_name) =
  match x with LINKED_ACCOUNT_NAME -> `String "LINKED_ACCOUNT_NAME" | TAG -> `String "TAG"

let cost_category_inherited_value_dimension_to_yojson (x : cost_category_inherited_value_dimension)
    =
  assoc_to_yojson
    [
      ( "DimensionName",
        option_to_yojson cost_category_inherited_value_dimension_name_to_yojson x.dimension_name );
      ("DimensionKey", option_to_yojson generic_string_to_yojson x.dimension_key);
    ]

let match_option_to_yojson (x : match_option) =
  match x with
  | EQUALS -> `String "EQUALS"
  | ABSENT -> `String "ABSENT"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ENDS_WITH -> `String "ENDS_WITH"
  | CONTAINS -> `String "CONTAINS"
  | CASE_SENSITIVE -> `String "CASE_SENSITIVE"
  | CASE_INSENSITIVE -> `String "CASE_INSENSITIVE"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"

let match_options_to_yojson tree = list_to_yojson match_option_to_yojson tree
let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree
let cost_category_name_to_yojson = string_to_yojson

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson cost_category_name_to_yojson x.key);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let tag_key_to_yojson = string_to_yojson

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let dimension_to_yojson (x : dimension) =
  match x with
  | AZ -> `String "AZ"
  | INSTANCE_TYPE -> `String "INSTANCE_TYPE"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | PAYER_ACCOUNT -> `String "PAYER_ACCOUNT"
  | LINKED_ACCOUNT_NAME -> `String "LINKED_ACCOUNT_NAME"
  | OPERATION -> `String "OPERATION"
  | PURCHASE_TYPE -> `String "PURCHASE_TYPE"
  | REGION -> `String "REGION"
  | SERVICE -> `String "SERVICE"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | USAGE_TYPE_GROUP -> `String "USAGE_TYPE_GROUP"
  | RECORD_TYPE -> `String "RECORD_TYPE"
  | OPERATING_SYSTEM -> `String "OPERATING_SYSTEM"
  | TENANCY -> `String "TENANCY"
  | SCOPE -> `String "SCOPE"
  | PLATFORM -> `String "PLATFORM"
  | SUBSCRIPTION_ID -> `String "SUBSCRIPTION_ID"
  | LEGAL_ENTITY_NAME -> `String "LEGAL_ENTITY_NAME"
  | DEPLOYMENT_OPTION -> `String "DEPLOYMENT_OPTION"
  | DATABASE_ENGINE -> `String "DATABASE_ENGINE"
  | CACHE_ENGINE -> `String "CACHE_ENGINE"
  | INSTANCE_TYPE_FAMILY -> `String "INSTANCE_TYPE_FAMILY"
  | BILLING_ENTITY -> `String "BILLING_ENTITY"
  | RESERVATION_ID -> `String "RESERVATION_ID"
  | RESOURCE_ID -> `String "RESOURCE_ID"
  | RIGHTSIZING_TYPE -> `String "RIGHTSIZING_TYPE"
  | SAVINGS_PLANS_TYPE -> `String "SAVINGS_PLANS_TYPE"
  | SAVINGS_PLAN_ARN -> `String "SAVINGS_PLAN_ARN"
  | PAYMENT_OPTION -> `String "PAYMENT_OPTION"
  | AGREEMENT_END_DATE_TIME_AFTER -> `String "AGREEMENT_END_DATE_TIME_AFTER"
  | AGREEMENT_END_DATE_TIME_BEFORE -> `String "AGREEMENT_END_DATE_TIME_BEFORE"
  | INVOICING_ENTITY -> `String "INVOICING_ENTITY"
  | ANOMALY_TOTAL_IMPACT_ABSOLUTE -> `String "ANOMALY_TOTAL_IMPACT_ABSOLUTE"
  | ANOMALY_TOTAL_IMPACT_PERCENTAGE -> `String "ANOMALY_TOTAL_IMPACT_PERCENTAGE"

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson dimension_to_yojson x.key);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
    ]

let rec expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

and expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("Or", option_to_yojson expressions_to_yojson x.\#or);
      ("And", option_to_yojson expressions_to_yojson x.and_);
      ("Not", option_to_yojson expression_to_yojson x.not);
      ("Dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
      ("Tags", option_to_yojson tag_values_to_yojson x.tags);
      ("CostCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
    ]

let cost_category_rule_to_yojson (x : cost_category_rule) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson cost_category_value_to_yojson x.value);
      ("Rule", option_to_yojson expression_to_yojson x.rule);
      ( "InheritedValue",
        option_to_yojson cost_category_inherited_value_dimension_to_yojson x.inherited_value );
      ("Type", option_to_yojson cost_category_rule_type_to_yojson x.type_);
    ]

let cost_category_rules_list_to_yojson tree = list_to_yojson cost_category_rule_to_yojson tree

let cost_category_rule_version_to_yojson (x : cost_category_rule_version) =
  match x with CostCategoryExpressionV1 -> `String "CostCategoryExpression.v1"

let update_cost_category_definition_request_to_yojson (x : update_cost_category_definition_request)
    =
  assoc_to_yojson
    [
      ("CostCategoryArn", Some (arn_to_yojson x.cost_category_arn));
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("RuleVersion", Some (cost_category_rule_version_to_yojson x.rule_version));
      ("Rules", Some (cost_category_rules_list_to_yojson x.rules));
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
      ( "SplitChargeRules",
        option_to_yojson cost_category_split_charge_rules_list_to_yojson x.split_charge_rules );
    ]

let update_cost_allocation_tags_status_error_to_yojson
    (x : update_cost_allocation_tags_status_error) =
  assoc_to_yojson
    [
      ("TagKey", option_to_yojson tag_key_to_yojson x.tag_key);
      ("Code", option_to_yojson generic_string_to_yojson x.code);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let update_cost_allocation_tags_status_errors_to_yojson tree =
  list_to_yojson update_cost_allocation_tags_status_error_to_yojson tree

let update_cost_allocation_tags_status_response_to_yojson
    (x : update_cost_allocation_tags_status_response) =
  assoc_to_yojson
    [ ("Errors", option_to_yojson update_cost_allocation_tags_status_errors_to_yojson x.errors) ]

let cost_allocation_tag_status_to_yojson (x : cost_allocation_tag_status) =
  match x with ACTIVE -> `String "Active" | INACTIVE -> `String "Inactive"

let cost_allocation_tag_status_entry_to_yojson (x : cost_allocation_tag_status_entry) =
  assoc_to_yojson
    [
      ("TagKey", Some (tag_key_to_yojson x.tag_key));
      ("Status", Some (cost_allocation_tag_status_to_yojson x.status));
    ]

let cost_allocation_tag_status_list_to_yojson tree =
  list_to_yojson cost_allocation_tag_status_entry_to_yojson tree

let update_cost_allocation_tags_status_request_to_yojson
    (x : update_cost_allocation_tags_status_request) =
  assoc_to_yojson
    [
      ( "CostAllocationTagsStatus",
        Some (cost_allocation_tag_status_list_to_yojson x.cost_allocation_tags_status) );
    ]

let unknown_subscription_exception_to_yojson (x : unknown_subscription_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let unknown_monitor_exception_to_yojson (x : unknown_monitor_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_anomaly_subscription_response_to_yojson (x : update_anomaly_subscription_response) =
  assoc_to_yojson [ ("SubscriptionArn", Some (generic_string_to_yojson x.subscription_arn)) ]

let subscriber_status_to_yojson (x : subscriber_status) =
  match x with CONFIRMED -> `String "CONFIRMED" | DECLINED -> `String "DECLINED"

let subscriber_type_to_yojson (x : subscriber_type) =
  match x with EMAIL -> `String "EMAIL" | SNS -> `String "SNS"

let subscriber_address_to_yojson = string_to_yojson

let subscriber_to_yojson (x : subscriber) =
  assoc_to_yojson
    [
      ("Address", option_to_yojson subscriber_address_to_yojson x.address);
      ("Type", option_to_yojson subscriber_type_to_yojson x.type_);
      ("Status", option_to_yojson subscriber_status_to_yojson x.status);
    ]

let subscribers_to_yojson tree = list_to_yojson subscriber_to_yojson tree
let monitor_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let anomaly_subscription_frequency_to_yojson (x : anomaly_subscription_frequency) =
  match x with
  | DAILY -> `String "DAILY"
  | IMMEDIATE -> `String "IMMEDIATE"
  | WEEKLY -> `String "WEEKLY"

let nullable_non_negative_double_to_yojson = double_to_yojson

let update_anomaly_subscription_request_to_yojson (x : update_anomaly_subscription_request) =
  assoc_to_yojson
    [
      ("SubscriptionArn", Some (generic_string_to_yojson x.subscription_arn));
      ("Threshold", option_to_yojson nullable_non_negative_double_to_yojson x.threshold);
      ("Frequency", option_to_yojson anomaly_subscription_frequency_to_yojson x.frequency);
      ("MonitorArnList", option_to_yojson monitor_arn_list_to_yojson x.monitor_arn_list);
      ("Subscribers", option_to_yojson subscribers_to_yojson x.subscribers);
      ("SubscriptionName", option_to_yojson generic_string_to_yojson x.subscription_name);
      ("ThresholdExpression", option_to_yojson expression_to_yojson x.threshold_expression);
    ]

let update_anomaly_monitor_response_to_yojson (x : update_anomaly_monitor_response) =
  assoc_to_yojson [ ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn)) ]

let update_anomaly_monitor_request_to_yojson (x : update_anomaly_monitor_request) =
  assoc_to_yojson
    [
      ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn));
      ("MonitorName", option_to_yojson generic_string_to_yojson x.monitor_name);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ResourceName", option_to_yojson arn_to_yojson x.resource_name);
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Key", Some (resource_tag_key_to_yojson x.key));
      ("Value", Some (resource_tag_value_to_yojson x.value));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
    ]

let generation_exists_exception_to_yojson (x : generation_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let data_unavailable_exception_to_yojson (x : data_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let recommendation_id_to_yojson = string_to_yojson

let start_savings_plans_purchase_recommendation_generation_response_to_yojson
    (x : start_savings_plans_purchase_recommendation_generation_response) =
  assoc_to_yojson
    [
      ("RecommendationId", option_to_yojson recommendation_id_to_yojson x.recommendation_id);
      ("GenerationStartedTime", option_to_yojson zoned_date_time_to_yojson x.generation_started_time);
      ( "EstimatedCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.estimated_completion_time );
    ]

let start_savings_plans_purchase_recommendation_generation_request_to_yojson = unit_to_yojson

let backfill_limit_exceeded_exception_to_yojson (x : backfill_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cost_allocation_tag_backfill_status_to_yojson (x : cost_allocation_tag_backfill_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | PROCESSING -> `String "PROCESSING"
  | FAILED -> `String "FAILED"

let cost_allocation_tag_backfill_request_to_yojson (x : cost_allocation_tag_backfill_request) =
  assoc_to_yojson
    [
      ("BackfillFrom", option_to_yojson zoned_date_time_to_yojson x.backfill_from);
      ("RequestedAt", option_to_yojson zoned_date_time_to_yojson x.requested_at);
      ("CompletedAt", option_to_yojson zoned_date_time_to_yojson x.completed_at);
      ( "BackfillStatus",
        option_to_yojson cost_allocation_tag_backfill_status_to_yojson x.backfill_status );
      ("LastUpdatedAt", option_to_yojson zoned_date_time_to_yojson x.last_updated_at);
    ]

let start_cost_allocation_tag_backfill_response_to_yojson
    (x : start_cost_allocation_tag_backfill_response) =
  assoc_to_yojson
    [
      ( "BackfillRequest",
        option_to_yojson cost_allocation_tag_backfill_request_to_yojson x.backfill_request );
    ]

let start_cost_allocation_tag_backfill_request_to_yojson
    (x : start_cost_allocation_tag_backfill_request) =
  assoc_to_yojson [ ("BackfillFrom", Some (zoned_date_time_to_yojson x.backfill_from)) ]

let analysis_id_to_yojson = string_to_yojson

let start_commitment_purchase_analysis_response_to_yojson
    (x : start_commitment_purchase_analysis_response) =
  assoc_to_yojson
    [
      ("AnalysisId", Some (analysis_id_to_yojson x.analysis_id));
      ("AnalysisStartedTime", Some (zoned_date_time_to_yojson x.analysis_started_time));
      ("EstimatedCompletionTime", Some (zoned_date_time_to_yojson x.estimated_completion_time));
    ]

let savings_plans_target_coverage_to_yojson = int_to_yojson
let year_month_day_to_yojson = string_to_yojson

let date_interval_to_yojson (x : date_interval) =
  assoc_to_yojson
    [
      ("Start", Some (year_month_day_to_yojson x.start));
      ("End", Some (year_month_day_to_yojson x.end_));
    ]

let savings_plans_id_to_yojson = string_to_yojson
let savings_plans_to_exclude_to_yojson tree = list_to_yojson savings_plans_id_to_yojson tree
let savings_plans_commitment_to_yojson = double_to_yojson

let term_in_years_to_yojson (x : term_in_years) =
  match x with ONE_YEAR -> `String "ONE_YEAR" | THREE_YEARS -> `String "THREE_YEARS"

let supported_savings_plans_type_to_yojson (x : supported_savings_plans_type) =
  match x with
  | COMPUTE_SP -> `String "COMPUTE_SP"
  | EC2_INSTANCE_SP -> `String "EC2_INSTANCE_SP"
  | SAGEMAKER_SP -> `String "SAGEMAKER_SP"
  | DATABASE_SP -> `String "DATABASE_SP"

let payment_option_to_yojson (x : payment_option) =
  match x with
  | NO_UPFRONT -> `String "NO_UPFRONT"
  | PARTIAL_UPFRONT -> `String "PARTIAL_UPFRONT"
  | ALL_UPFRONT -> `String "ALL_UPFRONT"
  | LIGHT_UTILIZATION -> `String "LIGHT_UTILIZATION"
  | MEDIUM_UTILIZATION -> `String "MEDIUM_UTILIZATION"
  | HEAVY_UTILIZATION -> `String "HEAVY_UTILIZATION"

let savings_plans_to_yojson (x : savings_plans) =
  assoc_to_yojson
    [
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ( "SavingsPlansType",
        option_to_yojson supported_savings_plans_type_to_yojson x.savings_plans_type );
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("InstanceFamily", option_to_yojson generic_string_to_yojson x.instance_family);
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ( "SavingsPlansCommitment",
        option_to_yojson savings_plans_commitment_to_yojson x.savings_plans_commitment );
      ("OfferingId", option_to_yojson generic_string_to_yojson x.offering_id);
    ]

let savings_plans_to_add_to_yojson tree = list_to_yojson savings_plans_to_yojson tree

let analysis_type_to_yojson (x : analysis_type) =
  match x with
  | MAX_SAVINGS -> `String "MAX_SAVINGS"
  | CUSTOM_COMMITMENT -> `String "CUSTOM_COMMITMENT"
  | TARGET_AVERAGE_COVERAGE -> `String "TARGET_AVERAGE_COVERAGE"

let account_id_to_yojson = string_to_yojson

let account_scope_to_yojson (x : account_scope) =
  match x with PAYER -> `String "PAYER" | LINKED -> `String "LINKED"

let savings_plans_purchase_analysis_configuration_to_yojson
    (x : savings_plans_purchase_analysis_configuration) =
  assoc_to_yojson
    [
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AnalysisType", Some (analysis_type_to_yojson x.analysis_type));
      ("SavingsPlansToAdd", Some (savings_plans_to_add_to_yojson x.savings_plans_to_add));
      ( "SavingsPlansToExclude",
        option_to_yojson savings_plans_to_exclude_to_yojson x.savings_plans_to_exclude );
      ("LookBackTimePeriod", Some (date_interval_to_yojson x.look_back_time_period));
      ( "SavingsPlansTargetCoverage",
        option_to_yojson savings_plans_target_coverage_to_yojson x.savings_plans_target_coverage );
    ]

let commitment_purchase_analysis_configuration_to_yojson
    (x : commitment_purchase_analysis_configuration) =
  assoc_to_yojson
    [
      ( "SavingsPlansPurchaseAnalysisConfiguration",
        option_to_yojson savings_plans_purchase_analysis_configuration_to_yojson
          x.savings_plans_purchase_analysis_configuration );
    ]

let start_commitment_purchase_analysis_request_to_yojson
    (x : start_commitment_purchase_analysis_request) =
  assoc_to_yojson
    [
      ( "CommitmentPurchaseAnalysisConfiguration",
        Some
          (commitment_purchase_analysis_configuration_to_yojson
             x.commitment_purchase_analysis_configuration) );
    ]

let provide_anomaly_feedback_response_to_yojson (x : provide_anomaly_feedback_response) =
  assoc_to_yojson [ ("AnomalyId", Some (generic_string_to_yojson x.anomaly_id)) ]

let anomaly_feedback_type_to_yojson (x : anomaly_feedback_type) =
  match x with
  | YES -> `String "YES"
  | NO -> `String "NO"
  | PLANNED_ACTIVITY -> `String "PLANNED_ACTIVITY"

let provide_anomaly_feedback_request_to_yojson (x : provide_anomaly_feedback_request) =
  assoc_to_yojson
    [
      ("AnomalyId", Some (generic_string_to_yojson x.anomaly_id));
      ("Feedback", Some (anomaly_feedback_type_to_yojson x.feedback));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let next_page_token_to_yojson = string_to_yojson

let generation_status_to_yojson (x : generation_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | PROCESSING -> `String "PROCESSING"
  | FAILED -> `String "FAILED"

let generation_summary_to_yojson (x : generation_summary) =
  assoc_to_yojson
    [
      ("RecommendationId", option_to_yojson recommendation_id_to_yojson x.recommendation_id);
      ("GenerationStatus", option_to_yojson generation_status_to_yojson x.generation_status);
      ("GenerationStartedTime", option_to_yojson zoned_date_time_to_yojson x.generation_started_time);
      ( "GenerationCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.generation_completion_time );
      ( "EstimatedCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.estimated_completion_time );
    ]

let generation_summary_list_to_yojson tree = list_to_yojson generation_summary_to_yojson tree

let list_savings_plans_purchase_recommendation_generation_response_to_yojson
    (x : list_savings_plans_purchase_recommendation_generation_response) =
  assoc_to_yojson
    [
      ( "GenerationSummaryList",
        option_to_yojson generation_summary_list_to_yojson x.generation_summary_list );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let recommendations_page_size_to_yojson = int_to_yojson
let recommendation_id_list_to_yojson tree = list_to_yojson recommendation_id_to_yojson tree

let list_savings_plans_purchase_recommendation_generation_request_to_yojson
    (x : list_savings_plans_purchase_recommendation_generation_request) =
  assoc_to_yojson
    [
      ("GenerationStatus", option_to_yojson generation_status_to_yojson x.generation_status);
      ("RecommendationIds", option_to_yojson recommendation_id_list_to_yojson x.recommendation_ids);
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let generic_arn_to_yojson = string_to_yojson

let cost_category_resource_association_to_yojson (x : cost_category_resource_association) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson generic_arn_to_yojson x.resource_arn);
      ("CostCategoryName", option_to_yojson cost_category_name_to_yojson x.cost_category_name);
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
    ]

let cost_category_resource_associations_to_yojson tree =
  list_to_yojson cost_category_resource_association_to_yojson tree

let list_cost_category_resource_associations_response_to_yojson
    (x : list_cost_category_resource_associations_response) =
  assoc_to_yojson
    [
      ( "CostCategoryResourceAssociations",
        option_to_yojson cost_category_resource_associations_to_yojson
          x.cost_category_resource_associations );
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let cost_category_max_results_to_yojson = int_to_yojson

let list_cost_category_resource_associations_request_to_yojson
    (x : list_cost_category_resource_associations_request) =
  assoc_to_yojson
    [
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson cost_category_max_results_to_yojson x.max_results);
    ]

let resource_type_to_yojson = string_to_yojson
let resource_types_to_yojson tree = list_to_yojson resource_type_to_yojson tree
let cost_category_values_list_to_yojson tree = list_to_yojson cost_category_value_to_yojson tree

let cost_category_status_to_yojson (x : cost_category_status) =
  match x with PROCESSING -> `String "PROCESSING" | APPLIED -> `String "APPLIED"

let cost_category_status_component_to_yojson (x : cost_category_status_component) =
  match x with COST_EXPLORER -> `String "COST_EXPLORER"

let cost_category_processing_status_to_yojson (x : cost_category_processing_status) =
  assoc_to_yojson
    [
      ("Component", option_to_yojson cost_category_status_component_to_yojson x.component);
      ("Status", option_to_yojson cost_category_status_to_yojson x.status);
    ]

let cost_category_processing_status_list_to_yojson tree =
  list_to_yojson cost_category_processing_status_to_yojson tree

let non_negative_integer_to_yojson = int_to_yojson

let cost_category_reference_to_yojson (x : cost_category_reference) =
  assoc_to_yojson
    [
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
      ("Name", option_to_yojson cost_category_name_to_yojson x.name);
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("EffectiveEnd", option_to_yojson zoned_date_time_to_yojson x.effective_end);
      ("NumberOfRules", option_to_yojson non_negative_integer_to_yojson x.number_of_rules);
      ( "ProcessingStatus",
        option_to_yojson cost_category_processing_status_list_to_yojson x.processing_status );
      ("Values", option_to_yojson cost_category_values_list_to_yojson x.values);
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
      ( "SupportedResourceTypes",
        option_to_yojson resource_types_to_yojson x.supported_resource_types );
    ]

let cost_category_references_list_to_yojson tree =
  list_to_yojson cost_category_reference_to_yojson tree

let list_cost_category_definitions_response_to_yojson (x : list_cost_category_definitions_response)
    =
  assoc_to_yojson
    [
      ( "CostCategoryReferences",
        option_to_yojson cost_category_references_list_to_yojson x.cost_category_references );
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let resource_types_filter_input_to_yojson tree = list_to_yojson resource_type_to_yojson tree

let list_cost_category_definitions_request_to_yojson (x : list_cost_category_definitions_request) =
  assoc_to_yojson
    [
      ("EffectiveOn", option_to_yojson zoned_date_time_to_yojson x.effective_on);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson cost_category_max_results_to_yojson x.max_results);
      ( "SupportedResourceTypes",
        option_to_yojson resource_types_filter_input_to_yojson x.supported_resource_types );
    ]

let cost_allocation_tag_type_to_yojson (x : cost_allocation_tag_type) =
  match x with AWS_GENERATED -> `String "AWSGenerated" | USER_DEFINED -> `String "UserDefined"

let cost_allocation_tag_to_yojson (x : cost_allocation_tag) =
  assoc_to_yojson
    [
      ("TagKey", Some (tag_key_to_yojson x.tag_key));
      ("Type", Some (cost_allocation_tag_type_to_yojson x.type_));
      ("Status", Some (cost_allocation_tag_status_to_yojson x.status));
      ("LastUpdatedDate", option_to_yojson zoned_date_time_to_yojson x.last_updated_date);
      ("LastUsedDate", option_to_yojson zoned_date_time_to_yojson x.last_used_date);
    ]

let cost_allocation_tag_list_to_yojson tree = list_to_yojson cost_allocation_tag_to_yojson tree

let list_cost_allocation_tags_response_to_yojson (x : list_cost_allocation_tags_response) =
  assoc_to_yojson
    [
      ( "CostAllocationTags",
        option_to_yojson cost_allocation_tag_list_to_yojson x.cost_allocation_tags );
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let cost_allocation_tags_max_results_to_yojson = int_to_yojson
let cost_allocation_tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let list_cost_allocation_tags_request_to_yojson (x : list_cost_allocation_tags_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson cost_allocation_tag_status_to_yojson x.status);
      ("TagKeys", option_to_yojson cost_allocation_tag_key_list_to_yojson x.tag_keys);
      ("Type", option_to_yojson cost_allocation_tag_type_to_yojson x.type_);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson cost_allocation_tags_max_results_to_yojson x.max_results);
    ]

let cost_allocation_tag_backfill_request_list_to_yojson tree =
  list_to_yojson cost_allocation_tag_backfill_request_to_yojson tree

let list_cost_allocation_tag_backfill_history_response_to_yojson
    (x : list_cost_allocation_tag_backfill_history_response) =
  assoc_to_yojson
    [
      ( "BackfillRequests",
        option_to_yojson cost_allocation_tag_backfill_request_list_to_yojson x.backfill_requests );
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_cost_allocation_tag_backfill_history_request_to_yojson
    (x : list_cost_allocation_tag_backfill_history_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson cost_allocation_tags_max_results_to_yojson x.max_results);
    ]

let error_code_to_yojson (x : error_code) =
  match x with
  | NO_USAGE_FOUND -> `String "NO_USAGE_FOUND"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | INVALID_SAVINGS_PLANS_TO_ADD -> `String "INVALID_SAVINGS_PLANS_TO_ADD"
  | INVALID_SAVINGS_PLANS_TO_EXCLUDE -> `String "INVALID_SAVINGS_PLANS_TO_EXCLUDE"
  | INVALID_ACCOUNT_ID -> `String "INVALID_ACCOUNT_ID"

let analysis_status_to_yojson (x : analysis_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | PROCESSING -> `String "PROCESSING"
  | FAILED -> `String "FAILED"

let analysis_summary_to_yojson (x : analysis_summary) =
  assoc_to_yojson
    [
      ( "EstimatedCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.estimated_completion_time );
      ( "AnalysisCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.analysis_completion_time );
      ("AnalysisStartedTime", option_to_yojson zoned_date_time_to_yojson x.analysis_started_time);
      ("AnalysisStatus", option_to_yojson analysis_status_to_yojson x.analysis_status);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("AnalysisId", option_to_yojson analysis_id_to_yojson x.analysis_id);
      ( "CommitmentPurchaseAnalysisConfiguration",
        option_to_yojson commitment_purchase_analysis_configuration_to_yojson
          x.commitment_purchase_analysis_configuration );
    ]

let analysis_summary_list_to_yojson tree = list_to_yojson analysis_summary_to_yojson tree

let list_commitment_purchase_analyses_response_to_yojson
    (x : list_commitment_purchase_analyses_response) =
  assoc_to_yojson
    [
      ( "AnalysisSummaryList",
        option_to_yojson analysis_summary_list_to_yojson x.analysis_summary_list );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let analysis_ids_to_yojson tree = list_to_yojson analysis_id_to_yojson tree
let analyses_page_size_to_yojson = int_to_yojson

let list_commitment_purchase_analyses_request_to_yojson
    (x : list_commitment_purchase_analyses_request) =
  assoc_to_yojson
    [
      ("AnalysisStatus", option_to_yojson analysis_status_to_yojson x.analysis_status);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("PageSize", option_to_yojson analyses_page_size_to_yojson x.page_size);
      ("AnalysisIds", option_to_yojson analysis_ids_to_yojson x.analysis_ids);
    ]

let unresolvable_usage_unit_exception_to_yojson (x : unresolvable_usage_unit_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let billing_view_health_status_exception_to_yojson (x : billing_view_health_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let forecast_result_to_yojson (x : forecast_result) =
  assoc_to_yojson
    [
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
      ("MeanValue", option_to_yojson generic_string_to_yojson x.mean_value);
      ( "PredictionIntervalLowerBound",
        option_to_yojson generic_string_to_yojson x.prediction_interval_lower_bound );
      ( "PredictionIntervalUpperBound",
        option_to_yojson generic_string_to_yojson x.prediction_interval_upper_bound );
    ]

let forecast_results_by_time_to_yojson tree = list_to_yojson forecast_result_to_yojson tree
let metric_unit_to_yojson = string_to_yojson
let metric_amount_to_yojson = string_to_yojson

let metric_value_to_yojson (x : metric_value) =
  assoc_to_yojson
    [
      ("Amount", option_to_yojson metric_amount_to_yojson x.amount);
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
    ]

let get_usage_forecast_response_to_yojson (x : get_usage_forecast_response) =
  assoc_to_yojson
    [
      ("Total", option_to_yojson metric_value_to_yojson x.total);
      ( "ForecastResultsByTime",
        option_to_yojson forecast_results_by_time_to_yojson x.forecast_results_by_time );
    ]

let prediction_interval_level_to_yojson = int_to_yojson
let billing_view_arn_to_yojson = string_to_yojson

let granularity_to_yojson (x : granularity) =
  match x with
  | DAILY -> `String "DAILY"
  | MONTHLY -> `String "MONTHLY"
  | HOURLY -> `String "HOURLY"

let metric_to_yojson (x : metric) =
  match x with
  | BLENDED_COST -> `String "BLENDED_COST"
  | UNBLENDED_COST -> `String "UNBLENDED_COST"
  | AMORTIZED_COST -> `String "AMORTIZED_COST"
  | NET_UNBLENDED_COST -> `String "NET_UNBLENDED_COST"
  | NET_AMORTIZED_COST -> `String "NET_AMORTIZED_COST"
  | USAGE_QUANTITY -> `String "USAGE_QUANTITY"
  | NORMALIZED_USAGE_AMOUNT -> `String "NORMALIZED_USAGE_AMOUNT"

let get_usage_forecast_request_to_yojson (x : get_usage_forecast_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Metric", Some (metric_to_yojson x.metric));
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ( "PredictionIntervalLevel",
        option_to_yojson prediction_interval_level_to_yojson x.prediction_interval_level );
    ]

let request_changed_exception_to_yojson (x : request_changed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let bill_expiration_exception_to_yojson (x : bill_expiration_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let page_size_to_yojson = int_to_yojson
let entity_to_yojson = string_to_yojson
let tag_list_to_yojson tree = list_to_yojson entity_to_yojson tree

let get_tags_response_to_yojson (x : get_tags_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ReturnSize", Some (page_size_to_yojson x.return_size));
      ("TotalSize", Some (page_size_to_yojson x.total_size));
    ]

let max_results_to_yojson = int_to_yojson

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let sort_definition_key_to_yojson = string_to_yojson

let sort_definition_to_yojson (x : sort_definition) =
  assoc_to_yojson
    [
      ("Key", Some (sort_definition_key_to_yojson x.key));
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let sort_definitions_to_yojson tree = list_to_yojson sort_definition_to_yojson tree
let search_string_to_yojson = string_to_yojson

let get_tags_request_to_yojson (x : get_tags_request) =
  assoc_to_yojson
    [
      ("SearchString", option_to_yojson search_string_to_yojson x.search_string);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("TagKey", option_to_yojson tag_key_to_yojson x.tag_key);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("SortBy", option_to_yojson sort_definitions_to_yojson x.sort_by);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let savings_plans_amortized_commitment_to_yojson (x : savings_plans_amortized_commitment) =
  assoc_to_yojson
    [
      ( "AmortizedRecurringCommitment",
        option_to_yojson generic_string_to_yojson x.amortized_recurring_commitment );
      ( "AmortizedUpfrontCommitment",
        option_to_yojson generic_string_to_yojson x.amortized_upfront_commitment );
      ( "TotalAmortizedCommitment",
        option_to_yojson generic_string_to_yojson x.total_amortized_commitment );
    ]

let savings_plans_savings_to_yojson (x : savings_plans_savings) =
  assoc_to_yojson
    [
      ("NetSavings", option_to_yojson generic_string_to_yojson x.net_savings);
      ( "OnDemandCostEquivalent",
        option_to_yojson generic_string_to_yojson x.on_demand_cost_equivalent );
    ]

let savings_plans_utilization_to_yojson (x : savings_plans_utilization) =
  assoc_to_yojson
    [
      ("TotalCommitment", option_to_yojson generic_string_to_yojson x.total_commitment);
      ("UsedCommitment", option_to_yojson generic_string_to_yojson x.used_commitment);
      ("UnusedCommitment", option_to_yojson generic_string_to_yojson x.unused_commitment);
      ("UtilizationPercentage", option_to_yojson generic_string_to_yojson x.utilization_percentage);
    ]

let savings_plans_utilization_aggregates_to_yojson (x : savings_plans_utilization_aggregates) =
  assoc_to_yojson
    [
      ("Utilization", Some (savings_plans_utilization_to_yojson x.utilization));
      ("Savings", option_to_yojson savings_plans_savings_to_yojson x.savings);
      ( "AmortizedCommitment",
        option_to_yojson savings_plans_amortized_commitment_to_yojson x.amortized_commitment );
    ]

let attribute_value_to_yojson = string_to_yojson
let attribute_type_to_yojson = string_to_yojson

let attributes_to_yojson tree =
  map_to_yojson attribute_type_to_yojson attribute_value_to_yojson tree

let savings_plan_arn_to_yojson = string_to_yojson

let savings_plans_utilization_detail_to_yojson (x : savings_plans_utilization_detail) =
  assoc_to_yojson
    [
      ("SavingsPlanArn", option_to_yojson savings_plan_arn_to_yojson x.savings_plan_arn);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("Utilization", option_to_yojson savings_plans_utilization_to_yojson x.utilization);
      ("Savings", option_to_yojson savings_plans_savings_to_yojson x.savings);
      ( "AmortizedCommitment",
        option_to_yojson savings_plans_amortized_commitment_to_yojson x.amortized_commitment );
    ]

let savings_plans_utilization_details_to_yojson tree =
  list_to_yojson savings_plans_utilization_detail_to_yojson tree

let get_savings_plans_utilization_details_response_to_yojson
    (x : get_savings_plans_utilization_details_response) =
  assoc_to_yojson
    [
      ( "SavingsPlansUtilizationDetails",
        Some (savings_plans_utilization_details_to_yojson x.savings_plans_utilization_details) );
      ("Total", option_to_yojson savings_plans_utilization_aggregates_to_yojson x.total);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let savings_plans_data_type_to_yojson (x : savings_plans_data_type) =
  match x with
  | ATTRIBUTES -> `String "ATTRIBUTES"
  | UTILIZATION -> `String "UTILIZATION"
  | AMORTIZED_COMMITMENT -> `String "AMORTIZED_COMMITMENT"
  | SAVINGS -> `String "SAVINGS"

let savings_plans_data_types_to_yojson tree = list_to_yojson savings_plans_data_type_to_yojson tree

let get_savings_plans_utilization_details_request_to_yojson
    (x : get_savings_plans_utilization_details_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("DataType", option_to_yojson savings_plans_data_types_to_yojson x.data_type);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
    ]

let savings_plans_utilization_by_time_to_yojson (x : savings_plans_utilization_by_time) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Utilization", Some (savings_plans_utilization_to_yojson x.utilization));
      ("Savings", option_to_yojson savings_plans_savings_to_yojson x.savings);
      ( "AmortizedCommitment",
        option_to_yojson savings_plans_amortized_commitment_to_yojson x.amortized_commitment );
    ]

let savings_plans_utilizations_by_time_to_yojson tree =
  list_to_yojson savings_plans_utilization_by_time_to_yojson tree

let get_savings_plans_utilization_response_to_yojson (x : get_savings_plans_utilization_response) =
  assoc_to_yojson
    [
      ( "SavingsPlansUtilizationsByTime",
        option_to_yojson savings_plans_utilizations_by_time_to_yojson
          x.savings_plans_utilizations_by_time );
      ("Total", Some (savings_plans_utilization_aggregates_to_yojson x.total));
    ]

let get_savings_plans_utilization_request_to_yojson (x : get_savings_plans_utilization_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
    ]

let savings_plans_purchase_recommendation_summary_to_yojson
    (x : savings_plans_purchase_recommendation_summary) =
  assoc_to_yojson
    [
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("EstimatedTotalCost", option_to_yojson generic_string_to_yojson x.estimated_total_cost);
      ("CurrentOnDemandSpend", option_to_yojson generic_string_to_yojson x.current_on_demand_spend);
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ( "TotalRecommendationCount",
        option_to_yojson generic_string_to_yojson x.total_recommendation_count );
      ( "DailyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.daily_commitment_to_purchase );
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
    ]

let recommendation_detail_id_to_yojson = string_to_yojson

let savings_plans_details_to_yojson (x : savings_plans_details) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("InstanceFamily", option_to_yojson generic_string_to_yojson x.instance_family);
      ("OfferingId", option_to_yojson generic_string_to_yojson x.offering_id);
    ]

let savings_plans_purchase_recommendation_detail_to_yojson
    (x : savings_plans_purchase_recommendation_detail) =
  assoc_to_yojson
    [
      ( "SavingsPlansDetails",
        option_to_yojson savings_plans_details_to_yojson x.savings_plans_details );
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("EstimatedSPCost", option_to_yojson generic_string_to_yojson x.estimated_sp_cost);
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ( "EstimatedAverageUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_average_utilization );
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ( "CurrentMinimumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_minimum_hourly_on_demand_spend );
      ( "CurrentMaximumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_maximum_hourly_on_demand_spend );
      ( "CurrentAverageHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_average_hourly_on_demand_spend );
      ( "RecommendationDetailId",
        option_to_yojson recommendation_detail_id_to_yojson x.recommendation_detail_id );
    ]

let savings_plans_purchase_recommendation_detail_list_to_yojson tree =
  list_to_yojson savings_plans_purchase_recommendation_detail_to_yojson tree

let lookback_period_in_days_to_yojson (x : lookback_period_in_days) =
  match x with
  | SEVEN_DAYS -> `String "SEVEN_DAYS"
  | THIRTY_DAYS -> `String "THIRTY_DAYS"
  | SIXTY_DAYS -> `String "SIXTY_DAYS"

let savings_plans_purchase_recommendation_to_yojson (x : savings_plans_purchase_recommendation) =
  assoc_to_yojson
    [
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ( "SavingsPlansType",
        option_to_yojson supported_savings_plans_type_to_yojson x.savings_plans_type );
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ( "SavingsPlansPurchaseRecommendationDetails",
        option_to_yojson savings_plans_purchase_recommendation_detail_list_to_yojson
          x.savings_plans_purchase_recommendation_details );
      ( "SavingsPlansPurchaseRecommendationSummary",
        option_to_yojson savings_plans_purchase_recommendation_summary_to_yojson
          x.savings_plans_purchase_recommendation_summary );
    ]

let savings_plans_purchase_recommendation_metadata_to_yojson
    (x : savings_plans_purchase_recommendation_metadata) =
  assoc_to_yojson
    [
      ("RecommendationId", option_to_yojson generic_string_to_yojson x.recommendation_id);
      ("GenerationTimestamp", option_to_yojson generic_string_to_yojson x.generation_timestamp);
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
    ]

let get_savings_plans_purchase_recommendation_response_to_yojson
    (x : get_savings_plans_purchase_recommendation_response) =
  assoc_to_yojson
    [
      ( "Metadata",
        option_to_yojson savings_plans_purchase_recommendation_metadata_to_yojson x.metadata );
      ( "SavingsPlansPurchaseRecommendation",
        option_to_yojson savings_plans_purchase_recommendation_to_yojson
          x.savings_plans_purchase_recommendation );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_savings_plans_purchase_recommendation_request_to_yojson
    (x : get_savings_plans_purchase_recommendation_request) =
  assoc_to_yojson
    [
      ("SavingsPlansType", Some (supported_savings_plans_type_to_yojson x.savings_plans_type));
      ("TermInYears", Some (term_in_years_to_yojson x.term_in_years));
      ("PaymentOption", Some (payment_option_to_yojson x.payment_option));
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ("LookbackPeriodInDays", Some (lookback_period_in_days_to_yojson x.lookback_period_in_days));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
    ]

let savings_plans_coverage_data_to_yojson (x : savings_plans_coverage_data) =
  assoc_to_yojson
    [
      ( "SpendCoveredBySavingsPlans",
        option_to_yojson generic_string_to_yojson x.spend_covered_by_savings_plans );
      ("OnDemandCost", option_to_yojson generic_string_to_yojson x.on_demand_cost);
      ("TotalCost", option_to_yojson generic_string_to_yojson x.total_cost);
      ("CoveragePercentage", option_to_yojson generic_string_to_yojson x.coverage_percentage);
    ]

let savings_plans_coverage_to_yojson (x : savings_plans_coverage) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("Coverage", option_to_yojson savings_plans_coverage_data_to_yojson x.coverage);
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
    ]

let savings_plans_coverages_to_yojson tree = list_to_yojson savings_plans_coverage_to_yojson tree

let get_savings_plans_coverage_response_to_yojson (x : get_savings_plans_coverage_response) =
  assoc_to_yojson
    [
      ("SavingsPlansCoverages", Some (savings_plans_coverages_to_yojson x.savings_plans_coverages));
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let metric_name_to_yojson = string_to_yojson
let metric_names_to_yojson tree = list_to_yojson metric_name_to_yojson tree
let group_definition_key_to_yojson = string_to_yojson

let group_definition_type_to_yojson (x : group_definition_type) =
  match x with
  | DIMENSION -> `String "DIMENSION"
  | TAG -> `String "TAG"
  | COST_CATEGORY -> `String "COST_CATEGORY"

let group_definition_to_yojson (x : group_definition) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson group_definition_type_to_yojson x.type_);
      ("Key", option_to_yojson group_definition_key_to_yojson x.key);
    ]

let group_definitions_to_yojson tree = list_to_yojson group_definition_to_yojson tree

let get_savings_plans_coverage_request_to_yojson (x : get_savings_plans_coverage_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
    ]

let recommendation_detail_hourly_metrics_to_yojson (x : recommendation_detail_hourly_metrics) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson zoned_date_time_to_yojson x.start_time);
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ("CurrentCoverage", option_to_yojson generic_string_to_yojson x.current_coverage);
      ("EstimatedCoverage", option_to_yojson generic_string_to_yojson x.estimated_coverage);
      ( "EstimatedNewCommitmentUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_new_commitment_utilization );
    ]

let metrics_over_lookback_period_to_yojson tree =
  list_to_yojson recommendation_detail_hourly_metrics_to_yojson tree

let recommendation_detail_data_to_yojson (x : recommendation_detail_data) =
  assoc_to_yojson
    [
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ( "SavingsPlansType",
        option_to_yojson supported_savings_plans_type_to_yojson x.savings_plans_type );
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("InstanceFamily", option_to_yojson generic_string_to_yojson x.instance_family);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("OfferingId", option_to_yojson generic_string_to_yojson x.offering_id);
      ("GenerationTimestamp", option_to_yojson zoned_date_time_to_yojson x.generation_timestamp);
      ("LatestUsageTimestamp", option_to_yojson zoned_date_time_to_yojson x.latest_usage_timestamp);
      ( "CurrentAverageHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_average_hourly_on_demand_spend );
      ( "CurrentMaximumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_maximum_hourly_on_demand_spend );
      ( "CurrentMinimumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_minimum_hourly_on_demand_spend );
      ( "EstimatedAverageUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_average_utilization );
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
      ("EstimatedSPCost", option_to_yojson generic_string_to_yojson x.estimated_sp_cost);
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "ExistingHourlyCommitment",
        option_to_yojson generic_string_to_yojson x.existing_hourly_commitment );
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ( "CurrentAverageCoverage",
        option_to_yojson generic_string_to_yojson x.current_average_coverage );
      ( "EstimatedAverageCoverage",
        option_to_yojson generic_string_to_yojson x.estimated_average_coverage );
      ( "MetricsOverLookbackPeriod",
        option_to_yojson metrics_over_lookback_period_to_yojson x.metrics_over_lookback_period );
    ]

let get_savings_plan_purchase_recommendation_details_response_to_yojson
    (x : get_savings_plan_purchase_recommendation_details_response) =
  assoc_to_yojson
    [
      ( "RecommendationDetailId",
        option_to_yojson recommendation_detail_id_to_yojson x.recommendation_detail_id );
      ( "RecommendationDetailData",
        option_to_yojson recommendation_detail_data_to_yojson x.recommendation_detail_data );
    ]

let get_savings_plan_purchase_recommendation_details_request_to_yojson
    (x : get_savings_plan_purchase_recommendation_details_request) =
  assoc_to_yojson
    [
      ( "RecommendationDetailId",
        Some (recommendation_detail_id_to_yojson x.recommendation_detail_id) );
    ]

let generic_boolean_to_yojson = bool_to_yojson

let recommendation_target_to_yojson (x : recommendation_target) =
  match x with
  | SAME_INSTANCE_FAMILY -> `String "SAME_INSTANCE_FAMILY"
  | CROSS_INSTANCE_FAMILY -> `String "CROSS_INSTANCE_FAMILY"

let rightsizing_recommendation_configuration_to_yojson
    (x : rightsizing_recommendation_configuration) =
  assoc_to_yojson
    [
      ("RecommendationTarget", Some (recommendation_target_to_yojson x.recommendation_target));
      ("BenefitsConsidered", Some (generic_boolean_to_yojson x.benefits_considered));
    ]

let finding_reason_code_to_yojson (x : finding_reason_code) =
  match x with
  | CPU_OVER_PROVISIONED -> `String "CPU_OVER_PROVISIONED"
  | CPU_UNDER_PROVISIONED -> `String "CPU_UNDER_PROVISIONED"
  | MEMORY_OVER_PROVISIONED -> `String "MEMORY_OVER_PROVISIONED"
  | MEMORY_UNDER_PROVISIONED -> `String "MEMORY_UNDER_PROVISIONED"
  | EBS_THROUGHPUT_OVER_PROVISIONED -> `String "EBS_THROUGHPUT_OVER_PROVISIONED"
  | EBS_THROUGHPUT_UNDER_PROVISIONED -> `String "EBS_THROUGHPUT_UNDER_PROVISIONED"
  | EBS_IOPS_OVER_PROVISIONED -> `String "EBS_IOPS_OVER_PROVISIONED"
  | EBS_IOPS_UNDER_PROVISIONED -> `String "EBS_IOPS_UNDER_PROVISIONED"
  | NETWORK_BANDWIDTH_OVER_PROVISIONED -> `String "NETWORK_BANDWIDTH_OVER_PROVISIONED"
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED -> `String "NETWORK_BANDWIDTH_UNDER_PROVISIONED"
  | NETWORK_PPS_OVER_PROVISIONED -> `String "NETWORK_PPS_OVER_PROVISIONED"
  | NETWORK_PPS_UNDER_PROVISIONED -> `String "NETWORK_PPS_UNDER_PROVISIONED"
  | DISK_IOPS_OVER_PROVISIONED -> `String "DISK_IOPS_OVER_PROVISIONED"
  | DISK_IOPS_UNDER_PROVISIONED -> `String "DISK_IOPS_UNDER_PROVISIONED"
  | DISK_THROUGHPUT_OVER_PROVISIONED -> `String "DISK_THROUGHPUT_OVER_PROVISIONED"
  | DISK_THROUGHPUT_UNDER_PROVISIONED -> `String "DISK_THROUGHPUT_UNDER_PROVISIONED"

let finding_reason_codes_to_yojson tree = list_to_yojson finding_reason_code_to_yojson tree

let terminate_recommendation_detail_to_yojson (x : terminate_recommendation_detail) =
  assoc_to_yojson
    [
      ( "EstimatedMonthlySavings",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings );
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
    ]

let platform_difference_to_yojson (x : platform_difference) =
  match x with
  | HYPERVISOR -> `String "HYPERVISOR"
  | NETWORK_INTERFACE -> `String "NETWORK_INTERFACE"
  | STORAGE_INTERFACE -> `String "STORAGE_INTERFACE"
  | INSTANCE_STORE_AVAILABILITY -> `String "INSTANCE_STORE_AVAILABILITY"
  | VIRTUALIZATION_TYPE -> `String "VIRTUALIZATION_TYPE"

let platform_differences_to_yojson tree = list_to_yojson platform_difference_to_yojson tree

let network_resource_utilization_to_yojson (x : network_resource_utilization) =
  assoc_to_yojson
    [
      ( "NetworkInBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.network_in_bytes_per_second );
      ( "NetworkOutBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.network_out_bytes_per_second );
      ( "NetworkPacketsInPerSecond",
        option_to_yojson generic_string_to_yojson x.network_packets_in_per_second );
      ( "NetworkPacketsOutPerSecond",
        option_to_yojson generic_string_to_yojson x.network_packets_out_per_second );
    ]

let disk_resource_utilization_to_yojson (x : disk_resource_utilization) =
  assoc_to_yojson
    [
      ("DiskReadOpsPerSecond", option_to_yojson generic_string_to_yojson x.disk_read_ops_per_second);
      ( "DiskWriteOpsPerSecond",
        option_to_yojson generic_string_to_yojson x.disk_write_ops_per_second );
      ( "DiskReadBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.disk_read_bytes_per_second );
      ( "DiskWriteBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.disk_write_bytes_per_second );
    ]

let ebs_resource_utilization_to_yojson (x : ebs_resource_utilization) =
  assoc_to_yojson
    [
      ("EbsReadOpsPerSecond", option_to_yojson generic_string_to_yojson x.ebs_read_ops_per_second);
      ("EbsWriteOpsPerSecond", option_to_yojson generic_string_to_yojson x.ebs_write_ops_per_second);
      ( "EbsReadBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.ebs_read_bytes_per_second );
      ( "EbsWriteBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.ebs_write_bytes_per_second );
    ]

let ec2_resource_utilization_to_yojson (x : ec2_resource_utilization) =
  assoc_to_yojson
    [
      ( "MaxCpuUtilizationPercentage",
        option_to_yojson generic_string_to_yojson x.max_cpu_utilization_percentage );
      ( "MaxMemoryUtilizationPercentage",
        option_to_yojson generic_string_to_yojson x.max_memory_utilization_percentage );
      ( "MaxStorageUtilizationPercentage",
        option_to_yojson generic_string_to_yojson x.max_storage_utilization_percentage );
      ( "EBSResourceUtilization",
        option_to_yojson ebs_resource_utilization_to_yojson x.ebs_resource_utilization );
      ( "DiskResourceUtilization",
        option_to_yojson disk_resource_utilization_to_yojson x.disk_resource_utilization );
      ( "NetworkResourceUtilization",
        option_to_yojson network_resource_utilization_to_yojson x.network_resource_utilization );
    ]

let resource_utilization_to_yojson (x : resource_utilization) =
  assoc_to_yojson
    [
      ( "EC2ResourceUtilization",
        option_to_yojson ec2_resource_utilization_to_yojson x.ec2_resource_utilization );
    ]

let ec2_resource_details_to_yojson (x : ec2_resource_details) =
  assoc_to_yojson
    [
      ("HourlyOnDemandRate", option_to_yojson generic_string_to_yojson x.hourly_on_demand_rate);
      ("InstanceType", option_to_yojson generic_string_to_yojson x.instance_type);
      ("Platform", option_to_yojson generic_string_to_yojson x.platform);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("Sku", option_to_yojson generic_string_to_yojson x.sku);
      ("Memory", option_to_yojson generic_string_to_yojson x.memory);
      ("NetworkPerformance", option_to_yojson generic_string_to_yojson x.network_performance);
      ("Storage", option_to_yojson generic_string_to_yojson x.storage);
      ("Vcpu", option_to_yojson generic_string_to_yojson x.vcpu);
    ]

let resource_details_to_yojson (x : resource_details) =
  assoc_to_yojson
    [
      ("EC2ResourceDetails", option_to_yojson ec2_resource_details_to_yojson x.ec2_resource_details);
    ]

let target_instance_to_yojson (x : target_instance) =
  assoc_to_yojson
    [
      ("EstimatedMonthlyCost", option_to_yojson generic_string_to_yojson x.estimated_monthly_cost);
      ( "EstimatedMonthlySavings",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings );
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("DefaultTargetInstance", option_to_yojson generic_boolean_to_yojson x.default_target_instance);
      ("ResourceDetails", option_to_yojson resource_details_to_yojson x.resource_details);
      ( "ExpectedResourceUtilization",
        option_to_yojson resource_utilization_to_yojson x.expected_resource_utilization );
      ("PlatformDifferences", option_to_yojson platform_differences_to_yojson x.platform_differences);
    ]

let target_instances_list_to_yojson tree = list_to_yojson target_instance_to_yojson tree

let modify_recommendation_detail_to_yojson (x : modify_recommendation_detail) =
  assoc_to_yojson
    [ ("TargetInstances", option_to_yojson target_instances_list_to_yojson x.target_instances) ]

let rightsizing_type_to_yojson (x : rightsizing_type) =
  match x with TERMINATE -> `String "TERMINATE" | MODIFY -> `String "MODIFY"

let tag_values_list_to_yojson tree = list_to_yojson tag_values_to_yojson tree

let current_instance_to_yojson (x : current_instance) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson generic_string_to_yojson x.resource_id);
      ("InstanceName", option_to_yojson generic_string_to_yojson x.instance_name);
      ("Tags", option_to_yojson tag_values_list_to_yojson x.tags);
      ("ResourceDetails", option_to_yojson resource_details_to_yojson x.resource_details);
      ("ResourceUtilization", option_to_yojson resource_utilization_to_yojson x.resource_utilization);
      ( "ReservationCoveredHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.reservation_covered_hours_in_lookback_period );
      ( "SavingsPlansCoveredHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.savings_plans_covered_hours_in_lookback_period
      );
      ( "OnDemandHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.on_demand_hours_in_lookback_period );
      ( "TotalRunningHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.total_running_hours_in_lookback_period );
      ("MonthlyCost", option_to_yojson generic_string_to_yojson x.monthly_cost);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
    ]

let rightsizing_recommendation_to_yojson (x : rightsizing_recommendation) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("CurrentInstance", option_to_yojson current_instance_to_yojson x.current_instance);
      ("RightsizingType", option_to_yojson rightsizing_type_to_yojson x.rightsizing_type);
      ( "ModifyRecommendationDetail",
        option_to_yojson modify_recommendation_detail_to_yojson x.modify_recommendation_detail );
      ( "TerminateRecommendationDetail",
        option_to_yojson terminate_recommendation_detail_to_yojson x.terminate_recommendation_detail
      );
      ("FindingReasonCodes", option_to_yojson finding_reason_codes_to_yojson x.finding_reason_codes);
    ]

let rightsizing_recommendation_list_to_yojson tree =
  list_to_yojson rightsizing_recommendation_to_yojson tree

let rightsizing_recommendation_summary_to_yojson (x : rightsizing_recommendation_summary) =
  assoc_to_yojson
    [
      ( "TotalRecommendationCount",
        option_to_yojson generic_string_to_yojson x.total_recommendation_count );
      ( "EstimatedTotalMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_total_monthly_savings_amount );
      ("SavingsCurrencyCode", option_to_yojson generic_string_to_yojson x.savings_currency_code);
      ("SavingsPercentage", option_to_yojson generic_string_to_yojson x.savings_percentage);
    ]

let rightsizing_recommendation_metadata_to_yojson (x : rightsizing_recommendation_metadata) =
  assoc_to_yojson
    [
      ("RecommendationId", option_to_yojson generic_string_to_yojson x.recommendation_id);
      ("GenerationTimestamp", option_to_yojson generic_string_to_yojson x.generation_timestamp);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
    ]

let get_rightsizing_recommendation_response_to_yojson (x : get_rightsizing_recommendation_response)
    =
  assoc_to_yojson
    [
      ("Metadata", option_to_yojson rightsizing_recommendation_metadata_to_yojson x.metadata);
      ("Summary", option_to_yojson rightsizing_recommendation_summary_to_yojson x.summary);
      ( "RightsizingRecommendations",
        option_to_yojson rightsizing_recommendation_list_to_yojson x.rightsizing_recommendations );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "Configuration",
        option_to_yojson rightsizing_recommendation_configuration_to_yojson x.configuration );
    ]

let get_rightsizing_recommendation_request_to_yojson (x : get_rightsizing_recommendation_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ( "Configuration",
        option_to_yojson rightsizing_recommendation_configuration_to_yojson x.configuration );
      ("Service", Some (generic_string_to_yojson x.service));
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let unrealized_savings_to_yojson = string_to_yojson
let realized_savings_to_yojson = string_to_yojson
let ri_cost_for_unused_hours_to_yojson = string_to_yojson
let total_amortized_fee_to_yojson = string_to_yojson
let amortized_recurring_fee_to_yojson = string_to_yojson
let amortized_upfront_fee_to_yojson = string_to_yojson
let total_potential_ri_savings_to_yojson = string_to_yojson
let net_ri_savings_to_yojson = string_to_yojson
let on_demand_cost_of_ri_hours_used_to_yojson = string_to_yojson
let unused_units_to_yojson = string_to_yojson
let unused_hours_to_yojson = string_to_yojson
let total_actual_units_to_yojson = string_to_yojson
let total_actual_hours_to_yojson = string_to_yojson
let purchased_units_to_yojson = string_to_yojson
let purchased_hours_to_yojson = string_to_yojson
let utilization_percentage_in_units_to_yojson = string_to_yojson
let utilization_percentage_to_yojson = string_to_yojson

let reservation_aggregates_to_yojson (x : reservation_aggregates) =
  assoc_to_yojson
    [
      ( "UtilizationPercentage",
        option_to_yojson utilization_percentage_to_yojson x.utilization_percentage );
      ( "UtilizationPercentageInUnits",
        option_to_yojson utilization_percentage_in_units_to_yojson x.utilization_percentage_in_units
      );
      ("PurchasedHours", option_to_yojson purchased_hours_to_yojson x.purchased_hours);
      ("PurchasedUnits", option_to_yojson purchased_units_to_yojson x.purchased_units);
      ("TotalActualHours", option_to_yojson total_actual_hours_to_yojson x.total_actual_hours);
      ("TotalActualUnits", option_to_yojson total_actual_units_to_yojson x.total_actual_units);
      ("UnusedHours", option_to_yojson unused_hours_to_yojson x.unused_hours);
      ("UnusedUnits", option_to_yojson unused_units_to_yojson x.unused_units);
      ( "OnDemandCostOfRIHoursUsed",
        option_to_yojson on_demand_cost_of_ri_hours_used_to_yojson x.on_demand_cost_of_ri_hours_used
      );
      ("NetRISavings", option_to_yojson net_ri_savings_to_yojson x.net_ri_savings);
      ( "TotalPotentialRISavings",
        option_to_yojson total_potential_ri_savings_to_yojson x.total_potential_ri_savings );
      ( "AmortizedUpfrontFee",
        option_to_yojson amortized_upfront_fee_to_yojson x.amortized_upfront_fee );
      ( "AmortizedRecurringFee",
        option_to_yojson amortized_recurring_fee_to_yojson x.amortized_recurring_fee );
      ("TotalAmortizedFee", option_to_yojson total_amortized_fee_to_yojson x.total_amortized_fee);
      ( "RICostForUnusedHours",
        option_to_yojson ri_cost_for_unused_hours_to_yojson x.ri_cost_for_unused_hours );
      ("RealizedSavings", option_to_yojson realized_savings_to_yojson x.realized_savings);
      ("UnrealizedSavings", option_to_yojson unrealized_savings_to_yojson x.unrealized_savings);
    ]

let reservation_group_value_to_yojson = string_to_yojson
let reservation_group_key_to_yojson = string_to_yojson

let reservation_utilization_group_to_yojson (x : reservation_utilization_group) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson reservation_group_key_to_yojson x.key);
      ("Value", option_to_yojson reservation_group_value_to_yojson x.value);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("Utilization", option_to_yojson reservation_aggregates_to_yojson x.utilization);
    ]

let reservation_utilization_groups_to_yojson tree =
  list_to_yojson reservation_utilization_group_to_yojson tree

let utilization_by_time_to_yojson (x : utilization_by_time) =
  assoc_to_yojson
    [
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
      ("Groups", option_to_yojson reservation_utilization_groups_to_yojson x.groups);
      ("Total", option_to_yojson reservation_aggregates_to_yojson x.total);
    ]

let utilizations_by_time_to_yojson tree = list_to_yojson utilization_by_time_to_yojson tree

let get_reservation_utilization_response_to_yojson (x : get_reservation_utilization_response) =
  assoc_to_yojson
    [
      ("UtilizationsByTime", Some (utilizations_by_time_to_yojson x.utilizations_by_time));
      ("Total", option_to_yojson reservation_aggregates_to_yojson x.total);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_reservation_utilization_request_to_yojson (x : get_reservation_utilization_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let reservation_purchase_recommendation_summary_to_yojson
    (x : reservation_purchase_recommendation_summary) =
  assoc_to_yojson
    [
      ( "TotalEstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.total_estimated_monthly_savings_amount );
      ( "TotalEstimatedMonthlySavingsPercentage",
        option_to_yojson generic_string_to_yojson x.total_estimated_monthly_savings_percentage );
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
    ]

let dynamo_db_capacity_details_to_yojson (x : dynamo_db_capacity_details) =
  assoc_to_yojson
    [
      ("CapacityUnits", option_to_yojson generic_string_to_yojson x.capacity_units);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
    ]

let reserved_capacity_details_to_yojson (x : reserved_capacity_details) =
  assoc_to_yojson
    [
      ( "DynamoDBCapacityDetails",
        option_to_yojson dynamo_db_capacity_details_to_yojson x.dynamo_db_capacity_details );
    ]

let memory_db_instance_details_to_yojson (x : memory_db_instance_details) =
  assoc_to_yojson
    [
      ("Family", option_to_yojson generic_string_to_yojson x.family);
      ("NodeType", option_to_yojson generic_string_to_yojson x.node_type);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
    ]

let es_instance_details_to_yojson (x : es_instance_details) =
  assoc_to_yojson
    [
      ("InstanceClass", option_to_yojson generic_string_to_yojson x.instance_class);
      ("InstanceSize", option_to_yojson generic_string_to_yojson x.instance_size);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
    ]

let elasti_cache_instance_details_to_yojson (x : elasti_cache_instance_details) =
  assoc_to_yojson
    [
      ("Family", option_to_yojson generic_string_to_yojson x.family);
      ("NodeType", option_to_yojson generic_string_to_yojson x.node_type);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("ProductDescription", option_to_yojson generic_string_to_yojson x.product_description);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
    ]

let redshift_instance_details_to_yojson (x : redshift_instance_details) =
  assoc_to_yojson
    [
      ("Family", option_to_yojson generic_string_to_yojson x.family);
      ("NodeType", option_to_yojson generic_string_to_yojson x.node_type);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
    ]

let rds_instance_details_to_yojson (x : rds_instance_details) =
  assoc_to_yojson
    [
      ("Family", option_to_yojson generic_string_to_yojson x.family);
      ("InstanceType", option_to_yojson generic_string_to_yojson x.instance_type);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("DatabaseEngine", option_to_yojson generic_string_to_yojson x.database_engine);
      ("DatabaseEdition", option_to_yojson generic_string_to_yojson x.database_edition);
      ("DeploymentOption", option_to_yojson generic_string_to_yojson x.deployment_option);
      ("LicenseModel", option_to_yojson generic_string_to_yojson x.license_model);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
      ("DeploymentModel", option_to_yojson generic_string_to_yojson x.deployment_model);
    ]

let ec2_instance_details_to_yojson (x : ec2_instance_details) =
  assoc_to_yojson
    [
      ("Family", option_to_yojson generic_string_to_yojson x.family);
      ("InstanceType", option_to_yojson generic_string_to_yojson x.instance_type);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("AvailabilityZone", option_to_yojson generic_string_to_yojson x.availability_zone);
      ("Platform", option_to_yojson generic_string_to_yojson x.platform);
      ("Tenancy", option_to_yojson generic_string_to_yojson x.tenancy);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
    ]

let instance_details_to_yojson (x : instance_details) =
  assoc_to_yojson
    [
      ("EC2InstanceDetails", option_to_yojson ec2_instance_details_to_yojson x.ec2_instance_details);
      ("RDSInstanceDetails", option_to_yojson rds_instance_details_to_yojson x.rds_instance_details);
      ( "RedshiftInstanceDetails",
        option_to_yojson redshift_instance_details_to_yojson x.redshift_instance_details );
      ( "ElastiCacheInstanceDetails",
        option_to_yojson elasti_cache_instance_details_to_yojson x.elasti_cache_instance_details );
      ("ESInstanceDetails", option_to_yojson es_instance_details_to_yojson x.es_instance_details);
      ( "MemoryDBInstanceDetails",
        option_to_yojson memory_db_instance_details_to_yojson x.memory_db_instance_details );
    ]

let reservation_purchase_recommendation_detail_to_yojson
    (x : reservation_purchase_recommendation_detail) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("InstanceDetails", option_to_yojson instance_details_to_yojson x.instance_details);
      ( "RecommendedNumberOfInstancesToPurchase",
        option_to_yojson generic_string_to_yojson x.recommended_number_of_instances_to_purchase );
      ( "RecommendedNormalizedUnitsToPurchase",
        option_to_yojson generic_string_to_yojson x.recommended_normalized_units_to_purchase );
      ( "MinimumNumberOfInstancesUsedPerHour",
        option_to_yojson generic_string_to_yojson x.minimum_number_of_instances_used_per_hour );
      ( "MinimumNormalizedUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.minimum_normalized_units_used_per_hour );
      ( "MaximumNumberOfInstancesUsedPerHour",
        option_to_yojson generic_string_to_yojson x.maximum_number_of_instances_used_per_hour );
      ( "MaximumNormalizedUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.maximum_normalized_units_used_per_hour );
      ( "AverageNumberOfInstancesUsedPerHour",
        option_to_yojson generic_string_to_yojson x.average_number_of_instances_used_per_hour );
      ( "AverageNormalizedUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.average_normalized_units_used_per_hour );
      ("AverageUtilization", option_to_yojson generic_string_to_yojson x.average_utilization);
      ( "EstimatedBreakEvenInMonths",
        option_to_yojson generic_string_to_yojson x.estimated_break_even_in_months );
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ( "EstimatedMonthlySavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_percentage );
      ( "EstimatedMonthlyOnDemandCost",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_on_demand_cost );
      ( "EstimatedReservationCostForLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.estimated_reservation_cost_for_lookback_period
      );
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ( "RecurringStandardMonthlyCost",
        option_to_yojson generic_string_to_yojson x.recurring_standard_monthly_cost );
      ( "ReservedCapacityDetails",
        option_to_yojson reserved_capacity_details_to_yojson x.reserved_capacity_details );
      ( "RecommendedNumberOfCapacityUnitsToPurchase",
        option_to_yojson generic_string_to_yojson x.recommended_number_of_capacity_units_to_purchase
      );
      ( "MinimumNumberOfCapacityUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.minimum_number_of_capacity_units_used_per_hour
      );
      ( "MaximumNumberOfCapacityUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.maximum_number_of_capacity_units_used_per_hour
      );
      ( "AverageNumberOfCapacityUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.average_number_of_capacity_units_used_per_hour
      );
    ]

let reservation_purchase_recommendation_details_to_yojson tree =
  list_to_yojson reservation_purchase_recommendation_detail_to_yojson tree

let offering_class_to_yojson (x : offering_class) =
  match x with STANDARD -> `String "STANDARD" | CONVERTIBLE -> `String "CONVERTIBLE"

let ec2_specification_to_yojson (x : ec2_specification) =
  assoc_to_yojson [ ("OfferingClass", option_to_yojson offering_class_to_yojson x.offering_class) ]

let service_specification_to_yojson (x : service_specification) =
  assoc_to_yojson
    [ ("EC2Specification", option_to_yojson ec2_specification_to_yojson x.ec2_specification) ]

let reservation_purchase_recommendation_to_yojson (x : reservation_purchase_recommendation) =
  assoc_to_yojson
    [
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ( "ServiceSpecification",
        option_to_yojson service_specification_to_yojson x.service_specification );
      ( "RecommendationDetails",
        option_to_yojson reservation_purchase_recommendation_details_to_yojson
          x.recommendation_details );
      ( "RecommendationSummary",
        option_to_yojson reservation_purchase_recommendation_summary_to_yojson
          x.recommendation_summary );
    ]

let reservation_purchase_recommendations_to_yojson tree =
  list_to_yojson reservation_purchase_recommendation_to_yojson tree

let reservation_purchase_recommendation_metadata_to_yojson
    (x : reservation_purchase_recommendation_metadata) =
  assoc_to_yojson
    [
      ("RecommendationId", option_to_yojson generic_string_to_yojson x.recommendation_id);
      ("GenerationTimestamp", option_to_yojson generic_string_to_yojson x.generation_timestamp);
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
    ]

let get_reservation_purchase_recommendation_response_to_yojson
    (x : get_reservation_purchase_recommendation_response) =
  assoc_to_yojson
    [
      ( "Metadata",
        option_to_yojson reservation_purchase_recommendation_metadata_to_yojson x.metadata );
      ( "Recommendations",
        option_to_yojson reservation_purchase_recommendations_to_yojson x.recommendations );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_reservation_purchase_recommendation_request_to_yojson
    (x : get_reservation_purchase_recommendation_request) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("Service", Some (generic_string_to_yojson x.service));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ( "ServiceSpecification",
        option_to_yojson service_specification_to_yojson x.service_specification );
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let on_demand_cost_to_yojson = string_to_yojson

let coverage_cost_to_yojson (x : coverage_cost) =
  assoc_to_yojson [ ("OnDemandCost", option_to_yojson on_demand_cost_to_yojson x.on_demand_cost) ]

let coverage_normalized_units_percentage_to_yojson = string_to_yojson
let total_running_normalized_units_to_yojson = string_to_yojson
let reserved_normalized_units_to_yojson = string_to_yojson
let on_demand_normalized_units_to_yojson = string_to_yojson

let coverage_normalized_units_to_yojson (x : coverage_normalized_units) =
  assoc_to_yojson
    [
      ( "OnDemandNormalizedUnits",
        option_to_yojson on_demand_normalized_units_to_yojson x.on_demand_normalized_units );
      ( "ReservedNormalizedUnits",
        option_to_yojson reserved_normalized_units_to_yojson x.reserved_normalized_units );
      ( "TotalRunningNormalizedUnits",
        option_to_yojson total_running_normalized_units_to_yojson x.total_running_normalized_units
      );
      ( "CoverageNormalizedUnitsPercentage",
        option_to_yojson coverage_normalized_units_percentage_to_yojson
          x.coverage_normalized_units_percentage );
    ]

let coverage_hours_percentage_to_yojson = string_to_yojson
let total_running_hours_to_yojson = string_to_yojson
let reserved_hours_to_yojson = string_to_yojson
let on_demand_hours_to_yojson = string_to_yojson

let coverage_hours_to_yojson (x : coverage_hours) =
  assoc_to_yojson
    [
      ("OnDemandHours", option_to_yojson on_demand_hours_to_yojson x.on_demand_hours);
      ("ReservedHours", option_to_yojson reserved_hours_to_yojson x.reserved_hours);
      ("TotalRunningHours", option_to_yojson total_running_hours_to_yojson x.total_running_hours);
      ( "CoverageHoursPercentage",
        option_to_yojson coverage_hours_percentage_to_yojson x.coverage_hours_percentage );
    ]

let coverage_to_yojson (x : coverage) =
  assoc_to_yojson
    [
      ("CoverageHours", option_to_yojson coverage_hours_to_yojson x.coverage_hours);
      ( "CoverageNormalizedUnits",
        option_to_yojson coverage_normalized_units_to_yojson x.coverage_normalized_units );
      ("CoverageCost", option_to_yojson coverage_cost_to_yojson x.coverage_cost);
    ]

let reservation_coverage_group_to_yojson (x : reservation_coverage_group) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("Coverage", option_to_yojson coverage_to_yojson x.coverage);
    ]

let reservation_coverage_groups_to_yojson tree =
  list_to_yojson reservation_coverage_group_to_yojson tree

let coverage_by_time_to_yojson (x : coverage_by_time) =
  assoc_to_yojson
    [
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
      ("Groups", option_to_yojson reservation_coverage_groups_to_yojson x.groups);
      ("Total", option_to_yojson coverage_to_yojson x.total);
    ]

let coverages_by_time_to_yojson tree = list_to_yojson coverage_by_time_to_yojson tree

let get_reservation_coverage_response_to_yojson (x : get_reservation_coverage_response) =
  assoc_to_yojson
    [
      ("CoveragesByTime", Some (coverages_by_time_to_yojson x.coverages_by_time));
      ("Total", option_to_yojson coverage_to_yojson x.total);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_reservation_coverage_request_to_yojson (x : get_reservation_coverage_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let dimension_values_with_attributes_to_yojson (x : dimension_values_with_attributes) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
    ]

let dimension_values_with_attributes_list_to_yojson tree =
  list_to_yojson dimension_values_with_attributes_to_yojson tree

let get_dimension_values_response_to_yojson (x : get_dimension_values_response) =
  assoc_to_yojson
    [
      ("DimensionValues", Some (dimension_values_with_attributes_list_to_yojson x.dimension_values));
      ("ReturnSize", Some (page_size_to_yojson x.return_size));
      ("TotalSize", Some (page_size_to_yojson x.total_size));
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let context_to_yojson (x : context) =
  match x with
  | COST_AND_USAGE -> `String "COST_AND_USAGE"
  | RESERVATIONS -> `String "RESERVATIONS"
  | SAVINGS_PLANS -> `String "SAVINGS_PLANS"

let get_dimension_values_request_to_yojson (x : get_dimension_values_request) =
  assoc_to_yojson
    [
      ("SearchString", option_to_yojson search_string_to_yojson x.search_string);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Dimension", Some (dimension_to_yojson x.dimension));
      ("Context", option_to_yojson context_to_yojson x.context);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("SortBy", option_to_yojson sort_definitions_to_yojson x.sort_by);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_cost_forecast_response_to_yojson (x : get_cost_forecast_response) =
  assoc_to_yojson
    [
      ("Total", option_to_yojson metric_value_to_yojson x.total);
      ( "ForecastResultsByTime",
        option_to_yojson forecast_results_by_time_to_yojson x.forecast_results_by_time );
    ]

let get_cost_forecast_request_to_yojson (x : get_cost_forecast_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Metric", Some (metric_to_yojson x.metric));
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ( "PredictionIntervalLevel",
        option_to_yojson prediction_interval_level_to_yojson x.prediction_interval_level );
    ]

let comparison_metric_value_to_yojson (x : comparison_metric_value) =
  assoc_to_yojson
    [
      ( "BaselineTimePeriodAmount",
        option_to_yojson generic_string_to_yojson x.baseline_time_period_amount );
      ( "ComparisonTimePeriodAmount",
        option_to_yojson generic_string_to_yojson x.comparison_time_period_amount );
      ("Difference", option_to_yojson generic_string_to_yojson x.difference);
      ("Unit", option_to_yojson generic_string_to_yojson x.unit_);
    ]

let comparison_metrics_to_yojson tree =
  map_to_yojson metric_name_to_yojson comparison_metric_value_to_yojson tree

let cost_driver_to_yojson (x : cost_driver) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson generic_string_to_yojson x.type_);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("Metrics", option_to_yojson comparison_metrics_to_yojson x.metrics);
    ]

let cost_drivers_to_yojson tree = list_to_yojson cost_driver_to_yojson tree

let cost_comparison_driver_to_yojson (x : cost_comparison_driver) =
  assoc_to_yojson
    [
      ("CostSelector", option_to_yojson expression_to_yojson x.cost_selector);
      ("Metrics", option_to_yojson comparison_metrics_to_yojson x.metrics);
      ("CostDrivers", option_to_yojson cost_drivers_to_yojson x.cost_drivers);
    ]

let cost_comparison_drivers_to_yojson tree = list_to_yojson cost_comparison_driver_to_yojson tree

let get_cost_comparison_drivers_response_to_yojson (x : get_cost_comparison_drivers_response) =
  assoc_to_yojson
    [
      ( "CostComparisonDrivers",
        option_to_yojson cost_comparison_drivers_to_yojson x.cost_comparison_drivers );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let cost_comparison_drivers_max_results_to_yojson = int_to_yojson

let get_cost_comparison_drivers_request_to_yojson (x : get_cost_comparison_drivers_request) =
  assoc_to_yojson
    [
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("BaselineTimePeriod", Some (date_interval_to_yojson x.baseline_time_period));
      ("ComparisonTimePeriod", Some (date_interval_to_yojson x.comparison_time_period));
      ("MetricForComparison", Some (metric_name_to_yojson x.metric_for_comparison));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("MaxResults", option_to_yojson cost_comparison_drivers_max_results_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let cost_category_names_list_to_yojson tree = list_to_yojson cost_category_name_to_yojson tree

let get_cost_categories_response_to_yojson (x : get_cost_categories_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "CostCategoryNames",
        option_to_yojson cost_category_names_list_to_yojson x.cost_category_names );
      ( "CostCategoryValues",
        option_to_yojson cost_category_values_list_to_yojson x.cost_category_values );
      ("ReturnSize", Some (page_size_to_yojson x.return_size));
      ("TotalSize", Some (page_size_to_yojson x.total_size));
    ]

let get_cost_categories_request_to_yojson (x : get_cost_categories_request) =
  assoc_to_yojson
    [
      ("SearchString", option_to_yojson search_string_to_yojson x.search_string);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("CostCategoryName", option_to_yojson cost_category_name_to_yojson x.cost_category_name);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("SortBy", option_to_yojson sort_definitions_to_yojson x.sort_by);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let estimated_to_yojson = bool_to_yojson
let metrics_to_yojson tree = map_to_yojson metric_name_to_yojson metric_value_to_yojson tree
let key_to_yojson = string_to_yojson
let keys_to_yojson tree = list_to_yojson key_to_yojson tree

let group_to_yojson (x : group) =
  assoc_to_yojson
    [
      ("Keys", option_to_yojson keys_to_yojson x.keys);
      ("Metrics", option_to_yojson metrics_to_yojson x.metrics);
    ]

let groups_to_yojson tree = list_to_yojson group_to_yojson tree

let result_by_time_to_yojson (x : result_by_time) =
  assoc_to_yojson
    [
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
      ("Total", option_to_yojson metrics_to_yojson x.total);
      ("Groups", option_to_yojson groups_to_yojson x.groups);
      ("Estimated", option_to_yojson estimated_to_yojson x.estimated);
    ]

let results_by_time_to_yojson tree = list_to_yojson result_by_time_to_yojson tree

let get_cost_and_usage_with_resources_response_to_yojson
    (x : get_cost_and_usage_with_resources_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("GroupDefinitions", option_to_yojson group_definitions_to_yojson x.group_definitions);
      ("ResultsByTime", option_to_yojson results_by_time_to_yojson x.results_by_time);
      ( "DimensionValueAttributes",
        option_to_yojson dimension_values_with_attributes_list_to_yojson
          x.dimension_value_attributes );
    ]

let get_cost_and_usage_with_resources_request_to_yojson
    (x : get_cost_and_usage_with_resources_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("Filter", Some (expression_to_yojson x.filter));
      ("Metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let cost_and_usage_comparison_to_yojson (x : cost_and_usage_comparison) =
  assoc_to_yojson
    [
      ("CostAndUsageSelector", option_to_yojson expression_to_yojson x.cost_and_usage_selector);
      ("Metrics", option_to_yojson comparison_metrics_to_yojson x.metrics);
    ]

let cost_and_usage_comparisons_to_yojson tree =
  list_to_yojson cost_and_usage_comparison_to_yojson tree

let get_cost_and_usage_comparisons_response_to_yojson (x : get_cost_and_usage_comparisons_response)
    =
  assoc_to_yojson
    [
      ( "CostAndUsageComparisons",
        option_to_yojson cost_and_usage_comparisons_to_yojson x.cost_and_usage_comparisons );
      ("TotalCostAndUsage", option_to_yojson comparison_metrics_to_yojson x.total_cost_and_usage);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let cost_and_usage_comparisons_max_results_to_yojson = int_to_yojson

let get_cost_and_usage_comparisons_request_to_yojson (x : get_cost_and_usage_comparisons_request) =
  assoc_to_yojson
    [
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("BaselineTimePeriod", Some (date_interval_to_yojson x.baseline_time_period));
      ("ComparisonTimePeriod", Some (date_interval_to_yojson x.comparison_time_period));
      ("MetricForComparison", Some (metric_name_to_yojson x.metric_for_comparison));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("MaxResults", option_to_yojson cost_and_usage_comparisons_max_results_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_cost_and_usage_response_to_yojson (x : get_cost_and_usage_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("GroupDefinitions", option_to_yojson group_definitions_to_yojson x.group_definitions);
      ("ResultsByTime", option_to_yojson results_by_time_to_yojson x.results_by_time);
      ( "DimensionValueAttributes",
        option_to_yojson dimension_values_with_attributes_list_to_yojson
          x.dimension_value_attributes );
    ]

let get_cost_and_usage_request_to_yojson (x : get_cost_and_usage_request) =
  assoc_to_yojson
    [
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Metrics", Some (metric_names_to_yojson x.metrics));
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let analysis_not_found_exception_to_yojson (x : analysis_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let savings_plans_purchase_analysis_details_to_yojson (x : savings_plans_purchase_analysis_details)
    =
  assoc_to_yojson
    [
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("LookbackPeriodInHours", option_to_yojson generic_string_to_yojson x.lookback_period_in_hours);
      ( "CurrentAverageCoverage",
        option_to_yojson generic_string_to_yojson x.current_average_coverage );
      ( "CurrentAverageHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_average_hourly_on_demand_spend );
      ( "CurrentMaximumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_maximum_hourly_on_demand_spend );
      ( "CurrentMinimumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_minimum_hourly_on_demand_spend );
      ("CurrentOnDemandSpend", option_to_yojson generic_string_to_yojson x.current_on_demand_spend);
      ( "ExistingHourlyCommitment",
        option_to_yojson generic_string_to_yojson x.existing_hourly_commitment );
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ( "EstimatedAverageCoverage",
        option_to_yojson generic_string_to_yojson x.estimated_average_coverage );
      ( "EstimatedAverageUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_average_utilization );
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "EstimatedCommitmentCost",
        option_to_yojson generic_string_to_yojson x.estimated_commitment_cost );
      ("LatestUsageTimestamp", option_to_yojson generic_string_to_yojson x.latest_usage_timestamp);
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
      ( "MetricsOverLookbackPeriod",
        option_to_yojson metrics_over_lookback_period_to_yojson x.metrics_over_lookback_period );
    ]

let analysis_details_to_yojson (x : analysis_details) =
  assoc_to_yojson
    [
      ( "SavingsPlansPurchaseAnalysisDetails",
        option_to_yojson savings_plans_purchase_analysis_details_to_yojson
          x.savings_plans_purchase_analysis_details );
    ]

let get_commitment_purchase_analysis_response_to_yojson
    (x : get_commitment_purchase_analysis_response) =
  assoc_to_yojson
    [
      ("EstimatedCompletionTime", Some (zoned_date_time_to_yojson x.estimated_completion_time));
      ( "AnalysisCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.analysis_completion_time );
      ("AnalysisStartedTime", Some (zoned_date_time_to_yojson x.analysis_started_time));
      ("AnalysisId", Some (analysis_id_to_yojson x.analysis_id));
      ("AnalysisStatus", Some (analysis_status_to_yojson x.analysis_status));
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("AnalysisDetails", option_to_yojson analysis_details_to_yojson x.analysis_details);
      ( "CommitmentPurchaseAnalysisConfiguration",
        Some
          (commitment_purchase_analysis_configuration_to_yojson
             x.commitment_purchase_analysis_configuration) );
    ]

let get_commitment_purchase_analysis_request_to_yojson
    (x : get_commitment_purchase_analysis_request) =
  assoc_to_yojson [ ("AnalysisId", Some (analysis_id_to_yojson x.analysis_id)) ]

let non_negative_long_to_yojson = long_to_yojson

let approximate_usage_records_per_service_to_yojson tree =
  map_to_yojson generic_string_to_yojson non_negative_long_to_yojson tree

let get_approximate_usage_records_response_to_yojson (x : get_approximate_usage_records_response) =
  assoc_to_yojson
    [
      ("Services", option_to_yojson approximate_usage_records_per_service_to_yojson x.services);
      ("TotalRecords", option_to_yojson non_negative_long_to_yojson x.total_records);
      ("LookbackPeriod", option_to_yojson date_interval_to_yojson x.lookback_period);
    ]

let approximation_dimension_to_yojson (x : approximation_dimension) =
  match x with SERVICE -> `String "SERVICE" | RESOURCE -> `String "RESOURCE"

let usage_services_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let get_approximate_usage_records_request_to_yojson (x : get_approximate_usage_records_request) =
  assoc_to_yojson
    [
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("Services", option_to_yojson usage_services_to_yojson x.services);
      ("ApproximationDimension", Some (approximation_dimension_to_yojson x.approximation_dimension));
    ]

let anomaly_subscription_to_yojson (x : anomaly_subscription) =
  assoc_to_yojson
    [
      ("SubscriptionArn", option_to_yojson generic_string_to_yojson x.subscription_arn);
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("MonitorArnList", Some (monitor_arn_list_to_yojson x.monitor_arn_list));
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
      ("Threshold", option_to_yojson nullable_non_negative_double_to_yojson x.threshold);
      ("Frequency", Some (anomaly_subscription_frequency_to_yojson x.frequency));
      ("SubscriptionName", Some (generic_string_to_yojson x.subscription_name));
      ("ThresholdExpression", option_to_yojson expression_to_yojson x.threshold_expression);
    ]

let anomaly_subscriptions_to_yojson tree = list_to_yojson anomaly_subscription_to_yojson tree

let get_anomaly_subscriptions_response_to_yojson (x : get_anomaly_subscriptions_response) =
  assoc_to_yojson
    [
      ("AnomalySubscriptions", Some (anomaly_subscriptions_to_yojson x.anomaly_subscriptions));
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_anomaly_subscriptions_request_to_yojson (x : get_anomaly_subscriptions_request) =
  assoc_to_yojson
    [
      ("SubscriptionArnList", option_to_yojson values_to_yojson x.subscription_arn_list);
      ("MonitorArn", option_to_yojson generic_string_to_yojson x.monitor_arn);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let monitor_dimension_to_yojson (x : monitor_dimension) =
  match x with
  | SERVICE -> `String "SERVICE"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | TAG -> `String "TAG"
  | COST_CATEGORY -> `String "COST_CATEGORY"

let monitor_type_to_yojson (x : monitor_type) =
  match x with DIMENSIONAL -> `String "DIMENSIONAL" | CUSTOM -> `String "CUSTOM"

let anomaly_monitor_to_yojson (x : anomaly_monitor) =
  assoc_to_yojson
    [
      ("MonitorArn", option_to_yojson generic_string_to_yojson x.monitor_arn);
      ("MonitorName", Some (generic_string_to_yojson x.monitor_name));
      ("CreationDate", option_to_yojson year_month_day_to_yojson x.creation_date);
      ("LastUpdatedDate", option_to_yojson year_month_day_to_yojson x.last_updated_date);
      ("LastEvaluatedDate", option_to_yojson year_month_day_to_yojson x.last_evaluated_date);
      ("MonitorType", Some (monitor_type_to_yojson x.monitor_type));
      ("MonitorDimension", option_to_yojson monitor_dimension_to_yojson x.monitor_dimension);
      ("MonitorSpecification", option_to_yojson expression_to_yojson x.monitor_specification);
      ( "DimensionalValueCount",
        option_to_yojson non_negative_integer_to_yojson x.dimensional_value_count );
    ]

let anomaly_monitors_to_yojson tree = list_to_yojson anomaly_monitor_to_yojson tree

let get_anomaly_monitors_response_to_yojson (x : get_anomaly_monitors_response) =
  assoc_to_yojson
    [
      ("AnomalyMonitors", Some (anomaly_monitors_to_yojson x.anomaly_monitors));
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_anomaly_monitors_request_to_yojson (x : get_anomaly_monitors_request) =
  assoc_to_yojson
    [
      ("MonitorArnList", option_to_yojson values_to_yojson x.monitor_arn_list);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let generic_double_to_yojson = double_to_yojson

let impact_to_yojson (x : impact) =
  assoc_to_yojson
    [
      ("MaxImpact", Some (generic_double_to_yojson x.max_impact));
      ("TotalImpact", option_to_yojson generic_double_to_yojson x.total_impact);
      ( "TotalActualSpend",
        option_to_yojson nullable_non_negative_double_to_yojson x.total_actual_spend );
      ( "TotalExpectedSpend",
        option_to_yojson nullable_non_negative_double_to_yojson x.total_expected_spend );
      ( "TotalImpactPercentage",
        option_to_yojson nullable_non_negative_double_to_yojson x.total_impact_percentage );
    ]

let anomaly_score_to_yojson (x : anomaly_score) =
  assoc_to_yojson
    [
      ("MaxScore", Some (generic_double_to_yojson x.max_score));
      ("CurrentScore", Some (generic_double_to_yojson x.current_score));
    ]

let root_cause_impact_to_yojson (x : root_cause_impact) =
  assoc_to_yojson [ ("Contribution", Some (generic_double_to_yojson x.contribution)) ]

let root_cause_to_yojson (x : root_cause) =
  assoc_to_yojson
    [
      ("Service", option_to_yojson generic_string_to_yojson x.service);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("LinkedAccount", option_to_yojson generic_string_to_yojson x.linked_account);
      ("LinkedAccountName", option_to_yojson generic_string_to_yojson x.linked_account_name);
      ("UsageType", option_to_yojson generic_string_to_yojson x.usage_type);
      ("Impact", option_to_yojson root_cause_impact_to_yojson x.impact);
    ]

let root_causes_to_yojson tree = list_to_yojson root_cause_to_yojson tree

let anomaly_to_yojson (x : anomaly) =
  assoc_to_yojson
    [
      ("AnomalyId", Some (generic_string_to_yojson x.anomaly_id));
      ("AnomalyStartDate", option_to_yojson year_month_day_to_yojson x.anomaly_start_date);
      ("AnomalyEndDate", option_to_yojson year_month_day_to_yojson x.anomaly_end_date);
      ("DimensionValue", option_to_yojson generic_string_to_yojson x.dimension_value);
      ("RootCauses", option_to_yojson root_causes_to_yojson x.root_causes);
      ("AnomalyScore", Some (anomaly_score_to_yojson x.anomaly_score));
      ("Impact", Some (impact_to_yojson x.impact));
      ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn));
      ("Feedback", option_to_yojson anomaly_feedback_type_to_yojson x.feedback);
    ]

let anomalies_to_yojson tree = list_to_yojson anomaly_to_yojson tree

let get_anomalies_response_to_yojson (x : get_anomalies_response) =
  assoc_to_yojson
    [
      ("Anomalies", Some (anomalies_to_yojson x.anomalies));
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let numeric_operator_to_yojson (x : numeric_operator) =
  match x with
  | EQUAL -> `String "EQUAL"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | LESS_THAN_OR_EQUAL -> `String "LESS_THAN_OR_EQUAL"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN -> `String "LESS_THAN"
  | BETWEEN -> `String "BETWEEN"

let total_impact_filter_to_yojson (x : total_impact_filter) =
  assoc_to_yojson
    [
      ("NumericOperator", Some (numeric_operator_to_yojson x.numeric_operator));
      ("StartValue", Some (generic_double_to_yojson x.start_value));
      ("EndValue", option_to_yojson generic_double_to_yojson x.end_value);
    ]

let anomaly_date_interval_to_yojson (x : anomaly_date_interval) =
  assoc_to_yojson
    [
      ("StartDate", Some (year_month_day_to_yojson x.start_date));
      ("EndDate", option_to_yojson year_month_day_to_yojson x.end_date);
    ]

let get_anomalies_request_to_yojson (x : get_anomalies_request) =
  assoc_to_yojson
    [
      ("MonitorArn", option_to_yojson generic_string_to_yojson x.monitor_arn);
      ("DateInterval", Some (anomaly_date_interval_to_yojson x.date_interval));
      ("Feedback", option_to_yojson anomaly_feedback_type_to_yojson x.feedback);
      ("TotalImpact", option_to_yojson total_impact_filter_to_yojson x.total_impact);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let cost_category_to_yojson (x : cost_category) =
  assoc_to_yojson
    [
      ("CostCategoryArn", Some (arn_to_yojson x.cost_category_arn));
      ("EffectiveStart", Some (zoned_date_time_to_yojson x.effective_start));
      ("EffectiveEnd", option_to_yojson zoned_date_time_to_yojson x.effective_end);
      ("Name", Some (cost_category_name_to_yojson x.name));
      ("RuleVersion", Some (cost_category_rule_version_to_yojson x.rule_version));
      ("Rules", Some (cost_category_rules_list_to_yojson x.rules));
      ( "SplitChargeRules",
        option_to_yojson cost_category_split_charge_rules_list_to_yojson x.split_charge_rules );
      ( "ProcessingStatus",
        option_to_yojson cost_category_processing_status_list_to_yojson x.processing_status );
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
    ]

let describe_cost_category_definition_response_to_yojson
    (x : describe_cost_category_definition_response) =
  assoc_to_yojson [ ("CostCategory", option_to_yojson cost_category_to_yojson x.cost_category) ]

let describe_cost_category_definition_request_to_yojson
    (x : describe_cost_category_definition_request) =
  assoc_to_yojson
    [
      ("CostCategoryArn", Some (arn_to_yojson x.cost_category_arn));
      ("EffectiveOn", option_to_yojson zoned_date_time_to_yojson x.effective_on);
    ]

let delete_cost_category_definition_response_to_yojson
    (x : delete_cost_category_definition_response) =
  assoc_to_yojson
    [
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
      ("EffectiveEnd", option_to_yojson zoned_date_time_to_yojson x.effective_end);
    ]

let delete_cost_category_definition_request_to_yojson (x : delete_cost_category_definition_request)
    =
  assoc_to_yojson [ ("CostCategoryArn", Some (arn_to_yojson x.cost_category_arn)) ]

let delete_anomaly_subscription_response_to_yojson = unit_to_yojson

let delete_anomaly_subscription_request_to_yojson (x : delete_anomaly_subscription_request) =
  assoc_to_yojson [ ("SubscriptionArn", Some (generic_string_to_yojson x.subscription_arn)) ]

let delete_anomaly_monitor_response_to_yojson = unit_to_yojson

let delete_anomaly_monitor_request_to_yojson (x : delete_anomaly_monitor_request) =
  assoc_to_yojson [ ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn)) ]

let create_cost_category_definition_response_to_yojson
    (x : create_cost_category_definition_response) =
  assoc_to_yojson
    [
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
    ]

let create_cost_category_definition_request_to_yojson (x : create_cost_category_definition_request)
    =
  assoc_to_yojson
    [
      ("Name", Some (cost_category_name_to_yojson x.name));
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("RuleVersion", Some (cost_category_rule_version_to_yojson x.rule_version));
      ("Rules", Some (cost_category_rules_list_to_yojson x.rules));
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
      ( "SplitChargeRules",
        option_to_yojson cost_category_split_charge_rules_list_to_yojson x.split_charge_rules );
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]

let create_anomaly_subscription_response_to_yojson (x : create_anomaly_subscription_response) =
  assoc_to_yojson [ ("SubscriptionArn", Some (generic_string_to_yojson x.subscription_arn)) ]

let create_anomaly_subscription_request_to_yojson (x : create_anomaly_subscription_request) =
  assoc_to_yojson
    [
      ("AnomalySubscription", Some (anomaly_subscription_to_yojson x.anomaly_subscription));
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]

let create_anomaly_monitor_response_to_yojson (x : create_anomaly_monitor_response) =
  assoc_to_yojson [ ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn)) ]

let create_anomaly_monitor_request_to_yojson (x : create_anomaly_monitor_request) =
  assoc_to_yojson
    [
      ("AnomalyMonitor", Some (anomaly_monitor_to_yojson x.anomaly_monitor));
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]
