open Types

val make_update_connection_response :
  ?connection_arn:connection_arn ->
  ?connection_state:connection_state ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_authorized_time:timestamp ->
  unit ->
  update_connection_response

val make_connection_body_parameter :
  ?key:string_ ->
  ?value:sensitive_string ->
  ?is_value_secret:boolean_ ->
  unit ->
  connection_body_parameter

val make_connection_query_string_parameter :
  ?key:query_string_key ->
  ?value:query_string_value_sensitive ->
  ?is_value_secret:boolean_ ->
  unit ->
  connection_query_string_parameter

val make_connection_header_parameter :
  ?key:header_key ->
  ?value:header_value_sensitive ->
  ?is_value_secret:boolean_ ->
  unit ->
  connection_header_parameter

val make_connection_http_parameters :
  ?header_parameters:connection_header_parameters_list ->
  ?query_string_parameters:connection_query_string_parameters_list ->
  ?body_parameters:connection_body_parameters_list ->
  unit ->
  connection_http_parameters

val make_update_connection_api_key_auth_request_parameters :
  ?api_key_name:auth_header_parameters ->
  ?api_key_value:auth_header_parameters_sensitive ->
  unit ->
  update_connection_api_key_auth_request_parameters

val make_update_connection_o_auth_client_request_parameters :
  ?client_i_d:auth_header_parameters ->
  ?client_secret:auth_header_parameters_sensitive ->
  unit ->
  update_connection_o_auth_client_request_parameters

val make_update_connection_o_auth_request_parameters :
  ?client_parameters:update_connection_o_auth_client_request_parameters ->
  ?authorization_endpoint:https_endpoint ->
  ?http_method:connection_o_auth_http_method ->
  ?o_auth_http_parameters:connection_http_parameters ->
  unit ->
  update_connection_o_auth_request_parameters

val make_update_connection_basic_auth_request_parameters :
  ?username:auth_header_parameters ->
  ?password:auth_header_parameters_sensitive ->
  unit ->
  update_connection_basic_auth_request_parameters

val make_update_connection_auth_request_parameters :
  ?basic_auth_parameters:update_connection_basic_auth_request_parameters ->
  ?o_auth_parameters:update_connection_o_auth_request_parameters ->
  ?api_key_auth_parameters:update_connection_api_key_auth_request_parameters ->
  ?invocation_http_parameters:connection_http_parameters ->
  unit ->
  update_connection_auth_request_parameters

val make_update_connection_request :
  ?description:connection_description ->
  ?authorization_type:connection_authorization_type ->
  ?auth_parameters:update_connection_auth_request_parameters ->
  name:connection_name ->
  unit ->
  update_connection_request

val make_update_archive_response :
  ?archive_arn:archive_arn ->
  ?state:archive_state ->
  ?state_reason:archive_state_reason ->
  ?creation_time:timestamp ->
  unit ->
  update_archive_response

val make_update_archive_request :
  ?description:archive_description ->
  ?event_pattern:event_pattern ->
  ?retention_days:retention_days ->
  archive_name:archive_name ->
  unit ->
  update_archive_request

val make_update_api_destination_response :
  ?api_destination_arn:api_destination_arn ->
  ?api_destination_state:api_destination_state ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  update_api_destination_response

val make_update_api_destination_request :
  ?description:api_destination_description ->
  ?connection_arn:connection_arn ->
  ?invocation_endpoint:https_endpoint ->
  ?http_method:api_destination_http_method ->
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  name:api_destination_name ->
  unit ->
  update_api_destination_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_test_event_pattern_response : ?result_:boolean_ -> unit -> test_event_pattern_response

val make_test_event_pattern_request :
  event_pattern:event_pattern -> event:string_ -> unit -> test_event_pattern_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_tag_resource_request : resource_ar_n:arn -> tags:tag_list -> unit -> tag_resource_request

