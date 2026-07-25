open Types

let make_price_list ?price_list_arn:(price_list_arn_ : price_list_arn option)
    ?region_code:(region_code_ : region_code option)
    ?currency_code:(currency_code_ : currency_code option)
    ?file_formats:(file_formats_ : file_formats option) () =
  ({
     price_list_arn = price_list_arn_;
     region_code = region_code_;
     currency_code = currency_code_;
     file_formats = file_formats_;
   }
    : price_list)

let make_list_price_lists_response ?price_lists:(price_lists_ : price_lists option)
    ?next_token:(next_token_ : string_ option) () =
  ({ price_lists = price_lists_; next_token = next_token_ } : list_price_lists_response)

let make_list_price_lists_request ?region_code:(region_code_ : region_code option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : max_results option)
    ~service_code:(service_code_ : service_code) ~effective_date:(effective_date_ : effective_date)
    ~currency_code:(currency_code_ : currency_code) () =
  ({
     service_code = service_code_;
     effective_date = effective_date_;
     region_code = region_code_;
     currency_code = currency_code_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_price_lists_request)

let make_get_products_response ?format_version:(format_version_ : format_version option)
    ?price_list:(price_list_ : price_list_json_items option)
    ?next_token:(next_token_ : string_ option) () =
  ({ format_version = format_version_; price_list = price_list_; next_token = next_token_ }
    : get_products_response)

let make_filter ~type_:(type__ : filter_type) ~field:(field_ : field) ~value:(value_ : value) () =
  ({ type_ = type__; field = field_; value = value_ } : filter)

let make_get_products_request ?filters:(filters_ : filters option)
    ?format_version:(format_version_ : format_version option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : get_products_max_results option)
    ~service_code:(service_code_ : string_) () =
  ({
     service_code = service_code_;
     filters = filters_;
     format_version = format_version_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_products_request)

let make_get_price_list_file_url_response ?url:(url_ : string_ option) () =
  ({ url = url_ } : get_price_list_file_url_response)

let make_get_price_list_file_url_request ~price_list_arn:(price_list_arn_ : price_list_arn)
    ~file_format:(file_format_ : file_format) () =
  ({ price_list_arn = price_list_arn_; file_format = file_format_ }
    : get_price_list_file_url_request)

let make_attribute_value ?value:(value_ : string_ option) () =
  ({ value = value_ } : attribute_value)

let make_get_attribute_values_response
    ?attribute_values:(attribute_values_ : attribute_value_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ attribute_values = attribute_values_; next_token = next_token_ }
    : get_attribute_values_response)

let make_get_attribute_values_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : get_attribute_values_max_results option)
    ~service_code:(service_code_ : string_) ~attribute_name:(attribute_name_ : string_) () =
  ({
     service_code = service_code_;
     attribute_name = attribute_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_attribute_values_request)

let make_service ?attribute_names:(attribute_names_ : attribute_name_list option)
    ~service_code:(service_code_ : string_) () =
  ({ service_code = service_code_; attribute_names = attribute_names_ } : service)

let make_describe_services_response ?services:(services_ : service_list option)
    ?format_version:(format_version_ : format_version option)
    ?next_token:(next_token_ : string_ option) () =
  ({ services = services_; format_version = format_version_; next_token = next_token_ }
    : describe_services_response)

let make_describe_services_request ?service_code:(service_code_ : string_ option)
    ?format_version:(format_version_ : format_version option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : describe_services_max_results option) () =
  ({
     service_code = service_code_;
     format_version = format_version_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_services_request)
