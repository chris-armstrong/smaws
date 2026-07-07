(** EMR client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_volume_specification :
  ?throughput:throughput_val ->
  ?iops:integer ->
  size_in_g_b:integer ->
  volume_type:string_ ->
  unit ->
  volume_specification

val make_username_password :
  ?password:xml_string_max_len256 -> ?username:xml_string_max_len256 -> unit -> username_password

val make_update_studio_session_mapping_input :
  ?identity_name:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  session_policy_arn:xml_string_max_len256 ->
  identity_type:identity_type ->
  studio_id:xml_string_max_len256 ->
  unit ->
  update_studio_session_mapping_input

val make_update_studio_input :
  ?encryption_key_arn:xml_string ->
  ?default_s3_location:xml_string ->
  ?subnet_ids:subnet_id_list ->
  ?description:xml_string_max_len256 ->
  ?name:xml_string_max_len256 ->
  studio_id:xml_string_max_len256 ->
  unit ->
  update_studio_input

val make_terminate_session_output :
  state:session_state ->
  session_id:session_id ->
  cluster_id:cluster_id ->
  unit ->
  terminate_session_output

val make_terminate_session_input :
  session_id:session_id -> cluster_id:cluster_id -> unit -> terminate_session_input

val make_terminate_job_flows_input :
  job_flow_ids:xml_string_list -> unit -> terminate_job_flows_input

val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag

val make_supported_product_config :
  ?args:xml_string_list -> ?name:xml_string_max_len256 -> unit -> supported_product_config

val make_supported_instance_type :
  ?architecture:string_ ->
  ?ebs_storage_only:boolean_ ->
  ?number_of_disks:integer ->
  ?ebs_optimized_by_default:boolean_ ->
  ?ebs_optimized_available:boolean_ ->
  ?instance_family_id:string_ ->
  ?is64_bits_only:boolean_ ->
  ?vcp_u:integer ->
  ?storage_g_b:integer ->
  ?memory_g_b:float_ ->
  ?type_:string_ ->
  unit ->
  supported_instance_type

val make_studio_summary :
  ?creation_time:date ->
  ?auth_mode:auth_mode ->
  ?url:xml_string_max_len256 ->
  ?description:xml_string_max_len256 ->
  ?vpc_id:xml_string_max_len256 ->
  ?name:xml_string_max_len256 ->
  ?studio_id:xml_string_max_len256 ->
  unit ->
  studio_summary

val make_studio :
  ?encryption_key_arn:xml_string ->
  ?idc_user_assignment:idc_user_assignment ->
  ?trusted_identity_propagation_enabled:boolean_object ->
  ?idc_instance_arn:arn_type ->
  ?tags:tag_list ->
  ?idp_relay_state_parameter_name:xml_string_max_len256 ->
  ?idp_auth_url:xml_string ->
  ?default_s3_location:xml_string ->
  ?creation_time:date ->
  ?url:xml_string ->
  ?engine_security_group_id:xml_string_max_len256 ->
  ?workspace_security_group_id:xml_string_max_len256 ->
  ?user_role:xml_string ->
  ?service_role:xml_string ->
  ?subnet_ids:subnet_id_list ->
  ?vpc_id:xml_string_max_len256 ->
  ?auth_mode:auth_mode ->
  ?description:xml_string_max_len256 ->
  ?name:xml_string_max_len256 ->
  ?studio_arn:xml_string_max_len256 ->
  ?studio_id:xml_string_max_len256 ->
  unit ->
  studio

val make_stop_notebook_execution_input :
  notebook_execution_id:xml_string_max_len256 -> unit -> stop_notebook_execution_input

val make_step_timeline :
  ?end_date_time:date -> ?start_date_time:date -> ?creation_date_time:date -> unit -> step_timeline

val make_hadoop_step_config :
  ?args:string_list ->
  ?main_class:string_ ->
  ?properties:string_map ->
  ?jar:string_ ->
  unit ->
  hadoop_step_config

val make_step_state_change_reason :
  ?message:string_ -> ?code:step_state_change_reason_code -> unit -> step_state_change_reason

val make_failure_details :
  ?log_file:string_ -> ?message:string_ -> ?reason:string_ -> unit -> failure_details

val make_step_status :
  ?timeline:step_timeline ->
  ?failure_details:failure_details ->
  ?state_change_reason:step_state_change_reason ->
  ?state:step_state ->
  unit ->
  step_status

val make_step_summary :
  ?encryption_key_arn:string_ ->
  ?log_uri:string_ ->
  ?status:step_status ->
  ?action_on_failure:action_on_failure ->
  ?config:hadoop_step_config ->
  ?name:string_ ->
  ?id:step_id ->
  unit ->
  step_summary

val make_s3_monitoring_configuration :
  ?encryption_key_arn:xml_string -> ?log_uri:xml_string -> unit -> s3_monitoring_configuration

val make_step_monitoring_configuration :
  ?s3_monitoring_configuration:s3_monitoring_configuration -> unit -> step_monitoring_configuration

val make_step_execution_status_detail :
  ?last_state_change_reason:xml_string ->
  ?end_date_time:date ->
  ?start_date_time:date ->
  creation_date_time:date ->
  state:step_execution_state ->
  unit ->
  step_execution_status_detail

val make_key_value : ?value:xml_string -> ?key:xml_string -> unit -> key_value

val make_hadoop_jar_step_config :
  ?args:xml_string_list ->
  ?main_class:xml_string ->
  ?properties:key_value_list ->
  jar:xml_string ->
  unit ->
  hadoop_jar_step_config

val make_step_config :
  ?step_monitoring_configuration:step_monitoring_configuration ->
  ?action_on_failure:action_on_failure ->
  hadoop_jar_step:hadoop_jar_step_config ->
  name:xml_string_max_len256 ->
  unit ->
  step_config

val make_step_detail :
  execution_status_detail:step_execution_status_detail ->
  step_config:step_config ->
  unit ->
  step_detail

val make_step :
  ?encryption_key_arn:string_ ->
  ?log_uri:string_ ->
  ?execution_role_arn:optional_arn_type ->
  ?status:step_status ->
  ?action_on_failure:action_on_failure ->
  ?config:hadoop_step_config ->
  ?name:string_ ->
  ?id:step_id ->
  unit ->
  step

val make_start_session_output :
  ?state:session_state ->
  ?account_id:xml_string_max_len256 ->
  ?arn:arn_type ->
  ?cluster_id:cluster_id ->
  id:session_id ->
  unit ->
  start_session_output

val make_configuration :
  ?properties:string_map ->
  ?configurations:configuration_list ->
  ?classification:string_ ->
  unit ->
  configuration

val make_session_cloud_watch_logging_configuration :
  ?log_types:log_types_map ->
  ?encryption_key_arn:xml_string ->
  ?log_stream_name_prefix:xml_string ->
  ?log_group:xml_string ->
  ?enabled:boolean_ ->
  unit ->
  session_cloud_watch_logging_configuration

val make_session_managed_logging_configuration :
  ?encryption_key_arn:xml_string ->
  ?enabled:boolean_ ->
  unit ->
  session_managed_logging_configuration

val make_session_s3_logging_configuration :
  ?log_types:log_types_map ->
  ?encryption_key_arn:xml_string ->
  ?log_uri:xml_string ->
  ?enabled:boolean_ ->
  unit ->
  session_s3_logging_configuration

val make_session_monitoring_configuration :
  ?s3_logging_configuration:session_s3_logging_configuration ->
  ?managed_logging_configuration:session_managed_logging_configuration ->
  ?cloud_watch_logging_configuration:session_cloud_watch_logging_configuration ->
  unit ->
  session_monitoring_configuration

val make_start_session_input :
  ?tags:tag_list ->
  ?client_request_token:client_request_token ->
  ?session_idle_timeout_in_minutes:long ->
  ?monitoring_configuration:session_monitoring_configuration ->
  ?engine_configurations:configuration_list ->
  ?execution_role_arn:iam_role_arn ->
  ?name:xml_string_max_len256 ->
  cluster_id:cluster_id ->
  unit ->
  start_session_input

val make_start_notebook_execution_output :
  ?notebook_execution_id:xml_string_max_len256 -> unit -> start_notebook_execution_output

val make_execution_engine_config :
  ?execution_role_arn:iam_role_arn ->
  ?master_instance_security_group_id:xml_string_max_len256 ->
  ?type_:execution_engine_type ->
  id:xml_string_max_len256 ->
  unit ->
  execution_engine_config

val make_notebook_s3_location_from_input :
  ?key:uri_string -> ?bucket:xml_string_max_len256 -> unit -> notebook_s3_location_from_input

val make_output_notebook_s3_location_from_input :
  ?key:uri_string -> ?bucket:xml_string_max_len256 -> unit -> output_notebook_s3_location_from_input

val make_start_notebook_execution_input :
  ?environment_variables:environment_variables_map ->
  ?output_notebook_format:output_notebook_format ->
  ?output_notebook_s3_location:output_notebook_s3_location_from_input ->
  ?notebook_s3_location:notebook_s3_location_from_input ->
  ?tags:tag_list ->
  ?notebook_instance_security_group_id:xml_string_max_len256 ->
  ?notebook_params:xml_string ->
  ?notebook_execution_name:xml_string_max_len256 ->
  ?relative_path:xml_string ->
  ?editor_id:xml_string_max_len256 ->
  service_role:xml_string ->
  execution_engine:execution_engine_config ->
  unit ->
  start_notebook_execution_input

val make_spot_resizing_specification :
  ?allocation_strategy:spot_provisioning_allocation_strategy ->
  ?timeout_duration_minutes:whole_number ->
  unit ->
  spot_resizing_specification

val make_spot_provisioning_specification :
  ?allocation_strategy:spot_provisioning_allocation_strategy ->
  ?block_duration_minutes:whole_number ->
  timeout_action:spot_provisioning_timeout_action ->
  timeout_duration_minutes:whole_number ->
  unit ->
  spot_provisioning_specification

val make_simplified_application :
  ?version:string_ -> ?name:string_ -> unit -> simplified_application

val make_simple_scaling_policy_configuration :
  ?cool_down:integer ->
  ?adjustment_type:adjustment_type ->
  scaling_adjustment:integer ->
  unit ->
  simple_scaling_policy_configuration

val make_instance_resize_policy :
  ?instance_termination_timeout:integer ->
  ?instances_to_protect:ec2_instance_ids_list ->
  ?instances_to_terminate:ec2_instance_ids_list ->
  unit ->
  instance_resize_policy

val make_shrink_policy :
  ?instance_resize_policy:instance_resize_policy ->
  ?decommission_timeout:integer ->
  unit ->
  shrink_policy

val make_set_visible_to_all_users_input :
  visible_to_all_users:boolean_ ->
  job_flow_ids:xml_string_list ->
  unit ->
  set_visible_to_all_users_input

val make_set_unhealthy_node_replacement_input :
  unhealthy_node_replacement:boolean_object ->
  job_flow_ids:xml_string_list ->
  unit ->
  set_unhealthy_node_replacement_input

val make_set_termination_protection_input :
  termination_protected:boolean_ ->
  job_flow_ids:xml_string_list ->
  unit ->
  set_termination_protection_input

val make_set_keep_job_flow_alive_when_no_steps_input :
  keep_job_flow_alive_when_no_steps:boolean_ ->
  job_flow_ids:xml_string_list ->
  unit ->
  set_keep_job_flow_alive_when_no_steps_input

val make_session_mapping_summary :
  ?creation_time:date ->
  ?session_policy_arn:xml_string_max_len256 ->
  ?identity_type:identity_type ->
  ?identity_name:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  ?studio_id:xml_string_max_len256 ->
  unit ->
  session_mapping_summary

val make_session_mapping_detail :
  ?last_modified_time:date ->
  ?creation_time:date ->
  ?session_policy_arn:xml_string_max_len256 ->
  ?identity_type:identity_type ->
  ?identity_name:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  ?studio_id:xml_string_max_len256 ->
  unit ->
  session_mapping_detail

val make_certificate_authority :
  ?certificate_data:xml_string -> ?certificate_arn:xml_string -> unit -> certificate_authority

val make_session :
  ?tags:tag_list ->
  ?server_url:xml_string ->
  ?certificate_authority:certificate_authority ->
  ?session_idle_timeout_in_minutes:long ->
  ?monitoring_configuration:session_monitoring_configuration ->
  ?engine_configurations:configuration_list ->
  ?idle_since:date ->
  ?ended_at:date ->
  ?started_at:date ->
  ?updated_at:date ->
  ?created_at:date ->
  ?account_id:xml_string_max_len256 ->
  ?execution_role_arn:iam_role_arn ->
  ?release_label:xml_string_max_len256 ->
  ?state_change_reason:xml_string ->
  ?name:xml_string_max_len256 ->
  state:session_state ->
  arn:arn_type ->
  cluster_id:cluster_id ->
  id:session_id ->
  unit ->
  session

val make_security_configuration_summary :
  ?creation_date_time:date -> ?name:xml_string -> unit -> security_configuration_summary

val make_script_bootstrap_action_config :
  ?args:xml_string_list -> path:xml_string -> unit -> script_bootstrap_action_config

val make_metric_dimension : ?value:string_ -> ?key:string_ -> unit -> metric_dimension

val make_cloud_watch_alarm_definition :
  ?dimensions:metric_dimension_list ->
  ?unit_:unit_ ->
  ?statistic:statistic ->
  ?namespace:string_ ->
  ?evaluation_periods:integer ->
  threshold:non_negative_double ->
  period:integer ->
  metric_name:string_ ->
  comparison_operator:comparison_operator ->
  unit ->
  cloud_watch_alarm_definition

val make_scaling_trigger :
  cloud_watch_alarm_definition:cloud_watch_alarm_definition -> unit -> scaling_trigger

val make_scaling_action :
  ?market:market_type ->
  simple_scaling_policy_configuration:simple_scaling_policy_configuration ->
  unit ->
  scaling_action

val make_scaling_rule :
  ?description:string_ ->
  trigger:scaling_trigger ->
  action:scaling_action ->
  name:string_ ->
  unit ->
  scaling_rule

val make_scaling_constraints :
  max_capacity:integer -> min_capacity:integer -> unit -> scaling_constraints

val make_s3_logging_configuration :
  ?log_type_upload_policy:log_type_map -> unit -> s3_logging_configuration

val make_run_job_flow_output :
  ?cluster_arn:arn_type -> ?job_flow_id:xml_string_max_len256 -> unit -> run_job_flow_output

val make_ebs_block_device_config :
  ?volumes_per_instance:integer ->
  volume_specification:volume_specification ->
  unit ->
  ebs_block_device_config

val make_ebs_configuration :
  ?ebs_optimized:boolean_object ->
  ?ebs_block_device_configs:ebs_block_device_config_list ->
  unit ->
  ebs_configuration

val make_auto_scaling_policy :
  rules:scaling_rule_list -> constraints:scaling_constraints -> unit -> auto_scaling_policy

val make_instance_group_config :
  ?custom_ami_id:xml_string_max_len256 ->
  ?auto_scaling_policy:auto_scaling_policy ->
  ?ebs_configuration:ebs_configuration ->
  ?configurations:configuration_list ->
  ?bid_price:xml_string_max_len256 ->
  ?market:market_type ->
  ?name:xml_string_max_len256 ->
  instance_count:integer ->
  instance_type:instance_type ->
  instance_role:instance_role_type ->
  unit ->
  instance_group_config

val make_instance_type_config :
  ?priority:non_negative_double ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?configurations:configuration_list ->
  ?ebs_configuration:ebs_configuration ->
  ?bid_price_as_percentage_of_on_demand_price:non_negative_double ->
  ?bid_price:xml_string_max_len256 ->
  ?weighted_capacity:whole_number ->
  instance_type:instance_type ->
  unit ->
  instance_type_config

val make_on_demand_capacity_reservation_options :
  ?capacity_reservation_resource_group_arn:xml_string_max_len256 ->
  ?capacity_reservation_preference:on_demand_capacity_reservation_preference ->
  ?usage_strategy:on_demand_capacity_reservation_usage_strategy ->
  unit ->
  on_demand_capacity_reservation_options

val make_on_demand_provisioning_specification :
  ?capacity_reservation_options:on_demand_capacity_reservation_options ->
  allocation_strategy:on_demand_provisioning_allocation_strategy ->
  unit ->
  on_demand_provisioning_specification

val make_instance_fleet_provisioning_specifications :
  ?on_demand_specification:on_demand_provisioning_specification ->
  ?spot_specification:spot_provisioning_specification ->
  unit ->
  instance_fleet_provisioning_specifications

val make_on_demand_resizing_specification :
  ?capacity_reservation_options:on_demand_capacity_reservation_options ->
  ?allocation_strategy:on_demand_provisioning_allocation_strategy ->
  ?timeout_duration_minutes:whole_number ->
  unit ->
  on_demand_resizing_specification

val make_instance_fleet_resizing_specifications :
  ?on_demand_resize_specification:on_demand_resizing_specification ->
  ?spot_resize_specification:spot_resizing_specification ->
  unit ->
  instance_fleet_resizing_specifications

val make_instance_fleet_config :
  ?context:xml_string_max_len256 ->
  ?resize_specifications:instance_fleet_resizing_specifications ->
  ?launch_specifications:instance_fleet_provisioning_specifications ->
  ?instance_type_configs:instance_type_config_list ->
  ?target_spot_capacity:whole_number ->
  ?target_on_demand_capacity:whole_number ->
  ?name:xml_string_max_len256 ->
  instance_fleet_type:instance_fleet_type ->
  unit ->
  instance_fleet_config

val make_placement_type :
  ?availability_zones:xml_string_max_len256_list ->
  ?availability_zone:xml_string ->
  unit ->
  placement_type

val make_job_flow_instances_config :
  ?additional_slave_security_groups:security_groups_list ->
  ?additional_master_security_groups:security_groups_list ->
  ?service_access_security_group:xml_string_max_len256 ->
  ?emr_managed_slave_security_group:xml_string_max_len256 ->
  ?emr_managed_master_security_group:xml_string_max_len256 ->
  ?ec2_subnet_ids:xml_string_max_len256_list ->
  ?ec2_subnet_id:xml_string_max_len256 ->
  ?hadoop_version:xml_string_max_len256 ->
  ?unhealthy_node_replacement:boolean_object ->
  ?termination_protected:boolean_ ->
  ?keep_job_flow_alive_when_no_steps:boolean_ ->
  ?placement:placement_type ->
  ?ec2_key_name:xml_string_max_len256 ->
  ?instance_fleets:instance_fleet_config_list ->
  ?instance_groups:instance_group_config_list ->
  ?instance_count:integer ->
  ?slave_instance_type:instance_type ->
  ?master_instance_type:instance_type ->
  unit ->
  job_flow_instances_config

val make_bootstrap_action_config :
  script_bootstrap_action:script_bootstrap_action_config ->
  name:xml_string_max_len256 ->
  unit ->
  bootstrap_action_config

val make_application :
  ?additional_info:string_map ->
  ?args:string_list ->
  ?version:string_ ->
  ?name:string_ ->
  unit ->
  application

val make_kerberos_attributes :
  ?ad_domain_join_password:xml_string_max_len256 ->
  ?ad_domain_join_user:xml_string_max_len256 ->
  ?cross_realm_trust_principal_password:xml_string_max_len256 ->
  kdc_admin_password:xml_string_max_len256 ->
  realm:xml_string_max_len256 ->
  unit ->
  kerberos_attributes

val make_compute_limits :
  ?maximum_core_capacity_units:integer ->
  ?maximum_on_demand_capacity_units:integer ->
  maximum_capacity_units:integer ->
  minimum_capacity_units:integer ->
  unit_type:compute_limits_unit_type ->
  unit ->
  compute_limits

val make_managed_scaling_policy :
  ?scaling_strategy:scaling_strategy ->
  ?utilization_performance_index:utilization_performance_index_integer ->
  ?compute_limits:compute_limits ->
  unit ->
  managed_scaling_policy

val make_placement_group_config :
  ?placement_strategy:placement_group_strategy ->
  instance_role:instance_role_type ->
  unit ->
  placement_group_config

val make_auto_termination_policy : ?idle_timeout:long -> unit -> auto_termination_policy

val make_cloud_watch_log_configuration :
  ?log_types:log_types_map ->
  ?encryption_key_arn:xml_string ->
  ?log_stream_name_prefix:xml_string ->
  ?log_group_name:xml_string ->
  enabled:boolean_ ->
  unit ->
  cloud_watch_log_configuration

val make_monitoring_configuration :
  ?s3_logging_configuration:s3_logging_configuration ->
  ?cloud_watch_log_configuration:cloud_watch_log_configuration ->
  unit ->
  monitoring_configuration

val make_run_job_flow_input :
  ?session_enabled:boolean_object ->
  ?monitoring_configuration:monitoring_configuration ->
  ?extended_support:boolean_object ->
  ?ebs_root_volume_throughput:integer ->
  ?ebs_root_volume_iops:integer ->
  ?os_release_label:xml_string_max_len256 ->
  ?auto_termination_policy:auto_termination_policy ->
  ?placement_group_configs:placement_group_config_list ->
  ?managed_scaling_policy:managed_scaling_policy ->
  ?step_concurrency_level:integer ->
  ?kerberos_attributes:kerberos_attributes ->
  ?repo_upgrade_on_boot:repo_upgrade_on_boot ->
  ?ebs_root_volume_size:integer ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?scale_down_behavior:scale_down_behavior ->
  ?auto_scaling_role:xml_string ->
  ?security_configuration:xml_string ->
  ?tags:tag_list ->
  ?service_role:xml_string ->
  ?job_flow_role:xml_string ->
  ?visible_to_all_users:boolean_ ->
  ?configurations:configuration_list ->
  ?applications:application_list ->
  ?new_supported_products:new_supported_products_list ->
  ?supported_products:supported_products_list ->
  ?bootstrap_actions:bootstrap_action_config_list ->
  ?step_execution_role_arn:arn_type ->
  ?steps:step_config_list ->
  ?release_label:xml_string_max_len256 ->
  ?ami_version:xml_string_max_len256 ->
  ?additional_info:xml_string ->
  ?log_encryption_kms_key_id:xml_string ->
  ?log_uri:xml_string ->
  instances:job_flow_instances_config ->
  name:xml_string_max_len256 ->
  unit ->
  run_job_flow_input

val make_remove_tags_output : unit -> unit

val make_remove_tags_input :
  ?cluster_id:cluster_id ->
  tag_keys:string_list ->
  resource_id:resource_id ->
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
  instance_group_id:instance_group_id ->
  cluster_id:cluster_id ->
  unit ->
  remove_auto_scaling_policy_input

val make_release_label_filter :
  ?application:string_ -> ?prefix:string_ -> unit -> release_label_filter

val make_put_managed_scaling_policy_output : unit -> unit

val make_put_managed_scaling_policy_input :
  managed_scaling_policy:managed_scaling_policy ->
  cluster_id:cluster_id ->
  unit ->
  put_managed_scaling_policy_input

val make_put_block_public_access_configuration_output : unit -> unit
val make_port_range : ?max_range:port -> min_range:port -> unit -> port_range

val make_block_public_access_configuration :
  ?properties:string_map ->
  ?configurations:configuration_list ->
  ?classification:string_ ->
  ?permitted_public_security_group_rule_ranges:port_ranges ->
  block_public_security_group_rules:boolean_ ->
  unit ->
  block_public_access_configuration

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

val make_auto_scaling_policy_state_change_reason :
  ?message:string_ ->
  ?code:auto_scaling_policy_state_change_reason_code ->
  unit ->
  auto_scaling_policy_state_change_reason

val make_auto_scaling_policy_status :
  ?state_change_reason:auto_scaling_policy_state_change_reason ->
  ?state:auto_scaling_policy_state ->
  unit ->
  auto_scaling_policy_status

val make_auto_scaling_policy_description :
  ?rules:scaling_rule_list ->
  ?constraints:scaling_constraints ->
  ?status:auto_scaling_policy_status ->
  unit ->
  auto_scaling_policy_description

val make_put_auto_scaling_policy_output :
  ?cluster_arn:arn_type ->
  ?auto_scaling_policy:auto_scaling_policy_description ->
  ?instance_group_id:instance_group_id ->
  ?cluster_id:cluster_id ->
  unit ->
  put_auto_scaling_policy_output

val make_put_auto_scaling_policy_input :
  auto_scaling_policy:auto_scaling_policy ->
  instance_group_id:instance_group_id ->
  cluster_id:cluster_id ->
  unit ->
  put_auto_scaling_policy_input

val make_persistent_app_u_i :
  ?tags:tag_list ->
  ?last_state_change_reason:xml_string ->
  ?last_modified_time:date ->
  ?creation_time:date ->
  ?author_id:xml_string_max_len256 ->
  ?persistent_app_ui_status:xml_string_max_len256 ->
  ?persistent_app_ui_type_list:persistent_app_ui_type_list ->
  ?persistent_app_ui_id:xml_string_max_len256 ->
  unit ->
  persistent_app_u_i

val make_output_notebook_s3_location_for_output :
  ?key:uri_string -> ?bucket:xml_string_max_len256 -> unit -> output_notebook_s3_location_for_output

val make_os_release : ?label:string_ -> unit -> os_release

val make_notebook_s3_location_for_output :
  ?key:uri_string -> ?bucket:xml_string_max_len256 -> unit -> notebook_s3_location_for_output

val make_notebook_execution_summary :
  ?execution_engine_id:xml_string ->
  ?notebook_s3_location:notebook_s3_location_for_output ->
  ?end_time:date ->
  ?start_time:date ->
  ?status:notebook_execution_status ->
  ?notebook_execution_name:xml_string_max_len256 ->
  ?editor_id:xml_string_max_len256 ->
  ?notebook_execution_id:xml_string_max_len256 ->
  unit ->
  notebook_execution_summary

val make_notebook_execution :
  ?environment_variables:environment_variables_map ->
  ?output_notebook_format:output_notebook_format ->
  ?output_notebook_s3_location:output_notebook_s3_location_for_output ->
  ?notebook_s3_location:notebook_s3_location_for_output ->
  ?tags:tag_list ->
  ?notebook_instance_security_group_id:xml_string_max_len256 ->
  ?last_state_change_reason:xml_string ->
  ?output_notebook_ur_i:xml_string ->
  ?arn:xml_string_max_len256 ->
  ?end_time:date ->
  ?start_time:date ->
  ?status:notebook_execution_status ->
  ?notebook_params:xml_string ->
  ?notebook_execution_name:xml_string_max_len256 ->
  ?execution_engine:execution_engine_config ->
  ?editor_id:xml_string_max_len256 ->
  ?notebook_execution_id:xml_string_max_len256 ->
  unit ->
  notebook_execution

val make_instance_group_modify_config :
  ?configurations:configuration_list ->
  ?reconfiguration_type:reconfiguration_type ->
  ?shrink_policy:shrink_policy ->
  ?ec2_instance_ids_to_terminate:ec2_instance_ids_to_terminate_list ->
  ?instance_count:integer ->
  instance_group_id:xml_string_max_len256 ->
  unit ->
  instance_group_modify_config

val make_modify_instance_groups_input :
  ?instance_groups:instance_group_modify_config_list ->
  ?cluster_id:cluster_id ->
  unit ->
  modify_instance_groups_input

val make_instance_fleet_modify_config :
  ?context:xml_string_max_len256 ->
  ?instance_type_configs:instance_type_config_list ->
  ?resize_specifications:instance_fleet_resizing_specifications ->
  ?target_spot_capacity:whole_number ->
  ?target_on_demand_capacity:whole_number ->
  instance_fleet_id:instance_fleet_id ->
  unit ->
  instance_fleet_modify_config

val make_modify_instance_fleet_input :
  instance_fleet:instance_fleet_modify_config ->
  cluster_id:cluster_id ->
  unit ->
  modify_instance_fleet_input

val make_modify_cluster_output :
  ?extended_support:boolean_object ->
  ?step_concurrency_level:integer ->
  unit ->
  modify_cluster_output

val make_modify_cluster_input :
  ?extended_support:boolean_object ->
  ?step_concurrency_level:integer ->
  cluster_id:string_ ->
  unit ->
  modify_cluster_input

val make_list_supported_instance_types_output :
  ?marker:string_ ->
  ?supported_instance_types:supported_instance_types_list ->
  unit ->
  list_supported_instance_types_output

val make_list_supported_instance_types_input :
  ?marker:string_ -> release_label:string_ -> unit -> list_supported_instance_types_input

val make_list_studios_output :
  ?marker:marker -> ?studios:studio_summary_list -> unit -> list_studios_output

val make_list_studios_input : ?marker:marker -> unit -> list_studios_input

val make_list_studio_session_mappings_output :
  ?marker:marker ->
  ?session_mappings:session_mapping_summary_list ->
  unit ->
  list_studio_session_mappings_output

val make_list_studio_session_mappings_input :
  ?marker:marker ->
  ?identity_type:identity_type ->
  ?studio_id:xml_string_max_len256 ->
  unit ->
  list_studio_session_mappings_input

val make_list_steps_output : ?marker:marker -> ?steps:step_summary_list -> unit -> list_steps_output

val make_list_steps_input :
  ?marker:marker ->
  ?step_ids:xml_string_list ->
  ?step_states:step_state_list ->
  cluster_id:cluster_id ->
  unit ->
  list_steps_input

val make_list_sessions_output :
  ?next_token:string_ -> ?sessions:session_list -> unit -> list_sessions_output

val make_list_sessions_input :
  ?max_results:max_results_number ->
  ?next_token:string_ ->
  ?session_states:session_state_list ->
  cluster_id:cluster_id ->
  unit ->
  list_sessions_input

val make_list_security_configurations_output :
  ?marker:marker ->
  ?security_configurations:security_configuration_list ->
  unit ->
  list_security_configurations_output

val make_list_security_configurations_input :
  ?marker:marker -> unit -> list_security_configurations_input

val make_list_release_labels_output :
  ?next_token:string_ -> ?release_labels:string_list -> unit -> list_release_labels_output

val make_list_release_labels_input :
  ?max_results:max_results_number ->
  ?next_token:string_ ->
  ?filters:release_label_filter ->
  unit ->
  list_release_labels_input

val make_list_notebook_executions_output :
  ?marker:marker ->
  ?notebook_executions:notebook_execution_summary_list ->
  unit ->
  list_notebook_executions_output

val make_list_notebook_executions_input :
  ?execution_engine_id:xml_string ->
  ?marker:marker ->
  ?to_:date ->
  ?from_:date ->
  ?status:notebook_execution_status ->
  ?editor_id:xml_string_max_len256 ->
  unit ->
  list_notebook_executions_input

val make_instance_state_change_reason :
  ?message:string_ ->
  ?code:instance_state_change_reason_code ->
  unit ->
  instance_state_change_reason

val make_instance_timeline :
  ?end_date_time:date ->
  ?ready_date_time:date ->
  ?creation_date_time:date ->
  unit ->
  instance_timeline

val make_instance_status :
  ?timeline:instance_timeline ->
  ?state_change_reason:instance_state_change_reason ->
  ?state:instance_state ->
  unit ->
  instance_status

val make_ebs_volume : ?volume_id:string_ -> ?device:string_ -> unit -> ebs_volume

val make_instance :
  ?ebs_volumes:ebs_volume_list ->
  ?instance_type:instance_type ->
  ?market:market_type ->
  ?instance_fleet_id:instance_fleet_id ->
  ?instance_group_id:string_ ->
  ?status:instance_status ->
  ?private_ip_address:string_ ->
  ?private_dns_name:string_ ->
  ?public_ip_address:string_ ->
  ?public_dns_name:string_ ->
  ?ec2_instance_id:instance_id ->
  ?id:instance_id ->
  unit ->
  instance

val make_list_instances_output :
  ?marker:marker -> ?instances:instance_list -> unit -> list_instances_output

val make_list_instances_input :
  ?marker:marker ->
  ?instance_states:instance_state_list ->
  ?instance_fleet_type:instance_fleet_type ->
  ?instance_fleet_id:instance_fleet_id ->
  ?instance_group_types:instance_group_type_list ->
  ?instance_group_id:instance_group_id ->
  cluster_id:cluster_id ->
  unit ->
  list_instances_input

val make_instance_group_state_change_reason :
  ?message:string_ ->
  ?code:instance_group_state_change_reason_code ->
  unit ->
  instance_group_state_change_reason

val make_instance_group_timeline :
  ?end_date_time:date ->
  ?ready_date_time:date ->
  ?creation_date_time:date ->
  unit ->
  instance_group_timeline

val make_instance_group_status :
  ?timeline:instance_group_timeline ->
  ?state_change_reason:instance_group_state_change_reason ->
  ?state:instance_group_state ->
  unit ->
  instance_group_status

val make_ebs_block_device :
  ?device:string_ -> ?volume_specification:volume_specification -> unit -> ebs_block_device

val make_instance_group :
  ?custom_ami_id:xml_string_max_len256 ->
  ?auto_scaling_policy:auto_scaling_policy_description ->
  ?shrink_policy:shrink_policy ->
  ?ebs_optimized:boolean_object ->
  ?ebs_block_devices:ebs_block_device_list ->
  ?last_successfully_applied_configurations_version:long ->
  ?last_successfully_applied_configurations:configuration_list ->
  ?configurations_version:long ->
  ?configurations:configuration_list ->
  ?status:instance_group_status ->
  ?running_instance_count:integer ->
  ?requested_instance_count:integer ->
  ?instance_type:instance_type ->
  ?bid_price:string_ ->
  ?instance_group_type:instance_group_type ->
  ?market:market_type ->
  ?name:string_ ->
  ?id:instance_group_id ->
  unit ->
  instance_group

val make_list_instance_groups_output :
  ?marker:marker -> ?instance_groups:instance_group_list -> unit -> list_instance_groups_output

val make_list_instance_groups_input :
  ?marker:marker -> cluster_id:cluster_id -> unit -> list_instance_groups_input

val make_instance_fleet_state_change_reason :
  ?message:string_ ->
  ?code:instance_fleet_state_change_reason_code ->
  unit ->
  instance_fleet_state_change_reason

val make_instance_fleet_timeline :
  ?end_date_time:date ->
  ?ready_date_time:date ->
  ?creation_date_time:date ->
  unit ->
  instance_fleet_timeline

val make_instance_fleet_status :
  ?timeline:instance_fleet_timeline ->
  ?state_change_reason:instance_fleet_state_change_reason ->
  ?state:instance_fleet_state ->
  unit ->
  instance_fleet_status

val make_instance_type_specification :
  ?priority:non_negative_double ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?ebs_optimized:boolean_object ->
  ?ebs_block_devices:ebs_block_device_list ->
  ?configurations:configuration_list ->
  ?bid_price_as_percentage_of_on_demand_price:non_negative_double ->
  ?bid_price:xml_string_max_len256 ->
  ?weighted_capacity:whole_number ->
  ?instance_type:instance_type ->
  unit ->
  instance_type_specification

val make_instance_fleet :
  ?context:xml_string_max_len256 ->
  ?resize_specifications:instance_fleet_resizing_specifications ->
  ?launch_specifications:instance_fleet_provisioning_specifications ->
  ?instance_type_specifications:instance_type_specification_list ->
  ?provisioned_spot_capacity:whole_number ->
  ?provisioned_on_demand_capacity:whole_number ->
  ?target_spot_capacity:whole_number ->
  ?target_on_demand_capacity:whole_number ->
  ?instance_fleet_type:instance_fleet_type ->
  ?status:instance_fleet_status ->
  ?name:xml_string_max_len256 ->
  ?id:instance_fleet_id ->
  unit ->
  instance_fleet

val make_list_instance_fleets_output :
  ?marker:marker -> ?instance_fleets:instance_fleet_list -> unit -> list_instance_fleets_output

val make_list_instance_fleets_input :
  ?marker:marker -> cluster_id:cluster_id -> unit -> list_instance_fleets_input

val make_cluster_state_change_reason :
  ?message:string_ -> ?code:cluster_state_change_reason_code -> unit -> cluster_state_change_reason

val make_cluster_timeline :
  ?end_date_time:date ->
  ?ready_date_time:date ->
  ?creation_date_time:date ->
  unit ->
  cluster_timeline

val make_error_detail :
  ?error_message:string_ -> ?error_data:error_data -> ?error_code:string_ -> unit -> error_detail

val make_cluster_status :
  ?error_details:error_detail_list ->
  ?timeline:cluster_timeline ->
  ?state_change_reason:cluster_state_change_reason ->
  ?state:cluster_state ->
  unit ->
  cluster_status

val make_cluster_summary :
  ?outpost_arn:optional_arn_type ->
  ?cluster_arn:arn_type ->
  ?normalized_instance_hours:integer ->
  ?status:cluster_status ->
  ?name:string_ ->
  ?id:cluster_id ->
  unit ->
  cluster_summary

val make_list_clusters_output :
  ?marker:marker -> ?clusters:cluster_summary_list -> unit -> list_clusters_output

val make_list_clusters_input :
  ?marker:marker ->
  ?cluster_states:cluster_state_list ->
  ?created_before:date ->
  ?created_after:date ->
  unit ->
  list_clusters_input

val make_command : ?args:string_list -> ?script_path:string_ -> ?name:string_ -> unit -> command

val make_list_bootstrap_actions_output :
  ?marker:marker -> ?bootstrap_actions:command_list -> unit -> list_bootstrap_actions_output

val make_list_bootstrap_actions_input :
  ?marker:marker -> cluster_id:cluster_id -> unit -> list_bootstrap_actions_input

val make_instance_group_detail :
  ?custom_ami_id:xml_string_max_len256 ->
  ?end_date_time:date ->
  ?ready_date_time:date ->
  ?start_date_time:date ->
  ?last_state_change_reason:xml_string ->
  ?bid_price:xml_string_max_len256 ->
  ?name:xml_string_max_len256 ->
  ?instance_group_id:xml_string_max_len256 ->
  creation_date_time:date ->
  state:instance_group_state ->
  instance_running_count:integer ->
  instance_request_count:integer ->
  instance_type:instance_type ->
  instance_role:instance_role_type ->
  market:market_type ->
  unit ->
  instance_group_detail

val make_job_flow_instances_detail :
  ?hadoop_version:xml_string_max_len256 ->
  ?unhealthy_node_replacement:boolean_object ->
  ?termination_protected:boolean_ ->
  ?keep_job_flow_alive_when_no_steps:boolean_ ->
  ?placement:placement_type ->
  ?ec2_subnet_id:xml_string_max_len256 ->
  ?ec2_key_name:xml_string_max_len256 ->
  ?normalized_instance_hours:integer ->
  ?instance_groups:instance_group_detail_list ->
  ?master_instance_id:xml_string ->
  ?master_public_dns_name:xml_string ->
  instance_count:integer ->
  slave_instance_type:instance_type ->
  master_instance_type:instance_type ->
  unit ->
  job_flow_instances_detail

val make_job_flow_execution_status_detail :
  ?last_state_change_reason:xml_string ->
  ?end_date_time:date ->
  ?ready_date_time:date ->
  ?start_date_time:date ->
  creation_date_time:date ->
  state:job_flow_execution_state ->
  unit ->
  job_flow_execution_status_detail

val make_bootstrap_action_detail :
  ?bootstrap_action_config:bootstrap_action_config -> unit -> bootstrap_action_detail

val make_job_flow_detail :
  ?scale_down_behavior:scale_down_behavior ->
  ?auto_scaling_role:xml_string ->
  ?service_role:xml_string ->
  ?job_flow_role:xml_string ->
  ?visible_to_all_users:boolean_ ->
  ?supported_products:supported_products_list ->
  ?bootstrap_actions:bootstrap_action_detail_list ->
  ?steps:step_detail_list ->
  ?ami_version:xml_string_max_len256 ->
  ?log_encryption_kms_key_id:xml_string ->
  ?log_uri:xml_string ->
  instances:job_flow_instances_detail ->
  execution_status_detail:job_flow_execution_status_detail ->
  name:xml_string_max_len256 ->
  job_flow_id:xml_string_max_len256 ->
  unit ->
  job_flow_detail

val make_get_studio_session_mapping_output :
  ?session_mapping:session_mapping_detail -> unit -> get_studio_session_mapping_output

val make_get_studio_session_mapping_input :
  ?identity_name:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  identity_type:identity_type ->
  studio_id:xml_string_max_len256 ->
  unit ->
  get_studio_session_mapping_input

val make_get_session_output : session:session -> unit -> get_session_output

val make_get_session_input :
  session_id:session_id -> cluster_id:cluster_id -> unit -> get_session_input

val make_get_session_endpoint_output :
  ?credentials:credentials ->
  ?auth_token_expiration_time:date ->
  ?auth_token:sensitive_string ->
  endpoint:xml_string ->
  unit ->
  get_session_endpoint_output

val make_get_session_endpoint_input :
  session_id:session_id -> cluster_id:cluster_id -> unit -> get_session_endpoint_input

val make_get_persistent_app_ui_presigned_url_output :
  ?presigned_ur_l:xml_string ->
  ?presigned_url_ready:boolean_ ->
  unit ->
  get_persistent_app_ui_presigned_url_output

val make_get_persistent_app_ui_presigned_url_input :
  ?execution_role_arn:arn_type ->
  ?auth_proxy_call:boolean_object ->
  ?application_id:xml_string_max_len256 ->
  ?persistent_app_ui_type:persistent_app_ui_type ->
  persistent_app_ui_id:xml_string_max_len256 ->
  unit ->
  get_persistent_app_ui_presigned_url_input

val make_get_on_cluster_app_ui_presigned_url_output :
  ?presigned_ur_l:xml_string ->
  ?presigned_url_ready:boolean_ ->
  unit ->
  get_on_cluster_app_ui_presigned_url_output

val make_get_on_cluster_app_ui_presigned_url_input :
  ?execution_role_arn:arn_type ->
  ?dry_run:boolean_object ->
  ?application_id:xml_string_max_len256 ->
  ?on_cluster_app_ui_type:on_cluster_app_ui_type ->
  cluster_id:xml_string_max_len256 ->
  unit ->
  get_on_cluster_app_ui_presigned_url_input

val make_get_managed_scaling_policy_output :
  ?managed_scaling_policy:managed_scaling_policy -> unit -> get_managed_scaling_policy_output

val make_get_managed_scaling_policy_input :
  cluster_id:cluster_id -> unit -> get_managed_scaling_policy_input

val make_get_cluster_session_credentials_output :
  ?expires_at:date -> ?credentials:credentials -> unit -> get_cluster_session_credentials_output

val make_get_cluster_session_credentials_input :
  ?execution_role_arn:arn_type ->
  cluster_id:xml_string_max_len256 ->
  unit ->
  get_cluster_session_credentials_input

val make_block_public_access_configuration_metadata :
  created_by_arn:arn_type ->
  creation_date_time:date ->
  unit ->
  block_public_access_configuration_metadata

val make_get_block_public_access_configuration_output :
  block_public_access_configuration_metadata:block_public_access_configuration_metadata ->
  block_public_access_configuration:block_public_access_configuration ->
  unit ->
  get_block_public_access_configuration_output

val make_get_block_public_access_configuration_input : unit -> unit

val make_get_auto_termination_policy_output :
  ?auto_termination_policy:auto_termination_policy -> unit -> get_auto_termination_policy_output

val make_get_auto_termination_policy_input :
  cluster_id:cluster_id -> unit -> get_auto_termination_policy_input

val make_describe_studio_output : ?studio:studio -> unit -> describe_studio_output
val make_describe_studio_input : studio_id:xml_string_max_len256 -> unit -> describe_studio_input
val make_describe_step_output : ?step:step -> unit -> describe_step_output

val make_describe_step_input :
  step_id:step_id -> cluster_id:cluster_id -> unit -> describe_step_input

val make_describe_security_configuration_output :
  ?creation_date_time:date ->
  ?security_configuration:string_ ->
  ?name:xml_string ->
  unit ->
  describe_security_configuration_output

val make_describe_security_configuration_input :
  name:xml_string -> unit -> describe_security_configuration_input

val make_describe_release_label_output :
  ?available_os_releases:os_release_list ->
  ?next_token:string_ ->
  ?applications:simplified_application_list ->
  ?release_label:string_ ->
  unit ->
  describe_release_label_output

val make_describe_release_label_input :
  ?max_results:max_results_number ->
  ?next_token:string_ ->
  ?release_label:string_ ->
  unit ->
  describe_release_label_input

val make_describe_persistent_app_ui_output :
  ?persistent_app_u_i:persistent_app_u_i -> unit -> describe_persistent_app_ui_output

val make_describe_persistent_app_ui_input :
  persistent_app_ui_id:xml_string_max_len256 -> unit -> describe_persistent_app_ui_input

val make_describe_notebook_execution_output :
  ?notebook_execution:notebook_execution -> unit -> describe_notebook_execution_output

val make_describe_notebook_execution_input :
  notebook_execution_id:xml_string_max_len256 -> unit -> describe_notebook_execution_input

val make_describe_job_flows_output :
  ?job_flows:job_flow_detail_list -> unit -> describe_job_flows_output

val make_describe_job_flows_input :
  ?job_flow_states:job_flow_execution_state_list ->
  ?job_flow_ids:xml_string_list ->
  ?created_before:date ->
  ?created_after:date ->
  unit ->
  describe_job_flows_input

val make_ec2_instance_attributes :
  ?additional_slave_security_groups:string_list ->
  ?additional_master_security_groups:string_list ->
  ?service_access_security_group:string_ ->
  ?emr_managed_slave_security_group:string_ ->
  ?emr_managed_master_security_group:string_ ->
  ?iam_instance_profile:string_ ->
  ?requested_ec2_availability_zones:xml_string_max_len256_list ->
  ?ec2_availability_zone:string_ ->
  ?requested_ec2_subnet_ids:xml_string_max_len256_list ->
  ?ec2_subnet_id:string_ ->
  ?ec2_key_name:string_ ->
  unit ->
  ec2_instance_attributes

val make_cluster :
  ?session_enabled:boolean_object ->
  ?monitoring_configuration:monitoring_configuration ->
  ?extended_support:boolean_object ->
  ?ebs_root_volume_throughput:integer ->
  ?ebs_root_volume_iops:integer ->
  ?os_release_label:string_ ->
  ?placement_groups:placement_group_config_list ->
  ?step_concurrency_level:integer ->
  ?outpost_arn:optional_arn_type ->
  ?cluster_arn:arn_type ->
  ?kerberos_attributes:kerberos_attributes ->
  ?repo_upgrade_on_boot:repo_upgrade_on_boot ->
  ?ebs_root_volume_size:integer ->
  ?custom_ami_id:xml_string_max_len256 ->
  ?scale_down_behavior:scale_down_behavior ->
  ?auto_scaling_role:xml_string ->
  ?security_configuration:xml_string ->
  ?configurations:configuration_list ->
  ?master_public_dns_name:string_ ->
  ?normalized_instance_hours:integer ->
  ?service_role:string_ ->
  ?tags:tag_list ->
  ?applications:application_list ->
  ?visible_to_all_users:boolean_ ->
  ?unhealthy_node_replacement:boolean_object ->
  ?termination_protected:boolean_ ->
  ?auto_terminate:boolean_ ->
  ?release_label:string_ ->
  ?running_ami_version:string_ ->
  ?requested_ami_version:string_ ->
  ?log_encryption_kms_key_id:string_ ->
  ?log_uri:string_ ->
  ?instance_collection_type:instance_collection_type ->
  ?ec2_instance_attributes:ec2_instance_attributes ->
  ?status:cluster_status ->
  ?name:string_ ->
  ?id:cluster_id ->
  unit ->
  cluster

val make_describe_cluster_output : ?cluster:cluster -> unit -> describe_cluster_output
val make_describe_cluster_input : cluster_id:cluster_id -> unit -> describe_cluster_input

val make_delete_studio_session_mapping_input :
  ?identity_name:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  identity_type:identity_type ->
  studio_id:xml_string_max_len256 ->
  unit ->
  delete_studio_session_mapping_input

val make_delete_studio_input : studio_id:xml_string_max_len256 -> unit -> delete_studio_input
val make_delete_security_configuration_output : unit -> unit

val make_delete_security_configuration_input :
  name:xml_string -> unit -> delete_security_configuration_input

val make_create_studio_session_mapping_input :
  ?identity_name:xml_string_max_len256 ->
  ?identity_id:xml_string_max_len256 ->
  session_policy_arn:xml_string_max_len256 ->
  identity_type:identity_type ->
  studio_id:xml_string_max_len256 ->
  unit ->
  create_studio_session_mapping_input

val make_create_studio_output :
  ?url:xml_string -> ?studio_id:xml_string_max_len256 -> unit -> create_studio_output

val make_create_studio_input :
  ?encryption_key_arn:xml_string ->
  ?idc_instance_arn:arn_type ->
  ?idc_user_assignment:idc_user_assignment ->
  ?trusted_identity_propagation_enabled:boolean_object ->
  ?tags:tag_list ->
  ?idp_relay_state_parameter_name:xml_string_max_len256 ->
  ?idp_auth_url:xml_string ->
  ?user_role:xml_string ->
  ?description:xml_string_max_len256 ->
  default_s3_location:xml_string ->
  engine_security_group_id:xml_string_max_len256 ->
  workspace_security_group_id:xml_string_max_len256 ->
  service_role:xml_string ->
  subnet_ids:subnet_id_list ->
  vpc_id:xml_string_max_len256 ->
  auth_mode:auth_mode ->
  name:xml_string_max_len256 ->
  unit ->
  create_studio_input

val make_create_security_configuration_output :
  creation_date_time:date -> name:xml_string -> unit -> create_security_configuration_output

val make_create_security_configuration_input :
  security_configuration:string_ -> name:xml_string -> unit -> create_security_configuration_input

val make_create_persistent_app_ui_output :
  ?runtime_role_enabled_cluster:boolean_ ->
  ?persistent_app_ui_id:xml_string_max_len256 ->
  unit ->
  create_persistent_app_ui_output

val make_emr_containers_config : ?job_run_id:xml_string_max_len256 -> unit -> emr_containers_config

val make_create_persistent_app_ui_input :
  ?profiler_type:profiler_type ->
  ?x_referer:string_ ->
  ?tags:tag_list ->
  ?emr_containers_config:emr_containers_config ->
  target_resource_arn:arn_type ->
  unit ->
  create_persistent_app_ui_input

val make_cancel_steps_info :
  ?reason:string_ ->
  ?status:cancel_steps_request_status ->
  ?step_id:step_id ->
  unit ->
  cancel_steps_info

val make_cancel_steps_output :
  ?cancel_steps_info_list:cancel_steps_info_list -> unit -> cancel_steps_output

val make_cancel_steps_input :
  ?step_cancellation_option:step_cancellation_option ->
  step_ids:step_ids_list ->
  cluster_id:xml_string_max_len256 ->
  unit ->
  cancel_steps_input

val make_add_tags_output : unit -> unit

val make_add_tags_input :
  ?cluster_id:cluster_id -> tags:tag_list -> resource_id:resource_id -> unit -> add_tags_input

val make_add_job_flow_steps_output : ?step_ids:step_ids_list -> unit -> add_job_flow_steps_output

val make_add_job_flow_steps_input :
  ?execution_role_arn:arn_type ->
  steps:step_config_list ->
  job_flow_id:xml_string_max_len256 ->
  unit ->
  add_job_flow_steps_input

val make_add_instance_groups_output :
  ?cluster_arn:arn_type ->
  ?instance_group_ids:instance_group_ids_list ->
  ?job_flow_id:xml_string_max_len256 ->
  unit ->
  add_instance_groups_output

val make_add_instance_groups_input :
  job_flow_id:xml_string_max_len256 ->
  instance_groups:instance_group_config_list ->
  unit ->
  add_instance_groups_input

val make_add_instance_fleet_output :
  ?cluster_arn:arn_type ->
  ?instance_fleet_id:instance_fleet_id ->
  ?cluster_id:xml_string_max_len256 ->
  unit ->
  add_instance_fleet_output

val make_add_instance_fleet_input :
  instance_fleet:instance_fleet_config ->
  cluster_id:xml_string_max_len256 ->
  unit ->
  add_instance_fleet_input
(** {1:operations Operations} *)

module AddInstanceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_instance_fleet_input ->
    ( add_instance_fleet_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_instance_fleet_input ->
    ( add_instance_fleet_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an instance fleet to a running cluster.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x.\n\
  \  \n\
  \   "]

module AddInstanceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_instance_groups_input ->
    ( add_instance_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_instance_groups_input ->
    ( add_instance_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds one or more instance groups to a running cluster.\n"]

module AddJobFlowSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_job_flow_steps_input ->
    ( add_job_flow_steps_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_job_flow_steps_input ->
    ( add_job_flow_steps_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "AddJobFlowSteps adds new steps to a running cluster. A maximum of 256 steps are allowed in each \
   job flow.\n\n\
  \ If your cluster is long-running (such as a Hive data warehouse) or complex, you may require \
   more than 256 steps to process your data. You can bypass the 256-step limitation in various \
   ways, including using SSH to connect to the master node and submitting queries directly to the \
   software running on the master node, such as Hive and Hadoop.\n\
  \ \n\
  \  A step specifies the location of a JAR file stored either on the master node of the cluster \
   or in Amazon S3. Each step is performed by the main function of the main class of the JAR file. \
   The main class can be specified either in the manifest of the JAR or by using the MainFunction \
   parameter of the step.\n\
  \  \n\
  \   Amazon EMR executes each step in the order listed. For a step to be considered complete, the \
   main function must exit with a zero exit code and all Hadoop jobs started while the step was \
   running must have completed and run successfully.\n\
  \   \n\
  \    You can only add steps to a cluster that is in one of the following states: STARTING, \
   BOOTSTRAPPING, RUNNING, or WAITING.\n\
  \    \n\
  \      The string values passed into [HadoopJarStep] object cannot exceed a total of 10240 \
   characters.\n\
  \      \n\
  \       "]

module AddTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to an Amazon EMR resource, such as a cluster or an Amazon EMR Studio. Tags make it \
   easier to associate resources in various ways, such as grouping clusters to track your Amazon \
   EMR resource allocation costs. For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html}Tag Clusters}. \n"]

module CancelSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_steps_input ->
    ( cancel_steps_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_steps_input ->
    ( cancel_steps_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a pending step or steps in a running cluster. Available only in Amazon EMR versions \
   4.8.0 and later, excluding version 5.0.0. A maximum of 256 steps are allowed in each \
   CancelSteps request. CancelSteps is idempotent but asynchronous; it does not guarantee that a \
   step will be canceled, even if the request is successfully submitted. When you use Amazon EMR \
   releases 5.28.0 and later, you can cancel steps that are in a [PENDING] or [RUNNING] state. In \
   earlier versions of Amazon EMR, you can only cancel steps that are in a [PENDING] state. \n"]

module CreatePersistentAppUI : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_persistent_app_ui_input ->
    ( create_persistent_app_ui_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_persistent_app_ui_input ->
    ( create_persistent_app_ui_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a persistent application user interface.\n"]

module CreateSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_input ->
    ( create_security_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_security_configuration_input ->
    ( create_security_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a security configuration, which is stored in the service and can be specified when a \
   cluster is created.\n"]

module CreateStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_studio_input ->
    ( create_studio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_studio_input ->
    ( create_studio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new Amazon EMR Studio.\n"]

module CreateStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Maps a user or group to the Amazon EMR Studio specified by [StudioId], and applies a session \
   policy to refine Studio permissions for that user or group. Use [CreateStudioSessionMapping] to \
   assign users to a Studio when you use IAM Identity Center authentication. For instructions on \
   how to assign users to a Studio when you use IAM authentication, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-studio-manage-users.html#emr-studio-assign-users-groups}Assign \
   a user or group to your EMR Studio}.\n"]

module DeleteSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_input ->
    ( delete_security_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_security_configuration_input ->
    ( delete_security_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a security configuration.\n"]

module DeleteStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes an Amazon EMR Studio from the Studio metadata store.\n"]

module DeleteStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a user or group from an Amazon EMR Studio.\n"]

module DescribeCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_input ->
    ( describe_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_cluster_input ->
    ( describe_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides cluster-level details including status, hardware and software configuration, VPC \
   settings, and so on.\n"]

module DescribeJobFlows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_job_flows_input ->
    ( describe_job_flows_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_job_flows_input ->
    ( describe_job_flows_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This API is no longer supported and will eventually be removed. We recommend you use \
   [ListClusters], [DescribeCluster], [ListSteps], [ListInstanceGroups] and [ListBootstrapActions] \
   instead.\n\n\
  \ DescribeJobFlows returns a list of job flows that match all of the supplied parameters. The \
   parameters can include a list of job flow IDs, job flow states, and restrictions on job flow \
   creation date and time.\n\
  \ \n\
  \  Regardless of supplied parameters, only job flows created within the last two months are \
   returned.\n\
  \  \n\
  \   If no parameters are supplied, then job flows matching either of the following criteria are \
   returned:\n\
  \   \n\
  \    {ul\n\
  \          {-  Job flows created and completed in the last two weeks\n\
  \              \n\
  \               }\n\
  \          {-   Job flows created within the last two months that are in one of the following \
   states: [RUNNING], [WAITING], [SHUTTING_DOWN], [STARTING] \n\
  \              \n\
  \               }\n\
  \          }\n\
  \   Amazon EMR can return a maximum of 512 job flow descriptions.\n\
  \   "]

module DescribeNotebookExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_execution_input ->
    ( describe_notebook_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notebook_execution_input ->
    ( describe_notebook_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides details of a notebook execution.\n"]

module DescribePersistentAppUI : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_persistent_app_ui_input ->
    ( describe_persistent_app_ui_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_persistent_app_ui_input ->
    ( describe_persistent_app_ui_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a persistent application user interface.\n"]

module DescribeReleaseLabel : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_release_label_input ->
    ( describe_release_label_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_release_label_input ->
    ( describe_release_label_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides Amazon EMR release label details, such as the releases available the Region where the \
   API request is run, and the available applications for a specific Amazon EMR release label. Can \
   also list Amazon EMR releases that support a specified version of Spark.\n"]

module DescribeSecurityConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_security_configuration_input ->
    ( describe_security_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_security_configuration_input ->
    ( describe_security_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the details of a security configuration by returning the configuration JSON.\n"]

module DescribeStep : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_step_input ->
    ( describe_step_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_step_input ->
    ( describe_step_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides more detail about the cluster step.\n"]

module DescribeStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_studio_input ->
    ( describe_studio_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_studio_input ->
    ( describe_studio_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details for the specified Amazon EMR Studio including ID, Name, VPC, Studio access URL, \
   and so on.\n"]

module GetAutoTerminationPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_auto_termination_policy_input ->
    (get_auto_termination_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_auto_termination_policy_input ->
    ( get_auto_termination_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the auto-termination policy for an Amazon EMR cluster.\n"]

module GetBlockPublicAccessConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_block_public_access_configuration_input ->
    ( get_block_public_access_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_block_public_access_configuration_input ->
    ( get_block_public_access_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Amazon EMR block public access configuration for your Amazon Web Services account \
   in the current Region. For more information see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html}Configure \
   Block Public Access for Amazon EMR} in the {i Amazon EMR Management Guide}.\n"]

module GetClusterSessionCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_session_credentials_input ->
    ( get_cluster_session_credentials_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cluster_session_credentials_input ->
    ( get_cluster_session_credentials_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides temporary, HTTP basic credentials that are associated with a given runtime IAM role \
   and used by a cluster with fine-grained access control activated. You can use these credentials \
   to connect to cluster endpoints that support username and password authentication.\n"]

module GetManagedScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_managed_scaling_policy_input ->
    (get_managed_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_managed_scaling_policy_input ->
    ( get_managed_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Fetches the attached managed scaling policy for an Amazon EMR cluster. \n"]

module GetOnClusterAppUIPresignedURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_on_cluster_app_ui_presigned_url_input ->
    ( get_on_cluster_app_ui_presigned_url_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_on_cluster_app_ui_presigned_url_input ->
    ( get_on_cluster_app_ui_presigned_url_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The presigned URL properties for the cluster's application user interface.\n"]

module GetPersistentAppUIPresignedURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_persistent_app_ui_presigned_url_input ->
    ( get_persistent_app_ui_presigned_url_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_persistent_app_ui_presigned_url_input ->
    ( get_persistent_app_ui_presigned_url_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The presigned URL properties for the cluster's application user interface.\n"]

module GetSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_input ->
    ( get_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_input ->
    ( get_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns detailed information about a session.\n"]

module GetSessionEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_input ->
    ( get_session_endpoint_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_session_endpoint_input ->
    ( get_session_endpoint_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the Spark Connect endpoint URL and a time-limited authentication token for the \
   specified session. Use the endpoint and token to connect a PySpark client to the session. Call \
   this operation again when the token expires to obtain a new one.\n"]

module GetStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_studio_session_mapping_input ->
    ( get_studio_session_mapping_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_studio_session_mapping_input ->
    ( get_studio_session_mapping_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fetches mapping details for the specified Amazon EMR Studio and identity (user or group).\n"]

module ListBootstrapActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_bootstrap_actions_input ->
    ( list_bootstrap_actions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_bootstrap_actions_input ->
    ( list_bootstrap_actions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides information about the bootstrap actions associated with a cluster.\n"]

module ListClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_input ->
    ( list_clusters_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_input ->
    ( list_clusters_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the status of all clusters visible to this Amazon Web Services account. Allows you to \
   filter the list of clusters based on certain criteria; for example, filtering by cluster \
   creation date and time or by status. This call returns a maximum of 50 clusters in unsorted \
   order per call, but returns a marker to track the paging of the cluster list across multiple \
   ListClusters calls.\n"]

module ListInstanceFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_fleets_input ->
    ( list_instance_fleets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_fleets_input ->
    ( list_instance_fleets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all available details about the instance fleets in a cluster.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

module ListInstanceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instance_groups_input ->
    ( list_instance_groups_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instance_groups_input ->
    ( list_instance_groups_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides all available details about the instance groups in a cluster.\n"]

module ListInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_instances_input ->
    ( list_instances_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_instances_input ->
    ( list_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information for all active Amazon EC2 instances and Amazon EC2 instances terminated in \
   the last 30 days, up to a maximum of 2,000. Amazon EC2 instances in any of the following states \
   are considered active: AWAITING_FULFILLMENT, PROVISIONING, BOOTSTRAPPING, RUNNING.\n"]

module ListNotebookExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_executions_input ->
    ( list_notebook_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_notebook_executions_input ->
    ( list_notebook_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides summaries of all notebook executions. You can filter the list based on multiple \
   criteria such as status, time range, and editor id. Returns a maximum of 50 notebook executions \
   and a marker to track the paging of a longer notebook execution list across multiple \
   [ListNotebookExecutions] calls.\n"]

module ListReleaseLabels : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_release_labels_input ->
    ( list_release_labels_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_release_labels_input ->
    ( list_release_labels_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves release labels of Amazon EMR services in the Region where the API is called.\n"]

module ListSecurityConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_security_configurations_input ->
    ( list_security_configurations_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_security_configurations_input ->
    ( list_security_configurations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the security configurations visible to this account, providing their creation dates \
   and times, and their names. This call returns a maximum of 50 clusters per call, but returns a \
   marker to track the paging of the cluster list across multiple ListSecurityConfigurations calls.\n"]

module ListSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_input ->
    ( list_sessions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_sessions_input ->
    ( list_sessions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the sessions on a cluster. You can filter the results by session state. Newer sessions \
   are returned first.\n"]

module ListSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_steps_input ->
    ( list_steps_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_steps_input ->
    ( list_steps_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of steps for the cluster in reverse order unless you specify [stepIds] with the \
   request or filter by [StepStates]. You can specify a maximum of 10 [stepIDs]. The CLI \
   automatically paginates results to return a list greater than 50 steps. To return more than 50 \
   steps using the CLI, specify a [Marker], which is a pagination token that indicates the next \
   set of steps to retrieve.\n"]

module ListStudioSessionMappings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_studio_session_mappings_input ->
    ( list_studio_session_mappings_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_studio_session_mappings_input ->
    ( list_studio_session_mappings_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all user or group session mappings for the Amazon EMR Studio specified by \
   [StudioId].\n"]

module ListStudios : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_studios_input ->
    ( list_studios_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_studios_input ->
    ( list_studios_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all Amazon EMR Studios associated with the Amazon Web Services account. The \
   list includes details such as ID, Studio Access URL, and creation time for each Studio.\n"]

module ListSupportedInstanceTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_supported_instance_types_input ->
    ( list_supported_instance_types_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_supported_instance_types_input ->
    ( list_supported_instance_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A list of the instance types that Amazon EMR supports. You can filter the list by Amazon Web \
   Services Region and Amazon EMR release. \n"]

module ModifyCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_input ->
    ( modify_cluster_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_cluster_input ->
    ( modify_cluster_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the number of steps that can be executed concurrently for the cluster specified using \
   ClusterID.\n"]

module ModifyInstanceFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_fleet_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_fleet_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the target On-Demand and target Spot capacities for the instance fleet with the \
   specified InstanceFleetID within the cluster specified using ClusterID. The call either \
   succeeds or fails atomically.\n\n\
  \  The instance fleet configuration is available only in Amazon EMR releases 4.8.0 and later, \
   excluding 5.0.x versions.\n\
  \  \n\
  \   "]

module ModifyInstanceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_groups_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_instance_groups_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "ModifyInstanceGroups modifies the number of nodes and configuration settings of an instance \
   group. The input parameters include the new target instance count for the group and the \
   instance group ID. The call will either succeed or fail atomically.\n"]

module PutAutoScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_auto_scaling_policy_input ->
    (put_auto_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_auto_scaling_policy_input ->
    ( put_auto_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an automatic scaling policy for a core instance group or task instance group \
   in an Amazon EMR cluster. The automatic scaling policy defines how an instance group \
   dynamically adds and terminates Amazon EC2 instances in response to the value of a CloudWatch \
   metric.\n"]

module PutAutoTerminationPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_auto_termination_policy_input ->
    (put_auto_termination_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_auto_termination_policy_input ->
    ( put_auto_termination_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Auto-termination is supported in Amazon EMR releases 5.30.0 and 6.1.0 and later. For more \
   information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-auto-termination-policy.html}Using \
   an auto-termination policy}.\n\
  \ \n\
  \   Creates or updates an auto-termination policy for an Amazon EMR cluster. An auto-termination \
   policy defines the amount of idle time in seconds after which a cluster automatically \
   terminates. For alternative cluster termination options, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-termination.html}Control \
   cluster termination}.\n\
  \   "]

module PutBlockPublicAccessConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_block_public_access_configuration_input ->
    ( put_block_public_access_configuration_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_block_public_access_configuration_input ->
    ( put_block_public_access_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates an Amazon EMR block public access configuration for your Amazon Web Services \
   account in the current Region. For more information see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/configure-block-public-access.html}Configure \
   Block Public Access for Amazon EMR} in the {i Amazon EMR Management Guide}.\n"]

module PutManagedScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_managed_scaling_policy_input ->
    (put_managed_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_managed_scaling_policy_input ->
    ( put_managed_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a managed scaling policy for an Amazon EMR cluster. The managed scaling \
   policy defines the limits for resources, such as Amazon EC2 instances that can be added or \
   terminated from a cluster. The policy only applies to the core and task nodes. The master node \
   cannot be scaled after initial configuration. \n"]

module RemoveAutoScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_scaling_policy_input ->
    (remove_auto_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_scaling_policy_input ->
    ( remove_auto_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes an automatic scaling policy from a specified instance group within an Amazon EMR cluster.\n"]

module RemoveAutoTerminationPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_termination_policy_input ->
    (remove_auto_termination_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_auto_termination_policy_input ->
    ( remove_auto_termination_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes an auto-termination policy from an Amazon EMR cluster.\n"]

module RemoveManagedScalingPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_managed_scaling_policy_input ->
    (remove_managed_scaling_policy_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_managed_scaling_policy_input ->
    ( remove_managed_scaling_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Removes a managed scaling policy from a specified Amazon EMR cluster. \n"]

module RemoveTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags from an Amazon EMR resource, such as a cluster or Amazon EMR Studio. Tags make it \
   easier to associate resources in various ways, such as grouping clusters to track your Amazon \
   EMR resource allocation costs. For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-tags.html}Tag Clusters}. \n\n\
  \ The following example removes the stack tag with value Prod from a cluster:\n\
  \ "]

module RunJobFlow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    run_job_flow_input ->
    ( run_job_flow_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    run_job_flow_input ->
    ( run_job_flow_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "RunJobFlow creates and starts running a new cluster (job flow). The cluster runs the steps \
   specified. After the steps complete, the cluster stops and the HDFS partition is lost. To \
   prevent loss of data, configure the last step of the job flow to store results in Amazon S3. If \
   the [JobFlowInstancesConfig] [KeepJobFlowAliveWhenNoSteps] parameter is set to [TRUE], the \
   cluster transitions to the WAITING state rather than shutting down after the steps have \
   completed. \n\n\
  \ For additional protection, you can set the [JobFlowInstancesConfig] [TerminationProtected] \
   parameter to [TRUE] to lock the cluster and prevent it from being terminated by API call, user \
   intervention, or in the event of a job flow error.\n\
  \ \n\
  \  A maximum of 256 steps are allowed in each job flow.\n\
  \  \n\
  \   If your cluster is long-running (such as a Hive data warehouse) or complex, you may require \
   more than 256 steps to process your data. You can bypass the 256-step limitation in various \
   ways, including using the SSH shell to connect to the master node and submitting queries \
   directly to the software running on the master node, such as Hive and Hadoop.\n\
  \   \n\
  \    For long-running clusters, we recommend that you periodically store your results.\n\
  \    \n\
  \      The instance fleets configuration is available only in Amazon EMR releases 4.8.0 and \
   later, excluding 5.0.x versions. The RunJobFlow request can contain InstanceFleets parameters \
   or InstanceGroups parameters, but not both.\n\
  \      \n\
  \       "]

module SetKeepJobFlowAliveWhenNoSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_keep_job_flow_alive_when_no_steps_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_keep_job_flow_alive_when_no_steps_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can use the [SetKeepJobFlowAliveWhenNoSteps] to configure a cluster (job flow) to terminate \
   after the step execution, i.e., all your steps are executed. If you want a transient cluster \
   that shuts down after the last of the current executing steps are completed, you can configure \
   [SetKeepJobFlowAliveWhenNoSteps] to false. If you want a long running cluster, configure \
   [SetKeepJobFlowAliveWhenNoSteps] to true.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html}Managing \
   Cluster Termination} in the {i Amazon EMR Management Guide}.\n\
  \ "]

module SetTerminationProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_termination_protection_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_termination_protection_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "SetTerminationProtection locks a cluster (job flow) so the Amazon EC2 instances in the cluster \
   cannot be terminated by user intervention, an API call, or in the event of a job-flow error. \
   The cluster still terminates upon successful completion of the job flow. Calling \
   [SetTerminationProtection] on a cluster is similar to calling the Amazon EC2 \
   [DisableAPITermination] API on all Amazon EC2 instances in a cluster.\n\n\
  \  [SetTerminationProtection] is used to prevent accidental termination of a cluster and to \
   ensure that in the event of an error, the instances persist so that you can recover any data \
   stored in their ephemeral instance storage.\n\
  \ \n\
  \   To terminate a cluster that has been locked by setting [SetTerminationProtection] to [true], \
   you must first unlock the job flow by a subsequent call to [SetTerminationProtection] in which \
   you set the value to [false]. \n\
  \  \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/UsingEMR_TerminationProtection.html}Managing \
   Cluster Termination} in the {i Amazon EMR Management Guide}. \n\
  \   "]

module SetUnhealthyNodeReplacement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_unhealthy_node_replacement_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_unhealthy_node_replacement_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specify whether to enable unhealthy node replacement, which lets Amazon EMR gracefully replace \
   core nodes on a cluster if any nodes become unhealthy. For example, a node becomes unhealthy if \
   disk usage is above 90%. If unhealthy node replacement is on and [TerminationProtected] are \
   off, Amazon EMR immediately terminates the unhealthy core nodes. To use unhealthy node \
   replacement and retain unhealthy core nodes, use to turn on termination protection. In such \
   cases, Amazon EMR adds the unhealthy nodes to a denylist, reducing job interruptions and \
   failures.\n\n\
  \ If unhealthy node replacement is on, Amazon EMR notifies YARN and other applications on the \
   cluster to stop scheduling tasks with these nodes, moves the data, and then terminates the \
   nodes.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-node-replacement.html}graceful \
   node replacement} in the {i Amazon EMR Management Guide}.\n\
  \  "]

module SetVisibleToAllUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_visible_to_all_users_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_visible_to_all_users_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " The SetVisibleToAllUsers parameter is no longer supported. Your cluster may be visible to all \
   users in your account. To restrict cluster access using an IAM policy, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-plan-access-IAM.html}Identity and \
   Access Management for Amazon EMR}. \n\
  \ \n\
  \   Sets the [Cluster$VisibleToAllUsers] value for an Amazon EMR cluster. When [true], IAM \
   principals in the Amazon Web Services account can perform Amazon EMR cluster actions that their \
   IAM policies allow. When [false], only the IAM principal that created the cluster and the \
   Amazon Web Services account root user can perform Amazon EMR actions on the cluster, regardless \
   of IAM permissions policies attached to other IAM principals.\n\
  \   \n\
  \    This action works on running clusters. When you create a cluster, use the \
   [RunJobFlowInput$VisibleToAllUsers] parameter.\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/emr/latest/ManagementGuide/security_IAM_emr-with-IAM.html#security_set_visible_to_all_users}Understanding \
   the Amazon EMR Cluster VisibleToAllUsers Setting} in the {i Amazon EMR Management Guide}.\n\
  \     "]

module StartNotebookExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_notebook_execution_input ->
    ( start_notebook_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_notebook_execution_input ->
    ( start_notebook_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts a notebook execution.\n"]

module StartSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_session_input ->
    ( start_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_session_input ->
    ( start_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates and starts a new Spark Connect session on the specified cluster. The cluster must be in \
   the [RUNNING] or [WAITING] state and have sessions enabled. This operation is supported in \
   Amazon EMR Spark 8.0.0 and later.\n"]

module StopNotebookExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_notebook_execution_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_notebook_execution_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops a notebook execution.\n"]

module TerminateJobFlows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_job_flows_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_job_flows_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "TerminateJobFlows shuts a list of clusters (job flows) down. When a job flow is shut down, any \
   step not yet completed is canceled and the Amazon EC2 instances on which the cluster is running \
   are stopped. Any log files not already saved are uploaded to Amazon S3 if a LogUri was \
   specified when the cluster was created.\n\n\
  \ The maximum number of clusters allowed is 10. The call to [TerminateJobFlows] is asynchronous. \
   Depending on the configuration of the cluster, it may take up to 1-5 minutes for the cluster to \
   completely terminate and release allocated resources, such as Amazon EC2 instances.\n\
  \ "]

module TerminateSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_input ->
    ( terminate_session_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_input ->
    ( terminate_session_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates an active session. After you call this operation, the session enters the \
   [TERMINATING] state and then transitions to [TERMINATED].\n"]

module UpdateStudio : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_studio_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an Amazon EMR Studio configuration, including attributes such as name, description, and \
   subnets.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateStudioSessionMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_studio_session_mapping_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the session policy attached to the user or group for the specified Amazon EMR Studio.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
