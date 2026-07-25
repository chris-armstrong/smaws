open Types

val make_workload_configuration :
  ?workload_name:workload_name ->
  ?tier:tier ->
  ?configuration:component_configuration ->
  unit ->
  workload_configuration

val make_add_workload_response :
  ?workload_id:workload_id ->
  ?workload_configuration:workload_configuration ->
  unit ->
  add_workload_response

val make_add_workload_request :
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  workload_configuration:workload_configuration ->
  unit ->
  add_workload_request

val make_application_component :
  ?component_name:component_name ->
  ?component_remarks:remarks ->
  ?resource_type:resource_type ->
  ?os_type:os_type ->
  ?tier:tier ->
  ?monitor:monitor ->
  ?detected_workload:detected_workload ->
  unit ->
  application_component

val make_application_info :
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  ?life_cycle:life_cycle ->
  ?ops_item_sns_topic_arn:ops_item_sns_topic_arn ->
  ?sns_notification_arn:sns_notification_arn ->
  ?ops_center_enabled:ops_center_enabled ->
  ?cwe_monitor_enabled:cwe_monitor_enabled ->
  ?remarks:remarks ->
  ?auto_config_enabled:auto_config_enabled ->
  ?discovery_type:discovery_type ->
  ?attach_missing_permission:attach_missing_permission ->
  unit ->
  application_info

val make_configuration_event :
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  ?monitored_resource_ar_n:configuration_event_monitored_resource_ar_n ->
  ?event_status:configuration_event_status ->
  ?event_resource_type:configuration_event_resource_type ->
  ?event_time:configuration_event_time ->
  ?event_detail:configuration_event_detail ->
  ?event_resource_name:configuration_event_resource_name ->
  unit ->
  configuration_event

val make_create_application_response :
  ?application_info:application_info -> unit -> create_application_response

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_application_request :
  ?resource_group_name:resource_group_name ->
  ?ops_center_enabled:ops_center_enabled ->
  ?cwe_monitor_enabled:cwe_monitor_enabled ->
  ?ops_item_sns_topic_arn:ops_item_sns_topic_arn ->
  ?sns_notification_arn:sns_notification_arn ->
  ?tags:tag_list ->
  ?auto_config_enabled:auto_config_enabled ->
  ?auto_create:auto_create ->
  ?grouping_type:grouping_type ->
  ?attach_missing_permission:attach_missing_permission ->
  unit ->
  create_application_request

val make_create_component_response : unit -> unit

val make_create_component_request :
  resource_group_name:resource_group_name ->
  component_name:custom_component_name ->
  resource_list:resource_list ->
  unit ->
  create_component_request

val make_log_pattern :
  ?pattern_set_name:log_pattern_set_name ->
  ?pattern_name:log_pattern_name ->
  ?pattern:log_pattern_regex ->
  ?rank:log_pattern_rank ->
  unit ->
  log_pattern

val make_create_log_pattern_response :
  ?log_pattern:log_pattern ->
  ?resource_group_name:resource_group_name ->
  unit ->
  create_log_pattern_response

val make_create_log_pattern_request :
  resource_group_name:resource_group_name ->
  pattern_set_name:log_pattern_set_name ->
  pattern_name:log_pattern_name ->
  pattern:log_pattern_regex ->
  rank:log_pattern_rank ->
  unit ->
  create_log_pattern_request

val make_delete_application_response : unit -> unit

val make_delete_application_request :
  resource_group_name:resource_group_name -> unit -> delete_application_request

val make_delete_component_response : unit -> unit

val make_delete_component_request :
  resource_group_name:resource_group_name ->
  component_name:custom_component_name ->
  unit ->
  delete_component_request

val make_delete_log_pattern_response : unit -> unit

val make_delete_log_pattern_request :
  resource_group_name:resource_group_name ->
  pattern_set_name:log_pattern_set_name ->
  pattern_name:log_pattern_name ->
  unit ->
  delete_log_pattern_request

val make_describe_application_response :
  ?application_info:application_info -> unit -> describe_application_response

val make_describe_application_request :
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  unit ->
  describe_application_request

val make_describe_component_response :
  ?application_component:application_component ->
  ?resource_list:resource_list ->
  unit ->
  describe_component_response

val make_describe_component_request :
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  unit ->
  describe_component_request

val make_describe_component_configuration_response :
  ?monitor:monitor ->
  ?tier:tier ->
  ?component_configuration:component_configuration ->
  unit ->
  describe_component_configuration_response

val make_describe_component_configuration_request :
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  unit ->
  describe_component_configuration_request

val make_describe_component_configuration_recommendation_response :
  ?component_configuration:component_configuration ->
  unit ->
  describe_component_configuration_recommendation_response

