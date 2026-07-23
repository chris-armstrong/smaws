open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "code" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "REQUEST_VALIDATION_FAILED" -> REQUEST_VALIDATION_FAILED
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
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode")
         _list path;
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode")
         _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     resource_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId")
         _list path;
     resource_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType")
         _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "reason")
         _list path;
   }
    : access_denied_exception)

let handshake_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACCEPTED" -> ACCEPTED
    | `String "REJECTED" -> REJECTED
    | `String "CANCELED" -> CANCELED
    | `String "EXPIRED" -> EXPIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "HandshakeStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "HandshakeStatus")
     : handshake_status)
    : handshake_status)

let arn_of_yojson = string_of_yojson
let channel_handshake_id_of_yojson = string_of_yojson

let accept_channel_handshake_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key channel_handshake_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     status = option_of_yojson (value_for_key handshake_status_of_yojson "status") _list path;
   }
    : accept_channel_handshake_detail)

let accept_channel_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channel_handshake_detail =
       option_of_yojson
         (value_for_key accept_channel_handshake_detail_of_yojson "channelHandshakeDetail")
         _list path;
   }
    : accept_channel_handshake_response)

let channel_handshake_identifier_of_yojson = string_of_yojson
let catalog_of_yojson = string_of_yojson

let accept_channel_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     identifier = value_for_key channel_handshake_identifier_of_yojson "identifier" _list path;
   }
    : accept_channel_handshake_request)

let account_id_of_yojson = string_of_yojson
let account_id_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let associated_resource_id_of_yojson = string_of_yojson
let associated_resource_identifier_of_yojson = string_of_yojson

let associated_resource_identifier_list_of_yojson tree path =
  list_of_yojson associated_resource_identifier_of_yojson tree path

let association_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOWNSTREAM_SELLER" -> DOWNSTREAM_SELLER
    | `String "END_CUSTOMER" -> END_CUSTOMER
    | `String "INTERNAL" -> INTERNAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssociationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssociationType")
     : association_type)
    : association_type)

let association_type_list_of_yojson tree path = list_of_yojson association_type_of_yojson tree path

let cancel_channel_handshake_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key channel_handshake_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     status = option_of_yojson (value_for_key handshake_status_of_yojson "status") _list path;
   }
    : cancel_channel_handshake_detail)

let cancel_channel_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channel_handshake_detail =
       option_of_yojson
         (value_for_key cancel_channel_handshake_detail_of_yojson "channelHandshakeDetail")
         _list path;
   }
    : cancel_channel_handshake_response)

let cancel_channel_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     identifier = value_for_key channel_handshake_identifier_of_yojson "identifier" _list path;
   }
    : cancel_channel_handshake_request)

let note_of_yojson = string_of_yojson
let program_management_account_identifier_of_yojson = string_of_yojson

let revoke_service_period_payload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     program_management_account_identifier =
       value_for_key program_management_account_identifier_of_yojson
         "programManagementAccountIdentifier" _list path;
     note = option_of_yojson (value_for_key note_of_yojson "note") _list path;
   }
    : revoke_service_period_payload)

let date_time_of_yojson = timestamp_iso_8601_of_yojson
let minimum_notice_days_of_yojson = string_of_yojson

let service_period_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MINIMUM_NOTICE_PERIOD" -> MINIMUM_NOTICE_PERIOD
    | `String "FIXED_COMMITMENT_PERIOD" -> FIXED_COMMITMENT_PERIOD
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServicePeriodType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServicePeriodType")
     : service_period_type)
    : service_period_type)

let start_service_period_payload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     program_management_account_identifier =
       value_for_key program_management_account_identifier_of_yojson
         "programManagementAccountIdentifier" _list path;
     note = option_of_yojson (value_for_key note_of_yojson "note") _list path;
     service_period_type =
       value_for_key service_period_type_of_yojson "servicePeriodType" _list path;
     minimum_notice_days =
       option_of_yojson (value_for_key minimum_notice_days_of_yojson "minimumNoticeDays") _list path;
     end_date = option_of_yojson (value_for_key date_time_of_yojson "endDate") _list path;
   }
    : start_service_period_payload)

let channel_handshake_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "startServicePeriodPayload" ->
       StartServicePeriodPayload (start_service_period_payload_of_yojson value_ path)
   | "revokeServicePeriodPayload" ->
       RevokeServicePeriodPayload (revoke_service_period_payload_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ChannelHandshakePayload" unknown)
    : channel_handshake_payload)

