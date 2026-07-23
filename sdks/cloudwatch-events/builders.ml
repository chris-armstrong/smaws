open Types

let make_update_connection_response ?connection_arn:(connection_arn_ : connection_arn option)
    ?connection_state:(connection_state_ : connection_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_authorized_time:(last_authorized_time_ : timestamp option) () =
  ({
     connection_arn = connection_arn_;
     connection_state = connection_state_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_authorized_time = last_authorized_time_;
   }
    : update_connection_response)

let make_connection_body_parameter ?key:(key_ : string_ option)
    ?value:(value_ : sensitive_string option) ?is_value_secret:(is_value_secret_ : boolean_ option)
    () =
  ({ key = key_; value = value_; is_value_secret = is_value_secret_ } : connection_body_parameter)

let make_connection_query_string_parameter ?key:(key_ : query_string_key option)
    ?value:(value_ : query_string_value_sensitive option)
    ?is_value_secret:(is_value_secret_ : boolean_ option) () =
  ({ key = key_; value = value_; is_value_secret = is_value_secret_ }
    : connection_query_string_parameter)

let make_connection_header_parameter ?key:(key_ : header_key option)
    ?value:(value_ : header_value_sensitive option)
    ?is_value_secret:(is_value_secret_ : boolean_ option) () =
  ({ key = key_; value = value_; is_value_secret = is_value_secret_ } : connection_header_parameter)

let make_connection_http_parameters
    ?header_parameters:(header_parameters_ : connection_header_parameters_list option)
    ?query_string_parameters:
      (query_string_parameters_ : connection_query_string_parameters_list option)
    ?body_parameters:(body_parameters_ : connection_body_parameters_list option) () =
  ({
     header_parameters = header_parameters_;
     query_string_parameters = query_string_parameters_;
     body_parameters = body_parameters_;
   }
    : connection_http_parameters)

let make_update_connection_api_key_auth_request_parameters
    ?api_key_name:(api_key_name_ : auth_header_parameters option)
    ?api_key_value:(api_key_value_ : auth_header_parameters_sensitive option) () =
  ({ api_key_name = api_key_name_; api_key_value = api_key_value_ }
    : update_connection_api_key_auth_request_parameters)

let make_update_connection_o_auth_client_request_parameters
    ?client_i_d:(client_i_d_ : auth_header_parameters option)
    ?client_secret:(client_secret_ : auth_header_parameters_sensitive option) () =
  ({ client_i_d = client_i_d_; client_secret = client_secret_ }
    : update_connection_o_auth_client_request_parameters)

let make_update_connection_o_auth_request_parameters
    ?client_parameters:
      (client_parameters_ : update_connection_o_auth_client_request_parameters option)
    ?authorization_endpoint:(authorization_endpoint_ : https_endpoint option)
    ?http_method:(http_method_ : connection_o_auth_http_method option)
    ?o_auth_http_parameters:(o_auth_http_parameters_ : connection_http_parameters option) () =
  ({
     client_parameters = client_parameters_;
     authorization_endpoint = authorization_endpoint_;
     http_method = http_method_;
     o_auth_http_parameters = o_auth_http_parameters_;
   }
    : update_connection_o_auth_request_parameters)

let make_update_connection_basic_auth_request_parameters
    ?username:(username_ : auth_header_parameters option)
    ?password:(password_ : auth_header_parameters_sensitive option) () =
  ({ username = username_; password = password_ } : update_connection_basic_auth_request_parameters)

let make_update_connection_auth_request_parameters
    ?basic_auth_parameters:
      (basic_auth_parameters_ : update_connection_basic_auth_request_parameters option)
    ?o_auth_parameters:(o_auth_parameters_ : update_connection_o_auth_request_parameters option)
    ?api_key_auth_parameters:
      (api_key_auth_parameters_ : update_connection_api_key_auth_request_parameters option)
    ?invocation_http_parameters:(invocation_http_parameters_ : connection_http_parameters option) ()
    =
  ({
     basic_auth_parameters = basic_auth_parameters_;
     o_auth_parameters = o_auth_parameters_;
     api_key_auth_parameters = api_key_auth_parameters_;
     invocation_http_parameters = invocation_http_parameters_;
   }
    : update_connection_auth_request_parameters)

let make_update_connection_request ?description:(description_ : connection_description option)
    ?authorization_type:(authorization_type_ : connection_authorization_type option)
    ?auth_parameters:(auth_parameters_ : update_connection_auth_request_parameters option)
    ~name:(name_ : connection_name) () =
  ({
     name = name_;
     description = description_;
     authorization_type = authorization_type_;
     auth_parameters = auth_parameters_;
   }
    : update_connection_request)

let make_update_archive_response ?archive_arn:(archive_arn_ : archive_arn option)
    ?state:(state_ : archive_state option)
    ?state_reason:(state_reason_ : archive_state_reason option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     archive_arn = archive_arn_;
     state = state_;
     state_reason = state_reason_;
     creation_time = creation_time_;
   }
    : update_archive_response)

let make_update_archive_request ?description:(description_ : archive_description option)
    ?event_pattern:(event_pattern_ : event_pattern option)
    ?retention_days:(retention_days_ : retention_days option)
    ~archive_name:(archive_name_ : archive_name) () =
  ({
     archive_name = archive_name_;
     description = description_;
     event_pattern = event_pattern_;
     retention_days = retention_days_;
   }
    : update_archive_request)

let make_update_api_destination_response
    ?api_destination_arn:(api_destination_arn_ : api_destination_arn option)
    ?api_destination_state:(api_destination_state_ : api_destination_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     api_destination_arn = api_destination_arn_;
     api_destination_state = api_destination_state_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : update_api_destination_response)

