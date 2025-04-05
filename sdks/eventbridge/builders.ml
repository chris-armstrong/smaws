open Smaws_Lib
open Types
let make_dead_letter_config ?arn:(arn_ : string option)  () =
  ({ arn = arn_ } : dead_letter_config)
let make_update_event_bus_response
  ?dead_letter_config:(dead_letter_config_ : dead_letter_config option) 
  ?description:(description_ : string option) 
  ?kms_key_identifier:(kms_key_identifier_ : string option) 
  ?name:(name_ : string option)  ?arn:(arn_ : string option)  () =
  ({
     dead_letter_config = dead_letter_config_;
     description = description_;
     kms_key_identifier = kms_key_identifier_;
     name = name_;
     arn = arn_
   } : update_event_bus_response)
let make_update_event_bus_request
  ?dead_letter_config:(dead_letter_config_ : dead_letter_config option) 
  ?description:(description_ : string option) 
  ?kms_key_identifier:(kms_key_identifier_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     dead_letter_config = dead_letter_config_;
     description = description_;
     kms_key_identifier = kms_key_identifier_;
     name = name_
   } : update_event_bus_request)
let make_primary ~health_check:(health_check_ : string)  () =
  ({ health_check = health_check_ } : primary)
let make_secondary ~route:(route_ : string)  () =
  ({ route = route_ } : secondary)
let make_failover_config ~secondary:(secondary_ : secondary) 
  ~primary:(primary_ : primary)  () =
  ({ secondary = secondary_; primary = primary_ } : failover_config)
let make_routing_config ~failover_config:(failover_config_ : failover_config)
   () = ({ failover_config = failover_config_ } : routing_config)
let make_replication_config ?state:(state_ : replication_state option)  () =
  ({ state = state_ } : replication_config)
let make_endpoint_event_bus ~event_bus_arn:(event_bus_arn_ : string)  () =
  ({ event_bus_arn = event_bus_arn_ } : endpoint_event_bus)
let make_update_endpoint_response ?state:(state_ : endpoint_state option) 
  ?endpoint_url:(endpoint_url_ : string option) 
  ?endpoint_id:(endpoint_id_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?event_buses:(event_buses_ : endpoint_event_bus list option) 
  ?replication_config:(replication_config_ : replication_config option) 
  ?routing_config:(routing_config_ : routing_config option) 
  ?arn:(arn_ : string option)  ?name:(name_ : string option)  () =
  ({
     state = state_;
     endpoint_url = endpoint_url_;
     endpoint_id = endpoint_id_;
     role_arn = role_arn_;
     event_buses = event_buses_;
     replication_config = replication_config_;
     routing_config = routing_config_;
     arn = arn_;
     name = name_
   } : update_endpoint_response)
let make_update_endpoint_request ?role_arn:(role_arn_ : string option) 
  ?event_buses:(event_buses_ : endpoint_event_bus list option) 
  ?replication_config:(replication_config_ : replication_config option) 
  ?routing_config:(routing_config_ : routing_config option) 
  ?description:(description_ : string option)  ~name:(name_ : string)  () =
  ({
     role_arn = role_arn_;
     event_buses = event_buses_;
     replication_config = replication_config_;
     routing_config = routing_config_;
     description = description_;
     name = name_
   } : update_endpoint_request)
let make_update_connection_response
  ?last_authorized_time:(last_authorized_time_ :
                          CoreTypes.Timestamp.t option)
   ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?connection_state:(connection_state_ : connection_state option) 
  ?connection_arn:(connection_arn_ : string option)  () =
  ({
     last_authorized_time = last_authorized_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     connection_state = connection_state_;
     connection_arn = connection_arn_
   } : update_connection_response)
let make_update_connection_basic_auth_request_parameters
  ?password:(password_ : string option) 
  ?username:(username_ : string option)  () =
  ({ password = password_; username = username_ } : update_connection_basic_auth_request_parameters)
let make_update_connection_o_auth_client_request_parameters
  ?client_secret:(client_secret_ : string option) 
  ?client_i_d:(client_i_d_ : string option)  () =
  ({ client_secret = client_secret_; client_i_d = client_i_d_ } : update_connection_o_auth_client_request_parameters)
let make_connection_header_parameter
  ?is_value_secret:(is_value_secret_ : bool option) 
  ?value:(value_ : string option)  ?key:(key_ : string option)  () =
  ({ is_value_secret = is_value_secret_; value = value_; key = key_ } : 
  connection_header_parameter)
let make_connection_query_string_parameter
  ?is_value_secret:(is_value_secret_ : bool option) 
  ?value:(value_ : string option)  ?key:(key_ : string option)  () =
  ({ is_value_secret = is_value_secret_; value = value_; key = key_ } : 
  connection_query_string_parameter)
let make_connection_body_parameter
  ?is_value_secret:(is_value_secret_ : bool option) 
  ?value:(value_ : string option)  ?key:(key_ : string option)  () =
  ({ is_value_secret = is_value_secret_; value = value_; key = key_ } : 
  connection_body_parameter)
let make_connection_http_parameters
  ?body_parameters:(body_parameters_ : connection_body_parameter list option)
   ?query_string_parameters:(query_string_parameters_ :
                              connection_query_string_parameter list option)
   ?header_parameters:(header_parameters_ :
                        connection_header_parameter list option)
   () =
  ({
     body_parameters = body_parameters_;
     query_string_parameters = query_string_parameters_;
     header_parameters = header_parameters_
   } : connection_http_parameters)
let make_update_connection_o_auth_request_parameters
  ?o_auth_http_parameters:(o_auth_http_parameters_ :
                            connection_http_parameters option)
   ?http_method:(http_method_ : connection_o_auth_http_method option) 
  ?authorization_endpoint:(authorization_endpoint_ : string option) 
  ?client_parameters:(client_parameters_ :
                       update_connection_o_auth_client_request_parameters
                         option)
   () =
  ({
     o_auth_http_parameters = o_auth_http_parameters_;
     http_method = http_method_;
     authorization_endpoint = authorization_endpoint_;
     client_parameters = client_parameters_
   } : update_connection_o_auth_request_parameters)
let make_update_connection_api_key_auth_request_parameters
  ?api_key_value:(api_key_value_ : string option) 
  ?api_key_name:(api_key_name_ : string option)  () =
  ({ api_key_value = api_key_value_; api_key_name = api_key_name_ } : 
  update_connection_api_key_auth_request_parameters)
let make_update_connection_auth_request_parameters
  ?invocation_http_parameters:(invocation_http_parameters_ :
                                connection_http_parameters option)
   ?api_key_auth_parameters:(api_key_auth_parameters_ :
                              update_connection_api_key_auth_request_parameters
                                option)
   ?o_auth_parameters:(o_auth_parameters_ :
                        update_connection_o_auth_request_parameters option)
   ?basic_auth_parameters:(basic_auth_parameters_ :
                            update_connection_basic_auth_request_parameters
                              option)
   () =
  ({
     invocation_http_parameters = invocation_http_parameters_;
     api_key_auth_parameters = api_key_auth_parameters_;
     o_auth_parameters = o_auth_parameters_;
     basic_auth_parameters = basic_auth_parameters_
   } : update_connection_auth_request_parameters)
let make_update_connection_request
  ?auth_parameters:(auth_parameters_ :
                     update_connection_auth_request_parameters option)
   ?authorization_type:(authorization_type_ :
                         connection_authorization_type option)
   ?description:(description_ : string option)  ~name:(name_ : string)  () =
  ({
     auth_parameters = auth_parameters_;
     authorization_type = authorization_type_;
     description = description_;
     name = name_
   } : update_connection_request)
let make_update_archive_response
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : archive_state option) 
  ?archive_arn:(archive_arn_ : string option)  () =
  ({
     creation_time = creation_time_;
     state_reason = state_reason_;
     state = state_;
     archive_arn = archive_arn_
   } : update_archive_response)
