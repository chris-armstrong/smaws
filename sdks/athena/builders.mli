open Types

val make_datum : ?var_char_value:datum_string -> unit -> datum

val make_engine_version :
  ?effective_engine_version:name_string ->
  ?selected_engine_version:name_string ->
  unit ->
  engine_version

val make_work_group_summary :
  ?identity_center_application_arn:identity_center_application_arn ->
  ?engine_version:engine_version ->
  ?creation_time:date ->
  ?description:work_group_description_string ->
  ?state:work_group_state ->
  ?name:work_group_name ->
  unit ->
  work_group_summary

val make_encryption_configuration :
  ?kms_key:string_ -> encryption_option:encryption_option -> unit -> encryption_configuration

val make_acl_configuration : s3_acl_option:s3_acl_option -> unit -> acl_configuration

val make_result_configuration_updates :
  ?remove_acl_configuration:boxed_boolean ->
  ?acl_configuration:acl_configuration ->
  ?remove_expected_bucket_owner:boxed_boolean ->
  ?expected_bucket_owner:aws_account_id ->
  ?remove_encryption_configuration:boxed_boolean ->
  ?encryption_configuration:encryption_configuration ->
  ?remove_output_location:boxed_boolean ->
  ?output_location:result_output_location ->
  unit ->
  result_configuration_updates

val make_managed_query_results_encryption_configuration :
  kms_key:kms_key -> unit -> managed_query_results_encryption_configuration

val make_managed_query_results_configuration_updates :
  ?remove_encryption_configuration:boxed_boolean ->
  ?encryption_configuration:managed_query_results_encryption_configuration ->
  ?enabled:boxed_boolean ->
  unit ->
  managed_query_results_configuration_updates

val make_customer_content_encryption_configuration :
  kms_key:kms_key -> unit -> customer_content_encryption_configuration

val make_query_results_s3_access_grants_configuration :
  ?create_user_level_prefix:boxed_boolean ->
  authentication_type:authentication_type ->
  enable_s3_access_grants:boxed_boolean ->
  unit ->
  query_results_s3_access_grants_configuration

val make_cloud_watch_logging_configuration :
  ?log_types:log_types_map ->
  ?log_stream_name_prefix:log_stream_name_prefix ->
  ?log_group:log_group_name ->
  enabled:boxed_boolean ->
  unit ->
  cloud_watch_logging_configuration

val make_managed_logging_configuration :
  ?kms_key:kms_key -> enabled:boxed_boolean -> unit -> managed_logging_configuration

val make_s3_logging_configuration :
  ?log_location:s3_output_location ->
  ?kms_key:kms_key ->
  enabled:boxed_boolean ->
  unit ->
  s3_logging_configuration

val make_monitoring_configuration :
  ?s3_logging_configuration:s3_logging_configuration ->
  ?managed_logging_configuration:managed_logging_configuration ->
  ?cloud_watch_logging_configuration:cloud_watch_logging_configuration ->
  unit ->
  monitoring_configuration

val make_classification : ?properties:parameters_map -> ?name:name_string -> unit -> classification

val make_engine_configuration :
  ?classifications:classification_list ->
  ?spark_properties:parameters_map ->
  ?additional_configs:parameters_map ->
  ?default_executor_dpu_size:default_executor_dpu_size ->
  ?max_concurrent_dpus:max_concurrent_dpus ->
  ?coordinator_dpu_size:coordinator_dpu_size ->
  unit ->
  engine_configuration

val make_work_group_configuration_updates :
  ?engine_configuration:engine_configuration ->
  ?monitoring_configuration:monitoring_configuration ->
  ?query_results_s3_access_grants_configuration:query_results_s3_access_grants_configuration ->
  ?enable_minimum_encryption_configuration:boxed_boolean ->
  ?customer_content_encryption_configuration:customer_content_encryption_configuration ->
  ?execution_role:role_arn ->
  ?additional_configuration:name_string ->
  ?remove_customer_content_encryption_configuration:boxed_boolean ->
  ?engine_version:engine_version ->
  ?requester_pays_enabled:boxed_boolean ->
  ?remove_bytes_scanned_cutoff_per_query:boxed_boolean ->
  ?bytes_scanned_cutoff_per_query:bytes_scanned_cutoff_value ->
  ?publish_cloud_watch_metrics_enabled:boxed_boolean ->
  ?managed_query_results_configuration_updates:managed_query_results_configuration_updates ->
  ?result_configuration_updates:result_configuration_updates ->
  ?enforce_work_group_configuration:boxed_boolean ->
  unit ->
  work_group_configuration_updates

