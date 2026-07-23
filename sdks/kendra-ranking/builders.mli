open Types

val make_capacity_units_configuration :
  rescore_capacity_units:rescore_capacity_unit -> unit -> capacity_units_configuration

val make_update_rescore_execution_plan_request :
  ?name:rescore_execution_plan_name ->
  ?description:description ->
  ?capacity_units:capacity_units_configuration ->
  id:rescore_execution_plan_id ->
  unit ->
  update_rescore_execution_plan_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_rescore_result_item :
  ?document_id:document_id -> ?score:float_ -> unit -> rescore_result_item

val make_document :
  ?group_id:group_id ->
  ?title:document_title ->
  ?body:document_body ->
  ?tokenized_title:title_tokens_list ->
  ?tokenized_body:body_tokens_list ->
  id:document_id ->
  original_score:float_ ->
  unit ->
  document

val make_rescore_request :
  rescore_execution_plan_id:rescore_execution_plan_id ->
  search_query:search_query ->
  documents:document_list ->
  unit ->
  rescore_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_rescore_execution_plan_summary :
  ?name:rescore_execution_plan_name ->
  ?id:rescore_execution_plan_id ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?status:rescore_execution_plan_status ->
  unit ->
  rescore_execution_plan_summary

val make_list_rescore_execution_plans_response :
  ?summary_items:rescore_execution_plan_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_rescore_execution_plans_response

val make_list_rescore_execution_plans_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_rescore_execution_plans_request ->
  unit ->
  list_rescore_execution_plans_request

val make_describe_rescore_execution_plan_response :
  ?id:rescore_execution_plan_id ->
  ?arn:rescore_execution_plan_arn ->
  ?name:rescore_execution_plan_name ->
  ?description:description ->
  ?capacity_units:capacity_units_configuration ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?status:rescore_execution_plan_status ->
  ?error_message:error_message ->
  unit ->
  describe_rescore_execution_plan_response

val make_describe_rescore_execution_plan_request :
  id:rescore_execution_plan_id -> unit -> describe_rescore_execution_plan_request

val make_delete_rescore_execution_plan_request :
  id:rescore_execution_plan_id -> unit -> delete_rescore_execution_plan_request

val make_create_rescore_execution_plan_response :
  id:rescore_execution_plan_id ->
  arn:rescore_execution_plan_arn ->
  unit ->
  create_rescore_execution_plan_response

val make_create_rescore_execution_plan_request :
  ?description:description ->
  ?capacity_units:capacity_units_configuration ->
  ?tags:tag_list ->
  ?client_token:client_token_name ->
  name:rescore_execution_plan_name ->
  unit ->
  create_rescore_execution_plan_request
