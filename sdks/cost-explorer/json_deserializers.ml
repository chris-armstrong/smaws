open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let arn_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     resource_name = option_of_yojson (value_for_key arn_of_yojson "ResourceName") _list path;
   }
    : resource_not_found_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let zoned_date_time_of_yojson = string_of_yojson

let update_cost_category_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = option_of_yojson (value_for_key arn_of_yojson "CostCategoryArn") _list path;
     effective_start =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveStart") _list path;
   }
    : update_cost_category_definition_response)

let generic_string_of_yojson = string_of_yojson

let cost_category_split_charge_rule_parameter_values_list_of_yojson tree path =
  list_of_yojson generic_string_of_yojson tree path

let cost_category_split_charge_rule_parameter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALLOCATION_PERCENTAGES" -> ALLOCATION_PERCENTAGES
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CostCategorySplitChargeRuleParameterType"
             value)
    | _ -> raise (deserialize_wrong_type_error path "CostCategorySplitChargeRuleParameterType")
     : cost_category_split_charge_rule_parameter_type)
    : cost_category_split_charge_rule_parameter_type)

let cost_category_split_charge_rule_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       value_for_key cost_category_split_charge_rule_parameter_type_of_yojson "Type" _list path;
     values =
       value_for_key cost_category_split_charge_rule_parameter_values_list_of_yojson "Values" _list
         path;
   }
    : cost_category_split_charge_rule_parameter)

let cost_category_split_charge_rule_parameters_list_of_yojson tree path =
  list_of_yojson cost_category_split_charge_rule_parameter_of_yojson tree path

let cost_category_split_charge_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIXED" -> FIXED
    | `String "PROPORTIONAL" -> PROPORTIONAL
    | `String "EVEN" -> EVEN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CostCategorySplitChargeMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "CostCategorySplitChargeMethod")
     : cost_category_split_charge_method)
    : cost_category_split_charge_method)

let cost_category_split_charge_rule_targets_list_of_yojson tree path =
  list_of_yojson generic_string_of_yojson tree path

let cost_category_split_charge_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = value_for_key generic_string_of_yojson "Source" _list path;
     targets =
       value_for_key cost_category_split_charge_rule_targets_list_of_yojson "Targets" _list path;
     method_ = value_for_key cost_category_split_charge_method_of_yojson "Method" _list path;
     parameters =
       option_of_yojson
         (value_for_key cost_category_split_charge_rule_parameters_list_of_yojson "Parameters")
         _list path;
   }
    : cost_category_split_charge_rule)

let cost_category_split_charge_rules_list_of_yojson tree path =
  list_of_yojson cost_category_split_charge_rule_of_yojson tree path

let cost_category_value_of_yojson = string_of_yojson

let cost_category_rule_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "REGULAR" -> REGULAR
    | `String "INHERITED_VALUE" -> INHERITED_VALUE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CostCategoryRuleType" value)
    | _ -> raise (deserialize_wrong_type_error path "CostCategoryRuleType")
     : cost_category_rule_type)
    : cost_category_rule_type)

let cost_category_inherited_value_dimension_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINKED_ACCOUNT_NAME" -> LINKED_ACCOUNT_NAME
    | `String "TAG" -> TAG
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "CostCategoryInheritedValueDimensionName" value)
    | _ -> raise (deserialize_wrong_type_error path "CostCategoryInheritedValueDimensionName")
     : cost_category_inherited_value_dimension_name)
    : cost_category_inherited_value_dimension_name)

let cost_category_inherited_value_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_name =
       option_of_yojson
         (value_for_key cost_category_inherited_value_dimension_name_of_yojson "DimensionName")
         _list path;
     dimension_key =
       option_of_yojson (value_for_key generic_string_of_yojson "DimensionKey") _list path;
   }
    : cost_category_inherited_value_dimension)

let match_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "ABSENT" -> ABSENT
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "CONTAINS" -> CONTAINS
    | `String "CASE_SENSITIVE" -> CASE_SENSITIVE
    | `String "CASE_INSENSITIVE" -> CASE_INSENSITIVE
    | `String "GREATER_THAN_OR_EQUAL" -> GREATER_THAN_OR_EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchOption")
     : match_option)
    : match_option)

let match_options_of_yojson tree path = list_of_yojson match_option_of_yojson tree path
let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path
let cost_category_name_of_yojson = string_of_yojson

let cost_category_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key cost_category_name_of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key values_of_yojson "Values") _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
   }
    : cost_category_values)

let tag_key_of_yojson = string_of_yojson

let tag_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key values_of_yojson "Values") _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
   }
    : tag_values)

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "AZ" -> AZ
    | `String "INSTANCE_TYPE" -> INSTANCE_TYPE
    | `String "LINKED_ACCOUNT" -> LINKED_ACCOUNT
    | `String "PAYER_ACCOUNT" -> PAYER_ACCOUNT
    | `String "LINKED_ACCOUNT_NAME" -> LINKED_ACCOUNT_NAME
    | `String "OPERATION" -> OPERATION
    | `String "PURCHASE_TYPE" -> PURCHASE_TYPE
    | `String "REGION" -> REGION
    | `String "SERVICE" -> SERVICE
    | `String "SERVICE_CODE" -> SERVICE_CODE
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "USAGE_TYPE_GROUP" -> USAGE_TYPE_GROUP
    | `String "RECORD_TYPE" -> RECORD_TYPE
    | `String "OPERATING_SYSTEM" -> OPERATING_SYSTEM
    | `String "TENANCY" -> TENANCY
    | `String "SCOPE" -> SCOPE
    | `String "PLATFORM" -> PLATFORM
    | `String "SUBSCRIPTION_ID" -> SUBSCRIPTION_ID
    | `String "LEGAL_ENTITY_NAME" -> LEGAL_ENTITY_NAME
    | `String "DEPLOYMENT_OPTION" -> DEPLOYMENT_OPTION
    | `String "DATABASE_ENGINE" -> DATABASE_ENGINE
    | `String "CACHE_ENGINE" -> CACHE_ENGINE
    | `String "INSTANCE_TYPE_FAMILY" -> INSTANCE_TYPE_FAMILY
    | `String "BILLING_ENTITY" -> BILLING_ENTITY
    | `String "RESERVATION_ID" -> RESERVATION_ID
    | `String "RESOURCE_ID" -> RESOURCE_ID
    | `String "RIGHTSIZING_TYPE" -> RIGHTSIZING_TYPE
    | `String "SAVINGS_PLANS_TYPE" -> SAVINGS_PLANS_TYPE
    | `String "SAVINGS_PLAN_ARN" -> SAVINGS_PLAN_ARN
    | `String "PAYMENT_OPTION" -> PAYMENT_OPTION
    | `String "AGREEMENT_END_DATE_TIME_AFTER" -> AGREEMENT_END_DATE_TIME_AFTER
    | `String "AGREEMENT_END_DATE_TIME_BEFORE" -> AGREEMENT_END_DATE_TIME_BEFORE
    | `String "INVOICING_ENTITY" -> INVOICING_ENTITY
    | `String "ANOMALY_TOTAL_IMPACT_ABSOLUTE" -> ANOMALY_TOTAL_IMPACT_ABSOLUTE
    | `String "ANOMALY_TOTAL_IMPACT_PERCENTAGE" -> ANOMALY_TOTAL_IMPACT_PERCENTAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

let dimension_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key dimension_of_yojson "Key") _list path;
     values = option_of_yojson (value_for_key values_of_yojson "Values") _list path;
     match_options =
       option_of_yojson (value_for_key match_options_of_yojson "MatchOptions") _list path;
   }
    : dimension_values)

let rec expressions_of_yojson tree path = list_of_yojson expression_of_yojson tree path

and expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     \#or = option_of_yojson (value_for_key expressions_of_yojson "Or") _list path;
     and_ = option_of_yojson (value_for_key expressions_of_yojson "And") _list path;
     not = option_of_yojson (value_for_key expression_of_yojson "Not") _list path;
     dimensions =
       option_of_yojson (value_for_key dimension_values_of_yojson "Dimensions") _list path;
     tags = option_of_yojson (value_for_key tag_values_of_yojson "Tags") _list path;
     cost_categories =
       option_of_yojson (value_for_key cost_category_values_of_yojson "CostCategories") _list path;
   }
    : expression)

let cost_category_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key cost_category_value_of_yojson "Value") _list path;
     rule = option_of_yojson (value_for_key expression_of_yojson "Rule") _list path;
     inherited_value =
       option_of_yojson
         (value_for_key cost_category_inherited_value_dimension_of_yojson "InheritedValue")
         _list path;
     type_ = option_of_yojson (value_for_key cost_category_rule_type_of_yojson "Type") _list path;
   }
    : cost_category_rule)

let cost_category_rules_list_of_yojson tree path =
  list_of_yojson cost_category_rule_of_yojson tree path

let cost_category_rule_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "CostCategoryExpression.v1" -> CostCategoryExpressionV1
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CostCategoryRuleVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "CostCategoryRuleVersion")
     : cost_category_rule_version)
    : cost_category_rule_version)

let update_cost_category_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = value_for_key arn_of_yojson "CostCategoryArn" _list path;
     effective_start =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveStart") _list path;
     rule_version = value_for_key cost_category_rule_version_of_yojson "RuleVersion" _list path;
     rules = value_for_key cost_category_rules_list_of_yojson "Rules" _list path;
     default_value =
       option_of_yojson (value_for_key cost_category_value_of_yojson "DefaultValue") _list path;
     split_charge_rules =
       option_of_yojson
         (value_for_key cost_category_split_charge_rules_list_of_yojson "SplitChargeRules")
         _list path;
   }
    : update_cost_category_definition_request)

let update_cost_allocation_tags_status_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_key = option_of_yojson (value_for_key tag_key_of_yojson "TagKey") _list path;
     code = option_of_yojson (value_for_key generic_string_of_yojson "Code") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : update_cost_allocation_tags_status_error)

let update_cost_allocation_tags_status_errors_of_yojson tree path =
  list_of_yojson update_cost_allocation_tags_status_error_of_yojson tree path

let update_cost_allocation_tags_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key update_cost_allocation_tags_status_errors_of_yojson "Errors")
         _list path;
   }
    : update_cost_allocation_tags_status_response)

let cost_allocation_tag_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CostAllocationTagStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CostAllocationTagStatus")
     : cost_allocation_tag_status)
    : cost_allocation_tag_status)

let cost_allocation_tag_status_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_key = value_for_key tag_key_of_yojson "TagKey" _list path;
     status = value_for_key cost_allocation_tag_status_of_yojson "Status" _list path;
   }
    : cost_allocation_tag_status_entry)

let cost_allocation_tag_status_list_of_yojson tree path =
  list_of_yojson cost_allocation_tag_status_entry_of_yojson tree path

let update_cost_allocation_tags_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_allocation_tags_status =
       value_for_key cost_allocation_tag_status_list_of_yojson "CostAllocationTagsStatus" _list path;
   }
    : update_cost_allocation_tags_status_request)

let unknown_subscription_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unknown_subscription_exception)

let unknown_monitor_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unknown_monitor_exception)

let update_anomaly_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ subscription_arn = value_for_key generic_string_of_yojson "SubscriptionArn" _list path }
    : update_anomaly_subscription_response)

let subscriber_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONFIRMED" -> CONFIRMED
    | `String "DECLINED" -> DECLINED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubscriberStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SubscriberStatus")
     : subscriber_status)
    : subscriber_status)

let subscriber_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EMAIL" -> EMAIL
    | `String "SNS" -> SNS
    | `String value -> raise (deserialize_unknown_enum_value_error path "SubscriberType" value)
    | _ -> raise (deserialize_wrong_type_error path "SubscriberType")
     : subscriber_type)
    : subscriber_type)

let subscriber_address_of_yojson = string_of_yojson

let subscriber_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address = option_of_yojson (value_for_key subscriber_address_of_yojson "Address") _list path;
     type_ = option_of_yojson (value_for_key subscriber_type_of_yojson "Type") _list path;
     status = option_of_yojson (value_for_key subscriber_status_of_yojson "Status") _list path;
   }
    : subscriber)

let subscribers_of_yojson tree path = list_of_yojson subscriber_of_yojson tree path
let monitor_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let anomaly_subscription_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "DAILY" -> DAILY
    | `String "IMMEDIATE" -> IMMEDIATE
    | `String "WEEKLY" -> WEEKLY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AnomalySubscriptionFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "AnomalySubscriptionFrequency")
     : anomaly_subscription_frequency)
    : anomaly_subscription_frequency)

let nullable_non_negative_double_of_yojson = double_of_yojson

let update_anomaly_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_arn = value_for_key generic_string_of_yojson "SubscriptionArn" _list path;
     threshold =
       option_of_yojson
         (value_for_key nullable_non_negative_double_of_yojson "Threshold")
         _list path;
     frequency =
       option_of_yojson
         (value_for_key anomaly_subscription_frequency_of_yojson "Frequency")
         _list path;
     monitor_arn_list =
       option_of_yojson (value_for_key monitor_arn_list_of_yojson "MonitorArnList") _list path;
     subscribers = option_of_yojson (value_for_key subscribers_of_yojson "Subscribers") _list path;
     subscription_name =
       option_of_yojson (value_for_key generic_string_of_yojson "SubscriptionName") _list path;
     threshold_expression =
       option_of_yojson (value_for_key expression_of_yojson "ThresholdExpression") _list path;
   }
    : update_anomaly_subscription_request)

let update_anomaly_monitor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monitor_arn = value_for_key generic_string_of_yojson "MonitorArn" _list path }
    : update_anomaly_monitor_response)

