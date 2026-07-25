open Smaws_Lib.Json.SerializeHelpers
open Types

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
    ]

let data_unavailable_exception_to_yojson (x : data_unavailable_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let rate_type_to_yojson (x : rate_type) =
  match x with
  | BEFORE_DISCOUNTS -> `String "BEFORE_DISCOUNTS"
  | AFTER_DISCOUNTS -> `String "AFTER_DISCOUNTS"
  | AFTER_DISCOUNTS_AND_COMMITMENTS -> `String "AFTER_DISCOUNTS_AND_COMMITMENTS"

let rate_types_to_yojson tree = list_to_yojson rate_type_to_yojson tree

let update_preferences_response_to_yojson (x : update_preferences_response) =
  assoc_to_yojson
    [
      ( "managementAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.management_account_rate_type_selections );
      ( "memberAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.member_account_rate_type_selections );
      ( "standaloneAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.standalone_account_rate_type_selections );
    ]

let update_preferences_request_to_yojson (x : update_preferences_request) =
  assoc_to_yojson
    [
      ( "managementAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.management_account_rate_type_selections );
      ( "memberAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.member_account_rate_type_selections );
      ( "standaloneAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.standalone_account_rate_type_selections );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_keys_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree
let arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn)); ("tagKeys", Some (resource_tag_keys_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson resource_tag_key_to_yojson resource_tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson [ ("arn", Some (arn_to_yojson x.arn)); ("tags", Some (tags_to_yojson x.tags)) ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("arn", Some (arn_to_yojson x.arn)) ]

let get_preferences_response_to_yojson (x : get_preferences_response) =
  assoc_to_yojson
    [
      ( "managementAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.management_account_rate_type_selections );
      ( "memberAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.member_account_rate_type_selections );
      ( "standaloneAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.standalone_account_rate_type_selections );
    ]

let get_preferences_request_to_yojson = unit_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let account_id_to_yojson = string_to_yojson
let reserved_instance_instance_count_to_yojson = int_to_yojson
let uuid_to_yojson = string_to_yojson

let add_reserved_instance_action_to_yojson (x : add_reserved_instance_action) =
  assoc_to_yojson
    [
      ( "reservedInstancesOfferingId",
        option_to_yojson uuid_to_yojson x.reserved_instances_offering_id );
      ("instanceCount", option_to_yojson reserved_instance_instance_count_to_yojson x.instance_count);
    ]

let savings_plan_commitment_to_yojson = double_to_yojson

let add_savings_plan_action_to_yojson (x : add_savings_plan_action) =
  assoc_to_yojson
    [
      ("savingsPlanOfferingId", option_to_yojson uuid_to_yojson x.savings_plan_offering_id);
      ("commitment", option_to_yojson savings_plan_commitment_to_yojson x.commitment);
    ]

let availability_zone_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let batch_create_bill_scenario_commitment_modification_error_code_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_error_code) =
  match x with
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | INVALID_ACCOUNT -> `String "INVALID_ACCOUNT"

let key_to_yojson = string_to_yojson

let batch_create_bill_scenario_commitment_modification_error_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_error) =
  assoc_to_yojson
    [
      ("key", option_to_yojson key_to_yojson x.key);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson batch_create_bill_scenario_commitment_modification_error_code_to_yojson
          x.error_code );
    ]

let batch_create_bill_scenario_commitment_modification_errors_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_commitment_modification_error_to_yojson tree

let negate_savings_plan_action_to_yojson (x : negate_savings_plan_action) =
  assoc_to_yojson [ ("savingsPlanId", option_to_yojson uuid_to_yojson x.savings_plan_id) ]

let negate_reserved_instance_action_to_yojson (x : negate_reserved_instance_action) =
  assoc_to_yojson
    [ ("reservedInstancesId", option_to_yojson uuid_to_yojson x.reserved_instances_id) ]

let bill_scenario_commitment_modification_action_to_yojson
    (x : bill_scenario_commitment_modification_action) =
  match x with
  | AddReservedInstanceAction arg ->
      assoc_to_yojson
        [ ("addReservedInstanceAction", Some (add_reserved_instance_action_to_yojson arg)) ]
  | AddSavingsPlanAction arg ->
      assoc_to_yojson [ ("addSavingsPlanAction", Some (add_savings_plan_action_to_yojson arg)) ]
  | NegateReservedInstanceAction arg ->
      assoc_to_yojson
        [ ("negateReservedInstanceAction", Some (negate_reserved_instance_action_to_yojson arg)) ]
  | NegateSavingsPlanAction arg ->
      assoc_to_yojson
        [ ("negateSavingsPlanAction", Some (negate_savings_plan_action_to_yojson arg)) ]

let usage_group_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson

