(** Application Auto Scaling client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_predefined_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:metric_type ->
  unit ->
  predefined_metric_specification

val make_metric_dimension :
  value:metric_dimension_value -> name:metric_dimension_name -> unit -> metric_dimension

val make_target_tracking_metric_dimension :
  value:target_tracking_metric_dimension_value ->
  name:target_tracking_metric_dimension_name ->
  unit ->
  target_tracking_metric_dimension

val make_target_tracking_metric :
  ?namespace:target_tracking_metric_namespace ->
  ?metric_name:target_tracking_metric_name ->
  ?dimensions:target_tracking_metric_dimensions ->
  unit ->
  target_tracking_metric

val make_target_tracking_metric_stat :
  ?unit_:target_tracking_metric_unit ->
  stat:xml_string ->
  metric:target_tracking_metric ->
  unit ->
  target_tracking_metric_stat

val make_target_tracking_metric_data_query :
  ?return_data:return_data ->
  ?metric_stat:target_tracking_metric_stat ->
  ?label:xml_string ->
  ?expression:expression ->
  id:id ->
  unit ->
  target_tracking_metric_data_query

val make_customized_metric_specification :
  ?metrics:target_tracking_metric_data_queries ->
  ?unit_:metric_unit ->
  ?statistic:metric_statistic ->
  ?dimensions:metric_dimensions ->
  ?namespace:metric_namespace ->
  ?metric_name:metric_name ->
  unit ->
  customized_metric_specification

val make_target_tracking_scaling_policy_configuration :
  ?disable_scale_in:disable_scale_in ->
  ?scale_in_cooldown:cooldown ->
  ?scale_out_cooldown:cooldown ->
  ?customized_metric_specification:customized_metric_specification ->
  ?predefined_metric_specification:predefined_metric_specification ->
  target_value:metric_scale ->
  unit ->
  target_tracking_scaling_policy_configuration

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_map -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_suspended_state :
  ?scheduled_scaling_suspended:scaling_suspended ->
  ?dynamic_scaling_out_suspended:scaling_suspended ->
  ?dynamic_scaling_in_suspended:scaling_suspended ->
  unit ->
  suspended_state

val make_step_adjustment :
  ?metric_interval_upper_bound:metric_scale ->
  ?metric_interval_lower_bound:metric_scale ->
  scaling_adjustment:scaling_adjustment ->
  unit ->
  step_adjustment

val make_step_scaling_policy_configuration :
  ?metric_aggregation_type:metric_aggregation_type ->
  ?cooldown:cooldown ->
  ?min_adjustment_magnitude:min_adjustment_magnitude ->
  ?step_adjustments:step_adjustments ->
  ?adjustment_type:adjustment_type ->
  unit ->
  step_scaling_policy_configuration

val make_scalable_target_action :
  ?max_capacity:resource_capacity ->
  ?min_capacity:resource_capacity ->
  unit ->
  scalable_target_action

val make_scheduled_action :
  ?scalable_target_action:scalable_target_action ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?scalable_dimension:scalable_dimension ->
  ?timezone:resource_id_max_len1600 ->
  creation_time:timestamp_type ->
  resource_id:resource_id_max_len1600 ->
  schedule:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  scheduled_action_ar_n:resource_id_max_len1600 ->
  scheduled_action_name:scheduled_action_name ->
  unit ->
  scheduled_action

val make_predictive_scaling_predefined_metric_pair_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_metric_pair_specification

val make_predictive_scaling_predefined_scaling_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_scaling_metric_specification

val make_predictive_scaling_predefined_load_metric_specification :
  ?resource_label:resource_label ->
  predefined_metric_type:predictive_scaling_metric_type ->
  unit ->
  predictive_scaling_predefined_load_metric_specification

val make_predictive_scaling_metric_dimension :
  value:predictive_scaling_metric_dimension_value ->
  name:predictive_scaling_metric_dimension_name ->
  unit ->
  predictive_scaling_metric_dimension

val make_predictive_scaling_metric :
  ?namespace:predictive_scaling_metric_namespace ->
  ?metric_name:predictive_scaling_metric_name ->
  ?dimensions:predictive_scaling_metric_dimensions ->
  unit ->
  predictive_scaling_metric

val make_predictive_scaling_metric_stat :
  ?unit_:predictive_scaling_metric_unit ->
  stat:xml_string ->
  metric:predictive_scaling_metric ->
  unit ->
  predictive_scaling_metric_stat

val make_predictive_scaling_metric_data_query :
  ?return_data:return_data ->
  ?label:xml_string ->
  ?metric_stat:predictive_scaling_metric_stat ->
  ?expression:expression ->
  id:id ->
  unit ->
  predictive_scaling_metric_data_query

val make_predictive_scaling_customized_metric_specification :
  metric_data_queries:predictive_scaling_metric_data_queries ->
  unit ->
  predictive_scaling_customized_metric_specification

val make_predictive_scaling_metric_specification :
  ?customized_capacity_metric_specification:predictive_scaling_customized_metric_specification ->
  ?customized_load_metric_specification:predictive_scaling_customized_metric_specification ->
  ?customized_scaling_metric_specification:predictive_scaling_customized_metric_specification ->
  ?predefined_load_metric_specification:predictive_scaling_predefined_load_metric_specification ->
  ?predefined_scaling_metric_specification:
    predictive_scaling_predefined_scaling_metric_specification ->
  ?predefined_metric_pair_specification:predictive_scaling_predefined_metric_pair_specification ->
  target_value:metric_scale ->
  unit ->
  predictive_scaling_metric_specification

val make_predictive_scaling_policy_configuration :
  ?max_capacity_buffer:predictive_scaling_max_capacity_buffer ->
  ?max_capacity_breach_behavior:predictive_scaling_max_capacity_breach_behavior ->
  ?scheduling_buffer_time:predictive_scaling_scheduling_buffer_time ->
  ?mode:predictive_scaling_mode ->
  metric_specifications:predictive_scaling_metric_specifications ->
  unit ->
  predictive_scaling_policy_configuration

val make_alarm : alarm_ar_n:resource_id -> alarm_name:resource_id -> unit -> alarm

val make_scaling_policy :
  ?alarms:alarms ->
  ?predictive_scaling_policy_configuration:predictive_scaling_policy_configuration ->
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  ?step_scaling_policy_configuration:step_scaling_policy_configuration ->
  creation_time:timestamp_type ->
  policy_type:policy_type ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  policy_name:policy_name ->
  policy_ar_n:resource_id_max_len1600 ->
  unit ->
  scaling_policy

val make_not_scaled_reason :
  ?current_capacity:resource_capacity ->
  ?min_capacity:resource_capacity ->
  ?max_capacity:resource_capacity ->
  code:xml_string ->
  unit ->
  not_scaled_reason

val make_scaling_activity :
  ?not_scaled_reasons:not_scaled_reasons ->
  ?details:xml_string ->
  ?status_message:xml_string ->
  ?end_time:timestamp_type ->
  status_code:scaling_activity_status_code ->
  start_time:timestamp_type ->
  cause:xml_string ->
  description:xml_string ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  activity_id:resource_id ->
  unit ->
  scaling_activity

val make_scalable_target :
  ?scalable_target_ar_n:xml_string ->
  ?suspended_state:suspended_state ->
  ?predicted_capacity:resource_capacity ->
  creation_time:timestamp_type ->
  role_ar_n:resource_id_max_len1600 ->
  max_capacity:resource_capacity ->
  min_capacity:resource_capacity ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  scalable_target

val make_register_scalable_target_response :
  ?scalable_target_ar_n:xml_string -> unit -> register_scalable_target_response

val make_register_scalable_target_request :
  ?tags:tag_map ->
  ?suspended_state:suspended_state ->
  ?role_ar_n:resource_id_max_len1600 ->
  ?max_capacity:resource_capacity ->
  ?min_capacity:resource_capacity ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  register_scalable_target_request

val make_put_scheduled_action_response : unit -> unit

val make_put_scheduled_action_request :
  ?scalable_target_action:scalable_target_action ->
  ?end_time:timestamp_type ->
  ?start_time:timestamp_type ->
  ?timezone:resource_id_max_len1600 ->
  ?schedule:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  scheduled_action_name:scheduled_action_name ->
  service_namespace:service_namespace ->
  unit ->
  put_scheduled_action_request

val make_put_scaling_policy_response :
  ?alarms:alarms -> policy_ar_n:resource_id_max_len1600 -> unit -> put_scaling_policy_response

val make_put_scaling_policy_request :
  ?predictive_scaling_policy_configuration:predictive_scaling_policy_configuration ->
  ?target_tracking_scaling_policy_configuration:target_tracking_scaling_policy_configuration ->
  ?step_scaling_policy_configuration:step_scaling_policy_configuration ->
  ?policy_type:policy_type ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  policy_name:policy_name ->
  unit ->
  put_scaling_policy_request

val make_load_forecast :
  metric_specification:predictive_scaling_metric_specification ->
  values:predictive_scaling_forecast_values ->
  timestamps:predictive_scaling_forecast_timestamps ->
  unit ->
  load_forecast

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_capacity_forecast :
  values:predictive_scaling_forecast_values ->
  timestamps:predictive_scaling_forecast_timestamps ->
  unit ->
  capacity_forecast

val make_get_predictive_scaling_forecast_response :
  ?update_time:timestamp_type ->
  ?capacity_forecast:capacity_forecast ->
  ?load_forecast:load_forecasts ->
  unit ->
  get_predictive_scaling_forecast_response

val make_get_predictive_scaling_forecast_request :
  end_time:timestamp_type ->
  start_time:timestamp_type ->
  policy_name:policy_name ->
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  get_predictive_scaling_forecast_request

val make_describe_scheduled_actions_response :
  ?next_token:xml_string ->
  ?scheduled_actions:scheduled_actions ->
  unit ->
  describe_scheduled_actions_response

val make_describe_scheduled_actions_request :
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_id:resource_id_max_len1600 ->
  ?scheduled_action_names:resource_ids_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scheduled_actions_request

val make_describe_scaling_policies_response :
  ?next_token:xml_string ->
  ?scaling_policies:scaling_policies ->
  unit ->
  describe_scaling_policies_response

val make_describe_scaling_policies_request :
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_id:resource_id_max_len1600 ->
  ?policy_names:resource_ids_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scaling_policies_request

val make_describe_scaling_activities_response :
  ?next_token:xml_string ->
  ?scaling_activities:scaling_activities ->
  unit ->
  describe_scaling_activities_response

val make_describe_scaling_activities_request :
  ?include_not_scaled_activities:include_not_scaled_activities ->
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scaling_activities_request

val make_describe_scalable_targets_response :
  ?next_token:xml_string ->
  ?scalable_targets:scalable_targets ->
  unit ->
  describe_scalable_targets_response

val make_describe_scalable_targets_request :
  ?next_token:xml_string ->
  ?max_results:max_results ->
  ?scalable_dimension:scalable_dimension ->
  ?resource_ids:resource_ids_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  describe_scalable_targets_request

val make_deregister_scalable_target_response : unit -> unit

val make_deregister_scalable_target_request :
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  deregister_scalable_target_request

val make_delete_scheduled_action_response : unit -> unit

val make_delete_scheduled_action_request :
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  scheduled_action_name:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  unit ->
  delete_scheduled_action_request

val make_delete_scaling_policy_response : unit -> unit

val make_delete_scaling_policy_request :
  scalable_dimension:scalable_dimension ->
  resource_id:resource_id_max_len1600 ->
  service_namespace:service_namespace ->
  policy_name:resource_id_max_len1600 ->
  unit ->
  delete_scaling_policy_request
(** {1:operations Operations} *)

module DeleteScalingPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `ObjectNotFoundException of object_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scaling_policy_request ->
    ( delete_scaling_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scaling_policy_request ->
    ( delete_scaling_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified scaling policy for an Application Auto Scaling scalable target.\n\n\
  \ Deleting a step scaling policy deletes the underlying alarm action, but does not delete the \
   CloudWatch alarm associated with the scaling policy, even if it no longer has an associated \
   action.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/create-step-scaling-policy-cli.html#delete-step-scaling-policy}Delete \
   a step scaling policy} and \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/create-target-tracking-policy-cli.html#delete-target-tracking-policy}Delete \
   a target tracking scaling policy} in the {i Application Auto Scaling User Guide}.\n\
  \  "]

module DeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `ObjectNotFoundException of object_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_request ->
    ( delete_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_request ->
    ( delete_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified scheduled action for an Application Auto Scaling scalable target.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/scheduled-scaling-additional-cli-commands.html#delete-scheduled-action}Delete \
   a scheduled action} in the {i Application Auto Scaling User Guide}.\n\
  \ "]

module DeregisterScalableTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `ObjectNotFoundException of object_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_scalable_target_request ->
    ( deregister_scalable_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_scalable_target_request ->
    ( deregister_scalable_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters an Application Auto Scaling scalable target when you have finished using it. To see \
   which resources have been registered, use \
   {{:https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html}DescribeScalableTargets}. \
   \n\n\
  \  Deregistering a scalable target deletes the scaling policies and the scheduled actions that \
   are associated with it.\n\
  \  \n\
  \   "]

module DescribeScalableTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scalable_targets_request ->
    ( describe_scalable_targets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scalable_targets_request ->
    ( describe_scalable_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the scalable targets in the specified namespace.\n\n\
  \ You can filter the results using [ResourceIds] and [ScalableDimension].\n\
  \ "]

module DescribeScalingActivities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_activities_request ->
    ( describe_scaling_activities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_activities_request ->
    ( describe_scaling_activities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides descriptive information about the scaling activities in the specified namespace from \
   the previous six weeks.\n\n\
  \ You can filter the results using [ResourceId] and [ScalableDimension].\n\
  \ \n\
  \  For information about viewing scaling activities using the Amazon Web Services CLI, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scaling-activities.html}Scaling \
   activities for Application Auto Scaling}.\n\
  \  "]

module DescribeScalingPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `FailedResourceAccessException of failed_resource_access_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_policies_request ->
    ( describe_scaling_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `FailedResourceAccessException of failed_resource_access_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_policies_request ->
    ( describe_scaling_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `FailedResourceAccessException of failed_resource_access_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the Application Auto Scaling scaling policies for the specified service namespace.\n\n\
  \ You can filter the results using [ResourceId], [ScalableDimension], and [PolicyNames].\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html}Target \
   tracking scaling policies} and \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html}Step \
   scaling policies} in the {i Application Auto Scaling User Guide}.\n\
  \  "]

module DescribeScheduledActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_request ->
    ( describe_scheduled_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_request ->
    ( describe_scheduled_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the Application Auto Scaling scheduled actions for the specified service namespace.\n\n\
  \ You can filter the results using the [ResourceId], [ScalableDimension], and \
   [ScheduledActionNames] parameters.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html}Scheduled \
   scaling} in the {i Application Auto Scaling User Guide}.\n\
  \  "]

module GetPredictiveScalingForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_predictive_scaling_forecast_request ->
    ( get_predictive_scaling_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_predictive_scaling_forecast_request ->
    ( get_predictive_scaling_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the forecast data for a predictive scaling policy.\n\n\
  \ Load forecasts are predictions of the hourly load values using historical load data from \
   CloudWatch and an analysis of historical trends. Capacity forecasts are represented as \
   predicted values for the minimum capacity that is needed on an hourly basis, based on the \
   hourly load forecast.\n\
  \ \n\
  \  A minimum of 24 hours of data is required to create the initial forecasts. However, having a \
   full 14 days of historical data results in more accurate forecasts.\n\
  \  "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all the tags on the specified Application Auto Scaling scalable target.\n\n\
  \ For general information about tags, including the format and syntax, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging your Amazon Web \
   Services resources} in the {i Amazon Web Services General Reference}.\n\
  \ "]

module PutScalingPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `FailedResourceAccessException of failed_resource_access_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ObjectNotFoundException of object_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_request ->
    ( put_scaling_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `FailedResourceAccessException of failed_resource_access_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_request ->
    ( put_scaling_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `FailedResourceAccessException of failed_resource_access_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a scaling policy for an Application Auto Scaling scalable target.\n\n\
  \ Each scalable target is identified by a service namespace, resource ID, and scalable \
   dimension. A scaling policy applies to the scalable target identified by those three \
   attributes. You cannot create a scaling policy until you have registered the resource as a \
   scalable target.\n\
  \ \n\
  \  Multiple scaling policies can be in force at the same time for the same scalable target. You \
   can have one or more target tracking scaling policies, one or more step scaling policies, or \
   both. However, there is a chance that multiple policies could conflict, instructing the \
   scalable target to scale out or in at the same time. Application Auto Scaling gives precedence \
   to the policy that provides the largest capacity for both scale out and scale in. For example, \
   if one policy increases capacity by 3, another policy increases capacity by 200 percent, and \
   the current capacity is 10, Application Auto Scaling uses the policy with the highest \
   calculated capacity (200% of 10 = 20) and scales out to 30. \n\
  \  \n\
  \   We recommend caution, however, when using target tracking scaling policies with step scaling \
   policies because conflicts between these policies can cause undesirable behavior. For example, \
   if the step scaling policy initiates a scale-in activity before the target tracking policy is \
   ready to scale in, the scale-in activity will not be blocked. After the scale-in activity \
   completes, the target tracking policy could instruct the scalable target to scale out again. \n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html}Target \
   tracking scaling policies}, \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html}Step \
   scaling policies}, and \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/aas-create-predictive-scaling-policy.html}Predictive \
   scaling policies} in the {i Application Auto Scaling User Guide}.\n\
  \    \n\
  \      If a scalable target is deregistered, the scalable target is no longer available to use \
   scaling policies. Any scaling policies that were specified for the scalable target are deleted.\n\
  \      \n\
  \       "]

module PutScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ObjectNotFoundException of object_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_scheduled_action_request ->
    ( put_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_scheduled_action_request ->
    ( put_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a scheduled action for an Application Auto Scaling scalable target. \n\n\
  \ Each scalable target is identified by a service namespace, resource ID, and scalable \
   dimension. A scheduled action applies to the scalable target identified by those three \
   attributes. You cannot create a scheduled action until you have registered the resource as a \
   scalable target.\n\
  \ \n\
  \  When you specify start and end times with a recurring schedule using a cron expression or \
   rates, they form the boundaries for when the recurring action starts and stops.\n\
  \  \n\
  \   To update a scheduled action, specify the parameters that you want to change. If you don't \
   specify start and end times, the old values are deleted.\n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html}Scheduled \
   scaling} in the {i Application Auto Scaling User Guide}.\n\
  \    \n\
  \      If a scalable target is deregistered, the scalable target is no longer available to run \
   scheduled actions. Any scheduled actions that were specified for the scalable target are \
   deleted.\n\
  \      \n\
  \       "]

module RegisterScalableTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_scalable_target_request ->
    ( register_scalable_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_scalable_target_request ->
    ( register_scalable_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers or updates a scalable target, which is the resource that you want to scale.\n\n\
  \ Scalable targets are uniquely identified by the combination of resource ID, scalable \
   dimension, and namespace, which represents some capacity dimension of the underlying service.\n\
  \ \n\
  \  When you register a new scalable target, you must specify values for the minimum and maximum \
   capacity. If the specified resource is not active in the target service, this operation does \
   not change the resource's current capacity. Otherwise, it changes the resource's current \
   capacity to a value that is inside of this range.\n\
  \  \n\
  \   If you add a scaling policy, current capacity is adjustable within the specified range when \
   scaling starts. Application Auto Scaling scaling policies will not scale capacity to values \
   that are outside of the minimum and maximum range.\n\
  \   \n\
  \    After you register a scalable target, you do not need to register it again to use other \
   Application Auto Scaling operations. To see which resources have been registered, use \
   {{:https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html}DescribeScalableTargets}. \
   You can also view the scaling policies for a service namespace by using \
   {{:https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html}DescribeScalableTargets}. \
   If you no longer need a scalable target, you can deregister it by using \
   {{:https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html}DeregisterScalableTarget}.\n\
  \    \n\
  \     To update a scalable target, specify the parameters that you want to change. Include the \
   parameters that identify the scalable target: resource ID, scalable dimension, and namespace. \
   Any parameters that you don't specify are not changed by this update request. \n\
  \     \n\
  \       If you call the [RegisterScalableTarget] API operation to create a scalable target, \
   there might be a brief delay until the operation achieves \
   {{:https://en.wikipedia.org/wiki/Eventual_consistency}eventual consistency}. You might become \
   aware of this brief delay if you get unexpected errors when performing sequential operations. \
   The typical strategy is to retry the request, and some Amazon Web Services SDKs include \
   automatic backoff and retry logic.\n\
  \       \n\
  \        If you call the [RegisterScalableTarget] API operation to update an existing scalable \
   target, Application Auto Scaling retrieves the current capacity of the resource. If it's below \
   the minimum capacity or above the maximum capacity, Application Auto Scaling adjusts the \
   capacity of the scalable target to place it within these bounds, even if you don't include the \
   [MinCapacity] or [MaxCapacity] request parameters.\n\
  \        \n\
  \         "]

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
  "Adds or edits tags on an Application Auto Scaling scalable target.\n\n\
  \ Each tag consists of a tag key and a tag value, which are both case-sensitive strings. To add \
   a tag, specify a new tag key and a tag value. To edit a tag, specify an existing tag key and a \
   new tag value.\n\
  \ \n\
  \  You can use this operation to tag an Application Auto Scaling scalable target, but you cannot \
   tag a scaling policy or scheduled action.\n\
  \  \n\
  \   You can also add tags to an Application Auto Scaling scalable target while creating it \
   ([RegisterScalableTarget]).\n\
  \   \n\
  \    For general information about tags, including the format and syntax, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging your Amazon Web \
   Services resources} in the {i Amazon Web Services General Reference}.\n\
  \    \n\
  \     Use tags to control access to a scalable target. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/resource-tagging-support.html}Tagging \
   support for Application Auto Scaling} in the {i Application Auto Scaling User Guide}.\n\
  \     "]

(** {1:Serialization and Deserialization} *)
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
[@@ocaml.doc
  "Deletes tags from an Application Auto Scaling scalable target. To delete a tag, specify the tag \
   key and the Application Auto Scaling scalable target.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