val make_start_replay_response :
  ?replay_arn:replay_arn ->
  ?state:replay_state ->
  ?state_reason:replay_state_reason ->
  ?replay_start_time:timestamp ->
  unit ->
  start_replay_response

val make_replay_destination :
  ?filter_arns:replay_destination_filters -> arn:arn -> unit -> replay_destination

val make_start_replay_request :
  ?description:replay_description ->
  replay_name:replay_name ->
  event_source_arn:arn ->
  event_start_time:timestamp ->
  event_end_time:timestamp ->
  destination:replay_destination ->
  unit ->
  start_replay_request

val make_remove_targets_result_entry :
  ?target_id:target_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  remove_targets_result_entry

val make_remove_targets_response :
  ?failed_entry_count:integer ->
  ?failed_entries:remove_targets_result_entry_list ->
  unit ->
  remove_targets_response

val make_remove_targets_request :
  ?event_bus_name:event_bus_name_or_arn ->
  ?force:boolean_ ->
  rule:rule_name ->
  ids:target_id_list ->
  unit ->
  remove_targets_request

val make_remove_permission_request :
  ?statement_id:statement_id ->
  ?remove_all_permissions:boolean_ ->
  ?event_bus_name:non_partner_event_bus_name ->
  unit ->
  remove_permission_request

val make_put_targets_result_entry :
  ?target_id:target_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  put_targets_result_entry

val make_put_targets_response :
  ?failed_entry_count:integer ->
  ?failed_entries:put_targets_result_entry_list ->
  unit ->
  put_targets_response

val make_retry_policy :
  ?maximum_retry_attempts:maximum_retry_attempts ->
  ?maximum_event_age_in_seconds:maximum_event_age_in_seconds ->
  unit ->
  retry_policy

val make_dead_letter_config : ?arn:resource_arn -> unit -> dead_letter_config

val make_sage_maker_pipeline_parameter :
  name:sage_maker_pipeline_parameter_name ->
  value:sage_maker_pipeline_parameter_value ->
  unit ->
  sage_maker_pipeline_parameter

val make_sage_maker_pipeline_parameters :
  ?pipeline_parameter_list:sage_maker_pipeline_parameter_list ->
  unit ->
  sage_maker_pipeline_parameters

val make_redshift_data_parameters :
  ?secret_manager_arn:redshift_secret_manager_arn ->
  ?db_user:db_user ->
  ?statement_name:statement_name ->
  ?with_event:boolean_ ->
  database:database ->
  sql:sql ->
  unit ->
  redshift_data_parameters

val make_http_parameters :
  ?path_parameter_values:path_parameter_list ->
  ?header_parameters:header_parameters_map ->
  ?query_string_parameters:query_string_parameters_map ->
  unit ->
  http_parameters

val make_sqs_parameters : ?message_group_id:message_group_id -> unit -> sqs_parameters
val make_batch_retry_strategy : ?attempts:integer -> unit -> batch_retry_strategy
val make_batch_array_properties : ?size:integer -> unit -> batch_array_properties

val make_batch_parameters :
  ?array_properties:batch_array_properties ->
  ?retry_strategy:batch_retry_strategy ->
  job_definition:string_ ->
  job_name:string_ ->
  unit ->
  batch_parameters

val make_placement_strategy :
  ?type_:placement_strategy_type -> ?field:placement_strategy_field -> unit -> placement_strategy

val make_placement_constraint :
  ?type_:placement_constraint_type ->
  ?expression:placement_constraint_expression ->
  unit ->
  placement_constraint

val make_capacity_provider_strategy_item :
  ?weight:capacity_provider_strategy_item_weight ->
  ?base:capacity_provider_strategy_item_base ->
  capacity_provider:capacity_provider ->
  unit ->
  capacity_provider_strategy_item

val make_aws_vpc_configuration :
  ?security_groups:string_list ->
  ?assign_public_ip:assign_public_ip ->
  subnets:string_list ->
  unit ->
  aws_vpc_configuration

val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration -> unit -> network_configuration

