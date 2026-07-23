(** CloudWatch Events client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module ActivateEventSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    activate_event_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    activate_event_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Activates a partner event source that has been deactivated. Once activated, your matching event \
   bus will start receiving events from the event source.\n"]

module CancelReplay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IllegalStatusException of illegal_status_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_replay_request ->
    ( cancel_replay_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalStatusException of illegal_status_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_replay_request ->
    ( cancel_replay_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalStatusException of illegal_status_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels the specified replay.\n"]

module CreateApiDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_api_destination_request ->
    ( create_api_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_api_destination_request ->
    ( create_api_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an API destination, which is an HTTP invocation endpoint configured as a target for \
   events.\n"]

module CreateArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `InvalidEventPatternException of invalid_event_pattern_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_archive_request ->
    ( create_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_archive_request ->
    ( create_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an archive of events with the specified settings. When you create an archive, incoming \
   events might not immediately start being sent to the archive. Allow a short period of time for \
   changes to take effect. If you do not specify a pattern to filter events sent to the archive, \
   all events are sent to the archive except replayed events. Replayed events are not sent to an \
   archive.\n"]

module CreateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connection. A connection defines the authorization type and credentials to use for \
   authorization with an API destination HTTP endpoint.\n"]

module CreateEventBus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `InvalidStateException of invalid_state_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_event_bus_request ->
    ( create_event_bus_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_event_bus_request ->
    ( create_event_bus_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidStateException of invalid_state_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new event bus within your account. This can be a custom event bus which you can use \
   to receive events from your custom applications and services, or it can be a partner event bus \
   which can be matched to a partner event source.\n"]

module CreatePartnerEventSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partner_event_source_request ->
    ( create_partner_event_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partner_event_source_request ->
    ( create_partner_event_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Called by an SaaS partner to create a partner event source. This operation is not used by \
   Amazon Web Services customers.\n\n\
  \ Each partner event source can be used by one Amazon Web Services account to create a matching \
   partner event bus in that Amazon Web Services account. A SaaS partner must create one partner \
   event source for each Amazon Web Services account that wants to receive those event types. \n\
  \ \n\
  \  A partner event source creates events based on resources within the SaaS partner's service or \
   application.\n\
  \  \n\
  \   An Amazon Web Services account that creates a partner event bus that matches the partner \
   event source can use that event bus to receive events from the partner, and then process them \
   using Amazon Web Services Events rules and targets.\n\
  \   \n\
  \    Partner event source names follow this format:\n\
  \    \n\
  \      \n\
  \     {[\n\
  \      {i partner_name}/{i event_namespace}/{i event_name} \n\
  \     ]}\n\
  \      \n\
  \     \n\
  \       {i partner_name} is determined during partner registration and identifies the partner to \
   Amazon Web Services customers. {i event_namespace} is determined by the partner and is a way \
   for the partner to categorize their events. {i event_name} is determined by the partner, and \
   should uniquely identify an event-generating resource within the partner system. The \
   combination of {i event_namespace} and {i event_name} should help Amazon Web Services customers \
   decide whether to create an event bus to receive these events.\n\
  \      "]

module DeactivateEventSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deactivate_event_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deactivate_event_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use this operation to temporarily stop receiving events from the specified partner \
   event source. The matching event bus is not deleted. \n\n\
  \ When you deactivate a partner event source, the source goes into PENDING state. If it remains \
   in PENDING state for more than two weeks, it is deleted.\n\
  \ \n\
  \  To activate a deactivated partner event source, use \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ActivateEventSource.html}ActivateEventSource}.\n\
  \  "]

module DeauthorizeConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deauthorize_connection_request ->
    ( deauthorize_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deauthorize_connection_request ->
    ( deauthorize_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes all authorization parameters from the connection. This lets you remove the secret from \
   the connection so you can reuse it without having to create a new connection.\n"]

module DeleteApiDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_api_destination_request ->
    ( delete_api_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_api_destination_request ->
    ( delete_api_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified API destination.\n"]

module DeleteArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_archive_request ->
    ( delete_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_archive_request ->
    ( delete_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified archive.\n"]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a connection.\n"]

module DeleteEventBus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_bus_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_bus_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified custom event bus or partner event bus. All rules associated with this \
   event bus need to be deleted. You can't delete your account's default event bus.\n"]

module DeletePartnerEventSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_partner_event_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_partner_event_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation is used by SaaS partners to delete a partner event source. This operation is not \
   used by Amazon Web Services customers.\n\n\
  \ When you delete an event source, the status of the corresponding partner event bus in the \
   Amazon Web Services customer account becomes DELETED.\n\
  \ \n\
  \  \n\
  \  "]

module DeleteRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified rule.\n\n\
  \ Before you can delete the rule, you must remove all targets, using \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemoveTargets.html}RemoveTargets}.\n\
  \ \n\
  \  When you delete a rule, incoming events might continue to match to the deleted rule. Allow a \
   short period of time for changes to take effect.\n\
  \  \n\
  \   If you call delete rule multiple times for the same rule, all calls will succeed. When you \
   call delete rule for a non-existent custom eventbus, [ResourceNotFoundException] is returned.\n\
  \   \n\
  \    Managed rules are rules created and managed by another Amazon Web Services service on your \
   behalf. These rules are created by those other Amazon Web Services services to support \
   functionality in those services. You can delete these rules using the [Force] option, but you \
   should do so only if you are sure the other service is not still using that rule.\n\
  \    "]

module DescribeApiDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_api_destination_request ->
    ( describe_api_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_api_destination_request ->
    ( describe_api_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about an API destination.\n"]

module DescribeArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_archive_request ->
    ( describe_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_archive_request ->
    ( describe_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about an archive.\n"]

module DescribeConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_request ->
    ( describe_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_request ->
    ( describe_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about a connection.\n"]

module DescribeEventBus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_bus_request ->
    ( describe_event_bus_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_bus_request ->
    ( describe_event_bus_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays details about an event bus in your account. This can include the external Amazon Web \
   Services accounts that are permitted to write events to your default event bus, and the \
   associated policy. For custom event buses and partner event buses, it displays the name, ARN, \
   policy, state, and creation time.\n\n\
  \  To enable your account to receive events from other accounts on its default event bus, use \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.\n\
  \ \n\
  \  For more information about partner event buses, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n\
  \  "]

module DescribeEventSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_source_request ->
    ( describe_event_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_source_request ->
    ( describe_event_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation lists details about a partner event source that is shared with your account.\n"]

module DescribePartnerEventSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_partner_event_source_request ->
    ( describe_partner_event_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_partner_event_source_request ->
    ( describe_partner_event_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An SaaS partner can use this operation to list details about a partner event source that they \
   have created. Amazon Web Services customers do not use this operation. Instead, Amazon Web \
   Services customers can use \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventSource.html}DescribeEventSource} \
   to see details about a partner event source that is shared with them.\n"]

module DescribeReplay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_replay_request ->
    ( describe_replay_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_replay_request ->
    ( describe_replay_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves details about a replay. Use [DescribeReplay] to determine the progress of a running \
   replay. A replay processes events to replay based on the time in the event, and replays them \
   using 1 minute intervals. If you use [StartReplay] and specify an [EventStartTime] and an \
   [EventEndTime] that covers a 20 minute time range, the events are replayed from the first \
   minute of that 20 minute range first. Then the events from the second minute are replayed. You \
   can use [DescribeReplay] to determine the progress of a replay. The value returned for \
   [EventLastReplayedTime] indicates the time within the specified time range associated with the \
   last event replayed.\n"]

module DescribeRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_request ->
    ( describe_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rule_request ->
    ( describe_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified rule.\n\n\
  \ DescribeRule does not list the targets of a rule. To see the targets associated with a rule, \
   use \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.\n\
  \ "]

module DisableRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if \
   it has a schedule expression.\n\n\
  \ When you disable a rule, incoming events might continue to match to the disabled rule. Allow a \
   short period of time for changes to take effect.\n\
  \ "]

module EnableRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the specified rule. If the rule does not exist, the operation fails.\n\n\
  \ When you enable a rule, incoming events might not immediately start matching to a newly \
   enabled rule. Allow a short period of time for changes to take effect.\n\
  \ "]

module ListApiDestinations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_api_destinations_request ->
    ( list_api_destinations_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_api_destinations_request ->
    ( list_api_destinations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of API destination in the account in the current Region.\n"]

module ListArchives : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_archives_request ->
    ( list_archives_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_archives_request ->
    ( list_archives_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists your archives. You can either list all the archives or you can provide a prefix to match \
   to the archive names. Filter parameters are exclusive.\n"]

module ListConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connections_request ->
    ( list_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connections_request ->
    ( list_connections_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of connections from the account.\n"]

module ListEventBuses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_event_buses_request ->
    ( list_event_buses_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_event_buses_request ->
    ( list_event_buses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the event buses in your account, including the default event bus, custom event buses, \
   and partner event buses.\n"]

module ListEventSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_event_sources_request ->
    ( list_event_sources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_event_sources_request ->
    ( list_event_sources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use this to see all the partner event sources that have been shared with your Amazon \
   Web Services account. For more information about partner event sources, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n"]

module ListPartnerEventSourceAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_partner_event_source_accounts_request ->
    ( list_partner_event_source_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_partner_event_source_accounts_request ->
    ( list_partner_event_source_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An SaaS partner can use this operation to display the Amazon Web Services account ID that a \
   particular partner event source name is associated with. This operation is not used by Amazon \
   Web Services customers.\n"]

module ListPartnerEventSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_partner_event_sources_request ->
    ( list_partner_event_sources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_partner_event_sources_request ->
    ( list_partner_event_sources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An SaaS partner can use this operation to list all the partner event source names that they \
   have created. This operation is not used by Amazon Web Services customers.\n"]

module ListReplays : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_replays_request ->
    ( list_replays_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_replays_request ->
    ( list_replays_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists your replays. You can either list all the replays or you can provide a prefix to match to \
   the replay names. Filter parameters are exclusive.\n"]

module ListRuleNamesByTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_names_by_target_request ->
    ( list_rule_names_by_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_names_by_target_request ->
    ( list_rule_names_by_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge \
   can invoke a specific target in your account.\n"]

module ListRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rules_request ->
    ( list_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rules_request ->
    ( list_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a \
   prefix to match to the rule names.\n\n\
  \ ListRules does not list the targets of a rule. To see the targets associated with a rule, use \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Displays the tags associated with an EventBridge resource. In EventBridge, rules and event \
   buses can be tagged.\n"]

module ListTargetsByRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_targets_by_rule_request ->
    ( list_targets_by_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_targets_by_rule_request ->
    ( list_targets_by_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the targets assigned to the specified rule.\n"]

module PutEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_events_request ->
    ( put_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_events_request ->
    ( put_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sends custom events to Amazon EventBridge so that they can be matched to rules.\n"]

module PutPartnerEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_partner_events_request ->
    ( put_partner_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_partner_events_request ->
    ( put_partner_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web \
   Services customers do not use this operation.\n"]

module PutPermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception
    | `PolicyLengthExceededException of policy_length_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `PolicyLengthExceededException of policy_length_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `PolicyLengthExceededException of policy_length_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Running [PutPermission] permits the specified Amazon Web Services account or Amazon Web \
   Services organization to put events to the specified {i event bus}. Amazon EventBridge \
   (CloudWatch Events) rules in your account are triggered by these events arriving to an event \
   bus in your account. \n\n\
  \ For another account to send events to your account, that external account must have an \
   EventBridge rule with your account's event bus as a target.\n\
  \ \n\
  \  To enable multiple Amazon Web Services accounts to put events to your event bus, run \
   [PutPermission] once for each of these accounts. Or, if all the accounts are members of the \
   same Amazon Web Services organization, you can run [PutPermission] once specifying [Principal] \
   as \"*\" and specifying the Amazon Web Services organization ID in [Condition], to grant \
   permissions to all accounts in that organization.\n\
  \  \n\
  \   If you grant permissions using an organization, then accounts in that organization must \
   specify a [RoleArn] with proper permissions when they use [PutTarget] to add your account's \
   event bus as a target. For more information, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending \
   and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User \
   Guide}.\n\
  \   \n\
  \    The permission policy on the event bus cannot exceed 10 KB in size.\n\
  \    "]

module PutRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `InvalidEventPatternException of invalid_event_pattern_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_rule_request ->
    ( put_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_rule_request ->
    ( put_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the specified rule. Rules are enabled by default, or based on value of the \
   state. You can disable a rule using \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DisableRule.html}DisableRule}.\n\n\
  \ A single rule watches for events from a single event bus. Events generated by Amazon Web \
   Services services go to your account's default event bus. Events generated by SaaS partner \
   services or applications go to the matching partner event bus. If you have custom applications \
   or services, you can specify whether their events go to your default event bus or a custom \
   event bus that you have created. For more information, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n\
  \ \n\
  \  If you are updating an existing rule, the rule is replaced with what you specify in this \
   [PutRule] command. If you omit arguments in [PutRule], the old values for those arguments are \
   not kept. Instead, they are replaced with null values.\n\
  \  \n\
  \   When you create or update a rule, incoming events might not immediately start matching to \
   new or updated rules. Allow a short period of time for changes to take effect.\n\
  \   \n\
  \    A rule must contain at least an EventPattern or ScheduleExpression. Rules with \
   EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions \
   self-trigger based on the given schedule. A rule can have both an EventPattern and a \
   ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.\n\
  \    \n\
  \     When you initially create a rule, you can optionally assign one or more tags to the rule. \
   Tags can help you organize and categorize your resources. You can also use them to scope user \
   permissions, by granting a user permission to access or change only rules with certain tag \
   values. To use the [PutRule] operation and assign tags, you must have both the [events:PutRule] \
   and [events:TagResource] permissions.\n\
  \     \n\
  \      If you are updating an existing rule, any tags you specify in the [PutRule] operation are \
   ignored. To update the tags of an existing rule, use \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_TagResource.html}TagResource} \
   and \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UntagResource.html}UntagResource}.\n\
  \      \n\
  \       Most services in Amazon Web Services treat : or / as the same character in Amazon \
   Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be \
   sure to use the correct ARN characters when creating event patterns so that they match the ARN \
   syntax in the event you want to match.\n\
  \       \n\
  \        In EventBridge, it is possible to create rules that lead to infinite loops, where a \
   rule is fired repeatedly. For example, a rule might detect that ACLs have changed on an S3 \
   bucket, and trigger software to change them to the desired state. If the rule is not written \
   carefully, the subsequent change to the ACLs fires the rule again, creating an infinite loop.\n\
  \        \n\
  \         To prevent this, write the rules so that the triggered actions do not re-fire the same \
   rule. For example, your rule could fire only if ACLs are found to be in a bad state, instead of \
   after any change. \n\
  \         \n\
  \          An infinite loop can quickly cause higher than expected charges. We recommend that \
   you use budgeting, which alerts you when charges exceed your specified limit. For more \
   information, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html}Managing \
   Your Costs with Budgets}.\n\
  \          "]

module PutTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_targets_request ->
    ( put_targets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_targets_request ->
    ( put_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified targets to the specified rule, or updates the targets if they are already \
   associated with the rule.\n\n\
  \ Targets are the resources that are invoked when a rule is triggered.\n\
  \ \n\
  \  You can configure the following as targets for Events:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html}API \
   destination} \n\
  \             \n\
  \              }\n\
  \         {-  Amazon API Gateway REST API endpoints\n\
  \             \n\
  \              }\n\
  \         {-  API Gateway\n\
  \             \n\
  \              }\n\
  \         {-  Batch job queue\n\
  \             \n\
  \              }\n\
  \         {-  CloudWatch Logs group\n\
  \             \n\
  \              }\n\
  \         {-  CodeBuild project\n\
  \             \n\
  \              }\n\
  \         {-  CodePipeline\n\
  \             \n\
  \              }\n\
  \         {-  Amazon EC2 [CreateSnapshot] API call\n\
  \             \n\
  \              }\n\
  \         {-  Amazon EC2 [RebootInstances] API call\n\
  \             \n\
  \              }\n\
  \         {-  Amazon EC2 [StopInstances] API call\n\
  \             \n\
  \              }\n\
  \         {-  Amazon EC2 [TerminateInstances] API call\n\
  \             \n\
  \              }\n\
  \         {-  Amazon ECS tasks\n\
  \             \n\
  \              }\n\
  \         {-  Event bus in a different Amazon Web Services account or Region.\n\
  \             \n\
  \              You can use an event bus in the US East (N. Virginia) us-east-1, US West (Oregon) \
   us-west-2, or Europe (Ireland) eu-west-1 Regions as a target for a rule.\n\
  \              \n\
  \               }\n\
  \         {-  Firehose delivery stream (Firehose)\n\
  \             \n\
  \              }\n\
  \         {-  Inspector assessment template (Amazon Inspector)\n\
  \             \n\
  \              }\n\
  \         {-  Kinesis stream (Kinesis Data Stream)\n\
  \             \n\
  \              }\n\
  \         {-  Lambda function\n\
  \             \n\
  \              }\n\
  \         {-  Redshift clusters (Data API statement execution)\n\
  \             \n\
  \              }\n\
  \         {-  Amazon SNS topic\n\
  \             \n\
  \              }\n\
  \         {-  Amazon SQS queues (includes FIFO queues\n\
  \             \n\
  \              }\n\
  \         {-  SSM Automation\n\
  \             \n\
  \              }\n\
  \         {-  SSM OpsItem\n\
  \             \n\
  \              }\n\
  \         {-  SSM Run Command\n\
  \             \n\
  \              }\n\
  \         {-  Step Functions state machines\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   Creating rules with built-in targets is supported only in the Amazon Web Services Management \
   Console. The built-in targets are [EC2 CreateSnapshot API call], [EC2 RebootInstances API\n\
  \        call], [EC2 StopInstances API call], and [EC2 TerminateInstances API\n\
  \        call]. \n\
  \   \n\
  \    For some target types, [PutTargets] provides target-specific parameters. If the target is a \
   Kinesis data stream, you can optionally specify which shard the event goes to by using the \
   [KinesisParameters] argument. To invoke a command on multiple EC2 instances with one rule, you \
   can use the [RunCommandParameters] field.\n\
  \    \n\
  \     To be able to make API calls against the resources that you own, Amazon EventBridge needs \
   the appropriate permissions. For Lambda and Amazon SNS resources, EventBridge relies on \
   resource-based policies. For EC2 instances, Kinesis Data Streams, Step Functions state machines \
   and API Gateway REST APIs, EventBridge relies on IAM roles that you specify in the [RoleARN] \
   argument in [PutTargets]. For more information, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html}Authentication \
   and Access Control} in the {i Amazon EventBridge User Guide}.\n\
  \     \n\
  \      If another Amazon Web Services account is in the same region and has granted you \
   permission (using [PutPermission]), you can send events to that account. Set that account's \
   event bus as a target of the rules in your account. To send the matched events to the other \
   account, specify that account's event bus as the [Arn] value when you run [PutTargets]. If your \
   account sends events to another account, your account is charged for each sent event. Each \
   event sent to another account is charged as a custom event. The account receiving the event is \
   not charged. For more information, see {{:http://aws.amazon.com/eventbridge/pricing/}Amazon \
   EventBridge Pricing}.\n\
  \      \n\
  \         [Input], [InputPath], and [InputTransformer] are not available with [PutTarget] if the \
   target is an event bus of a different Amazon Web Services account.\n\
  \        \n\
  \          If you are setting the event bus of another account as the target, and that account \
   granted permission to your account through an organization instead of directly by the account \
   ID, then you must specify a [RoleArn] with proper permissions in the [Target] structure. For \
   more information, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending \
   and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User \
   Guide}.\n\
  \          \n\
  \           For more information about enabling cross-account events, see \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.\n\
  \           \n\
  \             {b Input}, {b InputPath}, and {b InputTransformer} are mutually exclusive and \
   optional parameters of a target. When a rule is triggered due to a matched event:\n\
  \            \n\
  \             {ul\n\
  \                   {-  If none of the following arguments are specified for a target, then the \
   entire event is passed to the target in JSON format (unless the target is Amazon EC2 Run \
   Command or Amazon ECS task, in which case nothing from the event is passed to the target).\n\
  \                       \n\
  \                        }\n\
  \                   {-  If {b Input} is specified in the form of valid JSON, then the matched \
   event is overridden with this constant.\n\
  \                       \n\
  \                        }\n\
  \                   {-  If {b InputPath} is specified in the form of JSONPath (for example, \
   [$.detail]), then only the part of the event specified in the path is passed to the target (for \
   example, only the detail part of the event is passed).\n\
  \                       \n\
  \                        }\n\
  \                   {-  If {b InputTransformer} is specified, then one or more specified \
   JSONPaths are extracted from the event and used as values in a template that you specify as the \
   input to the target.\n\
  \                       \n\
  \                        }\n\
  \                   }\n\
  \   When you specify [InputPath] or [InputTransformer], you must use JSON dot notation, not \
   bracket notation.\n\
  \   \n\
  \    When you add targets to a rule and the associated rule triggers soon after, new or updated \
   targets might not be immediately invoked. Allow a short period of time for changes to take \
   effect.\n\
  \    \n\
  \     This action can partially fail if too many requests are made at the same time. If that \
   happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] \
   provides the ID of the failed target and the error code.\n\
  \     "]

module RemovePermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `OperationDisabledException of operation_disabled_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_permission_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `OperationDisabledException of operation_disabled_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Revokes the permission of another Amazon Web Services account to be able to put events to the \
   specified event bus. Specify the account to revoke by the [StatementId] value that you \
   associated with the account when you granted it permission with [PutPermission]. You can find \
   the [StatementId] by using \
   {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventBus.html}DescribeEventBus}.\n"]

module RemoveTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_targets_request ->
    ( remove_targets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_targets_request ->
    ( remove_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified targets from the specified rule. When the rule is triggered, those \
   targets are no longer be invoked.\n\n\
  \ When you remove a target, when the associated rule triggers, removed targets might continue to \
   be invoked. Allow a short period of time for changes to take effect.\n\
  \ \n\
  \  This action can partially fail if too many requests are made at the same time. If that \
   happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] \
   provides the ID of the failed target and the error code.\n\
  \  "]

module StartReplay : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidEventPatternException of invalid_event_pattern_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_replay_request ->
    ( start_replay_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_replay_request ->
    ( start_replay_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the specified replay. Events are not necessarily replayed in the exact same order that \
   they were added to the archive. A replay processes events to replay based on the time in the \
   event, and replays them using 1 minute intervals. If you specify an [EventStartTime] and an \
   [EventEndTime] that covers a 20 minute time range, the events are replayed from the first \
   minute of that 20 minute range first. Then the events from the second minute are replayed. You \
   can use [DescribeReplay] to determine the progress of a replay. The value returned for \
   [EventLastReplayedTime] indicates the time within the specified time range associated with the \
   last event replayed.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help \
   you organize and categorize your resources. You can also use them to scope user permissions by \
   granting a user permission to access or change only resources with certain tag values. In \
   EventBridge, rules and event buses can be tagged.\n\n\
  \ Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as \
   strings of characters.\n\
  \ \n\
  \  You can use the [TagResource] action with a resource that already has tags. If you specify a \
   new tag key, this tag is appended to the list of tags associated with the resource. If you \
   specify a tag key that is already associated with the resource, the new tag value that you \
   specify replaces the previous value for that tag.\n\
  \  \n\
  \   You can associate as many as 50 tags with a resource.\n\
  \   "]

module TestEventPattern : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidEventPatternException of invalid_event_pattern_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_event_pattern_request ->
    ( test_event_pattern_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_event_pattern_request ->
    ( test_event_pattern_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tests whether the specified event pattern matches the provided event.\n\n\
  \ Most services in Amazon Web Services treat : or / as the same character in Amazon Resource \
   Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to \
   use the correct ARN characters when creating event patterns so that they match the ARN syntax \
   in the event you want to match.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `ManagedRuleException of managed_rule_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `ManagedRuleException of managed_rule_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge \
   (CloudWatch Events), rules and event buses can be tagged.\n"]

module UpdateApiDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_api_destination_request ->
    ( update_api_destination_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_api_destination_request ->
    ( update_api_destination_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an API destination.\n"]

module UpdateArchive : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `InvalidEventPatternException of invalid_event_pattern_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_archive_request ->
    ( update_archive_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_archive_request ->
    ( update_archive_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `InvalidEventPatternException of invalid_event_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified archive.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalException of internal_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( update_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( update_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalException of internal_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates settings for a connection.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