val make_result_configuration :
  ?acl_configuration:acl_configuration ->
  ?expected_bucket_owner:aws_account_id ->
  ?encryption_configuration:encryption_configuration ->
  ?output_location:result_output_location ->
  unit ->
  result_configuration

val make_managed_query_results_configuration :
  ?encryption_configuration:managed_query_results_encryption_configuration ->
  enabled:boolean_ ->
  unit ->
  managed_query_results_configuration

val make_identity_center_configuration :
  ?identity_center_instance_arn:identity_center_instance_arn ->
  ?enable_identity_center:boxed_boolean ->
  unit ->
  identity_center_configuration

val make_work_group_configuration :
  ?query_results_s3_access_grants_configuration:query_results_s3_access_grants_configuration ->
  ?identity_center_configuration:identity_center_configuration ->
  ?enable_minimum_encryption_configuration:boxed_boolean ->
  ?customer_content_encryption_configuration:customer_content_encryption_configuration ->
  ?engine_configuration:engine_configuration ->
  ?monitoring_configuration:monitoring_configuration ->
  ?execution_role:role_arn ->
  ?additional_configuration:name_string ->
  ?engine_version:engine_version ->
  ?requester_pays_enabled:boxed_boolean ->
  ?bytes_scanned_cutoff_per_query:bytes_scanned_cutoff_value ->
  ?publish_cloud_watch_metrics_enabled:boxed_boolean ->
  ?enforce_work_group_configuration:boxed_boolean ->
  ?managed_query_results_configuration:managed_query_results_configuration ->
  ?result_configuration:result_configuration ->
  unit ->
  work_group_configuration

val make_work_group :
  ?identity_center_application_arn:identity_center_application_arn ->
  ?creation_time:date ->
  ?description:work_group_description_string ->
  ?configuration:work_group_configuration ->
  ?state:work_group_state ->
  name:work_group_name ->
  unit ->
  work_group

val make_update_work_group_output : unit -> unit

val make_update_work_group_input :
  ?state:work_group_state ->
  ?configuration_updates:work_group_configuration_updates ->
  ?description:work_group_description_string ->
  work_group:work_group_name ->
  unit ->
  update_work_group_input

val make_update_prepared_statement_output : unit -> unit

val make_update_prepared_statement_input :
  ?description:description_string ->
  query_statement:query_string ->
  work_group:work_group_name ->
  statement_name:statement_name ->
  unit ->
  update_prepared_statement_input

val make_update_notebook_output : unit -> unit
val make_update_notebook_metadata_output : unit -> unit

val make_update_notebook_metadata_input :
  ?client_request_token:client_request_token ->
  name:notebook_name ->
  notebook_id:notebook_id ->
  unit ->
  update_notebook_metadata_input

val make_update_notebook_input :
  ?client_request_token:client_request_token ->
  ?session_id:session_id ->
  type_:notebook_type ->
  payload:payload ->
  notebook_id:notebook_id ->
  unit ->
  update_notebook_input

val make_update_named_query_output : unit -> unit

val make_update_named_query_input :
  ?description:named_query_description_string ->
  query_string:query_string ->
  name:name_string ->
  named_query_id:named_query_id ->
  unit ->
  update_named_query_input

val make_update_data_catalog_output : unit -> unit

val make_update_data_catalog_input :
  ?parameters:parameters_map ->
  ?description:description_string ->
  type_:data_catalog_type ->
  name:catalog_name_string ->
  unit ->
  update_data_catalog_input

val make_update_capacity_reservation_output : unit -> unit

val make_update_capacity_reservation_input :
  name:capacity_reservation_name ->
  target_dpus:target_dpus_integer ->
  unit ->
  update_capacity_reservation_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_input

val make_unprocessed_query_execution_id :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?query_execution_id:query_execution_id ->
  unit ->
  unprocessed_query_execution_id

val make_unprocessed_prepared_statement_name :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?statement_name:statement_name ->
  unit ->
  unprocessed_prepared_statement_name

val make_unprocessed_named_query_id :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?named_query_id:named_query_id ->
  unit ->
  unprocessed_named_query_id

val make_terminate_session_response : ?state:session_state -> unit -> terminate_session_response
val make_terminate_session_request : session_id:session_id -> unit -> terminate_session_request
val make_tag_resource_output : unit -> unit
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_tag_resource_input :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_input

val make_column :
  ?comment:comment_string -> ?type_:type_string -> name:name_string -> unit -> column