val make_ecs_parameters :
  ?task_count:limit_min1 ->
  ?launch_type:launch_type ->
  ?network_configuration:network_configuration ->
  ?platform_version:string_ ->
  ?group:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?enable_execute_command:boolean_ ->
  ?placement_constraints:placement_constraints ->
  ?placement_strategy:placement_strategies ->
  ?propagate_tags:propagate_tags ->
  ?reference_id:reference_id ->
  ?tags:tag_list ->
  task_definition_arn:arn ->
  unit ->
  ecs_parameters

val make_run_command_target :
  key:run_command_target_key -> values:run_command_target_values -> unit -> run_command_target

val make_run_command_parameters :
  run_command_targets:run_command_targets -> unit -> run_command_parameters

val make_kinesis_parameters :
  partition_key_path:target_partition_key_path -> unit -> kinesis_parameters

val make_input_transformer :
  ?input_paths_map:transformer_paths ->
  input_template:transformer_input ->
  unit ->
  input_transformer

val make_target :
  ?role_arn:role_arn ->
  ?input:target_input ->
  ?input_path:target_input_path ->
  ?input_transformer:input_transformer ->
  ?kinesis_parameters:kinesis_parameters ->
  ?run_command_parameters:run_command_parameters ->
  ?ecs_parameters:ecs_parameters ->
  ?batch_parameters:batch_parameters ->
  ?sqs_parameters:sqs_parameters ->
  ?http_parameters:http_parameters ->
  ?redshift_data_parameters:redshift_data_parameters ->
  ?sage_maker_pipeline_parameters:sage_maker_pipeline_parameters ->
  ?dead_letter_config:dead_letter_config ->
  ?retry_policy:retry_policy ->
  id:target_id ->
  arn:target_arn ->
  unit ->
  target

val make_put_targets_request :
  ?event_bus_name:event_bus_name_or_arn ->
  rule:rule_name ->
  targets:target_list ->
  unit ->
  put_targets_request

val make_put_rule_response : ?rule_arn:rule_arn -> unit -> put_rule_response

val make_put_rule_request :
  ?schedule_expression:schedule_expression ->
  ?event_pattern:event_pattern ->
  ?state:rule_state ->
  ?description:rule_description ->
  ?role_arn:role_arn ->
  ?tags:tag_list ->
  ?event_bus_name:event_bus_name_or_arn ->
  name:rule_name ->
  unit ->
  put_rule_request

val make_condition : type_:string_ -> key:string_ -> value:string_ -> unit -> condition

val make_put_permission_request :
  ?event_bus_name:non_partner_event_bus_name ->
  ?action:action ->
  ?principal:principal ->
  ?statement_id:statement_id ->
  ?condition:condition ->
  ?policy:string_ ->
  unit ->
  put_permission_request

val make_put_partner_events_result_entry :
  ?event_id:event_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  put_partner_events_result_entry

val make_put_partner_events_response :
  ?failed_entry_count:integer ->
  ?entries:put_partner_events_result_entry_list ->
  unit ->
  put_partner_events_response

val make_put_partner_events_request_entry :
  ?time:event_time ->
  ?source:event_source_name ->
  ?resources:event_resource_list ->
  ?detail_type:string_ ->
  ?detail:string_ ->
  unit ->
  put_partner_events_request_entry

val make_put_partner_events_request :
  entries:put_partner_events_request_entry_list -> unit -> put_partner_events_request

val make_put_events_result_entry :
  ?event_id:event_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  put_events_result_entry

val make_put_events_response :
  ?failed_entry_count:integer ->
  ?entries:put_events_result_entry_list ->
  unit ->
  put_events_response

val make_put_events_request_entry :
  ?time:event_time ->
  ?source:string_ ->
  ?resources:event_resource_list ->
  ?detail_type:string_ ->
  ?detail:string_ ->
  ?event_bus_name:non_partner_event_bus_name_or_arn ->
  ?trace_header:trace_header ->
  unit ->
  put_events_request_entry

