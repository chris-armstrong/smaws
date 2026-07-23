type nonrec error_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You've made too many requests exceeding service quotas. \n"]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested resource can't be found.\n"]

type nonrec not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested resource can't be found.\n"]

type nonrec invalid_parameter_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "One or more parameters had an invalid value.\n"]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The pagination token is invalid. Try again without a pagination token.\n"]

type nonrec internal_error_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An error on the server occurred during the processing of your request. Try again later.\n"]

type nonrec expired_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The pagination token expired. Try again without a pagination token.\n"]

type nonrec access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "General authentication failure. The request wasn't signed correctly.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec file_format = string [@@ocaml.doc ""]

type nonrec file_formats = file_format list [@@ocaml.doc ""]

type nonrec currency_code = string [@@ocaml.doc ""]

type nonrec region_code = string [@@ocaml.doc ""]

type nonrec price_list_arn = string [@@ocaml.doc ""]

type nonrec price_list = {
  price_list_arn : price_list_arn option;
      [@ocaml.doc
        "The unique identifier that maps to where your Price List files are located. \
         [PriceListArn] can be obtained from the \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html} \
         [ListPriceList] } response. \n"]
  region_code : region_code option;
      [@ocaml.doc
        "This is used to filter the Price List by Amazon Web Services Region. For example, to get \
         the price list only for the [US East (N. Virginia)] Region, use [us-east-1]. If nothing \
         is specified, you retrieve price lists for all applicable Regions. The available \
         [RegionCode] list can be retrieved from \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_GetAttributeValues.html} \
         [GetAttributeValues] } API. \n"]
  currency_code : currency_code option;
      [@ocaml.doc
        "The three alphabetical character ISO-4217 currency code the Price List files are \
         denominated in. \n"]
  file_formats : file_formats option;
      [@ocaml.doc
        "The format you want to retrieve your Price List files. The [FileFormat] can be obtained \
         from the \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html} \
         [ListPriceList] } response. \n"]
}
[@@ocaml.doc
  " {i  {b This feature is in preview release and is subject to change. Your use of Amazon Web \
   Services Price List API is subject to the Beta Service Participation terms of the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Section 1.10).} } \
   \n\n\
  \ This is the type of price list references that match your request. \n\
  \ "]

type nonrec price_lists = price_list list [@@ocaml.doc ""]

