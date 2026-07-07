open Types

let make_workload_estimate_usage_quantity
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?unit_:(unit__ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ amount = amount_; unit_ = unit__ } : workload_estimate_usage_quantity)

let make_bill_interval ?end_:(end__ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?start:(start_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ end_ = end__; start = start_ } : bill_interval)

let make_expression_filter ?values:(values_ : string_list option)
    ?match_options:(match_options_ : string_list option)
    ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ values = values_; match_options = match_options_; key = key_ } : expression_filter)

let make_expression ?tags:(tags_ : expression_filter option)
    ?dimensions:(dimensions_ : expression_filter option)
    ?cost_categories:(cost_categories_ : expression_filter option) ?not:(not_ : expression option)
    ?\#or:(or_ : expression_list option) ?and_:(and__ : expression_list option) () =
  ({
     tags = tags_;
     dimensions = dimensions_;
     cost_categories = cost_categories_;
     not = not_;
     \#or = or_;
     and_ = and__;
   }
    : expression)

let make_historical_usage_entity ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~filter_expression:(filter_expression_ : expression)
    ~bill_interval:(bill_interval_ : bill_interval)
    ~usage_account_id:(usage_account_id_ : account_id) ~operation:(operation_ : operation)
    ~usage_type:(usage_type_ : usage_type) ~service_code:(service_code_ : service_code) () =
  ({
     filter_expression = filter_expression_;
     bill_interval = bill_interval_;
     usage_account_id = usage_account_id_;
     location = location_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : historical_usage_entity)

let make_workload_estimate_usage_item
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ?status:(status_ : workload_estimate_cost_status option)
    ?currency:(currency_ : currency_code option)
    ?cost:(cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?quantity:(quantity_ : workload_estimate_usage_quantity option)
    ?group:(group_ : usage_group option) ?usage_account_id:(usage_account_id_ : account_id option)
    ?id:(id_ : resource_id option) ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     historical_usage = historical_usage_;
     status = status_;
     currency = currency_;
     cost = cost_;
     quantity = quantity_;
     group = group_;
     usage_account_id = usage_account_id_;
     id = id_;
     location = location_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : workload_estimate_usage_item)

let make_workload_estimate_summary
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?status:(status_ : workload_estimate_status option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?name:(name_ : workload_estimate_name option) ~id:(id_ : resource_id) () =
  ({
     failure_message = failure_message_;
     cost_currency = cost_currency_;
     total_cost = total_cost_;
     status = status_;
     rate_timestamp = rate_timestamp_;
     rate_type = rate_type_;
     expires_at = expires_at_;
     created_at = created_at_;
     name = name_;
     id = id_;
   }
    : workload_estimate_summary)

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_usage_quantity ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?unit_:(unit__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?start_hour:(start_hour_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ amount = amount_; unit_ = unit__; start_hour = start_hour_ } : usage_quantity)

let make_usage_amount ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.double)
    ~start_hour:(start_hour_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({ amount = amount_; start_hour = start_hour_ } : usage_amount)

let make_update_workload_estimate_response
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?status:(status_ : workload_estimate_status option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?name:(name_ : workload_estimate_name option) ~id:(id_ : resource_id) () =
  ({
     failure_message = failure_message_;
     cost_currency = cost_currency_;
     total_cost = total_cost_;
     status = status_;
     rate_timestamp = rate_timestamp_;
     rate_type = rate_type_;
     expires_at = expires_at_;
     created_at = created_at_;
     name = name_;
     id = id_;
   }
    : update_workload_estimate_response)

let make_update_workload_estimate_request
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?name:(name_ : workload_estimate_name option) ~identifier:(identifier_ : resource_id) () =
  ({ expires_at = expires_at_; name = name_; identifier = identifier_ }
    : update_workload_estimate_request)

let make_update_preferences_response
    ?standalone_account_rate_type_selections:
      (standalone_account_rate_type_selections_ : rate_types option)
    ?member_account_rate_type_selections:(member_account_rate_type_selections_ : rate_types option)
    ?management_account_rate_type_selections:
      (management_account_rate_type_selections_ : rate_types option) () =
  ({
     standalone_account_rate_type_selections = standalone_account_rate_type_selections_;
     member_account_rate_type_selections = member_account_rate_type_selections_;
     management_account_rate_type_selections = management_account_rate_type_selections_;
   }
    : update_preferences_response)

let make_update_preferences_request
    ?standalone_account_rate_type_selections:
      (standalone_account_rate_type_selections_ : rate_types option)
    ?member_account_rate_type_selections:(member_account_rate_type_selections_ : rate_types option)
    ?management_account_rate_type_selections:
      (management_account_rate_type_selections_ : rate_types option) () =
  ({
     standalone_account_rate_type_selections = standalone_account_rate_type_selections_;
     member_account_rate_type_selections = member_account_rate_type_selections_;
     management_account_rate_type_selections = management_account_rate_type_selections_;
   }
    : update_preferences_request)

let make_update_bill_scenario_response
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : bill_scenario_status option)
    ?bill_interval:(bill_interval_ : bill_interval option) ?name:(name_ : bill_scenario_name option)
    ~id:(id_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     failure_message = failure_message_;
     expires_at = expires_at_;
     created_at = created_at_;
     status = status_;
     bill_interval = bill_interval_;
     name = name_;
     id = id_;
   }
    : update_bill_scenario_response)

let make_update_bill_scenario_request
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?name:(name_ : bill_scenario_name option) ~identifier:(identifier_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     expires_at = expires_at_;
     name = name_;
     identifier = identifier_;
   }
    : update_bill_scenario_request)

