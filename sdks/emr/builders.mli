open Types

val make_add_instance_fleet_output :
  ?cluster_id:xml_string_max_len256 ->
  ?instance_fleet_id:instance_fleet_id ->
  ?cluster_arn:arn_type ->
  unit ->
  add_instance_fleet_output

val make_on_demand_capacity_reservation_options :
  ?usage_strategy:on_demand_capacity_reservation_usage_strategy ->
  ?capacity_reservation_preference:on_demand_capacity_reservation_preference ->
  ?capacity_reservation_resource_group_arn:xml_string_max_len256 ->
  unit ->
  on_demand_capacity_reservation_options

val make_on_demand_resizing_specification :
  ?timeout_duration_minutes:whole_number ->
  ?allocation_strategy:on_demand_provisioning_allocation_strategy ->
  ?capacity_reservation_options:on_demand_capacity_reservation_options ->
  unit ->
  on_demand_resizing_specification

val make_spot_resizing_specification :
  ?timeout_duration_minutes:whole_number ->
  ?allocation_strategy:spot_provisioning_allocation_strategy ->
  unit ->
  spot_resizing_specification

val make_instance_fleet_resizing_specifications :
  ?spot_resize_specification:spot_resizing_specification ->
  ?on_demand_resize_specification:on_demand_resizing_specification ->
  unit ->
  instance_fleet_resizing_specifications

val make_on_demand_provisioning_specification :
  ?capacity_reservation_options:on_demand_capacity_reservation_options ->
  allocation_strategy:on_demand_provisioning_allocation_strategy ->
  unit ->
  on_demand_provisioning_specification

val make_spot_provisioning_specification :
  ?block_duration_minutes:whole_number ->
  ?allocation_strategy:spot_provisioning_allocation_strategy ->
  timeout_duration_minutes:whole_number ->
  timeout_action:spot_provisioning_timeout_action ->
  unit ->
  spot_provisioning_specification

val make_instance_fleet_provisioning_specifications :
  ?spot_specification:spot_provisioning_specification ->
  ?on_demand_specification:on_demand_provisioning_specification ->
  unit ->
  instance_fleet_provisioning_specifications

val make_configuration :
  ?classification:string_ ->
  ?configurations:configuration_list ->
  ?properties:string_map ->
  unit ->
  configuration

val make_volume_specification :
  ?iops:integer ->
  ?throughput:throughput_val ->
  volume_type:string_ ->
  size_in_g_b:integer ->
  unit ->
  volume_specification

val make_ebs_block_device_config :
  ?volumes_per_instance:integer ->
  volume_specification:volume_specification ->
  unit ->
  ebs_block_device_config

val make_ebs_configuration :
  ?ebs_block_device_configs:ebs_block_device_config_list ->
  ?ebs_optimized:boolean_object ->
  unit ->
  ebs_configuration

val make_instance_type_config :
  ?weighted_capacity:whole_number ->
  ?bid_price:xml_string_max_len256 ->
  ?bid_price_as_percentage_of_on_demand_price:non_negative_double ->
  ?ebs_configuration:ebs_configuration ->
  ?configurations:configuration_list ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?priority:non_negative_double ->
  instance_type:instance_type ->
  unit ->
  instance_type_config

val make_instance_fleet_config :
  ?name:xml_string_max_len256 ->
  ?target_on_demand_capacity:whole_number ->
  ?target_spot_capacity:whole_number ->
  ?instance_type_configs:instance_type_config_list ->
  ?launch_specifications:instance_fleet_provisioning_specifications ->
  ?resize_specifications:instance_fleet_resizing_specifications ->
  ?context:xml_string_max_len256 ->
  instance_fleet_type:instance_fleet_type ->
  unit ->
  instance_fleet_config

val make_add_instance_fleet_input :
  cluster_id:xml_string_max_len256 ->
  instance_fleet:instance_fleet_config ->
  unit ->
  add_instance_fleet_input

val make_add_instance_groups_output :
  ?job_flow_id:xml_string_max_len256 ->
  ?instance_group_ids:instance_group_ids_list ->
  ?cluster_arn:arn_type ->
  unit ->
  add_instance_groups_output

val make_metric_dimension : ?key:string_ -> ?value:string_ -> unit -> metric_dimension

val make_cloud_watch_alarm_definition :
  ?evaluation_periods:integer ->
  ?namespace:string_ ->
  ?statistic:statistic ->
  ?unit_:unit_ ->
  ?dimensions:metric_dimension_list ->
  comparison_operator:comparison_operator ->
  metric_name:string_ ->
  period:integer ->
  threshold:non_negative_double ->
  unit ->
  cloud_watch_alarm_definition

val make_scaling_trigger :
  cloud_watch_alarm_definition:cloud_watch_alarm_definition -> unit -> scaling_trigger

val make_simple_scaling_policy_configuration :
  ?adjustment_type:adjustment_type ->
  ?cool_down:integer ->
  scaling_adjustment:integer ->
  unit ->
  simple_scaling_policy_configuration

val make_scaling_action :
  ?market:market_type ->
  simple_scaling_policy_configuration:simple_scaling_policy_configuration ->
  unit ->
  scaling_action

val make_scaling_rule :
  ?description:string_ ->
  name:string_ ->
  action:scaling_action ->
  trigger:scaling_trigger ->
  unit ->
  scaling_rule

val make_scaling_constraints :
  min_capacity:integer -> max_capacity:integer -> unit -> scaling_constraints

val make_auto_scaling_policy :
  constraints:scaling_constraints -> rules:scaling_rule_list -> unit -> auto_scaling_policy

val make_instance_group_config :
  ?name:xml_string_max_len256 ->
  ?market:market_type ->
  ?bid_price:xml_string_max_len256 ->
  ?configurations:configuration_list ->
  ?ebs_configuration:ebs_configuration ->
  ?auto_scaling_policy:auto_scaling_policy ->
  ?custom_ami_id:xml_string_max_len256 ->
  instance_role:instance_role_type ->
  instance_type:instance_type ->
  instance_count:integer ->
  unit ->
  instance_group_config

val make_add_instance_groups_input :
  instance_groups:instance_group_config_list ->
  job_flow_id:xml_string_max_len256 ->
  unit ->
  add_instance_groups_input

val make_add_job_flow_steps_output : ?step_ids:step_ids_list -> unit -> add_job_flow_steps_output

val make_s3_monitoring_configuration :
  ?log_uri:xml_string -> ?encryption_key_arn:xml_string -> unit -> s3_monitoring_configuration

val make_step_monitoring_configuration :
  ?s3_monitoring_configuration:s3_monitoring_configuration -> unit -> step_monitoring_configuration

val make_key_value : ?key:xml_string -> ?value:xml_string -> unit -> key_value