let make_update_api_destination_request
    ?description:(description_ : api_destination_description option)
    ?connection_arn:(connection_arn_ : connection_arn option)
    ?invocation_endpoint:(invocation_endpoint_ : https_endpoint option)
    ?http_method:(http_method_ : api_destination_http_method option)
    ?invocation_rate_limit_per_second:
      (invocation_rate_limit_per_second_ : api_destination_invocation_rate_limit_per_second option)
    ~name:(name_ : api_destination_name) () =
  ({
     name = name_;
     description = description_;
     connection_arn = connection_arn_;
     invocation_endpoint = invocation_endpoint_;
     http_method = http_method_;
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
   }
    : update_api_destination_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_test_event_pattern_response ?result_:(result__ : boolean_ option) () =
  ({ result_ = result__ } : test_event_pattern_response)

let make_test_event_pattern_request ~event_pattern:(event_pattern_ : event_pattern)
    ~event:(event_ : string_) () =
  ({ event_pattern = event_pattern_; event = event_ } : test_event_pattern_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : arn) ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_start_replay_response ?replay_arn:(replay_arn_ : replay_arn option)
    ?state:(state_ : replay_state option) ?state_reason:(state_reason_ : replay_state_reason option)
    ?replay_start_time:(replay_start_time_ : timestamp option) () =
  ({
     replay_arn = replay_arn_;
     state = state_;
     state_reason = state_reason_;
     replay_start_time = replay_start_time_;
   }
    : start_replay_response)

let make_replay_destination ?filter_arns:(filter_arns_ : replay_destination_filters option)
    ~arn:(arn_ : arn) () =
  ({ arn = arn_; filter_arns = filter_arns_ } : replay_destination)

let make_start_replay_request ?description:(description_ : replay_description option)
    ~replay_name:(replay_name_ : replay_name) ~event_source_arn:(event_source_arn_ : arn)
    ~event_start_time:(event_start_time_ : timestamp) ~event_end_time:(event_end_time_ : timestamp)
    ~destination:(destination_ : replay_destination) () =
  ({
     replay_name = replay_name_;
     description = description_;
     event_source_arn = event_source_arn_;
     event_start_time = event_start_time_;
     event_end_time = event_end_time_;
     destination = destination_;
   }
    : start_replay_request)

let make_remove_targets_result_entry ?target_id:(target_id_ : target_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ target_id = target_id_; error_code = error_code_; error_message = error_message_ }
    : remove_targets_result_entry)

let make_remove_targets_response ?failed_entry_count:(failed_entry_count_ : integer option)
    ?failed_entries:(failed_entries_ : remove_targets_result_entry_list option) () =
  ({ failed_entry_count = failed_entry_count_; failed_entries = failed_entries_ }
    : remove_targets_response)

let make_remove_targets_request ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ?force:(force_ : boolean_ option) ~rule:(rule_ : rule_name) ~ids:(ids_ : target_id_list) () =
  ({ rule = rule_; event_bus_name = event_bus_name_; ids = ids_; force = force_ }
    : remove_targets_request)

let make_remove_permission_request ?statement_id:(statement_id_ : statement_id option)
    ?remove_all_permissions:(remove_all_permissions_ : boolean_ option)
    ?event_bus_name:(event_bus_name_ : non_partner_event_bus_name option) () =
  ({
     statement_id = statement_id_;
     remove_all_permissions = remove_all_permissions_;
     event_bus_name = event_bus_name_;
   }
    : remove_permission_request)

let make_put_targets_result_entry ?target_id:(target_id_ : target_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ target_id = target_id_; error_code = error_code_; error_message = error_message_ }
    : put_targets_result_entry)

let make_put_targets_response ?failed_entry_count:(failed_entry_count_ : integer option)
    ?failed_entries:(failed_entries_ : put_targets_result_entry_list option) () =
  ({ failed_entry_count = failed_entry_count_; failed_entries = failed_entries_ }
    : put_targets_response)

let make_retry_policy
    ?maximum_retry_attempts:(maximum_retry_attempts_ : maximum_retry_attempts option)
    ?maximum_event_age_in_seconds:
      (maximum_event_age_in_seconds_ : maximum_event_age_in_seconds option) () =
  ({
     maximum_retry_attempts = maximum_retry_attempts_;
     maximum_event_age_in_seconds = maximum_event_age_in_seconds_;
   }
    : retry_policy)

let make_dead_letter_config ?arn:(arn_ : resource_arn option) () =
  ({ arn = arn_ } : dead_letter_config)

let make_sage_maker_pipeline_parameter ~name:(name_ : sage_maker_pipeline_parameter_name)
    ~value:(value_ : sage_maker_pipeline_parameter_value) () =
  ({ name = name_; value = value_ } : sage_maker_pipeline_parameter)

let make_sage_maker_pipeline_parameters
    ?pipeline_parameter_list:(pipeline_parameter_list_ : sage_maker_pipeline_parameter_list option)
    () =
  ({ pipeline_parameter_list = pipeline_parameter_list_ } : sage_maker_pipeline_parameters)

let make_redshift_data_parameters
    ?secret_manager_arn:(secret_manager_arn_ : redshift_secret_manager_arn option)
    ?db_user:(db_user_ : db_user option) ?statement_name:(statement_name_ : statement_name option)
    ?with_event:(with_event_ : boolean_ option) ~database:(database_ : database) ~sql:(sql_ : sql)
    () =
  ({
     secret_manager_arn = secret_manager_arn_;
     database = database_;
     db_user = db_user_;
     sql = sql_;
     statement_name = statement_name_;
     with_event = with_event_;
   }
    : redshift_data_parameters)

let make_http_parameters
    ?path_parameter_values:(path_parameter_values_ : path_parameter_list option)
    ?header_parameters:(header_parameters_ : header_parameters_map option)
    ?query_string_parameters:(query_string_parameters_ : query_string_parameters_map option) () =
  ({
     path_parameter_values = path_parameter_values_;
     header_parameters = header_parameters_;
     query_string_parameters = query_string_parameters_;
   }
    : http_parameters)

let make_sqs_parameters ?message_group_id:(message_group_id_ : message_group_id option) () =
  ({ message_group_id = message_group_id_ } : sqs_parameters)

let make_batch_retry_strategy ?attempts:(attempts_ : integer option) () =
  ({ attempts = attempts_ } : batch_retry_strategy)

let make_batch_array_properties ?size:(size_ : integer option) () =
  ({ size = size_ } : batch_array_properties)