let make_update_archive_request
  ?retention_days:(retention_days_ : int option) 
  ?event_pattern:(event_pattern_ : string option) 
  ?description:(description_ : string option) 
  ~archive_name:(archive_name_ : string)  () =
  ({
     retention_days = retention_days_;
     event_pattern = event_pattern_;
     description = description_;
     archive_name = archive_name_
   } : update_archive_request)
let make_update_api_destination_response
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?api_destination_state:(api_destination_state_ :
                           api_destination_state option)
   ?api_destination_arn:(api_destination_arn_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     api_destination_state = api_destination_state_;
     api_destination_arn = api_destination_arn_
   } : update_api_destination_response)
let make_update_api_destination_request
  ?invocation_rate_limit_per_second:(invocation_rate_limit_per_second_ :
                                      int option)
   ?http_method:(http_method_ : api_destination_http_method option) 
  ?invocation_endpoint:(invocation_endpoint_ : string option) 
  ?connection_arn:(connection_arn_ : string option) 
  ?description:(description_ : string option)  ~name:(name_ : string)  () =
  ({
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
     http_method = http_method_;
     invocation_endpoint = invocation_endpoint_;
     connection_arn = connection_arn_;
     description = description_;
     name = name_
   } : update_api_destination_request)
let make_untag_resource_response () = (() : untag_resource_response)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)
let make_test_event_pattern_response ?result:(result_ : bool option)  () =
  ({ result = result_ } : test_event_pattern_response)
let make_test_event_pattern_request ~event:(event_ : string) 
  ~event_pattern:(event_pattern_ : string)  () =
  ({ event = event_; event_pattern = event_pattern_ } : test_event_pattern_request)
let make_input_transformer
  ?input_paths_map:(input_paths_map_ : transformer_paths option) 
  ~input_template:(input_template_ : string)  () =
  ({ input_template = input_template_; input_paths_map = input_paths_map_ } : 
  input_transformer)
let make_kinesis_parameters
  ~partition_key_path:(partition_key_path_ : string)  () =
  ({ partition_key_path = partition_key_path_ } : kinesis_parameters)
let make_run_command_target ~values:(values_ : string list) 
  ~key:(key_ : string)  () =
  ({ values = values_; key = key_ } : run_command_target)
let make_run_command_parameters
  ~run_command_targets:(run_command_targets_ : run_command_target list)  () =
  ({ run_command_targets = run_command_targets_ } : run_command_parameters)
let make_aws_vpc_configuration
  ?assign_public_ip:(assign_public_ip_ : assign_public_ip option) 
  ?security_groups:(security_groups_ : string list option) 
  ~subnets:(subnets_ : string list)  () =
  ({
     assign_public_ip = assign_public_ip_;
     security_groups = security_groups_;
     subnets = subnets_
   } : aws_vpc_configuration)
let make_network_configuration
  ?awsvpc_configuration:(awsvpc_configuration_ :
                          aws_vpc_configuration option)
   () =
  ({ awsvpc_configuration = awsvpc_configuration_ } : network_configuration)
let make_capacity_provider_strategy_item ?base:(base_ : int option) 
  ?weight:(weight_ : int option) 
  ~capacity_provider:(capacity_provider_ : string)  () =
  ({ base = base_; weight = weight_; capacity_provider = capacity_provider_ } : 
  capacity_provider_strategy_item)
let make_placement_constraint ?expression:(expression_ : string option) 
  ?type_:(type__ : placement_constraint_type option)  () =
  ({ expression = expression_; type_ = type__ } : placement_constraint)
let make_placement_strategy ?field:(field_ : string option) 
  ?type_:(type__ : placement_strategy_type option)  () =
  ({ field = field_; type_ = type__ } : placement_strategy)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_ecs_parameters ?tags:(tags_ : tag list option) 
  ?reference_id:(reference_id_ : string option) 
  ?propagate_tags:(propagate_tags_ : propagate_tags option) 
  ?placement_strategy:(placement_strategy_ : placement_strategy list option) 
  ?placement_constraints:(placement_constraints_ :
                           placement_constraint list option)
   ?enable_execute_command:(enable_execute_command_ : bool option) 
  ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : bool option) 
  ?capacity_provider_strategy:(capacity_provider_strategy_ :
                                capacity_provider_strategy_item list option)
   ?group:(group_ : string option) 
  ?platform_version:(platform_version_ : string option) 
  ?network_configuration:(network_configuration_ :
                           network_configuration option)
   ?launch_type:(launch_type_ : launch_type option) 
  ?task_count:(task_count_ : int option) 
  ~task_definition_arn:(task_definition_arn_ : string)  () =
  ({
     tags = tags_;
     reference_id = reference_id_;
     propagate_tags = propagate_tags_;
     placement_strategy = placement_strategy_;
     placement_constraints = placement_constraints_;
     enable_execute_command = enable_execute_command_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     capacity_provider_strategy = capacity_provider_strategy_;
     group = group_;
     platform_version = platform_version_;
     network_configuration = network_configuration_;
     launch_type = launch_type_;
     task_count = task_count_;
     task_definition_arn = task_definition_arn_
   } : ecs_parameters)
let make_batch_array_properties ?size:(size_ : int option)  () =
  ({ size = size_ } : batch_array_properties)
let make_batch_retry_strategy ?attempts:(attempts_ : int option)  () =
  ({ attempts = attempts_ } : batch_retry_strategy)
let make_batch_parameters
  ?retry_strategy:(retry_strategy_ : batch_retry_strategy option) 
  ?array_properties:(array_properties_ : batch_array_properties option) 
  ~job_name:(job_name_ : string)  ~job_definition:(job_definition_ : string) 
  () =
  ({
     retry_strategy = retry_strategy_;
     array_properties = array_properties_;
     job_name = job_name_;
     job_definition = job_definition_
   } : batch_parameters)
let make_sqs_parameters ?message_group_id:(message_group_id_ : string option)
   () = ({ message_group_id = message_group_id_ } : sqs_parameters)
let make_http_parameters
  ?query_string_parameters:(query_string_parameters_ :
                             query_string_parameters_map option)
   ?header_parameters:(header_parameters_ : header_parameters_map option) 
  ?path_parameter_values:(path_parameter_values_ : string list option)  () =
  ({
     query_string_parameters = query_string_parameters_;
     header_parameters = header_parameters_;
     path_parameter_values = path_parameter_values_
   } : http_parameters)