val make_put_events_request : entries:put_events_request_entry_list -> unit -> put_events_request

val make_list_targets_by_rule_response :
  ?targets:target_list -> ?next_token:next_token -> unit -> list_targets_by_rule_response

val make_list_targets_by_rule_request :
  ?event_bus_name:event_bus_name_or_arn ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  rule:rule_name ->
  unit ->
  list_targets_by_rule_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:arn -> unit -> list_tags_for_resource_request

val make_rule :
  ?name:rule_name ->
  ?arn:rule_arn ->
  ?event_pattern:event_pattern ->
  ?state:rule_state ->
  ?description:rule_description ->
  ?schedule_expression:schedule_expression ->
  ?role_arn:role_arn ->
  ?managed_by:managed_by ->
  ?event_bus_name:event_bus_name ->
  unit ->
  rule

val make_list_rules_response :
  ?rules:rule_response_list -> ?next_token:next_token -> unit -> list_rules_response

val make_list_rules_request :
  ?name_prefix:rule_name ->
  ?event_bus_name:event_bus_name_or_arn ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  unit ->
  list_rules_request

val make_list_rule_names_by_target_response :
  ?rule_names:rule_name_list -> ?next_token:next_token -> unit -> list_rule_names_by_target_response

val make_list_rule_names_by_target_request :
  ?event_bus_name:event_bus_name_or_arn ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  target_arn:target_arn ->
  unit ->
  list_rule_names_by_target_request

val make_replay :
  ?replay_name:replay_name ->
  ?event_source_arn:arn ->
  ?state:replay_state ->
  ?state_reason:replay_state_reason ->
  ?event_start_time:timestamp ->
  ?event_end_time:timestamp ->
  ?event_last_replayed_time:timestamp ->
  ?replay_start_time:timestamp ->
  ?replay_end_time:timestamp ->
  unit ->
  replay

val make_list_replays_response :
  ?replays:replay_list -> ?next_token:next_token -> unit -> list_replays_response

val make_list_replays_request :
  ?name_prefix:replay_name ->
  ?state:replay_state ->
  ?event_source_arn:arn ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  unit ->
  list_replays_request

val make_partner_event_source : ?arn:string_ -> ?name:string_ -> unit -> partner_event_source

val make_list_partner_event_sources_response :
  ?partner_event_sources:partner_event_source_list ->
  ?next_token:next_token ->
  unit ->
  list_partner_event_sources_response

val make_list_partner_event_sources_request :
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  name_prefix:partner_event_source_name_prefix ->
  unit ->
  list_partner_event_sources_request

val make_partner_event_source_account :
  ?account:account_id ->
  ?creation_time:timestamp ->
  ?expiration_time:timestamp ->
  ?state:event_source_state ->
  unit ->
  partner_event_source_account

val make_list_partner_event_source_accounts_response :
  ?partner_event_source_accounts:partner_event_source_account_list ->
  ?next_token:next_token ->
  unit ->
  list_partner_event_source_accounts_response

val make_list_partner_event_source_accounts_request :
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  event_source_name:event_source_name ->
  unit ->
  list_partner_event_source_accounts_request

val make_event_source :
  ?arn:string_ ->
  ?created_by:string_ ->
  ?creation_time:timestamp ->
  ?expiration_time:timestamp ->
  ?name:string_ ->
  ?state:event_source_state ->
  unit ->
  event_source

val make_list_event_sources_response :
  ?event_sources:event_source_list -> ?next_token:next_token -> unit -> list_event_sources_response

val make_list_event_sources_request :
  ?name_prefix:event_source_name_prefix ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  unit ->
  list_event_sources_request

val make_event_bus : ?name:string_ -> ?arn:string_ -> ?policy:string_ -> unit -> event_bus

val make_list_event_buses_response :
  ?event_buses:event_bus_list -> ?next_token:next_token -> unit -> list_event_buses_response

val make_list_event_buses_request :
  ?name_prefix:event_bus_name ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  unit ->
  list_event_buses_request

