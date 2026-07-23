open Types

val make_acl_configuration : s3_acl_option:s3_acl_option -> unit -> acl_configuration
val make_update_work_group_output : unit -> unit
val make_classification : ?name:name_string -> ?properties:parameters_map -> unit -> classification

val make_engine_configuration :
  ?coordinator_dpu_size:coordinator_dpu_size ->
  ?max_concurrent_dpus:max_concurrent_dpus ->
  ?default_executor_dpu_size:default_executor_dpu_size ->
  ?additional_configs:parameters_map ->
  ?spark_properties:parameters_map ->
  ?classifications:classification_list ->
  unit ->
  engine_configuration

val make_s3_logging_configuration :
  ?kms_key:kms_key ->
  ?log_location:s3_output_location ->
  enabled:boxed_boolean ->
  unit ->
  s3_logging_configuration

val make_managed_logging_configuration :
  ?kms_key:kms_key -> enabled:boxed_boolean -> unit -> managed_logging_configuration

val make_cloud_watch_logging_configuration :
  ?log_group:log_group_name ->
  ?log_stream_name_prefix:log_stream_name_prefix ->
  ?log_types:log_types_map ->
  enabled:boxed_boolean ->
  unit ->
  cloud_watch_logging_configuration

val make_monitoring_configuration :
  ?cloud_watch_logging_configuration:cloud_watch_logging_configuration ->
  ?managed_logging_configuration:managed_logging_configuration ->
  ?s3_logging_configuration:s3_logging_configuration ->
  unit ->
  monitoring_configuration

val make_query_results_s3_access_grants_configuration :
  ?create_user_level_prefix:boxed_boolean ->
  enable_s3_access_grants:boxed_boolean ->
  authentication_type:authentication_type ->
  unit ->
  query_results_s3_access_grants_configuration

val make_customer_content_encryption_configuration :
  kms_key:kms_key -> unit -> customer_content_encryption_configuration

val make_engine_version :
  ?selected_engine_version:name_string ->
  ?effective_engine_version:name_string ->
  unit ->
  engine_version

val make_managed_query_results_encryption_configuration :
  kms_key:kms_key -> unit -> managed_query_results_encryption_configuration

val make_managed_query_results_configuration_updates :
  ?enabled:boxed_boolean ->
  ?encryption_configuration:managed_query_results_encryption_configuration ->
  ?remove_encryption_configuration:boxed_boolean ->
  unit ->
  managed_query_results_configuration_updates

val make_encryption_configuration :
  ?kms_key:string_ -> encryption_option:encryption_option -> unit -> encryption_configuration

val make_result_configuration_updates :
  ?output_location:result_output_location ->
  ?remove_output_location:boxed_boolean ->
  ?encryption_configuration:encryption_configuration ->
  ?remove_encryption_configuration:boxed_boolean ->
  ?expected_bucket_owner:aws_account_id ->
  ?remove_expected_bucket_owner:boxed_boolean ->
  ?acl_configuration:acl_configuration ->
  ?remove_acl_configuration:boxed_boolean ->
  unit ->
  result_configuration_updates

val make_work_group_configuration_updates :
  ?enforce_work_group_configuration:boxed_boolean ->
  ?result_configuration_updates:result_configuration_updates ->
  ?managed_query_results_configuration_updates:managed_query_results_configuration_updates ->
  ?publish_cloud_watch_metrics_enabled:boxed_boolean ->
  ?bytes_scanned_cutoff_per_query:bytes_scanned_cutoff_value ->
  ?remove_bytes_scanned_cutoff_per_query:boxed_boolean ->
  ?requester_pays_enabled:boxed_boolean ->
  ?engine_version:engine_version ->
  ?remove_customer_content_encryption_configuration:boxed_boolean ->
  ?additional_configuration:name_string ->
  ?execution_role:role_arn ->
  ?customer_content_encryption_configuration:customer_content_encryption_configuration ->
  ?enable_minimum_encryption_configuration:boxed_boolean ->
  ?query_results_s3_access_grants_configuration:query_results_s3_access_grants_configuration ->
  ?monitoring_configuration:monitoring_configuration ->
  ?engine_configuration:engine_configuration ->
  unit ->
  work_group_configuration_updates

val make_update_work_group_input :
  ?description:work_group_description_string ->
  ?configuration_updates:work_group_configuration_updates ->
  ?state:work_group_state ->
  work_group:work_group_name ->
  unit ->
  update_work_group_input