let make_redshift_data_parameters ?sqls:(sqls_ : string list option) 
  ?with_event:(with_event_ : bool option) 
  ?statement_name:(statement_name_ : string option) 
  ?sql:(sql_ : string option)  ?db_user:(db_user_ : string option) 
  ?secret_manager_arn:(secret_manager_arn_ : string option) 
  ~database:(database_ : string)  () =
  ({
     sqls = sqls_;
     with_event = with_event_;
     statement_name = statement_name_;
     sql = sql_;
     db_user = db_user_;
     database = database_;
     secret_manager_arn = secret_manager_arn_
   } : redshift_data_parameters)
let make_sage_maker_pipeline_parameter ~value:(value_ : string) 
  ~name:(name_ : string)  () =
  ({ value = value_; name = name_ } : sage_maker_pipeline_parameter)
let make_sage_maker_pipeline_parameters
  ?pipeline_parameter_list:(pipeline_parameter_list_ :
                             sage_maker_pipeline_parameter list option)
   () =
  ({ pipeline_parameter_list = pipeline_parameter_list_ } : sage_maker_pipeline_parameters)
let make_retry_policy
  ?maximum_event_age_in_seconds:(maximum_event_age_in_seconds_ : int option) 
  ?maximum_retry_attempts:(maximum_retry_attempts_ : int option)  () =
  ({
     maximum_event_age_in_seconds = maximum_event_age_in_seconds_;
     maximum_retry_attempts = maximum_retry_attempts_
   } : retry_policy)
let make_app_sync_parameters
  ?graph_ql_operation:(graph_ql_operation_ : string option)  () =
  ({ graph_ql_operation = graph_ql_operation_ } : app_sync_parameters)
let make_target
  ?app_sync_parameters:(app_sync_parameters_ : app_sync_parameters option) 
  ?retry_policy:(retry_policy_ : retry_policy option) 
  ?dead_letter_config:(dead_letter_config_ : dead_letter_config option) 
  ?sage_maker_pipeline_parameters:(sage_maker_pipeline_parameters_ :
                                    sage_maker_pipeline_parameters option)
   ?redshift_data_parameters:(redshift_data_parameters_ :
                               redshift_data_parameters option)
   ?http_parameters:(http_parameters_ : http_parameters option) 
  ?sqs_parameters:(sqs_parameters_ : sqs_parameters option) 
  ?batch_parameters:(batch_parameters_ : batch_parameters option) 
  ?ecs_parameters:(ecs_parameters_ : ecs_parameters option) 
  ?run_command_parameters:(run_command_parameters_ :
                            run_command_parameters option)
   ?kinesis_parameters:(kinesis_parameters_ : kinesis_parameters option) 
  ?input_transformer:(input_transformer_ : input_transformer option) 
  ?input_path:(input_path_ : string option)  ?input:(input_ : string option) 
  ?role_arn:(role_arn_ : string option)  ~arn:(arn_ : string) 
  ~id:(id_ : string)  () =
  ({
     app_sync_parameters = app_sync_parameters_;
     retry_policy = retry_policy_;
     dead_letter_config = dead_letter_config_;
     sage_maker_pipeline_parameters = sage_maker_pipeline_parameters_;
     redshift_data_parameters = redshift_data_parameters_;
     http_parameters = http_parameters_;
     sqs_parameters = sqs_parameters_;
     batch_parameters = batch_parameters_;
     ecs_parameters = ecs_parameters_;
     run_command_parameters = run_command_parameters_;
     kinesis_parameters = kinesis_parameters_;
     input_transformer = input_transformer_;
     input_path = input_path_;
     input = input_;
     role_arn = role_arn_;
     arn = arn_;
     id = id_
   } : target)
let make_tag_resource_response () = (() : tag_resource_response)
let make_tag_resource_request ~tags:(tags_ : tag list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)
let make_start_replay_response
  ?replay_start_time:(replay_start_time_ : CoreTypes.Timestamp.t option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : replay_state option) 
  ?replay_arn:(replay_arn_ : string option)  () =
  ({
     replay_start_time = replay_start_time_;
     state_reason = state_reason_;
     state = state_;
     replay_arn = replay_arn_
   } : start_replay_response)
let make_replay_destination ?filter_arns:(filter_arns_ : string list option) 
  ~arn:(arn_ : string)  () =
  ({ filter_arns = filter_arns_; arn = arn_ } : replay_destination)
let make_start_replay_request ?description:(description_ : string option) 
  ~destination:(destination_ : replay_destination) 
  ~event_end_time:(event_end_time_ : CoreTypes.Timestamp.t) 
  ~event_start_time:(event_start_time_ : CoreTypes.Timestamp.t) 
  ~event_source_arn:(event_source_arn_ : string) 
  ~replay_name:(replay_name_ : string)  () =
  ({
     destination = destination_;
     event_end_time = event_end_time_;
     event_start_time = event_start_time_;
     event_source_arn = event_source_arn_;
     description = description_;
     replay_name = replay_name_
   } : start_replay_request)
let make_rule ?event_bus_name:(event_bus_name_ : string option) 
  ?managed_by:(managed_by_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?schedule_expression:(schedule_expression_ : string option) 
  ?description:(description_ : string option) 
  ?state:(state_ : rule_state option) 
  ?event_pattern:(event_pattern_ : string option) 
  ?arn:(arn_ : string option)  ?name:(name_ : string option)  () =
  ({
     event_bus_name = event_bus_name_;
     managed_by = managed_by_;
     role_arn = role_arn_;
     schedule_expression = schedule_expression_;
     description = description_;
     state = state_;
     event_pattern = event_pattern_;
     arn = arn_;
     name = name_
   } : rule)
let make_replay
  ?replay_end_time:(replay_end_time_ : CoreTypes.Timestamp.t option) 
  ?replay_start_time:(replay_start_time_ : CoreTypes.Timestamp.t option) 
  ?event_last_replayed_time:(event_last_replayed_time_ :
                              CoreTypes.Timestamp.t option)
   ?event_end_time:(event_end_time_ : CoreTypes.Timestamp.t option) 
  ?event_start_time:(event_start_time_ : CoreTypes.Timestamp.t option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : replay_state option) 
  ?event_source_arn:(event_source_arn_ : string option) 
  ?replay_name:(replay_name_ : string option)  () =
  ({
     replay_end_time = replay_end_time_;
     replay_start_time = replay_start_time_;
     event_last_replayed_time = event_last_replayed_time_;
     event_end_time = event_end_time_;
     event_start_time = event_start_time_;
     state_reason = state_reason_;
     state = state_;
     event_source_arn = event_source_arn_;
     replay_name = replay_name_
   } : replay)
let make_remove_targets_result_entry
  ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : string option) 
  ?target_id:(target_id_ : string option)  () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     target_id = target_id_
   } : remove_targets_result_entry)
let make_remove_targets_response
  ?failed_entries:(failed_entries_ : remove_targets_result_entry list option)
   ?failed_entry_count:(failed_entry_count_ : int option)  () =
  ({
     failed_entries = failed_entries_;
     failed_entry_count = failed_entry_count_
   } : remove_targets_response)
