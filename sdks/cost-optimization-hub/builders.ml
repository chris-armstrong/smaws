open Types

let make_usage ?unit_:(unit__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?product_code:(product_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?operation:(operation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?usage_amount:(usage_amount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?usage_type:(usage_type_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     unit_ = unit__;
     product_code = product_code_;
     operation = operation_;
     usage_amount = usage_amount_;
     usage_type = usage_type_;
   }
    : usage)

let make_estimated_discounts
    ?other_discount:(other_discount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?reserved_instances_discount:
      (reserved_instances_discount_ : Smaws_Lib.Smithy_api.Types.double option)
    ?savings_plans_discount:(savings_plans_discount_ : Smaws_Lib.Smithy_api.Types.double option) ()
    =
  ({
     other_discount = other_discount_;
     reserved_instances_discount = reserved_instances_discount_;
     savings_plans_discount = savings_plans_discount_;
   }
    : estimated_discounts)

let make_resource_pricing
    ?estimated_cost_after_discounts:
      (estimated_cost_after_discounts_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_discounts:(estimated_discounts_ : estimated_discounts option)
    ?estimated_net_unused_amortized_commitments:
      (estimated_net_unused_amortized_commitments_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_cost_before_discounts:
      (estimated_cost_before_discounts_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     estimated_cost_after_discounts = estimated_cost_after_discounts_;
     estimated_discounts = estimated_discounts_;
     estimated_net_unused_amortized_commitments = estimated_net_unused_amortized_commitments_;
     estimated_cost_before_discounts = estimated_cost_before_discounts_;
   }
    : resource_pricing)

let make_resource_cost_calculation ?pricing:(pricing_ : resource_pricing option)
    ?usages:(usages_ : usage_list option) () =
  ({ pricing = pricing_; usages = usages_ } : resource_cost_calculation)

let make_work_spaces ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : work_spaces)

let make_validation_exception_detail ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~field_name:(field_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; field_name = field_name_ } : validation_exception_detail)

let make_preferred_commitment ?payment_option:(payment_option_ : payment_option option)
    ?term:(term_ : term option) () =
  ({ payment_option = payment_option_; term = term_ } : preferred_commitment)

let make_update_preferences_response
    ?preferred_commitment:(preferred_commitment_ : preferred_commitment option)
    ?member_account_discount_visibility:
      (member_account_discount_visibility_ : member_account_discount_visibility option)
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option) () =
  ({
     preferred_commitment = preferred_commitment_;
     member_account_discount_visibility = member_account_discount_visibility_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : update_preferences_response)

let make_update_preferences_request
    ?preferred_commitment:(preferred_commitment_ : preferred_commitment option)
    ?member_account_discount_visibility:
      (member_account_discount_visibility_ : member_account_discount_visibility option)
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option) () =
  ({
     preferred_commitment = preferred_commitment_;
     member_account_discount_visibility = member_account_discount_visibility_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : update_preferences_request)

let make_update_enrollment_status_response
    ?status:(status_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ status = status_ } : update_enrollment_status_response)

let make_update_enrollment_status_request
    ?include_member_accounts:(include_member_accounts_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~status:(status_ : enrollment_status) () =
  ({ include_member_accounts = include_member_accounts_; status = status_ }
    : update_enrollment_status_request)

let make_time_period ~end_:(end__ : Smaws_Lib.Smithy_api.Types.string_)
    ~start:(start_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ end_ = end__; start = start_ } : time_period)

let make_tag ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?key:(key_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ value = value_; key = key_ } : tag)

let make_storage_configuration ?size_in_gb:(size_in_gb_ : Smaws_Lib.Smithy_api.Types.double option)
    ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ size_in_gb = size_in_gb_; type_ = type__ } : storage_configuration)