let batch_create_bill_scenario_commitment_modification_item_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_item) =
  assoc_to_yojson
    [
      ("key", option_to_yojson key_to_yojson x.key);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ( "commitmentAction",
        option_to_yojson bill_scenario_commitment_modification_action_to_yojson x.commitment_action
      );
    ]

let batch_create_bill_scenario_commitment_modification_items_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_commitment_modification_item_to_yojson tree

let batch_create_bill_scenario_commitment_modification_response_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_response) =
  assoc_to_yojson
    [
      ( "items",
        option_to_yojson batch_create_bill_scenario_commitment_modification_items_to_yojson x.items
      );
      ( "errors",
        option_to_yojson batch_create_bill_scenario_commitment_modification_errors_to_yojson
          x.errors );
    ]

let client_token_to_yojson = string_to_yojson

let batch_create_bill_scenario_commitment_modification_entry_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_entry) =
  assoc_to_yojson
    [
      ("key", Some (key_to_yojson x.key));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ( "commitmentAction",
        Some (bill_scenario_commitment_modification_action_to_yojson x.commitment_action) );
    ]

let batch_create_bill_scenario_commitment_modification_entries_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_commitment_modification_entry_to_yojson tree

let batch_create_bill_scenario_commitment_modification_request_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ( "commitmentModifications",
        Some
          (batch_create_bill_scenario_commitment_modification_entries_to_yojson
             x.commitment_modifications) );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let batch_create_bill_scenario_usage_modification_error_code_to_yojson
    (x : batch_create_bill_scenario_usage_modification_error_code) =
  match x with
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | NOT_FOUND -> `String "NOT_FOUND"
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let batch_create_bill_scenario_usage_modification_error_to_yojson
    (x : batch_create_bill_scenario_usage_modification_error) =
  assoc_to_yojson
    [
      ("key", option_to_yojson key_to_yojson x.key);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson batch_create_bill_scenario_usage_modification_error_code_to_yojson
          x.error_code );
    ]

let batch_create_bill_scenario_usage_modification_errors_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_usage_modification_error_to_yojson tree

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let expression_filter_to_yojson (x : expression_filter) =
  assoc_to_yojson
    [
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
      ("matchOptions", option_to_yojson string_list_to_yojson x.match_options);
      ("values", option_to_yojson string_list_to_yojson x.values);
    ]

let rec expression_list_to_yojson tree = list_to_yojson expression_to_yojson tree

and expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("and", option_to_yojson expression_list_to_yojson x.and_);
      ("or", option_to_yojson expression_list_to_yojson x.\#or);
      ("not", option_to_yojson expression_to_yojson x.not);
      ("costCategories", option_to_yojson expression_filter_to_yojson x.cost_categories);
      ("dimensions", option_to_yojson expression_filter_to_yojson x.dimensions);
      ("tags", option_to_yojson expression_filter_to_yojson x.tags);
    ]

let bill_interval_to_yojson (x : bill_interval) =
  assoc_to_yojson
    [
      ( "start",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start );
      ( "end",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_ );
    ]

let operation_to_yojson = string_to_yojson
let usage_type_to_yojson = string_to_yojson
let service_code_to_yojson = string_to_yojson

let historical_usage_entity_to_yojson (x : historical_usage_entity) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ("billInterval", Some (bill_interval_to_yojson x.bill_interval));
      ("filterExpression", Some (expression_to_yojson x.filter_expression));
    ]

let usage_quantity_to_yojson (x : usage_quantity) =
  assoc_to_yojson
    [
      ( "startHour",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_hour );
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
    ]

let usage_quantities_to_yojson tree = list_to_yojson usage_quantity_to_yojson tree

let batch_create_bill_scenario_usage_modification_item_to_yojson
    (x : batch_create_bill_scenario_usage_modification_item) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("quantities", option_to_yojson usage_quantities_to_yojson x.quantities);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("key", option_to_yojson key_to_yojson x.key);
    ]

let batch_create_bill_scenario_usage_modification_items_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_usage_modification_item_to_yojson tree

let batch_create_bill_scenario_usage_modification_response_to_yojson
    (x : batch_create_bill_scenario_usage_modification_response) =
  assoc_to_yojson
    [
      ( "items",
        option_to_yojson batch_create_bill_scenario_usage_modification_items_to_yojson x.items );
      ( "errors",
        option_to_yojson batch_create_bill_scenario_usage_modification_errors_to_yojson x.errors );
    ]

let usage_amount_to_yojson (x : usage_amount) =
  assoc_to_yojson
    [
      ( "startHour",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_hour)
      );
      ("amount", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount));
    ]

let usage_amounts_to_yojson tree = list_to_yojson usage_amount_to_yojson tree

let batch_create_bill_scenario_usage_modification_entry_to_yojson
    (x : batch_create_bill_scenario_usage_modification_entry) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("key", Some (key_to_yojson x.key));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ("amounts", option_to_yojson usage_amounts_to_yojson x.amounts);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
    ]

let batch_create_bill_scenario_usage_modification_entries_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_usage_modification_entry_to_yojson tree

let batch_create_bill_scenario_usage_modification_request_to_yojson
    (x : batch_create_bill_scenario_usage_modification_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ( "usageModifications",
        Some (batch_create_bill_scenario_usage_modification_entries_to_yojson x.usage_modifications)
      );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let batch_create_workload_estimate_usage_code_to_yojson
    (x : batch_create_workload_estimate_usage_code) =
  match x with
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | NOT_FOUND -> `String "NOT_FOUND"
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let batch_create_workload_estimate_usage_error_to_yojson
    (x : batch_create_workload_estimate_usage_error) =
  assoc_to_yojson
    [
      ("key", option_to_yojson key_to_yojson x.key);
      ( "errorCode",
        option_to_yojson batch_create_workload_estimate_usage_code_to_yojson x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
    ]

let batch_create_workload_estimate_usage_errors_to_yojson tree =
  list_to_yojson batch_create_workload_estimate_usage_error_to_yojson tree

let workload_estimate_cost_status_to_yojson (x : workload_estimate_cost_status) =
  match x with VALID -> `String "VALID" | INVALID -> `String "INVALID" | STALE -> `String "STALE"

let currency_code_to_yojson (x : currency_code) = match x with USD -> `String "USD"

let workload_estimate_usage_quantity_to_yojson (x : workload_estimate_usage_quantity) =
  assoc_to_yojson
    [
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
    ]

let batch_create_workload_estimate_usage_item_to_yojson
    (x : batch_create_workload_estimate_usage_item) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("quantity", option_to_yojson workload_estimate_usage_quantity_to_yojson x.quantity);
      ("cost", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.cost);
      ("currency", option_to_yojson currency_code_to_yojson x.currency);
      ("status", option_to_yojson workload_estimate_cost_status_to_yojson x.status);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("key", option_to_yojson key_to_yojson x.key);
    ]