let make_remove_targets_request ?force:(force_ : bool option) 
  ?event_bus_name:(event_bus_name_ : string option) 
  ~ids:(ids_ : string list)  ~rule:(rule_ : string)  () =
  ({
     force = force_;
     ids = ids_;
     event_bus_name = event_bus_name_;
     rule = rule_
   } : remove_targets_request)
let make_remove_permission_request
  ?event_bus_name:(event_bus_name_ : string option) 
  ?remove_all_permissions:(remove_all_permissions_ : bool option) 
  ?statement_id:(statement_id_ : string option)  () =
  ({
     event_bus_name = event_bus_name_;
     remove_all_permissions = remove_all_permissions_;
     statement_id = statement_id_
   } : remove_permission_request)
let make_put_targets_result_entry
  ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : string option) 
  ?target_id:(target_id_ : string option)  () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     target_id = target_id_
   } : put_targets_result_entry)
let make_put_targets_response
  ?failed_entries:(failed_entries_ : put_targets_result_entry list option) 
  ?failed_entry_count:(failed_entry_count_ : int option)  () =
  ({
     failed_entries = failed_entries_;
     failed_entry_count = failed_entry_count_
   } : put_targets_response)
let make_put_targets_request
  ?event_bus_name:(event_bus_name_ : string option) 
  ~targets:(targets_ : target list)  ~rule:(rule_ : string)  () =
  ({ targets = targets_; event_bus_name = event_bus_name_; rule = rule_ } : 
  put_targets_request)
let make_put_rule_response ?rule_arn:(rule_arn_ : string option)  () =
  ({ rule_arn = rule_arn_ } : put_rule_response)
let make_put_rule_request ?event_bus_name:(event_bus_name_ : string option) 
  ?tags:(tags_ : tag list option)  ?role_arn:(role_arn_ : string option) 
  ?description:(description_ : string option) 
  ?state:(state_ : rule_state option) 
  ?event_pattern:(event_pattern_ : string option) 
  ?schedule_expression:(schedule_expression_ : string option) 
  ~name:(name_ : string)  () =
  ({
     event_bus_name = event_bus_name_;
     tags = tags_;
     role_arn = role_arn_;
     description = description_;
     state = state_;
     event_pattern = event_pattern_;
     schedule_expression = schedule_expression_;
     name = name_
   } : put_rule_request)
let make_condition ~value:(value_ : string)  ~key:(key_ : string) 
  ~type_:(type__ : string)  () =
  ({ value = value_; key = key_; type_ = type__ } : condition)
let make_put_permission_request ?policy:(policy_ : string option) 
  ?condition:(condition_ : condition option) 
  ?statement_id:(statement_id_ : string option) 
  ?principal:(principal_ : string option)  ?action:(action_ : string option) 
  ?event_bus_name:(event_bus_name_ : string option)  () =
  ({
     policy = policy_;
     condition = condition_;
     statement_id = statement_id_;
     principal = principal_;
     action = action_;
     event_bus_name = event_bus_name_
   } : put_permission_request)
let make_put_partner_events_result_entry
  ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : string option) 
  ?event_id:(event_id_ : string option)  () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     event_id = event_id_
   } : put_partner_events_result_entry)
let make_put_partner_events_response
  ?entries:(entries_ : put_partner_events_result_entry list option) 
  ?failed_entry_count:(failed_entry_count_ : int option)  () =
  ({ entries = entries_; failed_entry_count = failed_entry_count_ } : 
  put_partner_events_response)
let make_put_partner_events_request_entry ?detail:(detail_ : string option) 
  ?detail_type:(detail_type_ : string option) 
  ?resources:(resources_ : string list option) 
  ?source:(source_ : string option) 
  ?time:(time_ : CoreTypes.Timestamp.t option)  () =
  ({
     detail = detail_;
     detail_type = detail_type_;
     resources = resources_;
     source = source_;
     time = time_
   } : put_partner_events_request_entry)
let make_put_partner_events_request
  ~entries:(entries_ : put_partner_events_request_entry list)  () =
  ({ entries = entries_ } : put_partner_events_request)
let make_put_events_result_entry
  ?error_message:(error_message_ : string option) 
  ?error_code:(error_code_ : string option) 
  ?event_id:(event_id_ : string option)  () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     event_id = event_id_
   } : put_events_result_entry)
let make_put_events_response
  ?entries:(entries_ : put_events_result_entry list option) 
  ?failed_entry_count:(failed_entry_count_ : int option)  () =
  ({ entries = entries_; failed_entry_count = failed_entry_count_ } : 
  put_events_response)
let make_put_events_request_entry
  ?trace_header:(trace_header_ : string option) 
  ?event_bus_name:(event_bus_name_ : string option) 
  ?detail:(detail_ : string option) 
  ?detail_type:(detail_type_ : string option) 
  ?resources:(resources_ : string list option) 
  ?source:(source_ : string option) 
  ?time:(time_ : CoreTypes.Timestamp.t option)  () =
  ({
     trace_header = trace_header_;
     event_bus_name = event_bus_name_;
     detail = detail_;
     detail_type = detail_type_;
     resources = resources_;
     source = source_;
     time = time_
   } : put_events_request_entry)
let make_put_events_request ?endpoint_id:(endpoint_id_ : string option) 
  ~entries:(entries_ : put_events_request_entry list)  () =
  ({ endpoint_id = endpoint_id_; entries = entries_ } : put_events_request)
let make_partner_event_source ?name:(name_ : string option) 
  ?arn:(arn_ : string option)  () =
  ({ name = name_; arn = arn_ } : partner_event_source)
let make_partner_event_source_account
  ?state:(state_ : event_source_state option) 
  ?expiration_time:(expiration_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?account:(account_ : string option)  () =
  ({
     state = state_;
     expiration_time = expiration_time_;
     creation_time = creation_time_;
     account = account_
   } : partner_event_source_account)
let make_list_targets_by_rule_response
  ?next_token:(next_token_ : string option) 
  ?targets:(targets_ : target list option)  () =
  ({ next_token = next_token_; targets = targets_ } : list_targets_by_rule_response)
let make_list_targets_by_rule_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?event_bus_name:(event_bus_name_ : string option)  ~rule:(rule_ : string) 
  () =
  ({
     limit = limit_;
     next_token = next_token_;
     event_bus_name = event_bus_name_;
     rule = rule_
   } : list_targets_by_rule_request)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option)  ()
  = ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)
let make_list_rules_response ?next_token:(next_token_ : string option) 
  ?rules:(rules_ : rule list option)  () =
  ({ next_token = next_token_; rules = rules_ } : list_rules_response)
let make_list_rules_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?event_bus_name:(event_bus_name_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     limit = limit_;
     next_token = next_token_;
     event_bus_name = event_bus_name_;
     name_prefix = name_prefix_
   } : list_rules_request)
let make_list_rule_names_by_target_response
  ?next_token:(next_token_ : string option) 
  ?rule_names:(rule_names_ : string list option)  () =
  ({ next_token = next_token_; rule_names = rule_names_ } : list_rule_names_by_target_response)
