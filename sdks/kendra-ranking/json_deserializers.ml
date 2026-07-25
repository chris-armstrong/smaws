open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : access_denied_exception)

let rescore_capacity_unit_of_yojson = int_of_yojson

let capacity_units_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rescore_capacity_units =
       value_for_key rescore_capacity_unit_of_yojson "RescoreCapacityUnits" _list path;
   }
    : capacity_units_configuration)

let description_of_yojson = string_of_yojson
let rescore_execution_plan_name_of_yojson = string_of_yojson
let rescore_execution_plan_id_of_yojson = string_of_yojson

let update_rescore_execution_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key rescore_execution_plan_id_of_yojson "Id" _list path;
     name = option_of_yojson (value_for_key rescore_execution_plan_name_of_yojson "Name") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     capacity_units =
       option_of_yojson
         (value_for_key capacity_units_configuration_of_yojson "CapacityUnits")
         _list path;
   }
    : update_rescore_execution_plan_request)

let resource_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_unavailable_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let amazon_resource_name_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let float__of_yojson = float_of_yojson
let document_id_of_yojson = string_of_yojson

let rescore_result_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_id = option_of_yojson (value_for_key document_id_of_yojson "DocumentId") _list path;
     score = option_of_yojson (value_for_key float__of_yojson "Score") _list path;
   }
    : rescore_result_item)

let rescore_result_item_list_of_yojson tree path =
  list_of_yojson rescore_result_item_of_yojson tree path

let rescore_id_of_yojson = string_of_yojson

let rescore_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rescore_id = option_of_yojson (value_for_key rescore_id_of_yojson "RescoreId") _list path;
     result_items =
       option_of_yojson (value_for_key rescore_result_item_list_of_yojson "ResultItems") _list path;
   }
    : rescore_result)

let tokens_of_yojson = string_of_yojson
let body_tokens_list_of_yojson tree path = list_of_yojson tokens_of_yojson tree path
let title_tokens_list_of_yojson tree path = list_of_yojson tokens_of_yojson tree path
let document_body_of_yojson = string_of_yojson
let document_title_of_yojson = string_of_yojson
let group_id_of_yojson = string_of_yojson

let document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key document_id_of_yojson "Id" _list path;
     group_id = option_of_yojson (value_for_key group_id_of_yojson "GroupId") _list path;
     title = option_of_yojson (value_for_key document_title_of_yojson "Title") _list path;
     body = option_of_yojson (value_for_key document_body_of_yojson "Body") _list path;
     tokenized_title =
       option_of_yojson (value_for_key title_tokens_list_of_yojson "TokenizedTitle") _list path;
     tokenized_body =
       option_of_yojson (value_for_key body_tokens_list_of_yojson "TokenizedBody") _list path;
     original_score = value_for_key float__of_yojson "OriginalScore" _list path;
   }
    : document)

let document_list_of_yojson tree path = list_of_yojson document_of_yojson tree path
let search_query_of_yojson = string_of_yojson

let rescore_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rescore_execution_plan_id =
       value_for_key rescore_execution_plan_id_of_yojson "RescoreExecutionPlanId" _list path;
     search_query = value_for_key search_query_of_yojson "SearchQuery" _list path;
     documents = value_for_key document_list_of_yojson "Documents" _list path;
   }
    : rescore_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let next_token_of_yojson = string_of_yojson

let rescore_execution_plan_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "UPDATING" -> UPDATING
    | `String "ACTIVE" -> ACTIVE
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RescoreExecutionPlanStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RescoreExecutionPlanStatus")
     : rescore_execution_plan_status)
    : rescore_execution_plan_status)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let rescore_execution_plan_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key rescore_execution_plan_name_of_yojson "Name") _list path;
     id = option_of_yojson (value_for_key rescore_execution_plan_id_of_yojson "Id") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     status =
       option_of_yojson (value_for_key rescore_execution_plan_status_of_yojson "Status") _list path;
   }
    : rescore_execution_plan_summary)

let rescore_execution_plan_summary_list_of_yojson tree path =
  list_of_yojson rescore_execution_plan_summary_of_yojson tree path

let list_rescore_execution_plans_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     summary_items =
       option_of_yojson
         (value_for_key rescore_execution_plan_summary_list_of_yojson "SummaryItems")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_rescore_execution_plans_response)

let max_results_integer_for_list_rescore_execution_plans_request_of_yojson = int_of_yojson

let list_rescore_execution_plans_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key max_results_integer_for_list_rescore_execution_plans_request_of_yojson
            "MaxResults")
         _list path;
   }
    : list_rescore_execution_plans_request)

let rescore_execution_plan_arn_of_yojson = string_of_yojson

let describe_rescore_execution_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key rescore_execution_plan_id_of_yojson "Id") _list path;
     arn = option_of_yojson (value_for_key rescore_execution_plan_arn_of_yojson "Arn") _list path;
     name = option_of_yojson (value_for_key rescore_execution_plan_name_of_yojson "Name") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     capacity_units =
       option_of_yojson
         (value_for_key capacity_units_configuration_of_yojson "CapacityUnits")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     status =
       option_of_yojson (value_for_key rescore_execution_plan_status_of_yojson "Status") _list path;
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
   }
    : describe_rescore_execution_plan_response)

let describe_rescore_execution_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key rescore_execution_plan_id_of_yojson "Id" _list path }
    : describe_rescore_execution_plan_request)

let delete_rescore_execution_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key rescore_execution_plan_id_of_yojson "Id" _list path }
    : delete_rescore_execution_plan_request)

let create_rescore_execution_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key rescore_execution_plan_id_of_yojson "Id" _list path;
     arn = value_for_key rescore_execution_plan_arn_of_yojson "Arn" _list path;
   }
    : create_rescore_execution_plan_response)

let client_token_name_of_yojson = string_of_yojson

let create_rescore_execution_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key rescore_execution_plan_name_of_yojson "Name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     capacity_units =
       option_of_yojson
         (value_for_key capacity_units_configuration_of_yojson "CapacityUnits")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token =
       option_of_yojson (value_for_key client_token_name_of_yojson "ClientToken") _list path;
   }
    : create_rescore_execution_plan_request)
