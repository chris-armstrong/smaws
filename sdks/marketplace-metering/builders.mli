open Types

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