let update_anomaly_monitor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_arn = value_for_key generic_string_of_yojson "MonitorArn" _list path;
     monitor_name =
       option_of_yojson (value_for_key generic_string_of_yojson "MonitorName") _list path;
   }
    : update_anomaly_monitor_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "ResourceTagKeys" _list path;
   }
    : untag_resource_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     resource_name = option_of_yojson (value_for_key arn_of_yojson "ResourceName") _list path;
   }
    : too_many_tags_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key resource_tag_key_of_yojson "Key" _list path;
     value = value_for_key resource_tag_value_of_yojson "Value" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     resource_tags = value_for_key resource_tag_list_of_yojson "ResourceTags" _list path;
   }
    : tag_resource_request)

let generation_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : generation_exists_exception)

let data_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : data_unavailable_exception)

let recommendation_id_of_yojson = string_of_yojson

let start_savings_plans_purchase_recommendation_generation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson (value_for_key recommendation_id_of_yojson "RecommendationId") _list path;
     generation_started_time =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "GenerationStartedTime") _list path;
     estimated_completion_time =
       option_of_yojson
         (value_for_key zoned_date_time_of_yojson "EstimatedCompletionTime")
         _list path;
   }
    : start_savings_plans_purchase_recommendation_generation_response)

let start_savings_plans_purchase_recommendation_generation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let backfill_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : backfill_limit_exceeded_exception)

let cost_allocation_tag_backfill_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "PROCESSING" -> PROCESSING
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CostAllocationTagBackfillStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CostAllocationTagBackfillStatus")
     : cost_allocation_tag_backfill_status)
    : cost_allocation_tag_backfill_status)

let cost_allocation_tag_backfill_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backfill_from =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "BackfillFrom") _list path;
     requested_at =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "RequestedAt") _list path;
     completed_at =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "CompletedAt") _list path;
     backfill_status =
       option_of_yojson
         (value_for_key cost_allocation_tag_backfill_status_of_yojson "BackfillStatus")
         _list path;
     last_updated_at =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "LastUpdatedAt") _list path;
   }
    : cost_allocation_tag_backfill_request)

let start_cost_allocation_tag_backfill_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backfill_request =
       option_of_yojson
         (value_for_key cost_allocation_tag_backfill_request_of_yojson "BackfillRequest")
         _list path;
   }
    : start_cost_allocation_tag_backfill_response)

let start_cost_allocation_tag_backfill_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backfill_from = value_for_key zoned_date_time_of_yojson "BackfillFrom" _list path }
    : start_cost_allocation_tag_backfill_request)

let analysis_id_of_yojson = string_of_yojson

let start_commitment_purchase_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_id = value_for_key analysis_id_of_yojson "AnalysisId" _list path;
     analysis_started_time =
       value_for_key zoned_date_time_of_yojson "AnalysisStartedTime" _list path;
     estimated_completion_time =
       value_for_key zoned_date_time_of_yojson "EstimatedCompletionTime" _list path;
   }
    : start_commitment_purchase_analysis_response)

let savings_plans_target_coverage_of_yojson = int_of_yojson
let year_month_day_of_yojson = string_of_yojson

let date_interval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start = value_for_key year_month_day_of_yojson "Start" _list path;
     end_ = value_for_key year_month_day_of_yojson "End" _list path;
   }
    : date_interval)

let savings_plans_id_of_yojson = string_of_yojson

let savings_plans_to_exclude_of_yojson tree path =
  list_of_yojson savings_plans_id_of_yojson tree path

let savings_plans_commitment_of_yojson = double_of_yojson

let term_in_years_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONE_YEAR" -> ONE_YEAR
    | `String "THREE_YEARS" -> THREE_YEARS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TermInYears" value)
    | _ -> raise (deserialize_wrong_type_error path "TermInYears")
     : term_in_years)
    : term_in_years)

let supported_savings_plans_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPUTE_SP" -> COMPUTE_SP
    | `String "EC2_INSTANCE_SP" -> EC2_INSTANCE_SP
    | `String "SAGEMAKER_SP" -> SAGEMAKER_SP
    | `String "DATABASE_SP" -> DATABASE_SP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SupportedSavingsPlansType" value)
    | _ -> raise (deserialize_wrong_type_error path "SupportedSavingsPlansType")
     : supported_savings_plans_type)
    : supported_savings_plans_type)

let payment_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_UPFRONT" -> NO_UPFRONT
    | `String "PARTIAL_UPFRONT" -> PARTIAL_UPFRONT
    | `String "ALL_UPFRONT" -> ALL_UPFRONT
    | `String "LIGHT_UTILIZATION" -> LIGHT_UTILIZATION
    | `String "MEDIUM_UTILIZATION" -> MEDIUM_UTILIZATION
    | `String "HEAVY_UTILIZATION" -> HEAVY_UTILIZATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PaymentOption" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentOption")
     : payment_option)
    : payment_option)

let savings_plans_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_option =
       option_of_yojson (value_for_key payment_option_of_yojson "PaymentOption") _list path;
     savings_plans_type =
       option_of_yojson
         (value_for_key supported_savings_plans_type_of_yojson "SavingsPlansType")
         _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     instance_family =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceFamily") _list path;
     term_in_years =
       option_of_yojson (value_for_key term_in_years_of_yojson "TermInYears") _list path;
     savings_plans_commitment =
       option_of_yojson
         (value_for_key savings_plans_commitment_of_yojson "SavingsPlansCommitment")
         _list path;
     offering_id = option_of_yojson (value_for_key generic_string_of_yojson "OfferingId") _list path;
   }
    : savings_plans)

let savings_plans_to_add_of_yojson tree path = list_of_yojson savings_plans_of_yojson tree path

let analysis_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MAX_SAVINGS" -> MAX_SAVINGS
    | `String "CUSTOM_COMMITMENT" -> CUSTOM_COMMITMENT
    | `String "TARGET_AVERAGE_COVERAGE" -> TARGET_AVERAGE_COVERAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AnalysisType" value)
    | _ -> raise (deserialize_wrong_type_error path "AnalysisType")
     : analysis_type)
    : analysis_type)

let account_id_of_yojson = string_of_yojson

let account_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "PAYER" -> PAYER
    | `String "LINKED" -> LINKED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountScope" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountScope")
     : account_scope)
    : account_scope)

let savings_plans_purchase_analysis_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson (value_for_key account_scope_of_yojson "AccountScope") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "AccountId") _list path;
     analysis_type = value_for_key analysis_type_of_yojson "AnalysisType" _list path;
     savings_plans_to_add =
       value_for_key savings_plans_to_add_of_yojson "SavingsPlansToAdd" _list path;
     savings_plans_to_exclude =
       option_of_yojson
         (value_for_key savings_plans_to_exclude_of_yojson "SavingsPlansToExclude")
         _list path;
     look_back_time_period = value_for_key date_interval_of_yojson "LookBackTimePeriod" _list path;
     savings_plans_target_coverage =
       option_of_yojson
         (value_for_key savings_plans_target_coverage_of_yojson "SavingsPlansTargetCoverage")
         _list path;
   }
    : savings_plans_purchase_analysis_configuration)

let commitment_purchase_analysis_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_purchase_analysis_configuration =
       option_of_yojson
         (value_for_key savings_plans_purchase_analysis_configuration_of_yojson
            "SavingsPlansPurchaseAnalysisConfiguration")
         _list path;
   }
    : commitment_purchase_analysis_configuration)

let start_commitment_purchase_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commitment_purchase_analysis_configuration =
       value_for_key commitment_purchase_analysis_configuration_of_yojson
         "CommitmentPurchaseAnalysisConfiguration" _list path;
   }
    : start_commitment_purchase_analysis_request)

let provide_anomaly_feedback_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ anomaly_id = value_for_key generic_string_of_yojson "AnomalyId" _list path }
    : provide_anomaly_feedback_response)

let anomaly_feedback_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "YES" -> YES
    | `String "NO" -> NO
    | `String "PLANNED_ACTIVITY" -> PLANNED_ACTIVITY
    | `String value -> raise (deserialize_unknown_enum_value_error path "AnomalyFeedbackType" value)
    | _ -> raise (deserialize_wrong_type_error path "AnomalyFeedbackType")
     : anomaly_feedback_type)
    : anomaly_feedback_type)

let provide_anomaly_feedback_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_id = value_for_key generic_string_of_yojson "AnomalyId" _list path;
     feedback = value_for_key anomaly_feedback_type_of_yojson "Feedback" _list path;
   }
    : provide_anomaly_feedback_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let next_page_token_of_yojson = string_of_yojson

let generation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "PROCESSING" -> PROCESSING
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "GenerationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "GenerationStatus")
     : generation_status)
    : generation_status)

let generation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson (value_for_key recommendation_id_of_yojson "RecommendationId") _list path;
     generation_status =
       option_of_yojson (value_for_key generation_status_of_yojson "GenerationStatus") _list path;
     generation_started_time =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "GenerationStartedTime") _list path;
     generation_completion_time =
       option_of_yojson
         (value_for_key zoned_date_time_of_yojson "GenerationCompletionTime")
         _list path;
     estimated_completion_time =
       option_of_yojson
         (value_for_key zoned_date_time_of_yojson "EstimatedCompletionTime")
         _list path;
   }
    : generation_summary)

let generation_summary_list_of_yojson tree path =
  list_of_yojson generation_summary_of_yojson tree path

let list_savings_plans_purchase_recommendation_generation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     generation_summary_list =
       option_of_yojson
         (value_for_key generation_summary_list_of_yojson "GenerationSummaryList")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : list_savings_plans_purchase_recommendation_generation_response)

let recommendations_page_size_of_yojson = int_of_yojson

let recommendation_id_list_of_yojson tree path =
  list_of_yojson recommendation_id_of_yojson tree path

let list_savings_plans_purchase_recommendation_generation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     generation_status =
       option_of_yojson (value_for_key generation_status_of_yojson "GenerationStatus") _list path;
     recommendation_ids =
       option_of_yojson
         (value_for_key recommendation_id_list_of_yojson "RecommendationIds")
         _list path;
     page_size =
       option_of_yojson (value_for_key recommendations_page_size_of_yojson "PageSize") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : list_savings_plans_purchase_recommendation_generation_request)

let generic_arn_of_yojson = string_of_yojson

let cost_category_resource_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key generic_arn_of_yojson "ResourceArn") _list path;
     cost_category_name =
       option_of_yojson (value_for_key cost_category_name_of_yojson "CostCategoryName") _list path;
     cost_category_arn = option_of_yojson (value_for_key arn_of_yojson "CostCategoryArn") _list path;
   }
    : cost_category_resource_association)

let cost_category_resource_associations_of_yojson tree path =
  list_of_yojson cost_category_resource_association_of_yojson tree path

let list_cost_category_resource_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_resource_associations =
       option_of_yojson
         (value_for_key cost_category_resource_associations_of_yojson
            "CostCategoryResourceAssociations")
         _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_cost_category_resource_associations_response)

let cost_category_max_results_of_yojson = int_of_yojson

let list_cost_category_resource_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = option_of_yojson (value_for_key arn_of_yojson "CostCategoryArn") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key cost_category_max_results_of_yojson "MaxResults") _list path;
   }
    : list_cost_category_resource_associations_request)

let resource_type_of_yojson = string_of_yojson
let resource_types_of_yojson tree path = list_of_yojson resource_type_of_yojson tree path

let cost_category_values_list_of_yojson tree path =
  list_of_yojson cost_category_value_of_yojson tree path

let cost_category_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROCESSING" -> PROCESSING
    | `String "APPLIED" -> APPLIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "CostCategoryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CostCategoryStatus")
     : cost_category_status)
    : cost_category_status)

let cost_category_status_component_of_yojson (tree : t) path =
  ((match tree with
    | `String "COST_EXPLORER" -> COST_EXPLORER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CostCategoryStatusComponent" value)
    | _ -> raise (deserialize_wrong_type_error path "CostCategoryStatusComponent")
     : cost_category_status_component)
    : cost_category_status_component)

let cost_category_processing_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component =
       option_of_yojson
         (value_for_key cost_category_status_component_of_yojson "Component")
         _list path;
     status = option_of_yojson (value_for_key cost_category_status_of_yojson "Status") _list path;
   }
    : cost_category_processing_status)

let cost_category_processing_status_list_of_yojson tree path =
  list_of_yojson cost_category_processing_status_of_yojson tree path

let non_negative_integer_of_yojson = int_of_yojson

let cost_category_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = option_of_yojson (value_for_key arn_of_yojson "CostCategoryArn") _list path;
     name = option_of_yojson (value_for_key cost_category_name_of_yojson "Name") _list path;
     effective_start =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveStart") _list path;
     effective_end =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveEnd") _list path;
     number_of_rules =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "NumberOfRules") _list path;
     processing_status =
       option_of_yojson
         (value_for_key cost_category_processing_status_list_of_yojson "ProcessingStatus")
         _list path;
     values =
       option_of_yojson (value_for_key cost_category_values_list_of_yojson "Values") _list path;
     default_value =
       option_of_yojson (value_for_key cost_category_value_of_yojson "DefaultValue") _list path;
     supported_resource_types =
       option_of_yojson (value_for_key resource_types_of_yojson "SupportedResourceTypes") _list path;
   }
    : cost_category_reference)

let cost_category_references_list_of_yojson tree path =
  list_of_yojson cost_category_reference_of_yojson tree path

let list_cost_category_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_references =
       option_of_yojson
         (value_for_key cost_category_references_list_of_yojson "CostCategoryReferences")
         _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_cost_category_definitions_response)

let resource_types_filter_input_of_yojson tree path =
  list_of_yojson resource_type_of_yojson tree path

let list_cost_category_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     effective_on =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveOn") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key cost_category_max_results_of_yojson "MaxResults") _list path;
     supported_resource_types =
       option_of_yojson
         (value_for_key resource_types_filter_input_of_yojson "SupportedResourceTypes")
         _list path;
   }
    : list_cost_category_definitions_request)

let cost_allocation_tag_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWSGenerated" -> AWS_GENERATED
    | `String "UserDefined" -> USER_DEFINED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CostAllocationTagType" value)
    | _ -> raise (deserialize_wrong_type_error path "CostAllocationTagType")
     : cost_allocation_tag_type)
    : cost_allocation_tag_type)