let program_of_yojson (tree : t) path =
  ((match tree with
    | `String "SOLUTION_PROVIDER" -> SOLUTION_PROVIDER
    | `String "DISTRIBUTION" -> DISTRIBUTION
    | `String "DISTRIBUTION_SELLER" -> DISTRIBUTION_SELLER
    | `String value -> raise (deserialize_unknown_enum_value_error path "Program" value)
    | _ -> raise (deserialize_wrong_type_error path "Program")
     : program)
    : program)

let program_management_account_handshake_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ program = option_of_yojson (value_for_key program_of_yojson "program") _list path }
    : program_management_account_handshake_detail)

let revoke_service_period_handshake_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     note = option_of_yojson (value_for_key note_of_yojson "note") _list path;
     service_period_type =
       option_of_yojson (value_for_key service_period_type_of_yojson "servicePeriodType") _list path;
     minimum_notice_days =
       option_of_yojson (value_for_key minimum_notice_days_of_yojson "minimumNoticeDays") _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "startDate") _list path;
     end_date = option_of_yojson (value_for_key date_time_of_yojson "endDate") _list path;
   }
    : revoke_service_period_handshake_detail)

let start_service_period_handshake_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     note = option_of_yojson (value_for_key note_of_yojson "note") _list path;
     service_period_type =
       option_of_yojson (value_for_key service_period_type_of_yojson "servicePeriodType") _list path;
     minimum_notice_days =
       option_of_yojson (value_for_key minimum_notice_days_of_yojson "minimumNoticeDays") _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "startDate") _list path;
     end_date = option_of_yojson (value_for_key date_time_of_yojson "endDate") _list path;
   }
    : start_service_period_handshake_detail)

let handshake_detail_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "startServicePeriodHandshakeDetail" ->
       StartServicePeriodHandshakeDetail
         (start_service_period_handshake_detail_of_yojson value_ path)
   | "revokeServicePeriodHandshakeDetail" ->
       RevokeServicePeriodHandshakeDetail
         (revoke_service_period_handshake_detail_of_yojson value_ path)
   | "programManagementAccountHandshakeDetail" ->
       ProgramManagementAccountHandshakeDetail
         (program_management_account_handshake_detail_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "HandshakeDetail" unknown)
    : handshake_detail)

let partner_profile_display_name_of_yojson = string_of_yojson

let handshake_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "START_SERVICE_PERIOD" -> START_SERVICE_PERIOD
    | `String "REVOKE_SERVICE_PERIOD" -> REVOKE_SERVICE_PERIOD
    | `String "PROGRAM_MANAGEMENT_ACCOUNT" -> PROGRAM_MANAGEMENT_ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "HandshakeType" value)
    | _ -> raise (deserialize_wrong_type_error path "HandshakeType")
     : handshake_type)
    : handshake_type)

let channel_handshake_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key channel_handshake_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     handshake_type =
       option_of_yojson (value_for_key handshake_type_of_yojson "handshakeType") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "ownerAccountId") _list path;
     sender_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "senderAccountId") _list path;
     sender_display_name =
       option_of_yojson
         (value_for_key partner_profile_display_name_of_yojson "senderDisplayName")
         _list path;
     receiver_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "receiverAccountId") _list path;
     associated_resource_id =
       option_of_yojson
         (value_for_key associated_resource_id_of_yojson "associatedResourceId")
         _list path;
     detail = option_of_yojson (value_for_key handshake_detail_of_yojson "detail") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key date_time_of_yojson "updatedAt") _list path;
     status = option_of_yojson (value_for_key handshake_status_of_yojson "status") _list path;
   }
    : channel_handshake_summary)

let channel_handshake_summaries_of_yojson tree path =
  list_of_yojson channel_handshake_summary_of_yojson tree path

let client_token_of_yojson = string_of_yojson

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
   }
    : conflict_exception)

