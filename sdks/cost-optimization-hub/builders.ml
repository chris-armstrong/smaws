open Types

let make_account_enrollment_status ?account_id:(account_id_ : account_id option)
    ?status:(status_ : enrollment_status option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     account_id = account_id_;
     status = status_;
     last_updated_timestamp = last_updated_timestamp_;
     created_timestamp = created_timestamp_;
   }
    : account_enrollment_status)

let make_estimated_discounts
    ?savings_plans_discount:(savings_plans_discount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?reserved_instances_discount:
      (reserved_instances_discount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?other_discount:(other_discount_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     savings_plans_discount = savings_plans_discount_;
     reserved_instances_discount = reserved_instances_discount_;
     other_discount = other_discount_;
   }
    : estimated_discounts)

let make_resource_pricing
    ?estimated_cost_before_discounts:
      (estimated_cost_before_discounts_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_net_unused_amortized_commitments:
      (estimated_net_unused_amortized_commitments_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_discounts:(estimated_discounts_ : estimated_discounts option)
    ?estimated_cost_after_discounts:
      (estimated_cost_after_discounts_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     estimated_cost_before_discounts = estimated_cost_before_discounts_;
     estimated_net_unused_amortized_commitments = estimated_net_unused_amortized_commitments_;
     estimated_discounts = estimated_discounts_;
     estimated_cost_after_discounts = estimated_cost_after_discounts_;
   }
    : resource_pricing)

let make_usage ?usage_type:(usage_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_amount:(usage_amount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?operation:(operation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?product_code:(product_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?unit_:(unit__ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     usage_type = usage_type_;
     usage_amount = usage_amount_;
     operation = operation_;
     product_code = product_code_;
     unit_ = unit__;
   }
    : usage)

let make_resource_cost_calculation ?usages:(usages_ : usage_list option)
    ?pricing:(pricing_ : resource_pricing option) () =
  ({ usages = usages_; pricing = pricing_ } : resource_cost_calculation)

let make_aurora_db_cluster_storage_configuration
    ?storage_type:(storage_type_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ storage_type = storage_type_ } : aurora_db_cluster_storage_configuration)

let make_aurora_db_cluster_storage
    ?configuration:(configuration_ : aurora_db_cluster_storage_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : aurora_db_cluster_storage)

let make_block_storage_performance_configuration
    ?iops:(iops_ : Smaws_Lib.Smithy_api.Types.double option)
    ?throughput:(throughput_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ iops = iops_; throughput = throughput_ } : block_storage_performance_configuration)

let make_compute_configuration ?v_cpu:(v_cpu_ : Smaws_Lib.Smithy_api.Types.double option)
    ?memory_size_in_m_b:(memory_size_in_m_b_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?architecture:(architecture_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?platform:(platform_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     v_cpu = v_cpu_;
     memory_size_in_m_b = memory_size_in_m_b_;
     architecture = architecture_;
     platform = platform_;
   }
    : compute_configuration)

let make_savings_plans_pricing
    ?monthly_savings_plans_eligible_cost:
      (monthly_savings_plans_eligible_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_monthly_commitment:
      (estimated_monthly_commitment_ : Smaws_Lib.Smithy_api.Types.double option)
    ?savings_percentage:(savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    () =
  ({
     monthly_savings_plans_eligible_cost = monthly_savings_plans_eligible_cost_;
     estimated_monthly_commitment = estimated_monthly_commitment_;
     savings_percentage = savings_percentage_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
   }
    : savings_plans_pricing)

let make_savings_plans_cost_calculation ?pricing:(pricing_ : savings_plans_pricing option) () =
  ({ pricing = pricing_ } : savings_plans_cost_calculation)

let make_compute_savings_plans_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hourly_commitment:(hourly_commitment_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     account_scope = account_scope_;
     term = term_;
     payment_option = payment_option_;
     hourly_commitment = hourly_commitment_;
   }
    : compute_savings_plans_configuration)

let make_compute_savings_plans
    ?configuration:(configuration_ : compute_savings_plans_configuration option)
    ?cost_calculation:(cost_calculation_ : savings_plans_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ } : compute_savings_plans)

let make_validation_exception_detail ~field_name:(field_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ field_name = field_name_; message = message_ } : validation_exception_detail)

let make_preferred_commitment ?term:(term_ : term option)
    ?payment_option:(payment_option_ : payment_option option) () =
  ({ term = term_; payment_option = payment_option_ } : preferred_commitment)

let make_update_preferences_response
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option)
    ?member_account_discount_visibility:
      (member_account_discount_visibility_ : member_account_discount_visibility option)
    ?preferred_commitment:(preferred_commitment_ : preferred_commitment option) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     member_account_discount_visibility = member_account_discount_visibility_;
     preferred_commitment = preferred_commitment_;
   }
    : update_preferences_response)

