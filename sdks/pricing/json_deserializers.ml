open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : not_found_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_parameter_exception)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_error_exception)

let expired_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : expired_next_token_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let string__of_yojson = string_of_yojson
let file_format_of_yojson = string_of_yojson
let file_formats_of_yojson tree path = list_of_yojson file_format_of_yojson tree path
let currency_code_of_yojson = string_of_yojson
let region_code_of_yojson = string_of_yojson
let price_list_arn_of_yojson = string_of_yojson

let price_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price_list_arn =
       option_of_yojson (value_for_key price_list_arn_of_yojson "PriceListArn") _list path;
     region_code = option_of_yojson (value_for_key region_code_of_yojson "RegionCode") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "CurrencyCode") _list path;
     file_formats = option_of_yojson (value_for_key file_formats_of_yojson "FileFormats") _list path;
   }
    : price_list)

let price_lists_of_yojson tree path = list_of_yojson price_list_of_yojson tree path

let list_price_lists_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price_lists = option_of_yojson (value_for_key price_lists_of_yojson "PriceLists") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_price_lists_response)

let max_results_of_yojson = int_of_yojson
let effective_date_of_yojson = timestamp_epoch_seconds_of_yojson
let service_code_of_yojson = string_of_yojson

let list_price_lists_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
     effective_date = value_for_key effective_date_of_yojson "EffectiveDate" _list path;
     region_code = option_of_yojson (value_for_key region_code_of_yojson "RegionCode") _list path;
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_price_lists_request)

let synthesized_json_price_list_json_item_of_yojson = string_of_yojson

let price_list_json_items_of_yojson tree path =
  list_of_yojson synthesized_json_price_list_json_item_of_yojson tree path

let format_version_of_yojson = string_of_yojson

let get_products_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     format_version =
       option_of_yojson (value_for_key format_version_of_yojson "FormatVersion") _list path;
     price_list =
       option_of_yojson (value_for_key price_list_json_items_of_yojson "PriceList") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : get_products_response)

let get_products_max_results_of_yojson = int_of_yojson
let value_of_yojson = string_of_yojson
let field_of_yojson = string_of_yojson

let filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERM_MATCH" -> TERM_MATCH
    | `String "EQUALS" -> EQUALS
    | `String "CONTAINS" -> CONTAINS
    | `String "ANY_OF" -> ANY_OF
    | `String "NONE_OF" -> NONE_OF
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterType")
     : filter_type)
    : filter_type)

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key filter_type_of_yojson "Type" _list path;
     field = value_for_key field_of_yojson "Field" _list path;
     value = value_for_key value_of_yojson "Value" _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let get_products_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_code = value_for_key string__of_yojson "ServiceCode" _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     format_version =
       option_of_yojson (value_for_key format_version_of_yojson "FormatVersion") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key get_products_max_results_of_yojson "MaxResults") _list path;
   }
    : get_products_request)

let get_price_list_file_url_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ url = option_of_yojson (value_for_key string__of_yojson "Url") _list path }
    : get_price_list_file_url_response)

let get_price_list_file_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price_list_arn = value_for_key price_list_arn_of_yojson "PriceListArn" _list path;
     file_format = value_for_key file_format_of_yojson "FileFormat" _list path;
   }
    : get_price_list_file_url_request)

let attribute_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ value = option_of_yojson (value_for_key string__of_yojson "Value") _list path }
    : attribute_value)

let attribute_value_list_of_yojson tree path = list_of_yojson attribute_value_of_yojson tree path

let get_attribute_values_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_values =
       option_of_yojson (value_for_key attribute_value_list_of_yojson "AttributeValues") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : get_attribute_values_response)

let get_attribute_values_max_results_of_yojson = int_of_yojson

let get_attribute_values_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_code = value_for_key string__of_yojson "ServiceCode" _list path;
     attribute_name = value_for_key string__of_yojson "AttributeName" _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key get_attribute_values_max_results_of_yojson "MaxResults")
         _list path;
   }
    : get_attribute_values_request)

let attribute_name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_code = value_for_key string__of_yojson "ServiceCode" _list path;
     attribute_names =
       option_of_yojson (value_for_key attribute_name_list_of_yojson "AttributeNames") _list path;
   }
    : service)

let service_list_of_yojson tree path = list_of_yojson service_of_yojson tree path

let describe_services_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     services = option_of_yojson (value_for_key service_list_of_yojson "Services") _list path;
     format_version =
       option_of_yojson (value_for_key format_version_of_yojson "FormatVersion") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : describe_services_response)

let describe_services_max_results_of_yojson = int_of_yojson

let describe_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_code = option_of_yojson (value_for_key string__of_yojson "ServiceCode") _list path;
     format_version =
       option_of_yojson (value_for_key format_version_of_yojson "FormatVersion") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key describe_services_max_results_of_yojson "MaxResults")
         _list path;
   }
    : describe_services_request)
