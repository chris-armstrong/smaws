type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An exception was thrown for a validation issue. Review the parameters provided.\n"]

type nonrec object_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified object could not be found.\n"]

type nonrec internal_service_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The service encountered an internal error.\n"]

type nonrec concurrent_update_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Concurrent updates caused an exception, for example, if you request an update to a scaling plan \
   that already has a pending update.\n"]

type nonrec update_scaling_plan_response = unit [@@ocaml.doc ""]

type nonrec disable_dynamic_scaling = bool [@@ocaml.doc ""]

type nonrec scaling_policy_update_behavior =
  | KeepExternalPolicies [@ocaml.doc ""]
  | ReplaceExternalPolicies [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_mode =
  | ForecastAndScale [@ocaml.doc ""]
  | ForecastOnly [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_capacity = int [@@ocaml.doc ""]

type nonrec predictive_scaling_max_capacity_behavior =
  | SetForecastCapacityToMaxCapacity [@ocaml.doc ""]
  | SetMaxCapacityToForecastCapacity [@ocaml.doc ""]
  | SetMaxCapacityAboveForecastCapacity [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scheduled_action_buffer_time = int [@@ocaml.doc ""]

type nonrec metric_unit = string [@@ocaml.doc ""]

type nonrec metric_statistic =
  | Average [@ocaml.doc ""]
  | Minimum [@ocaml.doc ""]
  | Maximum [@ocaml.doc ""]
  | SampleCount [@ocaml.doc ""]
  | Sum [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_dimension_value = string [@@ocaml.doc ""]

type nonrec metric_dimension_name = string [@@ocaml.doc ""]

type nonrec metric_dimension = {
  name : metric_dimension_name; [@ocaml.doc "The name of the dimension.\n"]
  value : metric_dimension_value; [@ocaml.doc "The value of the dimension.\n"]
}
[@@ocaml.doc "Represents a dimension for a customized metric.\n"]

type nonrec metric_dimensions = metric_dimension list [@@ocaml.doc ""]

type nonrec metric_namespace = string [@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec customized_load_metric_specification = {
  metric_name : metric_name; [@ocaml.doc "The name of the metric.\n"]
  namespace : metric_namespace; [@ocaml.doc "The namespace of the metric.\n"]
  dimensions : metric_dimensions option;
      [@ocaml.doc
        "The dimensions of the metric.\n\n\
        \ Conditional: If you published your metric with dimensions, you must specify the same \
         dimensions in your customized load metric specification.\n\
        \ "]
  statistic : metric_statistic;
      [@ocaml.doc "The statistic of the metric. The only valid value is [Sum].\n"]
  unit_ : metric_unit option; [@ocaml.doc "The unit of the metric.\n"]
}
[@@ocaml.doc
  "Represents a CloudWatch metric of your choosing that can be used for predictive scaling. \n\n\
  \ For predictive scaling to work with a customized load metric specification, AWS Auto Scaling \
   needs access to the [Sum] and [Average] statistics that CloudWatch computes from metric data.\n\
  \ \n\
  \  When you choose a load metric, make sure that the required [Sum] and [Average] statistics for \
   your metric are available in CloudWatch and that they provide relevant data for predictive \
   scaling. The [Sum] statistic must represent the total load on the resource, and the [Average] \
   statistic must represent the average load per capacity unit of the resource. For example, there \
   is a metric that counts the number of requests processed by your Auto Scaling group. If the \
   [Sum] statistic represents the total request count processed by the group, then the [Average] \
   statistic for the specified metric must represent the average request count processed by each \
   instance of the group. \n\
  \  \n\
  \   If you publish your own metrics, you can aggregate the data points at a given interval and \
   then publish the aggregated data points to CloudWatch. Before AWS Auto Scaling generates the \
   forecast, it sums up all the metric data points that occurred within each hour to match the \
   granularity period that is used in the forecast (60 minutes).\n\
  \   \n\
  \    For information about terminology, available metrics, or how to publish new metrics, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html}Amazon \
   CloudWatch Concepts} in the {i Amazon CloudWatch User Guide}. \n\
  \    \n\
  \     After creating your scaling plan, you can use the AWS Auto Scaling console to visualize \
   forecasts for the specified metric. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/plans/userguide/gs-create-scaling-plan.html#gs-view-resource}View \
   Scaling Information for a Resource} in the {i AWS Auto Scaling User Guide}.\n\
  \     "]

type nonrec resource_label = string [@@ocaml.doc ""]

type nonrec load_metric_type =
  | ASGTotalCPUUtilization [@ocaml.doc ""]
  | ASGTotalNetworkIn [@ocaml.doc ""]
  | ASGTotalNetworkOut [@ocaml.doc ""]
  | ALBTargetGroupRequestCount [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predefined_load_metric_specification = {
  predefined_load_metric_type : load_metric_type; [@ocaml.doc "The metric type.\n"]
  resource_label : resource_label option;
      [@ocaml.doc
        "Identifies the resource associated with the metric type. You can't specify a resource \
         label unless the metric type is [ALBTargetGroupRequestCount] and there is a target group \
         for an Application Load Balancer attached to the Auto Scaling group.\n\n\
        \ You create the resource label by appending the final portion of the load balancer ARN \
         and the final portion of the target group ARN into a single value, separated by a forward \
         slash (/). The format is app///targetgroup//, where:\n\
        \ \n\
        \  {ul\n\
        \        {-  app// is the final portion of the load balancer ARN\n\
        \            \n\
        \             }\n\
        \        {-  targetgroup// is the final portion of the target group ARN.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   This is an example: \
         app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.\n\
        \   \n\
        \    To find the ARN for an Application Load Balancer, use the \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
         API operation. To find the ARN for the target group, use the \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html}DescribeTargetGroups} \
         API operation.\n\
        \    "]
}
[@@ocaml.doc
  "Represents a predefined metric that can be used for predictive scaling.\n\n\
  \ After creating your scaling plan, you can use the AWS Auto Scaling console to visualize \
   forecasts for the specified metric. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/plans/userguide/gs-create-scaling-plan.html#gs-view-resource}View \
   Scaling Information for a Resource} in the {i AWS Auto Scaling User Guide}.\n\
  \ "]

type nonrec cooldown = int [@@ocaml.doc ""]

type nonrec disable_scale_in = bool [@@ocaml.doc ""]

type nonrec metric_scale = float [@@ocaml.doc ""]

type nonrec customized_scaling_metric_specification = {
  metric_name : metric_name; [@ocaml.doc "The name of the metric.\n"]
  namespace : metric_namespace; [@ocaml.doc "The namespace of the metric.\n"]
  dimensions : metric_dimensions option;
      [@ocaml.doc
        "The dimensions of the metric.\n\n\
        \ Conditional: If you published your metric with dimensions, you must specify the same \
         dimensions in your customized scaling metric specification.\n\
        \ "]
  statistic : metric_statistic; [@ocaml.doc "The statistic of the metric.\n"]
  unit_ : metric_unit option; [@ocaml.doc "The unit of the metric. \n"]
}
[@@ocaml.doc
  "Represents a CloudWatch metric of your choosing that can be used for dynamic scaling as part of \
   a target tracking scaling policy. \n\n\
  \ To create your customized scaling metric specification:\n\
  \ \n\
  \  {ul\n\
  \        {-  Add values for each required parameter from CloudWatch. You can use an existing \
   metric, or a new metric that you create. To use your own metric, you must first publish the \
   metric to CloudWatch. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html}Publish \
   Custom Metrics} in the {i Amazon CloudWatch User Guide}.\n\
  \            \n\
  \             }\n\
  \        {-  Choose a metric that changes proportionally with capacity. The value of the metric \
   should increase or decrease in inverse proportion to the number of capacity units. That is, the \
   value of the metric should decrease when capacity increases. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For information about terminology, available metrics, or how to publish new metrics, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html}Amazon \
   CloudWatch Concepts} in the {i Amazon CloudWatch User Guide}. \n\
  \   "]

type nonrec scaling_metric_type =
  | ASGAverageCPUUtilization [@ocaml.doc ""]
  | ASGAverageNetworkIn [@ocaml.doc ""]
  | ASGAverageNetworkOut [@ocaml.doc ""]
  | DynamoDBReadCapacityUtilization [@ocaml.doc ""]
  | DynamoDBWriteCapacityUtilization [@ocaml.doc ""]
  | ECSServiceAverageCPUUtilization [@ocaml.doc ""]
  | ECSServiceAverageMemoryUtilization [@ocaml.doc ""]
  | ALBRequestCountPerTarget [@ocaml.doc ""]
  | RDSReaderAverageCPUUtilization [@ocaml.doc ""]
  | RDSReaderAverageDatabaseConnections [@ocaml.doc ""]
  | EC2SpotFleetRequestAverageCPUUtilization [@ocaml.doc ""]
  | EC2SpotFleetRequestAverageNetworkIn [@ocaml.doc ""]
  | EC2SpotFleetRequestAverageNetworkOut [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predefined_scaling_metric_specification = {
  predefined_scaling_metric_type : scaling_metric_type;
      [@ocaml.doc
        "The metric type. The [ALBRequestCountPerTarget] metric type applies only to Auto Scaling \
         groups, Spot Fleet requests, and ECS services.\n"]
  resource_label : resource_label option;
      [@ocaml.doc
        "Identifies the resource associated with the metric type. You can't specify a resource \
         label unless the metric type is [ALBRequestCountPerTarget] and there is a target group \
         for an Application Load Balancer attached to the Auto Scaling group, Spot Fleet request, \
         or ECS service.\n\n\
        \ You create the resource label by appending the final portion of the load balancer ARN \
         and the final portion of the target group ARN into a single value, separated by a forward \
         slash (/). The format is app///targetgroup//, where:\n\
        \ \n\
        \  {ul\n\
        \        {-  app// is the final portion of the load balancer ARN\n\
        \            \n\
        \             }\n\
        \        {-  targetgroup// is the final portion of the target group ARN.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   This is an example: \
         app/EC2Co-EcsEl-1TKLTMITMM0EO/f37c06a68c1748aa/targetgroup/EC2Co-Defau-LDNM7Q3ZH1ZN/6d4ea56ca2d6a18d.\n\
        \   \n\
        \    To find the ARN for an Application Load Balancer, use the \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
         API operation. To find the ARN for the target group, use the \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html}DescribeTargetGroups} \
         API operation.\n\
        \    "]
}
[@@ocaml.doc
  "Represents a predefined metric that can be used for dynamic scaling as part of a target \
   tracking scaling policy.\n"]

type nonrec target_tracking_configuration = {
  predefined_scaling_metric_specification : predefined_scaling_metric_specification option;
      [@ocaml.doc
        "A predefined metric. You can specify either a predefined metric or a customized metric.\n"]
  customized_scaling_metric_specification : customized_scaling_metric_specification option;
      [@ocaml.doc
        "A customized metric. You can specify either a predefined metric or a customized metric. \n"]
  target_value : metric_scale;
      [@ocaml.doc
        "The target value for the metric. Although this property accepts numbers of type Double, \
         it won't accept values that are either too small or too large. Values must be in the \
         range of -2^360 to 2^360.\n"]
  disable_scale_in : disable_scale_in option;
      [@ocaml.doc
        "Indicates whether scale in by the target tracking scaling policy is disabled. If the \
         value is [true], scale in is disabled and the target tracking scaling policy doesn't \
         remove capacity from the scalable resource. Otherwise, scale in is enabled and the target \
         tracking scaling policy can remove capacity from the scalable resource. \n\n\
        \ The default value is [false].\n\
        \ "]
  scale_out_cooldown : cooldown option;
      [@ocaml.doc
        "The amount of time, in seconds, to wait for a previous scale-out activity to take effect. \
         This property is not used if the scalable resource is an Auto Scaling group.\n\n\
        \ With the {i scale-out cooldown period}, the intention is to continuously (but not \
         excessively) scale out. After Auto Scaling successfully scales out using a target \
         tracking scaling policy, it starts to calculate the cooldown time. The scaling policy \
         won't increase the desired capacity again unless either a larger scale out is triggered \
         or the cooldown period ends.\n\
        \ "]
  scale_in_cooldown : cooldown option;
      [@ocaml.doc
        "The amount of time, in seconds, after a scale-in activity completes before another \
         scale-in activity can start. This property is not used if the scalable resource is an \
         Auto Scaling group.\n\n\
        \ With the {i scale-in cooldown period}, the intention is to scale in conservatively to \
         protect your application\226\128\153s availability, so scale-in activities are blocked \
         until the cooldown period has expired. However, if another alarm triggers a scale-out \
         activity during the scale-in cooldown period, Auto Scaling scales out the target \
         immediately. In this case, the scale-in cooldown period stops and doesn't complete.\n\
        \ "]
  estimated_instance_warmup : cooldown option;
      [@ocaml.doc
        "The estimated time, in seconds, until a newly launched instance can contribute to the \
         CloudWatch metrics. This value is used only if the resource is an Auto Scaling group.\n"]
}
[@@ocaml.doc
  "Describes a target tracking configuration to use with AWS Auto Scaling. Used with \
   [ScalingInstruction] and [ScalingPolicy].\n"]

type nonrec target_tracking_configurations = target_tracking_configuration list [@@ocaml.doc ""]

type nonrec scalable_dimension =
  | AutoScalingGroupDesiredCapacity [@ocaml.doc ""]
  | ECSServiceDesiredCount [@ocaml.doc ""]
  | EC2SpotFleetRequestTargetCapacity [@ocaml.doc ""]
  | RDSClusterReadReplicaCount [@ocaml.doc ""]
  | DynamoDBTableReadCapacityUnits [@ocaml.doc ""]
  | DynamoDBTableWriteCapacityUnits [@ocaml.doc ""]
  | DynamoDBIndexReadCapacityUnits [@ocaml.doc ""]
  | DynamoDBIndexWriteCapacityUnits [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_id_max_len1600 = string [@@ocaml.doc ""]

type nonrec service_namespace =
  | AUTOSCALING [@ocaml.doc ""]
  | ECS [@ocaml.doc ""]
  | EC2 [@ocaml.doc ""]
  | RDS [@ocaml.doc ""]
  | DYNAMODB [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scaling_instruction = {
  service_namespace : service_namespace; [@ocaml.doc "The namespace of the AWS service.\n"]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The ID of the resource. This string consists of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  Auto Scaling group - The resource type is [autoScalingGroup] and the unique \
         identifier is the name of the Auto Scaling group. Example: [autoScalingGroup/my-asg].\n\
        \           \n\
        \            }\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/default/sample-webapp].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet request - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         resource ID. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the resource ID. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension associated with the resource.\n\n\
        \ {ul\n\
        \       {-   [autoscaling:autoScalingGroup:DesiredCapacity] - The desired capacity of an \
         Auto Scaling group.\n\
        \           \n\
        \            }\n\
        \       {-   [ecs:service:DesiredCount] - The desired task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet \
         request.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:table:ReadCapacityUnits] - The provisioned read capacity for a \
         DynamoDB table.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:table:WriteCapacityUnits] - The provisioned write capacity for a \
         DynamoDB table.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:index:ReadCapacityUnits] - The provisioned read capacity for a \
         DynamoDB global secondary index.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:index:WriteCapacityUnits] - The provisioned write capacity for a \
         DynamoDB global secondary index.\n\
        \           \n\
        \            }\n\
        \       {-   [rds:cluster:ReadReplicaCount] - The count of Aurora Replicas in an Aurora DB \
         cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible \
         edition.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  min_capacity : resource_capacity; [@ocaml.doc "The minimum capacity of the resource. \n"]
  max_capacity : resource_capacity;
      [@ocaml.doc
        "The maximum capacity of the resource. The exception to this upper limit is if you specify \
         a non-default setting for {b PredictiveScalingMaxCapacityBehavior}. \n"]
  target_tracking_configurations : target_tracking_configurations;
      [@ocaml.doc
        "The target tracking configurations (up to 10). Each of these structures must specify a \
         unique scaling metric and a target value for the metric. \n"]
  predefined_load_metric_specification : predefined_load_metric_specification option;
      [@ocaml.doc
        "The predefined load metric to use for predictive scaling. This parameter or a {b \
         CustomizedLoadMetricSpecification} is required when configuring predictive scaling, and \
         cannot be used otherwise. \n"]
  customized_load_metric_specification : customized_load_metric_specification option;
      [@ocaml.doc
        "The customized load metric to use for predictive scaling. This parameter or a {b \
         PredefinedLoadMetricSpecification} is required when configuring predictive scaling, and \
         cannot be used otherwise. \n"]
  scheduled_action_buffer_time : scheduled_action_buffer_time option;
      [@ocaml.doc
        "The amount of time, in seconds, to buffer the run time of scheduled scaling actions when \
         scaling out. For example, if the forecast says to add capacity at 10:00 AM, and the \
         buffer time is 5 minutes, then the run time of the corresponding scheduled scaling action \
         will be 9:55 AM. The intention is to give resources time to be provisioned. For example, \
         it can take a few minutes to launch an EC2 instance. The actual amount of time required \
         depends on several factors, such as the size of the instance and whether there are \
         startup scripts to complete. \n\n\
        \ The value must be less than the forecast interval duration of 3600 seconds (60 minutes). \
         The default is 300 seconds. \n\
        \ \n\
        \  Only valid when configuring predictive scaling. \n\
        \  "]
  predictive_scaling_max_capacity_behavior : predictive_scaling_max_capacity_behavior option;
      [@ocaml.doc
        "Defines the behavior that should be applied if the forecast capacity approaches or \
         exceeds the maximum capacity specified for the resource. The default value is \
         [SetForecastCapacityToMaxCapacity].\n\n\
        \ The following are possible values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [SetForecastCapacityToMaxCapacity] - AWS Auto Scaling cannot scale resource \
         capacity higher than the maximum capacity. The maximum capacity is enforced as a hard \
         limit. \n\
        \            \n\
        \             }\n\
        \        {-   [SetMaxCapacityToForecastCapacity] - AWS Auto Scaling may scale resource \
         capacity higher than the maximum capacity to equal but not exceed forecast capacity.\n\
        \            \n\
        \             }\n\
        \        {-   [SetMaxCapacityAboveForecastCapacity] - AWS Auto Scaling may scale resource \
         capacity higher than the maximum capacity by a specified buffer value. The intention is \
         to give the target tracking scaling policy extra capacity if unexpected traffic occurs. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Only valid when configuring predictive scaling.\n\
        \   "]
  predictive_scaling_max_capacity_buffer : resource_capacity option;
      [@ocaml.doc
        "The size of the capacity buffer to use when the forecast capacity is close to or exceeds \
         the maximum capacity. The value is specified as a percentage relative to the forecast \
         capacity. For example, if the buffer is 10, this means a 10 percent buffer, such that if \
         the forecast capacity is 50, and the maximum capacity is 40, then the effective maximum \
         capacity is 55.\n\n\
        \ Only valid when configuring predictive scaling. Required if the {b \
         PredictiveScalingMaxCapacityBehavior} is set to [SetMaxCapacityAboveForecastCapacity], \
         and cannot be used otherwise.\n\
        \ \n\
        \  The range is 1-100.\n\
        \  "]
  predictive_scaling_mode : predictive_scaling_mode option;
      [@ocaml.doc
        "The predictive scaling mode. The default value is [ForecastAndScale]. Otherwise, AWS Auto \
         Scaling forecasts capacity but does not create any scheduled scaling actions based on the \
         capacity forecast. \n"]
  scaling_policy_update_behavior : scaling_policy_update_behavior option;
      [@ocaml.doc
        "Controls whether a resource's externally created scaling policies are kept or replaced. \n\n\
        \ The default value is [KeepExternalPolicies]. If the parameter is set to \
         [ReplaceExternalPolicies], any scaling policies that are external to AWS Auto Scaling are \
         deleted and new target tracking scaling policies created. \n\
        \ \n\
        \  Only valid when configuring dynamic scaling. \n\
        \  \n\
        \   Condition: The number of existing policies to be replaced must be less than or equal \
         to 50. If there are more than 50 policies to be replaced, AWS Auto Scaling keeps all \
         existing policies and does not create new ones.\n\
        \   "]
  disable_dynamic_scaling : disable_dynamic_scaling option;
      [@ocaml.doc
        "Controls whether dynamic scaling by AWS Auto Scaling is disabled. When dynamic scaling is \
         enabled, AWS Auto Scaling creates target tracking scaling policies based on the specified \
         target tracking configurations. \n\n\
        \ The default is enabled ([false]). \n\
        \ "]
}
[@@ocaml.doc
  "Describes a scaling instruction for a scalable resource in a scaling plan. Each scaling \
   instruction applies to one resource.\n\n\
  \ AWS Auto Scaling creates target tracking scaling policies based on the scaling instructions. \
   Target tracking scaling policies adjust the capacity of your scalable resource as required to \
   maintain resource utilization at the target value that you specified. \n\
  \ \n\
  \  AWS Auto Scaling also configures predictive scaling for your Amazon EC2 Auto Scaling groups \
   using a subset of parameters, including the load metric, the scaling metric, the target value \
   for the scaling metric, the predictive scaling mode (forecast and scale or forecast only), and \
   the desired behavior when the forecast capacity exceeds the maximum capacity of the resource. \
   With predictive scaling, AWS Auto Scaling generates forecasts with traffic predictions for the \
   two days ahead and schedules scaling actions that proactively add and remove resource capacity \
   to match the forecast. \n\
  \  \n\
  \    We recommend waiting a minimum of 24 hours after creating an Auto Scaling group to \
   configure predictive scaling. At minimum, there must be 24 hours of historical data to generate \
   a forecast. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/plans/userguide/gs-best-practices.html}Best \
   Practices for AWS Auto Scaling} in the {i AWS Auto Scaling User Guide}.\n\
  \    \n\
  \     "]

type nonrec scaling_instructions = scaling_instruction list [@@ocaml.doc ""]

type nonrec xml_string_max_len256 = string [@@ocaml.doc ""]

type nonrec tag_values = xml_string_max_len256 list [@@ocaml.doc ""]

type nonrec xml_string_max_len128 = string [@@ocaml.doc ""]

type nonrec tag_filter = {
  key : xml_string_max_len128 option; [@ocaml.doc "The tag key.\n"]
  values : tag_values option; [@ocaml.doc "The tag values (0 to 20).\n"]
}
[@@ocaml.doc "Represents a tag.\n"]

type nonrec tag_filters = tag_filter list [@@ocaml.doc ""]

type nonrec xml_string = string [@@ocaml.doc ""]

type nonrec application_source = {
  cloud_formation_stack_ar_n : xml_string option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a AWS CloudFormation stack.\n"]
  tag_filters : tag_filters option; [@ocaml.doc "A set of tags (up to 50).\n"]
}
[@@ocaml.doc "Represents an application source.\n"]

type nonrec scaling_plan_version = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec scaling_plan_name = string [@@ocaml.doc ""]

type nonrec update_scaling_plan_request = {
  scaling_plan_name : scaling_plan_name; [@ocaml.doc "The name of the scaling plan.\n"]
  scaling_plan_version : scaling_plan_version;
      [@ocaml.doc
        "The version number of the scaling plan. The only valid value is [1]. Currently, you \
         cannot have multiple scaling plan versions.\n"]
  application_source : application_source option;
      [@ocaml.doc
        "A CloudFormation stack or set of tags.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ApplicationSource.html}ApplicationSource} \
         in the {i AWS Auto Scaling API Reference}.\n\
        \ "]
  scaling_instructions : scaling_instructions option;
      [@ocaml.doc
        "The scaling instructions.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ScalingInstruction.html}ScalingInstruction} \
         in the {i AWS Auto Scaling API Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec timestamp_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec datapoint = {
  timestamp : timestamp_type option;
      [@ocaml.doc "The time stamp for the data point in UTC format.\n"]
  value : metric_scale option; [@ocaml.doc "The value of the data point.\n"]
}
[@@ocaml.doc "Represents a single value in the forecast data used for predictive scaling.\n"]

type nonrec datapoints = datapoint list [@@ocaml.doc ""]

type nonrec get_scaling_plan_resource_forecast_data_response = {
  datapoints : datapoints; [@ocaml.doc "The data points to return.\n"]
}
[@@ocaml.doc ""]

type nonrec forecast_data_type =
  | CapacityForecast [@ocaml.doc ""]
  | LoadForecast [@ocaml.doc ""]
  | ScheduledActionMinCapacity [@ocaml.doc ""]
  | ScheduledActionMaxCapacity [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_scaling_plan_resource_forecast_data_request = {
  scaling_plan_name : scaling_plan_name; [@ocaml.doc "The name of the scaling plan.\n"]
  scaling_plan_version : scaling_plan_version;
      [@ocaml.doc
        "The version number of the scaling plan. Currently, the only valid value is [1].\n"]
  service_namespace : service_namespace;
      [@ocaml.doc "The namespace of the AWS service. The only valid value is [autoscaling]. \n"]
  resource_id : xml_string;
      [@ocaml.doc
        "The ID of the resource. This string consists of a prefix ([autoScalingGroup]) followed by \
         the name of a specified Auto Scaling group ([my-asg]). Example: \
         [autoScalingGroup/my-asg]. \n"]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension for the resource. The only valid value is \
         [autoscaling:autoScalingGroup:DesiredCapacity]. \n"]
  forecast_data_type : forecast_data_type;
      [@ocaml.doc
        "The type of forecast data to get.\n\n\
        \ {ul\n\
        \       {-   [LoadForecast]: The load metric forecast. \n\
        \           \n\
        \            }\n\
        \       {-   [CapacityForecast]: The capacity forecast. \n\
        \           \n\
        \            }\n\
        \       {-   [ScheduledActionMinCapacity]: The minimum capacity for each scheduled scaling \
         action. This data is calculated as the larger of two values: the capacity forecast or the \
         minimum capacity in the scaling instruction.\n\
        \           \n\
        \            }\n\
        \       {-   [ScheduledActionMaxCapacity]: The maximum capacity for each scheduled scaling \
         action. The calculation used is determined by the predictive scaling maximum capacity \
         behavior setting in the scaling instruction.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  start_time : timestamp_type;
      [@ocaml.doc
        "The inclusive start time of the time range for the forecast data to get. The date and \
         time can be at most 56 days before the current date and time. \n"]
  end_time : timestamp_type;
      [@ocaml.doc
        "The exclusive end time of the time range for the forecast data to get. The maximum time \
         duration between the start and end time is seven days. \n\n\
        \ Although this parameter can accept a date and time that is more than two days in the \
         future, the availability of forecast data has limits. AWS Auto Scaling only issues \
         forecasts for periods of two days in advance.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The token provided is not valid.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec scaling_plan_status_code =
  | Active [@ocaml.doc ""]
  | ActiveWithProblems [@ocaml.doc ""]
  | CreationInProgress [@ocaml.doc ""]
  | CreationFailed [@ocaml.doc ""]
  | DeletionInProgress [@ocaml.doc ""]
  | DeletionFailed [@ocaml.doc ""]
  | UpdateInProgress [@ocaml.doc ""]
  | UpdateFailed [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scaling_plan = {
  scaling_plan_name : scaling_plan_name; [@ocaml.doc "The name of the scaling plan.\n"]
  scaling_plan_version : scaling_plan_version;
      [@ocaml.doc "The version number of the scaling plan.\n"]
  application_source : application_source;
      [@ocaml.doc
        "A CloudFormation stack or a set of tags. You can create one scaling plan per application \
         source.\n"]
  scaling_instructions : scaling_instructions; [@ocaml.doc "The scaling instructions.\n"]
  status_code : scaling_plan_status_code;
      [@ocaml.doc
        "The status of the scaling plan.\n\n\
        \ {ul\n\
        \       {-   [Active] - The scaling plan is active.\n\
        \           \n\
        \            }\n\
        \       {-   [ActiveWithProblems] - The scaling plan is active, but the scaling \
         configuration for one or more resources could not be applied.\n\
        \           \n\
        \            }\n\
        \       {-   [CreationInProgress] - The scaling plan is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [CreationFailed] - The scaling plan could not be created.\n\
        \           \n\
        \            }\n\
        \       {-   [DeletionInProgress] - The scaling plan is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [DeletionFailed] - The scaling plan could not be deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdateInProgress] - The scaling plan is being updated.\n\
        \           \n\
        \            }\n\
        \       {-   [UpdateFailed] - The scaling plan could not be updated.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_message : xml_string option;
      [@ocaml.doc "A simple message about the current status of the scaling plan.\n"]
  status_start_time : timestamp_type option;
      [@ocaml.doc "The Unix time stamp when the scaling plan entered the current status.\n"]
  creation_time : timestamp_type option;
      [@ocaml.doc "The Unix time stamp when the scaling plan was created.\n"]
}
[@@ocaml.doc "Represents a scaling plan.\n"]

type nonrec scaling_plans = scaling_plan list [@@ocaml.doc ""]

type nonrec describe_scaling_plans_response = {
  scaling_plans : scaling_plans option; [@ocaml.doc "Information about the scaling plans.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token required to get the next set of results. This value is [null] if there are no \
         more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec application_sources = application_source list [@@ocaml.doc ""]

type nonrec scaling_plan_names = scaling_plan_name list [@@ocaml.doc ""]

type nonrec describe_scaling_plans_request = {
  scaling_plan_names : scaling_plan_names option;
      [@ocaml.doc
        "The names of the scaling plans (up to 10). If you specify application sources, you cannot \
         specify scaling plan names.\n"]
  scaling_plan_version : scaling_plan_version option;
      [@ocaml.doc
        "The version number of the scaling plan. Currently, the only valid value is [1].\n\n\
        \  If you specify a scaling plan version, you must also specify a scaling plan name.\n\
        \  \n\
        \   "]
  application_sources : application_sources option;
      [@ocaml.doc
        "The sources for the applications (up to 10). If you specify scaling plan names, you \
         cannot specify application sources.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of scalable resources to return. This value can be between 1 and 50. \
         The default value is 50.\n"]
  next_token : next_token option; [@ocaml.doc "The token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec scaling_status_code =
  | Inactive [@ocaml.doc ""]
  | PartiallyActive [@ocaml.doc ""]
  | Active [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_type = TargetTrackingScaling [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec scaling_policy = {
  policy_name : policy_name; [@ocaml.doc "The name of the scaling policy.\n"]
  policy_type : policy_type; [@ocaml.doc "The type of scaling policy.\n"]
  target_tracking_configuration : target_tracking_configuration option;
      [@ocaml.doc
        "The target tracking scaling policy. Includes support for predefined or customized metrics.\n"]
}
[@@ocaml.doc "Represents a scaling policy.\n"]

type nonrec scaling_policies = scaling_policy list [@@ocaml.doc ""]

type nonrec scaling_plan_resource = {
  scaling_plan_name : scaling_plan_name; [@ocaml.doc "The name of the scaling plan.\n"]
  scaling_plan_version : scaling_plan_version;
      [@ocaml.doc "The version number of the scaling plan.\n"]
  service_namespace : service_namespace; [@ocaml.doc "The namespace of the AWS service.\n"]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The ID of the resource. This string consists of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  Auto Scaling group - The resource type is [autoScalingGroup] and the unique \
         identifier is the name of the Auto Scaling group. Example: [autoScalingGroup/my-asg].\n\
        \           \n\
        \            }\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/default/sample-webapp].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet request - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         resource ID. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the resource ID. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension for the resource.\n\n\
        \ {ul\n\
        \       {-   [autoscaling:autoScalingGroup:DesiredCapacity] - The desired capacity of an \
         Auto Scaling group.\n\
        \           \n\
        \            }\n\
        \       {-   [ecs:service:DesiredCount] - The desired task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet \
         request.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:table:ReadCapacityUnits] - The provisioned read capacity for a \
         DynamoDB table.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:table:WriteCapacityUnits] - The provisioned write capacity for a \
         DynamoDB table.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:index:ReadCapacityUnits] - The provisioned read capacity for a \
         DynamoDB global secondary index.\n\
        \           \n\
        \            }\n\
        \       {-   [dynamodb:index:WriteCapacityUnits] - The provisioned write capacity for a \
         DynamoDB global secondary index.\n\
        \           \n\
        \            }\n\
        \       {-   [rds:cluster:ReadReplicaCount] - The count of Aurora Replicas in an Aurora DB \
         cluster. Available for Aurora MySQL-compatible edition and Aurora PostgreSQL-compatible \
         edition.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scaling_policies : scaling_policies option; [@ocaml.doc "The scaling policies.\n"]
  scaling_status_code : scaling_status_code;
      [@ocaml.doc
        "The scaling status of the resource.\n\n\
        \ {ul\n\
        \       {-   [Active] - The scaling configuration is active.\n\
        \           \n\
        \            }\n\
        \       {-   [Inactive] - The scaling configuration is not active because the scaling plan \
         is being created or the scaling configuration could not be applied. Check the status \
         message for more information.\n\
        \           \n\
        \            }\n\
        \       {-   [PartiallyActive] - The scaling configuration is partially active because the \
         scaling plan is being created or deleted or the scaling configuration could not be fully \
         applied. Check the status message for more information.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scaling_status_message : xml_string option;
      [@ocaml.doc "A simple message about the current scaling status of the resource.\n"]
}
[@@ocaml.doc "Represents a scalable resource.\n"]

type nonrec scaling_plan_resources = scaling_plan_resource list [@@ocaml.doc ""]

type nonrec describe_scaling_plan_resources_response = {
  scaling_plan_resources : scaling_plan_resources option;
      [@ocaml.doc "Information about the scalable resources.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token required to get the next set of results. This value is [null] if there are no \
         more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scaling_plan_resources_request = {
  scaling_plan_name : scaling_plan_name; [@ocaml.doc "The name of the scaling plan.\n"]
  scaling_plan_version : scaling_plan_version;
      [@ocaml.doc
        "The version number of the scaling plan. Currently, the only valid value is [1].\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of scalable resources to return. The value must be between 1 and 50. \
         The default value is 50.\n"]
  next_token : next_token option; [@ocaml.doc "The token for the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scaling_plan_response = unit [@@ocaml.doc ""]

type nonrec delete_scaling_plan_request = {
  scaling_plan_name : scaling_plan_name; [@ocaml.doc "The name of the scaling plan.\n"]
  scaling_plan_version : scaling_plan_version;
      [@ocaml.doc
        "The version number of the scaling plan. Currently, the only valid value is [1].\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Your account exceeded a limit. This exception is thrown when a per-account resource limit is \
   exceeded.\n"]

type nonrec create_scaling_plan_response = {
  scaling_plan_version : scaling_plan_version;
      [@ocaml.doc
        "The version number of the scaling plan. This value is always [1]. Currently, you cannot \
         have multiple scaling plan versions.\n"]
}
[@@ocaml.doc ""]

type nonrec create_scaling_plan_request = {
  scaling_plan_name : scaling_plan_name;
      [@ocaml.doc
        "The name of the scaling plan. Names cannot contain vertical bars, colons, or forward \
         slashes.\n"]
  application_source : application_source;
      [@ocaml.doc
        "A CloudFormation stack or set of tags. You can create one scaling plan per application \
         source.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ApplicationSource.html}ApplicationSource} \
         in the {i AWS Auto Scaling API Reference}.\n\
        \ "]
  scaling_instructions : scaling_instructions;
      [@ocaml.doc
        "The scaling instructions.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/plans/APIReference/API_ScalingInstruction.html}ScalingInstruction} \
         in the {i AWS Auto Scaling API Reference}.\n\
        \ "]
}
[@@ocaml.doc ""]