val make_connection :
  ?connection_arn:connection_arn ->
  ?name:connection_name ->
  ?connection_state:connection_state ->
  ?state_reason:connection_state_reason ->
  ?authorization_type:connection_authorization_type ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_authorized_time:timestamp ->
  unit ->
  connection

val make_list_connections_response :
  ?connections:connection_response_list ->
  ?next_token:next_token ->
  unit ->
  list_connections_response

val make_list_connections_request :
  ?name_prefix:connection_name ->
  ?connection_state:connection_state ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  unit ->
  list_connections_request

val make_archive :
  ?archive_name:archive_name ->
  ?event_source_arn:arn ->
  ?state:archive_state ->
  ?state_reason:archive_state_reason ->
  ?retention_days:retention_days ->
  ?size_bytes:long ->
  ?event_count:long ->
  ?creation_time:timestamp ->
  unit ->
  archive

val make_list_archives_response :
  ?archives:archive_response_list -> ?next_token:next_token -> unit -> list_archives_response

val make_list_archives_request :
  ?name_prefix:archive_name ->
  ?event_source_arn:arn ->
  ?state:archive_state ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  unit ->
  list_archives_request

val make_api_destination :
  ?api_destination_arn:api_destination_arn ->
  ?name:api_destination_name ->
  ?api_destination_state:api_destination_state ->
  ?connection_arn:connection_arn ->
  ?invocation_endpoint:https_endpoint ->
  ?http_method:api_destination_http_method ->
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  api_destination

val make_list_api_destinations_response :
  ?api_destinations:api_destination_response_list ->
  ?next_token:next_token ->
  unit ->
  list_api_destinations_response

val make_list_api_destinations_request :
  ?name_prefix:api_destination_name ->
  ?connection_arn:connection_arn ->
  ?next_token:next_token ->
  ?limit:limit_max100 ->
  unit ->
  list_api_destinations_request

val make_enable_rule_request :
  ?event_bus_name:event_bus_name_or_arn -> name:rule_name -> unit -> enable_rule_request

val make_disable_rule_request :
  ?event_bus_name:event_bus_name_or_arn -> name:rule_name -> unit -> disable_rule_request

val make_describe_rule_response :
  ?name:rule_name ->
  ?arn:rule_arn ->
  ?event_pattern:event_pattern ->
  ?schedule_expression:schedule_expression ->
  ?state:rule_state ->
  ?description:rule_description ->
  ?role_arn:role_arn ->
  ?managed_by:managed_by ->
  ?event_bus_name:event_bus_name ->
  ?created_by:created_by ->
  unit ->
  describe_rule_response

val make_describe_rule_request :
  ?event_bus_name:event_bus_name_or_arn -> name:rule_name -> unit -> describe_rule_request

val make_describe_replay_response :
  ?replay_name:replay_name ->
  ?replay_arn:replay_arn ->
  ?description:replay_description ->
  ?state:replay_state ->
  ?state_reason:replay_state_reason ->
  ?event_source_arn:arn ->
  ?destination:replay_destination ->
  ?event_start_time:timestamp ->
  ?event_end_time:timestamp ->
  ?event_last_replayed_time:timestamp ->
  ?replay_start_time:timestamp ->
  ?replay_end_time:timestamp ->
  unit ->
  describe_replay_response

val make_describe_replay_request : replay_name:replay_name -> unit -> describe_replay_request

val make_describe_partner_event_source_response :
  ?arn:string_ -> ?name:string_ -> unit -> describe_partner_event_source_response

val make_describe_partner_event_source_request :
  name:event_source_name -> unit -> describe_partner_event_source_request

val make_describe_event_source_response :
  ?arn:string_ ->
  ?created_by:string_ ->
  ?creation_time:timestamp ->
  ?expiration_time:timestamp ->
  ?name:string_ ->
  ?state:event_source_state ->
  unit ->
  describe_event_source_response