val make_update_prepared_statement_output : unit -> unit

val make_update_prepared_statement_input :
  ?description:description_string ->
  statement_name:statement_name ->
  work_group:work_group_name ->
  query_statement:query_string ->
  unit ->
  update_prepared_statement_input

val make_update_notebook_metadata_output : unit -> unit

val make_update_notebook_metadata_input :
  ?client_request_token:client_request_token ->
  notebook_id:notebook_id ->
  name:notebook_name ->
  unit ->
  update_notebook_metadata_input

val make_update_notebook_output : unit -> unit

val make_update_notebook_input :
  ?session_id:session_id ->
  ?client_request_token:client_request_token ->
  notebook_id:notebook_id ->
  payload:payload ->
  type_:notebook_type ->
  unit ->
  update_notebook_input

val make_update_named_query_output : unit -> unit

val make_update_named_query_input :
  ?description:named_query_description_string ->
  named_query_id:named_query_id ->
  name:name_string ->
  query_string:query_string ->
  unit ->
  update_named_query_input

val make_update_data_catalog_output : unit -> unit

val make_update_data_catalog_input :
  ?description:description_string ->
  ?parameters:parameters_map ->
  name:catalog_name_string ->
  type_:data_catalog_type ->
  unit ->
  update_data_catalog_input

val make_update_capacity_reservation_output : unit -> unit

val make_update_capacity_reservation_input :
  target_dpus:target_dpus_integer ->
  name:capacity_reservation_name ->
  unit ->
  update_capacity_reservation_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_terminate_session_response : ?state:session_state -> unit -> terminate_session_response
val make_terminate_session_request : session_id:session_id -> unit -> terminate_session_request
val make_tag_resource_output : unit -> unit
val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_tag_resource_input :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_input

val make_stop_query_execution_output : unit -> unit

val make_stop_query_execution_input :
  query_execution_id:query_execution_id -> unit -> stop_query_execution_input

val make_stop_calculation_execution_response :
  ?state:calculation_execution_state -> unit -> stop_calculation_execution_response

val make_stop_calculation_execution_request :
  calculation_execution_id:calculation_execution_id -> unit -> stop_calculation_execution_request

val make_start_session_response :
  ?session_id:session_id -> ?state:session_state -> unit -> start_session_response

val make_start_session_request :
  ?description:description_string ->
  ?execution_role:role_arn ->
  ?monitoring_configuration:monitoring_configuration ->
  ?notebook_version:name_string ->
  ?session_idle_timeout_in_minutes:session_idle_timeout_in_minutes ->
  ?client_request_token:idempotency_token ->
  ?tags:tag_list ->
  ?copy_work_group_tags:boxed_boolean ->
  work_group:work_group_name ->
  engine_configuration:engine_configuration ->
  unit ->
  start_session_request

val make_start_query_execution_output :
  ?query_execution_id:query_execution_id -> unit -> start_query_execution_output

val make_result_reuse_by_age_configuration :
  ?max_age_in_minutes:age -> enabled:boolean_ -> unit -> result_reuse_by_age_configuration

val make_result_reuse_configuration :
  ?result_reuse_by_age_configuration:result_reuse_by_age_configuration ->
  unit ->
  result_reuse_configuration

val make_result_configuration :
  ?output_location:result_output_location ->
  ?encryption_configuration:encryption_configuration ->
  ?expected_bucket_owner:aws_account_id ->
  ?acl_configuration:acl_configuration ->
  unit ->
  result_configuration

val make_query_execution_context :
  ?database:database_string -> ?catalog:catalog_name_string -> unit -> query_execution_context

val make_start_query_execution_input :
  ?client_request_token:idempotency_token ->
  ?query_execution_context:query_execution_context ->
  ?result_configuration:result_configuration ->
  ?work_group:work_group_name ->
  ?execution_parameters:execution_parameters ->
  ?result_reuse_configuration:result_reuse_configuration ->
  ?engine_configuration:engine_configuration ->
  query_string:query_string ->
  unit ->
  start_query_execution_input

val make_start_calculation_execution_response :
  ?calculation_execution_id:calculation_execution_id ->
  ?state:calculation_execution_state ->
  unit ->
  start_calculation_execution_response

val make_calculation_configuration : ?code_block:code_block -> unit -> calculation_configuration