let make_list_rule_names_by_target_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?event_bus_name:(event_bus_name_ : string option) 
  ~target_arn:(target_arn_ : string)  () =
  ({
     limit = limit_;
     next_token = next_token_;
     event_bus_name = event_bus_name_;
     target_arn = target_arn_
   } : list_rule_names_by_target_request)
let make_list_replays_response ?next_token:(next_token_ : string option) 
  ?replays:(replays_ : replay list option)  () =
  ({ next_token = next_token_; replays = replays_ } : list_replays_response)
let make_list_replays_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?event_source_arn:(event_source_arn_ : string option) 
  ?state:(state_ : replay_state option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     limit = limit_;
     next_token = next_token_;
     event_source_arn = event_source_arn_;
     state = state_;
     name_prefix = name_prefix_
   } : list_replays_request)
let make_list_partner_event_sources_response
  ?next_token:(next_token_ : string option) 
  ?partner_event_sources:(partner_event_sources_ :
                           partner_event_source list option)
   () =
  ({ next_token = next_token_; partner_event_sources = partner_event_sources_
   } : list_partner_event_sources_response)
let make_list_partner_event_sources_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~name_prefix:(name_prefix_ : string)  () =
  ({ limit = limit_; next_token = next_token_; name_prefix = name_prefix_ } : 
  list_partner_event_sources_request)
let make_list_partner_event_source_accounts_response
  ?next_token:(next_token_ : string option) 
  ?partner_event_source_accounts:(partner_event_source_accounts_ :
                                   partner_event_source_account list option)
   () =
  ({
     next_token = next_token_;
     partner_event_source_accounts = partner_event_source_accounts_
   } : list_partner_event_source_accounts_response)
let make_list_partner_event_source_accounts_request
  ?limit:(limit_ : int option)  ?next_token:(next_token_ : string option) 
  ~event_source_name:(event_source_name_ : string)  () =
  ({
     limit = limit_;
     next_token = next_token_;
     event_source_name = event_source_name_
   } : list_partner_event_source_accounts_request)
let make_event_source ?state:(state_ : event_source_state option) 
  ?name:(name_ : string option) 
  ?expiration_time:(expiration_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?created_by:(created_by_ : string option)  ?arn:(arn_ : string option)  ()
  =
  ({
     state = state_;
     name = name_;
     expiration_time = expiration_time_;
     creation_time = creation_time_;
     created_by = created_by_;
     arn = arn_
   } : event_source)
let make_list_event_sources_response
  ?next_token:(next_token_ : string option) 
  ?event_sources:(event_sources_ : event_source list option)  () =
  ({ next_token = next_token_; event_sources = event_sources_ } : list_event_sources_response)
let make_list_event_sources_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({ limit = limit_; next_token = next_token_; name_prefix = name_prefix_ } : 
  list_event_sources_request)
let make_event_bus
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?policy:(policy_ : string option) 
  ?description:(description_ : string option)  ?arn:(arn_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     policy = policy_;
     description = description_;
     arn = arn_;
     name = name_
   } : event_bus)
let make_list_event_buses_response ?next_token:(next_token_ : string option) 
  ?event_buses:(event_buses_ : event_bus list option)  () =
  ({ next_token = next_token_; event_buses = event_buses_ } : list_event_buses_response)
let make_list_event_buses_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({ limit = limit_; next_token = next_token_; name_prefix = name_prefix_ } : 
  list_event_buses_request)
let make_endpoint
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : endpoint_state option) 
  ?endpoint_url:(endpoint_url_ : string option) 
  ?endpoint_id:(endpoint_id_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?event_buses:(event_buses_ : endpoint_event_bus list option) 
  ?replication_config:(replication_config_ : replication_config option) 
  ?routing_config:(routing_config_ : routing_config option) 
  ?arn:(arn_ : string option)  ?description:(description_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     state_reason = state_reason_;
     state = state_;
     endpoint_url = endpoint_url_;
     endpoint_id = endpoint_id_;
     role_arn = role_arn_;
     event_buses = event_buses_;
     replication_config = replication_config_;
     routing_config = routing_config_;
     arn = arn_;
     description = description_;
     name = name_
   } : endpoint)
let make_list_endpoints_response ?next_token:(next_token_ : string option) 
  ?endpoints:(endpoints_ : endpoint list option)  () =
  ({ next_token = next_token_; endpoints = endpoints_ } : list_endpoints_response)
let make_list_endpoints_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?home_region:(home_region_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     home_region = home_region_;
     name_prefix = name_prefix_
   } : list_endpoints_request)
let make_connection
  ?last_authorized_time:(last_authorized_time_ :
                          CoreTypes.Timestamp.t option)
   ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?authorization_type:(authorization_type_ :
                        connection_authorization_type option)
   ?state_reason:(state_reason_ : string option) 
  ?connection_state:(connection_state_ : connection_state option) 
  ?name:(name_ : string option) 
  ?connection_arn:(connection_arn_ : string option)  () =
  ({
     last_authorized_time = last_authorized_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     authorization_type = authorization_type_;
     state_reason = state_reason_;
     connection_state = connection_state_;
     name = name_;
     connection_arn = connection_arn_
   } : connection)
let make_list_connections_response ?next_token:(next_token_ : string option) 
  ?connections:(connections_ : connection list option)  () =
  ({ next_token = next_token_; connections = connections_ } : list_connections_response)
let make_list_connections_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?connection_state:(connection_state_ : connection_state option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     limit = limit_;
     next_token = next_token_;
     connection_state = connection_state_;
     name_prefix = name_prefix_
   } : list_connections_request)
let make_archive
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?event_count:(event_count_ : int option) 
  ?size_bytes:(size_bytes_ : int option) 
  ?retention_days:(retention_days_ : int option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : archive_state option) 
  ?event_source_arn:(event_source_arn_ : string option) 
  ?archive_name:(archive_name_ : string option)  () =
  ({
     creation_time = creation_time_;
     event_count = event_count_;
     size_bytes = size_bytes_;
     retention_days = retention_days_;
     state_reason = state_reason_;
     state = state_;
     event_source_arn = event_source_arn_;
     archive_name = archive_name_
   } : archive)
let make_list_archives_response ?next_token:(next_token_ : string option) 
  ?archives:(archives_ : archive list option)  () =
  ({ next_token = next_token_; archives = archives_ } : list_archives_response)
let make_list_archives_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?state:(state_ : archive_state option) 
  ?event_source_arn:(event_source_arn_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     limit = limit_;
     next_token = next_token_;
     state = state_;
     event_source_arn = event_source_arn_;
     name_prefix = name_prefix_
   } : list_archives_request)
let make_api_destination
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?invocation_rate_limit_per_second:(invocation_rate_limit_per_second_ :
                                      int option)
   ?http_method:(http_method_ : api_destination_http_method option) 
  ?invocation_endpoint:(invocation_endpoint_ : string option) 
  ?connection_arn:(connection_arn_ : string option) 
  ?api_destination_state:(api_destination_state_ :
                           api_destination_state option)
   ?name:(name_ : string option) 
  ?api_destination_arn:(api_destination_arn_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
     http_method = http_method_;
     invocation_endpoint = invocation_endpoint_;
     connection_arn = connection_arn_;
     api_destination_state = api_destination_state_;
     name = name_;
     api_destination_arn = api_destination_arn_
   } : api_destination)
