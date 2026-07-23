open Smaws_Lib.Json.DeserializeHelpers
open Types

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : access_denied_exception)

let access_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description")
         _list path;
   }
    : access_details)

let validation_exception_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUIRED_FIELD_MISSING" -> REQUIRED_FIELD_MISSING
    | `String "INVALID_ENUM_VALUE" -> INVALID_ENUM_VALUE
    | `String "INVALID_STRING_FORMAT" -> INVALID_STRING_FORMAT
    | `String "INVALID_VALUE" -> INVALID_VALUE
    | `String "NOT_ENOUGH_VALUES" -> NOT_ENOUGH_VALUES
    | `String "TOO_MANY_VALUES" -> TOO_MANY_VALUES
    | `String "INVALID_RESOURCE_STATE" -> INVALID_RESOURCE_STATE
    | `String "DUPLICATE_KEY_VALUE" -> DUPLICATE_KEY_VALUE
    | `String "VALUE_OUT_OF_RANGE" -> VALUE_OUT_OF_RANGE
    | `String "ACTION_NOT_PERMITTED" -> ACTION_NOT_PERMITTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionErrorCode")
     : validation_exception_error_code)
    : validation_exception_error_code)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     code =
       option_of_yojson (value_for_key validation_exception_error_code_of_yojson "Code") _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "other" -> OTHER
    | `String "BUSINESS_VALIDATION_FAILED" -> BUSINESS_VALIDATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason = value_for_key validation_exception_reason_of_yojson "Reason" _list path;
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "FieldList")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : conflict_exception)

let amend_benefit_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amendment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_path =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FieldPath" _list
         path;
     new_value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NewValue" _list path;
   }
    : amendment)

let amendment_list_of_yojson tree path = list_of_yojson amendment_of_yojson tree path
let benefit_application_identifier_of_yojson = string_of_yojson
let catalog_name_of_yojson = string_of_yojson

let amend_benefit_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     client_token =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ClientToken" _list
         path;
     revision =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Revision" _list path;
     identifier = value_for_key benefit_application_identifier_of_yojson "Identifier" _list path;
     amendment_reason =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AmendmentReason"
         _list path;
     amendments = value_for_key amendment_list_of_yojson "Amendments" _list path;
   }
    : amend_benefit_application_input)

let arn_of_yojson = string_of_yojson
let arns_of_yojson tree path = list_of_yojson arn_of_yojson tree path
let benefit_application_id_of_yojson = string_of_yojson

let associate_benefit_application_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key benefit_application_id_of_yojson "Id") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Revision")
         _list path;
   }
    : associate_benefit_application_resource_output)

