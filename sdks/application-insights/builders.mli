open Types

val make_workload :
  ?missing_workload_config:missing_workload_config ->
  ?workload_remarks:remarks ->
  ?tier:tier ->
  ?workload_name:workload_name ->
  ?component_name:component_name ->
  ?workload_id:workload_id ->
  unit ->
  workload

val make_workload_configuration :
  ?configuration:component_configuration ->
  ?tier:tier ->
  ?workload_name:workload_name ->
  unit ->
  workload_configuration

val make_update_workload_response :
  ?workload_configuration:workload_configuration ->
  ?workload_id:workload_id ->
  unit ->
  update_workload_response

val make_update_workload_request :
  ?workload_id:workload_id ->
  workload_configuration:workload_configuration ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  update_workload_request

val make_update_problem_response : unit -> unit

val make_update_problem_request :
  ?visibility:visibility ->
  ?update_status:update_status ->
  problem_id:problem_id ->
  unit ->
  update_problem_request

val make_log_pattern :
  ?rank:log_pattern_rank ->
  ?pattern:log_pattern_regex ->
  ?pattern_name:log_pattern_name ->
  ?pattern_set_name:log_pattern_set_name ->
  unit ->
  log_pattern

val make_update_log_pattern_response :
  ?log_pattern:log_pattern ->
  ?resource_group_name:resource_group_name ->
  unit ->
  update_log_pattern_response

val make_update_log_pattern_request :
  ?rank:log_pattern_rank ->
  ?pattern:log_pattern_regex ->
  pattern_name:log_pattern_name ->
  pattern_set_name:log_pattern_set_name ->
  resource_group_name:resource_group_name ->
  unit ->
  update_log_pattern_request

val make_update_component_response : unit -> unit

val make_update_component_request :
  ?resource_list:resource_list ->
  ?new_component_name:custom_component_name ->
  component_name:custom_component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  update_component_request

val make_update_component_configuration_response : unit -> unit

val make_update_component_configuration_request :
  ?auto_config_enabled:auto_config_enabled ->
  ?component_configuration:component_configuration ->
  ?tier:tier ->
  ?monitor:monitor ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  update_component_configuration_request

val make_application_info :
  ?attach_missing_permission:attach_missing_permission ->
  ?discovery_type:discovery_type ->
  ?auto_config_enabled:auto_config_enabled ->
  ?remarks:remarks ->
  ?cwe_monitor_enabled:cwe_monitor_enabled ->
  ?ops_center_enabled:ops_center_enabled ->
  ?sns_notification_arn:sns_notification_arn ->
  ?ops_item_sns_topic_arn:ops_item_sns_topic_arn ->
  ?life_cycle:life_cycle ->
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  unit ->
  application_info

val make_update_application_response :
  ?application_info:application_info -> unit -> update_application_response

val make_update_application_request :
  ?attach_missing_permission:attach_missing_permission ->
  ?auto_config_enabled:auto_config_enabled ->
  ?remove_sns_topic:remove_sns_topic ->
  ?sns_notification_arn:sns_notification_arn ->
  ?ops_item_sns_topic_arn:ops_item_sns_topic_arn ->
  ?cwe_monitor_enabled:cwe_monitor_enabled ->
  ?ops_center_enabled:ops_center_enabled ->
  resource_group_name:resource_group_name ->
  unit ->
  update_application_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_remove_workload_response : unit -> unit

val make_remove_workload_request :
  workload_id:workload_id ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  remove_workload_request

val make_observation :
  ?x_ray_node_type:x_ray_node_type ->
  ?x_ray_node_name:x_ray_node_name ->
  ?x_ray_request_average_latency:x_ray_request_average_latency ->
  ?x_ray_request_count:x_ray_request_count ->
  ?x_ray_error_percent:x_ray_error_percent ->
  ?x_ray_throttle_percent:x_ray_throttle_percent ->
  ?x_ray_fault_percent:x_ray_fault_percent ->
  ?ebs_request_id:ebs_request_id ->
  ?ebs_cause:ebs_cause ->
  ?ebs_result:ebs_result ->
  ?ebs_event:ebs_event ->
  ?states_input:states_input ->
  ?states_status:states_status ->
  ?states_arn:states_arn ->
  ?states_execution_arn:states_execution_arn ->
  ?s3_event_name:s3_event_name ->
  ?rds_event_message:rds_event_message ->
  ?rds_event_categories:rds_event_categories ->
  ?ec2_state:ec2_state ->
  ?code_deploy_instance_group_id:code_deploy_instance_group_id ->
  ?code_deploy_application:code_deploy_application ->
  ?code_deploy_state:code_deploy_state ->
  ?code_deploy_deployment_group:code_deploy_deployment_group ->
  ?code_deploy_deployment_id:code_deploy_deployment_id ->
  ?health_event_description:health_event_description ->
  ?health_event_type_category:health_event_type_category ->
  ?health_event_type_code:health_event_type_code ->
  ?health_service:health_service ->
  ?health_event_arn:health_event_arn ->
  ?cloud_watch_event_detail_type:cloud_watch_event_detail_type ->
  ?cloud_watch_event_source:cloud_watch_event_source ->
  ?cloud_watch_event_id:cloud_watch_event_id ->
  ?value:value ->
  ?unit_:unit_ ->
  ?metric_name:metric_name ->
  ?metric_namespace:metric_namespace ->
  ?log_filter:log_filter ->
  ?log_text:log_text ->
  ?line_time:line_time ->
  ?log_group:log_group ->
  ?source_ar_n:source_ar_n ->
  ?source_type:source_type ->
  ?end_time:end_time ->
  ?start_time:start_time ->
  ?id:observation_id ->
  unit ->
  observation