val make_start_calculation_execution_request :
  ?description:description_string ->
  ?calculation_configuration:calculation_configuration ->
  ?code_block:code_block ->
  ?client_request_token:idempotency_token ->
  session_id:session_id ->
  unit ->
  start_calculation_execution_request

val make_put_capacity_assignment_configuration_output : unit -> unit

val make_capacity_assignment :
  ?work_group_names:work_group_names_list -> unit -> capacity_assignment

val make_put_capacity_assignment_configuration_input :
  capacity_reservation_name:capacity_reservation_name ->
  capacity_assignments:capacity_assignments_list ->
  unit ->
  put_capacity_assignment_configuration_input

val make_work_group_summary :
  ?name:work_group_name ->
  ?state:work_group_state ->
  ?description:work_group_description_string ->
  ?creation_time:date ->
  ?engine_version:engine_version ->
  ?identity_center_application_arn:identity_center_application_arn ->
  unit ->
  work_group_summary

val make_list_work_groups_output :
  ?work_groups:work_groups_list -> ?next_token:token -> unit -> list_work_groups_output

val make_list_work_groups_input :
  ?next_token:token -> ?max_results:max_work_groups_count -> unit -> list_work_groups_input

val make_list_tags_for_resource_output :
  ?tags:tag_list -> ?next_token:token -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:token ->
  ?max_results:max_tags_count ->
  resource_ar_n:amazon_resource_name ->
  unit ->
  list_tags_for_resource_input

val make_column :
  ?type_:type_string -> ?comment:comment_string -> name:name_string -> unit -> column

val make_table_metadata :
  ?create_time:timestamp ->
  ?last_access_time:timestamp ->
  ?table_type:table_type_string ->
  ?columns:column_list ->
  ?partition_keys:column_list ->
  ?parameters:parameters_map ->
  name:name_string ->
  unit ->
  table_metadata

val make_list_table_metadata_output :
  ?table_metadata_list:table_metadata_list ->
  ?next_token:token ->
  unit ->
  list_table_metadata_output

val make_list_table_metadata_input :
  ?expression:expression_string ->
  ?next_token:token ->
  ?max_results:max_table_metadata_count ->
  ?work_group:work_group_name ->
  catalog_name:catalog_name_string ->
  database_name:name_string ->
  unit ->
  list_table_metadata_input

val make_session_status :
  ?start_date_time:date ->
  ?last_modified_date_time:date ->
  ?end_date_time:date ->
  ?idle_since_date_time:date ->
  ?state:session_state ->
  ?state_change_reason:description_string ->
  unit ->
  session_status

val make_session_summary :
  ?session_id:session_id ->
  ?description:description_string ->
  ?engine_version:engine_version ->
  ?notebook_version:name_string ->
  ?status:session_status ->
  unit ->
  session_summary

val make_list_sessions_response :
  ?next_token:session_manager_token -> ?sessions:sessions_list -> unit -> list_sessions_response

val make_list_sessions_request :
  ?state_filter:session_state ->
  ?max_results:max_sessions_count ->
  ?next_token:session_manager_token ->
  work_group:work_group_name ->
  unit ->
  list_sessions_request

val make_list_query_executions_output :
  ?query_execution_ids:query_execution_id_list ->
  ?next_token:token ->
  unit ->
  list_query_executions_output

val make_list_query_executions_input :
  ?next_token:token ->
  ?max_results:max_query_executions_count ->
  ?work_group:work_group_name ->
  unit ->
  list_query_executions_input

val make_prepared_statement_summary :
  ?statement_name:statement_name -> ?last_modified_time:date -> unit -> prepared_statement_summary

val make_list_prepared_statements_output :
  ?prepared_statements:prepared_statements_list ->
  ?next_token:token ->
  unit ->
  list_prepared_statements_output

val make_list_prepared_statements_input :
  ?next_token:token ->
  ?max_results:max_prepared_statements_count ->
  work_group:work_group_name ->
  unit ->
  list_prepared_statements_input

val make_notebook_session_summary :
  ?session_id:session_id -> ?creation_time:date -> unit -> notebook_session_summary

val make_list_notebook_sessions_response :
  ?next_token:token ->
  notebook_sessions_list:notebook_sessions_list ->
  unit ->
  list_notebook_sessions_response

val make_list_notebook_sessions_request :
  ?max_results:max_sessions_count ->
  ?next_token:token ->
  notebook_id:notebook_id ->
  unit ->
  list_notebook_sessions_request

