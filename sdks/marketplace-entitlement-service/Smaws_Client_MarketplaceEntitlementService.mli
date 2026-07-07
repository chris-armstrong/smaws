(** Marketplace Entitlement Service client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_entitlement_value :
  ?string_value:string_ ->
  ?boolean_value:boolean_ ->
  ?double_value:double ->
  ?integer_value:integer ->
  unit ->
  entitlement_value

val make_entitlement :
  ?license_arn:string_ ->
  ?expiration_date:timestamp ->
  ?value:entitlement_value ->
  ?customer_aws_account_id:non_empty_string ->
  ?customer_identifier:non_empty_string ->
  ?dimension:non_empty_string ->
  ?product_code:product_code ->
  unit ->
  entitlement

val make_get_entitlements_request :
  ?max_results:page_size_integer ->
  ?next_token:non_empty_string ->
  ?filter:get_entitlement_filters ->
  product_code:product_code ->
  unit ->
  get_entitlements_request
(** {1:operations Operations} *)

(** {1:Serialization and Deserialization} *)
module GetEntitlements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceErrorException of internal_service_error_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_entitlements_request ->
    ( get_entitlements_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_entitlements_request ->
    ( get_entitlements_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceErrorException of internal_service_error_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "GetEntitlements retrieves entitlement values for a given product. The results can be filtered \
   based on customer identifier, AWS account ID, license ARN, or product dimensions.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