let make_savings_plans_pricing
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?savings_percentage:(savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_monthly_commitment:
      (estimated_monthly_commitment_ : Smaws_Lib.Smithy_api.Types.double option)
    ?monthly_savings_plans_eligible_cost:
      (monthly_savings_plans_eligible_cost_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     estimated_on_demand_cost = estimated_on_demand_cost_;
     savings_percentage = savings_percentage_;
     estimated_monthly_commitment = estimated_monthly_commitment_;
     monthly_savings_plans_eligible_cost = monthly_savings_plans_eligible_cost_;
   }
    : savings_plans_pricing)

let make_savings_plans_cost_calculation ?pricing:(pricing_ : savings_plans_pricing option) () =
  ({ pricing = pricing_ } : savings_plans_cost_calculation)

let make_sage_maker_savings_plans_configuration
    ?hourly_commitment:(hourly_commitment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     hourly_commitment = hourly_commitment_;
     payment_option = payment_option_;
     term = term_;
     account_scope = account_scope_;
   }
    : sage_maker_savings_plans_configuration)

let make_sage_maker_savings_plans
    ?cost_calculation:(cost_calculation_ : savings_plans_cost_calculation option)
    ?configuration:(configuration_ : sage_maker_savings_plans_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : sage_maker_savings_plans)

let make_sage_maker_endpoint
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : sage_maker_endpoint)

let make_compute_configuration ?platform:(platform_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?architecture:(architecture_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?memory_size_in_m_b:(memory_size_in_m_b_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?v_cpu:(v_cpu_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     platform = platform_;
     architecture = architecture_;
     memory_size_in_m_b = memory_size_in_m_b_;
     v_cpu = v_cpu_;
   }
    : compute_configuration)

let make_lambda_function_configuration ?compute:(compute_ : compute_configuration option) () =
  ({ compute = compute_ } : lambda_function_configuration)

let make_lambda_function ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : lambda_function_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ } : lambda_function)

let make_ecs_service_configuration ?compute:(compute_ : compute_configuration option) () =
  ({ compute = compute_ } : ecs_service_configuration)

let make_ecs_service ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : ecs_service_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ } : ecs_service)

let make_instance_configuration ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ type_ = type__ } : instance_configuration)

let make_ec2_instance_configuration ?instance:(instance_ : instance_configuration option) () =
  ({ instance = instance_ } : ec2_instance_configuration)

let make_ec2_instance ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : ec2_instance_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ } : ec2_instance)

let make_block_storage_performance_configuration
    ?throughput:(throughput_ : Smaws_Lib.Smithy_api.Types.double option)
    ?iops:(iops_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ throughput = throughput_; iops = iops_ } : block_storage_performance_configuration)

let make_ebs_volume_configuration
    ?attachment_state:(attachment_state_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?performance:(performance_ : block_storage_performance_configuration option)
    ?storage:(storage_ : storage_configuration option) () =
  ({ attachment_state = attachment_state_; performance = performance_; storage = storage_ }
    : ebs_volume_configuration)

let make_ebs_volume ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : ebs_volume_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ } : ebs_volume)

let make_mixed_instance_configuration ?type_:(type__ : Smaws_Lib.Smithy_api.Types.string_ option) ()
    =
  ({ type_ = type__ } : mixed_instance_configuration)

let make_ec2_auto_scaling_group_configuration
    ?allocation_strategy:(allocation_strategy_ : allocation_strategy option)
    ?type_:(type__ : ec2_auto_scaling_group_type option)
    ?mixed_instances:(mixed_instances_ : mixed_instance_configuration_list option)
    ?instance:(instance_ : instance_configuration option) () =
  ({
     allocation_strategy = allocation_strategy_;
     type_ = type__;
     mixed_instances = mixed_instances_;
     instance = instance_;
   }
    : ec2_auto_scaling_group_configuration)

let make_ec2_auto_scaling_group
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : ec2_auto_scaling_group_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : ec2_auto_scaling_group)

