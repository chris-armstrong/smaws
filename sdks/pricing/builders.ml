open Types

let make_service ?attribute_names:(attribute_names_ : attribute_name_list option)
    ~service_code:(service_code_ : string_) () =
  ({ attribute_names = attribute_names_; service_code = service_code_ } : service)

let make_price_list ?file_formats:(file_formats_ : file_formats option)
    ?currency_code:(currency_code_ : currency_code option)
    ?region_code:(region_code_ : region_code option)
    ?price_list_arn:(price_list_arn_ : price_list_arn option) () =
  ({
     file_formats = file_formats_;
     currency_code = currency_code_;
     region_code = region_code_;
     price_list_arn = price_list_arn_;
   }
    : price_list)

let make_list_price_lists_response ?next_token:(next_token_ : string_ option)
    ?price_lists:(price_lists_ : price_lists option) () =
  ({ next_token = next_token_; price_lists = price_lists_ } : list_price_lists_response)

let make_list_price_lists_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : string_ option) ?region_code:(region_code_ : region_code option)
    ~currency_code:(currency_code_ : currency_code)
    ~effective_date:(effective_date_ : effective_date) ~service_code:(service_code_ : service_code)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     currency_code = currency_code_;
     region_code = region_code_;
     effective_date = effective_date_;
     service_code = service_code_;
   }
    : list_price_lists_request)

let make_get_products_response ?next_token:(next_token_ : string_ option)
    ?price_list:(price_list_ : price_list_json_items option)
    ?format_version:(format_version_ : format_version option) () =
  ({ next_token = next_token_; price_list = price_list_; format_version = format_version_ }
    : get_products_response)

let make_filter ~value:(value_ : value) ~field:(field_ : field) ~type_:(type__ : filter_type) () =
  ({ value = value_; field = field_; type_ = type__ } : filter)

let make_get_products_request ?max_results:(max_results_ : get_products_max_results option)
    ?next_token:(next_token_ : string_ option)
    ?format_version:(format_version_ : format_version option) ?filters:(filters_ : filters option)
    ~service_code:(service_code_ : string_) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     format_version = format_version_;
     filters = filters_;
     service_code = service_code_;
   }
    : get_products_request)

let make_get_price_list_file_url_response ?url:(url_ : string_ option) () =
  ({ url = url_ } : get_price_list_file_url_response)

let make_get_price_list_file_url_request ~file_format:(file_format_ : file_format)
    ~price_list_arn:(price_list_arn_ : price_list_arn) () =
  ({ file_format = file_format_; price_list_arn = price_list_arn_ }
    : get_price_list_file_url_request)

let make_attribute_value ?value:(value_ : string_ option) () =
  ({ value = value_ } : attribute_value)

let make_get_attribute_values_response ?next_token:(next_token_ : string_ option)
    ?attribute_values:(attribute_values_ : attribute_value_list option) () =
  ({ next_token = next_token_; attribute_values = attribute_values_ }
    : get_attribute_values_response)

let make_get_attribute_values_request
    ?max_results:(max_results_ : get_attribute_values_max_results option)
    ?next_token:(next_token_ : string_ option) ~attribute_name:(attribute_name_ : string_)
    ~service_code:(service_code_ : string_) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     attribute_name = attribute_name_;
     service_code = service_code_;
   }
    : get_attribute_values_request)

let make_describe_services_response ?next_token:(next_token_ : string_ option)
    ?format_version:(format_version_ : format_version option)
    ?services:(services_ : service_list option) () =
  ({ next_token = next_token_; format_version = format_version_; services = services_ }
    : describe_services_response)

let make_describe_services_request
    ?max_results:(max_results_ : describe_services_max_results option)
    ?next_token:(next_token_ : string_ option)
    ?format_version:(format_version_ : format_version option)
    ?service_code:(service_code_ : string_ option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     format_version = format_version_;
     service_code = service_code_;
   }
    : describe_services_request)