val make_hadoop_jar_step_config :
  ?properties:key_value_list ->
  ?main_class:xml_string ->
  ?args:xml_string_list ->
  jar:xml_string ->
  unit ->
  hadoop_jar_step_config

val make_step_config :
  ?action_on_failure:action_on_failure ->
  ?step_monitoring_configuration:step_monitoring_configuration ->
  name:xml_string_max_len256 ->
  hadoop_jar_step:hadoop_jar_step_config ->
  unit ->
  step_config

val make_add_job_flow_steps_input :
  ?execution_role_arn:arn_type ->
  job_flow_id:xml_string_max_len256 ->
  steps:step_config_list ->
  unit ->
  add_job_flow_steps_input

val make_add_tags_output : unit -> unit
val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag

val make_add_tags_input :
  ?cluster_id:cluster_id -> resource_id:resource_id -> tags:tag_list -> unit -> add_tags_input

val make_application :
  ?name:string_ ->
  ?version:string_ ->
  ?args:string_list ->
  ?additional_info:string_map ->
  unit ->
  application

val make_auto_scaling_policy_state_change_reason :
  ?code:auto_scaling_policy_state_change_reason_code ->
  ?message:string_ ->
  unit ->
  auto_scaling_policy_state_change_reason

val make_auto_scaling_policy_status :
  ?state:auto_scaling_policy_state ->
  ?state_change_reason:auto_scaling_policy_state_change_reason ->
  unit ->
  auto_scaling_policy_status

val make_auto_scaling_policy_description :
  ?status:auto_scaling_policy_status ->
  ?constraints:scaling_constraints ->
  ?rules:scaling_rule_list ->
  unit ->
  auto_scaling_policy_description

val make_auto_termination_policy : ?idle_timeout:long -> unit -> auto_termination_policy
val make_port_range : ?max_range:port -> min_range:port -> unit -> port_range

val make_block_public_access_configuration :
  ?permitted_public_security_group_rule_ranges:port_ranges ->
  ?classification:string_ ->
  ?configurations:configuration_list ->
  ?properties:string_map ->
  block_public_security_group_rules:boolean_ ->
  unit ->
  block_public_access_configuration

val make_block_public_access_configuration_metadata :
  creation_date_time:date ->
  created_by_arn:arn_type ->
  unit ->
  block_public_access_configuration_metadata

val make_script_bootstrap_action_config :
  ?args:xml_string_list -> path:xml_string -> unit -> script_bootstrap_action_config

val make_bootstrap_action_config :
  name:xml_string_max_len256 ->
  script_bootstrap_action:script_bootstrap_action_config ->
  unit ->
  bootstrap_action_config

val make_bootstrap_action_detail :
  ?bootstrap_action_config:bootstrap_action_config -> unit -> bootstrap_action_detail

val make_cancel_steps_info :
  ?step_id:step_id ->
  ?status:cancel_steps_request_status ->
  ?reason:string_ ->
  unit ->
  cancel_steps_info

val make_cancel_steps_output :
  ?cancel_steps_info_list:cancel_steps_info_list -> unit -> cancel_steps_output

val make_cancel_steps_input :
  ?step_cancellation_option:step_cancellation_option ->
  cluster_id:xml_string_max_len256 ->
  step_ids:step_ids_list ->
  unit ->
  cancel_steps_input

val make_certificate_authority :
  ?certificate_arn:xml_string -> ?certificate_data:xml_string -> unit -> certificate_authority

val make_cloud_watch_log_configuration :
  ?log_group_name:xml_string ->
  ?log_stream_name_prefix:xml_string ->
  ?encryption_key_arn:xml_string ->
  ?log_types:log_types_map ->
  enabled:boolean_ ->
  unit ->
  cloud_watch_log_configuration

val make_s3_logging_configuration :
  ?log_type_upload_policy:log_type_map -> unit -> s3_logging_configuration

val make_monitoring_configuration :
  ?cloud_watch_log_configuration:cloud_watch_log_configuration ->
  ?s3_logging_configuration:s3_logging_configuration ->
  unit ->
  monitoring_configuration

val make_placement_group_config :
  ?placement_strategy:placement_group_strategy ->
  instance_role:instance_role_type ->
  unit ->
  placement_group_config

val make_kerberos_attributes :
  ?cross_realm_trust_principal_password:xml_string_max_len256 ->
  ?ad_domain_join_user:xml_string_max_len256 ->
  ?ad_domain_join_password:xml_string_max_len256 ->
  realm:xml_string_max_len256 ->
  kdc_admin_password:xml_string_max_len256 ->
  unit ->
  kerberos_attributes

val make_ec2_instance_attributes :
  ?ec2_key_name:string_ ->
  ?ec2_subnet_id:string_ ->
  ?requested_ec2_subnet_ids:xml_string_max_len256_list ->
  ?ec2_availability_zone:string_ ->
  ?requested_ec2_availability_zones:xml_string_max_len256_list ->
  ?iam_instance_profile:string_ ->
  ?emr_managed_master_security_group:string_ ->
  ?emr_managed_slave_security_group:string_ ->
  ?service_access_security_group:string_ ->
  ?additional_master_security_groups:string_list ->
  ?additional_slave_security_groups:string_list ->
  unit ->
  ec2_instance_attributes

val make_error_detail :
  ?error_code:string_ -> ?error_data:error_data -> ?error_message:string_ -> unit -> error_detail

val make_cluster_timeline :
  ?creation_date_time:date ->
  ?ready_date_time:date ->
  ?end_date_time:date ->
  unit ->
  cluster_timeline

val make_cluster_state_change_reason :
  ?code:cluster_state_change_reason_code -> ?message:string_ -> unit -> cluster_state_change_reason

val make_cluster_status :
  ?state:cluster_state ->
  ?state_change_reason:cluster_state_change_reason ->
  ?timeline:cluster_timeline ->
  ?error_details:error_detail_list ->
  unit ->
  cluster_status

val make_cluster :
  ?id:cluster_id ->
  ?name:string_ ->
  ?status:cluster_status ->
  ?ec2_instance_attributes:ec2_instance_attributes ->
  ?instance_collection_type:instance_collection_type ->
  ?log_uri:string_ ->
  ?log_encryption_kms_key_id:string_ ->
  ?requested_ami_version:string_ ->
  ?running_ami_version:string_ ->
  ?release_label:string_ ->
  ?auto_terminate:boolean_ ->
  ?termination_protected:boolean_ ->
  ?unhealthy_node_replacement:boolean_object ->
  ?visible_to_all_users:boolean_ ->
  ?applications:application_list ->
  ?tags:tag_list ->
  ?service_role:string_ ->
  ?normalized_instance_hours:integer ->
  ?master_public_dns_name:string_ ->
  ?configurations:configuration_list ->
  ?security_configuration:xml_string ->
  ?auto_scaling_role:xml_string ->
  ?scale_down_behavior:scale_down_behavior ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?ebs_root_volume_size:integer ->
  ?repo_upgrade_on_boot:repo_upgrade_on_boot ->
  ?kerberos_attributes:kerberos_attributes ->
  ?cluster_arn:arn_type ->
  ?outpost_arn:optional_arn_type ->
  ?step_concurrency_level:integer ->
  ?placement_groups:placement_group_config_list ->
  ?os_release_label:string_ ->
  ?ebs_root_volume_iops:integer ->
  ?ebs_root_volume_throughput:integer ->
  ?extended_support:boolean_object ->
  ?monitoring_configuration:monitoring_configuration ->
  ?session_enabled:boolean_object ->
  unit ->
  cluster

