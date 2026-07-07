open Types

val make_update_connection_response :
  ?last_authorized_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?connection_state:connection_state ->
  ?connection_arn:connection_arn ->
  unit ->
  update_connection_response

val make_update_connection_basic_auth_request_parameters :
  ?password:auth_header_parameters_sensitive ->
  ?username:auth_header_parameters ->
  unit ->
  update_connection_basic_auth_request_parameters

val make_update_connection_o_auth_client_request_parameters :
  ?client_secret:auth_header_parameters_sensitive ->
  ?client_i_d:auth_header_parameters ->
  unit ->
  update_connection_o_auth_client_request_parameters

val make_connection_header_parameter :
  ?is_value_secret:boolean_ ->
  ?value:header_value_sensitive ->
  ?key:header_key ->
  unit ->
  connection_header_parameter

val make_connection_query_string_parameter :
  ?is_value_secret:boolean_ ->
  ?value:query_string_value_sensitive ->
  ?key:query_string_key ->
  unit ->
  connection_query_string_parameter

val make_connection_body_parameter :
  ?is_value_secret:boolean_ ->
  ?value:sensitive_string ->
  ?key:string_ ->
  unit ->
  connection_body_parameter

val make_connection_http_parameters :
  ?body_parameters:connection_body_parameters_list ->
  ?query_string_parameters:connection_query_string_parameters_list ->
  ?header_parameters:connection_header_parameters_list ->
  unit ->
  connection_http_parameters

val make_update_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:https_endpoint ->
  ?client_parameters:update_connection_o_auth_client_request_parameters ->
  unit ->
  update_connection_o_auth_request_parameters

val make_update_connection_api_key_auth_request_parameters :
  ?api_key_value:auth_header_parameters_sensitive ->
  ?api_key_name:auth_header_parameters ->
  unit ->
  update_connection_api_key_auth_request_parameters

val make_update_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:update_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:update_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:update_connection_basic_auth_request_parameters ->
  unit ->
  update_connection_auth_request_parameters

val make_update_connection_request :
  ?auth_parameters:update_connection_auth_request_parameters ->
  ?authorization_type:connection_authorization_type ->
  ?description:connection_description ->
  name:connection_name ->
  unit ->
  update_connection_request

val make_update_archive_response :
  ?creation_time:timestamp ->
  ?state_reason:archive_state_reason ->
  ?state:archive_state ->
  ?archive_arn:archive_arn ->
  unit ->
  update_archive_response

val make_update_archive_request :
  ?retention_days:retention_days ->
  ?event_pattern:event_pattern ->
  ?description:archive_description ->
  archive_name:archive_name ->
  unit ->
  update_archive_request

val make_update_api_destination_response :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:api_destination_arn ->
  unit ->
  update_api_destination_response

val make_update_api_destination_request :
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:https_endpoint ->
  ?connection_arn:connection_arn ->
  ?description:api_destination_description ->
  name:api_destination_name ->
  unit ->
  update_api_destination_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:arn -> unit -> untag_resource_request

val make_test_event_pattern_response : ?result_:boolean_ -> unit -> test_event_pattern_response

val make_test_event_pattern_request :
  event:string_ -> event_pattern:event_pattern -> unit -> test_event_pattern_request

val make_input_transformer :
  ?input_paths_map:transformer_paths ->
  input_template:transformer_input ->
  unit ->
  input_transformer

val make_kinesis_parameters :
  partition_key_path:target_partition_key_path -> unit -> kinesis_parameters

val make_run_command_target :
  values:run_command_target_values -> key:run_command_target_key -> unit -> run_command_target

val make_run_command_parameters :
  run_command_targets:run_command_targets -> unit -> run_command_parameters

val make_aws_vpc_configuration :
  ?assign_public_ip:assign_public_ip ->
  ?security_groups:string_list ->
  subnets:string_list ->
  unit ->
  aws_vpc_configuration

val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration -> unit -> network_configuration

val make_capacity_provider_strategy_item :
  ?base:capacity_provider_strategy_item_base ->
  ?weight:capacity_provider_strategy_item_weight ->
  capacity_provider:capacity_provider ->
  unit ->
  capacity_provider_strategy_item

val make_placement_constraint :
  ?expression:placement_constraint_expression ->
  ?type_:placement_constraint_type ->
  unit ->
  placement_constraint

