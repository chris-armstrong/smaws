open Types

val make_entitlement_value :
  ?integer_value:integer ->
  ?double_value:double ->
  ?boolean_value:boolean_ ->
  ?string_value:string_ ->
  unit ->
  entitlement_value

val make_entitlement :
  ?product_code:product_code ->
  ?dimension:non_empty_string ->
  ?customer_identifier:non_empty_string ->
  ?customer_aws_account_id:non_empty_string ->
  ?value:entitlement_value ->
  ?expiration_date:timestamp ->
  ?license_arn:string_ ->
  unit ->
  entitlement

val make_get_entitlements_request :
  ?filter:get_entitlement_filters ->
  ?next_token:non_empty_string ->
  ?max_results:page_size_integer ->
  product_code:product_code ->
  unit ->
  get_entitlements_request