val make_cluster_summary :
  ?id:cluster_id ->
  ?name:string_ ->
  ?status:cluster_status ->
  ?normalized_instance_hours:integer ->
  ?cluster_arn:arn_type ->
  ?outpost_arn:optional_arn_type ->
  unit ->
  cluster_summary

val make_command : ?name:string_ -> ?script_path:string_ -> ?args:string_list -> unit -> command

val make_compute_limits :
  ?maximum_on_demand_capacity_units:integer ->
  ?maximum_core_capacity_units:integer ->
  unit_type:compute_limits_unit_type ->
  minimum_capacity_units:integer ->
  maximum_capacity_units:integer ->
  unit ->
  compute_limits

val make_create_persistent_app_ui_output :
  ?persistent_app_ui_id:xml_string_max_len256 ->
  ?runtime_role_enabled_cluster:boolean_ ->
  unit ->
  create_persistent_app_ui_output

val make_emr_containers_config : ?job_run_id:xml_string_max_len256 -> unit -> emr_containers_config

val make_create_persistent_app_ui_input :
  ?emr_containers_config:emr_containers_config ->
  ?tags:tag_list ->
  ?x_referer:string_ ->
  ?profiler_type:profiler_type ->
  target_resource_arn:arn_type ->
  unit ->
  create_persistent_app_ui_input

val make_create_security_configuration_output :
  name:xml_string -> creation_date_time:date -> unit -> create_security_configuration_output

val make_create_security_configuration_input :
  name:xml_string -> security_configuration:string_ -> unit -> create_security_configuration_input

val make_create_studio_output :
  ?studio_id:xml_string_max_len256 -> ?url:xml_string -> unit -> create_studio_output

val make_create_studio_input :
  ?description:xml_string_max_len256 ->
  ?user_role:xml_string ->
  ?idp_auth_url:xml_string ->
  ?idp_relay_state_parameter_name:xml_string_max_len256 ->
  ?tags:tag_list ->
  ?trusted_identity_propagation_enabled:boolean_object ->
  ?idc_user_assignment:idc_user_assignment ->
  ?idc_instance_arn:arn_type ->
  ?encryption_key_arn:xml_string ->
  name:xml_string_max_len256 ->
  auth_mode:auth_mode ->
  vpc_id:xml_string_max_len256 ->
  subnet_ids:subnet_id_list ->
  service_role:xml_string ->
  workspace_security_group_id:xml_string_max_len256 ->
  engine_security_group_id:xml_string_max_len256 ->
  default_s3_location:xml_string ->
  unit ->
  create_studio_input

val make_create_studio_session_mapping_input :
  ?identity_id:xml_string_max_len256 ->
  ?identity_name:xml_string_max_len256 ->
  studio_id:xml_string_max_len256 ->
  identity_type:identity_type ->
  session_policy_arn:xml_string_max_len256 ->
  unit ->
  create_studio_session_mapping_input

val make_username_password :
  ?username:xml_string_max_len256 -> ?password:xml_string_max_len256 -> unit -> username_password

val make_delete_security_configuration_output : unit -> unit

val make_delete_security_configuration_input :
  name:xml_string -> unit -> delete_security_configuration_input

val make_delete_studio_input : studio_id:xml_string_max_len256 -> unit -> delete_studio_input

val make_delete_studio_session_mapping_input :
  ?identity_id:xml_string_max_len256 ->
  ?identity_name:xml_string_max_len256 ->
  studio_id:xml_string_max_len256 ->
  identity_type:identity_type ->
  unit ->
  delete_studio_session_mapping_input

val make_describe_cluster_output : ?cluster:cluster -> unit -> describe_cluster_output
val make_describe_cluster_input : cluster_id:cluster_id -> unit -> describe_cluster_input

val make_step_execution_status_detail :
  ?start_date_time:date ->
  ?end_date_time:date ->
  ?last_state_change_reason:xml_string ->
  state:step_execution_state ->
  creation_date_time:date ->
  unit ->
  step_execution_status_detail

val make_step_detail :
  step_config:step_config ->
  execution_status_detail:step_execution_status_detail ->
  unit ->
  step_detail

val make_placement_type :
  ?availability_zone:xml_string ->
  ?availability_zones:xml_string_max_len256_list ->
  unit ->
  placement_type

val make_instance_group_detail :
  ?instance_group_id:xml_string_max_len256 ->
  ?name:xml_string_max_len256 ->
  ?bid_price:xml_string_max_len256 ->
  ?last_state_change_reason:xml_string ->
  ?start_date_time:date ->
  ?ready_date_time:date ->
  ?end_date_time:date ->
  ?custom_ami_id:xml_string_max_len256 ->
  market:market_type ->
  instance_role:instance_role_type ->
  instance_type:instance_type ->
  instance_request_count:integer ->
  instance_running_count:integer ->
  state:instance_group_state ->
  creation_date_time:date ->
  unit ->
  instance_group_detail

val make_job_flow_instances_detail :
  ?master_public_dns_name:xml_string ->
  ?master_instance_id:xml_string ->
  ?instance_groups:instance_group_detail_list ->
  ?normalized_instance_hours:integer ->
  ?ec2_key_name:xml_string_max_len256 ->
  ?ec2_subnet_id:xml_string_max_len256 ->
  ?placement:placement_type ->
  ?keep_job_flow_alive_when_no_steps:boolean_ ->
  ?termination_protected:boolean_ ->
  ?unhealthy_node_replacement:boolean_object ->
  ?hadoop_version:xml_string_max_len256 ->
  master_instance_type:instance_type ->
  slave_instance_type:instance_type ->
  instance_count:integer ->
  unit ->
  job_flow_instances_detail

val make_job_flow_execution_status_detail :
  ?start_date_time:date ->
  ?ready_date_time:date ->
  ?end_date_time:date ->
  ?last_state_change_reason:xml_string ->
  state:job_flow_execution_state ->
  creation_date_time:date ->
  unit ->
  job_flow_execution_status_detail

