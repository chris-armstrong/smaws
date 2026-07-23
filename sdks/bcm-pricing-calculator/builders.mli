open Types

val make_update_preferences_response :
  ?management_account_rate_type_selections:rate_types ->
  ?member_account_rate_type_selections:rate_types ->
  ?standalone_account_rate_type_selections:rate_types ->
  unit ->
  update_preferences_response

val make_update_preferences_request :
  ?management_account_rate_type_selections:rate_types ->
  ?member_account_rate_type_selections:rate_types ->
  ?standalone_account_rate_type_selections:rate_types ->
  unit ->
  update_preferences_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  arn:arn -> tag_keys:resource_tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : arn:arn -> tags:tags -> unit -> tag_resource_request
val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : arn:arn -> unit -> list_tags_for_resource_request

val make_get_preferences_response :
  ?management_account_rate_type_selections:rate_types ->
  ?member_account_rate_type_selections:rate_types ->
  ?standalone_account_rate_type_selections:rate_types ->
  unit ->
  get_preferences_response

val make_get_preferences_request : unit -> unit

val make_add_reserved_instance_action :
  ?reserved_instances_offering_id:uuid ->
  ?instance_count:reserved_instance_instance_count ->
  unit ->
  add_reserved_instance_action

val make_add_savings_plan_action :
  ?savings_plan_offering_id:uuid ->
  ?commitment:savings_plan_commitment ->
  unit ->
  add_savings_plan_action

val make_batch_create_bill_scenario_commitment_modification_error :
  ?key:key ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:batch_create_bill_scenario_commitment_modification_error_code ->
  unit ->
  batch_create_bill_scenario_commitment_modification_error

val make_negate_savings_plan_action : ?savings_plan_id:uuid -> unit -> negate_savings_plan_action

val make_negate_reserved_instance_action :
  ?reserved_instances_id:uuid -> unit -> negate_reserved_instance_action

val make_batch_create_bill_scenario_commitment_modification_item :
  ?key:key ->
  ?id:resource_id ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?commitment_action:bill_scenario_commitment_modification_action ->
  unit ->
  batch_create_bill_scenario_commitment_modification_item

val make_batch_create_bill_scenario_commitment_modification_response :
  ?items:batch_create_bill_scenario_commitment_modification_items ->
  ?errors:batch_create_bill_scenario_commitment_modification_errors ->
  unit ->
  batch_create_bill_scenario_commitment_modification_response

val make_batch_create_bill_scenario_commitment_modification_entry :
  ?group:usage_group ->
  key:key ->
  usage_account_id:account_id ->
  commitment_action:bill_scenario_commitment_modification_action ->
  unit ->
  batch_create_bill_scenario_commitment_modification_entry

val make_batch_create_bill_scenario_commitment_modification_request :
  ?client_token:client_token ->
  bill_scenario_id:resource_id ->
  commitment_modifications:batch_create_bill_scenario_commitment_modification_entries ->
  unit ->
  batch_create_bill_scenario_commitment_modification_request

val make_batch_create_bill_scenario_usage_modification_error :
  ?key:key ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:batch_create_bill_scenario_usage_modification_error_code ->
  unit ->
  batch_create_bill_scenario_usage_modification_error

val make_expression_filter :
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  ?match_options:string_list ->
  ?values:string_list ->
  unit ->
  expression_filter

val make_expression :
  ?and_:expression_list ->
  ?\#or:expression_list ->
  ?not:expression ->
  ?cost_categories:expression_filter ->
  ?dimensions:expression_filter ->
  ?tags:expression_filter ->
  unit ->
  expression

val make_bill_interval :
  ?start:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  bill_interval

val make_historical_usage_entity :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  usage_account_id:account_id ->
  bill_interval:bill_interval ->
  filter_expression:expression ->
  unit ->
  historical_usage_entity

val make_usage_quantity :
  ?start_hour:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?unit_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?amount:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  usage_quantity