val make_notebook_metadata :
  ?notebook_id:notebook_id ->
  ?name:notebook_name ->
  ?work_group:work_group_name ->
  ?creation_time:date ->
  ?type_:notebook_type ->
  ?last_modified_time:date ->
  unit ->
  notebook_metadata

val make_list_notebook_metadata_output :
  ?next_token:token ->
  ?notebook_metadata_list:notebook_metadata_array ->
  unit ->
  list_notebook_metadata_output

val make_filter_definition : ?name:notebook_name -> unit -> filter_definition

val make_list_notebook_metadata_input :
  ?filters:filter_definition ->
  ?next_token:token ->
  ?max_results:max_notebooks_count ->
  work_group:work_group_name ->
  unit ->
  list_notebook_metadata_input

val make_list_named_queries_output :
  ?named_query_ids:named_query_id_list -> ?next_token:token -> unit -> list_named_queries_output

val make_list_named_queries_input :
  ?next_token:token ->
  ?max_results:max_named_queries_count ->
  ?work_group:work_group_name ->
  unit ->
  list_named_queries_input

val make_executors_summary :
  ?executor_type:executor_type ->
  ?start_date_time:long ->
  ?termination_date_time:long ->
  ?executor_state:executor_state ->
  ?executor_size:long ->
  executor_id:executor_id ->
  unit ->
  executors_summary

val make_list_executors_response :
  ?next_token:session_manager_token ->
  ?executors_summary:executors_summary_list ->
  session_id:session_id ->
  unit ->
  list_executors_response

val make_list_executors_request :
  ?executor_state_filter:executor_state ->
  ?max_results:max_list_executors_count ->
  ?next_token:session_manager_token ->
  session_id:session_id ->
  unit ->
  list_executors_request

val make_list_engine_versions_output :
  ?engine_versions:engine_versions_list -> ?next_token:token -> unit -> list_engine_versions_output

val make_list_engine_versions_input :
  ?next_token:token -> ?max_results:max_engine_versions_count -> unit -> list_engine_versions_input

val make_data_catalog_summary :
  ?catalog_name:catalog_name_string ->
  ?type_:data_catalog_type ->
  ?status:data_catalog_status ->
  ?connection_type:connection_type ->
  ?error:error_message ->
  unit ->
  data_catalog_summary

val make_list_data_catalogs_output :
  ?data_catalogs_summary:data_catalog_summary_list ->
  ?next_token:token ->
  unit ->
  list_data_catalogs_output

val make_list_data_catalogs_input :
  ?next_token:token ->
  ?max_results:max_data_catalogs_count ->
  ?work_group:work_group_name ->
  unit ->
  list_data_catalogs_input

val make_database :
  ?description:description_string ->
  ?parameters:parameters_map ->
  name:name_string ->
  unit ->
  database

val make_list_databases_output :
  ?database_list:database_list -> ?next_token:token -> unit -> list_databases_output

val make_list_databases_input :
  ?next_token:token ->
  ?max_results:max_databases_count ->
  ?work_group:work_group_name ->
  catalog_name:catalog_name_string ->
  unit ->
  list_databases_input

val make_capacity_allocation :
  ?status_message:string_ ->
  ?request_completion_time:timestamp ->
  status:capacity_allocation_status ->
  request_time:timestamp ->
  unit ->
  capacity_allocation

val make_capacity_reservation :
  ?last_allocation:capacity_allocation ->
  ?last_successful_allocation_time:timestamp ->
  name:capacity_reservation_name ->
  status:capacity_reservation_status ->
  target_dpus:target_dpus_integer ->
  allocated_dpus:allocated_dpus_integer ->
  creation_time:timestamp ->
  unit ->
  capacity_reservation

val make_list_capacity_reservations_output :
  ?next_token:token ->
  capacity_reservations:capacity_reservations_list ->
  unit ->
  list_capacity_reservations_output

val make_list_capacity_reservations_input :
  ?next_token:token ->
  ?max_results:max_capacity_reservations_count ->
  unit ->
  list_capacity_reservations_input

val make_calculation_status :
  ?submission_date_time:date ->
  ?completion_date_time:date ->
  ?state:calculation_execution_state ->
  ?state_change_reason:description_string ->
  unit ->
  calculation_status

val make_calculation_summary :
  ?calculation_execution_id:calculation_execution_id ->
  ?description:description_string ->
  ?status:calculation_status ->
  unit ->
  calculation_summary