val make_job_flow_detail :
  ?log_uri:xml_string ->
  ?log_encryption_kms_key_id:xml_string ->
  ?ami_version:xml_string_max_len256 ->
  ?steps:step_detail_list ->
  ?bootstrap_actions:bootstrap_action_detail_list ->
  ?supported_products:supported_products_list ->
  ?visible_to_all_users:boolean_ ->
  ?job_flow_role:xml_string ->
  ?service_role:xml_string ->
  ?auto_scaling_role:xml_string ->
  ?scale_down_behavior:scale_down_behavior ->
  job_flow_id:xml_string_max_len256 ->
  name:xml_string_max_len256 ->
  execution_status_detail:job_flow_execution_status_detail ->
  instances:job_flow_instances_detail ->
  unit ->
  job_flow_detail

val make_describe_job_flows_output :
  ?job_flows:job_flow_detail_list -> unit -> describe_job_flows_output

val make_describe_job_flows_input :
  ?created_after:date ->
  ?created_before:date ->
  ?job_flow_ids:xml_string_list ->
  ?job_flow_states:job_flow_execution_state_list ->
  unit ->
  describe_job_flows_input

val make_output_notebook_s3_location_for_output :
  ?bucket:xml_string_max_len256 -> ?key:uri_string -> unit -> output_notebook_s3_location_for_output

val make_notebook_s3_location_for_output :
  ?bucket:xml_string_max_len256 -> ?key:uri_string -> unit -> notebook_s3_location_for_output

val make_execution_engine_config :
  ?type_:execution_engine_type ->
  ?master_instance_security_group_id:xml_string_max_len256 ->
  ?execution_role_arn:iam_role_arn ->
  id:xml_string_max_len256 ->
  unit ->
  execution_engine_config

val make_notebook_execution :
  ?notebook_execution_id:xml_string_max_len256 ->
  ?editor_id:xml_string_max_len256 ->
  ?execution_engine:execution_engine_config ->
  ?notebook_execution_name:xml_string_max_len256 ->
  ?notebook_params:xml_string ->
  ?status:notebook_execution_status ->
  ?start_time:date ->
  ?end_time:date ->
  ?arn:xml_string_max_len256 ->
  ?output_notebook_ur_i:xml_string ->
  ?last_state_change_reason:xml_string ->
  ?notebook_instance_security_group_id:xml_string_max_len256 ->
  ?tags:tag_list ->
  ?notebook_s3_location:notebook_s3_location_for_output ->
  ?output_notebook_s3_location:output_notebook_s3_location_for_output ->
  ?output_notebook_format:output_notebook_format ->
  ?environment_variables:environment_variables_map ->
  unit ->
  notebook_execution

val make_describe_notebook_execution_output :
  ?notebook_execution:notebook_execution -> unit -> describe_notebook_execution_output

val make_describe_notebook_execution_input :
  notebook_execution_id:xml_string_max_len256 -> unit -> describe_notebook_execution_input

val make_persistent_app_u_i :
  ?persistent_app_ui_id:xml_string_max_len256 ->
  ?persistent_app_ui_type_list:persistent_app_ui_type_list ->
  ?persistent_app_ui_status:xml_string_max_len256 ->
  ?author_id:xml_string_max_len256 ->
  ?creation_time:date ->
  ?last_modified_time:date ->
  ?last_state_change_reason:xml_string ->
  ?tags:tag_list ->
  unit ->
  persistent_app_u_i

val make_describe_persistent_app_ui_output :
  ?persistent_app_u_i:persistent_app_u_i -> unit -> describe_persistent_app_ui_output

val make_describe_persistent_app_ui_input :
  persistent_app_ui_id:xml_string_max_len256 -> unit -> describe_persistent_app_ui_input

val make_os_release : ?label:string_ -> unit -> os_release

val make_simplified_application :
  ?name:string_ -> ?version:string_ -> unit -> simplified_application

val make_describe_release_label_output :
  ?release_label:string_ ->
  ?applications:simplified_application_list ->
  ?next_token:string_ ->
  ?available_os_releases:os_release_list ->
  unit ->
  describe_release_label_output

val make_describe_release_label_input :
  ?release_label:string_ ->
  ?next_token:string_ ->
  ?max_results:max_results_number ->
  unit ->
  describe_release_label_input

val make_describe_security_configuration_output :
  ?name:xml_string ->
  ?security_configuration:string_ ->
  ?creation_date_time:date ->
  unit ->
  describe_security_configuration_output

val make_describe_security_configuration_input :
  name:xml_string -> unit -> describe_security_configuration_input

val make_step_timeline :
  ?creation_date_time:date -> ?start_date_time:date -> ?end_date_time:date -> unit -> step_timeline

val make_failure_details :
  ?reason:string_ -> ?message:string_ -> ?log_file:string_ -> unit -> failure_details

val make_step_state_change_reason :
  ?code:step_state_change_reason_code -> ?message:string_ -> unit -> step_state_change_reason

val make_step_status :
  ?state:step_state ->
  ?state_change_reason:step_state_change_reason ->
  ?failure_details:failure_details ->
  ?timeline:step_timeline ->
  unit ->
  step_status

val make_hadoop_step_config :
  ?jar:string_ ->
  ?properties:string_map ->
  ?main_class:string_ ->
  ?args:string_list ->
  unit ->
  hadoop_step_config

val make_step :
  ?id:step_id ->
  ?name:string_ ->
  ?config:hadoop_step_config ->
  ?action_on_failure:action_on_failure ->
  ?status:step_status ->
  ?execution_role_arn:optional_arn_type ->
  ?log_uri:string_ ->
  ?encryption_key_arn:string_ ->
  unit ->
  step

val make_describe_step_output : ?step:step -> unit -> describe_step_output

val make_describe_step_input :
  cluster_id:cluster_id -> step_id:step_id -> unit -> describe_step_input

val make_studio :
  ?studio_id:xml_string_max_len256 ->
  ?studio_arn:xml_string_max_len256 ->
  ?name:xml_string_max_len256 ->
  ?description:xml_string_max_len256 ->
  ?auth_mode:auth_mode ->
  ?vpc_id:xml_string_max_len256 ->
  ?subnet_ids:subnet_id_list ->
  ?service_role:xml_string ->
  ?user_role:xml_string ->
  ?workspace_security_group_id:xml_string_max_len256 ->
  ?engine_security_group_id:xml_string_max_len256 ->
  ?url:xml_string ->
  ?creation_time:date ->
  ?default_s3_location:xml_string ->
  ?idp_auth_url:xml_string ->
  ?idp_relay_state_parameter_name:xml_string_max_len256 ->
  ?tags:tag_list ->
  ?idc_instance_arn:arn_type ->
  ?trusted_identity_propagation_enabled:boolean_object ->
  ?idc_user_assignment:idc_user_assignment ->
  ?encryption_key_arn:xml_string ->
  unit ->
  studio

val make_describe_studio_output : ?studio:studio -> unit -> describe_studio_output
val make_describe_studio_input : studio_id:xml_string_max_len256 -> unit -> describe_studio_input

