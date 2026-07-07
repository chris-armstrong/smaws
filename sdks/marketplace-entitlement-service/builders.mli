open Types

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