type nonrec list_price_lists_response = {
  price_lists : price_lists option;
      [@ocaml.doc "The type of price list references that match your request. \n"]
  next_token : string_ option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve. \n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec effective_date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec service_code = string [@@ocaml.doc ""]

type nonrec list_price_lists_request = {
  service_code : service_code;
      [@ocaml.doc
        "The service code or the Savings Plans service code for the attributes that you want to \
         retrieve. For example, to get the list of applicable Amazon EC2 price lists, use \
         [AmazonEC2]. For a full list of service codes containing On-Demand and Reserved Instance \
         (RI) pricing, use the \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_DescribeServices.html#awscostmanagement-pricing_DescribeServices-request-FormatVersion}DescribeServices} \
         API.\n\n\
        \ To retrieve the Reserved Instance and Compute Savings Plans price lists, use \
         [ComputeSavingsPlans]. \n\
        \ \n\
        \  To retrieve Machine Learning Savings Plans price lists, use \
         [MachineLearningSavingsPlans]. \n\
        \  "]
  effective_date : effective_date;
      [@ocaml.doc "The date that the Price List file prices are effective from. \n"]
  region_code : region_code option;
      [@ocaml.doc
        "This is used to filter the Price List by Amazon Web Services Region. For example, to get \
         the price list only for the [US East (N. Virginia)] Region, use [us-east-1]. If nothing \
         is specified, you retrieve price lists for all applicable Regions. The available \
         [RegionCode] list can be retrieved from \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_GetAttributeValues.html}GetAttributeValues} \
         API.\n"]
  currency_code : currency_code;
      [@ocaml.doc
        "The three alphabetical character ISO-4217 currency code that the Price List files are \
         denominated in. \n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve. \n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response. \n"]
}
[@@ocaml.doc ""]

type nonrec synthesized_json_price_list_json_item = string [@@ocaml.doc ""]

type nonrec price_list_json_items = synthesized_json_price_list_json_item list [@@ocaml.doc ""]

type nonrec format_version = string [@@ocaml.doc ""]

type nonrec get_products_response = {
  format_version : format_version option;
      [@ocaml.doc "The format version of the response. For example, aws_v1.\n"]
  price_list : price_list_json_items option;
      [@ocaml.doc
        "The list of products that match your filters. The list contains both the product metadata \
         and the price information.\n"]
  next_token : string_ option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_products_max_results = int [@@ocaml.doc ""]

type nonrec value = string [@@ocaml.doc ""]

type nonrec field = string [@@ocaml.doc ""]

type nonrec filter_type =
  | TERM_MATCH [@ocaml.doc ""]
  | EQUALS [@ocaml.doc ""]
  | CONTAINS [@ocaml.doc ""]
  | ANY_OF [@ocaml.doc ""]
  | NONE_OF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter = {
  type_ : filter_type;
      [@ocaml.doc
        "The type of filter that you want to use.\n\n\
        \ Valid values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [TERM_MATCH]: Returns only products that match both the given filter field \
         and the given value.\n\
        \            \n\
        \             }\n\
        \        {-   [EQUALS]: Returns products that have a field value exactly matching the \
         provided value.\n\
        \            \n\
        \             }\n\
        \        {-   [CONTAINS]: Returns products where the field value contains the provided \
         value as a substring.\n\
        \            \n\
        \             }\n\
        \        {-   [ANY_OF]: Returns products where the field value is any of the provided \
         values.\n\
        \            \n\
        \             }\n\
        \        {-   [NONE_OF]: Returns products where the field value is not any of the provided \
         values.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  field : field;
      [@ocaml.doc
        "The product metadata field that you want to filter on. You can filter by just the service \
         code to see all products for a specific service, filter by just the attribute name to see \
         a specific attribute for multiple services, or use both a service code and an attribute \
         name to retrieve only products that match both fields.\n\n\
        \ Valid values include: [ServiceCode], and all attribute names\n\
        \ \n\
        \  For example, you can filter by the [AmazonEC2] service code and the [volumeType] \
         attribute name to get the prices for only Amazon EC2 volumes.\n\
        \  "]
  value : value;
      [@ocaml.doc
        "The service code or attribute value that you want to filter by. If you're filtering by \
         service code this is the actual service code, such as [AmazonEC2]. If you're filtering by \
         attribute name, this is the attribute value that you want the returned products to match, \
         such as a [Provisioned IOPS] volume.\n"]
}
[@@ocaml.doc "The constraints that you want all returned products to match.\n"]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec get_products_request = {
  service_code : string_;
      [@ocaml.doc "The code for the service whose products you want to retrieve. \n"]
  filters : filters option;
      [@ocaml.doc
        "The list of filters that limit the returned products. only products that match all \
         filters are returned.\n"]
  format_version : format_version option;
      [@ocaml.doc
        "The format version that you want the response to be in.\n\n Valid values are: [aws_v1] \n "]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
  max_results : get_products_max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
}
[@@ocaml.doc ""]

type nonrec get_price_list_file_url_response = {
  url : string_ option; [@ocaml.doc "The URL to download your Price List file from. \n"]
}
[@@ocaml.doc ""]

type nonrec get_price_list_file_url_request = {
  price_list_arn : price_list_arn;
      [@ocaml.doc
        "The unique identifier that maps to where your Price List files are located. \
         [PriceListArn] can be obtained from the \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html}ListPriceLists} \
         response. \n"]
  file_format : file_format;
      [@ocaml.doc
        "The format that you want to retrieve your Price List files in. The [FileFormat] can be \
         obtained from the \
         {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html}ListPriceLists} \
         response. \n"]
}
[@@ocaml.doc ""]

type nonrec attribute_value = {
  value : string_ option; [@ocaml.doc "The specific value of an [attributeName].\n"]
}
[@@ocaml.doc
  "The values of a given attribute, such as [Throughput Optimized HDD] or [Provisioned IOPS] for \
   the [Amazon EC2] [volumeType] attribute.\n"]

type nonrec attribute_value_list = attribute_value list [@@ocaml.doc ""]

type nonrec get_attribute_values_response = {
  attribute_values : attribute_value_list option;
      [@ocaml.doc
        "The list of values for an attribute. For example, [Throughput Optimized HDD] and \
         [Provisioned IOPS] are two available values for the [AmazonEC2] [volumeType].\n"]
  next_token : string_ option;
      [@ocaml.doc "The pagination token that indicates the next set of results to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec get_attribute_values_max_results = int [@@ocaml.doc ""]

type nonrec get_attribute_values_request = {
  service_code : string_;
      [@ocaml.doc
        "The service code for the service whose attributes you want to retrieve. For example, if \
         you want the retrieve an EC2 attribute, use [AmazonEC2].\n"]
  attribute_name : string_;
      [@ocaml.doc
        "The name of the attribute that you want to retrieve the values for, such as [volumeType].\n"]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
  max_results : get_attribute_values_max_results option;
      [@ocaml.doc "The maximum number of results to return in response.\n"]
}
[@@ocaml.doc ""]

type nonrec attribute_name_list = string_ list [@@ocaml.doc ""]

type nonrec service = {
  service_code : string_; [@ocaml.doc "The code for the Amazon Web Services service.\n"]
  attribute_names : attribute_name_list option;
      [@ocaml.doc "The attributes that are available for this service.\n"]
}
[@@ocaml.doc
  "The metadata for a service, such as the service code and available attribute names.\n"]

type nonrec service_list = service list [@@ocaml.doc ""]

type nonrec describe_services_response = {
  services : service_list option;
      [@ocaml.doc "The service metadata for the service or services in the response.\n"]
  format_version : format_version option;
      [@ocaml.doc "The format version of the response. For example, [aws_v1].\n"]
  next_token : string_ option;
      [@ocaml.doc "The pagination token for the next set of retrievable results.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_services_max_results = int [@@ocaml.doc ""]

type nonrec describe_services_request = {
  service_code : string_ option;
      [@ocaml.doc
        "The code for the service whose information you want to retrieve, such as [AmazonEC2]. You \
         can use the [ServiceCode] to filter the results in a [GetProducts] call. To retrieve a \
         list of all services, leave this blank.\n"]
  format_version : format_version option;
      [@ocaml.doc
        "The format version that you want the response to be in.\n\n Valid values are: [aws_v1] \n "]
  next_token : string_ option;
      [@ocaml.doc
        "The pagination token that indicates the next set of results that you want to retrieve.\n"]
  max_results : describe_services_max_results option;
      [@ocaml.doc "The maximum number of results that you want returned in the response.\n"]
}
[@@ocaml.doc ""]
