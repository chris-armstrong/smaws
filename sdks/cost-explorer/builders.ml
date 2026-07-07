open Types

let make_date_interval ~end_:(end__ : year_month_day) ~start:(start_ : year_month_day) () =
  ({ end_ = end__; start = start_ } : date_interval)

let make_reservation_aggregates
    ?unrealized_savings:(unrealized_savings_ : unrealized_savings option)
    ?realized_savings:(realized_savings_ : realized_savings option)
    ?ri_cost_for_unused_hours:(ri_cost_for_unused_hours_ : ri_cost_for_unused_hours option)
    ?total_amortized_fee:(total_amortized_fee_ : total_amortized_fee option)
    ?amortized_recurring_fee:(amortized_recurring_fee_ : amortized_recurring_fee option)
    ?amortized_upfront_fee:(amortized_upfront_fee_ : amortized_upfront_fee option)
    ?total_potential_ri_savings:(total_potential_ri_savings_ : total_potential_ri_savings option)
    ?net_ri_savings:(net_ri_savings_ : net_ri_savings option)
    ?on_demand_cost_of_ri_hours_used:
      (on_demand_cost_of_ri_hours_used_ : on_demand_cost_of_ri_hours_used option)
    ?unused_units:(unused_units_ : unused_units option)
    ?unused_hours:(unused_hours_ : unused_hours option)
    ?total_actual_units:(total_actual_units_ : total_actual_units option)
    ?total_actual_hours:(total_actual_hours_ : total_actual_hours option)
    ?purchased_units:(purchased_units_ : purchased_units option)
    ?purchased_hours:(purchased_hours_ : purchased_hours option)
    ?utilization_percentage_in_units:
      (utilization_percentage_in_units_ : utilization_percentage_in_units option)
    ?utilization_percentage:(utilization_percentage_ : utilization_percentage option) () =
  ({
     unrealized_savings = unrealized_savings_;
     realized_savings = realized_savings_;
     ri_cost_for_unused_hours = ri_cost_for_unused_hours_;
     total_amortized_fee = total_amortized_fee_;
     amortized_recurring_fee = amortized_recurring_fee_;
     amortized_upfront_fee = amortized_upfront_fee_;
     total_potential_ri_savings = total_potential_ri_savings_;
     net_ri_savings = net_ri_savings_;
     on_demand_cost_of_ri_hours_used = on_demand_cost_of_ri_hours_used_;
     unused_units = unused_units_;
     unused_hours = unused_hours_;
     total_actual_units = total_actual_units_;
     total_actual_hours = total_actual_hours_;
     purchased_units = purchased_units_;
     purchased_hours = purchased_hours_;
     utilization_percentage_in_units = utilization_percentage_in_units_;
     utilization_percentage = utilization_percentage_;
   }
    : reservation_aggregates)

let make_reservation_utilization_group ?utilization:(utilization_ : reservation_aggregates option)
    ?attributes:(attributes_ : attributes option) ?value:(value_ : reservation_group_value option)
    ?key:(key_ : reservation_group_key option) () =
  ({ utilization = utilization_; attributes = attributes_; value = value_; key = key_ }
    : reservation_utilization_group)

let make_utilization_by_time ?total:(total_ : reservation_aggregates option)
    ?groups:(groups_ : reservation_utilization_groups option)
    ?time_period:(time_period_ : date_interval option) () =
  ({ total = total_; groups = groups_; time_period = time_period_ } : utilization_by_time)

let make_update_cost_category_definition_response
    ?effective_start:(effective_start_ : zoned_date_time option)
    ?cost_category_arn:(cost_category_arn_ : arn option) () =
  ({ effective_start = effective_start_; cost_category_arn = cost_category_arn_ }
    : update_cost_category_definition_response)

let make_dimension_values ?match_options:(match_options_ : match_options option)
    ?values:(values_ : values option) ?key:(key_ : dimension option) () =
  ({ match_options = match_options_; values = values_; key = key_ } : dimension_values)

let make_tag_values ?match_options:(match_options_ : match_options option)
    ?values:(values_ : values option) ?key:(key_ : tag_key option) () =
  ({ match_options = match_options_; values = values_; key = key_ } : tag_values)

let make_cost_category_values ?match_options:(match_options_ : match_options option)
    ?values:(values_ : values option) ?key:(key_ : cost_category_name option) () =
  ({ match_options = match_options_; values = values_; key = key_ } : cost_category_values)

let make_expression ?cost_categories:(cost_categories_ : cost_category_values option)
    ?tags:(tags_ : tag_values option) ?dimensions:(dimensions_ : dimension_values option)
    ?not:(not_ : expression option) ?and_:(and__ : expressions option)
    ?\#or:(or_ : expressions option) () =
  ({
     cost_categories = cost_categories_;
     tags = tags_;
     dimensions = dimensions_;
     not = not_;
     and_ = and__;
     \#or = or_;
   }
    : expression)

let make_cost_category_inherited_value_dimension
    ?dimension_key:(dimension_key_ : generic_string option)
    ?dimension_name:(dimension_name_ : cost_category_inherited_value_dimension_name option) () =
  ({ dimension_key = dimension_key_; dimension_name = dimension_name_ }
    : cost_category_inherited_value_dimension)

let make_cost_category_rule ?type_:(type__ : cost_category_rule_type option)
    ?inherited_value:(inherited_value_ : cost_category_inherited_value_dimension option)
    ?rule:(rule_ : expression option) ?value:(value_ : cost_category_value option) () =
  ({ type_ = type__; inherited_value = inherited_value_; rule = rule_; value = value_ }
    : cost_category_rule)

let make_cost_category_split_charge_rule_parameter
    ~values:(values_ : cost_category_split_charge_rule_parameter_values_list)
    ~type_:(type__ : cost_category_split_charge_rule_parameter_type) () =
  ({ values = values_; type_ = type__ } : cost_category_split_charge_rule_parameter)

let make_cost_category_split_charge_rule
    ?parameters:(parameters_ : cost_category_split_charge_rule_parameters_list option)
    ~method_:(method__ : cost_category_split_charge_method)
    ~targets:(targets_ : cost_category_split_charge_rule_targets_list)
    ~source:(source_ : generic_string) () =
  ({ parameters = parameters_; method_ = method__; targets = targets_; source = source_ }
    : cost_category_split_charge_rule)

let make_update_cost_category_definition_request
    ?split_charge_rules:(split_charge_rules_ : cost_category_split_charge_rules_list option)
    ?default_value:(default_value_ : cost_category_value option)
    ?effective_start:(effective_start_ : zoned_date_time option)
    ~rules:(rules_ : cost_category_rules_list)
    ~rule_version:(rule_version_ : cost_category_rule_version)
    ~cost_category_arn:(cost_category_arn_ : arn) () =
  ({
     split_charge_rules = split_charge_rules_;
     default_value = default_value_;
     rules = rules_;
     rule_version = rule_version_;
     effective_start = effective_start_;
     cost_category_arn = cost_category_arn_;
   }
    : update_cost_category_definition_request)

let make_update_cost_allocation_tags_status_error ?message:(message_ : error_message option)
    ?code:(code_ : generic_string option) ?tag_key:(tag_key_ : tag_key option) () =
  ({ message = message_; code = code_; tag_key = tag_key_ }
    : update_cost_allocation_tags_status_error)

let make_update_cost_allocation_tags_status_response
    ?errors:(errors_ : update_cost_allocation_tags_status_errors option) () =
  ({ errors = errors_ } : update_cost_allocation_tags_status_response)

let make_cost_allocation_tag_status_entry ~status:(status_ : cost_allocation_tag_status)
    ~tag_key:(tag_key_ : tag_key) () =
  ({ status = status_; tag_key = tag_key_ } : cost_allocation_tag_status_entry)

let make_update_cost_allocation_tags_status_request
    ~cost_allocation_tags_status:(cost_allocation_tags_status_ : cost_allocation_tag_status_list) ()
    =
  ({ cost_allocation_tags_status = cost_allocation_tags_status_ }
    : update_cost_allocation_tags_status_request)

let make_update_anomaly_subscription_response ~subscription_arn:(subscription_arn_ : generic_string)
    () =
  ({ subscription_arn = subscription_arn_ } : update_anomaly_subscription_response)

let make_subscriber ?status:(status_ : subscriber_status option)
    ?type_:(type__ : subscriber_type option) ?address:(address_ : subscriber_address option) () =
  ({ status = status_; type_ = type__; address = address_ } : subscriber)

let make_update_anomaly_subscription_request
    ?threshold_expression:(threshold_expression_ : expression option)
    ?subscription_name:(subscription_name_ : generic_string option)
    ?subscribers:(subscribers_ : subscribers option)
    ?monitor_arn_list:(monitor_arn_list_ : monitor_arn_list option)
    ?frequency:(frequency_ : anomaly_subscription_frequency option)
    ?threshold:(threshold_ : nullable_non_negative_double option)
    ~subscription_arn:(subscription_arn_ : generic_string) () =
  ({
     threshold_expression = threshold_expression_;
     subscription_name = subscription_name_;
     subscribers = subscribers_;
     monitor_arn_list = monitor_arn_list_;
     frequency = frequency_;
     threshold = threshold_;
     subscription_arn = subscription_arn_;
   }
    : update_anomaly_subscription_request)

let make_update_anomaly_monitor_response ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({ monitor_arn = monitor_arn_ } : update_anomaly_monitor_response)

let make_update_anomaly_monitor_request ?monitor_name:(monitor_name_ : generic_string option)
    ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({ monitor_name = monitor_name_; monitor_arn = monitor_arn_ } : update_anomaly_monitor_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_tag_keys:(resource_tag_keys_ : resource_tag_key_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_tag_keys = resource_tag_keys_; resource_arn = resource_arn_ }
    : untag_resource_request)

let make_total_impact_filter ?end_value:(end_value_ : generic_double option)
    ~start_value:(start_value_ : generic_double)
    ~numeric_operator:(numeric_operator_ : numeric_operator) () =
  ({ end_value = end_value_; start_value = start_value_; numeric_operator = numeric_operator_ }
    : total_impact_filter)

let make_terminate_recommendation_detail ?currency_code:(currency_code_ : generic_string option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : generic_string option) () =
  ({ currency_code = currency_code_; estimated_monthly_savings = estimated_monthly_savings_ }
    : terminate_recommendation_detail)

let make_ec2_resource_details ?vcpu:(vcpu_ : generic_string option)
    ?storage:(storage_ : generic_string option)
    ?network_performance:(network_performance_ : generic_string option)
    ?memory:(memory_ : generic_string option) ?sku:(sku_ : generic_string option)
    ?region:(region_ : generic_string option) ?platform:(platform_ : generic_string option)
    ?instance_type:(instance_type_ : generic_string option)
    ?hourly_on_demand_rate:(hourly_on_demand_rate_ : generic_string option) () =
  ({
     vcpu = vcpu_;
     storage = storage_;
     network_performance = network_performance_;
     memory = memory_;
     sku = sku_;
     region = region_;
     platform = platform_;
     instance_type = instance_type_;
     hourly_on_demand_rate = hourly_on_demand_rate_;
   }
    : ec2_resource_details)

let make_resource_details
    ?ec2_resource_details:(ec2_resource_details_ : ec2_resource_details option) () =
  ({ ec2_resource_details = ec2_resource_details_ } : resource_details)