let associate_benefit_application_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     benefit_application_identifier =
       value_for_key benefit_application_identifier_of_yojson "BenefitApplicationIdentifier" _list
         path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
   }
    : associate_benefit_application_resource_input)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPPORTUNITY" -> OPPORTUNITY
    | `String "BENEFIT_ALLOCATION" -> BENEFIT_ALLOCATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let associated_resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     resource_identifier =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "ResourceIdentifier")
         _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "ResourceArn") _list path;
   }
    : associated_resource)

let associated_resources_of_yojson tree path =
  list_of_yojson associated_resource_of_yojson tree path

let attributes_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let benefit_allocation_arn_of_yojson = string_of_yojson
let benefit_allocation_id_of_yojson = string_of_yojson
let benefit_allocation_identifier_of_yojson = string_of_yojson
let benefit_allocation_name_of_yojson = string_of_yojson

let benefit_allocation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String "FULFILLED" -> FULFILLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BenefitAllocationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BenefitAllocationStatus")
     : benefit_allocation_status)
    : benefit_allocation_status)

let benefit_allocation_status_list_of_yojson tree path =
  list_of_yojson benefit_allocation_status_of_yojson tree path

let benefit_id_of_yojson = string_of_yojson
let benefit_ids_of_yojson tree path = list_of_yojson benefit_id_of_yojson tree path
let timestamp_of_yojson = timestamp_iso_8601_of_yojson

let fulfillment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREDITS" -> CREDITS
    | `String "CASH" -> CASH
    | `String "ACCESS" -> ACCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FulfillmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "FulfillmentType")
     : fulfillment_type)
    : fulfillment_type)

let fulfillment_types_of_yojson tree path = list_of_yojson fulfillment_type_of_yojson tree path

let benefit_allocation_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key benefit_allocation_id_of_yojson "Id") _list path;
     catalog = option_of_yojson (value_for_key catalog_name_of_yojson "Catalog") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     status =
       option_of_yojson (value_for_key benefit_allocation_status_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "StatusReason")
         _list path;
     name = option_of_yojson (value_for_key benefit_allocation_name_of_yojson "Name") _list path;
     benefit_id = option_of_yojson (value_for_key benefit_id_of_yojson "BenefitId") _list path;
     benefit_application_id =
       option_of_yojson
         (value_for_key benefit_application_id_of_yojson "BenefitApplicationId")
         _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     expires_at = option_of_yojson (value_for_key timestamp_of_yojson "ExpiresAt") _list path;
     applicable_benefit_ids =
       option_of_yojson (value_for_key benefit_ids_of_yojson "ApplicableBenefitIds") _list path;
   }
    : benefit_allocation_summary)

let benefit_allocation_summaries_of_yojson tree path =
  list_of_yojson benefit_allocation_summary_of_yojson tree path

let benefit_application_description_of_yojson = string_of_yojson

let benefit_application_identifier_list_of_yojson tree path =
  list_of_yojson benefit_application_identifier_of_yojson tree path

let benefit_application_name_of_yojson = string_of_yojson
let benefit_application_stage_of_yojson = string_of_yojson

let benefit_application_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_SUBMISSION" -> PENDING_SUBMISSION
    | `String "IN_REVIEW" -> IN_REVIEW
    | `String "ACTION_REQUIRED" -> ACTION_REQUIRED
    | `String "APPROVED" -> APPROVED
    | `String "REJECTED" -> REJECTED
    | `String "CANCELED" -> CANCELED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BenefitApplicationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BenefitApplicationStatus")
     : benefit_application_status)
    : benefit_application_status)

let program_of_yojson = string_of_yojson
let programs_of_yojson tree path = list_of_yojson program_of_yojson tree path

let benefit_application_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = option_of_yojson (value_for_key catalog_name_of_yojson "Catalog") _list path;
     name = option_of_yojson (value_for_key benefit_application_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key benefit_application_id_of_yojson "Id") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     benefit_id = option_of_yojson (value_for_key benefit_id_of_yojson "BenefitId") _list path;
     programs = option_of_yojson (value_for_key programs_of_yojson "Programs") _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     status =
       option_of_yojson (value_for_key benefit_application_status_of_yojson "Status") _list path;
     stage = option_of_yojson (value_for_key benefit_application_stage_of_yojson "Stage") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     benefit_application_details =
       option_of_yojson (value_for_key attributes_of_yojson "BenefitApplicationDetails") _list path;
     associated_resources =
       option_of_yojson (value_for_key arns_of_yojson "AssociatedResources") _list path;
   }
    : benefit_application_summary)

let benefit_application_summaries_of_yojson tree path =
  list_of_yojson benefit_application_summary_of_yojson tree path

let benefit_identifiers_of_yojson tree path = list_of_yojson benefit_id_of_yojson tree path

let benefit_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "BenefitStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BenefitStatus")
     : benefit_status)
    : benefit_status)

let benefit_statuses_of_yojson tree path = list_of_yojson benefit_status_of_yojson tree path

let benefit_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Id")
         _list path;
     catalog = option_of_yojson (value_for_key catalog_name_of_yojson "Catalog") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description")
         _list path;
     programs = option_of_yojson (value_for_key programs_of_yojson "Programs") _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     status = option_of_yojson (value_for_key benefit_status_of_yojson "Status") _list path;
   }
    : benefit_summary)

let benefit_summaries_of_yojson tree path = list_of_yojson benefit_summary_of_yojson tree path

let cancel_benefit_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_benefit_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     client_token =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ClientToken" _list
         path;
     identifier = value_for_key benefit_application_identifier_of_yojson "Identifier" _list path;
     reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Reason")
         _list path;
   }
    : cancel_benefit_application_input)