let coverage_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENTIRE_ORGANIZATION" -> ENTIRE_ORGANIZATION
    | `String "MANAGEMENT_ACCOUNT_ONLY" -> MANAGEMENT_ACCOUNT_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "Coverage" value)
    | _ -> raise (deserialize_wrong_type_error path "Coverage")
     : coverage)
    : coverage)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     quota_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode" _list
         path;
   }
    : service_quota_exceeded_exception)

let create_channel_handshake_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key channel_handshake_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
   }
    : create_channel_handshake_detail)

let create_channel_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channel_handshake_detail =
       option_of_yojson
         (value_for_key create_channel_handshake_detail_of_yojson "channelHandshakeDetail")
         _list path;
   }
    : create_channel_handshake_response)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "key" _list path;
     value = value_for_key tag_value_of_yojson "value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let create_channel_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     handshake_type = value_for_key handshake_type_of_yojson "handshakeType" _list path;
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     associated_resource_identifier =
       value_for_key associated_resource_identifier_of_yojson "associatedResourceIdentifier" _list
         path;
     payload =
       option_of_yojson (value_for_key channel_handshake_payload_of_yojson "payload") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_channel_handshake_request)

let program_management_account_id_of_yojson = string_of_yojson

let create_program_management_account_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key program_management_account_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
   }
    : create_program_management_account_detail)

let create_program_management_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     program_management_account_detail =
       option_of_yojson
         (value_for_key create_program_management_account_detail_of_yojson
            "programManagementAccountDetail")
         _list path;
   }
    : create_program_management_account_response)

let program_management_account_display_name_of_yojson = string_of_yojson

let create_program_management_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     program = value_for_key program_of_yojson "program" _list path;
     display_name =
       value_for_key program_management_account_display_name_of_yojson "displayName" _list path;
     account_id = value_for_key account_id_of_yojson "accountId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : create_program_management_account_request)

let relationship_id_of_yojson = string_of_yojson

let create_relationship_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key relationship_id_of_yojson "id") _list path;
   }
    : create_relationship_detail)

let create_relationship_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relationship_detail =
       option_of_yojson
         (value_for_key create_relationship_detail_of_yojson "relationshipDetail")
         _list path;
   }
    : create_relationship_response)

let resold_unified_operations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     coverage = value_for_key coverage_of_yojson "coverage" _list path;
     tam_location =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "tamLocation" _list
         path;
     charge_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "chargeAccountId") _list path;
   }
    : resold_unified_operations)

let provider_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISTRIBUTOR" -> DISTRIBUTOR
    | `String "DISTRIBUTION_SELLER" -> DISTRIBUTION_SELLER
    | `String value -> raise (deserialize_unknown_enum_value_error path "Provider" value)
    | _ -> raise (deserialize_wrong_type_error path "Provider")
     : provider)
    : provider)

let partner_led_support_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     coverage = value_for_key coverage_of_yojson "coverage" _list path;
     provider = option_of_yojson (value_for_key provider_of_yojson "provider") _list path;
     tam_location =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "tamLocation" _list
         path;
   }
    : partner_led_support)

let resold_enterprise_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     coverage = value_for_key coverage_of_yojson "coverage" _list path;
     tam_location =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "tamLocation" _list
         path;
     charge_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "chargeAccountId") _list path;
   }
    : resold_enterprise)

let support_plan_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "resoldEnterprise" -> ResoldEnterprise (resold_enterprise_of_yojson value_ path)
   | "partnerLedSupport" -> PartnerLedSupport (partner_led_support_of_yojson value_ path)
   | "resoldUnifiedOperations" ->
       ResoldUnifiedOperations (resold_unified_operations_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "SupportPlan" unknown)
    : support_plan)

let sector_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMMERCIAL" -> COMMERCIAL
    | `String "GOVERNMENT" -> GOVERNMENT
    | `String "GOVERNMENT_EXCEPTION" -> GOVERNMENT_EXCEPTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "Sector" value)
    | _ -> raise (deserialize_wrong_type_error path "Sector")
     : sector)
    : sector)

let resale_account_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISTRIBUTOR" -> DISTRIBUTOR
    | `String "END_CUSTOMER" -> END_CUSTOMER
    | `String "SOLUTION_PROVIDER" -> SOLUTION_PROVIDER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResaleAccountModel" value)
    | _ -> raise (deserialize_wrong_type_error path "ResaleAccountModel")
     : resale_account_model)
    : resale_account_model)

let relationship_display_name_of_yojson = string_of_yojson

let create_relationship_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     association_type = value_for_key association_type_of_yojson "associationType" _list path;
     program_management_account_identifier =
       value_for_key program_management_account_identifier_of_yojson
         "programManagementAccountIdentifier" _list path;
     associated_account_id = value_for_key account_id_of_yojson "associatedAccountId" _list path;
     display_name = value_for_key relationship_display_name_of_yojson "displayName" _list path;
     resale_account_model =
       option_of_yojson
         (value_for_key resale_account_model_of_yojson "resaleAccountModel")
         _list path;
     sector = value_for_key sector_of_yojson "sector" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     requested_support_plan =
       option_of_yojson (value_for_key support_plan_of_yojson "requestedSupportPlan") _list path;
   }
    : create_relationship_request)

let delete_program_management_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_program_management_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     identifier =
       value_for_key program_management_account_identifier_of_yojson "identifier" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : delete_program_management_account_request)

let delete_relationship_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let relationship_identifier_of_yojson = string_of_yojson

let delete_relationship_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     identifier = value_for_key relationship_identifier_of_yojson "identifier" _list path;
     program_management_account_identifier =
       value_for_key program_management_account_identifier_of_yojson
         "programManagementAccountIdentifier" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : delete_relationship_request)

let revision_of_yojson = string_of_yojson

let relationship_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key relationship_id_of_yojson "id") _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     association_type =
       option_of_yojson (value_for_key association_type_of_yojson "associationType") _list path;
     program_management_account_id =
       option_of_yojson
         (value_for_key program_management_account_id_of_yojson "programManagementAccountId")
         _list path;
     associated_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "associatedAccountId") _list path;
     display_name =
       option_of_yojson (value_for_key relationship_display_name_of_yojson "displayName") _list path;
     resale_account_model =
       option_of_yojson
         (value_for_key resale_account_model_of_yojson "resaleAccountModel")
         _list path;
     sector = option_of_yojson (value_for_key sector_of_yojson "sector") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key date_time_of_yojson "updatedAt") _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "startDate") _list path;
   }
    : relationship_detail)

let get_relationship_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relationship_detail =
       option_of_yojson
         (value_for_key relationship_detail_of_yojson "relationshipDetail")
         _list path;
   }
    : get_relationship_response)

let get_relationship_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     program_management_account_identifier =
       value_for_key program_management_account_identifier_of_yojson
         "programManagementAccountIdentifier" _list path;
     identifier = value_for_key relationship_identifier_of_yojson "identifier" _list path;
   }
    : get_relationship_request)

let handshake_status_list_of_yojson tree path = list_of_yojson handshake_status_of_yojson tree path
let next_token_of_yojson = string_of_yojson

let list_channel_handshakes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items =
       option_of_yojson (value_for_key channel_handshake_summaries_of_yojson "items") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_channel_handshakes_response)

let program_management_account_type_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "UpdatedAt" -> UPDATED_AT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ProgramManagementAccountTypeSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "ProgramManagementAccountTypeSortName")
     : program_management_account_type_sort_name)
    : program_management_account_type_sort_name)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ascending" -> ASCENDING
    | `String "Descending" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let program_management_account_type_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "sortOrder" _list path;
     sort_by = value_for_key program_management_account_type_sort_name_of_yojson "sortBy" _list path;
   }
    : program_management_account_type_sort)

