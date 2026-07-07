open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson
let value_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let synthesized_json_price_list_json_item_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let attribute_name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("AttributeNames", option_to_yojson attribute_name_list_to_yojson x.attribute_names);
      ("ServiceCode", Some (string__to_yojson x.service_code));
    ]

let service_list_to_yojson tree = list_to_yojson service_to_yojson tree
let service_code_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let region_code_to_yojson = string_to_yojson
let price_list_arn_to_yojson = string_to_yojson
let currency_code_to_yojson = string_to_yojson
let file_format_to_yojson = string_to_yojson
let file_formats_to_yojson tree = list_to_yojson file_format_to_yojson tree

let price_list_to_yojson (x : price_list) =
  assoc_to_yojson
    [
      ("FileFormats", option_to_yojson file_formats_to_yojson x.file_formats);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("RegionCode", option_to_yojson region_code_to_yojson x.region_code);
      ("PriceListArn", option_to_yojson price_list_arn_to_yojson x.price_list_arn);
    ]

let price_lists_to_yojson tree = list_to_yojson price_list_to_yojson tree

let price_list_json_items_to_yojson tree =
  list_to_yojson synthesized_json_price_list_json_item_to_yojson tree

let not_found_exception_to_yojson (x : not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let max_results_to_yojson = int_to_yojson

let list_price_lists_response_to_yojson (x : list_price_lists_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("PriceLists", option_to_yojson price_lists_to_yojson x.price_lists);
    ]

let effective_date_to_yojson = timestamp_epoch_seconds_to_yojson

let list_price_lists_request_to_yojson (x : list_price_lists_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
      ("RegionCode", option_to_yojson region_code_to_yojson x.region_code);
      ("EffectiveDate", Some (effective_date_to_yojson x.effective_date));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

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

let format_version_to_yojson = string_to_yojson

let get_products_response_to_yojson (x : get_products_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("PriceList", option_to_yojson price_list_json_items_to_yojson x.price_list);
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
    ]

let filter_type_to_yojson (x : filter_type) =
  match x with
  | NONE_OF -> `String "NONE_OF"
  | ANY_OF -> `String "ANY_OF"
  | CONTAINS -> `String "CONTAINS"
  | EQUALS -> `String "EQUALS"
  | TERM_MATCH -> `String "TERM_MATCH"

let field_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Value", Some (value_to_yojson x.value));
      ("Field", Some (field_to_yojson x.field));
      ("Type", Some (filter_type_to_yojson x.type_));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree
let get_products_max_results_to_yojson = int_to_yojson

let get_products_request_to_yojson (x : get_products_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson get_products_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("ServiceCode", Some (string__to_yojson x.service_code));
    ]

let get_price_list_file_url_response_to_yojson (x : get_price_list_file_url_response) =
  assoc_to_yojson [ ("Url", option_to_yojson string__to_yojson x.url) ]

let get_price_list_file_url_request_to_yojson (x : get_price_list_file_url_request) =
  assoc_to_yojson
    [
      ("FileFormat", Some (file_format_to_yojson x.file_format));
      ("PriceListArn", Some (price_list_arn_to_yojson x.price_list_arn));
    ]

let attribute_value_to_yojson (x : attribute_value) =
  assoc_to_yojson [ ("Value", option_to_yojson string__to_yojson x.value) ]

let attribute_value_list_to_yojson tree = list_to_yojson attribute_value_to_yojson tree

let get_attribute_values_response_to_yojson (x : get_attribute_values_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("AttributeValues", option_to_yojson attribute_value_list_to_yojson x.attribute_values);
    ]

let get_attribute_values_max_results_to_yojson = int_to_yojson

let get_attribute_values_request_to_yojson (x : get_attribute_values_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson get_attribute_values_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("AttributeName", Some (string__to_yojson x.attribute_name));
      ("ServiceCode", Some (string__to_yojson x.service_code));
    ]

let describe_services_response_to_yojson (x : describe_services_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
      ("Services", option_to_yojson service_list_to_yojson x.services);
    ]

let describe_services_max_results_to_yojson = int_to_yojson

let describe_services_request_to_yojson (x : describe_services_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson describe_services_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("FormatVersion", option_to_yojson format_version_to_yojson x.format_version);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
    ]