val make_ebs_block_device :
  ?volume_specification:volume_specification -> ?device:string_ -> unit -> ebs_block_device

val make_ebs_volume : ?device:string_ -> ?volume_id:string_ -> unit -> ebs_volume

val make_update_studio_session_mapping_input :
  ?identity_id:xml_string_max_len256 ->
  ?identity_name:xml_string_max_len256 ->
  studio_id:xml_string_max_len256 ->
  identity_type:identity_type ->
  session_policy_arn:xml_string_max_len256 ->
  unit ->
  update_studio_session_mapping_input

val make_update_studio_input :
  ?name:xml_string_max_len256 ->
  ?description:xml_string_max_len256 ->
  ?subnet_ids:subnet_id_list ->
  ?default_s3_location:xml_string ->
  ?encryption_key_arn:xml_string ->
  studio_id:xml_string_max_len256 ->
  unit ->
  update_studio_input

val make_terminate_session_output :
  cluster_id:cluster_id ->
  session_id:session_id ->
  state:session_state ->
  unit ->
  terminate_session_output

val make_terminate_session_input :
  cluster_id:cluster_id -> session_id:session_id -> unit -> terminate_session_input

val make_terminate_job_flows_input :
  job_flow_ids:xml_string_list -> unit -> terminate_job_flows_input

val make_stop_notebook_execution_input :
  notebook_execution_id:xml_string_max_len256 -> unit -> stop_notebook_execution_input

val make_start_session_output :
  ?cluster_id:cluster_id ->
  ?arn:arn_type ->
  ?account_id:xml_string_max_len256 ->
  ?state:session_state ->
  id:session_id ->
  unit ->
  start_session_output

val make_session_s3_logging_configuration :
  ?enabled:boolean_ ->
  ?log_uri:xml_string ->
  ?encryption_key_arn:xml_string ->
  ?log_types:log_types_map ->
  unit ->
  session_s3_logging_configuration

val make_session_managed_logging_configuration :
  ?enabled:boolean_ ->
  ?encryption_key_arn:xml_string ->
  unit ->
  session_managed_logging_configuration

val make_session_cloud_watch_logging_configuration :
  ?enabled:boolean_ ->
  ?log_group:xml_string ->
  ?log_stream_name_prefix:xml_string ->
  ?encryption_key_arn:xml_string ->
  ?log_types:log_types_map ->
  unit ->
  session_cloud_watch_logging_configuration

val make_session_monitoring_configuration :
  ?cloud_watch_logging_configuration:session_cloud_watch_logging_configuration ->
  ?managed_logging_configuration:session_managed_logging_configuration ->
  ?s3_logging_configuration:session_s3_logging_configuration ->
  unit ->
  session_monitoring_configuration

val make_start_session_input :
  ?name:xml_string_max_len256 ->
  ?execution_role_arn:iam_role_arn ->
  ?engine_configurations:configuration_list ->
  ?monitoring_configuration:session_monitoring_configuration ->
  ?session_idle_timeout_in_minutes:long ->
  ?client_request_token:client_request_token ->
  ?tags:tag_list ->
  cluster_id:cluster_id ->
  unit ->
  start_session_input

val make_start_notebook_execution_output :
  ?notebook_execution_id:xml_string_max_len256 -> unit -> start_notebook_execution_output

val make_output_notebook_s3_location_from_input :
  ?bucket:xml_string_max_len256 -> ?key:uri_string -> unit -> output_notebook_s3_location_from_input

val make_notebook_s3_location_from_input :
  ?bucket:xml_string_max_len256 -> ?key:uri_string -> unit -> notebook_s3_location_from_input

val make_start_notebook_execution_input :
  ?editor_id:xml_string_max_len256 ->
  ?relative_path:xml_string ->
  ?notebook_execution_name:xml_string_max_len256 ->
  ?notebook_params:xml_string ->
  ?notebook_instance_security_group_id:xml_string_max_len256 ->
  ?tags:tag_list ->
  ?notebook_s3_location:notebook_s3_location_from_input ->
  ?output_notebook_s3_location:output_notebook_s3_location_from_input ->
  ?output_notebook_format:output_notebook_format ->
  ?environment_variables:environment_variables_map ->
  execution_engine:execution_engine_config ->
  service_role:xml_string ->
  unit ->
  start_notebook_execution_input

val make_set_visible_to_all_users_input :
  job_flow_ids:xml_string_list ->
  visible_to_all_users:boolean_ ->
  unit ->
  set_visible_to_all_users_input

val make_set_unhealthy_node_replacement_input :
  job_flow_ids:xml_string_list ->
  unhealthy_node_replacement:boolean_object ->
  unit ->
  set_unhealthy_node_replacement_input

val make_set_termination_protection_input :
  job_flow_ids:xml_string_list ->
  termination_protected:boolean_ ->
  unit ->
  set_termination_protection_input

val make_set_keep_job_flow_alive_when_no_steps_input :
  job_flow_ids:xml_string_list ->
  keep_job_flow_alive_when_no_steps:boolean_ ->
  unit ->
  set_keep_job_flow_alive_when_no_steps_input

val make_run_job_flow_output :
  ?job_flow_id:xml_string_max_len256 -> ?cluster_arn:arn_type -> unit -> run_job_flow_output

val make_managed_scaling_policy :
  ?compute_limits:compute_limits ->
  ?utilization_performance_index:utilization_performance_index_integer ->
  ?scaling_strategy:scaling_strategy ->
  unit ->
  managed_scaling_policy

val make_supported_product_config :
  ?name:xml_string_max_len256 -> ?args:xml_string_list -> unit -> supported_product_config

val make_job_flow_instances_config :
  ?master_instance_type:instance_type ->
  ?slave_instance_type:instance_type ->
  ?instance_count:integer ->
  ?instance_groups:instance_group_config_list ->
  ?instance_fleets:instance_fleet_config_list ->
  ?ec2_key_name:xml_string_max_len256 ->
  ?placement:placement_type ->
  ?keep_job_flow_alive_when_no_steps:boolean_ ->
  ?termination_protected:boolean_ ->
  ?unhealthy_node_replacement:boolean_object ->
  ?hadoop_version:xml_string_max_len256 ->
  ?ec2_subnet_id:xml_string_max_len256 ->
  ?ec2_subnet_ids:xml_string_max_len256_list ->
  ?emr_managed_master_security_group:xml_string_max_len256 ->
  ?emr_managed_slave_security_group:xml_string_max_len256 ->
  ?service_access_security_group:xml_string_max_len256 ->
  ?additional_master_security_groups:security_groups_list ->
  ?additional_slave_security_groups:security_groups_list ->
  unit ->
  job_flow_instances_config

