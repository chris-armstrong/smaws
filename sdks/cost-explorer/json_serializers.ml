open Smaws_Lib.Json.SerializeHelpers
open Types

let zoned_date_time_to_yojson = string_to_yojson
let year_month_day_to_yojson = string_to_yojson
let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree

let date_interval_to_yojson (x : date_interval) =
  assoc_to_yojson
    [
      ("End", Some (year_month_day_to_yojson x.end_));
      ("Start", Some (year_month_day_to_yojson x.start));
    ]

let reservation_group_key_to_yojson = string_to_yojson
let reservation_group_value_to_yojson = string_to_yojson
let attribute_value_to_yojson = string_to_yojson
let attribute_type_to_yojson = string_to_yojson

let attributes_to_yojson tree =
  map_to_yojson attribute_type_to_yojson attribute_value_to_yojson tree

let utilization_percentage_to_yojson = string_to_yojson
let utilization_percentage_in_units_to_yojson = string_to_yojson
let purchased_hours_to_yojson = string_to_yojson
let purchased_units_to_yojson = string_to_yojson
let total_actual_hours_to_yojson = string_to_yojson
let total_actual_units_to_yojson = string_to_yojson
let unused_hours_to_yojson = string_to_yojson
let unused_units_to_yojson = string_to_yojson
let on_demand_cost_of_ri_hours_used_to_yojson = string_to_yojson
let net_ri_savings_to_yojson = string_to_yojson
let total_potential_ri_savings_to_yojson = string_to_yojson
let amortized_upfront_fee_to_yojson = string_to_yojson
let amortized_recurring_fee_to_yojson = string_to_yojson
let total_amortized_fee_to_yojson = string_to_yojson
let ri_cost_for_unused_hours_to_yojson = string_to_yojson
let realized_savings_to_yojson = string_to_yojson
let unrealized_savings_to_yojson = string_to_yojson

let reservation_aggregates_to_yojson (x : reservation_aggregates) =
  assoc_to_yojson
    [
      ("UnrealizedSavings", option_to_yojson unrealized_savings_to_yojson x.unrealized_savings);
      ("RealizedSavings", option_to_yojson realized_savings_to_yojson x.realized_savings);
      ( "RICostForUnusedHours",
        option_to_yojson ri_cost_for_unused_hours_to_yojson x.ri_cost_for_unused_hours );
      ("TotalAmortizedFee", option_to_yojson total_amortized_fee_to_yojson x.total_amortized_fee);
      ( "AmortizedRecurringFee",
        option_to_yojson amortized_recurring_fee_to_yojson x.amortized_recurring_fee );
      ( "AmortizedUpfrontFee",
        option_to_yojson amortized_upfront_fee_to_yojson x.amortized_upfront_fee );
      ( "TotalPotentialRISavings",
        option_to_yojson total_potential_ri_savings_to_yojson x.total_potential_ri_savings );
      ("NetRISavings", option_to_yojson net_ri_savings_to_yojson x.net_ri_savings);
      ( "OnDemandCostOfRIHoursUsed",
        option_to_yojson on_demand_cost_of_ri_hours_used_to_yojson x.on_demand_cost_of_ri_hours_used
      );
      ("UnusedUnits", option_to_yojson unused_units_to_yojson x.unused_units);
      ("UnusedHours", option_to_yojson unused_hours_to_yojson x.unused_hours);
      ("TotalActualUnits", option_to_yojson total_actual_units_to_yojson x.total_actual_units);
      ("TotalActualHours", option_to_yojson total_actual_hours_to_yojson x.total_actual_hours);
      ("PurchasedUnits", option_to_yojson purchased_units_to_yojson x.purchased_units);
      ("PurchasedHours", option_to_yojson purchased_hours_to_yojson x.purchased_hours);
      ( "UtilizationPercentageInUnits",
        option_to_yojson utilization_percentage_in_units_to_yojson x.utilization_percentage_in_units
      );
      ( "UtilizationPercentage",
        option_to_yojson utilization_percentage_to_yojson x.utilization_percentage );
    ]

let reservation_utilization_group_to_yojson (x : reservation_utilization_group) =
  assoc_to_yojson
    [
      ("Utilization", option_to_yojson reservation_aggregates_to_yojson x.utilization);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("Value", option_to_yojson reservation_group_value_to_yojson x.value);
      ("Key", option_to_yojson reservation_group_key_to_yojson x.key);
    ]

let reservation_utilization_groups_to_yojson tree =
  list_to_yojson reservation_utilization_group_to_yojson tree

let utilization_by_time_to_yojson (x : utilization_by_time) =
  assoc_to_yojson
    [
      ("Total", option_to_yojson reservation_aggregates_to_yojson x.total);
      ("Groups", option_to_yojson reservation_utilization_groups_to_yojson x.groups);
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
    ]

let utilizations_by_time_to_yojson tree = list_to_yojson utilization_by_time_to_yojson tree
let generic_string_to_yojson = string_to_yojson
let usage_services_to_yojson tree = list_to_yojson generic_string_to_yojson tree
let arn_to_yojson = string_to_yojson

let update_cost_category_definition_response_to_yojson
    (x : update_cost_category_definition_response) =
  assoc_to_yojson
    [
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
    ]

let cost_category_rule_version_to_yojson (x : cost_category_rule_version) =
  match x with CostCategoryExpressionV1 -> `String "CostCategoryExpression.v1"

let cost_category_value_to_yojson = string_to_yojson

let dimension_to_yojson (x : dimension) =
  match x with
  | ANOMALY_TOTAL_IMPACT_PERCENTAGE -> `String "ANOMALY_TOTAL_IMPACT_PERCENTAGE"
  | ANOMALY_TOTAL_IMPACT_ABSOLUTE -> `String "ANOMALY_TOTAL_IMPACT_ABSOLUTE"
  | INVOICING_ENTITY -> `String "INVOICING_ENTITY"
  | AGREEMENT_END_DATE_TIME_BEFORE -> `String "AGREEMENT_END_DATE_TIME_BEFORE"
  | AGREEMENT_END_DATE_TIME_AFTER -> `String "AGREEMENT_END_DATE_TIME_AFTER"
  | PAYMENT_OPTION -> `String "PAYMENT_OPTION"
  | SAVINGS_PLAN_ARN -> `String "SAVINGS_PLAN_ARN"
  | SAVINGS_PLANS_TYPE -> `String "SAVINGS_PLANS_TYPE"
  | RIGHTSIZING_TYPE -> `String "RIGHTSIZING_TYPE"
  | RESOURCE_ID -> `String "RESOURCE_ID"
  | RESERVATION_ID -> `String "RESERVATION_ID"
  | BILLING_ENTITY -> `String "BILLING_ENTITY"
  | INSTANCE_TYPE_FAMILY -> `String "INSTANCE_TYPE_FAMILY"
  | CACHE_ENGINE -> `String "CACHE_ENGINE"
  | DATABASE_ENGINE -> `String "DATABASE_ENGINE"
  | DEPLOYMENT_OPTION -> `String "DEPLOYMENT_OPTION"
  | LEGAL_ENTITY_NAME -> `String "LEGAL_ENTITY_NAME"
  | SUBSCRIPTION_ID -> `String "SUBSCRIPTION_ID"
  | PLATFORM -> `String "PLATFORM"
  | SCOPE -> `String "SCOPE"
  | TENANCY -> `String "TENANCY"
  | OPERATING_SYSTEM -> `String "OPERATING_SYSTEM"
  | RECORD_TYPE -> `String "RECORD_TYPE"
  | USAGE_TYPE_GROUP -> `String "USAGE_TYPE_GROUP"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | SERVICE -> `String "SERVICE"
  | REGION -> `String "REGION"
  | PURCHASE_TYPE -> `String "PURCHASE_TYPE"
  | OPERATION -> `String "OPERATION"
  | LINKED_ACCOUNT_NAME -> `String "LINKED_ACCOUNT_NAME"
  | PAYER_ACCOUNT -> `String "PAYER_ACCOUNT"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | INSTANCE_TYPE -> `String "INSTANCE_TYPE"
  | AZ -> `String "AZ"

let match_option_to_yojson (x : match_option) =
  match x with
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | CASE_INSENSITIVE -> `String "CASE_INSENSITIVE"
  | CASE_SENSITIVE -> `String "CASE_SENSITIVE"
  | CONTAINS -> `String "CONTAINS"
  | ENDS_WITH -> `String "ENDS_WITH"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ABSENT -> `String "ABSENT"
  | EQUALS -> `String "EQUALS"

let match_options_to_yojson tree = list_to_yojson match_option_to_yojson tree

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("Key", option_to_yojson dimension_to_yojson x.key);
    ]

let tag_key_to_yojson = string_to_yojson

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let cost_category_name_to_yojson = string_to_yojson

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("MatchOptions", option_to_yojson match_options_to_yojson x.match_options);
      ("Values", option_to_yojson values_to_yojson x.values);
      ("Key", option_to_yojson cost_category_name_to_yojson x.key);
    ]

let rec expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("CostCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
      ("Tags", option_to_yojson tag_values_to_yojson x.tags);
      ("Dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
      ("Not", option_to_yojson expression_to_yojson x.not);
      ("And", option_to_yojson expressions_to_yojson x.and_);
      ("Or", option_to_yojson expressions_to_yojson x.\#or);
    ]

and expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

let cost_category_inherited_value_dimension_name_to_yojson
    (x : cost_category_inherited_value_dimension_name) =
  match x with TAG -> `String "TAG" | LINKED_ACCOUNT_NAME -> `String "LINKED_ACCOUNT_NAME"

let cost_category_inherited_value_dimension_to_yojson (x : cost_category_inherited_value_dimension)
    =
  assoc_to_yojson
    [
      ("DimensionKey", option_to_yojson generic_string_to_yojson x.dimension_key);
      ( "DimensionName",
        option_to_yojson cost_category_inherited_value_dimension_name_to_yojson x.dimension_name );
    ]

let cost_category_rule_type_to_yojson (x : cost_category_rule_type) =
  match x with INHERITED_VALUE -> `String "INHERITED_VALUE" | REGULAR -> `String "REGULAR"

let cost_category_rule_to_yojson (x : cost_category_rule) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson cost_category_rule_type_to_yojson x.type_);
      ( "InheritedValue",
        option_to_yojson cost_category_inherited_value_dimension_to_yojson x.inherited_value );
      ("Rule", option_to_yojson expression_to_yojson x.rule);
      ("Value", option_to_yojson cost_category_value_to_yojson x.value);
    ]

let cost_category_rules_list_to_yojson tree = list_to_yojson cost_category_rule_to_yojson tree

let cost_category_split_charge_rule_targets_list_to_yojson tree =
  list_to_yojson generic_string_to_yojson tree

let cost_category_split_charge_method_to_yojson (x : cost_category_split_charge_method) =
  match x with
  | EVEN -> `String "EVEN"
  | PROPORTIONAL -> `String "PROPORTIONAL"
  | FIXED -> `String "FIXED"