let make_cost_amount ?currency:(currency_ : currency_code option)
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ currency = currency_; amount = amount_ } : cost_amount)

let make_cost_difference ?estimated_cost:(estimated_cost_ : cost_amount option)
    ?historical_cost:(historical_cost_ : cost_amount option) () =
  ({ estimated_cost = estimated_cost_; historical_cost = historical_cost_ } : cost_difference)

let make_bill_estimate_cost_summary
    ?service_cost_differences:(service_cost_differences_ : service_cost_difference_map option)
    ?total_cost_difference:(total_cost_difference_ : cost_difference option) () =
  ({
     service_cost_differences = service_cost_differences_;
     total_cost_difference = total_cost_difference_;
   }
    : bill_estimate_cost_summary)

let make_update_bill_estimate_response
    ?cost_category_group_sharing_preference_effective_date:
      (cost_category_group_sharing_preference_effective_date_ :
         Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cost_summary:(cost_summary_ : bill_estimate_cost_summary option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : bill_estimate_status option) ?name:(name_ : bill_estimate_name option)
    ~id:(id_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_effective_date =
       cost_category_group_sharing_preference_effective_date_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     expires_at = expires_at_;
     created_at = created_at_;
     cost_summary = cost_summary_;
     bill_interval = bill_interval_;
     failure_message = failure_message_;
     status = status_;
     name = name_;
     id = id_;
   }
    : update_bill_estimate_response)

let make_update_bill_estimate_request
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?name:(name_ : bill_estimate_name option) ~identifier:(identifier_ : resource_id) () =
  ({ expires_at = expires_at_; name = name_; identifier = identifier_ }
    : update_bill_estimate_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : resource_tag_keys) ~arn:(arn_ : arn) () =
  ({ tag_keys = tag_keys_; arn = arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~arn:(arn_ : arn) () =
  ({ tags = tags_; arn = arn_ } : tag_resource_request)

let make_negate_savings_plan_action ?savings_plan_id:(savings_plan_id_ : uuid option) () =
  ({ savings_plan_id = savings_plan_id_ } : negate_savings_plan_action)

let make_negate_reserved_instance_action
    ?reserved_instances_id:(reserved_instances_id_ : uuid option) () =
  ({ reserved_instances_id = reserved_instances_id_ } : negate_reserved_instance_action)

let make_list_workload_estimates_response ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : workload_estimate_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_workload_estimates_response)

let make_filter_timestamp
    ?before_timestamp:(before_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?after_timestamp:(after_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({ before_timestamp = before_timestamp_; after_timestamp = after_timestamp_ } : filter_timestamp)

let make_list_workload_estimates_filter ?match_option:(match_option_ : match_option option)
    ~values:(values_ : list_workload_estimates_filter_values)
    ~name:(name_ : list_workload_estimates_filter_name) () =
  ({ match_option = match_option_; values = values_; name = name_ }
    : list_workload_estimates_filter)

let make_list_workload_estimates_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?filters:(filters_ : list_workload_estimates_filters option)
    ?expires_at_filter:(expires_at_filter_ : filter_timestamp option)
    ?created_at_filter:(created_at_filter_ : filter_timestamp option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     expires_at_filter = expires_at_filter_;
     created_at_filter = created_at_filter_;
   }
    : list_workload_estimates_request)

let make_list_workload_estimate_usage_response ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : workload_estimate_usage_items option) () =
  ({ next_token = next_token_; items = items_ } : list_workload_estimate_usage_response)

let make_list_usage_filter ?match_option:(match_option_ : match_option option)
    ~values:(values_ : list_usage_filter_values) ~name:(name_ : list_usage_filter_name) () =
  ({ match_option = match_option_; values = values_; name = name_ } : list_usage_filter)

let make_list_workload_estimate_usage_request
    ?max_results:(max_results_ : workload_estimate_usage_max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?filters:(filters_ : list_usage_filters option)
    ~workload_estimate_id:(workload_estimate_id_ : resource_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     workload_estimate_id = workload_estimate_id_;
   }
    : list_workload_estimate_usage_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~arn:(arn_ : arn) () =
  ({ arn = arn_ } : list_tags_for_resource_request)

let make_bill_scenario_summary
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : bill_scenario_status option)
    ?bill_interval:(bill_interval_ : bill_interval option) ?name:(name_ : bill_scenario_name option)
    ~id:(id_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     failure_message = failure_message_;
     expires_at = expires_at_;
     created_at = created_at_;
     status = status_;
     bill_interval = bill_interval_;
     name = name_;
     id = id_;
   }
    : bill_scenario_summary)