let batch_create_workload_estimate_usage_items_to_yojson tree =
  list_to_yojson batch_create_workload_estimate_usage_item_to_yojson tree

let batch_create_workload_estimate_usage_response_to_yojson
    (x : batch_create_workload_estimate_usage_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson batch_create_workload_estimate_usage_items_to_yojson x.items);
      ("errors", option_to_yojson batch_create_workload_estimate_usage_errors_to_yojson x.errors);
    ]

let batch_create_workload_estimate_usage_entry_to_yojson
    (x : batch_create_workload_estimate_usage_entry) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ("key", Some (key_to_yojson x.key));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ("amount", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount));
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
    ]

let batch_create_workload_estimate_usage_entries_to_yojson tree =
  list_to_yojson batch_create_workload_estimate_usage_entry_to_yojson tree

let batch_create_workload_estimate_usage_request_to_yojson
    (x : batch_create_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
      ("usage", Some (batch_create_workload_estimate_usage_entries_to_yojson x.usage));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let batch_delete_bill_scenario_commitment_modification_error_code_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_error_code) =
  match x with
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let batch_delete_bill_scenario_commitment_modification_error_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_error) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "errorCode",
        option_to_yojson batch_delete_bill_scenario_commitment_modification_error_code_to_yojson
          x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
    ]

let batch_delete_bill_scenario_commitment_modification_errors_to_yojson tree =
  list_to_yojson batch_delete_bill_scenario_commitment_modification_error_to_yojson tree

let batch_delete_bill_scenario_commitment_modification_response_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_delete_bill_scenario_commitment_modification_errors_to_yojson
          x.errors );
    ]

let batch_delete_bill_scenario_commitment_modification_entries_to_yojson tree =
  list_to_yojson resource_id_to_yojson tree

let batch_delete_bill_scenario_commitment_modification_request_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ("ids", Some (batch_delete_bill_scenario_commitment_modification_entries_to_yojson x.ids));
    ]

let batch_delete_bill_scenario_usage_modification_error_code_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_error_code) =
  match x with
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let batch_delete_bill_scenario_usage_modification_error_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_error) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson batch_delete_bill_scenario_usage_modification_error_code_to_yojson
          x.error_code );
    ]

let batch_delete_bill_scenario_usage_modification_errors_to_yojson tree =
  list_to_yojson batch_delete_bill_scenario_usage_modification_error_to_yojson tree

let batch_delete_bill_scenario_usage_modification_response_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_delete_bill_scenario_usage_modification_errors_to_yojson x.errors );
    ]

let batch_delete_bill_scenario_usage_modification_entries_to_yojson tree =
  list_to_yojson resource_id_to_yojson tree

let batch_delete_bill_scenario_usage_modification_request_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ("ids", Some (batch_delete_bill_scenario_usage_modification_entries_to_yojson x.ids));
    ]

