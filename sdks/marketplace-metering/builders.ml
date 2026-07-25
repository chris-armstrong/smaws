open Types

let make_resolve_customer_request ~registration_token:(registration_token_ : non_empty_string) () =
  ({ registration_token = registration_token_ } : resolve_customer_request)

let make_register_usage_request ?nonce:(nonce_ : nonce option)
    ~product_code:(product_code_ : product_code)
    ~public_key_version:(public_key_version_ : version_integer) () =
  ({ product_code = product_code_; public_key_version = public_key_version_; nonce = nonce_ }
    : register_usage_request)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_usage_allocation ?tags:(tags_ : tag_list option)
    ~allocated_usage_quantity:(allocated_usage_quantity_ : allocated_usage_quantity) () =
  ({ allocated_usage_quantity = allocated_usage_quantity_; tags = tags_ } : usage_allocation)

let make_meter_usage_request ?usage_quantity:(usage_quantity_ : usage_quantity option)
    ?dry_run:(dry_run_ : boolean_ option)
    ?usage_allocations:(usage_allocations_ : usage_allocations option)
    ?client_token:(client_token_ : client_token option) ~product_code:(product_code_ : product_code)
    ~timestamp:(timestamp_ : timestamp) ~usage_dimension:(usage_dimension_ : usage_dimension) () =
  ({
     product_code = product_code_;
     timestamp = timestamp_;
     usage_dimension = usage_dimension_;
     usage_quantity = usage_quantity_;
     dry_run = dry_run_;
     usage_allocations = usage_allocations_;
     client_token = client_token_;
   }
    : meter_usage_request)

let make_usage_record ?customer_identifier:(customer_identifier_ : customer_identifier option)
    ?quantity:(quantity_ : usage_quantity option)
    ?usage_allocations:(usage_allocations_ : usage_allocations option)
    ?customer_aws_account_id:(customer_aws_account_id_ : customer_aws_account_id option)
    ?license_arn:(license_arn_ : license_arn option) ~timestamp:(timestamp_ : timestamp)
    ~dimension:(dimension_ : usage_dimension) () =
  ({
     timestamp = timestamp_;
     customer_identifier = customer_identifier_;
     dimension = dimension_;
     quantity = quantity_;
     usage_allocations = usage_allocations_;
     customer_aws_account_id = customer_aws_account_id_;
     license_arn = license_arn_;
   }
    : usage_record)

let make_batch_meter_usage_request ?product_code:(product_code_ : product_code option)
    ~usage_records:(usage_records_ : usage_record_list) () =
  ({ usage_records = usage_records_; product_code = product_code_ } : batch_meter_usage_request)
