open Smaws_Lib.Json.DeserializeHelpers
open Types

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : access_denied_exception)

let enrollment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnrollmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EnrollmentStatus")
     : enrollment_status)
    : enrollment_status)

let account_id_of_yojson = string_of_yojson

let account_enrollment_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     status = option_of_yojson (value_for_key enrollment_status_of_yojson "status") _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastUpdatedTimestamp")
         _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdTimestamp")
         _list path;
   }
    : account_enrollment_status)

let account_enrollment_statuses_of_yojson tree path =
  list_of_yojson account_enrollment_status_of_yojson tree path

let account_id_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Rightsize" -> RIGHTSIZE
    | `String "Stop" -> STOP
    | `String "Upgrade" -> UPGRADE
    | `String "PurchaseSavingsPlans" -> PURCHASE_SAVINGS_PLANS
    | `String "PurchaseReservedInstances" -> PURCHASE_RESERVED_INSTANCES
    | `String "MigrateToGraviton" -> MIGRATE_TO_GRAVITON
    | `String "Delete" -> DELETE
    | `String "ScaleIn" -> SCALE_IN
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionType")
     : action_type)
    : action_type)

let action_type_list_of_yojson tree path = list_of_yojson action_type_of_yojson tree path

let allocation_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "Prioritized" -> PRIORITIZED
    | `String "LowestPrice" -> LOWEST_PRICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AllocationStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "AllocationStrategy")
     : allocation_strategy)
    : allocation_strategy)

let estimated_discounts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_discount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "savingsPlansDiscount")
         _list path;
     reserved_instances_discount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "reservedInstancesDiscount")
         _list path;
     other_discount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "otherDiscount")
         _list path;
   }
    : estimated_discounts)

let resource_pricing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_cost_before_discounts =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedCostBeforeDiscounts")
         _list path;
     estimated_net_unused_amortized_commitments =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedNetUnusedAmortizedCommitments")
         _list path;
     estimated_discounts =
       option_of_yojson
         (value_for_key estimated_discounts_of_yojson "estimatedDiscounts")
         _list path;
     estimated_cost_after_discounts =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedCostAfterDiscounts")
         _list path;
   }
    : resource_pricing)

let usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "usageType")
         _list path;
     usage_amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "usageAmount")
         _list path;
     operation =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "operation")
         _list path;
     product_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "productCode")
         _list path;
     unit_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "unit")
         _list path;
   }
    : usage)

let usage_list_of_yojson tree path = list_of_yojson usage_of_yojson tree path

let resource_cost_calculation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usages = option_of_yojson (value_for_key usage_list_of_yojson "usages") _list path;
     pricing = option_of_yojson (value_for_key resource_pricing_of_yojson "pricing") _list path;
   }
    : resource_cost_calculation)

let aurora_db_cluster_storage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "storageType")
         _list path;
   }
    : aurora_db_cluster_storage_configuration)

let aurora_db_cluster_storage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key aurora_db_cluster_storage_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : aurora_db_cluster_storage)

let block_storage_performance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iops =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "iops")
         _list path;
     throughput =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "throughput")
         _list path;
   }
    : block_storage_performance_configuration)

let compute_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     v_cpu =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "vCpu")
         _list path;
     memory_size_in_m_b =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "memorySizeInMB")
         _list path;
     architecture =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "architecture")
         _list path;
     platform =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "platform")
         _list path;
   }
    : compute_configuration)

let savings_plans_pricing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_savings_plans_eligible_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "monthlySavingsPlansEligibleCost")
         _list path;
     estimated_monthly_commitment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedMonthlyCommitment")
         _list path;
     savings_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "savingsPercentage")
         _list path;
     estimated_on_demand_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedOnDemandCost")
         _list path;
   }
    : savings_plans_pricing)

let savings_plans_cost_calculation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pricing = option_of_yojson (value_for_key savings_plans_pricing_of_yojson "pricing") _list path;
   }
    : savings_plans_cost_calculation)

let compute_savings_plans_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     hourly_commitment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hourlyCommitment")
         _list path;
   }
    : compute_savings_plans_configuration)

let compute_savings_plans_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key compute_savings_plans_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key savings_plans_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : compute_savings_plans)

