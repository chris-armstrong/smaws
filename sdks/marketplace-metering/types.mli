type nonrec error_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The calls to the API are throttled.\n"]

type nonrec invalid_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Registration token is invalid.\n"]

type nonrec internal_service_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An internal error has occurred. Retry your request. If the problem persists, post a message \
   with details on the Amazon Web Services forums.\n"]

type nonrec expired_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The submitted registration token has expired. This can happen if the buyer's browser takes too \
   long to redirect to your page, the buyer has resubmitted the registration token, or your \
   application has held on to the registration token for too long. Your SaaS registration website \
   should redeem this token as soon as it is submitted by the buyer's browser.\n"]

type nonrec disabled_api_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The API is disabled in the Region.\n"]

type nonrec license_arn = string [@@ocaml.doc ""]

type nonrec customer_aws_account_id = string [@@ocaml.doc ""]

type nonrec product_code = string [@@ocaml.doc ""]

type nonrec customer_identifier = string [@@ocaml.doc ""]

type nonrec resolve_customer_result = {
  customer_identifier : customer_identifier option;
      [@ocaml.doc
        "The [CustomerIdentifier] is used to identify an individual customer in your application.\n"]
  product_code : product_code option;
      [@ocaml.doc
        "The product code is returned to confirm that the buyer is registering for your product. \
         Subsequent [BatchMeterUsage] calls should be made using this product code.\n"]
  customer_aws_account_id : customer_aws_account_id option;
      [@ocaml.doc
        "The [CustomerAWSAccountId] provides the Amazon Web Services account ID associated with \
         the [CustomerIdentifier] for the individual customer. Calls to [BatchMeterUsage] require \
         [CustomerAWSAccountId] for each [UsageRecord].\n"]
  license_arn : license_arn option;
      [@ocaml.doc
        "The [LicenseArn] is a unique identifier for a specific granted license. These are \
         typically used for software purchased through Amazon Web Services Marketplace. Calls to \
         [BatchMeterUsage] require [LicenseArn] for each [UsageRecord].\n\n\
        \  Once you receive the [CustomerAWSAccountId] and [LicenseArn] in the response, store \
         that for future purposes/API calls/integrations.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The result of the [ResolveCustomer] operation. Contains the [CustomerIdentifier] along with the \
   [CustomerAWSAccountId], [ProductCode], and [LicenseArn].\n"]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec resolve_customer_request = {
  registration_token : non_empty_string;
      [@ocaml.doc
        "When a buyer visits your website during the registration process, the buyer submits a \
         registration token through the browser. The registration token is resolved to obtain a \
         [CustomerIdentifier] along with the [CustomerAWSAccountId], [ProductCode], and \
         [LicenseArn].\n"]
}
[@@ocaml.doc "Contains input to the [ResolveCustomer] operation.\n"]

type nonrec platform_not_supported_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Amazon Web Services Marketplace does not support metering usage from the underlying platform. \
   Currently, Amazon ECS, Amazon EKS, and Fargate are supported.\n"]

type nonrec invalid_region_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  " [RegisterUsage] must be called in the same Amazon Web Services Region the ECS task was \
   launched in. This prevents a container from hardcoding a Region (e.g. \
   withRegion(\226\128\156us-east-1\226\128\157) when calling [RegisterUsage].\n"]

type nonrec invalid_public_key_version_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Public Key version is invalid.\n"]

type nonrec invalid_product_code_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The product code passed does not match the product code used for publishing the product.\n"]

type nonrec customer_not_entitled_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Exception thrown when the customer does not have a valid subscription for the product.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec register_usage_result = {
  public_key_rotation_timestamp : timestamp option;
      [@ocaml.doc "(Optional) Only included when public key version has expired\n"]
  signature : non_empty_string option; [@ocaml.doc "JWT Token\n"]
}
[@@ocaml.doc ""]

type nonrec nonce = string [@@ocaml.doc ""]

type nonrec version_integer = int [@@ocaml.doc ""]

type nonrec register_usage_request = {
  product_code : product_code;
      [@ocaml.doc
        "Product code is used to uniquely identify a product in Amazon Web Services Marketplace. \
         The product code should be the same as the one used during the publishing of a new \
         product.\n"]
  public_key_version : version_integer;
      [@ocaml.doc "Public Key Version provided by Amazon Web Services Marketplace\n"]
  nonce : nonce option;
      [@ocaml.doc
        "(Optional) To scope down the registration to a specific running software instance and \
         guard against replay attacks.\n"]
}
[@@ocaml.doc ""]

type nonrec timestamp_out_of_bounds_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The [timestamp] value passed in the [UsageRecord] is out of allowed range.\n\n\
  \ For [BatchMeterUsage], if any of the records are outside of the allowed range, the entire \
   batch is not processed. You must remove invalid records and try again.\n\
  \ "]

type nonrec invalid_usage_dimension_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The usage dimension does not match one of the [UsageDimensions] associated with products.\n"]

