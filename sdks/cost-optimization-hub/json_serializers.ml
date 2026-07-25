open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let enrollment_status_to_yojson (x : enrollment_status) =
  match x with ACTIVE -> `String "Active" | INACTIVE -> `String "Inactive"

let account_id_to_yojson = string_to_yojson

let account_enrollment_status_to_yojson (x : account_enrollment_status) =
  assoc_to_yojson
    [
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("status", option_to_yojson enrollment_status_to_yojson x.status);
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let account_enrollment_statuses_to_yojson tree =
  list_to_yojson account_enrollment_status_to_yojson tree

let account_id_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let action_type_to_yojson (x : action_type) =
  match x with
  | RIGHTSIZE -> `String "Rightsize"
  | STOP -> `String "Stop"
  | UPGRADE -> `String "Upgrade"
  | PURCHASE_SAVINGS_PLANS -> `String "PurchaseSavingsPlans"
  | PURCHASE_RESERVED_INSTANCES -> `String "PurchaseReservedInstances"
  | MIGRATE_TO_GRAVITON -> `String "MigrateToGraviton"
  | DELETE -> `String "Delete"
  | SCALE_IN -> `String "ScaleIn"

let action_type_list_to_yojson tree = list_to_yojson action_type_to_yojson tree

let allocation_strategy_to_yojson (x : allocation_strategy) =
  match x with PRIORITIZED -> `String "Prioritized" | LOWEST_PRICE -> `String "LowestPrice"

let estimated_discounts_to_yojson (x : estimated_discounts) =
  assoc_to_yojson
    [
      ( "savingsPlansDiscount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.savings_plans_discount );
      ( "reservedInstancesDiscount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.reserved_instances_discount );
      ( "otherDiscount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.other_discount );
    ]

let resource_pricing_to_yojson (x : resource_pricing) =
  assoc_to_yojson
    [
      ( "estimatedCostBeforeDiscounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_cost_before_discounts );
      ( "estimatedNetUnusedAmortizedCommitments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_net_unused_amortized_commitments );
      ("estimatedDiscounts", option_to_yojson estimated_discounts_to_yojson x.estimated_discounts);
      ( "estimatedCostAfterDiscounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_cost_after_discounts );
    ]

let usage_to_yojson (x : usage) =
  assoc_to_yojson
    [
      ( "usageType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_type );
      ( "usageAmount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.usage_amount );
      ( "operation",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.operation );
      ( "productCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.product_code );
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
    ]

let usage_list_to_yojson tree = list_to_yojson usage_to_yojson tree

let resource_cost_calculation_to_yojson (x : resource_cost_calculation) =
  assoc_to_yojson
    [
      ("usages", option_to_yojson usage_list_to_yojson x.usages);
      ("pricing", option_to_yojson resource_pricing_to_yojson x.pricing);
    ]

let aurora_db_cluster_storage_configuration_to_yojson (x : aurora_db_cluster_storage_configuration)
    =
  assoc_to_yojson
    [
      ( "storageType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.storage_type );
    ]

let aurora_db_cluster_storage_to_yojson (x : aurora_db_cluster_storage) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson aurora_db_cluster_storage_configuration_to_yojson x.configuration );
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let block_storage_performance_configuration_to_yojson (x : block_storage_performance_configuration)
    =
  assoc_to_yojson
    [
      ("iops", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.iops);
      ( "throughput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.throughput );
    ]

let compute_configuration_to_yojson (x : compute_configuration) =
  assoc_to_yojson
    [
      ("vCpu", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.v_cpu);
      ( "memorySizeInMB",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_m_b );
      ( "architecture",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.architecture );
      ( "platform",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.platform );
    ]

let savings_plans_pricing_to_yojson (x : savings_plans_pricing) =
  assoc_to_yojson
    [
      ( "monthlySavingsPlansEligibleCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.monthly_savings_plans_eligible_cost );
      ( "estimatedMonthlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_commitment );
      ( "savingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.savings_percentage
      );
      ( "estimatedOnDemandCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_on_demand_cost );
    ]

let savings_plans_cost_calculation_to_yojson (x : savings_plans_cost_calculation) =
  assoc_to_yojson [ ("pricing", option_to_yojson savings_plans_pricing_to_yojson x.pricing) ]

let compute_savings_plans_configuration_to_yojson (x : compute_savings_plans_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "hourlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hourly_commitment
      );
    ]

let compute_savings_plans_to_yojson (x : compute_savings_plans) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson compute_savings_plans_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson savings_plans_cost_calculation_to_yojson x.cost_calculation );
    ]

let validation_exception_detail_to_yojson (x : validation_exception_detail) =
  assoc_to_yojson
    [
      ("fieldName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.field_name));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_details_to_yojson tree =
  list_to_yojson validation_exception_detail_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | FIELD_VALIDATION_FAILED -> `String "FieldValidationFailed"
  | OTHER -> `String "Other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("fields", option_to_yojson validation_exception_details_to_yojson x.fields);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let payment_option_to_yojson (x : payment_option) =
  match x with
  | ALL_UPFRONT -> `String "AllUpfront"
  | PARTIAL_UPFRONT -> `String "PartialUpfront"
  | NO_UPFRONT -> `String "NoUpfront"

let term_to_yojson (x : term) =
  match x with ONE_YEAR -> `String "OneYear" | THREE_YEARS -> `String "ThreeYears"

let preferred_commitment_to_yojson (x : preferred_commitment) =
  assoc_to_yojson
    [
      ("term", option_to_yojson term_to_yojson x.term);
      ("paymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
    ]

let member_account_discount_visibility_to_yojson (x : member_account_discount_visibility) =
  match x with ALL -> `String "All" | NONE -> `String "None"

let savings_estimation_mode_to_yojson (x : savings_estimation_mode) =
  match x with
  | BEFORE_DISCOUNTS -> `String "BeforeDiscounts"
  | AFTER_DISCOUNTS -> `String "AfterDiscounts"

let update_preferences_response_to_yojson (x : update_preferences_response) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ( "memberAccountDiscountVisibility",
        option_to_yojson member_account_discount_visibility_to_yojson
          x.member_account_discount_visibility );
      ("preferredCommitment", option_to_yojson preferred_commitment_to_yojson x.preferred_commitment);
    ]

let update_preferences_request_to_yojson (x : update_preferences_request) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ( "memberAccountDiscountVisibility",
        option_to_yojson member_account_discount_visibility_to_yojson
          x.member_account_discount_visibility );
      ("preferredCommitment", option_to_yojson preferred_commitment_to_yojson x.preferred_commitment);
    ]

let update_enrollment_status_response_to_yojson (x : update_enrollment_status_response) =
  assoc_to_yojson
    [
      ("status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status);
    ]

let update_enrollment_status_request_to_yojson (x : update_enrollment_status_request) =
  assoc_to_yojson
    [
      ("status", Some (enrollment_status_to_yojson x.status));
      ( "includeMemberAccounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.include_member_accounts );
    ]

let summary_metrics_result_to_yojson (x : summary_metrics_result) =
  assoc_to_yojson
    [
      ( "savingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.savings_percentage );
    ]

let recommendation_summary_to_yojson (x : recommendation_summary) =
  assoc_to_yojson
    [
      ("group", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group);
      ( "estimatedMonthlySavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_savings );
      ( "recommendationCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recommendation_count );
    ]

let recommendation_summaries_list_to_yojson tree =
  list_to_yojson recommendation_summary_to_yojson tree

let list_recommendation_summaries_response_to_yojson (x : list_recommendation_summaries_response) =
  assoc_to_yojson
    [
      ( "estimatedTotalDedupedSavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_total_deduped_savings );
      ("items", option_to_yojson recommendation_summaries_list_to_yojson x.items);
      ( "groupBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group_by );
      ( "currencyCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency_code );
      ("metrics", option_to_yojson summary_metrics_result_to_yojson x.metrics);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let summary_metrics_to_yojson (x : summary_metrics) =
  match x with SAVINGS_PERCENTAGE -> `String "SavingsPercentage"

let summary_metrics_list_to_yojson tree = list_to_yojson summary_metrics_to_yojson tree
let max_results_to_yojson = int_to_yojson

let recommendation_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let resource_arn_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let resource_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
      ("value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let resource_type_to_yojson (x : resource_type) =
  match x with
  | EC2_INSTANCE -> `String "Ec2Instance"
  | LAMBDA_FUNCTION -> `String "LambdaFunction"
  | EBS_VOLUME -> `String "EbsVolume"
  | ECS_SERVICE -> `String "EcsService"
  | EC2_AUTO_SCALING_GROUP -> `String "Ec2AutoScalingGroup"
  | EC2_INSTANCE_SAVINGS_PLANS -> `String "Ec2InstanceSavingsPlans"
  | COMPUTE_SAVINGS_PLANS -> `String "ComputeSavingsPlans"
  | SAGE_MAKER_SAVINGS_PLANS -> `String "SageMakerSavingsPlans"
  | EC2_RESERVED_INSTANCES -> `String "Ec2ReservedInstances"
  | RDS_RESERVED_INSTANCES -> `String "RdsReservedInstances"
  | OPEN_SEARCH_RESERVED_INSTANCES -> `String "OpenSearchReservedInstances"
  | REDSHIFT_RESERVED_INSTANCES -> `String "RedshiftReservedInstances"
  | ELASTI_CACHE_RESERVED_INSTANCES -> `String "ElastiCacheReservedInstances"
  | RDS_DB_INSTANCE_STORAGE -> `String "RdsDbInstanceStorage"
  | RDS_DB_INSTANCE -> `String "RdsDbInstance"
  | AURORA_DB_CLUSTER_STORAGE -> `String "AuroraDbClusterStorage"
  | DYNAMO_DB_RESERVED_CAPACITY -> `String "DynamoDbReservedCapacity"
  | MEMORY_DB_RESERVED_INSTANCES -> `String "MemoryDbReservedInstances"
  | NAT_GATEWAY -> `String "NatGateway"
  | DYNAMO_DB_TABLE -> `String "DynamoDBTable"
  | ELASTI_CACHE_CLUSTER -> `String "ElastiCacheCluster"
  | MEMORY_DB_CLUSTER -> `String "MemoryDBCluster"
  | DOCUMENT_DB_CLUSTER -> `String "DocumentDBCluster"
  | WORK_SPACES -> `String "WorkSpaces"
  | SAGE_MAKER_ENDPOINT -> `String "SageMakerEndpoint"

let resource_type_list_to_yojson tree = list_to_yojson resource_type_to_yojson tree

let region_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let implementation_effort_to_yojson (x : implementation_effort) =
  match x with
  | VERY_LOW -> `String "VeryLow"
  | LOW -> `String "Low"
  | MEDIUM -> `String "Medium"
  | HIGH -> `String "High"
  | VERY_HIGH -> `String "VeryHigh"

let implementation_effort_list_to_yojson tree = list_to_yojson implementation_effort_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "rollbackPossible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.rollback_possible );
      ( "implementationEfforts",
        option_to_yojson implementation_effort_list_to_yojson x.implementation_efforts );
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
      ("regions", option_to_yojson region_list_to_yojson x.regions);
      ("resourceTypes", option_to_yojson resource_type_list_to_yojson x.resource_types);
      ("actionTypes", option_to_yojson action_type_list_to_yojson x.action_types);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("resourceIds", option_to_yojson resource_id_list_to_yojson x.resource_ids);
      ("resourceArns", option_to_yojson resource_arn_list_to_yojson x.resource_arns);
      ("recommendationIds", option_to_yojson recommendation_id_list_to_yojson x.recommendation_ids);
    ]

let list_recommendation_summaries_request_to_yojson (x : list_recommendation_summaries_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson filter_to_yojson x.filter);
      ("groupBy", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group_by));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("metrics", option_to_yojson summary_metrics_list_to_yojson x.metrics);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let source_to_yojson (x : source) =
  match x with
  | COMPUTE_OPTIMIZER -> `String "ComputeOptimizer"
  | COST_EXPLORER -> `String "CostExplorer"

let datetime_to_yojson = timestamp_epoch_seconds_to_yojson

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ( "recommendationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recommendation_id
      );
      ( "accountId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_id );
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ( "currentResourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_type );
      ( "recommendedResourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_type );
      ( "estimatedMonthlySavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_savings );
      ( "estimatedSavingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_savings_percentage );
      ( "estimatedMonthlyCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_cost );
      ( "currencyCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency_code );
      ( "implementationEffort",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.implementation_effort );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "actionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.action_type );
      ( "rollbackPossible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.rollback_possible );
      ( "currentResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_summary );
      ( "recommendedResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_summary );
      ("lastRefreshTimestamp", option_to_yojson datetime_to_yojson x.last_refresh_timestamp);
      ( "recommendationLookbackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recommendation_lookback_period_in_days );
      ("source", option_to_yojson source_to_yojson x.source);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let recommendation_list_to_yojson tree = list_to_yojson recommendation_to_yojson tree

let list_recommendations_response_to_yojson (x : list_recommendations_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson recommendation_list_to_yojson x.items);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let order_to_yojson (x : order) = match x with ASC -> `String "Asc" | DESC -> `String "Desc"

let order_by_to_yojson (x : order_by) =
  assoc_to_yojson
    [
      ( "dimension",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.dimension );
      ("order", option_to_yojson order_to_yojson x.order);
    ]

let list_recommendations_request_to_yojson (x : list_recommendations_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson filter_to_yojson x.filter);
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
      ( "includeAllRecommendations",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.include_all_recommendations );
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_enrollment_statuses_response_to_yojson (x : list_enrollment_statuses_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson account_enrollment_statuses_to_yojson x.items);
      ( "includeMemberAccounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.include_member_accounts );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_enrollment_statuses_request_to_yojson (x : list_enrollment_statuses_request) =
  assoc_to_yojson
    [
      ( "includeOrganizationInfo",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.include_organization_info );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let metrics_by_time_to_yojson (x : metrics_by_time) =
  assoc_to_yojson
    [
      ("score", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.score);
      ("savings", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.savings);
      ("spend", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.spend);
      ( "timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.timestamp );
    ]

let metrics_by_time_list_to_yojson tree = list_to_yojson metrics_by_time_to_yojson tree

let efficiency_metrics_by_group_to_yojson (x : efficiency_metrics_by_group) =
  assoc_to_yojson
    [
      ("metricsByTime", option_to_yojson metrics_by_time_list_to_yojson x.metrics_by_time);
      ("group", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group);
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let efficiency_metrics_by_group_list_to_yojson tree =
  list_to_yojson efficiency_metrics_by_group_to_yojson tree

let list_efficiency_metrics_response_to_yojson (x : list_efficiency_metrics_response) =
  assoc_to_yojson
    [
      ( "efficiencyMetricsByGroup",
        option_to_yojson efficiency_metrics_by_group_list_to_yojson x.efficiency_metrics_by_group );
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ("start", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.start));
      ("end", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.end_));
    ]

let granularity_type_to_yojson (x : granularity_type) =
  match x with DAILY -> `String "Daily" | MONTHLY -> `String "Monthly"

let list_efficiency_metrics_request_to_yojson (x : list_efficiency_metrics_request) =
  assoc_to_yojson
    [
      ( "groupBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group_by );
      ("granularity", Some (granularity_type_to_yojson x.granularity));
      ("timePeriod", Some (time_period_to_yojson x.time_period));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
    ]

let sage_maker_endpoint_to_yojson (x : sage_maker_endpoint) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let work_spaces_to_yojson (x : work_spaces) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let document_db_cluster_to_yojson (x : document_db_cluster) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let memory_db_cluster_to_yojson (x : memory_db_cluster) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let elasti_cache_cluster_to_yojson (x : elasti_cache_cluster) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let dynamo_db_table_to_yojson (x : dynamo_db_table) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let nat_gateway_configuration_to_yojson (x : nat_gateway_configuration) =
  assoc_to_yojson
    [
      ( "activeConnectionCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.active_connection_count );
      ( "packetsInFromSource",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.packets_in_from_source );
      ( "packetsInFromDestination",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.packets_in_from_destination );
    ]

let nat_gateway_to_yojson (x : nat_gateway) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson nat_gateway_configuration_to_yojson x.configuration);
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let reserved_instances_pricing_to_yojson (x : reserved_instances_pricing) =
  assoc_to_yojson
    [
      ( "estimatedOnDemandCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_on_demand_cost );
      ( "monthlyReservationEligibleCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.monthly_reservation_eligible_cost );
      ( "savingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.savings_percentage
      );
      ( "estimatedMonthlyAmortizedReservationCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_amortized_reservation_cost );
    ]

let reserved_instances_cost_calculation_to_yojson (x : reserved_instances_cost_calculation) =
  assoc_to_yojson [ ("pricing", option_to_yojson reserved_instances_pricing_to_yojson x.pricing) ]

let memory_db_reserved_instances_configuration_to_yojson
    (x : memory_db_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
    ]

let memory_db_reserved_instances_to_yojson (x : memory_db_reserved_instances) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson memory_db_reserved_instances_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
    ]

let dynamo_db_reserved_capacity_configuration_to_yojson
    (x : dynamo_db_reserved_capacity_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "numberOfCapacityUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_capacity_units_to_purchase );
      ( "capacityUnits",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.capacity_units );
    ]

let dynamo_db_reserved_capacity_to_yojson (x : dynamo_db_reserved_capacity) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson dynamo_db_reserved_capacity_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
    ]

let rds_db_instance_storage_configuration_to_yojson (x : rds_db_instance_storage_configuration) =
  assoc_to_yojson
    [
      ( "storageType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.storage_type );
      ( "allocatedStorageInGb",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.allocated_storage_in_gb );
      ("iops", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.iops);
      ( "storageThroughput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.storage_throughput
      );
    ]

let rds_db_instance_storage_to_yojson (x : rds_db_instance_storage) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson rds_db_instance_storage_configuration_to_yojson x.configuration );
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let db_instance_configuration_to_yojson (x : db_instance_configuration) =
  assoc_to_yojson
    [
      ( "dbInstanceClass",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.db_instance_class
      );
    ]

let rds_db_instance_configuration_to_yojson (x : rds_db_instance_configuration) =
  assoc_to_yojson [ ("instance", option_to_yojson db_instance_configuration_to_yojson x.instance) ]

let rds_db_instance_to_yojson (x : rds_db_instance) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson rds_db_instance_configuration_to_yojson x.configuration);
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let sage_maker_savings_plans_configuration_to_yojson (x : sage_maker_savings_plans_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "hourlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hourly_commitment
      );
    ]

let sage_maker_savings_plans_to_yojson (x : sage_maker_savings_plans) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson sage_maker_savings_plans_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson savings_plans_cost_calculation_to_yojson x.cost_calculation );
    ]

let ec2_instance_savings_plans_configuration_to_yojson
    (x : ec2_instance_savings_plans_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "hourlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hourly_commitment
      );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "savingsPlansRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.savings_plans_region );
    ]

let ec2_instance_savings_plans_to_yojson (x : ec2_instance_savings_plans) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson ec2_instance_savings_plans_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson savings_plans_cost_calculation_to_yojson x.cost_calculation );
    ]

let redshift_reserved_instances_configuration_to_yojson
    (x : redshift_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
    ]

let redshift_reserved_instances_to_yojson (x : redshift_reserved_instances) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson redshift_reserved_instances_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
    ]

let open_search_reserved_instances_configuration_to_yojson
    (x : open_search_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
    ]

let open_search_reserved_instances_to_yojson (x : open_search_reserved_instances) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson open_search_reserved_instances_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
    ]

let elasti_cache_reserved_instances_configuration_to_yojson
    (x : elasti_cache_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
    ]

let elasti_cache_reserved_instances_to_yojson (x : elasti_cache_reserved_instances) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson elasti_cache_reserved_instances_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
    ]

let rds_reserved_instances_configuration_to_yojson (x : rds_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "licenseModel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.license_model );
      ( "databaseEdition",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.database_edition
      );
      ( "databaseEngine",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.database_engine
      );
      ( "deploymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.deployment_option
      );
    ]

let rds_reserved_instances_to_yojson (x : rds_reserved_instances) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson rds_reserved_instances_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
    ]

let ec2_reserved_instances_configuration_to_yojson (x : ec2_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "offeringClass",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.offering_class );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "platform",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.platform );
      ("tenancy", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tenancy);
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
    ]

let ec2_reserved_instances_to_yojson (x : ec2_reserved_instances) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson ec2_reserved_instances_configuration_to_yojson x.configuration );
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
    ]

let ec2_auto_scaling_group_type_to_yojson (x : ec2_auto_scaling_group_type) =
  match x with
  | SINGLE_INSTANCE_TYPE -> `String "SingleInstanceType"
  | MIXED_INSTANCE_TYPES -> `String "MixedInstanceTypes"

let mixed_instance_configuration_to_yojson (x : mixed_instance_configuration) =
  assoc_to_yojson
    [ ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_) ]

let mixed_instance_configuration_list_to_yojson tree =
  list_to_yojson mixed_instance_configuration_to_yojson tree

let instance_configuration_to_yojson (x : instance_configuration) =
  assoc_to_yojson
    [ ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_) ]

let ec2_auto_scaling_group_configuration_to_yojson (x : ec2_auto_scaling_group_configuration) =
  assoc_to_yojson
    [
      ("instance", option_to_yojson instance_configuration_to_yojson x.instance);
      ( "mixedInstances",
        option_to_yojson mixed_instance_configuration_list_to_yojson x.mixed_instances );
      ("type", option_to_yojson ec2_auto_scaling_group_type_to_yojson x.type_);
      ("allocationStrategy", option_to_yojson allocation_strategy_to_yojson x.allocation_strategy);
    ]

let ec2_auto_scaling_group_to_yojson (x : ec2_auto_scaling_group) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson ec2_auto_scaling_group_configuration_to_yojson x.configuration );
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let storage_configuration_to_yojson (x : storage_configuration) =
  assoc_to_yojson
    [
      ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_);
      ( "sizeInGb",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.size_in_gb );
    ]

let ebs_volume_configuration_to_yojson (x : ebs_volume_configuration) =
  assoc_to_yojson
    [
      ("storage", option_to_yojson storage_configuration_to_yojson x.storage);
      ( "performance",
        option_to_yojson block_storage_performance_configuration_to_yojson x.performance );
      ( "attachmentState",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.attachment_state
      );
    ]

let ebs_volume_to_yojson (x : ebs_volume) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson ebs_volume_configuration_to_yojson x.configuration);
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let ec2_instance_configuration_to_yojson (x : ec2_instance_configuration) =
  assoc_to_yojson [ ("instance", option_to_yojson instance_configuration_to_yojson x.instance) ]

let ec2_instance_to_yojson (x : ec2_instance) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson ec2_instance_configuration_to_yojson x.configuration);
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let ecs_service_configuration_to_yojson (x : ecs_service_configuration) =
  assoc_to_yojson [ ("compute", option_to_yojson compute_configuration_to_yojson x.compute) ]

let ecs_service_to_yojson (x : ecs_service) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson ecs_service_configuration_to_yojson x.configuration);
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let lambda_function_configuration_to_yojson (x : lambda_function_configuration) =
  assoc_to_yojson [ ("compute", option_to_yojson compute_configuration_to_yojson x.compute) ]

let lambda_function_to_yojson (x : lambda_function) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson lambda_function_configuration_to_yojson x.configuration);
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
    ]

let resource_details_to_yojson (x : resource_details) =
  match x with
  | LambdaFunction arg ->
      assoc_to_yojson [ ("lambdaFunction", Some (lambda_function_to_yojson arg)) ]
  | EcsService arg -> assoc_to_yojson [ ("ecsService", Some (ecs_service_to_yojson arg)) ]
  | Ec2Instance arg -> assoc_to_yojson [ ("ec2Instance", Some (ec2_instance_to_yojson arg)) ]
  | EbsVolume arg -> assoc_to_yojson [ ("ebsVolume", Some (ebs_volume_to_yojson arg)) ]
  | Ec2AutoScalingGroup arg ->
      assoc_to_yojson [ ("ec2AutoScalingGroup", Some (ec2_auto_scaling_group_to_yojson arg)) ]
  | Ec2ReservedInstances arg ->
      assoc_to_yojson [ ("ec2ReservedInstances", Some (ec2_reserved_instances_to_yojson arg)) ]
  | RdsReservedInstances arg ->
      assoc_to_yojson [ ("rdsReservedInstances", Some (rds_reserved_instances_to_yojson arg)) ]
  | ElastiCacheReservedInstances arg ->
      assoc_to_yojson
        [ ("elastiCacheReservedInstances", Some (elasti_cache_reserved_instances_to_yojson arg)) ]
  | OpenSearchReservedInstances arg ->
      assoc_to_yojson
        [ ("openSearchReservedInstances", Some (open_search_reserved_instances_to_yojson arg)) ]
  | RedshiftReservedInstances arg ->
      assoc_to_yojson
        [ ("redshiftReservedInstances", Some (redshift_reserved_instances_to_yojson arg)) ]
  | Ec2InstanceSavingsPlans arg ->
      assoc_to_yojson
        [ ("ec2InstanceSavingsPlans", Some (ec2_instance_savings_plans_to_yojson arg)) ]
  | ComputeSavingsPlans arg ->
      assoc_to_yojson [ ("computeSavingsPlans", Some (compute_savings_plans_to_yojson arg)) ]
  | SageMakerSavingsPlans arg ->
      assoc_to_yojson [ ("sageMakerSavingsPlans", Some (sage_maker_savings_plans_to_yojson arg)) ]
  | RdsDbInstance arg -> assoc_to_yojson [ ("rdsDbInstance", Some (rds_db_instance_to_yojson arg)) ]
  | RdsDbInstanceStorage arg ->
      assoc_to_yojson [ ("rdsDbInstanceStorage", Some (rds_db_instance_storage_to_yojson arg)) ]
  | AuroraDbClusterStorage arg ->
      assoc_to_yojson [ ("auroraDbClusterStorage", Some (aurora_db_cluster_storage_to_yojson arg)) ]
  | DynamoDbReservedCapacity arg ->
      assoc_to_yojson
        [ ("dynamoDbReservedCapacity", Some (dynamo_db_reserved_capacity_to_yojson arg)) ]
  | MemoryDbReservedInstances arg ->
      assoc_to_yojson
        [ ("memoryDbReservedInstances", Some (memory_db_reserved_instances_to_yojson arg)) ]
  | NatGateway arg -> assoc_to_yojson [ ("natGateway", Some (nat_gateway_to_yojson arg)) ]
  | DynamoDbTable arg -> assoc_to_yojson [ ("dynamoDbTable", Some (dynamo_db_table_to_yojson arg)) ]
  | ElastiCacheCluster arg ->
      assoc_to_yojson [ ("elastiCacheCluster", Some (elasti_cache_cluster_to_yojson arg)) ]
  | MemoryDbCluster arg ->
      assoc_to_yojson [ ("memoryDbCluster", Some (memory_db_cluster_to_yojson arg)) ]
  | DocumentDbCluster arg ->
      assoc_to_yojson [ ("documentDbCluster", Some (document_db_cluster_to_yojson arg)) ]
  | WorkSpaces arg -> assoc_to_yojson [ ("workSpaces", Some (work_spaces_to_yojson arg)) ]
  | SageMakerEndpoint arg ->
      assoc_to_yojson [ ("sageMakerEndpoint", Some (sage_maker_endpoint_to_yojson arg)) ]

let get_recommendation_response_to_yojson (x : get_recommendation_response) =
  assoc_to_yojson
    [
      ( "recommendationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recommendation_id
      );
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ( "accountId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_id );
      ( "currencyCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency_code );
      ( "recommendationLookbackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recommendation_lookback_period_in_days );
      ( "costCalculationLookbackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.cost_calculation_lookback_period_in_days );
      ( "estimatedSavingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_savings_percentage );
      ( "estimatedSavingsOverCostCalculationLookbackPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_savings_over_cost_calculation_lookback_period );
      ("currentResourceType", option_to_yojson resource_type_to_yojson x.current_resource_type);
      ( "recommendedResourceType",
        option_to_yojson resource_type_to_yojson x.recommended_resource_type );
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("source", option_to_yojson source_to_yojson x.source);
      ("lastRefreshTimestamp", option_to_yojson datetime_to_yojson x.last_refresh_timestamp);
      ( "estimatedMonthlySavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_savings );
      ( "estimatedMonthlyCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_cost );
      ( "implementationEffort",
        option_to_yojson implementation_effort_to_yojson x.implementation_effort );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ("actionType", option_to_yojson action_type_to_yojson x.action_type);
      ( "rollbackPossible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.rollback_possible );
      ( "currentResourceDetails",
        option_to_yojson resource_details_to_yojson x.current_resource_details );
      ( "recommendedResourceDetails",
        option_to_yojson resource_details_to_yojson x.recommended_resource_details );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let get_recommendation_request_to_yojson (x : get_recommendation_request) =
  assoc_to_yojson
    [
      ( "recommendationId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recommendation_id) );
    ]

let get_preferences_response_to_yojson (x : get_preferences_response) =
  assoc_to_yojson
    [
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
      ( "memberAccountDiscountVisibility",
        option_to_yojson member_account_discount_visibility_to_yojson
          x.member_account_discount_visibility );
      ("preferredCommitment", option_to_yojson preferred_commitment_to_yojson x.preferred_commitment);
    ]

let get_preferences_request_to_yojson = unit_to_yojson