let make_batch_parameters ?array_properties:(array_properties_ : batch_array_properties option)
    ?retry_strategy:(retry_strategy_ : batch_retry_strategy option)
    ~job_definition:(job_definition_ : string_) ~job_name:(job_name_ : string_) () =
  ({
     job_definition = job_definition_;
     job_name = job_name_;
     array_properties = array_properties_;
     retry_strategy = retry_strategy_;
   }
    : batch_parameters)

let make_placement_strategy ?type_:(type__ : placement_strategy_type option)
    ?field:(field_ : placement_strategy_field option) () =
  ({ type_ = type__; field = field_ } : placement_strategy)

let make_placement_constraint ?type_:(type__ : placement_constraint_type option)
    ?expression:(expression_ : placement_constraint_expression option) () =
  ({ type_ = type__; expression = expression_ } : placement_constraint)

let make_capacity_provider_strategy_item
    ?weight:(weight_ : capacity_provider_strategy_item_weight option)
    ?base:(base_ : capacity_provider_strategy_item_base option)
    ~capacity_provider:(capacity_provider_ : capacity_provider) () =
  ({ capacity_provider = capacity_provider_; weight = weight_; base = base_ }
    : capacity_provider_strategy_item)

let make_aws_vpc_configuration ?security_groups:(security_groups_ : string_list option)
    ?assign_public_ip:(assign_public_ip_ : assign_public_ip option)
    ~subnets:(subnets_ : string_list) () =
  ({ subnets = subnets_; security_groups = security_groups_; assign_public_ip = assign_public_ip_ }
    : aws_vpc_configuration)

let make_network_configuration
    ?awsvpc_configuration:(awsvpc_configuration_ : aws_vpc_configuration option) () =
  ({ awsvpc_configuration = awsvpc_configuration_ } : network_configuration)

let make_ecs_parameters ?task_count:(task_count_ : limit_min1 option)
    ?launch_type:(launch_type_ : launch_type option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?platform_version:(platform_version_ : string_ option) ?group:(group_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?reference_id:(reference_id_ : reference_id option) ?tags:(tags_ : tag_list option)
    ~task_definition_arn:(task_definition_arn_ : arn) () =
  ({
     task_definition_arn = task_definition_arn_;
     task_count = task_count_;
     launch_type = launch_type_;
     network_configuration = network_configuration_;
     platform_version = platform_version_;
     group = group_;
     capacity_provider_strategy = capacity_provider_strategy_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     enable_execute_command = enable_execute_command_;
     placement_constraints = placement_constraints_;
     placement_strategy = placement_strategy_;
     propagate_tags = propagate_tags_;
     reference_id = reference_id_;
     tags = tags_;
   }
    : ecs_parameters)

let make_run_command_target ~key:(key_ : run_command_target_key)
    ~values:(values_ : run_command_target_values) () =
  ({ key = key_; values = values_ } : run_command_target)

let make_run_command_parameters ~run_command_targets:(run_command_targets_ : run_command_targets) ()
    =
  ({ run_command_targets = run_command_targets_ } : run_command_parameters)

let make_kinesis_parameters ~partition_key_path:(partition_key_path_ : target_partition_key_path) ()
    =
  ({ partition_key_path = partition_key_path_ } : kinesis_parameters)

let make_input_transformer ?input_paths_map:(input_paths_map_ : transformer_paths option)
    ~input_template:(input_template_ : transformer_input) () =
  ({ input_paths_map = input_paths_map_; input_template = input_template_ } : input_transformer)

let make_target ?role_arn:(role_arn_ : role_arn option) ?input:(input_ : target_input option)
    ?input_path:(input_path_ : target_input_path option)
    ?input_transformer:(input_transformer_ : input_transformer option)
    ?kinesis_parameters:(kinesis_parameters_ : kinesis_parameters option)
    ?run_command_parameters:(run_command_parameters_ : run_command_parameters option)
    ?ecs_parameters:(ecs_parameters_ : ecs_parameters option)
    ?batch_parameters:(batch_parameters_ : batch_parameters option)
    ?sqs_parameters:(sqs_parameters_ : sqs_parameters option)
    ?http_parameters:(http_parameters_ : http_parameters option)
    ?redshift_data_parameters:(redshift_data_parameters_ : redshift_data_parameters option)
    ?sage_maker_pipeline_parameters:
      (sage_maker_pipeline_parameters_ : sage_maker_pipeline_parameters option)
    ?dead_letter_config:(dead_letter_config_ : dead_letter_config option)
    ?retry_policy:(retry_policy_ : retry_policy option) ~id:(id_ : target_id)
    ~arn:(arn_ : target_arn) () =
  ({
     id = id_;
     arn = arn_;
     role_arn = role_arn_;
     input = input_;
     input_path = input_path_;
     input_transformer = input_transformer_;
     kinesis_parameters = kinesis_parameters_;
     run_command_parameters = run_command_parameters_;
     ecs_parameters = ecs_parameters_;
     batch_parameters = batch_parameters_;
     sqs_parameters = sqs_parameters_;
     http_parameters = http_parameters_;
     redshift_data_parameters = redshift_data_parameters_;
     sage_maker_pipeline_parameters = sage_maker_pipeline_parameters_;
     dead_letter_config = dead_letter_config_;
     retry_policy = retry_policy_;
   }
    : target)

let make_put_targets_request ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ~rule:(rule_ : rule_name) ~targets:(targets_ : target_list) () =
  ({ rule = rule_; event_bus_name = event_bus_name_; targets = targets_ } : put_targets_request)

let make_put_rule_response ?rule_arn:(rule_arn_ : rule_arn option) () =
  ({ rule_arn = rule_arn_ } : put_rule_response)

let make_put_rule_request ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?event_pattern:(event_pattern_ : event_pattern option) ?state:(state_ : rule_state option)
    ?description:(description_ : rule_description option) ?role_arn:(role_arn_ : role_arn option)
    ?tags:(tags_ : tag_list option) ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ~name:(name_ : rule_name) () =
  ({
     name = name_;
     schedule_expression = schedule_expression_;
     event_pattern = event_pattern_;
     state = state_;
     description = description_;
     role_arn = role_arn_;
     tags = tags_;
     event_bus_name = event_bus_name_;
   }
    : put_rule_request)

let make_condition ~type_:(type__ : string_) ~key:(key_ : string_) ~value:(value_ : string_) () =
  ({ type_ = type__; key = key_; value = value_ } : condition)

let make_put_permission_request
    ?event_bus_name:(event_bus_name_ : non_partner_event_bus_name option)
    ?action:(action_ : action option) ?principal:(principal_ : principal option)
    ?statement_id:(statement_id_ : statement_id option) ?condition:(condition_ : condition option)
    ?policy:(policy_ : string_ option) () =
  ({
     event_bus_name = event_bus_name_;
     action = action_;
     principal = principal_;
     statement_id = statement_id_;
     condition = condition_;
     policy = policy_;
   }
    : put_permission_request)

let make_put_partner_events_result_entry ?event_id:(event_id_ : event_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ event_id = event_id_; error_code = error_code_; error_message = error_message_ }
    : put_partner_events_result_entry)

let make_put_partner_events_response ?failed_entry_count:(failed_entry_count_ : integer option)
    ?entries:(entries_ : put_partner_events_result_entry_list option) () =
  ({ failed_entry_count = failed_entry_count_; entries = entries_ } : put_partner_events_response)

let make_put_partner_events_request_entry ?time:(time_ : event_time option)
    ?source:(source_ : event_source_name option)
    ?resources:(resources_ : event_resource_list option)
    ?detail_type:(detail_type_ : string_ option) ?detail:(detail_ : string_ option) () =
  ({
     time = time_;
     source = source_;
     resources = resources_;
     detail_type = detail_type_;
     detail = detail_;
   }
    : put_partner_events_request_entry)

let make_put_partner_events_request ~entries:(entries_ : put_partner_events_request_entry_list) () =
  ({ entries = entries_ } : put_partner_events_request)

let make_put_events_result_entry ?event_id:(event_id_ : event_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ event_id = event_id_; error_code = error_code_; error_message = error_message_ }
    : put_events_result_entry)