val make_placement_strategy :
  ?field:placement_strategy_field -> ?type_:placement_strategy_type -> unit -> placement_strategy

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_ecs_parameters :
  ?tags:tag_list ->
  ?reference_id:reference_id ->
  ?propagate_tags:propagate_tags ->
  ?placement_strategy:placement_strategies ->
  ?placement_constraints:placement_constraints ->
  ?enable_execute_command:boolean_ ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?group:string_ ->
  ?platform_version:string_ ->
  ?network_configuration:network_configuration ->
  ?launch_type:launch_type ->
  ?task_count:limit_min1 ->
  task_definition_arn:arn ->
  unit ->
  ecs_parameters

val make_batch_array_properties : ?size:integer -> unit -> batch_array_properties
val make_batch_retry_strategy : ?attempts:integer -> unit -> batch_retry_strategy

val make_batch_parameters :
  ?retry_strategy:batch_retry_strategy ->
  ?array_properties:batch_array_properties ->
  job_name:string_ ->
  job_definition:string_ ->
  unit ->
  batch_parameters

val make_sqs_parameters : ?message_group_id:message_group_id -> unit -> sqs_parameters

val make_http_parameters :
  ?query_string_parameters:query_string_parameters_map ->
  ?header_parameters:header_parameters_map ->
  ?path_parameter_values:path_parameter_list ->
  unit ->
  http_parameters

val make_redshift_data_parameters :
  ?with_event:boolean_ ->
  ?statement_name:statement_name ->
  ?db_user:db_user ->
  ?secret_manager_arn:redshift_secret_manager_arn ->
  sql:sql ->
  database:database ->
  unit ->
  redshift_data_parameters

val make_sage_maker_pipeline_parameter :
  value:sage_maker_pipeline_parameter_value ->
  name:sage_maker_pipeline_parameter_name ->
  unit ->
  sage_maker_pipeline_parameter

val make_sage_maker_pipeline_parameters :
  ?pipeline_parameter_list:sage_maker_pipeline_parameter_list ->
  unit ->
  sage_maker_pipeline_parameters

val make_dead_letter_config : ?arn:resource_arn -> unit -> dead_letter_config

val make_retry_policy :
  ?maximum_event_age_in_seconds:maximum_event_age_in_seconds ->
  ?maximum_retry_attempts:maximum_retry_attempts ->
  unit ->
  retry_policy

val make_target :
  ?retry_policy:retry_policy ->
  ?dead_letter_config:dead_letter_config ->
  ?sage_maker_pipeline_parameters:sage_maker_pipeline_parameters ->
  ?redshift_data_parameters:redshift_data_parameters ->
  ?http_parameters:http_parameters ->
  ?sqs_parameters:sqs_parameters ->
  ?batch_parameters:batch_parameters ->
  ?ecs_parameters:ecs_parameters ->
  ?run_command_parameters:run_command_parameters ->
  ?kinesis_parameters:kinesis_parameters ->
  ?input_transformer:input_transformer ->
  ?input_path:target_input_path ->
  ?input:target_input ->
  ?role_arn:role_arn ->
  arn:target_arn ->
  id:target_id ->
  unit ->
  target

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tag_list -> resource_ar_n:arn -> unit -> tag_resource_request

val make_start_replay_response :
  ?replay_start_time:timestamp ->
  ?state_reason:replay_state_reason ->
  ?state:replay_state ->
  ?replay_arn:replay_arn ->
  unit ->
  start_replay_response

val make_replay_destination :
  ?filter_arns:replay_destination_filters -> arn:arn -> unit -> replay_destination

val make_start_replay_request :
  ?description:replay_description ->
  destination:replay_destination ->
  event_end_time:timestamp ->
  event_start_time:timestamp ->
  event_source_arn:arn ->
  replay_name:replay_name ->
  unit ->
  start_replay_request

val make_rule :
  ?event_bus_name:event_bus_name ->
  ?managed_by:managed_by ->
  ?role_arn:role_arn ->
  ?schedule_expression:schedule_expression ->
  ?description:rule_description ->
  ?state:rule_state ->
  ?event_pattern:event_pattern ->
  ?arn:rule_arn ->
  ?name:rule_name ->
  unit ->
  rule

val make_replay :
  ?replay_end_time:timestamp ->
  ?replay_start_time:timestamp ->
  ?event_last_replayed_time:timestamp ->
  ?event_end_time:timestamp ->
  ?event_start_time:timestamp ->
  ?state_reason:replay_state_reason ->
  ?state:replay_state ->
  ?event_source_arn:arn ->
  ?replay_name:replay_name ->
  unit ->
  replay

