open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("code", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | REQUEST_VALIDATION_FAILED -> `String "REQUEST_VALIDATION_FAILED"
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ( "resourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason);
    ]

let handshake_status_to_yojson (x : handshake_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACCEPTED -> `String "ACCEPTED"
  | REJECTED -> `String "REJECTED"
  | CANCELED -> `String "CANCELED"
  | EXPIRED -> `String "EXPIRED"

let arn_to_yojson = string_to_yojson
let channel_handshake_id_to_yojson = string_to_yojson

let accept_channel_handshake_detail_to_yojson (x : accept_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("status", option_to_yojson handshake_status_to_yojson x.status);
    ]

let accept_channel_handshake_response_to_yojson (x : accept_channel_handshake_response) =
  assoc_to_yojson
    [
      ( "channelHandshakeDetail",
        option_to_yojson accept_channel_handshake_detail_to_yojson x.channel_handshake_detail );
    ]

let channel_handshake_identifier_to_yojson = string_to_yojson
let catalog_to_yojson = string_to_yojson

let accept_channel_handshake_request_to_yojson (x : accept_channel_handshake_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("identifier", Some (channel_handshake_identifier_to_yojson x.identifier));
    ]

let account_id_to_yojson = string_to_yojson
let account_id_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let associated_resource_id_to_yojson = string_to_yojson
let associated_resource_identifier_to_yojson = string_to_yojson

let associated_resource_identifier_list_to_yojson tree =
  list_to_yojson associated_resource_identifier_to_yojson tree

let association_type_to_yojson (x : association_type) =
  match x with
  | DOWNSTREAM_SELLER -> `String "DOWNSTREAM_SELLER"
  | END_CUSTOMER -> `String "END_CUSTOMER"
  | INTERNAL -> `String "INTERNAL"

let association_type_list_to_yojson tree = list_to_yojson association_type_to_yojson tree

let cancel_channel_handshake_detail_to_yojson (x : cancel_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("status", option_to_yojson handshake_status_to_yojson x.status);
    ]

let cancel_channel_handshake_response_to_yojson (x : cancel_channel_handshake_response) =
  assoc_to_yojson
    [
      ( "channelHandshakeDetail",
        option_to_yojson cancel_channel_handshake_detail_to_yojson x.channel_handshake_detail );
    ]

let cancel_channel_handshake_request_to_yojson (x : cancel_channel_handshake_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("identifier", Some (channel_handshake_identifier_to_yojson x.identifier));
    ]

let note_to_yojson = string_to_yojson
let program_management_account_identifier_to_yojson = string_to_yojson

let revoke_service_period_payload_to_yojson (x : revoke_service_period_payload) =
  assoc_to_yojson
    [
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("note", option_to_yojson note_to_yojson x.note);
    ]

let date_time_to_yojson = timestamp_iso_8601_to_yojson
let minimum_notice_days_to_yojson = string_to_yojson

let service_period_type_to_yojson (x : service_period_type) =
  match x with
  | MINIMUM_NOTICE_PERIOD -> `String "MINIMUM_NOTICE_PERIOD"
  | FIXED_COMMITMENT_PERIOD -> `String "FIXED_COMMITMENT_PERIOD"

let start_service_period_payload_to_yojson (x : start_service_period_payload) =
  assoc_to_yojson
    [
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("note", option_to_yojson note_to_yojson x.note);
      ("servicePeriodType", Some (service_period_type_to_yojson x.service_period_type));
      ("minimumNoticeDays", option_to_yojson minimum_notice_days_to_yojson x.minimum_notice_days);
      ("endDate", option_to_yojson date_time_to_yojson x.end_date);
    ]

let channel_handshake_payload_to_yojson (x : channel_handshake_payload) =
  match x with
  | StartServicePeriodPayload arg ->
      assoc_to_yojson
        [ ("startServicePeriodPayload", Some (start_service_period_payload_to_yojson arg)) ]
  | RevokeServicePeriodPayload arg ->
      assoc_to_yojson
        [ ("revokeServicePeriodPayload", Some (revoke_service_period_payload_to_yojson arg)) ]

let program_to_yojson (x : program) =
  match x with
  | SOLUTION_PROVIDER -> `String "SOLUTION_PROVIDER"
  | DISTRIBUTION -> `String "DISTRIBUTION"
  | DISTRIBUTION_SELLER -> `String "DISTRIBUTION_SELLER"

let program_management_account_handshake_detail_to_yojson
    (x : program_management_account_handshake_detail) =
  assoc_to_yojson [ ("program", option_to_yojson program_to_yojson x.program) ]

let revoke_service_period_handshake_detail_to_yojson (x : revoke_service_period_handshake_detail) =
  assoc_to_yojson
    [
      ("note", option_to_yojson note_to_yojson x.note);
      ("servicePeriodType", option_to_yojson service_period_type_to_yojson x.service_period_type);
      ("minimumNoticeDays", option_to_yojson minimum_notice_days_to_yojson x.minimum_notice_days);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("endDate", option_to_yojson date_time_to_yojson x.end_date);
    ]

let start_service_period_handshake_detail_to_yojson (x : start_service_period_handshake_detail) =
  assoc_to_yojson
    [
      ("note", option_to_yojson note_to_yojson x.note);
      ("servicePeriodType", option_to_yojson service_period_type_to_yojson x.service_period_type);
      ("minimumNoticeDays", option_to_yojson minimum_notice_days_to_yojson x.minimum_notice_days);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("endDate", option_to_yojson date_time_to_yojson x.end_date);
    ]

let handshake_detail_to_yojson (x : handshake_detail) =
  match x with
  | StartServicePeriodHandshakeDetail arg ->
      assoc_to_yojson
        [
          ( "startServicePeriodHandshakeDetail",
            Some (start_service_period_handshake_detail_to_yojson arg) );
        ]
  | RevokeServicePeriodHandshakeDetail arg ->
      assoc_to_yojson
        [
          ( "revokeServicePeriodHandshakeDetail",
            Some (revoke_service_period_handshake_detail_to_yojson arg) );
        ]
  | ProgramManagementAccountHandshakeDetail arg ->
      assoc_to_yojson
        [
          ( "programManagementAccountHandshakeDetail",
            Some (program_management_account_handshake_detail_to_yojson arg) );
        ]

let partner_profile_display_name_to_yojson = string_to_yojson

let handshake_type_to_yojson (x : handshake_type) =
  match x with
  | START_SERVICE_PERIOD -> `String "START_SERVICE_PERIOD"
  | REVOKE_SERVICE_PERIOD -> `String "REVOKE_SERVICE_PERIOD"
  | PROGRAM_MANAGEMENT_ACCOUNT -> `String "PROGRAM_MANAGEMENT_ACCOUNT"

let channel_handshake_summary_to_yojson (x : channel_handshake_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("handshakeType", option_to_yojson handshake_type_to_yojson x.handshake_type);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("senderAccountId", option_to_yojson account_id_to_yojson x.sender_account_id);
      ( "senderDisplayName",
        option_to_yojson partner_profile_display_name_to_yojson x.sender_display_name );
      ("receiverAccountId", option_to_yojson account_id_to_yojson x.receiver_account_id);
      ( "associatedResourceId",
        option_to_yojson associated_resource_id_to_yojson x.associated_resource_id );
      ("detail", option_to_yojson handshake_detail_to_yojson x.detail);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("status", option_to_yojson handshake_status_to_yojson x.status);
    ]

let channel_handshake_summaries_to_yojson tree =
  list_to_yojson channel_handshake_summary_to_yojson tree

let client_token_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let coverage_to_yojson (x : coverage) =
  match x with
  | ENTIRE_ORGANIZATION -> `String "ENTIRE_ORGANIZATION"
  | MANAGEMENT_ACCOUNT_ONLY -> `String "MANAGEMENT_ACCOUNT_ONLY"

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("quotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
    ]

let create_channel_handshake_detail_to_yojson (x : create_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let create_channel_handshake_response_to_yojson (x : create_channel_handshake_response) =
  assoc_to_yojson
    [
      ( "channelHandshakeDetail",
        option_to_yojson create_channel_handshake_detail_to_yojson x.channel_handshake_detail );
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_channel_handshake_request_to_yojson (x : create_channel_handshake_request) =
  assoc_to_yojson
    [
      ("handshakeType", Some (handshake_type_to_yojson x.handshake_type));
      ("catalog", Some (catalog_to_yojson x.catalog));
      ( "associatedResourceIdentifier",
        Some (associated_resource_identifier_to_yojson x.associated_resource_identifier) );
      ("payload", option_to_yojson channel_handshake_payload_to_yojson x.payload);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let program_management_account_id_to_yojson = string_to_yojson

let create_program_management_account_detail_to_yojson
    (x : create_program_management_account_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson program_management_account_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let create_program_management_account_response_to_yojson
    (x : create_program_management_account_response) =
  assoc_to_yojson
    [
      ( "programManagementAccountDetail",
        option_to_yojson create_program_management_account_detail_to_yojson
          x.program_management_account_detail );
    ]

let program_management_account_display_name_to_yojson = string_to_yojson

let create_program_management_account_request_to_yojson
    (x : create_program_management_account_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("program", Some (program_to_yojson x.program));
      ("displayName", Some (program_management_account_display_name_to_yojson x.display_name));
      ("accountId", Some (account_id_to_yojson x.account_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let relationship_id_to_yojson = string_to_yojson

let create_relationship_detail_to_yojson (x : create_relationship_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson relationship_id_to_yojson x.id);
    ]

let create_relationship_response_to_yojson (x : create_relationship_response) =
  assoc_to_yojson
    [
      ( "relationshipDetail",
        option_to_yojson create_relationship_detail_to_yojson x.relationship_detail );
    ]

let resold_unified_operations_to_yojson (x : resold_unified_operations) =
  assoc_to_yojson
    [
      ("coverage", Some (coverage_to_yojson x.coverage));
      ("tamLocation", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tam_location));
      ("chargeAccountId", option_to_yojson account_id_to_yojson x.charge_account_id);
    ]

let provider_to_yojson (x : provider) =
  match x with
  | DISTRIBUTOR -> `String "DISTRIBUTOR"
  | DISTRIBUTION_SELLER -> `String "DISTRIBUTION_SELLER"

let partner_led_support_to_yojson (x : partner_led_support) =
  assoc_to_yojson
    [
      ("coverage", Some (coverage_to_yojson x.coverage));
      ("provider", option_to_yojson provider_to_yojson x.provider);
      ("tamLocation", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tam_location));
    ]

let resold_enterprise_to_yojson (x : resold_enterprise) =
  assoc_to_yojson
    [
      ("coverage", Some (coverage_to_yojson x.coverage));
      ("tamLocation", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tam_location));
      ("chargeAccountId", option_to_yojson account_id_to_yojson x.charge_account_id);
    ]

let support_plan_to_yojson (x : support_plan) =
  match x with
  | ResoldEnterprise arg ->
      assoc_to_yojson [ ("resoldEnterprise", Some (resold_enterprise_to_yojson arg)) ]
  | PartnerLedSupport arg ->
      assoc_to_yojson [ ("partnerLedSupport", Some (partner_led_support_to_yojson arg)) ]
  | ResoldUnifiedOperations arg ->
      assoc_to_yojson
        [ ("resoldUnifiedOperations", Some (resold_unified_operations_to_yojson arg)) ]

let sector_to_yojson (x : sector) =
  match x with
  | COMMERCIAL -> `String "COMMERCIAL"
  | GOVERNMENT -> `String "GOVERNMENT"
  | GOVERNMENT_EXCEPTION -> `String "GOVERNMENT_EXCEPTION"

let resale_account_model_to_yojson (x : resale_account_model) =
  match x with
  | DISTRIBUTOR -> `String "DISTRIBUTOR"
  | END_CUSTOMER -> `String "END_CUSTOMER"
  | SOLUTION_PROVIDER -> `String "SOLUTION_PROVIDER"

let relationship_display_name_to_yojson = string_to_yojson

let create_relationship_request_to_yojson (x : create_relationship_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("associationType", Some (association_type_to_yojson x.association_type));
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("associatedAccountId", Some (account_id_to_yojson x.associated_account_id));
      ("displayName", Some (relationship_display_name_to_yojson x.display_name));
      ("resaleAccountModel", option_to_yojson resale_account_model_to_yojson x.resale_account_model);
      ("sector", Some (sector_to_yojson x.sector));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("requestedSupportPlan", option_to_yojson support_plan_to_yojson x.requested_support_plan);
    ]

let delete_program_management_account_response_to_yojson = unit_to_yojson

let delete_program_management_account_request_to_yojson
    (x : delete_program_management_account_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("identifier", Some (program_management_account_identifier_to_yojson x.identifier));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_relationship_response_to_yojson = unit_to_yojson
let relationship_identifier_to_yojson = string_to_yojson

let delete_relationship_request_to_yojson (x : delete_relationship_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("identifier", Some (relationship_identifier_to_yojson x.identifier));
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let revision_to_yojson = string_to_yojson

let relationship_detail_to_yojson (x : relationship_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson relationship_id_to_yojson x.id);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("associationType", option_to_yojson association_type_to_yojson x.association_type);
      ( "programManagementAccountId",
        option_to_yojson program_management_account_id_to_yojson x.program_management_account_id );
      ("associatedAccountId", option_to_yojson account_id_to_yojson x.associated_account_id);
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
      ("resaleAccountModel", option_to_yojson resale_account_model_to_yojson x.resale_account_model);
      ("sector", option_to_yojson sector_to_yojson x.sector);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
    ]

let get_relationship_response_to_yojson (x : get_relationship_response) =
  assoc_to_yojson
    [ ("relationshipDetail", option_to_yojson relationship_detail_to_yojson x.relationship_detail) ]

let get_relationship_request_to_yojson (x : get_relationship_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("identifier", Some (relationship_identifier_to_yojson x.identifier));
    ]

let handshake_status_list_to_yojson tree = list_to_yojson handshake_status_to_yojson tree
let next_token_to_yojson = string_to_yojson

let list_channel_handshakes_response_to_yojson (x : list_channel_handshakes_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson channel_handshake_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let program_management_account_type_sort_name_to_yojson
    (x : program_management_account_type_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "Ascending" | DESCENDING -> `String "Descending"

let program_management_account_type_sort_to_yojson (x : program_management_account_type_sort) =
  assoc_to_yojson
    [
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
      ("sortBy", Some (program_management_account_type_sort_name_to_yojson x.sort_by));
    ]

let revoke_service_period_type_sort_name_to_yojson (x : revoke_service_period_type_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let revoke_service_period_type_sort_to_yojson (x : revoke_service_period_type_sort) =
  assoc_to_yojson
    [
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
      ("sortBy", Some (revoke_service_period_type_sort_name_to_yojson x.sort_by));
    ]

let start_service_period_type_sort_name_to_yojson (x : start_service_period_type_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let start_service_period_type_sort_to_yojson (x : start_service_period_type_sort) =
  assoc_to_yojson
    [
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
      ("sortBy", Some (start_service_period_type_sort_name_to_yojson x.sort_by));
    ]

let list_channel_handshakes_type_sort_to_yojson (x : list_channel_handshakes_type_sort) =
  match x with
  | StartServicePeriodTypeSort arg ->
      assoc_to_yojson
        [ ("startServicePeriodTypeSort", Some (start_service_period_type_sort_to_yojson arg)) ]
  | RevokeServicePeriodTypeSort arg ->
      assoc_to_yojson
        [ ("revokeServicePeriodTypeSort", Some (revoke_service_period_type_sort_to_yojson arg)) ]
  | ProgramManagementAccountTypeSort arg ->
      assoc_to_yojson
        [
          ( "programManagementAccountTypeSort",
            Some (program_management_account_type_sort_to_yojson arg) );
        ]

let program_list_to_yojson tree = list_to_yojson program_to_yojson tree

let program_management_account_type_filters_to_yojson (x : program_management_account_type_filters)
    =
  assoc_to_yojson [ ("programs", option_to_yojson program_list_to_yojson x.programs) ]

let service_period_type_list_to_yojson tree = list_to_yojson service_period_type_to_yojson tree

let revoke_service_period_type_filters_to_yojson (x : revoke_service_period_type_filters) =
  assoc_to_yojson
    [
      ( "servicePeriodTypes",
        option_to_yojson service_period_type_list_to_yojson x.service_period_types );
    ]

let start_service_period_type_filters_to_yojson (x : start_service_period_type_filters) =
  assoc_to_yojson
    [
      ( "servicePeriodTypes",
        option_to_yojson service_period_type_list_to_yojson x.service_period_types );
    ]

let list_channel_handshakes_type_filters_to_yojson (x : list_channel_handshakes_type_filters) =
  match x with
  | StartServicePeriodTypeFilters arg ->
      assoc_to_yojson
        [
          ("startServicePeriodTypeFilters", Some (start_service_period_type_filters_to_yojson arg));
        ]
  | RevokeServicePeriodTypeFilters arg ->
      assoc_to_yojson
        [
          ("revokeServicePeriodTypeFilters", Some (revoke_service_period_type_filters_to_yojson arg));
        ]
  | ProgramManagementAccountTypeFilters arg ->
      assoc_to_yojson
        [
          ( "programManagementAccountTypeFilters",
            Some (program_management_account_type_filters_to_yojson arg) );
        ]

let participant_type_to_yojson (x : participant_type) =
  match x with SENDER -> `String "SENDER" | RECEIVER -> `String "RECEIVER"

let list_channel_handshakes_request_to_yojson (x : list_channel_handshakes_request) =
  assoc_to_yojson
    [
      ("handshakeType", Some (handshake_type_to_yojson x.handshake_type));
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("participantType", Some (participant_type_to_yojson x.participant_type));
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("statuses", option_to_yojson handshake_status_list_to_yojson x.statuses);
      ( "associatedResourceIdentifiers",
        option_to_yojson associated_resource_identifier_list_to_yojson
          x.associated_resource_identifiers );
      ( "handshakeTypeFilters",
        option_to_yojson list_channel_handshakes_type_filters_to_yojson x.handshake_type_filters );
      ( "handshakeTypeSort",
        option_to_yojson list_channel_handshakes_type_sort_to_yojson x.handshake_type_sort );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let program_management_account_status_to_yojson (x : program_management_account_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"
  | INACTIVE -> `String "INACTIVE"

let program_management_account_summary_to_yojson (x : program_management_account_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson program_management_account_id_to_yojson x.id);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("program", option_to_yojson program_to_yojson x.program);
      ( "displayName",
        option_to_yojson program_management_account_display_name_to_yojson x.display_name );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("status", option_to_yojson program_management_account_status_to_yojson x.status);
    ]

let program_management_account_summaries_to_yojson tree =
  list_to_yojson program_management_account_summary_to_yojson tree

let list_program_management_accounts_response_to_yojson
    (x : list_program_management_accounts_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson program_management_account_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_program_management_accounts_sort_name_to_yojson
    (x : list_program_management_accounts_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let list_program_management_accounts_sort_base_to_yojson
    (x : list_program_management_accounts_sort_base) =
  assoc_to_yojson
    [
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
      ("sortBy", Some (list_program_management_accounts_sort_name_to_yojson x.sort_by));
    ]

let program_management_account_status_list_to_yojson tree =
  list_to_yojson program_management_account_status_to_yojson tree

let program_management_account_display_name_list_to_yojson tree =
  list_to_yojson program_management_account_display_name_to_yojson tree

let list_program_management_accounts_request_to_yojson
    (x : list_program_management_accounts_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "displayNames",
        option_to_yojson program_management_account_display_name_list_to_yojson x.display_names );
      ("programs", option_to_yojson program_list_to_yojson x.programs);
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
      ("statuses", option_to_yojson program_management_account_status_list_to_yojson x.statuses);
      ("sort", option_to_yojson list_program_management_accounts_sort_base_to_yojson x.sort);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let relationship_summary_to_yojson (x : relationship_summary) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson relationship_id_to_yojson x.id);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("associationType", option_to_yojson association_type_to_yojson x.association_type);
      ( "programManagementAccountId",
        option_to_yojson program_management_account_id_to_yojson x.program_management_account_id );
      ("associatedAccountId", option_to_yojson account_id_to_yojson x.associated_account_id);
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
      ("sector", option_to_yojson sector_to_yojson x.sector);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
    ]

let relationship_summaries_to_yojson tree = list_to_yojson relationship_summary_to_yojson tree

let list_relationships_response_to_yojson (x : list_relationships_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson relationship_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_relationships_sort_name_to_yojson (x : list_relationships_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let list_relationships_sort_base_to_yojson (x : list_relationships_sort_base) =
  assoc_to_yojson
    [
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
      ("sortBy", Some (list_relationships_sort_name_to_yojson x.sort_by));
    ]

let program_management_account_identifier_list_to_yojson tree =
  list_to_yojson program_management_account_identifier_to_yojson tree

let relationship_display_name_list_to_yojson tree =
  list_to_yojson relationship_display_name_to_yojson tree

let list_relationships_request_to_yojson (x : list_relationships_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("associatedAccountIds", option_to_yojson account_id_list_to_yojson x.associated_account_ids);
      ("associationTypes", option_to_yojson association_type_list_to_yojson x.association_types);
      ("displayNames", option_to_yojson relationship_display_name_list_to_yojson x.display_names);
      ( "programManagementAccountIdentifiers",
        option_to_yojson program_management_account_identifier_list_to_yojson
          x.program_management_account_identifiers );
      ("sort", option_to_yojson list_relationships_sort_base_to_yojson x.sort);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let taggable_arn_to_yojson = string_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (taggable_arn_to_yojson x.resource_arn)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (taggable_arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (taggable_arn_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let reject_channel_handshake_detail_to_yojson (x : reject_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("status", option_to_yojson handshake_status_to_yojson x.status);
    ]

let reject_channel_handshake_response_to_yojson (x : reject_channel_handshake_response) =
  assoc_to_yojson
    [
      ( "channelHandshakeDetail",
        option_to_yojson reject_channel_handshake_detail_to_yojson x.channel_handshake_detail );
    ]

let reject_channel_handshake_request_to_yojson (x : reject_channel_handshake_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("identifier", Some (channel_handshake_identifier_to_yojson x.identifier));
    ]

let update_program_management_account_detail_to_yojson
    (x : update_program_management_account_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson program_management_account_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ( "displayName",
        option_to_yojson program_management_account_display_name_to_yojson x.display_name );
    ]

let update_program_management_account_response_to_yojson
    (x : update_program_management_account_response) =
  assoc_to_yojson
    [
      ( "programManagementAccountDetail",
        option_to_yojson update_program_management_account_detail_to_yojson
          x.program_management_account_detail );
    ]

let update_program_management_account_request_to_yojson
    (x : update_program_management_account_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("identifier", Some (program_management_account_identifier_to_yojson x.identifier));
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ( "displayName",
        option_to_yojson program_management_account_display_name_to_yojson x.display_name );
    ]

let update_relationship_detail_to_yojson (x : update_relationship_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson relationship_id_to_yojson x.id);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
    ]

let update_relationship_response_to_yojson (x : update_relationship_response) =
  assoc_to_yojson
    [
      ( "relationshipDetail",
        option_to_yojson update_relationship_detail_to_yojson x.relationship_detail );
    ]

let update_relationship_request_to_yojson (x : update_relationship_request) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("identifier", Some (relationship_identifier_to_yojson x.identifier));
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
      ("requestedSupportPlan", option_to_yojson support_plan_to_yojson x.requested_support_plan);
    ]