val make_table_metadata :
  ?parameters:parameters_map ->
  ?partition_keys:column_list ->
  ?columns:column_list ->
  ?table_type:table_type_string ->
  ?last_access_time:timestamp ->
  ?create_time:timestamp ->
  name:name_string ->
  unit ->
  table_metadata

val make_stop_query_execution_output : unit -> unit

val make_stop_query_execution_input :
  query_execution_id:query_execution_id -> unit -> stop_query_execution_input

val make_stop_calculation_execution_response :
  ?state:calculation_execution_state -> unit -> stop_calculation_execution_response

val make_stop_calculation_execution_request :
  calculation_execution_id:calculation_execution_id -> unit -> stop_calculation_execution_request

val make_start_session_response :
  ?state:session_state -> ?session_id:session_id -> unit -> start_session_response

val make_start_session_request :
  ?copy_work_group_tags:boxed_boolean ->
  ?tags:tag_list ->
  ?client_request_token:idempotency_token ->
  ?session_idle_timeout_in_minutes:session_idle_timeout_in_minutes ->
  ?notebook_version:name_string ->
  ?monitoring_configuration:monitoring_configuration ->
  ?execution_role:role_arn ->
  ?description:description_string ->
  engine_configuration:engine_configuration ->
  work_group:work_group_name ->
  unit ->
  start_session_request

val make_start_query_execution_output :
  ?query_execution_id:query_execution_id -> unit -> start_query_execution_output

val make_query_execution_context :
  ?catalog:catalog_name_string -> ?database:database_string -> unit -> query_execution_context

val make_result_reuse_by_age_configuration :
  ?max_age_in_minutes:age -> enabled:boolean_ -> unit -> result_reuse_by_age_configuration

val make_result_reuse_configuration :
  ?result_reuse_by_age_configuration:result_reuse_by_age_configuration ->
  unit ->
  result_reuse_configuration

val make_start_query_execution_input :
  ?engine_configuration:engine_configuration ->
  ?result_reuse_configuration:result_reuse_configuration ->
  ?execution_parameters:execution_parameters ->
  ?work_group:work_group_name ->
  ?result_configuration:result_configuration ->
  ?query_execution_context:query_execution_context ->
  ?client_request_token:idempotency_token ->
  query_string:query_string ->
  unit ->
  start_query_execution_input

val make_start_calculation_execution_response :
  ?state:calculation_execution_state ->
  ?calculation_execution_id:calculation_execution_id ->
  unit ->
  start_calculation_execution_response

val make_calculation_configuration : ?code_block:code_block -> unit -> calculation_configuration

val make_start_calculation_execution_request :
  ?client_request_token:idempotency_token ->
  ?code_block:code_block ->
  ?calculation_configuration:calculation_configuration ->
  ?description:description_string ->
  session_id:session_id ->
  unit ->
  start_calculation_execution_request

val make_session_status :
  ?state_change_reason:description_string ->
  ?state:session_state ->
  ?idle_since_date_time:date ->
  ?end_date_time:date ->
  ?last_modified_date_time:date ->
  ?start_date_time:date ->
  unit ->
  session_status

val make_session_summary :
  ?status:session_status ->
  ?notebook_version:name_string ->
  ?engine_version:engine_version ->
  ?description:description_string ->
  ?session_id:session_id ->
  unit ->
  session_summary

val make_session_statistics : ?dpu_execution_in_millis:long -> unit -> session_statistics

val make_session_configuration :
  ?encryption_configuration:encryption_configuration ->
  ?session_idle_timeout_in_minutes:session_idle_timeout_in_minutes ->
  ?idle_timeout_seconds:long ->
  ?working_directory:result_output_location ->
  ?execution_role:role_arn ->
  unit ->
  session_configuration

val make_row : ?data:datum_list -> unit -> row

val make_column_info :
  ?case_sensitive:boolean_ ->
  ?nullable:column_nullable ->
  ?scale:integer ->
  ?precision:integer ->
  ?label:string_ ->
  ?table_name:string_ ->
  ?schema_name:string_ ->
  ?catalog_name:string_ ->
  type_:string_ ->
  name:string_ ->
  unit ->
  column_info

val make_result_set_metadata : ?column_info:column_info_list -> unit -> result_set_metadata

val make_result_set :
  ?result_set_metadata:result_set_metadata -> ?rows:row_list -> unit -> result_set

val make_result_reuse_information :
  reused_previous_result:boolean_ -> unit -> result_reuse_information

val make_query_stage_plan_node :
  ?remote_sources:string_list ->
  ?children:query_stage_plan_nodes ->
  ?identifier:string_ ->
  ?name:string_ ->
  unit ->
  query_stage_plan_node

