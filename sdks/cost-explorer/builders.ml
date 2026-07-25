open Types

let make_update_cost_category_definition_response
    ?cost_category_arn:(cost_category_arn_ : arn option)
    ?effective_start:(effective_start_ : zoned_date_time option) () =
  ({ cost_category_arn = cost_category_arn_; effective_start = effective_start_ }
    : update_cost_category_definition_response)

let make_cost_category_split_charge_rule_parameter
    ~type_:(type__ : cost_category_split_charge_rule_parameter_type)
    ~values:(values_ : cost_category_split_charge_rule_parameter_values_list) () =
  ({ type_ = type__; values = values_ } : cost_category_split_charge_rule_parameter)

let make_cost_category_split_charge_rule
    ?parameters:(parameters_ : cost_category_split_charge_rule_parameters_list option)
    ~source:(source_ : generic_string)
    ~targets:(targets_ : cost_category_split_charge_rule_targets_list)
    ~method_:(method__ : cost_category_split_charge_method) () =
  ({ source = source_; targets = targets_; method_ = method__; parameters = parameters_ }
    : cost_category_split_charge_rule)

let make_cost_category_inherited_value_dimension
    ?dimension_name:(dimension_name_ : cost_category_inherited_value_dimension_name option)
    ?dimension_key:(dimension_key_ : generic_string option) () =
  ({ dimension_name = dimension_name_; dimension_key = dimension_key_ }
    : cost_category_inherited_value_dimension)

let make_cost_category_values ?key:(key_ : cost_category_name option)
    ?values:(values_ : values option) ?match_options:(match_options_ : match_options option) () =
  ({ key = key_; values = values_; match_options = match_options_ } : cost_category_values)

let make_tag_values ?key:(key_ : tag_key option) ?values:(values_ : values option)
    ?match_options:(match_options_ : match_options option) () =
  ({ key = key_; values = values_; match_options = match_options_ } : tag_values)

let make_dimension_values ?key:(key_ : dimension option) ?values:(values_ : values option)
    ?match_options:(match_options_ : match_options option) () =
  ({ key = key_; values = values_; match_options = match_options_ } : dimension_values)

let make_expression ?\#or:(or_ : expressions option) ?and_:(and__ : expressions option)
    ?not:(not_ : expression option) ?dimensions:(dimensions_ : dimension_values option)
    ?tags:(tags_ : tag_values option)
    ?cost_categories:(cost_categories_ : cost_category_values option) () =
  ({
     \#or = or_;
     and_ = and__;
     not = not_;
     dimensions = dimensions_;
     tags = tags_;
     cost_categories = cost_categories_;
   }
    : expression)

let make_cost_category_rule ?value:(value_ : cost_category_value option)
    ?rule:(rule_ : expression option)
    ?inherited_value:(inherited_value_ : cost_category_inherited_value_dimension option)
    ?type_:(type__ : cost_category_rule_type option) () =
  ({ value = value_; rule = rule_; inherited_value = inherited_value_; type_ = type__ }
    : cost_category_rule)

let make_update_cost_category_definition_request
    ?effective_start:(effective_start_ : zoned_date_time option)
    ?default_value:(default_value_ : cost_category_value option)
    ?split_charge_rules:(split_charge_rules_ : cost_category_split_charge_rules_list option)
    ~cost_category_arn:(cost_category_arn_ : arn)
    ~rule_version:(rule_version_ : cost_category_rule_version)
    ~rules:(rules_ : cost_category_rules_list) () =
  ({
     cost_category_arn = cost_category_arn_;
     effective_start = effective_start_;
     rule_version = rule_version_;
     rules = rules_;
     default_value = default_value_;
     split_charge_rules = split_charge_rules_;
   }
    : update_cost_category_definition_request)

let make_update_cost_allocation_tags_status_error ?tag_key:(tag_key_ : tag_key option)
    ?code:(code_ : generic_string option) ?message:(message_ : error_message option) () =
  ({ tag_key = tag_key_; code = code_; message = message_ }
    : update_cost_allocation_tags_status_error)

let make_update_cost_allocation_tags_status_response
    ?errors:(errors_ : update_cost_allocation_tags_status_errors option) () =
  ({ errors = errors_ } : update_cost_allocation_tags_status_response)

let make_cost_allocation_tag_status_entry ~tag_key:(tag_key_ : tag_key)
    ~status:(status_ : cost_allocation_tag_status) () =
  ({ tag_key = tag_key_; status = status_ } : cost_allocation_tag_status_entry)

let make_update_cost_allocation_tags_status_request
    ~cost_allocation_tags_status:(cost_allocation_tags_status_ : cost_allocation_tag_status_list) ()
    =
  ({ cost_allocation_tags_status = cost_allocation_tags_status_ }
    : update_cost_allocation_tags_status_request)

let make_update_anomaly_subscription_response ~subscription_arn:(subscription_arn_ : generic_string)
    () =
  ({ subscription_arn = subscription_arn_ } : update_anomaly_subscription_response)

let make_subscriber ?address:(address_ : subscriber_address option)
    ?type_:(type__ : subscriber_type option) ?status:(status_ : subscriber_status option) () =
  ({ address = address_; type_ = type__; status = status_ } : subscriber)

let make_update_anomaly_subscription_request
    ?threshold:(threshold_ : nullable_non_negative_double option)
    ?frequency:(frequency_ : anomaly_subscription_frequency option)
    ?monitor_arn_list:(monitor_arn_list_ : monitor_arn_list option)
    ?subscribers:(subscribers_ : subscribers option)
    ?subscription_name:(subscription_name_ : generic_string option)
    ?threshold_expression:(threshold_expression_ : expression option)
    ~subscription_arn:(subscription_arn_ : generic_string) () =
  ({
     subscription_arn = subscription_arn_;
     threshold = threshold_;
     frequency = frequency_;
     monitor_arn_list = monitor_arn_list_;
     subscribers = subscribers_;
     subscription_name = subscription_name_;
     threshold_expression = threshold_expression_;
   }
    : update_anomaly_subscription_request)

let make_update_anomaly_monitor_response ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({ monitor_arn = monitor_arn_ } : update_anomaly_monitor_response)