val make_batch_create_bill_scenario_usage_modification_item :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:availability_zone ->
  ?id:resource_id ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?quantities:usage_quantities ->
  ?historical_usage:historical_usage_entity ->
  ?key:key ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  unit ->
  batch_create_bill_scenario_usage_modification_item

val make_batch_create_bill_scenario_usage_modification_response :
  ?items:batch_create_bill_scenario_usage_modification_items ->
  ?errors:batch_create_bill_scenario_usage_modification_errors ->
  unit ->
  batch_create_bill_scenario_usage_modification_response

val make_usage_amount :
  start_hour:Smaws_Lib.Smithy_api.Types.timestamp ->
  amount:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  usage_amount

val make_batch_create_bill_scenario_usage_modification_entry :
  ?availability_zone:availability_zone ->
  ?group:usage_group ->
  ?amounts:usage_amounts ->
  ?historical_usage:historical_usage_entity ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  key:key ->
  usage_account_id:account_id ->
  unit ->
  batch_create_bill_scenario_usage_modification_entry

val make_batch_create_bill_scenario_usage_modification_request :
  ?client_token:client_token ->
  bill_scenario_id:resource_id ->
  usage_modifications:batch_create_bill_scenario_usage_modification_entries ->
  unit ->
  batch_create_bill_scenario_usage_modification_request

val make_batch_create_workload_estimate_usage_error :
  ?key:key ->
  ?error_code:batch_create_workload_estimate_usage_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  batch_create_workload_estimate_usage_error

val make_workload_estimate_usage_quantity :
  ?unit_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?amount:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  workload_estimate_usage_quantity

val make_batch_create_workload_estimate_usage_item :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:resource_id ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?quantity:workload_estimate_usage_quantity ->
  ?cost:Smaws_Lib.Smithy_api.Types.double ->
  ?currency:currency_code ->
  ?status:workload_estimate_cost_status ->
  ?historical_usage:historical_usage_entity ->
  ?key:key ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  unit ->
  batch_create_workload_estimate_usage_item

val make_batch_create_workload_estimate_usage_response :
  ?items:batch_create_workload_estimate_usage_items ->
  ?errors:batch_create_workload_estimate_usage_errors ->
  unit ->
  batch_create_workload_estimate_usage_response

val make_batch_create_workload_estimate_usage_entry :
  ?group:usage_group ->
  ?historical_usage:historical_usage_entity ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  key:key ->
  usage_account_id:account_id ->
  amount:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  batch_create_workload_estimate_usage_entry

val make_batch_create_workload_estimate_usage_request :
  ?client_token:client_token ->
  workload_estimate_id:resource_id ->
  usage:batch_create_workload_estimate_usage_entries ->
  unit ->
  batch_create_workload_estimate_usage_request

val make_batch_delete_bill_scenario_commitment_modification_error :
  ?id:resource_id ->
  ?error_code:batch_delete_bill_scenario_commitment_modification_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  batch_delete_bill_scenario_commitment_modification_error

val make_batch_delete_bill_scenario_commitment_modification_response :
  ?errors:batch_delete_bill_scenario_commitment_modification_errors ->
  unit ->
  batch_delete_bill_scenario_commitment_modification_response

val make_batch_delete_bill_scenario_commitment_modification_request :
  bill_scenario_id:resource_id ->
  ids:batch_delete_bill_scenario_commitment_modification_entries ->
  unit ->
  batch_delete_bill_scenario_commitment_modification_request

val make_batch_delete_bill_scenario_usage_modification_error :
  ?id:resource_id ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:batch_delete_bill_scenario_usage_modification_error_code ->
  unit ->
  batch_delete_bill_scenario_usage_modification_error

val make_batch_delete_bill_scenario_usage_modification_response :
  ?errors:batch_delete_bill_scenario_usage_modification_errors ->
  unit ->
  batch_delete_bill_scenario_usage_modification_response

