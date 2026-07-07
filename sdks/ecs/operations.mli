open Types

module ContinueServiceDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceDeploymentNotFoundException of service_deployment_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    continue_service_deployment_request ->
    ( continue_service_deployment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceDeploymentNotFoundException of service_deployment_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    continue_service_deployment_request ->
    ( continue_service_deployment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceDeploymentNotFoundException of service_deployment_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Continues or rolls back an Amazon ECS service deployment that is paused at a lifecycle hook.\n\n\
  \ When a service deployment reaches a lifecycle stage that has a [PAUSE] hook configured, the \
   deployment pauses and waits for an explicit action. Use this API to either continue the \
   deployment to the next stage or roll back to the previous service revision.\n\
  \ \n\
  \  To find the [hookId] of the paused hook, call \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServiceDeployments.html}DescribeServiceDeployments} \
   and inspect the [lifecycleHookDetails] field.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/continue-service-deployment.html}Continuing \
   Amazon ECS service deployments} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   "]

module CreateCapacityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception
    | `UpdateInProgressException of update_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_capacity_provider_request ->
    ( create_capacity_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception
      | `UpdateInProgressException of update_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_capacity_provider_request ->
    ( create_capacity_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception
      | `UpdateInProgressException of update_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a capacity provider. Capacity providers are associated with a cluster and are used in \
   capacity provider strategies to facilitate cluster auto scaling. You can create capacity \
   providers for Amazon ECS Managed Instances and EC2 instances. Fargate has the predefined \
   [FARGATE] and [FARGATE_SPOT] capacity providers.\n"]

module CreateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NamespaceNotFoundException of namespace_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_cluster_request ->
    ( create_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Amazon ECS cluster. By default, your account receives a [default] cluster when \
   you launch your first container instance. However, you can create your own cluster with a \
   unique name.\n\n\
  \  When you call the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateCluster.html}CreateCluster} \
   API operation, Amazon ECS attempts to create the Amazon ECS service-linked role for your \
   account. This is so that it can manage required resources in other Amazon Web Services services \
   on your behalf. However, if the user that makes the call doesn't have permissions to create the \
   service-linked role, it isn't created. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using-service-linked-roles.html}Using \
   service-linked roles for Amazon ECS} in the {i Amazon Elastic Container Service Developer \
   Guide}.\n\
  \  \n\
  \   "]

module CreateDaemon : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `PlatformUnknownException of platform_unknown_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_daemon_request ->
    ( create_daemon_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_daemon_request ->
    ( create_daemon_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new daemon in the specified cluster and capacity providers. A daemon deploys \
   cross-cutting software agents such as security monitoring, telemetry, and logging independently \
   across your Amazon ECS infrastructure.\n\n\
  \ Amazon ECS deploys exactly one daemon task on each container instance of the specified \
   capacity providers. When a container instance registers with the cluster, Amazon ECS \
   automatically starts daemon tasks. Amazon ECS starts a daemon task before scheduling other \
   tasks.\n\
  \ \n\
  \  Daemons are essential for instance health - if a daemon task stops, Amazon ECS automatically \
   drains and replaces that container instance.\n\
  \  \n\
  \    ECS Managed Daemons is only supported for Amazon ECS Managed Instances Capacity Providers.\n\
  \    \n\
  \     "]

module CreateExpressGatewayService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `PlatformTaskDefinitionIncompatibilityException of
      platform_task_definition_incompatibility_exception
    | `PlatformUnknownException of platform_unknown_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_express_gateway_service_request ->
    ( create_express_gateway_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_express_gateway_service_request ->
    ( create_express_gateway_service_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Express service that simplifies deploying containerized web applications on Amazon \
   ECS with managed Amazon Web Services infrastructure. This operation provisions and configures \
   Application Load Balancers, target groups, security groups, and auto-scaling policies \
   automatically.\n\n\
  \ Specify a primary container configuration with your application image and basic settings. \
   Amazon ECS creates the necessary Amazon Web Services resources for traffic distribution, health \
   monitoring, network access control, and capacity management.\n\
  \ \n\
  \  Provide an execution role for task operations and an infrastructure role for managing Amazon \
   Web Services resources on your behalf.\n\
  \  "]

module CreateService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NamespaceNotFoundException of namespace_not_found_exception
    | `PlatformTaskDefinitionIncompatibilityException of
      platform_task_definition_incompatibility_exception
    | `PlatformUnknownException of platform_unknown_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_service_request ->
    ( create_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_service_request ->
    ( create_service_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Runs and maintains your desired number of tasks from a specified task definition. If the number \
   of tasks running in a service drops below the [desiredCount], Amazon ECS runs another copy of \
   the task in the specified cluster. To update an existing service, use \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService}.\n\n\
  \  On March 21, 2024, a change was made to resolve the task definition revision before \
   authorization. When a task definition revision is not specified, authorization will occur using \
   the latest revision of a task definition.\n\
  \  \n\
  \     Amazon Elastic Inference (EI) is no longer available to customers.\n\
  \     \n\
  \       In addition to maintaining the desired count of tasks in your service, you can \
   optionally run your service behind one or more load balancers. The load balancers distribute \
   traffic across the tasks that are associated with the service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-load-balancing.html}Service \
   load balancing} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \       \n\
  \        You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the volume when \
   creating or updating a service. [volumeConfigurations] is only supported for REPLICA service \
   and not DAEMON service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types}Amazon \
   EBS volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \        \n\
  \         Tasks for services that don't use a load balancer are considered healthy if they're in \
   the [RUNNING] state. Tasks for services that use a load balancer are considered healthy if \
   they're in the [RUNNING] state and are reported as healthy by the load balancer.\n\
  \         \n\
  \          There are two service scheduler strategies available:\n\
  \          \n\
  \           {ul\n\
  \                 {-   [REPLICA] - The replica scheduling strategy places and maintains your \
   desired number of tasks across your cluster. By default, the service scheduler spreads tasks \
   across Availability Zones. You can use task placement strategies and constraints to customize \
   task placement decisions. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html}Service \
   scheduler concepts} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \                     \n\
  \                      }\n\
  \                 {-   [DAEMON] - The daemon scheduling strategy deploys exactly one task on \
   each active container instance that meets all of the task placement constraints that you \
   specify in your cluster. The service scheduler also evaluates the task placement constraints \
   for running tasks. It also stops tasks that don't meet the placement constraints. When using \
   this strategy, you don't need to specify a desired number of tasks, a task placement strategy, \
   or use Service Auto Scaling policies. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html}Amazon ECS \
   services} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \                     \n\
  \                      }\n\
  \                 }\n\
  \   The deployment controller is the mechanism that determines how tasks are deployed for your \
   service. The valid options are:\n\
  \   \n\
  \    {ul\n\
  \          {-  ECS\n\
  \              \n\
  \                When you create a service which uses the [ECS] deployment controller, you can \
   choose between the following deployment strategies (which you can set in the \
   \226\128\156[strategy]\226\128\157 field in \226\128\156[deploymentConfiguration]\226\128\157): \
   :\n\
  \               \n\
  \                {ul\n\
  \                      {-   [ROLLING]: When you create a service which uses the {i rolling \
   update} ([ROLLING]) deployment strategy, the Amazon ECS service scheduler replaces the \
   currently running tasks with new tasks. The number of tasks that Amazon ECS adds or removes \
   from the service during a rolling update is controlled by the service deployment configuration. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-ecs.html}Deploy \
   Amazon ECS services by replacing tasks} in the {i Amazon Elastic Container Service Developer \
   Guide}.\n\
  \                          \n\
  \                           Rolling update deployments are best suited for the following \
   scenarios:\n\
  \                           \n\
  \                            {ul\n\
  \                                  {-  Gradual service updates: You need to update your service \
   incrementally without taking the entire service offline at once.\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Limited resource requirements: You want to avoid the \
   additional resource costs of running two complete environments simultaneously (as required by \
   blue/green deployments).\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Acceptable deployment time: Your application can tolerate \
   a longer deployment process, as rolling updates replace tasks one by one.\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  No need for instant roll back: Your service can tolerate \
   a rollback process that takes minutes rather than seconds.\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Simple deployment process: You prefer a straightforward \
   deployment approach without the complexity of managing multiple environments, target groups, \
   and listeners.\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  No load balancer requirement: Your service doesn't use or \
   require a load balancer, Application Load Balancer, Network Load Balancer, or Service Connect \
   (which are required for blue/green deployments).\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Stateful applications: Your application maintains state \
   that makes it difficult to run two parallel environments.\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Cost sensitivity: You want to minimize deployment costs \
   by not running duplicate environments during deployment.\n\
  \                                      \n\
  \                                       }\n\
  \                                  \n\
  \                       }\n\
  \                        Rolling updates are the default deployment strategy for services and \
   provide a balance between deployment safety and resource efficiency for many common application \
   scenarios.\n\
  \                        \n\
  \                         }\n\
  \                      {-   [BLUE_GREEN]: A {i blue/green} deployment strategy ([BLUE_GREEN]) is \
   a release methodology that reduces downtime and risk by running two identical production \
   environments called blue and green. With Amazon ECS blue/green deployments, you can validate \
   new service revisions before directing production traffic to them. This approach provides a \
   safer way to deploy changes with the ability to quickly roll back if needed. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-type-blue-green.html}Amazon \
   ECS blue/green deployments} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \                          \n\
  \                           Amazon ECS blue/green deployments are best suited for the following \
   scenarios:\n\
  \                           \n\
  \                            {ul\n\
  \                                  {-  Service validation: When you need to validate new service \
   revisions before directing production traffic to them\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Zero downtime: When your service requires zero-downtime \
   deployments\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Instant roll back: When you need the ability to quickly \
   roll back if issues are detected\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Load balancer requirement: When your service uses \
   Application Load Balancer, Network Load Balancer, or Service Connect\n\
  \                                      \n\
  \                                       }\n\
  \                                  \n\
  \                       }\n\
  \                        }\n\
  \                      {-   [LINEAR]: A {i linear} deployment strategy ([LINEAR]) gradually \
   shifts traffic from the current production environment to a new environment in equal percentage \
   increments. With Amazon ECS linear deployments, you can control the pace of traffic shifting \
   and validate new service revisions with increasing amounts of production traffic.\n\
  \                          \n\
  \                           Linear deployments are best suited for the following scenarios:\n\
  \                           \n\
  \                            {ul\n\
  \                                  {-  Gradual validation: When you want to gradually validate \
   your new service version with increasing traffic\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Performance monitoring: When you need time to monitor \
   metrics and performance during the deployment\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Risk minimization: When you want to minimize risk by \
   exposing the new version to production traffic incrementally\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Load balancer requirement: When your service uses \
   Application Load Balancer or Service Connect\n\
  \                                      \n\
  \                                       }\n\
  \                                  \n\
  \                       }\n\
  \                        }\n\
  \                      {-   [CANARY]: A {i canary} deployment strategy ([CANARY]) shifts a small \
   percentage of traffic to the new service revision first, then shifts the remaining traffic all \
   at once after a specified time period. This allows you to test the new version with a subset of \
   users before full deployment.\n\
  \                          \n\
  \                           Canary deployments are best suited for the following scenarios:\n\
  \                           \n\
  \                            {ul\n\
  \                                  {-  Feature testing: When you want to test new features with \
   a small subset of users before full rollout\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Production validation: When you need to validate \
   performance and functionality with real production traffic\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Blast radius control: When you want to minimize blast \
   radius if issues are discovered in the new version\n\
  \                                      \n\
  \                                       }\n\
  \                                  {-  Load balancer requirement: When your service uses \
   Application Load Balancer or Service Connect\n\
  \                                      \n\
  \                                       }\n\
  \                                  \n\
  \                       }\n\
  \                        }\n\
  \                      \n\
  \           }\n\
  \            }\n\
  \          {-  External\n\
  \              \n\
  \               Use a third-party deployment controller.\n\
  \               \n\
  \                }\n\
  \          {-  Blue/green deployment (powered by CodeDeploy)\n\
  \              \n\
  \               CodeDeploy installs an updated version of the application as a new replacement \
   task set and reroutes production traffic from the original application task set to the \
   replacement task set. The original task set is terminated after a successful deployment. Use \
   this deployment controller to verify a new deployment of a service before sending production \
   traffic to it.\n\
  \               \n\
  \                }\n\
  \          }\n\
  \   When creating a service that uses the [EXTERNAL] deployment controller, you can specify only \
   parameters that aren't controlled at the task set level. The only required parameter is the \
   service name. You control your services using the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateTaskSet.html}CreateTaskSet}. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}Amazon ECS \
   deployment types} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   \n\
  \    When the service scheduler launches new tasks, it determines task placement. For \
   information about task placement and task placement strategies, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement.html}Amazon ECS \
   task placement} in the {i Amazon Elastic Container Service Developer Guide} \n\
  \    "]

module CreateTaskSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NamespaceNotFoundException of namespace_not_found_exception
    | `PlatformTaskDefinitionIncompatibilityException of
      platform_task_definition_incompatibility_exception
    | `PlatformUnknownException of platform_unknown_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_task_set_request ->
    ( create_task_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_task_set_request ->
    ( create_task_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create a task set in the specified cluster and service. This is used when a service uses the \
   [EXTERNAL] deployment controller type. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}Amazon ECS \
   deployment types} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
  \  On March 21, 2024, a change was made to resolve the task definition revision before \
   authorization. When a task definition revision is not specified, authorization will occur using \
   the latest revision of a task definition.\n\
  \  \n\
  \    For information about the maximum number of task sets and other quotas, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-quotas.html}Amazon ECS \
   service quotas} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \    "]

module DeleteAccountSetting : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_account_setting_request ->
    ( delete_account_setting_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_account_setting_request ->
    ( delete_account_setting_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables an account setting for a specified user, role, or the root user for an account.\n"]

module DeleteAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `TargetNotFoundException of target_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_attributes_request ->
    ( delete_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TargetNotFoundException of target_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_attributes_request ->
    ( delete_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TargetNotFoundException of target_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes one or more custom attributes from an Amazon ECS resource.\n"]

module DeleteCapacityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception
    | `UpdateInProgressException of update_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_capacity_provider_request ->
    ( delete_capacity_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception
      | `UpdateInProgressException of update_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_capacity_provider_request ->
    ( delete_capacity_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception
      | `UpdateInProgressException of update_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified capacity provider.\n\n\
  \  The [FARGATE] and [FARGATE_SPOT] capacity providers are reserved and can't be deleted. You \
   can disassociate them from a cluster using either \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
   or by deleting the cluster.\n\
  \  \n\
  \    Prior to a capacity provider being deleted, the capacity provider must be removed from the \
   capacity provider strategy from all services. The \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService} \
   API can be used to remove a capacity provider from a service's capacity provider strategy. When \
   updating a service, the [forceNewDeployment] option can be used to ensure that any tasks using \
   the Amazon EC2 instance capacity provided by the capacity provider are transitioned to use the \
   capacity from the remaining capacity providers. Only capacity providers that aren't associated \
   with a cluster can be deleted. To remove a capacity provider from a cluster, you can either use \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
   or delete the cluster.\n\
  \    "]

module DeleteCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterContainsCapacityProviderException of cluster_contains_capacity_provider_exception
    | `ClusterContainsContainerInstancesException of cluster_contains_container_instances_exception
    | `ClusterContainsServicesException of cluster_contains_services_exception
    | `ClusterContainsTasksException of cluster_contains_tasks_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UpdateInProgressException of update_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterContainsCapacityProviderException of cluster_contains_capacity_provider_exception
      | `ClusterContainsContainerInstancesException of
        cluster_contains_container_instances_exception
      | `ClusterContainsServicesException of cluster_contains_services_exception
      | `ClusterContainsTasksException of cluster_contains_tasks_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cluster_request ->
    ( delete_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterContainsCapacityProviderException of cluster_contains_capacity_provider_exception
      | `ClusterContainsContainerInstancesException of
        cluster_contains_container_instances_exception
      | `ClusterContainsServicesException of cluster_contains_services_exception
      | `ClusterContainsTasksException of cluster_contains_tasks_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified cluster. The cluster transitions to the [INACTIVE] state. Clusters with \
   an [INACTIVE] status might remain discoverable in your account for a period of time. However, \
   this behavior is subject to change in the future. We don't recommend that you rely on \
   [INACTIVE] clusters persisting.\n\n\
  \ You must deregister all container instances from this cluster before you may delete it. You \
   can list the container instances in a cluster with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListContainerInstances.html}ListContainerInstances} \
   and deregister them with \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeregisterContainerInstance.html}DeregisterContainerInstance}.\n\
  \ "]

module DeleteDaemon : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `DaemonNotActiveException of daemon_not_active_exception
    | `DaemonNotFoundException of daemon_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_daemon_request ->
    ( delete_daemon_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `DaemonNotActiveException of daemon_not_active_exception
      | `DaemonNotFoundException of daemon_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_daemon_request ->
    ( delete_daemon_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `DaemonNotActiveException of daemon_not_active_exception
      | `DaemonNotFoundException of daemon_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified daemon. The daemon must be in an [ACTIVE] state to be deleted. Deleting a \
   daemon stops all running daemon tasks on the associated container instances. Amazon ECS drains \
   existing container instances and provisions new instances without the deleted daemon. Amazon \
   ECS automatically launches replacement tasks for your Amazon ECS services.\n\n\
  \  ECS Managed Daemons is only supported for Amazon ECS Managed Instances Capacity Providers.\n\
  \  \n\
  \   "]

module DeleteDaemonTaskDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_daemon_task_definition_request ->
    ( delete_daemon_task_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_daemon_task_definition_request ->
    ( delete_daemon_task_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified daemon task definition. After a daemon task definition is deleted, no new \
   daemons can be created using this definition. Existing daemons that reference the deleted \
   daemon task definition continue to run.\n\n\
  \ A daemon task definition must be in an [ACTIVE] state to be deleted.\n\
  \ "]

module DeleteExpressGatewayService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_express_gateway_service_request ->
    ( delete_express_gateway_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_express_gateway_service_request ->
    ( delete_express_gateway_service_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Express service and removes all associated Amazon Web Services resources. This \
   operation stops service tasks, removes the Application Load Balancer, target groups, security \
   groups, auto-scaling policies, and other managed infrastructure components.\n\n\
  \ The service enters a [DRAINING] state where existing tasks complete current requests without \
   starting new tasks. After all tasks stop, the service and infrastructure are permanently \
   removed.\n\
  \ \n\
  \  This operation cannot be reversed. Back up important data and verify the service is no longer \
   needed before deletion.\n\
  \  "]

module DeleteService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotFoundException of service_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_service_request ->
    ( delete_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_service_request ->
    ( delete_service_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified service within a cluster. You can delete a service if you have no running \
   tasks in it and the desired task count is zero. If the service is actively maintaining tasks, \
   you can't delete it, and you must update the service to a desired task count of zero. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService}.\n\n\
  \  When you delete a service, if there are still running tasks that require cleanup, the service \
   status moves from [ACTIVE] to [DRAINING], and the service is no longer visible in the console \
   or in the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListServices.html}ListServices} \
   API operation. After all tasks have transitioned to either [STOPPING] or [STOPPED] status, the \
   service status moves from [DRAINING] to [INACTIVE]. Services in the [DRAINING] or [INACTIVE] \
   status can still be viewed with the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServices.html}DescribeServices} \
   API operation. However, in the future, [INACTIVE] services may be cleaned up and purged from \
   Amazon ECS record keeping, and \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServices.html}DescribeServices} \
   calls on those services return a [ServiceNotFoundException] error.\n\
  \  \n\
  \     If you attempt to create a new service with the same name as an existing service in either \
   [ACTIVE] or [DRAINING] status, you receive an error.\n\
  \     \n\
  \      "]

module DeleteTaskDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_task_definitions_request ->
    ( delete_task_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_task_definitions_request ->
    ( delete_task_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes one or more task definitions.\n\n\
  \ You must deregister a task definition revision before you delete it. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeregisterTaskDefinition.html}DeregisterTaskDefinition}.\n\
  \ \n\
  \  When you delete a task definition revision, it is immediately transitions from the [INACTIVE] \
   to [DELETE_IN_PROGRESS]. Existing tasks and services that reference a [DELETE_IN_PROGRESS] task \
   definition revision continue to run without disruption. Existing services that reference a \
   [DELETE_IN_PROGRESS] task definition revision can still scale up or down by modifying the \
   service's desired count.\n\
  \  \n\
  \   You can't use a [DELETE_IN_PROGRESS] task definition revision to run new tasks or create new \
   services. You also can't update an existing service to reference a [DELETE_IN_PROGRESS] task \
   definition revision.\n\
  \   \n\
  \     A task definition revision will stay in [DELETE_IN_PROGRESS] status until all the \
   associated tasks and services have been terminated.\n\
  \    \n\
  \     When you delete all [INACTIVE] task definition revisions, the task definition name is not \
   displayed in the console and not returned in the API. If a task definition revisions are in the \
   [DELETE_IN_PROGRESS] state, the task definition name is displayed in the console and returned \
   in the API. The task definition name is retained by Amazon ECS and the revision is incremented \
   the next time you create a task definition with that name.\n\
  \     "]

module DeleteTaskSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `TaskSetNotFoundException of task_set_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_task_set_request ->
    ( delete_task_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `TaskSetNotFoundException of task_set_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_task_set_request ->
    ( delete_task_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `TaskSetNotFoundException of task_set_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified task set within a service. This is used when a service uses the [EXTERNAL] \
   deployment controller type. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}Amazon ECS \
   deployment types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

module DeregisterContainerInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_container_instance_request ->
    ( deregister_container_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_container_instance_request ->
    ( deregister_container_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters an Amazon ECS container instance from the specified cluster. This instance is no \
   longer available to run tasks.\n\n\
  \ If you intend to use the container instance for some other purpose after deregistration, we \
   recommend that you stop all of the tasks running on the container instance before \
   deregistration. That prevents any orphaned tasks from consuming resources.\n\
  \ \n\
  \  Deregistering a container instance removes the instance from a cluster, but it doesn't \
   terminate the EC2 instance. If you are finished using the instance, be sure to terminate it in \
   the Amazon EC2 console to stop billing.\n\
  \  \n\
  \    If you terminate a running container instance, Amazon ECS automatically deregisters the \
   instance from your cluster (stopped container instances or instances with disconnected agents \
   aren't automatically deregistered when terminated).\n\
  \    \n\
  \     "]

module DeregisterTaskDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_task_definition_request ->
    ( deregister_task_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_task_definition_request ->
    ( deregister_task_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters the specified task definition by family and revision. Upon deregistration, the task \
   definition is marked as [INACTIVE]. Existing tasks and services that reference an [INACTIVE] \
   task definition continue to run without disruption. Existing services that reference an \
   [INACTIVE] task definition can still scale up or down by modifying the service's desired count. \
   If you want to delete a task definition revision, you must first deregister the task definition \
   revision.\n\n\
  \ You can't use an [INACTIVE] task definition to run new tasks or create new services, and you \
   can't update an existing service to reference an [INACTIVE] task definition. However, there may \
   be up to a 10-minute window following deregistration where these restrictions have not yet \
   taken effect.\n\
  \ \n\
  \   At this time, [INACTIVE] task definitions remain discoverable in your account indefinitely. \
   However, this behavior is subject to change in the future. We don't recommend that you rely on \
   [INACTIVE] task definitions persisting beyond the lifecycle of any associated tasks and \
   services.\n\
  \   \n\
  \     You must deregister a task definition revision before you delete it. For more information, \
   see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeleteTaskDefinitions.html}DeleteTaskDefinitions}.\n\
  \     "]

module DescribeCapacityProviders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_capacity_providers_request ->
    ( describe_capacity_providers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_capacity_providers_request ->
    ( describe_capacity_providers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes one or more of your capacity providers.\n"]

module DescribeClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_request ->
    ( describe_clusters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_clusters_request ->
    ( describe_clusters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more of your clusters.\n\n\
  \  For CLI examples, see \
   {{:https://github.com/aws/aws-cli/blob/develop/awscli/examples/ecs/describe-clusters.rst}describe-clusters.rst} \
   on GitHub.\n\
  \ "]

module DescribeContainerInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_container_instances_request ->
    ( describe_container_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_container_instances_request ->
    ( describe_container_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more container instances. Returns metadata about each container instance \
   requested.\n"]

module DescribeDaemon : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `DaemonNotFoundException of daemon_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_request ->
    ( describe_daemon_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `DaemonNotFoundException of daemon_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_request ->
    ( describe_daemon_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `DaemonNotFoundException of daemon_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified daemon.\n"]

module DescribeDaemonDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_deployments_request ->
    ( describe_daemon_deployments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_deployments_request ->
    ( describe_daemon_deployments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more of your daemon deployments.\n\n\
  \ A daemon deployment orchestrates the progressive rollout of daemon task updates across \
   container instances managed by the daemon's capacity providers. Each deployment includes \
   circuit breaker and alarm-based rollback capabilities.\n\
  \ "]

module DescribeDaemonRevisions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_revisions_request ->
    ( describe_daemon_revisions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_revisions_request ->
    ( describe_daemon_revisions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more of your daemon revisions.\n\n\
  \ A daemon revision is a snapshot of a daemon's configuration at the time a deployment was \
   initiated. It captures the daemon task definition, container images, tag propagation, and \
   execute command settings. Daemon revisions are immutable.\n\
  \ "]

module DescribeDaemonTaskDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_task_definition_request ->
    ( describe_daemon_task_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_daemon_task_definition_request ->
    ( describe_daemon_task_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a daemon task definition. You can specify a [family] and [revision] to find \
   information about a specific daemon task definition, or you can simply specify the family to \
   find the latest [ACTIVE] revision in that family.\n"]

module DescribeExpressGatewayService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_express_gateway_service_request ->
    ( describe_express_gateway_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_express_gateway_service_request ->
    ( describe_express_gateway_service_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about an Express service, including current status, \
   configuration, managed infrastructure, and service revisions.\n\n\
  \ Returns comprehensive service details, active service revisions, ingress paths with endpoints, \
   and managed Amazon Web Services resource status including load balancers and auto-scaling \
   policies.\n\
  \ \n\
  \  Use the [include] parameter to retrieve additional information such as resource tags.\n\
  \  "]

module DescribeServiceDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_deployments_request ->
    ( describe_service_deployments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_deployments_request ->
    ( describe_service_deployments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more of your service deployments.\n\n\
  \ A service deployment happens when you release a software update for the service. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-deployment.html}View \
   service history using Amazon ECS service deployments}.\n\
  \ "]

module DescribeServiceRevisions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_service_revisions_request ->
    ( describe_service_revisions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_service_revisions_request ->
    ( describe_service_revisions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes one or more service revisions.\n\n\
  \ A service revision is a version of the service that includes the values for the Amazon ECS \
   resources (for example, task definition) and the environment resources (for example, load \
   balancers, subnets, and security groups). For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-revision.html}Amazon ECS \
   service revisions}.\n\
  \ \n\
  \  You can't describe a service revision that was created before October 25, 2024.\n\
  \  "]

module DescribeServices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_services_request ->
    ( describe_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_services_request ->
    ( describe_services_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the specified services running in your cluster.\n"]

module DescribeTaskDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_task_definition_request ->
    ( describe_task_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_task_definition_request ->
    ( describe_task_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a task definition. You can specify a [family] and [revision] to find information \
   about a specific task definition, or you can simply specify the family to find the latest \
   [ACTIVE] revision in that family.\n\n\
  \  You can only describe [INACTIVE] task definitions while an active task or service references \
   them.\n\
  \  \n\
  \   "]

module DescribeTaskSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_task_sets_request ->
    ( describe_task_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_task_sets_request ->
    ( describe_task_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the task sets in the specified cluster and service. This is used when a service uses \
   the [EXTERNAL] deployment controller type. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}Amazon ECS \
   Deployment Types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

module DescribeTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tasks_request ->
    ( describe_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tasks_request ->
    ( describe_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a specified task or tasks.\n\n\
  \ Currently, stopped tasks appear in the returned results for at least one hour.\n\
  \ \n\
  \  If you have tasks with tags, and then delete the cluster, the tagged tasks are returned in \
   the response. If you create a new cluster with the same name as the deleted cluster, the tagged \
   tasks are not included in the response.\n\
  \  "]

module DiscoverPollEndpoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    discover_poll_endpoint_request ->
    ( discover_poll_endpoint_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    discover_poll_endpoint_request ->
    ( discover_poll_endpoint_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This action is only used by the Amazon ECS agent, and it is not intended for use outside of \
   the agent.\n\
  \ \n\
  \   Returns an endpoint for the Amazon ECS agent to poll for updates.\n\
  \   "]

module ExecuteCommand : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `TargetNotConnectedException of target_not_connected_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_command_request ->
    ( execute_command_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TargetNotConnectedException of target_not_connected_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_command_request ->
    ( execute_command_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TargetNotConnectedException of target_not_connected_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Runs a command remotely on a container within a task.\n\n\
  \ If you use a condition key in your IAM policy to refine the conditions for the policy \
   statement, for example limit the actions to a specific cluster, you receive an \
   [AccessDeniedException] when there is a mismatch between the condition key value and the \
   corresponding parameter value.\n\
  \ \n\
  \  For information about required permissions and considerations, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-exec.html}Using Amazon ECS \
   Exec for debugging} in the {i Amazon ECS Developer Guide}. \n\
  \  "]

module GetTaskProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_task_protection_request ->
    ( get_task_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_task_protection_request ->
    ( get_task_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the protection status of tasks in an Amazon ECS service.\n"]

module ListAccountSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_account_settings_request ->
    ( list_account_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_account_settings_request ->
    ( list_account_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the account settings for a specified principal.\n"]

module ListAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_attributes_request ->
    ( list_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_attributes_request ->
    ( list_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the attributes for Amazon ECS resources within a specified target type and cluster. When \
   you specify a target type and cluster, [ListAttributes] returns a list of attribute objects, \
   one for each attribute on each resource. You can filter the list of results to a single \
   attribute name to only return results that have that name. You can also filter the results by \
   attribute name and value. You can do this, for example, to see which container instances in a \
   cluster are running a Linux AMI ([ecs.os-type=linux]). \n"]

module ListClusters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_request ->
    ( list_clusters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_clusters_request ->
    ( list_clusters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of existing clusters.\n"]

module ListContainerInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_container_instances_request ->
    ( list_container_instances_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_container_instances_request ->
    ( list_container_instances_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of container instances in a specified cluster. You can filter the results of a \
   [ListContainerInstances] operation with cluster query language statements inside the [filter] \
   parameter. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html}Cluster \
   Query Language} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

module ListDaemonDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_daemon_deployments_request ->
    ( list_daemon_deployments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_daemon_deployments_request ->
    ( list_daemon_deployments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of daemon deployments for a specified daemon. You can filter the results by \
   status or creation time.\n"]

module ListDaemonTaskDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_daemon_task_definitions_request ->
    ( list_daemon_task_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_daemon_task_definitions_request ->
    ( list_daemon_task_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of daemon task definitions that are registered to your account. You can filter \
   the results by family name, status, or both to find daemon task definitions that match your \
   criteria.\n"]

module ListDaemons : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_daemons_request ->
    ( list_daemons_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_daemons_request ->
    ( list_daemons_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of daemons. You can filter the results by cluster or capacity provider.\n"]

module ListServiceDeployments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_service_deployments_request ->
    ( list_service_deployments_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_service_deployments_request ->
    ( list_service_deployments_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation lists all the service deployments that meet the specified filter criteria.\n\n\
  \ A service deployment happens when you release a software update for the service. You route \
   traffic from the running service revisions to the new service revison and control the number of \
   running tasks. \n\
  \ \n\
  \  This API returns the values that you use for the request parameters in \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeServiceRevisions.html}DescribeServiceRevisions}.\n\
  \  "]

module ListServices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_services_request ->
    ( list_services_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_services_request ->
    ( list_services_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of services. You can filter the results by cluster, launch type, and scheduling \
   strategy.\n"]

module ListServicesByNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NamespaceNotFoundException of namespace_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_services_by_namespace_request ->
    ( list_services_by_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_services_by_namespace_request ->
    ( list_services_by_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation lists all of the services that are associated with a Cloud Map namespace. This \
   list might include services in different clusters. In contrast, [ListServices] can only list \
   services in one cluster at a time. If you need to filter the list of services in a single \
   cluster by various parameters, use [ListServices]. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html}Service \
   Connect} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the tags for an Amazon ECS resource.\n"]

module ListTaskDefinitionFamilies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_task_definition_families_request ->
    ( list_task_definition_families_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_task_definition_families_request ->
    ( list_task_definition_families_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of task definition families that are registered to your account. This list \
   includes task definition families that no longer have any [ACTIVE] task definition revisions.\n\n\
  \ You can filter out task definition families that don't contain any [ACTIVE] task definition \
   revisions by setting the [status] parameter to [ACTIVE]. You can also filter the results with \
   the [familyPrefix] parameter.\n\
  \ "]

module ListTaskDefinitions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_task_definitions_request ->
    ( list_task_definitions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_task_definitions_request ->
    ( list_task_definitions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of task definitions that are registered to your account. You can filter the \
   results by family name with the [familyPrefix] parameter or by status with the [status] \
   parameter.\n"]

module ListTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotFoundException of service_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tasks_request ->
    ( list_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tasks_request ->
    ( list_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotFoundException of service_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of tasks. You can filter the results by cluster, task definition family, \
   container instance, launch type, what IAM principal started the task, or by the desired status \
   of the task.\n\n\
  \ Recently stopped tasks might appear in the returned results. \n\
  \ "]

module PutAccountSetting : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_account_setting_request ->
    ( put_account_setting_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_account_setting_request ->
    ( put_account_setting_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an account setting. Account settings are set on a per-Region basis.\n\n\
  \ If you change the root user account setting, the default settings are reset for users and \
   roles that do not have specified individual account settings. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-account-settings.html}Account \
   Settings} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ "]

module PutAccountSettingDefault : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_account_setting_default_request ->
    ( put_account_setting_default_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_account_setting_default_request ->
    ( put_account_setting_default_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an account setting for all users on an account for whom no individual account setting \
   has been specified. Account settings are set on a per-Region basis.\n"]

module PutAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AttributeLimitExceededException of attribute_limit_exceeded_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `TargetNotFoundException of target_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_attributes_request ->
    ( put_attributes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttributeLimitExceededException of attribute_limit_exceeded_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TargetNotFoundException of target_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_attributes_request ->
    ( put_attributes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AttributeLimitExceededException of attribute_limit_exceeded_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `TargetNotFoundException of target_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Create or update an attribute on an Amazon ECS resource. If the attribute doesn't exist, it's \
   created. If the attribute exists, its value is replaced with the specified value. To delete an \
   attribute, use \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeleteAttributes.html}DeleteAttributes}. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html#attributes}Attributes} \
   in the {i Amazon Elastic Container Service Developer Guide}.\n"]

module PutClusterCapacityProviders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ServerException of server_exception
    | `UpdateInProgressException of update_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_cluster_capacity_providers_request ->
    ( put_cluster_capacity_providers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_cluster_capacity_providers_request ->
    ( put_cluster_capacity_providers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the available capacity providers and the default capacity provider strategy for a \
   cluster.\n\n\
  \ You must specify both the available capacity providers and a default capacity provider \
   strategy for the cluster. If the specified cluster has existing capacity providers associated \
   with it, you must specify all existing capacity providers in addition to any new ones you want \
   to add. Any existing capacity providers that are associated with a cluster that are omitted \
   from a \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_PutClusterCapacityProviders.html}PutClusterCapacityProviders} \
   API call will be disassociated with the cluster. You can only disassociate an existing capacity \
   provider from a cluster if it's not being used by any existing tasks.\n\
  \ \n\
  \  When creating a service or running a task on a cluster, if no capacity provider or launch \
   type is specified, then the cluster's default capacity provider strategy is used. We recommend \
   that you define a default capacity provider strategy for your cluster. However, you must \
   specify an empty array ([\\[\\]]) to bypass defining a default strategy.\n\
  \  \n\
  \   Amazon ECS Managed Instances doesn't support this, because when you create a capacity \
   provider with Amazon ECS Managed Instances, it becomes available only within the specified \
   cluster.\n\
  \   "]

module RegisterContainerInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_container_instance_request ->
    ( register_container_instance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_container_instance_request ->
    ( register_container_instance_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This action is only used by the Amazon ECS agent, and it is not intended for use outside of \
   the agent.\n\
  \ \n\
  \   Registers an EC2 instance into the specified cluster. This instance becomes available to \
   place containers on.\n\
  \   "]

module RegisterDaemonTaskDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_daemon_task_definition_request ->
    ( register_daemon_task_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_daemon_task_definition_request ->
    ( register_daemon_task_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers a new daemon task definition from the supplied [family] and [containerDefinitions]. \
   Optionally, you can add data volumes to your containers with the [volumes] parameter. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/daemon-task-definitions.html}Daemon \
   task definitions} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
  \ A daemon task definition is a template that describes the containers that form a daemon. \
   Daemons deploy cross-cutting software agents such as security monitoring, telemetry, and \
   logging across your Amazon ECS infrastructure.\n\
  \ \n\
  \  Each time you call [RegisterDaemonTaskDefinition], a new revision of the daemon task \
   definition is created. You can't modify a revision after you register it.\n\
  \  "]

module RegisterTaskDefinition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_task_definition_request ->
    ( register_task_definition_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_task_definition_request ->
    ( register_task_definition_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers a new task definition from the supplied [family] and [containerDefinitions]. \
   Optionally, you can add data volumes to your containers with the [volumes] parameter. For more \
   information about task definition parameters and defaults, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html}Amazon ECS \
   Task Definitions} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
  \ You can specify a role for your task with the [taskRoleArn] parameter. When you specify a role \
   for a task, its containers can then use the latest versions of the CLI or SDKs to make API \
   requests to the Amazon Web Services services that are specified in the policy that's associated \
   with the role. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-iam-roles.html}IAM Roles \
   for Tasks} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \ \n\
  \  You can specify a Docker networking mode for the containers in your task definition with the \
   [networkMode] parameter. If you specify the [awsvpc] network mode, the task is allocated an \
   elastic network interface, and you must specify a \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_NetworkConfiguration.html}NetworkConfiguration} \
   when you create a service or run a task with the task definition. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html}Task \
   Networking} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \  "]

module RunTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `BlockedException of blocked_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `PlatformTaskDefinitionIncompatibilityException of
      platform_task_definition_incompatibility_exception
    | `PlatformUnknownException of platform_unknown_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    run_task_request ->
    ( run_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BlockedException of blocked_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    run_task_request ->
    ( run_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `BlockedException of blocked_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a new task using the specified task definition.\n\n\
  \  On March 21, 2024, a change was made to resolve the task definition revision before \
   authorization. When a task definition revision is not specified, authorization will occur using \
   the latest revision of a task definition.\n\
  \  \n\
  \     Amazon Elastic Inference (EI) is no longer available to customers.\n\
  \     \n\
  \       You can allow Amazon ECS to place tasks for you, or you can customize how Amazon ECS \
   places tasks using placement constraints and placement strategies. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html}Scheduling \
   Tasks} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \       \n\
  \        Alternatively, you can use [StartTask] to use your own scheduler or place tasks \
   manually on specific container instances.\n\
  \        \n\
  \         You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the volume when \
   creating or updating a service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types}Amazon \
   EBS volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \         \n\
  \          The Amazon ECS API follows an eventual consistency model. This is because of the \
   distributed nature of the system supporting the API. This means that the result of an API \
   command you run that affects your Amazon ECS resources might not be immediately visible to all \
   subsequent commands you run. Keep this in mind when you carry out an API command that \
   immediately follows a previous API command.\n\
  \          \n\
  \           To manage eventual consistency, you can do the following:\n\
  \           \n\
  \            {ul\n\
  \                  {-  Confirm the state of the resource before you run a command to modify it. \
   Run the DescribeTasks command using an exponential backoff algorithm to ensure that you allow \
   enough time for the previous command to propagate through the system. To do this, run the \
   DescribeTasks command repeatedly, starting with a couple of seconds of wait time and increasing \
   gradually up to five minutes of wait time.\n\
  \                      \n\
  \                       }\n\
  \                  {-  Add wait time between subsequent commands, even if the DescribeTasks \
   command returns an accurate response. Apply an exponential backoff algorithm starting with a \
   couple of seconds of wait time, and increase gradually up to about five minutes of wait time.\n\
  \                      \n\
  \                       }\n\
  \                  }\n\
  \   If you get a [ConflictException] error, the [RunTask] request could not be processed due to \
   conflicts. The provided [clientToken] is already in use with a different [RunTask] request. The \
   [resourceIds] are the existing task ARNs which are already associated with the [clientToken]. \n\
  \   \n\
  \    To fix this issue:\n\
  \    \n\
  \     {ul\n\
  \           {-  Run [RunTask] with a unique [clientToken].\n\
  \               \n\
  \                }\n\
  \           {-  Run [RunTask] with the [clientToken] and the original set of parameters\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   If you get a [ClientException]error, the [RunTask] could not be processed because you use \
   managed scaling and there is a capacity error because the quota of tasks in the [PROVISIONING] \
   per cluster has been reached. For information about the service quotas, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-quotas.html}Amazon ECS \
   service quotas}.\n\
  \   "]

module StartTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NamespaceNotFoundException of namespace_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_task_request ->
    ( start_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_task_request ->
    ( start_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a new task from the specified task definition on the specified container instance or \
   instances.\n\n\
  \  On March 21, 2024, a change was made to resolve the task definition revision before \
   authorization. When a task definition revision is not specified, authorization will occur using \
   the latest revision of a task definition.\n\
  \  \n\
  \     Amazon Elastic Inference (EI) is no longer available to customers.\n\
  \     \n\
  \       Alternatively, you can use[RunTask] to place tasks for you. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html}Scheduling \
   Tasks} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \       \n\
  \        You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the volume when \
   creating or updating a service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types}Amazon \
   EBS volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \        "]

module StopServiceDeployment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ConflictException of conflict_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceDeploymentNotFoundException of service_deployment_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_service_deployment_request ->
    ( stop_service_deployment_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceDeploymentNotFoundException of service_deployment_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_service_deployment_request ->
    ( stop_service_deployment_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ConflictException of conflict_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceDeploymentNotFoundException of service_deployment_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an ongoing service deployment.\n\n\
  \ The following stop types are avaiable:\n\
  \ \n\
  \  {ul\n\
  \        {-  ROLLBACK - This option rolls back the service deployment to the previous service \
   revision. \n\
  \            \n\
  \             You can use this option even if you didn't configure the service deployment for \
   the rollback option. \n\
  \             \n\
  \              }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/stop-service-deployment.html}Stopping \
   Amazon ECS service deployments} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \   "]

module StopTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_task_request ->
    ( stop_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_task_request ->
    ( stop_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a running task. Any tags associated with the task will be deleted.\n\n\
  \ When you call [StopTask] on a task, the equivalent of [docker stop] is issued to the \
   containers running in the task. This results in a stop signal value and a default 30-second \
   timeout, after which the [SIGKILL] value is sent and the containers are forcibly stopped. This \
   signal can be defined in your container image with the [STOPSIGNAL] instruction and will \
   default to [SIGTERM]. If the container handles the [SIGTERM] value gracefully and exits within \
   30 seconds from receiving it, no [SIGKILL] value is sent.\n\
  \ \n\
  \  For Windows containers, POSIX signals do not work and runtime stops the container by sending \
   a [CTRL_SHUTDOWN_EVENT]. For more information, see \
   {{:https://github.com/moby/moby/issues/25982}Unable to react to graceful shutdown of (Windows) \
   container #25982} on GitHub.\n\
  \  \n\
  \    The default 30-second timeout can be configured on the Amazon ECS container agent with the \
   [ECS_CONTAINER_STOP_TIMEOUT] variable. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html}Amazon ECS \
   Container Agent Configuration} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \    \n\
  \     "]

module SubmitAttachmentStateChanges : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    submit_attachment_state_changes_request ->
    ( submit_attachment_state_changes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    submit_attachment_state_changes_request ->
    ( submit_attachment_state_changes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This action is only used by the Amazon ECS agent, and it is not intended for use outside of \
   the agent.\n\
  \ \n\
  \   Sent to acknowledge that an attachment changed states.\n\
  \   "]

module SubmitContainerStateChange : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    submit_container_state_change_request ->
    ( submit_container_state_change_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    submit_container_state_change_request ->
    ( submit_container_state_change_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This action is only used by the Amazon ECS agent, and it is not intended for use outside of \
   the agent.\n\
  \ \n\
  \   Sent to acknowledge that a container changed states.\n\
  \   "]

module SubmitTaskStateChange : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    submit_task_state_change_request ->
    ( submit_task_state_change_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    submit_task_state_change_request ->
    ( submit_task_state_change_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " This action is only used by the Amazon ECS agent, and it is not intended for use outside of \
   the agent.\n\
  \ \n\
  \   Sent to acknowledge that a task changed states.\n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified tags to a resource with the specified [resourceArn]. If existing tags \
   on a resource aren't specified in the request parameters, they aren't changed. When a resource \
   is deleted, the tags that are associated with that resource are deleted as well.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes specified tags from a resource.\n"]

module UpdateCapacityProvider : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_capacity_provider_request ->
    ( update_capacity_provider_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_capacity_provider_request ->
    ( update_capacity_provider_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters for a capacity provider.\n\n\
  \ These changes only apply to new Amazon ECS Managed Instances, or EC2 instances, not existing \
   ones.\n\
  \ "]

module UpdateCluster : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NamespaceNotFoundException of namespace_not_found_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_request ->
    ( update_cluster_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the cluster.\n"]

module UpdateClusterSettings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UpdateInProgressException of update_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_settings_request ->
    ( update_cluster_settings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_cluster_settings_request ->
    ( update_cluster_settings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Modifies the settings to use for a cluster.\n"]

module UpdateContainerAgent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `MissingVersionException of missing_version_exception
    | `NoUpdateAvailableException of no_update_available_exception
    | `ServerException of server_exception
    | `UpdateInProgressException of update_in_progress_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_container_agent_request ->
    ( update_container_agent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `MissingVersionException of missing_version_exception
      | `NoUpdateAvailableException of no_update_available_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_container_agent_request ->
    ( update_container_agent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `MissingVersionException of missing_version_exception
      | `NoUpdateAvailableException of no_update_available_exception
      | `ServerException of server_exception
      | `UpdateInProgressException of update_in_progress_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the Amazon ECS container agent on a specified container instance. Updating the Amazon \
   ECS container agent doesn't interrupt running tasks or services on the container instance. The \
   process for updating the agent differs depending on whether your container instance was \
   launched with the Amazon ECS-optimized AMI or another operating system.\n\n\
  \  The [UpdateContainerAgent] API isn't supported for container instances using the Amazon \
   ECS-optimized Amazon Linux 2 (arm64) AMI. To update the container agent, you can update the \
   [ecs-init] package. This updates the agent. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/agent-update-ecs-ami.html}Updating \
   the Amazon ECS container agent} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \  \n\
  \     Agent updates with the [UpdateContainerAgent] API operation do not apply to Windows \
   container instances. We recommend that you launch new container instances to update the agent \
   version in your Windows clusters.\n\
  \     \n\
  \       The [UpdateContainerAgent] API requires an Amazon ECS-optimized AMI or Amazon Linux AMI \
   with the [ecs-init] service installed and running. For help updating the Amazon ECS container \
   agent on other operating systems, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-update.html#manually_update_agent}Manually \
   updating the Amazon ECS container agent} in the {i Amazon Elastic Container Service Developer \
   Guide}.\n\
  \       "]

module UpdateContainerInstancesState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_container_instances_state_request ->
    ( update_container_instances_state_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_container_instances_state_request ->
    ( update_container_instances_state_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the status of an Amazon ECS container instance.\n\n\
  \ Once a container instance has reached an [ACTIVE] state, you can change the status of a \
   container instance to [DRAINING] to manually remove an instance from a cluster, for example to \
   perform system updates, update the Docker daemon, or scale down the cluster size.\n\
  \ \n\
  \   A container instance can't be changed to [DRAINING] until it has reached an [ACTIVE] status. \
   If the instance is in any other status, an error will be received.\n\
  \   \n\
  \     When you set a container instance to [DRAINING], Amazon ECS prevents new tasks from being \
   scheduled for placement on the container instance and replacement service tasks are started on \
   other container instances in the cluster if the resources are available. Service tasks on the \
   container instance that are in the [PENDING] state are stopped immediately.\n\
  \     \n\
  \      Service tasks on the container instance that are in the [RUNNING] state are stopped and \
   replaced according to the service's deployment configuration parameters, \
   [minimumHealthyPercent] and [maximumPercent]. You can change the deployment configuration of \
   your service using \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService}.\n\
  \      \n\
  \       {ul\n\
  \             {-  If [minimumHealthyPercent] is below 100%, the scheduler can ignore \
   [desiredCount] temporarily during task replacement. For example, [desiredCount] is four tasks, \
   a minimum of 50% allows the scheduler to stop two existing tasks before starting two new tasks. \
   If the minimum is 100%, the service scheduler can't remove existing tasks until the replacement \
   tasks are considered healthy. Tasks for services that do not use a load balancer are considered \
   healthy if they're in the [RUNNING] state. Tasks for services that use a load balancer are \
   considered healthy if they're in the [RUNNING] state and are reported as healthy by the load \
   balancer.\n\
  \                 \n\
  \                  }\n\
  \             {-  The [maximumPercent] parameter represents an upper limit on the number of \
   running tasks during task replacement. You can use this to define the replacement batch size. \
   For example, if [desiredCount] is four tasks, a maximum of 200% starts four new tasks before \
   stopping the four tasks to be drained, provided that the cluster resources required to do this \
   are available. If the maximum is 100%, then replacement tasks can't start until the draining \
   tasks have stopped.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   Any [PENDING] or [RUNNING] tasks that do not belong to a service aren't affected. You must \
   wait for them to finish or stop them manually.\n\
  \   \n\
  \    A container instance has completed draining when it has no more [RUNNING] tasks. You can \
   verify this using \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ListTasks.html}ListTasks}.\n\
  \    \n\
  \     When a container instance has been drained, you can set a container instance to [ACTIVE] \
   status and once it has reached that status the Amazon ECS scheduler can begin scheduling tasks \
   on the instance again.\n\
  \     "]

module UpdateDaemon : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `DaemonNotActiveException of daemon_not_active_exception
    | `DaemonNotFoundException of daemon_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `PlatformUnknownException of platform_unknown_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_daemon_request ->
    ( update_daemon_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `DaemonNotActiveException of daemon_not_active_exception
      | `DaemonNotFoundException of daemon_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_daemon_request ->
    ( update_daemon_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `DaemonNotActiveException of daemon_not_active_exception
      | `DaemonNotFoundException of daemon_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified daemon. When you update a daemon, a new deployment is triggered that \
   progressively rolls out the changes to the container instances associated with the daemon's \
   capacity providers. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/daemon-deployments.html}Daemon \
   deployments} in the {i Amazon Elastic Container Service Developer Guide}.\n\n\
  \ Amazon ECS drains existing container instances and provisions new instances with the updated \
   daemon. Amazon ECS automatically launches replacement tasks for your services.\n\
  \ \n\
  \   Updating a daemon triggers a rolling deployment that drains and replaces container \
   instances. Plan updates during maintenance windows to minimize impact on running services.\n\
  \   \n\
  \      ECS Managed Daemons is only supported for Amazon ECS Managed Instances Capacity Providers.\n\
  \      \n\
  \       "]

module UpdateExpressGatewayService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_express_gateway_service_request ->
    ( update_express_gateway_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_express_gateway_service_request ->
    ( update_express_gateway_service_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing Express service configuration. Modifies container settings, resource \
   allocation, auto-scaling configuration, and other service parameters without recreating the \
   service.\n\n\
  \ Amazon ECS creates a new service revision with updated configuration and performs a rolling \
   deployment to replace existing tasks. The service remains available during updates, ensuring \
   zero-downtime deployments.\n\
  \ \n\
  \  Some parameters like the infrastructure role cannot be modified after service creation and \
   require creating a new service.\n\
  \  "]

module UpdateService : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `NamespaceNotFoundException of namespace_not_found_exception
    | `PlatformTaskDefinitionIncompatibilityException of
      platform_task_definition_incompatibility_exception
    | `PlatformUnknownException of platform_unknown_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_request ->
    ( update_service_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_request ->
    ( update_service_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `NamespaceNotFoundException of namespace_not_found_exception
      | `PlatformTaskDefinitionIncompatibilityException of
        platform_task_definition_incompatibility_exception
      | `PlatformUnknownException of platform_unknown_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the parameters of a service.\n\n\
  \  On March 21, 2024, a change was made to resolve the task definition revision before \
   authorization. When a task definition revision is not specified, authorization will occur using \
   the latest revision of a task definition.\n\
  \  \n\
  \    For services using the rolling update ([ECS]) you can update the desired count, deployment \
   configuration, network configuration, load balancers, service registries, enable ECS managed \
   tags option, propagate tags option, task placement constraints and strategies, and task \
   definition. When you update any of these parameters, Amazon ECS starts new tasks with the new \
   configuration. \n\
  \    \n\
  \     You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the volume when \
   starting or running a task, or when creating or updating a service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types}Amazon \
   EBS volumes} in the {i Amazon Elastic Container Service Developer Guide}. You can update your \
   volume configurations and trigger a new deployment. [volumeConfigurations] is only supported \
   for REPLICA service and not DAEMON service. If you leave [volumeConfigurations] [null], it \
   doesn't trigger a new deployment. For more information on volumes, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types}Amazon \
   EBS volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \     \n\
  \      For services using the blue/green ([CODE_DEPLOY]) deployment controller, only the desired \
   count, deployment configuration, health check grace period, task placement constraints and \
   strategies, enable ECS managed tags option, and propagate tags can be updated using this API. \
   If the network configuration, platform version, task definition, or load balancer need to be \
   updated, create a new CodeDeploy deployment. For more information, see \
   {{:https://docs.aws.amazon.com/codedeploy/latest/APIReference/API_CreateDeployment.html}CreateDeployment} \
   in the {i CodeDeploy API Reference}.\n\
  \      \n\
  \       For services using an external deployment controller, you can update only the desired \
   count, task placement constraints and strategies, health check grace period, enable ECS managed \
   tags option, and propagate tags option, using this API. If the launch type, load balancer, \
   network configuration, platform version, or task definition need to be updated, create a new \
   task set For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CreateTaskSet.html}CreateTaskSet}.\n\
  \       \n\
  \        You can add to or subtract from the number of instantiations of a task definition in a \
   service by specifying the cluster that the service is running in and a new [desiredCount] \
   parameter.\n\
  \        \n\
  \         You can attach Amazon EBS volumes to Amazon ECS tasks by configuring the volume when \
   starting or running a task, or when creating or updating a service. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ebs-volumes.html#ebs-volume-types}Amazon \
   EBS volumes} in the {i Amazon Elastic Container Service Developer Guide}.\n\
  \         \n\
  \          If you have updated the container image of your application, you can create a new \
   task definition with that image and deploy it to your service. The service scheduler uses the \
   minimum healthy percent and maximum percent parameters (in the service's deployment \
   configuration) to determine the deployment strategy.\n\
  \          \n\
  \            If your updated Docker image uses the same tag as what is in the existing task \
   definition for your service (for example, [my_image:latest]), you don't need to create a new \
   revision of your task definition. You can update the service using the [forceNewDeployment] \
   option. The new tasks launched by the deployment pull the current image/tag combination from \
   your repository when they start.\n\
  \            \n\
  \              You can also update the deployment configuration of a service. When a deployment \
   is triggered by updating the task definition of a service, the service scheduler uses the \
   deployment configuration parameters, [minimumHealthyPercent] and [maximumPercent], to determine \
   the deployment strategy.\n\
  \              \n\
  \               {ul\n\
  \                     {-  If [minimumHealthyPercent] is below 100%, the scheduler can ignore \
   [desiredCount] temporarily during a deployment. For example, if [desiredCount] is four tasks, a \
   minimum of 50% allows the scheduler to stop two existing tasks before starting two new tasks. \
   Tasks for services that don't use a load balancer are considered healthy if they're in the \
   [RUNNING] state. Tasks for services that use a load balancer are considered healthy if they're \
   in the [RUNNING] state and are reported as healthy by the load balancer.\n\
  \                         \n\
  \                          }\n\
  \                     {-  The [maximumPercent] parameter represents an upper limit on the number \
   of running tasks during a deployment. You can use it to define the deployment batch size. For \
   example, if [desiredCount] is four tasks, a maximum of 200% starts four new tasks before \
   stopping the four older tasks (provided that the cluster resources required to do this are \
   available).\n\
  \                         \n\
  \                          }\n\
  \                     }\n\
  \   When \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_UpdateService.html}UpdateService} \
   stops a task during a deployment, the equivalent of [docker stop] is issued to the containers \
   running in the task. This results in a [SIGTERM] and a 30-second timeout. After this, [SIGKILL] \
   is sent and the containers are forcibly stopped. If the container handles the [SIGTERM] \
   gracefully and exits within 30 seconds from receiving it, no [SIGKILL] is sent.\n\
  \   \n\
  \    When the service scheduler launches new tasks, it determines task placement in your cluster \
   with the following logic.\n\
  \    \n\
  \     {ul\n\
  \           {-  Determine which of the container instances in your cluster can support your \
   service's task definition. For example, they have the required CPU, memory, ports, and \
   container instance attributes.\n\
  \               \n\
  \                }\n\
  \           {-  By default, the service scheduler attempts to balance tasks across Availability \
   Zones in this manner even though you can choose a different placement strategy.\n\
  \               \n\
  \                {ul\n\
  \                      {-  Sort the valid container instances by the fewest number of running \
   tasks for this service in the same Availability Zone as the instance. For example, if zone A \
   has one running service task and zones B and C each have zero, valid container instances in \
   either zone B or C are considered optimal for placement.\n\
  \                          \n\
  \                           }\n\
  \                      {-  Place the new service task on a valid container instance in an \
   optimal Availability Zone (based on the previous steps), favoring container instances with the \
   fewest number of running tasks for this service.\n\
  \                          \n\
  \                           }\n\
  \                      \n\
  \            }\n\
  \             }\n\
  \           }\n\
  \   When the service scheduler stops running tasks, it attempts to maintain balance across the \
   Availability Zones in your cluster using the following logic: \n\
  \   \n\
  \    {ul\n\
  \          {-  Sort the container instances by the largest number of running tasks for this \
   service in the same Availability Zone as the instance. For example, if zone A has one running \
   service task and zones B and C each have two, container instances in either zone B or C are \
   considered optimal for termination.\n\
  \              \n\
  \               }\n\
  \          {-  Stop the task on a container instance in an optimal Availability Zone (based on \
   the previous steps), favoring container instances with the largest number of running tasks for \
   this service.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module UpdateServicePrimaryTaskSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `TaskSetNotFoundException of task_set_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_primary_task_set_request ->
    ( update_service_primary_task_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `TaskSetNotFoundException of task_set_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_primary_task_set_request ->
    ( update_service_primary_task_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `TaskSetNotFoundException of task_set_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies which task set in a service is the primary task set. Any parameters that are updated \
   on the primary task set in a service will transition to the service. This is used when a \
   service uses the [EXTERNAL] deployment controller type. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}Amazon ECS \
   Deployment Types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]

module UpdateTaskProtection : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_task_protection_request ->
    ( update_task_protection_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_task_protection_request ->
    ( update_task_protection_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the protection status of a task. You can set [protectionEnabled] to [true] to protect \
   your task from termination during scale-in events from \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-auto-scaling.html}Service \
   Autoscaling} or \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}deployments}.\n\n\
  \ Task-protection, by default, expires after 2 hours at which point Amazon ECS clears the \
   [protectionEnabled] property making the task eligible for termination by a subsequent scale-in \
   event.\n\
  \ \n\
  \  You can specify a custom expiration period for task protection from 1 minute to up to 2,880 \
   minutes (48 hours). To specify the custom expiration period, set the [expiresInMinutes] \
   property. The [expiresInMinutes] property is always reset when you invoke this operation for a \
   task that already has [protectionEnabled] set to [true]. You can keep extending the protection \
   expiration period of a task by invoking this operation repeatedly.\n\
  \  \n\
  \   To learn more about Amazon ECS task protection, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-scale-in-protection.html}Task \
   scale-in protection} in the {i  {i Amazon Elastic Container Service Developer Guide} }.\n\
  \   \n\
  \     This operation is only supported for tasks belonging to an Amazon ECS service. Invoking \
   this operation for a standalone task will result in an [TASK_NOT_VALID] failure. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/api_failures_messages.html}API \
   failure reasons}.\n\
  \     \n\
  \        If you prefer to set task protection from within the container, we recommend using the \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-scale-in-protection-endpoint.html}Task \
   scale-in protection endpoint}.\n\
  \        \n\
  \         "]

module UpdateTaskSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ClientException of client_exception
    | `ClusterNotFoundException of cluster_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServerException of server_exception
    | `ServiceNotActiveException of service_not_active_exception
    | `ServiceNotFoundException of service_not_found_exception
    | `TaskSetNotFoundException of task_set_not_found_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_task_set_request ->
    ( update_task_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `TaskSetNotFoundException of task_set_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_task_set_request ->
    ( update_task_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ClientException of client_exception
      | `ClusterNotFoundException of cluster_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServerException of server_exception
      | `ServiceNotActiveException of service_not_active_exception
      | `ServiceNotFoundException of service_not_found_exception
      | `TaskSetNotFoundException of task_set_not_found_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a task set. This is used when a service uses the [EXTERNAL] deployment controller \
   type. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/deployment-types.html}Amazon ECS \
   Deployment Types} in the {i Amazon Elastic Container Service Developer Guide}.\n"]
