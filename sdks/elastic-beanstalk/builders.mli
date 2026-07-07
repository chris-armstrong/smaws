open Types

val make_validation_message :
  ?option_name:configuration_option_name ->
  ?namespace:option_namespace ->
  ?severity:validation_severity ->
  ?message:validation_message_string ->
  unit ->
  validation_message

val make_configuration_option_setting :
  ?value:configuration_option_value ->
  ?option_name:configuration_option_name ->
  ?namespace:option_namespace ->
  ?resource_name:resource_name ->
  unit ->
  configuration_option_setting

val make_validate_configuration_settings_message :
  ?environment_name:environment_name ->
  ?template_name:configuration_template_name ->
  option_settings:configuration_option_settings_list ->
  application_name:application_name ->
  unit ->
  validate_configuration_settings_message

val make_configuration_settings_validation_messages :
  ?messages:validation_messages_list -> unit -> configuration_settings_validation_messages

val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_update_tags_for_resource_message :
  ?tags_to_remove:tag_key_list ->
  ?tags_to_add:tag_list ->
  resource_arn:resource_arn ->
  unit ->
  update_tags_for_resource_message

val make_environment_tier :
  ?version:string_ -> ?type_:string_ -> ?name:string_ -> unit -> environment_tier

val make_option_specification :
  ?option_name:configuration_option_name ->
  ?namespace:option_namespace ->
  ?resource_name:resource_name ->
  unit ->
  option_specification

val make_update_environment_message :
  ?options_to_remove:options_specifier_list ->
  ?option_settings:configuration_option_settings_list ->
  ?platform_arn:platform_arn ->
  ?solution_stack_name:solution_stack_name ->
  ?template_name:configuration_template_name ->
  ?version_label:version_label ->
  ?tier:environment_tier ->
  ?description:description ->
  ?group_name:group_name ->
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  ?application_name:application_name ->
  unit ->
  update_environment_message

val make_listener : ?port:integer -> ?protocol:string_ -> unit -> listener

val make_load_balancer_description :
  ?listeners:load_balancer_listeners_description ->
  ?domain:string_ ->
  ?load_balancer_name:string_ ->
  unit ->
  load_balancer_description

val make_environment_resources_description :
  ?load_balancer:load_balancer_description -> unit -> environment_resources_description

val make_environment_link :
  ?environment_name:string_ -> ?link_name:string_ -> unit -> environment_link

val make_environment_description :
  ?operations_role:operations_role ->
  ?environment_arn:environment_arn ->
  ?environment_links:environment_links ->
  ?tier:environment_tier ->
  ?resources:environment_resources_description ->
  ?health_status:environment_health_status ->
  ?health:environment_health ->
  ?abortable_operation_in_progress:abortable_operation_in_progress ->
  ?status:environment_status ->
  ?date_updated:update_date ->
  ?date_created:creation_date ->
  ?cnam_e:dns_cname ->
  ?endpoint_ur_l:endpoint_ur_l ->
  ?description:description ->
  ?template_name:configuration_template_name ->
  ?platform_arn:platform_arn ->
  ?solution_stack_name:solution_stack_name ->
  ?version_label:version_label ->
  ?application_name:application_name ->
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  unit ->
  environment_description

val make_update_configuration_template_message :
  ?options_to_remove:options_specifier_list ->
  ?option_settings:configuration_option_settings_list ->
  ?description:description ->
  template_name:configuration_template_name ->
  application_name:application_name ->
  unit ->
  update_configuration_template_message

val make_configuration_settings_description :
  ?option_settings:configuration_option_settings_list ->
  ?date_updated:update_date ->
  ?date_created:creation_date ->
  ?deployment_status:configuration_deployment_status ->
  ?environment_name:environment_name ->
  ?description:description ->
  ?template_name:configuration_template_name ->
  ?application_name:application_name ->
  ?platform_arn:platform_arn ->
  ?solution_stack_name:solution_stack_name ->
  unit ->
  configuration_settings_description

val make_update_application_version_message :
  ?description:description ->
  version_label:version_label ->
  application_name:application_name ->
  unit ->
  update_application_version_message