let revoke_service_period_type_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "UpdatedAt" -> UPDATED_AT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RevokeServicePeriodTypeSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "RevokeServicePeriodTypeSortName")
     : revoke_service_period_type_sort_name)
    : revoke_service_period_type_sort_name)

let revoke_service_period_type_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "sortOrder" _list path;
     sort_by = value_for_key revoke_service_period_type_sort_name_of_yojson "sortBy" _list path;
   }
    : revoke_service_period_type_sort)

let start_service_period_type_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "UpdatedAt" -> UPDATED_AT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StartServicePeriodTypeSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "StartServicePeriodTypeSortName")
     : start_service_period_type_sort_name)
    : start_service_period_type_sort_name)

let start_service_period_type_sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "sortOrder" _list path;
     sort_by = value_for_key start_service_period_type_sort_name_of_yojson "sortBy" _list path;
   }
    : start_service_period_type_sort)

let list_channel_handshakes_type_sort_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "startServicePeriodTypeSort" ->
       StartServicePeriodTypeSort (start_service_period_type_sort_of_yojson value_ path)
   | "revokeServicePeriodTypeSort" ->
       RevokeServicePeriodTypeSort (revoke_service_period_type_sort_of_yojson value_ path)
   | "programManagementAccountTypeSort" ->
       ProgramManagementAccountTypeSort (program_management_account_type_sort_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ListChannelHandshakesTypeSort" unknown)
    : list_channel_handshakes_type_sort)

let program_list_of_yojson tree path = list_of_yojson program_of_yojson tree path

let program_management_account_type_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ programs = option_of_yojson (value_for_key program_list_of_yojson "programs") _list path }
    : program_management_account_type_filters)

let service_period_type_list_of_yojson tree path =
  list_of_yojson service_period_type_of_yojson tree path