let make_update_preferences_request
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option)
    ?member_account_discount_visibility:
      (member_account_discount_visibility_ : member_account_discount_visibility option)
    ?preferred_commitment:(preferred_commitment_ : preferred_commitment option) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     member_account_discount_visibility = member_account_discount_visibility_;
     preferred_commitment = preferred_commitment_;
   }
    : update_preferences_request)

let make_update_enrollment_status_response
    ?status:(status_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ status = status_ } : update_enrollment_status_response)

let make_update_enrollment_status_request
    ?include_member_accounts:(include_member_accounts_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~status:(status_ : enrollment_status) () =
  ({ status = status_; include_member_accounts = include_member_accounts_ }
    : update_enrollment_status_request)

let make_recommendation_summary ?group:(group_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?recommendation_count:(recommendation_count_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({
     group = group_;
     estimated_monthly_savings = estimated_monthly_savings_;
     recommendation_count = recommendation_count_;
   }
    : recommendation_summary)

let make_list_recommendation_summaries_response
    ?estimated_total_deduped_savings:
      (estimated_total_deduped_savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?items:(items_ : recommendation_summaries_list option)
    ?group_by:(group_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?currency_code:(currency_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?metrics:(metrics_ : summary_metrics_result option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     estimated_total_deduped_savings = estimated_total_deduped_savings_;
     items = items_;
     group_by = group_by_;
     currency_code = currency_code_;
     metrics = metrics_;
     next_token = next_token_;
   }
    : list_recommendation_summaries_response)

let make_tag ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_filter ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?rollback_possible:(rollback_possible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?implementation_efforts:(implementation_efforts_ : implementation_effort_list option)
    ?account_ids:(account_ids_ : account_id_list option) ?regions:(regions_ : region_list option)
    ?resource_types:(resource_types_ : resource_type_list option)
    ?action_types:(action_types_ : action_type_list option) ?tags:(tags_ : tag_list option)
    ?resource_ids:(resource_ids_ : resource_id_list option)
    ?resource_arns:(resource_arns_ : resource_arn_list option)
    ?recommendation_ids:(recommendation_ids_ : recommendation_id_list option) () =
  ({
     restart_needed = restart_needed_;
     rollback_possible = rollback_possible_;
     implementation_efforts = implementation_efforts_;
     account_ids = account_ids_;
     regions = regions_;
     resource_types = resource_types_;
     action_types = action_types_;
     tags = tags_;
     resource_ids = resource_ids_;
     resource_arns = resource_arns_;
     recommendation_ids = recommendation_ids_;
   }
    : filter)

let make_list_recommendation_summaries_request ?filter:(filter_ : filter option)
    ?max_results:(max_results_ : max_results option)
    ?metrics:(metrics_ : summary_metrics_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~group_by:(group_by_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     filter = filter_;
     group_by = group_by_;
     max_results = max_results_;
     metrics = metrics_;
     next_token = next_token_;
   }
    : list_recommendation_summaries_request)

let make_recommendation
    ?recommendation_id:(recommendation_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_resource_type:(current_resource_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_resource_type:
      (recommended_resource_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_savings_percentage:
      (estimated_savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_monthly_cost:(estimated_monthly_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?currency_code:(currency_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?implementation_effort:(implementation_effort_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?action_type:(action_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rollback_possible:(rollback_possible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?current_resource_summary:
      (current_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_resource_summary:
      (recommended_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : datetime option)
    ?recommendation_lookback_period_in_days:
      (recommendation_lookback_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?source:(source_ : source option) ?tags:(tags_ : tag_list option) () =
  ({
     recommendation_id = recommendation_id_;
     account_id = account_id_;
     region = region_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
     current_resource_type = current_resource_type_;
     recommended_resource_type = recommended_resource_type_;
     estimated_monthly_savings = estimated_monthly_savings_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_monthly_cost = estimated_monthly_cost_;
     currency_code = currency_code_;
     implementation_effort = implementation_effort_;
     restart_needed = restart_needed_;
     action_type = action_type_;
     rollback_possible = rollback_possible_;
     current_resource_summary = current_resource_summary_;
     recommended_resource_summary = recommended_resource_summary_;
     last_refresh_timestamp = last_refresh_timestamp_;
     recommendation_lookback_period_in_days = recommendation_lookback_period_in_days_;
     source = source_;
     tags = tags_;
   }
    : recommendation)

let make_list_recommendations_response ?items:(items_ : recommendation_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ items = items_; next_token = next_token_ } : list_recommendations_response)

let make_order_by ?dimension:(dimension_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?order:(order_ : order option) () =
  ({ dimension = dimension_; order = order_ } : order_by)

let make_list_recommendations_request ?filter:(filter_ : filter option)
    ?order_by:(order_by_ : order_by option)
    ?include_all_recommendations:
      (include_all_recommendations_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     filter = filter_;
     order_by = order_by_;
     include_all_recommendations = include_all_recommendations_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_recommendations_request)

let make_list_enrollment_statuses_response ?items:(items_ : account_enrollment_statuses option)
    ?include_member_accounts:(include_member_accounts_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ items = items_; include_member_accounts = include_member_accounts_; next_token = next_token_ }
    : list_enrollment_statuses_response)

let make_list_enrollment_statuses_request
    ?include_organization_info:
      (include_organization_info_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?account_id:(account_id_ : account_id option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     include_organization_info = include_organization_info_;
     account_id = account_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_enrollment_statuses_request)

let make_metrics_by_time ?score:(score_ : Smaws_Lib.Smithy_api.Types.double option)
    ?savings:(savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?spend:(spend_ : Smaws_Lib.Smithy_api.Types.double option)
    ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ score = score_; savings = savings_; spend = spend_; timestamp = timestamp_ } : metrics_by_time)

let make_efficiency_metrics_by_group
    ?metrics_by_time:(metrics_by_time_ : metrics_by_time_list option)
    ?group:(group_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ metrics_by_time = metrics_by_time_; group = group_; message = message_ }
    : efficiency_metrics_by_group)

let make_list_efficiency_metrics_response
    ?efficiency_metrics_by_group:
      (efficiency_metrics_by_group_ : efficiency_metrics_by_group_list option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ efficiency_metrics_by_group = efficiency_metrics_by_group_; next_token = next_token_ }
    : list_efficiency_metrics_response)

let make_time_period ~start:(start_ : Smaws_Lib.Smithy_api.Types.string_)
    ~end_:(end__ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ start = start_; end_ = end__ } : time_period)

let make_list_efficiency_metrics_request
    ?group_by:(group_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : max_results option) ?order_by:(order_by_ : order_by option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~granularity:(granularity_ : granularity_type) ~time_period:(time_period_ : time_period) () =
  ({
     group_by = group_by_;
     granularity = granularity_;
     time_period = time_period_;
     max_results = max_results_;
     order_by = order_by_;
     next_token = next_token_;
   }
    : list_efficiency_metrics_request)

let make_sage_maker_endpoint
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : sage_maker_endpoint)

let make_work_spaces ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : work_spaces)

let make_document_db_cluster
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : document_db_cluster)

let make_memory_db_cluster ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    () =
  ({ cost_calculation = cost_calculation_ } : memory_db_cluster)

let make_elasti_cache_cluster
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : elasti_cache_cluster)

let make_dynamo_db_table ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) ()
    =
  ({ cost_calculation = cost_calculation_ } : dynamo_db_table)

let make_nat_gateway_configuration
    ?active_connection_count:(active_connection_count_ : Smaws_Lib.Smithy_api.Types.long option)
    ?packets_in_from_source:(packets_in_from_source_ : Smaws_Lib.Smithy_api.Types.long option)
    ?packets_in_from_destination:
      (packets_in_from_destination_ : Smaws_Lib.Smithy_api.Types.long option) () =
  ({
     active_connection_count = active_connection_count_;
     packets_in_from_source = packets_in_from_source_;
     packets_in_from_destination = packets_in_from_destination_;
   }
    : nat_gateway_configuration)

let make_nat_gateway ?configuration:(configuration_ : nat_gateway_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ } : nat_gateway)

let make_reserved_instances_pricing
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?monthly_reservation_eligible_cost:
      (monthly_reservation_eligible_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?savings_percentage:(savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_monthly_amortized_reservation_cost:
      (estimated_monthly_amortized_reservation_cost_ : Smaws_Lib.Smithy_api.Types.double option) ()
    =
  ({
     estimated_on_demand_cost = estimated_on_demand_cost_;
     monthly_reservation_eligible_cost = monthly_reservation_eligible_cost_;
     savings_percentage = savings_percentage_;
     estimated_monthly_amortized_reservation_cost = estimated_monthly_amortized_reservation_cost_;
   }
    : reserved_instances_pricing)

let make_reserved_instances_cost_calculation ?pricing:(pricing_ : reserved_instances_pricing option)
    () =
  ({ pricing = pricing_ } : reserved_instances_cost_calculation)

let make_memory_db_reserved_instances_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     account_scope = account_scope_;
     service = service_;
     term = term_;
     payment_option = payment_option_;
     reserved_instances_region = reserved_instances_region_;
     upfront_cost = upfront_cost_;
     monthly_recurring_cost = monthly_recurring_cost_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     instance_type = instance_type_;
     instance_family = instance_family_;
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
   }
    : memory_db_reserved_instances_configuration)

let make_memory_db_reserved_instances
    ?configuration:(configuration_ : memory_db_reserved_instances_configuration option)
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : memory_db_reserved_instances)

let make_dynamo_db_reserved_capacity_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_capacity_units_to_purchase:
      (number_of_capacity_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?capacity_units:(capacity_units_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     account_scope = account_scope_;
     service = service_;
     term = term_;
     payment_option = payment_option_;
     reserved_instances_region = reserved_instances_region_;
     upfront_cost = upfront_cost_;
     monthly_recurring_cost = monthly_recurring_cost_;
     number_of_capacity_units_to_purchase = number_of_capacity_units_to_purchase_;
     capacity_units = capacity_units_;
   }
    : dynamo_db_reserved_capacity_configuration)

let make_dynamo_db_reserved_capacity
    ?configuration:(configuration_ : dynamo_db_reserved_capacity_configuration option)
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : dynamo_db_reserved_capacity)

let make_rds_db_instance_storage_configuration
    ?storage_type:(storage_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?allocated_storage_in_gb:(allocated_storage_in_gb_ : Smaws_Lib.Smithy_api.Types.double option)
    ?iops:(iops_ : Smaws_Lib.Smithy_api.Types.double option)
    ?storage_throughput:(storage_throughput_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     storage_type = storage_type_;
     allocated_storage_in_gb = allocated_storage_in_gb_;
     iops = iops_;
     storage_throughput = storage_throughput_;
   }
    : rds_db_instance_storage_configuration)

let make_rds_db_instance_storage
    ?configuration:(configuration_ : rds_db_instance_storage_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : rds_db_instance_storage)

let make_db_instance_configuration
    ?db_instance_class:(db_instance_class_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ db_instance_class = db_instance_class_ } : db_instance_configuration)

let make_rds_db_instance_configuration ?instance:(instance_ : db_instance_configuration option) () =
  ({ instance = instance_ } : rds_db_instance_configuration)

let make_rds_db_instance ?configuration:(configuration_ : rds_db_instance_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ } : rds_db_instance)

let make_sage_maker_savings_plans_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hourly_commitment:(hourly_commitment_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     account_scope = account_scope_;
     term = term_;
     payment_option = payment_option_;
     hourly_commitment = hourly_commitment_;
   }
    : sage_maker_savings_plans_configuration)

let make_sage_maker_savings_plans
    ?configuration:(configuration_ : sage_maker_savings_plans_configuration option)
    ?cost_calculation:(cost_calculation_ : savings_plans_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : sage_maker_savings_plans)

let make_ec2_instance_savings_plans_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hourly_commitment:(hourly_commitment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?savings_plans_region:(savings_plans_region_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     account_scope = account_scope_;
     term = term_;
     payment_option = payment_option_;
     hourly_commitment = hourly_commitment_;
     instance_family = instance_family_;
     savings_plans_region = savings_plans_region_;
   }
    : ec2_instance_savings_plans_configuration)

let make_ec2_instance_savings_plans
    ?configuration:(configuration_ : ec2_instance_savings_plans_configuration option)
    ?cost_calculation:(cost_calculation_ : savings_plans_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : ec2_instance_savings_plans)

let make_redshift_reserved_instances_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     account_scope = account_scope_;
     service = service_;
     term = term_;
     payment_option = payment_option_;
     reserved_instances_region = reserved_instances_region_;
     upfront_cost = upfront_cost_;
     monthly_recurring_cost = monthly_recurring_cost_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     instance_family = instance_family_;
     instance_type = instance_type_;
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
   }
    : redshift_reserved_instances_configuration)

let make_redshift_reserved_instances
    ?configuration:(configuration_ : redshift_reserved_instances_configuration option)
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : redshift_reserved_instances)