val make_describe_component_configuration_recommendation_request :
  ?workload_name:workload_name ->
  ?recommendation_type:recommendation_type ->
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  tier:tier ->
  unit ->
  describe_component_configuration_recommendation_request

val make_describe_log_pattern_response :
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  ?log_pattern:log_pattern ->
  unit ->
  describe_log_pattern_response

val make_describe_log_pattern_request :
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  pattern_set_name:log_pattern_set_name ->
  pattern_name:log_pattern_name ->
  unit ->
  describe_log_pattern_request

val make_observation :
  ?id:observation_id ->
  ?start_time:start_time ->
  ?end_time:end_time ->
  ?source_type:source_type ->
  ?source_ar_n:source_ar_n ->
  ?log_group:log_group ->
  ?line_time:line_time ->
  ?log_text:log_text ->
  ?log_filter:log_filter ->
  ?metric_namespace:metric_namespace ->
  ?metric_name:metric_name ->
  ?unit_:unit_ ->
  ?value:value ->
  ?cloud_watch_event_id:cloud_watch_event_id ->
  ?cloud_watch_event_source:cloud_watch_event_source ->
  ?cloud_watch_event_detail_type:cloud_watch_event_detail_type ->
  ?health_event_arn:health_event_arn ->
  ?health_service:health_service ->
  ?health_event_type_code:health_event_type_code ->
  ?health_event_type_category:health_event_type_category ->
  ?health_event_description:health_event_description ->
  ?code_deploy_deployment_id:code_deploy_deployment_id ->
  ?code_deploy_deployment_group:code_deploy_deployment_group ->
  ?code_deploy_state:code_deploy_state ->
  ?code_deploy_application:code_deploy_application ->
  ?code_deploy_instance_group_id:code_deploy_instance_group_id ->
  ?ec2_state:ec2_state ->
  ?rds_event_categories:rds_event_categories ->
  ?rds_event_message:rds_event_message ->
  ?s3_event_name:s3_event_name ->
  ?states_execution_arn:states_execution_arn ->
  ?states_arn:states_arn ->
  ?states_status:states_status ->
  ?states_input:states_input ->
  ?ebs_event:ebs_event ->
  ?ebs_result:ebs_result ->
  ?ebs_cause:ebs_cause ->
  ?ebs_request_id:ebs_request_id ->
  ?x_ray_fault_percent:x_ray_fault_percent ->
  ?x_ray_throttle_percent:x_ray_throttle_percent ->
  ?x_ray_error_percent:x_ray_error_percent ->
  ?x_ray_request_count:x_ray_request_count ->
  ?x_ray_request_average_latency:x_ray_request_average_latency ->
  ?x_ray_node_name:x_ray_node_name ->
  ?x_ray_node_type:x_ray_node_type ->
  unit ->
  observation

val make_describe_observation_response :
  ?observation:observation -> unit -> describe_observation_response

val make_describe_observation_request :
  ?account_id:account_id -> observation_id:observation_id -> unit -> describe_observation_request

val make_problem :
  ?id:problem_id ->
  ?title:title ->
  ?short_name:short_name ->
  ?insights:insights ->
  ?status:status ->
  ?affected_resource:affected_resource ->
  ?start_time:start_time ->
  ?end_time:end_time ->
  ?severity_level:severity_level ->
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  ?feedback:feedback ->
  ?recurring_count:recurring_count ->
  ?last_recurrence_time:last_recurrence_time ->
  ?visibility:visibility ->
  ?resolution_method:resolution_method ->
  unit ->
  problem

val make_describe_problem_response :
  ?problem:problem ->
  ?sns_notification_arn:sns_notification_arn ->
  unit ->
  describe_problem_response

val make_describe_problem_request :
  ?account_id:account_id -> problem_id:problem_id -> unit -> describe_problem_request

val make_related_observations : ?observation_list:observation_list -> unit -> related_observations

val make_describe_problem_observations_response :
  ?related_observations:related_observations -> unit -> describe_problem_observations_response

val make_describe_problem_observations_request :
  ?account_id:account_id -> problem_id:problem_id -> unit -> describe_problem_observations_request

val make_describe_workload_response :
  ?workload_id:workload_id ->
  ?workload_remarks:remarks ->
  ?workload_configuration:workload_configuration ->
  unit ->
  describe_workload_response

val make_describe_workload_request :
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  workload_id:workload_id ->
  unit ->
  describe_workload_request

val make_update_workload_response :
  ?workload_id:workload_id ->
  ?workload_configuration:workload_configuration ->
  unit ->
  update_workload_response

val make_update_workload_request :
  ?workload_id:workload_id ->
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  workload_configuration:workload_configuration ->
  unit ->
  update_workload_request

val make_update_problem_response : unit -> unit

val make_update_problem_request :
  ?update_status:update_status ->
  ?visibility:visibility ->
  problem_id:problem_id ->
  unit ->
  update_problem_request