let revoke_service_period_type_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_period_types =
       option_of_yojson
         (value_for_key service_period_type_list_of_yojson "servicePeriodTypes")
         _list path;
   }
    : revoke_service_period_type_filters)

let start_service_period_type_filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_period_types =
       option_of_yojson
         (value_for_key service_period_type_list_of_yojson "servicePeriodTypes")
         _list path;
   }
    : start_service_period_type_filters)

let list_channel_handshakes_type_filters_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "startServicePeriodTypeFilters" ->
       StartServicePeriodTypeFilters (start_service_period_type_filters_of_yojson value_ path)
   | "revokeServicePeriodTypeFilters" ->
       RevokeServicePeriodTypeFilters (revoke_service_period_type_filters_of_yojson value_ path)
   | "programManagementAccountTypeFilters" ->
       ProgramManagementAccountTypeFilters
         (program_management_account_type_filters_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "ListChannelHandshakesTypeFilters" unknown)
    : list_channel_handshakes_type_filters)

let participant_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SENDER" -> SENDER
    | `String "RECEIVER" -> RECEIVER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ParticipantType" value)
    | _ -> raise (deserialize_wrong_type_error path "ParticipantType")
     : participant_type)
    : participant_type)

let list_channel_handshakes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     handshake_type = value_for_key handshake_type_of_yojson "handshakeType" _list path;
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     participant_type = value_for_key participant_type_of_yojson "participantType" _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     statuses =
       option_of_yojson (value_for_key handshake_status_list_of_yojson "statuses") _list path;
     associated_resource_identifiers =
       option_of_yojson
         (value_for_key associated_resource_identifier_list_of_yojson
            "associatedResourceIdentifiers")
         _list path;
     handshake_type_filters =
       option_of_yojson
         (value_for_key list_channel_handshakes_type_filters_of_yojson "handshakeTypeFilters")
         _list path;
     handshake_type_sort =
       option_of_yojson
         (value_for_key list_channel_handshakes_type_sort_of_yojson "handshakeTypeSort")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_channel_handshakes_request)

let program_management_account_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProgramManagementAccountStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProgramManagementAccountStatus")
     : program_management_account_status)
    : program_management_account_status)

let program_management_account_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key program_management_account_id_of_yojson "id") _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     program = option_of_yojson (value_for_key program_of_yojson "program") _list path;
     display_name =
       option_of_yojson
         (value_for_key program_management_account_display_name_of_yojson "displayName")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key date_time_of_yojson "updatedAt") _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "startDate") _list path;
     status =
       option_of_yojson
         (value_for_key program_management_account_status_of_yojson "status")
         _list path;
   }
    : program_management_account_summary)

let program_management_account_summaries_of_yojson tree path =
  list_of_yojson program_management_account_summary_of_yojson tree path

let list_program_management_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items =
       option_of_yojson
         (value_for_key program_management_account_summaries_of_yojson "items")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_program_management_accounts_response)

let list_program_management_accounts_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "UpdatedAt" -> UPDATED_AT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ListProgramManagementAccountsSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListProgramManagementAccountsSortName")
     : list_program_management_accounts_sort_name)
    : list_program_management_accounts_sort_name)

let list_program_management_accounts_sort_base_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "sortOrder" _list path;
     sort_by =
       value_for_key list_program_management_accounts_sort_name_of_yojson "sortBy" _list path;
   }
    : list_program_management_accounts_sort_base)

let program_management_account_status_list_of_yojson tree path =
  list_of_yojson program_management_account_status_of_yojson tree path

let program_management_account_display_name_list_of_yojson tree path =
  list_of_yojson program_management_account_display_name_of_yojson tree path

let list_program_management_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     display_names =
       option_of_yojson
         (value_for_key program_management_account_display_name_list_of_yojson "displayNames")
         _list path;
     programs = option_of_yojson (value_for_key program_list_of_yojson "programs") _list path;
     account_ids =
       option_of_yojson (value_for_key account_id_list_of_yojson "accountIds") _list path;
     statuses =
       option_of_yojson
         (value_for_key program_management_account_status_list_of_yojson "statuses")
         _list path;
     sort =
       option_of_yojson
         (value_for_key list_program_management_accounts_sort_base_of_yojson "sort")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_program_management_accounts_request)

let relationship_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key relationship_id_of_yojson "id") _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     association_type =
       option_of_yojson (value_for_key association_type_of_yojson "associationType") _list path;
     program_management_account_id =
       option_of_yojson
         (value_for_key program_management_account_id_of_yojson "programManagementAccountId")
         _list path;
     associated_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "associatedAccountId") _list path;
     display_name =
       option_of_yojson (value_for_key relationship_display_name_of_yojson "displayName") _list path;
     sector = option_of_yojson (value_for_key sector_of_yojson "sector") _list path;
     created_at = option_of_yojson (value_for_key date_time_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key date_time_of_yojson "updatedAt") _list path;
     start_date = option_of_yojson (value_for_key date_time_of_yojson "startDate") _list path;
   }
    : relationship_summary)

let relationship_summaries_of_yojson tree path =
  list_of_yojson relationship_summary_of_yojson tree path

let list_relationships_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = option_of_yojson (value_for_key relationship_summaries_of_yojson "items") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_relationships_response)

let list_relationships_sort_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "UpdatedAt" -> UPDATED_AT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListRelationshipsSortName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListRelationshipsSortName")
     : list_relationships_sort_name)
    : list_relationships_sort_name)

let list_relationships_sort_base_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = value_for_key sort_order_of_yojson "sortOrder" _list path;
     sort_by = value_for_key list_relationships_sort_name_of_yojson "sortBy" _list path;
   }
    : list_relationships_sort_base)

let program_management_account_identifier_list_of_yojson tree path =
  list_of_yojson program_management_account_identifier_of_yojson tree path

let relationship_display_name_list_of_yojson tree path =
  list_of_yojson relationship_display_name_of_yojson tree path

let list_relationships_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     associated_account_ids =
       option_of_yojson (value_for_key account_id_list_of_yojson "associatedAccountIds") _list path;
     association_types =
       option_of_yojson
         (value_for_key association_type_list_of_yojson "associationTypes")
         _list path;
     display_names =
       option_of_yojson
         (value_for_key relationship_display_name_list_of_yojson "displayNames")
         _list path;
     program_management_account_identifiers =
       option_of_yojson
         (value_for_key program_management_account_identifier_list_of_yojson
            "programManagementAccountIdentifiers")
         _list path;
     sort =
       option_of_yojson (value_for_key list_relationships_sort_base_of_yojson "sort") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_relationships_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let taggable_arn_of_yojson = string_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key taggable_arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key taggable_arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let reject_channel_handshake_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key channel_handshake_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     status = option_of_yojson (value_for_key handshake_status_of_yojson "status") _list path;
   }
    : reject_channel_handshake_detail)

let reject_channel_handshake_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     channel_handshake_detail =
       option_of_yojson
         (value_for_key reject_channel_handshake_detail_of_yojson "channelHandshakeDetail")
         _list path;
   }
    : reject_channel_handshake_response)

let reject_channel_handshake_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     identifier = value_for_key channel_handshake_identifier_of_yojson "identifier" _list path;
   }
    : reject_channel_handshake_request)

let update_program_management_account_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key program_management_account_id_of_yojson "id") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     display_name =
       option_of_yojson
         (value_for_key program_management_account_display_name_of_yojson "displayName")
         _list path;
   }
    : update_program_management_account_detail)

let update_program_management_account_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     program_management_account_detail =
       option_of_yojson
         (value_for_key update_program_management_account_detail_of_yojson
            "programManagementAccountDetail")
         _list path;
   }
    : update_program_management_account_response)

let update_program_management_account_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     identifier =
       value_for_key program_management_account_identifier_of_yojson "identifier" _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     display_name =
       option_of_yojson
         (value_for_key program_management_account_display_name_of_yojson "displayName")
         _list path;
   }
    : update_program_management_account_request)

let update_relationship_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key relationship_id_of_yojson "id") _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     display_name =
       option_of_yojson (value_for_key relationship_display_name_of_yojson "displayName") _list path;
   }
    : update_relationship_detail)

let update_relationship_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     relationship_detail =
       option_of_yojson
         (value_for_key update_relationship_detail_of_yojson "relationshipDetail")
         _list path;
   }
    : update_relationship_response)

let update_relationship_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     identifier = value_for_key relationship_identifier_of_yojson "identifier" _list path;
     program_management_account_identifier =
       value_for_key program_management_account_identifier_of_yojson
         "programManagementAccountIdentifier" _list path;
     revision = option_of_yojson (value_for_key revision_of_yojson "revision") _list path;
     display_name =
       option_of_yojson (value_for_key relationship_display_name_of_yojson "displayName") _list path;
     requested_support_plan =
       option_of_yojson (value_for_key support_plan_of_yojson "requestedSupportPlan") _list path;
   }
    : update_relationship_request)