val make_batch_delete_bill_scenario_usage_modification_request :
  bill_scenario_id:resource_id ->
  ids:batch_delete_bill_scenario_usage_modification_entries ->
  unit ->
  batch_delete_bill_scenario_usage_modification_request

val make_batch_delete_workload_estimate_usage_error :
  ?id:resource_id ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:workload_estimate_update_usage_error_code ->
  unit ->
  batch_delete_workload_estimate_usage_error

val make_batch_delete_workload_estimate_usage_response :
  ?errors:batch_delete_workload_estimate_usage_errors ->
  unit ->
  batch_delete_workload_estimate_usage_response

val make_batch_delete_workload_estimate_usage_request :
  workload_estimate_id:resource_id ->
  ids:batch_delete_workload_estimate_usage_entries ->
  unit ->
  batch_delete_workload_estimate_usage_request

val make_batch_update_bill_scenario_commitment_modification_error :
  ?id:resource_id ->
  ?error_code:batch_update_bill_scenario_commitment_modification_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  batch_update_bill_scenario_commitment_modification_error

val make_bill_scenario_commitment_modification_item :
  ?id:resource_id ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?commitment_action:bill_scenario_commitment_modification_action ->
  unit ->
  bill_scenario_commitment_modification_item

val make_batch_update_bill_scenario_commitment_modification_response :
  ?items:bill_scenario_commitment_modification_items ->
  ?errors:batch_update_bill_scenario_commitment_modification_errors ->
  unit ->
  batch_update_bill_scenario_commitment_modification_response

val make_batch_update_bill_scenario_commitment_modification_entry :
  ?group:usage_group ->
  id:resource_id ->
  unit ->
  batch_update_bill_scenario_commitment_modification_entry

val make_batch_update_bill_scenario_commitment_modification_request :
  bill_scenario_id:resource_id ->
  commitment_modifications:batch_update_bill_scenario_commitment_modification_entries ->
  unit ->
  batch_update_bill_scenario_commitment_modification_request

val make_batch_update_bill_scenario_usage_modification_error :
  ?id:resource_id ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:batch_update_bill_scenario_usage_modification_error_code ->
  unit ->
  batch_update_bill_scenario_usage_modification_error

val make_bill_scenario_usage_modification_item :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:availability_zone ->
  ?id:resource_id ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?quantities:usage_quantities ->
  ?historical_usage:historical_usage_entity ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  unit ->
  bill_scenario_usage_modification_item

val make_batch_update_bill_scenario_usage_modification_response :
  ?items:bill_scenario_usage_modification_items ->
  ?errors:batch_update_bill_scenario_usage_modification_errors ->
  unit ->
  batch_update_bill_scenario_usage_modification_response

val make_batch_update_bill_scenario_usage_modification_entry :
  ?group:usage_group ->
  ?amounts:usage_amounts ->
  id:resource_id ->
  unit ->
  batch_update_bill_scenario_usage_modification_entry

val make_batch_update_bill_scenario_usage_modification_request :
  bill_scenario_id:resource_id ->
  usage_modifications:batch_update_bill_scenario_usage_modification_entries ->
  unit ->
  batch_update_bill_scenario_usage_modification_request

val make_batch_update_workload_estimate_usage_error :
  ?id:resource_id ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:workload_estimate_update_usage_error_code ->
  unit ->
  batch_update_workload_estimate_usage_error

val make_workload_estimate_usage_item :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:resource_id ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?quantity:workload_estimate_usage_quantity ->
  ?cost:Smaws_Lib.Smithy_api.Types.double ->
  ?currency:currency_code ->
  ?status:workload_estimate_cost_status ->
  ?historical_usage:historical_usage_entity ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  unit ->
  workload_estimate_usage_item

val make_batch_update_workload_estimate_usage_response :
  ?items:workload_estimate_usage_items ->
  ?errors:batch_update_workload_estimate_usage_errors ->
  unit ->
  batch_update_workload_estimate_usage_response