let make_list_api_destinations_response
  ?next_token:(next_token_ : string option) 
  ?api_destinations:(api_destinations_ : api_destination list option)  () =
  ({ next_token = next_token_; api_destinations = api_destinations_ } : 
  list_api_destinations_response)
let make_list_api_destinations_request ?limit:(limit_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?connection_arn:(connection_arn_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     limit = limit_;
     next_token = next_token_;
     connection_arn = connection_arn_;
     name_prefix = name_prefix_
   } : list_api_destinations_request)
let make_enable_rule_request
  ?event_bus_name:(event_bus_name_ : string option)  ~name:(name_ : string) 
  () =
  ({ event_bus_name = event_bus_name_; name = name_ } : enable_rule_request)
let make_disable_rule_request
  ?event_bus_name:(event_bus_name_ : string option)  ~name:(name_ : string) 
  () =
  ({ event_bus_name = event_bus_name_; name = name_ } : disable_rule_request)
let make_describe_rule_response ?created_by:(created_by_ : string option) 
  ?event_bus_name:(event_bus_name_ : string option) 
  ?managed_by:(managed_by_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?description:(description_ : string option) 
  ?state:(state_ : rule_state option) 
  ?schedule_expression:(schedule_expression_ : string option) 
  ?event_pattern:(event_pattern_ : string option) 
  ?arn:(arn_ : string option)  ?name:(name_ : string option)  () =
  ({
     created_by = created_by_;
     event_bus_name = event_bus_name_;
     managed_by = managed_by_;
     role_arn = role_arn_;
     description = description_;
     state = state_;
     schedule_expression = schedule_expression_;
     event_pattern = event_pattern_;
     arn = arn_;
     name = name_
   } : describe_rule_response)
let make_describe_rule_request
  ?event_bus_name:(event_bus_name_ : string option)  ~name:(name_ : string) 
  () =
  ({ event_bus_name = event_bus_name_; name = name_ } : describe_rule_request)
let make_describe_replay_response
  ?replay_end_time:(replay_end_time_ : CoreTypes.Timestamp.t option) 
  ?replay_start_time:(replay_start_time_ : CoreTypes.Timestamp.t option) 
  ?event_last_replayed_time:(event_last_replayed_time_ :
                              CoreTypes.Timestamp.t option)
   ?event_end_time:(event_end_time_ : CoreTypes.Timestamp.t option) 
  ?event_start_time:(event_start_time_ : CoreTypes.Timestamp.t option) 
  ?destination:(destination_ : replay_destination option) 
  ?event_source_arn:(event_source_arn_ : string option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : replay_state option) 
  ?description:(description_ : string option) 
  ?replay_arn:(replay_arn_ : string option) 
  ?replay_name:(replay_name_ : string option)  () =
  ({
     replay_end_time = replay_end_time_;
     replay_start_time = replay_start_time_;
     event_last_replayed_time = event_last_replayed_time_;
     event_end_time = event_end_time_;
     event_start_time = event_start_time_;
     destination = destination_;
     event_source_arn = event_source_arn_;
     state_reason = state_reason_;
     state = state_;
     description = description_;
     replay_arn = replay_arn_;
     replay_name = replay_name_
   } : describe_replay_response)
let make_describe_replay_request ~replay_name:(replay_name_ : string)  () =
  ({ replay_name = replay_name_ } : describe_replay_request)
let make_describe_partner_event_source_response ?name:(name_ : string option)
   ?arn:(arn_ : string option)  () =
  ({ name = name_; arn = arn_ } : describe_partner_event_source_response)
let make_describe_partner_event_source_request ~name:(name_ : string)  () =
  ({ name = name_ } : describe_partner_event_source_request)
let make_describe_event_source_response
  ?state:(state_ : event_source_state option)  ?name:(name_ : string option) 
  ?expiration_time:(expiration_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?created_by:(created_by_ : string option)  ?arn:(arn_ : string option)  ()
  =
  ({
     state = state_;
     name = name_;
     expiration_time = expiration_time_;
     creation_time = creation_time_;
     created_by = created_by_;
     arn = arn_
   } : describe_event_source_response)
let make_describe_event_source_request ~name:(name_ : string)  () =
  ({ name = name_ } : describe_event_source_request)
let make_describe_event_bus_response
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?policy:(policy_ : string option) 
  ?dead_letter_config:(dead_letter_config_ : dead_letter_config option) 
  ?kms_key_identifier:(kms_key_identifier_ : string option) 
  ?description:(description_ : string option)  ?arn:(arn_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     policy = policy_;
     dead_letter_config = dead_letter_config_;
     kms_key_identifier = kms_key_identifier_;
     description = description_;
     arn = arn_;
     name = name_
   } : describe_event_bus_response)
let make_describe_event_bus_request ?name:(name_ : string option)  () =
  ({ name = name_ } : describe_event_bus_request)
let make_describe_endpoint_response
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : endpoint_state option) 
  ?endpoint_url:(endpoint_url_ : string option) 
  ?endpoint_id:(endpoint_id_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?event_buses:(event_buses_ : endpoint_event_bus list option) 
  ?replication_config:(replication_config_ : replication_config option) 
  ?routing_config:(routing_config_ : routing_config option) 
  ?arn:(arn_ : string option)  ?description:(description_ : string option) 
  ?name:(name_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     state_reason = state_reason_;
     state = state_;
     endpoint_url = endpoint_url_;
     endpoint_id = endpoint_id_;
     role_arn = role_arn_;
     event_buses = event_buses_;
     replication_config = replication_config_;
     routing_config = routing_config_;
     arn = arn_;
     description = description_;
     name = name_
   } : describe_endpoint_response)
let make_describe_endpoint_request
  ?home_region:(home_region_ : string option)  ~name:(name_ : string)  () =
  ({ home_region = home_region_; name = name_ } : describe_endpoint_request)
let make_connection_basic_auth_response_parameters
  ?username:(username_ : string option)  () =
  ({ username = username_ } : connection_basic_auth_response_parameters)
let make_connection_o_auth_client_response_parameters
  ?client_i_d:(client_i_d_ : string option)  () =
  ({ client_i_d = client_i_d_ } : connection_o_auth_client_response_parameters)
let make_connection_o_auth_response_parameters
  ?o_auth_http_parameters:(o_auth_http_parameters_ :
                            connection_http_parameters option)
   ?http_method:(http_method_ : connection_o_auth_http_method option) 
  ?authorization_endpoint:(authorization_endpoint_ : string option) 
  ?client_parameters:(client_parameters_ :
                       connection_o_auth_client_response_parameters option)
   () =
  ({
     o_auth_http_parameters = o_auth_http_parameters_;
     http_method = http_method_;
     authorization_endpoint = authorization_endpoint_;
     client_parameters = client_parameters_
   } : connection_o_auth_response_parameters)