let make_open_search_reserved_instances_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     account_scope = account_scope_;
     service = service_;
     term = term_;
     payment_option = payment_option_;
     reserved_instances_region = reserved_instances_region_;
     upfront_cost = upfront_cost_;
     monthly_recurring_cost = monthly_recurring_cost_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     instance_type = instance_type_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
   }
    : open_search_reserved_instances_configuration)

let make_open_search_reserved_instances
    ?configuration:(configuration_ : open_search_reserved_instances_configuration option)
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : open_search_reserved_instances)

let make_elasti_cache_reserved_instances_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     account_scope = account_scope_;
     service = service_;
     term = term_;
     payment_option = payment_option_;
     reserved_instances_region = reserved_instances_region_;
     upfront_cost = upfront_cost_;
     monthly_recurring_cost = monthly_recurring_cost_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     instance_family = instance_family_;
     instance_type = instance_type_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
   }
    : elasti_cache_reserved_instances_configuration)

let make_elasti_cache_reserved_instances
    ?configuration:(configuration_ : elasti_cache_reserved_instances_configuration option)
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : elasti_cache_reserved_instances)

let make_rds_reserved_instances_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?license_model:(license_model_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_edition:(database_edition_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_engine:(database_engine_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?deployment_option:(deployment_option_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     account_scope = account_scope_;
     service = service_;
     term = term_;
     payment_option = payment_option_;
     reserved_instances_region = reserved_instances_region_;
     upfront_cost = upfront_cost_;
     monthly_recurring_cost = monthly_recurring_cost_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     instance_family = instance_family_;
     instance_type = instance_type_;
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     license_model = license_model_;
     database_edition = database_edition_;
     database_engine = database_engine_;
     deployment_option = deployment_option_;
   }
    : rds_reserved_instances_configuration)

let make_rds_reserved_instances
    ?configuration:(configuration_ : rds_reserved_instances_configuration option)
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : rds_reserved_instances)

let make_ec2_reserved_instances_configuration
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?offering_class:(offering_class_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?platform:(platform_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tenancy:(tenancy_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     account_scope = account_scope_;
     service = service_;
     term = term_;
     payment_option = payment_option_;
     reserved_instances_region = reserved_instances_region_;
     upfront_cost = upfront_cost_;
     monthly_recurring_cost = monthly_recurring_cost_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     offering_class = offering_class_;
     instance_family = instance_family_;
     instance_type = instance_type_;
     current_generation = current_generation_;
     platform = platform_;
     tenancy = tenancy_;
     size_flex_eligible = size_flex_eligible_;
   }
    : ec2_reserved_instances_configuration)

let make_ec2_reserved_instances
    ?configuration:(configuration_ : ec2_reserved_instances_configuration option)
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : ec2_reserved_instances)

let make_mixed_instance_configuration ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option) ()
    =
  ({ type_ = type__ } : mixed_instance_configuration)

