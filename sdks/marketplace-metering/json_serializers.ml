open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_token_exception_to_yojson (x : invalid_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let internal_service_error_exception_to_yojson (x : internal_service_error_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let expired_token_exception_to_yojson (x : expired_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let disabled_api_exception_to_yojson (x : disabled_api_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let license_arn_to_yojson = string_to_yojson
let customer_aws_account_id_to_yojson = string_to_yojson
let product_code_to_yojson = string_to_yojson
let customer_identifier_to_yojson = string_to_yojson

let resolve_customer_result_to_yojson (x : resolve_customer_result) =
  assoc_to_yojson
    [
      ("CustomerIdentifier", option_to_yojson customer_identifier_to_yojson x.customer_identifier);
      ("ProductCode", option_to_yojson product_code_to_yojson x.product_code);
      ( "CustomerAWSAccountId",
        option_to_yojson customer_aws_account_id_to_yojson x.customer_aws_account_id );
      ("LicenseArn", option_to_yojson license_arn_to_yojson x.license_arn);
    ]

let non_empty_string_to_yojson = string_to_yojson

let resolve_customer_request_to_yojson (x : resolve_customer_request) =
  assoc_to_yojson [ ("RegistrationToken", Some (non_empty_string_to_yojson x.registration_token)) ]

let platform_not_supported_exception_to_yojson (x : platform_not_supported_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_region_exception_to_yojson (x : invalid_region_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_public_key_version_exception_to_yojson (x : invalid_public_key_version_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_product_code_exception_to_yojson (x : invalid_product_code_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let customer_not_entitled_exception_to_yojson (x : customer_not_entitled_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let register_usage_result_to_yojson (x : register_usage_result) =
  assoc_to_yojson
    [
      ( "PublicKeyRotationTimestamp",
        option_to_yojson timestamp_to_yojson x.public_key_rotation_timestamp );
      ("Signature", option_to_yojson non_empty_string_to_yojson x.signature);
    ]

let nonce_to_yojson = string_to_yojson
let version_integer_to_yojson = int_to_yojson

let register_usage_request_to_yojson (x : register_usage_request) =
  assoc_to_yojson
    [
      ("ProductCode", Some (product_code_to_yojson x.product_code));
      ("PublicKeyVersion", Some (version_integer_to_yojson x.public_key_version));
      ("Nonce", option_to_yojson nonce_to_yojson x.nonce);
    ]

let timestamp_out_of_bounds_exception_to_yojson (x : timestamp_out_of_bounds_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_usage_dimension_exception_to_yojson (x : invalid_usage_dimension_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_usage_allocations_exception_to_yojson (x : invalid_usage_allocations_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_tag_exception_to_yojson (x : invalid_tag_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_endpoint_region_exception_to_yojson (x : invalid_endpoint_region_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let idempotency_conflict_exception_to_yojson (x : idempotency_conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let duplicate_request_exception_to_yojson (x : duplicate_request_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let string__to_yojson = string_to_yojson

let meter_usage_result_to_yojson (x : meter_usage_result) =
  assoc_to_yojson [ ("MeteringRecordId", option_to_yojson string__to_yojson x.metering_record_id) ]

let client_token_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let allocated_usage_quantity_to_yojson = int_to_yojson

let usage_allocation_to_yojson (x : usage_allocation) =
  assoc_to_yojson
    [
      ( "AllocatedUsageQuantity",
        Some (allocated_usage_quantity_to_yojson x.allocated_usage_quantity) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let usage_allocations_to_yojson tree = list_to_yojson usage_allocation_to_yojson tree
let boolean__to_yojson = bool_to_yojson
let usage_quantity_to_yojson = int_to_yojson
let usage_dimension_to_yojson = string_to_yojson

let meter_usage_request_to_yojson (x : meter_usage_request) =
  assoc_to_yojson
    [
      ("ProductCode", Some (product_code_to_yojson x.product_code));
      ("Timestamp", Some (timestamp_to_yojson x.timestamp));
      ("UsageDimension", Some (usage_dimension_to_yojson x.usage_dimension));
      ("UsageQuantity", option_to_yojson usage_quantity_to_yojson x.usage_quantity);
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("UsageAllocations", option_to_yojson usage_allocations_to_yojson x.usage_allocations);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let invalid_license_exception_to_yojson (x : invalid_license_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_customer_identifier_exception_to_yojson (x : invalid_customer_identifier_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let usage_record_to_yojson (x : usage_record) =
  assoc_to_yojson
    [
      ("Timestamp", Some (timestamp_to_yojson x.timestamp));
      ("CustomerIdentifier", option_to_yojson customer_identifier_to_yojson x.customer_identifier);
      ("Dimension", Some (usage_dimension_to_yojson x.dimension));
      ("Quantity", option_to_yojson usage_quantity_to_yojson x.quantity);
      ("UsageAllocations", option_to_yojson usage_allocations_to_yojson x.usage_allocations);
      ( "CustomerAWSAccountId",
        option_to_yojson customer_aws_account_id_to_yojson x.customer_aws_account_id );
      ("LicenseArn", option_to_yojson license_arn_to_yojson x.license_arn);
    ]

let usage_record_list_to_yojson tree = list_to_yojson usage_record_to_yojson tree

let usage_record_result_status_to_yojson (x : usage_record_result_status) =
  match x with
  | SUCCESS -> `String "Success"
  | CUSTOMER_NOT_SUBSCRIBED -> `String "CustomerNotSubscribed"
  | DUPLICATE_RECORD -> `String "DuplicateRecord"

let usage_record_result_to_yojson (x : usage_record_result) =
  assoc_to_yojson
    [
      ("UsageRecord", option_to_yojson usage_record_to_yojson x.usage_record);
      ("MeteringRecordId", option_to_yojson string__to_yojson x.metering_record_id);
      ("Status", option_to_yojson usage_record_result_status_to_yojson x.status);
    ]

let usage_record_result_list_to_yojson tree = list_to_yojson usage_record_result_to_yojson tree

let batch_meter_usage_result_to_yojson (x : batch_meter_usage_result) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson usage_record_result_list_to_yojson x.results);
      ("UnprocessedRecords", option_to_yojson usage_record_list_to_yojson x.unprocessed_records);
    ]

let batch_meter_usage_request_to_yojson (x : batch_meter_usage_request) =
  assoc_to_yojson
    [
      ("UsageRecords", Some (usage_record_list_to_yojson x.usage_records));
      ("ProductCode", option_to_yojson product_code_to_yojson x.product_code);
    ]