val make_remove_targets_result_entry :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?target_id:target_id ->
  unit ->
  remove_targets_result_entry

val make_remove_targets_response :
  ?failed_entries:remove_targets_result_entry_list ->
  ?failed_entry_count:integer ->
  unit ->
  remove_targets_response

val make_remove_targets_request :
  ?force:boolean_ ->
  ?event_bus_name:event_bus_name_or_arn ->
  ids:target_id_list ->
  rule:rule_name ->
  unit ->
  remove_targets_request

val make_remove_permission_request :
  ?event_bus_name:non_partner_event_bus_name ->
  ?remove_all_permissions:boolean_ ->
  ?statement_id:statement_id ->
  unit ->
  remove_permission_request

val make_put_targets_result_entry :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?target_id:target_id ->
  unit ->
  put_targets_result_entry

val make_put_targets_response :
  ?failed_entries:put_targets_result_entry_list ->
  ?failed_entry_count:integer ->
  unit ->
  put_targets_response

val make_put_targets_request :
  ?event_bus_name:event_bus_name_or_arn ->
  targets:target_list ->
  rule:rule_name ->
  unit ->
  put_targets_request

val make_put_rule_response : ?rule_arn:rule_arn -> unit -> put_rule_response

val make_put_rule_request :
  ?event_bus_name:event_bus_name_or_arn ->
  ?tags:tag_list ->
  ?role_arn:role_arn ->
  ?description:rule_description ->
  ?state:rule_state ->
  ?event_pattern:event_pattern ->
  ?schedule_expression:schedule_expression ->
  name:rule_name ->
  unit ->
  put_rule_request

val make_condition : value:string_ -> key:string_ -> type_:string_ -> unit -> condition

val make_put_permission_request :
  ?policy:string_ ->
  ?condition:condition ->
  ?statement_id:statement_id ->
  ?principal:principal ->
  ?action:action ->
  ?event_bus_name:non_partner_event_bus_name ->
  unit ->
  put_permission_request

val make_put_partner_events_result_entry :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?event_id:event_id ->
  unit ->
  put_partner_events_result_entry

val make_put_partner_events_response :
  ?entries:put_partner_events_result_entry_list ->
  ?failed_entry_count:integer ->
  unit ->
  put_partner_events_response

val make_put_partner_events_request_entry :
  ?detail:string_ ->
  ?detail_type:string_ ->
  ?resources:event_resource_list ->
  ?source:event_source_name ->
  ?time:event_time ->
  unit ->
  put_partner_events_request_entry

val make_put_partner_events_request :
  entries:put_partner_events_request_entry_list -> unit -> put_partner_events_request

val make_put_events_result_entry :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?event_id:event_id ->
  unit ->
  put_events_result_entry

val make_put_events_response :
  ?entries:put_events_result_entry_list ->
  ?failed_entry_count:integer ->
  unit ->
  put_events_response

val make_put_events_request_entry :
  ?trace_header:trace_header ->
  ?event_bus_name:non_partner_event_bus_name_or_arn ->
  ?detail:string_ ->
  ?detail_type:string_ ->
  ?resources:event_resource_list ->
  ?source:string_ ->
  ?time:event_time ->
  unit ->
  put_events_request_entry

val make_put_events_request : entries:put_events_request_entry_list -> unit -> put_events_request
val make_partner_event_source : ?name:string_ -> ?arn:string_ -> unit -> partner_event_source

val make_partner_event_source_account :
  ?state:event_source_state ->
  ?expiration_time:timestamp ->
  ?creation_time:timestamp ->
  ?account:account_id ->
  unit ->
  partner_event_source_account

val make_list_targets_by_rule_response :
  ?next_token:next_token -> ?targets:target_list -> unit -> list_targets_by_rule_response

val make_list_targets_by_rule_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?event_bus_name:event_bus_name_or_arn ->
  rule:rule_name ->
  unit ->
  list_targets_by_rule_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:arn -> unit -> list_tags_for_resource_request

val make_list_rules_response :
  ?next_token:next_token -> ?rules:rule_response_list -> unit -> list_rules_response

val make_list_rules_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?event_bus_name:event_bus_name_or_arn ->
  ?name_prefix:rule_name ->
  unit ->
  list_rules_request

