open Types

val make_workload_estimate_usage_quantity :
  ?amount:Smaws_Lib.Smithy_api.Types.double ->
  ?unit_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  workload_estimate_usage_quantity

val make_bill_interval :
  ?end_:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  bill_interval

val make_expression_filter :
  ?values:string_list ->
  ?match_options:string_list ->
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  expression_filter

val make_expression :
  ?tags:expression_filter ->
  ?dimensions:expression_filter ->
  ?cost_categories:expression_filter ->
  ?not:expression ->
  ?\#or:expression_list ->
  ?and_:expression_list ->
  unit ->
  expression

val make_historical_usage_entity :
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  filter_expression:expression ->
  bill_interval:bill_interval ->
  usage_account_id:account_id ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  historical_usage_entity

val make_workload_estimate_usage_item :
  ?historical_usage:historical_usage_entity ->
  ?status:workload_estimate_cost_status ->
  ?currency:currency_code ->
  ?cost:Smaws_Lib.Smithy_api.Types.double ->
  ?quantity:workload_estimate_usage_quantity ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?id:resource_id ->
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  workload_estimate_usage_item

val make_workload_estimate_summary :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cost_currency:currency_code ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?status:workload_estimate_status ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?name:workload_estimate_name ->
  id:resource_id ->
  unit ->
  workload_estimate_summary

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_usage_quantity :
  ?amount:Smaws_Lib.Smithy_api.Types.double ->
  ?unit_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?start_hour:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  usage_quantity

val make_usage_amount :
  amount:Smaws_Lib.Smithy_api.Types.double ->
  start_hour:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  usage_amount

val make_update_workload_estimate_response :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cost_currency:currency_code ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?status:workload_estimate_status ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?name:workload_estimate_name ->
  id:resource_id ->
  unit ->
  update_workload_estimate_response

val make_update_workload_estimate_request :
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?name:workload_estimate_name ->
  identifier:resource_id ->
  unit ->
  update_workload_estimate_request

val make_update_preferences_response :
  ?standalone_account_rate_type_selections:rate_types ->
  ?member_account_rate_type_selections:rate_types ->
  ?management_account_rate_type_selections:rate_types ->
  unit ->
  update_preferences_response

val make_update_preferences_request :
  ?standalone_account_rate_type_selections:rate_types ->
  ?member_account_rate_type_selections:rate_types ->
  ?management_account_rate_type_selections:rate_types ->
  unit ->
  update_preferences_request

val make_update_bill_scenario_response :
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:bill_scenario_status ->
  ?bill_interval:bill_interval ->
  ?name:bill_scenario_name ->
  id:resource_id ->
  unit ->
  update_bill_scenario_response

val make_update_bill_scenario_request :
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?name:bill_scenario_name ->
  identifier:resource_id ->
  unit ->
  update_bill_scenario_request

val make_cost_amount :
  ?currency:currency_code -> ?amount:Smaws_Lib.Smithy_api.Types.double -> unit -> cost_amount

val make_cost_difference :
  ?estimated_cost:cost_amount -> ?historical_cost:cost_amount -> unit -> cost_difference

val make_bill_estimate_cost_summary :
  ?service_cost_differences:service_cost_difference_map ->
  ?total_cost_difference:cost_difference ->
  unit ->
  bill_estimate_cost_summary

val make_update_bill_estimate_response :
  ?cost_category_group_sharing_preference_effective_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cost_summary:bill_estimate_cost_summary ->
  ?bill_interval:bill_interval ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:bill_estimate_status ->
  ?name:bill_estimate_name ->
  id:resource_id ->
  unit ->
  update_bill_estimate_response

val make_update_bill_estimate_request :
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?name:bill_estimate_name ->
  identifier:resource_id ->
  unit ->
  update_bill_estimate_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:resource_tag_keys -> arn:arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tags -> arn:arn -> unit -> tag_resource_request
val make_negate_savings_plan_action : ?savings_plan_id:uuid -> unit -> negate_savings_plan_action

val make_negate_reserved_instance_action :
  ?reserved_instances_id:uuid -> unit -> negate_reserved_instance_action