let cost_allocation_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_key = value_for_key tag_key_of_yojson "TagKey" _list path;
     type_ = value_for_key cost_allocation_tag_type_of_yojson "Type" _list path;
     status = value_for_key cost_allocation_tag_status_of_yojson "Status" _list path;
     last_updated_date =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "LastUpdatedDate") _list path;
     last_used_date =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "LastUsedDate") _list path;
   }
    : cost_allocation_tag)

let cost_allocation_tag_list_of_yojson tree path =
  list_of_yojson cost_allocation_tag_of_yojson tree path

let list_cost_allocation_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_allocation_tags =
       option_of_yojson
         (value_for_key cost_allocation_tag_list_of_yojson "CostAllocationTags")
         _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_cost_allocation_tags_response)

let cost_allocation_tags_max_results_of_yojson = int_of_yojson
let cost_allocation_tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let list_cost_allocation_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key cost_allocation_tag_status_of_yojson "Status") _list path;
     tag_keys =
       option_of_yojson (value_for_key cost_allocation_tag_key_list_of_yojson "TagKeys") _list path;
     type_ = option_of_yojson (value_for_key cost_allocation_tag_type_of_yojson "Type") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key cost_allocation_tags_max_results_of_yojson "MaxResults")
         _list path;
   }
    : list_cost_allocation_tags_request)

let cost_allocation_tag_backfill_request_list_of_yojson tree path =
  list_of_yojson cost_allocation_tag_backfill_request_of_yojson tree path

let list_cost_allocation_tag_backfill_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backfill_requests =
       option_of_yojson
         (value_for_key cost_allocation_tag_backfill_request_list_of_yojson "BackfillRequests")
         _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_cost_allocation_tag_backfill_history_response)

let list_cost_allocation_tag_backfill_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key cost_allocation_tags_max_results_of_yojson "MaxResults")
         _list path;
   }
    : list_cost_allocation_tag_backfill_history_request)

let error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_USAGE_FOUND" -> NO_USAGE_FOUND
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String "INVALID_SAVINGS_PLANS_TO_ADD" -> INVALID_SAVINGS_PLANS_TO_ADD
    | `String "INVALID_SAVINGS_PLANS_TO_EXCLUDE" -> INVALID_SAVINGS_PLANS_TO_EXCLUDE
    | `String "INVALID_ACCOUNT_ID" -> INVALID_ACCOUNT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ErrorCode")
     : error_code)
    : error_code)

let analysis_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "PROCESSING" -> PROCESSING
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AnalysisStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AnalysisStatus")
     : analysis_status)
    : analysis_status)

let analysis_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_completion_time =
       option_of_yojson
         (value_for_key zoned_date_time_of_yojson "EstimatedCompletionTime")
         _list path;
     analysis_completion_time =
       option_of_yojson
         (value_for_key zoned_date_time_of_yojson "AnalysisCompletionTime")
         _list path;
     analysis_started_time =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "AnalysisStartedTime") _list path;
     analysis_status =
       option_of_yojson (value_for_key analysis_status_of_yojson "AnalysisStatus") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     analysis_id = option_of_yojson (value_for_key analysis_id_of_yojson "AnalysisId") _list path;
     commitment_purchase_analysis_configuration =
       option_of_yojson
         (value_for_key commitment_purchase_analysis_configuration_of_yojson
            "CommitmentPurchaseAnalysisConfiguration")
         _list path;
   }
    : analysis_summary)

let analysis_summary_list_of_yojson tree path = list_of_yojson analysis_summary_of_yojson tree path

let list_commitment_purchase_analyses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_summary_list =
       option_of_yojson
         (value_for_key analysis_summary_list_of_yojson "AnalysisSummaryList")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : list_commitment_purchase_analyses_response)

let analysis_ids_of_yojson tree path = list_of_yojson analysis_id_of_yojson tree path
let analyses_page_size_of_yojson = int_of_yojson

let list_commitment_purchase_analyses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_status =
       option_of_yojson (value_for_key analysis_status_of_yojson "AnalysisStatus") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     page_size = option_of_yojson (value_for_key analyses_page_size_of_yojson "PageSize") _list path;
     analysis_ids = option_of_yojson (value_for_key analysis_ids_of_yojson "AnalysisIds") _list path;
   }
    : list_commitment_purchase_analyses_request)

let unresolvable_usage_unit_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unresolvable_usage_unit_exception)

let billing_view_health_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : billing_view_health_status_exception)

let forecast_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = option_of_yojson (value_for_key date_interval_of_yojson "TimePeriod") _list path;
     mean_value = option_of_yojson (value_for_key generic_string_of_yojson "MeanValue") _list path;
     prediction_interval_lower_bound =
       option_of_yojson
         (value_for_key generic_string_of_yojson "PredictionIntervalLowerBound")
         _list path;
     prediction_interval_upper_bound =
       option_of_yojson
         (value_for_key generic_string_of_yojson "PredictionIntervalUpperBound")
         _list path;
   }
    : forecast_result)

let forecast_results_by_time_of_yojson tree path =
  list_of_yojson forecast_result_of_yojson tree path

let metric_unit_of_yojson = string_of_yojson
let metric_amount_of_yojson = string_of_yojson

let metric_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = option_of_yojson (value_for_key metric_amount_of_yojson "Amount") _list path;
     unit_ = option_of_yojson (value_for_key metric_unit_of_yojson "Unit") _list path;
   }
    : metric_value)

let get_usage_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total = option_of_yojson (value_for_key metric_value_of_yojson "Total") _list path;
     forecast_results_by_time =
       option_of_yojson
         (value_for_key forecast_results_by_time_of_yojson "ForecastResultsByTime")
         _list path;
   }
    : get_usage_forecast_response)

let prediction_interval_level_of_yojson = int_of_yojson
let billing_view_arn_of_yojson = string_of_yojson

let granularity_of_yojson (tree : t) path =
  ((match tree with
    | `String "DAILY" -> DAILY
    | `String "MONTHLY" -> MONTHLY
    | `String "HOURLY" -> HOURLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Granularity" value)
    | _ -> raise (deserialize_wrong_type_error path "Granularity")
     : granularity)
    : granularity)

let metric_of_yojson (tree : t) path =
  ((match tree with
    | `String "BLENDED_COST" -> BLENDED_COST
    | `String "UNBLENDED_COST" -> UNBLENDED_COST
    | `String "AMORTIZED_COST" -> AMORTIZED_COST
    | `String "NET_UNBLENDED_COST" -> NET_UNBLENDED_COST
    | `String "NET_AMORTIZED_COST" -> NET_AMORTIZED_COST
    | `String "USAGE_QUANTITY" -> USAGE_QUANTITY
    | `String "NORMALIZED_USAGE_AMOUNT" -> NORMALIZED_USAGE_AMOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Metric" value)
    | _ -> raise (deserialize_wrong_type_error path "Metric")
     : metric)
    : metric)

let get_usage_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     metric = value_for_key metric_of_yojson "Metric" _list path;
     granularity = value_for_key granularity_of_yojson "Granularity" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     prediction_interval_level =
       option_of_yojson
         (value_for_key prediction_interval_level_of_yojson "PredictionIntervalLevel")
         _list path;
   }
    : get_usage_forecast_request)

let request_changed_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : request_changed_exception)

let bill_expiration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : bill_expiration_exception)

let page_size_of_yojson = int_of_yojson
let entity_of_yojson = string_of_yojson
let tag_list_of_yojson tree path = list_of_yojson entity_of_yojson tree path

let get_tags_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     return_size = value_for_key page_size_of_yojson "ReturnSize" _list path;
     total_size = value_for_key page_size_of_yojson "TotalSize" _list path;
   }
    : get_tags_response)

let max_results_of_yojson = int_of_yojson

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_definition_key_of_yojson = string_of_yojson

let sort_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key sort_definition_key_of_yojson "Key" _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "SortOrder") _list path;
   }
    : sort_definition)

let sort_definitions_of_yojson tree path = list_of_yojson sort_definition_of_yojson tree path
let search_string_of_yojson = string_of_yojson

let get_tags_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     search_string =
       option_of_yojson (value_for_key search_string_of_yojson "SearchString") _list path;
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     tag_key = option_of_yojson (value_for_key tag_key_of_yojson "TagKey") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     sort_by = option_of_yojson (value_for_key sort_definitions_of_yojson "SortBy") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_tags_request)

let savings_plans_amortized_commitment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amortized_recurring_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "AmortizedRecurringCommitment")
         _list path;
     amortized_upfront_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "AmortizedUpfrontCommitment")
         _list path;
     total_amortized_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "TotalAmortizedCommitment")
         _list path;
   }
    : savings_plans_amortized_commitment)

let savings_plans_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     net_savings = option_of_yojson (value_for_key generic_string_of_yojson "NetSavings") _list path;
     on_demand_cost_equivalent =
       option_of_yojson (value_for_key generic_string_of_yojson "OnDemandCostEquivalent") _list path;
   }
    : savings_plans_savings)

let savings_plans_utilization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_commitment =
       option_of_yojson (value_for_key generic_string_of_yojson "TotalCommitment") _list path;
     used_commitment =
       option_of_yojson (value_for_key generic_string_of_yojson "UsedCommitment") _list path;
     unused_commitment =
       option_of_yojson (value_for_key generic_string_of_yojson "UnusedCommitment") _list path;
     utilization_percentage =
       option_of_yojson (value_for_key generic_string_of_yojson "UtilizationPercentage") _list path;
   }
    : savings_plans_utilization)

let savings_plans_utilization_aggregates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     utilization = value_for_key savings_plans_utilization_of_yojson "Utilization" _list path;
     savings = option_of_yojson (value_for_key savings_plans_savings_of_yojson "Savings") _list path;
     amortized_commitment =
       option_of_yojson
         (value_for_key savings_plans_amortized_commitment_of_yojson "AmortizedCommitment")
         _list path;
   }
    : savings_plans_utilization_aggregates)

let attribute_value_of_yojson = string_of_yojson
let attribute_type_of_yojson = string_of_yojson

let attributes_of_yojson tree path =
  map_of_yojson attribute_type_of_yojson attribute_value_of_yojson tree path

let savings_plan_arn_of_yojson = string_of_yojson

let savings_plans_utilization_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plan_arn =
       option_of_yojson (value_for_key savings_plan_arn_of_yojson "SavingsPlanArn") _list path;
     attributes = option_of_yojson (value_for_key attributes_of_yojson "Attributes") _list path;
     utilization =
       option_of_yojson (value_for_key savings_plans_utilization_of_yojson "Utilization") _list path;
     savings = option_of_yojson (value_for_key savings_plans_savings_of_yojson "Savings") _list path;
     amortized_commitment =
       option_of_yojson
         (value_for_key savings_plans_amortized_commitment_of_yojson "AmortizedCommitment")
         _list path;
   }
    : savings_plans_utilization_detail)

let savings_plans_utilization_details_of_yojson tree path =
  list_of_yojson savings_plans_utilization_detail_of_yojson tree path

let get_savings_plans_utilization_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_utilization_details =
       value_for_key savings_plans_utilization_details_of_yojson "SavingsPlansUtilizationDetails"
         _list path;
     total =
       option_of_yojson
         (value_for_key savings_plans_utilization_aggregates_of_yojson "Total")
         _list path;
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : get_savings_plans_utilization_details_response)

let savings_plans_data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ATTRIBUTES" -> ATTRIBUTES
    | `String "UTILIZATION" -> UTILIZATION
    | `String "AMORTIZED_COMMITMENT" -> AMORTIZED_COMMITMENT
    | `String "SAVINGS" -> SAVINGS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SavingsPlansDataType" value)
    | _ -> raise (deserialize_wrong_type_error path "SavingsPlansDataType")
     : savings_plans_data_type)
    : savings_plans_data_type)

let savings_plans_data_types_of_yojson tree path =
  list_of_yojson savings_plans_data_type_of_yojson tree path

let get_savings_plans_utilization_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     data_type =
       option_of_yojson (value_for_key savings_plans_data_types_of_yojson "DataType") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     sort_by = option_of_yojson (value_for_key sort_definition_of_yojson "SortBy") _list path;
   }
    : get_savings_plans_utilization_details_request)

let savings_plans_utilization_by_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     utilization = value_for_key savings_plans_utilization_of_yojson "Utilization" _list path;
     savings = option_of_yojson (value_for_key savings_plans_savings_of_yojson "Savings") _list path;
     amortized_commitment =
       option_of_yojson
         (value_for_key savings_plans_amortized_commitment_of_yojson "AmortizedCommitment")
         _list path;
   }
    : savings_plans_utilization_by_time)

let savings_plans_utilizations_by_time_of_yojson tree path =
  list_of_yojson savings_plans_utilization_by_time_of_yojson tree path

let get_savings_plans_utilization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_utilizations_by_time =
       option_of_yojson
         (value_for_key savings_plans_utilizations_by_time_of_yojson
            "SavingsPlansUtilizationsByTime")
         _list path;
     total = value_for_key savings_plans_utilization_aggregates_of_yojson "Total" _list path;
   }
    : get_savings_plans_utilization_response)

let get_savings_plans_utilization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "Granularity") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     sort_by = option_of_yojson (value_for_key sort_definition_of_yojson "SortBy") _list path;
   }
    : get_savings_plans_utilization_request)

let savings_plans_purchase_recommendation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_ro_i =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedROI") _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
     estimated_total_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedTotalCost") _list path;
     current_on_demand_spend =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrentOnDemandSpend") _list path;
     estimated_savings_amount =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedSavingsAmount") _list path;
     total_recommendation_count =
       option_of_yojson
         (value_for_key generic_string_of_yojson "TotalRecommendationCount")
         _list path;
     daily_commitment_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "DailyCommitmentToPurchase")
         _list path;
     hourly_commitment_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "HourlyCommitmentToPurchase")
         _list path;
     estimated_savings_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedSavingsPercentage")
         _list path;
     estimated_monthly_savings_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavingsAmount")
         _list path;
     estimated_on_demand_cost_with_current_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedOnDemandCostWithCurrentCommitment")
         _list path;
   }
    : savings_plans_purchase_recommendation_summary)

let recommendation_detail_id_of_yojson = string_of_yojson

let savings_plans_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     instance_family =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceFamily") _list path;
     offering_id = option_of_yojson (value_for_key generic_string_of_yojson "OfferingId") _list path;
   }
    : savings_plans_details)

let savings_plans_purchase_recommendation_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_details =
       option_of_yojson
         (value_for_key savings_plans_details_of_yojson "SavingsPlansDetails")
         _list path;
     account_id = option_of_yojson (value_for_key generic_string_of_yojson "AccountId") _list path;
     upfront_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "UpfrontCost") _list path;
     estimated_ro_i =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedROI") _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
     estimated_sp_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedSPCost") _list path;
     estimated_on_demand_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedOnDemandCost") _list path;
     estimated_on_demand_cost_with_current_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedOnDemandCostWithCurrentCommitment")
         _list path;
     estimated_savings_amount =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedSavingsAmount") _list path;
     estimated_savings_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedSavingsPercentage")
         _list path;
     hourly_commitment_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "HourlyCommitmentToPurchase")
         _list path;
     estimated_average_utilization =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedAverageUtilization")
         _list path;
     estimated_monthly_savings_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavingsAmount")
         _list path;
     current_minimum_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentMinimumHourlyOnDemandSpend")
         _list path;
     current_maximum_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentMaximumHourlyOnDemandSpend")
         _list path;
     current_average_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentAverageHourlyOnDemandSpend")
         _list path;
     recommendation_detail_id =
       option_of_yojson
         (value_for_key recommendation_detail_id_of_yojson "RecommendationDetailId")
         _list path;
   }
    : savings_plans_purchase_recommendation_detail)

let savings_plans_purchase_recommendation_detail_list_of_yojson tree path =
  list_of_yojson savings_plans_purchase_recommendation_detail_of_yojson tree path

let lookback_period_in_days_of_yojson (tree : t) path =
  ((match tree with
    | `String "SEVEN_DAYS" -> SEVEN_DAYS
    | `String "THIRTY_DAYS" -> THIRTY_DAYS
    | `String "SIXTY_DAYS" -> SIXTY_DAYS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LookbackPeriodInDays" value)
    | _ -> raise (deserialize_wrong_type_error path "LookbackPeriodInDays")
     : lookback_period_in_days)
    : lookback_period_in_days)

