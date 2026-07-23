open Types

val make_ai_benchmark_inference_component :
  identifier:ai_resource_identifier -> unit -> ai_benchmark_inference_component

val make_ai_benchmark_endpoint :
  ?target_container_hostname:string_ ->
  ?inference_components:ai_benchmark_inference_component_list ->
  identifier:ai_resource_identifier ->
  unit ->
  ai_benchmark_endpoint

val make_ai_benchmark_job_summary :
  ?end_time:timestamp ->
  ?ai_workload_config_name:ai_entity_name ->
  ai_benchmark_job_name:ai_entity_name ->
  ai_benchmark_job_arn:ai_benchmark_job_arn ->
  ai_benchmark_job_status:ai_benchmark_job_status ->
  creation_time:timestamp ->
  unit ->
  ai_benchmark_job_summary

val make_vpc_config :
  security_group_ids:vpc_security_group_ids -> subnets:subnets -> unit -> vpc_config

val make_ai_benchmark_network_config : ?vpc_config:vpc_config -> unit -> ai_benchmark_network_config

val make_ai_mlflow_config :
  ?mlflow_experiment_name:ai_mlflow_experiment_name ->
  ?mlflow_run_name:ai_mlflow_run_name ->
  mlflow_resource_arn:ai_mlflow_resource_arn ->
  unit ->
  ai_mlflow_config

val make_ai_benchmark_output_config :
  ?mlflow_config:ai_mlflow_config -> s3_output_location:s3_uri -> unit -> ai_benchmark_output_config

val make_ai_cloud_watch_logs :
  ?log_group_arn:string_ -> ?log_stream_name:string_ -> unit -> ai_cloud_watch_logs

val make_ai_capacity_reservation_config :
  ?capacity_reservation_preference:ai_capacity_reservation_preference ->
  ?ml_reservation_arns:ai_ml_reservation_arn_list ->
  unit ->
  ai_capacity_reservation_config

val make_ai_workload_s3_data_source : s3_uri:s3_uri -> unit -> ai_workload_s3_data_source

val make_ai_workload_data_source :
  ?s3_data_source:ai_workload_s3_data_source -> unit -> ai_workload_data_source

val make_ai_workload_input_data_config :
  channel_name:ai_channel_name ->
  data_source:ai_workload_data_source ->
  unit ->
  ai_workload_input_data_config

val make_ai_model_source_s3 : ?s3_uri:s3_uri -> unit -> ai_model_source_s3

val make_ai_recommendation_performance_metric :
  ?stat:string_ ->
  ?unit_:string_ ->
  metric:string_ ->
  value:string_ ->
  unit ->
  ai_recommendation_performance_metric

val make_ai_recommendation_deployment_s3_channel :
  ?channel_name:ai_channel_name -> ?uri:s3_uri -> unit -> ai_recommendation_deployment_s3_channel

val make_ai_recommendation_deployment_configuration :
  ?s3:ai_recommendation_deployment_s3_channel_list ->
  ?image_uri:string_ ->
  ?instance_type:ai_recommendation_instance_type ->
  ?instance_count:ai_recommendation_instance_count ->
  ?copy_count_per_instance:ai_recommendation_copy_count_per_instance ->
  ?environment_variables:environment_map ->
  unit ->
  ai_recommendation_deployment_configuration

val make_ai_recommendation_instance_detail :
  ?instance_type:ai_recommendation_instance_type ->
  ?instance_count:ai_recommendation_instance_count ->
  ?copy_count_per_instance:ai_recommendation_copy_count_per_instance ->
  unit ->
  ai_recommendation_instance_detail

val make_ai_recommendation_model_details :
  ?model_package_arn:model_package_arn ->
  ?inference_specification_name:ai_inference_specification_name ->
  ?instance_details:ai_recommendation_instance_detail_list ->
  unit ->
  ai_recommendation_model_details

val make_ai_recommendation_optimization_detail :
  ?optimization_config:ai_recommendation_optimization_config_map ->
  optimization_type:ai_recommendation_optimization_type ->
  unit ->
  ai_recommendation_optimization_detail

val make_ai_recommendation :
  ?recommendation_description:string_ ->
  ?optimization_details:ai_recommendation_optimization_detail_list ->
  ?model_details:ai_recommendation_model_details ->
  ?deployment_configuration:ai_recommendation_deployment_configuration ->
  ?ai_benchmark_job_arn:ai_benchmark_job_arn ->
  ?expected_performance:expected_performance_list ->
  unit ->
  ai_recommendation

val make_ai_recommendation_compute_spec :
  ?instance_types:ai_recommendation_instance_type_list ->
  ?capacity_reservation_config:ai_capacity_reservation_config ->
  unit ->
  ai_recommendation_compute_spec

val make_ai_recommendation_constraint :
  metric:ai_recommendation_metric -> unit -> ai_recommendation_constraint

val make_ai_recommendation_inference_specification :
  ?framework:ai_recommendation_inference_framework ->
  unit ->
  ai_recommendation_inference_specification

val make_ai_recommendation_job_summary :
  ?end_time:timestamp ->
  ai_recommendation_job_name:ai_entity_name ->
  ai_recommendation_job_arn:ai_recommendation_job_arn ->
  ai_recommendation_job_status:ai_recommendation_job_status ->
  creation_time:timestamp ->
  unit ->
  ai_recommendation_job_summary

val make_ai_recommendation_output_config :
  ?s3_output_location:s3_uri ->
  ?model_package_group_identifier:ai_resource_identifier ->
  ?mlflow_config:ai_mlflow_config ->
  unit ->
  ai_recommendation_output_config

val make_ai_recommendation_performance_target :
  constraints:ai_recommendation_constraint_list -> unit -> ai_recommendation_performance_target

val make_ai_workload_config_summary :
  ai_workload_config_name:ai_entity_name ->
  ai_workload_config_arn:ai_workload_config_arn ->
  creation_time:timestamp ->
  unit ->
  ai_workload_config_summary

val make_ai_workload_configs : workload_spec:workload_spec -> unit -> ai_workload_configs

val make_accelerator_partition_config :
  type_:mig_profile_type -> count:integer -> unit -> accelerator_partition_config

val make_compute_quota_resource_config :
  ?count:instance_count ->
  ?accelerators:accelerators_amount ->
  ?v_cpu:v_cpu_amount ->
  ?memory_in_gi_b:memory_in_gi_b_amount ->
  ?accelerator_partition:accelerator_partition_config ->
  instance_type:cluster_instance_type ->
  unit ->
  compute_quota_resource_config

val make_action_source :
  ?source_type:string256 -> ?source_id:string256 -> source_uri:source_uri -> unit -> action_source

val make_action_summary :
  ?action_arn:action_arn ->
  ?action_name:experiment_entity_name ->
  ?source:action_source ->
  ?action_type:string64 ->
  ?status:action_status ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  action_summary

val make_add_association_response :
  ?source_arn:association_entity_arn ->
  ?destination_arn:association_entity_arn ->
  unit ->
  add_association_response

val make_add_association_request :
  ?association_type:association_edge_type ->
  source_arn:association_entity_arn ->
  destination_arn:association_entity_arn ->
  unit ->
  add_association_request

val make_add_cluster_node_specification :
  ?availability_zones:cluster_availability_zones ->
  ?instance_types:cluster_instance_types ->
  instance_group_name:cluster_instance_group_name ->
  increment_target_count_by:batch_add_increment_count ->
  unit ->
  add_cluster_node_specification

val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_add_tags_output : ?tags:tag_list -> unit -> add_tags_output
val make_add_tags_input : resource_arn:resource_arn -> tags:tag_list -> unit -> add_tags_input
val make_additional_enis : ?efa_enis:efa_enis -> unit -> additional_enis

val make_base_model :
  ?hub_content_name:hub_content_name ->
  ?hub_content_version:hub_content_version ->
  ?recipe_name:recipe_name ->
  unit ->
  base_model

val make_additional_s3_data_source :
  ?compression_type:compression_type ->
  ?e_tag:string_ ->
  s3_data_type:additional_s3_data_source_data_type ->
  s3_uri:s3_uri ->
  unit ->
  additional_s3_data_source

val make_inference_hub_access_config :
  hub_content_arn:hub_content_arn -> unit -> inference_hub_access_config

val make_model_access_config : accept_eula:accept_eula -> unit -> model_access_config

val make_s3_model_data_source :
  ?model_access_config:model_access_config ->
  ?hub_access_config:inference_hub_access_config ->
  ?manifest_s3_uri:s3_model_uri ->
  ?e_tag:string_ ->
  ?manifest_etag:string_ ->
  s3_uri:s3_model_uri ->
  s3_data_type:s3_model_data_type ->
  compression_type:model_compression_type ->
  unit ->
  s3_model_data_source

val make_additional_model_data_source :
  channel_name:additional_model_channel_name ->
  s3_data_source:s3_model_data_source ->
  unit ->
  additional_model_data_source

val make_model_input : data_input_config:data_input_config -> unit -> model_input
val make_model_data_source : ?s3_data_source:s3_model_data_source -> unit -> model_data_source

val make_model_package_container_definition :
  ?container_hostname:container_hostname ->
  ?image:container_image ->
  ?image_digest:image_digest ->
  ?model_data_url:url ->
  ?model_data_source:model_data_source ->
  ?product_id:product_id ->
  ?environment:environment_map ->
  ?model_input:model_input ->
  ?framework:string_ ->
  ?framework_version:model_package_framework_version ->
  ?nearest_model_name:string_ ->
  ?additional_model_data_sources:additional_model_data_sources ->
  ?additional_s3_data_source:additional_s3_data_source ->
  ?model_data_e_tag:string_ ->
  ?is_checkpoint:boolean_ ->
  ?base_model:base_model ->
  unit ->
  model_package_container_definition

val make_additional_inference_specification_definition :
  ?description:entity_description ->
  ?supported_transform_instance_types:transform_instance_types ->
  ?supported_realtime_inference_instance_types:realtime_inference_instance_types ->
  ?supported_content_types:content_types ->
  ?supported_response_mime_types:response_mime_types ->
  name:entity_name ->
  containers:model_package_container_definition_list ->
  unit ->
  additional_inference_specification_definition

val make_agent_version : version:edge_version -> agent_count:long -> unit -> agent_version
val make_alarm : ?alarm_name:alarm_name -> unit -> alarm
val make_alarm_details : alarm_name:alarm_name -> unit -> alarm_details

val make_training_repository_auth_config :
  training_repository_credentials_provider_arn:training_repository_credentials_provider_arn ->
  unit ->
  training_repository_auth_config

val make_training_image_config :
  ?training_repository_auth_config:training_repository_auth_config ->
  training_repository_access_mode:training_repository_access_mode ->
  unit ->
  training_image_config

val make_metric_definition : name:metric_name -> regex:metric_regex -> unit -> metric_definition

val make_algorithm_specification :
  ?training_image:algorithm_image ->
  ?algorithm_name:arn_or_name ->
  ?metric_definitions:metric_definition_list ->
  ?enable_sage_maker_metrics_time_series:boolean_ ->
  ?container_entrypoint:training_container_entrypoint ->
  ?container_arguments:training_container_arguments ->
  ?training_image_config:training_image_config ->
  training_input_mode:training_input_mode ->
  unit ->
  algorithm_specification

val make_algorithm_status_item :
  ?failure_reason:string_ ->
  name:entity_name ->
  status:detailed_algorithm_status ->
  unit ->
  algorithm_status_item

val make_algorithm_status_details :
  ?validation_statuses:algorithm_status_item_list ->
  ?image_scan_statuses:algorithm_status_item_list ->
  unit ->
  algorithm_status_details

val make_algorithm_summary :
  ?algorithm_description:entity_description ->
  algorithm_name:entity_name ->
  algorithm_arn:algorithm_arn ->
  creation_time:creation_time ->
  algorithm_status:algorithm_status ->
  unit ->
  algorithm_summary

val make_transform_resources :
  ?volume_kms_key_id:kms_key_id ->
  ?transform_ami_version:transform_ami_version ->
  instance_type:transform_instance_type ->
  instance_count:transform_instance_count ->
  unit ->
  transform_resources

val make_transform_output :
  ?accept:accept ->
  ?assemble_with:assembly_type ->
  ?kms_key_id:kms_key_id ->
  s3_output_path:s3_uri ->
  unit ->
  transform_output

val make_transform_s3_data_source :
  s3_data_type:s3_data_type -> s3_uri:s3_uri -> unit -> transform_s3_data_source

val make_transform_data_source :
  s3_data_source:transform_s3_data_source -> unit -> transform_data_source

val make_transform_input :
  ?content_type:content_type ->
  ?compression_type:compression_type ->
  ?split_type:split_type ->
  data_source:transform_data_source ->
  unit ->
  transform_input

val make_transform_job_definition :
  ?max_concurrent_transforms:max_concurrent_transforms ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?batch_strategy:batch_strategy ->
  ?environment:transform_environment_map ->
  transform_input:transform_input ->
  transform_output:transform_output ->
  transform_resources:transform_resources ->
  unit ->
  transform_job_definition

val make_stopping_condition :
  ?max_runtime_in_seconds:max_runtime_in_seconds ->
  ?max_wait_time_in_seconds:max_wait_time_in_seconds ->
  ?max_pending_time_in_seconds:max_pending_time_in_seconds ->
  unit ->
  stopping_condition

val make_placement_specification :
  ?ultra_server_id:string256 ->
  instance_count:training_instance_count ->
  unit ->
  placement_specification

val make_instance_placement_config :
  ?enable_multiple_jobs:boolean_ ->
  ?placement_specifications:placement_specifications ->
  unit ->
  instance_placement_config

val make_instance_group :
  instance_type:training_instance_type ->
  instance_count:training_instance_count ->
  instance_group_name:instance_group_name ->
  unit ->
  instance_group

val make_resource_config :
  ?instance_type:training_instance_type ->
  ?instance_count:training_instance_count ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?volume_kms_key_id:kms_key_id ->
  ?keep_alive_period_in_seconds:keep_alive_period_in_seconds ->
  ?instance_groups:instance_groups ->
  ?training_plan_arn:training_plan_arn ->
  ?instance_placement_config:instance_placement_config ->
  unit ->
  resource_config

val make_output_data_config :
  ?kms_key_id:kms_key_id ->
  ?compression_type:output_compression_type ->
  s3_output_path:s3_uri ->
  unit ->
  output_data_config

val make_shuffle_config : seed:seed -> unit -> shuffle_config
val make_dataset_source : dataset_arn:hub_data_set_arn -> unit -> dataset_source

val make_file_system_data_source :
  file_system_id:file_system_id ->
  file_system_access_mode:file_system_access_mode ->
  file_system_type:file_system_type ->
  directory_path:directory_path ->
  unit ->
  file_system_data_source

val make_hub_access_config : hub_content_arn:hub_content_arn -> unit -> hub_access_config

val make_s3_data_source :
  ?s3_data_distribution_type:s3_data_distribution ->
  ?attribute_names:attribute_names ->
  ?instance_group_names:instance_group_names ->
  ?model_access_config:model_access_config ->
  ?hub_access_config:hub_access_config ->
  s3_data_type:s3_data_type ->
  s3_uri:s3_uri ->
  unit ->
  s3_data_source

val make_data_source :
  ?s3_data_source:s3_data_source ->
  ?file_system_data_source:file_system_data_source ->
  ?dataset_source:dataset_source ->
  unit ->
  data_source

val make_channel :
  ?content_type:content_type ->
  ?compression_type:compression_type ->
  ?record_wrapper_type:record_wrapper ->
  ?input_mode:training_input_mode ->
  ?shuffle_config:shuffle_config ->
  channel_name:channel_name ->
  data_source:data_source ->
  unit ->
  channel

val make_training_job_definition :
  ?hyper_parameters:hyper_parameters ->
  training_input_mode:training_input_mode ->
  input_data_config:input_data_config ->
  output_data_config:output_data_config ->
  resource_config:resource_config ->
  stopping_condition:stopping_condition ->
  unit ->
  training_job_definition

val make_algorithm_validation_profile :
  ?transform_job_definition:transform_job_definition ->
  profile_name:entity_name ->
  training_job_definition:training_job_definition ->
  unit ->
  algorithm_validation_profile

val make_algorithm_validation_specification :
  validation_role:role_arn ->
  validation_profiles:algorithm_validation_profiles ->
  unit ->
  algorithm_validation_specification

val make_amazon_q_settings :
  ?status:feature_status -> ?q_profile_arn:q_profile_arn -> unit -> amazon_q_settings

val make_annotation_consolidation_config :
  annotation_consolidation_lambda_arn:lambda_function_arn -> unit -> annotation_consolidation_config

val make_resource_spec :
  ?sage_maker_image_arn:image_arn ->
  ?sage_maker_image_version_arn:image_version_arn ->
  ?sage_maker_image_version_alias:image_version_alias ->
  ?instance_type:app_instance_type ->
  ?lifecycle_config_arn:studio_lifecycle_config_arn ->
  ?training_plan_arn:studio_resource_spec_training_plan_arn ->
  unit ->
  resource_spec

val make_app_details :
  ?domain_id:domain_id ->
  ?user_profile_name:user_profile_name ->
  ?space_name:space_name ->
  ?app_type:app_type ->
  ?app_name:app_name ->
  ?status:app_status ->
  ?creation_time:creation_time ->
  ?resource_spec:resource_spec ->
  unit ->
  app_details

val make_container_config :
  ?container_arguments:custom_image_container_arguments ->
  ?container_entrypoint:custom_image_container_entrypoint ->
  ?container_environment_variables:custom_image_container_environment_variables ->
  unit ->
  container_config

val make_file_system_config :
  ?mount_path:mount_path ->
  ?default_uid:default_uid ->
  ?default_gid:default_gid ->
  unit ->
  file_system_config

val make_code_editor_app_image_config :
  ?file_system_config:file_system_config ->
  ?container_config:container_config ->
  unit ->
  code_editor_app_image_config

val make_jupyter_lab_app_image_config :
  ?file_system_config:file_system_config ->
  ?container_config:container_config ->
  unit ->
  jupyter_lab_app_image_config

val make_kernel_spec : ?display_name:kernel_display_name -> name:kernel_name -> unit -> kernel_spec

val make_kernel_gateway_image_config :
  ?file_system_config:file_system_config ->
  kernel_specs:kernel_specs ->
  unit ->
  kernel_gateway_image_config

val make_app_image_config_details :
  ?app_image_config_arn:app_image_config_arn ->
  ?app_image_config_name:app_image_config_name ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?code_editor_app_image_config:code_editor_app_image_config ->
  unit ->
  app_image_config_details

val make_idle_settings :
  ?lifecycle_management:lifecycle_management ->
  ?idle_timeout_in_minutes:idle_timeout_in_minutes ->
  ?min_idle_timeout_in_minutes:idle_timeout_in_minutes ->
  ?max_idle_timeout_in_minutes:idle_timeout_in_minutes ->
  unit ->
  idle_settings

val make_app_lifecycle_management : ?idle_settings:idle_settings -> unit -> app_lifecycle_management

val make_app_specification :
  ?container_entrypoint:container_entrypoint ->
  ?container_arguments:container_arguments ->
  image_uri:image_uri ->
  unit ->
  app_specification

val make_artifact_source_type :
  source_id_type:artifact_source_id_type -> value:string256 -> unit -> artifact_source_type

val make_artifact_source :
  ?source_types:artifact_source_types -> source_uri:source_uri -> unit -> artifact_source

val make_artifact_summary :
  ?artifact_arn:artifact_arn ->
  ?artifact_name:experiment_entity_name ->
  ?source:artifact_source ->
  ?artifact_type:string256 ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  artifact_summary

val make_associate_trial_component_response :
  ?trial_component_arn:trial_component_arn ->
  ?trial_arn:trial_arn ->
  unit ->
  associate_trial_component_response

val make_associate_trial_component_request :
  trial_component_name:experiment_entity_name ->
  trial_name:experiment_entity_name ->
  unit ->
  associate_trial_component_request

val make_association_info :
  source_arn:string2048 -> destination_arn:string2048 -> unit -> association_info

val make_iam_identity :
  ?arn:string_ -> ?principal_id:string_ -> ?source_identity:string_ -> unit -> iam_identity

val make_user_context :
  ?user_profile_arn:string_ ->
  ?user_profile_name:string_ ->
  ?domain_id:string_ ->
  ?iam_identity:iam_identity ->
  unit ->
  user_context

val make_association_summary :
  ?source_arn:association_entity_arn ->
  ?destination_arn:association_entity_arn ->
  ?source_type:string256 ->
  ?destination_type:string256 ->
  ?association_type:association_edge_type ->
  ?source_name:experiment_entity_name ->
  ?destination_name:experiment_entity_name ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  unit ->
  association_summary

val make_async_inference_client_config :
  ?max_concurrent_invocations_per_instance:max_concurrent_invocations_per_instance ->
  unit ->
  async_inference_client_config

val make_async_inference_notification_config :
  ?success_topic:sns_topic_arn ->
  ?error_topic:sns_topic_arn ->
  ?include_inference_response_in:async_notification_topic_type_list ->
  unit ->
  async_inference_notification_config

val make_async_inference_output_config :
  ?kms_key_id:kms_key_id ->
  ?s3_output_path:destination_s3_uri ->
  ?notification_config:async_inference_notification_config ->
  ?s3_failure_path:destination_s3_uri ->
  unit ->
  async_inference_output_config

val make_async_inference_config :
  ?client_config:async_inference_client_config ->
  output_config:async_inference_output_config ->
  unit ->
  async_inference_config

val make_athena_dataset_definition :
  ?work_group:athena_work_group ->
  ?kms_key_id:kms_key_id ->
  ?output_compression:athena_result_compression_type ->
  catalog:athena_catalog ->
  database:athena_database ->
  query_string:athena_query_string ->
  output_s3_uri:s3_uri ->
  output_format:athena_result_format ->
  unit ->
  athena_dataset_definition

val make_attach_cluster_node_volume_response :
  cluster_arn:cluster_arn ->
  node_id:cluster_node_id ->
  volume_id:volume_id ->
  attach_time:timestamp ->
  status:volume_attachment_status ->
  device_name:volume_device_name ->
  unit ->
  attach_cluster_node_volume_response

val make_attach_cluster_node_volume_request :
  cluster_arn:cluster_arn ->
  node_id:cluster_node_id ->
  volume_id:volume_id ->
  unit ->
  attach_cluster_node_volume_request

val make_authorized_url : ?url:long_s3_uri -> ?local_path:local_path -> unit -> authorized_url

val make_auto_ml_algorithm_config :
  auto_ml_algorithms:auto_ml_algorithms -> unit -> auto_ml_algorithm_config

val make_auto_ml_container_definition :
  ?environment:environment_map ->
  image:container_image ->
  model_data_url:url ->
  unit ->
  auto_ml_container_definition

val make_metric_datum :
  ?metric_name:auto_ml_metric_enum ->
  ?standard_metric_name:auto_ml_metric_extended_enum ->
  ?value:float_ ->
  ?set:metric_set_source ->
  unit ->
  metric_datum

val make_candidate_artifact_locations :
  ?model_insights:model_insights_location ->
  ?backtest_results:backtest_results_location ->
  explainability:explainability_location ->
  unit ->
  candidate_artifact_locations

val make_candidate_properties :
  ?candidate_artifact_locations:candidate_artifact_locations ->
  ?candidate_metrics:metric_data_list ->
  unit ->
  candidate_properties

val make_auto_ml_candidate_step :
  candidate_step_type:candidate_step_type ->
  candidate_step_arn:candidate_step_arn ->
  candidate_step_name:candidate_step_name ->
  unit ->
  auto_ml_candidate_step

val make_final_auto_ml_job_objective_metric :
  ?type_:auto_ml_job_objective_type ->
  ?standard_metric_name:auto_ml_metric_enum ->
  metric_name:auto_ml_metric_enum ->
  value:metric_value ->
  unit ->
  final_auto_ml_job_objective_metric

val make_auto_ml_candidate :
  ?final_auto_ml_job_objective_metric:final_auto_ml_job_objective_metric ->
  ?inference_containers:auto_ml_container_definitions ->
  ?end_time:timestamp ->
  ?failure_reason:auto_ml_failure_reason ->
  ?candidate_properties:candidate_properties ->
  ?inference_container_definitions:auto_ml_inference_container_definitions ->
  candidate_name:candidate_name ->
  objective_status:objective_status ->
  candidate_steps:candidate_steps ->
  candidate_status:candidate_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  auto_ml_candidate

val make_auto_ml_candidate_generation_config :
  ?feature_specification_s3_uri:s3_uri ->
  ?algorithms_config:auto_ml_algorithms_config ->
  unit ->
  auto_ml_candidate_generation_config

val make_auto_mls3_data_source :
  s3_data_type:auto_mls3_data_type -> s3_uri:s3_uri -> unit -> auto_mls3_data_source

val make_auto_ml_data_source : s3_data_source:auto_mls3_data_source -> unit -> auto_ml_data_source

val make_auto_ml_channel :
  ?data_source:auto_ml_data_source ->
  ?compression_type:compression_type ->
  ?content_type:content_type ->
  ?channel_type:auto_ml_channel_type ->
  ?sample_weight_attribute_name:sample_weight_attribute_name ->
  target_attribute_name:target_attribute_name ->
  unit ->
  auto_ml_channel

val make_emr_serverless_compute_config :
  execution_role_ar_n:role_arn -> unit -> emr_serverless_compute_config

val make_auto_ml_compute_config :
  ?emr_serverless_compute_config:emr_serverless_compute_config -> unit -> auto_ml_compute_config

val make_auto_ml_data_split_config :
  ?validation_fraction:validation_fraction -> unit -> auto_ml_data_split_config

val make_auto_ml_job_artifacts :
  ?candidate_definition_notebook_location:candidate_definition_notebook_location ->
  ?data_exploration_notebook_location:data_exploration_notebook_location ->
  unit ->
  auto_ml_job_artifacts

val make_auto_ml_job_channel :
  ?channel_type:auto_ml_channel_type ->
  ?content_type:content_type ->
  ?compression_type:compression_type ->
  ?data_source:auto_ml_data_source ->
  unit ->
  auto_ml_job_channel

val make_auto_ml_job_completion_criteria :
  ?max_candidates:max_candidates ->
  ?max_runtime_per_training_job_in_seconds:max_runtime_per_training_job_in_seconds ->
  ?max_auto_ml_job_runtime_in_seconds:max_auto_ml_job_runtime_in_seconds ->
  unit ->
  auto_ml_job_completion_criteria

val make_auto_ml_security_config :
  ?volume_kms_key_id:kms_key_id ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?vpc_config:vpc_config ->
  unit ->
  auto_ml_security_config

val make_auto_ml_job_config :
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?security_config:auto_ml_security_config ->
  ?candidate_generation_config:auto_ml_candidate_generation_config ->
  ?data_split_config:auto_ml_data_split_config ->
  ?mode:auto_ml_mode ->
  unit ->
  auto_ml_job_config

val make_auto_ml_job_objective : metric_name:auto_ml_metric_enum -> unit -> auto_ml_job_objective
val make_auto_ml_job_step_metadata : ?arn:auto_ml_job_arn -> unit -> auto_ml_job_step_metadata

val make_auto_ml_partial_failure_reason :
  ?partial_failure_message:auto_ml_failure_reason -> unit -> auto_ml_partial_failure_reason

val make_auto_ml_job_summary :
  ?end_time:timestamp ->
  ?failure_reason:auto_ml_failure_reason ->
  ?partial_failure_reasons:auto_ml_partial_failure_reasons ->
  auto_ml_job_name:auto_ml_job_name ->
  auto_ml_job_arn:auto_ml_job_arn ->
  auto_ml_job_status:auto_ml_job_status ->
  auto_ml_job_secondary_status:auto_ml_job_secondary_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  auto_ml_job_summary

val make_auto_ml_output_data_config :
  ?kms_key_id:kms_key_id -> s3_output_path:s3_uri -> unit -> auto_ml_output_data_config

val make_text_generation_job_config :
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?base_model_name:base_model_name ->
  ?text_generation_hyper_parameters:text_generation_hyper_parameters ->
  ?model_access_config:model_access_config ->
  unit ->
  text_generation_job_config

val make_candidate_generation_config :
  ?algorithms_config:auto_ml_algorithms_config -> unit -> candidate_generation_config

val make_tabular_job_config :
  ?candidate_generation_config:candidate_generation_config ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?feature_specification_s3_uri:s3_uri ->
  ?mode:auto_ml_mode ->
  ?generate_candidate_definitions_only:generate_candidate_definitions_only ->
  ?problem_type:problem_type ->
  ?sample_weight_attribute_name:sample_weight_attribute_name ->
  target_attribute_name:target_attribute_name ->
  unit ->
  tabular_job_config

val make_holiday_config_attributes : ?country_code:country_code -> unit -> holiday_config_attributes

val make_time_series_config :
  ?grouping_attribute_names:grouping_attribute_names ->
  target_attribute_name:target_attribute_name ->
  timestamp_attribute_name:timestamp_attribute_name ->
  item_identifier_attribute_name:item_identifier_attribute_name ->
  unit ->
  time_series_config

val make_time_series_transformations :
  ?filling:filling_transformations ->
  ?aggregation:aggregation_transformations ->
  unit ->
  time_series_transformations

val make_time_series_forecasting_job_config :
  ?feature_specification_s3_uri:s3_uri ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?forecast_quantiles:forecast_quantiles ->
  ?transformations:time_series_transformations ->
  ?holiday_config:holiday_config ->
  ?candidate_generation_config:candidate_generation_config ->
  forecast_frequency:forecast_frequency ->
  forecast_horizon:forecast_horizon ->
  time_series_config:time_series_config ->
  unit ->
  time_series_forecasting_job_config

val make_text_classification_job_config :
  ?completion_criteria:auto_ml_job_completion_criteria ->
  content_column:content_column ->
  target_label_column:target_label_column ->
  unit ->
  text_classification_job_config

val make_image_classification_job_config :
  ?completion_criteria:auto_ml_job_completion_criteria -> unit -> image_classification_job_config

val make_text_generation_resolved_attributes :
  ?base_model_name:base_model_name -> unit -> text_generation_resolved_attributes

val make_tabular_resolved_attributes :
  ?problem_type:problem_type -> unit -> tabular_resolved_attributes

val make_auto_ml_resolved_attributes :
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?auto_ml_problem_type_resolved_attributes:auto_ml_problem_type_resolved_attributes ->
  unit ->
  auto_ml_resolved_attributes

val make_auto_parameter : name:parameter_key -> value_hint:parameter_value -> unit -> auto_parameter
val make_auto_rollback_config : ?alarms:alarm_list -> unit -> auto_rollback_config
val make_autotune : mode:autotune_mode -> unit -> autotune

val make_available_upgrade :
  ?version:major_minor_version -> ?release_notes:release_notes_list -> unit -> available_upgrade

val make_batch_add_cluster_nodes_error :
  ?availability_zones:cluster_availability_zones ->
  ?instance_types:cluster_instance_types ->
  ?message:string_ ->
  instance_group_name:instance_group_name ->
  error_code:batch_add_cluster_nodes_error_code ->
  failed_count:batch_add_failure_count ->
  unit ->
  batch_add_cluster_nodes_error

val make_batch_add_cluster_nodes_response :
  successful:node_addition_result_list ->
  failed:batch_add_cluster_nodes_error_list ->
  unit ->
  batch_add_cluster_nodes_response

val make_batch_add_cluster_nodes_request :
  ?client_token:string_ ->
  cluster_name:cluster_name_or_arn ->
  nodes_to_add:add_cluster_node_specification_list ->
  unit ->
  batch_add_cluster_nodes_request

val make_batch_data_capture_config :
  ?kms_key_id:kms_key_id ->
  ?generate_inference_id:boolean_ ->
  destination_s3_uri:s3_uri ->
  unit ->
  batch_data_capture_config

val make_batch_delete_cluster_node_logical_ids_error :
  code:batch_delete_cluster_nodes_error_code ->
  message:string_ ->
  node_logical_id:cluster_node_logical_id ->
  unit ->
  batch_delete_cluster_node_logical_ids_error

val make_batch_delete_cluster_nodes_error :
  code:batch_delete_cluster_nodes_error_code ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  node_id:cluster_node_id ->
  unit ->
  batch_delete_cluster_nodes_error

val make_batch_delete_cluster_nodes_response :
  ?failed:batch_delete_cluster_nodes_error_list ->
  ?successful:cluster_node_ids ->
  ?failed_node_logical_ids:batch_delete_cluster_node_logical_ids_error_list ->
  ?successful_node_logical_ids:cluster_node_logical_id_list ->
  unit ->
  batch_delete_cluster_nodes_response

val make_batch_delete_cluster_nodes_request :
  ?node_ids:cluster_node_ids ->
  ?node_logical_ids:cluster_node_logical_id_list ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  batch_delete_cluster_nodes_request

val make_batch_describe_model_package_error :
  error_code:string_ -> error_response:string_ -> unit -> batch_describe_model_package_error

val make_inference_specification :
  ?supported_transform_instance_types:transform_instance_types ->
  ?supported_realtime_inference_instance_types:realtime_inference_instance_types ->
  ?supported_content_types:content_types ->
  ?supported_response_mime_types:response_mime_types ->
  containers:model_package_container_definition_list ->
  unit ->
  inference_specification

val make_batch_describe_model_package_summary :
  ?model_package_version:model_package_version ->
  ?model_package_description:entity_description ->
  ?model_approval_status:model_approval_status ->
  ?model_package_registration_type:model_package_registration_type ->
  model_package_group_name:entity_name ->
  model_package_arn:model_package_arn ->
  creation_time:creation_time ->
  inference_specification:inference_specification ->
  model_package_status:model_package_status ->
  unit ->
  batch_describe_model_package_summary

val make_batch_describe_model_package_output :
  ?model_package_summaries:model_package_summaries ->
  ?batch_describe_model_package_error_map:batch_describe_model_package_error_map ->
  unit ->
  batch_describe_model_package_output

val make_batch_describe_model_package_input :
  model_package_arn_list:model_package_arn_list -> unit -> batch_describe_model_package_input

val make_batch_reboot_cluster_node_logical_ids_error :
  node_logical_id:cluster_node_logical_id ->
  error_code:batch_reboot_cluster_nodes_error_code ->
  message:string_ ->
  unit ->
  batch_reboot_cluster_node_logical_ids_error

val make_batch_reboot_cluster_nodes_error :
  node_id:cluster_node_id ->
  error_code:batch_reboot_cluster_nodes_error_code ->
  message:string_ ->
  unit ->
  batch_reboot_cluster_nodes_error

val make_batch_reboot_cluster_nodes_response :
  ?successful:cluster_node_ids ->
  ?failed:batch_reboot_cluster_nodes_errors ->
  ?failed_node_logical_ids:batch_reboot_cluster_node_logical_ids_errors ->
  ?successful_node_logical_ids:cluster_node_logical_id_list ->
  unit ->
  batch_reboot_cluster_nodes_response

val make_batch_reboot_cluster_nodes_request :
  ?node_ids:cluster_node_ids ->
  ?node_logical_ids:cluster_node_logical_id_list ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  batch_reboot_cluster_nodes_request

val make_batch_replace_cluster_node_logical_ids_error :
  node_logical_id:cluster_node_logical_id ->
  error_code:batch_replace_cluster_nodes_error_code ->
  message:string_ ->
  unit ->
  batch_replace_cluster_node_logical_ids_error

val make_batch_replace_cluster_nodes_error :
  node_id:cluster_node_id ->
  error_code:batch_replace_cluster_nodes_error_code ->
  message:string_ ->
  unit ->
  batch_replace_cluster_nodes_error

val make_batch_replace_cluster_nodes_response :
  ?successful:cluster_node_ids ->
  ?failed:batch_replace_cluster_nodes_errors ->
  ?failed_node_logical_ids:batch_replace_cluster_node_logical_ids_errors ->
  ?successful_node_logical_ids:cluster_node_logical_id_list ->
  unit ->
  batch_replace_cluster_nodes_response

val make_batch_replace_cluster_nodes_request :
  ?node_ids:cluster_node_ids ->
  ?node_logical_ids:cluster_node_logical_id_list ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  batch_replace_cluster_nodes_request

val make_monitoring_parquet_dataset_format : unit -> unit
val make_monitoring_json_dataset_format : ?line:boolean_ -> unit -> monitoring_json_dataset_format
val make_monitoring_csv_dataset_format : ?header:boolean_ -> unit -> monitoring_csv_dataset_format

val make_monitoring_dataset_format :
  ?csv:monitoring_csv_dataset_format ->
  ?json:monitoring_json_dataset_format ->
  ?parquet:monitoring_parquet_dataset_format ->
  unit ->
  monitoring_dataset_format

val make_batch_transform_input :
  ?s3_input_mode:processing_s3_input_mode ->
  ?s3_data_distribution_type:processing_s3_data_distribution_type ->
  ?features_attribute:string_ ->
  ?inference_attribute:string_ ->
  ?probability_attribute:string_ ->
  ?probability_threshold_attribute:probability_threshold_attribute ->
  ?start_time_offset:monitoring_time_offset_string ->
  ?end_time_offset:monitoring_time_offset_string ->
  ?exclude_features_attribute:exclude_features_attribute ->
  data_captured_destination_s3_uri:destination_s3_uri ->
  dataset_format:monitoring_dataset_format ->
  local_path:processing_local_path ->
  unit ->
  batch_transform_input

val make_bedrock_custom_model_deployment_metadata :
  ?arn:string1024 -> unit -> bedrock_custom_model_deployment_metadata

val make_bedrock_custom_model_metadata : ?arn:string1024 -> unit -> bedrock_custom_model_metadata
val make_bedrock_model_import_metadata : ?arn:string1024 -> unit -> bedrock_model_import_metadata

val make_bedrock_provisioned_model_throughput_metadata :
  ?arn:string1024 -> unit -> bedrock_provisioned_model_throughput_metadata

val make_best_objective_not_improving :
  ?max_number_of_training_jobs_not_improving:max_number_of_training_jobs_not_improving ->
  unit ->
  best_objective_not_improving

val make_metrics_source :
  ?content_digest:content_digest ->
  content_type:content_type ->
  s3_uri:s3_uri ->
  unit ->
  metrics_source

val make_bias :
  ?report:metrics_source ->
  ?pre_training_report:metrics_source ->
  ?post_training_report:metrics_source ->
  unit ->
  bias

val make_capacity_size :
  type_:capacity_size_type -> value:capacity_size_value -> unit -> capacity_size

val make_traffic_routing_config :
  ?canary_size:capacity_size ->
  ?linear_step_size:capacity_size ->
  type_:traffic_routing_config_type ->
  wait_interval_in_seconds:wait_interval_in_seconds ->
  unit ->
  traffic_routing_config

val make_blue_green_update_policy :
  ?termination_wait_in_seconds:termination_wait_in_seconds ->
  ?maximum_execution_timeout_in_seconds:maximum_execution_timeout_in_seconds ->
  traffic_routing_configuration:traffic_routing_config ->
  unit ->
  blue_green_update_policy

val make_output_parameter : name:string256 -> value:string1024 -> unit -> output_parameter

val make_callback_step_metadata :
  ?callback_token:callback_token ->
  ?sqs_queue_url:string256 ->
  ?output_parameters:output_parameter_list ->
  unit ->
  callback_step_metadata

val make_emr_serverless_settings :
  ?execution_role_arn:role_arn -> ?status:feature_status -> unit -> emr_serverless_settings

val make_generative_ai_settings :
  ?amazon_bedrock_role_arn:role_arn -> unit -> generative_ai_settings

val make_kendra_settings : ?status:feature_status -> unit -> kendra_settings
val make_direct_deploy_settings : ?status:feature_status -> unit -> direct_deploy_settings

val make_identity_provider_o_auth_setting :
  ?data_source_name:data_source_name ->
  ?status:feature_status ->
  ?secret_arn:secret_arn ->
  unit ->
  identity_provider_o_auth_setting

val make_workspace_settings :
  ?s3_artifact_path:s3_uri -> ?s3_kms_key_id:kms_key_id -> unit -> workspace_settings

val make_model_register_settings :
  ?status:feature_status ->
  ?cross_account_model_register_role_arn:role_arn ->
  unit ->
  model_register_settings

val make_time_series_forecasting_settings :
  ?status:feature_status ->
  ?amazon_forecast_role_arn:role_arn ->
  unit ->
  time_series_forecasting_settings

val make_canvas_app_settings :
  ?time_series_forecasting_settings:time_series_forecasting_settings ->
  ?model_register_settings:model_register_settings ->
  ?workspace_settings:workspace_settings ->
  ?identity_provider_o_auth_settings:identity_provider_o_auth_settings ->
  ?direct_deploy_settings:direct_deploy_settings ->
  ?kendra_settings:kendra_settings ->
  ?generative_ai_settings:generative_ai_settings ->
  ?emr_serverless_settings:emr_serverless_settings ->
  unit ->
  canvas_app_settings

val make_capacity_reservation :
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:capacity_reservation_type ->
  unit ->
  capacity_reservation

val make_capacity_size_config :
  type_:node_unavailability_type -> value:node_unavailability_value -> unit -> capacity_size_config

val make_capture_content_type_header :
  ?csv_content_types:csv_content_types ->
  ?json_content_types:json_content_types ->
  unit ->
  capture_content_type_header

val make_capture_option : capture_mode:capture_mode -> unit -> capture_option

val make_categorical_parameter :
  name:string64 -> value:categorical_parameter_range_values -> unit -> categorical_parameter

val make_categorical_parameter_range :
  name:parameter_key -> values:parameter_values -> unit -> categorical_parameter_range

val make_categorical_parameter_range_specification :
  values:parameter_values -> unit -> categorical_parameter_range_specification

val make_cfn_stack_create_parameter :
  ?value:cfn_stack_parameter_value ->
  key:cfn_stack_parameter_key ->
  unit ->
  cfn_stack_create_parameter

val make_cfn_create_template_provider :
  ?role_ar_n:role_arn ->
  ?parameters:cfn_stack_create_parameters ->
  template_name:cfn_template_name ->
  template_ur_l:cfn_template_ur_l ->
  unit ->
  cfn_create_template_provider

val make_cfn_stack_detail :
  ?name:cfn_stack_name ->
  ?id:cfn_stack_id ->
  status_message:cfn_stack_status_message ->
  unit ->
  cfn_stack_detail

val make_cfn_stack_parameter :
  ?value:cfn_stack_parameter_value -> key:cfn_stack_parameter_key -> unit -> cfn_stack_parameter

val make_cfn_stack_update_parameter :
  ?value:cfn_stack_parameter_value ->
  key:cfn_stack_parameter_key ->
  unit ->
  cfn_stack_update_parameter

val make_cfn_template_provider_detail :
  ?role_ar_n:role_arn ->
  ?parameters:cfn_stack_parameters ->
  ?stack_detail:cfn_stack_detail ->
  template_name:cfn_template_name ->
  template_ur_l:cfn_template_ur_l ->
  unit ->
  cfn_template_provider_detail

val make_cfn_update_template_provider :
  ?parameters:cfn_stack_update_parameters ->
  template_name:cfn_template_name ->
  template_ur_l:cfn_template_ur_l ->
  unit ->
  cfn_update_template_provider

val make_channel_specification :
  ?description:entity_description ->
  ?is_required:boolean_ ->
  ?supported_compression_types:compression_types ->
  name:channel_name ->
  supported_content_types:content_types ->
  supported_input_modes:input_modes ->
  unit ->
  channel_specification

val make_checkpoint_config :
  ?local_path:directory_path -> s3_uri:s3_uri -> unit -> checkpoint_config

val make_clarify_check_step_metadata :
  ?check_type:string256 ->
  ?baseline_used_for_drift_check_constraints:string1024 ->
  ?calculated_baseline_constraints:string1024 ->
  ?model_package_group_name:string256 ->
  ?violation_report:string1024 ->
  ?check_job_arn:string256 ->
  ?skip_check:boolean_ ->
  ?register_new_baseline:boolean_ ->
  unit ->
  clarify_check_step_metadata

val make_clarify_text_config :
  language:clarify_text_language ->
  granularity:clarify_text_granularity ->
  unit ->
  clarify_text_config

val make_clarify_shap_baseline_config :
  ?mime_type:clarify_mime_type ->
  ?shap_baseline:clarify_shap_baseline ->
  ?shap_baseline_uri:url ->
  unit ->
  clarify_shap_baseline_config

val make_clarify_shap_config :
  ?number_of_samples:clarify_shap_number_of_samples ->
  ?use_logit:clarify_shap_use_logit ->
  ?seed:clarify_shap_seed ->
  ?text_config:clarify_text_config ->
  shap_baseline_config:clarify_shap_baseline_config ->
  unit ->
  clarify_shap_config

val make_clarify_inference_config :
  ?features_attribute:clarify_features_attribute ->
  ?content_template:clarify_content_template ->
  ?max_record_count:clarify_max_record_count ->
  ?max_payload_in_m_b:clarify_max_payload_in_m_b ->
  ?probability_index:clarify_probability_index ->
  ?label_index:clarify_label_index ->
  ?probability_attribute:clarify_probability_attribute ->
  ?label_attribute:clarify_label_attribute ->
  ?label_headers:clarify_label_headers ->
  ?feature_headers:clarify_feature_headers ->
  ?feature_types:clarify_feature_types ->
  unit ->
  clarify_inference_config

val make_clarify_explainer_config :
  ?enable_explanations:clarify_enable_explanations ->
  ?inference_config:clarify_inference_config ->
  shap_config:clarify_shap_config ->
  unit ->
  clarify_explainer_config

val make_rolling_deployment_policy :
  ?rollback_maximum_batch_size:capacity_size_config ->
  maximum_batch_size:capacity_size_config ->
  unit ->
  rolling_deployment_policy

val make_deployment_configuration :
  ?rolling_update_policy:rolling_deployment_policy ->
  ?wait_interval_in_seconds:wait_time_interval_in_seconds ->
  ?auto_rollback_configuration:auto_rollback_alarms ->
  unit ->
  deployment_configuration

val make_cluster_patch_schedule : ?next_patch_date:timestamp -> unit -> cluster_patch_schedule

val make_cluster_auto_patch_config :
  ?patch_schedule:cluster_patch_schedule ->
  ?deployment_config:deployment_configuration ->
  patching_strategy:cluster_patching_strategy ->
  unit ->
  cluster_auto_patch_config

val make_cluster_patch_schedule_details :
  ?next_patch_date:timestamp -> unit -> cluster_patch_schedule_details

val make_cluster_auto_patch_config_details :
  ?patching_strategy:cluster_patching_strategy ->
  ?current_patch_schedule:cluster_patch_schedule_details ->
  ?desired_patch_schedule:cluster_patch_schedule_details ->
  ?deployment_config:deployment_configuration ->
  unit ->
  cluster_auto_patch_config_details

val make_cluster_auto_scaling_config :
  ?auto_scaler_type:cluster_auto_scaler_type ->
  mode:cluster_auto_scaling_mode ->
  unit ->
  cluster_auto_scaling_config

val make_cluster_auto_scaling_config_output :
  ?auto_scaler_type:cluster_auto_scaler_type ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  mode:cluster_auto_scaling_mode ->
  status:cluster_auto_scaling_status ->
  unit ->
  cluster_auto_scaling_config_output

val make_cluster_on_demand_options : unit -> unit
val make_cluster_spot_options : unit -> unit

val make_cluster_capacity_requirements :
  ?spot:cluster_spot_options ->
  ?on_demand:cluster_on_demand_options ->
  unit ->
  cluster_capacity_requirements

val make_cluster_ebs_volume_config :
  ?volume_size_in_g_b:cluster_ebs_volume_size_in_g_b ->
  ?volume_kms_key_id:kms_key_id ->
  ?root_volume:boolean_ ->
  unit ->
  cluster_ebs_volume_config

val make_instance_requirements_eni_configuration :
  ?customer_eni:Smaws_Lib.Smithy_api.Types.string_ ->
  ?additional_enis:additional_enis ->
  unit ->
  instance_requirements_eni_configuration

val make_instance_metadata :
  ?customer_eni:Smaws_Lib.Smithy_api.Types.string_ ->
  ?additional_enis:additional_enis ->
  ?instance_requirements_eni_configurations:instance_requirements_eni_configurations ->
  ?capacity_reservation:capacity_reservation ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?lcs_execution_state:Smaws_Lib.Smithy_api.Types.string_ ->
  ?node_logical_id:cluster_node_logical_id ->
  unit ->
  instance_metadata

val make_instance_group_scaling_metadata :
  ?instance_count:instance_count ->
  ?target_count:target_count ->
  ?min_count:instance_count ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  instance_group_scaling_metadata

val make_instance_group_metadata :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?capacity_reservation:capacity_reservation ->
  ?subnet_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?security_group_ids:security_group_ids ->
  ?ami_override:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  instance_group_metadata

val make_cluster_metadata :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?eks_role_access_entries:eks_role_access_entries ->
  ?slr_access_entry:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cluster_metadata

val make_event_details : ?event_metadata:event_metadata -> unit -> event_details

val make_cluster_event_detail :
  ?instance_group_name:cluster_instance_group_name ->
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_details:event_details ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_level:cluster_event_level ->
  event_id:event_id ->
  cluster_arn:cluster_arn ->
  cluster_name:cluster_name ->
  resource_type:cluster_event_resource_type ->
  event_time:timestamp ->
  unit ->
  cluster_event_detail

val make_cluster_event_summary :
  ?instance_group_name:cluster_instance_group_name ->
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_level:cluster_event_level ->
  event_id:event_id ->
  cluster_arn:cluster_arn ->
  cluster_name:cluster_name ->
  resource_type:cluster_event_resource_type ->
  event_time:timestamp ->
  unit ->
  cluster_event_summary

val make_cluster_fsx_lustre_config :
  ?mount_path:cluster_fsx_mount_path ->
  dns_name:cluster_dns_name ->
  mount_name:cluster_mount_name ->
  unit ->
  cluster_fsx_lustre_config

val make_cluster_fsx_open_zfs_config :
  ?mount_path:cluster_fsx_mount_path ->
  dns_name:cluster_dns_name ->
  unit ->
  cluster_fsx_open_zfs_config

val make_cluster_network_interface_details :
  ?interface_type:cluster_interface_type -> unit -> cluster_network_interface_details

val make_cluster_slurm_config_details :
  ?partition_names:cluster_partition_names ->
  node_type:cluster_slurm_node_type ->
  unit ->
  cluster_slurm_config_details

val make_cluster_kubernetes_taint :
  ?value:cluster_kubernetes_taint_value ->
  key:cluster_kubernetes_taint_key ->
  effect_:cluster_kubernetes_taint_effect ->
  unit ->
  cluster_kubernetes_taint

val make_cluster_kubernetes_config_details :
  ?current_labels:cluster_kubernetes_labels ->
  ?desired_labels:cluster_kubernetes_labels ->
  ?current_taints:cluster_kubernetes_taints ->
  ?desired_taints:cluster_kubernetes_taints ->
  unit ->
  cluster_kubernetes_config_details

val make_scheduled_update_config :
  ?deployment_config:deployment_configuration ->
  schedule_expression:cron_schedule_expression ->
  unit ->
  scheduled_update_config

val make_cluster_life_cycle_config :
  ?source_s3_uri:s3_uri ->
  ?on_create:cluster_life_cycle_config_file_name ->
  ?on_init_complete:cluster_life_cycle_config_file_name ->
  unit ->
  cluster_life_cycle_config

val make_cluster_instance_type_detail :
  ?instance_type:cluster_instance_type ->
  ?current_count:cluster_non_negative_instance_count ->
  ?threads_per_core:cluster_threads_per_core ->
  unit ->
  cluster_instance_type_detail

val make_cluster_instance_requirement_details :
  ?current_instance_types:cluster_instance_types ->
  ?desired_instance_types:cluster_instance_types ->
  unit ->
  cluster_instance_requirement_details

val make_cluster_instance_group_details :
  ?current_count:cluster_non_negative_instance_count ->
  ?target_count:cluster_instance_count ->
  ?min_count:cluster_instance_count ->
  ?instance_group_name:cluster_instance_group_name ->
  ?instance_type:cluster_instance_type ->
  ?instance_requirements:cluster_instance_requirement_details ->
  ?instance_type_details:cluster_instance_type_details ->
  ?life_cycle_config:cluster_life_cycle_config ->
  ?execution_role:role_arn ->
  ?threads_per_core:cluster_threads_per_core ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?status:instance_group_status ->
  ?training_plan_arn:training_plan_arn ->
  ?training_plan_status:instance_group_training_plan_status ->
  ?override_vpc_config:vpc_config ->
  ?scheduled_update_config:scheduled_update_config ->
  ?auto_patch_config:cluster_auto_patch_config_details ->
  ?current_image_id:image_id ->
  ?desired_image_id:image_id ->
  ?current_image_release_version:image_release_version ->
  ?desired_image_release_version:image_release_version ->
  ?image_version_status:cluster_image_version_status ->
  ?active_operations:active_operations ->
  ?kubernetes_config:cluster_kubernetes_config_details ->
  ?capacity_requirements:cluster_capacity_requirements ->
  ?target_state_count:cluster_instance_count ->
  ?software_update_status:software_update_status ->
  ?active_software_update_config:deployment_configuration ->
  ?slurm_config:cluster_slurm_config_details ->
  ?network_interface:cluster_network_interface_details ->
  unit ->
  cluster_instance_group_details

val make_cluster_network_interface :
  ?interface_type:cluster_interface_type -> unit -> cluster_network_interface

val make_cluster_slurm_config :
  ?partition_names:cluster_partition_names ->
  node_type:cluster_slurm_node_type ->
  unit ->
  cluster_slurm_config

val make_cluster_kubernetes_config :
  ?labels:cluster_kubernetes_labels ->
  ?taints:cluster_kubernetes_taints ->
  unit ->
  cluster_kubernetes_config

val make_cluster_instance_requirements :
  instance_types:cluster_instance_types -> unit -> cluster_instance_requirements

val make_cluster_instance_group_specification :
  ?min_instance_count:cluster_instance_count ->
  ?instance_type:cluster_instance_type ->
  ?instance_requirements:cluster_instance_requirements ->
  ?life_cycle_config:cluster_life_cycle_config ->
  ?threads_per_core:cluster_threads_per_core ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?training_plan_arn:training_plan_arn ->
  ?override_vpc_config:vpc_config ->
  ?scheduled_update_config:scheduled_update_config ->
  ?image_id:image_id ->
  ?auto_patch_config:cluster_auto_patch_config ->
  ?image_release_version:image_release_version ->
  ?kubernetes_config:cluster_kubernetes_config ->
  ?slurm_config:cluster_slurm_config ->
  ?capacity_requirements:cluster_capacity_requirements ->
  ?network_interface:cluster_network_interface ->
  instance_count:cluster_instance_count ->
  instance_group_name:cluster_instance_group_name ->
  execution_role:role_arn ->
  unit ->
  cluster_instance_group_specification

val make_cluster_instance_placement :
  ?availability_zone:cluster_availability_zone ->
  ?availability_zone_id:cluster_availability_zone_id ->
  unit ->
  cluster_instance_placement

val make_cluster_instance_status_details :
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  status:cluster_instance_status ->
  unit ->
  cluster_instance_status_details

val make_cluster_kubernetes_config_node_details :
  ?current_labels:cluster_kubernetes_labels ->
  ?desired_labels:cluster_kubernetes_labels ->
  ?current_taints:cluster_kubernetes_taints ->
  ?desired_taints:cluster_kubernetes_taints ->
  unit ->
  cluster_kubernetes_config_node_details

val make_ultra_server_info :
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ultra_server_info

val make_cluster_node_details :
  ?instance_group_name:cluster_instance_group_name ->
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?node_logical_id:cluster_node_logical_id ->
  ?instance_status:cluster_instance_status_details ->
  ?instance_type:cluster_instance_type ->
  ?launch_time:timestamp ->
  ?last_software_update_time:timestamp ->
  ?life_cycle_config:cluster_life_cycle_config ->
  ?override_vpc_config:vpc_config ->
  ?threads_per_core:cluster_threads_per_core ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?private_primary_ip:cluster_private_primary_ip ->
  ?private_primary_ipv6:cluster_private_primary_ipv6 ->
  ?private_dns_hostname:cluster_private_dns_hostname ->
  ?placement:cluster_instance_placement ->
  ?current_image_id:image_id ->
  ?desired_image_id:image_id ->
  ?current_image_release_version:image_release_version ->
  ?desired_image_release_version:image_release_version ->
  ?image_version_status:cluster_image_version_status ->
  ?ultra_server_info:ultra_server_info ->
  ?kubernetes_config:cluster_kubernetes_config_node_details ->
  ?capacity_type:cluster_capacity_type ->
  ?network_interface:cluster_network_interface_details ->
  unit ->
  cluster_node_details

val make_cluster_node_summary :
  ?node_logical_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?last_software_update_time:timestamp ->
  ?ultra_server_info:ultra_server_info ->
  ?private_dns_hostname:cluster_private_dns_hostname ->
  ?current_image_release_version:image_release_version ->
  ?image_version_status:cluster_image_version_status ->
  instance_group_name:cluster_instance_group_name ->
  instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  instance_type:cluster_instance_type ->
  launch_time:timestamp ->
  instance_status:cluster_instance_status_details ->
  unit ->
  cluster_node_summary

val make_cluster_orchestrator_slurm_config :
  ?slurm_config_strategy:cluster_slurm_config_strategy -> unit -> cluster_orchestrator_slurm_config

val make_cluster_orchestrator_eks_config :
  cluster_arn:eks_cluster_arn -> unit -> cluster_orchestrator_eks_config

val make_cluster_orchestrator :
  ?eks:cluster_orchestrator_eks_config ->
  ?slurm:cluster_orchestrator_slurm_config ->
  unit ->
  cluster_orchestrator

val make_f_sx_lustre_config :
  size_in_gi_b:f_sx_lustre_size_in_gi_b ->
  per_unit_storage_throughput:f_sx_lustre_per_unit_storage_throughput ->
  unit ->
  f_sx_lustre_config

val make_environment_config_details :
  ?f_sx_lustre_config:f_sx_lustre_config ->
  ?s3_output_path:s3_uri ->
  unit ->
  environment_config_details

val make_cluster_restricted_instance_group_details :
  ?current_count:cluster_non_negative_instance_count ->
  ?target_count:cluster_instance_count ->
  ?instance_group_name:cluster_instance_group_name ->
  ?instance_type:cluster_instance_type ->
  ?execution_role:role_arn ->
  ?threads_per_core:cluster_threads_per_core ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?status:instance_group_status ->
  ?training_plan_arn:training_plan_arn ->
  ?training_plan_status:instance_group_training_plan_status ->
  ?override_vpc_config:vpc_config ->
  ?scheduled_update_config:scheduled_update_config ->
  ?environment_config:environment_config_details ->
  unit ->
  cluster_restricted_instance_group_details

val make_environment_config : ?f_sx_lustre_config:f_sx_lustre_config -> unit -> environment_config

val make_cluster_restricted_instance_group_specification :
  ?threads_per_core:cluster_threads_per_core ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?training_plan_arn:training_plan_arn ->
  ?override_vpc_config:vpc_config ->
  ?scheduled_update_config:scheduled_update_config ->
  ?environment_config:environment_config ->
  instance_count:cluster_instance_count ->
  instance_group_name:cluster_instance_group_name ->
  instance_type:cluster_instance_type ->
  execution_role:role_arn ->
  unit ->
  cluster_restricted_instance_group_specification

val make_cluster_shared_environment_config :
  f_sx_lustre_deletion_policy:cluster_f_sx_lustre_deletion_policy ->
  f_sx_lustre_config:f_sx_lustre_config ->
  unit ->
  cluster_shared_environment_config

val make_cluster_restricted_instance_groups_config :
  shared_environment_config:cluster_shared_environment_config ->
  unit ->
  cluster_restricted_instance_groups_config

val make_cluster_shared_environment_config_details :
  ?current_f_sx_lustre_config:f_sx_lustre_config ->
  ?desired_f_sx_lustre_config:f_sx_lustre_config ->
  ?current_f_sx_lustre_deletion_policy:cluster_f_sx_lustre_deletion_policy ->
  ?desired_f_sx_lustre_deletion_policy:cluster_f_sx_lustre_deletion_policy ->
  unit ->
  cluster_shared_environment_config_details

val make_cluster_restricted_instance_groups_config_output :
  shared_environment_config:cluster_shared_environment_config_details ->
  unit ->
  cluster_restricted_instance_groups_config_output

val make_cluster_scheduler_config_summary :
  ?cluster_scheduler_config_version:integer ->
  ?last_modified_time:timestamp ->
  ?cluster_arn:cluster_arn ->
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  name:entity_name ->
  creation_time:timestamp ->
  status:scheduler_resource_status ->
  unit ->
  cluster_scheduler_config_summary

val make_cluster_summary :
  ?training_plan_arns:training_plan_arns ->
  ?image_version_status:cluster_image_version_status ->
  cluster_arn:cluster_arn ->
  cluster_name:cluster_name ->
  creation_time:timestamp ->
  cluster_status:cluster_status ->
  unit ->
  cluster_summary

val make_cluster_tiered_storage_config :
  ?instance_memory_allocation_percentage:cluster_instance_memory_allocation_percentage ->
  mode:cluster_config_mode ->
  unit ->
  cluster_tiered_storage_config

val make_custom_image :
  ?image_version_number:image_version_number ->
  image_name:image_name ->
  app_image_config_name:app_image_config_name ->
  unit ->
  custom_image

val make_code_editor_app_settings :
  ?default_resource_spec:resource_spec ->
  ?custom_images:custom_images ->
  ?lifecycle_config_arns:lifecycle_config_arns ->
  ?app_lifecycle_management:app_lifecycle_management ->
  ?built_in_lifecycle_config_arn:studio_lifecycle_config_arn ->
  unit ->
  code_editor_app_settings

val make_code_repository : repository_url:repository_url -> unit -> code_repository

val make_git_config :
  ?branch:branch -> ?secret_arn:secret_arn -> repository_url:git_config_url -> unit -> git_config

val make_code_repository_summary :
  ?git_config:git_config ->
  code_repository_name:entity_name ->
  code_repository_arn:code_repository_arn ->
  creation_time:creation_time ->
  last_modified_time:last_modified_time ->
  unit ->
  code_repository_summary

val make_cognito_config :
  user_pool:cognito_user_pool -> client_id:client_id -> unit -> cognito_config

val make_cognito_member_definition :
  user_pool:cognito_user_pool ->
  user_group:cognito_user_group ->
  client_id:client_id ->
  unit ->
  cognito_member_definition

val make_vector_config : dimension:dimension -> unit -> vector_config

val make_collection_configuration :
  ?collection_name:collection_name ->
  ?collection_parameters:collection_parameters ->
  unit ->
  collection_configuration

val make_compilation_job_summary :
  ?compilation_start_time:timestamp ->
  ?compilation_end_time:timestamp ->
  ?compilation_target_device:target_device ->
  ?compilation_target_platform_os:target_platform_os ->
  ?compilation_target_platform_arch:target_platform_arch ->
  ?compilation_target_platform_accelerator:target_platform_accelerator ->
  ?last_modified_time:last_modified_time ->
  compilation_job_name:entity_name ->
  compilation_job_arn:compilation_job_arn ->
  creation_time:creation_time ->
  compilation_job_status:compilation_job_status ->
  unit ->
  compilation_job_summary

val make_resource_sharing_config :
  ?borrow_limit:borrow_limit ->
  ?absolute_borrow_limits:absolute_borrow_limit_resource_list ->
  strategy:resource_sharing_strategy ->
  unit ->
  resource_sharing_config

val make_compute_quota_config :
  ?compute_quota_resources:compute_quota_resource_config_list ->
  ?resource_sharing_config:resource_sharing_config ->
  ?preempt_team_tasks:preempt_team_tasks ->
  unit ->
  compute_quota_config

val make_compute_quota_target :
  ?fair_share_weight:fair_share_weight ->
  team_name:compute_quota_target_team_name ->
  unit ->
  compute_quota_target

val make_compute_quota_summary :
  ?compute_quota_version:integer ->
  ?cluster_arn:cluster_arn ->
  ?compute_quota_config:compute_quota_config ->
  ?activation_state:activation_state ->
  ?last_modified_time:timestamp ->
  compute_quota_arn:compute_quota_arn ->
  compute_quota_id:compute_quota_id ->
  name:entity_name ->
  status:scheduler_resource_status ->
  compute_quota_target:compute_quota_target ->
  creation_time:timestamp ->
  unit ->
  compute_quota_summary

val make_condition_step_metadata : ?outcome:condition_outcome -> unit -> condition_step_metadata

val make_metrics_endpoint :
  ?metric_publish_frequency_in_seconds:metric_publish_frequency_in_seconds ->
  metrics_endpoint_path:metrics_endpoint_path ->
  unit ->
  metrics_endpoint

val make_container_metrics_config :
  ?metrics_endpoints:metrics_endpoint_list -> unit -> container_metrics_config

val make_multi_model_config : ?model_cache_setting:model_cache_setting -> unit -> multi_model_config

val make_repository_auth_config :
  repository_credentials_provider_arn:repository_credentials_provider_arn ->
  unit ->
  repository_auth_config

val make_image_config :
  ?repository_auth_config:repository_auth_config ->
  repository_access_mode:repository_access_mode ->
  unit ->
  image_config

val make_container_definition :
  ?container_hostname:container_hostname ->
  ?image:container_image ->
  ?image_config:image_config ->
  ?mode:container_mode ->
  ?model_data_url:url ->
  ?model_data_source:model_data_source ->
  ?additional_model_data_sources:additional_model_data_sources ->
  ?environment:environment_map ->
  ?model_package_name:versioned_arn_or_name ->
  ?inference_specification_name:inference_specification_name ->
  ?multi_model_config:multi_model_config ->
  ?container_metrics_config:container_metrics_config ->
  unit ->
  container_definition

val make_context_source :
  ?source_type:string256 -> ?source_id:string256 -> source_uri:source_uri -> unit -> context_source

val make_context_summary :
  ?context_arn:context_arn ->
  ?context_name:context_name ->
  ?source:context_source ->
  ?context_type:string256 ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  context_summary

val make_continuous_parameter_range :
  ?scaling_type:hyper_parameter_scaling_type ->
  name:parameter_key ->
  min_value:parameter_value ->
  max_value:parameter_value ->
  unit ->
  continuous_parameter_range

val make_continuous_parameter_range_specification :
  min_value:parameter_value ->
  max_value:parameter_value ->
  unit ->
  continuous_parameter_range_specification

val make_convergence_detected :
  ?complete_on_convergence:complete_on_convergence -> unit -> convergence_detected

val make_create_ai_benchmark_job_response :
  ai_benchmark_job_arn:ai_benchmark_job_arn -> unit -> create_ai_benchmark_job_response

val make_create_ai_benchmark_job_request :
  ?network_config:ai_benchmark_network_config ->
  ?tags:tag_list ->
  ai_benchmark_job_name:ai_entity_name ->
  benchmark_target:ai_benchmark_target ->
  output_config:ai_benchmark_output_config ->
  ai_workload_config_identifier:ai_resource_identifier ->
  role_arn:role_arn ->
  unit ->
  create_ai_benchmark_job_request

val make_create_ai_recommendation_job_response :
  ai_recommendation_job_arn:ai_recommendation_job_arn ->
  unit ->
  create_ai_recommendation_job_response

val make_create_ai_recommendation_job_request :
  ?inference_specification:ai_recommendation_inference_specification ->
  ?optimize_model:ai_recommendation_allow_optimization ->
  ?compute_spec:ai_recommendation_compute_spec ->
  ?tags:tag_list ->
  ai_recommendation_job_name:ai_entity_name ->
  model_source:ai_model_source ->
  output_config:ai_recommendation_output_config ->
  ai_workload_config_identifier:ai_resource_identifier ->
  performance_target:ai_recommendation_performance_target ->
  role_arn:role_arn ->
  unit ->
  create_ai_recommendation_job_request

val make_create_ai_workload_config_response :
  ai_workload_config_arn:ai_workload_config_arn -> unit -> create_ai_workload_config_response

val make_create_ai_workload_config_request :
  ?dataset_config:ai_dataset_config ->
  ?ai_workload_configs:ai_workload_configs ->
  ?tags:tag_list ->
  ai_workload_config_name:ai_entity_name ->
  unit ->
  create_ai_workload_config_request

val make_create_action_response : ?action_arn:action_arn -> unit -> create_action_response

val make_metadata_properties :
  ?commit_id:metadata_property_value ->
  ?repository:metadata_property_value ->
  ?generated_by:metadata_property_value ->
  ?project_id:metadata_property_value ->
  unit ->
  metadata_properties

val make_create_action_request :
  ?description:experiment_description ->
  ?status:action_status ->
  ?properties:lineage_entity_parameters ->
  ?metadata_properties:metadata_properties ->
  ?tags:tag_list ->
  action_name:experiment_entity_name ->
  source:action_source ->
  action_type:string256 ->
  unit ->
  create_action_request

val make_create_algorithm_output : algorithm_arn:algorithm_arn -> unit -> create_algorithm_output

val make_hyper_parameter_tuning_job_objective :
  type_:hyper_parameter_tuning_job_objective_type ->
  metric_name:metric_name ->
  unit ->
  hyper_parameter_tuning_job_objective

val make_integer_parameter_range_specification :
  min_value:parameter_value ->
  max_value:parameter_value ->
  unit ->
  integer_parameter_range_specification

val make_parameter_range :
  ?integer_parameter_range_specification:integer_parameter_range_specification ->
  ?continuous_parameter_range_specification:continuous_parameter_range_specification ->
  ?categorical_parameter_range_specification:categorical_parameter_range_specification ->
  unit ->
  parameter_range

val make_hyper_parameter_specification :
  ?description:entity_description ->
  ?range:parameter_range ->
  ?is_tunable:boolean_ ->
  ?is_required:boolean_ ->
  ?default_value:hyper_parameter_value ->
  name:parameter_name ->
  type_:parameter_type ->
  unit ->
  hyper_parameter_specification

val make_training_specification :
  ?training_image_digest:image_digest ->
  ?supported_hyper_parameters:hyper_parameter_specifications ->
  ?supports_distributed_training:boolean_ ->
  ?metric_definitions:metric_definition_list ->
  ?supported_tuning_job_objective_metrics:hyper_parameter_tuning_job_objectives ->
  ?additional_s3_data_source:additional_s3_data_source ->
  training_image:container_image ->
  supported_training_instance_types:training_instance_types ->
  training_channels:channel_specifications ->
  unit ->
  training_specification

val make_create_algorithm_input :
  ?algorithm_description:entity_description ->
  ?inference_specification:inference_specification ->
  ?validation_specification:algorithm_validation_specification ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?tags:tag_list ->
  algorithm_name:entity_name ->
  training_specification:training_specification ->
  unit ->
  create_algorithm_input

val make_create_app_response : ?app_arn:app_arn -> unit -> create_app_response

val make_create_app_request :
  ?user_profile_name:user_profile_name ->
  ?space_name:space_name ->
  ?tags:tag_list ->
  ?resource_spec:resource_spec ->
  ?recovery_mode:boolean_ ->
  domain_id:domain_id ->
  app_type:app_type ->
  app_name:app_name ->
  unit ->
  create_app_request

val make_create_app_image_config_response :
  ?app_image_config_arn:app_image_config_arn -> unit -> create_app_image_config_response

val make_create_app_image_config_request :
  ?tags:tag_list ->
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?code_editor_app_image_config:code_editor_app_image_config ->
  app_image_config_name:app_image_config_name ->
  unit ->
  create_app_image_config_request

val make_create_artifact_response : ?artifact_arn:artifact_arn -> unit -> create_artifact_response

val make_create_artifact_request :
  ?artifact_name:experiment_entity_name ->
  ?properties:artifact_properties ->
  ?metadata_properties:metadata_properties ->
  ?tags:tag_list ->
  source:artifact_source ->
  artifact_type:string256 ->
  unit ->
  create_artifact_request

val make_create_auto_ml_job_response :
  auto_ml_job_arn:auto_ml_job_arn -> unit -> create_auto_ml_job_response

val make_model_deploy_config :
  ?auto_generate_endpoint_name:auto_generate_endpoint_name ->
  ?endpoint_name:endpoint_name ->
  unit ->
  model_deploy_config

val make_create_auto_ml_job_request :
  ?problem_type:problem_type ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?auto_ml_job_config:auto_ml_job_config ->
  ?generate_candidate_definitions_only:generate_candidate_definitions_only ->
  ?tags:tag_list ->
  ?model_deploy_config:model_deploy_config ->
  auto_ml_job_name:auto_ml_job_name ->
  input_data_config:auto_ml_input_data_config ->
  output_data_config:auto_ml_output_data_config ->
  role_arn:role_arn ->
  unit ->
  create_auto_ml_job_request

val make_create_auto_ml_job_v2_response :
  auto_ml_job_arn:auto_ml_job_arn -> unit -> create_auto_ml_job_v2_response

val make_create_auto_ml_job_v2_request :
  ?tags:tag_list ->
  ?security_config:auto_ml_security_config ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?model_deploy_config:model_deploy_config ->
  ?data_split_config:auto_ml_data_split_config ->
  ?auto_ml_compute_config:auto_ml_compute_config ->
  auto_ml_job_name:auto_ml_job_name ->
  auto_ml_job_input_data_config:auto_ml_job_input_data_config ->
  output_data_config:auto_ml_output_data_config ->
  auto_ml_problem_type_config:auto_ml_problem_type_config ->
  role_arn:role_arn ->
  unit ->
  create_auto_ml_job_v2_request

val make_create_cluster_response : cluster_arn:cluster_arn -> unit -> create_cluster_response

val make_create_cluster_request :
  ?instance_groups:cluster_instance_group_specifications ->
  ?restricted_instance_groups:cluster_restricted_instance_group_specifications ->
  ?restricted_instance_groups_config:cluster_restricted_instance_groups_config ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  ?orchestrator:cluster_orchestrator ->
  ?node_recovery:cluster_node_recovery ->
  ?tiered_storage_config:cluster_tiered_storage_config ->
  ?node_provisioning_mode:cluster_node_provisioning_mode ->
  ?cluster_role:role_arn ->
  ?auto_scaling:cluster_auto_scaling_config ->
  cluster_name:cluster_name ->
  unit ->
  create_cluster_request

val make_create_cluster_scheduler_config_response :
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  unit ->
  create_cluster_scheduler_config_response

val make_priority_class :
  name:cluster_scheduler_priority_class_name -> weight:priority_weight -> unit -> priority_class

val make_scheduler_config :
  ?priority_classes:priority_class_list ->
  ?fair_share:fair_share ->
  ?idle_resource_sharing:idle_resource_sharing ->
  unit ->
  scheduler_config

val make_create_cluster_scheduler_config_request :
  ?description:entity_description ->
  ?tags:tag_list ->
  name:entity_name ->
  cluster_arn:cluster_arn ->
  scheduler_config:scheduler_config ->
  unit ->
  create_cluster_scheduler_config_request

val make_create_code_repository_output :
  code_repository_arn:code_repository_arn -> unit -> create_code_repository_output

val make_create_code_repository_input :
  ?tags:tag_list ->
  code_repository_name:entity_name ->
  git_config:git_config ->
  unit ->
  create_code_repository_input

val make_create_compilation_job_response :
  compilation_job_arn:compilation_job_arn -> unit -> create_compilation_job_response

val make_neo_vpc_config :
  security_group_ids:neo_vpc_security_group_ids -> subnets:neo_vpc_subnets -> unit -> neo_vpc_config

val make_target_platform :
  ?accelerator:target_platform_accelerator ->
  os:target_platform_os ->
  arch:target_platform_arch ->
  unit ->
  target_platform

val make_output_config :
  ?target_device:target_device ->
  ?target_platform:target_platform ->
  ?compiler_options:compiler_options ->
  ?kms_key_id:kms_key_id ->
  s3_output_location:s3_uri ->
  unit ->
  output_config

val make_input_config :
  ?data_input_config:data_input_config ->
  ?framework_version:framework_version ->
  s3_uri:s3_uri ->
  framework:framework ->
  unit ->
  input_config

val make_create_compilation_job_request :
  ?model_package_version_arn:model_package_arn ->
  ?input_config:input_config ->
  ?vpc_config:neo_vpc_config ->
  ?tags:tag_list ->
  compilation_job_name:entity_name ->
  role_arn:role_arn ->
  output_config:output_config ->
  stopping_condition:stopping_condition ->
  unit ->
  create_compilation_job_request

val make_create_compute_quota_response :
  compute_quota_arn:compute_quota_arn ->
  compute_quota_id:compute_quota_id ->
  unit ->
  create_compute_quota_response

val make_create_compute_quota_request :
  ?description:entity_description ->
  ?activation_state:activation_state ->
  ?tags:tag_list ->
  name:entity_name ->
  cluster_arn:cluster_arn ->
  compute_quota_config:compute_quota_config ->
  compute_quota_target:compute_quota_target ->
  unit ->
  create_compute_quota_request

val make_create_context_response : ?context_arn:context_arn -> unit -> create_context_response

val make_create_context_request :
  ?description:experiment_description ->
  ?properties:lineage_entity_parameters ->
  ?tags:tag_list ->
  context_name:context_name ->
  source:context_source ->
  context_type:string256 ->
  unit ->
  create_context_request

val make_create_data_quality_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_data_quality_job_definition_response

val make_monitoring_stopping_condition :
  max_runtime_in_seconds:monitoring_max_runtime_in_seconds -> unit -> monitoring_stopping_condition

val make_monitoring_network_config :
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_network_isolation:boolean_ ->
  ?vpc_config:vpc_config ->
  unit ->
  monitoring_network_config

val make_monitoring_cluster_config :
  ?volume_kms_key_id:kms_key_id ->
  instance_count:processing_instance_count ->
  instance_type:processing_instance_type ->
  volume_size_in_g_b:processing_volume_size_in_g_b ->
  unit ->
  monitoring_cluster_config

val make_monitoring_resources :
  cluster_config:monitoring_cluster_config -> unit -> monitoring_resources

val make_monitoring_s3_output :
  ?s3_upload_mode:processing_s3_upload_mode ->
  s3_uri:monitoring_s3_uri ->
  local_path:processing_local_path ->
  unit ->
  monitoring_s3_output

val make_monitoring_output : s3_output:monitoring_s3_output -> unit -> monitoring_output

val make_monitoring_output_config :
  ?kms_key_id:kms_key_id ->
  monitoring_outputs:monitoring_outputs ->
  unit ->
  monitoring_output_config

val make_endpoint_input :
  ?s3_input_mode:processing_s3_input_mode ->
  ?s3_data_distribution_type:processing_s3_data_distribution_type ->
  ?features_attribute:string_ ->
  ?inference_attribute:string_ ->
  ?probability_attribute:string_ ->
  ?probability_threshold_attribute:probability_threshold_attribute ->
  ?start_time_offset:monitoring_time_offset_string ->
  ?end_time_offset:monitoring_time_offset_string ->
  ?exclude_features_attribute:exclude_features_attribute ->
  endpoint_name:endpoint_name ->
  local_path:processing_local_path ->
  unit ->
  endpoint_input

val make_data_quality_job_input :
  ?endpoint_input:endpoint_input ->
  ?batch_transform_input:batch_transform_input ->
  unit ->
  data_quality_job_input

val make_data_quality_app_specification :
  ?container_entrypoint:container_entrypoint ->
  ?container_arguments:monitoring_container_arguments ->
  ?record_preprocessor_source_uri:s3_uri ->
  ?post_analytics_processor_source_uri:s3_uri ->
  ?environment:monitoring_environment_map ->
  image_uri:image_uri ->
  unit ->
  data_quality_app_specification

val make_monitoring_statistics_resource : ?s3_uri:s3_uri -> unit -> monitoring_statistics_resource
val make_monitoring_constraints_resource : ?s3_uri:s3_uri -> unit -> monitoring_constraints_resource

val make_data_quality_baseline_config :
  ?baselining_job_name:processing_job_name ->
  ?constraints_resource:monitoring_constraints_resource ->
  ?statistics_resource:monitoring_statistics_resource ->
  unit ->
  data_quality_baseline_config

val make_create_data_quality_job_definition_request :
  ?data_quality_baseline_config:data_quality_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?tags:tag_list ->
  job_definition_name:monitoring_job_definition_name ->
  data_quality_app_specification:data_quality_app_specification ->
  data_quality_job_input:data_quality_job_input ->
  data_quality_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  create_data_quality_job_definition_request

val make_edge_output_config :
  ?kms_key_id:kms_key_id ->
  ?preset_deployment_type:edge_preset_deployment_type ->
  ?preset_deployment_config:string_ ->
  s3_output_location:s3_uri ->
  unit ->
  edge_output_config

val make_create_device_fleet_request :
  ?role_arn:role_arn ->
  ?description:device_fleet_description ->
  ?tags:tag_list ->
  ?enable_iot_role_alias:enable_iot_role_alias ->
  device_fleet_name:entity_name ->
  output_config:edge_output_config ->
  unit ->
  create_device_fleet_request

val make_create_domain_response :
  ?domain_arn:domain_arn ->
  ?domain_id:domain_id ->
  ?url:string1024 ->
  unit ->
  create_domain_response

val make_s3_file_system_config :
  ?mount_path:string1024 -> s3_uri:s3_schema_uri -> unit -> s3_file_system_config

val make_f_sx_lustre_file_system_config :
  ?file_system_path:file_system_path ->
  file_system_id:file_system_id ->
  unit ->
  f_sx_lustre_file_system_config

val make_efs_file_system_config :
  ?file_system_path:file_system_path ->
  file_system_id:file_system_id ->
  unit ->
  efs_file_system_config

val make_custom_posix_user_config : uid:uid -> gid:gid -> unit -> custom_posix_user_config

val make_default_ebs_storage_settings :
  default_ebs_volume_size_in_gb:space_ebs_volume_size_in_gb ->
  maximum_ebs_volume_size_in_gb:space_ebs_volume_size_in_gb ->
  unit ->
  default_ebs_storage_settings

val make_default_space_storage_settings :
  ?default_ebs_storage_settings:default_ebs_storage_settings ->
  unit ->
  default_space_storage_settings

val make_emr_settings :
  ?assumable_role_arns:assumable_role_arns ->
  ?execution_role_arns:execution_role_arns ->
  unit ->
  emr_settings

val make_jupyter_lab_app_settings :
  ?default_resource_spec:resource_spec ->
  ?custom_images:custom_images ->
  ?lifecycle_config_arns:lifecycle_config_arns ->
  ?code_repositories:code_repositories ->
  ?app_lifecycle_management:app_lifecycle_management ->
  ?emr_settings:emr_settings ->
  ?built_in_lifecycle_config_arn:studio_lifecycle_config_arn ->
  unit ->
  jupyter_lab_app_settings

val make_kernel_gateway_app_settings :
  ?default_resource_spec:resource_spec ->
  ?custom_images:custom_images ->
  ?lifecycle_config_arns:lifecycle_config_arns ->
  unit ->
  kernel_gateway_app_settings

val make_jupyter_server_app_settings :
  ?default_resource_spec:resource_spec ->
  ?lifecycle_config_arns:lifecycle_config_arns ->
  ?code_repositories:code_repositories ->
  unit ->
  jupyter_server_app_settings

val make_default_space_settings :
  ?execution_role:role_arn ->
  ?security_groups:security_group_ids ->
  ?jupyter_server_app_settings:jupyter_server_app_settings ->
  ?kernel_gateway_app_settings:kernel_gateway_app_settings ->
  ?jupyter_lab_app_settings:jupyter_lab_app_settings ->
  ?space_storage_settings:default_space_storage_settings ->
  ?custom_posix_user_config:custom_posix_user_config ->
  ?custom_file_system_configs:custom_file_system_configs ->
  unit ->
  default_space_settings

val make_unified_studio_settings :
  ?studio_web_portal_access:feature_status ->
  ?domain_account_id:account_id ->
  ?domain_region:region_name ->
  ?domain_id:unified_studio_domain_id ->
  ?project_id:unified_studio_project_id ->
  ?environment_id:unified_studio_environment_id ->
  ?project_s3_path:s3_uri ->
  ?single_sign_on_application_arn:single_sign_on_application_arn ->
  unit ->
  unified_studio_settings

val make_docker_settings :
  ?enable_docker_access:feature_status ->
  ?vpc_only_trusted_accounts:vpc_only_trusted_accounts ->
  ?rootless_docker:feature_status ->
  unit ->
  docker_settings

val make_trusted_identity_propagation_settings :
  status:feature_status -> unit -> trusted_identity_propagation_settings

val make_r_studio_server_pro_domain_settings :
  ?r_studio_connect_url:string_ ->
  ?r_studio_package_manager_url:string_ ->
  ?default_resource_spec:resource_spec ->
  domain_execution_role_arn:role_arn ->
  unit ->
  r_studio_server_pro_domain_settings

val make_domain_settings :
  ?security_group_ids:domain_security_group_ids ->
  ?r_studio_server_pro_domain_settings:r_studio_server_pro_domain_settings ->
  ?execution_role_identity_config:execution_role_identity_config ->
  ?trusted_identity_propagation_settings:trusted_identity_propagation_settings ->
  ?docker_settings:docker_settings ->
  ?amazon_q_settings:amazon_q_settings ->
  ?unified_studio_settings:unified_studio_settings ->
  ?ip_address_type:ip_address_type ->
  unit ->
  domain_settings

val make_hidden_sage_maker_image :
  ?sage_maker_image_name:sage_maker_image_name ->
  ?version_aliases:version_aliases_list ->
  unit ->
  hidden_sage_maker_image

val make_studio_web_portal_settings :
  ?hidden_ml_tools:hidden_ml_tools_list ->
  ?hidden_app_types:hidden_app_types_list ->
  ?hidden_instance_types:hidden_instance_types_list ->
  ?hidden_sage_maker_image_version_aliases:hidden_sage_maker_image_version_aliases_list ->
  ?execution_role_session_name_mode:execution_role_session_name_mode ->
  unit ->
  studio_web_portal_settings

val make_r_session_app_settings :
  ?default_resource_spec:resource_spec ->
  ?custom_images:custom_images ->
  unit ->
  r_session_app_settings

val make_r_studio_server_pro_app_settings :
  ?access_status:r_studio_server_pro_access_status ->
  ?user_group:r_studio_server_pro_user_group ->
  unit ->
  r_studio_server_pro_app_settings

val make_tensor_board_app_settings :
  ?default_resource_spec:resource_spec -> unit -> tensor_board_app_settings

val make_sharing_settings :
  ?notebook_output_option:notebook_output_option ->
  ?s3_output_path:s3_uri ->
  ?s3_kms_key_id:kms_key_id ->
  unit ->
  sharing_settings

val make_user_settings :
  ?execution_role:role_arn ->
  ?security_groups:security_group_ids ->
  ?sharing_settings:sharing_settings ->
  ?jupyter_server_app_settings:jupyter_server_app_settings ->
  ?kernel_gateway_app_settings:kernel_gateway_app_settings ->
  ?tensor_board_app_settings:tensor_board_app_settings ->
  ?r_studio_server_pro_app_settings:r_studio_server_pro_app_settings ->
  ?r_session_app_settings:r_session_app_settings ->
  ?canvas_app_settings:canvas_app_settings ->
  ?code_editor_app_settings:code_editor_app_settings ->
  ?jupyter_lab_app_settings:jupyter_lab_app_settings ->
  ?space_storage_settings:default_space_storage_settings ->
  ?default_landing_uri:landing_uri ->
  ?studio_web_portal:studio_web_portal ->
  ?custom_posix_user_config:custom_posix_user_config ->
  ?custom_file_system_configs:custom_file_system_configs ->
  ?studio_web_portal_settings:studio_web_portal_settings ->
  ?auto_mount_home_ef_s:auto_mount_home_ef_s ->
  unit ->
  user_settings

val make_create_domain_request :
  ?domain_settings:domain_settings ->
  ?subnet_ids:subnets ->
  ?vpc_id:vpc_id ->
  ?tags:tag_list ->
  ?app_network_access_type:app_network_access_type ->
  ?home_efs_file_system_kms_key_id:kms_key_id ->
  ?kms_key_id:kms_key_id ->
  ?app_security_group_management:app_security_group_management ->
  ?home_efs_file_system_creation:home_efs_file_system_creation ->
  ?tag_propagation:tag_propagation ->
  ?default_space_settings:default_space_settings ->
  domain_name:domain_name ->
  auth_mode:auth_mode ->
  default_user_settings:user_settings ->
  unit ->
  create_domain_request

val make_create_edge_deployment_plan_response :
  edge_deployment_plan_arn:edge_deployment_plan_arn -> unit -> create_edge_deployment_plan_response

val make_edge_deployment_config :
  failure_handling_policy:failure_handling_policy -> unit -> edge_deployment_config

val make_device_selection_config :
  ?percentage:percentage ->
  ?device_names:device_names ->
  ?device_name_contains:device_name ->
  device_subset_type:device_subset_type ->
  unit ->
  device_selection_config

val make_deployment_stage :
  ?deployment_config:edge_deployment_config ->
  stage_name:entity_name ->
  device_selection_config:device_selection_config ->
  unit ->
  deployment_stage

val make_edge_deployment_model_config :
  model_handle:entity_name ->
  edge_packaging_job_name:entity_name ->
  unit ->
  edge_deployment_model_config

val make_create_edge_deployment_plan_request :
  ?stages:deployment_stages ->
  ?tags:tag_list ->
  edge_deployment_plan_name:entity_name ->
  model_configs:edge_deployment_model_configs ->
  device_fleet_name:entity_name ->
  unit ->
  create_edge_deployment_plan_request

val make_create_edge_deployment_stage_request :
  edge_deployment_plan_name:entity_name ->
  stages:deployment_stages ->
  unit ->
  create_edge_deployment_stage_request

val make_create_edge_packaging_job_request :
  ?resource_key:kms_key_id ->
  ?tags:tag_list ->
  edge_packaging_job_name:entity_name ->
  compilation_job_name:entity_name ->
  model_name:entity_name ->
  model_version:edge_version ->
  role_arn:role_arn ->
  output_config:edge_output_config ->
  unit ->
  create_edge_packaging_job_request

val make_create_endpoint_output : endpoint_arn:endpoint_arn -> unit -> create_endpoint_output

val make_rolling_update_policy :
  ?maximum_execution_timeout_in_seconds:maximum_execution_timeout_in_seconds ->
  ?rollback_maximum_batch_size:capacity_size ->
  maximum_batch_size:capacity_size ->
  wait_interval_in_seconds:wait_interval_in_seconds ->
  unit ->
  rolling_update_policy

val make_deployment_config :
  ?blue_green_update_policy:blue_green_update_policy ->
  ?rolling_update_policy:rolling_update_policy ->
  ?auto_rollback_configuration:auto_rollback_config ->
  unit ->
  deployment_config

val make_create_endpoint_input :
  ?deployment_config:deployment_config ->
  ?tags:tag_list ->
  endpoint_name:endpoint_name ->
  endpoint_config_name:endpoint_config_name ->
  unit ->
  create_endpoint_input

val make_create_endpoint_config_output :
  endpoint_config_arn:endpoint_config_arn -> unit -> create_endpoint_config_output

val make_metrics_config :
  ?enable_enhanced_metrics:enable_enhanced_metrics ->
  ?enable_detailed_observability:enable_detailed_observability ->
  ?metric_publish_frequency_in_seconds:metric_publish_frequency_in_seconds ->
  unit ->
  metrics_config

val make_production_variant_capacity_reservation_config :
  ?capacity_reservation_preference:capacity_reservation_preference ->
  ?ml_reservation_arn:ml_reservation_arn ->
  unit ->
  production_variant_capacity_reservation_config

val make_production_variant_routing_config :
  routing_strategy:routing_strategy -> unit -> production_variant_routing_config

val make_production_variant_managed_instance_scaling_scale_in_policy :
  ?maximum_step_size:managed_instance_scaling_maximum_step_size ->
  ?cooldown_in_minutes:managed_instance_scaling_cooldown_in_minutes ->
  strategy:managed_instance_scaling_scale_in_strategy ->
  unit ->
  production_variant_managed_instance_scaling_scale_in_policy

val make_production_variant_managed_instance_scaling :
  ?status:managed_instance_scaling_status ->
  ?min_instance_count:managed_instance_scaling_min_instance_count ->
  ?max_instance_count:managed_instance_scaling_max_instance_count ->
  ?scale_in_policy:production_variant_managed_instance_scaling_scale_in_policy ->
  unit ->
  production_variant_managed_instance_scaling

val make_production_variant_serverless_config :
  ?provisioned_concurrency:serverless_provisioned_concurrency ->
  memory_size_in_m_b:serverless_memory_size_in_m_b ->
  max_concurrency:serverless_max_concurrency ->
  unit ->
  production_variant_serverless_config

val make_production_variant_core_dump_config :
  ?kms_key_id:kms_key_id ->
  destination_s3_uri:destination_s3_uri ->
  unit ->
  production_variant_core_dump_config

val make_instance_pool :
  ?model_name_override:model_name ->
  instance_type:production_variant_instance_type ->
  priority:instance_pool_priority ->
  unit ->
  instance_pool

val make_production_variant :
  ?model_name:model_name ->
  ?initial_instance_count:initial_task_count ->
  ?instance_type:production_variant_instance_type ->
  ?instance_pools:instance_pool_list ->
  ?variant_instance_provision_timeout_in_seconds:variant_instance_provision_timeout_in_seconds ->
  ?initial_variant_weight:variant_weight ->
  ?accelerator_type:production_variant_accelerator_type ->
  ?core_dump_config:production_variant_core_dump_config ->
  ?serverless_config:production_variant_serverless_config ->
  ?volume_size_in_g_b:production_variant_volume_size_in_g_b ->
  ?model_data_download_timeout_in_seconds:production_variant_model_data_download_timeout_in_seconds ->
  ?container_startup_health_check_timeout_in_seconds:
    production_variant_container_startup_health_check_timeout_in_seconds ->
  ?enable_ssm_access:production_variant_ssm_access ->
  ?managed_instance_scaling:production_variant_managed_instance_scaling ->
  ?routing_config:production_variant_routing_config ->
  ?inference_ami_version:production_variant_inference_ami_version ->
  ?capacity_reservation_config:production_variant_capacity_reservation_config ->
  variant_name:variant_name ->
  unit ->
  production_variant

val make_explainer_config :
  ?clarify_explainer_config:clarify_explainer_config -> unit -> explainer_config

val make_data_capture_config :
  ?enable_capture:enable_capture ->
  ?kms_key_id:kms_key_id ->
  ?capture_content_type_header:capture_content_type_header ->
  initial_sampling_percentage:sampling_percentage ->
  destination_s3_uri:destination_s3_uri ->
  capture_options:capture_option_list ->
  unit ->
  data_capture_config

val make_create_endpoint_config_input :
  ?data_capture_config:data_capture_config ->
  ?tags:tag_list ->
  ?kms_key_id:kms_key_id ->
  ?async_inference_config:async_inference_config ->
  ?explainer_config:explainer_config ->
  ?shadow_production_variants:production_variant_list ->
  ?execution_role_arn:role_arn ->
  ?vpc_config:vpc_config ->
  ?enable_network_isolation:boolean_ ->
  ?metrics_config:metrics_config ->
  endpoint_config_name:endpoint_config_name ->
  production_variants:production_variant_list ->
  unit ->
  create_endpoint_config_input

val make_create_experiment_response :
  ?experiment_arn:experiment_arn -> unit -> create_experiment_response

val make_create_experiment_request :
  ?display_name:experiment_entity_name ->
  ?description:experiment_description ->
  ?tags:tag_list ->
  experiment_name:experiment_entity_name ->
  unit ->
  create_experiment_request

val make_create_feature_group_response :
  feature_group_arn:feature_group_arn -> unit -> create_feature_group_response

val make_throughput_config :
  ?provisioned_read_capacity_units:capacity_unit ->
  ?provisioned_write_capacity_units:capacity_unit ->
  throughput_mode:throughput_mode ->
  unit ->
  throughput_config

val make_data_catalog_config :
  table_name:table_name -> catalog:catalog -> database:database -> unit -> data_catalog_config

val make_s3_storage_config :
  ?kms_key_id:kms_key_id ->
  ?resolved_output_s3_uri:s3_uri ->
  s3_uri:s3_uri ->
  unit ->
  s3_storage_config

val make_offline_store_config :
  ?disable_glue_table_creation:boolean_ ->
  ?data_catalog_config:data_catalog_config ->
  ?table_format:table_format ->
  s3_storage_config:s3_storage_config ->
  unit ->
  offline_store_config

val make_ttl_duration :
  ?unit_:ttl_duration_unit -> ?value:ttl_duration_value -> unit -> ttl_duration

val make_online_store_security_config :
  ?kms_key_id:kms_key_id -> unit -> online_store_security_config

val make_online_store_config :
  ?security_config:online_store_security_config ->
  ?enable_online_store:boolean_ ->
  ?ttl_duration:ttl_duration ->
  ?storage_type:storage_type ->
  unit ->
  online_store_config

val make_feature_definition :
  ?collection_type:collection_type ->
  ?collection_config:collection_config ->
  feature_name:feature_name ->
  feature_type:feature_type ->
  unit ->
  feature_definition

val make_create_feature_group_request :
  ?online_store_config:online_store_config ->
  ?offline_store_config:offline_store_config ->
  ?throughput_config:throughput_config ->
  ?role_arn:role_arn ->
  ?description:description ->
  ?tags:tag_list ->
  feature_group_name:feature_group_name ->
  record_identifier_feature_name:feature_name ->
  event_time_feature_name:feature_name ->
  feature_definitions:feature_definitions ->
  unit ->
  create_feature_group_request

val make_create_flow_definition_response :
  flow_definition_arn:flow_definition_arn -> unit -> create_flow_definition_response

val make_flow_definition_output_config :
  ?kms_key_id:kms_key_id -> s3_output_path:s3_uri -> unit -> flow_definition_output_config

val make_us_d :
  ?dollars:dollars ->
  ?cents:cents ->
  ?tenth_fractions_of_a_cent:tenth_fractions_of_a_cent ->
  unit ->
  us_d

val make_public_workforce_task_price : ?amount_in_usd:us_d -> unit -> public_workforce_task_price

val make_human_loop_config :
  ?task_availability_lifetime_in_seconds:flow_definition_task_availability_lifetime_in_seconds ->
  ?task_time_limit_in_seconds:flow_definition_task_time_limit_in_seconds ->
  ?task_keywords:flow_definition_task_keywords ->
  ?public_workforce_task_price:public_workforce_task_price ->
  workteam_arn:workteam_arn ->
  human_task_ui_arn:human_task_ui_arn ->
  task_title:flow_definition_task_title ->
  task_description:flow_definition_task_description ->
  task_count:flow_definition_task_count ->
  unit ->
  human_loop_config

val make_human_loop_activation_conditions_config :
  human_loop_activation_conditions:human_loop_activation_conditions ->
  unit ->
  human_loop_activation_conditions_config

val make_human_loop_activation_config :
  human_loop_activation_conditions_config:human_loop_activation_conditions_config ->
  unit ->
  human_loop_activation_config

val make_human_loop_request_source :
  aws_managed_human_loop_request_source:aws_managed_human_loop_request_source ->
  unit ->
  human_loop_request_source

val make_create_flow_definition_request :
  ?human_loop_request_source:human_loop_request_source ->
  ?human_loop_activation_config:human_loop_activation_config ->
  ?human_loop_config:human_loop_config ->
  ?tags:tag_list ->
  flow_definition_name:flow_definition_name ->
  output_config:flow_definition_output_config ->
  role_arn:role_arn ->
  unit ->
  create_flow_definition_request

val make_create_hub_response : hub_arn:hub_arn -> unit -> create_hub_response
val make_hub_s3_storage_config : ?s3_output_path:s3_output_path -> unit -> hub_s3_storage_config

val make_create_hub_request :
  ?hub_display_name:hub_display_name ->
  ?hub_search_keywords:hub_search_keyword_list ->
  ?s3_storage_config:hub_s3_storage_config ->
  ?tags:tag_list ->
  hub_name:hub_name ->
  hub_description:hub_description ->
  unit ->
  create_hub_request

val make_create_hub_content_presigned_urls_response :
  ?next_token:next_token ->
  authorized_url_configs:authorized_url_configs ->
  unit ->
  create_hub_content_presigned_urls_response

val make_presigned_url_access_config :
  ?accept_eula:boolean_ -> ?expected_s3_url:s3_model_uri -> unit -> presigned_url_access_config

val make_create_hub_content_presigned_urls_request :
  ?hub_content_version:hub_content_version ->
  ?access_config:presigned_url_access_config ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  hub_name:hub_name_or_arn ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  unit ->
  create_hub_content_presigned_urls_request

val make_create_hub_content_reference_response :
  hub_arn:hub_arn ->
  hub_content_arn:hub_content_arn ->
  unit ->
  create_hub_content_reference_response

val make_create_hub_content_reference_request :
  ?hub_content_name:hub_content_name ->
  ?min_version:hub_content_version ->
  ?tags:tag_list ->
  hub_name:hub_name_or_arn ->
  sage_maker_public_hub_content_arn:sage_maker_public_hub_content_arn ->
  unit ->
  create_hub_content_reference_request

val make_create_human_task_ui_response :
  human_task_ui_arn:human_task_ui_arn -> unit -> create_human_task_ui_response

val make_ui_template : content:template_content -> unit -> ui_template

val make_create_human_task_ui_request :
  ?tags:tag_list ->
  human_task_ui_name:human_task_ui_name ->
  ui_template:ui_template ->
  unit ->
  create_human_task_ui_request

val make_create_hyper_parameter_tuning_job_response :
  hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  unit ->
  create_hyper_parameter_tuning_job_response

val make_parent_hyper_parameter_tuning_job :
  ?hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  parent_hyper_parameter_tuning_job

val make_hyper_parameter_tuning_job_warm_start_config :
  parent_hyper_parameter_tuning_jobs:parent_hyper_parameter_tuning_jobs ->
  warm_start_type:hyper_parameter_tuning_job_warm_start_type ->
  unit ->
  hyper_parameter_tuning_job_warm_start_config

val make_retry_strategy : maximum_retry_attempts:maximum_retry_attempts -> unit -> retry_strategy

val make_hyper_parameter_tuning_instance_config :
  instance_type:training_instance_type ->
  instance_count:training_instance_count ->
  volume_size_in_g_b:volume_size_in_g_b ->
  unit ->
  hyper_parameter_tuning_instance_config

val make_hyper_parameter_tuning_resource_config :
  ?instance_type:training_instance_type ->
  ?instance_count:training_instance_count ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?volume_kms_key_id:kms_key_id ->
  ?allocation_strategy:hyper_parameter_tuning_allocation_strategy ->
  ?instance_configs:hyper_parameter_tuning_instance_configs ->
  unit ->
  hyper_parameter_tuning_resource_config

val make_hyper_parameter_algorithm_specification :
  ?training_image:algorithm_image ->
  ?algorithm_name:arn_or_name ->
  ?metric_definitions:metric_definition_list ->
  training_input_mode:training_input_mode ->
  unit ->
  hyper_parameter_algorithm_specification

val make_integer_parameter_range :
  ?scaling_type:hyper_parameter_scaling_type ->
  name:parameter_key ->
  min_value:parameter_value ->
  max_value:parameter_value ->
  unit ->
  integer_parameter_range

val make_parameter_ranges :
  ?integer_parameter_ranges:integer_parameter_ranges ->
  ?continuous_parameter_ranges:continuous_parameter_ranges ->
  ?categorical_parameter_ranges:categorical_parameter_ranges ->
  ?auto_parameters:auto_parameters ->
  unit ->
  parameter_ranges

val make_hyper_parameter_training_job_definition :
  ?definition_name:hyper_parameter_training_job_definition_name ->
  ?tuning_objective:hyper_parameter_tuning_job_objective ->
  ?hyper_parameter_ranges:parameter_ranges ->
  ?static_hyper_parameters:hyper_parameters ->
  ?input_data_config:input_data_config ->
  ?vpc_config:vpc_config ->
  ?resource_config:resource_config ->
  ?hyper_parameter_tuning_resource_config:hyper_parameter_tuning_resource_config ->
  ?enable_network_isolation:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_managed_spot_training:boolean_ ->
  ?checkpoint_config:checkpoint_config ->
  ?retry_strategy:retry_strategy ->
  ?environment:hyper_parameter_training_job_environment_map ->
  algorithm_specification:hyper_parameter_algorithm_specification ->
  role_arn:role_arn ->
  output_data_config:output_data_config ->
  stopping_condition:stopping_condition ->
  unit ->
  hyper_parameter_training_job_definition

val make_tuning_job_completion_criteria :
  ?target_objective_metric_value:target_objective_metric_value ->
  ?best_objective_not_improving:best_objective_not_improving ->
  ?convergence_detected:convergence_detected ->
  unit ->
  tuning_job_completion_criteria

val make_resource_limits :
  ?max_number_of_training_jobs:max_number_of_training_jobs ->
  ?max_runtime_in_seconds:hyper_parameter_tuning_max_runtime_in_seconds ->
  max_parallel_training_jobs:max_parallel_training_jobs ->
  unit ->
  resource_limits

val make_hyperband_strategy_config :
  ?min_resource:hyperband_strategy_min_resource ->
  ?max_resource:hyperband_strategy_max_resource ->
  unit ->
  hyperband_strategy_config

val make_hyper_parameter_tuning_job_strategy_config :
  ?hyperband_strategy_config:hyperband_strategy_config ->
  unit ->
  hyper_parameter_tuning_job_strategy_config

val make_hyper_parameter_tuning_job_config :
  ?strategy_config:hyper_parameter_tuning_job_strategy_config ->
  ?hyper_parameter_tuning_job_objective:hyper_parameter_tuning_job_objective ->
  ?parameter_ranges:parameter_ranges ->
  ?training_job_early_stopping_type:training_job_early_stopping_type ->
  ?tuning_job_completion_criteria:tuning_job_completion_criteria ->
  ?random_seed:random_seed ->
  strategy:hyper_parameter_tuning_job_strategy_type ->
  resource_limits:resource_limits ->
  unit ->
  hyper_parameter_tuning_job_config

val make_create_hyper_parameter_tuning_job_request :
  ?training_job_definition:hyper_parameter_training_job_definition ->
  ?training_job_definitions:hyper_parameter_training_job_definitions ->
  ?warm_start_config:hyper_parameter_tuning_job_warm_start_config ->
  ?tags:tag_list ->
  ?autotune:autotune ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  hyper_parameter_tuning_job_config:hyper_parameter_tuning_job_config ->
  unit ->
  create_hyper_parameter_tuning_job_request

val make_create_image_response : ?image_arn:image_arn -> unit -> create_image_response

val make_create_image_request :
  ?description:image_description ->
  ?display_name:image_display_name ->
  ?tags:tag_list ->
  image_name:image_name ->
  role_arn:role_arn ->
  unit ->
  create_image_request

val make_create_image_version_response :
  ?image_version_arn:image_version_arn -> unit -> create_image_version_response

val make_create_image_version_request :
  ?aliases:sage_maker_image_version_aliases ->
  ?vendor_guidance:vendor_guidance ->
  ?job_type:job_type ->
  ?ml_framework:ml_framework ->
  ?programming_lang:programming_lang ->
  ?processor:processor ->
  ?horovod:horovod ->
  ?release_notes:release_notes ->
  base_image:image_base_image ->
  client_token:client_token ->
  image_name:image_name ->
  unit ->
  create_image_version_request

val make_create_inference_component_output :
  inference_component_arn:inference_component_arn -> unit -> create_inference_component_output

val make_inference_component_runtime_config :
  copy_count:inference_component_copy_count -> unit -> inference_component_runtime_config

val make_inference_component_availability_zone_balance :
  ?max_imbalance:availability_zone_balance_max_imbalance ->
  enforcement_mode:availability_zone_balance_enforcement_mode ->
  unit ->
  inference_component_availability_zone_balance

val make_inference_component_scheduling_config :
  ?availability_zone_balance:inference_component_availability_zone_balance ->
  placement_strategy:inference_component_placement_strategy ->
  unit ->
  inference_component_scheduling_config

val make_inference_component_data_cache_config :
  enable_caching:enable_caching -> unit -> inference_component_data_cache_config

val make_inference_component_compute_resource_requirements :
  ?number_of_cpu_cores_required:number_of_cpu_cores ->
  ?number_of_accelerator_devices_required:number_of_accelerator_devices ->
  ?max_memory_required_in_mb:memory_in_mb ->
  min_memory_required_in_mb:memory_in_mb ->
  unit ->
  inference_component_compute_resource_requirements

val make_inference_component_startup_parameters :
  ?model_data_download_timeout_in_seconds:production_variant_model_data_download_timeout_in_seconds ->
  ?container_startup_health_check_timeout_in_seconds:
    production_variant_container_startup_health_check_timeout_in_seconds ->
  unit ->
  inference_component_startup_parameters

val make_inference_component_container_specification :
  ?image:container_image ->
  ?artifact_url:url ->
  ?environment:environment_map ->
  ?container_metrics_config:container_metrics_config ->
  unit ->
  inference_component_container_specification

val make_inference_component_specification :
  ?instance_type:production_variant_instance_type ->
  ?model_name:model_name ->
  ?container:inference_component_container_specification ->
  ?startup_parameters:inference_component_startup_parameters ->
  ?compute_resource_requirements:inference_component_compute_resource_requirements ->
  ?base_inference_component_name:inference_component_name ->
  ?data_cache_config:inference_component_data_cache_config ->
  ?scheduling_config:inference_component_scheduling_config ->
  unit ->
  inference_component_specification

val make_create_inference_component_input :
  ?variant_name:variant_name ->
  ?specification:inference_component_specification ->
  ?specifications:inference_component_specification_list ->
  ?runtime_config:inference_component_runtime_config ->
  ?tags:tag_list ->
  inference_component_name:inference_component_name ->
  endpoint_name:endpoint_name ->
  unit ->
  create_inference_component_input

val make_create_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> create_inference_experiment_response

val make_shadow_model_variant_config :
  shadow_model_variant_name:model_variant_name ->
  sampling_percentage:percentage ->
  unit ->
  shadow_model_variant_config

val make_shadow_mode_config :
  source_model_variant_name:model_variant_name ->
  shadow_model_variants:shadow_model_variant_config_list ->
  unit ->
  shadow_mode_config

val make_inference_experiment_data_storage_config :
  ?kms_key:kms_key_id ->
  ?content_type:capture_content_type_header ->
  destination:destination_s3_uri ->
  unit ->
  inference_experiment_data_storage_config

val make_real_time_inference_config :
  instance_type:production_variant_instance_type ->
  instance_count:task_count ->
  unit ->
  real_time_inference_config

val make_model_infrastructure_config :
  infrastructure_type:model_infrastructure_type ->
  real_time_inference_config:real_time_inference_config ->
  unit ->
  model_infrastructure_config

val make_model_variant_config :
  model_name:model_name ->
  variant_name:model_variant_name ->
  infrastructure_config:model_infrastructure_config ->
  unit ->
  model_variant_config

val make_inference_experiment_schedule :
  ?start_time:timestamp -> ?end_time:timestamp -> unit -> inference_experiment_schedule

val make_create_inference_experiment_request :
  ?schedule:inference_experiment_schedule ->
  ?description:inference_experiment_description ->
  ?data_storage_config:inference_experiment_data_storage_config ->
  ?kms_key:kms_key_id ->
  ?tags:tag_list ->
  name:inference_experiment_name ->
  type_:inference_experiment_type ->
  role_arn:role_arn ->
  endpoint_name:endpoint_name ->
  model_variants:model_variant_config_list ->
  shadow_mode_config:shadow_mode_config ->
  unit ->
  create_inference_experiment_request

val make_create_inference_recommendations_job_response :
  job_arn:recommendation_job_arn -> unit -> create_inference_recommendations_job_response

val make_recommendation_job_compiled_output_config :
  ?s3_output_uri:s3_uri -> unit -> recommendation_job_compiled_output_config

val make_recommendation_job_output_config :
  ?kms_key_id:kms_key_id ->
  ?compiled_output_config:recommendation_job_compiled_output_config ->
  unit ->
  recommendation_job_output_config

val make_model_latency_threshold :
  ?percentile:string64 -> ?value_in_milliseconds:integer -> unit -> model_latency_threshold

val make_recommendation_job_stopping_conditions :
  ?max_invocations:integer ->
  ?model_latency_thresholds:model_latency_thresholds ->
  ?flat_invocations:flat_invocations ->
  unit ->
  recommendation_job_stopping_conditions

val make_recommendation_job_vpc_config :
  security_group_ids:recommendation_job_vpc_security_group_ids ->
  subnets:recommendation_job_vpc_subnets ->
  unit ->
  recommendation_job_vpc_config

val make_endpoint_info : ?endpoint_name:endpoint_name -> unit -> endpoint_info

val make_recommendation_job_payload_config :
  ?sample_payload_url:s3_uri ->
  ?supported_content_types:recommendation_job_supported_content_types ->
  unit ->
  recommendation_job_payload_config

val make_recommendation_job_container_config :
  ?domain:string_ ->
  ?task:string_ ->
  ?framework:string_ ->
  ?framework_version:recommendation_job_framework_version ->
  ?payload_config:recommendation_job_payload_config ->
  ?nearest_model_name:string_ ->
  ?supported_instance_types:recommendation_job_supported_instance_types ->
  ?supported_endpoint_type:recommendation_job_supported_endpoint_type ->
  ?data_input_config:recommendation_job_data_input_config ->
  ?supported_response_mime_types:recommendation_job_supported_response_mime_types ->
  unit ->
  recommendation_job_container_config

val make_environment_parameter_ranges :
  ?categorical_parameter_ranges:categorical_parameters -> unit -> environment_parameter_ranges

val make_endpoint_input_configuration :
  ?instance_type:production_variant_instance_type ->
  ?serverless_config:production_variant_serverless_config ->
  ?inference_specification_name:inference_specification_name ->
  ?environment_parameter_ranges:environment_parameter_ranges ->
  unit ->
  endpoint_input_configuration

val make_recommendation_job_resource_limit :
  ?max_number_of_tests:max_number_of_tests ->
  ?max_parallel_of_tests:max_parallel_of_tests ->
  unit ->
  recommendation_job_resource_limit

val make_stairs :
  ?duration_in_seconds:traffic_duration_in_seconds ->
  ?number_of_steps:number_of_steps ->
  ?users_per_step:users_per_step ->
  unit ->
  stairs

val make_phase :
  ?initial_number_of_users:initial_number_of_users ->
  ?spawn_rate:spawn_rate ->
  ?duration_in_seconds:traffic_duration_in_seconds ->
  unit ->
  phase

val make_traffic_pattern :
  ?traffic_type:traffic_type -> ?phases:phases -> ?stairs:stairs -> unit -> traffic_pattern

val make_recommendation_job_input_config :
  ?model_package_version_arn:model_package_arn ->
  ?model_name:model_name ->
  ?job_duration_in_seconds:job_duration_in_seconds ->
  ?traffic_pattern:traffic_pattern ->
  ?resource_limit:recommendation_job_resource_limit ->
  ?endpoint_configurations:endpoint_input_configurations ->
  ?volume_kms_key_id:kms_key_id ->
  ?container_config:recommendation_job_container_config ->
  ?endpoints:endpoints ->
  ?vpc_config:recommendation_job_vpc_config ->
  unit ->
  recommendation_job_input_config

val make_create_inference_recommendations_job_request :
  ?job_description:recommendation_job_description ->
  ?stopping_conditions:recommendation_job_stopping_conditions ->
  ?output_config:recommendation_job_output_config ->
  ?tags:tag_list ->
  job_name:recommendation_job_name ->
  job_type:recommendation_job_type ->
  role_arn:role_arn ->
  input_config:recommendation_job_input_config ->
  unit ->
  create_inference_recommendations_job_request

val make_create_job_response : job_arn:job_arn -> unit -> create_job_response

val make_create_job_request :
  ?tags:tag_list ->
  job_name:job_name ->
  role_arn:role_arn ->
  job_category:job_category ->
  job_config_schema_version:job_schema_version ->
  job_config_document:job_config_document ->
  unit ->
  create_job_request

val make_create_labeling_job_response :
  labeling_job_arn:labeling_job_arn -> unit -> create_labeling_job_response

val make_ui_config :
  ?ui_template_s3_uri:s3_uri -> ?human_task_ui_arn:human_task_ui_arn -> unit -> ui_config

val make_human_task_config :
  ?pre_human_task_lambda_arn:lambda_function_arn ->
  ?task_keywords:task_keywords ->
  ?task_availability_lifetime_in_seconds:task_availability_lifetime_in_seconds ->
  ?max_concurrent_task_count:max_concurrent_task_count ->
  ?annotation_consolidation_config:annotation_consolidation_config ->
  ?public_workforce_task_price:public_workforce_task_price ->
  workteam_arn:workteam_arn ->
  ui_config:ui_config ->
  task_title:task_title ->
  task_description:task_description ->
  number_of_human_workers_per_data_object:number_of_human_workers_per_data_object ->
  task_time_limit_in_seconds:task_time_limit_in_seconds ->
  unit ->
  human_task_config

val make_labeling_job_resource_config :
  ?volume_kms_key_id:kms_key_id -> ?vpc_config:vpc_config -> unit -> labeling_job_resource_config

val make_labeling_job_algorithms_config :
  ?initial_active_learning_model_arn:model_arn ->
  ?labeling_job_resource_config:labeling_job_resource_config ->
  labeling_job_algorithm_specification_arn:labeling_job_algorithm_specification_arn ->
  unit ->
  labeling_job_algorithms_config

val make_labeling_job_stopping_conditions :
  ?max_human_labeled_object_count:max_human_labeled_object_count ->
  ?max_percentage_of_input_dataset_labeled:max_percentage_of_input_dataset_labeled ->
  unit ->
  labeling_job_stopping_conditions

val make_labeling_job_output_config :
  ?kms_key_id:kms_key_id ->
  ?sns_topic_arn:sns_topic_arn ->
  s3_output_path:s3_uri ->
  unit ->
  labeling_job_output_config

val make_labeling_job_data_attributes :
  ?content_classifiers:content_classifiers -> unit -> labeling_job_data_attributes

val make_labeling_job_sns_data_source :
  sns_topic_arn:sns_topic_arn -> unit -> labeling_job_sns_data_source

val make_labeling_job_s3_data_source : manifest_s3_uri:s3_uri -> unit -> labeling_job_s3_data_source

val make_labeling_job_data_source :
  ?s3_data_source:labeling_job_s3_data_source ->
  ?sns_data_source:labeling_job_sns_data_source ->
  unit ->
  labeling_job_data_source

val make_labeling_job_input_config :
  ?data_attributes:labeling_job_data_attributes ->
  data_source:labeling_job_data_source ->
  unit ->
  labeling_job_input_config

val make_create_labeling_job_request :
  ?label_category_config_s3_uri:s3_uri ->
  ?stopping_conditions:labeling_job_stopping_conditions ->
  ?labeling_job_algorithms_config:labeling_job_algorithms_config ->
  ?tags:tag_list ->
  labeling_job_name:labeling_job_name ->
  label_attribute_name:label_attribute_name ->
  input_config:labeling_job_input_config ->
  output_config:labeling_job_output_config ->
  role_arn:role_arn ->
  human_task_config:human_task_config ->
  unit ->
  create_labeling_job_request

val make_create_mlflow_app_response : ?arn:mlflow_app_arn -> unit -> create_mlflow_app_response

val make_create_mlflow_app_request :
  ?model_registration_mode:model_registration_mode ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?account_default_status:account_default_status ->
  ?default_domain_id_list:default_domain_id_list ->
  ?tags:tag_list ->
  name:mlflow_app_name ->
  artifact_store_uri:s3_uri ->
  role_arn:role_arn ->
  unit ->
  create_mlflow_app_request

val make_create_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> create_mlflow_tracking_server_response

val make_create_mlflow_tracking_server_request :
  ?tracking_server_size:tracking_server_size ->
  ?mlflow_version:mlflow_version ->
  ?automatic_model_registration:boolean_ ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?tags:tag_list ->
  ?s3_bucket_owner_account_id:account_id ->
  ?s3_bucket_owner_verification:boolean_ ->
  tracking_server_name:tracking_server_name ->
  artifact_store_uri:s3_uri ->
  role_arn:role_arn ->
  unit ->
  create_mlflow_tracking_server_request

val make_create_model_output : model_arn:model_arn -> unit -> create_model_output

val make_inference_execution_config :
  mode:inference_execution_mode -> unit -> inference_execution_config

val make_create_model_input :
  ?primary_container:container_definition ->
  ?containers:container_definition_list ->
  ?inference_execution_config:inference_execution_config ->
  ?execution_role_arn:role_arn ->
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?enable_network_isolation:boolean_ ->
  model_name:model_name ->
  unit ->
  create_model_input

val make_create_model_bias_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_model_bias_job_definition_response

val make_monitoring_ground_truth_s3_input :
  ?s3_uri:monitoring_s3_uri -> unit -> monitoring_ground_truth_s3_input

val make_model_bias_job_input :
  ?endpoint_input:endpoint_input ->
  ?batch_transform_input:batch_transform_input ->
  ground_truth_s3_input:monitoring_ground_truth_s3_input ->
  unit ->
  model_bias_job_input

val make_model_bias_app_specification :
  ?environment:monitoring_environment_map ->
  image_uri:image_uri ->
  config_uri:s3_uri ->
  unit ->
  model_bias_app_specification

val make_model_bias_baseline_config :
  ?baselining_job_name:processing_job_name ->
  ?constraints_resource:monitoring_constraints_resource ->
  unit ->
  model_bias_baseline_config

val make_create_model_bias_job_definition_request :
  ?model_bias_baseline_config:model_bias_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?tags:tag_list ->
  job_definition_name:monitoring_job_definition_name ->
  model_bias_app_specification:model_bias_app_specification ->
  model_bias_job_input:model_bias_job_input ->
  model_bias_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  create_model_bias_job_definition_request

val make_create_model_card_response :
  model_card_arn:model_card_arn -> unit -> create_model_card_response

val make_model_card_security_config : ?kms_key_id:kms_key_id -> unit -> model_card_security_config

val make_create_model_card_request :
  ?security_config:model_card_security_config ->
  ?tags:tag_list ->
  model_card_name:entity_name ->
  content:model_card_content ->
  model_card_status:model_card_status ->
  unit ->
  create_model_card_request

val make_create_model_card_export_job_response :
  model_card_export_job_arn:model_card_export_job_arn ->
  unit ->
  create_model_card_export_job_response

val make_model_card_export_output_config :
  s3_output_path:s3_uri -> unit -> model_card_export_output_config

val make_create_model_card_export_job_request :
  ?model_card_version:integer ->
  model_card_name:model_card_name_or_arn ->
  model_card_export_job_name:entity_name ->
  output_config:model_card_export_output_config ->
  unit ->
  create_model_card_export_job_request

val make_create_model_explainability_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_model_explainability_job_definition_response

val make_model_explainability_job_input :
  ?endpoint_input:endpoint_input ->
  ?batch_transform_input:batch_transform_input ->
  unit ->
  model_explainability_job_input

val make_model_explainability_app_specification :
  ?environment:monitoring_environment_map ->
  image_uri:image_uri ->
  config_uri:s3_uri ->
  unit ->
  model_explainability_app_specification

val make_model_explainability_baseline_config :
  ?baselining_job_name:processing_job_name ->
  ?constraints_resource:monitoring_constraints_resource ->
  unit ->
  model_explainability_baseline_config

val make_create_model_explainability_job_definition_request :
  ?model_explainability_baseline_config:model_explainability_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?tags:tag_list ->
  job_definition_name:monitoring_job_definition_name ->
  model_explainability_app_specification:model_explainability_app_specification ->
  model_explainability_job_input:model_explainability_job_input ->
  model_explainability_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  create_model_explainability_job_definition_request

val make_create_model_package_output :
  model_package_arn:model_package_arn -> unit -> create_model_package_output

val make_model_life_cycle :
  ?stage_description:stage_description ->
  stage:entity_name ->
  stage_status:entity_name ->
  unit ->
  model_life_cycle

val make_model_package_model_card :
  ?model_card_content:model_card_content ->
  ?model_card_status:model_card_status ->
  unit ->
  model_package_model_card

val make_model_package_security_config :
  kms_key_id:kms_key_id -> unit -> model_package_security_config

val make_drift_check_model_data_quality :
  ?statistics:metrics_source ->
  ?constraints:metrics_source ->
  unit ->
  drift_check_model_data_quality

val make_drift_check_model_quality :
  ?statistics:metrics_source -> ?constraints:metrics_source -> unit -> drift_check_model_quality

val make_file_source :
  ?content_type:content_type ->
  ?content_digest:content_digest ->
  s3_uri:s3_uri ->
  unit ->
  file_source

val make_drift_check_explainability :
  ?constraints:metrics_source -> ?config_file:file_source -> unit -> drift_check_explainability

val make_drift_check_bias :
  ?config_file:file_source ->
  ?pre_training_constraints:metrics_source ->
  ?post_training_constraints:metrics_source ->
  unit ->
  drift_check_bias

val make_drift_check_baselines :
  ?bias:drift_check_bias ->
  ?explainability:drift_check_explainability ->
  ?model_quality:drift_check_model_quality ->
  ?model_data_quality:drift_check_model_data_quality ->
  unit ->
  drift_check_baselines

val make_explainability : ?report:metrics_source -> unit -> explainability

val make_model_data_quality :
  ?statistics:metrics_source -> ?constraints:metrics_source -> unit -> model_data_quality

val make_model_quality :
  ?statistics:metrics_source -> ?constraints:metrics_source -> unit -> model_quality

val make_model_metrics :
  ?model_quality:model_quality ->
  ?model_data_quality:model_data_quality ->
  ?bias:bias ->
  ?explainability:explainability ->
  unit ->
  model_metrics

val make_source_algorithm :
  ?model_data_url:url ->
  ?model_data_source:model_data_source ->
  ?model_data_e_tag:string_ ->
  algorithm_name:arn_or_name ->
  unit ->
  source_algorithm

val make_source_algorithm_specification :
  source_algorithms:source_algorithm_list -> unit -> source_algorithm_specification

val make_model_package_validation_profile :
  profile_name:entity_name ->
  transform_job_definition:transform_job_definition ->
  unit ->
  model_package_validation_profile

val make_model_package_validation_specification :
  validation_role:role_arn ->
  validation_profiles:model_package_validation_profiles ->
  unit ->
  model_package_validation_specification

val make_create_model_package_input :
  ?model_package_name:entity_name ->
  ?model_package_group_name:arn_or_name ->
  ?model_package_description:entity_description ->
  ?model_package_registration_type:model_package_registration_type ->
  ?inference_specification:inference_specification ->
  ?validation_specification:model_package_validation_specification ->
  ?source_algorithm_specification:source_algorithm_specification ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?tags:tag_list ->
  ?model_approval_status:model_approval_status ->
  ?metadata_properties:metadata_properties ->
  ?model_metrics:model_metrics ->
  ?client_token:client_token ->
  ?domain:string_ ->
  ?task:string_ ->
  ?sample_payload_url:s3_uri ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?drift_check_baselines:drift_check_baselines ->
  ?additional_inference_specifications:additional_inference_specifications ->
  ?skip_model_validation:skip_model_validation ->
  ?source_uri:model_package_source_uri ->
  ?security_config:model_package_security_config ->
  ?model_card:model_package_model_card ->
  ?model_life_cycle:model_life_cycle ->
  ?managed_storage_type:managed_storage_type ->
  unit ->
  create_model_package_input

val make_create_model_package_group_output :
  model_package_group_arn:model_package_group_arn -> unit -> create_model_package_group_output

val make_managed_configuration :
  ?managed_storage_type:managed_storage_type -> unit -> managed_configuration

val make_create_model_package_group_input :
  ?model_package_group_description:entity_description ->
  ?tags:tag_list ->
  ?managed_configuration:managed_configuration ->
  model_package_group_name:entity_name ->
  unit ->
  create_model_package_group_input

val make_create_model_quality_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_model_quality_job_definition_response

val make_model_quality_job_input :
  ?endpoint_input:endpoint_input ->
  ?batch_transform_input:batch_transform_input ->
  ground_truth_s3_input:monitoring_ground_truth_s3_input ->
  unit ->
  model_quality_job_input

val make_model_quality_app_specification :
  ?container_entrypoint:container_entrypoint ->
  ?container_arguments:monitoring_container_arguments ->
  ?record_preprocessor_source_uri:s3_uri ->
  ?post_analytics_processor_source_uri:s3_uri ->
  ?problem_type:monitoring_problem_type ->
  ?environment:monitoring_environment_map ->
  image_uri:image_uri ->
  unit ->
  model_quality_app_specification

val make_model_quality_baseline_config :
  ?baselining_job_name:processing_job_name ->
  ?constraints_resource:monitoring_constraints_resource ->
  unit ->
  model_quality_baseline_config

val make_create_model_quality_job_definition_request :
  ?model_quality_baseline_config:model_quality_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?tags:tag_list ->
  job_definition_name:monitoring_job_definition_name ->
  model_quality_app_specification:model_quality_app_specification ->
  model_quality_job_input:model_quality_job_input ->
  model_quality_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  create_model_quality_job_definition_request

val make_create_monitoring_schedule_response :
  monitoring_schedule_arn:monitoring_schedule_arn -> unit -> create_monitoring_schedule_response

val make_network_config :
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_network_isolation:boolean_ ->
  ?vpc_config:vpc_config ->
  unit ->
  network_config

val make_monitoring_app_specification :
  ?container_entrypoint:container_entrypoint ->
  ?container_arguments:monitoring_container_arguments ->
  ?record_preprocessor_source_uri:s3_uri ->
  ?post_analytics_processor_source_uri:s3_uri ->
  image_uri:image_uri ->
  unit ->
  monitoring_app_specification

val make_monitoring_input :
  ?endpoint_input:endpoint_input ->
  ?batch_transform_input:batch_transform_input ->
  unit ->
  monitoring_input

val make_monitoring_baseline_config :
  ?baselining_job_name:processing_job_name ->
  ?constraints_resource:monitoring_constraints_resource ->
  ?statistics_resource:monitoring_statistics_resource ->
  unit ->
  monitoring_baseline_config

val make_monitoring_job_definition :
  ?baseline_config:monitoring_baseline_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?environment:monitoring_environment_map ->
  ?network_config:network_config ->
  monitoring_inputs:monitoring_inputs ->
  monitoring_output_config:monitoring_output_config ->
  monitoring_resources:monitoring_resources ->
  monitoring_app_specification:monitoring_app_specification ->
  role_arn:role_arn ->
  unit ->
  monitoring_job_definition

val make_schedule_config :
  ?data_analysis_start_time:string_ ->
  ?data_analysis_end_time:string_ ->
  schedule_expression:schedule_expression ->
  unit ->
  schedule_config

val make_monitoring_schedule_config :
  ?schedule_config:schedule_config ->
  ?monitoring_job_definition:monitoring_job_definition ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?monitoring_type:monitoring_type ->
  unit ->
  monitoring_schedule_config

val make_create_monitoring_schedule_request :
  ?tags:tag_list ->
  monitoring_schedule_name:monitoring_schedule_name ->
  monitoring_schedule_config:monitoring_schedule_config ->
  unit ->
  create_monitoring_schedule_request

val make_create_notebook_instance_output :
  ?notebook_instance_arn:notebook_instance_arn -> unit -> create_notebook_instance_output

val make_instance_metadata_service_configuration :
  minimum_instance_metadata_service_version:minimum_instance_metadata_service_version ->
  unit ->
  instance_metadata_service_configuration

val make_create_notebook_instance_input :
  ?subnet_id:subnet_id ->
  ?security_group_ids:security_group_ids ->
  ?ip_address_type:ip_address_type ->
  ?kms_key_id:kms_key_id ->
  ?tags:tag_list ->
  ?lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?direct_internet_access:direct_internet_access ->
  ?volume_size_in_g_b:notebook_instance_volume_size_in_g_b ->
  ?accelerator_types:notebook_instance_accelerator_types ->
  ?default_code_repository:code_repository_name_or_url ->
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  ?root_access:root_access ->
  ?platform_identifier:platform_identifier ->
  ?instance_metadata_service_configuration:instance_metadata_service_configuration ->
  notebook_instance_name:notebook_instance_name ->
  instance_type:instance_type ->
  role_arn:role_arn ->
  unit ->
  create_notebook_instance_input

val make_create_notebook_instance_lifecycle_config_output :
  ?notebook_instance_lifecycle_config_arn:notebook_instance_lifecycle_config_arn ->
  unit ->
  create_notebook_instance_lifecycle_config_output

val make_notebook_instance_lifecycle_hook :
  ?content:notebook_instance_lifecycle_config_content -> unit -> notebook_instance_lifecycle_hook

val make_create_notebook_instance_lifecycle_config_input :
  ?on_create:notebook_instance_lifecycle_config_list ->
  ?on_start:notebook_instance_lifecycle_config_list ->
  ?tags:tag_list ->
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  create_notebook_instance_lifecycle_config_input

val make_create_optimization_job_response :
  optimization_job_arn:optimization_job_arn -> unit -> create_optimization_job_response

val make_optimization_vpc_config :
  security_group_ids:optimization_vpc_security_group_ids ->
  subnets:optimization_vpc_subnets ->
  unit ->
  optimization_vpc_config

val make_optimization_sage_maker_model :
  ?model_name:model_name -> unit -> optimization_sage_maker_model

val make_optimization_job_output_config :
  ?kms_key_id:kms_key_id ->
  ?sage_maker_model:optimization_sage_maker_model ->
  s3_output_location:s3_uri ->
  unit ->
  optimization_job_output_config

val make_model_speculative_decoding_training_data_source :
  s3_uri:s3_uri ->
  s3_data_type:model_speculative_decoding_s3_data_type ->
  unit ->
  model_speculative_decoding_training_data_source

val make_model_speculative_decoding_config :
  ?training_data_source:model_speculative_decoding_training_data_source ->
  technique:model_speculative_decoding_technique ->
  unit ->
  model_speculative_decoding_config

val make_model_sharding_config :
  ?image:optimization_container_image ->
  ?override_environment:optimization_job_environment_variables ->
  unit ->
  model_sharding_config

val make_model_compilation_config :
  ?image:optimization_container_image ->
  ?override_environment:optimization_job_environment_variables ->
  unit ->
  model_compilation_config

val make_model_quantization_config :
  ?image:optimization_container_image ->
  ?override_environment:optimization_job_environment_variables ->
  unit ->
  model_quantization_config

val make_optimization_model_access_config :
  accept_eula:optimization_model_accept_eula -> unit -> optimization_model_access_config

val make_optimization_job_model_source_s3 :
  ?s3_uri:s3_uri ->
  ?model_access_config:optimization_model_access_config ->
  unit ->
  optimization_job_model_source_s3

val make_optimization_job_model_source :
  ?s3:optimization_job_model_source_s3 ->
  ?sage_maker_model:optimization_sage_maker_model ->
  unit ->
  optimization_job_model_source

val make_create_optimization_job_request :
  ?max_instance_count:optimization_job_max_instance_count ->
  ?optimization_environment:optimization_job_environment_variables ->
  ?tags:tag_list ->
  ?vpc_config:optimization_vpc_config ->
  optimization_job_name:entity_name ->
  role_arn:role_arn ->
  model_source:optimization_job_model_source ->
  deployment_instance_type:optimization_job_deployment_instance_type ->
  optimization_configs:optimization_configs ->
  output_config:optimization_job_output_config ->
  stopping_condition:stopping_condition ->
  unit ->
  create_optimization_job_request

val make_create_partner_app_response : ?arn:partner_app_arn -> unit -> create_partner_app_response

val make_role_group_assignment :
  role_name:non_empty_string256 ->
  group_patterns:group_patterns_list ->
  unit ->
  role_group_assignment

val make_partner_app_config :
  ?admin_users:partner_app_admin_user_list ->
  ?arguments:partner_app_arguments ->
  ?assigned_group_patterns:assigned_group_patterns_list ->
  ?role_group_assignments:role_group_assignments_list ->
  unit ->
  partner_app_config

val make_partner_app_maintenance_config :
  ?maintenance_window_start:weekly_schedule_time_format -> unit -> partner_app_maintenance_config

val make_create_partner_app_request :
  ?kms_key_id:kms_key_id ->
  ?maintenance_config:partner_app_maintenance_config ->
  ?application_config:partner_app_config ->
  ?enable_iam_session_based_identity:boolean_ ->
  ?enable_auto_minor_version_upgrade:boolean_ ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  name:partner_app_name ->
  type_:partner_app_type ->
  execution_role_arn:role_arn ->
  tier:non_empty_string64 ->
  auth_type:partner_app_auth_type ->
  unit ->
  create_partner_app_request

val make_create_partner_app_presigned_url_response :
  ?url:string2048 -> unit -> create_partner_app_presigned_url_response

val make_create_partner_app_presigned_url_request :
  ?expires_in_seconds:expires_in_seconds ->
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  arn:partner_app_arn ->
  unit ->
  create_partner_app_presigned_url_request

val make_create_pipeline_response : ?pipeline_arn:pipeline_arn -> unit -> create_pipeline_response

val make_parallelism_configuration :
  max_parallel_execution_steps:max_parallel_execution_steps -> unit -> parallelism_configuration

val make_pipeline_definition_s3_location :
  ?version_id:version_id ->
  bucket:bucket_name ->
  object_key:key ->
  unit ->
  pipeline_definition_s3_location

val make_create_pipeline_request :
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_definition:pipeline_definition ->
  ?pipeline_definition_s3_location:pipeline_definition_s3_location ->
  ?pipeline_description:pipeline_description ->
  ?tags:tag_list ->
  ?parallelism_configuration:parallelism_configuration ->
  pipeline_name:pipeline_name ->
  client_request_token:idempotency_token ->
  role_arn:role_arn ->
  unit ->
  create_pipeline_request

val make_create_presigned_domain_url_response :
  ?authorized_url:presigned_domain_url -> unit -> create_presigned_domain_url_response

val make_create_presigned_domain_url_request :
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  ?expires_in_seconds:expires_in_seconds ->
  ?space_name:space_name ->
  ?landing_uri:landing_uri ->
  domain_id:domain_id ->
  user_profile_name:user_profile_name ->
  unit ->
  create_presigned_domain_url_request

val make_create_presigned_mlflow_app_url_response :
  ?authorized_url:mlflow_app_url -> unit -> create_presigned_mlflow_app_url_response

val make_create_presigned_mlflow_app_url_request :
  ?expires_in_seconds:expires_in_seconds ->
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  arn:mlflow_app_arn ->
  unit ->
  create_presigned_mlflow_app_url_request

val make_create_presigned_mlflow_tracking_server_url_response :
  ?authorized_url:tracking_server_url ->
  unit ->
  create_presigned_mlflow_tracking_server_url_response

val make_create_presigned_mlflow_tracking_server_url_request :
  ?expires_in_seconds:expires_in_seconds ->
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  tracking_server_name:tracking_server_name ->
  unit ->
  create_presigned_mlflow_tracking_server_url_request

val make_create_presigned_notebook_instance_url_output :
  ?authorized_url:notebook_instance_url -> unit -> create_presigned_notebook_instance_url_output

val make_create_presigned_notebook_instance_url_input :
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  notebook_instance_name:notebook_instance_name ->
  unit ->
  create_presigned_notebook_instance_url_input

val make_create_processing_job_response :
  processing_job_arn:processing_job_arn -> unit -> create_processing_job_response

val make_experiment_config :
  ?experiment_name:experiment_entity_name ->
  ?trial_name:experiment_entity_name ->
  ?trial_component_display_name:experiment_entity_name ->
  ?run_name:experiment_entity_name ->
  unit ->
  experiment_config

val make_processing_stopping_condition :
  max_runtime_in_seconds:processing_max_runtime_in_seconds -> unit -> processing_stopping_condition

val make_processing_cluster_config :
  ?volume_kms_key_id:kms_key_id ->
  instance_count:processing_instance_count ->
  instance_type:processing_instance_type ->
  volume_size_in_g_b:processing_volume_size_in_g_b ->
  unit ->
  processing_cluster_config

val make_processing_resources :
  cluster_config:processing_cluster_config -> unit -> processing_resources

val make_processing_feature_store_output :
  feature_group_name:feature_group_name -> unit -> processing_feature_store_output

val make_processing_s3_output :
  ?local_path:processing_local_path ->
  s3_uri:s3_uri ->
  s3_upload_mode:processing_s3_upload_mode ->
  unit ->
  processing_s3_output

val make_processing_output :
  ?s3_output:processing_s3_output ->
  ?feature_store_output:processing_feature_store_output ->
  ?app_managed:app_managed ->
  output_name:string_ ->
  unit ->
  processing_output

val make_processing_output_config :
  ?kms_key_id:kms_key_id -> outputs:processing_outputs -> unit -> processing_output_config

val make_redshift_dataset_definition :
  ?kms_key_id:kms_key_id ->
  ?output_compression:redshift_result_compression_type ->
  cluster_id:redshift_cluster_id ->
  database:redshift_database ->
  db_user:redshift_user_name ->
  query_string:redshift_query_string ->
  cluster_role_arn:role_arn ->
  output_s3_uri:s3_uri ->
  output_format:redshift_result_format ->
  unit ->
  redshift_dataset_definition

val make_dataset_definition :
  ?athena_dataset_definition:athena_dataset_definition ->
  ?redshift_dataset_definition:redshift_dataset_definition ->
  ?local_path:processing_local_path ->
  ?data_distribution_type:data_distribution_type ->
  ?input_mode:input_mode ->
  unit ->
  dataset_definition

val make_processing_s3_input :
  ?local_path:processing_local_path ->
  ?s3_input_mode:processing_s3_input_mode ->
  ?s3_data_distribution_type:processing_s3_data_distribution_type ->
  ?s3_compression_type:processing_s3_compression_type ->
  s3_uri:s3_uri ->
  s3_data_type:processing_s3_data_type ->
  unit ->
  processing_s3_input

val make_processing_input :
  ?app_managed:app_managed ->
  ?s3_input:processing_s3_input ->
  ?dataset_definition:dataset_definition ->
  input_name:string_ ->
  unit ->
  processing_input

val make_create_processing_job_request :
  ?processing_inputs:processing_inputs ->
  ?processing_output_config:processing_output_config ->
  ?stopping_condition:processing_stopping_condition ->
  ?environment:processing_environment_map ->
  ?network_config:network_config ->
  ?tags:tag_list ->
  ?experiment_config:experiment_config ->
  processing_job_name:processing_job_name ->
  processing_resources:processing_resources ->
  app_specification:app_specification ->
  role_arn:role_arn ->
  unit ->
  create_processing_job_request

val make_create_project_output :
  project_arn:project_arn -> project_id:project_id -> unit -> create_project_output

val make_create_template_provider :
  ?cfn_template_provider:cfn_create_template_provider -> unit -> create_template_provider

val make_provisioning_parameter :
  ?key:provisioning_parameter_key ->
  ?value:provisioning_parameter_value ->
  unit ->
  provisioning_parameter

val make_service_catalog_provisioning_details :
  ?provisioning_artifact_id:service_catalog_entity_id ->
  ?path_id:service_catalog_entity_id ->
  ?provisioning_parameters:provisioning_parameters ->
  product_id:service_catalog_entity_id ->
  unit ->
  service_catalog_provisioning_details

val make_create_project_input :
  ?project_description:entity_description ->
  ?service_catalog_provisioning_details:service_catalog_provisioning_details ->
  ?tags:tag_list ->
  ?template_providers:create_template_provider_list ->
  project_name:project_entity_name ->
  unit ->
  create_project_input

val make_create_space_response : ?space_arn:space_arn -> unit -> create_space_response
val make_space_sharing_settings : sharing_type:sharing_type -> unit -> space_sharing_settings

val make_ownership_settings :
  owner_user_profile_name:user_profile_name -> unit -> ownership_settings

val make_s3_file_system : s3_uri:s3_schema_uri -> unit -> s3_file_system
val make_f_sx_lustre_file_system : file_system_id:file_system_id -> unit -> f_sx_lustre_file_system
val make_efs_file_system : file_system_id:file_system_id -> unit -> efs_file_system

val make_ebs_storage_settings :
  ebs_volume_size_in_gb:space_ebs_volume_size_in_gb -> unit -> ebs_storage_settings

val make_space_storage_settings :
  ?ebs_storage_settings:ebs_storage_settings -> unit -> space_storage_settings

val make_space_idle_settings :
  ?idle_timeout_in_minutes:idle_timeout_in_minutes -> unit -> space_idle_settings

val make_space_app_lifecycle_management :
  ?idle_settings:space_idle_settings -> unit -> space_app_lifecycle_management

val make_space_jupyter_lab_app_settings :
  ?default_resource_spec:resource_spec ->
  ?code_repositories:code_repositories ->
  ?app_lifecycle_management:space_app_lifecycle_management ->
  unit ->
  space_jupyter_lab_app_settings

val make_space_code_editor_app_settings :
  ?default_resource_spec:resource_spec ->
  ?app_lifecycle_management:space_app_lifecycle_management ->
  unit ->
  space_code_editor_app_settings

val make_space_settings :
  ?jupyter_server_app_settings:jupyter_server_app_settings ->
  ?kernel_gateway_app_settings:kernel_gateway_app_settings ->
  ?code_editor_app_settings:space_code_editor_app_settings ->
  ?jupyter_lab_app_settings:space_jupyter_lab_app_settings ->
  ?app_type:app_type ->
  ?space_storage_settings:space_storage_settings ->
  ?space_managed_resources:feature_status ->
  ?custom_file_systems:custom_file_systems ->
  ?remote_access:feature_status ->
  unit ->
  space_settings

val make_create_space_request :
  ?tags:tag_list ->
  ?space_settings:space_settings ->
  ?ownership_settings:ownership_settings ->
  ?space_sharing_settings:space_sharing_settings ->
  ?space_display_name:non_empty_string64 ->
  domain_id:domain_id ->
  space_name:space_name ->
  unit ->
  create_space_request

val make_create_studio_lifecycle_config_response :
  ?studio_lifecycle_config_arn:studio_lifecycle_config_arn ->
  unit ->
  create_studio_lifecycle_config_response

val make_create_studio_lifecycle_config_request :
  ?tags:tag_list ->
  studio_lifecycle_config_name:studio_lifecycle_config_name ->
  studio_lifecycle_config_content:studio_lifecycle_config_content ->
  studio_lifecycle_config_app_type:studio_lifecycle_config_app_type ->
  unit ->
  create_studio_lifecycle_config_request

val make_create_training_job_response :
  training_job_arn:training_job_arn -> unit -> create_training_job_response

val make_model_package_config :
  ?source_model_package_arn:model_package_arn ->
  model_package_group_arn:model_package_group_arn ->
  unit ->
  model_package_config

val make_mlflow_config :
  ?mlflow_experiment_name:mlflow_experiment_name ->
  ?mlflow_run_name:mlflow_run_name ->
  mlflow_resource_arn:ml_flow_resource_arn ->
  unit ->
  mlflow_config

val make_serverless_job_config :
  ?accept_eula:accept_eula ->
  ?customization_technique:customization_technique ->
  ?peft:peft ->
  ?evaluation_type:evaluation_type ->
  ?evaluator_arn:evaluator_arn ->
  base_model_arn:serverless_job_base_model_arn ->
  job_type:serverless_job_type ->
  unit ->
  serverless_job_config

val make_session_chaining_config :
  ?enable_session_tag_chaining:enable_session_tag_chaining -> unit -> session_chaining_config

val make_infra_check_config : ?enable_infra_check:enable_infra_check -> unit -> infra_check_config

val make_remote_debug_config :
  ?enable_remote_debug:enable_remote_debug -> unit -> remote_debug_config

val make_profiler_rule_configuration :
  ?local_path:directory_path ->
  ?s3_output_path:s3_uri ->
  ?instance_type:processing_instance_type ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?rule_parameters:rule_parameters ->
  rule_configuration_name:rule_configuration_name ->
  rule_evaluator_image:algorithm_image ->
  unit ->
  profiler_rule_configuration

val make_profiler_config :
  ?s3_output_path:s3_uri ->
  ?profiling_interval_in_milliseconds:profiling_interval_in_milliseconds ->
  ?profiling_parameters:profiling_parameters ->
  ?disable_profiler:disable_profiler ->
  unit ->
  profiler_config

val make_tensor_board_output_config :
  ?local_path:directory_path -> s3_output_path:s3_uri -> unit -> tensor_board_output_config

val make_debug_rule_configuration :
  ?local_path:directory_path ->
  ?s3_output_path:s3_uri ->
  ?instance_type:processing_instance_type ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?rule_parameters:rule_parameters ->
  rule_configuration_name:rule_configuration_name ->
  rule_evaluator_image:algorithm_image ->
  unit ->
  debug_rule_configuration

val make_debug_hook_config :
  ?local_path:directory_path ->
  ?hook_parameters:hook_parameters ->
  ?collection_configurations:collection_configurations ->
  s3_output_path:s3_uri ->
  unit ->
  debug_hook_config

val make_create_training_job_request :
  ?hyper_parameters:hyper_parameters ->
  ?algorithm_specification:algorithm_specification ->
  ?input_data_config:input_data_config ->
  ?resource_config:resource_config ->
  ?vpc_config:vpc_config ->
  ?stopping_condition:stopping_condition ->
  ?tags:tag_list ->
  ?enable_network_isolation:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_managed_spot_training:boolean_ ->
  ?checkpoint_config:checkpoint_config ->
  ?debug_hook_config:debug_hook_config ->
  ?debug_rule_configurations:debug_rule_configurations ->
  ?tensor_board_output_config:tensor_board_output_config ->
  ?experiment_config:experiment_config ->
  ?profiler_config:profiler_config ->
  ?profiler_rule_configurations:profiler_rule_configurations ->
  ?environment:training_environment_map ->
  ?retry_strategy:retry_strategy ->
  ?remote_debug_config:remote_debug_config ->
  ?infra_check_config:infra_check_config ->
  ?session_chaining_config:session_chaining_config ->
  ?serverless_job_config:serverless_job_config ->
  ?mlflow_config:mlflow_config ->
  ?model_package_config:model_package_config ->
  training_job_name:training_job_name ->
  role_arn:role_arn ->
  output_data_config:output_data_config ->
  unit ->
  create_training_job_request

val make_create_training_plan_response :
  training_plan_arn:training_plan_arn -> unit -> create_training_plan_response

val make_create_training_plan_request :
  ?spare_instance_count_per_ultra_server:spare_instance_count_per_ultra_server ->
  ?tags:tag_list ->
  training_plan_name:training_plan_name ->
  training_plan_offering_id:training_plan_offering_id ->
  unit ->
  create_training_plan_request

val make_create_transform_job_response :
  transform_job_arn:transform_job_arn -> unit -> create_transform_job_response

val make_data_processing :
  ?input_filter:json_path ->
  ?output_filter:json_path ->
  ?join_source:join_source ->
  unit ->
  data_processing

val make_model_client_config :
  ?invocations_timeout_in_seconds:invocations_timeout_in_seconds ->
  ?invocations_max_retries:invocations_max_retries ->
  unit ->
  model_client_config

val make_create_transform_job_request :
  ?max_concurrent_transforms:max_concurrent_transforms ->
  ?model_client_config:model_client_config ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?batch_strategy:batch_strategy ->
  ?environment:transform_environment_map ->
  ?data_capture_config:batch_data_capture_config ->
  ?data_processing:data_processing ->
  ?tags:tag_list ->
  ?experiment_config:experiment_config ->
  transform_job_name:transform_job_name ->
  model_name:model_name ->
  transform_input:transform_input ->
  transform_output:transform_output ->
  transform_resources:transform_resources ->
  unit ->
  create_transform_job_request

val make_create_trial_response : ?trial_arn:trial_arn -> unit -> create_trial_response

val make_create_trial_request :
  ?display_name:experiment_entity_name ->
  ?metadata_properties:metadata_properties ->
  ?tags:tag_list ->
  trial_name:experiment_entity_name ->
  experiment_name:experiment_entity_name ->
  unit ->
  create_trial_request

val make_create_trial_component_response :
  ?trial_component_arn:trial_component_arn -> unit -> create_trial_component_response

val make_trial_component_artifact :
  ?media_type:media_type -> value:trial_component_artifact_value -> unit -> trial_component_artifact

val make_trial_component_status :
  ?primary_status:trial_component_primary_status ->
  ?message:trial_component_status_message ->
  unit ->
  trial_component_status

val make_create_trial_component_request :
  ?display_name:experiment_entity_name ->
  ?status:trial_component_status ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?parameters:trial_component_parameters ->
  ?input_artifacts:trial_component_artifacts ->
  ?output_artifacts:trial_component_artifacts ->
  ?metadata_properties:metadata_properties ->
  ?tags:tag_list ->
  trial_component_name:experiment_entity_name ->
  unit ->
  create_trial_component_request

val make_create_user_profile_response :
  ?user_profile_arn:user_profile_arn -> unit -> create_user_profile_response

val make_create_user_profile_request :
  ?single_sign_on_user_identifier:single_sign_on_user_identifier ->
  ?single_sign_on_user_value:string256 ->
  ?tags:tag_list ->
  ?user_settings:user_settings ->
  domain_id:domain_id ->
  user_profile_name:user_profile_name ->
  unit ->
  create_user_profile_request

val make_create_workforce_response :
  workforce_arn:workforce_arn -> unit -> create_workforce_response

val make_workforce_vpc_config_request :
  ?vpc_id:workforce_vpc_id ->
  ?security_group_ids:workforce_security_group_ids ->
  ?subnets:workforce_subnets ->
  unit ->
  workforce_vpc_config_request

val make_source_ip_config : cidrs:cidrs -> unit -> source_ip_config

val make_oidc_config :
  ?scope:scope ->
  ?authentication_request_extra_params:authentication_request_extra_params ->
  client_id:client_id ->
  client_secret:client_secret ->
  issuer:oidc_endpoint ->
  authorization_endpoint:oidc_endpoint ->
  token_endpoint:oidc_endpoint ->
  user_info_endpoint:oidc_endpoint ->
  logout_endpoint:oidc_endpoint ->
  jwks_uri:oidc_endpoint ->
  unit ->
  oidc_config

val make_create_workforce_request :
  ?cognito_config:cognito_config ->
  ?oidc_config:oidc_config ->
  ?source_ip_config:source_ip_config ->
  ?tags:tag_list ->
  ?workforce_vpc_config:workforce_vpc_config_request ->
  ?ip_address_type:workforce_ip_address_type ->
  workforce_name:workforce_name ->
  unit ->
  create_workforce_request

val make_create_workteam_response : ?workteam_arn:workteam_arn -> unit -> create_workteam_response

val make_iam_policy_constraints :
  ?source_ip:enabled_or_disabled ->
  ?vpc_source_ip:enabled_or_disabled ->
  unit ->
  iam_policy_constraints

val make_s3_presign : ?iam_policy_constraints:iam_policy_constraints -> unit -> s3_presign
val make_worker_access_configuration : ?s3_presign:s3_presign -> unit -> worker_access_configuration

val make_notification_configuration :
  ?notification_topic_arn:notification_topic_arn -> unit -> notification_configuration

val make_oidc_member_definition : ?groups:groups -> unit -> oidc_member_definition

val make_member_definition :
  ?cognito_member_definition:cognito_member_definition ->
  ?oidc_member_definition:oidc_member_definition ->
  unit ->
  member_definition

val make_create_workteam_request :
  ?workforce_name:workforce_name ->
  ?notification_configuration:notification_configuration ->
  ?worker_access_configuration:worker_access_configuration ->
  ?tags:tag_list ->
  workteam_name:workteam_name ->
  member_definitions:member_definitions ->
  description:string200 ->
  unit ->
  create_workteam_request

val make_customized_metric_specification :
  ?metric_name:string_ ->
  ?namespace:string_ ->
  ?statistic:statistic ->
  unit ->
  customized_metric_specification

val make_data_capture_config_summary :
  enable_capture:enable_capture ->
  capture_status:capture_status ->
  current_sampling_percentage:sampling_percentage ->
  destination_s3_uri:destination_s3_uri ->
  kms_key_id:kms_key_id ->
  unit ->
  data_capture_config_summary

val make_debug_rule_evaluation_status :
  ?rule_configuration_name:rule_configuration_name ->
  ?rule_evaluation_job_arn:processing_job_arn ->
  ?rule_evaluation_status:rule_evaluation_status ->
  ?status_details:status_details ->
  ?last_modified_time:timestamp ->
  unit ->
  debug_rule_evaluation_status

val make_instance_group_health_check_configuration :
  ?instance_ids:instance_ids ->
  instance_group_name:cluster_instance_group_name ->
  deep_health_checks:deep_health_checks ->
  unit ->
  instance_group_health_check_configuration

val make_delete_ai_benchmark_job_response :
  ?ai_benchmark_job_arn:ai_benchmark_job_arn -> unit -> delete_ai_benchmark_job_response

val make_delete_ai_benchmark_job_request :
  ai_benchmark_job_name:ai_entity_name -> unit -> delete_ai_benchmark_job_request

val make_delete_ai_recommendation_job_response :
  ?ai_recommendation_job_arn:ai_recommendation_job_arn ->
  unit ->
  delete_ai_recommendation_job_response

val make_delete_ai_recommendation_job_request :
  ai_recommendation_job_name:ai_entity_name -> unit -> delete_ai_recommendation_job_request

val make_delete_ai_workload_config_response :
  ?ai_workload_config_arn:ai_workload_config_arn -> unit -> delete_ai_workload_config_response

val make_delete_ai_workload_config_request :
  ai_workload_config_name:ai_entity_name -> unit -> delete_ai_workload_config_request

val make_delete_action_response : ?action_arn:action_arn -> unit -> delete_action_response
val make_delete_action_request : action_name:experiment_entity_name -> unit -> delete_action_request
val make_delete_algorithm_input : algorithm_name:entity_name -> unit -> delete_algorithm_input

val make_delete_app_request :
  ?user_profile_name:user_profile_name ->
  ?space_name:space_name ->
  domain_id:domain_id ->
  app_type:app_type ->
  app_name:app_name ->
  unit ->
  delete_app_request

val make_delete_app_image_config_request :
  app_image_config_name:app_image_config_name -> unit -> delete_app_image_config_request

val make_delete_artifact_response : ?artifact_arn:artifact_arn -> unit -> delete_artifact_response

val make_delete_artifact_request :
  ?artifact_arn:artifact_arn -> ?source:artifact_source -> unit -> delete_artifact_request

val make_delete_association_response :
  ?source_arn:association_entity_arn ->
  ?destination_arn:association_entity_arn ->
  unit ->
  delete_association_response

val make_delete_association_request :
  source_arn:association_entity_arn ->
  destination_arn:association_entity_arn ->
  unit ->
  delete_association_request

val make_delete_cluster_response : cluster_arn:cluster_arn -> unit -> delete_cluster_response
val make_delete_cluster_request : cluster_name:cluster_name_or_arn -> unit -> delete_cluster_request

val make_delete_cluster_scheduler_config_request :
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  unit ->
  delete_cluster_scheduler_config_request

val make_delete_code_repository_input :
  code_repository_name:entity_name -> unit -> delete_code_repository_input

val make_delete_compilation_job_request :
  compilation_job_name:entity_name -> unit -> delete_compilation_job_request

val make_delete_compute_quota_request :
  compute_quota_id:compute_quota_id -> unit -> delete_compute_quota_request

val make_delete_context_response : ?context_arn:context_arn -> unit -> delete_context_response
val make_delete_context_request : context_name:context_name -> unit -> delete_context_request

val make_delete_data_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_data_quality_job_definition_request

val make_delete_device_fleet_request :
  device_fleet_name:entity_name -> unit -> delete_device_fleet_request

val make_retention_policy : ?home_efs_file_system:retention_type -> unit -> retention_policy

val make_delete_domain_request :
  ?retention_policy:retention_policy -> domain_id:domain_id -> unit -> delete_domain_request

val make_delete_edge_deployment_plan_request :
  edge_deployment_plan_name:entity_name -> unit -> delete_edge_deployment_plan_request

val make_delete_edge_deployment_stage_request :
  edge_deployment_plan_name:entity_name ->
  stage_name:entity_name ->
  unit ->
  delete_edge_deployment_stage_request

val make_delete_endpoint_input : endpoint_name:endpoint_name -> unit -> delete_endpoint_input

val make_delete_endpoint_config_input :
  endpoint_config_name:endpoint_config_name -> unit -> delete_endpoint_config_input

val make_delete_experiment_response :
  ?experiment_arn:experiment_arn -> unit -> delete_experiment_response

val make_delete_experiment_request :
  experiment_name:experiment_entity_name -> unit -> delete_experiment_request

val make_delete_feature_group_request :
  feature_group_name:feature_group_name -> unit -> delete_feature_group_request

val make_delete_flow_definition_response : unit -> unit

val make_delete_flow_definition_request :
  flow_definition_name:flow_definition_name -> unit -> delete_flow_definition_request

val make_delete_hub_request : hub_name:hub_name_or_arn -> unit -> delete_hub_request

val make_delete_hub_content_request :
  hub_name:hub_name_or_arn ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  hub_content_version:hub_content_version ->
  unit ->
  delete_hub_content_request

val make_delete_hub_content_reference_request :
  hub_name:hub_name_or_arn ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  unit ->
  delete_hub_content_reference_request

val make_delete_human_task_ui_response : unit -> unit

val make_delete_human_task_ui_request :
  human_task_ui_name:human_task_ui_name -> unit -> delete_human_task_ui_request

val make_delete_hyper_parameter_tuning_job_request :
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  delete_hyper_parameter_tuning_job_request

val make_delete_image_response : unit -> unit
val make_delete_image_request : image_name:image_name -> unit -> delete_image_request
val make_delete_image_version_response : unit -> unit

val make_delete_image_version_request :
  ?version:image_version_number ->
  ?alias:sage_maker_image_version_alias ->
  image_name:image_name ->
  unit ->
  delete_image_version_request

val make_delete_inference_component_input :
  inference_component_name:inference_component_name -> unit -> delete_inference_component_input

val make_delete_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> delete_inference_experiment_response

val make_delete_inference_experiment_request :
  name:inference_experiment_name -> unit -> delete_inference_experiment_request

val make_delete_job_response : unit -> unit

val make_delete_job_request :
  job_name:job_name -> job_category:job_category -> unit -> delete_job_request

val make_delete_mlflow_app_response : ?arn:mlflow_app_arn -> unit -> delete_mlflow_app_response
val make_delete_mlflow_app_request : arn:mlflow_app_arn -> unit -> delete_mlflow_app_request

val make_delete_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> delete_mlflow_tracking_server_response

val make_delete_mlflow_tracking_server_request :
  tracking_server_name:tracking_server_name -> unit -> delete_mlflow_tracking_server_request

val make_delete_model_input : model_name:model_name -> unit -> delete_model_input

val make_delete_model_bias_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_model_bias_job_definition_request

val make_delete_model_card_request :
  model_card_name:entity_name -> unit -> delete_model_card_request

val make_delete_model_explainability_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_model_explainability_job_definition_request

val make_delete_model_package_input :
  model_package_name:versioned_arn_or_name -> unit -> delete_model_package_input

val make_delete_model_package_group_input :
  model_package_group_name:arn_or_name -> unit -> delete_model_package_group_input

val make_delete_model_package_group_policy_input :
  model_package_group_name:entity_name -> unit -> delete_model_package_group_policy_input

val make_delete_model_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_model_quality_job_definition_request

val make_delete_monitoring_schedule_request :
  monitoring_schedule_name:monitoring_schedule_name -> unit -> delete_monitoring_schedule_request

val make_delete_notebook_instance_input :
  notebook_instance_name:notebook_instance_name -> unit -> delete_notebook_instance_input

val make_delete_notebook_instance_lifecycle_config_input :
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  delete_notebook_instance_lifecycle_config_input

val make_delete_optimization_job_request :
  optimization_job_name:entity_name -> unit -> delete_optimization_job_request

val make_delete_partner_app_response : ?arn:partner_app_arn -> unit -> delete_partner_app_response

val make_delete_partner_app_request :
  ?client_token:client_token -> arn:partner_app_arn -> unit -> delete_partner_app_request

val make_delete_pipeline_response : ?pipeline_arn:pipeline_arn -> unit -> delete_pipeline_response

val make_delete_pipeline_request :
  pipeline_name:pipeline_name ->
  client_request_token:idempotency_token ->
  unit ->
  delete_pipeline_request

val make_delete_processing_job_request :
  processing_job_name:processing_job_name -> unit -> delete_processing_job_request

val make_delete_project_input : project_name:project_entity_name -> unit -> delete_project_input

val make_delete_space_request :
  domain_id:domain_id -> space_name:space_name -> unit -> delete_space_request

val make_delete_studio_lifecycle_config_request :
  studio_lifecycle_config_name:studio_lifecycle_config_name ->
  unit ->
  delete_studio_lifecycle_config_request

val make_delete_tags_output : unit -> unit

val make_delete_tags_input :
  resource_arn:resource_arn -> tag_keys:tag_key_list -> unit -> delete_tags_input

val make_delete_training_job_request :
  training_job_name:training_job_name -> unit -> delete_training_job_request

val make_delete_trial_response : ?trial_arn:trial_arn -> unit -> delete_trial_response
val make_delete_trial_request : trial_name:experiment_entity_name -> unit -> delete_trial_request

val make_delete_trial_component_response :
  ?trial_component_arn:trial_component_arn -> unit -> delete_trial_component_response

val make_delete_trial_component_request :
  trial_component_name:experiment_entity_name -> unit -> delete_trial_component_request

val make_delete_user_profile_request :
  domain_id:domain_id -> user_profile_name:user_profile_name -> unit -> delete_user_profile_request

val make_delete_workforce_response : unit -> unit

val make_delete_workforce_request :
  workforce_name:workforce_name -> unit -> delete_workforce_request

val make_delete_workteam_response : success:success -> unit -> delete_workteam_response
val make_delete_workteam_request : workteam_name:workteam_name -> unit -> delete_workteam_request

val make_deployed_image :
  ?specified_image:container_image ->
  ?resolved_image:container_image ->
  ?resolution_time:timestamp ->
  unit ->
  deployed_image

val make_real_time_inference_recommendation :
  ?environment:environment_map ->
  recommendation_id:string_ ->
  instance_type:production_variant_instance_type ->
  unit ->
  real_time_inference_recommendation

val make_deployment_recommendation :
  ?real_time_inference_recommendations:real_time_inference_recommendations ->
  recommendation_status:recommendation_status ->
  unit ->
  deployment_recommendation

val make_edge_deployment_status :
  ?edge_deployment_status_message:string_ ->
  ?edge_deployment_stage_start_time:timestamp ->
  stage_status:stage_status ->
  edge_deployment_success_in_stage:integer ->
  edge_deployment_pending_in_stage:integer ->
  edge_deployment_failed_in_stage:integer ->
  unit ->
  edge_deployment_status

val make_deployment_stage_status_summary :
  stage_name:entity_name ->
  device_selection_config:device_selection_config ->
  deployment_config:edge_deployment_config ->
  deployment_status:edge_deployment_status ->
  unit ->
  deployment_stage_status_summary

val make_deregister_devices_request :
  device_fleet_name:entity_name -> device_names:device_names -> unit -> deregister_devices_request

val make_derived_information :
  ?derived_data_input_config:data_input_config -> unit -> derived_information

val make_describe_ai_benchmark_job_response :
  ?failure_reason:failure_reason ->
  ?network_config:ai_benchmark_network_config ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?tags:tag_list ->
  ai_benchmark_job_name:ai_entity_name ->
  ai_benchmark_job_arn:ai_benchmark_job_arn ->
  ai_benchmark_job_status:ai_benchmark_job_status ->
  benchmark_target:ai_benchmark_target ->
  output_config:ai_benchmark_output_result ->
  ai_workload_config_identifier:ai_resource_identifier ->
  role_arn:role_arn ->
  creation_time:timestamp ->
  unit ->
  describe_ai_benchmark_job_response

val make_describe_ai_benchmark_job_request :
  ai_benchmark_job_name:ai_entity_name -> unit -> describe_ai_benchmark_job_request

val make_describe_ai_recommendation_job_response :
  ?failure_reason:failure_reason ->
  ?inference_specification:ai_recommendation_inference_specification ->
  ?optimize_model:ai_recommendation_allow_optimization ->
  ?performance_target:ai_recommendation_performance_target ->
  ?recommendations:ai_recommendation_list ->
  ?compute_spec:ai_recommendation_compute_spec ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?tags:tag_list ->
  ai_recommendation_job_name:ai_entity_name ->
  ai_recommendation_job_arn:ai_recommendation_job_arn ->
  ai_recommendation_job_status:ai_recommendation_job_status ->
  model_source:ai_model_source ->
  output_config:ai_recommendation_output_result ->
  ai_workload_config_identifier:ai_resource_identifier ->
  role_arn:role_arn ->
  creation_time:timestamp ->
  unit ->
  describe_ai_recommendation_job_response

val make_describe_ai_recommendation_job_request :
  ai_recommendation_job_name:ai_entity_name -> unit -> describe_ai_recommendation_job_request

val make_describe_ai_workload_config_response :
  ?dataset_config:ai_dataset_config ->
  ?ai_workload_configs:ai_workload_configs ->
  ?tags:tag_list ->
  ai_workload_config_name:ai_entity_name ->
  ai_workload_config_arn:ai_workload_config_arn ->
  creation_time:timestamp ->
  unit ->
  describe_ai_workload_config_response

val make_describe_ai_workload_config_request :
  ai_workload_config_name:ai_entity_name -> unit -> describe_ai_workload_config_request

val make_describe_action_response :
  ?action_name:experiment_entity_name_or_arn ->
  ?action_arn:action_arn ->
  ?source:action_source ->
  ?action_type:string256 ->
  ?description:experiment_description ->
  ?status:action_status ->
  ?properties:lineage_entity_parameters ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?metadata_properties:metadata_properties ->
  ?lineage_group_arn:lineage_group_arn ->
  unit ->
  describe_action_response

val make_describe_action_request :
  action_name:experiment_entity_name_or_arn -> unit -> describe_action_request

val make_describe_algorithm_output :
  ?algorithm_description:entity_description ->
  ?inference_specification:inference_specification ->
  ?validation_specification:algorithm_validation_specification ->
  ?product_id:product_id ->
  ?certify_for_marketplace:certify_for_marketplace ->
  algorithm_name:entity_name ->
  algorithm_arn:algorithm_arn ->
  creation_time:creation_time ->
  training_specification:training_specification ->
  algorithm_status:algorithm_status ->
  algorithm_status_details:algorithm_status_details ->
  unit ->
  describe_algorithm_output

val make_describe_algorithm_input : algorithm_name:arn_or_name -> unit -> describe_algorithm_input

val make_describe_app_response :
  ?app_arn:app_arn ->
  ?app_type:app_type ->
  ?app_name:app_name ->
  ?domain_id:domain_id ->
  ?user_profile_name:user_profile_name ->
  ?space_name:space_name ->
  ?status:app_status ->
  ?effective_trusted_identity_propagation_status:feature_status ->
  ?recovery_mode:boolean_ ->
  ?last_health_check_timestamp:timestamp ->
  ?last_user_activity_timestamp:timestamp ->
  ?creation_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?resource_spec:resource_spec ->
  ?built_in_lifecycle_config_arn:studio_lifecycle_config_arn ->
  unit ->
  describe_app_response

val make_describe_app_request :
  ?user_profile_name:user_profile_name ->
  ?space_name:space_name ->
  domain_id:domain_id ->
  app_type:app_type ->
  app_name:app_name ->
  unit ->
  describe_app_request

val make_describe_app_image_config_response :
  ?app_image_config_arn:app_image_config_arn ->
  ?app_image_config_name:app_image_config_name ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?code_editor_app_image_config:code_editor_app_image_config ->
  unit ->
  describe_app_image_config_response

val make_describe_app_image_config_request :
  app_image_config_name:app_image_config_name -> unit -> describe_app_image_config_request

val make_describe_artifact_response :
  ?artifact_name:experiment_entity_name_or_arn ->
  ?artifact_arn:artifact_arn ->
  ?source:artifact_source ->
  ?artifact_type:string256 ->
  ?properties:lineage_entity_parameters ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?metadata_properties:metadata_properties ->
  ?lineage_group_arn:lineage_group_arn ->
  unit ->
  describe_artifact_response

val make_describe_artifact_request : artifact_arn:artifact_arn -> unit -> describe_artifact_request

val make_resolved_attributes :
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?problem_type:problem_type ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  unit ->
  resolved_attributes

val make_describe_auto_ml_job_response :
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?problem_type:problem_type ->
  ?auto_ml_job_config:auto_ml_job_config ->
  ?end_time:timestamp ->
  ?failure_reason:auto_ml_failure_reason ->
  ?partial_failure_reasons:auto_ml_partial_failure_reasons ->
  ?best_candidate:auto_ml_candidate ->
  ?generate_candidate_definitions_only:generate_candidate_definitions_only ->
  ?auto_ml_job_artifacts:auto_ml_job_artifacts ->
  ?resolved_attributes:resolved_attributes ->
  ?model_deploy_config:model_deploy_config ->
  ?model_deploy_result:model_deploy_result ->
  auto_ml_job_name:auto_ml_job_name ->
  auto_ml_job_arn:auto_ml_job_arn ->
  input_data_config:auto_ml_input_data_config ->
  output_data_config:auto_ml_output_data_config ->
  role_arn:role_arn ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  auto_ml_job_status:auto_ml_job_status ->
  auto_ml_job_secondary_status:auto_ml_job_secondary_status ->
  unit ->
  describe_auto_ml_job_response

val make_describe_auto_ml_job_request :
  auto_ml_job_name:auto_ml_job_name -> unit -> describe_auto_ml_job_request

val make_describe_auto_ml_job_v2_response :
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?auto_ml_problem_type_config:auto_ml_problem_type_config ->
  ?auto_ml_problem_type_config_name:auto_ml_problem_type_config_name ->
  ?end_time:timestamp ->
  ?failure_reason:auto_ml_failure_reason ->
  ?partial_failure_reasons:auto_ml_partial_failure_reasons ->
  ?best_candidate:auto_ml_candidate ->
  ?auto_ml_job_artifacts:auto_ml_job_artifacts ->
  ?resolved_attributes:auto_ml_resolved_attributes ->
  ?model_deploy_config:model_deploy_config ->
  ?model_deploy_result:model_deploy_result ->
  ?data_split_config:auto_ml_data_split_config ->
  ?security_config:auto_ml_security_config ->
  ?auto_ml_compute_config:auto_ml_compute_config ->
  auto_ml_job_name:auto_ml_job_name ->
  auto_ml_job_arn:auto_ml_job_arn ->
  auto_ml_job_input_data_config:auto_ml_job_input_data_config ->
  output_data_config:auto_ml_output_data_config ->
  role_arn:role_arn ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  auto_ml_job_status:auto_ml_job_status ->
  auto_ml_job_secondary_status:auto_ml_job_secondary_status ->
  unit ->
  describe_auto_ml_job_v2_response

val make_describe_auto_ml_job_v2_request :
  auto_ml_job_name:auto_ml_job_name -> unit -> describe_auto_ml_job_v2_request

val make_describe_cluster_response :
  ?cluster_name:cluster_name ->
  ?creation_time:timestamp ->
  ?failure_message:string_ ->
  ?restricted_instance_groups:cluster_restricted_instance_group_details_list ->
  ?restricted_instance_groups_config:cluster_restricted_instance_groups_config_output ->
  ?vpc_config:vpc_config ->
  ?orchestrator:cluster_orchestrator ->
  ?tiered_storage_config:cluster_tiered_storage_config ->
  ?node_recovery:cluster_node_recovery ->
  ?node_provisioning_mode:cluster_node_provisioning_mode ->
  ?cluster_role:role_arn ->
  ?auto_scaling:cluster_auto_scaling_config_output ->
  cluster_arn:cluster_arn ->
  cluster_status:cluster_status ->
  instance_groups:cluster_instance_group_details_list ->
  unit ->
  describe_cluster_response

val make_describe_cluster_request :
  cluster_name:cluster_name_or_arn -> unit -> describe_cluster_request

val make_describe_cluster_event_response :
  ?event_details:cluster_event_detail -> unit -> describe_cluster_event_response

val make_describe_cluster_event_request :
  event_id:event_id -> cluster_name:cluster_name_or_arn -> unit -> describe_cluster_event_request

val make_describe_cluster_node_response :
  node_details:cluster_node_details -> unit -> describe_cluster_node_response

val make_describe_cluster_node_request :
  ?node_id:cluster_node_id ->
  ?node_logical_id:cluster_node_logical_id ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  describe_cluster_node_request

val make_describe_cluster_scheduler_config_response :
  ?failure_reason:failure_reason ->
  ?status_details:status_details_map ->
  ?cluster_arn:cluster_arn ->
  ?scheduler_config:scheduler_config ->
  ?description:entity_description ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  name:entity_name ->
  cluster_scheduler_config_version:integer ->
  status:scheduler_resource_status ->
  creation_time:timestamp ->
  unit ->
  describe_cluster_scheduler_config_response

val make_describe_cluster_scheduler_config_request :
  ?cluster_scheduler_config_version:integer ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  unit ->
  describe_cluster_scheduler_config_request

val make_describe_code_repository_output :
  ?git_config:git_config ->
  code_repository_name:entity_name ->
  code_repository_arn:code_repository_arn ->
  creation_time:creation_time ->
  last_modified_time:last_modified_time ->
  unit ->
  describe_code_repository_output

val make_describe_code_repository_input :
  code_repository_name:entity_name -> unit -> describe_code_repository_input

val make_model_digests : ?artifact_digest:artifact_digest -> unit -> model_digests
val make_model_artifacts : s3_model_artifacts:s3_uri -> unit -> model_artifacts

val make_describe_compilation_job_response :
  ?compilation_start_time:timestamp ->
  ?compilation_end_time:timestamp ->
  ?inference_image:inference_image ->
  ?model_package_version_arn:model_package_arn ->
  ?model_digests:model_digests ->
  ?vpc_config:neo_vpc_config ->
  ?derived_information:derived_information ->
  compilation_job_name:entity_name ->
  compilation_job_arn:compilation_job_arn ->
  compilation_job_status:compilation_job_status ->
  stopping_condition:stopping_condition ->
  creation_time:creation_time ->
  last_modified_time:last_modified_time ->
  failure_reason:failure_reason ->
  model_artifacts:model_artifacts ->
  role_arn:role_arn ->
  input_config:input_config ->
  output_config:output_config ->
  unit ->
  describe_compilation_job_response

val make_describe_compilation_job_request :
  compilation_job_name:entity_name -> unit -> describe_compilation_job_request

val make_describe_compute_quota_response :
  ?description:entity_description ->
  ?failure_reason:failure_reason ->
  ?cluster_arn:cluster_arn ->
  ?compute_quota_config:compute_quota_config ->
  ?activation_state:activation_state ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  compute_quota_arn:compute_quota_arn ->
  compute_quota_id:compute_quota_id ->
  name:entity_name ->
  compute_quota_version:integer ->
  status:scheduler_resource_status ->
  compute_quota_target:compute_quota_target ->
  creation_time:timestamp ->
  unit ->
  describe_compute_quota_response

val make_describe_compute_quota_request :
  ?compute_quota_version:integer ->
  compute_quota_id:compute_quota_id ->
  unit ->
  describe_compute_quota_request

val make_describe_context_response :
  ?context_name:context_name ->
  ?context_arn:context_arn ->
  ?source:context_source ->
  ?context_type:string256 ->
  ?description:experiment_description ->
  ?properties:lineage_entity_parameters ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?lineage_group_arn:lineage_group_arn ->
  unit ->
  describe_context_response

val make_describe_context_request :
  context_name:context_name_or_arn -> unit -> describe_context_request

val make_describe_data_quality_job_definition_response :
  ?data_quality_baseline_config:data_quality_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  job_definition_arn:monitoring_job_definition_arn ->
  job_definition_name:monitoring_job_definition_name ->
  creation_time:timestamp ->
  data_quality_app_specification:data_quality_app_specification ->
  data_quality_job_input:data_quality_job_input ->
  data_quality_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  describe_data_quality_job_definition_response

val make_describe_data_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_data_quality_job_definition_request

val make_edge_model :
  ?latest_sample_time:timestamp ->
  ?latest_inference:timestamp ->
  model_name:entity_name ->
  model_version:edge_version ->
  unit ->
  edge_model

val make_describe_device_response :
  ?device_arn:device_arn ->
  ?description:device_description ->
  ?iot_thing_name:thing_name ->
  ?latest_heartbeat:timestamp ->
  ?models:edge_models ->
  ?max_models:integer ->
  ?next_token:next_token ->
  ?agent_version:edge_version ->
  device_name:entity_name ->
  device_fleet_name:entity_name ->
  registration_time:timestamp ->
  unit ->
  describe_device_response

val make_describe_device_request :
  ?next_token:next_token ->
  device_name:entity_name ->
  device_fleet_name:entity_name ->
  unit ->
  describe_device_request

val make_describe_device_fleet_response :
  ?description:device_fleet_description ->
  ?role_arn:role_arn ->
  ?iot_role_alias:iot_role_alias ->
  device_fleet_name:entity_name ->
  device_fleet_arn:device_fleet_arn ->
  output_config:edge_output_config ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  describe_device_fleet_response

val make_describe_device_fleet_request :
  device_fleet_name:entity_name -> unit -> describe_device_fleet_request

val make_describe_domain_response :
  ?domain_arn:domain_arn ->
  ?domain_id:domain_id ->
  ?domain_name:domain_name ->
  ?home_efs_file_system_id:resource_id ->
  ?single_sign_on_managed_application_instance_id:string256 ->
  ?single_sign_on_application_arn:single_sign_on_application_arn ->
  ?status:domain_status ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?failure_reason:failure_reason ->
  ?security_group_id_for_domain_boundary:security_group_id ->
  ?auth_mode:auth_mode ->
  ?default_user_settings:user_settings ->
  ?domain_settings:domain_settings ->
  ?app_network_access_type:app_network_access_type ->
  ?home_efs_file_system_kms_key_id:kms_key_id ->
  ?subnet_ids:subnets ->
  ?url:string1024 ->
  ?vpc_id:vpc_id ->
  ?kms_key_id:kms_key_id ->
  ?app_security_group_management:app_security_group_management ->
  ?home_efs_file_system_creation:home_efs_file_system_creation ->
  ?tag_propagation:tag_propagation ->
  ?default_space_settings:default_space_settings ->
  unit ->
  describe_domain_response

val make_describe_domain_request : domain_id:domain_id -> unit -> describe_domain_request

val make_describe_edge_deployment_plan_response :
  ?edge_deployment_success:integer ->
  ?edge_deployment_pending:integer ->
  ?edge_deployment_failed:integer ->
  ?next_token:next_token ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  edge_deployment_plan_arn:edge_deployment_plan_arn ->
  edge_deployment_plan_name:entity_name ->
  model_configs:edge_deployment_model_configs ->
  device_fleet_name:entity_name ->
  stages:deployment_stage_status_summaries ->
  unit ->
  describe_edge_deployment_plan_response

val make_describe_edge_deployment_plan_request :
  ?next_token:next_token ->
  ?max_results:deployment_stage_max_results ->
  edge_deployment_plan_name:entity_name ->
  unit ->
  describe_edge_deployment_plan_request

val make_edge_preset_deployment_output :
  ?artifact:edge_preset_deployment_artifact ->
  ?status:edge_preset_deployment_status ->
  ?status_message:string_ ->
  type_:edge_preset_deployment_type ->
  unit ->
  edge_preset_deployment_output

val make_describe_edge_packaging_job_response :
  ?compilation_job_name:entity_name ->
  ?model_name:entity_name ->
  ?model_version:edge_version ->
  ?role_arn:role_arn ->
  ?output_config:edge_output_config ->
  ?resource_key:kms_key_id ->
  ?edge_packaging_job_status_message:string_ ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?model_artifact:s3_uri ->
  ?model_signature:string_ ->
  ?preset_deployment_output:edge_preset_deployment_output ->
  edge_packaging_job_arn:edge_packaging_job_arn ->
  edge_packaging_job_name:entity_name ->
  edge_packaging_job_status:edge_packaging_job_status ->
  unit ->
  describe_edge_packaging_job_response

val make_describe_edge_packaging_job_request :
  edge_packaging_job_name:entity_name -> unit -> describe_edge_packaging_job_request

val make_ec2_capacity_reservation :
  ?ec2_capacity_reservation_id:ec2_capacity_reservation_id ->
  ?total_instance_count:task_count ->
  ?available_instance_count:task_count ->
  ?used_by_current_endpoint:task_count ->
  unit ->
  ec2_capacity_reservation

val make_production_variant_capacity_reservation_summary :
  ?ml_reservation_arn:ml_reservation_arn ->
  ?capacity_reservation_preference:capacity_reservation_preference ->
  ?total_instance_count:task_count ->
  ?available_instance_count:task_count ->
  ?used_by_current_endpoint:task_count ->
  ?ec2_capacity_reservations:ec2_capacity_reservations_list ->
  unit ->
  production_variant_capacity_reservation_summary

val make_production_variant_status :
  ?status_message:variant_status_message ->
  ?start_time:timestamp ->
  status:variant_status ->
  unit ->
  production_variant_status

val make_instance_pool_summary :
  instance_type:production_variant_instance_type ->
  current_instance_count:task_count ->
  unit ->
  instance_pool_summary

val make_production_variant_summary :
  ?deployed_images:deployed_images ->
  ?current_weight:variant_weight ->
  ?desired_weight:variant_weight ->
  ?current_instance_count:task_count ->
  ?desired_instance_count:task_count ->
  ?instance_pools:instance_pool_summary_list ->
  ?variant_status:production_variant_status_list ->
  ?current_serverless_config:production_variant_serverless_config ->
  ?desired_serverless_config:production_variant_serverless_config ->
  ?managed_instance_scaling:production_variant_managed_instance_scaling ->
  ?routing_config:production_variant_routing_config ->
  ?capacity_reservation_config:production_variant_capacity_reservation_summary ->
  variant_name:variant_name ->
  unit ->
  production_variant_summary

val make_pending_production_variant_summary :
  ?deployed_images:deployed_images ->
  ?current_weight:variant_weight ->
  ?desired_weight:variant_weight ->
  ?current_instance_count:task_count ->
  ?desired_instance_count:task_count ->
  ?instance_type:production_variant_instance_type ->
  ?instance_pools:instance_pool_summary_list ->
  ?accelerator_type:production_variant_accelerator_type ->
  ?variant_status:production_variant_status_list ->
  ?current_serverless_config:production_variant_serverless_config ->
  ?desired_serverless_config:production_variant_serverless_config ->
  ?managed_instance_scaling:production_variant_managed_instance_scaling ->
  ?routing_config:production_variant_routing_config ->
  variant_name:variant_name ->
  unit ->
  pending_production_variant_summary

val make_pending_deployment_summary :
  ?production_variants:pending_production_variant_summary_list ->
  ?start_time:timestamp ->
  ?shadow_production_variants:pending_production_variant_summary_list ->
  endpoint_config_name:endpoint_config_name ->
  unit ->
  pending_deployment_summary

val make_describe_endpoint_output :
  ?endpoint_config_name:endpoint_config_name ->
  ?production_variants:production_variant_summary_list ->
  ?data_capture_config:data_capture_config_summary ->
  ?failure_reason:failure_reason ->
  ?last_deployment_config:deployment_config ->
  ?async_inference_config:async_inference_config ->
  ?pending_deployment_summary:pending_deployment_summary ->
  ?explainer_config:explainer_config ->
  ?shadow_production_variants:production_variant_summary_list ->
  ?metrics_config:metrics_config ->
  endpoint_name:endpoint_name ->
  endpoint_arn:endpoint_arn ->
  endpoint_status:endpoint_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  describe_endpoint_output

val make_describe_endpoint_input : endpoint_name:endpoint_name -> unit -> describe_endpoint_input

val make_describe_endpoint_config_output :
  ?data_capture_config:data_capture_config ->
  ?kms_key_id:kms_key_id ->
  ?async_inference_config:async_inference_config ->
  ?explainer_config:explainer_config ->
  ?shadow_production_variants:production_variant_list ->
  ?execution_role_arn:role_arn ->
  ?vpc_config:vpc_config ->
  ?enable_network_isolation:boolean_ ->
  ?metrics_config:metrics_config ->
  endpoint_config_name:endpoint_config_name ->
  endpoint_config_arn:endpoint_config_arn ->
  production_variants:production_variant_list ->
  creation_time:timestamp ->
  unit ->
  describe_endpoint_config_output

val make_describe_endpoint_config_input :
  endpoint_config_name:endpoint_config_name -> unit -> describe_endpoint_config_input

val make_experiment_source :
  ?source_type:source_type -> source_arn:experiment_source_arn -> unit -> experiment_source

val make_describe_experiment_response :
  ?experiment_name:experiment_entity_name ->
  ?experiment_arn:experiment_arn ->
  ?display_name:experiment_entity_name ->
  ?source:experiment_source ->
  ?description:experiment_description ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  unit ->
  describe_experiment_response

val make_describe_experiment_request :
  experiment_name:experiment_entity_name -> unit -> describe_experiment_request

val make_last_update_status :
  ?failure_reason:failure_reason -> status:last_update_status_value -> unit -> last_update_status

val make_offline_store_status :
  ?blocked_reason:blocked_reason ->
  status:offline_store_status_value ->
  unit ->
  offline_store_status

val make_throughput_config_description :
  ?provisioned_read_capacity_units:capacity_unit ->
  ?provisioned_write_capacity_units:capacity_unit ->
  throughput_mode:throughput_mode ->
  unit ->
  throughput_config_description

val make_describe_feature_group_response :
  ?last_modified_time:last_modified_time ->
  ?online_store_config:online_store_config ->
  ?offline_store_config:offline_store_config ->
  ?throughput_config:throughput_config_description ->
  ?role_arn:role_arn ->
  ?feature_group_status:feature_group_status ->
  ?offline_store_status:offline_store_status ->
  ?last_update_status:last_update_status ->
  ?failure_reason:failure_reason ->
  ?description:description ->
  ?online_store_total_size_bytes:online_store_total_size_bytes ->
  feature_group_arn:feature_group_arn ->
  feature_group_name:feature_group_name ->
  record_identifier_feature_name:feature_name ->
  event_time_feature_name:feature_name ->
  feature_definitions:feature_definitions ->
  creation_time:creation_time ->
  next_token:next_token ->
  unit ->
  describe_feature_group_response

val make_describe_feature_group_request :
  ?next_token:next_token ->
  feature_group_name:feature_group_name_or_arn ->
  unit ->
  describe_feature_group_request

val make_feature_parameter :
  ?key:feature_parameter_key -> ?value:feature_parameter_value -> unit -> feature_parameter

val make_describe_feature_metadata_response :
  ?description:feature_description ->
  ?parameters:feature_parameters ->
  feature_group_arn:feature_group_arn ->
  feature_group_name:feature_group_name ->
  feature_name:feature_name ->
  feature_type:feature_type ->
  creation_time:creation_time ->
  last_modified_time:last_modified_time ->
  unit ->
  describe_feature_metadata_response

val make_describe_feature_metadata_request :
  feature_group_name:feature_group_name_or_arn ->
  feature_name:feature_name ->
  unit ->
  describe_feature_metadata_request

val make_describe_flow_definition_response :
  ?human_loop_request_source:human_loop_request_source ->
  ?human_loop_activation_config:human_loop_activation_config ->
  ?human_loop_config:human_loop_config ->
  ?failure_reason:failure_reason ->
  flow_definition_arn:flow_definition_arn ->
  flow_definition_name:flow_definition_name ->
  flow_definition_status:flow_definition_status ->
  creation_time:timestamp ->
  output_config:flow_definition_output_config ->
  role_arn:role_arn ->
  unit ->
  describe_flow_definition_response

val make_describe_flow_definition_request :
  flow_definition_name:flow_definition_name -> unit -> describe_flow_definition_request

val make_describe_hub_response :
  ?hub_display_name:hub_display_name ->
  ?hub_description:hub_description ->
  ?hub_search_keywords:hub_search_keyword_list ->
  ?s3_storage_config:hub_s3_storage_config ->
  ?failure_reason:failure_reason ->
  hub_name:hub_name ->
  hub_arn:hub_arn ->
  hub_status:hub_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  describe_hub_response

val make_describe_hub_request : hub_name:hub_name_or_arn -> unit -> describe_hub_request

val make_hub_content_dependency :
  ?dependency_origin_path:dependency_origin_path ->
  ?dependency_copy_path:dependency_copy_path ->
  unit ->
  hub_content_dependency

val make_describe_hub_content_response :
  ?hub_content_display_name:hub_content_display_name ->
  ?hub_content_description:hub_content_description ->
  ?hub_content_markdown:hub_content_markdown ->
  ?sage_maker_public_hub_content_arn:sage_maker_public_hub_content_arn ->
  ?reference_min_version:reference_min_version ->
  ?support_status:hub_content_support_status ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?hub_content_dependencies:hub_content_dependency_list ->
  ?failure_reason:failure_reason ->
  ?last_modified_time:timestamp ->
  hub_content_name:hub_content_name ->
  hub_content_arn:hub_content_arn ->
  hub_content_version:hub_content_version ->
  hub_content_type:hub_content_type ->
  document_schema_version:document_schema_version ->
  hub_name:hub_name ->
  hub_arn:hub_arn ->
  hub_content_document:hub_content_document ->
  hub_content_status:hub_content_status ->
  creation_time:timestamp ->
  unit ->
  describe_hub_content_response

val make_describe_hub_content_request :
  ?hub_content_version:hub_content_version ->
  hub_name:hub_name_or_arn ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  unit ->
  describe_hub_content_request

val make_ui_template_info :
  ?url:template_url -> ?content_sha256:template_content_sha256 -> unit -> ui_template_info

val make_describe_human_task_ui_response :
  ?human_task_ui_status:human_task_ui_status ->
  human_task_ui_arn:human_task_ui_arn ->
  human_task_ui_name:human_task_ui_name ->
  creation_time:timestamp ->
  ui_template:ui_template_info ->
  unit ->
  describe_human_task_ui_response

val make_describe_human_task_ui_request :
  human_task_ui_name:human_task_ui_name -> unit -> describe_human_task_ui_request

val make_hyper_parameter_tuning_job_consumed_resources :
  ?runtime_in_seconds:integer -> unit -> hyper_parameter_tuning_job_consumed_resources

val make_hyper_parameter_tuning_job_completion_details :
  ?number_of_training_jobs_objective_not_improving:integer ->
  ?convergence_detected_time:timestamp ->
  unit ->
  hyper_parameter_tuning_job_completion_details

val make_final_hyper_parameter_tuning_job_objective_metric :
  ?type_:hyper_parameter_tuning_job_objective_type ->
  metric_name:metric_name ->
  value:metric_value ->
  unit ->
  final_hyper_parameter_tuning_job_objective_metric

val make_hyper_parameter_training_job_summary :
  ?training_job_definition_name:hyper_parameter_training_job_definition_name ->
  ?tuning_job_name:hyper_parameter_tuning_job_name ->
  ?training_start_time:timestamp ->
  ?training_end_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?final_hyper_parameter_tuning_job_objective_metric:
    final_hyper_parameter_tuning_job_objective_metric ->
  ?objective_status:objective_status ->
  training_job_name:training_job_name ->
  training_job_arn:training_job_arn ->
  creation_time:timestamp ->
  training_job_status:training_job_status ->
  tuned_hyper_parameters:hyper_parameters ->
  unit ->
  hyper_parameter_training_job_summary

val make_objective_status_counters :
  ?succeeded:objective_status_counter ->
  ?pending:objective_status_counter ->
  ?failed:objective_status_counter ->
  unit ->
  objective_status_counters

val make_training_job_status_counters :
  ?completed:training_job_status_counter ->
  ?in_progress:training_job_status_counter ->
  ?retryable_error:training_job_status_counter ->
  ?non_retryable_error:training_job_status_counter ->
  ?stopped:training_job_status_counter ->
  unit ->
  training_job_status_counters

val make_describe_hyper_parameter_tuning_job_response :
  ?training_job_definition:hyper_parameter_training_job_definition ->
  ?training_job_definitions:hyper_parameter_training_job_definitions ->
  ?hyper_parameter_tuning_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?best_training_job:hyper_parameter_training_job_summary ->
  ?overall_best_training_job:hyper_parameter_training_job_summary ->
  ?warm_start_config:hyper_parameter_tuning_job_warm_start_config ->
  ?autotune:autotune ->
  ?failure_reason:failure_reason ->
  ?tuning_job_completion_details:hyper_parameter_tuning_job_completion_details ->
  ?consumed_resources:hyper_parameter_tuning_job_consumed_resources ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  hyper_parameter_tuning_job_config:hyper_parameter_tuning_job_config ->
  hyper_parameter_tuning_job_status:hyper_parameter_tuning_job_status ->
  creation_time:timestamp ->
  training_job_status_counters:training_job_status_counters ->
  objective_status_counters:objective_status_counters ->
  unit ->
  describe_hyper_parameter_tuning_job_response

val make_describe_hyper_parameter_tuning_job_request :
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  describe_hyper_parameter_tuning_job_request

val make_describe_image_response :
  ?creation_time:timestamp ->
  ?description:image_description ->
  ?display_name:image_display_name ->
  ?failure_reason:failure_reason ->
  ?image_arn:image_arn ->
  ?image_name:image_name ->
  ?image_status:image_status ->
  ?last_modified_time:timestamp ->
  ?role_arn:role_arn ->
  unit ->
  describe_image_response

val make_describe_image_request : image_name:image_name -> unit -> describe_image_request

val make_describe_image_version_response :
  ?base_image:image_base_image ->
  ?container_image:image_container_image ->
  ?creation_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?image_arn:image_arn ->
  ?image_version_arn:image_version_arn ->
  ?image_version_status:image_version_status ->
  ?last_modified_time:timestamp ->
  ?version:image_version_number ->
  ?vendor_guidance:vendor_guidance ->
  ?job_type:job_type ->
  ?ml_framework:ml_framework ->
  ?programming_lang:programming_lang ->
  ?processor:processor ->
  ?horovod:horovod ->
  ?release_notes:release_notes ->
  unit ->
  describe_image_version_response

val make_describe_image_version_request :
  ?version:image_version_number ->
  ?alias:sage_maker_image_version_alias ->
  image_name:image_name ->
  unit ->
  describe_image_version_request

val make_inference_component_capacity_size :
  type_:inference_component_capacity_size_type ->
  value:capacity_size_value ->
  unit ->
  inference_component_capacity_size

val make_inference_component_rolling_update_policy :
  ?maximum_execution_timeout_in_seconds:maximum_execution_timeout_in_seconds ->
  ?rollback_maximum_batch_size:inference_component_capacity_size ->
  maximum_batch_size:inference_component_capacity_size ->
  wait_interval_in_seconds:wait_interval_in_seconds ->
  unit ->
  inference_component_rolling_update_policy

val make_inference_component_deployment_config :
  ?auto_rollback_configuration:auto_rollback_config ->
  rolling_update_policy:inference_component_rolling_update_policy ->
  unit ->
  inference_component_deployment_config

val make_inference_component_placement_status :
  instance_type:production_variant_instance_type ->
  current_copy_count:inference_component_copy_count ->
  unit ->
  inference_component_placement_status

val make_inference_component_runtime_config_summary :
  ?desired_copy_count:inference_component_copy_count ->
  ?current_copy_count:inference_component_copy_count ->
  ?placement_status:inference_component_placement_status_list ->
  unit ->
  inference_component_runtime_config_summary

val make_inference_component_data_cache_config_summary :
  enable_caching:enable_caching -> unit -> inference_component_data_cache_config_summary

val make_inference_component_container_specification_summary :
  ?deployed_image:deployed_image ->
  ?artifact_url:url ->
  ?environment:environment_map ->
  ?container_metrics_config:container_metrics_config ->
  unit ->
  inference_component_container_specification_summary

val make_inference_component_specification_summary :
  ?instance_type:production_variant_instance_type ->
  ?model_name:model_name ->
  ?container:inference_component_container_specification_summary ->
  ?startup_parameters:inference_component_startup_parameters ->
  ?compute_resource_requirements:inference_component_compute_resource_requirements ->
  ?base_inference_component_name:inference_component_name ->
  ?data_cache_config:inference_component_data_cache_config_summary ->
  ?scheduling_config:inference_component_scheduling_config ->
  unit ->
  inference_component_specification_summary

val make_describe_inference_component_output :
  ?variant_name:variant_name ->
  ?failure_reason:failure_reason ->
  ?specification:inference_component_specification_summary ->
  ?specifications:inference_component_specification_summary_list ->
  ?runtime_config:inference_component_runtime_config_summary ->
  ?inference_component_status:inference_component_status ->
  ?last_deployment_config:inference_component_deployment_config ->
  inference_component_name:inference_component_name ->
  inference_component_arn:inference_component_arn ->
  endpoint_name:endpoint_name ->
  endpoint_arn:endpoint_arn ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  describe_inference_component_output

val make_describe_inference_component_input :
  inference_component_name:inference_component_name -> unit -> describe_inference_component_input

val make_model_variant_config_summary :
  model_name:model_name ->
  variant_name:model_variant_name ->
  infrastructure_config:model_infrastructure_config ->
  status:model_variant_status ->
  unit ->
  model_variant_config_summary

val make_endpoint_metadata :
  ?endpoint_config_name:endpoint_config_name ->
  ?endpoint_status:endpoint_status ->
  ?failure_reason:failure_reason ->
  endpoint_name:endpoint_name ->
  unit ->
  endpoint_metadata

val make_describe_inference_experiment_response :
  ?schedule:inference_experiment_schedule ->
  ?status_reason:inference_experiment_status_reason ->
  ?description:inference_experiment_description ->
  ?creation_time:timestamp ->
  ?completion_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?role_arn:role_arn ->
  ?data_storage_config:inference_experiment_data_storage_config ->
  ?shadow_mode_config:shadow_mode_config ->
  ?kms_key:kms_key_id ->
  arn:inference_experiment_arn ->
  name:inference_experiment_name ->
  type_:inference_experiment_type ->
  status:inference_experiment_status ->
  endpoint_metadata:endpoint_metadata ->
  model_variants:model_variant_config_summary_list ->
  unit ->
  describe_inference_experiment_response

val make_describe_inference_experiment_request :
  name:inference_experiment_name -> unit -> describe_inference_experiment_request

val make_inference_metrics :
  max_invocations:integer -> model_latency:integer -> unit -> inference_metrics

val make_endpoint_performance :
  metrics:inference_metrics -> endpoint_info:endpoint_info -> unit -> endpoint_performance

val make_environment_parameter :
  key:string_ -> value_type:string_ -> value:string_ -> unit -> environment_parameter

val make_model_configuration :
  ?inference_specification_name:inference_specification_name ->
  ?environment_parameters:environment_parameters ->
  ?compilation_job_name:recommendation_job_compilation_job_name ->
  unit ->
  model_configuration

val make_endpoint_output_configuration :
  ?instance_type:production_variant_instance_type ->
  ?initial_instance_count:initial_instance_count ->
  ?serverless_config:production_variant_serverless_config ->
  endpoint_name:string_ ->
  variant_name:string_ ->
  unit ->
  endpoint_output_configuration

val make_recommendation_metrics :
  ?cost_per_hour:float_ ->
  ?cost_per_inference:float_ ->
  ?max_invocations:integer ->
  ?model_latency:integer ->
  ?cpu_utilization:utilization_metric ->
  ?memory_utilization:utilization_metric ->
  ?model_setup_time:model_setup_time ->
  unit ->
  recommendation_metrics

val make_inference_recommendation :
  ?recommendation_id:string_ ->
  ?metrics:recommendation_metrics ->
  ?invocation_end_time:invocation_end_time ->
  ?invocation_start_time:invocation_start_time ->
  endpoint_configuration:endpoint_output_configuration ->
  model_configuration:model_configuration ->
  unit ->
  inference_recommendation

val make_describe_inference_recommendations_job_response :
  ?job_description:recommendation_job_description ->
  ?completion_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?stopping_conditions:recommendation_job_stopping_conditions ->
  ?inference_recommendations:inference_recommendations ->
  ?endpoint_performances:endpoint_performances ->
  job_name:recommendation_job_name ->
  job_type:recommendation_job_type ->
  job_arn:recommendation_job_arn ->
  role_arn:role_arn ->
  status:recommendation_job_status ->
  creation_time:creation_time ->
  last_modified_time:last_modified_time ->
  input_config:recommendation_job_input_config ->
  unit ->
  describe_inference_recommendations_job_response

val make_describe_inference_recommendations_job_request :
  job_name:recommendation_job_name -> unit -> describe_inference_recommendations_job_request

val make_job_secondary_status_transition :
  ?end_time:timestamp ->
  ?status_message:string_ ->
  status:job_secondary_status ->
  start_time:timestamp ->
  unit ->
  job_secondary_status_transition

val make_describe_job_response :
  ?job_config_document:job_config_document ->
  ?end_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?tags:tag_list ->
  job_name:job_name ->
  job_arn:job_arn ->
  role_arn:role_arn ->
  job_category:job_category ->
  job_config_schema_version:job_schema_version ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  job_status:job_status ->
  secondary_status:job_secondary_status ->
  secondary_status_transitions:job_secondary_status_transitions ->
  unit ->
  describe_job_response

val make_describe_job_request :
  job_name:job_name -> job_category:job_category -> unit -> describe_job_request

val make_describe_job_schema_version_response :
  job_category:job_category ->
  job_config_schema_version:job_schema_version ->
  job_config_schema:job_config_document ->
  unit ->
  describe_job_schema_version_response

val make_describe_job_schema_version_request :
  ?job_config_schema_version:job_schema_version ->
  job_category:job_category ->
  unit ->
  describe_job_schema_version_request

val make_labeling_job_output :
  ?final_active_learning_model_arn:model_arn ->
  output_dataset_s3_uri:s3_uri ->
  unit ->
  labeling_job_output

val make_label_counters :
  ?total_labeled:label_counter ->
  ?human_labeled:label_counter ->
  ?machine_labeled:label_counter ->
  ?failed_non_retryable_error:label_counter ->
  ?unlabeled:label_counter ->
  unit ->
  label_counters

val make_describe_labeling_job_response :
  ?failure_reason:failure_reason ->
  ?label_attribute_name:label_attribute_name ->
  ?label_category_config_s3_uri:s3_uri ->
  ?stopping_conditions:labeling_job_stopping_conditions ->
  ?labeling_job_algorithms_config:labeling_job_algorithms_config ->
  ?tags:tag_list ->
  ?labeling_job_output:labeling_job_output ->
  labeling_job_status:labeling_job_status ->
  label_counters:label_counters ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  job_reference_code:job_reference_code ->
  labeling_job_name:labeling_job_name ->
  labeling_job_arn:labeling_job_arn ->
  input_config:labeling_job_input_config ->
  output_config:labeling_job_output_config ->
  role_arn:role_arn ->
  human_task_config:human_task_config ->
  unit ->
  describe_labeling_job_response

val make_describe_labeling_job_request :
  labeling_job_name:labeling_job_name -> unit -> describe_labeling_job_request

val make_describe_lineage_group_response :
  ?lineage_group_name:experiment_entity_name ->
  ?lineage_group_arn:lineage_group_arn ->
  ?display_name:experiment_entity_name ->
  ?description:experiment_description ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  unit ->
  describe_lineage_group_response

val make_describe_lineage_group_request :
  lineage_group_name:experiment_entity_name -> unit -> describe_lineage_group_request

val make_describe_mlflow_app_response :
  ?arn:mlflow_app_arn ->
  ?name:mlflow_app_name ->
  ?artifact_store_uri:s3_uri ->
  ?mlflow_version:mlflow_version ->
  ?role_arn:role_arn ->
  ?status:mlflow_app_status ->
  ?model_registration_mode:model_registration_mode ->
  ?account_default_status:account_default_status ->
  ?default_domain_id_list:default_domain_id_list ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?maintenance_status:maintenance_status ->
  unit ->
  describe_mlflow_app_response

val make_describe_mlflow_app_request : arn:mlflow_app_arn -> unit -> describe_mlflow_app_request

val make_describe_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn ->
  ?tracking_server_name:tracking_server_name ->
  ?artifact_store_uri:s3_uri ->
  ?tracking_server_size:tracking_server_size ->
  ?mlflow_version:mlflow_version ->
  ?role_arn:role_arn ->
  ?tracking_server_status:tracking_server_status ->
  ?tracking_server_maintenance_status:tracking_server_maintenance_status ->
  ?is_active:is_tracking_server_active ->
  ?tracking_server_url:tracking_server_url ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?automatic_model_registration:boolean_ ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?s3_bucket_owner_account_id:account_id ->
  ?s3_bucket_owner_verification:boolean_ ->
  unit ->
  describe_mlflow_tracking_server_response

val make_describe_mlflow_tracking_server_request :
  tracking_server_name:tracking_server_name -> unit -> describe_mlflow_tracking_server_request

val make_describe_model_output :
  ?primary_container:container_definition ->
  ?containers:container_definition_list ->
  ?inference_execution_config:inference_execution_config ->
  ?execution_role_arn:role_arn ->
  ?vpc_config:vpc_config ->
  ?enable_network_isolation:boolean_ ->
  ?deployment_recommendation:deployment_recommendation ->
  model_name:model_name ->
  creation_time:timestamp ->
  model_arn:model_arn ->
  unit ->
  describe_model_output

val make_describe_model_input : model_name:model_name -> unit -> describe_model_input

val make_describe_model_bias_job_definition_response :
  ?model_bias_baseline_config:model_bias_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  job_definition_arn:monitoring_job_definition_arn ->
  job_definition_name:monitoring_job_definition_name ->
  creation_time:timestamp ->
  model_bias_app_specification:model_bias_app_specification ->
  model_bias_job_input:model_bias_job_input ->
  model_bias_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  describe_model_bias_job_definition_response

val make_describe_model_bias_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_model_bias_job_definition_request

val make_describe_model_card_response :
  ?security_config:model_card_security_config ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?model_card_processing_status:model_card_processing_status ->
  model_card_arn:model_card_arn ->
  model_card_name:entity_name ->
  model_card_version:integer ->
  content:model_card_content ->
  model_card_status:model_card_status ->
  creation_time:timestamp ->
  created_by:user_context ->
  unit ->
  describe_model_card_response

val make_describe_model_card_request :
  ?model_card_version:integer ->
  ?included_data:included_data ->
  model_card_name:model_card_name_or_arn ->
  unit ->
  describe_model_card_request

val make_model_card_export_artifacts :
  s3_export_artifacts:s3_uri -> unit -> model_card_export_artifacts

val make_describe_model_card_export_job_response :
  ?failure_reason:failure_reason ->
  ?export_artifacts:model_card_export_artifacts ->
  model_card_export_job_name:entity_name ->
  model_card_export_job_arn:model_card_export_job_arn ->
  status:model_card_export_job_status ->
  model_card_name:entity_name ->
  model_card_version:integer ->
  output_config:model_card_export_output_config ->
  created_at:timestamp ->
  last_modified_at:timestamp ->
  unit ->
  describe_model_card_export_job_response

val make_describe_model_card_export_job_request :
  model_card_export_job_arn:model_card_export_job_arn ->
  unit ->
  describe_model_card_export_job_request

val make_describe_model_explainability_job_definition_response :
  ?model_explainability_baseline_config:model_explainability_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  job_definition_arn:monitoring_job_definition_arn ->
  job_definition_name:monitoring_job_definition_name ->
  creation_time:timestamp ->
  model_explainability_app_specification:model_explainability_app_specification ->
  model_explainability_job_input:model_explainability_job_input ->
  model_explainability_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  describe_model_explainability_job_definition_response

val make_describe_model_explainability_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_model_explainability_job_definition_request

val make_model_package_status_item :
  ?failure_reason:string_ ->
  name:entity_name ->
  status:detailed_model_package_status ->
  unit ->
  model_package_status_item

val make_model_package_status_details :
  ?image_scan_statuses:model_package_status_item_list ->
  validation_statuses:model_package_status_item_list ->
  unit ->
  model_package_status_details

val make_describe_model_package_output :
  ?model_package_group_name:entity_name ->
  ?model_package_version:model_package_version ->
  ?model_package_registration_type:model_package_registration_type ->
  ?model_package_description:entity_description ->
  ?inference_specification:inference_specification ->
  ?source_algorithm_specification:source_algorithm_specification ->
  ?validation_specification:model_package_validation_specification ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?model_approval_status:model_approval_status ->
  ?created_by:user_context ->
  ?metadata_properties:metadata_properties ->
  ?model_metrics:model_metrics ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?approval_description:approval_description ->
  ?domain:string_ ->
  ?task:string_ ->
  ?sample_payload_url:string_ ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?drift_check_baselines:drift_check_baselines ->
  ?additional_inference_specifications:additional_inference_specifications ->
  ?skip_model_validation:skip_model_validation ->
  ?source_uri:model_package_source_uri ->
  ?security_config:model_package_security_config ->
  ?model_card:model_package_model_card ->
  ?model_life_cycle:model_life_cycle ->
  ?managed_storage_type:managed_storage_type ->
  model_package_name:entity_name ->
  model_package_arn:model_package_arn ->
  creation_time:creation_time ->
  model_package_status:model_package_status ->
  model_package_status_details:model_package_status_details ->
  unit ->
  describe_model_package_output

val make_describe_model_package_input :
  ?included_data:included_data ->
  model_package_name:versioned_arn_or_name ->
  unit ->
  describe_model_package_input

val make_describe_model_package_group_output :
  ?model_package_group_description:entity_description ->
  ?managed_configuration:managed_configuration ->
  model_package_group_name:entity_name ->
  model_package_group_arn:model_package_group_arn ->
  creation_time:creation_time ->
  created_by:user_context ->
  model_package_group_status:model_package_group_status ->
  unit ->
  describe_model_package_group_output

val make_describe_model_package_group_input :
  model_package_group_name:arn_or_name -> unit -> describe_model_package_group_input

val make_describe_model_quality_job_definition_response :
  ?model_quality_baseline_config:model_quality_baseline_config ->
  ?network_config:monitoring_network_config ->
  ?stopping_condition:monitoring_stopping_condition ->
  job_definition_arn:monitoring_job_definition_arn ->
  job_definition_name:monitoring_job_definition_name ->
  creation_time:timestamp ->
  model_quality_app_specification:model_quality_app_specification ->
  model_quality_job_input:model_quality_job_input ->
  model_quality_job_output_config:monitoring_output_config ->
  job_resources:monitoring_resources ->
  role_arn:role_arn ->
  unit ->
  describe_model_quality_job_definition_response

val make_describe_model_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_model_quality_job_definition_request

val make_monitoring_execution_summary :
  ?processing_job_arn:processing_job_arn ->
  ?endpoint_name:endpoint_name ->
  ?failure_reason:failure_reason ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?monitoring_type:monitoring_type ->
  monitoring_schedule_name:monitoring_schedule_name ->
  scheduled_time:timestamp ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  monitoring_execution_status:execution_status ->
  unit ->
  monitoring_execution_summary

val make_describe_monitoring_schedule_response :
  ?monitoring_type:monitoring_type ->
  ?failure_reason:failure_reason ->
  ?endpoint_name:endpoint_name ->
  ?last_monitoring_execution_summary:monitoring_execution_summary ->
  monitoring_schedule_arn:monitoring_schedule_arn ->
  monitoring_schedule_name:monitoring_schedule_name ->
  monitoring_schedule_status:schedule_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  monitoring_schedule_config:monitoring_schedule_config ->
  unit ->
  describe_monitoring_schedule_response

val make_describe_monitoring_schedule_request :
  monitoring_schedule_name:monitoring_schedule_name -> unit -> describe_monitoring_schedule_request

val make_describe_notebook_instance_output :
  ?notebook_instance_arn:notebook_instance_arn ->
  ?notebook_instance_name:notebook_instance_name ->
  ?notebook_instance_status:notebook_instance_status ->
  ?failure_reason:failure_reason ->
  ?url:notebook_instance_url ->
  ?instance_type:instance_type ->
  ?ip_address_type:ip_address_type ->
  ?subnet_id:subnet_id ->
  ?security_groups:security_group_ids ->
  ?role_arn:role_arn ->
  ?kms_key_id:kms_key_id ->
  ?network_interface_id:network_interface_id ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?direct_internet_access:direct_internet_access ->
  ?volume_size_in_g_b:notebook_instance_volume_size_in_g_b ->
  ?accelerator_types:notebook_instance_accelerator_types ->
  ?default_code_repository:code_repository_name_or_url ->
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  ?root_access:root_access ->
  ?platform_identifier:platform_identifier ->
  ?instance_metadata_service_configuration:instance_metadata_service_configuration ->
  unit ->
  describe_notebook_instance_output

val make_describe_notebook_instance_input :
  notebook_instance_name:notebook_instance_name -> unit -> describe_notebook_instance_input

val make_describe_notebook_instance_lifecycle_config_output :
  ?notebook_instance_lifecycle_config_arn:notebook_instance_lifecycle_config_arn ->
  ?notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?on_create:notebook_instance_lifecycle_config_list ->
  ?on_start:notebook_instance_lifecycle_config_list ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  unit ->
  describe_notebook_instance_lifecycle_config_output

val make_describe_notebook_instance_lifecycle_config_input :
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  describe_notebook_instance_lifecycle_config_input

val make_optimization_output :
  ?recommended_inference_image:optimization_container_image -> unit -> optimization_output

val make_describe_optimization_job_response :
  ?optimization_start_time:timestamp ->
  ?optimization_end_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?optimization_environment:optimization_job_environment_variables ->
  ?max_instance_count:optimization_job_max_instance_count ->
  ?optimization_output:optimization_output ->
  ?vpc_config:optimization_vpc_config ->
  optimization_job_arn:optimization_job_arn ->
  optimization_job_status:optimization_job_status ->
  creation_time:creation_time ->
  last_modified_time:last_modified_time ->
  optimization_job_name:entity_name ->
  model_source:optimization_job_model_source ->
  deployment_instance_type:optimization_job_deployment_instance_type ->
  optimization_configs:optimization_configs ->
  output_config:optimization_job_output_config ->
  role_arn:role_arn ->
  stopping_condition:stopping_condition ->
  unit ->
  describe_optimization_job_response

val make_describe_optimization_job_request :
  optimization_job_name:entity_name -> unit -> describe_optimization_job_request

val make_error_info : ?code:non_empty_string64 -> ?reason:non_empty_string256 -> unit -> error_info

val make_describe_partner_app_response :
  ?arn:partner_app_arn ->
  ?name:partner_app_name ->
  ?type_:partner_app_type ->
  ?status:partner_app_status ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?execution_role_arn:role_arn ->
  ?kms_key_id:kms_key_id ->
  ?base_url:string2048 ->
  ?maintenance_config:partner_app_maintenance_config ->
  ?tier:non_empty_string64 ->
  ?version:non_empty_string64 ->
  ?application_config:partner_app_config ->
  ?auth_type:partner_app_auth_type ->
  ?enable_iam_session_based_identity:boolean_ ->
  ?error:error_info ->
  ?enable_auto_minor_version_upgrade:boolean_ ->
  ?current_version_eol_date:timestamp ->
  ?available_upgrade:available_upgrade ->
  unit ->
  describe_partner_app_response

val make_describe_partner_app_request :
  ?include_available_upgrade:boolean_ -> arn:partner_app_arn -> unit -> describe_partner_app_request

val make_describe_pipeline_response :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_name:pipeline_name ->
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_definition:pipeline_definition ->
  ?pipeline_description:pipeline_description ->
  ?role_arn:role_arn ->
  ?pipeline_status:pipeline_status ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_run_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_by:user_context ->
  ?parallelism_configuration:parallelism_configuration ->
  ?pipeline_version_display_name:pipeline_version_name ->
  ?pipeline_version_description:pipeline_version_description ->
  unit ->
  describe_pipeline_response

val make_describe_pipeline_request :
  ?pipeline_version_id:pipeline_version_id ->
  pipeline_name:pipeline_name_or_arn ->
  unit ->
  describe_pipeline_request

val make_describe_pipeline_definition_for_execution_response :
  ?pipeline_definition:pipeline_definition ->
  ?creation_time:timestamp ->
  unit ->
  describe_pipeline_definition_for_execution_response

val make_describe_pipeline_definition_for_execution_request :
  pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  describe_pipeline_definition_for_execution_request

val make_m_lflow_configuration :
  ?mlflow_resource_arn:m_lflow_arn ->
  ?mlflow_experiment_name:mlflow_experiment_entity_name ->
  unit ->
  m_lflow_configuration

val make_selected_step : step_name:string256 -> unit -> selected_step

val make_selective_execution_config :
  ?source_pipeline_execution_arn:pipeline_execution_arn ->
  selected_steps:selected_step_list ->
  unit ->
  selective_execution_config

val make_pipeline_experiment_config :
  ?experiment_name:experiment_entity_name ->
  ?trial_name:experiment_entity_name ->
  unit ->
  pipeline_experiment_config

val make_describe_pipeline_execution_response :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_execution_arn:pipeline_execution_arn ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_execution_status:pipeline_execution_status ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_experiment_config:pipeline_experiment_config ->
  ?failure_reason:pipeline_execution_failure_reason ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_by:user_context ->
  ?parallelism_configuration:parallelism_configuration ->
  ?selective_execution_config:selective_execution_config ->
  ?pipeline_version_id:pipeline_version_id ->
  ?m_lflow_config:m_lflow_configuration ->
  unit ->
  describe_pipeline_execution_response

val make_describe_pipeline_execution_request :
  pipeline_execution_arn:pipeline_execution_arn -> unit -> describe_pipeline_execution_request

val make_describe_processing_job_response :
  ?processing_inputs:processing_inputs ->
  ?processing_output_config:processing_output_config ->
  ?stopping_condition:processing_stopping_condition ->
  ?environment:processing_environment_map ->
  ?network_config:network_config ->
  ?role_arn:role_arn ->
  ?experiment_config:experiment_config ->
  ?exit_message:exit_message ->
  ?failure_reason:failure_reason ->
  ?processing_end_time:timestamp ->
  ?processing_start_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?training_job_arn:training_job_arn ->
  processing_job_name:processing_job_name ->
  processing_resources:processing_resources ->
  app_specification:app_specification ->
  processing_job_arn:processing_job_arn ->
  processing_job_status:processing_job_status ->
  creation_time:timestamp ->
  unit ->
  describe_processing_job_response

val make_describe_processing_job_request :
  processing_job_name:processing_job_name -> unit -> describe_processing_job_request

val make_template_provider_detail :
  ?cfn_template_provider_detail:cfn_template_provider_detail -> unit -> template_provider_detail

val make_service_catalog_provisioned_product_details :
  ?provisioned_product_id:service_catalog_entity_id ->
  ?provisioned_product_status_message:provisioned_product_status_message ->
  unit ->
  service_catalog_provisioned_product_details

val make_describe_project_output :
  ?project_description:entity_description ->
  ?service_catalog_provisioning_details:service_catalog_provisioning_details ->
  ?service_catalog_provisioned_product_details:service_catalog_provisioned_product_details ->
  ?template_provider_details:template_provider_detail_list ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  project_arn:project_arn ->
  project_name:project_entity_name ->
  project_id:project_id ->
  project_status:project_status ->
  creation_time:timestamp ->
  unit ->
  describe_project_output

val make_describe_project_input : project_name:project_entity_name -> unit -> describe_project_input

val make_ultra_server_summary :
  ?ultra_server_count:ultra_server_count ->
  ?available_spare_instance_count:available_spare_instance_count ->
  ?unhealthy_instance_count:unhealthy_instance_count ->
  ultra_server_type:ultra_server_type ->
  instance_type:reserved_capacity_instance_type ->
  unit ->
  ultra_server_summary

val make_describe_reserved_capacity_response :
  ?reserved_capacity_type:reserved_capacity_type ->
  ?status:reserved_capacity_status ->
  ?availability_zone:availability_zone ->
  ?duration_hours:reserved_capacity_duration_hours ->
  ?duration_minutes:reserved_capacity_duration_minutes ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?available_instance_count:available_instance_count ->
  ?in_use_instance_count:in_use_instance_count ->
  ?ultra_server_summary:ultra_server_summary ->
  reserved_capacity_arn:reserved_capacity_arn ->
  instance_type:reserved_capacity_instance_type ->
  total_instance_count:total_instance_count ->
  unit ->
  describe_reserved_capacity_response

val make_describe_reserved_capacity_request :
  reserved_capacity_arn:reserved_capacity_arn -> unit -> describe_reserved_capacity_request

val make_describe_space_response :
  ?domain_id:domain_id ->
  ?space_arn:space_arn ->
  ?space_name:space_name ->
  ?home_efs_file_system_uid:efs_uid ->
  ?status:space_status ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?failure_reason:failure_reason ->
  ?space_settings:space_settings ->
  ?ownership_settings:ownership_settings ->
  ?space_sharing_settings:space_sharing_settings ->
  ?space_display_name:non_empty_string64 ->
  ?url:string1024 ->
  unit ->
  describe_space_response

val make_describe_space_request :
  domain_id:domain_id -> space_name:space_name -> unit -> describe_space_request

val make_describe_studio_lifecycle_config_response :
  ?studio_lifecycle_config_arn:studio_lifecycle_config_arn ->
  ?studio_lifecycle_config_name:studio_lifecycle_config_name ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?studio_lifecycle_config_content:studio_lifecycle_config_content ->
  ?studio_lifecycle_config_app_type:studio_lifecycle_config_app_type ->
  unit ->
  describe_studio_lifecycle_config_response

val make_describe_studio_lifecycle_config_request :
  studio_lifecycle_config_name:studio_lifecycle_config_name ->
  unit ->
  describe_studio_lifecycle_config_request

val make_subscribed_workteam :
  ?marketplace_title:string200 ->
  ?seller_name:string_ ->
  ?marketplace_description:string200 ->
  ?listing_id:string_ ->
  workteam_arn:workteam_arn ->
  unit ->
  subscribed_workteam

val make_describe_subscribed_workteam_response :
  subscribed_workteam:subscribed_workteam -> unit -> describe_subscribed_workteam_response

val make_describe_subscribed_workteam_request :
  workteam_arn:workteam_arn -> unit -> describe_subscribed_workteam_request

val make_training_progress_info :
  ?total_step_count_per_epoch:total_step_count_per_epoch ->
  ?current_step:training_step_index ->
  ?current_epoch:training_epoch_index ->
  ?max_epoch:training_epoch_count ->
  unit ->
  training_progress_info

val make_mlflow_details :
  ?mlflow_experiment_id:mlflow_experiment_id ->
  ?mlflow_run_id:mlflow_run_id ->
  unit ->
  mlflow_details

val make_profiler_rule_evaluation_status :
  ?rule_configuration_name:rule_configuration_name ->
  ?rule_evaluation_job_arn:processing_job_arn ->
  ?rule_evaluation_status:rule_evaluation_status ->
  ?status_details:status_details ->
  ?last_modified_time:timestamp ->
  unit ->
  profiler_rule_evaluation_status

val make_metric_data :
  ?metric_name:metric_name -> ?value:float_ -> ?timestamp:timestamp -> unit -> metric_data

val make_secondary_status_transition :
  ?end_time:timestamp ->
  ?status_message:status_message ->
  status:secondary_status ->
  start_time:timestamp ->
  unit ->
  secondary_status_transition

val make_warm_pool_status :
  ?resource_retained_billable_time_in_seconds:resource_retained_billable_time_in_seconds ->
  ?reused_by_job:training_job_name ->
  status:warm_pool_resource_status ->
  unit ->
  warm_pool_status

val make_describe_training_job_response :
  ?tuning_job_arn:hyper_parameter_tuning_job_arn ->
  ?labeling_job_arn:labeling_job_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?failure_reason:failure_reason ->
  ?hyper_parameters:hyper_parameters ->
  ?algorithm_specification:algorithm_specification ->
  ?role_arn:role_arn ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?resource_config:resource_config ->
  ?warm_pool_status:warm_pool_status ->
  ?vpc_config:vpc_config ->
  ?training_start_time:timestamp ->
  ?training_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?secondary_status_transitions:secondary_status_transitions ->
  ?final_metric_data_list:final_metric_data_list ->
  ?enable_network_isolation:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_managed_spot_training:boolean_ ->
  ?checkpoint_config:checkpoint_config ->
  ?training_time_in_seconds:training_time_in_seconds ->
  ?billable_time_in_seconds:billable_time_in_seconds ->
  ?billable_token_count:billable_token_count ->
  ?debug_hook_config:debug_hook_config ->
  ?experiment_config:experiment_config ->
  ?debug_rule_configurations:debug_rule_configurations ->
  ?tensor_board_output_config:tensor_board_output_config ->
  ?debug_rule_evaluation_statuses:debug_rule_evaluation_statuses ->
  ?profiler_config:profiler_config ->
  ?profiler_rule_configurations:profiler_rule_configurations ->
  ?profiler_rule_evaluation_statuses:profiler_rule_evaluation_statuses ->
  ?profiling_status:profiling_status ->
  ?environment:training_environment_map ->
  ?retry_strategy:retry_strategy ->
  ?remote_debug_config:remote_debug_config ->
  ?infra_check_config:infra_check_config ->
  ?serverless_job_config:serverless_job_config ->
  ?mlflow_config:mlflow_config ->
  ?model_package_config:model_package_config ->
  ?mlflow_details:mlflow_details ->
  ?progress_info:training_progress_info ->
  ?output_model_package_arn:model_package_arn ->
  training_job_name:training_job_name ->
  training_job_arn:training_job_arn ->
  model_artifacts:model_artifacts ->
  training_job_status:training_job_status ->
  secondary_status:secondary_status ->
  stopping_condition:stopping_condition ->
  creation_time:timestamp ->
  unit ->
  describe_training_job_response

val make_describe_training_job_request :
  training_job_name:training_job_name -> unit -> describe_training_job_request

val make_reserved_capacity_summary :
  ?reserved_capacity_type:reserved_capacity_type ->
  ?ultra_server_type:ultra_server_type ->
  ?ultra_server_count:ultra_server_count ->
  ?availability_zone:availability_zone ->
  ?availability_zone_id:availability_zone_id ->
  ?duration_hours:reserved_capacity_duration_hours ->
  ?duration_minutes:reserved_capacity_duration_minutes ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  reserved_capacity_arn:reserved_capacity_arn ->
  instance_type:reserved_capacity_instance_type ->
  total_instance_count:total_instance_count ->
  status:reserved_capacity_status ->
  unit ->
  reserved_capacity_summary

val make_describe_training_plan_response :
  ?status_message:training_plan_status_message ->
  ?duration_hours:training_plan_duration_hours ->
  ?duration_minutes:training_plan_duration_minutes ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?upfront_fee:string256 ->
  ?currency_code:currency_code ->
  ?total_instance_count:total_instance_count ->
  ?available_instance_count:available_instance_count ->
  ?in_use_instance_count:in_use_instance_count ->
  ?unhealthy_instance_count:unhealthy_instance_count ->
  ?available_spare_instance_count:available_spare_instance_count ->
  ?total_ultra_server_count:ultra_server_count ->
  ?target_resources:sage_maker_resource_names ->
  ?reserved_capacity_summaries:reserved_capacity_summaries ->
  training_plan_arn:training_plan_arn ->
  training_plan_name:training_plan_name ->
  status:training_plan_status ->
  unit ->
  describe_training_plan_response

val make_describe_training_plan_request :
  training_plan_name:training_plan_name -> unit -> describe_training_plan_request

val make_training_plan_extension :
  ?extended_at:timestamp ->
  ?start_date:timestamp ->
  ?end_date:timestamp ->
  ?status:string256 ->
  ?payment_status:string256 ->
  ?availability_zone:string256 ->
  ?availability_zone_id:availability_zone_id ->
  ?duration_hours:training_plan_extension_duration_hours ->
  ?upfront_fee:string256 ->
  ?currency_code:currency_code ->
  training_plan_extension_offering_id:training_plan_extension_offering_id ->
  unit ->
  training_plan_extension

val make_describe_training_plan_extension_history_response :
  ?next_token:next_token ->
  training_plan_extensions:training_plan_extensions ->
  unit ->
  describe_training_plan_extension_history_response

val make_describe_training_plan_extension_history_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  training_plan_arn:training_plan_arn ->
  unit ->
  describe_training_plan_extension_history_request

val make_describe_transform_job_response :
  ?failure_reason:failure_reason ->
  ?max_concurrent_transforms:max_concurrent_transforms ->
  ?model_client_config:model_client_config ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?batch_strategy:batch_strategy ->
  ?environment:transform_environment_map ->
  ?transform_output:transform_output ->
  ?data_capture_config:batch_data_capture_config ->
  ?transform_start_time:timestamp ->
  ?transform_end_time:timestamp ->
  ?labeling_job_arn:labeling_job_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?data_processing:data_processing ->
  ?experiment_config:experiment_config ->
  transform_job_name:transform_job_name ->
  transform_job_arn:transform_job_arn ->
  transform_job_status:transform_job_status ->
  model_name:model_name ->
  transform_input:transform_input ->
  transform_resources:transform_resources ->
  creation_time:timestamp ->
  unit ->
  describe_transform_job_response

val make_describe_transform_job_request :
  transform_job_name:transform_job_name -> unit -> describe_transform_job_request

val make_trial_source :
  ?source_type:source_type -> source_arn:trial_source_arn -> unit -> trial_source

val make_describe_trial_response :
  ?trial_name:experiment_entity_name ->
  ?trial_arn:trial_arn ->
  ?display_name:experiment_entity_name ->
  ?experiment_name:experiment_entity_name ->
  ?source:trial_source ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?metadata_properties:metadata_properties ->
  unit ->
  describe_trial_response

val make_describe_trial_request :
  trial_name:experiment_entity_name -> unit -> describe_trial_request

val make_trial_component_source :
  ?source_type:source_type ->
  source_arn:trial_component_source_arn ->
  unit ->
  trial_component_source

val make_trial_component_metric_summary :
  ?metric_name:metric_name ->
  ?source_arn:trial_component_source_arn ->
  ?time_stamp:timestamp ->
  ?max:optional_double ->
  ?min:optional_double ->
  ?last:optional_double ->
  ?count:optional_integer ->
  ?avg:optional_double ->
  ?std_dev:optional_double ->
  unit ->
  trial_component_metric_summary

val make_describe_trial_component_response :
  ?trial_component_name:experiment_entity_name ->
  ?trial_component_arn:trial_component_arn ->
  ?display_name:experiment_entity_name ->
  ?source:trial_component_source ->
  ?status:trial_component_status ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?parameters:trial_component_parameters ->
  ?input_artifacts:trial_component_artifacts ->
  ?output_artifacts:trial_component_artifacts ->
  ?metadata_properties:metadata_properties ->
  ?metrics:trial_component_metric_summaries ->
  ?lineage_group_arn:lineage_group_arn ->
  ?sources:trial_component_sources ->
  unit ->
  describe_trial_component_response

val make_describe_trial_component_request :
  trial_component_name:experiment_entity_name_or_arn -> unit -> describe_trial_component_request

val make_describe_user_profile_response :
  ?domain_id:domain_id ->
  ?user_profile_arn:user_profile_arn ->
  ?user_profile_name:user_profile_name ->
  ?home_efs_file_system_uid:efs_uid ->
  ?status:user_profile_status ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?failure_reason:failure_reason ->
  ?single_sign_on_user_identifier:single_sign_on_user_identifier ->
  ?single_sign_on_user_value:string256 ->
  ?user_settings:user_settings ->
  unit ->
  describe_user_profile_response

val make_describe_user_profile_request :
  domain_id:domain_id ->
  user_profile_name:user_profile_name ->
  unit ->
  describe_user_profile_request

val make_workforce_vpc_config_response :
  ?vpc_endpoint_id:workforce_vpc_endpoint_id ->
  vpc_id:workforce_vpc_id ->
  security_group_ids:workforce_security_group_ids ->
  subnets:workforce_subnets ->
  unit ->
  workforce_vpc_config_response

val make_oidc_config_for_response :
  ?client_id:client_id ->
  ?issuer:oidc_endpoint ->
  ?authorization_endpoint:oidc_endpoint ->
  ?token_endpoint:oidc_endpoint ->
  ?user_info_endpoint:oidc_endpoint ->
  ?logout_endpoint:oidc_endpoint ->
  ?jwks_uri:oidc_endpoint ->
  ?scope:scope ->
  ?authentication_request_extra_params:authentication_request_extra_params ->
  unit ->
  oidc_config_for_response

val make_workforce :
  ?last_updated_date:timestamp ->
  ?source_ip_config:source_ip_config ->
  ?sub_domain:string_ ->
  ?cognito_config:cognito_config ->
  ?oidc_config:oidc_config_for_response ->
  ?create_date:timestamp ->
  ?workforce_vpc_config:workforce_vpc_config_response ->
  ?status:workforce_status ->
  ?failure_reason:workforce_failure_reason ->
  ?ip_address_type:workforce_ip_address_type ->
  workforce_name:workforce_name ->
  workforce_arn:workforce_arn ->
  unit ->
  workforce

val make_describe_workforce_response : workforce:workforce -> unit -> describe_workforce_response

val make_describe_workforce_request :
  workforce_name:workforce_name -> unit -> describe_workforce_request

val make_workteam :
  ?workforce_arn:workforce_arn ->
  ?product_listing_ids:product_listings ->
  ?sub_domain:string_ ->
  ?create_date:timestamp ->
  ?last_updated_date:timestamp ->
  ?notification_configuration:notification_configuration ->
  ?worker_access_configuration:worker_access_configuration ->
  workteam_name:workteam_name ->
  member_definitions:member_definitions ->
  workteam_arn:workteam_arn ->
  description:string200 ->
  unit ->
  workteam

val make_describe_workteam_response : workteam:workteam -> unit -> describe_workteam_response

val make_describe_workteam_request :
  workteam_name:workteam_name -> unit -> describe_workteam_request

val make_production_variant_serverless_update_config :
  ?max_concurrency:serverless_max_concurrency ->
  ?provisioned_concurrency:serverless_provisioned_concurrency ->
  unit ->
  production_variant_serverless_update_config

val make_desired_weight_and_capacity :
  ?desired_weight:variant_weight ->
  ?desired_instance_count:task_count ->
  ?serverless_update_config:production_variant_serverless_update_config ->
  variant_name:variant_name ->
  unit ->
  desired_weight_and_capacity

val make_detach_cluster_node_volume_response :
  cluster_arn:cluster_arn ->
  node_id:cluster_node_id ->
  volume_id:volume_id ->
  attach_time:timestamp ->
  status:volume_attachment_status ->
  device_name:volume_device_name ->
  unit ->
  detach_cluster_node_volume_response

val make_detach_cluster_node_volume_request :
  cluster_arn:cluster_arn ->
  node_id:cluster_node_id ->
  volume_id:volume_id ->
  unit ->
  detach_cluster_node_volume_request

val make_device :
  ?description:device_description ->
  ?iot_thing_name:thing_name ->
  device_name:device_name ->
  unit ->
  device

val make_device_deployment_summary :
  ?deployed_stage_name:entity_name ->
  ?device_fleet_name:entity_name ->
  ?device_deployment_status:device_deployment_status ->
  ?device_deployment_status_message:string_ ->
  ?description:device_description ->
  ?deployment_start_time:timestamp ->
  edge_deployment_plan_arn:edge_deployment_plan_arn ->
  edge_deployment_plan_name:entity_name ->
  stage_name:entity_name ->
  device_name:device_name ->
  device_arn:device_arn ->
  unit ->
  device_deployment_summary

val make_device_fleet_summary :
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  device_fleet_arn:device_fleet_arn ->
  device_fleet_name:entity_name ->
  unit ->
  device_fleet_summary

val make_device_stats :
  connected_device_count:long -> registered_device_count:long -> unit -> device_stats

val make_edge_model_summary :
  model_name:entity_name -> model_version:edge_version -> unit -> edge_model_summary

val make_device_summary :
  ?description:device_description ->
  ?device_fleet_name:entity_name ->
  ?iot_thing_name:thing_name ->
  ?registration_time:timestamp ->
  ?latest_heartbeat:timestamp ->
  ?models:edge_model_summaries ->
  ?agent_version:edge_version ->
  device_name:entity_name ->
  device_arn:device_arn ->
  unit ->
  device_summary

val make_disable_sagemaker_servicecatalog_portfolio_output : unit -> unit
val make_disable_sagemaker_servicecatalog_portfolio_input : unit -> unit

val make_disassociate_trial_component_response :
  ?trial_component_arn:trial_component_arn ->
  ?trial_arn:trial_arn ->
  unit ->
  disassociate_trial_component_response

val make_disassociate_trial_component_request :
  trial_component_name:experiment_entity_name ->
  trial_name:experiment_entity_name ->
  unit ->
  disassociate_trial_component_request

val make_domain_details :
  ?domain_arn:domain_arn ->
  ?domain_id:domain_id ->
  ?domain_name:domain_name ->
  ?status:domain_status ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?url:string1024 ->
  unit ->
  domain_details

val make_r_studio_server_pro_domain_settings_for_update :
  ?default_resource_spec:resource_spec ->
  ?r_studio_connect_url:string_ ->
  ?r_studio_package_manager_url:string_ ->
  domain_execution_role_arn:role_arn ->
  unit ->
  r_studio_server_pro_domain_settings_for_update

val make_domain_settings_for_update :
  ?r_studio_server_pro_domain_settings_for_update:r_studio_server_pro_domain_settings_for_update ->
  ?execution_role_identity_config:execution_role_identity_config ->
  ?security_group_ids:domain_security_group_ids ->
  ?trusted_identity_propagation_settings:trusted_identity_propagation_settings ->
  ?docker_settings:docker_settings ->
  ?amazon_q_settings:amazon_q_settings ->
  ?unified_studio_settings:unified_studio_settings ->
  ?ip_address_type:ip_address_type ->
  unit ->
  domain_settings_for_update

val make_predefined_metric_specification :
  ?predefined_metric_type:string_ -> unit -> predefined_metric_specification

val make_target_tracking_scaling_policy_configuration :
  ?metric_specification:metric_specification ->
  ?target_value:double ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_dynamic_scaling_configuration :
  ?min_capacity:integer ->
  ?max_capacity:integer ->
  ?scale_in_cooldown:integer ->
  ?scale_out_cooldown:integer ->
  ?scaling_policies:scaling_policies ->
  unit ->
  dynamic_scaling_configuration

val make_emr_step_metadata :
  ?cluster_id:string256 ->
  ?step_id:string256 ->
  ?step_name:string256 ->
  ?log_file_path:string1024 ->
  unit ->
  emr_step_metadata

val make_edge :
  ?source_arn:association_entity_arn ->
  ?destination_arn:association_entity_arn ->
  ?association_type:association_edge_type ->
  unit ->
  edge

val make_edge_deployment_plan_summary :
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  edge_deployment_plan_arn:edge_deployment_plan_arn ->
  edge_deployment_plan_name:entity_name ->
  device_fleet_name:entity_name ->
  edge_deployment_success:integer ->
  edge_deployment_pending:integer ->
  edge_deployment_failed:integer ->
  unit ->
  edge_deployment_plan_summary

val make_edge_model_stat :
  model_name:entity_name ->
  model_version:edge_version ->
  offline_device_count:long ->
  connected_device_count:long ->
  active_device_count:long ->
  sampling_device_count:long ->
  unit ->
  edge_model_stat

val make_edge_packaging_job_summary :
  ?compilation_job_name:entity_name ->
  ?model_name:entity_name ->
  ?model_version:edge_version ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  edge_packaging_job_arn:edge_packaging_job_arn ->
  edge_packaging_job_name:entity_name ->
  edge_packaging_job_status:edge_packaging_job_status ->
  unit ->
  edge_packaging_job_summary

val make_enable_sagemaker_servicecatalog_portfolio_output : unit -> unit
val make_enable_sagemaker_servicecatalog_portfolio_input : unit -> unit

val make_monitoring_schedule :
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  ?monitoring_schedule_name:monitoring_schedule_name ->
  ?monitoring_schedule_status:schedule_status ->
  ?monitoring_type:monitoring_type ->
  ?failure_reason:failure_reason ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?monitoring_schedule_config:monitoring_schedule_config ->
  ?endpoint_name:endpoint_name ->
  ?last_monitoring_execution_summary:monitoring_execution_summary ->
  ?tags:tag_list ->
  unit ->
  monitoring_schedule

val make_endpoint :
  ?production_variants:production_variant_summary_list ->
  ?data_capture_config:data_capture_config_summary ->
  ?failure_reason:failure_reason ->
  ?monitoring_schedules:monitoring_schedule_list ->
  ?tags:tag_list ->
  ?shadow_production_variants:production_variant_summary_list ->
  endpoint_name:endpoint_name ->
  endpoint_arn:endpoint_arn ->
  endpoint_config_name:endpoint_config_name ->
  endpoint_status:endpoint_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  endpoint

val make_endpoint_config_step_metadata :
  ?arn:endpoint_config_arn -> unit -> endpoint_config_step_metadata

val make_endpoint_config_summary :
  endpoint_config_name:endpoint_config_name ->
  endpoint_config_arn:endpoint_config_arn ->
  creation_time:timestamp ->
  unit ->
  endpoint_config_summary

val make_endpoint_step_metadata : ?arn:endpoint_arn -> unit -> endpoint_step_metadata

val make_endpoint_summary :
  endpoint_name:endpoint_name ->
  endpoint_arn:endpoint_arn ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  endpoint_status:endpoint_status ->
  unit ->
  endpoint_summary

val make_experiment :
  ?experiment_name:experiment_entity_name ->
  ?experiment_arn:experiment_arn ->
  ?display_name:experiment_entity_name ->
  ?source:experiment_source ->
  ?description:experiment_description ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?tags:tag_list ->
  unit ->
  experiment

val make_experiment_summary :
  ?experiment_arn:experiment_arn ->
  ?experiment_name:experiment_entity_name ->
  ?display_name:experiment_entity_name ->
  ?experiment_source:experiment_source ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  experiment_summary

val make_extend_training_plan_response :
  training_plan_extensions:training_plan_extensions -> unit -> extend_training_plan_response

val make_extend_training_plan_request :
  training_plan_extension_offering_id:training_plan_extension_offering_id ->
  unit ->
  extend_training_plan_request

val make_fail_step_metadata : ?error_message:string3072 -> unit -> fail_step_metadata

val make_feature_group :
  ?feature_group_arn:feature_group_arn ->
  ?feature_group_name:feature_group_name ->
  ?record_identifier_feature_name:feature_name ->
  ?event_time_feature_name:feature_name ->
  ?feature_definitions:feature_definitions ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?online_store_config:online_store_config ->
  ?offline_store_config:offline_store_config ->
  ?role_arn:role_arn ->
  ?feature_group_status:feature_group_status ->
  ?offline_store_status:offline_store_status ->
  ?last_update_status:last_update_status ->
  ?failure_reason:failure_reason ->
  ?description:description ->
  ?tags:tag_list ->
  unit ->
  feature_group

val make_feature_group_summary :
  ?feature_group_status:feature_group_status ->
  ?offline_store_status:offline_store_status ->
  feature_group_name:feature_group_name ->
  feature_group_arn:feature_group_arn ->
  creation_time:timestamp ->
  unit ->
  feature_group_summary

val make_feature_metadata :
  ?feature_group_arn:feature_group_arn ->
  ?feature_group_name:feature_group_name ->
  ?feature_name:feature_name ->
  ?feature_type:feature_type ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?description:feature_description ->
  ?parameters:feature_parameters ->
  unit ->
  feature_metadata

val make_filter :
  ?operator:operator -> ?value:filter_value -> name:resource_property_name -> unit -> filter

val make_flow_definition_summary :
  ?failure_reason:failure_reason ->
  flow_definition_name:flow_definition_name ->
  flow_definition_arn:flow_definition_arn ->
  flow_definition_status:flow_definition_status ->
  creation_time:timestamp ->
  unit ->
  flow_definition_summary

val make_get_device_fleet_report_response :
  ?output_config:edge_output_config ->
  ?description:device_fleet_description ->
  ?report_generated:timestamp ->
  ?device_stats:device_stats ->
  ?agent_versions:agent_versions ->
  ?model_stats:edge_model_stats ->
  device_fleet_arn:device_fleet_arn ->
  device_fleet_name:entity_name ->
  unit ->
  get_device_fleet_report_response

val make_get_device_fleet_report_request :
  device_fleet_name:entity_name -> unit -> get_device_fleet_report_request

val make_get_lineage_group_policy_response :
  ?lineage_group_arn:lineage_group_arn ->
  ?resource_policy:resource_policy_string ->
  unit ->
  get_lineage_group_policy_response

val make_get_lineage_group_policy_request :
  lineage_group_name:lineage_group_name_or_arn -> unit -> get_lineage_group_policy_request

val make_get_model_package_group_policy_output :
  resource_policy:policy_string -> unit -> get_model_package_group_policy_output

val make_get_model_package_group_policy_input :
  model_package_group_name:entity_name -> unit -> get_model_package_group_policy_input

val make_get_sagemaker_servicecatalog_portfolio_status_output :
  ?status:sagemaker_servicecatalog_status ->
  unit ->
  get_sagemaker_servicecatalog_portfolio_status_output

val make_get_sagemaker_servicecatalog_portfolio_status_input : unit -> unit

val make_scaling_policy_metric :
  ?invocations_per_instance:integer -> ?model_latency:integer -> unit -> scaling_policy_metric

val make_scaling_policy_objective :
  ?min_invocations_per_minute:integer ->
  ?max_invocations_per_minute:integer ->
  unit ->
  scaling_policy_objective

val make_get_scaling_configuration_recommendation_response :
  ?inference_recommendations_job_name:recommendation_job_name ->
  ?recommendation_id:string_ ->
  ?endpoint_name:endpoint_name ->
  ?target_cpu_utilization_per_core:utilization_percentage_per_core ->
  ?scaling_policy_objective:scaling_policy_objective ->
  ?metric:scaling_policy_metric ->
  ?dynamic_scaling_configuration:dynamic_scaling_configuration ->
  unit ->
  get_scaling_configuration_recommendation_response

val make_get_scaling_configuration_recommendation_request :
  ?recommendation_id:string_ ->
  ?endpoint_name:endpoint_name ->
  ?target_cpu_utilization_per_core:utilization_percentage_per_core ->
  ?scaling_policy_objective:scaling_policy_objective ->
  inference_recommendations_job_name:recommendation_job_name ->
  unit ->
  get_scaling_configuration_recommendation_request

val make_property_name_suggestion :
  ?property_name:resource_property_name -> unit -> property_name_suggestion

val make_get_search_suggestions_response :
  ?property_name_suggestions:property_name_suggestion_list ->
  unit ->
  get_search_suggestions_response

val make_property_name_query : property_name_hint:property_name_hint -> unit -> property_name_query
val make_suggestion_query : ?property_name_query:property_name_query -> unit -> suggestion_query

val make_get_search_suggestions_request :
  ?suggestion_query:suggestion_query ->
  resource:resource_type ->
  unit ->
  get_search_suggestions_request

val make_git_config_for_update : ?secret_arn:secret_arn -> unit -> git_config_for_update

val make_hub_content_info :
  ?sage_maker_public_hub_content_arn:sage_maker_public_hub_content_arn ->
  ?hub_content_display_name:hub_content_display_name ->
  ?hub_content_description:hub_content_description ->
  ?support_status:hub_content_support_status ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?original_creation_time:timestamp ->
  hub_content_name:hub_content_name ->
  hub_content_arn:hub_content_arn ->
  hub_content_version:hub_content_version ->
  hub_content_type:hub_content_type ->
  document_schema_version:document_schema_version ->
  hub_content_status:hub_content_status ->
  creation_time:timestamp ->
  unit ->
  hub_content_info

val make_hub_info :
  ?hub_display_name:hub_display_name ->
  ?hub_description:hub_description ->
  ?hub_search_keywords:hub_search_keyword_list ->
  hub_name:hub_name ->
  hub_arn:hub_arn ->
  hub_status:hub_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  hub_info

val make_human_task_ui_summary :
  human_task_ui_name:human_task_ui_name ->
  human_task_ui_arn:human_task_ui_arn ->
  creation_time:timestamp ->
  unit ->
  human_task_ui_summary

val make_hyper_parameter_tuning_job_search_entity :
  ?hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  ?hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  ?hyper_parameter_tuning_job_config:hyper_parameter_tuning_job_config ->
  ?training_job_definition:hyper_parameter_training_job_definition ->
  ?training_job_definitions:hyper_parameter_training_job_definitions ->
  ?hyper_parameter_tuning_job_status:hyper_parameter_tuning_job_status ->
  ?creation_time:timestamp ->
  ?hyper_parameter_tuning_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?training_job_status_counters:training_job_status_counters ->
  ?objective_status_counters:objective_status_counters ->
  ?best_training_job:hyper_parameter_training_job_summary ->
  ?overall_best_training_job:hyper_parameter_training_job_summary ->
  ?warm_start_config:hyper_parameter_tuning_job_warm_start_config ->
  ?failure_reason:failure_reason ->
  ?tuning_job_completion_details:hyper_parameter_tuning_job_completion_details ->
  ?consumed_resources:hyper_parameter_tuning_job_consumed_resources ->
  ?tags:tag_list ->
  unit ->
  hyper_parameter_tuning_job_search_entity

val make_hyper_parameter_tuning_job_summary :
  ?hyper_parameter_tuning_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?resource_limits:resource_limits ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  hyper_parameter_tuning_job_status:hyper_parameter_tuning_job_status ->
  strategy:hyper_parameter_tuning_job_strategy_type ->
  creation_time:timestamp ->
  training_job_status_counters:training_job_status_counters ->
  objective_status_counters:objective_status_counters ->
  unit ->
  hyper_parameter_tuning_job_summary

val make_image :
  ?description:image_description ->
  ?display_name:image_display_name ->
  ?failure_reason:failure_reason ->
  creation_time:timestamp ->
  image_arn:image_arn ->
  image_name:image_name ->
  image_status:image_status ->
  last_modified_time:timestamp ->
  unit ->
  image

val make_image_version :
  ?failure_reason:failure_reason ->
  creation_time:timestamp ->
  image_arn:image_arn ->
  image_version_arn:image_version_arn ->
  image_version_status:image_version_status ->
  last_modified_time:timestamp ->
  version:image_version_number ->
  unit ->
  image_version

val make_import_hub_content_response :
  hub_arn:hub_arn -> hub_content_arn:hub_content_arn -> unit -> import_hub_content_response

val make_import_hub_content_request :
  ?hub_content_version:hub_content_version ->
  ?hub_content_display_name:hub_content_display_name ->
  ?hub_content_description:hub_content_description ->
  ?hub_content_markdown:hub_content_markdown ->
  ?support_status:hub_content_support_status ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?tags:tag_list ->
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  document_schema_version:document_schema_version ->
  hub_name:hub_name_or_arn ->
  hub_content_document:hub_content_document ->
  unit ->
  import_hub_content_request

val make_inference_component_metadata : ?arn:string2048 -> unit -> inference_component_metadata

val make_inference_component_summary :
  ?inference_component_status:inference_component_status ->
  creation_time:timestamp ->
  inference_component_arn:inference_component_arn ->
  inference_component_name:inference_component_name ->
  endpoint_arn:endpoint_arn ->
  endpoint_name:endpoint_name ->
  variant_name:variant_name ->
  last_modified_time:timestamp ->
  unit ->
  inference_component_summary

val make_inference_experiment_summary :
  ?schedule:inference_experiment_schedule ->
  ?status_reason:inference_experiment_status_reason ->
  ?description:inference_experiment_description ->
  ?completion_time:timestamp ->
  ?role_arn:role_arn ->
  name:inference_experiment_name ->
  type_:inference_experiment_type ->
  status:inference_experiment_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  inference_experiment_summary

val make_inference_recommendations_job :
  ?completion_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?model_name:model_name ->
  ?sample_payload_url:s3_uri ->
  ?model_package_version_arn:model_package_arn ->
  job_name:recommendation_job_name ->
  job_description:recommendation_job_description ->
  job_type:recommendation_job_type ->
  job_arn:recommendation_job_arn ->
  status:recommendation_job_status ->
  creation_time:creation_time ->
  role_arn:role_arn ->
  last_modified_time:last_modified_time ->
  unit ->
  inference_recommendations_job

val make_recommendation_job_inference_benchmark :
  ?metrics:recommendation_metrics ->
  ?endpoint_metrics:inference_metrics ->
  ?endpoint_configuration:endpoint_output_configuration ->
  ?failure_reason:recommendation_failure_reason ->
  ?invocation_end_time:invocation_end_time ->
  ?invocation_start_time:invocation_start_time ->
  model_configuration:model_configuration ->
  unit ->
  recommendation_job_inference_benchmark

val make_inference_recommendations_job_step :
  ?inference_benchmark:recommendation_job_inference_benchmark ->
  step_type:recommendation_step_type ->
  job_name:recommendation_job_name ->
  status:recommendation_job_status ->
  unit ->
  inference_recommendations_job_step

val make_job :
  ?job_name:job_name ->
  ?job_arn:job_arn ->
  ?role_arn:role_arn ->
  ?job_category:job_category ->
  ?job_config_schema_version:job_schema_version ->
  ?job_config_document:job_config_document ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?end_time:timestamp ->
  ?job_status:job_status ->
  ?secondary_status:job_secondary_status ->
  ?secondary_status_transitions:job_secondary_status_transitions ->
  ?failure_reason:failure_reason ->
  ?tags:tag_list ->
  unit ->
  job

val make_job_config_schema_version_summary :
  job_config_schema_version:job_schema_version -> unit -> job_config_schema_version_summary

val make_job_step_metadata : ?arn:string1024 -> unit -> job_step_metadata

val make_job_summary :
  ?end_time:timestamp ->
  job_arn:job_arn ->
  job_name:job_name ->
  job_category:job_category ->
  job_status:job_status ->
  job_secondary_status:job_secondary_status ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  unit ->
  job_summary

val make_label_counters_for_workteam :
  ?human_labeled:label_counter ->
  ?pending_human:label_counter ->
  ?total:label_counter ->
  unit ->
  label_counters_for_workteam

val make_labeling_job_for_workteam_summary :
  ?labeling_job_name:labeling_job_name ->
  ?label_counters:label_counters_for_workteam ->
  ?number_of_human_workers_per_data_object:number_of_human_workers_per_data_object ->
  job_reference_code:job_reference_code ->
  work_requester_account_id:account_id ->
  creation_time:timestamp ->
  unit ->
  labeling_job_for_workteam_summary

val make_labeling_job_summary :
  ?pre_human_task_lambda_arn:lambda_function_arn ->
  ?annotation_consolidation_lambda_arn:lambda_function_arn ->
  ?failure_reason:failure_reason ->
  ?labeling_job_output:labeling_job_output ->
  ?input_config:labeling_job_input_config ->
  labeling_job_name:labeling_job_name ->
  labeling_job_arn:labeling_job_arn ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  labeling_job_status:labeling_job_status ->
  label_counters:label_counters ->
  workteam_arn:workteam_arn ->
  unit ->
  labeling_job_summary

val make_lambda_step_metadata :
  ?arn:string256 -> ?output_parameters:output_parameter_list -> unit -> lambda_step_metadata

val make_lineage_group_summary :
  ?lineage_group_arn:lineage_group_arn ->
  ?lineage_group_name:experiment_entity_name ->
  ?display_name:experiment_entity_name ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  lineage_group_summary

val make_lineage_metadata :
  ?action_arns:map_string2048 ->
  ?artifact_arns:map_string2048 ->
  ?context_arns:map_string2048 ->
  ?associations:association_info_list ->
  unit ->
  lineage_metadata

val make_list_ai_benchmark_jobs_response :
  ?next_token:next_token ->
  ai_benchmark_jobs:ai_benchmark_job_summary_list ->
  unit ->
  list_ai_benchmark_jobs_response

val make_list_ai_benchmark_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:name_contains ->
  ?status_equals:ai_benchmark_job_status ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?sort_by:list_ai_benchmark_jobs_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_ai_benchmark_jobs_request

val make_list_ai_recommendation_jobs_response :
  ?next_token:next_token ->
  ai_recommendation_jobs:ai_recommendation_job_summary_list ->
  unit ->
  list_ai_recommendation_jobs_response

val make_list_ai_recommendation_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:name_contains ->
  ?status_equals:ai_recommendation_job_status ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?sort_by:list_ai_recommendation_jobs_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_ai_recommendation_jobs_request

val make_list_ai_workload_configs_response :
  ?next_token:next_token ->
  ai_workload_configs:ai_workload_config_summary_list ->
  unit ->
  list_ai_workload_configs_response

val make_list_ai_workload_configs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:name_contains ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?sort_by:list_ai_workload_configs_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_ai_workload_configs_request

val make_list_actions_response :
  ?action_summaries:action_summaries -> ?next_token:next_token -> unit -> list_actions_response

val make_list_actions_request :
  ?source_uri:source_uri ->
  ?action_type:string256 ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_actions_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_actions_request

val make_list_algorithms_output :
  ?next_token:next_token ->
  algorithm_summary_list:algorithm_summary_list ->
  unit ->
  list_algorithms_output

val make_list_algorithms_input :
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?next_token:next_token ->
  ?sort_by:algorithm_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_algorithms_input

val make_list_aliases_response :
  ?sage_maker_image_version_aliases:sage_maker_image_version_aliases ->
  ?next_token:next_token ->
  unit ->
  list_aliases_response

val make_list_aliases_request :
  ?alias:sage_maker_image_version_alias ->
  ?version:image_version_number ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  image_name:image_name ->
  unit ->
  list_aliases_request

val make_list_app_image_configs_response :
  ?next_token:next_token ->
  ?app_image_configs:app_image_config_list ->
  unit ->
  list_app_image_configs_response

val make_list_app_image_configs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:app_image_config_name ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?modified_time_before:timestamp ->
  ?modified_time_after:timestamp ->
  ?sort_by:app_image_config_sort_key ->
  ?sort_order:sort_order ->
  unit ->
  list_app_image_configs_request

val make_list_apps_response : ?apps:app_list -> ?next_token:next_token -> unit -> list_apps_response

val make_list_apps_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:app_sort_key ->
  ?domain_id_equals:domain_id ->
  ?user_profile_name_equals:user_profile_name ->
  ?space_name_equals:space_name ->
  unit ->
  list_apps_request

val make_list_artifacts_response :
  ?artifact_summaries:artifact_summaries ->
  ?next_token:next_token ->
  unit ->
  list_artifacts_response

val make_list_artifacts_request :
  ?source_uri:source_uri ->
  ?artifact_type:string256 ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_artifacts_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_artifacts_request

val make_list_associations_response :
  ?association_summaries:association_summaries ->
  ?next_token:next_token ->
  unit ->
  list_associations_response

val make_list_associations_request :
  ?source_arn:association_entity_arn ->
  ?destination_arn:association_entity_arn ->
  ?source_type:string256 ->
  ?destination_type:string256 ->
  ?association_type:association_edge_type ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_associations_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_associations_request

val make_list_auto_ml_jobs_response :
  ?next_token:next_token ->
  auto_ml_job_summaries:auto_ml_job_summaries ->
  unit ->
  list_auto_ml_jobs_response

val make_list_auto_ml_jobs_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:auto_ml_name_contains ->
  ?status_equals:auto_ml_job_status ->
  ?sort_order:auto_ml_sort_order ->
  ?sort_by:auto_ml_sort_by ->
  ?max_results:auto_ml_max_results ->
  ?next_token:next_token ->
  unit ->
  list_auto_ml_jobs_request

val make_list_candidates_for_auto_ml_job_response :
  ?next_token:next_token ->
  candidates:auto_ml_candidates ->
  unit ->
  list_candidates_for_auto_ml_job_response

val make_list_candidates_for_auto_ml_job_request :
  ?status_equals:candidate_status ->
  ?candidate_name_equals:candidate_name ->
  ?sort_order:auto_ml_sort_order ->
  ?sort_by:candidate_sort_by ->
  ?max_results:auto_ml_max_results_for_trials ->
  ?next_token:next_token ->
  auto_ml_job_name:auto_ml_job_name ->
  unit ->
  list_candidates_for_auto_ml_job_request

val make_list_cluster_events_response :
  ?next_token:next_token -> ?events:cluster_event_summaries -> unit -> list_cluster_events_response

val make_list_cluster_events_request :
  ?instance_group_name:cluster_instance_group_name ->
  ?node_id:cluster_node_id ->
  ?event_time_after:timestamp ->
  ?event_time_before:timestamp ->
  ?sort_by:event_sort_by ->
  ?sort_order:sort_order ->
  ?resource_type:cluster_event_resource_type ->
  ?max_results:cluster_event_max_results ->
  ?next_token:next_token ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  list_cluster_events_request

val make_list_cluster_nodes_response :
  ?next_token:next_token ->
  cluster_node_summaries:cluster_node_summaries ->
  unit ->
  list_cluster_nodes_response

val make_list_cluster_nodes_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?instance_group_name_contains:cluster_instance_group_name ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_by:cluster_sort_by ->
  ?sort_order:sort_order ->
  ?include_node_logical_ids:include_node_logical_ids_boolean ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  list_cluster_nodes_request

val make_list_cluster_scheduler_configs_response :
  ?cluster_scheduler_config_summaries:cluster_scheduler_config_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_cluster_scheduler_configs_response

val make_list_cluster_scheduler_configs_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?name_contains:entity_name ->
  ?cluster_arn:cluster_arn ->
  ?status:scheduler_resource_status ->
  ?sort_by:sort_cluster_scheduler_config_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_cluster_scheduler_configs_request

val make_list_clusters_response :
  ?next_token:next_token -> cluster_summaries:cluster_summaries -> unit -> list_clusters_response

val make_list_clusters_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?next_token:next_token ->
  ?sort_by:cluster_sort_by ->
  ?sort_order:sort_order ->
  ?training_plan_arn:training_plan_arn ->
  unit ->
  list_clusters_request

val make_list_code_repositories_output :
  ?next_token:next_token ->
  code_repository_summary_list:code_repository_summary_list ->
  unit ->
  list_code_repositories_output

val make_list_code_repositories_input :
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?max_results:max_results ->
  ?name_contains:code_repository_name_contains ->
  ?next_token:next_token ->
  ?sort_by:code_repository_sort_by ->
  ?sort_order:code_repository_sort_order ->
  unit ->
  list_code_repositories_input

val make_list_compilation_jobs_response :
  ?next_token:next_token ->
  compilation_job_summaries:compilation_job_summaries ->
  unit ->
  list_compilation_jobs_response

val make_list_compilation_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?last_modified_time_after:last_modified_time ->
  ?last_modified_time_before:last_modified_time ->
  ?name_contains:name_contains ->
  ?status_equals:compilation_job_status ->
  ?sort_by:list_compilation_jobs_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_compilation_jobs_request

val make_list_compute_quotas_response :
  ?compute_quota_summaries:compute_quota_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_compute_quotas_response

val make_list_compute_quotas_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?name_contains:entity_name ->
  ?status:scheduler_resource_status ->
  ?cluster_arn:cluster_arn ->
  ?sort_by:sort_quota_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_compute_quotas_request

val make_list_contexts_response :
  ?context_summaries:context_summaries -> ?next_token:next_token -> unit -> list_contexts_response

val make_list_contexts_request :
  ?source_uri:source_uri ->
  ?context_type:string256 ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_contexts_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_contexts_request

val make_monitoring_job_definition_summary :
  monitoring_job_definition_name:monitoring_job_definition_name ->
  monitoring_job_definition_arn:monitoring_job_definition_arn ->
  creation_time:timestamp ->
  endpoint_name:endpoint_name ->
  unit ->
  monitoring_job_definition_summary

val make_list_data_quality_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_data_quality_job_definitions_response

val make_list_data_quality_job_definitions_request :
  ?endpoint_name:endpoint_name ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_data_quality_job_definitions_request

val make_list_device_fleets_response :
  ?next_token:next_token ->
  device_fleet_summaries:device_fleet_summaries ->
  unit ->
  list_device_fleets_response

val make_list_device_fleets_request :
  ?next_token:next_token ->
  ?max_results:list_max_results ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?sort_by:list_device_fleets_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_device_fleets_request

val make_list_devices_response :
  ?next_token:next_token -> device_summaries:device_summaries -> unit -> list_devices_response

val make_list_devices_request :
  ?next_token:next_token ->
  ?max_results:list_max_results ->
  ?latest_heartbeat_after:timestamp ->
  ?model_name:entity_name ->
  ?device_fleet_name:entity_name ->
  unit ->
  list_devices_request

val make_list_domains_response :
  ?domains:domain_list -> ?next_token:next_token -> unit -> list_domains_response

val make_list_domains_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_domains_request

val make_list_edge_deployment_plans_response :
  ?next_token:next_token ->
  edge_deployment_plan_summaries:edge_deployment_plan_summaries ->
  unit ->
  list_edge_deployment_plans_response

val make_list_edge_deployment_plans_request :
  ?next_token:next_token ->
  ?max_results:list_max_results ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?device_fleet_name_contains:name_contains ->
  ?sort_by:list_edge_deployment_plans_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_edge_deployment_plans_request

val make_list_edge_packaging_jobs_response :
  ?next_token:next_token ->
  edge_packaging_job_summaries:edge_packaging_job_summaries ->
  unit ->
  list_edge_packaging_jobs_response

val make_list_edge_packaging_jobs_request :
  ?next_token:next_token ->
  ?max_results:list_max_results ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?model_name_contains:name_contains ->
  ?status_equals:edge_packaging_job_status ->
  ?sort_by:list_edge_packaging_jobs_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_edge_packaging_jobs_request

val make_list_endpoint_configs_output :
  ?next_token:pagination_token ->
  endpoint_configs:endpoint_config_summary_list ->
  unit ->
  list_endpoint_configs_output

val make_list_endpoint_configs_input :
  ?sort_by:endpoint_config_sort_key ->
  ?sort_order:order_key ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?name_contains:endpoint_config_name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_endpoint_configs_input

val make_list_endpoints_output :
  ?next_token:pagination_token -> endpoints:endpoint_summary_list -> unit -> list_endpoints_output

val make_list_endpoints_input :
  ?sort_by:endpoint_sort_key ->
  ?sort_order:order_key ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?name_contains:endpoint_name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?status_equals:endpoint_status ->
  unit ->
  list_endpoints_input

val make_list_experiments_response :
  ?experiment_summaries:experiment_summaries ->
  ?next_token:next_token ->
  unit ->
  list_experiments_response

val make_list_experiments_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_experiments_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_experiments_request

val make_list_feature_groups_response :
  ?next_token:next_token ->
  feature_group_summaries:feature_group_summaries ->
  unit ->
  list_feature_groups_response

val make_list_feature_groups_request :
  ?name_contains:feature_group_name_contains ->
  ?feature_group_status_equals:feature_group_status ->
  ?offline_store_status_equals:offline_store_status_value ->
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?sort_order:feature_group_sort_order ->
  ?sort_by:feature_group_sort_by ->
  ?max_results:feature_group_max_results ->
  ?next_token:next_token ->
  unit ->
  list_feature_groups_request

val make_list_flow_definitions_response :
  ?next_token:next_token ->
  flow_definition_summaries:flow_definition_summaries ->
  unit ->
  list_flow_definitions_response

val make_list_flow_definitions_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_flow_definitions_request

val make_list_hub_content_versions_response :
  ?next_token:next_token ->
  hub_content_summaries:hub_content_info_list ->
  unit ->
  list_hub_content_versions_response

val make_list_hub_content_versions_request :
  ?min_version:hub_content_version ->
  ?max_schema_version:document_schema_version ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?sort_by:hub_content_sort_by ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  hub_name:hub_name_or_arn ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  unit ->
  list_hub_content_versions_request

val make_list_hub_contents_response :
  ?next_token:next_token ->
  hub_content_summaries:hub_content_info_list ->
  unit ->
  list_hub_contents_response

val make_list_hub_contents_request :
  ?name_contains:name_contains ->
  ?max_schema_version:document_schema_version ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?sort_by:hub_content_sort_by ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  hub_name:hub_name_or_arn ->
  hub_content_type:hub_content_type ->
  unit ->
  list_hub_contents_request

val make_list_hubs_response :
  ?next_token:next_token -> hub_summaries:hub_info_list -> unit -> list_hubs_response

val make_list_hubs_request :
  ?name_contains:name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?sort_by:hub_sort_by ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_hubs_request

val make_list_human_task_uis_response :
  ?next_token:next_token ->
  human_task_ui_summaries:human_task_ui_summaries ->
  unit ->
  list_human_task_uis_response

val make_list_human_task_uis_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_human_task_uis_request

val make_list_hyper_parameter_tuning_jobs_response :
  ?next_token:next_token ->
  hyper_parameter_tuning_job_summaries:hyper_parameter_tuning_job_summaries ->
  unit ->
  list_hyper_parameter_tuning_jobs_response

val make_list_hyper_parameter_tuning_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_by:hyper_parameter_tuning_job_sort_by_options ->
  ?sort_order:sort_order ->
  ?name_contains:name_contains ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?status_equals:hyper_parameter_tuning_job_status ->
  unit ->
  list_hyper_parameter_tuning_jobs_request

val make_list_image_versions_response :
  ?image_versions:image_versions -> ?next_token:next_token -> unit -> list_image_versions_response

val make_list_image_versions_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_by:image_version_sort_by ->
  ?sort_order:image_version_sort_order ->
  image_name:image_name ->
  unit ->
  list_image_versions_request

val make_list_images_response :
  ?images:images -> ?next_token:next_token -> unit -> list_images_response

val make_list_images_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?max_results:max_results ->
  ?name_contains:image_name_contains ->
  ?next_token:next_token ->
  ?sort_by:image_sort_by ->
  ?sort_order:image_sort_order ->
  unit ->
  list_images_request

val make_list_inference_components_output :
  ?next_token:pagination_token ->
  inference_components:inference_component_summary_list ->
  unit ->
  list_inference_components_output

val make_list_inference_components_input :
  ?sort_by:inference_component_sort_key ->
  ?sort_order:order_key ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?name_contains:inference_component_name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?status_equals:inference_component_status ->
  ?endpoint_name_equals:endpoint_name ->
  ?variant_name_equals:variant_name ->
  unit ->
  list_inference_components_input

val make_list_inference_experiments_response :
  ?inference_experiments:inference_experiment_list ->
  ?next_token:next_token ->
  unit ->
  list_inference_experiments_response

val make_list_inference_experiments_request :
  ?name_contains:name_contains ->
  ?type_:inference_experiment_type ->
  ?status_equals:inference_experiment_status ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?sort_by:sort_inference_experiments_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_inference_experiments_request

val make_list_inference_recommendations_job_steps_response :
  ?steps:inference_recommendations_job_steps ->
  ?next_token:next_token ->
  unit ->
  list_inference_recommendations_job_steps_response

val make_list_inference_recommendations_job_steps_request :
  ?status:recommendation_job_status ->
  ?step_type:recommendation_step_type ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  job_name:recommendation_job_name ->
  unit ->
  list_inference_recommendations_job_steps_request

val make_list_inference_recommendations_jobs_response :
  ?next_token:next_token ->
  inference_recommendations_jobs:inference_recommendations_jobs ->
  unit ->
  list_inference_recommendations_jobs_response

val make_list_inference_recommendations_jobs_request :
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?last_modified_time_after:last_modified_time ->
  ?last_modified_time_before:last_modified_time ->
  ?name_contains:name_contains ->
  ?status_equals:recommendation_job_status ->
  ?sort_by:list_inference_recommendations_jobs_sort_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?model_name_equals:model_name ->
  ?model_package_version_arn_equals:model_package_arn ->
  unit ->
  list_inference_recommendations_jobs_request

val make_list_job_schema_versions_response :
  ?next_token:next_token ->
  job_config_schemas:job_config_schemas ->
  unit ->
  list_job_schema_versions_response

val make_list_job_schema_versions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  job_category:job_category ->
  unit ->
  list_job_schema_versions_request

val make_list_jobs_response :
  ?next_token:next_token -> job_summaries:job_summaries -> unit -> list_jobs_response

val make_list_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  ?status_equals:job_status ->
  job_category:job_category ->
  unit ->
  list_jobs_request

val make_list_labeling_jobs_response :
  ?labeling_job_summary_list:labeling_job_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_labeling_jobs_response

val make_list_labeling_jobs_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:name_contains ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  ?status_equals:labeling_job_status ->
  unit ->
  list_labeling_jobs_request

val make_list_labeling_jobs_for_workteam_response :
  ?next_token:next_token ->
  labeling_job_summary_list:labeling_job_for_workteam_summary_list ->
  unit ->
  list_labeling_jobs_for_workteam_response

val make_list_labeling_jobs_for_workteam_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?job_reference_code_contains:job_reference_code_contains ->
  ?sort_by:list_labeling_jobs_for_workteam_sort_by_options ->
  ?sort_order:sort_order ->
  workteam_arn:workteam_arn ->
  unit ->
  list_labeling_jobs_for_workteam_request

val make_list_lineage_groups_response :
  ?lineage_group_summaries:lineage_group_summaries ->
  ?next_token:next_token ->
  unit ->
  list_lineage_groups_response

val make_list_lineage_groups_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_lineage_groups_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_lineage_groups_request

val make_mlflow_app_summary :
  ?arn:mlflow_app_arn ->
  ?name:mlflow_app_name ->
  ?status:mlflow_app_status ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?mlflow_version:mlflow_version ->
  unit ->
  mlflow_app_summary

val make_list_mlflow_apps_response :
  ?summaries:mlflow_app_summaries -> ?next_token:next_token -> unit -> list_mlflow_apps_response

val make_list_mlflow_apps_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?status:mlflow_app_status ->
  ?mlflow_version:mlflow_version ->
  ?default_for_domain_id:string_ ->
  ?account_default_status:account_default_status ->
  ?sort_by:sort_mlflow_app_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_mlflow_apps_request

val make_tracking_server_summary :
  ?tracking_server_arn:tracking_server_arn ->
  ?tracking_server_name:tracking_server_name ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?tracking_server_status:tracking_server_status ->
  ?is_active:is_tracking_server_active ->
  ?mlflow_version:mlflow_version ->
  unit ->
  tracking_server_summary

val make_list_mlflow_tracking_servers_response :
  ?tracking_server_summaries:tracking_server_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_mlflow_tracking_servers_response

val make_list_mlflow_tracking_servers_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?tracking_server_status:tracking_server_status ->
  ?mlflow_version:mlflow_version ->
  ?sort_by:sort_tracking_server_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_mlflow_tracking_servers_request

val make_list_model_bias_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_model_bias_job_definitions_response

val make_list_model_bias_job_definitions_request :
  ?endpoint_name:endpoint_name ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_model_bias_job_definitions_request

val make_model_card_export_job_summary :
  model_card_export_job_name:entity_name ->
  model_card_export_job_arn:model_card_export_job_arn ->
  status:model_card_export_job_status ->
  model_card_name:entity_name ->
  model_card_version:integer ->
  created_at:timestamp ->
  last_modified_at:timestamp ->
  unit ->
  model_card_export_job_summary

val make_list_model_card_export_jobs_response :
  ?next_token:next_token ->
  model_card_export_job_summaries:model_card_export_job_summary_list ->
  unit ->
  list_model_card_export_jobs_response

val make_list_model_card_export_jobs_request :
  ?model_card_version:integer ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?model_card_export_job_name_contains:entity_name ->
  ?status_equals:model_card_export_job_status ->
  ?sort_by:model_card_export_job_sort_by ->
  ?sort_order:model_card_export_job_sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  model_card_name:entity_name ->
  unit ->
  list_model_card_export_jobs_request

val make_model_card_version_summary :
  ?last_modified_time:timestamp ->
  model_card_name:entity_name ->
  model_card_arn:model_card_arn ->
  model_card_status:model_card_status ->
  model_card_version:integer ->
  creation_time:timestamp ->
  unit ->
  model_card_version_summary

val make_list_model_card_versions_response :
  ?next_token:next_token ->
  model_card_version_summary_list:model_card_version_summary_list ->
  unit ->
  list_model_card_versions_response

val make_list_model_card_versions_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?max_results:max_results ->
  ?model_card_status:model_card_status ->
  ?next_token:next_token ->
  ?sort_by:model_card_version_sort_by ->
  ?sort_order:model_card_sort_order ->
  model_card_name:model_card_name_or_arn ->
  unit ->
  list_model_card_versions_request

val make_model_card_summary :
  ?last_modified_time:timestamp ->
  model_card_name:entity_name ->
  model_card_arn:model_card_arn ->
  model_card_status:model_card_status ->
  creation_time:timestamp ->
  unit ->
  model_card_summary

val make_list_model_cards_response :
  ?next_token:next_token ->
  model_card_summaries:model_card_summary_list ->
  unit ->
  list_model_cards_response

val make_list_model_cards_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?max_results:max_results ->
  ?name_contains:entity_name ->
  ?model_card_status:model_card_status ->
  ?next_token:next_token ->
  ?sort_by:model_card_sort_by ->
  ?sort_order:model_card_sort_order ->
  unit ->
  list_model_cards_request

val make_list_model_explainability_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_model_explainability_job_definitions_response

val make_list_model_explainability_job_definitions_request :
  ?endpoint_name:endpoint_name ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_model_explainability_job_definitions_request

val make_model_metadata_summary :
  domain:string_ ->
  framework:string_ ->
  task:string_ ->
  model:string_ ->
  framework_version:string_ ->
  unit ->
  model_metadata_summary

val make_list_model_metadata_response :
  ?next_token:next_token ->
  model_metadata_summaries:model_metadata_summaries ->
  unit ->
  list_model_metadata_response

val make_model_metadata_filter :
  name:model_metadata_filter_type -> value:string256 -> unit -> model_metadata_filter

val make_model_metadata_search_expression :
  ?filters:model_metadata_filters -> unit -> model_metadata_search_expression

val make_list_model_metadata_request :
  ?search_expression:model_metadata_search_expression ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_model_metadata_request

val make_model_package_group_summary :
  ?model_package_group_description:entity_description ->
  ?managed_configuration:managed_configuration ->
  model_package_group_name:entity_name ->
  model_package_group_arn:model_package_group_arn ->
  creation_time:creation_time ->
  model_package_group_status:model_package_group_status ->
  unit ->
  model_package_group_summary

val make_list_model_package_groups_output :
  ?next_token:next_token ->
  model_package_group_summary_list:model_package_group_summary_list ->
  unit ->
  list_model_package_groups_output

val make_list_model_package_groups_input :
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?next_token:next_token ->
  ?sort_by:model_package_group_sort_by ->
  ?sort_order:sort_order ->
  ?cross_account_filter_option:cross_account_filter_option ->
  unit ->
  list_model_package_groups_input

val make_model_package_summary :
  ?model_package_name:entity_name ->
  ?model_package_group_name:entity_name ->
  ?model_package_version:model_package_version ->
  ?model_package_description:entity_description ->
  ?model_approval_status:model_approval_status ->
  ?model_life_cycle:model_life_cycle ->
  ?model_package_registration_type:model_package_registration_type ->
  model_package_arn:model_package_arn ->
  creation_time:creation_time ->
  model_package_status:model_package_status ->
  unit ->
  model_package_summary

val make_list_model_packages_output :
  ?next_token:next_token ->
  model_package_summary_list:model_package_summary_list ->
  unit ->
  list_model_packages_output

val make_list_model_packages_input :
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?model_approval_status:model_approval_status ->
  ?model_package_group_name:arn_or_name ->
  ?model_package_type:model_package_type ->
  ?next_token:next_token ->
  ?sort_by:model_package_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_model_packages_input

val make_list_model_quality_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_model_quality_job_definitions_response

val make_list_model_quality_job_definitions_request :
  ?endpoint_name:endpoint_name ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_model_quality_job_definitions_request

val make_model_summary :
  model_name:model_name -> model_arn:model_arn -> creation_time:timestamp -> unit -> model_summary

val make_list_models_output :
  ?next_token:pagination_token -> models:model_summary_list -> unit -> list_models_output

val make_list_models_input :
  ?sort_by:model_sort_key ->
  ?sort_order:order_key ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?name_contains:model_name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_models_input

val make_monitoring_alert_history_summary :
  monitoring_schedule_name:monitoring_schedule_name ->
  monitoring_alert_name:monitoring_alert_name ->
  creation_time:timestamp ->
  alert_status:monitoring_alert_status ->
  unit ->
  monitoring_alert_history_summary

val make_list_monitoring_alert_history_response :
  ?monitoring_alert_history:monitoring_alert_history_list ->
  ?next_token:next_token ->
  unit ->
  list_monitoring_alert_history_response

val make_list_monitoring_alert_history_request :
  ?monitoring_schedule_name:monitoring_schedule_name ->
  ?monitoring_alert_name:monitoring_alert_name ->
  ?sort_by:monitoring_alert_history_sort_key ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?status_equals:monitoring_alert_status ->
  unit ->
  list_monitoring_alert_history_request

val make_model_dashboard_indicator_action :
  ?enabled:boolean_ -> unit -> model_dashboard_indicator_action

val make_monitoring_alert_actions :
  ?model_dashboard_indicator:model_dashboard_indicator_action -> unit -> monitoring_alert_actions

val make_monitoring_alert_summary :
  monitoring_alert_name:monitoring_alert_name ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  alert_status:monitoring_alert_status ->
  datapoints_to_alert:monitoring_datapoints_to_alert ->
  evaluation_period:monitoring_evaluation_period ->
  actions:monitoring_alert_actions ->
  unit ->
  monitoring_alert_summary

val make_list_monitoring_alerts_response :
  ?monitoring_alert_summaries:monitoring_alert_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_monitoring_alerts_response

val make_list_monitoring_alerts_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  list_monitoring_alerts_request

val make_list_monitoring_executions_response :
  ?next_token:next_token ->
  monitoring_execution_summaries:monitoring_execution_summary_list ->
  unit ->
  list_monitoring_executions_response

val make_list_monitoring_executions_request :
  ?monitoring_schedule_name:monitoring_schedule_name ->
  ?endpoint_name:endpoint_name ->
  ?sort_by:monitoring_execution_sort_key ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?scheduled_time_before:timestamp ->
  ?scheduled_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?status_equals:execution_status ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?monitoring_type_equals:monitoring_type ->
  unit ->
  list_monitoring_executions_request

val make_monitoring_schedule_summary :
  ?endpoint_name:endpoint_name ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?monitoring_type:monitoring_type ->
  monitoring_schedule_name:monitoring_schedule_name ->
  monitoring_schedule_arn:monitoring_schedule_arn ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  monitoring_schedule_status:schedule_status ->
  unit ->
  monitoring_schedule_summary

val make_list_monitoring_schedules_response :
  ?next_token:next_token ->
  monitoring_schedule_summaries:monitoring_schedule_summary_list ->
  unit ->
  list_monitoring_schedules_response

val make_list_monitoring_schedules_request :
  ?endpoint_name:endpoint_name ->
  ?sort_by:monitoring_schedule_sort_key ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?name_contains:name_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?status_equals:schedule_status ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?monitoring_type_equals:monitoring_type ->
  unit ->
  list_monitoring_schedules_request

val make_notebook_instance_lifecycle_config_summary :
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  notebook_instance_lifecycle_config_arn:notebook_instance_lifecycle_config_arn ->
  unit ->
  notebook_instance_lifecycle_config_summary

val make_list_notebook_instance_lifecycle_configs_output :
  ?next_token:next_token ->
  ?notebook_instance_lifecycle_configs:notebook_instance_lifecycle_config_summary_list ->
  unit ->
  list_notebook_instance_lifecycle_configs_output

val make_list_notebook_instance_lifecycle_configs_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_by:notebook_instance_lifecycle_config_sort_key ->
  ?sort_order:notebook_instance_lifecycle_config_sort_order ->
  ?name_contains:notebook_instance_lifecycle_config_name_contains ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  ?last_modified_time_before:last_modified_time ->
  ?last_modified_time_after:last_modified_time ->
  unit ->
  list_notebook_instance_lifecycle_configs_input

val make_notebook_instance_summary :
  ?notebook_instance_status:notebook_instance_status ->
  ?url:notebook_instance_url ->
  ?instance_type:instance_type ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?default_code_repository:code_repository_name_or_url ->
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  notebook_instance_name:notebook_instance_name ->
  notebook_instance_arn:notebook_instance_arn ->
  unit ->
  notebook_instance_summary

val make_list_notebook_instances_output :
  ?next_token:next_token ->
  ?notebook_instances:notebook_instance_summary_list ->
  unit ->
  list_notebook_instances_output

val make_list_notebook_instances_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_by:notebook_instance_sort_key ->
  ?sort_order:notebook_instance_sort_order ->
  ?name_contains:notebook_instance_name_contains ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  ?last_modified_time_before:last_modified_time ->
  ?last_modified_time_after:last_modified_time ->
  ?status_equals:notebook_instance_status ->
  ?notebook_instance_lifecycle_config_name_contains:notebook_instance_lifecycle_config_name ->
  ?default_code_repository_contains:code_repository_contains ->
  ?additional_code_repository_equals:code_repository_name_or_url ->
  unit ->
  list_notebook_instances_input

val make_optimization_job_summary :
  ?optimization_start_time:timestamp ->
  ?optimization_end_time:timestamp ->
  ?last_modified_time:last_modified_time ->
  ?max_instance_count:optimization_job_max_instance_count ->
  optimization_job_name:entity_name ->
  optimization_job_arn:optimization_job_arn ->
  creation_time:creation_time ->
  optimization_job_status:optimization_job_status ->
  deployment_instance_type:optimization_job_deployment_instance_type ->
  optimization_types:optimization_types ->
  unit ->
  optimization_job_summary

val make_list_optimization_jobs_response :
  ?next_token:next_token ->
  optimization_job_summaries:optimization_job_summaries ->
  unit ->
  list_optimization_jobs_response

val make_list_optimization_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?last_modified_time_after:last_modified_time ->
  ?last_modified_time_before:last_modified_time ->
  ?optimization_contains:name_contains ->
  ?name_contains:name_contains ->
  ?status_equals:optimization_job_status ->
  ?sort_by:list_optimization_jobs_sort_by ->
  ?sort_order:sort_order ->
  unit ->
  list_optimization_jobs_request

val make_partner_app_summary :
  ?arn:partner_app_arn ->
  ?name:partner_app_name ->
  ?type_:partner_app_type ->
  ?status:partner_app_status ->
  ?creation_time:timestamp ->
  unit ->
  partner_app_summary

val make_list_partner_apps_response :
  ?summaries:partner_app_summaries -> ?next_token:next_token -> unit -> list_partner_apps_response

val make_list_partner_apps_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_partner_apps_request

val make_quality_check_step_metadata :
  ?check_type:string256 ->
  ?baseline_used_for_drift_check_statistics:string1024 ->
  ?baseline_used_for_drift_check_constraints:string1024 ->
  ?calculated_baseline_statistics:string1024 ->
  ?calculated_baseline_constraints:string1024 ->
  ?model_package_group_name:string256 ->
  ?violation_report:string1024 ->
  ?check_job_arn:string256 ->
  ?skip_check:boolean_ ->
  ?register_new_baseline:boolean_ ->
  unit ->
  quality_check_step_metadata

val make_register_model_step_metadata : ?arn:string256 -> unit -> register_model_step_metadata
val make_model_step_metadata : ?arn:string256 -> unit -> model_step_metadata

val make_tuning_job_step_meta_data :
  ?arn:hyper_parameter_tuning_job_arn -> unit -> tuning_job_step_meta_data

val make_transform_job_step_metadata : ?arn:transform_job_arn -> unit -> transform_job_step_metadata

val make_processing_job_step_metadata :
  ?arn:processing_job_arn -> unit -> processing_job_step_metadata

val make_training_job_step_metadata : ?arn:training_job_arn -> unit -> training_job_step_metadata

val make_pipeline_execution_step_metadata :
  ?training_job:training_job_step_metadata ->
  ?processing_job:processing_job_step_metadata ->
  ?transform_job:transform_job_step_metadata ->
  ?tuning_job:tuning_job_step_meta_data ->
  ?model:model_step_metadata ->
  ?register_model:register_model_step_metadata ->
  ?condition:condition_step_metadata ->
  ?callback:callback_step_metadata ->
  ?lambda:lambda_step_metadata ->
  ?em_r:emr_step_metadata ->
  ?quality_check:quality_check_step_metadata ->
  ?clarify_check:clarify_check_step_metadata ->
  ?fail:fail_step_metadata ->
  ?auto_ml_job:auto_ml_job_step_metadata ->
  ?endpoint:endpoint_step_metadata ->
  ?endpoint_config:endpoint_config_step_metadata ->
  ?bedrock_custom_model:bedrock_custom_model_metadata ->
  ?bedrock_custom_model_deployment:bedrock_custom_model_deployment_metadata ->
  ?bedrock_provisioned_model_throughput:bedrock_provisioned_model_throughput_metadata ->
  ?bedrock_model_import:bedrock_model_import_metadata ->
  ?inference_component:inference_component_metadata ->
  ?lineage:lineage_metadata ->
  ?job:job_step_metadata ->
  unit ->
  pipeline_execution_step_metadata

val make_pipeline_execution_step :
  ?step_name:step_name ->
  ?step_display_name:step_display_name ->
  ?step_description:step_description ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?step_status:step_status ->
  ?cache_hit_result:cache_hit_result ->
  ?failure_reason:failure_reason ->
  ?metadata:pipeline_execution_step_metadata ->
  ?attempt_count:integer ->
  ?selective_execution_result:selective_execution_result ->
  unit ->
  pipeline_execution_step

val make_list_pipeline_execution_steps_response :
  ?pipeline_execution_steps:pipeline_execution_step_list ->
  ?next_token:next_token ->
  unit ->
  list_pipeline_execution_steps_response

val make_list_pipeline_execution_steps_request :
  ?pipeline_execution_arn:pipeline_execution_arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  unit ->
  list_pipeline_execution_steps_request

val make_pipeline_execution_summary :
  ?pipeline_execution_arn:pipeline_execution_arn ->
  ?start_time:timestamp ->
  ?pipeline_execution_status:pipeline_execution_status ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_execution_failure_reason:string3072 ->
  unit ->
  pipeline_execution_summary

val make_list_pipeline_executions_response :
  ?pipeline_execution_summaries:pipeline_execution_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_pipeline_executions_response

val make_list_pipeline_executions_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_pipeline_executions_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  pipeline_name:pipeline_name_or_arn ->
  unit ->
  list_pipeline_executions_request

val make_parameter : name:pipeline_parameter_name -> value:string1024 -> unit -> parameter

val make_list_pipeline_parameters_for_execution_response :
  ?pipeline_parameters:parameter_list ->
  ?next_token:next_token ->
  unit ->
  list_pipeline_parameters_for_execution_response

val make_list_pipeline_parameters_for_execution_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  list_pipeline_parameters_for_execution_request

val make_pipeline_version_summary :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_version_id:pipeline_version_id ->
  ?creation_time:timestamp ->
  ?pipeline_version_description:pipeline_version_description ->
  ?pipeline_version_display_name:pipeline_version_name ->
  ?last_execution_pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  pipeline_version_summary

val make_list_pipeline_versions_response :
  ?pipeline_version_summaries:pipeline_version_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_pipeline_versions_response

val make_list_pipeline_versions_request :
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  pipeline_name:pipeline_name_or_arn ->
  unit ->
  list_pipeline_versions_request

val make_pipeline_summary :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_name:pipeline_name ->
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_description:pipeline_description ->
  ?role_arn:role_arn ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_execution_time:timestamp ->
  unit ->
  pipeline_summary

val make_list_pipelines_response :
  ?pipeline_summaries:pipeline_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_pipelines_response

val make_list_pipelines_request :
  ?pipeline_name_prefix:pipeline_name ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_pipelines_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_pipelines_request

val make_processing_job_summary :
  ?processing_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?exit_message:exit_message ->
  processing_job_name:processing_job_name ->
  processing_job_arn:processing_job_arn ->
  creation_time:timestamp ->
  processing_job_status:processing_job_status ->
  unit ->
  processing_job_summary

val make_list_processing_jobs_response :
  ?next_token:next_token ->
  processing_job_summaries:processing_job_summaries ->
  unit ->
  list_processing_jobs_response

val make_list_processing_jobs_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:string_ ->
  ?status_equals:processing_job_status ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_processing_jobs_request

val make_project_summary :
  ?project_description:entity_description ->
  project_name:project_entity_name ->
  project_arn:project_arn ->
  project_id:project_id ->
  creation_time:timestamp ->
  project_status:project_status ->
  unit ->
  project_summary

val make_list_projects_output :
  ?next_token:next_token ->
  project_summary_list:project_summary_list ->
  unit ->
  list_projects_output

val make_list_projects_input :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?max_results:max_results ->
  ?name_contains:project_entity_name ->
  ?next_token:next_token ->
  ?sort_by:project_sort_by ->
  ?sort_order:project_sort_order ->
  unit ->
  list_projects_input

val make_resource_catalog :
  resource_catalog_arn:resource_catalog_arn ->
  resource_catalog_name:resource_catalog_name ->
  description:resource_catalog_description ->
  creation_time:timestamp ->
  unit ->
  resource_catalog

val make_list_resource_catalogs_response :
  ?resource_catalogs:resource_catalog_list ->
  ?next_token:next_token ->
  unit ->
  list_resource_catalogs_response

val make_list_resource_catalogs_request :
  ?name_contains:resource_catalog_name ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?sort_order:resource_catalog_sort_order ->
  ?sort_by:resource_catalog_sort_by ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_resource_catalogs_request

val make_ownership_settings_summary :
  ?owner_user_profile_name:user_profile_name -> unit -> ownership_settings_summary

val make_space_sharing_settings_summary :
  ?sharing_type:sharing_type -> unit -> space_sharing_settings_summary

val make_space_settings_summary :
  ?app_type:app_type ->
  ?remote_access:feature_status ->
  ?space_storage_settings:space_storage_settings ->
  unit ->
  space_settings_summary

val make_space_details :
  ?domain_id:domain_id ->
  ?space_name:space_name ->
  ?status:space_status ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?space_settings_summary:space_settings_summary ->
  ?space_sharing_settings_summary:space_sharing_settings_summary ->
  ?ownership_settings_summary:ownership_settings_summary ->
  ?space_display_name:non_empty_string64 ->
  unit ->
  space_details

val make_list_spaces_response :
  ?spaces:space_list -> ?next_token:next_token -> unit -> list_spaces_response

val make_list_spaces_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:space_sort_key ->
  ?domain_id_equals:domain_id ->
  ?space_name_contains:space_name ->
  unit ->
  list_spaces_request

val make_list_stage_devices_response :
  ?next_token:next_token ->
  device_deployment_summaries:device_deployment_summaries ->
  unit ->
  list_stage_devices_response

val make_list_stage_devices_request :
  ?next_token:next_token ->
  ?max_results:list_max_results ->
  ?exclude_devices_deployed_in_other_stage:boolean_ ->
  edge_deployment_plan_name:entity_name ->
  stage_name:entity_name ->
  unit ->
  list_stage_devices_request

val make_studio_lifecycle_config_details :
  ?studio_lifecycle_config_arn:studio_lifecycle_config_arn ->
  ?studio_lifecycle_config_name:studio_lifecycle_config_name ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?studio_lifecycle_config_app_type:studio_lifecycle_config_app_type ->
  unit ->
  studio_lifecycle_config_details

val make_list_studio_lifecycle_configs_response :
  ?next_token:next_token ->
  ?studio_lifecycle_configs:studio_lifecycle_configs_list ->
  unit ->
  list_studio_lifecycle_configs_response

val make_list_studio_lifecycle_configs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:studio_lifecycle_config_name ->
  ?app_type_equals:studio_lifecycle_config_app_type ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?modified_time_before:timestamp ->
  ?modified_time_after:timestamp ->
  ?sort_by:studio_lifecycle_config_sort_key ->
  ?sort_order:sort_order ->
  unit ->
  list_studio_lifecycle_configs_request

val make_list_subscribed_workteams_response :
  ?next_token:next_token ->
  subscribed_workteams:subscribed_workteams ->
  unit ->
  list_subscribed_workteams_response

val make_list_subscribed_workteams_request :
  ?name_contains:workteam_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_subscribed_workteams_request

val make_list_tags_output : ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_output

val make_list_tags_input :
  ?next_token:next_token ->
  ?max_results:list_tags_max_results ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_input

val make_training_job_summary :
  ?training_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?secondary_status:secondary_status ->
  ?warm_pool_status:warm_pool_status ->
  ?training_plan_arn:training_plan_arn ->
  training_job_name:training_job_name ->
  training_job_arn:training_job_arn ->
  creation_time:timestamp ->
  training_job_status:training_job_status ->
  unit ->
  training_job_summary

val make_list_training_jobs_response :
  ?next_token:next_token ->
  training_job_summaries:training_job_summaries ->
  unit ->
  list_training_jobs_response

val make_list_training_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?status_equals:training_job_status ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  ?warm_pool_status_equals:warm_pool_resource_status ->
  ?training_plan_arn_equals:training_plan_arn ->
  unit ->
  list_training_jobs_request

val make_list_training_jobs_for_hyper_parameter_tuning_job_response :
  ?next_token:next_token ->
  training_job_summaries:hyper_parameter_training_job_summaries ->
  unit ->
  list_training_jobs_for_hyper_parameter_tuning_job_response

val make_list_training_jobs_for_hyper_parameter_tuning_job_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?status_equals:training_job_status ->
  ?sort_by:training_job_sort_by_options ->
  ?sort_order:sort_order ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  list_training_jobs_for_hyper_parameter_tuning_job_request

val make_training_plan_summary :
  ?status_message:training_plan_status_message ->
  ?duration_hours:training_plan_duration_hours ->
  ?duration_minutes:training_plan_duration_minutes ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?upfront_fee:string256 ->
  ?currency_code:currency_code ->
  ?total_instance_count:total_instance_count ->
  ?available_instance_count:available_instance_count ->
  ?in_use_instance_count:in_use_instance_count ->
  ?total_ultra_server_count:ultra_server_count ->
  ?target_resources:sage_maker_resource_names ->
  ?reserved_capacity_summaries:reserved_capacity_summaries ->
  training_plan_arn:training_plan_arn ->
  training_plan_name:training_plan_name ->
  status:training_plan_status ->
  unit ->
  training_plan_summary

val make_list_training_plans_response :
  ?next_token:next_token ->
  training_plan_summaries:training_plan_summaries ->
  unit ->
  list_training_plans_response

val make_training_plan_filter :
  name:training_plan_filter_name -> value:string64 -> unit -> training_plan_filter

val make_list_training_plans_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?start_time_after:timestamp ->
  ?start_time_before:timestamp ->
  ?sort_by:training_plan_sort_by ->
  ?sort_order:training_plan_sort_order ->
  ?filters:training_plan_filters ->
  unit ->
  list_training_plans_request

val make_transform_job_summary :
  ?transform_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?failure_reason:failure_reason ->
  transform_job_name:transform_job_name ->
  transform_job_arn:transform_job_arn ->
  creation_time:timestamp ->
  transform_job_status:transform_job_status ->
  unit ->
  transform_job_summary

val make_list_transform_jobs_response :
  ?next_token:next_token ->
  transform_job_summaries:transform_job_summaries ->
  unit ->
  list_transform_jobs_response

val make_list_transform_jobs_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?status_equals:transform_job_status ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_transform_jobs_request

val make_trial_component_summary :
  ?trial_component_name:experiment_entity_name ->
  ?trial_component_arn:trial_component_arn ->
  ?display_name:experiment_entity_name ->
  ?trial_component_source:trial_component_source ->
  ?status:trial_component_status ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  unit ->
  trial_component_summary

val make_list_trial_components_response :
  ?trial_component_summaries:trial_component_summaries ->
  ?next_token:next_token ->
  unit ->
  list_trial_components_response

val make_list_trial_components_request :
  ?experiment_name:experiment_entity_name ->
  ?trial_name:experiment_entity_name ->
  ?source_arn:string256 ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_trial_components_by ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_trial_components_request

val make_trial_summary :
  ?trial_arn:trial_arn ->
  ?trial_name:experiment_entity_name ->
  ?display_name:experiment_entity_name ->
  ?trial_source:trial_source ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  unit ->
  trial_summary

val make_list_trials_response :
  ?trial_summaries:trial_summaries -> ?next_token:next_token -> unit -> list_trials_response

val make_list_trials_request :
  ?experiment_name:experiment_entity_name ->
  ?trial_component_name:experiment_entity_name ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?sort_by:sort_trials_by ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_trials_request

val make_ultra_server :
  ?configured_spare_instance_count:configured_spare_instance_count ->
  ?available_instance_count:available_instance_count ->
  ?in_use_instance_count:in_use_instance_count ->
  ?available_spare_instance_count:available_spare_instance_count ->
  ?unhealthy_instance_count:unhealthy_instance_count ->
  ?health_status:ultra_server_health_status ->
  ultra_server_id:non_empty_string256 ->
  ultra_server_type:ultra_server_type ->
  availability_zone:availability_zone ->
  instance_type:reserved_capacity_instance_type ->
  total_instance_count:total_instance_count ->
  unit ->
  ultra_server

val make_list_ultra_servers_by_reserved_capacity_response :
  ?next_token:next_token ->
  ultra_servers:ultra_servers ->
  unit ->
  list_ultra_servers_by_reserved_capacity_response

val make_list_ultra_servers_by_reserved_capacity_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  reserved_capacity_arn:reserved_capacity_arn ->
  unit ->
  list_ultra_servers_by_reserved_capacity_request

val make_user_profile_details :
  ?domain_id:domain_id ->
  ?user_profile_name:user_profile_name ->
  ?status:user_profile_status ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  unit ->
  user_profile_details

val make_list_user_profiles_response :
  ?user_profiles:user_profile_list -> ?next_token:next_token -> unit -> list_user_profiles_response

val make_list_user_profiles_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:user_profile_sort_key ->
  ?domain_id_equals:domain_id ->
  ?user_profile_name_contains:user_profile_name ->
  unit ->
  list_user_profiles_request

val make_list_workforces_response :
  ?next_token:next_token -> workforces:workforces -> unit -> list_workforces_response

val make_list_workforces_request :
  ?sort_by:list_workforces_sort_by_options ->
  ?sort_order:sort_order ->
  ?name_contains:workforce_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_workforces_request

val make_list_workteams_response :
  ?next_token:next_token -> workteams:workteams -> unit -> list_workteams_response

val make_list_workteams_request :
  ?sort_by:list_workteams_sort_by_options ->
  ?sort_order:sort_order ->
  ?name_contains:workteam_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_workteams_request

val make_model :
  ?model_name:model_name ->
  ?primary_container:container_definition ->
  ?containers:container_definition_list ->
  ?inference_execution_config:inference_execution_config ->
  ?execution_role_arn:role_arn ->
  ?vpc_config:vpc_config ->
  ?creation_time:timestamp ->
  ?model_arn:model_arn ->
  ?enable_network_isolation:boolean_ ->
  ?tags:tag_list ->
  ?deployment_recommendation:deployment_recommendation ->
  unit ->
  model

val make_model_card :
  ?model_card_arn:model_card_arn ->
  ?model_card_name:entity_name ->
  ?model_card_version:integer ->
  ?content:model_card_content ->
  ?model_card_status:model_card_status ->
  ?security_config:model_card_security_config ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?tags:tag_list ->
  ?model_id:string_ ->
  ?risk_rating:string_ ->
  ?model_package_group_name:string_ ->
  unit ->
  model_card

val make_model_dashboard_endpoint :
  endpoint_name:endpoint_name ->
  endpoint_arn:endpoint_arn ->
  creation_time:timestamp ->
  last_modified_time:timestamp ->
  endpoint_status:endpoint_status ->
  unit ->
  model_dashboard_endpoint

val make_model_dashboard_model_card :
  ?model_card_arn:model_card_arn ->
  ?model_card_name:entity_name ->
  ?model_card_version:integer ->
  ?model_card_status:model_card_status ->
  ?security_config:model_card_security_config ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?tags:tag_list ->
  ?model_id:string_ ->
  ?risk_rating:string_ ->
  unit ->
  model_dashboard_model_card

val make_model_dashboard_monitoring_schedule :
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  ?monitoring_schedule_name:monitoring_schedule_name ->
  ?monitoring_schedule_status:schedule_status ->
  ?monitoring_type:monitoring_type ->
  ?failure_reason:failure_reason ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?monitoring_schedule_config:monitoring_schedule_config ->
  ?endpoint_name:endpoint_name ->
  ?monitoring_alert_summaries:monitoring_alert_summary_list ->
  ?last_monitoring_execution_summary:monitoring_execution_summary ->
  ?batch_transform_input:batch_transform_input ->
  unit ->
  model_dashboard_monitoring_schedule

val make_transform_job :
  ?transform_job_name:transform_job_name ->
  ?transform_job_arn:transform_job_arn ->
  ?transform_job_status:transform_job_status ->
  ?failure_reason:failure_reason ->
  ?model_name:model_name ->
  ?max_concurrent_transforms:max_concurrent_transforms ->
  ?model_client_config:model_client_config ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?batch_strategy:batch_strategy ->
  ?environment:transform_environment_map ->
  ?transform_input:transform_input ->
  ?transform_output:transform_output ->
  ?data_capture_config:batch_data_capture_config ->
  ?transform_resources:transform_resources ->
  ?creation_time:timestamp ->
  ?transform_start_time:timestamp ->
  ?transform_end_time:timestamp ->
  ?labeling_job_arn:labeling_job_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?data_processing:data_processing ->
  ?experiment_config:experiment_config ->
  ?tags:tag_list ->
  unit ->
  transform_job

val make_model_dashboard_model :
  ?model:model ->
  ?endpoints:model_dashboard_endpoints ->
  ?last_batch_transform_job:transform_job ->
  ?monitoring_schedules:model_dashboard_monitoring_schedules ->
  ?model_card:model_dashboard_model_card ->
  unit ->
  model_dashboard_model

val make_model_package :
  ?model_package_name:entity_name ->
  ?model_package_group_name:entity_name ->
  ?model_package_version:model_package_version ->
  ?model_package_registration_type:model_package_registration_type ->
  ?model_package_arn:model_package_arn ->
  ?model_package_description:entity_description ->
  ?creation_time:creation_time ->
  ?inference_specification:inference_specification ->
  ?source_algorithm_specification:source_algorithm_specification ->
  ?validation_specification:model_package_validation_specification ->
  ?model_package_status:model_package_status ->
  ?model_package_status_details:model_package_status_details ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?model_approval_status:model_approval_status ->
  ?created_by:user_context ->
  ?metadata_properties:metadata_properties ->
  ?model_metrics:model_metrics ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?approval_description:approval_description ->
  ?domain:string_ ->
  ?task:string_ ->
  ?sample_payload_url:string_ ->
  ?additional_inference_specifications:additional_inference_specifications ->
  ?source_uri:model_package_source_uri ->
  ?security_config:model_package_security_config ->
  ?model_card:model_package_model_card ->
  ?model_life_cycle:model_life_cycle ->
  ?tags:tag_list ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?drift_check_baselines:drift_check_baselines ->
  ?skip_model_validation:skip_model_validation ->
  unit ->
  model_package

val make_model_package_group :
  ?model_package_group_name:entity_name ->
  ?model_package_group_arn:model_package_group_arn ->
  ?model_package_group_description:entity_description ->
  ?creation_time:creation_time ->
  ?created_by:user_context ->
  ?model_package_group_status:model_package_group_status ->
  ?tags:tag_list ->
  unit ->
  model_package_group

val make_nested_filters :
  nested_property_name:resource_property_name -> filters:filter_list -> unit -> nested_filters

val make_online_store_config_update :
  ?ttl_duration:ttl_duration -> unit -> online_store_config_update

val make_parent :
  ?trial_name:experiment_entity_name -> ?experiment_name:experiment_entity_name -> unit -> parent

val make_pipeline :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_name:pipeline_name ->
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_description:pipeline_description ->
  ?role_arn:role_arn ->
  ?pipeline_status:pipeline_status ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?last_run_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_by:user_context ->
  ?parallelism_configuration:parallelism_configuration ->
  ?tags:tag_list ->
  unit ->
  pipeline

val make_pipeline_execution :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_execution_arn:pipeline_execution_arn ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_execution_status:pipeline_execution_status ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_experiment_config:pipeline_experiment_config ->
  ?failure_reason:pipeline_execution_failure_reason ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_by:user_context ->
  ?parallelism_configuration:parallelism_configuration ->
  ?selective_execution_config:selective_execution_config ->
  ?pipeline_parameters:parameter_list ->
  ?pipeline_version_id:pipeline_version_id ->
  ?pipeline_version_display_name:pipeline_version_name ->
  unit ->
  pipeline_execution

val make_pipeline_version :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_version_id:pipeline_version_id ->
  ?pipeline_version_display_name:pipeline_version_name ->
  ?pipeline_version_description:pipeline_version_description ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_by:user_context ->
  ?last_executed_pipeline_execution_arn:pipeline_execution_arn ->
  ?last_executed_pipeline_execution_display_name:pipeline_execution_name ->
  ?last_executed_pipeline_execution_status:pipeline_execution_status ->
  unit ->
  pipeline_version

val make_processing_job :
  ?processing_inputs:processing_inputs ->
  ?processing_output_config:processing_output_config ->
  ?processing_job_name:processing_job_name ->
  ?processing_resources:processing_resources ->
  ?stopping_condition:processing_stopping_condition ->
  ?app_specification:app_specification ->
  ?environment:processing_environment_map ->
  ?network_config:network_config ->
  ?role_arn:role_arn ->
  ?experiment_config:experiment_config ->
  ?processing_job_arn:processing_job_arn ->
  ?processing_job_status:processing_job_status ->
  ?exit_message:exit_message ->
  ?failure_reason:failure_reason ->
  ?processing_end_time:timestamp ->
  ?processing_start_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?training_job_arn:training_job_arn ->
  ?tags:tag_list ->
  unit ->
  processing_job

val make_profiler_config_for_update :
  ?s3_output_path:s3_uri ->
  ?profiling_interval_in_milliseconds:profiling_interval_in_milliseconds ->
  ?profiling_parameters:profiling_parameters ->
  ?disable_profiler:disable_profiler ->
  unit ->
  profiler_config_for_update

val make_project :
  ?project_arn:project_arn ->
  ?project_name:project_entity_name ->
  ?project_id:project_id ->
  ?project_description:entity_description ->
  ?service_catalog_provisioning_details:service_catalog_provisioning_details ->
  ?service_catalog_provisioned_product_details:service_catalog_provisioned_product_details ->
  ?project_status:project_status ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?template_provider_details:template_provider_detail_list ->
  ?tags:tag_list ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  unit ->
  project

val make_put_model_package_group_policy_output :
  model_package_group_arn:model_package_group_arn -> unit -> put_model_package_group_policy_output

val make_put_model_package_group_policy_input :
  model_package_group_name:entity_name ->
  resource_policy:policy_string ->
  unit ->
  put_model_package_group_policy_input

val make_query_filters :
  ?types:query_types ->
  ?lineage_types:query_lineage_types ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?modified_before:timestamp ->
  ?modified_after:timestamp ->
  ?properties:query_properties ->
  unit ->
  query_filters

val make_vertex :
  ?arn:association_entity_arn -> ?type_:string40 -> ?lineage_type:lineage_type -> unit -> vertex

val make_query_lineage_response :
  ?vertices:vertices -> ?edges:edges -> ?next_token:string8192 -> unit -> query_lineage_response

val make_query_lineage_request :
  ?start_arns:query_lineage_start_arns ->
  ?direction:direction ->
  ?include_edges:boolean_ ->
  ?filters:query_filters ->
  ?max_depth:query_lineage_max_depth ->
  ?max_results:query_lineage_max_results ->
  ?next_token:string8192 ->
  unit ->
  query_lineage_request

val make_register_devices_request :
  ?tags:tag_list ->
  device_fleet_name:entity_name ->
  devices:devices ->
  unit ->
  register_devices_request

val make_remote_debug_config_for_update :
  ?enable_remote_debug:enable_remote_debug -> unit -> remote_debug_config_for_update

val make_rendering_error : code:string_ -> message:string_ -> unit -> rendering_error

val make_render_ui_template_response :
  rendered_content:string_ -> errors:rendering_error_list -> unit -> render_ui_template_response

val make_renderable_task : input:task_input -> unit -> renderable_task

val make_render_ui_template_request :
  ?ui_template:ui_template ->
  ?human_task_ui_arn:human_task_ui_arn ->
  task:renderable_task ->
  role_arn:role_arn ->
  unit ->
  render_ui_template_request

val make_reserved_capacity_offering :
  ?reserved_capacity_type:reserved_capacity_type ->
  ?ultra_server_type:ultra_server_type ->
  ?ultra_server_count:ultra_server_count ->
  ?availability_zone:availability_zone ->
  ?duration_hours:reserved_capacity_duration_hours ->
  ?duration_minutes:reserved_capacity_duration_minutes ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?extension_start_time:timestamp ->
  ?extension_end_time:timestamp ->
  instance_type:reserved_capacity_instance_type ->
  instance_count:reserved_capacity_instance_count ->
  unit ->
  reserved_capacity_offering

val make_resource_config_for_update :
  keep_alive_period_in_seconds:keep_alive_period_in_seconds -> unit -> resource_config_for_update

val make_retry_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> retry_pipeline_execution_response

val make_retry_pipeline_execution_request :
  ?parallelism_configuration:parallelism_configuration ->
  pipeline_execution_arn:pipeline_execution_arn ->
  client_request_token:idempotency_token ->
  unit ->
  retry_pipeline_execution_request

val make_update_workteam_response : workteam:workteam -> unit -> update_workteam_response

val make_update_workteam_request :
  ?member_definitions:member_definitions ->
  ?description:string200 ->
  ?notification_configuration:notification_configuration ->
  ?worker_access_configuration:worker_access_configuration ->
  workteam_name:workteam_name ->
  unit ->
  update_workteam_request

val make_update_workforce_response : workforce:workforce -> unit -> update_workforce_response

val make_update_workforce_request :
  ?source_ip_config:source_ip_config ->
  ?oidc_config:oidc_config ->
  ?workforce_vpc_config:workforce_vpc_config_request ->
  ?ip_address_type:workforce_ip_address_type ->
  workforce_name:workforce_name ->
  unit ->
  update_workforce_request

val make_update_user_profile_response :
  ?user_profile_arn:user_profile_arn -> unit -> update_user_profile_response

val make_update_user_profile_request :
  ?user_settings:user_settings ->
  domain_id:domain_id ->
  user_profile_name:user_profile_name ->
  unit ->
  update_user_profile_request

val make_update_trial_component_response :
  ?trial_component_arn:trial_component_arn -> unit -> update_trial_component_response

val make_update_trial_component_request :
  ?display_name:experiment_entity_name ->
  ?status:trial_component_status ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?parameters:trial_component_parameters ->
  ?parameters_to_remove:list_trial_component_key256 ->
  ?input_artifacts:trial_component_artifacts ->
  ?input_artifacts_to_remove:list_trial_component_key256 ->
  ?output_artifacts:trial_component_artifacts ->
  ?output_artifacts_to_remove:list_trial_component_key256 ->
  trial_component_name:experiment_entity_name ->
  unit ->
  update_trial_component_request

val make_update_trial_response : ?trial_arn:trial_arn -> unit -> update_trial_response

val make_update_trial_request :
  ?display_name:experiment_entity_name ->
  trial_name:experiment_entity_name ->
  unit ->
  update_trial_request

val make_update_training_job_response :
  training_job_arn:training_job_arn -> unit -> update_training_job_response

val make_update_training_job_request :
  ?profiler_config:profiler_config_for_update ->
  ?profiler_rule_configurations:profiler_rule_configurations ->
  ?resource_config:resource_config_for_update ->
  ?remote_debug_config:remote_debug_config_for_update ->
  training_job_name:training_job_name ->
  unit ->
  update_training_job_request

val make_update_space_response : ?space_arn:space_arn -> unit -> update_space_response

val make_update_space_request :
  ?space_settings:space_settings ->
  ?space_display_name:non_empty_string64 ->
  domain_id:domain_id ->
  space_name:space_name ->
  unit ->
  update_space_request

val make_update_project_output : project_arn:project_arn -> unit -> update_project_output

val make_update_template_provider :
  ?cfn_template_provider:cfn_update_template_provider -> unit -> update_template_provider

val make_service_catalog_provisioning_update_details :
  ?provisioning_artifact_id:service_catalog_entity_id ->
  ?provisioning_parameters:provisioning_parameters ->
  unit ->
  service_catalog_provisioning_update_details

val make_update_project_input :
  ?project_description:entity_description ->
  ?service_catalog_provisioning_update_details:service_catalog_provisioning_update_details ->
  ?tags:tag_list ->
  ?template_providers_to_update:update_template_provider_list ->
  project_name:project_entity_name ->
  unit ->
  update_project_input

val make_update_pipeline_version_response :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_version_id:pipeline_version_id ->
  unit ->
  update_pipeline_version_response

val make_update_pipeline_version_request :
  ?pipeline_version_display_name:pipeline_version_name ->
  ?pipeline_version_description:pipeline_version_description ->
  pipeline_arn:pipeline_arn ->
  pipeline_version_id:pipeline_version_id ->
  unit ->
  update_pipeline_version_request

val make_update_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> update_pipeline_execution_response

val make_update_pipeline_execution_request :
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?parallelism_configuration:parallelism_configuration ->
  pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  update_pipeline_execution_request

val make_update_pipeline_response :
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_version_id:pipeline_version_id ->
  unit ->
  update_pipeline_response

val make_update_pipeline_request :
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_definition:pipeline_definition ->
  ?pipeline_definition_s3_location:pipeline_definition_s3_location ->
  ?pipeline_description:pipeline_description ->
  ?role_arn:role_arn ->
  ?parallelism_configuration:parallelism_configuration ->
  pipeline_name:pipeline_name ->
  unit ->
  update_pipeline_request

val make_update_partner_app_response : ?arn:partner_app_arn -> unit -> update_partner_app_response

val make_update_partner_app_request :
  ?maintenance_config:partner_app_maintenance_config ->
  ?tier:non_empty_string64 ->
  ?application_config:partner_app_config ->
  ?enable_iam_session_based_identity:boolean_ ->
  ?enable_auto_minor_version_upgrade:boolean_ ->
  ?app_version:major_minor_version ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  arn:partner_app_arn ->
  unit ->
  update_partner_app_request

val make_update_notebook_instance_lifecycle_config_output : unit -> unit

val make_update_notebook_instance_lifecycle_config_input :
  ?on_create:notebook_instance_lifecycle_config_list ->
  ?on_start:notebook_instance_lifecycle_config_list ->
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  update_notebook_instance_lifecycle_config_input

val make_update_notebook_instance_output : unit -> unit

val make_update_notebook_instance_input :
  ?instance_type:instance_type ->
  ?ip_address_type:ip_address_type ->
  ?platform_identifier:platform_identifier ->
  ?role_arn:role_arn ->
  ?lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?disassociate_lifecycle_config:disassociate_notebook_instance_lifecycle_config ->
  ?volume_size_in_g_b:notebook_instance_volume_size_in_g_b ->
  ?default_code_repository:code_repository_name_or_url ->
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  ?accelerator_types:notebook_instance_accelerator_types ->
  ?disassociate_accelerator_types:disassociate_notebook_instance_accelerator_types ->
  ?disassociate_default_code_repository:disassociate_default_code_repository ->
  ?disassociate_additional_code_repositories:disassociate_additional_code_repositories ->
  ?root_access:root_access ->
  ?instance_metadata_service_configuration:instance_metadata_service_configuration ->
  notebook_instance_name:notebook_instance_name ->
  unit ->
  update_notebook_instance_input

val make_update_monitoring_schedule_response :
  monitoring_schedule_arn:monitoring_schedule_arn -> unit -> update_monitoring_schedule_response

val make_update_monitoring_schedule_request :
  monitoring_schedule_name:monitoring_schedule_name ->
  monitoring_schedule_config:monitoring_schedule_config ->
  unit ->
  update_monitoring_schedule_request

val make_update_monitoring_alert_response :
  ?monitoring_alert_name:monitoring_alert_name ->
  monitoring_schedule_arn:monitoring_schedule_arn ->
  unit ->
  update_monitoring_alert_response

val make_update_monitoring_alert_request :
  monitoring_schedule_name:monitoring_schedule_name ->
  monitoring_alert_name:monitoring_alert_name ->
  datapoints_to_alert:monitoring_datapoints_to_alert ->
  evaluation_period:monitoring_evaluation_period ->
  unit ->
  update_monitoring_alert_request

val make_update_model_package_output :
  model_package_arn:model_package_arn -> unit -> update_model_package_output

val make_update_model_package_input :
  ?model_approval_status:model_approval_status ->
  ?model_package_registration_type:model_package_registration_type ->
  ?approval_description:approval_description ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?customer_metadata_properties_to_remove:customer_metadata_key_list ->
  ?additional_inference_specifications_to_add:additional_inference_specifications ->
  ?inference_specification:inference_specification ->
  ?source_uri:model_package_source_uri ->
  ?model_card:model_package_model_card ->
  ?model_life_cycle:model_life_cycle ->
  ?client_token:client_token ->
  model_package_arn:model_package_arn ->
  unit ->
  update_model_package_input

val make_update_model_card_response :
  model_card_arn:model_card_arn -> unit -> update_model_card_response

val make_update_model_card_request :
  ?content:model_card_content ->
  ?model_card_status:model_card_status ->
  model_card_name:model_card_name_or_arn ->
  unit ->
  update_model_card_request

val make_update_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> update_mlflow_tracking_server_response

val make_update_mlflow_tracking_server_request :
  ?artifact_store_uri:s3_uri ->
  ?tracking_server_size:tracking_server_size ->
  ?automatic_model_registration:boolean_ ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?s3_bucket_owner_account_id:account_id ->
  ?s3_bucket_owner_verification:boolean_ ->
  tracking_server_name:tracking_server_name ->
  unit ->
  update_mlflow_tracking_server_request

val make_update_mlflow_app_response : ?arn:mlflow_app_arn -> unit -> update_mlflow_app_response

val make_update_mlflow_app_request :
  ?name:mlflow_app_name ->
  ?artifact_store_uri:s3_uri ->
  ?model_registration_mode:model_registration_mode ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?default_domain_id_list:default_domain_id_list ->
  ?account_default_status:account_default_status ->
  arn:mlflow_app_arn ->
  unit ->
  update_mlflow_app_request

val make_update_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> update_inference_experiment_response

val make_update_inference_experiment_request :
  ?schedule:inference_experiment_schedule ->
  ?description:inference_experiment_description ->
  ?model_variants:model_variant_config_list ->
  ?data_storage_config:inference_experiment_data_storage_config ->
  ?shadow_mode_config:shadow_mode_config ->
  name:inference_experiment_name ->
  unit ->
  update_inference_experiment_request

val make_update_inference_component_runtime_config_output :
  inference_component_arn:inference_component_arn ->
  unit ->
  update_inference_component_runtime_config_output

val make_update_inference_component_runtime_config_input :
  inference_component_name:inference_component_name ->
  desired_runtime_config:inference_component_runtime_config ->
  unit ->
  update_inference_component_runtime_config_input

val make_update_inference_component_output :
  inference_component_arn:inference_component_arn -> unit -> update_inference_component_output

val make_update_inference_component_input :
  ?specification:inference_component_specification ->
  ?specifications:inference_component_specification_list ->
  ?runtime_config:inference_component_runtime_config ->
  ?deployment_config:inference_component_deployment_config ->
  inference_component_name:inference_component_name ->
  unit ->
  update_inference_component_input

val make_update_image_version_response :
  ?image_version_arn:image_version_arn -> unit -> update_image_version_response

val make_update_image_version_request :
  ?alias:sage_maker_image_version_alias ->
  ?version:image_version_number ->
  ?aliases_to_add:sage_maker_image_version_aliases ->
  ?aliases_to_delete:sage_maker_image_version_aliases ->
  ?vendor_guidance:vendor_guidance ->
  ?job_type:job_type ->
  ?ml_framework:ml_framework ->
  ?programming_lang:programming_lang ->
  ?processor:processor ->
  ?horovod:horovod ->
  ?release_notes:release_notes ->
  image_name:image_name ->
  unit ->
  update_image_version_request

val make_update_image_response : ?image_arn:image_arn -> unit -> update_image_response

val make_update_image_request :
  ?delete_properties:image_delete_property_list ->
  ?description:image_description ->
  ?display_name:image_display_name ->
  ?role_arn:role_arn ->
  image_name:image_name ->
  unit ->
  update_image_request

val make_update_hub_content_reference_response :
  hub_arn:hub_arn ->
  hub_content_arn:hub_content_arn ->
  unit ->
  update_hub_content_reference_response

val make_update_hub_content_reference_request :
  ?min_version:hub_content_version ->
  hub_name:hub_name_or_arn ->
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  unit ->
  update_hub_content_reference_request

val make_update_hub_content_response :
  hub_arn:hub_arn -> hub_content_arn:hub_content_arn -> unit -> update_hub_content_response

val make_update_hub_content_request :
  ?hub_content_display_name:hub_content_display_name ->
  ?hub_content_description:hub_content_description ->
  ?hub_content_markdown:hub_content_markdown ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?support_status:hub_content_support_status ->
  hub_name:hub_name_or_arn ->
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  hub_content_version:hub_content_version ->
  unit ->
  update_hub_content_request

val make_update_hub_response : hub_arn:hub_arn -> unit -> update_hub_response

val make_update_hub_request :
  ?hub_description:hub_description ->
  ?hub_display_name:hub_display_name ->
  ?hub_search_keywords:hub_search_keyword_list ->
  hub_name:hub_name_or_arn ->
  unit ->
  update_hub_request

val make_update_feature_metadata_request :
  ?description:feature_description ->
  ?parameter_additions:feature_parameter_additions ->
  ?parameter_removals:feature_parameter_removals ->
  feature_group_name:feature_group_name_or_arn ->
  feature_name:feature_name ->
  unit ->
  update_feature_metadata_request

val make_update_feature_group_response :
  feature_group_arn:feature_group_arn -> unit -> update_feature_group_response

val make_throughput_config_update :
  ?throughput_mode:throughput_mode ->
  ?provisioned_read_capacity_units:capacity_unit ->
  ?provisioned_write_capacity_units:capacity_unit ->
  unit ->
  throughput_config_update

val make_update_feature_group_request :
  ?feature_additions:feature_additions ->
  ?online_store_config:online_store_config_update ->
  ?throughput_config:throughput_config_update ->
  feature_group_name:feature_group_name_or_arn ->
  unit ->
  update_feature_group_request

val make_update_experiment_response :
  ?experiment_arn:experiment_arn -> unit -> update_experiment_response

val make_update_experiment_request :
  ?display_name:experiment_entity_name ->
  ?description:experiment_description ->
  experiment_name:experiment_entity_name ->
  unit ->
  update_experiment_request

val make_update_endpoint_weights_and_capacities_output :
  endpoint_arn:endpoint_arn -> unit -> update_endpoint_weights_and_capacities_output

val make_update_endpoint_weights_and_capacities_input :
  endpoint_name:endpoint_name ->
  desired_weights_and_capacities:desired_weight_and_capacity_list ->
  unit ->
  update_endpoint_weights_and_capacities_input

val make_update_endpoint_output : endpoint_arn:endpoint_arn -> unit -> update_endpoint_output
val make_variant_property : variant_property_type:variant_property_type -> unit -> variant_property

val make_update_endpoint_input :
  ?retain_all_variant_properties:boolean_ ->
  ?exclude_retained_variant_properties:variant_property_list ->
  ?deployment_config:deployment_config ->
  ?retain_deployment_config:boolean_ ->
  endpoint_name:endpoint_name ->
  endpoint_config_name:endpoint_config_name ->
  unit ->
  update_endpoint_input

val make_update_domain_response : ?domain_arn:domain_arn -> unit -> update_domain_response

val make_update_domain_request :
  ?default_user_settings:user_settings ->
  ?domain_settings_for_update:domain_settings_for_update ->
  ?app_security_group_management:app_security_group_management ->
  ?default_space_settings:default_space_settings ->
  ?subnet_ids:subnets ->
  ?app_network_access_type:app_network_access_type ->
  ?tag_propagation:tag_propagation ->
  ?home_efs_file_system_creation:home_efs_file_system_creation ->
  ?vpc_id:vpc_id ->
  domain_id:domain_id ->
  unit ->
  update_domain_request

val make_update_devices_request :
  device_fleet_name:entity_name -> devices:devices -> unit -> update_devices_request

val make_update_device_fleet_request :
  ?role_arn:role_arn ->
  ?description:device_fleet_description ->
  ?enable_iot_role_alias:enable_iot_role_alias ->
  device_fleet_name:entity_name ->
  output_config:edge_output_config ->
  unit ->
  update_device_fleet_request

val make_update_context_response : ?context_arn:context_arn -> unit -> update_context_response

val make_update_context_request :
  ?description:experiment_description ->
  ?properties:lineage_entity_parameters ->
  ?properties_to_remove:list_lineage_entity_parameter_key ->
  context_name:context_name ->
  unit ->
  update_context_request

val make_update_compute_quota_response :
  compute_quota_arn:compute_quota_arn ->
  compute_quota_version:integer ->
  unit ->
  update_compute_quota_response

val make_update_compute_quota_request :
  ?compute_quota_config:compute_quota_config ->
  ?compute_quota_target:compute_quota_target ->
  ?activation_state:activation_state ->
  ?description:entity_description ->
  compute_quota_id:compute_quota_id ->
  target_version:integer ->
  unit ->
  update_compute_quota_request

val make_update_code_repository_output :
  code_repository_arn:code_repository_arn -> unit -> update_code_repository_output

val make_update_code_repository_input :
  ?git_config:git_config_for_update ->
  code_repository_name:entity_name ->
  unit ->
  update_code_repository_input

val make_update_cluster_software_response :
  cluster_arn:cluster_arn -> unit -> update_cluster_software_response

val make_update_cluster_software_instance_group_specification :
  ?image_release_version:image_release_version ->
  instance_group_name:cluster_instance_group_name ->
  unit ->
  update_cluster_software_instance_group_specification

val make_update_cluster_software_request :
  ?instance_groups:update_cluster_software_instance_groups ->
  ?deployment_config:deployment_configuration ->
  ?image_id:image_id ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  update_cluster_software_request

val make_update_cluster_scheduler_config_response :
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  cluster_scheduler_config_version:integer ->
  unit ->
  update_cluster_scheduler_config_response

val make_update_cluster_scheduler_config_request :
  ?scheduler_config:scheduler_config ->
  ?description:entity_description ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  target_version:integer ->
  unit ->
  update_cluster_scheduler_config_request

val make_update_cluster_response : cluster_arn:cluster_arn -> unit -> update_cluster_response

val make_update_cluster_request :
  ?instance_groups:cluster_instance_group_specifications ->
  ?restricted_instance_groups:cluster_restricted_instance_group_specifications ->
  ?restricted_instance_groups_config:cluster_restricted_instance_groups_config ->
  ?tiered_storage_config:cluster_tiered_storage_config ->
  ?node_recovery:cluster_node_recovery ->
  ?instance_groups_to_delete:cluster_instance_groups_to_delete ->
  ?node_provisioning_mode:cluster_node_provisioning_mode ->
  ?cluster_role:role_arn ->
  ?auto_scaling:cluster_auto_scaling_config ->
  ?orchestrator:cluster_orchestrator ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  update_cluster_request

val make_update_artifact_response : ?artifact_arn:artifact_arn -> unit -> update_artifact_response

val make_update_artifact_request :
  ?artifact_name:experiment_entity_name ->
  ?properties:artifact_properties ->
  ?properties_to_remove:list_lineage_entity_parameter_key ->
  artifact_arn:artifact_arn ->
  unit ->
  update_artifact_request

val make_update_app_image_config_response :
  ?app_image_config_arn:app_image_config_arn -> unit -> update_app_image_config_response

val make_update_app_image_config_request :
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?code_editor_app_image_config:code_editor_app_image_config ->
  app_image_config_name:app_image_config_name ->
  unit ->
  update_app_image_config_request

val make_update_action_response : ?action_arn:action_arn -> unit -> update_action_response

val make_update_action_request :
  ?description:experiment_description ->
  ?status:action_status ->
  ?properties:lineage_entity_parameters ->
  ?properties_to_remove:list_lineage_entity_parameter_key ->
  action_name:experiment_entity_name ->
  unit ->
  update_action_request

val make_stop_transform_job_request :
  transform_job_name:transform_job_name -> unit -> stop_transform_job_request

val make_stop_training_job_request :
  training_job_name:training_job_name -> unit -> stop_training_job_request

val make_stop_processing_job_request :
  processing_job_name:processing_job_name -> unit -> stop_processing_job_request

val make_stop_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> stop_pipeline_execution_response

val make_stop_pipeline_execution_request :
  pipeline_execution_arn:pipeline_execution_arn ->
  client_request_token:idempotency_token ->
  unit ->
  stop_pipeline_execution_request

val make_stop_optimization_job_request :
  optimization_job_name:entity_name -> unit -> stop_optimization_job_request

val make_stop_notebook_instance_input :
  notebook_instance_name:notebook_instance_name -> unit -> stop_notebook_instance_input

val make_stop_monitoring_schedule_request :
  monitoring_schedule_name:monitoring_schedule_name -> unit -> stop_monitoring_schedule_request

val make_stop_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> stop_mlflow_tracking_server_response

val make_stop_mlflow_tracking_server_request :
  tracking_server_name:tracking_server_name -> unit -> stop_mlflow_tracking_server_request

val make_stop_labeling_job_request :
  labeling_job_name:labeling_job_name -> unit -> stop_labeling_job_request

val make_stop_job_response : unit -> unit

val make_stop_job_request :
  job_name:job_name -> job_category:job_category -> unit -> stop_job_request

val make_stop_inference_recommendations_job_request :
  job_name:recommendation_job_name -> unit -> stop_inference_recommendations_job_request

val make_stop_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> stop_inference_experiment_response

val make_stop_inference_experiment_request :
  ?desired_model_variants:model_variant_config_list ->
  ?desired_state:inference_experiment_stop_desired_state ->
  ?reason:inference_experiment_status_reason ->
  name:inference_experiment_name ->
  model_variant_actions:model_variant_action_map ->
  unit ->
  stop_inference_experiment_request

val make_stop_hyper_parameter_tuning_job_request :
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  stop_hyper_parameter_tuning_job_request

val make_stop_edge_packaging_job_request :
  edge_packaging_job_name:entity_name -> unit -> stop_edge_packaging_job_request

val make_stop_edge_deployment_stage_request :
  edge_deployment_plan_name:entity_name ->
  stage_name:entity_name ->
  unit ->
  stop_edge_deployment_stage_request

val make_stop_compilation_job_request :
  compilation_job_name:entity_name -> unit -> stop_compilation_job_request

val make_stop_auto_ml_job_request :
  auto_ml_job_name:auto_ml_job_name -> unit -> stop_auto_ml_job_request

val make_stop_ai_recommendation_job_response :
  ai_recommendation_job_arn:ai_recommendation_job_arn -> unit -> stop_ai_recommendation_job_response

val make_stop_ai_recommendation_job_request :
  ai_recommendation_job_name:ai_entity_name -> unit -> stop_ai_recommendation_job_request

val make_stop_ai_benchmark_job_response :
  ai_benchmark_job_arn:ai_benchmark_job_arn -> unit -> stop_ai_benchmark_job_response

val make_stop_ai_benchmark_job_request :
  ai_benchmark_job_name:ai_entity_name -> unit -> stop_ai_benchmark_job_request

val make_start_session_response :
  ?session_id:session_id ->
  ?stream_url:stream_url ->
  ?token_value:token_value ->
  unit ->
  start_session_response

val make_start_session_request :
  resource_identifier:resource_identifier -> unit -> start_session_request

val make_start_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> start_pipeline_execution_response

val make_start_pipeline_execution_request :
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_parameters:parameter_list ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?parallelism_configuration:parallelism_configuration ->
  ?selective_execution_config:selective_execution_config ->
  ?pipeline_version_id:pipeline_version_id ->
  ?mlflow_experiment_name:mlflow_experiment_entity_name ->
  pipeline_name:pipeline_name_or_arn ->
  client_request_token:idempotency_token ->
  unit ->
  start_pipeline_execution_request

val make_start_notebook_instance_input :
  notebook_instance_name:notebook_instance_name -> unit -> start_notebook_instance_input

val make_start_monitoring_schedule_request :
  monitoring_schedule_name:monitoring_schedule_name -> unit -> start_monitoring_schedule_request

val make_start_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> start_mlflow_tracking_server_response

val make_start_mlflow_tracking_server_request :
  tracking_server_name:tracking_server_name -> unit -> start_mlflow_tracking_server_request

val make_start_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> start_inference_experiment_response

val make_start_inference_experiment_request :
  name:inference_experiment_name -> unit -> start_inference_experiment_request

val make_start_edge_deployment_stage_request :
  edge_deployment_plan_name:entity_name ->
  stage_name:entity_name ->
  unit ->
  start_edge_deployment_stage_request

val make_start_cluster_health_check_response :
  cluster_arn:cluster_arn -> unit -> start_cluster_health_check_response

val make_start_cluster_health_check_request :
  cluster_name:cluster_name_or_arn ->
  deep_health_check_configurations:deep_health_check_configurations ->
  unit ->
  start_cluster_health_check_request

val make_send_pipeline_execution_step_success_response :
  ?pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  send_pipeline_execution_step_success_response

val make_send_pipeline_execution_step_success_request :
  ?output_parameters:output_parameter_list ->
  ?client_request_token:idempotency_token ->
  callback_token:callback_token ->
  unit ->
  send_pipeline_execution_step_success_request

val make_send_pipeline_execution_step_failure_response :
  ?pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  send_pipeline_execution_step_failure_response

val make_send_pipeline_execution_step_failure_request :
  ?failure_reason:string256 ->
  ?client_request_token:idempotency_token ->
  callback_token:callback_token ->
  unit ->
  send_pipeline_execution_step_failure_request

val make_training_plan_extension_offering :
  ?availability_zone:string256 ->
  ?start_date:timestamp ->
  ?end_date:timestamp ->
  ?duration_hours:training_plan_extension_duration_hours ->
  ?upfront_fee:string256 ->
  ?currency_code:currency_code ->
  training_plan_extension_offering_id:training_plan_extension_offering_id ->
  unit ->
  training_plan_extension_offering

val make_training_plan_offering :
  ?requested_start_time_after:timestamp ->
  ?requested_end_time_before:timestamp ->
  ?duration_hours:training_plan_duration_hours ->
  ?duration_minutes:training_plan_duration_minutes ->
  ?upfront_fee:string256 ->
  ?currency_code:currency_code ->
  ?reserved_capacity_offerings:reserved_capacity_offerings ->
  training_plan_offering_id:training_plan_offering_id ->
  target_resources:sage_maker_resource_names ->
  unit ->
  training_plan_offering

val make_search_training_plan_offerings_response :
  ?training_plan_extension_offerings:training_plan_extension_offerings ->
  training_plan_offerings:training_plan_offerings ->
  unit ->
  search_training_plan_offerings_response

val make_search_training_plan_offerings_request :
  ?instance_type:reserved_capacity_instance_type ->
  ?instance_count:reserved_capacity_instance_count ->
  ?ultra_server_type:ultra_server_type ->
  ?ultra_server_count:ultra_server_count ->
  ?start_time_after:timestamp ->
  ?end_time_before:timestamp ->
  ?duration_hours:training_plan_duration_hours_input ->
  ?target_resources:sage_maker_resource_names ->
  ?training_plan_arn:string_ ->
  unit ->
  search_training_plan_offerings_request

val make_total_hits : ?value:long -> ?relation:relation -> unit -> total_hits

val make_training_job :
  ?training_job_name:training_job_name ->
  ?training_job_arn:training_job_arn ->
  ?tuning_job_arn:hyper_parameter_tuning_job_arn ->
  ?labeling_job_arn:labeling_job_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?model_artifacts:model_artifacts ->
  ?training_job_status:training_job_status ->
  ?secondary_status:secondary_status ->
  ?failure_reason:failure_reason ->
  ?hyper_parameters:hyper_parameters ->
  ?algorithm_specification:algorithm_specification ->
  ?role_arn:role_arn ->
  ?input_data_config:input_data_config ->
  ?output_data_config:output_data_config ->
  ?resource_config:resource_config ->
  ?warm_pool_status:warm_pool_status ->
  ?vpc_config:vpc_config ->
  ?stopping_condition:stopping_condition ->
  ?creation_time:timestamp ->
  ?training_start_time:timestamp ->
  ?training_end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?secondary_status_transitions:secondary_status_transitions ->
  ?final_metric_data_list:final_metric_data_list ->
  ?enable_network_isolation:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_managed_spot_training:boolean_ ->
  ?checkpoint_config:checkpoint_config ->
  ?training_time_in_seconds:training_time_in_seconds ->
  ?billable_time_in_seconds:billable_time_in_seconds ->
  ?debug_hook_config:debug_hook_config ->
  ?experiment_config:experiment_config ->
  ?debug_rule_configurations:debug_rule_configurations ->
  ?tensor_board_output_config:tensor_board_output_config ->
  ?debug_rule_evaluation_statuses:debug_rule_evaluation_statuses ->
  ?output_model_package_arn:model_package_arn ->
  ?model_package_config:model_package_config ->
  ?profiler_config:profiler_config ->
  ?environment:training_environment_map ->
  ?retry_strategy:retry_strategy ->
  ?tags:tag_list ->
  unit ->
  training_job

val make_trial_component_source_detail :
  ?source_arn:trial_component_source_arn ->
  ?training_job:training_job ->
  ?processing_job:processing_job ->
  ?transform_job:transform_job ->
  unit ->
  trial_component_source_detail

val make_trial_component :
  ?trial_component_name:experiment_entity_name ->
  ?display_name:experiment_entity_name ->
  ?trial_component_arn:trial_component_arn ->
  ?source:trial_component_source ->
  ?status:trial_component_status ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?parameters:trial_component_parameters ->
  ?input_artifacts:trial_component_artifacts ->
  ?output_artifacts:trial_component_artifacts ->
  ?metrics:trial_component_metric_summaries ->
  ?metadata_properties:metadata_properties ->
  ?source_detail:trial_component_source_detail ->
  ?lineage_group_arn:lineage_group_arn ->
  ?tags:tag_list ->
  ?parents:parents ->
  ?run_name:experiment_entity_name ->
  unit ->
  trial_component

val make_trial_component_simple_summary :
  ?trial_component_name:experiment_entity_name ->
  ?trial_component_arn:trial_component_arn ->
  ?trial_component_source:trial_component_source ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  unit ->
  trial_component_simple_summary

val make_trial :
  ?trial_name:experiment_entity_name ->
  ?trial_arn:trial_arn ->
  ?display_name:experiment_entity_name ->
  ?experiment_name:experiment_entity_name ->
  ?source:trial_source ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?last_modified_by:user_context ->
  ?metadata_properties:metadata_properties ->
  ?tags:tag_list ->
  ?trial_component_summaries:trial_component_simple_summaries ->
  unit ->
  trial

val make_search_record :
  ?training_job:training_job ->
  ?experiment:experiment ->
  ?trial:trial ->
  ?trial_component:trial_component ->
  ?endpoint:endpoint ->
  ?model_package:model_package ->
  ?model_package_group:model_package_group ->
  ?pipeline:pipeline ->
  ?pipeline_execution:pipeline_execution ->
  ?pipeline_version:pipeline_version ->
  ?feature_group:feature_group ->
  ?feature_metadata:feature_metadata ->
  ?project:project ->
  ?hyper_parameter_tuning_job:hyper_parameter_tuning_job_search_entity ->
  ?model_card:model_card ->
  ?model:model_dashboard_model ->
  ?job:job ->
  unit ->
  search_record

val make_search_response :
  ?results:search_results_list ->
  ?next_token:next_token ->
  ?total_hits:total_hits ->
  unit ->
  search_response

val make_visibility_conditions :
  ?key:visibility_conditions_key ->
  ?value:visibility_conditions_value ->
  unit ->
  visibility_conditions

val make_search_expression :
  ?filters:filter_list ->
  ?nested_filters:nested_filters_list ->
  ?sub_expressions:search_expression_list ->
  ?operator:boolean_operator ->
  unit ->
  search_expression

val make_search_request :
  ?search_expression:search_expression ->
  ?sort_by:resource_property_name ->
  ?sort_order:search_sort_order ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?cross_account_filter_option:cross_account_filter_option ->
  ?visibility_conditions:visibility_conditions_list ->
  resource:resource_type ->
  unit ->
  search_request