val make_batch_update_workload_estimate_usage_entry :
  ?group:usage_group ->
  ?amount:Smaws_Lib.Smithy_api.Types.double ->
  id:resource_id ->
  unit ->
  batch_update_workload_estimate_usage_entry

val make_batch_update_workload_estimate_usage_request :
  workload_estimate_id:resource_id ->
  usage:batch_update_workload_estimate_usage_entries ->
  unit ->
  batch_update_workload_estimate_usage_request

val make_cost_amount :
  ?amount:Smaws_Lib.Smithy_api.Types.double -> ?currency:currency_code -> unit -> cost_amount

val make_bill_estimate_commitment_summary :
  ?id:resource_id ->
  ?purchase_agreement_type:purchase_agreement_type ->
  ?offering_id:uuid ->
  ?usage_account_id:account_id ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term_length:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?upfront_payment:cost_amount ->
  ?monthly_payment:cost_amount ->
  unit ->
  bill_estimate_commitment_summary

val make_cost_difference :
  ?historical_cost:cost_amount -> ?estimated_cost:cost_amount -> unit -> cost_difference

val make_bill_estimate_cost_summary :
  ?total_cost_difference:cost_difference ->
  ?service_cost_differences:service_cost_difference_map ->
  unit ->
  bill_estimate_cost_summary

val make_bill_estimate_input_commitment_modification_summary :
  ?id:resource_id ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?commitment_action:bill_scenario_commitment_modification_action ->
  unit ->
  bill_estimate_input_commitment_modification_summary

val make_bill_estimate_input_usage_modification_summary :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:availability_zone ->
  ?id:resource_id ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?quantities:usage_quantities ->
  ?historical_usage:historical_usage_entity ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  unit ->
  bill_estimate_input_usage_modification_summary

val make_bill_estimate_line_item_summary :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone:availability_zone ->
  ?id:resource_id ->
  ?line_item_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?line_item_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?payer_account_id:account_id ->
  ?usage_account_id:account_id ->
  ?estimated_usage_quantity:usage_quantity_result ->
  ?estimated_cost:cost_amount ->
  ?historical_usage_quantity:usage_quantity_result ->
  ?historical_cost:cost_amount ->
  ?savings_plan_arns:savings_plan_arns ->
  service_code:service_code ->
  usage_type:usage_type ->
  operation:operation ->
  unit ->
  bill_estimate_line_item_summary

val make_bill_estimate_summary :
  ?name:bill_estimate_name ->
  ?status:bill_estimate_status ->
  ?bill_interval:bill_interval ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:resource_id ->
  unit ->
  bill_estimate_summary

val make_bill_scenario_summary :
  ?name:bill_scenario_name ->
  ?bill_interval:bill_interval ->
  ?status:bill_scenario_status ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  id:resource_id ->
  unit ->
  bill_scenario_summary

val make_create_bill_estimate_response :
  ?name:bill_estimate_name ->
  ?status:bill_estimate_status ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?bill_interval:bill_interval ->
  ?cost_summary:bill_estimate_cost_summary ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?cost_category_group_sharing_preference_effective_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:resource_id ->
  unit ->
  create_bill_estimate_response

val make_create_bill_estimate_request :
  ?client_token:client_token ->
  ?tags:tags ->
  bill_scenario_id:resource_id ->
  name:bill_estimate_name ->
  unit ->
  create_bill_estimate_request

val make_create_bill_scenario_response :
  ?name:bill_scenario_name ->
  ?bill_interval:bill_interval ->
  ?status:bill_scenario_status ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  id:resource_id ->
  unit ->
  create_bill_scenario_response

val make_create_bill_scenario_request :
  ?client_token:client_token ->
  ?tags:tags ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  name:bill_scenario_name ->
  unit ->
  create_bill_scenario_request