val make_list_calculation_executions_response :
  ?next_token:session_manager_token ->
  ?calculations:calculations_list ->
  unit ->
  list_calculation_executions_response

val make_list_calculation_executions_request :
  ?state_filter:calculation_execution_state ->
  ?max_results:max_calculations_count ->
  ?next_token:session_manager_token ->
  session_id:session_id ->
  unit ->
  list_calculation_executions_request

val make_application_dpu_sizes :
  ?application_runtime_id:name_string ->
  ?supported_dpu_sizes:supported_dpu_size_list ->
  unit ->
  application_dpu_sizes

val make_list_application_dpu_sizes_output :
  ?application_dpu_sizes:application_dpu_sizes_list ->
  ?next_token:token ->
  unit ->
  list_application_dpu_sizes_output

val make_list_application_dpu_sizes_input :
  ?max_results:max_application_dpu_sizes_count ->
  ?next_token:token ->
  unit ->
  list_application_dpu_sizes_input

val make_import_notebook_output : ?notebook_id:notebook_id -> unit -> import_notebook_output

val make_import_notebook_input :
  ?payload:payload ->
  ?notebook_s3_location_uri:s3_uri ->
  ?client_request_token:client_request_token ->
  work_group:work_group_name ->
  name:notebook_name ->
  type_:notebook_type ->
  unit ->
  import_notebook_input

val make_identity_center_configuration :
  ?enable_identity_center:boxed_boolean ->
  ?identity_center_instance_arn:identity_center_instance_arn ->
  unit ->
  identity_center_configuration

val make_managed_query_results_configuration :
  ?encryption_configuration:managed_query_results_encryption_configuration ->
  enabled:boolean_ ->
  unit ->
  managed_query_results_configuration

val make_work_group_configuration :
  ?result_configuration:result_configuration ->
  ?managed_query_results_configuration:managed_query_results_configuration ->
  ?enforce_work_group_configuration:boxed_boolean ->
  ?publish_cloud_watch_metrics_enabled:boxed_boolean ->
  ?bytes_scanned_cutoff_per_query:bytes_scanned_cutoff_value ->
  ?requester_pays_enabled:boxed_boolean ->
  ?engine_version:engine_version ->
  ?additional_configuration:name_string ->
  ?execution_role:role_arn ->
  ?monitoring_configuration:monitoring_configuration ->
  ?engine_configuration:engine_configuration ->
  ?customer_content_encryption_configuration:customer_content_encryption_configuration ->
  ?enable_minimum_encryption_configuration:boxed_boolean ->
  ?identity_center_configuration:identity_center_configuration ->
  ?query_results_s3_access_grants_configuration:query_results_s3_access_grants_configuration ->
  unit ->
  work_group_configuration

val make_work_group :
  ?state:work_group_state ->
  ?configuration:work_group_configuration ->
  ?description:work_group_description_string ->
  ?creation_time:date ->
  ?identity_center_application_arn:identity_center_application_arn ->
  name:work_group_name ->
  unit ->
  work_group

val make_get_work_group_output : ?work_group:work_group -> unit -> get_work_group_output
val make_get_work_group_input : work_group:work_group_name -> unit -> get_work_group_input

val make_get_table_metadata_output :
  ?table_metadata:table_metadata -> unit -> get_table_metadata_output

val make_get_table_metadata_input :
  ?work_group:work_group_name ->
  catalog_name:catalog_name_string ->
  database_name:name_string ->
  table_name:name_string ->
  unit ->
  get_table_metadata_input

val make_get_session_status_response :
  ?session_id:session_id -> ?status:session_status -> unit -> get_session_status_response

val make_get_session_status_request : session_id:session_id -> unit -> get_session_status_request

val make_get_session_endpoint_response :
  endpoint_url:string_ ->
  auth_token:string_ ->
  auth_token_expiration_time:timestamp ->
  unit ->
  get_session_endpoint_response

val make_get_session_endpoint_request :
  session_id:session_id -> unit -> get_session_endpoint_request

val make_session_statistics : ?dpu_execution_in_millis:long -> unit -> session_statistics

val make_session_configuration :
  ?execution_role:role_arn ->
  ?working_directory:result_output_location ->
  ?idle_timeout_seconds:long ->
  ?session_idle_timeout_in_minutes:session_idle_timeout_in_minutes ->
  ?encryption_configuration:encryption_configuration ->
  unit ->
  session_configuration

