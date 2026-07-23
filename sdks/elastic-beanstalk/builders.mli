open Types

val make_validation_message :
  ?message:validation_message_string ->
  ?severity:validation_severity ->
  ?namespace:option_namespace ->
  ?option_name:configuration_option_name ->
  unit ->
  validation_message

val make_configuration_settings_validation_messages :
  ?messages:validation_messages_list -> unit -> configuration_settings_validation_messages

val make_configuration_option_setting :
  ?resource_name:resource_name ->
  ?namespace:option_namespace ->
  ?option_name:configuration_option_name ->
  ?value:configuration_option_value ->
  unit ->
  configuration_option_setting

val make_validate_configuration_settings_message :
  ?template_name:configuration_template_name ->
  ?environment_name:environment_name ->
  application_name:application_name ->
  option_settings:configuration_option_settings_list ->
  unit ->
  validate_configuration_settings_message

val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_update_tags_for_resource_message :
  ?tags_to_add:tag_list ->
  ?tags_to_remove:tag_key_list ->
  resource_arn:resource_arn ->
  unit ->
  update_tags_for_resource_message

val make_environment_link :
  ?link_name:string_ -> ?environment_name:string_ -> unit -> environment_link

val make_environment_tier :
  ?name:string_ -> ?type_:string_ -> ?version:string_ -> unit -> environment_tier

val make_listener : ?protocol:string_ -> ?port:integer -> unit -> listener

val make_load_balancer_description :
  ?load_balancer_name:string_ ->
  ?domain:string_ ->
  ?listeners:load_balancer_listeners_description ->
  unit ->
  load_balancer_description

val make_environment_resources_description :
  ?load_balancer:load_balancer_description -> unit -> environment_resources_description

val make_environment_description :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  ?application_name:application_name ->
  ?version_label:version_label ->
  ?solution_stack_name:solution_stack_name ->
  ?platform_arn:platform_arn ->
  ?template_name:configuration_template_name ->
  ?description:description ->
  ?endpoint_ur_l:endpoint_ur_l ->
  ?cnam_e:dns_cname ->
  ?date_created:creation_date ->
  ?date_updated:update_date ->
  ?status:environment_status ->
  ?abortable_operation_in_progress:abortable_operation_in_progress ->
  ?health:environment_health ->
  ?health_status:environment_health_status ->
  ?resources:environment_resources_description ->
  ?tier:environment_tier ->
  ?environment_links:environment_links ->
  ?environment_arn:environment_arn ->
  ?operations_role:operations_role ->
  unit ->
  environment_description

val make_option_specification :
  ?resource_name:resource_name ->
  ?namespace:option_namespace ->
  ?option_name:configuration_option_name ->
  unit ->
  option_specification

val make_update_environment_message :
  ?application_name:application_name ->
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  ?group_name:group_name ->
  ?description:description ->
  ?tier:environment_tier ->
  ?version_label:version_label ->
  ?template_name:configuration_template_name ->
  ?solution_stack_name:solution_stack_name ->
  ?platform_arn:platform_arn ->
  ?option_settings:configuration_option_settings_list ->
  ?options_to_remove:options_specifier_list ->
  unit ->
  update_environment_message

val make_configuration_settings_description :
  ?solution_stack_name:solution_stack_name ->
  ?platform_arn:platform_arn ->
  ?application_name:application_name ->
  ?template_name:configuration_template_name ->
  ?description:description ->
  ?environment_name:environment_name ->
  ?deployment_status:configuration_deployment_status ->
  ?date_created:creation_date ->
  ?date_updated:update_date ->
  ?option_settings:configuration_option_settings_list ->
  unit ->
  configuration_settings_description

val make_update_configuration_template_message :
  ?description:description ->
  ?option_settings:configuration_option_settings_list ->
  ?options_to_remove:options_specifier_list ->
  application_name:application_name ->
  template_name:configuration_template_name ->
  unit ->
  update_configuration_template_message

val make_s3_location : ?s3_bucket:s3_bucket -> ?s3_key:s3_key -> unit -> s3_location