val make_create_workload_estimate_response :
  ?name:workload_estimate_name ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:workload_estimate_status ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?cost_currency:currency_code ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  id:resource_id ->
  unit ->
  create_workload_estimate_response

val make_create_workload_estimate_request :
  ?client_token:client_token ->
  ?rate_type:workload_estimate_rate_type ->
  ?tags:tags ->
  name:workload_estimate_name ->
  unit ->
  create_workload_estimate_request

val make_delete_bill_estimate_response : unit -> unit

val make_delete_bill_estimate_request :
  identifier:resource_id -> unit -> delete_bill_estimate_request

val make_delete_bill_scenario_response : unit -> unit

val make_delete_bill_scenario_request :
  identifier:resource_id -> unit -> delete_bill_scenario_request

val make_delete_workload_estimate_response : unit -> unit

val make_delete_workload_estimate_request :
  identifier:resource_id -> unit -> delete_workload_estimate_request

val make_filter_timestamp :
  ?after_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?before_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  filter_timestamp

val make_get_bill_estimate_response :
  ?name:bill_estimate_name ->
  ?status:bill_estimate_status ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?bill_interval:bill_interval ->
  ?cost_summary:bill_estimate_cost_summary ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?cost_category_group_sharing_preference_effective_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:resource_id ->
  unit ->
  get_bill_estimate_response

val make_get_bill_estimate_request : identifier:resource_id -> unit -> get_bill_estimate_request

val make_get_bill_scenario_response :
  ?name:bill_scenario_name ->
  ?bill_interval:bill_interval ->
  ?status:bill_scenario_status ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  id:resource_id ->
  unit ->
  get_bill_scenario_response

val make_get_bill_scenario_request : identifier:resource_id -> unit -> get_bill_scenario_request

val make_get_workload_estimate_response :
  ?name:workload_estimate_name ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:workload_estimate_status ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?cost_currency:currency_code ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  id:resource_id ->
  unit ->
  get_workload_estimate_response

val make_get_workload_estimate_request :
  identifier:resource_id -> unit -> get_workload_estimate_request

val make_list_bill_estimate_commitments_response :
  ?items:bill_estimate_commitment_summaries ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_estimate_commitments_response

val make_list_bill_estimate_commitments_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_commitments_request

val make_list_bill_estimate_input_commitment_modifications_response :
  ?items:bill_estimate_input_commitment_modification_summaries ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_estimate_input_commitment_modifications_response

val make_list_bill_estimate_input_commitment_modifications_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_input_commitment_modifications_request

val make_list_bill_estimate_input_usage_modifications_response :
  ?items:bill_estimate_input_usage_modification_summaries ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_estimate_input_usage_modifications_response

val make_list_usage_filter :
  ?match_option:match_option ->
  name:list_usage_filter_name ->
  values:list_usage_filter_values ->
  unit ->
  list_usage_filter

val make_list_bill_estimate_input_usage_modifications_request :
  ?filters:list_usage_filters ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_input_usage_modifications_request

val make_list_bill_estimate_line_items_response :
  ?items:bill_estimate_line_item_summaries ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_estimate_line_items_response

val make_list_bill_estimate_line_items_filter :
  ?match_option:match_option ->
  name:list_bill_estimate_line_items_filter_name ->
  values:list_bill_estimate_line_items_filter_values ->
  unit ->
  list_bill_estimate_line_items_filter

val make_list_bill_estimate_line_items_request :
  ?filters:list_bill_estimate_line_items_filters ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_line_items_request

val make_list_bill_estimates_response :
  ?items:bill_estimate_summaries ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_estimates_response

val make_list_bill_estimates_filter :
  ?match_option:match_option ->
  name:list_bill_estimates_filter_name ->
  values:list_bill_estimates_filter_values ->
  unit ->
  list_bill_estimates_filter

val make_list_bill_estimates_request :
  ?filters:list_bill_estimates_filters ->
  ?created_at_filter:filter_timestamp ->
  ?expires_at_filter:filter_timestamp ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  unit ->
  list_bill_estimates_request