let make_connection_api_key_auth_response_parameters
  ?api_key_name:(api_key_name_ : string option)  () =
  ({ api_key_name = api_key_name_ } : connection_api_key_auth_response_parameters)
let make_connection_auth_response_parameters
  ?invocation_http_parameters:(invocation_http_parameters_ :
                                connection_http_parameters option)
   ?api_key_auth_parameters:(api_key_auth_parameters_ :
                              connection_api_key_auth_response_parameters
                                option)
   ?o_auth_parameters:(o_auth_parameters_ :
                        connection_o_auth_response_parameters option)
   ?basic_auth_parameters:(basic_auth_parameters_ :
                            connection_basic_auth_response_parameters option)
   () =
  ({
     invocation_http_parameters = invocation_http_parameters_;
     api_key_auth_parameters = api_key_auth_parameters_;
     o_auth_parameters = o_auth_parameters_;
     basic_auth_parameters = basic_auth_parameters_
   } : connection_auth_response_parameters)
let make_describe_connection_response
  ?last_authorized_time:(last_authorized_time_ :
                          CoreTypes.Timestamp.t option)
   ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?auth_parameters:(auth_parameters_ :
                     connection_auth_response_parameters option)
   ?secret_arn:(secret_arn_ : string option) 
  ?authorization_type:(authorization_type_ :
                        connection_authorization_type option)
   ?state_reason:(state_reason_ : string option) 
  ?connection_state:(connection_state_ : connection_state option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?connection_arn:(connection_arn_ : string option)  () =
  ({
     last_authorized_time = last_authorized_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     auth_parameters = auth_parameters_;
     secret_arn = secret_arn_;
     authorization_type = authorization_type_;
     state_reason = state_reason_;
     connection_state = connection_state_;
     description = description_;
     name = name_;
     connection_arn = connection_arn_
   } : describe_connection_response)
let make_describe_connection_request ~name:(name_ : string)  () =
  ({ name = name_ } : describe_connection_request)
let make_describe_archive_response
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?event_count:(event_count_ : int option) 
  ?size_bytes:(size_bytes_ : int option) 
  ?retention_days:(retention_days_ : int option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : archive_state option) 
  ?event_pattern:(event_pattern_ : string option) 
  ?description:(description_ : string option) 
  ?event_source_arn:(event_source_arn_ : string option) 
  ?archive_name:(archive_name_ : string option) 
  ?archive_arn:(archive_arn_ : string option)  () =
  ({
     creation_time = creation_time_;
     event_count = event_count_;
     size_bytes = size_bytes_;
     retention_days = retention_days_;
     state_reason = state_reason_;
     state = state_;
     event_pattern = event_pattern_;
     description = description_;
     event_source_arn = event_source_arn_;
     archive_name = archive_name_;
     archive_arn = archive_arn_
   } : describe_archive_response)
let make_describe_archive_request ~archive_name:(archive_name_ : string)  ()
  = ({ archive_name = archive_name_ } : describe_archive_request)
let make_describe_api_destination_response
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?invocation_rate_limit_per_second:(invocation_rate_limit_per_second_ :
                                      int option)
   ?http_method:(http_method_ : api_destination_http_method option) 
  ?invocation_endpoint:(invocation_endpoint_ : string option) 
  ?connection_arn:(connection_arn_ : string option) 
  ?api_destination_state:(api_destination_state_ :
                           api_destination_state option)
   ?description:(description_ : string option)  ?name:(name_ : string option)
   ?api_destination_arn:(api_destination_arn_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
     http_method = http_method_;
     invocation_endpoint = invocation_endpoint_;
     connection_arn = connection_arn_;
     api_destination_state = api_destination_state_;
     description = description_;
     name = name_;
     api_destination_arn = api_destination_arn_
   } : describe_api_destination_response)
let make_describe_api_destination_request ~name:(name_ : string)  () =
  ({ name = name_ } : describe_api_destination_request)
let make_delete_rule_request ?force:(force_ : bool option) 
  ?event_bus_name:(event_bus_name_ : string option)  ~name:(name_ : string) 
  () =
  ({ force = force_; event_bus_name = event_bus_name_; name = name_ } : 
  delete_rule_request)
let make_delete_partner_event_source_request ~account:(account_ : string) 
  ~name:(name_ : string)  () =
  ({ account = account_; name = name_ } : delete_partner_event_source_request)
let make_delete_event_bus_request ~name:(name_ : string)  () =
  ({ name = name_ } : delete_event_bus_request)
let make_delete_endpoint_response () = (() : delete_endpoint_response)
let make_delete_endpoint_request ~name:(name_ : string)  () =
  ({ name = name_ } : delete_endpoint_request)
let make_delete_connection_response
  ?last_authorized_time:(last_authorized_time_ :
                          CoreTypes.Timestamp.t option)
   ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?connection_state:(connection_state_ : connection_state option) 
  ?connection_arn:(connection_arn_ : string option)  () =
  ({
     last_authorized_time = last_authorized_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     connection_state = connection_state_;
     connection_arn = connection_arn_
   } : delete_connection_response)
let make_delete_connection_request ~name:(name_ : string)  () =
  ({ name = name_ } : delete_connection_request)
let make_delete_archive_response () = (() : delete_archive_response)
let make_delete_archive_request ~archive_name:(archive_name_ : string)  () =
  ({ archive_name = archive_name_ } : delete_archive_request)
let make_delete_api_destination_response () =
  (() : delete_api_destination_response)
let make_delete_api_destination_request ~name:(name_ : string)  () =
  ({ name = name_ } : delete_api_destination_request)
let make_deauthorize_connection_response
  ?last_authorized_time:(last_authorized_time_ :
                          CoreTypes.Timestamp.t option)
   ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?connection_state:(connection_state_ : connection_state option) 
  ?connection_arn:(connection_arn_ : string option)  () =
  ({
     last_authorized_time = last_authorized_time_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     connection_state = connection_state_;
     connection_arn = connection_arn_
   } : deauthorize_connection_response)
let make_deauthorize_connection_request ~name:(name_ : string)  () =
  ({ name = name_ } : deauthorize_connection_request)
let make_deactivate_event_source_request ~name:(name_ : string)  () =
  ({ name = name_ } : deactivate_event_source_request)
let make_create_partner_event_source_response
  ?event_source_arn:(event_source_arn_ : string option)  () =
  ({ event_source_arn = event_source_arn_ } : create_partner_event_source_response)
let make_create_partner_event_source_request ~account:(account_ : string) 
  ~name:(name_ : string)  () =
  ({ account = account_; name = name_ } : create_partner_event_source_request)
let make_create_event_bus_response
  ?dead_letter_config:(dead_letter_config_ : dead_letter_config option) 
  ?kms_key_identifier:(kms_key_identifier_ : string option) 
  ?description:(description_ : string option) 
  ?event_bus_arn:(event_bus_arn_ : string option)  () =
  ({
     dead_letter_config = dead_letter_config_;
     kms_key_identifier = kms_key_identifier_;
     description = description_;
     event_bus_arn = event_bus_arn_
   } : create_event_bus_response)
