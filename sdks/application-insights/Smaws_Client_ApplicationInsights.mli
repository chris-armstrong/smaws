(** Application Insights client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