let make_ec2_reserved_instances_configuration
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tenancy:(tenancy_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?platform:(platform_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?offering_class:(offering_class_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     tenancy = tenancy_;
     platform = platform_;
     current_generation = current_generation_;
     instance_type = instance_type_;
     instance_family = instance_family_;
     offering_class = offering_class_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     monthly_recurring_cost = monthly_recurring_cost_;
     upfront_cost = upfront_cost_;
     reserved_instances_region = reserved_instances_region_;
     payment_option = payment_option_;
     term = term_;
     service = service_;
     account_scope = account_scope_;
   }
    : ec2_reserved_instances_configuration)

let make_reserved_instances_pricing
    ?estimated_monthly_amortized_reservation_cost:
      (estimated_monthly_amortized_reservation_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?savings_percentage:(savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?monthly_reservation_eligible_cost:
      (monthly_reservation_eligible_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_on_demand_cost:(estimated_on_demand_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    () =
  ({
     estimated_monthly_amortized_reservation_cost = estimated_monthly_amortized_reservation_cost_;
     savings_percentage = savings_percentage_;
     monthly_reservation_eligible_cost = monthly_reservation_eligible_cost_;
     estimated_on_demand_cost = estimated_on_demand_cost_;
   }
    : reserved_instances_pricing)

let make_reserved_instances_cost_calculation ?pricing:(pricing_ : reserved_instances_pricing option)
    () =
  ({ pricing = pricing_ } : reserved_instances_cost_calculation)

let make_ec2_reserved_instances
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option)
    ?configuration:(configuration_ : ec2_reserved_instances_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : ec2_reserved_instances)

let make_rds_reserved_instances_configuration
    ?deployment_option:(deployment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_engine:(database_engine_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?database_edition:(database_edition_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?license_model:(license_model_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     deployment_option = deployment_option_;
     database_engine = database_engine_;
     database_edition = database_edition_;
     license_model = license_model_;
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
     instance_type = instance_type_;
     instance_family = instance_family_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     monthly_recurring_cost = monthly_recurring_cost_;
     upfront_cost = upfront_cost_;
     reserved_instances_region = reserved_instances_region_;
     payment_option = payment_option_;
     term = term_;
     service = service_;
     account_scope = account_scope_;
   }
    : rds_reserved_instances_configuration)

let make_rds_reserved_instances
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option)
    ?configuration:(configuration_ : rds_reserved_instances_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : rds_reserved_instances)

let make_elasti_cache_reserved_instances_configuration
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     instance_type = instance_type_;
     instance_family = instance_family_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     monthly_recurring_cost = monthly_recurring_cost_;
     upfront_cost = upfront_cost_;
     reserved_instances_region = reserved_instances_region_;
     payment_option = payment_option_;
     term = term_;
     service = service_;
     account_scope = account_scope_;
   }
    : elasti_cache_reserved_instances_configuration)

let make_elasti_cache_reserved_instances
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option)
    ?configuration:(configuration_ : elasti_cache_reserved_instances_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : elasti_cache_reserved_instances)

let make_open_search_reserved_instances_configuration
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     size_flex_eligible = size_flex_eligible_;
     current_generation = current_generation_;
     instance_type = instance_type_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     monthly_recurring_cost = monthly_recurring_cost_;
     upfront_cost = upfront_cost_;
     reserved_instances_region = reserved_instances_region_;
     payment_option = payment_option_;
     term = term_;
     service = service_;
     account_scope = account_scope_;
   }
    : open_search_reserved_instances_configuration)

let make_open_search_reserved_instances
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option)
    ?configuration:(configuration_ : open_search_reserved_instances_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : open_search_reserved_instances)

let make_redshift_reserved_instances_configuration
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
     instance_type = instance_type_;
     instance_family = instance_family_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     monthly_recurring_cost = monthly_recurring_cost_;
     upfront_cost = upfront_cost_;
     reserved_instances_region = reserved_instances_region_;
     payment_option = payment_option_;
     term = term_;
     service = service_;
     account_scope = account_scope_;
   }
    : redshift_reserved_instances_configuration)

let make_redshift_reserved_instances
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option)
    ?configuration:(configuration_ : redshift_reserved_instances_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : redshift_reserved_instances)