val make_list_rule_names_by_target_response :
  ?next_token:next_token -> ?rule_names:rule_name_list -> unit -> list_rule_names_by_target_response

val make_list_rule_names_by_target_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?event_bus_name:event_bus_name_or_arn ->
  target_arn:target_arn ->
  unit ->
  list_rule_names_by_target_request

val make_list_replays_response :
  ?next_token:next_token -> ?replays:replay_list -> unit -> list_replays_response

val make_list_replays_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?event_source_arn:arn ->
  ?state:replay_state ->
  ?name_prefix:replay_name ->
  unit ->
  list_replays_request

val make_list_partner_event_sources_response :
  ?next_token:next_token ->
  ?partner_event_sources:partner_event_source_list ->
  unit ->
  list_partner_event_sources_response

val make_list_partner_event_sources_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  name_prefix:partner_event_source_name_prefix ->
  unit ->
  list_partner_event_sources_request

val make_list_partner_event_source_accounts_response :
  ?next_token:next_token ->
  ?partner_event_source_accounts:partner_event_source_account_list ->
  unit ->
  list_partner_event_source_accounts_response

val make_list_partner_event_source_accounts_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  event_source_name:event_source_name ->
  unit ->
  list_partner_event_source_accounts_request

val make_event_source :
  ?state:event_source_state ->
  ?name:string_ ->
  ?expiration_time:timestamp ->
  ?creation_time:timestamp ->
  ?created_by:string_ ->
  ?arn:string_ ->
  unit ->
  event_source

val make_list_event_sources_response :
  ?next_token:next_token -> ?event_sources:event_source_list -> unit -> list_event_sources_response

val make_list_event_sources_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?name_prefix:event_source_name_prefix ->
  unit ->
  list_event_sources_request

val make_event_bus : ?policy:string_ -> ?arn:string_ -> ?name:string_ -> unit -> event_bus

val make_list_event_buses_response :
  ?next_token:next_token -> ?event_buses:event_bus_list -> unit -> list_event_buses_response

val make_list_event_buses_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?name_prefix:event_bus_name ->
  unit ->
  list_event_buses_request

val make_connection :
  ?last_authorized_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:connection_state_reason ->
  ?connection_state:connection_state ->
  ?name:connection_name ->
  ?connection_arn:connection_arn ->
  unit ->
  connection

val make_list_connections_response :
  ?next_token:next_token ->
  ?connections:connection_response_list ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?connection_state:connection_state ->
  ?name_prefix:connection_name ->
  unit ->
  list_connections_request

val make_archive :
  ?creation_time:timestamp ->
  ?event_count:long ->
  ?size_bytes:long ->
  ?retention_days:retention_days ->
  ?state_reason:archive_state_reason ->
  ?state:archive_state ->
  ?event_source_arn:arn ->
  ?archive_name:archive_name ->
  unit ->
  archive

val make_list_archives_response :
  ?next_token:next_token -> ?archives:archive_response_list -> unit -> list_archives_response

val make_list_archives_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?state:archive_state ->
  ?event_source_arn:arn ->
  ?name_prefix:archive_name ->
  unit ->
  list_archives_request

val make_api_destination :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:https_endpoint ->
  ?connection_arn:connection_arn ->
  ?api_destination_state:api_destination_state ->
  ?name:api_destination_name ->
  ?api_destination_arn:api_destination_arn ->
  unit ->
  api_destination

val make_list_api_destinations_response :
  ?next_token:next_token ->
  ?api_destinations:api_destination_response_list ->
  unit ->
  list_api_destinations_response

val make_list_api_destinations_request :
  ?limit:limit_max100 ->
  ?next_token:next_token ->
  ?connection_arn:connection_arn ->
  ?name_prefix:api_destination_name ->
  unit ->
  list_api_destinations_request

val make_enable_rule_request :
  ?event_bus_name:event_bus_name_or_arn -> name:rule_name -> unit -> enable_rule_request

val make_disable_rule_request :
  ?event_bus_name:event_bus_name_or_arn -> name:rule_name -> unit -> disable_rule_request

val make_describe_rule_response :
  ?created_by:created_by ->
  ?event_bus_name:event_bus_name ->
  ?managed_by:managed_by ->
  ?role_arn:role_arn ->
  ?description:rule_description ->
  ?state:rule_state ->
  ?schedule_expression:schedule_expression ->
  ?event_pattern:event_pattern ->
  ?arn:rule_arn ->
  ?name:rule_name ->
  unit ->
  describe_rule_response