let make_list_bill_scenarios_response ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_scenario_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_bill_scenarios_response)

let make_list_bill_scenarios_filter ?match_option:(match_option_ : match_option option)
    ~values:(values_ : list_bill_scenarios_filter_values)
    ~name:(name_ : list_bill_scenarios_filter_name) () =
  ({ match_option = match_option_; values = values_; name = name_ } : list_bill_scenarios_filter)

let make_list_bill_scenarios_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?expires_at_filter:(expires_at_filter_ : filter_timestamp option)
    ?created_at_filter:(created_at_filter_ : filter_timestamp option)
    ?filters:(filters_ : list_bill_scenarios_filters option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     expires_at_filter = expires_at_filter_;
     created_at_filter = created_at_filter_;
     filters = filters_;
   }
    : list_bill_scenarios_request)

let make_bill_scenario_usage_modification_item
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ?quantities:(quantities_ : usage_quantities option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?id:(id_ : resource_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     historical_usage = historical_usage_;
     quantities = quantities_;
     usage_account_id = usage_account_id_;
     group = group_;
     id = id_;
     availability_zone = availability_zone_;
     location = location_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : bill_scenario_usage_modification_item)

let make_list_bill_scenario_usage_modifications_response
    ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_scenario_usage_modification_items option) () =
  ({ next_token = next_token_; items = items_ } : list_bill_scenario_usage_modifications_response)

let make_list_bill_scenario_usage_modifications_request
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?filters:(filters_ : list_usage_filters option)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     bill_scenario_id = bill_scenario_id_;
   }
    : list_bill_scenario_usage_modifications_request)

let make_add_reserved_instance_action
    ?instance_count:(instance_count_ : reserved_instance_instance_count option)
    ?reserved_instances_offering_id:(reserved_instances_offering_id_ : uuid option) () =
  ({
     instance_count = instance_count_;
     reserved_instances_offering_id = reserved_instances_offering_id_;
   }
    : add_reserved_instance_action)

let make_add_savings_plan_action ?commitment:(commitment_ : savings_plan_commitment option)
    ?savings_plan_offering_id:(savings_plan_offering_id_ : uuid option) () =
  ({ commitment = commitment_; savings_plan_offering_id = savings_plan_offering_id_ }
    : add_savings_plan_action)

let make_bill_scenario_commitment_modification_item
    ?commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action option)
    ?group:(group_ : usage_group option) ?usage_account_id:(usage_account_id_ : account_id option)
    ?id:(id_ : resource_id option) () =
  ({
     commitment_action = commitment_action_;
     group = group_;
     usage_account_id = usage_account_id_;
     id = id_;
   }
    : bill_scenario_commitment_modification_item)

let make_list_bill_scenario_commitment_modifications_response
    ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_scenario_commitment_modification_items option) () =
  ({ next_token = next_token_; items = items_ }
    : list_bill_scenario_commitment_modifications_response)

let make_list_bill_scenario_commitment_modifications_request
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({ max_results = max_results_; next_token = next_token_; bill_scenario_id = bill_scenario_id_ }
    : list_bill_scenario_commitment_modifications_request)

let make_bill_estimate_summary
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?status:(status_ : bill_estimate_status option) ?name:(name_ : bill_estimate_name option)
    ~id:(id_ : resource_id) () =
  ({
     expires_at = expires_at_;
     created_at = created_at_;
     bill_interval = bill_interval_;
     status = status_;
     name = name_;
     id = id_;
   }
    : bill_estimate_summary)

let make_list_bill_estimates_response ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_estimate_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_bill_estimates_response)

let make_list_bill_estimates_filter ?match_option:(match_option_ : match_option option)
    ~values:(values_ : list_bill_estimates_filter_values)
    ~name:(name_ : list_bill_estimates_filter_name) () =
  ({ match_option = match_option_; values = values_; name = name_ } : list_bill_estimates_filter)

let make_list_bill_estimates_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?expires_at_filter:(expires_at_filter_ : filter_timestamp option)
    ?created_at_filter:(created_at_filter_ : filter_timestamp option)
    ?filters:(filters_ : list_bill_estimates_filters option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     expires_at_filter = expires_at_filter_;
     created_at_filter = created_at_filter_;
     filters = filters_;
   }
    : list_bill_estimates_request)