let make_ec2_instance_savings_plans_configuration
    ?savings_plans_region:(savings_plans_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?hourly_commitment:(hourly_commitment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     savings_plans_region = savings_plans_region_;
     instance_family = instance_family_;
     hourly_commitment = hourly_commitment_;
     payment_option = payment_option_;
     term = term_;
     account_scope = account_scope_;
   }
    : ec2_instance_savings_plans_configuration)

let make_ec2_instance_savings_plans
    ?cost_calculation:(cost_calculation_ : savings_plans_cost_calculation option)
    ?configuration:(configuration_ : ec2_instance_savings_plans_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : ec2_instance_savings_plans)

let make_compute_savings_plans_configuration
    ?hourly_commitment:(hourly_commitment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     hourly_commitment = hourly_commitment_;
     payment_option = payment_option_;
     term = term_;
     account_scope = account_scope_;
   }
    : compute_savings_plans_configuration)

let make_compute_savings_plans
    ?cost_calculation:(cost_calculation_ : savings_plans_cost_calculation option)
    ?configuration:(configuration_ : compute_savings_plans_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ } : compute_savings_plans)

let make_db_instance_configuration
    ?db_instance_class:(db_instance_class_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ db_instance_class = db_instance_class_ } : db_instance_configuration)

let make_rds_db_instance_configuration ?instance:(instance_ : db_instance_configuration option) () =
  ({ instance = instance_ } : rds_db_instance_configuration)

let make_rds_db_instance ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : rds_db_instance_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ } : rds_db_instance)

let make_rds_db_instance_storage_configuration
    ?storage_throughput:(storage_throughput_ : Smaws_Lib.Smithy_api.Types.double option)
    ?iops:(iops_ : Smaws_Lib.Smithy_api.Types.double option)
    ?allocated_storage_in_gb:(allocated_storage_in_gb_ : Smaws_Lib.Smithy_api.Types.double option)
    ?storage_type:(storage_type_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     storage_throughput = storage_throughput_;
     iops = iops_;
     allocated_storage_in_gb = allocated_storage_in_gb_;
     storage_type = storage_type_;
   }
    : rds_db_instance_storage_configuration)

let make_rds_db_instance_storage
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : rds_db_instance_storage_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : rds_db_instance_storage)

let make_aurora_db_cluster_storage_configuration
    ?storage_type:(storage_type_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ storage_type = storage_type_ } : aurora_db_cluster_storage_configuration)

let make_aurora_db_cluster_storage
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : aurora_db_cluster_storage_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : aurora_db_cluster_storage)

let make_dynamo_db_reserved_capacity_configuration
    ?capacity_units:(capacity_units_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_capacity_units_to_purchase:
      (number_of_capacity_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     capacity_units = capacity_units_;
     number_of_capacity_units_to_purchase = number_of_capacity_units_to_purchase_;
     monthly_recurring_cost = monthly_recurring_cost_;
     upfront_cost = upfront_cost_;
     reserved_instances_region = reserved_instances_region_;
     payment_option = payment_option_;
     term = term_;
     service = service_;
     account_scope = account_scope_;
   }
    : dynamo_db_reserved_capacity_configuration)

let make_dynamo_db_reserved_capacity
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option)
    ?configuration:(configuration_ : dynamo_db_reserved_capacity_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : dynamo_db_reserved_capacity)

