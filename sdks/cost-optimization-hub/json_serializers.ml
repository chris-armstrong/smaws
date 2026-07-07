open Smaws_Lib.Json.SerializeHelpers
open Types

let usage_to_yojson (x : usage) =
  assoc_to_yojson
    [
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
      ( "productCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.product_code );
      ( "operation",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.operation );
      ( "usageAmount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.usage_amount );
      ( "usageType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.usage_type );
    ]

let usage_list_to_yojson tree = list_to_yojson usage_to_yojson tree

let estimated_discounts_to_yojson (x : estimated_discounts) =
  assoc_to_yojson
    [
      ( "otherDiscount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.other_discount );
      ( "reservedInstancesDiscount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.reserved_instances_discount );
      ( "savingsPlansDiscount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.savings_plans_discount );
    ]

let resource_pricing_to_yojson (x : resource_pricing) =
  assoc_to_yojson
    [
      ( "estimatedCostAfterDiscounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_cost_after_discounts );
      ("estimatedDiscounts", option_to_yojson estimated_discounts_to_yojson x.estimated_discounts);
      ( "estimatedNetUnusedAmortizedCommitments",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_net_unused_amortized_commitments );
      ( "estimatedCostBeforeDiscounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_cost_before_discounts );
    ]

let resource_cost_calculation_to_yojson (x : resource_cost_calculation) =
  assoc_to_yojson
    [
      ("pricing", option_to_yojson resource_pricing_to_yojson x.pricing);
      ("usages", option_to_yojson usage_list_to_yojson x.usages);
    ]

let work_spaces_to_yojson (x : work_spaces) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "Other"
  | FIELD_VALIDATION_FAILED -> `String "FieldValidationFailed"

let validation_exception_detail_to_yojson (x : validation_exception_detail) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("fieldName", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.field_name));
    ]

let validation_exception_details_to_yojson tree =
  list_to_yojson validation_exception_detail_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fields", option_to_yojson validation_exception_details_to_yojson x.fields);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let savings_estimation_mode_to_yojson (x : savings_estimation_mode) =
  match x with
  | AFTER_DISCOUNTS -> `String "AfterDiscounts"
  | BEFORE_DISCOUNTS -> `String "BeforeDiscounts"

let member_account_discount_visibility_to_yojson (x : member_account_discount_visibility) =
  match x with NONE -> `String "None" | ALL -> `String "All"

let term_to_yojson (x : term) =
  match x with THREE_YEARS -> `String "ThreeYears" | ONE_YEAR -> `String "OneYear"

let payment_option_to_yojson (x : payment_option) =
  match x with
  | NO_UPFRONT -> `String "NoUpfront"
  | PARTIAL_UPFRONT -> `String "PartialUpfront"
  | ALL_UPFRONT -> `String "AllUpfront"

let preferred_commitment_to_yojson (x : preferred_commitment) =
  assoc_to_yojson
    [
      ("paymentOption", option_to_yojson payment_option_to_yojson x.payment_option);
      ("term", option_to_yojson term_to_yojson x.term);
    ]

let update_preferences_response_to_yojson (x : update_preferences_response) =
  assoc_to_yojson
    [
      ("preferredCommitment", option_to_yojson preferred_commitment_to_yojson x.preferred_commitment);
      ( "memberAccountDiscountVisibility",
        option_to_yojson member_account_discount_visibility_to_yojson
          x.member_account_discount_visibility );
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let update_preferences_request_to_yojson (x : update_preferences_request) =
  assoc_to_yojson
    [
      ("preferredCommitment", option_to_yojson preferred_commitment_to_yojson x.preferred_commitment);
      ( "memberAccountDiscountVisibility",
        option_to_yojson member_account_discount_visibility_to_yojson
          x.member_account_discount_visibility );
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let update_enrollment_status_response_to_yojson (x : update_enrollment_status_response) =
  assoc_to_yojson
    [
      ("status", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status);
    ]

let enrollment_status_to_yojson (x : enrollment_status) =
  match x with INACTIVE -> `String "Inactive" | ACTIVE -> `String "Active"

let update_enrollment_status_request_to_yojson (x : update_enrollment_status_request) =
  assoc_to_yojson
    [
      ( "includeMemberAccounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.include_member_accounts );
      ("status", Some (enrollment_status_to_yojson x.status));
    ]

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ("end", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.end_));
      ("start", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.start));
    ]

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value);
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let summary_metrics_result_to_yojson (x : summary_metrics_result) =
  assoc_to_yojson
    [
      ( "savingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.savings_percentage );
    ]

let summary_metrics_to_yojson (x : summary_metrics) =
  match x with SAVINGS_PERCENTAGE -> `String "SavingsPercentage"

let summary_metrics_list_to_yojson tree = list_to_yojson summary_metrics_to_yojson tree

let storage_configuration_to_yojson (x : storage_configuration) =
  assoc_to_yojson
    [
      ( "sizeInGb",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.size_in_gb );
      ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_);
    ]

let source_to_yojson (x : source) =
  match x with
  | COST_EXPLORER -> `String "CostExplorer"
  | COMPUTE_OPTIMIZER -> `String "ComputeOptimizer"

let savings_plans_pricing_to_yojson (x : savings_plans_pricing) =
  assoc_to_yojson
    [
      ( "estimatedOnDemandCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_on_demand_cost );
      ( "savingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.savings_percentage
      );
      ( "estimatedMonthlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_commitment );
      ( "monthlySavingsPlansEligibleCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.monthly_savings_plans_eligible_cost );
    ]

let savings_plans_cost_calculation_to_yojson (x : savings_plans_cost_calculation) =
  assoc_to_yojson [ ("pricing", option_to_yojson savings_plans_pricing_to_yojson x.pricing) ]

let sage_maker_savings_plans_configuration_to_yojson (x : sage_maker_savings_plans_configuration) =
  assoc_to_yojson
    [
      ( "hourlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hourly_commitment
      );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let sage_maker_savings_plans_to_yojson (x : sage_maker_savings_plans) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson savings_plans_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson sage_maker_savings_plans_configuration_to_yojson x.configuration );
    ]

let sage_maker_endpoint_to_yojson (x : sage_maker_endpoint) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | SAGE_MAKER_ENDPOINT -> `String "SageMakerEndpoint"
  | WORK_SPACES -> `String "WorkSpaces"
  | DOCUMENT_DB_CLUSTER -> `String "DocumentDBCluster"
  | MEMORY_DB_CLUSTER -> `String "MemoryDBCluster"
  | ELASTI_CACHE_CLUSTER -> `String "ElastiCacheCluster"
  | DYNAMO_DB_TABLE -> `String "DynamoDBTable"
  | NAT_GATEWAY -> `String "NatGateway"
  | MEMORY_DB_RESERVED_INSTANCES -> `String "MemoryDbReservedInstances"
  | DYNAMO_DB_RESERVED_CAPACITY -> `String "DynamoDbReservedCapacity"
  | AURORA_DB_CLUSTER_STORAGE -> `String "AuroraDbClusterStorage"
  | RDS_DB_INSTANCE -> `String "RdsDbInstance"
  | RDS_DB_INSTANCE_STORAGE -> `String "RdsDbInstanceStorage"
  | ELASTI_CACHE_RESERVED_INSTANCES -> `String "ElastiCacheReservedInstances"
  | REDSHIFT_RESERVED_INSTANCES -> `String "RedshiftReservedInstances"
  | OPEN_SEARCH_RESERVED_INSTANCES -> `String "OpenSearchReservedInstances"
  | RDS_RESERVED_INSTANCES -> `String "RdsReservedInstances"
  | EC2_RESERVED_INSTANCES -> `String "Ec2ReservedInstances"
  | SAGE_MAKER_SAVINGS_PLANS -> `String "SageMakerSavingsPlans"
  | COMPUTE_SAVINGS_PLANS -> `String "ComputeSavingsPlans"
  | EC2_INSTANCE_SAVINGS_PLANS -> `String "Ec2InstanceSavingsPlans"
  | EC2_AUTO_SCALING_GROUP -> `String "Ec2AutoScalingGroup"
  | ECS_SERVICE -> `String "EcsService"
  | EBS_VOLUME -> `String "EbsVolume"
  | LAMBDA_FUNCTION -> `String "LambdaFunction"
  | EC2_INSTANCE -> `String "Ec2Instance"

let resource_type_list_to_yojson tree = list_to_yojson resource_type_to_yojson tree

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let compute_configuration_to_yojson (x : compute_configuration) =
  assoc_to_yojson
    [
      ( "platform",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.platform );
      ( "architecture",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.architecture );
      ( "memorySizeInMB",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.memory_size_in_m_b );
      ("vCpu", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.v_cpu);
    ]

let lambda_function_configuration_to_yojson (x : lambda_function_configuration) =
  assoc_to_yojson [ ("compute", option_to_yojson compute_configuration_to_yojson x.compute) ]

let lambda_function_to_yojson (x : lambda_function) =
  assoc_to_yojson
    [
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ("configuration", option_to_yojson lambda_function_configuration_to_yojson x.configuration);
    ]

let ecs_service_configuration_to_yojson (x : ecs_service_configuration) =
  assoc_to_yojson [ ("compute", option_to_yojson compute_configuration_to_yojson x.compute) ]

let ecs_service_to_yojson (x : ecs_service) =
  assoc_to_yojson
    [
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ("configuration", option_to_yojson ecs_service_configuration_to_yojson x.configuration);
    ]

let instance_configuration_to_yojson (x : instance_configuration) =
  assoc_to_yojson
    [ ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_) ]

let ec2_instance_configuration_to_yojson (x : ec2_instance_configuration) =
  assoc_to_yojson [ ("instance", option_to_yojson instance_configuration_to_yojson x.instance) ]

let ec2_instance_to_yojson (x : ec2_instance) =
  assoc_to_yojson
    [
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ("configuration", option_to_yojson ec2_instance_configuration_to_yojson x.configuration);
    ]

let block_storage_performance_configuration_to_yojson (x : block_storage_performance_configuration)
    =
  assoc_to_yojson
    [
      ( "throughput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.throughput );
      ("iops", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.iops);
    ]

let ebs_volume_configuration_to_yojson (x : ebs_volume_configuration) =
  assoc_to_yojson
    [
      ( "attachmentState",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.attachment_state
      );
      ( "performance",
        option_to_yojson block_storage_performance_configuration_to_yojson x.performance );
      ("storage", option_to_yojson storage_configuration_to_yojson x.storage);
    ]

let ebs_volume_to_yojson (x : ebs_volume) =
  assoc_to_yojson
    [
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ("configuration", option_to_yojson ebs_volume_configuration_to_yojson x.configuration);
    ]

let mixed_instance_configuration_to_yojson (x : mixed_instance_configuration) =
  assoc_to_yojson
    [ ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_) ]

let mixed_instance_configuration_list_to_yojson tree =
  list_to_yojson mixed_instance_configuration_to_yojson tree

let ec2_auto_scaling_group_type_to_yojson (x : ec2_auto_scaling_group_type) =
  match x with
  | MIXED_INSTANCE_TYPES -> `String "MixedInstanceTypes"
  | SINGLE_INSTANCE_TYPE -> `String "SingleInstanceType"

let allocation_strategy_to_yojson (x : allocation_strategy) =
  match x with LOWEST_PRICE -> `String "LowestPrice" | PRIORITIZED -> `String "Prioritized"

let ec2_auto_scaling_group_configuration_to_yojson (x : ec2_auto_scaling_group_configuration) =
  assoc_to_yojson
    [
      ("allocationStrategy", option_to_yojson allocation_strategy_to_yojson x.allocation_strategy);
      ("type", option_to_yojson ec2_auto_scaling_group_type_to_yojson x.type_);
      ( "mixedInstances",
        option_to_yojson mixed_instance_configuration_list_to_yojson x.mixed_instances );
      ("instance", option_to_yojson instance_configuration_to_yojson x.instance);
    ]

let ec2_auto_scaling_group_to_yojson (x : ec2_auto_scaling_group) =
  assoc_to_yojson
    [
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ( "configuration",
        option_to_yojson ec2_auto_scaling_group_configuration_to_yojson x.configuration );
    ]

let ec2_reserved_instances_configuration_to_yojson (x : ec2_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ("tenancy", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tenancy);
      ( "platform",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.platform );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "offeringClass",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.offering_class );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let reserved_instances_pricing_to_yojson (x : reserved_instances_pricing) =
  assoc_to_yojson
    [
      ( "estimatedMonthlyAmortizedReservationCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_amortized_reservation_cost );
      ( "savingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.savings_percentage
      );
      ( "monthlyReservationEligibleCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.monthly_reservation_eligible_cost );
      ( "estimatedOnDemandCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_on_demand_cost );
    ]

let reserved_instances_cost_calculation_to_yojson (x : reserved_instances_cost_calculation) =
  assoc_to_yojson [ ("pricing", option_to_yojson reserved_instances_pricing_to_yojson x.pricing) ]

let ec2_reserved_instances_to_yojson (x : ec2_reserved_instances) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson ec2_reserved_instances_configuration_to_yojson x.configuration );
    ]

let rds_reserved_instances_configuration_to_yojson (x : rds_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "deploymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.deployment_option
      );
      ( "databaseEngine",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.database_engine
      );
      ( "databaseEdition",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.database_edition
      );
      ( "licenseModel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.license_model );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let rds_reserved_instances_to_yojson (x : rds_reserved_instances) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson rds_reserved_instances_configuration_to_yojson x.configuration );
    ]

let elasti_cache_reserved_instances_configuration_to_yojson
    (x : elasti_cache_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let elasti_cache_reserved_instances_to_yojson (x : elasti_cache_reserved_instances) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson elasti_cache_reserved_instances_configuration_to_yojson x.configuration );
    ]

let open_search_reserved_instances_configuration_to_yojson
    (x : open_search_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let open_search_reserved_instances_to_yojson (x : open_search_reserved_instances) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson open_search_reserved_instances_configuration_to_yojson x.configuration );
    ]

let redshift_reserved_instances_configuration_to_yojson
    (x : redshift_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let redshift_reserved_instances_to_yojson (x : redshift_reserved_instances) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson redshift_reserved_instances_configuration_to_yojson x.configuration );
    ]

let ec2_instance_savings_plans_configuration_to_yojson
    (x : ec2_instance_savings_plans_configuration) =
  assoc_to_yojson
    [
      ( "savingsPlansRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.savings_plans_region );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "hourlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hourly_commitment
      );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let ec2_instance_savings_plans_to_yojson (x : ec2_instance_savings_plans) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson savings_plans_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson ec2_instance_savings_plans_configuration_to_yojson x.configuration );
    ]

let compute_savings_plans_configuration_to_yojson (x : compute_savings_plans_configuration) =
  assoc_to_yojson
    [
      ( "hourlyCommitment",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hourly_commitment
      );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let compute_savings_plans_to_yojson (x : compute_savings_plans) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson savings_plans_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson compute_savings_plans_configuration_to_yojson x.configuration );
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
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ("configuration", option_to_yojson rds_db_instance_configuration_to_yojson x.configuration);
    ]

let rds_db_instance_storage_configuration_to_yojson (x : rds_db_instance_storage_configuration) =
  assoc_to_yojson
    [
      ( "storageThroughput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.storage_throughput
      );
      ("iops", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.iops);
      ( "allocatedStorageInGb",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.allocated_storage_in_gb );
      ( "storageType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.storage_type );
    ]

let rds_db_instance_storage_to_yojson (x : rds_db_instance_storage) =
  assoc_to_yojson
    [
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ( "configuration",
        option_to_yojson rds_db_instance_storage_configuration_to_yojson x.configuration );
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
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ( "configuration",
        option_to_yojson aurora_db_cluster_storage_configuration_to_yojson x.configuration );
    ]

let dynamo_db_reserved_capacity_configuration_to_yojson
    (x : dynamo_db_reserved_capacity_configuration) =
  assoc_to_yojson
    [
      ( "capacityUnits",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.capacity_units );
      ( "numberOfCapacityUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_capacity_units_to_purchase );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let dynamo_db_reserved_capacity_to_yojson (x : dynamo_db_reserved_capacity) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson dynamo_db_reserved_capacity_configuration_to_yojson x.configuration );
    ]

let memory_db_reserved_instances_configuration_to_yojson
    (x : memory_db_reserved_instances_configuration) =
  assoc_to_yojson
    [
      ( "currentGeneration",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_generation );
      ( "sizeFlexEligible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.size_flex_eligible );
      ( "instanceFamily",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_family
      );
      ( "instanceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_type );
      ( "numberOfInstancesToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.number_of_instances_to_purchase );
      ( "normalizedUnitsToPurchase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.normalized_units_to_purchase );
      ( "monthlyRecurringCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.monthly_recurring_cost );
      ( "upfrontCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.upfront_cost );
      ( "reservedInstancesRegion",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.reserved_instances_region );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("term", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term);
      ("service", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service);
      ( "accountScope",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_scope );
    ]

let memory_db_reserved_instances_to_yojson (x : memory_db_reserved_instances) =
  assoc_to_yojson
    [
      ( "costCalculation",
        option_to_yojson reserved_instances_cost_calculation_to_yojson x.cost_calculation );
      ( "configuration",
        option_to_yojson memory_db_reserved_instances_configuration_to_yojson x.configuration );
    ]

let nat_gateway_configuration_to_yojson (x : nat_gateway_configuration) =
  assoc_to_yojson
    [
      ( "packetsInFromDestination",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.packets_in_from_destination );
      ( "packetsInFromSource",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.packets_in_from_source );
      ( "activeConnectionCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.active_connection_count );
    ]

let nat_gateway_to_yojson (x : nat_gateway) =
  assoc_to_yojson
    [
      ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation);
      ("configuration", option_to_yojson nat_gateway_configuration_to_yojson x.configuration);
    ]

let dynamo_db_table_to_yojson (x : dynamo_db_table) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let elasti_cache_cluster_to_yojson (x : elasti_cache_cluster) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let memory_db_cluster_to_yojson (x : memory_db_cluster) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let document_db_cluster_to_yojson (x : document_db_cluster) =
  assoc_to_yojson
    [ ("costCalculation", option_to_yojson resource_cost_calculation_to_yojson x.cost_calculation) ]

let resource_details_to_yojson (x : resource_details) =
  match x with
  | SageMakerEndpoint arg ->
      assoc_to_yojson [ ("sageMakerEndpoint", Some (sage_maker_endpoint_to_yojson arg)) ]
  | WorkSpaces arg -> assoc_to_yojson [ ("workSpaces", Some (work_spaces_to_yojson arg)) ]
  | DocumentDbCluster arg ->
      assoc_to_yojson [ ("documentDbCluster", Some (document_db_cluster_to_yojson arg)) ]
  | MemoryDbCluster arg ->
      assoc_to_yojson [ ("memoryDbCluster", Some (memory_db_cluster_to_yojson arg)) ]
  | ElastiCacheCluster arg ->
      assoc_to_yojson [ ("elastiCacheCluster", Some (elasti_cache_cluster_to_yojson arg)) ]
  | DynamoDbTable arg -> assoc_to_yojson [ ("dynamoDbTable", Some (dynamo_db_table_to_yojson arg)) ]
  | NatGateway arg -> assoc_to_yojson [ ("natGateway", Some (nat_gateway_to_yojson arg)) ]
  | MemoryDbReservedInstances arg ->
      assoc_to_yojson
        [ ("memoryDbReservedInstances", Some (memory_db_reserved_instances_to_yojson arg)) ]
  | DynamoDbReservedCapacity arg ->
      assoc_to_yojson
        [ ("dynamoDbReservedCapacity", Some (dynamo_db_reserved_capacity_to_yojson arg)) ]
  | AuroraDbClusterStorage arg ->
      assoc_to_yojson [ ("auroraDbClusterStorage", Some (aurora_db_cluster_storage_to_yojson arg)) ]
  | RdsDbInstanceStorage arg ->
      assoc_to_yojson [ ("rdsDbInstanceStorage", Some (rds_db_instance_storage_to_yojson arg)) ]
  | RdsDbInstance arg -> assoc_to_yojson [ ("rdsDbInstance", Some (rds_db_instance_to_yojson arg)) ]
  | SageMakerSavingsPlans arg ->
      assoc_to_yojson [ ("sageMakerSavingsPlans", Some (sage_maker_savings_plans_to_yojson arg)) ]
  | ComputeSavingsPlans arg ->
      assoc_to_yojson [ ("computeSavingsPlans", Some (compute_savings_plans_to_yojson arg)) ]
  | Ec2InstanceSavingsPlans arg ->
      assoc_to_yojson
        [ ("ec2InstanceSavingsPlans", Some (ec2_instance_savings_plans_to_yojson arg)) ]
  | RedshiftReservedInstances arg ->
      assoc_to_yojson
        [ ("redshiftReservedInstances", Some (redshift_reserved_instances_to_yojson arg)) ]
  | OpenSearchReservedInstances arg ->
      assoc_to_yojson
        [ ("openSearchReservedInstances", Some (open_search_reserved_instances_to_yojson arg)) ]
  | ElastiCacheReservedInstances arg ->
      assoc_to_yojson
        [ ("elastiCacheReservedInstances", Some (elasti_cache_reserved_instances_to_yojson arg)) ]
  | RdsReservedInstances arg ->
      assoc_to_yojson [ ("rdsReservedInstances", Some (rds_reserved_instances_to_yojson arg)) ]
  | Ec2ReservedInstances arg ->
      assoc_to_yojson [ ("ec2ReservedInstances", Some (ec2_reserved_instances_to_yojson arg)) ]
  | Ec2AutoScalingGroup arg ->
      assoc_to_yojson [ ("ec2AutoScalingGroup", Some (ec2_auto_scaling_group_to_yojson arg)) ]
  | EbsVolume arg -> assoc_to_yojson [ ("ebsVolume", Some (ebs_volume_to_yojson arg)) ]
  | Ec2Instance arg -> assoc_to_yojson [ ("ec2Instance", Some (ec2_instance_to_yojson arg)) ]
  | EcsService arg -> assoc_to_yojson [ ("ecsService", Some (ecs_service_to_yojson arg)) ]
  | LambdaFunction arg ->
      assoc_to_yojson [ ("lambdaFunction", Some (lambda_function_to_yojson arg)) ]

let resource_arn_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let region_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let recommendation_summary_to_yojson (x : recommendation_summary) =
  assoc_to_yojson
    [
      ( "recommendationCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recommendation_count );
      ( "estimatedMonthlySavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_savings );
      ("group", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group);
    ]

let recommendation_summaries_list_to_yojson tree =
  list_to_yojson recommendation_summary_to_yojson tree

let datetime_to_yojson = timestamp_epoch_seconds_to_yojson

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("source", option_to_yojson source_to_yojson x.source);
      ( "recommendationLookbackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recommendation_lookback_period_in_days );
      ("lastRefreshTimestamp", option_to_yojson datetime_to_yojson x.last_refresh_timestamp);
      ( "recommendedResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_summary );
      ( "currentResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_summary );
      ( "rollbackPossible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.rollback_possible );
      ( "actionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.action_type );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "implementationEffort",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.implementation_effort );
      ( "currencyCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency_code );
      ( "estimatedMonthlyCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_cost );
      ( "estimatedSavingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_savings_percentage );
      ( "estimatedMonthlySavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_savings );
      ( "recommendedResourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_type );
      ( "currentResourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_type );
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ( "accountId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_id );
      ( "recommendationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recommendation_id
      );
    ]

let recommendation_list_to_yojson tree = list_to_yojson recommendation_to_yojson tree

let recommendation_id_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let order_to_yojson (x : order) = match x with DESC -> `String "Desc" | ASC -> `String "Asc"

let order_by_to_yojson (x : order_by) =
  assoc_to_yojson
    [
      ("order", option_to_yojson order_to_yojson x.order);
      ( "dimension",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.dimension );
    ]

let metrics_by_time_to_yojson (x : metrics_by_time) =
  assoc_to_yojson
    [
      ( "timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.timestamp );
      ("spend", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.spend);
      ("savings", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.savings);
      ("score", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.score);
    ]

let metrics_by_time_list_to_yojson tree = list_to_yojson metrics_by_time_to_yojson tree
let max_results_to_yojson = int_to_yojson

let list_recommendations_response_to_yojson (x : list_recommendations_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("items", option_to_yojson recommendation_list_to_yojson x.items);
    ]

let implementation_effort_to_yojson (x : implementation_effort) =
  match x with
  | VERY_HIGH -> `String "VeryHigh"
  | HIGH -> `String "High"
  | MEDIUM -> `String "Medium"
  | LOW -> `String "Low"
  | VERY_LOW -> `String "VeryLow"

let implementation_effort_list_to_yojson tree = list_to_yojson implementation_effort_to_yojson tree
let account_id_to_yojson = string_to_yojson
let account_id_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let action_type_to_yojson (x : action_type) =
  match x with
  | SCALE_IN -> `String "ScaleIn"
  | DELETE -> `String "Delete"
  | MIGRATE_TO_GRAVITON -> `String "MigrateToGraviton"
  | PURCHASE_RESERVED_INSTANCES -> `String "PurchaseReservedInstances"
  | PURCHASE_SAVINGS_PLANS -> `String "PurchaseSavingsPlans"
  | UPGRADE -> `String "Upgrade"
  | STOP -> `String "Stop"
  | RIGHTSIZE -> `String "Rightsize"

let action_type_list_to_yojson tree = list_to_yojson action_type_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("recommendationIds", option_to_yojson recommendation_id_list_to_yojson x.recommendation_ids);
      ("resourceArns", option_to_yojson resource_arn_list_to_yojson x.resource_arns);
      ("resourceIds", option_to_yojson resource_id_list_to_yojson x.resource_ids);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("actionTypes", option_to_yojson action_type_list_to_yojson x.action_types);
      ("resourceTypes", option_to_yojson resource_type_list_to_yojson x.resource_types);
      ("regions", option_to_yojson region_list_to_yojson x.regions);
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
      ( "implementationEfforts",
        option_to_yojson implementation_effort_list_to_yojson x.implementation_efforts );
      ( "rollbackPossible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.rollback_possible );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
    ]

let list_recommendations_request_to_yojson (x : list_recommendations_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "includeAllRecommendations",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.include_all_recommendations );
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
      ("filter", option_to_yojson filter_to_yojson x.filter);
    ]

let list_recommendation_summaries_response_to_yojson (x : list_recommendation_summaries_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("metrics", option_to_yojson summary_metrics_result_to_yojson x.metrics);
      ( "currencyCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency_code );
      ( "groupBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group_by );
      ("items", option_to_yojson recommendation_summaries_list_to_yojson x.items);
      ( "estimatedTotalDedupedSavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_total_deduped_savings );
    ]

let list_recommendation_summaries_request_to_yojson (x : list_recommendation_summaries_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("metrics", option_to_yojson summary_metrics_list_to_yojson x.metrics);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("groupBy", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group_by));
      ("filter", option_to_yojson filter_to_yojson x.filter);
    ]

let account_enrollment_status_to_yojson (x : account_enrollment_status) =
  assoc_to_yojson
    [
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ("status", option_to_yojson enrollment_status_to_yojson x.status);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let account_enrollment_statuses_to_yojson tree =
  list_to_yojson account_enrollment_status_to_yojson tree

let list_enrollment_statuses_response_to_yojson (x : list_enrollment_statuses_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "includeMemberAccounts",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.include_member_accounts );
      ("items", option_to_yojson account_enrollment_statuses_to_yojson x.items);
    ]

let list_enrollment_statuses_request_to_yojson (x : list_enrollment_statuses_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "includeOrganizationInfo",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.primitive_boolean_to_yojson
          x.include_organization_info );
    ]

let efficiency_metrics_by_group_to_yojson (x : efficiency_metrics_by_group) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("group", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group);
      ("metricsByTime", option_to_yojson metrics_by_time_list_to_yojson x.metrics_by_time);
    ]

let efficiency_metrics_by_group_list_to_yojson tree =
  list_to_yojson efficiency_metrics_by_group_to_yojson tree

let list_efficiency_metrics_response_to_yojson (x : list_efficiency_metrics_response) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "efficiencyMetricsByGroup",
        option_to_yojson efficiency_metrics_by_group_list_to_yojson x.efficiency_metrics_by_group );
    ]

let granularity_type_to_yojson (x : granularity_type) =
  match x with MONTHLY -> `String "Monthly" | DAILY -> `String "Daily"

let list_efficiency_metrics_request_to_yojson (x : list_efficiency_metrics_request) =
  assoc_to_yojson
    [
      ( "nextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("timePeriod", Some (time_period_to_yojson x.time_period));
      ("granularity", Some (granularity_type_to_yojson x.granularity));
      ( "groupBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.group_by );
    ]

let get_recommendation_response_to_yojson (x : get_recommendation_response) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "recommendedResourceDetails",
        option_to_yojson resource_details_to_yojson x.recommended_resource_details );
      ( "currentResourceDetails",
        option_to_yojson resource_details_to_yojson x.current_resource_details );
      ( "rollbackPossible",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.rollback_possible );
      ("actionType", option_to_yojson action_type_to_yojson x.action_type);
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "implementationEffort",
        option_to_yojson implementation_effort_to_yojson x.implementation_effort );
      ( "estimatedMonthlyCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_cost );
      ( "estimatedMonthlySavings",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_monthly_savings );
      ("lastRefreshTimestamp", option_to_yojson datetime_to_yojson x.last_refresh_timestamp);
      ("source", option_to_yojson source_to_yojson x.source);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ( "recommendedResourceType",
        option_to_yojson resource_type_to_yojson x.recommended_resource_type );
      ("currentResourceType", option_to_yojson resource_type_to_yojson x.current_resource_type);
      ( "estimatedSavingsOverCostCalculationLookbackPeriod",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_savings_over_cost_calculation_lookback_period );
      ( "estimatedSavingsPercentage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.estimated_savings_percentage );
      ( "costCalculationLookbackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.cost_calculation_lookback_period_in_days );
      ( "recommendationLookbackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.recommendation_lookback_period_in_days );
      ( "currencyCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency_code );
      ( "accountId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.account_id );
      ( "resourceArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_arn );
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ( "recommendationId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.recommendation_id
      );
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
      ("preferredCommitment", option_to_yojson preferred_commitment_to_yojson x.preferred_commitment);
      ( "memberAccountDiscountVisibility",
        option_to_yojson member_account_discount_visibility_to_yojson
          x.member_account_discount_visibility );
      ( "savingsEstimationMode",
        option_to_yojson savings_estimation_mode_to_yojson x.savings_estimation_mode );
    ]

let get_preferences_request_to_yojson = unit_to_yojson
