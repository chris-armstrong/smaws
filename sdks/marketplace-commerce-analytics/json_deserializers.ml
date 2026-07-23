open Smaws_Lib.Json.DeserializeHelpers
open Types

let optional_value_of_yojson = string_of_yojson
let optional_key_of_yojson = string_of_yojson

let customer_defined_values_of_yojson tree path =
  map_of_yojson optional_key_of_yojson optional_value_of_yojson tree path

let data_set_publication_date_of_yojson = timestamp_epoch_seconds_of_yojson
let data_set_request_id_of_yojson = string_of_yojson

let data_set_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "customer_subscriber_hourly_monthly_subscriptions" ->
        CUSTOMER_SUBSCRIBER_HOURLY_MONTHLY_SUBSCRIPTIONS
    | `String "customer_subscriber_annual_subscriptions" -> CUSTOMER_SUBSCRIBER_ANNUAL_SUBSCRIPTIONS
    | `String "daily_business_usage_by_instance_type" -> DAILY_BUSINESS_USAGE_BY_INSTANCE_TYPE
    | `String "daily_business_fees" -> DAILY_BUSINESS_FEES
    | `String "daily_business_free_trial_conversions" -> DAILY_BUSINESS_FREE_TRIAL_CONVERSIONS
    | `String "daily_business_new_instances" -> DAILY_BUSINESS_NEW_INSTANCES
    | `String "daily_business_new_product_subscribers" -> DAILY_BUSINESS_NEW_PRODUCT_SUBSCRIBERS
    | `String "daily_business_canceled_product_subscribers" ->
        DAILY_BUSINESS_CANCELED_PRODUCT_SUBSCRIBERS
    | `String "monthly_revenue_billing_and_revenue_data" -> MONTHLY_REVENUE_BILLING_AND_REVENUE_DATA
    | `String "monthly_revenue_annual_subscriptions" -> MONTHLY_REVENUE_ANNUAL_SUBSCRIPTIONS
    | `String "monthly_revenue_field_demonstration_usage" ->
        MONTHLY_REVENUE_FIELD_DEMONSTRATION_USAGE
    | `String "monthly_revenue_flexible_payment_schedule" ->
        MONTHLY_REVENUE_FLEXIBLE_PAYMENT_SCHEDULE
    | `String "disbursed_amount_by_product" -> DISBURSED_AMOUNT_BY_PRODUCT
    | `String "disbursed_amount_by_product_with_uncollected_funds" ->
        DISBURSED_AMOUNT_BY_PRODUCT_WITH_UNCOLLECTED_FUNDS
    | `String "disbursed_amount_by_instance_hours" -> DISBURSED_AMOUNT_BY_INSTANCE_HOURS
    | `String "disbursed_amount_by_customer_geo" -> DISBURSED_AMOUNT_BY_CUSTOMER_GEO
    | `String "disbursed_amount_by_age_of_uncollected_funds" ->
        DISBURSED_AMOUNT_BY_AGE_OF_UNCOLLECTED_FUNDS
    | `String "disbursed_amount_by_age_of_disbursed_funds" ->
        DISBURSED_AMOUNT_BY_AGE_OF_DISBURSED_FUNDS
    | `String "disbursed_amount_by_age_of_past_due_funds" ->
        DISBURSED_AMOUNT_BY_AGE_OF_PAST_DUE_FUNDS
    | `String "disbursed_amount_by_uncollected_funds_breakdown" ->
        DISBURSED_AMOUNT_BY_UNCOLLECTED_FUNDS_BREAKDOWN
    | `String "customer_profile_by_industry" -> CUSTOMER_PROFILE_BY_INDUSTRY
    | `String "customer_profile_by_revenue" -> CUSTOMER_PROFILE_BY_REVENUE
    | `String "customer_profile_by_geography" -> CUSTOMER_PROFILE_BY_GEOGRAPHY
    | `String "sales_compensation_billed_revenue" -> SALES_COMPENSATION_BILLED_REVENUE
    | `String "us_sales_and_use_tax_records" -> US_SALES_AND_USE_TAX_RECORDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataSetType" value)
    | _ -> raise (deserialize_wrong_type_error path "DataSetType")
     : data_set_type)
    : data_set_type)

let destination_s3_bucket_name_of_yojson = string_of_yojson
let destination_s3_prefix_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson
let from_date_of_yojson = timestamp_epoch_seconds_of_yojson

let marketplace_commerce_analytics_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path }
    : marketplace_commerce_analytics_exception)

let generate_data_set_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_set_request_id =
       option_of_yojson (value_for_key data_set_request_id_of_yojson "dataSetRequestId") _list path;
   }
    : generate_data_set_result)

let sns_topic_arn_of_yojson = string_of_yojson
let role_name_arn_of_yojson = string_of_yojson

let generate_data_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_set_type = value_for_key data_set_type_of_yojson "dataSetType" _list path;
     data_set_publication_date =
       value_for_key data_set_publication_date_of_yojson "dataSetPublicationDate" _list path;
     role_name_arn = value_for_key role_name_arn_of_yojson "roleNameArn" _list path;
     destination_s3_bucket_name =
       value_for_key destination_s3_bucket_name_of_yojson "destinationS3BucketName" _list path;
     destination_s3_prefix =
       option_of_yojson
         (value_for_key destination_s3_prefix_of_yojson "destinationS3Prefix")
         _list path;
     sns_topic_arn = value_for_key sns_topic_arn_of_yojson "snsTopicArn" _list path;
     customer_defined_values =
       option_of_yojson
         (value_for_key customer_defined_values_of_yojson "customerDefinedValues")
         _list path;
   }
    : generate_data_set_request)

let start_support_data_export_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_set_request_id =
       option_of_yojson (value_for_key data_set_request_id_of_yojson "dataSetRequestId") _list path;
   }
    : start_support_data_export_result)

let support_data_set_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "customer_support_contacts_data" -> Customer_support_contacts_data
    | `String "test_customer_support_contacts_data" -> Test_customer_support_contacts_data
    | `String value -> raise (deserialize_unknown_enum_value_error path "SupportDataSetType" value)
    | _ -> raise (deserialize_wrong_type_error path "SupportDataSetType")
     : support_data_set_type)
    : support_data_set_type)

let start_support_data_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_set_type = value_for_key support_data_set_type_of_yojson "dataSetType" _list path;
     from_date = value_for_key from_date_of_yojson "fromDate" _list path;
     role_name_arn = value_for_key role_name_arn_of_yojson "roleNameArn" _list path;
     destination_s3_bucket_name =
       value_for_key destination_s3_bucket_name_of_yojson "destinationS3BucketName" _list path;
     destination_s3_prefix =
       option_of_yojson
         (value_for_key destination_s3_prefix_of_yojson "destinationS3Prefix")
         _list path;
     sns_topic_arn = value_for_key sns_topic_arn_of_yojson "snsTopicArn" _list path;
     customer_defined_values =
       option_of_yojson
         (value_for_key customer_defined_values_of_yojson "customerDefinedValues")
         _list path;
   }
    : start_support_data_export_request)