let make_update_anomaly_monitor_request ?monitor_name:(monitor_name_ : generic_string option)
    ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({ monitor_arn = monitor_arn_; monitor_name = monitor_name_ } : update_anomaly_monitor_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list) () =
  ({ resource_arn = resource_arn_; resource_tag_keys = resource_tag_keys_ }
    : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ~key:(key_ : resource_tag_key) ~value:(value_ : resource_tag_value) () =
  ({ key = key_; value = value_ } : resource_tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~resource_tags:(resource_tags_ : resource_tag_list) () =
  ({ resource_arn = resource_arn_; resource_tags = resource_tags_ } : tag_resource_request)

let make_start_savings_plans_purchase_recommendation_generation_response
    ?recommendation_id:(recommendation_id_ : recommendation_id option)
    ?generation_started_time:(generation_started_time_ : zoned_date_time option)
    ?estimated_completion_time:(estimated_completion_time_ : zoned_date_time option) () =
  ({
     recommendation_id = recommendation_id_;
     generation_started_time = generation_started_time_;
     estimated_completion_time = estimated_completion_time_;
   }
    : start_savings_plans_purchase_recommendation_generation_response)

let make_start_savings_plans_purchase_recommendation_generation_request () = (() : unit)

let make_cost_allocation_tag_backfill_request
    ?backfill_from:(backfill_from_ : zoned_date_time option)
    ?requested_at:(requested_at_ : zoned_date_time option)
    ?completed_at:(completed_at_ : zoned_date_time option)
    ?backfill_status:(backfill_status_ : cost_allocation_tag_backfill_status option)
    ?last_updated_at:(last_updated_at_ : zoned_date_time option) () =
  ({
     backfill_from = backfill_from_;
     requested_at = requested_at_;
     completed_at = completed_at_;
     backfill_status = backfill_status_;
     last_updated_at = last_updated_at_;
   }
    : cost_allocation_tag_backfill_request)

let make_start_cost_allocation_tag_backfill_response
    ?backfill_request:(backfill_request_ : cost_allocation_tag_backfill_request option) () =
  ({ backfill_request = backfill_request_ } : start_cost_allocation_tag_backfill_response)

let make_start_cost_allocation_tag_backfill_request
    ~backfill_from:(backfill_from_ : zoned_date_time) () =
  ({ backfill_from = backfill_from_ } : start_cost_allocation_tag_backfill_request)

let make_start_commitment_purchase_analysis_response ~analysis_id:(analysis_id_ : analysis_id)
    ~analysis_started_time:(analysis_started_time_ : zoned_date_time)
    ~estimated_completion_time:(estimated_completion_time_ : zoned_date_time) () =
  ({
     analysis_id = analysis_id_;
     analysis_started_time = analysis_started_time_;
     estimated_completion_time = estimated_completion_time_;
   }
    : start_commitment_purchase_analysis_response)

let make_date_interval ~start:(start_ : year_month_day) ~end_:(end__ : year_month_day) () =
  ({ start = start_; end_ = end__ } : date_interval)

let make_savings_plans ?payment_option:(payment_option_ : payment_option option)
    ?savings_plans_type:(savings_plans_type_ : supported_savings_plans_type option)
    ?region:(region_ : generic_string option)
    ?instance_family:(instance_family_ : generic_string option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?savings_plans_commitment:(savings_plans_commitment_ : savings_plans_commitment option)
    ?offering_id:(offering_id_ : generic_string option) () =
  ({
     payment_option = payment_option_;
     savings_plans_type = savings_plans_type_;
     region = region_;
     instance_family = instance_family_;
     term_in_years = term_in_years_;
     savings_plans_commitment = savings_plans_commitment_;
     offering_id = offering_id_;
   }
    : savings_plans)

let make_savings_plans_purchase_analysis_configuration
    ?account_scope:(account_scope_ : account_scope option)
    ?account_id:(account_id_ : account_id option)
    ?savings_plans_to_exclude:(savings_plans_to_exclude_ : savings_plans_to_exclude option)
    ?savings_plans_target_coverage:
      (savings_plans_target_coverage_ : savings_plans_target_coverage option)
    ~analysis_type:(analysis_type_ : analysis_type)
    ~savings_plans_to_add:(savings_plans_to_add_ : savings_plans_to_add)
    ~look_back_time_period:(look_back_time_period_ : date_interval) () =
  ({
     account_scope = account_scope_;
     account_id = account_id_;
     analysis_type = analysis_type_;
     savings_plans_to_add = savings_plans_to_add_;
     savings_plans_to_exclude = savings_plans_to_exclude_;
     look_back_time_period = look_back_time_period_;
     savings_plans_target_coverage = savings_plans_target_coverage_;
   }
    : savings_plans_purchase_analysis_configuration)

let make_commitment_purchase_analysis_configuration
    ?savings_plans_purchase_analysis_configuration:
      (savings_plans_purchase_analysis_configuration_ :
         savings_plans_purchase_analysis_configuration option) () =
  ({
     savings_plans_purchase_analysis_configuration = savings_plans_purchase_analysis_configuration_;
   }
    : commitment_purchase_analysis_configuration)

let make_start_commitment_purchase_analysis_request
    ~commitment_purchase_analysis_configuration:
      (commitment_purchase_analysis_configuration_ : commitment_purchase_analysis_configuration) ()
    =
  ({ commitment_purchase_analysis_configuration = commitment_purchase_analysis_configuration_ }
    : start_commitment_purchase_analysis_request)

let make_provide_anomaly_feedback_response ~anomaly_id:(anomaly_id_ : generic_string) () =
  ({ anomaly_id = anomaly_id_ } : provide_anomaly_feedback_response)

let make_provide_anomaly_feedback_request ~anomaly_id:(anomaly_id_ : generic_string)
    ~feedback:(feedback_ : anomaly_feedback_type) () =
  ({ anomaly_id = anomaly_id_; feedback = feedback_ } : provide_anomaly_feedback_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_generation_summary ?recommendation_id:(recommendation_id_ : recommendation_id option)
    ?generation_status:(generation_status_ : generation_status option)
    ?generation_started_time:(generation_started_time_ : zoned_date_time option)
    ?generation_completion_time:(generation_completion_time_ : zoned_date_time option)
    ?estimated_completion_time:(estimated_completion_time_ : zoned_date_time option) () =
  ({
     recommendation_id = recommendation_id_;
     generation_status = generation_status_;
     generation_started_time = generation_started_time_;
     generation_completion_time = generation_completion_time_;
     estimated_completion_time = estimated_completion_time_;
   }
    : generation_summary)

let make_list_savings_plans_purchase_recommendation_generation_response
    ?generation_summary_list:(generation_summary_list_ : generation_summary_list option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({ generation_summary_list = generation_summary_list_; next_page_token = next_page_token_ }
    : list_savings_plans_purchase_recommendation_generation_response)

let make_list_savings_plans_purchase_recommendation_generation_request
    ?generation_status:(generation_status_ : generation_status option)
    ?recommendation_ids:(recommendation_ids_ : recommendation_id_list option)
    ?page_size:(page_size_ : recommendations_page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({
     generation_status = generation_status_;
     recommendation_ids = recommendation_ids_;
     page_size = page_size_;
     next_page_token = next_page_token_;
   }
    : list_savings_plans_purchase_recommendation_generation_request)

let make_cost_category_resource_association ?resource_arn:(resource_arn_ : generic_arn option)
    ?cost_category_name:(cost_category_name_ : cost_category_name option)
    ?cost_category_arn:(cost_category_arn_ : arn option) () =
  ({
     resource_arn = resource_arn_;
     cost_category_name = cost_category_name_;
     cost_category_arn = cost_category_arn_;
   }
    : cost_category_resource_association)

let make_list_cost_category_resource_associations_response
    ?cost_category_resource_associations:
      (cost_category_resource_associations_ : cost_category_resource_associations option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({
     cost_category_resource_associations = cost_category_resource_associations_;
     next_token = next_token_;
   }
    : list_cost_category_resource_associations_response)

let make_list_cost_category_resource_associations_request
    ?cost_category_arn:(cost_category_arn_ : arn option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : cost_category_max_results option) () =
  ({ cost_category_arn = cost_category_arn_; next_token = next_token_; max_results = max_results_ }
    : list_cost_category_resource_associations_request)

let make_cost_category_processing_status
    ?component:(component_ : cost_category_status_component option)
    ?status:(status_ : cost_category_status option) () =
  ({ component = component_; status = status_ } : cost_category_processing_status)

let make_cost_category_reference ?cost_category_arn:(cost_category_arn_ : arn option)
    ?name:(name_ : cost_category_name option)
    ?effective_start:(effective_start_ : zoned_date_time option)
    ?effective_end:(effective_end_ : zoned_date_time option)
    ?number_of_rules:(number_of_rules_ : non_negative_integer option)
    ?processing_status:(processing_status_ : cost_category_processing_status_list option)
    ?values:(values_ : cost_category_values_list option)
    ?default_value:(default_value_ : cost_category_value option)
    ?supported_resource_types:(supported_resource_types_ : resource_types option) () =
  ({
     cost_category_arn = cost_category_arn_;
     name = name_;
     effective_start = effective_start_;
     effective_end = effective_end_;
     number_of_rules = number_of_rules_;
     processing_status = processing_status_;
     values = values_;
     default_value = default_value_;
     supported_resource_types = supported_resource_types_;
   }
    : cost_category_reference)

let make_list_cost_category_definitions_response
    ?cost_category_references:(cost_category_references_ : cost_category_references_list option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ cost_category_references = cost_category_references_; next_token = next_token_ }
    : list_cost_category_definitions_response)

let make_list_cost_category_definitions_request
    ?effective_on:(effective_on_ : zoned_date_time option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : cost_category_max_results option)
    ?supported_resource_types:(supported_resource_types_ : resource_types_filter_input option) () =
  ({
     effective_on = effective_on_;
     next_token = next_token_;
     max_results = max_results_;
     supported_resource_types = supported_resource_types_;
   }
    : list_cost_category_definitions_request)

let make_cost_allocation_tag ?last_updated_date:(last_updated_date_ : zoned_date_time option)
    ?last_used_date:(last_used_date_ : zoned_date_time option) ~tag_key:(tag_key_ : tag_key)
    ~type_:(type__ : cost_allocation_tag_type) ~status:(status_ : cost_allocation_tag_status) () =
  ({
     tag_key = tag_key_;
     type_ = type__;
     status = status_;
     last_updated_date = last_updated_date_;
     last_used_date = last_used_date_;
   }
    : cost_allocation_tag)

let make_list_cost_allocation_tags_response
    ?cost_allocation_tags:(cost_allocation_tags_ : cost_allocation_tag_list option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ cost_allocation_tags = cost_allocation_tags_; next_token = next_token_ }
    : list_cost_allocation_tags_response)

let make_list_cost_allocation_tags_request ?status:(status_ : cost_allocation_tag_status option)
    ?tag_keys:(tag_keys_ : cost_allocation_tag_key_list option)
    ?type_:(type__ : cost_allocation_tag_type option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : cost_allocation_tags_max_results option) () =
  ({
     status = status_;
     tag_keys = tag_keys_;
     type_ = type__;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_cost_allocation_tags_request)

let make_list_cost_allocation_tag_backfill_history_response
    ?backfill_requests:(backfill_requests_ : cost_allocation_tag_backfill_request_list option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ backfill_requests = backfill_requests_; next_token = next_token_ }
    : list_cost_allocation_tag_backfill_history_response)

let make_list_cost_allocation_tag_backfill_history_request
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : cost_allocation_tags_max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : list_cost_allocation_tag_backfill_history_request)

let make_analysis_summary
    ?estimated_completion_time:(estimated_completion_time_ : zoned_date_time option)
    ?analysis_completion_time:(analysis_completion_time_ : zoned_date_time option)
    ?analysis_started_time:(analysis_started_time_ : zoned_date_time option)
    ?analysis_status:(analysis_status_ : analysis_status option)
    ?error_code:(error_code_ : error_code option) ?analysis_id:(analysis_id_ : analysis_id option)
    ?commitment_purchase_analysis_configuration:
      (commitment_purchase_analysis_configuration_ :
         commitment_purchase_analysis_configuration option) () =
  ({
     estimated_completion_time = estimated_completion_time_;
     analysis_completion_time = analysis_completion_time_;
     analysis_started_time = analysis_started_time_;
     analysis_status = analysis_status_;
     error_code = error_code_;
     analysis_id = analysis_id_;
     commitment_purchase_analysis_configuration = commitment_purchase_analysis_configuration_;
   }
    : analysis_summary)

let make_list_commitment_purchase_analyses_response
    ?analysis_summary_list:(analysis_summary_list_ : analysis_summary_list option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({ analysis_summary_list = analysis_summary_list_; next_page_token = next_page_token_ }
    : list_commitment_purchase_analyses_response)

let make_list_commitment_purchase_analyses_request
    ?analysis_status:(analysis_status_ : analysis_status option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?page_size:(page_size_ : analyses_page_size option)
    ?analysis_ids:(analysis_ids_ : analysis_ids option) () =
  ({
     analysis_status = analysis_status_;
     next_page_token = next_page_token_;
     page_size = page_size_;
     analysis_ids = analysis_ids_;
   }
    : list_commitment_purchase_analyses_request)

let make_metric_value ?amount:(amount_ : metric_amount option) ?unit_:(unit__ : metric_unit option)
    () =
  ({ amount = amount_; unit_ = unit__ } : metric_value)

let make_get_usage_forecast_response ?total:(total_ : metric_value option)
    ?forecast_results_by_time:(forecast_results_by_time_ : forecast_results_by_time option) () =
  ({ total = total_; forecast_results_by_time = forecast_results_by_time_ }
    : get_usage_forecast_response)

let make_get_usage_forecast_request ?filter:(filter_ : expression option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?prediction_interval_level:(prediction_interval_level_ : prediction_interval_level option)
    ~time_period:(time_period_ : date_interval) ~metric:(metric_ : metric)
    ~granularity:(granularity_ : granularity) () =
  ({
     time_period = time_period_;
     metric = metric_;
     granularity = granularity_;
     filter = filter_;
     billing_view_arn = billing_view_arn_;
     prediction_interval_level = prediction_interval_level_;
   }
    : get_usage_forecast_request)

let make_get_tags_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~tags:(tags_ : tag_list) ~return_size:(return_size_ : page_size)
    ~total_size:(total_size_ : page_size) () =
  ({
     next_page_token = next_page_token_;
     tags = tags_;
     return_size = return_size_;
     total_size = total_size_;
   }
    : get_tags_response)

let make_sort_definition ?sort_order:(sort_order_ : sort_order option)
    ~key:(key_ : sort_definition_key) () =
  ({ key = key_; sort_order = sort_order_ } : sort_definition)

let make_get_tags_request ?search_string:(search_string_ : search_string option)
    ?tag_key:(tag_key_ : tag_key option) ?filter:(filter_ : expression option)
    ?sort_by:(sort_by_ : sort_definitions option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?max_results:(max_results_ : max_results option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     search_string = search_string_;
     time_period = time_period_;
     tag_key = tag_key_;
     filter = filter_;
     sort_by = sort_by_;
     billing_view_arn = billing_view_arn_;
     max_results = max_results_;
     next_page_token = next_page_token_;
   }
    : get_tags_request)

let make_savings_plans_amortized_commitment
    ?amortized_recurring_commitment:(amortized_recurring_commitment_ : generic_string option)
    ?amortized_upfront_commitment:(amortized_upfront_commitment_ : generic_string option)
    ?total_amortized_commitment:(total_amortized_commitment_ : generic_string option) () =
  ({
     amortized_recurring_commitment = amortized_recurring_commitment_;
     amortized_upfront_commitment = amortized_upfront_commitment_;
     total_amortized_commitment = total_amortized_commitment_;
   }
    : savings_plans_amortized_commitment)

let make_savings_plans_savings ?net_savings:(net_savings_ : generic_string option)
    ?on_demand_cost_equivalent:(on_demand_cost_equivalent_ : generic_string option) () =
  ({ net_savings = net_savings_; on_demand_cost_equivalent = on_demand_cost_equivalent_ }
    : savings_plans_savings)

let make_savings_plans_utilization ?total_commitment:(total_commitment_ : generic_string option)
    ?used_commitment:(used_commitment_ : generic_string option)
    ?unused_commitment:(unused_commitment_ : generic_string option)
    ?utilization_percentage:(utilization_percentage_ : generic_string option) () =
  ({
     total_commitment = total_commitment_;
     used_commitment = used_commitment_;
     unused_commitment = unused_commitment_;
     utilization_percentage = utilization_percentage_;
   }
    : savings_plans_utilization)

let make_savings_plans_utilization_aggregates ?savings:(savings_ : savings_plans_savings option)
    ?amortized_commitment:(amortized_commitment_ : savings_plans_amortized_commitment option)
    ~utilization:(utilization_ : savings_plans_utilization) () =
  ({ utilization = utilization_; savings = savings_; amortized_commitment = amortized_commitment_ }
    : savings_plans_utilization_aggregates)

let make_savings_plans_utilization_detail
    ?savings_plan_arn:(savings_plan_arn_ : savings_plan_arn option)
    ?attributes:(attributes_ : attributes option)
    ?utilization:(utilization_ : savings_plans_utilization option)
    ?savings:(savings_ : savings_plans_savings option)
    ?amortized_commitment:(amortized_commitment_ : savings_plans_amortized_commitment option) () =
  ({
     savings_plan_arn = savings_plan_arn_;
     attributes = attributes_;
     utilization = utilization_;
     savings = savings_;
     amortized_commitment = amortized_commitment_;
   }
    : savings_plans_utilization_detail)

let make_get_savings_plans_utilization_details_response
    ?total:(total_ : savings_plans_utilization_aggregates option)
    ?next_token:(next_token_ : next_page_token option)
    ~savings_plans_utilization_details:
      (savings_plans_utilization_details_ : savings_plans_utilization_details)
    ~time_period:(time_period_ : date_interval) () =
  ({
     savings_plans_utilization_details = savings_plans_utilization_details_;
     total = total_;
     time_period = time_period_;
     next_token = next_token_;
   }
    : get_savings_plans_utilization_details_response)

let make_get_savings_plans_utilization_details_request ?filter:(filter_ : expression option)
    ?data_type:(data_type_ : savings_plans_data_types option)
    ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) ?sort_by:(sort_by_ : sort_definition option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     time_period = time_period_;
     filter = filter_;
     data_type = data_type_;
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
   }
    : get_savings_plans_utilization_details_request)

let make_savings_plans_utilization_by_time ?savings:(savings_ : savings_plans_savings option)
    ?amortized_commitment:(amortized_commitment_ : savings_plans_amortized_commitment option)
    ~time_period:(time_period_ : date_interval)
    ~utilization:(utilization_ : savings_plans_utilization) () =
  ({
     time_period = time_period_;
     utilization = utilization_;
     savings = savings_;
     amortized_commitment = amortized_commitment_;
   }
    : savings_plans_utilization_by_time)

let make_get_savings_plans_utilization_response
    ?savings_plans_utilizations_by_time:
      (savings_plans_utilizations_by_time_ : savings_plans_utilizations_by_time option)
    ~total:(total_ : savings_plans_utilization_aggregates) () =
  ({ savings_plans_utilizations_by_time = savings_plans_utilizations_by_time_; total = total_ }
    : get_savings_plans_utilization_response)

let make_get_savings_plans_utilization_request ?granularity:(granularity_ : granularity option)
    ?filter:(filter_ : expression option) ?sort_by:(sort_by_ : sort_definition option)
    ~time_period:(time_period_ : date_interval) () =
  ({ time_period = time_period_; granularity = granularity_; filter = filter_; sort_by = sort_by_ }
    : get_savings_plans_utilization_request)

let make_savings_plans_purchase_recommendation_summary
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?estimated_total_cost:(estimated_total_cost_ : generic_string option)
    ?current_on_demand_spend:(current_on_demand_spend_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?total_recommendation_count:(total_recommendation_count_ : generic_string option)
    ?daily_commitment_to_purchase:(daily_commitment_to_purchase_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option) () =
  ({
     estimated_ro_i = estimated_ro_i_;
     currency_code = currency_code_;
     estimated_total_cost = estimated_total_cost_;
     current_on_demand_spend = current_on_demand_spend_;
     estimated_savings_amount = estimated_savings_amount_;
     total_recommendation_count = total_recommendation_count_;
     daily_commitment_to_purchase = daily_commitment_to_purchase_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
   }
    : savings_plans_purchase_recommendation_summary)

let make_savings_plans_details ?region:(region_ : generic_string option)
    ?instance_family:(instance_family_ : generic_string option)
    ?offering_id:(offering_id_ : generic_string option) () =
  ({ region = region_; instance_family = instance_family_; offering_id = offering_id_ }
    : savings_plans_details)

let make_savings_plans_purchase_recommendation_detail
    ?savings_plans_details:(savings_plans_details_ : savings_plans_details option)
    ?account_id:(account_id_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?estimated_sp_cost:(estimated_sp_cost_ : generic_string option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?estimated_average_utilization:(estimated_average_utilization_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?current_minimum_hourly_on_demand_spend:
      (current_minimum_hourly_on_demand_spend_ : generic_string option)
    ?current_maximum_hourly_on_demand_spend:
      (current_maximum_hourly_on_demand_spend_ : generic_string option)
    ?current_average_hourly_on_demand_spend:
      (current_average_hourly_on_demand_spend_ : generic_string option)
    ?recommendation_detail_id:(recommendation_detail_id_ : recommendation_detail_id option) () =
  ({
     savings_plans_details = savings_plans_details_;
     account_id = account_id_;
     upfront_cost = upfront_cost_;
     estimated_ro_i = estimated_ro_i_;
     currency_code = currency_code_;
     estimated_sp_cost = estimated_sp_cost_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
     estimated_savings_amount = estimated_savings_amount_;
     estimated_savings_percentage = estimated_savings_percentage_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     estimated_average_utilization = estimated_average_utilization_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     current_minimum_hourly_on_demand_spend = current_minimum_hourly_on_demand_spend_;
     current_maximum_hourly_on_demand_spend = current_maximum_hourly_on_demand_spend_;
     current_average_hourly_on_demand_spend = current_average_hourly_on_demand_spend_;
     recommendation_detail_id = recommendation_detail_id_;
   }
    : savings_plans_purchase_recommendation_detail)

let make_savings_plans_purchase_recommendation
    ?account_scope:(account_scope_ : account_scope option)
    ?savings_plans_type:(savings_plans_type_ : supported_savings_plans_type option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?payment_option:(payment_option_ : payment_option option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?savings_plans_purchase_recommendation_details:
      (savings_plans_purchase_recommendation_details_ :
         savings_plans_purchase_recommendation_detail_list option)
    ?savings_plans_purchase_recommendation_summary:
      (savings_plans_purchase_recommendation_summary_ :
         savings_plans_purchase_recommendation_summary option) () =
  ({
     account_scope = account_scope_;
     savings_plans_type = savings_plans_type_;
     term_in_years = term_in_years_;
     payment_option = payment_option_;
     lookback_period_in_days = lookback_period_in_days_;
     savings_plans_purchase_recommendation_details = savings_plans_purchase_recommendation_details_;
     savings_plans_purchase_recommendation_summary = savings_plans_purchase_recommendation_summary_;
   }
    : savings_plans_purchase_recommendation)

let make_savings_plans_purchase_recommendation_metadata
    ?recommendation_id:(recommendation_id_ : generic_string option)
    ?generation_timestamp:(generation_timestamp_ : generic_string option)
    ?additional_metadata:(additional_metadata_ : generic_string option) () =
  ({
     recommendation_id = recommendation_id_;
     generation_timestamp = generation_timestamp_;
     additional_metadata = additional_metadata_;
   }
    : savings_plans_purchase_recommendation_metadata)

let make_get_savings_plans_purchase_recommendation_response
    ?metadata:(metadata_ : savings_plans_purchase_recommendation_metadata option)
    ?savings_plans_purchase_recommendation:
      (savings_plans_purchase_recommendation_ : savings_plans_purchase_recommendation option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({
     metadata = metadata_;
     savings_plans_purchase_recommendation = savings_plans_purchase_recommendation_;
     next_page_token = next_page_token_;
   }
    : get_savings_plans_purchase_recommendation_response)

let make_get_savings_plans_purchase_recommendation_request
    ?account_scope:(account_scope_ : account_scope option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?page_size:(page_size_ : recommendations_page_size option) ?filter:(filter_ : expression option)
    ~savings_plans_type:(savings_plans_type_ : supported_savings_plans_type)
    ~term_in_years:(term_in_years_ : term_in_years)
    ~payment_option:(payment_option_ : payment_option)
    ~lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days) () =
  ({
     savings_plans_type = savings_plans_type_;
     term_in_years = term_in_years_;
     payment_option = payment_option_;
     account_scope = account_scope_;
     next_page_token = next_page_token_;
     page_size = page_size_;
     lookback_period_in_days = lookback_period_in_days_;
     filter = filter_;
   }
    : get_savings_plans_purchase_recommendation_request)

let make_savings_plans_coverage_data
    ?spend_covered_by_savings_plans:(spend_covered_by_savings_plans_ : generic_string option)
    ?on_demand_cost:(on_demand_cost_ : generic_string option)
    ?total_cost:(total_cost_ : generic_string option)
    ?coverage_percentage:(coverage_percentage_ : generic_string option) () =
  ({
     spend_covered_by_savings_plans = spend_covered_by_savings_plans_;
     on_demand_cost = on_demand_cost_;
     total_cost = total_cost_;
     coverage_percentage = coverage_percentage_;
   }
    : savings_plans_coverage_data)

let make_savings_plans_coverage ?attributes:(attributes_ : attributes option)
    ?coverage:(coverage_ : savings_plans_coverage_data option)
    ?time_period:(time_period_ : date_interval option) () =
  ({ attributes = attributes_; coverage = coverage_; time_period = time_period_ }
    : savings_plans_coverage)

let make_get_savings_plans_coverage_response ?next_token:(next_token_ : next_page_token option)
    ~savings_plans_coverages:(savings_plans_coverages_ : savings_plans_coverages) () =
  ({ savings_plans_coverages = savings_plans_coverages_; next_token = next_token_ }
    : get_savings_plans_coverage_response)

let make_group_definition ?type_:(type__ : group_definition_type option)
    ?key:(key_ : group_definition_key option) () =
  ({ type_ = type__; key = key_ } : group_definition)

let make_get_savings_plans_coverage_request ?group_by:(group_by_ : group_definitions option)
    ?granularity:(granularity_ : granularity option) ?filter:(filter_ : expression option)
    ?metrics:(metrics_ : metric_names option) ?next_token:(next_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) ?sort_by:(sort_by_ : sort_definition option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     time_period = time_period_;
     group_by = group_by_;
     granularity = granularity_;
     filter = filter_;
     metrics = metrics_;
     next_token = next_token_;
     max_results = max_results_;
     sort_by = sort_by_;
   }
    : get_savings_plans_coverage_request)

let make_recommendation_detail_hourly_metrics ?start_time:(start_time_ : zoned_date_time option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?current_coverage:(current_coverage_ : generic_string option)
    ?estimated_coverage:(estimated_coverage_ : generic_string option)
    ?estimated_new_commitment_utilization:
      (estimated_new_commitment_utilization_ : generic_string option) () =
  ({
     start_time = start_time_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     current_coverage = current_coverage_;
     estimated_coverage = estimated_coverage_;
     estimated_new_commitment_utilization = estimated_new_commitment_utilization_;
   }
    : recommendation_detail_hourly_metrics)

let make_recommendation_detail_data ?account_scope:(account_scope_ : account_scope option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?savings_plans_type:(savings_plans_type_ : supported_savings_plans_type option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?payment_option:(payment_option_ : payment_option option)
    ?account_id:(account_id_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?instance_family:(instance_family_ : generic_string option)
    ?region:(region_ : generic_string option) ?offering_id:(offering_id_ : generic_string option)
    ?generation_timestamp:(generation_timestamp_ : zoned_date_time option)
    ?latest_usage_timestamp:(latest_usage_timestamp_ : zoned_date_time option)
    ?current_average_hourly_on_demand_spend:
      (current_average_hourly_on_demand_spend_ : generic_string option)
    ?current_maximum_hourly_on_demand_spend:
      (current_maximum_hourly_on_demand_spend_ : generic_string option)
    ?current_minimum_hourly_on_demand_spend:
      (current_minimum_hourly_on_demand_spend_ : generic_string option)
    ?estimated_average_utilization:(estimated_average_utilization_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option)
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option)
    ?estimated_sp_cost:(estimated_sp_cost_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?existing_hourly_commitment:(existing_hourly_commitment_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?current_average_coverage:(current_average_coverage_ : generic_string option)
    ?estimated_average_coverage:(estimated_average_coverage_ : generic_string option)
    ?metrics_over_lookback_period:
      (metrics_over_lookback_period_ : metrics_over_lookback_period option) () =
  ({
     account_scope = account_scope_;
     lookback_period_in_days = lookback_period_in_days_;
     savings_plans_type = savings_plans_type_;
     term_in_years = term_in_years_;
     payment_option = payment_option_;
     account_id = account_id_;
     currency_code = currency_code_;
     instance_family = instance_family_;
     region = region_;
     offering_id = offering_id_;
     generation_timestamp = generation_timestamp_;
     latest_usage_timestamp = latest_usage_timestamp_;
     current_average_hourly_on_demand_spend = current_average_hourly_on_demand_spend_;
     current_maximum_hourly_on_demand_spend = current_maximum_hourly_on_demand_spend_;
     current_minimum_hourly_on_demand_spend = current_minimum_hourly_on_demand_spend_;
     estimated_average_utilization = estimated_average_utilization_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
     estimated_ro_i = estimated_ro_i_;
     estimated_sp_cost = estimated_sp_cost_;
     estimated_savings_amount = estimated_savings_amount_;
     estimated_savings_percentage = estimated_savings_percentage_;
     existing_hourly_commitment = existing_hourly_commitment_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     upfront_cost = upfront_cost_;
     current_average_coverage = current_average_coverage_;
     estimated_average_coverage = estimated_average_coverage_;
     metrics_over_lookback_period = metrics_over_lookback_period_;
   }
    : recommendation_detail_data)

let make_get_savings_plan_purchase_recommendation_details_response
    ?recommendation_detail_id:(recommendation_detail_id_ : recommendation_detail_id option)
    ?recommendation_detail_data:(recommendation_detail_data_ : recommendation_detail_data option) ()
    =
  ({
     recommendation_detail_id = recommendation_detail_id_;
     recommendation_detail_data = recommendation_detail_data_;
   }
    : get_savings_plan_purchase_recommendation_details_response)

let make_get_savings_plan_purchase_recommendation_details_request
    ~recommendation_detail_id:(recommendation_detail_id_ : recommendation_detail_id) () =
  ({ recommendation_detail_id = recommendation_detail_id_ }
    : get_savings_plan_purchase_recommendation_details_request)

let make_rightsizing_recommendation_configuration
    ~recommendation_target:(recommendation_target_ : recommendation_target)
    ~benefits_considered:(benefits_considered_ : generic_boolean) () =
  ({ recommendation_target = recommendation_target_; benefits_considered = benefits_considered_ }
    : rightsizing_recommendation_configuration)

let make_terminate_recommendation_detail
    ?estimated_monthly_savings:(estimated_monthly_savings_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option) () =
  ({ estimated_monthly_savings = estimated_monthly_savings_; currency_code = currency_code_ }
    : terminate_recommendation_detail)

let make_network_resource_utilization
    ?network_in_bytes_per_second:(network_in_bytes_per_second_ : generic_string option)
    ?network_out_bytes_per_second:(network_out_bytes_per_second_ : generic_string option)
    ?network_packets_in_per_second:(network_packets_in_per_second_ : generic_string option)
    ?network_packets_out_per_second:(network_packets_out_per_second_ : generic_string option) () =
  ({
     network_in_bytes_per_second = network_in_bytes_per_second_;
     network_out_bytes_per_second = network_out_bytes_per_second_;
     network_packets_in_per_second = network_packets_in_per_second_;
     network_packets_out_per_second = network_packets_out_per_second_;
   }
    : network_resource_utilization)

let make_disk_resource_utilization
    ?disk_read_ops_per_second:(disk_read_ops_per_second_ : generic_string option)
    ?disk_write_ops_per_second:(disk_write_ops_per_second_ : generic_string option)
    ?disk_read_bytes_per_second:(disk_read_bytes_per_second_ : generic_string option)
    ?disk_write_bytes_per_second:(disk_write_bytes_per_second_ : generic_string option) () =
  ({
     disk_read_ops_per_second = disk_read_ops_per_second_;
     disk_write_ops_per_second = disk_write_ops_per_second_;
     disk_read_bytes_per_second = disk_read_bytes_per_second_;
     disk_write_bytes_per_second = disk_write_bytes_per_second_;
   }
    : disk_resource_utilization)

let make_ebs_resource_utilization
    ?ebs_read_ops_per_second:(ebs_read_ops_per_second_ : generic_string option)
    ?ebs_write_ops_per_second:(ebs_write_ops_per_second_ : generic_string option)
    ?ebs_read_bytes_per_second:(ebs_read_bytes_per_second_ : generic_string option)
    ?ebs_write_bytes_per_second:(ebs_write_bytes_per_second_ : generic_string option) () =
  ({
     ebs_read_ops_per_second = ebs_read_ops_per_second_;
     ebs_write_ops_per_second = ebs_write_ops_per_second_;
     ebs_read_bytes_per_second = ebs_read_bytes_per_second_;
     ebs_write_bytes_per_second = ebs_write_bytes_per_second_;
   }
    : ebs_resource_utilization)

let make_ec2_resource_utilization
    ?max_cpu_utilization_percentage:(max_cpu_utilization_percentage_ : generic_string option)
    ?max_memory_utilization_percentage:(max_memory_utilization_percentage_ : generic_string option)
    ?max_storage_utilization_percentage:
      (max_storage_utilization_percentage_ : generic_string option)
    ?ebs_resource_utilization:(ebs_resource_utilization_ : ebs_resource_utilization option)
    ?disk_resource_utilization:(disk_resource_utilization_ : disk_resource_utilization option)
    ?network_resource_utilization:
      (network_resource_utilization_ : network_resource_utilization option) () =
  ({
     max_cpu_utilization_percentage = max_cpu_utilization_percentage_;
     max_memory_utilization_percentage = max_memory_utilization_percentage_;
     max_storage_utilization_percentage = max_storage_utilization_percentage_;
     ebs_resource_utilization = ebs_resource_utilization_;
     disk_resource_utilization = disk_resource_utilization_;
     network_resource_utilization = network_resource_utilization_;
   }
    : ec2_resource_utilization)

let make_resource_utilization
    ?ec2_resource_utilization:(ec2_resource_utilization_ : ec2_resource_utilization option) () =
  ({ ec2_resource_utilization = ec2_resource_utilization_ } : resource_utilization)

let make_ec2_resource_details
    ?hourly_on_demand_rate:(hourly_on_demand_rate_ : generic_string option)
    ?instance_type:(instance_type_ : generic_string option)
    ?platform:(platform_ : generic_string option) ?region:(region_ : generic_string option)
    ?sku:(sku_ : generic_string option) ?memory:(memory_ : generic_string option)
    ?network_performance:(network_performance_ : generic_string option)
    ?storage:(storage_ : generic_string option) ?vcpu:(vcpu_ : generic_string option) () =
  ({
     hourly_on_demand_rate = hourly_on_demand_rate_;
     instance_type = instance_type_;
     platform = platform_;
     region = region_;
     sku = sku_;
     memory = memory_;
     network_performance = network_performance_;
     storage = storage_;
     vcpu = vcpu_;
   }
    : ec2_resource_details)

let make_resource_details
    ?ec2_resource_details:(ec2_resource_details_ : ec2_resource_details option) () =
  ({ ec2_resource_details = ec2_resource_details_ } : resource_details)

let make_target_instance ?estimated_monthly_cost:(estimated_monthly_cost_ : generic_string option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?default_target_instance:(default_target_instance_ : generic_boolean option)
    ?resource_details:(resource_details_ : resource_details option)
    ?expected_resource_utilization:(expected_resource_utilization_ : resource_utilization option)
    ?platform_differences:(platform_differences_ : platform_differences option) () =
  ({
     estimated_monthly_cost = estimated_monthly_cost_;
     estimated_monthly_savings = estimated_monthly_savings_;
     currency_code = currency_code_;
     default_target_instance = default_target_instance_;
     resource_details = resource_details_;
     expected_resource_utilization = expected_resource_utilization_;
     platform_differences = platform_differences_;
   }
    : target_instance)

let make_modify_recommendation_detail
    ?target_instances:(target_instances_ : target_instances_list option) () =
  ({ target_instances = target_instances_ } : modify_recommendation_detail)

let make_current_instance ?resource_id:(resource_id_ : generic_string option)
    ?instance_name:(instance_name_ : generic_string option) ?tags:(tags_ : tag_values_list option)
    ?resource_details:(resource_details_ : resource_details option)
    ?resource_utilization:(resource_utilization_ : resource_utilization option)
    ?reservation_covered_hours_in_lookback_period:
      (reservation_covered_hours_in_lookback_period_ : generic_string option)
    ?savings_plans_covered_hours_in_lookback_period:
      (savings_plans_covered_hours_in_lookback_period_ : generic_string option)
    ?on_demand_hours_in_lookback_period:
      (on_demand_hours_in_lookback_period_ : generic_string option)
    ?total_running_hours_in_lookback_period:
      (total_running_hours_in_lookback_period_ : generic_string option)
    ?monthly_cost:(monthly_cost_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option) () =
  ({
     resource_id = resource_id_;
     instance_name = instance_name_;
     tags = tags_;
     resource_details = resource_details_;
     resource_utilization = resource_utilization_;
     reservation_covered_hours_in_lookback_period = reservation_covered_hours_in_lookback_period_;
     savings_plans_covered_hours_in_lookback_period =
       savings_plans_covered_hours_in_lookback_period_;
     on_demand_hours_in_lookback_period = on_demand_hours_in_lookback_period_;
     total_running_hours_in_lookback_period = total_running_hours_in_lookback_period_;
     monthly_cost = monthly_cost_;
     currency_code = currency_code_;
   }
    : current_instance)

let make_rightsizing_recommendation ?account_id:(account_id_ : generic_string option)
    ?current_instance:(current_instance_ : current_instance option)
    ?rightsizing_type:(rightsizing_type_ : rightsizing_type option)
    ?modify_recommendation_detail:
      (modify_recommendation_detail_ : modify_recommendation_detail option)
    ?terminate_recommendation_detail:
      (terminate_recommendation_detail_ : terminate_recommendation_detail option)
    ?finding_reason_codes:(finding_reason_codes_ : finding_reason_codes option) () =
  ({
     account_id = account_id_;
     current_instance = current_instance_;
     rightsizing_type = rightsizing_type_;
     modify_recommendation_detail = modify_recommendation_detail_;
     terminate_recommendation_detail = terminate_recommendation_detail_;
     finding_reason_codes = finding_reason_codes_;
   }
    : rightsizing_recommendation)

let make_rightsizing_recommendation_summary
    ?total_recommendation_count:(total_recommendation_count_ : generic_string option)
    ?estimated_total_monthly_savings_amount:
      (estimated_total_monthly_savings_amount_ : generic_string option)
    ?savings_currency_code:(savings_currency_code_ : generic_string option)
    ?savings_percentage:(savings_percentage_ : generic_string option) () =
  ({
     total_recommendation_count = total_recommendation_count_;
     estimated_total_monthly_savings_amount = estimated_total_monthly_savings_amount_;
     savings_currency_code = savings_currency_code_;
     savings_percentage = savings_percentage_;
   }
    : rightsizing_recommendation_summary)

let make_rightsizing_recommendation_metadata
    ?recommendation_id:(recommendation_id_ : generic_string option)
    ?generation_timestamp:(generation_timestamp_ : generic_string option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?additional_metadata:(additional_metadata_ : generic_string option) () =
  ({
     recommendation_id = recommendation_id_;
     generation_timestamp = generation_timestamp_;
     lookback_period_in_days = lookback_period_in_days_;
     additional_metadata = additional_metadata_;
   }
    : rightsizing_recommendation_metadata)

let make_get_rightsizing_recommendation_response
    ?metadata:(metadata_ : rightsizing_recommendation_metadata option)
    ?summary:(summary_ : rightsizing_recommendation_summary option)
    ?rightsizing_recommendations:
      (rightsizing_recommendations_ : rightsizing_recommendation_list option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?configuration:(configuration_ : rightsizing_recommendation_configuration option) () =
  ({
     metadata = metadata_;
     summary = summary_;
     rightsizing_recommendations = rightsizing_recommendations_;
     next_page_token = next_page_token_;
     configuration = configuration_;
   }
    : get_rightsizing_recommendation_response)

let make_get_rightsizing_recommendation_request ?filter:(filter_ : expression option)
    ?configuration:(configuration_ : rightsizing_recommendation_configuration option)
    ?page_size:(page_size_ : recommendations_page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~service:(service_ : generic_string) () =
  ({
     filter = filter_;
     configuration = configuration_;
     service = service_;
     page_size = page_size_;
     next_page_token = next_page_token_;
   }
    : get_rightsizing_recommendation_request)

let make_reservation_aggregates
    ?utilization_percentage:(utilization_percentage_ : utilization_percentage option)
    ?utilization_percentage_in_units:
      (utilization_percentage_in_units_ : utilization_percentage_in_units option)
    ?purchased_hours:(purchased_hours_ : purchased_hours option)
    ?purchased_units:(purchased_units_ : purchased_units option)
    ?total_actual_hours:(total_actual_hours_ : total_actual_hours option)
    ?total_actual_units:(total_actual_units_ : total_actual_units option)
    ?unused_hours:(unused_hours_ : unused_hours option)
    ?unused_units:(unused_units_ : unused_units option)
    ?on_demand_cost_of_ri_hours_used:
      (on_demand_cost_of_ri_hours_used_ : on_demand_cost_of_ri_hours_used option)
    ?net_ri_savings:(net_ri_savings_ : net_ri_savings option)
    ?total_potential_ri_savings:(total_potential_ri_savings_ : total_potential_ri_savings option)
    ?amortized_upfront_fee:(amortized_upfront_fee_ : amortized_upfront_fee option)
    ?amortized_recurring_fee:(amortized_recurring_fee_ : amortized_recurring_fee option)
    ?total_amortized_fee:(total_amortized_fee_ : total_amortized_fee option)
    ?ri_cost_for_unused_hours:(ri_cost_for_unused_hours_ : ri_cost_for_unused_hours option)
    ?realized_savings:(realized_savings_ : realized_savings option)
    ?unrealized_savings:(unrealized_savings_ : unrealized_savings option) () =
  ({
     utilization_percentage = utilization_percentage_;
     utilization_percentage_in_units = utilization_percentage_in_units_;
     purchased_hours = purchased_hours_;
     purchased_units = purchased_units_;
     total_actual_hours = total_actual_hours_;
     total_actual_units = total_actual_units_;
     unused_hours = unused_hours_;
     unused_units = unused_units_;
     on_demand_cost_of_ri_hours_used = on_demand_cost_of_ri_hours_used_;
     net_ri_savings = net_ri_savings_;
     total_potential_ri_savings = total_potential_ri_savings_;
     amortized_upfront_fee = amortized_upfront_fee_;
     amortized_recurring_fee = amortized_recurring_fee_;
     total_amortized_fee = total_amortized_fee_;
     ri_cost_for_unused_hours = ri_cost_for_unused_hours_;
     realized_savings = realized_savings_;
     unrealized_savings = unrealized_savings_;
   }
    : reservation_aggregates)

let make_reservation_utilization_group ?key:(key_ : reservation_group_key option)
    ?value:(value_ : reservation_group_value option) ?attributes:(attributes_ : attributes option)
    ?utilization:(utilization_ : reservation_aggregates option) () =
  ({ key = key_; value = value_; attributes = attributes_; utilization = utilization_ }
    : reservation_utilization_group)

let make_utilization_by_time ?time_period:(time_period_ : date_interval option)
    ?groups:(groups_ : reservation_utilization_groups option)
    ?total:(total_ : reservation_aggregates option) () =
  ({ time_period = time_period_; groups = groups_; total = total_ } : utilization_by_time)

let make_get_reservation_utilization_response ?total:(total_ : reservation_aggregates option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~utilizations_by_time:(utilizations_by_time_ : utilizations_by_time) () =
  ({
     utilizations_by_time = utilizations_by_time_;
     total = total_;
     next_page_token = next_page_token_;
   }
    : get_reservation_utilization_response)

let make_get_reservation_utilization_request ?group_by:(group_by_ : group_definitions option)
    ?granularity:(granularity_ : granularity option) ?filter:(filter_ : expression option)
    ?sort_by:(sort_by_ : sort_definition option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option) ~time_period:(time_period_ : date_interval) ()
    =
  ({
     time_period = time_period_;
     group_by = group_by_;
     granularity = granularity_;
     filter = filter_;
     sort_by = sort_by_;
     next_page_token = next_page_token_;
     max_results = max_results_;
   }
    : get_reservation_utilization_request)

let make_reservation_purchase_recommendation_summary
    ?total_estimated_monthly_savings_amount:
      (total_estimated_monthly_savings_amount_ : generic_string option)
    ?total_estimated_monthly_savings_percentage:
      (total_estimated_monthly_savings_percentage_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option) () =
  ({
     total_estimated_monthly_savings_amount = total_estimated_monthly_savings_amount_;
     total_estimated_monthly_savings_percentage = total_estimated_monthly_savings_percentage_;
     currency_code = currency_code_;
   }
    : reservation_purchase_recommendation_summary)

let make_dynamo_db_capacity_details ?capacity_units:(capacity_units_ : generic_string option)
    ?region:(region_ : generic_string option) () =
  ({ capacity_units = capacity_units_; region = region_ } : dynamo_db_capacity_details)

let make_reserved_capacity_details
    ?dynamo_db_capacity_details:(dynamo_db_capacity_details_ : dynamo_db_capacity_details option) ()
    =
  ({ dynamo_db_capacity_details = dynamo_db_capacity_details_ } : reserved_capacity_details)

let make_memory_db_instance_details ?family:(family_ : generic_string option)
    ?node_type:(node_type_ : generic_string option) ?region:(region_ : generic_string option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option) () =
  ({
     family = family_;
     node_type = node_type_;
     region = region_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
   }
    : memory_db_instance_details)

let make_es_instance_details ?instance_class:(instance_class_ : generic_string option)
    ?instance_size:(instance_size_ : generic_string option)
    ?region:(region_ : generic_string option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option) () =
  ({
     instance_class = instance_class_;
     instance_size = instance_size_;
     region = region_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
   }
    : es_instance_details)

let make_elasti_cache_instance_details ?family:(family_ : generic_string option)
    ?node_type:(node_type_ : generic_string option) ?region:(region_ : generic_string option)
    ?product_description:(product_description_ : generic_string option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option) () =
  ({
     family = family_;
     node_type = node_type_;
     region = region_;
     product_description = product_description_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
   }
    : elasti_cache_instance_details)

let make_redshift_instance_details ?family:(family_ : generic_string option)
    ?node_type:(node_type_ : generic_string option) ?region:(region_ : generic_string option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option) () =
  ({
     family = family_;
     node_type = node_type_;
     region = region_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
   }
    : redshift_instance_details)

let make_rds_instance_details ?family:(family_ : generic_string option)
    ?instance_type:(instance_type_ : generic_string option)
    ?region:(region_ : generic_string option)
    ?database_engine:(database_engine_ : generic_string option)
    ?database_edition:(database_edition_ : generic_string option)
    ?deployment_option:(deployment_option_ : generic_string option)
    ?license_model:(license_model_ : generic_string option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option)
    ?deployment_model:(deployment_model_ : generic_string option) () =
  ({
     family = family_;
     instance_type = instance_type_;
     region = region_;
     database_engine = database_engine_;
     database_edition = database_edition_;
     deployment_option = deployment_option_;
     license_model = license_model_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
     deployment_model = deployment_model_;
   }
    : rds_instance_details)

let make_ec2_instance_details ?family:(family_ : generic_string option)
    ?instance_type:(instance_type_ : generic_string option)
    ?region:(region_ : generic_string option)
    ?availability_zone:(availability_zone_ : generic_string option)
    ?platform:(platform_ : generic_string option) ?tenancy:(tenancy_ : generic_string option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option) () =
  ({
     family = family_;
     instance_type = instance_type_;
     region = region_;
     availability_zone = availability_zone_;
     platform = platform_;
     tenancy = tenancy_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
   }
    : ec2_instance_details)

let make_instance_details
    ?ec2_instance_details:(ec2_instance_details_ : ec2_instance_details option)
    ?rds_instance_details:(rds_instance_details_ : rds_instance_details option)
    ?redshift_instance_details:(redshift_instance_details_ : redshift_instance_details option)
    ?elasti_cache_instance_details:
      (elasti_cache_instance_details_ : elasti_cache_instance_details option)
    ?es_instance_details:(es_instance_details_ : es_instance_details option)
    ?memory_db_instance_details:(memory_db_instance_details_ : memory_db_instance_details option) ()
    =
  ({
     ec2_instance_details = ec2_instance_details_;
     rds_instance_details = rds_instance_details_;
     redshift_instance_details = redshift_instance_details_;
     elasti_cache_instance_details = elasti_cache_instance_details_;
     es_instance_details = es_instance_details_;
     memory_db_instance_details = memory_db_instance_details_;
   }
    : instance_details)

let make_reservation_purchase_recommendation_detail
    ?account_id:(account_id_ : generic_string option)
    ?instance_details:(instance_details_ : instance_details option)
    ?recommended_number_of_instances_to_purchase:
      (recommended_number_of_instances_to_purchase_ : generic_string option)
    ?recommended_normalized_units_to_purchase:
      (recommended_normalized_units_to_purchase_ : generic_string option)
    ?minimum_number_of_instances_used_per_hour:
      (minimum_number_of_instances_used_per_hour_ : generic_string option)
    ?minimum_normalized_units_used_per_hour:
      (minimum_normalized_units_used_per_hour_ : generic_string option)
    ?maximum_number_of_instances_used_per_hour:
      (maximum_number_of_instances_used_per_hour_ : generic_string option)
    ?maximum_normalized_units_used_per_hour:
      (maximum_normalized_units_used_per_hour_ : generic_string option)
    ?average_number_of_instances_used_per_hour:
      (average_number_of_instances_used_per_hour_ : generic_string option)
    ?average_normalized_units_used_per_hour:
      (average_normalized_units_used_per_hour_ : generic_string option)
    ?average_utilization:(average_utilization_ : generic_string option)
    ?estimated_break_even_in_months:(estimated_break_even_in_months_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_monthly_savings_percentage:
      (estimated_monthly_savings_percentage_ : generic_string option)
    ?estimated_monthly_on_demand_cost:(estimated_monthly_on_demand_cost_ : generic_string option)
    ?estimated_reservation_cost_for_lookback_period:
      (estimated_reservation_cost_for_lookback_period_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?recurring_standard_monthly_cost:(recurring_standard_monthly_cost_ : generic_string option)
    ?reserved_capacity_details:(reserved_capacity_details_ : reserved_capacity_details option)
    ?recommended_number_of_capacity_units_to_purchase:
      (recommended_number_of_capacity_units_to_purchase_ : generic_string option)
    ?minimum_number_of_capacity_units_used_per_hour:
      (minimum_number_of_capacity_units_used_per_hour_ : generic_string option)
    ?maximum_number_of_capacity_units_used_per_hour:
      (maximum_number_of_capacity_units_used_per_hour_ : generic_string option)
    ?average_number_of_capacity_units_used_per_hour:
      (average_number_of_capacity_units_used_per_hour_ : generic_string option) () =
  ({
     account_id = account_id_;
     instance_details = instance_details_;
     recommended_number_of_instances_to_purchase = recommended_number_of_instances_to_purchase_;
     recommended_normalized_units_to_purchase = recommended_normalized_units_to_purchase_;
     minimum_number_of_instances_used_per_hour = minimum_number_of_instances_used_per_hour_;
     minimum_normalized_units_used_per_hour = minimum_normalized_units_used_per_hour_;
     maximum_number_of_instances_used_per_hour = maximum_number_of_instances_used_per_hour_;
     maximum_normalized_units_used_per_hour = maximum_normalized_units_used_per_hour_;
     average_number_of_instances_used_per_hour = average_number_of_instances_used_per_hour_;
     average_normalized_units_used_per_hour = average_normalized_units_used_per_hour_;
     average_utilization = average_utilization_;
     estimated_break_even_in_months = estimated_break_even_in_months_;
     currency_code = currency_code_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_monthly_savings_percentage = estimated_monthly_savings_percentage_;
     estimated_monthly_on_demand_cost = estimated_monthly_on_demand_cost_;
     estimated_reservation_cost_for_lookback_period =
       estimated_reservation_cost_for_lookback_period_;
     upfront_cost = upfront_cost_;
     recurring_standard_monthly_cost = recurring_standard_monthly_cost_;
     reserved_capacity_details = reserved_capacity_details_;
     recommended_number_of_capacity_units_to_purchase =
       recommended_number_of_capacity_units_to_purchase_;
     minimum_number_of_capacity_units_used_per_hour =
       minimum_number_of_capacity_units_used_per_hour_;
     maximum_number_of_capacity_units_used_per_hour =
       maximum_number_of_capacity_units_used_per_hour_;
     average_number_of_capacity_units_used_per_hour =
       average_number_of_capacity_units_used_per_hour_;
   }
    : reservation_purchase_recommendation_detail)

let make_ec2_specification ?offering_class:(offering_class_ : offering_class option) () =
  ({ offering_class = offering_class_ } : ec2_specification)

let make_service_specification ?ec2_specification:(ec2_specification_ : ec2_specification option) ()
    =
  ({ ec2_specification = ec2_specification_ } : service_specification)

let make_reservation_purchase_recommendation ?account_scope:(account_scope_ : account_scope option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?payment_option:(payment_option_ : payment_option option)
    ?service_specification:(service_specification_ : service_specification option)
    ?recommendation_details:
      (recommendation_details_ : reservation_purchase_recommendation_details option)
    ?recommendation_summary:
      (recommendation_summary_ : reservation_purchase_recommendation_summary option) () =
  ({
     account_scope = account_scope_;
     lookback_period_in_days = lookback_period_in_days_;
     term_in_years = term_in_years_;
     payment_option = payment_option_;
     service_specification = service_specification_;
     recommendation_details = recommendation_details_;
     recommendation_summary = recommendation_summary_;
   }
    : reservation_purchase_recommendation)

let make_reservation_purchase_recommendation_metadata
    ?recommendation_id:(recommendation_id_ : generic_string option)
    ?generation_timestamp:(generation_timestamp_ : generic_string option)
    ?additional_metadata:(additional_metadata_ : generic_string option) () =
  ({
     recommendation_id = recommendation_id_;
     generation_timestamp = generation_timestamp_;
     additional_metadata = additional_metadata_;
   }
    : reservation_purchase_recommendation_metadata)

let make_get_reservation_purchase_recommendation_response
    ?metadata:(metadata_ : reservation_purchase_recommendation_metadata option)
    ?recommendations:(recommendations_ : reservation_purchase_recommendations option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({ metadata = metadata_; recommendations = recommendations_; next_page_token = next_page_token_ }
    : get_reservation_purchase_recommendation_response)

let make_get_reservation_purchase_recommendation_request
    ?account_id:(account_id_ : generic_string option) ?filter:(filter_ : expression option)
    ?account_scope:(account_scope_ : account_scope option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?payment_option:(payment_option_ : payment_option option)
    ?service_specification:(service_specification_ : service_specification option)
    ?page_size:(page_size_ : recommendations_page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~service:(service_ : generic_string) () =
  ({
     account_id = account_id_;
     service = service_;
     filter = filter_;
     account_scope = account_scope_;
     lookback_period_in_days = lookback_period_in_days_;
     term_in_years = term_in_years_;
     payment_option = payment_option_;
     service_specification = service_specification_;
     page_size = page_size_;
     next_page_token = next_page_token_;
   }
    : get_reservation_purchase_recommendation_request)

let make_coverage_cost ?on_demand_cost:(on_demand_cost_ : on_demand_cost option) () =
  ({ on_demand_cost = on_demand_cost_ } : coverage_cost)

let make_coverage_normalized_units
    ?on_demand_normalized_units:(on_demand_normalized_units_ : on_demand_normalized_units option)
    ?reserved_normalized_units:(reserved_normalized_units_ : reserved_normalized_units option)
    ?total_running_normalized_units:
      (total_running_normalized_units_ : total_running_normalized_units option)
    ?coverage_normalized_units_percentage:
      (coverage_normalized_units_percentage_ : coverage_normalized_units_percentage option) () =
  ({
     on_demand_normalized_units = on_demand_normalized_units_;
     reserved_normalized_units = reserved_normalized_units_;
     total_running_normalized_units = total_running_normalized_units_;
     coverage_normalized_units_percentage = coverage_normalized_units_percentage_;
   }
    : coverage_normalized_units)

let make_coverage_hours ?on_demand_hours:(on_demand_hours_ : on_demand_hours option)
    ?reserved_hours:(reserved_hours_ : reserved_hours option)
    ?total_running_hours:(total_running_hours_ : total_running_hours option)
    ?coverage_hours_percentage:(coverage_hours_percentage_ : coverage_hours_percentage option) () =
  ({
     on_demand_hours = on_demand_hours_;
     reserved_hours = reserved_hours_;
     total_running_hours = total_running_hours_;
     coverage_hours_percentage = coverage_hours_percentage_;
   }
    : coverage_hours)

let make_coverage ?coverage_hours:(coverage_hours_ : coverage_hours option)
    ?coverage_normalized_units:(coverage_normalized_units_ : coverage_normalized_units option)
    ?coverage_cost:(coverage_cost_ : coverage_cost option) () =
  ({
     coverage_hours = coverage_hours_;
     coverage_normalized_units = coverage_normalized_units_;
     coverage_cost = coverage_cost_;
   }
    : coverage)

let make_reservation_coverage_group ?attributes:(attributes_ : attributes option)
    ?coverage:(coverage_ : coverage option) () =
  ({ attributes = attributes_; coverage = coverage_ } : reservation_coverage_group)

let make_coverage_by_time ?time_period:(time_period_ : date_interval option)
    ?groups:(groups_ : reservation_coverage_groups option) ?total:(total_ : coverage option) () =
  ({ time_period = time_period_; groups = groups_; total = total_ } : coverage_by_time)

let make_get_reservation_coverage_response ?total:(total_ : coverage option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~coverages_by_time:(coverages_by_time_ : coverages_by_time) () =
  ({ coverages_by_time = coverages_by_time_; total = total_; next_page_token = next_page_token_ }
    : get_reservation_coverage_response)

let make_get_reservation_coverage_request ?group_by:(group_by_ : group_definitions option)
    ?granularity:(granularity_ : granularity option) ?filter:(filter_ : expression option)
    ?metrics:(metrics_ : metric_names option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?sort_by:(sort_by_ : sort_definition option) ?max_results:(max_results_ : max_results option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     time_period = time_period_;
     group_by = group_by_;
     granularity = granularity_;
     filter = filter_;
     metrics = metrics_;
     next_page_token = next_page_token_;
     sort_by = sort_by_;
     max_results = max_results_;
   }
    : get_reservation_coverage_request)

let make_dimension_values_with_attributes ?value:(value_ : value option)
    ?attributes:(attributes_ : attributes option) () =
  ({ value = value_; attributes = attributes_ } : dimension_values_with_attributes)

let make_get_dimension_values_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~dimension_values:(dimension_values_ : dimension_values_with_attributes_list)
    ~return_size:(return_size_ : page_size) ~total_size:(total_size_ : page_size) () =
  ({
     dimension_values = dimension_values_;
     return_size = return_size_;
     total_size = total_size_;
     next_page_token = next_page_token_;
   }
    : get_dimension_values_response)

let make_get_dimension_values_request ?search_string:(search_string_ : search_string option)
    ?context:(context_ : context option) ?filter:(filter_ : expression option)
    ?sort_by:(sort_by_ : sort_definitions option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?max_results:(max_results_ : max_results option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~time_period:(time_period_ : date_interval) ~dimension:(dimension_ : dimension) () =
  ({
     search_string = search_string_;
     time_period = time_period_;
     dimension = dimension_;
     context = context_;
     filter = filter_;
     sort_by = sort_by_;
     billing_view_arn = billing_view_arn_;
     max_results = max_results_;
     next_page_token = next_page_token_;
   }
    : get_dimension_values_request)

let make_get_cost_forecast_response ?total:(total_ : metric_value option)
    ?forecast_results_by_time:(forecast_results_by_time_ : forecast_results_by_time option) () =
  ({ total = total_; forecast_results_by_time = forecast_results_by_time_ }
    : get_cost_forecast_response)

let make_get_cost_forecast_request ?filter:(filter_ : expression option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?prediction_interval_level:(prediction_interval_level_ : prediction_interval_level option)
    ~time_period:(time_period_ : date_interval) ~metric:(metric_ : metric)
    ~granularity:(granularity_ : granularity) () =
  ({
     time_period = time_period_;
     metric = metric_;
     granularity = granularity_;
     filter = filter_;
     billing_view_arn = billing_view_arn_;
     prediction_interval_level = prediction_interval_level_;
   }
    : get_cost_forecast_request)

let make_comparison_metric_value
    ?baseline_time_period_amount:(baseline_time_period_amount_ : generic_string option)
    ?comparison_time_period_amount:(comparison_time_period_amount_ : generic_string option)
    ?difference:(difference_ : generic_string option) ?unit_:(unit__ : generic_string option) () =
  ({
     baseline_time_period_amount = baseline_time_period_amount_;
     comparison_time_period_amount = comparison_time_period_amount_;
     difference = difference_;
     unit_ = unit__;
   }
    : comparison_metric_value)

let make_cost_driver ?type_:(type__ : generic_string option) ?name:(name_ : generic_string option)
    ?metrics:(metrics_ : comparison_metrics option) () =
  ({ type_ = type__; name = name_; metrics = metrics_ } : cost_driver)

let make_cost_comparison_driver ?cost_selector:(cost_selector_ : expression option)
    ?metrics:(metrics_ : comparison_metrics option)
    ?cost_drivers:(cost_drivers_ : cost_drivers option) () =
  ({ cost_selector = cost_selector_; metrics = metrics_; cost_drivers = cost_drivers_ }
    : cost_comparison_driver)

let make_get_cost_comparison_drivers_response
    ?cost_comparison_drivers:(cost_comparison_drivers_ : cost_comparison_drivers option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({ cost_comparison_drivers = cost_comparison_drivers_; next_page_token = next_page_token_ }
    : get_cost_comparison_drivers_response)

let make_get_cost_comparison_drivers_request
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?filter:(filter_ : expression option) ?group_by:(group_by_ : group_definitions option)
    ?max_results:(max_results_ : cost_comparison_drivers_max_results option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~baseline_time_period:(baseline_time_period_ : date_interval)
    ~comparison_time_period:(comparison_time_period_ : date_interval)
    ~metric_for_comparison:(metric_for_comparison_ : metric_name) () =
  ({
     billing_view_arn = billing_view_arn_;
     baseline_time_period = baseline_time_period_;
     comparison_time_period = comparison_time_period_;
     metric_for_comparison = metric_for_comparison_;
     filter = filter_;
     group_by = group_by_;
     max_results = max_results_;
     next_page_token = next_page_token_;
   }
    : get_cost_comparison_drivers_request)

let make_get_cost_categories_response ?next_page_token:(next_page_token_ : next_page_token option)
    ?cost_category_names:(cost_category_names_ : cost_category_names_list option)
    ?cost_category_values:(cost_category_values_ : cost_category_values_list option)
    ~return_size:(return_size_ : page_size) ~total_size:(total_size_ : page_size) () =
  ({
     next_page_token = next_page_token_;
     cost_category_names = cost_category_names_;
     cost_category_values = cost_category_values_;
     return_size = return_size_;
     total_size = total_size_;
   }
    : get_cost_categories_response)

let make_get_cost_categories_request ?search_string:(search_string_ : search_string option)
    ?cost_category_name:(cost_category_name_ : cost_category_name option)
    ?filter:(filter_ : expression option) ?sort_by:(sort_by_ : sort_definitions option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?max_results:(max_results_ : max_results option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     search_string = search_string_;
     time_period = time_period_;
     cost_category_name = cost_category_name_;
     filter = filter_;
     sort_by = sort_by_;
     billing_view_arn = billing_view_arn_;
     max_results = max_results_;
     next_page_token = next_page_token_;
   }
    : get_cost_categories_request)

let make_group ?keys:(keys_ : keys option) ?metrics:(metrics_ : metrics option) () =
  ({ keys = keys_; metrics = metrics_ } : group)

let make_result_by_time ?time_period:(time_period_ : date_interval option)
    ?total:(total_ : metrics option) ?groups:(groups_ : groups option)
    ?estimated:(estimated_ : estimated option) () =
  ({ time_period = time_period_; total = total_; groups = groups_; estimated = estimated_ }
    : result_by_time)

let make_get_cost_and_usage_with_resources_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?group_definitions:(group_definitions_ : group_definitions option)
    ?results_by_time:(results_by_time_ : results_by_time option)
    ?dimension_value_attributes:
      (dimension_value_attributes_ : dimension_values_with_attributes_list option) () =
  ({
     next_page_token = next_page_token_;
     group_definitions = group_definitions_;
     results_by_time = results_by_time_;
     dimension_value_attributes = dimension_value_attributes_;
   }
    : get_cost_and_usage_with_resources_response)

let make_get_cost_and_usage_with_resources_request ?metrics:(metrics_ : metric_names option)
    ?group_by:(group_by_ : group_definitions option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~time_period:(time_period_ : date_interval) ~granularity:(granularity_ : granularity)
    ~filter:(filter_ : expression) () =
  ({
     time_period = time_period_;
     granularity = granularity_;
     filter = filter_;
     metrics = metrics_;
     group_by = group_by_;
     billing_view_arn = billing_view_arn_;
     next_page_token = next_page_token_;
   }
    : get_cost_and_usage_with_resources_request)

let make_cost_and_usage_comparison
    ?cost_and_usage_selector:(cost_and_usage_selector_ : expression option)
    ?metrics:(metrics_ : comparison_metrics option) () =
  ({ cost_and_usage_selector = cost_and_usage_selector_; metrics = metrics_ }
    : cost_and_usage_comparison)

let make_get_cost_and_usage_comparisons_response
    ?cost_and_usage_comparisons:(cost_and_usage_comparisons_ : cost_and_usage_comparisons option)
    ?total_cost_and_usage:(total_cost_and_usage_ : comparison_metrics option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({
     cost_and_usage_comparisons = cost_and_usage_comparisons_;
     total_cost_and_usage = total_cost_and_usage_;
     next_page_token = next_page_token_;
   }
    : get_cost_and_usage_comparisons_response)

let make_get_cost_and_usage_comparisons_request
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?filter:(filter_ : expression option) ?group_by:(group_by_ : group_definitions option)
    ?max_results:(max_results_ : cost_and_usage_comparisons_max_results option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~baseline_time_period:(baseline_time_period_ : date_interval)
    ~comparison_time_period:(comparison_time_period_ : date_interval)
    ~metric_for_comparison:(metric_for_comparison_ : metric_name) () =
  ({
     billing_view_arn = billing_view_arn_;
     baseline_time_period = baseline_time_period_;
     comparison_time_period = comparison_time_period_;
     metric_for_comparison = metric_for_comparison_;
     filter = filter_;
     group_by = group_by_;
     max_results = max_results_;
     next_page_token = next_page_token_;
   }
    : get_cost_and_usage_comparisons_request)

let make_get_cost_and_usage_response ?next_page_token:(next_page_token_ : next_page_token option)
    ?group_definitions:(group_definitions_ : group_definitions option)
    ?results_by_time:(results_by_time_ : results_by_time option)
    ?dimension_value_attributes:
      (dimension_value_attributes_ : dimension_values_with_attributes_list option) () =
  ({
     next_page_token = next_page_token_;
     group_definitions = group_definitions_;
     results_by_time = results_by_time_;
     dimension_value_attributes = dimension_value_attributes_;
   }
    : get_cost_and_usage_response)

let make_get_cost_and_usage_request ?filter:(filter_ : expression option)
    ?group_by:(group_by_ : group_definitions option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~time_period:(time_period_ : date_interval) ~granularity:(granularity_ : granularity)
    ~metrics:(metrics_ : metric_names) () =
  ({
     time_period = time_period_;
     granularity = granularity_;
     filter = filter_;
     metrics = metrics_;
     group_by = group_by_;
     billing_view_arn = billing_view_arn_;
     next_page_token = next_page_token_;
   }
    : get_cost_and_usage_request)

let make_savings_plans_purchase_analysis_details
    ?currency_code:(currency_code_ : generic_string option)
    ?lookback_period_in_hours:(lookback_period_in_hours_ : generic_string option)
    ?current_average_coverage:(current_average_coverage_ : generic_string option)
    ?current_average_hourly_on_demand_spend:
      (current_average_hourly_on_demand_spend_ : generic_string option)
    ?current_maximum_hourly_on_demand_spend:
      (current_maximum_hourly_on_demand_spend_ : generic_string option)
    ?current_minimum_hourly_on_demand_spend:
      (current_minimum_hourly_on_demand_spend_ : generic_string option)
    ?current_on_demand_spend:(current_on_demand_spend_ : generic_string option)
    ?existing_hourly_commitment:(existing_hourly_commitment_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?estimated_average_coverage:(estimated_average_coverage_ : generic_string option)
    ?estimated_average_utilization:(estimated_average_utilization_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option)
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?estimated_commitment_cost:(estimated_commitment_cost_ : generic_string option)
    ?latest_usage_timestamp:(latest_usage_timestamp_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?additional_metadata:(additional_metadata_ : generic_string option)
    ?metrics_over_lookback_period:
      (metrics_over_lookback_period_ : metrics_over_lookback_period option) () =
  ({
     currency_code = currency_code_;
     lookback_period_in_hours = lookback_period_in_hours_;
     current_average_coverage = current_average_coverage_;
     current_average_hourly_on_demand_spend = current_average_hourly_on_demand_spend_;
     current_maximum_hourly_on_demand_spend = current_maximum_hourly_on_demand_spend_;
     current_minimum_hourly_on_demand_spend = current_minimum_hourly_on_demand_spend_;
     current_on_demand_spend = current_on_demand_spend_;
     existing_hourly_commitment = existing_hourly_commitment_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     estimated_average_coverage = estimated_average_coverage_;
     estimated_average_utilization = estimated_average_utilization_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
     estimated_ro_i = estimated_ro_i_;
     estimated_savings_amount = estimated_savings_amount_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_commitment_cost = estimated_commitment_cost_;
     latest_usage_timestamp = latest_usage_timestamp_;
     upfront_cost = upfront_cost_;
     additional_metadata = additional_metadata_;
     metrics_over_lookback_period = metrics_over_lookback_period_;
   }
    : savings_plans_purchase_analysis_details)

let make_analysis_details
    ?savings_plans_purchase_analysis_details:
      (savings_plans_purchase_analysis_details_ : savings_plans_purchase_analysis_details option) ()
    =
  ({ savings_plans_purchase_analysis_details = savings_plans_purchase_analysis_details_ }
    : analysis_details)

let make_get_commitment_purchase_analysis_response
    ?analysis_completion_time:(analysis_completion_time_ : zoned_date_time option)
    ?error_code:(error_code_ : error_code option)
    ?analysis_details:(analysis_details_ : analysis_details option)
    ~estimated_completion_time:(estimated_completion_time_ : zoned_date_time)
    ~analysis_started_time:(analysis_started_time_ : zoned_date_time)
    ~analysis_id:(analysis_id_ : analysis_id) ~analysis_status:(analysis_status_ : analysis_status)
    ~commitment_purchase_analysis_configuration:
      (commitment_purchase_analysis_configuration_ : commitment_purchase_analysis_configuration) ()
    =
  ({
     estimated_completion_time = estimated_completion_time_;
     analysis_completion_time = analysis_completion_time_;
     analysis_started_time = analysis_started_time_;
     analysis_id = analysis_id_;
     analysis_status = analysis_status_;
     error_code = error_code_;
     analysis_details = analysis_details_;
     commitment_purchase_analysis_configuration = commitment_purchase_analysis_configuration_;
   }
    : get_commitment_purchase_analysis_response)

let make_get_commitment_purchase_analysis_request ~analysis_id:(analysis_id_ : analysis_id) () =
  ({ analysis_id = analysis_id_ } : get_commitment_purchase_analysis_request)

let make_get_approximate_usage_records_response
    ?services:(services_ : approximate_usage_records_per_service option)
    ?total_records:(total_records_ : non_negative_long option)
    ?lookback_period:(lookback_period_ : date_interval option) () =
  ({ services = services_; total_records = total_records_; lookback_period = lookback_period_ }
    : get_approximate_usage_records_response)

let make_get_approximate_usage_records_request ?services:(services_ : usage_services option)
    ~granularity:(granularity_ : granularity)
    ~approximation_dimension:(approximation_dimension_ : approximation_dimension) () =
  ({
     granularity = granularity_;
     services = services_;
     approximation_dimension = approximation_dimension_;
   }
    : get_approximate_usage_records_request)

let make_anomaly_subscription ?subscription_arn:(subscription_arn_ : generic_string option)
    ?account_id:(account_id_ : generic_string option)
    ?threshold:(threshold_ : nullable_non_negative_double option)
    ?threshold_expression:(threshold_expression_ : expression option)
    ~monitor_arn_list:(monitor_arn_list_ : monitor_arn_list)
    ~subscribers:(subscribers_ : subscribers)
    ~frequency:(frequency_ : anomaly_subscription_frequency)
    ~subscription_name:(subscription_name_ : generic_string) () =
  ({
     subscription_arn = subscription_arn_;
     account_id = account_id_;
     monitor_arn_list = monitor_arn_list_;
     subscribers = subscribers_;
     threshold = threshold_;
     frequency = frequency_;
     subscription_name = subscription_name_;
     threshold_expression = threshold_expression_;
   }
    : anomaly_subscription)

let make_get_anomaly_subscriptions_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~anomaly_subscriptions:(anomaly_subscriptions_ : anomaly_subscriptions) () =
  ({ anomaly_subscriptions = anomaly_subscriptions_; next_page_token = next_page_token_ }
    : get_anomaly_subscriptions_response)

let make_get_anomaly_subscriptions_request
    ?subscription_arn_list:(subscription_arn_list_ : values option)
    ?monitor_arn:(monitor_arn_ : generic_string option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : page_size option) () =
  ({
     subscription_arn_list = subscription_arn_list_;
     monitor_arn = monitor_arn_;
     next_page_token = next_page_token_;
     max_results = max_results_;
   }
    : get_anomaly_subscriptions_request)

let make_anomaly_monitor ?monitor_arn:(monitor_arn_ : generic_string option)
    ?creation_date:(creation_date_ : year_month_day option)
    ?last_updated_date:(last_updated_date_ : year_month_day option)
    ?last_evaluated_date:(last_evaluated_date_ : year_month_day option)
    ?monitor_dimension:(monitor_dimension_ : monitor_dimension option)
    ?monitor_specification:(monitor_specification_ : expression option)
    ?dimensional_value_count:(dimensional_value_count_ : non_negative_integer option)
    ~monitor_name:(monitor_name_ : generic_string) ~monitor_type:(monitor_type_ : monitor_type) () =
  ({
     monitor_arn = monitor_arn_;
     monitor_name = monitor_name_;
     creation_date = creation_date_;
     last_updated_date = last_updated_date_;
     last_evaluated_date = last_evaluated_date_;
     monitor_type = monitor_type_;
     monitor_dimension = monitor_dimension_;
     monitor_specification = monitor_specification_;
     dimensional_value_count = dimensional_value_count_;
   }
    : anomaly_monitor)

let make_get_anomaly_monitors_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~anomaly_monitors:(anomaly_monitors_ : anomaly_monitors) () =
  ({ anomaly_monitors = anomaly_monitors_; next_page_token = next_page_token_ }
    : get_anomaly_monitors_response)

let make_get_anomaly_monitors_request ?monitor_arn_list:(monitor_arn_list_ : values option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : page_size option) () =
  ({
     monitor_arn_list = monitor_arn_list_;
     next_page_token = next_page_token_;
     max_results = max_results_;
   }
    : get_anomaly_monitors_request)

let make_impact ?total_impact:(total_impact_ : generic_double option)
    ?total_actual_spend:(total_actual_spend_ : nullable_non_negative_double option)
    ?total_expected_spend:(total_expected_spend_ : nullable_non_negative_double option)
    ?total_impact_percentage:(total_impact_percentage_ : nullable_non_negative_double option)
    ~max_impact:(max_impact_ : generic_double) () =
  ({
     max_impact = max_impact_;
     total_impact = total_impact_;
     total_actual_spend = total_actual_spend_;
     total_expected_spend = total_expected_spend_;
     total_impact_percentage = total_impact_percentage_;
   }
    : impact)

let make_anomaly_score ~max_score:(max_score_ : generic_double)
    ~current_score:(current_score_ : generic_double) () =
  ({ max_score = max_score_; current_score = current_score_ } : anomaly_score)

let make_root_cause_impact ~contribution:(contribution_ : generic_double) () =
  ({ contribution = contribution_ } : root_cause_impact)

let make_root_cause ?service:(service_ : generic_string option)
    ?region:(region_ : generic_string option)
    ?linked_account:(linked_account_ : generic_string option)
    ?linked_account_name:(linked_account_name_ : generic_string option)
    ?usage_type:(usage_type_ : generic_string option) ?impact:(impact_ : root_cause_impact option)
    () =
  ({
     service = service_;
     region = region_;
     linked_account = linked_account_;
     linked_account_name = linked_account_name_;
     usage_type = usage_type_;
     impact = impact_;
   }
    : root_cause)

let make_anomaly ?anomaly_start_date:(anomaly_start_date_ : year_month_day option)
    ?anomaly_end_date:(anomaly_end_date_ : year_month_day option)
    ?dimension_value:(dimension_value_ : generic_string option)
    ?root_causes:(root_causes_ : root_causes option)
    ?feedback:(feedback_ : anomaly_feedback_type option) ~anomaly_id:(anomaly_id_ : generic_string)
    ~anomaly_score:(anomaly_score_ : anomaly_score) ~impact:(impact_ : impact)
    ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({
     anomaly_id = anomaly_id_;
     anomaly_start_date = anomaly_start_date_;
     anomaly_end_date = anomaly_end_date_;
     dimension_value = dimension_value_;
     root_causes = root_causes_;
     anomaly_score = anomaly_score_;
     impact = impact_;
     monitor_arn = monitor_arn_;
     feedback = feedback_;
   }
    : anomaly)

let make_get_anomalies_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~anomalies:(anomalies_ : anomalies) () =
  ({ anomalies = anomalies_; next_page_token = next_page_token_ } : get_anomalies_response)

let make_total_impact_filter ?end_value:(end_value_ : generic_double option)
    ~numeric_operator:(numeric_operator_ : numeric_operator)
    ~start_value:(start_value_ : generic_double) () =
  ({ numeric_operator = numeric_operator_; start_value = start_value_; end_value = end_value_ }
    : total_impact_filter)

let make_anomaly_date_interval ?end_date:(end_date_ : year_month_day option)
    ~start_date:(start_date_ : year_month_day) () =
  ({ start_date = start_date_; end_date = end_date_ } : anomaly_date_interval)

let make_get_anomalies_request ?monitor_arn:(monitor_arn_ : generic_string option)
    ?feedback:(feedback_ : anomaly_feedback_type option)
    ?total_impact:(total_impact_ : total_impact_filter option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : page_size option)
    ~date_interval:(date_interval_ : anomaly_date_interval) () =
  ({
     monitor_arn = monitor_arn_;
     date_interval = date_interval_;
     feedback = feedback_;
     total_impact = total_impact_;
     next_page_token = next_page_token_;
     max_results = max_results_;
   }
    : get_anomalies_request)

let make_cost_category ?effective_end:(effective_end_ : zoned_date_time option)
    ?split_charge_rules:(split_charge_rules_ : cost_category_split_charge_rules_list option)
    ?processing_status:(processing_status_ : cost_category_processing_status_list option)
    ?default_value:(default_value_ : cost_category_value option)
    ~cost_category_arn:(cost_category_arn_ : arn)
    ~effective_start:(effective_start_ : zoned_date_time) ~name:(name_ : cost_category_name)
    ~rule_version:(rule_version_ : cost_category_rule_version)
    ~rules:(rules_ : cost_category_rules_list) () =
  ({
     cost_category_arn = cost_category_arn_;
     effective_start = effective_start_;
     effective_end = effective_end_;
     name = name_;
     rule_version = rule_version_;
     rules = rules_;
     split_charge_rules = split_charge_rules_;
     processing_status = processing_status_;
     default_value = default_value_;
   }
    : cost_category)

let make_describe_cost_category_definition_response
    ?cost_category:(cost_category_ : cost_category option) () =
  ({ cost_category = cost_category_ } : describe_cost_category_definition_response)

let make_describe_cost_category_definition_request
    ?effective_on:(effective_on_ : zoned_date_time option)
    ~cost_category_arn:(cost_category_arn_ : arn) () =
  ({ cost_category_arn = cost_category_arn_; effective_on = effective_on_ }
    : describe_cost_category_definition_request)

let make_delete_cost_category_definition_response
    ?cost_category_arn:(cost_category_arn_ : arn option)
    ?effective_end:(effective_end_ : zoned_date_time option) () =
  ({ cost_category_arn = cost_category_arn_; effective_end = effective_end_ }
    : delete_cost_category_definition_response)

let make_delete_cost_category_definition_request ~cost_category_arn:(cost_category_arn_ : arn) () =
  ({ cost_category_arn = cost_category_arn_ } : delete_cost_category_definition_request)

let make_delete_anomaly_subscription_response () = (() : unit)

let make_delete_anomaly_subscription_request ~subscription_arn:(subscription_arn_ : generic_string)
    () =
  ({ subscription_arn = subscription_arn_ } : delete_anomaly_subscription_request)

let make_delete_anomaly_monitor_response () = (() : unit)

let make_delete_anomaly_monitor_request ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({ monitor_arn = monitor_arn_ } : delete_anomaly_monitor_request)

let make_create_cost_category_definition_response
    ?cost_category_arn:(cost_category_arn_ : arn option)
    ?effective_start:(effective_start_ : zoned_date_time option) () =
  ({ cost_category_arn = cost_category_arn_; effective_start = effective_start_ }
    : create_cost_category_definition_response)

let make_create_cost_category_definition_request
    ?effective_start:(effective_start_ : zoned_date_time option)
    ?default_value:(default_value_ : cost_category_value option)
    ?split_charge_rules:(split_charge_rules_ : cost_category_split_charge_rules_list option)
    ?resource_tags:(resource_tags_ : resource_tag_list option) ~name:(name_ : cost_category_name)
    ~rule_version:(rule_version_ : cost_category_rule_version)
    ~rules:(rules_ : cost_category_rules_list) () =
  ({
     name = name_;
     effective_start = effective_start_;
     rule_version = rule_version_;
     rules = rules_;
     default_value = default_value_;
     split_charge_rules = split_charge_rules_;
     resource_tags = resource_tags_;
   }
    : create_cost_category_definition_request)

let make_create_anomaly_subscription_response ~subscription_arn:(subscription_arn_ : generic_string)
    () =
  ({ subscription_arn = subscription_arn_ } : create_anomaly_subscription_response)

let make_create_anomaly_subscription_request
    ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~anomaly_subscription:(anomaly_subscription_ : anomaly_subscription) () =
  ({ anomaly_subscription = anomaly_subscription_; resource_tags = resource_tags_ }
    : create_anomaly_subscription_request)

let make_create_anomaly_monitor_response ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({ monitor_arn = monitor_arn_ } : create_anomaly_monitor_response)

let make_create_anomaly_monitor_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~anomaly_monitor:(anomaly_monitor_ : anomaly_monitor) () =
  ({ anomaly_monitor = anomaly_monitor_; resource_tags = resource_tags_ }
    : create_anomaly_monitor_request)