let currency_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "AED" -> AED
    | `String "AMD" -> AMD
    | `String "ARS" -> ARS
    | `String "AUD" -> AUD
    | `String "AWG" -> AWG
    | `String "AZN" -> AZN
    | `String "BBD" -> BBD
    | `String "BDT" -> BDT
    | `String "BGN" -> BGN
    | `String "BMD" -> BMD
    | `String "BND" -> BND
    | `String "BOB" -> BOB
    | `String "BRL" -> BRL
    | `String "BSD" -> BSD
    | `String "BYR" -> BYR
    | `String "BZD" -> BZD
    | `String "CAD" -> CAD
    | `String "CHF" -> CHF
    | `String "CLP" -> CLP
    | `String "CNY" -> CNY
    | `String "COP" -> COP
    | `String "CRC" -> CRC
    | `String "CZK" -> CZK
    | `String "DKK" -> DKK
    | `String "DOP" -> DOP
    | `String "EEK" -> EEK
    | `String "EGP" -> EGP
    | `String "EUR" -> EUR
    | `String "GBP" -> GBP
    | `String "GEL" -> GEL
    | `String "GHS" -> GHS
    | `String "GTQ" -> GTQ
    | `String "GYD" -> GYD
    | `String "HKD" -> HKD
    | `String "HNL" -> HNL
    | `String "HRK" -> HRK
    | `String "HTG" -> HTG
    | `String "HUF" -> HUF
    | `String "IDR" -> IDR
    | `String "ILS" -> ILS
    | `String "INR" -> INR
    | `String "ISK" -> ISK
    | `String "JMD" -> JMD
    | `String "JPY" -> JPY
    | `String "KES" -> KES
    | `String "KHR" -> KHR
    | `String "KRW" -> KRW
    | `String "KYD" -> KYD
    | `String "KZT" -> KZT
    | `String "LBP" -> LBP
    | `String "LKR" -> LKR
    | `String "LTL" -> LTL
    | `String "LVL" -> LVL
    | `String "MAD" -> MAD
    | `String "MNT" -> MNT
    | `String "MOP" -> MOP
    | `String "MUR" -> MUR
    | `String "MVR" -> MVR
    | `String "MXN" -> MXN
    | `String "MYR" -> MYR
    | `String "NAD" -> NAD
    | `String "NGN" -> NGN
    | `String "NIO" -> NIO
    | `String "NOK" -> NOK
    | `String "NZD" -> NZD
    | `String "PAB" -> PAB
    | `String "PEN" -> PEN
    | `String "PHP" -> PHP
    | `String "PKR" -> PKR
    | `String "PLN" -> PLN
    | `String "PYG" -> PYG
    | `String "QAR" -> QAR
    | `String "RON" -> RON
    | `String "RUB" -> RUB
    | `String "SAR" -> SAR
    | `String "SEK" -> SEK
    | `String "SGD" -> SGD
    | `String "SIT" -> SIT
    | `String "SKK" -> SKK
    | `String "THB" -> THB
    | `String "TND" -> TND
    | `String "TRY" -> TRY
    | `String "TTD" -> TTD
    | `String "TWD" -> TWD
    | `String "TZS" -> TZS
    | `String "UAH" -> UAH
    | `String "USD" -> USD
    | `String "UYU" -> UYU
    | `String "UZS" -> UZS
    | `String "VND" -> VND
    | `String "XAF" -> XAF
    | `String "XCD" -> XCD
    | `String "XOF" -> XOF
    | `String "XPF" -> XPF
    | `String "ZAR" -> ZAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "CurrencyCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrencyCode")
     : currency_code)
    : currency_code)

let monetary_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Amount" _list path;
     currency_code = value_for_key currency_code_of_yojson "CurrencyCode" _list path;
   }
    : monetary_value)

let issuance_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     issuance_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "IssuanceId")
         _list path;
     issuance_amount =
       option_of_yojson (value_for_key monetary_value_of_yojson "IssuanceAmount") _list path;
     issued_at = option_of_yojson (value_for_key timestamp_of_yojson "IssuedAt") _list path;
   }
    : issuance_detail)

let consumable_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allocated_amount =
       option_of_yojson (value_for_key monetary_value_of_yojson "AllocatedAmount") _list path;
     remaining_amount =
       option_of_yojson (value_for_key monetary_value_of_yojson "RemainingAmount") _list path;
     utilized_amount =
       option_of_yojson (value_for_key monetary_value_of_yojson "UtilizedAmount") _list path;
     issuance_details =
       option_of_yojson (value_for_key issuance_detail_of_yojson "IssuanceDetails") _list path;
   }
    : consumable_details)

