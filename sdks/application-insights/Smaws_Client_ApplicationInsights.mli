(** Application Insights client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module ListApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the IDs of the applications that you are monitoring. \n"]

module ListComponents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_components_request ->
    ( list_components_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_components_request ->
    ( list_components_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the auto-grouped, standalone, and custom components of the application.\n"]

module ListConfigurationHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_configuration_history_request ->
    ( list_configuration_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_configuration_history_request ->
    ( list_configuration_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists the INFO, WARN, and ERROR events for periodic configuration updates performed by \
   Application Insights. Examples of events represented are: \n\n\
  \ {ul\n\
  \       {-  INFO: creating a new alarm or updating an alarm threshold.\n\
  \           \n\
  \            }\n\
  \       {-  WARN: alarm not created due to insufficient data points used to predict thresholds.\n\
  \           \n\
  \            }\n\
  \       {-  ERROR: alarm not created due to permission errors or exceeding quotas. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module ListLogPatterns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_log_patterns_request ->
    ( list_log_patterns_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_log_patterns_request ->
    ( list_log_patterns_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the log patterns in the specific log [LogPatternSet].\n"]

module ListLogPatternSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_log_pattern_sets_request ->
    ( list_log_pattern_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_log_pattern_sets_request ->
    ( list_log_pattern_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the log pattern sets in the specific application.\n"]

module ListProblems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_problems_request ->
    ( list_problems_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_problems_request ->
    ( list_problems_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the problems with your application.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve a list of the tags (keys and values) that are associated with a specified application. \
   A {i tag} is a label that you optionally define and associate with an application. Each tag \
   consists of a required {i tag key} and an optional associated {i tag value}. A tag key is a \
   general label that acts as a category for more specific tag values. A tag value acts as a \
   descriptor within a tag key.\n"]

module ListWorkloads : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workloads_request ->
    ( list_workloads_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workloads_request ->
    ( list_workloads_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the workloads that are configured on a given component.\n"]

module RemoveWorkload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_workload_request ->
    ( remove_workload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_workload_request ->
    ( remove_workload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Remove workload from a component.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Add one or more tags (keys and values) to a specified application. A {i tag} is a label that \
   you optionally define and associate with an application. Tags can help you categorize and \
   manage application in different ways, such as by purpose, owner, environment, or other \
   criteria. \n\n\
  \ Each tag consists of a required {i tag key} and an associated {i tag value}, both of which you \
   define. A tag key is a general label that acts as a category for more specific tag values. A \
   tag value acts as a descriptor within a tag key.\n\
  \ "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Remove one or more tags (keys and values) from a specified application.\n"]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the application.\n"]

module UpdateComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_component_request ->
    ( update_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_component_request ->
    ( update_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the custom component name and/or the list of resources that make up the component.\n"]

module UpdateComponentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_component_configuration_request ->
    ( update_component_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_component_configuration_request ->
    ( update_component_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the monitoring configurations for the component. The configuration input parameter is \
   an escaped JSON of the configuration and should match the schema of what is returned by \
   [DescribeComponentConfigurationRecommendation]. \n"]

module UpdateLogPattern : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_log_pattern_request ->
    ( update_log_pattern_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_log_pattern_request ->
    ( update_log_pattern_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a log pattern to a [LogPatternSet].\n"]

module UpdateProblem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_problem_request ->
    ( update_problem_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_problem_request ->
    ( update_problem_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the visibility of the problem or specifies the problem as [RESOLVED].\n"]

module UpdateWorkload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workload_request ->
    ( update_workload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workload_request ->
    ( update_workload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a workload to a component. Each component can have at most five workloads.\n"]

module DescribeWorkload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_workload_request ->
    ( describe_workload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_workload_request ->
    ( describe_workload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a workload and its configuration.\n"]

module DescribeProblemObservations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_problem_observations_request ->
    ( describe_problem_observations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_problem_observations_request ->
    ( describe_problem_observations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the anomalies or errors associated with the problem.\n"]

module DescribeProblem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_problem_request ->
    ( describe_problem_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_problem_request ->
    ( describe_problem_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an application problem.\n"]

module DescribeObservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_observation_request ->
    ( describe_observation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_observation_request ->
    ( describe_observation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes an anomaly or error with the application.\n"]

module DescribeLogPattern : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_log_pattern_request ->
    ( describe_log_pattern_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_log_pattern_request ->
    ( describe_log_pattern_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describe a specific log pattern from a [LogPatternSet].\n"]

module DescribeComponentConfigurationRecommendation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_component_configuration_recommendation_request ->
    ( describe_component_configuration_recommendation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_component_configuration_recommendation_request ->
    ( describe_component_configuration_recommendation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the recommended monitoring configuration of the component.\n"]

module DescribeComponentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_component_configuration_request ->
    ( describe_component_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_component_configuration_request ->
    ( describe_component_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the monitoring configuration of the component.\n"]

module DescribeComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_component_request ->
    ( describe_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_component_request ->
    ( describe_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a component and lists the resources that are grouped together in a component.\n"]

module DescribeApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the application.\n"]

module DeleteLogPattern : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_log_pattern_request ->
    ( delete_log_pattern_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_log_pattern_request ->
    ( delete_log_pattern_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes the specified log pattern from a [LogPatternSet].\n"]

module DeleteComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_component_request ->
    ( delete_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_component_request ->
    ( delete_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Ungroups a custom component. When you ungroup custom components, all applicable monitors that \
   are set up for the component are removed and the instances revert to their standalone status.\n"]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified application from monitoring. Does not delete the application.\n"]

module CreateLogPattern : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_log_pattern_request ->
    ( create_log_pattern_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_log_pattern_request ->
    ( create_log_pattern_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds an log pattern to a [LogPatternSet].\n"]

module CreateComponent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_component_request ->
    ( create_component_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_component_request ->
    ( create_component_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a custom component by grouping similar standalone instances to monitor.\n"]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TagsAlreadyExistException of tags_already_exist_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagsAlreadyExistException of tags_already_exist_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TagsAlreadyExistException of tags_already_exist_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds an application that is created from a resource group.\n"]

(** {1:Serialization and Deserialization} *)
module AddWorkload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_workload_request ->
    ( add_workload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_workload_request ->
    ( add_workload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a workload to a component. Each component can have at most five workloads.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