let make_create_event_bus_request ?tags:(tags_ : tag list option) 
  ?dead_letter_config:(dead_letter_config_ : dead_letter_config option) 
  ?kms_key_identifier:(kms_key_identifier_ : string option) 
  ?description:(description_ : string option) 
  ?event_source_name:(event_source_name_ : string option) 
  ~name:(name_ : string)  () =
  ({
     tags = tags_;
     dead_letter_config = dead_letter_config_;
     kms_key_identifier = kms_key_identifier_;
     description = description_;
     event_source_name = event_source_name_;
     name = name_
   } : create_event_bus_request)
let make_create_endpoint_response ?state:(state_ : endpoint_state option) 
  ?role_arn:(role_arn_ : string option) 
  ?event_buses:(event_buses_ : endpoint_event_bus list option) 
  ?replication_config:(replication_config_ : replication_config option) 
  ?routing_config:(routing_config_ : routing_config option) 
  ?arn:(arn_ : string option)  ?name:(name_ : string option)  () =
  ({
     state = state_;
     role_arn = role_arn_;
     event_buses = event_buses_;
     replication_config = replication_config_;
     routing_config = routing_config_;
     arn = arn_;
     name = name_
   } : create_endpoint_response)
let make_create_endpoint_request ?role_arn:(role_arn_ : string option) 
  ?replication_config:(replication_config_ : replication_config option) 
  ?description:(description_ : string option) 
  ~event_buses:(event_buses_ : endpoint_event_bus list) 
  ~routing_config:(routing_config_ : routing_config)  ~name:(name_ : string) 
  () =
  ({
     role_arn = role_arn_;
     event_buses = event_buses_;
     replication_config = replication_config_;
     routing_config = routing_config_;
     description = description_;
     name = name_
   } : create_endpoint_request)
let make_create_connection_response
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?connection_state:(connection_state_ : connection_state option) 
  ?connection_arn:(connection_arn_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     connection_state = connection_state_;
     connection_arn = connection_arn_
   } : create_connection_response)
let make_create_connection_basic_auth_request_parameters
  ~password:(password_ : string)  ~username:(username_ : string)  () =
  ({ password = password_; username = username_ } : create_connection_basic_auth_request_parameters)
let make_create_connection_o_auth_client_request_parameters
  ~client_secret:(client_secret_ : string) 
  ~client_i_d:(client_i_d_ : string)  () =
  ({ client_secret = client_secret_; client_i_d = client_i_d_ } : create_connection_o_auth_client_request_parameters)
let make_create_connection_o_auth_request_parameters
  ?o_auth_http_parameters:(o_auth_http_parameters_ :
                            connection_http_parameters option)
   ~http_method:(http_method_ : connection_o_auth_http_method) 
  ~authorization_endpoint:(authorization_endpoint_ : string) 
  ~client_parameters:(client_parameters_ :
                       create_connection_o_auth_client_request_parameters)
   () =
  ({
     o_auth_http_parameters = o_auth_http_parameters_;
     http_method = http_method_;
     authorization_endpoint = authorization_endpoint_;
     client_parameters = client_parameters_
   } : create_connection_o_auth_request_parameters)
let make_create_connection_api_key_auth_request_parameters
  ~api_key_value:(api_key_value_ : string) 
  ~api_key_name:(api_key_name_ : string)  () =
  ({ api_key_value = api_key_value_; api_key_name = api_key_name_ } : 
  create_connection_api_key_auth_request_parameters)
let make_create_connection_auth_request_parameters
  ?invocation_http_parameters:(invocation_http_parameters_ :
                                connection_http_parameters option)
   ?api_key_auth_parameters:(api_key_auth_parameters_ :
                              create_connection_api_key_auth_request_parameters
                                option)
   ?o_auth_parameters:(o_auth_parameters_ :
                        create_connection_o_auth_request_parameters option)
   ?basic_auth_parameters:(basic_auth_parameters_ :
                            create_connection_basic_auth_request_parameters
                              option)
   () =
  ({
     invocation_http_parameters = invocation_http_parameters_;
     api_key_auth_parameters = api_key_auth_parameters_;
     o_auth_parameters = o_auth_parameters_;
     basic_auth_parameters = basic_auth_parameters_
   } : create_connection_auth_request_parameters)
let make_create_connection_request
  ?description:(description_ : string option) 
  ~auth_parameters:(auth_parameters_ :
                     create_connection_auth_request_parameters)
   ~authorization_type:(authorization_type_ : connection_authorization_type) 
  ~name:(name_ : string)  () =
  ({
     auth_parameters = auth_parameters_;
     authorization_type = authorization_type_;
     description = description_;
     name = name_
   } : create_connection_request)
let make_create_archive_response
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?state_reason:(state_reason_ : string option) 
  ?state:(state_ : archive_state option) 
  ?archive_arn:(archive_arn_ : string option)  () =
  ({
     creation_time = creation_time_;
     state_reason = state_reason_;
     state = state_;
     archive_arn = archive_arn_
   } : create_archive_response)
let make_create_archive_request
  ?retention_days:(retention_days_ : int option) 
  ?event_pattern:(event_pattern_ : string option) 
  ?description:(description_ : string option) 
  ~event_source_arn:(event_source_arn_ : string) 
  ~archive_name:(archive_name_ : string)  () =
  ({
     retention_days = retention_days_;
     event_pattern = event_pattern_;
     description = description_;
     event_source_arn = event_source_arn_;
     archive_name = archive_name_
   } : create_archive_request)
let make_create_api_destination_response
  ?last_modified_time:(last_modified_time_ : CoreTypes.Timestamp.t option) 
  ?creation_time:(creation_time_ : CoreTypes.Timestamp.t option) 
  ?api_destination_state:(api_destination_state_ :
                           api_destination_state option)
   ?api_destination_arn:(api_destination_arn_ : string option)  () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     api_destination_state = api_destination_state_;
     api_destination_arn = api_destination_arn_
   } : create_api_destination_response)
let make_create_api_destination_request
  ?invocation_rate_limit_per_second:(invocation_rate_limit_per_second_ :
                                      int option)
   ?description:(description_ : string option) 
  ~http_method:(http_method_ : api_destination_http_method) 
  ~invocation_endpoint:(invocation_endpoint_ : string) 
  ~connection_arn:(connection_arn_ : string)  ~name:(name_ : string)  () =
  ({
     invocation_rate_limit_per_second = invocation_rate_limit_per_second_;
     http_method = http_method_;
     invocation_endpoint = invocation_endpoint_;
     connection_arn = connection_arn_;
     description = description_;
     name = name_
   } : create_api_destination_request)
let make_cancel_replay_response ?state_reason:(state_reason_ : string option)
   ?state:(state_ : replay_state option) 
  ?replay_arn:(replay_arn_ : string option)  () =
  ({ state_reason = state_reason_; state = state_; replay_arn = replay_arn_ } : 
  cancel_replay_response)
let make_cancel_replay_request ~replay_name:(replay_name_ : string)  () =
  ({ replay_name = replay_name_ } : cancel_replay_request)
let make_activate_event_source_request ~name:(name_ : string)  () =
  ({ name = name_ } : activate_event_source_request)