val make_related_observations : ?observation_list:observation_list -> unit -> related_observations

val make_problem :
  ?resolution_method:resolution_method ->
  ?visibility:visibility ->
  ?last_recurrence_time:last_recurrence_time ->
  ?recurring_count:recurring_count ->
  ?feedback:feedback ->
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  ?severity_level:severity_level ->
  ?end_time:end_time ->
  ?start_time:start_time ->
  ?affected_resource:affected_resource ->
  ?status:status ->
  ?insights:insights ->
  ?short_name:short_name ->
  ?title:title ->
  ?id:problem_id ->
  unit ->
  problem

val make_list_workloads_response :
  ?next_token:pagination_token -> ?workload_list:workload_list -> unit -> list_workloads_response

val make_list_workloads_request :
  ?account_id:account_id ->
  ?next_token:pagination_token ->
  ?max_results:max_entities ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  list_workloads_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_problems_response :
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  ?next_token:pagination_token ->
  ?problem_list:problem_list ->
  unit ->
  list_problems_response

val make_list_problems_request :
  ?visibility:visibility ->
  ?component_name:component_name ->
  ?next_token:pagination_token ->
  ?max_results:max_entities ->
  ?end_time:end_time ->
  ?start_time:start_time ->
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  unit ->
  list_problems_request

val make_list_log_patterns_response :
  ?next_token:pagination_token ->
  ?log_patterns:log_pattern_list ->
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  unit ->
  list_log_patterns_response

val make_list_log_patterns_request :
  ?account_id:account_id ->
  ?next_token:pagination_token ->
  ?max_results:max_entities ->
  ?pattern_set_name:log_pattern_set_name ->
  resource_group_name:resource_group_name ->
  unit ->
  list_log_patterns_request

val make_list_log_pattern_sets_response :
  ?next_token:pagination_token ->
  ?log_pattern_sets:log_pattern_set_list ->
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  unit ->
  list_log_pattern_sets_response

val make_list_log_pattern_sets_request :
  ?account_id:account_id ->
  ?next_token:pagination_token ->
  ?max_results:max_entities ->
  resource_group_name:resource_group_name ->
  unit ->
  list_log_pattern_sets_request

val make_configuration_event :
  ?event_resource_name:configuration_event_resource_name ->
  ?event_detail:configuration_event_detail ->
  ?event_time:configuration_event_time ->
  ?event_resource_type:configuration_event_resource_type ->
  ?event_status:configuration_event_status ->
  ?monitored_resource_ar_n:configuration_event_monitored_resource_ar_n ->
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  unit ->
  configuration_event

val make_list_configuration_history_response :
  ?next_token:pagination_token ->
  ?event_list:configuration_event_list ->
  unit ->
  list_configuration_history_response

val make_list_configuration_history_request :
  ?account_id:account_id ->
  ?next_token:pagination_token ->
  ?max_results:max_entities ->
  ?event_status:configuration_event_status ->
  ?end_time:end_time ->
  ?start_time:start_time ->
  ?resource_group_name:resource_group_name ->
  unit ->
  list_configuration_history_request

val make_application_component :
  ?detected_workload:detected_workload ->
  ?monitor:monitor ->
  ?tier:tier ->
  ?os_type:os_type ->
  ?resource_type:resource_type ->
  ?component_remarks:remarks ->
  ?component_name:component_name ->
  unit ->
  application_component

val make_list_components_response :
  ?next_token:pagination_token ->
  ?application_component_list:application_component_list ->
  unit ->
  list_components_response

val make_list_components_request :
  ?account_id:account_id ->
  ?next_token:pagination_token ->
  ?max_results:max_entities ->
  resource_group_name:resource_group_name ->
  unit ->
  list_components_request

val make_list_applications_response :
  ?next_token:pagination_token ->
  ?application_info_list:application_info_list ->
  unit ->
  list_applications_response