let cost_category_split_charge_rule_parameter_type_to_yojson
    (x : cost_category_split_charge_rule_parameter_type) =
  match x with ALLOCATION_PERCENTAGES -> `String "ALLOCATION_PERCENTAGES"

let cost_category_split_charge_rule_parameter_values_list_to_yojson tree =
  list_to_yojson generic_string_to_yojson tree

let cost_category_split_charge_rule_parameter_to_yojson
    (x : cost_category_split_charge_rule_parameter) =
  assoc_to_yojson
    [
      ("Values", Some (cost_category_split_charge_rule_parameter_values_list_to_yojson x.values));
      ("Type", Some (cost_category_split_charge_rule_parameter_type_to_yojson x.type_));
    ]

let cost_category_split_charge_rule_parameters_list_to_yojson tree =
  list_to_yojson cost_category_split_charge_rule_parameter_to_yojson tree

let cost_category_split_charge_rule_to_yojson (x : cost_category_split_charge_rule) =
  assoc_to_yojson
    [
      ( "Parameters",
        option_to_yojson cost_category_split_charge_rule_parameters_list_to_yojson x.parameters );
      ("Method", Some (cost_category_split_charge_method_to_yojson x.method_));
      ("Targets", Some (cost_category_split_charge_rule_targets_list_to_yojson x.targets));
      ("Source", Some (generic_string_to_yojson x.source));
    ]

let cost_category_split_charge_rules_list_to_yojson tree =
  list_to_yojson cost_category_split_charge_rule_to_yojson tree

let update_cost_category_definition_request_to_yojson (x : update_cost_category_definition_request)
    =
  assoc_to_yojson
    [
      ( "SplitChargeRules",
        option_to_yojson cost_category_split_charge_rules_list_to_yojson x.split_charge_rules );
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
      ("Rules", Some (cost_category_rules_list_to_yojson x.rules));
      ("RuleVersion", Some (cost_category_rule_version_to_yojson x.rule_version));
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("CostCategoryArn", Some (arn_to_yojson x.cost_category_arn));
    ]

let error_message_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceName", option_to_yojson arn_to_yojson x.resource_name);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_cost_allocation_tags_status_error_to_yojson
    (x : update_cost_allocation_tags_status_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Code", option_to_yojson generic_string_to_yojson x.code);
      ("TagKey", option_to_yojson tag_key_to_yojson x.tag_key);
    ]

let update_cost_allocation_tags_status_errors_to_yojson tree =
  list_to_yojson update_cost_allocation_tags_status_error_to_yojson tree

let update_cost_allocation_tags_status_response_to_yojson
    (x : update_cost_allocation_tags_status_response) =
  assoc_to_yojson
    [ ("Errors", option_to_yojson update_cost_allocation_tags_status_errors_to_yojson x.errors) ]

let cost_allocation_tag_status_to_yojson (x : cost_allocation_tag_status) =
  match x with INACTIVE -> `String "Inactive" | ACTIVE -> `String "Active"

let cost_allocation_tag_status_entry_to_yojson (x : cost_allocation_tag_status_entry) =
  assoc_to_yojson
    [
      ("Status", Some (cost_allocation_tag_status_to_yojson x.status));
      ("TagKey", Some (tag_key_to_yojson x.tag_key));
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

let update_anomaly_subscription_response_to_yojson (x : update_anomaly_subscription_response) =
  assoc_to_yojson [ ("SubscriptionArn", Some (generic_string_to_yojson x.subscription_arn)) ]

let nullable_non_negative_double_to_yojson = double_to_yojson

let anomaly_subscription_frequency_to_yojson (x : anomaly_subscription_frequency) =
  match x with
  | WEEKLY -> `String "WEEKLY"
  | IMMEDIATE -> `String "IMMEDIATE"
  | DAILY -> `String "DAILY"

let monitor_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let subscriber_address_to_yojson = string_to_yojson

let subscriber_type_to_yojson (x : subscriber_type) =
  match x with SNS -> `String "SNS" | EMAIL -> `String "EMAIL"

let subscriber_status_to_yojson (x : subscriber_status) =
  match x with DECLINED -> `String "DECLINED" | CONFIRMED -> `String "CONFIRMED"

let subscriber_to_yojson (x : subscriber) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson subscriber_status_to_yojson x.status);
      ("Type", option_to_yojson subscriber_type_to_yojson x.type_);
      ("Address", option_to_yojson subscriber_address_to_yojson x.address);
    ]

let subscribers_to_yojson tree = list_to_yojson subscriber_to_yojson tree

let update_anomaly_subscription_request_to_yojson (x : update_anomaly_subscription_request) =
  assoc_to_yojson
    [
      ("ThresholdExpression", option_to_yojson expression_to_yojson x.threshold_expression);
      ("SubscriptionName", option_to_yojson generic_string_to_yojson x.subscription_name);
      ("Subscribers", option_to_yojson subscribers_to_yojson x.subscribers);
      ("MonitorArnList", option_to_yojson monitor_arn_list_to_yojson x.monitor_arn_list);
      ("Frequency", option_to_yojson anomaly_subscription_frequency_to_yojson x.frequency);
      ("Threshold", option_to_yojson nullable_non_negative_double_to_yojson x.threshold);
      ("SubscriptionArn", Some (generic_string_to_yojson x.subscription_arn));
    ]

let unknown_subscription_exception_to_yojson (x : unknown_subscription_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let unknown_monitor_exception_to_yojson (x : unknown_monitor_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_anomaly_monitor_response_to_yojson (x : update_anomaly_monitor_response) =
  assoc_to_yojson [ ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn)) ]

