open Types

val make_validation_exception_field :
  name:field_name -> message:error_message -> unit -> validation_exception_field

val make_update_billing_view_response :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:billing_view_arn ->
  unit ->
  update_billing_view_response

val make_time_range :
  ?begin_date_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_date_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  time_range

val make_cost_category_values :
  key:cost_category_name -> values:values -> unit -> cost_category_values

val make_tag_values : key:tag_key -> values:values -> unit -> tag_values
val make_dimension_values : key:dimension -> values:values -> unit -> dimension_values

val make_expression :
  ?dimensions:dimension_values ->
  ?tags:tag_values ->
  ?cost_categories:cost_category_values ->
  ?time_range:time_range ->
  unit ->
  expression

val make_update_billing_view_request :
  ?name:billing_view_name ->
  ?description:billing_view_description ->
  ?data_filter_expression:expression ->
  arn:billing_view_arn ->
  unit ->
  update_billing_view_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:resource_arn ->
  resource_tag_keys:resource_tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : ?value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_arn:resource_arn -> resource_tags:resource_tag_list -> unit -> tag_resource_request

val make_list_tags_for_resource_response :
  ?resource_tags:resource_tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_request

val make_list_source_views_for_billing_view_response :
  ?next_token:page_token ->
  source_views:billing_view_source_views_list ->
  unit ->
  list_source_views_for_billing_view_response

val make_list_source_views_for_billing_view_request :
  ?max_results:billing_views_max_results ->
  ?next_token:page_token ->
  arn:billing_view_arn ->
  unit ->
  list_source_views_for_billing_view_request

val make_billing_view_health_status :
  ?status_code:billing_view_status ->
  ?status_reasons:billing_view_status_reasons ->
  unit ->
  billing_view_health_status

val make_billing_view_list_element :
  ?arn:billing_view_arn ->
  ?name:billing_view_name ->
  ?description:billing_view_description ->
  ?owner_account_id:account_id ->
  ?source_account_id:account_id ->
  ?billing_view_type:billing_view_type ->
  ?health_status:billing_view_health_status ->
  unit ->
  billing_view_list_element

val make_list_billing_views_response :
  ?next_token:page_token -> billing_views:billing_view_list -> unit -> list_billing_views_response

val make_string_search :
  search_option:search_option -> search_value:search_value -> unit -> string_search

val make_active_time_range :
  active_after_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  active_before_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  active_time_range

val make_list_billing_views_request :
  ?active_time_range:active_time_range ->
  ?arns:billing_view_arn_list ->
  ?billing_view_types:billing_view_type_list ->
  ?names:string_searches ->
  ?owner_account_id:account_id ->
  ?source_account_id:account_id ->
  ?max_results:billing_views_max_results ->
  ?next_token:page_token ->
  unit ->
  list_billing_views_request

val make_get_resource_policy_response :
  ?policy:policy_document -> resource_arn:resource_arn -> unit -> get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:resource_arn -> unit -> get_resource_policy_request

val make_billing_view_element :
  ?arn:billing_view_arn ->
  ?name:billing_view_name ->
  ?description:billing_view_description ->
  ?billing_view_type:billing_view_type ->
  ?owner_account_id:account_id ->
  ?source_account_id:account_id ->
  ?data_filter_expression:expression ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?derived_view_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?source_view_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?view_definition_last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?health_status:billing_view_health_status ->
  unit ->
  billing_view_element

val make_get_billing_view_response :
  billing_view:billing_view_element -> unit -> get_billing_view_response

val make_get_billing_view_request : arn:billing_view_arn -> unit -> get_billing_view_request

val make_disassociate_source_views_response :
  arn:billing_view_arn -> unit -> disassociate_source_views_response

val make_disassociate_source_views_request :
  arn:billing_view_arn ->
  source_views:billing_view_source_views_list ->
  unit ->
  disassociate_source_views_request

val make_delete_billing_view_response : arn:billing_view_arn -> unit -> delete_billing_view_response

val make_delete_billing_view_request :
  ?force:Smaws_Lib.Smithy_api.Types.boolean_ ->
  arn:billing_view_arn ->
  unit ->
  delete_billing_view_request

val make_create_billing_view_response :
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:billing_view_arn ->
  unit ->
  create_billing_view_response

val make_create_billing_view_request :
  ?description:billing_view_description ->
  ?data_filter_expression:expression ->
  ?client_token:client_token ->
  ?resource_tags:resource_tag_list ->
  name:billing_view_name ->
  source_views:billing_view_source_views_list ->
  unit ->
  create_billing_view_request

val make_associate_source_views_response :
  arn:billing_view_arn -> unit -> associate_source_views_response

val make_associate_source_views_request :
  arn:billing_view_arn ->
  source_views:billing_view_source_views_list ->
  unit ->
  associate_source_views_request