let make_bill_estimate_line_item_summary
    ?savings_plan_arns:(savings_plan_arns_ : savings_plan_arns option)
    ?historical_cost:(historical_cost_ : cost_amount option)
    ?historical_usage_quantity:(historical_usage_quantity_ : usage_quantity_result option)
    ?estimated_cost:(estimated_cost_ : cost_amount option)
    ?estimated_usage_quantity:(estimated_usage_quantity_ : usage_quantity_result option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?payer_account_id:(payer_account_id_ : account_id option)
    ?line_item_type:(line_item_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?line_item_id:(line_item_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : resource_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     savings_plan_arns = savings_plan_arns_;
     historical_cost = historical_cost_;
     historical_usage_quantity = historical_usage_quantity_;
     estimated_cost = estimated_cost_;
     estimated_usage_quantity = estimated_usage_quantity_;
     usage_account_id = usage_account_id_;
     payer_account_id = payer_account_id_;
     line_item_type = line_item_type_;
     line_item_id = line_item_id_;
     id = id_;
     availability_zone = availability_zone_;
     location = location_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : bill_estimate_line_item_summary)

let make_list_bill_estimate_line_items_response ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_estimate_line_item_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_bill_estimate_line_items_response)

let make_list_bill_estimate_line_items_filter ?match_option:(match_option_ : match_option option)
    ~values:(values_ : list_bill_estimate_line_items_filter_values)
    ~name:(name_ : list_bill_estimate_line_items_filter_name) () =
  ({ match_option = match_option_; values = values_; name = name_ }
    : list_bill_estimate_line_items_filter)

let make_list_bill_estimate_line_items_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?filters:(filters_ : list_bill_estimate_line_items_filters option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     bill_estimate_id = bill_estimate_id_;
   }
    : list_bill_estimate_line_items_request)

let make_bill_estimate_input_usage_modification_summary
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ?quantities:(quantities_ : usage_quantities option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?id:(id_ : resource_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     historical_usage = historical_usage_;
     quantities = quantities_;
     usage_account_id = usage_account_id_;
     group = group_;
     id = id_;
     availability_zone = availability_zone_;
     location = location_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : bill_estimate_input_usage_modification_summary)

let make_list_bill_estimate_input_usage_modifications_response
    ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_estimate_input_usage_modification_summaries option) () =
  ({ next_token = next_token_; items = items_ }
    : list_bill_estimate_input_usage_modifications_response)

let make_list_bill_estimate_input_usage_modifications_request
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?filters:(filters_ : list_usage_filters option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     bill_estimate_id = bill_estimate_id_;
   }
    : list_bill_estimate_input_usage_modifications_request)

let make_bill_estimate_input_commitment_modification_summary
    ?commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?id:(id_ : resource_id option) () =
  ({
     commitment_action = commitment_action_;
     usage_account_id = usage_account_id_;
     group = group_;
     id = id_;
   }
    : bill_estimate_input_commitment_modification_summary)

let make_list_bill_estimate_input_commitment_modifications_response
    ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_estimate_input_commitment_modification_summaries option) () =
  ({ next_token = next_token_; items = items_ }
    : list_bill_estimate_input_commitment_modifications_response)

let make_list_bill_estimate_input_commitment_modifications_request
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({ max_results = max_results_; next_token = next_token_; bill_estimate_id = bill_estimate_id_ }
    : list_bill_estimate_input_commitment_modifications_request)

