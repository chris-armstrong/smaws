open Types

let make_capacity_units_configuration
    ~rescore_capacity_units:(rescore_capacity_units_ : rescore_capacity_unit) () =
  ({ rescore_capacity_units = rescore_capacity_units_ } : capacity_units_configuration)

let make_update_rescore_execution_plan_request
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ?description:(description_ : description option)
    ?name:(name_ : rescore_execution_plan_name option) ~id:(id_ : rescore_execution_plan_id) () =
  ({ capacity_units = capacity_units_; description = description_; name = name_; id = id_ }
    : update_rescore_execution_plan_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_rescore_result_item ?score:(score_ : float_ option)
    ?document_id:(document_id_ : document_id option) () =
  ({ score = score_; document_id = document_id_ } : rescore_result_item)

let make_document ?tokenized_body:(tokenized_body_ : body_tokens_list option)
    ?tokenized_title:(tokenized_title_ : title_tokens_list option)
    ?body:(body_ : document_body option) ?title:(title_ : document_title option)
    ?group_id:(group_id_ : group_id option) ~original_score:(original_score_ : float_)
    ~id:(id_ : document_id) () =
  ({
     original_score = original_score_;
     tokenized_body = tokenized_body_;
     tokenized_title = tokenized_title_;
     body = body_;
     title = title_;
     group_id = group_id_;
     id = id_;
   }
    : document)

let make_rescore_request ~documents:(documents_ : document_list)
    ~search_query:(search_query_ : search_query)
    ~rescore_execution_plan_id:(rescore_execution_plan_id_ : rescore_execution_plan_id) () =
  ({
     documents = documents_;
     search_query = search_query_;
     rescore_execution_plan_id = rescore_execution_plan_id_;
   }
    : rescore_request)

let make_rescore_execution_plan_summary ?status:(status_ : rescore_execution_plan_status option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?id:(id_ : rescore_execution_plan_id option) ?name:(name_ : rescore_execution_plan_name option)
    () =
  ({ status = status_; updated_at = updated_at_; created_at = created_at_; id = id_; name = name_ }
    : rescore_execution_plan_summary)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_rescore_execution_plans_response ?next_token:(next_token_ : next_token option)
    ?summary_items:(summary_items_ : rescore_execution_plan_summary_list option) () =
  ({ next_token = next_token_; summary_items = summary_items_ }
    : list_rescore_execution_plans_response)

let make_list_rescore_execution_plans_request
    ?max_results:
      (max_results_ : max_results_integer_for_list_rescore_execution_plans_request option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_rescore_execution_plans_request)

let make_describe_rescore_execution_plan_response
    ?error_message:(error_message_ : error_message option)
    ?status:(status_ : rescore_execution_plan_status option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ?description:(description_ : description option)
    ?name:(name_ : rescore_execution_plan_name option)
    ?arn:(arn_ : rescore_execution_plan_arn option) ?id:(id_ : rescore_execution_plan_id option) ()
    =
  ({
     error_message = error_message_;
     status = status_;
     updated_at = updated_at_;
     created_at = created_at_;
     capacity_units = capacity_units_;
     description = description_;
     name = name_;
     arn = arn_;
     id = id_;
   }
    : describe_rescore_execution_plan_response)

let make_describe_rescore_execution_plan_request ~id:(id_ : rescore_execution_plan_id) () =
  ({ id = id_ } : describe_rescore_execution_plan_request)

let make_delete_rescore_execution_plan_request ~id:(id_ : rescore_execution_plan_id) () =
  ({ id = id_ } : delete_rescore_execution_plan_request)

let make_create_rescore_execution_plan_response ~arn:(arn_ : rescore_execution_plan_arn)
    ~id:(id_ : rescore_execution_plan_id) () =
  ({ arn = arn_; id = id_ } : create_rescore_execution_plan_response)

let make_create_rescore_execution_plan_request
    ?client_token:(client_token_ : client_token_name option) ?tags:(tags_ : tag_list option)
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ?description:(description_ : description option) ~name:(name_ : rescore_execution_plan_name) ()
    =
  ({
     client_token = client_token_;
     tags = tags_;
     capacity_units = capacity_units_;
     description = description_;
     name = name_;
   }
    : create_rescore_execution_plan_request)