val make_list_workload_estimates_response :
  ?next_token:next_page_token ->
  ?items:workload_estimate_summaries ->
  unit ->
  list_workload_estimates_response

val make_filter_timestamp :
  ?before_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?after_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  filter_timestamp

val make_list_workload_estimates_filter :
  ?match_option:match_option ->
  values:list_workload_estimates_filter_values ->
  name:list_workload_estimates_filter_name ->
  unit ->
  list_workload_estimates_filter

val make_list_workload_estimates_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?filters:list_workload_estimates_filters ->
  ?expires_at_filter:filter_timestamp ->
  ?created_at_filter:filter_timestamp ->
  unit ->
  list_workload_estimates_request

val make_list_workload_estimate_usage_response :
  ?next_token:next_page_token ->
  ?items:workload_estimate_usage_items ->
  unit ->
  list_workload_estimate_usage_response

val make_list_usage_filter :
  ?match_option:match_option ->
  values:list_usage_filter_values ->
  name:list_usage_filter_name ->
  unit ->
  list_usage_filter

val make_list_workload_estimate_usage_request :
  ?max_results:workload_estimate_usage_max_results ->
  ?next_token:next_page_token ->
  ?filters:list_usage_filters ->
  workload_estimate_id:resource_id ->
  unit ->
  list_workload_estimate_usage_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : arn:arn -> unit -> list_tags_for_resource_request

val make_bill_scenario_summary :
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:bill_scenario_status ->
  ?bill_interval:bill_interval ->
  ?name:bill_scenario_name ->
  id:resource_id ->
  unit ->
  bill_scenario_summary

val make_list_bill_scenarios_response :
  ?next_token:next_page_token ->
  ?items:bill_scenario_summaries ->
  unit ->
  list_bill_scenarios_response

val make_list_bill_scenarios_filter :
  ?match_option:match_option ->
  values:list_bill_scenarios_filter_values ->
  name:list_bill_scenarios_filter_name ->
  unit ->
  list_bill_scenarios_filter

val make_list_bill_scenarios_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?expires_at_filter:filter_timestamp ->
  ?created_at_filter:filter_timestamp ->
  ?filters:list_bill_scenarios_filters ->
  unit ->
  list_bill_scenarios_request

val make_bill_scenario_usage_modification_item :
  ?historical_usage:historical_usage_entity ->
  ?quantities:usage_quantities ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?id:resource_id ->
  ?availability_zone:availability_zone ->
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  bill_scenario_usage_modification_item

val make_list_bill_scenario_usage_modifications_response :
  ?next_token:next_page_token ->
  ?items:bill_scenario_usage_modification_items ->
  unit ->
  list_bill_scenario_usage_modifications_response

val make_list_bill_scenario_usage_modifications_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?filters:list_usage_filters ->
  bill_scenario_id:resource_id ->
  unit ->
  list_bill_scenario_usage_modifications_request

val make_add_reserved_instance_action :
  ?instance_count:reserved_instance_instance_count ->
  ?reserved_instances_offering_id:uuid ->
  unit ->
  add_reserved_instance_action

val make_add_savings_plan_action :
  ?commitment:savings_plan_commitment ->
  ?savings_plan_offering_id:uuid ->
  unit ->
  add_savings_plan_action

val make_bill_scenario_commitment_modification_item :
  ?commitment_action:bill_scenario_commitment_modification_action ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?id:resource_id ->
  unit ->
  bill_scenario_commitment_modification_item

val make_list_bill_scenario_commitment_modifications_response :
  ?next_token:next_page_token ->
  ?items:bill_scenario_commitment_modification_items ->
  unit ->
  list_bill_scenario_commitment_modifications_response

val make_list_bill_scenario_commitment_modifications_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  bill_scenario_id:resource_id ->
  unit ->
  list_bill_scenario_commitment_modifications_request

val make_bill_estimate_summary :
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?bill_interval:bill_interval ->
  ?status:bill_estimate_status ->
  ?name:bill_estimate_name ->
  id:resource_id ->
  unit ->
  bill_estimate_summary