type nonrec invalid_usage_allocations_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Sum of allocated usage quantities is not equal to the usage quantity.\n"]

type nonrec invalid_tag_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The tag is invalid, or the number of tags is greater than 5.\n"]

type nonrec invalid_endpoint_region_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The endpoint being called is in a Amazon Web Services Region different from your EC2 instance, \
   ECS task, or EKS pod. The Region of the Metering Service endpoint and the Amazon Web Services \
   Region of the resource must match.\n"]

type nonrec idempotency_conflict_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The [ClientToken] is being used for multiple requests.\n"]

type nonrec duplicate_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A metering record has already been emitted by the same EC2 instance, ECS task, or EKS pod for \
   the given \\{[usageDimension], [timestamp]\\} with a different [usageQuantity].\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec meter_usage_result = {
  metering_record_id : string_ option; [@ocaml.doc "Metering record id.\n"]
}
[@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "One part of a key-value pair that makes up a [tag]. A [key] is a label that acts like a \
         category for the specific tag values.\n"]
  value : tag_value;
      [@ocaml.doc
        "One part of a key-value pair that makes up a [tag]. A [value] acts as a descriptor within \
         a tag category (key). The value can be empty or null.\n"]
}
[@@ocaml.doc "Metadata assigned to an allocation. Each tag is made up of a [key] and a [value].\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec allocated_usage_quantity = int [@@ocaml.doc ""]

type nonrec usage_allocation = {
  allocated_usage_quantity : allocated_usage_quantity;
      [@ocaml.doc "The total quantity allocated to this bucket of usage.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The set of tags that define the bucket of usage. For the bucket of items with no tags, \
         this parameter can be left out.\n"]
}
[@@ocaml.doc
  "Usage allocations allow you to split usage into buckets by tags.\n\n\
  \ Each [UsageAllocation] indicates the usage quantity for a specific set of tags.\n\
  \ "]

type nonrec usage_allocations = usage_allocation list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec usage_quantity = int [@@ocaml.doc ""]

type nonrec usage_dimension = string [@@ocaml.doc ""]

type nonrec meter_usage_request = {
  product_code : product_code;
      [@ocaml.doc
        "Product code is used to uniquely identify a product in Amazon Web Services Marketplace. \
         The product code should be the same as the one used during the publishing of a new \
         product.\n"]
  timestamp : timestamp;
      [@ocaml.doc
        "Timestamp, in UTC, for which the usage is being reported. Your application can meter \
         usage for up to six hours in the past. Make sure the [timestamp] value is not before the \
         start of the software usage.\n"]
  usage_dimension : usage_dimension;
      [@ocaml.doc
        "It will be one of the fcp dimension name provided during the publishing of the product.\n"]
  usage_quantity : usage_quantity option;
      [@ocaml.doc "Consumption value for the hour. Defaults to [0] if not specified.\n"]
  dry_run : boolean_ option;
      [@ocaml.doc
        "Checks whether you have the permissions required for the action, but does not make the \
         request. If you have the permissions, the request returns [DryRunOperation]; otherwise, \
         it returns [UnauthorizedException]. Defaults to [false] if not specified.\n"]
  usage_allocations : usage_allocations option;
      [@ocaml.doc
        "The set of [UsageAllocations] to submit.\n\n\
        \ The sum of all [UsageAllocation] quantities must equal the [UsageQuantity] of the \
         [MeterUsage] request, and each [UsageAllocation] must have a unique set of tags (include \
         no tags).\n\
        \ "]
  client_token : client_token option;
      [@ocaml.doc
        "Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency \
         of the request. This lets you safely retry the request without accidentally performing \
         the same operation a second time. Passing the same value to a later call to an operation \
         requires that you also pass the same value for all other parameters. We recommend that \
         you use a {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID type of \
         value}.\n\n\
        \ If you don't provide this value, then Amazon Web Services generates a random one for you.\n\
        \ \n\
        \  If you retry the operation with the same [ClientToken], but with different parameters, \
         the retry fails with an [IdempotencyConflictException] error.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec invalid_license_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Ensure the [LicenseArn] is valid, matches the customer, and usage is within the license \
   activation period.\n"]

type nonrec invalid_customer_identifier_exception = {
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You have metered usage for a [CustomerIdentifier] that does not exist.\n"]

type nonrec usage_record = {
  timestamp : timestamp;
      [@ocaml.doc
        "Timestamp, in UTC, for which the usage is being reported.\n\n\
        \ Your application can meter usage for up to 24 hours in the past. Make sure the \
         [timestamp] value is not before the start of the software usage.\n\
        \ "]
  customer_identifier : customer_identifier option;
      [@ocaml.doc
        "The [CustomerIdentifier] is obtained through the [ResolveCustomer] operation and \
         represents an individual buyer in your application.\n"]
  dimension : usage_dimension;
      [@ocaml.doc
        "During the process of registering a product on Amazon Web Services Marketplace, \
         dimensions are specified. These represent different units of value in your application.\n"]
  quantity : usage_quantity option;
      [@ocaml.doc
        "The quantity of usage consumed by the customer for the given dimension and time. Defaults \
         to [0] if not specified.\n"]
  usage_allocations : usage_allocations option;
      [@ocaml.doc
        "The set of [UsageAllocations] to submit. The sum of all [UsageAllocation] quantities must \
         equal the Quantity of the [UsageRecord].\n"]
  customer_aws_account_id : customer_aws_account_id option;
      [@ocaml.doc
        "The [CustomerAWSAccountId] parameter specifies the AWS account ID of the buyer.\n\n\
        \  For existing integrations, to access your [CustomerIdentifier] to \
         [CustomerAWSAccountId] mapping, see \
         {{:https://docs.aws.amazon.com/marketplace/latest/userguide/data-feed-account.html}Account \
         Feeds}.\n\
        \  \n\
        \   "]
  license_arn : license_arn option;
      [@ocaml.doc
        "The [LicenseArn] is a unique identifier for a specific granted license. These are used \
         for software purchased through Amazon Web Services Marketplace.\n\n\
        \  To access your [CustomerAWSAccountId] and [LicenseArn] mapping, visit \
         {{:https://docs.aws.amazon.com/marketplace/latest/userguide/data-feed-agreements.html}Agreements \
         Feeds}.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "A [UsageRecord] indicates a quantity of usage for a given product, customer, dimension and \
   time.\n\n\
  \ Multiple requests with the same [UsageRecords] as input will be de-duplicated to prevent \
   double charges.\n\
  \ "]

type nonrec usage_record_list = usage_record list [@@ocaml.doc ""]

type nonrec usage_record_result_status =
  | SUCCESS [@ocaml.doc ""]
  | CUSTOMER_NOT_SUBSCRIBED [@ocaml.doc ""]
  | DUPLICATE_RECORD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_record_result = {
  usage_record : usage_record option;
      [@ocaml.doc "The [UsageRecord] that was part of the [BatchMeterUsage] request.\n"]
  metering_record_id : string_ option;
      [@ocaml.doc "The [MeteringRecordId] is a unique identifier for this metering event.\n"]
  status : usage_record_result_status option;
      [@ocaml.doc
        "The [UsageRecordResult] [Status] indicates the status of an individual [UsageRecord] \
         processed by [BatchMeterUsage].\n\n\
        \ {ul\n\
        \       {-   {i Success}- The [UsageRecord] was accepted and honored by [BatchMeterUsage].\n\
        \           \n\
        \            }\n\
        \       {-   {i CustomerNotSubscribed}- The [CustomerIdentifier] specified is not able to \
         use your product. The [UsageRecord] was not honored. There are three causes for this \
         result:\n\
        \           \n\
        \            {ul\n\
        \                  {-  The customer identifier is invalid.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The customer identifier provided in the metering record does not \
         have an active agreement or subscription with this product. Future [UsageRecords] for \
         this customer will fail until the customer subscribes to your product.\n\
        \                      \n\
        \                       }\n\
        \                  {-  The customer's Amazon Web Services account was suspended.\n\
        \                      \n\
        \                       }\n\
        \                  \n\
        \        }\n\
        \         }\n\
        \       {-   {i DuplicateRecord}- Indicates that the [UsageRecord] was invalid and not \
         honored. A previously metered [UsageRecord] had the same customer, dimension, and time, \
         but a different quantity.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A [UsageRecordResult] indicates the status of a given [UsageRecord] processed by \
   [BatchMeterUsage].\n"]

type nonrec usage_record_result_list = usage_record_result list [@@ocaml.doc ""]

type nonrec batch_meter_usage_result = {
  results : usage_record_result_list option;
      [@ocaml.doc
        "Contains all [UsageRecords] processed by [BatchMeterUsage]. These records were either \
         honored by Amazon Web Services Marketplace Metering Service or were invalid. Invalid \
         records should be fixed before being resubmitted.\n"]
  unprocessed_records : usage_record_list option;
      [@ocaml.doc
        "Contains all [UsageRecords] that were not processed by [BatchMeterUsage]. This is a list \
         of [UsageRecords]. You can retry the failed request by making another [BatchMeterUsage] \
         call with this list as input in the [BatchMeterUsageRequest].\n"]
}
[@@ocaml.doc
  "Contains the [UsageRecords] processed by [BatchMeterUsage] and any records that have failed due \
   to transient error.\n"]

type nonrec batch_meter_usage_request = {
  usage_records : usage_record_list;
      [@ocaml.doc
        "The set of [UsageRecords] to submit. [BatchMeterUsage] accepts up to 25 [UsageRecords] at \
         a time.\n"]
  product_code : product_code option;
      [@ocaml.doc
        "Product code is used to uniquely identify a product in Amazon Web Services Marketplace. \
         The product code should be the same as the one used during the publishing of a new \
         product.\n"]
}
[@@ocaml.doc
  "A [BatchMeterUsageRequest] contains [UsageRecords], which indicate quantities of usage within \
   your application.\n"]