val make_source_build_information :
  source_location:source_location ->
  source_repository:source_repository ->
  source_type:source_type ->
  unit ->
  source_build_information

val make_s3_location : ?s3_key:s3_key -> ?s3_bucket:s3_bucket -> unit -> s3_location

val make_application_version_description :
  ?status:application_version_status ->
  ?date_updated:update_date ->
  ?date_created:creation_date ->
  ?source_bundle:s3_location ->
  ?build_arn:string_ ->
  ?source_build_information:source_build_information ->
  ?version_label:version_label ->
  ?description:description ->
  ?application_name:application_name ->
  ?application_version_arn:application_version_arn ->
  unit ->
  application_version_description

val make_application_version_description_message :
  ?application_version:application_version_description ->
  unit ->
  application_version_description_message

val make_max_count_rule :
  ?delete_source_from_s3:boxed_boolean ->
  ?max_count:boxed_int ->
  enabled:boxed_boolean ->
  unit ->
  max_count_rule

val make_max_age_rule :
  ?delete_source_from_s3:boxed_boolean ->
  ?max_age_in_days:boxed_int ->
  enabled:boxed_boolean ->
  unit ->
  max_age_rule

val make_application_version_lifecycle_config :
  ?max_age_rule:max_age_rule ->
  ?max_count_rule:max_count_rule ->
  unit ->
  application_version_lifecycle_config

val make_application_resource_lifecycle_config :
  ?version_lifecycle_config:application_version_lifecycle_config ->
  ?service_role:string_ ->
  unit ->
  application_resource_lifecycle_config

val make_update_application_resource_lifecycle_message :
  resource_lifecycle_config:application_resource_lifecycle_config ->
  application_name:application_name ->
  unit ->
  update_application_resource_lifecycle_message

val make_application_resource_lifecycle_description_message :
  ?resource_lifecycle_config:application_resource_lifecycle_config ->
  ?application_name:application_name ->
  unit ->
  application_resource_lifecycle_description_message

val make_update_application_message :
  ?description:description ->
  application_name:application_name ->
  unit ->
  update_application_message

val make_application_description :
  ?resource_lifecycle_config:application_resource_lifecycle_config ->
  ?configuration_templates:configuration_template_names_list ->
  ?versions:version_labels_list ->
  ?date_updated:update_date ->
  ?date_created:creation_date ->
  ?description:description ->
  ?application_name:application_name ->
  ?application_arn:application_arn ->
  unit ->
  application_description

val make_application_description_message :
  ?application:application_description -> unit -> application_description_message

val make_trigger : ?name:resource_id -> unit -> trigger

val make_terminate_environment_message :
  ?force_terminate:force_terminate ->
  ?terminate_resources:terminate_environment_resources ->
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  unit ->
  terminate_environment_message

val make_cpu_utilization :
  ?privileged:nullable_double ->
  ?soft_ir_q:nullable_double ->
  ?ir_q:nullable_double ->
  ?io_wait:nullable_double ->
  ?idle:nullable_double ->
  ?system:nullable_double ->
  ?nice:nullable_double ->
  ?user:nullable_double ->
  unit ->
  cpu_utilization

val make_system_status :
  ?load_average:load_average -> ?cpu_utilization:cpu_utilization -> unit -> system_status

val make_swap_environment_cnam_es_message :
  ?destination_environment_name:environment_name ->
  ?destination_environment_id:environment_id ->
  ?source_environment_name:environment_name ->
  ?source_environment_id:environment_id ->
  unit ->
  swap_environment_cnam_es_message

val make_status_codes :
  ?status5xx:nullable_integer ->
  ?status4xx:nullable_integer ->
  ?status3xx:nullable_integer ->
  ?status2xx:nullable_integer ->
  unit ->
  status_codes

val make_source_configuration :
  ?template_name:configuration_template_name ->
  ?application_name:application_name ->
  unit ->
  source_configuration