let workload_estimate_update_usage_error_code_to_yojson
    (x : workload_estimate_update_usage_error_code) =
  match x with
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | NOT_FOUND -> `String "NOT_FOUND"
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let batch_delete_workload_estimate_usage_error_to_yojson
    (x : batch_delete_workload_estimate_usage_error) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson workload_estimate_update_usage_error_code_to_yojson x.error_code );
    ]

let batch_delete_workload_estimate_usage_errors_to_yojson tree =
  list_to_yojson batch_delete_workload_estimate_usage_error_to_yojson tree

let batch_delete_workload_estimate_usage_response_to_yojson
    (x : batch_delete_workload_estimate_usage_response) =
  assoc_to_yojson
    [ ("errors", option_to_yojson batch_delete_workload_estimate_usage_errors_to_yojson x.errors) ]

let batch_delete_workload_estimate_usage_entries_to_yojson tree =
  list_to_yojson resource_id_to_yojson tree

let batch_delete_workload_estimate_usage_request_to_yojson
    (x : batch_delete_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
      ("ids", Some (batch_delete_workload_estimate_usage_entries_to_yojson x.ids));
    ]

let batch_update_bill_scenario_commitment_modification_error_code_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_error_code) =
  match x with
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | NOT_FOUND -> `String "NOT_FOUND"
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let batch_update_bill_scenario_commitment_modification_error_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_error) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "errorCode",
        option_to_yojson batch_update_bill_scenario_commitment_modification_error_code_to_yojson
          x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
    ]

let batch_update_bill_scenario_commitment_modification_errors_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_commitment_modification_error_to_yojson tree

let bill_scenario_commitment_modification_item_to_yojson
    (x : bill_scenario_commitment_modification_item) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ( "commitmentAction",
        option_to_yojson bill_scenario_commitment_modification_action_to_yojson x.commitment_action
      );
    ]

let bill_scenario_commitment_modification_items_to_yojson tree =
  list_to_yojson bill_scenario_commitment_modification_item_to_yojson tree

let batch_update_bill_scenario_commitment_modification_response_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_scenario_commitment_modification_items_to_yojson x.items);
      ( "errors",
        option_to_yojson batch_update_bill_scenario_commitment_modification_errors_to_yojson
          x.errors );
    ]

let batch_update_bill_scenario_commitment_modification_entry_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_entry) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("group", option_to_yojson usage_group_to_yojson x.group);
    ]

let batch_update_bill_scenario_commitment_modification_entries_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_commitment_modification_entry_to_yojson tree

let batch_update_bill_scenario_commitment_modification_request_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ( "commitmentModifications",
        Some
          (batch_update_bill_scenario_commitment_modification_entries_to_yojson
             x.commitment_modifications) );
    ]

let batch_update_bill_scenario_usage_modification_error_code_to_yojson
    (x : batch_update_bill_scenario_usage_modification_error_code) =
  match x with
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | NOT_FOUND -> `String "NOT_FOUND"
  | CONFLICT -> `String "CONFLICT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let batch_update_bill_scenario_usage_modification_error_to_yojson
    (x : batch_update_bill_scenario_usage_modification_error) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson batch_update_bill_scenario_usage_modification_error_code_to_yojson
          x.error_code );
    ]

let batch_update_bill_scenario_usage_modification_errors_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_usage_modification_error_to_yojson tree

let bill_scenario_usage_modification_item_to_yojson (x : bill_scenario_usage_modification_item) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("quantities", option_to_yojson usage_quantities_to_yojson x.quantities);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
    ]

let bill_scenario_usage_modification_items_to_yojson tree =
  list_to_yojson bill_scenario_usage_modification_item_to_yojson tree

let batch_update_bill_scenario_usage_modification_response_to_yojson
    (x : batch_update_bill_scenario_usage_modification_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_scenario_usage_modification_items_to_yojson x.items);
      ( "errors",
        option_to_yojson batch_update_bill_scenario_usage_modification_errors_to_yojson x.errors );
    ]

let batch_update_bill_scenario_usage_modification_entry_to_yojson
    (x : batch_update_bill_scenario_usage_modification_entry) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("amounts", option_to_yojson usage_amounts_to_yojson x.amounts);
    ]

let batch_update_bill_scenario_usage_modification_entries_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_usage_modification_entry_to_yojson tree

let batch_update_bill_scenario_usage_modification_request_to_yojson
    (x : batch_update_bill_scenario_usage_modification_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ( "usageModifications",
        Some (batch_update_bill_scenario_usage_modification_entries_to_yojson x.usage_modifications)
      );
    ]

let batch_update_workload_estimate_usage_error_to_yojson
    (x : batch_update_workload_estimate_usage_error) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson workload_estimate_update_usage_error_code_to_yojson x.error_code );
    ]

