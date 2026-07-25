open Smaws_Lib.Json.SerializeHelpers
open Types

let optional_value_to_yojson = string_to_yojson
let optional_key_to_yojson = string_to_yojson

let customer_defined_values_to_yojson tree =
  map_to_yojson optional_key_to_yojson optional_value_to_yojson tree

let data_set_publication_date_to_yojson = timestamp_epoch_seconds_to_yojson
let data_set_request_id_to_yojson = string_to_yojson

let data_set_type_to_yojson (x : data_set_type) =
  match x with
  | CUSTOMER_SUBSCRIBER_HOURLY_MONTHLY_SUBSCRIPTIONS ->
      `String "customer_subscriber_hourly_monthly_subscriptions"
  | CUSTOMER_SUBSCRIBER_ANNUAL_SUBSCRIPTIONS -> `String "customer_subscriber_annual_subscriptions"
  | DAILY_BUSINESS_USAGE_BY_INSTANCE_TYPE -> `String "daily_business_usage_by_instance_type"
  | DAILY_BUSINESS_FEES -> `String "daily_business_fees"
  | DAILY_BUSINESS_FREE_TRIAL_CONVERSIONS -> `String "daily_business_free_trial_conversions"
  | DAILY_BUSINESS_NEW_INSTANCES -> `String "daily_business_new_instances"
  | DAILY_BUSINESS_NEW_PRODUCT_SUBSCRIBERS -> `String "daily_business_new_product_subscribers"
  | DAILY_BUSINESS_CANCELED_PRODUCT_SUBSCRIBERS ->
      `String "daily_business_canceled_product_subscribers"
  | MONTHLY_REVENUE_BILLING_AND_REVENUE_DATA -> `String "monthly_revenue_billing_and_revenue_data"
  | MONTHLY_REVENUE_ANNUAL_SUBSCRIPTIONS -> `String "monthly_revenue_annual_subscriptions"
  | MONTHLY_REVENUE_FIELD_DEMONSTRATION_USAGE -> `String "monthly_revenue_field_demonstration_usage"
  | MONTHLY_REVENUE_FLEXIBLE_PAYMENT_SCHEDULE -> `String "monthly_revenue_flexible_payment_schedule"
  | DISBURSED_AMOUNT_BY_PRODUCT -> `String "disbursed_amount_by_product"
  | DISBURSED_AMOUNT_BY_PRODUCT_WITH_UNCOLLECTED_FUNDS ->
      `String "disbursed_amount_by_product_with_uncollected_funds"
  | DISBURSED_AMOUNT_BY_INSTANCE_HOURS -> `String "disbursed_amount_by_instance_hours"
  | DISBURSED_AMOUNT_BY_CUSTOMER_GEO -> `String "disbursed_amount_by_customer_geo"
  | DISBURSED_AMOUNT_BY_AGE_OF_UNCOLLECTED_FUNDS ->
      `String "disbursed_amount_by_age_of_uncollected_funds"
  | DISBURSED_AMOUNT_BY_AGE_OF_DISBURSED_FUNDS ->
      `String "disbursed_amount_by_age_of_disbursed_funds"
  | DISBURSED_AMOUNT_BY_AGE_OF_PAST_DUE_FUNDS -> `String "disbursed_amount_by_age_of_past_due_funds"
  | DISBURSED_AMOUNT_BY_UNCOLLECTED_FUNDS_BREAKDOWN ->
      `String "disbursed_amount_by_uncollected_funds_breakdown"
  | CUSTOMER_PROFILE_BY_INDUSTRY -> `String "customer_profile_by_industry"
  | CUSTOMER_PROFILE_BY_REVENUE -> `String "customer_profile_by_revenue"
  | CUSTOMER_PROFILE_BY_GEOGRAPHY -> `String "customer_profile_by_geography"
  | SALES_COMPENSATION_BILLED_REVENUE -> `String "sales_compensation_billed_revenue"
  | US_SALES_AND_USE_TAX_RECORDS -> `String "us_sales_and_use_tax_records"

let destination_s3_bucket_name_to_yojson = string_to_yojson
let destination_s3_prefix_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson
let from_date_to_yojson = timestamp_epoch_seconds_to_yojson

let marketplace_commerce_analytics_exception_to_yojson
    (x : marketplace_commerce_analytics_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let generate_data_set_result_to_yojson (x : generate_data_set_result) =
  assoc_to_yojson
    [ ("dataSetRequestId", option_to_yojson data_set_request_id_to_yojson x.data_set_request_id) ]

let sns_topic_arn_to_yojson = string_to_yojson
let role_name_arn_to_yojson = string_to_yojson

let generate_data_set_request_to_yojson (x : generate_data_set_request) =
  assoc_to_yojson
    [
      ("dataSetType", Some (data_set_type_to_yojson x.data_set_type));
      ( "dataSetPublicationDate",
        Some (data_set_publication_date_to_yojson x.data_set_publication_date) );
      ("roleNameArn", Some (role_name_arn_to_yojson x.role_name_arn));
      ( "destinationS3BucketName",
        Some (destination_s3_bucket_name_to_yojson x.destination_s3_bucket_name) );
      ( "destinationS3Prefix",
        option_to_yojson destination_s3_prefix_to_yojson x.destination_s3_prefix );
      ("snsTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn));
      ( "customerDefinedValues",
        option_to_yojson customer_defined_values_to_yojson x.customer_defined_values );
    ]

let start_support_data_export_result_to_yojson (x : start_support_data_export_result) =
  assoc_to_yojson
    [ ("dataSetRequestId", option_to_yojson data_set_request_id_to_yojson x.data_set_request_id) ]

let support_data_set_type_to_yojson (x : support_data_set_type) =
  match x with
  | Customer_support_contacts_data -> `String "customer_support_contacts_data"
  | Test_customer_support_contacts_data -> `String "test_customer_support_contacts_data"

let start_support_data_export_request_to_yojson (x : start_support_data_export_request) =
  assoc_to_yojson
    [
      ("dataSetType", Some (support_data_set_type_to_yojson x.data_set_type));
      ("fromDate", Some (from_date_to_yojson x.from_date));
      ("roleNameArn", Some (role_name_arn_to_yojson x.role_name_arn));
      ( "destinationS3BucketName",
        Some (destination_s3_bucket_name_to_yojson x.destination_s3_bucket_name) );
      ( "destinationS3Prefix",
        option_to_yojson destination_s3_prefix_to_yojson x.destination_s3_prefix );
      ("snsTopicArn", Some (sns_topic_arn_to_yojson x.sns_topic_arn));
      ( "customerDefinedValues",
        option_to_yojson customer_defined_values_to_yojson x.customer_defined_values );
    ]