val make_solution_stack_description :
  ?permitted_file_types:solution_stack_file_type_list ->
  ?solution_stack_name:solution_stack_name ->
  unit ->
  solution_stack_description

val make_latency :
  ?p10:nullable_double ->
  ?p50:nullable_double ->
  ?p75:nullable_double ->
  ?p85:nullable_double ->
  ?p90:nullable_double ->
  ?p95:nullable_double ->
  ?p99:nullable_double ->
  ?p999:nullable_double ->
  unit ->
  latency

val make_application_metrics :
  ?latency:latency ->
  ?status_codes:status_codes ->
  ?request_count:request_count ->
  ?duration:nullable_integer ->
  unit ->
  application_metrics

val make_deployment :
  ?deployment_time:deployment_timestamp ->
  ?status:string_ ->
  ?deployment_id:nullable_long ->
  ?version_label:string_ ->
  unit ->
  deployment

val make_single_instance_health :
  ?instance_type:string_ ->
  ?availability_zone:string_ ->
  ?deployment:deployment ->
  ?system:system_status ->
  ?application_metrics:application_metrics ->
  ?launched_at:launched_at ->
  ?causes:causes ->
  ?color:string_ ->
  ?health_status:string_ ->
  ?instance_id:instance_id ->
  unit ->
  single_instance_health

val make_search_filter :
  ?values:search_filter_values ->
  ?operator:search_filter_operator ->
  ?attribute:search_filter_attribute ->
  unit ->
  search_filter

val make_environment_info_description :
  ?message:message ->
  ?sample_timestamp:sample_timestamp ->
  ?ec2_instance_id:ec2_instance_id ->
  ?info_type:environment_info_type ->
  unit ->
  environment_info_description

val make_retrieve_environment_info_result_message :
  ?environment_info:environment_info_description_list ->
  unit ->
  retrieve_environment_info_result_message

val make_retrieve_environment_info_message :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  info_type:environment_info_type ->
  unit ->
  retrieve_environment_info_message

val make_restart_app_server_message :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  unit ->
  restart_app_server_message

val make_resource_tags_description_message :
  ?resource_tags:tag_list -> ?resource_arn:resource_arn -> unit -> resource_tags_description_message

val make_resource_quota : ?maximum:boxed_int -> unit -> resource_quota

val make_resource_quotas :
  ?custom_platform_quota:resource_quota ->
  ?configuration_template_quota:resource_quota ->
  ?environment_quota:resource_quota ->
  ?application_version_quota:resource_quota ->
  ?application_quota:resource_quota ->
  unit ->
  resource_quotas

val make_request_environment_info_message :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  info_type:environment_info_type ->
  unit ->
  request_environment_info_message

val make_rebuild_environment_message :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  unit ->
  rebuild_environment_message

val make_queue : ?ur_l:string_ -> ?name:string_ -> unit -> queue

val make_platform_summary :
  ?platform_branch_lifecycle_state:platform_branch_lifecycle_state ->
  ?platform_branch_name:branch_name ->
  ?platform_version:platform_version ->
  ?platform_lifecycle_state:platform_lifecycle_state ->
  ?supported_addon_list:supported_addon_list ->
  ?supported_tier_list:supported_tier_list ->
  ?operating_system_version:operating_system_version ->
  ?operating_system_name:operating_system_name ->
  ?platform_category:platform_category ->
  ?platform_status:platform_status ->
  ?platform_owner:platform_owner ->
  ?platform_arn:platform_arn ->
  unit ->
  platform_summary

val make_platform_programming_language :
  ?version:string_ -> ?name:string_ -> unit -> platform_programming_language

val make_platform_framework : ?version:string_ -> ?name:string_ -> unit -> platform_framework

val make_platform_filter :
  ?values:platform_filter_value_list ->
  ?operator:platform_filter_operator ->
  ?type_:platform_filter_type ->
  unit ->
  platform_filter

val make_custom_ami :
  ?image_id:image_id -> ?virtualization_type:virtualization_type -> unit -> custom_ami