let make_put_events_response ?failed_entry_count:(failed_entry_count_ : integer option)
    ?entries:(entries_ : put_events_result_entry_list option) () =
  ({ failed_entry_count = failed_entry_count_; entries = entries_ } : put_events_response)

let make_put_events_request_entry ?time:(time_ : event_time option)
    ?source:(source_ : string_ option) ?resources:(resources_ : event_resource_list option)
    ?detail_type:(detail_type_ : string_ option) ?detail:(detail_ : string_ option)
    ?event_bus_name:(event_bus_name_ : non_partner_event_bus_name_or_arn option)
    ?trace_header:(trace_header_ : trace_header option) () =
  ({
     time = time_;
     source = source_;
     resources = resources_;
     detail_type = detail_type_;
     detail = detail_;
     event_bus_name = event_bus_name_;
     trace_header = trace_header_;
   }
    : put_events_request_entry)

let make_put_events_request ~entries:(entries_ : put_events_request_entry_list) () =
  ({ entries = entries_ } : put_events_request)

let make_list_targets_by_rule_response ?targets:(targets_ : target_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ targets = targets_; next_token = next_token_ } : list_targets_by_rule_response)

let make_list_targets_by_rule_request
    ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option)
    ~rule:(rule_ : rule_name) () =
  ({ rule = rule_; event_bus_name = event_bus_name_; next_token = next_token_; limit = limit_ }
    : list_targets_by_rule_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : arn) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_rule ?name:(name_ : rule_name option) ?arn:(arn_ : rule_arn option)
    ?event_pattern:(event_pattern_ : event_pattern option) ?state:(state_ : rule_state option)
    ?description:(description_ : rule_description option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?role_arn:(role_arn_ : role_arn option) ?managed_by:(managed_by_ : managed_by option)
    ?event_bus_name:(event_bus_name_ : event_bus_name option) () =
  ({
     name = name_;
     arn = arn_;
     event_pattern = event_pattern_;
     state = state_;
     description = description_;
     schedule_expression = schedule_expression_;
     role_arn = role_arn_;
     managed_by = managed_by_;
     event_bus_name = event_bus_name_;
   }
    : rule)

let make_list_rules_response ?rules:(rules_ : rule_response_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ rules = rules_; next_token = next_token_ } : list_rules_response)

let make_list_rules_request ?name_prefix:(name_prefix_ : rule_name option)
    ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option) () =
  ({
     name_prefix = name_prefix_;
     event_bus_name = event_bus_name_;
     next_token = next_token_;
     limit = limit_;
   }
    : list_rules_request)

let make_list_rule_names_by_target_response ?rule_names:(rule_names_ : rule_name_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ rule_names = rule_names_; next_token = next_token_ } : list_rule_names_by_target_response)

let make_list_rule_names_by_target_request
    ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option)
    ~target_arn:(target_arn_ : target_arn) () =
  ({
     target_arn = target_arn_;
     event_bus_name = event_bus_name_;
     next_token = next_token_;
     limit = limit_;
   }
    : list_rule_names_by_target_request)

let make_replay ?replay_name:(replay_name_ : replay_name option)
    ?event_source_arn:(event_source_arn_ : arn option) ?state:(state_ : replay_state option)
    ?state_reason:(state_reason_ : replay_state_reason option)
    ?event_start_time:(event_start_time_ : timestamp option)
    ?event_end_time:(event_end_time_ : timestamp option)
    ?event_last_replayed_time:(event_last_replayed_time_ : timestamp option)
    ?replay_start_time:(replay_start_time_ : timestamp option)
    ?replay_end_time:(replay_end_time_ : timestamp option) () =
  ({
     replay_name = replay_name_;
     event_source_arn = event_source_arn_;
     state = state_;
     state_reason = state_reason_;
     event_start_time = event_start_time_;
     event_end_time = event_end_time_;
     event_last_replayed_time = event_last_replayed_time_;
     replay_start_time = replay_start_time_;
     replay_end_time = replay_end_time_;
   }
    : replay)

let make_list_replays_response ?replays:(replays_ : replay_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ replays = replays_; next_token = next_token_ } : list_replays_response)

