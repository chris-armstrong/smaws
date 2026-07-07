open Types

let make_entitlement_value ?string_value:(string_value_ : string_ option)
    ?boolean_value:(boolean_value_ : boolean_ option) ?double_value:(double_value_ : double option)
    ?integer_value:(integer_value_ : integer option) () =
  ({
     string_value = string_value_;
     boolean_value = boolean_value_;
     double_value = double_value_;
     integer_value = integer_value_;
   }
    : entitlement_value)

let make_entitlement ?license_arn:(license_arn_ : string_ option)
    ?expiration_date:(expiration_date_ : timestamp option)
    ?value:(value_ : entitlement_value option)
    ?customer_aws_account_id:(customer_aws_account_id_ : non_empty_string option)
    ?customer_identifier:(customer_identifier_ : non_empty_string option)
    ?dimension:(dimension_ : non_empty_string option)
    ?product_code:(product_code_ : product_code option) () =
  ({
     license_arn = license_arn_;
     expiration_date = expiration_date_;
     value = value_;
     customer_aws_account_id = customer_aws_account_id_;
     customer_identifier = customer_identifier_;
     dimension = dimension_;
     product_code = product_code_;
   }
    : entitlement)

let make_get_entitlements_request ?max_results:(max_results_ : page_size_integer option)
    ?next_token:(next_token_ : non_empty_string option)
    ?filter:(filter_ : get_entitlement_filters option) ~product_code:(product_code_ : product_code)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     product_code = product_code_;
   }
    : get_entitlements_request)