val make_describe_rule_request :
  ?event_bus_name:event_bus_name_or_arn -> name:rule_name -> unit -> describe_rule_request

val make_describe_replay_response :
  ?replay_end_time:timestamp ->
  ?replay_start_time:timestamp ->
  ?event_last_replayed_time:timestamp ->
  ?event_end_time:timestamp ->
  ?event_start_time:timestamp ->
  ?destination:replay_destination ->
  ?event_source_arn:arn ->
  ?state_reason:replay_state_reason ->
  ?state:replay_state ->
  ?description:replay_description ->
  ?replay_arn:replay_arn ->
  ?replay_name:replay_name ->
  unit ->
  describe_replay_response

val make_describe_replay_request : replay_name:replay_name -> unit -> describe_replay_request

val make_describe_partner_event_source_response :
  ?name:string_ -> ?arn:string_ -> unit -> describe_partner_event_source_response

val make_describe_partner_event_source_request :
  name:event_source_name -> unit -> describe_partner_event_source_request

val make_describe_event_source_response :
  ?state:event_source_state ->
  ?name:string_ ->
  ?expiration_time:timestamp ->
  ?creation_time:timestamp ->
  ?created_by:string_ ->
  ?arn:string_ ->
  unit ->
  describe_event_source_response

val make_describe_event_source_request :
  name:event_source_name -> unit -> describe_event_source_request

val make_describe_event_bus_response :
  ?policy:string_ -> ?arn:string_ -> ?name:string_ -> unit -> describe_event_bus_response

val make_describe_event_bus_request :
  ?name:event_bus_name_or_arn -> unit -> describe_event_bus_request

val make_connection_basic_auth_response_parameters :
  ?username:auth_header_parameters -> unit -> connection_basic_auth_response_parameters

val make_connection_o_auth_client_response_parameters :
  ?client_i_d:auth_header_parameters -> unit -> connection_o_auth_client_response_parameters

val make_connection_o_auth_response_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  ?http_method:connection_o_auth_http_method ->
  ?authorization_endpoint:https_endpoint ->
  ?client_parameters:connection_o_auth_client_response_parameters ->
  unit ->
  connection_o_auth_response_parameters

val make_connection_api_key_auth_response_parameters :
  ?api_key_name:auth_header_parameters -> unit -> connection_api_key_auth_response_parameters

val make_connection_auth_response_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:connection_api_key_auth_response_parameters ->
  ?o_auth_parameters:connection_o_auth_response_parameters ->
  ?basic_auth_parameters:connection_basic_auth_response_parameters ->
  unit ->
  connection_auth_response_parameters

val make_describe_connection_response :
  ?last_authorized_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?auth_parameters:connection_auth_response_parameters ->
  ?secret_arn:secrets_manager_secret_arn ->
  ?authorization_type:connection_authorization_type ->
  ?state_reason:connection_state_reason ->
  ?connection_state:connection_state ->
  ?description:connection_description ->
  ?name:connection_name ->
  ?connection_arn:connection_arn ->
  unit ->
  describe_connection_response

val make_describe_connection_request : name:connection_name -> unit -> describe_connection_request

val make_describe_archive_response :
  ?creation_time:timestamp ->
  ?event_count:long ->
  ?size_bytes:long ->
  ?retention_days:retention_days ->
  ?state_reason:archive_state_reason ->
  ?state:archive_state ->
  ?event_pattern:event_pattern ->
  ?description:archive_description ->
  ?event_source_arn:arn ->
  ?archive_name:archive_name ->
  ?archive_arn:archive_arn ->
  unit ->
  describe_archive_response

val make_describe_archive_request : archive_name:archive_name -> unit -> describe_archive_request

val make_describe_api_destination_response :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  ?http_method:api_destination_http_method ->
  ?invocation_endpoint:https_endpoint ->
  ?connection_arn:connection_arn ->
  ?api_destination_state:api_destination_state ->
  ?description:api_destination_description ->
  ?name:api_destination_name ->
  ?api_destination_arn:api_destination_arn ->
  unit ->
  describe_api_destination_response

val make_describe_api_destination_request :
  name:api_destination_name -> unit -> describe_api_destination_request

val make_delete_rule_request :
  ?force:boolean_ ->
  ?event_bus_name:event_bus_name_or_arn ->
  name:rule_name ->
  unit ->
  delete_rule_request

