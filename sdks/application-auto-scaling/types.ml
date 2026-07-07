type nonrec xml_string = string [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An exception was thrown for a validation issue. Review the available parameters for the API \
   request.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc "One or more tag keys. Specify only the tag keys, not the tag values.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Identifies the Application Auto Scaling scalable target from which to remove tags.\n\n\
        \ For example: \
         [arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123] \n\
        \ \n\
        \  To get the ARN for a scalable target, use [DescribeScalableTargets].\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  resource_name : amazon_resource_name option;
      [@ocaml.doc
        "The name of the Application Auto Scaling resource. This value is an Amazon Resource Name \
         (ARN).\n"]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified resource doesn't exist.\n"]

type nonrec too_many_tags_exception = {
  resource_name : amazon_resource_name option;
      [@ocaml.doc
        "The name of the Application Auto Scaling resource. This value is an Amazon Resource Name \
         (ARN).\n"]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The request contains too many tags. Try the request again with fewer tags.\n"]

type nonrec timestamp_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec metric_scale = float [@@ocaml.doc ""]

type nonrec metric_type =
  | ECSServiceAverageMemoryUtilizationHighResolution [@ocaml.doc ""]
  | ECSServiceAverageCPUUtilizationHighResolution [@ocaml.doc ""]
  | SageMakerVariantConcurrentRequestsPerModelHighResolution [@ocaml.doc ""]
  | SageMakerInferenceComponentConcurrentRequestsPerCopyHighResolution [@ocaml.doc ""]
  | WorkSpacesAverageUserSessionsCapacityUtilization [@ocaml.doc ""]
  | SageMakerInferenceComponentInvocationsPerCopy [@ocaml.doc ""]
  | ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage [@ocaml.doc ""]
  | SageMakerVariantProvisionedConcurrencyUtilization [@ocaml.doc ""]
  | NeptuneReaderAverageCPUUtilization [@ocaml.doc ""]
  | ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage [@ocaml.doc ""]
  | ElastiCacheReplicaEngineCPUUtilization [@ocaml.doc ""]
  | ElastiCachePrimaryEngineCPUUtilization [@ocaml.doc ""]
  | ElastiCacheDatabaseMemoryUsagePercentage [@ocaml.doc ""]
  | ElastiCacheEngineCPUUtilization [@ocaml.doc ""]
  | KafkaBrokerStorageUtilization [@ocaml.doc ""]
  | CassandraWriteCapacityUtilization [@ocaml.doc ""]
  | CassandraReadCapacityUtilization [@ocaml.doc ""]
  | LambdaProvisionedConcurrencyUtilization [@ocaml.doc ""]
  | ComprehendInferenceUtilization [@ocaml.doc ""]
  | AppStreamAverageCapacityUtilization [@ocaml.doc ""]
  | ECSServiceAverageMemoryUtilization [@ocaml.doc ""]
  | ECSServiceAverageCPUUtilization [@ocaml.doc ""]
  | SageMakerVariantInvocationsPerInstance [@ocaml.doc ""]
  | EC2SpotFleetRequestAverageNetworkOut [@ocaml.doc ""]
  | EC2SpotFleetRequestAverageNetworkIn [@ocaml.doc ""]
  | EC2SpotFleetRequestAverageCPUUtilization [@ocaml.doc ""]
  | RDSReaderAverageDatabaseConnections [@ocaml.doc ""]
  | RDSReaderAverageCPUUtilization [@ocaml.doc ""]
  | ALBRequestCountPerTarget [@ocaml.doc ""]
  | DynamoDBWriteCapacityUtilization [@ocaml.doc ""]
  | DynamoDBReadCapacityUtilization [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_label = string [@@ocaml.doc ""]

type nonrec predefined_metric_specification = {
  resource_label : resource_label option;
      [@ocaml.doc
        "Identifies the resource associated with the metric type. You can't specify a resource \
         label unless the metric type is [ALBRequestCountPerTarget] and there is a target group \
         attached to the Spot Fleet or ECS service.\n\n\
        \ You create the resource label by appending the final portion of the load balancer ARN \
         and the final portion of the target group ARN into a single value, separated by a forward \
         slash (/). The format of the resource label is:\n\
        \ \n\
        \   [app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff].\n\
        \  \n\
        \   Where:\n\
        \   \n\
        \    {ul\n\
        \          {-  app// is the final portion of the load balancer ARN\n\
        \              \n\
        \               }\n\
        \          {-  targetgroup// is the final portion of the target group ARN.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   To find the ARN for an Application Load Balancer, use the \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
         API operation. To find the ARN for the target group, use the \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html}DescribeTargetGroups} \
         API operation.\n\
        \   "]
  predefined_metric_type : metric_type;
      [@ocaml.doc
        "The metric type. The following are notes about specific metric types:\n\n\
        \ {ul\n\
        \       {-   [ALBRequestCountPerTarget] - This metric type applies only to Spot Fleets and \
         ECS services.\n\
        \           \n\
        \            }\n\
        \       {-   [ECSServiceAverageCPUUtilizationHighResolution] - The high-resolution version \
         of [ECSServiceAverageCPUUtilization] that uses 20-second CloudWatch metrics. Use this \
         metric for target tracking scaling policies that evaluate metrics every 20 seconds. You \
         must enable high-resolution metrics in Amazon ECS before creating a scaling policy with \
         this metric type.\n\
        \           \n\
        \            }\n\
        \       {-   [ECSServiceAverageMemoryUtilizationHighResolution] - The high-resolution \
         version of [ECSServiceAverageMemoryUtilization] that uses 20-second CloudWatch metrics. \
         Use this metric for target tracking scaling policies that evaluate metrics every 20 \
         seconds. You must enable high-resolution metrics in Amazon ECS before creating a scaling \
         policy with this metric type.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Represents a predefined metric for a target tracking scaling policy to use with Application \
   Auto Scaling.\n\n\
  \ For more information, \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/monitoring-cloudwatch.html#predefined-metrics}Predefined \
   metrics for target tracking scaling policies} in the {i Application Auto Scaling User Guide}.\n\
  \ "]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec metric_namespace = string [@@ocaml.doc ""]

type nonrec metric_dimension_name = string [@@ocaml.doc ""]

type nonrec metric_dimension_value = string [@@ocaml.doc ""]

type nonrec metric_dimension = {
  value : metric_dimension_value; [@ocaml.doc "The value of the dimension.\n"]
  name : metric_dimension_name; [@ocaml.doc "The name of the dimension.\n"]
}
[@@ocaml.doc "Describes the dimension names and values associated with a metric.\n"]

type nonrec metric_dimensions = metric_dimension list [@@ocaml.doc ""]

type nonrec metric_statistic =
  | Sum [@ocaml.doc ""]
  | SampleCount [@ocaml.doc ""]
  | Maximum [@ocaml.doc ""]
  | Minimum [@ocaml.doc ""]
  | Average [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_unit = string [@@ocaml.doc ""]

type nonrec expression = string [@@ocaml.doc ""]

type nonrec id = string [@@ocaml.doc ""]

type nonrec target_tracking_metric_dimension_name = string [@@ocaml.doc ""]

type nonrec target_tracking_metric_dimension_value = string [@@ocaml.doc ""]

type nonrec target_tracking_metric_dimension = {
  value : target_tracking_metric_dimension_value; [@ocaml.doc "The value of the dimension.\n"]
  name : target_tracking_metric_dimension_name; [@ocaml.doc "The name of the dimension.\n"]
}
[@@ocaml.doc "Describes the dimension of a metric.\n"]

type nonrec target_tracking_metric_dimensions = target_tracking_metric_dimension list
[@@ocaml.doc ""]

type nonrec target_tracking_metric_name = string [@@ocaml.doc ""]

type nonrec target_tracking_metric_namespace = string [@@ocaml.doc ""]

type nonrec target_tracking_metric = {
  namespace : target_tracking_metric_namespace option;
      [@ocaml.doc
        "The namespace of the metric. For more information, see the table in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html}Amazon \
         Web Services services that publish CloudWatch metrics } in the {i Amazon CloudWatch User \
         Guide}.\n"]
  metric_name : target_tracking_metric_name option; [@ocaml.doc "The name of the metric.\n"]
  dimensions : target_tracking_metric_dimensions option;
      [@ocaml.doc
        "The dimensions for the metric. For the list of available dimensions, see the Amazon Web \
         Services documentation available from the table in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html}Amazon \
         Web Services services that publish CloudWatch metrics } in the {i Amazon CloudWatch User \
         Guide}. \n\n\
        \ Conditional: If you published your metric with dimensions, you must specify the same \
         dimensions in your scaling policy.\n\
        \ "]
}
[@@ocaml.doc
  "Represents a specific metric.\n\n\
  \ Metric is a property of the [TargetTrackingMetricStat] object.\n\
  \ "]

type nonrec target_tracking_metric_unit = string [@@ocaml.doc ""]

type nonrec target_tracking_metric_stat = {
  unit_ : target_tracking_metric_unit option;
      [@ocaml.doc
        "The unit to use for the returned data points. For a complete list of the units that \
         CloudWatch supports, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html}MetricDatum} \
         data type in the {i Amazon CloudWatch API Reference}.\n"]
  stat : xml_string;
      [@ocaml.doc
        "The statistic to return. It can include any CloudWatch statistic or extended statistic. \
         For a list of valid values, see the table in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic}Statistics} \
         in the {i Amazon CloudWatch User Guide}.\n\n\
        \ The most commonly used metric for scaling is [Average].\n\
        \ "]
  metric : target_tracking_metric;
      [@ocaml.doc
        "The CloudWatch metric to return, including the metric name, namespace, and dimensions. To \
         get the exact metric name, namespace, and dimensions, inspect the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html}Metric} \
         object that is returned by a call to \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html}ListMetrics}.\n"]
}
[@@ocaml.doc
  "This structure defines the CloudWatch metric to return, along with the statistic and unit.\n\n\
  \ For more information about the CloudWatch terminology below, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html}Amazon \
   CloudWatch concepts} in the {i Amazon CloudWatch User Guide}.\n\
  \ "]

type nonrec return_data = bool [@@ocaml.doc ""]

type nonrec target_tracking_metric_data_query = {
  return_data : return_data option;
      [@ocaml.doc
        "Indicates whether to return the timestamps and raw data values of this metric. \n\n\
        \ If you use any math expressions, specify [true] for this value for only the final math \
         expression that the metric specification is based on. You must specify [false] for \
         [ReturnData] for all the other metrics and expressions used in the metric specification.\n\
        \ \n\
        \  If you are only retrieving metrics and not performing any math expressions, do not \
         specify anything for [ReturnData]. This sets it to its default ([true]).\n\
        \  "]
  metric_stat : target_tracking_metric_stat option;
      [@ocaml.doc
        "Information about the metric data to return.\n\n\
        \ Conditional: Within each [MetricDataQuery] object, you must specify either [Expression] \
         or [MetricStat], but not both.\n\
        \ "]
  label : xml_string option;
      [@ocaml.doc
        "A human-readable label for this metric or expression. This is especially useful if this \
         is a math expression, so that you know what the value represents.\n"]
  id : id;
      [@ocaml.doc
        "A short name that identifies the object's results in the response. This name must be \
         unique among all [MetricDataQuery] objects specified for a single scaling policy. If you \
         are performing math expressions on this set of data, this name represents that data and \
         can serve as a variable in the mathematical expression. The valid characters are letters, \
         numbers, and underscores. The first character must be a lowercase letter. \n"]
  expression : expression option;
      [@ocaml.doc
        "The math expression to perform on the returned data, if this object is performing a math \
         expression. This expression can use the [Id] of the other metrics to refer to those \
         metrics, and can also use the [Id] of other expressions to use the result of those \
         expressions. \n\n\
        \ Conditional: Within each [TargetTrackingMetricDataQuery] object, you must specify either \
         [Expression] or [MetricStat], but not both.\n\
        \ "]
}
[@@ocaml.doc
  "The metric data to return. Also defines whether this call is returning data for one metric \
   only, or whether it is performing a math expression on the values of returned metric statistics \
   to create a new time series. A time series is a series of data points, each of which is \
   associated with a timestamp.\n\n\
  \ For more information and examples, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking-metric-math.html}Create \
   a target tracking scaling policy for Application Auto Scaling using metric math} in the {i \
   Application Auto Scaling User Guide}.\n\
  \ "]

type nonrec target_tracking_metric_data_queries = target_tracking_metric_data_query list
[@@ocaml.doc ""]

type nonrec customized_metric_specification = {
  metrics : target_tracking_metric_data_queries option;
      [@ocaml.doc
        "The metrics to include in the target tracking scaling policy, as a metric data query. \
         This can include both raw metric and metric math expressions.\n"]
  unit_ : metric_unit option;
      [@ocaml.doc
        "The unit of the metric. For a complete list of the units that CloudWatch supports, see \
         the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html}MetricDatum} \
         data type in the {i Amazon CloudWatch API Reference}.\n"]
  statistic : metric_statistic option; [@ocaml.doc "The statistic of the metric.\n"]
  dimensions : metric_dimensions option;
      [@ocaml.doc
        "The dimensions of the metric. \n\n\
        \ Conditional: If you published your metric with dimensions, you must specify the same \
         dimensions in your scaling policy.\n\
        \ "]
  namespace : metric_namespace option; [@ocaml.doc "The namespace of the metric.\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "The name of the metric. To get the exact metric name, namespace, and dimensions, inspect \
         the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html}Metric} \
         object that's returned by a call to \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html}ListMetrics}.\n"]
}
[@@ocaml.doc
  "Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use \
   with Application Auto Scaling.\n\n\
  \ For information about the available metrics for a service, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html}Amazon \
   Web Services services that publish CloudWatch metrics} in the {i Amazon CloudWatch User Guide}.\n\
  \ \n\
  \  To create your customized metric specification:\n\
  \  \n\
  \   {ul\n\
  \         {-  Add values for each required parameter from CloudWatch. You can use an existing \
   metric, or a new metric that you create. To use your own metric, you must first publish the \
   metric to CloudWatch. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html}Publish \
   custom metrics} in the {i Amazon CloudWatch User Guide}.\n\
  \             \n\
  \              }\n\
  \         {-  Choose a metric that changes proportionally with capacity. The value of the metric \
   should increase or decrease in inverse proportion to the number of capacity units. That is, the \
   value of the metric should decrease when capacity increases, and increase when capacity \
   decreases. \n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For more information about the CloudWatch terminology below, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html}Amazon \
   CloudWatch concepts} in the {i Amazon CloudWatch User Guide}. \n\
  \   "]

type nonrec cooldown = int [@@ocaml.doc ""]

type nonrec disable_scale_in = bool [@@ocaml.doc ""]

type nonrec target_tracking_scaling_policy_configuration = {
  disable_scale_in : disable_scale_in option;
      [@ocaml.doc
        "Indicates whether scale in by the target tracking scaling policy is disabled. If the \
         value is [true], scale in is disabled and the target tracking scaling policy won't remove \
         capacity from the scalable target. Otherwise, scale in is enabled and the target tracking \
         scaling policy can remove capacity from the scalable target. The default value is [false].\n"]
  scale_in_cooldown : cooldown option;
      [@ocaml.doc
        "The amount of time, in seconds, after a scale-in activity completes before another \
         scale-in activity can start. For more information and for default values, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/target-tracking-scaling-policy-overview.html#target-tracking-cooldown}Define \
         cooldown periods} in the {i Application Auto Scaling User Guide}.\n"]
  scale_out_cooldown : cooldown option;
      [@ocaml.doc
        "The amount of time, in seconds, to wait for a previous scale-out activity to take effect. \
         For more information and for default values, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/target-tracking-scaling-policy-overview.html#target-tracking-cooldown}Define \
         cooldown periods} in the {i Application Auto Scaling User Guide}.\n"]
  customized_metric_specification : customized_metric_specification option;
      [@ocaml.doc
        "A customized metric. You can specify either a predefined metric or a customized metric.\n"]
  predefined_metric_specification : predefined_metric_specification option;
      [@ocaml.doc
        "A predefined metric. You can specify either a predefined metric or a customized metric.\n"]
  target_value : metric_scale;
      [@ocaml.doc
        "The target value for the metric. Although this property accepts numbers of type Double, \
         it won't accept values that are either too small or too large. Values must be in the \
         range of -2^360 to 2^360. The value must be a valid number based on the choice of metric. \
         For example, if the metric is CPU utilization, then the target value is a percent value \
         that represents how much of the CPU can be used before scaling out. \n\n\
        \  If the scaling policy specifies the [ALBRequestCountPerTarget] predefined metric, \
         specify the target utilization as the optimal average request count per target during any \
         one-minute interval.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Represents a target tracking scaling policy configuration to use with Application Auto Scaling.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html}Target \
   tracking scaling policies} in the {i Application Auto Scaling User Guide}.\n\
  \ "]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_map;
      [@ocaml.doc
        "The tags assigned to the resource. A tag is a label that you assign to an Amazon Web \
         Services resource.\n\n\
        \ Each tag consists of a tag key and a tag value.\n\
        \ \n\
        \  You cannot have more than one tag on an Application Auto Scaling scalable target with \
         the same tag key. If you specify an existing tag key with a different tag value, \
         Application Auto Scaling replaces the current tag value with the specified one.\n\
        \  \n\
        \   For information about the rules that apply to tag keys and tag values, see \
         {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html}User-defined \
         tag restrictions} in the {i Amazon Web Services Billing User Guide}.\n\
        \   "]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Identifies the Application Auto Scaling scalable target that you want to apply tags to.\n\n\
        \ For example: \
         [arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123] \n\
        \ \n\
        \  To get the ARN for a scalable target, use [DescribeScalableTargets].\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec scaling_suspended = bool [@@ocaml.doc ""]

type nonrec suspended_state = {
  scheduled_scaling_suspended : scaling_suspended option;
      [@ocaml.doc
        "Whether scheduled scaling is suspended. Set the value to [true] if you don't want \
         Application Auto Scaling to add or remove capacity by initiating scheduled actions. The \
         default is [false]. \n"]
  dynamic_scaling_out_suspended : scaling_suspended option;
      [@ocaml.doc
        "Whether scale out by a target tracking scaling policy or a step scaling policy is \
         suspended. Set the value to [true] if you don't want Application Auto Scaling to add \
         capacity when a scaling policy is triggered. The default is [false]. \n"]
  dynamic_scaling_in_suspended : scaling_suspended option;
      [@ocaml.doc
        "Whether scale in by a target tracking scaling policy or a step scaling policy is \
         suspended. Set the value to [true] if you don't want Application Auto Scaling to remove \
         capacity when a scaling policy is triggered. The default is [false]. \n"]
}
[@@ocaml.doc
  "Specifies whether the scaling activities for a scalable target are in a suspended state. \n"]

type nonrec adjustment_type =
  | ExactCapacity [@ocaml.doc ""]
  | PercentChangeInCapacity [@ocaml.doc ""]
  | ChangeInCapacity [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scaling_adjustment = int [@@ocaml.doc ""]

type nonrec step_adjustment = {
  scaling_adjustment : scaling_adjustment;
      [@ocaml.doc
        "The amount by which to scale, based on the specified adjustment type. A positive value \
         adds to the current capacity while a negative number removes from the current capacity. \
         For exact capacity, you must specify a non-negative value.\n"]
  metric_interval_upper_bound : metric_scale option;
      [@ocaml.doc
        "The upper bound for the difference between the alarm threshold and the CloudWatch metric. \
         If the metric value is above the breach threshold, the upper bound is exclusive (the \
         metric must be less than the threshold plus the upper bound). Otherwise, it's inclusive \
         (the metric must be less than or equal to the threshold plus the upper bound). A null \
         value indicates positive infinity.\n\n\
        \ The upper bound must be greater than the lower bound.\n\
        \ "]
  metric_interval_lower_bound : metric_scale option;
      [@ocaml.doc
        "The lower bound for the difference between the alarm threshold and the CloudWatch metric. \
         If the metric value is above the breach threshold, the lower bound is inclusive (the \
         metric must be greater than or equal to the threshold plus the lower bound). Otherwise, \
         it's exclusive (the metric must be greater than the threshold plus the lower bound). A \
         null value indicates negative infinity.\n"]
}
[@@ocaml.doc
  "Represents a step adjustment for a \
   {{:https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepScalingPolicyConfiguration.html}StepScalingPolicyConfiguration}. \
   Describes an adjustment based on the difference between the value of the aggregated CloudWatch \
   metric and the breach threshold that you've defined for the alarm. \n\n\
  \ For the following examples, suppose that you have an alarm with a breach threshold of 50:\n\
  \ \n\
  \  {ul\n\
  \        {-  To initiate the adjustment when the metric is greater than or equal to 50 and less \
   than 60, specify a lower bound of [0] and an upper bound of [10].\n\
  \            \n\
  \             }\n\
  \        {-  To initiate the adjustment when the metric is greater than 40 and less than or \
   equal to 50, specify a lower bound of [-10] and an upper bound of [0].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   There are a few rules for the step adjustments for your step policy:\n\
  \   \n\
  \    {ul\n\
  \          {-  The ranges of your step adjustments can't overlap or have a gap.\n\
  \              \n\
  \               }\n\
  \          {-  At most one step adjustment can have a null lower bound. If one step adjustment \
   has a negative lower bound, then there must be a step adjustment with a null lower bound.\n\
  \              \n\
  \               }\n\
  \          {-  At most one step adjustment can have a null upper bound. If one step adjustment \
   has a positive upper bound, then there must be a step adjustment with a null upper bound.\n\
  \              \n\
  \               }\n\
  \          {-  The upper and lower bound can't be null in the same step adjustment.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec step_adjustments = step_adjustment list [@@ocaml.doc ""]

type nonrec min_adjustment_magnitude = int [@@ocaml.doc ""]

type nonrec metric_aggregation_type =
  | Maximum [@ocaml.doc ""]
  | Minimum [@ocaml.doc ""]
  | Average [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec step_scaling_policy_configuration = {
  metric_aggregation_type : metric_aggregation_type option;
      [@ocaml.doc
        "The aggregation type for the CloudWatch metrics. Valid values are [Minimum], [Maximum], \
         and [Average]. If the aggregation type is null, the value is treated as [Average].\n"]
  cooldown : cooldown option;
      [@ocaml.doc
        "The amount of time, in seconds, to wait for a previous scaling activity to take effect. \
         If not specified, the default value is 300. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/step-scaling-policy-overview.html#step-scaling-cooldown}Cooldown \
         period} in the {i Application Auto Scaling User Guide}.\n"]
  min_adjustment_magnitude : min_adjustment_magnitude option;
      [@ocaml.doc
        "The minimum value to scale by when the adjustment type is [PercentChangeInCapacity]. For \
         example, suppose that you create a step scaling policy to scale out an Amazon ECS service \
         by 25 percent and you specify a [MinAdjustmentMagnitude] of 2. If the service has 4 tasks \
         and the scaling policy is performed, 25 percent of 4 is 1. However, because you specified \
         a [MinAdjustmentMagnitude] of 2, Application Auto Scaling scales out the service by 2 \
         tasks.\n"]
  step_adjustments : step_adjustments option;
      [@ocaml.doc
        "A set of adjustments that enable you to scale based on the size of the alarm breach.\n\n\
        \ At least one step adjustment is required if you are adding a new step scaling policy \
         configuration.\n\
        \ "]
  adjustment_type : adjustment_type option;
      [@ocaml.doc
        "Specifies how the [ScalingAdjustment] value in a \
         {{:https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepAdjustment.html}StepAdjustment} \
         is interpreted (for example, an absolute number or a percentage). The valid values are \
         [ChangeInCapacity], [ExactCapacity], and [PercentChangeInCapacity]. \n\n\
        \  [AdjustmentType] is required if you are adding a new step scaling policy configuration.\n\
        \ "]
}
[@@ocaml.doc
  "Represents a step scaling policy configuration to use with Application Auto Scaling.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html}Step \
   scaling policies} in the {i Application Auto Scaling User Guide}.\n\
  \ "]

type nonrec service_namespace =
  | WORKSPACES [@ocaml.doc ""]
  | NEPTUNE [@ocaml.doc ""]
  | ELASTICACHE [@ocaml.doc ""]
  | KAFKA [@ocaml.doc ""]
  | CASSANDRA [@ocaml.doc ""]
  | LAMBDA [@ocaml.doc ""]
  | COMPREHEND [@ocaml.doc ""]
  | CUSTOM_RESOURCE [@ocaml.doc ""]
  | SAGEMAKER [@ocaml.doc ""]
  | RDS [@ocaml.doc ""]
  | DYNAMODB [@ocaml.doc ""]
  | APPSTREAM [@ocaml.doc ""]
  | EC2 [@ocaml.doc ""]
  | EMR [@ocaml.doc ""]
  | ECS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scheduled_action_name = string [@@ocaml.doc ""]

type nonrec resource_id_max_len1600 = string [@@ocaml.doc ""]

type nonrec scalable_dimension =
  | WorkSpacesWorkSpacesPoolDesiredUserSessions [@ocaml.doc ""]
  | SageMakerInferenceComponentDesiredCopyCount [@ocaml.doc ""]
  | SageMakerVariantDesiredProvisionedConcurrency [@ocaml.doc ""]
  | NeptuneClusterReadReplicaCount [@ocaml.doc ""]
  | ElastiCacheReplicationGroupReplicas [@ocaml.doc ""]
  | ElastiCacheReplicationGroupNodeGroups [@ocaml.doc ""]
  | ElastiCacheCacheClusterNodes [@ocaml.doc ""]
  | KafkaBrokerStorageVolumeSize [@ocaml.doc ""]
  | CassandraTableWriteCapacityUnits [@ocaml.doc ""]
  | CassandraTableReadCapacityUnits [@ocaml.doc ""]
  | LambdaFunctionProvisionedConcurrency [@ocaml.doc ""]
  | ComprehendEntityRecognizerEndpointInferenceUnits [@ocaml.doc ""]
  | ComprehendDocClassifierEndpointInferenceUnits [@ocaml.doc ""]
  | CustomResourceScalableDimension [@ocaml.doc ""]
  | SageMakerVariantDesiredInstanceCount [@ocaml.doc ""]
  | RDSClusterReadReplicaCount [@ocaml.doc ""]
  | DynamoDBIndexWriteCapacityUnits [@ocaml.doc ""]
  | DynamoDBIndexReadCapacityUnits [@ocaml.doc ""]
  | DynamoDBTableWriteCapacityUnits [@ocaml.doc ""]
  | DynamoDBTableReadCapacityUnits [@ocaml.doc ""]
  | AppstreamFleetDesiredCapacity [@ocaml.doc ""]
  | EMRInstanceGroupInstanceCount [@ocaml.doc ""]
  | EC2SpotFleetRequestTargetCapacity [@ocaml.doc ""]
  | ECSServiceDesiredCount [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_capacity = int [@@ocaml.doc ""]

type nonrec scalable_target_action = {
  max_capacity : resource_capacity option;
      [@ocaml.doc
        "The maximum capacity.\n\n\
        \ Although you can specify a large maximum capacity, note that service quotas may impose \
         lower limits. Each service has its own default quotas for the maximum capacity of the \
         resource. If you want to specify a higher limit, you can request an increase. For more \
         information, consult the documentation for that service. For information about the \
         default quotas for each service, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html}Service \
         endpoints and quotas} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  min_capacity : resource_capacity option;
      [@ocaml.doc
        "The minimum capacity.\n\n\
        \ When the scheduled action runs, the resource will have at least this much capacity, but \
         it might have more depending on other settings, such as the target utilization level of a \
         target tracking scaling policy.\n\
        \ "]
}
[@@ocaml.doc "Represents the minimum and maximum capacity for a scheduled action.\n"]

type nonrec scheduled_action = {
  creation_time : timestamp_type;
      [@ocaml.doc "The date and time that the scheduled action was created.\n"]
  scalable_target_action : scalable_target_action option;
      [@ocaml.doc
        "The new minimum and maximum capacity. You can set both values or just one. At the \
         scheduled time, if the current capacity is below the minimum capacity, Application Auto \
         Scaling scales out to the minimum capacity. If the current capacity is above the maximum \
         capacity, Application Auto Scaling scales in to the maximum capacity.\n"]
  end_time : timestamp_type option;
      [@ocaml.doc "The date and time that the action is scheduled to end, in UTC.\n"]
  start_time : timestamp_type option;
      [@ocaml.doc "The date and time that the action is scheduled to begin, in UTC.\n"]
  scalable_dimension : scalable_dimension option;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scaling policy. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  timezone : resource_id_max_len1600 option;
      [@ocaml.doc
        "The time zone used when referring to the date and time of a scheduled action, when the \
         scheduled action uses an at or cron expression.\n"]
  schedule : resource_id_max_len1600;
      [@ocaml.doc
        "The schedule for this action. The following formats are supported:\n\n\
        \ {ul\n\
        \       {-  At expressions - \"\n\
        \           {[\n\
        \           at({i yyyy}-{i mm}-{i dd}T{i hh}:{i mm}:{i ss})\n\
        \           ]}\n\
        \           \"\n\
        \           \n\
        \            }\n\
        \       {-  Rate expressions - \"\n\
        \           {[\n\
        \           rate({i value} {i unit})\n\
        \           ]}\n\
        \           \"\n\
        \           \n\
        \            }\n\
        \       {-  Cron expressions - \"\n\
        \           {[\n\
        \           cron({i fields})\n\
        \           ]}\n\
        \           \"\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   At expressions are useful for one-time schedules. Cron expressions are useful for \
         scheduled actions that run periodically at a specified date and time, and rate \
         expressions are useful for scheduled actions that run at a regular interval.\n\
        \   \n\
        \    At and cron expressions use Universal Coordinated Time (UTC) by default.\n\
        \    \n\
        \     The cron format consists of six fields separated by white spaces: \\[Minutes\\] \
         \\[Hours\\] \\[Day_of_Month\\] \\[Month\\] \\[Day_of_Week\\] \\[Year\\].\n\
        \     \n\
        \      For rate expressions, {i value} is a positive integer and {i unit} is [minute] | \
         [minutes] | [hour] | [hours] | [day] | [days].\n\
        \      \n\
        \       For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/scheduled-scaling-using-cron-expressions.html}Schedule \
         recurring scaling actions using cron expressions} in the {i Application Auto Scaling User \
         Guide}.\n\
        \       "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource, or a \
         [custom-resource].\n"]
  scheduled_action_ar_n : resource_id_max_len1600;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the scheduled action.\n"]
  scheduled_action_name : scheduled_action_name; [@ocaml.doc "The name of the scheduled action.\n"]
}
[@@ocaml.doc "Represents a scheduled action.\n"]

type nonrec scheduled_actions = scheduled_action list [@@ocaml.doc ""]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec policy_type =
  | PredictiveScaling [@ocaml.doc ""]
  | TargetTrackingScaling [@ocaml.doc ""]
  | StepScaling [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_metric_type = string [@@ocaml.doc ""]

type nonrec predictive_scaling_predefined_metric_pair_specification = {
  resource_label : resource_label option;
      [@ocaml.doc
        " A label that uniquely identifies a specific target group from which to determine the \
         total and average request count. \n"]
  predefined_metric_type : predictive_scaling_metric_type;
      [@ocaml.doc
        " Indicates which metrics to use. There are two different types of metrics for each metric \
         type: one is a load metric and one is a scaling metric. \n"]
}
[@@ocaml.doc
  " Represents a metric pair for a predictive scaling policy. \n\n\
  \ The following predefined metrics are available for predictive scaling:\n\
  \ \n\
  \  {ul\n\
  \        {-   [ECSServiceAverageCPUUtilization] \n\
  \            \n\
  \             }\n\
  \        {-   [ECSServiceAverageMemoryUtilization] \n\
  \            \n\
  \             }\n\
  \        {-   [ECSServiceCPUUtilization] \n\
  \            \n\
  \             }\n\
  \        {-   [ECSServiceMemoryUtilization] \n\
  \            \n\
  \             }\n\
  \        {-   [ECSServiceTotalCPUUtilization] \n\
  \            \n\
  \             }\n\
  \        {-   [ECSServiceTotalMemoryUtilization] \n\
  \            \n\
  \             }\n\
  \        {-   [ALBRequestCount] \n\
  \            \n\
  \             }\n\
  \        {-   [ALBRequestCountPerTarget] \n\
  \            \n\
  \             }\n\
  \        {-   [TotalALBRequestCount] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec predictive_scaling_predefined_scaling_metric_specification = {
  resource_label : resource_label option;
      [@ocaml.doc
        " A label that uniquely identifies a specific target group from which to determine the \
         average request count. \n"]
  predefined_metric_type : predictive_scaling_metric_type; [@ocaml.doc " The metric type. \n"]
}
[@@ocaml.doc
  " Describes a scaling metric for a predictive scaling policy. \n\n\
  \ When returned in the output of [DescribePolicies], it indicates that a predictive scaling \
   policy uses individually specified load and scaling metrics instead of a metric pair.\n\
  \ \n\
  \  The following predefined metrics are available for predictive scaling:\n\
  \  \n\
  \   {ul\n\
  \         {-   [ECSServiceAverageCPUUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceAverageMemoryUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceCPUUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceMemoryUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceTotalCPUUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceTotalMemoryUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ALBRequestCount] \n\
  \             \n\
  \              }\n\
  \         {-   [ALBRequestCountPerTarget] \n\
  \             \n\
  \              }\n\
  \         {-   [TotalALBRequestCount] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

type nonrec predictive_scaling_predefined_load_metric_specification = {
  resource_label : resource_label option;
      [@ocaml.doc " A label that uniquely identifies a target group. \n"]
  predefined_metric_type : predictive_scaling_metric_type; [@ocaml.doc " The metric type. \n"]
}
[@@ocaml.doc
  " Describes a load metric for a predictive scaling policy. \n\n\
  \ When returned in the output of [DescribePolicies], it indicates that a predictive scaling \
   policy uses individually specified load and scaling metrics instead of a metric pair.\n\
  \ \n\
  \  The following predefined metrics are available for predictive scaling:\n\
  \  \n\
  \   {ul\n\
  \         {-   [ECSServiceAverageCPUUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceAverageMemoryUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceCPUUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceMemoryUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceTotalCPUUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ECSServiceTotalMemoryUtilization] \n\
  \             \n\
  \              }\n\
  \         {-   [ALBRequestCount] \n\
  \             \n\
  \              }\n\
  \         {-   [ALBRequestCountPerTarget] \n\
  \             \n\
  \              }\n\
  \         {-   [TotalALBRequestCount] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

type nonrec predictive_scaling_metric_dimension_name = string [@@ocaml.doc ""]

type nonrec predictive_scaling_metric_dimension_value = string [@@ocaml.doc ""]

type nonrec predictive_scaling_metric_dimension = {
  value : predictive_scaling_metric_dimension_value; [@ocaml.doc " The value of the dimension. \n"]
  name : predictive_scaling_metric_dimension_name; [@ocaml.doc " The name of the dimension. \n"]
}
[@@ocaml.doc " Describes the dimension of a metric. \n"]

type nonrec predictive_scaling_metric_dimensions = predictive_scaling_metric_dimension list
[@@ocaml.doc ""]

type nonrec predictive_scaling_metric_name = string [@@ocaml.doc ""]

type nonrec predictive_scaling_metric_namespace = string [@@ocaml.doc ""]

type nonrec predictive_scaling_metric = {
  namespace : predictive_scaling_metric_namespace option;
      [@ocaml.doc " The namespace of the metric. \n"]
  metric_name : predictive_scaling_metric_name option; [@ocaml.doc " The name of the metric. \n"]
  dimensions : predictive_scaling_metric_dimensions option;
      [@ocaml.doc " Describes the dimensions of the metric. \n"]
}
[@@ocaml.doc " Describes the scaling metric. \n"]

type nonrec predictive_scaling_metric_unit = string [@@ocaml.doc ""]

type nonrec predictive_scaling_metric_stat = {
  unit_ : predictive_scaling_metric_unit option;
      [@ocaml.doc
        " The unit to use for the returned data points. For a complete list of the units that \
         CloudWatch supports, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html}MetricDatum} \
         data type in the {i Amazon CloudWatch API Reference}. \n"]
  stat : xml_string;
      [@ocaml.doc
        " The statistic to return. It can include any CloudWatch statistic or extended statistic. \
         For a list of valid values, see the table in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic}Statistics} \
         in the {i Amazon CloudWatch User Guide}. \n\n\
        \ The most commonly used metrics for predictive scaling are [Average] and [Sum].\n\
        \ "]
  metric : predictive_scaling_metric;
      [@ocaml.doc
        " The CloudWatch metric to return, including the metric name, namespace, and dimensions. \
         To get the exact metric name, namespace, and dimensions, inspect the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html}Metric} \
         object that is returned by a call to \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html}ListMetrics}. \n"]
}
[@@ocaml.doc
  " This structure defines the CloudWatch metric to return, along with the statistic and unit. \n"]

type nonrec predictive_scaling_metric_data_query = {
  return_data : return_data option;
      [@ocaml.doc
        " Indicates whether to return the timestamps and raw data values of this metric. \n\n\
        \ If you use any math expressions, specify [true] for this value for only the final math \
         expression that the metric specification is based on. You must specify [false] for \
         [ReturnData] for all the other metrics and expressions used in the metric specification.\n\
        \ \n\
        \  If you are only retrieving metrics and not performing any math expressions, do not \
         specify anything for [ReturnData]. This sets it to its default ([true]).\n\
        \  "]
  label : xml_string option;
      [@ocaml.doc
        " A human-readable label for this metric or expression. This is especially useful if this \
         is a math expression, so that you know what the value represents. \n"]
  metric_stat : predictive_scaling_metric_stat option;
      [@ocaml.doc
        " Information about the metric data to return. \n\n\
        \ Conditional: Within each [MetricDataQuery] object, you must specify either [Expression] \
         or [MetricStat], but not both.\n\
        \ "]
  expression : expression option;
      [@ocaml.doc
        " The math expression to perform on the returned data, if this object is performing a math \
         expression. This expression can use the [Id] of the other metrics to refer to those \
         metrics, and can also use the [Id] of other expressions to use the result of those \
         expressions. \n\n\
        \ Conditional: Within each [MetricDataQuery] object, you must specify either [Expression] \
         or [MetricStat], but not both.\n\
        \ "]
  id : id;
      [@ocaml.doc
        " A short name that identifies the object's results in the response. This name must be \
         unique among all [MetricDataQuery] objects specified for a single scaling policy. If you \
         are performing math expressions on this set of data, this name represents that data and \
         can serve as a variable in the mathematical expression. The valid characters are letters, \
         numbers, and underscores. The first character must be a lowercase letter. \n"]
}
[@@ocaml.doc
  " The metric data to return. Also defines whether this call is returning data for one metric \
   only, or whether it is performing a math expression on the values of returned metric statistics \
   to create a new time series. A time series is a series of data points, each of which is \
   associated with a timestamp. \n"]

type nonrec predictive_scaling_metric_data_queries = predictive_scaling_metric_data_query list
[@@ocaml.doc ""]

type nonrec predictive_scaling_customized_metric_specification = {
  metric_data_queries : predictive_scaling_metric_data_queries;
      [@ocaml.doc
        " One or more metric data queries to provide data points for a metric specification. \n"]
}
[@@ocaml.doc " Represents a CloudWatch metric of your choosing for a predictive scaling policy. \n"]

type nonrec predictive_scaling_metric_specification = {
  customized_capacity_metric_specification :
    predictive_scaling_customized_metric_specification option;
      [@ocaml.doc " The customized capacity metric specification. \n"]
  customized_load_metric_specification : predictive_scaling_customized_metric_specification option;
      [@ocaml.doc " The customized load metric specification. \n"]
  customized_scaling_metric_specification :
    predictive_scaling_customized_metric_specification option;
      [@ocaml.doc " The customized scaling metric specification. \n"]
  predefined_load_metric_specification :
    predictive_scaling_predefined_load_metric_specification option;
      [@ocaml.doc " The predefined load metric specification. \n"]
  predefined_scaling_metric_specification :
    predictive_scaling_predefined_scaling_metric_specification option;
      [@ocaml.doc " The predefined scaling metric specification. \n"]
  predefined_metric_pair_specification :
    predictive_scaling_predefined_metric_pair_specification option;
      [@ocaml.doc
        " The predefined metric pair specification that determines the appropriate scaling metric \
         and load metric to use. \n"]
  target_value : metric_scale; [@ocaml.doc " Specifies the target utilization. \n"]
}
[@@ocaml.doc
  " This structure specifies the metrics and target utilization settings for a predictive scaling \
   policy. \n\n\
  \ You must specify either a metric pair, or a load metric and a scaling metric individually. \
   Specifying a metric pair instead of individual metrics provides a simpler way to configure \
   metrics for a scaling policy. You choose the metric pair, and the policy automatically knows \
   the correct sum and average statistics to use for the load metric and the scaling metric.\n\
  \ "]

type nonrec predictive_scaling_metric_specifications = predictive_scaling_metric_specification list
[@@ocaml.doc ""]

type nonrec predictive_scaling_mode =
  | ForecastAndScale [@ocaml.doc ""]
  | ForecastOnly [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_scheduling_buffer_time = int [@@ocaml.doc ""]

type nonrec predictive_scaling_max_capacity_breach_behavior =
  | IncreaseMaxCapacity [@ocaml.doc ""]
  | HonorMaxCapacity [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_max_capacity_buffer = int [@@ocaml.doc ""]

type nonrec predictive_scaling_policy_configuration = {
  max_capacity_buffer : predictive_scaling_max_capacity_buffer option;
      [@ocaml.doc
        " The size of the capacity buffer to use when the forecast capacity is close to or exceeds \
         the maximum capacity. The value is specified as a percentage relative to the forecast \
         capacity. For example, if the buffer is 10, this means a 10 percent buffer, such that if \
         the forecast capacity is 50, and the maximum capacity is 40, then the effective maximum \
         capacity is 55. \n\n\
        \ Required if the [MaxCapacityBreachBehavior] property is set to [IncreaseMaxCapacity], \
         and cannot be used otherwise.\n\
        \ "]
  max_capacity_breach_behavior : predictive_scaling_max_capacity_breach_behavior option;
      [@ocaml.doc
        " Defines the behavior that should be applied if the forecast capacity approaches or \
         exceeds the maximum capacity. Defaults to [HonorMaxCapacity] if not specified. \n"]
  scheduling_buffer_time : predictive_scaling_scheduling_buffer_time option;
      [@ocaml.doc
        " The amount of time, in seconds, that the start time can be advanced. \n\n\
        \ The value must be less than the forecast interval duration of 3600 seconds (60 minutes). \
         Defaults to 300 seconds if not specified. \n\
        \ "]
  mode : predictive_scaling_mode option;
      [@ocaml.doc " The predictive scaling mode. Defaults to [ForecastOnly] if not specified. \n"]
  metric_specifications : predictive_scaling_metric_specifications;
      [@ocaml.doc
        " This structure includes the metrics and target utilization to use for predictive \
         scaling. \n\n\
        \ This is an array, but we currently only support a single metric specification. That is, \
         you can specify a target value and a single metric pair, or a target value and one \
         scaling metric and one load metric.\n\
        \ "]
}
[@@ocaml.doc
  " Represents a predictive scaling policy configuration. Predictive scaling is supported on \
   Amazon ECS services. \n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec alarm = {
  alarm_ar_n : resource_id; [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm.\n"]
  alarm_name : resource_id; [@ocaml.doc "The name of the alarm.\n"]
}
[@@ocaml.doc "Represents a CloudWatch alarm associated with a scaling policy.\n"]

type nonrec alarms = alarm list [@@ocaml.doc ""]

type nonrec scaling_policy = {
  creation_time : timestamp_type;
      [@ocaml.doc "The Unix timestamp for when the scaling policy was created.\n"]
  alarms : alarms option; [@ocaml.doc "The CloudWatch alarms associated with the scaling policy.\n"]
  predictive_scaling_policy_configuration : predictive_scaling_policy_configuration option;
      [@ocaml.doc " The predictive scaling policy configuration. \n"]
  target_tracking_scaling_policy_configuration :
    target_tracking_scaling_policy_configuration option;
      [@ocaml.doc "A target tracking scaling policy.\n"]
  step_scaling_policy_configuration : step_scaling_policy_configuration option;
      [@ocaml.doc "A step scaling policy.\n"]
  policy_type : policy_type;
      [@ocaml.doc
        "The scaling policy type.\n\n\
        \ The following policy types are supported: \n\
        \ \n\
        \   [TargetTrackingScaling]\226\128\148Not supported for Amazon EMR\n\
        \  \n\
        \    [StepScaling]\226\128\148Not supported for DynamoDB, Amazon Comprehend, Lambda, \
         Amazon Keyspaces, Amazon MSK, Amazon ElastiCache, or Neptune.\n\
        \   \n\
        \     [PredictiveScaling]\226\128\148Only supported for Amazon ECS\n\
        \    "]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scaling policy. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource, or a \
         [custom-resource].\n"]
  policy_name : policy_name; [@ocaml.doc "The name of the scaling policy.\n"]
  policy_ar_n : resource_id_max_len1600;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the scaling policy.\n"]
}
[@@ocaml.doc
  "Represents a scaling policy to use with Application Auto Scaling.\n\n\
  \ For more information about configuring scaling policies for a specific service, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/integrated-services-list.html}Amazon \
   Web Services services that you can use with Application Auto Scaling} in the {i Application \
   Auto Scaling User Guide}.\n\
  \ "]

type nonrec scaling_policies = scaling_policy list [@@ocaml.doc ""]

type nonrec scaling_activity_status_code =
  | Failed [@ocaml.doc ""]
  | Unfulfilled [@ocaml.doc ""]
  | Overridden [@ocaml.doc ""]
  | Successful [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | Pending [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec not_scaled_reason = {
  current_capacity : resource_capacity option; [@ocaml.doc "The current capacity.\n"]
  min_capacity : resource_capacity option; [@ocaml.doc "The minimum capacity.\n"]
  max_capacity : resource_capacity option; [@ocaml.doc "The maximum capacity.\n"]
  code : xml_string;
      [@ocaml.doc
        "A code that represents the reason for not scaling.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  AutoScalingAnticipatedFlapping\n\
        \            \n\
        \             }\n\
        \        {-  TargetServicePutResourceAsUnscalable\n\
        \            \n\
        \             }\n\
        \        {-  AlreadyAtMaxCapacity\n\
        \            \n\
        \             }\n\
        \        {-  AlreadyAtMinCapacity\n\
        \            \n\
        \             }\n\
        \        {-  AlreadyAtDesiredCapacity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Describes the reason for an activity that isn't scaled ({i not scaled activity}), in \
   machine-readable format. For help interpreting the not scaled reason details, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scaling-activities.html}Scaling \
   activities for Application Auto Scaling} in the {i Application Auto Scaling User Guide}.\n"]

type nonrec not_scaled_reasons = not_scaled_reason list [@@ocaml.doc ""]

type nonrec scaling_activity = {
  not_scaled_reasons : not_scaled_reasons option;
      [@ocaml.doc
        "Machine-readable data that describes the reason for a not scaled activity. Only available \
         when \
         {{:https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
         includes not scaled activities.\n"]
  details : xml_string option; [@ocaml.doc "The details about the scaling activity.\n"]
  status_message : xml_string option;
      [@ocaml.doc "A simple message about the current status of the scaling activity.\n"]
  status_code : scaling_activity_status_code;
      [@ocaml.doc "Indicates the status of the scaling activity.\n"]
  end_time : timestamp_type option;
      [@ocaml.doc "The Unix timestamp for when the scaling activity ended.\n"]
  start_time : timestamp_type;
      [@ocaml.doc "The Unix timestamp for when the scaling activity began.\n"]
  cause : xml_string;
      [@ocaml.doc "A simple description of what caused the scaling activity to happen.\n"]
  description : xml_string;
      [@ocaml.doc
        "A simple description of what action the scaling activity intends to accomplish.\n"]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scaling activity. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource, or a \
         [custom-resource].\n"]
  activity_id : resource_id; [@ocaml.doc "The unique identifier of the scaling activity.\n"]
}
[@@ocaml.doc "Represents a scaling activity.\n"]

type nonrec scaling_activities = scaling_activity list [@@ocaml.doc ""]

type nonrec scalable_target = {
  scalable_target_ar_n : xml_string option; [@ocaml.doc "The ARN of the scalable target.\n"]
  suspended_state : suspended_state option;
      [@ocaml.doc
        "Specifies whether the scaling activities for a scalable target are in a suspended state.\n"]
  creation_time : timestamp_type;
      [@ocaml.doc "The Unix timestamp for when the scalable target was created.\n"]
  role_ar_n : resource_id_max_len1600;
      [@ocaml.doc
        "The ARN of an IAM role that allows Application Auto Scaling to modify the scalable target \
         on your behalf.\n"]
  predicted_capacity : resource_capacity option;
      [@ocaml.doc " The predicted capacity of the scalable target. \n"]
  max_capacity : resource_capacity;
      [@ocaml.doc "The maximum value to scale to in response to a scale-out activity.\n"]
  min_capacity : resource_capacity;
      [@ocaml.doc "The minimum value to scale to in response to a scale-in activity.\n"]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension associated with the scalable target. This string consists of the \
         service namespace, resource type, and scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scalable target. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource, or a \
         [custom-resource].\n"]
}
[@@ocaml.doc "Represents a scalable target.\n"]

type nonrec scalable_targets = scalable_target list [@@ocaml.doc ""]

type nonrec resource_ids_max_len1600 = resource_id_max_len1600 list [@@ocaml.doc ""]

type nonrec register_scalable_target_response = {
  scalable_target_ar_n : xml_string option; [@ocaml.doc "The ARN of the scalable target.\n"]
}
[@@ocaml.doc ""]

type nonrec register_scalable_target_request = {
  tags : tag_map option;
      [@ocaml.doc
        "Assigns one or more tags to the scalable target. Use this parameter to tag the scalable \
         target when it is created. To tag an existing scalable target, use the [TagResource] \
         operation.\n\n\
        \ Each tag consists of a tag key and a tag value. Both the tag key and the tag value are \
         required. You cannot have more than one tag on a scalable target with the same tag key.\n\
        \ \n\
        \  Use tags to control access to a scalable target. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/resource-tagging-support.html}Tagging \
         support for Application Auto Scaling} in the {i Application Auto Scaling User Guide}.\n\
        \  "]
  suspended_state : suspended_state option;
      [@ocaml.doc
        "An embedded object that contains attributes and attribute values that are used to suspend \
         and resume automatic scaling. Setting the value of an attribute to [true] suspends the \
         specified scaling activities. Setting it to [false] (default) resumes the specified \
         scaling activities. \n\n\
        \  {b Suspension Outcomes} \n\
        \ \n\
        \  {ul\n\
        \        {-  For [DynamicScalingInSuspended], while a suspension is in effect, all \
         scale-in activities that are triggered by a scaling policy are suspended.\n\
        \            \n\
        \             }\n\
        \        {-  For [DynamicScalingOutSuspended], while a suspension is in effect, all \
         scale-out activities that are triggered by a scaling policy are suspended.\n\
        \            \n\
        \             }\n\
        \        {-  For [ScheduledScalingSuspended], while a suspension is in effect, all scaling \
         activities that involve scheduled actions are suspended. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-suspend-resume-scaling.html}Suspend \
         and resume scaling} in the {i Application Auto Scaling User Guide}.\n\
        \   "]
  role_ar_n : resource_id_max_len1600 option;
      [@ocaml.doc
        "This parameter is required for services that do not support service-linked roles (such as \
         Amazon EMR), and it must specify the ARN of an IAM role that allows Application Auto \
         Scaling to modify the scalable target on your behalf. \n\n\
        \ If the service supports service-linked roles, Application Auto Scaling uses a \
         service-linked role, which it creates if it does not yet exist. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/security_iam_service-with-iam.html}How \
         Application Auto Scaling works with IAM}.\n\
        \ "]
  max_capacity : resource_capacity option;
      [@ocaml.doc
        "The maximum value that you plan to scale out to. When a scaling policy is in effect, \
         Application Auto Scaling can scale out (expand) as needed to the maximum capacity limit \
         in response to changing demand. This property is required when registering a new scalable \
         target.\n\n\
        \ Although you can specify a large maximum capacity, note that service quotas might impose \
         lower limits. Each service has its own default quotas for the maximum capacity of the \
         resource. If you want to specify a higher limit, you can request an increase. For more \
         information, consult the documentation for that service. For information about the \
         default quotas for each service, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html}Service \
         endpoints and quotas} in the {i Amazon Web Services General Reference}.\n\
        \ "]
  min_capacity : resource_capacity option;
      [@ocaml.doc
        "The minimum value that you plan to scale in to. When a scaling policy is in effect, \
         Application Auto Scaling can scale in (contract) as needed to the minimum capacity limit \
         in response to changing demand. This property is required when registering a new scalable \
         target.\n\n\
        \ For the following resources, the minimum value allowed is 0.\n\
        \ \n\
        \  {ul\n\
        \        {-  AppStream 2.0 fleets\n\
        \            \n\
        \             }\n\
        \        {-   Aurora DB clusters\n\
        \            \n\
        \             }\n\
        \        {-  ECS services\n\
        \            \n\
        \             }\n\
        \        {-  EMR clusters\n\
        \            \n\
        \             }\n\
        \        {-  Lambda provisioned concurrency\n\
        \            \n\
        \             }\n\
        \        {-  SageMaker endpoint variants\n\
        \            \n\
        \             }\n\
        \        {-  SageMaker inference components\n\
        \            \n\
        \             }\n\
        \        {-  SageMaker serverless endpoint provisioned concurrency\n\
        \            \n\
        \             }\n\
        \        {-  Spot Fleets\n\
        \            \n\
        \             }\n\
        \        {-  custom resources\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   It's strongly recommended that you specify a value greater than 0. A value greater \
         than 0 means that data points are continuously reported to CloudWatch that scaling \
         policies can use to scale on a metric like average CPU utilization.\n\
        \   \n\
        \    For all other resources, the minimum allowed value depends on the type of resource \
         that you are using. If you provide a value that is lower than what a resource can accept, \
         an error occurs. In which case, the error message will provide the minimum value that the \
         resource can accept.\n\
        \    "]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension associated with the scalable target. This string consists of the \
         service namespace, resource type, and scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource that is associated with the scalable target. This string \
         consists of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A per-account resource limit is exceeded. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-limits.html}Application \
   Auto Scaling service quotas}.\n"]

type nonrec internal_service_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The service encountered an internal error.\n"]

type nonrec concurrent_update_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Concurrent updates caused an exception, for example, if you request an update to an Application \
   Auto Scaling resource that already has a pending update.\n"]

type nonrec put_scheduled_action_response = unit [@@ocaml.doc ""]

type nonrec put_scheduled_action_request = {
  scalable_target_action : scalable_target_action option;
      [@ocaml.doc
        "The new minimum and maximum capacity. You can set both values or just one. At the \
         scheduled time, if the current capacity is below the minimum capacity, Application Auto \
         Scaling scales out to the minimum capacity. If the current capacity is above the maximum \
         capacity, Application Auto Scaling scales in to the maximum capacity.\n"]
  end_time : timestamp_type option;
      [@ocaml.doc "The date and time for the recurring schedule to end, in UTC.\n"]
  start_time : timestamp_type option;
      [@ocaml.doc "The date and time for this scheduled action to start, in UTC.\n"]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scheduled action. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scheduled_action_name : scheduled_action_name;
      [@ocaml.doc
        "The name of the scheduled action. This name must be unique among all other scheduled \
         actions on the specified scalable target. \n"]
  timezone : resource_id_max_len1600 option;
      [@ocaml.doc
        "Specifies the time zone used when setting a scheduled action by using an at or cron \
         expression. If a time zone is not provided, UTC is used by default.\n\n\
        \ Valid values are the canonical names of the IANA time zones supported by Joda-Time (such \
         as [Etc/GMT+9] or [Pacific/Tahiti]). For more information, see \
         {{:https://www.joda.org/joda-time/timezones.html}https://www.joda.org/joda-time/timezones.html}.\n\
        \ "]
  schedule : resource_id_max_len1600 option;
      [@ocaml.doc
        "The schedule for this action. The following formats are supported:\n\n\
        \ {ul\n\
        \       {-  At expressions - \"\n\
        \           {[\n\
        \           at({i yyyy}-{i mm}-{i dd}T{i hh}:{i mm}:{i ss})\n\
        \           ]}\n\
        \           \"\n\
        \           \n\
        \            }\n\
        \       {-  Rate expressions - \"\n\
        \           {[\n\
        \           rate({i value} {i unit})\n\
        \           ]}\n\
        \           \"\n\
        \           \n\
        \            }\n\
        \       {-  Cron expressions - \"\n\
        \           {[\n\
        \           cron({i fields})\n\
        \           ]}\n\
        \           \"\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   At expressions are useful for one-time schedules. Cron expressions are useful for \
         scheduled actions that run periodically at a specified date and time, and rate \
         expressions are useful for scheduled actions that run at a regular interval.\n\
        \   \n\
        \    At and cron expressions use Universal Coordinated Time (UTC) by default.\n\
        \    \n\
        \     The cron format consists of six fields separated by white spaces: \\[Minutes\\] \
         \\[Hours\\] \\[Day_of_Month\\] \\[Month\\] \\[Day_of_Week\\] \\[Year\\].\n\
        \     \n\
        \      For rate expressions, {i value} is a positive integer and {i unit} is [minute] | \
         [minutes] | [hour] | [hours] | [day] | [days].\n\
        \      \n\
        \       For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/scheduled-scaling-using-cron-expressions.html}Schedule \
         recurring scaling actions using cron expressions} in the {i Application Auto Scaling User \
         Guide}.\n\
        \       "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
}
[@@ocaml.doc ""]

type nonrec object_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified object could not be found. For any operation that depends on the existence of a \
   scalable target, this exception is thrown if the scalable target with the specified service \
   namespace, resource ID, and scalable dimension does not exist. For any operation that deletes \
   or deregisters a resource, this exception is thrown if the resource cannot be found.\n"]

type nonrec put_scaling_policy_response = {
  alarms : alarms option;
      [@ocaml.doc "The CloudWatch alarms created for the target tracking scaling policy.\n"]
  policy_ar_n : resource_id_max_len1600;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resulting scaling policy.\n"]
}
[@@ocaml.doc ""]

type nonrec put_scaling_policy_request = {
  predictive_scaling_policy_configuration : predictive_scaling_policy_configuration option;
      [@ocaml.doc " The configuration of the predictive scaling policy. \n"]
  target_tracking_scaling_policy_configuration :
    target_tracking_scaling_policy_configuration option;
      [@ocaml.doc
        "A target tracking scaling policy. Includes support for predefined or customized metrics.\n\n\
        \ This parameter is required if you are creating a policy and the policy type is \
         [TargetTrackingScaling].\n\
        \ "]
  step_scaling_policy_configuration : step_scaling_policy_configuration option;
      [@ocaml.doc
        "A step scaling policy.\n\n\
        \ This parameter is required if you are creating a policy and the policy type is \
         [StepScaling].\n\
        \ "]
  policy_type : policy_type option;
      [@ocaml.doc
        "The scaling policy type. This parameter is required if you are creating a scaling policy.\n\n\
        \ The following policy types are supported: \n\
        \ \n\
        \   [TargetTrackingScaling]\226\128\148Not supported for Amazon EMR.\n\
        \  \n\
        \    [StepScaling]\226\128\148Not supported for DynamoDB, Amazon Comprehend, Lambda, \
         Amazon Keyspaces, Amazon MSK, Amazon ElastiCache, or Neptune.\n\
        \   \n\
        \     [PredictiveScaling]\226\128\148Only supported for Amazon ECS.\n\
        \    \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html}Target \
         tracking scaling policies}, \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html}Step \
         scaling policies}, and \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/aas-create-predictive-scaling-policy.html}Predictive \
         scaling policies} in the {i Application Auto Scaling User Guide}.\n\
        \     "]
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scaling policy. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
  policy_name : policy_name;
      [@ocaml.doc
        "The name of the scaling policy.\n\n\
        \ You cannot change the name of a scaling policy, but you can delete the original scaling \
         policy and create a new scaling policy with the same settings and a different name.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec failed_resource_access_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Failed access to resources caused an exception. This exception is thrown when Application Auto \
   Scaling is unable to retrieve the alarms associated with a scaling policy due to a client \
   error, for example, if the role ARN specified for a scalable target does not have permission to \
   call the CloudWatch \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarms.html}DescribeAlarms} \
   on your behalf.\n"]

type nonrec predictive_scaling_forecast_values = metric_scale list [@@ocaml.doc ""]

type nonrec predictive_scaling_forecast_timestamps = timestamp_type list [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec load_forecast = {
  metric_specification : predictive_scaling_metric_specification;
      [@ocaml.doc " The metric specification for the load forecast. \n"]
  values : predictive_scaling_forecast_values; [@ocaml.doc " The values of the data points. \n"]
  timestamps : predictive_scaling_forecast_timestamps;
      [@ocaml.doc " The timestamps for the data points, in UTC format. \n"]
}
[@@ocaml.doc
  " A [GetPredictiveScalingForecast] call returns the load forecast for a predictive scaling \
   policy. This structure includes the data points for that load forecast, along with the \
   timestamps of those data points and the metric specification. \n"]

type nonrec load_forecasts = load_forecast list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_map option;
      [@ocaml.doc "A list of tags. Each tag consists of a tag key and a tag value.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "Specify the ARN of the scalable target.\n\n\
        \ For example: \
         [arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123] \n\
        \ \n\
        \  To get the ARN for a scalable target, use [DescribeScalableTargets].\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The next token supplied was invalid.\n"]

type nonrec include_not_scaled_activities = bool [@@ocaml.doc ""]

type nonrec capacity_forecast = {
  values : predictive_scaling_forecast_values; [@ocaml.doc " The values of the data points. \n"]
  timestamps : predictive_scaling_forecast_timestamps;
      [@ocaml.doc " The timestamps for the data points, in UTC format. \n"]
}
[@@ocaml.doc
  " A [GetPredictiveScalingForecast] call returns the capacity forecast for a predictive scaling \
   policy. This structure includes the data points for that capacity forecast, along with the \
   timestamps of those data points. \n"]

type nonrec get_predictive_scaling_forecast_response = {
  update_time : timestamp_type option; [@ocaml.doc " The time the forecast was made. \n"]
  capacity_forecast : capacity_forecast option; [@ocaml.doc " The capacity forecast. \n"]
  load_forecast : load_forecasts option; [@ocaml.doc " The load forecast. \n"]
}
[@@ocaml.doc ""]

type nonrec get_predictive_scaling_forecast_request = {
  end_time : timestamp_type;
      [@ocaml.doc
        " The exclusive end time of the time range for the forecast data to get. The maximum time \
         duration between the start and end time is 30 days. \n"]
  start_time : timestamp_type;
      [@ocaml.doc
        " The inclusive start time of the time range for the forecast data to get. At most, the \
         date and time can be one year before the current date and time \n"]
  policy_name : policy_name; [@ocaml.doc "The name of the policy.\n"]
  scalable_dimension : scalable_dimension; [@ocaml.doc " The scalable dimension. \n"]
  resource_id : resource_id_max_len1600; [@ocaml.doc " The identifier of the resource. \n"]
  service_namespace : service_namespace;
      [@ocaml.doc
        " The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_scheduled_actions_response = {
  next_token : xml_string option;
      [@ocaml.doc
        "The token required to get the next set of results. This value is [null] if there are no \
         more results to return.\n"]
  scheduled_actions : scheduled_actions option;
      [@ocaml.doc "Information about the scheduled actions.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scheduled_actions_request = {
  next_token : xml_string option; [@ocaml.doc "The token for the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of scheduled action results. This value can be between 1 and 50. The \
         default value is 50.\n\n\
        \ If this parameter is used, the operation returns up to [MaxResults] results at a time, \
         along with a [NextToken] value. To get the next set of results, include the [NextToken] \
         value in a subsequent call. If this parameter is not used, the operation returns up to 50 \
         results and a [NextToken] value, if applicable.\n\
        \ "]
  scalable_dimension : scalable_dimension option;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property. If you specify a scalable dimension, you must also specify a resource \
         ID.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600 option;
      [@ocaml.doc
        "The identifier of the resource associated with the scheduled action. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
  scheduled_action_names : resource_ids_max_len1600 option;
      [@ocaml.doc "The names of the scheduled actions to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scaling_policies_response = {
  next_token : xml_string option;
      [@ocaml.doc
        "The token required to get the next set of results. This value is [null] if there are no \
         more results to return.\n"]
  scaling_policies : scaling_policies option;
      [@ocaml.doc "Information about the scaling policies.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scaling_policies_request = {
  next_token : xml_string option; [@ocaml.doc "The token for the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of scalable targets. This value can be between 1 and 10. The default \
         value is 10.\n\n\
        \ If this parameter is used, the operation returns up to [MaxResults] results at a time, \
         along with a [NextToken] value. To get the next set of results, include the [NextToken] \
         value in a subsequent call. If this parameter is not used, the operation returns up to 10 \
         results and a [NextToken] value, if applicable.\n\
        \ "]
  scalable_dimension : scalable_dimension option;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property. If you specify a scalable dimension, you must also specify a resource \
         ID.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600 option;
      [@ocaml.doc
        "The identifier of the resource associated with the scaling policy. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
  policy_names : resource_ids_max_len1600 option;
      [@ocaml.doc "The names of the scaling policies to describe.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scaling_activities_response = {
  next_token : xml_string option;
      [@ocaml.doc
        "The token required to get the next set of results. This value is [null] if there are no \
         more results to return.\n"]
  scaling_activities : scaling_activities option;
      [@ocaml.doc "A list of scaling activity objects.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scaling_activities_request = {
  include_not_scaled_activities : include_not_scaled_activities option;
      [@ocaml.doc
        "Specifies whether to include activities that aren't scaled ({i not scaled activities}) in \
         the response. Not scaled activities are activities that aren't completed or started for \
         various reasons, such as preventing infinite scaling loops. For help interpreting the not \
         scaled reason details in the response, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scaling-activities.html}Scaling \
         activities for Application Auto Scaling}.\n"]
  next_token : xml_string option; [@ocaml.doc "The token for the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of scalable targets. This value can be between 1 and 50. The default \
         value is 50.\n\n\
        \ If this parameter is used, the operation returns up to [MaxResults] results at a time, \
         along with a [NextToken] value. To get the next set of results, include the [NextToken] \
         value in a subsequent call. If this parameter is not used, the operation returns up to 50 \
         results and a [NextToken] value, if applicable.\n\
        \ "]
  scalable_dimension : scalable_dimension option;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property. If you specify a scalable dimension, you must also specify a resource \
         ID.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600 option;
      [@ocaml.doc
        "The identifier of the resource associated with the scaling activity. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scalable_targets_response = {
  next_token : xml_string option;
      [@ocaml.doc
        "The token required to get the next set of results. This value is [null] if there are no \
         more results to return.\n"]
  scalable_targets : scalable_targets option;
      [@ocaml.doc "The scalable targets that match the request parameters.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scalable_targets_request = {
  next_token : xml_string option; [@ocaml.doc "The token for the next set of results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of scalable targets. This value can be between 1 and 50. The default \
         value is 50.\n\n\
        \ If this parameter is used, the operation returns up to [MaxResults] results at a time, \
         along with a [NextToken] value. To get the next set of results, include the [NextToken] \
         value in a subsequent call. If this parameter is not used, the operation returns up to 50 \
         results and a [NextToken] value, if applicable.\n\
        \ "]
  scalable_dimension : scalable_dimension option;
      [@ocaml.doc
        "The scalable dimension associated with the scalable target. This string consists of the \
         service namespace, resource type, and scaling property. If you specify a scalable \
         dimension, you must also specify a resource ID.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_ids : resource_ids_max_len1600 option;
      [@ocaml.doc
        "The identifier of the resource associated with the scalable target. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_scalable_target_response = unit [@@ocaml.doc ""]

type nonrec deregister_scalable_target_request = {
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension associated with the scalable target. This string consists of the \
         service namespace, resource type, and scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scalable target. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scheduled_action_response = unit [@@ocaml.doc ""]

type nonrec delete_scheduled_action_request = {
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scheduled action. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scheduled_action_name : resource_id_max_len1600;
      [@ocaml.doc "The name of the scheduled action.\n"]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scaling_policy_response = unit [@@ocaml.doc ""]

type nonrec delete_scaling_policy_request = {
  scalable_dimension : scalable_dimension;
      [@ocaml.doc
        "The scalable dimension. This string consists of the service namespace, resource type, and \
         scaling property.\n\n\
        \ {ul\n\
        \       {-   [ecs:service:DesiredCount] - The task count of an ECS service.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticmapreduce:instancegroup:InstanceCount] - The instance count of an EMR \
         Instance Group.\n\
        \           \n\
        \            }\n\
        \       {-   [ec2:spot-fleet-request:TargetCapacity] - The target capacity of a Spot Fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [appstream:fleet:DesiredCapacity] - The capacity of an AppStream 2.0 fleet.\n\
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
        \       {-   [sagemaker:variant:DesiredInstanceCount] - The number of EC2 instances for a \
         SageMaker model endpoint variant.\n\
        \           \n\
        \            }\n\
        \       {-   [custom-resource:ResourceType:Property] - The scalable dimension for a custom \
         resource provided by your own application or service.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:document-classifier-endpoint:DesiredInferenceUnits] - The number \
         of inference units for an Amazon Comprehend document classification endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [comprehend:entity-recognizer-endpoint:DesiredInferenceUnits] - The number of \
         inference units for an Amazon Comprehend entity recognizer endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [lambda:function:ProvisionedConcurrency] - The provisioned concurrency for a \
         Lambda function.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:ReadCapacityUnits] - The provisioned read capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [cassandra:table:WriteCapacityUnits] - The provisioned write capacity for an \
         Amazon Keyspaces table.\n\
        \           \n\
        \            }\n\
        \       {-   [kafka:broker-storage:VolumeSize] - The provisioned volume size (in GiB) for \
         brokers in an Amazon MSK cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:cache-cluster:Nodes] - The number of nodes for an Amazon \
         ElastiCache cache cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:NodeGroups] - The number of node groups for an \
         Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [elasticache:replication-group:Replicas] - The number of replicas per node \
         group for an Amazon ElastiCache replication group.\n\
        \           \n\
        \            }\n\
        \       {-   [neptune:cluster:ReadReplicaCount] - The count of read replicas in an Amazon \
         Neptune DB cluster.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:variant:DesiredProvisionedConcurrency] - The provisioned \
         concurrency for a SageMaker serverless endpoint.\n\
        \           \n\
        \            }\n\
        \       {-   [sagemaker:inference-component:DesiredCopyCount] - The number of copies \
         across an endpoint for a SageMaker inference component.\n\
        \           \n\
        \            }\n\
        \       {-   [workspaces:workspacespool:DesiredUserSessions] - The number of user sessions \
         for the WorkSpaces in the pool.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_id : resource_id_max_len1600;
      [@ocaml.doc
        "The identifier of the resource associated with the scalable target. This string consists \
         of the resource type and unique identifier.\n\n\
        \ {ul\n\
        \       {-  ECS service - The resource type is [service] and the unique identifier is the \
         cluster name and service name. Example: [service/my-cluster/my-service].\n\
        \           \n\
        \            }\n\
        \       {-  Spot Fleet - The resource type is [spot-fleet-request] and the unique \
         identifier is the Spot Fleet request ID. Example: \
         [spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  EMR cluster - The resource type is [instancegroup] and the unique identifier \
         is the cluster ID and instance group ID. Example: \
         [instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0].\n\
        \           \n\
        \            }\n\
        \       {-  AppStream 2.0 fleet - The resource type is [fleet] and the unique identifier \
         is the fleet name. Example: [fleet/sample-fleet].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB table - The resource type is [table] and the unique identifier is the \
         table name. Example: [table/my-table].\n\
        \           \n\
        \            }\n\
        \       {-  DynamoDB global secondary index - The resource type is [index] and the unique \
         identifier is the index name. Example: [table/my-table/index/my-table-index].\n\
        \           \n\
        \            }\n\
        \       {-  Aurora DB cluster - The resource type is [cluster] and the unique identifier \
         is the cluster name. Example: [cluster:my-db-cluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker endpoint variant - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  Custom resources are not supported with a resource type. This parameter must \
         specify the [OutputValue] from the CloudFormation template stack used to access the \
         resources. The unique identifier is defined by the service provider. More information is \
         available in our {{:https://github.com/aws/aws-auto-scaling-custom-resource}GitHub \
         repository}.\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend document classification endpoint - The resource type and \
         unique identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Comprehend entity recognizer endpoint - The resource type and unique \
         identifier are specified using the endpoint ARN. Example: \
         [arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE].\n\
        \           \n\
        \            }\n\
        \       {-  Lambda provisioned concurrency - The resource type is [function] and the \
         unique identifier is the function name with a function version or alias name suffix that \
         is not [$LATEST]. Example: [function:my-function:prod] or [function:my-function:1].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon Keyspaces table - The resource type is [table] and the unique \
         identifier is the table name. Example: [keyspace/mykeyspace/table/mytable].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon MSK cluster - The resource type and unique identifier are specified \
         using the cluster ARN. Example: \
         [arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache replication group - The resource type is \
         [replication-group] and the unique identifier is the replication group name. Example: \
         [replication-group/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Amazon ElastiCache cache cluster - The resource type is [cache-cluster] and \
         the unique identifier is the cache cluster name. Example: [cache-cluster/mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  Neptune cluster - The resource type is [cluster] and the unique identifier is \
         the cluster name. Example: [cluster:mycluster].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker serverless endpoint - The resource type is [variant] and the unique \
         identifier is the resource ID. Example: [endpoint/my-end-point/variant/KMeansClustering].\n\
        \           \n\
        \            }\n\
        \       {-  SageMaker inference component - The resource type is [inference-component] and \
         the unique identifier is the resource ID. Example: \
         [inference-component/my-inference-component].\n\
        \           \n\
        \            }\n\
        \       {-  Pool of WorkSpaces - The resource type is [workspacespool] and the unique \
         identifier is the pool ID. Example: [workspacespool/wspool-123456].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  service_namespace : service_namespace;
      [@ocaml.doc
        "The namespace of the Amazon Web Services service that provides the resource. For a \
         resource provided by your own application or service, use [custom-resource] instead.\n"]
  policy_name : resource_id_max_len1600; [@ocaml.doc "The name of the scaling policy.\n"]
}
[@@ocaml.doc ""]