let validation_exception_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "fieldName" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception_detail)

let validation_exception_details_of_yojson tree path =
  list_of_yojson validation_exception_detail_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "FieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "Other" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     fields =
       option_of_yojson (value_for_key validation_exception_details_of_yojson "fields") _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : throttling_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let payment_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "AllUpfront" -> ALL_UPFRONT
    | `String "PartialUpfront" -> PARTIAL_UPFRONT
    | `String "NoUpfront" -> NO_UPFRONT
    | `String value -> raise (deserialize_unknown_enum_value_error path "PaymentOption" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentOption")
     : payment_option)
    : payment_option)

let term_of_yojson (tree : t) path =
  ((match tree with
    | `String "OneYear" -> ONE_YEAR
    | `String "ThreeYears" -> THREE_YEARS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Term" value)
    | _ -> raise (deserialize_wrong_type_error path "Term")
     : term)
    : term)

let preferred_commitment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     term = option_of_yojson (value_for_key term_of_yojson "term") _list path;
     payment_option =
       option_of_yojson (value_for_key payment_option_of_yojson "paymentOption") _list path;
   }
    : preferred_commitment)

let member_account_discount_visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "All" -> ALL
    | `String "None" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MemberAccountDiscountVisibility" value)
    | _ -> raise (deserialize_wrong_type_error path "MemberAccountDiscountVisibility")
     : member_account_discount_visibility)
    : member_account_discount_visibility)

let savings_estimation_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "BeforeDiscounts" -> BEFORE_DISCOUNTS
    | `String "AfterDiscounts" -> AFTER_DISCOUNTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SavingsEstimationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SavingsEstimationMode")
     : savings_estimation_mode)
    : savings_estimation_mode)

let update_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_estimation_mode =
       option_of_yojson
         (value_for_key savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
     member_account_discount_visibility =
       option_of_yojson
         (value_for_key member_account_discount_visibility_of_yojson
            "memberAccountDiscountVisibility")
         _list path;
     preferred_commitment =
       option_of_yojson
         (value_for_key preferred_commitment_of_yojson "preferredCommitment")
         _list path;
   }
    : update_preferences_response)

let update_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_estimation_mode =
       option_of_yojson
         (value_for_key savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
     member_account_discount_visibility =
       option_of_yojson
         (value_for_key member_account_discount_visibility_of_yojson
            "memberAccountDiscountVisibility")
         _list path;
     preferred_commitment =
       option_of_yojson
         (value_for_key preferred_commitment_of_yojson "preferredCommitment")
         _list path;
   }
    : update_preferences_request)

let update_enrollment_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "status")
         _list path;
   }
    : update_enrollment_status_response)

let update_enrollment_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key enrollment_status_of_yojson "status" _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "includeMemberAccounts")
         _list path;
   }
    : update_enrollment_status_request)

let summary_metrics_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "savingsPercentage")
         _list path;
   }
    : summary_metrics_result)

let recommendation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "group")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedMonthlySavings")
         _list path;
     recommendation_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "recommendationCount")
         _list path;
   }
    : recommendation_summary)

let recommendation_summaries_list_of_yojson tree path =
  list_of_yojson recommendation_summary_of_yojson tree path

let list_recommendation_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_total_deduped_savings =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedTotalDedupedSavings")
         _list path;
     items =
       option_of_yojson (value_for_key recommendation_summaries_list_of_yojson "items") _list path;
     group_by =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "groupBy")
         _list path;
     currency_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "currencyCode")
         _list path;
     metrics =
       option_of_yojson (value_for_key summary_metrics_result_of_yojson "metrics") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_recommendation_summaries_response)

let summary_metrics_of_yojson (tree : t) path =
  ((match tree with
    | `String "SavingsPercentage" -> SAVINGS_PERCENTAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SummaryMetrics" value)
    | _ -> raise (deserialize_wrong_type_error path "SummaryMetrics")
     : summary_metrics)
    : summary_metrics)

let summary_metrics_list_of_yojson tree path = list_of_yojson summary_metrics_of_yojson tree path
let max_results_of_yojson = int_of_yojson