let contact_phone_of_yojson = string_of_yojson
let contact_last_name_of_yojson = string_of_yojson
let contact_first_name_of_yojson = string_of_yojson
let contact_email_of_yojson = string_of_yojson

let contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     email = option_of_yojson (value_for_key contact_email_of_yojson "Email") _list path;
     first_name =
       option_of_yojson (value_for_key contact_first_name_of_yojson "FirstName") _list path;
     last_name = option_of_yojson (value_for_key contact_last_name_of_yojson "LastName") _list path;
     business_title =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "BusinessTitle")
         _list path;
     phone = option_of_yojson (value_for_key contact_phone_of_yojson "Phone") _list path;
   }
    : contact)

let contacts_of_yojson tree path = list_of_yojson contact_of_yojson tree path

let create_benefit_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key benefit_application_id_of_yojson "Id") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Revision")
         _list path;
   }
    : create_benefit_application_output)

let file_ur_i_of_yojson = string_of_yojson

let file_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_ur_i = value_for_key file_ur_i_of_yojson "FileURI" _list path;
     business_use_case =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "BusinessUseCase")
         _list path;
   }
    : file_input)

let file_input_details_of_yojson tree path = list_of_yojson file_input_of_yojson tree path
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_benefit_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     client_token =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ClientToken" _list
         path;
     name = option_of_yojson (value_for_key benefit_application_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key benefit_application_description_of_yojson "Description")
         _list path;
     benefit_identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "BenefitIdentifier"
         _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     benefit_application_details =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson
            "BenefitApplicationDetails")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     associated_resources =
       option_of_yojson (value_for_key arns_of_yojson "AssociatedResources") _list path;
     partner_contacts =
       option_of_yojson (value_for_key contacts_of_yojson "PartnerContacts") _list path;
     file_details =
       option_of_yojson (value_for_key file_input_details_of_yojson "FileDetails") _list path;
   }
    : create_benefit_application_input)

let credit_code_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AwsAccountId" _list
         path;
     value = value_for_key monetary_value_of_yojson "Value" _list path;
     aws_credit_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "AwsCreditCode" _list
         path;
     status = value_for_key benefit_allocation_status_of_yojson "Status" _list path;
     issued_at = value_for_key timestamp_of_yojson "IssuedAt" _list path;
     expires_at = value_for_key timestamp_of_yojson "ExpiresAt" _list path;
   }
    : credit_code)

let credit_codes_of_yojson tree path = list_of_yojson credit_code_of_yojson tree path

let credit_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allocated_amount = value_for_key monetary_value_of_yojson "AllocatedAmount" _list path;
     issued_amount = value_for_key monetary_value_of_yojson "IssuedAmount" _list path;
     codes = value_for_key credit_codes_of_yojson "Codes" _list path;
   }
    : credit_details)

let disassociate_benefit_application_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key benefit_application_id_of_yojson "Id") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Revision")
         _list path;
   }
    : disassociate_benefit_application_resource_output)

let disassociate_benefit_application_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     benefit_application_identifier =
       value_for_key benefit_application_identifier_of_yojson "BenefitApplicationIdentifier" _list
         path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
   }
    : disassociate_benefit_application_resource_input)

let disbursement_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disbursed_amount =
       option_of_yojson (value_for_key monetary_value_of_yojson "DisbursedAmount") _list path;
     issuance_details =
       option_of_yojson (value_for_key issuance_detail_of_yojson "IssuanceDetails") _list path;
   }
    : disbursement_details)

let file_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "application/msword" -> DOC
    | `String "application/vnd.openxmlformats-officedocument.wordprocessingml.document" -> DOCX
    | `String "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" -> XLSX
    | `String "application/vnd.openxmlformats-officedocument.presentationml.presentation" -> PPTX
    | `String "application/pdf" -> PDF
    | `String "image/png" -> PNG
    | `String "image/jpeg" -> JPG
    | `String "image/svg+xml" -> SVG
    | `String "text/csv" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileType" value)
    | _ -> raise (deserialize_wrong_type_error path "FileType")
     : file_type)
    : file_type)