val make_source_build_information :
  source_type:source_type ->
  source_repository:source_repository ->
  source_location:source_location ->
  unit ->
  source_build_information

val make_application_version_description :
  ?application_version_arn:application_version_arn ->
  ?application_name:application_name ->
  ?description:description ->
  ?version_label:version_label ->
  ?source_build_information:source_build_information ->
  ?build_arn:string_ ->
  ?source_bundle:s3_location ->
  ?date_created:creation_date ->
  ?date_updated:update_date ->
  ?status:application_version_status ->
  unit ->
  application_version_description

val make_application_version_description_message :
  ?application_version:application_version_description ->
  unit ->
  application_version_description_message

val make_update_application_version_message :
  ?description:description ->
  application_name:application_name ->
  version_label:version_label ->
  unit ->
  update_application_version_message

val make_max_age_rule :
  ?max_age_in_days:boxed_int ->
  ?delete_source_from_s3:boxed_boolean ->
  enabled:boxed_boolean ->
  unit ->
  max_age_rule

val make_max_count_rule :
  ?max_count:boxed_int ->
  ?delete_source_from_s3:boxed_boolean ->
  enabled:boxed_boolean ->
  unit ->
  max_count_rule

val make_application_version_lifecycle_config :
  ?max_count_rule:max_count_rule ->
  ?max_age_rule:max_age_rule ->
  unit ->
  application_version_lifecycle_config

val make_application_resource_lifecycle_config :
  ?service_role:string_ ->
  ?version_lifecycle_config:application_version_lifecycle_config ->
  unit ->
  application_resource_lifecycle_config

val make_application_resource_lifecycle_description_message :
  ?application_name:application_name ->
  ?resource_lifecycle_config:application_resource_lifecycle_config ->
  unit ->
  application_resource_lifecycle_description_message

val make_update_application_resource_lifecycle_message :
  application_name:application_name ->
  resource_lifecycle_config:application_resource_lifecycle_config ->
  unit ->
  update_application_resource_lifecycle_message

val make_application_description :
  ?application_arn:application_arn ->
  ?application_name:application_name ->
  ?description:description ->
  ?date_created:creation_date ->
  ?date_updated:update_date ->
  ?versions:version_labels_list ->
  ?configuration_templates:configuration_template_names_list ->
  ?resource_lifecycle_config:application_resource_lifecycle_config ->
  unit ->
  application_description

val make_application_description_message :
  ?application:application_description -> unit -> application_description_message

val make_update_application_message :
  ?description:description ->
  application_name:application_name ->
  unit ->
  update_application_message

val make_terminate_environment_message :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  ?terminate_resources:terminate_environment_resources ->
  ?force_terminate:force_terminate ->
  unit ->
  terminate_environment_message

val make_swap_environment_cnam_es_message :
  ?source_environment_id:environment_id ->
  ?source_environment_name:environment_name ->
  ?destination_environment_id:environment_id ->
  ?destination_environment_name:environment_name ->
  unit ->
  swap_environment_cnam_es_message

val make_environment_info_description :
  ?info_type:environment_info_type ->
  ?ec2_instance_id:ec2_instance_id ->
  ?sample_timestamp:sample_timestamp ->
  ?message:message ->
  unit ->
  environment_info_description

val make_retrieve_environment_info_result_message :
  ?environment_info:environment_info_description_list ->
  unit ->
  retrieve_environment_info_result_message

val make_retrieve_environment_info_message :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  info_type:environment_info_type ->
  unit ->
  retrieve_environment_info_message

val make_restart_app_server_message :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  unit ->
  restart_app_server_message

val make_request_environment_info_message :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  info_type:environment_info_type ->
  unit ->
  request_environment_info_message

val make_rebuild_environment_message :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  unit ->
  rebuild_environment_message

val make_resource_tags_description_message :
  ?resource_arn:resource_arn -> ?resource_tags:tag_list -> unit -> resource_tags_description_message

val make_list_tags_for_resource_message :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_message