let recommendation_id_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let resource_arn_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let resource_id_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key")
         _list path;
     value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "value")
         _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ec2Instance" -> EC2_INSTANCE
    | `String "LambdaFunction" -> LAMBDA_FUNCTION
    | `String "EbsVolume" -> EBS_VOLUME
    | `String "EcsService" -> ECS_SERVICE
    | `String "Ec2AutoScalingGroup" -> EC2_AUTO_SCALING_GROUP
    | `String "Ec2InstanceSavingsPlans" -> EC2_INSTANCE_SAVINGS_PLANS
    | `String "ComputeSavingsPlans" -> COMPUTE_SAVINGS_PLANS
    | `String "SageMakerSavingsPlans" -> SAGE_MAKER_SAVINGS_PLANS
    | `String "Ec2ReservedInstances" -> EC2_RESERVED_INSTANCES
    | `String "RdsReservedInstances" -> RDS_RESERVED_INSTANCES
    | `String "OpenSearchReservedInstances" -> OPEN_SEARCH_RESERVED_INSTANCES
    | `String "RedshiftReservedInstances" -> REDSHIFT_RESERVED_INSTANCES
    | `String "ElastiCacheReservedInstances" -> ELASTI_CACHE_RESERVED_INSTANCES
    | `String "RdsDbInstanceStorage" -> RDS_DB_INSTANCE_STORAGE
    | `String "RdsDbInstance" -> RDS_DB_INSTANCE
    | `String "AuroraDbClusterStorage" -> AURORA_DB_CLUSTER_STORAGE
    | `String "DynamoDbReservedCapacity" -> DYNAMO_DB_RESERVED_CAPACITY
    | `String "MemoryDbReservedInstances" -> MEMORY_DB_RESERVED_INSTANCES
    | `String "NatGateway" -> NAT_GATEWAY
    | `String "DynamoDBTable" -> DYNAMO_DB_TABLE
    | `String "ElastiCacheCluster" -> ELASTI_CACHE_CLUSTER
    | `String "MemoryDBCluster" -> MEMORY_DB_CLUSTER
    | `String "DocumentDBCluster" -> DOCUMENT_DB_CLUSTER
    | `String "WorkSpaces" -> WORK_SPACES
    | `String "SageMakerEndpoint" -> SAGE_MAKER_ENDPOINT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_type_list_of_yojson tree path = list_of_yojson resource_type_of_yojson tree path

let region_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let implementation_effort_of_yojson (tree : t) path =
  ((match tree with
    | `String "VeryLow" -> VERY_LOW
    | `String "Low" -> LOW
    | `String "Medium" -> MEDIUM
    | `String "High" -> HIGH
    | `String "VeryHigh" -> VERY_HIGH
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ImplementationEffort" value)
    | _ -> raise (deserialize_wrong_type_error path "ImplementationEffort")
     : implementation_effort)
    : implementation_effort)

let implementation_effort_list_of_yojson tree path =
  list_of_yojson implementation_effort_of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     restart_needed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "restartNeeded")
         _list path;
     rollback_possible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "rollbackPossible")
         _list path;
     implementation_efforts =
       option_of_yojson
         (value_for_key implementation_effort_list_of_yojson "implementationEfforts")
         _list path;
     account_ids =
       option_of_yojson (value_for_key account_id_list_of_yojson "accountIds") _list path;
     regions = option_of_yojson (value_for_key region_list_of_yojson "regions") _list path;
     resource_types =
       option_of_yojson (value_for_key resource_type_list_of_yojson "resourceTypes") _list path;
     action_types =
       option_of_yojson (value_for_key action_type_list_of_yojson "actionTypes") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     resource_ids =
       option_of_yojson (value_for_key resource_id_list_of_yojson "resourceIds") _list path;
     resource_arns =
       option_of_yojson (value_for_key resource_arn_list_of_yojson "resourceArns") _list path;
     recommendation_ids =
       option_of_yojson
         (value_for_key recommendation_id_list_of_yojson "recommendationIds")
         _list path;
   }
    : filter)

let list_recommendation_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key filter_of_yojson "filter") _list path;
     group_by =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "groupBy" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     metrics = option_of_yojson (value_for_key summary_metrics_list_of_yojson "metrics") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_recommendation_summaries_request)

let source_of_yojson (tree : t) path =
  ((match tree with
    | `String "ComputeOptimizer" -> COMPUTE_OPTIMIZER
    | `String "CostExplorer" -> COST_EXPLORER
    | `String value -> raise (deserialize_unknown_enum_value_error path "Source" value)
    | _ -> raise (deserialize_wrong_type_error path "Source")
     : source)
    : source)