let make_ebs_resource_utilization
    ?ebs_write_bytes_per_second:(ebs_write_bytes_per_second_ : generic_string option)
    ?ebs_read_bytes_per_second:(ebs_read_bytes_per_second_ : generic_string option)
    ?ebs_write_ops_per_second:(ebs_write_ops_per_second_ : generic_string option)
    ?ebs_read_ops_per_second:(ebs_read_ops_per_second_ : generic_string option) () =
  ({
     ebs_write_bytes_per_second = ebs_write_bytes_per_second_;
     ebs_read_bytes_per_second = ebs_read_bytes_per_second_;
     ebs_write_ops_per_second = ebs_write_ops_per_second_;
     ebs_read_ops_per_second = ebs_read_ops_per_second_;
   }
    : ebs_resource_utilization)

let make_disk_resource_utilization
    ?disk_write_bytes_per_second:(disk_write_bytes_per_second_ : generic_string option)
    ?disk_read_bytes_per_second:(disk_read_bytes_per_second_ : generic_string option)
    ?disk_write_ops_per_second:(disk_write_ops_per_second_ : generic_string option)
    ?disk_read_ops_per_second:(disk_read_ops_per_second_ : generic_string option) () =
  ({
     disk_write_bytes_per_second = disk_write_bytes_per_second_;
     disk_read_bytes_per_second = disk_read_bytes_per_second_;
     disk_write_ops_per_second = disk_write_ops_per_second_;
     disk_read_ops_per_second = disk_read_ops_per_second_;
   }
    : disk_resource_utilization)

let make_network_resource_utilization
    ?network_packets_out_per_second:(network_packets_out_per_second_ : generic_string option)
    ?network_packets_in_per_second:(network_packets_in_per_second_ : generic_string option)
    ?network_out_bytes_per_second:(network_out_bytes_per_second_ : generic_string option)
    ?network_in_bytes_per_second:(network_in_bytes_per_second_ : generic_string option) () =
  ({
     network_packets_out_per_second = network_packets_out_per_second_;
     network_packets_in_per_second = network_packets_in_per_second_;
     network_out_bytes_per_second = network_out_bytes_per_second_;
     network_in_bytes_per_second = network_in_bytes_per_second_;
   }
    : network_resource_utilization)

let make_ec2_resource_utilization
    ?network_resource_utilization:
      (network_resource_utilization_ : network_resource_utilization option)
    ?disk_resource_utilization:(disk_resource_utilization_ : disk_resource_utilization option)
    ?ebs_resource_utilization:(ebs_resource_utilization_ : ebs_resource_utilization option)
    ?max_storage_utilization_percentage:
      (max_storage_utilization_percentage_ : generic_string option)
    ?max_memory_utilization_percentage:(max_memory_utilization_percentage_ : generic_string option)
    ?max_cpu_utilization_percentage:(max_cpu_utilization_percentage_ : generic_string option) () =
  ({
     network_resource_utilization = network_resource_utilization_;
     disk_resource_utilization = disk_resource_utilization_;
     ebs_resource_utilization = ebs_resource_utilization_;
     max_storage_utilization_percentage = max_storage_utilization_percentage_;
     max_memory_utilization_percentage = max_memory_utilization_percentage_;
     max_cpu_utilization_percentage = max_cpu_utilization_percentage_;
   }
    : ec2_resource_utilization)

let make_resource_utilization
    ?ec2_resource_utilization:(ec2_resource_utilization_ : ec2_resource_utilization option) () =
  ({ ec2_resource_utilization = ec2_resource_utilization_ } : resource_utilization)

let make_target_instance ?platform_differences:(platform_differences_ : platform_differences option)
    ?expected_resource_utilization:(expected_resource_utilization_ : resource_utilization option)
    ?resource_details:(resource_details_ : resource_details option)
    ?default_target_instance:(default_target_instance_ : generic_boolean option)
    ?currency_code:(currency_code_ : generic_string option)
    ?estimated_monthly_savings:(estimated_monthly_savings_ : generic_string option)
    ?estimated_monthly_cost:(estimated_monthly_cost_ : generic_string option) () =
  ({
     platform_differences = platform_differences_;
     expected_resource_utilization = expected_resource_utilization_;
     resource_details = resource_details_;
     default_target_instance = default_target_instance_;
     currency_code = currency_code_;
     estimated_monthly_savings = estimated_monthly_savings_;
     estimated_monthly_cost = estimated_monthly_cost_;
   }
    : target_instance)

let make_tag_resource_response () = (() : unit)

let make_resource_tag ~value:(value_ : resource_tag_value) ~key:(key_ : resource_tag_key) () =
  ({ value = value_; key = key_ } : resource_tag)

