open Types

val make_resolve_customer_request :
  registration_token:non_empty_string -> unit -> resolve_customer_request

val make_register_usage_request :
  ?nonce:nonce ->
  product_code:product_code ->
  public_key_version:version_integer ->
  unit ->
  register_usage_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_usage_allocation :
  ?tags:tag_list -> allocated_usage_quantity:allocated_usage_quantity -> unit -> usage_allocation

val make_meter_usage_request :
  ?usage_quantity:usage_quantity ->
  ?dry_run:boolean_ ->
  ?usage_allocations:usage_allocations ->
  ?client_token:client_token ->
  product_code:product_code ->
  timestamp:timestamp ->
  usage_dimension:usage_dimension ->
  unit ->
  meter_usage_request

val make_usage_record :
  ?customer_identifier:customer_identifier ->
  ?quantity:usage_quantity ->
  ?usage_allocations:usage_allocations ->
  ?customer_aws_account_id:customer_aws_account_id ->
  ?license_arn:license_arn ->
  timestamp:timestamp ->
  dimension:usage_dimension ->
  unit ->
  usage_record

val make_batch_meter_usage_request :
  ?product_code:product_code -> usage_records:usage_record_list -> unit -> batch_meter_usage_request