let savings_plans_purchase_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson (value_for_key account_scope_of_yojson "AccountScope") _list path;
     savings_plans_type =
       option_of_yojson
         (value_for_key supported_savings_plans_type_of_yojson "SavingsPlansType")
         _list path;
     term_in_years =
       option_of_yojson (value_for_key term_in_years_of_yojson "TermInYears") _list path;
     payment_option =
       option_of_yojson (value_for_key payment_option_of_yojson "PaymentOption") _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key lookback_period_in_days_of_yojson "LookbackPeriodInDays")
         _list path;
     savings_plans_purchase_recommendation_details =
       option_of_yojson
         (value_for_key savings_plans_purchase_recommendation_detail_list_of_yojson
            "SavingsPlansPurchaseRecommendationDetails")
         _list path;
     savings_plans_purchase_recommendation_summary =
       option_of_yojson
         (value_for_key savings_plans_purchase_recommendation_summary_of_yojson
            "SavingsPlansPurchaseRecommendationSummary")
         _list path;
   }
    : savings_plans_purchase_recommendation)

let savings_plans_purchase_recommendation_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson (value_for_key generic_string_of_yojson "RecommendationId") _list path;
     generation_timestamp =
       option_of_yojson (value_for_key generic_string_of_yojson "GenerationTimestamp") _list path;
     additional_metadata =
       option_of_yojson (value_for_key generic_string_of_yojson "AdditionalMetadata") _list path;
   }
    : savings_plans_purchase_recommendation_metadata)

let get_savings_plans_purchase_recommendation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata =
       option_of_yojson
         (value_for_key savings_plans_purchase_recommendation_metadata_of_yojson "Metadata")
         _list path;
     savings_plans_purchase_recommendation =
       option_of_yojson
         (value_for_key savings_plans_purchase_recommendation_of_yojson
            "SavingsPlansPurchaseRecommendation")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_savings_plans_purchase_recommendation_response)

let get_savings_plans_purchase_recommendation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_type =
       value_for_key supported_savings_plans_type_of_yojson "SavingsPlansType" _list path;
     term_in_years = value_for_key term_in_years_of_yojson "TermInYears" _list path;
     payment_option = value_for_key payment_option_of_yojson "PaymentOption" _list path;
     account_scope =
       option_of_yojson (value_for_key account_scope_of_yojson "AccountScope") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     page_size =
       option_of_yojson (value_for_key recommendations_page_size_of_yojson "PageSize") _list path;
     lookback_period_in_days =
       value_for_key lookback_period_in_days_of_yojson "LookbackPeriodInDays" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
   }
    : get_savings_plans_purchase_recommendation_request)

let savings_plans_coverage_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     spend_covered_by_savings_plans =
       option_of_yojson
         (value_for_key generic_string_of_yojson "SpendCoveredBySavingsPlans")
         _list path;
     on_demand_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "OnDemandCost") _list path;
     total_cost = option_of_yojson (value_for_key generic_string_of_yojson "TotalCost") _list path;
     coverage_percentage =
       option_of_yojson (value_for_key generic_string_of_yojson "CoveragePercentage") _list path;
   }
    : savings_plans_coverage_data)

let savings_plans_coverage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attributes_of_yojson "Attributes") _list path;
     coverage =
       option_of_yojson (value_for_key savings_plans_coverage_data_of_yojson "Coverage") _list path;
     time_period = option_of_yojson (value_for_key date_interval_of_yojson "TimePeriod") _list path;
   }
    : savings_plans_coverage)

let savings_plans_coverages_of_yojson tree path =
  list_of_yojson savings_plans_coverage_of_yojson tree path

let get_savings_plans_coverage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_coverages =
       value_for_key savings_plans_coverages_of_yojson "SavingsPlansCoverages" _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : get_savings_plans_coverage_response)

let metric_name_of_yojson = string_of_yojson
let metric_names_of_yojson tree path = list_of_yojson metric_name_of_yojson tree path
let group_definition_key_of_yojson = string_of_yojson

let group_definition_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DIMENSION" -> DIMENSION
    | `String "TAG" -> TAG
    | `String "COST_CATEGORY" -> COST_CATEGORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "GroupDefinitionType" value)
    | _ -> raise (deserialize_wrong_type_error path "GroupDefinitionType")
     : group_definition_type)
    : group_definition_type)

let group_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key group_definition_type_of_yojson "Type") _list path;
     key = option_of_yojson (value_for_key group_definition_key_of_yojson "Key") _list path;
   }
    : group_definition)

let group_definitions_of_yojson tree path = list_of_yojson group_definition_of_yojson tree path

let get_savings_plans_coverage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "GroupBy") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "Granularity") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     metrics = option_of_yojson (value_for_key metric_names_of_yojson "Metrics") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     sort_by = option_of_yojson (value_for_key sort_definition_of_yojson "SortBy") _list path;
   }
    : get_savings_plans_coverage_request)

let recommendation_detail_hourly_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = option_of_yojson (value_for_key zoned_date_time_of_yojson "StartTime") _list path;
     estimated_on_demand_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedOnDemandCost") _list path;
     current_coverage =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrentCoverage") _list path;
     estimated_coverage =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedCoverage") _list path;
     estimated_new_commitment_utilization =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedNewCommitmentUtilization")
         _list path;
   }
    : recommendation_detail_hourly_metrics)

let metrics_over_lookback_period_of_yojson tree path =
  list_of_yojson recommendation_detail_hourly_metrics_of_yojson tree path

let recommendation_detail_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson (value_for_key account_scope_of_yojson "AccountScope") _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key lookback_period_in_days_of_yojson "LookbackPeriodInDays")
         _list path;
     savings_plans_type =
       option_of_yojson
         (value_for_key supported_savings_plans_type_of_yojson "SavingsPlansType")
         _list path;
     term_in_years =
       option_of_yojson (value_for_key term_in_years_of_yojson "TermInYears") _list path;
     payment_option =
       option_of_yojson (value_for_key payment_option_of_yojson "PaymentOption") _list path;
     account_id = option_of_yojson (value_for_key generic_string_of_yojson "AccountId") _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
     instance_family =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceFamily") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     offering_id = option_of_yojson (value_for_key generic_string_of_yojson "OfferingId") _list path;
     generation_timestamp =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "GenerationTimestamp") _list path;
     latest_usage_timestamp =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "LatestUsageTimestamp") _list path;
     current_average_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentAverageHourlyOnDemandSpend")
         _list path;
     current_maximum_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentMaximumHourlyOnDemandSpend")
         _list path;
     current_minimum_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentMinimumHourlyOnDemandSpend")
         _list path;
     estimated_average_utilization =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedAverageUtilization")
         _list path;
     estimated_monthly_savings_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavingsAmount")
         _list path;
     estimated_on_demand_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedOnDemandCost") _list path;
     estimated_on_demand_cost_with_current_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedOnDemandCostWithCurrentCommitment")
         _list path;
     estimated_ro_i =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedROI") _list path;
     estimated_sp_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedSPCost") _list path;
     estimated_savings_amount =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedSavingsAmount") _list path;
     estimated_savings_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedSavingsPercentage")
         _list path;
     existing_hourly_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "ExistingHourlyCommitment")
         _list path;
     hourly_commitment_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "HourlyCommitmentToPurchase")
         _list path;
     upfront_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "UpfrontCost") _list path;
     current_average_coverage =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrentAverageCoverage") _list path;
     estimated_average_coverage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedAverageCoverage")
         _list path;
     metrics_over_lookback_period =
       option_of_yojson
         (value_for_key metrics_over_lookback_period_of_yojson "MetricsOverLookbackPeriod")
         _list path;
   }
    : recommendation_detail_data)

let get_savings_plan_purchase_recommendation_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_detail_id =
       option_of_yojson
         (value_for_key recommendation_detail_id_of_yojson "RecommendationDetailId")
         _list path;
     recommendation_detail_data =
       option_of_yojson
         (value_for_key recommendation_detail_data_of_yojson "RecommendationDetailData")
         _list path;
   }
    : get_savings_plan_purchase_recommendation_details_response)

let get_savings_plan_purchase_recommendation_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_detail_id =
       value_for_key recommendation_detail_id_of_yojson "RecommendationDetailId" _list path;
   }
    : get_savings_plan_purchase_recommendation_details_request)

let generic_boolean_of_yojson = bool_of_yojson

let recommendation_target_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAME_INSTANCE_FAMILY" -> SAME_INSTANCE_FAMILY
    | `String "CROSS_INSTANCE_FAMILY" -> CROSS_INSTANCE_FAMILY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecommendationTarget" value)
    | _ -> raise (deserialize_wrong_type_error path "RecommendationTarget")
     : recommendation_target)
    : recommendation_target)

let rightsizing_recommendation_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_target =
       value_for_key recommendation_target_of_yojson "RecommendationTarget" _list path;
     benefits_considered = value_for_key generic_boolean_of_yojson "BenefitsConsidered" _list path;
   }
    : rightsizing_recommendation_configuration)

let finding_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CPU_OVER_PROVISIONED" -> CPU_OVER_PROVISIONED
    | `String "CPU_UNDER_PROVISIONED" -> CPU_UNDER_PROVISIONED
    | `String "MEMORY_OVER_PROVISIONED" -> MEMORY_OVER_PROVISIONED
    | `String "MEMORY_UNDER_PROVISIONED" -> MEMORY_UNDER_PROVISIONED
    | `String "EBS_THROUGHPUT_OVER_PROVISIONED" -> EBS_THROUGHPUT_OVER_PROVISIONED
    | `String "EBS_THROUGHPUT_UNDER_PROVISIONED" -> EBS_THROUGHPUT_UNDER_PROVISIONED
    | `String "EBS_IOPS_OVER_PROVISIONED" -> EBS_IOPS_OVER_PROVISIONED
    | `String "EBS_IOPS_UNDER_PROVISIONED" -> EBS_IOPS_UNDER_PROVISIONED
    | `String "NETWORK_BANDWIDTH_OVER_PROVISIONED" -> NETWORK_BANDWIDTH_OVER_PROVISIONED
    | `String "NETWORK_BANDWIDTH_UNDER_PROVISIONED" -> NETWORK_BANDWIDTH_UNDER_PROVISIONED
    | `String "NETWORK_PPS_OVER_PROVISIONED" -> NETWORK_PPS_OVER_PROVISIONED
    | `String "NETWORK_PPS_UNDER_PROVISIONED" -> NETWORK_PPS_UNDER_PROVISIONED
    | `String "DISK_IOPS_OVER_PROVISIONED" -> DISK_IOPS_OVER_PROVISIONED
    | `String "DISK_IOPS_UNDER_PROVISIONED" -> DISK_IOPS_UNDER_PROVISIONED
    | `String "DISK_THROUGHPUT_OVER_PROVISIONED" -> DISK_THROUGHPUT_OVER_PROVISIONED
    | `String "DISK_THROUGHPUT_UNDER_PROVISIONED" -> DISK_THROUGHPUT_UNDER_PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FindingReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FindingReasonCode")
     : finding_reason_code)
    : finding_reason_code)

let finding_reason_codes_of_yojson tree path =
  list_of_yojson finding_reason_code_of_yojson tree path

let terminate_recommendation_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavings")
         _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
   }
    : terminate_recommendation_detail)

