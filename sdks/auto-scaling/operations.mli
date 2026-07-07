open Types

module AttachInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_instances_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_instances_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches one or more EC2 instances to the specified Auto Scaling group.\n\n\
  \ When you attach instances, Amazon EC2 Auto Scaling increases the desired capacity of the group \
   by the number of instances being attached. If the number of instances being attached plus the \
   desired capacity of the group exceeds the maximum size of the group, the operation fails.\n\
  \ \n\
  \  If there is a Classic Load Balancer attached to your Auto Scaling group, the instances are \
   also registered with the load balancer. If there are target groups attached to your Auto \
   Scaling group, the instances are also registered with the target groups.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-detach-attach-instances.html}Detach \
   or attach instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module AttachLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancers_type ->
    ( attach_load_balancers_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancers_type ->
    ( attach_load_balancers_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}, \
   which can attach multiple traffic sources types. We recommend using [AttachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support [AttachLoadBalancers]. \
   You can use both the original [AttachLoadBalancers] API operation and [AttachTrafficSources] on \
   the same Auto Scaling group.\n\
  \ \n\
  \   Attaches one or more Classic Load Balancers to the specified Auto Scaling group. Amazon EC2 \
   Auto Scaling registers the running instances with these Classic Load Balancers.\n\
  \   \n\
  \    To describe the load balancers for an Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
   API. To detach a load balancer from the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachLoadBalancers.html}DetachLoadBalancers} \
   API.\n\
  \    \n\
  \     This operation is additive and does not detach existing Classic Load Balancers or target \
   groups from the Auto Scaling group.\n\
  \     \n\
  \      For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \      "]

module AttachLoadBalancerTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancer_target_groups_type ->
    ( attach_load_balancer_target_groups_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancer_target_groups_type ->
    ( attach_load_balancer_target_groups_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}, \
   which can attach multiple traffic sources types. We recommend using [AttachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support \
   [AttachLoadBalancerTargetGroups]. You can use both the original \
   [AttachLoadBalancerTargetGroups] API operation and [AttachTrafficSources] on the same Auto \
   Scaling group.\n\
  \ \n\
  \   Attaches one or more target groups to the specified Auto Scaling group.\n\
  \   \n\
  \    This operation is used with the following load balancer types: \n\
  \    \n\
  \     {ul\n\
  \           {-  Application Load Balancer - Operates at the application layer (layer 7) and \
   supports HTTP and HTTPS. \n\
  \               \n\
  \                }\n\
  \           {-  Network Load Balancer - Operates at the transport layer (layer 4) and supports \
   TCP, TLS, and UDP. \n\
  \               \n\
  \                }\n\
  \           {-  Gateway Load Balancer - Operates at the network layer (layer 3).\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To describe the target groups for an Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancerTargetGroups.html}DescribeLoadBalancerTargetGroups} \
   API. To detach the target group from the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachLoadBalancerTargetGroups.html}DetachLoadBalancerTargetGroups} \
   API.\n\
  \   \n\
  \    This operation is additive and does not detach existing target groups or Classic Load \
   Balancers from the Auto Scaling group.\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \     "]

module AttachTrafficSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_traffic_sources_type ->
    ( attach_traffic_sources_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_traffic_sources_type ->
    ( attach_traffic_sources_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches one or more traffic sources to the specified Auto Scaling group.\n\n\
  \ You can use any of the following as traffic sources for an Auto Scaling group:\n\
  \ \n\
  \  {ul\n\
  \        {-  Application Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  Classic Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  Gateway Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  Network Load Balancer\n\
  \            \n\
  \             }\n\
  \        {-  VPC Lattice\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   This operation is additive and does not detach existing traffic sources from the Auto \
   Scaling group. \n\
  \   \n\
  \    After the operation completes, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources} \
   API to return details about the state of the attachments between traffic sources and your Auto \
   Scaling group. To detach a traffic source from the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachTrafficSources.html}DetachTrafficSources} \
   API.\n\
  \    "]

module BatchDeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_scheduled_action_type ->
    ( batch_delete_scheduled_action_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_scheduled_action_type ->
    ( batch_delete_scheduled_action_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes one or more scheduled actions for the specified Auto Scaling group.\n"]

module BatchPutScheduledUpdateGroupAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_put_scheduled_update_group_action_type ->
    ( batch_put_scheduled_update_group_action_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_put_scheduled_update_group_action_type ->
    ( batch_put_scheduled_update_group_action_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates one or more scheduled scaling actions for an Auto Scaling group.\n"]

module CancelInstanceRefresh : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_instance_refresh_type ->
    ( cancel_instance_refresh_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_instance_refresh_type ->
    ( cancel_instance_refresh_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an instance refresh or rollback that is in progress. If an instance refresh or rollback \
   is not in progress, an [ActiveInstanceRefreshNotFound] error occurs.\n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group after you make configuration changes.\n\
  \ \n\
  \  When you cancel an instance refresh, this does not roll back any changes that it made. Use \
   the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RollbackInstanceRefresh.html}RollbackInstanceRefresh} \
   API to roll back instead.\n\
  \  "]

module CompleteLifecycleAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    complete_lifecycle_action_type ->
    ( complete_lifecycle_action_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    complete_lifecycle_action_type ->
    ( complete_lifecycle_action_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Completes the lifecycle action for the specified token or instance with the specified result.\n\n\
  \ This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:\n\
  \ \n\
  \  {ol\n\
  \        {-  (Optional) Create a launch template or launch configuration with a user data script \
   that runs while an instance is in a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a Lambda function and a rule that allows Amazon EventBridge to \
   invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a notification target and an IAM role. The target can be either \
   an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish \
   lifecycle notifications to the target.\n\
  \            \n\
  \             }\n\
  \        {-  Create the lifecycle hook. Specify whether the hook is used when the instances \
   launch or terminate.\n\
  \            \n\
  \             }\n\
  \        {-  If you need more time, record the lifecycle action heartbeat to keep the instance \
   in a wait state.\n\
  \            \n\
  \             }\n\
  \        {-   {b If you finish before the timeout period ends, send a callback by using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CompleteLifecycleAction.html}CompleteLifecycleAction} \
   API call.} \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/completing-lifecycle-hooks.html}Complete \
   a lifecycle action} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module CreateAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b We strongly recommend using a launch template when calling this operation to ensure full \
   functionality for Amazon EC2 Auto Scaling and Amazon EC2.} \n\n\
  \ Creates an Auto Scaling group with the specified name and attributes. \n\
  \ \n\
  \  If you exceed your maximum limit of Auto Scaling groups, the call fails. To query this limit, \
   call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAccountLimits.html}DescribeAccountLimits} \
   API. For information about updating this limit, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html}Quotas \
   for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  \n\
  \   If you're new to Amazon EC2 Auto Scaling, see the introductory tutorials in \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/get-started-with-ec2-auto-scaling.html}Get \
   started with Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   \n\
  \    Every Auto Scaling group has three size properties ([DesiredCapacity], [MaxSize], and \
   [MinSize]). Usually, you set these sizes based on a specific number of instances. However, if \
   you configure a mixed instances policy that defines weights for the instance types, you must \
   specify these sizes with the same units that you use for weighting instances.\n\
  \    "]

module CreateLaunchConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_launch_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_launch_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a launch configuration.\n\n\
  \ If you exceed your maximum limit of launch configurations, the call fails. To query this \
   limit, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAccountLimits.html}DescribeAccountLimits} \
   API. For information about updating this limit, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html}Quotas \
   for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-configurations.html}Launch \
   configurations} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  \n\
  \    Amazon EC2 Auto Scaling configures instances launched as part of an Auto Scaling group \
   using either a launch template or a launch configuration. We strongly recommend that you do not \
   use launch configurations. They do not provide full functionality for Amazon EC2 Auto Scaling \
   or Amazon EC2. For information about using launch templates, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html}Launch \
   templates} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \    \n\
  \     "]

module CreateOrUpdateTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_or_update_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_or_update_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates tags for the specified Auto Scaling group.\n\n\
  \ When you specify a tag with a key that already exists, the operation overwrites the previous \
   tag definition, and you do not get an error message.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html}Tag Auto \
   Scaling groups and instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module DeleteAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Auto Scaling group.\n\n\
  \ If the group has instances or scaling activities in progress, you must specify the option to \
   force the deletion in order for it to succeed. The force delete operation will also terminate \
   the EC2 instances. If the group has a warm pool, the force delete option also deletes the warm \
   pool.\n\
  \ \n\
  \  To remove instances from the Auto Scaling group before deleting it, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachInstances.html}DetachInstances} \
   API with the list of instances and the option to decrement the desired capacity. This ensures \
   that Amazon EC2 Auto Scaling does not launch replacement instances.\n\
  \  \n\
  \   To terminate all instances before deleting the Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_UpdateAutoScalingGroup.html}UpdateAutoScalingGroup} \
   API and set the minimum size and desired capacity of the Auto Scaling group to zero.\n\
  \   \n\
  \    If the group has scaling policies, deleting the group deletes the policies, the underlying \
   alarm actions, and any alarm that no longer has an associated action.\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-process-shutdown.html}Delete your \
   Auto Scaling infrastructure} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \     "]

module DeleteLaunchConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_name_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_name_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified launch configuration.\n\n\
  \ The launch configuration must not be attached to an Auto Scaling group. When this call \
   completes, the launch configuration is no longer available for use.\n\
  \ "]

module DeleteLifecycleHook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_hook_type ->
    ( delete_lifecycle_hook_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_hook_type ->
    ( delete_lifecycle_hook_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified lifecycle hook.\n\n\
  \ If there are any outstanding lifecycle actions, they are completed first ([ABANDON] for \
   launching instances, [CONTINUE] for terminating instances).\n\
  \ "]

module DeleteNotificationConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified notification.\n"]

module DeletePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified scaling policy.\n\n\
  \ Deleting either a step scaling policy or a simple scaling policy deletes the underlying alarm \
   action, but does not delete the alarm, even if it no longer has an associated action.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/deleting-scaling-policy.html}Delete a \
   scaling policy} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module DeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified scheduled action.\n"]

module DeleteTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified tags.\n"]

module DeleteWarmPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_warm_pool_type ->
    ( delete_warm_pool_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_warm_pool_type ->
    ( delete_warm_pool_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the warm pool for the specified Auto Scaling group.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html}Warm \
   pools for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DescribeAccountLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_account_limits_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_account_limits_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current Amazon EC2 Auto Scaling resource quotas for your account.\n\n\
  \ When you establish an Amazon Web Services account, the account has initial quotas on the \
   maximum number of Auto Scaling groups and launch configurations that you can create in a given \
   Region. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-quotas.html}Quotas \
   for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DescribeAdjustmentTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_adjustment_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_adjustment_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the available adjustment types for step scaling and simple scaling policies.\n\n\
  \ The following adjustment types are supported:\n\
  \ \n\
  \  {ul\n\
  \        {-   [ChangeInCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [ExactCapacity] \n\
  \            \n\
  \             }\n\
  \        {-   [PercentChangeInCapacity] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeAutoScalingGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    auto_scaling_group_names_type ->
    ( auto_scaling_groups_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    auto_scaling_group_names_type ->
    ( auto_scaling_groups_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the Auto Scaling groups in the account and Region.\n\n\
  \ If you specify Auto Scaling group names, the output includes information for only the \
   specified Auto Scaling groups. If you specify filters, the output includes information for only \
   those Auto Scaling groups that meet the filter criteria. If you do not specify group names or \
   filters, the output includes information for all Auto Scaling groups. \n\
  \ \n\
  \  This operation also returns information about instances in Auto Scaling groups. To retrieve \
   information about the instances in a warm pool, you must call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeWarmPool.html}DescribeWarmPool} \
   API. \n\
  \  "]

module DescribeAutoScalingInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_scaling_instances_type ->
    ( auto_scaling_instances_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_scaling_instances_type ->
    ( auto_scaling_instances_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the Auto Scaling instances in the account and Region.\n"]

module DescribeAutoScalingNotificationTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_auto_scaling_notification_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_auto_scaling_notification_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the notification types that are supported by Amazon EC2 Auto Scaling.\n"]

module DescribeInstanceRefreshes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_refreshes_type ->
    ( describe_instance_refreshes_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_refreshes_type ->
    ( describe_instance_refreshes_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the instance refreshes for the specified Auto Scaling group from the \
   previous six weeks.\n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group after you make configuration changes.\n\
  \ \n\
  \  To help you determine the status of an instance refresh, Amazon EC2 Auto Scaling returns \
   information about the instance refreshes you previously initiated, including their status, \
   start time, end time, the percentage of the instance refresh that is complete, and the number \
   of instances remaining to update before the instance refresh is complete. If a rollback is \
   initiated while an instance refresh is in progress, Amazon EC2 Auto Scaling also returns \
   information about the rollback of the instance refresh.\n\
  \  "]

module DescribeLaunchConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_names_type ->
    ( launch_configurations_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    launch_configuration_names_type ->
    ( launch_configurations_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the launch configurations in the account and Region.\n"]

module DescribeLifecycleHookTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_lifecycle_hook_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_lifecycle_hook_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the available types of lifecycle hooks.\n\n\
  \ The following hook types are supported:\n\
  \ \n\
  \  {ul\n\
  \        {-   [autoscaling:EC2_INSTANCE_LAUNCHING] \n\
  \            \n\
  \             }\n\
  \        {-   [autoscaling:EC2_INSTANCE_TERMINATING] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeLifecycleHooks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_lifecycle_hooks_type ->
    ( describe_lifecycle_hooks_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_lifecycle_hooks_type ->
    ( describe_lifecycle_hooks_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the lifecycle hooks for the specified Auto Scaling group.\n"]

module DescribeLoadBalancerTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_target_groups_request ->
    ( describe_load_balancer_target_groups_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_target_groups_request ->
    ( describe_load_balancer_target_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources}, \
   which can describe multiple traffic sources types. We recommend using [DetachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support \
   [DescribeLoadBalancerTargetGroups]. You can use both the original \
   [DescribeLoadBalancerTargetGroups] API operation and [DescribeTrafficSources] on the same Auto \
   Scaling group.\n\
  \ \n\
  \   Gets information about the Elastic Load Balancing target groups for the specified Auto \
   Scaling group.\n\
  \   \n\
  \    To determine the attachment status of the target group, use the [State] element in the \
   response. When you attach a target group to an Auto Scaling group, the initial [State] value is \
   [Adding]. The state transitions to [Added] after all Auto Scaling instances are registered with \
   the target group. If Elastic Load Balancing health checks are enabled for the Auto Scaling \
   group, the state transitions to [InService] after at least one Auto Scaling instance passes the \
   health check. When the target group is in the [InService] state, Amazon EC2 Auto Scaling can \
   terminate and replace any instances that are reported as unhealthy. If no registered instances \
   pass the health checks, the target group doesn't enter the [InService] state. \n\
  \    \n\
  \     Target groups also have an [InService] state if you attach them in the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html}CreateAutoScalingGroup} \
   API call. If your target group state is [InService], but it is not working properly, check the \
   scaling activities by calling \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   and take any corrective actions necessary.\n\
  \     \n\
  \      For help with failed health checks, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html}Troubleshooting \
   Amazon EC2 Auto Scaling: Health checks} in the {i Amazon EC2 Auto Scaling User Guide}. For more \
   information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \      \n\
  \        You can use this operation to describe target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachLoadBalancerTargetGroups.html}AttachLoadBalancerTargetGroups}, \
   but not for target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}.\n\
  \        \n\
  \         "]

module DescribeLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_request ->
    ( describe_load_balancers_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancers_request ->
    ( describe_load_balancers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources}, \
   which can describe multiple traffic sources types. We recommend using [DescribeTrafficSources] \
   to simplify how you manage traffic sources. However, we continue to support \
   [DescribeLoadBalancers]. You can use both the original [DescribeLoadBalancers] API operation \
   and [DescribeTrafficSources] on the same Auto Scaling group.\n\
  \ \n\
  \   Gets information about the load balancers for the specified Auto Scaling group.\n\
  \   \n\
  \    This operation describes only Classic Load Balancers. If you have Application Load \
   Balancers, Network Load Balancers, or Gateway Load Balancers, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancerTargetGroups.html}DescribeLoadBalancerTargetGroups} \
   API instead.\n\
  \    \n\
  \     To determine the attachment status of the load balancer, use the [State] element in the \
   response. When you attach a load balancer to an Auto Scaling group, the initial [State] value \
   is [Adding]. The state transitions to [Added] after all Auto Scaling instances are registered \
   with the load balancer. If Elastic Load Balancing health checks are enabled for the Auto \
   Scaling group, the state transitions to [InService] after at least one Auto Scaling instance \
   passes the health check. When the load balancer is in the [InService] state, Amazon EC2 Auto \
   Scaling can terminate and replace any instances that are reported as unhealthy. If no \
   registered instances pass the health checks, the load balancer doesn't enter the [InService] \
   state. \n\
  \     \n\
  \      Load balancers also have an [InService] state if you attach them in the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CreateAutoScalingGroup.html}CreateAutoScalingGroup} \
   API call. If your load balancer state is [InService], but it is not working properly, check the \
   scaling activities by calling \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   and take any corrective actions necessary.\n\
  \      \n\
  \       For help with failed health checks, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ts-as-healthchecks.html}Troubleshooting \
   Amazon EC2 Auto Scaling: Health checks} in the {i Amazon EC2 Auto Scaling User Guide}. For more \
   information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
   Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling group} \
   in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \       "]

module DescribeMetricCollectionTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_metric_collection_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_metric_collection_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the available CloudWatch metrics for Amazon EC2 Auto Scaling.\n"]

module DescribeNotificationConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_notification_configurations_type ->
    ( describe_notification_configurations_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_notification_configurations_type ->
    ( describe_notification_configurations_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the Amazon SNS notifications that are configured for one or more Auto \
   Scaling groups.\n"]

module DescribePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_policies_type ->
    ( policies_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_policies_type ->
    ( policies_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about the scaling policies in the account and Region.\n"]

module DescribeScalingActivities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_activities_type ->
    ( activities_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scaling_activities_type ->
    ( activities_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the scaling activities in the account and Region.\n\n\
  \ When scaling events occur, you see a record of the scaling activity in the scaling activities. \
   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-verify-scaling-activity.html}Verify \
   a scaling activity for an Auto Scaling group} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  If the scaling event succeeds, the value of the [StatusCode] element in the response is \
   [Successful]. If an attempt to launch instances failed, the [StatusCode] value is [Failed] or \
   [Cancelled] and the [StatusMessage] element in the response indicates the cause of the failure. \
   For help interpreting the [StatusMessage], see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/CHAP_Troubleshooting.html}Troubleshooting \
   Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}. \n\
  \  "]

module DescribeScalingProcessTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( processes_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( processes_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the scaling process types for use with the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_ResumeProcesses.html}ResumeProcesses} \
   and \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_SuspendProcesses.html}SuspendProcesses} \
   APIs.\n"]

module DescribeScheduledActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_type ->
    ( scheduled_actions_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_scheduled_actions_type ->
    ( scheduled_actions_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the scheduled actions that haven't run or that have not reached their \
   end time.\n\n\
  \ To describe the scaling activities for scheduled actions that have already run, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   API.\n\
  \ "]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_type ->
    ( tags_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_type ->
    ( tags_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified tags.\n\n\
  \ You can use filters to limit the results. For example, you can query for the tags for a \
   specific Auto Scaling group. You can specify multiple values for a filter. A tag must match at \
   least one of the specified values for it to be included in the results.\n\
  \ \n\
  \  You can also specify multiple filters. The result includes information for a particular tag \
   only if it matches all the filters. If there's no match, no special message is returned.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html}Tag Auto \
   Scaling groups and instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module DescribeTerminationPolicyTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_termination_policy_types_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_termination_policy_types_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the termination policies supported by Amazon EC2 Auto Scaling.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html}Configure \
   termination policies for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DescribeTrafficSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_traffic_sources_request ->
    ( describe_traffic_sources_response,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_traffic_sources_request ->
    ( describe_traffic_sources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about the traffic sources for the specified Auto Scaling group.\n\n\
  \ You can optionally provide a traffic source type. If you provide a traffic source type, then \
   the results only include that traffic source type.\n\
  \ \n\
  \  If you do not provide a traffic source type, then the results include all the traffic sources \
   for the specified Auto Scaling group. \n\
  \  "]

module DescribeWarmPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidNextToken of invalid_next_token
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_warm_pool_type ->
    ( describe_warm_pool_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_warm_pool_type ->
    ( describe_warm_pool_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidNextToken of invalid_next_token
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a warm pool and its instances.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html}Warm \
   pools for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module DetachInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_instances_query ->
    ( detach_instances_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_instances_query ->
    ( detach_instances_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more instances from the specified Auto Scaling group.\n\n\
  \ After the instances are detached, you can manage them independent of the Auto Scaling group.\n\
  \ \n\
  \  If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling \
   launches instances to replace the ones that are detached.\n\
  \  \n\
  \   If there is a Classic Load Balancer attached to the Auto Scaling group, the instances are \
   deregistered from the load balancer. If there are target groups attached to the Auto Scaling \
   group, the instances are deregistered from the target groups.\n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-detach-attach-instances.html}Detach \
   or attach instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \    "]

module DetachLoadBalancerTargetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancer_target_groups_type ->
    ( detach_load_balancer_target_groups_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancer_target_groups_type ->
    ( detach_load_balancer_target_groups_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachTrafficSources.html}DetachTrafficSources}, \
   which can detach multiple traffic sources types. We recommend using [DetachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support \
   [DetachLoadBalancerTargetGroups]. You can use both the original \
   [DetachLoadBalancerTargetGroups] API operation and [DetachTrafficSources] on the same Auto \
   Scaling group.\n\
  \ \n\
  \   Detaches one or more target groups from the specified Auto Scaling group.\n\
  \   \n\
  \    When you detach a target group, it enters the [Removing] state while deregistering the \
   instances in the group. When all instances are deregistered, then you can no longer describe \
   the target group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancerTargetGroups.html}DescribeLoadBalancerTargetGroups} \
   API call. The instances remain running.\n\
  \    \n\
  \      You can use this operation to detach target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachLoadBalancerTargetGroups.html}AttachLoadBalancerTargetGroups}, \
   but not for target groups that were attached by using \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_AttachTrafficSources.html}AttachTrafficSources}.\n\
  \      \n\
  \       "]

module DetachLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancers_type ->
    ( detach_load_balancers_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancers_type ->
    ( detach_load_balancers_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This API operation is superseded by \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachTrafficSources.html}DetachTrafficSources}, \
   which can detach multiple traffic sources types. We recommend using [DetachTrafficSources] to \
   simplify how you manage traffic sources. However, we continue to support [DetachLoadBalancers]. \
   You can use both the original [DetachLoadBalancers] API operation and [DetachTrafficSources] on \
   the same Auto Scaling group.\n\
  \ \n\
  \   Detaches one or more Classic Load Balancers from the specified Auto Scaling group.\n\
  \   \n\
  \    This operation detaches only Classic Load Balancers. If you have Application Load \
   Balancers, Network Load Balancers, or Gateway Load Balancers, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DetachLoadBalancerTargetGroups.html}DetachLoadBalancerTargetGroups} \
   API instead.\n\
  \    \n\
  \     When you detach a load balancer, it enters the [Removing] state while deregistering the \
   instances in the group. When all instances are deregistered, then you can no longer describe \
   the load balancer using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
   API call. The instances remain running.\n\
  \     "]

module DetachTrafficSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_traffic_sources_type ->
    ( detach_traffic_sources_result_type,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_traffic_sources_type ->
    ( detach_traffic_sources_result_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches one or more traffic sources from the specified Auto Scaling group.\n\n\
  \ When you detach a traffic source, it enters the [Removing] state while deregistering the \
   instances in the group. When all instances are deregistered, then you can no longer describe \
   the traffic source using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTrafficSources.html}DescribeTrafficSources} \
   API call. The instances continue to run.\n\
  \ "]

module DisableMetricsCollection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disables group metrics collection for the specified Auto Scaling group.\n"]

module EnableMetricsCollection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_metrics_collection_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables group metrics collection for the specified Auto Scaling group.\n\n\
  \ You can use these metrics to track changes in an Auto Scaling group and to set alarms on \
   threshold values. You can view group metrics using the Amazon EC2 Auto Scaling console or the \
   CloudWatch console. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-cloudwatch-monitoring.html}Monitor \
   CloudWatch metrics for your Auto Scaling groups and instances} in the {i Amazon EC2 Auto \
   Scaling User Guide}.\n\
  \ "]

module EnterStandby : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enter_standby_query ->
    ( enter_standby_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enter_standby_query ->
    ( enter_standby_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Moves the specified instances into the standby state.\n\n\
  \ If you choose to decrement the desired capacity of the Auto Scaling group, the instances can \
   enter standby as long as the desired capacity of the Auto Scaling group after the instances are \
   placed into standby is equal to or greater than the minimum capacity of the group.\n\
  \ \n\
  \  If you choose not to decrement the desired capacity of the Auto Scaling group, the Auto \
   Scaling group launches new instances to replace the instances on standby.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html}Temporarily \
   removing instances from your Auto Scaling group} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module ExecutePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_policy_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Executes the specified policy. This can be useful for testing the design of your scaling policy.\n"]

module ExitStandby : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    exit_standby_query ->
    ( exit_standby_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    exit_standby_query ->
    ( exit_standby_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Moves the specified instances out of the standby state.\n\n\
  \ After you put the instances back in service, the desired capacity is incremented.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enter-exit-standby.html}Temporarily \
   removing instances from your Auto Scaling group} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module GetPredictiveScalingForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_predictive_scaling_forecast_type ->
    ( get_predictive_scaling_forecast_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_predictive_scaling_forecast_type ->
    ( get_predictive_scaling_forecast_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
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
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html}Predictive \
   scaling for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module LaunchInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `IdempotentParameterMismatchError of idempotent_parameter_mismatch_error
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    launch_instances_request ->
    ( launch_instances_result,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IdempotentParameterMismatchError of idempotent_parameter_mismatch_error
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    launch_instances_request ->
    ( launch_instances_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `IdempotentParameterMismatchError of idempotent_parameter_mismatch_error
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Launches a specified number of instances in an Auto Scaling group. Returns instance IDs and \
   other details if launch is successful or error details if launch is unsuccessful. \n"]

module PutLifecycleHook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_hook_type ->
    ( put_lifecycle_hook_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_hook_type ->
    ( put_lifecycle_hook_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a lifecycle hook for the specified Auto Scaling group.\n\n\
  \ Lifecycle hooks let you create solutions that are aware of events in the Auto Scaling instance \
   lifecycle, and then perform a custom action on instances when the corresponding lifecycle event \
   occurs.\n\
  \ \n\
  \  This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:\n\
  \  \n\
  \   {ol\n\
  \         {-  (Optional) Create a launch template or launch configuration with a user data \
   script that runs while an instance is in a wait state due to a lifecycle hook.\n\
  \             \n\
  \              }\n\
  \         {-  (Optional) Create a Lambda function and a rule that allows Amazon EventBridge to \
   invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.\n\
  \             \n\
  \              }\n\
  \         {-  (Optional) Create a notification target and an IAM role. The target can be either \
   an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish \
   lifecycle notifications to the target.\n\
  \             \n\
  \              }\n\
  \         {-   {b Create the lifecycle hook. Specify whether the hook is used when the instances \
   launch or terminate.} \n\
  \             \n\
  \              }\n\
  \         {-  If you need more time, record the lifecycle action heartbeat to keep the instance \
   in a wait state using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RecordLifecycleActionHeartbeat.html}RecordLifecycleActionHeartbeat} \
   API call.\n\
  \             \n\
  \              }\n\
  \         {-  If you finish before the timeout period ends, send a callback by using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CompleteLifecycleAction.html}CompleteLifecycleAction} \
   API call.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html}Amazon EC2 Auto \
   Scaling lifecycle hooks} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   \n\
  \    If you exceed your maximum limit of lifecycle hooks, which by default is 50 per Auto \
   Scaling group, the call fails.\n\
  \    \n\
  \     You can view the lifecycle hooks for an Auto Scaling group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeLifecycleHooks.html}DescribeLifecycleHooks} \
   API call. If you are no longer using a lifecycle hook, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeleteLifecycleHook.html}DeleteLifecycleHook} \
   API.\n\
  \     "]

module PutNotificationConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_notification_configuration_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures an Auto Scaling group to send notifications when specified events take place. \
   Subscribers to the specified topic can have messages delivered to an endpoint such as a web \
   server or an email address.\n\n\
  \ This configuration overwrites any existing configuration.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-sns-notifications.html}Amazon \
   SNS notification options for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User \
   Guide}.\n\
  \  \n\
  \   If you exceed your maximum limit of SNS topics, which is 10 per Auto Scaling group, the call \
   fails.\n\
  \   "]

module PutScalingPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_type ->
    ( policy_arn_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_scaling_policy_type ->
    ( policy_arn_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a scaling policy for an Auto Scaling group. Scaling policies are used to \
   scale an Auto Scaling group based on configurable metrics. If no policies are defined, the \
   dynamic scaling and predictive scaling features are not used. \n\n\
  \ For more information about using dynamic scaling, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html}Target \
   tracking scaling policies} and \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html}Step and \
   simple scaling policies} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  For more information about using predictive scaling, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-predictive-scaling.html}Predictive \
   scaling for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  \n\
  \   You can view the scaling policies for an Auto Scaling group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribePolicies.html}DescribePolicies} \
   API call. If you are no longer using a scaling policy, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeletePolicy.html}DeletePolicy} \
   API.\n\
  \   "]

module PutScheduledUpdateGroupAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsFault of already_exists_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_scheduled_update_group_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_scheduled_update_group_action_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsFault of already_exists_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a scheduled scaling action for an Auto Scaling group.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scheduled-scaling.html}Scheduled \
   scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  You can view the scheduled actions for an Auto Scaling group using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScheduledActions.html}DescribeScheduledActions} \
   API call. If you are no longer using a scheduled action, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeleteScheduledAction.html}DeleteScheduledAction} \
   API.\n\
  \  \n\
  \   If you try to schedule your action in the past, Amazon EC2 Auto Scaling returns an error \
   message.\n\
  \   "]

module PutWarmPool : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_warm_pool_type ->
    ( put_warm_pool_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_warm_pool_type ->
    ( put_warm_pool_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a warm pool for the specified Auto Scaling group. A warm pool is a pool of \
   pre-initialized EC2 instances that sits alongside the Auto Scaling group. Whenever your \
   application needs to scale out, the Auto Scaling group can draw on the warm pool to meet its \
   new desired capacity.\n\n\
  \ This operation must be called from the Region in which the Auto Scaling group was created.\n\
  \ \n\
  \  You can view the instances in the warm pool using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeWarmPool.html}DescribeWarmPool} \
   API call. If you are no longer using a warm pool, you can delete it by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeleteWarmPool.html}DeleteWarmPool} \
   API.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html}Warm \
   pools for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module RecordLifecycleActionHeartbeat : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    record_lifecycle_action_heartbeat_type ->
    ( record_lifecycle_action_heartbeat_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    record_lifecycle_action_heartbeat_type ->
    ( record_lifecycle_action_heartbeat_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Records a heartbeat for the lifecycle action associated with the specified token or instance. \
   This extends the timeout by the length of time defined using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PutLifecycleHook.html}PutLifecycleHook} \
   API call.\n\n\
  \ This step is a part of the procedure for adding a lifecycle hook to an Auto Scaling group:\n\
  \ \n\
  \  {ol\n\
  \        {-  (Optional) Create a launch template or launch configuration with a user data script \
   that runs while an instance is in a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a Lambda function and a rule that allows Amazon EventBridge to \
   invoke your Lambda function when an instance is put into a wait state due to a lifecycle hook.\n\
  \            \n\
  \             }\n\
  \        {-  (Optional) Create a notification target and an IAM role. The target can be either \
   an Amazon SQS queue or an Amazon SNS topic. The role allows Amazon EC2 Auto Scaling to publish \
   lifecycle notifications to the target.\n\
  \            \n\
  \             }\n\
  \        {-  Create the lifecycle hook. Specify whether the hook is used when the instances \
   launch or terminate.\n\
  \            \n\
  \             }\n\
  \        {-   {b If you need more time, record the lifecycle action heartbeat to keep the \
   instance in a wait state.} \n\
  \            \n\
  \             }\n\
  \        {-  If you finish before the timeout period ends, send a callback by using the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CompleteLifecycleAction.html}CompleteLifecycleAction} \
   API call.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html}Amazon EC2 Auto \
   Scaling lifecycle hooks} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module ResumeProcesses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Resumes the specified suspended auto scaling processes, or all suspended process, for the \
   specified Auto Scaling group.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html}Suspend \
   and resume Amazon EC2 Auto Scaling processes} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