let make_bill_estimate_commitment_summary ?monthly_payment:(monthly_payment_ : cost_amount option)
    ?upfront_payment:(upfront_payment_ : cost_amount option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term_length:(term_length_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_account_id:(usage_account_id_ : account_id option)
    ?offering_id:(offering_id_ : uuid option)
    ?purchase_agreement_type:(purchase_agreement_type_ : purchase_agreement_type option)
    ?id:(id_ : resource_id option) () =
  ({
     monthly_payment = monthly_payment_;
     upfront_payment = upfront_payment_;
     payment_option = payment_option_;
     term_length = term_length_;
     region = region_;
     usage_account_id = usage_account_id_;
     offering_id = offering_id_;
     purchase_agreement_type = purchase_agreement_type_;
     id = id_;
   }
    : bill_estimate_commitment_summary)

let make_list_bill_estimate_commitments_response ?next_token:(next_token_ : next_page_token option)
    ?items:(items_ : bill_estimate_commitment_summaries option) () =
  ({ next_token = next_token_; items = items_ } : list_bill_estimate_commitments_response)

let make_list_bill_estimate_commitments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ~bill_estimate_id:(bill_estimate_id_ : resource_id) () =
  ({ max_results = max_results_; next_token = next_token_; bill_estimate_id = bill_estimate_id_ }
    : list_bill_estimate_commitments_request)

let make_get_workload_estimate_response
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?status:(status_ : workload_estimate_status option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?name:(name_ : workload_estimate_name option) ~id:(id_ : resource_id) () =
  ({
     failure_message = failure_message_;
     cost_currency = cost_currency_;
     total_cost = total_cost_;
     status = status_;
     rate_timestamp = rate_timestamp_;
     rate_type = rate_type_;
     expires_at = expires_at_;
     created_at = created_at_;
     name = name_;
     id = id_;
   }
    : get_workload_estimate_response)

let make_get_workload_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : get_workload_estimate_request)

let make_get_preferences_response
    ?standalone_account_rate_type_selections:
      (standalone_account_rate_type_selections_ : rate_types option)
    ?member_account_rate_type_selections:(member_account_rate_type_selections_ : rate_types option)
    ?management_account_rate_type_selections:
      (management_account_rate_type_selections_ : rate_types option) () =
  ({
     standalone_account_rate_type_selections = standalone_account_rate_type_selections_;
     member_account_rate_type_selections = member_account_rate_type_selections_;
     management_account_rate_type_selections = management_account_rate_type_selections_;
   }
    : get_preferences_response)

let make_get_preferences_request () = (() : unit)

let make_get_bill_scenario_response
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : bill_scenario_status option)
    ?bill_interval:(bill_interval_ : bill_interval option) ?name:(name_ : bill_scenario_name option)
    ~id:(id_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     failure_message = failure_message_;
     expires_at = expires_at_;
     created_at = created_at_;
     status = status_;
     bill_interval = bill_interval_;
     name = name_;
     id = id_;
   }
    : get_bill_scenario_response)

let make_get_bill_scenario_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : get_bill_scenario_request)

let make_get_bill_estimate_response
    ?cost_category_group_sharing_preference_effective_date:
      (cost_category_group_sharing_preference_effective_date_ :
         Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cost_summary:(cost_summary_ : bill_estimate_cost_summary option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : bill_estimate_status option) ?name:(name_ : bill_estimate_name option)
    ~id:(id_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_effective_date =
       cost_category_group_sharing_preference_effective_date_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     expires_at = expires_at_;
     created_at = created_at_;
     cost_summary = cost_summary_;
     bill_interval = bill_interval_;
     failure_message = failure_message_;
     status = status_;
     name = name_;
     id = id_;
   }
    : get_bill_estimate_response)

let make_get_bill_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : get_bill_estimate_request)

let make_delete_workload_estimate_response () = (() : unit)

let make_delete_workload_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : delete_workload_estimate_request)

let make_delete_bill_scenario_response () = (() : unit)

let make_delete_bill_scenario_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : delete_bill_scenario_request)

let make_delete_bill_estimate_response () = (() : unit)

let make_delete_bill_estimate_request ~identifier:(identifier_ : resource_id) () =
  ({ identifier = identifier_ } : delete_bill_estimate_request)

let make_create_workload_estimate_response
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?cost_currency:(cost_currency_ : currency_code option)
    ?total_cost:(total_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?status:(status_ : workload_estimate_status option)
    ?rate_timestamp:(rate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?name:(name_ : workload_estimate_name option) ~id:(id_ : resource_id) () =
  ({
     failure_message = failure_message_;
     cost_currency = cost_currency_;
     total_cost = total_cost_;
     status = status_;
     rate_timestamp = rate_timestamp_;
     rate_type = rate_type_;
     expires_at = expires_at_;
     created_at = created_at_;
     name = name_;
     id = id_;
   }
    : create_workload_estimate_response)

let make_create_workload_estimate_request ?tags:(tags_ : tags option)
    ?rate_type:(rate_type_ : workload_estimate_rate_type option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : workload_estimate_name) () =
  ({ tags = tags_; rate_type = rate_type_; client_token = client_token_; name = name_ }
    : create_workload_estimate_request)

let make_create_bill_scenario_response
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : bill_scenario_status option)
    ?bill_interval:(bill_interval_ : bill_interval option) ?name:(name_ : bill_scenario_name option)
    ~id:(id_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     failure_message = failure_message_;
     expires_at = expires_at_;
     created_at = created_at_;
     status = status_;
     bill_interval = bill_interval_;
     name = name_;
     id = id_;
   }
    : create_bill_scenario_response)

let make_create_bill_scenario_request
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?tags:(tags_ : tags option) ?client_token:(client_token_ : client_token option)
    ~name:(name_ : bill_scenario_name) () =
  ({
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     tags = tags_;
     client_token = client_token_;
     name = name_;
   }
    : create_bill_scenario_request)