val make_describe_event_source_request :
  name:event_source_name -> unit -> describe_event_source_request

val make_describe_event_bus_response :
  ?name:string_ -> ?arn:string_ -> ?policy:string_ -> unit -> describe_event_bus_response

val make_describe_event_bus_request :
  ?name:event_bus_name_or_arn -> unit -> describe_event_bus_request

val make_connection_api_key_auth_response_parameters :
  ?api_key_name:auth_header_parameters -> unit -> connection_api_key_auth_response_parameters

val make_connection_o_auth_client_response_parameters :
  ?client_i_d:auth_header_parameters -> unit -> connection_o_auth_client_response_parameters

val make_connection_o_auth_response_parameters :
  ?client_parameters:connection_o_auth_client_response_parameters ->
  ?authorization_endpoint:https_endpoint ->
  ?http_method:connection_o_auth_http_method ->
  ?o_auth_http_parameters:connection_http_parameters ->
  unit ->
  connection_o_auth_response_parameters

val make_connection_basic_auth_response_parameters :
  ?username:auth_header_parameters -> unit -> connection_basic_auth_response_parameters

val make_connection_auth_response_parameters :
  ?basic_auth_parameters:connection_basic_auth_response_parameters ->
  ?o_auth_parameters:connection_o_auth_response_parameters ->
  ?api_key_auth_parameters:connection_api_key_auth_response_parameters ->
  ?invocation_http_parameters:connection_http_parameters ->
  unit ->
  connection_auth_response_parameters

val make_describe_connection_response :
  ?connection_arn:connection_arn ->
  ?name:connection_name ->
  ?description:connection_description ->
  ?connection_state:connection_state ->
  ?state_reason:connection_state_reason ->
  ?authorization_type:connection_authorization_type ->
  ?secret_arn:secrets_manager_secret_arn ->
  ?auth_parameters:connection_auth_response_parameters ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_authorized_time:timestamp ->
  unit ->
  describe_connection_response

val make_describe_connection_request : name:connection_name -> unit -> describe_connection_request

val make_describe_archive_response :
  ?archive_arn:archive_arn ->
  ?archive_name:archive_name ->
  ?event_source_arn:arn ->
  ?description:archive_description ->
  ?event_pattern:event_pattern ->
  ?state:archive_state ->
  ?state_reason:archive_state_reason ->
  ?retention_days:retention_days ->
  ?size_bytes:long ->
  ?event_count:long ->
  ?creation_time:timestamp ->
  unit ->
  describe_archive_response

val make_describe_archive_request : archive_name:archive_name -> unit -> describe_archive_request

val make_describe_api_destination_response :
  ?api_destination_arn:api_destination_arn ->
  ?name:api_destination_name ->
  ?description:api_destination_description ->
  ?api_destination_state:api_destination_state ->
  ?connection_arn:connection_arn ->
  ?invocation_endpoint:https_endpoint ->
  ?http_method:api_destination_http_method ->
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  describe_api_destination_response

val make_describe_api_destination_request :
  name:api_destination_name -> unit -> describe_api_destination_request

val make_delete_rule_request :
  ?event_bus_name:event_bus_name_or_arn ->
  ?force:boolean_ ->
  name:rule_name ->
  unit ->
  delete_rule_request

val make_delete_partner_event_source_request :
  name:event_source_name -> account:account_id -> unit -> delete_partner_event_source_request

val make_delete_event_bus_request : name:event_bus_name -> unit -> delete_event_bus_request

val make_delete_connection_response :
  ?connection_arn:connection_arn ->
  ?connection_state:connection_state ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_authorized_time:timestamp ->
  unit ->
  delete_connection_response

val make_delete_connection_request : name:connection_name -> unit -> delete_connection_request
val make_delete_archive_response : unit -> unit
val make_delete_archive_request : archive_name:archive_name -> unit -> delete_archive_request
val make_delete_api_destination_response : unit -> unit