val make_platform_description :
  ?platform_branch_lifecycle_state:platform_branch_lifecycle_state ->
  ?platform_branch_name:branch_name ->
  ?platform_lifecycle_state:platform_lifecycle_state ->
  ?supported_addon_list:supported_addon_list ->
  ?supported_tier_list:supported_tier_list ->
  ?custom_ami_list:custom_ami_list ->
  ?frameworks:platform_frameworks ->
  ?programming_languages:platform_programming_languages ->
  ?operating_system_version:operating_system_version ->
  ?operating_system_name:operating_system_name ->
  ?maintainer:maintainer ->
  ?description:description ->
  ?platform_category:platform_category ->
  ?date_updated:update_date ->
  ?date_created:creation_date ->
  ?platform_status:platform_status ->
  ?solution_stack_name:solution_stack_name ->
  ?platform_version:platform_version ->
  ?platform_name:platform_name ->
  ?platform_owner:platform_owner ->
  ?platform_arn:platform_arn ->
  unit ->
  platform_description

val make_platform_branch_summary :
  ?supported_tier_list:supported_tier_list ->
  ?branch_order:branch_order ->
  ?lifecycle_state:platform_branch_lifecycle_state ->
  ?branch_name:branch_name ->
  ?platform_name:platform_name ->
  unit ->
  platform_branch_summary

val make_option_restriction_regex :
  ?label:regex_label -> ?pattern:regex_pattern -> unit -> option_restriction_regex

val make_managed_action :
  ?window_start_time:timestamp ->
  ?status:action_status ->
  ?action_type:action_type ->
  ?action_description:string_ ->
  ?action_id:string_ ->
  unit ->
  managed_action

val make_managed_action_history_item :
  ?finished_time:timestamp ->
  ?executed_time:timestamp ->
  ?failure_description:string_ ->
  ?status:action_history_status ->
  ?failure_type:failure_type ->
  ?action_description:string_ ->
  ?action_type:action_type ->
  ?action_id:string_ ->
  unit ->
  managed_action_history_item

val make_load_balancer : ?name:resource_id -> unit -> load_balancer

val make_list_tags_for_resource_message :
  resource_arn:resource_arn -> unit -> list_tags_for_resource_message

val make_list_platform_versions_request :
  ?next_token:token ->
  ?max_records:platform_max_records ->
  ?filters:platform_filters ->
  unit ->
  list_platform_versions_request

val make_list_platform_branches_request :
  ?next_token:token ->
  ?max_records:platform_branch_max_records ->
  ?filters:search_filters ->
  unit ->
  list_platform_branches_request

val make_list_available_solution_stacks_result_message :
  ?solution_stack_details:available_solution_stack_details_list ->
  ?solution_stacks:available_solution_stack_names_list ->
  unit ->
  list_available_solution_stacks_result_message

val make_launch_template : ?id:resource_id -> unit -> launch_template
val make_launch_configuration : ?name:resource_id -> unit -> launch_configuration
val make_instance : ?id:resource_id -> unit -> instance

val make_instance_health_summary :
  ?severe:nullable_integer ->
  ?degraded:nullable_integer ->
  ?warning:nullable_integer ->
  ?info:nullable_integer ->
  ?ok:nullable_integer ->
  ?pending:nullable_integer ->
  ?unknown:nullable_integer ->
  ?no_data:nullable_integer ->
  unit ->
  instance_health_summary

val make_event_description :
  ?severity:event_severity ->
  ?request_id:request_id ->
  ?platform_arn:platform_arn ->
  ?environment_name:environment_name ->
  ?template_name:configuration_template_name ->
  ?version_label:version_label ->
  ?application_name:application_name ->
  ?message:event_message ->
  ?event_date:event_date ->
  unit ->
  event_description

val make_event_descriptions_message :
  ?next_token:token -> ?events:event_description_list -> unit -> event_descriptions_message

val make_auto_scaling_group : ?name:resource_id -> unit -> auto_scaling_group

val make_environment_resource_description :
  ?queues:queue_list ->
  ?triggers:trigger_list ->
  ?load_balancers:load_balancer_list ->
  ?launch_templates:launch_template_list ->
  ?launch_configurations:launch_configuration_list ->
  ?instances:instance_list ->
  ?auto_scaling_groups:auto_scaling_group_list ->
  ?environment_name:environment_name ->
  unit ->
  environment_resource_description