let make_instance_configuration ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ type_ = type__ } : instance_configuration)

let make_ec2_auto_scaling_group_configuration ?instance:(instance_ : instance_configuration option)
    ?mixed_instances:(mixed_instances_ : mixed_instance_configuration_list option)
    ?type_:(type__ : ec2_auto_scaling_group_type option)
    ?allocation_strategy:(allocation_strategy_ : allocation_strategy option) () =
  ({
     instance = instance_;
     mixed_instances = mixed_instances_;
     type_ = type__;
     allocation_strategy = allocation_strategy_;
   }
    : ec2_auto_scaling_group_configuration)

let make_ec2_auto_scaling_group
    ?configuration:(configuration_ : ec2_auto_scaling_group_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ }
    : ec2_auto_scaling_group)

let make_storage_configuration ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_in_gb:(size_in_gb_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ type_ = type__; size_in_gb = size_in_gb_ } : storage_configuration)

let make_ebs_volume_configuration ?storage:(storage_ : storage_configuration option)
    ?performance:(performance_ : block_storage_performance_configuration option)
    ?attachment_state:(attachment_state_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ storage = storage_; performance = performance_; attachment_state = attachment_state_ }
    : ebs_volume_configuration)

let make_ebs_volume ?configuration:(configuration_ : ebs_volume_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ } : ebs_volume)