let make_list_replays_request ?name_prefix:(name_prefix_ : replay_name option)
    ?state:(state_ : replay_state option) ?event_source_arn:(event_source_arn_ : arn option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option) () =
  ({
     name_prefix = name_prefix_;
     state = state_;
     event_source_arn = event_source_arn_;
     next_token = next_token_;
     limit = limit_;
   }
    : list_replays_request)

let make_partner_event_source ?arn:(arn_ : string_ option) ?name:(name_ : string_ option) () =
  ({ arn = arn_; name = name_ } : partner_event_source)

let make_list_partner_event_sources_response
    ?partner_event_sources:(partner_event_sources_ : partner_event_source_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ partner_event_sources = partner_event_sources_; next_token = next_token_ }
    : list_partner_event_sources_response)

let make_list_partner_event_sources_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : limit_max100 option)
    ~name_prefix:(name_prefix_ : partner_event_source_name_prefix) () =
  ({ name_prefix = name_prefix_; next_token = next_token_; limit = limit_ }
    : list_partner_event_sources_request)

let make_partner_event_source_account ?account:(account_ : account_id option)
    ?creation_time:(creation_time_ : timestamp option)
    ?expiration_time:(expiration_time_ : timestamp option)
    ?state:(state_ : event_source_state option) () =
  ({
     account = account_;
     creation_time = creation_time_;
     expiration_time = expiration_time_;
     state = state_;
   }
    : partner_event_source_account)

let make_list_partner_event_source_accounts_response
    ?partner_event_source_accounts:
      (partner_event_source_accounts_ : partner_event_source_account_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ partner_event_source_accounts = partner_event_source_accounts_; next_token = next_token_ }
    : list_partner_event_source_accounts_response)

let make_list_partner_event_source_accounts_request ?next_token:(next_token_ : next_token option)
    ?limit:(limit_ : limit_max100 option)
    ~event_source_name:(event_source_name_ : event_source_name) () =
  ({ event_source_name = event_source_name_; next_token = next_token_; limit = limit_ }
    : list_partner_event_source_accounts_request)

let make_event_source ?arn:(arn_ : string_ option) ?created_by:(created_by_ : string_ option)
    ?creation_time:(creation_time_ : timestamp option)
    ?expiration_time:(expiration_time_ : timestamp option) ?name:(name_ : string_ option)
    ?state:(state_ : event_source_state option) () =
  ({
     arn = arn_;
     created_by = created_by_;
     creation_time = creation_time_;
     expiration_time = expiration_time_;
     name = name_;
     state = state_;
   }
    : event_source)

let make_list_event_sources_response ?event_sources:(event_sources_ : event_source_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ event_sources = event_sources_; next_token = next_token_ } : list_event_sources_response)

let make_list_event_sources_request ?name_prefix:(name_prefix_ : event_source_name_prefix option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option) () =
  ({ name_prefix = name_prefix_; next_token = next_token_; limit = limit_ }
    : list_event_sources_request)

let make_event_bus ?name:(name_ : string_ option) ?arn:(arn_ : string_ option)
    ?policy:(policy_ : string_ option) () =
  ({ name = name_; arn = arn_; policy = policy_ } : event_bus)

let make_list_event_buses_response ?event_buses:(event_buses_ : event_bus_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ event_buses = event_buses_; next_token = next_token_ } : list_event_buses_response)

let make_list_event_buses_request ?name_prefix:(name_prefix_ : event_bus_name option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option) () =
  ({ name_prefix = name_prefix_; next_token = next_token_; limit = limit_ }
    : list_event_buses_request)

let make_connection ?connection_arn:(connection_arn_ : connection_arn option)
    ?name:(name_ : connection_name option)
    ?connection_state:(connection_state_ : connection_state option)
    ?state_reason:(state_reason_ : connection_state_reason option)
    ?authorization_type:(authorization_type_ : connection_authorization_type option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_authorized_time:(last_authorized_time_ : timestamp option) () =
  ({
     connection_arn = connection_arn_;
     name = name_;
     connection_state = connection_state_;
     state_reason = state_reason_;
     authorization_type = authorization_type_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_authorized_time = last_authorized_time_;
   }
    : connection)

let make_list_connections_response ?connections:(connections_ : connection_response_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ connections = connections_; next_token = next_token_ } : list_connections_response)

let make_list_connections_request ?name_prefix:(name_prefix_ : connection_name option)
    ?connection_state:(connection_state_ : connection_state option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option) () =
  ({
     name_prefix = name_prefix_;
     connection_state = connection_state_;
     next_token = next_token_;
     limit = limit_;
   }
    : list_connections_request)

let make_archive ?archive_name:(archive_name_ : archive_name option)
    ?event_source_arn:(event_source_arn_ : arn option) ?state:(state_ : archive_state option)
    ?state_reason:(state_reason_ : archive_state_reason option)
    ?retention_days:(retention_days_ : retention_days option)
    ?size_bytes:(size_bytes_ : long option) ?event_count:(event_count_ : long option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     archive_name = archive_name_;
     event_source_arn = event_source_arn_;
     state = state_;
     state_reason = state_reason_;
     retention_days = retention_days_;
     size_bytes = size_bytes_;
     event_count = event_count_;
     creation_time = creation_time_;
   }
    : archive)

let make_list_archives_response ?archives:(archives_ : archive_response_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ archives = archives_; next_token = next_token_ } : list_archives_response)

let make_list_archives_request ?name_prefix:(name_prefix_ : archive_name option)
    ?event_source_arn:(event_source_arn_ : arn option) ?state:(state_ : archive_state option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option) () =
  ({
     name_prefix = name_prefix_;
     event_source_arn = event_source_arn_;
     state = state_;
     next_token = next_token_;
     limit = limit_;
   }
    : list_archives_request)

let make_api_destination ?api_destination_arn:(api_destination_arn_ : api_destination_arn option)
    ?name:(name_ : api_destination_name option)
    ?api_destination_state:(api_destination_state_ : api_destination_state option)
    ?connection_arn:(connection_arn_ : connection_arn option)
    ?invocation_endpoint:(invocation_endpoint_ : https_endpoint option)
    ?http_method:(http_method_ : api_destination_http_method option)
    ?invocation_rate_limit_per_second:
      (invocation_rate_limit_per_second_ : api_destination_invocation_rate_limit_per_second option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     api_destination_arn = api_destination_arn_;
     name = name_;
     api_destination_state = api_destination_state_;
     connection_arn = connection_arn_;
     invocation_endpoint = invocation_endpoint_;
     http_method = http_method_;
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : api_destination)