let datetime_of_yojson = timestamp_epoch_seconds_of_yojson

let recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recommendationId")
         _list path;
     account_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountId")
         _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId")
         _list path;
     resource_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn")
         _list path;
     current_resource_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentResourceType")
         _list path;
     recommended_resource_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "recommendedResourceType")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedMonthlySavings")
         _list path;
     estimated_savings_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedSavingsPercentage")
         _list path;
     estimated_monthly_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedMonthlyCost")
         _list path;
     currency_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "currencyCode")
         _list path;
     implementation_effort =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "implementationEffort")
         _list path;
     restart_needed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "restartNeeded")
         _list path;
     action_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "actionType")
         _list path;
     rollback_possible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "rollbackPossible")
         _list path;
     current_resource_summary =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentResourceSummary")
         _list path;
     recommended_resource_summary =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "recommendedResourceSummary")
         _list path;
     last_refresh_timestamp =
       option_of_yojson (value_for_key datetime_of_yojson "lastRefreshTimestamp") _list path;
     recommendation_lookback_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "recommendationLookbackPeriodInDays")
         _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : recommendation)

let recommendation_list_of_yojson tree path = list_of_yojson recommendation_of_yojson tree path

let list_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = option_of_yojson (value_for_key recommendation_list_of_yojson "items") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_recommendations_response)

let order_of_yojson (tree : t) path =
  ((match tree with
    | `String "Asc" -> ASC
    | `String "Desc" -> DESC
    | `String value -> raise (deserialize_unknown_enum_value_error path "Order" value)
    | _ -> raise (deserialize_wrong_type_error path "Order")
     : order)
    : order)

let order_by_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dimension")
         _list path;
     order = option_of_yojson (value_for_key order_of_yojson "order") _list path;
   }
    : order_by)

let list_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key filter_of_yojson "filter") _list path;
     order_by = option_of_yojson (value_for_key order_by_of_yojson "orderBy") _list path;
     include_all_recommendations =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "includeAllRecommendations")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_recommendations_request)

let list_enrollment_statuses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items =
       option_of_yojson (value_for_key account_enrollment_statuses_of_yojson "items") _list path;
     include_member_accounts =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "includeMemberAccounts")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_enrollment_statuses_response)

let list_enrollment_statuses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_organization_info =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.primitive_boolean_of_yojson
            "includeOrganizationInfo")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_enrollment_statuses_request)

let metrics_by_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     score =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "score")
         _list path;
     savings =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "savings")
         _list path;
     spend =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "spend")
         _list path;
     timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "timestamp")
         _list path;
   }
    : metrics_by_time)

let metrics_by_time_list_of_yojson tree path = list_of_yojson metrics_by_time_of_yojson tree path

let efficiency_metrics_by_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics_by_time =
       option_of_yojson (value_for_key metrics_by_time_list_of_yojson "metricsByTime") _list path;
     group =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "group")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : efficiency_metrics_by_group)

let efficiency_metrics_by_group_list_of_yojson tree path =
  list_of_yojson efficiency_metrics_by_group_of_yojson tree path

let list_efficiency_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     efficiency_metrics_by_group =
       option_of_yojson
         (value_for_key efficiency_metrics_by_group_list_of_yojson "efficiencyMetricsByGroup")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_efficiency_metrics_response)

let time_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "start" _list path;
     end_ = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "end" _list path;
   }
    : time_period)

let granularity_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Daily" -> DAILY
    | `String "Monthly" -> MONTHLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "GranularityType" value)
    | _ -> raise (deserialize_wrong_type_error path "GranularityType")
     : granularity_type)
    : granularity_type)

