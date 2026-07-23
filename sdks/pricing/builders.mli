open Types

val make_price_list :
  ?price_list_arn:price_list_arn ->
  ?region_code:region_code ->
  ?currency_code:currency_code ->
  ?file_formats:file_formats ->
  unit ->
  price_list

val make_list_price_lists_response :
  ?price_lists:price_lists -> ?next_token:string_ -> unit -> list_price_lists_response

val make_list_price_lists_request :
  ?region_code:region_code ->
  ?next_token:string_ ->
  ?max_results:max_results ->
  service_code:service_code ->
  effective_date:effective_date ->
  currency_code:currency_code ->
  unit ->
  list_price_lists_request

val make_get_products_response :
  ?format_version:format_version ->
  ?price_list:price_list_json_items ->
  ?next_token:string_ ->
  unit ->
  get_products_response

val make_filter : type_:filter_type -> field:field -> value:value -> unit -> filter

val make_get_products_request :
  ?filters:filters ->
  ?format_version:format_version ->
  ?next_token:string_ ->
  ?max_results:get_products_max_results ->
  service_code:string_ ->
  unit ->
  get_products_request

val make_get_price_list_file_url_response : ?url:string_ -> unit -> get_price_list_file_url_response

val make_get_price_list_file_url_request :
  price_list_arn:price_list_arn ->
  file_format:file_format ->
  unit ->
  get_price_list_file_url_request

val make_attribute_value : ?value:string_ -> unit -> attribute_value

val make_get_attribute_values_response :
  ?attribute_values:attribute_value_list ->
  ?next_token:string_ ->
  unit ->
  get_attribute_values_response

val make_get_attribute_values_request :
  ?next_token:string_ ->
  ?max_results:get_attribute_values_max_results ->
  service_code:string_ ->
  attribute_name:string_ ->
  unit ->
  get_attribute_values_request

val make_service : ?attribute_names:attribute_name_list -> service_code:string_ -> unit -> service

val make_describe_services_response :
  ?services:service_list ->
  ?format_version:format_version ->
  ?next_token:string_ ->
  unit ->
  describe_services_response

val make_describe_services_request :
  ?service_code:string_ ->
  ?format_version:format_version ->
  ?next_token:string_ ->
  ?max_results:describe_services_max_results ->
  unit ->
  describe_services_request