let make_list_api_destinations_response
    ?api_destinations:(api_destinations_ : api_destination_response_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ api_destinations = api_destinations_; next_token = next_token_ }
    : list_api_destinations_response)

let make_list_api_destinations_request ?name_prefix:(name_prefix_ : api_destination_name option)
    ?connection_arn:(connection_arn_ : connection_arn option)
    ?next_token:(next_token_ : next_token option) ?limit:(limit_ : limit_max100 option) () =
  ({
     name_prefix = name_prefix_;
     connection_arn = connection_arn_;
     next_token = next_token_;
     limit = limit_;
   }
    : list_api_destinations_request)

let make_enable_rule_request ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ~name:(name_ : rule_name) () =
  ({ name = name_; event_bus_name = event_bus_name_ } : enable_rule_request)

let make_disable_rule_request ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ~name:(name_ : rule_name) () =
  ({ name = name_; event_bus_name = event_bus_name_ } : disable_rule_request)

let make_describe_rule_response ?name:(name_ : rule_name option) ?arn:(arn_ : rule_arn option)
    ?event_pattern:(event_pattern_ : event_pattern option)
    ?schedule_expression:(schedule_expression_ : schedule_expression option)
    ?state:(state_ : rule_state option) ?description:(description_ : rule_description option)
    ?role_arn:(role_arn_ : role_arn option) ?managed_by:(managed_by_ : managed_by option)
    ?event_bus_name:(event_bus_name_ : event_bus_name option)
    ?created_by:(created_by_ : created_by option) () =
  ({
     name = name_;
     arn = arn_;
     event_pattern = event_pattern_;
     schedule_expression = schedule_expression_;
     state = state_;
     description = description_;
     role_arn = role_arn_;
     managed_by = managed_by_;
     event_bus_name = event_bus_name_;
     created_by = created_by_;
   }
    : describe_rule_response)

let make_describe_rule_request ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ~name:(name_ : rule_name) () =
  ({ name = name_; event_bus_name = event_bus_name_ } : describe_rule_request)

let make_describe_replay_response ?replay_name:(replay_name_ : replay_name option)
    ?replay_arn:(replay_arn_ : replay_arn option)
    ?description:(description_ : replay_description option) ?state:(state_ : replay_state option)
    ?state_reason:(state_reason_ : replay_state_reason option)
    ?event_source_arn:(event_source_arn_ : arn option)
    ?destination:(destination_ : replay_destination option)
    ?event_start_time:(event_start_time_ : timestamp option)
    ?event_end_time:(event_end_time_ : timestamp option)
    ?event_last_replayed_time:(event_last_replayed_time_ : timestamp option)
    ?replay_start_time:(replay_start_time_ : timestamp option)
    ?replay_end_time:(replay_end_time_ : timestamp option) () =
  ({
     replay_name = replay_name_;
     replay_arn = replay_arn_;
     description = description_;
     state = state_;
     state_reason = state_reason_;
     event_source_arn = event_source_arn_;
     destination = destination_;
     event_start_time = event_start_time_;
     event_end_time = event_end_time_;
     event_last_replayed_time = event_last_replayed_time_;
     replay_start_time = replay_start_time_;
     replay_end_time = replay_end_time_;
   }
    : describe_replay_response)

let make_describe_replay_request ~replay_name:(replay_name_ : replay_name) () =
  ({ replay_name = replay_name_ } : describe_replay_request)

let make_describe_partner_event_source_response ?arn:(arn_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ arn = arn_; name = name_ } : describe_partner_event_source_response)

let make_describe_partner_event_source_request ~name:(name_ : event_source_name) () =
  ({ name = name_ } : describe_partner_event_source_request)

let make_describe_event_source_response ?arn:(arn_ : string_ option)
    ?created_by:(created_by_ : string_ option) ?creation_time:(creation_time_ : timestamp option)
    ?expiration_time:(expiration_time_ : timestamp option) ?name:(name_ : string_ option)
    ?state:(state_ : event_source_state option) () =
  ({
     arn = arn_;
     created_by = created_by_;
     creation_time = creation_time_;
     expiration_time = expiration_time_;
     name = name_;
     state = state_;
   }
    : describe_event_source_response)

let make_describe_event_source_request ~name:(name_ : event_source_name) () =
  ({ name = name_ } : describe_event_source_request)

let make_describe_event_bus_response ?name:(name_ : string_ option) ?arn:(arn_ : string_ option)
    ?policy:(policy_ : string_ option) () =
  ({ name = name_; arn = arn_; policy = policy_ } : describe_event_bus_response)

let make_describe_event_bus_request ?name:(name_ : event_bus_name_or_arn option) () =
  ({ name = name_ } : describe_event_bus_request)

let make_connection_api_key_auth_response_parameters
    ?api_key_name:(api_key_name_ : auth_header_parameters option) () =
  ({ api_key_name = api_key_name_ } : connection_api_key_auth_response_parameters)

let make_connection_o_auth_client_response_parameters
    ?client_i_d:(client_i_d_ : auth_header_parameters option) () =
  ({ client_i_d = client_i_d_ } : connection_o_auth_client_response_parameters)

let make_connection_o_auth_response_parameters
    ?client_parameters:(client_parameters_ : connection_o_auth_client_response_parameters option)
    ?authorization_endpoint:(authorization_endpoint_ : https_endpoint option)
    ?http_method:(http_method_ : connection_o_auth_http_method option)
    ?o_auth_http_parameters:(o_auth_http_parameters_ : connection_http_parameters option) () =
  ({
     client_parameters = client_parameters_;
     authorization_endpoint = authorization_endpoint_;
     http_method = http_method_;
     o_auth_http_parameters = o_auth_http_parameters_;
   }
    : connection_o_auth_response_parameters)

let make_connection_basic_auth_response_parameters
    ?username:(username_ : auth_header_parameters option) () =
  ({ username = username_ } : connection_basic_auth_response_parameters)

