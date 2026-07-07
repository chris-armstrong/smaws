open Types

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_usage_allocation ?tags:(tags_ : tag_list option)
    ~allocated_usage_quantity:(allocated_usage_quantity_ : allocated_usage_quantity) () =
  ({ tags = tags_; allocated_usage_quantity = allocated_usage_quantity_ } : usage_allocation)

let make_usage_record ?license_arn:(license_arn_ : license_arn option)
    ?customer_aws_account_id:(customer_aws_account_id_ : customer_aws_account_id option)
    ?usage_allocations:(usage_allocations_ : usage_allocations option)
    ?quantity:(quantity_ : usage_quantity option)
    ?customer_identifier:(customer_identifier_ : customer_identifier option)
    ~dimension:(dimension_ : usage_dimension) ~timestamp:(timestamp_ : timestamp) () =
  ({
     license_arn = license_arn_;
     customer_aws_account_id = customer_aws_account_id_;
     usage_allocations = usage_allocations_;
     quantity = quantity_;
     dimension = dimension_;
     customer_identifier = customer_identifier_;
     timestamp = timestamp_;
   }
    : usage_record)

let make_resolve_customer_request ~registration_token:(registration_token_ : non_empty_string) () =
  ({ registration_token = registration_token_ } : resolve_customer_request)

let make_register_usage_request ?nonce:(nonce_ : nonce option)
    ~public_key_version:(public_key_version_ : version_integer)
    ~product_code:(product_code_ : product_code) () =
  ({ nonce = nonce_; public_key_version = public_key_version_; product_code = product_code_ }
    : register_usage_request)

let make_meter_usage_request ?client_token:(client_token_ : client_token option)
    ?usage_allocations:(usage_allocations_ : usage_allocations option)
    ?dry_run:(dry_run_ : boolean_ option) ?usage_quantity:(usage_quantity_ : usage_quantity option)
    ~usage_dimension:(usage_dimension_ : usage_dimension) ~timestamp:(timestamp_ : timestamp)
    ~product_code:(product_code_ : product_code) () =
  ({
     client_token = client_token_;
     usage_allocations = usage_allocations_;
     dry_run = dry_run_;
     usage_quantity = usage_quantity_;
     usage_dimension = usage_dimension_;
     timestamp = timestamp_;
     product_code = product_code_;
   }
    : meter_usage_request)

let make_batch_meter_usage_request ?product_code:(product_code_ : product_code option)
    ~usage_records:(usage_records_ : usage_record_list) () =
  ({ product_code = product_code_; usage_records = usage_records_ } : batch_meter_usage_request)
