type nonrec volume_type = string [@@ocaml.doc ""]

type nonrec volume_size = int [@@ocaml.doc ""]

type nonrec volume_arn = string [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec volume_baseline_iop_s = int [@@ocaml.doc ""]

type nonrec volume_burst_iop_s = int [@@ocaml.doc ""]

type nonrec volume_baseline_throughput = int [@@ocaml.doc ""]

type nonrec volume_burst_throughput = int [@@ocaml.doc ""]

type nonrec root_volume = bool [@@ocaml.doc ""]

type nonrec volume_configuration = {
  root_volume : root_volume option;
      [@ocaml.doc " Contains the image used to boot the instance during launch. \n"]
  volume_burst_throughput : volume_burst_throughput option;
      [@ocaml.doc "The burst throughput of the volume.\n"]
  volume_baseline_throughput : volume_baseline_throughput option;
      [@ocaml.doc "The baseline throughput of the volume.\n"]
  volume_burst_iop_s : volume_burst_iop_s option; [@ocaml.doc "The burst IOPS of the volume.\n"]
  volume_baseline_iop_s : volume_baseline_iop_s option;
      [@ocaml.doc "The baseline IOPS of the volume.\n"]
  volume_size : volume_size option; [@ocaml.doc "The size of the volume, in GiB.\n"]
  volume_type : volume_type option;
      [@ocaml.doc
        "The volume type.\n\n\
        \ The volume types can be the following:\n\
        \ \n\
        \  {ul\n\
        \        {-  General Purpose SSD [gp2] and [gp3] \n\
        \            \n\
        \             }\n\
        \        {-  Provisioned IOPS SSD [io1], [io2], and [io2 Block Express] \n\
        \            \n\
        \             }\n\
        \        {-  Throughput Optimized HDD [st1] \n\
        \            \n\
        \             }\n\
        \        {-  Cold HDD [sc1] \n\
        \            \n\
        \             }\n\
        \        {-  Magnetic volumes [standard] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Describes the configuration of an Amazon Elastic Block Store (Amazon EBS) volume.\n"]

type nonrec ebs_finding = NOT_OPTIMIZED [@ocaml.doc ""] | OPTIMIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ebs_metric_name =
  | VOLUME_THROUGHPUT_EXCEEDED [@ocaml.doc ""]
  | VOLUME_IOPS_EXCEEDED [@ocaml.doc ""]
  | VOLUME_WRITE_BYTES_PER_SECOND [@ocaml.doc ""]
  | VOLUME_READ_BYTES_PER_SECOND [@ocaml.doc ""]
  | VOLUME_WRITE_OPS_PER_SECOND [@ocaml.doc ""]
  | VOLUME_READ_OPS_PER_SECOND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_statistic = AVERAGE [@ocaml.doc ""] | MAXIMUM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec metric_value = float [@@ocaml.doc ""]

type nonrec ebs_utilization_metric = {
  value : metric_value option; [@ocaml.doc "The value of the utilization metric.\n"]
  statistic : metric_statistic option;
      [@ocaml.doc
        "The statistic of the utilization metric.\n\n\
        \ The Compute Optimizer API, Command Line Interface (CLI), and SDKs return utilization \
         metrics using only the [Maximum] statistic, which is the highest value observed during \
         the specified period.\n\
        \ \n\
        \  The Compute Optimizer console displays graphs for some utilization metrics using the \
         [Average] statistic, which is the value of [Sum] / [SampleCount] during the specified \
         period. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html}Viewing \
         resource recommendations} in the {i Compute Optimizer User Guide}. You can also get \
         averaged utilization metric data for your resources using Amazon CloudWatch. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
         CloudWatch User Guide}.\n\
        \  "]
  name : ebs_metric_name option;
      [@ocaml.doc
        "The name of the utilization metric.\n\n\
        \ The following utilization metrics are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [VolumeReadOpsPerSecond] - The completed read operations per second from the \
         volume in a specified period of time.\n\
        \            \n\
        \             Unit: Count\n\
        \             \n\
        \              }\n\
        \        {-   [VolumeWriteOpsPerSecond] - The completed write operations per second to the \
         volume in a specified period of time.\n\
        \            \n\
        \             Unit: Count\n\
        \             \n\
        \              }\n\
        \        {-   [VolumeReadBytesPerSecond] - The bytes read per second from the volume in a \
         specified period of time.\n\
        \            \n\
        \             Unit: Bytes\n\
        \             \n\
        \              }\n\
        \        {-   [VolumeWriteBytesPerSecond] - The bytes written to the volume in a specified \
         period of time.\n\
        \            \n\
        \             Unit: Bytes\n\
        \             \n\
        \              }\n\
        \        {-   [VolumeIOPSExceeded] - Indicates whether the volume's provisioned IOPS \
         performance was exceeded in a specified period of time. A value of [1] means the \
         provisioned IOPS were exceeded; a value of [0] means they were not.\n\
        \            \n\
        \             Unit: None\n\
        \             \n\
        \              }\n\
        \        {-   [VolumeThroughputExceeded] - Indicates whether the volume's provisioned \
         throughput performance was exceeded in a specified period of time. A value of [1] means \
         the provisioned throughput was exceeded; a value of [0] means it was not.\n\
        \            \n\
        \             Unit: None\n\
        \             \n\
        \              }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Describes a utilization metric of an Amazon Elastic Block Store (Amazon EBS) volume.\n\n\
  \ Compare the utilization metric data of your resource against its projected utilization metric \
   data to determine the performance difference between your current resource and the recommended \
   option.\n\
  \ "]

type nonrec ebs_utilization_metrics = ebs_utilization_metric list [@@ocaml.doc ""]

type nonrec look_back_period_in_days = float [@@ocaml.doc ""]

type nonrec performance_risk = float [@@ocaml.doc ""]

type nonrec rank = int [@@ocaml.doc ""]

type nonrec savings_opportunity_percentage = float [@@ocaml.doc ""]

type nonrec currency = CNY [@ocaml.doc ""] | USD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec value = float [@@ocaml.doc ""]

type nonrec estimated_monthly_savings = {
  value : value option; [@ocaml.doc "The value of the estimated monthly savings.\n"]
  currency : currency option; [@ocaml.doc "The currency of the estimated monthly savings.\n"]
}
[@@ocaml.doc
  "Describes the estimated monthly savings amount possible, based on On-Demand instance pricing, \
   by adopting Compute Optimizer recommendations for a given resource.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/view-ec2-recommendations.html#ec2-savings-calculation}Estimated \
   monthly savings and savings opportunities} in the {i Compute Optimizer User Guide}.\n\
  \ "]

type nonrec savings_opportunity = {
  estimated_monthly_savings : estimated_monthly_savings option;
      [@ocaml.doc
        "An object that describes the estimated monthly savings amount possible by adopting \
         Compute Optimizer recommendations for a given resource. This is based on the On-Demand \
         instance pricing..\n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        "The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer recommendations for a given resource.\n"]
}
[@@ocaml.doc
  "Describes the savings opportunity for recommendations of a given resource type or for the \
   recommendation option of an individual resource.\n\n\
  \ Savings opportunity represents the estimated monthly savings you can achieve by implementing a \
   given Compute Optimizer recommendation.\n\
  \ \n\
  \   Savings opportunity data requires that you opt in to Cost Explorer, as well as activate {b \
   Receive Amazon EC2 resource recommendations} in the Cost Explorer preferences page. That \
   creates a connection between Cost Explorer and Compute Optimizer. With this connection, Cost \
   Explorer generates savings estimates considering the price of existing resources, the price of \
   recommended resources, and historical usage data. Estimated monthly savings reflects the \
   projected dollar savings associated with each of the recommendations generated. For more \
   information, see \
   {{:https://docs.aws.amazon.com/cost-management/latest/userguide/ce-enable.html}Enabling Cost \
   Explorer} and \
   {{:https://docs.aws.amazon.com/cost-management/latest/userguide/ce-rightsizing.html}Optimizing \
   your cost with Rightsizing Recommendations} in the {i Cost Management User Guide}.\n\
  \   \n\
  \    "]

type nonrec ebs_estimated_monthly_savings = {
  value : value option; [@ocaml.doc " The value of the estimated monthly savings. \n"]
  currency : currency option; [@ocaml.doc " The currency of the estimated monthly savings. \n"]
}
[@@ocaml.doc
  " An object that describes the estimated monthly savings possible by adopting Compute \
   Optimizer\226\128\153s Amazon EBS volume recommendations. This includes any applicable \
   discounts. \n"]

type nonrec ebs_savings_opportunity_after_discounts = {
  estimated_monthly_savings : ebs_estimated_monthly_savings option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer\226\128\153s Amazon EBS volume recommendations. This saving includes \
         any applicable discounts. \n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost after applying \
         the specific discounts. This saving can be achieved by adopting Compute \
         Optimizer\226\128\153s Amazon EBS volume recommendations. \n"]
}
[@@ocaml.doc
  " Describes the savings opportunity for Amazon EBS volume recommendations after applying \
   specific discounts. \n"]

type nonrec volume_recommendation_option = {
  savings_opportunity_after_discounts : ebs_savings_opportunity_after_discounts option;
      [@ocaml.doc
        " An object that describes the savings opportunity for the Amazon EBS volume \
         recommendation option with specific discounts. Savings opportunity includes the estimated \
         monthly savings and percentage. \n"]
  savings_opportunity : savings_opportunity option;
      [@ocaml.doc
        "An object that describes the savings opportunity for the EBS volume recommendation \
         option. Savings opportunity includes the estimated monthly savings amount and percentage.\n"]
  rank : rank option;
      [@ocaml.doc
        "The rank of the volume recommendation option.\n\n\
        \ The top recommendation option is ranked as [1].\n\
        \ "]
  performance_risk : performance_risk option;
      [@ocaml.doc
        "The performance risk of the volume recommendation option.\n\n\
        \ Performance risk is the likelihood of the recommended volume type meeting the \
         performance requirement of your workload.\n\
        \ \n\
        \  The value ranges from [0] - [4], with [0] meaning that the recommended resource is \
         predicted to always provide enough hardware capability. The higher the performance risk \
         is, the more likely you should validate whether the recommendation will meet the \
         performance requirements of your workload before migrating your resource.\n\
        \  "]
  configuration : volume_configuration option;
      [@ocaml.doc "An array of objects that describe a volume configuration.\n"]
}
[@@ocaml.doc
  "Describes a recommendation option for an Amazon Elastic Block Store (Amazon EBS) instance.\n"]

type nonrec volume_recommendation_options = volume_recommendation_option list [@@ocaml.doc ""]

type nonrec last_refresh_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec current_performance_risk =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | VERY_LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ebs_savings_estimation_mode_source =
  | COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | COST_EXPLORER_RIGHTSIZING [@ocaml.doc ""]
  | PUBLIC_PRICING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ebs_savings_estimation_mode = {
  source : ebs_savings_estimation_mode_source option;
      [@ocaml.doc
        " Describes the source for calculating the savings opportunity for Amazon EBS volumes. \n"]
}
[@@ocaml.doc
  " Describes the savings estimation mode used for calculating savings opportunity for Amazon EBS \
   volumes. \n"]

type nonrec look_back_period_preference =
  | DAYS_93 [@ocaml.doc ""]
  | DAYS_32 [@ocaml.doc ""]
  | DAYS_14 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ebs_effective_recommendation_preferences = {
  look_back_period : look_back_period_preference option;
      [@ocaml.doc
        "The number of days for which utilization metrics were analyzed for the volume.\n"]
  savings_estimation_mode : ebs_savings_estimation_mode option;
      [@ocaml.doc
        " Describes the savings estimation mode preference applied for calculating savings \
         opportunity for Amazon EBS volumes. \n"]
}
[@@ocaml.doc " Describes the effective recommendation preferences for Amazon EBS volumes. \n"]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option;
      [@ocaml.doc
        " One part of a key-value pair that make up a tag. A value acts as a descriptor within a \
         tag category (key). The value can be empty or null. \n"]
  key : tag_key option;
      [@ocaml.doc
        " One part of a key-value pair that makes up a tag. A key is a general label that acts \
         like a category for more specific tag values. \n"]
}
[@@ocaml.doc " A list of tag key and value pairs that you define. \n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec volume_recommendation = {
  tags : tags option;
      [@ocaml.doc " A list of tags assigned to your Amazon EBS volume recommendations. \n"]
  effective_recommendation_preferences : ebs_effective_recommendation_preferences option;
      [@ocaml.doc " Describes the effective recommendation preferences for Amazon EBS volume. \n"]
  current_performance_risk : current_performance_risk option;
      [@ocaml.doc
        "The risk of the current EBS volume not meeting the performance needs of its workloads. \
         The higher the risk, the more likely the current EBS volume doesn't have sufficient \
         capacity.\n"]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc "The timestamp of when the volume recommendation was last generated.\n"]
  volume_recommendation_options : volume_recommendation_options option;
      [@ocaml.doc "An array of objects that describe the recommendation options for the volume.\n"]
  look_back_period_in_days : look_back_period_in_days option;
      [@ocaml.doc
        "The number of days for which utilization metrics were analyzed for the volume.\n"]
  utilization_metrics : ebs_utilization_metrics option;
      [@ocaml.doc "An array of objects that describe the utilization metrics of the volume.\n"]
  finding : ebs_finding option;
      [@ocaml.doc
        "The finding classification of the volume.\n\n\
        \ Findings for volumes include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [NotOptimized] }\226\128\148A volume is considered not optimized when \
         Compute Optimizer identifies a recommendation that can provide better performance for \
         your workload.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [Optimized] }\226\128\148An volume is considered optimized when Compute \
         Optimizer determines that the volume is correctly provisioned to run your workload based \
         on the chosen volume type. For optimized resources, Compute Optimizer might recommend a \
         new generation volume type.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  current_configuration : volume_configuration option;
      [@ocaml.doc "An array of objects that describe the current configuration of the volume.\n"]
  account_id : account_id option; [@ocaml.doc "The Amazon Web Services account ID of the volume.\n"]
  volume_arn : volume_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the current volume.\n"]
}
[@@ocaml.doc "Describes an Amazon Elastic Block Store (Amazon EBS) volume recommendation.\n"]

type nonrec volume_recommendations = volume_recommendation list [@@ocaml.doc ""]

type nonrec volume_arns = volume_arn list [@@ocaml.doc ""]

type nonrec very_low = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec customizable_metric_name =
  | MEMORY_UTILIZATION [@ocaml.doc ""]
  | CPU_UTILIZATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec customizable_metric_threshold =
  | P99_5 [@ocaml.doc ""]
  | P95 [@ocaml.doc ""]
  | P90 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec customizable_metric_headroom =
  | PERCENT_0 [@ocaml.doc ""]
  | PERCENT_10 [@ocaml.doc ""]
  | PERCENT_20 [@ocaml.doc ""]
  | PERCENT_30 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec customizable_metric_parameters = {
  headroom : customizable_metric_headroom option;
      [@ocaml.doc
        " The headroom value in percentage used for the specified metric parameter. \n\n\
        \ The following lists the valid values for CPU and memory utilization.\n\
        \ \n\
        \  {ul\n\
        \        {-  CPU utilization: [PERCENT_30 | PERCENT_20 | PERCENT_0] \n\
        \            \n\
        \             }\n\
        \        {-  Memory utilization: [PERCENT_30 | PERCENT_20 | PERCENT_10] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  threshold : customizable_metric_threshold option;
      [@ocaml.doc
        " The threshold value used for the specified metric parameter. \n\n\
        \  You can only specify the threshold value for CPU utilization.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  " Defines the various metric parameters that can be customized, such as threshold and headroom. \n"]

type nonrec utilization_preference = {
  metric_parameters : customizable_metric_parameters option;
      [@ocaml.doc " The parameters to set when customizing the resource utilization thresholds. \n"]
  metric_name : customizable_metric_name option;
      [@ocaml.doc " The name of the resource utilization metric name to customize. \n"]
}
[@@ocaml.doc
  " The preference to control the resource\226\128\153s CPU utilization threshold, CPU utilization \
   headroom, and memory utilization headroom. \n\n\
  \  This preference is only available for the Amazon EC2 instance resource type.\n\
  \  \n\
  \   "]

type nonrec utilization_preferences = utilization_preference list [@@ocaml.doc ""]

type nonrec metric_name =
  | GPU_MEMORY_PERCENTAGE [@ocaml.doc ""]
  | GPU_PERCENTAGE [@ocaml.doc ""]
  | NETWORK_PACKETS_OUT_PER_SECOND [@ocaml.doc ""]
  | NETWORK_PACKETS_IN_PER_SECOND [@ocaml.doc ""]
  | NETWORK_OUT_BYTES_PER_SECOND [@ocaml.doc ""]
  | NETWORK_IN_BYTES_PER_SECOND [@ocaml.doc ""]
  | DISK_WRITE_BYTES_PER_SECOND [@ocaml.doc ""]
  | DISK_READ_BYTES_PER_SECOND [@ocaml.doc ""]
  | DISK_WRITE_OPS_PER_SECOND [@ocaml.doc ""]
  | DISK_READ_OPS_PER_SECOND [@ocaml.doc ""]
  | EBS_WRITE_BYTES_PER_SECOND [@ocaml.doc ""]
  | EBS_READ_BYTES_PER_SECOND [@ocaml.doc ""]
  | EBS_WRITE_OPS_PER_SECOND [@ocaml.doc ""]
  | EBS_READ_OPS_PER_SECOND [@ocaml.doc ""]
  | MEMORY [@ocaml.doc ""]
  | CPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec utilization_metric = {
  value : metric_value option; [@ocaml.doc "The value of the utilization metric.\n"]
  statistic : metric_statistic option;
      [@ocaml.doc
        "The statistic of the utilization metric.\n\n\
        \ The Compute Optimizer API, Command Line Interface (CLI), and SDKs return utilization \
         metrics using only the [Maximum] statistic, which is the highest value observed during \
         the specified period.\n\
        \ \n\
        \  The Compute Optimizer console displays graphs for some utilization metrics using the \
         [Average] statistic, which is the value of [Sum] / [SampleCount] during the specified \
         period. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html}Viewing \
         resource recommendations} in the {i Compute Optimizer User Guide}. You can also get \
         averaged utilization metric data for your resources using Amazon CloudWatch. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
         CloudWatch User Guide}.\n\
        \  "]
  name : metric_name option;
      [@ocaml.doc
        "The name of the utilization metric.\n\n\
        \ The following utilization metrics are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Cpu] - The percentage of allocated EC2 compute units that are currently in \
         use on the instance. This metric identifies the processing power required to run an \
         application on the instance.\n\
        \            \n\
        \             Depending on the instance type, tools in your operating system can show a \
         lower percentage than CloudWatch when the instance is not allocated a full processor core.\n\
        \             \n\
        \              Units: Percent\n\
        \              \n\
        \               }\n\
        \        {-   [Memory] - The percentage of memory that is currently in use on the \
         instance. This metric identifies the amount of memory required to run an application on \
         the instance.\n\
        \            \n\
        \             Units: Percent\n\
        \             \n\
        \               The [Memory] metric is returned only for resources that have the unified \
         CloudWatch agent installed on them. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
         Memory Utilization with the CloudWatch Agent}.\n\
        \               \n\
        \                 }\n\
        \        {-   [GPU] - The percentage of allocated GPUs that currently run on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [GPU_MEMORY] - The percentage of total GPU memory that currently runs on the \
         instance.\n\
        \            \n\
        \              The [GPU] and [GPU_MEMORY] metrics are only returned for resources with the \
         unified CloudWatch Agent installed on them. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#nvidia-cw-agent}Enabling \
         NVIDIA GPU utilization with the CloudWatch Agent}.\n\
        \              \n\
        \                }\n\
        \        {-   [EBS_READ_OPS_PER_SECOND] - The completed read operations from all EBS \
         volumes attached to the instance in a specified period of time.\n\
        \            \n\
        \             Unit: Count\n\
        \             \n\
        \              }\n\
        \        {-   [EBS_WRITE_OPS_PER_SECOND] - The completed write operations to all EBS \
         volumes attached to the instance in a specified period of time.\n\
        \            \n\
        \             Unit: Count\n\
        \             \n\
        \              }\n\
        \        {-   [EBS_READ_BYTES_PER_SECOND] - The bytes read from all EBS volumes attached \
         to the instance in a specified period of time.\n\
        \            \n\
        \             Unit: Bytes\n\
        \             \n\
        \              }\n\
        \        {-   [EBS_WRITE_BYTES_PER_SECOND] - The bytes written to all EBS volumes attached \
         to the instance in a specified period of time.\n\
        \            \n\
        \             Unit: Bytes\n\
        \             \n\
        \              }\n\
        \        {-   [DISK_READ_OPS_PER_SECOND] - The completed read operations from all instance \
         store volumes available to the instance in a specified period of time.\n\
        \            \n\
        \             If there are no instance store volumes, either the value is [0] or the \
         metric is not reported.\n\
        \             \n\
        \              }\n\
        \        {-   [DISK_WRITE_OPS_PER_SECOND] - The completed write operations from all \
         instance store volumes available to the instance in a specified period of time.\n\
        \            \n\
        \             If there are no instance store volumes, either the value is [0] or the \
         metric is not reported.\n\
        \             \n\
        \              }\n\
        \        {-   [DISK_READ_BYTES_PER_SECOND] - The bytes read from all instance store \
         volumes available to the instance. This metric is used to determine the volume of the \
         data the application reads from the disk of the instance. This can be used to determine \
         the speed of the application.\n\
        \            \n\
        \             If there are no instance store volumes, either the value is [0] or the \
         metric is not reported.\n\
        \             \n\
        \              }\n\
        \        {-   [DISK_WRITE_BYTES_PER_SECOND] - The bytes written to all instance store \
         volumes available to the instance. This metric is used to determine the volume of the \
         data the application writes onto the disk of the instance. This can be used to determine \
         the speed of the application.\n\
        \            \n\
        \             If there are no instance store volumes, either the value is [0] or the \
         metric is not reported.\n\
        \             \n\
        \              }\n\
        \        {-   [NETWORK_IN_BYTES_PER_SECOND] - The number of bytes received by the instance \
         on all network interfaces. This metric identifies the volume of incoming network traffic \
         to a single instance.\n\
        \            \n\
        \             }\n\
        \        {-   [NETWORK_OUT_BYTES_PER_SECOND] - The number of bytes sent out by the \
         instance on all network interfaces. This metric identifies the volume of outgoing network \
         traffic from a single instance.\n\
        \            \n\
        \             }\n\
        \        {-   [NETWORK_PACKETS_IN_PER_SECOND] - The number of packets received by the \
         instance on all network interfaces. This metric identifies the volume of incoming traffic \
         in terms of the number of packets on a single instance.\n\
        \            \n\
        \             }\n\
        \        {-   [NETWORK_PACKETS_OUT_PER_SECOND] - The number of packets sent out by the \
         instance on all network interfaces. This metric identifies the volume of outgoing traffic \
         in terms of the number of packets on a single instance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Describes a utilization metric of a resource, such as an Amazon EC2 instance.\n\n\
  \ Compare the utilization metric data of your resource against its projected utilization metric \
   data to determine the performance difference between your current resource and the recommended \
   option.\n\
  \ "]

type nonrec utilization_metrics = utilization_metric list [@@ocaml.doc ""]

type nonrec upper_bound_value = float [@@ocaml.doc ""]

type nonrec status =
  | FAILED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec status_reason = string [@@ocaml.doc ""]

type nonrec update_enrollment_status_response = {
  status_reason : status_reason option;
      [@ocaml.doc
        "The reason for the enrollment status of the account. For example, an account might show a \
         status of [Pending] because member accounts of an organization require more time to be \
         enrolled in the service.\n"]
  status : status option; [@ocaml.doc "The enrollment status of the account.\n"]
}
[@@ocaml.doc ""]

type nonrec include_member_accounts = bool [@@ocaml.doc ""]

type nonrec update_enrollment_status_request = {
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "Indicates whether to enroll member accounts of the organization if the account is the \
         management account of an organization.\n"]
  status : status;
      [@ocaml.doc
        "The new enrollment status of the account.\n\n\
        \ The following status options are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Active] - Opts in your account to the Compute Optimizer service. Compute \
         Optimizer begins analyzing the configuration and utilization metrics of your Amazon Web \
         Services resources after you opt in. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html}Metrics analyzed \
         by Compute Optimizer} in the {i Compute Optimizer User Guide}.\n\
        \            \n\
        \             }\n\
        \        {-   [Inactive] - Opts out your account from the Compute Optimizer service. Your \
         account's recommendations and related metrics data will be deleted from Compute Optimizer \
         after you opt out.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    The [Pending] and [Failed] options cannot be used to update the enrollment status of \
         an account. They are returned in the response of a request to update the enrollment \
         status of an account.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec throttling_exception = { message : error_message [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec service_unavailable_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request has failed due to a temporary failure of the server.\n"]

type nonrec missing_authentication_token = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request must contain either a valid (registered) Amazon Web Services access key ID or X.509 \
   certificate.\n"]

type nonrec invalid_parameter_value_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The value supplied for the input parameter is out of range or not valid.\n"]

type nonrec internal_server_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An internal error has occurred. Try your call again.\n"]

type nonrec access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec timestamps = timestamp list [@@ocaml.doc ""]

type nonrec task_definition_arn = string [@@ocaml.doc ""]

type nonrec summary_value = float [@@ocaml.doc ""]

type nonrec finding =
  | NOT_OPTIMIZED [@ocaml.doc ""]
  | OPTIMIZED [@ocaml.doc ""]
  | OVER_PROVISIONED [@ocaml.doc ""]
  | UNDER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec finding_reason_code =
  | MEMORY_UNDER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_OVER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reason_code_summary = {
  value : summary_value option; [@ocaml.doc "The value of the finding reason code summary.\n"]
  name : finding_reason_code option; [@ocaml.doc "The name of the finding reason code.\n"]
}
[@@ocaml.doc "A summary of a finding reason code.\n"]

type nonrec reason_code_summaries = reason_code_summary list [@@ocaml.doc ""]

type nonrec summary = {
  reason_code_summaries : reason_code_summaries option;
      [@ocaml.doc "An array of objects that summarize a finding reason code.\n"]
  value : summary_value option; [@ocaml.doc "The value of the recommendation summary.\n"]
  name : finding option; [@ocaml.doc "The finding classification of the recommendation.\n"]
}
[@@ocaml.doc "The summary of a recommendation.\n"]

type nonrec summaries = summary list [@@ocaml.doc ""]

type nonrec storage_type = string [@@ocaml.doc ""]

type nonrec nullable_memory = int [@@ocaml.doc ""]

type nonrec nullable_cpu = int [@@ocaml.doc ""]

type nonrec container_name = string [@@ocaml.doc ""]

type nonrec nullable_memory_reservation = int [@@ocaml.doc ""]

type nonrec memory_size_configuration = {
  memory_reservation : nullable_memory_reservation option;
      [@ocaml.doc " The limit of memory reserve for the container. \n"]
  memory : nullable_memory option; [@ocaml.doc " The amount of memory in the container. \n"]
}
[@@ocaml.doc " The memory size configurations of a container. \n"]

type nonrec container_configuration = {
  cpu : nullable_cpu option; [@ocaml.doc " The number of CPU units reserved for the container. \n"]
  memory_size_configuration : memory_size_configuration option;
      [@ocaml.doc " The memory size configurations for the container. \n"]
  container_name : container_name option; [@ocaml.doc " The name of the container. \n"]
}
[@@ocaml.doc
  " Describes the container configurations within the tasks of your Amazon ECS service. \n"]

type nonrec container_configurations = container_configuration list [@@ocaml.doc ""]

type nonrec auto_scaling_configuration =
  | TARGET_TRACKING_SCALING_MEMORY [@ocaml.doc ""]
  | TARGET_TRACKING_SCALING_CPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec service_configuration = {
  task_definition_arn : task_definition_arn option;
      [@ocaml.doc " The task definition ARN used by the tasks in the Amazon ECS service. \n"]
  auto_scaling_configuration : auto_scaling_configuration option;
      [@ocaml.doc
        " Describes the Auto Scaling configuration methods for an Amazon ECS service. This affects \
         the generated recommendations. For example, if Auto Scaling is configured on a \
         service\226\128\153s CPU, then Compute Optimizer doesn\226\128\153t generate CPU size \
         recommendations. \n\n\
        \ The Auto Scaling configuration methods include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [TARGET_TRACKING_SCALING_CPU] \226\128\148 If the Amazon ECS service is \
         configured to use target scaling on CPU, Compute Optimizer doesn't generate CPU \
         recommendations.\n\
        \            \n\
        \             }\n\
        \        {-   [TARGET_TRACKING_SCALING_MEMORY] \226\128\148 If the Amazon ECS service is \
         configured to use target scaling on memory, Compute Optimizer doesn't generate memory \
         recommendations.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about step scaling and target scaling, see \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html} \
         Step scaling policies for Application Auto Scaling} and \
         {{:https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html} \
         Target tracking scaling policies for Application Auto Scaling} in the {i Application Auto \
         Scaling User Guide}.\n\
        \   "]
  container_configurations : container_configurations option;
      [@ocaml.doc " The container configurations within a task of an Amazon ECS service. \n"]
  cpu : nullable_cpu option;
      [@ocaml.doc " The number of CPU units used by the tasks in the Amazon ECS service. \n"]
  memory : nullable_memory option;
      [@ocaml.doc " The amount of memory used by the tasks in the Amazon ECS service. \n"]
}
[@@ocaml.doc " The Amazon ECS service configurations used for recommendations. \n"]

type nonrec service_arn = string [@@ocaml.doc ""]

type nonrec service_arns = service_arn list [@@ocaml.doc ""]

type nonrec scope_value = string [@@ocaml.doc ""]

type nonrec scope_name =
  | RESOURCE_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
  | ORGANIZATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scope = {
  value : scope_value option;
      [@ocaml.doc
        "The value of the scope.\n\n\
        \ If you specified the [name] of the scope as:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Organization] - The [value] must be [ALL_ACCOUNTS].\n\
        \            \n\
        \             }\n\
        \        {-   [AccountId] - The [value] must be a 12-digit Amazon Web Services account ID.\n\
        \            \n\
        \             }\n\
        \        {-   [ResourceArn] - The [value] must be the Amazon Resource Name (ARN) of an EC2 \
         instance or an Auto Scaling group.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Only EC2 instance and Auto Scaling group ARNs are currently supported.\n\
        \   "]
  name : scope_name option;
      [@ocaml.doc
        "The name of the scope.\n\n\
        \ The following scopes are possible:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Organization] - Specifies that the recommendation preference applies at the \
         organization level, for all member accounts of an organization.\n\
        \            \n\
        \             }\n\
        \        {-   [AccountId] - Specifies that the recommendation preference applies at the \
         account level, for all resources of a given resource type in an account.\n\
        \            \n\
        \             }\n\
        \        {-   [ResourceArn] - Specifies that the recommendation preference applies at the \
         individual resource level.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Describes the scope of a recommendation preference.\n\n\
  \ Recommendation preferences can be created at the organization level (for management accounts \
   of an organization only), account level, and resource level. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
   enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
  \ \n\
  \   You cannot create recommendation preferences for Auto Scaling groups at the organization and \
   account levels. You can create recommendation preferences for Auto Scaling groups only at the \
   resource level by specifying a scope name of [ResourceArn] and a scope value of the Auto \
   Scaling group Amazon Resource Name (ARN). This will configure the preference for all instances \
   that are part of the specified Auto Scaling group. You also cannot create recommendation \
   preferences at the resource level for instances that are part of an Auto Scaling group. You can \
   create recommendation preferences at the resource level only for standalone instances.\n\
  \   \n\
  \    "]

type nonrec savings_estimation_mode =
  | BEFORE_DISCOUNTS [@ocaml.doc ""]
  | AFTER_DISCOUNTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec destination_bucket = string [@@ocaml.doc ""]

type nonrec destination_key_prefix = string [@@ocaml.doc ""]

type nonrec s3_destination_config = {
  key_prefix : destination_key_prefix option;
      [@ocaml.doc "The Amazon S3 bucket prefix for an export job.\n"]
  bucket : destination_bucket option;
      [@ocaml.doc "The name of the Amazon S3 bucket to use as the destination for an export job.\n"]
}
[@@ocaml.doc
  "Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and key prefix \
   for a recommendations export job.\n\n\
  \ You must create the destination Amazon S3 bucket for your recommendations export before you \
   create the export job. Compute Optimizer does not create the S3 bucket for you. After you \
   create the S3 bucket, ensure that it has the required permission policy to allow Compute \
   Optimizer to write the export file to it. If you plan to specify an object prefix when you \
   create the export job, you must include the object prefix in the policy that you add to the S3 \
   bucket. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html}Amazon \
   S3 Bucket Policy for Compute Optimizer} in the {i Compute Optimizer User Guide}.\n\
  \ "]

type nonrec destination_key = string [@@ocaml.doc ""]

type nonrec metadata_key = string [@@ocaml.doc ""]

type nonrec s3_destination = {
  metadata_key : metadata_key option;
      [@ocaml.doc
        "The Amazon S3 bucket key of a metadata file.\n\n\
        \ The key uniquely identifies the object, or metadata file, in the S3 bucket.\n\
        \ "]
  key : destination_key option;
      [@ocaml.doc
        "The Amazon S3 bucket key of an export file.\n\n\
        \ The key uniquely identifies the object, or export file, in the S3 bucket.\n\
        \ "]
  bucket : destination_bucket option;
      [@ocaml.doc "The name of the Amazon S3 bucket used as the destination of an export file.\n"]
}
[@@ocaml.doc
  "Describes the destination Amazon Simple Storage Service (Amazon S3) bucket name and object keys \
   of a recommendations export file, and its associated metadata file.\n"]

type nonrec resource_type =
  | IDLE [@ocaml.doc ""]
  | AURORA_DB_CLUSTER_STORAGE [@ocaml.doc ""]
  | RDS_DB_INSTANCE [@ocaml.doc ""]
  | LICENSE [@ocaml.doc ""]
  | ECS_SERVICE [@ocaml.doc ""]
  | NOT_APPLICABLE [@ocaml.doc ""]
  | LAMBDA_FUNCTION [@ocaml.doc ""]
  | EBS_VOLUME [@ocaml.doc ""]
  | AUTO_SCALING_GROUP [@ocaml.doc ""]
  | EC2_INSTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A resource that is required for the action doesn't exist.\n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec resource_arns = resource_arn list [@@ocaml.doc ""]

type nonrec recommended_instance_type = string [@@ocaml.doc ""]

type nonrec metric_values = metric_value list [@@ocaml.doc ""]

type nonrec projected_metric = {
  values : metric_values option; [@ocaml.doc "The values of the projected utilization metrics.\n"]
  timestamps : timestamps option;
      [@ocaml.doc "The timestamps of the projected utilization metric.\n"]
  name : metric_name option;
      [@ocaml.doc
        "The name of the projected utilization metric.\n\n\
        \ The following projected utilization metrics are returned:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Cpu] - The projected percentage of allocated EC2 compute units that would \
         be in use on the recommendation option had you used that resource during the analyzed \
         period. This metric identifies the processing power required to run an application on the \
         recommendation option.\n\
        \            \n\
        \             Depending on the instance type, tools in your operating system can show a \
         lower percentage than CloudWatch when the instance is not allocated a full processor core.\n\
        \             \n\
        \              }\n\
        \        {-   [Memory] - The percentage of memory that would be in use on the \
         recommendation option had you used that resource during the analyzed period. This metric \
         identifies the amount of memory required to run an application on the recommendation \
         option.\n\
        \            \n\
        \             Units: Percent\n\
        \             \n\
        \               The [Memory] metric is only returned for resources with the unified \
         CloudWatch agent installed on them. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
         Memory Utilization with the CloudWatch Agent}.\n\
        \               \n\
        \                 }\n\
        \        {-   [GPU] - The projected percentage of allocated GPUs if you adjust your \
         configurations to Compute Optimizer's recommendation option.\n\
        \            \n\
        \             }\n\
        \        {-   [GPU_MEMORY] - The projected percentage of total GPU memory if you adjust \
         your configurations to Compute Optimizer's recommendation option.\n\
        \            \n\
        \              The [GPU] and [GPU_MEMORY] metrics are only returned for resources with the \
         unified CloudWatch Agent installed on them. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#nvidia-cw-agent}Enabling \
         NVIDIA GPU utilization with the CloudWatch Agent}.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Describes a projected utilization metric of a recommendation option, such as an Amazon EC2 \
   instance. This represents the projected utilization of a recommendation option had you used \
   that resource during the analyzed period.\n\n\
  \ Compare the utilization metric data of your resource against its projected utilization metric \
   data to determine the performance difference between your current resource and the recommended \
   option.\n\
  \ \n\
  \   The [Cpu], [Memory], [GPU], and [GPU_MEMORY] metrics are the only projected utilization \
   metrics returned when you run the [GetEC2RecommendationProjectedMetrics] action. Additionally, \
   these metrics are only returned for resources with the unified CloudWatch agent installed on \
   them. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
   Memory Utilization with the CloudWatch Agent} and \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#nvidia-cw-agent}Enabling \
   NVIDIA GPU utilization with the CloudWatch Agent}.\n\
  \   \n\
  \    "]

type nonrec projected_metrics = projected_metric list [@@ocaml.doc ""]

type nonrec recommended_option_projected_metric = {
  projected_metrics : projected_metrics option;
      [@ocaml.doc "An array of objects that describe a projected utilization metric.\n"]
  rank : rank option;
      [@ocaml.doc
        "The rank of the recommendation option projected metric.\n\n\
        \ The top recommendation option is ranked as [1].\n\
        \ \n\
        \  The projected metric rank correlates to the recommendation option rank. For example, \
         the projected metric ranked as [1] is related to the recommendation option that is also \
         ranked as [1] in the same response.\n\
        \  "]
  recommended_instance_type : recommended_instance_type option;
      [@ocaml.doc "The recommended instance type.\n"]
}
[@@ocaml.doc
  "Describes a projected utilization metric of a recommendation option.\n\n\
  \  The [Cpu] and [Memory] metrics are the only projected utilization metrics returned when you \
   run the [GetEC2RecommendationProjectedMetrics] action. Additionally, the [Memory] metric is \
   returned only for resources that have the unified CloudWatch agent installed on them. For more \
   information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
   Memory Utilization with the CloudWatch Agent}.\n\
  \  \n\
  \   "]

type nonrec recommended_option_projected_metrics = recommended_option_projected_metric list
[@@ocaml.doc ""]

type nonrec recommended_db_instance_class = string [@@ocaml.doc ""]

type nonrec idle_finding =
  | UNUSED [@ocaml.doc ""]
  | UNATTACHED [@ocaml.doc ""]
  | IDLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec idle_summary = {
  value : summary_value option; [@ocaml.doc "The count of idle resources in the finding group.\n"]
  name : idle_finding option; [@ocaml.doc "The name of the finding group for the idle resources.\n"]
}
[@@ocaml.doc "Describes the findings summary of the idle resources.\n"]

type nonrec idle_summaries = idle_summary list [@@ocaml.doc ""]

type nonrec recommendation_source_type =
  | SAGE_MAKER_ENDPOINT [@ocaml.doc ""]
  | WORKSPACES [@ocaml.doc ""]
  | DOCUMENT_DB_CLUSTER [@ocaml.doc ""]
  | MEMORY_DB_CLUSTER [@ocaml.doc ""]
  | ELASTI_CACHE_CLUSTER [@ocaml.doc ""]
  | DYNAMO_DB_TABLE [@ocaml.doc ""]
  | NAT_GATEWAY [@ocaml.doc ""]
  | AURORA_DB_CLUSTER_STORAGE [@ocaml.doc ""]
  | RDS_DB_INSTANCE_STORAGE [@ocaml.doc ""]
  | RDS_DB_INSTANCE [@ocaml.doc ""]
  | LICENSE [@ocaml.doc ""]
  | ECS_SERVICE [@ocaml.doc ""]
  | LAMBDA_FUNCTION [@ocaml.doc ""]
  | EBS_VOLUME [@ocaml.doc ""]
  | AUTO_SCALING_GROUP [@ocaml.doc ""]
  | EC2_INSTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec high = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec medium = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec low = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec current_performance_risk_ratings = {
  very_low : very_low option;
      [@ocaml.doc
        "A count of the applicable resource types with a very low performance risk rating.\n"]
  low : low option;
      [@ocaml.doc "A count of the applicable resource types with a low performance risk rating.\n"]
  medium : medium option;
      [@ocaml.doc
        "A count of the applicable resource types with a medium performance risk rating.\n"]
  high : high option;
      [@ocaml.doc "A count of the applicable resource types with a high performance risk rating.\n"]
}
[@@ocaml.doc
  "Describes the performance risk ratings for a given resource type.\n\n\
  \ Resources with a [high] or [medium] rating are at risk of not meeting the performance needs of \
   their workloads, while resources with a [low] rating are performing well in their workloads.\n\
  \ "]

type nonrec inferred_workload_type =
  | SQLSERVER [@ocaml.doc ""]
  | KAFKA [@ocaml.doc ""]
  | REDIS [@ocaml.doc ""]
  | POSTGRE_SQL [@ocaml.doc ""]
  | NGINX [@ocaml.doc ""]
  | MEMCACHED [@ocaml.doc ""]
  | APACHE_HADOOP [@ocaml.doc ""]
  | APACHE_CASSANDRA [@ocaml.doc ""]
  | AMAZON_EMR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inferred_workload_types = inferred_workload_type list [@@ocaml.doc ""]

type nonrec inferred_workload_saving = {
  estimated_monthly_savings : estimated_monthly_savings option;
      [@ocaml.doc
        "An object that describes the estimated monthly savings amount possible by adopting \
         Compute Optimizer recommendations for a given resource. This is based on the On-Demand \
         instance pricing.\n"]
  inferred_workload_types : inferred_workload_types option;
      [@ocaml.doc
        "The applications that might be running on the instance as inferred by Compute Optimizer.\n\n\
        \ Compute Optimizer can infer if one of the following applications might be running on the \
         instance:\n\
        \ \n\
        \  {ul\n\
        \        {-   [AmazonEmr] - Infers that Amazon EMR might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [ApacheCassandra] - Infers that Apache Cassandra might be running on the \
         instance.\n\
        \            \n\
        \             }\n\
        \        {-   [ApacheHadoop] - Infers that Apache Hadoop might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [Memcached] - Infers that Memcached might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [NGINX] - Infers that NGINX might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [PostgreSql] - Infers that PostgreSQL might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [Redis] - Infers that Redis might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [Kafka] - Infers that Kafka might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [SQLServer] - Infers that SQLServer might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  " The estimated monthly savings after you adjust the configurations of your instances running on \
   the inferred workload types to the recommended configurations. If the [inferredWorkloadTypes] \
   list contains multiple entries, then the savings are the sum of the monthly savings from \
   instances that run the exact combination of the inferred workload types. \n"]

type nonrec inferred_workload_savings = inferred_workload_saving list [@@ocaml.doc ""]

type nonrec recommendation_summary = {
  inferred_workload_savings : inferred_workload_savings option;
      [@ocaml.doc
        " An array of objects that describes the estimated monthly saving amounts for the \
         instances running on the specified [inferredWorkloadTypes]. The array contains the top \
         five savings opportunites for the instances that run inferred workload types. \n"]
  current_performance_risk_ratings : current_performance_risk_ratings option;
      [@ocaml.doc
        "An object that describes the performance risk ratings for a given resource type.\n"]
  aggregated_savings_opportunity : savings_opportunity option; [@ocaml.doc ""]
  idle_savings_opportunity : savings_opportunity option; [@ocaml.doc ""]
  savings_opportunity : savings_opportunity option;
      [@ocaml.doc
        "An object that describes the savings opportunity for a given resource type. Savings \
         opportunity includes the estimated monthly savings amount and percentage.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the recommendation summary.\n"]
  recommendation_resource_type : recommendation_source_type option;
      [@ocaml.doc "The resource type that the recommendation summary applies to.\n"]
  idle_summaries : idle_summaries option;
      [@ocaml.doc " Describes the findings summary of the idle resources. \n"]
  summaries : summaries option;
      [@ocaml.doc "An array of objects that describe a recommendation summary.\n"]
}
[@@ocaml.doc "A summary of a recommendation.\n"]

type nonrec recommendation_summaries = recommendation_summary list [@@ocaml.doc ""]

type nonrec recommendation_source_arn = string [@@ocaml.doc ""]

type nonrec recommendation_source = {
  recommendation_source_type : recommendation_source_type option;
      [@ocaml.doc "The resource type of the recommendation source.\n"]
  recommendation_source_arn : recommendation_source_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the recommendation source.\n"]
}
[@@ocaml.doc
  "Describes the source of a recommendation, such as an Amazon EC2 instance or Auto Scaling group.\n"]

type nonrec recommendation_sources = recommendation_source list [@@ocaml.doc ""]

type nonrec enhanced_infrastructure_metrics = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inferred_workload_types_preference = INACTIVE [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec external_metrics_source =
  | INSTANA [@ocaml.doc ""]
  | NEWRELIC [@ocaml.doc ""]
  | DYNATRACE [@ocaml.doc ""]
  | DATADOG [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec external_metrics_preference = {
  source : external_metrics_source option;
      [@ocaml.doc " Contains the source options for external metrics preferences. \n"]
}
[@@ocaml.doc " Describes the external metrics preferences for EC2 rightsizing recommendations. \n"]

type nonrec preferred_resource_name = EC2_INSTANCE_TYPES [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec preferred_resource_value = string [@@ocaml.doc ""]

type nonrec preferred_resource_values = preferred_resource_value list [@@ocaml.doc ""]

type nonrec effective_preferred_resource = {
  exclude_list : preferred_resource_values option;
      [@ocaml.doc
        " The list of preferred resources values that you want excluded from rightsizing \
         recommendation candidates. \n"]
  effective_include_list : preferred_resource_values option;
      [@ocaml.doc " The expanded version of your preferred resource's include list. \n"]
  include_list : preferred_resource_values option;
      [@ocaml.doc
        " The list of preferred resource values that you want considered as rightsizing \
         recommendation candidates. \n"]
  name : preferred_resource_name option; [@ocaml.doc " The name of the preferred resource list. \n"]
}
[@@ocaml.doc
  " Describes the effective preferred resources that Compute Optimizer considers as rightsizing \
   recommendation candidates. \n\n\
  \  Compute Optimizer only supports Amazon EC2 instance types.\n\
  \  \n\
  \   "]

type nonrec effective_preferred_resources = effective_preferred_resource list [@@ocaml.doc ""]

type nonrec recommendation_preferences_detail = {
  savings_estimation_mode : savings_estimation_mode option;
      [@ocaml.doc
        " Describes the savings estimation mode used for calculating savings opportunity. \n\n\
        \ Only the account manager or delegated administrator of your organization can activate \
         this preference.\n\
        \ "]
  preferred_resources : effective_preferred_resources option;
      [@ocaml.doc
        " The preference to control which resource type values are considered when generating \
         rightsizing recommendations. This object resolves any wildcard expressions and returns \
         the effective list of candidate resource type values. If the preference isn\226\128\153t \
         set, this object is null. \n"]
  utilization_preferences : utilization_preferences option;
      [@ocaml.doc
        " The preference to control the resource\226\128\153s CPU utilization threshold, CPU \
         utilization headroom, and memory utilization headroom. If the preference isn\226\128\153t \
         set, this object is null. \n\n\
        \  This preference is only available for the Amazon EC2 instance resource type.\n\
        \  \n\
        \   "]
  look_back_period : look_back_period_preference option;
      [@ocaml.doc
        " The preference to control the number of days the utilization metrics of the Amazon Web \
         Services resource are analyzed. If the preference isn\226\128\153t set, this object is \
         null. \n"]
  external_metrics_preference : external_metrics_preference option;
      [@ocaml.doc
        " An object that describes the external metrics recommendation preference. \n\n\
        \  If the preference is applied in the latest recommendation refresh, an object with a \
         valid [source] value appears in the response. If the preference isn't applied to the \
         recommendations already, then this object doesn't appear in the response. \n\
        \ "]
  inferred_workload_types : inferred_workload_types_preference option;
      [@ocaml.doc
        "The status of the inferred workload types recommendation preference.\n\n\
        \ When the recommendations page is refreshed, a status of [Active] confirms that the \
         preference is applied to the recommendations, and a status of [Inactive] confirms that \
         the preference isn't yet applied to recommendations.\n\
        \ "]
  enhanced_infrastructure_metrics : enhanced_infrastructure_metrics option;
      [@ocaml.doc
        "The status of the enhanced infrastructure metrics recommendation preference.\n\n\
        \ When the recommendations page is refreshed, a status of [Active] confirms that the \
         preference is applied to the recommendations, and a status of [Inactive] confirms that \
         the preference isn't yet applied to recommendations.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Enhanced \
         infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \  "]
  resource_type : resource_type option;
      [@ocaml.doc
        "The target resource type of the recommendation preference to create.\n\n\
        \ The [Ec2Instance] option encompasses standalone instances and instances that are part of \
         Auto Scaling groups. The [AutoScalingGroup] option encompasses only instances that are \
         part of an Auto Scaling group.\n\
        \ "]
  scope : scope option;
      [@ocaml.doc
        "An object that describes the scope of the recommendation preference.\n\n\
        \ Recommendation preferences can be created at the organization level (for management \
         accounts of an organization only), account level, and resource level. For more \
         information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
         enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \ "]
}
[@@ocaml.doc "Describes a recommendation preference.\n"]

type nonrec recommendation_preferences_details = recommendation_preferences_detail list
[@@ocaml.doc ""]

type nonrec cpu_vendor_architecture = CURRENT [@ocaml.doc ""] | AWS_ARM64 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cpu_vendor_architectures = cpu_vendor_architecture list [@@ocaml.doc ""]

type nonrec recommendation_preferences = {
  cpu_vendor_architectures : cpu_vendor_architectures option;
      [@ocaml.doc
        "Specifies the CPU vendor and architecture for Amazon EC2 instance and Auto Scaling group \
         recommendations.\n\n\
        \ For example, when you specify [AWS_ARM64] with:\n\
        \ \n\
        \  {ul\n\
        \        {-  A [GetEC2InstanceRecommendations] or [GetAutoScalingGroupRecommendations] \
         request, Compute Optimizer returns recommendations that consist of Graviton instance \
         types only.\n\
        \            \n\
        \             }\n\
        \        {-  A [GetEC2RecommendationProjectedMetrics] request, Compute Optimizer returns \
         projected utilization metrics for Graviton instance type recommendations only.\n\
        \            \n\
        \             }\n\
        \        {-  A [ExportEC2InstanceRecommendations] or \
         [ExportAutoScalingGroupRecommendations] request, Compute Optimizer exports \
         recommendations that consist of Graviton instance types only.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Describes the recommendation preferences to return in the response of a \
   [GetAutoScalingGroupRecommendations], [GetEC2InstanceRecommendations], \
   [GetEC2RecommendationProjectedMetrics], [GetRDSDatabaseRecommendations], and \
   [GetRDSDatabaseRecommendationProjectedMetrics] request.\n"]

type nonrec recommendation_preference_name =
  | UTILIZATION_PREFERENCES [@ocaml.doc ""]
  | PREFERRED_RESOURCES [@ocaml.doc ""]
  | LOOKBACK_PERIOD_PREFERENCE [@ocaml.doc ""]
  | EXTERNAL_METRICS_PREFERENCE [@ocaml.doc ""]
  | INFERRED_WORKLOAD_TYPES [@ocaml.doc ""]
  | ENHANCED_INFRASTRUCTURE_METRICS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec recommendation_preference_names = recommendation_preference_name list [@@ocaml.doc ""]

type nonrec instance_type = string [@@ocaml.doc ""]

type nonrec gpu_count = int [@@ocaml.doc ""]

type nonrec gpu_memory_size_in_mi_b = int [@@ocaml.doc ""]

type nonrec gpu = {
  gpu_memory_size_in_mi_b : gpu_memory_size_in_mi_b option;
      [@ocaml.doc
        " The total size of the memory for the GPU accelerators for the instance type, in MiB. \n"]
  gpu_count : gpu_count option; [@ocaml.doc " The number of GPUs for the instance type. \n"]
}
[@@ocaml.doc " Describes the GPU accelerators for the instance type. \n"]

type nonrec gpus = gpu list [@@ocaml.doc ""]

type nonrec gpu_info = {
  gpus : gpus option; [@ocaml.doc " Describes the GPU accelerators for the instance type. \n"]
}
[@@ocaml.doc " Describes the GPU accelerator settings for the instance type. \n"]

type nonrec projected_utilization_metrics = utilization_metric list [@@ocaml.doc ""]

type nonrec platform_difference =
  | ARCHITECTURE [@ocaml.doc ""]
  | VIRTUALIZATION_TYPE [@ocaml.doc ""]
  | INSTANCE_STORE_AVAILABILITY [@ocaml.doc ""]
  | STORAGE_INTERFACE [@ocaml.doc ""]
  | NETWORK_INTERFACE [@ocaml.doc ""]
  | HYPERVISOR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec platform_differences = platform_difference list [@@ocaml.doc ""]

type nonrec instance_estimated_monthly_savings = {
  value : value option; [@ocaml.doc " The value of the estimated monthly savings. \n"]
  currency : currency option; [@ocaml.doc " The currency of the estimated monthly savings. \n"]
}
[@@ocaml.doc
  " An object that describes the estimated monthly savings possible by adopting Compute \
   Optimizer\226\128\153s Amazon EC2 instance recommendations. This is based on the Savings Plans \
   and Reserved Instances pricing discounts. \n"]

type nonrec instance_savings_opportunity_after_discounts = {
  estimated_monthly_savings : instance_estimated_monthly_savings option;
      [@ocaml.doc
        " An object that describes the estimated monthly savings possible by adopting Compute \
         Optimizer\226\128\153s Amazon EC2 instance recommendations. This is based on pricing \
         after applying the Savings Plans and Reserved Instances discounts. \n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost after applying \
         the Savings Plans and Reserved Instances discounts. This saving can be achieved by \
         adopting Compute Optimizer\226\128\153s EC2 instance recommendations. \n"]
}
[@@ocaml.doc
  " Describes the savings opportunity for instance recommendations after applying the Savings \
   Plans and Reserved Instances discounts. \n\n\
  \ Savings opportunity after discounts represents the estimated monthly savings you can achieve \
   by implementing Compute Optimizer recommendations.\n\
  \ "]

type nonrec migration_effort =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | VERY_LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_recommendation_option = {
  migration_effort : migration_effort option;
      [@ocaml.doc
        "The level of effort required to migrate from the current instance type to the recommended \
         instance type.\n\n\
        \ For example, the migration effort is [Low] if Amazon EMR is the inferred workload type \
         and an Amazon Web Services Graviton instance type is recommended. The migration effort is \
         [Medium] if a workload type couldn't be inferred but an Amazon Web Services Graviton \
         instance type is recommended. The migration effort is [VeryLow] if both the current and \
         recommended instance types are of the same CPU architecture.\n\
        \ "]
  savings_opportunity_after_discounts : instance_savings_opportunity_after_discounts option;
      [@ocaml.doc
        " An object that describes the savings opportunity for the instance recommendation option \
         that includes Savings Plans and Reserved Instances discounts. Savings opportunity \
         includes the estimated monthly savings and percentage. \n"]
  savings_opportunity : savings_opportunity option;
      [@ocaml.doc
        "An object that describes the savings opportunity for the instance recommendation option. \
         Savings opportunity includes the estimated monthly savings amount and percentage.\n"]
  rank : rank option;
      [@ocaml.doc
        "The rank of the instance recommendation option.\n\n\
        \ The top recommendation option is ranked as [1].\n\
        \ "]
  performance_risk : performance_risk option;
      [@ocaml.doc
        "The performance risk of the instance recommendation option.\n\n\
        \ Performance risk indicates the likelihood of the recommended instance type not meeting \
         the resource needs of your workload. Compute Optimizer calculates an individual \
         performance risk score for each specification of the recommended instance, including CPU, \
         memory, EBS throughput, EBS IOPS, disk throughput, disk IOPS, network throughput, and \
         network PPS. The performance risk of the recommended instance is calculated as the \
         maximum performance risk score across the analyzed resource specifications.\n\
        \ \n\
        \  The value ranges from [0] - [4], with [0] meaning that the recommended resource is \
         predicted to always provide enough hardware capability. The higher the performance risk \
         is, the more likely you should validate whether the recommendation will meet the \
         performance requirements of your workload before migrating your resource.\n\
        \  "]
  platform_differences : platform_differences option;
      [@ocaml.doc
        "Describes the configuration differences between the current instance and the recommended \
         instance type. You should consider the configuration differences before migrating your \
         workloads from the current instance to the recommended instance type. The \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html}Change \
         the instance type guide for Linux} and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-resize.html}Change \
         the instance type guide for Windows} provide general guidance for getting started with an \
         instance migration.\n\n\
        \ Platform differences include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [Hypervisor] } \226\128\148 The hypervisor of the recommended instance \
         type is different than that of the current instance. For example, the recommended \
         instance type uses a Nitro hypervisor and the current instance uses a Xen hypervisor. The \
         differences that you should consider between these hypervisors are covered in the \
         {{:http://aws.amazon.com/ec2/faqs/#Nitro_Hypervisor}Nitro Hypervisor} section of the \
         Amazon EC2 frequently asked questions. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances}Instances \
         built on the Nitro System} in the {i Amazon EC2 User Guide for Linux}, or \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#ec2-nitro-instances}Instances \
         built on the Nitro System} in the {i Amazon EC2 User Guide for Windows}.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [NetworkInterface] } \226\128\148 The network interface of the \
         recommended instance type is different than that of the current instance. For example, \
         the recommended instance type supports enhanced networking and the current instance might \
         not. To enable enhanced networking for the recommended instance type, you must install \
         the Elastic Network Adapter (ENA) driver or the Intel 82599 Virtual Function driver. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage}Networking \
         and storage features} and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html}Enhanced \
         networking on Linux} in the {i Amazon EC2 User Guide for Linux}, or \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage}Networking \
         and storage features} and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html}Enhanced \
         networking on Windows} in the {i Amazon EC2 User Guide for Windows}.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [StorageInterface] } \226\128\148 The storage interface of the \
         recommended instance type is different than that of the current instance. For example, \
         the recommended instance type uses an NVMe storage interface and the current instance \
         does not. To access NVMe volumes for the recommended instance type, you will need to \
         install or upgrade the NVMe driver. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage}Networking \
         and storage features} and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nvme-ebs-volumes.html}Amazon EBS \
         and NVMe on Linux instances} in the {i Amazon EC2 User Guide for Linux}, or \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage}Networking \
         and storage features} and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/nvme-ebs-volumes.html}Amazon \
         EBS and NVMe on Windows instances} in the {i Amazon EC2 User Guide for Windows}.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [InstanceStoreAvailability] } \226\128\148 The recommended instance type \
         does not support instance store volumes and the current instance does. Before migrating, \
         you might need to back up the data on your instance store volumes if you want to preserve \
         them. For more information, see \
         {{:https://aws.amazon.com/premiumsupport/knowledge-center/back-up-instance-store-ebs/}How \
         do I back up an instance store volume on my Amazon EC2 instance to Amazon EBS?} in the {i \
         Amazon Web Services Premium Support Knowledge Base}. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage}Networking \
         and storage features} and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html}Amazon EC2 \
         instance store} in the {i Amazon EC2 User Guide for Linux}, or see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage}Networking \
         and storage features} and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/InstanceStorage.html}Amazon EC2 \
         instance store} in the {i Amazon EC2 User Guide for Windows}.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [VirtualizationType] } \226\128\148 The recommended instance type uses \
         the hardware virtual machine (HVM) virtualization type and the current instance uses the \
         paravirtual (PV) virtualization type. For more information about the differences between \
         these virtualization types, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html}Linux \
         AMI virtualization types} in the {i Amazon EC2 User Guide for Linux}, or \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#virtualization-types}Windows \
         AMI virtualization types} in the {i Amazon EC2 User Guide for Windows}.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [Architecture] } \226\128\148 The CPU architecture between the \
         recommended instance type and the current instance is different. For example, the \
         recommended instance type might use an Arm CPU architecture and the current instance type \
         might use a different one, such as x86. Before migrating, you should consider recompiling \
         the software on your instance for the new architecture. Alternatively, you might switch \
         to an Amazon Machine Image (AMI) that supports the new architecture. For more information \
         about the CPU architecture for each instance type, see \
         {{:http://aws.amazon.com/ec2/instance-types/}Amazon EC2 Instance Types}.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  projected_utilization_metrics : projected_utilization_metrics option;
      [@ocaml.doc
        "An array of objects that describe the projected utilization metrics of the instance \
         recommendation option.\n\n\
        \  The [Cpu] and [Memory] metrics are the only projected utilization metrics returned. \
         Additionally, the [Memory] metric is returned only for resources that have the unified \
         CloudWatch agent installed on them. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
         Memory Utilization with the CloudWatch Agent}.\n\
        \  \n\
        \   "]
  instance_gpu_info : gpu_info option;
      [@ocaml.doc " Describes the GPU accelerator settings for the recommended instance type. \n"]
  instance_type : instance_type option;
      [@ocaml.doc "The instance type of the instance recommendation.\n"]
}
[@@ocaml.doc "Describes a recommendation option for an Amazon EC2 instance.\n"]

type nonrec recommendation_options = instance_recommendation_option list [@@ocaml.doc ""]

type nonrec job_id = string [@@ocaml.doc ""]

type nonrec export_destination = {
  s3 : s3_destination option;
      [@ocaml.doc
        "An object that describes the destination Amazon Simple Storage Service (Amazon S3) bucket \
         name and object keys of a recommendations export file, and its associated metadata file.\n"]
}
[@@ocaml.doc "Describes the destination of the recommendations export and metadata files.\n"]

type nonrec job_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec creation_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_updated_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec failure_reason = string [@@ocaml.doc ""]

type nonrec recommendation_export_job = {
  failure_reason : failure_reason option; [@ocaml.doc "The reason for an export job failure.\n"]
  last_updated_timestamp : last_updated_timestamp option;
      [@ocaml.doc "The timestamp of when the export job was last updated.\n"]
  creation_timestamp : creation_timestamp option;
      [@ocaml.doc "The timestamp of when the export job was created.\n"]
  status : job_status option; [@ocaml.doc "The status of the export job.\n"]
  resource_type : resource_type option;
      [@ocaml.doc "The resource type of the exported recommendations.\n"]
  destination : export_destination option;
      [@ocaml.doc "An object that describes the destination of the export file.\n"]
  job_id : job_id option; [@ocaml.doc "The identification number of the export job.\n"]
}
[@@ocaml.doc
  "Describes a recommendation export job.\n\n\
  \ Use the [DescribeRecommendationExportJobs] action to view your recommendation export jobs.\n\
  \ \n\
  \  Use the [ExportAutoScalingGroupRecommendations] or [ExportEC2InstanceRecommendations] actions \
   to request an export of your recommendations.\n\
  \  "]

type nonrec recommendation_export_jobs = recommendation_export_job list [@@ocaml.doc ""]

type nonrec rds_storage_estimated_monthly_savings = {
  value : value option;
      [@ocaml.doc " The value of the estimated monthly savings for DB instance storage. \n"]
  currency : currency option; [@ocaml.doc " The currency of the estimated monthly savings. \n"]
}
[@@ocaml.doc
  " Describes the estimated monthly savings possible for DB instance storage by adopting Compute \
   Optimizer recommendations. This is based on DB instance pricing after applying Savings Plans \
   discounts. \n"]

type nonrec rds_storage_savings_opportunity_after_discounts = {
  estimated_monthly_savings : rds_storage_estimated_monthly_savings option;
      [@ocaml.doc
        " The estimated monthly savings possible by adopting Compute Optimizer\226\128\153s DB \
         instance storage recommendations. This includes any applicable Savings Plans discounts. \n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer\226\128\153s DB instance storage recommendations. This includes any \
         applicable Savings Plans discounts. \n"]
}
[@@ocaml.doc
  " Describes the savings opportunity for Amazon RDS storage recommendations after applying \
   Savings Plans discounts. \n\n\
  \  Savings opportunity represents the estimated monthly savings after applying Savings Plans \
   discounts. You can achieve this by implementing a given Compute Optimizer recommendation. \n\
  \ "]

type nonrec rds_storage_finding_reason_code =
  | DB_CLUSTER_STORAGE_SAVINGS_AVAILABLE [@ocaml.doc ""]
  | DB_CLUSTER_STORAGE_OPTION_AVAILABLE [@ocaml.doc ""]
  | NEW_GENERATION_STORAGE_TYPE_AVAILABLE [@ocaml.doc ""]
  | EBS_VOLUME_THROUGHPUT_OVER_PROVISIONED [@ocaml.doc ""]
  | EBS_VOLUME_IOPS_OVER_PROVISIONED [@ocaml.doc ""]
  | EBS_VOLUME_THROUGHPUT_UNDER_PROVISIONED [@ocaml.doc ""]
  | EBS_VOLUME_ALLOCATED_STORAGE_UNDER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rds_storage_finding_reason_codes = rds_storage_finding_reason_code list [@@ocaml.doc ""]

type nonrec rds_storage_finding =
  | NOT_OPTIMIZED [@ocaml.doc ""]
  | OVER_PROVISIONED [@ocaml.doc ""]
  | UNDER_PROVISIONED [@ocaml.doc ""]
  | OPTIMIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rds_savings_estimation_mode_source =
  | COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | COST_EXPLORER_RIGHTSIZING [@ocaml.doc ""]
  | PUBLIC_PRICING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rds_savings_estimation_mode = {
  source : rds_savings_estimation_mode_source option;
      [@ocaml.doc
        " Describes the source for calculating the savings opportunity for DB instances. \n"]
}
[@@ocaml.doc
  " Describes the savings estimation mode used for calculating savings opportunity for DB \
   instances. \n"]

type nonrec rds_instance_estimated_monthly_savings = {
  value : value option;
      [@ocaml.doc " The value of the estimated monthly savings for DB instances. \n"]
  currency : currency option; [@ocaml.doc " The currency of the estimated monthly savings. \n"]
}
[@@ocaml.doc
  " Describes the estimated monthly savings possible for DB instances by adopting Compute \
   Optimizer recommendations. This is based on DB instance pricing after applying Savings Plans \
   discounts. \n"]

type nonrec rds_instance_savings_opportunity_after_discounts = {
  estimated_monthly_savings : rds_instance_estimated_monthly_savings option;
      [@ocaml.doc
        " The estimated monthly savings possible by adopting Compute Optimizer\226\128\153s DB \
         instance recommendations. This includes any applicable Savings Plans discounts. \n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer\226\128\153s DB instance recommendations. This includes any applicable \
         Savings Plans discounts. \n"]
}
[@@ocaml.doc
  " Describes the savings opportunity for DB instance recommendations after applying Savings Plans \
   discounts. \n\n\
  \  Savings opportunity represents the estimated monthly savings after applying Savings Plans \
   discounts. You can achieve this by implementing a given Compute Optimizer recommendation. \n\
  \ "]

type nonrec rds_instance_finding_reason_code =
  | INSTANCE_STORAGE_WRITE_IOPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | INSTANCE_STORAGE_READ_IOPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_UNDER_PROVISIONED [@ocaml.doc ""]
  | DB_CLUSTER_WRITER_UNDER_PROVISIONED [@ocaml.doc ""]
  | NEW_ENGINE_VERSION_AVAILABLE [@ocaml.doc ""]
  | NEW_GENERATION_DB_INSTANCE_CLASS_AVAILABLE [@ocaml.doc ""]
  | EBS_THROUGHPUT_UNDER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED [@ocaml.doc ""]
  | CPU_UNDER_PROVISIONED [@ocaml.doc ""]
  | EBS_THROUGHPUT_OVER_PROVISIONED [@ocaml.doc ""]
  | EBS_IOPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | EBS_IOPS_OVER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_BANDWIDTH_OVER_PROVISIONED [@ocaml.doc ""]
  | CPU_OVER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rds_instance_finding_reason_codes = rds_instance_finding_reason_code list
[@@ocaml.doc ""]

type nonrec rds_instance_finding =
  | OVER_PROVISIONED [@ocaml.doc ""]
  | UNDER_PROVISIONED [@ocaml.doc ""]
  | OPTIMIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rds_estimated_monthly_volume_io_ps_cost_variation =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rds_effective_recommendation_preferences = {
  savings_estimation_mode : rds_savings_estimation_mode option;
      [@ocaml.doc
        " Describes the savings estimation mode preference applied for calculating savings \
         opportunity for DB instances. \n"]
  look_back_period : look_back_period_preference option;
      [@ocaml.doc " The number of days the utilization metrics of the DB instance are analyzed. \n"]
  enhanced_infrastructure_metrics : enhanced_infrastructure_metrics option;
      [@ocaml.doc
        "Describes the activation status of the enhanced infrastructure metrics preference. \n\n\
        \ A status of [Active] confirms that the preference is applied in the latest \
         recommendation refresh, and a status of [Inactive] confirms that it's not yet applied to \
         recommendations. \n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Enhanced \
         infrastructure metrics} in the {i Compute Optimizer User Guide}. \n\
        \  "]
  cpu_vendor_architectures : cpu_vendor_architectures option;
      [@ocaml.doc " Describes the CPU vendor and architecture for DB instance recommendations. \n"]
}
[@@ocaml.doc
  " Describes the effective recommendation preferences for Amazon Aurora and RDS databases. \n"]

type nonrec rdsdb_metric_name =
  | VOLUME_WRITE_IOPS [@ocaml.doc ""]
  | VOLUME_BYTES_USED [@ocaml.doc ""]
  | VOLUME_READ_IOPS [@ocaml.doc ""]
  | WRITE_IOPS_EPHEMERAL_STORAGE [@ocaml.doc ""]
  | READ_IOPS_EPHEMERAL_STORAGE [@ocaml.doc ""]
  | AURORA_MEMORY_NUM_KILL_QUERY_TOTAL [@ocaml.doc ""]
  | AURORA_MEMORY_NUM_KILL_CONN_TOTAL [@ocaml.doc ""]
  | AURORA_MEMORY_NUM_DECLINED_SQL [@ocaml.doc ""]
  | AURORA_MEMORY_HEALTH_STATE [@ocaml.doc ""]
  | STORAGE_NETWORK_TRANSMIT_THROUGHPUT [@ocaml.doc ""]
  | STORAGE_NETWORK_RECEIVE_THROUGHPUT [@ocaml.doc ""]
  | DATABASE_CONNECTIONS [@ocaml.doc ""]
  | EBS_VOLUME_WRITE_THROUGHPUT [@ocaml.doc ""]
  | EBS_VOLUME_READ_THROUGHPUT [@ocaml.doc ""]
  | EBS_VOLUME_WRITE_IOPS [@ocaml.doc ""]
  | EBS_VOLUME_READ_IOPS [@ocaml.doc ""]
  | NETWORK_TRANSMIT_THROUGHPUT [@ocaml.doc ""]
  | NETWORK_RECEIVE_THROUGHPUT [@ocaml.doc ""]
  | EBS_VOLUME_STORAGE_SPACE_UTILIZATION [@ocaml.doc ""]
  | MEMORY [@ocaml.doc ""]
  | CPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rds_database_projected_metric = {
  values : metric_values option; [@ocaml.doc " The values for the projected metric. \n"]
  timestamps : timestamps option; [@ocaml.doc " The timestamps of the projected metric. \n"]
  name : rdsdb_metric_name option; [@ocaml.doc " The name of the projected metric. \n"]
}
[@@ocaml.doc
  " Describes the projected metrics of an Amazon Aurora and RDS database recommendation option. \n\n\
  \  To determine the performance difference between your current Amazon Aurora and RDS database \
   and the recommended option, compare the metric data of your service against its projected \
   metric data. \n\
  \ "]

type nonrec rds_database_projected_metrics = rds_database_projected_metric list [@@ocaml.doc ""]

type nonrec rds_database_recommended_option_projected_metric = {
  projected_metrics : rds_database_projected_metrics option;
      [@ocaml.doc " An array of objects that describe the projected metric. \n"]
  rank : rank option;
      [@ocaml.doc
        " The rank identifier of the Amazon Aurora or RDS DB instance recommendation option. \n"]
  recommended_db_instance_class : recommended_db_instance_class option;
      [@ocaml.doc " The recommended DB instance class for the Amazon Aurora or RDS database. \n"]
}
[@@ocaml.doc
  " Describes the projected metrics of an Amazon Aurora and RDS database recommendation option. \n\n\
  \  To determine the performance difference between your current Amazon Aurora and RDS database \
   and the recommended option, compare the metric data of your service against its projected \
   metric data. \n\
  \ "]

type nonrec rds_database_recommended_option_projected_metrics =
  rds_database_recommended_option_projected_metric list
[@@ocaml.doc ""]

type nonrec rdsdb_metric_statistic =
  | AVERAGE [@ocaml.doc ""]
  | MINIMUM [@ocaml.doc ""]
  | MAXIMUM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rdsdb_utilization_metric = {
  value : metric_value option; [@ocaml.doc " The value of the utilization metric. \n"]
  statistic : rdsdb_metric_statistic option;
      [@ocaml.doc
        " The statistic of the utilization metric. \n\n\
        \ The Compute Optimizer API, Command Line Interface (CLI), and SDKs return utilization \
         metrics using only the [Maximum] statistic, which is the highest value observed during \
         the specified period.\n\
        \ \n\
        \  The Compute Optimizer console displays graphs for some utilization metrics using the \
         [Average] statistic, which is the value of [Sum] / [SampleCount] during the specified \
         period. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html}Viewing \
         resource recommendations} in the {i Compute Optimizer User Guide}. You can also get \
         averaged utilization metric data for your resources using Amazon CloudWatch. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
         CloudWatch User Guide}.\n\
        \  "]
  name : rdsdb_metric_name option; [@ocaml.doc " The name of the utilization metric. \n"]
}
[@@ocaml.doc
  " Describes the utilization metric of an Amazon Aurora and RDS database. \n\n\
  \  To determine the performance difference between your current DB instance and the recommended \
   option, compare the utilization metric data of your service against its projected utilization \
   metric data. \n\
  \ "]

type nonrec rdsdb_utilization_metrics = rdsdb_utilization_metric list [@@ocaml.doc ""]

type nonrec allocated_storage = int [@@ocaml.doc ""]

type nonrec nullable_iop_s = int [@@ocaml.doc ""]

type nonrec nullable_max_allocated_storage = int [@@ocaml.doc ""]

type nonrec nullable_storage_throughput = int [@@ocaml.doc ""]

type nonrec db_storage_configuration = {
  storage_throughput : nullable_storage_throughput option;
      [@ocaml.doc " The storage throughput of the DB storage. \n"]
  max_allocated_storage : nullable_max_allocated_storage option;
      [@ocaml.doc
        " The maximum limit in gibibytes (GiB) to which Amazon RDS can automatically scale the \
         storage of the DB instance. \n"]
  iops : nullable_iop_s option; [@ocaml.doc " The provisioned IOPs of the DB storage. \n"]
  allocated_storage : allocated_storage option;
      [@ocaml.doc " The size of the DB storage in gigabytes (GB). \n"]
  storage_type : storage_type option; [@ocaml.doc " The type of DB storage. \n"]
}
[@@ocaml.doc " The configuration of the recommended RDS storage. \n"]

type nonrec rdsdb_storage_recommendation_option = {
  estimated_monthly_volume_io_ps_cost_variation :
    rds_estimated_monthly_volume_io_ps_cost_variation option;
      [@ocaml.doc
        " The projected level of variation in monthly I/O costs for the DB storage recommendation \
         option. \n"]
  savings_opportunity_after_discounts : rds_storage_savings_opportunity_after_discounts option;
      [@ocaml.doc
        " Describes the savings opportunity for DB storage recommendations or for the \
         recommendation option. \n\n\
        \  Savings opportunity represents the estimated monthly savings after applying Savings \
         Plans discounts. You can achieve this by implementing a given Compute Optimizer \
         recommendation. \n\
        \ "]
  savings_opportunity : savings_opportunity option; [@ocaml.doc ""]
  rank : rank option;
      [@ocaml.doc " The rank identifier of the DB storage recommendation option. \n"]
  storage_configuration : db_storage_configuration option;
      [@ocaml.doc " The recommended storage configuration. \n"]
}
[@@ocaml.doc " Describes the recommendation options for DB storage. \n"]

type nonrec rdsdb_storage_recommendation_options = rdsdb_storage_recommendation_option list
[@@ocaml.doc ""]

type nonrec engine = string [@@ocaml.doc ""]

type nonrec engine_version = string [@@ocaml.doc ""]

type nonrec promotion_tier = int [@@ocaml.doc ""]

type nonrec current_db_instance_class = string [@@ocaml.doc ""]

type nonrec db_cluster_identifier = string [@@ocaml.doc ""]

type nonrec idle = FALSE [@ocaml.doc ""] | TRUE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rds_current_instance_performance_risk =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | VERY_LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec db_instance_class = string [@@ocaml.doc ""]

type nonrec rdsdb_projected_utilization_metrics = rdsdb_utilization_metric list [@@ocaml.doc ""]

type nonrec rdsdb_instance_recommendation_option = {
  savings_opportunity_after_discounts : rds_instance_savings_opportunity_after_discounts option;
      [@ocaml.doc
        " Describes the savings opportunity for Amazon Aurora and RDS database recommendations or \
         for the recommendation option. \n\n\
        \ Savings opportunity represents the estimated monthly savings after applying Savings \
         Plans discounts. You can achieve this by implementing a given Compute Optimizer \
         recommendation.\n\
        \ "]
  savings_opportunity : savings_opportunity option; [@ocaml.doc ""]
  rank : rank option;
      [@ocaml.doc " The rank identifier of the DB instance recommendation option. \n"]
  performance_risk : performance_risk option;
      [@ocaml.doc " The performance risk of the DB instance recommendation option. \n"]
  projected_utilization_metrics : rdsdb_projected_utilization_metrics option;
      [@ocaml.doc
        " An array of objects that describe the projected utilization metrics of the DB instance \
         recommendation option. \n"]
  db_instance_class : db_instance_class option;
      [@ocaml.doc
        " Describes the DB instance class recommendation option for your Amazon Aurora or RDS \
         database. \n"]
}
[@@ocaml.doc " Describes the recommendation options for a DB instance. \n"]

type nonrec rdsdb_instance_recommendation_options = rdsdb_instance_recommendation_option list
[@@ocaml.doc ""]

type nonrec rdsdb_recommendation = {
  tags : tags option;
      [@ocaml.doc " A list of tags assigned to your DB instance recommendations. \n"]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc " The timestamp of when the DB instance recommendation was last generated. \n"]
  lookback_period_in_days : look_back_period_in_days option;
      [@ocaml.doc " The number of days the DB instance utilization metrics were analyzed. \n"]
  effective_recommendation_preferences : rds_effective_recommendation_preferences option;
      [@ocaml.doc " Describes the effective recommendation preferences for DB instances. \n"]
  utilization_metrics : rdsdb_utilization_metrics option;
      [@ocaml.doc
        " An array of objects that describe the utilization metrics of the DB instance. \n"]
  storage_recommendation_options : rdsdb_storage_recommendation_options option;
      [@ocaml.doc
        " An array of objects that describe the recommendation options for DB instance storage. \n"]
  instance_recommendation_options : rdsdb_instance_recommendation_options option;
      [@ocaml.doc
        " An array of objects that describe the recommendation options for the RDS DB instance. \n"]
  storage_finding_reason_codes : rds_storage_finding_reason_codes option;
      [@ocaml.doc " The reason for the finding classification of RDS DB instance storage. \n"]
  current_storage_estimated_monthly_volume_io_ps_cost_variation :
    rds_estimated_monthly_volume_io_ps_cost_variation option;
      [@ocaml.doc
        " The level of variation in monthly I/O costs for the current DB storage configuration. \n"]
  current_instance_performance_risk : rds_current_instance_performance_risk option;
      [@ocaml.doc "The performance risk for the current DB instance.\n"]
  instance_finding_reason_codes : rds_instance_finding_reason_codes option;
      [@ocaml.doc " The reason for the finding classification of a DB instance. \n"]
  storage_finding : rds_storage_finding option;
      [@ocaml.doc
        " The finding classification of Amazon RDS DB instance storage. \n\n\
        \ For more information about finding classifications, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/view-rds-recommendations.html#rds-recommendations-findings} \
         Finding classifications for Aurora and RDS databases} in the {i Compute Optimizer User \
         Guide}.\n\
        \ "]
  instance_finding : rds_instance_finding option;
      [@ocaml.doc
        " The finding classification of an Amazon Aurora and RDS DB instance. \n\n\
        \ For more information about finding classifications, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/view-rds-recommendations.html#rds-recommendations-findings} \
         Finding classifications for Aurora and RDS databases} in the {i Compute Optimizer User \
         Guide}.\n\
        \ "]
  idle : idle option; [@ocaml.doc " This indicates if the DB instance is idle or not. \n"]
  db_cluster_identifier : db_cluster_identifier option;
      [@ocaml.doc "The identifier for DB cluster.\n"]
  current_storage_configuration : db_storage_configuration option;
      [@ocaml.doc " The configuration of the current DB storage. \n"]
  current_db_instance_class : current_db_instance_class option;
      [@ocaml.doc " The DB instance class of the current Aurora or RDS DB instance. \n"]
  promotion_tier : promotion_tier option;
      [@ocaml.doc "The promotion tier for the Aurora instance.\n"]
  engine_version : engine_version option; [@ocaml.doc " The database engine version. \n"]
  engine : engine option; [@ocaml.doc " The engine of the DB instance. \n"]
  account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID of the Amazon Aurora or RDS database. \n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        " The ARN of the current Amazon Aurora or RDS database. \n\n\
        \  The following is the format of the ARN: \n\
        \ \n\
        \   [arn:aws:rds:{region}:{accountId}:db:{resourceName}] \n\
        \  "]
}
[@@ocaml.doc " Describes an Amazon Aurora and RDS database recommendation. \n"]

type nonrec rdsdb_recommendations = rdsdb_recommendation list [@@ocaml.doc ""]

type nonrec rdsdb_recommendation_filter_name =
  | IDLE [@ocaml.doc ""]
  | STORAGE_FINDING_REASON_CODE [@ocaml.doc ""]
  | STORAGE_FINDING [@ocaml.doc ""]
  | INSTANCE_FINDING_REASON_CODE [@ocaml.doc ""]
  | INSTANCE_FINDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_values = filter_value list [@@ocaml.doc ""]

type nonrec rdsdb_recommendation_filter = {
  values : filter_values option; [@ocaml.doc " The value of the filter. \n"]
  name : rdsdb_recommendation_filter_name option;
      [@ocaml.doc
        " The name of the filter. \n\n\
        \  Specify [Finding] to return recommendations with a specific finding classification. \n\
        \ \n\
        \  You can filter your DB instance recommendations by [tag:key] and [tag-key] tags.\n\
        \  \n\
        \   A [tag:key] is a key and value combination of a tag assigned to your DB instance \
         recommendations. Use the tag key in the filter name and the tag value as the filter \
         value. For example, to find all DB instance recommendations that have a tag with the key \
         of [Owner] and the value of [TeamA], specify [tag:Owner] for the filter name and [TeamA] \
         for the filter value.\n\
        \   \n\
        \    A [tag-key] is the key of a tag assigned to your DB instance recommendations. Use \
         this filter to find all of your DB instance recommendations that have a tag with a \
         specific key. This doesn\226\128\153t consider the tag value. For example, you can find \
         your DB instance recommendations with a tag key value of [Owner] or without any tag keys \
         assigned.\n\
        \    "]
}
[@@ocaml.doc
  " Describes a filter that returns a more specific list of DB instance recommendations. Use this \
   filter with the [GetECSServiceRecommendations] action. \n"]

type nonrec rdsdb_recommendation_filters = rdsdb_recommendation_filter list [@@ocaml.doc ""]

type nonrec put_recommendation_preferences_response = unit [@@ocaml.doc ""]

type nonrec preferred_resource = {
  exclude_list : preferred_resource_values option;
      [@ocaml.doc
        " The preferred resource type values to exclude from the recommendation candidates. If \
         this isn\226\128\153t specified, all supported resources are included by default. You can \
         specify up to 1000 values in this list. \n"]
  include_list : preferred_resource_values option;
      [@ocaml.doc
        " The preferred resource type values to include in the recommendation candidates. You can \
         specify the exact resource type value, such as m5.large, or use wild card expressions, \
         such as m5. If this isn\226\128\153t specified, all supported resources are included by \
         default. You can specify up to 1000 values in this list. \n"]
  name : preferred_resource_name option;
      [@ocaml.doc
        " The type of preferred resource to customize. \n\n\
        \  Compute Optimizer only supports the customization of [Ec2InstanceTypes].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  " The preference to control which resource type values are considered when generating \
   rightsizing recommendations. You can specify this preference as a combination of include and \
   exclude lists. You must specify either an [includeList] or [excludeList]. If the preference is \
   an empty set of resource type values, an error occurs. For more information, see \
   {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/rightsizing-preferences.html} \
   Rightsizing recommendation preferences} in the {i Compute Optimizer User Guide}. \n\n\
  \  {ul\n\
  \        {-  This preference is only available for the Amazon EC2 instance and Auto Scaling \
   group resource types.\n\
  \            \n\
  \             }\n\
  \        {-  Compute Optimizer only supports the customization of [Ec2InstanceTypes].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

type nonrec preferred_resources = preferred_resource list [@@ocaml.doc ""]

type nonrec put_recommendation_preferences_request = {
  savings_estimation_mode : savings_estimation_mode option;
      [@ocaml.doc
        " The status of the savings estimation mode preference to create or update. \n\n\
        \ Specify the [AfterDiscounts] status to activate the preference, or specify \
         [BeforeDiscounts] to deactivate the preference.\n\
        \ \n\
        \  Only the account manager or delegated administrator of your organization can activate \
         this preference.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/savings-estimation-mode.html} \
         Savings estimation mode} in the {i Compute Optimizer User Guide}.\n\
        \   "]
  preferred_resources : preferred_resources option;
      [@ocaml.doc
        " The preference to control which resource type values are considered when generating \
         rightsizing recommendations. You can specify this preference as a combination of include \
         and exclude lists. You must specify either an [includeList] or [excludeList]. If the \
         preference is an empty set of resource type values, an error occurs. \n\n\
        \  You can only set this preference for the Amazon EC2 instance, Auto Scaling group, \
         Amazon EBS volume, Amazon ECS service, Amazon RDS DB instance, and Aurora DB cluster \
         storage resource types.\n\
        \  \n\
        \   "]
  utilization_preferences : utilization_preferences option;
      [@ocaml.doc
        " The preference to control the resource\226\128\153s CPU utilization threshold, CPU \
         utilization headroom, and memory utilization headroom. When this preference isn't \
         specified, we use the following default values. \n\n\
        \ CPU utilization:\n\
        \ \n\
        \  {ul\n\
        \        {-   [P99_5] for threshold\n\
        \            \n\
        \             }\n\
        \        {-   [PERCENT_20] for headroom\n\
        \            \n\
        \             }\n\
        \        } Memory utilization:\n\
        \          \n\
        \           {ul\n\
        \                 {-   [PERCENT_20] for headroom\n\
        \                     \n\
        \                      }\n\
        \                 }\n\
        \    {ul\n\
        \          {-  You can only set CPU and memory utilization preferences for the Amazon EC2 \
         instance resource type.\n\
        \              \n\
        \               }\n\
        \          {-  The threshold setting isn\226\128\153t available for memory utilization.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   "]
  look_back_period : look_back_period_preference option;
      [@ocaml.doc
        " The preference to control the number of days the utilization metrics of the Amazon Web \
         Services resource are analyzed. When this preference isn't specified, we use the default \
         value [DAYS_14]. \n\n\
        \ You can only set this preference for the Amazon EC2 instance, Auto Scaling group, Amazon \
         EBS volume, Amazon ECS service on Fargate, Amazon RDS DB instance, and Aurora DB cluster \
         storage resource types. \n\
        \ \n\
        \   {ul\n\
        \         {-  Lookback period preferences for Amazon EC2 instances, Amazon EBS volumes, \
         Amazon ECS services, Amazon RDS DB instances, and Aurora DB cluster storage resource \
         types can be set at the organization, account, and resource levels.\n\
        \             \n\
        \              }\n\
        \         {-  Auto Scaling group lookback preferences can only be set at the resource level.\n\
        \             \n\
        \              }\n\
        \         {-  Amazon EBS volume lookback preferences can be set at the organization, \
         account, and resource levels.\n\
        \             \n\
        \              }\n\
        \         {-  Amazon ECS service on Fargate lookback preferences can be set at the \
         organization, account, and resource levels.\n\
        \             \n\
        \              }\n\
        \         {-  Amazon RDS DB instance lookback preferences can be set at the organization, \
         account, and resource levels.\n\
        \             \n\
        \              }\n\
        \         {-  Aurora DB cluster storage lookback preferences can be set at the \
         organization, account, and resource levels.\n\
        \             \n\
        \              }\n\
        \         {-  Changing the lookback period for Amazon EBS volumes to 14 days does not \
         affect the 32-day lookback period used to determine whether an Amazon EBS volume is \
         unattached.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  external_metrics_preference : external_metrics_preference option;
      [@ocaml.doc
        "The provider of the external metrics recommendation preference to create or update.\n\n\
        \ Specify a valid provider in the [source] field to activate the preference. To delete \
         this preference, see the [DeleteRecommendationPreferences] action.\n\
        \ \n\
        \  This preference can only be set for the [Ec2Instance] resource type.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/external-metrics-ingestion.html}External \
         metrics ingestion} in the {i Compute Optimizer User Guide}.\n\
        \   "]
  inferred_workload_types : inferred_workload_types_preference option;
      [@ocaml.doc
        "The status of the inferred workload types recommendation preference to create or update.\n\n\
        \  The inferred workload type feature is active by default. To deactivate it, create a \
         recommendation preference.\n\
        \  \n\
        \    Specify the [Inactive] status to deactivate the feature, or specify [Active] to \
         activate it.\n\
        \    \n\
        \     For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/inferred-workload-types.html}Inferred \
         workload types} in the {i Compute Optimizer User Guide}.\n\
        \     "]
  enhanced_infrastructure_metrics : enhanced_infrastructure_metrics option;
      [@ocaml.doc
        "The status of the enhanced infrastructure metrics recommendation preference to create or \
         update.\n\n\
        \ Specify the [Active] status to activate the preference, or specify [Inactive] to \
         deactivate the preference.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Enhanced \
         infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \  "]
  scope : scope option;
      [@ocaml.doc
        "An object that describes the scope of the recommendation preference to create.\n\n\
        \ You can create recommendation preferences at the organization level (for management \
         accounts of an organization only), account level, and resource level. For more \
         information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
         enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \ \n\
        \   You cannot create recommendation preferences for Auto Scaling groups at the \
         organization and account levels. You can create recommendation preferences for Auto \
         Scaling groups only at the resource level by specifying a scope name of [ResourceArn] and \
         a scope value of the Auto Scaling group Amazon Resource Name (ARN). This will configure \
         the preference for all instances that are part of the specified Auto Scaling group. You \
         also cannot create recommendation preferences at the resource level for instances that \
         are part of an Auto Scaling group. You can create recommendation preferences at the \
         resource level only for standalone instances.\n\
        \   \n\
        \    "]
  resource_type : resource_type;
      [@ocaml.doc
        "The target resource type of the recommendation preference to create.\n\n\
        \ The [Ec2Instance] option encompasses standalone instances and instances that are part of \
         Auto Scaling groups. The [AutoScalingGroup] option encompasses only instances that are \
         part of an Auto Scaling group.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec opt_in_required_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The account is not opted in to Compute Optimizer.\n"]

type nonrec period = int [@@ocaml.doc ""]

type nonrec dimension =
  | SAVINGS_VALUE_AFTER_DISCOUNT [@ocaml.doc ""]
  | SAVINGS_VALUE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec order = DESC [@ocaml.doc ""] | ASC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec order_by = {
  order : order option; [@ocaml.doc "The order to sort the recommendations.\n"]
  dimension : dimension option; [@ocaml.doc "The dimension values to sort the recommendations.\n"]
}
[@@ocaml.doc "Describes how the recommendations are ordered.\n"]

type nonrec operating_system = string [@@ocaml.doc ""]

type nonrec number_of_member_accounts_opted_in = int [@@ocaml.doc ""]

type nonrec number_of_invocations = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec number_of_cores = int [@@ocaml.doc ""]

type nonrec nullable_instance_type = string [@@ocaml.doc ""]

type nonrec nullable_estimated_instance_hour_reduction_percentage = float [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec mixed_instance_type = string [@@ocaml.doc ""]

type nonrec mixed_instance_types = mixed_instance_type list [@@ocaml.doc ""]

type nonrec min_size = int [@@ocaml.doc ""]

type nonrec metric_source_provider = CloudWatchAppInsights [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec metric_provider_arn = string [@@ocaml.doc ""]

type nonrec metric_source = {
  provider_arn : metric_provider_arn option;
      [@ocaml.doc " The ARN of the metric source provider. \n"]
  provider : metric_source_provider option;
      [@ocaml.doc " The name of the metric source provider. \n"]
}
[@@ocaml.doc
  " The list of metric sources required to generate recommendations for commercial software \
   licenses. \n"]

type nonrec metrics_source = metric_source list [@@ocaml.doc ""]

type nonrec message = string [@@ocaml.doc ""]

type nonrec memory_size = int [@@ocaml.doc ""]

type nonrec member_accounts_enrolled = bool [@@ocaml.doc ""]

type nonrec max_size = int [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec lower_bound_value = float [@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request exceeds a limit of the service.\n"]

type nonrec license_version = string [@@ocaml.doc ""]

type nonrec license_edition =
  | NO_LICENSE_EDITION_FOUND [@ocaml.doc ""]
  | FREE [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""]
  | ENTERPRISE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_name = SQLSERVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec license_model =
  | BRING_YOUR_OWN_LICENSE [@ocaml.doc ""]
  | LICENSE_INCLUDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_configuration = {
  metrics_source : metrics_source option;
      [@ocaml.doc
        " The list of metric sources required to generate recommendations for commercial software \
         licenses. \n"]
  license_version : license_version option;
      [@ocaml.doc " The version of the license for the application that runs on the instance. \n"]
  license_model : license_model option;
      [@ocaml.doc " The license type associated with the instance. \n"]
  license_name : license_name option;
      [@ocaml.doc " The name of the license for the application that runs on the instance. \n"]
  license_edition : license_edition option;
      [@ocaml.doc " The edition of the license for the application that runs on the instance. \n"]
  operating_system : operating_system option;
      [@ocaml.doc " The operating system of the instance. \n"]
  instance_type : instance_type option; [@ocaml.doc " The instance type used in the license. \n"]
  number_of_cores : number_of_cores option;
      [@ocaml.doc " The current number of cores associated with the instance. \n"]
}
[@@ocaml.doc " Describes the configuration of a license for an Amazon EC2 instance. \n"]

type nonrec license_finding =
  | NOT_OPTIMIZED [@ocaml.doc ""]
  | OPTIMIZED [@ocaml.doc ""]
  | INSUFFICIENT_METRICS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_finding_reason_code =
  | OPTIMIZED [@ocaml.doc ""]
  | LICENSE_OVER_PROVISIONED [@ocaml.doc ""]
  | CW_APP_INSIGHTS_ERROR [@ocaml.doc ""]
  | CW_APP_INSIGHTS_DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_finding_reason_codes = license_finding_reason_code list [@@ocaml.doc ""]

type nonrec license_recommendation_option = {
  savings_opportunity : savings_opportunity option; [@ocaml.doc ""]
  license_model : license_model option;
      [@ocaml.doc " The recommended license type associated with the instance. \n"]
  license_edition : license_edition option;
      [@ocaml.doc
        " The recommended edition of the license for the application that runs on the instance. \n"]
  operating_system : operating_system option;
      [@ocaml.doc " The operating system of a license recommendation option. \n"]
  rank : rank option;
      [@ocaml.doc
        " The rank of the license recommendation option. \n\n\
        \  The top recommendation option is ranked as [1]. \n\
        \ "]
}
[@@ocaml.doc " Describes the recommendation options for licenses. \n"]

type nonrec license_recommendation_options = license_recommendation_option list [@@ocaml.doc ""]

type nonrec license_recommendation = {
  tags : tags option; [@ocaml.doc " A list of tags assigned to an EC2 instance. \n"]
  license_recommendation_options : license_recommendation_options option;
      [@ocaml.doc " An array of objects that describe the license recommendation options. \n"]
  finding_reason_codes : license_finding_reason_codes option;
      [@ocaml.doc
        " The reason for the finding classification for an instance that runs on a license. \n\n\
        \ Finding reason codes include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Optimized] \226\128\148 All specifications of your license meet the \
         performance requirements of your workload. \n\
        \            \n\
        \             }\n\
        \        {-   [LicenseOverprovisioned] \226\128\148 A license is considered \
         over-provisioned when your license can be downgraded while still meeting the performance \
         requirements of your workload.\n\
        \            \n\
        \             }\n\
        \        {-   [InvalidCloudwatchApplicationInsights] \226\128\148 CloudWatch Application \
         Insights isn't configured properly.\n\
        \            \n\
        \             }\n\
        \        {-   [CloudwatchApplicationInsightsError] \226\128\148 There is a CloudWatch \
         Application Insights error. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  finding : license_finding option;
      [@ocaml.doc
        " The finding classification for an instance that runs on a license. \n\n\
        \ Findings include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [InsufficentMetrics] \226\128\148 When Compute Optimizer detects that your \
         CloudWatch Application Insights isn't enabled or is enabled with insufficient \
         permissions. \n\
        \            \n\
        \             }\n\
        \        {-   [NotOptimized] \226\128\148 When Compute Optimizer detects that your EC2 \
         infrastructure isn't using any of the SQL server license features you're paying for, a \
         license is considered not optimized.\n\
        \            \n\
        \             }\n\
        \        {-   [Optimized] \226\128\148 When Compute Optimizer detects that all \
         specifications of your license meet the performance requirements of your workload. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc " The timestamp of when the license recommendation was last generated. \n"]
  lookback_period_in_days : look_back_period_in_days option;
      [@ocaml.doc
        " The number of days for which utilization metrics were analyzed for an instance that runs \
         on a license. \n"]
  current_license_configuration : license_configuration option;
      [@ocaml.doc
        " An object that describes the current configuration of an instance that runs on a license. \n"]
  account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID of the license. \n"]
  resource_arn : resource_arn option;
      [@ocaml.doc " The ARN that identifies the Amazon EC2 instance. \n"]
}
[@@ocaml.doc " Describes a license recommendation for an EC2 instance. \n"]

type nonrec license_recommendations = license_recommendation list [@@ocaml.doc ""]

type nonrec license_recommendation_filter_name =
  | LICENSE_NAME [@ocaml.doc ""]
  | LICENSE_FINDING_REASON_CODE [@ocaml.doc ""]
  | LICENSE_FINDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec license_recommendation_filter = {
  values : filter_values option;
      [@ocaml.doc
        "The value of the filter.\n\n\
        \ The valid values for this parameter are as follows, depending on what you specify for \
         the [name] parameter:\n\
        \ \n\
        \  {ul\n\
        \        {-  If you specify the [name] parameter as [Finding], then specify [Optimized], \
         [NotOptimized], or [InsufficentMetrics].\n\
        \            \n\
        \             }\n\
        \        {-  If you specify the [name] parameter as [FindingReasonCode], then specify \
         [Optimized], [LicenseOverprovisioned], [InvalidCloudwatchApplicationInsights], or \
         [CloudwatchApplicationInsightsError].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : license_recommendation_filter_name option;
      [@ocaml.doc
        "The name of the filter.\n\n\
        \ Specify [Finding] to return recommendations with a specific finding classification.\n\
        \ \n\
        \  Specify [FindingReasonCode] to return recommendations with a specific finding reason \
         code.\n\
        \  \n\
        \   You can filter your license recommendations by [tag:key] and [tag-key] tags.\n\
        \   \n\
        \    A [tag:key] is a key and value combination of a tag assigned to your license \
         recommendations. Use the tag key in the filter name and the tag value as the filter \
         value. For example, to find all license recommendations that have a tag with the key of \
         [Owner] and the value of [TeamA], specify [tag:Owner] for the filter name and [TeamA] for \
         the filter value.\n\
        \    \n\
        \     A [tag-key] is the key of a tag assigned to your license recommendations. Use this \
         filter to find all of your license recommendations that have a tag with a specific key. \
         This doesn\226\128\153t consider the tag value. For example, you can find your license \
         recommendations with a tag key value of [Owner] or without any tag keys assigned.\n\
        \     "]
}
[@@ocaml.doc
  " Describes a filter that returns a more specific list of license recommendations. Use this \
   filter with the [GetLicenseRecommendation] action. \n"]

type nonrec license_recommendation_filters = license_recommendation_filter list [@@ocaml.doc ""]

type nonrec lambda_estimated_monthly_savings = {
  value : value option; [@ocaml.doc " The value of the estimated monthly savings. \n"]
  currency : currency option; [@ocaml.doc " The currency of the estimated monthly savings. \n"]
}
[@@ocaml.doc
  " Describes the estimated monthly savings possible for Lambda functions by adopting Compute \
   Optimizer recommendations. This is based on Lambda functions pricing after applying Savings \
   Plans discounts. \n"]

type nonrec lambda_savings_opportunity_after_discounts = {
  estimated_monthly_savings : lambda_estimated_monthly_savings option;
      [@ocaml.doc
        " The estimated monthly savings possible by adopting Compute Optimizer\226\128\153s Lambda \
         function recommendations. This includes any applicable Savings Plans discounts. \n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer\226\128\153s Lambda function recommendations. This includes any \
         applicable Savings Plans discounts. \n"]
}
[@@ocaml.doc
  " Describes the savings opportunity for Lambda functions recommendations after applying Savings \
   Plans discounts. \n\n\
  \ Savings opportunity represents the estimated monthly savings after applying Savings Plans \
   discounts. You can achieve this by implementing a given Compute Optimizer recommendation.\n\
  \ "]

type nonrec lambda_savings_estimation_mode_source =
  | COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | COST_EXPLORER_RIGHTSIZING [@ocaml.doc ""]
  | PUBLIC_PRICING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_savings_estimation_mode = {
  source : lambda_savings_estimation_mode_source option;
      [@ocaml.doc
        " Describes the source for calculation of savings opportunity for Lambda functions. \n"]
}
[@@ocaml.doc
  " Describes the savings estimation used for calculating savings opportunity for Lambda functions. \n"]

type nonrec lambda_function_metric_name = MEMORY [@ocaml.doc ""] | DURATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_function_metric_statistic = AVERAGE [@ocaml.doc ""] | MAXIMUM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_function_utilization_metric = {
  value : metric_value option; [@ocaml.doc "The value of the utilization metric.\n"]
  statistic : lambda_function_metric_statistic option;
      [@ocaml.doc
        "The statistic of the utilization metric.\n\n\
        \ The Compute Optimizer API, Command Line Interface (CLI), and SDKs return utilization \
         metrics using only the [Maximum] statistic, which is the highest value observed during \
         the specified period.\n\
        \ \n\
        \  The Compute Optimizer console displays graphs for some utilization metrics using the \
         [Average] statistic, which is the value of [Sum] / [SampleCount] during the specified \
         period. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html}Viewing \
         resource recommendations} in the {i Compute Optimizer User Guide}. You can also get \
         averaged utilization metric data for your resources using Amazon CloudWatch. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
         CloudWatch User Guide}.\n\
        \  "]
  name : lambda_function_metric_name option;
      [@ocaml.doc
        "The name of the utilization metric.\n\n\
        \ The following utilization metrics are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Duration] - The amount of time that your function code spends processing an \
         event.\n\
        \            \n\
        \             }\n\
        \        {-   [Memory] - The amount of memory used per invocation.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Describes a utilization metric of an Lambda function.\n"]

type nonrec lambda_function_utilization_metrics = lambda_function_utilization_metric list
[@@ocaml.doc ""]

type nonrec function_arn = string [@@ocaml.doc ""]

type nonrec function_version = string [@@ocaml.doc ""]

type nonrec lambda_function_recommendation_finding =
  | UNAVAILABLE [@ocaml.doc ""]
  | NOT_OPTIMIZED [@ocaml.doc ""]
  | OPTIMIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_function_recommendation_finding_reason_code =
  | INCONCLUSIVE [@ocaml.doc ""]
  | INSUFFICIENT_DATA [@ocaml.doc ""]
  | MEMORY_UNDER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_OVER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_function_recommendation_finding_reason_codes =
  lambda_function_recommendation_finding_reason_code list
[@@ocaml.doc ""]

type nonrec lambda_function_memory_metric_name = DURATION [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec lambda_function_memory_metric_statistic =
  | EXPECTED [@ocaml.doc ""]
  | UPPER_BOUND [@ocaml.doc ""]
  | LOWER_BOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_function_memory_projected_metric = {
  value : metric_value option; [@ocaml.doc "The values of the projected utilization metrics.\n"]
  statistic : lambda_function_memory_metric_statistic option;
      [@ocaml.doc "The statistic of the projected utilization metric.\n"]
  name : lambda_function_memory_metric_name option;
      [@ocaml.doc "The name of the projected utilization metric.\n"]
}
[@@ocaml.doc
  "Describes a projected utilization metric of an Lambda function recommendation option.\n"]

type nonrec lambda_function_memory_projected_metrics = lambda_function_memory_projected_metric list
[@@ocaml.doc ""]

type nonrec lambda_function_memory_recommendation_option = {
  savings_opportunity_after_discounts : lambda_savings_opportunity_after_discounts option;
      [@ocaml.doc
        " An object that describes the savings opportunity for the Lambda recommendation option \
         which includes Saving Plans discounts. Savings opportunity includes the estimated monthly \
         savings and percentage. \n"]
  savings_opportunity : savings_opportunity option;
      [@ocaml.doc
        "An object that describes the savings opportunity for the Lambda function recommendation \
         option. Savings opportunity includes the estimated monthly savings amount and percentage.\n"]
  projected_utilization_metrics : lambda_function_memory_projected_metrics option;
      [@ocaml.doc
        "An array of objects that describe the projected utilization metrics of the function \
         recommendation option.\n"]
  memory_size : memory_size option;
      [@ocaml.doc "The memory size, in MB, of the function recommendation option.\n"]
  rank : rank option;
      [@ocaml.doc
        "The rank of the function recommendation option.\n\n\
        \ The top recommendation option is ranked as [1].\n\
        \ "]
}
[@@ocaml.doc "Describes a recommendation option for an Lambda function.\n"]

type nonrec lambda_function_memory_recommendation_options =
  lambda_function_memory_recommendation_option list
[@@ocaml.doc ""]

type nonrec lambda_effective_recommendation_preferences = {
  savings_estimation_mode : lambda_savings_estimation_mode option;
      [@ocaml.doc
        " Describes the savings estimation mode applied for calculating savings opportunity for \
         Lambda functions. \n"]
}
[@@ocaml.doc " Describes the effective recommendation preferences for Lambda functions. \n"]

type nonrec lambda_function_recommendation = {
  tags : tags option;
      [@ocaml.doc " A list of tags assigned to your Lambda function recommendations. \n"]
  effective_recommendation_preferences : lambda_effective_recommendation_preferences option;
      [@ocaml.doc " Describes the effective recommendation preferences for Lambda functions. \n"]
  current_performance_risk : current_performance_risk option;
      [@ocaml.doc
        "The risk of the current Lambda function not meeting the performance needs of its \
         workloads. The higher the risk, the more likely the current Lambda function requires more \
         memory.\n"]
  memory_size_recommendation_options : lambda_function_memory_recommendation_options option;
      [@ocaml.doc
        "An array of objects that describe the memory configuration recommendation options for the \
         function.\n"]
  finding_reason_codes : lambda_function_recommendation_finding_reason_codes option;
      [@ocaml.doc
        "The reason for the finding classification of the function.\n\n\
        \  Functions that have a finding classification of [Optimized] don't have a finding reason \
         code.\n\
        \  \n\
        \    Finding reason codes for functions include:\n\
        \    \n\
        \     {ul\n\
        \           {-   {b  [MemoryOverprovisioned] } \226\128\148 The function is \
         over-provisioned when its memory configuration can be sized down while still meeting the \
         performance requirements of your workload. An over-provisioned function might lead to \
         unnecessary infrastructure cost. This finding reason code is part of the [NotOptimized] \
         finding classification.\n\
        \               \n\
        \                }\n\
        \           {-   {b  [MemoryUnderprovisioned] } \226\128\148 The function is \
         under-provisioned when its memory configuration doesn't meet the performance requirements \
         of the workload. An under-provisioned function might lead to poor application \
         performance. This finding reason code is part of the [NotOptimized] finding \
         classification.\n\
        \               \n\
        \                }\n\
        \           {-   {b  [InsufficientData] } \226\128\148 The function does not have \
         sufficient metric data for Compute Optimizer to generate a recommendation. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html}Supported \
         resources and requirements} in the {i Compute Optimizer User Guide}. This finding reason \
         code is part of the [Unavailable] finding classification.\n\
        \               \n\
        \                }\n\
        \           {-   {b  [Inconclusive] } \226\128\148 The function does not qualify for a \
         recommendation because Compute Optimizer cannot generate a recommendation with a high \
         degree of confidence. This finding reason code is part of the [Unavailable] finding \
         classification.\n\
        \               \n\
        \                }\n\
        \           }\n\
        \  "]
  finding : lambda_function_recommendation_finding option;
      [@ocaml.doc
        "The finding classification of the function.\n\n\
        \ Findings for functions include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [Optimized] } \226\128\148 The function is correctly provisioned to run \
         your workload based on its current configuration and its utilization history. This \
         finding classification does not include finding reason codes.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [NotOptimized] } \226\128\148 The function is performing at a higher \
         level (over-provisioned) or at a lower level (under-provisioned) than required for your \
         workload because its current configuration is not optimal. Over-provisioned resources \
         might lead to unnecessary infrastructure cost, and under-provisioned resources might lead \
         to poor application performance. This finding classification can include the \
         [MemoryUnderprovisioned] and [MemoryUnderprovisioned] finding reason codes.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [Unavailable] } \226\128\148 Compute Optimizer was unable to generate a \
         recommendation for the function. This could be because the function has not accumulated \
         sufficient metric data, or the function does not qualify for a recommendation. This \
         finding classification can include the [InsufficientData] and [Inconclusive] finding \
         reason codes.\n\
        \            \n\
        \              Functions with a finding of unavailable are not returned unless you specify \
         the [filter] parameter with a value of [Unavailable] in your \
         [GetLambdaFunctionRecommendations] request.\n\
        \              \n\
        \                }\n\
        \        }\n\
        \  "]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc "The timestamp of when the function recommendation was last generated.\n"]
  lookback_period_in_days : look_back_period_in_days option;
      [@ocaml.doc
        "The number of days for which utilization metrics were analyzed for the function.\n"]
  utilization_metrics : lambda_function_utilization_metrics option;
      [@ocaml.doc "An array of objects that describe the utilization metrics of the function.\n"]
  number_of_invocations : number_of_invocations option;
      [@ocaml.doc
        "The number of times your function code was applied during the look-back period.\n"]
  current_memory_size : memory_size option;
      [@ocaml.doc "The amount of memory, in MB, that's allocated to the current function.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the function.\n"]
  function_version : function_version option;
      [@ocaml.doc "The version number of the current function.\n"]
  function_arn : function_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the current function.\n"]
}
[@@ocaml.doc "Describes an Lambda function recommendation.\n"]

type nonrec lambda_function_recommendations = lambda_function_recommendation list [@@ocaml.doc ""]

type nonrec lambda_function_recommendation_filter_name =
  | FINDING_REASON_CODE [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lambda_function_recommendation_filter = {
  values : filter_values option;
      [@ocaml.doc
        "The value of the filter.\n\n\
        \ The valid values for this parameter are as follows, depending on what you specify for \
         the [name] parameter:\n\
        \ \n\
        \  {ul\n\
        \        {-  Specify [Optimized], [NotOptimized], or [Unavailable] if you specify the \
         [name] parameter as [Finding].\n\
        \            \n\
        \             }\n\
        \        {-  Specify [MemoryOverprovisioned], [MemoryUnderprovisioned], \
         [InsufficientData], or [Inconclusive] if you specify the [name] parameter as \
         [FindingReasonCode].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : lambda_function_recommendation_filter_name option;
      [@ocaml.doc
        "The name of the filter.\n\n\
        \ Specify [Finding] to return recommendations with a specific finding classification (for \
         example, [NotOptimized]).\n\
        \ \n\
        \  Specify [FindingReasonCode] to return recommendations with a specific finding reason \
         code (for example, [MemoryUnderprovisioned]).\n\
        \  \n\
        \   You can filter your Lambda function recommendations by [tag:key] and [tag-key] tags.\n\
        \   \n\
        \    A [tag:key] is a key and value combination of a tag assigned to your Lambda function \
         recommendations. Use the tag key in the filter name and the tag value as the filter \
         value. For example, to find all Lambda function recommendations that have a tag with the \
         key of [Owner] and the value of [TeamA], specify [tag:Owner] for the filter name and \
         [TeamA] for the filter value.\n\
        \    \n\
        \     A [tag-key] is the key of a tag assigned to your Lambda function recommendations. \
         Use this filter to find all of your Lambda function recommendations that have a tag with \
         a specific key. This doesn\226\128\153t consider the tag value. For example, you can find \
         your Lambda function recommendations with a tag key value of [Owner] or without any tag \
         keys assigned.\n\
        \     "]
}
[@@ocaml.doc
  "Describes a filter that returns a more specific list of Lambda function recommendations. Use \
   this filter with the [GetLambdaFunctionRecommendations] action.\n\n\
  \ You can use [EBSFilter] with the [GetEBSVolumeRecommendations] action, [JobFilter] with the \
   [DescribeRecommendationExportJobs] action, and [Filter] with the \
   [GetAutoScalingGroupRecommendations] and [GetEC2InstanceRecommendations] actions.\n\
  \ "]

type nonrec lambda_function_recommendation_filters = lambda_function_recommendation_filter list
[@@ocaml.doc ""]

type nonrec job_ids = job_id list [@@ocaml.doc ""]

type nonrec job_filter_name = JOB_STATUS [@ocaml.doc ""] | RESOURCE_TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec job_filter = {
  values : filter_values option;
      [@ocaml.doc
        "The value of the filter.\n\n\
        \ The valid values for this parameter are as follows, depending on what you specify for \
         the [name] parameter:\n\
        \ \n\
        \  {ul\n\
        \        {-  Specify [Ec2Instance] or [AutoScalingGroup] if you specify the [name] \
         parameter as [ResourceType]. There is no filter for EBS volumes because volume \
         recommendations cannot be exported at this time.\n\
        \            \n\
        \             }\n\
        \        {-  Specify [Queued], [InProgress], [Complete], or [Failed] if you specify the \
         [name] parameter as [JobStatus].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : job_filter_name option;
      [@ocaml.doc
        "The name of the filter.\n\n\
        \ Specify [ResourceType] to return export jobs of a specific resource type (for example, \
         [Ec2Instance]).\n\
        \ \n\
        \  Specify [JobStatus] to return export jobs with a specific status (e.g, [Complete]).\n\
        \  "]
}
[@@ocaml.doc
  "Describes a filter that returns a more specific list of recommendation export jobs. Use this \
   filter with the [DescribeRecommendationExportJobs] action.\n\n\
  \ You can use [EBSFilter] with the [GetEBSVolumeRecommendations] action, \
   [LambdaFunctionRecommendationFilter] with the [GetLambdaFunctionRecommendations] action, and \
   [Filter] with the [GetAutoScalingGroupRecommendations] and [GetEC2InstanceRecommendations] \
   actions.\n\
  \ "]

type nonrec job_filters = job_filter list [@@ocaml.doc ""]

type nonrec instance_state =
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | SHUTTING_DOWN [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_savings_estimation_mode_source =
  | COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | COST_EXPLORER_RIGHTSIZING [@ocaml.doc ""]
  | PUBLIC_PRICING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_savings_estimation_mode = {
  source : instance_savings_estimation_mode_source option;
      [@ocaml.doc
        " Describes the source for calculating the savings opportunity for Amazon EC2 instances. \n"]
}
[@@ocaml.doc
  " Describes the savings estimation mode used for calculating savings opportunity for Amazon EC2 \
   instances. \n"]

type nonrec instance_arn = string [@@ocaml.doc ""]

type nonrec instance_name = string [@@ocaml.doc ""]

type nonrec current_instance_type = string [@@ocaml.doc ""]

type nonrec instance_recommendation_finding_reason_code =
  | GPU_MEMORY_OVER_PROVISIONED [@ocaml.doc ""]
  | GPU_MEMORY_UNDER_PROVISIONED [@ocaml.doc ""]
  | GPU_OVER_PROVISIONED [@ocaml.doc ""]
  | GPU_UNDER_PROVISIONED [@ocaml.doc ""]
  | DISK_THROUGHPUT_UNDER_PROVISIONED [@ocaml.doc ""]
  | DISK_THROUGHPUT_OVER_PROVISIONED [@ocaml.doc ""]
  | DISK_IOPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | DISK_IOPS_OVER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_PPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_PPS_OVER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_BANDWIDTH_UNDER_PROVISIONED [@ocaml.doc ""]
  | NETWORK_BANDWIDTH_OVER_PROVISIONED [@ocaml.doc ""]
  | EBS_IOPS_UNDER_PROVISIONED [@ocaml.doc ""]
  | EBS_IOPS_OVER_PROVISIONED [@ocaml.doc ""]
  | EBS_THROUGHPUT_UNDER_PROVISIONED [@ocaml.doc ""]
  | EBS_THROUGHPUT_OVER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_UNDER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_OVER_PROVISIONED [@ocaml.doc ""]
  | CPU_UNDER_PROVISIONED [@ocaml.doc ""]
  | CPU_OVER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_recommendation_finding_reason_codes =
  instance_recommendation_finding_reason_code list
[@@ocaml.doc ""]

type nonrec effective_recommendation_preferences = {
  savings_estimation_mode : instance_savings_estimation_mode option;
      [@ocaml.doc
        " Describes the savings estimation mode applied for calculating savings opportunity for a \
         resource. \n"]
  preferred_resources : effective_preferred_resources option;
      [@ocaml.doc
        " The resource type values that are considered as candidates when generating rightsizing \
         recommendations. \n"]
  utilization_preferences : utilization_preferences option;
      [@ocaml.doc
        " The resource\226\128\153s CPU and memory utilization preferences, such as threshold and \
         headroom, that are used to generate rightsizing recommendations. \n\n\
        \  This preference is only available for the Amazon EC2 instance resource type.\n\
        \  \n\
        \   "]
  look_back_period : look_back_period_preference option;
      [@ocaml.doc
        " The number of days the utilization metrics of the Amazon Web Services resource are \
         analyzed. \n"]
  external_metrics_preference : external_metrics_preference option;
      [@ocaml.doc
        " An object that describes the external metrics recommendation preference. \n\n\
        \  If the preference is applied in the latest recommendation refresh, an object with a \
         valid [source] value appears in the response. If the preference isn't applied to the \
         recommendations already, then this object doesn't appear in the response. \n\
        \ "]
  inferred_workload_types : inferred_workload_types_preference option;
      [@ocaml.doc
        "Describes the activation status of the inferred workload types preference.\n\n\
        \ A status of [Active] confirms that the preference is applied in the latest \
         recommendation refresh. A status of [Inactive] confirms that it's not yet applied to \
         recommendations.\n\
        \ "]
  enhanced_infrastructure_metrics : enhanced_infrastructure_metrics option;
      [@ocaml.doc
        "Describes the activation status of the enhanced infrastructure metrics preference.\n\n\
        \ A status of [Active] confirms that the preference is applied in the latest \
         recommendation refresh, and a status of [Inactive] confirms that it's not yet applied to \
         recommendations.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Enhanced \
         infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \  "]
  cpu_vendor_architectures : cpu_vendor_architectures option;
      [@ocaml.doc
        "Describes the CPU vendor and architecture for an instance or Auto Scaling group \
         recommendations.\n\n\
        \ For example, when you specify [AWS_ARM64] with:\n\
        \ \n\
        \  {ul\n\
        \        {-  A [GetEC2InstanceRecommendations] or [GetAutoScalingGroupRecommendations] \
         request, Compute Optimizer returns recommendations that consist of Graviton instance \
         types only.\n\
        \            \n\
        \             }\n\
        \        {-  A [GetEC2RecommendationProjectedMetrics] request, Compute Optimizer returns \
         projected utilization metrics for Graviton instance type recommendations only.\n\
        \            \n\
        \             }\n\
        \        {-  A [ExportEC2InstanceRecommendations] or \
         [ExportAutoScalingGroupRecommendations] request, Compute Optimizer exports \
         recommendations that consist of Graviton instance types only.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Describes the effective recommendation preferences for a resource.\n"]

type nonrec external_metric_status_code =
  | INSUFFICIENT_INSTANA_METRICS [@ocaml.doc ""]
  | INSUFFICIENT_NEWRELIC_METRICS [@ocaml.doc ""]
  | INSUFFICIENT_DYNATRACE_METRICS [@ocaml.doc ""]
  | INSUFFICIENT_DATADOG_METRICS [@ocaml.doc ""]
  | INSTANA_INTEGRATION_ERROR [@ocaml.doc ""]
  | NEWRELIC_INTEGRATION_ERROR [@ocaml.doc ""]
  | DYNATRACE_INTEGRATION_ERROR [@ocaml.doc ""]
  | DATADOG_INTEGRATION_ERROR [@ocaml.doc ""]
  | INTEGRATION_SUCCESS [@ocaml.doc ""]
  | NO_EXTERNAL_METRIC_SET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec external_metric_status_reason = string [@@ocaml.doc ""]

type nonrec external_metric_status = {
  status_reason : external_metric_status_reason option;
      [@ocaml.doc
        " The reason for Compute Optimizer's integration status with your external metric provider. \n"]
  status_code : external_metric_status_code option;
      [@ocaml.doc
        " The status code for Compute Optimizer's integration with an external metrics provider. \n"]
}
[@@ocaml.doc
  " Describes Compute Optimizer's integration status with your chosen external metric provider. \
   For example, Datadog. \n"]

type nonrec instance_idle = FALSE [@ocaml.doc ""] | TRUE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec instance_recommendation = {
  idle : instance_idle option; [@ocaml.doc " Describes if an Amazon EC2 instance is idle. \n"]
  current_instance_gpu_info : gpu_info option;
      [@ocaml.doc " Describes the GPU accelerator settings for the current instance type. \n"]
  external_metric_status : external_metric_status option;
      [@ocaml.doc
        " An object that describes Compute Optimizer's integration status with your external \
         metrics provider. \n"]
  tags : tags option;
      [@ocaml.doc " A list of tags assigned to your Amazon EC2 instance recommendations. \n"]
  instance_state : instance_state option;
      [@ocaml.doc " The state of the instance when the recommendation was generated. \n"]
  inferred_workload_types : inferred_workload_types option;
      [@ocaml.doc
        "The applications that might be running on the instance as inferred by Compute Optimizer.\n\n\
        \ Compute Optimizer can infer if one of the following applications might be running on the \
         instance:\n\
        \ \n\
        \  {ul\n\
        \        {-   [AmazonEmr] - Infers that Amazon EMR might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [ApacheCassandra] - Infers that Apache Cassandra might be running on the \
         instance.\n\
        \            \n\
        \             }\n\
        \        {-   [ApacheHadoop] - Infers that Apache Hadoop might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [Memcached] - Infers that Memcached might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [NGINX] - Infers that NGINX might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [PostgreSql] - Infers that PostgreSQL might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [Redis] - Infers that Redis might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [Kafka] - Infers that Kafka might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [SQLServer] - Infers that SQLServer might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  effective_recommendation_preferences : effective_recommendation_preferences option;
      [@ocaml.doc
        "An object that describes the effective recommendation preferences for the instance.\n"]
  current_performance_risk : current_performance_risk option;
      [@ocaml.doc
        "The risk of the current instance not meeting the performance needs of its workloads. The \
         higher the risk, the more likely the current instance cannot meet the performance \
         requirements of its workload.\n"]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc "The timestamp of when the instance recommendation was last generated.\n"]
  recommendation_sources : recommendation_sources option;
      [@ocaml.doc "An array of objects that describe the source resource of the recommendation.\n"]
  recommendation_options : recommendation_options option;
      [@ocaml.doc
        "An array of objects that describe the recommendation options for the instance.\n"]
  look_back_period_in_days : look_back_period_in_days option;
      [@ocaml.doc
        "The number of days for which utilization metrics were analyzed for the instance.\n"]
  utilization_metrics : utilization_metrics option;
      [@ocaml.doc "An array of objects that describe the utilization metrics of the instance.\n"]
  finding_reason_codes : instance_recommendation_finding_reason_codes option;
      [@ocaml.doc
        "The reason for the finding classification of the instance.\n\n\
        \ Finding reason codes for instances include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [CPUOverprovisioned] } \226\128\148 The instance\226\128\153s CPU \
         configuration can be sized down while still meeting the performance requirements of your \
         workload. This is identified by analyzing the [CPUUtilization] metric of the current \
         instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [CPUUnderprovisioned] } \226\128\148 The instance\226\128\153s CPU \
         configuration doesn't meet the performance requirements of your workload and there is an \
         alternative instance type that provides better CPU performance. This is identified by \
         analyzing the [CPUUtilization] metric of the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [MemoryOverprovisioned] } \226\128\148 The instance\226\128\153s memory \
         configuration can be sized down while still meeting the performance requirements of your \
         workload. This is identified by analyzing the memory utilization metric of the current \
         instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [MemoryUnderprovisioned] } \226\128\148 The instance\226\128\153s memory \
         configuration doesn't meet the performance requirements of your workload and there is an \
         alternative instance type that provides better memory performance. This is identified by \
         analyzing the memory utilization metric of the current instance during the look-back \
         period.\n\
        \            \n\
        \              Memory utilization is analyzed only for resources that have the unified \
         CloudWatch agent installed on them. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
         memory utilization with the Amazon CloudWatch Agent} in the {i Compute Optimizer User \
         Guide}. On Linux instances, Compute Optimizer analyses the [mem_used_percent] metric in \
         the [CWAgent] namespace, or the legacy [MemoryUtilization] metric in the [System/Linux] \
         namespace. On Windows instances, Compute Optimizer analyses the [Memory\n\
        \                            % Committed Bytes In Use] metric in the [CWAgent] namespace.\n\
        \              \n\
        \                }\n\
        \        {-   {b  [EBSThroughputOverprovisioned] } \226\128\148 The instance\226\128\153s \
         EBS throughput configuration can be sized down while still meeting the performance \
         requirements of your workload. This is identified by analyzing the [VolumeReadBytes] and \
         [VolumeWriteBytes] metrics of EBS volumes attached to the current instance during the \
         look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [EBSThroughputUnderprovisioned] } \226\128\148 The instance\226\128\153s \
         EBS throughput configuration doesn't meet the performance requirements of your workload \
         and there is an alternative instance type that provides better EBS throughput \
         performance. This is identified by analyzing the [VolumeReadBytes] and [VolumeWriteBytes] \
         metrics of EBS volumes attached to the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [EBSIOPSOverprovisioned] } \226\128\148 The instance\226\128\153s EBS \
         IOPS configuration can be sized down while still meeting the performance requirements of \
         your workload. This is identified by analyzing the [VolumeReadOps] and [VolumeWriteOps] \
         metric of EBS volumes attached to the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [EBSIOPSUnderprovisioned] } \226\128\148 The instance\226\128\153s EBS \
         IOPS configuration doesn't meet the performance requirements of your workload and there \
         is an alternative instance type that provides better EBS IOPS performance. This is \
         identified by analyzing the [VolumeReadOps] and [VolumeWriteOps] metric of EBS volumes \
         attached to the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [NetworkBandwidthOverprovisioned] } \226\128\148 The \
         instance\226\128\153s network bandwidth configuration can be sized down while still \
         meeting the performance requirements of your workload. This is identified by analyzing \
         the [NetworkIn] and [NetworkOut] metrics of the current instance during the look-back \
         period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [NetworkBandwidthUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s network bandwidth configuration doesn't meet the performance \
         requirements of your workload and there is an alternative instance type that provides \
         better network bandwidth performance. This is identified by analyzing the [NetworkIn] and \
         [NetworkOut] metrics of the current instance during the look-back period. This finding \
         reason happens when the [NetworkIn] or [NetworkOut] performance of an instance is \
         impacted.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [NetworkPPSOverprovisioned] } \226\128\148 The instance\226\128\153s \
         network PPS (packets per second) configuration can be sized down while still meeting the \
         performance requirements of your workload. This is identified by analyzing the \
         [NetworkPacketsIn] and [NetworkPacketsIn] metrics of the current instance during the \
         look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [NetworkPPSUnderprovisioned] } \226\128\148 The instance\226\128\153s \
         network PPS (packets per second) configuration doesn't meet the performance requirements \
         of your workload and there is an alternative instance type that provides better network \
         PPS performance. This is identified by analyzing the [NetworkPacketsIn] and \
         [NetworkPacketsIn] metrics of the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DiskIOPSOverprovisioned] } \226\128\148 The instance\226\128\153s disk \
         IOPS configuration can be sized down while still meeting the performance requirements of \
         your workload. This is identified by analyzing the [DiskReadOps] and [DiskWriteOps] \
         metrics of the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DiskIOPSUnderprovisioned] } \226\128\148 The instance\226\128\153s disk \
         IOPS configuration doesn't meet the performance requirements of your workload and there \
         is an alternative instance type that provides better disk IOPS performance. This is \
         identified by analyzing the [DiskReadOps] and [DiskWriteOps] metrics of the current \
         instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DiskThroughputOverprovisioned] } \226\128\148 The instance\226\128\153s \
         disk throughput configuration can be sized down while still meeting the performance \
         requirements of your workload. This is identified by analyzing the [DiskReadBytes] and \
         [DiskWriteBytes] metrics of the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [DiskThroughputUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s disk throughput configuration doesn't meet the performance \
         requirements of your workload and there is an alternative instance type that provides \
         better disk throughput performance. This is identified by analyzing the [DiskReadBytes] \
         and [DiskWriteBytes] metrics of the current instance during the look-back period.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    For more information about instance metrics, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html}List \
         the available CloudWatch metrics for your instances} in the {i Amazon Elastic Compute \
         Cloud User Guide}. For more information about EBS volume metrics, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cloudwatch_ebs.html}Amazon \
         CloudWatch metrics for Amazon EBS} in the {i Amazon Elastic Compute Cloud User Guide}.\n\
        \    \n\
        \     "]
  finding : finding option;
      [@ocaml.doc
        "The finding classification of the instance.\n\n\
        \ Findings for instances include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [Underprovisioned] }\226\128\148An instance is considered \
         under-provisioned when at least one specification of your instance, such as CPU, memory, \
         or network, does not meet the performance requirements of your workload. \
         Under-provisioned instances may lead to poor application performance.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [Overprovisioned] }\226\128\148An instance is considered \
         over-provisioned when at least one specification of your instance, such as CPU, memory, \
         or network, can be sized down while still meeting the performance requirements of your \
         workload, and no specification is under-provisioned. Over-provisioned instances may lead \
         to unnecessary infrastructure cost.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [Optimized] }\226\128\148An instance is considered optimized when all \
         specifications of your instance, such as CPU, memory, and network, meet the performance \
         requirements of your workload and is not over provisioned. For optimized resources, \
         Compute Optimizer might recommend a new generation instance type.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    The valid values in your API responses appear as OVER_PROVISIONED, UNDER_PROVISIONED, \
         or OPTIMIZED.\n\
        \    \n\
        \     "]
  current_instance_type : current_instance_type option;
      [@ocaml.doc "The instance type of the current instance.\n"]
  instance_name : instance_name option; [@ocaml.doc "The name of the current instance.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the instance.\n"]
  instance_arn : instance_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the current instance.\n"]
}
[@@ocaml.doc "Describes an Amazon EC2 instance recommendation.\n"]

type nonrec instance_recommendations = instance_recommendation list [@@ocaml.doc ""]

type nonrec instance_arns = instance_arn list [@@ocaml.doc ""]

type nonrec idle_metric_name =
  | CURR_CONNECTIONS [@ocaml.doc ""]
  | ELASTI_CACHE_PROCESSING_UNITS [@ocaml.doc ""]
  | SET_TYPE_CMDS [@ocaml.doc ""]
  | GET_TYPE_CMDS [@ocaml.doc ""]
  | INVOCATIONS [@ocaml.doc ""]
  | USER_CONNECTED [@ocaml.doc ""]
  | IS_IDLE [@ocaml.doc ""]
  | KEYSPACE_MISSES [@ocaml.doc ""]
  | KEYSPACE_HITS [@ocaml.doc ""]
  | CACHE_MISSES [@ocaml.doc ""]
  | CACHE_HITS [@ocaml.doc ""]
  | ENGINE_CPU_UTILIZATION [@ocaml.doc ""]
  | NEW_CONNECTIONS [@ocaml.doc ""]
  | CONSUMED_CHANGE_DATA_CAPTURE_UNITS [@ocaml.doc ""]
  | CONSUMED_WRITE_CAPACITY_UNITS [@ocaml.doc ""]
  | CONSUMED_READ_CAPACITY_UNITS [@ocaml.doc ""]
  | PACKETS_IN_FROM_DESTINATION [@ocaml.doc ""]
  | PACKETS_IN_FROM_SOURCE [@ocaml.doc ""]
  | ACTIVE_CONNECTION_COUNT [@ocaml.doc ""]
  | VOLUME_WRITE_OPS_PER_SECOND [@ocaml.doc ""]
  | VOLUME_READ_OPS_PER_SECOND [@ocaml.doc ""]
  | EBS_VOLUME_WRITE_IOPS [@ocaml.doc ""]
  | EBS_VOLUME_READ_IOPS [@ocaml.doc ""]
  | DATABASE_CONNECTIONS [@ocaml.doc ""]
  | NETWORK_IN_BYTES_PER_SECOND [@ocaml.doc ""]
  | NETWORK_OUT_BYTES_PER_SECOND [@ocaml.doc ""]
  | MEMORY [@ocaml.doc ""]
  | CPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec idle_dimension_key = string [@@ocaml.doc ""]

type nonrec idle_dimension_value = string [@@ocaml.doc ""]

type nonrec idle_dimension_values = idle_dimension_value list [@@ocaml.doc ""]

type nonrec idle_dimension = {
  values : idle_dimension_values option; [@ocaml.doc "The value of the dimension.\n"]
  key : idle_dimension_key option; [@ocaml.doc "The name of the dimension key.\n"]
}
[@@ocaml.doc "Describes the dimension of an idle resource utilization metric.\n"]

type nonrec idle_dimensions = idle_dimension list [@@ocaml.doc ""]

type nonrec idle_utilization_metric = {
  dimensions : idle_dimensions option; [@ocaml.doc "The dimensions of the utilization metric.\n"]
  value : metric_value option; [@ocaml.doc "The value of the utilization metric.\n"]
  statistic : metric_statistic option;
      [@ocaml.doc
        " The statistic of the utilization metric. \n\n\
        \ The Compute Optimizer API, Command Line Interface (CLI), and SDKs return utilization \
         metrics using only the [Maximum] statistic, which is the highest value observed during \
         the specified period.\n\
        \ \n\
        \  The Compute Optimizer console displays graphs for some utilization metrics using the \
         [Average] statistic, which is the value of [Sum] / [SampleCount] during the specified \
         period. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html}Viewing \
         resource recommendations} in the {i Compute Optimizer User Guide}. You can also get \
         averaged utilization metric data for your resources using Amazon CloudWatch. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
         CloudWatch User Guide}.\n\
        \  "]
  name : idle_metric_name option; [@ocaml.doc "The name of the utilization metric.\n"]
}
[@@ocaml.doc "Describes the utilization metric of an idle resource.\n"]

type nonrec idle_utilization_metrics = idle_utilization_metric list [@@ocaml.doc ""]

type nonrec idle_estimated_monthly_savings = {
  value : value option;
      [@ocaml.doc "The value of the estimated monthly savings for Idle resources.\n"]
  currency : currency option; [@ocaml.doc "The currency of the estimated monthly savings.\n"]
}
[@@ocaml.doc
  "Describes the estimated monthly savings possible for idle resources by adopting Compute \
   Optimizer recommendations.\n"]

type nonrec idle_savings_opportunity_after_discounts = {
  estimated_monthly_savings : idle_estimated_monthly_savings option;
      [@ocaml.doc
        "The estimated monthly savings possible by adopting Compute Optimizer's idle resource \
         recommendations. This includes any applicable discounts.\n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        "The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer's idle resource recommendations. This includes any applicable discounts.\n"]
}
[@@ocaml.doc
  "Describes the savings opportunity for idle resource recommendations after applying discounts.\n\n\
  \ Savings opportunity represents the estimated monthly savings after applying discounts. You can \
   achieve this by implementing a given Compute Optimizer recommendation.\n\
  \ "]

type nonrec idle_savings_opportunity = {
  estimated_monthly_savings : idle_estimated_monthly_savings option;
      [@ocaml.doc
        "The estimated monthly savings possible by adopting Compute Optimizer's idle resource \
         recommendations.\n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        "The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer's idle resource recommendations.\n"]
}
[@@ocaml.doc "Describes the savings opportunity for idle resource recommendations.\n"]

type nonrec idle_recommendation_resource_type =
  | SAGE_MAKER_ENDPOINT [@ocaml.doc ""]
  | WORKSPACES [@ocaml.doc ""]
  | DOCUMENT_DB_CLUSTER [@ocaml.doc ""]
  | MEMORY_DB_CLUSTER [@ocaml.doc ""]
  | ELASTI_CACHE_CLUSTER [@ocaml.doc ""]
  | DYNAMO_DB_TABLE [@ocaml.doc ""]
  | NAT_GATEWAY [@ocaml.doc ""]
  | RDS_DB_INSTANCE [@ocaml.doc ""]
  | ECS_SERVICE [@ocaml.doc ""]
  | EBS_VOLUME [@ocaml.doc ""]
  | AUTO_SCALING_GROUP [@ocaml.doc ""]
  | EC2_INSTANCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec idle_finding_description = string [@@ocaml.doc ""]

type nonrec idle_recommendation = {
  tags : tags option;
      [@ocaml.doc "A list of tags assigned to your idle resource recommendations.\n"]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc "The timestamp of when the idle resource recommendation was last generated.\n"]
  look_back_period_in_days : look_back_period_in_days option;
      [@ocaml.doc "The number of days the idle resource utilization metrics were analyzed.\n"]
  utilization_metrics : idle_utilization_metrics option;
      [@ocaml.doc
        "An array of objects that describe the utilization metrics of the idle resource.\n"]
  savings_opportunity_after_discounts : idle_savings_opportunity_after_discounts option;
      [@ocaml.doc "The savings opportunity for the idle resource after any applying discounts.\n"]
  savings_opportunity : idle_savings_opportunity option;
      [@ocaml.doc "The savings opportunity for the idle resource.\n"]
  finding_description : idle_finding_description option;
      [@ocaml.doc "A summary of the findings for the resource.\n"]
  finding : idle_finding option; [@ocaml.doc "The finding classification of an idle resource.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the idle resource.\n"]
  resource_type : idle_recommendation_resource_type option;
      [@ocaml.doc "The type of resource that is idle.\n"]
  resource_id : resource_id option; [@ocaml.doc "The unique identifier for the resource.\n"]
  resource_arn : resource_arn option; [@ocaml.doc "The ARN of the current idle resource.\n"]
}
[@@ocaml.doc "Describes an Idle resource recommendation.\n"]

type nonrec idle_recommendations = idle_recommendation list [@@ocaml.doc ""]

type nonrec idle_recommendation_filter_name =
  | RESOURCE_TYPE [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec idle_recommendation_filter = {
  values : filter_values option; [@ocaml.doc "The value of the filter.\n"]
  name : idle_recommendation_filter_name option;
      [@ocaml.doc
        " The name of the filter. \n\n\
        \  Specify [Finding] to return recommendations with a specific finding classification. \n\
        \ \n\
        \  You can filter your idle resource recommendations by [tag:key] and [tag-key] tags.\n\
        \  \n\
        \   A [tag:key] is a key and value combination of a tag assigned to your idle resource \
         recommendations. Use the tag key in the filter name and the tag value as the filter \
         value. For example, to find all idle resource service recommendations that have a tag \
         with the key of [Owner] and the value of [TeamA], specify [tag:Owner] for the filter name \
         and [TeamA] for the filter value.\n\
        \   \n\
        \    A [tag-key] is the key of a tag assigned to your idle resource recommendations. Use \
         this filter to find all of your idle resource recommendations that have a tag with a \
         specific key. This doesn\226\128\153t consider the tag value. For example, you can find \
         your idle resource service recommendations with a tag key value of [Owner] or without any \
         tag keys assigned.\n\
        \    "]
}
[@@ocaml.doc
  "Describes a filter that returns a more specific list of idle resource recommendations.\n"]

type nonrec idle_recommendation_filters = idle_recommendation_filter list [@@ocaml.doc ""]

type nonrec identifier = string [@@ocaml.doc ""]

type nonrec code = string [@@ocaml.doc ""]

type nonrec idle_recommendation_error = {
  resource_type : idle_recommendation_resource_type option;
      [@ocaml.doc "The type of resource associated with the error.\n"]
  message : message option; [@ocaml.doc "The error message.\n"]
  code : code option; [@ocaml.doc "The error code.\n"]
  identifier : identifier option; [@ocaml.doc "The ID of the error.\n"]
}
[@@ocaml.doc "Returns of list of resources that doesn't have idle recommendations.\n"]

type nonrec idle_recommendation_errors = idle_recommendation_error list [@@ocaml.doc ""]

type nonrec idle_max_results = int [@@ocaml.doc ""]

type nonrec get_recommendation_summaries_response = {
  recommendation_summaries : recommendation_summaries option;
      [@ocaml.doc "An array of objects that summarize a recommendation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of recommendation summaries.\n\n\
        \ This value is null when there are no more pages of recommendation summaries to return.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec account_ids = account_id list [@@ocaml.doc ""]

type nonrec get_recommendation_summaries_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of recommendation summaries to return with a single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of recommendation summaries.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account for which to return recommendation summaries.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to return recommendation summaries.\n\
        \ \n\
        \  Only one account ID can be specified per request.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_recommendation_preferences_response = {
  recommendation_preferences_details : recommendation_preferences_details option;
      [@ocaml.doc "An array of objects that describe recommendation preferences.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of recommendation preferences.\n\n\
        \ This value is null when there are no more pages of recommendation preferences to return.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_recommendation_preferences_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of recommendation preferences to return with a single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of recommendation preferences.\n"]
  scope : scope option;
      [@ocaml.doc
        "An object that describes the scope of the recommendation preference to return.\n\n\
        \ You can return recommendation preferences that are created at the organization level \
         (for management accounts of an organization only), account level, and resource level. For \
         more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
         enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \ "]
  resource_type : resource_type;
      [@ocaml.doc
        "The target resource type of the recommendation preference for which to return \
         preferences.\n\n\
        \ The [Ec2Instance] option encompasses standalone instances and instances that are part of \
         Auto Scaling groups. The [AutoScalingGroup] option encompasses only instances that are \
         part of an Auto Scaling group.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_recommendation_error = {
  message : message option; [@ocaml.doc "The message, or reason, for the error.\n"]
  code : code option; [@ocaml.doc "The error code.\n"]
  identifier : identifier option; [@ocaml.doc "The ID of the error.\n"]
}
[@@ocaml.doc
  "Describes an error experienced when getting recommendations.\n\n\
  \ For example, an error is returned if you request recommendations for an unsupported Auto \
   Scaling group, or if you request recommendations for an instance of an unsupported instance \
   family.\n\
  \ "]

type nonrec get_recommendation_errors = get_recommendation_error list [@@ocaml.doc ""]

type nonrec get_rds_database_recommendations_response = {
  errors : get_recommendation_errors option;
      [@ocaml.doc " An array of objects that describe errors of the request. \n"]
  rds_db_recommendations : rdsdb_recommendations option;
      [@ocaml.doc
        " An array of objects that describe the Amazon Aurora and RDS database recommendations. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to advance to the next page of Amazon Aurora and RDS database recommendations. \n"]
}
[@@ocaml.doc ""]

type nonrec get_rds_database_recommendations_request = {
  recommendation_preferences : recommendation_preferences option; [@ocaml.doc ""]
  account_ids : account_ids option;
      [@ocaml.doc
        " Return the Amazon Aurora and RDS database recommendations to the specified Amazon Web \
         Services account IDs. \n\n\
        \ If your account is the management account or the delegated administrator of an \
         organization, use this parameter to return the Amazon Aurora and RDS database \
         recommendations to specific member accounts.\n\
        \ \n\
        \  You can only specify one account ID per request.\n\
        \  "]
  filters : rdsdb_recommendation_filters option;
      [@ocaml.doc
        " An array of objects to specify a filter that returns a more specific list of Amazon \
         Aurora and RDS database recommendations. \n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of Amazon Aurora and RDS database recommendations to return with a \
         single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        " The token to advance to the next page of Amazon Aurora and RDS database recommendations. \n"]
  resource_arns : resource_arns option;
      [@ocaml.doc
        " The ARN that identifies the Amazon Aurora or RDS database. \n\n\
        \  The following is the format of the ARN: \n\
        \ \n\
        \   [arn:aws:rds:{region}:{accountId}:db:{resourceName}] \n\
        \  \n\
        \    The following is the format of a DB Cluster ARN: \n\
        \   \n\
        \     [arn:aws:rds:{region}:{accountId}:cluster:{resourceName}] \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec get_rds_database_recommendation_projected_metrics_response = {
  recommended_option_projected_metrics : rds_database_recommended_option_projected_metrics option;
      [@ocaml.doc " An array of objects that describes the projected metrics. \n"]
}
[@@ocaml.doc ""]

type nonrec get_rds_database_recommendation_projected_metrics_request = {
  recommendation_preferences : recommendation_preferences option; [@ocaml.doc ""]
  end_time : timestamp;
      [@ocaml.doc " The timestamp of the last projected metrics data point to return. \n"]
  start_time : timestamp;
      [@ocaml.doc " The timestamp of the first projected metrics data point to return. \n"]
  period : period;
      [@ocaml.doc " The granularity, in seconds, of the projected metrics data points. \n"]
  stat : metric_statistic; [@ocaml.doc " The statistic of the projected metrics. \n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        " The ARN that identifies the Amazon Aurora or RDS database. \n\n\
        \  The following is the format of the ARN: \n\
        \ \n\
        \   [arn:aws:rds:{region}:{accountId}:db:{resourceName}] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_license_recommendations_response = {
  errors : get_recommendation_errors option;
      [@ocaml.doc " An array of objects that describe errors of the request. \n"]
  license_recommendations : license_recommendations option;
      [@ocaml.doc " An array of objects that describe license recommendations. \n"]
  next_token : next_token option;
      [@ocaml.doc " The token to use to advance to the next page of license recommendations. \n"]
}
[@@ocaml.doc ""]

type nonrec get_license_recommendations_request = {
  account_ids : account_ids option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account for which to return license recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to return license recommendations.\n\
        \ \n\
        \  Only one account ID can be specified per request.\n\
        \  "]
  filters : license_recommendation_filters option;
      [@ocaml.doc
        " An array of objects to specify a filter that returns a more specific list of license \
         recommendations. \n"]
  max_results : max_results option;
      [@ocaml.doc
        " The maximum number of license recommendations to return with a single request. \n\n\
        \  To retrieve the remaining results, make another request with the returned [nextToken] \
         value. \n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc " The token to advance to the next page of license recommendations. \n"]
  resource_arns : resource_arns option;
      [@ocaml.doc
        " The ARN that identifies the Amazon EC2 instance. \n\n\
        \  The following is the format of the ARN: \n\
        \ \n\
        \   [arn:aws:ec2:region:aws_account_id:instance/instance-id] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_lambda_function_recommendations_response = {
  lambda_function_recommendations : lambda_function_recommendations option;
      [@ocaml.doc "An array of objects that describe function recommendations.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of function recommendations.\n\n\
        \ This value is null when there are no more pages of function recommendations to return.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec function_arns = function_arn list [@@ocaml.doc ""]

type nonrec get_lambda_function_recommendations_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of function recommendations to return with a single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of function recommendations.\n"]
  filters : lambda_function_recommendation_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that returns a more specific list of function \
         recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account for which to return function recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to return function recommendations.\n\
        \ \n\
        \  Only one account ID can be specified per request.\n\
        \  "]
  function_arns : function_arns option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the functions for which to return recommendations.\n\n\
        \ You can specify a qualified or unqualified ARN. If you specify an unqualified ARN \
         without a function version suffix, Compute Optimizer will return recommendations for the \
         latest ([$LATEST]) version of the function. If you specify a qualified ARN with a version \
         suffix, Compute Optimizer will return recommendations for the specified function version. \
         For more information about using function versions, see \
         {{:https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html#versioning-versions-using}Using \
         versions} in the {i Lambda Developer Guide}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_idle_recommendations_response = {
  errors : idle_recommendation_errors option;
      [@ocaml.doc "An array of objects that describe errors of the request.\n"]
  idle_recommendations : idle_recommendations option;
      [@ocaml.doc "An array of objects that describe the idle resource recommendations.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of idle resource recommendations.\n"]
}
[@@ocaml.doc ""]

type nonrec get_idle_recommendations_request = {
  order_by : order_by option; [@ocaml.doc "The order to sort the idle resource recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "Return the idle resource recommendations to the specified Amazon Web Services account \
         IDs.\n\n\
        \ If your account is the management account or the delegated administrator of an \
         organization, use this parameter to return the idle resource recommendations to specific \
         member accounts.\n\
        \ \n\
        \  You can only specify one account ID per request.\n\
        \  "]
  filters : idle_recommendation_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that returns a more specific list of idle \
         resource recommendations.\n"]
  max_results : idle_max_results option;
      [@ocaml.doc
        "The maximum number of idle resource recommendations to return with a single request. \n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of idle resource recommendations.\n"]
  resource_arns : resource_arns option; [@ocaml.doc "The ARN that identifies the idle resource.\n"]
}
[@@ocaml.doc ""]

type nonrec account_enrollment_status = {
  last_updated_timestamp : last_updated_timestamp option;
      [@ocaml.doc
        "The Unix epoch timestamp, in seconds, of when the account enrollment status was last \
         updated.\n"]
  status_reason : status_reason option;
      [@ocaml.doc
        "The reason for the account enrollment status.\n\n\
        \ For example, an account might show a status of [Pending] because member accounts of an \
         organization require more time to be enrolled in the service.\n\
        \ "]
  status : status option; [@ocaml.doc "The account enrollment status.\n"]
  account_id : account_id option; [@ocaml.doc "The Amazon Web Services account ID.\n"]
}
[@@ocaml.doc
  "Describes the enrollment status of an organization's member accounts in Compute Optimizer.\n"]

type nonrec account_enrollment_statuses = account_enrollment_status list [@@ocaml.doc ""]

type nonrec get_enrollment_statuses_for_organization_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of account enrollment statuses.\n\n\
        \ This value is null when there are no more pages of account enrollment statuses to return.\n\
        \ "]
  account_enrollment_statuses : account_enrollment_statuses option;
      [@ocaml.doc
        "An array of objects that describe the enrollment statuses of organization member accounts.\n"]
}
[@@ocaml.doc ""]

type nonrec enrollment_filter_name = STATUS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec enrollment_filter = {
  values : filter_values option;
      [@ocaml.doc
        "The value of the filter.\n\n\
        \ The valid values are [Active], [Inactive], [Pending], and [Failed].\n\
        \ "]
  name : enrollment_filter_name option;
      [@ocaml.doc
        "The name of the filter.\n\n\
        \ Specify [Status] to return accounts with a specific enrollment status (for example, \
         [Active]).\n\
        \ "]
}
[@@ocaml.doc
  "Describes a filter that returns a more specific list of account enrollment statuses. Use this \
   filter with the [GetEnrollmentStatusesForOrganization] action.\n"]

type nonrec enrollment_filters = enrollment_filter list [@@ocaml.doc ""]

type nonrec get_enrollment_statuses_for_organization_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of account enrollment statuses to return with a single request. You \
         can specify up to 100 statuses to return with each request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of account enrollment statuses.\n"]
  filters : enrollment_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that returns a more specific list of account \
         enrollment statuses.\n"]
}
[@@ocaml.doc ""]

type nonrec get_enrollment_status_response = {
  number_of_member_accounts_opted_in : number_of_member_accounts_opted_in option;
      [@ocaml.doc
        "The count of organization member accounts that are opted in to the service, if your \
         account is an organization management account.\n"]
  last_updated_timestamp : last_updated_timestamp option;
      [@ocaml.doc
        "The Unix epoch timestamp, in seconds, of when the account enrollment status was last \
         updated.\n"]
  member_accounts_enrolled : member_accounts_enrolled option;
      [@ocaml.doc
        "Confirms the enrollment status of member accounts of the organization, if the account is \
         a management account of an organization.\n"]
  status_reason : status_reason option;
      [@ocaml.doc
        "The reason for the enrollment status of the account.\n\n\
        \ For example, an account might show a status of [Pending] because member accounts of an \
         organization require more time to be enrolled in the service.\n\
        \ "]
  status : status option; [@ocaml.doc "The enrollment status of the account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_enrollment_status_request = unit [@@ocaml.doc ""]

type nonrec get_effective_recommendation_preferences_response = {
  preferred_resources : effective_preferred_resources option;
      [@ocaml.doc
        " The resource type values that are considered as candidates when generating rightsizing \
         recommendations. This object resolves any wildcard expressions and returns the effective \
         list of candidate resource type values. It also considers all applicable preferences that \
         you set at the resource, account, and organization level. \n\n\
        \ To validate that the preference is applied to your last generated set of \
         recommendations, review the [effectiveRecommendationPreferences] value in the response of \
         the GetAutoScalingGroupRecommendations or GetEC2InstanceRecommendations actions.\n\
        \ "]
  utilization_preferences : utilization_preferences option;
      [@ocaml.doc
        " The resource\226\128\153s CPU and memory utilization preferences, such as threshold and \
         headroom, that were used to generate rightsizing recommendations. It considers all \
         applicable preferences that you set at the resource, account, and organization level. \n\n\
        \ To validate that the preference is applied to your last generated set of \
         recommendations, review the [effectiveRecommendationPreferences] value in the response of \
         the GetAutoScalingGroupRecommendations or GetEC2InstanceRecommendations actions.\n\
        \ "]
  look_back_period : look_back_period_preference option;
      [@ocaml.doc
        " The number of days the utilization metrics of the Amazon Web Services resource are \
         analyzed. \n\n\
        \ To validate that the preference is applied to your last generated set of \
         recommendations, review the [effectiveRecommendationPreferences] value in the response of \
         the GetAutoScalingGroupRecommendations, GetEC2InstanceRecommendations, \
         GetEBSVolumeRecommendations, GetECSServiceRecommendations, or \
         GetRDSDatabaseRecommendations actions.\n\
        \ "]
  external_metrics_preference : external_metrics_preference option;
      [@ocaml.doc
        "The provider of the external metrics recommendation preference. Considers all applicable \
         preferences that you might have set at the account and organization level.\n\n\
        \ If the preference is applied in the latest recommendation refresh, an object with a \
         valid [source] value appears in the response. If the preference isn't applied to the \
         recommendations already, then this object doesn't appear in the response.\n\
        \ \n\
        \  To validate whether the preference is applied to your last generated set of \
         recommendations, review the [effectiveRecommendationPreferences] value in the response of \
         the [GetEC2InstanceRecommendations] actions.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/external-metrics-ingestion.html}Enhanced \
         infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \   "]
  enhanced_infrastructure_metrics : enhanced_infrastructure_metrics option;
      [@ocaml.doc
        "The status of the enhanced infrastructure metrics recommendation preference. Considers \
         all applicable preferences that you might have set at the resource, account, and \
         organization level.\n\n\
        \ A status of [Active] confirms that the preference is applied in the latest \
         recommendation refresh, and a status of [Inactive] confirms that it's not yet applied to \
         recommendations.\n\
        \ \n\
        \  To validate whether the preference is applied to your last generated set of \
         recommendations, review the [effectiveRecommendationPreferences] value in the response of \
         the [GetAutoScalingGroupRecommendations] and [GetEC2InstanceRecommendations] actions.\n\
        \  \n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Enhanced \
         infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_effective_recommendation_preferences_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which to confirm effective \
         recommendation preferences. Only EC2 instance and Auto Scaling group ARNs are currently \
         supported.\n"]
}
[@@ocaml.doc ""]

type nonrec ecs_service_metric_name = MEMORY [@ocaml.doc ""] | CPU [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_service_metric_statistic = AVERAGE [@ocaml.doc ""] | MAXIMUM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_service_utilization_metric = {
  value : metric_value option; [@ocaml.doc " The value of the utilization metric. \n"]
  statistic : ecs_service_metric_statistic option;
      [@ocaml.doc
        "The statistic of the utilization metric.\n\n\
        \ The Compute Optimizer API, Command Line Interface (CLI), and SDKs return utilization \
         metrics using only the [Maximum] statistic, which is the highest value observed during \
         the specified period.\n\
        \ \n\
        \  The Compute Optimizer console displays graphs for some utilization metrics using the \
         [Average] statistic, which is the value of [Sum] / [SampleCount] during the specified \
         period. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html}Viewing \
         resource recommendations} in the {i Compute Optimizer User Guide}. You can also get \
         averaged utilization metric data for your resources using Amazon CloudWatch. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
         CloudWatch User Guide}.\n\
        \  "]
  name : ecs_service_metric_name option;
      [@ocaml.doc
        " The name of the utilization metric. \n\n\
        \ The following utilization metrics are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Cpu] \226\128\148 The amount of CPU capacity that's used in the service.\n\
        \            \n\
        \             }\n\
        \        {-   [Memory] \226\128\148 The amount of memory that's used in the service.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  " Describes the utilization metric of an Amazon ECS service. \n\n\
  \ To determine the performance difference between your current Amazon ECS service and the \
   recommended option, compare the utilization metric data of your service against its projected \
   utilization metric data.\n\
  \ "]

type nonrec ecs_service_utilization_metrics = ecs_service_utilization_metric list [@@ocaml.doc ""]

type nonrec ecs_service_launch_type = FARGATE [@ocaml.doc ""] | EC2 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_service_recommendation_finding =
  | OVER_PROVISIONED [@ocaml.doc ""]
  | UNDER_PROVISIONED [@ocaml.doc ""]
  | OPTIMIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_service_recommendation_finding_reason_code =
  | CPU_UNDER_PROVISIONED [@ocaml.doc ""]
  | CPU_OVER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_UNDER_PROVISIONED [@ocaml.doc ""]
  | MEMORY_OVER_PROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_service_recommendation_finding_reason_codes =
  ecs_service_recommendation_finding_reason_code list
[@@ocaml.doc ""]

type nonrec ecs_estimated_monthly_savings = {
  value : value option;
      [@ocaml.doc " The value of the estimated monthly savings for Amazon ECS services. \n"]
  currency : currency option; [@ocaml.doc " The currency of the estimated monthly savings. \n"]
}
[@@ocaml.doc
  " Describes the estimated monthly savings possible for Amazon ECS services by adopting Compute \
   Optimizer recommendations. This is based on Amazon ECS service pricing after applying Savings \
   Plans discounts. \n"]

type nonrec ecs_savings_opportunity_after_discounts = {
  estimated_monthly_savings : ecs_estimated_monthly_savings option;
      [@ocaml.doc
        " The estimated monthly savings possible by adopting Compute Optimizer\226\128\153s Amazon \
         ECS service recommendations. This includes any applicable Savings Plans discounts. \n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost by adopting \
         Compute Optimizer\226\128\153s Amazon ECS service recommendations. This includes any \
         applicable Savings Plans discounts. \n"]
}
[@@ocaml.doc
  " Describes the savings opportunity for Amazon ECS service recommendations after applying \
   Savings Plans discounts. \n\n\
  \ Savings opportunity represents the estimated monthly savings after applying Savings Plans \
   discounts. You can achieve this by implementing a given Compute Optimizer recommendation.\n\
  \ "]

type nonrec ecs_service_projected_utilization_metric = {
  upper_bound_value : upper_bound_value option;
      [@ocaml.doc " The upper bound values for the projected utilization metrics. \n"]
  lower_bound_value : lower_bound_value option;
      [@ocaml.doc " The lower bound values for the projected utilization metrics. \n"]
  statistic : ecs_service_metric_statistic option;
      [@ocaml.doc
        "The statistic of the projected utilization metric.\n\n\
        \ The Compute Optimizer API, Command Line Interface (CLI), and SDKs return utilization \
         metrics using only the [Maximum] statistic, which is the highest value observed during \
         the specified period.\n\
        \ \n\
        \  The Compute Optimizer console displays graphs for some utilization metrics using the \
         [Average] statistic, which is the value of [Sum] / [SampleCount] during the specified \
         period. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html}Viewing \
         resource recommendations} in the {i Compute Optimizer User Guide}. You can also get \
         averaged utilization metric data for your resources using Amazon CloudWatch. For more \
         information, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html}Amazon \
         CloudWatch User Guide}.\n\
        \  "]
  name : ecs_service_metric_name option;
      [@ocaml.doc
        " The name of the projected utilization metric. \n\n\
        \ The following utilization metrics are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Cpu] \226\128\148 The percentage of allocated compute units that are \
         currently in use on the service tasks.\n\
        \            \n\
        \             }\n\
        \        {-   [Memory] \226\128\148 The percentage of memory that's currently in use on \
         the service tasks.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  " Describes the projected utilization metrics of an Amazon ECS service recommendation option. \n\n\
  \ To determine the performance difference between your current Amazon ECS service and the \
   recommended option, compare the utilization metric data of your service against its projected \
   utilization metric data.\n\
  \ "]

type nonrec ecs_service_projected_utilization_metrics =
  ecs_service_projected_utilization_metric list
[@@ocaml.doc ""]

type nonrec container_recommendation = {
  cpu : nullable_cpu option;
      [@ocaml.doc " The recommended number of CPU units reserved for the container. \n"]
  memory_size_configuration : memory_size_configuration option;
      [@ocaml.doc " The recommended memory size configurations for the container. \n"]
  container_name : container_name option; [@ocaml.doc " The name of the container. \n"]
}
[@@ocaml.doc
  " The CPU and memory recommendations for a container within the tasks of your Amazon ECS service. \n"]

type nonrec container_recommendations = container_recommendation list [@@ocaml.doc ""]

type nonrec ecs_service_recommendation_option = {
  container_recommendations : container_recommendations option;
      [@ocaml.doc
        " The CPU and memory size recommendations for the containers within the task of your \
         Amazon ECS service. \n"]
  projected_utilization_metrics : ecs_service_projected_utilization_metrics option;
      [@ocaml.doc
        " An array of objects that describe the projected utilization metrics of the Amazon ECS \
         service recommendation option. \n"]
  savings_opportunity_after_discounts : ecs_savings_opportunity_after_discounts option;
      [@ocaml.doc
        " Describes the savings opportunity for Amazon ECS service recommendations or for the \
         recommendation option. \n\n\
        \ Savings opportunity represents the estimated monthly savings after applying Savings \
         Plans discounts. You can achieve this by implementing a given Compute Optimizer \
         recommendation.\n\
        \ "]
  savings_opportunity : savings_opportunity option; [@ocaml.doc ""]
  cpu : nullable_cpu option;
      [@ocaml.doc " The CPU size of the Amazon ECS service recommendation option. \n"]
  memory : nullable_memory option;
      [@ocaml.doc " The memory size of the Amazon ECS service recommendation option. \n"]
}
[@@ocaml.doc " Describes the recommendation options for an Amazon ECS service. \n"]

type nonrec ecs_service_recommendation_options = ecs_service_recommendation_option list
[@@ocaml.doc ""]

type nonrec ecs_savings_estimation_mode_source =
  | COST_OPTIMIZATION_HUB [@ocaml.doc ""]
  | COST_EXPLORER_RIGHTSIZING [@ocaml.doc ""]
  | PUBLIC_PRICING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_savings_estimation_mode = {
  source : ecs_savings_estimation_mode_source option;
      [@ocaml.doc
        " Describes the source for calculating the savings opportunity for Amazon ECS services. \n"]
}
[@@ocaml.doc
  " Describes the savings estimation mode used for calculating savings opportunity for Amazon ECS \
   services. \n"]

type nonrec ecs_effective_recommendation_preferences = {
  look_back_period : look_back_period_preference option;
      [@ocaml.doc
        " The number of days the Amazon ECS service utilization metrics were analyzed. \n"]
  savings_estimation_mode : ecs_savings_estimation_mode option;
      [@ocaml.doc
        " Describes the savings estimation mode preference applied for calculating savings \
         opportunity for Amazon ECS services. \n"]
}
[@@ocaml.doc " Describes the effective recommendation preferences for Amazon ECS services. \n"]

type nonrec ecs_service_recommendation = {
  tags : tags option;
      [@ocaml.doc " A list of tags assigned to your Amazon ECS service recommendations. \n"]
  effective_recommendation_preferences : ecs_effective_recommendation_preferences option;
      [@ocaml.doc " Describes the effective recommendation preferences for Amazon ECS services. \n"]
  current_performance_risk : current_performance_risk option;
      [@ocaml.doc
        " The risk of the current Amazon ECS service not meeting the performance needs of its \
         workloads. The higher the risk, the more likely the current service can't meet the \
         performance requirements of its workload. \n"]
  service_recommendation_options : ecs_service_recommendation_options option;
      [@ocaml.doc
        " An array of objects that describe the recommendation options for the Amazon ECS service. \n"]
  finding_reason_codes : ecs_service_recommendation_finding_reason_codes option;
      [@ocaml.doc
        " The reason for the finding classification of an Amazon ECS service. \n\n\
        \ Finding reason codes for Amazon ECS services include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [CPUUnderprovisioned] } \226\128\148 The service CPU configuration can \
         be sized up to enhance the performance of your workload. This is identified by analyzing \
         the [CPUUtilization] metric of the current service during the look-back period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [CPUOverprovisioned] } \226\128\148 The service CPU configuration can be \
         sized down while still meeting the performance requirements of your workload. This is \
         identified by analyzing the [CPUUtilization] metric of the current service during the \
         look-back period. \n\
        \            \n\
        \             }\n\
        \        {-   {b  [MemoryUnderprovisioned] } \226\128\148 The service memory configuration \
         can be sized up to enhance the performance of your workload. This is identified by \
         analyzing the [MemoryUtilization] metric of the current service during the look-back \
         period.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [MemoryOverprovisioned] } \226\128\148 The service memory configuration \
         can be sized down while still meeting the performance requirements of your workload. This \
         is identified by analyzing the [MemoryUtilization] metric of the current service during \
         the look-back period.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  finding : ecs_service_recommendation_finding option;
      [@ocaml.doc
        " The finding classification of an Amazon ECS service. \n\n\
        \ Findings for Amazon ECS services include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [Underprovisioned] } \226\128\148 When Compute Optimizer detects that \
         there\226\128\153s not enough memory or CPU, an Amazon ECS service is considered \
         under-provisioned. An under-provisioned service might result in poor application \
         performance.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [Overprovisioned] } \226\128\148 When Compute Optimizer detects that \
         there\226\128\153s excessive memory or CPU, an Amazon ECS service is considered \
         over-provisioned. An over-provisioned service might result in additional infrastructure \
         costs. \n\
        \            \n\
        \             }\n\
        \        {-   {b  [Optimized] } \226\128\148 When both the CPU and memory of your Amazon \
         ECS service meet the performance requirements of your workload, the service is considered \
         optimized.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc
        " The timestamp of when the Amazon ECS service recommendation was last generated. \n"]
  launch_type : ecs_service_launch_type option;
      [@ocaml.doc
        " The launch type the Amazon ECS service is using. \n\n\
        \  Compute Optimizer only supports the Fargate launch type.\n\
        \  \n\
        \   "]
  lookback_period_in_days : look_back_period_in_days option;
      [@ocaml.doc
        " The number of days the Amazon ECS service utilization metrics were analyzed. \n"]
  utilization_metrics : ecs_service_utilization_metrics option;
      [@ocaml.doc
        " An array of objects that describe the utilization metrics of the Amazon ECS service. \n"]
  current_service_configuration : service_configuration option;
      [@ocaml.doc " The configuration of the current Amazon ECS service. \n"]
  account_id : account_id option;
      [@ocaml.doc " The Amazon Web Services account ID of the Amazon ECS service. \n"]
  service_arn : service_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the current Amazon ECS service. \n\n\
        \  The following is the format of the ARN: \n\
        \ \n\
        \   [arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name] \n\
        \  "]
}
[@@ocaml.doc " Describes an Amazon ECS service recommendation. \n"]

type nonrec ecs_service_recommendations = ecs_service_recommendation list [@@ocaml.doc ""]

type nonrec get_ecs_service_recommendations_response = {
  errors : get_recommendation_errors option;
      [@ocaml.doc " An array of objects that describe errors of the request. \n"]
  ecs_service_recommendations : ecs_service_recommendations option;
      [@ocaml.doc " An array of objects that describe the Amazon ECS service recommendations. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to advance to the next page of Amazon ECS service recommendations. \n"]
}
[@@ocaml.doc ""]

type nonrec ecs_service_recommendation_filter_name =
  | FINDING_REASON_CODE [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ecs_service_recommendation_filter = {
  values : filter_values option;
      [@ocaml.doc
        " The value of the filter. \n\n\
        \ The valid values for this parameter are as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-  If you specify the [name] parameter as [Finding], specify [Optimized], \
         [Underprovisioned], or [Overprovisioned].\n\
        \            \n\
        \             }\n\
        \        {-  If you specify the [name] parameter as [FindingReasonCode], specify \
         [CPUUnderprovisioned], [CPUOverprovisioned], [MemoryUnderprovisioned], or \
         [MemoryOverprovisioned].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : ecs_service_recommendation_filter_name option;
      [@ocaml.doc
        " The name of the filter. \n\n\
        \  Specify [Finding] to return recommendations with a specific finding classification. \n\
        \ \n\
        \   Specify [FindingReasonCode] to return recommendations with a specific finding reason \
         code. \n\
        \  \n\
        \   You can filter your Amazon ECS service recommendations by [tag:key] and [tag-key] tags.\n\
        \   \n\
        \    A [tag:key] is a key and value combination of a tag assigned to your Amazon ECS \
         service recommendations. Use the tag key in the filter name and the tag value as the \
         filter value. For example, to find all Amazon ECS service recommendations that have a tag \
         with the key of [Owner] and the value of [TeamA], specify [tag:Owner] for the filter name \
         and [TeamA] for the filter value.\n\
        \    \n\
        \     A [tag-key] is the key of a tag assigned to your Amazon ECS service recommendations. \
         Use this filter to find all of your Amazon ECS service recommendations that have a tag \
         with a specific key. This doesn\226\128\153t consider the tag value. For example, you can \
         find your Amazon ECS service recommendations with a tag key value of [Owner] or without \
         any tag keys assigned.\n\
        \     "]
}
[@@ocaml.doc
  " Describes a filter that returns a more specific list of Amazon ECS service recommendations. \
   Use this filter with the [GetECSServiceRecommendations] action. \n"]

type nonrec ecs_service_recommendation_filters = ecs_service_recommendation_filter list
[@@ocaml.doc ""]

type nonrec get_ecs_service_recommendations_request = {
  account_ids : account_ids option;
      [@ocaml.doc
        " Return the Amazon ECS service recommendations to the specified Amazon Web Services \
         account IDs. \n\n\
        \ If your account is the management account or the delegated administrator of an \
         organization, use this parameter to return the Amazon ECS service recommendations to \
         specific member accounts.\n\
        \ \n\
        \  You can only specify one account ID per request.\n\
        \  "]
  filters : ecs_service_recommendation_filters option;
      [@ocaml.doc
        " An array of objects to specify a filter that returns a more specific list of Amazon ECS \
         service recommendations. \n"]
  max_results : max_results option;
      [@ocaml.doc
        " The maximum number of Amazon ECS service recommendations to return with a single \
         request. \n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        " The token to advance to the next page of Amazon ECS service recommendations. \n"]
  service_arns : service_arns option;
      [@ocaml.doc
        " The ARN that identifies the Amazon ECS service. \n\n\
        \  The following is the format of the ARN: \n\
        \ \n\
        \   [arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec cpu_size = int [@@ocaml.doc ""]

type nonrec ecs_service_projected_metric = {
  lower_bound_values : metric_values option;
      [@ocaml.doc " The lower bound values for the projected metric. \n"]
  upper_bound_values : metric_values option;
      [@ocaml.doc " The upper bound values for the projected metric. \n"]
  timestamps : timestamps option; [@ocaml.doc " The timestamps of the projected metric. \n"]
  name : ecs_service_metric_name option;
      [@ocaml.doc
        " The name of the projected metric. \n\n\
        \ The following metrics are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Cpu] \226\128\148 The percentage of allocated compute units that are \
         currently in use on the service tasks.\n\
        \            \n\
        \             }\n\
        \        {-   [Memory] \226\128\148 The percentage of memory that's currently in use on \
         the service tasks.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  " Describes the projected metrics of an Amazon ECS service recommendation option. \n\n\
  \ To determine the performance difference between your current Amazon ECS service and the \
   recommended option, compare the metric data of your service against its projected metric data.\n\
  \ "]

type nonrec ecs_service_projected_metrics = ecs_service_projected_metric list [@@ocaml.doc ""]

type nonrec ecs_service_recommended_option_projected_metric = {
  projected_metrics : ecs_service_projected_metrics option;
      [@ocaml.doc " An array of objects that describe the projected metric. \n"]
  recommended_memory_size : memory_size option;
      [@ocaml.doc " The recommended memory size for the Amazon ECS service. \n"]
  recommended_cpu_units : cpu_size option;
      [@ocaml.doc " The recommended CPU size for the Amazon ECS service. \n"]
}
[@@ocaml.doc
  " Describes the projected metrics of an Amazon ECS service recommendation option. \n\n\
  \ To determine the performance difference between your current Amazon ECS service and the \
   recommended option, compare the metric data of your service against its projected metric data.\n\
  \ "]

type nonrec ecs_service_recommended_option_projected_metrics =
  ecs_service_recommended_option_projected_metric list
[@@ocaml.doc ""]

type nonrec get_ecs_service_recommendation_projected_metrics_response = {
  recommended_option_projected_metrics : ecs_service_recommended_option_projected_metrics option;
      [@ocaml.doc " An array of objects that describes the projected metrics. \n"]
}
[@@ocaml.doc ""]

type nonrec get_ecs_service_recommendation_projected_metrics_request = {
  end_time : timestamp;
      [@ocaml.doc " The timestamp of the last projected metrics data point to return. \n"]
  start_time : timestamp;
      [@ocaml.doc " The timestamp of the first projected metrics data point to return. \n"]
  period : period;
      [@ocaml.doc " The granularity, in seconds, of the projected metrics data points. \n"]
  stat : metric_statistic; [@ocaml.doc " The statistic of the projected metrics. \n"]
  service_arn : service_arn;
      [@ocaml.doc
        " The ARN that identifies the Amazon ECS service. \n\n\
        \  The following is the format of the ARN: \n\
        \ \n\
        \   [arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name] \n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_ec2_recommendation_projected_metrics_response = {
  recommended_option_projected_metrics : recommended_option_projected_metrics option;
      [@ocaml.doc "An array of objects that describes projected metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ec2_recommendation_projected_metrics_request = {
  recommendation_preferences : recommendation_preferences option;
      [@ocaml.doc
        "An object to specify the preferences for the Amazon EC2 recommendation projected metrics \
         to return in the response.\n"]
  end_time : timestamp;
      [@ocaml.doc "The timestamp of the last projected metrics data point to return.\n"]
  start_time : timestamp;
      [@ocaml.doc "The timestamp of the first projected metrics data point to return.\n"]
  period : period;
      [@ocaml.doc "The granularity, in seconds, of the projected metrics data points.\n"]
  stat : metric_statistic; [@ocaml.doc "The statistic of the projected metrics.\n"]
  instance_arn : instance_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the instances for which to return recommendation \
         projected metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ec2_instance_recommendations_response = {
  errors : get_recommendation_errors option;
      [@ocaml.doc
        "An array of objects that describe errors of the request.\n\n\
        \ For example, an error is returned if you request recommendations for an instance of an \
         unsupported instance family.\n\
        \ "]
  instance_recommendations : instance_recommendations option;
      [@ocaml.doc "An array of objects that describe instance recommendations.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of instance recommendations.\n\n\
        \ This value is null when there are no more pages of instance recommendations to return.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec filter_name =
  | INFERRED_WORKLOAD_TYPES [@ocaml.doc ""]
  | RECOMMENDATION_SOURCE_TYPE [@ocaml.doc ""]
  | FINDING_REASON_CODES [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter = {
  values : filter_values option;
      [@ocaml.doc
        "The value of the filter.\n\n\
        \ The valid values for this parameter are as follows, depending on what you specify for \
         the [name] parameter and the resource type that you wish to filter results for:\n\
        \ \n\
        \  {ul\n\
        \        {-  Specify [Optimized] or [NotOptimized] if you specify the [name] parameter as \
         [Finding] and you want to filter results for Auto Scaling groups.\n\
        \            \n\
        \             }\n\
        \        {-  Specify [Underprovisioned], [Overprovisioned], or [Optimized] if you specify \
         the [name] parameter as [Finding] and you want to filter results for EC2 instances.\n\
        \            \n\
        \             }\n\
        \        {-  Specify [Ec2Instance] or [AutoScalingGroup] if you specify the [name] \
         parameter as [RecommendationSourceType].\n\
        \            \n\
        \             }\n\
        \        {-  Specify one of the following options if you specify the [name] parameter as \
         [FindingReasonCodes]:\n\
        \            \n\
        \             {ul\n\
        \                   {-   {b  [CPUOverprovisioned] } \226\128\148 The instance\226\128\153s \
         CPU configuration can be sized down while still meeting the performance requirements of \
         your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [CPUUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s CPU configuration doesn't meet the performance requirements of your \
         workload and there is an alternative instance type that provides better CPU performance.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [MemoryOverprovisioned] } \226\128\148 The \
         instance\226\128\153s memory configuration can be sized down while still meeting the \
         performance requirements of your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [MemoryUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s memory configuration doesn't meet the performance requirements of \
         your workload and there is an alternative instance type that provides better memory \
         performance.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [EBSThroughputOverprovisioned] } \226\128\148 The \
         instance\226\128\153s EBS throughput configuration can be sized down while still meeting \
         the performance requirements of your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [EBSThroughputUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s EBS throughput configuration doesn't meet the performance \
         requirements of your workload and there is an alternative instance type that provides \
         better EBS throughput performance.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [EBSIOPSOverprovisioned] } \226\128\148 The \
         instance\226\128\153s EBS IOPS configuration can be sized down while still meeting the \
         performance requirements of your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [EBSIOPSUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s EBS IOPS configuration doesn't meet the performance requirements of \
         your workload and there is an alternative instance type that provides better EBS IOPS \
         performance.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [NetworkBandwidthOverprovisioned] } \226\128\148 The \
         instance\226\128\153s network bandwidth configuration can be sized down while still \
         meeting the performance requirements of your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [NetworkBandwidthUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s network bandwidth configuration doesn't meet the performance \
         requirements of your workload and there is an alternative instance type that provides \
         better network bandwidth performance. This finding reason happens when the [NetworkIn] or \
         [NetworkOut] performance of an instance is impacted.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [NetworkPPSOverprovisioned] } \226\128\148 The \
         instance\226\128\153s network PPS (packets per second) configuration can be sized down \
         while still meeting the performance requirements of your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [NetworkPPSUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s network PPS (packets per second) configuration doesn't meet the \
         performance requirements of your workload and there is an alternative instance type that \
         provides better network PPS performance.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [DiskIOPSOverprovisioned] } \226\128\148 The \
         instance\226\128\153s disk IOPS configuration can be sized down while still meeting the \
         performance requirements of your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [DiskIOPSUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s disk IOPS configuration doesn't meet the performance requirements \
         of your workload and there is an alternative instance type that provides better disk IOPS \
         performance.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [DiskThroughputOverprovisioned] } \226\128\148 The \
         instance\226\128\153s disk throughput configuration can be sized down while still meeting \
         the performance requirements of your workload.\n\
        \                       \n\
        \                        }\n\
        \                   {-   {b  [DiskThroughputUnderprovisioned] } \226\128\148 The \
         instance\226\128\153s disk throughput configuration doesn't meet the performance \
         requirements of your workload and there is an alternative instance type that provides \
         better disk throughput performance.\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \  "]
  name : filter_name option;
      [@ocaml.doc
        "The name of the filter.\n\n\
        \ Specify [Finding] to return recommendations with a specific finding classification. For \
         example, [Underprovisioned].\n\
        \ \n\
        \  Specify [RecommendationSourceType] to return recommendations of a specific resource \
         type. For example, [Ec2Instance].\n\
        \  \n\
        \   Specify [FindingReasonCodes] to return recommendations with a specific finding reason \
         code. For example, [CPUUnderprovisioned].\n\
        \   \n\
        \    Specify [InferredWorkloadTypes] to return recommendations of a specific inferred \
         workload. For example, [Redis].\n\
        \    \n\
        \     You can filter your EC2 instance recommendations by [tag:key] and [tag-key] tags.\n\
        \     \n\
        \      A [tag:key] is a key and value combination of a tag assigned to your \
         recommendations. Use the tag key in the filter name and the tag value as the filter \
         value. For example, to find all recommendations that have a tag with the key of [Owner] \
         and the value of [TeamA], specify [tag:Owner] for the filter name and [TeamA] for the \
         filter value.\n\
        \      \n\
        \       A [tag-key] is the key of a tag assigned to your recommendations. Use this filter \
         to find all of your recommendations that have a tag with a specific key. This \
         doesn\226\128\153t consider the tag value. For example, you can find your recommendations \
         with a tag key value of [Owner] or without any tag keys assigned.\n\
        \       "]
}
[@@ocaml.doc
  "Describes a filter that returns a more specific list of recommendations. Use this filter with \
   the [GetAutoScalingGroupRecommendations] and [GetEC2InstanceRecommendations] actions.\n\n\
  \ You can use [EBSFilter] with the [GetEBSVolumeRecommendations] action, \
   [LambdaFunctionRecommendationFilter] with the [GetLambdaFunctionRecommendations] action, and \
   [JobFilter] with the [DescribeRecommendationExportJobs] action.\n\
  \ "]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec get_ec2_instance_recommendations_request = {
  recommendation_preferences : recommendation_preferences option;
      [@ocaml.doc
        "An object to specify the preferences for the Amazon EC2 instance recommendations to \
         return in the response.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account for which to return instance recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to return instance recommendations.\n\
        \ \n\
        \  Only one account ID can be specified per request.\n\
        \  "]
  filters : filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that returns a more specific list of instance \
         recommendations.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of instance recommendations to return with a single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of instance recommendations.\n"]
  instance_arns : instance_arns option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the instances for which to return recommendations.\n"]
}
[@@ocaml.doc ""]

type nonrec get_ebs_volume_recommendations_response = {
  errors : get_recommendation_errors option;
      [@ocaml.doc
        "An array of objects that describe errors of the request.\n\n\
        \ For example, an error is returned if you request recommendations for an unsupported \
         volume.\n\
        \ "]
  volume_recommendations : volume_recommendations option;
      [@ocaml.doc "An array of objects that describe volume recommendations.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of volume recommendations.\n\n\
        \ This value is null when there are no more pages of volume recommendations to return.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec ebs_filter_name = FINDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ebs_filter = {
  values : filter_values option;
      [@ocaml.doc
        "The value of the filter.\n\n The valid values are [Optimized], or [NotOptimized].\n "]
  name : ebs_filter_name option;
      [@ocaml.doc
        "The name of the filter.\n\n\
        \ Specify [Finding] to return recommendations with a specific finding classification (for \
         example, [NotOptimized]).\n\
        \ \n\
        \  You can filter your Amazon EBS volume recommendations by [tag:key] and [tag-key] tags.\n\
        \  \n\
        \   A [tag:key] is a key and value combination of a tag assigned to your Amazon EBS volume \
         recommendations. Use the tag key in the filter name and the tag value as the filter \
         value. For example, to find all Amazon EBS volume recommendations that have a tag with \
         the key of [Owner] and the value of [TeamA], specify [tag:Owner] for the filter name and \
         [TeamA] for the filter value.\n\
        \   \n\
        \    A [tag-key] is the key of a tag assigned to your Amazon EBS volume recommendations. \
         Use this filter to find all of your Amazon EBS volume recommendations that have a tag \
         with a specific key. This doesn\226\128\153t consider the tag value. For example, you can \
         find your Amazon EBS volume recommendations with a tag key value of [Owner] or without \
         any tag keys assigned.\n\
        \    "]
}
[@@ocaml.doc
  "Describes a filter that returns a more specific list of Amazon Elastic Block Store (Amazon EBS) \
   volume recommendations. Use this filter with the [GetEBSVolumeRecommendations] action.\n\n\
  \ You can use [LambdaFunctionRecommendationFilter] with the [GetLambdaFunctionRecommendations] \
   action, [JobFilter] with the [DescribeRecommendationExportJobs] action, and [Filter] with the \
   [GetAutoScalingGroupRecommendations] and [GetEC2InstanceRecommendations] actions.\n\
  \ "]

type nonrec ebs_filters = ebs_filter list [@@ocaml.doc ""]

type nonrec get_ebs_volume_recommendations_request = {
  account_ids : account_ids option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account for which to return volume recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to return volume recommendations.\n\
        \ \n\
        \  Only one account ID can be specified per request.\n\
        \  "]
  filters : ebs_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that returns a more specific list of volume \
         recommendations.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of volume recommendations to return with a single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of volume recommendations.\n"]
  volume_arns : volume_arns option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the volumes for which to return recommendations.\n"]
}
[@@ocaml.doc ""]

type nonrec auto_scaling_group_arn = string [@@ocaml.doc ""]

type nonrec auto_scaling_group_name = string [@@ocaml.doc ""]

type nonrec desired_capacity = int [@@ocaml.doc ""]

type nonrec allocation_strategy = LOWEST_PRICE [@ocaml.doc ""] | PRIORITIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec asg_type = MIXED_INSTANCE_TYPE [@ocaml.doc ""] | SINGLE_INSTANCE_TYPE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_scaling_group_configuration = {
  mixed_instance_types : mixed_instance_types option;
      [@ocaml.doc
        " List the instance types within an EC2 Auto Scaling group that has mixed instance types. \n"]
  type_ : asg_type option;
      [@ocaml.doc
        " Describes whether the EC2 Auto Scaling group has a single instance type or a mixed \
         instance type configuration. \n"]
  estimated_instance_hour_reduction_percentage :
    nullable_estimated_instance_hour_reduction_percentage option;
      [@ocaml.doc
        " Describes the projected percentage reduction in instance hours after adopting the \
         recommended configuration. This field is only available for EC2 Auto Scaling groups with \
         scaling policies. \n"]
  allocation_strategy : allocation_strategy option;
      [@ocaml.doc
        " Describes the allocation strategy that the EC2 Auto Scaling group uses. This field is \
         only available for EC2 Auto Scaling groups with mixed instance types. \n"]
  instance_type : nullable_instance_type option;
      [@ocaml.doc "The instance type for the EC2 Auto Scaling group.\n"]
  max_size : max_size option;
      [@ocaml.doc
        "The maximum size, or maximum number of instances, for the EC2 Auto Scaling group.\n"]
  min_size : min_size option;
      [@ocaml.doc
        "The minimum size, or minimum number of instances, for the EC2 Auto Scaling group.\n"]
  desired_capacity : desired_capacity option;
      [@ocaml.doc "The desired capacity, or number of instances, for the EC2 Auto Scaling group.\n"]
}
[@@ocaml.doc "Describes the configuration of an EC2 Auto Scaling group.\n"]

type nonrec auto_scaling_group_estimated_monthly_savings = {
  value : value option; [@ocaml.doc " The value of the estimated monthly savings. \n"]
  currency : currency option; [@ocaml.doc " The currency of the estimated monthly savings. \n"]
}
[@@ocaml.doc
  " An object that describes the estimated monthly savings possible by adopting Compute \
   Optimizer\226\128\153s Auto Scaling group recommendations. This is based on the Savings Plans \
   and Reserved Instances discounts. \n"]

type nonrec auto_scaling_group_savings_opportunity_after_discounts = {
  estimated_monthly_savings : auto_scaling_group_estimated_monthly_savings option;
      [@ocaml.doc
        " An object that describes the estimated monthly savings possible by adopting Compute \
         Optimizer\226\128\153s Auto Scaling group recommendations. This is based on the Savings \
         Plans and Reserved Instances pricing discounts. \n"]
  savings_opportunity_percentage : savings_opportunity_percentage option;
      [@ocaml.doc
        " The estimated monthly savings possible as a percentage of monthly cost after applying \
         the Savings Plans and Reserved Instances discounts. This saving can be achieved by \
         adopting Compute Optimizer\226\128\153s Auto Scaling group recommendations. \n"]
}
[@@ocaml.doc
  " Describes the savings opportunity for Auto Scaling group recommendations after applying the \
   Savings Plans and Reserved Instances discounts. \n\n\
  \ Savings opportunity represents the estimated monthly savings you can achieve by implementing \
   Compute Optimizer recommendations.\n\
  \ "]

type nonrec auto_scaling_group_recommendation_option = {
  migration_effort : migration_effort option;
      [@ocaml.doc
        "The level of effort required to migrate from the current instance type to the recommended \
         instance type.\n\n\
        \ For example, the migration effort is [Low] if Amazon EMR is the inferred workload type \
         and an Amazon Web Services Graviton instance type is recommended. The migration effort is \
         [Medium] if a workload type couldn't be inferred but an Amazon Web Services Graviton \
         instance type is recommended. The migration effort is [VeryLow] if both the current and \
         recommended instance types are of the same CPU architecture.\n\
        \ "]
  savings_opportunity_after_discounts :
    auto_scaling_group_savings_opportunity_after_discounts option;
      [@ocaml.doc
        " An object that describes the savings opportunity for the Auto Scaling group \
         recommendation option that includes Savings Plans and Reserved Instances discounts. \
         Savings opportunity includes the estimated monthly savings and percentage. \n"]
  savings_opportunity : savings_opportunity option;
      [@ocaml.doc
        "An object that describes the savings opportunity for the Auto Scaling group \
         recommendation option. Savings opportunity includes the estimated monthly savings amount \
         and percentage.\n"]
  rank : rank option;
      [@ocaml.doc
        "The rank of the Auto Scaling group recommendation option.\n\n\
        \ The top recommendation option is ranked as [1].\n\
        \ "]
  performance_risk : performance_risk option;
      [@ocaml.doc
        "The performance risk of the Auto Scaling group configuration recommendation.\n\n\
        \ Performance risk indicates the likelihood of the recommended instance type not meeting \
         the resource needs of your workload. Compute Optimizer calculates an individual \
         performance risk score for each specification of the recommended instance, including CPU, \
         memory, EBS throughput, EBS IOPS, disk throughput, disk IOPS, network throughput, and \
         network PPS. The performance risk of the recommended instance is calculated as the \
         maximum performance risk score across the analyzed resource specifications.\n\
        \ \n\
        \  The value ranges from [0] - [4], with [0] meaning that the recommended resource is \
         predicted to always provide enough hardware capability. The higher the performance risk \
         is, the more likely you should validate whether the recommendation will meet the \
         performance requirements of your workload before migrating your resource.\n\
        \  "]
  projected_utilization_metrics : projected_utilization_metrics option;
      [@ocaml.doc
        "An array of objects that describe the projected utilization metrics of the Auto Scaling \
         group recommendation option.\n\n\
        \  The [Cpu] and [Memory] metrics are the only projected utilization metrics returned. \
         Additionally, the [Memory] metric is returned only for resources that have the unified \
         CloudWatch agent installed on them. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent}Enabling \
         Memory Utilization with the CloudWatch Agent}.\n\
        \  \n\
        \   "]
  instance_gpu_info : gpu_info option;
      [@ocaml.doc
        " Describes the GPU accelerator settings for the recommended instance type of the Auto \
         Scaling group. \n"]
  configuration : auto_scaling_group_configuration option;
      [@ocaml.doc "An array of objects that describe an Auto Scaling group configuration.\n"]
}
[@@ocaml.doc "Describes a recommendation option for an Auto Scaling group.\n"]

type nonrec auto_scaling_group_recommendation_options =
  auto_scaling_group_recommendation_option list
[@@ocaml.doc ""]

type nonrec auto_scaling_group_recommendation = {
  inferred_workload_types : inferred_workload_types option;
      [@ocaml.doc
        "The applications that might be running on the instances in the Auto Scaling group as \
         inferred by Compute Optimizer.\n\n\
        \ Compute Optimizer can infer if one of the following applications might be running on the \
         instances:\n\
        \ \n\
        \  {ul\n\
        \        {-   [AmazonEmr] - Infers that Amazon EMR might be running on the instances.\n\
        \            \n\
        \             }\n\
        \        {-   [ApacheCassandra] - Infers that Apache Cassandra might be running on the \
         instances.\n\
        \            \n\
        \             }\n\
        \        {-   [ApacheHadoop] - Infers that Apache Hadoop might be running on the instances.\n\
        \            \n\
        \             }\n\
        \        {-   [Memcached] - Infers that Memcached might be running on the instances.\n\
        \            \n\
        \             }\n\
        \        {-   [NGINX] - Infers that NGINX might be running on the instances.\n\
        \            \n\
        \             }\n\
        \        {-   [PostgreSql] - Infers that PostgreSQL might be running on the instances.\n\
        \            \n\
        \             }\n\
        \        {-   [Redis] - Infers that Redis might be running on the instances.\n\
        \            \n\
        \             }\n\
        \        {-   [Kafka] - Infers that Kafka might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        {-   [SQLServer] - Infers that SQLServer might be running on the instance.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  effective_recommendation_preferences : effective_recommendation_preferences option;
      [@ocaml.doc
        "An object that describes the effective recommendation preferences for the Auto Scaling \
         group.\n"]
  current_performance_risk : current_performance_risk option;
      [@ocaml.doc
        "The risk of the current Auto Scaling group not meeting the performance needs of its \
         workloads. The higher the risk, the more likely the current Auto Scaling group \
         configuration has insufficient capacity and cannot meet workload requirements.\n"]
  last_refresh_timestamp : last_refresh_timestamp option;
      [@ocaml.doc
        "The timestamp of when the Auto Scaling group recommendation was last generated.\n"]
  recommendation_options : auto_scaling_group_recommendation_options option;
      [@ocaml.doc
        "An array of objects that describe the recommendation options for the Auto Scaling group.\n"]
  current_instance_gpu_info : gpu_info option;
      [@ocaml.doc
        " Describes the GPU accelerator settings for the current instance type of the Auto Scaling \
         group. \n"]
  current_configuration : auto_scaling_group_configuration option;
      [@ocaml.doc
        "An array of objects that describe the current configuration of the Auto Scaling group.\n"]
  look_back_period_in_days : look_back_period_in_days option;
      [@ocaml.doc
        "The number of days for which utilization metrics were analyzed for the Auto Scaling group.\n"]
  utilization_metrics : utilization_metrics option;
      [@ocaml.doc
        "An array of objects that describe the utilization metrics of the Auto Scaling group.\n"]
  finding : finding option;
      [@ocaml.doc
        "The finding classification of the Auto Scaling group.\n\n\
        \ Findings for Auto Scaling groups include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b  [NotOptimized] }\226\128\148An Auto Scaling group is considered not \
         optimized when Compute Optimizer identifies a recommendation that can provide better \
         performance for your workload.\n\
        \            \n\
        \             }\n\
        \        {-   {b  [Optimized] }\226\128\148An Auto Scaling group is considered optimized \
         when Compute Optimizer determines that the group is correctly provisioned to run your \
         workload based on the chosen instance type. For optimized resources, Compute Optimizer \
         might recommend a new generation instance type.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  auto_scaling_group_name : auto_scaling_group_name option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  auto_scaling_group_arn : auto_scaling_group_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Auto Scaling group.\n"]
  account_id : account_id option;
      [@ocaml.doc "The Amazon Web Services account ID of the Auto Scaling group.\n"]
}
[@@ocaml.doc "Describes an Auto Scaling group recommendation.\n"]

type nonrec auto_scaling_group_recommendations = auto_scaling_group_recommendation list
[@@ocaml.doc ""]

type nonrec get_auto_scaling_group_recommendations_response = {
  errors : get_recommendation_errors option;
      [@ocaml.doc
        "An array of objects that describe errors of the request.\n\n\
        \ For example, an error is returned if you request recommendations for an unsupported Auto \
         Scaling group.\n\
        \ "]
  auto_scaling_group_recommendations : auto_scaling_group_recommendations option;
      [@ocaml.doc "An array of objects that describe Auto Scaling group recommendations.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of Auto Scaling group recommendations.\n\n\
        \ This value is null when there are no more pages of Auto Scaling group recommendations to \
         return.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec auto_scaling_group_arns = auto_scaling_group_arn list [@@ocaml.doc ""]

type nonrec get_auto_scaling_group_recommendations_request = {
  recommendation_preferences : recommendation_preferences option;
      [@ocaml.doc
        "An object to specify the preferences for the Auto Scaling group recommendations to return \
         in the response.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that returns a more specific list of Auto Scaling \
         group recommendations.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of Auto Scaling group recommendations to return with a single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of Auto Scaling group recommendations.\n"]
  auto_scaling_group_arns : auto_scaling_group_arns option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Auto Scaling groups for which to return \
         recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The ID of the Amazon Web Services account for which to return Auto Scaling group \
         recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to return Auto Scaling group \
         recommendations.\n\
        \ \n\
        \  Only one account ID can be specified per request.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec file_format = CSV [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec exportable_volume_field =
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_ROOT_VOLUME [@ocaml.doc ""]
  | ROOT_VOLUME [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | CURRENT_PERFORMANCE_RISK [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_MONTHLY_PRICE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_SIZE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_THROUGHPUT [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BURST_IOPS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_BASELINE_IOPS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_VOLUME_TYPE [@ocaml.doc ""]
  | CURRENT_MONTHLY_PRICE [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_VOLUME_SIZE [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_VOLUME_BURST_THROUGHPUT [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_VOLUME_BURST_IOPS [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_VOLUME_BASELINE_THROUGHPUT [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_VOLUME_BASELINE_IOPS [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_VOLUME_TYPE [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_THROUGHPUT_EXCEEDED_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_IOPS_EXCEEDED_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_WRITE_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_READ_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
  | VOLUME_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_volume_fields = exportable_volume_field list [@@ocaml.doc ""]

type nonrec exportable_rdsdb_field =
  | PROMOTION_TIER [@ocaml.doc ""]
  | DB_CLUSTER_IDENTIFIER [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
      [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST
      [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ON_DEMAND_MONTHLY_PRICE [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS
      [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_INSTANCE_ON_DEMAND_HOURLY_PRICE [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_RANK [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_STORAGE_THROUGHPUT [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_IOPS [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_MAX_ALLOCATED_STORAGE [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_ALLOCATED_STORAGE [@ocaml.doc ""]
  | STORAGE_RECOMMENDATION_OPTIONS_STORAGE_TYPE [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_PERFORMANCE_RISK [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_RANK [@ocaml.doc ""]
  | INSTANCE_RECOMMENDATION_OPTIONS_DB_INSTANCE_CLASS [@ocaml.doc ""]
  | STORAGE_FINDING_REASON_CODES [@ocaml.doc ""]
  | STORAGE_FINDING [@ocaml.doc ""]
  | INSTANCE_FINDING_REASON_CODES [@ocaml.doc ""]
  | INSTANCE_FINDING [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_WRITE_IOPS_AVERAGE [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_READ_IOPS_AVERAGE [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_BYTES_USED_AVERAGE [@ocaml.doc ""]
  | UTILIZATION_METRICS_WRITE_IOPS_EPHEMERAL_STORAGE_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_READ_IOPS_EPHEMERAL_STORAGE_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_QUERY_TOTAL_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_KILL_CONN_TOTAL_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_AURORA_MEMORY_NUM_DECLINED_SQL_TOTAL_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_AURORA_MEMORY_HEALTH_STATE_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_STORAGE_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_STORAGE_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_THROUGHPUT_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_VOLUME_READ_THROUGHPUT_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_TRANSMIT_THROUGHPUT_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_RECEIVE_THROUGHPUT_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_VOLUME_STORAGE_SPACE_UTILIZATION_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | CURRENT_INSTANCE_PERFORMANCE_RISK [@ocaml.doc ""]
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_IO_ON_DEMAND_MONTHLY_COST [@ocaml.doc ""]
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_STORAGE_ON_DEMAND_MONTHLY_COST [@ocaml.doc ""]
  | CURRENT_STORAGE_ESTIMATED_CLUSTER_INSTANCE_ON_DEMAND_MONTHLY_COST [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | CURRENT_STORAGE_ON_DEMAND_MONTHLY_PRICE [@ocaml.doc ""]
  | CURRENT_INSTANCE_ON_DEMAND_HOURLY_PRICE [@ocaml.doc ""]
  | CURRENT_STORAGE_ESTIMATED_MONTHLY_VOLUME_IOPS_COST_VARIATION [@ocaml.doc ""]
  | CURRENT_STORAGE_CONFIGURATION_STORAGE_THROUGHPUT [@ocaml.doc ""]
  | CURRENT_STORAGE_CONFIGURATION_IOPS [@ocaml.doc ""]
  | CURRENT_STORAGE_CONFIGURATION_MAX_ALLOCATED_STORAGE [@ocaml.doc ""]
  | CURRENT_STORAGE_CONFIGURATION_ALLOCATED_STORAGE [@ocaml.doc ""]
  | CURRENT_STORAGE_CONFIGURATION_STORAGE_TYPE [@ocaml.doc ""]
  | CURRENT_DB_INSTANCE_CLASS [@ocaml.doc ""]
  | CLUSTER_WRITER [@ocaml.doc ""]
  | MULTI_AZ_DB_INSTANCE [@ocaml.doc ""]
  | IDLE [@ocaml.doc ""]
  | ENGINE_VERSION [@ocaml.doc ""]
  | ENGINE [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
  | RESOURCE_ARN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_rdsdb_fields = exportable_rdsdb_field list [@@ocaml.doc ""]

type nonrec exportable_license_field =
  | TAGS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_LICENSE_MODEL [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_LICENSE_EDITION [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_OPERATING_SYSTEM [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_METRICS_SOURCE [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_VERSION [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_MODEL [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_EDITION [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_LICENSE_NAME [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_OPERATING_SYSTEM [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_INSTANCE_TYPE [@ocaml.doc ""]
  | CURRENT_LICENSE_CONFIGURATION_NUMBER_OF_CORES [@ocaml.doc ""]
  | LICENSE_FINDING_REASON_CODES [@ocaml.doc ""]
  | LICENSE_FINDING [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | RESOURCE_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_license_fields = exportable_license_field list [@@ocaml.doc ""]

type nonrec exportable_lambda_function_field =
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | CURRENT_PERFORMANCE_RISK [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_EXPECTED [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_UPPER_BOUND [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_DURATION_LOWER_BOUND [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_COST_HIGH [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_COST_LOW [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MEMORY_SIZE [@ocaml.doc ""]
  | CURRENT_COST_AVERAGE [@ocaml.doc ""]
  | CURRENT_COST_TOTAL [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_TIMEOUT [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_MEMORY_SIZE [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | UTILIZATION_METRICS_MEMORY_AVERAGE [@ocaml.doc ""]
  | UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DURATION_AVERAGE [@ocaml.doc ""]
  | UTILIZATION_METRICS_DURATION_MAXIMUM [@ocaml.doc ""]
  | NUMBER_OF_INVOCATIONS [@ocaml.doc ""]
  | FINDING_REASON_CODES [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
  | FUNCTION_VERSION [@ocaml.doc ""]
  | FUNCTION_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_lambda_function_fields = exportable_lambda_function_field list
[@@ocaml.doc ""]

type nonrec exportable_instance_field =
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_UTILIZATION_PREFERENCES [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES [@ocaml.doc ""]
  | IDLE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM
      [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO [@ocaml.doc ""]
  | CURRENT_INSTANCE_GPU_INFO [@ocaml.doc ""]
  | EXTERNAL_METRIC_STATUS_REASON [@ocaml.doc ""]
  | EXTERNAL_METRIC_STATUS_CODE [@ocaml.doc ""]
  | INSTANCE_STATE [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_EXTERNAL_METRICS_SOURCE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_MIGRATION_EFFORT [@ocaml.doc ""]
  | INFERRED_WORKLOAD_TYPES [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | CURRENT_PERFORMANCE_RISK [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_TYPE [@ocaml.doc ""]
  | RECOMMENDATIONS_SOURCES_RECOMMENDATION_SOURCE_ARN [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_NETWORK [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_STORAGE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_MEMORY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_VCPUS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PLATFORM_DIFFERENCES [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_INSTANCE_TYPE [@ocaml.doc ""]
  | CURRENT_NETWORK [@ocaml.doc ""]
  | CURRENT_STORAGE [@ocaml.doc ""]
  | CURRENT_MEMORY [@ocaml.doc ""]
  | CURRENT_VCPUS [@ocaml.doc ""]
  | CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | CURRENT_ON_DEMAND_PRICE [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | CURRENT_INSTANCE_TYPE [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | Finding_Reason_Codes [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
  | INSTANCE_NAME [@ocaml.doc ""]
  | INSTANCE_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_instance_fields = exportable_instance_field list [@@ocaml.doc ""]

type nonrec exportable_idle_field =
  | TAGS [@ocaml.doc ""]
  | FINDING_DESCRIPTION [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CURR_CONNECTIONS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_ELASTI_CACHE_PROCESSING_UNITS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_SET_TYPE_CMDS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_GET_TYPE_CMDS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_INVOCATIONS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_USER_CONNECTED_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_IS_IDLE_MINIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_KEYSPACE_MISSES_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_KEYSPACE_HITS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CACHE_MISSES_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CACHE_HITS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_ENGINE_CPU_UTILIZATION_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NEW_CONNECTIONS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CONSUMED_WRITE_CAPACITY_UNITS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CONSUMED_READ_CAPACITY_UNITS_SUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_PACKETS_IN_FROM_DESTINATION_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_PACKETS_IN_FROM_SOURCE_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_ACTIVE_CONNECTION_COUNT_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_WRITE_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_VOLUME_READ_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_VOLUME_WRITE_IOPS_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_VOLUME_READ_IOPS_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DATABASE_CONNECTIONS_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | SAVINGS_OPPORTUNITY_AFTER_DISCOUNT [@ocaml.doc ""]
  | SAVINGS_OPPORTUNITY [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | RESOURCE_TYPE [@ocaml.doc ""]
  | RESOURCE_ID [@ocaml.doc ""]
  | RESOURCE_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_idle_fields = exportable_idle_field list [@@ocaml.doc ""]

type nonrec exportable_ecs_service_field =
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE [@ocaml.doc ""]
  | TAGS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONTAINER_RECOMMENDATIONS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CPU [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_MEMORY [@ocaml.doc ""]
  | FINDING_REASON_CODES [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
  | UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | CURRENT_SERVICE_CONTAINER_CONFIGURATIONS [@ocaml.doc ""]
  | CURRENT_SERVICE_CONFIGURATION_AUTO_SCALING_CONFIGURATION [@ocaml.doc ""]
  | CURRENT_SERVICE_CONFIGURATION_TASK_DEFINITION_ARN [@ocaml.doc ""]
  | CURRENT_SERVICE_CONFIGURATION_CPU [@ocaml.doc ""]
  | CURRENT_SERVICE_CONFIGURATION_MEMORY [@ocaml.doc ""]
  | CURRENT_PERFORMANCE_RISK [@ocaml.doc ""]
  | LAUNCH_TYPE [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | SERVICE_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_ecs_service_fields = exportable_ecs_service_field list [@@ocaml.doc ""]

type nonrec exportable_auto_scaling_group_field =
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY_AFTER_DISCOUNTS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_AFTER_DISCOUNTS_PERCENTAGE [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_SAVINGS_ESTIMATION_MODE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MEMORY_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_GPU_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_GPU_MEMORY_PERCENTAGE_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_GPU_PERCENTAGE_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_INSTANCE_GPU_INFO [@ocaml.doc ""]
  | CURRENT_INSTANCE_GPU_INFO [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_MIGRATION_EFFORT [@ocaml.doc ""]
  | INFERRED_WORKLOAD_TYPES [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_LOOKBACK_PERIOD [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_PREFERRED_RESOURCES [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_INFERRED_WORKLOAD_TYPES [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_ENHANCED_INFRASTRUCTURE_METRICS [@ocaml.doc ""]
  | EFFECTIVE_RECOMMENDATION_PREFERENCES_CPU_VENDOR_ARCHITECTURES [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_VALUE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ESTIMATED_MONTHLY_SAVINGS_CURRENCY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_SAVINGS_OPPORTUNITY_PERCENTAGE [@ocaml.doc ""]
  | CURRENT_PERFORMANCE_RISK [@ocaml.doc ""]
  | LAST_REFRESH_TIMESTAMP [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_NETWORK [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_STORAGE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_MEMORY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_VCPUS [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_ON_DEMAND_PRICE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PERFORMANCE_RISK [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_PROJECTED_UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_TYPE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MIXED_INSTANCE_TYPES [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_ALLOCATION_STRATEGY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_ESTIMATED_INSTANCE_HOUR_REDUCTION_PERCENTAGE
      [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MAX_SIZE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_MIN_SIZE [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_DESIRED_CAPACITY [@ocaml.doc ""]
  | RECOMMENDATION_OPTIONS_CONFIGURATION_INSTANCE_TYPE [@ocaml.doc ""]
  | CURRENT_NETWORK [@ocaml.doc ""]
  | CURRENT_STORAGE [@ocaml.doc ""]
  | CURRENT_MEMORY [@ocaml.doc ""]
  | CURRENT_VCPUS [@ocaml.doc ""]
  | CURRENT_STANDARD_THREE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | CURRENT_STANDARD_ONE_YEAR_NO_UPFRONT_RESERVED_PRICE [@ocaml.doc ""]
  | CURRENT_ON_DEMAND_PRICE [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_TYPE [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_MIXED_INSTANCE_TYPES [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_ALLOCATION_STRATEGY [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_MAX_SIZE [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_MIN_SIZE [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_DESIRED_CAPACITY [@ocaml.doc ""]
  | CURRENT_CONFIGURATION_INSTANCE_TYPE [@ocaml.doc ""]
  | LOOKBACK_PERIOD_IN_DAYS [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_PACKETS_OUT_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_PACKETS_IN_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_OUT_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_NETWORK_IN_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_WRITE_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_READ_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_WRITE_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_DISK_READ_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_WRITE_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_READ_BYTES_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_WRITE_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_EBS_READ_OPS_PER_SECOND_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_MEMORY_MAXIMUM [@ocaml.doc ""]
  | UTILIZATION_METRICS_CPU_MAXIMUM [@ocaml.doc ""]
  | FINDING [@ocaml.doc ""]
  | AUTO_SCALING_GROUP_NAME [@ocaml.doc ""]
  | AUTO_SCALING_GROUP_ARN [@ocaml.doc ""]
  | ACCOUNT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exportable_auto_scaling_group_fields = exportable_auto_scaling_group_field list
[@@ocaml.doc ""]

type nonrec export_rds_database_recommendations_response = {
  s3_destination : s3_destination option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        " The identification number of the export job. \n\n\
        \ To view the status of an export job, use the [DescribeRecommendationExportJobs] action \
         and specify the job ID. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_rds_database_recommendations_request = {
  recommendation_preferences : recommendation_preferences option; [@ocaml.doc ""]
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "If your account is the management account or the delegated administrator of an \
         organization, this parameter indicates whether to include recommendations for resources \
         in all member accounts of the organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  If this parameter is omitted, recommendations for member accounts of the organization \
         aren't included in the export file.\n\
        \  \n\
        \   If this parameter or the account ID parameter is omitted, recommendations for member \
         accounts aren't included in the export.\n\
        \   "]
  file_format : file_format option;
      [@ocaml.doc
        " The format of the export file. \n\n\
        \ The CSV file is the only export file format currently supported.\n\
        \ "]
  s3_destination_config : s3_destination_config; [@ocaml.doc ""]
  fields_to_export : exportable_rdsdb_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : rdsdb_recommendation_filters option;
      [@ocaml.doc
        " An array of objects to specify a filter that exports a more specific set of Amazon \
         Aurora and RDS recommendations. \n"]
  account_ids : account_ids option;
      [@ocaml.doc
        " The Amazon Web Services account IDs for the export Amazon Aurora and RDS database \
         recommendations. \n\n\
        \ If your account is the management account or the delegated administrator of an \
         organization, use this parameter to specify the member account you want to export \
         recommendations to.\n\
        \ \n\
        \  This parameter can't be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   If this parameter or the include member accounts parameter is omitted, the \
         recommendations for member accounts aren't included in the export.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec export_license_recommendations_response = {
  s3_destination : s3_destination option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        " The identification number of the export job. \n\n\
        \ To view the status of an export job, use the [DescribeRecommendationExportJobs] action \
         and specify the job ID.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_license_recommendations_request = {
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "Indicates whether to include recommendations for resources in all member accounts of the \
         organization if your account is the management account of an organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  If this parameter is omitted, recommendations for member accounts of the organization \
         aren't included in the export file .\n\
        \  \n\
        \   This parameter cannot be specified together with the account IDs parameter. The \
         parameters are mutually exclusive.\n\
        \   "]
  file_format : file_format option;
      [@ocaml.doc
        "The format of the export file.\n\n\
        \ A CSV file is the only export format currently supported.\n\
        \ "]
  s3_destination_config : s3_destination_config; [@ocaml.doc ""]
  fields_to_export : exportable_license_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : license_recommendation_filters option;
      [@ocaml.doc
        " An array of objects to specify a filter that exports a more specific set of license \
         recommendations. \n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The IDs of the Amazon Web Services accounts for which to export license recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to export recommendations.\n\
        \ \n\
        \  This parameter can't be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   If this parameter is omitted, recommendations for member accounts aren't included in \
         the export.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec export_lambda_function_recommendations_response = {
  s3_destination : s3_destination option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "The identification number of the export job.\n\n\
        \ Use the [DescribeRecommendationExportJobs] action, and specify the job ID to view the \
         status of an export job.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_lambda_function_recommendations_request = {
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "Indicates whether to include recommendations for resources in all member accounts of the \
         organization if your account is the management account of an organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  Recommendations for member accounts of the organization are not included in the export \
         file if this parameter is omitted.\n\
        \  \n\
        \   This parameter cannot be specified together with the account IDs parameter. The \
         parameters are mutually exclusive.\n\
        \   \n\
        \    Recommendations for member accounts are not included in the export if this parameter, \
         or the account IDs parameter, is omitted.\n\
        \    "]
  file_format : file_format option;
      [@ocaml.doc
        "The format of the export file.\n\n\
        \ The only export file format currently supported is [Csv].\n\
        \ "]
  s3_destination_config : s3_destination_config; [@ocaml.doc ""]
  fields_to_export : exportable_lambda_function_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : lambda_function_recommendation_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that exports a more specific set of Lambda \
         function recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The IDs of the Amazon Web Services accounts for which to export Lambda function \
         recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to export recommendations.\n\
        \ \n\
        \  This parameter cannot be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   Recommendations for member accounts are not included in the export if this parameter, \
         or the include member accounts parameter, is omitted.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec export_idle_recommendations_response = {
  s3_destination : s3_destination option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        " The identification number of the export job. \n\n\
        \ To view the status of an export job, use the [DescribeRecommendationExportJobs] action \
         and specify the job ID. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_idle_recommendations_request = {
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "If your account is the management account or the delegated administrator of an \
         organization, this parameter indicates whether to include recommendations for resources \
         in all member accounts of the organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  If this parameter is omitted, recommendations for member accounts of the organization \
         aren't included in the export file.\n\
        \  \n\
        \   If this parameter or the account ID parameter is omitted, recommendations for member \
         accounts aren't included in the export.\n\
        \   "]
  file_format : file_format option;
      [@ocaml.doc
        "The format of the export file. The CSV file is the only export file format currently \
         supported.\n"]
  s3_destination_config : s3_destination_config; [@ocaml.doc ""]
  fields_to_export : exportable_idle_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : idle_recommendation_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that exports a more specific set of idle resource \
         recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        " The Amazon Web Services account IDs for the export idle resource recommendations. \n\n\
        \ If your account is the management account or the delegated administrator of an \
         organization, use this parameter to specify the member account you want to export \
         recommendations to.\n\
        \ \n\
        \  This parameter can't be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   If this parameter or the include member accounts parameter is omitted, the \
         recommendations for member accounts aren't included in the export.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec export_ecs_service_recommendations_response = {
  s3_destination : s3_destination option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        " The identification number of the export job. \n\n\
        \ To view the status of an export job, use the [DescribeRecommendationExportJobs] action \
         and specify the job ID. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_ecs_service_recommendations_request = {
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "If your account is the management account or the delegated administrator of an \
         organization, this parameter indicates whether to include recommendations for resources \
         in all member accounts of the organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  If this parameter is omitted, recommendations for member accounts of the organization \
         aren't included in the export file.\n\
        \  \n\
        \   If this parameter or the account ID parameter is omitted, recommendations for member \
         accounts aren't included in the export.\n\
        \   "]
  file_format : file_format option;
      [@ocaml.doc
        " The format of the export file. \n\n\
        \ The CSV file is the only export file format currently supported.\n\
        \ "]
  s3_destination_config : s3_destination_config; [@ocaml.doc ""]
  fields_to_export : exportable_ecs_service_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : ecs_service_recommendation_filters option;
      [@ocaml.doc
        " An array of objects to specify a filter that exports a more specific set of Amazon ECS \
         service recommendations. \n"]
  account_ids : account_ids option;
      [@ocaml.doc
        " The Amazon Web Services account IDs for the export Amazon ECS service recommendations. \n\n\
        \ If your account is the management account or the delegated administrator of an \
         organization, use this parameter to specify the member account you want to export \
         recommendations to.\n\
        \ \n\
        \  This parameter can't be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   If this parameter or the include member accounts parameter is omitted, the \
         recommendations for member accounts aren't included in the export.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec export_ec2_instance_recommendations_response = {
  s3_destination : s3_destination option;
      [@ocaml.doc
        "An object that describes the destination Amazon S3 bucket of a recommendations export file.\n"]
  job_id : job_id option;
      [@ocaml.doc
        "The identification number of the export job.\n\n\
        \ Use the [DescribeRecommendationExportJobs] action, and specify the job ID to view the \
         status of an export job.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_ec2_instance_recommendations_request = {
  recommendation_preferences : recommendation_preferences option;
      [@ocaml.doc
        "An object to specify the preferences for the Amazon EC2 instance recommendations to export.\n"]
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "Indicates whether to include recommendations for resources in all member accounts of the \
         organization if your account is the management account of an organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  Recommendations for member accounts of the organization are not included in the export \
         file if this parameter is omitted.\n\
        \  \n\
        \   Recommendations for member accounts are not included in the export if this parameter, \
         or the account IDs parameter, is omitted.\n\
        \   "]
  file_format : file_format option;
      [@ocaml.doc
        "The format of the export file.\n\n\
        \ The only export file format currently supported is [Csv].\n\
        \ "]
  s3_destination_config : s3_destination_config;
      [@ocaml.doc
        "An object to specify the destination Amazon Simple Storage Service (Amazon S3) bucket \
         name and key prefix for the export job.\n\n\
        \ You must create the destination Amazon S3 bucket for your recommendations export before \
         you create the export job. Compute Optimizer does not create the S3 bucket for you. After \
         you create the S3 bucket, ensure that it has the required permissions policy to allow \
         Compute Optimizer to write the export file to it. If you plan to specify an object prefix \
         when you create the export job, you must include the object prefix in the policy that you \
         add to the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html}Amazon \
         S3 Bucket Policy for Compute Optimizer} in the {i Compute Optimizer User Guide}.\n\
        \ "]
  fields_to_export : exportable_instance_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that exports a more specific set of instance \
         recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The IDs of the Amazon Web Services accounts for which to export instance recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to export recommendations.\n\
        \ \n\
        \  This parameter cannot be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   Recommendations for member accounts are not included in the export if this parameter, \
         or the include member accounts parameter, is omitted.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec export_ebs_volume_recommendations_response = {
  s3_destination : s3_destination option; [@ocaml.doc ""]
  job_id : job_id option;
      [@ocaml.doc
        "The identification number of the export job.\n\n\
        \ Use the [DescribeRecommendationExportJobs] action, and specify the job ID to view the \
         status of an export job.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_ebs_volume_recommendations_request = {
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "Indicates whether to include recommendations for resources in all member accounts of the \
         organization if your account is the management account of an organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  Recommendations for member accounts of the organization are not included in the export \
         file if this parameter is omitted.\n\
        \  \n\
        \   This parameter cannot be specified together with the account IDs parameter. The \
         parameters are mutually exclusive.\n\
        \   \n\
        \    Recommendations for member accounts are not included in the export if this parameter, \
         or the account IDs parameter, is omitted.\n\
        \    "]
  file_format : file_format option;
      [@ocaml.doc
        "The format of the export file.\n\n\
        \ The only export file format currently supported is [Csv].\n\
        \ "]
  s3_destination_config : s3_destination_config; [@ocaml.doc ""]
  fields_to_export : exportable_volume_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : ebs_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that exports a more specific set of Amazon EBS \
         volume recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The IDs of the Amazon Web Services accounts for which to export Amazon EBS volume \
         recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to export recommendations.\n\
        \ \n\
        \  This parameter cannot be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   Recommendations for member accounts are not included in the export if this parameter, \
         or the include member accounts parameter, is omitted.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec export_auto_scaling_group_recommendations_response = {
  s3_destination : s3_destination option;
      [@ocaml.doc
        "An object that describes the destination Amazon S3 bucket of a recommendations export file.\n"]
  job_id : job_id option;
      [@ocaml.doc
        "The identification number of the export job.\n\n\
        \ Use the [DescribeRecommendationExportJobs] action, and specify the job ID to view the \
         status of an export job.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec export_auto_scaling_group_recommendations_request = {
  recommendation_preferences : recommendation_preferences option;
      [@ocaml.doc
        "An object to specify the preferences for the Auto Scaling group recommendations to export.\n"]
  include_member_accounts : include_member_accounts option;
      [@ocaml.doc
        "Indicates whether to include recommendations for resources in all member accounts of the \
         organization if your account is the management account of an organization.\n\n\
        \ The member accounts must also be opted in to Compute Optimizer, and trusted access for \
         Compute Optimizer must be enabled in the organization account. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access}Compute \
         Optimizer and Amazon Web Services Organizations trusted access} in the {i Compute \
         Optimizer User Guide}.\n\
        \ \n\
        \  Recommendations for member accounts of the organization are not included in the export \
         file if this parameter is omitted.\n\
        \  \n\
        \   This parameter cannot be specified together with the account IDs parameter. The \
         parameters are mutually exclusive.\n\
        \   \n\
        \    Recommendations for member accounts are not included in the export if this parameter, \
         or the account IDs parameter, is omitted.\n\
        \    "]
  file_format : file_format option;
      [@ocaml.doc
        "The format of the export file.\n\n\
        \ The only export file format currently supported is [Csv].\n\
        \ "]
  s3_destination_config : s3_destination_config;
      [@ocaml.doc
        "An object to specify the destination Amazon Simple Storage Service (Amazon S3) bucket \
         name and key prefix for the export job.\n\n\
        \ You must create the destination Amazon S3 bucket for your recommendations export before \
         you create the export job. Compute Optimizer does not create the S3 bucket for you. After \
         you create the S3 bucket, ensure that it has the required permissions policy to allow \
         Compute Optimizer to write the export file to it. If you plan to specify an object prefix \
         when you create the export job, you must include the object prefix in the policy that you \
         add to the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html}Amazon \
         S3 Bucket Policy for Compute Optimizer} in the {i Compute Optimizer User Guide}.\n\
        \ "]
  fields_to_export : exportable_auto_scaling_group_fields option;
      [@ocaml.doc
        "The recommendations data to include in the export file. For more information about the \
         fields that can be exported, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files}Exported \
         files} in the {i Compute Optimizer User Guide}.\n"]
  filters : filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that exports a more specific set of Auto Scaling \
         group recommendations.\n"]
  account_ids : account_ids option;
      [@ocaml.doc
        "The IDs of the Amazon Web Services accounts for which to export Auto Scaling group \
         recommendations.\n\n\
        \ If your account is the management account of an organization, use this parameter to \
         specify the member account for which you want to export recommendations.\n\
        \ \n\
        \  This parameter cannot be specified together with the include member accounts parameter. \
         The parameters are mutually exclusive.\n\
        \  \n\
        \   Recommendations for member accounts are not included in the export if this parameter, \
         or the include member accounts parameter, is omitted.\n\
        \   \n\
        \    You can specify multiple account IDs per request.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec describe_recommendation_export_jobs_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to advance to the next page of export jobs.\n\n\
        \ This value is null when there are no more pages of export jobs to return.\n\
        \ "]
  recommendation_export_jobs : recommendation_export_jobs option;
      [@ocaml.doc "An array of objects that describe recommendation export jobs.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_recommendation_export_jobs_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of export jobs to return with a single request.\n\n\
        \ To retrieve the remaining results, make another request with the returned [nextToken] \
         value.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc "The token to advance to the next page of export jobs.\n"]
  filters : job_filters option;
      [@ocaml.doc
        "An array of objects to specify a filter that returns a more specific list of export jobs.\n"]
  job_ids : job_ids option;
      [@ocaml.doc
        "The identification numbers of the export jobs to return.\n\n\
        \ An export job ID is returned when you create an export using the \
         [ExportAutoScalingGroupRecommendations] or [ExportEC2InstanceRecommendations] actions.\n\
        \ \n\
        \  All export jobs created in the last seven days are returned if this parameter is omitted.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_recommendation_preferences_response = unit [@@ocaml.doc ""]

type nonrec delete_recommendation_preferences_request = {
  recommendation_preference_names : recommendation_preference_names;
      [@ocaml.doc "The name of the recommendation preference to delete.\n"]
  scope : scope option;
      [@ocaml.doc
        "An object that describes the scope of the recommendation preference to delete.\n\n\
        \ You can delete recommendation preferences that are created at the organization level \
         (for management accounts of an organization only), account level, and resource level. For \
         more information, see \
         {{:https://docs.aws.amazon.com/compute-optimizer/latest/ug/enhanced-infrastructure-metrics.html}Activating \
         enhanced infrastructure metrics} in the {i Compute Optimizer User Guide}.\n\
        \ "]
  resource_type : resource_type;
      [@ocaml.doc
        "The target resource type of the recommendation preference to delete.\n\n\
        \ The [Ec2Instance] option encompasses standalone instances and instances that are part of \
         Auto Scaling groups. The [AutoScalingGroup] option encompasses only instances that are \
         part of an Auto Scaling group.\n\
        \ "]
}
[@@ocaml.doc ""]
