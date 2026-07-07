open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"
  | REQUEST_VALIDATION_FAILED -> `String "REQUEST_VALIDATION_FAILED"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("code", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let arn_to_yojson = string_to_yojson
let relationship_id_to_yojson = string_to_yojson
let revision_to_yojson = string_to_yojson
let relationship_display_name_to_yojson = string_to_yojson

let update_relationship_detail_to_yojson (x : update_relationship_detail) =
  assoc_to_yojson
    [
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("id", option_to_yojson relationship_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let update_relationship_response_to_yojson (x : update_relationship_response) =
  assoc_to_yojson
    [
      ( "relationshipDetail",
        option_to_yojson update_relationship_detail_to_yojson x.relationship_detail );
    ]

let catalog_to_yojson = string_to_yojson
let relationship_identifier_to_yojson = string_to_yojson
let program_management_account_identifier_to_yojson = string_to_yojson

let coverage_to_yojson (x : coverage) =
  match x with
  | MANAGEMENT_ACCOUNT_ONLY -> `String "MANAGEMENT_ACCOUNT_ONLY"
  | ENTIRE_ORGANIZATION -> `String "ENTIRE_ORGANIZATION"

let account_id_to_yojson = string_to_yojson

let resold_enterprise_to_yojson (x : resold_enterprise) =
  assoc_to_yojson
    [
      ("chargeAccountId", option_to_yojson account_id_to_yojson x.charge_account_id);
      ("tamLocation", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tam_location));
      ("coverage", Some (coverage_to_yojson x.coverage));
    ]

let provider_to_yojson (x : provider) =
  match x with
  | DISTRIBUTION_SELLER -> `String "DISTRIBUTION_SELLER"
  | DISTRIBUTOR -> `String "DISTRIBUTOR"

let partner_led_support_to_yojson (x : partner_led_support) =
  assoc_to_yojson
    [
      ("tamLocation", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tam_location));
      ("provider", option_to_yojson provider_to_yojson x.provider);
      ("coverage", Some (coverage_to_yojson x.coverage));
    ]

let resold_unified_operations_to_yojson (x : resold_unified_operations) =
  assoc_to_yojson
    [
      ("chargeAccountId", option_to_yojson account_id_to_yojson x.charge_account_id);
      ("tamLocation", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.tam_location));
      ("coverage", Some (coverage_to_yojson x.coverage));
    ]

let support_plan_to_yojson (x : support_plan) =
  match x with
  | ResoldUnifiedOperations arg ->
      assoc_to_yojson
        [ ("resoldUnifiedOperations", Some (resold_unified_operations_to_yojson arg)) ]
  | PartnerLedSupport arg ->
      assoc_to_yojson [ ("partnerLedSupport", Some (partner_led_support_to_yojson arg)) ]
  | ResoldEnterprise arg ->
      assoc_to_yojson [ ("resoldEnterprise", Some (resold_enterprise_to_yojson arg)) ]

let update_relationship_request_to_yojson (x : update_relationship_request) =
  assoc_to_yojson
    [
      ("requestedSupportPlan", option_to_yojson support_plan_to_yojson x.requested_support_plan);
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("identifier", Some (relationship_identifier_to_yojson x.identifier));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type );
      ( "resourceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason);
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let program_management_account_id_to_yojson = string_to_yojson
let program_management_account_display_name_to_yojson = string_to_yojson

let update_program_management_account_detail_to_yojson
    (x : update_program_management_account_detail) =
  assoc_to_yojson
    [
      ( "displayName",
        option_to_yojson program_management_account_display_name_to_yojson x.display_name );
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson program_management_account_id_to_yojson x.id);
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
      ( "displayName",
        option_to_yojson program_management_account_display_name_to_yojson x.display_name );
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("identifier", Some (program_management_account_identifier_to_yojson x.identifier));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (taggable_arn_to_yojson x.resource_arn));
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceArn", Some (taggable_arn_to_yojson x.resource_arn));
    ]

let start_service_period_type_sort_name_to_yojson (x : start_service_period_type_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "Descending" | ASCENDING -> `String "Ascending"