let batch_update_workload_estimate_usage_errors_to_yojson tree =
  list_to_yojson batch_update_workload_estimate_usage_error_to_yojson tree

let workload_estimate_usage_item_to_yojson (x : workload_estimate_usage_item) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("quantity", option_to_yojson workload_estimate_usage_quantity_to_yojson x.quantity);
      ("cost", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.cost);
      ("currency", option_to_yojson currency_code_to_yojson x.currency);
      ("status", option_to_yojson workload_estimate_cost_status_to_yojson x.status);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
    ]

let workload_estimate_usage_items_to_yojson tree =
  list_to_yojson workload_estimate_usage_item_to_yojson tree

let batch_update_workload_estimate_usage_response_to_yojson
    (x : batch_update_workload_estimate_usage_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson workload_estimate_usage_items_to_yojson x.items);
      ("errors", option_to_yojson batch_update_workload_estimate_usage_errors_to_yojson x.errors);
    ]

let batch_update_workload_estimate_usage_entry_to_yojson
    (x : batch_update_workload_estimate_usage_entry) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
    ]

let batch_update_workload_estimate_usage_entries_to_yojson tree =
  list_to_yojson batch_update_workload_estimate_usage_entry_to_yojson tree

let batch_update_workload_estimate_usage_request_to_yojson
    (x : batch_update_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
      ("usage", Some (batch_update_workload_estimate_usage_entries_to_yojson x.usage));
    ]

let cost_amount_to_yojson (x : cost_amount) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
      ("currency", option_to_yojson currency_code_to_yojson x.currency);
    ]

let purchase_agreement_type_to_yojson (x : purchase_agreement_type) =
  match x with
  | SAVINGS_PLANS -> `String "SAVINGS_PLANS"
  | RESERVED_INSTANCE -> `String "RESERVED_INSTANCE"

let bill_estimate_commitment_summary_to_yojson (x : bill_estimate_commitment_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "purchaseAgreementType",
        option_to_yojson purchase_agreement_type_to_yojson x.purchase_agreement_type );
      ("offeringId", option_to_yojson uuid_to_yojson x.offering_id);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ( "termLength",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term_length );
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ("upfrontPayment", option_to_yojson cost_amount_to_yojson x.upfront_payment);
      ("monthlyPayment", option_to_yojson cost_amount_to_yojson x.monthly_payment);
    ]

let bill_estimate_commitment_summaries_to_yojson tree =
  list_to_yojson bill_estimate_commitment_summary_to_yojson tree

let cost_difference_to_yojson (x : cost_difference) =
  assoc_to_yojson
    [
      ("historicalCost", option_to_yojson cost_amount_to_yojson x.historical_cost);
      ("estimatedCost", option_to_yojson cost_amount_to_yojson x.estimated_cost);
    ]

let service_cost_difference_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson cost_difference_to_yojson
    tree

let bill_estimate_cost_summary_to_yojson (x : bill_estimate_cost_summary) =
  assoc_to_yojson
    [
      ("totalCostDifference", option_to_yojson cost_difference_to_yojson x.total_cost_difference);
      ( "serviceCostDifferences",
        option_to_yojson service_cost_difference_map_to_yojson x.service_cost_differences );
    ]

let bill_estimate_input_commitment_modification_summary_to_yojson
    (x : bill_estimate_input_commitment_modification_summary) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ( "commitmentAction",
        option_to_yojson bill_scenario_commitment_modification_action_to_yojson x.commitment_action
      );
    ]

let bill_estimate_input_commitment_modification_summaries_to_yojson tree =
  list_to_yojson bill_estimate_input_commitment_modification_summary_to_yojson tree

let bill_estimate_input_usage_modification_summary_to_yojson
    (x : bill_estimate_input_usage_modification_summary) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("quantities", option_to_yojson usage_quantities_to_yojson x.quantities);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
    ]

let bill_estimate_input_usage_modification_summaries_to_yojson tree =
  list_to_yojson bill_estimate_input_usage_modification_summary_to_yojson tree

let savings_plan_arns_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let usage_quantity_result_to_yojson (x : usage_quantity_result) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
    ]