val make_platform_summary :
  ?platform_arn:platform_arn ->
  ?platform_owner:platform_owner ->
  ?platform_status:platform_status ->
  ?platform_category:platform_category ->
  ?operating_system_name:operating_system_name ->
  ?operating_system_version:operating_system_version ->
  ?supported_tier_list:supported_tier_list ->
  ?supported_addon_list:supported_addon_list ->
  ?platform_lifecycle_state:platform_lifecycle_state ->
  ?platform_version:platform_version ->
  ?platform_branch_name:branch_name ->
  ?platform_branch_lifecycle_state:platform_branch_lifecycle_state ->
  unit ->
  platform_summary

val make_platform_filter :
  ?type_:platform_filter_type ->
  ?operator:platform_filter_operator ->
  ?values:platform_filter_value_list ->
  unit ->
  platform_filter

val make_list_platform_versions_request :
  ?filters:platform_filters ->
  ?max_records:platform_max_records ->
  ?next_token:token ->
  unit ->
  list_platform_versions_request

val make_platform_branch_summary :
  ?platform_name:platform_name ->
  ?branch_name:branch_name ->
  ?lifecycle_state:platform_branch_lifecycle_state ->
  ?branch_order:branch_order ->
  ?supported_tier_list:supported_tier_list ->
  unit ->
  platform_branch_summary

val make_search_filter :
  ?attribute:search_filter_attribute ->
  ?operator:search_filter_operator ->
  ?values:search_filter_values ->
  unit ->
  search_filter

val make_list_platform_branches_request :
  ?filters:search_filters ->
  ?max_records:platform_branch_max_records ->
  ?next_token:token ->
  unit ->
  list_platform_branches_request

val make_solution_stack_description :
  ?solution_stack_name:solution_stack_name ->
  ?permitted_file_types:solution_stack_file_type_list ->
  unit ->
  solution_stack_description

val make_list_available_solution_stacks_result_message :
  ?solution_stacks:available_solution_stack_names_list ->
  ?solution_stack_details:available_solution_stack_details_list ->
  unit ->
  list_available_solution_stacks_result_message

val make_disassociate_environment_operations_role_message :
  environment_name:environment_name -> unit -> disassociate_environment_operations_role_message

val make_custom_ami :
  ?virtualization_type:virtualization_type -> ?image_id:image_id -> unit -> custom_ami

val make_platform_framework : ?name:string_ -> ?version:string_ -> unit -> platform_framework

val make_platform_programming_language :
  ?name:string_ -> ?version:string_ -> unit -> platform_programming_language

val make_platform_description :
  ?platform_arn:platform_arn ->
  ?platform_owner:platform_owner ->
  ?platform_name:platform_name ->
  ?platform_version:platform_version ->
  ?solution_stack_name:solution_stack_name ->
  ?platform_status:platform_status ->
  ?date_created:creation_date ->
  ?date_updated:update_date ->
  ?platform_category:platform_category ->
  ?description:description ->
  ?maintainer:maintainer ->
  ?operating_system_name:operating_system_name ->
  ?operating_system_version:operating_system_version ->
  ?programming_languages:platform_programming_languages ->
  ?frameworks:platform_frameworks ->
  ?custom_ami_list:custom_ami_list ->
  ?supported_tier_list:supported_tier_list ->
  ?supported_addon_list:supported_addon_list ->
  ?platform_lifecycle_state:platform_lifecycle_state ->
  ?platform_branch_name:branch_name ->
  ?platform_branch_lifecycle_state:platform_branch_lifecycle_state ->
  unit ->
  platform_description

val make_describe_platform_version_request :
  ?platform_arn:platform_arn -> unit -> describe_platform_version_request

val make_deployment :
  ?version_label:string_ ->
  ?deployment_id:nullable_long ->
  ?status:string_ ->
  ?deployment_time:deployment_timestamp ->
  unit ->
  deployment

val make_cpu_utilization :
  ?user:nullable_double ->
  ?nice:nullable_double ->
  ?system:nullable_double ->
  ?idle:nullable_double ->
  ?io_wait:nullable_double ->
  ?ir_q:nullable_double ->
  ?soft_ir_q:nullable_double ->
  ?privileged:nullable_double ->
  unit ->
  cpu_utilization