let platform_difference_of_yojson (tree : t) path =
  ((match tree with
    | `String "HYPERVISOR" -> HYPERVISOR
    | `String "NETWORK_INTERFACE" -> NETWORK_INTERFACE
    | `String "STORAGE_INTERFACE" -> STORAGE_INTERFACE
    | `String "INSTANCE_STORE_AVAILABILITY" -> INSTANCE_STORE_AVAILABILITY
    | `String "VIRTUALIZATION_TYPE" -> VIRTUALIZATION_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformDifference" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformDifference")
     : platform_difference)
    : platform_difference)

let platform_differences_of_yojson tree path =
  list_of_yojson platform_difference_of_yojson tree path

let network_resource_utilization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_in_bytes_per_second =
       option_of_yojson
         (value_for_key generic_string_of_yojson "NetworkInBytesPerSecond")
         _list path;
     network_out_bytes_per_second =
       option_of_yojson
         (value_for_key generic_string_of_yojson "NetworkOutBytesPerSecond")
         _list path;
     network_packets_in_per_second =
       option_of_yojson
         (value_for_key generic_string_of_yojson "NetworkPacketsInPerSecond")
         _list path;
     network_packets_out_per_second =
       option_of_yojson
         (value_for_key generic_string_of_yojson "NetworkPacketsOutPerSecond")
         _list path;
   }
    : network_resource_utilization)

let disk_resource_utilization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_read_ops_per_second =
       option_of_yojson (value_for_key generic_string_of_yojson "DiskReadOpsPerSecond") _list path;
     disk_write_ops_per_second =
       option_of_yojson (value_for_key generic_string_of_yojson "DiskWriteOpsPerSecond") _list path;
     disk_read_bytes_per_second =
       option_of_yojson (value_for_key generic_string_of_yojson "DiskReadBytesPerSecond") _list path;
     disk_write_bytes_per_second =
       option_of_yojson
         (value_for_key generic_string_of_yojson "DiskWriteBytesPerSecond")
         _list path;
   }
    : disk_resource_utilization)

let ebs_resource_utilization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ebs_read_ops_per_second =
       option_of_yojson (value_for_key generic_string_of_yojson "EbsReadOpsPerSecond") _list path;
     ebs_write_ops_per_second =
       option_of_yojson (value_for_key generic_string_of_yojson "EbsWriteOpsPerSecond") _list path;
     ebs_read_bytes_per_second =
       option_of_yojson (value_for_key generic_string_of_yojson "EbsReadBytesPerSecond") _list path;
     ebs_write_bytes_per_second =
       option_of_yojson (value_for_key generic_string_of_yojson "EbsWriteBytesPerSecond") _list path;
   }
    : ebs_resource_utilization)

let ec2_resource_utilization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_cpu_utilization_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MaxCpuUtilizationPercentage")
         _list path;
     max_memory_utilization_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MaxMemoryUtilizationPercentage")
         _list path;
     max_storage_utilization_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MaxStorageUtilizationPercentage")
         _list path;
     ebs_resource_utilization =
       option_of_yojson
         (value_for_key ebs_resource_utilization_of_yojson "EBSResourceUtilization")
         _list path;
     disk_resource_utilization =
       option_of_yojson
         (value_for_key disk_resource_utilization_of_yojson "DiskResourceUtilization")
         _list path;
     network_resource_utilization =
       option_of_yojson
         (value_for_key network_resource_utilization_of_yojson "NetworkResourceUtilization")
         _list path;
   }
    : ec2_resource_utilization)

let resource_utilization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_resource_utilization =
       option_of_yojson
         (value_for_key ec2_resource_utilization_of_yojson "EC2ResourceUtilization")
         _list path;
   }
    : resource_utilization)

let ec2_resource_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hourly_on_demand_rate =
       option_of_yojson (value_for_key generic_string_of_yojson "HourlyOnDemandRate") _list path;
     instance_type =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceType") _list path;
     platform = option_of_yojson (value_for_key generic_string_of_yojson "Platform") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     sku = option_of_yojson (value_for_key generic_string_of_yojson "Sku") _list path;
     memory = option_of_yojson (value_for_key generic_string_of_yojson "Memory") _list path;
     network_performance =
       option_of_yojson (value_for_key generic_string_of_yojson "NetworkPerformance") _list path;
     storage = option_of_yojson (value_for_key generic_string_of_yojson "Storage") _list path;
     vcpu = option_of_yojson (value_for_key generic_string_of_yojson "Vcpu") _list path;
   }
    : ec2_resource_details)

let resource_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_resource_details =
       option_of_yojson
         (value_for_key ec2_resource_details_of_yojson "EC2ResourceDetails")
         _list path;
   }
    : resource_details)

let target_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_monthly_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedMonthlyCost") _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavings")
         _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
     default_target_instance =
       option_of_yojson (value_for_key generic_boolean_of_yojson "DefaultTargetInstance") _list path;
     resource_details =
       option_of_yojson (value_for_key resource_details_of_yojson "ResourceDetails") _list path;
     expected_resource_utilization =
       option_of_yojson
         (value_for_key resource_utilization_of_yojson "ExpectedResourceUtilization")
         _list path;
     platform_differences =
       option_of_yojson
         (value_for_key platform_differences_of_yojson "PlatformDifferences")
         _list path;
   }
    : target_instance)

let target_instances_list_of_yojson tree path = list_of_yojson target_instance_of_yojson tree path

let modify_recommendation_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_instances =
       option_of_yojson (value_for_key target_instances_list_of_yojson "TargetInstances") _list path;
   }
    : modify_recommendation_detail)

let rightsizing_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATE" -> TERMINATE
    | `String "MODIFY" -> MODIFY
    | `String value -> raise (deserialize_unknown_enum_value_error path "RightsizingType" value)
    | _ -> raise (deserialize_wrong_type_error path "RightsizingType")
     : rightsizing_type)
    : rightsizing_type)

let tag_values_list_of_yojson tree path = list_of_yojson tag_values_of_yojson tree path

let current_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = option_of_yojson (value_for_key generic_string_of_yojson "ResourceId") _list path;
     instance_name =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceName") _list path;
     tags = option_of_yojson (value_for_key tag_values_list_of_yojson "Tags") _list path;
     resource_details =
       option_of_yojson (value_for_key resource_details_of_yojson "ResourceDetails") _list path;
     resource_utilization =
       option_of_yojson
         (value_for_key resource_utilization_of_yojson "ResourceUtilization")
         _list path;
     reservation_covered_hours_in_lookback_period =
       option_of_yojson
         (value_for_key generic_string_of_yojson "ReservationCoveredHoursInLookbackPeriod")
         _list path;
     savings_plans_covered_hours_in_lookback_period =
       option_of_yojson
         (value_for_key generic_string_of_yojson "SavingsPlansCoveredHoursInLookbackPeriod")
         _list path;
     on_demand_hours_in_lookback_period =
       option_of_yojson
         (value_for_key generic_string_of_yojson "OnDemandHoursInLookbackPeriod")
         _list path;
     total_running_hours_in_lookback_period =
       option_of_yojson
         (value_for_key generic_string_of_yojson "TotalRunningHoursInLookbackPeriod")
         _list path;
     monthly_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "MonthlyCost") _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
   }
    : current_instance)

let rightsizing_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key generic_string_of_yojson "AccountId") _list path;
     current_instance =
       option_of_yojson (value_for_key current_instance_of_yojson "CurrentInstance") _list path;
     rightsizing_type =
       option_of_yojson (value_for_key rightsizing_type_of_yojson "RightsizingType") _list path;
     modify_recommendation_detail =
       option_of_yojson
         (value_for_key modify_recommendation_detail_of_yojson "ModifyRecommendationDetail")
         _list path;
     terminate_recommendation_detail =
       option_of_yojson
         (value_for_key terminate_recommendation_detail_of_yojson "TerminateRecommendationDetail")
         _list path;
     finding_reason_codes =
       option_of_yojson
         (value_for_key finding_reason_codes_of_yojson "FindingReasonCodes")
         _list path;
   }
    : rightsizing_recommendation)

let rightsizing_recommendation_list_of_yojson tree path =
  list_of_yojson rightsizing_recommendation_of_yojson tree path

let rightsizing_recommendation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_recommendation_count =
       option_of_yojson
         (value_for_key generic_string_of_yojson "TotalRecommendationCount")
         _list path;
     estimated_total_monthly_savings_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedTotalMonthlySavingsAmount")
         _list path;
     savings_currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "SavingsCurrencyCode") _list path;
     savings_percentage =
       option_of_yojson (value_for_key generic_string_of_yojson "SavingsPercentage") _list path;
   }
    : rightsizing_recommendation_summary)

let rightsizing_recommendation_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson (value_for_key generic_string_of_yojson "RecommendationId") _list path;
     generation_timestamp =
       option_of_yojson (value_for_key generic_string_of_yojson "GenerationTimestamp") _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key lookback_period_in_days_of_yojson "LookbackPeriodInDays")
         _list path;
     additional_metadata =
       option_of_yojson (value_for_key generic_string_of_yojson "AdditionalMetadata") _list path;
   }
    : rightsizing_recommendation_metadata)

let get_rightsizing_recommendation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata =
       option_of_yojson
         (value_for_key rightsizing_recommendation_metadata_of_yojson "Metadata")
         _list path;
     summary =
       option_of_yojson
         (value_for_key rightsizing_recommendation_summary_of_yojson "Summary")
         _list path;
     rightsizing_recommendations =
       option_of_yojson
         (value_for_key rightsizing_recommendation_list_of_yojson "RightsizingRecommendations")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     configuration =
       option_of_yojson
         (value_for_key rightsizing_recommendation_configuration_of_yojson "Configuration")
         _list path;
   }
    : get_rightsizing_recommendation_response)

let get_rightsizing_recommendation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     configuration =
       option_of_yojson
         (value_for_key rightsizing_recommendation_configuration_of_yojson "Configuration")
         _list path;
     service = value_for_key generic_string_of_yojson "Service" _list path;
     page_size =
       option_of_yojson (value_for_key recommendations_page_size_of_yojson "PageSize") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_rightsizing_recommendation_request)

let unrealized_savings_of_yojson = string_of_yojson
let realized_savings_of_yojson = string_of_yojson
let ri_cost_for_unused_hours_of_yojson = string_of_yojson
let total_amortized_fee_of_yojson = string_of_yojson
let amortized_recurring_fee_of_yojson = string_of_yojson
let amortized_upfront_fee_of_yojson = string_of_yojson
let total_potential_ri_savings_of_yojson = string_of_yojson
let net_ri_savings_of_yojson = string_of_yojson
let on_demand_cost_of_ri_hours_used_of_yojson = string_of_yojson
let unused_units_of_yojson = string_of_yojson
let unused_hours_of_yojson = string_of_yojson
let total_actual_units_of_yojson = string_of_yojson
let total_actual_hours_of_yojson = string_of_yojson
let purchased_units_of_yojson = string_of_yojson
let purchased_hours_of_yojson = string_of_yojson
let utilization_percentage_in_units_of_yojson = string_of_yojson
let utilization_percentage_of_yojson = string_of_yojson

let reservation_aggregates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     utilization_percentage =
       option_of_yojson
         (value_for_key utilization_percentage_of_yojson "UtilizationPercentage")
         _list path;
     utilization_percentage_in_units =
       option_of_yojson
         (value_for_key utilization_percentage_in_units_of_yojson "UtilizationPercentageInUnits")
         _list path;
     purchased_hours =
       option_of_yojson (value_for_key purchased_hours_of_yojson "PurchasedHours") _list path;
     purchased_units =
       option_of_yojson (value_for_key purchased_units_of_yojson "PurchasedUnits") _list path;
     total_actual_hours =
       option_of_yojson (value_for_key total_actual_hours_of_yojson "TotalActualHours") _list path;
     total_actual_units =
       option_of_yojson (value_for_key total_actual_units_of_yojson "TotalActualUnits") _list path;
     unused_hours = option_of_yojson (value_for_key unused_hours_of_yojson "UnusedHours") _list path;
     unused_units = option_of_yojson (value_for_key unused_units_of_yojson "UnusedUnits") _list path;
     on_demand_cost_of_ri_hours_used =
       option_of_yojson
         (value_for_key on_demand_cost_of_ri_hours_used_of_yojson "OnDemandCostOfRIHoursUsed")
         _list path;
     net_ri_savings =
       option_of_yojson (value_for_key net_ri_savings_of_yojson "NetRISavings") _list path;
     total_potential_ri_savings =
       option_of_yojson
         (value_for_key total_potential_ri_savings_of_yojson "TotalPotentialRISavings")
         _list path;
     amortized_upfront_fee =
       option_of_yojson
         (value_for_key amortized_upfront_fee_of_yojson "AmortizedUpfrontFee")
         _list path;
     amortized_recurring_fee =
       option_of_yojson
         (value_for_key amortized_recurring_fee_of_yojson "AmortizedRecurringFee")
         _list path;
     total_amortized_fee =
       option_of_yojson (value_for_key total_amortized_fee_of_yojson "TotalAmortizedFee") _list path;
     ri_cost_for_unused_hours =
       option_of_yojson
         (value_for_key ri_cost_for_unused_hours_of_yojson "RICostForUnusedHours")
         _list path;
     realized_savings =
       option_of_yojson (value_for_key realized_savings_of_yojson "RealizedSavings") _list path;
     unrealized_savings =
       option_of_yojson (value_for_key unrealized_savings_of_yojson "UnrealizedSavings") _list path;
   }
    : reservation_aggregates)

let reservation_group_value_of_yojson = string_of_yojson
let reservation_group_key_of_yojson = string_of_yojson

let reservation_utilization_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key reservation_group_key_of_yojson "Key") _list path;
     value = option_of_yojson (value_for_key reservation_group_value_of_yojson "Value") _list path;
     attributes = option_of_yojson (value_for_key attributes_of_yojson "Attributes") _list path;
     utilization =
       option_of_yojson (value_for_key reservation_aggregates_of_yojson "Utilization") _list path;
   }
    : reservation_utilization_group)

let reservation_utilization_groups_of_yojson tree path =
  list_of_yojson reservation_utilization_group_of_yojson tree path

let utilization_by_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = option_of_yojson (value_for_key date_interval_of_yojson "TimePeriod") _list path;
     groups =
       option_of_yojson (value_for_key reservation_utilization_groups_of_yojson "Groups") _list path;
     total = option_of_yojson (value_for_key reservation_aggregates_of_yojson "Total") _list path;
   }
    : utilization_by_time)

let utilizations_by_time_of_yojson tree path =
  list_of_yojson utilization_by_time_of_yojson tree path

let get_reservation_utilization_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     utilizations_by_time =
       value_for_key utilizations_by_time_of_yojson "UtilizationsByTime" _list path;
     total = option_of_yojson (value_for_key reservation_aggregates_of_yojson "Total") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_reservation_utilization_response)

let get_reservation_utilization_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "GroupBy") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "Granularity") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     sort_by = option_of_yojson (value_for_key sort_definition_of_yojson "SortBy") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : get_reservation_utilization_request)

let reservation_purchase_recommendation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_estimated_monthly_savings_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "TotalEstimatedMonthlySavingsAmount")
         _list path;
     total_estimated_monthly_savings_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "TotalEstimatedMonthlySavingsPercentage")
         _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
   }
    : reservation_purchase_recommendation_summary)

let dynamo_db_capacity_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_units =
       option_of_yojson (value_for_key generic_string_of_yojson "CapacityUnits") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
   }
    : dynamo_db_capacity_details)

let reserved_capacity_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dynamo_db_capacity_details =
       option_of_yojson
         (value_for_key dynamo_db_capacity_details_of_yojson "DynamoDBCapacityDetails")
         _list path;
   }
    : reserved_capacity_details)

let memory_db_instance_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family = option_of_yojson (value_for_key generic_string_of_yojson "Family") _list path;
     node_type = option_of_yojson (value_for_key generic_string_of_yojson "NodeType") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     current_generation =
       option_of_yojson (value_for_key generic_boolean_of_yojson "CurrentGeneration") _list path;
     size_flex_eligible =
       option_of_yojson (value_for_key generic_boolean_of_yojson "SizeFlexEligible") _list path;
   }
    : memory_db_instance_details)

let es_instance_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_class =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceClass") _list path;
     instance_size =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceSize") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     current_generation =
       option_of_yojson (value_for_key generic_boolean_of_yojson "CurrentGeneration") _list path;
     size_flex_eligible =
       option_of_yojson (value_for_key generic_boolean_of_yojson "SizeFlexEligible") _list path;
   }
    : es_instance_details)

let elasti_cache_instance_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family = option_of_yojson (value_for_key generic_string_of_yojson "Family") _list path;
     node_type = option_of_yojson (value_for_key generic_string_of_yojson "NodeType") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     product_description =
       option_of_yojson (value_for_key generic_string_of_yojson "ProductDescription") _list path;
     current_generation =
       option_of_yojson (value_for_key generic_boolean_of_yojson "CurrentGeneration") _list path;
     size_flex_eligible =
       option_of_yojson (value_for_key generic_boolean_of_yojson "SizeFlexEligible") _list path;
   }
    : elasti_cache_instance_details)

let redshift_instance_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family = option_of_yojson (value_for_key generic_string_of_yojson "Family") _list path;
     node_type = option_of_yojson (value_for_key generic_string_of_yojson "NodeType") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     current_generation =
       option_of_yojson (value_for_key generic_boolean_of_yojson "CurrentGeneration") _list path;
     size_flex_eligible =
       option_of_yojson (value_for_key generic_boolean_of_yojson "SizeFlexEligible") _list path;
   }
    : redshift_instance_details)

let rds_instance_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family = option_of_yojson (value_for_key generic_string_of_yojson "Family") _list path;
     instance_type =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceType") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     database_engine =
       option_of_yojson (value_for_key generic_string_of_yojson "DatabaseEngine") _list path;
     database_edition =
       option_of_yojson (value_for_key generic_string_of_yojson "DatabaseEdition") _list path;
     deployment_option =
       option_of_yojson (value_for_key generic_string_of_yojson "DeploymentOption") _list path;
     license_model =
       option_of_yojson (value_for_key generic_string_of_yojson "LicenseModel") _list path;
     current_generation =
       option_of_yojson (value_for_key generic_boolean_of_yojson "CurrentGeneration") _list path;
     size_flex_eligible =
       option_of_yojson (value_for_key generic_boolean_of_yojson "SizeFlexEligible") _list path;
     deployment_model =
       option_of_yojson (value_for_key generic_string_of_yojson "DeploymentModel") _list path;
   }
    : rds_instance_details)

let ec2_instance_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     family = option_of_yojson (value_for_key generic_string_of_yojson "Family") _list path;
     instance_type =
       option_of_yojson (value_for_key generic_string_of_yojson "InstanceType") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     availability_zone =
       option_of_yojson (value_for_key generic_string_of_yojson "AvailabilityZone") _list path;
     platform = option_of_yojson (value_for_key generic_string_of_yojson "Platform") _list path;
     tenancy = option_of_yojson (value_for_key generic_string_of_yojson "Tenancy") _list path;
     current_generation =
       option_of_yojson (value_for_key generic_boolean_of_yojson "CurrentGeneration") _list path;
     size_flex_eligible =
       option_of_yojson (value_for_key generic_boolean_of_yojson "SizeFlexEligible") _list path;
   }
    : ec2_instance_details)

let instance_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_instance_details =
       option_of_yojson
         (value_for_key ec2_instance_details_of_yojson "EC2InstanceDetails")
         _list path;
     rds_instance_details =
       option_of_yojson
         (value_for_key rds_instance_details_of_yojson "RDSInstanceDetails")
         _list path;
     redshift_instance_details =
       option_of_yojson
         (value_for_key redshift_instance_details_of_yojson "RedshiftInstanceDetails")
         _list path;
     elasti_cache_instance_details =
       option_of_yojson
         (value_for_key elasti_cache_instance_details_of_yojson "ElastiCacheInstanceDetails")
         _list path;
     es_instance_details =
       option_of_yojson (value_for_key es_instance_details_of_yojson "ESInstanceDetails") _list path;
     memory_db_instance_details =
       option_of_yojson
         (value_for_key memory_db_instance_details_of_yojson "MemoryDBInstanceDetails")
         _list path;
   }
    : instance_details)

let reservation_purchase_recommendation_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key generic_string_of_yojson "AccountId") _list path;
     instance_details =
       option_of_yojson (value_for_key instance_details_of_yojson "InstanceDetails") _list path;
     recommended_number_of_instances_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "RecommendedNumberOfInstancesToPurchase")
         _list path;
     recommended_normalized_units_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "RecommendedNormalizedUnitsToPurchase")
         _list path;
     minimum_number_of_instances_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MinimumNumberOfInstancesUsedPerHour")
         _list path;
     minimum_normalized_units_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MinimumNormalizedUnitsUsedPerHour")
         _list path;
     maximum_number_of_instances_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MaximumNumberOfInstancesUsedPerHour")
         _list path;
     maximum_normalized_units_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MaximumNormalizedUnitsUsedPerHour")
         _list path;
     average_number_of_instances_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "AverageNumberOfInstancesUsedPerHour")
         _list path;
     average_normalized_units_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "AverageNormalizedUnitsUsedPerHour")
         _list path;
     average_utilization =
       option_of_yojson (value_for_key generic_string_of_yojson "AverageUtilization") _list path;
     estimated_break_even_in_months =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedBreakEvenInMonths")
         _list path;
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
     estimated_monthly_savings_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavingsAmount")
         _list path;
     estimated_monthly_savings_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavingsPercentage")
         _list path;
     estimated_monthly_on_demand_cost =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlyOnDemandCost")
         _list path;
     estimated_reservation_cost_for_lookback_period =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedReservationCostForLookbackPeriod")
         _list path;
     upfront_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "UpfrontCost") _list path;
     recurring_standard_monthly_cost =
       option_of_yojson
         (value_for_key generic_string_of_yojson "RecurringStandardMonthlyCost")
         _list path;
     reserved_capacity_details =
       option_of_yojson
         (value_for_key reserved_capacity_details_of_yojson "ReservedCapacityDetails")
         _list path;
     recommended_number_of_capacity_units_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "RecommendedNumberOfCapacityUnitsToPurchase")
         _list path;
     minimum_number_of_capacity_units_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MinimumNumberOfCapacityUnitsUsedPerHour")
         _list path;
     maximum_number_of_capacity_units_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "MaximumNumberOfCapacityUnitsUsedPerHour")
         _list path;
     average_number_of_capacity_units_used_per_hour =
       option_of_yojson
         (value_for_key generic_string_of_yojson "AverageNumberOfCapacityUnitsUsedPerHour")
         _list path;
   }
    : reservation_purchase_recommendation_detail)

let reservation_purchase_recommendation_details_of_yojson tree path =
  list_of_yojson reservation_purchase_recommendation_detail_of_yojson tree path

let offering_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "CONVERTIBLE" -> CONVERTIBLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OfferingClass" value)
    | _ -> raise (deserialize_wrong_type_error path "OfferingClass")
     : offering_class)
    : offering_class)

let ec2_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offering_class =
       option_of_yojson (value_for_key offering_class_of_yojson "OfferingClass") _list path;
   }
    : ec2_specification)

let service_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_specification =
       option_of_yojson (value_for_key ec2_specification_of_yojson "EC2Specification") _list path;
   }
    : service_specification)

let reservation_purchase_recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_scope =
       option_of_yojson (value_for_key account_scope_of_yojson "AccountScope") _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key lookback_period_in_days_of_yojson "LookbackPeriodInDays")
         _list path;
     term_in_years =
       option_of_yojson (value_for_key term_in_years_of_yojson "TermInYears") _list path;
     payment_option =
       option_of_yojson (value_for_key payment_option_of_yojson "PaymentOption") _list path;
     service_specification =
       option_of_yojson
         (value_for_key service_specification_of_yojson "ServiceSpecification")
         _list path;
     recommendation_details =
       option_of_yojson
         (value_for_key reservation_purchase_recommendation_details_of_yojson
            "RecommendationDetails")
         _list path;
     recommendation_summary =
       option_of_yojson
         (value_for_key reservation_purchase_recommendation_summary_of_yojson
            "RecommendationSummary")
         _list path;
   }
    : reservation_purchase_recommendation)

let reservation_purchase_recommendations_of_yojson tree path =
  list_of_yojson reservation_purchase_recommendation_of_yojson tree path

let reservation_purchase_recommendation_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson (value_for_key generic_string_of_yojson "RecommendationId") _list path;
     generation_timestamp =
       option_of_yojson (value_for_key generic_string_of_yojson "GenerationTimestamp") _list path;
     additional_metadata =
       option_of_yojson (value_for_key generic_string_of_yojson "AdditionalMetadata") _list path;
   }
    : reservation_purchase_recommendation_metadata)

let get_reservation_purchase_recommendation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata =
       option_of_yojson
         (value_for_key reservation_purchase_recommendation_metadata_of_yojson "Metadata")
         _list path;
     recommendations =
       option_of_yojson
         (value_for_key reservation_purchase_recommendations_of_yojson "Recommendations")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_reservation_purchase_recommendation_response)

let get_reservation_purchase_recommendation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key generic_string_of_yojson "AccountId") _list path;
     service = value_for_key generic_string_of_yojson "Service" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     account_scope =
       option_of_yojson (value_for_key account_scope_of_yojson "AccountScope") _list path;
     lookback_period_in_days =
       option_of_yojson
         (value_for_key lookback_period_in_days_of_yojson "LookbackPeriodInDays")
         _list path;
     term_in_years =
       option_of_yojson (value_for_key term_in_years_of_yojson "TermInYears") _list path;
     payment_option =
       option_of_yojson (value_for_key payment_option_of_yojson "PaymentOption") _list path;
     service_specification =
       option_of_yojson
         (value_for_key service_specification_of_yojson "ServiceSpecification")
         _list path;
     page_size =
       option_of_yojson (value_for_key recommendations_page_size_of_yojson "PageSize") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_reservation_purchase_recommendation_request)

let on_demand_cost_of_yojson = string_of_yojson

let coverage_cost_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_cost =
       option_of_yojson (value_for_key on_demand_cost_of_yojson "OnDemandCost") _list path;
   }
    : coverage_cost)

let coverage_normalized_units_percentage_of_yojson = string_of_yojson
let total_running_normalized_units_of_yojson = string_of_yojson
let reserved_normalized_units_of_yojson = string_of_yojson
let on_demand_normalized_units_of_yojson = string_of_yojson

let coverage_normalized_units_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_normalized_units =
       option_of_yojson
         (value_for_key on_demand_normalized_units_of_yojson "OnDemandNormalizedUnits")
         _list path;
     reserved_normalized_units =
       option_of_yojson
         (value_for_key reserved_normalized_units_of_yojson "ReservedNormalizedUnits")
         _list path;
     total_running_normalized_units =
       option_of_yojson
         (value_for_key total_running_normalized_units_of_yojson "TotalRunningNormalizedUnits")
         _list path;
     coverage_normalized_units_percentage =
       option_of_yojson
         (value_for_key coverage_normalized_units_percentage_of_yojson
            "CoverageNormalizedUnitsPercentage")
         _list path;
   }
    : coverage_normalized_units)

let coverage_hours_percentage_of_yojson = string_of_yojson
let total_running_hours_of_yojson = string_of_yojson
let reserved_hours_of_yojson = string_of_yojson
let on_demand_hours_of_yojson = string_of_yojson

let coverage_hours_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     on_demand_hours =
       option_of_yojson (value_for_key on_demand_hours_of_yojson "OnDemandHours") _list path;
     reserved_hours =
       option_of_yojson (value_for_key reserved_hours_of_yojson "ReservedHours") _list path;
     total_running_hours =
       option_of_yojson (value_for_key total_running_hours_of_yojson "TotalRunningHours") _list path;
     coverage_hours_percentage =
       option_of_yojson
         (value_for_key coverage_hours_percentage_of_yojson "CoverageHoursPercentage")
         _list path;
   }
    : coverage_hours)

let coverage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     coverage_hours =
       option_of_yojson (value_for_key coverage_hours_of_yojson "CoverageHours") _list path;
     coverage_normalized_units =
       option_of_yojson
         (value_for_key coverage_normalized_units_of_yojson "CoverageNormalizedUnits")
         _list path;
     coverage_cost =
       option_of_yojson (value_for_key coverage_cost_of_yojson "CoverageCost") _list path;
   }
    : coverage)

let reservation_coverage_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attributes_of_yojson "Attributes") _list path;
     coverage = option_of_yojson (value_for_key coverage_of_yojson "Coverage") _list path;
   }
    : reservation_coverage_group)

let reservation_coverage_groups_of_yojson tree path =
  list_of_yojson reservation_coverage_group_of_yojson tree path

let coverage_by_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = option_of_yojson (value_for_key date_interval_of_yojson "TimePeriod") _list path;
     groups =
       option_of_yojson (value_for_key reservation_coverage_groups_of_yojson "Groups") _list path;
     total = option_of_yojson (value_for_key coverage_of_yojson "Total") _list path;
   }
    : coverage_by_time)

let coverages_by_time_of_yojson tree path = list_of_yojson coverage_by_time_of_yojson tree path

let get_reservation_coverage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     coverages_by_time = value_for_key coverages_by_time_of_yojson "CoveragesByTime" _list path;
     total = option_of_yojson (value_for_key coverage_of_yojson "Total") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_reservation_coverage_response)

let get_reservation_coverage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "GroupBy") _list path;
     granularity = option_of_yojson (value_for_key granularity_of_yojson "Granularity") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     metrics = option_of_yojson (value_for_key metric_names_of_yojson "Metrics") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     sort_by = option_of_yojson (value_for_key sort_definition_of_yojson "SortBy") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : get_reservation_coverage_request)

let dimension_values_with_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key value_of_yojson "Value") _list path;
     attributes = option_of_yojson (value_for_key attributes_of_yojson "Attributes") _list path;
   }
    : dimension_values_with_attributes)

let dimension_values_with_attributes_list_of_yojson tree path =
  list_of_yojson dimension_values_with_attributes_of_yojson tree path

let get_dimension_values_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_values =
       value_for_key dimension_values_with_attributes_list_of_yojson "DimensionValues" _list path;
     return_size = value_for_key page_size_of_yojson "ReturnSize" _list path;
     total_size = value_for_key page_size_of_yojson "TotalSize" _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_dimension_values_response)

let context_of_yojson (tree : t) path =
  ((match tree with
    | `String "COST_AND_USAGE" -> COST_AND_USAGE
    | `String "RESERVATIONS" -> RESERVATIONS
    | `String "SAVINGS_PLANS" -> SAVINGS_PLANS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Context" value)
    | _ -> raise (deserialize_wrong_type_error path "Context")
     : context)
    : context)