val make_delete_partner_event_source_request :
  account:account_id -> name:event_source_name -> unit -> delete_partner_event_source_request

val make_delete_event_bus_request : name:event_bus_name -> unit -> delete_event_bus_request

val make_delete_connection_response :
  ?last_authorized_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?connection_state:connection_state ->
  ?connection_arn:connection_arn ->
  unit ->
  delete_connection_response

val make_delete_connection_request : name:connection_name -> unit -> delete_connection_request
val make_delete_archive_response : unit -> unit
val make_delete_archive_request : archive_name:archive_name -> unit -> delete_archive_request
val make_delete_api_destination_response : unit -> unit

val make_delete_api_destination_request :
  name:api_destination_name -> unit -> delete_api_destination_request

val make_deauthorize_connection_response :
  ?last_authorized_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?connection_state:connection_state ->
  ?connection_arn:connection_arn ->
  unit ->
  deauthorize_connection_response

val make_deauthorize_connection_request :
  name:connection_name -> unit -> deauthorize_connection_request

val make_deactivate_event_source_request :
  name:event_source_name -> unit -> deactivate_event_source_request

val make_create_partner_event_source_response :
  ?event_source_arn:string_ -> unit -> create_partner_event_source_response

val make_create_partner_event_source_request :
  account:account_id -> name:event_source_name -> unit -> create_partner_event_source_request

val make_create_event_bus_response : ?event_bus_arn:string_ -> unit -> create_event_bus_response

val make_create_event_bus_request :
  ?tags:tag_list ->
  ?event_source_name:event_source_name ->
  name:event_bus_name ->
  unit ->
  create_event_bus_request

val make_create_connection_response :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?connection_state:connection_state ->
  ?connection_arn:connection_arn ->
  unit ->
  create_connection_response

val make_create_connection_basic_auth_request_parameters :
  password:auth_header_parameters_sensitive ->
  username:auth_header_parameters ->
  unit ->
  create_connection_basic_auth_request_parameters

val make_create_connection_o_auth_client_request_parameters :
  client_secret:auth_header_parameters_sensitive ->
  client_i_d:auth_header_parameters ->
  unit ->
  create_connection_o_auth_client_request_parameters

val make_create_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  http_method:connection_o_auth_http_method ->
  authorization_endpoint:https_endpoint ->
  client_parameters:create_connection_o_auth_client_request_parameters ->
  unit ->
  create_connection_o_auth_request_parameters

val make_create_connection_api_key_auth_request_parameters :
  api_key_value:auth_header_parameters_sensitive ->
  api_key_name:auth_header_parameters ->
  unit ->
  create_connection_api_key_auth_request_parameters

val make_create_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
  ?api_key_auth_parameters:create_connection_api_key_auth_request_parameters ->
  ?o_auth_parameters:create_connection_o_auth_request_parameters ->
  ?basic_auth_parameters:create_connection_basic_auth_request_parameters ->
  unit ->
  create_connection_auth_request_parameters

val make_create_connection_request :
  ?description:connection_description ->
  auth_parameters:create_connection_auth_request_parameters ->
  authorization_type:connection_authorization_type ->
  name:connection_name ->
  unit ->
  create_connection_request

val make_create_archive_response :
  ?creation_time:timestamp ->
  ?state_reason:archive_state_reason ->
  ?state:archive_state ->
  ?archive_arn:archive_arn ->
  unit ->
  create_archive_response

val make_create_archive_request :
  ?retention_days:retention_days ->
  ?event_pattern:event_pattern ->
  ?description:archive_description ->
  event_source_arn:arn ->
  archive_name:archive_name ->
  unit ->
  create_archive_request

val make_create_api_destination_response :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?api_destination_state:api_destination_state ->
  ?api_destination_arn:api_destination_arn ->
  unit ->
  create_api_destination_response

val make_create_api_destination_request :
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  ?description:api_destination_description ->
  http_method:api_destination_http_method ->
  invocation_endpoint:https_endpoint ->
  connection_arn:connection_arn ->
  name:api_destination_name ->
  unit ->
  create_api_destination_request

val make_cancel_replay_response :
  ?state_reason:replay_state_reason ->
  ?state:replay_state ->
  ?replay_arn:replay_arn ->
  unit ->
  cancel_replay_response

val make_cancel_replay_request : replay_name:replay_name -> unit -> cancel_replay_request

val make_activate_event_source_request :
  name:event_source_name -> unit -> activate_event_source_request
