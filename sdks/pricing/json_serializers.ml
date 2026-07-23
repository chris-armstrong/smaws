open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let expired_next_token_exception_to_yojson (x : expired_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let string__to_yojson = string_to_yojson
let file_format_to_yojson = string_to_yojson
let file_formats_to_yojson tree = list_to_yojson file_format_to_yojson tree
let currency_code_to_yojson = string_to_yojson
let region_code_to_yojson = string_to_yojson
let price_list_arn_to_yojson = string_to_yojson

let price_list_to_yojson (x : price_list) =
  assoc_to_yojson
    [
      ("PriceListArn", option_to_yojson price_list_arn_to_yojson x.price_list_arn);
      ("RegionCode", option_to_yojson region_code_to_yojson x.region_code);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("FileFormats", option_to_yojson file_formats_to_yojson x.file_formats);
    ]

let price_lists_to_yojson tree = list_to_yojson price_list_to_yojson tree

let list_price_lists_response_to_yojson (x : list_price_lists_response) =
  assoc_to_yojson
    [
      ("PriceLists", option_to_yojson price_lists_to_yojson x.price_lists);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let effective_date_to_yojson = timestamp_epoch_seconds_to_yojson
let service_code_to_yojson = string_to_yojson

let list_price_lists_request_to_yojson (x : list_price_lists_request) =
  assoc_to_yojson
    [
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
      ("EffectiveDate", Some (effective_date_to_yojson x.effective_date));
      ("RegionCode", option_to_yojson region_code_to_yojson x.region_code);
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let synthesized_json_price_list_json_item_to_yojson = string_to_yojson

let price_list_json_items_to_yojson tree =
  list_to_yojson synthesized_json_price_list_json_item_to_yojson tree

let format_version_to_yojson = string_to_yojson

let get_products_response_to_yojson (x : get_products_response) =
  assoc_to_yojson
    [
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
      ("PriceList", option_to_yojson price_list_json_items_to_yojson x.price_list);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_products_max_results_to_yojson = int_to_yojson
let value_to_yojson = string_to_yojson
let field_to_yojson = string_to_yojson

let filter_type_to_yojson (x : filter_type) =
  match x with
  | TERM_MATCH -> `String "TERM_MATCH"
  | EQUALS -> `String "EQUALS"
  | CONTAINS -> `String "CONTAINS"
  | ANY_OF -> `String "ANY_OF"
  | NONE_OF -> `String "NONE_OF"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Type", Some (filter_type_to_yojson x.type_));
      ("Field", Some (field_to_yojson x.field));
      ("Value", Some (value_to_yojson x.value));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let get_products_request_to_yojson (x : get_products_request) =
  assoc_to_yojson
    [
      ("ServiceCode", Some (string__to_yojson x.service_code));
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson get_products_max_results_to_yojson x.max_results);
    ]

let get_price_list_file_url_response_to_yojson (x : get_price_list_file_url_response) =
  assoc_to_yojson [ ("Url", option_to_yojson string__to_yojson x.url) ]

let get_price_list_file_url_request_to_yojson (x : get_price_list_file_url_request) =
  assoc_to_yojson
    [
      ("PriceListArn", Some (price_list_arn_to_yojson x.price_list_arn));
      ("FileFormat", Some (file_format_to_yojson x.file_format));
    ]

let attribute_value_to_yojson (x : attribute_value) =
  assoc_to_yojson [ ("Value", option_to_yojson string__to_yojson x.value) ]

let attribute_value_list_to_yojson tree = list_to_yojson attribute_value_to_yojson tree

let get_attribute_values_response_to_yojson (x : get_attribute_values_response) =
  assoc_to_yojson
    [
      ("AttributeValues", option_to_yojson attribute_value_list_to_yojson x.attribute_values);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_attribute_values_max_results_to_yojson = int_to_yojson

let get_attribute_values_request_to_yojson (x : get_attribute_values_request) =
  assoc_to_yojson
    [
      ("ServiceCode", Some (string__to_yojson x.service_code));
      ("AttributeName", Some (string__to_yojson x.attribute_name));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson get_attribute_values_max_results_to_yojson x.max_results);
    ]

let attribute_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("ServiceCode", Some (string__to_yojson x.service_code));
      ("AttributeNames", option_to_yojson attribute_name_list_to_yojson x.attribute_names);
    ]

let service_list_to_yojson tree = list_to_yojson service_to_yojson tree

let describe_services_response_to_yojson (x : describe_services_response) =
  assoc_to_yojson
    [
      ("Services", option_to_yojson service_list_to_yojson x.services);
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_services_max_results_to_yojson = int_to_yojson

let describe_services_request_to_yojson (x : describe_services_request) =
  assoc_to_yojson
    [
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson describe_services_max_results_to_yojson x.max_results);
    ]
