open Types

let make_capacity_units_configuration
    ~rescore_capacity_units:(rescore_capacity_units_ : rescore_capacity_unit) () =
  ({ rescore_capacity_units = rescore_capacity_units_ } : capacity_units_configuration)

let make_update_rescore_execution_plan_request ?name:(name_ : rescore_execution_plan_name option)
    ?description:(description_ : description option)
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ~id:(id_ : rescore_execution_plan_id) () =
  ({ id = id_; name = name_; description = description_; capacity_units = capacity_units_ }
    : update_rescore_execution_plan_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_rescore_result_item ?document_id:(document_id_ : document_id option)
    ?score:(score_ : float_ option) () =
  ({ document_id = document_id_; score = score_ } : rescore_result_item)

let make_document ?group_id:(group_id_ : group_id option) ?title:(title_ : document_title option)
    ?body:(body_ : document_body option)
    ?tokenized_title:(tokenized_title_ : title_tokens_list option)
    ?tokenized_body:(tokenized_body_ : body_tokens_list option) ~id:(id_ : document_id)
    ~original_score:(original_score_ : float_) () =
  ({
     id = id_;
     group_id = group_id_;
     title = title_;
     body = body_;
     tokenized_title = tokenized_title_;
     tokenized_body = tokenized_body_;
     original_score = original_score_;
   }
    : document)

let make_rescore_request
    ~rescore_execution_plan_id:(rescore_execution_plan_id_ : rescore_execution_plan_id)
    ~search_query:(search_query_ : search_query) ~documents:(documents_ : document_list) () =
  ({
     rescore_execution_plan_id = rescore_execution_plan_id_;
     search_query = search_query_;
     documents = documents_;
   }
    : rescore_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_rescore_execution_plan_summary ?name:(name_ : rescore_execution_plan_name option)
    ?id:(id_ : rescore_execution_plan_id option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option)
    ?status:(status_ : rescore_execution_plan_status option) () =
  ({ name = name_; id = id_; created_at = created_at_; updated_at = updated_at_; status = status_ }
    : rescore_execution_plan_summary)

let make_list_rescore_execution_plans_response
    ?summary_items:(summary_items_ : rescore_execution_plan_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ summary_items = summary_items_; next_token = next_token_ }
    : list_rescore_execution_plans_response)

let make_list_rescore_execution_plans_request ?next_token:(next_token_ : next_token option)
    ?max_results:
      (max_results_ : max_results_integer_for_list_rescore_execution_plans_request option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_rescore_execution_plans_request)

let make_describe_rescore_execution_plan_response ?id:(id_ : rescore_execution_plan_id option)
    ?arn:(arn_ : rescore_execution_plan_arn option)
    ?name:(name_ : rescore_execution_plan_name option)
    ?description:(description_ : description option)
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?status:(status_ : rescore_execution_plan_status option)
    ?error_message:(error_message_ : error_message option) () =
  ({
     id = id_;
     arn = arn_;
     name = name_;
     description = description_;
     capacity_units = capacity_units_;
     created_at = created_at_;
     updated_at = updated_at_;
     status = status_;
     error_message = error_message_;
   }
    : describe_rescore_execution_plan_response)

let make_describe_rescore_execution_plan_request ~id:(id_ : rescore_execution_plan_id) () =
  ({ id = id_ } : describe_rescore_execution_plan_request)

let make_delete_rescore_execution_plan_request ~id:(id_ : rescore_execution_plan_id) () =
  ({ id = id_ } : delete_rescore_execution_plan_request)

let make_create_rescore_execution_plan_response ~id:(id_ : rescore_execution_plan_id)
    ~arn:(arn_ : rescore_execution_plan_arn) () =
  ({ id = id_; arn = arn_ } : create_rescore_execution_plan_response)

let make_create_rescore_execution_plan_request ?description:(description_ : description option)
    ?capacity_units:(capacity_units_ : capacity_units_configuration option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token_name option)
    ~name:(name_ : rescore_execution_plan_name) () =
  ({
     name = name_;
     description = description_;
     capacity_units = capacity_units_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_rescore_execution_plan_request)