val make_get_session_response :
  ?session_id:session_id ->
  ?description:description_string ->
  ?work_group:work_group_name ->
  ?engine_version:name_string ->
  ?engine_configuration:engine_configuration ->
  ?notebook_version:name_string ->
  ?monitoring_configuration:monitoring_configuration ->
  ?session_configuration:session_configuration ->
  ?status:session_status ->
  ?statistics:session_statistics ->
  unit ->
  get_session_response

val make_get_session_request : session_id:session_id -> unit -> get_session_request
val make_get_resource_dashboard_response : url:string_ -> unit -> get_resource_dashboard_response

val make_get_resource_dashboard_request :
  resource_ar_n:amazon_resource_name -> unit -> get_resource_dashboard_request

val make_query_stage_plan_node :
  ?name:string_ ->
  ?identifier:string_ ->
  ?children:query_stage_plan_nodes ->
  ?remote_sources:string_list ->
  unit ->
  query_stage_plan_node

val make_query_stage :
  ?stage_id:long ->
  ?state:string_ ->
  ?output_bytes:long ->
  ?output_rows:long ->
  ?input_bytes:long ->
  ?input_rows:long ->
  ?execution_time:long ->
  ?query_stage_plan:query_stage_plan_node ->
  ?sub_stages:query_stages ->
  unit ->
  query_stage

val make_query_runtime_statistics_rows :
  ?input_rows:long ->
  ?input_bytes:long ->
  ?output_bytes:long ->
  ?output_rows:long ->
  unit ->
  query_runtime_statistics_rows

val make_query_runtime_statistics_timeline :
  ?query_queue_time_in_millis:long ->
  ?service_pre_processing_time_in_millis:long ->
  ?query_planning_time_in_millis:long ->
  ?engine_execution_time_in_millis:long ->
  ?service_processing_time_in_millis:long ->
  ?total_execution_time_in_millis:long ->
  unit ->
  query_runtime_statistics_timeline

val make_query_runtime_statistics :
  ?timeline:query_runtime_statistics_timeline ->
  ?rows:query_runtime_statistics_rows ->
  ?output_stage:query_stage ->
  unit ->
  query_runtime_statistics

val make_get_query_runtime_statistics_output :
  ?query_runtime_statistics:query_runtime_statistics -> unit -> get_query_runtime_statistics_output

val make_get_query_runtime_statistics_input :
  query_execution_id:query_execution_id -> unit -> get_query_runtime_statistics_input

val make_column_info :
  ?catalog_name:string_ ->
  ?schema_name:string_ ->
  ?table_name:string_ ->
  ?label:string_ ->
  ?precision:integer ->
  ?scale:integer ->
  ?nullable:column_nullable ->
  ?case_sensitive:boolean_ ->
  name:string_ ->
  type_:string_ ->
  unit ->
  column_info

val make_result_set_metadata : ?column_info:column_info_list -> unit -> result_set_metadata
val make_datum : ?var_char_value:datum_string -> unit -> datum
val make_row : ?data:datum_list -> unit -> row

val make_result_set :
  ?rows:row_list -> ?result_set_metadata:result_set_metadata -> unit -> result_set

val make_get_query_results_output :
  ?update_count:long ->
  ?result_set:result_set ->
  ?next_token:token ->
  unit ->
  get_query_results_output

val make_get_query_results_input :
  ?next_token:token ->
  ?max_results:max_query_results ->
  ?query_result_type:query_result_type ->
  query_execution_id:query_execution_id ->
  unit ->
  get_query_results_input

val make_result_reuse_information :
  reused_previous_result:boolean_ -> unit -> result_reuse_information

val make_query_execution_statistics :
  ?engine_execution_time_in_millis:long ->
  ?data_scanned_in_bytes:long ->
  ?data_manifest_location:string_ ->
  ?total_execution_time_in_millis:long ->
  ?query_queue_time_in_millis:long ->
  ?service_pre_processing_time_in_millis:long ->
  ?query_planning_time_in_millis:long ->
  ?service_processing_time_in_millis:long ->
  ?result_reuse_information:result_reuse_information ->
  ?dpu_count:dpu_count ->
  unit ->
  query_execution_statistics

val make_athena_error :
  ?error_category:error_category ->
  ?error_type:error_type ->
  ?retryable:boolean_ ->
  ?error_message:string_ ->
  unit ->
  athena_error