let get_dimension_values_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     search_string =
       option_of_yojson (value_for_key search_string_of_yojson "SearchString") _list path;
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     dimension = value_for_key dimension_of_yojson "Dimension" _list path;
     context = option_of_yojson (value_for_key context_of_yojson "Context") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     sort_by = option_of_yojson (value_for_key sort_definitions_of_yojson "SortBy") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_dimension_values_request)

let get_cost_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total = option_of_yojson (value_for_key metric_value_of_yojson "Total") _list path;
     forecast_results_by_time =
       option_of_yojson
         (value_for_key forecast_results_by_time_of_yojson "ForecastResultsByTime")
         _list path;
   }
    : get_cost_forecast_response)

let get_cost_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     metric = value_for_key metric_of_yojson "Metric" _list path;
     granularity = value_for_key granularity_of_yojson "Granularity" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     prediction_interval_level =
       option_of_yojson
         (value_for_key prediction_interval_level_of_yojson "PredictionIntervalLevel")
         _list path;
   }
    : get_cost_forecast_request)

let comparison_metric_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_time_period_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "BaselineTimePeriodAmount")
         _list path;
     comparison_time_period_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "ComparisonTimePeriodAmount")
         _list path;
     difference = option_of_yojson (value_for_key generic_string_of_yojson "Difference") _list path;
     unit_ = option_of_yojson (value_for_key generic_string_of_yojson "Unit") _list path;
   }
    : comparison_metric_value)

