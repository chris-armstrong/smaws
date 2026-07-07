open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson
let version_integer_of_yojson = int_of_yojson

let usage_record_result_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DuplicateRecord" -> DUPLICATE_RECORD
    | `String "CustomerNotSubscribed" -> CUSTOMER_NOT_SUBSCRIBED
    | `String "Success" -> SUCCESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UsageRecordResultStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageRecordResultStatus")
     : usage_record_result_status)
    : usage_record_result_status)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let customer_identifier_of_yojson = string_of_yojson
let usage_dimension_of_yojson = string_of_yojson
let usage_quantity_of_yojson = int_of_yojson
let allocated_usage_quantity_of_yojson = int_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let usage_allocation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     allocated_usage_quantity =
       value_for_key allocated_usage_quantity_of_yojson "AllocatedUsageQuantity" _list path;
   }
    : usage_allocation)

let usage_allocations_of_yojson tree path = list_of_yojson usage_allocation_of_yojson tree path
let customer_aws_account_id_of_yojson = string_of_yojson
let license_arn_of_yojson = string_of_yojson

let usage_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_arn = option_of_yojson (value_for_key license_arn_of_yojson "LicenseArn") _list path;
     customer_aws_account_id =
       option_of_yojson
         (value_for_key customer_aws_account_id_of_yojson "CustomerAWSAccountId")
         _list path;
     usage_allocations =
       option_of_yojson (value_for_key usage_allocations_of_yojson "UsageAllocations") _list path;
     quantity = option_of_yojson (value_for_key usage_quantity_of_yojson "Quantity") _list path;
     dimension = value_for_key usage_dimension_of_yojson "Dimension" _list path;
     customer_identifier =
       option_of_yojson
         (value_for_key customer_identifier_of_yojson "CustomerIdentifier")
         _list path;
     timestamp = value_for_key timestamp_of_yojson "Timestamp" _list path;
   }
    : usage_record)

let string__of_yojson = string_of_yojson

let usage_record_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key usage_record_result_status_of_yojson "Status") _list path;
     metering_record_id =
       option_of_yojson (value_for_key string__of_yojson "MeteringRecordId") _list path;
     usage_record = option_of_yojson (value_for_key usage_record_of_yojson "UsageRecord") _list path;
   }
    : usage_record_result)

let usage_record_result_list_of_yojson tree path =
  list_of_yojson usage_record_result_of_yojson tree path

let usage_record_list_of_yojson tree path = list_of_yojson usage_record_of_yojson tree path

let timestamp_out_of_bounds_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : timestamp_out_of_bounds_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : throttling_exception)

let product_code_of_yojson = string_of_yojson

let resolve_customer_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_arn = option_of_yojson (value_for_key license_arn_of_yojson "LicenseArn") _list path;
     customer_aws_account_id =
       option_of_yojson
         (value_for_key customer_aws_account_id_of_yojson "CustomerAWSAccountId")
         _list path;
     product_code = option_of_yojson (value_for_key product_code_of_yojson "ProductCode") _list path;
     customer_identifier =
       option_of_yojson
         (value_for_key customer_identifier_of_yojson "CustomerIdentifier")
         _list path;
   }
    : resolve_customer_result)

let non_empty_string_of_yojson = string_of_yojson

let resolve_customer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ registration_token = value_for_key non_empty_string_of_yojson "RegistrationToken" _list path }
    : resolve_customer_request)

let invalid_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_token_exception)

let internal_service_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_service_error_exception)

let expired_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : expired_token_exception)

let disabled_api_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : disabled_api_exception)

let register_usage_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     signature = option_of_yojson (value_for_key non_empty_string_of_yojson "Signature") _list path;
     public_key_rotation_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "PublicKeyRotationTimestamp") _list path;
   }
    : register_usage_result)

let nonce_of_yojson = string_of_yojson

let register_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nonce = option_of_yojson (value_for_key nonce_of_yojson "Nonce") _list path;
     public_key_version = value_for_key version_integer_of_yojson "PublicKeyVersion" _list path;
     product_code = value_for_key product_code_of_yojson "ProductCode" _list path;
   }
    : register_usage_request)

let platform_not_supported_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : platform_not_supported_exception)

let invalid_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_region_exception)

let invalid_public_key_version_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_public_key_version_exception)

let invalid_product_code_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_product_code_exception)

let customer_not_entitled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : customer_not_entitled_exception)

let meter_usage_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metering_record_id =
       option_of_yojson (value_for_key string__of_yojson "MeteringRecordId") _list path;
   }
    : meter_usage_result)

let boolean__of_yojson = bool_of_yojson
let client_token_of_yojson = string_of_yojson

let meter_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     usage_allocations =
       option_of_yojson (value_for_key usage_allocations_of_yojson "UsageAllocations") _list path;
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "DryRun") _list path;
     usage_quantity =
       option_of_yojson (value_for_key usage_quantity_of_yojson "UsageQuantity") _list path;
     usage_dimension = value_for_key usage_dimension_of_yojson "UsageDimension" _list path;
     timestamp = value_for_key timestamp_of_yojson "Timestamp" _list path;
     product_code = value_for_key product_code_of_yojson "ProductCode" _list path;
   }
    : meter_usage_request)

let invalid_usage_dimension_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_usage_dimension_exception)

let invalid_usage_allocations_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_usage_allocations_exception)

let invalid_tag_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_tag_exception)

let invalid_endpoint_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_endpoint_region_exception)

let idempotency_conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : idempotency_conflict_exception)

let duplicate_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : duplicate_request_exception)

let invalid_license_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_license_exception)

let invalid_customer_identifier_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_customer_identifier_exception)

let batch_meter_usage_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unprocessed_records =
       option_of_yojson (value_for_key usage_record_list_of_yojson "UnprocessedRecords") _list path;
     results =
       option_of_yojson (value_for_key usage_record_result_list_of_yojson "Results") _list path;
   }
    : batch_meter_usage_result)

let batch_meter_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     product_code = option_of_yojson (value_for_key product_code_of_yojson "ProductCode") _list path;
     usage_records = value_for_key usage_record_list_of_yojson "UsageRecords" _list path;
   }
    : batch_meter_usage_request)