let start_service_period_type_sort_to_yojson (x : start_service_period_type_sort) =
  assoc_to_yojson
    [
      ("sortBy", Some (start_service_period_type_sort_name_to_yojson x.sort_by));
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let service_period_type_to_yojson (x : service_period_type) =
  match x with
  | FIXED_COMMITMENT_PERIOD -> `String "FIXED_COMMITMENT_PERIOD"
  | MINIMUM_NOTICE_PERIOD -> `String "MINIMUM_NOTICE_PERIOD"

let service_period_type_list_to_yojson tree = list_to_yojson service_period_type_to_yojson tree

let start_service_period_type_filters_to_yojson (x : start_service_period_type_filters) =
  assoc_to_yojson
    [
      ( "servicePeriodTypes",
        option_to_yojson service_period_type_list_to_yojson x.service_period_types );
    ]

let note_to_yojson = string_to_yojson
let minimum_notice_days_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_iso_8601_to_yojson

let start_service_period_payload_to_yojson (x : start_service_period_payload) =
  assoc_to_yojson
    [
      ("endDate", option_to_yojson date_time_to_yojson x.end_date);
      ("minimumNoticeDays", option_to_yojson minimum_notice_days_to_yojson x.minimum_notice_days);
      ("servicePeriodType", Some (service_period_type_to_yojson x.service_period_type));
      ("note", option_to_yojson note_to_yojson x.note);
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
    ]

let start_service_period_handshake_detail_to_yojson (x : start_service_period_handshake_detail) =
  assoc_to_yojson
    [
      ("endDate", option_to_yojson date_time_to_yojson x.end_date);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("minimumNoticeDays", option_to_yojson minimum_notice_days_to_yojson x.minimum_notice_days);
      ("servicePeriodType", option_to_yojson service_period_type_to_yojson x.service_period_type);
      ("note", option_to_yojson note_to_yojson x.note);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("quotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let sector_to_yojson (x : sector) =
  match x with
  | GOVERNMENT_EXCEPTION -> `String "GOVERNMENT_EXCEPTION"
  | GOVERNMENT -> `String "GOVERNMENT"
  | COMMERCIAL -> `String "COMMERCIAL"

let revoke_service_period_type_sort_name_to_yojson (x : revoke_service_period_type_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let revoke_service_period_type_sort_to_yojson (x : revoke_service_period_type_sort) =
  assoc_to_yojson
    [
      ("sortBy", Some (revoke_service_period_type_sort_name_to_yojson x.sort_by));
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let revoke_service_period_type_filters_to_yojson (x : revoke_service_period_type_filters) =
  assoc_to_yojson
    [
      ( "servicePeriodTypes",
        option_to_yojson service_period_type_list_to_yojson x.service_period_types );
    ]

let revoke_service_period_payload_to_yojson (x : revoke_service_period_payload) =
  assoc_to_yojson
    [
      ("note", option_to_yojson note_to_yojson x.note);
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
    ]

let revoke_service_period_handshake_detail_to_yojson (x : revoke_service_period_handshake_detail) =
  assoc_to_yojson
    [
      ("endDate", option_to_yojson date_time_to_yojson x.end_date);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("minimumNoticeDays", option_to_yojson minimum_notice_days_to_yojson x.minimum_notice_days);
      ("servicePeriodType", option_to_yojson service_period_type_to_yojson x.service_period_type);
      ("note", option_to_yojson note_to_yojson x.note);
    ]

let resale_account_model_to_yojson (x : resale_account_model) =
  match x with
  | SOLUTION_PROVIDER -> `String "SOLUTION_PROVIDER"
  | END_CUSTOMER -> `String "END_CUSTOMER"
  | DISTRIBUTOR -> `String "DISTRIBUTOR"

let association_type_to_yojson (x : association_type) =
  match x with
  | INTERNAL -> `String "INTERNAL"
  | END_CUSTOMER -> `String "END_CUSTOMER"
  | DOWNSTREAM_SELLER -> `String "DOWNSTREAM_SELLER"

let relationship_summary_to_yojson (x : relationship_summary) =
  assoc_to_yojson
    [
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("sector", option_to_yojson sector_to_yojson x.sector);
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
      ("associatedAccountId", option_to_yojson account_id_to_yojson x.associated_account_id);
      ( "programManagementAccountId",
        option_to_yojson program_management_account_id_to_yojson x.program_management_account_id );
      ("associationType", option_to_yojson association_type_to_yojson x.association_type);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("id", option_to_yojson relationship_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let relationship_summaries_to_yojson tree = list_to_yojson relationship_summary_to_yojson tree

let relationship_display_name_list_to_yojson tree =
  list_to_yojson relationship_display_name_to_yojson tree

let relationship_detail_to_yojson (x : relationship_detail) =
  assoc_to_yojson
    [
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("sector", option_to_yojson sector_to_yojson x.sector);
      ("resaleAccountModel", option_to_yojson resale_account_model_to_yojson x.resale_account_model);
      ("displayName", option_to_yojson relationship_display_name_to_yojson x.display_name);
      ("associatedAccountId", option_to_yojson account_id_to_yojson x.associated_account_id);
      ( "programManagementAccountId",
        option_to_yojson program_management_account_id_to_yojson x.program_management_account_id );
      ("associationType", option_to_yojson association_type_to_yojson x.association_type);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("id", option_to_yojson relationship_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let channel_handshake_id_to_yojson = string_to_yojson

let handshake_status_to_yojson (x : handshake_status) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | CANCELED -> `String "CANCELED"
  | REJECTED -> `String "REJECTED"
  | ACCEPTED -> `String "ACCEPTED"
  | PENDING -> `String "PENDING"

let reject_channel_handshake_detail_to_yojson (x : reject_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("status", option_to_yojson handshake_status_to_yojson x.status);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
    ]

let reject_channel_handshake_response_to_yojson (x : reject_channel_handshake_response) =
  assoc_to_yojson
    [
      ( "channelHandshakeDetail",
        option_to_yojson reject_channel_handshake_detail_to_yojson x.channel_handshake_detail );
    ]

let channel_handshake_identifier_to_yojson = string_to_yojson

let reject_channel_handshake_request_to_yojson (x : reject_channel_handshake_request) =
  assoc_to_yojson
    [
      ("identifier", Some (channel_handshake_identifier_to_yojson x.identifier));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let program_management_account_type_sort_name_to_yojson
    (x : program_management_account_type_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let program_management_account_type_sort_to_yojson (x : program_management_account_type_sort) =
  assoc_to_yojson
    [
      ("sortBy", Some (program_management_account_type_sort_name_to_yojson x.sort_by));
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let program_to_yojson (x : program) =
  match x with
  | DISTRIBUTION_SELLER -> `String "DISTRIBUTION_SELLER"
  | DISTRIBUTION -> `String "DISTRIBUTION"
  | SOLUTION_PROVIDER -> `String "SOLUTION_PROVIDER"

let program_list_to_yojson tree = list_to_yojson program_to_yojson tree

let program_management_account_type_filters_to_yojson (x : program_management_account_type_filters)
    =
  assoc_to_yojson [ ("programs", option_to_yojson program_list_to_yojson x.programs) ]

let program_management_account_status_to_yojson (x : program_management_account_status) =
  match x with
  | INACTIVE -> `String "INACTIVE"
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"

let program_management_account_summary_to_yojson (x : program_management_account_summary) =
  assoc_to_yojson
    [
      ("status", option_to_yojson program_management_account_status_to_yojson x.status);
      ("startDate", option_to_yojson date_time_to_yojson x.start_date);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "displayName",
        option_to_yojson program_management_account_display_name_to_yojson x.display_name );
      ("program", option_to_yojson program_to_yojson x.program);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("revision", option_to_yojson revision_to_yojson x.revision);
      ("id", option_to_yojson program_management_account_id_to_yojson x.id);
    ]

let program_management_account_summaries_to_yojson tree =
  list_to_yojson program_management_account_summary_to_yojson tree

let program_management_account_status_list_to_yojson tree =
  list_to_yojson program_management_account_status_to_yojson tree

let program_management_account_identifier_list_to_yojson tree =
  list_to_yojson program_management_account_identifier_to_yojson tree

let program_management_account_handshake_detail_to_yojson
    (x : program_management_account_handshake_detail) =
  assoc_to_yojson [ ("program", option_to_yojson program_to_yojson x.program) ]

let program_management_account_display_name_list_to_yojson tree =
  list_to_yojson program_management_account_display_name_to_yojson tree

let partner_profile_display_name_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (taggable_arn_to_yojson x.resource_arn)) ]

let participant_type_to_yojson (x : participant_type) =
  match x with RECEIVER -> `String "RECEIVER" | SENDER -> `String "SENDER"

let next_token_to_yojson = string_to_yojson

let list_relationships_sort_name_to_yojson (x : list_relationships_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let list_relationships_sort_base_to_yojson (x : list_relationships_sort_base) =
  assoc_to_yojson
    [
      ("sortBy", Some (list_relationships_sort_name_to_yojson x.sort_by));
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let list_relationships_response_to_yojson (x : list_relationships_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", option_to_yojson relationship_summaries_to_yojson x.items);
    ]

let account_id_list_to_yojson tree = list_to_yojson account_id_to_yojson tree
let association_type_list_to_yojson tree = list_to_yojson association_type_to_yojson tree

let list_relationships_request_to_yojson (x : list_relationships_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("sort", option_to_yojson list_relationships_sort_base_to_yojson x.sort);
      ( "programManagementAccountIdentifiers",
        option_to_yojson program_management_account_identifier_list_to_yojson
          x.program_management_account_identifiers );
      ("displayNames", option_to_yojson relationship_display_name_list_to_yojson x.display_names);
      ("associationTypes", option_to_yojson association_type_list_to_yojson x.association_types);
      ("associatedAccountIds", option_to_yojson account_id_list_to_yojson x.associated_account_ids);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let list_program_management_accounts_sort_name_to_yojson
    (x : list_program_management_accounts_sort_name) =
  match x with UPDATED_AT -> `String "UpdatedAt"

let list_program_management_accounts_sort_base_to_yojson
    (x : list_program_management_accounts_sort_base) =
  assoc_to_yojson
    [
      ("sortBy", Some (list_program_management_accounts_sort_name_to_yojson x.sort_by));
      ("sortOrder", Some (sort_order_to_yojson x.sort_order));
    ]

let list_program_management_accounts_response_to_yojson
    (x : list_program_management_accounts_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", option_to_yojson program_management_account_summaries_to_yojson x.items);
    ]

let list_program_management_accounts_request_to_yojson
    (x : list_program_management_accounts_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("sort", option_to_yojson list_program_management_accounts_sort_base_to_yojson x.sort);
      ("statuses", option_to_yojson program_management_account_status_list_to_yojson x.statuses);
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
      ("programs", option_to_yojson program_list_to_yojson x.programs);
      ( "displayNames",
        option_to_yojson program_management_account_display_name_list_to_yojson x.display_names );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let list_channel_handshakes_type_sort_to_yojson (x : list_channel_handshakes_type_sort) =
  match x with
  | ProgramManagementAccountTypeSort arg ->
      assoc_to_yojson
        [
          ( "programManagementAccountTypeSort",
            Some (program_management_account_type_sort_to_yojson arg) );
        ]
  | RevokeServicePeriodTypeSort arg ->
      assoc_to_yojson
        [ ("revokeServicePeriodTypeSort", Some (revoke_service_period_type_sort_to_yojson arg)) ]
  | StartServicePeriodTypeSort arg ->
      assoc_to_yojson
        [ ("startServicePeriodTypeSort", Some (start_service_period_type_sort_to_yojson arg)) ]

let list_channel_handshakes_type_filters_to_yojson (x : list_channel_handshakes_type_filters) =
  match x with
  | ProgramManagementAccountTypeFilters arg ->
      assoc_to_yojson
        [
          ( "programManagementAccountTypeFilters",
            Some (program_management_account_type_filters_to_yojson arg) );
        ]
  | RevokeServicePeriodTypeFilters arg ->
      assoc_to_yojson
        [
          ("revokeServicePeriodTypeFilters", Some (revoke_service_period_type_filters_to_yojson arg));
        ]
  | StartServicePeriodTypeFilters arg ->
      assoc_to_yojson
        [
          ("startServicePeriodTypeFilters", Some (start_service_period_type_filters_to_yojson arg));
        ]

let handshake_type_to_yojson (x : handshake_type) =
  match x with
  | PROGRAM_MANAGEMENT_ACCOUNT -> `String "PROGRAM_MANAGEMENT_ACCOUNT"
  | REVOKE_SERVICE_PERIOD -> `String "REVOKE_SERVICE_PERIOD"
  | START_SERVICE_PERIOD -> `String "START_SERVICE_PERIOD"

let associated_resource_id_to_yojson = string_to_yojson

let handshake_detail_to_yojson (x : handshake_detail) =
  match x with
  | ProgramManagementAccountHandshakeDetail arg ->
      assoc_to_yojson
        [
          ( "programManagementAccountHandshakeDetail",
            Some (program_management_account_handshake_detail_to_yojson arg) );
        ]
  | RevokeServicePeriodHandshakeDetail arg ->
      assoc_to_yojson
        [
          ( "revokeServicePeriodHandshakeDetail",
            Some (revoke_service_period_handshake_detail_to_yojson arg) );
        ]
  | StartServicePeriodHandshakeDetail arg ->
      assoc_to_yojson
        [
          ( "startServicePeriodHandshakeDetail",
            Some (start_service_period_handshake_detail_to_yojson arg) );
        ]

let channel_handshake_summary_to_yojson (x : channel_handshake_summary) =
  assoc_to_yojson
    [
      ("status", option_to_yojson handshake_status_to_yojson x.status);
      ("updatedAt", option_to_yojson date_time_to_yojson x.updated_at);
      ("createdAt", option_to_yojson date_time_to_yojson x.created_at);
      ("detail", option_to_yojson handshake_detail_to_yojson x.detail);
      ( "associatedResourceId",
        option_to_yojson associated_resource_id_to_yojson x.associated_resource_id );
      ("receiverAccountId", option_to_yojson account_id_to_yojson x.receiver_account_id);
      ( "senderDisplayName",
        option_to_yojson partner_profile_display_name_to_yojson x.sender_display_name );
      ("senderAccountId", option_to_yojson account_id_to_yojson x.sender_account_id);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("handshakeType", option_to_yojson handshake_type_to_yojson x.handshake_type);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
    ]

let channel_handshake_summaries_to_yojson tree =
  list_to_yojson channel_handshake_summary_to_yojson tree

let list_channel_handshakes_response_to_yojson (x : list_channel_handshakes_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", option_to_yojson channel_handshake_summaries_to_yojson x.items);
    ]

let handshake_status_list_to_yojson tree = list_to_yojson handshake_status_to_yojson tree
let associated_resource_identifier_to_yojson = string_to_yojson

let associated_resource_identifier_list_to_yojson tree =
  list_to_yojson associated_resource_identifier_to_yojson tree

let list_channel_handshakes_request_to_yojson (x : list_channel_handshakes_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "handshakeTypeSort",
        option_to_yojson list_channel_handshakes_type_sort_to_yojson x.handshake_type_sort );
      ( "handshakeTypeFilters",
        option_to_yojson list_channel_handshakes_type_filters_to_yojson x.handshake_type_filters );
      ( "associatedResourceIdentifiers",
        option_to_yojson associated_resource_identifier_list_to_yojson
          x.associated_resource_identifiers );
      ("statuses", option_to_yojson handshake_status_list_to_yojson x.statuses);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("participantType", Some (participant_type_to_yojson x.participant_type));
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("handshakeType", Some (handshake_type_to_yojson x.handshake_type));
    ]

let get_relationship_response_to_yojson (x : get_relationship_response) =
  assoc_to_yojson
    [ ("relationshipDetail", option_to_yojson relationship_detail_to_yojson x.relationship_detail) ]

let get_relationship_request_to_yojson (x : get_relationship_request) =
  assoc_to_yojson
    [
      ("identifier", Some (relationship_identifier_to_yojson x.identifier));
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let delete_relationship_response_to_yojson = unit_to_yojson
let client_token_to_yojson = string_to_yojson

let delete_relationship_request_to_yojson (x : delete_relationship_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("identifier", Some (relationship_identifier_to_yojson x.identifier));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let delete_program_management_account_response_to_yojson = unit_to_yojson

let delete_program_management_account_request_to_yojson
    (x : delete_program_management_account_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("identifier", Some (program_management_account_identifier_to_yojson x.identifier));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let create_relationship_detail_to_yojson (x : create_relationship_detail) =
  assoc_to_yojson
    [
      ("id", option_to_yojson relationship_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
    ]

let create_relationship_response_to_yojson (x : create_relationship_response) =
  assoc_to_yojson
    [
      ( "relationshipDetail",
        option_to_yojson create_relationship_detail_to_yojson x.relationship_detail );
    ]

let create_relationship_request_to_yojson (x : create_relationship_request) =
  assoc_to_yojson
    [
      ("requestedSupportPlan", option_to_yojson support_plan_to_yojson x.requested_support_plan);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("sector", Some (sector_to_yojson x.sector));
      ("resaleAccountModel", option_to_yojson resale_account_model_to_yojson x.resale_account_model);
      ("displayName", Some (relationship_display_name_to_yojson x.display_name));
      ("associatedAccountId", Some (account_id_to_yojson x.associated_account_id));
      ( "programManagementAccountIdentifier",
        Some
          (program_management_account_identifier_to_yojson x.program_management_account_identifier)
      );
      ("associationType", Some (association_type_to_yojson x.association_type));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let create_program_management_account_detail_to_yojson
    (x : create_program_management_account_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson program_management_account_id_to_yojson x.id);
    ]

let create_program_management_account_response_to_yojson
    (x : create_program_management_account_response) =
  assoc_to_yojson
    [
      ( "programManagementAccountDetail",
        option_to_yojson create_program_management_account_detail_to_yojson
          x.program_management_account_detail );
    ]

let create_program_management_account_request_to_yojson
    (x : create_program_management_account_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("accountId", Some (account_id_to_yojson x.account_id));
      ("displayName", Some (program_management_account_display_name_to_yojson x.display_name));
      ("program", Some (program_to_yojson x.program));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let create_channel_handshake_detail_to_yojson (x : create_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
    ]

let create_channel_handshake_response_to_yojson (x : create_channel_handshake_response) =
  assoc_to_yojson
    [
      ( "channelHandshakeDetail",
        option_to_yojson create_channel_handshake_detail_to_yojson x.channel_handshake_detail );
    ]

let channel_handshake_payload_to_yojson (x : channel_handshake_payload) =
  match x with
  | RevokeServicePeriodPayload arg ->
      assoc_to_yojson
        [ ("revokeServicePeriodPayload", Some (revoke_service_period_payload_to_yojson arg)) ]
  | StartServicePeriodPayload arg ->
      assoc_to_yojson
        [ ("startServicePeriodPayload", Some (start_service_period_payload_to_yojson arg)) ]

let create_channel_handshake_request_to_yojson (x : create_channel_handshake_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("payload", option_to_yojson channel_handshake_payload_to_yojson x.payload);
      ( "associatedResourceIdentifier",
        Some (associated_resource_identifier_to_yojson x.associated_resource_identifier) );
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("handshakeType", Some (handshake_type_to_yojson x.handshake_type));
    ]

let cancel_channel_handshake_detail_to_yojson (x : cancel_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("status", option_to_yojson handshake_status_to_yojson x.status);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
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
      ("identifier", Some (channel_handshake_identifier_to_yojson x.identifier));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let accept_channel_handshake_detail_to_yojson (x : accept_channel_handshake_detail) =
  assoc_to_yojson
    [
      ("status", option_to_yojson handshake_status_to_yojson x.status);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson channel_handshake_id_to_yojson x.id);
    ]

let accept_channel_handshake_response_to_yojson (x : accept_channel_handshake_response) =
  assoc_to_yojson
    [
      ( "channelHandshakeDetail",
        option_to_yojson accept_channel_handshake_detail_to_yojson x.channel_handshake_detail );
    ]

let accept_channel_handshake_request_to_yojson (x : accept_channel_handshake_request) =
  assoc_to_yojson
    [
      ("identifier", Some (channel_handshake_identifier_to_yojson x.identifier));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]