let comparison_metrics_of_yojson tree path =
  map_of_yojson metric_name_of_yojson comparison_metric_value_of_yojson tree path

let cost_driver_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key generic_string_of_yojson "Type") _list path;
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
     metrics = option_of_yojson (value_for_key comparison_metrics_of_yojson "Metrics") _list path;
   }
    : cost_driver)

let cost_drivers_of_yojson tree path = list_of_yojson cost_driver_of_yojson tree path

let cost_comparison_driver_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_selector = option_of_yojson (value_for_key expression_of_yojson "CostSelector") _list path;
     metrics = option_of_yojson (value_for_key comparison_metrics_of_yojson "Metrics") _list path;
     cost_drivers = option_of_yojson (value_for_key cost_drivers_of_yojson "CostDrivers") _list path;
   }
    : cost_comparison_driver)

let cost_comparison_drivers_of_yojson tree path =
  list_of_yojson cost_comparison_driver_of_yojson tree path

let get_cost_comparison_drivers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_comparison_drivers =
       option_of_yojson
         (value_for_key cost_comparison_drivers_of_yojson "CostComparisonDrivers")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_cost_comparison_drivers_response)

let cost_comparison_drivers_max_results_of_yojson = int_of_yojson

let get_cost_comparison_drivers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     baseline_time_period = value_for_key date_interval_of_yojson "BaselineTimePeriod" _list path;
     comparison_time_period =
       value_for_key date_interval_of_yojson "ComparisonTimePeriod" _list path;
     metric_for_comparison = value_for_key metric_name_of_yojson "MetricForComparison" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "GroupBy") _list path;
     max_results =
       option_of_yojson
         (value_for_key cost_comparison_drivers_max_results_of_yojson "MaxResults")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_cost_comparison_drivers_request)

let cost_category_names_list_of_yojson tree path =
  list_of_yojson cost_category_name_of_yojson tree path

let get_cost_categories_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     cost_category_names =
       option_of_yojson
         (value_for_key cost_category_names_list_of_yojson "CostCategoryNames")
         _list path;
     cost_category_values =
       option_of_yojson
         (value_for_key cost_category_values_list_of_yojson "CostCategoryValues")
         _list path;
     return_size = value_for_key page_size_of_yojson "ReturnSize" _list path;
     total_size = value_for_key page_size_of_yojson "TotalSize" _list path;
   }
    : get_cost_categories_response)

let get_cost_categories_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     search_string =
       option_of_yojson (value_for_key search_string_of_yojson "SearchString") _list path;
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     cost_category_name =
       option_of_yojson (value_for_key cost_category_name_of_yojson "CostCategoryName") _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     sort_by = option_of_yojson (value_for_key sort_definitions_of_yojson "SortBy") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_cost_categories_request)

let estimated_of_yojson = bool_of_yojson

let metrics_of_yojson tree path =
  map_of_yojson metric_name_of_yojson metric_value_of_yojson tree path

let key_of_yojson = string_of_yojson
let keys_of_yojson tree path = list_of_yojson key_of_yojson tree path

let group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keys = option_of_yojson (value_for_key keys_of_yojson "Keys") _list path;
     metrics = option_of_yojson (value_for_key metrics_of_yojson "Metrics") _list path;
   }
    : group)

let groups_of_yojson tree path = list_of_yojson group_of_yojson tree path

let result_by_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = option_of_yojson (value_for_key date_interval_of_yojson "TimePeriod") _list path;
     total = option_of_yojson (value_for_key metrics_of_yojson "Total") _list path;
     groups = option_of_yojson (value_for_key groups_of_yojson "Groups") _list path;
     estimated = option_of_yojson (value_for_key estimated_of_yojson "Estimated") _list path;
   }
    : result_by_time)

let results_by_time_of_yojson tree path = list_of_yojson result_by_time_of_yojson tree path

let get_cost_and_usage_with_resources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     group_definitions =
       option_of_yojson (value_for_key group_definitions_of_yojson "GroupDefinitions") _list path;
     results_by_time =
       option_of_yojson (value_for_key results_by_time_of_yojson "ResultsByTime") _list path;
     dimension_value_attributes =
       option_of_yojson
         (value_for_key dimension_values_with_attributes_list_of_yojson "DimensionValueAttributes")
         _list path;
   }
    : get_cost_and_usage_with_resources_response)

let get_cost_and_usage_with_resources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     granularity = value_for_key granularity_of_yojson "Granularity" _list path;
     filter = value_for_key expression_of_yojson "Filter" _list path;
     metrics = option_of_yojson (value_for_key metric_names_of_yojson "Metrics") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "GroupBy") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_cost_and_usage_with_resources_request)

let cost_and_usage_comparison_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_and_usage_selector =
       option_of_yojson (value_for_key expression_of_yojson "CostAndUsageSelector") _list path;
     metrics = option_of_yojson (value_for_key comparison_metrics_of_yojson "Metrics") _list path;
   }
    : cost_and_usage_comparison)

let cost_and_usage_comparisons_of_yojson tree path =
  list_of_yojson cost_and_usage_comparison_of_yojson tree path

let get_cost_and_usage_comparisons_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_and_usage_comparisons =
       option_of_yojson
         (value_for_key cost_and_usage_comparisons_of_yojson "CostAndUsageComparisons")
         _list path;
     total_cost_and_usage =
       option_of_yojson (value_for_key comparison_metrics_of_yojson "TotalCostAndUsage") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_cost_and_usage_comparisons_response)

let cost_and_usage_comparisons_max_results_of_yojson = int_of_yojson

let get_cost_and_usage_comparisons_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     baseline_time_period = value_for_key date_interval_of_yojson "BaselineTimePeriod" _list path;
     comparison_time_period =
       value_for_key date_interval_of_yojson "ComparisonTimePeriod" _list path;
     metric_for_comparison = value_for_key metric_name_of_yojson "MetricForComparison" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "GroupBy") _list path;
     max_results =
       option_of_yojson
         (value_for_key cost_and_usage_comparisons_max_results_of_yojson "MaxResults")
         _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_cost_and_usage_comparisons_request)

let get_cost_and_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     group_definitions =
       option_of_yojson (value_for_key group_definitions_of_yojson "GroupDefinitions") _list path;
     results_by_time =
       option_of_yojson (value_for_key results_by_time_of_yojson "ResultsByTime") _list path;
     dimension_value_attributes =
       option_of_yojson
         (value_for_key dimension_values_with_attributes_list_of_yojson "DimensionValueAttributes")
         _list path;
   }
    : get_cost_and_usage_response)

let get_cost_and_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_period = value_for_key date_interval_of_yojson "TimePeriod" _list path;
     granularity = value_for_key granularity_of_yojson "Granularity" _list path;
     filter = option_of_yojson (value_for_key expression_of_yojson "Filter") _list path;
     metrics = value_for_key metric_names_of_yojson "Metrics" _list path;
     group_by = option_of_yojson (value_for_key group_definitions_of_yojson "GroupBy") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_cost_and_usage_request)

let analysis_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : analysis_not_found_exception)

let savings_plans_purchase_analysis_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency_code =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrencyCode") _list path;
     lookback_period_in_hours =
       option_of_yojson (value_for_key generic_string_of_yojson "LookbackPeriodInHours") _list path;
     current_average_coverage =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrentAverageCoverage") _list path;
     current_average_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentAverageHourlyOnDemandSpend")
         _list path;
     current_maximum_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentMaximumHourlyOnDemandSpend")
         _list path;
     current_minimum_hourly_on_demand_spend =
       option_of_yojson
         (value_for_key generic_string_of_yojson "CurrentMinimumHourlyOnDemandSpend")
         _list path;
     current_on_demand_spend =
       option_of_yojson (value_for_key generic_string_of_yojson "CurrentOnDemandSpend") _list path;
     existing_hourly_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "ExistingHourlyCommitment")
         _list path;
     hourly_commitment_to_purchase =
       option_of_yojson
         (value_for_key generic_string_of_yojson "HourlyCommitmentToPurchase")
         _list path;
     estimated_average_coverage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedAverageCoverage")
         _list path;
     estimated_average_utilization =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedAverageUtilization")
         _list path;
     estimated_monthly_savings_amount =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedMonthlySavingsAmount")
         _list path;
     estimated_on_demand_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedOnDemandCost") _list path;
     estimated_on_demand_cost_with_current_commitment =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedOnDemandCostWithCurrentCommitment")
         _list path;
     estimated_ro_i =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedROI") _list path;
     estimated_savings_amount =
       option_of_yojson (value_for_key generic_string_of_yojson "EstimatedSavingsAmount") _list path;
     estimated_savings_percentage =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedSavingsPercentage")
         _list path;
     estimated_commitment_cost =
       option_of_yojson
         (value_for_key generic_string_of_yojson "EstimatedCommitmentCost")
         _list path;
     latest_usage_timestamp =
       option_of_yojson (value_for_key generic_string_of_yojson "LatestUsageTimestamp") _list path;
     upfront_cost =
       option_of_yojson (value_for_key generic_string_of_yojson "UpfrontCost") _list path;
     additional_metadata =
       option_of_yojson (value_for_key generic_string_of_yojson "AdditionalMetadata") _list path;
     metrics_over_lookback_period =
       option_of_yojson
         (value_for_key metrics_over_lookback_period_of_yojson "MetricsOverLookbackPeriod")
         _list path;
   }
    : savings_plans_purchase_analysis_details)

let analysis_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plans_purchase_analysis_details =
       option_of_yojson
         (value_for_key savings_plans_purchase_analysis_details_of_yojson
            "SavingsPlansPurchaseAnalysisDetails")
         _list path;
   }
    : analysis_details)