val make_list_bill_estimates_response :
  ?next_token:next_page_token ->
  ?items:bill_estimate_summaries ->
  unit ->
  list_bill_estimates_response

val make_list_bill_estimates_filter :
  ?match_option:match_option ->
  values:list_bill_estimates_filter_values ->
  name:list_bill_estimates_filter_name ->
  unit ->
  list_bill_estimates_filter

val make_list_bill_estimates_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?expires_at_filter:filter_timestamp ->
  ?created_at_filter:filter_timestamp ->
  ?filters:list_bill_estimates_filters ->
  unit ->
  list_bill_estimates_request

val make_bill_estimate_line_item_summary :
  ?savings_plan_arns:savings_plan_arns ->
  ?historical_cost:cost_amount ->
  ?historical_usage_quantity:usage_quantity_result ->
  ?estimated_cost:cost_amount ->
  ?estimated_usage_quantity:usage_quantity_result ->
  ?usage_account_id:account_id ->
  ?payer_account_id:account_id ->
  ?line_item_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?line_item_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:resource_id ->
  ?availability_zone:availability_zone ->
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  bill_estimate_line_item_summary

val make_list_bill_estimate_line_items_response :
  ?next_token:next_page_token ->
  ?items:bill_estimate_line_item_summaries ->
  unit ->
  list_bill_estimate_line_items_response

val make_list_bill_estimate_line_items_filter :
  ?match_option:match_option ->
  values:list_bill_estimate_line_items_filter_values ->
  name:list_bill_estimate_line_items_filter_name ->
  unit ->
  list_bill_estimate_line_items_filter

val make_list_bill_estimate_line_items_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?filters:list_bill_estimate_line_items_filters ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_line_items_request

val make_bill_estimate_input_usage_modification_summary :
  ?historical_usage:historical_usage_entity ->
  ?quantities:usage_quantities ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?id:resource_id ->
  ?availability_zone:availability_zone ->
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  bill_estimate_input_usage_modification_summary

val make_list_bill_estimate_input_usage_modifications_response :
  ?next_token:next_page_token ->
  ?items:bill_estimate_input_usage_modification_summaries ->
  unit ->
  list_bill_estimate_input_usage_modifications_response

val make_list_bill_estimate_input_usage_modifications_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?filters:list_usage_filters ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_input_usage_modifications_request

val make_bill_estimate_input_commitment_modification_summary :
  ?commitment_action:bill_scenario_commitment_modification_action ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?id:resource_id ->
  unit ->
  bill_estimate_input_commitment_modification_summary

val make_list_bill_estimate_input_commitment_modifications_response :
  ?next_token:next_page_token ->
  ?items:bill_estimate_input_commitment_modification_summaries ->
  unit ->
  list_bill_estimate_input_commitment_modifications_response

val make_list_bill_estimate_input_commitment_modifications_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_input_commitment_modifications_request

val make_bill_estimate_commitment_summary :
  ?monthly_payment:cost_amount ->
  ?upfront_payment:cost_amount ->
  ?payment_option:Smaws_Lib.Smithy_api.Types.string_ ->
  ?term_length:Smaws_Lib.Smithy_api.Types.string_ ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?usage_account_id:account_id ->
  ?offering_id:uuid ->
  ?purchase_agreement_type:purchase_agreement_type ->
  ?id:resource_id ->
  unit ->
  bill_estimate_commitment_summary

val make_list_bill_estimate_commitments_response :
  ?next_token:next_page_token ->
  ?items:bill_estimate_commitment_summaries ->
  unit ->
  list_bill_estimate_commitments_response

val make_list_bill_estimate_commitments_request :
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  bill_estimate_id:resource_id ->
  unit ->
  list_bill_estimate_commitments_request

val make_get_workload_estimate_response :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cost_currency:currency_code ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?status:workload_estimate_status ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?name:workload_estimate_name ->
  id:resource_id ->
  unit ->
  get_workload_estimate_response

val make_get_workload_estimate_request :
  identifier:resource_id -> unit -> get_workload_estimate_request