val make_query_execution_status :
  ?state:query_execution_state ->
  ?state_change_reason:string_ ->
  ?submission_date_time:date ->
  ?completion_date_time:date ->
  ?athena_error:athena_error ->
  unit ->
  query_execution_status

val make_query_execution :
  ?query_execution_id:query_execution_id ->
  ?query:query_string ->
  ?statement_type:statement_type ->
  ?managed_query_results_configuration:managed_query_results_configuration ->
  ?result_configuration:result_configuration ->
  ?result_reuse_configuration:result_reuse_configuration ->
  ?query_execution_context:query_execution_context ->
  ?status:query_execution_status ->
  ?statistics:query_execution_statistics ->
  ?work_group:work_group_name ->
  ?engine_version:engine_version ->
  ?execution_parameters:execution_parameters ->
  ?substatement_type:string_ ->
  ?query_results_s3_access_grants_configuration:query_results_s3_access_grants_configuration ->
  unit ->
  query_execution

val make_get_query_execution_output :
  ?query_execution:query_execution -> unit -> get_query_execution_output

val make_get_query_execution_input :
  query_execution_id:query_execution_id -> unit -> get_query_execution_input

val make_prepared_statement :
  ?statement_name:statement_name ->
  ?query_statement:query_string ->
  ?work_group_name:work_group_name ->
  ?description:description_string ->
  ?last_modified_time:date ->
  unit ->
  prepared_statement

val make_get_prepared_statement_output :
  ?prepared_statement:prepared_statement -> unit -> get_prepared_statement_output

val make_get_prepared_statement_input :
  statement_name:statement_name ->
  work_group:work_group_name ->
  unit ->
  get_prepared_statement_input

val make_get_notebook_metadata_output :
  ?notebook_metadata:notebook_metadata -> unit -> get_notebook_metadata_output

val make_get_notebook_metadata_input :
  notebook_id:notebook_id -> unit -> get_notebook_metadata_input

val make_named_query :
  ?description:description_string ->
  ?named_query_id:named_query_id ->
  ?work_group:work_group_name ->
  name:name_string ->
  database:database_string ->
  query_string:query_string ->
  unit ->
  named_query

val make_get_named_query_output : ?named_query:named_query -> unit -> get_named_query_output
val make_get_named_query_input : named_query_id:named_query_id -> unit -> get_named_query_input

val make_data_catalog :
  ?description:description_string ->
  ?parameters:parameters_map ->
  ?status:data_catalog_status ->
  ?connection_type:connection_type ->
  ?error:error_message ->
  name:catalog_name_string ->
  type_:data_catalog_type ->
  unit ->
  data_catalog

val make_get_data_catalog_output : ?data_catalog:data_catalog -> unit -> get_data_catalog_output

val make_get_data_catalog_input :
  ?work_group:work_group_name -> name:catalog_name_string -> unit -> get_data_catalog_input

val make_get_database_output : ?database:database -> unit -> get_database_output

val make_get_database_input :
  ?work_group:work_group_name ->
  catalog_name:catalog_name_string ->
  database_name:name_string ->
  unit ->
  get_database_input

val make_get_capacity_reservation_output :
  capacity_reservation:capacity_reservation -> unit -> get_capacity_reservation_output

val make_get_capacity_reservation_input :
  name:capacity_reservation_name -> unit -> get_capacity_reservation_input

val make_capacity_assignment_configuration :
  ?capacity_reservation_name:capacity_reservation_name ->
  ?capacity_assignments:capacity_assignments_list ->
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
  ?dpu_execution_in_millis:long -> ?progress:description_string -> unit -> calculation_statistics

val make_get_calculation_execution_status_response :
  ?status:calculation_status ->
  ?statistics:calculation_statistics ->
  unit ->
  get_calculation_execution_status_response

val make_get_calculation_execution_status_request :
  calculation_execution_id:calculation_execution_id ->
  unit ->
  get_calculation_execution_status_request

val make_get_calculation_execution_code_response :
  ?code_block:code_block -> unit -> get_calculation_execution_code_response

val make_get_calculation_execution_code_request :
  calculation_execution_id:calculation_execution_id ->
  unit ->
  get_calculation_execution_code_request

val make_get_calculation_execution_response :
  ?calculation_execution_id:calculation_execution_id ->
  ?session_id:session_id ->
  ?description:description_string ->
  ?working_directory:s3_uri ->
  ?status:calculation_status ->
  ?statistics:calculation_statistics ->
  ?result_:calculation_result ->
  unit ->
  get_calculation_execution_response

