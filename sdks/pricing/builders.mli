open Types

val make_service : ?attribute_names:attribute_name_list -> service_code:string_ -> unit -> service

val make_price_list :
  ?file_formats:file_formats ->
  ?currency_code:currency_code ->
  ?region_code:region_code ->
  ?price_list_arn:price_list_arn ->
  unit ->
  price_list

val make_list_price_lists_response :
  ?next_token:string_ -> ?price_lists:price_lists -> unit -> list_price_lists_response

val make_list_price_lists_request :
  ?max_results:max_results ->
  ?next_token:string_ ->
  ?region_code:region_code ->
  currency_code:currency_code ->
  effective_date:effective_date ->
  service_code:service_code ->
  unit ->
  list_price_lists_request

val make_get_products_response :
  ?next_token:string_ ->
  ?price_list:price_list_json_items ->
  ?format_version:format_version ->
  unit ->
  get_products_response

val make_filter : value:value -> field:field -> type_:filter_type -> unit -> filter

val make_get_products_request :
  ?max_results:get_products_max_results ->
  ?next_token:string_ ->
  ?format_version:format_version ->
  ?filters:filters ->
  service_code:string_ ->
  unit ->
  get_products_request

val make_get_price_list_file_url_response : ?url:string_ -> unit -> get_price_list_file_url_response

val make_get_price_list_file_url_request :
  file_format:file_format ->
  price_list_arn:price_list_arn ->
  unit ->
  get_price_list_file_url_request

val make_attribute_value : ?value:string_ -> unit -> attribute_value

val make_get_attribute_values_response :
  ?next_token:string_ ->
  ?attribute_values:attribute_value_list ->
  unit ->
  get_attribute_values_response

val make_get_attribute_values_request :
  ?max_results:get_attribute_values_max_results ->
  ?next_token:string_ ->
  attribute_name:string_ ->
  service_code:string_ ->
  unit ->
  get_attribute_values_request

val make_describe_services_response :
  ?next_token:string_ ->
  ?format_version:format_version ->
  ?services:service_list ->
  unit ->
  describe_services_response

val make_describe_services_request :
  ?max_results:describe_services_max_results ->
  ?next_token:string_ ->
  ?format_version:format_version ->
  ?service_code:string_ ->
  unit ->
  describe_services_request