val make_get_preferences_response :
  ?standalone_account_rate_type_selections:rate_types ->
  ?member_account_rate_type_selections:rate_types ->
  ?management_account_rate_type_selections:rate_types ->
  unit ->
  get_preferences_response

val make_get_preferences_request : unit -> unit

val make_get_bill_scenario_response :
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:bill_scenario_status ->
  ?bill_interval:bill_interval ->
  ?name:bill_scenario_name ->
  id:resource_id ->
  unit ->
  get_bill_scenario_response

val make_get_bill_scenario_request : identifier:resource_id -> unit -> get_bill_scenario_request

val make_get_bill_estimate_response :
  ?cost_category_group_sharing_preference_effective_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cost_summary:bill_estimate_cost_summary ->
  ?bill_interval:bill_interval ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:bill_estimate_status ->
  ?name:bill_estimate_name ->
  id:resource_id ->
  unit ->
  get_bill_estimate_response

val make_get_bill_estimate_request : identifier:resource_id -> unit -> get_bill_estimate_request
val make_delete_workload_estimate_response : unit -> unit

val make_delete_workload_estimate_request :
  identifier:resource_id -> unit -> delete_workload_estimate_request

val make_delete_bill_scenario_response : unit -> unit

val make_delete_bill_scenario_request :
  identifier:resource_id -> unit -> delete_bill_scenario_request

val make_delete_bill_estimate_response : unit -> unit

val make_delete_bill_estimate_request :
  identifier:resource_id -> unit -> delete_bill_estimate_request

val make_create_workload_estimate_response :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?cost_currency:currency_code ->
  ?total_cost:Smaws_Lib.Smithy_api.Types.double ->
  ?status:workload_estimate_status ->
  ?rate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?rate_type:workload_estimate_rate_type ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?name:workload_estimate_name ->
  id:resource_id ->
  unit ->
  create_workload_estimate_response

val make_create_workload_estimate_request :
  ?tags:tags ->
  ?rate_type:workload_estimate_rate_type ->
  ?client_token:client_token ->
  name:workload_estimate_name ->
  unit ->
  create_workload_estimate_request

val make_create_bill_scenario_response :
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:bill_scenario_status ->
  ?bill_interval:bill_interval ->
  ?name:bill_scenario_name ->
  id:resource_id ->
  unit ->
  create_bill_scenario_response

val make_create_bill_scenario_request :
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?tags:tags ->
  ?client_token:client_token ->
  name:bill_scenario_name ->
  unit ->
  create_bill_scenario_request

val make_create_bill_estimate_response :
  ?cost_category_group_sharing_preference_effective_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cost_category_group_sharing_preference_arn:cost_category_arn ->
  ?group_sharing_preference:group_sharing_preference_enum ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?cost_summary:bill_estimate_cost_summary ->
  ?bill_interval:bill_interval ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?status:bill_estimate_status ->
  ?name:bill_estimate_name ->
  id:resource_id ->
  unit ->
  create_bill_estimate_response

val make_create_bill_estimate_request :
  ?tags:tags ->
  ?client_token:client_token ->
  name:bill_estimate_name ->
  bill_scenario_id:resource_id ->
  unit ->
  create_bill_estimate_request

val make_batch_update_workload_estimate_usage_error :
  ?error_code:workload_estimate_update_usage_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:resource_id ->
  unit ->
  batch_update_workload_estimate_usage_error

val make_batch_update_workload_estimate_usage_response :
  ?errors:batch_update_workload_estimate_usage_errors ->
  ?items:workload_estimate_usage_items ->
  unit ->
  batch_update_workload_estimate_usage_response

val make_batch_update_workload_estimate_usage_entry :
  ?amount:Smaws_Lib.Smithy_api.Types.double ->
  ?group:usage_group ->
  id:resource_id ->
  unit ->
  batch_update_workload_estimate_usage_entry

val make_batch_update_workload_estimate_usage_request :
  usage:batch_update_workload_estimate_usage_entries ->
  workload_estimate_id:resource_id ->
  unit ->
  batch_update_workload_estimate_usage_request

val make_batch_update_bill_scenario_usage_modification_error :
  ?error_code:batch_update_bill_scenario_usage_modification_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:resource_id ->
  unit ->
  batch_update_bill_scenario_usage_modification_error