val make_get_calculation_execution_request :
  calculation_execution_id:calculation_execution_id -> unit -> get_calculation_execution_request

val make_export_notebook_output :
  ?notebook_metadata:notebook_metadata -> ?payload:payload -> unit -> export_notebook_output

val make_export_notebook_input : notebook_id:notebook_id -> unit -> export_notebook_input
val make_delete_work_group_output : unit -> unit

val make_delete_work_group_input :
  ?recursive_delete_option:boxed_boolean ->
  work_group:work_group_name ->
  unit ->
  delete_work_group_input

val make_delete_prepared_statement_output : unit -> unit

val make_delete_prepared_statement_input :
  statement_name:statement_name ->
  work_group:work_group_name ->
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
  ?configuration:work_group_configuration ->
  ?description:work_group_description_string ->
  ?tags:tag_list ->
  name:work_group_name ->
  unit ->
  create_work_group_input

val make_create_presigned_notebook_url_response :
  notebook_url:string_ ->
  auth_token:auth_token ->
  auth_token_expiration_time:long ->
  unit ->
  create_presigned_notebook_url_response

val make_create_presigned_notebook_url_request :
  session_id:session_id -> unit -> create_presigned_notebook_url_request

val make_create_prepared_statement_output : unit -> unit

val make_create_prepared_statement_input :
  ?description:description_string ->
  statement_name:statement_name ->
  work_group:work_group_name ->
  query_statement:query_string ->
  unit ->
  create_prepared_statement_input

val make_create_notebook_output : ?notebook_id:notebook_id -> unit -> create_notebook_output

val make_create_notebook_input :
  ?client_request_token:client_request_token ->
  work_group:work_group_name ->
  name:notebook_name ->
  unit ->
  create_notebook_input

val make_create_named_query_output :
  ?named_query_id:named_query_id -> unit -> create_named_query_output

val make_create_named_query_input :
  ?description:description_string ->
  ?client_request_token:idempotency_token ->
  ?work_group:work_group_name ->
  name:name_string ->
  database:database_string ->
  query_string:query_string ->
  unit ->
  create_named_query_input

val make_create_data_catalog_output :
  ?data_catalog:data_catalog -> unit -> create_data_catalog_output

val make_create_data_catalog_input :
  ?description:description_string ->
  ?parameters:parameters_map ->
  ?tags:tag_list ->
  name:catalog_name_string ->
  type_:data_catalog_type ->
  unit ->
  create_data_catalog_input

val make_create_capacity_reservation_output : unit -> unit

val make_create_capacity_reservation_input :
  ?tags:tag_list ->
  target_dpus:target_dpus_integer ->
  name:capacity_reservation_name ->
  unit ->
  create_capacity_reservation_input

val make_cancel_capacity_reservation_output : unit -> unit

val make_cancel_capacity_reservation_input :
  name:capacity_reservation_name -> unit -> cancel_capacity_reservation_input

val make_unprocessed_query_execution_id :
  ?query_execution_id:query_execution_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  unprocessed_query_execution_id

val make_batch_get_query_execution_output :
  ?query_executions:query_execution_list ->
  ?unprocessed_query_execution_ids:unprocessed_query_execution_id_list ->
  unit ->
  batch_get_query_execution_output

val make_batch_get_query_execution_input :
  query_execution_ids:query_execution_id_list -> unit -> batch_get_query_execution_input

val make_unprocessed_prepared_statement_name :
  ?statement_name:statement_name ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  unprocessed_prepared_statement_name

val make_batch_get_prepared_statement_output :
  ?prepared_statements:prepared_statement_details_list ->
  ?unprocessed_prepared_statement_names:unprocessed_prepared_statement_name_list ->
  unit ->
  batch_get_prepared_statement_output

val make_batch_get_prepared_statement_input :
  prepared_statement_names:prepared_statement_name_list ->
  work_group:work_group_name ->
  unit ->
  batch_get_prepared_statement_input

val make_unprocessed_named_query_id :
  ?named_query_id:named_query_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  unprocessed_named_query_id

val make_batch_get_named_query_output :
  ?named_queries:named_query_list ->
  ?unprocessed_named_query_ids:unprocessed_named_query_id_list ->
  unit ->
  batch_get_named_query_output

val make_batch_get_named_query_input :
  named_query_ids:named_query_id_list -> unit -> batch_get_named_query_input
