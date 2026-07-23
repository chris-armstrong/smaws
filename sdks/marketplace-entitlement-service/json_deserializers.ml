open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : throttling_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_parameter_exception)

let internal_service_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_service_error_exception)

let non_empty_string_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let boolean__of_yojson = bool_of_yojson
let double_of_yojson = double_of_yojson
let integer_of_yojson = int_of_yojson

let entitlement_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integer_value = option_of_yojson (value_for_key integer_of_yojson "IntegerValue") _list path;
     double_value = option_of_yojson (value_for_key double_of_yojson "DoubleValue") _list path;
     boolean_value = option_of_yojson (value_for_key boolean__of_yojson "BooleanValue") _list path;
     string_value = option_of_yojson (value_for_key string__of_yojson "StringValue") _list path;
   }
    : entitlement_value)

let product_code_of_yojson = string_of_yojson

let entitlement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_code = option_of_yojson (value_for_key product_code_of_yojson "ProductCode") _list path;
     dimension = option_of_yojson (value_for_key non_empty_string_of_yojson "Dimension") _list path;
     customer_identifier =
       option_of_yojson (value_for_key non_empty_string_of_yojson "CustomerIdentifier") _list path;
     customer_aws_account_id =
       option_of_yojson (value_for_key non_empty_string_of_yojson "CustomerAWSAccountId") _list path;
     value = option_of_yojson (value_for_key entitlement_value_of_yojson "Value") _list path;
     expiration_date =
       option_of_yojson (value_for_key timestamp_of_yojson "ExpirationDate") _list path;
     license_arn = option_of_yojson (value_for_key string__of_yojson "LicenseArn") _list path;
   }
    : entitlement)

let entitlement_list_of_yojson tree path = list_of_yojson entitlement_of_yojson tree path

let get_entitlements_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entitlements =
       option_of_yojson (value_for_key entitlement_list_of_yojson "Entitlements") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
   }
    : get_entitlements_result)

let page_size_integer_of_yojson = int_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_value_list_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let get_entitlement_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOMER_IDENTIFIER" -> CUSTOMER_IDENTIFIER
    | `String "DIMENSION" -> DIMENSION
    | `String "CUSTOMER_AWS_ACCOUNT_ID" -> CUSTOMER_AWS_ACCOUNT_ID
    | `String "LICENSE_ARN" -> LICENSE_ARN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GetEntitlementFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "GetEntitlementFilterName")
     : get_entitlement_filter_name)
    : get_entitlement_filter_name)

let get_entitlement_filters_of_yojson tree path =
  map_of_yojson get_entitlement_filter_name_of_yojson filter_value_list_of_yojson tree path

let get_entitlements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_code = value_for_key product_code_of_yojson "ProductCode" _list path;
     filter = option_of_yojson (value_for_key get_entitlement_filters_of_yojson "Filter") _list path;
     next_token = option_of_yojson (value_for_key non_empty_string_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key page_size_integer_of_yojson "MaxResults") _list path;
   }
    : get_entitlements_request)