val make_query_stage :
  ?sub_stages:query_stages ->
  ?query_stage_plan:query_stage_plan_node ->
  ?execution_time:long ->
  ?input_rows:long ->
  ?input_bytes:long ->
  ?output_rows:long ->
  ?output_bytes:long ->
  ?state:string_ ->
  ?stage_id:long ->
  unit ->
  query_stage

val make_query_runtime_statistics_timeline :
  ?total_execution_time_in_millis:long ->
  ?service_processing_time_in_millis:long ->
  ?engine_execution_time_in_millis:long ->
  ?query_planning_time_in_millis:long ->
  ?service_pre_processing_time_in_millis:long ->
  ?query_queue_time_in_millis:long ->
  unit ->
  query_runtime_statistics_timeline

val make_query_runtime_statistics_rows :
  ?output_rows:long ->
  ?output_bytes:long ->
  ?input_bytes:long ->
  ?input_rows:long ->
  unit ->
  query_runtime_statistics_rows

val make_query_runtime_statistics :
  ?output_stage:query_stage ->
  ?rows:query_runtime_statistics_rows ->
  ?timeline:query_runtime_statistics_timeline ->
  unit ->
  query_runtime_statistics

val make_athena_error :
  ?error_message:string_ ->
  ?retryable:boolean_ ->
  ?error_type:error_type ->
  ?error_category:error_category ->
  unit ->
  athena_error

val make_query_execution_status :
  ?athena_error:athena_error ->
  ?completion_date_time:date ->
  ?submission_date_time:date ->
  ?state_change_reason:string_ ->
  ?state:query_execution_state ->
  unit ->
  query_execution_status

val make_query_execution_statistics :
  ?dpu_count:dpu_count ->
  ?result_reuse_information:result_reuse_information ->
  ?service_processing_time_in_millis:long ->
  ?query_planning_time_in_millis:long ->
  ?service_pre_processing_time_in_millis:long ->
  ?query_queue_time_in_millis:long ->
  ?total_execution_time_in_millis:long ->
  ?data_manifest_location:string_ ->
  ?data_scanned_in_bytes:long ->
  ?engine_execution_time_in_millis:long ->
  unit ->
  query_execution_statistics

val make_query_execution :
  ?query_results_s3_access_grants_configuration:query_results_s3_access_grants_configuration ->
  ?substatement_type:string_ ->
  ?execution_parameters:execution_parameters ->
  ?engine_version:engine_version ->
  ?work_group:work_group_name ->
  ?statistics:query_execution_statistics ->
  ?status:query_execution_status ->
  ?query_execution_context:query_execution_context ->
  ?result_reuse_configuration:result_reuse_configuration ->
  ?result_configuration:result_configuration ->
  ?managed_query_results_configuration:managed_query_results_configuration ->
  ?statement_type:statement_type ->
  ?query:query_string ->
  ?query_execution_id:query_execution_id ->
  unit ->
  query_execution

val make_put_capacity_assignment_configuration_output : unit -> unit

val make_capacity_assignment :
  ?work_group_names:work_group_names_list -> unit -> capacity_assignment

val make_put_capacity_assignment_configuration_input :
  capacity_assignments:capacity_assignments_list ->
  capacity_reservation_name:capacity_reservation_name ->
  unit ->
  put_capacity_assignment_configuration_input

val make_prepared_statement_summary :
  ?last_modified_time:date -> ?statement_name:statement_name -> unit -> prepared_statement_summary

val make_prepared_statement :
  ?last_modified_time:date ->
  ?description:description_string ->
  ?work_group_name:work_group_name ->
  ?query_statement:query_string ->
  ?statement_name:statement_name ->
  unit ->
  prepared_statement

val make_notebook_session_summary :
  ?creation_time:date -> ?session_id:session_id -> unit -> notebook_session_summary

val make_notebook_metadata :
  ?last_modified_time:date ->
  ?type_:notebook_type ->
  ?creation_time:date ->
  ?work_group:work_group_name ->
  ?name:notebook_name ->
  ?notebook_id:notebook_id ->
  unit ->
  notebook_metadata

val make_named_query :
  ?work_group:work_group_name ->
  ?named_query_id:named_query_id ->
  ?description:description_string ->
  query_string:query_string ->
  database:database_string ->
  name:name_string ->
  unit ->
  named_query

val make_list_work_groups_output :
  ?next_token:token -> ?work_groups:work_groups_list -> unit -> list_work_groups_output

val make_list_work_groups_input :
  ?max_results:max_work_groups_count -> ?next_token:token -> unit -> list_work_groups_input