let make_tag_resource_request ~resource_tags:(resource_tags_ : resource_tag_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_tags = resource_tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_start_savings_plans_purchase_recommendation_generation_response
    ?estimated_completion_time:(estimated_completion_time_ : zoned_date_time option)
    ?generation_started_time:(generation_started_time_ : zoned_date_time option)
    ?recommendation_id:(recommendation_id_ : recommendation_id option) () =
  ({
     estimated_completion_time = estimated_completion_time_;
     generation_started_time = generation_started_time_;
     recommendation_id = recommendation_id_;
   }
    : start_savings_plans_purchase_recommendation_generation_response)

let make_start_savings_plans_purchase_recommendation_generation_request () = (() : unit)

let make_cost_allocation_tag_backfill_request
    ?last_updated_at:(last_updated_at_ : zoned_date_time option)
    ?backfill_status:(backfill_status_ : cost_allocation_tag_backfill_status option)
    ?completed_at:(completed_at_ : zoned_date_time option)
    ?requested_at:(requested_at_ : zoned_date_time option)
    ?backfill_from:(backfill_from_ : zoned_date_time option) () =
  ({
     last_updated_at = last_updated_at_;
     backfill_status = backfill_status_;
     completed_at = completed_at_;
     requested_at = requested_at_;
     backfill_from = backfill_from_;
   }
    : cost_allocation_tag_backfill_request)

let make_start_cost_allocation_tag_backfill_response
    ?backfill_request:(backfill_request_ : cost_allocation_tag_backfill_request option) () =
  ({ backfill_request = backfill_request_ } : start_cost_allocation_tag_backfill_response)

let make_start_cost_allocation_tag_backfill_request
    ~backfill_from:(backfill_from_ : zoned_date_time) () =
  ({ backfill_from = backfill_from_ } : start_cost_allocation_tag_backfill_request)

let make_start_commitment_purchase_analysis_response
    ~estimated_completion_time:(estimated_completion_time_ : zoned_date_time)
    ~analysis_started_time:(analysis_started_time_ : zoned_date_time)
    ~analysis_id:(analysis_id_ : analysis_id) () =
  ({
     estimated_completion_time = estimated_completion_time_;
     analysis_started_time = analysis_started_time_;
     analysis_id = analysis_id_;
   }
    : start_commitment_purchase_analysis_response)

let make_savings_plans ?offering_id:(offering_id_ : generic_string option)
    ?savings_plans_commitment:(savings_plans_commitment_ : savings_plans_commitment option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?instance_family:(instance_family_ : generic_string option)
    ?region:(region_ : generic_string option)
    ?savings_plans_type:(savings_plans_type_ : supported_savings_plans_type option)
    ?payment_option:(payment_option_ : payment_option option) () =
  ({
     offering_id = offering_id_;
     savings_plans_commitment = savings_plans_commitment_;
     term_in_years = term_in_years_;
     instance_family = instance_family_;
     region = region_;
     savings_plans_type = savings_plans_type_;
     payment_option = payment_option_;
   }
    : savings_plans)

let make_savings_plans_purchase_analysis_configuration
    ?savings_plans_target_coverage:
      (savings_plans_target_coverage_ : savings_plans_target_coverage option)
    ?savings_plans_to_exclude:(savings_plans_to_exclude_ : savings_plans_to_exclude option)
    ?account_id:(account_id_ : account_id option)
    ?account_scope:(account_scope_ : account_scope option)
    ~look_back_time_period:(look_back_time_period_ : date_interval)
    ~savings_plans_to_add:(savings_plans_to_add_ : savings_plans_to_add)
    ~analysis_type:(analysis_type_ : analysis_type) () =
  ({
     savings_plans_target_coverage = savings_plans_target_coverage_;
     look_back_time_period = look_back_time_period_;
     savings_plans_to_exclude = savings_plans_to_exclude_;
     savings_plans_to_add = savings_plans_to_add_;
     analysis_type = analysis_type_;
     account_id = account_id_;
     account_scope = account_scope_;
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

let make_sort_definition ?sort_order:(sort_order_ : sort_order option)
    ~key:(key_ : sort_definition_key) () =
  ({ sort_order = sort_order_; key = key_ } : sort_definition)

let make_ec2_specification ?offering_class:(offering_class_ : offering_class option) () =
  ({ offering_class = offering_class_ } : ec2_specification)

let make_service_specification ?ec2_specification:(ec2_specification_ : ec2_specification option) ()
    =
  ({ ec2_specification = ec2_specification_ } : service_specification)

let make_savings_plans_utilization
    ?utilization_percentage:(utilization_percentage_ : generic_string option)
    ?unused_commitment:(unused_commitment_ : generic_string option)
    ?used_commitment:(used_commitment_ : generic_string option)
    ?total_commitment:(total_commitment_ : generic_string option) () =
  ({
     utilization_percentage = utilization_percentage_;
     unused_commitment = unused_commitment_;
     used_commitment = used_commitment_;
     total_commitment = total_commitment_;
   }
    : savings_plans_utilization)

let make_savings_plans_savings
    ?on_demand_cost_equivalent:(on_demand_cost_equivalent_ : generic_string option)
    ?net_savings:(net_savings_ : generic_string option) () =
  ({ on_demand_cost_equivalent = on_demand_cost_equivalent_; net_savings = net_savings_ }
    : savings_plans_savings)

let make_savings_plans_amortized_commitment
    ?total_amortized_commitment:(total_amortized_commitment_ : generic_string option)
    ?amortized_upfront_commitment:(amortized_upfront_commitment_ : generic_string option)
    ?amortized_recurring_commitment:(amortized_recurring_commitment_ : generic_string option) () =
  ({
     total_amortized_commitment = total_amortized_commitment_;
     amortized_upfront_commitment = amortized_upfront_commitment_;
     amortized_recurring_commitment = amortized_recurring_commitment_;
   }
    : savings_plans_amortized_commitment)

let make_savings_plans_utilization_by_time
    ?amortized_commitment:(amortized_commitment_ : savings_plans_amortized_commitment option)
    ?savings:(savings_ : savings_plans_savings option)
    ~utilization:(utilization_ : savings_plans_utilization)
    ~time_period:(time_period_ : date_interval) () =
  ({
     amortized_commitment = amortized_commitment_;
     savings = savings_;
     utilization = utilization_;
     time_period = time_period_;
   }
    : savings_plans_utilization_by_time)

let make_savings_plans_utilization_detail
    ?amortized_commitment:(amortized_commitment_ : savings_plans_amortized_commitment option)
    ?savings:(savings_ : savings_plans_savings option)
    ?utilization:(utilization_ : savings_plans_utilization option)
    ?attributes:(attributes_ : attributes option)
    ?savings_plan_arn:(savings_plan_arn_ : savings_plan_arn option) () =
  ({
     amortized_commitment = amortized_commitment_;
     savings = savings_;
     utilization = utilization_;
     attributes = attributes_;
     savings_plan_arn = savings_plan_arn_;
   }
    : savings_plans_utilization_detail)

let make_savings_plans_utilization_aggregates
    ?amortized_commitment:(amortized_commitment_ : savings_plans_amortized_commitment option)
    ?savings:(savings_ : savings_plans_savings option)
    ~utilization:(utilization_ : savings_plans_utilization) () =
  ({ amortized_commitment = amortized_commitment_; savings = savings_; utilization = utilization_ }
    : savings_plans_utilization_aggregates)

let make_savings_plans_purchase_recommendation_summary
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?daily_commitment_to_purchase:(daily_commitment_to_purchase_ : generic_string option)
    ?total_recommendation_count:(total_recommendation_count_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?current_on_demand_spend:(current_on_demand_spend_ : generic_string option)
    ?estimated_total_cost:(estimated_total_cost_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option) () =
  ({
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_savings_percentage = estimated_savings_percentage_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     daily_commitment_to_purchase = daily_commitment_to_purchase_;
     total_recommendation_count = total_recommendation_count_;
     estimated_savings_amount = estimated_savings_amount_;
     current_on_demand_spend = current_on_demand_spend_;
     estimated_total_cost = estimated_total_cost_;
     currency_code = currency_code_;
     estimated_ro_i = estimated_ro_i_;
   }
    : savings_plans_purchase_recommendation_summary)

let make_savings_plans_purchase_recommendation_metadata
    ?additional_metadata:(additional_metadata_ : generic_string option)
    ?generation_timestamp:(generation_timestamp_ : generic_string option)
    ?recommendation_id:(recommendation_id_ : generic_string option) () =
  ({
     additional_metadata = additional_metadata_;
     generation_timestamp = generation_timestamp_;
     recommendation_id = recommendation_id_;
   }
    : savings_plans_purchase_recommendation_metadata)

let make_savings_plans_details ?offering_id:(offering_id_ : generic_string option)
    ?instance_family:(instance_family_ : generic_string option)
    ?region:(region_ : generic_string option) () =
  ({ offering_id = offering_id_; instance_family = instance_family_; region = region_ }
    : savings_plans_details)

let make_savings_plans_purchase_recommendation_detail
    ?recommendation_detail_id:(recommendation_detail_id_ : recommendation_detail_id option)
    ?current_average_hourly_on_demand_spend:
      (current_average_hourly_on_demand_spend_ : generic_string option)
    ?current_maximum_hourly_on_demand_spend:
      (current_maximum_hourly_on_demand_spend_ : generic_string option)
    ?current_minimum_hourly_on_demand_spend:
      (current_minimum_hourly_on_demand_spend_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_average_utilization:(estimated_average_utilization_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?estimated_sp_cost:(estimated_sp_cost_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?account_id:(account_id_ : generic_string option)
    ?savings_plans_details:(savings_plans_details_ : savings_plans_details option) () =
  ({
     recommendation_detail_id = recommendation_detail_id_;
     current_average_hourly_on_demand_spend = current_average_hourly_on_demand_spend_;
     current_maximum_hourly_on_demand_spend = current_maximum_hourly_on_demand_spend_;
     current_minimum_hourly_on_demand_spend = current_minimum_hourly_on_demand_spend_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_average_utilization = estimated_average_utilization_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_savings_amount = estimated_savings_amount_;
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     estimated_sp_cost = estimated_sp_cost_;
     currency_code = currency_code_;
     estimated_ro_i = estimated_ro_i_;
     upfront_cost = upfront_cost_;
     account_id = account_id_;
     savings_plans_details = savings_plans_details_;
   }
    : savings_plans_purchase_recommendation_detail)

let make_savings_plans_purchase_recommendation
    ?savings_plans_purchase_recommendation_summary:
      (savings_plans_purchase_recommendation_summary_ :
         savings_plans_purchase_recommendation_summary option)
    ?savings_plans_purchase_recommendation_details:
      (savings_plans_purchase_recommendation_details_ :
         savings_plans_purchase_recommendation_detail_list option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?payment_option:(payment_option_ : payment_option option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?savings_plans_type:(savings_plans_type_ : supported_savings_plans_type option)
    ?account_scope:(account_scope_ : account_scope option) () =
  ({
     savings_plans_purchase_recommendation_summary = savings_plans_purchase_recommendation_summary_;
     savings_plans_purchase_recommendation_details = savings_plans_purchase_recommendation_details_;
     lookback_period_in_days = lookback_period_in_days_;
     payment_option = payment_option_;
     term_in_years = term_in_years_;
     savings_plans_type = savings_plans_type_;
     account_scope = account_scope_;
   }
    : savings_plans_purchase_recommendation)

let make_recommendation_detail_hourly_metrics
    ?estimated_new_commitment_utilization:
      (estimated_new_commitment_utilization_ : generic_string option)
    ?estimated_coverage:(estimated_coverage_ : generic_string option)
    ?current_coverage:(current_coverage_ : generic_string option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?start_time:(start_time_ : zoned_date_time option) () =
  ({
     estimated_new_commitment_utilization = estimated_new_commitment_utilization_;
     estimated_coverage = estimated_coverage_;
     current_coverage = current_coverage_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     start_time = start_time_;
   }
    : recommendation_detail_hourly_metrics)

let make_savings_plans_purchase_analysis_details
    ?metrics_over_lookback_period:
      (metrics_over_lookback_period_ : metrics_over_lookback_period option)
    ?additional_metadata:(additional_metadata_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?latest_usage_timestamp:(latest_usage_timestamp_ : generic_string option)
    ?estimated_commitment_cost:(estimated_commitment_cost_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option)
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_average_utilization:(estimated_average_utilization_ : generic_string option)
    ?estimated_average_coverage:(estimated_average_coverage_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?existing_hourly_commitment:(existing_hourly_commitment_ : generic_string option)
    ?current_on_demand_spend:(current_on_demand_spend_ : generic_string option)
    ?current_minimum_hourly_on_demand_spend:
      (current_minimum_hourly_on_demand_spend_ : generic_string option)
    ?current_maximum_hourly_on_demand_spend:
      (current_maximum_hourly_on_demand_spend_ : generic_string option)
    ?current_average_hourly_on_demand_spend:
      (current_average_hourly_on_demand_spend_ : generic_string option)
    ?current_average_coverage:(current_average_coverage_ : generic_string option)
    ?lookback_period_in_hours:(lookback_period_in_hours_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option) () =
  ({
     metrics_over_lookback_period = metrics_over_lookback_period_;
     additional_metadata = additional_metadata_;
     upfront_cost = upfront_cost_;
     latest_usage_timestamp = latest_usage_timestamp_;
     estimated_commitment_cost = estimated_commitment_cost_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_savings_amount = estimated_savings_amount_;
     estimated_ro_i = estimated_ro_i_;
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_average_utilization = estimated_average_utilization_;
     estimated_average_coverage = estimated_average_coverage_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     existing_hourly_commitment = existing_hourly_commitment_;
     current_on_demand_spend = current_on_demand_spend_;
     current_minimum_hourly_on_demand_spend = current_minimum_hourly_on_demand_spend_;
     current_maximum_hourly_on_demand_spend = current_maximum_hourly_on_demand_spend_;
     current_average_hourly_on_demand_spend = current_average_hourly_on_demand_spend_;
     current_average_coverage = current_average_coverage_;
     lookback_period_in_hours = lookback_period_in_hours_;
     currency_code = currency_code_;
   }
    : savings_plans_purchase_analysis_details)

let make_savings_plans_coverage_data
    ?coverage_percentage:(coverage_percentage_ : generic_string option)
    ?total_cost:(total_cost_ : generic_string option)
    ?on_demand_cost:(on_demand_cost_ : generic_string option)
    ?spend_covered_by_savings_plans:(spend_covered_by_savings_plans_ : generic_string option) () =
  ({
     coverage_percentage = coverage_percentage_;
     total_cost = total_cost_;
     on_demand_cost = on_demand_cost_;
     spend_covered_by_savings_plans = spend_covered_by_savings_plans_;
   }
    : savings_plans_coverage_data)

let make_savings_plans_coverage ?time_period:(time_period_ : date_interval option)
    ?coverage:(coverage_ : savings_plans_coverage_data option)
    ?attributes:(attributes_ : attributes option) () =
  ({ time_period = time_period_; coverage = coverage_; attributes = attributes_ }
    : savings_plans_coverage)

let make_root_cause_impact ~contribution:(contribution_ : generic_double) () =
  ({ contribution = contribution_ } : root_cause_impact)

let make_root_cause ?impact:(impact_ : root_cause_impact option)
    ?usage_type:(usage_type_ : generic_string option)
    ?linked_account_name:(linked_account_name_ : generic_string option)
    ?linked_account:(linked_account_ : generic_string option)
    ?region:(region_ : generic_string option) ?service:(service_ : generic_string option) () =
  ({
     impact = impact_;
     usage_type = usage_type_;
     linked_account_name = linked_account_name_;
     linked_account = linked_account_;
     region = region_;
     service = service_;
   }
    : root_cause)

let make_rightsizing_recommendation_summary
    ?savings_percentage:(savings_percentage_ : generic_string option)
    ?savings_currency_code:(savings_currency_code_ : generic_string option)
    ?estimated_total_monthly_savings_amount:
      (estimated_total_monthly_savings_amount_ : generic_string option)
    ?total_recommendation_count:(total_recommendation_count_ : generic_string option) () =
  ({
     savings_percentage = savings_percentage_;
     savings_currency_code = savings_currency_code_;
     estimated_total_monthly_savings_amount = estimated_total_monthly_savings_amount_;
     total_recommendation_count = total_recommendation_count_;
   }
    : rightsizing_recommendation_summary)

let make_rightsizing_recommendation_metadata
    ?additional_metadata:(additional_metadata_ : generic_string option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?generation_timestamp:(generation_timestamp_ : generic_string option)
    ?recommendation_id:(recommendation_id_ : generic_string option) () =
  ({
     additional_metadata = additional_metadata_;
     lookback_period_in_days = lookback_period_in_days_;
     generation_timestamp = generation_timestamp_;
     recommendation_id = recommendation_id_;
   }
    : rightsizing_recommendation_metadata)

let make_current_instance ?currency_code:(currency_code_ : generic_string option)
    ?monthly_cost:(monthly_cost_ : generic_string option)
    ?total_running_hours_in_lookback_period:
      (total_running_hours_in_lookback_period_ : generic_string option)
    ?on_demand_hours_in_lookback_period:
      (on_demand_hours_in_lookback_period_ : generic_string option)
    ?savings_plans_covered_hours_in_lookback_period:
      (savings_plans_covered_hours_in_lookback_period_ : generic_string option)
    ?reservation_covered_hours_in_lookback_period:
      (reservation_covered_hours_in_lookback_period_ : generic_string option)
    ?resource_utilization:(resource_utilization_ : resource_utilization option)
    ?resource_details:(resource_details_ : resource_details option)
    ?tags:(tags_ : tag_values_list option) ?instance_name:(instance_name_ : generic_string option)
    ?resource_id:(resource_id_ : generic_string option) () =
  ({
     currency_code = currency_code_;
     monthly_cost = monthly_cost_;
     total_running_hours_in_lookback_period = total_running_hours_in_lookback_period_;
     on_demand_hours_in_lookback_period = on_demand_hours_in_lookback_period_;
     savings_plans_covered_hours_in_lookback_period =
       savings_plans_covered_hours_in_lookback_period_;
     reservation_covered_hours_in_lookback_period = reservation_covered_hours_in_lookback_period_;
     resource_utilization = resource_utilization_;
     resource_details = resource_details_;
     tags = tags_;
     instance_name = instance_name_;
     resource_id = resource_id_;
   }
    : current_instance)

let make_modify_recommendation_detail
    ?target_instances:(target_instances_ : target_instances_list option) () =
  ({ target_instances = target_instances_ } : modify_recommendation_detail)

let make_rightsizing_recommendation
    ?finding_reason_codes:(finding_reason_codes_ : finding_reason_codes option)
    ?terminate_recommendation_detail:
      (terminate_recommendation_detail_ : terminate_recommendation_detail option)
    ?modify_recommendation_detail:
      (modify_recommendation_detail_ : modify_recommendation_detail option)
    ?rightsizing_type:(rightsizing_type_ : rightsizing_type option)
    ?current_instance:(current_instance_ : current_instance option)
    ?account_id:(account_id_ : generic_string option) () =
  ({
     finding_reason_codes = finding_reason_codes_;
     terminate_recommendation_detail = terminate_recommendation_detail_;
     modify_recommendation_detail = modify_recommendation_detail_;
     rightsizing_type = rightsizing_type_;
     current_instance = current_instance_;
     account_id = account_id_;
   }
    : rightsizing_recommendation)

let make_rightsizing_recommendation_configuration
    ~benefits_considered:(benefits_considered_ : generic_boolean)
    ~recommendation_target:(recommendation_target_ : recommendation_target) () =
  ({ benefits_considered = benefits_considered_; recommendation_target = recommendation_target_ }
    : rightsizing_recommendation_configuration)

let make_metric_value ?unit_:(unit__ : metric_unit option) ?amount:(amount_ : metric_amount option)
    () =
  ({ unit_ = unit__; amount = amount_ } : metric_value)

let make_group ?metrics:(metrics_ : metrics option) ?keys:(keys_ : keys option) () =
  ({ metrics = metrics_; keys = keys_ } : group)

let make_result_by_time ?estimated:(estimated_ : estimated option) ?groups:(groups_ : groups option)
    ?total:(total_ : metrics option) ?time_period:(time_period_ : date_interval option) () =
  ({ estimated = estimated_; groups = groups_; total = total_; time_period = time_period_ }
    : result_by_time)

let make_dynamo_db_capacity_details ?region:(region_ : generic_string option)
    ?capacity_units:(capacity_units_ : generic_string option) () =
  ({ region = region_; capacity_units = capacity_units_ } : dynamo_db_capacity_details)

let make_reserved_capacity_details
    ?dynamo_db_capacity_details:(dynamo_db_capacity_details_ : dynamo_db_capacity_details option) ()
    =
  ({ dynamo_db_capacity_details = dynamo_db_capacity_details_ } : reserved_capacity_details)

let make_ec2_instance_details ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?tenancy:(tenancy_ : generic_string option) ?platform:(platform_ : generic_string option)
    ?availability_zone:(availability_zone_ : generic_string option)
    ?region:(region_ : generic_string option)
    ?instance_type:(instance_type_ : generic_string option)
    ?family:(family_ : generic_string option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     tenancy = tenancy_;
     platform = platform_;
     availability_zone = availability_zone_;
     region = region_;
     instance_type = instance_type_;
     family = family_;
   }
    : ec2_instance_details)

let make_rds_instance_details ?deployment_model:(deployment_model_ : generic_string option)
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?license_model:(license_model_ : generic_string option)
    ?deployment_option:(deployment_option_ : generic_string option)
    ?database_edition:(database_edition_ : generic_string option)
    ?database_engine:(database_engine_ : generic_string option)
    ?region:(region_ : generic_string option)
    ?instance_type:(instance_type_ : generic_string option)
    ?family:(family_ : generic_string option) () =
  ({
     deployment_model = deployment_model_;
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     license_model = license_model_;
     deployment_option = deployment_option_;
     database_edition = database_edition_;
     database_engine = database_engine_;
     region = region_;
     instance_type = instance_type_;
     family = family_;
   }
    : rds_instance_details)

let make_redshift_instance_details
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?region:(region_ : generic_string option) ?node_type:(node_type_ : generic_string option)
    ?family:(family_ : generic_string option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     region = region_;
     node_type = node_type_;
     family = family_;
   }
    : redshift_instance_details)

let make_elasti_cache_instance_details
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?product_description:(product_description_ : generic_string option)
    ?region:(region_ : generic_string option) ?node_type:(node_type_ : generic_string option)
    ?family:(family_ : generic_string option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     product_description = product_description_;
     region = region_;
     node_type = node_type_;
     family = family_;
   }
    : elasti_cache_instance_details)

let make_es_instance_details ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?region:(region_ : generic_string option)
    ?instance_size:(instance_size_ : generic_string option)
    ?instance_class:(instance_class_ : generic_string option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     region = region_;
     instance_size = instance_size_;
     instance_class = instance_class_;
   }
    : es_instance_details)

let make_memory_db_instance_details
    ?size_flex_eligible:(size_flex_eligible_ : generic_boolean option)
    ?current_generation:(current_generation_ : generic_boolean option)
    ?region:(region_ : generic_string option) ?node_type:(node_type_ : generic_string option)
    ?family:(family_ : generic_string option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     region = region_;
     node_type = node_type_;
     family = family_;
   }
    : memory_db_instance_details)

let make_instance_details
    ?memory_db_instance_details:(memory_db_instance_details_ : memory_db_instance_details option)
    ?es_instance_details:(es_instance_details_ : es_instance_details option)
    ?elasti_cache_instance_details:
      (elasti_cache_instance_details_ : elasti_cache_instance_details option)
    ?redshift_instance_details:(redshift_instance_details_ : redshift_instance_details option)
    ?rds_instance_details:(rds_instance_details_ : rds_instance_details option)
    ?ec2_instance_details:(ec2_instance_details_ : ec2_instance_details option) () =
  ({
     memory_db_instance_details = memory_db_instance_details_;
     es_instance_details = es_instance_details_;
     elasti_cache_instance_details = elasti_cache_instance_details_;
     redshift_instance_details = redshift_instance_details_;
     rds_instance_details = rds_instance_details_;
     ec2_instance_details = ec2_instance_details_;
   }
    : instance_details)

let make_reservation_purchase_recommendation_detail
    ?average_number_of_capacity_units_used_per_hour:
      (average_number_of_capacity_units_used_per_hour_ : generic_string option)
    ?maximum_number_of_capacity_units_used_per_hour:
      (maximum_number_of_capacity_units_used_per_hour_ : generic_string option)
    ?minimum_number_of_capacity_units_used_per_hour:
      (minimum_number_of_capacity_units_used_per_hour_ : generic_string option)
    ?recommended_number_of_capacity_units_to_purchase:
      (recommended_number_of_capacity_units_to_purchase_ : generic_string option)
    ?reserved_capacity_details:(reserved_capacity_details_ : reserved_capacity_details option)
    ?recurring_standard_monthly_cost:(recurring_standard_monthly_cost_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?estimated_reservation_cost_for_lookback_period:
      (estimated_reservation_cost_for_lookback_period_ : generic_string option)
    ?estimated_monthly_on_demand_cost:(estimated_monthly_on_demand_cost_ : generic_string option)
    ?estimated_monthly_savings_percentage:
      (estimated_monthly_savings_percentage_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?estimated_break_even_in_months:(estimated_break_even_in_months_ : generic_string option)
    ?average_utilization:(average_utilization_ : generic_string option)
    ?average_normalized_units_used_per_hour:
      (average_normalized_units_used_per_hour_ : generic_string option)
    ?average_number_of_instances_used_per_hour:
      (average_number_of_instances_used_per_hour_ : generic_string option)
    ?maximum_normalized_units_used_per_hour:
      (maximum_normalized_units_used_per_hour_ : generic_string option)
    ?maximum_number_of_instances_used_per_hour:
      (maximum_number_of_instances_used_per_hour_ : generic_string option)
    ?minimum_normalized_units_used_per_hour:
      (minimum_normalized_units_used_per_hour_ : generic_string option)
    ?minimum_number_of_instances_used_per_hour:
      (minimum_number_of_instances_used_per_hour_ : generic_string option)
    ?recommended_normalized_units_to_purchase:
      (recommended_normalized_units_to_purchase_ : generic_string option)
    ?recommended_number_of_instances_to_purchase:
      (recommended_number_of_instances_to_purchase_ : generic_string option)
    ?instance_details:(instance_details_ : instance_details option)
    ?account_id:(account_id_ : generic_string option) () =
  ({
     average_number_of_capacity_units_used_per_hour =
       average_number_of_capacity_units_used_per_hour_;
     maximum_number_of_capacity_units_used_per_hour =
       maximum_number_of_capacity_units_used_per_hour_;
     minimum_number_of_capacity_units_used_per_hour =
       minimum_number_of_capacity_units_used_per_hour_;
     recommended_number_of_capacity_units_to_purchase =
       recommended_number_of_capacity_units_to_purchase_;
     reserved_capacity_details = reserved_capacity_details_;
     recurring_standard_monthly_cost = recurring_standard_monthly_cost_;
     upfront_cost = upfront_cost_;
     estimated_reservation_cost_for_lookback_period =
       estimated_reservation_cost_for_lookback_period_;
     estimated_monthly_on_demand_cost = estimated_monthly_on_demand_cost_;
     estimated_monthly_savings_percentage = estimated_monthly_savings_percentage_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     currency_code = currency_code_;
     estimated_break_even_in_months = estimated_break_even_in_months_;
     average_utilization = average_utilization_;
     average_normalized_units_used_per_hour = average_normalized_units_used_per_hour_;
     average_number_of_instances_used_per_hour = average_number_of_instances_used_per_hour_;
     maximum_normalized_units_used_per_hour = maximum_normalized_units_used_per_hour_;
     maximum_number_of_instances_used_per_hour = maximum_number_of_instances_used_per_hour_;
     minimum_normalized_units_used_per_hour = minimum_normalized_units_used_per_hour_;
     minimum_number_of_instances_used_per_hour = minimum_number_of_instances_used_per_hour_;
     recommended_normalized_units_to_purchase = recommended_normalized_units_to_purchase_;
     recommended_number_of_instances_to_purchase = recommended_number_of_instances_to_purchase_;
     instance_details = instance_details_;
     account_id = account_id_;
   }
    : reservation_purchase_recommendation_detail)

let make_reservation_purchase_recommendation_summary
    ?currency_code:(currency_code_ : generic_string option)
    ?total_estimated_monthly_savings_percentage:
      (total_estimated_monthly_savings_percentage_ : generic_string option)
    ?total_estimated_monthly_savings_amount:
      (total_estimated_monthly_savings_amount_ : generic_string option) () =
  ({
     currency_code = currency_code_;
     total_estimated_monthly_savings_percentage = total_estimated_monthly_savings_percentage_;
     total_estimated_monthly_savings_amount = total_estimated_monthly_savings_amount_;
   }
    : reservation_purchase_recommendation_summary)

let make_reservation_purchase_recommendation
    ?recommendation_summary:
      (recommendation_summary_ : reservation_purchase_recommendation_summary option)
    ?recommendation_details:
      (recommendation_details_ : reservation_purchase_recommendation_details option)
    ?service_specification:(service_specification_ : service_specification option)
    ?payment_option:(payment_option_ : payment_option option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?account_scope:(account_scope_ : account_scope option) () =
  ({
     recommendation_summary = recommendation_summary_;
     recommendation_details = recommendation_details_;
     service_specification = service_specification_;
     payment_option = payment_option_;
     term_in_years = term_in_years_;
     lookback_period_in_days = lookback_period_in_days_;
     account_scope = account_scope_;
   }
    : reservation_purchase_recommendation)

let make_reservation_purchase_recommendation_metadata
    ?additional_metadata:(additional_metadata_ : generic_string option)
    ?generation_timestamp:(generation_timestamp_ : generic_string option)
    ?recommendation_id:(recommendation_id_ : generic_string option) () =
  ({
     additional_metadata = additional_metadata_;
     generation_timestamp = generation_timestamp_;
     recommendation_id = recommendation_id_;
   }
    : reservation_purchase_recommendation_metadata)

let make_coverage_hours
    ?coverage_hours_percentage:(coverage_hours_percentage_ : coverage_hours_percentage option)
    ?total_running_hours:(total_running_hours_ : total_running_hours option)
    ?reserved_hours:(reserved_hours_ : reserved_hours option)
    ?on_demand_hours:(on_demand_hours_ : on_demand_hours option) () =
  ({
     coverage_hours_percentage = coverage_hours_percentage_;
     total_running_hours = total_running_hours_;
     reserved_hours = reserved_hours_;
     on_demand_hours = on_demand_hours_;
   }
    : coverage_hours)

let make_coverage_normalized_units
    ?coverage_normalized_units_percentage:
      (coverage_normalized_units_percentage_ : coverage_normalized_units_percentage option)
    ?total_running_normalized_units:
      (total_running_normalized_units_ : total_running_normalized_units option)
    ?reserved_normalized_units:(reserved_normalized_units_ : reserved_normalized_units option)
    ?on_demand_normalized_units:(on_demand_normalized_units_ : on_demand_normalized_units option) ()
    =
  ({
     coverage_normalized_units_percentage = coverage_normalized_units_percentage_;
     total_running_normalized_units = total_running_normalized_units_;
     reserved_normalized_units = reserved_normalized_units_;
     on_demand_normalized_units = on_demand_normalized_units_;
   }
    : coverage_normalized_units)

let make_coverage_cost ?on_demand_cost:(on_demand_cost_ : on_demand_cost option) () =
  ({ on_demand_cost = on_demand_cost_ } : coverage_cost)

let make_coverage ?coverage_cost:(coverage_cost_ : coverage_cost option)
    ?coverage_normalized_units:(coverage_normalized_units_ : coverage_normalized_units option)
    ?coverage_hours:(coverage_hours_ : coverage_hours option) () =
  ({
     coverage_cost = coverage_cost_;
     coverage_normalized_units = coverage_normalized_units_;
     coverage_hours = coverage_hours_;
   }
    : coverage)

let make_reservation_coverage_group ?coverage:(coverage_ : coverage option)
    ?attributes:(attributes_ : attributes option) () =
  ({ coverage = coverage_; attributes = attributes_ } : reservation_coverage_group)

let make_recommendation_detail_data
    ?metrics_over_lookback_period:
      (metrics_over_lookback_period_ : metrics_over_lookback_period option)
    ?estimated_average_coverage:(estimated_average_coverage_ : generic_string option)
    ?current_average_coverage:(current_average_coverage_ : generic_string option)
    ?upfront_cost:(upfront_cost_ : generic_string option)
    ?hourly_commitment_to_purchase:(hourly_commitment_to_purchase_ : generic_string option)
    ?existing_hourly_commitment:(existing_hourly_commitment_ : generic_string option)
    ?estimated_savings_percentage:(estimated_savings_percentage_ : generic_string option)
    ?estimated_savings_amount:(estimated_savings_amount_ : generic_string option)
    ?estimated_sp_cost:(estimated_sp_cost_ : generic_string option)
    ?estimated_ro_i:(estimated_ro_i_ : generic_string option)
    ?estimated_on_demand_cost_with_current_commitment:
      (estimated_on_demand_cost_with_current_commitment_ : generic_string option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : generic_string option)
    ?estimated_monthly_savings_amount:(estimated_monthly_savings_amount_ : generic_string option)
    ?estimated_average_utilization:(estimated_average_utilization_ : generic_string option)
    ?current_minimum_hourly_on_demand_spend:
      (current_minimum_hourly_on_demand_spend_ : generic_string option)
    ?current_maximum_hourly_on_demand_spend:
      (current_maximum_hourly_on_demand_spend_ : generic_string option)
    ?current_average_hourly_on_demand_spend:
      (current_average_hourly_on_demand_spend_ : generic_string option)
    ?latest_usage_timestamp:(latest_usage_timestamp_ : zoned_date_time option)
    ?generation_timestamp:(generation_timestamp_ : zoned_date_time option)
    ?offering_id:(offering_id_ : generic_string option) ?region:(region_ : generic_string option)
    ?instance_family:(instance_family_ : generic_string option)
    ?currency_code:(currency_code_ : generic_string option)
    ?account_id:(account_id_ : generic_string option)
    ?payment_option:(payment_option_ : payment_option option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?savings_plans_type:(savings_plans_type_ : supported_savings_plans_type option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?account_scope:(account_scope_ : account_scope option) () =
  ({
     metrics_over_lookback_period = metrics_over_lookback_period_;
     estimated_average_coverage = estimated_average_coverage_;
     current_average_coverage = current_average_coverage_;
     upfront_cost = upfront_cost_;
     hourly_commitment_to_purchase = hourly_commitment_to_purchase_;
     existing_hourly_commitment = existing_hourly_commitment_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_savings_amount = estimated_savings_amount_;
     estimated_sp_cost = estimated_sp_cost_;
     estimated_ro_i = estimated_ro_i_;
     estimated_on_demand_cost_with_current_commitment =
       estimated_on_demand_cost_with_current_commitment_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
     estimated_monthly_savings_amount = estimated_monthly_savings_amount_;
     estimated_average_utilization = estimated_average_utilization_;
     current_minimum_hourly_on_demand_spend = current_minimum_hourly_on_demand_spend_;
     current_maximum_hourly_on_demand_spend = current_maximum_hourly_on_demand_spend_;
     current_average_hourly_on_demand_spend = current_average_hourly_on_demand_spend_;
     latest_usage_timestamp = latest_usage_timestamp_;
     generation_timestamp = generation_timestamp_;
     offering_id = offering_id_;
     region = region_;
     instance_family = instance_family_;
     currency_code = currency_code_;
     account_id = account_id_;
     payment_option = payment_option_;
     term_in_years = term_in_years_;
     savings_plans_type = savings_plans_type_;
     lookback_period_in_days = lookback_period_in_days_;
     account_scope = account_scope_;
   }
    : recommendation_detail_data)

let make_provide_anomaly_feedback_response ~anomaly_id:(anomaly_id_ : generic_string) () =
  ({ anomaly_id = anomaly_id_ } : provide_anomaly_feedback_response)

let make_provide_anomaly_feedback_request ~feedback:(feedback_ : anomaly_feedback_type)
    ~anomaly_id:(anomaly_id_ : generic_string) () =
  ({ feedback = feedback_; anomaly_id = anomaly_id_ } : provide_anomaly_feedback_request)

let make_list_tags_for_resource_response ?resource_tags:(resource_tags_ : resource_tag_list option)
    () =
  ({ resource_tags = resource_tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_generation_summary
    ?estimated_completion_time:(estimated_completion_time_ : zoned_date_time option)
    ?generation_completion_time:(generation_completion_time_ : zoned_date_time option)
    ?generation_started_time:(generation_started_time_ : zoned_date_time option)
    ?generation_status:(generation_status_ : generation_status option)
    ?recommendation_id:(recommendation_id_ : recommendation_id option) () =
  ({
     estimated_completion_time = estimated_completion_time_;
     generation_completion_time = generation_completion_time_;
     generation_started_time = generation_started_time_;
     generation_status = generation_status_;
     recommendation_id = recommendation_id_;
   }
    : generation_summary)

let make_list_savings_plans_purchase_recommendation_generation_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?generation_summary_list:(generation_summary_list_ : generation_summary_list option) () =
  ({ next_page_token = next_page_token_; generation_summary_list = generation_summary_list_ }
    : list_savings_plans_purchase_recommendation_generation_response)

let make_list_savings_plans_purchase_recommendation_generation_request
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?page_size:(page_size_ : recommendations_page_size option)
    ?recommendation_ids:(recommendation_ids_ : recommendation_id_list option)
    ?generation_status:(generation_status_ : generation_status option) () =
  ({
     next_page_token = next_page_token_;
     page_size = page_size_;
     recommendation_ids = recommendation_ids_;
     generation_status = generation_status_;
   }
    : list_savings_plans_purchase_recommendation_generation_request)

let make_cost_category_resource_association ?cost_category_arn:(cost_category_arn_ : arn option)
    ?cost_category_name:(cost_category_name_ : cost_category_name option)
    ?resource_arn:(resource_arn_ : generic_arn option) () =
  ({
     cost_category_arn = cost_category_arn_;
     cost_category_name = cost_category_name_;
     resource_arn = resource_arn_;
   }
    : cost_category_resource_association)

let make_list_cost_category_resource_associations_response
    ?next_token:(next_token_ : next_page_token option)
    ?cost_category_resource_associations:
      (cost_category_resource_associations_ : cost_category_resource_associations option) () =
  ({
     next_token = next_token_;
     cost_category_resource_associations = cost_category_resource_associations_;
   }
    : list_cost_category_resource_associations_response)

let make_list_cost_category_resource_associations_request
    ?max_results:(max_results_ : cost_category_max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?cost_category_arn:(cost_category_arn_ : arn option) () =
  ({ max_results = max_results_; next_token = next_token_; cost_category_arn = cost_category_arn_ }
    : list_cost_category_resource_associations_request)

let make_cost_category_processing_status ?status:(status_ : cost_category_status option)
    ?component:(component_ : cost_category_status_component option) () =
  ({ status = status_; component = component_ } : cost_category_processing_status)

let make_cost_category_reference
    ?supported_resource_types:(supported_resource_types_ : resource_types option)
    ?default_value:(default_value_ : cost_category_value option)
    ?values:(values_ : cost_category_values_list option)
    ?processing_status:(processing_status_ : cost_category_processing_status_list option)
    ?number_of_rules:(number_of_rules_ : non_negative_integer option)
    ?effective_end:(effective_end_ : zoned_date_time option)
    ?effective_start:(effective_start_ : zoned_date_time option)
    ?name:(name_ : cost_category_name option) ?cost_category_arn:(cost_category_arn_ : arn option)
    () =
  ({
     supported_resource_types = supported_resource_types_;
     default_value = default_value_;
     values = values_;
     processing_status = processing_status_;
     number_of_rules = number_of_rules_;
     effective_end = effective_end_;
     effective_start = effective_start_;
     name = name_;
     cost_category_arn = cost_category_arn_;
   }
    : cost_category_reference)

let make_list_cost_category_definitions_response ?next_token:(next_token_ : next_page_token option)
    ?cost_category_references:(cost_category_references_ : cost_category_references_list option) ()
    =
  ({ next_token = next_token_; cost_category_references = cost_category_references_ }
    : list_cost_category_definitions_response)

let make_list_cost_category_definitions_request
    ?supported_resource_types:(supported_resource_types_ : resource_types_filter_input option)
    ?max_results:(max_results_ : cost_category_max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?effective_on:(effective_on_ : zoned_date_time option) () =
  ({
     supported_resource_types = supported_resource_types_;
     max_results = max_results_;
     next_token = next_token_;
     effective_on = effective_on_;
   }
    : list_cost_category_definitions_request)

let make_cost_allocation_tag ?last_used_date:(last_used_date_ : zoned_date_time option)
    ?last_updated_date:(last_updated_date_ : zoned_date_time option)
    ~status:(status_ : cost_allocation_tag_status) ~type_:(type__ : cost_allocation_tag_type)
    ~tag_key:(tag_key_ : tag_key) () =
  ({
     last_used_date = last_used_date_;
     last_updated_date = last_updated_date_;
     status = status_;
     type_ = type__;
     tag_key = tag_key_;
   }
    : cost_allocation_tag)

let make_list_cost_allocation_tags_response ?next_token:(next_token_ : next_page_token option)
    ?cost_allocation_tags:(cost_allocation_tags_ : cost_allocation_tag_list option) () =
  ({ next_token = next_token_; cost_allocation_tags = cost_allocation_tags_ }
    : list_cost_allocation_tags_response)

let make_list_cost_allocation_tags_request
    ?max_results:(max_results_ : cost_allocation_tags_max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?type_:(type__ : cost_allocation_tag_type option)
    ?tag_keys:(tag_keys_ : cost_allocation_tag_key_list option)
    ?status:(status_ : cost_allocation_tag_status option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     type_ = type__;
     tag_keys = tag_keys_;
     status = status_;
   }
    : list_cost_allocation_tags_request)

let make_list_cost_allocation_tag_backfill_history_response
    ?next_token:(next_token_ : next_page_token option)
    ?backfill_requests:(backfill_requests_ : cost_allocation_tag_backfill_request_list option) () =
  ({ next_token = next_token_; backfill_requests = backfill_requests_ }
    : list_cost_allocation_tag_backfill_history_response)

let make_list_cost_allocation_tag_backfill_history_request
    ?max_results:(max_results_ : cost_allocation_tags_max_results option)
    ?next_token:(next_token_ : next_page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : list_cost_allocation_tag_backfill_history_request)

let make_analysis_summary
    ?commitment_purchase_analysis_configuration:
      (commitment_purchase_analysis_configuration_ :
         commitment_purchase_analysis_configuration option)
    ?analysis_id:(analysis_id_ : analysis_id option) ?error_code:(error_code_ : error_code option)
    ?analysis_status:(analysis_status_ : analysis_status option)
    ?analysis_started_time:(analysis_started_time_ : zoned_date_time option)
    ?analysis_completion_time:(analysis_completion_time_ : zoned_date_time option)
    ?estimated_completion_time:(estimated_completion_time_ : zoned_date_time option) () =
  ({
     commitment_purchase_analysis_configuration = commitment_purchase_analysis_configuration_;
     analysis_id = analysis_id_;
     error_code = error_code_;
     analysis_status = analysis_status_;
     analysis_started_time = analysis_started_time_;
     analysis_completion_time = analysis_completion_time_;
     estimated_completion_time = estimated_completion_time_;
   }
    : analysis_summary)

let make_list_commitment_purchase_analyses_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?analysis_summary_list:(analysis_summary_list_ : analysis_summary_list option) () =
  ({ next_page_token = next_page_token_; analysis_summary_list = analysis_summary_list_ }
    : list_commitment_purchase_analyses_response)

let make_list_commitment_purchase_analyses_request
    ?analysis_ids:(analysis_ids_ : analysis_ids option)
    ?page_size:(page_size_ : analyses_page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?analysis_status:(analysis_status_ : analysis_status option) () =
  ({
     analysis_ids = analysis_ids_;
     page_size = page_size_;
     next_page_token = next_page_token_;
     analysis_status = analysis_status_;
   }
    : list_commitment_purchase_analyses_request)

let make_impact
    ?total_impact_percentage:(total_impact_percentage_ : nullable_non_negative_double option)
    ?total_expected_spend:(total_expected_spend_ : nullable_non_negative_double option)
    ?total_actual_spend:(total_actual_spend_ : nullable_non_negative_double option)
    ?total_impact:(total_impact_ : generic_double option) ~max_impact:(max_impact_ : generic_double)
    () =
  ({
     total_impact_percentage = total_impact_percentage_;
     total_expected_spend = total_expected_spend_;
     total_actual_spend = total_actual_spend_;
     total_impact = total_impact_;
     max_impact = max_impact_;
   }
    : impact)

let make_group_definition ?key:(key_ : group_definition_key option)
    ?type_:(type__ : group_definition_type option) () =
  ({ key = key_; type_ = type__ } : group_definition)

let make_get_usage_forecast_response
    ?forecast_results_by_time:(forecast_results_by_time_ : forecast_results_by_time option)
    ?total:(total_ : metric_value option) () =
  ({ forecast_results_by_time = forecast_results_by_time_; total = total_ }
    : get_usage_forecast_response)

let make_get_usage_forecast_request
    ?prediction_interval_level:(prediction_interval_level_ : prediction_interval_level option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?filter:(filter_ : expression option) ~granularity:(granularity_ : granularity)
    ~metric:(metric_ : metric) ~time_period:(time_period_ : date_interval) () =
  ({
     prediction_interval_level = prediction_interval_level_;
     billing_view_arn = billing_view_arn_;
     filter = filter_;
     granularity = granularity_;
     metric = metric_;
     time_period = time_period_;
   }
    : get_usage_forecast_request)

let make_get_tags_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~total_size:(total_size_ : page_size) ~return_size:(return_size_ : page_size)
    ~tags:(tags_ : tag_list) () =
  ({
     total_size = total_size_;
     return_size = return_size_;
     tags = tags_;
     next_page_token = next_page_token_;
   }
    : get_tags_response)

let make_get_tags_request ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?sort_by:(sort_by_ : sort_definitions option) ?filter:(filter_ : expression option)
    ?tag_key:(tag_key_ : tag_key option) ?search_string:(search_string_ : search_string option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     next_page_token = next_page_token_;
     max_results = max_results_;
     billing_view_arn = billing_view_arn_;
     sort_by = sort_by_;
     filter = filter_;
     tag_key = tag_key_;
     time_period = time_period_;
     search_string = search_string_;
   }
    : get_tags_request)

let make_get_savings_plans_utilization_response
    ?savings_plans_utilizations_by_time:
      (savings_plans_utilizations_by_time_ : savings_plans_utilizations_by_time option)
    ~total:(total_ : savings_plans_utilization_aggregates) () =
  ({ total = total_; savings_plans_utilizations_by_time = savings_plans_utilizations_by_time_ }
    : get_savings_plans_utilization_response)

let make_get_savings_plans_utilization_request ?sort_by:(sort_by_ : sort_definition option)
    ?filter:(filter_ : expression option) ?granularity:(granularity_ : granularity option)
    ~time_period:(time_period_ : date_interval) () =
  ({ sort_by = sort_by_; filter = filter_; granularity = granularity_; time_period = time_period_ }
    : get_savings_plans_utilization_request)

let make_get_savings_plans_utilization_details_response
    ?next_token:(next_token_ : next_page_token option)
    ?total:(total_ : savings_plans_utilization_aggregates option)
    ~time_period:(time_period_ : date_interval)
    ~savings_plans_utilization_details:
      (savings_plans_utilization_details_ : savings_plans_utilization_details) () =
  ({
     next_token = next_token_;
     time_period = time_period_;
     total = total_;
     savings_plans_utilization_details = savings_plans_utilization_details_;
   }
    : get_savings_plans_utilization_details_response)

let make_get_savings_plans_utilization_details_request ?sort_by:(sort_by_ : sort_definition option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option)
    ?data_type:(data_type_ : savings_plans_data_types option) ?filter:(filter_ : expression option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
     data_type = data_type_;
     filter = filter_;
     time_period = time_period_;
   }
    : get_savings_plans_utilization_details_request)

let make_get_savings_plans_purchase_recommendation_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?savings_plans_purchase_recommendation:
      (savings_plans_purchase_recommendation_ : savings_plans_purchase_recommendation option)
    ?metadata:(metadata_ : savings_plans_purchase_recommendation_metadata option) () =
  ({
     next_page_token = next_page_token_;
     savings_plans_purchase_recommendation = savings_plans_purchase_recommendation_;
     metadata = metadata_;
   }
    : get_savings_plans_purchase_recommendation_response)

let make_get_savings_plans_purchase_recommendation_request ?filter:(filter_ : expression option)
    ?page_size:(page_size_ : recommendations_page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?account_scope:(account_scope_ : account_scope option)
    ~lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days)
    ~payment_option:(payment_option_ : payment_option)
    ~term_in_years:(term_in_years_ : term_in_years)
    ~savings_plans_type:(savings_plans_type_ : supported_savings_plans_type) () =
  ({
     filter = filter_;
     lookback_period_in_days = lookback_period_in_days_;
     page_size = page_size_;
     next_page_token = next_page_token_;
     account_scope = account_scope_;
     payment_option = payment_option_;
     term_in_years = term_in_years_;
     savings_plans_type = savings_plans_type_;
   }
    : get_savings_plans_purchase_recommendation_request)

let make_get_savings_plans_coverage_response ?next_token:(next_token_ : next_page_token option)
    ~savings_plans_coverages:(savings_plans_coverages_ : savings_plans_coverages) () =
  ({ next_token = next_token_; savings_plans_coverages = savings_plans_coverages_ }
    : get_savings_plans_coverage_response)

let make_get_savings_plans_coverage_request ?sort_by:(sort_by_ : sort_definition option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_page_token option) ?metrics:(metrics_ : metric_names option)
    ?filter:(filter_ : expression option) ?granularity:(granularity_ : granularity option)
    ?group_by:(group_by_ : group_definitions option) ~time_period:(time_period_ : date_interval) ()
    =
  ({
     sort_by = sort_by_;
     max_results = max_results_;
     next_token = next_token_;
     metrics = metrics_;
     filter = filter_;
     granularity = granularity_;
     group_by = group_by_;
     time_period = time_period_;
   }
    : get_savings_plans_coverage_request)

let make_get_savings_plan_purchase_recommendation_details_response
    ?recommendation_detail_data:(recommendation_detail_data_ : recommendation_detail_data option)
    ?recommendation_detail_id:(recommendation_detail_id_ : recommendation_detail_id option) () =
  ({
     recommendation_detail_data = recommendation_detail_data_;
     recommendation_detail_id = recommendation_detail_id_;
   }
    : get_savings_plan_purchase_recommendation_details_response)

let make_get_savings_plan_purchase_recommendation_details_request
    ~recommendation_detail_id:(recommendation_detail_id_ : recommendation_detail_id) () =
  ({ recommendation_detail_id = recommendation_detail_id_ }
    : get_savings_plan_purchase_recommendation_details_request)

let make_get_rightsizing_recommendation_response
    ?configuration:(configuration_ : rightsizing_recommendation_configuration option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?rightsizing_recommendations:
      (rightsizing_recommendations_ : rightsizing_recommendation_list option)
    ?summary:(summary_ : rightsizing_recommendation_summary option)
    ?metadata:(metadata_ : rightsizing_recommendation_metadata option) () =
  ({
     configuration = configuration_;
     next_page_token = next_page_token_;
     rightsizing_recommendations = rightsizing_recommendations_;
     summary = summary_;
     metadata = metadata_;
   }
    : get_rightsizing_recommendation_response)

let make_get_rightsizing_recommendation_request
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?page_size:(page_size_ : recommendations_page_size option)
    ?configuration:(configuration_ : rightsizing_recommendation_configuration option)
    ?filter:(filter_ : expression option) ~service:(service_ : generic_string) () =
  ({
     next_page_token = next_page_token_;
     page_size = page_size_;
     service = service_;
     configuration = configuration_;
     filter = filter_;
   }
    : get_rightsizing_recommendation_request)

let make_get_reservation_utilization_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?total:(total_ : reservation_aggregates option)
    ~utilizations_by_time:(utilizations_by_time_ : utilizations_by_time) () =
  ({
     next_page_token = next_page_token_;
     total = total_;
     utilizations_by_time = utilizations_by_time_;
   }
    : get_reservation_utilization_response)

let make_get_reservation_utilization_request ?max_results:(max_results_ : max_results option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?sort_by:(sort_by_ : sort_definition option) ?filter:(filter_ : expression option)
    ?granularity:(granularity_ : granularity option)
    ?group_by:(group_by_ : group_definitions option) ~time_period:(time_period_ : date_interval) ()
    =
  ({
     max_results = max_results_;
     next_page_token = next_page_token_;
     sort_by = sort_by_;
     filter = filter_;
     granularity = granularity_;
     group_by = group_by_;
     time_period = time_period_;
   }
    : get_reservation_utilization_request)

let make_get_reservation_purchase_recommendation_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?recommendations:(recommendations_ : reservation_purchase_recommendations option)
    ?metadata:(metadata_ : reservation_purchase_recommendation_metadata option) () =
  ({ next_page_token = next_page_token_; recommendations = recommendations_; metadata = metadata_ }
    : get_reservation_purchase_recommendation_response)

let make_get_reservation_purchase_recommendation_request
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?page_size:(page_size_ : recommendations_page_size option)
    ?service_specification:(service_specification_ : service_specification option)
    ?payment_option:(payment_option_ : payment_option option)
    ?term_in_years:(term_in_years_ : term_in_years option)
    ?lookback_period_in_days:(lookback_period_in_days_ : lookback_period_in_days option)
    ?account_scope:(account_scope_ : account_scope option) ?filter:(filter_ : expression option)
    ?account_id:(account_id_ : generic_string option) ~service:(service_ : generic_string) () =
  ({
     next_page_token = next_page_token_;
     page_size = page_size_;
     service_specification = service_specification_;
     payment_option = payment_option_;
     term_in_years = term_in_years_;
     lookback_period_in_days = lookback_period_in_days_;
     account_scope = account_scope_;
     filter = filter_;
     service = service_;
     account_id = account_id_;
   }
    : get_reservation_purchase_recommendation_request)

let make_coverage_by_time ?total:(total_ : coverage option)
    ?groups:(groups_ : reservation_coverage_groups option)
    ?time_period:(time_period_ : date_interval option) () =
  ({ total = total_; groups = groups_; time_period = time_period_ } : coverage_by_time)

let make_get_reservation_coverage_response
    ?next_page_token:(next_page_token_ : next_page_token option) ?total:(total_ : coverage option)
    ~coverages_by_time:(coverages_by_time_ : coverages_by_time) () =
  ({ next_page_token = next_page_token_; total = total_; coverages_by_time = coverages_by_time_ }
    : get_reservation_coverage_response)

let make_get_reservation_coverage_request ?max_results:(max_results_ : max_results option)
    ?sort_by:(sort_by_ : sort_definition option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?metrics:(metrics_ : metric_names option) ?filter:(filter_ : expression option)
    ?granularity:(granularity_ : granularity option)
    ?group_by:(group_by_ : group_definitions option) ~time_period:(time_period_ : date_interval) ()
    =
  ({
     max_results = max_results_;
     sort_by = sort_by_;
     next_page_token = next_page_token_;
     metrics = metrics_;
     filter = filter_;
     granularity = granularity_;
     group_by = group_by_;
     time_period = time_period_;
   }
    : get_reservation_coverage_request)

let make_dimension_values_with_attributes ?attributes:(attributes_ : attributes option)
    ?value:(value_ : value option) () =
  ({ attributes = attributes_; value = value_ } : dimension_values_with_attributes)

let make_get_dimension_values_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~total_size:(total_size_ : page_size) ~return_size:(return_size_ : page_size)
    ~dimension_values:(dimension_values_ : dimension_values_with_attributes_list) () =
  ({
     next_page_token = next_page_token_;
     total_size = total_size_;
     return_size = return_size_;
     dimension_values = dimension_values_;
   }
    : get_dimension_values_response)

let make_get_dimension_values_request ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?sort_by:(sort_by_ : sort_definitions option) ?filter:(filter_ : expression option)
    ?context:(context_ : context option) ?search_string:(search_string_ : search_string option)
    ~dimension:(dimension_ : dimension) ~time_period:(time_period_ : date_interval) () =
  ({
     next_page_token = next_page_token_;
     max_results = max_results_;
     billing_view_arn = billing_view_arn_;
     sort_by = sort_by_;
     filter = filter_;
     context = context_;
     dimension = dimension_;
     time_period = time_period_;
     search_string = search_string_;
   }
    : get_dimension_values_request)

let make_get_cost_forecast_response
    ?forecast_results_by_time:(forecast_results_by_time_ : forecast_results_by_time option)
    ?total:(total_ : metric_value option) () =
  ({ forecast_results_by_time = forecast_results_by_time_; total = total_ }
    : get_cost_forecast_response)

let make_get_cost_forecast_request
    ?prediction_interval_level:(prediction_interval_level_ : prediction_interval_level option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?filter:(filter_ : expression option) ~granularity:(granularity_ : granularity)
    ~metric:(metric_ : metric) ~time_period:(time_period_ : date_interval) () =
  ({
     prediction_interval_level = prediction_interval_level_;
     billing_view_arn = billing_view_arn_;
     filter = filter_;
     granularity = granularity_;
     metric = metric_;
     time_period = time_period_;
   }
    : get_cost_forecast_request)

let make_comparison_metric_value ?unit_:(unit__ : generic_string option)
    ?difference:(difference_ : generic_string option)
    ?comparison_time_period_amount:(comparison_time_period_amount_ : generic_string option)
    ?baseline_time_period_amount:(baseline_time_period_amount_ : generic_string option) () =
  ({
     unit_ = unit__;
     difference = difference_;
     comparison_time_period_amount = comparison_time_period_amount_;
     baseline_time_period_amount = baseline_time_period_amount_;
   }
    : comparison_metric_value)

let make_cost_driver ?metrics:(metrics_ : comparison_metrics option)
    ?name:(name_ : generic_string option) ?type_:(type__ : generic_string option) () =
  ({ metrics = metrics_; name = name_; type_ = type__ } : cost_driver)

let make_cost_comparison_driver ?cost_drivers:(cost_drivers_ : cost_drivers option)
    ?metrics:(metrics_ : comparison_metrics option)
    ?cost_selector:(cost_selector_ : expression option) () =
  ({ cost_drivers = cost_drivers_; metrics = metrics_; cost_selector = cost_selector_ }
    : cost_comparison_driver)

let make_get_cost_comparison_drivers_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?cost_comparison_drivers:(cost_comparison_drivers_ : cost_comparison_drivers option) () =
  ({ next_page_token = next_page_token_; cost_comparison_drivers = cost_comparison_drivers_ }
    : get_cost_comparison_drivers_response)

let make_get_cost_comparison_drivers_request
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : cost_comparison_drivers_max_results option)
    ?group_by:(group_by_ : group_definitions option) ?filter:(filter_ : expression option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ~metric_for_comparison:(metric_for_comparison_ : metric_name)
    ~comparison_time_period:(comparison_time_period_ : date_interval)
    ~baseline_time_period:(baseline_time_period_ : date_interval) () =
  ({
     next_page_token = next_page_token_;
     max_results = max_results_;
     group_by = group_by_;
     filter = filter_;
     metric_for_comparison = metric_for_comparison_;
     comparison_time_period = comparison_time_period_;
     baseline_time_period = baseline_time_period_;
     billing_view_arn = billing_view_arn_;
   }
    : get_cost_comparison_drivers_request)

let make_get_cost_categories_response
    ?cost_category_values:(cost_category_values_ : cost_category_values_list option)
    ?cost_category_names:(cost_category_names_ : cost_category_names_list option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~total_size:(total_size_ : page_size) ~return_size:(return_size_ : page_size) () =
  ({
     total_size = total_size_;
     return_size = return_size_;
     cost_category_values = cost_category_values_;
     cost_category_names = cost_category_names_;
     next_page_token = next_page_token_;
   }
    : get_cost_categories_response)

let make_get_cost_categories_request ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : max_results option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?sort_by:(sort_by_ : sort_definitions option) ?filter:(filter_ : expression option)
    ?cost_category_name:(cost_category_name_ : cost_category_name option)
    ?search_string:(search_string_ : search_string option)
    ~time_period:(time_period_ : date_interval) () =
  ({
     next_page_token = next_page_token_;
     max_results = max_results_;
     billing_view_arn = billing_view_arn_;
     sort_by = sort_by_;
     filter = filter_;
     cost_category_name = cost_category_name_;
     time_period = time_period_;
     search_string = search_string_;
   }
    : get_cost_categories_request)

let make_get_cost_and_usage_with_resources_response
    ?dimension_value_attributes:
      (dimension_value_attributes_ : dimension_values_with_attributes_list option)
    ?results_by_time:(results_by_time_ : results_by_time option)
    ?group_definitions:(group_definitions_ : group_definitions option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({
     dimension_value_attributes = dimension_value_attributes_;
     results_by_time = results_by_time_;
     group_definitions = group_definitions_;
     next_page_token = next_page_token_;
   }
    : get_cost_and_usage_with_resources_response)

let make_get_cost_and_usage_with_resources_request
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?group_by:(group_by_ : group_definitions option) ?metrics:(metrics_ : metric_names option)
    ~filter:(filter_ : expression) ~granularity:(granularity_ : granularity)
    ~time_period:(time_period_ : date_interval) () =
  ({
     next_page_token = next_page_token_;
     billing_view_arn = billing_view_arn_;
     group_by = group_by_;
     metrics = metrics_;
     filter = filter_;
     granularity = granularity_;
     time_period = time_period_;
   }
    : get_cost_and_usage_with_resources_request)

let make_get_cost_and_usage_response
    ?dimension_value_attributes:
      (dimension_value_attributes_ : dimension_values_with_attributes_list option)
    ?results_by_time:(results_by_time_ : results_by_time option)
    ?group_definitions:(group_definitions_ : group_definitions option)
    ?next_page_token:(next_page_token_ : next_page_token option) () =
  ({
     dimension_value_attributes = dimension_value_attributes_;
     results_by_time = results_by_time_;
     group_definitions = group_definitions_;
     next_page_token = next_page_token_;
   }
    : get_cost_and_usage_response)

let make_get_cost_and_usage_request ?next_page_token:(next_page_token_ : next_page_token option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ?group_by:(group_by_ : group_definitions option) ?filter:(filter_ : expression option)
    ~metrics:(metrics_ : metric_names) ~granularity:(granularity_ : granularity)
    ~time_period:(time_period_ : date_interval) () =
  ({
     next_page_token = next_page_token_;
     billing_view_arn = billing_view_arn_;
     group_by = group_by_;
     metrics = metrics_;
     filter = filter_;
     granularity = granularity_;
     time_period = time_period_;
   }
    : get_cost_and_usage_request)

let make_cost_and_usage_comparison ?metrics:(metrics_ : comparison_metrics option)
    ?cost_and_usage_selector:(cost_and_usage_selector_ : expression option) () =
  ({ metrics = metrics_; cost_and_usage_selector = cost_and_usage_selector_ }
    : cost_and_usage_comparison)

let make_get_cost_and_usage_comparisons_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?total_cost_and_usage:(total_cost_and_usage_ : comparison_metrics option)
    ?cost_and_usage_comparisons:(cost_and_usage_comparisons_ : cost_and_usage_comparisons option) ()
    =
  ({
     next_page_token = next_page_token_;
     total_cost_and_usage = total_cost_and_usage_;
     cost_and_usage_comparisons = cost_and_usage_comparisons_;
   }
    : get_cost_and_usage_comparisons_response)

let make_get_cost_and_usage_comparisons_request
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?max_results:(max_results_ : cost_and_usage_comparisons_max_results option)
    ?group_by:(group_by_ : group_definitions option) ?filter:(filter_ : expression option)
    ?billing_view_arn:(billing_view_arn_ : billing_view_arn option)
    ~metric_for_comparison:(metric_for_comparison_ : metric_name)
    ~comparison_time_period:(comparison_time_period_ : date_interval)
    ~baseline_time_period:(baseline_time_period_ : date_interval) () =
  ({
     next_page_token = next_page_token_;
     max_results = max_results_;
     group_by = group_by_;
     filter = filter_;
     metric_for_comparison = metric_for_comparison_;
     comparison_time_period = comparison_time_period_;
     baseline_time_period = baseline_time_period_;
     billing_view_arn = billing_view_arn_;
   }
    : get_cost_and_usage_comparisons_request)

let make_analysis_details
    ?savings_plans_purchase_analysis_details:
      (savings_plans_purchase_analysis_details_ : savings_plans_purchase_analysis_details option) ()
    =
  ({ savings_plans_purchase_analysis_details = savings_plans_purchase_analysis_details_ }
    : analysis_details)

let make_get_commitment_purchase_analysis_response
    ?analysis_details:(analysis_details_ : analysis_details option)
    ?error_code:(error_code_ : error_code option)
    ?analysis_completion_time:(analysis_completion_time_ : zoned_date_time option)
    ~commitment_purchase_analysis_configuration:
      (commitment_purchase_analysis_configuration_ : commitment_purchase_analysis_configuration)
    ~analysis_status:(analysis_status_ : analysis_status) ~analysis_id:(analysis_id_ : analysis_id)
    ~analysis_started_time:(analysis_started_time_ : zoned_date_time)
    ~estimated_completion_time:(estimated_completion_time_ : zoned_date_time) () =
  ({
     commitment_purchase_analysis_configuration = commitment_purchase_analysis_configuration_;
     analysis_details = analysis_details_;
     error_code = error_code_;
     analysis_status = analysis_status_;
     analysis_id = analysis_id_;
     analysis_started_time = analysis_started_time_;
     analysis_completion_time = analysis_completion_time_;
     estimated_completion_time = estimated_completion_time_;
   }
    : get_commitment_purchase_analysis_response)

let make_get_commitment_purchase_analysis_request ~analysis_id:(analysis_id_ : analysis_id) () =
  ({ analysis_id = analysis_id_ } : get_commitment_purchase_analysis_request)

let make_get_approximate_usage_records_response
    ?lookback_period:(lookback_period_ : date_interval option)
    ?total_records:(total_records_ : non_negative_long option)
    ?services:(services_ : approximate_usage_records_per_service option) () =
  ({ lookback_period = lookback_period_; total_records = total_records_; services = services_ }
    : get_approximate_usage_records_response)

let make_get_approximate_usage_records_request ?services:(services_ : usage_services option)
    ~approximation_dimension:(approximation_dimension_ : approximation_dimension)
    ~granularity:(granularity_ : granularity) () =
  ({
     approximation_dimension = approximation_dimension_;
     services = services_;
     granularity = granularity_;
   }
    : get_approximate_usage_records_request)

let make_anomaly_subscription ?threshold_expression:(threshold_expression_ : expression option)
    ?threshold:(threshold_ : nullable_non_negative_double option)
    ?account_id:(account_id_ : generic_string option)
    ?subscription_arn:(subscription_arn_ : generic_string option)
    ~subscription_name:(subscription_name_ : generic_string)
    ~frequency:(frequency_ : anomaly_subscription_frequency)
    ~subscribers:(subscribers_ : subscribers)
    ~monitor_arn_list:(monitor_arn_list_ : monitor_arn_list) () =
  ({
     threshold_expression = threshold_expression_;
     subscription_name = subscription_name_;
     frequency = frequency_;
     threshold = threshold_;
     subscribers = subscribers_;
     monitor_arn_list = monitor_arn_list_;
     account_id = account_id_;
     subscription_arn = subscription_arn_;
   }
    : anomaly_subscription)

let make_get_anomaly_subscriptions_response
    ?next_page_token:(next_page_token_ : next_page_token option)
    ~anomaly_subscriptions:(anomaly_subscriptions_ : anomaly_subscriptions) () =
  ({ next_page_token = next_page_token_; anomaly_subscriptions = anomaly_subscriptions_ }
    : get_anomaly_subscriptions_response)

let make_get_anomaly_subscriptions_request ?max_results:(max_results_ : page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?monitor_arn:(monitor_arn_ : generic_string option)
    ?subscription_arn_list:(subscription_arn_list_ : values option) () =
  ({
     max_results = max_results_;
     next_page_token = next_page_token_;
     monitor_arn = monitor_arn_;
     subscription_arn_list = subscription_arn_list_;
   }
    : get_anomaly_subscriptions_request)

let make_anomaly_monitor
    ?dimensional_value_count:(dimensional_value_count_ : non_negative_integer option)
    ?monitor_specification:(monitor_specification_ : expression option)
    ?monitor_dimension:(monitor_dimension_ : monitor_dimension option)
    ?last_evaluated_date:(last_evaluated_date_ : year_month_day option)
    ?last_updated_date:(last_updated_date_ : year_month_day option)
    ?creation_date:(creation_date_ : year_month_day option)
    ?monitor_arn:(monitor_arn_ : generic_string option) ~monitor_type:(monitor_type_ : monitor_type)
    ~monitor_name:(monitor_name_ : generic_string) () =
  ({
     dimensional_value_count = dimensional_value_count_;
     monitor_specification = monitor_specification_;
     monitor_dimension = monitor_dimension_;
     monitor_type = monitor_type_;
     last_evaluated_date = last_evaluated_date_;
     last_updated_date = last_updated_date_;
     creation_date = creation_date_;
     monitor_name = monitor_name_;
     monitor_arn = monitor_arn_;
   }
    : anomaly_monitor)

let make_get_anomaly_monitors_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~anomaly_monitors:(anomaly_monitors_ : anomaly_monitors) () =
  ({ next_page_token = next_page_token_; anomaly_monitors = anomaly_monitors_ }
    : get_anomaly_monitors_response)

let make_get_anomaly_monitors_request ?max_results:(max_results_ : page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?monitor_arn_list:(monitor_arn_list_ : values option) () =
  ({
     max_results = max_results_;
     next_page_token = next_page_token_;
     monitor_arn_list = monitor_arn_list_;
   }
    : get_anomaly_monitors_request)

let make_anomaly_score ~current_score:(current_score_ : generic_double)
    ~max_score:(max_score_ : generic_double) () =
  ({ current_score = current_score_; max_score = max_score_ } : anomaly_score)

let make_anomaly ?feedback:(feedback_ : anomaly_feedback_type option)
    ?root_causes:(root_causes_ : root_causes option)
    ?dimension_value:(dimension_value_ : generic_string option)
    ?anomaly_end_date:(anomaly_end_date_ : year_month_day option)
    ?anomaly_start_date:(anomaly_start_date_ : year_month_day option)
    ~monitor_arn:(monitor_arn_ : generic_string) ~impact:(impact_ : impact)
    ~anomaly_score:(anomaly_score_ : anomaly_score) ~anomaly_id:(anomaly_id_ : generic_string) () =
  ({
     feedback = feedback_;
     monitor_arn = monitor_arn_;
     impact = impact_;
     anomaly_score = anomaly_score_;
     root_causes = root_causes_;
     dimension_value = dimension_value_;
     anomaly_end_date = anomaly_end_date_;
     anomaly_start_date = anomaly_start_date_;
     anomaly_id = anomaly_id_;
   }
    : anomaly)

let make_get_anomalies_response ?next_page_token:(next_page_token_ : next_page_token option)
    ~anomalies:(anomalies_ : anomalies) () =
  ({ next_page_token = next_page_token_; anomalies = anomalies_ } : get_anomalies_response)

let make_anomaly_date_interval ?end_date:(end_date_ : year_month_day option)
    ~start_date:(start_date_ : year_month_day) () =
  ({ end_date = end_date_; start_date = start_date_ } : anomaly_date_interval)

let make_get_anomalies_request ?max_results:(max_results_ : page_size option)
    ?next_page_token:(next_page_token_ : next_page_token option)
    ?total_impact:(total_impact_ : total_impact_filter option)
    ?feedback:(feedback_ : anomaly_feedback_type option)
    ?monitor_arn:(monitor_arn_ : generic_string option)
    ~date_interval:(date_interval_ : anomaly_date_interval) () =
  ({
     max_results = max_results_;
     next_page_token = next_page_token_;
     total_impact = total_impact_;
     feedback = feedback_;
     date_interval = date_interval_;
     monitor_arn = monitor_arn_;
   }
    : get_anomalies_request)

let make_cost_category ?default_value:(default_value_ : cost_category_value option)
    ?processing_status:(processing_status_ : cost_category_processing_status_list option)
    ?split_charge_rules:(split_charge_rules_ : cost_category_split_charge_rules_list option)
    ?effective_end:(effective_end_ : zoned_date_time option)
    ~rules:(rules_ : cost_category_rules_list)
    ~rule_version:(rule_version_ : cost_category_rule_version) ~name:(name_ : cost_category_name)
    ~effective_start:(effective_start_ : zoned_date_time)
    ~cost_category_arn:(cost_category_arn_ : arn) () =
  ({
     default_value = default_value_;
     processing_status = processing_status_;
     split_charge_rules = split_charge_rules_;
     rules = rules_;
     rule_version = rule_version_;
     name = name_;
     effective_end = effective_end_;
     effective_start = effective_start_;
     cost_category_arn = cost_category_arn_;
   }
    : cost_category)

let make_describe_cost_category_definition_response
    ?cost_category:(cost_category_ : cost_category option) () =
  ({ cost_category = cost_category_ } : describe_cost_category_definition_response)

let make_describe_cost_category_definition_request
    ?effective_on:(effective_on_ : zoned_date_time option)
    ~cost_category_arn:(cost_category_arn_ : arn) () =
  ({ effective_on = effective_on_; cost_category_arn = cost_category_arn_ }
    : describe_cost_category_definition_request)

let make_delete_cost_category_definition_response
    ?effective_end:(effective_end_ : zoned_date_time option)
    ?cost_category_arn:(cost_category_arn_ : arn option) () =
  ({ effective_end = effective_end_; cost_category_arn = cost_category_arn_ }
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
    ?effective_start:(effective_start_ : zoned_date_time option)
    ?cost_category_arn:(cost_category_arn_ : arn option) () =
  ({ effective_start = effective_start_; cost_category_arn = cost_category_arn_ }
    : create_cost_category_definition_response)

let make_create_cost_category_definition_request
    ?resource_tags:(resource_tags_ : resource_tag_list option)
    ?split_charge_rules:(split_charge_rules_ : cost_category_split_charge_rules_list option)
    ?default_value:(default_value_ : cost_category_value option)
    ?effective_start:(effective_start_ : zoned_date_time option)
    ~rules:(rules_ : cost_category_rules_list)
    ~rule_version:(rule_version_ : cost_category_rule_version) ~name:(name_ : cost_category_name) ()
    =
  ({
     resource_tags = resource_tags_;
     split_charge_rules = split_charge_rules_;
     default_value = default_value_;
     rules = rules_;
     rule_version = rule_version_;
     effective_start = effective_start_;
     name = name_;
   }
    : create_cost_category_definition_request)

let make_create_anomaly_subscription_response ~subscription_arn:(subscription_arn_ : generic_string)
    () =
  ({ subscription_arn = subscription_arn_ } : create_anomaly_subscription_response)

let make_create_anomaly_subscription_request
    ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~anomaly_subscription:(anomaly_subscription_ : anomaly_subscription) () =
  ({ resource_tags = resource_tags_; anomaly_subscription = anomaly_subscription_ }
    : create_anomaly_subscription_request)

let make_create_anomaly_monitor_response ~monitor_arn:(monitor_arn_ : generic_string) () =
  ({ monitor_arn = monitor_arn_ } : create_anomaly_monitor_response)

let make_create_anomaly_monitor_request ?resource_tags:(resource_tags_ : resource_tag_list option)
    ~anomaly_monitor:(anomaly_monitor_ : anomaly_monitor) () =
  ({ resource_tags = resource_tags_; anomaly_monitor = anomaly_monitor_ }
    : create_anomaly_monitor_request)