val make_batch_update_bill_scenario_usage_modification_response :
  ?errors:batch_update_bill_scenario_usage_modification_errors ->
  ?items:bill_scenario_usage_modification_items ->
  unit ->
  batch_update_bill_scenario_usage_modification_response

val make_batch_update_bill_scenario_usage_modification_entry :
  ?amounts:usage_amounts ->
  ?group:usage_group ->
  id:resource_id ->
  unit ->
  batch_update_bill_scenario_usage_modification_entry

val make_batch_update_bill_scenario_usage_modification_request :
  usage_modifications:batch_update_bill_scenario_usage_modification_entries ->
  bill_scenario_id:resource_id ->
  unit ->
  batch_update_bill_scenario_usage_modification_request

val make_batch_update_bill_scenario_commitment_modification_error :
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:batch_update_bill_scenario_commitment_modification_error_code ->
  ?id:resource_id ->
  unit ->
  batch_update_bill_scenario_commitment_modification_error

val make_batch_update_bill_scenario_commitment_modification_response :
  ?errors:batch_update_bill_scenario_commitment_modification_errors ->
  ?items:bill_scenario_commitment_modification_items ->
  unit ->
  batch_update_bill_scenario_commitment_modification_response

val make_batch_update_bill_scenario_commitment_modification_entry :
  ?group:usage_group ->
  id:resource_id ->
  unit ->
  batch_update_bill_scenario_commitment_modification_entry

val make_batch_update_bill_scenario_commitment_modification_request :
  commitment_modifications:batch_update_bill_scenario_commitment_modification_entries ->
  bill_scenario_id:resource_id ->
  unit ->
  batch_update_bill_scenario_commitment_modification_request

val make_batch_delete_workload_estimate_usage_error :
  ?error_code:workload_estimate_update_usage_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:resource_id ->
  unit ->
  batch_delete_workload_estimate_usage_error

val make_batch_delete_workload_estimate_usage_response :
  ?errors:batch_delete_workload_estimate_usage_errors ->
  unit ->
  batch_delete_workload_estimate_usage_response

val make_batch_delete_workload_estimate_usage_request :
  ids:batch_delete_workload_estimate_usage_entries ->
  workload_estimate_id:resource_id ->
  unit ->
  batch_delete_workload_estimate_usage_request

val make_batch_delete_bill_scenario_usage_modification_error :
  ?error_code:batch_delete_bill_scenario_usage_modification_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:resource_id ->
  unit ->
  batch_delete_bill_scenario_usage_modification_error

val make_batch_delete_bill_scenario_usage_modification_response :
  ?errors:batch_delete_bill_scenario_usage_modification_errors ->
  unit ->
  batch_delete_bill_scenario_usage_modification_response

val make_batch_delete_bill_scenario_usage_modification_request :
  ids:batch_delete_bill_scenario_usage_modification_entries ->
  bill_scenario_id:resource_id ->
  unit ->
  batch_delete_bill_scenario_usage_modification_request

val make_batch_delete_bill_scenario_commitment_modification_error :
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:batch_delete_bill_scenario_commitment_modification_error_code ->
  ?id:resource_id ->
  unit ->
  batch_delete_bill_scenario_commitment_modification_error

val make_batch_delete_bill_scenario_commitment_modification_response :
  ?errors:batch_delete_bill_scenario_commitment_modification_errors ->
  unit ->
  batch_delete_bill_scenario_commitment_modification_response

val make_batch_delete_bill_scenario_commitment_modification_request :
  ids:batch_delete_bill_scenario_commitment_modification_entries ->
  bill_scenario_id:resource_id ->
  unit ->
  batch_delete_bill_scenario_commitment_modification_request

val make_batch_create_workload_estimate_usage_item :
  ?key:key ->
  ?historical_usage:historical_usage_entity ->
  ?status:workload_estimate_cost_status ->
  ?currency:currency_code ->
  ?cost:Smaws_Lib.Smithy_api.Types.double ->
  ?quantity:workload_estimate_usage_quantity ->
  ?group:usage_group ->
  ?usage_account_id:account_id ->
  ?id:resource_id ->
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  batch_create_workload_estimate_usage_item