val make_list_tags_for_resource_output :
  ?next_token:token -> ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?max_results:max_tags_count ->
  ?next_token:token ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_tags_for_resource_input

val make_list_table_metadata_output :
  ?next_token:token ->
  ?table_metadata_list:table_metadata_list ->
  unit ->
  list_table_metadata_output

val make_list_table_metadata_input :
  ?work_group:work_group_name ->
  ?max_results:max_table_metadata_count ->
  ?next_token:token ->
  ?expression:expression_string ->
  database_name:name_string ->
  catalog_name:catalog_name_string ->
  unit ->
  list_table_metadata_input

val make_list_sessions_response :
  ?sessions:sessions_list -> ?next_token:session_manager_token -> unit -> list_sessions_response

val make_list_sessions_request :
  ?next_token:session_manager_token ->
  ?max_results:max_sessions_count ->
  ?state_filter:session_state ->
  work_group:work_group_name ->
  unit ->
  list_sessions_request

val make_list_query_executions_output :
  ?next_token:token ->
  ?query_execution_ids:query_execution_id_list ->
  unit ->
  list_query_executions_output

val make_list_query_executions_input :
  ?work_group:work_group_name ->
  ?max_results:max_query_executions_count ->
  ?next_token:token ->
  unit ->
  list_query_executions_input

val make_list_prepared_statements_output :
  ?next_token:token ->
  ?prepared_statements:prepared_statements_list ->
  unit ->
  list_prepared_statements_output

val make_list_prepared_statements_input :
  ?max_results:max_prepared_statements_count ->
  ?next_token:token ->
  work_group:work_group_name ->
  unit ->
  list_prepared_statements_input

val make_list_notebook_sessions_response :
  ?next_token:token ->
  notebook_sessions_list:notebook_sessions_list ->
  unit ->
  list_notebook_sessions_response

val make_list_notebook_sessions_request :
  ?next_token:token ->
  ?max_results:max_sessions_count ->
  notebook_id:notebook_id ->
  unit ->
  list_notebook_sessions_request

val make_list_notebook_metadata_output :
  ?notebook_metadata_list:notebook_metadata_array ->
  ?next_token:token ->
  unit ->
  list_notebook_metadata_output

val make_filter_definition : ?name:notebook_name -> unit -> filter_definition

val make_list_notebook_metadata_input :
  ?max_results:max_notebooks_count ->
  ?next_token:token ->
  ?filters:filter_definition ->
  work_group:work_group_name ->
  unit ->
  list_notebook_metadata_input

val make_list_named_queries_output :
  ?next_token:token -> ?named_query_ids:named_query_id_list -> unit -> list_named_queries_output

val make_list_named_queries_input :
  ?work_group:work_group_name ->
  ?max_results:max_named_queries_count ->
  ?next_token:token ->
  unit ->
  list_named_queries_input

val make_executors_summary :
  ?executor_size:long ->
  ?executor_state:executor_state ->
  ?termination_date_time:long ->
  ?start_date_time:long ->
  ?executor_type:executor_type ->
  executor_id:executor_id ->
  unit ->
  executors_summary

val make_list_executors_response :
  ?executors_summary:executors_summary_list ->
  ?next_token:session_manager_token ->
  session_id:session_id ->
  unit ->
  list_executors_response

val make_list_executors_request :
  ?next_token:session_manager_token ->
  ?max_results:max_list_executors_count ->
  ?executor_state_filter:executor_state ->
  session_id:session_id ->
  unit ->
  list_executors_request

val make_list_engine_versions_output :
  ?next_token:token -> ?engine_versions:engine_versions_list -> unit -> list_engine_versions_output

val make_list_engine_versions_input :
  ?max_results:max_engine_versions_count -> ?next_token:token -> unit -> list_engine_versions_input

val make_database :
  ?parameters:parameters_map ->
  ?description:description_string ->
  name:name_string ->
  unit ->
  database

val make_list_databases_output :
  ?next_token:token -> ?database_list:database_list -> unit -> list_databases_output

val make_list_databases_input :
  ?work_group:work_group_name ->
  ?max_results:max_databases_count ->
  ?next_token:token ->
  catalog_name:catalog_name_string ->
  unit ->
  list_databases_input

val make_data_catalog_summary :
  ?error:error_message ->
  ?connection_type:connection_type ->
  ?status:data_catalog_status ->
  ?type_:data_catalog_type ->
  ?catalog_name:catalog_name_string ->
  unit ->
  data_catalog_summary