let make_connection_auth_response_parameters
    ?basic_auth_parameters:
      (basic_auth_parameters_ : connection_basic_auth_response_parameters option)
    ?o_auth_parameters:(o_auth_parameters_ : connection_o_auth_response_parameters option)
    ?api_key_auth_parameters:
      (api_key_auth_parameters_ : connection_api_key_auth_response_parameters option)
    ?invocation_http_parameters:(invocation_http_parameters_ : connection_http_parameters option) ()
    =
  ({
     basic_auth_parameters = basic_auth_parameters_;
     o_auth_parameters = o_auth_parameters_;
     api_key_auth_parameters = api_key_auth_parameters_;
     invocation_http_parameters = invocation_http_parameters_;
   }
    : connection_auth_response_parameters)

let make_describe_connection_response ?connection_arn:(connection_arn_ : connection_arn option)
    ?name:(name_ : connection_name option)
    ?description:(description_ : connection_description option)
    ?connection_state:(connection_state_ : connection_state option)
    ?state_reason:(state_reason_ : connection_state_reason option)
    ?authorization_type:(authorization_type_ : connection_authorization_type option)
    ?secret_arn:(secret_arn_ : secrets_manager_secret_arn option)
    ?auth_parameters:(auth_parameters_ : connection_auth_response_parameters option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_authorized_time:(last_authorized_time_ : timestamp option) () =
  ({
     connection_arn = connection_arn_;
     name = name_;
     description = description_;
     connection_state = connection_state_;
     state_reason = state_reason_;
     authorization_type = authorization_type_;
     secret_arn = secret_arn_;
     auth_parameters = auth_parameters_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_authorized_time = last_authorized_time_;
   }
    : describe_connection_response)

let make_describe_connection_request ~name:(name_ : connection_name) () =
  ({ name = name_ } : describe_connection_request)

let make_describe_archive_response ?archive_arn:(archive_arn_ : archive_arn option)
    ?archive_name:(archive_name_ : archive_name option)
    ?event_source_arn:(event_source_arn_ : arn option)
    ?description:(description_ : archive_description option)
    ?event_pattern:(event_pattern_ : event_pattern option) ?state:(state_ : archive_state option)
    ?state_reason:(state_reason_ : archive_state_reason option)
    ?retention_days:(retention_days_ : retention_days option)
    ?size_bytes:(size_bytes_ : long option) ?event_count:(event_count_ : long option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     archive_arn = archive_arn_;
     archive_name = archive_name_;
     event_source_arn = event_source_arn_;
     description = description_;
     event_pattern = event_pattern_;
     state = state_;
     state_reason = state_reason_;
     retention_days = retention_days_;
     size_bytes = size_bytes_;
     event_count = event_count_;
     creation_time = creation_time_;
   }
    : describe_archive_response)

let make_describe_archive_request ~archive_name:(archive_name_ : archive_name) () =
  ({ archive_name = archive_name_ } : describe_archive_request)

let make_describe_api_destination_response
    ?api_destination_arn:(api_destination_arn_ : api_destination_arn option)
    ?name:(name_ : api_destination_name option)
    ?description:(description_ : api_destination_description option)
    ?api_destination_state:(api_destination_state_ : api_destination_state option)
    ?connection_arn:(connection_arn_ : connection_arn option)
    ?invocation_endpoint:(invocation_endpoint_ : https_endpoint option)
    ?http_method:(http_method_ : api_destination_http_method option)
    ?invocation_rate_limit_per_second:
      (invocation_rate_limit_per_second_ : api_destination_invocation_rate_limit_per_second option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     api_destination_arn = api_destination_arn_;
     name = name_;
     description = description_;
     api_destination_state = api_destination_state_;
     connection_arn = connection_arn_;
     invocation_endpoint = invocation_endpoint_;
     http_method = http_method_;
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : describe_api_destination_response)

let make_describe_api_destination_request ~name:(name_ : api_destination_name) () =
  ({ name = name_ } : describe_api_destination_request)

let make_delete_rule_request ?event_bus_name:(event_bus_name_ : event_bus_name_or_arn option)
    ?force:(force_ : boolean_ option) ~name:(name_ : rule_name) () =
  ({ name = name_; event_bus_name = event_bus_name_; force = force_ } : delete_rule_request)

let make_delete_partner_event_source_request ~name:(name_ : event_source_name)
    ~account:(account_ : account_id) () =
  ({ name = name_; account = account_ } : delete_partner_event_source_request)

let make_delete_event_bus_request ~name:(name_ : event_bus_name) () =
  ({ name = name_ } : delete_event_bus_request)