val make_update_log_pattern_response :
  ?resource_group_name:resource_group_name ->
  ?log_pattern:log_pattern ->
  unit ->
  update_log_pattern_response

val make_update_log_pattern_request :
  ?pattern:log_pattern_regex ->
  ?rank:log_pattern_rank ->
  resource_group_name:resource_group_name ->
  pattern_set_name:log_pattern_set_name ->
  pattern_name:log_pattern_name ->
  unit ->
  update_log_pattern_request

val make_update_component_configuration_response : unit -> unit

val make_update_component_configuration_request :
  ?monitor:monitor ->
  ?tier:tier ->
  ?component_configuration:component_configuration ->
  ?auto_config_enabled:auto_config_enabled ->
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  unit ->
  update_component_configuration_request

val make_update_component_response : unit -> unit

val make_update_component_request :
  ?new_component_name:custom_component_name ->
  ?resource_list:resource_list ->
  resource_group_name:resource_group_name ->
  component_name:custom_component_name ->
  unit ->
  update_component_request

val make_update_application_response :
  ?application_info:application_info -> unit -> update_application_response

val make_update_application_request :
  ?ops_center_enabled:ops_center_enabled ->
  ?cwe_monitor_enabled:cwe_monitor_enabled ->
  ?ops_item_sns_topic_arn:ops_item_sns_topic_arn ->
  ?sns_notification_arn:sns_notification_arn ->
  ?remove_sns_topic:remove_sns_topic ->
  ?auto_config_enabled:auto_config_enabled ->
  ?attach_missing_permission:attach_missing_permission ->
  resource_group_name:resource_group_name ->
  unit ->
  update_application_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_remove_workload_response : unit -> unit

val make_remove_workload_request :
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  workload_id:workload_id ->
  unit ->
  remove_workload_request

val make_workload :
  ?workload_id:workload_id ->
  ?component_name:component_name ->
  ?workload_name:workload_name ->
  ?tier:tier ->
  ?workload_remarks:remarks ->
  ?missing_workload_config:missing_workload_config ->
  unit ->
  workload

val make_list_workloads_response :
  ?workload_list:workload_list -> ?next_token:pagination_token -> unit -> list_workloads_response

val make_list_workloads_request :
  ?max_results:max_entities ->
  ?next_token:pagination_token ->
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  component_name:component_name ->
  unit ->
  list_workloads_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_problems_response :
  ?problem_list:problem_list ->
  ?next_token:pagination_token ->
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  unit ->
  list_problems_response

val make_list_problems_request :
  ?account_id:account_id ->
  ?resource_group_name:resource_group_name ->
  ?start_time:start_time ->
  ?end_time:end_time ->
  ?max_results:max_entities ->
  ?next_token:pagination_token ->
  ?component_name:component_name ->
  ?visibility:visibility ->
  unit ->
  list_problems_request

val make_list_log_pattern_sets_response :
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  ?log_pattern_sets:log_pattern_set_list ->
  ?next_token:pagination_token ->
  unit ->
  list_log_pattern_sets_response

val make_list_log_pattern_sets_request :
  ?max_results:max_entities ->
  ?next_token:pagination_token ->
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  unit ->
  list_log_pattern_sets_request

val make_list_log_patterns_response :
  ?resource_group_name:resource_group_name ->
  ?account_id:account_id ->
  ?log_patterns:log_pattern_list ->
  ?next_token:pagination_token ->
  unit ->
  list_log_patterns_response

val make_list_log_patterns_request :
  ?pattern_set_name:log_pattern_set_name ->
  ?max_results:max_entities ->
  ?next_token:pagination_token ->
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  unit ->
  list_log_patterns_request

val make_list_configuration_history_response :
  ?event_list:configuration_event_list ->
  ?next_token:pagination_token ->
  unit ->
  list_configuration_history_response

val make_list_configuration_history_request :
  ?resource_group_name:resource_group_name ->
  ?start_time:start_time ->
  ?end_time:end_time ->
  ?event_status:configuration_event_status ->
  ?max_results:max_entities ->
  ?next_token:pagination_token ->
  ?account_id:account_id ->
  unit ->
  list_configuration_history_request

val make_list_components_response :
  ?application_component_list:application_component_list ->
  ?next_token:pagination_token ->
  unit ->
  list_components_response

val make_list_components_request :
  ?max_results:max_entities ->
  ?next_token:pagination_token ->
  ?account_id:account_id ->
  resource_group_name:resource_group_name ->
  unit ->
  list_components_request

val make_list_applications_response :
  ?application_info_list:application_info_list ->
  ?next_token:pagination_token ->
  unit ->
  list_applications_response

val make_list_applications_request :
  ?max_results:max_entities ->
  ?next_token:pagination_token ->
  ?account_id:account_id ->
  unit ->
  list_applications_request
