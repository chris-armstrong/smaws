open Types

let make_entitlement_value ?integer_value:(integer_value_ : integer option)
    ?double_value:(double_value_ : double option) ?boolean_value:(boolean_value_ : boolean_ option)
    ?string_value:(string_value_ : string_ option) () =
  ({
     integer_value = integer_value_;
     double_value = double_value_;
     boolean_value = boolean_value_;
     string_value = string_value_;
   }
    : entitlement_value)

let make_entitlement ?product_code:(product_code_ : product_code option)
    ?dimension:(dimension_ : non_empty_string option)
    ?customer_identifier:(customer_identifier_ : non_empty_string option)
    ?customer_aws_account_id:(customer_aws_account_id_ : non_empty_string option)
    ?value:(value_ : entitlement_value option)
    ?expiration_date:(expiration_date_ : timestamp option)
    ?license_arn:(license_arn_ : string_ option) () =
  ({
     product_code = product_code_;
     dimension = dimension_;
     customer_identifier = customer_identifier_;
     customer_aws_account_id = customer_aws_account_id_;
     value = value_;
     expiration_date = expiration_date_;
     license_arn = license_arn_;
   }
    : entitlement)

let make_get_entitlements_request ?filter:(filter_ : get_entitlement_filters option)
    ?next_token:(next_token_ : non_empty_string option)
    ?max_results:(max_results_ : page_size_integer option)
    ~product_code:(product_code_ : product_code) () =
  ({
     product_code = product_code_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : get_entitlements_request)