val make_batch_create_workload_estimate_usage_error :
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?error_code:batch_create_workload_estimate_usage_code ->
  ?key:key ->
  unit ->
  batch_create_workload_estimate_usage_error

val make_batch_create_workload_estimate_usage_response :
  ?errors:batch_create_workload_estimate_usage_errors ->
  ?items:batch_create_workload_estimate_usage_items ->
  unit ->
  batch_create_workload_estimate_usage_response

val make_batch_create_workload_estimate_usage_entry :
  ?historical_usage:historical_usage_entity ->
  ?group:usage_group ->
  amount:Smaws_Lib.Smithy_api.Types.double ->
  usage_account_id:account_id ->
  key:key ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  batch_create_workload_estimate_usage_entry

val make_batch_create_workload_estimate_usage_request :
  ?client_token:client_token ->
  usage:batch_create_workload_estimate_usage_entries ->
  workload_estimate_id:resource_id ->
  unit ->
  batch_create_workload_estimate_usage_request

val make_batch_create_bill_scenario_usage_modification_item :
  ?key:key ->
  ?historical_usage:historical_usage_entity ->
  ?quantities:usage_quantities ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?id:resource_id ->
  ?availability_zone:availability_zone ->
  ?location:Smaws_Lib.Smithy_api.Types.string_ ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  batch_create_bill_scenario_usage_modification_item

val make_batch_create_bill_scenario_usage_modification_error :
  ?error_code:batch_create_bill_scenario_usage_modification_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?key:key ->
  unit ->
  batch_create_bill_scenario_usage_modification_error

val make_batch_create_bill_scenario_usage_modification_response :
  ?errors:batch_create_bill_scenario_usage_modification_errors ->
  ?items:batch_create_bill_scenario_usage_modification_items ->
  unit ->
  batch_create_bill_scenario_usage_modification_response

val make_batch_create_bill_scenario_usage_modification_entry :
  ?historical_usage:historical_usage_entity ->
  ?amounts:usage_amounts ->
  ?group:usage_group ->
  ?availability_zone:availability_zone ->
  usage_account_id:account_id ->
  key:key ->
  operation:operation ->
  usage_type:usage_type ->
  service_code:service_code ->
  unit ->
  batch_create_bill_scenario_usage_modification_entry

val make_batch_create_bill_scenario_usage_modification_request :
  ?client_token:client_token ->
  usage_modifications:batch_create_bill_scenario_usage_modification_entries ->
  bill_scenario_id:resource_id ->
  unit ->
  batch_create_bill_scenario_usage_modification_request

val make_batch_create_bill_scenario_commitment_modification_item :
  ?commitment_action:bill_scenario_commitment_modification_action ->
  ?usage_account_id:account_id ->
  ?group:usage_group ->
  ?id:resource_id ->
  ?key:key ->
  unit ->
  batch_create_bill_scenario_commitment_modification_item

val make_batch_create_bill_scenario_commitment_modification_error :
  ?error_code:batch_create_bill_scenario_commitment_modification_error_code ->
  ?error_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?key:key ->
  unit ->
  batch_create_bill_scenario_commitment_modification_error

val make_batch_create_bill_scenario_commitment_modification_response :
  ?errors:batch_create_bill_scenario_commitment_modification_errors ->
  ?items:batch_create_bill_scenario_commitment_modification_items ->
  unit ->
  batch_create_bill_scenario_commitment_modification_response

val make_batch_create_bill_scenario_commitment_modification_entry :
  ?group:usage_group ->
  commitment_action:bill_scenario_commitment_modification_action ->
  usage_account_id:account_id ->
  key:key ->
  unit ->
  batch_create_bill_scenario_commitment_modification_entry

val make_batch_create_bill_scenario_commitment_modification_request :
  ?client_token:client_token ->
  commitment_modifications:batch_create_bill_scenario_commitment_modification_entries ->
  bill_scenario_id:resource_id ->
  unit ->
  batch_create_bill_scenario_commitment_modification_request