val make_list_data_catalogs_output :
  ?next_token:token ->
  ?data_catalogs_summary:data_catalog_summary_list ->
  unit ->
  list_data_catalogs_output

val make_list_data_catalogs_input :
  ?work_group:work_group_name ->
  ?max_results:max_data_catalogs_count ->
  ?next_token:token ->
  unit ->
  list_data_catalogs_input

val make_capacity_allocation :
  ?request_completion_time:timestamp ->
  ?status_message:string_ ->
  request_time:timestamp ->
  status:capacity_allocation_status ->
  unit ->
  capacity_allocation

val make_capacity_reservation :
  ?last_successful_allocation_time:timestamp ->
  ?last_allocation:capacity_allocation ->
  creation_time:timestamp ->
  allocated_dpus:allocated_dpus_integer ->
  target_dpus:target_dpus_integer ->
  status:capacity_reservation_status ->
  name:capacity_reservation_name ->
  unit ->
  capacity_reservation

val make_list_capacity_reservations_output :
  ?next_token:token ->
  capacity_reservations:capacity_reservations_list ->
  unit ->
  list_capacity_reservations_output

val make_list_capacity_reservations_input :
  ?max_results:max_capacity_reservations_count ->
  ?next_token:token ->
  unit ->
  list_capacity_reservations_input

val make_calculation_status :
  ?state_change_reason:description_string ->
  ?state:calculation_execution_state ->
  ?completion_date_time:date ->
  ?submission_date_time:date ->
  unit ->
  calculation_status

val make_calculation_summary :
  ?status:calculation_status ->
  ?description:description_string ->
  ?calculation_execution_id:calculation_execution_id ->
  unit ->
  calculation_summary

val make_list_calculation_executions_response :
  ?calculations:calculations_list ->
  ?next_token:session_manager_token ->
  unit ->
  list_calculation_executions_response

val make_list_calculation_executions_request :
  ?next_token:session_manager_token ->
  ?max_results:max_calculations_count ->
  ?state_filter:calculation_execution_state ->
  session_id:session_id ->
  unit ->
  list_calculation_executions_request

val make_application_dpu_sizes :
  ?supported_dpu_sizes:supported_dpu_size_list ->
  ?application_runtime_id:name_string ->
  unit ->
  application_dpu_sizes

val make_list_application_dpu_sizes_output :
  ?next_token:token ->
  ?application_dpu_sizes:application_dpu_sizes_list ->
  unit ->
  list_application_dpu_sizes_output

val make_list_application_dpu_sizes_input :
  ?next_token:token ->
  ?max_results:max_application_dpu_sizes_count ->
  unit ->
  list_application_dpu_sizes_input

val make_import_notebook_output : ?notebook_id:notebook_id -> unit -> import_notebook_output

val make_import_notebook_input :
  ?client_request_token:client_request_token ->
  ?notebook_s3_location_uri:s3_uri ->
  ?payload:payload ->
  type_:notebook_type ->
  name:notebook_name ->
  work_group:work_group_name ->
  unit ->
  import_notebook_input

val make_get_work_group_output : ?work_group:work_group -> unit -> get_work_group_output
val make_get_work_group_input : work_group:work_group_name -> unit -> get_work_group_input

val make_get_table_metadata_output :
  ?table_metadata:table_metadata -> unit -> get_table_metadata_output

val make_get_table_metadata_input :
  ?work_group:work_group_name ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_name:catalog_name_string ->
  unit ->
  get_table_metadata_input

val make_get_session_status_response :
  ?status:session_status -> ?session_id:session_id -> unit -> get_session_status_response

val make_get_session_status_request : session_id:session_id -> unit -> get_session_status_request

val make_get_session_response :
  ?statistics:session_statistics ->
  ?status:session_status ->
  ?session_configuration:session_configuration ->
  ?monitoring_configuration:monitoring_configuration ->
  ?notebook_version:name_string ->
  ?engine_configuration:engine_configuration ->
  ?engine_version:name_string ->
  ?work_group:work_group_name ->
  ?description:description_string ->
  ?session_id:session_id ->
  unit ->
  get_session_response

val make_get_session_request : session_id:session_id -> unit -> get_session_request

val make_get_session_endpoint_response :
  auth_token_expiration_time:timestamp ->
  auth_token:string_ ->
  endpoint_url:string_ ->
  unit ->
  get_session_endpoint_response

val make_get_session_endpoint_request :
  session_id:session_id -> unit -> get_session_endpoint_request

val make_get_resource_dashboard_response : url:string_ -> unit -> get_resource_dashboard_response

