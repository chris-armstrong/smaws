open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_exception_to_yojson (x : internal_service_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let non_empty_string_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let boolean__to_yojson = bool_to_yojson
let double_to_yojson = double_to_yojson
let integer_to_yojson = int_to_yojson

let entitlement_value_to_yojson (x : entitlement_value) =
  assoc_to_yojson
    [
      ("IntegerValue", option_to_yojson integer_to_yojson x.integer_value);
      ("DoubleValue", option_to_yojson double_to_yojson x.double_value);
      ("BooleanValue", option_to_yojson boolean__to_yojson x.boolean_value);
      ("StringValue", option_to_yojson string__to_yojson x.string_value);
    ]

let product_code_to_yojson = string_to_yojson

let entitlement_to_yojson (x : entitlement) =
  assoc_to_yojson
    [
      ("ProductCode", option_to_yojson product_code_to_yojson x.product_code);
      ("Dimension", option_to_yojson non_empty_string_to_yojson x.dimension);
      ("CustomerIdentifier", option_to_yojson non_empty_string_to_yojson x.customer_identifier);
      ("CustomerAWSAccountId", option_to_yojson non_empty_string_to_yojson x.customer_aws_account_id);
      ("Value", option_to_yojson entitlement_value_to_yojson x.value);
      ("ExpirationDate", option_to_yojson timestamp_to_yojson x.expiration_date);
      ("LicenseArn", option_to_yojson string__to_yojson x.license_arn);
    ]

let entitlement_list_to_yojson tree = list_to_yojson entitlement_to_yojson tree

let get_entitlements_result_to_yojson (x : get_entitlements_result) =
  assoc_to_yojson
    [
      ("Entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
    ]

let page_size_integer_to_yojson = int_to_yojson
let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let get_entitlement_filter_name_to_yojson (x : get_entitlement_filter_name) =
  match x with
  | CUSTOMER_IDENTIFIER -> `String "CUSTOMER_IDENTIFIER"
  | DIMENSION -> `String "DIMENSION"
  | CUSTOMER_AWS_ACCOUNT_ID -> `String "CUSTOMER_AWS_ACCOUNT_ID"
  | LICENSE_ARN -> `String "LICENSE_ARN"

let get_entitlement_filters_to_yojson tree =
  map_to_yojson get_entitlement_filter_name_to_yojson filter_value_list_to_yojson tree

let get_entitlements_request_to_yojson (x : get_entitlements_request) =
  assoc_to_yojson
    [
      ("ProductCode", Some (product_code_to_yojson x.product_code));
      ("Filter", option_to_yojson get_entitlement_filters_to_yojson x.filter);
      ("NextToken", option_to_yojson non_empty_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_size_integer_to_yojson x.max_results);
    ]