let file_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_ur_i = value_for_key file_ur_i_of_yojson "FileURI" _list path;
     business_use_case =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "BusinessUseCase")
         _list path;
     file_name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FileName")
         _list path;
     file_status =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FileStatus")
         _list path;
     file_status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "FileStatusReason")
         _list path;
     file_type = option_of_yojson (value_for_key file_type_of_yojson "FileType") _list path;
     created_by =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "CreatedBy")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
   }
    : file_detail)

let file_details_of_yojson tree path = list_of_yojson file_detail_of_yojson tree path

let fulfillment_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "DisbursementDetails" -> DisbursementDetails (disbursement_details_of_yojson value_ path)
   | "ConsumableDetails" -> ConsumableDetails (consumable_details_of_yojson value_ path)
   | "CreditDetails" -> CreditDetails (credit_details_of_yojson value_ path)
   | "AccessDetails" -> AccessDetails (access_details_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "FulfillmentDetails" unknown)
    : fulfillment_details)

let get_benefit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Id")
         _list path;
     catalog = option_of_yojson (value_for_key catalog_name_of_yojson "Catalog") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description")
         _list path;
     programs = option_of_yojson (value_for_key programs_of_yojson "Programs") _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     benefit_request_schema =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson
            "BenefitRequestSchema")
         _list path;
     status = option_of_yojson (value_for_key benefit_status_of_yojson "Status") _list path;
   }
    : get_benefit_output)

let get_benefit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     identifier =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Identifier" _list
         path;
   }
    : get_benefit_input)

let get_benefit_allocation_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key benefit_allocation_id_of_yojson "Id") _list path;
     catalog = option_of_yojson (value_for_key catalog_name_of_yojson "Catalog") _list path;
     arn = option_of_yojson (value_for_key benefit_allocation_arn_of_yojson "Arn") _list path;
     name =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name")
         _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Description")
         _list path;
     status =
       option_of_yojson (value_for_key benefit_allocation_status_of_yojson "Status") _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "StatusReason")
         _list path;
     benefit_application_id =
       option_of_yojson
         (value_for_key benefit_application_id_of_yojson "BenefitApplicationId")
         _list path;
     benefit_id = option_of_yojson (value_for_key benefit_id_of_yojson "BenefitId") _list path;
     fulfillment_type =
       option_of_yojson (value_for_key fulfillment_type_of_yojson "FulfillmentType") _list path;
     applicable_benefit_ids =
       option_of_yojson
         (value_for_key benefit_identifiers_of_yojson "ApplicableBenefitIds")
         _list path;
     fulfillment_detail =
       option_of_yojson (value_for_key fulfillment_details_of_yojson "FulfillmentDetail") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     starts_at = option_of_yojson (value_for_key timestamp_of_yojson "StartsAt") _list path;
     expires_at = option_of_yojson (value_for_key timestamp_of_yojson "ExpiresAt") _list path;
   }
    : get_benefit_allocation_output)

let get_benefit_allocation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     identifier = value_for_key benefit_allocation_identifier_of_yojson "Identifier" _list path;
   }
    : get_benefit_allocation_input)

let status_reason_code_of_yojson = string_of_yojson
let status_reason_codes_of_yojson tree path = list_of_yojson status_reason_code_of_yojson tree path

let get_benefit_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key benefit_application_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     catalog = option_of_yojson (value_for_key catalog_name_of_yojson "Catalog") _list path;
     benefit_id = option_of_yojson (value_for_key benefit_id_of_yojson "BenefitId") _list path;
     name = option_of_yojson (value_for_key benefit_application_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key benefit_application_description_of_yojson "Description")
         _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     benefit_application_details =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson
            "BenefitApplicationDetails")
         _list path;
     programs = option_of_yojson (value_for_key programs_of_yojson "Programs") _list path;
     status =
       option_of_yojson (value_for_key benefit_application_status_of_yojson "Status") _list path;
     stage = option_of_yojson (value_for_key benefit_application_stage_of_yojson "Stage") _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "StatusReason")
         _list path;
     status_reason_code =
       option_of_yojson (value_for_key status_reason_code_of_yojson "StatusReasonCode") _list path;
     status_reason_codes =
       option_of_yojson (value_for_key status_reason_codes_of_yojson "StatusReasonCodes") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Revision")
         _list path;
     associated_resources =
       option_of_yojson (value_for_key arns_of_yojson "AssociatedResources") _list path;
     partner_contacts =
       option_of_yojson (value_for_key contacts_of_yojson "PartnerContacts") _list path;
     file_details = option_of_yojson (value_for_key file_details_of_yojson "FileDetails") _list path;
   }
    : get_benefit_application_output)

