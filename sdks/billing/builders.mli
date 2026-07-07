open Types

val make_validation_exception_field :
  message:error_message -> name:field_name -> unit -> validation_exception_field

val make_update_billing_view_response :
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  arn:billing_view_arn ->
  unit ->
  update_billing_view_response

val make_dimension_values : values:values -> key:dimension -> unit -> dimension_values
val make_tag_values : values:values -> key:tag_key -> unit -> tag_values

val make_cost_category_values :
  values:values -> key:cost_category_name -> unit -> cost_category_values

val make_time_range :
  ?end_date_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?begin_date_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  time_range

val make_expression :
  ?time_range:time_range ->
  ?cost_categories:cost_category_values ->
  ?tags:tag_values ->
  ?dimensions:dimension_values ->
  unit ->
  expression

val make_update_billing_view_request :
  ?data_filter_expression:expression ->
  ?description:billing_view_description ->
  ?name:billing_view_name ->
  arn:billing_view_arn ->
  unit ->
  update_billing_view_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_tag_keys:resource_tag_key_list ->
  resource_arn:resource_arn ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_resource_tag : ?value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_tag_resource_request :
  resource_tags:resource_tag_list -> resource_arn:resource_arn -> unit -> tag_resource_request

val make_string_search :
  search_value:search_value -> search_option:search_option -> unit -> string_search

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
  ?next_token:page_token ->
  ?max_results:billing_views_max_results ->
  arn:billing_view_arn ->
  unit ->
  list_source_views_for_billing_view_request

val make_billing_view_health_status :
  ?status_reasons:billing_view_status_reasons ->
  ?status_code:billing_view_status ->
  unit ->
  billing_view_health_status

val make_billing_view_list_element :
  ?health_status:billing_view_health_status ->
  ?billing_view_type:billing_view_type ->
  ?source_account_id:account_id ->
  ?owner_account_id:account_id ->
  ?description:billing_view_description ->
  ?name:billing_view_name ->
  ?arn:billing_view_arn ->
  unit ->
  billing_view_list_element

val make_list_billing_views_response :
  ?next_token:page_token -> billing_views:billing_view_list -> unit -> list_billing_views_response

val make_active_time_range :
  active_before_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  active_after_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  active_time_range

val make_list_billing_views_request :
  ?next_token:page_token ->
  ?max_results:billing_views_max_results ->
  ?source_account_id:account_id ->
  ?owner_account_id:account_id ->
  ?names:string_searches ->
  ?billing_view_types:billing_view_type_list ->
  ?arns:billing_view_arn_list ->
  ?active_time_range:active_time_range ->
  unit ->
  list_billing_views_request

val make_get_resource_policy_response :
  ?policy:policy_document -> resource_arn:resource_arn -> unit -> get_resource_policy_response

val make_get_resource_policy_request :
  resource_arn:resource_arn -> unit -> get_resource_policy_request

val make_billing_view_element :
  ?health_status:billing_view_health_status ->
  ?view_definition_last_updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?source_view_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?derived_view_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?updated_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?data_filter_expression:expression ->
  ?source_account_id:account_id ->
  ?owner_account_id:account_id ->
  ?billing_view_type:billing_view_type ->
  ?description:billing_view_description ->
  ?name:billing_view_name ->
  ?arn:billing_view_arn ->
  unit ->
  billing_view_element

val make_get_billing_view_response :
  billing_view:billing_view_element -> unit -> get_billing_view_response

val make_get_billing_view_request : arn:billing_view_arn -> unit -> get_billing_view_request

val make_disassociate_source_views_response :
  arn:billing_view_arn -> unit -> disassociate_source_views_response

val make_disassociate_source_views_request :
  source_views:billing_view_source_views_list ->
  arn:billing_view_arn ->
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
  ?resource_tags:resource_tag_list ->
  ?client_token:client_token ->
  ?data_filter_expression:expression ->
  ?description:billing_view_description ->
  source_views:billing_view_source_views_list ->
  name:billing_view_name ->
  unit ->
  create_billing_view_request

val make_associate_source_views_response :
  arn:billing_view_arn -> unit -> associate_source_views_response

val make_associate_source_views_request :
  source_views:billing_view_source_views_list ->
  arn:billing_view_arn ->
  unit ->
  associate_source_views_request
