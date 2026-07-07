open Types

module DescribeServices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_services_request ->
    ( describe_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_services_request ->
    ( describe_services_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the metadata for one service or a list of the metadata for all services. Use this \
   without a service code to get the service codes for all services. Use it with a service code, \
   such as [AmazonEC2], to get information specific to that service, such as the attribute names \
   available for that service. For example, some of the attribute names available for EC2 are \
   [volumeType], [maxIopsVolume], [operation], [locationType], and [instanceCapacity10xlarge].\n"]

module GetAttributeValues : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_attribute_values_request ->
    ( get_attribute_values_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_attribute_values_request ->
    ( get_attribute_values_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of attribute values. Attributes are similar to the details in a Price List API \
   offer file. For a list of available attributes, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/reading-an-offer.html#pps-defs}Offer \
   File Definitions} in the \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html}Billing \
   and Cost Management User Guide}.\n"]

module GetPriceListFileUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_price_list_file_url_request ->
    ( get_price_list_file_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_price_list_file_url_request ->
    ( get_price_list_file_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {i  {b This feature is in preview release and is subject to change. Your use of Amazon Web \
   Services Price List API is subject to the Beta Service Participation terms of the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Section 1.10).} } \
   \n\n\
  \ This returns the URL that you can retrieve your Price List file from. This URL is based on the \
   [PriceListArn] and [FileFormat] that you retrieve from the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html}ListPriceLists} \
   response. \n\
  \ "]

module GetProducts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_products_request ->
    ( get_products_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_products_request ->
    ( get_products_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of all products that match the filter criteria.\n"]

module ListPriceLists : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ExpiredNextTokenException of expired_next_token_exception
    | `InternalErrorException of internal_error_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NotFoundException of not_found_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_price_lists_request ->
    ( list_price_lists_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_price_lists_request ->
    ( list_price_lists_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ExpiredNextTokenException of expired_next_token_exception
      | `InternalErrorException of internal_error_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NotFoundException of not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {i  {b This feature is in preview release and is subject to change. Your use of Amazon Web \
   Services Price List API is subject to the Beta Service Participation terms of the \
   {{:https://aws.amazon.com/service-terms/}Amazon Web Services Service Terms} (Section 1.10).} } \
   \n\n\
  \ This returns a list of Price List references that the requester if authorized to view, given a \
   [ServiceCode], [CurrencyCode], and an [EffectiveDate]. Use without a [RegionCode] filter to \
   list Price List references from all available Amazon Web Services Regions. Use with a \
   [RegionCode] filter to get the Price List reference that's specific to a specific Amazon Web \
   Services Region. You can use the [PriceListArn] from the response to get your preferred Price \
   List files through the \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_GetPriceListFileUrl.html}GetPriceListFileUrl} \
   API.\n\
  \ "]