val make_environment_resource_descriptions_message :
  ?environment_resources:environment_resource_description ->
  unit ->
  environment_resource_descriptions_message

val make_environment_descriptions_message :
  ?next_token:token ->
  ?environments:environment_descriptions_list ->
  unit ->
  environment_descriptions_message

val make_disassociate_environment_operations_role_message :
  environment_name:environment_name -> unit -> disassociate_environment_operations_role_message

val make_describe_platform_version_request :
  ?platform_arn:platform_arn -> unit -> describe_platform_version_request

val make_describe_instances_health_request :
  ?next_token:next_token ->
  ?attribute_names:instances_health_attributes ->
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  unit ->
  describe_instances_health_request

val make_describe_events_message :
  ?next_token:token ->
  ?max_records:max_records ->
  ?end_time:time_filter_end ->
  ?start_time:time_filter_start ->
  ?severity:event_severity ->
  ?request_id:request_id ->
  ?platform_arn:platform_arn ->
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  ?template_name:configuration_template_name ->
  ?version_label:version_label ->
  ?application_name:application_name ->
  unit ->
  describe_events_message

val make_describe_environments_message :
  ?next_token:token ->
  ?max_records:max_records ->
  ?included_deleted_back_to:include_deleted_back_to ->
  ?include_deleted:include_deleted ->
  ?environment_names:environment_names_list ->
  ?environment_ids:environment_id_list ->
  ?version_label:version_label ->
  ?application_name:application_name ->
  unit ->
  describe_environments_message

val make_describe_environment_resources_message :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  unit ->
  describe_environment_resources_message

val make_describe_environment_managed_actions_request :
  ?status:action_status ->
  ?environment_id:string_ ->
  ?environment_name:string_ ->
  unit ->
  describe_environment_managed_actions_request

val make_describe_environment_managed_action_history_request :
  ?max_items:managed_action_history_max_items ->
  ?next_token:string_ ->
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  unit ->
  describe_environment_managed_action_history_request

val make_describe_environment_health_request :
  ?attribute_names:environment_health_attributes ->
  ?environment_id:environment_id ->
  ?environment_name:environment_name ->
  unit ->
  describe_environment_health_request

val make_describe_configuration_settings_message :
  ?environment_name:environment_name ->
  ?template_name:configuration_template_name ->
  application_name:application_name ->
  unit ->
  describe_configuration_settings_message

val make_configuration_settings_descriptions :
  ?configuration_settings:configuration_settings_description_list ->
  unit ->
  configuration_settings_descriptions

val make_describe_configuration_options_message :
  ?options:options_specifier_list ->
  ?platform_arn:platform_arn ->
  ?solution_stack_name:solution_stack_name ->
  ?environment_name:environment_name ->
  ?template_name:configuration_template_name ->
  ?application_name:application_name ->
  unit ->
  describe_configuration_options_message

val make_configuration_option_description :
  ?regex:option_restriction_regex ->
  ?max_length:option_restriction_max_length ->
  ?max_value:option_restriction_max_value ->
  ?min_value:option_restriction_min_value ->
  ?value_options:configuration_option_possible_values ->
  ?value_type:configuration_option_value_type ->
  ?user_defined:user_defined_option ->
  ?change_severity:configuration_option_severity ->
  ?default_value:configuration_option_default_value ->
  ?name:configuration_option_name ->
  ?namespace:option_namespace ->
  unit ->
  configuration_option_description

val make_configuration_options_description :
  ?options:configuration_option_descriptions_list ->
  ?platform_arn:platform_arn ->
  ?solution_stack_name:solution_stack_name ->
  unit ->
  configuration_options_description

val make_describe_applications_message :
  ?application_names:application_names_list -> unit -> describe_applications_message

val make_application_descriptions_message :
  ?applications:application_description_list -> unit -> application_descriptions_message