val make_run_job_flow_input :
  ?log_uri:xml_string ->
  ?log_encryption_kms_key_id:xml_string ->
  ?additional_info:xml_string ->
  ?ami_version:xml_string_max_len256 ->
  ?release_label:xml_string_max_len256 ->
  ?steps:step_config_list ->
  ?step_execution_role_arn:arn_type ->
  ?bootstrap_actions:bootstrap_action_config_list ->
  ?supported_products:supported_products_list ->
  ?new_supported_products:new_supported_products_list ->
  ?applications:application_list ->
  ?configurations:configuration_list ->
  ?visible_to_all_users:boolean_ ->
  ?job_flow_role:xml_string ->
  ?service_role:xml_string ->
  ?tags:tag_list ->
  ?security_configuration:xml_string ->
  ?auto_scaling_role:xml_string ->
  ?scale_down_behavior:scale_down_behavior ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?ebs_root_volume_size:integer ->
  ?repo_upgrade_on_boot:repo_upgrade_on_boot ->
  ?kerberos_attributes:kerberos_attributes ->
  ?step_concurrency_level:integer ->
  ?managed_scaling_policy:managed_scaling_policy ->
  ?placement_group_configs:placement_group_config_list ->
  ?auto_termination_policy:auto_termination_policy ->
  ?os_release_label:xml_string_max_len256 ->
  ?ebs_root_volume_iops:integer ->
  ?ebs_root_volume_throughput:integer ->
  ?extended_support:boolean_object ->
  ?monitoring_configuration:monitoring_configuration ->
  ?session_enabled:boolean_object ->
  name:xml_string_max_len256 ->
  instances:job_flow_instances_config ->
  unit ->
  run_job_flow_input

val make_remove_tags_output : unit -> unit

val make_remove_tags_input :
  ?cluster_id:cluster_id ->
  resource_id:resource_id ->
  tag_keys:string_list ->
  unit ->
  remove_tags_input

val make_remove_managed_scaling_policy_output : unit -> unit

val make_remove_managed_scaling_policy_input :
  cluster_id:cluster_id -> unit -> remove_managed_scaling_policy_input

val make_remove_auto_termination_policy_output : unit -> unit

val make_remove_auto_termination_policy_input :
  cluster_id:cluster_id -> unit -> remove_auto_termination_policy_input

val make_remove_auto_scaling_policy_output : unit -> unit

val make_remove_auto_scaling_policy_input :
  cluster_id:cluster_id ->
  instance_group_id:instance_group_id ->
  unit ->
  remove_auto_scaling_policy_input

val make_put_managed_scaling_policy_output : unit -> unit

val make_put_managed_scaling_policy_input :
  cluster_id:cluster_id ->
  managed_scaling_policy:managed_scaling_policy ->
  unit ->
  put_managed_scaling_policy_input

val make_put_block_public_access_configuration_output : unit -> unit

val make_put_block_public_access_configuration_input :
  block_public_access_configuration:block_public_access_configuration ->
  unit ->
  put_block_public_access_configuration_input

val make_put_auto_termination_policy_output : unit -> unit

val make_put_auto_termination_policy_input :
  ?auto_termination_policy:auto_termination_policy ->
  cluster_id:cluster_id ->
  unit ->
  put_auto_termination_policy_input

val make_put_auto_scaling_policy_output :
  ?cluster_id:cluster_id ->
  ?instance_group_id:instance_group_id ->
  ?auto_scaling_policy:auto_scaling_policy_description ->
  ?cluster_arn:arn_type ->
  unit ->
  put_auto_scaling_policy_output

val make_put_auto_scaling_policy_input :
  cluster_id:cluster_id ->
  instance_group_id:instance_group_id ->
  auto_scaling_policy:auto_scaling_policy ->
  unit ->
  put_auto_scaling_policy_input

val make_instance_resize_policy :
  ?instances_to_terminate:ec2_instance_ids_list ->
  ?instances_to_protect:ec2_instance_ids_list ->
  ?instance_termination_timeout:integer ->
  unit ->
  instance_resize_policy

val make_shrink_policy :
  ?decommission_timeout:integer ->
  ?instance_resize_policy:instance_resize_policy ->
  unit ->
  shrink_policy

val make_instance_group_modify_config :
  ?instance_count:integer ->
  ?ec2_instance_ids_to_terminate:ec2_instance_ids_to_terminate_list ->
  ?shrink_policy:shrink_policy ->
  ?reconfiguration_type:reconfiguration_type ->
  ?configurations:configuration_list ->
  instance_group_id:xml_string_max_len256 ->
  unit ->
  instance_group_modify_config

val make_modify_instance_groups_input :
  ?cluster_id:cluster_id ->
  ?instance_groups:instance_group_modify_config_list ->
  unit ->
  modify_instance_groups_input

val make_instance_fleet_modify_config :
  ?target_on_demand_capacity:whole_number ->
  ?target_spot_capacity:whole_number ->
  ?resize_specifications:instance_fleet_resizing_specifications ->
  ?instance_type_configs:instance_type_config_list ->
  ?context:xml_string_max_len256 ->
  instance_fleet_id:instance_fleet_id ->
  unit ->
  instance_fleet_modify_config

val make_modify_instance_fleet_input :
  cluster_id:cluster_id ->
  instance_fleet:instance_fleet_modify_config ->
  unit ->
  modify_instance_fleet_input

val make_modify_cluster_output :
  ?step_concurrency_level:integer ->
  ?extended_support:boolean_object ->
  unit ->
  modify_cluster_output

val make_modify_cluster_input :
  ?step_concurrency_level:integer ->
  ?extended_support:boolean_object ->
  cluster_id:string_ ->
  unit ->
  modify_cluster_input

val make_supported_instance_type :
  ?type_:string_ ->
  ?memory_g_b:float_ ->
  ?storage_g_b:integer ->
  ?vcp_u:integer ->
  ?is64_bits_only:boolean_ ->
  ?instance_family_id:string_ ->
  ?ebs_optimized_available:boolean_ ->
  ?ebs_optimized_by_default:boolean_ ->
  ?number_of_disks:integer ->
  ?ebs_storage_only:boolean_ ->
  ?architecture:string_ ->
  unit ->
  supported_instance_type

val make_list_supported_instance_types_output :
  ?supported_instance_types:supported_instance_types_list ->
  ?marker:string_ ->
  unit ->
  list_supported_instance_types_output

val make_list_supported_instance_types_input :
  ?marker:string_ -> release_label:string_ -> unit -> list_supported_instance_types_input

val make_session_mapping_summary :
  ?studio_id:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  ?identity_name:xml_string_max_len256 ->
  ?identity_type:identity_type ->
  ?session_policy_arn:xml_string_max_len256 ->
  ?creation_time:date ->
  unit ->
  session_mapping_summary

val make_list_studio_session_mappings_output :
  ?session_mappings:session_mapping_summary_list ->
  ?marker:marker ->
  unit ->
  list_studio_session_mappings_output

