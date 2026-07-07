type nonrec support_data_set_type =
  | Test_customer_support_contacts_data [@ocaml.doc ""]
  | Customer_support_contacts_data [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_set_request_id = string [@@ocaml.doc ""]

type nonrec start_support_data_export_result = {
  data_set_request_id : data_set_request_id option;
      [@ocaml.doc
        "{i This target has been deprecated.} A unique identifier representing a specific request \
         to the StartSupportDataExport operation. This identifier can be used to correlate a \
         request with notifications from the SNS topic."]
}
[@@ocaml.doc
  "{i This target has been deprecated.} Container for the result of the StartSupportDataExport \
   operation."]

type nonrec from_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec role_name_arn = string [@@ocaml.doc ""]

type nonrec destination_s3_bucket_name = string [@@ocaml.doc ""]

type nonrec destination_s3_prefix = string [@@ocaml.doc ""]

type nonrec sns_topic_arn = string [@@ocaml.doc ""]

type nonrec optional_value = string [@@ocaml.doc ""]

type nonrec optional_key = string [@@ocaml.doc ""]

type nonrec customer_defined_values = (optional_key * optional_value) list [@@ocaml.doc ""]

type nonrec start_support_data_export_request = {
  customer_defined_values : customer_defined_values option;
      [@ocaml.doc
        "{i This target has been deprecated.} (Optional) Key-value pairs which will be returned, \
         unmodified, in the Amazon SNS notification message and the data set metadata file."]
  sns_topic_arn : sns_topic_arn;
      [@ocaml.doc
        "{i This target has been deprecated.} Amazon Resource Name (ARN) for the SNS Topic that \
         will be notified when the data set has been published or if an error has occurred."]
  destination_s3_prefix : destination_s3_prefix option;
      [@ocaml.doc
        "{i This target has been deprecated.} (Optional) The desired S3 prefix for the published \
         data set, similar to a directory path in standard file systems. For example, if given the \
         bucket name \"mybucket\" and the prefix \"myprefix/mydatasets\", the output file \
         \"outputfile\" would be published to \"s3://mybucket/myprefix/mydatasets/outputfile\". If \
         the prefix directory structure does not exist, it will be created. If no prefix is \
         provided, the data set will be published to the S3 bucket root."]
  destination_s3_bucket_name : destination_s3_bucket_name;
      [@ocaml.doc
        "{i This target has been deprecated.} The name (friendly name, not ARN) of the destination \
         S3 bucket."]
  role_name_arn : role_name_arn;
      [@ocaml.doc
        "{i This target has been deprecated.} The Amazon Resource Name (ARN) of the Role with an \
         attached permissions policy to interact with the provided AWS services."]
  from_date : from_date;
      [@ocaml.doc
        "{i This target has been deprecated.} The start date from which to retrieve the data set \
         in UTC. This parameter only affects the customer_support_contacts_data data set type."]
  data_set_type : support_data_set_type;
      [@ocaml.doc
        " {i This target has been deprecated.} Specifies the data set type to be written to the \
         output csv file. The data set types customer_support_contacts_data and \
         test_customer_support_contacts_data both result in a csv file containing the following \
         fields: Product Id, Product Code, Customer Guid, Subscription Guid, Subscription Start \
         Date, Organization, AWS Account Id, Given Name, Surname, Telephone Number, Email, Title, \
         Country Code, ZIP Code, Operation Type, and Operation Time. \n\n\
        \  \n\
        \ \n\
        \ {ul\n\
        \       {- {i customer_support_contacts_data} Customer support contact data. The data set \
         will contain all changes (Creates, Updates, and Deletes) to customer support contact data \
         from the date specified in the from_date parameter.}\n\
        \       {- {i test_customer_support_contacts_data} An example data set containing static \
         test data in the same format as customer_support_contacts_data}\n\
        \       }\n\
        \   \n\
        \   "]
}
[@@ocaml.doc
  "{i This target has been deprecated.} Container for the parameters to the StartSupportDataExport \
   operation."]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec marketplace_commerce_analytics_exception = {
  message : exception_message option; [@ocaml.doc "This message describes details of the error."]
}
[@@ocaml.doc "This exception is thrown when an internal service error occurs."]

type nonrec generate_data_set_result = {
  data_set_request_id : data_set_request_id option;
      [@ocaml.doc
        "A unique identifier representing a specific request to the GenerateDataSet operation. \
         This identifier can be used to correlate a request with notifications from the SNS topic."]
}
[@@ocaml.doc "Container for the result of the GenerateDataSet operation."]

type nonrec data_set_type =
  | US_SALES_AND_USE_TAX_RECORDS [@ocaml.doc ""]
  | SALES_COMPENSATION_BILLED_REVENUE [@ocaml.doc ""]
  | CUSTOMER_PROFILE_BY_GEOGRAPHY [@ocaml.doc ""]
  | CUSTOMER_PROFILE_BY_REVENUE [@ocaml.doc ""]
  | CUSTOMER_PROFILE_BY_INDUSTRY [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_UNCOLLECTED_FUNDS_BREAKDOWN [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_AGE_OF_PAST_DUE_FUNDS [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_AGE_OF_DISBURSED_FUNDS [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_AGE_OF_UNCOLLECTED_FUNDS [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_CUSTOMER_GEO [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_INSTANCE_HOURS [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_PRODUCT_WITH_UNCOLLECTED_FUNDS [@ocaml.doc ""]
  | DISBURSED_AMOUNT_BY_PRODUCT [@ocaml.doc ""]
  | MONTHLY_REVENUE_FLEXIBLE_PAYMENT_SCHEDULE [@ocaml.doc ""]
  | MONTHLY_REVENUE_FIELD_DEMONSTRATION_USAGE [@ocaml.doc ""]
  | MONTHLY_REVENUE_ANNUAL_SUBSCRIPTIONS [@ocaml.doc ""]
  | MONTHLY_REVENUE_BILLING_AND_REVENUE_DATA [@ocaml.doc ""]
  | DAILY_BUSINESS_CANCELED_PRODUCT_SUBSCRIBERS [@ocaml.doc ""]
  | DAILY_BUSINESS_NEW_PRODUCT_SUBSCRIBERS [@ocaml.doc ""]
  | DAILY_BUSINESS_NEW_INSTANCES [@ocaml.doc ""]
  | DAILY_BUSINESS_FREE_TRIAL_CONVERSIONS [@ocaml.doc ""]
  | DAILY_BUSINESS_FEES [@ocaml.doc ""]
  | DAILY_BUSINESS_USAGE_BY_INSTANCE_TYPE [@ocaml.doc ""]
  | CUSTOMER_SUBSCRIBER_ANNUAL_SUBSCRIPTIONS [@ocaml.doc ""]
  | CUSTOMER_SUBSCRIBER_HOURLY_MONTHLY_SUBSCRIPTIONS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_set_publication_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec generate_data_set_request = {
  customer_defined_values : customer_defined_values option;
      [@ocaml.doc
        "(Optional) Key-value pairs which will be returned, unmodified, in the Amazon SNS \
         notification message and the data set metadata file. These key-value pairs can be used to \
         correlated responses with tracking information from other systems."]
  sns_topic_arn : sns_topic_arn;
      [@ocaml.doc
        "Amazon Resource Name (ARN) for the SNS Topic that will be notified when the data set has \
         been published or if an error has occurred."]
  destination_s3_prefix : destination_s3_prefix option;
      [@ocaml.doc
        "(Optional) The desired S3 prefix for the published data set, similar to a directory path \
         in standard file systems. For example, if given the bucket name \"mybucket\" and the \
         prefix \"myprefix/mydatasets\", the output file \"outputfile\" would be published to \
         \"s3://mybucket/myprefix/mydatasets/outputfile\". If the prefix directory structure does \
         not exist, it will be created. If no prefix is provided, the data set will be published \
         to the S3 bucket root."]
  destination_s3_bucket_name : destination_s3_bucket_name;
      [@ocaml.doc "The name (friendly name, not ARN) of the destination S3 bucket."]
  role_name_arn : role_name_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Role with an attached permissions policy to \
         interact with the provided AWS services."]
  data_set_publication_date : data_set_publication_date;
      [@ocaml.doc
        "The date a data set was published. For daily data sets, provide a date with day-level \
         granularity for the desired day. For monthly data sets except those with prefix \
         disbursed_amount, provide a date with month-level granularity for the desired month (the \
         day value will be ignored). For data sets with prefix disbursed_amount, provide a date \
         with day-level granularity for the desired day. For these data sets we will look \
         backwards in time over the range of 31 days until the first data set is found (the latest \
         one)."]
  data_set_type : data_set_type;
      [@ocaml.doc
        "The desired data set type.\n\n\
        \  \n\
        \ \n\
        \ {ul\n\
        \       {-  customer_subscriber_hourly_monthly_subscriptions From 2017-09-15 to present: \
         Available daily by 24:00 UTC.\n\
        \                                                            \n\
        \                                                             }\n\
        \       {-  customer_subscriber_annual_subscriptions From 2017-09-15 to present: Available \
         daily by 24:00 UTC.\n\
        \                                                    \n\
        \                                                     }\n\
        \       {-  daily_business_usage_by_instance_type From 2017-09-15 to present: Available \
         daily by 24:00 UTC.\n\
        \                                                 \n\
        \                                                  }\n\
        \       {-  daily_business_fees From 2017-09-15 to present: Available daily by 24:00 UTC.\n\
        \                               \n\
        \                                }\n\
        \       {-  daily_business_free_trial_conversions From 2017-09-15 to present: Available \
         daily by 24:00 UTC.\n\
        \                                                 \n\
        \                                                  }\n\
        \       {-  daily_business_new_instances From 2017-09-15 to present: Available daily by \
         24:00 UTC.\n\
        \                                        \n\
        \                                         }\n\
        \       {-  daily_business_new_product_subscribers From 2017-09-15 to present: Available \
         daily by 24:00 UTC.\n\
        \                                                  \n\
        \                                                   }\n\
        \       {-  daily_business_canceled_product_subscribers From 2017-09-15 to present: \
         Available daily by 24:00 UTC.\n\
        \                                                       \n\
        \                                                        }\n\
        \       {-  monthly_revenue_billing_and_revenue_data From 2017-09-15 to present: Available \
         monthly on the 15th day of the month by 24:00 UTC. Data includes metered transactions \
         (e.g. hourly) from one month prior.\n\
        \                                                    \n\
        \                                                     }\n\
        \       {-  monthly_revenue_annual_subscriptions From 2017-09-15 to present: Available \
         monthly on the 15th day of the month by 24:00 UTC. Data includes up-front software \
         charges (e.g. annual) from one month prior.\n\
        \                                                \n\
        \                                                 }\n\
        \       {-  monthly_revenue_field_demonstration_usage From 2018-03-15 to present: \
         Available monthly on the 15th day of the month by 24:00 UTC.\n\
        \                                                     \n\
        \                                                      }\n\
        \       {-  monthly_revenue_flexible_payment_schedule From 2018-11-15 to present: \
         Available monthly on the 15th day of the month by 24:00 UTC.\n\
        \                                                     \n\
        \                                                      }\n\
        \       {-  disbursed_amount_by_product From 2017-09-15 to present: Available every 30 \
         days by 24:00 UTC.\n\
        \                                       \n\
        \                                        }\n\
        \       {-  disbursed_amount_by_instance_hours From 2017-09-15 to present: Available every \
         30 days by 24:00 UTC.\n\
        \                                              \n\
        \                                               }\n\
        \       {-  disbursed_amount_by_customer_geo From 2017-09-15 to present: Available every \
         30 days by 24:00 UTC.\n\
        \                                            \n\
        \                                             }\n\
        \       {-  disbursed_amount_by_age_of_uncollected_funds From 2017-09-15 to present: \
         Available every 30 days by 24:00 UTC.\n\
        \                                                        \n\
        \                                                         }\n\
        \       {-  disbursed_amount_by_age_of_disbursed_funds From 2017-09-15 to present: \
         Available every 30 days by 24:00 UTC.\n\
        \                                                      \n\
        \                                                       }\n\
        \       {-  disbursed_amount_by_age_of_past_due_funds From 2018-04-07 to present: \
         Available every 30 days by 24:00 UTC.\n\
        \                                                     \n\
        \                                                      }\n\
        \       {-  disbursed_amount_by_uncollected_funds_breakdown From 2019-10-04 to present: \
         Available every 30 days by 24:00 UTC.\n\
        \                                                           \n\
        \                                                            }\n\
        \       {-  sales_compensation_billed_revenue From 2017-09-15 to present: Available \
         monthly on the 15th day of the month by 24:00 UTC. Data includes metered transactions \
         (e.g. hourly) from one month prior, and up-front software charges (e.g. annual) from one \
         month prior.\n\
        \                                             \n\
        \                                              }\n\
        \       {-  us_sales_and_use_tax_records From 2017-09-15 to present: Available monthly on \
         the 15th day of the month by 24:00 UTC.\n\
        \                                        \n\
        \                                         }\n\
        \       {-  disbursed_amount_by_product_with_uncollected_funds This data set is \
         deprecated. Download related reports from AMMP instead!\n\
        \                                                              \n\
        \                                                               }\n\
        \       {-  customer_profile_by_industry This data set is deprecated. Download related \
         reports from AMMP instead!\n\
        \                                        \n\
        \                                         }\n\
        \       {-  customer_profile_by_revenue This data set is deprecated. Download related \
         reports from AMMP instead!\n\
        \                                       \n\
        \                                        }\n\
        \       {-  customer_profile_by_geography This data set is deprecated. Download related \
         reports from AMMP instead!\n\
        \                                         \n\
        \                                          }\n\
        \       }\n\
        \   \n\
        \   "]
}
[@@ocaml.doc "Container for the parameters to the GenerateDataSet operation."]