module RollbackInstanceRefresh : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
    | `IrreversibleInstanceRefreshFault of irreversible_instance_refresh_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_instance_refresh_type ->
    ( rollback_instance_refresh_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `IrreversibleInstanceRefreshFault of irreversible_instance_refresh_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_instance_refresh_type ->
    ( rollback_instance_refresh_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ActiveInstanceRefreshNotFoundFault of active_instance_refresh_not_found_fault
      | `IrreversibleInstanceRefreshFault of irreversible_instance_refresh_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an instance refresh that is in progress and rolls back any changes that it made. Amazon \
   EC2 Auto Scaling replaces any instances that were replaced during the instance refresh. This \
   restores your Auto Scaling group to the configuration that it was using before the start of the \
   instance refresh. \n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group after you make configuration changes.\n\
  \ \n\
  \  A rollback is not supported in the following situations: \n\
  \  \n\
  \   {ul\n\
  \         {-  There is no desired configuration specified for the instance refresh.\n\
  \             \n\
  \              }\n\
  \         {-  The Auto Scaling group has a launch template that uses an Amazon Web Services \
   Systems Manager parameter instead of an AMI ID for the [ImageId] property.\n\
  \             \n\
  \              }\n\
  \         {-  The Auto Scaling group uses the launch template's [$Latest] or [$Default] version.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   When you receive a successful response from this operation, Amazon EC2 Auto Scaling \
   immediately begins replacing instances. You can check the status of this operation through the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeInstanceRefreshes.html}DescribeInstanceRefreshes} \
   API operation. \n\
  \   "]

module SetDesiredCapacity : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_desired_capacity_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_desired_capacity_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the size of the specified Auto Scaling group.\n\n\
  \ If a scale-in activity occurs as a result of a new [DesiredCapacity] value that is lower than \
   the current size of the group, the Auto Scaling group uses its termination policy to determine \
   which instances to terminate. \n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-manually.html}Manual \
   scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

module SetInstanceHealth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_instance_health_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_instance_health_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the health status of the specified instance.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/set-up-a-custom-health-check.html}Set \
   up a custom health check for your Auto Scaling group} in the {i Amazon EC2 Auto Scaling User \
   Guide}.\n\
  \ "]

module SetInstanceProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_instance_protection_query ->
    ( set_instance_protection_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_instance_protection_query ->
    ( set_instance_protection_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the instance protection settings of the specified instances. This operation cannot be \
   called on instances in a warm pool.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html}Use \
   instance scale-in protection} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  If you exceed your maximum limit of instance IDs, which is 50 per Auto Scaling group, the \
   call fails.\n\
  \  "]

module StartInstanceRefresh : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
    | `LimitExceededFault of limit_exceeded_fault
    | `ResourceContentionFault of resource_contention_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_instance_refresh_type ->
    ( start_instance_refresh_answer,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_instance_refresh_type ->
    ( start_instance_refresh_answer Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InstanceRefreshInProgressFault of instance_refresh_in_progress_fault
      | `LimitExceededFault of limit_exceeded_fault
      | `ResourceContentionFault of resource_contention_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an instance refresh.\n\n\
  \ This operation is part of the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh.html}instance \
   refresh feature} in Amazon EC2 Auto Scaling, which helps you update instances in your Auto \
   Scaling group. This feature is helpful, for example, when you have a new AMI or a new user data \
   script. You just need to create a new launch template that specifies the new AMI or user data \
   script. Then start an instance refresh to immediately begin the process of updating instances \
   in the group. \n\
  \ \n\
  \  If successful, the request's response contains a unique ID that you can use to track the \
   progress of the instance refresh. To query its status, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeInstanceRefreshes.html}DescribeInstanceRefreshes} \
   API. To describe the instance refreshes that have already run, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeInstanceRefreshes.html}DescribeInstanceRefreshes} \
   API. To cancel an instance refresh that is in progress, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_CancelInstanceRefresh.html}CancelInstanceRefresh} \
   API. \n\
  \  \n\
  \   An instance refresh might fail for several reasons, such as EC2 launch failures, \
   misconfigured health checks, or not ignoring or allowing the termination of instances that are \
   in [Standby] state or protected from scale in. You can monitor for failed EC2 launches using \
   the scaling activities. To find the scaling activities, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
   API.\n\
  \   \n\
  \    If you enable auto rollback, your Auto Scaling group will be rolled back automatically when \
   the instance refresh fails. You can enable this feature before starting an instance refresh by \
   specifying the [AutoRollback] property in the instance refresh preferences. Otherwise, to roll \
   back an instance refresh before it finishes, use the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_RollbackInstanceRefresh.html}RollbackInstanceRefresh} \
   API. \n\
  \    "]

module SuspendProcesses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ResourceInUseFault of resource_in_use_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    scaling_process_query ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ResourceInUseFault of resource_in_use_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Suspends the specified auto scaling processes, or all processes, for the specified Auto Scaling \
   group.\n\n\
  \ If you suspend either the [Launch] or [Terminate] process types, it can prevent other process \
   types from functioning properly. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html}Suspend \
   and resume Amazon EC2 Auto Scaling processes} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ \n\
  \  To resume processes that have been suspended, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_ResumeProcesses.html}ResumeProcesses} \
   API.\n\
  \  "]

module TerminateInstanceInAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_instance_in_auto_scaling_group_type ->
    ( activity_type,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_instance_in_auto_scaling_group_type ->
    ( activity_type Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Terminates the specified instance and optionally adjusts the desired group size. This operation \
   cannot be called on instances in a warm pool.\n\n\
  \ This call simply makes a termination request. The instance is not terminated immediately. When \
   an instance is terminated, the instance status changes to [terminated]. You can't connect to or \
   start an instance after you've terminated it.\n\
  \ \n\
  \  If you do not specify the option to decrement the desired capacity, Amazon EC2 Auto Scaling \
   launches instances to replace the ones that are terminated. \n\
  \  \n\
  \   By default, Amazon EC2 Auto Scaling balances instances across all Availability Zones. If you \
   decrement the desired capacity, your Auto Scaling group can become unbalanced between \
   Availability Zones. Amazon EC2 Auto Scaling tries to rebalance the group, and rebalancing might \
   terminate instances in other zones. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-manually.html}Manual \
   scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

module UpdateAutoScalingGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceContentionFault of resource_contention_fault
    | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault
    | `ServiceLinkedRoleFailure of service_linked_role_failure ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_auto_scaling_group_type ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceContentionFault of resource_contention_fault
      | `ScalingActivityInProgressFault of scaling_activity_in_progress_fault
      | `ServiceLinkedRoleFailure of service_linked_role_failure ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " {b We strongly recommend that all Auto Scaling groups use launch templates to ensure full \
   functionality for Amazon EC2 Auto Scaling and Amazon EC2.} \n\n\
  \ Updates the configuration for the specified Auto Scaling group.\n\
  \ \n\
  \  To update an Auto Scaling group, specify the name of the group and the property that you want \
   to change. Any properties that you don't specify are not changed by this update request. The \
   new settings take effect on any scaling activities after this call returns. \n\
  \  \n\
  \   If you associate a new launch configuration or template with an Auto Scaling group, all new \
   instances will get the updated configuration. Existing instances continue to run with the \
   configuration that they were originally launched with. When you update a group to specify a \
   mixed instances policy instead of a launch configuration or template, existing instances may be \
   replaced to match the new purchasing options that you specified in the policy. For example, if \
   the group currently has 100% On-Demand capacity and the policy specifies 50% Spot capacity, \
   this means that half of your instances will be gradually terminated and relaunched as Spot \
   Instances. When replacing instances, Amazon EC2 Auto Scaling launches new instances before \
   terminating the old ones, so that updating your group does not compromise the performance or \
   availability of your application.\n\
  \   \n\
  \    Note the following about changing [DesiredCapacity], [MaxSize], or [MinSize]:\n\
  \    \n\
  \     {ul\n\
  \           {-  If a scale-in activity occurs as a result of a new [DesiredCapacity] value that \
   is lower than the current size of the group, the Auto Scaling group uses its termination policy \
   to determine which instances to terminate.\n\
  \               \n\
  \                }\n\
  \           {-  If you specify a new value for [MinSize] without specifying a value for \
   [DesiredCapacity], and the new [MinSize] is larger than the current size of the group, this \
   sets the group's [DesiredCapacity] to the new [MinSize] value.\n\
  \               \n\
  \                }\n\
  \           {-  If you specify a new value for [MaxSize] without specifying a value for \
   [DesiredCapacity], and the new [MaxSize] is smaller than the current size of the group, this \
   sets the group's [DesiredCapacity] to the new [MaxSize] value.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To see which properties have been set, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAutoScalingGroups.html}DescribeAutoScalingGroups} \
   API. To view the scaling policies for an Auto Scaling group, call the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribePolicies.html}DescribePolicies} \
   API. If the group has scaling policies, you can update them by calling the \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PutScalingPolicy.html}PutScalingPolicy} \
   API.\n\
  \   "]
