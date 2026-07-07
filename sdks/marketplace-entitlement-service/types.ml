type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The calls to the GetEntitlements API are throttled.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec product_code = string [@@ocaml.doc ""]

type nonrec page_size_integer = int [@@ocaml.doc ""]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec invalid_parameter_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "One or more parameters in your request was invalid.\n"]

type nonrec internal_service_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An internal error has occurred. Retry your request. If the problem persists, post a message \
   with details on the AWS forums.\n"]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec entitlement_value = {
  string_value : string_ option;
      [@ocaml.doc
        "The StringValue field will be populated with a string value when the entitlement is a \
         string type. Otherwise, the field will not be set.\n"]
  boolean_value : boolean_ option;
      [@ocaml.doc
        "The BooleanValue field will be populated with a boolean value when the entitlement is a \
         boolean type. Otherwise, the field will not be set.\n"]
  double_value : double option;
      [@ocaml.doc
        "The DoubleValue field will be populated with a double value when the entitlement is a \
         double type. Otherwise, the field will not be set.\n"]
  integer_value : integer option;
      [@ocaml.doc
        "The IntegerValue field will be populated with an integer value when the entitlement is an \
         integer type. Otherwise, the field will not be set.\n"]
}
[@@ocaml.doc
  "The EntitlementValue represents the amount of capacity that the customer is entitled to for the \
   product.\n"]

type nonrec entitlement = {
  license_arn : string_ option;
      [@ocaml.doc
        "The [LicenseArn] is a unique identifier for a specific granted license. These are used \
         for software purchased through AWS Marketplace.\n"]
  expiration_date : timestamp option;
      [@ocaml.doc
        "The expiration date represents the minimum date through which this entitlement is \
         expected to remain valid. For contractual products listed on AWS Marketplace, the \
         expiration date is the date at which the customer will renew or cancel their contract. \
         Customers who are opting to renew their contract will still have entitlements with an \
         expiration date.\n"]
  value : entitlement_value option;
      [@ocaml.doc
        "The EntitlementValue represents the amount of capacity that the customer is entitled to \
         for the product.\n"]
  customer_aws_account_id : non_empty_string option;
      [@ocaml.doc
        " The [CustomerAWSAccountId] parameter specifies the AWS account ID of the buyer. \n"]
  customer_identifier : non_empty_string option;
      [@ocaml.doc
        "The customer identifier is a handle to each unique customer in an application. Customer \
         identifiers are obtained through the ResolveCustomer operation in AWS Marketplace \
         Metering Service.\n"]
  dimension : non_empty_string option;
      [@ocaml.doc
        "The dimension for which the given entitlement applies. Dimensions represent categories of \
         capacity in a product and are specified when the product is listed in AWS Marketplace.\n"]
  product_code : product_code option;
      [@ocaml.doc
        "The product code for which the given entitlement applies. Product codes are provided by \
         AWS Marketplace when the product listing is created.\n"]
}
[@@ocaml.doc
  "An entitlement represents capacity in a product owned by the customer. For example, a customer \
   might own some number of users or seats in an SaaS application or some amount of data capacity \
   in a multi-tenant database.\n"]

type nonrec entitlement_list = entitlement list [@@ocaml.doc ""]

type nonrec get_entitlements_result = {
  next_token : non_empty_string option;
      [@ocaml.doc
        "For paginated results, use NextToken in subsequent calls to GetEntitlements. If the \
         result contains an empty set of entitlements, NextToken might still be present and should \
         be used.\n"]
  entitlements : entitlement_list option;
      [@ocaml.doc
        "The set of entitlements found through the GetEntitlements operation. If the result \
         contains an empty set of entitlements, NextToken might still be present and should be \
         used.\n"]
}
[@@ocaml.doc "The GetEntitlementsRequest contains results from the GetEntitlements operation.\n"]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_value_list = filter_value list [@@ocaml.doc ""]

type nonrec get_entitlement_filter_name =
  | LICENSE_ARN [@ocaml.doc ""]
  | CUSTOMER_AWS_ACCOUNT_ID [@ocaml.doc ""]
  | DIMENSION [@ocaml.doc ""]
  | CUSTOMER_IDENTIFIER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_entitlement_filters = (get_entitlement_filter_name * filter_value_list) list
[@@ocaml.doc ""]

type nonrec get_entitlements_request = {
  max_results : page_size_integer option;
      [@ocaml.doc
        "The maximum number of items to retrieve from the GetEntitlements operation. For \
         pagination, use the NextToken field in subsequent calls to GetEntitlements.\n"]
  next_token : non_empty_string option;
      [@ocaml.doc
        "For paginated calls to GetEntitlements, pass the NextToken from the previous \
         GetEntitlementsResult.\n"]
  filter : get_entitlement_filters option;
      [@ocaml.doc
        "Filter is used to return entitlements for a specific customer or for a specific \
         dimension. Filters are described as keys mapped to a lists of values. Filtered requests \
         are {i unioned} for each value in the value list, and then {i intersected} for each \
         filter key.\n\n\
        \  [CustomerIdentifier] and [CustomerAWSAccountId] are mutually exclusive parameters. You \
         must use one or the other, but not both in the same request. \n\
        \ \n\
        \   If you're migrating an existing integration, use \
         {{:https://docs.aws.amazon.com/marketplace/latest/userguide/data-feed-account.html}Account \
         Feeds} to map [CustomerIdentifier] to [CustomerAWSAccountId], and \
         {{:https://docs.aws.amazon.com/marketplace/latest/userguide/data-feed-agreements.html}Agreements \
         Feeds} to map [CustomerAWSAccountId] and [LicenseArn].\n\
        \   \n\
        \    "]
  product_code : product_code;
      [@ocaml.doc
        "Product code is used to uniquely identify a product in AWS Marketplace. The product code \
         will be provided by AWS Marketplace when the product listing is created.\n"]
}
[@@ocaml.doc "The GetEntitlementsRequest contains parameters for the GetEntitlements operation.\n"]