val make_list_applications_request :
  ?account_id:account_id ->
  ?next_token:pagination_token ->
  ?max_results:max_entities ->
  unit ->
  list_applications_request

val make_describe_workload_response :
  ?workload_configuration:workload_configuration ->
  ?workload_remarks:remarks ->
  ?workload_id:workload_id ->
  unit ->
  describe_workload_response

val make_describe_workload_request :
  ?account_id:account_id ->
  workload_id:workload_id ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  describe_workload_request

val make_describe_problem_observations_response :
  ?related_observations:related_observations -> unit -> describe_problem_observations_response

val make_describe_problem_observations_request :
  ?account_id:account_id -> problem_id:problem_id -> unit -> describe_problem_observations_request

val make_describe_problem_response :
  ?sns_notification_arn:sns_notification_arn ->
  ?problem:problem ->
  unit ->
  describe_problem_response

val make_describe_problem_request :
  ?account_id:account_id -> problem_id:problem_id -> unit -> describe_problem_request

val make_describe_observation_response :
  ?observation:observation -> unit -> describe_observation_response

val make_describe_observation_request :
  ?account_id:account_id -> observation_id:observation_id -> unit -> describe_observation_request

val make_describe_log_pattern_response :
  ?log_pattern:log_pattern ->
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  unit ->
  describe_log_pattern_response

val make_describe_log_pattern_request :
  ?account_id:account_id ->
  pattern_name:log_pattern_name ->
  pattern_set_name:log_pattern_set_name ->
  resource_group_name:resource_group_name ->
  unit ->
  describe_log_pattern_request

val make_describe_component_configuration_recommendation_response :
  ?component_configuration:component_configuration ->
  unit ->
  describe_component_configuration_recommendation_response

val make_describe_component_configuration_recommendation_request :
  ?recommendation_type:recommendation_type ->
  ?workload_name:workload_name ->
  tier:tier ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  describe_component_configuration_recommendation_request

val make_describe_component_configuration_response :
  ?component_configuration:component_configuration ->
  ?tier:tier ->
  ?monitor:monitor ->
  unit ->
  describe_component_configuration_response

val make_describe_component_configuration_request :
  ?account_id:account_id ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  describe_component_configuration_request

val make_describe_component_response :
  ?resource_list:resource_list ->
  ?application_component:application_component ->
  unit ->
  describe_component_response

val make_describe_component_request :
  ?account_id:account_id ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  describe_component_request

val make_describe_application_response :
  ?application_info:application_info -> unit -> describe_application_response

val make_describe_application_request :
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  unit ->
  describe_application_request

val make_delete_log_pattern_response : unit -> unit

val make_delete_log_pattern_request :
  pattern_name:log_pattern_name ->
  pattern_set_name:log_pattern_set_name ->
  resource_group_name:resource_group_name ->
  unit ->
  delete_log_pattern_request

val make_delete_component_response : unit -> unit

val make_delete_component_request :
  component_name:custom_component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  delete_component_request

val make_delete_application_response : unit -> unit

val make_delete_application_request :
  resource_group_name:resource_group_name -> unit -> delete_application_request

val make_create_log_pattern_response :
  ?resource_group_name:resource_group_name ->
  ?log_pattern:log_pattern ->
  unit ->
  create_log_pattern_response

val make_create_log_pattern_request :
  rank:log_pattern_rank ->
  pattern:log_pattern_regex ->
  pattern_name:log_pattern_name ->
  pattern_set_name:log_pattern_set_name ->
  resource_group_name:resource_group_name ->
  unit ->
  create_log_pattern_request

val make_create_component_response : unit -> unit

val make_create_component_request :
  resource_list:resource_list ->
  component_name:custom_component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  create_component_request

val make_create_application_response :
  ?application_info:application_info -> unit -> create_application_response

val make_create_application_request :
  ?attach_missing_permission:attach_missing_permission ->
  ?grouping_type:grouping_type ->
  ?auto_create:auto_create ->
  ?auto_config_enabled:auto_config_enabled ->
  ?tags:tag_list ->
  ?sns_notification_arn:sns_notification_arn ->
  ?ops_item_sns_topic_arn:ops_item_sns_topic_arn ->
  ?cwe_monitor_enabled:cwe_monitor_enabled ->
  ?ops_center_enabled:ops_center_enabled ->
  ?resource_group_name:resource_group_name ->
  unit ->
  create_application_request

val make_add_workload_response :
  ?workload_configuration:workload_configuration ->
  ?workload_id:workload_id ->
  unit ->
  add_workload_response

val make_add_workload_request :
  workload_configuration:workload_configuration ->
  component_name:component_name ->
  resource_group_name:resource_group_name ->
  unit ->
  add_workload_request
