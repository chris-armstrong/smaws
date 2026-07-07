open Types

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