val make_list_studio_session_mappings_input :
  ?studio_id:xml_string_max_len256 ->
  ?identity_type:identity_type ->
  ?marker:marker ->
  unit ->
  list_studio_session_mappings_input

val make_studio_summary :
  ?studio_id:xml_string_max_len256 ->
  ?name:xml_string_max_len256 ->
  ?vpc_id:xml_string_max_len256 ->
  ?description:xml_string_max_len256 ->
  ?url:xml_string_max_len256 ->
  ?auth_mode:auth_mode ->
  ?creation_time:date ->
  unit ->
  studio_summary

val make_list_studios_output :
  ?studios:studio_summary_list -> ?marker:marker -> unit -> list_studios_output

val make_list_studios_input : ?marker:marker -> unit -> list_studios_input

val make_step_summary :
  ?id:step_id ->
  ?name:string_ ->
  ?config:hadoop_step_config ->
  ?action_on_failure:action_on_failure ->
  ?status:step_status ->
  ?log_uri:string_ ->
  ?encryption_key_arn:string_ ->
  unit ->
  step_summary

val make_list_steps_output : ?steps:step_summary_list -> ?marker:marker -> unit -> list_steps_output

val make_list_steps_input :
  ?step_states:step_state_list ->
  ?step_ids:xml_string_list ->
  ?marker:marker ->
  cluster_id:cluster_id ->
  unit ->
  list_steps_input

val make_session :
  ?name:xml_string_max_len256 ->
  ?state_change_reason:xml_string ->
  ?release_label:xml_string_max_len256 ->
  ?execution_role_arn:iam_role_arn ->
  ?account_id:xml_string_max_len256 ->
  ?created_at:date ->
  ?updated_at:date ->
  ?started_at:date ->
  ?ended_at:date ->
  ?idle_since:date ->
  ?engine_configurations:configuration_list ->
  ?monitoring_configuration:session_monitoring_configuration ->
  ?session_idle_timeout_in_minutes:long ->
  ?certificate_authority:certificate_authority ->
  ?server_url:xml_string ->
  ?tags:tag_list ->
  id:session_id ->
  cluster_id:cluster_id ->
  arn:arn_type ->
  state:session_state ->
  unit ->
  session

val make_list_sessions_output :
  ?sessions:session_list -> ?next_token:string_ -> unit -> list_sessions_output

val make_list_sessions_input :
  ?session_states:session_state_list ->
  ?next_token:string_ ->
  ?max_results:max_results_number ->
  cluster_id:cluster_id ->
  unit ->
  list_sessions_input

val make_security_configuration_summary :
  ?name:xml_string -> ?creation_date_time:date -> unit -> security_configuration_summary

val make_list_security_configurations_output :
  ?security_configurations:security_configuration_list ->
  ?marker:marker ->
  unit ->
  list_security_configurations_output

val make_list_security_configurations_input :
  ?marker:marker -> unit -> list_security_configurations_input

val make_list_release_labels_output :
  ?release_labels:string_list -> ?next_token:string_ -> unit -> list_release_labels_output

val make_release_label_filter :
  ?prefix:string_ -> ?application:string_ -> unit -> release_label_filter

val make_list_release_labels_input :
  ?filters:release_label_filter ->
  ?next_token:string_ ->
  ?max_results:max_results_number ->
  unit ->
  list_release_labels_input

val make_notebook_execution_summary :
  ?notebook_execution_id:xml_string_max_len256 ->
  ?editor_id:xml_string_max_len256 ->
  ?notebook_execution_name:xml_string_max_len256 ->
  ?status:notebook_execution_status ->
  ?start_time:date ->
  ?end_time:date ->
  ?notebook_s3_location:notebook_s3_location_for_output ->
  ?execution_engine_id:xml_string ->
  unit ->
  notebook_execution_summary

val make_list_notebook_executions_output :
  ?notebook_executions:notebook_execution_summary_list ->
  ?marker:marker ->
  unit ->
  list_notebook_executions_output

val make_list_notebook_executions_input :
  ?editor_id:xml_string_max_len256 ->
  ?status:notebook_execution_status ->
  ?from_:date ->
  ?to_:date ->
  ?marker:marker ->
  ?execution_engine_id:xml_string ->
  unit ->
  list_notebook_executions_input

val make_instance_timeline :
  ?creation_date_time:date ->
  ?ready_date_time:date ->
  ?end_date_time:date ->
  unit ->
  instance_timeline

val make_instance_state_change_reason :
  ?code:instance_state_change_reason_code ->
  ?message:string_ ->
  unit ->
  instance_state_change_reason

val make_instance_status :
  ?state:instance_state ->
  ?state_change_reason:instance_state_change_reason ->
  ?timeline:instance_timeline ->
  unit ->
  instance_status

val make_instance :
  ?id:instance_id ->
  ?ec2_instance_id:instance_id ->
  ?public_dns_name:string_ ->
  ?public_ip_address:string_ ->
  ?private_dns_name:string_ ->
  ?private_ip_address:string_ ->
  ?status:instance_status ->
  ?instance_group_id:string_ ->
  ?instance_fleet_id:instance_fleet_id ->
  ?market:market_type ->
  ?instance_type:instance_type ->
  ?ebs_volumes:ebs_volume_list ->
  unit ->
  instance

val make_list_instances_output :
  ?instances:instance_list -> ?marker:marker -> unit -> list_instances_output

val make_list_instances_input :
  ?instance_group_id:instance_group_id ->
  ?instance_group_types:instance_group_type_list ->
  ?instance_fleet_id:instance_fleet_id ->
  ?instance_fleet_type:instance_fleet_type ->
  ?instance_states:instance_state_list ->
  ?marker:marker ->
  cluster_id:cluster_id ->
  unit ->
  list_instances_input

val make_instance_group_timeline :
  ?creation_date_time:date ->
  ?ready_date_time:date ->
  ?end_date_time:date ->
  unit ->
  instance_group_timeline

val make_instance_group_state_change_reason :
  ?code:instance_group_state_change_reason_code ->
  ?message:string_ ->
  unit ->
  instance_group_state_change_reason

val make_instance_group_status :
  ?state:instance_group_state ->
  ?state_change_reason:instance_group_state_change_reason ->
  ?timeline:instance_group_timeline ->
  unit ->
  instance_group_status

val make_instance_group :
  ?id:instance_group_id ->
  ?name:string_ ->
  ?market:market_type ->
  ?instance_group_type:instance_group_type ->
  ?bid_price:string_ ->
  ?instance_type:instance_type ->
  ?requested_instance_count:integer ->
  ?running_instance_count:integer ->
  ?status:instance_group_status ->
  ?configurations:configuration_list ->
  ?configurations_version:long ->
  ?last_successfully_applied_configurations:configuration_list ->
  ?last_successfully_applied_configurations_version:long ->
  ?ebs_block_devices:ebs_block_device_list ->
  ?ebs_optimized:boolean_object ->
  ?shrink_policy:shrink_policy ->
  ?auto_scaling_policy:auto_scaling_policy_description ->
  ?custom_ami_id:xml_string_max_len256 ->
  unit ->
  instance_group