let bill_estimate_line_item_summary_to_yojson (x : bill_estimate_line_item_summary) =
  assoc_to_yojson
    [
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("operation", Some (operation_to_yojson x.operation));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "lineItemId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.line_item_id );
      ( "lineItemType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.line_item_type );
      ("payerAccountId", option_to_yojson account_id_to_yojson x.payer_account_id);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ( "estimatedUsageQuantity",
        option_to_yojson usage_quantity_result_to_yojson x.estimated_usage_quantity );
      ("estimatedCost", option_to_yojson cost_amount_to_yojson x.estimated_cost);
      ( "historicalUsageQuantity",
        option_to_yojson usage_quantity_result_to_yojson x.historical_usage_quantity );
      ("historicalCost", option_to_yojson cost_amount_to_yojson x.historical_cost);
      ("savingsPlanArns", option_to_yojson savings_plan_arns_to_yojson x.savings_plan_arns);
    ]

let bill_estimate_line_item_summaries_to_yojson tree =
  list_to_yojson bill_estimate_line_item_summary_to_yojson tree

let bill_estimate_name_to_yojson = string_to_yojson

let bill_estimate_status_to_yojson (x : bill_estimate_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"

let bill_estimate_summary_to_yojson (x : bill_estimate_summary) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
    ]

let bill_estimate_summaries_to_yojson tree = list_to_yojson bill_estimate_summary_to_yojson tree
let bill_scenario_name_to_yojson = string_to_yojson

let bill_scenario_status_to_yojson (x : bill_scenario_status) =
  match x with
  | READY -> `String "READY"
  | LOCKED -> `String "LOCKED"
  | FAILED -> `String "FAILED"
  | STALE -> `String "STALE"

let cost_category_arn_to_yojson = string_to_yojson

let group_sharing_preference_enum_to_yojson (x : group_sharing_preference_enum) =
  match x with
  | OPEN -> `String "OPEN"
  | PRIORITIZED -> `String "PRIORITIZED"
  | RESTRICTED -> `String "RESTRICTED"

let bill_scenario_summary_to_yojson (x : bill_scenario_summary) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
    ]

let bill_scenario_summaries_to_yojson tree = list_to_yojson bill_scenario_summary_to_yojson tree

let create_bill_estimate_response_to_yojson (x : create_bill_estimate_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("costSummary", option_to_yojson bill_estimate_cost_summary_to_yojson x.cost_summary);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "costCategoryGroupSharingPreferenceEffectiveDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.cost_category_group_sharing_preference_effective_date );
    ]

let create_bill_estimate_request_to_yojson (x : create_bill_estimate_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ("name", Some (bill_estimate_name_to_yojson x.name));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_bill_scenario_response_to_yojson (x : create_bill_scenario_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
    ]

let create_bill_scenario_request_to_yojson (x : create_bill_scenario_request) =
  assoc_to_yojson
    [
      ("name", Some (bill_scenario_name_to_yojson x.name));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
    ]

let workload_estimate_status_to_yojson (x : workload_estimate_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | VALID -> `String "VALID"
  | INVALID -> `String "INVALID"
  | ACTION_NEEDED -> `String "ACTION_NEEDED"

let workload_estimate_rate_type_to_yojson (x : workload_estimate_rate_type) =
  match x with
  | BEFORE_DISCOUNTS -> `String "BEFORE_DISCOUNTS"
  | AFTER_DISCOUNTS -> `String "AFTER_DISCOUNTS"
  | AFTER_DISCOUNTS_AND_COMMITMENTS -> `String "AFTER_DISCOUNTS_AND_COMMITMENTS"

let workload_estimate_name_to_yojson = string_to_yojson

let create_workload_estimate_response_to_yojson (x : create_workload_estimate_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let create_workload_estimate_request_to_yojson (x : create_workload_estimate_request) =
  assoc_to_yojson
    [
      ("name", Some (workload_estimate_name_to_yojson x.name));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let delete_bill_estimate_response_to_yojson = unit_to_yojson

let delete_bill_estimate_request_to_yojson (x : delete_bill_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let delete_bill_scenario_response_to_yojson = unit_to_yojson

let delete_bill_scenario_request_to_yojson (x : delete_bill_scenario_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let delete_workload_estimate_response_to_yojson = unit_to_yojson

let delete_workload_estimate_request_to_yojson (x : delete_workload_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let filter_timestamp_to_yojson (x : filter_timestamp) =
  assoc_to_yojson
    [
      ( "afterTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.after_timestamp );
      ( "beforeTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.before_timestamp );
    ]

let get_bill_estimate_response_to_yojson (x : get_bill_estimate_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("costSummary", option_to_yojson bill_estimate_cost_summary_to_yojson x.cost_summary);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "costCategoryGroupSharingPreferenceEffectiveDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.cost_category_group_sharing_preference_effective_date );
    ]

let get_bill_estimate_request_to_yojson (x : get_bill_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let get_bill_scenario_response_to_yojson (x : get_bill_scenario_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
    ]

let get_bill_scenario_request_to_yojson (x : get_bill_scenario_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let get_workload_estimate_response_to_yojson (x : get_workload_estimate_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let get_workload_estimate_request_to_yojson (x : get_workload_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let next_page_token_to_yojson = string_to_yojson

let list_bill_estimate_commitments_response_to_yojson (x : list_bill_estimate_commitments_response)
    =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_estimate_commitment_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_bill_estimate_commitments_request_to_yojson (x : list_bill_estimate_commitments_request) =
  assoc_to_yojson
    [
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_bill_estimate_input_commitment_modifications_response_to_yojson
    (x : list_bill_estimate_input_commitment_modifications_response) =
  assoc_to_yojson
    [
      ( "items",
        option_to_yojson bill_estimate_input_commitment_modification_summaries_to_yojson x.items );
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_bill_estimate_input_commitment_modifications_request_to_yojson
    (x : list_bill_estimate_input_commitment_modifications_request) =
  assoc_to_yojson
    [
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_bill_estimate_input_usage_modifications_response_to_yojson
    (x : list_bill_estimate_input_usage_modifications_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_estimate_input_usage_modification_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let match_option_to_yojson (x : match_option) =
  match x with
  | EQUALS -> `String "EQUALS"
  | STARTS_WITH -> `String "STARTS_WITH"
  | CONTAINS -> `String "CONTAINS"

let list_usage_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_usage_filter_name_to_yojson (x : list_usage_filter_name) =
  match x with
  | USAGE_ACCOUNT_ID -> `String "USAGE_ACCOUNT_ID"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | OPERATION -> `String "OPERATION"
  | LOCATION -> `String "LOCATION"
  | USAGE_GROUP -> `String "USAGE_GROUP"
  | HISTORICAL_USAGE_ACCOUNT_ID -> `String "HISTORICAL_USAGE_ACCOUNT_ID"
  | HISTORICAL_SERVICE_CODE -> `String "HISTORICAL_SERVICE_CODE"
  | HISTORICAL_USAGE_TYPE -> `String "HISTORICAL_USAGE_TYPE"
  | HISTORICAL_OPERATION -> `String "HISTORICAL_OPERATION"
  | HISTORICAL_LOCATION -> `String "HISTORICAL_LOCATION"

let list_usage_filter_to_yojson (x : list_usage_filter) =
  assoc_to_yojson
    [
      ("name", Some (list_usage_filter_name_to_yojson x.name));
      ("values", Some (list_usage_filter_values_to_yojson x.values));
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
    ]

let list_usage_filters_to_yojson tree = list_to_yojson list_usage_filter_to_yojson tree

let list_bill_estimate_input_usage_modifications_request_to_yojson
    (x : list_bill_estimate_input_usage_modifications_request) =
  assoc_to_yojson
    [
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
      ("filters", option_to_yojson list_usage_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_bill_estimate_line_items_response_to_yojson (x : list_bill_estimate_line_items_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_estimate_line_item_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_bill_estimate_line_items_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_bill_estimate_line_items_filter_name_to_yojson
    (x : list_bill_estimate_line_items_filter_name) =
  match x with
  | USAGE_ACCOUNT_ID -> `String "USAGE_ACCOUNT_ID"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | OPERATION -> `String "OPERATION"
  | LOCATION -> `String "LOCATION"
  | LINE_ITEM_TYPE -> `String "LINE_ITEM_TYPE"

let list_bill_estimate_line_items_filter_to_yojson (x : list_bill_estimate_line_items_filter) =
  assoc_to_yojson
    [
      ("name", Some (list_bill_estimate_line_items_filter_name_to_yojson x.name));
      ("values", Some (list_bill_estimate_line_items_filter_values_to_yojson x.values));
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
    ]

let list_bill_estimate_line_items_filters_to_yojson tree =
  list_to_yojson list_bill_estimate_line_items_filter_to_yojson tree

let list_bill_estimate_line_items_request_to_yojson (x : list_bill_estimate_line_items_request) =
  assoc_to_yojson
    [
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
      ("filters", option_to_yojson list_bill_estimate_line_items_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_bill_estimates_response_to_yojson (x : list_bill_estimates_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_estimate_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_bill_estimates_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_bill_estimates_filter_name_to_yojson (x : list_bill_estimates_filter_name) =
  match x with STATUS -> `String "STATUS" | NAME -> `String "NAME"

let list_bill_estimates_filter_to_yojson (x : list_bill_estimates_filter) =
  assoc_to_yojson
    [
      ("name", Some (list_bill_estimates_filter_name_to_yojson x.name));
      ("values", Some (list_bill_estimates_filter_values_to_yojson x.values));
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
    ]

let list_bill_estimates_filters_to_yojson tree =
  list_to_yojson list_bill_estimates_filter_to_yojson tree

let list_bill_estimates_request_to_yojson (x : list_bill_estimates_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson list_bill_estimates_filters_to_yojson x.filters);
      ("createdAtFilter", option_to_yojson filter_timestamp_to_yojson x.created_at_filter);
      ("expiresAtFilter", option_to_yojson filter_timestamp_to_yojson x.expires_at_filter);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_bill_scenario_commitment_modifications_response_to_yojson
    (x : list_bill_scenario_commitment_modifications_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_scenario_commitment_modification_items_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_bill_scenario_commitment_modifications_request_to_yojson
    (x : list_bill_scenario_commitment_modifications_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_bill_scenario_usage_modifications_response_to_yojson
    (x : list_bill_scenario_usage_modifications_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_scenario_usage_modification_items_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_bill_scenario_usage_modifications_request_to_yojson
    (x : list_bill_scenario_usage_modifications_request) =
  assoc_to_yojson
    [
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
      ("filters", option_to_yojson list_usage_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_bill_scenarios_response_to_yojson (x : list_bill_scenarios_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson bill_scenario_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_bill_scenarios_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_bill_scenarios_filter_name_to_yojson (x : list_bill_scenarios_filter_name) =
  match x with
  | STATUS -> `String "STATUS"
  | NAME -> `String "NAME"
  | GROUP_SHARING_PREFERENCE -> `String "GROUP_SHARING_PREFERENCE"
  | COST_CATEGORY_ARN -> `String "COST_CATEGORY_ARN"

let list_bill_scenarios_filter_to_yojson (x : list_bill_scenarios_filter) =
  assoc_to_yojson
    [
      ("name", Some (list_bill_scenarios_filter_name_to_yojson x.name));
      ("values", Some (list_bill_scenarios_filter_values_to_yojson x.values));
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
    ]

let list_bill_scenarios_filters_to_yojson tree =
  list_to_yojson list_bill_scenarios_filter_to_yojson tree

let list_bill_scenarios_request_to_yojson (x : list_bill_scenarios_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson list_bill_scenarios_filters_to_yojson x.filters);
      ("createdAtFilter", option_to_yojson filter_timestamp_to_yojson x.created_at_filter);
      ("expiresAtFilter", option_to_yojson filter_timestamp_to_yojson x.expires_at_filter);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_workload_estimate_usage_response_to_yojson (x : list_workload_estimate_usage_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson workload_estimate_usage_items_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let workload_estimate_usage_max_results_to_yojson = int_to_yojson

let list_workload_estimate_usage_request_to_yojson (x : list_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
      ("filters", option_to_yojson list_usage_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson workload_estimate_usage_max_results_to_yojson x.max_results);
    ]

let workload_estimate_summary_to_yojson (x : workload_estimate_summary) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let workload_estimate_summaries_to_yojson tree =
  list_to_yojson workload_estimate_summary_to_yojson tree

let list_workload_estimates_response_to_yojson (x : list_workload_estimates_response) =
  assoc_to_yojson
    [
      ("items", option_to_yojson workload_estimate_summaries_to_yojson x.items);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_workload_estimates_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_workload_estimates_filter_name_to_yojson (x : list_workload_estimates_filter_name) =
  match x with STATUS -> `String "STATUS" | NAME -> `String "NAME"

let list_workload_estimates_filter_to_yojson (x : list_workload_estimates_filter) =
  assoc_to_yojson
    [
      ("name", Some (list_workload_estimates_filter_name_to_yojson x.name));
      ("values", Some (list_workload_estimates_filter_values_to_yojson x.values));
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
    ]

let list_workload_estimates_filters_to_yojson tree =
  list_to_yojson list_workload_estimates_filter_to_yojson tree

let list_workload_estimates_request_to_yojson (x : list_workload_estimates_request) =
  assoc_to_yojson
    [
      ("createdAtFilter", option_to_yojson filter_timestamp_to_yojson x.created_at_filter);
      ("expiresAtFilter", option_to_yojson filter_timestamp_to_yojson x.expires_at_filter);
      ("filters", option_to_yojson list_workload_estimates_filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let update_bill_estimate_response_to_yojson (x : update_bill_estimate_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("costSummary", option_to_yojson bill_estimate_cost_summary_to_yojson x.cost_summary);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "costCategoryGroupSharingPreferenceEffectiveDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.cost_category_group_sharing_preference_effective_date );
    ]

let update_bill_estimate_request_to_yojson (x : update_bill_estimate_request) =
  assoc_to_yojson
    [
      ("identifier", Some (resource_id_to_yojson x.identifier));
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
    ]

let update_bill_scenario_response_to_yojson (x : update_bill_scenario_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
    ]

let update_bill_scenario_request_to_yojson (x : update_bill_scenario_request) =
  assoc_to_yojson
    [
      ("identifier", Some (resource_id_to_yojson x.identifier));
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
    ]

let update_workload_estimate_response_to_yojson (x : update_workload_estimate_response) =
  assoc_to_yojson
    [
      ("id", Some (resource_id_to_yojson x.id));
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
    ]

let update_workload_estimate_request_to_yojson (x : update_workload_estimate_request) =
  assoc_to_yojson
    [
      ("identifier", Some (resource_id_to_yojson x.identifier));
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
    ]

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | INVALID_REQUEST_FROM_MEMBER -> `String "invalidRequestFromMember"
  | DISALLOWED_RATE -> `String "disallowedRate"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]