let list_efficiency_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_by =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "groupBy")
         _list path;
     granularity = value_for_key granularity_type_of_yojson "granularity" _list path;
     time_period = value_for_key time_period_of_yojson "timePeriod" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     order_by = option_of_yojson (value_for_key order_by_of_yojson "orderBy") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "nextToken")
         _list path;
   }
    : list_efficiency_metrics_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
   }
    : resource_not_found_exception)

let sage_maker_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : sage_maker_endpoint)

let work_spaces_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : work_spaces)

let document_db_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : document_db_cluster)

let memory_db_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : memory_db_cluster)

let elasti_cache_cluster_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : elasti_cache_cluster)

let dynamo_db_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : dynamo_db_table)

let nat_gateway_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_connection_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "activeConnectionCount")
         _list path;
     packets_in_from_source =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "packetsInFromSource")
         _list path;
     packets_in_from_destination =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
            "packetsInFromDestination")
         _list path;
   }
    : nat_gateway_configuration)

let nat_gateway_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key nat_gateway_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : nat_gateway)

let reserved_instances_pricing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_on_demand_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedOnDemandCost")
         _list path;
     monthly_reservation_eligible_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "monthlyReservationEligibleCost")
         _list path;
     savings_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "savingsPercentage")
         _list path;
     estimated_monthly_amortized_reservation_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedMonthlyAmortizedReservationCost")
         _list path;
   }
    : reserved_instances_pricing)

let reserved_instances_cost_calculation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pricing =
       option_of_yojson (value_for_key reserved_instances_pricing_of_yojson "pricing") _list path;
   }
    : reserved_instances_cost_calculation)

let memory_db_reserved_instances_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     service =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "service")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     reserved_instances_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "reservedInstancesRegion")
         _list path;
     upfront_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "upfrontCost")
         _list path;
     monthly_recurring_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyRecurringCost")
         _list path;
     normalized_units_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "normalizedUnitsToPurchase")
         _list path;
     number_of_instances_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "numberOfInstancesToPurchase")
         _list path;
     instance_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceType")
         _list path;
     instance_family =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceFamily")
         _list path;
     size_flex_eligible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "sizeFlexEligible")
         _list path;
     current_generation =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentGeneration")
         _list path;
   }
    : memory_db_reserved_instances_configuration)

let memory_db_reserved_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key memory_db_reserved_instances_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key reserved_instances_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : memory_db_reserved_instances)

let dynamo_db_reserved_capacity_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     service =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "service")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     reserved_instances_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "reservedInstancesRegion")
         _list path;
     upfront_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "upfrontCost")
         _list path;
     monthly_recurring_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyRecurringCost")
         _list path;
     number_of_capacity_units_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "numberOfCapacityUnitsToPurchase")
         _list path;
     capacity_units =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "capacityUnits")
         _list path;
   }
    : dynamo_db_reserved_capacity_configuration)

let dynamo_db_reserved_capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key dynamo_db_reserved_capacity_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key reserved_instances_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : dynamo_db_reserved_capacity)

let rds_db_instance_storage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "storageType")
         _list path;
     allocated_storage_in_gb =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "allocatedStorageInGb")
         _list path;
     iops =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "iops")
         _list path;
     storage_throughput =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "storageThroughput")
         _list path;
   }
    : rds_db_instance_storage_configuration)

let rds_db_instance_storage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key rds_db_instance_storage_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : rds_db_instance_storage)

let db_instance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     db_instance_class =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "dbInstanceClass")
         _list path;
   }
    : db_instance_configuration)

let rds_db_instance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance =
       option_of_yojson (value_for_key db_instance_configuration_of_yojson "instance") _list path;
   }
    : rds_db_instance_configuration)

let rds_db_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key rds_db_instance_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : rds_db_instance)

let sage_maker_savings_plans_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     hourly_commitment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hourlyCommitment")
         _list path;
   }
    : sage_maker_savings_plans_configuration)

let sage_maker_savings_plans_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key sage_maker_savings_plans_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key savings_plans_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : sage_maker_savings_plans)

let ec2_instance_savings_plans_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     hourly_commitment =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hourlyCommitment")
         _list path;
     instance_family =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceFamily")
         _list path;
     savings_plans_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "savingsPlansRegion")
         _list path;
   }
    : ec2_instance_savings_plans_configuration)