let make_ec2_instance_configuration ?instance:(instance_ : instance_configuration option) () =
  ({ instance = instance_ } : ec2_instance_configuration)

let make_ec2_instance ?configuration:(configuration_ : ec2_instance_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ } : ec2_instance)

let make_ecs_service_configuration ?compute:(compute_ : compute_configuration option) () =
  ({ compute = compute_ } : ecs_service_configuration)

let make_ecs_service ?configuration:(configuration_ : ecs_service_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ } : ecs_service)

let make_lambda_function_configuration ?compute:(compute_ : compute_configuration option) () =
  ({ compute = compute_ } : lambda_function_configuration)

let make_lambda_function ?configuration:(configuration_ : lambda_function_configuration option)
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ configuration = configuration_; cost_calculation = cost_calculation_ } : lambda_function)

let make_get_recommendation_response
    ?recommendation_id:(recommendation_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?currency_code:(currency_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommendation_lookback_period_in_days:
      (recommendation_lookback_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?cost_calculation_lookback_period_in_days:
      (cost_calculation_lookback_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?estimated_savings_percentage:
      (estimated_savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_savings_over_cost_calculation_lookback_period:
      (estimated_savings_over_cost_calculation_lookback_period_ :
         Smaws_Lib.Smithy_api.Types.double option)
    ?current_resource_type:(current_resource_type_ : resource_type option)
    ?recommended_resource_type:(recommended_resource_type_ : resource_type option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option) ?source:(source_ : source option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : datetime option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_monthly_cost:(estimated_monthly_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?implementation_effort:(implementation_effort_ : implementation_effort option)
    ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?action_type:(action_type_ : action_type option)
    ?rollback_possible:(rollback_possible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?current_resource_details:(current_resource_details_ : resource_details option)
    ?recommended_resource_details:(recommended_resource_details_ : resource_details option)
    ?tags:(tags_ : tag_list option) () =
  ({
     recommendation_id = recommendation_id_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
     account_id = account_id_;
     currency_code = currency_code_;
     recommendation_lookback_period_in_days = recommendation_lookback_period_in_days_;
     cost_calculation_lookback_period_in_days = cost_calculation_lookback_period_in_days_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_savings_over_cost_calculation_lookback_period =
       estimated_savings_over_cost_calculation_lookback_period_;
     current_resource_type = current_resource_type_;
     recommended_resource_type = recommended_resource_type_;
     region = region_;
     source = source_;
     last_refresh_timestamp = last_refresh_timestamp_;
     estimated_monthly_savings = estimated_monthly_savings_;
     estimated_monthly_cost = estimated_monthly_cost_;
     implementation_effort = implementation_effort_;
     restart_needed = restart_needed_;
     action_type = action_type_;
     rollback_possible = rollback_possible_;
     current_resource_details = current_resource_details_;
     recommended_resource_details = recommended_resource_details_;
     tags = tags_;
   }
    : get_recommendation_response)

let make_get_recommendation_request
    ~recommendation_id:(recommendation_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ recommendation_id = recommendation_id_ } : get_recommendation_request)

let make_get_preferences_response
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option)
    ?member_account_discount_visibility:
      (member_account_discount_visibility_ : member_account_discount_visibility option)
    ?preferred_commitment:(preferred_commitment_ : preferred_commitment option) () =
  ({
     savings_estimation_mode = savings_estimation_mode_;
     member_account_discount_visibility = member_account_discount_visibility_;
     preferred_commitment = preferred_commitment_;
   }
    : get_preferences_response)

let make_get_preferences_request () = (() : unit)