let make_create_bill_estimate_response
    ?cost_category_group_sharing_preference_effective_date:
      (cost_category_group_sharing_preference_effective_date_ :
         Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cost_category_group_sharing_preference_arn:
      (cost_category_group_sharing_preference_arn_ : cost_category_arn option)
    ?group_sharing_preference:(group_sharing_preference_ : group_sharing_preference_enum option)
    ?expires_at:(expires_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_at:(created_at_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?cost_summary:(cost_summary_ : bill_estimate_cost_summary option)
    ?bill_interval:(bill_interval_ : bill_interval option)
    ?failure_message:(failure_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?status:(status_ : bill_estimate_status option) ?name:(name_ : bill_estimate_name option)
    ~id:(id_ : resource_id) () =
  ({
     cost_category_group_sharing_preference_effective_date =
       cost_category_group_sharing_preference_effective_date_;
     cost_category_group_sharing_preference_arn = cost_category_group_sharing_preference_arn_;
     group_sharing_preference = group_sharing_preference_;
     expires_at = expires_at_;
     created_at = created_at_;
     cost_summary = cost_summary_;
     bill_interval = bill_interval_;
     failure_message = failure_message_;
     status = status_;
     name = name_;
     id = id_;
   }
    : create_bill_estimate_response)

let make_create_bill_estimate_request ?tags:(tags_ : tags option)
    ?client_token:(client_token_ : client_token option) ~name:(name_ : bill_estimate_name)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({
     tags = tags_;
     client_token = client_token_;
     name = name_;
     bill_scenario_id = bill_scenario_id_;
   }
    : create_bill_estimate_request)

let make_batch_update_workload_estimate_usage_error
    ?error_code:(error_code_ : workload_estimate_update_usage_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : resource_id option) () =
  ({ error_code = error_code_; error_message = error_message_; id = id_ }
    : batch_update_workload_estimate_usage_error)

let make_batch_update_workload_estimate_usage_response
    ?errors:(errors_ : batch_update_workload_estimate_usage_errors option)
    ?items:(items_ : workload_estimate_usage_items option) () =
  ({ errors = errors_; items = items_ } : batch_update_workload_estimate_usage_response)

let make_batch_update_workload_estimate_usage_entry
    ?amount:(amount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?group:(group_ : usage_group option) ~id:(id_ : resource_id) () =
  ({ amount = amount_; group = group_; id = id_ } : batch_update_workload_estimate_usage_entry)

let make_batch_update_workload_estimate_usage_request
    ~usage:(usage_ : batch_update_workload_estimate_usage_entries)
    ~workload_estimate_id:(workload_estimate_id_ : resource_id) () =
  ({ usage = usage_; workload_estimate_id = workload_estimate_id_ }
    : batch_update_workload_estimate_usage_request)

let make_batch_update_bill_scenario_usage_modification_error
    ?error_code:(error_code_ : batch_update_bill_scenario_usage_modification_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : resource_id option) () =
  ({ error_code = error_code_; error_message = error_message_; id = id_ }
    : batch_update_bill_scenario_usage_modification_error)

let make_batch_update_bill_scenario_usage_modification_response
    ?errors:(errors_ : batch_update_bill_scenario_usage_modification_errors option)
    ?items:(items_ : bill_scenario_usage_modification_items option) () =
  ({ errors = errors_; items = items_ } : batch_update_bill_scenario_usage_modification_response)

let make_batch_update_bill_scenario_usage_modification_entry
    ?amounts:(amounts_ : usage_amounts option) ?group:(group_ : usage_group option)
    ~id:(id_ : resource_id) () =
  ({ amounts = amounts_; group = group_; id = id_ }
    : batch_update_bill_scenario_usage_modification_entry)

let make_batch_update_bill_scenario_usage_modification_request
    ~usage_modifications:
      (usage_modifications_ : batch_update_bill_scenario_usage_modification_entries)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({ usage_modifications = usage_modifications_; bill_scenario_id = bill_scenario_id_ }
    : batch_update_bill_scenario_usage_modification_request)

let make_batch_update_bill_scenario_commitment_modification_error
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : batch_update_bill_scenario_commitment_modification_error_code option)
    ?id:(id_ : resource_id option) () =
  ({ error_message = error_message_; error_code = error_code_; id = id_ }
    : batch_update_bill_scenario_commitment_modification_error)

let make_batch_update_bill_scenario_commitment_modification_response
    ?errors:(errors_ : batch_update_bill_scenario_commitment_modification_errors option)
    ?items:(items_ : bill_scenario_commitment_modification_items option) () =
  ({ errors = errors_; items = items_ }
    : batch_update_bill_scenario_commitment_modification_response)

let make_batch_update_bill_scenario_commitment_modification_entry
    ?group:(group_ : usage_group option) ~id:(id_ : resource_id) () =
  ({ group = group_; id = id_ } : batch_update_bill_scenario_commitment_modification_entry)

let make_batch_update_bill_scenario_commitment_modification_request
    ~commitment_modifications:
      (commitment_modifications_ : batch_update_bill_scenario_commitment_modification_entries)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({ commitment_modifications = commitment_modifications_; bill_scenario_id = bill_scenario_id_ }
    : batch_update_bill_scenario_commitment_modification_request)

let make_batch_delete_workload_estimate_usage_error
    ?error_code:(error_code_ : workload_estimate_update_usage_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : resource_id option) () =
  ({ error_code = error_code_; error_message = error_message_; id = id_ }
    : batch_delete_workload_estimate_usage_error)

let make_batch_delete_workload_estimate_usage_response
    ?errors:(errors_ : batch_delete_workload_estimate_usage_errors option) () =
  ({ errors = errors_ } : batch_delete_workload_estimate_usage_response)

let make_batch_delete_workload_estimate_usage_request
    ~ids:(ids_ : batch_delete_workload_estimate_usage_entries)
    ~workload_estimate_id:(workload_estimate_id_ : resource_id) () =
  ({ ids = ids_; workload_estimate_id = workload_estimate_id_ }
    : batch_delete_workload_estimate_usage_request)

let make_batch_delete_bill_scenario_usage_modification_error
    ?error_code:(error_code_ : batch_delete_bill_scenario_usage_modification_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?id:(id_ : resource_id option) () =
  ({ error_code = error_code_; error_message = error_message_; id = id_ }
    : batch_delete_bill_scenario_usage_modification_error)

let make_batch_delete_bill_scenario_usage_modification_response
    ?errors:(errors_ : batch_delete_bill_scenario_usage_modification_errors option) () =
  ({ errors = errors_ } : batch_delete_bill_scenario_usage_modification_response)

let make_batch_delete_bill_scenario_usage_modification_request
    ~ids:(ids_ : batch_delete_bill_scenario_usage_modification_entries)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({ ids = ids_; bill_scenario_id = bill_scenario_id_ }
    : batch_delete_bill_scenario_usage_modification_request)

let make_batch_delete_bill_scenario_commitment_modification_error
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : batch_delete_bill_scenario_commitment_modification_error_code option)
    ?id:(id_ : resource_id option) () =
  ({ error_message = error_message_; error_code = error_code_; id = id_ }
    : batch_delete_bill_scenario_commitment_modification_error)

let make_batch_delete_bill_scenario_commitment_modification_response
    ?errors:(errors_ : batch_delete_bill_scenario_commitment_modification_errors option) () =
  ({ errors = errors_ } : batch_delete_bill_scenario_commitment_modification_response)

let make_batch_delete_bill_scenario_commitment_modification_request
    ~ids:(ids_ : batch_delete_bill_scenario_commitment_modification_entries)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({ ids = ids_; bill_scenario_id = bill_scenario_id_ }
    : batch_delete_bill_scenario_commitment_modification_request)

let make_batch_create_workload_estimate_usage_item ?key:(key_ : key option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ?status:(status_ : workload_estimate_cost_status option)
    ?currency:(currency_ : currency_code option)
    ?cost:(cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?quantity:(quantity_ : workload_estimate_usage_quantity option)
    ?group:(group_ : usage_group option) ?usage_account_id:(usage_account_id_ : account_id option)
    ?id:(id_ : resource_id option) ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     key = key_;
     historical_usage = historical_usage_;
     status = status_;
     currency = currency_;
     cost = cost_;
     quantity = quantity_;
     group = group_;
     usage_account_id = usage_account_id_;
     id = id_;
     location = location_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : batch_create_workload_estimate_usage_item)

let make_batch_create_workload_estimate_usage_error
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?error_code:(error_code_ : batch_create_workload_estimate_usage_code option)
    ?key:(key_ : key option) () =
  ({ error_message = error_message_; error_code = error_code_; key = key_ }
    : batch_create_workload_estimate_usage_error)

let make_batch_create_workload_estimate_usage_response
    ?errors:(errors_ : batch_create_workload_estimate_usage_errors option)
    ?items:(items_ : batch_create_workload_estimate_usage_items option) () =
  ({ errors = errors_; items = items_ } : batch_create_workload_estimate_usage_response)

let make_batch_create_workload_estimate_usage_entry
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ?group:(group_ : usage_group option) ~amount:(amount_ : Smaws_Lib.Smithy_api.Types.double)
    ~usage_account_id:(usage_account_id_ : account_id) ~key:(key_ : key)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     historical_usage = historical_usage_;
     amount = amount_;
     usage_account_id = usage_account_id_;
     group = group_;
     key = key_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : batch_create_workload_estimate_usage_entry)

let make_batch_create_workload_estimate_usage_request
    ?client_token:(client_token_ : client_token option)
    ~usage:(usage_ : batch_create_workload_estimate_usage_entries)
    ~workload_estimate_id:(workload_estimate_id_ : resource_id) () =
  ({ client_token = client_token_; usage = usage_; workload_estimate_id = workload_estimate_id_ }
    : batch_create_workload_estimate_usage_request)

let make_batch_create_bill_scenario_usage_modification_item ?key:(key_ : key option)
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ?quantities:(quantities_ : usage_quantities option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?id:(id_ : resource_id option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?location:(location_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     key = key_;
     historical_usage = historical_usage_;
     quantities = quantities_;
     usage_account_id = usage_account_id_;
     group = group_;
     id = id_;
     availability_zone = availability_zone_;
     location = location_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : batch_create_bill_scenario_usage_modification_item)

let make_batch_create_bill_scenario_usage_modification_error
    ?error_code:(error_code_ : batch_create_bill_scenario_usage_modification_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?key:(key_ : key option) () =
  ({ error_code = error_code_; error_message = error_message_; key = key_ }
    : batch_create_bill_scenario_usage_modification_error)

let make_batch_create_bill_scenario_usage_modification_response
    ?errors:(errors_ : batch_create_bill_scenario_usage_modification_errors option)
    ?items:(items_ : batch_create_bill_scenario_usage_modification_items option) () =
  ({ errors = errors_; items = items_ } : batch_create_bill_scenario_usage_modification_response)

let make_batch_create_bill_scenario_usage_modification_entry
    ?historical_usage:(historical_usage_ : historical_usage_entity option)
    ?amounts:(amounts_ : usage_amounts option) ?group:(group_ : usage_group option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ~usage_account_id:(usage_account_id_ : account_id) ~key:(key_ : key)
    ~operation:(operation_ : operation) ~usage_type:(usage_type_ : usage_type)
    ~service_code:(service_code_ : service_code) () =
  ({
     historical_usage = historical_usage_;
     amounts = amounts_;
     usage_account_id = usage_account_id_;
     group = group_;
     key = key_;
     availability_zone = availability_zone_;
     operation = operation_;
     usage_type = usage_type_;
     service_code = service_code_;
   }
    : batch_create_bill_scenario_usage_modification_entry)

let make_batch_create_bill_scenario_usage_modification_request
    ?client_token:(client_token_ : client_token option)
    ~usage_modifications:
      (usage_modifications_ : batch_create_bill_scenario_usage_modification_entries)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({
     client_token = client_token_;
     usage_modifications = usage_modifications_;
     bill_scenario_id = bill_scenario_id_;
   }
    : batch_create_bill_scenario_usage_modification_request)

let make_batch_create_bill_scenario_commitment_modification_item
    ?commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action option)
    ?usage_account_id:(usage_account_id_ : account_id option) ?group:(group_ : usage_group option)
    ?id:(id_ : resource_id option) ?key:(key_ : key option) () =
  ({
     commitment_action = commitment_action_;
     usage_account_id = usage_account_id_;
     group = group_;
     id = id_;
     key = key_;
   }
    : batch_create_bill_scenario_commitment_modification_item)

let make_batch_create_bill_scenario_commitment_modification_error
    ?error_code:(error_code_ : batch_create_bill_scenario_commitment_modification_error_code option)
    ?error_message:(error_message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?key:(key_ : key option) () =
  ({ error_code = error_code_; error_message = error_message_; key = key_ }
    : batch_create_bill_scenario_commitment_modification_error)

let make_batch_create_bill_scenario_commitment_modification_response
    ?errors:(errors_ : batch_create_bill_scenario_commitment_modification_errors option)
    ?items:(items_ : batch_create_bill_scenario_commitment_modification_items option) () =
  ({ errors = errors_; items = items_ }
    : batch_create_bill_scenario_commitment_modification_response)

let make_batch_create_bill_scenario_commitment_modification_entry
    ?group:(group_ : usage_group option)
    ~commitment_action:(commitment_action_ : bill_scenario_commitment_modification_action)
    ~usage_account_id:(usage_account_id_ : account_id) ~key:(key_ : key) () =
  ({
     commitment_action = commitment_action_;
     usage_account_id = usage_account_id_;
     group = group_;
     key = key_;
   }
    : batch_create_bill_scenario_commitment_modification_entry)

let make_batch_create_bill_scenario_commitment_modification_request
    ?client_token:(client_token_ : client_token option)
    ~commitment_modifications:
      (commitment_modifications_ : batch_create_bill_scenario_commitment_modification_entries)
    ~bill_scenario_id:(bill_scenario_id_ : resource_id) () =
  ({
     client_token = client_token_;
     commitment_modifications = commitment_modifications_;
     bill_scenario_id = bill_scenario_id_;
   }
    : batch_create_bill_scenario_commitment_modification_request)
