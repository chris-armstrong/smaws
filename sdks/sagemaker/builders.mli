open Types

val make_cognito_member_definition :
  client_id:client_id ->
  user_group:cognito_user_group ->
  user_pool:cognito_user_pool ->
  unit ->
  cognito_member_definition

val make_oidc_member_definition : ?groups:groups -> unit -> oidc_member_definition

val make_member_definition :
  ?oidc_member_definition:oidc_member_definition ->
  ?cognito_member_definition:cognito_member_definition ->
  unit ->
  member_definition

val make_notification_configuration :
  ?notification_topic_arn:notification_topic_arn -> unit -> notification_configuration

val make_iam_policy_constraints :
  ?vpc_source_ip:enabled_or_disabled ->
  ?source_ip:enabled_or_disabled ->
  unit ->
  iam_policy_constraints

val make_s3_presign : ?iam_policy_constraints:iam_policy_constraints -> unit -> s3_presign
val make_worker_access_configuration : ?s3_presign:s3_presign -> unit -> worker_access_configuration

val make_workteam :
  ?worker_access_configuration:worker_access_configuration ->
  ?notification_configuration:notification_configuration ->
  ?last_updated_date:timestamp ->
  ?create_date:timestamp ->
  ?sub_domain:string_ ->
  ?product_listing_ids:product_listings ->
  ?workforce_arn:workforce_arn ->
  description:string200 ->
  workteam_arn:workteam_arn ->
  member_definitions:member_definitions ->
  workteam_name:workteam_name ->
  unit ->
  workteam

val make_workspace_settings :
  ?s3_kms_key_id:kms_key_id -> ?s3_artifact_path:s3_uri -> unit -> workspace_settings

val make_source_ip_config : cidrs:cidrs -> unit -> source_ip_config

val make_cognito_config :
  client_id:client_id -> user_pool:cognito_user_pool -> unit -> cognito_config

val make_oidc_config_for_response :
  ?authentication_request_extra_params:authentication_request_extra_params ->
  ?scope:scope ->
  ?jwks_uri:oidc_endpoint ->
  ?logout_endpoint:oidc_endpoint ->
  ?user_info_endpoint:oidc_endpoint ->
  ?token_endpoint:oidc_endpoint ->
  ?authorization_endpoint:oidc_endpoint ->
  ?issuer:oidc_endpoint ->
  ?client_id:client_id ->
  unit ->
  oidc_config_for_response

val make_workforce_vpc_config_response :
  ?vpc_endpoint_id:workforce_vpc_endpoint_id ->
  subnets:workforce_subnets ->
  security_group_ids:workforce_security_group_ids ->
  vpc_id:workforce_vpc_id ->
  unit ->
  workforce_vpc_config_response

val make_workforce :
  ?ip_address_type:workforce_ip_address_type ->
  ?failure_reason:workforce_failure_reason ->
  ?status:workforce_status ->
  ?workforce_vpc_config:workforce_vpc_config_response ->
  ?create_date:timestamp ->
  ?oidc_config:oidc_config_for_response ->
  ?cognito_config:cognito_config ->
  ?sub_domain:string_ ->
  ?source_ip_config:source_ip_config ->
  ?last_updated_date:timestamp ->
  workforce_arn:workforce_arn ->
  workforce_name:workforce_name ->
  unit ->
  workforce

val make_workforce_vpc_config_request :
  ?subnets:workforce_subnets ->
  ?security_group_ids:workforce_security_group_ids ->
  ?vpc_id:workforce_vpc_id ->
  unit ->
  workforce_vpc_config_request

val make_warm_pool_status :
  ?reused_by_job:training_job_name ->
  ?resource_retained_billable_time_in_seconds:resource_retained_billable_time_in_seconds ->
  status:warm_pool_resource_status ->
  unit ->
  warm_pool_status

val make_vpc_config :
  subnets:subnets -> security_group_ids:vpc_security_group_ids -> unit -> vpc_config

val make_visibility_conditions :
  ?value:visibility_conditions_value ->
  ?key:visibility_conditions_key ->
  unit ->
  visibility_conditions

val make_vertex :
  ?lineage_type:lineage_type -> ?type_:string40 -> ?arn:association_entity_arn -> unit -> vertex

val make_vector_config : dimension:dimension -> unit -> vector_config
val make_variant_property : variant_property_type:variant_property_type -> unit -> variant_property

val make_sharing_settings :
  ?s3_kms_key_id:kms_key_id ->
  ?s3_output_path:s3_uri ->
  ?notebook_output_option:notebook_output_option ->
  unit ->
  sharing_settings

val make_resource_spec :
  ?training_plan_arn:studio_resource_spec_training_plan_arn ->
  ?lifecycle_config_arn:studio_lifecycle_config_arn ->
  ?instance_type:app_instance_type ->
  ?sage_maker_image_version_alias:image_version_alias ->
  ?sage_maker_image_version_arn:image_version_arn ->
  ?sage_maker_image_arn:image_arn ->
  unit ->
  resource_spec

val make_code_repository : repository_url:repository_url -> unit -> code_repository

val make_jupyter_server_app_settings :
  ?code_repositories:code_repositories ->
  ?lifecycle_config_arns:lifecycle_config_arns ->
  ?default_resource_spec:resource_spec ->
  unit ->
  jupyter_server_app_settings

val make_custom_image :
  ?image_version_number:image_version_number ->
  app_image_config_name:app_image_config_name ->
  image_name:image_name ->
  unit ->
  custom_image

val make_kernel_gateway_app_settings :
  ?lifecycle_config_arns:lifecycle_config_arns ->
  ?custom_images:custom_images ->
  ?default_resource_spec:resource_spec ->
  unit ->
  kernel_gateway_app_settings

val make_tensor_board_app_settings :
  ?default_resource_spec:resource_spec -> unit -> tensor_board_app_settings

val make_r_studio_server_pro_app_settings :
  ?user_group:r_studio_server_pro_user_group ->
  ?access_status:r_studio_server_pro_access_status ->
  unit ->
  r_studio_server_pro_app_settings

val make_r_session_app_settings :
  ?custom_images:custom_images ->
  ?default_resource_spec:resource_spec ->
  unit ->
  r_session_app_settings

val make_time_series_forecasting_settings :
  ?amazon_forecast_role_arn:role_arn ->
  ?status:feature_status ->
  unit ->
  time_series_forecasting_settings

val make_model_register_settings :
  ?cross_account_model_register_role_arn:role_arn ->
  ?status:feature_status ->
  unit ->
  model_register_settings

val make_identity_provider_o_auth_setting :
  ?secret_arn:secret_arn ->
  ?status:feature_status ->
  ?data_source_name:data_source_name ->
  unit ->
  identity_provider_o_auth_setting

val make_direct_deploy_settings : ?status:feature_status -> unit -> direct_deploy_settings
val make_kendra_settings : ?status:feature_status -> unit -> kendra_settings

val make_generative_ai_settings :
  ?amazon_bedrock_role_arn:role_arn -> unit -> generative_ai_settings

val make_emr_serverless_settings :
  ?status:feature_status -> ?execution_role_arn:role_arn -> unit -> emr_serverless_settings

val make_canvas_app_settings :
  ?emr_serverless_settings:emr_serverless_settings ->
  ?generative_ai_settings:generative_ai_settings ->
  ?kendra_settings:kendra_settings ->
  ?direct_deploy_settings:direct_deploy_settings ->
  ?identity_provider_o_auth_settings:identity_provider_o_auth_settings ->
  ?workspace_settings:workspace_settings ->
  ?model_register_settings:model_register_settings ->
  ?time_series_forecasting_settings:time_series_forecasting_settings ->
  unit ->
  canvas_app_settings

val make_idle_settings :
  ?max_idle_timeout_in_minutes:idle_timeout_in_minutes ->
  ?min_idle_timeout_in_minutes:idle_timeout_in_minutes ->
  ?idle_timeout_in_minutes:idle_timeout_in_minutes ->
  ?lifecycle_management:lifecycle_management ->
  unit ->
  idle_settings

val make_app_lifecycle_management : ?idle_settings:idle_settings -> unit -> app_lifecycle_management

val make_code_editor_app_settings :
  ?built_in_lifecycle_config_arn:studio_lifecycle_config_arn ->
  ?app_lifecycle_management:app_lifecycle_management ->
  ?lifecycle_config_arns:lifecycle_config_arns ->
  ?custom_images:custom_images ->
  ?default_resource_spec:resource_spec ->
  unit ->
  code_editor_app_settings

val make_emr_settings :
  ?execution_role_arns:execution_role_arns ->
  ?assumable_role_arns:assumable_role_arns ->
  unit ->
  emr_settings

val make_jupyter_lab_app_settings :
  ?built_in_lifecycle_config_arn:studio_lifecycle_config_arn ->
  ?emr_settings:emr_settings ->
  ?app_lifecycle_management:app_lifecycle_management ->
  ?code_repositories:code_repositories ->
  ?lifecycle_config_arns:lifecycle_config_arns ->
  ?custom_images:custom_images ->
  ?default_resource_spec:resource_spec ->
  unit ->
  jupyter_lab_app_settings

val make_default_ebs_storage_settings :
  maximum_ebs_volume_size_in_gb:space_ebs_volume_size_in_gb ->
  default_ebs_volume_size_in_gb:space_ebs_volume_size_in_gb ->
  unit ->
  default_ebs_storage_settings

val make_default_space_storage_settings :
  ?default_ebs_storage_settings:default_ebs_storage_settings ->
  unit ->
  default_space_storage_settings

val make_custom_posix_user_config : gid:gid -> uid:uid -> unit -> custom_posix_user_config

val make_efs_file_system_config :
  ?file_system_path:file_system_path ->
  file_system_id:file_system_id ->
  unit ->
  efs_file_system_config

val make_f_sx_lustre_file_system_config :
  ?file_system_path:file_system_path ->
  file_system_id:file_system_id ->
  unit ->
  f_sx_lustre_file_system_config

val make_s3_file_system_config :
  ?mount_path:string1024 -> s3_uri:s3_schema_uri -> unit -> s3_file_system_config

val make_hidden_sage_maker_image :
  ?version_aliases:version_aliases_list ->
  ?sage_maker_image_name:sage_maker_image_name ->
  unit ->
  hidden_sage_maker_image

val make_studio_web_portal_settings :
  ?execution_role_session_name_mode:execution_role_session_name_mode ->
  ?hidden_sage_maker_image_version_aliases:hidden_sage_maker_image_version_aliases_list ->
  ?hidden_instance_types:hidden_instance_types_list ->
  ?hidden_app_types:hidden_app_types_list ->
  ?hidden_ml_tools:hidden_ml_tools_list ->
  unit ->
  studio_web_portal_settings

val make_user_settings :
  ?auto_mount_home_ef_s:auto_mount_home_ef_s ->
  ?studio_web_portal_settings:studio_web_portal_settings ->
  ?custom_file_system_configs:custom_file_system_configs ->
  ?custom_posix_user_config:custom_posix_user_config ->
  ?studio_web_portal:studio_web_portal ->
  ?default_landing_uri:landing_uri ->
  ?space_storage_settings:default_space_storage_settings ->
  ?jupyter_lab_app_settings:jupyter_lab_app_settings ->
  ?code_editor_app_settings:code_editor_app_settings ->
  ?canvas_app_settings:canvas_app_settings ->
  ?r_session_app_settings:r_session_app_settings ->
  ?r_studio_server_pro_app_settings:r_studio_server_pro_app_settings ->
  ?tensor_board_app_settings:tensor_board_app_settings ->
  ?kernel_gateway_app_settings:kernel_gateway_app_settings ->
  ?jupyter_server_app_settings:jupyter_server_app_settings ->
  ?sharing_settings:sharing_settings ->
  ?security_groups:security_group_ids ->
  ?execution_role:role_arn ->
  unit ->
  user_settings

val make_user_profile_details :
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?status:user_profile_status ->
  ?user_profile_name:user_profile_name ->
  ?domain_id:domain_id ->
  unit ->
  user_profile_details

val make_iam_identity :
  ?source_identity:string_ -> ?principal_id:string_ -> ?arn:string_ -> unit -> iam_identity

val make_user_context :
  ?iam_identity:iam_identity ->
  ?domain_id:string_ ->
  ?user_profile_name:string_ ->
  ?user_profile_arn:string_ ->
  unit ->
  user_context

val make_update_workteam_response : workteam:workteam -> unit -> update_workteam_response

val make_update_workteam_request :
  ?worker_access_configuration:worker_access_configuration ->
  ?notification_configuration:notification_configuration ->
  ?description:string200 ->
  ?member_definitions:member_definitions ->
  workteam_name:workteam_name ->
  unit ->
  update_workteam_request

val make_update_workforce_response : workforce:workforce -> unit -> update_workforce_response

val make_oidc_config :
  ?authentication_request_extra_params:authentication_request_extra_params ->
  ?scope:scope ->
  jwks_uri:oidc_endpoint ->
  logout_endpoint:oidc_endpoint ->
  user_info_endpoint:oidc_endpoint ->
  token_endpoint:oidc_endpoint ->
  authorization_endpoint:oidc_endpoint ->
  issuer:oidc_endpoint ->
  client_secret:client_secret ->
  client_id:client_id ->
  unit ->
  oidc_config

val make_update_workforce_request :
  ?ip_address_type:workforce_ip_address_type ->
  ?workforce_vpc_config:workforce_vpc_config_request ->
  ?oidc_config:oidc_config ->
  ?source_ip_config:source_ip_config ->
  workforce_name:workforce_name ->
  unit ->
  update_workforce_request

val make_update_user_profile_response :
  ?user_profile_arn:user_profile_arn -> unit -> update_user_profile_response

val make_update_user_profile_request :
  ?user_settings:user_settings ->
  user_profile_name:user_profile_name ->
  domain_id:domain_id ->
  unit ->
  update_user_profile_request

val make_update_trial_response : ?trial_arn:trial_arn -> unit -> update_trial_response

val make_update_trial_request :
  ?display_name:experiment_entity_name ->
  trial_name:experiment_entity_name ->
  unit ->
  update_trial_request

val make_update_trial_component_response :
  ?trial_component_arn:trial_component_arn -> unit -> update_trial_component_response

val make_trial_component_status :
  ?message:trial_component_status_message ->
  ?primary_status:trial_component_primary_status ->
  unit ->
  trial_component_status

val make_trial_component_artifact :
  ?media_type:media_type -> value:trial_component_artifact_value -> unit -> trial_component_artifact

val make_update_trial_component_request :
  ?output_artifacts_to_remove:list_trial_component_key256 ->
  ?output_artifacts:trial_component_artifacts ->
  ?input_artifacts_to_remove:list_trial_component_key256 ->
  ?input_artifacts:trial_component_artifacts ->
  ?parameters_to_remove:list_trial_component_key256 ->
  ?parameters:trial_component_parameters ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:trial_component_status ->
  ?display_name:experiment_entity_name ->
  trial_component_name:experiment_entity_name ->
  unit ->
  update_trial_component_request

val make_update_training_job_response :
  training_job_arn:training_job_arn -> unit -> update_training_job_response

val make_profiler_config_for_update :
  ?disable_profiler:disable_profiler ->
  ?profiling_parameters:profiling_parameters ->
  ?profiling_interval_in_milliseconds:profiling_interval_in_milliseconds ->
  ?s3_output_path:s3_uri ->
  unit ->
  profiler_config_for_update

val make_profiler_rule_configuration :
  ?rule_parameters:rule_parameters ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?instance_type:processing_instance_type ->
  ?s3_output_path:s3_uri ->
  ?local_path:directory_path ->
  rule_evaluator_image:algorithm_image ->
  rule_configuration_name:rule_configuration_name ->
  unit ->
  profiler_rule_configuration

val make_resource_config_for_update :
  keep_alive_period_in_seconds:keep_alive_period_in_seconds -> unit -> resource_config_for_update

val make_remote_debug_config_for_update :
  ?enable_remote_debug:enable_remote_debug -> unit -> remote_debug_config_for_update

val make_update_training_job_request :
  ?remote_debug_config:remote_debug_config_for_update ->
  ?resource_config:resource_config_for_update ->
  ?profiler_rule_configurations:profiler_rule_configurations ->
  ?profiler_config:profiler_config_for_update ->
  training_job_name:training_job_name ->
  unit ->
  update_training_job_request

val make_cfn_stack_update_parameter :
  ?value:cfn_stack_parameter_value ->
  key:cfn_stack_parameter_key ->
  unit ->
  cfn_stack_update_parameter

val make_cfn_update_template_provider :
  ?parameters:cfn_stack_update_parameters ->
  template_ur_l:cfn_template_ur_l ->
  template_name:cfn_template_name ->
  unit ->
  cfn_update_template_provider

val make_update_template_provider :
  ?cfn_template_provider:cfn_update_template_provider -> unit -> update_template_provider

val make_update_space_response : ?space_arn:space_arn -> unit -> update_space_response

val make_space_idle_settings :
  ?idle_timeout_in_minutes:idle_timeout_in_minutes -> unit -> space_idle_settings

val make_space_app_lifecycle_management :
  ?idle_settings:space_idle_settings -> unit -> space_app_lifecycle_management

val make_space_code_editor_app_settings :
  ?app_lifecycle_management:space_app_lifecycle_management ->
  ?default_resource_spec:resource_spec ->
  unit ->
  space_code_editor_app_settings

val make_space_jupyter_lab_app_settings :
  ?app_lifecycle_management:space_app_lifecycle_management ->
  ?code_repositories:code_repositories ->
  ?default_resource_spec:resource_spec ->
  unit ->
  space_jupyter_lab_app_settings

val make_ebs_storage_settings :
  ebs_volume_size_in_gb:space_ebs_volume_size_in_gb -> unit -> ebs_storage_settings

val make_space_storage_settings :
  ?ebs_storage_settings:ebs_storage_settings -> unit -> space_storage_settings

val make_efs_file_system : file_system_id:file_system_id -> unit -> efs_file_system
val make_f_sx_lustre_file_system : file_system_id:file_system_id -> unit -> f_sx_lustre_file_system
val make_s3_file_system : s3_uri:s3_schema_uri -> unit -> s3_file_system

val make_space_settings :
  ?remote_access:feature_status ->
  ?custom_file_systems:custom_file_systems ->
  ?space_managed_resources:feature_status ->
  ?space_storage_settings:space_storage_settings ->
  ?app_type:app_type ->
  ?jupyter_lab_app_settings:space_jupyter_lab_app_settings ->
  ?code_editor_app_settings:space_code_editor_app_settings ->
  ?kernel_gateway_app_settings:kernel_gateway_app_settings ->
  ?jupyter_server_app_settings:jupyter_server_app_settings ->
  unit ->
  space_settings

val make_update_space_request :
  ?space_display_name:non_empty_string64 ->
  ?space_settings:space_settings ->
  space_name:space_name ->
  domain_id:domain_id ->
  unit ->
  update_space_request

val make_update_project_output : project_arn:project_arn -> unit -> update_project_output

val make_provisioning_parameter :
  ?value:provisioning_parameter_value ->
  ?key:provisioning_parameter_key ->
  unit ->
  provisioning_parameter

val make_service_catalog_provisioning_update_details :
  ?provisioning_parameters:provisioning_parameters ->
  ?provisioning_artifact_id:service_catalog_entity_id ->
  unit ->
  service_catalog_provisioning_update_details

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_update_project_input :
  ?template_providers_to_update:update_template_provider_list ->
  ?tags:tag_list ->
  ?service_catalog_provisioning_update_details:service_catalog_provisioning_update_details ->
  ?project_description:entity_description ->
  project_name:project_entity_name ->
  unit ->
  update_project_input

val make_update_pipeline_version_response :
  ?pipeline_version_id:pipeline_version_id ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  update_pipeline_version_response

val make_update_pipeline_version_request :
  ?pipeline_version_description:pipeline_version_description ->
  ?pipeline_version_display_name:pipeline_version_name ->
  pipeline_version_id:pipeline_version_id ->
  pipeline_arn:pipeline_arn ->
  unit ->
  update_pipeline_version_request

val make_update_pipeline_response :
  ?pipeline_version_id:pipeline_version_id ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  update_pipeline_response

val make_pipeline_definition_s3_location :
  ?version_id:version_id ->
  object_key:key ->
  bucket:bucket_name ->
  unit ->
  pipeline_definition_s3_location

val make_parallelism_configuration :
  max_parallel_execution_steps:max_parallel_execution_steps -> unit -> parallelism_configuration

val make_update_pipeline_request :
  ?parallelism_configuration:parallelism_configuration ->
  ?role_arn:role_arn ->
  ?pipeline_description:pipeline_description ->
  ?pipeline_definition_s3_location:pipeline_definition_s3_location ->
  ?pipeline_definition:pipeline_definition ->
  ?pipeline_display_name:pipeline_name ->
  pipeline_name:pipeline_name ->
  unit ->
  update_pipeline_request

val make_update_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> update_pipeline_execution_response

val make_update_pipeline_execution_request :
  ?parallelism_configuration:parallelism_configuration ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_execution_description:pipeline_execution_description ->
  pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  update_pipeline_execution_request

val make_update_partner_app_response : ?arn:partner_app_arn -> unit -> update_partner_app_response

val make_partner_app_maintenance_config :
  ?maintenance_window_start:weekly_schedule_time_format -> unit -> partner_app_maintenance_config

val make_role_group_assignment :
  group_patterns:group_patterns_list ->
  role_name:non_empty_string256 ->
  unit ->
  role_group_assignment

val make_partner_app_config :
  ?role_group_assignments:role_group_assignments_list ->
  ?assigned_group_patterns:assigned_group_patterns_list ->
  ?arguments:partner_app_arguments ->
  ?admin_users:partner_app_admin_user_list ->
  unit ->
  partner_app_config

val make_update_partner_app_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?app_version:major_minor_version ->
  ?enable_auto_minor_version_upgrade:boolean_ ->
  ?enable_iam_session_based_identity:boolean_ ->
  ?application_config:partner_app_config ->
  ?tier:non_empty_string64 ->
  ?maintenance_config:partner_app_maintenance_config ->
  arn:partner_app_arn ->
  unit ->
  update_partner_app_request

val make_update_notebook_instance_output : unit -> unit
val make_update_notebook_instance_lifecycle_config_output : unit -> unit

val make_notebook_instance_lifecycle_hook :
  ?content:notebook_instance_lifecycle_config_content -> unit -> notebook_instance_lifecycle_hook

val make_update_notebook_instance_lifecycle_config_input :
  ?on_start:notebook_instance_lifecycle_config_list ->
  ?on_create:notebook_instance_lifecycle_config_list ->
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  update_notebook_instance_lifecycle_config_input

val make_instance_metadata_service_configuration :
  minimum_instance_metadata_service_version:minimum_instance_metadata_service_version ->
  unit ->
  instance_metadata_service_configuration

val make_update_notebook_instance_input :
  ?instance_metadata_service_configuration:instance_metadata_service_configuration ->
  ?root_access:root_access ->
  ?disassociate_additional_code_repositories:disassociate_additional_code_repositories ->
  ?disassociate_default_code_repository:disassociate_default_code_repository ->
  ?disassociate_accelerator_types:disassociate_notebook_instance_accelerator_types ->
  ?accelerator_types:notebook_instance_accelerator_types ->
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  ?default_code_repository:code_repository_name_or_url ->
  ?volume_size_in_g_b:notebook_instance_volume_size_in_g_b ->
  ?disassociate_lifecycle_config:disassociate_notebook_instance_lifecycle_config ->
  ?lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?role_arn:role_arn ->
  ?platform_identifier:platform_identifier ->
  ?ip_address_type:ip_address_type ->
  ?instance_type:instance_type ->
  notebook_instance_name:notebook_instance_name ->
  unit ->
  update_notebook_instance_input

val make_update_monitoring_schedule_response :
  monitoring_schedule_arn:monitoring_schedule_arn -> unit -> update_monitoring_schedule_response

val make_schedule_config :
  ?data_analysis_end_time:string_ ->
  ?data_analysis_start_time:string_ ->
  schedule_expression:schedule_expression ->
  unit ->
  schedule_config

val make_monitoring_constraints_resource : ?s3_uri:s3_uri -> unit -> monitoring_constraints_resource
val make_monitoring_statistics_resource : ?s3_uri:s3_uri -> unit -> monitoring_statistics_resource

val make_monitoring_baseline_config :
  ?statistics_resource:monitoring_statistics_resource ->
  ?constraints_resource:monitoring_constraints_resource ->
  ?baselining_job_name:processing_job_name ->
  unit ->
  monitoring_baseline_config

val make_endpoint_input :
  ?exclude_features_attribute:exclude_features_attribute ->
  ?end_time_offset:monitoring_time_offset_string ->
  ?start_time_offset:monitoring_time_offset_string ->
  ?probability_threshold_attribute:probability_threshold_attribute ->
  ?probability_attribute:string_ ->
  ?inference_attribute:string_ ->
  ?features_attribute:string_ ->
  ?s3_data_distribution_type:processing_s3_data_distribution_type ->
  ?s3_input_mode:processing_s3_input_mode ->
  local_path:processing_local_path ->
  endpoint_name:endpoint_name ->
  unit ->
  endpoint_input

val make_monitoring_csv_dataset_format : ?header:boolean_ -> unit -> monitoring_csv_dataset_format
val make_monitoring_json_dataset_format : ?line:boolean_ -> unit -> monitoring_json_dataset_format
val make_monitoring_parquet_dataset_format : unit -> unit

val make_monitoring_dataset_format :
  ?parquet:monitoring_parquet_dataset_format ->
  ?json:monitoring_json_dataset_format ->
  ?csv:monitoring_csv_dataset_format ->
  unit ->
  monitoring_dataset_format

val make_batch_transform_input :
  ?exclude_features_attribute:exclude_features_attribute ->
  ?end_time_offset:monitoring_time_offset_string ->
  ?start_time_offset:monitoring_time_offset_string ->
  ?probability_threshold_attribute:probability_threshold_attribute ->
  ?probability_attribute:string_ ->
  ?inference_attribute:string_ ->
  ?features_attribute:string_ ->
  ?s3_data_distribution_type:processing_s3_data_distribution_type ->
  ?s3_input_mode:processing_s3_input_mode ->
  local_path:processing_local_path ->
  dataset_format:monitoring_dataset_format ->
  data_captured_destination_s3_uri:destination_s3_uri ->
  unit ->
  batch_transform_input

val make_monitoring_input :
  ?batch_transform_input:batch_transform_input ->
  ?endpoint_input:endpoint_input ->
  unit ->
  monitoring_input

val make_monitoring_s3_output :
  ?s3_upload_mode:processing_s3_upload_mode ->
  local_path:processing_local_path ->
  s3_uri:monitoring_s3_uri ->
  unit ->
  monitoring_s3_output

val make_monitoring_output : s3_output:monitoring_s3_output -> unit -> monitoring_output

val make_monitoring_output_config :
  ?kms_key_id:kms_key_id ->
  monitoring_outputs:monitoring_outputs ->
  unit ->
  monitoring_output_config

val make_monitoring_cluster_config :
  ?volume_kms_key_id:kms_key_id ->
  volume_size_in_g_b:processing_volume_size_in_g_b ->
  instance_type:processing_instance_type ->
  instance_count:processing_instance_count ->
  unit ->
  monitoring_cluster_config

val make_monitoring_resources :
  cluster_config:monitoring_cluster_config -> unit -> monitoring_resources

val make_monitoring_app_specification :
  ?post_analytics_processor_source_uri:s3_uri ->
  ?record_preprocessor_source_uri:s3_uri ->
  ?container_arguments:monitoring_container_arguments ->
  ?container_entrypoint:container_entrypoint ->
  image_uri:image_uri ->
  unit ->
  monitoring_app_specification

val make_monitoring_stopping_condition :
  max_runtime_in_seconds:monitoring_max_runtime_in_seconds -> unit -> monitoring_stopping_condition

val make_network_config :
  ?vpc_config:vpc_config ->
  ?enable_network_isolation:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  unit ->
  network_config

val make_monitoring_job_definition :
  ?network_config:network_config ->
  ?environment:monitoring_environment_map ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?baseline_config:monitoring_baseline_config ->
  role_arn:role_arn ->
  monitoring_app_specification:monitoring_app_specification ->
  monitoring_resources:monitoring_resources ->
  monitoring_output_config:monitoring_output_config ->
  monitoring_inputs:monitoring_inputs ->
  unit ->
  monitoring_job_definition

val make_monitoring_schedule_config :
  ?monitoring_type:monitoring_type ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?monitoring_job_definition:monitoring_job_definition ->
  ?schedule_config:schedule_config ->
  unit ->
  monitoring_schedule_config

val make_update_monitoring_schedule_request :
  monitoring_schedule_config:monitoring_schedule_config ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  update_monitoring_schedule_request

val make_update_monitoring_alert_response :
  ?monitoring_alert_name:monitoring_alert_name ->
  monitoring_schedule_arn:monitoring_schedule_arn ->
  unit ->
  update_monitoring_alert_response

val make_update_monitoring_alert_request :
  evaluation_period:monitoring_evaluation_period ->
  datapoints_to_alert:monitoring_datapoints_to_alert ->
  monitoring_alert_name:monitoring_alert_name ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  update_monitoring_alert_request

val make_update_model_package_output :
  model_package_arn:model_package_arn -> unit -> update_model_package_output

val make_model_access_config : accept_eula:accept_eula -> unit -> model_access_config

val make_inference_hub_access_config :
  hub_content_arn:hub_content_arn -> unit -> inference_hub_access_config

val make_s3_model_data_source :
  ?manifest_etag:string_ ->
  ?e_tag:string_ ->
  ?manifest_s3_uri:s3_model_uri ->
  ?hub_access_config:inference_hub_access_config ->
  ?model_access_config:model_access_config ->
  compression_type:model_compression_type ->
  s3_data_type:s3_model_data_type ->
  s3_uri:s3_model_uri ->
  unit ->
  s3_model_data_source

val make_model_data_source : ?s3_data_source:s3_model_data_source -> unit -> model_data_source
val make_model_input : data_input_config:data_input_config -> unit -> model_input

val make_additional_model_data_source :
  s3_data_source:s3_model_data_source ->
  channel_name:additional_model_channel_name ->
  unit ->
  additional_model_data_source

val make_additional_s3_data_source :
  ?e_tag:string_ ->
  ?compression_type:compression_type ->
  s3_uri:s3_uri ->
  s3_data_type:additional_s3_data_source_data_type ->
  unit ->
  additional_s3_data_source

val make_base_model :
  ?recipe_name:recipe_name ->
  ?hub_content_version:hub_content_version ->
  ?hub_content_name:hub_content_name ->
  unit ->
  base_model

val make_model_package_container_definition :
  ?base_model:base_model ->
  ?is_checkpoint:boolean_ ->
  ?model_data_e_tag:string_ ->
  ?additional_s3_data_source:additional_s3_data_source ->
  ?additional_model_data_sources:additional_model_data_sources ->
  ?nearest_model_name:string_ ->
  ?framework_version:model_package_framework_version ->
  ?framework:string_ ->
  ?model_input:model_input ->
  ?environment:environment_map ->
  ?product_id:product_id ->
  ?model_data_source:model_data_source ->
  ?model_data_url:url ->
  ?image_digest:image_digest ->
  ?image:container_image ->
  ?container_hostname:container_hostname ->
  unit ->
  model_package_container_definition

val make_additional_inference_specification_definition :
  ?supported_response_mime_types:response_mime_types ->
  ?supported_content_types:content_types ->
  ?supported_realtime_inference_instance_types:realtime_inference_instance_types ->
  ?supported_transform_instance_types:transform_instance_types ->
  ?description:entity_description ->
  containers:model_package_container_definition_list ->
  name:entity_name ->
  unit ->
  additional_inference_specification_definition

val make_inference_specification :
  ?supported_response_mime_types:response_mime_types ->
  ?supported_content_types:content_types ->
  ?supported_realtime_inference_instance_types:realtime_inference_instance_types ->
  ?supported_transform_instance_types:transform_instance_types ->
  containers:model_package_container_definition_list ->
  unit ->
  inference_specification

val make_model_package_model_card :
  ?model_card_status:model_card_status ->
  ?model_card_content:model_card_content ->
  unit ->
  model_package_model_card

val make_model_life_cycle :
  ?stage_description:stage_description ->
  stage_status:entity_name ->
  stage:entity_name ->
  unit ->
  model_life_cycle

val make_update_model_package_input :
  ?client_token:client_token ->
  ?model_life_cycle:model_life_cycle ->
  ?model_card:model_package_model_card ->
  ?source_uri:model_package_source_uri ->
  ?inference_specification:inference_specification ->
  ?additional_inference_specifications_to_add:additional_inference_specifications ->
  ?customer_metadata_properties_to_remove:customer_metadata_key_list ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?approval_description:approval_description ->
  ?model_package_registration_type:model_package_registration_type ->
  ?model_approval_status:model_approval_status ->
  model_package_arn:model_package_arn ->
  unit ->
  update_model_package_input

val make_update_model_card_response :
  model_card_arn:model_card_arn -> unit -> update_model_card_response

val make_update_model_card_request :
  ?model_card_status:model_card_status ->
  ?content:model_card_content ->
  model_card_name:model_card_name_or_arn ->
  unit ->
  update_model_card_request

val make_update_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> update_mlflow_tracking_server_response

val make_update_mlflow_tracking_server_request :
  ?s3_bucket_owner_verification:boolean_ ->
  ?s3_bucket_owner_account_id:account_id ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?automatic_model_registration:boolean_ ->
  ?tracking_server_size:tracking_server_size ->
  ?artifact_store_uri:s3_uri ->
  tracking_server_name:tracking_server_name ->
  unit ->
  update_mlflow_tracking_server_request

val make_update_mlflow_app_response : ?arn:mlflow_app_arn -> unit -> update_mlflow_app_response

val make_update_mlflow_app_request :
  ?account_default_status:account_default_status ->
  ?default_domain_id_list:default_domain_id_list ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?model_registration_mode:model_registration_mode ->
  ?artifact_store_uri:s3_uri ->
  ?name:mlflow_app_name ->
  arn:mlflow_app_arn ->
  unit ->
  update_mlflow_app_request

val make_update_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> update_inference_experiment_response

val make_inference_experiment_schedule :
  ?end_time:timestamp -> ?start_time:timestamp -> unit -> inference_experiment_schedule

val make_real_time_inference_config :
  instance_count:task_count ->
  instance_type:production_variant_instance_type ->
  unit ->
  real_time_inference_config

val make_model_infrastructure_config :
  real_time_inference_config:real_time_inference_config ->
  infrastructure_type:model_infrastructure_type ->
  unit ->
  model_infrastructure_config

val make_model_variant_config :
  infrastructure_config:model_infrastructure_config ->
  variant_name:model_variant_name ->
  model_name:model_name ->
  unit ->
  model_variant_config

val make_capture_content_type_header :
  ?json_content_types:json_content_types ->
  ?csv_content_types:csv_content_types ->
  unit ->
  capture_content_type_header

val make_inference_experiment_data_storage_config :
  ?content_type:capture_content_type_header ->
  ?kms_key:kms_key_id ->
  destination:destination_s3_uri ->
  unit ->
  inference_experiment_data_storage_config

val make_shadow_model_variant_config :
  sampling_percentage:percentage ->
  shadow_model_variant_name:model_variant_name ->
  unit ->
  shadow_model_variant_config

val make_shadow_mode_config :
  shadow_model_variants:shadow_model_variant_config_list ->
  source_model_variant_name:model_variant_name ->
  unit ->
  shadow_mode_config

val make_update_inference_experiment_request :
  ?shadow_mode_config:shadow_mode_config ->
  ?data_storage_config:inference_experiment_data_storage_config ->
  ?model_variants:model_variant_config_list ->
  ?description:inference_experiment_description ->
  ?schedule:inference_experiment_schedule ->
  name:inference_experiment_name ->
  unit ->
  update_inference_experiment_request

val make_update_inference_component_runtime_config_output :
  inference_component_arn:inference_component_arn ->
  unit ->
  update_inference_component_runtime_config_output

val make_inference_component_runtime_config :
  copy_count:inference_component_copy_count -> unit -> inference_component_runtime_config

val make_update_inference_component_runtime_config_input :
  desired_runtime_config:inference_component_runtime_config ->
  inference_component_name:inference_component_name ->
  unit ->
  update_inference_component_runtime_config_input

val make_update_inference_component_output :
  inference_component_arn:inference_component_arn -> unit -> update_inference_component_output

val make_metrics_endpoint :
  ?metric_publish_frequency_in_seconds:metric_publish_frequency_in_seconds ->
  metrics_endpoint_path:metrics_endpoint_path ->
  unit ->
  metrics_endpoint

val make_container_metrics_config :
  ?metrics_endpoints:metrics_endpoint_list -> unit -> container_metrics_config

val make_inference_component_container_specification :
  ?container_metrics_config:container_metrics_config ->
  ?environment:environment_map ->
  ?artifact_url:url ->
  ?image:container_image ->
  unit ->
  inference_component_container_specification

val make_inference_component_startup_parameters :
  ?container_startup_health_check_timeout_in_seconds:
    production_variant_container_startup_health_check_timeout_in_seconds ->
  ?model_data_download_timeout_in_seconds:production_variant_model_data_download_timeout_in_seconds ->
  unit ->
  inference_component_startup_parameters

val make_inference_component_compute_resource_requirements :
  ?max_memory_required_in_mb:memory_in_mb ->
  ?number_of_accelerator_devices_required:number_of_accelerator_devices ->
  ?number_of_cpu_cores_required:number_of_cpu_cores ->
  min_memory_required_in_mb:memory_in_mb ->
  unit ->
  inference_component_compute_resource_requirements

val make_inference_component_data_cache_config :
  enable_caching:enable_caching -> unit -> inference_component_data_cache_config

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

val make_inference_component_specification :
  ?scheduling_config:inference_component_scheduling_config ->
  ?data_cache_config:inference_component_data_cache_config ->
  ?base_inference_component_name:inference_component_name ->
  ?compute_resource_requirements:inference_component_compute_resource_requirements ->
  ?startup_parameters:inference_component_startup_parameters ->
  ?container:inference_component_container_specification ->
  ?model_name:model_name ->
  ?instance_type:production_variant_instance_type ->
  unit ->
  inference_component_specification

val make_inference_component_capacity_size :
  value:capacity_size_value ->
  type_:inference_component_capacity_size_type ->
  unit ->
  inference_component_capacity_size

val make_inference_component_rolling_update_policy :
  ?rollback_maximum_batch_size:inference_component_capacity_size ->
  ?maximum_execution_timeout_in_seconds:maximum_execution_timeout_in_seconds ->
  wait_interval_in_seconds:wait_interval_in_seconds ->
  maximum_batch_size:inference_component_capacity_size ->
  unit ->
  inference_component_rolling_update_policy

val make_alarm : ?alarm_name:alarm_name -> unit -> alarm
val make_auto_rollback_config : ?alarms:alarm_list -> unit -> auto_rollback_config

val make_inference_component_deployment_config :
  ?auto_rollback_configuration:auto_rollback_config ->
  rolling_update_policy:inference_component_rolling_update_policy ->
  unit ->
  inference_component_deployment_config

val make_update_inference_component_input :
  ?deployment_config:inference_component_deployment_config ->
  ?runtime_config:inference_component_runtime_config ->
  ?specifications:inference_component_specification_list ->
  ?specification:inference_component_specification ->
  inference_component_name:inference_component_name ->
  unit ->
  update_inference_component_input

val make_update_image_version_response :
  ?image_version_arn:image_version_arn -> unit -> update_image_version_response

val make_update_image_version_request :
  ?release_notes:release_notes ->
  ?horovod:horovod ->
  ?processor:processor ->
  ?programming_lang:programming_lang ->
  ?ml_framework:ml_framework ->
  ?job_type:job_type ->
  ?vendor_guidance:vendor_guidance ->
  ?aliases_to_delete:sage_maker_image_version_aliases ->
  ?aliases_to_add:sage_maker_image_version_aliases ->
  ?version:image_version_number ->
  ?alias:sage_maker_image_version_alias ->
  image_name:image_name ->
  unit ->
  update_image_version_request

val make_update_image_response : ?image_arn:image_arn -> unit -> update_image_response

val make_update_image_request :
  ?role_arn:role_arn ->
  ?display_name:image_display_name ->
  ?description:image_description ->
  ?delete_properties:image_delete_property_list ->
  image_name:image_name ->
  unit ->
  update_image_request

val make_update_hub_response : hub_arn:hub_arn -> unit -> update_hub_response

val make_update_hub_request :
  ?hub_search_keywords:hub_search_keyword_list ->
  ?hub_display_name:hub_display_name ->
  ?hub_description:hub_description ->
  hub_name:hub_name_or_arn ->
  unit ->
  update_hub_request

val make_update_hub_content_response :
  hub_content_arn:hub_content_arn -> hub_arn:hub_arn -> unit -> update_hub_content_response

val make_update_hub_content_request :
  ?support_status:hub_content_support_status ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?hub_content_markdown:hub_content_markdown ->
  ?hub_content_description:hub_content_description ->
  ?hub_content_display_name:hub_content_display_name ->
  hub_content_version:hub_content_version ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  hub_name:hub_name_or_arn ->
  unit ->
  update_hub_content_request

val make_update_hub_content_reference_response :
  hub_content_arn:hub_content_arn ->
  hub_arn:hub_arn ->
  unit ->
  update_hub_content_reference_response

val make_update_hub_content_reference_request :
  ?min_version:hub_content_version ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  hub_name:hub_name_or_arn ->
  unit ->
  update_hub_content_reference_request

val make_feature_parameter :
  ?value:feature_parameter_value -> ?key:feature_parameter_key -> unit -> feature_parameter

val make_update_feature_metadata_request :
  ?parameter_removals:feature_parameter_removals ->
  ?parameter_additions:feature_parameter_additions ->
  ?description:feature_description ->
  feature_name:feature_name ->
  feature_group_name:feature_group_name_or_arn ->
  unit ->
  update_feature_metadata_request

val make_update_feature_group_response :
  feature_group_arn:feature_group_arn -> unit -> update_feature_group_response

val make_feature_definition :
  ?collection_config:collection_config ->
  ?collection_type:collection_type ->
  feature_type:feature_type ->
  feature_name:feature_name ->
  unit ->
  feature_definition

val make_ttl_duration :
  ?value:ttl_duration_value -> ?unit_:ttl_duration_unit -> unit -> ttl_duration

val make_online_store_config_update :
  ?ttl_duration:ttl_duration -> unit -> online_store_config_update

val make_throughput_config_update :
  ?provisioned_write_capacity_units:capacity_unit ->
  ?provisioned_read_capacity_units:capacity_unit ->
  ?throughput_mode:throughput_mode ->
  unit ->
  throughput_config_update

val make_update_feature_group_request :
  ?throughput_config:throughput_config_update ->
  ?online_store_config:online_store_config_update ->
  ?feature_additions:feature_additions ->
  feature_group_name:feature_group_name_or_arn ->
  unit ->
  update_feature_group_request

val make_update_experiment_response :
  ?experiment_arn:experiment_arn -> unit -> update_experiment_response

val make_update_experiment_request :
  ?description:experiment_description ->
  ?display_name:experiment_entity_name ->
  experiment_name:experiment_entity_name ->
  unit ->
  update_experiment_request

val make_update_endpoint_weights_and_capacities_output :
  endpoint_arn:endpoint_arn -> unit -> update_endpoint_weights_and_capacities_output

val make_production_variant_serverless_update_config :
  ?provisioned_concurrency:serverless_provisioned_concurrency ->
  ?max_concurrency:serverless_max_concurrency ->
  unit ->
  production_variant_serverless_update_config

val make_desired_weight_and_capacity :
  ?serverless_update_config:production_variant_serverless_update_config ->
  ?desired_instance_count:task_count ->
  ?desired_weight:variant_weight ->
  variant_name:variant_name ->
  unit ->
  desired_weight_and_capacity

val make_update_endpoint_weights_and_capacities_input :
  desired_weights_and_capacities:desired_weight_and_capacity_list ->
  endpoint_name:endpoint_name ->
  unit ->
  update_endpoint_weights_and_capacities_input

val make_update_endpoint_output : endpoint_arn:endpoint_arn -> unit -> update_endpoint_output

val make_capacity_size :
  value:capacity_size_value -> type_:capacity_size_type -> unit -> capacity_size

val make_traffic_routing_config :
  ?linear_step_size:capacity_size ->
  ?canary_size:capacity_size ->
  wait_interval_in_seconds:wait_interval_in_seconds ->
  type_:traffic_routing_config_type ->
  unit ->
  traffic_routing_config

val make_blue_green_update_policy :
  ?maximum_execution_timeout_in_seconds:maximum_execution_timeout_in_seconds ->
  ?termination_wait_in_seconds:termination_wait_in_seconds ->
  traffic_routing_configuration:traffic_routing_config ->
  unit ->
  blue_green_update_policy

val make_rolling_update_policy :
  ?rollback_maximum_batch_size:capacity_size ->
  ?maximum_execution_timeout_in_seconds:maximum_execution_timeout_in_seconds ->
  wait_interval_in_seconds:wait_interval_in_seconds ->
  maximum_batch_size:capacity_size ->
  unit ->
  rolling_update_policy

val make_deployment_config :
  ?auto_rollback_configuration:auto_rollback_config ->
  ?rolling_update_policy:rolling_update_policy ->
  ?blue_green_update_policy:blue_green_update_policy ->
  unit ->
  deployment_config

val make_update_endpoint_input :
  ?retain_deployment_config:boolean_ ->
  ?deployment_config:deployment_config ->
  ?exclude_retained_variant_properties:variant_property_list ->
  ?retain_all_variant_properties:boolean_ ->
  endpoint_config_name:endpoint_config_name ->
  endpoint_name:endpoint_name ->
  unit ->
  update_endpoint_input

val make_update_domain_response : ?domain_arn:domain_arn -> unit -> update_domain_response

val make_r_studio_server_pro_domain_settings_for_update :
  ?r_studio_package_manager_url:string_ ->
  ?r_studio_connect_url:string_ ->
  ?default_resource_spec:resource_spec ->
  domain_execution_role_arn:role_arn ->
  unit ->
  r_studio_server_pro_domain_settings_for_update

val make_trusted_identity_propagation_settings :
  status:feature_status -> unit -> trusted_identity_propagation_settings

val make_docker_settings :
  ?rootless_docker:feature_status ->
  ?vpc_only_trusted_accounts:vpc_only_trusted_accounts ->
  ?enable_docker_access:feature_status ->
  unit ->
  docker_settings

val make_amazon_q_settings :
  ?q_profile_arn:q_profile_arn -> ?status:feature_status -> unit -> amazon_q_settings

val make_unified_studio_settings :
  ?single_sign_on_application_arn:single_sign_on_application_arn ->
  ?project_s3_path:s3_uri ->
  ?environment_id:unified_studio_environment_id ->
  ?project_id:unified_studio_project_id ->
  ?domain_id:unified_studio_domain_id ->
  ?domain_region:region_name ->
  ?domain_account_id:account_id ->
  ?studio_web_portal_access:feature_status ->
  unit ->
  unified_studio_settings

val make_domain_settings_for_update :
  ?ip_address_type:ip_address_type ->
  ?unified_studio_settings:unified_studio_settings ->
  ?amazon_q_settings:amazon_q_settings ->
  ?docker_settings:docker_settings ->
  ?trusted_identity_propagation_settings:trusted_identity_propagation_settings ->
  ?security_group_ids:domain_security_group_ids ->
  ?execution_role_identity_config:execution_role_identity_config ->
  ?r_studio_server_pro_domain_settings_for_update:r_studio_server_pro_domain_settings_for_update ->
  unit ->
  domain_settings_for_update

val make_default_space_settings :
  ?custom_file_system_configs:custom_file_system_configs ->
  ?custom_posix_user_config:custom_posix_user_config ->
  ?space_storage_settings:default_space_storage_settings ->
  ?jupyter_lab_app_settings:jupyter_lab_app_settings ->
  ?kernel_gateway_app_settings:kernel_gateway_app_settings ->
  ?jupyter_server_app_settings:jupyter_server_app_settings ->
  ?security_groups:security_group_ids ->
  ?execution_role:role_arn ->
  unit ->
  default_space_settings

val make_update_domain_request :
  ?vpc_id:vpc_id ->
  ?home_efs_file_system_creation:home_efs_file_system_creation ->
  ?tag_propagation:tag_propagation ->
  ?app_network_access_type:app_network_access_type ->
  ?subnet_ids:subnets ->
  ?default_space_settings:default_space_settings ->
  ?app_security_group_management:app_security_group_management ->
  ?domain_settings_for_update:domain_settings_for_update ->
  ?default_user_settings:user_settings ->
  domain_id:domain_id ->
  unit ->
  update_domain_request

val make_device :
  ?iot_thing_name:thing_name ->
  ?description:device_description ->
  device_name:device_name ->
  unit ->
  device

val make_update_devices_request :
  devices:devices -> device_fleet_name:entity_name -> unit -> update_devices_request

val make_edge_output_config :
  ?preset_deployment_config:string_ ->
  ?preset_deployment_type:edge_preset_deployment_type ->
  ?kms_key_id:kms_key_id ->
  s3_output_location:s3_uri ->
  unit ->
  edge_output_config

val make_update_device_fleet_request :
  ?enable_iot_role_alias:enable_iot_role_alias ->
  ?description:device_fleet_description ->
  ?role_arn:role_arn ->
  output_config:edge_output_config ->
  device_fleet_name:entity_name ->
  unit ->
  update_device_fleet_request

val make_update_context_response : ?context_arn:context_arn -> unit -> update_context_response

val make_update_context_request :
  ?properties_to_remove:list_lineage_entity_parameter_key ->
  ?properties:lineage_entity_parameters ->
  ?description:experiment_description ->
  context_name:context_name ->
  unit ->
  update_context_request

val make_update_compute_quota_response :
  compute_quota_version:integer ->
  compute_quota_arn:compute_quota_arn ->
  unit ->
  update_compute_quota_response

val make_accelerator_partition_config :
  count:integer -> type_:mig_profile_type -> unit -> accelerator_partition_config

val make_compute_quota_resource_config :
  ?accelerator_partition:accelerator_partition_config ->
  ?memory_in_gi_b:memory_in_gi_b_amount ->
  ?v_cpu:v_cpu_amount ->
  ?accelerators:accelerators_amount ->
  ?count:instance_count ->
  instance_type:cluster_instance_type ->
  unit ->
  compute_quota_resource_config

val make_resource_sharing_config :
  ?absolute_borrow_limits:absolute_borrow_limit_resource_list ->
  ?borrow_limit:borrow_limit ->
  strategy:resource_sharing_strategy ->
  unit ->
  resource_sharing_config

val make_compute_quota_config :
  ?preempt_team_tasks:preempt_team_tasks ->
  ?resource_sharing_config:resource_sharing_config ->
  ?compute_quota_resources:compute_quota_resource_config_list ->
  unit ->
  compute_quota_config

val make_compute_quota_target :
  ?fair_share_weight:fair_share_weight ->
  team_name:compute_quota_target_team_name ->
  unit ->
  compute_quota_target

val make_update_compute_quota_request :
  ?description:entity_description ->
  ?activation_state:activation_state ->
  ?compute_quota_target:compute_quota_target ->
  ?compute_quota_config:compute_quota_config ->
  target_version:integer ->
  compute_quota_id:compute_quota_id ->
  unit ->
  update_compute_quota_request

val make_update_code_repository_output :
  code_repository_arn:code_repository_arn -> unit -> update_code_repository_output

val make_git_config_for_update : ?secret_arn:secret_arn -> unit -> git_config_for_update

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

val make_capacity_size_config :
  value:node_unavailability_value -> type_:node_unavailability_type -> unit -> capacity_size_config

val make_rolling_deployment_policy :
  ?rollback_maximum_batch_size:capacity_size_config ->
  maximum_batch_size:capacity_size_config ->
  unit ->
  rolling_deployment_policy

val make_alarm_details : alarm_name:alarm_name -> unit -> alarm_details

val make_deployment_configuration :
  ?auto_rollback_configuration:auto_rollback_alarms ->
  ?wait_interval_in_seconds:wait_time_interval_in_seconds ->
  ?rolling_update_policy:rolling_deployment_policy ->
  unit ->
  deployment_configuration

val make_update_cluster_software_request :
  ?image_id:image_id ->
  ?deployment_config:deployment_configuration ->
  ?instance_groups:update_cluster_software_instance_groups ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  update_cluster_software_request

val make_update_cluster_scheduler_config_response :
  cluster_scheduler_config_version:integer ->
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  unit ->
  update_cluster_scheduler_config_response

val make_priority_class :
  weight:priority_weight -> name:cluster_scheduler_priority_class_name -> unit -> priority_class

val make_scheduler_config :
  ?idle_resource_sharing:idle_resource_sharing ->
  ?fair_share:fair_share ->
  ?priority_classes:priority_class_list ->
  unit ->
  scheduler_config

val make_update_cluster_scheduler_config_request :
  ?description:entity_description ->
  ?scheduler_config:scheduler_config ->
  target_version:integer ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  unit ->
  update_cluster_scheduler_config_request

val make_update_cluster_response : cluster_arn:cluster_arn -> unit -> update_cluster_response

val make_cluster_instance_requirements :
  instance_types:cluster_instance_types -> unit -> cluster_instance_requirements

val make_cluster_life_cycle_config :
  ?on_init_complete:cluster_life_cycle_config_file_name ->
  ?on_create:cluster_life_cycle_config_file_name ->
  ?source_s3_uri:s3_uri ->
  unit ->
  cluster_life_cycle_config

val make_cluster_ebs_volume_config :
  ?root_volume:boolean_ ->
  ?volume_kms_key_id:kms_key_id ->
  ?volume_size_in_g_b:cluster_ebs_volume_size_in_g_b ->
  unit ->
  cluster_ebs_volume_config

val make_cluster_fsx_lustre_config :
  ?mount_path:cluster_fsx_mount_path ->
  mount_name:cluster_mount_name ->
  dns_name:cluster_dns_name ->
  unit ->
  cluster_fsx_lustre_config

val make_cluster_fsx_open_zfs_config :
  ?mount_path:cluster_fsx_mount_path ->
  dns_name:cluster_dns_name ->
  unit ->
  cluster_fsx_open_zfs_config

val make_scheduled_update_config :
  ?deployment_config:deployment_configuration ->
  schedule_expression:cron_schedule_expression ->
  unit ->
  scheduled_update_config

val make_cluster_patch_schedule : ?next_patch_date:timestamp -> unit -> cluster_patch_schedule

val make_cluster_auto_patch_config :
  ?deployment_config:deployment_configuration ->
  ?patch_schedule:cluster_patch_schedule ->
  patching_strategy:cluster_patching_strategy ->
  unit ->
  cluster_auto_patch_config

val make_cluster_kubernetes_taint :
  ?value:cluster_kubernetes_taint_value ->
  effect_:cluster_kubernetes_taint_effect ->
  key:cluster_kubernetes_taint_key ->
  unit ->
  cluster_kubernetes_taint

val make_cluster_kubernetes_config :
  ?taints:cluster_kubernetes_taints ->
  ?labels:cluster_kubernetes_labels ->
  unit ->
  cluster_kubernetes_config

val make_cluster_slurm_config :
  ?partition_names:cluster_partition_names ->
  node_type:cluster_slurm_node_type ->
  unit ->
  cluster_slurm_config

val make_cluster_spot_options : unit -> unit
val make_cluster_on_demand_options : unit -> unit

val make_cluster_capacity_requirements :
  ?on_demand:cluster_on_demand_options ->
  ?spot:cluster_spot_options ->
  unit ->
  cluster_capacity_requirements

val make_cluster_network_interface :
  ?interface_type:cluster_interface_type -> unit -> cluster_network_interface

val make_cluster_instance_group_specification :
  ?network_interface:cluster_network_interface ->
  ?capacity_requirements:cluster_capacity_requirements ->
  ?slurm_config:cluster_slurm_config ->
  ?kubernetes_config:cluster_kubernetes_config ->
  ?image_release_version:image_release_version ->
  ?auto_patch_config:cluster_auto_patch_config ->
  ?image_id:image_id ->
  ?scheduled_update_config:scheduled_update_config ->
  ?override_vpc_config:vpc_config ->
  ?training_plan_arn:training_plan_arn ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?threads_per_core:cluster_threads_per_core ->
  ?life_cycle_config:cluster_life_cycle_config ->
  ?instance_requirements:cluster_instance_requirements ->
  ?instance_type:cluster_instance_type ->
  ?min_instance_count:cluster_instance_count ->
  execution_role:role_arn ->
  instance_group_name:cluster_instance_group_name ->
  instance_count:cluster_instance_count ->
  unit ->
  cluster_instance_group_specification

val make_f_sx_lustre_config :
  per_unit_storage_throughput:f_sx_lustre_per_unit_storage_throughput ->
  size_in_gi_b:f_sx_lustre_size_in_gi_b ->
  unit ->
  f_sx_lustre_config

val make_environment_config : ?f_sx_lustre_config:f_sx_lustre_config -> unit -> environment_config

val make_cluster_restricted_instance_group_specification :
  ?environment_config:environment_config ->
  ?scheduled_update_config:scheduled_update_config ->
  ?override_vpc_config:vpc_config ->
  ?training_plan_arn:training_plan_arn ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?threads_per_core:cluster_threads_per_core ->
  execution_role:role_arn ->
  instance_type:cluster_instance_type ->
  instance_group_name:cluster_instance_group_name ->
  instance_count:cluster_instance_count ->
  unit ->
  cluster_restricted_instance_group_specification

val make_cluster_shared_environment_config :
  f_sx_lustre_config:f_sx_lustre_config ->
  f_sx_lustre_deletion_policy:cluster_f_sx_lustre_deletion_policy ->
  unit ->
  cluster_shared_environment_config

val make_cluster_restricted_instance_groups_config :
  shared_environment_config:cluster_shared_environment_config ->
  unit ->
  cluster_restricted_instance_groups_config

val make_cluster_tiered_storage_config :
  ?instance_memory_allocation_percentage:cluster_instance_memory_allocation_percentage ->
  mode:cluster_config_mode ->
  unit ->
  cluster_tiered_storage_config

val make_cluster_auto_scaling_config :
  ?auto_scaler_type:cluster_auto_scaler_type ->
  mode:cluster_auto_scaling_mode ->
  unit ->
  cluster_auto_scaling_config

val make_cluster_orchestrator_eks_config :
  cluster_arn:eks_cluster_arn -> unit -> cluster_orchestrator_eks_config

val make_cluster_orchestrator_slurm_config :
  ?slurm_config_strategy:cluster_slurm_config_strategy -> unit -> cluster_orchestrator_slurm_config

val make_cluster_orchestrator :
  ?slurm:cluster_orchestrator_slurm_config ->
  ?eks:cluster_orchestrator_eks_config ->
  unit ->
  cluster_orchestrator

val make_update_cluster_request :
  ?orchestrator:cluster_orchestrator ->
  ?auto_scaling:cluster_auto_scaling_config ->
  ?cluster_role:role_arn ->
  ?node_provisioning_mode:cluster_node_provisioning_mode ->
  ?instance_groups_to_delete:cluster_instance_groups_to_delete ->
  ?node_recovery:cluster_node_recovery ->
  ?tiered_storage_config:cluster_tiered_storage_config ->
  ?restricted_instance_groups_config:cluster_restricted_instance_groups_config ->
  ?restricted_instance_groups:cluster_restricted_instance_group_specifications ->
  ?instance_groups:cluster_instance_group_specifications ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  update_cluster_request

val make_update_artifact_response : ?artifact_arn:artifact_arn -> unit -> update_artifact_response

val make_update_artifact_request :
  ?properties_to_remove:list_lineage_entity_parameter_key ->
  ?properties:artifact_properties ->
  ?artifact_name:experiment_entity_name ->
  artifact_arn:artifact_arn ->
  unit ->
  update_artifact_request

val make_update_app_image_config_response :
  ?app_image_config_arn:app_image_config_arn -> unit -> update_app_image_config_response

val make_kernel_spec : ?display_name:kernel_display_name -> name:kernel_name -> unit -> kernel_spec

val make_file_system_config :
  ?default_gid:default_gid ->
  ?default_uid:default_uid ->
  ?mount_path:mount_path ->
  unit ->
  file_system_config

val make_kernel_gateway_image_config :
  ?file_system_config:file_system_config ->
  kernel_specs:kernel_specs ->
  unit ->
  kernel_gateway_image_config

val make_container_config :
  ?container_environment_variables:custom_image_container_environment_variables ->
  ?container_entrypoint:custom_image_container_entrypoint ->
  ?container_arguments:custom_image_container_arguments ->
  unit ->
  container_config

val make_jupyter_lab_app_image_config :
  ?container_config:container_config ->
  ?file_system_config:file_system_config ->
  unit ->
  jupyter_lab_app_image_config

val make_code_editor_app_image_config :
  ?container_config:container_config ->
  ?file_system_config:file_system_config ->
  unit ->
  code_editor_app_image_config

val make_update_app_image_config_request :
  ?code_editor_app_image_config:code_editor_app_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  app_image_config_name:app_image_config_name ->
  unit ->
  update_app_image_config_request

val make_update_action_response : ?action_arn:action_arn -> unit -> update_action_response

val make_update_action_request :
  ?properties_to_remove:list_lineage_entity_parameter_key ->
  ?properties:lineage_entity_parameters ->
  ?status:action_status ->
  ?description:experiment_description ->
  action_name:experiment_entity_name ->
  unit ->
  update_action_request

val make_ultra_server :
  ?health_status:ultra_server_health_status ->
  ?unhealthy_instance_count:unhealthy_instance_count ->
  ?available_spare_instance_count:available_spare_instance_count ->
  ?in_use_instance_count:in_use_instance_count ->
  ?available_instance_count:available_instance_count ->
  ?configured_spare_instance_count:configured_spare_instance_count ->
  total_instance_count:total_instance_count ->
  instance_type:reserved_capacity_instance_type ->
  availability_zone:availability_zone ->
  ultra_server_type:ultra_server_type ->
  ultra_server_id:non_empty_string256 ->
  unit ->
  ultra_server

val make_ultra_server_summary :
  ?unhealthy_instance_count:unhealthy_instance_count ->
  ?available_spare_instance_count:available_spare_instance_count ->
  ?ultra_server_count:ultra_server_count ->
  instance_type:reserved_capacity_instance_type ->
  ultra_server_type:ultra_server_type ->
  unit ->
  ultra_server_summary

val make_ultra_server_info :
  ?type_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ultra_server_info

val make_ui_template_info :
  ?content_sha256:template_content_sha256 -> ?url:template_url -> unit -> ui_template_info

val make_ui_template : content:template_content -> unit -> ui_template

val make_ui_config :
  ?human_task_ui_arn:human_task_ui_arn -> ?ui_template_s3_uri:s3_uri -> unit -> ui_config

val make_us_d :
  ?tenth_fractions_of_a_cent:tenth_fractions_of_a_cent ->
  ?cents:cents ->
  ?dollars:dollars ->
  unit ->
  us_d

val make_tuning_job_step_meta_data :
  ?arn:hyper_parameter_tuning_job_arn -> unit -> tuning_job_step_meta_data

val make_best_objective_not_improving :
  ?max_number_of_training_jobs_not_improving:max_number_of_training_jobs_not_improving ->
  unit ->
  best_objective_not_improving

val make_convergence_detected :
  ?complete_on_convergence:complete_on_convergence -> unit -> convergence_detected

val make_tuning_job_completion_criteria :
  ?convergence_detected:convergence_detected ->
  ?best_objective_not_improving:best_objective_not_improving ->
  ?target_objective_metric_value:target_objective_metric_value ->
  unit ->
  tuning_job_completion_criteria

val make_trial_source :
  ?source_type:source_type -> source_arn:trial_source_arn -> unit -> trial_source

val make_trial_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?trial_source:trial_source ->
  ?display_name:experiment_entity_name ->
  ?trial_name:experiment_entity_name ->
  ?trial_arn:trial_arn ->
  unit ->
  trial_summary

val make_trial_component_source :
  ?source_type:source_type ->
  source_arn:trial_component_source_arn ->
  unit ->
  trial_component_source

val make_trial_component_summary :
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:trial_component_status ->
  ?trial_component_source:trial_component_source ->
  ?display_name:experiment_entity_name ->
  ?trial_component_arn:trial_component_arn ->
  ?trial_component_name:experiment_entity_name ->
  unit ->
  trial_component_summary

val make_model_artifacts : s3_model_artifacts:s3_uri -> unit -> model_artifacts
val make_metric_definition : regex:metric_regex -> name:metric_name -> unit -> metric_definition

val make_training_repository_auth_config :
  training_repository_credentials_provider_arn:training_repository_credentials_provider_arn ->
  unit ->
  training_repository_auth_config

val make_training_image_config :
  ?training_repository_auth_config:training_repository_auth_config ->
  training_repository_access_mode:training_repository_access_mode ->
  unit ->
  training_image_config

val make_algorithm_specification :
  ?training_image_config:training_image_config ->
  ?container_arguments:training_container_arguments ->
  ?container_entrypoint:training_container_entrypoint ->
  ?enable_sage_maker_metrics_time_series:boolean_ ->
  ?metric_definitions:metric_definition_list ->
  ?algorithm_name:arn_or_name ->
  ?training_image:algorithm_image ->
  training_input_mode:training_input_mode ->
  unit ->
  algorithm_specification

val make_hub_access_config : hub_content_arn:hub_content_arn -> unit -> hub_access_config

val make_s3_data_source :
  ?hub_access_config:hub_access_config ->
  ?model_access_config:model_access_config ->
  ?instance_group_names:instance_group_names ->
  ?attribute_names:attribute_names ->
  ?s3_data_distribution_type:s3_data_distribution ->
  s3_uri:s3_uri ->
  s3_data_type:s3_data_type ->
  unit ->
  s3_data_source

val make_file_system_data_source :
  directory_path:directory_path ->
  file_system_type:file_system_type ->
  file_system_access_mode:file_system_access_mode ->
  file_system_id:file_system_id ->
  unit ->
  file_system_data_source

val make_dataset_source : dataset_arn:hub_data_set_arn -> unit -> dataset_source

val make_data_source :
  ?dataset_source:dataset_source ->
  ?file_system_data_source:file_system_data_source ->
  ?s3_data_source:s3_data_source ->
  unit ->
  data_source

val make_shuffle_config : seed:seed -> unit -> shuffle_config

val make_channel :
  ?shuffle_config:shuffle_config ->
  ?input_mode:training_input_mode ->
  ?record_wrapper_type:record_wrapper ->
  ?compression_type:compression_type ->
  ?content_type:content_type ->
  data_source:data_source ->
  channel_name:channel_name ->
  unit ->
  channel

val make_output_data_config :
  ?compression_type:output_compression_type ->
  ?kms_key_id:kms_key_id ->
  s3_output_path:s3_uri ->
  unit ->
  output_data_config

val make_instance_group :
  instance_group_name:instance_group_name ->
  instance_count:training_instance_count ->
  instance_type:training_instance_type ->
  unit ->
  instance_group

val make_placement_specification :
  ?ultra_server_id:string256 ->
  instance_count:training_instance_count ->
  unit ->
  placement_specification

val make_instance_placement_config :
  ?placement_specifications:placement_specifications ->
  ?enable_multiple_jobs:boolean_ ->
  unit ->
  instance_placement_config

val make_resource_config :
  ?instance_placement_config:instance_placement_config ->
  ?training_plan_arn:training_plan_arn ->
  ?instance_groups:instance_groups ->
  ?keep_alive_period_in_seconds:keep_alive_period_in_seconds ->
  ?volume_kms_key_id:kms_key_id ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?instance_count:training_instance_count ->
  ?instance_type:training_instance_type ->
  unit ->
  resource_config

val make_stopping_condition :
  ?max_pending_time_in_seconds:max_pending_time_in_seconds ->
  ?max_wait_time_in_seconds:max_wait_time_in_seconds ->
  ?max_runtime_in_seconds:max_runtime_in_seconds ->
  unit ->
  stopping_condition

val make_secondary_status_transition :
  ?status_message:status_message ->
  ?end_time:timestamp ->
  start_time:timestamp ->
  status:secondary_status ->
  unit ->
  secondary_status_transition

val make_metric_data :
  ?timestamp:timestamp -> ?value:float_ -> ?metric_name:metric_name -> unit -> metric_data

val make_checkpoint_config :
  ?local_path:directory_path -> s3_uri:s3_uri -> unit -> checkpoint_config

val make_collection_configuration :
  ?collection_parameters:collection_parameters ->
  ?collection_name:collection_name ->
  unit ->
  collection_configuration

val make_debug_hook_config :
  ?collection_configurations:collection_configurations ->
  ?hook_parameters:hook_parameters ->
  ?local_path:directory_path ->
  s3_output_path:s3_uri ->
  unit ->
  debug_hook_config

val make_experiment_config :
  ?run_name:experiment_entity_name ->
  ?trial_component_display_name:experiment_entity_name ->
  ?trial_name:experiment_entity_name ->
  ?experiment_name:experiment_entity_name ->
  unit ->
  experiment_config

val make_debug_rule_configuration :
  ?rule_parameters:rule_parameters ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?instance_type:processing_instance_type ->
  ?s3_output_path:s3_uri ->
  ?local_path:directory_path ->
  rule_evaluator_image:algorithm_image ->
  rule_configuration_name:rule_configuration_name ->
  unit ->
  debug_rule_configuration

val make_tensor_board_output_config :
  ?local_path:directory_path -> s3_output_path:s3_uri -> unit -> tensor_board_output_config

val make_debug_rule_evaluation_status :
  ?last_modified_time:timestamp ->
  ?status_details:status_details ->
  ?rule_evaluation_status:rule_evaluation_status ->
  ?rule_evaluation_job_arn:processing_job_arn ->
  ?rule_configuration_name:rule_configuration_name ->
  unit ->
  debug_rule_evaluation_status

val make_model_package_config :
  ?source_model_package_arn:model_package_arn ->
  model_package_group_arn:model_package_group_arn ->
  unit ->
  model_package_config

val make_profiler_config :
  ?disable_profiler:disable_profiler ->
  ?profiling_parameters:profiling_parameters ->
  ?profiling_interval_in_milliseconds:profiling_interval_in_milliseconds ->
  ?s3_output_path:s3_uri ->
  unit ->
  profiler_config

val make_retry_strategy : maximum_retry_attempts:maximum_retry_attempts -> unit -> retry_strategy

val make_training_job :
  ?tags:tag_list ->
  ?retry_strategy:retry_strategy ->
  ?environment:training_environment_map ->
  ?profiler_config:profiler_config ->
  ?model_package_config:model_package_config ->
  ?output_model_package_arn:model_package_arn ->
  ?debug_rule_evaluation_statuses:debug_rule_evaluation_statuses ->
  ?tensor_board_output_config:tensor_board_output_config ->
  ?debug_rule_configurations:debug_rule_configurations ->
  ?experiment_config:experiment_config ->
  ?debug_hook_config:debug_hook_config ->
  ?billable_time_in_seconds:billable_time_in_seconds ->
  ?training_time_in_seconds:training_time_in_seconds ->
  ?checkpoint_config:checkpoint_config ->
  ?enable_managed_spot_training:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_network_isolation:boolean_ ->
  ?final_metric_data_list:final_metric_data_list ->
  ?secondary_status_transitions:secondary_status_transitions ->
  ?last_modified_time:timestamp ->
  ?training_end_time:timestamp ->
  ?training_start_time:timestamp ->
  ?creation_time:timestamp ->
  ?stopping_condition:stopping_condition ->
  ?vpc_config:vpc_config ->
  ?warm_pool_status:warm_pool_status ->
  ?resource_config:resource_config ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?role_arn:role_arn ->
  ?algorithm_specification:algorithm_specification ->
  ?hyper_parameters:hyper_parameters ->
  ?failure_reason:failure_reason ->
  ?secondary_status:secondary_status ->
  ?training_job_status:training_job_status ->
  ?model_artifacts:model_artifacts ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?labeling_job_arn:labeling_job_arn ->
  ?tuning_job_arn:hyper_parameter_tuning_job_arn ->
  ?training_job_arn:training_job_arn ->
  ?training_job_name:training_job_name ->
  unit ->
  training_job

val make_processing_s3_input :
  ?s3_compression_type:processing_s3_compression_type ->
  ?s3_data_distribution_type:processing_s3_data_distribution_type ->
  ?s3_input_mode:processing_s3_input_mode ->
  ?local_path:processing_local_path ->
  s3_data_type:processing_s3_data_type ->
  s3_uri:s3_uri ->
  unit ->
  processing_s3_input

val make_athena_dataset_definition :
  ?output_compression:athena_result_compression_type ->
  ?kms_key_id:kms_key_id ->
  ?work_group:athena_work_group ->
  output_format:athena_result_format ->
  output_s3_uri:s3_uri ->
  query_string:athena_query_string ->
  database:athena_database ->
  catalog:athena_catalog ->
  unit ->
  athena_dataset_definition

val make_redshift_dataset_definition :
  ?output_compression:redshift_result_compression_type ->
  ?kms_key_id:kms_key_id ->
  output_format:redshift_result_format ->
  output_s3_uri:s3_uri ->
  cluster_role_arn:role_arn ->
  query_string:redshift_query_string ->
  db_user:redshift_user_name ->
  database:redshift_database ->
  cluster_id:redshift_cluster_id ->
  unit ->
  redshift_dataset_definition

val make_dataset_definition :
  ?input_mode:input_mode ->
  ?data_distribution_type:data_distribution_type ->
  ?local_path:processing_local_path ->
  ?redshift_dataset_definition:redshift_dataset_definition ->
  ?athena_dataset_definition:athena_dataset_definition ->
  unit ->
  dataset_definition

val make_processing_input :
  ?dataset_definition:dataset_definition ->
  ?s3_input:processing_s3_input ->
  ?app_managed:app_managed ->
  input_name:string_ ->
  unit ->
  processing_input

val make_processing_s3_output :
  ?local_path:processing_local_path ->
  s3_upload_mode:processing_s3_upload_mode ->
  s3_uri:s3_uri ->
  unit ->
  processing_s3_output

val make_processing_feature_store_output :
  feature_group_name:feature_group_name -> unit -> processing_feature_store_output

val make_processing_output :
  ?app_managed:app_managed ->
  ?feature_store_output:processing_feature_store_output ->
  ?s3_output:processing_s3_output ->
  output_name:string_ ->
  unit ->
  processing_output

val make_processing_output_config :
  ?kms_key_id:kms_key_id -> outputs:processing_outputs -> unit -> processing_output_config

val make_processing_cluster_config :
  ?volume_kms_key_id:kms_key_id ->
  volume_size_in_g_b:processing_volume_size_in_g_b ->
  instance_type:processing_instance_type ->
  instance_count:processing_instance_count ->
  unit ->
  processing_cluster_config

val make_processing_resources :
  cluster_config:processing_cluster_config -> unit -> processing_resources

val make_processing_stopping_condition :
  max_runtime_in_seconds:processing_max_runtime_in_seconds -> unit -> processing_stopping_condition

val make_app_specification :
  ?container_arguments:container_arguments ->
  ?container_entrypoint:container_entrypoint ->
  image_uri:image_uri ->
  unit ->
  app_specification

val make_processing_job :
  ?tags:tag_list ->
  ?training_job_arn:training_job_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  ?creation_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?processing_start_time:timestamp ->
  ?processing_end_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?exit_message:exit_message ->
  ?processing_job_status:processing_job_status ->
  ?processing_job_arn:processing_job_arn ->
  ?experiment_config:experiment_config ->
  ?role_arn:role_arn ->
  ?network_config:network_config ->
  ?environment:processing_environment_map ->
  ?app_specification:app_specification ->
  ?stopping_condition:processing_stopping_condition ->
  ?processing_resources:processing_resources ->
  ?processing_job_name:processing_job_name ->
  ?processing_output_config:processing_output_config ->
  ?processing_inputs:processing_inputs ->
  unit ->
  processing_job

val make_model_client_config :
  ?invocations_max_retries:invocations_max_retries ->
  ?invocations_timeout_in_seconds:invocations_timeout_in_seconds ->
  unit ->
  model_client_config

val make_transform_s3_data_source :
  s3_uri:s3_uri -> s3_data_type:s3_data_type -> unit -> transform_s3_data_source

val make_transform_data_source :
  s3_data_source:transform_s3_data_source -> unit -> transform_data_source

val make_transform_input :
  ?split_type:split_type ->
  ?compression_type:compression_type ->
  ?content_type:content_type ->
  data_source:transform_data_source ->
  unit ->
  transform_input

val make_transform_output :
  ?kms_key_id:kms_key_id ->
  ?assemble_with:assembly_type ->
  ?accept:accept ->
  s3_output_path:s3_uri ->
  unit ->
  transform_output

val make_batch_data_capture_config :
  ?generate_inference_id:boolean_ ->
  ?kms_key_id:kms_key_id ->
  destination_s3_uri:s3_uri ->
  unit ->
  batch_data_capture_config

val make_transform_resources :
  ?transform_ami_version:transform_ami_version ->
  ?volume_kms_key_id:kms_key_id ->
  instance_count:transform_instance_count ->
  instance_type:transform_instance_type ->
  unit ->
  transform_resources

val make_data_processing :
  ?join_source:join_source ->
  ?output_filter:json_path ->
  ?input_filter:json_path ->
  unit ->
  data_processing

val make_transform_job :
  ?tags:tag_list ->
  ?experiment_config:experiment_config ->
  ?data_processing:data_processing ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?labeling_job_arn:labeling_job_arn ->
  ?transform_end_time:timestamp ->
  ?transform_start_time:timestamp ->
  ?creation_time:timestamp ->
  ?transform_resources:transform_resources ->
  ?data_capture_config:batch_data_capture_config ->
  ?transform_output:transform_output ->
  ?transform_input:transform_input ->
  ?environment:transform_environment_map ->
  ?batch_strategy:batch_strategy ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?model_client_config:model_client_config ->
  ?max_concurrent_transforms:max_concurrent_transforms ->
  ?model_name:model_name ->
  ?failure_reason:failure_reason ->
  ?transform_job_status:transform_job_status ->
  ?transform_job_arn:transform_job_arn ->
  ?transform_job_name:transform_job_name ->
  unit ->
  transform_job

val make_trial_component_source_detail :
  ?transform_job:transform_job ->
  ?processing_job:processing_job ->
  ?training_job:training_job ->
  ?source_arn:trial_component_source_arn ->
  unit ->
  trial_component_source_detail

val make_trial_component_simple_summary :
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?trial_component_source:trial_component_source ->
  ?trial_component_arn:trial_component_arn ->
  ?trial_component_name:experiment_entity_name ->
  unit ->
  trial_component_simple_summary

val make_trial_component_metric_summary :
  ?std_dev:optional_double ->
  ?avg:optional_double ->
  ?count:optional_integer ->
  ?last:optional_double ->
  ?min:optional_double ->
  ?max:optional_double ->
  ?time_stamp:timestamp ->
  ?source_arn:trial_component_source_arn ->
  ?metric_name:metric_name ->
  unit ->
  trial_component_metric_summary

val make_metadata_properties :
  ?project_id:metadata_property_value ->
  ?generated_by:metadata_property_value ->
  ?repository:metadata_property_value ->
  ?commit_id:metadata_property_value ->
  unit ->
  metadata_properties

val make_parent :
  ?experiment_name:experiment_entity_name -> ?trial_name:experiment_entity_name -> unit -> parent

val make_trial_component :
  ?run_name:experiment_entity_name ->
  ?parents:parents ->
  ?tags:tag_list ->
  ?lineage_group_arn:lineage_group_arn ->
  ?source_detail:trial_component_source_detail ->
  ?metadata_properties:metadata_properties ->
  ?metrics:trial_component_metric_summaries ->
  ?output_artifacts:trial_component_artifacts ->
  ?input_artifacts:trial_component_artifacts ->
  ?parameters:trial_component_parameters ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:trial_component_status ->
  ?source:trial_component_source ->
  ?trial_component_arn:trial_component_arn ->
  ?display_name:experiment_entity_name ->
  ?trial_component_name:experiment_entity_name ->
  unit ->
  trial_component

val make_trial :
  ?trial_component_summaries:trial_component_simple_summaries ->
  ?tags:tag_list ->
  ?metadata_properties:metadata_properties ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?source:trial_source ->
  ?experiment_name:experiment_entity_name ->
  ?display_name:experiment_entity_name ->
  ?trial_arn:trial_arn ->
  ?trial_name:experiment_entity_name ->
  unit ->
  trial

val make_transform_job_summary :
  ?failure_reason:failure_reason ->
  ?last_modified_time:timestamp ->
  ?transform_end_time:timestamp ->
  transform_job_status:transform_job_status ->
  creation_time:timestamp ->
  transform_job_arn:transform_job_arn ->
  transform_job_name:transform_job_name ->
  unit ->
  transform_job_summary

val make_transform_job_step_metadata : ?arn:transform_job_arn -> unit -> transform_job_step_metadata

val make_transform_job_definition :
  ?environment:transform_environment_map ->
  ?batch_strategy:batch_strategy ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?max_concurrent_transforms:max_concurrent_transforms ->
  transform_resources:transform_resources ->
  transform_output:transform_output ->
  transform_input:transform_input ->
  unit ->
  transform_job_definition

val make_integer_parameter_range_specification :
  max_value:parameter_value ->
  min_value:parameter_value ->
  unit ->
  integer_parameter_range_specification

val make_continuous_parameter_range_specification :
  max_value:parameter_value ->
  min_value:parameter_value ->
  unit ->
  continuous_parameter_range_specification

val make_categorical_parameter_range_specification :
  values:parameter_values -> unit -> categorical_parameter_range_specification

val make_parameter_range :
  ?categorical_parameter_range_specification:categorical_parameter_range_specification ->
  ?continuous_parameter_range_specification:continuous_parameter_range_specification ->
  ?integer_parameter_range_specification:integer_parameter_range_specification ->
  unit ->
  parameter_range

val make_hyper_parameter_specification :
  ?default_value:hyper_parameter_value ->
  ?is_required:boolean_ ->
  ?is_tunable:boolean_ ->
  ?range:parameter_range ->
  ?description:entity_description ->
  type_:parameter_type ->
  name:parameter_name ->
  unit ->
  hyper_parameter_specification

val make_channel_specification :
  ?supported_compression_types:compression_types ->
  ?is_required:boolean_ ->
  ?description:entity_description ->
  supported_input_modes:input_modes ->
  supported_content_types:content_types ->
  name:channel_name ->
  unit ->
  channel_specification

val make_hyper_parameter_tuning_job_objective :
  metric_name:metric_name ->
  type_:hyper_parameter_tuning_job_objective_type ->
  unit ->
  hyper_parameter_tuning_job_objective

val make_training_specification :
  ?additional_s3_data_source:additional_s3_data_source ->
  ?supported_tuning_job_objective_metrics:hyper_parameter_tuning_job_objectives ->
  ?metric_definitions:metric_definition_list ->
  ?supports_distributed_training:boolean_ ->
  ?supported_hyper_parameters:hyper_parameter_specifications ->
  ?training_image_digest:image_digest ->
  training_channels:channel_specifications ->
  supported_training_instance_types:training_instance_types ->
  training_image:container_image ->
  unit ->
  training_specification

val make_training_progress_info :
  ?max_epoch:training_epoch_count ->
  ?current_epoch:training_epoch_index ->
  ?current_step:training_step_index ->
  ?total_step_count_per_epoch:total_step_count_per_epoch ->
  unit ->
  training_progress_info

val make_reserved_capacity_summary :
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?duration_minutes:reserved_capacity_duration_minutes ->
  ?duration_hours:reserved_capacity_duration_hours ->
  ?availability_zone_id:availability_zone_id ->
  ?availability_zone:availability_zone ->
  ?ultra_server_count:ultra_server_count ->
  ?ultra_server_type:ultra_server_type ->
  ?reserved_capacity_type:reserved_capacity_type ->
  status:reserved_capacity_status ->
  total_instance_count:total_instance_count ->
  instance_type:reserved_capacity_instance_type ->
  reserved_capacity_arn:reserved_capacity_arn ->
  unit ->
  reserved_capacity_summary

val make_training_plan_summary :
  ?reserved_capacity_summaries:reserved_capacity_summaries ->
  ?target_resources:sage_maker_resource_names ->
  ?total_ultra_server_count:ultra_server_count ->
  ?in_use_instance_count:in_use_instance_count ->
  ?available_instance_count:available_instance_count ->
  ?total_instance_count:total_instance_count ->
  ?currency_code:currency_code ->
  ?upfront_fee:string256 ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?duration_minutes:training_plan_duration_minutes ->
  ?duration_hours:training_plan_duration_hours ->
  ?status_message:training_plan_status_message ->
  status:training_plan_status ->
  training_plan_name:training_plan_name ->
  training_plan_arn:training_plan_arn ->
  unit ->
  training_plan_summary

val make_reserved_capacity_offering :
  ?extension_end_time:timestamp ->
  ?extension_start_time:timestamp ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?duration_minutes:reserved_capacity_duration_minutes ->
  ?duration_hours:reserved_capacity_duration_hours ->
  ?availability_zone:availability_zone ->
  ?ultra_server_count:ultra_server_count ->
  ?ultra_server_type:ultra_server_type ->
  ?reserved_capacity_type:reserved_capacity_type ->
  instance_count:reserved_capacity_instance_count ->
  instance_type:reserved_capacity_instance_type ->
  unit ->
  reserved_capacity_offering

val make_training_plan_offering :
  ?reserved_capacity_offerings:reserved_capacity_offerings ->
  ?currency_code:currency_code ->
  ?upfront_fee:string256 ->
  ?duration_minutes:training_plan_duration_minutes ->
  ?duration_hours:training_plan_duration_hours ->
  ?requested_end_time_before:timestamp ->
  ?requested_start_time_after:timestamp ->
  target_resources:sage_maker_resource_names ->
  training_plan_offering_id:training_plan_offering_id ->
  unit ->
  training_plan_offering

val make_training_plan_filter :
  value:string64 -> name:training_plan_filter_name -> unit -> training_plan_filter

val make_training_plan_extension :
  ?currency_code:currency_code ->
  ?upfront_fee:string256 ->
  ?duration_hours:training_plan_extension_duration_hours ->
  ?availability_zone_id:availability_zone_id ->
  ?availability_zone:string256 ->
  ?payment_status:string256 ->
  ?status:string256 ->
  ?end_date:timestamp ->
  ?start_date:timestamp ->
  ?extended_at:timestamp ->
  training_plan_extension_offering_id:training_plan_extension_offering_id ->
  unit ->
  training_plan_extension

val make_training_plan_extension_offering :
  ?currency_code:currency_code ->
  ?upfront_fee:string256 ->
  ?duration_hours:training_plan_extension_duration_hours ->
  ?end_date:timestamp ->
  ?start_date:timestamp ->
  ?availability_zone:string256 ->
  training_plan_extension_offering_id:training_plan_extension_offering_id ->
  unit ->
  training_plan_extension_offering

val make_training_job_summary :
  ?training_plan_arn:training_plan_arn ->
  ?warm_pool_status:warm_pool_status ->
  ?secondary_status:secondary_status ->
  ?last_modified_time:timestamp ->
  ?training_end_time:timestamp ->
  training_job_status:training_job_status ->
  creation_time:timestamp ->
  training_job_arn:training_job_arn ->
  training_job_name:training_job_name ->
  unit ->
  training_job_summary

val make_training_job_step_metadata : ?arn:training_job_arn -> unit -> training_job_step_metadata

val make_training_job_status_counters :
  ?stopped:training_job_status_counter ->
  ?non_retryable_error:training_job_status_counter ->
  ?retryable_error:training_job_status_counter ->
  ?in_progress:training_job_status_counter ->
  ?completed:training_job_status_counter ->
  unit ->
  training_job_status_counters

val make_training_job_definition :
  ?hyper_parameters:hyper_parameters ->
  stopping_condition:stopping_condition ->
  resource_config:resource_config ->
  output_data_config:output_data_config ->
  input_data_config:input_data_config ->
  training_input_mode:training_input_mode ->
  unit ->
  training_job_definition

val make_phase :
  ?duration_in_seconds:traffic_duration_in_seconds ->
  ?spawn_rate:spawn_rate ->
  ?initial_number_of_users:initial_number_of_users ->
  unit ->
  phase

val make_stairs :
  ?users_per_step:users_per_step ->
  ?number_of_steps:number_of_steps ->
  ?duration_in_seconds:traffic_duration_in_seconds ->
  unit ->
  stairs

val make_traffic_pattern :
  ?stairs:stairs -> ?phases:phases -> ?traffic_type:traffic_type -> unit -> traffic_pattern

val make_tracking_server_summary :
  ?mlflow_version:mlflow_version ->
  ?is_active:is_tracking_server_active ->
  ?tracking_server_status:tracking_server_status ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?tracking_server_name:tracking_server_name ->
  ?tracking_server_arn:tracking_server_arn ->
  unit ->
  tracking_server_summary

val make_total_hits : ?relation:relation -> ?value:long -> unit -> total_hits

val make_time_series_transformations :
  ?aggregation:aggregation_transformations ->
  ?filling:filling_transformations ->
  unit ->
  time_series_transformations

val make_auto_ml_job_completion_criteria :
  ?max_auto_ml_job_runtime_in_seconds:max_auto_ml_job_runtime_in_seconds ->
  ?max_runtime_per_training_job_in_seconds:max_runtime_per_training_job_in_seconds ->
  ?max_candidates:max_candidates ->
  unit ->
  auto_ml_job_completion_criteria

val make_time_series_config :
  ?grouping_attribute_names:grouping_attribute_names ->
  item_identifier_attribute_name:item_identifier_attribute_name ->
  timestamp_attribute_name:timestamp_attribute_name ->
  target_attribute_name:target_attribute_name ->
  unit ->
  time_series_config

val make_holiday_config_attributes : ?country_code:country_code -> unit -> holiday_config_attributes

val make_auto_ml_algorithm_config :
  auto_ml_algorithms:auto_ml_algorithms -> unit -> auto_ml_algorithm_config

val make_candidate_generation_config :
  ?algorithms_config:auto_ml_algorithms_config -> unit -> candidate_generation_config

val make_time_series_forecasting_job_config :
  ?candidate_generation_config:candidate_generation_config ->
  ?holiday_config:holiday_config ->
  ?transformations:time_series_transformations ->
  ?forecast_quantiles:forecast_quantiles ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?feature_specification_s3_uri:s3_uri ->
  time_series_config:time_series_config ->
  forecast_horizon:forecast_horizon ->
  forecast_frequency:forecast_frequency ->
  unit ->
  time_series_forecasting_job_config

val make_throughput_config_description :
  ?provisioned_write_capacity_units:capacity_unit ->
  ?provisioned_read_capacity_units:capacity_unit ->
  throughput_mode:throughput_mode ->
  unit ->
  throughput_config_description

val make_throughput_config :
  ?provisioned_write_capacity_units:capacity_unit ->
  ?provisioned_read_capacity_units:capacity_unit ->
  throughput_mode:throughput_mode ->
  unit ->
  throughput_config

val make_text_generation_resolved_attributes :
  ?base_model_name:base_model_name -> unit -> text_generation_resolved_attributes

val make_text_generation_job_config :
  ?model_access_config:model_access_config ->
  ?text_generation_hyper_parameters:text_generation_hyper_parameters ->
  ?base_model_name:base_model_name ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  unit ->
  text_generation_job_config

val make_text_classification_job_config :
  ?completion_criteria:auto_ml_job_completion_criteria ->
  target_label_column:target_label_column ->
  content_column:content_column ->
  unit ->
  text_classification_job_config

val make_cfn_stack_parameter :
  ?value:cfn_stack_parameter_value -> key:cfn_stack_parameter_key -> unit -> cfn_stack_parameter

val make_cfn_stack_detail :
  ?id:cfn_stack_id ->
  ?name:cfn_stack_name ->
  status_message:cfn_stack_status_message ->
  unit ->
  cfn_stack_detail

val make_cfn_template_provider_detail :
  ?stack_detail:cfn_stack_detail ->
  ?parameters:cfn_stack_parameters ->
  ?role_ar_n:role_arn ->
  template_ur_l:cfn_template_ur_l ->
  template_name:cfn_template_name ->
  unit ->
  cfn_template_provider_detail

val make_template_provider_detail :
  ?cfn_template_provider_detail:cfn_template_provider_detail -> unit -> template_provider_detail

val make_predefined_metric_specification :
  ?predefined_metric_type:string_ -> unit -> predefined_metric_specification

val make_customized_metric_specification :
  ?statistic:statistic ->
  ?namespace:string_ ->
  ?metric_name:string_ ->
  unit ->
  customized_metric_specification

val make_target_tracking_scaling_policy_configuration :
  ?target_value:double ->
  ?metric_specification:metric_specification ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_target_platform :
  ?accelerator:target_platform_accelerator ->
  arch:target_platform_arch ->
  os:target_platform_os ->
  unit ->
  target_platform

val make_tabular_resolved_attributes :
  ?problem_type:problem_type -> unit -> tabular_resolved_attributes

val make_tabular_job_config :
  ?sample_weight_attribute_name:sample_weight_attribute_name ->
  ?problem_type:problem_type ->
  ?generate_candidate_definitions_only:generate_candidate_definitions_only ->
  ?mode:auto_ml_mode ->
  ?feature_specification_s3_uri:s3_uri ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?candidate_generation_config:candidate_generation_config ->
  target_attribute_name:target_attribute_name ->
  unit ->
  tabular_job_config

val make_property_name_query : property_name_hint:property_name_hint -> unit -> property_name_query
val make_suggestion_query : ?property_name_query:property_name_query -> unit -> suggestion_query

val make_subscribed_workteam :
  ?listing_id:string_ ->
  ?marketplace_description:string200 ->
  ?seller_name:string_ ->
  ?marketplace_title:string200 ->
  workteam_arn:workteam_arn ->
  unit ->
  subscribed_workteam

val make_studio_lifecycle_config_details :
  ?studio_lifecycle_config_app_type:studio_lifecycle_config_app_type ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?studio_lifecycle_config_name:studio_lifecycle_config_name ->
  ?studio_lifecycle_config_arn:studio_lifecycle_config_arn ->
  unit ->
  studio_lifecycle_config_details

val make_stop_transform_job_request :
  transform_job_name:transform_job_name -> unit -> stop_transform_job_request

val make_stop_training_job_request :
  training_job_name:training_job_name -> unit -> stop_training_job_request

val make_stop_processing_job_request :
  processing_job_name:processing_job_name -> unit -> stop_processing_job_request

val make_stop_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> stop_pipeline_execution_response

val make_stop_pipeline_execution_request :
  client_request_token:idempotency_token ->
  pipeline_execution_arn:pipeline_execution_arn ->
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
  job_category:job_category -> job_name:job_name -> unit -> stop_job_request

val make_stop_inference_recommendations_job_request :
  job_name:recommendation_job_name -> unit -> stop_inference_recommendations_job_request

val make_stop_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> stop_inference_experiment_response

val make_stop_inference_experiment_request :
  ?reason:inference_experiment_status_reason ->
  ?desired_state:inference_experiment_stop_desired_state ->
  ?desired_model_variants:model_variant_config_list ->
  model_variant_actions:model_variant_action_map ->
  name:inference_experiment_name ->
  unit ->
  stop_inference_experiment_request

val make_stop_hyper_parameter_tuning_job_request :
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  stop_hyper_parameter_tuning_job_request

val make_stop_edge_packaging_job_request :
  edge_packaging_job_name:entity_name -> unit -> stop_edge_packaging_job_request

val make_stop_edge_deployment_stage_request :
  stage_name:entity_name ->
  edge_deployment_plan_name:entity_name ->
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
  ?token_value:token_value ->
  ?stream_url:stream_url ->
  ?session_id:session_id ->
  unit ->
  start_session_response

val make_start_session_request :
  resource_identifier:resource_identifier -> unit -> start_session_request

val make_start_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> start_pipeline_execution_response

val make_parameter : value:string1024 -> name:pipeline_parameter_name -> unit -> parameter
val make_selected_step : step_name:string256 -> unit -> selected_step

val make_selective_execution_config :
  ?source_pipeline_execution_arn:pipeline_execution_arn ->
  selected_steps:selected_step_list ->
  unit ->
  selective_execution_config

val make_start_pipeline_execution_request :
  ?mlflow_experiment_name:mlflow_experiment_entity_name ->
  ?pipeline_version_id:pipeline_version_id ->
  ?selective_execution_config:selective_execution_config ->
  ?parallelism_configuration:parallelism_configuration ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_parameters:parameter_list ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  client_request_token:idempotency_token ->
  pipeline_name:pipeline_name_or_arn ->
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
  stage_name:entity_name ->
  edge_deployment_plan_name:entity_name ->
  unit ->
  start_edge_deployment_stage_request

val make_start_cluster_health_check_response :
  cluster_arn:cluster_arn -> unit -> start_cluster_health_check_response

val make_instance_group_health_check_configuration :
  ?instance_ids:instance_ids ->
  deep_health_checks:deep_health_checks ->
  instance_group_name:cluster_instance_group_name ->
  unit ->
  instance_group_health_check_configuration

val make_start_cluster_health_check_request :
  deep_health_check_configurations:deep_health_check_configurations ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  start_cluster_health_check_request

val make_space_sharing_settings_summary :
  ?sharing_type:sharing_type -> unit -> space_sharing_settings_summary

val make_space_sharing_settings : sharing_type:sharing_type -> unit -> space_sharing_settings

val make_space_settings_summary :
  ?space_storage_settings:space_storage_settings ->
  ?remote_access:feature_status ->
  ?app_type:app_type ->
  unit ->
  space_settings_summary

val make_ownership_settings_summary :
  ?owner_user_profile_name:user_profile_name -> unit -> ownership_settings_summary

val make_space_details :
  ?space_display_name:non_empty_string64 ->
  ?ownership_settings_summary:ownership_settings_summary ->
  ?space_sharing_settings_summary:space_sharing_settings_summary ->
  ?space_settings_summary:space_settings_summary ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?status:space_status ->
  ?space_name:space_name ->
  ?domain_id:domain_id ->
  unit ->
  space_details

val make_source_algorithm :
  ?model_data_e_tag:string_ ->
  ?model_data_source:model_data_source ->
  ?model_data_url:url ->
  algorithm_name:arn_or_name ->
  unit ->
  source_algorithm

val make_source_algorithm_specification :
  source_algorithms:source_algorithm_list -> unit -> source_algorithm_specification

val make_session_chaining_config :
  ?enable_session_tag_chaining:enable_session_tag_chaining -> unit -> session_chaining_config

val make_service_catalog_provisioning_details :
  ?provisioning_parameters:provisioning_parameters ->
  ?path_id:service_catalog_entity_id ->
  ?provisioning_artifact_id:service_catalog_entity_id ->
  product_id:service_catalog_entity_id ->
  unit ->
  service_catalog_provisioning_details

val make_service_catalog_provisioned_product_details :
  ?provisioned_product_status_message:provisioned_product_status_message ->
  ?provisioned_product_id:service_catalog_entity_id ->
  unit ->
  service_catalog_provisioned_product_details

val make_serverless_job_config :
  ?evaluator_arn:evaluator_arn ->
  ?evaluation_type:evaluation_type ->
  ?peft:peft ->
  ?customization_technique:customization_technique ->
  ?accept_eula:accept_eula ->
  job_type:serverless_job_type ->
  base_model_arn:serverless_job_base_model_arn ->
  unit ->
  serverless_job_config

val make_send_pipeline_execution_step_success_response :
  ?pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  send_pipeline_execution_step_success_response

val make_output_parameter : value:string1024 -> name:string256 -> unit -> output_parameter

val make_send_pipeline_execution_step_success_request :
  ?client_request_token:idempotency_token ->
  ?output_parameters:output_parameter_list ->
  callback_token:callback_token ->
  unit ->
  send_pipeline_execution_step_success_request

val make_send_pipeline_execution_step_failure_response :
  ?pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  send_pipeline_execution_step_failure_response

val make_send_pipeline_execution_step_failure_request :
  ?client_request_token:idempotency_token ->
  ?failure_reason:string256 ->
  callback_token:callback_token ->
  unit ->
  send_pipeline_execution_step_failure_request

val make_search_training_plan_offerings_response :
  ?training_plan_extension_offerings:training_plan_extension_offerings ->
  training_plan_offerings:training_plan_offerings ->
  unit ->
  search_training_plan_offerings_response

val make_search_training_plan_offerings_request :
  ?training_plan_arn:string_ ->
  ?target_resources:sage_maker_resource_names ->
  ?duration_hours:training_plan_duration_hours_input ->
  ?end_time_before:timestamp ->
  ?start_time_after:timestamp ->
  ?ultra_server_count:ultra_server_count ->
  ?ultra_server_type:ultra_server_type ->
  ?instance_count:reserved_capacity_instance_count ->
  ?instance_type:reserved_capacity_instance_type ->
  unit ->
  search_training_plan_offerings_request

val make_experiment_source :
  ?source_type:source_type -> source_arn:experiment_source_arn -> unit -> experiment_source

val make_experiment :
  ?tags:tag_list ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?description:experiment_description ->
  ?source:experiment_source ->
  ?display_name:experiment_entity_name ->
  ?experiment_arn:experiment_arn ->
  ?experiment_name:experiment_entity_name ->
  unit ->
  experiment

val make_deployed_image :
  ?resolution_time:timestamp ->
  ?resolved_image:container_image ->
  ?specified_image:container_image ->
  unit ->
  deployed_image

val make_instance_pool_summary :
  current_instance_count:task_count ->
  instance_type:production_variant_instance_type ->
  unit ->
  instance_pool_summary

val make_production_variant_status :
  ?start_time:timestamp ->
  ?status_message:variant_status_message ->
  status:variant_status ->
  unit ->
  production_variant_status

val make_production_variant_serverless_config :
  ?provisioned_concurrency:serverless_provisioned_concurrency ->
  max_concurrency:serverless_max_concurrency ->
  memory_size_in_m_b:serverless_memory_size_in_m_b ->
  unit ->
  production_variant_serverless_config

val make_production_variant_managed_instance_scaling_scale_in_policy :
  ?cooldown_in_minutes:managed_instance_scaling_cooldown_in_minutes ->
  ?maximum_step_size:managed_instance_scaling_maximum_step_size ->
  strategy:managed_instance_scaling_scale_in_strategy ->
  unit ->
  production_variant_managed_instance_scaling_scale_in_policy

val make_production_variant_managed_instance_scaling :
  ?scale_in_policy:production_variant_managed_instance_scaling_scale_in_policy ->
  ?max_instance_count:managed_instance_scaling_max_instance_count ->
  ?min_instance_count:managed_instance_scaling_min_instance_count ->
  ?status:managed_instance_scaling_status ->
  unit ->
  production_variant_managed_instance_scaling

val make_production_variant_routing_config :
  routing_strategy:routing_strategy -> unit -> production_variant_routing_config

val make_ec2_capacity_reservation :
  ?used_by_current_endpoint:task_count ->
  ?available_instance_count:task_count ->
  ?total_instance_count:task_count ->
  ?ec2_capacity_reservation_id:ec2_capacity_reservation_id ->
  unit ->
  ec2_capacity_reservation

val make_production_variant_capacity_reservation_summary :
  ?ec2_capacity_reservations:ec2_capacity_reservations_list ->
  ?used_by_current_endpoint:task_count ->
  ?available_instance_count:task_count ->
  ?total_instance_count:task_count ->
  ?capacity_reservation_preference:capacity_reservation_preference ->
  ?ml_reservation_arn:ml_reservation_arn ->
  unit ->
  production_variant_capacity_reservation_summary

val make_production_variant_summary :
  ?capacity_reservation_config:production_variant_capacity_reservation_summary ->
  ?routing_config:production_variant_routing_config ->
  ?managed_instance_scaling:production_variant_managed_instance_scaling ->
  ?desired_serverless_config:production_variant_serverless_config ->
  ?current_serverless_config:production_variant_serverless_config ->
  ?variant_status:production_variant_status_list ->
  ?instance_pools:instance_pool_summary_list ->
  ?desired_instance_count:task_count ->
  ?current_instance_count:task_count ->
  ?desired_weight:variant_weight ->
  ?current_weight:variant_weight ->
  ?deployed_images:deployed_images ->
  variant_name:variant_name ->
  unit ->
  production_variant_summary

val make_data_capture_config_summary :
  kms_key_id:kms_key_id ->
  destination_s3_uri:destination_s3_uri ->
  current_sampling_percentage:sampling_percentage ->
  capture_status:capture_status ->
  enable_capture:enable_capture ->
  unit ->
  data_capture_config_summary

val make_monitoring_execution_summary :
  ?monitoring_type:monitoring_type ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?failure_reason:failure_reason ->
  ?endpoint_name:endpoint_name ->
  ?processing_job_arn:processing_job_arn ->
  monitoring_execution_status:execution_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  scheduled_time:timestamp ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  monitoring_execution_summary

val make_monitoring_schedule :
  ?tags:tag_list ->
  ?last_monitoring_execution_summary:monitoring_execution_summary ->
  ?endpoint_name:endpoint_name ->
  ?monitoring_schedule_config:monitoring_schedule_config ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?monitoring_type:monitoring_type ->
  ?monitoring_schedule_status:schedule_status ->
  ?monitoring_schedule_name:monitoring_schedule_name ->
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  unit ->
  monitoring_schedule

val make_endpoint :
  ?shadow_production_variants:production_variant_summary_list ->
  ?tags:tag_list ->
  ?monitoring_schedules:monitoring_schedule_list ->
  ?failure_reason:failure_reason ->
  ?data_capture_config:data_capture_config_summary ->
  ?production_variants:production_variant_summary_list ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  endpoint_status:endpoint_status ->
  endpoint_config_name:endpoint_config_name ->
  endpoint_arn:endpoint_arn ->
  endpoint_name:endpoint_name ->
  unit ->
  endpoint

val make_model_package_validation_profile :
  transform_job_definition:transform_job_definition ->
  profile_name:entity_name ->
  unit ->
  model_package_validation_profile

val make_model_package_validation_specification :
  validation_profiles:model_package_validation_profiles ->
  validation_role:role_arn ->
  unit ->
  model_package_validation_specification

val make_model_package_status_item :
  ?failure_reason:string_ ->
  status:detailed_model_package_status ->
  name:entity_name ->
  unit ->
  model_package_status_item

val make_model_package_status_details :
  ?image_scan_statuses:model_package_status_item_list ->
  validation_statuses:model_package_status_item_list ->
  unit ->
  model_package_status_details

val make_metrics_source :
  ?content_digest:content_digest ->
  s3_uri:s3_uri ->
  content_type:content_type ->
  unit ->
  metrics_source

val make_model_quality :
  ?constraints:metrics_source -> ?statistics:metrics_source -> unit -> model_quality

val make_model_data_quality :
  ?constraints:metrics_source -> ?statistics:metrics_source -> unit -> model_data_quality

val make_bias :
  ?post_training_report:metrics_source ->
  ?pre_training_report:metrics_source ->
  ?report:metrics_source ->
  unit ->
  bias

val make_explainability : ?report:metrics_source -> unit -> explainability

val make_model_metrics :
  ?explainability:explainability ->
  ?bias:bias ->
  ?model_data_quality:model_data_quality ->
  ?model_quality:model_quality ->
  unit ->
  model_metrics

val make_model_package_security_config :
  kms_key_id:kms_key_id -> unit -> model_package_security_config

val make_file_source :
  ?content_digest:content_digest ->
  ?content_type:content_type ->
  s3_uri:s3_uri ->
  unit ->
  file_source

val make_drift_check_bias :
  ?post_training_constraints:metrics_source ->
  ?pre_training_constraints:metrics_source ->
  ?config_file:file_source ->
  unit ->
  drift_check_bias

val make_drift_check_explainability :
  ?config_file:file_source -> ?constraints:metrics_source -> unit -> drift_check_explainability

val make_drift_check_model_quality :
  ?constraints:metrics_source -> ?statistics:metrics_source -> unit -> drift_check_model_quality

val make_drift_check_model_data_quality :
  ?constraints:metrics_source ->
  ?statistics:metrics_source ->
  unit ->
  drift_check_model_data_quality

val make_drift_check_baselines :
  ?model_data_quality:drift_check_model_data_quality ->
  ?model_quality:drift_check_model_quality ->
  ?explainability:drift_check_explainability ->
  ?bias:drift_check_bias ->
  unit ->
  drift_check_baselines

val make_model_package :
  ?skip_model_validation:skip_model_validation ->
  ?drift_check_baselines:drift_check_baselines ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?tags:tag_list ->
  ?model_life_cycle:model_life_cycle ->
  ?model_card:model_package_model_card ->
  ?security_config:model_package_security_config ->
  ?source_uri:model_package_source_uri ->
  ?additional_inference_specifications:additional_inference_specifications ->
  ?sample_payload_url:string_ ->
  ?task:string_ ->
  ?domain:string_ ->
  ?approval_description:approval_description ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?model_metrics:model_metrics ->
  ?metadata_properties:metadata_properties ->
  ?created_by:user_context ->
  ?model_approval_status:model_approval_status ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?model_package_status_details:model_package_status_details ->
  ?model_package_status:model_package_status ->
  ?validation_specification:model_package_validation_specification ->
  ?source_algorithm_specification:source_algorithm_specification ->
  ?inference_specification:inference_specification ->
  ?creation_time:creation_time ->
  ?model_package_description:entity_description ->
  ?model_package_arn:model_package_arn ->
  ?model_package_registration_type:model_package_registration_type ->
  ?model_package_version:model_package_version ->
  ?model_package_group_name:entity_name ->
  ?model_package_name:entity_name ->
  unit ->
  model_package

val make_model_package_group :
  ?tags:tag_list ->
  ?model_package_group_status:model_package_group_status ->
  ?created_by:user_context ->
  ?creation_time:creation_time ->
  ?model_package_group_description:entity_description ->
  ?model_package_group_arn:model_package_group_arn ->
  ?model_package_group_name:entity_name ->
  unit ->
  model_package_group

val make_pipeline :
  ?tags:tag_list ->
  ?parallelism_configuration:parallelism_configuration ->
  ?last_modified_by:user_context ->
  ?created_by:user_context ->
  ?last_run_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?pipeline_status:pipeline_status ->
  ?role_arn:role_arn ->
  ?pipeline_description:pipeline_description ->
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_name:pipeline_name ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  pipeline

val make_pipeline_experiment_config :
  ?trial_name:experiment_entity_name ->
  ?experiment_name:experiment_entity_name ->
  unit ->
  pipeline_experiment_config

val make_pipeline_execution :
  ?pipeline_version_display_name:pipeline_version_name ->
  ?pipeline_version_id:pipeline_version_id ->
  ?pipeline_parameters:parameter_list ->
  ?selective_execution_config:selective_execution_config ->
  ?parallelism_configuration:parallelism_configuration ->
  ?last_modified_by:user_context ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?failure_reason:pipeline_execution_failure_reason ->
  ?pipeline_experiment_config:pipeline_experiment_config ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_execution_status:pipeline_execution_status ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_execution_arn:pipeline_execution_arn ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  pipeline_execution

val make_pipeline_version :
  ?last_executed_pipeline_execution_status:pipeline_execution_status ->
  ?last_executed_pipeline_execution_display_name:pipeline_execution_name ->
  ?last_executed_pipeline_execution_arn:pipeline_execution_arn ->
  ?last_modified_by:user_context ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?pipeline_version_description:pipeline_version_description ->
  ?pipeline_version_display_name:pipeline_version_name ->
  ?pipeline_version_id:pipeline_version_id ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  pipeline_version

val make_online_store_security_config :
  ?kms_key_id:kms_key_id -> unit -> online_store_security_config

val make_online_store_config :
  ?storage_type:storage_type ->
  ?ttl_duration:ttl_duration ->
  ?enable_online_store:boolean_ ->
  ?security_config:online_store_security_config ->
  unit ->
  online_store_config

val make_s3_storage_config :
  ?resolved_output_s3_uri:s3_uri ->
  ?kms_key_id:kms_key_id ->
  s3_uri:s3_uri ->
  unit ->
  s3_storage_config

val make_data_catalog_config :
  database:database -> catalog:catalog -> table_name:table_name -> unit -> data_catalog_config

val make_offline_store_config :
  ?table_format:table_format ->
  ?data_catalog_config:data_catalog_config ->
  ?disable_glue_table_creation:boolean_ ->
  s3_storage_config:s3_storage_config ->
  unit ->
  offline_store_config

val make_offline_store_status :
  ?blocked_reason:blocked_reason ->
  status:offline_store_status_value ->
  unit ->
  offline_store_status

val make_last_update_status :
  ?failure_reason:failure_reason -> status:last_update_status_value -> unit -> last_update_status

val make_feature_group :
  ?tags:tag_list ->
  ?description:description ->
  ?failure_reason:failure_reason ->
  ?last_update_status:last_update_status ->
  ?offline_store_status:offline_store_status ->
  ?feature_group_status:feature_group_status ->
  ?role_arn:role_arn ->
  ?offline_store_config:offline_store_config ->
  ?online_store_config:online_store_config ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?feature_definitions:feature_definitions ->
  ?event_time_feature_name:feature_name ->
  ?record_identifier_feature_name:feature_name ->
  ?feature_group_name:feature_group_name ->
  ?feature_group_arn:feature_group_arn ->
  unit ->
  feature_group

val make_feature_metadata :
  ?parameters:feature_parameters ->
  ?description:feature_description ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?feature_type:feature_type ->
  ?feature_name:feature_name ->
  ?feature_group_name:feature_group_name ->
  ?feature_group_arn:feature_group_arn ->
  unit ->
  feature_metadata

val make_project :
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?tags:tag_list ->
  ?template_provider_details:template_provider_detail_list ->
  ?creation_time:timestamp ->
  ?created_by:user_context ->
  ?project_status:project_status ->
  ?service_catalog_provisioned_product_details:service_catalog_provisioned_product_details ->
  ?service_catalog_provisioning_details:service_catalog_provisioning_details ->
  ?project_description:entity_description ->
  ?project_id:project_id ->
  ?project_name:project_entity_name ->
  ?project_arn:project_arn ->
  unit ->
  project

val make_hyperband_strategy_config :
  ?max_resource:hyperband_strategy_max_resource ->
  ?min_resource:hyperband_strategy_min_resource ->
  unit ->
  hyperband_strategy_config

val make_hyper_parameter_tuning_job_strategy_config :
  ?hyperband_strategy_config:hyperband_strategy_config ->
  unit ->
  hyper_parameter_tuning_job_strategy_config

val make_resource_limits :
  ?max_runtime_in_seconds:hyper_parameter_tuning_max_runtime_in_seconds ->
  ?max_number_of_training_jobs:max_number_of_training_jobs ->
  max_parallel_training_jobs:max_parallel_training_jobs ->
  unit ->
  resource_limits

val make_integer_parameter_range :
  ?scaling_type:hyper_parameter_scaling_type ->
  max_value:parameter_value ->
  min_value:parameter_value ->
  name:parameter_key ->
  unit ->
  integer_parameter_range

val make_continuous_parameter_range :
  ?scaling_type:hyper_parameter_scaling_type ->
  max_value:parameter_value ->
  min_value:parameter_value ->
  name:parameter_key ->
  unit ->
  continuous_parameter_range

val make_categorical_parameter_range :
  values:parameter_values -> name:parameter_key -> unit -> categorical_parameter_range

val make_auto_parameter : value_hint:parameter_value -> name:parameter_key -> unit -> auto_parameter

val make_parameter_ranges :
  ?auto_parameters:auto_parameters ->
  ?categorical_parameter_ranges:categorical_parameter_ranges ->
  ?continuous_parameter_ranges:continuous_parameter_ranges ->
  ?integer_parameter_ranges:integer_parameter_ranges ->
  unit ->
  parameter_ranges

val make_hyper_parameter_tuning_job_config :
  ?random_seed:random_seed ->
  ?tuning_job_completion_criteria:tuning_job_completion_criteria ->
  ?training_job_early_stopping_type:training_job_early_stopping_type ->
  ?parameter_ranges:parameter_ranges ->
  ?hyper_parameter_tuning_job_objective:hyper_parameter_tuning_job_objective ->
  ?strategy_config:hyper_parameter_tuning_job_strategy_config ->
  resource_limits:resource_limits ->
  strategy:hyper_parameter_tuning_job_strategy_type ->
  unit ->
  hyper_parameter_tuning_job_config

val make_hyper_parameter_algorithm_specification :
  ?metric_definitions:metric_definition_list ->
  ?algorithm_name:arn_or_name ->
  ?training_image:algorithm_image ->
  training_input_mode:training_input_mode ->
  unit ->
  hyper_parameter_algorithm_specification

val make_hyper_parameter_tuning_instance_config :
  volume_size_in_g_b:volume_size_in_g_b ->
  instance_count:training_instance_count ->
  instance_type:training_instance_type ->
  unit ->
  hyper_parameter_tuning_instance_config

val make_hyper_parameter_tuning_resource_config :
  ?instance_configs:hyper_parameter_tuning_instance_configs ->
  ?allocation_strategy:hyper_parameter_tuning_allocation_strategy ->
  ?volume_kms_key_id:kms_key_id ->
  ?volume_size_in_g_b:optional_volume_size_in_g_b ->
  ?instance_count:training_instance_count ->
  ?instance_type:training_instance_type ->
  unit ->
  hyper_parameter_tuning_resource_config

val make_hyper_parameter_training_job_definition :
  ?environment:hyper_parameter_training_job_environment_map ->
  ?retry_strategy:retry_strategy ->
  ?checkpoint_config:checkpoint_config ->
  ?enable_managed_spot_training:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_network_isolation:boolean_ ->
  ?hyper_parameter_tuning_resource_config:hyper_parameter_tuning_resource_config ->
  ?resource_config:resource_config ->
  ?vpc_config:vpc_config ->
  ?input_data_config:input_data_config ->
  ?static_hyper_parameters:hyper_parameters ->
  ?hyper_parameter_ranges:parameter_ranges ->
  ?tuning_objective:hyper_parameter_tuning_job_objective ->
  ?definition_name:hyper_parameter_training_job_definition_name ->
  stopping_condition:stopping_condition ->
  output_data_config:output_data_config ->
  role_arn:role_arn ->
  algorithm_specification:hyper_parameter_algorithm_specification ->
  unit ->
  hyper_parameter_training_job_definition

val make_objective_status_counters :
  ?failed:objective_status_counter ->
  ?pending:objective_status_counter ->
  ?succeeded:objective_status_counter ->
  unit ->
  objective_status_counters

val make_final_hyper_parameter_tuning_job_objective_metric :
  ?type_:hyper_parameter_tuning_job_objective_type ->
  value:metric_value ->
  metric_name:metric_name ->
  unit ->
  final_hyper_parameter_tuning_job_objective_metric

val make_hyper_parameter_training_job_summary :
  ?objective_status:objective_status ->
  ?final_hyper_parameter_tuning_job_objective_metric:
    final_hyper_parameter_tuning_job_objective_metric ->
  ?failure_reason:failure_reason ->
  ?training_end_time:timestamp ->
  ?training_start_time:timestamp ->
  ?tuning_job_name:hyper_parameter_tuning_job_name ->
  ?training_job_definition_name:hyper_parameter_training_job_definition_name ->
  tuned_hyper_parameters:hyper_parameters ->
  training_job_status:training_job_status ->
  creation_time:timestamp ->
  training_job_arn:training_job_arn ->
  training_job_name:training_job_name ->
  unit ->
  hyper_parameter_training_job_summary

val make_parent_hyper_parameter_tuning_job :
  ?hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  parent_hyper_parameter_tuning_job

val make_hyper_parameter_tuning_job_warm_start_config :
  warm_start_type:hyper_parameter_tuning_job_warm_start_type ->
  parent_hyper_parameter_tuning_jobs:parent_hyper_parameter_tuning_jobs ->
  unit ->
  hyper_parameter_tuning_job_warm_start_config

val make_hyper_parameter_tuning_job_completion_details :
  ?convergence_detected_time:timestamp ->
  ?number_of_training_jobs_objective_not_improving:integer ->
  unit ->
  hyper_parameter_tuning_job_completion_details

val make_hyper_parameter_tuning_job_consumed_resources :
  ?runtime_in_seconds:integer -> unit -> hyper_parameter_tuning_job_consumed_resources

val make_hyper_parameter_tuning_job_search_entity :
  ?tags:tag_list ->
  ?consumed_resources:hyper_parameter_tuning_job_consumed_resources ->
  ?tuning_job_completion_details:hyper_parameter_tuning_job_completion_details ->
  ?failure_reason:failure_reason ->
  ?warm_start_config:hyper_parameter_tuning_job_warm_start_config ->
  ?overall_best_training_job:hyper_parameter_training_job_summary ->
  ?best_training_job:hyper_parameter_training_job_summary ->
  ?objective_status_counters:objective_status_counters ->
  ?training_job_status_counters:training_job_status_counters ->
  ?last_modified_time:timestamp ->
  ?hyper_parameter_tuning_end_time:timestamp ->
  ?creation_time:timestamp ->
  ?hyper_parameter_tuning_job_status:hyper_parameter_tuning_job_status ->
  ?training_job_definitions:hyper_parameter_training_job_definitions ->
  ?training_job_definition:hyper_parameter_training_job_definition ->
  ?hyper_parameter_tuning_job_config:hyper_parameter_tuning_job_config ->
  ?hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  ?hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  hyper_parameter_tuning_job_search_entity

val make_model_card_security_config : ?kms_key_id:kms_key_id -> unit -> model_card_security_config

val make_model_card :
  ?model_package_group_name:string_ ->
  ?risk_rating:string_ ->
  ?model_id:string_ ->
  ?tags:tag_list ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?security_config:model_card_security_config ->
  ?model_card_status:model_card_status ->
  ?content:model_card_content ->
  ?model_card_version:integer ->
  ?model_card_name:entity_name ->
  ?model_card_arn:model_card_arn ->
  unit ->
  model_card

val make_repository_auth_config :
  repository_credentials_provider_arn:repository_credentials_provider_arn ->
  unit ->
  repository_auth_config

val make_image_config :
  ?repository_auth_config:repository_auth_config ->
  repository_access_mode:repository_access_mode ->
  unit ->
  image_config

val make_multi_model_config : ?model_cache_setting:model_cache_setting -> unit -> multi_model_config

val make_container_definition :
  ?container_metrics_config:container_metrics_config ->
  ?multi_model_config:multi_model_config ->
  ?inference_specification_name:inference_specification_name ->
  ?model_package_name:versioned_arn_or_name ->
  ?environment:environment_map ->
  ?additional_model_data_sources:additional_model_data_sources ->
  ?model_data_source:model_data_source ->
  ?model_data_url:url ->
  ?mode:container_mode ->
  ?image_config:image_config ->
  ?image:container_image ->
  ?container_hostname:container_hostname ->
  unit ->
  container_definition

val make_inference_execution_config :
  mode:inference_execution_mode -> unit -> inference_execution_config

val make_real_time_inference_recommendation :
  ?environment:environment_map ->
  instance_type:production_variant_instance_type ->
  recommendation_id:string_ ->
  unit ->
  real_time_inference_recommendation

val make_deployment_recommendation :
  ?real_time_inference_recommendations:real_time_inference_recommendations ->
  recommendation_status:recommendation_status ->
  unit ->
  deployment_recommendation

val make_model :
  ?deployment_recommendation:deployment_recommendation ->
  ?tags:tag_list ->
  ?enable_network_isolation:boolean_ ->
  ?model_arn:model_arn ->
  ?creation_time:timestamp ->
  ?vpc_config:vpc_config ->
  ?execution_role_arn:role_arn ->
  ?inference_execution_config:inference_execution_config ->
  ?containers:container_definition_list ->
  ?primary_container:container_definition ->
  ?model_name:model_name ->
  unit ->
  model

val make_model_dashboard_endpoint :
  endpoint_status:endpoint_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  endpoint_arn:endpoint_arn ->
  endpoint_name:endpoint_name ->
  unit ->
  model_dashboard_endpoint

val make_model_dashboard_indicator_action :
  ?enabled:boolean_ -> unit -> model_dashboard_indicator_action

val make_monitoring_alert_actions :
  ?model_dashboard_indicator:model_dashboard_indicator_action -> unit -> monitoring_alert_actions

val make_monitoring_alert_summary :
  actions:monitoring_alert_actions ->
  evaluation_period:monitoring_evaluation_period ->
  datapoints_to_alert:monitoring_datapoints_to_alert ->
  alert_status:monitoring_alert_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  monitoring_alert_name:monitoring_alert_name ->
  unit ->
  monitoring_alert_summary

val make_model_dashboard_monitoring_schedule :
  ?batch_transform_input:batch_transform_input ->
  ?last_monitoring_execution_summary:monitoring_execution_summary ->
  ?monitoring_alert_summaries:monitoring_alert_summary_list ->
  ?endpoint_name:endpoint_name ->
  ?monitoring_schedule_config:monitoring_schedule_config ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?monitoring_type:monitoring_type ->
  ?monitoring_schedule_status:schedule_status ->
  ?monitoring_schedule_name:monitoring_schedule_name ->
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  unit ->
  model_dashboard_monitoring_schedule

val make_model_dashboard_model_card :
  ?risk_rating:string_ ->
  ?model_id:string_ ->
  ?tags:tag_list ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?security_config:model_card_security_config ->
  ?model_card_status:model_card_status ->
  ?model_card_version:integer ->
  ?model_card_name:entity_name ->
  ?model_card_arn:model_card_arn ->
  unit ->
  model_dashboard_model_card

val make_model_dashboard_model :
  ?model_card:model_dashboard_model_card ->
  ?monitoring_schedules:model_dashboard_monitoring_schedules ->
  ?last_batch_transform_job:transform_job ->
  ?endpoints:model_dashboard_endpoints ->
  ?model:model ->
  unit ->
  model_dashboard_model

val make_job_secondary_status_transition :
  ?status_message:string_ ->
  ?end_time:timestamp ->
  start_time:timestamp ->
  status:job_secondary_status ->
  unit ->
  job_secondary_status_transition

val make_job :
  ?tags:tag_list ->
  ?failure_reason:failure_reason ->
  ?secondary_status_transitions:job_secondary_status_transitions ->
  ?secondary_status:job_secondary_status ->
  ?job_status:job_status ->
  ?end_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?job_config_document:job_config_document ->
  ?job_config_schema_version:job_schema_version ->
  ?job_category:job_category ->
  ?role_arn:role_arn ->
  ?job_arn:job_arn ->
  ?job_name:job_name ->
  unit ->
  job

val make_search_record :
  ?job:job ->
  ?model:model_dashboard_model ->
  ?model_card:model_card ->
  ?hyper_parameter_tuning_job:hyper_parameter_tuning_job_search_entity ->
  ?project:project ->
  ?feature_metadata:feature_metadata ->
  ?feature_group:feature_group ->
  ?pipeline_version:pipeline_version ->
  ?pipeline_execution:pipeline_execution ->
  ?pipeline:pipeline ->
  ?model_package_group:model_package_group ->
  ?model_package:model_package ->
  ?endpoint:endpoint ->
  ?trial_component:trial_component ->
  ?trial:trial ->
  ?experiment:experiment ->
  ?training_job:training_job ->
  unit ->
  search_record

val make_search_response :
  ?total_hits:total_hits ->
  ?next_token:next_token ->
  ?results:search_results_list ->
  unit ->
  search_response

val make_filter :
  ?value:filter_value -> ?operator:operator -> name:resource_property_name -> unit -> filter

val make_nested_filters :
  filters:filter_list -> nested_property_name:resource_property_name -> unit -> nested_filters

val make_search_expression :
  ?operator:boolean_operator ->
  ?sub_expressions:search_expression_list ->
  ?nested_filters:nested_filters_list ->
  ?filters:filter_list ->
  unit ->
  search_expression

val make_search_request :
  ?visibility_conditions:visibility_conditions_list ->
  ?cross_account_filter_option:cross_account_filter_option ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:search_sort_order ->
  ?sort_by:resource_property_name ->
  ?search_expression:search_expression ->
  resource:resource_type ->
  unit ->
  search_request

val make_scaling_policy_objective :
  ?max_invocations_per_minute:integer ->
  ?min_invocations_per_minute:integer ->
  unit ->
  scaling_policy_objective

val make_scaling_policy_metric :
  ?model_latency:integer -> ?invocations_per_instance:integer -> unit -> scaling_policy_metric

val make_retry_pipeline_execution_response :
  ?pipeline_execution_arn:pipeline_execution_arn -> unit -> retry_pipeline_execution_response

val make_retry_pipeline_execution_request :
  ?parallelism_configuration:parallelism_configuration ->
  client_request_token:idempotency_token ->
  pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  retry_pipeline_execution_request

val make_rendering_error : message:string_ -> code:string_ -> unit -> rendering_error

val make_render_ui_template_response :
  errors:rendering_error_list -> rendered_content:string_ -> unit -> render_ui_template_response

val make_renderable_task : input:task_input -> unit -> renderable_task

val make_render_ui_template_request :
  ?human_task_ui_arn:human_task_ui_arn ->
  ?ui_template:ui_template ->
  role_arn:role_arn ->
  task:renderable_task ->
  unit ->
  render_ui_template_request

val make_register_devices_request :
  ?tags:tag_list ->
  devices:devices ->
  device_fleet_name:entity_name ->
  unit ->
  register_devices_request

val make_edge :
  ?association_type:association_edge_type ->
  ?destination_arn:association_entity_arn ->
  ?source_arn:association_entity_arn ->
  unit ->
  edge

val make_query_lineage_response :
  ?next_token:string8192 -> ?edges:edges -> ?vertices:vertices -> unit -> query_lineage_response

val make_query_filters :
  ?properties:query_properties ->
  ?modified_after:timestamp ->
  ?modified_before:timestamp ->
  ?created_after:timestamp ->
  ?created_before:timestamp ->
  ?lineage_types:query_lineage_types ->
  ?types:query_types ->
  unit ->
  query_filters

val make_query_lineage_request :
  ?next_token:string8192 ->
  ?max_results:query_lineage_max_results ->
  ?max_depth:query_lineage_max_depth ->
  ?filters:query_filters ->
  ?include_edges:boolean_ ->
  ?direction:direction ->
  ?start_arns:query_lineage_start_arns ->
  unit ->
  query_lineage_request

val make_put_model_package_group_policy_output :
  model_package_group_arn:model_package_group_arn -> unit -> put_model_package_group_policy_output

val make_put_model_package_group_policy_input :
  resource_policy:policy_string ->
  model_package_group_name:entity_name ->
  unit ->
  put_model_package_group_policy_input

val make_list_workteams_response :
  ?next_token:next_token -> workteams:workteams -> unit -> list_workteams_response

val make_list_workteams_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:workteam_name ->
  ?sort_order:sort_order ->
  ?sort_by:list_workteams_sort_by_options ->
  unit ->
  list_workteams_request

val make_list_workforces_response :
  ?next_token:next_token -> workforces:workforces -> unit -> list_workforces_response

val make_list_workforces_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:workforce_name ->
  ?sort_order:sort_order ->
  ?sort_by:list_workforces_sort_by_options ->
  unit ->
  list_workforces_request

val make_list_user_profiles_response :
  ?next_token:next_token -> ?user_profiles:user_profile_list -> unit -> list_user_profiles_response

val make_list_user_profiles_request :
  ?user_profile_name_contains:user_profile_name ->
  ?domain_id_equals:domain_id ->
  ?sort_by:user_profile_sort_key ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_user_profiles_request

val make_list_ultra_servers_by_reserved_capacity_response :
  ?next_token:next_token ->
  ultra_servers:ultra_servers ->
  unit ->
  list_ultra_servers_by_reserved_capacity_response

val make_list_ultra_servers_by_reserved_capacity_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  reserved_capacity_arn:reserved_capacity_arn ->
  unit ->
  list_ultra_servers_by_reserved_capacity_request

val make_list_trials_response :
  ?next_token:next_token -> ?trial_summaries:trial_summaries -> unit -> list_trials_response

val make_list_trials_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:sort_trials_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?trial_component_name:experiment_entity_name ->
  ?experiment_name:experiment_entity_name ->
  unit ->
  list_trials_request

val make_list_trial_components_response :
  ?next_token:next_token ->
  ?trial_component_summaries:trial_component_summaries ->
  unit ->
  list_trial_components_response

val make_list_trial_components_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:sort_trial_components_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?source_arn:string256 ->
  ?trial_name:experiment_entity_name ->
  ?experiment_name:experiment_entity_name ->
  unit ->
  list_trial_components_request

val make_list_transform_jobs_response :
  ?next_token:next_token ->
  transform_job_summaries:transform_job_summaries ->
  unit ->
  list_transform_jobs_response

val make_list_transform_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?status_equals:transform_job_status ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_transform_jobs_request

val make_list_training_plans_response :
  ?next_token:next_token ->
  training_plan_summaries:training_plan_summaries ->
  unit ->
  list_training_plans_response

val make_list_training_plans_request :
  ?filters:training_plan_filters ->
  ?sort_order:training_plan_sort_order ->
  ?sort_by:training_plan_sort_by ->
  ?start_time_before:timestamp ->
  ?start_time_after:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_training_plans_request

val make_list_training_jobs_for_hyper_parameter_tuning_job_response :
  ?next_token:next_token ->
  training_job_summaries:hyper_parameter_training_job_summaries ->
  unit ->
  list_training_jobs_for_hyper_parameter_tuning_job_response

val make_list_training_jobs_for_hyper_parameter_tuning_job_request :
  ?sort_order:sort_order ->
  ?sort_by:training_job_sort_by_options ->
  ?status_equals:training_job_status ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  list_training_jobs_for_hyper_parameter_tuning_job_request

val make_list_training_jobs_response :
  ?next_token:next_token ->
  training_job_summaries:training_job_summaries ->
  unit ->
  list_training_jobs_response

val make_list_training_jobs_request :
  ?training_plan_arn_equals:training_plan_arn ->
  ?warm_pool_status_equals:warm_pool_resource_status ->
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?status_equals:training_job_status ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_training_jobs_request

val make_list_tags_output : ?next_token:next_token -> ?tags:tag_list -> unit -> list_tags_output

val make_list_tags_input :
  ?max_results:list_tags_max_results ->
  ?next_token:next_token ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_input

val make_list_subscribed_workteams_response :
  ?next_token:next_token ->
  subscribed_workteams:subscribed_workteams ->
  unit ->
  list_subscribed_workteams_response

val make_list_subscribed_workteams_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?name_contains:workteam_name ->
  unit ->
  list_subscribed_workteams_request

val make_list_studio_lifecycle_configs_response :
  ?studio_lifecycle_configs:studio_lifecycle_configs_list ->
  ?next_token:next_token ->
  unit ->
  list_studio_lifecycle_configs_response

val make_list_studio_lifecycle_configs_request :
  ?sort_order:sort_order ->
  ?sort_by:studio_lifecycle_config_sort_key ->
  ?modified_time_after:timestamp ->
  ?modified_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?app_type_equals:studio_lifecycle_config_app_type ->
  ?name_contains:studio_lifecycle_config_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_studio_lifecycle_configs_request

val make_device_deployment_summary :
  ?deployment_start_time:timestamp ->
  ?description:device_description ->
  ?device_deployment_status_message:string_ ->
  ?device_deployment_status:device_deployment_status ->
  ?device_fleet_name:entity_name ->
  ?deployed_stage_name:entity_name ->
  device_arn:device_arn ->
  device_name:device_name ->
  stage_name:entity_name ->
  edge_deployment_plan_name:entity_name ->
  edge_deployment_plan_arn:edge_deployment_plan_arn ->
  unit ->
  device_deployment_summary

val make_list_stage_devices_response :
  ?next_token:next_token ->
  device_deployment_summaries:device_deployment_summaries ->
  unit ->
  list_stage_devices_response

val make_list_stage_devices_request :
  ?exclude_devices_deployed_in_other_stage:boolean_ ->
  ?max_results:list_max_results ->
  ?next_token:next_token ->
  stage_name:entity_name ->
  edge_deployment_plan_name:entity_name ->
  unit ->
  list_stage_devices_request

val make_list_spaces_response :
  ?next_token:next_token -> ?spaces:space_list -> unit -> list_spaces_response

val make_list_spaces_request :
  ?space_name_contains:space_name ->
  ?domain_id_equals:domain_id ->
  ?sort_by:space_sort_key ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_spaces_request

val make_resource_catalog :
  creation_time:timestamp ->
  description:resource_catalog_description ->
  resource_catalog_name:resource_catalog_name ->
  resource_catalog_arn:resource_catalog_arn ->
  unit ->
  resource_catalog

val make_list_resource_catalogs_response :
  ?next_token:next_token ->
  ?resource_catalogs:resource_catalog_list ->
  unit ->
  list_resource_catalogs_response

val make_list_resource_catalogs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_by:resource_catalog_sort_by ->
  ?sort_order:resource_catalog_sort_order ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?name_contains:resource_catalog_name ->
  unit ->
  list_resource_catalogs_request

val make_project_summary :
  ?project_description:entity_description ->
  project_status:project_status ->
  creation_time:timestamp ->
  project_id:project_id ->
  project_arn:project_arn ->
  project_name:project_entity_name ->
  unit ->
  project_summary

val make_list_projects_output :
  ?next_token:next_token ->
  project_summary_list:project_summary_list ->
  unit ->
  list_projects_output

val make_list_projects_input :
  ?sort_order:project_sort_order ->
  ?sort_by:project_sort_by ->
  ?next_token:next_token ->
  ?name_contains:project_entity_name ->
  ?max_results:max_results ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_projects_input

val make_processing_job_summary :
  ?exit_message:exit_message ->
  ?failure_reason:failure_reason ->
  ?last_modified_time:timestamp ->
  ?processing_end_time:timestamp ->
  processing_job_status:processing_job_status ->
  creation_time:timestamp ->
  processing_job_arn:processing_job_arn ->
  processing_job_name:processing_job_name ->
  unit ->
  processing_job_summary

val make_list_processing_jobs_response :
  ?next_token:next_token ->
  processing_job_summaries:processing_job_summaries ->
  unit ->
  list_processing_jobs_response

val make_list_processing_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?status_equals:processing_job_status ->
  ?name_contains:string_ ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_processing_jobs_request

val make_pipeline_version_summary :
  ?last_execution_pipeline_execution_arn:pipeline_execution_arn ->
  ?pipeline_version_display_name:pipeline_version_name ->
  ?pipeline_version_description:pipeline_version_description ->
  ?creation_time:timestamp ->
  ?pipeline_version_id:pipeline_version_id ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  pipeline_version_summary

val make_list_pipeline_versions_response :
  ?next_token:next_token ->
  ?pipeline_version_summaries:pipeline_version_summary_list ->
  unit ->
  list_pipeline_versions_response

val make_list_pipeline_versions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  pipeline_name:pipeline_name_or_arn ->
  unit ->
  list_pipeline_versions_request

val make_pipeline_summary :
  ?last_execution_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?role_arn:role_arn ->
  ?pipeline_description:pipeline_description ->
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_name:pipeline_name ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  pipeline_summary

val make_list_pipelines_response :
  ?next_token:next_token ->
  ?pipeline_summaries:pipeline_summary_list ->
  unit ->
  list_pipelines_response

val make_list_pipelines_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_pipelines_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?pipeline_name_prefix:pipeline_name ->
  unit ->
  list_pipelines_request

val make_list_pipeline_parameters_for_execution_response :
  ?next_token:next_token ->
  ?pipeline_parameters:parameter_list ->
  unit ->
  list_pipeline_parameters_for_execution_response

val make_list_pipeline_parameters_for_execution_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  list_pipeline_parameters_for_execution_request

val make_processing_job_step_metadata :
  ?arn:processing_job_arn -> unit -> processing_job_step_metadata

val make_model_step_metadata : ?arn:string256 -> unit -> model_step_metadata
val make_register_model_step_metadata : ?arn:string256 -> unit -> register_model_step_metadata
val make_condition_step_metadata : ?outcome:condition_outcome -> unit -> condition_step_metadata

val make_callback_step_metadata :
  ?output_parameters:output_parameter_list ->
  ?sqs_queue_url:string256 ->
  ?callback_token:callback_token ->
  unit ->
  callback_step_metadata

val make_lambda_step_metadata :
  ?output_parameters:output_parameter_list -> ?arn:string256 -> unit -> lambda_step_metadata

val make_emr_step_metadata :
  ?log_file_path:string1024 ->
  ?step_name:string256 ->
  ?step_id:string256 ->
  ?cluster_id:string256 ->
  unit ->
  emr_step_metadata

val make_quality_check_step_metadata :
  ?register_new_baseline:boolean_ ->
  ?skip_check:boolean_ ->
  ?check_job_arn:string256 ->
  ?violation_report:string1024 ->
  ?model_package_group_name:string256 ->
  ?calculated_baseline_constraints:string1024 ->
  ?calculated_baseline_statistics:string1024 ->
  ?baseline_used_for_drift_check_constraints:string1024 ->
  ?baseline_used_for_drift_check_statistics:string1024 ->
  ?check_type:string256 ->
  unit ->
  quality_check_step_metadata

val make_clarify_check_step_metadata :
  ?register_new_baseline:boolean_ ->
  ?skip_check:boolean_ ->
  ?check_job_arn:string256 ->
  ?violation_report:string1024 ->
  ?model_package_group_name:string256 ->
  ?calculated_baseline_constraints:string1024 ->
  ?baseline_used_for_drift_check_constraints:string1024 ->
  ?check_type:string256 ->
  unit ->
  clarify_check_step_metadata

val make_fail_step_metadata : ?error_message:string3072 -> unit -> fail_step_metadata
val make_auto_ml_job_step_metadata : ?arn:auto_ml_job_arn -> unit -> auto_ml_job_step_metadata
val make_endpoint_step_metadata : ?arn:endpoint_arn -> unit -> endpoint_step_metadata

val make_endpoint_config_step_metadata :
  ?arn:endpoint_config_arn -> unit -> endpoint_config_step_metadata

val make_bedrock_custom_model_metadata : ?arn:string1024 -> unit -> bedrock_custom_model_metadata

val make_bedrock_custom_model_deployment_metadata :
  ?arn:string1024 -> unit -> bedrock_custom_model_deployment_metadata

val make_bedrock_provisioned_model_throughput_metadata :
  ?arn:string1024 -> unit -> bedrock_provisioned_model_throughput_metadata

val make_bedrock_model_import_metadata : ?arn:string1024 -> unit -> bedrock_model_import_metadata
val make_inference_component_metadata : ?arn:string2048 -> unit -> inference_component_metadata

val make_association_info :
  destination_arn:string2048 -> source_arn:string2048 -> unit -> association_info

val make_lineage_metadata :
  ?associations:association_info_list ->
  ?context_arns:map_string2048 ->
  ?artifact_arns:map_string2048 ->
  ?action_arns:map_string2048 ->
  unit ->
  lineage_metadata

val make_job_step_metadata : ?arn:string1024 -> unit -> job_step_metadata

val make_pipeline_execution_step_metadata :
  ?job:job_step_metadata ->
  ?lineage:lineage_metadata ->
  ?inference_component:inference_component_metadata ->
  ?bedrock_model_import:bedrock_model_import_metadata ->
  ?bedrock_provisioned_model_throughput:bedrock_provisioned_model_throughput_metadata ->
  ?bedrock_custom_model_deployment:bedrock_custom_model_deployment_metadata ->
  ?bedrock_custom_model:bedrock_custom_model_metadata ->
  ?endpoint_config:endpoint_config_step_metadata ->
  ?endpoint:endpoint_step_metadata ->
  ?auto_ml_job:auto_ml_job_step_metadata ->
  ?fail:fail_step_metadata ->
  ?clarify_check:clarify_check_step_metadata ->
  ?quality_check:quality_check_step_metadata ->
  ?em_r:emr_step_metadata ->
  ?lambda:lambda_step_metadata ->
  ?callback:callback_step_metadata ->
  ?condition:condition_step_metadata ->
  ?register_model:register_model_step_metadata ->
  ?model:model_step_metadata ->
  ?tuning_job:tuning_job_step_meta_data ->
  ?transform_job:transform_job_step_metadata ->
  ?processing_job:processing_job_step_metadata ->
  ?training_job:training_job_step_metadata ->
  unit ->
  pipeline_execution_step_metadata

val make_pipeline_execution_step :
  ?selective_execution_result:selective_execution_result ->
  ?attempt_count:integer ->
  ?metadata:pipeline_execution_step_metadata ->
  ?failure_reason:failure_reason ->
  ?cache_hit_result:cache_hit_result ->
  ?step_status:step_status ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?step_description:step_description ->
  ?step_display_name:step_display_name ->
  ?step_name:step_name ->
  unit ->
  pipeline_execution_step

val make_list_pipeline_execution_steps_response :
  ?next_token:next_token ->
  ?pipeline_execution_steps:pipeline_execution_step_list ->
  unit ->
  list_pipeline_execution_steps_response

val make_list_pipeline_execution_steps_request :
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  list_pipeline_execution_steps_request

val make_pipeline_execution_summary :
  ?pipeline_execution_failure_reason:string3072 ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_execution_status:pipeline_execution_status ->
  ?start_time:timestamp ->
  ?pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  pipeline_execution_summary

val make_list_pipeline_executions_response :
  ?next_token:next_token ->
  ?pipeline_execution_summaries:pipeline_execution_summary_list ->
  unit ->
  list_pipeline_executions_response

val make_list_pipeline_executions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_pipeline_executions_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  pipeline_name:pipeline_name_or_arn ->
  unit ->
  list_pipeline_executions_request

val make_partner_app_summary :
  ?creation_time:timestamp ->
  ?status:partner_app_status ->
  ?type_:partner_app_type ->
  ?name:partner_app_name ->
  ?arn:partner_app_arn ->
  unit ->
  partner_app_summary

val make_list_partner_apps_response :
  ?next_token:next_token -> ?summaries:partner_app_summaries -> unit -> list_partner_apps_response

val make_list_partner_apps_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_partner_apps_request

val make_optimization_job_summary :
  ?max_instance_count:optimization_job_max_instance_count ->
  ?last_modified_time:last_modified_time ->
  ?optimization_end_time:timestamp ->
  ?optimization_start_time:timestamp ->
  optimization_types:optimization_types ->
  deployment_instance_type:optimization_job_deployment_instance_type ->
  optimization_job_status:optimization_job_status ->
  creation_time:creation_time ->
  optimization_job_arn:optimization_job_arn ->
  optimization_job_name:entity_name ->
  unit ->
  optimization_job_summary

val make_list_optimization_jobs_response :
  ?next_token:next_token ->
  optimization_job_summaries:optimization_job_summaries ->
  unit ->
  list_optimization_jobs_response

val make_list_optimization_jobs_request :
  ?sort_order:sort_order ->
  ?sort_by:list_optimization_jobs_sort_by ->
  ?status_equals:optimization_job_status ->
  ?name_contains:name_contains ->
  ?optimization_contains:name_contains ->
  ?last_modified_time_before:last_modified_time ->
  ?last_modified_time_after:last_modified_time ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_optimization_jobs_request

val make_notebook_instance_summary :
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  ?default_code_repository:code_repository_name_or_url ->
  ?notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?instance_type:instance_type ->
  ?url:notebook_instance_url ->
  ?notebook_instance_status:notebook_instance_status ->
  notebook_instance_arn:notebook_instance_arn ->
  notebook_instance_name:notebook_instance_name ->
  unit ->
  notebook_instance_summary

val make_list_notebook_instances_output :
  ?notebook_instances:notebook_instance_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_notebook_instances_output

val make_list_notebook_instances_input :
  ?additional_code_repository_equals:code_repository_name_or_url ->
  ?default_code_repository_contains:code_repository_contains ->
  ?notebook_instance_lifecycle_config_name_contains:notebook_instance_lifecycle_config_name ->
  ?status_equals:notebook_instance_status ->
  ?last_modified_time_after:last_modified_time ->
  ?last_modified_time_before:last_modified_time ->
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?name_contains:notebook_instance_name_contains ->
  ?sort_order:notebook_instance_sort_order ->
  ?sort_by:notebook_instance_sort_key ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_notebook_instances_input

val make_notebook_instance_lifecycle_config_summary :
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  notebook_instance_lifecycle_config_arn:notebook_instance_lifecycle_config_arn ->
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  notebook_instance_lifecycle_config_summary

val make_list_notebook_instance_lifecycle_configs_output :
  ?notebook_instance_lifecycle_configs:notebook_instance_lifecycle_config_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_notebook_instance_lifecycle_configs_output

val make_list_notebook_instance_lifecycle_configs_input :
  ?last_modified_time_after:last_modified_time ->
  ?last_modified_time_before:last_modified_time ->
  ?creation_time_after:creation_time ->
  ?creation_time_before:creation_time ->
  ?name_contains:notebook_instance_lifecycle_config_name_contains ->
  ?sort_order:notebook_instance_lifecycle_config_sort_order ->
  ?sort_by:notebook_instance_lifecycle_config_sort_key ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_notebook_instance_lifecycle_configs_input

val make_monitoring_schedule_summary :
  ?monitoring_type:monitoring_type ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?endpoint_name:endpoint_name ->
  monitoring_schedule_status:schedule_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  monitoring_schedule_arn:monitoring_schedule_arn ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  monitoring_schedule_summary

val make_list_monitoring_schedules_response :
  ?next_token:next_token ->
  monitoring_schedule_summaries:monitoring_schedule_summary_list ->
  unit ->
  list_monitoring_schedules_response

val make_list_monitoring_schedules_request :
  ?monitoring_type_equals:monitoring_type ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?status_equals:schedule_status ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:monitoring_schedule_sort_key ->
  ?endpoint_name:endpoint_name ->
  unit ->
  list_monitoring_schedules_request

val make_list_monitoring_executions_response :
  ?next_token:next_token ->
  monitoring_execution_summaries:monitoring_execution_summary_list ->
  unit ->
  list_monitoring_executions_response

val make_list_monitoring_executions_request :
  ?monitoring_type_equals:monitoring_type ->
  ?monitoring_job_definition_name:monitoring_job_definition_name ->
  ?status_equals:execution_status ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?scheduled_time_after:timestamp ->
  ?scheduled_time_before:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:monitoring_execution_sort_key ->
  ?endpoint_name:endpoint_name ->
  ?monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  list_monitoring_executions_request

val make_list_monitoring_alerts_response :
  ?next_token:next_token ->
  ?monitoring_alert_summaries:monitoring_alert_summary_list ->
  unit ->
  list_monitoring_alerts_response

val make_list_monitoring_alerts_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  list_monitoring_alerts_request

val make_monitoring_alert_history_summary :
  alert_status:monitoring_alert_status ->
  creation_time:timestamp ->
  monitoring_alert_name:monitoring_alert_name ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  monitoring_alert_history_summary

val make_list_monitoring_alert_history_response :
  ?next_token:next_token ->
  ?monitoring_alert_history:monitoring_alert_history_list ->
  unit ->
  list_monitoring_alert_history_response

val make_list_monitoring_alert_history_request :
  ?status_equals:monitoring_alert_status ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:monitoring_alert_history_sort_key ->
  ?monitoring_alert_name:monitoring_alert_name ->
  ?monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  list_monitoring_alert_history_request

val make_model_summary :
  creation_time:timestamp -> model_arn:model_arn -> model_name:model_name -> unit -> model_summary

val make_list_models_output :
  ?next_token:pagination_token -> models:model_summary_list -> unit -> list_models_output

val make_list_models_input :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:model_name_contains ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_order:order_key ->
  ?sort_by:model_sort_key ->
  unit ->
  list_models_input

val make_monitoring_job_definition_summary :
  endpoint_name:endpoint_name ->
  creation_time:timestamp ->
  monitoring_job_definition_arn:monitoring_job_definition_arn ->
  monitoring_job_definition_name:monitoring_job_definition_name ->
  unit ->
  monitoring_job_definition_summary

val make_list_model_quality_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_model_quality_job_definitions_response

val make_list_model_quality_job_definitions_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?endpoint_name:endpoint_name ->
  unit ->
  list_model_quality_job_definitions_request

val make_model_package_summary :
  ?model_package_registration_type:model_package_registration_type ->
  ?model_life_cycle:model_life_cycle ->
  ?model_approval_status:model_approval_status ->
  ?model_package_description:entity_description ->
  ?model_package_version:model_package_version ->
  ?model_package_group_name:entity_name ->
  ?model_package_name:entity_name ->
  model_package_status:model_package_status ->
  creation_time:creation_time ->
  model_package_arn:model_package_arn ->
  unit ->
  model_package_summary

val make_list_model_packages_output :
  ?next_token:next_token ->
  model_package_summary_list:model_package_summary_list ->
  unit ->
  list_model_packages_output

val make_list_model_packages_input :
  ?sort_order:sort_order ->
  ?sort_by:model_package_sort_by ->
  ?next_token:next_token ->
  ?model_package_type:model_package_type ->
  ?model_package_group_name:arn_or_name ->
  ?model_approval_status:model_approval_status ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  unit ->
  list_model_packages_input

val make_managed_configuration :
  ?managed_storage_type:managed_storage_type -> unit -> managed_configuration

val make_model_package_group_summary :
  ?managed_configuration:managed_configuration ->
  ?model_package_group_description:entity_description ->
  model_package_group_status:model_package_group_status ->
  creation_time:creation_time ->
  model_package_group_arn:model_package_group_arn ->
  model_package_group_name:entity_name ->
  unit ->
  model_package_group_summary

val make_list_model_package_groups_output :
  ?next_token:next_token ->
  model_package_group_summary_list:model_package_group_summary_list ->
  unit ->
  list_model_package_groups_output

val make_list_model_package_groups_input :
  ?cross_account_filter_option:cross_account_filter_option ->
  ?sort_order:sort_order ->
  ?sort_by:model_package_group_sort_by ->
  ?next_token:next_token ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  unit ->
  list_model_package_groups_input

val make_model_metadata_summary :
  framework_version:string_ ->
  model:string_ ->
  task:string_ ->
  framework:string_ ->
  domain:string_ ->
  unit ->
  model_metadata_summary

val make_list_model_metadata_response :
  ?next_token:next_token ->
  model_metadata_summaries:model_metadata_summaries ->
  unit ->
  list_model_metadata_response

val make_model_metadata_filter :
  value:string256 -> name:model_metadata_filter_type -> unit -> model_metadata_filter

val make_model_metadata_search_expression :
  ?filters:model_metadata_filters -> unit -> model_metadata_search_expression

val make_list_model_metadata_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?search_expression:model_metadata_search_expression ->
  unit ->
  list_model_metadata_request

val make_list_model_explainability_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_model_explainability_job_definitions_response

val make_list_model_explainability_job_definitions_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?endpoint_name:endpoint_name ->
  unit ->
  list_model_explainability_job_definitions_request

val make_model_card_version_summary :
  ?last_modified_time:timestamp ->
  creation_time:timestamp ->
  model_card_version:integer ->
  model_card_status:model_card_status ->
  model_card_arn:model_card_arn ->
  model_card_name:entity_name ->
  unit ->
  model_card_version_summary

val make_list_model_card_versions_response :
  ?next_token:next_token ->
  model_card_version_summary_list:model_card_version_summary_list ->
  unit ->
  list_model_card_versions_response

val make_list_model_card_versions_request :
  ?sort_order:model_card_sort_order ->
  ?sort_by:model_card_version_sort_by ->
  ?next_token:next_token ->
  ?model_card_status:model_card_status ->
  ?max_results:max_results ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  model_card_name:model_card_name_or_arn ->
  unit ->
  list_model_card_versions_request

val make_model_card_summary :
  ?last_modified_time:timestamp ->
  creation_time:timestamp ->
  model_card_status:model_card_status ->
  model_card_arn:model_card_arn ->
  model_card_name:entity_name ->
  unit ->
  model_card_summary

val make_list_model_cards_response :
  ?next_token:next_token ->
  model_card_summaries:model_card_summary_list ->
  unit ->
  list_model_cards_response

val make_list_model_cards_request :
  ?sort_order:model_card_sort_order ->
  ?sort_by:model_card_sort_by ->
  ?next_token:next_token ->
  ?model_card_status:model_card_status ->
  ?name_contains:entity_name ->
  ?max_results:max_results ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_model_cards_request

val make_model_card_export_job_summary :
  last_modified_at:timestamp ->
  created_at:timestamp ->
  model_card_version:integer ->
  model_card_name:entity_name ->
  status:model_card_export_job_status ->
  model_card_export_job_arn:model_card_export_job_arn ->
  model_card_export_job_name:entity_name ->
  unit ->
  model_card_export_job_summary

val make_list_model_card_export_jobs_response :
  ?next_token:next_token ->
  model_card_export_job_summaries:model_card_export_job_summary_list ->
  unit ->
  list_model_card_export_jobs_response

val make_list_model_card_export_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:model_card_export_job_sort_order ->
  ?sort_by:model_card_export_job_sort_by ->
  ?status_equals:model_card_export_job_status ->
  ?model_card_export_job_name_contains:entity_name ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?model_card_version:integer ->
  model_card_name:entity_name ->
  unit ->
  list_model_card_export_jobs_request

val make_list_model_bias_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_model_bias_job_definitions_response

val make_list_model_bias_job_definitions_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?endpoint_name:endpoint_name ->
  unit ->
  list_model_bias_job_definitions_request

val make_list_mlflow_tracking_servers_response :
  ?next_token:next_token ->
  ?tracking_server_summaries:tracking_server_summary_list ->
  unit ->
  list_mlflow_tracking_servers_response

val make_list_mlflow_tracking_servers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_tracking_server_by ->
  ?mlflow_version:mlflow_version ->
  ?tracking_server_status:tracking_server_status ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  unit ->
  list_mlflow_tracking_servers_request

val make_mlflow_app_summary :
  ?mlflow_version:mlflow_version ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:mlflow_app_status ->
  ?name:mlflow_app_name ->
  ?arn:mlflow_app_arn ->
  unit ->
  mlflow_app_summary

val make_list_mlflow_apps_response :
  ?next_token:next_token -> ?summaries:mlflow_app_summaries -> unit -> list_mlflow_apps_response

val make_list_mlflow_apps_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_mlflow_app_by ->
  ?account_default_status:account_default_status ->
  ?default_for_domain_id:string_ ->
  ?mlflow_version:mlflow_version ->
  ?status:mlflow_app_status ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  unit ->
  list_mlflow_apps_request

val make_lineage_group_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?display_name:experiment_entity_name ->
  ?lineage_group_name:experiment_entity_name ->
  ?lineage_group_arn:lineage_group_arn ->
  unit ->
  lineage_group_summary

val make_list_lineage_groups_response :
  ?next_token:next_token ->
  ?lineage_group_summaries:lineage_group_summaries ->
  unit ->
  list_lineage_groups_response

val make_list_lineage_groups_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_lineage_groups_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  unit ->
  list_lineage_groups_request

val make_label_counters_for_workteam :
  ?total:label_counter ->
  ?pending_human:label_counter ->
  ?human_labeled:label_counter ->
  unit ->
  label_counters_for_workteam

val make_labeling_job_for_workteam_summary :
  ?number_of_human_workers_per_data_object:number_of_human_workers_per_data_object ->
  ?label_counters:label_counters_for_workteam ->
  ?labeling_job_name:labeling_job_name ->
  creation_time:timestamp ->
  work_requester_account_id:account_id ->
  job_reference_code:job_reference_code ->
  unit ->
  labeling_job_for_workteam_summary

val make_list_labeling_jobs_for_workteam_response :
  ?next_token:next_token ->
  labeling_job_summary_list:labeling_job_for_workteam_summary_list ->
  unit ->
  list_labeling_jobs_for_workteam_response

val make_list_labeling_jobs_for_workteam_request :
  ?sort_order:sort_order ->
  ?sort_by:list_labeling_jobs_for_workteam_sort_by_options ->
  ?job_reference_code_contains:job_reference_code_contains ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  workteam_arn:workteam_arn ->
  unit ->
  list_labeling_jobs_for_workteam_request

val make_label_counters :
  ?unlabeled:label_counter ->
  ?failed_non_retryable_error:label_counter ->
  ?machine_labeled:label_counter ->
  ?human_labeled:label_counter ->
  ?total_labeled:label_counter ->
  unit ->
  label_counters

val make_labeling_job_output :
  ?final_active_learning_model_arn:model_arn ->
  output_dataset_s3_uri:s3_uri ->
  unit ->
  labeling_job_output

val make_labeling_job_s3_data_source : manifest_s3_uri:s3_uri -> unit -> labeling_job_s3_data_source

val make_labeling_job_sns_data_source :
  sns_topic_arn:sns_topic_arn -> unit -> labeling_job_sns_data_source

val make_labeling_job_data_source :
  ?sns_data_source:labeling_job_sns_data_source ->
  ?s3_data_source:labeling_job_s3_data_source ->
  unit ->
  labeling_job_data_source

val make_labeling_job_data_attributes :
  ?content_classifiers:content_classifiers -> unit -> labeling_job_data_attributes

val make_labeling_job_input_config :
  ?data_attributes:labeling_job_data_attributes ->
  data_source:labeling_job_data_source ->
  unit ->
  labeling_job_input_config

val make_labeling_job_summary :
  ?input_config:labeling_job_input_config ->
  ?labeling_job_output:labeling_job_output ->
  ?failure_reason:failure_reason ->
  ?annotation_consolidation_lambda_arn:lambda_function_arn ->
  ?pre_human_task_lambda_arn:lambda_function_arn ->
  workteam_arn:workteam_arn ->
  label_counters:label_counters ->
  labeling_job_status:labeling_job_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  labeling_job_arn:labeling_job_arn ->
  labeling_job_name:labeling_job_name ->
  unit ->
  labeling_job_summary

val make_list_labeling_jobs_response :
  ?next_token:next_token ->
  ?labeling_job_summary_list:labeling_job_summary_list ->
  unit ->
  list_labeling_jobs_response

val make_list_labeling_jobs_request :
  ?status_equals:labeling_job_status ->
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?name_contains:name_contains ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_labeling_jobs_request

val make_job_config_schema_version_summary :
  job_config_schema_version:job_schema_version -> unit -> job_config_schema_version_summary

val make_list_job_schema_versions_response :
  ?next_token:next_token ->
  job_config_schemas:job_config_schemas ->
  unit ->
  list_job_schema_versions_response

val make_list_job_schema_versions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  job_category:job_category ->
  unit ->
  list_job_schema_versions_request

val make_job_summary :
  ?end_time:timestamp ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  job_secondary_status:job_secondary_status ->
  job_status:job_status ->
  job_category:job_category ->
  job_name:job_name ->
  job_arn:job_arn ->
  unit ->
  job_summary

val make_list_jobs_response :
  ?next_token:next_token -> job_summaries:job_summaries -> unit -> list_jobs_response

val make_list_jobs_request :
  ?status_equals:job_status ->
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  job_category:job_category ->
  unit ->
  list_jobs_request

val make_recommendation_metrics :
  ?model_setup_time:model_setup_time ->
  ?memory_utilization:utilization_metric ->
  ?cpu_utilization:utilization_metric ->
  ?model_latency:integer ->
  ?max_invocations:integer ->
  ?cost_per_inference:float_ ->
  ?cost_per_hour:float_ ->
  unit ->
  recommendation_metrics

val make_inference_metrics :
  model_latency:integer -> max_invocations:integer -> unit -> inference_metrics

val make_endpoint_output_configuration :
  ?serverless_config:production_variant_serverless_config ->
  ?initial_instance_count:initial_instance_count ->
  ?instance_type:production_variant_instance_type ->
  variant_name:string_ ->
  endpoint_name:string_ ->
  unit ->
  endpoint_output_configuration

val make_environment_parameter :
  value:string_ -> value_type:string_ -> key:string_ -> unit -> environment_parameter

val make_model_configuration :
  ?compilation_job_name:recommendation_job_compilation_job_name ->
  ?environment_parameters:environment_parameters ->
  ?inference_specification_name:inference_specification_name ->
  unit ->
  model_configuration

val make_recommendation_job_inference_benchmark :
  ?invocation_start_time:invocation_start_time ->
  ?invocation_end_time:invocation_end_time ->
  ?failure_reason:recommendation_failure_reason ->
  ?endpoint_configuration:endpoint_output_configuration ->
  ?endpoint_metrics:inference_metrics ->
  ?metrics:recommendation_metrics ->
  model_configuration:model_configuration ->
  unit ->
  recommendation_job_inference_benchmark

val make_inference_recommendations_job_step :
  ?inference_benchmark:recommendation_job_inference_benchmark ->
  status:recommendation_job_status ->
  job_name:recommendation_job_name ->
  step_type:recommendation_step_type ->
  unit ->
  inference_recommendations_job_step

val make_list_inference_recommendations_job_steps_response :
  ?next_token:next_token ->
  ?steps:inference_recommendations_job_steps ->
  unit ->
  list_inference_recommendations_job_steps_response

val make_list_inference_recommendations_job_steps_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?step_type:recommendation_step_type ->
  ?status:recommendation_job_status ->
  job_name:recommendation_job_name ->
  unit ->
  list_inference_recommendations_job_steps_request

val make_inference_recommendations_job :
  ?model_package_version_arn:model_package_arn ->
  ?sample_payload_url:s3_uri ->
  ?model_name:model_name ->
  ?failure_reason:failure_reason ->
  ?completion_time:timestamp ->
  last_modified_time:last_modified_time ->
  role_arn:role_arn ->
  creation_time:creation_time ->
  status:recommendation_job_status ->
  job_arn:recommendation_job_arn ->
  job_type:recommendation_job_type ->
  job_description:recommendation_job_description ->
  job_name:recommendation_job_name ->
  unit ->
  inference_recommendations_job

val make_list_inference_recommendations_jobs_response :
  ?next_token:next_token ->
  inference_recommendations_jobs:inference_recommendations_jobs ->
  unit ->
  list_inference_recommendations_jobs_response

val make_list_inference_recommendations_jobs_request :
  ?model_package_version_arn_equals:model_package_arn ->
  ?model_name_equals:model_name ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:list_inference_recommendations_jobs_sort_by ->
  ?status_equals:recommendation_job_status ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:last_modified_time ->
  ?last_modified_time_after:last_modified_time ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  unit ->
  list_inference_recommendations_jobs_request

val make_inference_experiment_summary :
  ?role_arn:role_arn ->
  ?completion_time:timestamp ->
  ?description:inference_experiment_description ->
  ?status_reason:inference_experiment_status_reason ->
  ?schedule:inference_experiment_schedule ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  status:inference_experiment_status ->
  type_:inference_experiment_type ->
  name:inference_experiment_name ->
  unit ->
  inference_experiment_summary

val make_list_inference_experiments_response :
  ?next_token:next_token ->
  ?inference_experiments:inference_experiment_list ->
  unit ->
  list_inference_experiments_response

val make_list_inference_experiments_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_inference_experiments_by ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?status_equals:inference_experiment_status ->
  ?type_:inference_experiment_type ->
  ?name_contains:name_contains ->
  unit ->
  list_inference_experiments_request

val make_inference_component_summary :
  ?inference_component_status:inference_component_status ->
  last_modified_time:timestamp ->
  variant_name:variant_name ->
  endpoint_name:endpoint_name ->
  endpoint_arn:endpoint_arn ->
  inference_component_name:inference_component_name ->
  inference_component_arn:inference_component_arn ->
  creation_time:timestamp ->
  unit ->
  inference_component_summary

val make_list_inference_components_output :
  ?next_token:pagination_token ->
  inference_components:inference_component_summary_list ->
  unit ->
  list_inference_components_output

val make_list_inference_components_input :
  ?variant_name_equals:variant_name ->
  ?endpoint_name_equals:endpoint_name ->
  ?status_equals:inference_component_status ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:inference_component_name_contains ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_order:order_key ->
  ?sort_by:inference_component_sort_key ->
  unit ->
  list_inference_components_input

val make_image_version :
  ?failure_reason:failure_reason ->
  version:image_version_number ->
  last_modified_time:timestamp ->
  image_version_status:image_version_status ->
  image_version_arn:image_version_arn ->
  image_arn:image_arn ->
  creation_time:timestamp ->
  unit ->
  image_version

val make_list_image_versions_response :
  ?next_token:next_token -> ?image_versions:image_versions -> unit -> list_image_versions_response

val make_list_image_versions_request :
  ?sort_order:image_version_sort_order ->
  ?sort_by:image_version_sort_by ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  image_name:image_name ->
  unit ->
  list_image_versions_request

val make_image :
  ?failure_reason:failure_reason ->
  ?display_name:image_display_name ->
  ?description:image_description ->
  last_modified_time:timestamp ->
  image_status:image_status ->
  image_name:image_name ->
  image_arn:image_arn ->
  creation_time:timestamp ->
  unit ->
  image

val make_list_images_response :
  ?next_token:next_token -> ?images:images -> unit -> list_images_response

val make_list_images_request :
  ?sort_order:image_sort_order ->
  ?sort_by:image_sort_by ->
  ?next_token:next_token ->
  ?name_contains:image_name_contains ->
  ?max_results:max_results ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_images_request

val make_hyper_parameter_tuning_job_summary :
  ?resource_limits:resource_limits ->
  ?last_modified_time:timestamp ->
  ?hyper_parameter_tuning_end_time:timestamp ->
  objective_status_counters:objective_status_counters ->
  training_job_status_counters:training_job_status_counters ->
  creation_time:timestamp ->
  strategy:hyper_parameter_tuning_job_strategy_type ->
  hyper_parameter_tuning_job_status:hyper_parameter_tuning_job_status ->
  hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  hyper_parameter_tuning_job_summary

val make_list_hyper_parameter_tuning_jobs_response :
  ?next_token:next_token ->
  hyper_parameter_tuning_job_summaries:hyper_parameter_tuning_job_summaries ->
  unit ->
  list_hyper_parameter_tuning_jobs_response

val make_list_hyper_parameter_tuning_jobs_request :
  ?status_equals:hyper_parameter_tuning_job_status ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?name_contains:name_contains ->
  ?sort_order:sort_order ->
  ?sort_by:hyper_parameter_tuning_job_sort_by_options ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_hyper_parameter_tuning_jobs_request

val make_human_task_ui_summary :
  creation_time:timestamp ->
  human_task_ui_arn:human_task_ui_arn ->
  human_task_ui_name:human_task_ui_name ->
  unit ->
  human_task_ui_summary

val make_list_human_task_uis_response :
  ?next_token:next_token ->
  human_task_ui_summaries:human_task_ui_summaries ->
  unit ->
  list_human_task_uis_response

val make_list_human_task_uis_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_human_task_uis_request

val make_hub_info :
  ?hub_search_keywords:hub_search_keyword_list ->
  ?hub_description:hub_description ->
  ?hub_display_name:hub_display_name ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  hub_status:hub_status ->
  hub_arn:hub_arn ->
  hub_name:hub_name ->
  unit ->
  hub_info

val make_list_hubs_response :
  ?next_token:next_token -> hub_summaries:hub_info_list -> unit -> list_hubs_response

val make_list_hubs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:hub_sort_by ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:name_contains ->
  unit ->
  list_hubs_request

val make_hub_content_info :
  ?original_creation_time:timestamp ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?support_status:hub_content_support_status ->
  ?hub_content_description:hub_content_description ->
  ?hub_content_display_name:hub_content_display_name ->
  ?sage_maker_public_hub_content_arn:sage_maker_public_hub_content_arn ->
  creation_time:timestamp ->
  hub_content_status:hub_content_status ->
  document_schema_version:document_schema_version ->
  hub_content_type:hub_content_type ->
  hub_content_version:hub_content_version ->
  hub_content_arn:hub_content_arn ->
  hub_content_name:hub_content_name ->
  unit ->
  hub_content_info

val make_list_hub_content_versions_response :
  ?next_token:next_token ->
  hub_content_summaries:hub_content_info_list ->
  unit ->
  list_hub_content_versions_response

val make_list_hub_content_versions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:hub_content_sort_by ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?max_schema_version:document_schema_version ->
  ?min_version:hub_content_version ->
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  hub_name:hub_name_or_arn ->
  unit ->
  list_hub_content_versions_request

val make_list_hub_contents_response :
  ?next_token:next_token ->
  hub_content_summaries:hub_content_info_list ->
  unit ->
  list_hub_contents_response

val make_list_hub_contents_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?sort_order:sort_order ->
  ?sort_by:hub_content_sort_by ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?max_schema_version:document_schema_version ->
  ?name_contains:name_contains ->
  hub_content_type:hub_content_type ->
  hub_name:hub_name_or_arn ->
  unit ->
  list_hub_contents_request

val make_flow_definition_summary :
  ?failure_reason:failure_reason ->
  creation_time:timestamp ->
  flow_definition_status:flow_definition_status ->
  flow_definition_arn:flow_definition_arn ->
  flow_definition_name:flow_definition_name ->
  unit ->
  flow_definition_summary

val make_list_flow_definitions_response :
  ?next_token:next_token ->
  flow_definition_summaries:flow_definition_summaries ->
  unit ->
  list_flow_definitions_response

val make_list_flow_definitions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_flow_definitions_request

val make_feature_group_summary :
  ?offline_store_status:offline_store_status ->
  ?feature_group_status:feature_group_status ->
  creation_time:timestamp ->
  feature_group_arn:feature_group_arn ->
  feature_group_name:feature_group_name ->
  unit ->
  feature_group_summary

val make_list_feature_groups_response :
  ?next_token:next_token ->
  feature_group_summaries:feature_group_summaries ->
  unit ->
  list_feature_groups_response

val make_list_feature_groups_request :
  ?next_token:next_token ->
  ?max_results:feature_group_max_results ->
  ?sort_by:feature_group_sort_by ->
  ?sort_order:feature_group_sort_order ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  ?offline_store_status_equals:offline_store_status_value ->
  ?feature_group_status_equals:feature_group_status ->
  ?name_contains:feature_group_name_contains ->
  unit ->
  list_feature_groups_request

val make_experiment_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?experiment_source:experiment_source ->
  ?display_name:experiment_entity_name ->
  ?experiment_name:experiment_entity_name ->
  ?experiment_arn:experiment_arn ->
  unit ->
  experiment_summary

val make_list_experiments_response :
  ?next_token:next_token ->
  ?experiment_summaries:experiment_summaries ->
  unit ->
  list_experiments_response

val make_list_experiments_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_experiments_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  unit ->
  list_experiments_request

val make_endpoint_summary :
  endpoint_status:endpoint_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  endpoint_arn:endpoint_arn ->
  endpoint_name:endpoint_name ->
  unit ->
  endpoint_summary

val make_list_endpoints_output :
  ?next_token:pagination_token -> endpoints:endpoint_summary_list -> unit -> list_endpoints_output

val make_list_endpoints_input :
  ?status_equals:endpoint_status ->
  ?last_modified_time_after:timestamp ->
  ?last_modified_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:endpoint_name_contains ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_order:order_key ->
  ?sort_by:endpoint_sort_key ->
  unit ->
  list_endpoints_input

val make_endpoint_config_summary :
  creation_time:timestamp ->
  endpoint_config_arn:endpoint_config_arn ->
  endpoint_config_name:endpoint_config_name ->
  unit ->
  endpoint_config_summary

val make_list_endpoint_configs_output :
  ?next_token:pagination_token ->
  endpoint_configs:endpoint_config_summary_list ->
  unit ->
  list_endpoint_configs_output

val make_list_endpoint_configs_input :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:endpoint_config_name_contains ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?sort_order:order_key ->
  ?sort_by:endpoint_config_sort_key ->
  unit ->
  list_endpoint_configs_input

val make_edge_packaging_job_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?model_version:edge_version ->
  ?model_name:entity_name ->
  ?compilation_job_name:entity_name ->
  edge_packaging_job_status:edge_packaging_job_status ->
  edge_packaging_job_name:entity_name ->
  edge_packaging_job_arn:edge_packaging_job_arn ->
  unit ->
  edge_packaging_job_summary

val make_list_edge_packaging_jobs_response :
  ?next_token:next_token ->
  edge_packaging_job_summaries:edge_packaging_job_summaries ->
  unit ->
  list_edge_packaging_jobs_response

val make_list_edge_packaging_jobs_request :
  ?sort_order:sort_order ->
  ?sort_by:list_edge_packaging_jobs_sort_by ->
  ?status_equals:edge_packaging_job_status ->
  ?model_name_contains:name_contains ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?max_results:list_max_results ->
  ?next_token:next_token ->
  unit ->
  list_edge_packaging_jobs_request

val make_edge_deployment_plan_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  edge_deployment_failed:integer ->
  edge_deployment_pending:integer ->
  edge_deployment_success:integer ->
  device_fleet_name:entity_name ->
  edge_deployment_plan_name:entity_name ->
  edge_deployment_plan_arn:edge_deployment_plan_arn ->
  unit ->
  edge_deployment_plan_summary

val make_list_edge_deployment_plans_response :
  ?next_token:next_token ->
  edge_deployment_plan_summaries:edge_deployment_plan_summaries ->
  unit ->
  list_edge_deployment_plans_response

val make_list_edge_deployment_plans_request :
  ?sort_order:sort_order ->
  ?sort_by:list_edge_deployment_plans_sort_by ->
  ?device_fleet_name_contains:name_contains ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?max_results:list_max_results ->
  ?next_token:next_token ->
  unit ->
  list_edge_deployment_plans_request

val make_domain_details :
  ?url:string1024 ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?status:domain_status ->
  ?domain_name:domain_name ->
  ?domain_id:domain_id ->
  ?domain_arn:domain_arn ->
  unit ->
  domain_details

val make_list_domains_response :
  ?next_token:next_token -> ?domains:domain_list -> unit -> list_domains_response

val make_list_domains_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_domains_request

val make_edge_model_summary :
  model_version:edge_version -> model_name:entity_name -> unit -> edge_model_summary

val make_device_summary :
  ?agent_version:edge_version ->
  ?models:edge_model_summaries ->
  ?latest_heartbeat:timestamp ->
  ?registration_time:timestamp ->
  ?iot_thing_name:thing_name ->
  ?device_fleet_name:entity_name ->
  ?description:device_description ->
  device_arn:device_arn ->
  device_name:entity_name ->
  unit ->
  device_summary

val make_list_devices_response :
  ?next_token:next_token -> device_summaries:device_summaries -> unit -> list_devices_response

val make_list_devices_request :
  ?device_fleet_name:entity_name ->
  ?model_name:entity_name ->
  ?latest_heartbeat_after:timestamp ->
  ?max_results:list_max_results ->
  ?next_token:next_token ->
  unit ->
  list_devices_request

val make_device_fleet_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  device_fleet_name:entity_name ->
  device_fleet_arn:device_fleet_arn ->
  unit ->
  device_fleet_summary

val make_list_device_fleets_response :
  ?next_token:next_token ->
  device_fleet_summaries:device_fleet_summaries ->
  unit ->
  list_device_fleets_response

val make_list_device_fleets_request :
  ?sort_order:sort_order ->
  ?sort_by:list_device_fleets_sort_by ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?max_results:list_max_results ->
  ?next_token:next_token ->
  unit ->
  list_device_fleets_request

val make_list_data_quality_job_definitions_response :
  ?next_token:next_token ->
  job_definition_summaries:monitoring_job_definition_summary_list ->
  unit ->
  list_data_quality_job_definitions_response

val make_list_data_quality_job_definitions_request :
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:monitoring_job_definition_sort_key ->
  ?endpoint_name:endpoint_name ->
  unit ->
  list_data_quality_job_definitions_request

val make_context_source :
  ?source_id:string256 -> ?source_type:string256 -> source_uri:source_uri -> unit -> context_source

val make_context_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?context_type:string256 ->
  ?source:context_source ->
  ?context_name:context_name ->
  ?context_arn:context_arn ->
  unit ->
  context_summary

val make_list_contexts_response :
  ?next_token:next_token -> ?context_summaries:context_summaries -> unit -> list_contexts_response

val make_list_contexts_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_contexts_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?context_type:string256 ->
  ?source_uri:source_uri ->
  unit ->
  list_contexts_request

val make_compute_quota_summary :
  ?last_modified_time:timestamp ->
  ?activation_state:activation_state ->
  ?compute_quota_config:compute_quota_config ->
  ?cluster_arn:cluster_arn ->
  ?compute_quota_version:integer ->
  creation_time:timestamp ->
  compute_quota_target:compute_quota_target ->
  status:scheduler_resource_status ->
  name:entity_name ->
  compute_quota_id:compute_quota_id ->
  compute_quota_arn:compute_quota_arn ->
  unit ->
  compute_quota_summary

val make_list_compute_quotas_response :
  ?next_token:next_token ->
  ?compute_quota_summaries:compute_quota_summary_list ->
  unit ->
  list_compute_quotas_response

val make_list_compute_quotas_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_quota_by ->
  ?cluster_arn:cluster_arn ->
  ?status:scheduler_resource_status ->
  ?name_contains:entity_name ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  unit ->
  list_compute_quotas_request

val make_compilation_job_summary :
  ?last_modified_time:last_modified_time ->
  ?compilation_target_platform_accelerator:target_platform_accelerator ->
  ?compilation_target_platform_arch:target_platform_arch ->
  ?compilation_target_platform_os:target_platform_os ->
  ?compilation_target_device:target_device ->
  ?compilation_end_time:timestamp ->
  ?compilation_start_time:timestamp ->
  compilation_job_status:compilation_job_status ->
  creation_time:creation_time ->
  compilation_job_arn:compilation_job_arn ->
  compilation_job_name:entity_name ->
  unit ->
  compilation_job_summary

val make_list_compilation_jobs_response :
  ?next_token:next_token ->
  compilation_job_summaries:compilation_job_summaries ->
  unit ->
  list_compilation_jobs_response

val make_list_compilation_jobs_request :
  ?sort_order:sort_order ->
  ?sort_by:list_compilation_jobs_sort_by ->
  ?status_equals:compilation_job_status ->
  ?name_contains:name_contains ->
  ?last_modified_time_before:last_modified_time ->
  ?last_modified_time_after:last_modified_time ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_compilation_jobs_request

val make_git_config :
  ?secret_arn:secret_arn -> ?branch:branch -> repository_url:git_config_url -> unit -> git_config

val make_code_repository_summary :
  ?git_config:git_config ->
  last_modified_time:last_modified_time ->
  creation_time:creation_time ->
  code_repository_arn:code_repository_arn ->
  code_repository_name:entity_name ->
  unit ->
  code_repository_summary

val make_list_code_repositories_output :
  ?next_token:next_token ->
  code_repository_summary_list:code_repository_summary_list ->
  unit ->
  list_code_repositories_output

val make_list_code_repositories_input :
  ?sort_order:code_repository_sort_order ->
  ?sort_by:code_repository_sort_by ->
  ?next_token:next_token ->
  ?name_contains:code_repository_name_contains ->
  ?max_results:max_results ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  unit ->
  list_code_repositories_input

val make_cluster_scheduler_config_summary :
  ?cluster_arn:cluster_arn ->
  ?last_modified_time:timestamp ->
  ?cluster_scheduler_config_version:integer ->
  status:scheduler_resource_status ->
  creation_time:timestamp ->
  name:entity_name ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  unit ->
  cluster_scheduler_config_summary

val make_list_cluster_scheduler_configs_response :
  ?next_token:next_token ->
  ?cluster_scheduler_config_summaries:cluster_scheduler_config_summary_list ->
  unit ->
  list_cluster_scheduler_configs_response

val make_list_cluster_scheduler_configs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_cluster_scheduler_config_by ->
  ?status:scheduler_resource_status ->
  ?cluster_arn:cluster_arn ->
  ?name_contains:entity_name ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  unit ->
  list_cluster_scheduler_configs_request

val make_cluster_summary :
  ?image_version_status:cluster_image_version_status ->
  ?training_plan_arns:training_plan_arns ->
  cluster_status:cluster_status ->
  creation_time:timestamp ->
  cluster_name:cluster_name ->
  cluster_arn:cluster_arn ->
  unit ->
  cluster_summary

val make_list_clusters_response :
  ?next_token:next_token -> cluster_summaries:cluster_summaries -> unit -> list_clusters_response

val make_list_clusters_request :
  ?training_plan_arn:training_plan_arn ->
  ?sort_order:sort_order ->
  ?sort_by:cluster_sort_by ->
  ?next_token:next_token ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_clusters_request

val make_cluster_instance_status_details :
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  status:cluster_instance_status ->
  unit ->
  cluster_instance_status_details

val make_cluster_node_summary :
  ?image_version_status:cluster_image_version_status ->
  ?current_image_release_version:image_release_version ->
  ?private_dns_hostname:cluster_private_dns_hostname ->
  ?ultra_server_info:ultra_server_info ->
  ?last_software_update_time:timestamp ->
  ?node_logical_id:Smaws_Lib.Smithy_api.Types.string_ ->
  instance_status:cluster_instance_status_details ->
  launch_time:timestamp ->
  instance_type:cluster_instance_type ->
  instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  instance_group_name:cluster_instance_group_name ->
  unit ->
  cluster_node_summary

val make_list_cluster_nodes_response :
  ?next_token:next_token ->
  cluster_node_summaries:cluster_node_summaries ->
  unit ->
  list_cluster_nodes_response

val make_list_cluster_nodes_request :
  ?include_node_logical_ids:include_node_logical_ids_boolean ->
  ?sort_order:sort_order ->
  ?sort_by:cluster_sort_by ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?instance_group_name_contains:cluster_instance_group_name ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  list_cluster_nodes_request

val make_cluster_event_summary :
  ?event_level:cluster_event_level ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_group_name:cluster_instance_group_name ->
  event_time:timestamp ->
  resource_type:cluster_event_resource_type ->
  cluster_name:cluster_name ->
  cluster_arn:cluster_arn ->
  event_id:event_id ->
  unit ->
  cluster_event_summary

val make_list_cluster_events_response :
  ?events:cluster_event_summaries -> ?next_token:next_token -> unit -> list_cluster_events_response

val make_list_cluster_events_request :
  ?next_token:next_token ->
  ?max_results:cluster_event_max_results ->
  ?resource_type:cluster_event_resource_type ->
  ?sort_order:sort_order ->
  ?sort_by:event_sort_by ->
  ?event_time_before:timestamp ->
  ?event_time_after:timestamp ->
  ?node_id:cluster_node_id ->
  ?instance_group_name:cluster_instance_group_name ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  list_cluster_events_request

val make_final_auto_ml_job_objective_metric :
  ?standard_metric_name:auto_ml_metric_enum ->
  ?type_:auto_ml_job_objective_type ->
  value:metric_value ->
  metric_name:auto_ml_metric_enum ->
  unit ->
  final_auto_ml_job_objective_metric

val make_auto_ml_candidate_step :
  candidate_step_name:candidate_step_name ->
  candidate_step_arn:candidate_step_arn ->
  candidate_step_type:candidate_step_type ->
  unit ->
  auto_ml_candidate_step

val make_auto_ml_container_definition :
  ?environment:environment_map ->
  model_data_url:url ->
  image:container_image ->
  unit ->
  auto_ml_container_definition

val make_candidate_artifact_locations :
  ?backtest_results:backtest_results_location ->
  ?model_insights:model_insights_location ->
  explainability:explainability_location ->
  unit ->
  candidate_artifact_locations

val make_metric_datum :
  ?set:metric_set_source ->
  ?value:float_ ->
  ?standard_metric_name:auto_ml_metric_extended_enum ->
  ?metric_name:auto_ml_metric_enum ->
  unit ->
  metric_datum

val make_candidate_properties :
  ?candidate_metrics:metric_data_list ->
  ?candidate_artifact_locations:candidate_artifact_locations ->
  unit ->
  candidate_properties

val make_auto_ml_candidate :
  ?inference_container_definitions:auto_ml_inference_container_definitions ->
  ?candidate_properties:candidate_properties ->
  ?failure_reason:auto_ml_failure_reason ->
  ?end_time:timestamp ->
  ?inference_containers:auto_ml_container_definitions ->
  ?final_auto_ml_job_objective_metric:final_auto_ml_job_objective_metric ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  candidate_status:candidate_status ->
  candidate_steps:candidate_steps ->
  objective_status:objective_status ->
  candidate_name:candidate_name ->
  unit ->
  auto_ml_candidate

val make_list_candidates_for_auto_ml_job_response :
  ?next_token:next_token ->
  candidates:auto_ml_candidates ->
  unit ->
  list_candidates_for_auto_ml_job_response

val make_list_candidates_for_auto_ml_job_request :
  ?next_token:next_token ->
  ?max_results:auto_ml_max_results_for_trials ->
  ?sort_by:candidate_sort_by ->
  ?sort_order:auto_ml_sort_order ->
  ?candidate_name_equals:candidate_name ->
  ?status_equals:candidate_status ->
  auto_ml_job_name:auto_ml_job_name ->
  unit ->
  list_candidates_for_auto_ml_job_request

val make_auto_ml_partial_failure_reason :
  ?partial_failure_message:auto_ml_failure_reason -> unit -> auto_ml_partial_failure_reason

val make_auto_ml_job_summary :
  ?partial_failure_reasons:auto_ml_partial_failure_reasons ->
  ?failure_reason:auto_ml_failure_reason ->
  ?end_time:timestamp ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  auto_ml_job_secondary_status:auto_ml_job_secondary_status ->
  auto_ml_job_status:auto_ml_job_status ->
  auto_ml_job_arn:auto_ml_job_arn ->
  auto_ml_job_name:auto_ml_job_name ->
  unit ->
  auto_ml_job_summary

val make_list_auto_ml_jobs_response :
  ?next_token:next_token ->
  auto_ml_job_summaries:auto_ml_job_summaries ->
  unit ->
  list_auto_ml_jobs_response

val make_list_auto_ml_jobs_request :
  ?next_token:next_token ->
  ?max_results:auto_ml_max_results ->
  ?sort_by:auto_ml_sort_by ->
  ?sort_order:auto_ml_sort_order ->
  ?status_equals:auto_ml_job_status ->
  ?name_contains:auto_ml_name_contains ->
  ?last_modified_time_before:timestamp ->
  ?last_modified_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  unit ->
  list_auto_ml_jobs_request

val make_association_summary :
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?destination_name:experiment_entity_name ->
  ?source_name:experiment_entity_name ->
  ?association_type:association_edge_type ->
  ?destination_type:string256 ->
  ?source_type:string256 ->
  ?destination_arn:association_entity_arn ->
  ?source_arn:association_entity_arn ->
  unit ->
  association_summary

val make_list_associations_response :
  ?next_token:next_token ->
  ?association_summaries:association_summaries ->
  unit ->
  list_associations_response

val make_list_associations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_associations_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?association_type:association_edge_type ->
  ?destination_type:string256 ->
  ?source_type:string256 ->
  ?destination_arn:association_entity_arn ->
  ?source_arn:association_entity_arn ->
  unit ->
  list_associations_request

val make_artifact_source_type :
  value:string256 -> source_id_type:artifact_source_id_type -> unit -> artifact_source_type

val make_artifact_source :
  ?source_types:artifact_source_types -> source_uri:source_uri -> unit -> artifact_source

val make_artifact_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?artifact_type:string256 ->
  ?source:artifact_source ->
  ?artifact_name:experiment_entity_name ->
  ?artifact_arn:artifact_arn ->
  unit ->
  artifact_summary

val make_list_artifacts_response :
  ?next_token:next_token ->
  ?artifact_summaries:artifact_summaries ->
  unit ->
  list_artifacts_response

val make_list_artifacts_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_artifacts_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?artifact_type:string256 ->
  ?source_uri:source_uri ->
  unit ->
  list_artifacts_request

val make_app_details :
  ?resource_spec:resource_spec ->
  ?creation_time:creation_time ->
  ?status:app_status ->
  ?app_name:app_name ->
  ?app_type:app_type ->
  ?space_name:space_name ->
  ?user_profile_name:user_profile_name ->
  ?domain_id:domain_id ->
  unit ->
  app_details

val make_list_apps_response : ?next_token:next_token -> ?apps:app_list -> unit -> list_apps_response

val make_list_apps_request :
  ?space_name_equals:space_name ->
  ?user_profile_name_equals:user_profile_name ->
  ?domain_id_equals:domain_id ->
  ?sort_by:app_sort_key ->
  ?sort_order:sort_order ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_apps_request

val make_app_image_config_details :
  ?code_editor_app_image_config:code_editor_app_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?app_image_config_name:app_image_config_name ->
  ?app_image_config_arn:app_image_config_arn ->
  unit ->
  app_image_config_details

val make_list_app_image_configs_response :
  ?app_image_configs:app_image_config_list ->
  ?next_token:next_token ->
  unit ->
  list_app_image_configs_response

val make_list_app_image_configs_request :
  ?sort_order:sort_order ->
  ?sort_by:app_image_config_sort_key ->
  ?modified_time_after:timestamp ->
  ?modified_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?creation_time_before:timestamp ->
  ?name_contains:app_image_config_name ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_app_image_configs_request

val make_list_aliases_response :
  ?next_token:next_token ->
  ?sage_maker_image_version_aliases:sage_maker_image_version_aliases ->
  unit ->
  list_aliases_response

val make_list_aliases_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?version:image_version_number ->
  ?alias:sage_maker_image_version_alias ->
  image_name:image_name ->
  unit ->
  list_aliases_request

val make_algorithm_summary :
  ?algorithm_description:entity_description ->
  algorithm_status:algorithm_status ->
  creation_time:creation_time ->
  algorithm_arn:algorithm_arn ->
  algorithm_name:entity_name ->
  unit ->
  algorithm_summary

val make_list_algorithms_output :
  ?next_token:next_token ->
  algorithm_summary_list:algorithm_summary_list ->
  unit ->
  list_algorithms_output

val make_list_algorithms_input :
  ?sort_order:sort_order ->
  ?sort_by:algorithm_sort_by ->
  ?next_token:next_token ->
  ?name_contains:name_contains ->
  ?max_results:max_results ->
  ?creation_time_before:creation_time ->
  ?creation_time_after:creation_time ->
  unit ->
  list_algorithms_input

val make_ai_workload_config_summary :
  creation_time:timestamp ->
  ai_workload_config_arn:ai_workload_config_arn ->
  ai_workload_config_name:ai_entity_name ->
  unit ->
  ai_workload_config_summary

val make_list_ai_workload_configs_response :
  ?next_token:next_token ->
  ai_workload_configs:ai_workload_config_summary_list ->
  unit ->
  list_ai_workload_configs_response

val make_list_ai_workload_configs_request :
  ?sort_order:sort_order ->
  ?sort_by:list_ai_workload_configs_sort_by ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?name_contains:name_contains ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_ai_workload_configs_request

val make_ai_recommendation_job_summary :
  ?end_time:timestamp ->
  creation_time:timestamp ->
  ai_recommendation_job_status:ai_recommendation_job_status ->
  ai_recommendation_job_arn:ai_recommendation_job_arn ->
  ai_recommendation_job_name:ai_entity_name ->
  unit ->
  ai_recommendation_job_summary

val make_list_ai_recommendation_jobs_response :
  ?next_token:next_token ->
  ai_recommendation_jobs:ai_recommendation_job_summary_list ->
  unit ->
  list_ai_recommendation_jobs_response

val make_list_ai_recommendation_jobs_request :
  ?sort_order:sort_order ->
  ?sort_by:list_ai_recommendation_jobs_sort_by ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?status_equals:ai_recommendation_job_status ->
  ?name_contains:name_contains ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_ai_recommendation_jobs_request

val make_ai_benchmark_job_summary :
  ?ai_workload_config_name:ai_entity_name ->
  ?end_time:timestamp ->
  creation_time:timestamp ->
  ai_benchmark_job_status:ai_benchmark_job_status ->
  ai_benchmark_job_arn:ai_benchmark_job_arn ->
  ai_benchmark_job_name:ai_entity_name ->
  unit ->
  ai_benchmark_job_summary

val make_list_ai_benchmark_jobs_response :
  ?next_token:next_token ->
  ai_benchmark_jobs:ai_benchmark_job_summary_list ->
  unit ->
  list_ai_benchmark_jobs_response

val make_list_ai_benchmark_jobs_request :
  ?sort_order:sort_order ->
  ?sort_by:list_ai_benchmark_jobs_sort_by ->
  ?creation_time_before:timestamp ->
  ?creation_time_after:timestamp ->
  ?status_equals:ai_benchmark_job_status ->
  ?name_contains:name_contains ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_ai_benchmark_jobs_request

val make_action_source :
  ?source_id:string256 -> ?source_type:string256 -> source_uri:source_uri -> unit -> action_source

val make_action_summary :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:action_status ->
  ?action_type:string64 ->
  ?source:action_source ->
  ?action_name:experiment_entity_name ->
  ?action_arn:action_arn ->
  unit ->
  action_summary

val make_list_actions_response :
  ?next_token:next_token -> ?action_summaries:action_summaries -> unit -> list_actions_response

val make_list_actions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?sort_order:sort_order ->
  ?sort_by:sort_actions_by ->
  ?created_before:timestamp ->
  ?created_after:timestamp ->
  ?action_type:string256 ->
  ?source_uri:source_uri ->
  unit ->
  list_actions_request

val make_import_hub_content_response :
  hub_content_arn:hub_content_arn -> hub_arn:hub_arn -> unit -> import_hub_content_response

val make_import_hub_content_request :
  ?tags:tag_list ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?support_status:hub_content_support_status ->
  ?hub_content_markdown:hub_content_markdown ->
  ?hub_content_description:hub_content_description ->
  ?hub_content_display_name:hub_content_display_name ->
  ?hub_content_version:hub_content_version ->
  hub_content_document:hub_content_document ->
  hub_name:hub_name_or_arn ->
  document_schema_version:document_schema_version ->
  hub_content_type:hub_content_type ->
  hub_content_name:hub_content_name ->
  unit ->
  import_hub_content_request

val make_property_name_suggestion :
  ?property_name:resource_property_name -> unit -> property_name_suggestion

val make_get_search_suggestions_response :
  ?property_name_suggestions:property_name_suggestion_list ->
  unit ->
  get_search_suggestions_response

val make_get_search_suggestions_request :
  ?suggestion_query:suggestion_query ->
  resource:resource_type ->
  unit ->
  get_search_suggestions_request

val make_dynamic_scaling_configuration :
  ?scaling_policies:scaling_policies ->
  ?scale_out_cooldown:integer ->
  ?scale_in_cooldown:integer ->
  ?max_capacity:integer ->
  ?min_capacity:integer ->
  unit ->
  dynamic_scaling_configuration

val make_get_scaling_configuration_recommendation_response :
  ?dynamic_scaling_configuration:dynamic_scaling_configuration ->
  ?metric:scaling_policy_metric ->
  ?scaling_policy_objective:scaling_policy_objective ->
  ?target_cpu_utilization_per_core:utilization_percentage_per_core ->
  ?endpoint_name:endpoint_name ->
  ?recommendation_id:string_ ->
  ?inference_recommendations_job_name:recommendation_job_name ->
  unit ->
  get_scaling_configuration_recommendation_response

val make_get_scaling_configuration_recommendation_request :
  ?scaling_policy_objective:scaling_policy_objective ->
  ?target_cpu_utilization_per_core:utilization_percentage_per_core ->
  ?endpoint_name:endpoint_name ->
  ?recommendation_id:string_ ->
  inference_recommendations_job_name:recommendation_job_name ->
  unit ->
  get_scaling_configuration_recommendation_request

val make_get_sagemaker_servicecatalog_portfolio_status_output :
  ?status:sagemaker_servicecatalog_status ->
  unit ->
  get_sagemaker_servicecatalog_portfolio_status_output

val make_get_sagemaker_servicecatalog_portfolio_status_input : unit -> unit

val make_get_model_package_group_policy_output :
  resource_policy:policy_string -> unit -> get_model_package_group_policy_output

val make_get_model_package_group_policy_input :
  model_package_group_name:entity_name -> unit -> get_model_package_group_policy_input

val make_get_lineage_group_policy_response :
  ?resource_policy:resource_policy_string ->
  ?lineage_group_arn:lineage_group_arn ->
  unit ->
  get_lineage_group_policy_response

val make_get_lineage_group_policy_request :
  lineage_group_name:lineage_group_name_or_arn -> unit -> get_lineage_group_policy_request

val make_device_stats :
  registered_device_count:long -> connected_device_count:long -> unit -> device_stats

val make_agent_version : agent_count:long -> version:edge_version -> unit -> agent_version

val make_edge_model_stat :
  sampling_device_count:long ->
  active_device_count:long ->
  connected_device_count:long ->
  offline_device_count:long ->
  model_version:edge_version ->
  model_name:entity_name ->
  unit ->
  edge_model_stat

val make_get_device_fleet_report_response :
  ?model_stats:edge_model_stats ->
  ?agent_versions:agent_versions ->
  ?device_stats:device_stats ->
  ?report_generated:timestamp ->
  ?description:device_fleet_description ->
  ?output_config:edge_output_config ->
  device_fleet_name:entity_name ->
  device_fleet_arn:device_fleet_arn ->
  unit ->
  get_device_fleet_report_response

val make_get_device_fleet_report_request :
  device_fleet_name:entity_name -> unit -> get_device_fleet_report_request

val make_extend_training_plan_response :
  training_plan_extensions:training_plan_extensions -> unit -> extend_training_plan_response

val make_extend_training_plan_request :
  training_plan_extension_offering_id:training_plan_extension_offering_id ->
  unit ->
  extend_training_plan_request

val make_enable_sagemaker_servicecatalog_portfolio_output : unit -> unit
val make_enable_sagemaker_servicecatalog_portfolio_input : unit -> unit

val make_disassociate_trial_component_response :
  ?trial_arn:trial_arn ->
  ?trial_component_arn:trial_component_arn ->
  unit ->
  disassociate_trial_component_response

val make_disassociate_trial_component_request :
  trial_name:experiment_entity_name ->
  trial_component_name:experiment_entity_name ->
  unit ->
  disassociate_trial_component_request

val make_disable_sagemaker_servicecatalog_portfolio_output : unit -> unit
val make_disable_sagemaker_servicecatalog_portfolio_input : unit -> unit

val make_detach_cluster_node_volume_response :
  device_name:volume_device_name ->
  status:volume_attachment_status ->
  attach_time:timestamp ->
  volume_id:volume_id ->
  node_id:cluster_node_id ->
  cluster_arn:cluster_arn ->
  unit ->
  detach_cluster_node_volume_response

val make_detach_cluster_node_volume_request :
  volume_id:volume_id ->
  node_id:cluster_node_id ->
  cluster_arn:cluster_arn ->
  unit ->
  detach_cluster_node_volume_request

val make_describe_workteam_response : workteam:workteam -> unit -> describe_workteam_response

val make_describe_workteam_request :
  workteam_name:workteam_name -> unit -> describe_workteam_request

val make_describe_workforce_response : workforce:workforce -> unit -> describe_workforce_response

val make_describe_workforce_request :
  workforce_name:workforce_name -> unit -> describe_workforce_request

val make_describe_user_profile_response :
  ?user_settings:user_settings ->
  ?single_sign_on_user_value:string256 ->
  ?single_sign_on_user_identifier:single_sign_on_user_identifier ->
  ?failure_reason:failure_reason ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?status:user_profile_status ->
  ?home_efs_file_system_uid:efs_uid ->
  ?user_profile_name:user_profile_name ->
  ?user_profile_arn:user_profile_arn ->
  ?domain_id:domain_id ->
  unit ->
  describe_user_profile_response

val make_describe_user_profile_request :
  user_profile_name:user_profile_name ->
  domain_id:domain_id ->
  unit ->
  describe_user_profile_request

val make_describe_trial_component_response :
  ?sources:trial_component_sources ->
  ?lineage_group_arn:lineage_group_arn ->
  ?metrics:trial_component_metric_summaries ->
  ?metadata_properties:metadata_properties ->
  ?output_artifacts:trial_component_artifacts ->
  ?input_artifacts:trial_component_artifacts ->
  ?parameters:trial_component_parameters ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:trial_component_status ->
  ?source:trial_component_source ->
  ?display_name:experiment_entity_name ->
  ?trial_component_arn:trial_component_arn ->
  ?trial_component_name:experiment_entity_name ->
  unit ->
  describe_trial_component_response

val make_describe_trial_component_request :
  trial_component_name:experiment_entity_name_or_arn -> unit -> describe_trial_component_request

val make_describe_trial_response :
  ?metadata_properties:metadata_properties ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?source:trial_source ->
  ?experiment_name:experiment_entity_name ->
  ?display_name:experiment_entity_name ->
  ?trial_arn:trial_arn ->
  ?trial_name:experiment_entity_name ->
  unit ->
  describe_trial_response

val make_describe_trial_request :
  trial_name:experiment_entity_name -> unit -> describe_trial_request

val make_describe_transform_job_response :
  ?experiment_config:experiment_config ->
  ?data_processing:data_processing ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?labeling_job_arn:labeling_job_arn ->
  ?transform_end_time:timestamp ->
  ?transform_start_time:timestamp ->
  ?data_capture_config:batch_data_capture_config ->
  ?transform_output:transform_output ->
  ?environment:transform_environment_map ->
  ?batch_strategy:batch_strategy ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?model_client_config:model_client_config ->
  ?max_concurrent_transforms:max_concurrent_transforms ->
  ?failure_reason:failure_reason ->
  creation_time:timestamp ->
  transform_resources:transform_resources ->
  transform_input:transform_input ->
  model_name:model_name ->
  transform_job_status:transform_job_status ->
  transform_job_arn:transform_job_arn ->
  transform_job_name:transform_job_name ->
  unit ->
  describe_transform_job_response

val make_describe_transform_job_request :
  transform_job_name:transform_job_name -> unit -> describe_transform_job_request

val make_describe_training_plan_extension_history_response :
  ?next_token:next_token ->
  training_plan_extensions:training_plan_extensions ->
  unit ->
  describe_training_plan_extension_history_response

val make_describe_training_plan_extension_history_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  training_plan_arn:training_plan_arn ->
  unit ->
  describe_training_plan_extension_history_request

val make_describe_training_plan_response :
  ?reserved_capacity_summaries:reserved_capacity_summaries ->
  ?target_resources:sage_maker_resource_names ->
  ?total_ultra_server_count:ultra_server_count ->
  ?available_spare_instance_count:available_spare_instance_count ->
  ?unhealthy_instance_count:unhealthy_instance_count ->
  ?in_use_instance_count:in_use_instance_count ->
  ?available_instance_count:available_instance_count ->
  ?total_instance_count:total_instance_count ->
  ?currency_code:currency_code ->
  ?upfront_fee:string256 ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?duration_minutes:training_plan_duration_minutes ->
  ?duration_hours:training_plan_duration_hours ->
  ?status_message:training_plan_status_message ->
  status:training_plan_status ->
  training_plan_name:training_plan_name ->
  training_plan_arn:training_plan_arn ->
  unit ->
  describe_training_plan_response

val make_describe_training_plan_request :
  training_plan_name:training_plan_name -> unit -> describe_training_plan_request

val make_profiler_rule_evaluation_status :
  ?last_modified_time:timestamp ->
  ?status_details:status_details ->
  ?rule_evaluation_status:rule_evaluation_status ->
  ?rule_evaluation_job_arn:processing_job_arn ->
  ?rule_configuration_name:rule_configuration_name ->
  unit ->
  profiler_rule_evaluation_status

val make_remote_debug_config :
  ?enable_remote_debug:enable_remote_debug -> unit -> remote_debug_config

val make_infra_check_config : ?enable_infra_check:enable_infra_check -> unit -> infra_check_config

val make_mlflow_config :
  ?mlflow_run_name:mlflow_run_name ->
  ?mlflow_experiment_name:mlflow_experiment_name ->
  mlflow_resource_arn:ml_flow_resource_arn ->
  unit ->
  mlflow_config

val make_mlflow_details :
  ?mlflow_run_id:mlflow_run_id ->
  ?mlflow_experiment_id:mlflow_experiment_id ->
  unit ->
  mlflow_details

val make_describe_training_job_response :
  ?output_model_package_arn:model_package_arn ->
  ?progress_info:training_progress_info ->
  ?mlflow_details:mlflow_details ->
  ?model_package_config:model_package_config ->
  ?mlflow_config:mlflow_config ->
  ?serverless_job_config:serverless_job_config ->
  ?infra_check_config:infra_check_config ->
  ?remote_debug_config:remote_debug_config ->
  ?retry_strategy:retry_strategy ->
  ?environment:training_environment_map ->
  ?profiling_status:profiling_status ->
  ?profiler_rule_evaluation_statuses:profiler_rule_evaluation_statuses ->
  ?profiler_rule_configurations:profiler_rule_configurations ->
  ?profiler_config:profiler_config ->
  ?debug_rule_evaluation_statuses:debug_rule_evaluation_statuses ->
  ?tensor_board_output_config:tensor_board_output_config ->
  ?debug_rule_configurations:debug_rule_configurations ->
  ?experiment_config:experiment_config ->
  ?debug_hook_config:debug_hook_config ->
  ?billable_token_count:billable_token_count ->
  ?billable_time_in_seconds:billable_time_in_seconds ->
  ?training_time_in_seconds:training_time_in_seconds ->
  ?checkpoint_config:checkpoint_config ->
  ?enable_managed_spot_training:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_network_isolation:boolean_ ->
  ?final_metric_data_list:final_metric_data_list ->
  ?secondary_status_transitions:secondary_status_transitions ->
  ?last_modified_time:timestamp ->
  ?training_end_time:timestamp ->
  ?training_start_time:timestamp ->
  ?vpc_config:vpc_config ->
  ?warm_pool_status:warm_pool_status ->
  ?resource_config:resource_config ->
  ?output_data_config:output_data_config ->
  ?input_data_config:input_data_config ->
  ?role_arn:role_arn ->
  ?algorithm_specification:algorithm_specification ->
  ?hyper_parameters:hyper_parameters ->
  ?failure_reason:failure_reason ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?labeling_job_arn:labeling_job_arn ->
  ?tuning_job_arn:hyper_parameter_tuning_job_arn ->
  creation_time:timestamp ->
  stopping_condition:stopping_condition ->
  secondary_status:secondary_status ->
  training_job_status:training_job_status ->
  model_artifacts:model_artifacts ->
  training_job_arn:training_job_arn ->
  training_job_name:training_job_name ->
  unit ->
  describe_training_job_response

val make_describe_training_job_request :
  training_job_name:training_job_name -> unit -> describe_training_job_request

val make_describe_subscribed_workteam_response :
  subscribed_workteam:subscribed_workteam -> unit -> describe_subscribed_workteam_response

val make_describe_subscribed_workteam_request :
  workteam_arn:workteam_arn -> unit -> describe_subscribed_workteam_request

val make_describe_studio_lifecycle_config_response :
  ?studio_lifecycle_config_app_type:studio_lifecycle_config_app_type ->
  ?studio_lifecycle_config_content:studio_lifecycle_config_content ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?studio_lifecycle_config_name:studio_lifecycle_config_name ->
  ?studio_lifecycle_config_arn:studio_lifecycle_config_arn ->
  unit ->
  describe_studio_lifecycle_config_response

val make_describe_studio_lifecycle_config_request :
  studio_lifecycle_config_name:studio_lifecycle_config_name ->
  unit ->
  describe_studio_lifecycle_config_request

val make_ownership_settings :
  owner_user_profile_name:user_profile_name -> unit -> ownership_settings

val make_describe_space_response :
  ?url:string1024 ->
  ?space_display_name:non_empty_string64 ->
  ?space_sharing_settings:space_sharing_settings ->
  ?ownership_settings:ownership_settings ->
  ?space_settings:space_settings ->
  ?failure_reason:failure_reason ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?status:space_status ->
  ?home_efs_file_system_uid:efs_uid ->
  ?space_name:space_name ->
  ?space_arn:space_arn ->
  ?domain_id:domain_id ->
  unit ->
  describe_space_response

val make_describe_space_request :
  space_name:space_name -> domain_id:domain_id -> unit -> describe_space_request

val make_describe_reserved_capacity_response :
  ?ultra_server_summary:ultra_server_summary ->
  ?in_use_instance_count:in_use_instance_count ->
  ?available_instance_count:available_instance_count ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?duration_minutes:reserved_capacity_duration_minutes ->
  ?duration_hours:reserved_capacity_duration_hours ->
  ?availability_zone:availability_zone ->
  ?status:reserved_capacity_status ->
  ?reserved_capacity_type:reserved_capacity_type ->
  total_instance_count:total_instance_count ->
  instance_type:reserved_capacity_instance_type ->
  reserved_capacity_arn:reserved_capacity_arn ->
  unit ->
  describe_reserved_capacity_response

val make_describe_reserved_capacity_request :
  reserved_capacity_arn:reserved_capacity_arn -> unit -> describe_reserved_capacity_request

val make_describe_project_output :
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?template_provider_details:template_provider_detail_list ->
  ?service_catalog_provisioned_product_details:service_catalog_provisioned_product_details ->
  ?service_catalog_provisioning_details:service_catalog_provisioning_details ->
  ?project_description:entity_description ->
  creation_time:timestamp ->
  project_status:project_status ->
  project_id:project_id ->
  project_name:project_entity_name ->
  project_arn:project_arn ->
  unit ->
  describe_project_output

val make_describe_project_input : project_name:project_entity_name -> unit -> describe_project_input

val make_describe_processing_job_response :
  ?training_job_arn:training_job_arn ->
  ?auto_ml_job_arn:auto_ml_job_arn ->
  ?monitoring_schedule_arn:monitoring_schedule_arn ->
  ?last_modified_time:timestamp ->
  ?processing_start_time:timestamp ->
  ?processing_end_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?exit_message:exit_message ->
  ?experiment_config:experiment_config ->
  ?role_arn:role_arn ->
  ?network_config:network_config ->
  ?environment:processing_environment_map ->
  ?stopping_condition:processing_stopping_condition ->
  ?processing_output_config:processing_output_config ->
  ?processing_inputs:processing_inputs ->
  creation_time:timestamp ->
  processing_job_status:processing_job_status ->
  processing_job_arn:processing_job_arn ->
  app_specification:app_specification ->
  processing_resources:processing_resources ->
  processing_job_name:processing_job_name ->
  unit ->
  describe_processing_job_response

val make_describe_processing_job_request :
  processing_job_name:processing_job_name -> unit -> describe_processing_job_request

val make_m_lflow_configuration :
  ?mlflow_experiment_name:mlflow_experiment_entity_name ->
  ?mlflow_resource_arn:m_lflow_arn ->
  unit ->
  m_lflow_configuration

val make_describe_pipeline_execution_response :
  ?m_lflow_config:m_lflow_configuration ->
  ?pipeline_version_id:pipeline_version_id ->
  ?selective_execution_config:selective_execution_config ->
  ?parallelism_configuration:parallelism_configuration ->
  ?last_modified_by:user_context ->
  ?created_by:user_context ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?failure_reason:pipeline_execution_failure_reason ->
  ?pipeline_experiment_config:pipeline_experiment_config ->
  ?pipeline_execution_description:pipeline_execution_description ->
  ?pipeline_execution_status:pipeline_execution_status ->
  ?pipeline_execution_display_name:pipeline_execution_name ->
  ?pipeline_execution_arn:pipeline_execution_arn ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  describe_pipeline_execution_response

val make_describe_pipeline_execution_request :
  pipeline_execution_arn:pipeline_execution_arn -> unit -> describe_pipeline_execution_request

val make_describe_pipeline_definition_for_execution_response :
  ?creation_time:timestamp ->
  ?pipeline_definition:pipeline_definition ->
  unit ->
  describe_pipeline_definition_for_execution_response

val make_describe_pipeline_definition_for_execution_request :
  pipeline_execution_arn:pipeline_execution_arn ->
  unit ->
  describe_pipeline_definition_for_execution_request

val make_describe_pipeline_response :
  ?pipeline_version_description:pipeline_version_description ->
  ?pipeline_version_display_name:pipeline_version_name ->
  ?parallelism_configuration:parallelism_configuration ->
  ?last_modified_by:user_context ->
  ?created_by:user_context ->
  ?last_run_time:timestamp ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?pipeline_status:pipeline_status ->
  ?role_arn:role_arn ->
  ?pipeline_description:pipeline_description ->
  ?pipeline_definition:pipeline_definition ->
  ?pipeline_display_name:pipeline_name ->
  ?pipeline_name:pipeline_name ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  describe_pipeline_response

val make_describe_pipeline_request :
  ?pipeline_version_id:pipeline_version_id ->
  pipeline_name:pipeline_name_or_arn ->
  unit ->
  describe_pipeline_request

val make_error_info : ?reason:non_empty_string256 -> ?code:non_empty_string64 -> unit -> error_info

val make_available_upgrade :
  ?release_notes:release_notes_list -> ?version:major_minor_version -> unit -> available_upgrade

val make_describe_partner_app_response :
  ?available_upgrade:available_upgrade ->
  ?current_version_eol_date:timestamp ->
  ?enable_auto_minor_version_upgrade:boolean_ ->
  ?error:error_info ->
  ?enable_iam_session_based_identity:boolean_ ->
  ?auth_type:partner_app_auth_type ->
  ?application_config:partner_app_config ->
  ?version:non_empty_string64 ->
  ?tier:non_empty_string64 ->
  ?maintenance_config:partner_app_maintenance_config ->
  ?base_url:string2048 ->
  ?kms_key_id:kms_key_id ->
  ?execution_role_arn:role_arn ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:partner_app_status ->
  ?type_:partner_app_type ->
  ?name:partner_app_name ->
  ?arn:partner_app_arn ->
  unit ->
  describe_partner_app_response

val make_describe_partner_app_request :
  ?include_available_upgrade:boolean_ -> arn:partner_app_arn -> unit -> describe_partner_app_request

val make_optimization_model_access_config :
  accept_eula:optimization_model_accept_eula -> unit -> optimization_model_access_config

val make_optimization_job_model_source_s3 :
  ?model_access_config:optimization_model_access_config ->
  ?s3_uri:s3_uri ->
  unit ->
  optimization_job_model_source_s3

val make_optimization_sage_maker_model :
  ?model_name:model_name -> unit -> optimization_sage_maker_model

val make_optimization_job_model_source :
  ?sage_maker_model:optimization_sage_maker_model ->
  ?s3:optimization_job_model_source_s3 ->
  unit ->
  optimization_job_model_source

val make_model_quantization_config :
  ?override_environment:optimization_job_environment_variables ->
  ?image:optimization_container_image ->
  unit ->
  model_quantization_config

val make_model_compilation_config :
  ?override_environment:optimization_job_environment_variables ->
  ?image:optimization_container_image ->
  unit ->
  model_compilation_config

val make_model_sharding_config :
  ?override_environment:optimization_job_environment_variables ->
  ?image:optimization_container_image ->
  unit ->
  model_sharding_config

val make_model_speculative_decoding_training_data_source :
  s3_data_type:model_speculative_decoding_s3_data_type ->
  s3_uri:s3_uri ->
  unit ->
  model_speculative_decoding_training_data_source

val make_model_speculative_decoding_config :
  ?training_data_source:model_speculative_decoding_training_data_source ->
  technique:model_speculative_decoding_technique ->
  unit ->
  model_speculative_decoding_config

val make_optimization_job_output_config :
  ?sage_maker_model:optimization_sage_maker_model ->
  ?kms_key_id:kms_key_id ->
  s3_output_location:s3_uri ->
  unit ->
  optimization_job_output_config

val make_optimization_output :
  ?recommended_inference_image:optimization_container_image -> unit -> optimization_output

val make_optimization_vpc_config :
  subnets:optimization_vpc_subnets ->
  security_group_ids:optimization_vpc_security_group_ids ->
  unit ->
  optimization_vpc_config

val make_describe_optimization_job_response :
  ?vpc_config:optimization_vpc_config ->
  ?optimization_output:optimization_output ->
  ?max_instance_count:optimization_job_max_instance_count ->
  ?optimization_environment:optimization_job_environment_variables ->
  ?failure_reason:failure_reason ->
  ?optimization_end_time:timestamp ->
  ?optimization_start_time:timestamp ->
  stopping_condition:stopping_condition ->
  role_arn:role_arn ->
  output_config:optimization_job_output_config ->
  optimization_configs:optimization_configs ->
  deployment_instance_type:optimization_job_deployment_instance_type ->
  model_source:optimization_job_model_source ->
  optimization_job_name:entity_name ->
  last_modified_time:last_modified_time ->
  creation_time:creation_time ->
  optimization_job_status:optimization_job_status ->
  optimization_job_arn:optimization_job_arn ->
  unit ->
  describe_optimization_job_response

val make_describe_optimization_job_request :
  optimization_job_name:entity_name -> unit -> describe_optimization_job_request

val make_describe_notebook_instance_lifecycle_config_output :
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?on_start:notebook_instance_lifecycle_config_list ->
  ?on_create:notebook_instance_lifecycle_config_list ->
  ?notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?notebook_instance_lifecycle_config_arn:notebook_instance_lifecycle_config_arn ->
  unit ->
  describe_notebook_instance_lifecycle_config_output

val make_describe_notebook_instance_lifecycle_config_input :
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  describe_notebook_instance_lifecycle_config_input

val make_describe_notebook_instance_output :
  ?instance_metadata_service_configuration:instance_metadata_service_configuration ->
  ?platform_identifier:platform_identifier ->
  ?root_access:root_access ->
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  ?default_code_repository:code_repository_name_or_url ->
  ?accelerator_types:notebook_instance_accelerator_types ->
  ?volume_size_in_g_b:notebook_instance_volume_size_in_g_b ->
  ?direct_internet_access:direct_internet_access ->
  ?notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?creation_time:creation_time ->
  ?last_modified_time:last_modified_time ->
  ?network_interface_id:network_interface_id ->
  ?kms_key_id:kms_key_id ->
  ?role_arn:role_arn ->
  ?security_groups:security_group_ids ->
  ?subnet_id:subnet_id ->
  ?ip_address_type:ip_address_type ->
  ?instance_type:instance_type ->
  ?url:notebook_instance_url ->
  ?failure_reason:failure_reason ->
  ?notebook_instance_status:notebook_instance_status ->
  ?notebook_instance_name:notebook_instance_name ->
  ?notebook_instance_arn:notebook_instance_arn ->
  unit ->
  describe_notebook_instance_output

val make_describe_notebook_instance_input :
  notebook_instance_name:notebook_instance_name -> unit -> describe_notebook_instance_input

val make_describe_monitoring_schedule_response :
  ?last_monitoring_execution_summary:monitoring_execution_summary ->
  ?endpoint_name:endpoint_name ->
  ?failure_reason:failure_reason ->
  ?monitoring_type:monitoring_type ->
  monitoring_schedule_config:monitoring_schedule_config ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  monitoring_schedule_status:schedule_status ->
  monitoring_schedule_name:monitoring_schedule_name ->
  monitoring_schedule_arn:monitoring_schedule_arn ->
  unit ->
  describe_monitoring_schedule_response

val make_describe_monitoring_schedule_request :
  monitoring_schedule_name:monitoring_schedule_name -> unit -> describe_monitoring_schedule_request

val make_model_quality_baseline_config :
  ?constraints_resource:monitoring_constraints_resource ->
  ?baselining_job_name:processing_job_name ->
  unit ->
  model_quality_baseline_config

val make_model_quality_app_specification :
  ?environment:monitoring_environment_map ->
  ?problem_type:monitoring_problem_type ->
  ?post_analytics_processor_source_uri:s3_uri ->
  ?record_preprocessor_source_uri:s3_uri ->
  ?container_arguments:monitoring_container_arguments ->
  ?container_entrypoint:container_entrypoint ->
  image_uri:image_uri ->
  unit ->
  model_quality_app_specification

val make_monitoring_ground_truth_s3_input :
  ?s3_uri:monitoring_s3_uri -> unit -> monitoring_ground_truth_s3_input

val make_model_quality_job_input :
  ?batch_transform_input:batch_transform_input ->
  ?endpoint_input:endpoint_input ->
  ground_truth_s3_input:monitoring_ground_truth_s3_input ->
  unit ->
  model_quality_job_input

val make_monitoring_network_config :
  ?vpc_config:vpc_config ->
  ?enable_network_isolation:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  unit ->
  monitoring_network_config

val make_describe_model_quality_job_definition_response :
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?model_quality_baseline_config:model_quality_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  model_quality_job_output_config:monitoring_output_config ->
  model_quality_job_input:model_quality_job_input ->
  model_quality_app_specification:model_quality_app_specification ->
  creation_time:timestamp ->
  job_definition_name:monitoring_job_definition_name ->
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  describe_model_quality_job_definition_response

val make_describe_model_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_model_quality_job_definition_request

val make_describe_model_package_group_output :
  ?managed_configuration:managed_configuration ->
  ?model_package_group_description:entity_description ->
  model_package_group_status:model_package_group_status ->
  created_by:user_context ->
  creation_time:creation_time ->
  model_package_group_arn:model_package_group_arn ->
  model_package_group_name:entity_name ->
  unit ->
  describe_model_package_group_output

val make_describe_model_package_group_input :
  model_package_group_name:arn_or_name -> unit -> describe_model_package_group_input

val make_describe_model_package_output :
  ?managed_storage_type:managed_storage_type ->
  ?model_life_cycle:model_life_cycle ->
  ?model_card:model_package_model_card ->
  ?security_config:model_package_security_config ->
  ?source_uri:model_package_source_uri ->
  ?skip_model_validation:skip_model_validation ->
  ?additional_inference_specifications:additional_inference_specifications ->
  ?drift_check_baselines:drift_check_baselines ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?sample_payload_url:string_ ->
  ?task:string_ ->
  ?domain:string_ ->
  ?approval_description:approval_description ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?model_metrics:model_metrics ->
  ?metadata_properties:metadata_properties ->
  ?created_by:user_context ->
  ?model_approval_status:model_approval_status ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?validation_specification:model_package_validation_specification ->
  ?source_algorithm_specification:source_algorithm_specification ->
  ?inference_specification:inference_specification ->
  ?model_package_description:entity_description ->
  ?model_package_registration_type:model_package_registration_type ->
  ?model_package_version:model_package_version ->
  ?model_package_group_name:entity_name ->
  model_package_status_details:model_package_status_details ->
  model_package_status:model_package_status ->
  creation_time:creation_time ->
  model_package_arn:model_package_arn ->
  model_package_name:entity_name ->
  unit ->
  describe_model_package_output

val make_describe_model_package_input :
  ?included_data:included_data ->
  model_package_name:versioned_arn_or_name ->
  unit ->
  describe_model_package_input

val make_model_explainability_baseline_config :
  ?constraints_resource:monitoring_constraints_resource ->
  ?baselining_job_name:processing_job_name ->
  unit ->
  model_explainability_baseline_config

val make_model_explainability_app_specification :
  ?environment:monitoring_environment_map ->
  config_uri:s3_uri ->
  image_uri:image_uri ->
  unit ->
  model_explainability_app_specification

val make_model_explainability_job_input :
  ?batch_transform_input:batch_transform_input ->
  ?endpoint_input:endpoint_input ->
  unit ->
  model_explainability_job_input

val make_describe_model_explainability_job_definition_response :
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?model_explainability_baseline_config:model_explainability_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  model_explainability_job_output_config:monitoring_output_config ->
  model_explainability_job_input:model_explainability_job_input ->
  model_explainability_app_specification:model_explainability_app_specification ->
  creation_time:timestamp ->
  job_definition_name:monitoring_job_definition_name ->
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  describe_model_explainability_job_definition_response

val make_describe_model_explainability_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_model_explainability_job_definition_request

val make_model_card_export_output_config :
  s3_output_path:s3_uri -> unit -> model_card_export_output_config

val make_model_card_export_artifacts :
  s3_export_artifacts:s3_uri -> unit -> model_card_export_artifacts

val make_describe_model_card_export_job_response :
  ?export_artifacts:model_card_export_artifacts ->
  ?failure_reason:failure_reason ->
  last_modified_at:timestamp ->
  created_at:timestamp ->
  output_config:model_card_export_output_config ->
  model_card_version:integer ->
  model_card_name:entity_name ->
  status:model_card_export_job_status ->
  model_card_export_job_arn:model_card_export_job_arn ->
  model_card_export_job_name:entity_name ->
  unit ->
  describe_model_card_export_job_response

val make_describe_model_card_export_job_request :
  model_card_export_job_arn:model_card_export_job_arn ->
  unit ->
  describe_model_card_export_job_request

val make_describe_model_card_response :
  ?model_card_processing_status:model_card_processing_status ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?security_config:model_card_security_config ->
  created_by:user_context ->
  creation_time:timestamp ->
  model_card_status:model_card_status ->
  content:model_card_content ->
  model_card_version:integer ->
  model_card_name:entity_name ->
  model_card_arn:model_card_arn ->
  unit ->
  describe_model_card_response

val make_describe_model_card_request :
  ?included_data:included_data ->
  ?model_card_version:integer ->
  model_card_name:model_card_name_or_arn ->
  unit ->
  describe_model_card_request

val make_model_bias_baseline_config :
  ?constraints_resource:monitoring_constraints_resource ->
  ?baselining_job_name:processing_job_name ->
  unit ->
  model_bias_baseline_config

val make_model_bias_app_specification :
  ?environment:monitoring_environment_map ->
  config_uri:s3_uri ->
  image_uri:image_uri ->
  unit ->
  model_bias_app_specification

val make_model_bias_job_input :
  ?batch_transform_input:batch_transform_input ->
  ?endpoint_input:endpoint_input ->
  ground_truth_s3_input:monitoring_ground_truth_s3_input ->
  unit ->
  model_bias_job_input

val make_describe_model_bias_job_definition_response :
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?model_bias_baseline_config:model_bias_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  model_bias_job_output_config:monitoring_output_config ->
  model_bias_job_input:model_bias_job_input ->
  model_bias_app_specification:model_bias_app_specification ->
  creation_time:timestamp ->
  job_definition_name:monitoring_job_definition_name ->
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  describe_model_bias_job_definition_response

val make_describe_model_bias_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_model_bias_job_definition_request

val make_describe_model_output :
  ?deployment_recommendation:deployment_recommendation ->
  ?enable_network_isolation:boolean_ ->
  ?vpc_config:vpc_config ->
  ?execution_role_arn:role_arn ->
  ?inference_execution_config:inference_execution_config ->
  ?containers:container_definition_list ->
  ?primary_container:container_definition ->
  model_arn:model_arn ->
  creation_time:timestamp ->
  model_name:model_name ->
  unit ->
  describe_model_output

val make_describe_model_input : model_name:model_name -> unit -> describe_model_input

val make_describe_mlflow_tracking_server_response :
  ?s3_bucket_owner_verification:boolean_ ->
  ?s3_bucket_owner_account_id:account_id ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?automatic_model_registration:boolean_ ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?tracking_server_url:tracking_server_url ->
  ?is_active:is_tracking_server_active ->
  ?tracking_server_maintenance_status:tracking_server_maintenance_status ->
  ?tracking_server_status:tracking_server_status ->
  ?role_arn:role_arn ->
  ?mlflow_version:mlflow_version ->
  ?tracking_server_size:tracking_server_size ->
  ?artifact_store_uri:s3_uri ->
  ?tracking_server_name:tracking_server_name ->
  ?tracking_server_arn:tracking_server_arn ->
  unit ->
  describe_mlflow_tracking_server_response

val make_describe_mlflow_tracking_server_request :
  tracking_server_name:tracking_server_name -> unit -> describe_mlflow_tracking_server_request

val make_describe_mlflow_app_response :
  ?maintenance_status:maintenance_status ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?default_domain_id_list:default_domain_id_list ->
  ?account_default_status:account_default_status ->
  ?model_registration_mode:model_registration_mode ->
  ?status:mlflow_app_status ->
  ?role_arn:role_arn ->
  ?mlflow_version:mlflow_version ->
  ?artifact_store_uri:s3_uri ->
  ?name:mlflow_app_name ->
  ?arn:mlflow_app_arn ->
  unit ->
  describe_mlflow_app_response

val make_describe_mlflow_app_request : arn:mlflow_app_arn -> unit -> describe_mlflow_app_request

val make_describe_lineage_group_response :
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?description:experiment_description ->
  ?display_name:experiment_entity_name ->
  ?lineage_group_arn:lineage_group_arn ->
  ?lineage_group_name:experiment_entity_name ->
  unit ->
  describe_lineage_group_response

val make_describe_lineage_group_request :
  lineage_group_name:experiment_entity_name -> unit -> describe_lineage_group_request

val make_labeling_job_output_config :
  ?sns_topic_arn:sns_topic_arn ->
  ?kms_key_id:kms_key_id ->
  s3_output_path:s3_uri ->
  unit ->
  labeling_job_output_config

val make_labeling_job_stopping_conditions :
  ?max_percentage_of_input_dataset_labeled:max_percentage_of_input_dataset_labeled ->
  ?max_human_labeled_object_count:max_human_labeled_object_count ->
  unit ->
  labeling_job_stopping_conditions

val make_labeling_job_resource_config :
  ?vpc_config:vpc_config -> ?volume_kms_key_id:kms_key_id -> unit -> labeling_job_resource_config

val make_labeling_job_algorithms_config :
  ?labeling_job_resource_config:labeling_job_resource_config ->
  ?initial_active_learning_model_arn:model_arn ->
  labeling_job_algorithm_specification_arn:labeling_job_algorithm_specification_arn ->
  unit ->
  labeling_job_algorithms_config

val make_annotation_consolidation_config :
  annotation_consolidation_lambda_arn:lambda_function_arn -> unit -> annotation_consolidation_config

val make_public_workforce_task_price : ?amount_in_usd:us_d -> unit -> public_workforce_task_price

val make_human_task_config :
  ?public_workforce_task_price:public_workforce_task_price ->
  ?annotation_consolidation_config:annotation_consolidation_config ->
  ?max_concurrent_task_count:max_concurrent_task_count ->
  ?task_availability_lifetime_in_seconds:task_availability_lifetime_in_seconds ->
  ?task_keywords:task_keywords ->
  ?pre_human_task_lambda_arn:lambda_function_arn ->
  task_time_limit_in_seconds:task_time_limit_in_seconds ->
  number_of_human_workers_per_data_object:number_of_human_workers_per_data_object ->
  task_description:task_description ->
  task_title:task_title ->
  ui_config:ui_config ->
  workteam_arn:workteam_arn ->
  unit ->
  human_task_config

val make_describe_labeling_job_response :
  ?labeling_job_output:labeling_job_output ->
  ?tags:tag_list ->
  ?labeling_job_algorithms_config:labeling_job_algorithms_config ->
  ?stopping_conditions:labeling_job_stopping_conditions ->
  ?label_category_config_s3_uri:s3_uri ->
  ?label_attribute_name:label_attribute_name ->
  ?failure_reason:failure_reason ->
  human_task_config:human_task_config ->
  role_arn:role_arn ->
  output_config:labeling_job_output_config ->
  input_config:labeling_job_input_config ->
  labeling_job_arn:labeling_job_arn ->
  labeling_job_name:labeling_job_name ->
  job_reference_code:job_reference_code ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  label_counters:label_counters ->
  labeling_job_status:labeling_job_status ->
  unit ->
  describe_labeling_job_response

val make_describe_labeling_job_request :
  labeling_job_name:labeling_job_name -> unit -> describe_labeling_job_request

val make_describe_job_schema_version_response :
  job_config_schema:job_config_document ->
  job_config_schema_version:job_schema_version ->
  job_category:job_category ->
  unit ->
  describe_job_schema_version_response

val make_describe_job_schema_version_request :
  ?job_config_schema_version:job_schema_version ->
  job_category:job_category ->
  unit ->
  describe_job_schema_version_request

val make_describe_job_response :
  ?tags:tag_list ->
  ?failure_reason:failure_reason ->
  ?end_time:timestamp ->
  ?job_config_document:job_config_document ->
  secondary_status_transitions:job_secondary_status_transitions ->
  secondary_status:job_secondary_status ->
  job_status:job_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  job_config_schema_version:job_schema_version ->
  job_category:job_category ->
  role_arn:role_arn ->
  job_arn:job_arn ->
  job_name:job_name ->
  unit ->
  describe_job_response

val make_describe_job_request :
  job_category:job_category -> job_name:job_name -> unit -> describe_job_request

val make_recommendation_job_resource_limit :
  ?max_parallel_of_tests:max_parallel_of_tests ->
  ?max_number_of_tests:max_number_of_tests ->
  unit ->
  recommendation_job_resource_limit

val make_categorical_parameter :
  value:categorical_parameter_range_values -> name:string64 -> unit -> categorical_parameter

val make_environment_parameter_ranges :
  ?categorical_parameter_ranges:categorical_parameters -> unit -> environment_parameter_ranges

val make_endpoint_input_configuration :
  ?environment_parameter_ranges:environment_parameter_ranges ->
  ?inference_specification_name:inference_specification_name ->
  ?serverless_config:production_variant_serverless_config ->
  ?instance_type:production_variant_instance_type ->
  unit ->
  endpoint_input_configuration

val make_recommendation_job_payload_config :
  ?supported_content_types:recommendation_job_supported_content_types ->
  ?sample_payload_url:s3_uri ->
  unit ->
  recommendation_job_payload_config

val make_recommendation_job_container_config :
  ?supported_response_mime_types:recommendation_job_supported_response_mime_types ->
  ?data_input_config:recommendation_job_data_input_config ->
  ?supported_endpoint_type:recommendation_job_supported_endpoint_type ->
  ?supported_instance_types:recommendation_job_supported_instance_types ->
  ?nearest_model_name:string_ ->
  ?payload_config:recommendation_job_payload_config ->
  ?framework_version:recommendation_job_framework_version ->
  ?framework:string_ ->
  ?task:string_ ->
  ?domain:string_ ->
  unit ->
  recommendation_job_container_config

val make_endpoint_info : ?endpoint_name:endpoint_name -> unit -> endpoint_info

val make_recommendation_job_vpc_config :
  subnets:recommendation_job_vpc_subnets ->
  security_group_ids:recommendation_job_vpc_security_group_ids ->
  unit ->
  recommendation_job_vpc_config

val make_recommendation_job_input_config :
  ?vpc_config:recommendation_job_vpc_config ->
  ?endpoints:endpoints ->
  ?container_config:recommendation_job_container_config ->
  ?volume_kms_key_id:kms_key_id ->
  ?endpoint_configurations:endpoint_input_configurations ->
  ?resource_limit:recommendation_job_resource_limit ->
  ?traffic_pattern:traffic_pattern ->
  ?job_duration_in_seconds:job_duration_in_seconds ->
  ?model_name:model_name ->
  ?model_package_version_arn:model_package_arn ->
  unit ->
  recommendation_job_input_config

val make_model_latency_threshold :
  ?value_in_milliseconds:integer -> ?percentile:string64 -> unit -> model_latency_threshold

val make_recommendation_job_stopping_conditions :
  ?flat_invocations:flat_invocations ->
  ?model_latency_thresholds:model_latency_thresholds ->
  ?max_invocations:integer ->
  unit ->
  recommendation_job_stopping_conditions

val make_inference_recommendation :
  ?invocation_start_time:invocation_start_time ->
  ?invocation_end_time:invocation_end_time ->
  ?metrics:recommendation_metrics ->
  ?recommendation_id:string_ ->
  model_configuration:model_configuration ->
  endpoint_configuration:endpoint_output_configuration ->
  unit ->
  inference_recommendation

val make_endpoint_performance :
  endpoint_info:endpoint_info -> metrics:inference_metrics -> unit -> endpoint_performance

val make_describe_inference_recommendations_job_response :
  ?endpoint_performances:endpoint_performances ->
  ?inference_recommendations:inference_recommendations ->
  ?stopping_conditions:recommendation_job_stopping_conditions ->
  ?failure_reason:failure_reason ->
  ?completion_time:timestamp ->
  ?job_description:recommendation_job_description ->
  input_config:recommendation_job_input_config ->
  last_modified_time:last_modified_time ->
  creation_time:creation_time ->
  status:recommendation_job_status ->
  role_arn:role_arn ->
  job_arn:recommendation_job_arn ->
  job_type:recommendation_job_type ->
  job_name:recommendation_job_name ->
  unit ->
  describe_inference_recommendations_job_response

val make_describe_inference_recommendations_job_request :
  job_name:recommendation_job_name -> unit -> describe_inference_recommendations_job_request

val make_endpoint_metadata :
  ?failure_reason:failure_reason ->
  ?endpoint_status:endpoint_status ->
  ?endpoint_config_name:endpoint_config_name ->
  endpoint_name:endpoint_name ->
  unit ->
  endpoint_metadata

val make_model_variant_config_summary :
  status:model_variant_status ->
  infrastructure_config:model_infrastructure_config ->
  variant_name:model_variant_name ->
  model_name:model_name ->
  unit ->
  model_variant_config_summary

val make_describe_inference_experiment_response :
  ?kms_key:kms_key_id ->
  ?shadow_mode_config:shadow_mode_config ->
  ?data_storage_config:inference_experiment_data_storage_config ->
  ?role_arn:role_arn ->
  ?last_modified_time:timestamp ->
  ?completion_time:timestamp ->
  ?creation_time:timestamp ->
  ?description:inference_experiment_description ->
  ?status_reason:inference_experiment_status_reason ->
  ?schedule:inference_experiment_schedule ->
  model_variants:model_variant_config_summary_list ->
  endpoint_metadata:endpoint_metadata ->
  status:inference_experiment_status ->
  type_:inference_experiment_type ->
  name:inference_experiment_name ->
  arn:inference_experiment_arn ->
  unit ->
  describe_inference_experiment_response

val make_describe_inference_experiment_request :
  name:inference_experiment_name -> unit -> describe_inference_experiment_request

val make_inference_component_container_specification_summary :
  ?container_metrics_config:container_metrics_config ->
  ?environment:environment_map ->
  ?artifact_url:url ->
  ?deployed_image:deployed_image ->
  unit ->
  inference_component_container_specification_summary

val make_inference_component_data_cache_config_summary :
  enable_caching:enable_caching -> unit -> inference_component_data_cache_config_summary

val make_inference_component_specification_summary :
  ?scheduling_config:inference_component_scheduling_config ->
  ?data_cache_config:inference_component_data_cache_config_summary ->
  ?base_inference_component_name:inference_component_name ->
  ?compute_resource_requirements:inference_component_compute_resource_requirements ->
  ?startup_parameters:inference_component_startup_parameters ->
  ?container:inference_component_container_specification_summary ->
  ?model_name:model_name ->
  ?instance_type:production_variant_instance_type ->
  unit ->
  inference_component_specification_summary

val make_inference_component_placement_status :
  current_copy_count:inference_component_copy_count ->
  instance_type:production_variant_instance_type ->
  unit ->
  inference_component_placement_status

val make_inference_component_runtime_config_summary :
  ?placement_status:inference_component_placement_status_list ->
  ?current_copy_count:inference_component_copy_count ->
  ?desired_copy_count:inference_component_copy_count ->
  unit ->
  inference_component_runtime_config_summary

val make_describe_inference_component_output :
  ?last_deployment_config:inference_component_deployment_config ->
  ?inference_component_status:inference_component_status ->
  ?runtime_config:inference_component_runtime_config_summary ->
  ?specifications:inference_component_specification_summary_list ->
  ?specification:inference_component_specification_summary ->
  ?failure_reason:failure_reason ->
  ?variant_name:variant_name ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  endpoint_arn:endpoint_arn ->
  endpoint_name:endpoint_name ->
  inference_component_arn:inference_component_arn ->
  inference_component_name:inference_component_name ->
  unit ->
  describe_inference_component_output

val make_describe_inference_component_input :
  inference_component_name:inference_component_name -> unit -> describe_inference_component_input

val make_describe_image_version_response :
  ?release_notes:release_notes ->
  ?horovod:horovod ->
  ?processor:processor ->
  ?programming_lang:programming_lang ->
  ?ml_framework:ml_framework ->
  ?job_type:job_type ->
  ?vendor_guidance:vendor_guidance ->
  ?version:image_version_number ->
  ?last_modified_time:timestamp ->
  ?image_version_status:image_version_status ->
  ?image_version_arn:image_version_arn ->
  ?image_arn:image_arn ->
  ?failure_reason:failure_reason ->
  ?creation_time:timestamp ->
  ?container_image:image_container_image ->
  ?base_image:image_base_image ->
  unit ->
  describe_image_version_response

val make_describe_image_version_request :
  ?alias:sage_maker_image_version_alias ->
  ?version:image_version_number ->
  image_name:image_name ->
  unit ->
  describe_image_version_request

val make_describe_image_response :
  ?role_arn:role_arn ->
  ?last_modified_time:timestamp ->
  ?image_status:image_status ->
  ?image_name:image_name ->
  ?image_arn:image_arn ->
  ?failure_reason:failure_reason ->
  ?display_name:image_display_name ->
  ?description:image_description ->
  ?creation_time:timestamp ->
  unit ->
  describe_image_response

val make_describe_image_request : image_name:image_name -> unit -> describe_image_request
val make_autotune : mode:autotune_mode -> unit -> autotune

val make_describe_hyper_parameter_tuning_job_response :
  ?consumed_resources:hyper_parameter_tuning_job_consumed_resources ->
  ?tuning_job_completion_details:hyper_parameter_tuning_job_completion_details ->
  ?failure_reason:failure_reason ->
  ?autotune:autotune ->
  ?warm_start_config:hyper_parameter_tuning_job_warm_start_config ->
  ?overall_best_training_job:hyper_parameter_training_job_summary ->
  ?best_training_job:hyper_parameter_training_job_summary ->
  ?last_modified_time:timestamp ->
  ?hyper_parameter_tuning_end_time:timestamp ->
  ?training_job_definitions:hyper_parameter_training_job_definitions ->
  ?training_job_definition:hyper_parameter_training_job_definition ->
  objective_status_counters:objective_status_counters ->
  training_job_status_counters:training_job_status_counters ->
  creation_time:timestamp ->
  hyper_parameter_tuning_job_status:hyper_parameter_tuning_job_status ->
  hyper_parameter_tuning_job_config:hyper_parameter_tuning_job_config ->
  hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  describe_hyper_parameter_tuning_job_response

val make_describe_hyper_parameter_tuning_job_request :
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  describe_hyper_parameter_tuning_job_request

val make_describe_human_task_ui_response :
  ?human_task_ui_status:human_task_ui_status ->
  ui_template:ui_template_info ->
  creation_time:timestamp ->
  human_task_ui_name:human_task_ui_name ->
  human_task_ui_arn:human_task_ui_arn ->
  unit ->
  describe_human_task_ui_response

val make_describe_human_task_ui_request :
  human_task_ui_name:human_task_ui_name -> unit -> describe_human_task_ui_request

val make_hub_content_dependency :
  ?dependency_copy_path:dependency_copy_path ->
  ?dependency_origin_path:dependency_origin_path ->
  unit ->
  hub_content_dependency

val make_describe_hub_content_response :
  ?last_modified_time:timestamp ->
  ?failure_reason:failure_reason ->
  ?hub_content_dependencies:hub_content_dependency_list ->
  ?hub_content_search_keywords:hub_content_search_keyword_list ->
  ?support_status:hub_content_support_status ->
  ?reference_min_version:reference_min_version ->
  ?sage_maker_public_hub_content_arn:sage_maker_public_hub_content_arn ->
  ?hub_content_markdown:hub_content_markdown ->
  ?hub_content_description:hub_content_description ->
  ?hub_content_display_name:hub_content_display_name ->
  creation_time:timestamp ->
  hub_content_status:hub_content_status ->
  hub_content_document:hub_content_document ->
  hub_arn:hub_arn ->
  hub_name:hub_name ->
  document_schema_version:document_schema_version ->
  hub_content_type:hub_content_type ->
  hub_content_version:hub_content_version ->
  hub_content_arn:hub_content_arn ->
  hub_content_name:hub_content_name ->
  unit ->
  describe_hub_content_response

val make_describe_hub_content_request :
  ?hub_content_version:hub_content_version ->
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  hub_name:hub_name_or_arn ->
  unit ->
  describe_hub_content_request

val make_hub_s3_storage_config : ?s3_output_path:s3_output_path -> unit -> hub_s3_storage_config

val make_describe_hub_response :
  ?failure_reason:failure_reason ->
  ?s3_storage_config:hub_s3_storage_config ->
  ?hub_search_keywords:hub_search_keyword_list ->
  ?hub_description:hub_description ->
  ?hub_display_name:hub_display_name ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  hub_status:hub_status ->
  hub_arn:hub_arn ->
  hub_name:hub_name ->
  unit ->
  describe_hub_response

val make_describe_hub_request : hub_name:hub_name_or_arn -> unit -> describe_hub_request

val make_human_loop_request_source :
  aws_managed_human_loop_request_source:aws_managed_human_loop_request_source ->
  unit ->
  human_loop_request_source

val make_human_loop_activation_conditions_config :
  human_loop_activation_conditions:human_loop_activation_conditions ->
  unit ->
  human_loop_activation_conditions_config

val make_human_loop_activation_config :
  human_loop_activation_conditions_config:human_loop_activation_conditions_config ->
  unit ->
  human_loop_activation_config

val make_human_loop_config :
  ?public_workforce_task_price:public_workforce_task_price ->
  ?task_keywords:flow_definition_task_keywords ->
  ?task_time_limit_in_seconds:flow_definition_task_time_limit_in_seconds ->
  ?task_availability_lifetime_in_seconds:flow_definition_task_availability_lifetime_in_seconds ->
  task_count:flow_definition_task_count ->
  task_description:flow_definition_task_description ->
  task_title:flow_definition_task_title ->
  human_task_ui_arn:human_task_ui_arn ->
  workteam_arn:workteam_arn ->
  unit ->
  human_loop_config

val make_flow_definition_output_config :
  ?kms_key_id:kms_key_id -> s3_output_path:s3_uri -> unit -> flow_definition_output_config

val make_describe_flow_definition_response :
  ?failure_reason:failure_reason ->
  ?human_loop_config:human_loop_config ->
  ?human_loop_activation_config:human_loop_activation_config ->
  ?human_loop_request_source:human_loop_request_source ->
  role_arn:role_arn ->
  output_config:flow_definition_output_config ->
  creation_time:timestamp ->
  flow_definition_status:flow_definition_status ->
  flow_definition_name:flow_definition_name ->
  flow_definition_arn:flow_definition_arn ->
  unit ->
  describe_flow_definition_response

val make_describe_flow_definition_request :
  flow_definition_name:flow_definition_name -> unit -> describe_flow_definition_request

val make_describe_feature_metadata_response :
  ?parameters:feature_parameters ->
  ?description:feature_description ->
  last_modified_time:last_modified_time ->
  creation_time:creation_time ->
  feature_type:feature_type ->
  feature_name:feature_name ->
  feature_group_name:feature_group_name ->
  feature_group_arn:feature_group_arn ->
  unit ->
  describe_feature_metadata_response

val make_describe_feature_metadata_request :
  feature_name:feature_name ->
  feature_group_name:feature_group_name_or_arn ->
  unit ->
  describe_feature_metadata_request

val make_describe_feature_group_response :
  ?online_store_total_size_bytes:online_store_total_size_bytes ->
  ?description:description ->
  ?failure_reason:failure_reason ->
  ?last_update_status:last_update_status ->
  ?offline_store_status:offline_store_status ->
  ?feature_group_status:feature_group_status ->
  ?role_arn:role_arn ->
  ?throughput_config:throughput_config_description ->
  ?offline_store_config:offline_store_config ->
  ?online_store_config:online_store_config ->
  ?last_modified_time:last_modified_time ->
  next_token:next_token ->
  creation_time:creation_time ->
  feature_definitions:feature_definitions ->
  event_time_feature_name:feature_name ->
  record_identifier_feature_name:feature_name ->
  feature_group_name:feature_group_name ->
  feature_group_arn:feature_group_arn ->
  unit ->
  describe_feature_group_response

val make_describe_feature_group_request :
  ?next_token:next_token ->
  feature_group_name:feature_group_name_or_arn ->
  unit ->
  describe_feature_group_request

val make_describe_experiment_response :
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?description:experiment_description ->
  ?source:experiment_source ->
  ?display_name:experiment_entity_name ->
  ?experiment_arn:experiment_arn ->
  ?experiment_name:experiment_entity_name ->
  unit ->
  describe_experiment_response

val make_describe_experiment_request :
  experiment_name:experiment_entity_name -> unit -> describe_experiment_request

val make_instance_pool :
  ?model_name_override:model_name ->
  priority:instance_pool_priority ->
  instance_type:production_variant_instance_type ->
  unit ->
  instance_pool

val make_production_variant_core_dump_config :
  ?kms_key_id:kms_key_id ->
  destination_s3_uri:destination_s3_uri ->
  unit ->
  production_variant_core_dump_config

val make_production_variant_capacity_reservation_config :
  ?ml_reservation_arn:ml_reservation_arn ->
  ?capacity_reservation_preference:capacity_reservation_preference ->
  unit ->
  production_variant_capacity_reservation_config

val make_production_variant :
  ?capacity_reservation_config:production_variant_capacity_reservation_config ->
  ?inference_ami_version:production_variant_inference_ami_version ->
  ?routing_config:production_variant_routing_config ->
  ?managed_instance_scaling:production_variant_managed_instance_scaling ->
  ?enable_ssm_access:production_variant_ssm_access ->
  ?container_startup_health_check_timeout_in_seconds:
    production_variant_container_startup_health_check_timeout_in_seconds ->
  ?model_data_download_timeout_in_seconds:production_variant_model_data_download_timeout_in_seconds ->
  ?volume_size_in_g_b:production_variant_volume_size_in_g_b ->
  ?serverless_config:production_variant_serverless_config ->
  ?core_dump_config:production_variant_core_dump_config ->
  ?accelerator_type:production_variant_accelerator_type ->
  ?initial_variant_weight:variant_weight ->
  ?variant_instance_provision_timeout_in_seconds:variant_instance_provision_timeout_in_seconds ->
  ?instance_pools:instance_pool_list ->
  ?instance_type:production_variant_instance_type ->
  ?initial_instance_count:initial_task_count ->
  ?model_name:model_name ->
  variant_name:variant_name ->
  unit ->
  production_variant

val make_capture_option : capture_mode:capture_mode -> unit -> capture_option

val make_data_capture_config :
  ?capture_content_type_header:capture_content_type_header ->
  ?kms_key_id:kms_key_id ->
  ?enable_capture:enable_capture ->
  capture_options:capture_option_list ->
  destination_s3_uri:destination_s3_uri ->
  initial_sampling_percentage:sampling_percentage ->
  unit ->
  data_capture_config

val make_async_inference_client_config :
  ?max_concurrent_invocations_per_instance:max_concurrent_invocations_per_instance ->
  unit ->
  async_inference_client_config

val make_async_inference_notification_config :
  ?include_inference_response_in:async_notification_topic_type_list ->
  ?error_topic:sns_topic_arn ->
  ?success_topic:sns_topic_arn ->
  unit ->
  async_inference_notification_config

val make_async_inference_output_config :
  ?s3_failure_path:destination_s3_uri ->
  ?notification_config:async_inference_notification_config ->
  ?s3_output_path:destination_s3_uri ->
  ?kms_key_id:kms_key_id ->
  unit ->
  async_inference_output_config

val make_async_inference_config :
  ?client_config:async_inference_client_config ->
  output_config:async_inference_output_config ->
  unit ->
  async_inference_config

val make_clarify_inference_config :
  ?feature_types:clarify_feature_types ->
  ?feature_headers:clarify_feature_headers ->
  ?label_headers:clarify_label_headers ->
  ?label_attribute:clarify_label_attribute ->
  ?probability_attribute:clarify_probability_attribute ->
  ?label_index:clarify_label_index ->
  ?probability_index:clarify_probability_index ->
  ?max_payload_in_m_b:clarify_max_payload_in_m_b ->
  ?max_record_count:clarify_max_record_count ->
  ?content_template:clarify_content_template ->
  ?features_attribute:clarify_features_attribute ->
  unit ->
  clarify_inference_config

val make_clarify_shap_baseline_config :
  ?shap_baseline_uri:url ->
  ?shap_baseline:clarify_shap_baseline ->
  ?mime_type:clarify_mime_type ->
  unit ->
  clarify_shap_baseline_config

val make_clarify_text_config :
  granularity:clarify_text_granularity ->
  language:clarify_text_language ->
  unit ->
  clarify_text_config

val make_clarify_shap_config :
  ?text_config:clarify_text_config ->
  ?seed:clarify_shap_seed ->
  ?use_logit:clarify_shap_use_logit ->
  ?number_of_samples:clarify_shap_number_of_samples ->
  shap_baseline_config:clarify_shap_baseline_config ->
  unit ->
  clarify_shap_config

val make_clarify_explainer_config :
  ?inference_config:clarify_inference_config ->
  ?enable_explanations:clarify_enable_explanations ->
  shap_config:clarify_shap_config ->
  unit ->
  clarify_explainer_config

val make_explainer_config :
  ?clarify_explainer_config:clarify_explainer_config -> unit -> explainer_config

val make_metrics_config :
  ?metric_publish_frequency_in_seconds:metric_publish_frequency_in_seconds ->
  ?enable_detailed_observability:enable_detailed_observability ->
  ?enable_enhanced_metrics:enable_enhanced_metrics ->
  unit ->
  metrics_config

val make_describe_endpoint_config_output :
  ?metrics_config:metrics_config ->
  ?enable_network_isolation:boolean_ ->
  ?vpc_config:vpc_config ->
  ?execution_role_arn:role_arn ->
  ?shadow_production_variants:production_variant_list ->
  ?explainer_config:explainer_config ->
  ?async_inference_config:async_inference_config ->
  ?kms_key_id:kms_key_id ->
  ?data_capture_config:data_capture_config ->
  creation_time:timestamp ->
  production_variants:production_variant_list ->
  endpoint_config_arn:endpoint_config_arn ->
  endpoint_config_name:endpoint_config_name ->
  unit ->
  describe_endpoint_config_output

val make_describe_endpoint_config_input :
  endpoint_config_name:endpoint_config_name -> unit -> describe_endpoint_config_input

val make_pending_production_variant_summary :
  ?routing_config:production_variant_routing_config ->
  ?managed_instance_scaling:production_variant_managed_instance_scaling ->
  ?desired_serverless_config:production_variant_serverless_config ->
  ?current_serverless_config:production_variant_serverless_config ->
  ?variant_status:production_variant_status_list ->
  ?accelerator_type:production_variant_accelerator_type ->
  ?instance_pools:instance_pool_summary_list ->
  ?instance_type:production_variant_instance_type ->
  ?desired_instance_count:task_count ->
  ?current_instance_count:task_count ->
  ?desired_weight:variant_weight ->
  ?current_weight:variant_weight ->
  ?deployed_images:deployed_images ->
  variant_name:variant_name ->
  unit ->
  pending_production_variant_summary

val make_pending_deployment_summary :
  ?shadow_production_variants:pending_production_variant_summary_list ->
  ?start_time:timestamp ->
  ?production_variants:pending_production_variant_summary_list ->
  endpoint_config_name:endpoint_config_name ->
  unit ->
  pending_deployment_summary

val make_describe_endpoint_output :
  ?metrics_config:metrics_config ->
  ?shadow_production_variants:production_variant_summary_list ->
  ?explainer_config:explainer_config ->
  ?pending_deployment_summary:pending_deployment_summary ->
  ?async_inference_config:async_inference_config ->
  ?last_deployment_config:deployment_config ->
  ?failure_reason:failure_reason ->
  ?data_capture_config:data_capture_config_summary ->
  ?production_variants:production_variant_summary_list ->
  ?endpoint_config_name:endpoint_config_name ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  endpoint_status:endpoint_status ->
  endpoint_arn:endpoint_arn ->
  endpoint_name:endpoint_name ->
  unit ->
  describe_endpoint_output

val make_describe_endpoint_input : endpoint_name:endpoint_name -> unit -> describe_endpoint_input

val make_edge_preset_deployment_output :
  ?status_message:string_ ->
  ?status:edge_preset_deployment_status ->
  ?artifact:edge_preset_deployment_artifact ->
  type_:edge_preset_deployment_type ->
  unit ->
  edge_preset_deployment_output

val make_describe_edge_packaging_job_response :
  ?preset_deployment_output:edge_preset_deployment_output ->
  ?model_signature:string_ ->
  ?model_artifact:s3_uri ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?edge_packaging_job_status_message:string_ ->
  ?resource_key:kms_key_id ->
  ?output_config:edge_output_config ->
  ?role_arn:role_arn ->
  ?model_version:edge_version ->
  ?model_name:entity_name ->
  ?compilation_job_name:entity_name ->
  edge_packaging_job_status:edge_packaging_job_status ->
  edge_packaging_job_name:entity_name ->
  edge_packaging_job_arn:edge_packaging_job_arn ->
  unit ->
  describe_edge_packaging_job_response

val make_describe_edge_packaging_job_request :
  edge_packaging_job_name:entity_name -> unit -> describe_edge_packaging_job_request

val make_edge_deployment_model_config :
  edge_packaging_job_name:entity_name ->
  model_handle:entity_name ->
  unit ->
  edge_deployment_model_config

val make_device_selection_config :
  ?device_name_contains:device_name ->
  ?device_names:device_names ->
  ?percentage:percentage ->
  device_subset_type:device_subset_type ->
  unit ->
  device_selection_config

val make_edge_deployment_config :
  failure_handling_policy:failure_handling_policy -> unit -> edge_deployment_config

val make_edge_deployment_status :
  ?edge_deployment_stage_start_time:timestamp ->
  ?edge_deployment_status_message:string_ ->
  edge_deployment_failed_in_stage:integer ->
  edge_deployment_pending_in_stage:integer ->
  edge_deployment_success_in_stage:integer ->
  stage_status:stage_status ->
  unit ->
  edge_deployment_status

val make_deployment_stage_status_summary :
  deployment_status:edge_deployment_status ->
  deployment_config:edge_deployment_config ->
  device_selection_config:device_selection_config ->
  stage_name:entity_name ->
  unit ->
  deployment_stage_status_summary

val make_describe_edge_deployment_plan_response :
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?next_token:next_token ->
  ?edge_deployment_failed:integer ->
  ?edge_deployment_pending:integer ->
  ?edge_deployment_success:integer ->
  stages:deployment_stage_status_summaries ->
  device_fleet_name:entity_name ->
  model_configs:edge_deployment_model_configs ->
  edge_deployment_plan_name:entity_name ->
  edge_deployment_plan_arn:edge_deployment_plan_arn ->
  unit ->
  describe_edge_deployment_plan_response

val make_describe_edge_deployment_plan_request :
  ?max_results:deployment_stage_max_results ->
  ?next_token:next_token ->
  edge_deployment_plan_name:entity_name ->
  unit ->
  describe_edge_deployment_plan_request

val make_r_studio_server_pro_domain_settings :
  ?default_resource_spec:resource_spec ->
  ?r_studio_package_manager_url:string_ ->
  ?r_studio_connect_url:string_ ->
  domain_execution_role_arn:role_arn ->
  unit ->
  r_studio_server_pro_domain_settings

val make_domain_settings :
  ?ip_address_type:ip_address_type ->
  ?unified_studio_settings:unified_studio_settings ->
  ?amazon_q_settings:amazon_q_settings ->
  ?docker_settings:docker_settings ->
  ?trusted_identity_propagation_settings:trusted_identity_propagation_settings ->
  ?execution_role_identity_config:execution_role_identity_config ->
  ?r_studio_server_pro_domain_settings:r_studio_server_pro_domain_settings ->
  ?security_group_ids:domain_security_group_ids ->
  unit ->
  domain_settings

val make_describe_domain_response :
  ?default_space_settings:default_space_settings ->
  ?tag_propagation:tag_propagation ->
  ?home_efs_file_system_creation:home_efs_file_system_creation ->
  ?app_security_group_management:app_security_group_management ->
  ?kms_key_id:kms_key_id ->
  ?vpc_id:vpc_id ->
  ?url:string1024 ->
  ?subnet_ids:subnets ->
  ?home_efs_file_system_kms_key_id:kms_key_id ->
  ?app_network_access_type:app_network_access_type ->
  ?domain_settings:domain_settings ->
  ?default_user_settings:user_settings ->
  ?auth_mode:auth_mode ->
  ?security_group_id_for_domain_boundary:security_group_id ->
  ?failure_reason:failure_reason ->
  ?last_modified_time:last_modified_time ->
  ?creation_time:creation_time ->
  ?status:domain_status ->
  ?single_sign_on_application_arn:single_sign_on_application_arn ->
  ?single_sign_on_managed_application_instance_id:string256 ->
  ?home_efs_file_system_id:resource_id ->
  ?domain_name:domain_name ->
  ?domain_id:domain_id ->
  ?domain_arn:domain_arn ->
  unit ->
  describe_domain_response

val make_describe_domain_request : domain_id:domain_id -> unit -> describe_domain_request

val make_describe_device_fleet_response :
  ?iot_role_alias:iot_role_alias ->
  ?role_arn:role_arn ->
  ?description:device_fleet_description ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  output_config:edge_output_config ->
  device_fleet_arn:device_fleet_arn ->
  device_fleet_name:entity_name ->
  unit ->
  describe_device_fleet_response

val make_describe_device_fleet_request :
  device_fleet_name:entity_name -> unit -> describe_device_fleet_request

val make_edge_model :
  ?latest_inference:timestamp ->
  ?latest_sample_time:timestamp ->
  model_version:edge_version ->
  model_name:entity_name ->
  unit ->
  edge_model

val make_describe_device_response :
  ?agent_version:edge_version ->
  ?next_token:next_token ->
  ?max_models:integer ->
  ?models:edge_models ->
  ?latest_heartbeat:timestamp ->
  ?iot_thing_name:thing_name ->
  ?description:device_description ->
  ?device_arn:device_arn ->
  registration_time:timestamp ->
  device_fleet_name:entity_name ->
  device_name:entity_name ->
  unit ->
  describe_device_response

val make_describe_device_request :
  ?next_token:next_token ->
  device_fleet_name:entity_name ->
  device_name:entity_name ->
  unit ->
  describe_device_request

val make_data_quality_baseline_config :
  ?statistics_resource:monitoring_statistics_resource ->
  ?constraints_resource:monitoring_constraints_resource ->
  ?baselining_job_name:processing_job_name ->
  unit ->
  data_quality_baseline_config

val make_data_quality_app_specification :
  ?environment:monitoring_environment_map ->
  ?post_analytics_processor_source_uri:s3_uri ->
  ?record_preprocessor_source_uri:s3_uri ->
  ?container_arguments:monitoring_container_arguments ->
  ?container_entrypoint:container_entrypoint ->
  image_uri:image_uri ->
  unit ->
  data_quality_app_specification

val make_data_quality_job_input :
  ?batch_transform_input:batch_transform_input ->
  ?endpoint_input:endpoint_input ->
  unit ->
  data_quality_job_input

val make_describe_data_quality_job_definition_response :
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?data_quality_baseline_config:data_quality_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  data_quality_job_output_config:monitoring_output_config ->
  data_quality_job_input:data_quality_job_input ->
  data_quality_app_specification:data_quality_app_specification ->
  creation_time:timestamp ->
  job_definition_name:monitoring_job_definition_name ->
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  describe_data_quality_job_definition_response

val make_describe_data_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  describe_data_quality_job_definition_request

val make_describe_context_response :
  ?lineage_group_arn:lineage_group_arn ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?properties:lineage_entity_parameters ->
  ?description:experiment_description ->
  ?context_type:string256 ->
  ?source:context_source ->
  ?context_arn:context_arn ->
  ?context_name:context_name ->
  unit ->
  describe_context_response

val make_describe_context_request :
  context_name:context_name_or_arn -> unit -> describe_context_request

val make_describe_compute_quota_response :
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?activation_state:activation_state ->
  ?compute_quota_config:compute_quota_config ->
  ?cluster_arn:cluster_arn ->
  ?failure_reason:failure_reason ->
  ?description:entity_description ->
  creation_time:timestamp ->
  compute_quota_target:compute_quota_target ->
  status:scheduler_resource_status ->
  compute_quota_version:integer ->
  name:entity_name ->
  compute_quota_id:compute_quota_id ->
  compute_quota_arn:compute_quota_arn ->
  unit ->
  describe_compute_quota_response

val make_describe_compute_quota_request :
  ?compute_quota_version:integer ->
  compute_quota_id:compute_quota_id ->
  unit ->
  describe_compute_quota_request

val make_model_digests : ?artifact_digest:artifact_digest -> unit -> model_digests

val make_input_config :
  ?framework_version:framework_version ->
  ?data_input_config:data_input_config ->
  framework:framework ->
  s3_uri:s3_uri ->
  unit ->
  input_config

val make_output_config :
  ?kms_key_id:kms_key_id ->
  ?compiler_options:compiler_options ->
  ?target_platform:target_platform ->
  ?target_device:target_device ->
  s3_output_location:s3_uri ->
  unit ->
  output_config

val make_neo_vpc_config :
  subnets:neo_vpc_subnets -> security_group_ids:neo_vpc_security_group_ids -> unit -> neo_vpc_config

val make_derived_information :
  ?derived_data_input_config:data_input_config -> unit -> derived_information

val make_describe_compilation_job_response :
  ?derived_information:derived_information ->
  ?vpc_config:neo_vpc_config ->
  ?model_digests:model_digests ->
  ?model_package_version_arn:model_package_arn ->
  ?inference_image:inference_image ->
  ?compilation_end_time:timestamp ->
  ?compilation_start_time:timestamp ->
  output_config:output_config ->
  input_config:input_config ->
  role_arn:role_arn ->
  model_artifacts:model_artifacts ->
  failure_reason:failure_reason ->
  last_modified_time:last_modified_time ->
  creation_time:creation_time ->
  stopping_condition:stopping_condition ->
  compilation_job_status:compilation_job_status ->
  compilation_job_arn:compilation_job_arn ->
  compilation_job_name:entity_name ->
  unit ->
  describe_compilation_job_response

val make_describe_compilation_job_request :
  compilation_job_name:entity_name -> unit -> describe_compilation_job_request

val make_describe_code_repository_output :
  ?git_config:git_config ->
  last_modified_time:last_modified_time ->
  creation_time:creation_time ->
  code_repository_arn:code_repository_arn ->
  code_repository_name:entity_name ->
  unit ->
  describe_code_repository_output

val make_describe_code_repository_input :
  code_repository_name:entity_name -> unit -> describe_code_repository_input

val make_describe_cluster_scheduler_config_response :
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?description:entity_description ->
  ?scheduler_config:scheduler_config ->
  ?cluster_arn:cluster_arn ->
  ?status_details:status_details_map ->
  ?failure_reason:failure_reason ->
  creation_time:timestamp ->
  status:scheduler_resource_status ->
  cluster_scheduler_config_version:integer ->
  name:entity_name ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  unit ->
  describe_cluster_scheduler_config_response

val make_describe_cluster_scheduler_config_request :
  ?cluster_scheduler_config_version:integer ->
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  unit ->
  describe_cluster_scheduler_config_request

val make_cluster_instance_placement :
  ?availability_zone_id:cluster_availability_zone_id ->
  ?availability_zone:cluster_availability_zone ->
  unit ->
  cluster_instance_placement

val make_cluster_kubernetes_config_node_details :
  ?desired_taints:cluster_kubernetes_taints ->
  ?current_taints:cluster_kubernetes_taints ->
  ?desired_labels:cluster_kubernetes_labels ->
  ?current_labels:cluster_kubernetes_labels ->
  unit ->
  cluster_kubernetes_config_node_details

val make_cluster_network_interface_details :
  ?interface_type:cluster_interface_type -> unit -> cluster_network_interface_details

val make_cluster_node_details :
  ?network_interface:cluster_network_interface_details ->
  ?capacity_type:cluster_capacity_type ->
  ?kubernetes_config:cluster_kubernetes_config_node_details ->
  ?ultra_server_info:ultra_server_info ->
  ?image_version_status:cluster_image_version_status ->
  ?desired_image_release_version:image_release_version ->
  ?current_image_release_version:image_release_version ->
  ?desired_image_id:image_id ->
  ?current_image_id:image_id ->
  ?placement:cluster_instance_placement ->
  ?private_dns_hostname:cluster_private_dns_hostname ->
  ?private_primary_ipv6:cluster_private_primary_ipv6 ->
  ?private_primary_ip:cluster_private_primary_ip ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?threads_per_core:cluster_threads_per_core ->
  ?override_vpc_config:vpc_config ->
  ?life_cycle_config:cluster_life_cycle_config ->
  ?last_software_update_time:timestamp ->
  ?launch_time:timestamp ->
  ?instance_type:cluster_instance_type ->
  ?instance_status:cluster_instance_status_details ->
  ?node_logical_id:cluster_node_logical_id ->
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_group_name:cluster_instance_group_name ->
  unit ->
  cluster_node_details

val make_describe_cluster_node_response :
  node_details:cluster_node_details -> unit -> describe_cluster_node_response

val make_describe_cluster_node_request :
  ?node_logical_id:cluster_node_logical_id ->
  ?node_id:cluster_node_id ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  describe_cluster_node_request

val make_cluster_metadata :
  ?slr_access_entry:Smaws_Lib.Smithy_api.Types.string_ ->
  ?eks_role_access_entries:eks_role_access_entries ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  cluster_metadata

val make_capacity_reservation :
  ?type_:capacity_reservation_type ->
  ?arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  capacity_reservation

val make_instance_group_metadata :
  ?ami_override:Smaws_Lib.Smithy_api.Types.string_ ->
  ?security_group_ids:security_group_ids ->
  ?subnet_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?capacity_reservation:capacity_reservation ->
  ?availability_zone_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  instance_group_metadata

val make_instance_group_scaling_metadata :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?min_count:instance_count ->
  ?target_count:target_count ->
  ?instance_count:instance_count ->
  unit ->
  instance_group_scaling_metadata

val make_additional_enis : ?efa_enis:efa_enis -> unit -> additional_enis

val make_instance_requirements_eni_configuration :
  ?additional_enis:additional_enis ->
  ?customer_eni:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  instance_requirements_eni_configuration

val make_instance_metadata :
  ?node_logical_id:cluster_node_logical_id ->
  ?lcs_execution_state:Smaws_Lib.Smithy_api.Types.string_ ->
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?capacity_reservation:capacity_reservation ->
  ?instance_requirements_eni_configurations:instance_requirements_eni_configurations ->
  ?additional_enis:additional_enis ->
  ?customer_eni:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  instance_metadata

val make_event_details : ?event_metadata:event_metadata -> unit -> event_details

val make_cluster_event_detail :
  ?event_level:cluster_event_level ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_details:event_details ->
  ?instance_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instance_group_name:cluster_instance_group_name ->
  event_time:timestamp ->
  resource_type:cluster_event_resource_type ->
  cluster_name:cluster_name ->
  cluster_arn:cluster_arn ->
  event_id:event_id ->
  unit ->
  cluster_event_detail

val make_describe_cluster_event_response :
  ?event_details:cluster_event_detail -> unit -> describe_cluster_event_response

val make_describe_cluster_event_request :
  cluster_name:cluster_name_or_arn -> event_id:event_id -> unit -> describe_cluster_event_request

val make_cluster_instance_requirement_details :
  ?desired_instance_types:cluster_instance_types ->
  ?current_instance_types:cluster_instance_types ->
  unit ->
  cluster_instance_requirement_details

val make_cluster_instance_type_detail :
  ?threads_per_core:cluster_threads_per_core ->
  ?current_count:cluster_non_negative_instance_count ->
  ?instance_type:cluster_instance_type ->
  unit ->
  cluster_instance_type_detail

val make_cluster_patch_schedule_details :
  ?next_patch_date:timestamp -> unit -> cluster_patch_schedule_details

val make_cluster_auto_patch_config_details :
  ?deployment_config:deployment_configuration ->
  ?desired_patch_schedule:cluster_patch_schedule_details ->
  ?current_patch_schedule:cluster_patch_schedule_details ->
  ?patching_strategy:cluster_patching_strategy ->
  unit ->
  cluster_auto_patch_config_details

val make_cluster_kubernetes_config_details :
  ?desired_taints:cluster_kubernetes_taints ->
  ?current_taints:cluster_kubernetes_taints ->
  ?desired_labels:cluster_kubernetes_labels ->
  ?current_labels:cluster_kubernetes_labels ->
  unit ->
  cluster_kubernetes_config_details

val make_cluster_slurm_config_details :
  ?partition_names:cluster_partition_names ->
  node_type:cluster_slurm_node_type ->
  unit ->
  cluster_slurm_config_details

val make_cluster_instance_group_details :
  ?network_interface:cluster_network_interface_details ->
  ?slurm_config:cluster_slurm_config_details ->
  ?active_software_update_config:deployment_configuration ->
  ?software_update_status:software_update_status ->
  ?target_state_count:cluster_instance_count ->
  ?capacity_requirements:cluster_capacity_requirements ->
  ?kubernetes_config:cluster_kubernetes_config_details ->
  ?active_operations:active_operations ->
  ?image_version_status:cluster_image_version_status ->
  ?desired_image_release_version:image_release_version ->
  ?current_image_release_version:image_release_version ->
  ?desired_image_id:image_id ->
  ?current_image_id:image_id ->
  ?auto_patch_config:cluster_auto_patch_config_details ->
  ?scheduled_update_config:scheduled_update_config ->
  ?override_vpc_config:vpc_config ->
  ?training_plan_status:instance_group_training_plan_status ->
  ?training_plan_arn:training_plan_arn ->
  ?status:instance_group_status ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?threads_per_core:cluster_threads_per_core ->
  ?execution_role:role_arn ->
  ?life_cycle_config:cluster_life_cycle_config ->
  ?instance_type_details:cluster_instance_type_details ->
  ?instance_requirements:cluster_instance_requirement_details ->
  ?instance_type:cluster_instance_type ->
  ?instance_group_name:cluster_instance_group_name ->
  ?min_count:cluster_instance_count ->
  ?target_count:cluster_instance_count ->
  ?current_count:cluster_non_negative_instance_count ->
  unit ->
  cluster_instance_group_details

val make_environment_config_details :
  ?s3_output_path:s3_uri ->
  ?f_sx_lustre_config:f_sx_lustre_config ->
  unit ->
  environment_config_details

val make_cluster_restricted_instance_group_details :
  ?environment_config:environment_config_details ->
  ?scheduled_update_config:scheduled_update_config ->
  ?override_vpc_config:vpc_config ->
  ?training_plan_status:instance_group_training_plan_status ->
  ?training_plan_arn:training_plan_arn ->
  ?status:instance_group_status ->
  ?on_start_deep_health_checks:on_start_deep_health_checks ->
  ?instance_storage_configs:cluster_instance_storage_configs ->
  ?threads_per_core:cluster_threads_per_core ->
  ?execution_role:role_arn ->
  ?instance_type:cluster_instance_type ->
  ?instance_group_name:cluster_instance_group_name ->
  ?target_count:cluster_instance_count ->
  ?current_count:cluster_non_negative_instance_count ->
  unit ->
  cluster_restricted_instance_group_details

val make_cluster_shared_environment_config_details :
  ?desired_f_sx_lustre_deletion_policy:cluster_f_sx_lustre_deletion_policy ->
  ?current_f_sx_lustre_deletion_policy:cluster_f_sx_lustre_deletion_policy ->
  ?desired_f_sx_lustre_config:f_sx_lustre_config ->
  ?current_f_sx_lustre_config:f_sx_lustre_config ->
  unit ->
  cluster_shared_environment_config_details

val make_cluster_restricted_instance_groups_config_output :
  shared_environment_config:cluster_shared_environment_config_details ->
  unit ->
  cluster_restricted_instance_groups_config_output

val make_cluster_auto_scaling_config_output :
  ?failure_message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?auto_scaler_type:cluster_auto_scaler_type ->
  status:cluster_auto_scaling_status ->
  mode:cluster_auto_scaling_mode ->
  unit ->
  cluster_auto_scaling_config_output

val make_describe_cluster_response :
  ?auto_scaling:cluster_auto_scaling_config_output ->
  ?cluster_role:role_arn ->
  ?node_provisioning_mode:cluster_node_provisioning_mode ->
  ?node_recovery:cluster_node_recovery ->
  ?tiered_storage_config:cluster_tiered_storage_config ->
  ?orchestrator:cluster_orchestrator ->
  ?vpc_config:vpc_config ->
  ?restricted_instance_groups_config:cluster_restricted_instance_groups_config_output ->
  ?restricted_instance_groups:cluster_restricted_instance_group_details_list ->
  ?failure_message:string_ ->
  ?creation_time:timestamp ->
  ?cluster_name:cluster_name ->
  instance_groups:cluster_instance_group_details_list ->
  cluster_status:cluster_status ->
  cluster_arn:cluster_arn ->
  unit ->
  describe_cluster_response

val make_describe_cluster_request :
  cluster_name:cluster_name_or_arn -> unit -> describe_cluster_request

val make_auto_mls3_data_source :
  s3_uri:s3_uri -> s3_data_type:auto_mls3_data_type -> unit -> auto_mls3_data_source

val make_auto_ml_data_source : s3_data_source:auto_mls3_data_source -> unit -> auto_ml_data_source

val make_auto_ml_job_channel :
  ?data_source:auto_ml_data_source ->
  ?compression_type:compression_type ->
  ?content_type:content_type ->
  ?channel_type:auto_ml_channel_type ->
  unit ->
  auto_ml_job_channel

val make_auto_ml_output_data_config :
  ?kms_key_id:kms_key_id -> s3_output_path:s3_uri -> unit -> auto_ml_output_data_config

val make_auto_ml_job_objective : metric_name:auto_ml_metric_enum -> unit -> auto_ml_job_objective

val make_image_classification_job_config :
  ?completion_criteria:auto_ml_job_completion_criteria -> unit -> image_classification_job_config

val make_auto_ml_job_artifacts :
  ?data_exploration_notebook_location:data_exploration_notebook_location ->
  ?candidate_definition_notebook_location:candidate_definition_notebook_location ->
  unit ->
  auto_ml_job_artifacts

val make_auto_ml_resolved_attributes :
  ?auto_ml_problem_type_resolved_attributes:auto_ml_problem_type_resolved_attributes ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  unit ->
  auto_ml_resolved_attributes

val make_model_deploy_config :
  ?endpoint_name:endpoint_name ->
  ?auto_generate_endpoint_name:auto_generate_endpoint_name ->
  unit ->
  model_deploy_config

val make_auto_ml_data_split_config :
  ?validation_fraction:validation_fraction -> unit -> auto_ml_data_split_config

val make_auto_ml_security_config :
  ?vpc_config:vpc_config ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?volume_kms_key_id:kms_key_id ->
  unit ->
  auto_ml_security_config

val make_emr_serverless_compute_config :
  execution_role_ar_n:role_arn -> unit -> emr_serverless_compute_config

val make_auto_ml_compute_config :
  ?emr_serverless_compute_config:emr_serverless_compute_config -> unit -> auto_ml_compute_config

val make_describe_auto_ml_job_v2_response :
  ?auto_ml_compute_config:auto_ml_compute_config ->
  ?security_config:auto_ml_security_config ->
  ?data_split_config:auto_ml_data_split_config ->
  ?model_deploy_result:model_deploy_result ->
  ?model_deploy_config:model_deploy_config ->
  ?resolved_attributes:auto_ml_resolved_attributes ->
  ?auto_ml_job_artifacts:auto_ml_job_artifacts ->
  ?best_candidate:auto_ml_candidate ->
  ?partial_failure_reasons:auto_ml_partial_failure_reasons ->
  ?failure_reason:auto_ml_failure_reason ->
  ?end_time:timestamp ->
  ?auto_ml_problem_type_config_name:auto_ml_problem_type_config_name ->
  ?auto_ml_problem_type_config:auto_ml_problem_type_config ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  auto_ml_job_secondary_status:auto_ml_job_secondary_status ->
  auto_ml_job_status:auto_ml_job_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  role_arn:role_arn ->
  output_data_config:auto_ml_output_data_config ->
  auto_ml_job_input_data_config:auto_ml_job_input_data_config ->
  auto_ml_job_arn:auto_ml_job_arn ->
  auto_ml_job_name:auto_ml_job_name ->
  unit ->
  describe_auto_ml_job_v2_response

val make_describe_auto_ml_job_v2_request :
  auto_ml_job_name:auto_ml_job_name -> unit -> describe_auto_ml_job_v2_request

val make_auto_ml_channel :
  ?sample_weight_attribute_name:sample_weight_attribute_name ->
  ?channel_type:auto_ml_channel_type ->
  ?content_type:content_type ->
  ?compression_type:compression_type ->
  ?data_source:auto_ml_data_source ->
  target_attribute_name:target_attribute_name ->
  unit ->
  auto_ml_channel

val make_auto_ml_candidate_generation_config :
  ?algorithms_config:auto_ml_algorithms_config ->
  ?feature_specification_s3_uri:s3_uri ->
  unit ->
  auto_ml_candidate_generation_config

val make_auto_ml_job_config :
  ?mode:auto_ml_mode ->
  ?data_split_config:auto_ml_data_split_config ->
  ?candidate_generation_config:auto_ml_candidate_generation_config ->
  ?security_config:auto_ml_security_config ->
  ?completion_criteria:auto_ml_job_completion_criteria ->
  unit ->
  auto_ml_job_config

val make_resolved_attributes :
  ?completion_criteria:auto_ml_job_completion_criteria ->
  ?problem_type:problem_type ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  unit ->
  resolved_attributes

val make_describe_auto_ml_job_response :
  ?model_deploy_result:model_deploy_result ->
  ?model_deploy_config:model_deploy_config ->
  ?resolved_attributes:resolved_attributes ->
  ?auto_ml_job_artifacts:auto_ml_job_artifacts ->
  ?generate_candidate_definitions_only:generate_candidate_definitions_only ->
  ?best_candidate:auto_ml_candidate ->
  ?partial_failure_reasons:auto_ml_partial_failure_reasons ->
  ?failure_reason:auto_ml_failure_reason ->
  ?end_time:timestamp ->
  ?auto_ml_job_config:auto_ml_job_config ->
  ?problem_type:problem_type ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  auto_ml_job_secondary_status:auto_ml_job_secondary_status ->
  auto_ml_job_status:auto_ml_job_status ->
  last_modified_time:timestamp ->
  creation_time:timestamp ->
  role_arn:role_arn ->
  output_data_config:auto_ml_output_data_config ->
  input_data_config:auto_ml_input_data_config ->
  auto_ml_job_arn:auto_ml_job_arn ->
  auto_ml_job_name:auto_ml_job_name ->
  unit ->
  describe_auto_ml_job_response

val make_describe_auto_ml_job_request :
  auto_ml_job_name:auto_ml_job_name -> unit -> describe_auto_ml_job_request

val make_describe_artifact_response :
  ?lineage_group_arn:lineage_group_arn ->
  ?metadata_properties:metadata_properties ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?properties:lineage_entity_parameters ->
  ?artifact_type:string256 ->
  ?source:artifact_source ->
  ?artifact_arn:artifact_arn ->
  ?artifact_name:experiment_entity_name_or_arn ->
  unit ->
  describe_artifact_response

val make_describe_artifact_request : artifact_arn:artifact_arn -> unit -> describe_artifact_request

val make_describe_app_image_config_response :
  ?code_editor_app_image_config:code_editor_app_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  ?last_modified_time:timestamp ->
  ?creation_time:timestamp ->
  ?app_image_config_name:app_image_config_name ->
  ?app_image_config_arn:app_image_config_arn ->
  unit ->
  describe_app_image_config_response

val make_describe_app_image_config_request :
  app_image_config_name:app_image_config_name -> unit -> describe_app_image_config_request

val make_describe_app_response :
  ?built_in_lifecycle_config_arn:studio_lifecycle_config_arn ->
  ?resource_spec:resource_spec ->
  ?failure_reason:failure_reason ->
  ?creation_time:timestamp ->
  ?last_user_activity_timestamp:timestamp ->
  ?last_health_check_timestamp:timestamp ->
  ?recovery_mode:boolean_ ->
  ?effective_trusted_identity_propagation_status:feature_status ->
  ?status:app_status ->
  ?space_name:space_name ->
  ?user_profile_name:user_profile_name ->
  ?domain_id:domain_id ->
  ?app_name:app_name ->
  ?app_type:app_type ->
  ?app_arn:app_arn ->
  unit ->
  describe_app_response

val make_describe_app_request :
  ?space_name:space_name ->
  ?user_profile_name:user_profile_name ->
  app_name:app_name ->
  app_type:app_type ->
  domain_id:domain_id ->
  unit ->
  describe_app_request

val make_algorithm_validation_profile :
  ?transform_job_definition:transform_job_definition ->
  training_job_definition:training_job_definition ->
  profile_name:entity_name ->
  unit ->
  algorithm_validation_profile

val make_algorithm_validation_specification :
  validation_profiles:algorithm_validation_profiles ->
  validation_role:role_arn ->
  unit ->
  algorithm_validation_specification

val make_algorithm_status_item :
  ?failure_reason:string_ ->
  status:detailed_algorithm_status ->
  name:entity_name ->
  unit ->
  algorithm_status_item

val make_algorithm_status_details :
  ?image_scan_statuses:algorithm_status_item_list ->
  ?validation_statuses:algorithm_status_item_list ->
  unit ->
  algorithm_status_details

val make_describe_algorithm_output :
  ?certify_for_marketplace:certify_for_marketplace ->
  ?product_id:product_id ->
  ?validation_specification:algorithm_validation_specification ->
  ?inference_specification:inference_specification ->
  ?algorithm_description:entity_description ->
  algorithm_status_details:algorithm_status_details ->
  algorithm_status:algorithm_status ->
  training_specification:training_specification ->
  creation_time:creation_time ->
  algorithm_arn:algorithm_arn ->
  algorithm_name:entity_name ->
  unit ->
  describe_algorithm_output

val make_describe_algorithm_input : algorithm_name:arn_or_name -> unit -> describe_algorithm_input
val make_ai_workload_s3_data_source : s3_uri:s3_uri -> unit -> ai_workload_s3_data_source

val make_ai_workload_data_source :
  ?s3_data_source:ai_workload_s3_data_source -> unit -> ai_workload_data_source

val make_ai_workload_input_data_config :
  data_source:ai_workload_data_source ->
  channel_name:ai_channel_name ->
  unit ->
  ai_workload_input_data_config

val make_ai_workload_configs : workload_spec:workload_spec -> unit -> ai_workload_configs

val make_describe_ai_workload_config_response :
  ?tags:tag_list ->
  ?ai_workload_configs:ai_workload_configs ->
  ?dataset_config:ai_dataset_config ->
  creation_time:timestamp ->
  ai_workload_config_arn:ai_workload_config_arn ->
  ai_workload_config_name:ai_entity_name ->
  unit ->
  describe_ai_workload_config_response

val make_describe_ai_workload_config_request :
  ai_workload_config_name:ai_entity_name -> unit -> describe_ai_workload_config_request

val make_ai_model_source_s3 : ?s3_uri:s3_uri -> unit -> ai_model_source_s3

val make_ai_mlflow_config :
  ?mlflow_run_name:ai_mlflow_run_name ->
  ?mlflow_experiment_name:ai_mlflow_experiment_name ->
  mlflow_resource_arn:ai_mlflow_resource_arn ->
  unit ->
  ai_mlflow_config

val make_ai_recommendation_inference_specification :
  ?framework:ai_recommendation_inference_framework ->
  unit ->
  ai_recommendation_inference_specification

val make_ai_recommendation_constraint :
  metric:ai_recommendation_metric -> unit -> ai_recommendation_constraint

val make_ai_recommendation_performance_target :
  constraints:ai_recommendation_constraint_list -> unit -> ai_recommendation_performance_target

val make_ai_recommendation_optimization_detail :
  ?optimization_config:ai_recommendation_optimization_config_map ->
  optimization_type:ai_recommendation_optimization_type ->
  unit ->
  ai_recommendation_optimization_detail

val make_ai_recommendation_instance_detail :
  ?copy_count_per_instance:ai_recommendation_copy_count_per_instance ->
  ?instance_count:ai_recommendation_instance_count ->
  ?instance_type:ai_recommendation_instance_type ->
  unit ->
  ai_recommendation_instance_detail

val make_ai_recommendation_model_details :
  ?instance_details:ai_recommendation_instance_detail_list ->
  ?inference_specification_name:ai_inference_specification_name ->
  ?model_package_arn:model_package_arn ->
  unit ->
  ai_recommendation_model_details

val make_ai_recommendation_deployment_s3_channel :
  ?uri:s3_uri -> ?channel_name:ai_channel_name -> unit -> ai_recommendation_deployment_s3_channel

val make_ai_recommendation_deployment_configuration :
  ?environment_variables:environment_map ->
  ?copy_count_per_instance:ai_recommendation_copy_count_per_instance ->
  ?instance_count:ai_recommendation_instance_count ->
  ?instance_type:ai_recommendation_instance_type ->
  ?image_uri:string_ ->
  ?s3:ai_recommendation_deployment_s3_channel_list ->
  unit ->
  ai_recommendation_deployment_configuration

val make_ai_recommendation_performance_metric :
  ?unit_:string_ ->
  ?stat:string_ ->
  value:string_ ->
  metric:string_ ->
  unit ->
  ai_recommendation_performance_metric

val make_ai_recommendation :
  ?expected_performance:expected_performance_list ->
  ?ai_benchmark_job_arn:ai_benchmark_job_arn ->
  ?deployment_configuration:ai_recommendation_deployment_configuration ->
  ?model_details:ai_recommendation_model_details ->
  ?optimization_details:ai_recommendation_optimization_detail_list ->
  ?recommendation_description:string_ ->
  unit ->
  ai_recommendation

val make_ai_capacity_reservation_config :
  ?ml_reservation_arns:ai_ml_reservation_arn_list ->
  ?capacity_reservation_preference:ai_capacity_reservation_preference ->
  unit ->
  ai_capacity_reservation_config

val make_ai_recommendation_compute_spec :
  ?capacity_reservation_config:ai_capacity_reservation_config ->
  ?instance_types:ai_recommendation_instance_type_list ->
  unit ->
  ai_recommendation_compute_spec

val make_describe_ai_recommendation_job_response :
  ?tags:tag_list ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?compute_spec:ai_recommendation_compute_spec ->
  ?recommendations:ai_recommendation_list ->
  ?performance_target:ai_recommendation_performance_target ->
  ?optimize_model:ai_recommendation_allow_optimization ->
  ?inference_specification:ai_recommendation_inference_specification ->
  ?failure_reason:failure_reason ->
  creation_time:timestamp ->
  role_arn:role_arn ->
  ai_workload_config_identifier:ai_resource_identifier ->
  output_config:ai_recommendation_output_result ->
  model_source:ai_model_source ->
  ai_recommendation_job_status:ai_recommendation_job_status ->
  ai_recommendation_job_arn:ai_recommendation_job_arn ->
  ai_recommendation_job_name:ai_entity_name ->
  unit ->
  describe_ai_recommendation_job_response

val make_describe_ai_recommendation_job_request :
  ai_recommendation_job_name:ai_entity_name -> unit -> describe_ai_recommendation_job_request

val make_ai_benchmark_inference_component :
  identifier:ai_resource_identifier -> unit -> ai_benchmark_inference_component

val make_ai_benchmark_endpoint :
  ?inference_components:ai_benchmark_inference_component_list ->
  ?target_container_hostname:string_ ->
  identifier:ai_resource_identifier ->
  unit ->
  ai_benchmark_endpoint

val make_ai_cloud_watch_logs :
  ?log_stream_name:string_ -> ?log_group_arn:string_ -> unit -> ai_cloud_watch_logs

val make_ai_benchmark_network_config : ?vpc_config:vpc_config -> unit -> ai_benchmark_network_config

val make_describe_ai_benchmark_job_response :
  ?tags:tag_list ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?network_config:ai_benchmark_network_config ->
  ?failure_reason:failure_reason ->
  creation_time:timestamp ->
  role_arn:role_arn ->
  ai_workload_config_identifier:ai_resource_identifier ->
  output_config:ai_benchmark_output_result ->
  benchmark_target:ai_benchmark_target ->
  ai_benchmark_job_status:ai_benchmark_job_status ->
  ai_benchmark_job_arn:ai_benchmark_job_arn ->
  ai_benchmark_job_name:ai_entity_name ->
  unit ->
  describe_ai_benchmark_job_response

val make_describe_ai_benchmark_job_request :
  ai_benchmark_job_name:ai_entity_name -> unit -> describe_ai_benchmark_job_request

val make_describe_action_response :
  ?lineage_group_arn:lineage_group_arn ->
  ?metadata_properties:metadata_properties ->
  ?last_modified_by:user_context ->
  ?last_modified_time:timestamp ->
  ?created_by:user_context ->
  ?creation_time:timestamp ->
  ?properties:lineage_entity_parameters ->
  ?status:action_status ->
  ?description:experiment_description ->
  ?action_type:string256 ->
  ?source:action_source ->
  ?action_arn:action_arn ->
  ?action_name:experiment_entity_name_or_arn ->
  unit ->
  describe_action_response

val make_describe_action_request :
  action_name:experiment_entity_name_or_arn -> unit -> describe_action_request

val make_deregister_devices_request :
  device_names:device_names -> device_fleet_name:entity_name -> unit -> deregister_devices_request

val make_delete_workteam_response : success:success -> unit -> delete_workteam_response
val make_delete_workteam_request : workteam_name:workteam_name -> unit -> delete_workteam_request
val make_delete_workforce_response : unit -> unit

val make_delete_workforce_request :
  workforce_name:workforce_name -> unit -> delete_workforce_request

val make_delete_user_profile_request :
  user_profile_name:user_profile_name -> domain_id:domain_id -> unit -> delete_user_profile_request

val make_delete_trial_component_response :
  ?trial_component_arn:trial_component_arn -> unit -> delete_trial_component_response

val make_delete_trial_component_request :
  trial_component_name:experiment_entity_name -> unit -> delete_trial_component_request

val make_delete_trial_response : ?trial_arn:trial_arn -> unit -> delete_trial_response
val make_delete_trial_request : trial_name:experiment_entity_name -> unit -> delete_trial_request

val make_delete_training_job_request :
  training_job_name:training_job_name -> unit -> delete_training_job_request

val make_delete_tags_output : unit -> unit

val make_delete_tags_input :
  tag_keys:tag_key_list -> resource_arn:resource_arn -> unit -> delete_tags_input

val make_delete_studio_lifecycle_config_request :
  studio_lifecycle_config_name:studio_lifecycle_config_name ->
  unit ->
  delete_studio_lifecycle_config_request

val make_delete_space_request :
  space_name:space_name -> domain_id:domain_id -> unit -> delete_space_request

val make_delete_project_input : project_name:project_entity_name -> unit -> delete_project_input

val make_delete_processing_job_request :
  processing_job_name:processing_job_name -> unit -> delete_processing_job_request

val make_delete_pipeline_response : ?pipeline_arn:pipeline_arn -> unit -> delete_pipeline_response

val make_delete_pipeline_request :
  client_request_token:idempotency_token ->
  pipeline_name:pipeline_name ->
  unit ->
  delete_pipeline_request

val make_delete_partner_app_response : ?arn:partner_app_arn -> unit -> delete_partner_app_response

val make_delete_partner_app_request :
  ?client_token:client_token -> arn:partner_app_arn -> unit -> delete_partner_app_request

val make_delete_optimization_job_request :
  optimization_job_name:entity_name -> unit -> delete_optimization_job_request

val make_delete_notebook_instance_lifecycle_config_input :
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  delete_notebook_instance_lifecycle_config_input

val make_delete_notebook_instance_input :
  notebook_instance_name:notebook_instance_name -> unit -> delete_notebook_instance_input

val make_delete_monitoring_schedule_request :
  monitoring_schedule_name:monitoring_schedule_name -> unit -> delete_monitoring_schedule_request

val make_delete_model_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_model_quality_job_definition_request

val make_delete_model_package_group_policy_input :
  model_package_group_name:entity_name -> unit -> delete_model_package_group_policy_input

val make_delete_model_package_group_input :
  model_package_group_name:arn_or_name -> unit -> delete_model_package_group_input

val make_delete_model_package_input :
  model_package_name:versioned_arn_or_name -> unit -> delete_model_package_input

val make_delete_model_explainability_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_model_explainability_job_definition_request

val make_delete_model_card_request :
  model_card_name:entity_name -> unit -> delete_model_card_request

val make_delete_model_bias_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_model_bias_job_definition_request

val make_delete_model_input : model_name:model_name -> unit -> delete_model_input

val make_delete_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> delete_mlflow_tracking_server_response

val make_delete_mlflow_tracking_server_request :
  tracking_server_name:tracking_server_name -> unit -> delete_mlflow_tracking_server_request

val make_delete_mlflow_app_response : ?arn:mlflow_app_arn -> unit -> delete_mlflow_app_response
val make_delete_mlflow_app_request : arn:mlflow_app_arn -> unit -> delete_mlflow_app_request
val make_delete_job_response : unit -> unit

val make_delete_job_request :
  job_category:job_category -> job_name:job_name -> unit -> delete_job_request

val make_delete_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> delete_inference_experiment_response

val make_delete_inference_experiment_request :
  name:inference_experiment_name -> unit -> delete_inference_experiment_request

val make_delete_inference_component_input :
  inference_component_name:inference_component_name -> unit -> delete_inference_component_input

val make_delete_image_version_response : unit -> unit

val make_delete_image_version_request :
  ?alias:sage_maker_image_version_alias ->
  ?version:image_version_number ->
  image_name:image_name ->
  unit ->
  delete_image_version_request

val make_delete_image_response : unit -> unit
val make_delete_image_request : image_name:image_name -> unit -> delete_image_request

val make_delete_hyper_parameter_tuning_job_request :
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  delete_hyper_parameter_tuning_job_request

val make_delete_human_task_ui_response : unit -> unit

val make_delete_human_task_ui_request :
  human_task_ui_name:human_task_ui_name -> unit -> delete_human_task_ui_request

val make_delete_hub_content_reference_request :
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  hub_name:hub_name_or_arn ->
  unit ->
  delete_hub_content_reference_request

val make_delete_hub_content_request :
  hub_content_version:hub_content_version ->
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  hub_name:hub_name_or_arn ->
  unit ->
  delete_hub_content_request

val make_delete_hub_request : hub_name:hub_name_or_arn -> unit -> delete_hub_request
val make_delete_flow_definition_response : unit -> unit

val make_delete_flow_definition_request :
  flow_definition_name:flow_definition_name -> unit -> delete_flow_definition_request

val make_delete_feature_group_request :
  feature_group_name:feature_group_name -> unit -> delete_feature_group_request

val make_delete_experiment_response :
  ?experiment_arn:experiment_arn -> unit -> delete_experiment_response

val make_delete_experiment_request :
  experiment_name:experiment_entity_name -> unit -> delete_experiment_request

val make_delete_endpoint_config_input :
  endpoint_config_name:endpoint_config_name -> unit -> delete_endpoint_config_input

val make_delete_endpoint_input : endpoint_name:endpoint_name -> unit -> delete_endpoint_input

val make_delete_edge_deployment_stage_request :
  stage_name:entity_name ->
  edge_deployment_plan_name:entity_name ->
  unit ->
  delete_edge_deployment_stage_request

val make_delete_edge_deployment_plan_request :
  edge_deployment_plan_name:entity_name -> unit -> delete_edge_deployment_plan_request

val make_retention_policy : ?home_efs_file_system:retention_type -> unit -> retention_policy

val make_delete_domain_request :
  ?retention_policy:retention_policy -> domain_id:domain_id -> unit -> delete_domain_request

val make_delete_device_fleet_request :
  device_fleet_name:entity_name -> unit -> delete_device_fleet_request

val make_delete_data_quality_job_definition_request :
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  delete_data_quality_job_definition_request

val make_delete_context_response : ?context_arn:context_arn -> unit -> delete_context_response
val make_delete_context_request : context_name:context_name -> unit -> delete_context_request

val make_delete_compute_quota_request :
  compute_quota_id:compute_quota_id -> unit -> delete_compute_quota_request

val make_delete_compilation_job_request :
  compilation_job_name:entity_name -> unit -> delete_compilation_job_request

val make_delete_code_repository_input :
  code_repository_name:entity_name -> unit -> delete_code_repository_input

val make_delete_cluster_scheduler_config_request :
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  unit ->
  delete_cluster_scheduler_config_request

val make_delete_cluster_response : cluster_arn:cluster_arn -> unit -> delete_cluster_response
val make_delete_cluster_request : cluster_name:cluster_name_or_arn -> unit -> delete_cluster_request

val make_delete_association_response :
  ?destination_arn:association_entity_arn ->
  ?source_arn:association_entity_arn ->
  unit ->
  delete_association_response

val make_delete_association_request :
  destination_arn:association_entity_arn ->
  source_arn:association_entity_arn ->
  unit ->
  delete_association_request

val make_delete_artifact_response : ?artifact_arn:artifact_arn -> unit -> delete_artifact_response

val make_delete_artifact_request :
  ?source:artifact_source -> ?artifact_arn:artifact_arn -> unit -> delete_artifact_request

val make_delete_app_image_config_request :
  app_image_config_name:app_image_config_name -> unit -> delete_app_image_config_request

val make_delete_app_request :
  ?space_name:space_name ->
  ?user_profile_name:user_profile_name ->
  app_name:app_name ->
  app_type:app_type ->
  domain_id:domain_id ->
  unit ->
  delete_app_request

val make_delete_algorithm_input : algorithm_name:entity_name -> unit -> delete_algorithm_input

val make_delete_ai_workload_config_response :
  ?ai_workload_config_arn:ai_workload_config_arn -> unit -> delete_ai_workload_config_response

val make_delete_ai_workload_config_request :
  ai_workload_config_name:ai_entity_name -> unit -> delete_ai_workload_config_request

val make_delete_ai_recommendation_job_response :
  ?ai_recommendation_job_arn:ai_recommendation_job_arn ->
  unit ->
  delete_ai_recommendation_job_response

val make_delete_ai_recommendation_job_request :
  ai_recommendation_job_name:ai_entity_name -> unit -> delete_ai_recommendation_job_request

val make_delete_ai_benchmark_job_response :
  ?ai_benchmark_job_arn:ai_benchmark_job_arn -> unit -> delete_ai_benchmark_job_response

val make_delete_ai_benchmark_job_request :
  ai_benchmark_job_name:ai_entity_name -> unit -> delete_ai_benchmark_job_request

val make_delete_action_response : ?action_arn:action_arn -> unit -> delete_action_response
val make_delete_action_request : action_name:experiment_entity_name -> unit -> delete_action_request
val make_create_workteam_response : ?workteam_arn:workteam_arn -> unit -> create_workteam_response

val make_create_workteam_request :
  ?tags:tag_list ->
  ?worker_access_configuration:worker_access_configuration ->
  ?notification_configuration:notification_configuration ->
  ?workforce_name:workforce_name ->
  description:string200 ->
  member_definitions:member_definitions ->
  workteam_name:workteam_name ->
  unit ->
  create_workteam_request

val make_create_workforce_response :
  workforce_arn:workforce_arn -> unit -> create_workforce_response

val make_create_workforce_request :
  ?ip_address_type:workforce_ip_address_type ->
  ?workforce_vpc_config:workforce_vpc_config_request ->
  ?tags:tag_list ->
  ?source_ip_config:source_ip_config ->
  ?oidc_config:oidc_config ->
  ?cognito_config:cognito_config ->
  workforce_name:workforce_name ->
  unit ->
  create_workforce_request

val make_create_user_profile_response :
  ?user_profile_arn:user_profile_arn -> unit -> create_user_profile_response

val make_create_user_profile_request :
  ?user_settings:user_settings ->
  ?tags:tag_list ->
  ?single_sign_on_user_value:string256 ->
  ?single_sign_on_user_identifier:single_sign_on_user_identifier ->
  user_profile_name:user_profile_name ->
  domain_id:domain_id ->
  unit ->
  create_user_profile_request

val make_create_trial_component_response :
  ?trial_component_arn:trial_component_arn -> unit -> create_trial_component_response

val make_create_trial_component_request :
  ?tags:tag_list ->
  ?metadata_properties:metadata_properties ->
  ?output_artifacts:trial_component_artifacts ->
  ?input_artifacts:trial_component_artifacts ->
  ?parameters:trial_component_parameters ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:trial_component_status ->
  ?display_name:experiment_entity_name ->
  trial_component_name:experiment_entity_name ->
  unit ->
  create_trial_component_request

val make_create_trial_response : ?trial_arn:trial_arn -> unit -> create_trial_response

val make_create_trial_request :
  ?tags:tag_list ->
  ?metadata_properties:metadata_properties ->
  ?display_name:experiment_entity_name ->
  experiment_name:experiment_entity_name ->
  trial_name:experiment_entity_name ->
  unit ->
  create_trial_request

val make_create_transform_job_response :
  transform_job_arn:transform_job_arn -> unit -> create_transform_job_response

val make_create_transform_job_request :
  ?experiment_config:experiment_config ->
  ?tags:tag_list ->
  ?data_processing:data_processing ->
  ?data_capture_config:batch_data_capture_config ->
  ?environment:transform_environment_map ->
  ?batch_strategy:batch_strategy ->
  ?max_payload_in_m_b:max_payload_in_m_b ->
  ?model_client_config:model_client_config ->
  ?max_concurrent_transforms:max_concurrent_transforms ->
  transform_resources:transform_resources ->
  transform_output:transform_output ->
  transform_input:transform_input ->
  model_name:model_name ->
  transform_job_name:transform_job_name ->
  unit ->
  create_transform_job_request

val make_create_training_plan_response :
  training_plan_arn:training_plan_arn -> unit -> create_training_plan_response

val make_create_training_plan_request :
  ?tags:tag_list ->
  ?spare_instance_count_per_ultra_server:spare_instance_count_per_ultra_server ->
  training_plan_offering_id:training_plan_offering_id ->
  training_plan_name:training_plan_name ->
  unit ->
  create_training_plan_request

val make_create_training_job_response :
  training_job_arn:training_job_arn -> unit -> create_training_job_response

val make_create_training_job_request :
  ?model_package_config:model_package_config ->
  ?mlflow_config:mlflow_config ->
  ?serverless_job_config:serverless_job_config ->
  ?session_chaining_config:session_chaining_config ->
  ?infra_check_config:infra_check_config ->
  ?remote_debug_config:remote_debug_config ->
  ?retry_strategy:retry_strategy ->
  ?environment:training_environment_map ->
  ?profiler_rule_configurations:profiler_rule_configurations ->
  ?profiler_config:profiler_config ->
  ?experiment_config:experiment_config ->
  ?tensor_board_output_config:tensor_board_output_config ->
  ?debug_rule_configurations:debug_rule_configurations ->
  ?debug_hook_config:debug_hook_config ->
  ?checkpoint_config:checkpoint_config ->
  ?enable_managed_spot_training:boolean_ ->
  ?enable_inter_container_traffic_encryption:boolean_ ->
  ?enable_network_isolation:boolean_ ->
  ?tags:tag_list ->
  ?stopping_condition:stopping_condition ->
  ?vpc_config:vpc_config ->
  ?resource_config:resource_config ->
  ?input_data_config:input_data_config ->
  ?algorithm_specification:algorithm_specification ->
  ?hyper_parameters:hyper_parameters ->
  output_data_config:output_data_config ->
  role_arn:role_arn ->
  training_job_name:training_job_name ->
  unit ->
  create_training_job_request

val make_create_studio_lifecycle_config_response :
  ?studio_lifecycle_config_arn:studio_lifecycle_config_arn ->
  unit ->
  create_studio_lifecycle_config_response

val make_create_studio_lifecycle_config_request :
  ?tags:tag_list ->
  studio_lifecycle_config_app_type:studio_lifecycle_config_app_type ->
  studio_lifecycle_config_content:studio_lifecycle_config_content ->
  studio_lifecycle_config_name:studio_lifecycle_config_name ->
  unit ->
  create_studio_lifecycle_config_request

val make_create_space_response : ?space_arn:space_arn -> unit -> create_space_response

val make_create_space_request :
  ?space_display_name:non_empty_string64 ->
  ?space_sharing_settings:space_sharing_settings ->
  ?ownership_settings:ownership_settings ->
  ?space_settings:space_settings ->
  ?tags:tag_list ->
  space_name:space_name ->
  domain_id:domain_id ->
  unit ->
  create_space_request

val make_create_project_output :
  project_id:project_id -> project_arn:project_arn -> unit -> create_project_output

val make_cfn_stack_create_parameter :
  ?value:cfn_stack_parameter_value ->
  key:cfn_stack_parameter_key ->
  unit ->
  cfn_stack_create_parameter

val make_cfn_create_template_provider :
  ?parameters:cfn_stack_create_parameters ->
  ?role_ar_n:role_arn ->
  template_ur_l:cfn_template_ur_l ->
  template_name:cfn_template_name ->
  unit ->
  cfn_create_template_provider

val make_create_template_provider :
  ?cfn_template_provider:cfn_create_template_provider -> unit -> create_template_provider

val make_create_project_input :
  ?template_providers:create_template_provider_list ->
  ?tags:tag_list ->
  ?service_catalog_provisioning_details:service_catalog_provisioning_details ->
  ?project_description:entity_description ->
  project_name:project_entity_name ->
  unit ->
  create_project_input

val make_create_processing_job_response :
  processing_job_arn:processing_job_arn -> unit -> create_processing_job_response

val make_create_processing_job_request :
  ?experiment_config:experiment_config ->
  ?tags:tag_list ->
  ?network_config:network_config ->
  ?environment:processing_environment_map ->
  ?stopping_condition:processing_stopping_condition ->
  ?processing_output_config:processing_output_config ->
  ?processing_inputs:processing_inputs ->
  role_arn:role_arn ->
  app_specification:app_specification ->
  processing_resources:processing_resources ->
  processing_job_name:processing_job_name ->
  unit ->
  create_processing_job_request

val make_create_presigned_notebook_instance_url_output :
  ?authorized_url:notebook_instance_url -> unit -> create_presigned_notebook_instance_url_output

val make_create_presigned_notebook_instance_url_input :
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  notebook_instance_name:notebook_instance_name ->
  unit ->
  create_presigned_notebook_instance_url_input

val make_create_presigned_mlflow_tracking_server_url_response :
  ?authorized_url:tracking_server_url ->
  unit ->
  create_presigned_mlflow_tracking_server_url_response

val make_create_presigned_mlflow_tracking_server_url_request :
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  ?expires_in_seconds:expires_in_seconds ->
  tracking_server_name:tracking_server_name ->
  unit ->
  create_presigned_mlflow_tracking_server_url_request

val make_create_presigned_mlflow_app_url_response :
  ?authorized_url:mlflow_app_url -> unit -> create_presigned_mlflow_app_url_response

val make_create_presigned_mlflow_app_url_request :
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  ?expires_in_seconds:expires_in_seconds ->
  arn:mlflow_app_arn ->
  unit ->
  create_presigned_mlflow_app_url_request

val make_create_presigned_domain_url_response :
  ?authorized_url:presigned_domain_url -> unit -> create_presigned_domain_url_response

val make_create_presigned_domain_url_request :
  ?landing_uri:landing_uri ->
  ?space_name:space_name ->
  ?expires_in_seconds:expires_in_seconds ->
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  user_profile_name:user_profile_name ->
  domain_id:domain_id ->
  unit ->
  create_presigned_domain_url_request

val make_create_pipeline_response : ?pipeline_arn:pipeline_arn -> unit -> create_pipeline_response

val make_create_pipeline_request :
  ?parallelism_configuration:parallelism_configuration ->
  ?tags:tag_list ->
  ?pipeline_description:pipeline_description ->
  ?pipeline_definition_s3_location:pipeline_definition_s3_location ->
  ?pipeline_definition:pipeline_definition ->
  ?pipeline_display_name:pipeline_name ->
  role_arn:role_arn ->
  client_request_token:idempotency_token ->
  pipeline_name:pipeline_name ->
  unit ->
  create_pipeline_request

val make_create_partner_app_presigned_url_response :
  ?url:string2048 -> unit -> create_partner_app_presigned_url_response

val make_create_partner_app_presigned_url_request :
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  ?expires_in_seconds:expires_in_seconds ->
  arn:partner_app_arn ->
  unit ->
  create_partner_app_presigned_url_request

val make_create_partner_app_response : ?arn:partner_app_arn -> unit -> create_partner_app_response

val make_create_partner_app_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?enable_auto_minor_version_upgrade:boolean_ ->
  ?enable_iam_session_based_identity:boolean_ ->
  ?application_config:partner_app_config ->
  ?maintenance_config:partner_app_maintenance_config ->
  ?kms_key_id:kms_key_id ->
  auth_type:partner_app_auth_type ->
  tier:non_empty_string64 ->
  execution_role_arn:role_arn ->
  type_:partner_app_type ->
  name:partner_app_name ->
  unit ->
  create_partner_app_request

val make_create_optimization_job_response :
  optimization_job_arn:optimization_job_arn -> unit -> create_optimization_job_response

val make_create_optimization_job_request :
  ?vpc_config:optimization_vpc_config ->
  ?tags:tag_list ->
  ?optimization_environment:optimization_job_environment_variables ->
  ?max_instance_count:optimization_job_max_instance_count ->
  stopping_condition:stopping_condition ->
  output_config:optimization_job_output_config ->
  optimization_configs:optimization_configs ->
  deployment_instance_type:optimization_job_deployment_instance_type ->
  model_source:optimization_job_model_source ->
  role_arn:role_arn ->
  optimization_job_name:entity_name ->
  unit ->
  create_optimization_job_request

val make_create_notebook_instance_lifecycle_config_output :
  ?notebook_instance_lifecycle_config_arn:notebook_instance_lifecycle_config_arn ->
  unit ->
  create_notebook_instance_lifecycle_config_output

val make_create_notebook_instance_lifecycle_config_input :
  ?tags:tag_list ->
  ?on_start:notebook_instance_lifecycle_config_list ->
  ?on_create:notebook_instance_lifecycle_config_list ->
  notebook_instance_lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  unit ->
  create_notebook_instance_lifecycle_config_input

val make_create_notebook_instance_output :
  ?notebook_instance_arn:notebook_instance_arn -> unit -> create_notebook_instance_output

val make_create_notebook_instance_input :
  ?instance_metadata_service_configuration:instance_metadata_service_configuration ->
  ?platform_identifier:platform_identifier ->
  ?root_access:root_access ->
  ?additional_code_repositories:additional_code_repository_names_or_urls ->
  ?default_code_repository:code_repository_name_or_url ->
  ?accelerator_types:notebook_instance_accelerator_types ->
  ?volume_size_in_g_b:notebook_instance_volume_size_in_g_b ->
  ?direct_internet_access:direct_internet_access ->
  ?lifecycle_config_name:notebook_instance_lifecycle_config_name ->
  ?tags:tag_list ->
  ?kms_key_id:kms_key_id ->
  ?ip_address_type:ip_address_type ->
  ?security_group_ids:security_group_ids ->
  ?subnet_id:subnet_id ->
  role_arn:role_arn ->
  instance_type:instance_type ->
  notebook_instance_name:notebook_instance_name ->
  unit ->
  create_notebook_instance_input

val make_create_monitoring_schedule_response :
  monitoring_schedule_arn:monitoring_schedule_arn -> unit -> create_monitoring_schedule_response

val make_create_monitoring_schedule_request :
  ?tags:tag_list ->
  monitoring_schedule_config:monitoring_schedule_config ->
  monitoring_schedule_name:monitoring_schedule_name ->
  unit ->
  create_monitoring_schedule_request

val make_create_model_quality_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_model_quality_job_definition_response

val make_create_model_quality_job_definition_request :
  ?tags:tag_list ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?model_quality_baseline_config:model_quality_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  model_quality_job_output_config:monitoring_output_config ->
  model_quality_job_input:model_quality_job_input ->
  model_quality_app_specification:model_quality_app_specification ->
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  create_model_quality_job_definition_request

val make_create_model_package_group_output :
  model_package_group_arn:model_package_group_arn -> unit -> create_model_package_group_output

val make_create_model_package_group_input :
  ?managed_configuration:managed_configuration ->
  ?tags:tag_list ->
  ?model_package_group_description:entity_description ->
  model_package_group_name:entity_name ->
  unit ->
  create_model_package_group_input

val make_create_model_package_output :
  model_package_arn:model_package_arn -> unit -> create_model_package_output

val make_create_model_package_input :
  ?managed_storage_type:managed_storage_type ->
  ?model_life_cycle:model_life_cycle ->
  ?model_card:model_package_model_card ->
  ?security_config:model_package_security_config ->
  ?source_uri:model_package_source_uri ->
  ?skip_model_validation:skip_model_validation ->
  ?additional_inference_specifications:additional_inference_specifications ->
  ?drift_check_baselines:drift_check_baselines ->
  ?customer_metadata_properties:customer_metadata_map ->
  ?sample_payload_url:s3_uri ->
  ?task:string_ ->
  ?domain:string_ ->
  ?client_token:client_token ->
  ?model_metrics:model_metrics ->
  ?metadata_properties:metadata_properties ->
  ?model_approval_status:model_approval_status ->
  ?tags:tag_list ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?source_algorithm_specification:source_algorithm_specification ->
  ?validation_specification:model_package_validation_specification ->
  ?inference_specification:inference_specification ->
  ?model_package_registration_type:model_package_registration_type ->
  ?model_package_description:entity_description ->
  ?model_package_group_name:arn_or_name ->
  ?model_package_name:entity_name ->
  unit ->
  create_model_package_input

val make_create_model_explainability_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_model_explainability_job_definition_response

val make_create_model_explainability_job_definition_request :
  ?tags:tag_list ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?model_explainability_baseline_config:model_explainability_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  model_explainability_job_output_config:monitoring_output_config ->
  model_explainability_job_input:model_explainability_job_input ->
  model_explainability_app_specification:model_explainability_app_specification ->
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  create_model_explainability_job_definition_request

val make_create_model_card_export_job_response :
  model_card_export_job_arn:model_card_export_job_arn ->
  unit ->
  create_model_card_export_job_response

val make_create_model_card_export_job_request :
  ?model_card_version:integer ->
  output_config:model_card_export_output_config ->
  model_card_export_job_name:entity_name ->
  model_card_name:model_card_name_or_arn ->
  unit ->
  create_model_card_export_job_request

val make_create_model_card_response :
  model_card_arn:model_card_arn -> unit -> create_model_card_response

val make_create_model_card_request :
  ?tags:tag_list ->
  ?security_config:model_card_security_config ->
  model_card_status:model_card_status ->
  content:model_card_content ->
  model_card_name:entity_name ->
  unit ->
  create_model_card_request

val make_create_model_bias_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_model_bias_job_definition_response

val make_create_model_bias_job_definition_request :
  ?tags:tag_list ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?model_bias_baseline_config:model_bias_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  model_bias_job_output_config:monitoring_output_config ->
  model_bias_job_input:model_bias_job_input ->
  model_bias_app_specification:model_bias_app_specification ->
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  create_model_bias_job_definition_request

val make_create_model_output : model_arn:model_arn -> unit -> create_model_output

val make_create_model_input :
  ?enable_network_isolation:boolean_ ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  ?execution_role_arn:role_arn ->
  ?inference_execution_config:inference_execution_config ->
  ?containers:container_definition_list ->
  ?primary_container:container_definition ->
  model_name:model_name ->
  unit ->
  create_model_input

val make_create_mlflow_tracking_server_response :
  ?tracking_server_arn:tracking_server_arn -> unit -> create_mlflow_tracking_server_response

val make_create_mlflow_tracking_server_request :
  ?s3_bucket_owner_verification:boolean_ ->
  ?s3_bucket_owner_account_id:account_id ->
  ?tags:tag_list ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?automatic_model_registration:boolean_ ->
  ?mlflow_version:mlflow_version ->
  ?tracking_server_size:tracking_server_size ->
  role_arn:role_arn ->
  artifact_store_uri:s3_uri ->
  tracking_server_name:tracking_server_name ->
  unit ->
  create_mlflow_tracking_server_request

val make_create_mlflow_app_response : ?arn:mlflow_app_arn -> unit -> create_mlflow_app_response

val make_create_mlflow_app_request :
  ?tags:tag_list ->
  ?default_domain_id_list:default_domain_id_list ->
  ?account_default_status:account_default_status ->
  ?weekly_maintenance_window_start:weekly_maintenance_window_start ->
  ?model_registration_mode:model_registration_mode ->
  role_arn:role_arn ->
  artifact_store_uri:s3_uri ->
  name:mlflow_app_name ->
  unit ->
  create_mlflow_app_request

val make_create_labeling_job_response :
  labeling_job_arn:labeling_job_arn -> unit -> create_labeling_job_response

val make_create_labeling_job_request :
  ?tags:tag_list ->
  ?labeling_job_algorithms_config:labeling_job_algorithms_config ->
  ?stopping_conditions:labeling_job_stopping_conditions ->
  ?label_category_config_s3_uri:s3_uri ->
  human_task_config:human_task_config ->
  role_arn:role_arn ->
  output_config:labeling_job_output_config ->
  input_config:labeling_job_input_config ->
  label_attribute_name:label_attribute_name ->
  labeling_job_name:labeling_job_name ->
  unit ->
  create_labeling_job_request

val make_create_job_response : job_arn:job_arn -> unit -> create_job_response

val make_create_job_request :
  ?tags:tag_list ->
  job_config_document:job_config_document ->
  job_config_schema_version:job_schema_version ->
  job_category:job_category ->
  role_arn:role_arn ->
  job_name:job_name ->
  unit ->
  create_job_request

val make_create_inference_recommendations_job_response :
  job_arn:recommendation_job_arn -> unit -> create_inference_recommendations_job_response

val make_recommendation_job_compiled_output_config :
  ?s3_output_uri:s3_uri -> unit -> recommendation_job_compiled_output_config

val make_recommendation_job_output_config :
  ?compiled_output_config:recommendation_job_compiled_output_config ->
  ?kms_key_id:kms_key_id ->
  unit ->
  recommendation_job_output_config

val make_create_inference_recommendations_job_request :
  ?tags:tag_list ->
  ?output_config:recommendation_job_output_config ->
  ?stopping_conditions:recommendation_job_stopping_conditions ->
  ?job_description:recommendation_job_description ->
  input_config:recommendation_job_input_config ->
  role_arn:role_arn ->
  job_type:recommendation_job_type ->
  job_name:recommendation_job_name ->
  unit ->
  create_inference_recommendations_job_request

val make_create_inference_experiment_response :
  inference_experiment_arn:inference_experiment_arn -> unit -> create_inference_experiment_response

val make_create_inference_experiment_request :
  ?tags:tag_list ->
  ?kms_key:kms_key_id ->
  ?data_storage_config:inference_experiment_data_storage_config ->
  ?description:inference_experiment_description ->
  ?schedule:inference_experiment_schedule ->
  shadow_mode_config:shadow_mode_config ->
  model_variants:model_variant_config_list ->
  endpoint_name:endpoint_name ->
  role_arn:role_arn ->
  type_:inference_experiment_type ->
  name:inference_experiment_name ->
  unit ->
  create_inference_experiment_request

val make_create_inference_component_output :
  inference_component_arn:inference_component_arn -> unit -> create_inference_component_output

val make_create_inference_component_input :
  ?tags:tag_list ->
  ?runtime_config:inference_component_runtime_config ->
  ?specifications:inference_component_specification_list ->
  ?specification:inference_component_specification ->
  ?variant_name:variant_name ->
  endpoint_name:endpoint_name ->
  inference_component_name:inference_component_name ->
  unit ->
  create_inference_component_input

val make_create_image_version_response :
  ?image_version_arn:image_version_arn -> unit -> create_image_version_response

val make_create_image_version_request :
  ?release_notes:release_notes ->
  ?horovod:horovod ->
  ?processor:processor ->
  ?programming_lang:programming_lang ->
  ?ml_framework:ml_framework ->
  ?job_type:job_type ->
  ?vendor_guidance:vendor_guidance ->
  ?aliases:sage_maker_image_version_aliases ->
  image_name:image_name ->
  client_token:client_token ->
  base_image:image_base_image ->
  unit ->
  create_image_version_request

val make_create_image_response : ?image_arn:image_arn -> unit -> create_image_response

val make_create_image_request :
  ?tags:tag_list ->
  ?display_name:image_display_name ->
  ?description:image_description ->
  role_arn:role_arn ->
  image_name:image_name ->
  unit ->
  create_image_request

val make_create_hyper_parameter_tuning_job_response :
  hyper_parameter_tuning_job_arn:hyper_parameter_tuning_job_arn ->
  unit ->
  create_hyper_parameter_tuning_job_response

val make_create_hyper_parameter_tuning_job_request :
  ?autotune:autotune ->
  ?tags:tag_list ->
  ?warm_start_config:hyper_parameter_tuning_job_warm_start_config ->
  ?training_job_definitions:hyper_parameter_training_job_definitions ->
  ?training_job_definition:hyper_parameter_training_job_definition ->
  hyper_parameter_tuning_job_config:hyper_parameter_tuning_job_config ->
  hyper_parameter_tuning_job_name:hyper_parameter_tuning_job_name ->
  unit ->
  create_hyper_parameter_tuning_job_request

val make_create_human_task_ui_response :
  human_task_ui_arn:human_task_ui_arn -> unit -> create_human_task_ui_response

val make_create_human_task_ui_request :
  ?tags:tag_list ->
  ui_template:ui_template ->
  human_task_ui_name:human_task_ui_name ->
  unit ->
  create_human_task_ui_request

val make_create_hub_content_reference_response :
  hub_content_arn:hub_content_arn ->
  hub_arn:hub_arn ->
  unit ->
  create_hub_content_reference_response

val make_create_hub_content_reference_request :
  ?tags:tag_list ->
  ?min_version:hub_content_version ->
  ?hub_content_name:hub_content_name ->
  sage_maker_public_hub_content_arn:sage_maker_public_hub_content_arn ->
  hub_name:hub_name_or_arn ->
  unit ->
  create_hub_content_reference_request

val make_authorized_url : ?local_path:local_path -> ?url:long_s3_uri -> unit -> authorized_url

val make_create_hub_content_presigned_urls_response :
  ?next_token:next_token ->
  authorized_url_configs:authorized_url_configs ->
  unit ->
  create_hub_content_presigned_urls_response

val make_presigned_url_access_config :
  ?expected_s3_url:s3_model_uri -> ?accept_eula:boolean_ -> unit -> presigned_url_access_config

val make_create_hub_content_presigned_urls_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?access_config:presigned_url_access_config ->
  ?hub_content_version:hub_content_version ->
  hub_content_name:hub_content_name ->
  hub_content_type:hub_content_type ->
  hub_name:hub_name_or_arn ->
  unit ->
  create_hub_content_presigned_urls_request

val make_create_hub_response : hub_arn:hub_arn -> unit -> create_hub_response

val make_create_hub_request :
  ?tags:tag_list ->
  ?s3_storage_config:hub_s3_storage_config ->
  ?hub_search_keywords:hub_search_keyword_list ->
  ?hub_display_name:hub_display_name ->
  hub_description:hub_description ->
  hub_name:hub_name ->
  unit ->
  create_hub_request

val make_create_flow_definition_response :
  flow_definition_arn:flow_definition_arn -> unit -> create_flow_definition_response

val make_create_flow_definition_request :
  ?tags:tag_list ->
  ?human_loop_config:human_loop_config ->
  ?human_loop_activation_config:human_loop_activation_config ->
  ?human_loop_request_source:human_loop_request_source ->
  role_arn:role_arn ->
  output_config:flow_definition_output_config ->
  flow_definition_name:flow_definition_name ->
  unit ->
  create_flow_definition_request

val make_create_feature_group_response :
  feature_group_arn:feature_group_arn -> unit -> create_feature_group_response

val make_create_feature_group_request :
  ?tags:tag_list ->
  ?description:description ->
  ?role_arn:role_arn ->
  ?throughput_config:throughput_config ->
  ?offline_store_config:offline_store_config ->
  ?online_store_config:online_store_config ->
  feature_definitions:feature_definitions ->
  event_time_feature_name:feature_name ->
  record_identifier_feature_name:feature_name ->
  feature_group_name:feature_group_name ->
  unit ->
  create_feature_group_request

val make_create_experiment_response :
  ?experiment_arn:experiment_arn -> unit -> create_experiment_response

val make_create_experiment_request :
  ?tags:tag_list ->
  ?description:experiment_description ->
  ?display_name:experiment_entity_name ->
  experiment_name:experiment_entity_name ->
  unit ->
  create_experiment_request

val make_create_endpoint_config_output :
  endpoint_config_arn:endpoint_config_arn -> unit -> create_endpoint_config_output

val make_create_endpoint_config_input :
  ?metrics_config:metrics_config ->
  ?enable_network_isolation:boolean_ ->
  ?vpc_config:vpc_config ->
  ?execution_role_arn:role_arn ->
  ?shadow_production_variants:production_variant_list ->
  ?explainer_config:explainer_config ->
  ?async_inference_config:async_inference_config ->
  ?kms_key_id:kms_key_id ->
  ?tags:tag_list ->
  ?data_capture_config:data_capture_config ->
  production_variants:production_variant_list ->
  endpoint_config_name:endpoint_config_name ->
  unit ->
  create_endpoint_config_input

val make_create_endpoint_output : endpoint_arn:endpoint_arn -> unit -> create_endpoint_output

val make_create_endpoint_input :
  ?tags:tag_list ->
  ?deployment_config:deployment_config ->
  endpoint_config_name:endpoint_config_name ->
  endpoint_name:endpoint_name ->
  unit ->
  create_endpoint_input

val make_create_edge_packaging_job_request :
  ?tags:tag_list ->
  ?resource_key:kms_key_id ->
  output_config:edge_output_config ->
  role_arn:role_arn ->
  model_version:edge_version ->
  model_name:entity_name ->
  compilation_job_name:entity_name ->
  edge_packaging_job_name:entity_name ->
  unit ->
  create_edge_packaging_job_request

val make_deployment_stage :
  ?deployment_config:edge_deployment_config ->
  device_selection_config:device_selection_config ->
  stage_name:entity_name ->
  unit ->
  deployment_stage

val make_create_edge_deployment_stage_request :
  stages:deployment_stages ->
  edge_deployment_plan_name:entity_name ->
  unit ->
  create_edge_deployment_stage_request

val make_create_edge_deployment_plan_response :
  edge_deployment_plan_arn:edge_deployment_plan_arn -> unit -> create_edge_deployment_plan_response

val make_create_edge_deployment_plan_request :
  ?tags:tag_list ->
  ?stages:deployment_stages ->
  device_fleet_name:entity_name ->
  model_configs:edge_deployment_model_configs ->
  edge_deployment_plan_name:entity_name ->
  unit ->
  create_edge_deployment_plan_request

val make_create_domain_response :
  ?url:string1024 ->
  ?domain_id:domain_id ->
  ?domain_arn:domain_arn ->
  unit ->
  create_domain_response

val make_create_domain_request :
  ?default_space_settings:default_space_settings ->
  ?tag_propagation:tag_propagation ->
  ?home_efs_file_system_creation:home_efs_file_system_creation ->
  ?app_security_group_management:app_security_group_management ->
  ?kms_key_id:kms_key_id ->
  ?home_efs_file_system_kms_key_id:kms_key_id ->
  ?app_network_access_type:app_network_access_type ->
  ?tags:tag_list ->
  ?vpc_id:vpc_id ->
  ?subnet_ids:subnets ->
  ?domain_settings:domain_settings ->
  default_user_settings:user_settings ->
  auth_mode:auth_mode ->
  domain_name:domain_name ->
  unit ->
  create_domain_request

val make_create_device_fleet_request :
  ?enable_iot_role_alias:enable_iot_role_alias ->
  ?tags:tag_list ->
  ?description:device_fleet_description ->
  ?role_arn:role_arn ->
  output_config:edge_output_config ->
  device_fleet_name:entity_name ->
  unit ->
  create_device_fleet_request

val make_create_data_quality_job_definition_response :
  job_definition_arn:monitoring_job_definition_arn ->
  unit ->
  create_data_quality_job_definition_response

val make_create_data_quality_job_definition_request :
  ?tags:tag_list ->
  ?stopping_condition:monitoring_stopping_condition ->
  ?network_config:monitoring_network_config ->
  ?data_quality_baseline_config:data_quality_baseline_config ->
  role_arn:role_arn ->
  job_resources:monitoring_resources ->
  data_quality_job_output_config:monitoring_output_config ->
  data_quality_job_input:data_quality_job_input ->
  data_quality_app_specification:data_quality_app_specification ->
  job_definition_name:monitoring_job_definition_name ->
  unit ->
  create_data_quality_job_definition_request

val make_create_context_response : ?context_arn:context_arn -> unit -> create_context_response

val make_create_context_request :
  ?tags:tag_list ->
  ?properties:lineage_entity_parameters ->
  ?description:experiment_description ->
  context_type:string256 ->
  source:context_source ->
  context_name:context_name ->
  unit ->
  create_context_request

val make_create_compute_quota_response :
  compute_quota_id:compute_quota_id ->
  compute_quota_arn:compute_quota_arn ->
  unit ->
  create_compute_quota_response

val make_create_compute_quota_request :
  ?tags:tag_list ->
  ?activation_state:activation_state ->
  ?description:entity_description ->
  compute_quota_target:compute_quota_target ->
  compute_quota_config:compute_quota_config ->
  cluster_arn:cluster_arn ->
  name:entity_name ->
  unit ->
  create_compute_quota_request

val make_create_compilation_job_response :
  compilation_job_arn:compilation_job_arn -> unit -> create_compilation_job_response

val make_create_compilation_job_request :
  ?tags:tag_list ->
  ?vpc_config:neo_vpc_config ->
  ?input_config:input_config ->
  ?model_package_version_arn:model_package_arn ->
  stopping_condition:stopping_condition ->
  output_config:output_config ->
  role_arn:role_arn ->
  compilation_job_name:entity_name ->
  unit ->
  create_compilation_job_request

val make_create_code_repository_output :
  code_repository_arn:code_repository_arn -> unit -> create_code_repository_output

val make_create_code_repository_input :
  ?tags:tag_list ->
  git_config:git_config ->
  code_repository_name:entity_name ->
  unit ->
  create_code_repository_input

val make_create_cluster_scheduler_config_response :
  cluster_scheduler_config_id:cluster_scheduler_config_id ->
  cluster_scheduler_config_arn:cluster_scheduler_config_arn ->
  unit ->
  create_cluster_scheduler_config_response

val make_create_cluster_scheduler_config_request :
  ?tags:tag_list ->
  ?description:entity_description ->
  scheduler_config:scheduler_config ->
  cluster_arn:cluster_arn ->
  name:entity_name ->
  unit ->
  create_cluster_scheduler_config_request

val make_create_cluster_response : cluster_arn:cluster_arn -> unit -> create_cluster_response

val make_create_cluster_request :
  ?auto_scaling:cluster_auto_scaling_config ->
  ?cluster_role:role_arn ->
  ?node_provisioning_mode:cluster_node_provisioning_mode ->
  ?tiered_storage_config:cluster_tiered_storage_config ->
  ?node_recovery:cluster_node_recovery ->
  ?orchestrator:cluster_orchestrator ->
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?restricted_instance_groups_config:cluster_restricted_instance_groups_config ->
  ?restricted_instance_groups:cluster_restricted_instance_group_specifications ->
  ?instance_groups:cluster_instance_group_specifications ->
  cluster_name:cluster_name ->
  unit ->
  create_cluster_request

val make_create_auto_ml_job_v2_response :
  auto_ml_job_arn:auto_ml_job_arn -> unit -> create_auto_ml_job_v2_response

val make_create_auto_ml_job_v2_request :
  ?auto_ml_compute_config:auto_ml_compute_config ->
  ?data_split_config:auto_ml_data_split_config ->
  ?model_deploy_config:model_deploy_config ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?security_config:auto_ml_security_config ->
  ?tags:tag_list ->
  role_arn:role_arn ->
  auto_ml_problem_type_config:auto_ml_problem_type_config ->
  output_data_config:auto_ml_output_data_config ->
  auto_ml_job_input_data_config:auto_ml_job_input_data_config ->
  auto_ml_job_name:auto_ml_job_name ->
  unit ->
  create_auto_ml_job_v2_request

val make_create_auto_ml_job_response :
  auto_ml_job_arn:auto_ml_job_arn -> unit -> create_auto_ml_job_response

val make_create_auto_ml_job_request :
  ?model_deploy_config:model_deploy_config ->
  ?tags:tag_list ->
  ?generate_candidate_definitions_only:generate_candidate_definitions_only ->
  ?auto_ml_job_config:auto_ml_job_config ->
  ?auto_ml_job_objective:auto_ml_job_objective ->
  ?problem_type:problem_type ->
  role_arn:role_arn ->
  output_data_config:auto_ml_output_data_config ->
  input_data_config:auto_ml_input_data_config ->
  auto_ml_job_name:auto_ml_job_name ->
  unit ->
  create_auto_ml_job_request

val make_create_artifact_response : ?artifact_arn:artifact_arn -> unit -> create_artifact_response

val make_create_artifact_request :
  ?tags:tag_list ->
  ?metadata_properties:metadata_properties ->
  ?properties:artifact_properties ->
  ?artifact_name:experiment_entity_name ->
  artifact_type:string256 ->
  source:artifact_source ->
  unit ->
  create_artifact_request

val make_create_app_image_config_response :
  ?app_image_config_arn:app_image_config_arn -> unit -> create_app_image_config_response

val make_create_app_image_config_request :
  ?code_editor_app_image_config:code_editor_app_image_config ->
  ?jupyter_lab_app_image_config:jupyter_lab_app_image_config ->
  ?kernel_gateway_image_config:kernel_gateway_image_config ->
  ?tags:tag_list ->
  app_image_config_name:app_image_config_name ->
  unit ->
  create_app_image_config_request

val make_create_app_response : ?app_arn:app_arn -> unit -> create_app_response

val make_create_app_request :
  ?recovery_mode:boolean_ ->
  ?resource_spec:resource_spec ->
  ?tags:tag_list ->
  ?space_name:space_name ->
  ?user_profile_name:user_profile_name ->
  app_name:app_name ->
  app_type:app_type ->
  domain_id:domain_id ->
  unit ->
  create_app_request

val make_create_algorithm_output : algorithm_arn:algorithm_arn -> unit -> create_algorithm_output

val make_create_algorithm_input :
  ?tags:tag_list ->
  ?certify_for_marketplace:certify_for_marketplace ->
  ?validation_specification:algorithm_validation_specification ->
  ?inference_specification:inference_specification ->
  ?algorithm_description:entity_description ->
  training_specification:training_specification ->
  algorithm_name:entity_name ->
  unit ->
  create_algorithm_input

val make_create_ai_workload_config_response :
  ai_workload_config_arn:ai_workload_config_arn -> unit -> create_ai_workload_config_response

val make_create_ai_workload_config_request :
  ?tags:tag_list ->
  ?ai_workload_configs:ai_workload_configs ->
  ?dataset_config:ai_dataset_config ->
  ai_workload_config_name:ai_entity_name ->
  unit ->
  create_ai_workload_config_request

val make_create_ai_recommendation_job_response :
  ai_recommendation_job_arn:ai_recommendation_job_arn ->
  unit ->
  create_ai_recommendation_job_response

val make_ai_recommendation_output_config :
  ?mlflow_config:ai_mlflow_config ->
  ?model_package_group_identifier:ai_resource_identifier ->
  ?s3_output_location:s3_uri ->
  unit ->
  ai_recommendation_output_config

val make_create_ai_recommendation_job_request :
  ?tags:tag_list ->
  ?compute_spec:ai_recommendation_compute_spec ->
  ?optimize_model:ai_recommendation_allow_optimization ->
  ?inference_specification:ai_recommendation_inference_specification ->
  role_arn:role_arn ->
  performance_target:ai_recommendation_performance_target ->
  ai_workload_config_identifier:ai_resource_identifier ->
  output_config:ai_recommendation_output_config ->
  model_source:ai_model_source ->
  ai_recommendation_job_name:ai_entity_name ->
  unit ->
  create_ai_recommendation_job_request

val make_create_ai_benchmark_job_response :
  ai_benchmark_job_arn:ai_benchmark_job_arn -> unit -> create_ai_benchmark_job_response

val make_ai_benchmark_output_config :
  ?mlflow_config:ai_mlflow_config -> s3_output_location:s3_uri -> unit -> ai_benchmark_output_config

val make_create_ai_benchmark_job_request :
  ?tags:tag_list ->
  ?network_config:ai_benchmark_network_config ->
  role_arn:role_arn ->
  ai_workload_config_identifier:ai_resource_identifier ->
  output_config:ai_benchmark_output_config ->
  benchmark_target:ai_benchmark_target ->
  ai_benchmark_job_name:ai_entity_name ->
  unit ->
  create_ai_benchmark_job_request

val make_create_action_response : ?action_arn:action_arn -> unit -> create_action_response

val make_create_action_request :
  ?tags:tag_list ->
  ?metadata_properties:metadata_properties ->
  ?properties:lineage_entity_parameters ->
  ?status:action_status ->
  ?description:experiment_description ->
  action_type:string256 ->
  source:action_source ->
  action_name:experiment_entity_name ->
  unit ->
  create_action_request

val make_batch_replace_cluster_nodes_error :
  message:string_ ->
  error_code:batch_replace_cluster_nodes_error_code ->
  node_id:cluster_node_id ->
  unit ->
  batch_replace_cluster_nodes_error

val make_batch_replace_cluster_node_logical_ids_error :
  message:string_ ->
  error_code:batch_replace_cluster_nodes_error_code ->
  node_logical_id:cluster_node_logical_id ->
  unit ->
  batch_replace_cluster_node_logical_ids_error

val make_batch_replace_cluster_nodes_response :
  ?successful_node_logical_ids:cluster_node_logical_id_list ->
  ?failed_node_logical_ids:batch_replace_cluster_node_logical_ids_errors ->
  ?failed:batch_replace_cluster_nodes_errors ->
  ?successful:cluster_node_ids ->
  unit ->
  batch_replace_cluster_nodes_response

val make_batch_replace_cluster_nodes_request :
  ?node_logical_ids:cluster_node_logical_id_list ->
  ?node_ids:cluster_node_ids ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  batch_replace_cluster_nodes_request

val make_batch_reboot_cluster_nodes_error :
  message:string_ ->
  error_code:batch_reboot_cluster_nodes_error_code ->
  node_id:cluster_node_id ->
  unit ->
  batch_reboot_cluster_nodes_error

val make_batch_reboot_cluster_node_logical_ids_error :
  message:string_ ->
  error_code:batch_reboot_cluster_nodes_error_code ->
  node_logical_id:cluster_node_logical_id ->
  unit ->
  batch_reboot_cluster_node_logical_ids_error

val make_batch_reboot_cluster_nodes_response :
  ?successful_node_logical_ids:cluster_node_logical_id_list ->
  ?failed_node_logical_ids:batch_reboot_cluster_node_logical_ids_errors ->
  ?failed:batch_reboot_cluster_nodes_errors ->
  ?successful:cluster_node_ids ->
  unit ->
  batch_reboot_cluster_nodes_response

val make_batch_reboot_cluster_nodes_request :
  ?node_logical_ids:cluster_node_logical_id_list ->
  ?node_ids:cluster_node_ids ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  batch_reboot_cluster_nodes_request

val make_batch_describe_model_package_summary :
  ?model_package_registration_type:model_package_registration_type ->
  ?model_approval_status:model_approval_status ->
  ?model_package_description:entity_description ->
  ?model_package_version:model_package_version ->
  model_package_status:model_package_status ->
  inference_specification:inference_specification ->
  creation_time:creation_time ->
  model_package_arn:model_package_arn ->
  model_package_group_name:entity_name ->
  unit ->
  batch_describe_model_package_summary

val make_batch_describe_model_package_error :
  error_response:string_ -> error_code:string_ -> unit -> batch_describe_model_package_error

val make_batch_describe_model_package_output :
  ?batch_describe_model_package_error_map:batch_describe_model_package_error_map ->
  ?model_package_summaries:model_package_summaries ->
  unit ->
  batch_describe_model_package_output

val make_batch_describe_model_package_input :
  model_package_arn_list:model_package_arn_list -> unit -> batch_describe_model_package_input

val make_batch_delete_cluster_nodes_error :
  node_id:cluster_node_id ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  code:batch_delete_cluster_nodes_error_code ->
  unit ->
  batch_delete_cluster_nodes_error

val make_batch_delete_cluster_node_logical_ids_error :
  node_logical_id:cluster_node_logical_id ->
  message:string_ ->
  code:batch_delete_cluster_nodes_error_code ->
  unit ->
  batch_delete_cluster_node_logical_ids_error

val make_batch_delete_cluster_nodes_response :
  ?successful_node_logical_ids:cluster_node_logical_id_list ->
  ?failed_node_logical_ids:batch_delete_cluster_node_logical_ids_error_list ->
  ?successful:cluster_node_ids ->
  ?failed:batch_delete_cluster_nodes_error_list ->
  unit ->
  batch_delete_cluster_nodes_response

val make_batch_delete_cluster_nodes_request :
  ?node_logical_ids:cluster_node_logical_id_list ->
  ?node_ids:cluster_node_ids ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  batch_delete_cluster_nodes_request

val make_batch_add_cluster_nodes_error :
  ?message:string_ ->
  ?instance_types:cluster_instance_types ->
  ?availability_zones:cluster_availability_zones ->
  failed_count:batch_add_failure_count ->
  error_code:batch_add_cluster_nodes_error_code ->
  instance_group_name:instance_group_name ->
  unit ->
  batch_add_cluster_nodes_error

val make_batch_add_cluster_nodes_response :
  failed:batch_add_cluster_nodes_error_list ->
  successful:node_addition_result_list ->
  unit ->
  batch_add_cluster_nodes_response

val make_add_cluster_node_specification :
  ?instance_types:cluster_instance_types ->
  ?availability_zones:cluster_availability_zones ->
  increment_target_count_by:batch_add_increment_count ->
  instance_group_name:cluster_instance_group_name ->
  unit ->
  add_cluster_node_specification

val make_batch_add_cluster_nodes_request :
  ?client_token:string_ ->
  nodes_to_add:add_cluster_node_specification_list ->
  cluster_name:cluster_name_or_arn ->
  unit ->
  batch_add_cluster_nodes_request

val make_attach_cluster_node_volume_response :
  device_name:volume_device_name ->
  status:volume_attachment_status ->
  attach_time:timestamp ->
  volume_id:volume_id ->
  node_id:cluster_node_id ->
  cluster_arn:cluster_arn ->
  unit ->
  attach_cluster_node_volume_response

val make_attach_cluster_node_volume_request :
  volume_id:volume_id ->
  node_id:cluster_node_id ->
  cluster_arn:cluster_arn ->
  unit ->
  attach_cluster_node_volume_request

val make_associate_trial_component_response :
  ?trial_arn:trial_arn ->
  ?trial_component_arn:trial_component_arn ->
  unit ->
  associate_trial_component_response

val make_associate_trial_component_request :
  trial_name:experiment_entity_name ->
  trial_component_name:experiment_entity_name ->
  unit ->
  associate_trial_component_request

val make_add_tags_output : ?tags:tag_list -> unit -> add_tags_output
val make_add_tags_input : tags:tag_list -> resource_arn:resource_arn -> unit -> add_tags_input

val make_add_association_response :
  ?destination_arn:association_entity_arn ->
  ?source_arn:association_entity_arn ->
  unit ->
  add_association_response

val make_add_association_request :
  ?association_type:association_edge_type ->
  destination_arn:association_entity_arn ->
  source_arn:association_entity_arn ->
  unit ->
  add_association_request