let get_commitment_purchase_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_completion_time =
       value_for_key zoned_date_time_of_yojson "EstimatedCompletionTime" _list path;
     analysis_completion_time =
       option_of_yojson
         (value_for_key zoned_date_time_of_yojson "AnalysisCompletionTime")
         _list path;
     analysis_started_time =
       value_for_key zoned_date_time_of_yojson "AnalysisStartedTime" _list path;
     analysis_id = value_for_key analysis_id_of_yojson "AnalysisId" _list path;
     analysis_status = value_for_key analysis_status_of_yojson "AnalysisStatus" _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     analysis_details =
       option_of_yojson (value_for_key analysis_details_of_yojson "AnalysisDetails") _list path;
     commitment_purchase_analysis_configuration =
       value_for_key commitment_purchase_analysis_configuration_of_yojson
         "CommitmentPurchaseAnalysisConfiguration" _list path;
   }
    : get_commitment_purchase_analysis_response)

let get_commitment_purchase_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ analysis_id = value_for_key analysis_id_of_yojson "AnalysisId" _list path }
    : get_commitment_purchase_analysis_request)

let non_negative_long_of_yojson = long_of_yojson

let approximate_usage_records_per_service_of_yojson tree path =
  map_of_yojson generic_string_of_yojson non_negative_long_of_yojson tree path

let get_approximate_usage_records_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     services =
       option_of_yojson
         (value_for_key approximate_usage_records_per_service_of_yojson "Services")
         _list path;
     total_records =
       option_of_yojson (value_for_key non_negative_long_of_yojson "TotalRecords") _list path;
     lookback_period =
       option_of_yojson (value_for_key date_interval_of_yojson "LookbackPeriod") _list path;
   }
    : get_approximate_usage_records_response)

let approximation_dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE" -> SERVICE
    | `String "RESOURCE" -> RESOURCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ApproximationDimension" value)
    | _ -> raise (deserialize_wrong_type_error path "ApproximationDimension")
     : approximation_dimension)
    : approximation_dimension)

let usage_services_of_yojson tree path = list_of_yojson generic_string_of_yojson tree path

let get_approximate_usage_records_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     granularity = value_for_key granularity_of_yojson "Granularity" _list path;
     services = option_of_yojson (value_for_key usage_services_of_yojson "Services") _list path;
     approximation_dimension =
       value_for_key approximation_dimension_of_yojson "ApproximationDimension" _list path;
   }
    : get_approximate_usage_records_request)

let anomaly_subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_arn =
       option_of_yojson (value_for_key generic_string_of_yojson "SubscriptionArn") _list path;
     account_id = option_of_yojson (value_for_key generic_string_of_yojson "AccountId") _list path;
     monitor_arn_list = value_for_key monitor_arn_list_of_yojson "MonitorArnList" _list path;
     subscribers = value_for_key subscribers_of_yojson "Subscribers" _list path;
     threshold =
       option_of_yojson
         (value_for_key nullable_non_negative_double_of_yojson "Threshold")
         _list path;
     frequency = value_for_key anomaly_subscription_frequency_of_yojson "Frequency" _list path;
     subscription_name = value_for_key generic_string_of_yojson "SubscriptionName" _list path;
     threshold_expression =
       option_of_yojson (value_for_key expression_of_yojson "ThresholdExpression") _list path;
   }
    : anomaly_subscription)

let anomaly_subscriptions_of_yojson tree path =
  list_of_yojson anomaly_subscription_of_yojson tree path

let get_anomaly_subscriptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_subscriptions =
       value_for_key anomaly_subscriptions_of_yojson "AnomalySubscriptions" _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_anomaly_subscriptions_response)

let get_anomaly_subscriptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_arn_list =
       option_of_yojson (value_for_key values_of_yojson "SubscriptionArnList") _list path;
     monitor_arn = option_of_yojson (value_for_key generic_string_of_yojson "MonitorArn") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : get_anomaly_subscriptions_request)

let monitor_dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE" -> SERVICE
    | `String "LINKED_ACCOUNT" -> LINKED_ACCOUNT
    | `String "TAG" -> TAG
    | `String "COST_CATEGORY" -> COST_CATEGORY
    | `String value -> raise (deserialize_unknown_enum_value_error path "MonitorDimension" value)
    | _ -> raise (deserialize_wrong_type_error path "MonitorDimension")
     : monitor_dimension)
    : monitor_dimension)

let monitor_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DIMENSIONAL" -> DIMENSIONAL
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "MonitorType" value)
    | _ -> raise (deserialize_wrong_type_error path "MonitorType")
     : monitor_type)
    : monitor_type)

let anomaly_monitor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_arn = option_of_yojson (value_for_key generic_string_of_yojson "MonitorArn") _list path;
     monitor_name = value_for_key generic_string_of_yojson "MonitorName" _list path;
     creation_date =
       option_of_yojson (value_for_key year_month_day_of_yojson "CreationDate") _list path;
     last_updated_date =
       option_of_yojson (value_for_key year_month_day_of_yojson "LastUpdatedDate") _list path;
     last_evaluated_date =
       option_of_yojson (value_for_key year_month_day_of_yojson "LastEvaluatedDate") _list path;
     monitor_type = value_for_key monitor_type_of_yojson "MonitorType" _list path;
     monitor_dimension =
       option_of_yojson (value_for_key monitor_dimension_of_yojson "MonitorDimension") _list path;
     monitor_specification =
       option_of_yojson (value_for_key expression_of_yojson "MonitorSpecification") _list path;
     dimensional_value_count =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "DimensionalValueCount")
         _list path;
   }
    : anomaly_monitor)

let anomaly_monitors_of_yojson tree path = list_of_yojson anomaly_monitor_of_yojson tree path

let get_anomaly_monitors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_monitors = value_for_key anomaly_monitors_of_yojson "AnomalyMonitors" _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_anomaly_monitors_response)

let get_anomaly_monitors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_arn_list =
       option_of_yojson (value_for_key values_of_yojson "MonitorArnList") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : get_anomaly_monitors_request)

let generic_double_of_yojson = double_of_yojson

let impact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_impact = value_for_key generic_double_of_yojson "MaxImpact" _list path;
     total_impact =
       option_of_yojson (value_for_key generic_double_of_yojson "TotalImpact") _list path;
     total_actual_spend =
       option_of_yojson
         (value_for_key nullable_non_negative_double_of_yojson "TotalActualSpend")
         _list path;
     total_expected_spend =
       option_of_yojson
         (value_for_key nullable_non_negative_double_of_yojson "TotalExpectedSpend")
         _list path;
     total_impact_percentage =
       option_of_yojson
         (value_for_key nullable_non_negative_double_of_yojson "TotalImpactPercentage")
         _list path;
   }
    : impact)

let anomaly_score_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_score = value_for_key generic_double_of_yojson "MaxScore" _list path;
     current_score = value_for_key generic_double_of_yojson "CurrentScore" _list path;
   }
    : anomaly_score)

let root_cause_impact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contribution = value_for_key generic_double_of_yojson "Contribution" _list path }
    : root_cause_impact)

let root_cause_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service = option_of_yojson (value_for_key generic_string_of_yojson "Service") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "Region") _list path;
     linked_account =
       option_of_yojson (value_for_key generic_string_of_yojson "LinkedAccount") _list path;
     linked_account_name =
       option_of_yojson (value_for_key generic_string_of_yojson "LinkedAccountName") _list path;
     usage_type = option_of_yojson (value_for_key generic_string_of_yojson "UsageType") _list path;
     impact = option_of_yojson (value_for_key root_cause_impact_of_yojson "Impact") _list path;
   }
    : root_cause)

let root_causes_of_yojson tree path = list_of_yojson root_cause_of_yojson tree path

let anomaly_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_id = value_for_key generic_string_of_yojson "AnomalyId" _list path;
     anomaly_start_date =
       option_of_yojson (value_for_key year_month_day_of_yojson "AnomalyStartDate") _list path;
     anomaly_end_date =
       option_of_yojson (value_for_key year_month_day_of_yojson "AnomalyEndDate") _list path;
     dimension_value =
       option_of_yojson (value_for_key generic_string_of_yojson "DimensionValue") _list path;
     root_causes = option_of_yojson (value_for_key root_causes_of_yojson "RootCauses") _list path;
     anomaly_score = value_for_key anomaly_score_of_yojson "AnomalyScore" _list path;
     impact = value_for_key impact_of_yojson "Impact" _list path;
     monitor_arn = value_for_key generic_string_of_yojson "MonitorArn" _list path;
     feedback =
       option_of_yojson (value_for_key anomaly_feedback_type_of_yojson "Feedback") _list path;
   }
    : anomaly)

let anomalies_of_yojson tree path = list_of_yojson anomaly_of_yojson tree path

let get_anomalies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomalies = value_for_key anomalies_of_yojson "Anomalies" _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
   }
    : get_anomalies_response)

let numeric_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUAL" -> EQUAL
    | `String "GREATER_THAN_OR_EQUAL" -> GREATER_THAN_OR_EQUAL
    | `String "LESS_THAN_OR_EQUAL" -> LESS_THAN_OR_EQUAL
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String "LESS_THAN" -> LESS_THAN
    | `String "BETWEEN" -> BETWEEN
    | `String value -> raise (deserialize_unknown_enum_value_error path "NumericOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "NumericOperator")
     : numeric_operator)
    : numeric_operator)

let total_impact_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     numeric_operator = value_for_key numeric_operator_of_yojson "NumericOperator" _list path;
     start_value = value_for_key generic_double_of_yojson "StartValue" _list path;
     end_value = option_of_yojson (value_for_key generic_double_of_yojson "EndValue") _list path;
   }
    : total_impact_filter)

let anomaly_date_interval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_date = value_for_key year_month_day_of_yojson "StartDate" _list path;
     end_date = option_of_yojson (value_for_key year_month_day_of_yojson "EndDate") _list path;
   }
    : anomaly_date_interval)

let get_anomalies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_arn = option_of_yojson (value_for_key generic_string_of_yojson "MonitorArn") _list path;
     date_interval = value_for_key anomaly_date_interval_of_yojson "DateInterval" _list path;
     feedback =
       option_of_yojson (value_for_key anomaly_feedback_type_of_yojson "Feedback") _list path;
     total_impact =
       option_of_yojson (value_for_key total_impact_filter_of_yojson "TotalImpact") _list path;
     next_page_token =
       option_of_yojson (value_for_key next_page_token_of_yojson "NextPageToken") _list path;
     max_results = option_of_yojson (value_for_key page_size_of_yojson "MaxResults") _list path;
   }
    : get_anomalies_request)

let cost_category_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = value_for_key arn_of_yojson "CostCategoryArn" _list path;
     effective_start = value_for_key zoned_date_time_of_yojson "EffectiveStart" _list path;
     effective_end =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveEnd") _list path;
     name = value_for_key cost_category_name_of_yojson "Name" _list path;
     rule_version = value_for_key cost_category_rule_version_of_yojson "RuleVersion" _list path;
     rules = value_for_key cost_category_rules_list_of_yojson "Rules" _list path;
     split_charge_rules =
       option_of_yojson
         (value_for_key cost_category_split_charge_rules_list_of_yojson "SplitChargeRules")
         _list path;
     processing_status =
       option_of_yojson
         (value_for_key cost_category_processing_status_list_of_yojson "ProcessingStatus")
         _list path;
     default_value =
       option_of_yojson (value_for_key cost_category_value_of_yojson "DefaultValue") _list path;
   }
    : cost_category)

let describe_cost_category_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category =
       option_of_yojson (value_for_key cost_category_of_yojson "CostCategory") _list path;
   }
    : describe_cost_category_definition_response)

let describe_cost_category_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = value_for_key arn_of_yojson "CostCategoryArn" _list path;
     effective_on =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveOn") _list path;
   }
    : describe_cost_category_definition_request)

let delete_cost_category_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = option_of_yojson (value_for_key arn_of_yojson "CostCategoryArn") _list path;
     effective_end =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveEnd") _list path;
   }
    : delete_cost_category_definition_response)

let delete_cost_category_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cost_category_arn = value_for_key arn_of_yojson "CostCategoryArn" _list path }
    : delete_cost_category_definition_request)

let delete_anomaly_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_anomaly_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ subscription_arn = value_for_key generic_string_of_yojson "SubscriptionArn" _list path }
    : delete_anomaly_subscription_request)

let delete_anomaly_monitor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_anomaly_monitor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monitor_arn = value_for_key generic_string_of_yojson "MonitorArn" _list path }
    : delete_anomaly_monitor_request)

let create_cost_category_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_arn = option_of_yojson (value_for_key arn_of_yojson "CostCategoryArn") _list path;
     effective_start =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveStart") _list path;
   }
    : create_cost_category_definition_response)

let create_cost_category_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key cost_category_name_of_yojson "Name" _list path;
     effective_start =
       option_of_yojson (value_for_key zoned_date_time_of_yojson "EffectiveStart") _list path;
     rule_version = value_for_key cost_category_rule_version_of_yojson "RuleVersion" _list path;
     rules = value_for_key cost_category_rules_list_of_yojson "Rules" _list path;
     default_value =
       option_of_yojson (value_for_key cost_category_value_of_yojson "DefaultValue") _list path;
     split_charge_rules =
       option_of_yojson
         (value_for_key cost_category_split_charge_rules_list_of_yojson "SplitChargeRules")
         _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : create_cost_category_definition_request)

let create_anomaly_subscription_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ subscription_arn = value_for_key generic_string_of_yojson "SubscriptionArn" _list path }
    : create_anomaly_subscription_response)

let create_anomaly_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_subscription =
       value_for_key anomaly_subscription_of_yojson "AnomalySubscription" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : create_anomaly_subscription_request)

let create_anomaly_monitor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monitor_arn = value_for_key generic_string_of_yojson "MonitorArn" _list path }
    : create_anomaly_monitor_response)

let create_anomaly_monitor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_monitor = value_for_key anomaly_monitor_of_yojson "AnomalyMonitor" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : create_anomaly_monitor_request)