val make_delete_api_destination_request :
  name:api_destination_name -> unit -> delete_api_destination_request

val make_deauthorize_connection_response :
  ?connection_arn:connection_arn ->
  ?connection_state:connection_state ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_authorized_time:timestamp ->
  unit ->
  deauthorize_connection_response

val make_deauthorize_connection_request :
  name:connection_name -> unit -> deauthorize_connection_request

val make_deactivate_event_source_request :
  name:event_source_name -> unit -> deactivate_event_source_request

val make_create_partner_event_source_response :
  ?event_source_arn:string_ -> unit -> create_partner_event_source_response

val make_create_partner_event_source_request :
  name:event_source_name -> account:account_id -> unit -> create_partner_event_source_request

val make_create_event_bus_response : ?event_bus_arn:string_ -> unit -> create_event_bus_response

val make_create_event_bus_request :
  ?event_source_name:event_source_name ->
  ?tags:tag_list ->
  name:event_bus_name ->
  unit ->
  create_event_bus_request

val make_create_connection_response :
  ?connection_arn:connection_arn ->
  ?connection_state:connection_state ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  create_connection_response

val make_create_connection_api_key_auth_request_parameters :
  api_key_name:auth_header_parameters ->
  api_key_value:auth_header_parameters_sensitive ->
  unit ->
  create_connection_api_key_auth_request_parameters

val make_create_connection_o_auth_client_request_parameters :
  client_i_d:auth_header_parameters ->
  client_secret:auth_header_parameters_sensitive ->
  unit ->
  create_connection_o_auth_client_request_parameters

val make_create_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
  client_parameters:create_connection_o_auth_client_request_parameters ->
  authorization_endpoint:https_endpoint ->
  http_method:connection_o_auth_http_method ->
  unit ->
  create_connection_o_auth_request_parameters

val make_create_connection_basic_auth_request_parameters :
  username:auth_header_parameters ->
  password:auth_header_parameters_sensitive ->
  unit ->
  create_connection_basic_auth_request_parameters

val make_create_connection_auth_request_parameters :
  ?basic_auth_parameters:create_connection_basic_auth_request_parameters ->
  ?o_auth_parameters:create_connection_o_auth_request_parameters ->
  ?api_key_auth_parameters:create_connection_api_key_auth_request_parameters ->
  ?invocation_http_parameters:connection_http_parameters ->
  unit ->
  create_connection_auth_request_parameters

val make_create_connection_request :
  ?description:connection_description ->
  name:connection_name ->
  authorization_type:connection_authorization_type ->
  auth_parameters:create_connection_auth_request_parameters ->
  unit ->
  create_connection_request

val make_create_archive_response :
  ?archive_arn:archive_arn ->
  ?state:archive_state ->
  ?state_reason:archive_state_reason ->
  ?creation_time:timestamp ->
  unit ->
  create_archive_response

val make_create_archive_request :
  ?description:archive_description ->
  ?event_pattern:event_pattern ->
  ?retention_days:retention_days ->
  archive_name:archive_name ->
  event_source_arn:arn ->
  unit ->
  create_archive_request

val make_create_api_destination_response :
  ?api_destination_arn:api_destination_arn ->
  ?api_destination_state:api_destination_state ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  create_api_destination_response

val make_create_api_destination_request :
  ?description:api_destination_description ->
  ?invocation_rate_limit_per_second:api_destination_invocation_rate_limit_per_second ->
  name:api_destination_name ->
  connection_arn:connection_arn ->
  invocation_endpoint:https_endpoint ->
  http_method:api_destination_http_method ->
  unit ->
  create_api_destination_request

val make_cancel_replay_response :
  ?replay_arn:replay_arn ->
  ?state:replay_state ->
  ?state_reason:replay_state_reason ->
  unit ->
  cancel_replay_response

val make_cancel_replay_request : replay_name:replay_name -> unit -> cancel_replay_request

val make_activate_event_source_request :
  name:event_source_name -> unit -> activate_event_source_request