val make_get_resource_dashboard_request :
  resource_ar_n:amazon_resource_name -> unit -> get_resource_dashboard_request

val make_get_query_runtime_statistics_output :
  ?query_runtime_statistics:query_runtime_statistics -> unit -> get_query_runtime_statistics_output

val make_get_query_runtime_statistics_input :
  query_execution_id:query_execution_id -> unit -> get_query_runtime_statistics_input

val make_get_query_results_output :
  ?next_token:token ->
  ?result_set:result_set ->
  ?update_count:long ->
  unit ->
  get_query_results_output

val make_get_query_results_input :
  ?query_result_type:query_result_type ->
  ?max_results:max_query_results ->
  ?next_token:token ->
  query_execution_id:query_execution_id ->
  unit ->
  get_query_results_input

val make_get_query_execution_output :
  ?query_execution:query_execution -> unit -> get_query_execution_output

val make_get_query_execution_input :
  query_execution_id:query_execution_id -> unit -> get_query_execution_input

val make_get_prepared_statement_output :
  ?prepared_statement:prepared_statement -> unit -> get_prepared_statement_output

val make_get_prepared_statement_input :
  work_group:work_group_name ->
  statement_name:statement_name ->
  unit ->
  get_prepared_statement_input

val make_get_notebook_metadata_output :
  ?notebook_metadata:notebook_metadata -> unit -> get_notebook_metadata_output

val make_get_notebook_metadata_input :
  notebook_id:notebook_id -> unit -> get_notebook_metadata_input

val make_get_named_query_output : ?named_query:named_query -> unit -> get_named_query_output
val make_get_named_query_input : named_query_id:named_query_id -> unit -> get_named_query_input
val make_get_database_output : ?database:database -> unit -> get_database_output

val make_get_database_input :
  ?work_group:work_group_name ->
  database_name:name_string ->
  catalog_name:catalog_name_string ->
  unit ->
  get_database_input

val make_data_catalog :
  ?error:error_message ->
  ?connection_type:connection_type ->
  ?status:data_catalog_status ->
  ?parameters:parameters_map ->
  ?description:description_string ->
  type_:data_catalog_type ->
  name:catalog_name_string ->
  unit ->
  data_catalog

val make_get_data_catalog_output : ?data_catalog:data_catalog -> unit -> get_data_catalog_output

val make_get_data_catalog_input :
  ?work_group:work_group_name -> name:catalog_name_string -> unit -> get_data_catalog_input

val make_get_capacity_reservation_output :
  capacity_reservation:capacity_reservation -> unit -> get_capacity_reservation_output

val make_get_capacity_reservation_input :
  name:capacity_reservation_name -> unit -> get_capacity_reservation_input

val make_capacity_assignment_configuration :
  ?capacity_assignments:capacity_assignments_list ->
  ?capacity_reservation_name:capacity_reservation_name ->
  unit ->
  capacity_assignment_configuration

val make_get_capacity_assignment_configuration_output :
  capacity_assignment_configuration:capacity_assignment_configuration ->
  unit ->
  get_capacity_assignment_configuration_output

val make_get_capacity_assignment_configuration_input :
  capacity_reservation_name:capacity_reservation_name ->
  unit ->
  get_capacity_assignment_configuration_input

val make_calculation_statistics :
  ?progress:description_string -> ?dpu_execution_in_millis:long -> unit -> calculation_statistics

val make_get_calculation_execution_status_response :
  ?statistics:calculation_statistics ->
  ?status:calculation_status ->
  unit ->
  get_calculation_execution_status_response

val make_get_calculation_execution_status_request :
  calculation_execution_id:calculation_execution_id ->
  unit ->
  get_calculation_execution_status_request

val make_get_calculation_execution_response :
  ?result_:calculation_result ->
  ?statistics:calculation_statistics ->
  ?status:calculation_status ->
  ?working_directory:s3_uri ->
  ?description:description_string ->
  ?session_id:session_id ->
  ?calculation_execution_id:calculation_execution_id ->
  unit ->
  get_calculation_execution_response

val make_get_calculation_execution_request :
  calculation_execution_id:calculation_execution_id -> unit -> get_calculation_execution_request

val make_get_calculation_execution_code_response :
  ?code_block:code_block -> unit -> get_calculation_execution_code_response

val make_get_calculation_execution_code_request :
  calculation_execution_id:calculation_execution_id ->
  unit ->
  get_calculation_execution_code_request

val make_export_notebook_output :
  ?payload:payload -> ?notebook_metadata:notebook_metadata -> unit -> export_notebook_output