val make_system_status :
  ?cpu_utilization:cpu_utilization -> ?load_average:load_average -> unit -> system_status

val make_latency :
  ?p999:nullable_double ->
  ?p99:nullable_double ->
  ?p95:nullable_double ->
  ?p90:nullable_double ->
  ?p85:nullable_double ->
  ?p75:nullable_double ->
  ?p50:nullable_double ->
  ?p10:nullable_double ->
  unit ->
  latency

val make_status_codes :
  ?status2xx:nullable_integer ->
  ?status3xx:nullable_integer ->
  ?status4xx:nullable_integer ->
  ?status5xx:nullable_integer ->
  unit ->
  status_codes

val make_application_metrics :
  ?duration:nullable_integer ->
  ?request_count:request_count ->
  ?status_codes:status_codes ->
  ?latency:latency ->
  unit ->
  application_metrics

val make_single_instance_health :
  ?instance_id:instance_id ->
  ?health_status:string_ ->
  ?color:string_ ->
  ?causes:causes ->
  ?launched_at:launched_at ->
  ?application_metrics:application_metrics ->
  ?system:system_status ->
  ?deployment:deployment ->
  ?availability_zone:string_ ->
  ?instance_type:string_ ->
  unit ->
  single_instance_health

val make_describe_instances_health_request :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  ?attribute_names:instances_health_attributes ->
  ?next_token:next_token ->
  unit ->
  describe_instances_health_request

val make_event_description :
  ?event_date:event_date ->
  ?message:event_message ->
  ?application_name:application_name ->
  ?version_label:version_label ->
  ?template_name:configuration_template_name ->
  ?environment_name:environment_name ->
  ?platform_arn:platform_arn ->
  ?request_id:request_id ->
  ?severity:event_severity ->
  unit ->
  event_description

val make_event_descriptions_message :
  ?events:event_description_list -> ?next_token:token -> unit -> event_descriptions_message

val make_describe_events_message :
  ?application_name:application_name ->
  ?version_label:version_label ->
  ?template_name:configuration_template_name ->
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  ?platform_arn:platform_arn ->
  ?request_id:request_id ->
  ?severity:event_severity ->
  ?start_time:time_filter_start ->
  ?end_time:time_filter_end ->
  ?max_records:max_records ->
  ?next_token:token ->
  unit ->
  describe_events_message

val make_environment_descriptions_message :
  ?environments:environment_descriptions_list ->
  ?next_token:token ->
  unit ->
  environment_descriptions_message

val make_describe_environments_message :
  ?application_name:application_name ->
  ?version_label:version_label ->
  ?environment_ids:environment_id_list ->
  ?environment_names:environment_names_list ->
  ?include_deleted:include_deleted ->
  ?included_deleted_back_to:include_deleted_back_to ->
  ?max_records:max_records ->
  ?next_token:token ->
  unit ->
  describe_environments_message

val make_queue : ?name:string_ -> ?ur_l:string_ -> unit -> queue
val make_trigger : ?name:resource_id -> unit -> trigger
val make_load_balancer : ?name:resource_id -> unit -> load_balancer
val make_launch_template : ?id:resource_id -> unit -> launch_template
val make_launch_configuration : ?name:resource_id -> unit -> launch_configuration
val make_instance : ?id:resource_id -> unit -> instance
val make_auto_scaling_group : ?name:resource_id -> unit -> auto_scaling_group

val make_environment_resource_description :
  ?environment_name:environment_name ->
  ?auto_scaling_groups:auto_scaling_group_list ->
  ?instances:instance_list ->
  ?launch_configurations:launch_configuration_list ->
  ?launch_templates:launch_template_list ->
  ?load_balancers:load_balancer_list ->
  ?triggers:trigger_list ->
  ?queues:queue_list ->
  unit ->
  environment_resource_description

val make_environment_resource_descriptions_message :
  ?environment_resources:environment_resource_description ->
  unit ->
  environment_resource_descriptions_message

val make_describe_environment_resources_message :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  unit ->
  describe_environment_resources_message

