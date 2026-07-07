(** Glue client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_xml_classifier :
  ?row_tag:row_tag ->
  ?version:version_id ->
  ?last_updated:timestamp ->
  ?creation_time:timestamp ->
  classification:classification ->
  name:name_string ->
  unit ->
  xml_classifier

val make_workflow_run_statistics :
  ?waiting_actions:integer_value ->
  ?errored_actions:integer_value ->
  ?running_actions:integer_value ->
  ?succeeded_actions:integer_value ->
  ?stopped_actions:integer_value ->
  ?failed_actions:integer_value ->
  ?timeout_actions:integer_value ->
  ?total_actions:integer_value ->
  unit ->
  workflow_run_statistics

val make_notification_property :
  ?notify_delay_after:notify_delay_after -> unit -> notification_property

val make_action :
  ?crawler_name:name_string ->
  ?notification_property:notification_property ->
  ?security_configuration:name_string ->
  ?timeout:timeout ->
  ?arguments:generic_map ->
  ?job_name:name_string ->
  unit ->
  action

val make_condition :
  ?crawl_state:crawl_state ->
  ?crawler_name:name_string ->
  ?state:job_run_state ->
  ?job_name:name_string ->
  ?logical_operator:logical_operator ->
  unit ->
  condition

val make_predicate : ?conditions:condition_list -> ?logical:logical -> unit -> predicate

val make_event_batching_condition :
  ?batch_window:batch_window -> batch_size:batch_size -> unit -> event_batching_condition

val make_trigger :
  ?event_batching_condition:event_batching_condition ->
  ?predicate:predicate ->
  ?actions:action_list ->
  ?schedule:generic_string ->
  ?description:description_string ->
  ?state:trigger_state ->
  ?type_:trigger_type ->
  ?id:id_string ->
  ?workflow_name:name_string ->
  ?name:name_string ->
  unit ->
  trigger

val make_trigger_node_details : ?trigger:trigger -> unit -> trigger_node_details
val make_predecessor : ?run_id:id_string -> ?job_name:name_string -> unit -> predecessor

val make_job_run :
  ?execution_role_session_policy:orchestration_policy_json_string ->
  ?state_detail:orchestration_message_string ->
  ?profile_name:name_string ->
  ?maintenance_window:maintenance_window ->
  ?execution_class:execution_class ->
  ?dpu_seconds:nullable_double ->
  ?glue_version:glue_version_string ->
  ?notification_property:notification_property ->
  ?log_group_name:generic_string ->
  ?security_configuration:name_string ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?max_capacity:nullable_double ->
  ?timeout:timeout ->
  ?execution_time:execution_time ->
  ?allocated_capacity:integer_value ->
  ?predecessor_runs:predecessor_list ->
  ?error_message:error_string ->
  ?arguments:generic_map ->
  ?job_run_state:job_run_state ->
  ?completed_on:timestamp_value ->
  ?last_modified_on:timestamp_value ->
  ?started_on:timestamp_value ->
  ?job_run_queuing_enabled:nullable_boolean ->
  ?job_mode:job_mode ->
  ?job_name:name_string ->
  ?trigger_name:name_string ->
  ?previous_run_id:id_string ->
  ?attempt:attempt_count ->
  ?id:id_string ->
  unit ->
  job_run

val make_job_node_details : ?job_runs:job_run_list -> unit -> job_node_details

val make_crawl :
  ?log_stream:log_stream ->
  ?log_group:log_group ->
  ?error_message:description_string ->
  ?completed_on:timestamp_value ->
  ?started_on:timestamp_value ->
  ?state:crawl_state ->
  unit ->
  crawl

val make_crawler_node_details : ?crawls:crawl_list -> unit -> crawler_node_details

val make_node :
  ?crawler_details:crawler_node_details ->
  ?job_details:job_node_details ->
  ?trigger_details:trigger_node_details ->
  ?unique_id:name_string ->
  ?name:name_string ->
  ?type_:node_type ->
  unit ->
  node

val make_edge : ?destination_id:name_string -> ?source_id:name_string -> unit -> edge
val make_workflow_graph : ?edges:edge_list -> ?nodes:node_list -> unit -> workflow_graph

val make_starting_event_batch_condition :
  ?batch_window:nullable_integer ->
  ?batch_size:nullable_integer ->
  unit ->
  starting_event_batch_condition

val make_workflow_run :
  ?starting_event_batch_condition:starting_event_batch_condition ->
  ?graph:workflow_graph ->
  ?statistics:workflow_run_statistics ->
  ?error_message:error_string ->
  ?status:workflow_run_status ->
  ?completed_on:timestamp_value ->
  ?started_on:timestamp_value ->
  ?workflow_run_properties:workflow_run_properties ->
  ?previous_run_id:id_string ->
  ?workflow_run_id:id_string ->
  ?name:name_string ->
  unit ->
  workflow_run

val make_blueprint_details :
  ?run_id:id_string -> ?blueprint_name:orchestration_name_string -> unit -> blueprint_details

val make_workflow :
  ?blueprint_details:blueprint_details ->
  ?max_concurrent_runs:nullable_integer ->
  ?graph:workflow_graph ->
  ?last_run:workflow_run ->
  ?last_modified_on:timestamp_value ->
  ?created_on:timestamp_value ->
  ?default_run_properties:workflow_run_properties ->
  ?description:generic_string ->
  ?name:name_string ->
  unit ->
  workflow

val make_error_detail :
  ?error_message:description_string -> ?error_code:name_string -> unit -> error_detail

val make_view_validation :
  ?error:error_detail ->
  ?state:resource_state ->
  ?update_time:timestamp ->
  ?view_validation_text:view_text_string ->
  ?dialect_version:view_dialect_version_string ->
  ?dialect:view_dialect ->
  unit ->
  view_validation

val make_view_representation :
  ?is_stale:nullable_boolean ->
  ?validation_connection:name_string ->
  ?view_expanded_text:view_text_string ->
  ?view_original_text:view_text_string ->
  ?dialect_version:view_dialect_version_string ->
  ?dialect:view_dialect ->
  unit ->
  view_representation

val make_view_representation_input :
  ?view_expanded_text:view_text_string ->
  ?validation_connection:name_string ->
  ?view_original_text:view_text_string ->
  ?dialect_version:view_dialect_version_string ->
  ?dialect:view_dialect ->
  unit ->
  view_representation_input

val make_view_definition_input :
  ?sub_object_version_ids:view_sub_object_version_ids_list ->
  ?sub_objects:view_sub_objects_list ->
  ?last_refresh_type:last_refresh_type ->
  ?refresh_seconds:refresh_seconds ->
  ?view_version_token:version_string ->
  ?view_version_id:table_version_id ->
  ?representations:view_representation_input_list ->
  ?definer:arn_string ->
  ?is_protected:nullable_boolean ->
  unit ->
  view_definition_input

val make_view_definition :
  ?representations:view_representation_list ->
  ?sub_object_version_ids:view_sub_object_version_ids_list ->
  ?sub_objects:view_sub_objects_list ->
  ?last_refresh_type:last_refresh_type ->
  ?refresh_seconds:refresh_seconds ->
  ?view_version_token:hash_string ->
  ?view_version_id:table_version_id ->
  ?definer:arn_string ->
  ?is_protected:nullable_boolean ->
  unit ->
  view_definition

val make_resource_uri : ?uri:ur_i -> ?resource_type:resource_type -> unit -> resource_uri

val make_user_defined_function :
  ?catalog_id:catalog_id_string ->
  ?resource_uris:resource_uri_list ->
  ?create_time:timestamp ->
  ?owner_type:principal_type ->
  ?function_type:function_type ->
  ?owner_name:name_string ->
  ?class_name:name_string ->
  ?database_name:name_string ->
  ?function_name:name_string ->
  unit ->
  user_defined_function

val make_user_defined_function_input :
  ?resource_uris:resource_uri_list ->
  ?owner_type:principal_type ->
  ?function_type:function_type ->
  ?owner_name:name_string ->
  ?class_name:name_string ->
  ?function_name:name_string ->
  unit ->
  user_defined_function_input

val make_usage_profile_definition :
  ?last_modified_on:timestamp_value ->
  ?created_on:timestamp_value ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  usage_profile_definition

val make_upsert_redshift_target_options :
  ?upsert_keys:enclosed_in_string_properties_min_one ->
  ?connection_name:enclosed_in_string_property ->
  ?table_location:enclosed_in_string_property ->
  unit ->
  upsert_redshift_target_options

val make_update_xml_classifier_request :
  ?row_tag:row_tag ->
  ?classification:classification ->
  name:name_string ->
  unit ->
  update_xml_classifier_request

val make_update_workflow_response : ?name:name_string -> unit -> update_workflow_response

val make_update_workflow_request :
  ?max_concurrent_runs:nullable_integer ->
  ?default_run_properties:workflow_run_properties ->
  ?description:workflow_description_string ->
  name:name_string ->
  unit ->
  update_workflow_request

val make_update_user_defined_function_response : unit -> unit

val make_update_user_defined_function_request :
  ?catalog_id:catalog_id_string ->
  function_input:user_defined_function_input ->
  function_name:name_string ->
  database_name:name_string ->
  unit ->
  update_user_defined_function_request

val make_update_usage_profile_response : ?name:name_string -> unit -> update_usage_profile_response

val make_configuration_object :
  ?max_value:config_value_string ->
  ?min_value:config_value_string ->
  ?allowed_values:allowed_values_string_list ->
  ?default_value:config_value_string ->
  unit ->
  configuration_object

val make_profile_configuration :
  ?job_configuration:configuration_map ->
  ?session_configuration:configuration_map ->
  unit ->
  profile_configuration

val make_update_usage_profile_request :
  ?description:description_string ->
  configuration:profile_configuration ->
  name:name_string ->
  unit ->
  update_usage_profile_request

val make_update_trigger_response : ?trigger:trigger -> unit -> update_trigger_response

val make_trigger_update :
  ?event_batching_condition:event_batching_condition ->
  ?predicate:predicate ->
  ?actions:action_list ->
  ?schedule:generic_string ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  trigger_update

val make_update_trigger_request :
  trigger_update:trigger_update -> name:name_string -> unit -> update_trigger_request

val make_update_table_response : unit -> unit

val make_column :
  ?parameters:parameters_map ->
  ?comment:comment_string ->
  ?type_:column_type_string ->
  name:name_string ->
  unit ->
  column

val make_ser_de_info :
  ?parameters:parameters_map ->
  ?serialization_library:name_string ->
  ?name:name_string ->
  unit ->
  ser_de_info

val make_order : sort_order:integer_flag -> column:name_string -> unit -> order

val make_skewed_info :
  ?skewed_column_value_location_maps:location_map ->
  ?skewed_column_values:column_value_string_list ->
  ?skewed_column_names:name_string_list ->
  unit ->
  skewed_info

val make_schema_id :
  ?registry_name:schema_registry_name_string ->
  ?schema_name:schema_registry_name_string ->
  ?schema_arn:glue_resource_arn ->
  unit ->
  schema_id

val make_schema_reference :
  ?schema_version_number:version_long_number ->
  ?schema_version_id:schema_version_id_string ->
  ?schema_id:schema_id ->
  unit ->
  schema_reference

val make_storage_descriptor :
  ?schema_reference:schema_reference ->
  ?stored_as_sub_directories:boolean_ ->
  ?skewed_info:skewed_info ->
  ?parameters:parameters_map ->
  ?sort_columns:order_list ->
  ?bucket_columns:name_string_list ->
  ?serde_info:ser_de_info ->
  ?number_of_buckets:integer ->
  ?compressed:boolean_ ->
  ?output_format:format_string ->
  ?input_format:format_string ->
  ?additional_locations:location_string_list ->
  ?location:location_string ->
  ?columns:column_list ->
  unit ->
  storage_descriptor

val make_table_identifier :
  ?region:name_string ->
  ?name:name_string ->
  ?database_name:name_string ->
  ?catalog_id:catalog_id_string ->
  unit ->
  table_identifier

val make_table_input :
  ?view_definition:view_definition_input ->
  ?target_table:table_identifier ->
  ?parameters:parameters_map ->
  ?table_type:table_type_string ->
  ?view_expanded_text:view_text_string ->
  ?view_original_text:view_text_string ->
  ?partition_keys:column_list ->
  ?storage_descriptor:storage_descriptor ->
  ?retention:non_negative_integer ->
  ?last_analyzed_time:timestamp ->
  ?last_access_time:timestamp ->
  ?owner:name_string ->
  ?description:description_string ->
  name:name_string ->
  unit ->
  table_input

val make_iceberg_struct_field :
  ?write_default:iceberg_document ->
  ?initial_default:iceberg_document ->
  ?doc:comment_string ->
  required:boolean_ ->
  type_:iceberg_document ->
  name:column_name_string ->
  id:integer ->
  unit ->
  iceberg_struct_field

val make_iceberg_schema :
  ?type_:iceberg_struct_type_enum ->
  ?identifier_field_ids:integer_list ->
  ?schema_id:integer ->
  fields:iceberg_struct_field_list ->
  unit ->
  iceberg_schema

val make_iceberg_partition_field :
  ?field_id:integer ->
  name:column_name_string ->
  transform:iceberg_transform_string ->
  source_id:integer ->
  unit ->
  iceberg_partition_field

val make_iceberg_partition_spec :
  ?spec_id:integer -> fields:iceberg_partition_spec_field_list -> unit -> iceberg_partition_spec

val make_iceberg_sort_field :
  null_order:iceberg_null_order ->
  direction:iceberg_sort_direction ->
  transform:iceberg_transform_string ->
  source_id:integer ->
  unit ->
  iceberg_sort_field

val make_iceberg_sort_order :
  fields:iceberg_sort_order_field_list -> order_id:integer -> unit -> iceberg_sort_order

val make_iceberg_encrypted_key :
  ?properties:string_to_string_map ->
  ?encrypted_by_id:encryption_key_id_string ->
  encrypted_key_metadata:encrypted_key_metadata_string ->
  key_id:encryption_key_id_string ->
  unit ->
  iceberg_encrypted_key

val make_iceberg_table_update :
  ?key_id:encryption_key_id_string ->
  ?encryption_key:iceberg_encrypted_key ->
  ?action:iceberg_update_action ->
  ?properties:string_to_string_map ->
  ?sort_order:iceberg_sort_order ->
  ?partition_spec:iceberg_partition_spec ->
  location:location_string ->
  schema:iceberg_schema ->
  unit ->
  iceberg_table_update

val make_update_iceberg_table_input :
  updates:iceberg_table_update_list -> unit -> update_iceberg_table_input

val make_update_iceberg_input :
  update_iceberg_table_input:update_iceberg_table_input -> unit -> update_iceberg_input

val make_update_open_table_format_input :
  ?update_iceberg_input:update_iceberg_input -> unit -> update_open_table_format_input

val make_update_table_request :
  ?update_open_table_format_input:update_open_table_format_input ->
  ?force:boolean_ ->
  ?view_update_action:view_update_action ->
  ?version_id:version_string ->
  ?transaction_id:transaction_id_string ->
  ?skip_archive:boolean_nullable ->
  ?table_input:table_input ->
  ?name:name_string ->
  ?catalog_id:catalog_id_string ->
  database_name:name_string ->
  unit ->
  update_table_request

val make_update_table_optimizer_response : unit -> unit

val make_iceberg_compaction_configuration :
  ?delete_file_threshold:nullable_integer ->
  ?min_input_files:nullable_integer ->
  ?strategy:compaction_strategy ->
  unit ->
  iceberg_compaction_configuration

val make_compaction_configuration :
  ?iceberg_configuration:iceberg_compaction_configuration -> unit -> compaction_configuration

val make_iceberg_retention_configuration :
  ?run_rate_in_hours:nullable_integer ->
  ?clean_expired_files:nullable_boolean ->
  ?number_of_snapshots_to_retain:nullable_integer ->
  ?snapshot_retention_period_in_days:nullable_integer ->
  unit ->
  iceberg_retention_configuration

val make_retention_configuration :
  ?iceberg_configuration:iceberg_retention_configuration -> unit -> retention_configuration

val make_iceberg_orphan_file_deletion_configuration :
  ?run_rate_in_hours:nullable_integer ->
  ?location:message_string ->
  ?orphan_file_retention_period_in_days:nullable_integer ->
  unit ->
  iceberg_orphan_file_deletion_configuration

val make_orphan_file_deletion_configuration :
  ?iceberg_configuration:iceberg_orphan_file_deletion_configuration ->
  unit ->
  orphan_file_deletion_configuration

val make_table_optimizer_configuration :
  ?orphan_file_deletion_configuration:orphan_file_deletion_configuration ->
  ?retention_configuration:retention_configuration ->
  ?compaction_configuration:compaction_configuration ->
  ?vpc_configuration:table_optimizer_vpc_configuration ->
  ?enabled:nullable_boolean ->
  ?role_arn:arn_string ->
  unit ->
  table_optimizer_configuration

val make_update_table_optimizer_request :
  table_optimizer_configuration:table_optimizer_configuration ->
  type_:table_optimizer_type ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  update_table_optimizer_request

val make_update_source_control_from_job_response :
  ?job_name:name_string -> unit -> update_source_control_from_job_response

val make_update_source_control_from_job_request :
  ?auth_token:auth_token_string ->
  ?auth_strategy:source_control_auth_strategy ->
  ?commit_id:commit_id_string ->
  ?folder:name_string ->
  ?branch_name:name_string ->
  ?repository_owner:name_string ->
  ?repository_name:name_string ->
  ?provider:source_control_provider ->
  ?job_name:name_string ->
  unit ->
  update_source_control_from_job_request

val make_update_schema_response :
  ?registry_name:schema_registry_name_string ->
  ?schema_name:schema_registry_name_string ->
  ?schema_arn:glue_resource_arn ->
  unit ->
  update_schema_response

val make_schema_version_number :
  ?version_number:version_long_number ->
  ?latest_version:latest_schema_version_boolean ->
  unit ->
  schema_version_number

val make_update_schema_input :
  ?description:description_string ->
  ?compatibility:compatibility ->
  ?schema_version_number:schema_version_number ->
  schema_id:schema_id ->
  unit ->
  update_schema_input

val make_update_registry_response :
  ?registry_arn:glue_resource_arn ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  update_registry_response

val make_registry_id :
  ?registry_arn:glue_resource_arn ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  registry_id

val make_update_registry_input :
  description:description_string -> registry_id:registry_id -> unit -> update_registry_input

val make_update_partition_response : unit -> unit

val make_partition_input :
  ?last_analyzed_time:timestamp ->
  ?parameters:parameters_map ->
  ?storage_descriptor:storage_descriptor ->
  ?last_access_time:timestamp ->
  ?values:value_string_list ->
  unit ->
  partition_input

val make_update_partition_request :
  ?catalog_id:catalog_id_string ->
  partition_input:partition_input ->
  partition_value_list:bounded_partition_value_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  update_partition_request

val make_update_ml_transform_response :
  ?transform_id:hash_string -> unit -> update_ml_transform_response

val make_find_matches_parameters :
  ?enforce_provided_labels:nullable_boolean ->
  ?accuracy_cost_tradeoff:generic_bounded_double ->
  ?precision_recall_tradeoff:generic_bounded_double ->
  ?primary_key_column_name:column_name_string ->
  unit ->
  find_matches_parameters

val make_transform_parameters :
  ?find_matches_parameters:find_matches_parameters ->
  transform_type:transform_type ->
  unit ->
  transform_parameters

val make_update_ml_transform_request :
  ?max_retries:nullable_integer ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?max_capacity:nullable_double ->
  ?glue_version:glue_version_string ->
  ?role:role_string ->
  ?parameters:transform_parameters ->
  ?description:description_string ->
  ?name:name_string ->
  transform_id:hash_string ->
  unit ->
  update_ml_transform_request

val make_update_json_classifier_request :
  ?json_path:json_path -> name:name_string -> unit -> update_json_classifier_request

val make_update_job_response : ?job_name:name_string -> unit -> update_job_response
val make_execution_property : ?max_concurrent_runs:max_concurrent_runs -> unit -> execution_property

val make_job_command :
  ?runtime:runtime_name_string ->
  ?python_version:python_version_string ->
  ?script_location:script_location_string ->
  ?name:generic_string ->
  unit ->
  job_command

val make_connections_list : ?connections:connection_string_list -> unit -> connections_list

val make_glue_studio_schema_column :
  ?glue_studio_type:column_type_string ->
  ?type_:column_type_string ->
  name:glue_studio_column_name_string ->
  unit ->
  glue_studio_schema_column

val make_glue_schema : ?columns:glue_studio_schema_column_list -> unit -> glue_schema

val make_athena_connector_source :
  ?output_schemas:glue_schemas ->
  ?connection_table:enclosed_in_string_property_with_quote ->
  schema_name:enclosed_in_string_property ->
  connection_type:enclosed_in_string_property ->
  connector_name:enclosed_in_string_property ->
  connection_name:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  athena_connector_source

val make_jdbc_connector_options :
  ?data_type_mapping:jdbc_data_type_mapping ->
  ?job_bookmark_keys_sort_order:enclosed_in_string_property ->
  ?job_bookmark_keys:enclosed_in_string_properties ->
  ?num_partitions:boxed_non_negative_long ->
  ?upper_bound:boxed_non_negative_long ->
  ?lower_bound:boxed_non_negative_long ->
  ?partition_column:enclosed_in_string_property ->
  ?filter_predicate:enclosed_in_string_property ->
  unit ->
  jdbc_connector_options

val make_jdbc_connector_source :
  ?output_schemas:glue_schemas ->
  ?query:sql_query ->
  ?connection_table:enclosed_in_string_property_with_quote ->
  ?additional_options:jdbc_connector_options ->
  connection_type:enclosed_in_string_property ->
  connector_name:enclosed_in_string_property ->
  connection_name:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  jdbc_connector_source

val make_spark_connector_source :
  ?output_schemas:glue_schemas ->
  ?additional_options:additional_options ->
  connection_type:enclosed_in_string_property ->
  connector_name:enclosed_in_string_property ->
  connection_name:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  spark_connector_source

val make_catalog_source :
  ?output_schemas:glue_schemas ->
  ?partition_predicate:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  catalog_source

val make_redshift_source :
  ?tmp_dir_iam_role:enclosed_in_string_property ->
  ?redshift_tmp_dir:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  redshift_source

val make_s3_source_additional_options :
  ?bounded_files:boxed_long -> ?bounded_size:boxed_long -> unit -> s3_source_additional_options

val make_s3_catalog_source :
  ?additional_options:s3_source_additional_options ->
  ?partition_predicate:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  s3_catalog_source

val make_s3_direct_source_additional_options :
  ?sample_path:enclosed_in_string_property ->
  ?enable_sample_path:boxed_boolean ->
  ?bounded_files:boxed_long ->
  ?bounded_size:boxed_long ->
  unit ->
  s3_direct_source_additional_options

val make_s3_csv_source :
  ?output_schemas:glue_schemas ->
  ?optimize_performance:boolean_value ->
  ?skip_first:boxed_boolean ->
  ?write_header:boxed_boolean ->
  ?with_header:boxed_boolean ->
  ?multiline:boxed_boolean ->
  ?escaper:enclosed_in_string_property_with_quote ->
  ?additional_options:s3_direct_source_additional_options ->
  ?max_files_in_band:boxed_non_negative_int ->
  ?max_band:boxed_non_negative_int ->
  ?recurse:boxed_boolean ->
  ?group_files:enclosed_in_string_property ->
  ?group_size:enclosed_in_string_property ->
  ?exclusions:enclosed_in_string_properties ->
  ?compression_type:compression_type ->
  quote_char:quote_char ->
  separator:separator ->
  paths:enclosed_in_string_properties ->
  name:node_name ->
  unit ->
  s3_csv_source

val make_s3_json_source :
  ?output_schemas:glue_schemas ->
  ?multiline:boxed_boolean ->
  ?json_path:enclosed_in_string_property ->
  ?additional_options:s3_direct_source_additional_options ->
  ?max_files_in_band:boxed_non_negative_int ->
  ?max_band:boxed_non_negative_int ->
  ?recurse:boxed_boolean ->
  ?group_files:enclosed_in_string_property ->
  ?group_size:enclosed_in_string_property ->
  ?exclusions:enclosed_in_string_properties ->
  ?compression_type:compression_type ->
  paths:enclosed_in_string_properties ->
  name:node_name ->
  unit ->
  s3_json_source

val make_s3_parquet_source :
  ?output_schemas:glue_schemas ->
  ?additional_options:s3_direct_source_additional_options ->
  ?max_files_in_band:boxed_non_negative_int ->
  ?max_band:boxed_non_negative_int ->
  ?recurse:boxed_boolean ->
  ?group_files:enclosed_in_string_property ->
  ?group_size:enclosed_in_string_property ->
  ?exclusions:enclosed_in_string_properties ->
  ?compression_type:parquet_compression_type ->
  paths:enclosed_in_string_properties ->
  name:node_name ->
  unit ->
  s3_parquet_source

val make_relational_catalog_source :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  relational_catalog_source

val make_ddbelt_catalog_additional_options :
  ?dynamodb_unnest_ddb_json:boolean_value ->
  ?dynamodb_export:enclosed_in_string_property ->
  unit ->
  ddbelt_catalog_additional_options

val make_dynamo_db_catalog_source :
  ?additional_options:ddbelt_catalog_additional_options ->
  ?pitr_enabled:boxed_boolean ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  dynamo_db_catalog_source

val make_jdbc_connector_target :
  ?output_schemas:glue_schemas ->
  ?additional_options:additional_options ->
  connection_type:enclosed_in_string_property ->
  connector_name:enclosed_in_string_property ->
  connection_table:enclosed_in_string_property_with_quote ->
  connection_name:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  jdbc_connector_target

val make_spark_connector_target :
  ?output_schemas:glue_schemas ->
  ?additional_options:additional_options ->
  connection_type:enclosed_in_string_property ->
  connector_name:enclosed_in_string_property ->
  connection_name:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  spark_connector_target

val make_basic_catalog_target :
  ?partition_keys:glue_studio_path_list ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  basic_catalog_target

val make_redshift_target :
  ?upsert_redshift_options:upsert_redshift_target_options ->
  ?tmp_dir_iam_role:enclosed_in_string_property ->
  ?redshift_tmp_dir:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  redshift_target

val make_catalog_schema_change_policy :
  ?update_behavior:update_catalog_behavior ->
  ?enable_update_catalog:boxed_boolean ->
  unit ->
  catalog_schema_change_policy

val make_auto_data_quality :
  ?evaluation_context:enclosed_in_string_property ->
  ?is_enabled:boolean_value ->
  unit ->
  auto_data_quality

val make_s3_catalog_target :
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:catalog_schema_change_policy ->
  ?partition_keys:glue_studio_path_list ->
  database:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_catalog_target

val make_direct_schema_change_policy :
  ?database:enclosed_in_string_property ->
  ?table:enclosed_in_string_property ->
  ?update_behavior:update_catalog_behavior ->
  ?enable_update_catalog:boxed_boolean ->
  unit ->
  direct_schema_change_policy

val make_s3_glue_parquet_target :
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:direct_schema_change_policy ->
  ?number_target_partitions:number_target_partitions_string ->
  ?compression:parquet_compression_type ->
  ?partition_keys:glue_studio_path_list ->
  path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_glue_parquet_target

val make_s3_direct_target :
  ?output_schemas:glue_schemas ->
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:direct_schema_change_policy ->
  ?number_target_partitions:number_target_partitions_string ->
  ?compression:enclosed_in_string_property ->
  ?partition_keys:glue_studio_path_list ->
  format:target_format ->
  path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_direct_target

val make_mapping :
  ?children:mappings ->
  ?dropped:boxed_boolean ->
  ?to_type:enclosed_in_string_property ->
  ?from_type:enclosed_in_string_property ->
  ?from_path:enclosed_in_string_properties ->
  ?to_key:enclosed_in_string_property ->
  unit ->
  mapping

val make_apply_mapping :
  mapping:mappings -> inputs:one_input -> name:node_name -> unit -> apply_mapping

val make_select_fields :
  paths:glue_studio_path_list -> inputs:one_input -> name:node_name -> unit -> select_fields

val make_drop_fields :
  paths:glue_studio_path_list -> inputs:one_input -> name:node_name -> unit -> drop_fields

val make_rename_field :
  target_path:enclosed_in_string_properties ->
  source_path:enclosed_in_string_properties ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  rename_field

val make_spigot :
  ?prob:prob ->
  ?topk:topk ->
  path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  spigot

val make_join_column :
  keys:glue_studio_path_list -> from_:enclosed_in_string_property -> unit -> join_column

val make_join :
  columns:join_columns -> join_type:join_type -> inputs:two_inputs -> name:node_name -> unit -> join

val make_split_fields :
  paths:glue_studio_path_list -> inputs:one_input -> name:node_name -> unit -> split_fields

val make_select_from_collection :
  index:non_negative_int -> inputs:one_input -> name:node_name -> unit -> select_from_collection

val make_fill_missing_values :
  ?filled_path:enclosed_in_string_property ->
  imputed_path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  fill_missing_values

val make_filter_value :
  value:enclosed_in_string_properties -> type_:filter_value_type -> unit -> filter_value

val make_filter_expression :
  ?negated:boxed_boolean ->
  values:filter_values ->
  operation:filter_operation ->
  unit ->
  filter_expression

val make_filter :
  filters:filter_expressions ->
  logical_operator:filter_logical_operator ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  filter

val make_custom_code :
  ?output_schemas:glue_schemas ->
  class_name:enclosed_in_string_property ->
  code:extended_string ->
  inputs:many_inputs ->
  name:node_name ->
  unit ->
  custom_code

val make_sql_alias :
  alias:enclosed_in_string_property_with_quote -> from_:node_id -> unit -> sql_alias

val make_spark_sq_l :
  ?output_schemas:glue_schemas ->
  sql_aliases:sql_aliases ->
  sql_query:sql_query ->
  inputs:many_inputs ->
  name:node_name ->
  unit ->
  spark_sq_l

val make_kinesis_streaming_source_options :
  ?fanout_consumer_ar_n:enclosed_in_string_property ->
  ?starting_timestamp:iso8601_date_time ->
  ?emit_consumer_lag_metrics:enclosed_in_string_property ->
  ?add_record_timestamp:enclosed_in_string_property ->
  ?role_session_name:enclosed_in_string_property ->
  ?role_arn:enclosed_in_string_property ->
  ?stream_arn:enclosed_in_string_property ->
  ?avoid_empty_batches:boxed_boolean ->
  ?max_retry_interval_ms:boxed_non_negative_long ->
  ?retry_interval_ms:boxed_non_negative_long ->
  ?num_retries:boxed_non_negative_int ->
  ?describe_shard_interval:boxed_non_negative_long ->
  ?idle_time_between_reads_in_ms:boxed_non_negative_long ->
  ?add_idle_time_between_reads:boxed_boolean ->
  ?max_record_per_read:boxed_non_negative_long ->
  ?max_fetch_records_per_shard:boxed_non_negative_long ->
  ?max_fetch_time_in_ms:boxed_non_negative_long ->
  ?starting_position:starting_position ->
  ?delimiter:enclosed_in_string_property ->
  ?classification:enclosed_in_string_property ->
  ?stream_name:enclosed_in_string_property ->
  ?endpoint_url:enclosed_in_string_property ->
  unit ->
  kinesis_streaming_source_options

val make_streaming_data_preview_options :
  ?record_polling_limit:positive_long ->
  ?polling_time:polling_time ->
  unit ->
  streaming_data_preview_options

val make_direct_kinesis_source :
  ?data_preview_options:streaming_data_preview_options ->
  ?streaming_options:kinesis_streaming_source_options ->
  ?detect_schema:boxed_boolean ->
  ?window_size:boxed_positive_int ->
  name:node_name ->
  unit ->
  direct_kinesis_source

val make_kafka_streaming_source_options :
  ?starting_timestamp:iso8601_date_time ->
  ?emit_consumer_lag_metrics:enclosed_in_string_property ->
  ?add_record_timestamp:enclosed_in_string_property ->
  ?include_headers:boxed_boolean ->
  ?min_partitions:boxed_non_negative_int ->
  ?max_offsets_per_trigger:boxed_non_negative_long ->
  ?retry_interval_ms:boxed_non_negative_long ->
  ?num_retries:boxed_non_negative_int ->
  ?poll_timeout_ms:boxed_non_negative_long ->
  ?ending_offsets:enclosed_in_string_property ->
  ?starting_offsets:enclosed_in_string_property ->
  ?delimiter:enclosed_in_string_property ->
  ?classification:enclosed_in_string_property ->
  ?subscribe_pattern:enclosed_in_string_property ->
  ?assign:enclosed_in_string_property ->
  ?topic_name:enclosed_in_string_property ->
  ?connection_name:enclosed_in_string_property ->
  ?security_protocol:enclosed_in_string_property ->
  ?bootstrap_servers:enclosed_in_string_property ->
  unit ->
  kafka_streaming_source_options

val make_direct_kafka_source :
  ?data_preview_options:streaming_data_preview_options ->
  ?detect_schema:boxed_boolean ->
  ?window_size:boxed_positive_int ->
  ?streaming_options:kafka_streaming_source_options ->
  name:node_name ->
  unit ->
  direct_kafka_source

val make_catalog_kinesis_source :
  ?data_preview_options:streaming_data_preview_options ->
  ?streaming_options:kinesis_streaming_source_options ->
  ?detect_schema:boxed_boolean ->
  ?window_size:boxed_positive_int ->
  database:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  catalog_kinesis_source

val make_catalog_kafka_source :
  ?data_preview_options:streaming_data_preview_options ->
  ?streaming_options:kafka_streaming_source_options ->
  ?detect_schema:boxed_boolean ->
  ?window_size:boxed_positive_int ->
  database:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  catalog_kafka_source

val make_null_check_box_list :
  ?is_neg_one:boxed_boolean ->
  ?is_null_string:boxed_boolean ->
  ?is_empty:boxed_boolean ->
  unit ->
  null_check_box_list

val make_datatype : label:generic_limited_string -> id:generic_limited_string -> unit -> datatype

val make_null_value_field :
  datatype:datatype -> value:enclosed_in_string_property -> unit -> null_value_field

val make_drop_null_fields :
  ?null_text_list:null_value_fields ->
  ?null_check_box_list:null_check_box_list ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  drop_null_fields

val make_merge :
  primary_keys:glue_studio_path_list ->
  source:node_id ->
  inputs:two_inputs ->
  name:node_name ->
  unit ->
  merge

val make_union : union_type:union_type -> inputs:two_inputs -> name:node_name -> unit -> union

val make_pii_detection :
  ?detection_sensitivity:enclosed_in_string_property ->
  ?detection_parameters:enclosed_in_string_property ->
  ?num_right_chars_to_exclude:boxed_positive_int ->
  ?num_left_chars_to_exclude:boxed_positive_int ->
  ?match_pattern:enclosed_in_string_property ->
  ?redact_char:enclosed_in_string_property ->
  ?redact_text:enclosed_in_string_property ->
  ?mask_value:mask_value ->
  ?threshold_fraction:boxed_double_fraction ->
  ?sample_fraction:boxed_double_fraction ->
  ?output_column_name:enclosed_in_string_property ->
  entity_types_to_detect:enclosed_in_string_properties ->
  pii_type:pii_type ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  pii_detection

val make_aggregate_operation :
  agg_func:agg_function -> column:enclosed_in_string_properties -> unit -> aggregate_operation

val make_aggregate :
  aggs:aggregate_operations ->
  groups:glue_studio_path_list ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  aggregate

val make_drop_duplicates :
  ?columns:limited_path_list -> inputs:one_input -> name:node_name -> unit -> drop_duplicates

val make_governed_catalog_target :
  ?schema_change_policy:catalog_schema_change_policy ->
  ?partition_keys:glue_studio_path_list ->
  database:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  governed_catalog_target

val make_governed_catalog_source :
  ?additional_options:s3_source_additional_options ->
  ?partition_predicate:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  governed_catalog_source

val make_microsoft_sql_server_catalog_source :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  microsoft_sql_server_catalog_source

val make_my_sql_catalog_source :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  my_sql_catalog_source

val make_oracle_sql_catalog_source :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  oracle_sql_catalog_source

val make_postgre_sql_catalog_source :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  postgre_sql_catalog_source

val make_microsoft_sql_server_catalog_target :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  microsoft_sql_server_catalog_target

val make_my_sql_catalog_target :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  my_sql_catalog_target

val make_oracle_sql_catalog_target :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  oracle_sql_catalog_target

val make_postgre_sql_catalog_target :
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  postgre_sql_catalog_target

val make_group_filters :
  logical_operator:filter_logical_operator ->
  filters:filter_expressions ->
  group_name:generic_limited_string ->
  unit ->
  group_filters

val make_route :
  group_filters_list:group_filters_list -> inputs:one_input -> name:node_name -> unit -> route

val make_transform_config_parameter :
  ?is_optional:boxed_boolean ->
  ?list_type:param_type ->
  ?value:enclosed_in_string_properties ->
  ?validation_message:enclosed_in_string_property ->
  ?validation_rule:enclosed_in_string_property ->
  type_:param_type ->
  name:enclosed_in_string_property ->
  unit ->
  transform_config_parameter

val make_dynamic_transform :
  ?output_schemas:glue_schemas ->
  ?version:enclosed_in_string_property ->
  ?parameters:transform_config_parameter_list ->
  path:enclosed_in_string_property ->
  function_name:enclosed_in_string_property ->
  inputs:one_input ->
  transform_name:enclosed_in_string_property ->
  name:enclosed_in_string_property ->
  unit ->
  dynamic_transform

val make_dq_results_publishing_options :
  ?results_publishing_enabled:boxed_boolean ->
  ?cloud_watch_metrics_enabled:boxed_boolean ->
  ?results_s3_prefix:enclosed_in_string_property ->
  ?evaluation_context:generic_limited_string ->
  unit ->
  dq_results_publishing_options

val make_dq_stop_job_on_failure_options :
  ?stop_job_on_failure_timing:dq_stop_job_on_failure_timing ->
  unit ->
  dq_stop_job_on_failure_options

val make_evaluate_data_quality :
  ?stop_job_on_failure_options:dq_stop_job_on_failure_options ->
  ?publishing_options:dq_results_publishing_options ->
  ?output:dq_transform_output ->
  ruleset:dqdl_string ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  evaluate_data_quality

val make_s3_catalog_hudi_source :
  ?output_schemas:glue_schemas ->
  ?additional_hudi_options:additional_options ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  s3_catalog_hudi_source

val make_catalog_hudi_source :
  ?output_schemas:glue_schemas ->
  ?additional_hudi_options:additional_options ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  catalog_hudi_source

val make_s3_hudi_source :
  ?output_schemas:glue_schemas ->
  ?additional_options:s3_direct_source_additional_options ->
  ?additional_hudi_options:additional_options ->
  paths:enclosed_in_string_properties ->
  name:node_name ->
  unit ->
  s3_hudi_source

val make_s3_hudi_catalog_target :
  ?output_schemas:glue_schemas ->
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:catalog_schema_change_policy ->
  ?partition_keys:glue_studio_path_list ->
  additional_options:additional_options ->
  database:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_hudi_catalog_target

val make_s3_hudi_direct_target :
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:direct_schema_change_policy ->
  ?partition_keys:glue_studio_path_list ->
  ?number_target_partitions:number_target_partitions_string ->
  additional_options:additional_options ->
  format:target_format ->
  compression:hudi_target_compression_type ->
  path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_hudi_direct_target

val make_direct_jdbc_source :
  ?output_schemas:glue_schemas ->
  ?redshift_tmp_dir:enclosed_in_string_property ->
  connection_type:jdbc_connection_type ->
  connection_name:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  direct_jdbc_source

val make_s3_catalog_delta_source :
  ?output_schemas:glue_schemas ->
  ?additional_delta_options:additional_options ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  s3_catalog_delta_source

val make_catalog_delta_source :
  ?output_schemas:glue_schemas ->
  ?additional_delta_options:additional_options ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  catalog_delta_source

val make_s3_delta_source :
  ?output_schemas:glue_schemas ->
  ?additional_options:s3_direct_source_additional_options ->
  ?additional_delta_options:additional_options ->
  paths:enclosed_in_string_properties ->
  name:node_name ->
  unit ->
  s3_delta_source

val make_s3_delta_catalog_target :
  ?output_schemas:glue_schemas ->
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:catalog_schema_change_policy ->
  ?additional_options:additional_options ->
  ?partition_keys:glue_studio_path_list ->
  database:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_delta_catalog_target

val make_s3_delta_direct_target :
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:direct_schema_change_policy ->
  ?additional_options:additional_options ->
  ?number_target_partitions:number_target_partitions_string ->
  ?partition_keys:glue_studio_path_list ->
  format:target_format ->
  compression:delta_target_compression_type ->
  path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_delta_direct_target

val make_option_ :
  ?description:enclosed_in_string_property ->
  ?label:enclosed_in_string_property ->
  ?value:enclosed_in_string_property ->
  unit ->
  option_

val make_amazon_redshift_advanced_option :
  ?value:generic_string -> ?key:generic_string -> unit -> amazon_redshift_advanced_option

val make_amazon_redshift_node_data :
  ?selected_columns:option_list ->
  ?staging_table:generic_string ->
  ?table_schema:option_list ->
  ?crawler_connection:generic_string ->
  ?merge_clause:generic_string ->
  ?merge_when_not_matched:generic_limited_string ->
  ?merge_when_matched:generic_limited_string ->
  ?merge_action:generic_limited_string ->
  ?upsert:boolean_value ->
  ?table_prefix:generic_limited_string ->
  ?action:generic_string ->
  ?post_action:generic_string ->
  ?pre_action:generic_string ->
  ?sample_query:generic_string ->
  ?advanced_options:amazon_redshift_advanced_options ->
  ?iam_role:option_ ->
  ?temp_dir:enclosed_in_string_property ->
  ?catalog_redshift_table:generic_string ->
  ?catalog_redshift_schema:generic_string ->
  ?catalog_table:option_ ->
  ?catalog_database:option_ ->
  ?table:option_ ->
  ?schema:option_ ->
  ?connection:option_ ->
  ?source_type:generic_limited_string ->
  ?access_type:generic_limited_string ->
  unit ->
  amazon_redshift_node_data

val make_amazon_redshift_source :
  ?data:amazon_redshift_node_data -> ?name:node_name -> unit -> amazon_redshift_source

val make_amazon_redshift_target :
  ?inputs:one_input ->
  ?data:amazon_redshift_node_data ->
  ?name:node_name ->
  unit ->
  amazon_redshift_target

val make_evaluate_data_quality_multi_frame :
  ?stop_job_on_failure_options:dq_stop_job_on_failure_options ->
  ?additional_options:dq_additional_options ->
  ?publishing_options:dq_results_publishing_options ->
  ?additional_data_sources:dqdl_aliases ->
  ruleset:dqdl_string ->
  inputs:many_inputs ->
  name:node_name ->
  unit ->
  evaluate_data_quality_multi_frame

val make_recipe_reference :
  recipe_version:recipe_version ->
  recipe_arn:enclosed_in_string_property ->
  unit ->
  recipe_reference

val make_recipe_action : ?parameters:parameter_map -> operation:operation -> unit -> recipe_action

val make_condition_expression :
  ?value:databrew_condition_value ->
  target_column:target_column ->
  condition:databrew_condition ->
  unit ->
  condition_expression

val make_recipe_step :
  ?condition_expressions:condition_expression_list -> action:recipe_action -> unit -> recipe_step

val make_recipe :
  ?recipe_steps:recipe_steps ->
  ?recipe_reference:recipe_reference ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  recipe

val make_snowflake_node_data :
  ?table_schema:option_list ->
  ?auto_pushdown:boolean_value ->
  ?selected_columns:option_list ->
  ?staging_table:generic_string ->
  ?merge_clause:generic_string ->
  ?merge_when_not_matched:generic_limited_string ->
  ?merge_when_matched:generic_limited_string ->
  ?merge_action:generic_limited_string ->
  ?upsert:boolean_value ->
  ?action:generic_string ->
  ?post_action:generic_string ->
  ?pre_action:generic_string ->
  ?sample_query:generic_string ->
  ?additional_options:additional_options ->
  ?iam_role:option_ ->
  ?temp_dir:enclosed_in_string_property ->
  ?database:generic_string ->
  ?table:generic_string ->
  ?schema:generic_string ->
  ?connection:option_ ->
  ?source_type:generic_limited_string ->
  unit ->
  snowflake_node_data

val make_snowflake_source :
  ?output_schemas:glue_schemas ->
  data:snowflake_node_data ->
  name:node_name ->
  unit ->
  snowflake_source

val make_snowflake_target :
  ?inputs:one_input -> data:snowflake_node_data -> name:node_name -> unit -> snowflake_target

val make_connector_data_source :
  ?output_schemas:glue_schemas ->
  data:connector_options ->
  connection_type:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  connector_data_source

val make_connector_data_target :
  ?inputs:one_input ->
  data:connector_options ->
  connection_type:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  connector_data_target

val make_s3_catalog_iceberg_source :
  ?output_schemas:glue_schemas ->
  ?additional_iceberg_options:additional_options ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  s3_catalog_iceberg_source

val make_catalog_iceberg_source :
  ?output_schemas:glue_schemas ->
  ?additional_iceberg_options:additional_options ->
  table:enclosed_in_string_property ->
  database:enclosed_in_string_property ->
  name:node_name ->
  unit ->
  catalog_iceberg_source

val make_s3_iceberg_catalog_target :
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:catalog_schema_change_policy ->
  ?additional_options:additional_options ->
  ?partition_keys:glue_studio_path_list ->
  database:enclosed_in_string_property ->
  table:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_iceberg_catalog_target

val make_s3_iceberg_direct_target :
  ?output_schemas:glue_schemas ->
  ?number_target_partitions:number_target_partitions_string ->
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:direct_schema_change_policy ->
  ?additional_options:additional_options ->
  ?partition_keys:glue_studio_path_list ->
  compression:iceberg_target_compression_type ->
  format:target_format ->
  path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_iceberg_direct_target

val make_s3_excel_source :
  ?output_schemas:glue_schemas ->
  ?skip_footer:boxed_non_negative_int ->
  ?number_rows:boxed_long ->
  ?additional_options:s3_direct_source_additional_options ->
  ?max_files_in_band:boxed_non_negative_int ->
  ?max_band:boxed_non_negative_int ->
  ?recurse:boxed_boolean ->
  ?group_files:enclosed_in_string_property ->
  ?group_size:enclosed_in_string_property ->
  ?exclusions:enclosed_in_string_properties ->
  ?compression_type:parquet_compression_type ->
  paths:enclosed_in_string_properties ->
  name:node_name ->
  unit ->
  s3_excel_source

val make_s3_hyper_direct_target :
  ?output_schemas:glue_schemas ->
  ?auto_data_quality:auto_data_quality ->
  ?schema_change_policy:direct_schema_change_policy ->
  ?compression:hyper_target_compression_type ->
  ?partition_keys:glue_studio_path_list ->
  ?format:target_format ->
  path:enclosed_in_string_property ->
  inputs:one_input ->
  name:node_name ->
  unit ->
  s3_hyper_direct_target

val make_ddbelt_connection_options :
  ?dynamodb_sts_role_arn:enclosed_in_string_property ->
  ?dynamodb_s3_bucket_owner:enclosed_in_string_property ->
  ?dynamodb_s3_prefix:enclosed_in_string_property ->
  ?dynamodb_s3_bucket:enclosed_in_string_property ->
  ?dynamodb_unnest_ddb_json:boolean_value ->
  ?dynamodb_export:ddb_export_type ->
  dynamodb_table_arn:enclosed_in_string_property ->
  unit ->
  ddbelt_connection_options

val make_dynamo_dbelt_connector_source :
  ?output_schemas:glue_schemas ->
  ?connection_options:ddbelt_connection_options ->
  name:node_name ->
  unit ->
  dynamo_dbelt_connector_source

val make_code_gen_configuration_node :
  ?dynamo_dbelt_connector_source:dynamo_dbelt_connector_source ->
  ?s3_hyper_direct_target:s3_hyper_direct_target ->
  ?s3_excel_source:s3_excel_source ->
  ?s3_iceberg_direct_target:s3_iceberg_direct_target ->
  ?s3_iceberg_catalog_target:s3_iceberg_catalog_target ->
  ?catalog_iceberg_source:catalog_iceberg_source ->
  ?s3_catalog_iceberg_source:s3_catalog_iceberg_source ->
  ?connector_data_target:connector_data_target ->
  ?connector_data_source:connector_data_source ->
  ?snowflake_target:snowflake_target ->
  ?snowflake_source:snowflake_source ->
  ?recipe:recipe ->
  ?evaluate_data_quality_multi_frame:evaluate_data_quality_multi_frame ->
  ?amazon_redshift_target:amazon_redshift_target ->
  ?amazon_redshift_source:amazon_redshift_source ->
  ?s3_delta_direct_target:s3_delta_direct_target ->
  ?s3_delta_catalog_target:s3_delta_catalog_target ->
  ?s3_delta_source:s3_delta_source ->
  ?catalog_delta_source:catalog_delta_source ->
  ?s3_catalog_delta_source:s3_catalog_delta_source ->
  ?direct_jdbc_source:direct_jdbc_source ->
  ?s3_hudi_direct_target:s3_hudi_direct_target ->
  ?s3_hudi_catalog_target:s3_hudi_catalog_target ->
  ?s3_hudi_source:s3_hudi_source ->
  ?catalog_hudi_source:catalog_hudi_source ->
  ?s3_catalog_hudi_source:s3_catalog_hudi_source ->
  ?evaluate_data_quality:evaluate_data_quality ->
  ?dynamic_transform:dynamic_transform ->
  ?route:route ->
  ?postgre_sql_catalog_target:postgre_sql_catalog_target ->
  ?oracle_sql_catalog_target:oracle_sql_catalog_target ->
  ?my_sql_catalog_target:my_sql_catalog_target ->
  ?microsoft_sql_server_catalog_target:microsoft_sql_server_catalog_target ->
  ?postgre_sql_catalog_source:postgre_sql_catalog_source ->
  ?oracle_sql_catalog_source:oracle_sql_catalog_source ->
  ?my_sql_catalog_source:my_sql_catalog_source ->
  ?microsoft_sql_server_catalog_source:microsoft_sql_server_catalog_source ->
  ?governed_catalog_source:governed_catalog_source ->
  ?governed_catalog_target:governed_catalog_target ->
  ?drop_duplicates:drop_duplicates ->
  ?aggregate:aggregate ->
  ?pii_detection:pii_detection ->
  ?union:union ->
  ?merge:merge ->
  ?drop_null_fields:drop_null_fields ->
  ?catalog_kafka_source:catalog_kafka_source ->
  ?catalog_kinesis_source:catalog_kinesis_source ->
  ?direct_kafka_source:direct_kafka_source ->
  ?direct_kinesis_source:direct_kinesis_source ->
  ?spark_sq_l:spark_sq_l ->
  ?custom_code:custom_code ->
  ?filter:filter ->
  ?fill_missing_values:fill_missing_values ->
  ?select_from_collection:select_from_collection ->
  ?split_fields:split_fields ->
  ?join:join ->
  ?spigot:spigot ->
  ?rename_field:rename_field ->
  ?drop_fields:drop_fields ->
  ?select_fields:select_fields ->
  ?apply_mapping:apply_mapping ->
  ?s3_direct_target:s3_direct_target ->
  ?s3_glue_parquet_target:s3_glue_parquet_target ->
  ?s3_catalog_target:s3_catalog_target ->
  ?redshift_target:redshift_target ->
  ?catalog_target:basic_catalog_target ->
  ?spark_connector_target:spark_connector_target ->
  ?jdbc_connector_target:jdbc_connector_target ->
  ?dynamo_db_catalog_source:dynamo_db_catalog_source ->
  ?relational_catalog_source:relational_catalog_source ->
  ?s3_parquet_source:s3_parquet_source ->
  ?s3_json_source:s3_json_source ->
  ?s3_csv_source:s3_csv_source ->
  ?s3_catalog_source:s3_catalog_source ->
  ?redshift_source:redshift_source ->
  ?catalog_source:catalog_source ->
  ?spark_connector_source:spark_connector_source ->
  ?jdbc_connector_source:jdbc_connector_source ->
  ?athena_connector_source:athena_connector_source ->
  unit ->
  code_gen_configuration_node

val make_source_control_details :
  ?auth_token:generic512_char_string ->
  ?auth_strategy:source_control_auth_strategy ->
  ?last_commit_id:generic512_char_string ->
  ?folder:generic512_char_string ->
  ?branch:generic512_char_string ->
  ?owner:generic512_char_string ->
  ?repository:generic512_char_string ->
  ?provider:source_control_provider ->
  unit ->
  source_control_details

val make_job_update :
  ?maintenance_window:maintenance_window ->
  ?source_control_details:source_control_details ->
  ?execution_class:execution_class ->
  ?code_gen_configuration_nodes:code_gen_configuration_nodes ->
  ?glue_version:glue_version_string ->
  ?notification_property:notification_property ->
  ?security_configuration:name_string ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?max_capacity:nullable_double ->
  ?timeout:timeout ->
  ?allocated_capacity:integer_value ->
  ?max_retries:max_retries ->
  ?connections:connections_list ->
  ?non_overridable_arguments:generic_map ->
  ?default_arguments:generic_map ->
  ?command:job_command ->
  ?execution_property:execution_property ->
  ?role:role_string ->
  ?log_uri:uri_string ->
  ?description:description_string ->
  ?job_run_queuing_enabled:nullable_boolean ->
  ?job_mode:job_mode ->
  unit ->
  job_update

val make_update_job_request :
  job_update:job_update -> job_name:name_string -> unit -> update_job_request

val make_update_job_from_source_control_response :
  ?job_name:name_string -> unit -> update_job_from_source_control_response

val make_update_job_from_source_control_request :
  ?auth_token:auth_token_string ->
  ?auth_strategy:source_control_auth_strategy ->
  ?commit_id:commit_id_string ->
  ?folder:name_string ->
  ?branch_name:name_string ->
  ?repository_owner:name_string ->
  ?repository_name:name_string ->
  ?provider:source_control_provider ->
  ?job_name:name_string ->
  unit ->
  update_job_from_source_control_request

val make_update_integration_table_properties_response : unit -> unit

val make_source_table_config :
  ?record_update_field:string128 ->
  ?primary_key:primary_key_list ->
  ?filter_predicate:string128 ->
  ?fields:source_table_fields_list ->
  unit ->
  source_table_config

val make_integration_partition :
  ?conversion_spec:string128 ->
  ?function_spec:string128 ->
  ?field_name:string128 ->
  unit ->
  integration_partition

val make_target_table_config :
  ?target_table_name:string128 ->
  ?partition_spec:integration_partition_spec_list ->
  ?unnest_spec:unnest_spec ->
  unit ->
  target_table_config

val make_update_integration_table_properties_request :
  ?target_table_config:target_table_config ->
  ?source_table_config:source_table_config ->
  table_name:string128 ->
  resource_arn:string512 ->
  unit ->
  update_integration_table_properties_request

val make_source_processing_properties : ?role_arn:string128 -> unit -> source_processing_properties

val make_target_processing_properties :
  ?event_bus_arn:string2048 ->
  ?connection_name:string128 ->
  ?kms_arn:string2048 ->
  ?role_arn:string128 ->
  unit ->
  target_processing_properties

val make_update_integration_resource_property_response :
  ?target_processing_properties:target_processing_properties ->
  ?source_processing_properties:source_processing_properties ->
  ?resource_property_arn:string512 ->
  ?resource_arn:string512 ->
  unit ->
  update_integration_resource_property_response

val make_update_integration_resource_property_request :
  ?target_processing_properties:target_processing_properties ->
  ?source_processing_properties:source_processing_properties ->
  resource_arn:string512 ->
  unit ->
  update_integration_resource_property_request

val make_update_grok_classifier_request :
  ?custom_patterns:custom_patterns ->
  ?grok_pattern:grok_pattern ->
  ?classification:classification ->
  name:name_string ->
  unit ->
  update_grok_classifier_request

val make_update_glue_identity_center_configuration_response : unit -> unit

val make_update_glue_identity_center_configuration_request :
  ?user_background_sessions_enabled:nullable_boolean ->
  ?scopes:identity_center_scopes_list ->
  unit ->
  update_glue_identity_center_configuration_request

val make_update_glossary_term_response :
  ?long_description:glossary_long_description ->
  ?short_description:glossary_short_description ->
  ?name:glossary_term_name ->
  ?glossary_id:glossary_id ->
  ?id:glossary_term_id ->
  unit ->
  update_glossary_term_response

val make_update_glossary_term_request :
  ?client_token:hash_string ->
  ?long_description:glossary_long_description ->
  ?short_description:glossary_short_description ->
  ?name:glossary_term_name ->
  identifier:glossary_term_id ->
  unit ->
  update_glossary_term_request

val make_update_glossary_response :
  ?description:metadata_description ->
  ?name:glossary_name ->
  ?id:glossary_id ->
  unit ->
  update_glossary_response

val make_update_glossary_request :
  ?client_token:hash_string ->
  ?description:metadata_description ->
  ?name:glossary_name ->
  identifier:glossary_id ->
  unit ->
  update_glossary_request

val make_update_dev_endpoint_response : unit -> unit

val make_dev_endpoint_custom_libraries :
  ?extra_jars_s3_path:generic_string ->
  ?extra_python_libs_s3_path:generic_string ->
  unit ->
  dev_endpoint_custom_libraries

val make_update_dev_endpoint_request :
  ?add_arguments:map_value ->
  ?delete_arguments:string_list ->
  ?update_etl_libraries:boolean_value ->
  ?custom_libraries:dev_endpoint_custom_libraries ->
  ?delete_public_keys:public_keys_list ->
  ?add_public_keys:public_keys_list ->
  ?public_key:generic_string ->
  endpoint_name:generic_string ->
  unit ->
  update_dev_endpoint_request

val make_update_database_response : unit -> unit

val make_data_lake_principal :
  ?data_lake_principal_identifier:data_lake_principal_string -> unit -> data_lake_principal

val make_principal_permissions :
  ?permissions:permission_list -> ?principal:data_lake_principal -> unit -> principal_permissions

val make_database_identifier :
  ?region:name_string ->
  ?database_name:name_string ->
  ?catalog_id:catalog_id_string ->
  unit ->
  database_identifier

val make_federated_database :
  ?connection_type:name_string ->
  ?connection_name:name_string ->
  ?identifier:federation_identifier ->
  unit ->
  federated_database

val make_database_input :
  ?federated_database:federated_database ->
  ?target_database:database_identifier ->
  ?create_table_default_permissions:principal_permissions_list ->
  ?parameters:parameters_map ->
  ?location_uri:ur_i ->
  ?description:description_string ->
  name:name_string ->
  unit ->
  database_input

val make_update_database_request :
  ?catalog_id:catalog_id_string ->
  database_input:database_input ->
  name:name_string ->
  unit ->
  update_database_request

val make_update_data_quality_ruleset_response :
  ?ruleset:data_quality_ruleset_string ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  update_data_quality_ruleset_response

val make_update_data_quality_ruleset_request :
  ?ruleset:data_quality_ruleset_string ->
  ?description:description_string ->
  name:name_string ->
  unit ->
  update_data_quality_ruleset_request

val make_update_csv_classifier_request :
  ?serde:csv_serde_option ->
  ?custom_datatypes:custom_datatypes ->
  ?custom_datatype_configured:nullable_boolean ->
  ?allow_single_column:nullable_boolean ->
  ?disable_value_trimming:nullable_boolean ->
  ?header:csv_header ->
  ?contains_header:csv_header_option ->
  ?quote_symbol:csv_quote_symbol ->
  ?delimiter:csv_column_delimiter ->
  name:name_string ->
  unit ->
  update_csv_classifier_request

val make_update_crawler_schedule_response : unit -> unit

val make_update_crawler_schedule_request :
  ?schedule:cron_expression -> crawler_name:name_string -> unit -> update_crawler_schedule_request

val make_update_crawler_response : unit -> unit

val make_s3_target :
  ?dlq_event_queue_arn:event_queue_arn ->
  ?event_queue_arn:event_queue_arn ->
  ?sample_size:nullable_integer ->
  ?connection_name:connection_name ->
  ?exclusions:path_list ->
  ?path:path ->
  unit ->
  s3_target

val make_jdbc_target :
  ?enable_additional_metadata:enable_additional_metadata ->
  ?exclusions:path_list ->
  ?path:path ->
  ?connection_name:connection_name ->
  unit ->
  jdbc_target

val make_mongo_db_target :
  ?scan_all:nullable_boolean ->
  ?path:path ->
  ?connection_name:connection_name ->
  unit ->
  mongo_db_target

val make_dynamo_db_target :
  ?scan_rate:nullable_double -> ?scan_all:nullable_boolean -> ?path:path -> unit -> dynamo_db_target

val make_catalog_target :
  ?dlq_event_queue_arn:event_queue_arn ->
  ?event_queue_arn:event_queue_arn ->
  ?connection_name:connection_name ->
  tables:catalog_tables_list ->
  database_name:name_string ->
  unit ->
  catalog_target

val make_delta_target :
  ?create_native_delta_table:nullable_boolean ->
  ?write_manifest:nullable_boolean ->
  ?connection_name:connection_name ->
  ?delta_tables:path_list ->
  unit ->
  delta_target

val make_iceberg_target :
  ?maximum_traversal_depth:nullable_integer ->
  ?exclusions:path_list ->
  ?connection_name:connection_name ->
  ?paths:path_list ->
  unit ->
  iceberg_target

val make_hudi_target :
  ?maximum_traversal_depth:nullable_integer ->
  ?exclusions:path_list ->
  ?connection_name:connection_name ->
  ?paths:path_list ->
  unit ->
  hudi_target

val make_crawler_targets :
  ?hudi_targets:hudi_target_list ->
  ?iceberg_targets:iceberg_target_list ->
  ?delta_targets:delta_target_list ->
  ?catalog_targets:catalog_target_list ->
  ?dynamo_db_targets:dynamo_db_target_list ->
  ?mongo_db_targets:mongo_db_target_list ->
  ?jdbc_targets:jdbc_target_list ->
  ?s3_targets:s3_target_list ->
  unit ->
  crawler_targets

val make_schema_change_policy :
  ?delete_behavior:delete_behavior ->
  ?update_behavior:update_behavior ->
  unit ->
  schema_change_policy

val make_recrawl_policy : ?recrawl_behavior:recrawl_behavior -> unit -> recrawl_policy

val make_lineage_configuration :
  ?crawler_lineage_settings:crawler_lineage_settings -> unit -> lineage_configuration

val make_lake_formation_configuration :
  ?account_id:account_id ->
  ?use_lake_formation_credentials:nullable_boolean ->
  unit ->
  lake_formation_configuration

val make_update_crawler_request :
  ?crawler_security_configuration:crawler_security_configuration ->
  ?configuration:crawler_configuration ->
  ?lake_formation_configuration:lake_formation_configuration ->
  ?lineage_configuration:lineage_configuration ->
  ?recrawl_policy:recrawl_policy ->
  ?schema_change_policy:schema_change_policy ->
  ?table_prefix:table_prefix ->
  ?classifiers:classifier_name_list ->
  ?schedule:cron_expression ->
  ?targets:crawler_targets ->
  ?description:description_string_removable ->
  ?database_name:database_name ->
  ?role:role ->
  name:name_string ->
  unit ->
  update_crawler_request

val make_update_connection_response : unit -> unit

val make_physical_connection_requirements :
  ?availability_zone:name_string ->
  ?security_group_id_list:security_group_id_list ->
  ?subnet_id:name_string ->
  unit ->
  physical_connection_requirements

val make_o_auth2_client_application :
  ?aws_managed_client_application_reference:aws_managed_client_application_reference ->
  ?user_managed_client_application_client_id:user_managed_client_application_client_id ->
  unit ->
  o_auth2_client_application

val make_authorization_code_properties :
  ?redirect_uri:redirect_uri ->
  ?authorization_code:authorization_code ->
  unit ->
  authorization_code_properties

val make_o_auth2_credentials :
  ?jwt_token:jwt_token ->
  ?refresh_token:refresh_token ->
  ?access_token:access_token ->
  ?user_managed_client_application_client_secret:user_managed_client_application_client_secret ->
  unit ->
  o_auth2_credentials

val make_o_auth2_properties_input :
  ?o_auth2_credentials:o_auth2_credentials ->
  ?authorization_code_properties:authorization_code_properties ->
  ?token_url_parameters_map:token_url_parameters_map ->
  ?token_url:token_url ->
  ?o_auth2_client_application:o_auth2_client_application ->
  ?o_auth2_grant_type:o_auth2_grant_type ->
  unit ->
  o_auth2_properties_input

val make_basic_authentication_credentials :
  ?password:password -> ?username:username -> unit -> basic_authentication_credentials

val make_authentication_configuration_input :
  ?custom_authentication_credentials:credential_map ->
  ?basic_authentication_credentials:basic_authentication_credentials ->
  ?kms_key_arn:kms_key_arn ->
  ?secret_arn:secret_arn ->
  ?o_auth2_properties:o_auth2_properties_input ->
  ?authentication_type:authentication_type ->
  unit ->
  authentication_configuration_input

val make_connection_input :
  ?validate_for_compute_environments:compute_environment_list ->
  ?validate_credentials:boolean_ ->
  ?authentication_configuration:authentication_configuration_input ->
  ?physical_connection_requirements:physical_connection_requirements ->
  ?python_properties:property_map ->
  ?athena_properties:property_map ->
  ?spark_properties:property_map ->
  ?match_criteria:match_criteria ->
  ?description:description_string ->
  connection_properties:connection_properties ->
  connection_type:connection_type ->
  name:name_string ->
  unit ->
  connection_input

val make_update_connection_request :
  ?catalog_id:catalog_id_string ->
  connection_input:connection_input ->
  name:name_string ->
  unit ->
  update_connection_request

val make_update_column_statistics_task_settings_response : unit -> unit

val make_update_column_statistics_task_settings_request :
  ?security_configuration:name_string ->
  ?catalog_i_d:name_string ->
  ?sample_size:sample_size_percentage ->
  ?column_name_list:column_name_list ->
  ?schedule:cron_expression ->
  ?role:name_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  update_column_statistics_task_settings_request

val make_boolean_column_statistics_data :
  number_of_nulls:non_negative_long ->
  number_of_falses:non_negative_long ->
  number_of_trues:non_negative_long ->
  unit ->
  boolean_column_statistics_data

val make_date_column_statistics_data :
  ?maximum_value:timestamp ->
  ?minimum_value:timestamp ->
  number_of_distinct_values:non_negative_long ->
  number_of_nulls:non_negative_long ->
  unit ->
  date_column_statistics_data

val make_decimal_number : scale:integer -> unscaled_value:blob -> unit -> decimal_number

val make_decimal_column_statistics_data :
  ?maximum_value:decimal_number ->
  ?minimum_value:decimal_number ->
  number_of_distinct_values:non_negative_long ->
  number_of_nulls:non_negative_long ->
  unit ->
  decimal_column_statistics_data

val make_double_column_statistics_data :
  ?maximum_value:double ->
  ?minimum_value:double ->
  number_of_distinct_values:non_negative_long ->
  number_of_nulls:non_negative_long ->
  unit ->
  double_column_statistics_data

val make_long_column_statistics_data :
  ?maximum_value:long ->
  ?minimum_value:long ->
  number_of_distinct_values:non_negative_long ->
  number_of_nulls:non_negative_long ->
  unit ->
  long_column_statistics_data

val make_string_column_statistics_data :
  number_of_distinct_values:non_negative_long ->
  number_of_nulls:non_negative_long ->
  average_length:non_negative_double ->
  maximum_length:non_negative_long ->
  unit ->
  string_column_statistics_data

val make_binary_column_statistics_data :
  number_of_nulls:non_negative_long ->
  average_length:non_negative_double ->
  maximum_length:non_negative_long ->
  unit ->
  binary_column_statistics_data

val make_column_statistics_data :
  ?binary_column_statistics_data:binary_column_statistics_data ->
  ?string_column_statistics_data:string_column_statistics_data ->
  ?long_column_statistics_data:long_column_statistics_data ->
  ?double_column_statistics_data:double_column_statistics_data ->
  ?decimal_column_statistics_data:decimal_column_statistics_data ->
  ?date_column_statistics_data:date_column_statistics_data ->
  ?boolean_column_statistics_data:boolean_column_statistics_data ->
  type_:column_statistics_type ->
  unit ->
  column_statistics_data

val make_column_statistics :
  statistics_data:column_statistics_data ->
  analyzed_time:timestamp ->
  column_type:type_string ->
  column_name:name_string ->
  unit ->
  column_statistics

val make_column_statistics_error :
  ?error:error_detail -> ?column_statistics:column_statistics -> unit -> column_statistics_error

val make_update_column_statistics_for_table_response :
  ?errors:column_statistics_errors -> unit -> update_column_statistics_for_table_response

val make_update_column_statistics_for_table_request :
  ?catalog_id:catalog_id_string ->
  column_statistics_list:update_column_statistics_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  update_column_statistics_for_table_request

val make_update_column_statistics_for_partition_response :
  ?errors:column_statistics_errors -> unit -> update_column_statistics_for_partition_response

val make_update_column_statistics_for_partition_request :
  ?catalog_id:catalog_id_string ->
  column_statistics_list:update_column_statistics_list ->
  partition_values:value_string_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  update_column_statistics_for_partition_request

val make_update_classifier_response : unit -> unit

val make_update_classifier_request :
  ?csv_classifier:update_csv_classifier_request ->
  ?json_classifier:update_json_classifier_request ->
  ?xml_classifier:update_xml_classifier_request ->
  ?grok_classifier:update_grok_classifier_request ->
  unit ->
  update_classifier_request

val make_update_catalog_response : unit -> unit

val make_federated_catalog :
  ?connection_type:name_string ->
  ?connection_name:name_string ->
  ?identifier:federation_identifier ->
  unit ->
  federated_catalog

val make_target_redshift_catalog :
  catalog_arn:resource_arn_string -> unit -> target_redshift_catalog

val make_data_lake_access_properties :
  ?catalog_type:name_string ->
  ?kms_key:resource_arn_string ->
  ?data_transfer_role:iam_role_arn ->
  ?data_lake_access:boolean_ ->
  unit ->
  data_lake_access_properties

val make_iceberg_optimization_properties :
  ?orphan_file_deletion:parameters_map ->
  ?retention:parameters_map ->
  ?compaction:parameters_map ->
  ?role_arn:iam_role_arn ->
  unit ->
  iceberg_optimization_properties

val make_catalog_properties :
  ?custom_properties:parameters_map ->
  ?iceberg_optimization_properties:iceberg_optimization_properties ->
  ?data_lake_access_properties:data_lake_access_properties ->
  unit ->
  catalog_properties

val make_catalog_input :
  ?overwrite_child_resource_permissions_with_default:
    overwrite_child_resource_permissions_with_default_enum ->
  ?allow_full_table_external_data_access:allow_full_table_external_data_access_enum ->
  ?create_database_default_permissions:principal_permissions_list ->
  ?create_table_default_permissions:principal_permissions_list ->
  ?catalog_properties:catalog_properties ->
  ?target_redshift_catalog:target_redshift_catalog ->
  ?parameters:parameters_map ->
  ?federated_catalog:federated_catalog ->
  ?description:description_string ->
  unit ->
  catalog_input

val make_update_catalog_request :
  catalog_input:catalog_input -> catalog_id:catalog_id_string -> unit -> update_catalog_request

val make_update_blueprint_response : ?name:name_string -> unit -> update_blueprint_response

val make_update_blueprint_request :
  ?description:generic512_char_string ->
  blueprint_location:orchestration_s3_location ->
  name:orchestration_name_string ->
  unit ->
  update_blueprint_request

val make_update_asset_response :
  ?updated_at:updated_at ->
  ?description:asset_description ->
  ?name:asset_name ->
  id:asset_id ->
  unit ->
  update_asset_response

val make_update_asset_request :
  ?client_token:hash_string ->
  ?description:asset_description ->
  ?name:asset_name ->
  identifier:asset_id ->
  unit ->
  update_asset_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tags_to_remove:tag_keys_list -> resource_arn:glue_resource_arn -> unit -> untag_resource_request

val make_partition :
  ?catalog_id:catalog_id_string ->
  ?last_analyzed_time:timestamp ->
  ?parameters:parameters_map ->
  ?storage_descriptor:storage_descriptor ->
  ?last_access_time:timestamp ->
  ?creation_time:timestamp ->
  ?table_name:name_string ->
  ?database_name:name_string ->
  ?values:value_string_list ->
  unit ->
  partition

val make_unfiltered_partition :
  ?is_registered_with_lake_formation:boolean_ ->
  ?authorized_columns:name_string_list ->
  ?partition:partition ->
  unit ->
  unfiltered_partition

val make_transform_sort_criteria :
  sort_direction:sort_direction_type ->
  column:transform_sort_column_type ->
  unit ->
  transform_sort_criteria

val make_schema_column :
  ?data_type:column_type_string -> ?name:column_name_string -> unit -> schema_column

val make_glue_table :
  ?additional_options:glue_table_additional_options ->
  ?connection_name:name_string ->
  ?catalog_id:name_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  glue_table

val make_confusion_matrix :
  ?num_false_negatives:records_count ->
  ?num_true_negatives:records_count ->
  ?num_false_positives:records_count ->
  ?num_true_positives:records_count ->
  unit ->
  confusion_matrix

val make_column_importance :
  ?importance:generic_bounded_double -> ?column_name:name_string -> unit -> column_importance

val make_find_matches_metrics :
  ?column_importances:column_importance_list ->
  ?confusion_matrix:confusion_matrix ->
  ?f1:generic_bounded_double ->
  ?recall:generic_bounded_double ->
  ?precision:generic_bounded_double ->
  ?area_under_pr_curve:generic_bounded_double ->
  unit ->
  find_matches_metrics

val make_evaluation_metrics :
  ?find_matches_metrics:find_matches_metrics ->
  transform_type:transform_type ->
  unit ->
  evaluation_metrics

val make_ml_user_data_encryption :
  ?kms_key_id:name_string ->
  ml_user_data_encryption_mode:ml_user_data_encryption_mode_string ->
  unit ->
  ml_user_data_encryption

val make_transform_encryption :
  ?task_run_security_configuration_name:name_string ->
  ?ml_user_data_encryption:ml_user_data_encryption ->
  unit ->
  transform_encryption

val make_ml_transform :
  ?transform_encryption:transform_encryption ->
  ?max_retries:nullable_integer ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?max_capacity:nullable_double ->
  ?glue_version:glue_version_string ->
  ?role:role_string ->
  ?schema:transform_schema ->
  ?label_count:label_count ->
  ?evaluation_metrics:evaluation_metrics ->
  ?parameters:transform_parameters ->
  ?input_record_tables:glue_tables ->
  ?last_modified_on:timestamp ->
  ?created_on:timestamp ->
  ?status:transform_status_type ->
  ?description:description_string ->
  ?name:name_string ->
  ?transform_id:hash_string ->
  unit ->
  ml_transform

val make_transform_filter_criteria :
  ?schema:transform_schema ->
  ?last_modified_after:timestamp ->
  ?last_modified_before:timestamp ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?glue_version:glue_version_string ->
  ?status:transform_status_type ->
  ?transform_type:transform_type ->
  ?name:name_string ->
  unit ->
  transform_filter_criteria

val make_timestamped_inclusion_annotation :
  ?last_modified_on:timestamp ->
  ?value:inclusion_annotation_value ->
  unit ->
  timestamped_inclusion_annotation

val make_timestamp_filter :
  ?recorded_after:timestamp -> ?recorded_before:timestamp -> unit -> timestamp_filter

val make_test_connection_response : unit -> unit

val make_test_connection_input :
  ?authentication_configuration:authentication_configuration_input ->
  connection_properties:connection_properties ->
  connection_type:connection_type ->
  unit ->
  test_connection_input

val make_test_connection_request :
  ?test_connection_input:test_connection_input ->
  ?catalog_id:catalog_id_string ->
  ?connection_name:name_string ->
  unit ->
  test_connection_request

val make_task_run_sort_criteria :
  sort_direction:sort_direction_type ->
  column:task_run_sort_column_type ->
  unit ->
  task_run_sort_criteria

val make_import_labels_task_run_properties :
  ?replace:replace_boolean -> ?input_s3_path:uri_string -> unit -> import_labels_task_run_properties

val make_export_labels_task_run_properties :
  ?output_s3_path:uri_string -> unit -> export_labels_task_run_properties

val make_labeling_set_generation_task_run_properties :
  ?output_s3_path:uri_string -> unit -> labeling_set_generation_task_run_properties

val make_find_matches_task_run_properties :
  ?job_run_id:hash_string ->
  ?job_name:name_string ->
  ?job_id:hash_string ->
  unit ->
  find_matches_task_run_properties

val make_task_run_properties :
  ?find_matches_task_run_properties:find_matches_task_run_properties ->
  ?labeling_set_generation_task_run_properties:labeling_set_generation_task_run_properties ->
  ?export_labels_task_run_properties:export_labels_task_run_properties ->
  ?import_labels_task_run_properties:import_labels_task_run_properties ->
  ?task_type:task_type ->
  unit ->
  task_run_properties

val make_task_run :
  ?execution_time:execution_time ->
  ?completed_on:timestamp ->
  ?last_modified_on:timestamp ->
  ?started_on:timestamp ->
  ?error_string:generic_string ->
  ?properties:task_run_properties ->
  ?log_group_name:generic_string ->
  ?status:task_status_type ->
  ?task_run_id:hash_string ->
  ?transform_id:hash_string ->
  unit ->
  task_run

val make_task_run_filter_criteria :
  ?started_after:timestamp ->
  ?started_before:timestamp ->
  ?status:task_status_type ->
  ?task_run_type:task_type ->
  unit ->
  task_run_filter_criteria

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags_to_add:tags_map -> resource_arn:glue_resource_arn -> unit -> tag_resource_request

val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_table_version_error :
  ?error_detail:error_detail ->
  ?version_id:version_string ->
  ?table_name:name_string ->
  unit ->
  table_version_error

val make_federated_table :
  ?connection_type:name_string ->
  ?connection_name:name_string ->
  ?database_identifier:federation_identifier ->
  ?identifier:federation_identifier ->
  unit ->
  federated_table

val make_iceberg_table_metadata :
  ?default_sort_order_id:integer ->
  ?sort_orders:iceberg_sort_order_list ->
  ?last_partition_id:integer ->
  ?default_spec_id:integer ->
  ?partition_specs:iceberg_partition_spec_list ->
  ?last_column_id:integer ->
  ?current_schema_id:integer ->
  ?schemas:iceberg_schema_list ->
  ?properties:string_to_string_map ->
  ?location:location_string ->
  ?table_uuid:table_id_string ->
  ?format_version:version_string ->
  unit ->
  iceberg_table_metadata

val make_status_details :
  ?view_validations:view_validation_list -> ?requested_change:table -> unit -> status_details

val make_table :
  ?status:table_status ->
  ?iceberg_table_metadata:iceberg_table_metadata ->
  ?is_materialized_view:nullable_boolean ->
  ?is_multi_dialect_view:nullable_boolean ->
  ?view_definition:view_definition ->
  ?federated_table:federated_table ->
  ?version_id:version_string ->
  ?catalog_id:catalog_id_string ->
  ?target_table:table_identifier ->
  ?is_registered_with_lake_formation:boolean_ ->
  ?created_by:name_string ->
  ?parameters:parameters_map ->
  ?table_type:table_type_string ->
  ?view_expanded_text:view_text_string ->
  ?view_original_text:view_text_string ->
  ?partition_keys:column_list ->
  ?storage_descriptor:storage_descriptor ->
  ?retention:non_negative_integer ->
  ?last_analyzed_time:timestamp ->
  ?last_access_time:timestamp ->
  ?update_time:timestamp ->
  ?create_time:timestamp ->
  ?owner:name_string ->
  ?description:description_string ->
  ?database_name:name_string ->
  name:name_string ->
  unit ->
  table

val make_table_status :
  ?details:status_details ->
  ?error:error_detail ->
  ?state:resource_state ->
  ?action:resource_action ->
  ?update_time:timestamp ->
  ?request_time:timestamp ->
  ?updated_by:name_string ->
  ?requested_by:name_string ->
  unit ->
  table_status

val make_table_version : ?version_id:version_string -> ?table:table -> unit -> table_version

val make_run_metrics :
  ?job_duration_in_hour:message_string ->
  ?number_of_dpus:message_string ->
  ?number_of_files_compacted:message_string ->
  ?number_of_bytes_compacted:message_string ->
  unit ->
  run_metrics

val make_iceberg_compaction_metrics :
  ?job_duration_in_hour:dpu_duration_in_hour ->
  ?number_of_dpus:dpu_counts ->
  ?dpu_hours:dpu_hours ->
  ?number_of_files_compacted:metric_counts ->
  ?number_of_bytes_compacted:metric_counts ->
  unit ->
  iceberg_compaction_metrics

val make_compaction_metrics :
  ?iceberg_metrics:iceberg_compaction_metrics -> unit -> compaction_metrics

val make_iceberg_retention_metrics :
  ?job_duration_in_hour:dpu_duration_in_hour ->
  ?number_of_dpus:dpu_counts ->
  ?dpu_hours:dpu_hours ->
  ?number_of_manifest_lists_deleted:metric_counts ->
  ?number_of_manifest_files_deleted:metric_counts ->
  ?number_of_data_files_deleted:metric_counts ->
  unit ->
  iceberg_retention_metrics

val make_retention_metrics : ?iceberg_metrics:iceberg_retention_metrics -> unit -> retention_metrics

val make_iceberg_orphan_file_deletion_metrics :
  ?job_duration_in_hour:dpu_duration_in_hour ->
  ?number_of_dpus:dpu_counts ->
  ?dpu_hours:dpu_hours ->
  ?number_of_orphan_files_deleted:metric_counts ->
  unit ->
  iceberg_orphan_file_deletion_metrics

val make_orphan_file_deletion_metrics :
  ?iceberg_metrics:iceberg_orphan_file_deletion_metrics -> unit -> orphan_file_deletion_metrics

val make_table_optimizer_run :
  ?orphan_file_deletion_metrics:orphan_file_deletion_metrics ->
  ?retention_metrics:retention_metrics ->
  ?compaction_strategy:compaction_strategy ->
  ?compaction_metrics:compaction_metrics ->
  ?error:message_string ->
  ?metrics:run_metrics ->
  ?end_timestamp:table_optimizer_run_timestamp ->
  ?start_timestamp:table_optimizer_run_timestamp ->
  ?event_type:table_optimizer_event_type ->
  unit ->
  table_optimizer_run

val make_table_optimizer :
  ?configuration_source:configuration_source ->
  ?last_run:table_optimizer_run ->
  ?configuration:table_optimizer_configuration ->
  ?type_:table_optimizer_type ->
  unit ->
  table_optimizer

val make_table_error : ?error_detail:error_detail -> ?table_name:name_string -> unit -> table_error

val make_supported_dialect :
  ?dialect_version:view_dialect_version_string -> ?dialect:view_dialect -> unit -> supported_dialect

val make_stop_workflow_run_response : unit -> unit

val make_stop_workflow_run_request :
  run_id:id_string -> name:name_string -> unit -> stop_workflow_run_request

val make_stop_trigger_response : ?name:name_string -> unit -> stop_trigger_response
val make_stop_trigger_request : name:name_string -> unit -> stop_trigger_request
val make_stop_session_response : ?id:name_string -> unit -> stop_session_response

val make_stop_session_request :
  ?request_origin:orchestration_name_string -> id:name_string -> unit -> stop_session_request

val make_stop_materialized_view_refresh_task_run_response : unit -> unit

val make_stop_materialized_view_refresh_task_run_request :
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:name_string ->
  unit ->
  stop_materialized_view_refresh_task_run_request

val make_stop_crawler_schedule_response : unit -> unit

val make_stop_crawler_schedule_request :
  crawler_name:name_string -> unit -> stop_crawler_schedule_request

val make_stop_crawler_response : unit -> unit
val make_stop_crawler_request : name:name_string -> unit -> stop_crawler_request
val make_stop_column_statistics_task_run_schedule_response : unit -> unit

val make_stop_column_statistics_task_run_schedule_request :
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  stop_column_statistics_task_run_schedule_request

val make_stop_column_statistics_task_run_response : unit -> unit

val make_stop_column_statistics_task_run_request :
  table_name:name_string ->
  database_name:database_name ->
  unit ->
  stop_column_statistics_task_run_request

val make_run_identifier : ?job_run_id:hash_string -> ?run_id:hash_string -> unit -> run_identifier

val make_statistic_summary :
  ?inclusion_annotation:timestamped_inclusion_annotation ->
  ?recorded_on:timestamp ->
  ?statistic_properties:statistic_properties_map ->
  ?referenced_datasets:reference_datasets_list ->
  ?columns_referenced:column_name_list ->
  ?evaluation_level:statistic_evaluation_level ->
  ?double_value:double ->
  ?statistic_name:statistic_name_string ->
  ?run_identifier:run_identifier ->
  ?profile_id:hash_string ->
  ?statistic_id:hash_string ->
  unit ->
  statistic_summary

val make_statistic_annotation :
  ?inclusion_annotation:timestamped_inclusion_annotation ->
  ?statistic_recorded_on:timestamp ->
  ?statistic_id:hash_string ->
  ?profile_id:hash_string ->
  unit ->
  statistic_annotation

val make_statement_output_data : ?text_plain:generic_string -> unit -> statement_output_data

val make_statement_output :
  ?traceback:orchestration_string_list ->
  ?error_value:generic_string ->
  ?error_name:generic_string ->
  ?status:statement_state ->
  ?execution_count:integer_value ->
  ?data:statement_output_data ->
  unit ->
  statement_output

val make_statement :
  ?completed_on:long_value ->
  ?started_on:long_value ->
  ?progress:double_value ->
  ?output:statement_output ->
  ?state:statement_state ->
  ?code:generic_string ->
  ?id:integer_value ->
  unit ->
  statement

val make_start_workflow_run_response : ?run_id:id_string -> unit -> start_workflow_run_response

val make_start_workflow_run_request :
  ?run_properties:workflow_run_properties -> name:name_string -> unit -> start_workflow_run_request

val make_start_trigger_response : ?name:name_string -> unit -> start_trigger_response
val make_start_trigger_request : name:name_string -> unit -> start_trigger_request

val make_start_materialized_view_refresh_task_run_response :
  ?materialized_view_refresh_task_run_id:uui_dv4 ->
  unit ->
  start_materialized_view_refresh_task_run_response

val make_start_materialized_view_refresh_task_run_request :
  ?full_refresh:nullable_boolean ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:name_string ->
  unit ->
  start_materialized_view_refresh_task_run_request

val make_start_ml_labeling_set_generation_task_run_response :
  ?task_run_id:hash_string -> unit -> start_ml_labeling_set_generation_task_run_response

val make_start_ml_labeling_set_generation_task_run_request :
  output_s3_path:uri_string ->
  transform_id:hash_string ->
  unit ->
  start_ml_labeling_set_generation_task_run_request

val make_start_ml_evaluation_task_run_response :
  ?task_run_id:hash_string -> unit -> start_ml_evaluation_task_run_response

val make_start_ml_evaluation_task_run_request :
  transform_id:hash_string -> unit -> start_ml_evaluation_task_run_request

val make_start_job_run_response : ?job_run_id:id_string -> unit -> start_job_run_response

val make_start_job_run_request :
  ?execution_role_session_policy:orchestration_policy_json_string ->
  ?execution_class:execution_class ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?notification_property:notification_property ->
  ?security_configuration:name_string ->
  ?max_capacity:nullable_double ->
  ?timeout:timeout ->
  ?allocated_capacity:integer_value ->
  ?arguments:generic_map ->
  ?job_run_id:id_string ->
  ?job_run_queuing_enabled:nullable_boolean ->
  job_name:name_string ->
  unit ->
  start_job_run_request

val make_start_import_labels_task_run_response :
  ?task_run_id:hash_string -> unit -> start_import_labels_task_run_response

val make_start_import_labels_task_run_request :
  ?replace_all_labels:replace_boolean ->
  input_s3_path:uri_string ->
  transform_id:hash_string ->
  unit ->
  start_import_labels_task_run_request

val make_start_export_labels_task_run_response :
  ?task_run_id:hash_string -> unit -> start_export_labels_task_run_response

val make_start_export_labels_task_run_request :
  output_s3_path:uri_string ->
  transform_id:hash_string ->
  unit ->
  start_export_labels_task_run_request

val make_start_data_quality_ruleset_evaluation_run_response :
  ?run_id:hash_string -> unit -> start_data_quality_ruleset_evaluation_run_response

val make_data_quality_glue_table :
  ?pre_processing_query:pre_processing_query_string ->
  ?additional_options:glue_table_additional_options ->
  ?connection_name:name_string ->
  ?catalog_id:name_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  data_quality_glue_table

val make_data_source :
  ?data_quality_glue_table:data_quality_glue_table -> ?glue_table:glue_table -> unit -> data_source

val make_data_quality_evaluation_run_additional_run_options :
  ?custom_log_group_prefix:generic_string ->
  ?composite_rule_evaluation_method:dq_composite_rule_evaluation_method ->
  ?results_s3_prefix:uri_string ->
  ?cloud_watch_metrics_enabled:nullable_boolean ->
  unit ->
  data_quality_evaluation_run_additional_run_options

val make_start_data_quality_ruleset_evaluation_run_request :
  ?additional_data_sources:data_source_map ->
  ?additional_run_options:data_quality_evaluation_run_additional_run_options ->
  ?client_token:hash_string ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  ruleset_names:ruleset_names ->
  role:role_string ->
  data_source:data_source ->
  unit ->
  start_data_quality_ruleset_evaluation_run_request

val make_start_data_quality_rule_recommendation_run_response :
  ?run_id:hash_string -> unit -> start_data_quality_rule_recommendation_run_response

val make_start_data_quality_rule_recommendation_run_request :
  ?client_token:hash_string ->
  ?data_quality_security_configuration:name_string ->
  ?created_ruleset_name:name_string ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  role:role_string ->
  data_source:data_source ->
  unit ->
  start_data_quality_rule_recommendation_run_request

val make_start_crawler_schedule_response : unit -> unit

val make_start_crawler_schedule_request :
  crawler_name:name_string -> unit -> start_crawler_schedule_request

val make_start_crawler_response : unit -> unit
val make_start_crawler_request : name:name_string -> unit -> start_crawler_request
val make_start_column_statistics_task_run_schedule_response : unit -> unit

val make_start_column_statistics_task_run_schedule_request :
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  start_column_statistics_task_run_schedule_request

val make_start_column_statistics_task_run_response :
  ?column_statistics_task_run_id:hash_string -> unit -> start_column_statistics_task_run_response

val make_start_column_statistics_task_run_request :
  ?security_configuration:name_string ->
  ?catalog_i_d:name_string ->
  ?sample_size:sample_size_percentage ->
  ?column_name_list:column_name_list ->
  role:name_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  start_column_statistics_task_run_request

val make_start_blueprint_run_response : ?run_id:id_string -> unit -> start_blueprint_run_response

val make_start_blueprint_run_request :
  ?parameters:blueprint_parameters ->
  role_arn:orchestration_iam_role_arn ->
  blueprint_name:orchestration_name_string ->
  unit ->
  start_blueprint_run_request

val make_connector_property :
  ?property_location:property_location ->
  ?allowed_values:list_of_string ->
  ?default_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?key_override:connector_property_key ->
  property_type:property_type ->
  required:bool_ ->
  name:property_name ->
  unit ->
  connector_property

val make_response_configuration :
  ?error_path:json_path_string -> result_path:json_path_string -> unit -> response_configuration

val make_response_extraction_mapping :
  ?header_key:connector_property_key ->
  ?content_path:json_path_string ->
  unit ->
  response_extraction_mapping

val make_extracted_parameter :
  ?value:response_extraction_mapping ->
  ?property_location:property_location ->
  ?default_value:default_value ->
  ?key:connector_property_key ->
  unit ->
  extracted_parameter

val make_cursor_configuration :
  ?limit_parameter:extracted_parameter ->
  next_page:extracted_parameter ->
  unit ->
  cursor_configuration

val make_offset_configuration :
  limit_parameter:extracted_parameter ->
  offset_parameter:extracted_parameter ->
  unit ->
  offset_configuration

val make_pagination_configuration :
  ?offset_configuration:offset_configuration ->
  ?cursor_configuration:cursor_configuration ->
  unit ->
  pagination_configuration

val make_source_configuration :
  ?pagination_configuration:pagination_configuration ->
  ?response_configuration:response_configuration ->
  ?request_parameters:connector_property_list ->
  ?request_path:path_string ->
  ?request_method:http_method ->
  unit ->
  source_configuration

val make_sort_criterion : ?sort:sort -> ?field_name:value_string -> unit -> sort_criterion

val make_session_command :
  ?python_version:python_version_string -> ?name:name_string -> unit -> session_command

val make_session :
  ?session_type:session_type ->
  ?profile_name:name_string ->
  ?idle_timeout:idle_timeout ->
  ?dpu_seconds:nullable_double ->
  ?execution_time:nullable_double ->
  ?completed_on:timestamp_value ->
  ?worker_type:worker_type ->
  ?number_of_workers:nullable_integer ->
  ?glue_version:glue_version_string ->
  ?security_configuration:name_string ->
  ?max_capacity:nullable_double ->
  ?progress:double_value ->
  ?connections:connections_list ->
  ?default_arguments:orchestration_arguments_map ->
  ?command:session_command ->
  ?role:orchestration_role_arn ->
  ?description:description_string ->
  ?error_message:description_string ->
  ?status:session_status ->
  ?created_on:timestamp_value ->
  ?id:name_string ->
  unit ->
  session

val make_session_endpoint :
  auth_token_expiration_time:timestamp_value ->
  auth_token:sensitive_string ->
  url:spark_connect_endpoint_url ->
  unit ->
  session_endpoint

val make_segment :
  total_segments:total_segments_integer -> segment_number:non_negative_integer -> unit -> segment

val make_s3_encryption :
  ?kms_key_arn:kms_key_arn -> ?s3_encryption_mode:s3_encryption_mode -> unit -> s3_encryption

val make_cloud_watch_encryption :
  ?kms_key_arn:kms_key_arn ->
  ?cloud_watch_encryption_mode:cloud_watch_encryption_mode ->
  unit ->
  cloud_watch_encryption

val make_job_bookmarks_encryption :
  ?kms_key_arn:kms_key_arn ->
  ?job_bookmarks_encryption_mode:job_bookmarks_encryption_mode ->
  unit ->
  job_bookmarks_encryption

val make_data_quality_encryption :
  ?kms_key_arn:kms_key_arn ->
  ?data_quality_encryption_mode:data_quality_encryption_mode ->
  unit ->
  data_quality_encryption

val make_encryption_configuration :
  ?data_quality_encryption:data_quality_encryption ->
  ?job_bookmarks_encryption:job_bookmarks_encryption ->
  ?cloud_watch_encryption:cloud_watch_encryption ->
  ?s3_encryption:s3_encryption_list ->
  unit ->
  encryption_configuration

val make_security_configuration :
  ?encryption_configuration:encryption_configuration ->
  ?created_time_stamp:timestamp_value ->
  ?name:name_string ->
  unit ->
  security_configuration

val make_search_tables_response :
  ?table_list:table_list -> ?next_token:token -> unit -> search_tables_response

val make_property_predicate :
  ?comparator:comparator -> ?value:value_string -> ?key:value_string -> unit -> property_predicate

val make_search_tables_request :
  ?include_status_details:boolean_nullable ->
  ?resource_share_type:resource_share_type ->
  ?max_results:page_size ->
  ?sort_criteria:sort_criteria ->
  ?search_text:value_string ->
  ?filters:search_property_predicates ->
  ?next_token:token ->
  ?catalog_id:catalog_id_string ->
  unit ->
  search_tables_request

val make_search_sort : ?order:search_sort_order -> attribute:search_attribute -> unit -> search_sort

val make_search_result_item :
  ?asset_type_id:asset_type_id ->
  ?updated_at:updated_at ->
  ?asset_description:asset_description ->
  ?asset_name:search_result_name ->
  ?id:asset_id ->
  unit ->
  search_result_item

val make_search_map_filter :
  value:search_map_filter_value ->
  key:search_map_key ->
  attribute:search_attribute ->
  unit ->
  search_map_filter

val make_search_attribute_filter :
  ?value:search_filter_value ->
  operator:search_filter_operator ->
  attribute:search_attribute ->
  unit ->
  search_attribute_filter

val make_search_assets_output :
  ?next_token:search_next_token -> ?items:search_result_item_list -> unit -> search_assets_output

val make_search_assets_input :
  ?filter_clause:search_filter_clause ->
  ?sort:search_sort ->
  ?next_token:search_next_token ->
  ?max_results:search_max_results ->
  ?search_text:search_text ->
  unit ->
  search_assets_input

val make_schema_version_list_item :
  ?created_time:created_timestamp ->
  ?status:schema_version_status ->
  ?version_number:version_long_number ->
  ?schema_version_id:schema_version_id_string ->
  ?schema_arn:glue_resource_arn ->
  unit ->
  schema_version_list_item

val make_error_details :
  ?error_message:error_message_string -> ?error_code:error_code_string -> unit -> error_details

val make_schema_version_error_item :
  ?error_details:error_details ->
  ?version_number:version_long_number ->
  unit ->
  schema_version_error_item

val make_schema_list_item :
  ?updated_time:updated_timestamp ->
  ?created_time:created_timestamp ->
  ?schema_status:schema_status ->
  ?description:description_string ->
  ?schema_arn:glue_resource_arn ->
  ?schema_name:schema_registry_name_string ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  schema_list_item

val make_schedule :
  ?state:schedule_state -> ?schedule_expression:cron_expression -> unit -> schedule

val make_run_statement_response : ?id:integer_value -> unit -> run_statement_response

val make_run_statement_request :
  ?request_origin:orchestration_name_string ->
  code:orchestration_statement_code_string ->
  session_id:name_string ->
  unit ->
  run_statement_request

val make_resume_workflow_run_response :
  ?node_ids:node_id_list -> ?run_id:id_string -> unit -> resume_workflow_run_response

val make_resume_workflow_run_request :
  node_ids:node_id_list ->
  run_id:id_string ->
  name:name_string ->
  unit ->
  resume_workflow_run_request

val make_field_definition :
  field_data_type:field_data_type ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  field_definition

val make_entity_configuration :
  ?schema:field_definition_map ->
  ?source_configuration:source_configuration ->
  unit ->
  entity_configuration

val make_rest_configuration :
  ?entity_configurations:entity_configuration_map ->
  ?validation_endpoint_configuration:source_configuration ->
  ?global_source_configuration:source_configuration ->
  unit ->
  rest_configuration

val make_job_bookmark_entry :
  ?job_bookmark:json_value ->
  ?run_id:run_id ->
  ?previous_run_id:run_id ->
  ?attempt:integer_value ->
  ?run:integer_value ->
  ?version:integer_value ->
  ?job_name:job_name ->
  unit ->
  job_bookmark_entry

val make_reset_job_bookmark_response :
  ?job_bookmark_entry:job_bookmark_entry -> unit -> reset_job_bookmark_response

val make_reset_job_bookmark_request :
  ?run_id:run_id -> job_name:job_name -> unit -> reset_job_bookmark_request

val make_remove_schema_version_metadata_response :
  ?metadata_value:metadata_value_string ->
  ?metadata_key:metadata_key_string ->
  ?schema_version_id:schema_version_id_string ->
  ?version_number:version_long_number ->
  ?latest_version:latest_schema_version_boolean ->
  ?registry_name:schema_registry_name_string ->
  ?schema_name:schema_registry_name_string ->
  ?schema_arn:glue_resource_arn ->
  unit ->
  remove_schema_version_metadata_response

val make_metadata_key_value_pair :
  ?metadata_value:metadata_value_string ->
  ?metadata_key:metadata_key_string ->
  unit ->
  metadata_key_value_pair

val make_remove_schema_version_metadata_input :
  ?schema_version_id:schema_version_id_string ->
  ?schema_version_number:schema_version_number ->
  ?schema_id:schema_id ->
  metadata_key_value:metadata_key_value_pair ->
  unit ->
  remove_schema_version_metadata_input

val make_registry_list_item :
  ?updated_time:updated_timestamp ->
  ?created_time:created_timestamp ->
  ?status:registry_status ->
  ?description:description_string ->
  ?registry_arn:glue_resource_arn ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  registry_list_item

val make_register_schema_version_response :
  ?status:schema_version_status ->
  ?version_number:version_long_number ->
  ?schema_version_id:schema_version_id_string ->
  unit ->
  register_schema_version_response

val make_register_schema_version_input :
  schema_definition:schema_definition_string ->
  schema_id:schema_id ->
  unit ->
  register_schema_version_input

val make_register_connection_type_response :
  ?connection_type_arn:glue_resource_arn -> unit -> register_connection_type_response

val make_connection_properties_configuration :
  ?additional_request_parameters:connector_property_list ->
  ?url:connector_property ->
  unit ->
  connection_properties_configuration

val make_client_credentials_properties :
  ?token_url_parameters:connector_property_list ->
  ?scope:connector_property ->
  ?client_secret:connector_property ->
  ?client_id:connector_property ->
  ?content_type:content_type ->
  ?request_method:http_method ->
  ?token_url:connector_property ->
  unit ->
  client_credentials_properties

val make_jwt_bearer_properties :
  ?token_url_parameters:connector_property_list ->
  ?jwt_token:connector_property ->
  ?content_type:content_type ->
  ?request_method:http_method ->
  ?token_url:connector_property ->
  unit ->
  jwt_bearer_properties

val make_connector_authorization_code_properties :
  ?token_url_parameters:connector_property_list ->
  ?prompt:connector_property ->
  ?scope:connector_property ->
  ?client_secret:connector_property ->
  ?client_id:connector_property ->
  ?content_type:content_type ->
  ?request_method:http_method ->
  ?token_url:connector_property ->
  ?redirect_uri:connector_property ->
  ?authorization_code:connector_property ->
  ?authorization_code_url:connector_property ->
  unit ->
  connector_authorization_code_properties

val make_connector_o_auth2_properties :
  ?authorization_code_properties:connector_authorization_code_properties ->
  ?jwt_bearer_properties:jwt_bearer_properties ->
  ?client_credentials_properties:client_credentials_properties ->
  o_auth2_grant_type:connector_o_auth2_grant_type ->
  unit ->
  connector_o_auth2_properties

val make_basic_authentication_properties :
  ?password:connector_property ->
  ?username:connector_property ->
  unit ->
  basic_authentication_properties

val make_custom_authentication_properties :
  authentication_parameters:connector_property_list -> unit -> custom_authentication_properties

val make_connector_authentication_configuration :
  ?custom_authentication_properties:custom_authentication_properties ->
  ?basic_authentication_properties:basic_authentication_properties ->
  ?o_auth2_properties:connector_o_auth2_properties ->
  authentication_types:authentication_types ->
  unit ->
  connector_authentication_configuration

val make_register_connection_type_request :
  ?tags:tags_map ->
  ?description:description ->
  rest_configuration:rest_configuration ->
  connector_authentication_configuration:connector_authentication_configuration ->
  connection_properties:connection_properties_configuration ->
  integration_type:integration_type ->
  connection_type:name_string ->
  unit ->
  register_connection_type_request

val make_query_session_context :
  ?additional_context:additional_context_map ->
  ?query_authorization_id:hash_string ->
  ?cluster_id:nullable_string ->
  ?query_start_time:timestamp ->
  ?query_id:hash_string ->
  unit ->
  query_session_context

val make_other_metadata_value_list_item :
  ?created_time:created_timestamp ->
  ?metadata_value:metadata_value_string ->
  unit ->
  other_metadata_value_list_item

val make_metadata_info :
  ?other_metadata_value_list:other_metadata_value_list ->
  ?created_time:created_timestamp ->
  ?metadata_value:metadata_value_string ->
  unit ->
  metadata_info

val make_query_schema_version_metadata_response :
  ?next_token:schema_registry_token_string ->
  ?schema_version_id:schema_version_id_string ->
  ?metadata_info_map:metadata_info_map ->
  unit ->
  query_schema_version_metadata_response

val make_query_schema_version_metadata_input :
  ?next_token:schema_registry_token_string ->
  ?max_results:query_schema_version_metadata_max_results ->
  ?metadata_list:metadata_list ->
  ?schema_version_id:schema_version_id_string ->
  ?schema_version_number:schema_version_number ->
  ?schema_id:schema_id ->
  unit ->
  query_schema_version_metadata_input

val make_put_workflow_run_properties_response : unit -> unit

val make_put_workflow_run_properties_request :
  run_properties:workflow_run_properties ->
  run_id:id_string ->
  name:name_string ->
  unit ->
  put_workflow_run_properties_request

val make_put_schema_version_metadata_response :
  ?metadata_value:metadata_value_string ->
  ?metadata_key:metadata_key_string ->
  ?schema_version_id:schema_version_id_string ->
  ?version_number:version_long_number ->
  ?latest_version:latest_schema_version_boolean ->
  ?registry_name:schema_registry_name_string ->
  ?schema_name:schema_registry_name_string ->
  ?schema_arn:glue_resource_arn ->
  unit ->
  put_schema_version_metadata_response

val make_put_schema_version_metadata_input :
  ?schema_version_id:schema_version_id_string ->
  ?schema_version_number:schema_version_number ->
  ?schema_id:schema_id ->
  metadata_key_value:metadata_key_value_pair ->
  unit ->
  put_schema_version_metadata_input

val make_put_resource_policy_response :
  ?policy_hash:hash_string -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?enable_hybrid:enable_hybrid_values ->
  ?policy_exists_condition:exist_condition ->
  ?policy_hash_condition:hash_string ->
  ?resource_arn:glue_resource_arn ->
  policy_in_json:policy_json_string ->
  unit ->
  put_resource_policy_request

val make_put_form_type_response :
  ?schema:form_type_schema ->
  ?name:form_type_name ->
  ?id:form_type_id ->
  unit ->
  put_form_type_response

val make_put_form_type_request :
  ?client_token:hash_string ->
  schema:form_type_schema ->
  name:form_type_name ->
  unit ->
  put_form_type_request

val make_put_data_quality_profile_annotation_response : unit -> unit

val make_put_data_quality_profile_annotation_request :
  inclusion_annotation:inclusion_annotation_value ->
  profile_id:hash_string ->
  unit ->
  put_data_quality_profile_annotation_request

val make_put_data_catalog_encryption_settings_response : unit -> unit

val make_encryption_at_rest :
  ?catalog_encryption_service_role:iam_role_arn ->
  ?sse_aws_kms_key_id:name_string ->
  catalog_encryption_mode:catalog_encryption_mode ->
  unit ->
  encryption_at_rest

val make_connection_password_encryption :
  ?aws_kms_key_id:name_string ->
  return_connection_password_encrypted:boolean_ ->
  unit ->
  connection_password_encryption

val make_data_catalog_encryption_settings :
  ?connection_password_encryption:connection_password_encryption ->
  ?encryption_at_rest:encryption_at_rest ->
  unit ->
  data_catalog_encryption_settings

val make_put_data_catalog_encryption_settings_request :
  ?catalog_id:catalog_id_string ->
  data_catalog_encryption_settings:data_catalog_encryption_settings ->
  unit ->
  put_data_catalog_encryption_settings_request

val make_put_attachment_response :
  ?form_type_id:form_type_id ->
  ?attachment_name:attachment_name ->
  ?item_identifier:item_identifier ->
  ?iterable_form_name:iterable_form_name ->
  ?asset_identifier:asset_id ->
  unit ->
  put_attachment_response

val make_put_attachment_request :
  ?client_token:hash_string ->
  ?item_identifier:item_identifier ->
  ?iterable_form_name:iterable_form_name ->
  form_type_id:form_type_id ->
  content:form_content ->
  attachment_name:attachment_name ->
  asset_identifier:asset_id ->
  unit ->
  put_attachment_request

val make_asset_type_form_reference :
  form_type_identifier:form_type_id -> unit -> asset_type_form_reference

val make_put_asset_type_response :
  ?forms:asset_type_forms_map ->
  ?name:asset_type_name ->
  ?id:asset_type_id ->
  unit ->
  put_asset_type_response

val make_put_asset_type_request :
  ?client_token:hash_string ->
  forms:asset_type_forms_map ->
  name:asset_type_name ->
  unit ->
  put_asset_type_request

val make_asset_form_entry :
  ?content:form_content -> ?form_type_id:form_type_id -> unit -> asset_form_entry

val make_put_asset_response :
  ?forms:asset_form_map ->
  ?created_at:created_at ->
  ?description:asset_description ->
  name:asset_name ->
  id:asset_id ->
  unit ->
  put_asset_response

val make_put_asset_request :
  ?client_token:hash_string ->
  ?description:asset_description ->
  forms:asset_form_map ->
  name:asset_name ->
  identifier:asset_id ->
  asset_type_id:asset_type_id ->
  unit ->
  put_asset_request

val make_allowed_value :
  ?description:allowed_value_description_string ->
  value:allowed_value_value_string ->
  unit ->
  allowed_value

val make_property :
  ?property_location:property_location ->
  ?key_override:Smaws_Lib.Smithy_api.Types.string_ ->
  ?data_operation_scopes:data_operations ->
  ?allowed_values:allowed_values ->
  ?default_value:Smaws_Lib.Smithy_api.Types.string_ ->
  property_types:property_types ->
  required:bool_ ->
  description:property_description_string ->
  name:property_name ->
  unit ->
  property

val make_partition_value_list : values:value_string_list -> unit -> partition_value_list
val make_partition_index : index_name:name_string -> keys:key_list -> unit -> partition_index

val make_key_schema_element :
  type_:column_type_string -> name:name_string -> unit -> key_schema_element

val make_backfill_error :
  ?partitions:backfill_errored_partitions_list ->
  ?code:backfill_error_code ->
  unit ->
  backfill_error

val make_partition_index_descriptor :
  ?backfill_errors:backfill_errors ->
  index_status:partition_index_status ->
  keys:key_schema_element_list ->
  index_name:name_string ->
  unit ->
  partition_index_descriptor

val make_partition_error :
  ?error_detail:error_detail -> ?partition_values:value_string_list -> unit -> partition_error

val make_create_iceberg_table_input :
  ?properties:string_to_string_map ->
  ?write_order:iceberg_sort_order ->
  ?partition_spec:iceberg_partition_spec ->
  schema:iceberg_schema ->
  location:location_string ->
  unit ->
  create_iceberg_table_input

val make_iceberg_input :
  ?create_iceberg_table_input:create_iceberg_table_input ->
  ?version:version_string ->
  metadata_operation:metadata_operation ->
  unit ->
  iceberg_input

val make_open_table_format_input : ?iceberg_input:iceberg_input -> unit -> open_table_format_input

val make_o_auth2_properties :
  ?token_url_parameters_map:token_url_parameters_map ->
  ?token_url:token_url ->
  ?o_auth2_client_application:o_auth2_client_application ->
  ?o_auth2_grant_type:o_auth2_grant_type ->
  unit ->
  o_auth2_properties

val make_integration_error :
  ?error_message:string2048 -> ?error_code:string128 -> unit -> integration_error

val make_integration_config :
  ?continuous_sync:continuous_sync ->
  ?source_properties:integration_source_properties_map ->
  ?refresh_interval:string128 ->
  unit ->
  integration_config

val make_modify_integration_response :
  ?integration_config:integration_config ->
  ?data_filter:string2048 ->
  ?errors:integration_error_list ->
  ?tags:integration_tags_list ->
  ?additional_encryption_context:integration_additional_encryption_context_map ->
  ?kms_key_id:string2048 ->
  ?description:integration_description ->
  create_time:integration_timestamp ->
  status:integration_status ->
  integration_arn:string128 ->
  integration_name:string128 ->
  target_arn:string512 ->
  source_arn:string512 ->
  unit ->
  modify_integration_response

val make_modify_integration_request :
  ?integration_name:string128 ->
  ?integration_config:integration_config ->
  ?data_filter:string2048 ->
  ?description:integration_description ->
  integration_identifier:string128 ->
  unit ->
  modify_integration_request

val make_data_quality_metric_values :
  ?upper_limit:nullable_double ->
  ?lower_limit:nullable_double ->
  ?expected_value:nullable_double ->
  ?actual_value:nullable_double ->
  unit ->
  data_quality_metric_values

val make_metric_based_observation :
  ?new_rules:new_rules ->
  ?metric_values:data_quality_metric_values ->
  ?statistic_id:hash_string ->
  ?metric_name:name_string ->
  unit ->
  metric_based_observation

val make_materialized_view_refresh_task_run :
  ?processed_bytes:byte_count ->
  ?refresh_type:materialized_view_refresh_type ->
  ?dpu_seconds:non_negative_double ->
  ?error_message:description_string ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?last_updated:timestamp ->
  ?creation_time:timestamp ->
  ?status:materialized_view_refresh_state ->
  ?role:role ->
  ?catalog_id:catalog_id_string ->
  ?table_name:table_name ->
  ?database_name:database_name ->
  ?materialized_view_refresh_task_run_id:uui_dv4 ->
  ?customer_id:account_id ->
  unit ->
  materialized_view_refresh_task_run

val make_mapping_entry :
  ?target_type:field_type ->
  ?target_path:schema_path_string ->
  ?target_table:table_name ->
  ?source_type:field_type ->
  ?source_path:schema_path_string ->
  ?source_table:table_name ->
  unit ->
  mapping_entry

val make_code_gen_node_arg :
  ?param:boolean_ -> value:code_gen_arg_value -> name:code_gen_arg_name -> unit -> code_gen_node_arg

val make_location :
  ?dynamo_d_b:code_gen_node_args ->
  ?s3:code_gen_node_args ->
  ?jdbc:code_gen_node_args ->
  unit ->
  location

val make_list_workflows_response :
  ?next_token:generic_string -> ?workflows:workflow_names -> unit -> list_workflows_response

val make_list_workflows_request :
  ?max_results:orchestration_page_size25 ->
  ?next_token:generic_string ->
  unit ->
  list_workflows_request

val make_list_usage_profiles_response :
  ?next_token:orchestration_token ->
  ?profiles:usage_profile_definition_list ->
  unit ->
  list_usage_profiles_response

val make_list_usage_profiles_request :
  ?max_results:orchestration_page_size200 ->
  ?next_token:orchestration_token ->
  unit ->
  list_usage_profiles_request

val make_list_triggers_response :
  ?next_token:generic_string -> ?trigger_names:trigger_name_list -> unit -> list_triggers_response

val make_list_triggers_request :
  ?tags:tags_map ->
  ?max_results:orchestration_page_size200 ->
  ?dependent_job_name:name_string ->
  ?next_token:generic_string ->
  unit ->
  list_triggers_request

val make_list_table_optimizer_runs_response :
  ?table_optimizer_runs:table_optimizer_runs ->
  ?next_token:list_table_optimizer_runs_token ->
  ?table_name:name_string ->
  ?database_name:name_string ->
  ?catalog_id:catalog_id_string ->
  unit ->
  list_table_optimizer_runs_response

val make_list_table_optimizer_runs_request :
  ?next_token:list_table_optimizer_runs_token ->
  ?max_results:max_list_table_optimizer_runs_token_results ->
  type_:table_optimizer_type ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  list_table_optimizer_runs_request

val make_list_statements_response :
  ?next_token:orchestration_token -> ?statements:statement_list -> unit -> list_statements_response

val make_list_statements_request :
  ?next_token:orchestration_token ->
  ?request_origin:orchestration_name_string ->
  session_id:name_string ->
  unit ->
  list_statements_request

val make_list_sessions_response :
  ?next_token:orchestration_token ->
  ?sessions:session_list ->
  ?ids:session_id_list ->
  unit ->
  list_sessions_response

val make_list_sessions_request :
  ?request_origin:orchestration_name_string ->
  ?tags:tags_map ->
  ?max_results:page_size ->
  ?next_token:orchestration_token ->
  unit ->
  list_sessions_request

val make_list_schemas_response :
  ?next_token:schema_registry_token_string ->
  ?schemas:schema_list_definition ->
  unit ->
  list_schemas_response

val make_list_schemas_input :
  ?next_token:schema_registry_token_string ->
  ?max_results:max_results_number ->
  ?registry_id:registry_id ->
  unit ->
  list_schemas_input

val make_list_schema_versions_response :
  ?next_token:schema_registry_token_string ->
  ?schemas:schema_version_list ->
  unit ->
  list_schema_versions_response

val make_list_schema_versions_input :
  ?next_token:schema_registry_token_string ->
  ?max_results:max_results_number ->
  schema_id:schema_id ->
  unit ->
  list_schema_versions_input

val make_list_registries_response :
  ?next_token:schema_registry_token_string ->
  ?registries:registry_list_definition ->
  unit ->
  list_registries_response

val make_list_registries_input :
  ?next_token:schema_registry_token_string ->
  ?max_results:max_results_number ->
  unit ->
  list_registries_input

val make_list_materialized_view_refresh_task_runs_response :
  ?next_token:token ->
  ?materialized_view_refresh_task_runs:materialized_view_refresh_task_runs_list ->
  unit ->
  list_materialized_view_refresh_task_runs_response

val make_list_materialized_view_refresh_task_runs_request :
  ?next_token:token ->
  ?max_results:page_size ->
  ?table_name:name_string ->
  ?database_name:name_string ->
  catalog_id:name_string ->
  unit ->
  list_materialized_view_refresh_task_runs_request

val make_list_ml_transforms_response :
  ?next_token:pagination_token ->
  transform_ids:transform_id_list ->
  unit ->
  list_ml_transforms_response

val make_list_ml_transforms_request :
  ?tags:tags_map ->
  ?sort:transform_sort_criteria ->
  ?filter:transform_filter_criteria ->
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  unit ->
  list_ml_transforms_request

val make_list_jobs_response :
  ?next_token:generic_string -> ?job_names:job_name_list -> unit -> list_jobs_response

val make_list_jobs_request :
  ?tags:tags_map ->
  ?max_results:page_size ->
  ?next_token:generic_string ->
  unit ->
  list_jobs_request

val make_iterable_form_list_item :
  ?glossary_terms:glossary_term_id_list ->
  ?description:item_description ->
  ?item_name:item_name ->
  ?item_id:item_id ->
  unit ->
  iterable_form_list_item

val make_list_iterable_forms_response :
  ?next_token:token -> ?items:iterable_form_list_item_list -> unit -> list_iterable_forms_response

val make_list_iterable_forms_request :
  ?next_token:token ->
  ?max_results:page_size ->
  iterable_form_name:iterable_form_name ->
  asset_identifier:asset_id ->
  unit ->
  list_iterable_forms_request

val make_integration_resource_property :
  ?target_processing_properties:target_processing_properties ->
  ?source_processing_properties:source_processing_properties ->
  ?resource_property_arn:string512 ->
  resource_arn:string512 ->
  unit ->
  integration_resource_property

val make_list_integration_resource_properties_response :
  ?marker:string1024 ->
  ?integration_resource_property_list:integration_resource_property_list ->
  unit ->
  list_integration_resource_properties_response

val make_integration_resource_property_filter :
  ?values:integration_resource_property_filter_values ->
  ?name:string128 ->
  unit ->
  integration_resource_property_filter

val make_list_integration_resource_properties_request :
  ?max_records:integration_integer ->
  ?filters:integration_resource_property_filter_list ->
  ?marker:string1024 ->
  unit ->
  list_integration_resource_properties_request

val make_glossary_term_item :
  ?short_description:glossary_short_description ->
  ?name:glossary_term_name ->
  ?id:glossary_term_id ->
  unit ->
  glossary_term_item

val make_list_glossary_terms_response :
  ?next_token:token -> ?items:glossary_term_item_list -> unit -> list_glossary_terms_response

val make_list_glossary_terms_request :
  ?next_token:token ->
  ?max_results:page_size ->
  glossary_identifier:glossary_id ->
  unit ->
  list_glossary_terms_request

val make_glossary_item :
  ?description:metadata_description ->
  ?name:glossary_name ->
  ?id:glossary_id ->
  unit ->
  glossary_item

val make_list_glossaries_response :
  ?next_token:token -> ?items:glossary_item_list -> unit -> list_glossaries_response

val make_list_glossaries_request :
  ?next_token:token -> ?max_results:page_size -> unit -> list_glossaries_request

val make_form_type_item : ?name:form_type_name -> ?id:form_type_id -> unit -> form_type_item

val make_list_form_types_response :
  ?next_token:token -> items:form_type_item_list -> unit -> list_form_types_response

val make_list_form_types_request :
  ?next_token:token -> ?max_results:page_size -> unit -> list_form_types_request

val make_entity :
  ?custom_properties:custom_properties ->
  ?category:category ->
  ?description:entity_description ->
  ?is_parent_entity:is_parent_entity ->
  ?label:entity_label ->
  ?entity_name:entity_name ->
  unit ->
  entity

val make_list_entities_response :
  ?next_token:next_token -> ?entities:entity_list -> unit -> list_entities_response

val make_list_entities_request :
  ?data_store_api_version:api_version ->
  ?next_token:next_token ->
  ?parent_entity_name:entity_name ->
  ?catalog_id:catalog_id_string ->
  ?connection_name:name_string ->
  unit ->
  list_entities_request

val make_list_dev_endpoints_response :
  ?next_token:generic_string ->
  ?dev_endpoint_names:dev_endpoint_name_list ->
  unit ->
  list_dev_endpoints_response

val make_list_dev_endpoints_request :
  ?tags:tags_map ->
  ?max_results:page_size ->
  ?next_token:generic_string ->
  unit ->
  list_dev_endpoints_request

val make_list_data_quality_statistics_response :
  ?next_token:pagination_token ->
  ?statistics:statistic_summary_list ->
  unit ->
  list_data_quality_statistics_response

val make_list_data_quality_statistics_request :
  ?next_token:pagination_token ->
  ?max_results:page_size ->
  ?timestamp_filter:timestamp_filter ->
  ?profile_id:hash_string ->
  ?statistic_id:hash_string ->
  unit ->
  list_data_quality_statistics_request

val make_list_data_quality_statistic_annotations_response :
  ?next_token:pagination_token ->
  ?annotations:annotation_list ->
  unit ->
  list_data_quality_statistic_annotations_response

val make_list_data_quality_statistic_annotations_request :
  ?next_token:pagination_token ->
  ?max_results:page_size ->
  ?timestamp_filter:timestamp_filter ->
  ?profile_id:hash_string ->
  ?statistic_id:hash_string ->
  unit ->
  list_data_quality_statistic_annotations_request

val make_data_quality_target_table :
  ?catalog_id:name_string ->
  database_name:name_string ->
  table_name:name_string ->
  unit ->
  data_quality_target_table

val make_data_quality_ruleset_list_details :
  ?rule_count:nullable_integer ->
  ?recommendation_run_id:hash_string ->
  ?target_table:data_quality_target_table ->
  ?last_modified_on:timestamp ->
  ?created_on:timestamp ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  data_quality_ruleset_list_details

val make_list_data_quality_rulesets_response :
  ?next_token:pagination_token ->
  ?rulesets:data_quality_ruleset_list ->
  unit ->
  list_data_quality_rulesets_response

val make_data_quality_ruleset_filter_criteria :
  ?target_table:data_quality_target_table ->
  ?last_modified_after:timestamp ->
  ?last_modified_before:timestamp ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  data_quality_ruleset_filter_criteria

val make_list_data_quality_rulesets_request :
  ?tags:tags_map ->
  ?filter:data_quality_ruleset_filter_criteria ->
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  unit ->
  list_data_quality_rulesets_request

val make_data_quality_ruleset_evaluation_run_description :
  ?data_source:data_source ->
  ?started_on:timestamp ->
  ?status:task_status_type ->
  ?run_id:hash_string ->
  unit ->
  data_quality_ruleset_evaluation_run_description

val make_list_data_quality_ruleset_evaluation_runs_response :
  ?next_token:pagination_token ->
  ?runs:data_quality_ruleset_evaluation_run_list ->
  unit ->
  list_data_quality_ruleset_evaluation_runs_response

val make_data_quality_ruleset_evaluation_run_filter :
  ?ruleset_name:name_string ->
  ?started_after:timestamp ->
  ?started_before:timestamp ->
  data_source:data_source ->
  unit ->
  data_quality_ruleset_evaluation_run_filter

val make_list_data_quality_ruleset_evaluation_runs_request :
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  ?filter:data_quality_ruleset_evaluation_run_filter ->
  unit ->
  list_data_quality_ruleset_evaluation_runs_request

val make_data_quality_rule_recommendation_run_description :
  ?data_source:data_source ->
  ?started_on:timestamp ->
  ?status:task_status_type ->
  ?run_id:hash_string ->
  unit ->
  data_quality_rule_recommendation_run_description

val make_list_data_quality_rule_recommendation_runs_response :
  ?next_token:pagination_token ->
  ?runs:data_quality_rule_recommendation_run_list ->
  unit ->
  list_data_quality_rule_recommendation_runs_response

val make_data_quality_rule_recommendation_run_filter :
  ?started_after:timestamp ->
  ?started_before:timestamp ->
  data_source:data_source ->
  unit ->
  data_quality_rule_recommendation_run_filter

val make_list_data_quality_rule_recommendation_runs_request :
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  ?filter:data_quality_rule_recommendation_run_filter ->
  unit ->
  list_data_quality_rule_recommendation_runs_request

val make_data_quality_result_description :
  ?started_on:timestamp ->
  ?job_run_id:hash_string ->
  ?job_name:name_string ->
  ?data_source:data_source ->
  ?result_id:hash_string ->
  unit ->
  data_quality_result_description

val make_list_data_quality_results_response :
  ?next_token:pagination_token ->
  results:data_quality_result_description_list ->
  unit ->
  list_data_quality_results_response

val make_data_quality_result_filter_criteria :
  ?started_before:timestamp ->
  ?started_after:timestamp ->
  ?job_run_id:hash_string ->
  ?job_name:name_string ->
  ?data_source:data_source ->
  unit ->
  data_quality_result_filter_criteria

val make_list_data_quality_results_request :
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  ?filter:data_quality_result_filter_criteria ->
  unit ->
  list_data_quality_results_request

val make_custom_entity_type :
  ?context_words:context_words ->
  regex_string:name_string ->
  name:name_string ->
  unit ->
  custom_entity_type

val make_list_custom_entity_types_response :
  ?next_token:pagination_token ->
  ?custom_entity_types:custom_entity_types ->
  unit ->
  list_custom_entity_types_response

val make_list_custom_entity_types_request :
  ?tags:tags_map ->
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  unit ->
  list_custom_entity_types_request

val make_crawler_history :
  ?dpu_hour:non_negative_double ->
  ?message_prefix:message_prefix ->
  ?log_stream:log_stream ->
  ?log_group:log_group ->
  ?error_message:description_string ->
  ?summary:name_string ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?state:crawler_history_state ->
  ?crawl_id:crawl_id ->
  unit ->
  crawler_history

val make_list_crawls_response :
  ?next_token:token -> ?crawls:crawler_history_list -> unit -> list_crawls_response

val make_crawls_filter :
  ?field_value:generic_string ->
  ?filter_operator:filter_operator ->
  ?field_name:field_name ->
  unit ->
  crawls_filter

val make_list_crawls_request :
  ?next_token:token ->
  ?filters:crawls_filter_list ->
  ?max_results:page_size ->
  crawler_name:name_string ->
  unit ->
  list_crawls_request

val make_list_crawlers_response :
  ?next_token:token -> ?crawler_names:crawler_name_list -> unit -> list_crawlers_response

val make_list_crawlers_request :
  ?tags:tags_map -> ?next_token:token -> ?max_results:page_size -> unit -> list_crawlers_request

val make_capabilities :
  supported_compute_environments:compute_environments ->
  supported_data_operations:data_operations ->
  supported_authentication_types:authentication_types ->
  unit ->
  capabilities

val make_connection_type_variant :
  ?logo_url:url_string ->
  ?description:description ->
  ?display_name:display_name ->
  ?connection_type_variant_name:display_name ->
  unit ->
  connection_type_variant

val make_connection_type_brief :
  ?connection_type_variants:connection_type_variant_list ->
  ?logo_url:url_string ->
  ?capabilities:capabilities ->
  ?categories:list_of_string ->
  ?description:description ->
  ?vendor:vendor ->
  ?display_name:display_name ->
  ?connection_type:connection_type ->
  unit ->
  connection_type_brief

val make_list_connection_types_response :
  ?next_token:next_token ->
  ?connection_types:connection_type_list ->
  unit ->
  list_connection_types_response

val make_list_connection_types_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_connection_types_request

val make_list_column_statistics_task_runs_response :
  ?next_token:token ->
  ?column_statistics_task_run_ids:column_statistics_task_run_id_list ->
  unit ->
  list_column_statistics_task_runs_response

val make_list_column_statistics_task_runs_request :
  ?next_token:token -> ?max_results:page_size -> unit -> list_column_statistics_task_runs_request

val make_list_blueprints_response :
  ?next_token:generic_string -> ?blueprints:blueprint_names -> unit -> list_blueprints_response

val make_list_blueprints_request :
  ?tags:tags_map ->
  ?max_results:orchestration_page_size25 ->
  ?next_token:generic_string ->
  unit ->
  list_blueprints_request

val make_asset_type_item : ?name:asset_type_name -> ?id:asset_type_id -> unit -> asset_type_item

val make_list_asset_types_response :
  ?next_token:token -> ?items:asset_type_item_list -> unit -> list_asset_types_response

val make_list_asset_types_request :
  ?next_token:token -> ?max_results:page_size -> unit -> list_asset_types_request

val make_last_crawl_info :
  ?start_time:timestamp ->
  ?message_prefix:message_prefix ->
  ?log_stream:log_stream ->
  ?log_group:log_group ->
  ?error_message:description_string ->
  ?status:last_crawl_status ->
  unit ->
  last_crawl_info

val make_last_active_definition :
  ?blueprint_service_location:generic_string ->
  ?blueprint_location:generic_string ->
  ?parameter_spec:blueprint_parameter_spec ->
  ?last_modified_on:timestamp_value ->
  ?description:generic512_char_string ->
  unit ->
  last_active_definition

val make_json_classifier :
  ?version:version_id ->
  ?last_updated:timestamp ->
  ?creation_time:timestamp ->
  json_path:json_path ->
  name:name_string ->
  unit ->
  json_classifier

val make_job :
  ?profile_name:name_string ->
  ?maintenance_window:maintenance_window ->
  ?source_control_details:source_control_details ->
  ?execution_class:execution_class ->
  ?code_gen_configuration_nodes:code_gen_configuration_nodes ->
  ?glue_version:glue_version_string ->
  ?notification_property:notification_property ->
  ?security_configuration:name_string ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?max_capacity:nullable_double ->
  ?timeout:timeout ->
  ?allocated_capacity:integer_value ->
  ?max_retries:max_retries ->
  ?connections:connections_list ->
  ?non_overridable_arguments:generic_map ->
  ?default_arguments:generic_map ->
  ?command:job_command ->
  ?execution_property:execution_property ->
  ?last_modified_on:timestamp_value ->
  ?created_on:timestamp_value ->
  ?role:role_string ->
  ?log_uri:uri_string ->
  ?description:description_string ->
  ?job_run_queuing_enabled:nullable_boolean ->
  ?job_mode:job_mode ->
  ?name:name_string ->
  unit ->
  job

val make_iterable_form_entry : ?form_type_id:form_type_id -> unit -> iterable_form_entry

val make_iterable_form_item :
  ?attachments:asset_form_map ->
  ?forms:asset_form_map ->
  ?glossary_terms:glossary_term_id_list ->
  ?item_name:item_name ->
  ?item_id:item_id ->
  unit ->
  iterable_form_item

val make_item_error :
  ?message:item_error_message ->
  ?code:item_error_code ->
  ?item_identifier:item_identifier ->
  unit ->
  item_error

val make_integration :
  ?data_filter:string2048 ->
  ?errors:integration_error_list ->
  ?integration_config:integration_config ->
  ?tags:integration_tags_list ->
  ?additional_encryption_context:integration_additional_encryption_context_map ->
  ?kms_key_id:string2048 ->
  ?description:integration_description ->
  create_time:integration_timestamp ->
  status:integration_status ->
  integration_arn:string128 ->
  integration_name:string128 ->
  target_arn:string512 ->
  source_arn:string512 ->
  unit ->
  integration

val make_integration_filter :
  ?values:integration_filter_values -> ?name:string128 -> unit -> integration_filter

val make_datapoint_inclusion_annotation :
  ?inclusion_annotation:inclusion_annotation_value ->
  ?statistic_id:hash_string ->
  ?profile_id:hash_string ->
  unit ->
  datapoint_inclusion_annotation

val make_inbound_integration :
  ?errors:integration_error_list ->
  ?integration_config:integration_config ->
  create_time:integration_timestamp ->
  status:integration_status ->
  integration_arn:string128 ->
  target_arn:string512 ->
  source_arn:string512 ->
  unit ->
  inbound_integration

val make_import_catalog_to_glue_response : unit -> unit

val make_import_catalog_to_glue_request :
  ?catalog_id:catalog_id_string -> unit -> import_catalog_to_glue_request

val make_iceberg_optimization_properties_output :
  ?last_updated_time:timestamp ->
  ?orphan_file_deletion:parameters_map ->
  ?retention:parameters_map ->
  ?compaction:parameters_map ->
  ?role_arn:iam_role_arn ->
  unit ->
  iceberg_optimization_properties_output

val make_grok_classifier :
  ?custom_patterns:custom_patterns ->
  ?version:version_id ->
  ?last_updated:timestamp ->
  ?creation_time:timestamp ->
  grok_pattern:grok_pattern ->
  classification:classification ->
  name:name_string ->
  unit ->
  grok_classifier

val make_glue_policy :
  ?update_time:timestamp ->
  ?create_time:timestamp ->
  ?policy_hash:hash_string ->
  ?policy_in_json:policy_json_string ->
  unit ->
  glue_policy

val make_get_workflow_runs_response :
  ?next_token:generic_string -> ?runs:workflow_runs -> unit -> get_workflow_runs_response

val make_get_workflow_runs_request :
  ?max_results:page_size ->
  ?next_token:generic_string ->
  ?include_graph:nullable_boolean ->
  name:name_string ->
  unit ->
  get_workflow_runs_request

val make_get_workflow_run_response : ?run:workflow_run -> unit -> get_workflow_run_response

val make_get_workflow_run_request :
  ?include_graph:nullable_boolean ->
  run_id:id_string ->
  name:name_string ->
  unit ->
  get_workflow_run_request

val make_get_workflow_run_properties_response :
  ?run_properties:workflow_run_properties -> unit -> get_workflow_run_properties_response

val make_get_workflow_run_properties_request :
  run_id:id_string -> name:name_string -> unit -> get_workflow_run_properties_request

val make_get_workflow_response : ?workflow:workflow -> unit -> get_workflow_response

val make_get_workflow_request :
  ?include_graph:nullable_boolean -> name:name_string -> unit -> get_workflow_request

val make_get_user_defined_functions_response :
  ?next_token:token ->
  ?user_defined_functions:user_defined_function_list ->
  unit ->
  get_user_defined_functions_response

val make_get_user_defined_functions_request :
  ?max_results:catalog_getter_page_size ->
  ?next_token:token ->
  ?function_type:function_type ->
  ?database_name:name_string ->
  ?catalog_id:catalog_id_string ->
  pattern:name_string ->
  unit ->
  get_user_defined_functions_request

val make_get_user_defined_function_response :
  ?user_defined_function:user_defined_function -> unit -> get_user_defined_function_response

val make_get_user_defined_function_request :
  ?catalog_id:catalog_id_string ->
  function_name:name_string ->
  database_name:name_string ->
  unit ->
  get_user_defined_function_request

val make_get_usage_profile_response :
  ?last_modified_on:timestamp_value ->
  ?created_on:timestamp_value ->
  ?configuration:profile_configuration ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  get_usage_profile_response

val make_get_usage_profile_request : name:name_string -> unit -> get_usage_profile_request

val make_column_row_filter :
  ?row_filter_expression:predicate_string -> ?column_name:name_string -> unit -> column_row_filter

val make_get_unfiltered_table_metadata_response :
  ?row_filter:predicate_string ->
  ?permissions:permission_list ->
  ?is_protected:boolean_ ->
  ?resource_arn:arn_string ->
  ?is_materialized_view:boolean_ ->
  ?is_multi_dialect_view:boolean_ ->
  ?query_authorization_id:hash_string ->
  ?cell_filters:column_row_filter_list ->
  ?is_registered_with_lake_formation:boolean_ ->
  ?authorized_columns:name_string_list ->
  ?table:table ->
  unit ->
  get_unfiltered_table_metadata_response

val make_audit_context :
  ?all_columns_requested:nullable_boolean ->
  ?requested_columns:audit_column_names_list ->
  ?additional_audit_context:audit_context_string ->
  unit ->
  audit_context

val make_get_unfiltered_table_metadata_request :
  ?query_session_context:query_session_context ->
  ?permissions:permission_list ->
  ?supported_dialect:supported_dialect ->
  ?root_resource_arn:arn_string ->
  ?parent_resource_arn:arn_string ->
  ?audit_context:audit_context ->
  ?region:value_string ->
  supported_permission_types:permission_type_list ->
  name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  get_unfiltered_table_metadata_request

val make_get_unfiltered_partitions_metadata_response :
  ?next_token:token ->
  ?unfiltered_partitions:unfiltered_partition_list ->
  unit ->
  get_unfiltered_partitions_metadata_response

val make_get_unfiltered_partitions_metadata_request :
  ?query_session_context:query_session_context ->
  ?max_results:page_size ->
  ?segment:segment ->
  ?next_token:token ->
  ?audit_context:audit_context ->
  ?expression:predicate_string ->
  ?region:value_string ->
  supported_permission_types:permission_type_list ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  get_unfiltered_partitions_metadata_request

val make_get_unfiltered_partition_metadata_response :
  ?is_registered_with_lake_formation:boolean_ ->
  ?authorized_columns:name_string_list ->
  ?partition:partition ->
  unit ->
  get_unfiltered_partition_metadata_response

val make_get_unfiltered_partition_metadata_request :
  ?query_session_context:query_session_context ->
  ?audit_context:audit_context ->
  ?region:value_string ->
  supported_permission_types:permission_type_list ->
  partition_values:value_string_list ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  get_unfiltered_partition_metadata_request

val make_get_triggers_response :
  ?next_token:generic_string -> ?triggers:trigger_list -> unit -> get_triggers_response

val make_get_triggers_request :
  ?max_results:orchestration_page_size200 ->
  ?dependent_job_name:name_string ->
  ?next_token:generic_string ->
  unit ->
  get_triggers_request

val make_get_trigger_response : ?trigger:trigger -> unit -> get_trigger_response
val make_get_trigger_request : name:name_string -> unit -> get_trigger_request
val make_get_tags_response : ?tags:tags_map -> unit -> get_tags_response
val make_get_tags_request : resource_arn:glue_resource_arn -> unit -> get_tags_request

val make_get_tables_response :
  ?next_token:token -> ?table_list:table_list -> unit -> get_tables_response

val make_get_tables_request :
  ?attributes_to_get:table_attributes_list ->
  ?include_status_details:boolean_nullable ->
  ?audit_context:audit_context ->
  ?query_as_of_time:timestamp ->
  ?transaction_id:transaction_id_string ->
  ?max_results:catalog_getter_page_size ->
  ?next_token:token ->
  ?expression:filter_string ->
  ?catalog_id:catalog_id_string ->
  database_name:name_string ->
  unit ->
  get_tables_request

val make_get_table_versions_response :
  ?next_token:token ->
  ?table_versions:get_table_versions_list ->
  unit ->
  get_table_versions_response

val make_get_table_versions_request :
  ?audit_context:audit_context ->
  ?max_results:catalog_getter_page_size ->
  ?next_token:token ->
  ?catalog_id:catalog_id_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_table_versions_request

val make_get_table_version_response :
  ?table_version:table_version -> unit -> get_table_version_response

val make_get_table_version_request :
  ?audit_context:audit_context ->
  ?version_id:version_string ->
  ?catalog_id:catalog_id_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_table_version_request

val make_get_table_response : ?table:table -> unit -> get_table_response

val make_get_table_request :
  ?attributes_to_get:table_attributes_list ->
  ?include_status_details:boolean_nullable ->
  ?audit_context:audit_context ->
  ?query_as_of_time:timestamp ->
  ?transaction_id:transaction_id_string ->
  ?catalog_id:catalog_id_string ->
  name:name_string ->
  database_name:name_string ->
  unit ->
  get_table_request

val make_get_table_optimizer_response :
  ?table_optimizer:table_optimizer ->
  ?table_name:name_string ->
  ?database_name:name_string ->
  ?catalog_id:catalog_id_string ->
  unit ->
  get_table_optimizer_response

val make_get_table_optimizer_request :
  type_:table_optimizer_type ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  get_table_optimizer_request

val make_get_statement_response : ?statement:statement -> unit -> get_statement_response

val make_get_statement_request :
  ?request_origin:orchestration_name_string ->
  id:integer_value ->
  session_id:name_string ->
  unit ->
  get_statement_request

val make_get_session_response : ?session:session -> unit -> get_session_response

val make_get_session_request :
  ?request_origin:orchestration_name_string -> id:name_string -> unit -> get_session_request

val make_get_session_endpoint_response :
  spark_connect:session_endpoint -> unit -> get_session_endpoint_response

val make_get_session_endpoint_request :
  session_id:name_string -> unit -> get_session_endpoint_request

val make_get_security_configurations_response :
  ?next_token:generic_string ->
  ?security_configurations:security_configuration_list ->
  unit ->
  get_security_configurations_response

val make_get_security_configurations_request :
  ?next_token:generic_string ->
  ?max_results:page_size ->
  unit ->
  get_security_configurations_request

val make_get_security_configuration_response :
  ?security_configuration:security_configuration -> unit -> get_security_configuration_response

val make_get_security_configuration_request :
  name:name_string -> unit -> get_security_configuration_request

val make_get_schema_versions_diff_response :
  ?diff:schema_definition_diff -> unit -> get_schema_versions_diff_response

val make_get_schema_versions_diff_input :
  schema_diff_type:schema_diff_type ->
  second_schema_version_number:schema_version_number ->
  first_schema_version_number:schema_version_number ->
  schema_id:schema_id ->
  unit ->
  get_schema_versions_diff_input

val make_get_schema_version_response :
  ?created_time:created_timestamp ->
  ?status:schema_version_status ->
  ?version_number:version_long_number ->
  ?schema_arn:glue_resource_arn ->
  ?data_format:data_format ->
  ?schema_definition:schema_definition_string ->
  ?schema_version_id:schema_version_id_string ->
  unit ->
  get_schema_version_response

val make_get_schema_version_input :
  ?schema_version_number:schema_version_number ->
  ?schema_version_id:schema_version_id_string ->
  ?schema_id:schema_id ->
  unit ->
  get_schema_version_input

val make_get_schema_response :
  ?updated_time:updated_timestamp ->
  ?created_time:created_timestamp ->
  ?schema_status:schema_status ->
  ?next_schema_version:version_long_number ->
  ?latest_schema_version:version_long_number ->
  ?schema_checkpoint:schema_checkpoint_number ->
  ?compatibility:compatibility ->
  ?data_format:data_format ->
  ?description:description_string ->
  ?schema_arn:glue_resource_arn ->
  ?schema_name:schema_registry_name_string ->
  ?registry_arn:glue_resource_arn ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  get_schema_response

val make_get_schema_input : schema_id:schema_id -> unit -> get_schema_input

val make_get_schema_by_definition_response :
  ?created_time:created_timestamp ->
  ?status:schema_version_status ->
  ?data_format:data_format ->
  ?schema_arn:glue_resource_arn ->
  ?schema_version_id:schema_version_id_string ->
  unit ->
  get_schema_by_definition_response

val make_get_schema_by_definition_input :
  schema_definition:schema_definition_string ->
  schema_id:schema_id ->
  unit ->
  get_schema_by_definition_input

val make_get_resource_policy_response :
  ?update_time:timestamp ->
  ?create_time:timestamp ->
  ?policy_hash:hash_string ->
  ?policy_in_json:policy_json_string ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  ?resource_arn:glue_resource_arn -> unit -> get_resource_policy_request

val make_get_resource_policies_response :
  ?next_token:token ->
  ?get_resource_policies_response_list:get_resource_policies_response_list ->
  unit ->
  get_resource_policies_response

val make_get_resource_policies_request :
  ?max_results:page_size -> ?next_token:token -> unit -> get_resource_policies_request

val make_get_registry_response :
  ?updated_time:updated_timestamp ->
  ?created_time:created_timestamp ->
  ?status:registry_status ->
  ?description:description_string ->
  ?registry_arn:glue_resource_arn ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  get_registry_response

val make_get_registry_input : registry_id:registry_id -> unit -> get_registry_input

val make_get_plan_response :
  ?scala_code:scala_code -> ?python_script:python_script -> unit -> get_plan_response

val make_catalog_entry :
  table_name:name_string -> database_name:name_string -> unit -> catalog_entry

val make_get_plan_request :
  ?additional_plan_options_map:additional_plan_options_map ->
  ?language:language ->
  ?location:location ->
  ?sinks:catalog_entries ->
  source:catalog_entry ->
  mapping:mapping_list ->
  unit ->
  get_plan_request

val make_get_partitions_response :
  ?next_token:token -> ?partitions:partition_list -> unit -> get_partitions_response

val make_get_partitions_request :
  ?audit_context:audit_context ->
  ?query_as_of_time:timestamp ->
  ?transaction_id:transaction_id_string ->
  ?exclude_column_schema:boolean_nullable ->
  ?max_results:page_size ->
  ?segment:segment ->
  ?next_token:token ->
  ?expression:predicate_string ->
  ?catalog_id:catalog_id_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_partitions_request

val make_get_partition_response : ?partition:partition -> unit -> get_partition_response

val make_get_partition_request :
  ?audit_context:audit_context ->
  ?catalog_id:catalog_id_string ->
  partition_values:value_string_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_partition_request

val make_get_partition_indexes_response :
  ?next_token:token ->
  ?partition_index_descriptor_list:partition_index_descriptor_list ->
  unit ->
  get_partition_indexes_response

val make_get_partition_indexes_request :
  ?next_token:token ->
  ?catalog_id:catalog_id_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_partition_indexes_request

val make_get_materialized_view_refresh_task_run_response :
  ?materialized_view_refresh_task_run:materialized_view_refresh_task_run ->
  unit ->
  get_materialized_view_refresh_task_run_response

val make_get_materialized_view_refresh_task_run_request :
  materialized_view_refresh_task_run_id:uui_dv4 ->
  catalog_id:name_string ->
  unit ->
  get_materialized_view_refresh_task_run_request

val make_get_mapping_response : mapping:mapping_list -> unit -> get_mapping_response

val make_get_mapping_request :
  ?location:location ->
  ?sinks:catalog_entries ->
  source:catalog_entry ->
  unit ->
  get_mapping_request

val make_get_ml_transforms_response :
  ?next_token:pagination_token -> transforms:transform_list -> unit -> get_ml_transforms_response

val make_get_ml_transforms_request :
  ?sort:transform_sort_criteria ->
  ?filter:transform_filter_criteria ->
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  unit ->
  get_ml_transforms_request

val make_get_ml_transform_response :
  ?transform_encryption:transform_encryption ->
  ?max_retries:nullable_integer ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?max_capacity:nullable_double ->
  ?glue_version:glue_version_string ->
  ?role:role_string ->
  ?schema:transform_schema ->
  ?label_count:label_count ->
  ?evaluation_metrics:evaluation_metrics ->
  ?parameters:transform_parameters ->
  ?input_record_tables:glue_tables ->
  ?last_modified_on:timestamp ->
  ?created_on:timestamp ->
  ?status:transform_status_type ->
  ?description:description_string ->
  ?name:name_string ->
  ?transform_id:hash_string ->
  unit ->
  get_ml_transform_response

val make_get_ml_transform_request : transform_id:hash_string -> unit -> get_ml_transform_request

val make_get_ml_task_runs_response :
  ?next_token:pagination_token -> ?task_runs:task_run_list -> unit -> get_ml_task_runs_response

val make_get_ml_task_runs_request :
  ?sort:task_run_sort_criteria ->
  ?filter:task_run_filter_criteria ->
  ?max_results:page_size ->
  ?next_token:pagination_token ->
  transform_id:hash_string ->
  unit ->
  get_ml_task_runs_request

val make_get_ml_task_run_response :
  ?execution_time:execution_time ->
  ?completed_on:timestamp ->
  ?last_modified_on:timestamp ->
  ?started_on:timestamp ->
  ?error_string:generic_string ->
  ?properties:task_run_properties ->
  ?log_group_name:generic_string ->
  ?status:task_status_type ->
  ?task_run_id:hash_string ->
  ?transform_id:hash_string ->
  unit ->
  get_ml_task_run_response

val make_get_ml_task_run_request :
  task_run_id:hash_string -> transform_id:hash_string -> unit -> get_ml_task_run_request

val make_get_jobs_response :
  ?next_token:generic_string -> ?jobs:job_list -> unit -> get_jobs_response

val make_get_jobs_request :
  ?max_results:page_size -> ?next_token:generic_string -> unit -> get_jobs_request

val make_get_job_runs_response :
  ?next_token:generic_string -> ?job_runs:job_run_list -> unit -> get_job_runs_response

val make_get_job_runs_request :
  ?max_results:orchestration_page_size200 ->
  ?next_token:generic_string ->
  job_name:name_string ->
  unit ->
  get_job_runs_request

val make_get_job_run_response : ?job_run:job_run -> unit -> get_job_run_response

val make_get_job_run_request :
  ?predecessors_included:boolean_value ->
  run_id:id_string ->
  job_name:name_string ->
  unit ->
  get_job_run_request

val make_get_job_response : ?job:job -> unit -> get_job_response
val make_get_job_request : job_name:name_string -> unit -> get_job_request

val make_get_job_bookmark_response :
  ?job_bookmark_entry:job_bookmark_entry -> unit -> get_job_bookmark_response

val make_get_job_bookmark_request :
  ?run_id:run_id -> job_name:job_name -> unit -> get_job_bookmark_request

val make_get_integration_table_properties_response :
  ?target_table_config:target_table_config ->
  ?source_table_config:source_table_config ->
  ?table_name:string128 ->
  ?resource_arn:string512 ->
  unit ->
  get_integration_table_properties_response

val make_get_integration_table_properties_request :
  table_name:string128 -> resource_arn:string512 -> unit -> get_integration_table_properties_request

val make_get_integration_resource_property_response :
  ?target_processing_properties:target_processing_properties ->
  ?source_processing_properties:source_processing_properties ->
  ?resource_property_arn:string512 ->
  ?resource_arn:string512 ->
  unit ->
  get_integration_resource_property_response

val make_get_integration_resource_property_request :
  resource_arn:string512 -> unit -> get_integration_resource_property_request

val make_get_glue_identity_center_configuration_response :
  ?user_background_sessions_enabled:nullable_boolean ->
  ?scopes:orchestration_string_list ->
  ?instance_arn:identity_center_instance_arn ->
  ?application_arn:application_arn ->
  unit ->
  get_glue_identity_center_configuration_response

val make_get_glue_identity_center_configuration_request : unit -> unit

val make_get_glossary_term_response :
  ?long_description:glossary_long_description ->
  ?short_description:glossary_short_description ->
  ?name:glossary_term_name ->
  ?glossary_id:glossary_id ->
  ?id:glossary_term_id ->
  unit ->
  get_glossary_term_response

val make_get_glossary_term_request :
  identifier:glossary_term_id -> unit -> get_glossary_term_request

val make_get_glossary_response :
  ?description:metadata_description ->
  ?name:glossary_name ->
  ?id:glossary_id ->
  unit ->
  get_glossary_response

val make_get_glossary_request : identifier:glossary_id -> unit -> get_glossary_request

val make_get_form_type_response :
  ?schema:form_type_schema ->
  ?name:form_type_name ->
  ?id:form_type_id ->
  unit ->
  get_form_type_response

val make_get_form_type_request : identifier:form_type_id -> unit -> get_form_type_request

val make_get_entity_records_response :
  ?next_token:next_token -> ?records:records -> unit -> get_entity_records_response

val make_get_entity_records_request :
  ?selected_fields:selected_fields ->
  ?order_by:Smaws_Lib.Smithy_api.Types.string_ ->
  ?filter_predicate:filter_predicate ->
  ?connection_options:connection_options ->
  ?data_store_api_version:api_version ->
  ?next_token:next_token ->
  ?catalog_id:catalog_id_string ->
  ?connection_name:name_string ->
  limit:limit ->
  entity_name:entity_name ->
  unit ->
  get_entity_records_request

val make_dev_endpoint :
  ?arguments:map_value ->
  ?security_configuration:name_string ->
  ?public_keys:public_keys_list ->
  ?public_key:generic_string ->
  ?last_modified_timestamp:timestamp_value ->
  ?created_timestamp:timestamp_value ->
  ?last_update_status:generic_string ->
  ?failure_reason:generic_string ->
  ?extra_jars_s3_path:generic_string ->
  ?extra_python_libs_s3_path:generic_string ->
  ?vpc_id:generic_string ->
  ?availability_zone:generic_string ->
  ?number_of_nodes:integer_value ->
  ?number_of_workers:nullable_integer ->
  ?glue_version:glue_version_string ->
  ?worker_type:worker_type ->
  ?status:generic_string ->
  ?public_address:generic_string ->
  ?zeppelin_remote_spark_interpreter_port:integer_value ->
  ?private_address:generic_string ->
  ?yarn_endpoint_address:generic_string ->
  ?subnet_id:generic_string ->
  ?security_group_ids:string_list ->
  ?role_arn:role_arn ->
  ?endpoint_name:generic_string ->
  unit ->
  dev_endpoint

val make_get_dev_endpoints_response :
  ?next_token:generic_string ->
  ?dev_endpoints:dev_endpoint_list ->
  unit ->
  get_dev_endpoints_response

val make_get_dev_endpoints_request :
  ?next_token:generic_string -> ?max_results:page_size -> unit -> get_dev_endpoints_request

val make_get_dev_endpoint_response : ?dev_endpoint:dev_endpoint -> unit -> get_dev_endpoint_response
val make_get_dev_endpoint_request : endpoint_name:generic_string -> unit -> get_dev_endpoint_request

val make_code_gen_node :
  ?line_number:integer ->
  args:code_gen_node_args ->
  node_type:code_gen_node_type ->
  id:code_gen_identifier ->
  unit ->
  code_gen_node

val make_code_gen_edge :
  ?target_parameter:code_gen_arg_name ->
  target:code_gen_identifier ->
  source:code_gen_identifier ->
  unit ->
  code_gen_edge

val make_get_dataflow_graph_response :
  ?dag_edges:dag_edges -> ?dag_nodes:dag_nodes -> unit -> get_dataflow_graph_response

val make_get_dataflow_graph_request :
  ?python_script:python_script -> unit -> get_dataflow_graph_request

val make_database :
  ?federated_database:federated_database ->
  ?catalog_id:catalog_id_string ->
  ?target_database:database_identifier ->
  ?create_table_default_permissions:principal_permissions_list ->
  ?create_time:timestamp ->
  ?parameters:parameters_map ->
  ?location_uri:ur_i ->
  ?description:description_string ->
  name:name_string ->
  unit ->
  database

val make_get_databases_response :
  ?next_token:token -> database_list:database_list -> unit -> get_databases_response

val make_get_databases_request :
  ?attributes_to_get:database_attributes_list ->
  ?resource_share_type:resource_share_type ->
  ?max_results:catalog_getter_page_size ->
  ?next_token:token ->
  ?catalog_id:catalog_id_string ->
  unit ->
  get_databases_request

val make_get_database_response : ?database:database -> unit -> get_database_response

val make_get_database_request :
  ?catalog_id:catalog_id_string -> name:name_string -> unit -> get_database_request

val make_get_data_quality_ruleset_response :
  ?data_quality_security_configuration:name_string ->
  ?recommendation_run_id:hash_string ->
  ?last_modified_on:timestamp ->
  ?created_on:timestamp ->
  ?target_table:data_quality_target_table ->
  ?ruleset:data_quality_ruleset_string ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  get_data_quality_ruleset_response

val make_get_data_quality_ruleset_request :
  name:name_string -> unit -> get_data_quality_ruleset_request

val make_get_data_quality_ruleset_evaluation_run_response :
  ?additional_data_sources:data_source_map ->
  ?result_ids:data_quality_result_id_list ->
  ?ruleset_names:ruleset_names ->
  ?execution_time:execution_time ->
  ?completed_on:timestamp ->
  ?last_modified_on:timestamp ->
  ?started_on:timestamp ->
  ?error_string:generic_string ->
  ?status:task_status_type ->
  ?additional_run_options:data_quality_evaluation_run_additional_run_options ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  ?role:role_string ->
  ?data_source:data_source ->
  ?run_id:hash_string ->
  unit ->
  get_data_quality_ruleset_evaluation_run_response

val make_get_data_quality_ruleset_evaluation_run_request :
  run_id:hash_string -> unit -> get_data_quality_ruleset_evaluation_run_request

val make_get_data_quality_rule_recommendation_run_response :
  ?data_quality_security_configuration:name_string ->
  ?created_ruleset_name:name_string ->
  ?recommended_ruleset:data_quality_ruleset_string ->
  ?execution_time:execution_time ->
  ?completed_on:timestamp ->
  ?last_modified_on:timestamp ->
  ?started_on:timestamp ->
  ?error_string:generic_string ->
  ?status:task_status_type ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  ?role:role_string ->
  ?data_source:data_source ->
  ?run_id:hash_string ->
  unit ->
  get_data_quality_rule_recommendation_run_response

val make_get_data_quality_rule_recommendation_run_request :
  run_id:hash_string -> unit -> get_data_quality_rule_recommendation_run_request

val make_data_quality_observation :
  ?metric_based_observation:metric_based_observation ->
  ?description:data_quality_observation_description ->
  unit ->
  data_quality_observation

val make_data_quality_aggregated_metrics :
  ?total_rules_failed:nullable_double ->
  ?total_rules_passed:nullable_double ->
  ?total_rules_processed:nullable_double ->
  ?total_rows_failed:nullable_double ->
  ?total_rows_passed:nullable_double ->
  ?total_rows_processed:nullable_double ->
  unit ->
  data_quality_aggregated_metrics

val make_get_data_quality_result_response :
  ?aggregated_metrics:data_quality_aggregated_metrics ->
  ?observations:data_quality_observations ->
  ?analyzer_results:data_quality_analyzer_results ->
  ?rule_results:data_quality_rule_results ->
  ?ruleset_evaluation_run_id:hash_string ->
  ?job_run_id:hash_string ->
  ?job_name:name_string ->
  ?completed_on:timestamp ->
  ?started_on:timestamp ->
  ?evaluation_context:generic_string ->
  ?ruleset_name:name_string ->
  ?data_source:data_source ->
  ?score:generic_bounded_double ->
  ?profile_id:hash_string ->
  ?result_id:hash_string ->
  unit ->
  get_data_quality_result_response

val make_get_data_quality_result_request :
  result_id:hash_string -> unit -> get_data_quality_result_request

val make_get_data_quality_model_result_response :
  ?model:statistic_model_results ->
  ?completed_on:timestamp ->
  unit ->
  get_data_quality_model_result_response

val make_get_data_quality_model_result_request :
  profile_id:hash_string ->
  statistic_id:hash_string ->
  unit ->
  get_data_quality_model_result_request

val make_get_data_quality_model_response :
  ?failure_reason:hash_string ->
  ?completed_on:timestamp ->
  ?started_on:timestamp ->
  ?status:data_quality_model_status ->
  unit ->
  get_data_quality_model_response

val make_get_data_quality_model_request :
  ?statistic_id:hash_string -> profile_id:hash_string -> unit -> get_data_quality_model_request

val make_get_data_catalog_encryption_settings_response :
  ?data_catalog_encryption_settings:data_catalog_encryption_settings ->
  unit ->
  get_data_catalog_encryption_settings_response

val make_get_data_catalog_encryption_settings_request :
  ?catalog_id:catalog_id_string -> unit -> get_data_catalog_encryption_settings_request

val make_get_dashboard_url_response : url:sensitive_url -> unit -> get_dashboard_url_response

val make_get_dashboard_url_request :
  ?request_origin:orchestration_name_string ->
  resource_type:glue_resource_type ->
  resource_id:name_string ->
  unit ->
  get_dashboard_url_request

val make_get_custom_entity_type_response :
  ?context_words:context_words ->
  ?regex_string:name_string ->
  ?name:name_string ->
  unit ->
  get_custom_entity_type_response

val make_get_custom_entity_type_request : name:name_string -> unit -> get_custom_entity_type_request

val make_crawler :
  ?lake_formation_configuration:lake_formation_configuration ->
  ?crawler_security_configuration:crawler_security_configuration ->
  ?configuration:crawler_configuration ->
  ?version:version_id ->
  ?last_crawl:last_crawl_info ->
  ?last_updated:timestamp ->
  ?creation_time:timestamp ->
  ?crawl_elapsed_time:milliseconds_count ->
  ?schedule:schedule ->
  ?table_prefix:table_prefix ->
  ?state:crawler_state ->
  ?lineage_configuration:lineage_configuration ->
  ?schema_change_policy:schema_change_policy ->
  ?recrawl_policy:recrawl_policy ->
  ?classifiers:classifier_name_list ->
  ?description:description_string ->
  ?database_name:database_name ->
  ?targets:crawler_targets ->
  ?role:role ->
  ?name:name_string ->
  unit ->
  crawler

val make_get_crawlers_response :
  ?next_token:token -> ?crawlers:crawler_list -> unit -> get_crawlers_response

val make_get_crawlers_request :
  ?next_token:token -> ?max_results:page_size -> unit -> get_crawlers_request

val make_get_crawler_response : ?crawler:crawler -> unit -> get_crawler_response
val make_get_crawler_request : name:name_string -> unit -> get_crawler_request

val make_crawler_metrics :
  ?tables_deleted:non_negative_integer ->
  ?tables_updated:non_negative_integer ->
  ?tables_created:non_negative_integer ->
  ?median_runtime_seconds:non_negative_double ->
  ?last_runtime_seconds:non_negative_double ->
  ?still_estimating:boolean_ ->
  ?time_left_seconds:non_negative_double ->
  ?crawler_name:name_string ->
  unit ->
  crawler_metrics

val make_get_crawler_metrics_response :
  ?next_token:token ->
  ?crawler_metrics_list:crawler_metrics_list ->
  unit ->
  get_crawler_metrics_response

val make_get_crawler_metrics_request :
  ?next_token:token ->
  ?max_results:page_size ->
  ?crawler_name_list:crawler_name_list ->
  unit ->
  get_crawler_metrics_request

val make_authentication_configuration :
  ?o_auth2_properties:o_auth2_properties ->
  ?kms_key_arn:kms_key_arn ->
  ?secret_arn:secret_arn ->
  ?authentication_type:authentication_type ->
  unit ->
  authentication_configuration

val make_connection :
  ?compatible_compute_environments:compute_environment_list ->
  ?connection_schema_version:connection_schema_version ->
  ?authentication_configuration:authentication_configuration ->
  ?last_connection_validation_time:timestamp ->
  ?status_reason:long_value_string ->
  ?status:connection_status ->
  ?last_updated_by:name_string ->
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?physical_connection_requirements:physical_connection_requirements ->
  ?python_properties:property_map ->
  ?athena_properties:property_map ->
  ?spark_properties:property_map ->
  ?connection_properties:connection_properties ->
  ?match_criteria:match_criteria ->
  ?connection_type:connection_type ->
  ?description:description_string ->
  ?name:name_string ->
  unit ->
  connection

val make_get_connections_response :
  ?next_token:token -> ?connection_list:connection_list -> unit -> get_connections_response

val make_get_connections_filter :
  ?connection_schema_version:connection_schema_version ->
  ?connection_type:connection_type ->
  ?match_criteria:match_criteria ->
  unit ->
  get_connections_filter

val make_get_connections_request :
  ?max_results:page_size ->
  ?next_token:token ->
  ?hide_password:boolean_ ->
  ?filter:get_connections_filter ->
  ?catalog_id:catalog_id_string ->
  unit ->
  get_connections_request

val make_get_connection_response : ?connection:connection -> unit -> get_connection_response

val make_get_connection_request :
  ?apply_override_for_compute_environment:compute_environment ->
  ?hide_password:boolean_ ->
  ?catalog_id:catalog_id_string ->
  name:name_string ->
  unit ->
  get_connection_request

val make_execution_attempt :
  ?error_message:description_string ->
  ?execution_timestamp:timestamp ->
  ?column_statistics_task_run_id:hash_string ->
  ?status:execution_status ->
  unit ->
  execution_attempt

val make_column_statistics_task_settings :
  ?last_execution_attempt:execution_attempt ->
  ?setting_source:setting_source ->
  ?schedule_type:schedule_type ->
  ?security_configuration:crawler_security_configuration ->
  ?sample_size:sample_size_percentage ->
  ?role:role ->
  ?catalog_i_d:catalog_id_string ->
  ?column_name_list:column_name_list ->
  ?schedule:schedule ->
  ?table_name:table_name ->
  ?database_name:database_name ->
  unit ->
  column_statistics_task_settings

val make_get_column_statistics_task_settings_response :
  ?column_statistics_task_settings:column_statistics_task_settings ->
  unit ->
  get_column_statistics_task_settings_response

val make_get_column_statistics_task_settings_request :
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_column_statistics_task_settings_request

val make_column_statistics_task_run :
  ?dpu_seconds:non_negative_double ->
  ?error_message:description_string ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?last_updated:timestamp ->
  ?creation_time:timestamp ->
  ?status:column_statistics_state ->
  ?computation_type:computation_type ->
  ?worker_type:name_string ->
  ?number_of_workers:positive_integer ->
  ?security_configuration:crawler_security_configuration ->
  ?sample_size:sample_size_percentage ->
  ?role:role ->
  ?catalog_i_d:catalog_id_string ->
  ?column_name_list:column_name_list ->
  ?table_name:table_name ->
  ?database_name:database_name ->
  ?column_statistics_task_run_id:hash_string ->
  ?customer_id:account_id ->
  unit ->
  column_statistics_task_run

val make_get_column_statistics_task_runs_response :
  ?next_token:token ->
  ?column_statistics_task_runs:column_statistics_task_runs_list ->
  unit ->
  get_column_statistics_task_runs_response

val make_get_column_statistics_task_runs_request :
  ?next_token:token ->
  ?max_results:page_size ->
  table_name:name_string ->
  database_name:database_name ->
  unit ->
  get_column_statistics_task_runs_request

val make_get_column_statistics_task_run_response :
  ?column_statistics_task_run:column_statistics_task_run ->
  unit ->
  get_column_statistics_task_run_response

val make_get_column_statistics_task_run_request :
  column_statistics_task_run_id:hash_string -> unit -> get_column_statistics_task_run_request

val make_column_error : ?error:error_detail -> ?column_name:name_string -> unit -> column_error

val make_get_column_statistics_for_table_response :
  ?errors:column_errors ->
  ?column_statistics_list:column_statistics_list ->
  unit ->
  get_column_statistics_for_table_response

val make_get_column_statistics_for_table_request :
  ?catalog_id:catalog_id_string ->
  column_names:get_column_names_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_column_statistics_for_table_request

val make_get_column_statistics_for_partition_response :
  ?errors:column_errors ->
  ?column_statistics_list:column_statistics_list ->
  unit ->
  get_column_statistics_for_partition_response

val make_get_column_statistics_for_partition_request :
  ?catalog_id:catalog_id_string ->
  column_names:get_column_names_list ->
  partition_values:value_string_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  get_column_statistics_for_partition_request

val make_csv_classifier :
  ?serde:csv_serde_option ->
  ?custom_datatypes:custom_datatypes ->
  ?custom_datatype_configured:nullable_boolean ->
  ?allow_single_column:nullable_boolean ->
  ?disable_value_trimming:nullable_boolean ->
  ?header:csv_header ->
  ?contains_header:csv_header_option ->
  ?quote_symbol:csv_quote_symbol ->
  ?delimiter:csv_column_delimiter ->
  ?version:version_id ->
  ?last_updated:timestamp ->
  ?creation_time:timestamp ->
  name:name_string ->
  unit ->
  csv_classifier

val make_classifier :
  ?csv_classifier:csv_classifier ->
  ?json_classifier:json_classifier ->
  ?xml_classifier:xml_classifier ->
  ?grok_classifier:grok_classifier ->
  unit ->
  classifier

val make_get_classifiers_response :
  ?next_token:token -> ?classifiers:classifier_list -> unit -> get_classifiers_response

val make_get_classifiers_request :
  ?next_token:token -> ?max_results:page_size -> unit -> get_classifiers_request

val make_get_classifier_response : ?classifier:classifier -> unit -> get_classifier_response
val make_get_classifier_request : name:name_string -> unit -> get_classifier_request

val make_data_lake_access_properties_output :
  ?catalog_type:name_string ->
  ?status_message:name_string ->
  ?redshift_database_name:name_string ->
  ?managed_workgroup_status:name_string ->
  ?managed_workgroup_name:name_string ->
  ?kms_key:resource_arn_string ->
  ?data_transfer_role:iam_role_arn ->
  ?data_lake_access:boolean_ ->
  unit ->
  data_lake_access_properties_output

val make_catalog_properties_output :
  ?custom_properties:parameters_map ->
  ?iceberg_optimization_properties:iceberg_optimization_properties_output ->
  ?data_lake_access_properties:data_lake_access_properties_output ->
  unit ->
  catalog_properties_output

val make_catalog :
  ?allow_full_table_external_data_access:allow_full_table_external_data_access_enum ->
  ?create_database_default_permissions:principal_permissions_list ->
  ?create_table_default_permissions:principal_permissions_list ->
  ?catalog_properties:catalog_properties_output ->
  ?federated_catalog:federated_catalog ->
  ?target_redshift_catalog:target_redshift_catalog ->
  ?update_time:timestamp ->
  ?create_time:timestamp ->
  ?parameters:parameters_map ->
  ?description:description_string ->
  ?resource_arn:resource_arn_string ->
  ?catalog_id:catalog_id_string ->
  name:catalog_name_string ->
  unit ->
  catalog

val make_get_catalogs_response :
  ?next_token:token -> catalog_list:catalog_list -> unit -> get_catalogs_response

val make_get_catalogs_request :
  ?has_databases:nullable_boolean ->
  ?include_root:nullable_boolean ->
  ?recursive:boolean_ ->
  ?max_results:page_size ->
  ?next_token:token ->
  ?parent_catalog_id:catalog_id_string ->
  unit ->
  get_catalogs_request

val make_get_catalog_response : ?catalog:catalog -> unit -> get_catalog_response
val make_get_catalog_request : catalog_id:catalog_id_string -> unit -> get_catalog_request

val make_catalog_import_status :
  ?imported_by:name_string ->
  ?import_time:timestamp ->
  ?import_completed:boolean_ ->
  unit ->
  catalog_import_status

val make_get_catalog_import_status_response :
  ?import_status:catalog_import_status -> unit -> get_catalog_import_status_response

val make_get_catalog_import_status_request :
  ?catalog_id:catalog_id_string -> unit -> get_catalog_import_status_request

val make_blueprint_run :
  ?role_arn:orchestration_iam_role_arn ->
  ?parameters:blueprint_parameters ->
  ?rollback_error_message:message_string ->
  ?error_message:message_string ->
  ?completed_on:timestamp_value ->
  ?started_on:timestamp_value ->
  ?state:blueprint_run_state ->
  ?workflow_name:name_string ->
  ?run_id:id_string ->
  ?blueprint_name:orchestration_name_string ->
  unit ->
  blueprint_run

val make_get_blueprint_runs_response :
  ?next_token:generic_string ->
  ?blueprint_runs:blueprint_runs ->
  unit ->
  get_blueprint_runs_response

val make_get_blueprint_runs_request :
  ?max_results:page_size ->
  ?next_token:generic_string ->
  blueprint_name:name_string ->
  unit ->
  get_blueprint_runs_request

val make_get_blueprint_run_response :
  ?blueprint_run:blueprint_run -> unit -> get_blueprint_run_response

val make_get_blueprint_run_request :
  run_id:id_string -> blueprint_name:orchestration_name_string -> unit -> get_blueprint_run_request

val make_blueprint :
  ?last_active_definition:last_active_definition ->
  ?error_message:error_string ->
  ?status:blueprint_status ->
  ?blueprint_service_location:generic_string ->
  ?blueprint_location:generic_string ->
  ?parameter_spec:blueprint_parameter_spec ->
  ?last_modified_on:timestamp_value ->
  ?created_on:timestamp_value ->
  ?description:generic512_char_string ->
  ?name:orchestration_name_string ->
  unit ->
  blueprint

val make_get_blueprint_response : ?blueprint:blueprint -> unit -> get_blueprint_response

val make_get_blueprint_request :
  ?include_parameter_spec:nullable_boolean ->
  ?include_blueprint:nullable_boolean ->
  name:name_string ->
  unit ->
  get_blueprint_request

val make_get_asset_type_response :
  ?forms:asset_type_forms_map ->
  ?name:asset_type_name ->
  ?id:asset_type_id ->
  unit ->
  get_asset_type_response

val make_get_asset_type_request : identifier:asset_type_id -> unit -> get_asset_type_request

val make_get_asset_output :
  ?iterable_forms:iterable_form_map ->
  ?attachments:asset_form_map ->
  ?forms:asset_form_map ->
  ?glossary_terms:glossary_term_id_list ->
  ?updated_at:updated_at ->
  ?created_at:created_at ->
  ?description:asset_description ->
  ?name:asset_name ->
  asset_type_id:asset_type_id ->
  id:asset_id ->
  unit ->
  get_asset_output

val make_get_asset_input : identifier:asset_id -> unit -> get_asset_input

val make_field :
  ?custom_properties:custom_properties ->
  ?native_data_type:Smaws_Lib.Smithy_api.Types.string_ ->
  ?parent_field:Smaws_Lib.Smithy_api.Types.string_ ->
  ?supported_filter_operators:field_filter_operators_list ->
  ?supported_values:list_of_string ->
  ?is_default_on_create:bool_ ->
  ?is_upsertable:bool_ ->
  ?is_updateable:bool_ ->
  ?is_createable:bool_ ->
  ?is_partitionable:bool_ ->
  ?is_filterable:bool_ ->
  ?is_retrievable:bool_ ->
  ?is_nullable:bool_ ->
  ?is_primary_key:bool_ ->
  ?field_type:field_data_type ->
  ?description:field_description ->
  ?label:field_label ->
  ?field_name:entity_field_name ->
  unit ->
  field

val make_disassociate_glossary_terms_response :
  ?glossary_terms:glossary_term_id_list ->
  ?asset_identifier:asset_id ->
  unit ->
  disassociate_glossary_terms_response

val make_disassociate_glossary_terms_request :
  ?client_token:hash_string ->
  glossary_term_identifiers:glossary_term_id_list ->
  asset_identifier:asset_id ->
  unit ->
  disassociate_glossary_terms_request

val make_describe_integrations_response :
  ?marker:string128 -> ?integrations:integrations_list -> unit -> describe_integrations_response

val make_describe_integrations_request :
  ?filters:integration_filter_list ->
  ?max_records:integration_integer ->
  ?marker:string128 ->
  ?integration_identifier:string128 ->
  unit ->
  describe_integrations_request

val make_describe_inbound_integrations_response :
  ?marker:string128 ->
  ?inbound_integrations:inbound_integrations_list ->
  unit ->
  describe_inbound_integrations_response

val make_describe_inbound_integrations_request :
  ?target_arn:string512 ->
  ?max_records:integration_integer ->
  ?marker:string128 ->
  ?integration_arn:string128 ->
  unit ->
  describe_inbound_integrations_request

val make_describe_entity_response :
  ?next_token:next_token -> ?fields:fields_list -> unit -> describe_entity_response

val make_describe_entity_request :
  ?data_store_api_version:api_version ->
  ?next_token:next_token ->
  ?catalog_id:catalog_id_string ->
  entity_name:entity_name ->
  connection_name:name_string ->
  unit ->
  describe_entity_request

val make_auth_configuration :
  ?custom_authentication_properties:properties_map ->
  ?basic_authentication_properties:properties_map ->
  ?o_auth2_properties:properties_map ->
  ?secret_arn:property ->
  authentication_type:property ->
  unit ->
  auth_configuration

val make_compute_environment_configuration :
  ?physical_connection_properties_required:bool_ ->
  connection_properties_required_overrides:list_of_string ->
  connection_option_name_overrides:property_name_overrides ->
  connection_property_name_overrides:property_name_overrides ->
  connection_options:properties_map ->
  supported_authentication_types:authentication_types ->
  compute_environment:compute_environment ->
  description:compute_environment_configuration_description_string ->
  name:compute_environment_name ->
  unit ->
  compute_environment_configuration

val make_describe_connection_type_response :
  ?rest_configuration:rest_configuration ->
  ?spark_connection_properties:properties_map ->
  ?python_connection_properties:properties_map ->
  ?athena_connection_properties:properties_map ->
  ?physical_connection_requirements:properties_map ->
  ?compute_environment_configurations:compute_environment_configuration_map ->
  ?authentication_configuration:auth_configuration ->
  ?connection_options:properties_map ->
  ?connection_properties:properties_map ->
  ?capabilities:capabilities ->
  ?description:description ->
  ?connection_type:name_string ->
  unit ->
  describe_connection_type_response

val make_describe_connection_type_request :
  connection_type:name_string -> unit -> describe_connection_type_request

val make_delete_workflow_response : ?name:name_string -> unit -> delete_workflow_response
val make_delete_workflow_request : name:name_string -> unit -> delete_workflow_request
val make_delete_user_defined_function_response : unit -> unit

val make_delete_user_defined_function_request :
  ?catalog_id:catalog_id_string ->
  function_name:name_string ->
  database_name:name_string ->
  unit ->
  delete_user_defined_function_request

val make_delete_usage_profile_response : unit -> unit
val make_delete_usage_profile_request : name:name_string -> unit -> delete_usage_profile_request
val make_delete_trigger_response : ?name:name_string -> unit -> delete_trigger_response
val make_delete_trigger_request : name:name_string -> unit -> delete_trigger_request
val make_delete_table_version_response : unit -> unit

val make_delete_table_version_request :
  ?catalog_id:catalog_id_string ->
  version_id:version_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  delete_table_version_request

val make_delete_table_response : unit -> unit

val make_delete_table_request :
  ?transaction_id:transaction_id_string ->
  ?catalog_id:catalog_id_string ->
  name:name_string ->
  database_name:name_string ->
  unit ->
  delete_table_request

val make_delete_table_optimizer_response : unit -> unit

val make_delete_table_optimizer_request :
  type_:table_optimizer_type ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  delete_table_optimizer_request

val make_delete_session_response : ?id:name_string -> unit -> delete_session_response

val make_delete_session_request :
  ?request_origin:orchestration_name_string -> id:name_string -> unit -> delete_session_request

val make_delete_security_configuration_response : unit -> unit

val make_delete_security_configuration_request :
  name:name_string -> unit -> delete_security_configuration_request

val make_delete_schema_versions_response :
  ?schema_version_errors:schema_version_error_list -> unit -> delete_schema_versions_response

val make_delete_schema_versions_input :
  versions:versions_string -> schema_id:schema_id -> unit -> delete_schema_versions_input

val make_delete_schema_response :
  ?status:schema_status ->
  ?schema_name:schema_registry_name_string ->
  ?schema_arn:glue_resource_arn ->
  unit ->
  delete_schema_response

val make_delete_schema_input : schema_id:schema_id -> unit -> delete_schema_input
val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  ?resource_arn:glue_resource_arn ->
  ?policy_hash_condition:hash_string ->
  unit ->
  delete_resource_policy_request

val make_delete_registry_response :
  ?status:registry_status ->
  ?registry_arn:glue_resource_arn ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  delete_registry_response

val make_delete_registry_input : registry_id:registry_id -> unit -> delete_registry_input
val make_delete_partition_response : unit -> unit

val make_delete_partition_request :
  ?catalog_id:catalog_id_string ->
  partition_values:value_string_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  delete_partition_request

val make_delete_partition_index_response : unit -> unit

val make_delete_partition_index_request :
  ?catalog_id:catalog_id_string ->
  index_name:name_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  delete_partition_index_request

val make_delete_ml_transform_response :
  ?transform_id:hash_string -> unit -> delete_ml_transform_response

val make_delete_ml_transform_request :
  transform_id:hash_string -> unit -> delete_ml_transform_request

val make_delete_job_response : ?job_name:name_string -> unit -> delete_job_response
val make_delete_job_request : job_name:name_string -> unit -> delete_job_request
val make_delete_integration_table_properties_response : unit -> unit

val make_delete_integration_table_properties_request :
  table_name:string128 ->
  resource_arn:string512 ->
  unit ->
  delete_integration_table_properties_request

val make_delete_integration_response :
  ?data_filter:string2048 ->
  ?errors:integration_error_list ->
  ?tags:integration_tags_list ->
  ?additional_encryption_context:integration_additional_encryption_context_map ->
  ?kms_key_id:string2048 ->
  ?description:integration_description ->
  create_time:integration_timestamp ->
  status:integration_status ->
  integration_arn:string128 ->
  integration_name:string128 ->
  target_arn:string512 ->
  source_arn:string512 ->
  unit ->
  delete_integration_response

val make_delete_integration_resource_property_response : unit -> unit

val make_delete_integration_resource_property_request :
  resource_arn:string512 -> unit -> delete_integration_resource_property_request

val make_delete_integration_request :
  integration_identifier:string128 -> unit -> delete_integration_request

val make_delete_glue_identity_center_configuration_response : unit -> unit
val make_delete_glue_identity_center_configuration_request : unit -> unit
val make_delete_glossary_term_response : unit -> unit

val make_delete_glossary_term_request :
  identifier:glossary_term_id -> unit -> delete_glossary_term_request

val make_delete_glossary_response : unit -> unit
val make_delete_glossary_request : identifier:glossary_id -> unit -> delete_glossary_request
val make_delete_form_type_response : unit -> unit
val make_delete_form_type_request : identifier:form_type_id -> unit -> delete_form_type_request
val make_delete_dev_endpoint_response : unit -> unit

val make_delete_dev_endpoint_request :
  endpoint_name:generic_string -> unit -> delete_dev_endpoint_request

val make_delete_database_response : unit -> unit

val make_delete_database_request :
  ?catalog_id:catalog_id_string -> name:name_string -> unit -> delete_database_request

val make_delete_data_quality_ruleset_response : unit -> unit

val make_delete_data_quality_ruleset_request :
  name:name_string -> unit -> delete_data_quality_ruleset_request

val make_delete_custom_entity_type_response :
  ?name:name_string -> unit -> delete_custom_entity_type_response

val make_delete_custom_entity_type_request :
  name:name_string -> unit -> delete_custom_entity_type_request

val make_delete_crawler_response : unit -> unit
val make_delete_crawler_request : name:name_string -> unit -> delete_crawler_request
val make_delete_connection_type_response : unit -> unit

val make_delete_connection_type_request :
  connection_type:name_string -> unit -> delete_connection_type_request

val make_delete_connection_response : unit -> unit

val make_delete_connection_request :
  ?catalog_id:catalog_id_string -> connection_name:name_string -> unit -> delete_connection_request

val make_delete_column_statistics_task_settings_response : unit -> unit

val make_delete_column_statistics_task_settings_request :
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  delete_column_statistics_task_settings_request

val make_delete_column_statistics_for_table_response : unit -> unit

val make_delete_column_statistics_for_table_request :
  ?catalog_id:catalog_id_string ->
  column_name:name_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  delete_column_statistics_for_table_request

val make_delete_column_statistics_for_partition_response : unit -> unit

val make_delete_column_statistics_for_partition_request :
  ?catalog_id:catalog_id_string ->
  column_name:name_string ->
  partition_values:value_string_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  delete_column_statistics_for_partition_request

val make_delete_classifier_response : unit -> unit
val make_delete_classifier_request : name:name_string -> unit -> delete_classifier_request
val make_delete_catalog_response : unit -> unit
val make_delete_catalog_request : catalog_id:catalog_id_string -> unit -> delete_catalog_request
val make_delete_blueprint_response : ?name:name_string -> unit -> delete_blueprint_response
val make_delete_blueprint_request : name:name_string -> unit -> delete_blueprint_request

val make_delete_attachment_response :
  ?asset_identifier:asset_id -> unit -> delete_attachment_response

val make_delete_attachment_request :
  ?item_identifier:item_identifier ->
  ?iterable_form_name:iterable_form_name ->
  attachment_name:attachment_name ->
  asset_identifier:asset_id ->
  unit ->
  delete_attachment_request

val make_delete_asset_type_response : unit -> unit
val make_delete_asset_type_request : identifier:asset_type_id -> unit -> delete_asset_type_request
val make_delete_asset_response : unit -> unit
val make_delete_asset_request : identifier:asset_id -> unit -> delete_asset_request

val make_create_xml_classifier_request :
  ?row_tag:row_tag ->
  name:name_string ->
  classification:classification ->
  unit ->
  create_xml_classifier_request

val make_create_workflow_response : ?name:name_string -> unit -> create_workflow_response

val make_create_workflow_request :
  ?max_concurrent_runs:nullable_integer ->
  ?tags:tags_map ->
  ?default_run_properties:workflow_run_properties ->
  ?description:workflow_description_string ->
  name:name_string ->
  unit ->
  create_workflow_request

val make_create_user_defined_function_response : unit -> unit

val make_create_user_defined_function_request :
  ?catalog_id:catalog_id_string ->
  function_input:user_defined_function_input ->
  database_name:name_string ->
  unit ->
  create_user_defined_function_request

val make_create_usage_profile_response : ?name:name_string -> unit -> create_usage_profile_response

val make_create_usage_profile_request :
  ?tags:tags_map ->
  ?description:description_string ->
  configuration:profile_configuration ->
  name:name_string ->
  unit ->
  create_usage_profile_request

val make_create_trigger_response : ?name:name_string -> unit -> create_trigger_response

val make_create_trigger_request :
  ?event_batching_condition:event_batching_condition ->
  ?tags:tags_map ->
  ?start_on_creation:boolean_value ->
  ?description:description_string ->
  ?predicate:predicate ->
  ?schedule:generic_string ->
  ?workflow_name:name_string ->
  actions:action_list ->
  type_:trigger_type ->
  name:name_string ->
  unit ->
  create_trigger_request

val make_create_table_response : unit -> unit

val make_create_table_request :
  ?open_table_format_input:open_table_format_input ->
  ?transaction_id:transaction_id_string ->
  ?partition_indexes:partition_index_list ->
  ?table_input:table_input ->
  ?name:name_string ->
  ?catalog_id:catalog_id_string ->
  database_name:name_string ->
  unit ->
  create_table_request

val make_create_table_optimizer_response : unit -> unit

val make_create_table_optimizer_request :
  table_optimizer_configuration:table_optimizer_configuration ->
  type_:table_optimizer_type ->
  table_name:name_string ->
  database_name:name_string ->
  catalog_id:catalog_id_string ->
  unit ->
  create_table_optimizer_request

val make_create_session_response : ?session:session -> unit -> create_session_response

val make_create_session_request :
  ?session_type:session_type ->
  ?request_origin:orchestration_name_string ->
  ?tags:tags_map ->
  ?glue_version:glue_version_string ->
  ?security_configuration:name_string ->
  ?worker_type:worker_type ->
  ?number_of_workers:nullable_integer ->
  ?max_capacity:nullable_double ->
  ?connections:connections_list ->
  ?default_arguments:orchestration_arguments_map ->
  ?idle_timeout:timeout ->
  ?timeout:timeout ->
  ?description:description_string ->
  command:session_command ->
  role:orchestration_role_arn ->
  id:name_string ->
  unit ->
  create_session_request

val make_create_security_configuration_response :
  ?created_timestamp:timestamp_value ->
  ?name:name_string ->
  unit ->
  create_security_configuration_response

val make_create_security_configuration_request :
  encryption_configuration:encryption_configuration ->
  name:name_string ->
  unit ->
  create_security_configuration_request

val make_create_script_response :
  ?scala_code:scala_code -> ?python_script:python_script -> unit -> create_script_response

val make_create_script_request :
  ?language:language ->
  ?dag_edges:dag_edges ->
  ?dag_nodes:dag_nodes ->
  unit ->
  create_script_request

val make_create_schema_response :
  ?schema_version_status:schema_version_status ->
  ?schema_version_id:schema_version_id_string ->
  ?tags:tags_map ->
  ?schema_status:schema_status ->
  ?next_schema_version:version_long_number ->
  ?latest_schema_version:version_long_number ->
  ?schema_checkpoint:schema_checkpoint_number ->
  ?compatibility:compatibility ->
  ?data_format:data_format ->
  ?description:description_string ->
  ?schema_arn:glue_resource_arn ->
  ?schema_name:schema_registry_name_string ->
  ?registry_arn:glue_resource_arn ->
  ?registry_name:schema_registry_name_string ->
  unit ->
  create_schema_response

val make_create_schema_input :
  ?schema_definition:schema_definition_string ->
  ?tags:tags_map ->
  ?description:description_string ->
  ?compatibility:compatibility ->
  ?registry_id:registry_id ->
  data_format:data_format ->
  schema_name:schema_registry_name_string ->
  unit ->
  create_schema_input

val make_create_registry_response :
  ?tags:tags_map ->
  ?description:description_string ->
  ?registry_name:schema_registry_name_string ->
  ?registry_arn:glue_resource_arn ->
  unit ->
  create_registry_response

val make_create_registry_input :
  ?tags:tags_map ->
  ?description:description_string ->
  registry_name:schema_registry_name_string ->
  unit ->
  create_registry_input

val make_create_partition_response : unit -> unit

val make_create_partition_request :
  ?catalog_id:catalog_id_string ->
  partition_input:partition_input ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  create_partition_request

val make_create_partition_index_response : unit -> unit

val make_create_partition_index_request :
  ?catalog_id:catalog_id_string ->
  partition_index:partition_index ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  create_partition_index_request

val make_create_ml_transform_response :
  ?transform_id:hash_string -> unit -> create_ml_transform_response

val make_create_ml_transform_request :
  ?transform_encryption:transform_encryption ->
  ?tags:tags_map ->
  ?max_retries:nullable_integer ->
  ?timeout:timeout ->
  ?number_of_workers:nullable_integer ->
  ?worker_type:worker_type ->
  ?max_capacity:nullable_double ->
  ?glue_version:glue_version_string ->
  ?description:description_string ->
  role:role_string ->
  parameters:transform_parameters ->
  input_record_tables:glue_tables ->
  name:name_string ->
  unit ->
  create_ml_transform_request

val make_create_json_classifier_request :
  json_path:json_path -> name:name_string -> unit -> create_json_classifier_request

val make_create_job_response : ?name:name_string -> unit -> create_job_response

val make_create_job_request :
  ?maintenance_window:maintenance_window ->
  ?source_control_details:source_control_details ->
  ?execution_class:execution_class ->
  ?code_gen_configuration_nodes:code_gen_configuration_nodes ->
  ?worker_type:worker_type ->
  ?number_of_workers:nullable_integer ->
  ?glue_version:glue_version_string ->
  ?notification_property:notification_property ->
  ?tags:tags_map ->
  ?security_configuration:name_string ->
  ?max_capacity:nullable_double ->
  ?timeout:timeout ->
  ?allocated_capacity:integer_value ->
  ?max_retries:max_retries ->
  ?connections:connections_list ->
  ?non_overridable_arguments:generic_map ->
  ?default_arguments:generic_map ->
  ?execution_property:execution_property ->
  ?log_uri:uri_string ->
  ?description:description_string ->
  ?job_run_queuing_enabled:nullable_boolean ->
  ?job_mode:job_mode ->
  command:job_command ->
  role:role_string ->
  name:name_string ->
  unit ->
  create_job_request

val make_create_integration_table_properties_response : unit -> unit

val make_create_integration_table_properties_request :
  ?target_table_config:target_table_config ->
  ?source_table_config:source_table_config ->
  table_name:string128 ->
  resource_arn:string512 ->
  unit ->
  create_integration_table_properties_request

val make_create_integration_response :
  ?integration_config:integration_config ->
  ?data_filter:string2048 ->
  ?errors:integration_error_list ->
  ?tags:integration_tags_list ->
  ?additional_encryption_context:integration_additional_encryption_context_map ->
  ?kms_key_id:string2048 ->
  ?description:integration_description ->
  create_time:integration_timestamp ->
  status:integration_status ->
  integration_arn:string128 ->
  integration_name:string128 ->
  target_arn:string512 ->
  source_arn:string512 ->
  unit ->
  create_integration_response

val make_create_integration_resource_property_response :
  ?target_processing_properties:target_processing_properties ->
  ?source_processing_properties:source_processing_properties ->
  ?resource_property_arn:string512 ->
  resource_arn:string512 ->
  unit ->
  create_integration_resource_property_response

val make_create_integration_resource_property_request :
  ?tags:integration_tags_list ->
  ?target_processing_properties:target_processing_properties ->
  ?source_processing_properties:source_processing_properties ->
  resource_arn:string512 ->
  unit ->
  create_integration_resource_property_request

val make_create_integration_request :
  ?integration_config:integration_config ->
  ?tags:integration_tags_list ->
  ?additional_encryption_context:integration_additional_encryption_context_map ->
  ?kms_key_id:string2048 ->
  ?data_filter:string2048 ->
  ?description:integration_description ->
  target_arn:string512 ->
  source_arn:string512 ->
  integration_name:string128 ->
  unit ->
  create_integration_request

val make_create_grok_classifier_request :
  ?custom_patterns:custom_patterns ->
  grok_pattern:grok_pattern ->
  name:name_string ->
  classification:classification ->
  unit ->
  create_grok_classifier_request

val make_create_glue_identity_center_configuration_response :
  ?application_arn:application_arn -> unit -> create_glue_identity_center_configuration_response

val make_create_glue_identity_center_configuration_request :
  ?user_background_sessions_enabled:nullable_boolean ->
  ?scopes:identity_center_scopes_list ->
  instance_arn:identity_center_instance_arn ->
  unit ->
  create_glue_identity_center_configuration_request

val make_create_glossary_term_response :
  ?long_description:glossary_long_description ->
  ?short_description:glossary_short_description ->
  ?name:glossary_term_name ->
  ?glossary_id:glossary_id ->
  ?id:glossary_term_id ->
  unit ->
  create_glossary_term_response

val make_create_glossary_term_request :
  ?client_token:hash_string ->
  ?long_description:glossary_long_description ->
  ?short_description:glossary_short_description ->
  name:glossary_term_name ->
  glossary_identifier:glossary_id ->
  unit ->
  create_glossary_term_request

val make_create_glossary_response :
  ?description:metadata_description ->
  ?name:glossary_name ->
  ?id:glossary_id ->
  unit ->
  create_glossary_response

val make_create_glossary_request :
  ?client_token:hash_string ->
  ?description:metadata_description ->
  name:glossary_name ->
  unit ->
  create_glossary_request

val make_create_dev_endpoint_response :
  ?arguments:map_value ->
  ?created_timestamp:timestamp_value ->
  ?security_configuration:name_string ->
  ?failure_reason:generic_string ->
  ?extra_jars_s3_path:generic_string ->
  ?extra_python_libs_s3_path:generic_string ->
  ?vpc_id:generic_string ->
  ?availability_zone:generic_string ->
  ?number_of_workers:nullable_integer ->
  ?glue_version:glue_version_string ->
  ?worker_type:worker_type ->
  ?number_of_nodes:integer_value ->
  ?zeppelin_remote_spark_interpreter_port:integer_value ->
  ?yarn_endpoint_address:generic_string ->
  ?role_arn:role_arn ->
  ?subnet_id:generic_string ->
  ?security_group_ids:string_list ->
  ?status:generic_string ->
  ?endpoint_name:generic_string ->
  unit ->
  create_dev_endpoint_response

val make_create_dev_endpoint_request :
  ?arguments:map_value ->
  ?tags:tags_map ->
  ?security_configuration:name_string ->
  ?extra_jars_s3_path:generic_string ->
  ?extra_python_libs_s3_path:generic_string ->
  ?number_of_workers:nullable_integer ->
  ?glue_version:glue_version_string ->
  ?worker_type:worker_type ->
  ?number_of_nodes:integer_value ->
  ?public_keys:public_keys_list ->
  ?public_key:generic_string ->
  ?subnet_id:generic_string ->
  ?security_group_ids:string_list ->
  role_arn:role_arn ->
  endpoint_name:generic_string ->
  unit ->
  create_dev_endpoint_request

val make_create_database_response : unit -> unit

val make_create_database_request :
  ?tags:tags_map ->
  ?catalog_id:catalog_id_string ->
  database_input:database_input ->
  unit ->
  create_database_request

val make_create_data_quality_ruleset_response :
  ?name:name_string -> unit -> create_data_quality_ruleset_response

val make_create_data_quality_ruleset_request :
  ?client_token:hash_string ->
  ?data_quality_security_configuration:name_string ->
  ?target_table:data_quality_target_table ->
  ?tags:tags_map ->
  ?description:description_string ->
  ruleset:data_quality_ruleset_string ->
  name:name_string ->
  unit ->
  create_data_quality_ruleset_request

val make_create_custom_entity_type_response :
  ?name:name_string -> unit -> create_custom_entity_type_response

val make_create_custom_entity_type_request :
  ?tags:tags_map ->
  ?context_words:context_words ->
  regex_string:name_string ->
  name:name_string ->
  unit ->
  create_custom_entity_type_request

val make_create_csv_classifier_request :
  ?serde:csv_serde_option ->
  ?custom_datatypes:custom_datatypes ->
  ?custom_datatype_configured:nullable_boolean ->
  ?allow_single_column:nullable_boolean ->
  ?disable_value_trimming:nullable_boolean ->
  ?header:csv_header ->
  ?contains_header:csv_header_option ->
  ?quote_symbol:csv_quote_symbol ->
  ?delimiter:csv_column_delimiter ->
  name:name_string ->
  unit ->
  create_csv_classifier_request

val make_create_crawler_response : unit -> unit

val make_create_crawler_request :
  ?tags:tags_map ->
  ?crawler_security_configuration:crawler_security_configuration ->
  ?configuration:crawler_configuration ->
  ?lake_formation_configuration:lake_formation_configuration ->
  ?lineage_configuration:lineage_configuration ->
  ?recrawl_policy:recrawl_policy ->
  ?schema_change_policy:schema_change_policy ->
  ?table_prefix:table_prefix ->
  ?classifiers:classifier_name_list ->
  ?schedule:cron_expression ->
  ?description:description_string ->
  ?database_name:database_name ->
  targets:crawler_targets ->
  role:role ->
  name:name_string ->
  unit ->
  create_crawler_request

val make_create_connection_response :
  ?create_connection_status:connection_status -> unit -> create_connection_response

val make_create_connection_request :
  ?tags:tags_map ->
  ?catalog_id:catalog_id_string ->
  connection_input:connection_input ->
  unit ->
  create_connection_request

val make_create_column_statistics_task_settings_response : unit -> unit

val make_create_column_statistics_task_settings_request :
  ?tags:tags_map ->
  ?security_configuration:name_string ->
  ?catalog_i_d:name_string ->
  ?sample_size:sample_size_percentage ->
  ?column_name_list:column_name_list ->
  ?schedule:cron_expression ->
  role:name_string ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  create_column_statistics_task_settings_request

val make_create_classifier_response : unit -> unit

val make_create_classifier_request :
  ?csv_classifier:create_csv_classifier_request ->
  ?json_classifier:create_json_classifier_request ->
  ?xml_classifier:create_xml_classifier_request ->
  ?grok_classifier:create_grok_classifier_request ->
  unit ->
  create_classifier_request

val make_create_catalog_response : unit -> unit

val make_create_catalog_request :
  ?tags:tags_map ->
  catalog_input:catalog_input ->
  name:catalog_name_string ->
  unit ->
  create_catalog_request

val make_create_blueprint_response : ?name:name_string -> unit -> create_blueprint_response

val make_create_blueprint_request :
  ?tags:tags_map ->
  ?description:generic512_char_string ->
  blueprint_location:orchestration_s3_location ->
  name:orchestration_name_string ->
  unit ->
  create_blueprint_request

val make_check_schema_version_validity_response :
  ?error:schema_validation_error ->
  ?valid:is_version_valid ->
  unit ->
  check_schema_version_validity_response

val make_check_schema_version_validity_input :
  schema_definition:schema_definition_string ->
  data_format:data_format ->
  unit ->
  check_schema_version_validity_input

val make_cancel_statement_response : unit -> unit

val make_cancel_statement_request :
  ?request_origin:orchestration_name_string ->
  id:integer_value ->
  session_id:name_string ->
  unit ->
  cancel_statement_request

val make_cancel_ml_task_run_response :
  ?status:task_status_type ->
  ?task_run_id:hash_string ->
  ?transform_id:hash_string ->
  unit ->
  cancel_ml_task_run_response

val make_cancel_ml_task_run_request :
  task_run_id:hash_string -> transform_id:hash_string -> unit -> cancel_ml_task_run_request

val make_cancel_data_quality_ruleset_evaluation_run_response : unit -> unit

val make_cancel_data_quality_ruleset_evaluation_run_request :
  run_id:hash_string -> unit -> cancel_data_quality_ruleset_evaluation_run_request

val make_cancel_data_quality_rule_recommendation_run_response : unit -> unit

val make_cancel_data_quality_rule_recommendation_run_request :
  run_id:hash_string -> unit -> cancel_data_quality_rule_recommendation_run_request

val make_batch_update_partition_failure_entry :
  ?error_detail:error_detail ->
  ?partition_value_list:bounded_partition_value_list ->
  unit ->
  batch_update_partition_failure_entry

val make_batch_update_partition_response :
  ?errors:batch_update_partition_failure_list -> unit -> batch_update_partition_response

val make_batch_update_partition_request_entry :
  partition_input:partition_input ->
  partition_value_list:bounded_partition_value_list ->
  unit ->
  batch_update_partition_request_entry

val make_batch_update_partition_request :
  ?catalog_id:catalog_id_string ->
  entries:batch_update_partition_request_entry_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  batch_update_partition_request

val make_batch_table_optimizer :
  ?table_optimizer:table_optimizer ->
  ?table_name:table_name_string ->
  ?database_name:database_name_string ->
  ?catalog_id:catalog_id_string ->
  unit ->
  batch_table_optimizer

val make_batch_stop_job_run_successful_submission :
  ?job_run_id:id_string -> ?job_name:name_string -> unit -> batch_stop_job_run_successful_submission

val make_batch_stop_job_run_error :
  ?error_detail:error_detail ->
  ?job_run_id:id_string ->
  ?job_name:name_string ->
  unit ->
  batch_stop_job_run_error

val make_batch_stop_job_run_response :
  ?errors:batch_stop_job_run_error_list ->
  ?successful_submissions:batch_stop_job_run_successful_submission_list ->
  unit ->
  batch_stop_job_run_response

val make_batch_stop_job_run_request :
  job_run_ids:batch_stop_job_run_job_run_id_list ->
  job_name:name_string ->
  unit ->
  batch_stop_job_run_request

val make_annotation_error :
  ?failure_reason:description_string ->
  ?statistic_id:hash_string ->
  ?profile_id:hash_string ->
  unit ->
  annotation_error

val make_batch_put_data_quality_statistic_annotation_response :
  ?failed_inclusion_annotations:annotation_error_list ->
  unit ->
  batch_put_data_quality_statistic_annotation_response

val make_batch_put_data_quality_statistic_annotation_request :
  ?client_token:hash_string ->
  inclusion_annotations:inclusion_annotation_list ->
  unit ->
  batch_put_data_quality_statistic_annotation_request

val make_batch_get_workflows_response :
  ?missing_workflows:workflow_names -> ?workflows:workflows -> unit -> batch_get_workflows_response

val make_batch_get_workflows_request :
  ?include_graph:nullable_boolean -> names:workflow_names -> unit -> batch_get_workflows_request

val make_batch_get_triggers_response :
  ?triggers_not_found:trigger_name_list ->
  ?triggers:trigger_list ->
  unit ->
  batch_get_triggers_response

val make_batch_get_triggers_request :
  trigger_names:trigger_name_list -> unit -> batch_get_triggers_request

val make_batch_get_table_optimizer_error :
  ?type_:table_optimizer_type ->
  ?table_name:table_name_string ->
  ?database_name:database_name_string ->
  ?catalog_id:catalog_id_string ->
  ?error:error_detail ->
  unit ->
  batch_get_table_optimizer_error

val make_batch_get_table_optimizer_response :
  ?failures:batch_get_table_optimizer_errors ->
  ?table_optimizers:batch_table_optimizers ->
  unit ->
  batch_get_table_optimizer_response

val make_batch_get_table_optimizer_entry :
  ?type_:table_optimizer_type ->
  ?table_name:table_name_string ->
  ?database_name:database_name_string ->
  ?catalog_id:catalog_id_string ->
  unit ->
  batch_get_table_optimizer_entry

val make_batch_get_table_optimizer_request :
  entries:batch_get_table_optimizer_entries -> unit -> batch_get_table_optimizer_request

val make_batch_get_partition_response :
  ?unprocessed_keys:batch_get_partition_value_list ->
  ?partitions:partition_list ->
  unit ->
  batch_get_partition_response

val make_batch_get_partition_request :
  ?query_session_context:query_session_context ->
  ?audit_context:audit_context ->
  ?catalog_id:catalog_id_string ->
  partitions_to_get:batch_get_partition_value_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  batch_get_partition_request

val make_batch_get_jobs_response :
  ?jobs_not_found:job_name_list -> ?jobs:job_list -> unit -> batch_get_jobs_response

val make_batch_get_jobs_request : job_names:job_name_list -> unit -> batch_get_jobs_request

val make_batch_get_iterable_forms_response :
  ?errors:item_error_list ->
  ?items:iterable_form_item_list ->
  unit ->
  batch_get_iterable_forms_response

val make_batch_get_iterable_forms_request :
  item_identifiers:item_identifier_list ->
  iterable_form_name:iterable_form_name ->
  asset_identifier:asset_id ->
  unit ->
  batch_get_iterable_forms_request

val make_batch_get_dev_endpoints_response :
  ?dev_endpoints_not_found:dev_endpoint_names ->
  ?dev_endpoints:dev_endpoint_list ->
  unit ->
  batch_get_dev_endpoints_response

val make_batch_get_dev_endpoints_request :
  dev_endpoint_names:dev_endpoint_names -> unit -> batch_get_dev_endpoints_request

val make_batch_get_data_quality_result_response :
  ?results_not_found:data_quality_result_ids ->
  results:data_quality_results_list ->
  unit ->
  batch_get_data_quality_result_response

val make_batch_get_data_quality_result_request :
  result_ids:data_quality_result_ids -> unit -> batch_get_data_quality_result_request

val make_batch_get_custom_entity_types_response :
  ?custom_entity_types_not_found:custom_entity_type_names ->
  ?custom_entity_types:custom_entity_types ->
  unit ->
  batch_get_custom_entity_types_response

val make_batch_get_custom_entity_types_request :
  names:custom_entity_type_names -> unit -> batch_get_custom_entity_types_request

val make_batch_get_crawlers_response :
  ?crawlers_not_found:crawler_name_list ->
  ?crawlers:crawler_list ->
  unit ->
  batch_get_crawlers_response

val make_batch_get_crawlers_request :
  crawler_names:crawler_name_list -> unit -> batch_get_crawlers_request

val make_batch_get_blueprints_response :
  ?missing_blueprints:blueprint_names ->
  ?blueprints:blueprints ->
  unit ->
  batch_get_blueprints_response

val make_batch_get_blueprints_request :
  ?include_parameter_spec:nullable_boolean ->
  ?include_blueprint:nullable_boolean ->
  names:batch_get_blueprint_names ->
  unit ->
  batch_get_blueprints_request

val make_batch_delete_table_version_response :
  ?errors:table_version_errors -> unit -> batch_delete_table_version_response

val make_batch_delete_table_version_request :
  ?catalog_id:catalog_id_string ->
  version_ids:batch_delete_table_version_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  batch_delete_table_version_request

val make_batch_delete_table_response : ?errors:table_errors -> unit -> batch_delete_table_response

val make_batch_delete_table_request :
  ?transaction_id:transaction_id_string ->
  ?catalog_id:catalog_id_string ->
  tables_to_delete:batch_delete_table_name_list ->
  database_name:name_string ->
  unit ->
  batch_delete_table_request

val make_batch_delete_partition_response :
  ?errors:partition_errors -> unit -> batch_delete_partition_response

val make_batch_delete_partition_request :
  ?catalog_id:catalog_id_string ->
  partitions_to_delete:batch_delete_partition_value_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  batch_delete_partition_request

val make_batch_delete_connection_response :
  ?errors:error_by_name -> ?succeeded:name_string_list -> unit -> batch_delete_connection_response

val make_batch_delete_connection_request :
  ?catalog_id:catalog_id_string ->
  connection_name_list:delete_connection_name_list ->
  unit ->
  batch_delete_connection_request

val make_batch_create_partition_response :
  ?errors:partition_errors -> unit -> batch_create_partition_response

val make_batch_create_partition_request :
  ?catalog_id:catalog_id_string ->
  partition_input_list:partition_input_list ->
  table_name:name_string ->
  database_name:name_string ->
  unit ->
  batch_create_partition_request

val make_associate_glossary_terms_response :
  ?glossary_terms:glossary_term_id_list ->
  ?asset_identifier:asset_id ->
  unit ->
  associate_glossary_terms_response

val make_associate_glossary_terms_request :
  ?client_token:hash_string ->
  glossary_term_identifiers:glossary_term_id_list ->
  asset_identifier:asset_id ->
  unit ->
  associate_glossary_terms_request
(** {1:operations Operations} *)

module AssociateGlossaryTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_glossary_terms_request ->
    ( associate_glossary_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_glossary_terms_request ->
    ( associate_glossary_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates one or more glossary terms with an asset in Glue Data Catalog.\n"]

module BatchCreatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_partition_request ->
    ( batch_create_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_partition_request ->
    ( batch_create_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates one or more partitions in a batch operation.\n"]

module BatchDeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_connection_request ->
    ( batch_delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_connection_request ->
    ( batch_delete_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a list of connection definitions from the Data Catalog.\n"]

module BatchDeletePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_partition_request ->
    ( batch_delete_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_partition_request ->
    ( batch_delete_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes one or more partitions in a batch operation.\n"]

module BatchDeleteTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_request ->
    ( batch_delete_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_request ->
    ( batch_delete_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes multiple tables at once.\n\n\
  \  After completing this operation, you no longer have access to the table versions and \
   partitions that belong to the deleted table. Glue deletes these \"orphaned\" resources \
   asynchronously in a timely manner, at the discretion of the service.\n\
  \  \n\
  \   To ensure the immediate deletion of all related resources, before calling \
   [BatchDeleteTable], use [DeleteTableVersion] or [BatchDeleteTableVersion], and \
   [DeletePartition] or [BatchDeletePartition], to delete any resources that belong to the table.\n\
  \   \n\
  \    "]

module BatchDeleteTableVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_version_request ->
    ( batch_delete_table_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_table_version_request ->
    ( batch_delete_table_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified batch of versions of a table.\n"]

module BatchGetBlueprints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_blueprints_request ->
    ( batch_get_blueprints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_blueprints_request ->
    ( batch_get_blueprints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a list of blueprints.\n"]

module BatchGetCrawlers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_crawlers_request ->
    ( batch_get_crawlers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_crawlers_request ->
    ( batch_get_crawlers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of crawler names. After calling the \
   [ListCrawlers] operation, you can call this operation to access the data to which you have been \
   granted permissions. This operation supports all IAM permissions, including permission \
   conditions that uses tags.\n"]

module BatchGetCustomEntityTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_custom_entity_types_request ->
    ( batch_get_custom_entity_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_custom_entity_types_request ->
    ( batch_get_custom_entity_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details for the custom patterns specified by a list of names.\n"]

module BatchGetDataQualityResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_data_quality_result_request ->
    ( batch_get_data_quality_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_data_quality_result_request ->
    ( batch_get_data_quality_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of data quality results for the specified result IDs.\n"]

module BatchGetDevEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_dev_endpoints_request ->
    ( batch_get_dev_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_dev_endpoints_request ->
    ( batch_get_dev_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of development endpoint names. After \
   calling the [ListDevEndpoints] operation, you can call this operation to access the data to \
   which you have been granted permissions. This operation supports all IAM permissions, including \
   permission conditions that uses tags.\n"]

module BatchGetIterableForms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_iterable_forms_request ->
    ( batch_get_iterable_forms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_iterable_forms_request ->
    ( batch_get_iterable_forms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves multiple items from an iterable form on an asset in Glue Data Catalog in a single \
   request.\n"]

module BatchGetJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_jobs_request ->
    ( batch_get_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_jobs_request ->
    ( batch_get_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of job names. After calling the [ListJobs] \
   operation, you can call this operation to access the data to which you have been granted \
   permissions. This operation supports all IAM permissions, including permission conditions that \
   uses tags. \n"]

module BatchGetPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_partition_request ->
    ( batch_get_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_partition_request ->
    ( batch_get_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves partitions in a batch request.\n"]

module BatchGetTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_table_optimizer_request ->
    ( batch_get_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_table_optimizer_request ->
    ( batch_get_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the configuration for the specified table optimizers.\n"]

module BatchGetTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_triggers_request ->
    ( batch_get_triggers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_triggers_request ->
    ( batch_get_triggers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of trigger names. After calling the \
   [ListTriggers] operation, you can call this operation to access the data to which you have been \
   granted permissions. This operation supports all IAM permissions, including permission \
   conditions that uses tags.\n"]

module BatchGetWorkflows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_workflows_request ->
    ( batch_get_workflows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_workflows_request ->
    ( batch_get_workflows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of resource metadata for a given list of workflow names. After calling the \
   [ListWorkflows] operation, you can call this operation to access the data to which you have \
   been granted permissions. This operation supports all IAM permissions, including permission \
   conditions that uses tags.\n"]

module BatchPutDataQualityStatisticAnnotation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_put_data_quality_statistic_annotation_request ->
    ( batch_put_data_quality_statistic_annotation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_put_data_quality_statistic_annotation_request ->
    ( batch_put_data_quality_statistic_annotation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Annotate datapoints over time for a specific data quality statistic. The API requires both \
   profileID and statisticID as part of the InclusionAnnotation input. The API only works for a \
   single statisticId across multiple profiles.\n"]

module BatchStopJobRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_stop_job_run_request ->
    ( batch_stop_job_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_stop_job_run_request ->
    ( batch_stop_job_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops one or more job runs for a specified job definition.\n"]

module BatchUpdatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_update_partition_request ->
    ( batch_update_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_update_partition_request ->
    ( batch_update_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates one or more partitions in a batch operation.\n"]

module CancelDataQualityRuleRecommendationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_rule_recommendation_run_request ->
    ( cancel_data_quality_rule_recommendation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_rule_recommendation_run_request ->
    ( cancel_data_quality_rule_recommendation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels the specified recommendation run that was being used to generate rules.\n"]

module CancelDataQualityRulesetEvaluationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_ruleset_evaluation_run_request ->
    ( cancel_data_quality_ruleset_evaluation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_data_quality_ruleset_evaluation_run_request ->
    ( cancel_data_quality_ruleset_evaluation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels a run where a ruleset is being evaluated against a data source.\n"]

module CancelMLTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_ml_task_run_request ->
    ( cancel_ml_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_ml_task_run_request ->
    ( cancel_ml_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels (stops) a task run. Machine learning task runs are asynchronous tasks that Glue runs on \
   your behalf as part of various machine learning workflows. You can cancel a machine learning \
   task run at any time by calling [CancelMLTaskRun] with a task run's parent transform's \
   [TransformID] and the task run's [TaskRunId]. \n"]

module CancelStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_statement_request ->
    ( cancel_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_statement_request ->
    ( cancel_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Cancels the statement.\n"]

module CheckSchemaVersionValidity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_schema_version_validity_input ->
    ( check_schema_version_validity_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_schema_version_validity_input ->
    ( check_schema_version_validity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Validates the supplied schema. This call has no side effects, it simply validates using the \
   supplied schema using [DataFormat] as the format. Since it does not take a schema set name, no \
   compatibility checks are performed.\n"]

module CreateBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_blueprint_request ->
    ( create_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_blueprint_request ->
    ( create_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Registers a blueprint with Glue.\n"]

module CreateCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_catalog_request ->
    ( create_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_catalog_request ->
    ( create_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new catalog in the Glue Data Catalog.\n"]

module CreateClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_classifier_request ->
    ( create_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_classifier_request ->
    ( create_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a classifier in the user's account. This can be a [GrokClassifier], an [XMLClassifier], \
   a [JsonClassifier], or a [CsvClassifier], depending on which field of the request is present.\n"]

module CreateColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_column_statistics_task_settings_request ->
    ( create_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_column_statistics_task_settings_request ->
    ( create_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates settings for a column statistics task.\n"]

module CreateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_connection_request ->
    ( create_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a connection definition in the Data Catalog.\n\n\
  \ Connections used for creating federated resources require the IAM [glue:PassConnection] \
   permission.\n\
  \ "]

module CreateCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_crawler_request ->
    ( create_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_crawler_request ->
    ( create_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new crawler with specified targets, role, configuration, and optional schedule. At \
   least one crawl target must be specified, in the [s3Targets] field, the [jdbcTargets] field, or \
   the [DynamoDBTargets] field.\n"]

module CreateCustomEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_entity_type_request ->
    ( create_custom_entity_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_entity_type_request ->
    ( create_custom_entity_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a custom pattern that is used to detect sensitive data across the columns and rows of \
   your structured data.\n\n\
  \ Each custom pattern you create specifies a regular expression and an optional list of context \
   words. If no context words are passed only a regular expression is checked.\n\
  \ "]

module CreateDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_quality_ruleset_request ->
    ( create_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_quality_ruleset_request ->
    ( create_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a data quality ruleset with DQDL rules applied to a specified Glue table.\n\n\
  \ You create the ruleset using the Data Quality Definition Language (DQDL). For more \
   information, see the Glue developer guide.\n\
  \ "]

module CreateDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_database_request ->
    ( create_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_database_request ->
    ( create_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `FederatedResourceAlreadyExistsException of federated_resource_already_exists_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new database in a Data Catalog.\n"]

module CreateDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dev_endpoint_request ->
    ( create_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dev_endpoint_request ->
    ( create_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new development endpoint.\n"]

module CreateGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_request ->
    ( create_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_request ->
    ( create_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a business glossary in Glue Data Catalog. A glossary is a container for glossary terms \
   that define business concepts.\n"]

module CreateGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_term_request ->
    ( create_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_glossary_term_request ->
    ( create_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a glossary term within a business glossary in Glue Data Catalog.\n"]

module CreateGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_glue_identity_center_configuration_request ->
    ( create_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_glue_identity_center_configuration_request ->
    ( create_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Glue Identity Center configuration to enable integration between Glue and Amazon \
   Web Services IAM Identity Center for authentication and authorization.\n"]

module CreateIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_request ->
    ( create_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_request ->
    ( create_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationQuotaExceededFault of integration_quota_exceeded_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `KMSKeyNotAccessibleFault of kms_key_not_accessible_fault
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Zero-ETL integration in the caller's account between two resources with Amazon \
   Resource Names (ARNs): the [SourceArn] and [TargetArn].\n"]

module CreateIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_resource_property_request ->
    ( create_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_resource_property_request ->
    ( create_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API can be used for setting up the [ResourceProperty] of the Glue connection (for the \
   source) or Glue database ARN (for the target). These properties can include the role to access \
   the connection or database. To set both source and target properties the same API needs to be \
   invoked with the Glue connection ARN as [ResourceArn] with [SourceProcessingProperties] and the \
   Glue database ARN as [ResourceArn] with [TargetProcessingProperties] respectively.\n"]

module CreateIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_integration_table_properties_request ->
    ( create_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_integration_table_properties_request ->
    ( create_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to provide optional override properties for the the tables that need to be \
   replicated. These properties can include properties for filtering and partitioning for the \
   source and target tables. To set both source and target properties the same API need to be \
   invoked with the Glue connection ARN as [ResourceArn] with [SourceTableConfig], and the Glue \
   database ARN as [ResourceArn] with [TargetTableConfig] respectively.\n"]

module CreateJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_job_request ->
    ( create_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_job_request ->
    ( create_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new job definition.\n"]

module CreateMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ml_transform_request ->
    ( create_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ml_transform_request ->
    ( create_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Glue machine learning transform. This operation creates the transform and all the \
   necessary parameters to train it.\n\n\
  \ Call this operation as the first step in the process of using a machine learning transform \
   (such as the [FindMatches] transform) for deduplicating data. You can provide an optional \
   [Description], in addition to the parameters that you want to use for your algorithm.\n\
  \ \n\
  \  You must also specify certain parameters for the tasks that Glue runs on your behalf as part \
   of learning from your data and creating a high-quality machine learning transform. These \
   parameters include [Role], and optionally, [AllocatedCapacity], [Timeout], and [MaxRetries]. \
   For more information, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html}Jobs}.\n\
  \  "]

module CreatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partition_request ->
    ( create_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partition_request ->
    ( create_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new partition.\n"]

module CreatePartitionIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partition_index_request ->
    ( create_partition_index_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partition_index_request ->
    ( create_partition_index_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a specified partition index in an existing table.\n"]

module CreateRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_registry_input ->
    ( create_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_registry_input ->
    ( create_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new registry which may be used to hold a collection of schemas.\n"]

module CreateSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_schema_input ->
    ( create_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_schema_input ->
    ( create_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new schema set and registers the schema definition. Returns an error if the schema \
   set already exists without actually registering the version.\n\n\
  \ When the schema set is created, a version checkpoint will be set to the first version. \
   Compatibility mode \"DISABLED\" restricts any additional schema versions from being added after \
   the first schema version. For all other compatibility modes, validation of compatibility \
   settings will be applied only from the second version onwards when the [RegisterSchemaVersion] \
   API is used.\n\
  \ \n\
  \  When this API is called without a [RegistryId], this will create an entry for a \
   \"default-registry\" in the registry database tables, if it is not already present.\n\
  \  "]

module CreateScript : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_script_request ->
    ( create_script_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_script_request ->
    ( create_script_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Transforms a directed acyclic graph (DAG) into code.\n"]

module CreateSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_request ->
    ( create_security_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_request ->
    ( create_security_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new security configuration. A security configuration is a set of security properties \
   that can be used by Glue. You can use a security configuration to encrypt data at rest. For \
   information about using security configurations in Glue, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/encryption-security-configuration.html}Encrypting \
   Data Written by Crawlers, Jobs, and Development Endpoints}.\n"]

module CreateSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_session_request ->
    ( create_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_session_request ->
    ( create_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new session.\n"]

module CreateTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_table_request ->
    ( create_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_table_request ->
    ( create_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new table definition in the Data Catalog.\n"]

module CreateTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_table_optimizer_request ->
    ( create_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_table_optimizer_request ->
    ( create_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new table optimizer for a specific function. \n"]

module CreateTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_trigger_request ->
    ( create_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_trigger_request ->
    ( create_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new trigger.\n\n\
  \ Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve secrets from \
   a Glue Connection, Amazon Web Services Secrets Manager or other secret management mechanism if \
   you intend to keep them within the Job.\n\
  \ "]

module CreateUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_usage_profile_request ->
    ( create_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_usage_profile_request ->
    ( create_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Glue usage profile.\n"]

module CreateUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_defined_function_request ->
    ( create_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_defined_function_request ->
    ( create_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new function definition in the Data Catalog.\n"]

module CreateWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workflow_request ->
    ( create_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new workflow.\n"]

module DeleteAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_request ->
    ( delete_asset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_request ->
    ( delete_asset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an asset from Glue Data Catalog.\n"]

module DeleteAssetType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_type_request ->
    ( delete_asset_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_asset_type_request ->
    ( delete_asset_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an asset type from Glue Data Catalog.\n"]

module DeleteAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_attachment_request ->
    ( delete_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_attachment_request ->
    ( delete_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a form attachment from an asset in Glue Data Catalog.\n"]

module DeleteBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_blueprint_request ->
    ( delete_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_blueprint_request ->
    ( delete_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing blueprint.\n"]

module DeleteCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_catalog_request ->
    ( delete_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_catalog_request ->
    ( delete_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified catalog from the Glue Data Catalog.\n\n\
  \ After completing this operation, you no longer have access to the databases, tables (and all \
   table versions and partitions that might belong to the tables) and the user-defined functions \
   in the deleted catalog. Glue deletes these \"orphaned\" resources asynchronously in a timely \
   manner, at the discretion of the service.\n\
  \ \n\
  \  To ensure the immediate deletion of all related resources before calling the [DeleteCatalog] \
   operation, use [DeleteTableVersion] (or [BatchDeleteTableVersion]), [DeletePartition] (or \
   [BatchDeletePartition]), [DeleteTable] (or [BatchDeleteTable]), [DeleteUserDefinedFunction] and \
   [DeleteDatabase] to delete any resources that belong to the catalog.\n\
  \  "]

module DeleteClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_classifier_request ->
    ( delete_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_classifier_request ->
    ( delete_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a classifier from the Data Catalog.\n"]

module DeleteColumnStatisticsForPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_partition_request ->
    ( delete_column_statistics_for_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_partition_request ->
    ( delete_column_statistics_for_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete the partition column statistics of a column.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [DeletePartition].\n\
  \ "]

module DeleteColumnStatisticsForTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_table_request ->
    ( delete_column_statistics_for_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_for_table_request ->
    ( delete_column_statistics_for_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves table statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [DeleteTable].\n\
  \ "]

module DeleteColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_task_settings_request ->
    ( delete_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_column_statistics_task_settings_request ->
    ( delete_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes settings for a column statistics task.\n"]

module DeleteConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_request ->
    ( delete_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a connection from the Data Catalog.\n"]

module DeleteConnectionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_type_request ->
    ( delete_connection_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_connection_type_request ->
    ( delete_connection_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a custom connection type in Glue.\n\n\
  \ The connection type must exist and be registered before it can be deleted. This operation \
   supports cleanup of connection type resources and helps maintain proper lifecycle management of \
   custom connection types.\n\
  \ "]

module DeleteCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerRunningException of crawler_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_crawler_request ->
    ( delete_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_crawler_request ->
    ( delete_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a specified crawler from the Glue Data Catalog, unless the crawler state is [RUNNING].\n"]

module DeleteCustomEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_entity_type_request ->
    ( delete_custom_entity_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_entity_type_request ->
    ( delete_custom_entity_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a custom pattern by specifying its name.\n"]

module DeleteDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_quality_ruleset_request ->
    ( delete_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_quality_ruleset_request ->
    ( delete_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a data quality ruleset.\n"]

module DeleteDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_database_request ->
    ( delete_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_database_request ->
    ( delete_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a specified database from a Data Catalog.\n\n\
  \  After completing this operation, you no longer have access to the tables (and all table \
   versions and partitions that might belong to the tables) and the user-defined functions in the \
   deleted database. Glue deletes these \"orphaned\" resources asynchronously in a timely manner, \
   at the discretion of the service.\n\
  \  \n\
  \   To ensure the immediate deletion of all related resources, before calling [DeleteDatabase], \
   use [DeleteTableVersion] or [BatchDeleteTableVersion], [DeletePartition] or \
   [BatchDeletePartition], [DeleteUserDefinedFunction], and [DeleteTable] or [BatchDeleteTable], \
   to delete any resources that belong to the database.\n\
  \   \n\
  \    "]

module DeleteDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dev_endpoint_request ->
    ( delete_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dev_endpoint_request ->
    ( delete_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified development endpoint.\n"]

module DeleteFormType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_form_type_request ->
    ( delete_form_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_form_type_request ->
    ( delete_form_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a form type from Glue Data Catalog. A form type cannot be deleted if it is still \
   referenced by an asset type.\n"]

module DeleteGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_request ->
    ( delete_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_request ->
    ( delete_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a business glossary from Glue Data Catalog. A glossary cannot be deleted if it still \
   contains glossary terms.\n"]

module DeleteGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_term_request ->
    ( delete_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_glossary_term_request ->
    ( delete_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a glossary term from Glue Data Catalog.\n"]

module DeleteGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_glue_identity_center_configuration_request ->
    ( delete_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_glue_identity_center_configuration_request ->
    ( delete_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the existing Glue Identity Center configuration, removing the integration between Glue \
   and Amazon Web Services IAM Identity Center.\n"]

module DeleteIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidIntegrationStateFault of invalid_integration_state_fault
    | `InvalidStateException of invalid_state_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_request ->
    ( delete_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_request ->
    ( delete_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified Zero-ETL integration.\n"]

module DeleteIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_resource_property_request ->
    ( delete_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_resource_property_request ->
    ( delete_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used for deleting the [ResourceProperty] of the Glue connection (for the source) or \
   Glue database ARN (for the target).\n"]

module DeleteIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_table_properties_request ->
    ( delete_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_integration_table_properties_request ->
    ( delete_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the table properties that have been created for the tables that need to be replicated.\n"]

module DeleteJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_job_request ->
    ( delete_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_job_request ->
    ( delete_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified job definition. If the job definition is not found, no exception is thrown.\n"]

module DeleteMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ml_transform_request ->
    ( delete_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ml_transform_request ->
    ( delete_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Glue machine learning transform. Machine learning transforms are a special type of \
   transform that use machine learning to learn the details of the transformation to be performed \
   by learning from examples provided by humans. These transformations are then saved by Glue. If \
   you no longer need a transform, you can delete it by calling [DeleteMLTransforms]. However, any \
   Glue jobs that still reference the deleted transform will no longer succeed.\n"]

module DeletePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_request ->
    ( delete_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_request ->
    ( delete_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified partition.\n"]

module DeletePartitionIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_index_request ->
    ( delete_partition_index_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_partition_index_request ->
    ( delete_partition_index_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified partition index from an existing table.\n"]

module DeleteRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_registry_input ->
    ( delete_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_registry_input ->
    ( delete_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete the entire registry including schema and all of its versions. To get the status of the \
   delete operation, you can call the [GetRegistry] API after the asynchronous call. Deleting a \
   registry will deactivate all online operations for the registry such as the [UpdateRegistry], \
   [CreateSchema], [UpdateSchema], and [RegisterSchemaVersion] APIs. \n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConditionCheckFailureException of condition_check_failure_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified policy.\n"]

module DeleteSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_input ->
    ( delete_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_input ->
    ( delete_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the entire schema set, including the schema set and all of its versions. To get the \
   status of the delete operation, you can call [GetSchema] API after the asynchronous call. \
   Deleting a registry will deactivate all online operations for the schema, such as the \
   [GetSchemaByDefinition], and [RegisterSchemaVersion] APIs.\n"]

module DeleteSchemaVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_versions_input ->
    ( delete_schema_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_versions_input ->
    ( delete_schema_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove versions from the specified schema. A version number or range may be supplied. If the \
   compatibility mode forbids deleting of a version that is necessary, such as BACKWARDS_FULL, an \
   error is returned. Calling the [GetSchemaVersions] API after this call will list the status of \
   the deleted versions.\n\n\
  \ When the range of version numbers contain check pointed version, the API will return a 409 \
   conflict and will not proceed with the deletion. You have to remove the checkpoint first using \
   the [DeleteSchemaCheckpoint] API before using this API.\n\
  \ \n\
  \  You cannot use the [DeleteSchemaVersions] API to delete the first schema version in the \
   schema set. The first schema version can only be deleted by the [DeleteSchema] API. This \
   operation will also delete the attached [SchemaVersionMetadata] under the schema versions. Hard \
   deletes will be enforced on the database.\n\
  \  \n\
  \   If the compatibility mode forbids deleting of a version that is necessary, such as \
   BACKWARDS_FULL, an error is returned.\n\
  \   "]

module DeleteSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_request ->
    ( delete_security_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_request ->
    ( delete_security_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified security configuration.\n"]

module DeleteSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_session_request ->
    ( delete_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_session_request ->
    ( delete_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the session.\n"]

module DeleteTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_table_request ->
    ( delete_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_table_request ->
    ( delete_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a table definition from the Data Catalog.\n\n\
  \  After completing this operation, you no longer have access to the table versions and \
   partitions that belong to the deleted table. Glue deletes these \"orphaned\" resources \
   asynchronously in a timely manner, at the discretion of the service.\n\
  \  \n\
  \   To ensure the immediate deletion of all related resources, before calling [DeleteTable], use \
   [DeleteTableVersion] or [BatchDeleteTableVersion], and [DeletePartition] or \
   [BatchDeletePartition], to delete any resources that belong to the table.\n\
  \   \n\
  \    "]

module DeleteTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_table_optimizer_request ->
    ( delete_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_table_optimizer_request ->
    ( delete_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an optimizer and all associated metadata for a table. The optimization will no longer \
   be performed on the table.\n"]

module DeleteTableVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_table_version_request ->
    ( delete_table_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_table_version_request ->
    ( delete_table_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified version of a table.\n"]

module DeleteTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_trigger_request ->
    ( delete_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_trigger_request ->
    ( delete_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a specified trigger. If the trigger is not found, no exception is thrown.\n"]

module DeleteUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_profile_request ->
    ( delete_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_profile_request ->
    ( delete_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the Glue specified usage profile.\n"]

module DeleteUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_defined_function_request ->
    ( delete_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_defined_function_request ->
    ( delete_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an existing function definition from the Data Catalog.\n"]

module DeleteWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( delete_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workflow_request ->
    ( delete_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a workflow.\n"]

module DescribeConnectionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_type_request ->
    ( describe_connection_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_connection_type_request ->
    ( describe_connection_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [DescribeConnectionType] API provides full details of the supported options for a given \
   connection type in Glue. The response includes authentication configuration details that show \
   supported authentication types and properties, and RestConfiguration for custom REST-based \
   connection types registered via [RegisterConnectionType].\n\n\
  \ See also: [ListConnectionTypes], [RegisterConnectionType], [DeleteConnectionType] \n\
  \ "]

module DescribeEntity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_request ->
    ( describe_entity_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_request ->
    ( describe_entity_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details regarding the entity used with the connection type, with a description of the \
   data model for each field in the selected entity.\n\n\
  \  The response includes all the fields which make up the entity.\n\
  \ "]

module DescribeInboundIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `TargetResourceNotFound of target_resource_not_found
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_inbound_integrations_request ->
    ( describe_inbound_integrations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `TargetResourceNotFound of target_resource_not_found
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inbound_integrations_request ->
    ( describe_inbound_integrations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `TargetResourceNotFound of target_resource_not_found
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of inbound integrations for the specified integration.\n"]

module DescribeIntegrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_request ->
    ( describe_integrations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_integrations_request ->
    ( describe_integrations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The API is used to retrieve a list of integrations.\n"]

module DisassociateGlossaryTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_glossary_terms_request ->
    ( disassociate_glossary_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_glossary_terms_request ->
    ( disassociate_glossary_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the association of one or more glossary terms from an asset in Glue Data Catalog.\n"]

module GetAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_asset_input ->
    ( get_asset_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_asset_input ->
    ( get_asset_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for an asset in Glue Data Catalog, including its forms, additional \
   attachments, and associated glossary terms.\n"]

module GetAssetType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_asset_type_request ->
    ( get_asset_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_asset_type_request ->
    ( get_asset_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves an asset type in Glue Data Catalog by its identifier.\n"]

module GetBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_request ->
    ( get_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_request ->
    ( get_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of a blueprint.\n"]

module GetBlueprintRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_run_request ->
    ( get_blueprint_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_run_request ->
    ( get_blueprint_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of a blueprint run.\n"]

module GetBlueprintRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_runs_request ->
    ( get_blueprint_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_blueprint_runs_request ->
    ( get_blueprint_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of blueprint runs for a specified blueprint.\n"]

module GetCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_request ->
    ( get_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_request ->
    ( get_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The name of the Catalog to retrieve. This should be all lowercase.\n"]

module GetCatalogImportStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_import_status_request ->
    ( get_catalog_import_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_catalog_import_status_request ->
    ( get_catalog_import_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the status of a migration operation.\n"]

module GetCatalogs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_catalogs_request ->
    ( get_catalogs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_catalogs_request ->
    ( get_catalogs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all catalogs defined in a catalog in the Glue Data Catalog. For a Redshift-federated \
   catalog use case, this operation returns the list of catalogs mapped to Redshift databases in \
   the Redshift namespace catalog.\n"]

module GetClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_classifier_request ->
    ( get_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_classifier_request ->
    ( get_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve a classifier by name.\n"]

module GetClassifiers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_classifiers_request ->
    ( get_classifiers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_classifiers_request ->
    ( get_classifiers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all classifier objects in the Data Catalog.\n"]

module GetColumnStatisticsForPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_partition_request ->
    ( get_column_statistics_for_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_partition_request ->
    ( get_column_statistics_for_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves partition statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [GetPartition].\n\
  \ "]

module GetColumnStatisticsForTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_table_request ->
    ( get_column_statistics_for_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_for_table_request ->
    ( get_column_statistics_for_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves table statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is [GetTable].\n\
  \ "]

module GetColumnStatisticsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_run_request ->
    ( get_column_statistics_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_run_request ->
    ( get_column_statistics_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the associated metadata/information for a task run, given a task run ID.\n"]

module GetColumnStatisticsTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_runs_request ->
    ( get_column_statistics_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_runs_request ->
    ( get_column_statistics_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about all runs associated with the specified table.\n"]

module GetColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_settings_request ->
    ( get_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_column_statistics_task_settings_request ->
    ( get_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets settings for a column statistics task.\n"]

module GetConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connection_request ->
    ( get_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_request ->
    ( get_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a connection definition from the Data Catalog.\n"]

module GetConnections : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connections_request ->
    ( get_connections_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connections_request ->
    ( get_connections_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of connection definitions from the Data Catalog.\n"]

module GetCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_request ->
    ( get_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_request ->
    ( get_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metadata for a specified crawler.\n"]

module GetCrawlerMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_metrics_request ->
    ( get_crawler_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_crawler_metrics_request ->
    ( get_crawler_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metrics about specified crawlers.\n"]

module GetCrawlers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_crawlers_request ->
    ( get_crawlers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_crawlers_request ->
    ( get_crawlers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metadata for all crawlers defined in the customer account.\n"]

module GetCustomEntityType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_custom_entity_type_request ->
    ( get_custom_entity_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_custom_entity_type_request ->
    ( get_custom_entity_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the details of a custom pattern by specifying its name.\n"]

module GetDashboardUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_url_request ->
    ( get_dashboard_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dashboard_url_request ->
    ( get_dashboard_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the URL for the Spark monitoring dashboard for a Glue resource.\n"]

module GetDataCatalogEncryptionSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_catalog_encryption_settings_request ->
    ( get_data_catalog_encryption_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_catalog_encryption_settings_request ->
    ( get_data_catalog_encryption_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the security configuration for a specified catalog.\n"]

module GetDataQualityModel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_request ->
    ( get_data_quality_model_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_request ->
    ( get_data_quality_model_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve the training status of the model along with more information (CompletedOn, StartedOn, \
   FailureReason).\n"]

module GetDataQualityModelResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_result_request ->
    ( get_data_quality_model_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_model_result_request ->
    ( get_data_quality_model_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve a statistic's predictions for a given Profile ID.\n"]

module GetDataQualityResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_result_request ->
    ( get_data_quality_result_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_result_request ->
    ( get_data_quality_result_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the result of a data quality rule evaluation.\n"]

module GetDataQualityRuleRecommendationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_rule_recommendation_run_request ->
    ( get_data_quality_rule_recommendation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_rule_recommendation_run_request ->
    ( get_data_quality_rule_recommendation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the specified recommendation run that was used to generate rules.\n"]

module GetDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_request ->
    ( get_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_request ->
    ( get_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an existing ruleset by identifier or name.\n"]

module GetDataQualityRulesetEvaluationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_evaluation_run_request ->
    ( get_data_quality_ruleset_evaluation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_data_quality_ruleset_evaluation_run_request ->
    ( get_data_quality_ruleset_evaluation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specific run where a ruleset is evaluated against a data source.\n"]

module GetDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_database_request ->
    ( get_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_database_request ->
    ( get_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the definition of a specified database.\n"]

module GetDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_databases_request ->
    ( get_databases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_databases_request ->
    ( get_databases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves all databases defined in a given Data Catalog.\n"]

module GetDataflowGraph : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dataflow_graph_request ->
    ( get_dataflow_graph_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dataflow_graph_request ->
    ( get_dataflow_graph_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Transforms a Python script into a directed acyclic graph (DAG). \n"]

module GetDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoint_request ->
    ( get_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoint_request ->
    ( get_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about a specified development endpoint.\n\n\
  \  When you create a development endpoint in a virtual private cloud (VPC), Glue returns only a \
   private IP address, and the public IP address field is not populated. When you create a non-VPC \
   development endpoint, Glue returns only a public IP address.\n\
  \  \n\
  \   "]

module GetDevEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoints_request ->
    ( get_dev_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_dev_endpoints_request ->
    ( get_dev_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves all the development endpoints in this Amazon Web Services account.\n\n\
  \  When you create a development endpoint in a virtual private cloud (VPC), Glue returns only a \
   private IP address and the public IP address field is not populated. When you create a non-VPC \
   development endpoint, Glue returns only a public IP address.\n\
  \  \n\
  \   "]

module GetEntityRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_entity_records_request ->
    ( get_entity_records_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_entity_records_request ->
    ( get_entity_records_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to query preview data from a given connection type or from a native Amazon S3 \
   based Glue Data Catalog.\n\n\
  \ Returns records as an array of JSON blobs. Each record is formatted using Jackson JsonNode \
   based on the field type defined by the [DescribeEntity] API.\n\
  \ \n\
  \  Spark connectors generate schemas according to the same data type mapping as in the \
   [DescribeEntity] API. Spark connectors convert data to the appropriate data types matching the \
   schema when returning rows.\n\
  \  "]

module GetFormType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_form_type_request ->
    ( get_form_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_form_type_request ->
    ( get_form_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a form type in Glue Data Catalog by its identifier.\n"]

module GetGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_request ->
    ( get_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_request ->
    ( get_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a business glossary in Glue Data Catalog by its identifier.\n"]

module GetGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_term_request ->
    ( get_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_glossary_term_request ->
    ( get_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a glossary term in Glue Data Catalog by its identifier.\n"]

module GetGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_glue_identity_center_configuration_request ->
    ( get_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_glue_identity_center_configuration_request ->
    ( get_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the current Glue Identity Center configuration details, including the associated \
   Identity Center instance and application information.\n"]

module GetIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_integration_resource_property_request ->
    ( get_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_integration_resource_property_request ->
    ( get_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used for fetching the [ResourceProperty] of the Glue connection (for the source) or \
   Glue database ARN (for the target)\n"]

module GetIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_integration_table_properties_request ->
    ( get_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_integration_table_properties_request ->
    ( get_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to retrieve optional override properties for the tables that need to be \
   replicated. These properties can include properties for filtering and partition for source and \
   target tables.\n"]

module GetJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_request ->
    ( get_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves an existing job definition.\n"]

module GetJobBookmark : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_bookmark_request ->
    ( get_job_bookmark_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_bookmark_request ->
    ( get_job_bookmark_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information on a job bookmark entry.\n\n\
  \ For more information about enabling and using job bookmarks, see:\n\
  \ \n\
  \  {ul\n\
  \        {-   {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-continuations.html}Tracking \
   processed data using job bookmarks} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Job \
   parameters used by Glue} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html#aws-glue-api-jobs-job-Job}Job \
   structure} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module GetJobRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_run_request ->
    ( get_job_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_run_request ->
    ( get_job_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for a given job run. Job run history is accessible for 365 days for your \
   workflow and job run.\n"]

module GetJobRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_runs_request ->
    ( get_job_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_runs_request ->
    ( get_job_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves metadata for all runs of a given job definition.\n\n\
  \  [GetJobRuns] returns the job runs in chronological order, with the newest jobs returned first.\n\
  \ "]

module GetJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_jobs_request ->
    ( get_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_jobs_request ->
    ( get_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves all current job definitions.\n"]

module GetMLTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_run_request ->
    ( get_ml_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_run_request ->
    ( get_ml_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets details for a specific task run on a machine learning transform. Machine learning task \
   runs are asynchronous tasks that Glue runs on your behalf as part of various machine learning \
   workflows. You can check the stats of any task run by calling [GetMLTaskRun] with the \
   [TaskRunID] and its parent transform's [TransformID].\n"]

module GetMLTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_runs_request ->
    ( get_ml_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_task_runs_request ->
    ( get_ml_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of runs for a machine learning transform. Machine learning task runs are \
   asynchronous tasks that Glue runs on your behalf as part of various machine learning workflows. \
   You can get a sortable, filterable list of machine learning task runs by calling \
   [GetMLTaskRuns] with their parent transform's [TransformID] and other optional parameters as \
   documented in this section.\n\n\
  \ This operation returns a list of historic runs and must be paginated.\n\
  \ "]

module GetMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transform_request ->
    ( get_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transform_request ->
    ( get_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets an Glue machine learning transform artifact and all its corresponding metadata. Machine \
   learning transforms are a special type of transform that use machine learning to learn the \
   details of the transformation to be performed by learning from examples provided by humans. \
   These transformations are then saved by Glue. You can retrieve their metadata by calling \
   [GetMLTransform].\n"]

module GetMLTransforms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transforms_request ->
    ( get_ml_transforms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ml_transforms_request ->
    ( get_ml_transforms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a sortable, filterable list of existing Glue machine learning transforms. Machine learning \
   transforms are a special type of transform that use machine learning to learn the details of \
   the transformation to be performed by learning from examples provided by humans. These \
   transformations are then saved by Glue, and you can retrieve their metadata by calling \
   [GetMLTransforms].\n"]

module GetMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_mapping_request ->
    ( get_mapping_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_mapping_request ->
    ( get_mapping_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates mappings.\n"]

module GetMaterializedViewRefreshTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_materialized_view_refresh_task_run_request ->
    ( get_materialized_view_refresh_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_materialized_view_refresh_task_run_request ->
    ( get_materialized_view_refresh_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the associated metadata/information for a task run, given a task run ID.\n"]

module GetPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_partition_request ->
    ( get_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partition_request ->
    ( get_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a specified partition.\n"]

module GetPartitionIndexes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_partition_indexes_request ->
    ( get_partition_indexes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partition_indexes_request ->
    ( get_partition_indexes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the partition indexes associated with a table.\n"]

module GetPartitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidStateException of invalid_state_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_partitions_request ->
    ( get_partitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partitions_request ->
    ( get_partitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidStateException of invalid_state_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about the partitions in a table.\n"]

module GetPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_plan_request ->
    ( get_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_plan_request ->
    ( get_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets code to perform a specified mapping.\n"]

module GetRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_registry_input ->
    ( get_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_registry_input ->
    ( get_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified registry in detail.\n"]

module GetResourcePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policies_request ->
    ( get_resource_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policies_request ->
    ( get_resource_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the resource policies set on individual resources by Resource Access Manager during \
   cross-account permission grants. Also retrieves the Data Catalog resource policy.\n\n\
  \ If you enabled metadata encryption in Data Catalog settings, and you do not have permission on \
   the KMS key, the operation can't return the Data Catalog resource policy.\n\
  \ "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified resource policy.\n"]

module GetSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_input ->
    ( get_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_input ->
    ( get_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified schema in detail.\n"]

module GetSchemaByDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_by_definition_input ->
    ( get_schema_by_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_by_definition_input ->
    ( get_schema_by_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a schema by the [SchemaDefinition]. The schema definition is sent to the Schema \
   Registry, canonicalized, and hashed. If the hash is matched within the scope of the \
   [SchemaName] or ARN (or the default registry, if none is supplied), that schema\226\128\153s \
   metadata is returned. Otherwise, a 404 or NotFound error is returned. Schema versions in \
   [Deleted] statuses will not be included in the results.\n"]

module GetSchemaVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_version_input ->
    ( get_schema_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_version_input ->
    ( get_schema_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get the specified schema by its unique ID assigned when a version of the schema is created or \
   registered. Schema versions in Deleted status will not be included in the results.\n"]

module GetSchemaVersionsDiff : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_schema_versions_diff_input ->
    ( get_schema_versions_diff_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_schema_versions_diff_input ->
    ( get_schema_versions_diff_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fetches the schema version difference in the specified difference type between two stored \
   schema versions in the Schema Registry.\n\n\
  \ This API allows you to compare two schema versions between two schema definitions under the \
   same schema.\n\
  \ "]

module GetSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_security_configuration_request ->
    ( get_security_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_security_configuration_request ->
    ( get_security_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified security configuration.\n"]

module GetSecurityConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_security_configurations_request ->
    ( get_security_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_security_configurations_request ->
    ( get_security_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of all security configurations.\n"]

module GetSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_request ->
    ( get_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_request ->
    ( get_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the session.\n"]

module GetSessionEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_request ->
    ( get_session_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_request ->
    ( get_session_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Spark Connect endpoint URL and authentication token for an interactive session.\n"]

module GetStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_statement_request ->
    ( get_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_statement_request ->
    ( get_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the statement.\n"]

module GetTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_request ->
    ( get_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_request ->
    ( get_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the [Table] definition in a Data Catalog for a specified table.\n"]

module GetTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_optimizer_request ->
    ( get_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_optimizer_request ->
    ( get_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the configuration of all optimizers associated with a specified table.\n"]

module GetTableVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_version_request ->
    ( get_table_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_version_request ->
    ( get_table_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified version of a table.\n"]

module GetTableVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_versions_request ->
    ( get_table_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_versions_request ->
    ( get_table_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of strings that identify available versions of a specified table.\n"]

module GetTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_tables_request ->
    ( get_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_tables_request ->
    ( get_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the definitions of some or all of the tables in a given [Database].\n"]

module GetTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_tags_request ->
    ( get_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of tags associated with a resource.\n"]

module GetTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_trigger_request ->
    ( get_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_trigger_request ->
    ( get_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the definition of a trigger.\n"]

module GetTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_triggers_request ->
    ( get_triggers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_triggers_request ->
    ( get_triggers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets all the triggers associated with a job.\n"]

module GetUnfilteredPartitionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `PermissionTypeMismatchException of permission_type_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partition_metadata_request ->
    ( get_unfiltered_partition_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partition_metadata_request ->
    ( get_unfiltered_partition_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves partition metadata from the Data Catalog that contains unfiltered metadata.\n\n\
  \ For IAM authorization, the public IAM action associated with this API is [glue:GetPartition].\n\
  \ "]

module GetUnfilteredPartitionsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `PermissionTypeMismatchException of permission_type_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partitions_metadata_request ->
    ( get_unfiltered_partitions_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_partitions_metadata_request ->
    ( get_unfiltered_partitions_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves partition metadata from the Data Catalog that contains unfiltered metadata.\n\n\
  \ For IAM authorization, the public IAM action associated with this API is [glue:GetPartitions].\n\
  \ "]

module GetUnfilteredTableMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `PermissionTypeMismatchException of permission_type_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_table_metadata_request ->
    ( get_unfiltered_table_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_unfiltered_table_metadata_request ->
    ( get_unfiltered_table_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `PermissionTypeMismatchException of permission_type_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows a third-party analytical engine to retrieve unfiltered table metadata from the Data \
   Catalog.\n\n\
  \ For IAM authorization, the public IAM action associated with this API is [glue:GetTable].\n\
  \ "]

module GetUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_usage_profile_request ->
    ( get_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_usage_profile_request ->
    ( get_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about the specified Glue usage profile.\n"]

module GetUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_function_request ->
    ( get_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_function_request ->
    ( get_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a specified function definition from the Data Catalog.\n"]

module GetUserDefinedFunctions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_functions_request ->
    ( get_user_defined_functions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_user_defined_functions_request ->
    ( get_user_defined_functions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves multiple function definitions from the Data Catalog.\n"]

module GetWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_request ->
    ( get_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_request ->
    ( get_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves resource metadata for a workflow.\n"]

module GetWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_request ->
    ( get_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_request ->
    ( get_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the metadata for a given workflow run. Job run history is accessible for 90 days for \
   your workflow and job run.\n"]

module GetWorkflowRunProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_properties_request ->
    ( get_workflow_run_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_run_properties_request ->
    ( get_workflow_run_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the workflow run properties which were set during the run.\n"]

module GetWorkflowRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_runs_request ->
    ( get_workflow_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workflow_runs_request ->
    ( get_workflow_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves metadata for all runs of a given workflow.\n"]

module ImportCatalogToGlue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_catalog_to_glue_request ->
    ( import_catalog_to_glue_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_catalog_to_glue_request ->
    ( import_catalog_to_glue_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Imports an existing Amazon Athena Data Catalog to Glue.\n"]

module ListAssetTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_asset_types_request ->
    ( list_asset_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_asset_types_request ->
    ( list_asset_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the asset types defined in Glue Data Catalog.\n"]

module ListBlueprints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_blueprints_request ->
    ( list_blueprints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_blueprints_request ->
    ( list_blueprints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the blueprint names in an account.\n"]

module ListColumnStatisticsTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_column_statistics_task_runs_request ->
    ( list_column_statistics_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_column_statistics_task_runs_request ->
    ( list_column_statistics_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all task runs for a particular account.\n"]

module ListConnectionTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_connection_types_request ->
    ( list_connection_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_connection_types_request ->
    ( list_connection_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The [ListConnectionTypes] API provides a discovery mechanism to learn available connection \
   types in Glue. The response contains a list of connection types with high-level details of what \
   is supported for each connection type, including both built-in connection types and custom \
   connection types registered via [RegisterConnectionType]. The connection types listed are the \
   set of supported options for the [ConnectionType] value in the [CreateConnection] API.\n\n\
  \ See also: [DescribeConnectionType], [RegisterConnectionType], [DeleteConnectionType] \n\
  \ "]

module ListCrawlers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_crawlers_request ->
    ( list_crawlers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_crawlers_request ->
    ( list_crawlers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all crawler resources in this Amazon Web Services account, or the \
   resources with the specified tag. This operation allows you to see which resources are \
   available in your account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListCrawls : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_crawls_request ->
    ( list_crawls_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_crawls_request ->
    ( list_crawls_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all the crawls of a specified crawler. Returns only the crawls that have occurred since \
   the launch date of the crawler history feature, and only retains up to 12 months of crawls. \
   Older crawls will not be returned.\n\n\
  \ You may use this API to:\n\
  \ \n\
  \  {ul\n\
  \        {-  Retrive all the crawls of a specified crawler.\n\
  \            \n\
  \             }\n\
  \        {-  Retrieve all the crawls of a specified crawler within a limited count.\n\
  \            \n\
  \             }\n\
  \        {-  Retrieve all the crawls of a specified crawler in a specific time range.\n\
  \            \n\
  \             }\n\
  \        {-  Retrieve all the crawls of a specified crawler with a particular state, crawl ID, \
   or DPU hour value.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListCustomEntityTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_entity_types_request ->
    ( list_custom_entity_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_entity_types_request ->
    ( list_custom_entity_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all the custom patterns that have been created.\n"]

module ListDataQualityResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_results_request ->
    ( list_data_quality_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_results_request ->
    ( list_data_quality_results_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns all data quality execution results for your account.\n"]

module ListDataQualityRuleRecommendationRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rule_recommendation_runs_request ->
    ( list_data_quality_rule_recommendation_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rule_recommendation_runs_request ->
    ( list_data_quality_rule_recommendation_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the recommendation runs meeting the filter criteria.\n"]

module ListDataQualityRulesetEvaluationRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_ruleset_evaluation_runs_request ->
    ( list_data_quality_ruleset_evaluation_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_ruleset_evaluation_runs_request ->
    ( list_data_quality_ruleset_evaluation_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the runs meeting the filter criteria, where a ruleset is evaluated against a data \
   source.\n"]

module ListDataQualityRulesets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rulesets_request ->
    ( list_data_quality_rulesets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_rulesets_request ->
    ( list_data_quality_rulesets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a paginated list of rulesets for the specified list of Glue tables.\n"]

module ListDataQualityStatisticAnnotations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistic_annotations_request ->
    ( list_data_quality_statistic_annotations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistic_annotations_request ->
    ( list_data_quality_statistic_annotations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve annotations for a data quality statistic.\n"]

module ListDataQualityStatistics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistics_request ->
    ( list_data_quality_statistics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_quality_statistics_request ->
    ( list_data_quality_statistics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of data quality statistics.\n"]

module ListDevEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dev_endpoints_request ->
    ( list_dev_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dev_endpoints_request ->
    ( list_dev_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all [DevEndpoint] resources in this Amazon Web Services account, or the \
   resources with the specified tag. This operation allows you to see which resources are \
   available in your account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entities_request ->
    ( list_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entities_request ->
    ( list_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the available entities supported by the connection type. \n"]

module ListFormTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_form_types_request ->
    ( list_form_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_form_types_request ->
    ( list_form_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the form types defined in Glue Data Catalog.\n"]

module ListGlossaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_glossaries_request ->
    ( list_glossaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_glossaries_request ->
    ( list_glossaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists business glossaries in Glue Data Catalog.\n"]

module ListGlossaryTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_glossary_terms_request ->
    ( list_glossary_terms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_glossary_terms_request ->
    ( list_glossary_terms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists glossary terms within a business glossary in Glue Data Catalog.\n"]

module ListIntegrationResourceProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_integration_resource_properties_request ->
    ( list_integration_resource_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_integration_resource_properties_request ->
    ( list_integration_resource_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List integration resource properties for a single customer. It supports the filters, maxRecords \
   and markers.\n"]

module ListIterableForms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_iterable_forms_request ->
    ( list_iterable_forms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_iterable_forms_request ->
    ( list_iterable_forms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the items in an iterable form on an asset in Glue Data Catalog. For example, lists the \
   columns of a table asset.\n"]

module ListJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_jobs_request ->
    ( list_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all job resources in this Amazon Web Services account, or the resources \
   with the specified tag. This operation allows you to see which resources are available in your \
   account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListMLTransforms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ml_transforms_request ->
    ( list_ml_transforms_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ml_transforms_request ->
    ( list_ml_transforms_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Retrieves a sortable, filterable list of existing Glue machine learning transforms in this \
   Amazon Web Services account, or the resources with the specified tag. This operation takes the \
   optional [Tags] field, which you can use as a filter of the responses so that tagged resources \
   can be retrieved as a group. If you choose to use tag filtering, only resources with the tags \
   are retrieved. \n"]

module ListMaterializedViewRefreshTaskRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_materialized_view_refresh_task_runs_request ->
    ( list_materialized_view_refresh_task_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_materialized_view_refresh_task_runs_request ->
    ( list_materialized_view_refresh_task_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all task runs for a particular account.\n"]

module ListRegistries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_registries_input ->
    ( list_registries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_registries_input ->
    ( list_registries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of registries that you have created, with minimal registry information. \
   Registries in the [Deleting] status will not be included in the results. Empty results will be \
   returned if there are no registries available.\n"]

module ListSchemaVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schema_versions_input ->
    ( list_schema_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schema_versions_input ->
    ( list_schema_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of schema versions that you have created, with minimal information. Schema \
   versions in Deleted status will not be included in the results. Empty results will be returned \
   if there are no schema versions available.\n"]

module ListSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_input ->
    ( list_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_input ->
    ( list_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of schemas with minimal details. Schemas in Deleting status will not be included \
   in the results. Empty results will be returned if there are no schemas available.\n\n\
  \ When the [RegistryId] is not provided, all the schemas across registries will be part of the \
   API response.\n\
  \ "]

module ListSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_request ->
    ( list_sessions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_request ->
    ( list_sessions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieve a list of sessions.\n"]

module ListStatements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_statements_request ->
    ( list_statements_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_statements_request ->
    ( list_statements_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists statements for the session.\n"]

module ListTableOptimizerRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_table_optimizer_runs_request ->
    ( list_table_optimizer_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_table_optimizer_runs_request ->
    ( list_table_optimizer_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the history of previous optimizer runs for a specific table.\n"]

module ListTriggers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_triggers_request ->
    ( list_triggers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_triggers_request ->
    ( list_triggers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the names of all trigger resources in this Amazon Web Services account, or the \
   resources with the specified tag. This operation allows you to see which resources are \
   available in your account, and their names.\n\n\
  \ This operation takes the optional [Tags] field, which you can use as a filter on the response \
   so that tagged resources can be retrieved as a group. If you choose to use tags filtering, only \
   resources with the tag are retrieved.\n\
  \ "]

module ListUsageProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_usage_profiles_request ->
    ( list_usage_profiles_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_usage_profiles_request ->
    ( list_usage_profiles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all the Glue usage profiles.\n"]

module ListWorkflows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workflows_request ->
    ( list_workflows_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists names of workflows created in the account.\n"]

module ModifyIntegration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IntegrationConflictOperationFault of integration_conflict_operation_fault
    | `IntegrationNotFoundFault of integration_not_found_fault
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidIntegrationStateFault of invalid_integration_state_fault
    | `InvalidStateException of invalid_state_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_request ->
    ( modify_integration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_integration_request ->
    ( modify_integration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IntegrationConflictOperationFault of integration_conflict_operation_fault
      | `IntegrationNotFoundFault of integration_not_found_fault
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidIntegrationStateFault of invalid_integration_state_fault
      | `InvalidStateException of invalid_state_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies a Zero-ETL integration in the caller's account.\n"]

module PutAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_asset_request ->
    ( put_asset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_asset_request ->
    ( put_asset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an asset in Glue Data Catalog. If the asset already exists, this operation \
   updates it; otherwise, a new asset is created.\n"]

module PutAssetType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_asset_type_request ->
    ( put_asset_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_asset_type_request ->
    ( put_asset_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an asset type in Glue Data Catalog. An asset type defines the structure of \
   assets by specifying which forms they include. If an asset type with the given name already \
   exists, it is updated.\n"]

module PutAttachment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_attachment_request ->
    ( put_attachment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_attachment_request ->
    ( put_attachment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a form to an asset or an iterable form item in Glue Data Catalog. If an attachment \
   with the same name already exists, it is overwritten.\n"]

module PutDataCatalogEncryptionSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_data_catalog_encryption_settings_request ->
    ( put_data_catalog_encryption_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_data_catalog_encryption_settings_request ->
    ( put_data_catalog_encryption_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the security configuration for a specified catalog. After the configuration has been set, \
   the specified encryption is applied to every catalog write thereafter.\n"]

module PutDataQualityProfileAnnotation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_data_quality_profile_annotation_request ->
    ( put_data_quality_profile_annotation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_data_quality_profile_annotation_request ->
    ( put_data_quality_profile_annotation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Annotate all datapoints for a Profile.\n"]

module PutFormType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_form_type_request ->
    ( put_form_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_form_type_request ->
    ( put_form_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a form type in Glue Data Catalog. A form type defines the schema for \
   structured metadata that can be attached to assets.\n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConditionCheckFailureException of condition_check_failure_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConditionCheckFailureException of condition_check_failure_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sets the Data Catalog resource policy for access control.\n"]

module PutSchemaVersionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_schema_version_metadata_input ->
    ( put_schema_version_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_schema_version_metadata_input ->
    ( put_schema_version_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Puts the metadata key value pair for a specified schema version ID. A maximum of 10 key value \
   pairs will be allowed per schema version. They can be added over one or more calls.\n"]

module PutWorkflowRunProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_workflow_run_properties_request ->
    ( put_workflow_run_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_workflow_run_properties_request ->
    ( put_workflow_run_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Puts the specified workflow run properties for the given workflow run. If a property already \
   exists for the specified run, then it overrides the value otherwise adds the property to \
   existing properties.\n"]

module QuerySchemaVersionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    query_schema_version_metadata_input ->
    ( query_schema_version_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    query_schema_version_metadata_input ->
    ( query_schema_version_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Queries for the schema version metadata information. \n"]

module RegisterConnectionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_connection_type_request ->
    ( register_connection_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_connection_type_request ->
    ( register_connection_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers a custom connection type in Glue based on the configuration provided. This operation \
   enables customers to configure custom connectors for any data source with REST-based APIs, \
   eliminating the need for building custom Lambda connectors.\n\n\
  \ The registered connection type stores details about how requests and responses are interpreted \
   by REST sources, including connection properties, authentication configuration, and REST \
   configuration with entity definitions. Once registered, customers can create connections using \
   this connection type and work with them the same way as natively supported Glue connectors.\n\
  \ \n\
  \  Supports multiple authentication types including Basic, OAuth2 (Client Credentials, JWT \
   Bearer, Authorization Code), and Custom Auth configurations.\n\
  \  "]

module RegisterSchemaVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_schema_version_input ->
    ( register_schema_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_schema_version_input ->
    ( register_schema_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a new version to the existing schema. Returns an error if new version of schema does not \
   meet the compatibility requirements of the schema set. This API will not create a new schema \
   set and will return a 404 error if the schema set is not already present in the Schema \
   Registry.\n\n\
  \ If this is the first schema definition to be registered in the Schema Registry, this API will \
   store the schema version and return immediately. Otherwise, this call has the potential to run \
   longer than other operations due to compatibility modes. You can call the [GetSchemaVersion] \
   API with the [SchemaVersionId] to check compatibility modes.\n\
  \ \n\
  \  If the same schema definition is already stored in Schema Registry as a version, the schema \
   ID of the existing schema is returned to the caller.\n\
  \  "]

module RemoveSchemaVersionMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_schema_version_metadata_input ->
    ( remove_schema_version_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_schema_version_metadata_input ->
    ( remove_schema_version_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a key value pair from the schema version metadata for the specified schema version ID.\n"]

module ResetJobBookmark : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_job_bookmark_request ->
    ( reset_job_bookmark_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_job_bookmark_request ->
    ( reset_job_bookmark_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resets a bookmark entry.\n\n\
  \ For more information about enabling and using job bookmarks, see:\n\
  \ \n\
  \  {ul\n\
  \        {-   {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-continuations.html}Tracking \
   processed data using job bookmarks} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-programming-etl-glue-arguments.html}Job \
   parameters used by Glue} \n\
  \            \n\
  \             }\n\
  \        {-   \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-jobs-job.html#aws-glue-api-jobs-job-Job}Job \
   structure} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ResumeWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalWorkflowStateException of illegal_workflow_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_workflow_run_request ->
    ( resume_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resume_workflow_run_request ->
    ( resume_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restarts selected nodes of a previous partially completed workflow run and resumes the workflow \
   run. The selected nodes and all nodes that are downstream from the selected nodes are run.\n"]

module RunStatement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
    | `SessionBusyException of session_busy_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    run_statement_request ->
    ( run_statement_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `SessionBusyException of session_busy_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    run_statement_request ->
    ( run_statement_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception
      | `SessionBusyException of session_busy_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Executes the statement.\n"]

module SearchAssets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_assets_input ->
    ( search_assets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_assets_input ->
    ( search_assets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches for assets in Glue Data Catalog using full-text search, filters, sorting, and \
   aggregations. Returns matching assets with relevance-ranked results.\n"]

module SearchTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_tables_request ->
    ( search_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_tables_request ->
    ( search_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches a set of tables based on properties in the table metadata as well as on the parent \
   database. You can search against text or filter conditions. \n\n\
  \ You can only get tables that you have access to based on the security policies defined in Lake \
   Formation. You need at least a read-only access to the table for it to be returned. If you do \
   not have access to all the columns in the table, these columns will not be searched against \
   when returning the list of tables back to you. If you have access to the columns but not the \
   data in the columns, those columns and the associated metadata for those columns will be \
   included in the search. \n\
  \ "]

module StartBlueprintRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalBlueprintStateException of illegal_blueprint_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_blueprint_run_request ->
    ( start_blueprint_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_blueprint_run_request ->
    ( start_blueprint_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a new run of the specified blueprint.\n"]

module StartColumnStatisticsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_request ->
    ( start_column_statistics_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_request ->
    ( start_column_statistics_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ColumnStatisticsTaskRunningException of column_statistics_task_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a column statistics task run, for a specified table and columns.\n"]

module StartColumnStatisticsTaskRunSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_schedule_request ->
    ( start_column_statistics_task_run_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_column_statistics_task_run_schedule_request ->
    ( start_column_statistics_task_run_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a column statistics task run schedule.\n"]

module StartCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerRunningException of crawler_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_request ->
    ( start_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_request ->
    ( start_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a crawl using the specified crawler, regardless of what is scheduled. If the crawler is \
   already running, returns a \
   {{:https://docs.aws.amazon.com/glue/latest/dg/aws-glue-api-exceptions.html#aws-glue-api-exceptions-CrawlerRunningException}CrawlerRunningException}.\n"]

module StartCrawlerSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `NoScheduleException of no_schedule_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerRunningException of scheduler_running_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_schedule_request ->
    ( start_crawler_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `NoScheduleException of no_schedule_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerRunningException of scheduler_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_crawler_schedule_request ->
    ( start_crawler_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `NoScheduleException of no_schedule_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerRunningException of scheduler_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the schedule state of the specified crawler to [SCHEDULED], unless the crawler is \
   already running or the schedule state is already [SCHEDULED].\n"]

module StartDataQualityRuleRecommendationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_rule_recommendation_run_request ->
    ( start_data_quality_rule_recommendation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_rule_recommendation_run_request ->
    ( start_data_quality_rule_recommendation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a recommendation run that is used to generate rules when you don't know what rules to \
   write. Glue Data Quality analyzes the data and comes up with recommendations for a potential \
   ruleset. You can then triage the ruleset and modify the generated ruleset to your liking.\n\n\
  \ Recommendation runs are automatically deleted after 90 days.\n\
  \ "]

module StartDataQualityRulesetEvaluationRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_ruleset_evaluation_run_request ->
    ( start_data_quality_ruleset_evaluation_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_quality_ruleset_evaluation_run_request ->
    ( start_data_quality_ruleset_evaluation_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Once you have a ruleset definition (either recommended or your own), you call this operation to \
   evaluate the ruleset against a data source (Glue table). The evaluation computes results which \
   you can retrieve with the [GetDataQualityResult] API.\n"]

module StartExportLabelsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_export_labels_task_run_request ->
    ( start_export_labels_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_export_labels_task_run_request ->
    ( start_export_labels_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Begins an asynchronous task to export all labeled data for a particular transform. This task is \
   the only label-related API call that is not part of the typical active learning workflow. You \
   typically use [StartExportLabelsTaskRun] when you want to work with all of your existing labels \
   at the same time, such as when you want to remove or change labels that were previously \
   submitted as truth. This API operation accepts the [TransformId] whose labels you want to \
   export and an Amazon Simple Storage Service (Amazon S3) path to export the labels to. The \
   operation returns a [TaskRunId]. You can check on the status of your task run by calling the \
   [GetMLTaskRun] API.\n"]

module StartImportLabelsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_import_labels_task_run_request ->
    ( start_import_labels_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_import_labels_task_run_request ->
    ( start_import_labels_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables you to provide additional labels (examples of truth) to be used to teach the machine \
   learning transform and improve its quality. This API operation is generally used as part of the \
   active learning workflow that starts with the [StartMLLabelingSetGenerationTaskRun] call and \
   that ultimately results in improving the quality of your machine learning transform. \n\n\
  \ After the [StartMLLabelingSetGenerationTaskRun] finishes, Glue machine learning will have \
   generated a series of questions for humans to answer. (Answering these questions is often \
   called 'labeling' in the machine learning workflows). In the case of the [FindMatches] \
   transform, these questions are of the form, \226\128\156What is the correct way to group these \
   rows together into groups composed entirely of matching records?\226\128\157 After the labeling \
   process is finished, users upload their answers/labels with a call to \
   [StartImportLabelsTaskRun]. After [StartImportLabelsTaskRun] finishes, all future runs of the \
   machine learning transform use the new and improved labels and perform a higher-quality \
   transformation.\n\
  \ \n\
  \  By default, [StartMLLabelingSetGenerationTaskRun] continually learns from and combines all \
   labels that you upload unless you set [Replace] to true. If you set [Replace] to true, \
   [StartImportLabelsTaskRun] deletes and forgets all previously uploaded labels and learns only \
   from the exact set that you upload. Replacing labels can be helpful if you realize that you \
   previously uploaded incorrect labels, and you believe that they are having a negative effect on \
   your transform quality.\n\
  \  \n\
  \   You can check on the status of your task run by calling the [GetMLTaskRun] operation. \n\
  \   "]

module StartJobRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_job_run_request ->
    ( start_job_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_job_run_request ->
    ( start_job_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a job run using a job definition.\n"]

module StartMLEvaluationTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `MLTransformNotReadyException of ml_transform_not_ready_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_ml_evaluation_task_run_request ->
    ( start_ml_evaluation_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `MLTransformNotReadyException of ml_transform_not_ready_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_ml_evaluation_task_run_request ->
    ( start_ml_evaluation_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `MLTransformNotReadyException of ml_transform_not_ready_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a task to estimate the quality of the transform. \n\n\
  \ When you provide label sets as examples of truth, Glue machine learning uses some of those \
   examples to learn from them. The rest of the labels are used as a test to estimate quality.\n\
  \ \n\
  \  Returns a unique identifier for the run. You can call [GetMLTaskRun] to get more information \
   about the stats of the [EvaluationTaskRun].\n\
  \  "]

module StartMLLabelingSetGenerationTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_ml_labeling_set_generation_task_run_request ->
    ( start_ml_labeling_set_generation_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_ml_labeling_set_generation_task_run_request ->
    ( start_ml_labeling_set_generation_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the active learning workflow for your machine learning transform to improve the \
   transform's quality by generating label sets and adding labels.\n\n\
  \ When the [StartMLLabelingSetGenerationTaskRun] finishes, Glue will have generated a \"labeling \
   set\" or a set of questions for humans to answer.\n\
  \ \n\
  \  In the case of the [FindMatches] transform, these questions are of the form, \226\128\156What \
   is the correct way to group these rows together into groups composed entirely of matching \
   records?\226\128\157 \n\
  \  \n\
  \   After the labeling process is finished, you can upload your labels with a call to \
   [StartImportLabelsTaskRun]. After [StartImportLabelsTaskRun] finishes, all future runs of the \
   machine learning transform will use the new and improved labels and perform a higher-quality \
   transformation.\n\
  \   \n\
  \    Note: The role used to write the generated labeling set to the [OutputS3Path] is the role \
   associated with the Machine Learning Transform, specified in the [CreateMLTransform] API.\n\
  \    "]

module StartMaterializedViewRefreshTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `MaterializedViewRefreshTaskRunningException of
      materialized_view_refresh_task_running_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_materialized_view_refresh_task_run_request ->
    ( start_materialized_view_refresh_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskRunningException of
        materialized_view_refresh_task_running_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_materialized_view_refresh_task_run_request ->
    ( start_materialized_view_refresh_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskRunningException of
        materialized_view_refresh_task_running_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a materialized view refresh task run, for a specified table and columns.\n"]

module StartTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_trigger_request ->
    ( start_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_trigger_request ->
    ( start_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an existing trigger. See \
   {{:https://docs.aws.amazon.com/glue/latest/dg/trigger-job.html}Triggering Jobs} for information \
   about how different types of trigger are started.\n"]

module StartWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_workflow_run_request ->
    ( start_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_workflow_run_request ->
    ( start_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentRunsExceededException of concurrent_runs_exceeded_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a new run of the specified workflow.\n"]

module StopColumnStatisticsTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ColumnStatisticsTaskNotRunningException of column_statistics_task_not_running_exception
    | `ColumnStatisticsTaskStoppingException of column_statistics_task_stopping_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_request ->
    ( stop_column_statistics_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ColumnStatisticsTaskNotRunningException of column_statistics_task_not_running_exception
      | `ColumnStatisticsTaskStoppingException of column_statistics_task_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_request ->
    ( stop_column_statistics_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ColumnStatisticsTaskNotRunningException of column_statistics_task_not_running_exception
      | `ColumnStatisticsTaskStoppingException of column_statistics_task_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a task run for the specified table.\n"]

module StopColumnStatisticsTaskRunSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_schedule_request ->
    ( stop_column_statistics_task_run_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_column_statistics_task_run_schedule_request ->
    ( stop_column_statistics_task_run_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a column statistics task run schedule.\n"]

module StopCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerNotRunningException of crawler_not_running_exception
    | `CrawlerStoppingException of crawler_stopping_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_request ->
    ( stop_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerNotRunningException of crawler_not_running_exception
      | `CrawlerStoppingException of crawler_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_request ->
    ( stop_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerNotRunningException of crawler_not_running_exception
      | `CrawlerStoppingException of crawler_stopping_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "If the specified crawler is running, stops the crawl.\n"]

module StopCrawlerSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerNotRunningException of scheduler_not_running_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_schedule_request ->
    ( stop_crawler_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerNotRunningException of scheduler_not_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_crawler_schedule_request ->
    ( stop_crawler_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerNotRunningException of scheduler_not_running_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the schedule state of the specified crawler to [NOT_SCHEDULED], but does not stop the \
   crawler if it is already running.\n"]

module StopMaterializedViewRefreshTaskRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InvalidInputException of invalid_input_exception
    | `MaterializedViewRefreshTaskNotRunningException of
      materialized_view_refresh_task_not_running_exception
    | `MaterializedViewRefreshTaskStoppingException of
      materialized_view_refresh_task_stopping_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_materialized_view_refresh_task_run_request ->
    ( stop_materialized_view_refresh_task_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskNotRunningException of
        materialized_view_refresh_task_not_running_exception
      | `MaterializedViewRefreshTaskStoppingException of
        materialized_view_refresh_task_stopping_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_materialized_view_refresh_task_run_request ->
    ( stop_materialized_view_refresh_task_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InvalidInputException of invalid_input_exception
      | `MaterializedViewRefreshTaskNotRunningException of
        materialized_view_refresh_task_not_running_exception
      | `MaterializedViewRefreshTaskStoppingException of
        materialized_view_refresh_task_stopping_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a materialized view refresh task run, for a specified table and columns.\n"]

module StopSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IllegalSessionStateException of illegal_session_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_session_request ->
    ( stop_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_session_request ->
    ( stop_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IllegalSessionStateException of illegal_session_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the session.\n"]

module StopTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_trigger_request ->
    ( stop_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_trigger_request ->
    ( stop_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a specified trigger.\n"]

module StopWorkflowRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalWorkflowStateException of illegal_workflow_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_workflow_run_request ->
    ( stop_workflow_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_workflow_run_request ->
    ( stop_workflow_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalWorkflowStateException of illegal_workflow_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the execution of the specified workflow run.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to a resource. A tag is a label you can assign to an Amazon Web Services resource. In \
   Glue, you can tag only certain resources. For information about what resources you can tag, see \
   {{:https://docs.aws.amazon.com/glue/latest/dg/monitor-tags.html}Amazon Web Services Tags in \
   Glue}.\n"]

module TestConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_connection_request ->
    ( test_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_connection_request ->
    ( test_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tests a connection to a service to validate the service credentials that you provide.\n\n\
  \ You can either provide an existing connection name or a [TestConnectionInput] for testing a \
   non-existing connection input. Providing both at the same time will cause an error.\n\
  \ \n\
  \  If the action is successful, the service sends back an HTTP 200 response.\n\
  \  "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from a resource.\n"]

module UpdateAsset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_asset_request ->
    ( update_asset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_asset_request ->
    ( update_asset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the name and description of an existing asset in Glue Data Catalog. Only the fields \
   that you provide are updated.\n"]

module UpdateBlueprint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IllegalBlueprintStateException of illegal_blueprint_state_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_blueprint_request ->
    ( update_blueprint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_blueprint_request ->
    ( update_blueprint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IllegalBlueprintStateException of illegal_blueprint_state_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a registered blueprint.\n"]

module UpdateCatalog : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_catalog_request ->
    ( update_catalog_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_catalog_request ->
    ( update_catalog_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing catalog's properties in the Glue Data Catalog.\n"]

module UpdateClassifier : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_classifier_request ->
    ( update_classifier_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_classifier_request ->
    ( update_classifier_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing classifier (a [GrokClassifier], an [XMLClassifier], a [JsonClassifier], or \
   a [CsvClassifier], depending on which field is present).\n"]

module UpdateColumnStatisticsForPartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_partition_request ->
    ( update_column_statistics_for_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_partition_request ->
    ( update_column_statistics_for_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates partition statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [UpdatePartition].\n\
  \ "]

module UpdateColumnStatisticsForTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_table_request ->
    ( update_column_statistics_for_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_for_table_request ->
    ( update_column_statistics_for_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates table statistics of columns.\n\n\
  \ The Identity and Access Management (IAM) permission required for this operation is \
   [UpdateTable].\n\
  \ "]

module UpdateColumnStatisticsTaskSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_task_settings_request ->
    ( update_column_statistics_task_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_column_statistics_task_settings_request ->
    ( update_column_statistics_task_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates settings for a column statistics task.\n"]

module UpdateConnection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( update_connection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_connection_request ->
    ( update_connection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a connection definition in the Data Catalog.\n"]

module UpdateCrawler : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CrawlerRunningException of crawler_running_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_request ->
    ( update_crawler_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_request ->
    ( update_crawler_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CrawlerRunningException of crawler_running_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a crawler. If a crawler is running, you must stop it using [StopCrawler] before \
   updating it.\n"]

module UpdateCrawlerSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `SchedulerTransitioningException of scheduler_transitioning_exception
    | `VersionMismatchException of version_mismatch_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_schedule_request ->
    ( update_crawler_schedule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception
      | `VersionMismatchException of version_mismatch_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_crawler_schedule_request ->
    ( update_crawler_schedule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `SchedulerTransitioningException of scheduler_transitioning_exception
      | `VersionMismatchException of version_mismatch_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the schedule of a crawler using a [cron] expression. \n"]

module UpdateDataQualityRuleset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_data_quality_ruleset_request ->
    ( update_data_quality_ruleset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_data_quality_ruleset_request ->
    ( update_data_quality_ruleset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified data quality ruleset.\n"]

module UpdateDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_database_request ->
    ( update_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_database_request ->
    ( update_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing database definition in a Data Catalog.\n"]

module UpdateDevEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_dev_endpoint_request ->
    ( update_dev_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_dev_endpoint_request ->
    ( update_dev_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a specified development endpoint.\n"]

module UpdateGlossary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_request ->
    ( update_glossary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_request ->
    ( update_glossary_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a business glossary in Glue Data Catalog.\n"]

module UpdateGlossaryTerm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_term_request ->
    ( update_glossary_term_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_glossary_term_request ->
    ( update_glossary_term_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a glossary term in Glue Data Catalog.\n"]

module UpdateGlueIdentityCenterConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_glue_identity_center_configuration_request ->
    ( update_glue_identity_center_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_glue_identity_center_configuration_request ->
    ( update_glue_identity_center_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the existing Glue Identity Center configuration, allowing modification of scopes and \
   permissions for the integration.\n"]

module UpdateIntegrationResourceProperty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_integration_resource_property_request ->
    ( update_integration_resource_property_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_integration_resource_property_request ->
    ( update_integration_resource_property_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API can be used for updating the [ResourceProperty] of the Glue connection (for the \
   source) or Glue database ARN (for the target). These properties can include the role to access \
   the connection or database. Since the same resource can be used across multiple integrations, \
   updating resource properties will impact all the integrations using it.\n"]

module UpdateIntegrationTableProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServerException of internal_server_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_integration_table_properties_request ->
    ( update_integration_table_properties_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_integration_table_properties_request ->
    ( update_integration_table_properties_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServerException of internal_server_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is used to provide optional override properties for the tables that need to be \
   replicated. These properties can include properties for filtering and partitioning for the \
   source and target tables. To set both source and target properties the same API need to be \
   invoked with the Glue connection ARN as [ResourceArn] with [SourceTableConfig], and the Glue \
   database ARN as [ResourceArn] with [TargetTableConfig] respectively.\n\n\
  \ The override will be reflected across all the integrations using same [ResourceArn] and source \
   table.\n\
  \ "]

module UpdateJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_job_request ->
    ( update_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_job_request ->
    ( update_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing job definition. The previous job definition is completely overwritten by \
   this information.\n"]

module UpdateJobFromSourceControl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_job_from_source_control_request ->
    ( update_job_from_source_control_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_job_from_source_control_request ->
    ( update_job_from_source_control_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Synchronizes a job from the source control repository. This operation takes the job artifacts \
   that are located in the remote repository and updates the Glue internal stores with these \
   artifacts.\n\n\
  \ This API supports optional parameters which take in the repository information.\n\
  \ "]

module UpdateMLTransform : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ml_transform_request ->
    ( update_ml_transform_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ml_transform_request ->
    ( update_ml_transform_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing machine learning transform. Call this operation to tune the algorithm \
   parameters to achieve better results.\n\n\
  \ After calling this operation, you can call the [StartMLEvaluationTaskRun] operation to assess \
   how well your new parameters achieved your goals (such as improving the quality of your machine \
   learning transform, or making it more cost-effective).\n\
  \ "]

module UpdatePartition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_partition_request ->
    ( update_partition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_partition_request ->
    ( update_partition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a partition.\n"]

module UpdateRegistry : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_registry_input ->
    ( update_registry_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_registry_input ->
    ( update_registry_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing registry which is used to hold a collection of schemas. The updated \
   properties relate to the registry, and do not modify any of the schemas within the registry. \n"]

module UpdateSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_schema_input ->
    ( update_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_schema_input ->
    ( update_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the description, compatibility setting, or version checkpoint for a schema set.\n\n\
  \ For updating the compatibility setting, the call will not validate compatibility for the \
   entire set of schema versions with the new compatibility setting. If the value for \
   [Compatibility] is provided, the [VersionNumber] (a checkpoint) is also required. The API will \
   validate the checkpoint version number for consistency.\n\
  \ \n\
  \  If the value for the [VersionNumber] (checkpoint) is provided, [Compatibility] is optional \
   and this can be used to set/reset a checkpoint for the schema.\n\
  \  \n\
  \   This update will happen only if the schema is in the AVAILABLE state.\n\
  \   "]

module UpdateSourceControlFromJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AlreadyExistsException of already_exists_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_source_control_from_job_request ->
    ( update_source_control_from_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_source_control_from_job_request ->
    ( update_source_control_from_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AlreadyExistsException of already_exists_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Synchronizes a job to the source control repository. This operation takes the job artifacts \
   from the Glue internal stores and makes a commit to the remote repository that is configured on \
   the job.\n\n\
  \ This API supports optional parameters which take in the repository information.\n\
  \ "]

module UpdateTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `FederationSourceException of federation_source_exception
    | `FederationSourceRetryableException of federation_source_retryable_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception
    | `ResourceNotReadyException of resource_not_ready_exception
    | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_table_request ->
    ( update_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_table_request ->
    ( update_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `FederationSourceException of federation_source_exception
      | `FederationSourceRetryableException of federation_source_retryable_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception
      | `ResourceNotReadyException of resource_not_ready_exception
      | `ResourceNumberLimitExceededException of resource_number_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a metadata table in the Data Catalog.\n"]

module UpdateTableOptimizer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_table_optimizer_request ->
    ( update_table_optimizer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_table_optimizer_request ->
    ( update_table_optimizer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the configuration for an existing table optimizer.\n"]

module UpdateTrigger : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_trigger_request ->
    ( update_trigger_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_trigger_request ->
    ( update_trigger_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a trigger definition.\n\n\
  \ Job arguments may be logged. Do not pass plaintext secrets as arguments. Retrieve secrets from \
   a Glue Connection, Amazon Web Services Secrets Manager or other secret management mechanism if \
   you intend to keep them within the Job.\n\
  \ "]

module UpdateUsageProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationNotSupportedException of operation_not_supported_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_usage_profile_request ->
    ( update_usage_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_usage_profile_request ->
    ( update_usage_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationNotSupportedException of operation_not_supported_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Update an Glue usage profile.\n"]

module UpdateUserDefinedFunction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntityNotFoundException of entity_not_found_exception
    | `GlueEncryptionException of glue_encryption_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_user_defined_function_request ->
    ( update_user_defined_function_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_user_defined_function_request ->
    ( update_user_defined_function_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntityNotFoundException of entity_not_found_exception
      | `GlueEncryptionException of glue_encryption_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing function definition in the Data Catalog.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateWorkflow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntityNotFoundException of entity_not_found_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidInputException of invalid_input_exception
    | `OperationTimeoutException of operation_timeout_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workflow_request ->
    ( update_workflow_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workflow_request ->
    ( update_workflow_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntityNotFoundException of entity_not_found_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidInputException of invalid_input_exception
      | `OperationTimeoutException of operation_timeout_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an existing workflow.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