let make_delete_connection_response ?connection_arn:(connection_arn_ : connection_arn option)
    ?connection_state:(connection_state_ : connection_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_authorized_time:(last_authorized_time_ : timestamp option) () =
  ({
     connection_arn = connection_arn_;
     connection_state = connection_state_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_authorized_time = last_authorized_time_;
   }
    : delete_connection_response)

let make_delete_connection_request ~name:(name_ : connection_name) () =
  ({ name = name_ } : delete_connection_request)

let make_delete_archive_response () = (() : unit)

let make_delete_archive_request ~archive_name:(archive_name_ : archive_name) () =
  ({ archive_name = archive_name_ } : delete_archive_request)

let make_delete_api_destination_response () = (() : unit)

let make_delete_api_destination_request ~name:(name_ : api_destination_name) () =
  ({ name = name_ } : delete_api_destination_request)

let make_deauthorize_connection_response ?connection_arn:(connection_arn_ : connection_arn option)
    ?connection_state:(connection_state_ : connection_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option)
    ?last_authorized_time:(last_authorized_time_ : timestamp option) () =
  ({
     connection_arn = connection_arn_;
     connection_state = connection_state_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_authorized_time = last_authorized_time_;
   }
    : deauthorize_connection_response)

let make_deauthorize_connection_request ~name:(name_ : connection_name) () =
  ({ name = name_ } : deauthorize_connection_request)

let make_deactivate_event_source_request ~name:(name_ : event_source_name) () =
  ({ name = name_ } : deactivate_event_source_request)

let make_create_partner_event_source_response ?event_source_arn:(event_source_arn_ : string_ option)
    () =
  ({ event_source_arn = event_source_arn_ } : create_partner_event_source_response)

let make_create_partner_event_source_request ~name:(name_ : event_source_name)
    ~account:(account_ : account_id) () =
  ({ name = name_; account = account_ } : create_partner_event_source_request)

let make_create_event_bus_response ?event_bus_arn:(event_bus_arn_ : string_ option) () =
  ({ event_bus_arn = event_bus_arn_ } : create_event_bus_response)

let make_create_event_bus_request ?event_source_name:(event_source_name_ : event_source_name option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : event_bus_name) () =
  ({ name = name_; event_source_name = event_source_name_; tags = tags_ }
    : create_event_bus_request)

let make_create_connection_response ?connection_arn:(connection_arn_ : connection_arn option)
    ?connection_state:(connection_state_ : connection_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     connection_arn = connection_arn_;
     connection_state = connection_state_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : create_connection_response)

let make_create_connection_api_key_auth_request_parameters
    ~api_key_name:(api_key_name_ : auth_header_parameters)
    ~api_key_value:(api_key_value_ : auth_header_parameters_sensitive) () =
  ({ api_key_name = api_key_name_; api_key_value = api_key_value_ }
    : create_connection_api_key_auth_request_parameters)

let make_create_connection_o_auth_client_request_parameters
    ~client_i_d:(client_i_d_ : auth_header_parameters)
    ~client_secret:(client_secret_ : auth_header_parameters_sensitive) () =
  ({ client_i_d = client_i_d_; client_secret = client_secret_ }
    : create_connection_o_auth_client_request_parameters)

let make_create_connection_o_auth_request_parameters
    ?o_auth_http_parameters:(o_auth_http_parameters_ : connection_http_parameters option)
    ~client_parameters:(client_parameters_ : create_connection_o_auth_client_request_parameters)
    ~authorization_endpoint:(authorization_endpoint_ : https_endpoint)
    ~http_method:(http_method_ : connection_o_auth_http_method) () =
  ({
     client_parameters = client_parameters_;
     authorization_endpoint = authorization_endpoint_;
     http_method = http_method_;
     o_auth_http_parameters = o_auth_http_parameters_;
   }
    : create_connection_o_auth_request_parameters)

let make_create_connection_basic_auth_request_parameters
    ~username:(username_ : auth_header_parameters)
    ~password:(password_ : auth_header_parameters_sensitive) () =
  ({ username = username_; password = password_ } : create_connection_basic_auth_request_parameters)

let make_create_connection_auth_request_parameters
    ?basic_auth_parameters:
      (basic_auth_parameters_ : create_connection_basic_auth_request_parameters option)
    ?o_auth_parameters:(o_auth_parameters_ : create_connection_o_auth_request_parameters option)
    ?api_key_auth_parameters:
      (api_key_auth_parameters_ : create_connection_api_key_auth_request_parameters option)
    ?invocation_http_parameters:(invocation_http_parameters_ : connection_http_parameters option) ()
    =
  ({
     basic_auth_parameters = basic_auth_parameters_;
     o_auth_parameters = o_auth_parameters_;
     api_key_auth_parameters = api_key_auth_parameters_;
     invocation_http_parameters = invocation_http_parameters_;
   }
    : create_connection_auth_request_parameters)

let make_create_connection_request ?description:(description_ : connection_description option)
    ~name:(name_ : connection_name)
    ~authorization_type:(authorization_type_ : connection_authorization_type)
    ~auth_parameters:(auth_parameters_ : create_connection_auth_request_parameters) () =
  ({
     name = name_;
     description = description_;
     authorization_type = authorization_type_;
     auth_parameters = auth_parameters_;
   }
    : create_connection_request)

let make_create_archive_response ?archive_arn:(archive_arn_ : archive_arn option)
    ?state:(state_ : archive_state option)
    ?state_reason:(state_reason_ : archive_state_reason option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     archive_arn = archive_arn_;
     state = state_;
     state_reason = state_reason_;
     creation_time = creation_time_;
   }
    : create_archive_response)

let make_create_archive_request ?description:(description_ : archive_description option)
    ?event_pattern:(event_pattern_ : event_pattern option)
    ?retention_days:(retention_days_ : retention_days option)
    ~archive_name:(archive_name_ : archive_name) ~event_source_arn:(event_source_arn_ : arn) () =
  ({
     archive_name = archive_name_;
     event_source_arn = event_source_arn_;
     description = description_;
     event_pattern = event_pattern_;
     retention_days = retention_days_;
   }
    : create_archive_request)

let make_create_api_destination_response
    ?api_destination_arn:(api_destination_arn_ : api_destination_arn option)
    ?api_destination_state:(api_destination_state_ : api_destination_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) () =
  ({
     api_destination_arn = api_destination_arn_;
     api_destination_state = api_destination_state_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : create_api_destination_response)

let make_create_api_destination_request
    ?description:(description_ : api_destination_description option)
    ?invocation_rate_limit_per_second:
      (invocation_rate_limit_per_second_ : api_destination_invocation_rate_limit_per_second option)
    ~name:(name_ : api_destination_name) ~connection_arn:(connection_arn_ : connection_arn)
    ~invocation_endpoint:(invocation_endpoint_ : https_endpoint)
    ~http_method:(http_method_ : api_destination_http_method) () =
  ({
     name = name_;
     description = description_;
     connection_arn = connection_arn_;
     invocation_endpoint = invocation_endpoint_;
     http_method = http_method_;
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
   }
    : create_api_destination_request)

let make_cancel_replay_response ?replay_arn:(replay_arn_ : replay_arn option)
    ?state:(state_ : replay_state option) ?state_reason:(state_reason_ : replay_state_reason option)
    () =
  ({ replay_arn = replay_arn_; state = state_; state_reason = state_reason_ }
    : cancel_replay_response)

let make_cancel_replay_request ~replay_name:(replay_name_ : replay_name) () =
  ({ replay_name = replay_name_ } : cancel_replay_request)

let make_activate_event_source_request ~name:(name_ : event_source_name) () =
  ({ name = name_ } : activate_event_source_request)