val make_managed_action :
  ?action_id:string_ ->
  ?action_description:string_ ->
  ?action_type:action_type ->
  ?status:action_status ->
  ?window_start_time:timestamp ->
  unit ->
  managed_action

val make_describe_environment_managed_actions_request :
  ?environment_name:string_ ->
  ?environment_id:string_ ->
  ?status:action_status ->
  unit ->
  describe_environment_managed_actions_request

val make_managed_action_history_item :
  ?action_id:string_ ->
  ?action_type:action_type ->
  ?action_description:string_ ->
  ?failure_type:failure_type ->
  ?status:action_history_status ->
  ?failure_description:string_ ->
  ?executed_time:timestamp ->
  ?finished_time:timestamp ->
  unit ->
  managed_action_history_item

val make_describe_environment_managed_action_history_request :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  ?next_token:string_ ->
  ?max_items:managed_action_history_max_items ->
  unit ->
  describe_environment_managed_action_history_request

val make_instance_health_summary :
  ?no_data:nullable_integer ->
  ?unknown:nullable_integer ->
  ?pending:nullable_integer ->
  ?ok:nullable_integer ->
  ?info:nullable_integer ->
  ?warning:nullable_integer ->
  ?degraded:nullable_integer ->
  ?severe:nullable_integer ->
  unit ->
  instance_health_summary

val make_describe_environment_health_request :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  ?attribute_names:environment_health_attributes ->
  unit ->
  describe_environment_health_request

val make_configuration_settings_descriptions :
  ?configuration_settings:configuration_settings_description_list ->
  unit ->
  configuration_settings_descriptions

val make_describe_configuration_settings_message :
  ?template_name:configuration_template_name ->
  ?environment_name:environment_name ->
  application_name:application_name ->
  unit ->
  describe_configuration_settings_message

val make_option_restriction_regex :
  ?pattern:regex_pattern -> ?label:regex_label -> unit -> option_restriction_regex

val make_configuration_option_description :
  ?namespace:option_namespace ->
  ?name:configuration_option_name ->
  ?default_value:configuration_option_default_value ->
  ?change_severity:configuration_option_severity ->
  ?user_defined:user_defined_option ->
  ?value_type:configuration_option_value_type ->
  ?value_options:configuration_option_possible_values ->
  ?min_value:option_restriction_min_value ->
  ?max_value:option_restriction_max_value ->
  ?max_length:option_restriction_max_length ->
  ?regex:option_restriction_regex ->
  unit ->
  configuration_option_description

val make_configuration_options_description :
  ?solution_stack_name:solution_stack_name ->
  ?platform_arn:platform_arn ->
  ?options:configuration_option_descriptions_list ->
  unit ->
  configuration_options_description

val make_describe_configuration_options_message :
  ?application_name:application_name ->
  ?template_name:configuration_template_name ->
  ?environment_name:environment_name ->
  ?solution_stack_name:solution_stack_name ->
  ?platform_arn:platform_arn ->
  ?options:options_specifier_list ->
  unit ->
  describe_configuration_options_message

val make_application_version_descriptions_message :
  ?application_versions:application_version_description_list ->
  ?next_token:token ->
  unit ->
  application_version_descriptions_message

val make_describe_application_versions_message :
  ?application_name:application_name ->
  ?version_labels:version_labels_list ->
  ?max_records:max_records ->
  ?next_token:token ->
  unit ->
  describe_application_versions_message

val make_application_descriptions_message :
  ?applications:application_description_list -> unit -> application_descriptions_message

val make_describe_applications_message :
  ?application_names:application_names_list -> unit -> describe_applications_message

val make_resource_quota : ?maximum:boxed_int -> unit -> resource_quota

val make_resource_quotas :
  ?application_quota:resource_quota ->
  ?application_version_quota:resource_quota ->
  ?environment_quota:resource_quota ->
  ?configuration_template_quota:resource_quota ->
  ?custom_platform_quota:resource_quota ->
  unit ->
  resource_quotas

val make_delete_platform_version_request :
  ?platform_arn:platform_arn -> unit -> delete_platform_version_request