let ec2_instance_savings_plans_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key ec2_instance_savings_plans_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key savings_plans_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : ec2_instance_savings_plans)

let redshift_reserved_instances_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     service =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "service")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     reserved_instances_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "reservedInstancesRegion")
         _list path;
     upfront_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "upfrontCost")
         _list path;
     monthly_recurring_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyRecurringCost")
         _list path;
     normalized_units_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "normalizedUnitsToPurchase")
         _list path;
     number_of_instances_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "numberOfInstancesToPurchase")
         _list path;
     instance_family =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceFamily")
         _list path;
     instance_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceType")
         _list path;
     size_flex_eligible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "sizeFlexEligible")
         _list path;
     current_generation =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentGeneration")
         _list path;
   }
    : redshift_reserved_instances_configuration)

let redshift_reserved_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key redshift_reserved_instances_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key reserved_instances_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : redshift_reserved_instances)

let open_search_reserved_instances_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     service =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "service")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     reserved_instances_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "reservedInstancesRegion")
         _list path;
     upfront_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "upfrontCost")
         _list path;
     monthly_recurring_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyRecurringCost")
         _list path;
     normalized_units_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "normalizedUnitsToPurchase")
         _list path;
     number_of_instances_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "numberOfInstancesToPurchase")
         _list path;
     instance_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceType")
         _list path;
     current_generation =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentGeneration")
         _list path;
     size_flex_eligible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "sizeFlexEligible")
         _list path;
   }
    : open_search_reserved_instances_configuration)

let open_search_reserved_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key open_search_reserved_instances_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key reserved_instances_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : open_search_reserved_instances)

let elasti_cache_reserved_instances_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     service =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "service")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     reserved_instances_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "reservedInstancesRegion")
         _list path;
     upfront_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "upfrontCost")
         _list path;
     monthly_recurring_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyRecurringCost")
         _list path;
     normalized_units_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "normalizedUnitsToPurchase")
         _list path;
     number_of_instances_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "numberOfInstancesToPurchase")
         _list path;
     instance_family =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceFamily")
         _list path;
     instance_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceType")
         _list path;
     current_generation =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentGeneration")
         _list path;
     size_flex_eligible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "sizeFlexEligible")
         _list path;
   }
    : elasti_cache_reserved_instances_configuration)

let elasti_cache_reserved_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key elasti_cache_reserved_instances_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key reserved_instances_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : elasti_cache_reserved_instances)

let rds_reserved_instances_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     service =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "service")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     reserved_instances_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "reservedInstancesRegion")
         _list path;
     upfront_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "upfrontCost")
         _list path;
     monthly_recurring_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyRecurringCost")
         _list path;
     normalized_units_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "normalizedUnitsToPurchase")
         _list path;
     number_of_instances_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "numberOfInstancesToPurchase")
         _list path;
     instance_family =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceFamily")
         _list path;
     instance_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceType")
         _list path;
     size_flex_eligible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "sizeFlexEligible")
         _list path;
     current_generation =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentGeneration")
         _list path;
     license_model =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "licenseModel")
         _list path;
     database_edition =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "databaseEdition")
         _list path;
     database_engine =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "databaseEngine")
         _list path;
     deployment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "deploymentOption")
         _list path;
   }
    : rds_reserved_instances_configuration)

let rds_reserved_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key rds_reserved_instances_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key reserved_instances_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : rds_reserved_instances)

let ec2_reserved_instances_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountScope")
         _list path;
     service =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "service")
         _list path;
     term =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "term")
         _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     reserved_instances_region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "reservedInstancesRegion")
         _list path;
     upfront_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "upfrontCost")
         _list path;
     monthly_recurring_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "monthlyRecurringCost")
         _list path;
     normalized_units_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "normalizedUnitsToPurchase")
         _list path;
     number_of_instances_to_purchase =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "numberOfInstancesToPurchase")
         _list path;
     offering_class =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "offeringClass")
         _list path;
     instance_family =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceFamily")
         _list path;
     instance_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "instanceType")
         _list path;
     current_generation =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentGeneration")
         _list path;
     platform =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "platform")
         _list path;
     tenancy =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "tenancy")
         _list path;
     size_flex_eligible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "sizeFlexEligible")
         _list path;
   }
    : ec2_reserved_instances_configuration)

