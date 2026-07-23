(** Auto Scaling Plans client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_scaling_plan_response : unit -> unit

val make_metric_dimension :
  name:metric_dimension_name -> value:metric_dimension_value -> unit -> metric_dimension

val make_customized_load_metric_specification :
  ?dimensions:metric_dimensions ->
  ?unit_:metric_unit ->
  metric_name:metric_name ->
  namespace:metric_namespace ->
  statistic:metric_statistic ->
  unit ->
  customized_load_metric_specification

val make_predefined_load_metric_specification :
  ?resource_label:resource_label ->
  predefined_load_metric_type:load_metric_type ->
  unit ->
  predefined_load_metric_specification

val make_customized_scaling_metric_specification :
  ?dimensions:metric_dimensions ->
  ?unit_:metric_unit ->
  metric_name:metric_name ->
  namespace:metric_namespace ->
  statistic:metric_statistic ->
  unit ->
  customized_scaling_metric_specification

val make_predefined_scaling_metric_specification :
  ?resource_label:resource_label ->
  predefined_scaling_metric_type:scaling_metric_type ->
  unit ->
  predefined_scaling_metric_specification

val make_target_tracking_configuration :
  ?predefined_scaling_metric_specification:predefined_scaling_metric_specification ->
  ?customized_scaling_metric_specification:customized_scaling_metric_specification ->
  ?disable_scale_in:disable_scale_in ->
  ?scale_out_cooldown:cooldown ->
  ?scale_in_cooldown:cooldown ->
  ?estimated_instance_warmup:cooldown ->
  target_value:metric_scale ->
  unit ->
  target_tracking_configuration

val make_scaling_instruction :
  ?predefined_load_metric_specification:predefined_load_metric_specification ->
  ?customized_load_metric_specification:customized_load_metric_specification ->
  ?scheduled_action_buffer_time:scheduled_action_buffer_time ->
  ?predictive_scaling_max_capacity_behavior:predictive_scaling_max_capacity_behavior ->
  ?predictive_scaling_max_capacity_buffer:resource_capacity ->
  ?predictive_scaling_mode:predictive_scaling_mode ->
  ?scaling_policy_update_behavior:scaling_policy_update_behavior ->
  ?disable_dynamic_scaling:disable_dynamic_scaling ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  min_capacity:resource_capacity ->
  max_capacity:resource_capacity ->
  target_tracking_configurations:target_tracking_configurations ->
  unit ->
  scaling_instruction

val make_tag_filter : ?key:xml_string_max_len128 -> ?values:tag_values -> unit -> tag_filter

val make_application_source :
  ?cloud_formation_stack_ar_n:xml_string -> ?tag_filters:tag_filters -> unit -> application_source

val make_update_scaling_plan_request :
  ?application_source:application_source ->
  ?scaling_instructions:scaling_instructions ->
  scaling_plan_name:scaling_plan_name ->
  scaling_plan_version:scaling_plan_version ->
  unit ->
  update_scaling_plan_request

val make_datapoint : ?timestamp:timestamp_type -> ?value:metric_scale -> unit -> datapoint

val make_get_scaling_plan_resource_forecast_data_response :
  datapoints:datapoints -> unit -> get_scaling_plan_resource_forecast_data_response

val make_get_scaling_plan_resource_forecast_data_request :
  scaling_plan_name:scaling_plan_name ->
  scaling_plan_version:scaling_plan_version ->
  service_namespace:service_namespace ->
  resource_id:xml_string ->
  scalable_dimension:scalable_dimension ->
  forecast_data_type:forecast_data_type ->
  start_time:timestamp_type ->
  end_time:timestamp_type ->
  unit ->
  get_scaling_plan_resource_forecast_data_request

val make_scaling_plan :
  ?status_message:xml_string ->
  ?status_start_time:timestamp_type ->
  ?creation_time:timestamp_type ->
  scaling_plan_name:scaling_plan_name ->
  scaling_plan_version:scaling_plan_version ->
  application_source:application_source ->
  scaling_instructions:scaling_instructions ->
  status_code:scaling_plan_status_code ->
  unit ->
  scaling_plan

val make_describe_scaling_plans_response :
  ?scaling_plans:scaling_plans -> ?next_token:next_token -> unit -> describe_scaling_plans_response

val make_describe_scaling_plans_request :
  ?scaling_plan_names:scaling_plan_names ->
  ?scaling_plan_version:scaling_plan_version ->
  ?application_sources:application_sources ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_scaling_plans_request

val make_scaling_policy :
  ?target_tracking_configuration:target_tracking_configuration ->
  policy_name:policy_name ->
  policy_type:policy_type ->
  unit ->
  scaling_policy

val make_scaling_plan_resource :
  ?scaling_policies:scaling_policies ->
  ?scaling_status_message:xml_string ->
  scaling_plan_name:scaling_plan_name ->
  scaling_plan_version:scaling_plan_version ->
  service_namespace:service_namespace ->
  resource_id:resource_id_max_len1600 ->
  scalable_dimension:scalable_dimension ->
  scaling_status_code:scaling_status_code ->
  unit ->
  scaling_plan_resource

val make_describe_scaling_plan_resources_response :
  ?scaling_plan_resources:scaling_plan_resources ->
  ?next_token:next_token ->
  unit ->
  describe_scaling_plan_resources_response

val make_describe_scaling_plan_resources_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  scaling_plan_name:scaling_plan_name ->
  scaling_plan_version:scaling_plan_version ->
  unit ->
  describe_scaling_plan_resources_request

val make_delete_scaling_plan_response : unit -> unit

val make_delete_scaling_plan_request :
  scaling_plan_name:scaling_plan_name ->
  scaling_plan_version:scaling_plan_version ->
  unit ->
  delete_scaling_plan_request

val make_create_scaling_plan_response :
  scaling_plan_version:scaling_plan_version -> unit -> create_scaling_plan_response

val make_create_scaling_plan_request :
  scaling_plan_name:scaling_plan_name ->
  application_source:application_source ->
  scaling_instructions:scaling_instructions ->
  unit ->
  create_scaling_plan_request
(** {1:operations Operations} *)

module CreateScalingPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scaling_plan_request ->
    ( create_scaling_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scaling_plan_request ->
    ( create_scaling_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a scaling plan. \n"]

module DeleteScalingPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `ObjectNotFoundException of object_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scaling_plan_request ->
    ( delete_scaling_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scaling_plan_request ->
    ( delete_scaling_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified scaling plan.\n\n\
  \ Deleting a scaling plan deletes the underlying [ScalingInstruction] for all of the scalable \
   resources that are covered by the plan.\n\
  \ \n\
  \  If the plan has launched resources or has scaling activities in progress, you must delete \
   those resources separately.\n\
  \  "]

module DescribeScalingPlanResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_plan_resources_request ->
    ( describe_scaling_plan_resources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_plan_resources_request ->
    ( describe_scaling_plan_resources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the scalable resources in the specified scaling plan.\n"]

module DescribeScalingPlans : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_plans_request ->
    ( describe_scaling_plans_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_plans_request ->
    ( describe_scaling_plans_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes one or more of your scaling plans.\n"]

module GetScalingPlanResourceForecastData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceException of internal_service_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_scaling_plan_resource_forecast_data_request ->
    ( get_scaling_plan_resource_forecast_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_scaling_plan_resource_forecast_data_request ->
    ( get_scaling_plan_resource_forecast_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceException of internal_service_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the forecast data for a scalable resource.\n\n\
  \ Capacity forecasts are represented as predicted values, or data points, that are calculated \
   using historical data points from a specified CloudWatch load metric. Data points are available \
   for up to 56 days. \n\
  \ "]

(** {1:Serialization and Deserialization} *)
module UpdateScalingPlan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentUpdateException of concurrent_update_exception
    | `InternalServiceException of internal_service_exception
    | `ObjectNotFoundException of object_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scaling_plan_request ->
    ( update_scaling_plan_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scaling_plan_request ->
    ( update_scaling_plan_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentUpdateException of concurrent_update_exception
      | `InternalServiceException of internal_service_exception
      | `ObjectNotFoundException of object_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified scaling plan.\n\n\
  \ You cannot update a scaling plan if it is in the process of being created, updated, or deleted.\n\
  \ "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