val make_delete_environment_configuration_message :
  application_name:application_name ->
  environment_name:environment_name ->
  unit ->
  delete_environment_configuration_message

val make_delete_configuration_template_message :
  application_name:application_name ->
  template_name:configuration_template_name ->
  unit ->
  delete_configuration_template_message

val make_delete_application_version_message :
  ?delete_source_bundle:delete_source_bundle ->
  application_name:application_name ->
  version_label:version_label ->
  unit ->
  delete_application_version_message

val make_delete_application_message :
  ?terminate_env_by_force:terminate_env_force ->
  application_name:application_name ->
  unit ->
  delete_application_message

val make_create_storage_location_result_message :
  ?s3_bucket:s3_bucket -> unit -> create_storage_location_result_message

val make_builder : ?ar_n:ar_n -> unit -> builder

val make_create_platform_version_request :
  ?environment_name:environment_name ->
  ?option_settings:configuration_option_settings_list ->
  ?tags:tags ->
  platform_name:platform_name ->
  platform_version:platform_version ->
  platform_definition_bundle:s3_location ->
  unit ->
  create_platform_version_request

val make_create_environment_message :
  ?environment_name:environment_name ->
  ?group_name:group_name ->
  ?description:description ->
  ?cname_prefix:dns_cname_prefix ->
  ?tier:environment_tier ->
  ?tags:tags ->
  ?version_label:version_label ->
  ?template_name:configuration_template_name ->
  ?solution_stack_name:solution_stack_name ->
  ?platform_arn:platform_arn ->
  ?option_settings:configuration_option_settings_list ->
  ?options_to_remove:options_specifier_list ->
  ?operations_role:operations_role ->
  application_name:application_name ->
  unit ->
  create_environment_message

val make_source_configuration :
  ?application_name:application_name ->
  ?template_name:configuration_template_name ->
  unit ->
  source_configuration

val make_create_configuration_template_message :
  ?solution_stack_name:solution_stack_name ->
  ?platform_arn:platform_arn ->
  ?source_configuration:source_configuration ->
  ?environment_id:environment_id ->
  ?description:description ->
  ?option_settings:configuration_option_settings_list ->
  ?tags:tags ->
  application_name:application_name ->
  template_name:configuration_template_name ->
  unit ->
  create_configuration_template_message

val make_build_configuration :
  ?artifact_name:string_ ->
  ?compute_type:compute_type ->
  ?timeout_in_minutes:boxed_int ->
  code_build_service_role:non_empty_string ->
  image:non_empty_string ->
  unit ->
  build_configuration

val make_create_application_version_message :
  ?description:description ->
  ?source_build_information:source_build_information ->
  ?source_bundle:s3_location ->
  ?build_configuration:build_configuration ->
  ?auto_create_application:auto_create_application ->
  ?process:application_version_proccess ->
  ?tags:tags ->
  application_name:application_name ->
  version_label:version_label ->
  unit ->
  create_application_version_message

val make_create_application_message :
  ?description:description ->
  ?resource_lifecycle_config:application_resource_lifecycle_config ->
  ?tags:tags ->
  application_name:application_name ->
  unit ->
  create_application_message

val make_compose_environments_message :
  ?application_name:application_name ->
  ?group_name:group_name ->
  ?version_labels:version_labels ->
  unit ->
  compose_environments_message

val make_check_dns_availability_result_message :
  ?available:cname_availability ->
  ?fully_qualified_cnam_e:dns_cname ->
  unit ->
  check_dns_availability_result_message

val make_check_dns_availability_message :
  cname_prefix:dns_cname_prefix -> unit -> check_dns_availability_message

val make_associate_environment_operations_role_message :
  environment_name:environment_name ->
  operations_role:operations_role ->
  unit ->
  associate_environment_operations_role_message

val make_apply_environment_managed_action_request :
  ?environment_name:string_ ->
  ?environment_id:string_ ->
  action_id:string_ ->
  unit ->
  apply_environment_managed_action_request

val make_abort_environment_update_message :
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  unit ->
  abort_environment_update_message