val make_list_instance_groups_output :
  ?instance_groups:instance_group_list -> ?marker:marker -> unit -> list_instance_groups_output

val make_list_instance_groups_input :
  ?marker:marker -> cluster_id:cluster_id -> unit -> list_instance_groups_input

val make_instance_type_specification :
  ?instance_type:instance_type ->
  ?weighted_capacity:whole_number ->
  ?bid_price:xml_string_max_len256 ->
  ?bid_price_as_percentage_of_on_demand_price:non_negative_double ->
  ?configurations:configuration_list ->
  ?ebs_block_devices:ebs_block_device_list ->
  ?ebs_optimized:boolean_object ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?priority:non_negative_double ->
  unit ->
  instance_type_specification

val make_instance_fleet_timeline :
  ?creation_date_time:date ->
  ?ready_date_time:date ->
  ?end_date_time:date ->
  unit ->
  instance_fleet_timeline

val make_instance_fleet_state_change_reason :
  ?code:instance_fleet_state_change_reason_code ->
  ?message:string_ ->
  unit ->
  instance_fleet_state_change_reason

val make_instance_fleet_status :
  ?state:instance_fleet_state ->
  ?state_change_reason:instance_fleet_state_change_reason ->
  ?timeline:instance_fleet_timeline ->
  unit ->
  instance_fleet_status

val make_instance_fleet :
  ?id:instance_fleet_id ->
  ?name:xml_string_max_len256 ->
  ?status:instance_fleet_status ->
  ?instance_fleet_type:instance_fleet_type ->
  ?target_on_demand_capacity:whole_number ->
  ?target_spot_capacity:whole_number ->
  ?provisioned_on_demand_capacity:whole_number ->
  ?provisioned_spot_capacity:whole_number ->
  ?instance_type_specifications:instance_type_specification_list ->
  ?launch_specifications:instance_fleet_provisioning_specifications ->
  ?resize_specifications:instance_fleet_resizing_specifications ->
  ?context:xml_string_max_len256 ->
  unit ->
  instance_fleet

val make_list_instance_fleets_output :
  ?instance_fleets:instance_fleet_list -> ?marker:marker -> unit -> list_instance_fleets_output

val make_list_instance_fleets_input :
  ?marker:marker -> cluster_id:cluster_id -> unit -> list_instance_fleets_input

val make_list_clusters_output :
  ?clusters:cluster_summary_list -> ?marker:marker -> unit -> list_clusters_output

val make_list_clusters_input :
  ?created_after:date ->
  ?created_before:date ->
  ?cluster_states:cluster_state_list ->
  ?marker:marker ->
  unit ->
  list_clusters_input

val make_list_bootstrap_actions_output :
  ?bootstrap_actions:command_list -> ?marker:marker -> unit -> list_bootstrap_actions_output

val make_list_bootstrap_actions_input :
  ?marker:marker -> cluster_id:cluster_id -> unit -> list_bootstrap_actions_input

val make_session_mapping_detail :
  ?studio_id:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  ?identity_name:xml_string_max_len256 ->
  ?identity_type:identity_type ->
  ?session_policy_arn:xml_string_max_len256 ->
  ?creation_time:date ->
  ?last_modified_time:date ->
  unit ->
  session_mapping_detail

val make_get_studio_session_mapping_output :
  ?session_mapping:session_mapping_detail -> unit -> get_studio_session_mapping_output

val make_get_studio_session_mapping_input :
  ?identity_id:xml_string_max_len256 ->
  ?identity_name:xml_string_max_len256 ->
  studio_id:xml_string_max_len256 ->
  identity_type:identity_type ->
  unit ->
  get_studio_session_mapping_input

val make_get_session_endpoint_output :
  ?auth_token:sensitive_string ->
  ?auth_token_expiration_time:date ->
  ?credentials:credentials ->
  endpoint:xml_string ->
  unit ->
  get_session_endpoint_output

val make_get_session_endpoint_input :
  cluster_id:cluster_id -> session_id:session_id -> unit -> get_session_endpoint_input

val make_get_session_output : session:session -> unit -> get_session_output

val make_get_session_input :
  cluster_id:cluster_id -> session_id:session_id -> unit -> get_session_input

val make_get_persistent_app_ui_presigned_url_output :
  ?presigned_url_ready:boolean_ ->
  ?presigned_ur_l:xml_string ->
  unit ->
  get_persistent_app_ui_presigned_url_output

val make_get_persistent_app_ui_presigned_url_input :
  ?persistent_app_ui_type:persistent_app_ui_type ->
  ?application_id:xml_string_max_len256 ->
  ?auth_proxy_call:boolean_object ->
  ?execution_role_arn:arn_type ->
  persistent_app_ui_id:xml_string_max_len256 ->
  unit ->
  get_persistent_app_ui_presigned_url_input

val make_get_on_cluster_app_ui_presigned_url_output :
  ?presigned_url_ready:boolean_ ->
  ?presigned_ur_l:xml_string ->
  unit ->
  get_on_cluster_app_ui_presigned_url_output

val make_get_on_cluster_app_ui_presigned_url_input :
  ?on_cluster_app_ui_type:on_cluster_app_ui_type ->
  ?application_id:xml_string_max_len256 ->
  ?dry_run:boolean_object ->
  ?execution_role_arn:arn_type ->
  cluster_id:xml_string_max_len256 ->
  unit ->
  get_on_cluster_app_ui_presigned_url_input

val make_get_managed_scaling_policy_output :
  ?managed_scaling_policy:managed_scaling_policy -> unit -> get_managed_scaling_policy_output

val make_get_managed_scaling_policy_input :
  cluster_id:cluster_id -> unit -> get_managed_scaling_policy_input

val make_get_cluster_session_credentials_output :
  ?credentials:credentials -> ?expires_at:date -> unit -> get_cluster_session_credentials_output

val make_get_cluster_session_credentials_input :
  ?execution_role_arn:arn_type ->
  cluster_id:xml_string_max_len256 ->
  unit ->
  get_cluster_session_credentials_input

val make_get_block_public_access_configuration_output :
  block_public_access_configuration:block_public_access_configuration ->
  block_public_access_configuration_metadata:block_public_access_configuration_metadata ->
  unit ->
  get_block_public_access_configuration_output

val make_get_block_public_access_configuration_input : unit -> unit

val make_get_auto_termination_policy_output :
  ?auto_termination_policy:auto_termination_policy -> unit -> get_auto_termination_policy_output

val make_get_auto_termination_policy_input :
  cluster_id:cluster_id -> unit -> get_auto_termination_policy_input