val make_describe_application_versions_message :
  ?next_token:token ->
  ?max_records:max_records ->
  ?version_labels:version_labels_list ->
  ?application_name:application_name ->
  unit ->
  describe_application_versions_message

val make_application_version_descriptions_message :
  ?next_token:token ->
  ?application_versions:application_version_description_list ->
  unit ->
  application_version_descriptions_message

val make_delete_platform_version_request :
  ?platform_arn:platform_arn -> unit -> delete_platform_version_request

val make_delete_environment_configuration_message :
  environment_name:environment_name ->
  application_name:application_name ->
  unit ->
  delete_environment_configuration_message

val make_delete_configuration_template_message :
  template_name:configuration_template_name ->
  application_name:application_name ->
  unit ->
  delete_configuration_template_message

val make_delete_application_version_message :
  ?delete_source_bundle:delete_source_bundle ->
  version_label:version_label ->
  application_name:application_name ->
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
  ?tags:tags ->
  ?option_settings:configuration_option_settings_list ->
  ?environment_name:environment_name ->
  platform_definition_bundle:s3_location ->
  platform_version:platform_version ->
  platform_name:platform_name ->
  unit ->
  create_platform_version_request

val make_create_environment_message :
  ?operations_role:operations_role ->
  ?options_to_remove:options_specifier_list ->
  ?option_settings:configuration_option_settings_list ->
  ?platform_arn:platform_arn ->
  ?solution_stack_name:solution_stack_name ->
  ?template_name:configuration_template_name ->
  ?version_label:version_label ->
  ?tags:tags ->
  ?tier:environment_tier ->
  ?cname_prefix:dns_cname_prefix ->
  ?description:description ->
  ?group_name:group_name ->
  ?environment_name:environment_name ->
  application_name:application_name ->
  unit ->
  create_environment_message

val make_create_configuration_template_message :
  ?tags:tags ->
  ?option_settings:configuration_option_settings_list ->
  ?description:description ->
  ?environment_id:environment_id ->
  ?source_configuration:source_configuration ->
  ?platform_arn:platform_arn ->
  ?solution_stack_name:solution_stack_name ->
  template_name:configuration_template_name ->
  application_name:application_name ->
  unit ->
  create_configuration_template_message

val make_build_configuration :
  ?timeout_in_minutes:boxed_int ->
  ?compute_type:compute_type ->
  ?artifact_name:string_ ->
  image:non_empty_string ->
  code_build_service_role:non_empty_string ->
  unit ->
  build_configuration

val make_create_application_version_message :
  ?tags:tags ->
  ?process:application_version_proccess ->
  ?auto_create_application:auto_create_application ->
  ?build_configuration:build_configuration ->
  ?source_bundle:s3_location ->
  ?source_build_information:source_build_information ->
  ?description:description ->
  version_label:version_label ->
  application_name:application_name ->
  unit ->
  create_application_version_message

val make_create_application_message :
  ?tags:tags ->
  ?resource_lifecycle_config:application_resource_lifecycle_config ->
  ?description:description ->
  application_name:application_name ->
  unit ->
  create_application_message

val make_compose_environments_message :
  ?version_labels:version_labels ->
  ?group_name:group_name ->
  ?application_name:application_name ->
  unit ->
  compose_environments_message

val make_check_dns_availability_result_message :
  ?fully_qualified_cnam_e:dns_cname ->
  ?available:cname_availability ->
  unit ->
  check_dns_availability_result_message

val make_check_dns_availability_message :
  cname_prefix:dns_cname_prefix -> unit -> check_dns_availability_message

val make_associate_environment_operations_role_message :
  operations_role:operations_role ->
  environment_name:environment_name ->
  unit ->
  associate_environment_operations_role_message

val make_apply_environment_managed_action_request :
  ?environment_id:string_ ->
  ?environment_name:string_ ->
  action_id:string_ ->
  unit ->
  apply_environment_managed_action_request

val make_abort_environment_update_message :
  ?environment_name:environment_name ->
  ?environment_id:environment_id ->
  unit ->
  abort_environment_update_message
