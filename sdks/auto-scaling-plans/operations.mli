open Types

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
