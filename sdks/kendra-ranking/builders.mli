open Types

val make_capacity_units_configuration :
  rescore_capacity_units:rescore_capacity_unit -> unit -> capacity_units_configuration

val make_update_rescore_execution_plan_request :
  ?capacity_units:capacity_units_configuration ->
  ?description:description ->
  ?name:rescore_execution_plan_name ->
  id:rescore_execution_plan_id ->
  unit ->
  update_rescore_execution_plan_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_rescore_result_item :
  ?score:float_ -> ?document_id:document_id -> unit -> rescore_result_item

val make_document :
  ?tokenized_body:body_tokens_list ->
  ?tokenized_title:title_tokens_list ->
  ?body:document_body ->
  ?title:document_title ->
  ?group_id:group_id ->
  original_score:float_ ->
  id:document_id ->
  unit ->
  document

val make_rescore_request :
  documents:document_list ->
  search_query:search_query ->
  rescore_execution_plan_id:rescore_execution_plan_id ->
  unit ->
  rescore_request

val make_rescore_execution_plan_summary :
  ?status:rescore_execution_plan_status ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?id:rescore_execution_plan_id ->
  ?name:rescore_execution_plan_name ->
  unit ->
  rescore_execution_plan_summary

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_rescore_execution_plans_response :
  ?next_token:next_token ->
  ?summary_items:rescore_execution_plan_summary_list ->
  unit ->
  list_rescore_execution_plans_response

val make_list_rescore_execution_plans_request :
  ?max_results:max_results_integer_for_list_rescore_execution_plans_request ->
  ?next_token:next_token ->
  unit ->
  list_rescore_execution_plans_request

val make_describe_rescore_execution_plan_response :
  ?error_message:error_message ->
  ?status:rescore_execution_plan_status ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?capacity_units:capacity_units_configuration ->
  ?description:description ->
  ?name:rescore_execution_plan_name ->
  ?arn:rescore_execution_plan_arn ->
  ?id:rescore_execution_plan_id ->
  unit ->
  describe_rescore_execution_plan_response

val make_describe_rescore_execution_plan_request :
  id:rescore_execution_plan_id -> unit -> describe_rescore_execution_plan_request

val make_delete_rescore_execution_plan_request :
  id:rescore_execution_plan_id -> unit -> delete_rescore_execution_plan_request

val make_create_rescore_execution_plan_response :
  arn:rescore_execution_plan_arn ->
  id:rescore_execution_plan_id ->
  unit ->
  create_rescore_execution_plan_response

val make_create_rescore_execution_plan_request :
  ?client_token:client_token_name ->
  ?tags:tag_list ->
  ?capacity_units:capacity_units_configuration ->
  ?description:description ->
  name:rescore_execution_plan_name ->
  unit ->
  create_rescore_execution_plan_request