let make_memory_db_reserved_instances_configuration
    ?current_generation:(current_generation_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?size_flex_eligible:(size_flex_eligible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?instance_family:(instance_family_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instance_type:(instance_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?number_of_instances_to_purchase:
      (number_of_instances_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?normalized_units_to_purchase:
      (normalized_units_to_purchase_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?monthly_recurring_cost:(monthly_recurring_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?upfront_cost:(upfront_cost_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?reserved_instances_region:
      (reserved_instances_region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?payment_option:(payment_option_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?term:(term_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?service:(service_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_scope:(account_scope_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     current_generation = current_generation_;
     size_flex_eligible = size_flex_eligible_;
     instance_family = instance_family_;
     instance_type = instance_type_;
     number_of_instances_to_purchase = number_of_instances_to_purchase_;
     normalized_units_to_purchase = normalized_units_to_purchase_;
     monthly_recurring_cost = monthly_recurring_cost_;
     upfront_cost = upfront_cost_;
     reserved_instances_region = reserved_instances_region_;
     payment_option = payment_option_;
     term = term_;
     service = service_;
     account_scope = account_scope_;
   }
    : memory_db_reserved_instances_configuration)

let make_memory_db_reserved_instances
    ?cost_calculation:(cost_calculation_ : reserved_instances_cost_calculation option)
    ?configuration:(configuration_ : memory_db_reserved_instances_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ }
    : memory_db_reserved_instances)

let make_nat_gateway_configuration
    ?packets_in_from_destination:
      (packets_in_from_destination_ : Smaws_Lib.Smithy_api.Types.long option)
    ?packets_in_from_source:(packets_in_from_source_ : Smaws_Lib.Smithy_api.Types.long option)
    ?active_connection_count:(active_connection_count_ : Smaws_Lib.Smithy_api.Types.long option) ()
    =
  ({
     packets_in_from_destination = packets_in_from_destination_;
     packets_in_from_source = packets_in_from_source_;
     active_connection_count = active_connection_count_;
   }
    : nat_gateway_configuration)

let make_nat_gateway ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    ?configuration:(configuration_ : nat_gateway_configuration option) () =
  ({ cost_calculation = cost_calculation_; configuration = configuration_ } : nat_gateway)

let make_dynamo_db_table ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) ()
    =
  ({ cost_calculation = cost_calculation_ } : dynamo_db_table)

let make_elasti_cache_cluster
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : elasti_cache_cluster)

let make_memory_db_cluster ?cost_calculation:(cost_calculation_ : resource_cost_calculation option)
    () =
  ({ cost_calculation = cost_calculation_ } : memory_db_cluster)

let make_document_db_cluster
    ?cost_calculation:(cost_calculation_ : resource_cost_calculation option) () =
  ({ cost_calculation = cost_calculation_ } : document_db_cluster)

let make_recommendation_summary
    ?recommendation_count:(recommendation_count_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?group:(group_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     recommendation_count = recommendation_count_;
     estimated_monthly_savings = estimated_monthly_savings_;
     group = group_;
   }
    : recommendation_summary)

let make_recommendation ?tags:(tags_ : tag_list option) ?source:(source_ : source option)
    ?recommendation_lookback_period_in_days:
      (recommendation_lookback_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : datetime option)
    ?recommended_resource_summary:
      (recommended_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_resource_summary:
      (current_resource_summary_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?rollback_possible:(rollback_possible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?action_type:(action_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?implementation_effort:(implementation_effort_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?currency_code:(currency_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?estimated_monthly_cost:(estimated_monthly_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_savings_percentage:
      (estimated_savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?recommended_resource_type:
      (recommended_resource_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?current_resource_type:(current_resource_type_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommendation_id:(recommendation_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     tags = tags_;
     source = source_;
     recommendation_lookback_period_in_days = recommendation_lookback_period_in_days_;
     last_refresh_timestamp = last_refresh_timestamp_;
     recommended_resource_summary = recommended_resource_summary_;
     current_resource_summary = current_resource_summary_;
     rollback_possible = rollback_possible_;
     action_type = action_type_;
     restart_needed = restart_needed_;
     implementation_effort = implementation_effort_;
     currency_code = currency_code_;
     estimated_monthly_cost = estimated_monthly_cost_;
     estimated_savings_percentage = estimated_savings_percentage_;
     estimated_monthly_savings = estimated_monthly_savings_;
     recommended_resource_type = recommended_resource_type_;
     current_resource_type = current_resource_type_;
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     region = region_;
     account_id = account_id_;
     recommendation_id = recommendation_id_;
   }
    : recommendation)

let make_order_by ?order:(order_ : order option)
    ?dimension:(dimension_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ order = order_; dimension = dimension_ } : order_by)

let make_metrics_by_time ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?spend:(spend_ : Smaws_Lib.Smithy_api.Types.double option)
    ?savings:(savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?score:(score_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ timestamp = timestamp_; spend = spend_; savings = savings_; score = score_ } : metrics_by_time)

let make_list_recommendations_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?items:(items_ : recommendation_list option) () =
  ({ next_token = next_token_; items = items_ } : list_recommendations_response)

let make_filter ?recommendation_ids:(recommendation_ids_ : recommendation_id_list option)
    ?resource_arns:(resource_arns_ : resource_arn_list option)
    ?resource_ids:(resource_ids_ : resource_id_list option) ?tags:(tags_ : tag_list option)
    ?action_types:(action_types_ : action_type_list option)
    ?resource_types:(resource_types_ : resource_type_list option)
    ?regions:(regions_ : region_list option) ?account_ids:(account_ids_ : account_id_list option)
    ?implementation_efforts:(implementation_efforts_ : implementation_effort_list option)
    ?rollback_possible:(rollback_possible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     recommendation_ids = recommendation_ids_;
     resource_arns = resource_arns_;
     resource_ids = resource_ids_;
     tags = tags_;
     action_types = action_types_;
     resource_types = resource_types_;
     regions = regions_;
     account_ids = account_ids_;
     implementation_efforts = implementation_efforts_;
     rollback_possible = rollback_possible_;
     restart_needed = restart_needed_;
   }
    : filter)

let make_list_recommendations_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_results:(max_results_ : max_results option)
    ?include_all_recommendations:
      (include_all_recommendations_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?order_by:(order_by_ : order_by option) ?filter:(filter_ : filter option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     include_all_recommendations = include_all_recommendations_;
     order_by = order_by_;
     filter = filter_;
   }
    : list_recommendations_request)

let make_list_recommendation_summaries_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?metrics:(metrics_ : summary_metrics_result option)
    ?currency_code:(currency_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?group_by:(group_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?items:(items_ : recommendation_summaries_list option)
    ?estimated_total_deduped_savings:
      (estimated_total_deduped_savings_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     next_token = next_token_;
     metrics = metrics_;
     currency_code = currency_code_;
     group_by = group_by_;
     items = items_;
     estimated_total_deduped_savings = estimated_total_deduped_savings_;
   }
    : list_recommendation_summaries_response)

let make_list_recommendation_summaries_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?metrics:(metrics_ : summary_metrics_list option)
    ?max_results:(max_results_ : max_results option) ?filter:(filter_ : filter option)
    ~group_by:(group_by_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     next_token = next_token_;
     metrics = metrics_;
     max_results = max_results_;
     group_by = group_by_;
     filter = filter_;
   }
    : list_recommendation_summaries_request)

let make_account_enrollment_status
    ?created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?last_updated_timestamp:(last_updated_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?status:(status_ : enrollment_status option) ?account_id:(account_id_ : account_id option) () =
  ({
     created_timestamp = created_timestamp_;
     last_updated_timestamp = last_updated_timestamp_;
     status = status_;
     account_id = account_id_;
   }
    : account_enrollment_status)

let make_list_enrollment_statuses_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?include_member_accounts:(include_member_accounts_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?items:(items_ : account_enrollment_statuses option) () =
  ({ next_token = next_token_; include_member_accounts = include_member_accounts_; items = items_ }
    : list_enrollment_statuses_response)

let make_list_enrollment_statuses_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : account_id option)
    ?include_organization_info:
      (include_organization_info_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     account_id = account_id_;
     include_organization_info = include_organization_info_;
   }
    : list_enrollment_statuses_request)

let make_efficiency_metrics_by_group ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?group:(group_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?metrics_by_time:(metrics_by_time_ : metrics_by_time_list option) () =
  ({ message = message_; group = group_; metrics_by_time = metrics_by_time_ }
    : efficiency_metrics_by_group)

let make_list_efficiency_metrics_response
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?efficiency_metrics_by_group:
      (efficiency_metrics_by_group_ : efficiency_metrics_by_group_list option) () =
  ({ next_token = next_token_; efficiency_metrics_by_group = efficiency_metrics_by_group_ }
    : list_efficiency_metrics_response)

let make_list_efficiency_metrics_request
    ?next_token:(next_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?order_by:(order_by_ : order_by option) ?max_results:(max_results_ : max_results option)
    ?group_by:(group_by_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~time_period:(time_period_ : time_period) ~granularity:(granularity_ : granularity_type) () =
  ({
     next_token = next_token_;
     order_by = order_by_;
     max_results = max_results_;
     time_period = time_period_;
     granularity = granularity_;
     group_by = group_by_;
   }
    : list_efficiency_metrics_request)

let make_get_recommendation_response ?tags:(tags_ : tag_list option)
    ?recommended_resource_details:(recommended_resource_details_ : resource_details option)
    ?current_resource_details:(current_resource_details_ : resource_details option)
    ?rollback_possible:(rollback_possible_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?action_type:(action_type_ : action_type option)
    ?restart_needed:(restart_needed_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?implementation_effort:(implementation_effort_ : implementation_effort option)
    ?estimated_monthly_cost:(estimated_monthly_cost_ : Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_monthly_savings:
      (estimated_monthly_savings_ : Smaws_Lib.Smithy_api.Types.double option)
    ?last_refresh_timestamp:(last_refresh_timestamp_ : datetime option)
    ?source:(source_ : source option) ?region:(region_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommended_resource_type:(recommended_resource_type_ : resource_type option)
    ?current_resource_type:(current_resource_type_ : resource_type option)
    ?estimated_savings_over_cost_calculation_lookback_period:
      (estimated_savings_over_cost_calculation_lookback_period_ :
         Smaws_Lib.Smithy_api.Types.double option)
    ?estimated_savings_percentage:
      (estimated_savings_percentage_ : Smaws_Lib.Smithy_api.Types.double option)
    ?cost_calculation_lookback_period_in_days:
      (cost_calculation_lookback_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?recommendation_lookback_period_in_days:
      (recommendation_lookback_period_in_days_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?currency_code:(currency_code_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?account_id:(account_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recommendation_id:(recommendation_id_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     tags = tags_;
     recommended_resource_details = recommended_resource_details_;
     current_resource_details = current_resource_details_;
     rollback_possible = rollback_possible_;
     action_type = action_type_;
     restart_needed = restart_needed_;
     implementation_effort = implementation_effort_;
     estimated_monthly_cost = estimated_monthly_cost_;
     estimated_monthly_savings = estimated_monthly_savings_;
     last_refresh_timestamp = last_refresh_timestamp_;
     source = source_;
     region = region_;
     recommended_resource_type = recommended_resource_type_;
     current_resource_type = current_resource_type_;
     estimated_savings_over_cost_calculation_lookback_period =
       estimated_savings_over_cost_calculation_lookback_period_;
     estimated_savings_percentage = estimated_savings_percentage_;
     cost_calculation_lookback_period_in_days = cost_calculation_lookback_period_in_days_;
     recommendation_lookback_period_in_days = recommendation_lookback_period_in_days_;
     currency_code = currency_code_;
     account_id = account_id_;
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     recommendation_id = recommendation_id_;
   }
    : get_recommendation_response)

let make_get_recommendation_request
    ~recommendation_id:(recommendation_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ recommendation_id = recommendation_id_ } : get_recommendation_request)

let make_get_preferences_response
    ?preferred_commitment:(preferred_commitment_ : preferred_commitment option)
    ?member_account_discount_visibility:
      (member_account_discount_visibility_ : member_account_discount_visibility option)
    ?savings_estimation_mode:(savings_estimation_mode_ : savings_estimation_mode option) () =
  ({
     preferred_commitment = preferred_commitment_;
     member_account_discount_visibility = member_account_discount_visibility_;
     savings_estimation_mode = savings_estimation_mode_;
   }
    : get_preferences_response)

let make_get_preferences_request () = (() : unit)