let update_anomaly_monitor_request_to_yojson (x : update_anomaly_monitor_request) =
  assoc_to_yojson
    [
      ("MonitorName", option_to_yojson generic_string_to_yojson x.monitor_name);
      ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let unresolvable_usage_unit_exception_to_yojson (x : unresolvable_usage_unit_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let total_running_normalized_units_to_yojson = string_to_yojson
let total_running_hours_to_yojson = string_to_yojson

let numeric_operator_to_yojson (x : numeric_operator) =
  match x with
  | BETWEEN -> `String "BETWEEN"
  | LESS_THAN -> `String "LESS_THAN"
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN_OR_EQUAL -> `String "LESS_THAN_OR_EQUAL"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | EQUAL -> `String "EQUAL"

let generic_double_to_yojson = double_to_yojson

let total_impact_filter_to_yojson (x : total_impact_filter) =
  assoc_to_yojson
    [
      ("EndValue", option_to_yojson generic_double_to_yojson x.end_value);
      ("StartValue", Some (generic_double_to_yojson x.start_value));
      ("NumericOperator", Some (numeric_operator_to_yojson x.numeric_operator));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("ResourceName", option_to_yojson arn_to_yojson x.resource_name);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let terminate_recommendation_detail_to_yojson (x : terminate_recommendation_detail) =
  assoc_to_yojson
    [
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ( "EstimatedMonthlySavings",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings );
    ]

let term_in_years_to_yojson (x : term_in_years) =
  match x with THREE_YEARS -> `String "THREE_YEARS" | ONE_YEAR -> `String "ONE_YEAR"

let generic_boolean_to_yojson = bool_to_yojson

let ec2_resource_details_to_yojson (x : ec2_resource_details) =
  assoc_to_yojson
    [
      ("Vcpu", option_to_yojson generic_string_to_yojson x.vcpu);
      ("Storage", option_to_yojson generic_string_to_yojson x.storage);
      ("NetworkPerformance", option_to_yojson generic_string_to_yojson x.network_performance);
      ("Memory", option_to_yojson generic_string_to_yojson x.memory);
      ("Sku", option_to_yojson generic_string_to_yojson x.sku);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("Platform", option_to_yojson generic_string_to_yojson x.platform);
      ("InstanceType", option_to_yojson generic_string_to_yojson x.instance_type);
      ("HourlyOnDemandRate", option_to_yojson generic_string_to_yojson x.hourly_on_demand_rate);
    ]

let resource_details_to_yojson (x : resource_details) =
  assoc_to_yojson
    [
      ("EC2ResourceDetails", option_to_yojson ec2_resource_details_to_yojson x.ec2_resource_details);
    ]

let ebs_resource_utilization_to_yojson (x : ebs_resource_utilization) =
  assoc_to_yojson
    [
      ( "EbsWriteBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.ebs_write_bytes_per_second );
      ( "EbsReadBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.ebs_read_bytes_per_second );
      ("EbsWriteOpsPerSecond", option_to_yojson generic_string_to_yojson x.ebs_write_ops_per_second);
      ("EbsReadOpsPerSecond", option_to_yojson generic_string_to_yojson x.ebs_read_ops_per_second);
    ]

let disk_resource_utilization_to_yojson (x : disk_resource_utilization) =
  assoc_to_yojson
    [
      ( "DiskWriteBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.disk_write_bytes_per_second );
      ( "DiskReadBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.disk_read_bytes_per_second );
      ( "DiskWriteOpsPerSecond",
        option_to_yojson generic_string_to_yojson x.disk_write_ops_per_second );
      ("DiskReadOpsPerSecond", option_to_yojson generic_string_to_yojson x.disk_read_ops_per_second);
    ]

let network_resource_utilization_to_yojson (x : network_resource_utilization) =
  assoc_to_yojson
    [
      ( "NetworkPacketsOutPerSecond",
        option_to_yojson generic_string_to_yojson x.network_packets_out_per_second );
      ( "NetworkPacketsInPerSecond",
        option_to_yojson generic_string_to_yojson x.network_packets_in_per_second );
      ( "NetworkOutBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.network_out_bytes_per_second );
      ( "NetworkInBytesPerSecond",
        option_to_yojson generic_string_to_yojson x.network_in_bytes_per_second );
    ]

let ec2_resource_utilization_to_yojson (x : ec2_resource_utilization) =
  assoc_to_yojson
    [
      ( "NetworkResourceUtilization",
        option_to_yojson network_resource_utilization_to_yojson x.network_resource_utilization );
      ( "DiskResourceUtilization",
        option_to_yojson disk_resource_utilization_to_yojson x.disk_resource_utilization );
      ( "EBSResourceUtilization",
        option_to_yojson ebs_resource_utilization_to_yojson x.ebs_resource_utilization );
      ( "MaxStorageUtilizationPercentage",
        option_to_yojson generic_string_to_yojson x.max_storage_utilization_percentage );
      ( "MaxMemoryUtilizationPercentage",
        option_to_yojson generic_string_to_yojson x.max_memory_utilization_percentage );
      ( "MaxCpuUtilizationPercentage",
        option_to_yojson generic_string_to_yojson x.max_cpu_utilization_percentage );
    ]

let resource_utilization_to_yojson (x : resource_utilization) =
  assoc_to_yojson
    [
      ( "EC2ResourceUtilization",
        option_to_yojson ec2_resource_utilization_to_yojson x.ec2_resource_utilization );
    ]

let platform_difference_to_yojson (x : platform_difference) =
  match x with
  | VIRTUALIZATION_TYPE -> `String "VIRTUALIZATION_TYPE"
  | INSTANCE_STORE_AVAILABILITY -> `String "INSTANCE_STORE_AVAILABILITY"
  | STORAGE_INTERFACE -> `String "STORAGE_INTERFACE"
  | NETWORK_INTERFACE -> `String "NETWORK_INTERFACE"
  | HYPERVISOR -> `String "HYPERVISOR"

let platform_differences_to_yojson tree = list_to_yojson platform_difference_to_yojson tree

let target_instance_to_yojson (x : target_instance) =
  assoc_to_yojson
    [
      ("PlatformDifferences", option_to_yojson platform_differences_to_yojson x.platform_differences);
      ( "ExpectedResourceUtilization",
        option_to_yojson resource_utilization_to_yojson x.expected_resource_utilization );
      ("ResourceDetails", option_to_yojson resource_details_to_yojson x.resource_details);
      ("DefaultTargetInstance", option_to_yojson generic_boolean_to_yojson x.default_target_instance);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ( "EstimatedMonthlySavings",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings );
      ("EstimatedMonthlyCost", option_to_yojson generic_string_to_yojson x.estimated_monthly_cost);
    ]

let target_instances_list_to_yojson tree = list_to_yojson target_instance_to_yojson tree
let tag_values_list_to_yojson tree = list_to_yojson tag_values_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Value", Some (resource_tag_value_to_yojson x.value));
      ("Key", Some (resource_tag_key_to_yojson x.key));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let entity_to_yojson = string_to_yojson
let tag_list_to_yojson tree = list_to_yojson entity_to_yojson tree

let supported_savings_plans_type_to_yojson (x : supported_savings_plans_type) =
  match x with
  | DATABASE_SP -> `String "DATABASE_SP"
  | SAGEMAKER_SP -> `String "SAGEMAKER_SP"
  | EC2_INSTANCE_SP -> `String "EC2_INSTANCE_SP"
  | COMPUTE_SP -> `String "COMPUTE_SP"

let recommendation_id_to_yojson = string_to_yojson

let start_savings_plans_purchase_recommendation_generation_response_to_yojson
    (x : start_savings_plans_purchase_recommendation_generation_response) =
  assoc_to_yojson
    [
      ( "EstimatedCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.estimated_completion_time );
      ("GenerationStartedTime", option_to_yojson zoned_date_time_to_yojson x.generation_started_time);
      ("RecommendationId", option_to_yojson recommendation_id_to_yojson x.recommendation_id);
    ]

let start_savings_plans_purchase_recommendation_generation_request_to_yojson = unit_to_yojson

let generation_exists_exception_to_yojson (x : generation_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let data_unavailable_exception_to_yojson (x : data_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let cost_allocation_tag_backfill_status_to_yojson (x : cost_allocation_tag_backfill_status) =
  match x with
  | FAILED -> `String "FAILED"
  | PROCESSING -> `String "PROCESSING"
  | SUCCEEDED -> `String "SUCCEEDED"

let cost_allocation_tag_backfill_request_to_yojson (x : cost_allocation_tag_backfill_request) =
  assoc_to_yojson
    [
      ("LastUpdatedAt", option_to_yojson zoned_date_time_to_yojson x.last_updated_at);
      ( "BackfillStatus",
        option_to_yojson cost_allocation_tag_backfill_status_to_yojson x.backfill_status );
      ("CompletedAt", option_to_yojson zoned_date_time_to_yojson x.completed_at);
      ("RequestedAt", option_to_yojson zoned_date_time_to_yojson x.requested_at);
      ("BackfillFrom", option_to_yojson zoned_date_time_to_yojson x.backfill_from);
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

let backfill_limit_exceeded_exception_to_yojson (x : backfill_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let analysis_id_to_yojson = string_to_yojson

let start_commitment_purchase_analysis_response_to_yojson
    (x : start_commitment_purchase_analysis_response) =
  assoc_to_yojson
    [
      ("EstimatedCompletionTime", Some (zoned_date_time_to_yojson x.estimated_completion_time));
      ("AnalysisStartedTime", Some (zoned_date_time_to_yojson x.analysis_started_time));
      ("AnalysisId", Some (analysis_id_to_yojson x.analysis_id));
    ]

let account_scope_to_yojson (x : account_scope) =
  match x with LINKED -> `String "LINKED" | PAYER -> `String "PAYER"

let account_id_to_yojson = string_to_yojson

let analysis_type_to_yojson (x : analysis_type) =
  match x with
  | TARGET_AVERAGE_COVERAGE -> `String "TARGET_AVERAGE_COVERAGE"
  | CUSTOM_COMMITMENT -> `String "CUSTOM_COMMITMENT"
  | MAX_SAVINGS -> `String "MAX_SAVINGS"

let payment_option_to_yojson (x : payment_option) =
  match x with
  | HEAVY_UTILIZATION -> `String "HEAVY_UTILIZATION"
  | MEDIUM_UTILIZATION -> `String "MEDIUM_UTILIZATION"
  | LIGHT_UTILIZATION -> `String "LIGHT_UTILIZATION"
  | ALL_UPFRONT -> `String "ALL_UPFRONT"
  | PARTIAL_UPFRONT -> `String "PARTIAL_UPFRONT"
  | NO_UPFRONT -> `String "NO_UPFRONT"

let savings_plans_commitment_to_yojson = double_to_yojson

let savings_plans_to_yojson (x : savings_plans) =
  assoc_to_yojson
    [
      ("OfferingId", option_to_yojson generic_string_to_yojson x.offering_id);
      ( "SavingsPlansCommitment",
        option_to_yojson savings_plans_commitment_to_yojson x.savings_plans_commitment );
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ("InstanceFamily", option_to_yojson generic_string_to_yojson x.instance_family);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ( "SavingsPlansType",
        option_to_yojson supported_savings_plans_type_to_yojson x.savings_plans_type );
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
    ]

let savings_plans_to_add_to_yojson tree = list_to_yojson savings_plans_to_yojson tree
let savings_plans_id_to_yojson = string_to_yojson
let savings_plans_to_exclude_to_yojson tree = list_to_yojson savings_plans_id_to_yojson tree
let savings_plans_target_coverage_to_yojson = int_to_yojson

let savings_plans_purchase_analysis_configuration_to_yojson
    (x : savings_plans_purchase_analysis_configuration) =
  assoc_to_yojson
    [
      ( "SavingsPlansTargetCoverage",
        option_to_yojson savings_plans_target_coverage_to_yojson x.savings_plans_target_coverage );
      ("LookBackTimePeriod", Some (date_interval_to_yojson x.look_back_time_period));
      ( "SavingsPlansToExclude",
        option_to_yojson savings_plans_to_exclude_to_yojson x.savings_plans_to_exclude );
      ("SavingsPlansToAdd", Some (savings_plans_to_add_to_yojson x.savings_plans_to_add));
      ("AnalysisType", Some (analysis_type_to_yojson x.analysis_type));
      ("AccountId", option_to_yojson account_id_to_yojson x.account_id);
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
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

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let sort_definition_key_to_yojson = string_to_yojson

let sort_definition_to_yojson (x : sort_definition) =
  assoc_to_yojson
    [
      ("SortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("Key", Some (sort_definition_key_to_yojson x.key));
    ]

let sort_definitions_to_yojson tree = list_to_yojson sort_definition_to_yojson tree

let offering_class_to_yojson (x : offering_class) =
  match x with CONVERTIBLE -> `String "CONVERTIBLE" | STANDARD -> `String "STANDARD"

let ec2_specification_to_yojson (x : ec2_specification) =
  assoc_to_yojson [ ("OfferingClass", option_to_yojson offering_class_to_yojson x.offering_class) ]

let service_specification_to_yojson (x : service_specification) =
  assoc_to_yojson
    [ ("EC2Specification", option_to_yojson ec2_specification_to_yojson x.ec2_specification) ]

let search_string_to_yojson = string_to_yojson

let savings_plans_utilization_to_yojson (x : savings_plans_utilization) =
  assoc_to_yojson
    [
      ("UtilizationPercentage", option_to_yojson generic_string_to_yojson x.utilization_percentage);
      ("UnusedCommitment", option_to_yojson generic_string_to_yojson x.unused_commitment);
      ("UsedCommitment", option_to_yojson generic_string_to_yojson x.used_commitment);
      ("TotalCommitment", option_to_yojson generic_string_to_yojson x.total_commitment);
    ]

let savings_plans_savings_to_yojson (x : savings_plans_savings) =
  assoc_to_yojson
    [
      ( "OnDemandCostEquivalent",
        option_to_yojson generic_string_to_yojson x.on_demand_cost_equivalent );
      ("NetSavings", option_to_yojson generic_string_to_yojson x.net_savings);
    ]

let savings_plans_amortized_commitment_to_yojson (x : savings_plans_amortized_commitment) =
  assoc_to_yojson
    [
      ( "TotalAmortizedCommitment",
        option_to_yojson generic_string_to_yojson x.total_amortized_commitment );
      ( "AmortizedUpfrontCommitment",
        option_to_yojson generic_string_to_yojson x.amortized_upfront_commitment );
      ( "AmortizedRecurringCommitment",
        option_to_yojson generic_string_to_yojson x.amortized_recurring_commitment );
    ]

let savings_plans_utilization_by_time_to_yojson (x : savings_plans_utilization_by_time) =
  assoc_to_yojson
    [
      ( "AmortizedCommitment",
        option_to_yojson savings_plans_amortized_commitment_to_yojson x.amortized_commitment );
      ("Savings", option_to_yojson savings_plans_savings_to_yojson x.savings);
      ("Utilization", Some (savings_plans_utilization_to_yojson x.utilization));
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let savings_plans_utilizations_by_time_to_yojson tree =
  list_to_yojson savings_plans_utilization_by_time_to_yojson tree

let savings_plan_arn_to_yojson = string_to_yojson

let savings_plans_utilization_detail_to_yojson (x : savings_plans_utilization_detail) =
  assoc_to_yojson
    [
      ( "AmortizedCommitment",
        option_to_yojson savings_plans_amortized_commitment_to_yojson x.amortized_commitment );
      ("Savings", option_to_yojson savings_plans_savings_to_yojson x.savings);
      ("Utilization", option_to_yojson savings_plans_utilization_to_yojson x.utilization);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("SavingsPlanArn", option_to_yojson savings_plan_arn_to_yojson x.savings_plan_arn);
    ]

let savings_plans_utilization_details_to_yojson tree =
  list_to_yojson savings_plans_utilization_detail_to_yojson tree

let savings_plans_utilization_aggregates_to_yojson (x : savings_plans_utilization_aggregates) =
  assoc_to_yojson
    [
      ( "AmortizedCommitment",
        option_to_yojson savings_plans_amortized_commitment_to_yojson x.amortized_commitment );
      ("Savings", option_to_yojson savings_plans_savings_to_yojson x.savings);
      ("Utilization", Some (savings_plans_utilization_to_yojson x.utilization));
    ]

let savings_plans_purchase_recommendation_summary_to_yojson
    (x : savings_plans_purchase_recommendation_summary) =
  assoc_to_yojson
    [
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ( "DailyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.daily_commitment_to_purchase );
      ( "TotalRecommendationCount",
        option_to_yojson generic_string_to_yojson x.total_recommendation_count );
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ("CurrentOnDemandSpend", option_to_yojson generic_string_to_yojson x.current_on_demand_spend);
      ("EstimatedTotalCost", option_to_yojson generic_string_to_yojson x.estimated_total_cost);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
    ]

let savings_plans_purchase_recommendation_metadata_to_yojson
    (x : savings_plans_purchase_recommendation_metadata) =
  assoc_to_yojson
    [
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
      ("GenerationTimestamp", option_to_yojson generic_string_to_yojson x.generation_timestamp);
      ("RecommendationId", option_to_yojson generic_string_to_yojson x.recommendation_id);
    ]

let savings_plans_details_to_yojson (x : savings_plans_details) =
  assoc_to_yojson
    [
      ("OfferingId", option_to_yojson generic_string_to_yojson x.offering_id);
      ("InstanceFamily", option_to_yojson generic_string_to_yojson x.instance_family);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
    ]

let recommendation_detail_id_to_yojson = string_to_yojson

let savings_plans_purchase_recommendation_detail_to_yojson
    (x : savings_plans_purchase_recommendation_detail) =
  assoc_to_yojson
    [
      ( "RecommendationDetailId",
        option_to_yojson recommendation_detail_id_to_yojson x.recommendation_detail_id );
      ( "CurrentAverageHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_average_hourly_on_demand_spend );
      ( "CurrentMaximumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_maximum_hourly_on_demand_spend );
      ( "CurrentMinimumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_minimum_hourly_on_demand_spend );
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ( "EstimatedAverageUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_average_utilization );
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ("EstimatedSPCost", option_to_yojson generic_string_to_yojson x.estimated_sp_cost);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ( "SavingsPlansDetails",
        option_to_yojson savings_plans_details_to_yojson x.savings_plans_details );
    ]

let savings_plans_purchase_recommendation_detail_list_to_yojson tree =
  list_to_yojson savings_plans_purchase_recommendation_detail_to_yojson tree

let lookback_period_in_days_to_yojson (x : lookback_period_in_days) =
  match x with
  | SIXTY_DAYS -> `String "SIXTY_DAYS"
  | THIRTY_DAYS -> `String "THIRTY_DAYS"
  | SEVEN_DAYS -> `String "SEVEN_DAYS"

let savings_plans_purchase_recommendation_to_yojson (x : savings_plans_purchase_recommendation) =
  assoc_to_yojson
    [
      ( "SavingsPlansPurchaseRecommendationSummary",
        option_to_yojson savings_plans_purchase_recommendation_summary_to_yojson
          x.savings_plans_purchase_recommendation_summary );
      ( "SavingsPlansPurchaseRecommendationDetails",
        option_to_yojson savings_plans_purchase_recommendation_detail_list_to_yojson
          x.savings_plans_purchase_recommendation_details );
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ( "SavingsPlansType",
        option_to_yojson supported_savings_plans_type_to_yojson x.savings_plans_type );
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
    ]

let recommendation_detail_hourly_metrics_to_yojson (x : recommendation_detail_hourly_metrics) =
  assoc_to_yojson
    [
      ( "EstimatedNewCommitmentUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_new_commitment_utilization );
      ("EstimatedCoverage", option_to_yojson generic_string_to_yojson x.estimated_coverage);
      ("CurrentCoverage", option_to_yojson generic_string_to_yojson x.current_coverage);
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ("StartTime", option_to_yojson zoned_date_time_to_yojson x.start_time);
    ]

let metrics_over_lookback_period_to_yojson tree =
  list_to_yojson recommendation_detail_hourly_metrics_to_yojson tree

let savings_plans_purchase_analysis_details_to_yojson (x : savings_plans_purchase_analysis_details)
    =
  assoc_to_yojson
    [
      ( "MetricsOverLookbackPeriod",
        option_to_yojson metrics_over_lookback_period_to_yojson x.metrics_over_lookback_period );
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ("LatestUsageTimestamp", option_to_yojson generic_string_to_yojson x.latest_usage_timestamp);
      ( "EstimatedCommitmentCost",
        option_to_yojson generic_string_to_yojson x.estimated_commitment_cost );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ( "EstimatedAverageUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_average_utilization );
      ( "EstimatedAverageCoverage",
        option_to_yojson generic_string_to_yojson x.estimated_average_coverage );
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ( "ExistingHourlyCommitment",
        option_to_yojson generic_string_to_yojson x.existing_hourly_commitment );
      ("CurrentOnDemandSpend", option_to_yojson generic_string_to_yojson x.current_on_demand_spend);
      ( "CurrentMinimumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_minimum_hourly_on_demand_spend );
      ( "CurrentMaximumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_maximum_hourly_on_demand_spend );
      ( "CurrentAverageHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_average_hourly_on_demand_spend );
      ( "CurrentAverageCoverage",
        option_to_yojson generic_string_to_yojson x.current_average_coverage );
      ("LookbackPeriodInHours", option_to_yojson generic_string_to_yojson x.lookback_period_in_hours);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
    ]

let savings_plans_data_type_to_yojson (x : savings_plans_data_type) =
  match x with
  | SAVINGS -> `String "SAVINGS"
  | AMORTIZED_COMMITMENT -> `String "AMORTIZED_COMMITMENT"
  | UTILIZATION -> `String "UTILIZATION"
  | ATTRIBUTES -> `String "ATTRIBUTES"

let savings_plans_data_types_to_yojson tree = list_to_yojson savings_plans_data_type_to_yojson tree

let savings_plans_coverage_data_to_yojson (x : savings_plans_coverage_data) =
  assoc_to_yojson
    [
      ("CoveragePercentage", option_to_yojson generic_string_to_yojson x.coverage_percentage);
      ("TotalCost", option_to_yojson generic_string_to_yojson x.total_cost);
      ("OnDemandCost", option_to_yojson generic_string_to_yojson x.on_demand_cost);
      ( "SpendCoveredBySavingsPlans",
        option_to_yojson generic_string_to_yojson x.spend_covered_by_savings_plans );
    ]

let savings_plans_coverage_to_yojson (x : savings_plans_coverage) =
  assoc_to_yojson
    [
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
      ("Coverage", option_to_yojson savings_plans_coverage_data_to_yojson x.coverage);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
    ]

let savings_plans_coverages_to_yojson tree = list_to_yojson savings_plans_coverage_to_yojson tree

let root_cause_impact_to_yojson (x : root_cause_impact) =
  assoc_to_yojson [ ("Contribution", Some (generic_double_to_yojson x.contribution)) ]

let root_cause_to_yojson (x : root_cause) =
  assoc_to_yojson
    [
      ("Impact", option_to_yojson root_cause_impact_to_yojson x.impact);
      ("UsageType", option_to_yojson generic_string_to_yojson x.usage_type);
      ("LinkedAccountName", option_to_yojson generic_string_to_yojson x.linked_account_name);
      ("LinkedAccount", option_to_yojson generic_string_to_yojson x.linked_account);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("Service", option_to_yojson generic_string_to_yojson x.service);
    ]

let root_causes_to_yojson tree = list_to_yojson root_cause_to_yojson tree

let rightsizing_type_to_yojson (x : rightsizing_type) =
  match x with MODIFY -> `String "MODIFY" | TERMINATE -> `String "TERMINATE"

let rightsizing_recommendation_summary_to_yojson (x : rightsizing_recommendation_summary) =
  assoc_to_yojson
    [
      ("SavingsPercentage", option_to_yojson generic_string_to_yojson x.savings_percentage);
      ("SavingsCurrencyCode", option_to_yojson generic_string_to_yojson x.savings_currency_code);
      ( "EstimatedTotalMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_total_monthly_savings_amount );
      ( "TotalRecommendationCount",
        option_to_yojson generic_string_to_yojson x.total_recommendation_count );
    ]

let rightsizing_recommendation_metadata_to_yojson (x : rightsizing_recommendation_metadata) =
  assoc_to_yojson
    [
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("GenerationTimestamp", option_to_yojson generic_string_to_yojson x.generation_timestamp);
      ("RecommendationId", option_to_yojson generic_string_to_yojson x.recommendation_id);
    ]

let current_instance_to_yojson (x : current_instance) =
  assoc_to_yojson
    [
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("MonthlyCost", option_to_yojson generic_string_to_yojson x.monthly_cost);
      ( "TotalRunningHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.total_running_hours_in_lookback_period );
      ( "OnDemandHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.on_demand_hours_in_lookback_period );
      ( "SavingsPlansCoveredHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.savings_plans_covered_hours_in_lookback_period
      );
      ( "ReservationCoveredHoursInLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.reservation_covered_hours_in_lookback_period );
      ("ResourceUtilization", option_to_yojson resource_utilization_to_yojson x.resource_utilization);
      ("ResourceDetails", option_to_yojson resource_details_to_yojson x.resource_details);
      ("Tags", option_to_yojson tag_values_list_to_yojson x.tags);
      ("InstanceName", option_to_yojson generic_string_to_yojson x.instance_name);
      ("ResourceId", option_to_yojson generic_string_to_yojson x.resource_id);
    ]

let modify_recommendation_detail_to_yojson (x : modify_recommendation_detail) =
  assoc_to_yojson
    [ ("TargetInstances", option_to_yojson target_instances_list_to_yojson x.target_instances) ]

let finding_reason_code_to_yojson (x : finding_reason_code) =
  match x with
  | DISK_THROUGHPUT_UNDER_PROVISIONED -> `String "DISK_THROUGHPUT_UNDER_PROVISIONED"
  | DISK_THROUGHPUT_OVER_PROVISIONED -> `String "DISK_THROUGHPUT_OVER_PROVISIONED"
  | DISK_IOPS_UNDER_PROVISIONED -> `String "DISK_IOPS_UNDER_PROVISIONED"
  | DISK_IOPS_OVER_PROVISIONED -> `String "DISK_IOPS_OVER_PROVISIONED"
  | NETWORK_PPS_UNDER_PROVISIONED -> `String "NETWORK_PPS_UNDER_PROVISIONED"
  | NETWORK_PPS_OVER_PROVISIONED -> `String "NETWORK_PPS_OVER_PROVISIONED"
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED -> `String "NETWORK_BANDWIDTH_UNDER_PROVISIONED"
  | NETWORK_BANDWIDTH_OVER_PROVISIONED -> `String "NETWORK_BANDWIDTH_OVER_PROVISIONED"
  | EBS_IOPS_UNDER_PROVISIONED -> `String "EBS_IOPS_UNDER_PROVISIONED"
  | EBS_IOPS_OVER_PROVISIONED -> `String "EBS_IOPS_OVER_PROVISIONED"
  | EBS_THROUGHPUT_UNDER_PROVISIONED -> `String "EBS_THROUGHPUT_UNDER_PROVISIONED"
  | EBS_THROUGHPUT_OVER_PROVISIONED -> `String "EBS_THROUGHPUT_OVER_PROVISIONED"
  | MEMORY_UNDER_PROVISIONED -> `String "MEMORY_UNDER_PROVISIONED"
  | MEMORY_OVER_PROVISIONED -> `String "MEMORY_OVER_PROVISIONED"
  | CPU_UNDER_PROVISIONED -> `String "CPU_UNDER_PROVISIONED"
  | CPU_OVER_PROVISIONED -> `String "CPU_OVER_PROVISIONED"

let finding_reason_codes_to_yojson tree = list_to_yojson finding_reason_code_to_yojson tree

let rightsizing_recommendation_to_yojson (x : rightsizing_recommendation) =
  assoc_to_yojson
    [
      ("FindingReasonCodes", option_to_yojson finding_reason_codes_to_yojson x.finding_reason_codes);
      ( "TerminateRecommendationDetail",
        option_to_yojson terminate_recommendation_detail_to_yojson x.terminate_recommendation_detail
      );
      ( "ModifyRecommendationDetail",
        option_to_yojson modify_recommendation_detail_to_yojson x.modify_recommendation_detail );
      ("RightsizingType", option_to_yojson rightsizing_type_to_yojson x.rightsizing_type);
      ("CurrentInstance", option_to_yojson current_instance_to_yojson x.current_instance);
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
    ]

let rightsizing_recommendation_list_to_yojson tree =
  list_to_yojson rightsizing_recommendation_to_yojson tree

let recommendation_target_to_yojson (x : recommendation_target) =
  match x with
  | CROSS_INSTANCE_FAMILY -> `String "CROSS_INSTANCE_FAMILY"
  | SAME_INSTANCE_FAMILY -> `String "SAME_INSTANCE_FAMILY"

let rightsizing_recommendation_configuration_to_yojson
    (x : rightsizing_recommendation_configuration) =
  assoc_to_yojson
    [
      ("BenefitsConsidered", Some (generic_boolean_to_yojson x.benefits_considered));
      ("RecommendationTarget", Some (recommendation_target_to_yojson x.recommendation_target));
    ]

let metric_amount_to_yojson = string_to_yojson
let metric_unit_to_yojson = string_to_yojson

let metric_value_to_yojson (x : metric_value) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson metric_unit_to_yojson x.unit_);
      ("Amount", option_to_yojson metric_amount_to_yojson x.amount);
    ]

let metric_name_to_yojson = string_to_yojson
let metrics_to_yojson tree = map_to_yojson metric_name_to_yojson metric_value_to_yojson tree
let key_to_yojson = string_to_yojson
let keys_to_yojson tree = list_to_yojson key_to_yojson tree

let group_to_yojson (x : group) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson metrics_to_yojson x.metrics);
      ("Keys", option_to_yojson keys_to_yojson x.keys);
    ]

let groups_to_yojson tree = list_to_yojson group_to_yojson tree
let estimated_to_yojson = bool_to_yojson

let result_by_time_to_yojson (x : result_by_time) =
  assoc_to_yojson
    [
      ("Estimated", option_to_yojson estimated_to_yojson x.estimated);
      ("Groups", option_to_yojson groups_to_yojson x.groups);
      ("Total", option_to_yojson metrics_to_yojson x.total);
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
    ]

let results_by_time_to_yojson tree = list_to_yojson result_by_time_to_yojson tree
let resource_type_to_yojson = string_to_yojson
let resource_types_filter_input_to_yojson tree = list_to_yojson resource_type_to_yojson tree
let resource_types_to_yojson tree = list_to_yojson resource_type_to_yojson tree
let reserved_normalized_units_to_yojson = string_to_yojson
let reserved_hours_to_yojson = string_to_yojson

let dynamo_db_capacity_details_to_yojson (x : dynamo_db_capacity_details) =
  assoc_to_yojson
    [
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("CapacityUnits", option_to_yojson generic_string_to_yojson x.capacity_units);
    ]

let reserved_capacity_details_to_yojson (x : reserved_capacity_details) =
  assoc_to_yojson
    [
      ( "DynamoDBCapacityDetails",
        option_to_yojson dynamo_db_capacity_details_to_yojson x.dynamo_db_capacity_details );
    ]

let ec2_instance_details_to_yojson (x : ec2_instance_details) =
  assoc_to_yojson
    [
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("Tenancy", option_to_yojson generic_string_to_yojson x.tenancy);
      ("Platform", option_to_yojson generic_string_to_yojson x.platform);
      ("AvailabilityZone", option_to_yojson generic_string_to_yojson x.availability_zone);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("InstanceType", option_to_yojson generic_string_to_yojson x.instance_type);
      ("Family", option_to_yojson generic_string_to_yojson x.family);
    ]

let rds_instance_details_to_yojson (x : rds_instance_details) =
  assoc_to_yojson
    [
      ("DeploymentModel", option_to_yojson generic_string_to_yojson x.deployment_model);
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("LicenseModel", option_to_yojson generic_string_to_yojson x.license_model);
      ("DeploymentOption", option_to_yojson generic_string_to_yojson x.deployment_option);
      ("DatabaseEdition", option_to_yojson generic_string_to_yojson x.database_edition);
      ("DatabaseEngine", option_to_yojson generic_string_to_yojson x.database_engine);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("InstanceType", option_to_yojson generic_string_to_yojson x.instance_type);
      ("Family", option_to_yojson generic_string_to_yojson x.family);
    ]

let redshift_instance_details_to_yojson (x : redshift_instance_details) =
  assoc_to_yojson
    [
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("NodeType", option_to_yojson generic_string_to_yojson x.node_type);
      ("Family", option_to_yojson generic_string_to_yojson x.family);
    ]

let elasti_cache_instance_details_to_yojson (x : elasti_cache_instance_details) =
  assoc_to_yojson
    [
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("ProductDescription", option_to_yojson generic_string_to_yojson x.product_description);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("NodeType", option_to_yojson generic_string_to_yojson x.node_type);
      ("Family", option_to_yojson generic_string_to_yojson x.family);
    ]

let es_instance_details_to_yojson (x : es_instance_details) =
  assoc_to_yojson
    [
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("InstanceSize", option_to_yojson generic_string_to_yojson x.instance_size);
      ("InstanceClass", option_to_yojson generic_string_to_yojson x.instance_class);
    ]

let memory_db_instance_details_to_yojson (x : memory_db_instance_details) =
  assoc_to_yojson
    [
      ("SizeFlexEligible", option_to_yojson generic_boolean_to_yojson x.size_flex_eligible);
      ("CurrentGeneration", option_to_yojson generic_boolean_to_yojson x.current_generation);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("NodeType", option_to_yojson generic_string_to_yojson x.node_type);
      ("Family", option_to_yojson generic_string_to_yojson x.family);
    ]

let instance_details_to_yojson (x : instance_details) =
  assoc_to_yojson
    [
      ( "MemoryDBInstanceDetails",
        option_to_yojson memory_db_instance_details_to_yojson x.memory_db_instance_details );
      ("ESInstanceDetails", option_to_yojson es_instance_details_to_yojson x.es_instance_details);
      ( "ElastiCacheInstanceDetails",
        option_to_yojson elasti_cache_instance_details_to_yojson x.elasti_cache_instance_details );
      ( "RedshiftInstanceDetails",
        option_to_yojson redshift_instance_details_to_yojson x.redshift_instance_details );
      ("RDSInstanceDetails", option_to_yojson rds_instance_details_to_yojson x.rds_instance_details);
      ("EC2InstanceDetails", option_to_yojson ec2_instance_details_to_yojson x.ec2_instance_details);
    ]

let reservation_purchase_recommendation_detail_to_yojson
    (x : reservation_purchase_recommendation_detail) =
  assoc_to_yojson
    [
      ( "AverageNumberOfCapacityUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.average_number_of_capacity_units_used_per_hour
      );
      ( "MaximumNumberOfCapacityUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.maximum_number_of_capacity_units_used_per_hour
      );
      ( "MinimumNumberOfCapacityUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.minimum_number_of_capacity_units_used_per_hour
      );
      ( "RecommendedNumberOfCapacityUnitsToPurchase",
        option_to_yojson generic_string_to_yojson x.recommended_number_of_capacity_units_to_purchase
      );
      ( "ReservedCapacityDetails",
        option_to_yojson reserved_capacity_details_to_yojson x.reserved_capacity_details );
      ( "RecurringStandardMonthlyCost",
        option_to_yojson generic_string_to_yojson x.recurring_standard_monthly_cost );
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ( "EstimatedReservationCostForLookbackPeriod",
        option_to_yojson generic_string_to_yojson x.estimated_reservation_cost_for_lookback_period
      );
      ( "EstimatedMonthlyOnDemandCost",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_on_demand_cost );
      ( "EstimatedMonthlySavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_percentage );
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ( "EstimatedBreakEvenInMonths",
        option_to_yojson generic_string_to_yojson x.estimated_break_even_in_months );
      ("AverageUtilization", option_to_yojson generic_string_to_yojson x.average_utilization);
      ( "AverageNormalizedUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.average_normalized_units_used_per_hour );
      ( "AverageNumberOfInstancesUsedPerHour",
        option_to_yojson generic_string_to_yojson x.average_number_of_instances_used_per_hour );
      ( "MaximumNormalizedUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.maximum_normalized_units_used_per_hour );
      ( "MaximumNumberOfInstancesUsedPerHour",
        option_to_yojson generic_string_to_yojson x.maximum_number_of_instances_used_per_hour );
      ( "MinimumNormalizedUnitsUsedPerHour",
        option_to_yojson generic_string_to_yojson x.minimum_normalized_units_used_per_hour );
      ( "MinimumNumberOfInstancesUsedPerHour",
        option_to_yojson generic_string_to_yojson x.minimum_number_of_instances_used_per_hour );
      ( "RecommendedNormalizedUnitsToPurchase",
        option_to_yojson generic_string_to_yojson x.recommended_normalized_units_to_purchase );
      ( "RecommendedNumberOfInstancesToPurchase",
        option_to_yojson generic_string_to_yojson x.recommended_number_of_instances_to_purchase );
      ("InstanceDetails", option_to_yojson instance_details_to_yojson x.instance_details);
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
    ]

let reservation_purchase_recommendation_details_to_yojson tree =
  list_to_yojson reservation_purchase_recommendation_detail_to_yojson tree

let reservation_purchase_recommendation_summary_to_yojson
    (x : reservation_purchase_recommendation_summary) =
  assoc_to_yojson
    [
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ( "TotalEstimatedMonthlySavingsPercentage",
        option_to_yojson generic_string_to_yojson x.total_estimated_monthly_savings_percentage );
      ( "TotalEstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.total_estimated_monthly_savings_amount );
    ]

let reservation_purchase_recommendation_to_yojson (x : reservation_purchase_recommendation) =
  assoc_to_yojson
    [
      ( "RecommendationSummary",
        option_to_yojson reservation_purchase_recommendation_summary_to_yojson
          x.recommendation_summary );
      ( "RecommendationDetails",
        option_to_yojson reservation_purchase_recommendation_details_to_yojson
          x.recommendation_details );
      ( "ServiceSpecification",
        option_to_yojson service_specification_to_yojson x.service_specification );
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
    ]

let reservation_purchase_recommendations_to_yojson tree =
  list_to_yojson reservation_purchase_recommendation_to_yojson tree

let reservation_purchase_recommendation_metadata_to_yojson
    (x : reservation_purchase_recommendation_metadata) =
  assoc_to_yojson
    [
      ("AdditionalMetadata", option_to_yojson generic_string_to_yojson x.additional_metadata);
      ("GenerationTimestamp", option_to_yojson generic_string_to_yojson x.generation_timestamp);
      ("RecommendationId", option_to_yojson generic_string_to_yojson x.recommendation_id);
    ]

let on_demand_hours_to_yojson = string_to_yojson
let coverage_hours_percentage_to_yojson = string_to_yojson

let coverage_hours_to_yojson (x : coverage_hours) =
  assoc_to_yojson
    [
      ( "CoverageHoursPercentage",
        option_to_yojson coverage_hours_percentage_to_yojson x.coverage_hours_percentage );
      ("TotalRunningHours", option_to_yojson total_running_hours_to_yojson x.total_running_hours);
      ("ReservedHours", option_to_yojson reserved_hours_to_yojson x.reserved_hours);
      ("OnDemandHours", option_to_yojson on_demand_hours_to_yojson x.on_demand_hours);
    ]

let on_demand_normalized_units_to_yojson = string_to_yojson
let coverage_normalized_units_percentage_to_yojson = string_to_yojson

let coverage_normalized_units_to_yojson (x : coverage_normalized_units) =
  assoc_to_yojson
    [
      ( "CoverageNormalizedUnitsPercentage",
        option_to_yojson coverage_normalized_units_percentage_to_yojson
          x.coverage_normalized_units_percentage );
      ( "TotalRunningNormalizedUnits",
        option_to_yojson total_running_normalized_units_to_yojson x.total_running_normalized_units
      );
      ( "ReservedNormalizedUnits",
        option_to_yojson reserved_normalized_units_to_yojson x.reserved_normalized_units );
      ( "OnDemandNormalizedUnits",
        option_to_yojson on_demand_normalized_units_to_yojson x.on_demand_normalized_units );
    ]

let on_demand_cost_to_yojson = string_to_yojson

let coverage_cost_to_yojson (x : coverage_cost) =
  assoc_to_yojson [ ("OnDemandCost", option_to_yojson on_demand_cost_to_yojson x.on_demand_cost) ]

let coverage_to_yojson (x : coverage) =
  assoc_to_yojson
    [
      ("CoverageCost", option_to_yojson coverage_cost_to_yojson x.coverage_cost);
      ( "CoverageNormalizedUnits",
        option_to_yojson coverage_normalized_units_to_yojson x.coverage_normalized_units );
      ("CoverageHours", option_to_yojson coverage_hours_to_yojson x.coverage_hours);
    ]

let reservation_coverage_group_to_yojson (x : reservation_coverage_group) =
  assoc_to_yojson
    [
      ("Coverage", option_to_yojson coverage_to_yojson x.coverage);
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
    ]

let reservation_coverage_groups_to_yojson tree =
  list_to_yojson reservation_coverage_group_to_yojson tree

let request_changed_exception_to_yojson (x : request_changed_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let recommendations_page_size_to_yojson = int_to_yojson
let recommendation_id_list_to_yojson tree = list_to_yojson recommendation_id_to_yojson tree

let recommendation_detail_data_to_yojson (x : recommendation_detail_data) =
  assoc_to_yojson
    [
      ( "MetricsOverLookbackPeriod",
        option_to_yojson metrics_over_lookback_period_to_yojson x.metrics_over_lookback_period );
      ( "EstimatedAverageCoverage",
        option_to_yojson generic_string_to_yojson x.estimated_average_coverage );
      ( "CurrentAverageCoverage",
        option_to_yojson generic_string_to_yojson x.current_average_coverage );
      ("UpfrontCost", option_to_yojson generic_string_to_yojson x.upfront_cost);
      ( "HourlyCommitmentToPurchase",
        option_to_yojson generic_string_to_yojson x.hourly_commitment_to_purchase );
      ( "ExistingHourlyCommitment",
        option_to_yojson generic_string_to_yojson x.existing_hourly_commitment );
      ( "EstimatedSavingsPercentage",
        option_to_yojson generic_string_to_yojson x.estimated_savings_percentage );
      ( "EstimatedSavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_savings_amount );
      ("EstimatedSPCost", option_to_yojson generic_string_to_yojson x.estimated_sp_cost);
      ("EstimatedROI", option_to_yojson generic_string_to_yojson x.estimated_ro_i);
      ( "EstimatedOnDemandCostWithCurrentCommitment",
        option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost_with_current_commitment
      );
      ("EstimatedOnDemandCost", option_to_yojson generic_string_to_yojson x.estimated_on_demand_cost);
      ( "EstimatedMonthlySavingsAmount",
        option_to_yojson generic_string_to_yojson x.estimated_monthly_savings_amount );
      ( "EstimatedAverageUtilization",
        option_to_yojson generic_string_to_yojson x.estimated_average_utilization );
      ( "CurrentMinimumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_minimum_hourly_on_demand_spend );
      ( "CurrentMaximumHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_maximum_hourly_on_demand_spend );
      ( "CurrentAverageHourlyOnDemandSpend",
        option_to_yojson generic_string_to_yojson x.current_average_hourly_on_demand_spend );
      ("LatestUsageTimestamp", option_to_yojson zoned_date_time_to_yojson x.latest_usage_timestamp);
      ("GenerationTimestamp", option_to_yojson zoned_date_time_to_yojson x.generation_timestamp);
      ("OfferingId", option_to_yojson generic_string_to_yojson x.offering_id);
      ("Region", option_to_yojson generic_string_to_yojson x.region);
      ("InstanceFamily", option_to_yojson generic_string_to_yojson x.instance_family);
      ("CurrencyCode", option_to_yojson generic_string_to_yojson x.currency_code);
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ( "SavingsPlansType",
        option_to_yojson supported_savings_plans_type_to_yojson x.savings_plans_type );
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
    ]

let provide_anomaly_feedback_response_to_yojson (x : provide_anomaly_feedback_response) =
  assoc_to_yojson [ ("AnomalyId", Some (generic_string_to_yojson x.anomaly_id)) ]

let anomaly_feedback_type_to_yojson (x : anomaly_feedback_type) =
  match x with
  | PLANNED_ACTIVITY -> `String "PLANNED_ACTIVITY"
  | NO -> `String "NO"
  | YES -> `String "YES"

let provide_anomaly_feedback_request_to_yojson (x : provide_anomaly_feedback_request) =
  assoc_to_yojson
    [
      ("Feedback", Some (anomaly_feedback_type_to_yojson x.feedback));
      ("AnomalyId", Some (generic_string_to_yojson x.anomaly_id));
    ]

let prediction_interval_level_to_yojson = int_to_yojson
let page_size_to_yojson = int_to_yojson
let non_negative_long_to_yojson = long_to_yojson
let non_negative_integer_to_yojson = int_to_yojson
let next_page_token_to_yojson = string_to_yojson

let monitor_type_to_yojson (x : monitor_type) =
  match x with CUSTOM -> `String "CUSTOM" | DIMENSIONAL -> `String "DIMENSIONAL"

let monitor_dimension_to_yojson (x : monitor_dimension) =
  match x with
  | COST_CATEGORY -> `String "COST_CATEGORY"
  | TAG -> `String "TAG"
  | LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"
  | SERVICE -> `String "SERVICE"

let metric_names_to_yojson tree = list_to_yojson metric_name_to_yojson tree

let metric_to_yojson (x : metric) =
  match x with
  | NORMALIZED_USAGE_AMOUNT -> `String "NORMALIZED_USAGE_AMOUNT"
  | USAGE_QUANTITY -> `String "USAGE_QUANTITY"
  | NET_AMORTIZED_COST -> `String "NET_AMORTIZED_COST"
  | NET_UNBLENDED_COST -> `String "NET_UNBLENDED_COST"
  | AMORTIZED_COST -> `String "AMORTIZED_COST"
  | UNBLENDED_COST -> `String "UNBLENDED_COST"
  | BLENDED_COST -> `String "BLENDED_COST"

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let generation_status_to_yojson (x : generation_status) =
  match x with
  | FAILED -> `String "FAILED"
  | PROCESSING -> `String "PROCESSING"
  | SUCCEEDED -> `String "SUCCEEDED"

let generation_summary_to_yojson (x : generation_summary) =
  assoc_to_yojson
    [
      ( "EstimatedCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.estimated_completion_time );
      ( "GenerationCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.generation_completion_time );
      ("GenerationStartedTime", option_to_yojson zoned_date_time_to_yojson x.generation_started_time);
      ("GenerationStatus", option_to_yojson generation_status_to_yojson x.generation_status);
      ("RecommendationId", option_to_yojson recommendation_id_to_yojson x.recommendation_id);
    ]

let generation_summary_list_to_yojson tree = list_to_yojson generation_summary_to_yojson tree

let list_savings_plans_purchase_recommendation_generation_response_to_yojson
    (x : list_savings_plans_purchase_recommendation_generation_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "GenerationSummaryList",
        option_to_yojson generation_summary_list_to_yojson x.generation_summary_list );
    ]

let list_savings_plans_purchase_recommendation_generation_request_to_yojson
    (x : list_savings_plans_purchase_recommendation_generation_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ("RecommendationIds", option_to_yojson recommendation_id_list_to_yojson x.recommendation_ids);
      ("GenerationStatus", option_to_yojson generation_status_to_yojson x.generation_status);
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let generic_arn_to_yojson = string_to_yojson

let cost_category_resource_association_to_yojson (x : cost_category_resource_association) =
  assoc_to_yojson
    [
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
      ("CostCategoryName", option_to_yojson cost_category_name_to_yojson x.cost_category_name);
      ("ResourceArn", option_to_yojson generic_arn_to_yojson x.resource_arn);
    ]

let cost_category_resource_associations_to_yojson tree =
  list_to_yojson cost_category_resource_association_to_yojson tree

let list_cost_category_resource_associations_response_to_yojson
    (x : list_cost_category_resource_associations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ( "CostCategoryResourceAssociations",
        option_to_yojson cost_category_resource_associations_to_yojson
          x.cost_category_resource_associations );
    ]

let cost_category_max_results_to_yojson = int_to_yojson

let list_cost_category_resource_associations_request_to_yojson
    (x : list_cost_category_resource_associations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson cost_category_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
    ]

let cost_category_status_component_to_yojson (x : cost_category_status_component) =
  match x with COST_EXPLORER -> `String "COST_EXPLORER"

let cost_category_status_to_yojson (x : cost_category_status) =
  match x with APPLIED -> `String "APPLIED" | PROCESSING -> `String "PROCESSING"

let cost_category_processing_status_to_yojson (x : cost_category_processing_status) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson cost_category_status_to_yojson x.status);
      ("Component", option_to_yojson cost_category_status_component_to_yojson x.component);
    ]

let cost_category_processing_status_list_to_yojson tree =
  list_to_yojson cost_category_processing_status_to_yojson tree

let cost_category_values_list_to_yojson tree = list_to_yojson cost_category_value_to_yojson tree

let cost_category_reference_to_yojson (x : cost_category_reference) =
  assoc_to_yojson
    [
      ( "SupportedResourceTypes",
        option_to_yojson resource_types_to_yojson x.supported_resource_types );
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
      ("Values", option_to_yojson cost_category_values_list_to_yojson x.values);
      ( "ProcessingStatus",
        option_to_yojson cost_category_processing_status_list_to_yojson x.processing_status );
      ("NumberOfRules", option_to_yojson non_negative_integer_to_yojson x.number_of_rules);
      ("EffectiveEnd", option_to_yojson zoned_date_time_to_yojson x.effective_end);
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("Name", option_to_yojson cost_category_name_to_yojson x.name);
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
    ]

let cost_category_references_list_to_yojson tree =
  list_to_yojson cost_category_reference_to_yojson tree

let list_cost_category_definitions_response_to_yojson (x : list_cost_category_definitions_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ( "CostCategoryReferences",
        option_to_yojson cost_category_references_list_to_yojson x.cost_category_references );
    ]

let list_cost_category_definitions_request_to_yojson (x : list_cost_category_definitions_request) =
  assoc_to_yojson
    [
      ( "SupportedResourceTypes",
        option_to_yojson resource_types_filter_input_to_yojson x.supported_resource_types );
      ("MaxResults", option_to_yojson cost_category_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("EffectiveOn", option_to_yojson zoned_date_time_to_yojson x.effective_on);
    ]

let cost_allocation_tag_type_to_yojson (x : cost_allocation_tag_type) =
  match x with USER_DEFINED -> `String "UserDefined" | AWS_GENERATED -> `String "AWSGenerated"

let cost_allocation_tag_to_yojson (x : cost_allocation_tag) =
  assoc_to_yojson
    [
      ("LastUsedDate", option_to_yojson zoned_date_time_to_yojson x.last_used_date);
      ("LastUpdatedDate", option_to_yojson zoned_date_time_to_yojson x.last_updated_date);
      ("Status", Some (cost_allocation_tag_status_to_yojson x.status));
      ("Type", Some (cost_allocation_tag_type_to_yojson x.type_));
      ("TagKey", Some (tag_key_to_yojson x.tag_key));
    ]

let cost_allocation_tag_list_to_yojson tree = list_to_yojson cost_allocation_tag_to_yojson tree

let list_cost_allocation_tags_response_to_yojson (x : list_cost_allocation_tags_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ( "CostAllocationTags",
        option_to_yojson cost_allocation_tag_list_to_yojson x.cost_allocation_tags );
    ]

let cost_allocation_tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let cost_allocation_tags_max_results_to_yojson = int_to_yojson

let list_cost_allocation_tags_request_to_yojson (x : list_cost_allocation_tags_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson cost_allocation_tags_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("Type", option_to_yojson cost_allocation_tag_type_to_yojson x.type_);
      ("TagKeys", option_to_yojson cost_allocation_tag_key_list_to_yojson x.tag_keys);
      ("Status", option_to_yojson cost_allocation_tag_status_to_yojson x.status);
    ]

let cost_allocation_tag_backfill_request_list_to_yojson tree =
  list_to_yojson cost_allocation_tag_backfill_request_to_yojson tree

let list_cost_allocation_tag_backfill_history_response_to_yojson
    (x : list_cost_allocation_tag_backfill_history_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ( "BackfillRequests",
        option_to_yojson cost_allocation_tag_backfill_request_list_to_yojson x.backfill_requests );
    ]

let list_cost_allocation_tag_backfill_history_request_to_yojson
    (x : list_cost_allocation_tag_backfill_history_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson cost_allocation_tags_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let analysis_status_to_yojson (x : analysis_status) =
  match x with
  | FAILED -> `String "FAILED"
  | PROCESSING -> `String "PROCESSING"
  | SUCCEEDED -> `String "SUCCEEDED"

let error_code_to_yojson (x : error_code) =
  match x with
  | INVALID_ACCOUNT_ID -> `String "INVALID_ACCOUNT_ID"
  | INVALID_SAVINGS_PLANS_TO_EXCLUDE -> `String "INVALID_SAVINGS_PLANS_TO_EXCLUDE"
  | INVALID_SAVINGS_PLANS_TO_ADD -> `String "INVALID_SAVINGS_PLANS_TO_ADD"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | NO_USAGE_FOUND -> `String "NO_USAGE_FOUND"

let analysis_summary_to_yojson (x : analysis_summary) =
  assoc_to_yojson
    [
      ( "CommitmentPurchaseAnalysisConfiguration",
        option_to_yojson commitment_purchase_analysis_configuration_to_yojson
          x.commitment_purchase_analysis_configuration );
      ("AnalysisId", option_to_yojson analysis_id_to_yojson x.analysis_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("AnalysisStatus", option_to_yojson analysis_status_to_yojson x.analysis_status);
      ("AnalysisStartedTime", option_to_yojson zoned_date_time_to_yojson x.analysis_started_time);
      ( "AnalysisCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.analysis_completion_time );
      ( "EstimatedCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.estimated_completion_time );
    ]

let analysis_summary_list_to_yojson tree = list_to_yojson analysis_summary_to_yojson tree

let list_commitment_purchase_analyses_response_to_yojson
    (x : list_commitment_purchase_analyses_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "AnalysisSummaryList",
        option_to_yojson analysis_summary_list_to_yojson x.analysis_summary_list );
    ]

let analyses_page_size_to_yojson = int_to_yojson
let analysis_ids_to_yojson tree = list_to_yojson analysis_id_to_yojson tree

let list_commitment_purchase_analyses_request_to_yojson
    (x : list_commitment_purchase_analyses_request) =
  assoc_to_yojson
    [
      ("AnalysisIds", option_to_yojson analysis_ids_to_yojson x.analysis_ids);
      ("PageSize", option_to_yojson analyses_page_size_to_yojson x.page_size);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("AnalysisStatus", option_to_yojson analysis_status_to_yojson x.analysis_status);
    ]

let impact_to_yojson (x : impact) =
  assoc_to_yojson
    [
      ( "TotalImpactPercentage",
        option_to_yojson nullable_non_negative_double_to_yojson x.total_impact_percentage );
      ( "TotalExpectedSpend",
        option_to_yojson nullable_non_negative_double_to_yojson x.total_expected_spend );
      ( "TotalActualSpend",
        option_to_yojson nullable_non_negative_double_to_yojson x.total_actual_spend );
      ("TotalImpact", option_to_yojson generic_double_to_yojson x.total_impact);
      ("MaxImpact", Some (generic_double_to_yojson x.max_impact));
    ]

let group_definition_type_to_yojson (x : group_definition_type) =
  match x with
  | COST_CATEGORY -> `String "COST_CATEGORY"
  | TAG -> `String "TAG"
  | DIMENSION -> `String "DIMENSION"

let group_definition_key_to_yojson = string_to_yojson

let group_definition_to_yojson (x : group_definition) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson group_definition_key_to_yojson x.key);
      ("Type", option_to_yojson group_definition_type_to_yojson x.type_);
    ]

let group_definitions_to_yojson tree = list_to_yojson group_definition_to_yojson tree

let granularity_to_yojson (x : granularity) =
  match x with
  | HOURLY -> `String "HOURLY"
  | MONTHLY -> `String "MONTHLY"
  | DAILY -> `String "DAILY"

let forecast_result_to_yojson (x : forecast_result) =
  assoc_to_yojson
    [
      ( "PredictionIntervalUpperBound",
        option_to_yojson generic_string_to_yojson x.prediction_interval_upper_bound );
      ( "PredictionIntervalLowerBound",
        option_to_yojson generic_string_to_yojson x.prediction_interval_lower_bound );
      ("MeanValue", option_to_yojson generic_string_to_yojson x.mean_value);
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
    ]

let forecast_results_by_time_to_yojson tree = list_to_yojson forecast_result_to_yojson tree

let get_usage_forecast_response_to_yojson (x : get_usage_forecast_response) =
  assoc_to_yojson
    [
      ( "ForecastResultsByTime",
        option_to_yojson forecast_results_by_time_to_yojson x.forecast_results_by_time );
      ("Total", option_to_yojson metric_value_to_yojson x.total);
    ]

let billing_view_arn_to_yojson = string_to_yojson

let get_usage_forecast_request_to_yojson (x : get_usage_forecast_request) =
  assoc_to_yojson
    [
      ( "PredictionIntervalLevel",
        option_to_yojson prediction_interval_level_to_yojson x.prediction_interval_level );
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("Metric", Some (metric_to_yojson x.metric));
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let billing_view_health_status_exception_to_yojson (x : billing_view_health_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let get_tags_response_to_yojson (x : get_tags_response) =
  assoc_to_yojson
    [
      ("TotalSize", Some (page_size_to_yojson x.total_size));
      ("ReturnSize", Some (page_size_to_yojson x.return_size));
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_tags_request_to_yojson (x : get_tags_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("SortBy", option_to_yojson sort_definitions_to_yojson x.sort_by);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("TagKey", option_to_yojson tag_key_to_yojson x.tag_key);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("SearchString", option_to_yojson search_string_to_yojson x.search_string);
    ]

let bill_expiration_exception_to_yojson (x : bill_expiration_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let get_savings_plans_utilization_response_to_yojson (x : get_savings_plans_utilization_response) =
  assoc_to_yojson
    [
      ("Total", Some (savings_plans_utilization_aggregates_to_yojson x.total));
      ( "SavingsPlansUtilizationsByTime",
        option_to_yojson savings_plans_utilizations_by_time_to_yojson
          x.savings_plans_utilizations_by_time );
    ]

let get_savings_plans_utilization_request_to_yojson (x : get_savings_plans_utilization_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let get_savings_plans_utilization_details_response_to_yojson
    (x : get_savings_plans_utilization_details_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("Total", option_to_yojson savings_plans_utilization_aggregates_to_yojson x.total);
      ( "SavingsPlansUtilizationDetails",
        Some (savings_plans_utilization_details_to_yojson x.savings_plans_utilization_details) );
    ]

let get_savings_plans_utilization_details_request_to_yojson
    (x : get_savings_plans_utilization_details_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("DataType", option_to_yojson savings_plans_data_types_to_yojson x.data_type);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let get_savings_plans_purchase_recommendation_response_to_yojson
    (x : get_savings_plans_purchase_recommendation_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "SavingsPlansPurchaseRecommendation",
        option_to_yojson savings_plans_purchase_recommendation_to_yojson
          x.savings_plans_purchase_recommendation );
      ( "Metadata",
        option_to_yojson savings_plans_purchase_recommendation_metadata_to_yojson x.metadata );
    ]

let get_savings_plans_purchase_recommendation_request_to_yojson
    (x : get_savings_plans_purchase_recommendation_request) =
  assoc_to_yojson
    [
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("LookbackPeriodInDays", Some (lookback_period_in_days_to_yojson x.lookback_period_in_days));
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ("PaymentOption", Some (payment_option_to_yojson x.payment_option));
      ("TermInYears", Some (term_in_years_to_yojson x.term_in_years));
      ("SavingsPlansType", Some (supported_savings_plans_type_to_yojson x.savings_plans_type));
    ]

let get_savings_plans_coverage_response_to_yojson (x : get_savings_plans_coverage_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("SavingsPlansCoverages", Some (savings_plans_coverages_to_yojson x.savings_plans_coverages));
    ]

let get_savings_plans_coverage_request_to_yojson (x : get_savings_plans_coverage_request) =
  assoc_to_yojson
    [
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("Metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let get_savings_plan_purchase_recommendation_details_response_to_yojson
    (x : get_savings_plan_purchase_recommendation_details_response) =
  assoc_to_yojson
    [
      ( "RecommendationDetailData",
        option_to_yojson recommendation_detail_data_to_yojson x.recommendation_detail_data );
      ( "RecommendationDetailId",
        option_to_yojson recommendation_detail_id_to_yojson x.recommendation_detail_id );
    ]

let get_savings_plan_purchase_recommendation_details_request_to_yojson
    (x : get_savings_plan_purchase_recommendation_details_request) =
  assoc_to_yojson
    [
      ( "RecommendationDetailId",
        Some (recommendation_detail_id_to_yojson x.recommendation_detail_id) );
    ]

let get_rightsizing_recommendation_response_to_yojson (x : get_rightsizing_recommendation_response)
    =
  assoc_to_yojson
    [
      ( "Configuration",
        option_to_yojson rightsizing_recommendation_configuration_to_yojson x.configuration );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "RightsizingRecommendations",
        option_to_yojson rightsizing_recommendation_list_to_yojson x.rightsizing_recommendations );
      ("Summary", option_to_yojson rightsizing_recommendation_summary_to_yojson x.summary);
      ("Metadata", option_to_yojson rightsizing_recommendation_metadata_to_yojson x.metadata);
    ]

let get_rightsizing_recommendation_request_to_yojson (x : get_rightsizing_recommendation_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ("Service", Some (generic_string_to_yojson x.service));
      ( "Configuration",
        option_to_yojson rightsizing_recommendation_configuration_to_yojson x.configuration );
      ("Filter", option_to_yojson expression_to_yojson x.filter);
    ]

let get_reservation_utilization_response_to_yojson (x : get_reservation_utilization_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("Total", option_to_yojson reservation_aggregates_to_yojson x.total);
      ("UtilizationsByTime", Some (utilizations_by_time_to_yojson x.utilizations_by_time));
    ]

let get_reservation_utilization_request_to_yojson (x : get_reservation_utilization_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let get_reservation_purchase_recommendation_response_to_yojson
    (x : get_reservation_purchase_recommendation_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "Recommendations",
        option_to_yojson reservation_purchase_recommendations_to_yojson x.recommendations );
      ( "Metadata",
        option_to_yojson reservation_purchase_recommendation_metadata_to_yojson x.metadata );
    ]

let get_reservation_purchase_recommendation_request_to_yojson
    (x : get_reservation_purchase_recommendation_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("PageSize", option_to_yojson recommendations_page_size_to_yojson x.page_size);
      ( "ServiceSpecification",
        option_to_yojson service_specification_to_yojson x.service_specification );
      ("PaymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ("TermInYears", option_to_yojson term_in_years_to_yojson x.term_in_years);
      ( "LookbackPeriodInDays",
        option_to_yojson lookback_period_in_days_to_yojson x.lookback_period_in_days );
      ("AccountScope", option_to_yojson account_scope_to_yojson x.account_scope);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Service", Some (generic_string_to_yojson x.service));
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
    ]

let coverage_by_time_to_yojson (x : coverage_by_time) =
  assoc_to_yojson
    [
      ("Total", option_to_yojson coverage_to_yojson x.total);
      ("Groups", option_to_yojson reservation_coverage_groups_to_yojson x.groups);
      ("TimePeriod", option_to_yojson date_interval_to_yojson x.time_period);
    ]

let coverages_by_time_to_yojson tree = list_to_yojson coverage_by_time_to_yojson tree

let get_reservation_coverage_response_to_yojson (x : get_reservation_coverage_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("Total", option_to_yojson coverage_to_yojson x.total);
      ("CoveragesByTime", Some (coverages_by_time_to_yojson x.coverages_by_time));
    ]

let get_reservation_coverage_request_to_yojson (x : get_reservation_coverage_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("SortBy", option_to_yojson sort_definition_to_yojson x.sort_by);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("Metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Granularity", option_to_yojson granularity_to_yojson x.granularity);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let dimension_values_with_attributes_to_yojson (x : dimension_values_with_attributes) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson attributes_to_yojson x.attributes);
      ("Value", option_to_yojson value_to_yojson x.value);
    ]

let dimension_values_with_attributes_list_to_yojson tree =
  list_to_yojson dimension_values_with_attributes_to_yojson tree

let get_dimension_values_response_to_yojson (x : get_dimension_values_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("TotalSize", Some (page_size_to_yojson x.total_size));
      ("ReturnSize", Some (page_size_to_yojson x.return_size));
      ("DimensionValues", Some (dimension_values_with_attributes_list_to_yojson x.dimension_values));
    ]

let context_to_yojson (x : context) =
  match x with
  | SAVINGS_PLANS -> `String "SAVINGS_PLANS"
  | RESERVATIONS -> `String "RESERVATIONS"
  | COST_AND_USAGE -> `String "COST_AND_USAGE"

let get_dimension_values_request_to_yojson (x : get_dimension_values_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("SortBy", option_to_yojson sort_definitions_to_yojson x.sort_by);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Context", option_to_yojson context_to_yojson x.context);
      ("Dimension", Some (dimension_to_yojson x.dimension));
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("SearchString", option_to_yojson search_string_to_yojson x.search_string);
    ]

let get_cost_forecast_response_to_yojson (x : get_cost_forecast_response) =
  assoc_to_yojson
    [
      ( "ForecastResultsByTime",
        option_to_yojson forecast_results_by_time_to_yojson x.forecast_results_by_time );
      ("Total", option_to_yojson metric_value_to_yojson x.total);
    ]

let get_cost_forecast_request_to_yojson (x : get_cost_forecast_request) =
  assoc_to_yojson
    [
      ( "PredictionIntervalLevel",
        option_to_yojson prediction_interval_level_to_yojson x.prediction_interval_level );
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("Metric", Some (metric_to_yojson x.metric));
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let comparison_metric_value_to_yojson (x : comparison_metric_value) =
  assoc_to_yojson
    [
      ("Unit", option_to_yojson generic_string_to_yojson x.unit_);
      ("Difference", option_to_yojson generic_string_to_yojson x.difference);
      ( "ComparisonTimePeriodAmount",
        option_to_yojson generic_string_to_yojson x.comparison_time_period_amount );
      ( "BaselineTimePeriodAmount",
        option_to_yojson generic_string_to_yojson x.baseline_time_period_amount );
    ]

let comparison_metrics_to_yojson tree =
  map_to_yojson metric_name_to_yojson comparison_metric_value_to_yojson tree

let cost_driver_to_yojson (x : cost_driver) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson comparison_metrics_to_yojson x.metrics);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("Type", option_to_yojson generic_string_to_yojson x.type_);
    ]

let cost_drivers_to_yojson tree = list_to_yojson cost_driver_to_yojson tree

let cost_comparison_driver_to_yojson (x : cost_comparison_driver) =
  assoc_to_yojson
    [
      ("CostDrivers", option_to_yojson cost_drivers_to_yojson x.cost_drivers);
      ("Metrics", option_to_yojson comparison_metrics_to_yojson x.metrics);
      ("CostSelector", option_to_yojson expression_to_yojson x.cost_selector);
    ]

let cost_comparison_drivers_to_yojson tree = list_to_yojson cost_comparison_driver_to_yojson tree

let get_cost_comparison_drivers_response_to_yojson (x : get_cost_comparison_drivers_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ( "CostComparisonDrivers",
        option_to_yojson cost_comparison_drivers_to_yojson x.cost_comparison_drivers );
    ]

let cost_comparison_drivers_max_results_to_yojson = int_to_yojson

let get_cost_comparison_drivers_request_to_yojson (x : get_cost_comparison_drivers_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson cost_comparison_drivers_max_results_to_yojson x.max_results);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("MetricForComparison", Some (metric_name_to_yojson x.metric_for_comparison));
      ("ComparisonTimePeriod", Some (date_interval_to_yojson x.comparison_time_period));
      ("BaselineTimePeriod", Some (date_interval_to_yojson x.baseline_time_period));
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
    ]

let cost_category_names_list_to_yojson tree = list_to_yojson cost_category_name_to_yojson tree

let get_cost_categories_response_to_yojson (x : get_cost_categories_response) =
  assoc_to_yojson
    [
      ("TotalSize", Some (page_size_to_yojson x.total_size));
      ("ReturnSize", Some (page_size_to_yojson x.return_size));
      ( "CostCategoryValues",
        option_to_yojson cost_category_values_list_to_yojson x.cost_category_values );
      ( "CostCategoryNames",
        option_to_yojson cost_category_names_list_to_yojson x.cost_category_names );
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_cost_categories_request_to_yojson (x : get_cost_categories_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("SortBy", option_to_yojson sort_definitions_to_yojson x.sort_by);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("CostCategoryName", option_to_yojson cost_category_name_to_yojson x.cost_category_name);
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
      ("SearchString", option_to_yojson search_string_to_yojson x.search_string);
    ]

let get_cost_and_usage_with_resources_response_to_yojson
    (x : get_cost_and_usage_with_resources_response) =
  assoc_to_yojson
    [
      ( "DimensionValueAttributes",
        option_to_yojson dimension_values_with_attributes_list_to_yojson
          x.dimension_value_attributes );
      ("ResultsByTime", option_to_yojson results_by_time_to_yojson x.results_by_time);
      ("GroupDefinitions", option_to_yojson group_definitions_to_yojson x.group_definitions);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_cost_and_usage_with_resources_request_to_yojson
    (x : get_cost_and_usage_with_resources_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("Metrics", option_to_yojson metric_names_to_yojson x.metrics);
      ("Filter", Some (expression_to_yojson x.filter));
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let get_cost_and_usage_response_to_yojson (x : get_cost_and_usage_response) =
  assoc_to_yojson
    [
      ( "DimensionValueAttributes",
        option_to_yojson dimension_values_with_attributes_list_to_yojson
          x.dimension_value_attributes );
      ("ResultsByTime", option_to_yojson results_by_time_to_yojson x.results_by_time);
      ("GroupDefinitions", option_to_yojson group_definitions_to_yojson x.group_definitions);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
    ]

let get_cost_and_usage_request_to_yojson (x : get_cost_and_usage_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("Metrics", Some (metric_names_to_yojson x.metrics));
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("Granularity", Some (granularity_to_yojson x.granularity));
      ("TimePeriod", Some (date_interval_to_yojson x.time_period));
    ]

let cost_and_usage_comparison_to_yojson (x : cost_and_usage_comparison) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson comparison_metrics_to_yojson x.metrics);
      ("CostAndUsageSelector", option_to_yojson expression_to_yojson x.cost_and_usage_selector);
    ]

let cost_and_usage_comparisons_to_yojson tree =
  list_to_yojson cost_and_usage_comparison_to_yojson tree

let get_cost_and_usage_comparisons_response_to_yojson (x : get_cost_and_usage_comparisons_response)
    =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("TotalCostAndUsage", option_to_yojson comparison_metrics_to_yojson x.total_cost_and_usage);
      ( "CostAndUsageComparisons",
        option_to_yojson cost_and_usage_comparisons_to_yojson x.cost_and_usage_comparisons );
    ]

let cost_and_usage_comparisons_max_results_to_yojson = int_to_yojson

let get_cost_and_usage_comparisons_request_to_yojson (x : get_cost_and_usage_comparisons_request) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MaxResults", option_to_yojson cost_and_usage_comparisons_max_results_to_yojson x.max_results);
      ("GroupBy", option_to_yojson group_definitions_to_yojson x.group_by);
      ("Filter", option_to_yojson expression_to_yojson x.filter);
      ("MetricForComparison", Some (metric_name_to_yojson x.metric_for_comparison));
      ("ComparisonTimePeriod", Some (date_interval_to_yojson x.comparison_time_period));
      ("BaselineTimePeriod", Some (date_interval_to_yojson x.baseline_time_period));
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
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
      ( "CommitmentPurchaseAnalysisConfiguration",
        Some
          (commitment_purchase_analysis_configuration_to_yojson
             x.commitment_purchase_analysis_configuration) );
      ("AnalysisDetails", option_to_yojson analysis_details_to_yojson x.analysis_details);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("AnalysisStatus", Some (analysis_status_to_yojson x.analysis_status));
      ("AnalysisId", Some (analysis_id_to_yojson x.analysis_id));
      ("AnalysisStartedTime", Some (zoned_date_time_to_yojson x.analysis_started_time));
      ( "AnalysisCompletionTime",
        option_to_yojson zoned_date_time_to_yojson x.analysis_completion_time );
      ("EstimatedCompletionTime", Some (zoned_date_time_to_yojson x.estimated_completion_time));
    ]

let get_commitment_purchase_analysis_request_to_yojson
    (x : get_commitment_purchase_analysis_request) =
  assoc_to_yojson [ ("AnalysisId", Some (analysis_id_to_yojson x.analysis_id)) ]

let analysis_not_found_exception_to_yojson (x : analysis_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let approximate_usage_records_per_service_to_yojson tree =
  map_to_yojson generic_string_to_yojson non_negative_long_to_yojson tree

let get_approximate_usage_records_response_to_yojson (x : get_approximate_usage_records_response) =
  assoc_to_yojson
    [
      ("LookbackPeriod", option_to_yojson date_interval_to_yojson x.lookback_period);
      ("TotalRecords", option_to_yojson non_negative_long_to_yojson x.total_records);
      ("Services", option_to_yojson approximate_usage_records_per_service_to_yojson x.services);
    ]

let approximation_dimension_to_yojson (x : approximation_dimension) =
  match x with RESOURCE -> `String "RESOURCE" | SERVICE -> `String "SERVICE"

let get_approximate_usage_records_request_to_yojson (x : get_approximate_usage_records_request) =
  assoc_to_yojson
    [
      ("ApproximationDimension", Some (approximation_dimension_to_yojson x.approximation_dimension));
      ("Services", option_to_yojson usage_services_to_yojson x.services);
      ("Granularity", Some (granularity_to_yojson x.granularity));
    ]

let anomaly_subscription_to_yojson (x : anomaly_subscription) =
  assoc_to_yojson
    [
      ("ThresholdExpression", option_to_yojson expression_to_yojson x.threshold_expression);
      ("SubscriptionName", Some (generic_string_to_yojson x.subscription_name));
      ("Frequency", Some (anomaly_subscription_frequency_to_yojson x.frequency));
      ("Threshold", option_to_yojson nullable_non_negative_double_to_yojson x.threshold);
      ("Subscribers", Some (subscribers_to_yojson x.subscribers));
      ("MonitorArnList", Some (monitor_arn_list_to_yojson x.monitor_arn_list));
      ("AccountId", option_to_yojson generic_string_to_yojson x.account_id);
      ("SubscriptionArn", option_to_yojson generic_string_to_yojson x.subscription_arn);
    ]

let anomaly_subscriptions_to_yojson tree = list_to_yojson anomaly_subscription_to_yojson tree

let get_anomaly_subscriptions_response_to_yojson (x : get_anomaly_subscriptions_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("AnomalySubscriptions", Some (anomaly_subscriptions_to_yojson x.anomaly_subscriptions));
    ]

let get_anomaly_subscriptions_request_to_yojson (x : get_anomaly_subscriptions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MonitorArn", option_to_yojson generic_string_to_yojson x.monitor_arn);
      ("SubscriptionArnList", option_to_yojson values_to_yojson x.subscription_arn_list);
    ]

let anomaly_monitor_to_yojson (x : anomaly_monitor) =
  assoc_to_yojson
    [
      ( "DimensionalValueCount",
        option_to_yojson non_negative_integer_to_yojson x.dimensional_value_count );
      ("MonitorSpecification", option_to_yojson expression_to_yojson x.monitor_specification);
      ("MonitorDimension", option_to_yojson monitor_dimension_to_yojson x.monitor_dimension);
      ("MonitorType", Some (monitor_type_to_yojson x.monitor_type));
      ("LastEvaluatedDate", option_to_yojson year_month_day_to_yojson x.last_evaluated_date);
      ("LastUpdatedDate", option_to_yojson year_month_day_to_yojson x.last_updated_date);
      ("CreationDate", option_to_yojson year_month_day_to_yojson x.creation_date);
      ("MonitorName", Some (generic_string_to_yojson x.monitor_name));
      ("MonitorArn", option_to_yojson generic_string_to_yojson x.monitor_arn);
    ]

let anomaly_monitors_to_yojson tree = list_to_yojson anomaly_monitor_to_yojson tree

let get_anomaly_monitors_response_to_yojson (x : get_anomaly_monitors_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("AnomalyMonitors", Some (anomaly_monitors_to_yojson x.anomaly_monitors));
    ]

let get_anomaly_monitors_request_to_yojson (x : get_anomaly_monitors_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("MonitorArnList", option_to_yojson values_to_yojson x.monitor_arn_list);
    ]

let anomaly_score_to_yojson (x : anomaly_score) =
  assoc_to_yojson
    [
      ("CurrentScore", Some (generic_double_to_yojson x.current_score));
      ("MaxScore", Some (generic_double_to_yojson x.max_score));
    ]

let anomaly_to_yojson (x : anomaly) =
  assoc_to_yojson
    [
      ("Feedback", option_to_yojson anomaly_feedback_type_to_yojson x.feedback);
      ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn));
      ("Impact", Some (impact_to_yojson x.impact));
      ("AnomalyScore", Some (anomaly_score_to_yojson x.anomaly_score));
      ("RootCauses", option_to_yojson root_causes_to_yojson x.root_causes);
      ("DimensionValue", option_to_yojson generic_string_to_yojson x.dimension_value);
      ("AnomalyEndDate", option_to_yojson year_month_day_to_yojson x.anomaly_end_date);
      ("AnomalyStartDate", option_to_yojson year_month_day_to_yojson x.anomaly_start_date);
      ("AnomalyId", Some (generic_string_to_yojson x.anomaly_id));
    ]

let anomalies_to_yojson tree = list_to_yojson anomaly_to_yojson tree

let get_anomalies_response_to_yojson (x : get_anomalies_response) =
  assoc_to_yojson
    [
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("Anomalies", Some (anomalies_to_yojson x.anomalies));
    ]

let anomaly_date_interval_to_yojson (x : anomaly_date_interval) =
  assoc_to_yojson
    [
      ("EndDate", option_to_yojson year_month_day_to_yojson x.end_date);
      ("StartDate", Some (year_month_day_to_yojson x.start_date));
    ]

let get_anomalies_request_to_yojson (x : get_anomalies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("NextPageToken", option_to_yojson next_page_token_to_yojson x.next_page_token);
      ("TotalImpact", option_to_yojson total_impact_filter_to_yojson x.total_impact);
      ("Feedback", option_to_yojson anomaly_feedback_type_to_yojson x.feedback);
      ("DateInterval", Some (anomaly_date_interval_to_yojson x.date_interval));
      ("MonitorArn", option_to_yojson generic_string_to_yojson x.monitor_arn);
    ]

let cost_category_to_yojson (x : cost_category) =
  assoc_to_yojson
    [
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
      ( "ProcessingStatus",
        option_to_yojson cost_category_processing_status_list_to_yojson x.processing_status );
      ( "SplitChargeRules",
        option_to_yojson cost_category_split_charge_rules_list_to_yojson x.split_charge_rules );
      ("Rules", Some (cost_category_rules_list_to_yojson x.rules));
      ("RuleVersion", Some (cost_category_rule_version_to_yojson x.rule_version));
      ("Name", Some (cost_category_name_to_yojson x.name));
      ("EffectiveEnd", option_to_yojson zoned_date_time_to_yojson x.effective_end);
      ("EffectiveStart", Some (zoned_date_time_to_yojson x.effective_start));
      ("CostCategoryArn", Some (arn_to_yojson x.cost_category_arn));
    ]

let describe_cost_category_definition_response_to_yojson
    (x : describe_cost_category_definition_response) =
  assoc_to_yojson [ ("CostCategory", option_to_yojson cost_category_to_yojson x.cost_category) ]

let describe_cost_category_definition_request_to_yojson
    (x : describe_cost_category_definition_request) =
  assoc_to_yojson
    [
      ("EffectiveOn", option_to_yojson zoned_date_time_to_yojson x.effective_on);
      ("CostCategoryArn", Some (arn_to_yojson x.cost_category_arn));
    ]

let delete_cost_category_definition_response_to_yojson
    (x : delete_cost_category_definition_response) =
  assoc_to_yojson
    [
      ("EffectiveEnd", option_to_yojson zoned_date_time_to_yojson x.effective_end);
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
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
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("CostCategoryArn", option_to_yojson arn_to_yojson x.cost_category_arn);
    ]

let create_cost_category_definition_request_to_yojson (x : create_cost_category_definition_request)
    =
  assoc_to_yojson
    [
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ( "SplitChargeRules",
        option_to_yojson cost_category_split_charge_rules_list_to_yojson x.split_charge_rules );
      ("DefaultValue", option_to_yojson cost_category_value_to_yojson x.default_value);
      ("Rules", Some (cost_category_rules_list_to_yojson x.rules));
      ("RuleVersion", Some (cost_category_rule_version_to_yojson x.rule_version));
      ("EffectiveStart", option_to_yojson zoned_date_time_to_yojson x.effective_start);
      ("Name", Some (cost_category_name_to_yojson x.name));
    ]

let create_anomaly_subscription_response_to_yojson (x : create_anomaly_subscription_response) =
  assoc_to_yojson [ ("SubscriptionArn", Some (generic_string_to_yojson x.subscription_arn)) ]

let create_anomaly_subscription_request_to_yojson (x : create_anomaly_subscription_request) =
  assoc_to_yojson
    [
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("AnomalySubscription", Some (anomaly_subscription_to_yojson x.anomaly_subscription));
    ]

let create_anomaly_monitor_response_to_yojson (x : create_anomaly_monitor_response) =
  assoc_to_yojson [ ("MonitorArn", Some (generic_string_to_yojson x.monitor_arn)) ]

let create_anomaly_monitor_request_to_yojson (x : create_anomaly_monitor_request) =
  assoc_to_yojson
    [
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("AnomalyMonitor", Some (anomaly_monitor_to_yojson x.anomaly_monitor));
    ]