let get_benefit_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     identifier = value_for_key benefit_application_identifier_of_yojson "Identifier" _list path;
   }
    : get_benefit_application_input)

let list_benefit_allocations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     benefit_allocation_summaries =
       option_of_yojson
         (value_for_key benefit_allocation_summaries_of_yojson "BenefitAllocationSummaries")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_benefit_allocations_output)

let list_benefit_allocations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     benefit_identifiers =
       option_of_yojson
         (value_for_key benefit_identifiers_of_yojson "BenefitIdentifiers")
         _list path;
     benefit_application_identifiers =
       option_of_yojson
         (value_for_key benefit_application_identifier_list_of_yojson
            "BenefitApplicationIdentifiers")
         _list path;
     status =
       option_of_yojson (value_for_key benefit_allocation_status_list_of_yojson "Status") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_benefit_allocations_input)

let list_benefit_applications_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     benefit_application_summaries =
       option_of_yojson
         (value_for_key benefit_application_summaries_of_yojson "BenefitApplicationSummaries")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_benefit_applications_output)

let stages_of_yojson tree path = list_of_yojson benefit_application_stage_of_yojson tree path
let statuses_of_yojson tree path = list_of_yojson benefit_application_status_of_yojson tree path

let list_benefit_applications_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     programs = option_of_yojson (value_for_key programs_of_yojson "Programs") _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     benefit_identifiers =
       option_of_yojson
         (value_for_key benefit_identifiers_of_yojson "BenefitIdentifiers")
         _list path;
     status = option_of_yojson (value_for_key statuses_of_yojson "Status") _list path;
     stages = option_of_yojson (value_for_key stages_of_yojson "Stages") _list path;
     associated_resources =
       option_of_yojson
         (value_for_key associated_resources_of_yojson "AssociatedResources")
         _list path;
     associated_resource_arns =
       option_of_yojson (value_for_key arns_of_yojson "AssociatedResourceArns") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_benefit_applications_input)

let list_benefits_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     benefit_summaries =
       option_of_yojson (value_for_key benefit_summaries_of_yojson "BenefitSummaries") _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_benefits_output)

let list_benefits_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     programs = option_of_yojson (value_for_key programs_of_yojson "Programs") _list path;
     fulfillment_types =
       option_of_yojson (value_for_key fulfillment_types_of_yojson "FulfillmentTypes") _list path;
     status = option_of_yojson (value_for_key benefit_statuses_of_yojson "Status") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "NextToken")
         _list path;
   }
    : list_benefits_input)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let taggable_resource_arn_of_yojson = string_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key taggable_resource_arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let update_benefit_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key benefit_application_id_of_yojson "Id") _list path;
     arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Arn")
         _list path;
     revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Revision")
         _list path;
   }
    : update_benefit_application_output)

let update_benefit_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     client_token =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ClientToken" _list
         path;
     name = option_of_yojson (value_for_key benefit_application_name_of_yojson "Name") _list path;
     description =
       option_of_yojson
         (value_for_key benefit_application_description_of_yojson "Description")
         _list path;
     identifier = value_for_key benefit_application_identifier_of_yojson "Identifier" _list path;
     revision =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Revision" _list path;
     benefit_application_details =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.document_of_yojson
            "BenefitApplicationDetails")
         _list path;
     partner_contacts =
       option_of_yojson (value_for_key contacts_of_yojson "PartnerContacts") _list path;
     file_details =
       option_of_yojson (value_for_key file_input_details_of_yojson "FileDetails") _list path;
   }
    : update_benefit_application_input)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     quota_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "QuotaCode" _list
         path;
   }
    : service_quota_exceeded_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_resource_arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tags_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let submit_benefit_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let submit_benefit_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     identifier = value_for_key benefit_application_identifier_of_yojson "Identifier" _list path;
   }
    : submit_benefit_application_input)

let recall_benefit_application_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let recall_benefit_application_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_name_of_yojson "Catalog" _list path;
     client_token =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ClientToken")
         _list path;
     identifier = value_for_key benefit_application_identifier_of_yojson "Identifier" _list path;
     reason =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Reason" _list path;
   }
    : recall_benefit_application_input)
