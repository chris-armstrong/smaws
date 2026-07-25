(** BCM Pricing Calculator client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module UpdateWorkloadEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workload_estimate_request ->
    ( update_workload_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workload_estimate_request ->
    ( update_workload_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates an existing workload estimate. \n"]

module UpdateBillScenario : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_bill_scenario_request ->
    ( update_bill_scenario_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_bill_scenario_request ->
    ( update_bill_scenario_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates an existing bill scenario. \n"]

module UpdateBillEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_bill_estimate_request ->
    ( update_bill_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_bill_estimate_request ->
    ( update_bill_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates an existing bill estimate. \n"]

module ListWorkloadEstimates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `DataUnavailableException of data_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workload_estimates_request ->
    ( list_workload_estimates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workload_estimates_request ->
    ( list_workload_estimates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists all workload estimates for the account. \n"]

module ListWorkloadEstimateUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workload_estimate_usage_request ->
    ( list_workload_estimate_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workload_estimate_usage_request ->
    ( list_workload_estimate_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the usage associated with a workload estimate. \n"]

module ListBillScenarios : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `DataUnavailableException of data_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_scenarios_request ->
    ( list_bill_scenarios_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_scenarios_request ->
    ( list_bill_scenarios_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists all bill scenarios for the account. \n"]

module ListBillScenarioUsageModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_scenario_usage_modifications_request ->
    ( list_bill_scenario_usage_modifications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_scenario_usage_modifications_request ->
    ( list_bill_scenario_usage_modifications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the usage modifications associated with a bill scenario. \n"]

module ListBillScenarioCommitmentModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_scenario_commitment_modifications_request ->
    ( list_bill_scenario_commitment_modifications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_scenario_commitment_modifications_request ->
    ( list_bill_scenario_commitment_modifications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the commitment modifications associated with a bill scenario. \n"]

module ListBillEstimates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `DataUnavailableException of data_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimates_request ->
    ( list_bill_estimates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimates_request ->
    ( list_bill_estimates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists all bill estimates for the account. \n"]

module ListBillEstimateLineItems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_line_items_request ->
    ( list_bill_estimate_line_items_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_line_items_request ->
    ( list_bill_estimate_line_items_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the line items associated with a bill estimate. \n"]

module ListBillEstimateInputUsageModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_input_usage_modifications_request ->
    ( list_bill_estimate_input_usage_modifications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_input_usage_modifications_request ->
    ( list_bill_estimate_input_usage_modifications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the input usage modifications associated with a bill estimate. \n"]

module ListBillEstimateInputCommitmentModifications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_input_commitment_modifications_request ->
    ( list_bill_estimate_input_commitment_modifications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_input_commitment_modifications_request ->
    ( list_bill_estimate_input_commitment_modifications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the input commitment modifications associated with a bill estimate. \n"]

module ListBillEstimateCommitments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_commitments_request ->
    ( list_bill_estimate_commitments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bill_estimate_commitments_request ->
    ( list_bill_estimate_commitments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the commitments associated with a bill estimate. \n"]

module GetWorkloadEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workload_estimate_request ->
    ( get_workload_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workload_estimate_request ->
    ( get_workload_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves details of a specific workload estimate. \n"]

module GetBillScenario : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_bill_scenario_request ->
    ( get_bill_scenario_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_bill_scenario_request ->
    ( get_bill_scenario_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves details of a specific bill scenario. \n"]

module GetBillEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_bill_estimate_request ->
    ( get_bill_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_bill_estimate_request ->
    ( get_bill_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves details of a specific bill estimate. \n"]

module DeleteWorkloadEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `DataUnavailableException of data_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workload_estimate_request ->
    ( delete_workload_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workload_estimate_request ->
    ( delete_workload_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes an existing workload estimate. \n"]

module DeleteBillScenario : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_bill_scenario_request ->
    ( delete_bill_scenario_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_bill_scenario_request ->
    ( delete_bill_scenario_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes an existing bill scenario. \n"]

module DeleteBillEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_bill_estimate_request ->
    ( delete_bill_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_bill_estimate_request ->
    ( delete_bill_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes an existing bill estimate. \n"]

module CreateWorkloadEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workload_estimate_request ->
    ( create_workload_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workload_estimate_request ->
    ( create_workload_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Creates a new workload estimate to model costs for a specific workload. \n"]

module CreateBillScenario : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_bill_scenario_request ->
    ( create_bill_scenario_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_bill_scenario_request ->
    ( create_bill_scenario_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a new bill scenario to model potential changes to Amazon Web Services usage and costs. \n"]

module CreateBillEstimate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_bill_estimate_request ->
    ( create_bill_estimate_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_bill_estimate_request ->
    ( create_bill_estimate_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Create a Bill estimate from a Bill scenario. In the Bill scenario you can model usage \
   addition, usage changes, and usage removal. You can also model commitment addition and \
   commitment removal. After all changes in a Bill scenario is made satisfactorily, you can call \
   this API with a Bill scenario ID to generate the Bill estimate. Bill estimate calculates the \
   pre-tax cost for your consolidated billing family, incorporating all modeled usage and \
   commitments alongside existing usage and commitments from your most recent completed \
   anniversary bill, with any applicable discounts applied. \n"]

module BatchUpdateWorkloadEstimateUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_update_workload_estimate_usage_request ->
    ( batch_update_workload_estimate_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_update_workload_estimate_usage_request ->
    ( batch_update_workload_estimate_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Update a newly added or existing usage lines. You can update the usage amounts and usage group \
   based on a usage ID and a Workload estimate ID. \n\n\
  \  The [BatchUpdateWorkloadEstimateUsage] operation doesn't have its own IAM permission. To \
   authorize this operation for Amazon Web Services principals, include the permission \
   [bcm-pricing-calculator:UpdateWorkloadEstimateUsage] in your policies.\n\
  \  \n\
  \   "]

module BatchUpdateBillScenarioUsageModification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_update_bill_scenario_usage_modification_request ->
    ( batch_update_bill_scenario_usage_modification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_update_bill_scenario_usage_modification_request ->
    ( batch_update_bill_scenario_usage_modification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Update a newly added or existing usage lines. You can update the usage amounts, usage hour, \
   and usage group based on a usage ID and a Bill scenario ID. \n\n\
  \  The [BatchUpdateBillScenarioUsageModification] operation doesn't have its own IAM permission. \
   To authorize this operation for Amazon Web Services principals, include the permission \
   [bcm-pricing-calculator:UpdateBillScenarioUsageModification] in your policies.\n\
  \  \n\
  \   "]

module BatchUpdateBillScenarioCommitmentModification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_update_bill_scenario_commitment_modification_request ->
    ( batch_update_bill_scenario_commitment_modification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_update_bill_scenario_commitment_modification_request ->
    ( batch_update_bill_scenario_commitment_modification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Update a newly added or existing commitment. You can update the commitment group based on a \
   commitment ID and a Bill scenario ID. \n\n\
  \  The [BatchUpdateBillScenarioCommitmentModification] operation doesn't have its own IAM \
   permission. To authorize this operation for Amazon Web Services principals, include the \
   permission [bcm-pricing-calculator:UpdateBillScenarioCommitmentModification] in your policies.\n\
  \  \n\
  \   "]

module BatchDeleteWorkloadEstimateUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_workload_estimate_usage_request ->
    ( batch_delete_workload_estimate_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_workload_estimate_usage_request ->
    ( batch_delete_workload_estimate_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Delete usage that you have created in a Workload estimate. You can only delete usage that you \
   had added and cannot model deletion (or removal) of a existing usage. If you want model removal \
   of an existing usage, see \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BatchUpdateWorkloadEstimateUsage.html} \
   BatchUpdateWorkloadEstimateUsage}. \n\n\
  \  The [BatchDeleteWorkloadEstimateUsage] operation doesn't have its own IAM permission. To \
   authorize this operation for Amazon Web Services principals, include the permission \
   [bcm-pricing-calculator:DeleteWorkloadEstimateUsage] in your policies.\n\
  \  \n\
  \   "]

module BatchDeleteBillScenarioUsageModification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_bill_scenario_usage_modification_request ->
    ( batch_delete_bill_scenario_usage_modification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_bill_scenario_usage_modification_request ->
    ( batch_delete_bill_scenario_usage_modification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Delete usage that you have created in a Bill Scenario. You can only delete usage that you had \
   added and cannot model deletion (or removal) of a existing usage. If you want model removal of \
   an existing usage, see \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BatchUpdateBillScenarioUsageModification.html} \
   BatchUpdateBillScenarioUsageModification}. \n\n\
  \  The [BatchDeleteBillScenarioUsageModification] operation doesn't have its own IAM permission. \
   To authorize this operation for Amazon Web Services principals, include the permission \
   [bcm-pricing-calculator:DeleteBillScenarioUsageModification] in your policies.\n\
  \  \n\
  \   "]

module BatchDeleteBillScenarioCommitmentModification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_bill_scenario_commitment_modification_request ->
    ( batch_delete_bill_scenario_commitment_modification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_bill_scenario_commitment_modification_request ->
    ( batch_delete_bill_scenario_commitment_modification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Delete commitment that you have created in a Bill Scenario. You can only delete a commitment \
   that you had added and cannot model deletion (or removal) of a existing commitment. If you want \
   model deletion of an existing commitment, see the negate \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BillScenarioCommitmentModificationAction.html} \
   BillScenarioCommitmentModificationAction} of \
   {{:https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_AWSBCMPricingCalculator_BatchCreateBillScenarioUsageModification.html} \
   BatchCreateBillScenarioCommitmentModification} operation. \n\n\
  \  The [BatchDeleteBillScenarioCommitmentModification] operation doesn't have its own IAM \
   permission. To authorize this operation for Amazon Web Services principals, include the \
   permission [bcm-pricing-calculator:DeleteBillScenarioCommitmentModification] in your policies.\n\
  \  \n\
  \   "]

module BatchCreateWorkloadEstimateUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_workload_estimate_usage_request ->
    ( batch_create_workload_estimate_usage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_workload_estimate_usage_request ->
    ( batch_create_workload_estimate_usage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Create Amazon Web Services service usage that you want to model in a Workload Estimate. \n\n\
  \  The [BatchCreateWorkloadEstimateUsage] operation doesn't have its own IAM permission. To \
   authorize this operation for Amazon Web Services principals, include the permission \
   [bcm-pricing-calculator:CreateWorkloadEstimateUsage] in your policies.\n\
  \  \n\
  \   "]

module BatchCreateBillScenarioUsageModification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_bill_scenario_usage_modification_request ->
    ( batch_create_bill_scenario_usage_modification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_bill_scenario_usage_modification_request ->
    ( batch_create_bill_scenario_usage_modification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Create Amazon Web Services service usage that you want to model in a Bill Scenario. \n\n\
  \  The [BatchCreateBillScenarioUsageModification] operation doesn't have its own IAM permission. \
   To authorize this operation for Amazon Web Services principals, include the permission \
   [bcm-pricing-calculator:CreateBillScenarioUsageModification] in your policies.\n\
  \  \n\
  \   "]

module BatchCreateBillScenarioCommitmentModification : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DataUnavailableException of data_unavailable_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_bill_scenario_commitment_modification_request ->
    ( batch_create_bill_scenario_commitment_modification_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_bill_scenario_commitment_modification_request ->
    ( batch_create_bill_scenario_commitment_modification_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DataUnavailableException of data_unavailable_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Create Compute Savings Plans, EC2 Instance Savings Plans, or EC2 Reserved Instances \
   commitments that you want to model in a Bill Scenario. \n\n\
  \  The [BatchCreateBillScenarioCommitmentModification] operation doesn't have its own IAM \
   permission. To authorize this operation for Amazon Web Services principals, include the \
   permission [bcm-pricing-calculator:CreateBillScenarioCommitmentModification] in your policies.\n\
  \  \n\
  \   "]

module GetPreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `DataUnavailableException of data_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_preferences_request ->
    ( get_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_preferences_request ->
    ( get_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves the current preferences for Pricing Calculator. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists all tags associated with a specified resource. \n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Adds one or more tags to a specified resource. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Removes one or more tags from a specified resource. \n"]

(** {1:Serialization and Deserialization} *)
module UpdatePreferences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DataUnavailableException of data_unavailable_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_preferences_request ->
    ( update_preferences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_preferences_request ->
    ( update_preferences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DataUnavailableException of data_unavailable_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates the preferences for Pricing Calculator. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