val make_export_notebook_input : notebook_id:notebook_id -> unit -> export_notebook_input
val make_delete_work_group_output : unit -> unit

val make_delete_work_group_input :
  ?recursive_delete_option:boxed_boolean ->
  work_group:work_group_name ->
  unit ->
  delete_work_group_input

val make_delete_prepared_statement_output : unit -> unit

val make_delete_prepared_statement_input :
  work_group:work_group_name ->
  statement_name:statement_name ->
  unit ->
  delete_prepared_statement_input

val make_delete_notebook_output : unit -> unit
val make_delete_notebook_input : notebook_id:notebook_id -> unit -> delete_notebook_input
val make_delete_named_query_output : unit -> unit

val make_delete_named_query_input :
  named_query_id:named_query_id -> unit -> delete_named_query_input

val make_delete_data_catalog_output :
  ?data_catalog:data_catalog -> unit -> delete_data_catalog_output

val make_delete_data_catalog_input :
  ?delete_catalog_only:boolean_ -> name:catalog_name_string -> unit -> delete_data_catalog_input

val make_delete_capacity_reservation_output : unit -> unit

val make_delete_capacity_reservation_input :
  name:capacity_reservation_name -> unit -> delete_capacity_reservation_input

val make_create_work_group_output : unit -> unit

val make_create_work_group_input :
  ?tags:tag_list ->
  ?description:work_group_description_string ->
  ?configuration:work_group_configuration ->
  name:work_group_name ->
  unit ->
  create_work_group_input

val make_create_presigned_notebook_url_response :
  auth_token_expiration_time:long ->
  auth_token:auth_token ->
  notebook_url:string_ ->
  unit ->
  create_presigned_notebook_url_response

val make_create_presigned_notebook_url_request :
  session_id:session_id -> unit -> create_presigned_notebook_url_request

val make_create_prepared_statement_output : unit -> unit

val make_create_prepared_statement_input :
  ?description:description_string ->
  query_statement:query_string ->
  work_group:work_group_name ->
  statement_name:statement_name ->
  unit ->
  create_prepared_statement_input

val make_create_notebook_output : ?notebook_id:notebook_id -> unit -> create_notebook_output

val make_create_notebook_input :
  ?client_request_token:client_request_token ->
  name:notebook_name ->
  work_group:work_group_name ->
  unit ->
  create_notebook_input

val make_create_named_query_output :
  ?named_query_id:named_query_id -> unit -> create_named_query_output

val make_create_named_query_input :
  ?work_group:work_group_name ->
  ?client_request_token:idempotency_token ->
  ?description:description_string ->
  query_string:query_string ->
  database:database_string ->
  name:name_string ->
  unit ->
  create_named_query_input

val make_create_data_catalog_output :
  ?data_catalog:data_catalog -> unit -> create_data_catalog_output

val make_create_data_catalog_input :
  ?tags:tag_list ->
  ?parameters:parameters_map ->
  ?description:description_string ->
  type_:data_catalog_type ->
  name:catalog_name_string ->
  unit ->
  create_data_catalog_input

val make_create_capacity_reservation_output : unit -> unit

val make_create_capacity_reservation_input :
  ?tags:tag_list ->
  name:capacity_reservation_name ->
  target_dpus:target_dpus_integer ->
  unit ->
  create_capacity_reservation_input

val make_cancel_capacity_reservation_output : unit -> unit

val make_cancel_capacity_reservation_input :
  name:capacity_reservation_name -> unit -> cancel_capacity_reservation_input

val make_batch_get_query_execution_output :
  ?unprocessed_query_execution_ids:unprocessed_query_execution_id_list ->
  ?query_executions:query_execution_list ->
  unit ->
  batch_get_query_execution_output

val make_batch_get_query_execution_input :
  query_execution_ids:query_execution_id_list -> unit -> batch_get_query_execution_input

val make_batch_get_prepared_statement_output :
  ?unprocessed_prepared_statement_names:unprocessed_prepared_statement_name_list ->
  ?prepared_statements:prepared_statement_details_list ->
  unit ->
  batch_get_prepared_statement_output

val make_batch_get_prepared_statement_input :
  work_group:work_group_name ->
  prepared_statement_names:prepared_statement_name_list ->
  unit ->
  batch_get_prepared_statement_input

val make_batch_get_named_query_output :
  ?unprocessed_named_query_ids:unprocessed_named_query_id_list ->
  ?named_queries:named_query_list ->
  unit ->
  batch_get_named_query_output

val make_batch_get_named_query_input :
  named_query_ids:named_query_id_list -> unit -> batch_get_named_query_input