val make_list_bill_scenario_commitment_modifications_response :
  ?items:bill_scenario_commitment_modification_items ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_scenario_commitment_modifications_response

val make_list_bill_scenario_commitment_modifications_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  bill_scenario_id:resource_id ->
  unit ->
  list_bill_scenario_commitment_modifications_request

val make_list_bill_scenario_usage_modifications_response :
  ?items:bill_scenario_usage_modification_items ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_scenario_usage_modifications_response

val make_list_bill_scenario_usage_modifications_request :
  ?filters:list_usage_filters ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  bill_scenario_id:resource_id ->
  unit ->
  list_bill_scenario_usage_modifications_request

val make_list_bill_scenarios_response :
  ?items:bill_scenario_summaries ->
  ?next_token:next_page_token ->
  unit ->
  list_bill_scenarios_response

val make_list_bill_scenarios_filter :
  ?match_option:match_option ->
  name:list_bill_scenarios_filter_name ->
  values:list_bill_scenarios_filter_values ->
  unit ->
  list_bill_scenarios_filter

val make_list_bill_scenarios_request :
  ?filters:list_bill_scenarios_filters ->
  ?created_at_filter:filter_timestamp ->
  ?expires_at_filter:filter_timestamp ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  unit ->
  list_bill_scenarios_request

val make_list_workload_estimate_usage_response :
  ?items:workload_estimate_usage_items ->
  ?next_token:next_page_token ->
  unit ->
  list_workload_estimate_usage_response

val make_list_workload_estimate_usage_request :
  ?filters:list_usage_filters ->
  ?next_token:next_page_token ->
  ?max_results:workload_estimate_usage_max_results ->
  workload_estimate_id:resource_id ->
  unit ->
  list_workload_estimate_usage_request

val make_workload_estimate_summary :
  ?name:workload_estimate_name ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:workload_estimate_status ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?cost_currency:currency_code ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  id:resource_id ->
  unit ->
  workload_estimate_summary

val make_list_workload_estimates_response :
  ?items:workload_estimate_summaries ->
  ?next_token:next_page_token ->
  unit ->
  list_workload_estimates_response

val make_list_workload_estimates_filter :
  ?match_option:match_option ->
  name:list_workload_estimates_filter_name ->
  values:list_workload_estimates_filter_values ->
  unit ->
  list_workload_estimates_filter

val make_list_workload_estimates_request :
  ?created_at_filter:filter_timestamp ->
  ?expires_at_filter:filter_timestamp ->
  ?filters:list_workload_estimates_filters ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  unit ->
  list_workload_estimates_request

val make_update_bill_estimate_response :
  ?name:bill_estimate_name ->
  ?status:bill_estimate_status ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?bill_interval:bill_interval ->
  ?cost_summary:bill_estimate_cost_summary ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?cost_category_group_sharing_preference_effective_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  id:resource_id ->
  unit ->
  update_bill_estimate_response

val make_update_bill_estimate_request :
  ?name:bill_estimate_name ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  identifier:resource_id ->
  unit ->
  update_bill_estimate_request

val make_update_bill_scenario_response :
  ?name:bill_scenario_name ->
  ?bill_interval:bill_interval ->
  ?status:bill_scenario_status ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  id:resource_id ->
  unit ->
  update_bill_scenario_response

val make_update_bill_scenario_request :
  ?name:bill_scenario_name ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  identifier:resource_id ->
  unit ->
  update_bill_scenario_request

val make_update_workload_estimate_response :
  ?name:workload_estimate_name ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:workload_estimate_status ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?cost_currency:currency_code ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  id:resource_id ->
  unit ->
  update_workload_estimate_response

val make_update_workload_estimate_request :
  ?name:workload_estimate_name ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  identifier:resource_id ->
  unit ->
  update_workload_estimate_request

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field