let ec2_reserved_instances_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key ec2_reserved_instances_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key reserved_instances_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : ec2_reserved_instances)

let ec2_auto_scaling_group_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SingleInstanceType" -> SINGLE_INSTANCE_TYPE
    | `String "MixedInstanceTypes" -> MIXED_INSTANCE_TYPES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "Ec2AutoScalingGroupType" value)
    | _ -> raise (deserialize_wrong_type_error path "Ec2AutoScalingGroupType")
     : ec2_auto_scaling_group_type)
    : ec2_auto_scaling_group_type)

let mixed_instance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "type")
         _list path;
   }
    : mixed_instance_configuration)

let mixed_instance_configuration_list_of_yojson tree path =
  list_of_yojson mixed_instance_configuration_of_yojson tree path

let instance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "type")
         _list path;
   }
    : instance_configuration)

let ec2_auto_scaling_group_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance =
       option_of_yojson (value_for_key instance_configuration_of_yojson "instance") _list path;
     mixed_instances =
       option_of_yojson
         (value_for_key mixed_instance_configuration_list_of_yojson "mixedInstances")
         _list path;
     type_ =
       option_of_yojson (value_for_key ec2_auto_scaling_group_type_of_yojson "type") _list path;
     allocation_strategy =
       option_of_yojson
         (value_for_key allocation_strategy_of_yojson "allocationStrategy")
         _list path;
   }
    : ec2_auto_scaling_group_configuration)

let ec2_auto_scaling_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key ec2_auto_scaling_group_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : ec2_auto_scaling_group)

let storage_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "type")
         _list path;
     size_in_gb =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "sizeInGb")
         _list path;
   }
    : storage_configuration)

let ebs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage = option_of_yojson (value_for_key storage_configuration_of_yojson "storage") _list path;
     performance =
       option_of_yojson
         (value_for_key block_storage_performance_configuration_of_yojson "performance")
         _list path;
     attachment_state =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "attachmentState")
         _list path;
   }
    : ebs_volume_configuration)

let ebs_volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key ebs_volume_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : ebs_volume)

let ec2_instance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance =
       option_of_yojson (value_for_key instance_configuration_of_yojson "instance") _list path;
   }
    : ec2_instance_configuration)

let ec2_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key ec2_instance_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : ec2_instance)

let ecs_service_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute = option_of_yojson (value_for_key compute_configuration_of_yojson "compute") _list path;
   }
    : ecs_service_configuration)

let ecs_service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key ecs_service_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : ecs_service)

let lambda_function_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute = option_of_yojson (value_for_key compute_configuration_of_yojson "compute") _list path;
   }
    : lambda_function_configuration)

let lambda_function_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key lambda_function_configuration_of_yojson "configuration")
         _list path;
     cost_calculation =
       option_of_yojson
         (value_for_key resource_cost_calculation_of_yojson "costCalculation")
         _list path;
   }
    : lambda_function)

let resource_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "lambdaFunction" -> LambdaFunction (lambda_function_of_yojson value_ path)
   | "ecsService" -> EcsService (ecs_service_of_yojson value_ path)
   | "ec2Instance" -> Ec2Instance (ec2_instance_of_yojson value_ path)
   | "ebsVolume" -> EbsVolume (ebs_volume_of_yojson value_ path)
   | "ec2AutoScalingGroup" -> Ec2AutoScalingGroup (ec2_auto_scaling_group_of_yojson value_ path)
   | "ec2ReservedInstances" -> Ec2ReservedInstances (ec2_reserved_instances_of_yojson value_ path)
   | "rdsReservedInstances" -> RdsReservedInstances (rds_reserved_instances_of_yojson value_ path)
   | "elastiCacheReservedInstances" ->
       ElastiCacheReservedInstances (elasti_cache_reserved_instances_of_yojson value_ path)
   | "openSearchReservedInstances" ->
       OpenSearchReservedInstances (open_search_reserved_instances_of_yojson value_ path)
   | "redshiftReservedInstances" ->
       RedshiftReservedInstances (redshift_reserved_instances_of_yojson value_ path)
   | "ec2InstanceSavingsPlans" ->
       Ec2InstanceSavingsPlans (ec2_instance_savings_plans_of_yojson value_ path)
   | "computeSavingsPlans" -> ComputeSavingsPlans (compute_savings_plans_of_yojson value_ path)
   | "sageMakerSavingsPlans" ->
       SageMakerSavingsPlans (sage_maker_savings_plans_of_yojson value_ path)
   | "rdsDbInstance" -> RdsDbInstance (rds_db_instance_of_yojson value_ path)
   | "rdsDbInstanceStorage" -> RdsDbInstanceStorage (rds_db_instance_storage_of_yojson value_ path)
   | "auroraDbClusterStorage" ->
       AuroraDbClusterStorage (aurora_db_cluster_storage_of_yojson value_ path)
   | "dynamoDbReservedCapacity" ->
       DynamoDbReservedCapacity (dynamo_db_reserved_capacity_of_yojson value_ path)
   | "memoryDbReservedInstances" ->
       MemoryDbReservedInstances (memory_db_reserved_instances_of_yojson value_ path)
   | "natGateway" -> NatGateway (nat_gateway_of_yojson value_ path)
   | "dynamoDbTable" -> DynamoDbTable (dynamo_db_table_of_yojson value_ path)
   | "elastiCacheCluster" -> ElastiCacheCluster (elasti_cache_cluster_of_yojson value_ path)
   | "memoryDbCluster" -> MemoryDbCluster (memory_db_cluster_of_yojson value_ path)
   | "documentDbCluster" -> DocumentDbCluster (document_db_cluster_of_yojson value_ path)
   | "workSpaces" -> WorkSpaces (work_spaces_of_yojson value_ path)
   | "sageMakerEndpoint" -> SageMakerEndpoint (sage_maker_endpoint_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ResourceDetails" unknown)
    : resource_details)

let get_recommendation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recommendationId")
         _list path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId")
         _list path;
     resource_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceArn")
         _list path;
     account_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "accountId")
         _list path;
     currency_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "currencyCode")
         _list path;
     recommendation_lookback_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "recommendationLookbackPeriodInDays")
         _list path;
     cost_calculation_lookback_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "costCalculationLookbackPeriodInDays")
         _list path;
     estimated_savings_percentage =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedSavingsPercentage")
         _list path;
     estimated_savings_over_cost_calculation_lookback_period =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedSavingsOverCostCalculationLookbackPeriod")
         _list path;
     current_resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "currentResourceType") _list path;
     recommended_resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "recommendedResourceType") _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
     last_refresh_timestamp =
       option_of_yojson (value_for_key datetime_of_yojson "lastRefreshTimestamp") _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedMonthlySavings")
         _list path;
     estimated_monthly_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
            "estimatedMonthlyCost")
         _list path;
     implementation_effort =
       option_of_yojson
         (value_for_key implementation_effort_of_yojson "implementationEffort")
         _list path;
     restart_needed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "restartNeeded")
         _list path;
     action_type = option_of_yojson (value_for_key action_type_of_yojson "actionType") _list path;
     rollback_possible =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "rollbackPossible")
         _list path;
     current_resource_details =
       option_of_yojson
         (value_for_key resource_details_of_yojson "currentResourceDetails")
         _list path;
     recommended_resource_details =
       option_of_yojson
         (value_for_key resource_details_of_yojson "recommendedResourceDetails")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : get_recommendation_response)

let get_recommendation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "recommendationId"
         _list path;
   }
    : get_recommendation_request)

let get_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_estimation_mode =
       option_of_yojson
         (value_for_key savings_estimation_mode_of_yojson "savingsEstimationMode")
         _list path;
     member_account_discount_visibility =
       option_of_yojson
         (value_for_key member_account_discount_visibility_of_yojson
            "memberAccountDiscountVisibility")
         _list path;
     preferred_commitment =
       option_of_yojson
         (value_for_key preferred_commitment_of_yojson "preferredCommitment")
         _list path;
   }
    : get_preferences_response)

let get_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)
