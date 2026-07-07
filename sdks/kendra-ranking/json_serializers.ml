open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let rescore_execution_plan_id_to_yojson = string_to_yojson
let rescore_execution_plan_name_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson
let rescore_capacity_unit_to_yojson = int_to_yojson

let capacity_units_configuration_to_yojson (x : capacity_units_configuration) =
  assoc_to_yojson
    [ ("RescoreCapacityUnits", Some (rescore_capacity_unit_to_yojson x.rescore_capacity_units)) ]

let update_rescore_execution_plan_request_to_yojson (x : update_rescore_execution_plan_request) =
  assoc_to_yojson
    [
      ("CapacityUnits", option_to_yojson capacity_units_configuration_to_yojson x.capacity_units);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", option_to_yojson rescore_execution_plan_name_to_yojson x.name);
      ("Id", Some (rescore_execution_plan_id_to_yojson x.id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let tokens_to_yojson = string_to_yojson
let title_tokens_list_to_yojson tree = list_to_yojson tokens_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let search_query_to_yojson = string_to_yojson
let document_id_to_yojson = string_to_yojson
let float__to_yojson = float_to_yojson

let rescore_result_item_to_yojson (x : rescore_result_item) =
  assoc_to_yojson
    [
      ("Score", option_to_yojson float__to_yojson x.score);
      ("DocumentId", option_to_yojson document_id_to_yojson x.document_id);
    ]

let rescore_result_item_list_to_yojson tree = list_to_yojson rescore_result_item_to_yojson tree
let rescore_id_to_yojson = string_to_yojson

let rescore_result_to_yojson (x : rescore_result) =
  assoc_to_yojson
    [
      ("ResultItems", option_to_yojson rescore_result_item_list_to_yojson x.result_items);
      ("RescoreId", option_to_yojson rescore_id_to_yojson x.rescore_id);
    ]

let group_id_to_yojson = string_to_yojson
let document_title_to_yojson = string_to_yojson
let document_body_to_yojson = string_to_yojson
let body_tokens_list_to_yojson tree = list_to_yojson tokens_to_yojson tree

let document_to_yojson (x : document) =
  assoc_to_yojson
    [
      ("OriginalScore", Some (float__to_yojson x.original_score));
      ("TokenizedBody", option_to_yojson body_tokens_list_to_yojson x.tokenized_body);
      ("TokenizedTitle", option_to_yojson title_tokens_list_to_yojson x.tokenized_title);
      ("Body", option_to_yojson document_body_to_yojson x.body);
      ("Title", option_to_yojson document_title_to_yojson x.title);
      ("GroupId", option_to_yojson group_id_to_yojson x.group_id);
      ("Id", Some (document_id_to_yojson x.id));
    ]

let document_list_to_yojson tree = list_to_yojson document_to_yojson tree

let rescore_request_to_yojson (x : rescore_request) =
  assoc_to_yojson
    [
      ("Documents", Some (document_list_to_yojson x.documents));
      ("SearchQuery", Some (search_query_to_yojson x.search_query));
      ( "RescoreExecutionPlanId",
        Some (rescore_execution_plan_id_to_yojson x.rescore_execution_plan_id) );
    ]

let rescore_execution_plan_status_to_yojson (x : rescore_execution_plan_status) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"

let rescore_execution_plan_summary_to_yojson (x : rescore_execution_plan_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson rescore_execution_plan_status_to_yojson x.status);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Id", option_to_yojson rescore_execution_plan_id_to_yojson x.id);
      ("Name", option_to_yojson rescore_execution_plan_name_to_yojson x.name);
    ]

let rescore_execution_plan_summary_list_to_yojson tree =
  list_to_yojson rescore_execution_plan_summary_to_yojson tree

let rescore_execution_plan_arn_to_yojson = string_to_yojson
let next_token_to_yojson = string_to_yojson
let max_results_integer_for_list_rescore_execution_plans_request_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let list_rescore_execution_plans_response_to_yojson (x : list_rescore_execution_plans_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "SummaryItems",
        option_to_yojson rescore_execution_plan_summary_list_to_yojson x.summary_items );
    ]

let list_rescore_execution_plans_request_to_yojson (x : list_rescore_execution_plans_request) =
  assoc_to_yojson
    [
      ( "MaxResults",
        option_to_yojson max_results_integer_for_list_rescore_execution_plans_request_to_yojson
          x.max_results );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_rescore_execution_plan_response_to_yojson
    (x : describe_rescore_execution_plan_response) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("Status", option_to_yojson rescore_execution_plan_status_to_yojson x.status);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("CapacityUnits", option_to_yojson capacity_units_configuration_to_yojson x.capacity_units);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", option_to_yojson rescore_execution_plan_name_to_yojson x.name);
      ("Arn", option_to_yojson rescore_execution_plan_arn_to_yojson x.arn);
      ("Id", option_to_yojson rescore_execution_plan_id_to_yojson x.id);
    ]

let describe_rescore_execution_plan_request_to_yojson (x : describe_rescore_execution_plan_request)
    =
  assoc_to_yojson [ ("Id", Some (rescore_execution_plan_id_to_yojson x.id)) ]

let delete_rescore_execution_plan_request_to_yojson (x : delete_rescore_execution_plan_request) =
  assoc_to_yojson [ ("Id", Some (rescore_execution_plan_id_to_yojson x.id)) ]

let create_rescore_execution_plan_response_to_yojson (x : create_rescore_execution_plan_response) =
  assoc_to_yojson
    [
      ("Arn", Some (rescore_execution_plan_arn_to_yojson x.arn));
      ("Id", Some (rescore_execution_plan_id_to_yojson x.id));
    ]

let client_token_name_to_yojson = string_to_yojson

let create_rescore_execution_plan_request_to_yojson (x : create_rescore_execution_plan_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_name_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("CapacityUnits", option_to_yojson capacity_units_configuration_to_yojson x.capacity_units);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (rescore_execution_plan_name_to_yojson x.name));
    ]
