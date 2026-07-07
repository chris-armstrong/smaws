(** Marketplace Metering client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_usage_allocation :
  ?tags:tag_list -> allocated_usage_quantity:allocated_usage_quantity -> unit -> usage_allocation

val make_usage_record :
  ?license_arn:license_arn ->
  ?customer_aws_account_id:customer_aws_account_id ->
  ?usage_allocations:usage_allocations ->
  ?quantity:usage_quantity ->
  ?customer_identifier:customer_identifier ->
  dimension:usage_dimension ->
  timestamp:timestamp ->
  unit ->
  usage_record

val make_resolve_customer_request :
  registration_token:non_empty_string -> unit -> resolve_customer_request

val make_register_usage_request :
  ?nonce:nonce ->
  public_key_version:version_integer ->
  product_code:product_code ->
  unit ->
  register_usage_request

val make_meter_usage_request :
  ?client_token:client_token ->
  ?usage_allocations:usage_allocations ->
  ?dry_run:boolean_ ->
  ?usage_quantity:usage_quantity ->
  usage_dimension:usage_dimension ->
  timestamp:timestamp ->
  product_code:product_code ->
  unit ->
  meter_usage_request

val make_batch_meter_usage_request :
  ?product_code:product_code -> usage_records:usage_record_list -> unit -> batch_meter_usage_request
(** {1:operations Operations} *)

module BatchMeterUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DisabledApiException of disabled_api_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidCustomerIdentifierException of invalid_customer_identifier_exception
    | `InvalidLicenseException of invalid_license_exception
    | `InvalidProductCodeException of invalid_product_code_exception
    | `InvalidTagException of invalid_tag_exception
    | `InvalidUsageAllocationsException of invalid_usage_allocations_exception
    | `InvalidUsageDimensionException of invalid_usage_dimension_exception
    | `ThrottlingException of throttling_exception
    | `TimestampOutOfBoundsException of timestamp_out_of_bounds_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_meter_usage_request ->
    ( batch_meter_usage_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DisabledApiException of disabled_api_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidCustomerIdentifierException of invalid_customer_identifier_exception
      | `InvalidLicenseException of invalid_license_exception
      | `InvalidProductCodeException of invalid_product_code_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidUsageAllocationsException of invalid_usage_allocations_exception
      | `InvalidUsageDimensionException of invalid_usage_dimension_exception
      | `ThrottlingException of throttling_exception
      | `TimestampOutOfBoundsException of timestamp_out_of_bounds_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_meter_usage_request ->
    ( batch_meter_usage_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DisabledApiException of disabled_api_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidCustomerIdentifierException of invalid_customer_identifier_exception
      | `InvalidLicenseException of invalid_license_exception
      | `InvalidProductCodeException of invalid_product_code_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidUsageAllocationsException of invalid_usage_allocations_exception
      | `InvalidUsageDimensionException of invalid_usage_dimension_exception
      | `ThrottlingException of throttling_exception
      | `TimestampOutOfBoundsException of timestamp_out_of_bounds_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Amazon Web Services Marketplace is introducing Concurrent Agreements, enabling buyers to make \
   multiple purchases per Amazon Web Services account. Starting June 1, 2026, new SaaS products \
   must use [CustomerAWSAccountId] (instead of [CustomerIdentifier]), [LicenseArn] (instead of \
   [ProductCode]) to support this feature. Existing integrations will continue to work. Review the \
   new integration for Concurrent Agreements \
   {{:https://catalog.workshops.aws/mpseller/en-US/saas/integration-for-concurrent-agreements}here}.\n\
  \ \n\
  \   To post metering records for customers, SaaS applications call [BatchMeterUsage], which is \
   used for metering SaaS flexible consumption pricing (FCP). Identical requests are idempotent \
   and can be retried with the same records or a subset of records. Each [BatchMeterUsage] request \
   is for only one product. If you want to meter usage for multiple products, you must make \
   multiple [BatchMeterUsage] calls.\n\
  \   \n\
  \    Usage records should be submitted in quick succession following a recorded event. Usage \
   records aren't accepted 24 hours or more after an event.\n\
  \    \n\
  \      [BatchMeterUsage] can process up to 25 [UsageRecords] at a time, and each request must be \
   less than 1 MB in size. Optionally, you can have multiple usage allocations for usage data \
   that's split into buckets according to predefined tags.\n\
  \     \n\
  \       [BatchMeterUsage] returns a list of [UsageRecordResult] objects, which have each \
   [UsageRecord]. It also returns a list of [UnprocessedRecords], which indicate errors on the \
   service side that should be retried.\n\
  \      \n\
  \       For Amazon Web Services Regions that support [BatchMeterUsage], see \
   {{:https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#batchmeterusage-region-support}BatchMeterUsage \
   Region support}. \n\
  \       \n\
  \         For an example of [BatchMeterUsage], see \
   {{:https://docs.aws.amazon.com/marketplace/latest/userguide/saas-code-examples.html#saas-batchmeterusage-example} \
   BatchMeterUsage code example} in the {i Amazon Web Services Marketplace Seller Guide}.\n\
  \         \n\
  \          "]

module MeterUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CustomerNotEntitledException of customer_not_entitled_exception
    | `DuplicateRequestException of duplicate_request_exception
    | `IdempotencyConflictException of idempotency_conflict_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidEndpointRegionException of invalid_endpoint_region_exception
    | `InvalidProductCodeException of invalid_product_code_exception
    | `InvalidTagException of invalid_tag_exception
    | `InvalidUsageAllocationsException of invalid_usage_allocations_exception
    | `InvalidUsageDimensionException of invalid_usage_dimension_exception
    | `ThrottlingException of throttling_exception
    | `TimestampOutOfBoundsException of timestamp_out_of_bounds_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    meter_usage_request ->
    ( meter_usage_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CustomerNotEntitledException of customer_not_entitled_exception
      | `DuplicateRequestException of duplicate_request_exception
      | `IdempotencyConflictException of idempotency_conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidEndpointRegionException of invalid_endpoint_region_exception
      | `InvalidProductCodeException of invalid_product_code_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidUsageAllocationsException of invalid_usage_allocations_exception
      | `InvalidUsageDimensionException of invalid_usage_dimension_exception
      | `ThrottlingException of throttling_exception
      | `TimestampOutOfBoundsException of timestamp_out_of_bounds_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    meter_usage_request ->
    ( meter_usage_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CustomerNotEntitledException of customer_not_entitled_exception
      | `DuplicateRequestException of duplicate_request_exception
      | `IdempotencyConflictException of idempotency_conflict_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidEndpointRegionException of invalid_endpoint_region_exception
      | `InvalidProductCodeException of invalid_product_code_exception
      | `InvalidTagException of invalid_tag_exception
      | `InvalidUsageAllocationsException of invalid_usage_allocations_exception
      | `InvalidUsageDimensionException of invalid_usage_dimension_exception
      | `ThrottlingException of throttling_exception
      | `TimestampOutOfBoundsException of timestamp_out_of_bounds_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "As a seller, your software hosted in the buyer's Amazon Web Services account uses this API \
   action to emit metering records directly to Amazon Web Services Marketplace. You must use the \
   following buyer Amazon Web Services account credentials to sign the API request.\n\n\
  \ {ul\n\
  \       {-  For {b Amazon EC2} deployments, your software must use the \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html}IAM role \
   for Amazon EC2} to sign the API call for [MeterUsage] API operation.\n\
  \           \n\
  \            }\n\
  \       {-  For {b Amazon EKS} deployments, your software must use \
   {{:https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html}IAM \
   roles for service accounts (IRSA)} to sign the API call for the [MeterUsage] API operation. \
   Using {{:https://docs.aws.amazon.com/eks/latest/userguide/pod-identities.html}EKS Pod \
   Identity}, the node role, or long-term access keys is not supported.\n\
  \           \n\
  \            }\n\
  \       {-  For {b Amazon ECS} deployments, your software must use \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html}Amazon ECS \
   task IAM} role to sign the API call for the [MeterUsage] API operation. Using the node role or \
   long-term access keys are not supported.\n\
  \           \n\
  \            }\n\
  \       {-  For {b Amazon Bedrock AgentCore Runtime} deployments, your software must use the \
   {{:https://docs.aws.amazon.com/bedrock-agentcore/latest/devguide/runtime-permissions.html#runtime-permissions-execution}AgentCore \
   Runtime execution role} to sign the API call for the [MeterUsage] API operation. Long-term \
   access keys are not supported.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   The handling of [MeterUsage] requests varies between Amazon Bedrock AgentCore Runtime and \
   non-Amazon Bedrock AgentCore deployments.\n\
  \   \n\
  \    {ul\n\
  \          {-  For {b non-Amazon Bedrock AgentCore Runtime} deployments, you can only report \
   usage once per hour for each dimension. For AMI-based products, this is per dimension and per \
   EC2 instance. For container products, this is per dimension and per ECS task or EKS pod. You \
   can't modify values after they're recorded. If you report usage before a current hour ends, you \
   will be unable to report additional usage until the next hour begins. The [Timestamp] request \
   parameter is rounded down to the hour and used to enforce this once-per-hour rule for \
   idempotency. For requests that are identical after the [Timestamp] is rounded down, the API is \
   idempotent and returns the metering record ID.\n\
  \              \n\
  \               }\n\
  \          {-  For {b Amazon Bedrock AgentCore Runtime} deployments, you can report usage \
   multiple times per hour for the same dimension. You do not need to aggregate metering records \
   by the hour. You must include an idempotency token in the [ClientToken] request parameter. If \
   using an Amazon SDK or the Amazon Web Services CLI, you must use the latest version which \
   automatically includes an idempotency token in the [ClientToken] request parameter so that the \
   request is processed successfully. The [Timestamp] request parameter is not rounded down to the \
   hour and is not used for duplicate validation. Requests with duplicate [Timestamps] are \
   aggregated as long as the [ClientToken] is unique.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If you submit records more than six hours after events occur, the records won't be accepted. \
   The timestamp in your request determines when an event is recorded.\n\
  \   \n\
  \    You can optionally include multiple usage allocations, to provide customers with usage data \
   split into buckets by tags that you define or allow the customer to define.\n\
  \    \n\
  \     For Amazon Web Services Regions that support [MeterUsage], see \
   {{:https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#meterusage-region-support-ec2}MeterUsage \
   Region support for Amazon EC2} and \
   {{:https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#meterusage-region-support-ecs-eks}MeterUsage \
   Region support for Amazon ECS and Amazon EKS}. \n\
  \     "]

module RegisterUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CustomerNotEntitledException of customer_not_entitled_exception
    | `DisabledApiException of disabled_api_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidProductCodeException of invalid_product_code_exception
    | `InvalidPublicKeyVersionException of invalid_public_key_version_exception
    | `InvalidRegionException of invalid_region_exception
    | `PlatformNotSupportedException of platform_not_supported_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_usage_request ->
    ( register_usage_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CustomerNotEntitledException of customer_not_entitled_exception
      | `DisabledApiException of disabled_api_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidProductCodeException of invalid_product_code_exception
      | `InvalidPublicKeyVersionException of invalid_public_key_version_exception
      | `InvalidRegionException of invalid_region_exception
      | `PlatformNotSupportedException of platform_not_supported_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_usage_request ->
    ( register_usage_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CustomerNotEntitledException of customer_not_entitled_exception
      | `DisabledApiException of disabled_api_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidProductCodeException of invalid_product_code_exception
      | `InvalidPublicKeyVersionException of invalid_public_key_version_exception
      | `InvalidRegionException of invalid_region_exception
      | `PlatformNotSupportedException of platform_not_supported_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Paid container software products sold through Amazon Web Services Marketplace must integrate \
   with the Amazon Web Services Marketplace Metering Service and call the [RegisterUsage] \
   operation for software entitlement and metering. Free and BYOL products for Amazon ECS or \
   Amazon EKS aren't required to call [RegisterUsage], but you may choose to do so if you would \
   like to receive usage data in your seller reports. The sections below explain the behavior of \
   [RegisterUsage]. [RegisterUsage] performs two primary functions: metering and entitlement.\n\n\
  \ {ul\n\
  \       {-   {i Entitlement}: [RegisterUsage] allows you to verify that the customer running \
   your paid software is subscribed to your product on Amazon Web Services Marketplace, enabling \
   you to guard against unauthorized use. Your container image that integrates with \
   [RegisterUsage] is only required to guard against unauthorized use at container startup, as \
   such a [CustomerNotSubscribedException] or [PlatformNotSupportedException] will only be thrown \
   on the initial call to [RegisterUsage]. Subsequent calls from the same Amazon ECS task instance \
   (e.g. task-id) or Amazon EKS pod will not throw a [CustomerNotSubscribedException], even if the \
   customer unsubscribes while the Amazon ECS task or Amazon EKS pod is still running.\n\
  \           \n\
  \            }\n\
  \       {-   {i Metering}: [RegisterUsage] meters software use per ECS task, per hour, or per \
   pod for Amazon EKS with usage prorated to the second. A minimum of 1 minute of usage applies to \
   tasks that are short lived. For example, if a customer has a 10 node Amazon ECS or Amazon EKS \
   cluster and a service configured as a Daemon Set, then Amazon ECS or Amazon EKS will launch a \
   task on all 10 cluster nodes and the customer will be charged for 10 tasks. Software metering \
   is handled by the Amazon Web Services Marketplace metering control plane\226\128\148your \
   software is not required to perform metering-specific actions other than to call \
   [RegisterUsage] to commence metering. The Amazon Web Services Marketplace metering control \
   plane will also bill customers for running ECS tasks and Amazon EKS pods, regardless of the \
   customer's subscription state, which removes the need for your software to run entitlement \
   checks at runtime. For containers, [RegisterUsage] should be called immediately at launch. If \
   you don\226\128\153t register the container within the first 6 hours of the launch, Amazon Web \
   Services Marketplace Metering Service doesn\226\128\153t provide any metering guarantees for \
   previous months. Metering will continue, however, for the current month forward until the \
   container ends. [RegisterUsage] is for metering paid hourly container products.\n\
  \           \n\
  \            For Amazon Web Services Regions that support [RegisterUsage], see \
   {{:https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#registerusage-region-support}RegisterUsage \
   Region support}. \n\
  \            \n\
  \             }\n\
  \       }\n\
  \  "]

(** {1:Serialization and Deserialization} *)
module ResolveCustomer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DisabledApiException of disabled_api_exception
    | `ExpiredTokenException of expired_token_exception
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidTokenException of invalid_token_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resolve_customer_request ->
    ( resolve_customer_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DisabledApiException of disabled_api_exception
      | `ExpiredTokenException of expired_token_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidTokenException of invalid_token_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resolve_customer_request ->
    ( resolve_customer_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DisabledApiException of disabled_api_exception
      | `ExpiredTokenException of expired_token_exception
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidTokenException of invalid_token_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [ResolveCustomer] is called by a SaaS application during the registration process. When a \
   buyer visits your website during the registration process, the buyer submits a registration \
   token through their browser. The registration token is resolved through this API to obtain a \
   [CustomerIdentifier] along with the [CustomerAWSAccountId], [ProductCode], and [LicenseArn].\n\n\
  \  To successfully resolve the token, the API must be called from the account that was used to \
   publish the SaaS application. For an example of using [ResolveCustomer], see \
   {{:https://docs.aws.amazon.com/marketplace/latest/userguide/saas-code-examples.html#saas-resolvecustomer-example} \
   ResolveCustomer code example} in the {i Amazon Web Services Marketplace Seller Guide}.\n\
  \  \n\
  \    Permission is required for this operation. Your IAM role or user performing this operation \
   requires a policy to allow the [aws-marketplace:ResolveCustomer] action. For more information, \
   see \
   {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsmarketplacemeteringservice.html}Actions, \
   resources, and condition keys for Amazon Web Services Marketplace Metering Service} in the {i \
   Service Authorization Reference}.\n\
  \    \n\
  \     For Amazon Web Services Regions that support [ResolveCustomer], see \
   {{:https://docs.aws.amazon.com/marketplace/latest/APIReference/metering-regions.html#resolvecustomer-region-support}ResolveCustomer \
   Region support}. \n\
  \     "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
