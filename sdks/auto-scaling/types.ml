type nonrec nullable_positive_integer = int [@@ocaml.doc ""]

type nonrec accelerator_count_request = {
  min : nullable_positive_integer option; [@ocaml.doc "The minimum value.\n"]
  max : nullable_positive_integer option; [@ocaml.doc "The maximum value.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [AcceleratorCount] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec accelerator_manufacturer =
  | NVIDIA [@ocaml.doc ""]
  | AMD [@ocaml.doc ""]
  | AMAZON_WEB_SERVICES [@ocaml.doc ""]
  | XILINX [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerator_manufacturers = accelerator_manufacturer list [@@ocaml.doc ""]

type nonrec accelerator_name =
  | A100 [@ocaml.doc ""]
  | V100 [@ocaml.doc ""]
  | K80 [@ocaml.doc ""]
  | T4 [@ocaml.doc ""]
  | M60 [@ocaml.doc ""]
  | RADEON_PRO_V520 [@ocaml.doc ""]
  | VU9P [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerator_names = accelerator_name list [@@ocaml.doc ""]

type nonrec accelerator_total_memory_mi_b_request = {
  min : nullable_positive_integer option; [@ocaml.doc "The memory minimum in MiB.\n"]
  max : nullable_positive_integer option; [@ocaml.doc "The memory maximum in MiB.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [AcceleratorTotalMemoryMiB] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec accelerator_type =
  | GPU [@ocaml.doc ""]
  | FPGA [@ocaml.doc ""]
  | INFERENCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accelerator_types = accelerator_type list [@@ocaml.doc ""]

type nonrec xml_string_max_len255 = string [@@ocaml.doc ""]

type nonrec active_instance_refresh_not_found_fault = {
  message : xml_string_max_len255 option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because an active instance refresh or rollback for the specified Auto \
   Scaling group was not found.\n"]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec auto_scaling_group_state = string [@@ocaml.doc ""]

type nonrec xml_string = string [@@ocaml.doc ""]

type nonrec progress = int [@@ocaml.doc ""]

type nonrec scaling_activity_status_code =
  | PendingSpotBidPlacement [@ocaml.doc ""]
  | WaitingForSpotInstanceRequestId [@ocaml.doc ""]
  | WaitingForSpotInstanceId [@ocaml.doc ""]
  | WaitingForInstanceId [@ocaml.doc ""]
  | PreInService [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | WaitingForELBConnectionDraining [@ocaml.doc ""]
  | MidLifecycleAction [@ocaml.doc ""]
  | WaitingForInstanceWarmup [@ocaml.doc ""]
  | Successful [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Cancelled [@ocaml.doc ""]
  | WaitingForConnectionDraining [@ocaml.doc ""]
  | WaitingForInPlaceUpdateToStart [@ocaml.doc ""]
  | WaitingForInPlaceUpdateToFinalize [@ocaml.doc ""]
  | InPlaceUpdateInProgress [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec xml_string_max_len1023 = string [@@ocaml.doc ""]

type nonrec activity = {
  activity_id : xml_string; [@ocaml.doc "The ID of the activity.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  description : xml_string option;
      [@ocaml.doc "A friendly, more verbose description of the activity.\n"]
  cause : xml_string_max_len1023; [@ocaml.doc "The reason the activity began.\n"]
  start_time : timestamp_type; [@ocaml.doc "The start time of the activity.\n"]
  end_time : timestamp_type option; [@ocaml.doc "The end time of the activity.\n"]
  status_code : scaling_activity_status_code; [@ocaml.doc "The current status of the activity.\n"]
  status_message : xml_string_max_len255 option;
      [@ocaml.doc "A friendly, more verbose description of the activity status.\n"]
  progress : progress option;
      [@ocaml.doc "A value between 0 and 100 that indicates the progress of the activity.\n"]
  details : xml_string option; [@ocaml.doc "The details about the activity.\n"]
  auto_scaling_group_state : auto_scaling_group_state option;
      [@ocaml.doc
        "The state of the Auto Scaling group, which is either [InService] or [Deleted].\n"]
  auto_scaling_group_ar_n : resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Auto Scaling group.\n"]
}
[@@ocaml.doc
  "Describes scaling activity, which is a long-running process that represents a change to your \
   Auto Scaling group, such as changing its size or replacing an instance.\n"]

type nonrec activities = activity list [@@ocaml.doc ""]

type nonrec activities_type = {
  activities : activities;
      [@ocaml.doc
        "The scaling activities. Activities are sorted by start time. Activities still in progress \
         are described first.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec activity_ids = xml_string list [@@ocaml.doc ""]

type nonrec activity_type = { activity : activity option [@ocaml.doc "A scaling activity.\n"] }
[@@ocaml.doc ""]

type nonrec adjustment_type = {
  adjustment_type : xml_string_max_len255 option;
      [@ocaml.doc
        "The policy adjustment type. The valid values are [ChangeInCapacity], [ExactCapacity], and \
         [PercentChangeInCapacity].\n"]
}
[@@ocaml.doc "Describes a policy adjustment type.\n"]

type nonrec adjustment_types = adjustment_type list [@@ocaml.doc ""]

type nonrec alarm = {
  alarm_name : xml_string_max_len255 option; [@ocaml.doc "The name of the alarm.\n"]
  alarm_ar_n : resource_name option; [@ocaml.doc "The Amazon Resource Name (ARN) of the alarm.\n"]
}
[@@ocaml.doc "Describes an alarm.\n"]

type nonrec alarm_list = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec alarm_specification = {
  alarms : alarm_list option;
      [@ocaml.doc
        "The names of one or more CloudWatch alarms to monitor for the instance refresh. You can \
         specify up to 10 alarms.\n"]
}
[@@ocaml.doc "Specifies the CloudWatch alarm specification to use in an instance refresh.\n"]

type nonrec alarms = alarm list [@@ocaml.doc ""]

type nonrec allowed_instance_type = string [@@ocaml.doc ""]

type nonrec allowed_instance_types = allowed_instance_type list [@@ocaml.doc ""]

type nonrec already_exists_fault = { message : xml_string_max_len255 option [@ocaml.doc "\n"] }
[@@ocaml.doc "You already have an Auto Scaling group or launch configuration with this name.\n"]

type nonrec any_printable_ascii_string_max_len4000 = string [@@ocaml.doc ""]

type nonrec ascii_string_max_len255 = string [@@ocaml.doc ""]

type nonrec associate_public_ip_address = bool [@@ocaml.doc ""]

type nonrec service_linked_role_failure = { message : xml_string_max_len255 option [@ocaml.doc ""] }
[@@ocaml.doc "The service-linked role is not yet ready for use.\n"]

type nonrec resource_contention_fault = { message : xml_string_max_len255 option [@ocaml.doc "\n"] }
[@@ocaml.doc
  "You already have a pending update to an Amazon EC2 Auto Scaling resource (for example, an Auto \
   Scaling group, instance, or load balancer).\n"]

type nonrec xml_string_max_len19 = string [@@ocaml.doc ""]

type nonrec instance_ids = xml_string_max_len19 list [@@ocaml.doc ""]

type nonrec attach_instances_query = {
  instance_ids : instance_ids option;
      [@ocaml.doc "The IDs of the instances. You can specify up to 20 instances.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_refresh_in_progress_fault = {
  message : xml_string_max_len255 option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because an active instance refresh already exists for the specified Auto \
   Scaling group.\n"]

type nonrec attach_load_balancer_target_groups_result_type = unit [@@ocaml.doc ""]

type nonrec xml_string_max_len511 = string [@@ocaml.doc ""]

type nonrec target_group_ar_ns = xml_string_max_len511 list [@@ocaml.doc ""]

type nonrec attach_load_balancer_target_groups_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  target_group_ar_ns : target_group_ar_ns;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the target groups. You can specify up to 10 target \
         groups. To get the ARN of a target group, use the Elastic Load Balancing \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html}DescribeTargetGroups} \
         API operation.\n"]
}
[@@ocaml.doc ""]

type nonrec attach_load_balancers_result_type = unit [@@ocaml.doc ""]

type nonrec load_balancer_names = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec attach_load_balancers_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  load_balancer_names : load_balancer_names;
      [@ocaml.doc "The names of the load balancers. You can specify up to 10 load balancers.\n"]
}
[@@ocaml.doc ""]

type nonrec attach_traffic_sources_result_type = unit [@@ocaml.doc ""]

type nonrec skip_zonal_shift_validation = bool [@@ocaml.doc ""]

type nonrec traffic_source_identifier = {
  identifier : xml_string_max_len511;
      [@ocaml.doc
        "Identifies the traffic source.\n\n\
        \ For Application Load Balancers, Gateway Load Balancers, Network Load Balancers, and VPC \
         Lattice, this will be the Amazon Resource Name (ARN) for a target group in this account \
         and Region. For Classic Load Balancers, this will be the name of the Classic Load \
         Balancer in this account and Region.\n\
        \ \n\
        \  For example: \n\
        \  \n\
        \   {ul\n\
        \         {-  Application Load Balancer ARN: \
         [arn:aws:elasticloadbalancing:us-west-2:123456789012:targetgroup/my-targets/1234567890123456] \n\
        \             \n\
        \              }\n\
        \         {-  Classic Load Balancer name: [my-classic-load-balancer] \n\
        \             \n\
        \              }\n\
        \         {-  VPC Lattice ARN: \
         [arn:aws:vpc-lattice:us-west-2:123456789012:targetgroup/tg-1234567890123456] \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   To get the ARN of a target group for a Application Load Balancer, Gateway Load \
         Balancer, or Network Load Balancer, or the name of a Classic Load Balancer, use the \
         Elastic Load Balancing \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html}DescribeTargetGroups} \
         and \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html}DescribeLoadBalancers} \
         API operations.\n\
        \   \n\
        \    To get the ARN of a target group for VPC Lattice, use the VPC Lattice \
         {{:https://docs.aws.amazon.com/vpc-lattice/latest/APIReference/API_GetTargetGroup.html}GetTargetGroup} \
         API operation.\n\
        \    "]
  type_ : xml_string_max_len511 option;
      [@ocaml.doc
        "Provides additional context for the value of [Identifier].\n\n\
        \ The following lists the valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [elb] if [Identifier] is the name of a Classic Load Balancer.\n\
        \            \n\
        \             }\n\
        \        {-   [elbv2] if [Identifier] is the ARN of an Application Load Balancer, Gateway \
         Load Balancer, or Network Load Balancer target group.\n\
        \            \n\
        \             }\n\
        \        {-   [vpc-lattice] if [Identifier] is the ARN of a VPC Lattice target group.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Required if the identifier is the name of a Classic Load Balancer.\n\
        \   "]
}
[@@ocaml.doc "Identifying information for a traffic source.\n"]

type nonrec traffic_sources = traffic_source_identifier list [@@ocaml.doc ""]

type nonrec attach_traffic_sources_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  traffic_sources : traffic_sources;
      [@ocaml.doc
        "The unique identifiers of one or more traffic sources. You can specify up to 10 traffic \
         sources.\n"]
  skip_zonal_shift_validation : skip_zonal_shift_validation option;
      [@ocaml.doc
        " If you enable zonal shift with cross-zone disabled load balancers, capacity could become \
         imbalanced across Availability Zones. To skip the validation, specify [true]. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-zonal-shift.html}Auto \
         Scaling group zonal shift} in the {i Amazon EC2 Auto Scaling User Guide}. \n"]
}
[@@ocaml.doc ""]

type nonrec auto_rollback = bool [@@ocaml.doc ""]

type nonrec retention_action = Retain [@ocaml.doc ""] | Terminate [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec retention_triggers = {
  terminate_hook_abandon : retention_action option;
      [@ocaml.doc
        " Specifies the action when a termination lifecycle hook is abandoned due to failure, \
         timeout, or explicit abandonment (calling CompleteLifecycleAction). \n\n\
        \  Set to [retain] to move instances to a retained state. Set to [terminate] for default \
         termination behavior. \n\
        \ \n\
        \   Retained instances don't count toward desired capacity and remain until you call \
         [TerminateInstanceInAutoScalingGroup]. \n\
        \  "]
}
[@@ocaml.doc
  " Defines the specific triggers that cause instances to be retained in a Retained state rather \
   than terminated. Each trigger corresponds to a different failure scenario during the instance \
   lifecycle. This allows fine-grained control over when to preserve instances for manual \
   intervention. \n"]

type nonrec instance_lifecycle_policy = {
  retention_triggers : retention_triggers option;
      [@ocaml.doc
        " Specifies the conditions that trigger instance retention behavior. These triggers \
         determine when instances should move to a [Retained] state instead of automatic \
         termination. This allows you to maintain control over instance management when lifecycles \
         transition and operations fail. \n"]
}
[@@ocaml.doc
  " The instance lifecycle policy for the Auto Scaling group. This policy controls instance \
   behavior when an instance transitions through its lifecycle states. Configure retention \
   triggers to specify when instances should move to a [Retained] state instead of automatic \
   termination. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/instance-lifecycle-policy.html} \
   Control instance retention with instance lifecycle policies} in the {i Amazon EC2 Auto Scaling \
   User Guide}. \n\
  \ "]

type nonrec capacity_reservation_resource_group_arns = resource_name list [@@ocaml.doc ""]

type nonrec capacity_reservation_ids = ascii_string_max_len255 list [@@ocaml.doc ""]

type nonrec capacity_reservation_target = {
  capacity_reservation_ids : capacity_reservation_ids option;
      [@ocaml.doc " The Capacity Reservation IDs to launch instances into. \n"]
  capacity_reservation_resource_group_arns : capacity_reservation_resource_group_arns option;
      [@ocaml.doc
        " The resource group ARNs of the Capacity Reservation to launch instances into. \n"]
}
[@@ocaml.doc
  " The target for the Capacity Reservation. Specify Capacity Reservations IDs or Capacity \
   Reservation resource group ARNs. \n"]

type nonrec capacity_reservation_preference =
  | CapacityReservationsOnly [@ocaml.doc ""]
  | CapacityReservationsFirst [@ocaml.doc ""]
  | None_ [@ocaml.doc ""]
  | Default [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec capacity_reservation_specification = {
  capacity_reservation_preference : capacity_reservation_preference option;
      [@ocaml.doc
        " The capacity reservation preference. The following options are available: \n\n\
        \ {ul\n\
        \       {-   [capacity-reservations-only] - Auto Scaling will only launch instances into a \
         Capacity Reservation or Capacity Reservation resource group. If capacity isn't available, \
         instances will fail to launch.\n\
        \           \n\
        \            }\n\
        \       {-   [capacity-reservations-first] - Auto Scaling will try to launch instances \
         into a Capacity Reservation or Capacity Reservation resource group first. If capacity \
         isn't available, instances will run in On-Demand capacity.\n\
        \           \n\
        \            }\n\
        \       {-   [none] - Auto Scaling will not launch instances into a Capacity Reservation. \
         Instances will run in On-Demand capacity. \n\
        \           \n\
        \            }\n\
        \       {-   [default] - Auto Scaling uses the Capacity Reservation preference from your \
         launch template or an open Capacity Reservation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  capacity_reservation_target : capacity_reservation_target option;
      [@ocaml.doc
        " Describes a target Capacity Reservation or Capacity Reservation resource group. \n"]
}
[@@ocaml.doc
  " Describes the Capacity Reservation preference and targeting options. If you specify [open] or \
   [none] for [CapacityReservationPreference], do not specify a [CapacityReservationTarget]. \n"]

type nonrec impaired_zone_health_check_behavior =
  | ReplaceUnhealthy [@ocaml.doc ""]
  | IgnoreUnhealthy [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec zonal_shift_enabled = bool [@@ocaml.doc ""]

type nonrec availability_zone_impairment_policy = {
  zonal_shift_enabled : zonal_shift_enabled option;
      [@ocaml.doc " If [true], enable zonal shift for your Auto Scaling group. \n"]
  impaired_zone_health_check_behavior : impaired_zone_health_check_behavior option;
      [@ocaml.doc
        " Specifies the health check behavior for the impaired Availability Zone in an active \
         zonal shift. If you select [Replace unhealthy], instances that appear unhealthy will be \
         replaced in all Availability Zones. If you select [Ignore unhealthy], instances will not \
         be replaced in the Availability Zone with the active zonal shift. For more information, \
         see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-zonal-shift.html}Auto \
         Scaling group zonal shift} in the {i Amazon EC2 Auto Scaling User Guide}. \n"]
}
[@@ocaml.doc " Describes an Availability Zone impairment policy. \n"]

type nonrec capacity_distribution_strategy =
  | BALANCED_ONLY [@ocaml.doc ""]
  | BALANCED_BEST_EFFORT [@ocaml.doc ""]
  | RESERVATIONS_THEN_BALANCED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec availability_zone_distribution = {
  capacity_distribution_strategy : capacity_distribution_strategy option;
      [@ocaml.doc
        " If launches fail in an Availability Zone, the following strategies are available. The \
         default is [balanced-best-effort]. \n\n\
        \ {ul\n\
        \       {-   [balanced-only] - If launches fail in an Availability Zone, Auto Scaling will \
         continue to attempt to launch in the unhealthy zone to preserve a balanced distribution.\n\
        \           \n\
        \            }\n\
        \       {-   [balanced-best-effort] - If launches fail in an Availability Zone, Auto \
         Scaling will attempt to launch in another healthy Availability Zone instead.\n\
        \           \n\
        \            }\n\
        \       {-   [reservations-then-balanced] - Auto Scaling will first attempt to launch into \
         your Capacity Reservations, and then balance any remaining capacity across the healthy \
         Availability Zones.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc " Describes an Availability Zone distribution. \n"]

type nonrec deletion_protection =
  | None_ [@ocaml.doc ""]
  | PreventForceDeletion [@ocaml.doc ""]
  | PreventAllDeletion [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec int_percent100_to200_resettable = int [@@ocaml.doc ""]

type nonrec int_percent_resettable = int [@@ocaml.doc ""]

type nonrec instance_maintenance_policy = {
  min_healthy_percentage : int_percent_resettable option;
      [@ocaml.doc
        "Specifies the lower threshold as a percentage of the desired capacity of the Auto Scaling \
         group. It represents the minimum percentage of the group to keep in service, healthy, and \
         ready to use to support your workload when replacing instances. Value range is 0 to 100. \
         To clear a previously set value, specify a value of [-1].\n"]
  max_healthy_percentage : int_percent100_to200_resettable option;
      [@ocaml.doc
        "Specifies the upper threshold as a percentage of the desired capacity of the Auto Scaling \
         group. It represents the maximum percentage of the group that can be in service and \
         healthy, or pending, to support your workload when replacing instances. Value range is \
         100 to 200. To clear a previously set value, specify a value of [-1].\n\n\
        \ Both [MinHealthyPercentage] and [MaxHealthyPercentage] must be specified, and the \
         difference between them cannot be greater than 100. A large range increases the number of \
         instances that can be replaced at the same time.\n\
        \ "]
}
[@@ocaml.doc
  "Describes an instance maintenance policy.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-maintenance-policy.html}Set \
   instance maintenance policy} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

type nonrec default_instance_warmup = int [@@ocaml.doc ""]

type nonrec context = string [@@ocaml.doc ""]

type nonrec warm_pool_size = int [@@ocaml.doc ""]

type nonrec reuse_on_scale_in = bool [@@ocaml.doc ""]

type nonrec instance_reuse_policy = {
  reuse_on_scale_in : reuse_on_scale_in option;
      [@ocaml.doc
        "Specifies whether instances in the Auto Scaling group can be returned to the warm pool on \
         scale in. \n"]
}
[@@ocaml.doc
  "Describes an instance reuse policy for a warm pool. \n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-warm-pools.html}Warm \
   pools for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

type nonrec warm_pool_status = PendingDelete [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec warm_pool_state =
  | Stopped [@ocaml.doc ""]
  | Running [@ocaml.doc ""]
  | Hibernated [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec warm_pool_min_size = int [@@ocaml.doc ""]

type nonrec max_group_prepared_capacity = int [@@ocaml.doc ""]

type nonrec warm_pool_configuration = {
  max_group_prepared_capacity : max_group_prepared_capacity option;
      [@ocaml.doc
        "The maximum number of instances that are allowed to be in the warm pool or in any state \
         except [Terminated] for the Auto Scaling group.\n"]
  min_size : warm_pool_min_size option;
      [@ocaml.doc "The minimum number of instances to maintain in the warm pool.\n"]
  pool_state : warm_pool_state option;
      [@ocaml.doc "The instance state to transition to after the lifecycle actions are complete.\n"]
  status : warm_pool_status option;
      [@ocaml.doc "The status of a warm pool that is marked for deletion.\n"]
  instance_reuse_policy : instance_reuse_policy option; [@ocaml.doc "The instance reuse policy.\n"]
}
[@@ocaml.doc "Describes a warm pool configuration. \n"]

type nonrec capacity_rebalance_enabled = bool [@@ocaml.doc ""]

type nonrec max_instance_lifetime = int [@@ocaml.doc ""]

type nonrec instance_protected = bool [@@ocaml.doc ""]

type nonrec xml_string_max_len1600 = string [@@ocaml.doc ""]

type nonrec termination_policies = xml_string_max_len1600 list [@@ocaml.doc ""]

type nonrec propagate_at_launch = bool [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_description = {
  resource_id : xml_string option; [@ocaml.doc "The name of the group.\n"]
  resource_type : xml_string option;
      [@ocaml.doc "The type of resource. The only supported value is [auto-scaling-group].\n"]
  key : tag_key option; [@ocaml.doc "The tag key.\n"]
  value : tag_value option; [@ocaml.doc "The tag value.\n"]
  propagate_at_launch : propagate_at_launch option;
      [@ocaml.doc
        "Determines whether the tag is added to new instances as they are launched in the group.\n"]
}
[@@ocaml.doc "Describes a tag for an Auto Scaling group.\n"]

type nonrec tag_description_list = tag_description list [@@ocaml.doc ""]

type nonrec enabled_metric = {
  metric : xml_string_max_len255 option;
      [@ocaml.doc
        "One of the following metrics:\n\n\
        \ {ul\n\
        \       {-   [GroupMinSize] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupMaxSize] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupDesiredCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupInServiceInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupPendingInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupStandbyInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTerminatingInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTotalInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupInServiceCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupPendingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupStandbyCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTerminatingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTotalCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolDesiredCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolWarmedCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolPendingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolTerminatingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolTotalCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupAndWarmPoolDesiredCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupAndWarmPoolTotalCapacity] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-metrics.html}Amazon \
         CloudWatch metrics for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\
        \   "]
  granularity : xml_string_max_len255 option;
      [@ocaml.doc "The granularity of the metric. The only valid value is [1Minute].\n"]
}
[@@ocaml.doc "Describes an enabled Auto Scaling group metric.\n"]

type nonrec enabled_metrics = enabled_metric list [@@ocaml.doc ""]

type nonrec xml_string_max_len5000 = string [@@ocaml.doc ""]

type nonrec suspended_process = {
  process_name : xml_string_max_len255 option; [@ocaml.doc "The name of the suspended process.\n"]
  suspension_reason : xml_string_max_len255 option;
      [@ocaml.doc "The reason that the process was suspended.\n"]
}
[@@ocaml.doc
  "Describes an auto scaling process that has been suspended.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types}Types \
   of processes} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

type nonrec suspended_processes = suspended_process list [@@ocaml.doc ""]

type nonrec xml_string_max_len32 = string [@@ocaml.doc ""]

type nonrec launch_template_name = string [@@ocaml.doc ""]

type nonrec launch_template_specification = {
  launch_template_id : xml_string_max_len255 option;
      [@ocaml.doc
        "The ID of the launch template. To get the template ID, use the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html}DescribeLaunchTemplates} \
         API operation. New launch templates can be created using the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html}CreateLaunchTemplate} \
         API. \n\n\
        \ Conditional: You must specify either a [LaunchTemplateId] or a [LaunchTemplateName].\n\
        \ "]
  launch_template_name : launch_template_name option;
      [@ocaml.doc
        "The name of the launch template. To get the template name, use the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplates.html}DescribeLaunchTemplates} \
         API operation. New launch templates can be created using the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplate.html}CreateLaunchTemplate} \
         API. \n\n\
        \ Conditional: You must specify either a [LaunchTemplateId] or a [LaunchTemplateName].\n\
        \ "]
  version : xml_string_max_len255 option;
      [@ocaml.doc
        "The version number, [$Latest], or [$Default]. To get the version number, use the Amazon \
         EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeLaunchTemplateVersions.html}DescribeLaunchTemplateVersions} \
         API operation. New launch template versions can be created using the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_CreateLaunchTemplateVersion.html}CreateLaunchTemplateVersion} \
         API. If the value is [$Latest], Amazon EC2 Auto Scaling selects the latest version of the \
         launch template when launching instances. If the value is [$Default], Amazon EC2 Auto \
         Scaling selects the default version of the launch template when launching instances. The \
         default value is [$Default].\n"]
}
[@@ocaml.doc
  "Describes the launch template and the version of the launch template that Amazon EC2 Auto \
   Scaling uses to launch Amazon EC2 instances. For more information about launch templates, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html}Launch \
   templates} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]

type nonrec lifecycle_state =
  | PENDING [@ocaml.doc ""]
  | PENDING_WAIT [@ocaml.doc ""]
  | PENDING_PROCEED [@ocaml.doc ""]
  | QUARANTINED [@ocaml.doc ""]
  | IN_SERVICE [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATING_WAIT [@ocaml.doc ""]
  | TERMINATING_PROCEED [@ocaml.doc ""]
  | TERMINATING_RETAINED [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | DETACHING [@ocaml.doc ""]
  | DETACHED [@ocaml.doc ""]
  | ENTERING_STANDBY [@ocaml.doc ""]
  | STANDBY [@ocaml.doc ""]
  | REPLACING_ROOT_VOLUME [@ocaml.doc ""]
  | REPLACING_ROOT_VOLUME_WAIT [@ocaml.doc ""]
  | REPLACING_ROOT_VOLUME_PROCEED [@ocaml.doc ""]
  | ROOT_VOLUME_REPLACED [@ocaml.doc ""]
  | WARMED_PENDING [@ocaml.doc ""]
  | WARMED_PENDING_WAIT [@ocaml.doc ""]
  | WARMED_PENDING_PROCEED [@ocaml.doc ""]
  | WARMED_PENDING_RETAINED [@ocaml.doc ""]
  | WARMED_TERMINATING [@ocaml.doc ""]
  | WARMED_TERMINATING_WAIT [@ocaml.doc ""]
  | WARMED_TERMINATING_PROCEED [@ocaml.doc ""]
  | WARMED_TERMINATING_RETAINED [@ocaml.doc ""]
  | WARMED_TERMINATED [@ocaml.doc ""]
  | WARMED_STOPPED [@ocaml.doc ""]
  | WARMED_RUNNING [@ocaml.doc ""]
  | WARMED_HIBERNATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance = {
  instance_id : xml_string_max_len19; [@ocaml.doc "The ID of the instance.\n"]
  instance_type : xml_string_max_len255 option;
      [@ocaml.doc "The instance type of the EC2 instance.\n"]
  availability_zone : xml_string_max_len255;
      [@ocaml.doc "The Availability Zone in which the instance is running.\n"]
  availability_zone_id : xml_string_max_len255 option;
      [@ocaml.doc " The Availability Zone ID where the instance was launched. \n"]
  lifecycle_state : lifecycle_state;
      [@ocaml.doc
        "A description of the current lifecycle state. The [Quarantined] state is not used. For \
         more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-lifecycle.html}Amazon \
         EC2 Auto Scaling instance lifecycle} in the {i Amazon EC2 Auto Scaling User Guide}. \n"]
  health_status : xml_string_max_len32;
      [@ocaml.doc
        "The last reported health status of the instance. [Healthy] means that the instance is \
         healthy and should remain in service. [Unhealthy] means that the instance is unhealthy \
         and that Amazon EC2 Auto Scaling should terminate and replace it.\n"]
  launch_configuration_name : xml_string_max_len255 option;
      [@ocaml.doc "The launch configuration associated with the instance.\n"]
  launch_template : launch_template_specification option;
      [@ocaml.doc "The launch template for the instance.\n"]
  image_id : xml_string_max_len255 option;
      [@ocaml.doc
        " The ID of the Amazon Machine Image (AMI) used for the instance's current root volume. \
         This value reflects the most recent AMI applied to the instance, including updates made \
         through root volume replacement operations. \n\n\
        \  This field appears for: \n\
        \ \n\
        \  {ul\n\
        \        {-  Instances with root volume replacements through Instance Refresh\n\
        \            \n\
        \             }\n\
        \        {-  Instances launched with AMI overrides \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   This field won't appear for:\n\
        \   \n\
        \    {ul\n\
        \          {-  Existing instances launched from Launch Templates without overrides\n\
        \              \n\
        \               }\n\
        \          {-  Existing instances that didn\226\128\153t have their root volume replaced \
         through Instance Refresh\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  protected_from_scale_in : instance_protected;
      [@ocaml.doc
        "Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling \
         when scaling in.\n"]
  weighted_capacity : xml_string_max_len32 option;
      [@ocaml.doc
        "The number of capacity units contributed by the instance based on its instance type.\n\n\
        \ Valid Range: Minimum value of 1. Maximum value of 999.\n\
        \ "]
}
[@@ocaml.doc "Describes an EC2 instance.\n"]

type nonrec instances = instance list [@@ocaml.doc ""]

type nonrec health_check_grace_period = int [@@ocaml.doc ""]

type nonrec availability_zone_ids = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec availability_zones = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec cooldown = int [@@ocaml.doc ""]

type nonrec auto_scaling_group_predicted_capacity = int [@@ocaml.doc ""]

type nonrec auto_scaling_group_desired_capacity = int [@@ocaml.doc ""]

type nonrec auto_scaling_group_max_size = int [@@ocaml.doc ""]

type nonrec auto_scaling_group_min_size = int [@@ocaml.doc ""]

type nonrec mixed_instance_spot_price = string [@@ocaml.doc ""]

type nonrec spot_instance_pools = int [@@ocaml.doc ""]

type nonrec on_demand_percentage_above_base_capacity = int [@@ocaml.doc ""]

type nonrec on_demand_base_capacity = int [@@ocaml.doc ""]

type nonrec instances_distribution = {
  on_demand_allocation_strategy : xml_string option;
      [@ocaml.doc
        "The allocation strategy to apply to your On-Demand Instances when they are launched. \
         Possible instance types are determined by the launch template overrides that you \
         specify.\n\n\
        \ The following lists the valid values:\n\
        \ \n\
        \   lowest-price  Uses price to determine which instance types are the highest priority, \
         launching the lowest priced instance types within an Availability Zone first. This is the \
         default value for Auto Scaling groups that specify \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements}. \n\
        \                 \n\
        \                   prioritized  You set the order of instance types for the launch \
         template overrides from highest to lowest priority (from first to last in the list). \
         Amazon EC2 Auto Scaling launches your highest priority instance types first. If all your \
         On-Demand capacity cannot be fulfilled using your highest priority instance type, then \
         Amazon EC2 Auto Scaling launches the remaining capacity using the second priority \
         instance type, and so on. This is the default value for Auto Scaling groups that don't \
         specify \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
         and cannot be used for groups that do.\n\
        \                                \n\
        \                                  "]
  on_demand_base_capacity : on_demand_base_capacity option;
      [@ocaml.doc
        "The minimum amount of the Auto Scaling group's capacity that must be fulfilled by \
         On-Demand Instances. This base portion is launched first as your group scales.\n\n\
        \ This number has the same unit of measurement as the group's desired capacity. If you \
         change the default unit of measurement (number of instances) by specifying weighted \
         capacity values in your launch template overrides list, or by changing the default \
         desired capacity type setting of the group, you must specify this number using the same \
         unit of measurement.\n\
        \ \n\
        \  Default: 0\n\
        \  "]
  on_demand_percentage_above_base_capacity : on_demand_percentage_above_base_capacity option;
      [@ocaml.doc
        "Controls the percentages of On-Demand Instances and Spot Instances for your additional \
         capacity beyond [OnDemandBaseCapacity]. Expressed as a number (for example, 20 specifies \
         20% On-Demand Instances, 80% Spot Instances). If set to 100, only On-Demand Instances are \
         used.\n\n\
        \ Default: 100\n\
        \ "]
  spot_allocation_strategy : xml_string option;
      [@ocaml.doc
        "The allocation strategy to apply to your Spot Instances when they are launched. Possible \
         instance types are determined by the launch template overrides that you specify.\n\n\
        \ The following lists the valid values:\n\
        \ \n\
        \   capacity-optimized  Requests Spot Instances using pools that are optimally chosen \
         based on the available Spot capacity. This strategy has the lowest risk of interruption. \
         To give certain instance types a higher chance of launching first, use \
         [capacity-optimized-prioritized].\n\
        \                       \n\
        \                         capacity-optimized-prioritized  You set the order of instance \
         types for the launch template overrides from highest to lowest priority (from first to \
         last in the list). Amazon EC2 Auto Scaling honors the instance type priorities on a best \
         effort basis but optimizes for capacity first. Note that if the On-Demand allocation \
         strategy is set to [prioritized], the same priority is applied when fulfilling On-Demand \
         capacity. This is not a valid value for Auto Scaling groups that specify \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements}.\n\
        \                                                         \n\
        \                                                           lowest-price  Requests Spot \
         Instances using the lowest priced pools within an Availability Zone, across the number of \
         Spot pools that you specify for the [SpotInstancePools] property. To ensure that your \
         desired capacity is met, you might receive Spot Instances from several pools. This is the \
         default value, but it might lead to high interruption rates because this strategy only \
         considers instance price and not available capacity.\n\
        \                                                                         \n\
        \                                                                           \
         price-capacity-optimized (recommended)  \n\
         The price and capacity optimized allocation strategy looks at both price and capacity to \
         select the Spot Instance pools that are the least likely to be interrupted and have the \
         lowest possible price.\n\n\
        \  "]
  spot_instance_pools : spot_instance_pools option;
      [@ocaml.doc
        "The number of Spot Instance pools across which to allocate your Spot Instances. The Spot \
         pools are determined from the different instance types in the overrides. Valid only when \
         the [SpotAllocationStrategy] is [lowest-price]. Value must be in the range of \
         1\226\128\14720.\n\n\
        \ Default: 2\n\
        \ "]
  spot_max_price : mixed_instance_spot_price option;
      [@ocaml.doc
        "The maximum price per unit hour that you are willing to pay for a Spot Instance. If your \
         maximum price is lower than the Spot price for the instance types that you selected, your \
         Spot Instances are not launched. We do not recommend specifying a maximum price because \
         it can lead to increased interruptions. When Spot Instances launch, you pay the current \
         Spot price. To remove a maximum price that you previously set, include the property but \
         specify an empty string (\"\") for the value.\n\n\
        \  If you specify a maximum price, your instances will be interrupted more frequently than \
         if you do not specify one.\n\
        \  \n\
        \    Valid Range: Minimum value of 0.001\n\
        \    "]
}
[@@ocaml.doc
  "Use this structure to specify the distribution of On-Demand Instances and Spot Instances and \
   the allocation strategies used to fulfill On-Demand and Spot capacities for a mixed instances \
   policy.\n"]

type nonrec image_id = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec performance_factor_reference_request = {
  instance_family : string_ option;
      [@ocaml.doc
        " The instance family to use as a baseline reference. \n\n\
        \  Make sure that you specify the correct value for the instance family. The instance \
         family is everything before the period (.) in the instance type name. For example, in the \
         instance [c6i.large], the instance family is [c6i], not [c6]. For more information, see \
         {{:https://docs.aws.amazon.com/ec2/latest/instancetypes/instance-type-names.html}Amazon \
         EC2 instance type naming conventions} in {i Amazon EC2 Instance Types}.\n\
        \  \n\
        \    The following instance types are {i not supported} for performance protection.\n\
        \    \n\
        \     {ul\n\
        \           {-   [c1] \n\
        \               \n\
        \                }\n\
        \           {-   [g3| g3s] \n\
        \               \n\
        \                }\n\
        \           {-   [hpc7g] \n\
        \               \n\
        \                }\n\
        \           {-   [m1| m2] \n\
        \               \n\
        \                }\n\
        \           {-   [mac1 | mac2 | mac2-m1ultra | mac2-m2 | mac2-m2pro] \n\
        \               \n\
        \                }\n\
        \           {-   [p3dn | p4d | p5] \n\
        \               \n\
        \                }\n\
        \           {-   [t1] \n\
        \               \n\
        \                }\n\
        \           {-   [u-12tb1 | u-18tb1 | u-24tb1 | u-3tb1 | u-6tb1 | u-9tb1 | u7i-12tb | \
         u7in-16tb | u7in-24tb | u7in-32tb] \n\
        \               \n\
        \                }\n\
        \           }\n\
        \   If you performance protection by specifying a supported instance family, the returned \
         instance types will exclude the preceding unsupported instance families.\n\
        \   \n\
        \    If you specify an unsupported instance family as a value for baseline performance, \
         the API returns an empty response.\n\
        \    "]
}
[@@ocaml.doc
  " Specify an instance family to use as the baseline reference for CPU performance. All instance \
   types that All instance types that match your specified attributes will be compared against the \
   CPU performance of the referenced instance family, regardless of CPU manufacturer or \
   architecture differences. \n\n\
  \  Currently only one instance family can be specified in the list.\n\
  \  \n\
  \   "]

type nonrec performance_factor_reference_set_request = performance_factor_reference_request list
[@@ocaml.doc ""]

type nonrec cpu_performance_factor_request = {
  references : performance_factor_reference_set_request option;
      [@ocaml.doc
        " Specify an instance family to use as the baseline reference for CPU performance. All \
         instance types that match your specified attributes will be compared against the CPU \
         performance of the referenced instance family, regardless of CPU manufacturer or \
         architecture differences. \n\n\
        \  Currently only one instance family can be specified in the list.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  " The CPU performance to consider, using an instance family as the baseline reference. \n"]

type nonrec baseline_performance_factors_request = {
  cpu : cpu_performance_factor_request option;
      [@ocaml.doc
        " The CPU performance to consider, using an instance family as the baseline reference. \n"]
}
[@@ocaml.doc
  " The baseline performance to consider, using an instance family as a baseline reference. The \
   instance family establishes the lowest acceptable level of performance. Auto Scaling uses this \
   baseline to guide instance type selection, but there is no guarantee that the selected instance \
   types will always exceed the baseline for every application. \n\n\
  \ Currently, this parameter only supports CPU performance as a baseline performance factor. For \
   example, specifying [c6i] uses the CPU performance of the [c6i] family as the baseline \
   reference.\n\
  \ "]

type nonrec nullable_positive_double = float [@@ocaml.doc ""]

type nonrec network_bandwidth_gbps_request = {
  min : nullable_positive_double option;
      [@ocaml.doc "The minimum amount of network bandwidth, in gigabits per second (Gbps).\n"]
  max : nullable_positive_double option;
      [@ocaml.doc "The maximum amount of network bandwidth, in gigabits per second (Gbps).\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [NetworkBandwidthGbps] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n\n\
  \  Setting the minimum bandwidth does not guarantee that your instance will achieve the minimum \
   bandwidth. Amazon EC2 will identify instance types that support the specified minimum \
   bandwidth, but the actual bandwidth of your instance might go below the specified minimum at \
   times. For more information, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-network-bandwidth.html#available-instance-bandwidth}Available \
   instance bandwidth} in the {i Amazon EC2 User Guide}.\n\
  \  \n\
  \   "]

type nonrec baseline_ebs_bandwidth_mbps_request = {
  min : nullable_positive_integer option; [@ocaml.doc "The minimum value in Mbps.\n"]
  max : nullable_positive_integer option; [@ocaml.doc "The maximum value in Mbps.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [BaselineEbsBandwidthMbps] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec total_local_storage_gb_request = {
  min : nullable_positive_double option; [@ocaml.doc "The storage minimum in GB.\n"]
  max : nullable_positive_double option; [@ocaml.doc "The storage maximum in GB.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [TotalLocalStorageGB] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec local_storage_type = HDD [@ocaml.doc ""] | SSD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec local_storage_types = local_storage_type list [@@ocaml.doc ""]

type nonrec local_storage =
  | INCLUDED [@ocaml.doc ""]
  | EXCLUDED [@ocaml.doc ""]
  | REQUIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec network_interface_count_request = {
  min : nullable_positive_integer option; [@ocaml.doc "The minimum number of network interfaces.\n"]
  max : nullable_positive_integer option; [@ocaml.doc "The maximum number of network interfaces.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [NetworkInterfaceCount] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec burstable_performance =
  | INCLUDED [@ocaml.doc ""]
  | EXCLUDED [@ocaml.doc ""]
  | REQUIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec bare_metal =
  | INCLUDED [@ocaml.doc ""]
  | EXCLUDED [@ocaml.doc ""]
  | REQUIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_generation = CURRENT [@ocaml.doc ""] | PREVIOUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_generations = instance_generation list [@@ocaml.doc ""]

type nonrec excluded_instance = string [@@ocaml.doc ""]

type nonrec excluded_instance_types = excluded_instance list [@@ocaml.doc ""]

type nonrec memory_gi_b_per_v_cpu_request = {
  min : nullable_positive_double option; [@ocaml.doc "The memory minimum in GiB.\n"]
  max : nullable_positive_double option; [@ocaml.doc "The memory maximum in GiB.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [MemoryGiBPerVCpu] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec cpu_manufacturer =
  | INTEL [@ocaml.doc ""]
  | AMD [@ocaml.doc ""]
  | AMAZON_WEB_SERVICES [@ocaml.doc ""]
  | APPLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cpu_manufacturers = cpu_manufacturer list [@@ocaml.doc ""]

type nonrec memory_mi_b_request = {
  min : nullable_positive_integer; [@ocaml.doc "The memory minimum in MiB.\n"]
  max : nullable_positive_integer option; [@ocaml.doc "The memory maximum in MiB.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [MemoryMiB] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec v_cpu_count_request = {
  min : nullable_positive_integer; [@ocaml.doc "The minimum number of vCPUs.\n"]
  max : nullable_positive_integer option; [@ocaml.doc "The maximum number of vCPUs.\n"]
}
[@@ocaml.doc
  "Specifies the minimum and maximum for the [VCpuCount] object when you specify \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_InstanceRequirements.html}InstanceRequirements} \
   for an Auto Scaling group.\n"]

type nonrec instance_requirements = {
  v_cpu_count : v_cpu_count_request;
      [@ocaml.doc "The minimum and maximum number of vCPUs for an instance type.\n"]
  memory_mi_b : memory_mi_b_request;
      [@ocaml.doc "The minimum and maximum instance memory size for an instance type, in MiB.\n"]
  cpu_manufacturers : cpu_manufacturers option;
      [@ocaml.doc
        "Lists which specific CPU manufacturers to include.\n\n\
        \ {ul\n\
        \       {-  For instance types with Intel CPUs, specify [intel].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with AMD CPUs, specify [amd].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with Amazon Web Services CPUs, specify [amazon-web-services].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with Apple CPUs, specify [apple].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Don't confuse the CPU hardware manufacturer with the CPU hardware architecture. \
         Instances will be launched with a compatible CPU architecture based on the Amazon Machine \
         Image (AMI) that you specify in your launch template. \n\
        \    \n\
        \      Default: Any manufacturer\n\
        \      "]
  memory_gi_b_per_v_cpu : memory_gi_b_per_v_cpu_request option;
      [@ocaml.doc
        "The minimum and maximum amount of memory per vCPU for an instance type, in GiB.\n\n\
        \ Default: No minimum or maximum limits\n\
        \ "]
  excluded_instance_types : excluded_instance_types option;
      [@ocaml.doc
        "The instance types to exclude. You can use strings with one or more wild cards, \
         represented by an asterisk ([*]), to exclude an instance family, type, size, or \
         generation. The following are examples: [m5.8xlarge], [c5*.*], [m5a.*], [r*], [*3*]. \n\n\
        \ For example, if you specify [c5*], you are excluding the entire C5 instance family, \
         which includes all C5a and C5n instance types. If you specify [m5a.*], Amazon EC2 Auto \
         Scaling will exclude all the M5a instance types, but not the M5n instance types.\n\
        \ \n\
        \   If you specify [ExcludedInstanceTypes], you can't specify [AllowedInstanceTypes].\n\
        \   \n\
        \     Default: No excluded instance types\n\
        \     "]
  instance_generations : instance_generations option;
      [@ocaml.doc
        "Indicates whether current or previous generation instance types are included.\n\n\
        \ {ul\n\
        \       {-  For current generation instance types, specify [current]. The current \
         generation includes EC2 instance types currently recommended for use. This typically \
         includes the latest two to three generations in each instance family. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html}Instance \
         types} in the {i Amazon EC2 User Guide}.\n\
        \           \n\
        \            }\n\
        \       {-  For previous generation instance types, specify [previous].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default: Any current or previous generation\n\
        \   "]
  spot_max_price_percentage_over_lowest_price : nullable_positive_integer option;
      [@ocaml.doc
        "\\[Price protection\\] The price protection threshold for Spot Instances, as a percentage \
         higher than an identified Spot price. The identified Spot price is the price of the \
         lowest priced current generation C, M, or R instance type with your specified attributes. \
         If no current generation C, M, or R instance type matches your attributes, then the \
         identified price is from either the lowest priced current generation instance types or, \
         failing that, the lowest priced previous generation instance types that match your \
         attributes. When Amazon EC2 Auto Scaling selects instance types with your attributes, we \
         will exclude instance types whose price exceeds your specified threshold.\n\n\
        \ The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a \
         percentage. \n\
        \ \n\
        \  If you set [DesiredCapacityType] to [vcpu] or [memory-mib], the price protection \
         threshold is based on the per-vCPU or per-memory price instead of the per instance price. \n\
        \  \n\
        \    Only one of [SpotMaxPricePercentageOverLowestPrice] or \
         [MaxSpotPriceAsPercentageOfOptimalOnDemandPrice] can be specified. If you don't specify \
         either, Amazon EC2 Auto Scaling will automatically apply optimal price protection to \
         consistently select from a wide range of instance types. To indicate no price protection \
         threshold for Spot Instances, meaning you want to consider all instance types that match \
         your attributes, include one of these parameters and specify a high value, such as \
         [999999]. \n\
        \    \n\
        \     "]
  max_spot_price_as_percentage_of_optimal_on_demand_price : nullable_positive_integer option;
      [@ocaml.doc
        "\\[Price protection\\] The price protection threshold for Spot Instances, as a percentage \
         of an identified On-Demand price. The identified On-Demand price is the price of the \
         lowest priced current generation C, M, or R instance type with your specified attributes. \
         If no current generation C, M, or R instance type matches your attributes, then the \
         identified price is from either the lowest priced current generation instance types or, \
         failing that, the lowest priced previous generation instance types that match your \
         attributes. When Amazon EC2 Auto Scaling selects instance types with your attributes, we \
         will exclude instance types whose price exceeds your specified threshold.\n\n\
        \ The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a \
         percentage.\n\
        \ \n\
        \  If you set [DesiredCapacityType] to [vcpu] or [memory-mib], the price protection \
         threshold is based on the per-vCPU or per-memory price instead of the per instance price. \n\
        \  \n\
        \    Only one of [SpotMaxPricePercentageOverLowestPrice] or \
         [MaxSpotPriceAsPercentageOfOptimalOnDemandPrice] can be specified. If you don't specify \
         either, Amazon EC2 Auto Scaling will automatically apply optimal price protection to \
         consistently select from a wide range of instance types. To indicate no price protection \
         threshold for Spot Instances, meaning you want to consider all instance types that match \
         your attributes, include one of these parameters and specify a high value, such as \
         [999999]. \n\
        \    \n\
        \     "]
  on_demand_max_price_percentage_over_lowest_price : nullable_positive_integer option;
      [@ocaml.doc
        "\\[Price protection\\] The price protection threshold for On-Demand Instances, as a \
         percentage higher than an identified On-Demand price. The identified On-Demand price is \
         the price of the lowest priced current generation C, M, or R instance type with your \
         specified attributes. If no current generation C, M, or R instance type matches your \
         attributes, then the identified price is from either the lowest priced current generation \
         instance types or, failing that, the lowest priced previous generation instance types \
         that match your attributes. When Amazon EC2 Auto Scaling selects instance types with your \
         attributes, we will exclude instance types whose price exceeds your specified threshold. \
         \n\n\
        \ The parameter accepts an integer, which Amazon EC2 Auto Scaling interprets as a \
         percentage.\n\
        \ \n\
        \  To turn off price protection, specify a high value, such as [999999]. \n\
        \  \n\
        \   If you set [DesiredCapacityType] to [vcpu] or [memory-mib], the price protection \
         threshold is applied based on the per-vCPU or per-memory price instead of the per \
         instance price. \n\
        \   \n\
        \    Default: [20] \n\
        \    "]
  bare_metal : bare_metal option;
      [@ocaml.doc
        "Indicates whether bare metal instance types are included, excluded, or required.\n\n\
        \ Default: [excluded] \n\
        \ "]
  burstable_performance : burstable_performance option;
      [@ocaml.doc
        "Indicates whether burstable performance instance types are included, excluded, or \
         required. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-performance-instances.html}Burstable \
         performance instances} in the {i Amazon EC2 User Guide}.\n\n\
        \ Default: [excluded] \n\
        \ "]
  require_hibernate_support : nullable_boolean option;
      [@ocaml.doc
        "Indicates whether instance types must provide On-Demand Instance hibernation support.\n\n\
        \ Default: [false] \n\
        \ "]
  network_interface_count : network_interface_count_request option;
      [@ocaml.doc
        "The minimum and maximum number of network interfaces for an instance type.\n\n\
        \ Default: No minimum or maximum limits\n\
        \ "]
  local_storage : local_storage option;
      [@ocaml.doc
        "Indicates whether instance types with instance store volumes are included, excluded, or \
         required. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html}Amazon EC2 \
         instance store} in the {i Amazon EC2 User Guide}.\n\n\
        \ Default: [included] \n\
        \ "]
  local_storage_types : local_storage_types option;
      [@ocaml.doc
        "Indicates the type of local storage that is required.\n\n\
        \ {ul\n\
        \       {-  For instance types with hard disk drive (HDD) storage, specify [hdd].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with solid state drive (SSD) storage, specify [ssd].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default: Any local storage type\n\
        \   "]
  total_local_storage_g_b : total_local_storage_gb_request option;
      [@ocaml.doc
        "The minimum and maximum total local storage size for an instance type, in GB.\n\n\
        \ Default: No minimum or maximum limits\n\
        \ "]
  baseline_ebs_bandwidth_mbps : baseline_ebs_bandwidth_mbps_request option;
      [@ocaml.doc
        "The minimum and maximum baseline bandwidth performance for an instance type, in Mbps. For \
         more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html}Amazon \
         EBS\226\128\147optimized instances} in the {i Amazon EC2 User Guide}.\n\n\
        \ Default: No minimum or maximum limits\n\
        \ "]
  accelerator_types : accelerator_types option;
      [@ocaml.doc
        "Lists the accelerator types that must be on an instance type.\n\n\
        \ {ul\n\
        \       {-  For instance types with GPU accelerators, specify [gpu].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with FPGA accelerators, specify [fpga].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with inference accelerators, specify [inference].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default: Any accelerator type\n\
        \   "]
  accelerator_count : accelerator_count_request option;
      [@ocaml.doc
        "The minimum and maximum number of accelerators (GPUs, FPGAs, or Amazon Web Services \
         Inferentia chips) for an instance type.\n\n\
        \ To exclude accelerator-enabled instance types, set [Max] to [0].\n\
        \ \n\
        \  Default: No minimum or maximum limits\n\
        \  "]
  accelerator_manufacturers : accelerator_manufacturers option;
      [@ocaml.doc
        "Indicates whether instance types must have accelerators by specific manufacturers.\n\n\
        \ {ul\n\
        \       {-  For instance types with NVIDIA devices, specify [nvidia].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with AMD devices, specify [amd].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with Amazon Web Services devices, specify \
         [amazon-web-services].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with Xilinx devices, specify [xilinx].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default: Any manufacturer\n\
        \   "]
  accelerator_names : accelerator_names option;
      [@ocaml.doc
        "Lists the accelerators that must be on an instance type.\n\n\
        \ {ul\n\
        \       {-  For instance types with NVIDIA A100 GPUs, specify [a100].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with NVIDIA V100 GPUs, specify [v100].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with NVIDIA K80 GPUs, specify [k80].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with NVIDIA T4 GPUs, specify [t4].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with NVIDIA M60 GPUs, specify [m60].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with AMD Radeon Pro V520 GPUs, specify [radeon-pro-v520].\n\
        \           \n\
        \            }\n\
        \       {-  For instance types with Xilinx VU9P FPGAs, specify [vu9p].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Default: Any accelerator\n\
        \   "]
  accelerator_total_memory_mi_b : accelerator_total_memory_mi_b_request option;
      [@ocaml.doc
        "The minimum and maximum total memory size for the accelerators on an instance type, in \
         MiB.\n\n\
        \ Default: No minimum or maximum limits\n\
        \ "]
  network_bandwidth_gbps : network_bandwidth_gbps_request option;
      [@ocaml.doc
        "The minimum and maximum amount of network bandwidth, in gigabits per second (Gbps).\n\n\
        \ Default: No minimum or maximum limits\n\
        \ "]
  allowed_instance_types : allowed_instance_types option;
      [@ocaml.doc
        "The instance types to apply your specified attributes against. All other instance types \
         are ignored, even if they match your specified attributes.\n\n\
        \ You can use strings with one or more wild cards, represented by an asterisk ([*]), to \
         allow an instance type, size, or generation. The following are examples: [m5.8xlarge], \
         [c5*.*], [m5a.*], [r*], [*3*].\n\
        \ \n\
        \  For example, if you specify [c5*], Amazon EC2 Auto Scaling will allow the entire C5 \
         instance family, which includes all C5a and C5n instance types. If you specify [m5a.*], \
         Amazon EC2 Auto Scaling will allow all the M5a instance types, but not the M5n instance \
         types.\n\
        \  \n\
        \    If you specify [AllowedInstanceTypes], you can't specify [ExcludedInstanceTypes].\n\
        \    \n\
        \      Default: All instance types\n\
        \      "]
  baseline_performance_factors : baseline_performance_factors_request option;
      [@ocaml.doc " The baseline performance factors for the instance requirements. \n"]
}
[@@ocaml.doc
  "The attributes for the instance types for a mixed instances policy. Amazon EC2 Auto Scaling \
   uses your specified requirements to identify instance types. Then, it uses your On-Demand and \
   Spot allocation strategies to launch instances from these instance types.\n\n\
  \ When you specify multiple attributes, you get instance types that satisfy all of the specified \
   attributes. If you specify multiple values for an attribute, you get instance types that \
   satisfy any of the specified values.\n\
  \ \n\
  \  To limit the list of instance types from which Amazon EC2 Auto Scaling can identify matching \
   instance types, you can use one of the following parameters, but not both in the same request:\n\
  \  \n\
  \   {ul\n\
  \         {-   [AllowedInstanceTypes] - The instance types to include in the list. All other \
   instance types are ignored, even if they match your specified attributes.\n\
  \             \n\
  \              }\n\
  \         {-   [ExcludedInstanceTypes] - The instance types to exclude from the list, even if \
   they match your specified attributes.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    You must specify [VCpuCount] and [MemoryMiB]. All other attributes are optional. Any \
   unspecified optional attribute is set to its default.\n\
  \    \n\
  \      For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-mixed-instances-group-attribute-based-instance-type-selection.html}Create \
   a mixed instances group using attribute-based instance type selection} in the {i Amazon EC2 \
   Auto Scaling User Guide}. For help determining which instance types match your attributes \
   before you apply them to your Auto Scaling group, see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-fleet-attribute-based-instance-type-selection.html#ec2fleet-get-instance-types-from-instance-requirements}Preview \
   instance types with specified attributes} in the {i Amazon EC2 User Guide}.\n\
  \      "]

type nonrec launch_template_overrides = {
  instance_type : xml_string_max_len255 option;
      [@ocaml.doc
        "The instance type, such as [m3.xlarge]. You must specify an instance type that is \
         supported in your requested Region and Availability Zones. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html}Instance \
         types} in the {i Amazon EC2 User Guide}.\n\n\
        \ You can specify up to 40 instance types per Auto Scaling group.\n\
        \ "]
  weighted_capacity : xml_string_max_len32 option;
      [@ocaml.doc
        "If you provide a list of instance types to use, you can specify the number of capacity \
         units provided by each instance type in terms of virtual CPUs, memory, storage, \
         throughput, or other relative performance characteristic. When a Spot or On-Demand \
         Instance is launched, the capacity units count toward the desired capacity. Amazon EC2 \
         Auto Scaling launches instances until the desired capacity is totally fulfilled, even if \
         this results in an overage. For example, if there are two units remaining to fulfill \
         capacity, and Amazon EC2 Auto Scaling can only launch an instance with a \
         [WeightedCapacity] of five units, the instance is launched, and the desired capacity is \
         exceeded by three units. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups-instance-weighting.html}Configure \
         an Auto Scaling group to use instance weights} in the {i Amazon EC2 Auto Scaling User \
         Guide}. Value must be in the range of 1\226\128\147999.\n\n\
        \ If you specify a value for [WeightedCapacity] for one instance type, you must specify a \
         value for [WeightedCapacity] for all of them.\n\
        \ \n\
        \   Every Auto Scaling group has three size parameters ([DesiredCapacity], [MaxSize], and \
         [MinSize]). Usually, you set these sizes based on a specific number of instances. \
         However, if you configure a mixed instances policy that defines weights for the instance \
         types, you must specify these sizes with the same units that you use for weighting \
         instances. \n\
        \   \n\
        \    "]
  launch_template_specification : launch_template_specification option;
      [@ocaml.doc
        "Provides a launch template for the specified instance type or set of instance \
         requirements. For example, some instance types might require a launch template with a \
         different AMI. If not provided, Amazon EC2 Auto Scaling uses the launch template that's \
         specified in the [LaunchTemplate] definition. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups-launch-template-overrides.html}Specifying \
         a different launch template for an instance type} in the {i Amazon EC2 Auto Scaling User \
         Guide}. \n\n\
        \ You can specify up to 20 launch templates per Auto Scaling group. The launch templates \
         specified in the overrides and in the [LaunchTemplate] definition count towards this \
         limit.\n\
        \ "]
  instance_requirements : instance_requirements option;
      [@ocaml.doc
        "The instance requirements. Amazon EC2 Auto Scaling uses your specified requirements to \
         identify instance types. Then, it uses your On-Demand and Spot allocation strategies to \
         launch instances from these instance types.\n\n\
        \ You can specify up to four separate sets of instance requirements per Auto Scaling \
         group. This is useful for provisioning instances from different Amazon Machine Images \
         (AMIs) in the same Auto Scaling group. To do this, create the AMIs and create a new \
         launch template for each AMI. Then, create a compatible set of instance requirements for \
         each launch template. \n\
        \ \n\
        \   If you specify [InstanceRequirements], you can't specify [InstanceType].\n\
        \   \n\
        \    "]
  image_id : image_id option;
      [@ocaml.doc
        " The ID of the Amazon Machine Image (AMI) to use for instances launched with this \
         override. When using Instance Refresh with [ReplaceRootVolume] strategy, this specifies \
         the AMI for root volume replacement operations. \n\n\
        \  For [ReplaceRootVolume] operations: \n\
        \ \n\
        \  {ul\n\
        \        {-  All overrides in the [MixedInstancesPolicy] must specify an ImageId\n\
        \            \n\
        \             }\n\
        \        {-  The AMI must contain only a single root volume\n\
        \            \n\
        \             }\n\
        \        {-  Root volume replacement doesn't support multi-volume AMIs\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Use this structure to let Amazon EC2 Auto Scaling do the following when the Auto Scaling group \
   has a mixed instances policy:\n\n\
  \ {ul\n\
  \       {-  Override the instance type that is specified in the launch template.\n\
  \           \n\
  \            }\n\
  \       {-  Use multiple instance types.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Specify the instance types that you want, or define your instance requirements instead and \
   let Amazon EC2 Auto Scaling provision the available instance types that meet your requirements. \
   This can provide Amazon EC2 Auto Scaling with a larger selection of instance types to choose \
   from when fulfilling Spot and On-Demand capacities. You can view which instance types are \
   matched before you apply the instance requirements to your Auto Scaling group.\n\
  \   \n\
  \    After you define your instance requirements, you don't have to keep updating these settings \
   to get new EC2 instance types automatically. Amazon EC2 Auto Scaling uses the instance \
   requirements of the Auto Scaling group to determine whether a new EC2 instance type can be used.\n\
  \    "]

type nonrec overrides = launch_template_overrides list [@@ocaml.doc ""]

type nonrec launch_template = {
  launch_template_specification : launch_template_specification option;
      [@ocaml.doc "The launch template.\n"]
  overrides : overrides option;
      [@ocaml.doc
        "Any properties that you specify override the same properties in the launch template.\n"]
}
[@@ocaml.doc
  "Use this structure to specify the launch templates and instance types (overrides) for a mixed \
   instances policy.\n"]

type nonrec mixed_instances_policy = {
  launch_template : launch_template option;
      [@ocaml.doc
        "One or more launch templates and the instance types (overrides) that are used to launch \
         EC2 instances to fulfill On-Demand and Spot capacities.\n"]
  instances_distribution : instances_distribution option;
      [@ocaml.doc "The instances distribution.\n"]
}
[@@ocaml.doc
  "Use this structure to launch multiple instance types and On-Demand Instances and Spot Instances \
   within a single Auto Scaling group.\n\n\
  \ A mixed instances policy contains information that Amazon EC2 Auto Scaling can use to launch \
   instances and help optimize your costs. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html}Auto \
   Scaling groups with multiple instance types and purchase options} in the {i Amazon EC2 Auto \
   Scaling User Guide}.\n\
  \ "]

type nonrec auto_scaling_group = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  auto_scaling_group_ar_n : resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Auto Scaling group.\n"]
  launch_configuration_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the associated launch configuration for the Auto Scaling group.\n"]
  launch_template : launch_template_specification option;
      [@ocaml.doc "The launch template for the Auto Scaling group.\n"]
  mixed_instances_policy : mixed_instances_policy option;
      [@ocaml.doc "The mixed instances policy for the group.\n"]
  min_size : auto_scaling_group_min_size;
      [@ocaml.doc "The minimum size of the Auto Scaling group.\n"]
  max_size : auto_scaling_group_max_size;
      [@ocaml.doc "The maximum size of the Auto Scaling group.\n"]
  desired_capacity : auto_scaling_group_desired_capacity;
      [@ocaml.doc "The desired size of the Auto Scaling group.\n"]
  predicted_capacity : auto_scaling_group_predicted_capacity option;
      [@ocaml.doc "The predicted capacity of the group when it has a predictive scaling policy.\n"]
  default_cooldown : cooldown;
      [@ocaml.doc
        "The duration of the default cooldown period, in seconds, for the Auto Scaling group.\n"]
  availability_zones : availability_zones;
      [@ocaml.doc "One or more Availability Zones for the Auto Scaling group.\n"]
  availability_zone_ids : availability_zone_ids option;
      [@ocaml.doc
        " The Availability Zone IDs where the Auto Scaling group can launch instances. \n"]
  load_balancer_names : load_balancer_names option;
      [@ocaml.doc "One or more load balancers associated with the group.\n"]
  target_group_ar_ns : target_group_ar_ns option;
      [@ocaml.doc "The Amazon Resource Names (ARN) of the target groups for your load balancer.\n"]
  health_check_type : xml_string_max_len32;
      [@ocaml.doc "One or more comma-separated health check types for the Auto Scaling group.\n"]
  health_check_grace_period : health_check_grace_period option;
      [@ocaml.doc
        "The duration of the health check grace period, in seconds, for the Auto Scaling group.\n"]
  instances : instances option;
      [@ocaml.doc "The EC2 instances associated with the Auto Scaling group.\n"]
  created_time : timestamp_type;
      [@ocaml.doc "The date and time the Auto Scaling group was created.\n"]
  suspended_processes : suspended_processes option;
      [@ocaml.doc "The suspended processes associated with the Auto Scaling group.\n"]
  placement_group : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the placement group into which to launch EC2 instances for the Auto Scaling \
         group.\n"]
  vpc_zone_identifier : xml_string_max_len5000 option;
      [@ocaml.doc "One or more comma-separated subnet IDs for the Auto Scaling group.\n"]
  enabled_metrics : enabled_metrics option;
      [@ocaml.doc "The metrics enabled for the Auto Scaling group.\n"]
  status : xml_string_max_len255 option;
      [@ocaml.doc
        "The current state of the Auto Scaling group when the \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DeleteAutoScalingGroup.html}DeleteAutoScalingGroup} \
         operation is in progress.\n"]
  tags : tag_description_list option; [@ocaml.doc "The tags for the Auto Scaling group.\n"]
  termination_policies : termination_policies option;
      [@ocaml.doc "The termination policies for the Auto Scaling group.\n"]
  new_instances_protected_from_scale_in : instance_protected option;
      [@ocaml.doc
        "Indicates whether newly launched EC2 instances are protected from termination when \
         scaling in for the Auto Scaling group.\n\n\
        \  For more information about preventing instances from terminating on scale in, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html}Use \
         instance scale-in protection} in the {i Amazon EC2 Auto Scaling User Guide}. \n\
        \ "]
  service_linked_role_ar_n : resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group \
         uses to call other Amazon Web Services on your behalf.\n"]
  max_instance_lifetime : max_instance_lifetime option;
      [@ocaml.doc
        "The maximum amount of time, in seconds, that an EC2 instance can be in service for the \
         Auto Scaling group.\n"]
  capacity_rebalance : capacity_rebalance_enabled option;
      [@ocaml.doc "Indicates whether Capacity Rebalancing is enabled.\n"]
  warm_pool_configuration : warm_pool_configuration option;
      [@ocaml.doc "The warm pool for the group.\n"]
  warm_pool_size : warm_pool_size option; [@ocaml.doc "The current size of the warm pool.\n"]
  context : context option; [@ocaml.doc "Reserved.\n"]
  desired_capacity_type : xml_string_max_len255 option;
      [@ocaml.doc
        "The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto \
         Scaling supports [DesiredCapacityType] for attribute-based instance type selection only.\n"]
  default_instance_warmup : default_instance_warmup option;
      [@ocaml.doc
        "The duration of the default EC2 instance warmup time, in seconds, for the Auto Scaling \
         group.\n"]
  traffic_sources : traffic_sources option;
      [@ocaml.doc "The traffic sources associated with this Auto Scaling group.\n"]
  instance_maintenance_policy : instance_maintenance_policy option;
      [@ocaml.doc "An instance maintenance policy.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc "The deletion protection setting for the Auto Scaling group.\n"]
  availability_zone_distribution : availability_zone_distribution option;
      [@ocaml.doc
        "The EC2 instance capacity distribution across Availability Zones for the Auto Scaling \
         group.\n"]
  availability_zone_impairment_policy : availability_zone_impairment_policy option;
      [@ocaml.doc "The Availability Zone impairment policy for the Auto Scaling group.\n"]
  capacity_reservation_specification : capacity_reservation_specification option;
      [@ocaml.doc "The capacity reservation specification for the Auto Scaling group.\n"]
  instance_lifecycle_policy : instance_lifecycle_policy option;
      [@ocaml.doc "The instance lifecycle policy for the Auto Scaling group.\n"]
}
[@@ocaml.doc "Describes an Auto Scaling group.\n"]

type nonrec auto_scaling_group_names = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec values = xml_string list [@@ocaml.doc ""]

type nonrec filter = {
  name : xml_string option;
      [@ocaml.doc
        "The name of the filter.\n\n\
        \  The valid values for [Name] depend on which API operation you're using with the filter. \n\
        \ \n\
        \   {b  \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAutoScalingGroups.html}DescribeAutoScalingGroups} \
         } \n\
        \  \n\
        \   Valid values for [Name] include the following: \n\
        \   \n\
        \    {ul\n\
        \          {-   [tag-key] - Accepts tag keys. The results only include information about \
         the Auto Scaling groups associated with these tag keys. \n\
        \              \n\
        \               }\n\
        \          {-   [tag-value] - Accepts tag values. The results only include information \
         about the Auto Scaling groups associated with these tag values. \n\
        \              \n\
        \               }\n\
        \          {-   \n\
        \              {[\n\
        \              tag:\n\
        \              ]}\n\
        \               - Accepts the key/value combination of the tag. Use the tag key in the \
         filter name and the tag value as the filter value. The results only include information \
         about the Auto Scaling groups associated with the specified key/value combination. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b  \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeTags.html}DescribeTags} \
         } \n\
        \   \n\
        \    Valid values for [Name] include the following: \n\
        \    \n\
        \     {ul\n\
        \           {-   [auto-scaling-group] - Accepts the names of Auto Scaling groups. The \
         results only include information about the tags associated with these Auto Scaling \
         groups. \n\
        \               \n\
        \                }\n\
        \           {-   [key] - Accepts tag keys. The results only include information about the \
         tags associated with these tag keys. \n\
        \               \n\
        \                }\n\
        \           {-   [value] - Accepts tag values. The results only include information about \
         the tags associated with these tag values. \n\
        \               \n\
        \                }\n\
        \           {-   [propagate-at-launch] - Accepts a Boolean value, which specifies whether \
         tags propagate to instances at launch. The results only include information about the \
         tags associated with the specified Boolean value. \n\
        \               \n\
        \                }\n\
        \           }\n\
        \    {b  \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeScalingActivities.html}DescribeScalingActivities} \
         } \n\
        \   \n\
        \    Valid values for [Name] include the following: \n\
        \    \n\
        \     {ul\n\
        \           {-   [StartTimeLowerBound] - The earliest scaling activities to return based \
         on the activity start time. Scaling activities with a start time earlier than this value \
         are not included in the results. Only activities started within the last six weeks can be \
         returned regardless of the value specified. \n\
        \               \n\
        \                }\n\
        \           {-   [StartTimeUpperBound] - The latest scaling activities to return based on \
         the activity start time. Scaling activities with a start time later than this value are \
         not included in the results. Only activities started within the last six weeks can be \
         returned regardless of the value specified. \n\
        \               \n\
        \                }\n\
        \           {-   [Status] - The [StatusCode] value of the scaling activity. This filter \
         can only be used in combination with the [AutoScalingGroupName] parameter. For valid \
         [StatusCode] values, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_Activity.html}Activity} \
         in the {i Amazon EC2 Auto Scaling API Reference}. \n\
        \               \n\
        \                }\n\
        \           }\n\
        \    [StartTimeLowerBound] and [StartTimeUpperBound] accept ISO 8601 formatted timestamps. \
         Timestamps without a timezone offset are assumed to be UTC. \n\
        \   \n\
        \    {ul\n\
        \          {-   [2000-01-18T08:15:00Z] \n\
        \              \n\
        \               }\n\
        \          {-   [2000-01-18T16:15:00+08:00] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  values : values option;
      [@ocaml.doc
        "One or more filter values. Filter values are case-sensitive. \n\n\
        \ If you specify multiple values for a filter, the values are automatically logically \
         joined with an [OR], and the request returns all results that match any of the specified \
         values.\n\
        \ \n\
        \   {b DescribeAutoScalingGroups example:} Specify \"tag:environment\" for the filter name \
         and \"production,development\" for the filter values to find Auto Scaling groups with the \
         tag \"environment=production\" or \"environment=development\". \n\
        \  \n\
        \    {b DescribeScalingActivities example:} Specify \"Status\" for the filter name and \
         \"Successful,Failed\" for the filter values to find scaling activities with a status of \
         either \"Successful\" or \"Failed\". \n\
        \   "]
}
[@@ocaml.doc
  "Describes a filter that is used to return a more specific list of results from a describe \
   operation.\n\n\
  \ If you specify multiple filters, the filters are automatically logically joined with an [AND], \
   and the request returns only the results that match all of the specified filters. \n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html}Tag Auto \
   Scaling groups and instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \  "]

type nonrec filters = filter list [@@ocaml.doc ""]

type nonrec max_records = int [@@ocaml.doc ""]

type nonrec include_instances = bool [@@ocaml.doc ""]

type nonrec auto_scaling_group_names_type = {
  auto_scaling_group_names : auto_scaling_group_names option;
      [@ocaml.doc
        "The names of the Auto Scaling groups. By default, you can only specify up to 50 names. \
         You can optionally increase this limit using the [MaxRecords] property.\n\n\
        \ If you omit this property, all Auto Scaling groups are described.\n\
        \ "]
  include_instances : include_instances option;
      [@ocaml.doc
        " Specifies whether to include information about Amazon EC2 instances in the response. \
         When set to [true] (default), the response includes instance details. \n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [50] and the \
         maximum value is [100].\n"]
  filters : filters option;
      [@ocaml.doc "One or more filters to limit the results based on specific tags. \n"]
}
[@@ocaml.doc ""]

type nonrec auto_scaling_groups = auto_scaling_group list [@@ocaml.doc ""]

type nonrec auto_scaling_groups_type = {
  auto_scaling_groups : auto_scaling_groups; [@ocaml.doc "The groups.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec auto_scaling_instance_details = {
  instance_id : xml_string_max_len19; [@ocaml.doc "The ID of the instance.\n"]
  instance_type : xml_string_max_len255 option;
      [@ocaml.doc "The instance type of the EC2 instance.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group for the instance.\n"]
  availability_zone : xml_string_max_len255;
      [@ocaml.doc "The Availability Zone for the instance.\n"]
  availability_zone_id : xml_string_max_len255 option;
      [@ocaml.doc " The Availability Zone ID where the instance is located. \n"]
  lifecycle_state : xml_string_max_len32;
      [@ocaml.doc
        "The lifecycle state for the instance. The [Quarantined] state is not used. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-lifecycle.html}Amazon \
         EC2 Auto Scaling instance lifecycle} in the {i Amazon EC2 Auto Scaling User Guide}. \n\n\
        \ Valid values: [Pending] | [Pending:Wait] | [Pending:Proceed] | [Quarantined] | \
         [InService] | [Terminating] | [Terminating:Wait] | [Terminating:Proceed] | \
         [Terminating:Retained] | [Terminated] | [Detaching] | [Detached] | [EnteringStandby] | \
         [Standby] | [ReplacingRootVolume] | [ReplacingRootVolume:Wait] | \
         [ReplacingRootVolume:Proceed] | [RootVolumeReplaced] | [Warmed:Pending] | \
         [Warmed:Pending:Wait] | [Warmed:Pending:Proceed] | [Warmed:Pending:Retained] | \
         [Warmed:Terminating] | [Warmed:Terminating:Wait] | [Warmed:Terminating:Proceed] | \
         [Warmed:Terminating:Retained] | [Warmed:Terminated] | [Warmed:Stopped] | [Warmed:Running] \
         | [Warmed:Hibernated] \n\
        \ "]
  health_status : xml_string_max_len32;
      [@ocaml.doc
        "The last reported health status of this instance. [Healthy] means that the instance is \
         healthy and should remain in service. [Unhealthy] means that the instance is unhealthy \
         and Amazon EC2 Auto Scaling should terminate and replace it.\n"]
  launch_configuration_name : xml_string_max_len255 option;
      [@ocaml.doc
        "The launch configuration used to launch the instance. This value is not available if you \
         attached the instance to the Auto Scaling group.\n"]
  launch_template : launch_template_specification option;
      [@ocaml.doc "The launch template for the instance.\n"]
  image_id : xml_string_max_len255 option;
      [@ocaml.doc
        " The ID of the Amazon Machine Image (AMI) associated with the instance. This field shows \
         the current AMI ID of the instance's root volume. It may differ from the original AMI \
         used when the instance was first launched. \n\n\
        \  This field appears for: \n\
        \ \n\
        \  {ul\n\
        \        {-  Instances with root volume replacements through Instance Refresh\n\
        \            \n\
        \             }\n\
        \        {-  Instances launched with AMI overrides \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   This field won't appear for:\n\
        \   \n\
        \    {ul\n\
        \          {-  Existing instances launched from Launch Templates without overrides\n\
        \              \n\
        \               }\n\
        \          {-  Existing instances that didn\226\128\153t have their root volume replaced \
         through Instance Refresh\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  protected_from_scale_in : instance_protected;
      [@ocaml.doc
        "Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling \
         when scaling in.\n"]
  weighted_capacity : xml_string_max_len32 option;
      [@ocaml.doc
        "The number of capacity units contributed by the instance based on its instance type.\n\n\
        \ Valid Range: Minimum value of 1. Maximum value of 999.\n\
        \ "]
}
[@@ocaml.doc "Describes an EC2 instance associated with an Auto Scaling group.\n"]

type nonrec auto_scaling_instances = auto_scaling_instance_details list [@@ocaml.doc ""]

type nonrec auto_scaling_instances_type = {
  auto_scaling_instances : auto_scaling_instances option; [@ocaml.doc "The instances.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec auto_scaling_notification_types = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec scaling_activity_in_progress_fault = {
  message : xml_string_max_len255 option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "The operation can't be performed because there are scaling activities in progress.\n"]

type nonrec update_placement_group_param = string [@@ocaml.doc ""]

type nonrec update_auto_scaling_group_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  launch_configuration_name : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the launch configuration. If you specify [LaunchConfigurationName] in your \
         update request, you can't specify [LaunchTemplate] or [MixedInstancesPolicy].\n"]
  launch_template : launch_template_specification option;
      [@ocaml.doc
        "The launch template and version to use to specify the updates. If you specify \
         [LaunchTemplate] in your update request, you can't specify [LaunchConfigurationName] or \
         [MixedInstancesPolicy].\n"]
  mixed_instances_policy : mixed_instances_policy option;
      [@ocaml.doc
        "The mixed instances policy. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html}Auto \
         Scaling groups with multiple instance types and purchase options} in the {i Amazon EC2 \
         Auto Scaling User Guide}.\n"]
  min_size : auto_scaling_group_min_size option;
      [@ocaml.doc "The minimum size of the Auto Scaling group.\n"]
  max_size : auto_scaling_group_max_size option;
      [@ocaml.doc
        "The maximum size of the Auto Scaling group.\n\n\
        \  With a mixed instances policy that uses instance weighting, Amazon EC2 Auto Scaling may \
         need to go above [MaxSize] to meet your capacity requirements. In this event, Amazon EC2 \
         Auto Scaling will never go above [MaxSize] by more than your largest instance weight \
         (weights that define how many units each instance contributes to the desired capacity of \
         the group).\n\
        \  \n\
        \   "]
  desired_capacity : auto_scaling_group_desired_capacity option;
      [@ocaml.doc
        "The desired capacity is the initial capacity of the Auto Scaling group after this \
         operation completes and the capacity it attempts to maintain. This number must be greater \
         than or equal to the minimum size of the group and less than or equal to the maximum size \
         of the group.\n"]
  default_cooldown : cooldown option;
      [@ocaml.doc
        " {i Only needed if you use simple scaling policies.} \n\n\
        \ The amount of time, in seconds, between one scaling activity ending and another one \
         starting due to simple scaling policies. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-cooldowns.html}Scaling \
         cooldowns for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ "]
  availability_zones : availability_zones option;
      [@ocaml.doc "One or more Availability Zones for the group.\n"]
  availability_zone_ids : availability_zone_ids option;
      [@ocaml.doc
        " A list of Availability Zone IDs for the Auto Scaling group. You cannot specify both \
         AvailabilityZones and AvailabilityZoneIds in the same request. \n"]
  health_check_type : xml_string_max_len32 option;
      [@ocaml.doc
        "A comma-separated value string of one or more health check types.\n\n\
        \ The valid values are [EC2], [EBS], [ELB], and [VPC_LATTICE]. [EC2] is the default health \
         check and cannot be disabled. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-health-checks.html}Health \
         checks for instances in an Auto Scaling group} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\
        \ \n\
        \  Only specify [EC2] if you must clear a value that was previously set.\n\
        \  "]
  health_check_grace_period : health_check_grace_period option;
      [@ocaml.doc
        "The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the \
         health status of an EC2 instance that has come into service and marking it unhealthy due \
         to a failed health check. This is useful if your instances do not immediately pass their \
         health checks after they enter the [InService] state. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/health-check-grace-period.html}Set \
         the health check grace period for an Auto Scaling group} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n"]
  placement_group : update_placement_group_param option;
      [@ocaml.doc
        "The name of an existing placement group into which to launch your instances. To remove \
         the placement group setting, pass an empty string for [placement-group]. For more \
         information about placement groups, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html}Placement \
         groups} in the {i Amazon EC2 User Guide}.\n\n\
        \  A {i cluster} placement group is a logical grouping of instances within a single \
         Availability Zone. You cannot specify multiple Availability Zones and a cluster placement \
         group. \n\
        \  \n\
        \   "]
  vpc_zone_identifier : xml_string_max_len5000 option;
      [@ocaml.doc
        "A comma-separated list of subnet IDs for a virtual private cloud (VPC). If you specify \
         [VPCZoneIdentifier] with [AvailabilityZones], the subnets that you specify must reside in \
         those Availability Zones.\n"]
  termination_policies : termination_policies option;
      [@ocaml.doc
        "A policy or a list of policies that are used to select the instances to terminate. The \
         policies are executed in the order that you list them. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html}Configure \
         termination policies for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\n\
        \ Valid values: [Default] | [AllocationStrategy] | [ClosestToNextInstanceHour] | \
         [NewestInstance] | [OldestInstance] | [OldestLaunchConfiguration] | \
         [OldestLaunchTemplate] | [arn:aws:lambda:region:account-id:function:my-function:my-alias] \n\
        \ "]
  new_instances_protected_from_scale_in : instance_protected option;
      [@ocaml.doc
        "Indicates whether newly launched instances are protected from termination by Amazon EC2 \
         Auto Scaling when scaling in. For more information about preventing instances from \
         terminating on scale in, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html}Use \
         instance scale-in protection} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  service_linked_role_ar_n : resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group \
         uses to call other Amazon Web Services on your behalf. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html}Service-linked \
         roles} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  max_instance_lifetime : max_instance_lifetime option;
      [@ocaml.doc
        "The maximum amount of time, in seconds, that an instance can be in service. The default \
         is null. If specified, the value must be either 0 or a number equal to or greater than \
         86,400 seconds (1 day). To clear a previously set value, specify a new value of 0. For \
         more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html}Replacing \
         Auto Scaling instances based on maximum instance lifetime} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n"]
  capacity_rebalance : capacity_rebalance_enabled option;
      [@ocaml.doc
        "Enables or disables Capacity Rebalancing. If Capacity Rebalancing is disabled, proactive \
         replacement of at-risk Spot Instances does not occur. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-capacity-rebalancing.html}Capacity \
         Rebalancing in Auto Scaling to replace at-risk Spot Instances} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n\n\
        \  To suspend rebalancing across Availability Zones, use the \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_SuspendedProcess.html}SuspendProcesses} \
         API.\n\
        \  \n\
        \   "]
  context : context option; [@ocaml.doc "Reserved.\n"]
  desired_capacity_type : xml_string_max_len255 option;
      [@ocaml.doc
        "The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto \
         Scaling supports [DesiredCapacityType] for attribute-based instance type selection only. \
         For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-mixed-instances-group-attribute-based-instance-type-selection.html}Create \
         a mixed instances group using attribute-based instance type selection} in the {i Amazon \
         EC2 Auto Scaling User Guide}.\n\n\
        \ By default, Amazon EC2 Auto Scaling specifies [units], which translates into number of \
         instances.\n\
        \ \n\
        \  Valid values: [units] | [vcpu] | [memory-mib] \n\
        \  "]
  default_instance_warmup : default_instance_warmup option;
      [@ocaml.doc
        "The amount of time, in seconds, until a new instance is considered to have finished \
         initializing and resource consumption to become stable after it enters the [InService] \
         state. \n\n\
        \ During an instance refresh, Amazon EC2 Auto Scaling waits for the warm-up period after \
         it replaces an instance before it moves on to replacing the next instance. Amazon EC2 \
         Auto Scaling also waits for the warm-up period before aggregating the metrics for new \
         instances with existing instances in the Amazon CloudWatch metrics that are used for \
         scaling, resulting in more reliable usage data. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-default-instance-warmup.html}Set \
         the default instance warmup for an Auto Scaling group} in the {i Amazon EC2 Auto Scaling \
         User Guide}.\n\
        \ \n\
        \   To manage various warm-up settings at the group level, we recommend that you set the \
         default instance warmup, {i even if it is set to 0 seconds}. To remove a value that you \
         previously set, include the property but specify [-1] for the value. However, we strongly \
         recommend keeping the default instance warmup enabled by specifying a value of [0] or \
         other nominal value.\n\
        \   \n\
        \    "]
  instance_maintenance_policy : instance_maintenance_policy option;
      [@ocaml.doc
        "An instance maintenance policy. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-maintenance-policy.html}Set \
         instance maintenance policy} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  availability_zone_distribution : availability_zone_distribution option;
      [@ocaml.doc " The instance capacity distribution across Availability Zones. \n"]
  availability_zone_impairment_policy : availability_zone_impairment_policy option;
      [@ocaml.doc " The policy for Availability Zone impairment. \n"]
  skip_zonal_shift_validation : skip_zonal_shift_validation option;
      [@ocaml.doc
        " If you enable zonal shift with cross-zone disabled load balancers, capacity could become \
         imbalanced across Availability Zones. To skip the validation, specify [true]. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-zonal-shift.html}Auto \
         Scaling group zonal shift} in the {i Amazon EC2 Auto Scaling User Guide}. \n"]
  capacity_reservation_specification : capacity_reservation_specification option;
      [@ocaml.doc " The capacity reservation specification for the Auto Scaling group. \n"]
  instance_lifecycle_policy : instance_lifecycle_policy option;
      [@ocaml.doc
        " The instance lifecycle policy for the Auto Scaling group. This policy controls instance \
         behavior when an instance transitions through its lifecycle states. Configure retention \
         triggers to specify when instances should move to a [Retained] state instead of automatic \
         termination. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/instance-lifecycle-policy.html} \
         Control instance retention with instance lifecycle policies} in the {i Amazon EC2 Auto \
         Scaling User Guide}. \n\
        \ "]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        " The deletion protection setting for the Auto Scaling group. This setting helps safeguard \
         your Auto Scaling group and its instances by controlling whether the \
         [DeleteAutoScalingGroup] operation is allowed. When deletion protection is enabled, users \
         cannot delete the Auto Scaling group according to the specified protection level until \
         the setting is changed back to a less restrictive level. \n\n\
        \  The valid values are [none], [prevent-force-deletion], and [prevent-all-deletion]. \n\
        \ \n\
        \   Default: [none] \n\
        \  \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/resource-deletion-protection.html} \
         Configure deletion protection for your Amazon EC2 Auto Scaling resources} in the {i \
         Amazon EC2 Auto Scaling User Guide}. \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec should_decrement_desired_capacity = bool [@@ocaml.doc ""]

type nonrec terminate_instance_in_auto_scaling_group_type = {
  instance_id : xml_string_max_len19; [@ocaml.doc "The ID of the instance.\n"]
  should_decrement_desired_capacity : should_decrement_desired_capacity;
      [@ocaml.doc
        "Indicates whether terminating the instance also decrements the size of the Auto Scaling \
         group.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_in_use_fault = { message : xml_string_max_len255 option [@ocaml.doc "\n"] }
[@@ocaml.doc "The operation can't be performed because the resource is in use.\n"]

type nonrec process_names = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec scaling_process_query = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  scaling_processes : process_names option;
      [@ocaml.doc
        "One or more of the following processes:\n\n\
        \ {ul\n\
        \       {-   [Launch] \n\
        \           \n\
        \            }\n\
        \       {-   [Terminate] \n\
        \           \n\
        \            }\n\
        \       {-   [AddToLoadBalancer] \n\
        \           \n\
        \            }\n\
        \       {-   [AlarmNotification] \n\
        \           \n\
        \            }\n\
        \       {-   [AZRebalance] \n\
        \           \n\
        \            }\n\
        \       {-   [HealthCheck] \n\
        \           \n\
        \            }\n\
        \       {-   [InstanceRefresh] \n\
        \           \n\
        \            }\n\
        \       {-   [ReplaceUnhealthy] \n\
        \           \n\
        \            }\n\
        \       {-   [ScheduledActions] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you omit this property, all processes are specified.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_fault = { message : xml_string_max_len255 option [@ocaml.doc "\n"] }
[@@ocaml.doc
  "You have already reached a limit for your Amazon EC2 Auto Scaling resources (for example, Auto \
   Scaling groups, launch configurations, or lifecycle hooks). For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAccountLimits.html}DescribeAccountLimits} \
   in the {i Amazon EC2 Auto Scaling API Reference}.\n"]

type nonrec start_instance_refresh_answer = {
  instance_refresh_id : xml_string_max_len255 option;
      [@ocaml.doc "A unique ID for tracking the progress of the instance refresh.\n"]
}
[@@ocaml.doc ""]

type nonrec bake_time = int [@@ocaml.doc ""]

type nonrec int_percent100_to200 = int [@@ocaml.doc ""]

type nonrec standby_instances =
  | Terminate [@ocaml.doc ""]
  | Ignore [@ocaml.doc ""]
  | Wait [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scale_in_protected_instances =
  | Refresh [@ocaml.doc ""]
  | Ignore [@ocaml.doc ""]
  | Wait [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec skip_matching = bool [@@ocaml.doc ""]

type nonrec checkpoint_delay = int [@@ocaml.doc ""]

type nonrec non_zero_int_percent = int [@@ocaml.doc ""]

type nonrec checkpoint_percentages = non_zero_int_percent list [@@ocaml.doc ""]

type nonrec refresh_instance_warmup = int [@@ocaml.doc ""]

type nonrec int_percent = int [@@ocaml.doc ""]

type nonrec refresh_preferences = {
  min_healthy_percentage : int_percent option;
      [@ocaml.doc
        "Specifies the minimum percentage of the group to keep in service, healthy, and ready to \
         use to support your workload to allow the operation to continue. The value is expressed \
         as a percentage of the desired capacity of the Auto Scaling group. Value range is 0 to \
         100.\n\n\
        \ If you do not specify this property, the default is 90 percent, or the percentage set in \
         the instance maintenance policy for the Auto Scaling group, if defined.\n\
        \ "]
  instance_warmup : refresh_instance_warmup option;
      [@ocaml.doc
        "A time period, in seconds, during which an instance refresh waits before moving on to \
         replacing the next instance after a new instance enters the [InService] state.\n\n\
        \ This property is not required for normal usage. Instead, use the [DefaultInstanceWarmup] \
         property of the Auto Scaling group. The [InstanceWarmup] and [DefaultInstanceWarmup] \
         properties work the same way. Only specify this property if you must override the \
         [DefaultInstanceWarmup] property. \n\
        \ \n\
        \   If you do not specify this property, the instance warmup by default is the value of \
         the [DefaultInstanceWarmup] property, if defined (which is recommended in all cases), or \
         the [HealthCheckGracePeriod] property otherwise.\n\
        \  "]
  checkpoint_percentages : checkpoint_percentages option;
      [@ocaml.doc
        "(Optional) Threshold values for each checkpoint in ascending order. Each number must be \
         unique. To replace all instances in the Auto Scaling group, the last number in the array \
         must be [100].\n\n\
        \ For usage examples, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-adding-checkpoints-instance-refresh.html}Add \
         checkpoints to an instance refresh} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ "]
  checkpoint_delay : checkpoint_delay option;
      [@ocaml.doc
        "(Optional) The amount of time, in seconds, to wait after a checkpoint before continuing. \
         This property is optional, but if you specify a value for it, you must also specify a \
         value for [CheckpointPercentages]. If you specify a value for [CheckpointPercentages] and \
         not for [CheckpointDelay], the [CheckpointDelay] defaults to [3600] (1 hour). \n"]
  skip_matching : skip_matching option;
      [@ocaml.doc
        "(Optional) Indicates whether skip matching is enabled. If enabled ([true]), then Amazon \
         EC2 Auto Scaling skips replacing instances that match the desired configuration. If no \
         desired configuration is specified, then it skips replacing instances that have the same \
         launch template and instance types that the Auto Scaling group was using before the start \
         of the instance refresh. The default is [false].\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-refresh-skip-matching.html}Use \
         an instance refresh with skip matching} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ "]
  auto_rollback : auto_rollback option;
      [@ocaml.doc
        "(Optional) Indicates whether to roll back the Auto Scaling group to its previous \
         configuration if the instance refresh fails or a CloudWatch alarm threshold is met. The \
         default is [false].\n\n\
        \ A rollback is not supported in the following situations: \n\
        \ \n\
        \  {ul\n\
        \        {-  There is no desired configuration specified for the instance refresh.\n\
        \            \n\
        \             }\n\
        \        {-  The Auto Scaling group has a launch template that uses an Amazon Web Services \
         Systems Manager parameter instead of an AMI ID for the [ImageId] property.\n\
        \            \n\
        \             }\n\
        \        {-  The Auto Scaling group uses the launch template's [$Latest] or [$Default] \
         version.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/instance-refresh-rollback.html}Undo \
         changes with a rollback} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \   "]
  scale_in_protected_instances : scale_in_protected_instances option;
      [@ocaml.doc
        "Choose the behavior that you want Amazon EC2 Auto Scaling to use if instances protected \
         from scale in are found. \n\n\
        \ The following lists the valid values:\n\
        \ \n\
        \   Refresh  Amazon EC2 Auto Scaling replaces instances that are protected from scale in.\n\
        \            \n\
        \              Ignore  Amazon EC2 Auto Scaling ignores instances that are protected from \
         scale in and continues to replace instances that are not protected.\n\
        \                      \n\
        \                        Wait (default)  Amazon EC2 Auto Scaling waits one hour for you to \
         remove scale-in protection. Otherwise, the instance refresh will fail.\n\
        \                                        \n\
        \                                          "]
  standby_instances : standby_instances option;
      [@ocaml.doc
        "Choose the behavior that you want Amazon EC2 Auto Scaling to use if instances in \
         [Standby] state are found.\n\n\
        \ The following lists the valid values:\n\
        \ \n\
        \   Terminate  Amazon EC2 Auto Scaling terminates instances that are in [Standby].\n\
        \              \n\
        \                Ignore  Amazon EC2 Auto Scaling ignores instances that are in [Standby] \
         and continues to replace instances that are in the [InService] state.\n\
        \                        \n\
        \                          Wait (default)  Amazon EC2 Auto Scaling waits one hour for you \
         to return the instances to service. Otherwise, the instance refresh will fail.\n\
        \                                          \n\
        \                                            "]
  alarm_specification : alarm_specification option;
      [@ocaml.doc
        "(Optional) The CloudWatch alarm specification. CloudWatch alarms can be used to identify \
         any issues and fail the operation if an alarm threshold is met.\n"]
  max_healthy_percentage : int_percent100_to200 option;
      [@ocaml.doc
        "Specifies the maximum percentage of the group that can be in service and healthy, or \
         pending, to support your workload when replacing instances. The value is expressed as a \
         percentage of the desired capacity of the Auto Scaling group. Value range is 100 to 200.\n\n\
        \ If you specify [MaxHealthyPercentage], you must also specify [MinHealthyPercentage], and \
         the difference between them cannot be greater than 100. A larger range increases the \
         number of instances that can be replaced at the same time.\n\
        \ \n\
        \  If you do not specify this property, the default is 100 percent, or the percentage set \
         in the instance maintenance policy for the Auto Scaling group, if defined.\n\
        \  "]
  bake_time : bake_time option;
      [@ocaml.doc
        " The amount of time, in seconds, to wait at the end of an instance refresh before the \
         instance refresh is considered complete. \n"]
}
[@@ocaml.doc "Describes the preferences for an instance refresh.\n"]

type nonrec desired_configuration = {
  launch_template : launch_template_specification option;
      [@ocaml.doc
        "Describes the launch template and the version of the launch template that Amazon EC2 Auto \
         Scaling uses to launch Amazon EC2 instances. For more information about launch templates, \
         see {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-templates.html}Launch \
         templates} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  mixed_instances_policy : mixed_instances_policy option;
      [@ocaml.doc
        "Use this structure to launch multiple instance types and On-Demand Instances and Spot \
         Instances within a single Auto Scaling group.\n\n\
        \ A mixed instances policy contains information that Amazon EC2 Auto Scaling can use to \
         launch instances and help optimize your costs. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html}Auto \
         Scaling groups with multiple instance types and purchase options} in the {i Amazon EC2 \
         Auto Scaling User Guide}.\n\
        \ "]
}
[@@ocaml.doc
  "Describes the desired configuration for an instance refresh. \n\n\
  \ If you specify a desired configuration, you must specify either a [LaunchTemplate] or a \
   [MixedInstancesPolicy]. \n\
  \ "]

type nonrec refresh_strategy = Rolling [@ocaml.doc ""] | ReplaceRootVolume [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_instance_refresh_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  strategy : refresh_strategy option;
      [@ocaml.doc "The strategy to use for the instance refresh. The default value is [Rolling].\n"]
  desired_configuration : desired_configuration option;
      [@ocaml.doc
        "The desired configuration. For example, the desired configuration can specify a new \
         launch template or a new version of the current launch template.\n\n\
        \ Once the instance refresh succeeds, Amazon EC2 Auto Scaling updates the settings of the \
         Auto Scaling group to reflect the new desired configuration. \n\
        \ \n\
        \   When you specify a new launch template or a new version of the current launch template \
         for your desired configuration, consider enabling the [SkipMatching] property in \
         preferences. If it's enabled, Amazon EC2 Auto Scaling skips replacing instances that \
         already use the specified launch template and instance types. This can help you reduce \
         the number of replacements that are required to apply updates. \n\
        \   \n\
        \    "]
  preferences : refresh_preferences option;
      [@ocaml.doc
        "Sets your preferences for the instance refresh so that it performs as expected when you \
         start it. Includes the instance warmup time, the minimum and maximum healthy percentages, \
         and the behaviors that you want Amazon EC2 Auto Scaling to use if instances that are in \
         [Standby] state or protected from scale in are found. You can also choose to enable \
         additional features, such as the following:\n\n\
        \ {ul\n\
        \       {-  Auto rollback\n\
        \           \n\
        \            }\n\
        \       {-  Checkpoints\n\
        \           \n\
        \            }\n\
        \       {-  CloudWatch alarms\n\
        \           \n\
        \            }\n\
        \       {-  Skip matching\n\
        \           \n\
        \            }\n\
        \       {-  Bake time\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec set_instance_protection_answer = unit [@@ocaml.doc ""]

type nonrec protected_from_scale_in = bool [@@ocaml.doc ""]

type nonrec set_instance_protection_query = {
  instance_ids : instance_ids;
      [@ocaml.doc "One or more instance IDs. You can specify up to 50 instances.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  protected_from_scale_in : protected_from_scale_in;
      [@ocaml.doc
        "Indicates whether the instance is protected from termination by Amazon EC2 Auto Scaling \
         when scaling in.\n"]
}
[@@ocaml.doc ""]

type nonrec should_respect_grace_period = bool [@@ocaml.doc ""]

type nonrec set_instance_health_query = {
  instance_id : xml_string_max_len19; [@ocaml.doc "The ID of the instance.\n"]
  health_status : xml_string_max_len32;
      [@ocaml.doc
        "The health status of the instance. Set to [Healthy] to have the instance remain in \
         service. Set to [Unhealthy] to have the instance be out of service. Amazon EC2 Auto \
         Scaling terminates and replaces the unhealthy instance.\n"]
  should_respect_grace_period : should_respect_grace_period option;
      [@ocaml.doc
        "If the Auto Scaling group of the specified instance has a [HealthCheckGracePeriod] \
         specified for the group, by default, this call respects the grace period. Set this to \
         [False], to have the call not respect the grace period associated with the group.\n\n\
        \ For more information about the health check grace period, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/health-check-grace-period.html}Set \
         the health check grace period for an Auto Scaling group} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec honor_cooldown = bool [@@ocaml.doc ""]

type nonrec set_desired_capacity_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  desired_capacity : auto_scaling_group_desired_capacity;
      [@ocaml.doc
        "The desired capacity is the initial capacity of the Auto Scaling group after this \
         operation completes and the capacity it attempts to maintain.\n"]
  honor_cooldown : honor_cooldown option;
      [@ocaml.doc
        "Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete \
         before initiating a scaling activity to set your Auto Scaling group to its new capacity. \
         By default, Amazon EC2 Auto Scaling does not honor the cooldown period during manual \
         scaling activities.\n"]
}
[@@ocaml.doc ""]

type nonrec irreversible_instance_refresh_fault = {
  message : xml_string_max_len255 option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request failed because a desired configuration was not found or an incompatible launch \
   template (uses a Systems Manager parameter instead of an AMI ID) or launch template version \
   ([$Latest] or [$Default]) is present on the Auto Scaling group.\n"]

type nonrec rollback_instance_refresh_answer = {
  instance_refresh_id : xml_string_max_len255 option;
      [@ocaml.doc
        "The instance refresh ID associated with the request. This is the unique ID assigned to \
         the instance refresh when it was started.\n"]
}
[@@ocaml.doc ""]

type nonrec rollback_instance_refresh_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
}
[@@ocaml.doc ""]

type nonrec record_lifecycle_action_heartbeat_answer = unit [@@ocaml.doc ""]

type nonrec lifecycle_action_token = string [@@ocaml.doc ""]

type nonrec record_lifecycle_action_heartbeat_type = {
  lifecycle_hook_name : ascii_string_max_len255; [@ocaml.doc "The name of the lifecycle hook.\n"]
  auto_scaling_group_name : resource_name; [@ocaml.doc "The name of the Auto Scaling group.\n"]
  lifecycle_action_token : lifecycle_action_token option;
      [@ocaml.doc
        "A token that uniquely identifies a specific lifecycle action associated with an instance. \
         Amazon EC2 Auto Scaling sends this token to the notification target that you specified \
         when you created the lifecycle hook.\n"]
  instance_id : xml_string_max_len19 option; [@ocaml.doc "The ID of the instance.\n"]
}
[@@ocaml.doc ""]

type nonrec put_warm_pool_answer = unit [@@ocaml.doc ""]

type nonrec put_warm_pool_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  max_group_prepared_capacity : max_group_prepared_capacity option;
      [@ocaml.doc
        "Specifies the maximum number of instances that are allowed to be in the warm pool or in \
         any state except [Terminated] for the Auto Scaling group. This is an optional property. \
         Specify it only if you do not want the warm pool size to be determined by the difference \
         between the group's maximum capacity and its desired capacity. \n\n\
        \  If a value for [MaxGroupPreparedCapacity] is not specified, Amazon EC2 Auto Scaling \
         launches and maintains the difference between the group's maximum capacity and its \
         desired capacity. If you specify a value for [MaxGroupPreparedCapacity], Amazon EC2 Auto \
         Scaling uses the difference between the [MaxGroupPreparedCapacity] and the desired \
         capacity instead. \n\
        \  \n\
        \   The size of the warm pool is dynamic. Only when [MaxGroupPreparedCapacity] and \
         [MinSize] are set to the same value does the warm pool have an absolute size.\n\
        \   \n\
        \     If the desired capacity of the Auto Scaling group is higher than the \
         [MaxGroupPreparedCapacity], the capacity of the warm pool is 0, unless you specify a \
         value for [MinSize]. To remove a value that you previously set, include the property but \
         specify -1 for the value. \n\
        \     "]
  min_size : warm_pool_min_size option;
      [@ocaml.doc
        "Specifies the minimum number of instances to maintain in the warm pool. This helps you to \
         ensure that there is always a certain number of warmed instances available to handle \
         traffic spikes. Defaults to 0 if not specified.\n"]
  pool_state : warm_pool_state option;
      [@ocaml.doc
        "Sets the instance state to transition to after the lifecycle actions are complete. \
         Default is [Stopped].\n"]
  instance_reuse_policy : instance_reuse_policy option;
      [@ocaml.doc
        "Indicates whether instances in the Auto Scaling group can be returned to the warm pool on \
         scale in. The default is to terminate instances in the Auto Scaling group when the group \
         scales in.\n"]
}
[@@ocaml.doc ""]

type nonrec put_scheduled_update_group_action_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  scheduled_action_name : xml_string_max_len255; [@ocaml.doc "The name of this scaling action.\n"]
  time : timestamp_type option; [@ocaml.doc "This property is no longer used.\n"]
  start_time : timestamp_type option;
      [@ocaml.doc
        "The date and time for this action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT \
         only and in quotes (for example, [\"2021-06-01T00:00:00Z\"]).\n\n\
        \ If you specify [Recurrence] and [StartTime], Amazon EC2 Auto Scaling performs the action \
         at this time, and then performs the action based on the specified recurrence.\n\
        \ "]
  end_time : timestamp_type option;
      [@ocaml.doc
        "The date and time for the recurring schedule to end, in UTC. For example, \
         [\"2021-06-01T00:00:00Z\"].\n"]
  recurrence : xml_string_max_len255 option;
      [@ocaml.doc
        "The recurring schedule for this action. This format consists of five fields separated by \
         white spaces: \\[Minute\\] \\[Hour\\] \\[Day_of_Month\\] \\[Month_of_Year\\] \
         \\[Day_of_Week\\]. The value must be in quotes (for example, [\"30 0 1 1,6,12 *\"]). For \
         more information about this format, see {{:http://crontab.org}Crontab}.\n\n\
        \ When [StartTime] and [EndTime] are specified with [Recurrence], they form the boundaries \
         of when the recurring action starts and stops.\n\
        \ \n\
        \  Cron expressions use Universal Coordinated Time (UTC) by default.\n\
        \  "]
  min_size : auto_scaling_group_min_size option;
      [@ocaml.doc "The minimum size of the Auto Scaling group.\n"]
  max_size : auto_scaling_group_max_size option;
      [@ocaml.doc "The maximum size of the Auto Scaling group.\n"]
  desired_capacity : auto_scaling_group_desired_capacity option;
      [@ocaml.doc
        "The desired capacity is the initial capacity of the Auto Scaling group after the \
         scheduled action runs and the capacity it attempts to maintain. It can scale beyond this \
         capacity if you add more scaling conditions. \n\n\
        \  You must specify at least one of the following properties: [MaxSize], [MinSize], or \
         [DesiredCapacity]. \n\
        \  \n\
        \   "]
  time_zone : xml_string_max_len255 option;
      [@ocaml.doc
        "Specifies the time zone for a cron expression. If a time zone is not provided, UTC is \
         used by default. \n\n\
        \ Valid values are the canonical names of the IANA time zones, derived from the IANA Time \
         Zone Database (such as [Etc/GMT+9] or [Pacific/Tahiti]). For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_tz_database_time_zones}https://en.wikipedia.org/wiki/List_of_tz_database_time_zones}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec policy_arn_type = {
  policy_ar_n : resource_name option; [@ocaml.doc "The Amazon Resource Name (ARN) of the policy.\n"]
  alarms : alarms option;
      [@ocaml.doc "The CloudWatch alarms created for the target tracking scaling policy.\n"]
}
[@@ocaml.doc "Contains the output of PutScalingPolicy.\n"]

type nonrec predictive_scaling_max_capacity_buffer = int [@@ocaml.doc ""]

type nonrec predictive_scaling_max_capacity_breach_behavior =
  | HonorMaxCapacity [@ocaml.doc ""]
  | IncreaseMaxCapacity [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_scheduling_buffer_time = int [@@ocaml.doc ""]

type nonrec predictive_scaling_mode =
  | ForecastAndScale [@ocaml.doc ""]
  | ForecastOnly [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec return_data = bool [@@ocaml.doc ""]

type nonrec xml_string_metric_label = string [@@ocaml.doc ""]

type nonrec metric_unit = string [@@ocaml.doc ""]

type nonrec xml_string_metric_stat = string [@@ocaml.doc ""]

type nonrec metric_dimension_value = string [@@ocaml.doc ""]

type nonrec metric_dimension_name = string [@@ocaml.doc ""]

type nonrec metric_dimension = {
  name : metric_dimension_name; [@ocaml.doc "The name of the dimension.\n"]
  value : metric_dimension_value; [@ocaml.doc "The value of the dimension.\n"]
}
[@@ocaml.doc "Describes the dimension of a metric.\n"]

type nonrec metric_dimensions = metric_dimension list [@@ocaml.doc ""]

type nonrec metric_name = string [@@ocaml.doc ""]

type nonrec metric_namespace = string [@@ocaml.doc ""]

type nonrec metric = {
  namespace : metric_namespace;
      [@ocaml.doc
        "The namespace of the metric. For more information, see the table in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html}Amazon \
         Web Services services that publish CloudWatch metrics } in the {i Amazon CloudWatch User \
         Guide}.\n"]
  metric_name : metric_name; [@ocaml.doc "The name of the metric.\n"]
  dimensions : metric_dimensions option;
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
[@@ocaml.doc "Represents a specific metric. \n"]

type nonrec metric_stat = {
  metric : metric;
      [@ocaml.doc
        "The CloudWatch metric to return, including the metric name, namespace, and dimensions. To \
         get the exact metric name, namespace, and dimensions, inspect the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html}Metric} \
         object that is returned by a call to \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html}ListMetrics}.\n"]
  stat : xml_string_metric_stat;
      [@ocaml.doc
        "The statistic to return. It can include any CloudWatch statistic or extended statistic. \
         For a list of valid values, see the table in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic}Statistics} \
         in the {i Amazon CloudWatch User Guide}.\n\n\
        \ The most commonly used metrics for predictive scaling are [Average] and [Sum].\n\
        \ "]
  unit_ : metric_unit option;
      [@ocaml.doc
        "The unit to use for the returned data points. For a complete list of the units that \
         CloudWatch supports, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html}MetricDatum} \
         data type in the {i Amazon CloudWatch API Reference}.\n"]
}
[@@ocaml.doc
  "This structure defines the CloudWatch metric to return, along with the statistic and unit.\n\n\
  \ For more information about the CloudWatch terminology below, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html}Amazon \
   CloudWatch concepts} in the {i Amazon CloudWatch User Guide}.\n\
  \ "]

type nonrec metric_data_query = {
  id : xml_string_max_len255;
      [@ocaml.doc
        "A short name that identifies the object's results in the response. This name must be \
         unique among all [MetricDataQuery] objects specified for a single scaling policy. If you \
         are performing math expressions on this set of data, this name represents that data and \
         can serve as a variable in the mathematical expression. The valid characters are letters, \
         numbers, and underscores. The first character must be a lowercase letter. \n"]
  expression : xml_string_max_len1023 option;
      [@ocaml.doc
        "The math expression to perform on the returned data, if this object is performing a math \
         expression. This expression can use the [Id] of the other metrics to refer to those \
         metrics, and can also use the [Id] of other expressions to use the result of those \
         expressions. \n\n\
        \ Conditional: Within each [MetricDataQuery] object, you must specify either [Expression] \
         or [MetricStat], but not both.\n\
        \ "]
  metric_stat : metric_stat option;
      [@ocaml.doc
        "Information about the metric data to return.\n\n\
        \ Conditional: Within each [MetricDataQuery] object, you must specify either [Expression] \
         or [MetricStat], but not both.\n\
        \ "]
  label : xml_string_metric_label option;
      [@ocaml.doc
        "A human-readable label for this metric or expression. This is especially useful if this \
         is a math expression, so that you know what the value represents.\n"]
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
}
[@@ocaml.doc
  "The metric data to return. Also defines whether this call is returning data for one metric \
   only, or whether it is performing a math expression on the values of returned metric statistics \
   to create a new time series. A time series is a series of data points, each of which is \
   associated with a timestamp.\n\n\
  \ For more information and examples, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/predictive-scaling-customized-metric-specification.html}Advanced \
   predictive scaling policy configurations using custom metrics} in the {i Amazon EC2 Auto \
   Scaling User Guide}.\n\
  \ "]

type nonrec metric_data_queries = metric_data_query list [@@ocaml.doc ""]

type nonrec predictive_scaling_customized_capacity_metric = {
  metric_data_queries : metric_data_queries;
      [@ocaml.doc
        "One or more metric data queries to provide the data points for a capacity metric. Use \
         multiple metric data queries only if you are performing a math expression on returned \
         data. \n"]
}
[@@ocaml.doc "Describes a customized capacity metric for a predictive scaling policy.\n"]

type nonrec predictive_scaling_customized_load_metric = {
  metric_data_queries : metric_data_queries;
      [@ocaml.doc
        "One or more metric data queries to provide the data points for a load metric. Use \
         multiple metric data queries only if you are performing a math expression on returned \
         data. \n"]
}
[@@ocaml.doc "Describes a custom load metric for a predictive scaling policy.\n"]

type nonrec predictive_scaling_customized_scaling_metric = {
  metric_data_queries : metric_data_queries;
      [@ocaml.doc
        "One or more metric data queries to provide the data points for a scaling metric. Use \
         multiple metric data queries only if you are performing a math expression on returned \
         data. \n"]
}
[@@ocaml.doc "Describes a custom scaling metric for a predictive scaling policy.\n"]

type nonrec predefined_load_metric_type =
  | ASGTotalCPUUtilization [@ocaml.doc ""]
  | ASGTotalNetworkIn [@ocaml.doc ""]
  | ASGTotalNetworkOut [@ocaml.doc ""]
  | ALBTargetGroupRequestCount [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_predefined_load_metric = {
  predefined_metric_type : predefined_load_metric_type; [@ocaml.doc "The metric type.\n"]
  resource_label : xml_string_max_len1023 option;
      [@ocaml.doc
        "A label that uniquely identifies a specific Application Load Balancer target group from \
         which to determine the request count served by your Auto Scaling group. You can't specify \
         a resource label unless the target group is attached to the Auto Scaling group.\n\n\
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
}
[@@ocaml.doc
  "Describes a load metric for a predictive scaling policy.\n\n\
  \ When returned in the output of [DescribePolicies], it indicates that a predictive scaling \
   policy uses individually specified load and scaling metrics instead of a metric pair.\n\
  \ "]

type nonrec predefined_scaling_metric_type =
  | ASGAverageCPUUtilization [@ocaml.doc ""]
  | ASGAverageNetworkIn [@ocaml.doc ""]
  | ASGAverageNetworkOut [@ocaml.doc ""]
  | ALBRequestCountPerTarget [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_predefined_scaling_metric = {
  predefined_metric_type : predefined_scaling_metric_type; [@ocaml.doc "The metric type.\n"]
  resource_label : xml_string_max_len1023 option;
      [@ocaml.doc
        "A label that uniquely identifies a specific Application Load Balancer target group from \
         which to determine the average request count served by your Auto Scaling group. You can't \
         specify a resource label unless the target group is attached to the Auto Scaling group.\n\n\
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
}
[@@ocaml.doc
  "Describes a scaling metric for a predictive scaling policy.\n\n\
  \ When returned in the output of [DescribePolicies], it indicates that a predictive scaling \
   policy uses individually specified load and scaling metrics instead of a metric pair.\n\
  \ "]

type nonrec predefined_metric_pair_type =
  | ASGCPUUtilization [@ocaml.doc ""]
  | ASGNetworkIn [@ocaml.doc ""]
  | ASGNetworkOut [@ocaml.doc ""]
  | ALBRequestCount [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predictive_scaling_predefined_metric_pair = {
  predefined_metric_type : predefined_metric_pair_type;
      [@ocaml.doc
        "Indicates which metrics to use. There are two different types of metrics for each metric \
         type: one is a load metric and one is a scaling metric. For example, if the metric type \
         is [ASGCPUUtilization], the Auto Scaling group's total CPU metric is used as the load \
         metric, and the average CPU metric is used for the scaling metric.\n"]
  resource_label : xml_string_max_len1023 option;
      [@ocaml.doc
        "A label that uniquely identifies a specific Application Load Balancer target group from \
         which to determine the total and average request count served by your Auto Scaling group. \
         You can't specify a resource label unless the target group is attached to the Auto \
         Scaling group.\n\n\
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
}
[@@ocaml.doc "Represents a metric pair for a predictive scaling policy. \n"]

type nonrec metric_scale = float [@@ocaml.doc ""]

type nonrec predictive_scaling_metric_specification = {
  target_value : metric_scale;
      [@ocaml.doc
        "Specifies the target utilization.\n\n\
        \  Some metrics are based on a count instead of a percentage, such as the request count \
         for an Application Load Balancer or the number of messages in an SQS queue. If the \
         scaling policy specifies one of these metrics, specify the target utilization as the \
         optimal average request or message count per instance during any one-minute interval. \n\
        \  \n\
        \   "]
  predefined_metric_pair_specification : predictive_scaling_predefined_metric_pair option;
      [@ocaml.doc
        "The predefined metric pair specification from which Amazon EC2 Auto Scaling determines \
         the appropriate scaling metric and load metric to use.\n"]
  predefined_scaling_metric_specification : predictive_scaling_predefined_scaling_metric option;
      [@ocaml.doc "The predefined scaling metric specification.\n"]
  predefined_load_metric_specification : predictive_scaling_predefined_load_metric option;
      [@ocaml.doc "The predefined load metric specification.\n"]
  customized_scaling_metric_specification : predictive_scaling_customized_scaling_metric option;
      [@ocaml.doc "The customized scaling metric specification.\n"]
  customized_load_metric_specification : predictive_scaling_customized_load_metric option;
      [@ocaml.doc "The customized load metric specification.\n"]
  customized_capacity_metric_specification : predictive_scaling_customized_capacity_metric option;
      [@ocaml.doc "The customized capacity metric specification.\n"]
}
[@@ocaml.doc
  "This structure specifies the metrics and target utilization settings for a predictive scaling \
   policy. \n\n\
  \ You must specify either a metric pair, or a load metric and a scaling metric individually. \
   Specifying a metric pair instead of individual metrics provides a simpler way to configure \
   metrics for a scaling policy. You choose the metric pair, and the policy automatically knows \
   the correct sum and average statistics to use for the load metric and the scaling metric.\n\
  \ \n\
  \  Example\n\
  \  \n\
  \   {ul\n\
  \         {-  You create a predictive scaling policy and specify [ALBRequestCount] as the value \
   for the metric pair and [1000.0] as the target value. For this type of metric, you must provide \
   the metric dimension for the corresponding target group, so you also provide a resource label \
   for the Application Load Balancer target group that is attached to your Auto Scaling group.\n\
  \             \n\
  \              }\n\
  \         {-  The number of requests the target group receives per minute provides the load \
   metric, and the request count averaged between the members of the target group provides the \
   scaling metric. In CloudWatch, this refers to the [RequestCount] and [RequestCountPerTarget] \
   metrics, respectively.\n\
  \             \n\
  \              }\n\
  \         {-  For optimal use of predictive scaling, you adhere to the best practice of using a \
   dynamic scaling policy to automatically scale between the minimum capacity and maximum capacity \
   in response to real-time changes in resource utilization.\n\
  \             \n\
  \              }\n\
  \         {-  Amazon EC2 Auto Scaling consumes data points for the load metric over the last 14 \
   days and creates an hourly load forecast for predictive scaling. (A minimum of 24 hours of data \
   is required.)\n\
  \             \n\
  \              }\n\
  \         {-  After creating the load forecast, Amazon EC2 Auto Scaling determines when to \
   reduce or increase the capacity of your Auto Scaling group in each hour of the forecast period \
   so that the average number of requests received by each instance is as close to 1000 requests \
   per minute as possible at all times.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   For information about using custom metrics with predictive scaling, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/predictive-scaling-customized-metric-specification.html}Advanced \
   predictive scaling policy configurations using custom metrics} in the {i Amazon EC2 Auto \
   Scaling User Guide}.\n\
  \   "]

type nonrec predictive_scaling_metric_specifications = predictive_scaling_metric_specification list
[@@ocaml.doc ""]

type nonrec predictive_scaling_configuration = {
  metric_specifications : predictive_scaling_metric_specifications;
      [@ocaml.doc
        "This structure includes the metrics and target utilization to use for predictive scaling. \
         \n\n\
        \ This is an array, but we currently only support a single metric specification. That is, \
         you can specify a target value and a single metric pair, or a target value and one \
         scaling metric and one load metric.\n\
        \ "]
  mode : predictive_scaling_mode option;
      [@ocaml.doc "The predictive scaling mode. Defaults to [ForecastOnly] if not specified.\n"]
  scheduling_buffer_time : predictive_scaling_scheduling_buffer_time option;
      [@ocaml.doc
        "The amount of time, in seconds, by which the instance launch time can be advanced. For \
         example, the forecast says to add capacity at 10:00 AM, and you choose to pre-launch \
         instances by 5 minutes. In that case, the instances will be launched at 9:55 AM. The \
         intention is to give resources time to be provisioned. It can take a few minutes to \
         launch an EC2 instance. The actual amount of time required depends on several factors, \
         such as the size of the instance and whether there are startup scripts to complete. \n\n\
        \ The value must be less than the forecast interval duration of 3600 seconds (60 minutes). \
         Defaults to 300 seconds if not specified. \n\
        \ "]
  max_capacity_breach_behavior : predictive_scaling_max_capacity_breach_behavior option;
      [@ocaml.doc
        "Defines the behavior that should be applied if the forecast capacity approaches or \
         exceeds the maximum capacity of the Auto Scaling group. Defaults to [HonorMaxCapacity] if \
         not specified.\n\n\
        \ The following are possible values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [HonorMaxCapacity] - Amazon EC2 Auto Scaling can't increase the maximum \
         capacity of the group when the forecast capacity is close to or exceeds the maximum \
         capacity.\n\
        \            \n\
        \             }\n\
        \        {-   [IncreaseMaxCapacity] - Amazon EC2 Auto Scaling can increase the maximum \
         capacity of the group when the forecast capacity is close to or exceeds the maximum \
         capacity. The upper limit is determined by the forecasted capacity and the value for \
         [MaxCapacityBuffer].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    Use caution when allowing the maximum capacity to be automatically increased. This \
         can lead to more instances being launched than intended if the increased maximum capacity \
         is not monitored and managed. The increased maximum capacity then becomes the new normal \
         maximum capacity for the Auto Scaling group until you manually update it. The maximum \
         capacity does not automatically decrease back to the original maximum.\n\
        \    \n\
        \     "]
  max_capacity_buffer : predictive_scaling_max_capacity_buffer option;
      [@ocaml.doc
        "The size of the capacity buffer to use when the forecast capacity is close to or exceeds \
         the maximum capacity. The value is specified as a percentage relative to the forecast \
         capacity. For example, if the buffer is 10, this means a 10 percent buffer, such that if \
         the forecast capacity is 50, and the maximum capacity is 40, then the effective maximum \
         capacity is 55.\n\n\
        \ If set to 0, Amazon EC2 Auto Scaling may scale capacity higher than the maximum capacity \
         to equal but not exceed forecast capacity. \n\
        \ \n\
        \  Required if the [MaxCapacityBreachBehavior] property is set to [IncreaseMaxCapacity], \
         and cannot be used otherwise.\n\
        \  "]
}
[@@ocaml.doc
  "Represents a predictive scaling policy configuration to use with Amazon EC2 Auto Scaling.\n"]

type nonrec scaling_policy_enabled = bool [@@ocaml.doc ""]

type nonrec disable_scale_in = bool [@@ocaml.doc ""]

type nonrec metric_granularity_in_seconds = int [@@ocaml.doc ""]

type nonrec target_tracking_metric_stat = {
  metric : metric; [@ocaml.doc "The metric to use.\n"]
  stat : xml_string_metric_stat;
      [@ocaml.doc
        "The statistic to return. It can include any CloudWatch statistic or extended statistic. \
         For a list of valid values, see the table in \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic}Statistics} \
         in the {i Amazon CloudWatch User Guide}.\n\n\
        \ The most commonly used metric for scaling is [Average].\n\
        \ "]
  unit_ : metric_unit option;
      [@ocaml.doc
        "The unit to use for the returned data points. For a complete list of the units that \
         CloudWatch supports, see the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html}MetricDatum} \
         data type in the {i Amazon CloudWatch API Reference}.\n"]
  period : metric_granularity_in_seconds option;
      [@ocaml.doc
        " The period of the metric in seconds. The default value is 60. Accepted values are 10, \
         30, and 60. For high resolution metric, set the value to less than 60. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/policy-creating-high-resolution-metrics.html}Create \
         a target tracking policy using high-resolution metrics for faster response}. \n"]
}
[@@ocaml.doc
  "This structure defines the CloudWatch metric to return, along with the statistic and unit.\n\n\
  \ For more information about the CloudWatch terminology below, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html}Amazon \
   CloudWatch concepts} in the {i Amazon CloudWatch User Guide}.\n\
  \ "]

type nonrec xml_string_max_len2047 = string [@@ocaml.doc ""]

type nonrec xml_string_max_len64 = string [@@ocaml.doc ""]

type nonrec target_tracking_metric_data_query = {
  id : xml_string_max_len64;
      [@ocaml.doc
        "A short name that identifies the object's results in the response. This name must be \
         unique among all [TargetTrackingMetricDataQuery] objects specified for a single scaling \
         policy. If you are performing math expressions on this set of data, this name represents \
         that data and can serve as a variable in the mathematical expression. The valid \
         characters are letters, numbers, and underscores. The first character must be a lowercase \
         letter. \n"]
  expression : xml_string_max_len2047 option;
      [@ocaml.doc
        "The math expression to perform on the returned data, if this object is performing a math \
         expression. This expression can use the [Id] of the other metrics to refer to those \
         metrics, and can also use the [Id] of other expressions to use the result of those \
         expressions. \n\n\
        \ Conditional: Within each [TargetTrackingMetricDataQuery] object, you must specify either \
         [Expression] or [MetricStat], but not both.\n\
        \ "]
  metric_stat : target_tracking_metric_stat option;
      [@ocaml.doc
        "Information about the metric data to return.\n\n\
        \ Conditional: Within each [TargetTrackingMetricDataQuery] object, you must specify either \
         [Expression] or [MetricStat], but not both.\n\
        \ "]
  label : xml_string_metric_label option;
      [@ocaml.doc
        "A human-readable label for this metric or expression. This is especially useful if this \
         is a math expression, so that you know what the value represents.\n"]
  period : metric_granularity_in_seconds option;
      [@ocaml.doc
        " The period of the metric in seconds. The default value is 60. Accepted values are 10, \
         30, and 60. For high resolution metric, set the value to less than 60. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/policy-creating-high-resolution-metrics.html}Create \
         a target tracking policy using high-resolution metrics for faster response}. \n"]
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
}
[@@ocaml.doc
  "The metric data to return. Also defines whether this call is returning data for one metric \
   only, or whether it is performing a math expression on the values of returned metric statistics \
   to create a new time series. A time series is a series of data points, each of which is \
   associated with a timestamp.\n"]

type nonrec target_tracking_metric_data_queries = target_tracking_metric_data_query list
[@@ocaml.doc ""]

type nonrec metric_statistic =
  | Average [@ocaml.doc ""]
  | Minimum [@ocaml.doc ""]
  | Maximum [@ocaml.doc ""]
  | SampleCount [@ocaml.doc ""]
  | Sum [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec customized_metric_specification = {
  metric_name : metric_name option;
      [@ocaml.doc
        "The name of the metric. To get the exact metric name, namespace, and dimensions, inspect \
         the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html}Metric} \
         object that is returned by a call to \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html}ListMetrics}.\n"]
  namespace : metric_namespace option; [@ocaml.doc "The namespace of the metric.\n"]
  dimensions : metric_dimensions option;
      [@ocaml.doc
        "The dimensions of the metric.\n\n\
        \ Conditional: If you published your metric with dimensions, you must specify the same \
         dimensions in your scaling policy.\n\
        \ "]
  statistic : metric_statistic option; [@ocaml.doc "The statistic of the metric.\n"]
  unit_ : metric_unit option;
      [@ocaml.doc
        "The unit of the metric. For a complete list of the units that CloudWatch supports, see \
         the \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html}MetricDatum} \
         data type in the {i Amazon CloudWatch API Reference}.\n"]
  period : metric_granularity_in_seconds option;
      [@ocaml.doc
        " The period of the metric in seconds. The default value is 60. Accepted values are 10, \
         30, and 60. For high resolution metric, set the value to less than 60. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/policy-creating-high-resolution-metrics.html}Create \
         a target tracking policy using high-resolution metrics for faster response}. \n"]
  metrics : target_tracking_metric_data_queries option;
      [@ocaml.doc
        "The metrics to include in the target tracking scaling policy, as a metric data query. \
         This can include both raw metric and metric math expressions.\n"]
}
[@@ocaml.doc
  "Represents a CloudWatch metric of your choosing for a target tracking scaling policy to use \
   with Amazon EC2 Auto Scaling.\n\n\
  \ To create your customized metric specification:\n\
  \ \n\
  \  {ul\n\
  \        {-  Add values for each required property from CloudWatch. You can use an existing \
   metric, or a new metric that you create. To use your own metric, you must first publish the \
   metric to CloudWatch. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html}Publish \
   custom metrics} in the {i Amazon CloudWatch User Guide}.\n\
  \            \n\
  \             }\n\
  \        {-  Choose a metric that changes proportionally with capacity. The value of the metric \
   should increase or decrease in inverse proportion to the number of capacity units. That is, the \
   value of the metric should decrease when capacity increases.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about the CloudWatch terminology below, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html}Amazon \
   CloudWatch concepts}.\n\
  \   \n\
  \     Each individual service provides information about the metrics, namespace, and dimensions \
   they use. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html}Amazon \
   Web Services services that publish CloudWatch metrics} in the {i Amazon CloudWatch User Guide}.\n\
  \     \n\
  \      "]

type nonrec metric_type =
  | ASGAverageCPUUtilization [@ocaml.doc ""]
  | ASGAverageNetworkIn [@ocaml.doc ""]
  | ASGAverageNetworkOut [@ocaml.doc ""]
  | ALBRequestCountPerTarget [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec predefined_metric_specification = {
  predefined_metric_type : metric_type;
      [@ocaml.doc
        "The metric type. The following predefined metrics are available:\n\n\
        \ {ul\n\
        \       {-   [ASGAverageCPUUtilization] - Average CPU utilization of the Auto Scaling group.\n\
        \           \n\
        \            }\n\
        \       {-   [ASGAverageNetworkIn] - Average number of bytes received on all network \
         interfaces by the Auto Scaling group.\n\
        \           \n\
        \            }\n\
        \       {-   [ASGAverageNetworkOut] - Average number of bytes sent out on all network \
         interfaces by the Auto Scaling group.\n\
        \           \n\
        \            }\n\
        \       {-   [ALBRequestCountPerTarget] - Average Application Load Balancer request count \
         per target for your Auto Scaling group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resource_label : xml_string_max_len1023 option;
      [@ocaml.doc
        "A label that uniquely identifies a specific Application Load Balancer target group from \
         which to determine the average request count served by your Auto Scaling group. You can't \
         specify a resource label unless the target group is attached to the Auto Scaling group.\n\n\
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
}
[@@ocaml.doc
  "Represents a predefined metric for a target tracking scaling policy to use with Amazon EC2 Auto \
   Scaling.\n"]

type nonrec target_tracking_configuration = {
  predefined_metric_specification : predefined_metric_specification option;
      [@ocaml.doc
        "A predefined metric. You must specify either a predefined metric or a customized metric.\n"]
  customized_metric_specification : customized_metric_specification option;
      [@ocaml.doc
        "A customized metric. You must specify either a predefined metric or a customized metric.\n"]
  target_value : metric_scale;
      [@ocaml.doc
        "The target value for the metric.\n\n\
        \  Some metrics are based on a count instead of a percentage, such as the request count \
         for an Application Load Balancer or the number of messages in an SQS queue. If the \
         scaling policy specifies one of these metrics, specify the target utilization as the \
         optimal average request or message count per instance during any one-minute interval. \n\
        \  \n\
        \   "]
  disable_scale_in : disable_scale_in option;
      [@ocaml.doc
        "Indicates whether scaling in by the target tracking scaling policy is disabled. If \
         scaling in is disabled, the target tracking scaling policy doesn't remove instances from \
         the Auto Scaling group. Otherwise, the target tracking scaling policy can remove \
         instances from the Auto Scaling group. The default is [false].\n"]
}
[@@ocaml.doc
  "Represents a target tracking scaling policy configuration to use with Amazon EC2 Auto Scaling.\n"]

type nonrec estimated_instance_warmup = int [@@ocaml.doc ""]

type nonrec policy_increment = int [@@ocaml.doc ""]

type nonrec step_adjustment = {
  metric_interval_lower_bound : metric_scale option;
      [@ocaml.doc
        "The lower bound for the difference between the alarm threshold and the CloudWatch metric. \
         If the metric value is above the breach threshold, the lower bound is inclusive (the \
         metric must be greater than or equal to the threshold plus the lower bound). Otherwise, \
         it is exclusive (the metric must be greater than the threshold plus the lower bound). A \
         null value indicates negative infinity.\n"]
  metric_interval_upper_bound : metric_scale option;
      [@ocaml.doc
        "The upper bound for the difference between the alarm threshold and the CloudWatch metric. \
         If the metric value is above the breach threshold, the upper bound is exclusive (the \
         metric must be less than the threshold plus the upper bound). Otherwise, it is inclusive \
         (the metric must be less than or equal to the threshold plus the upper bound). A null \
         value indicates positive infinity.\n\n\
        \ The upper bound must be greater than the lower bound.\n\
        \ "]
  scaling_adjustment : policy_increment;
      [@ocaml.doc
        "The amount by which to scale, based on the specified adjustment type. A positive value \
         adds to the current capacity while a negative number removes from the current capacity. \
         For exact capacity, you must specify a non-negative value.\n"]
}
[@@ocaml.doc
  "Describes information used to create a step adjustment for a step scaling policy.\n\n\
  \ For the following examples, suppose that you have an alarm with a breach threshold of 50:\n\
  \ \n\
  \  {ul\n\
  \        {-  To trigger the adjustment when the metric is greater than or equal to 50 and less \
   than 60, specify a lower bound of 0 and an upper bound of 10.\n\
  \            \n\
  \             }\n\
  \        {-  To trigger the adjustment when the metric is greater than 40 and less than or equal \
   to 50, specify a lower bound of -10 and an upper bound of 0.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   There are a few rules for the step adjustments for your step policy:\n\
  \   \n\
  \    {ul\n\
  \          {-  The ranges of your step adjustments can't overlap or have a gap.\n\
  \              \n\
  \               }\n\
  \          {-  At most, one step adjustment can have a null lower bound. If one step adjustment \
   has a negative lower bound, then there must be a step adjustment with a null lower bound.\n\
  \              \n\
  \               }\n\
  \          {-  At most, one step adjustment can have a null upper bound. If one step adjustment \
   has a positive upper bound, then there must be a step adjustment with a null upper bound.\n\
  \              \n\
  \               }\n\
  \          {-  The upper and lower bound can't be null in the same step adjustment.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-steps}Step \
   adjustments} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \   "]

type nonrec step_adjustments = step_adjustment list [@@ocaml.doc ""]

type nonrec min_adjustment_magnitude = int [@@ocaml.doc ""]

type nonrec min_adjustment_step = int [@@ocaml.doc ""]

type nonrec put_scaling_policy_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  policy_name : xml_string_max_len255; [@ocaml.doc "The name of the policy.\n"]
  policy_type : xml_string_max_len64 option;
      [@ocaml.doc
        "One of the following policy types: \n\n\
        \ {ul\n\
        \       {-   [TargetTrackingScaling] \n\
        \           \n\
        \            }\n\
        \       {-   [StepScaling] \n\
        \           \n\
        \            }\n\
        \       {-   [SimpleScaling] (default)\n\
        \           \n\
        \            }\n\
        \       {-   [PredictiveScaling] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  adjustment_type : xml_string_max_len255 option;
      [@ocaml.doc
        "Specifies how the scaling adjustment is interpreted (for example, an absolute number or a \
         percentage). The valid values are [ChangeInCapacity], [ExactCapacity], and \
         [PercentChangeInCapacity].\n\n\
        \ Required if the policy type is [StepScaling] or [SimpleScaling]. For more information, \
         see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment}Scaling \
         adjustment types} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ "]
  min_adjustment_step : min_adjustment_step option;
      [@ocaml.doc "Available for backward compatibility. Use [MinAdjustmentMagnitude] instead.\n"]
  min_adjustment_magnitude : min_adjustment_magnitude option;
      [@ocaml.doc
        "The minimum value to scale by when the adjustment type is [PercentChangeInCapacity]. For \
         example, suppose that you create a step scaling policy to scale out an Auto Scaling group \
         by 25 percent and you specify a [MinAdjustmentMagnitude] of 2. If the group has 4 \
         instances and the scaling policy is performed, 25 percent of 4 is 1. However, because you \
         specified a [MinAdjustmentMagnitude] of 2, Amazon EC2 Auto Scaling scales out the group \
         by 2 instances.\n\n\
        \ Valid only if the policy type is [StepScaling] or [SimpleScaling]. For more information, \
         see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html#as-scaling-adjustment}Scaling \
         adjustment types} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ \n\
        \   Some Auto Scaling groups use instance weights. In this case, set the \
         [MinAdjustmentMagnitude] to a value that is at least as large as your largest instance \
         weight.\n\
        \   \n\
        \    "]
  scaling_adjustment : policy_increment option;
      [@ocaml.doc
        "The amount by which to scale, based on the specified adjustment type. A positive value \
         adds to the current capacity while a negative number removes from the current capacity. \
         For exact capacity, you must specify a non-negative value.\n\n\
        \ Required if the policy type is [SimpleScaling]. (Not used with any other policy type.) \n\
        \ "]
  cooldown : cooldown option;
      [@ocaml.doc
        "A cooldown period, in seconds, that applies to a specific simple scaling policy. When a \
         cooldown period is specified here, it overrides the default cooldown.\n\n\
        \ Valid only if the policy type is [SimpleScaling]. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-cooldowns.html}Scaling \
         cooldowns for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ \n\
        \  Default: None\n\
        \  "]
  metric_aggregation_type : xml_string_max_len32 option;
      [@ocaml.doc
        "The aggregation type for the CloudWatch metrics. The valid values are [Minimum], \
         [Maximum], and [Average]. If the aggregation type is null, the value is treated as \
         [Average].\n\n\
        \ Valid only if the policy type is [StepScaling].\n\
        \ "]
  step_adjustments : step_adjustments option;
      [@ocaml.doc
        "A set of adjustments that enable you to scale based on the size of the alarm breach.\n\n\
        \ Required if the policy type is [StepScaling]. (Not used with any other policy type.) \n\
        \ "]
  estimated_instance_warmup : estimated_instance_warmup option;
      [@ocaml.doc
        " {i Not needed if the default instance warmup is defined for the group.} \n\n\
        \ The estimated time, in seconds, until a newly launched instance can contribute to the \
         CloudWatch metrics. This warm-up period applies to instances launched due to a specific \
         target tracking or step scaling policy. When a warm-up period is specified here, it \
         overrides the default instance warmup.\n\
        \ \n\
        \  Valid only if the policy type is [TargetTrackingScaling] or [StepScaling].\n\
        \  \n\
        \    The default is to use the value for the default instance warmup defined for the \
         group. If default instance warmup is null, then [EstimatedInstanceWarmup] falls back to \
         the value of default cooldown.\n\
        \    \n\
        \     "]
  target_tracking_configuration : target_tracking_configuration option;
      [@ocaml.doc
        "A target tracking scaling policy. Provides support for predefined or custom metrics.\n\n\
        \ The following predefined metrics are available:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ASGAverageCPUUtilization] \n\
        \            \n\
        \             }\n\
        \        {-   [ASGAverageNetworkIn] \n\
        \            \n\
        \             }\n\
        \        {-   [ASGAverageNetworkOut] \n\
        \            \n\
        \             }\n\
        \        {-   [ALBRequestCountPerTarget] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you specify [ALBRequestCountPerTarget] for the metric, you must specify the \
         [ResourceLabel] property with the [PredefinedMetricSpecification].\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_TargetTrackingConfiguration.html}TargetTrackingConfiguration} \
         in the {i Amazon EC2 Auto Scaling API Reference}.\n\
        \    \n\
        \     Required if the policy type is [TargetTrackingScaling].\n\
        \     "]
  enabled : scaling_policy_enabled option;
      [@ocaml.doc
        "Indicates whether the scaling policy is enabled or disabled. The default is enabled. For \
         more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-enable-disable-scaling-policy.html}Disable \
         a scaling policy for an Auto Scaling group} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  predictive_scaling_configuration : predictive_scaling_configuration option;
      [@ocaml.doc
        "A predictive scaling policy. Provides support for predefined and custom metrics.\n\n\
        \ Predefined metrics include CPU utilization, network in/out, and the Application Load \
         Balancer request count.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_PredictiveScalingConfiguration.html}PredictiveScalingConfiguration} \
         in the {i Amazon EC2 Auto Scaling API Reference}.\n\
        \  \n\
        \   Required if the policy type is [PredictiveScaling].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec put_notification_configuration_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  topic_ar_n : xml_string_max_len255;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon SNS topic.\n"]
  notification_types : auto_scaling_notification_types;
      [@ocaml.doc
        "The type of event that causes the notification to be sent. To query the notification \
         types supported by Amazon EC2 Auto Scaling, call the \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_DescribeAutoScalingNotificationTypes.html}DescribeAutoScalingNotificationTypes} \
         API.\n"]
}
[@@ocaml.doc ""]

type nonrec put_lifecycle_hook_answer = unit [@@ocaml.doc ""]

type nonrec lifecycle_action_result = string [@@ocaml.doc ""]

type nonrec heartbeat_timeout = int [@@ocaml.doc ""]

type nonrec notification_target_resource_name = string [@@ocaml.doc ""]

type nonrec lifecycle_transition = string [@@ocaml.doc ""]

type nonrec put_lifecycle_hook_type = {
  lifecycle_hook_name : ascii_string_max_len255; [@ocaml.doc "The name of the lifecycle hook.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  lifecycle_transition : lifecycle_transition option;
      [@ocaml.doc
        "The lifecycle transition. For Auto Scaling groups, there are two major lifecycle \
         transitions.\n\n\
        \ {ul\n\
        \       {-  To create a lifecycle hook for scale-out events, specify \
         [autoscaling:EC2_INSTANCE_LAUNCHING].\n\
        \           \n\
        \            }\n\
        \       {-  To create a lifecycle hook for scale-in events, specify \
         [autoscaling:EC2_INSTANCE_TERMINATING].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Required for new lifecycle hooks, but optional when updating existing hooks.\n\
        \   "]
  role_ar_n : xml_string_max_len255 option;
      [@ocaml.doc
        "The ARN of the IAM role that allows the Auto Scaling group to publish to the specified \
         notification target.\n\n\
        \ Valid only if the notification target is an Amazon SNS topic or an Amazon SQS queue. \
         Required for new lifecycle hooks, but optional when updating existing hooks.\n\
        \ "]
  notification_target_ar_n : notification_target_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the notification target that Amazon EC2 Auto Scaling \
         uses to notify you when an instance is in a wait state for the lifecycle hook. You can \
         specify either an Amazon SNS topic or an Amazon SQS queue.\n\n\
        \ If you specify an empty string, this overrides the current ARN.\n\
        \ \n\
        \  This operation uses the JSON format when sending notifications to an Amazon SQS queue, \
         and an email key-value pair format when sending notifications to an Amazon SNS topic.\n\
        \  \n\
        \   When you specify a notification target, Amazon EC2 Auto Scaling sends it a test \
         message. Test messages contain the following additional key-value pair: [\"Event\":\n\
        \                \"autoscaling:TEST_NOTIFICATION\"].\n\
        \   "]
  notification_metadata : any_printable_ascii_string_max_len4000 option;
      [@ocaml.doc
        "Additional information that you want to include any time Amazon EC2 Auto Scaling sends a \
         message to the notification target.\n"]
  heartbeat_timeout : heartbeat_timeout option;
      [@ocaml.doc
        "The maximum time, in seconds, that can elapse before the lifecycle hook times out. The \
         range is from [30] to [7200] seconds. The default value is [3600] seconds (1 hour).\n"]
  default_result : lifecycle_action_result option;
      [@ocaml.doc
        "The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an \
         unexpected failure occurs. The default value is [ABANDON].\n\n\
        \ Valid values: [CONTINUE] | [ABANDON] \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec idempotent_parameter_mismatch_error = {
  message : xml_string_max_len255 option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " Indicates that the parameters in the current request do not match the parameters from a \
   previous request with the same client token within the idempotency window. \n"]

type nonrec launch_instances_error = {
  instance_type : xml_string_max_len255 option;
      [@ocaml.doc " The instance type that failed to launch. \n"]
  market_type : xml_string_max_len64 option;
      [@ocaml.doc " The market type (On-Demand or Spot) that encountered the launch error. \n"]
  subnet_id : xml_string_max_len255 option;
      [@ocaml.doc " The subnet ID where the instance launch was attempted. \n"]
  availability_zone : xml_string_max_len255 option;
      [@ocaml.doc " The Availability Zone where the instance launch was attempted. \n"]
  availability_zone_id : xml_string_max_len255 option;
      [@ocaml.doc " The Availability Zone ID where the launch error occurred. \n"]
  error_code : xml_string_max_len64 option;
      [@ocaml.doc
        " The error code representing the type of error encountered (e.g., \
         InsufficientInstanceCapacity). \n"]
  error_message : xml_string option;
      [@ocaml.doc
        " A descriptive message providing details about the error encountered during the launch \
         attempt. \n"]
}
[@@ocaml.doc " Contains details about errors encountered during instance launch attempts. \n"]

type nonrec launch_instances_errors = launch_instances_error list [@@ocaml.doc ""]

type nonrec instance_collection = {
  instance_type : xml_string_max_len255 option;
      [@ocaml.doc " The instance type of the launched instances. \n"]
  market_type : xml_string_max_len64 option;
      [@ocaml.doc " The market type for the instances (On-Demand or Spot). \n"]
  subnet_id : xml_string_max_len255 option;
      [@ocaml.doc " The ID of the subnet where the instances were launched. \n"]
  availability_zone : xml_string_max_len255 option;
      [@ocaml.doc " The Availability Zone where the instances were launched. \n"]
  availability_zone_id : xml_string_max_len255 option;
      [@ocaml.doc
        " The Availability Zone ID where the instances in this collection were launched. \n"]
  instance_ids : instance_ids option;
      [@ocaml.doc " A list of instance IDs for the successfully launched instances. \n"]
}
[@@ocaml.doc
  " Contains details about a collection of instances launched in the Auto Scaling group. \n"]

type nonrec instance_collections = instance_collection list [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec launch_instances_result = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc " The name of the Auto Scaling group where the instances were launched. \n"]
  client_token : client_token option;
      [@ocaml.doc
        " The idempotency token used for the request, either customer-specified or auto-generated. \n"]
  instances : instance_collections option;
      [@ocaml.doc
        " A list of successfully launched instances including details such as instance type, \
         Availability Zone, subnet, lifecycle state, and instance IDs. \n"]
  errors : launch_instances_errors option;
      [@ocaml.doc
        " A list of errors encountered during the launch attempt including details about failed \
         instance launches with their corresponding error codes and messages. \n"]
}
[@@ocaml.doc ""]

type nonrec retry_strategy = RETRY_WITH_GROUP_CONFIGURATION [@ocaml.doc ""] | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec subnet_ids_limit1 = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec availability_zone_ids_limit1 = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec availability_zones_limit1 = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec requested_capacity = int [@@ocaml.doc ""]

type nonrec launch_instances_request = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc " The name of the Auto Scaling group to launch instances into. \n"]
  requested_capacity : requested_capacity;
      [@ocaml.doc
        " The number of instances to launch. Although this value can exceed 100 for instance \
         weights, the actual instance count is limited to 100 instances per launch. \n"]
  client_token : client_token;
      [@ocaml.doc " A unique, case-sensitive identifier to ensure idempotency of the request. \n"]
  availability_zones : availability_zones_limit1 option;
      [@ocaml.doc
        " The Availability Zones for the instance launch. Must match or be included in the Auto \
         Scaling group's Availability Zone configuration. Either [AvailabilityZones] or \
         [SubnetIds] must be specified for groups with multiple Availability Zone configurations. \n"]
  availability_zone_ids : availability_zone_ids_limit1 option;
      [@ocaml.doc
        " A list of Availability Zone IDs where instances should be launched. Must match or be \
         included in the group's AZ configuration. You cannot specify both AvailabilityZones and \
         AvailabilityZoneIds. Required for multi-AZ groups, optional for single-AZ groups. \n"]
  subnet_ids : subnet_ids_limit1 option;
      [@ocaml.doc
        " The subnet IDs for the instance launch. Either [AvailabilityZones] or [SubnetIds] must \
         be specified. If both are specified, the subnets must reside in the specified \
         Availability Zones. \n"]
  retry_strategy : retry_strategy option;
      [@ocaml.doc
        " Specifies whether to retry asynchronously if the synchronous launch fails. Valid values \
         are NONE (default, no async retry) and RETRY_WITH_GROUP_CONFIGURATION (increase desired \
         capacity and retry with group configuration). \n"]
}
[@@ocaml.doc ""]

type nonrec predictive_scaling_forecast_values = metric_scale list [@@ocaml.doc ""]

type nonrec predictive_scaling_forecast_timestamps = timestamp_type list [@@ocaml.doc ""]

type nonrec capacity_forecast = {
  timestamps : predictive_scaling_forecast_timestamps;
      [@ocaml.doc "The timestamps for the data points, in UTC format.\n"]
  values : predictive_scaling_forecast_values; [@ocaml.doc "The values of the data points.\n"]
}
[@@ocaml.doc
  "A [GetPredictiveScalingForecast] call returns the capacity forecast for a predictive scaling \
   policy. This structure includes the data points for that capacity forecast, along with the \
   timestamps of those data points. \n"]

type nonrec load_forecast = {
  timestamps : predictive_scaling_forecast_timestamps;
      [@ocaml.doc "The timestamps for the data points, in UTC format.\n"]
  values : predictive_scaling_forecast_values; [@ocaml.doc "The values of the data points.\n"]
  metric_specification : predictive_scaling_metric_specification;
      [@ocaml.doc "The metric specification for the load forecast.\n"]
}
[@@ocaml.doc
  "A [GetPredictiveScalingForecast] call returns the load forecast for a predictive scaling \
   policy. This structure includes the data points for that load forecast, along with the \
   timestamps of those data points and the metric specification. \n"]

type nonrec load_forecasts = load_forecast list [@@ocaml.doc ""]

type nonrec get_predictive_scaling_forecast_answer = {
  load_forecast : load_forecasts; [@ocaml.doc "The load forecast.\n"]
  capacity_forecast : capacity_forecast; [@ocaml.doc "The capacity forecast.\n"]
  update_time : timestamp_type; [@ocaml.doc "The time the forecast was made.\n"]
}
[@@ocaml.doc ""]

type nonrec get_predictive_scaling_forecast_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  policy_name : xml_string_max_len255; [@ocaml.doc "The name of the policy.\n"]
  start_time : timestamp_type;
      [@ocaml.doc
        "The inclusive start time of the time range for the forecast data to get. At most, the \
         date and time can be one year before the current date and time.\n"]
  end_time : timestamp_type;
      [@ocaml.doc
        "The exclusive end time of the time range for the forecast data to get. The maximum time \
         duration between the start and end time is 30 days. \n\n\
        \ Although this parameter can accept a date and time that is more than two days in the \
         future, the availability of forecast data has limits. Amazon EC2 Auto Scaling only issues \
         forecasts for periods of two days in advance.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec exit_standby_answer = {
  activities : activities option;
      [@ocaml.doc "The activities related to moving instances out of [Standby] mode.\n"]
}
[@@ocaml.doc ""]

type nonrec exit_standby_query = {
  instance_ids : instance_ids option;
      [@ocaml.doc "The IDs of the instances. You can specify up to 20 instances.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
}
[@@ocaml.doc ""]

type nonrec execute_policy_type = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  policy_name : resource_name; [@ocaml.doc "The name or ARN of the policy.\n"]
  honor_cooldown : honor_cooldown option;
      [@ocaml.doc
        "Indicates whether Amazon EC2 Auto Scaling waits for the cooldown period to complete \
         before executing the policy.\n\n\
        \ Valid only if the policy type is [SimpleScaling]. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-cooldowns.html}Scaling \
         cooldowns for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ "]
  metric_value : metric_scale option;
      [@ocaml.doc
        "The metric value to compare to [BreachThreshold]. This enables you to execute a policy of \
         type [StepScaling] and determine which step adjustment to use. For example, if the breach \
         threshold is 50 and you want to use a step adjustment with a lower bound of 0 and an \
         upper bound of 10, you can set the metric value to 59.\n\n\
        \ If you specify a metric value that doesn't correspond to a step adjustment for the \
         policy, the call returns an error.\n\
        \ \n\
        \  Required if the policy type is [StepScaling] and not supported otherwise.\n\
        \  "]
  breach_threshold : metric_scale option;
      [@ocaml.doc
        "The breach threshold for the alarm.\n\n\
        \ Required if the policy type is [StepScaling] and not supported otherwise.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec enter_standby_answer = {
  activities : activities option;
      [@ocaml.doc "The activities related to moving instances into [Standby] mode.\n"]
}
[@@ocaml.doc ""]

type nonrec enter_standby_query = {
  instance_ids : instance_ids option;
      [@ocaml.doc "The IDs of the instances. You can specify up to 20 instances.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  should_decrement_desired_capacity : should_decrement_desired_capacity;
      [@ocaml.doc
        "Indicates whether to decrement the desired capacity of the Auto Scaling group by the \
         number of instances moved to [Standby] mode.\n"]
}
[@@ocaml.doc ""]

type nonrec metrics = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec enable_metrics_collection_query = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  metrics : metrics option;
      [@ocaml.doc
        "Identifies the metrics to enable.\n\n\
        \ You can specify one or more of the following metrics:\n\
        \ \n\
        \  {ul\n\
        \        {-   [GroupMinSize] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupMaxSize] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupDesiredCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupInServiceInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupPendingInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupStandbyInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTerminatingInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTotalInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupInServiceCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupPendingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupStandbyCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTerminatingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTotalCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolDesiredCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolWarmedCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolPendingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolTerminatingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolTotalCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupAndWarmPoolDesiredCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupAndWarmPoolTotalCapacity] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you specify [Granularity] and don't specify any metrics, all metrics are enabled.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-metrics.html}Amazon \
         CloudWatch metrics for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\
        \    "]
  granularity : xml_string_max_len255;
      [@ocaml.doc
        "The frequency at which Amazon EC2 Auto Scaling sends aggregated data to CloudWatch. The \
         only valid value is [1Minute].\n"]
}
[@@ocaml.doc ""]

type nonrec disable_metrics_collection_query = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  metrics : metrics option;
      [@ocaml.doc
        "Identifies the metrics to disable.\n\n\
        \ You can specify one or more of the following metrics:\n\
        \ \n\
        \  {ul\n\
        \        {-   [GroupMinSize] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupMaxSize] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupDesiredCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupInServiceInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupPendingInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupStandbyInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTerminatingInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTotalInstances] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupInServiceCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupPendingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupStandbyCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTerminatingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupTotalCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolDesiredCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolWarmedCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolPendingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolTerminatingCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [WarmPoolTotalCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupAndWarmPoolDesiredCapacity] \n\
        \            \n\
        \             }\n\
        \        {-   [GroupAndWarmPoolTotalCapacity] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   If you omit this property, all metrics are disabled.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-metrics.html}Amazon \
         CloudWatch metrics for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec detach_traffic_sources_result_type = unit [@@ocaml.doc ""]

type nonrec detach_traffic_sources_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  traffic_sources : traffic_sources;
      [@ocaml.doc
        "The unique identifiers of one or more traffic sources. You can specify up to 10 traffic \
         sources.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_load_balancer_target_groups_result_type = unit [@@ocaml.doc ""]

type nonrec detach_load_balancer_target_groups_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  target_group_ar_ns : target_group_ar_ns;
      [@ocaml.doc
        "The Amazon Resource Names (ARN) of the target groups. You can specify up to 10 target \
         groups.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_load_balancers_result_type = unit [@@ocaml.doc ""]

type nonrec detach_load_balancers_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  load_balancer_names : load_balancer_names;
      [@ocaml.doc "The names of the load balancers. You can specify up to 10 load balancers.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_instances_answer = {
  activities : activities option;
      [@ocaml.doc
        "The activities related to detaching the instances from the Auto Scaling group.\n"]
}
[@@ocaml.doc ""]

type nonrec detach_instances_query = {
  instance_ids : instance_ids option;
      [@ocaml.doc "The IDs of the instances. You can specify up to 20 instances.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  should_decrement_desired_capacity : should_decrement_desired_capacity;
      [@ocaml.doc
        "Indicates whether the Auto Scaling group decrements the desired capacity value by the \
         number of instances detached.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_next_token = { message : xml_string_max_len255 option [@ocaml.doc "\n"] }
[@@ocaml.doc "The [NextToken] value is not valid.\n"]

type nonrec describe_warm_pool_answer = {
  warm_pool_configuration : warm_pool_configuration option;
      [@ocaml.doc "The warm pool configuration details. \n"]
  instances : instances option; [@ocaml.doc "The instances that are currently in the warm pool.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "This string indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_warm_pool_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of instances to return with this call. The maximum value is [50].\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of instances to return. (You received this token from a \
         previous call.)\n"]
}
[@@ocaml.doc ""]

type nonrec traffic_source_state = {
  traffic_source : xml_string_max_len511 option; [@ocaml.doc "This is replaced by [Identifier].\n"]
  state : xml_string_max_len255 option;
      [@ocaml.doc
        "Describes the current state of a traffic source.\n\n\
        \ The state values are as follows:\n\
        \ \n\
        \  {ul\n\
        \        {-   [Adding] - The Auto Scaling instances are being registered with the load \
         balancer or target group.\n\
        \            \n\
        \             }\n\
        \        {-   [Added] - All Auto Scaling instances are registered with the load balancer \
         or target group.\n\
        \            \n\
        \             }\n\
        \        {-   [InService] - For an Elastic Load Balancing load balancer or target group, \
         at least one Auto Scaling instance passed an [ELB] health check. For VPC Lattice, at \
         least one Auto Scaling instance passed an [VPC_LATTICE] health check.\n\
        \            \n\
        \             }\n\
        \        {-   [Removing] - The Auto Scaling instances are being deregistered from the load \
         balancer or target group. If connection draining (deregistration delay) is enabled, \
         Elastic Load Balancing or VPC Lattice waits for in-flight requests to complete before \
         deregistering the instances.\n\
        \            \n\
        \             }\n\
        \        {-   [Removed] - All Auto Scaling instances are deregistered from the load \
         balancer or target group.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  identifier : xml_string_max_len511 option;
      [@ocaml.doc "The unique identifier of the traffic source.\n"]
  type_ : xml_string_max_len511 option;
      [@ocaml.doc
        "Provides additional context for the value of [Identifier].\n\n\
        \ The following lists the valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [elb] if [Identifier] is the name of a Classic Load Balancer.\n\
        \            \n\
        \             }\n\
        \        {-   [elbv2] if [Identifier] is the ARN of an Application Load Balancer, Gateway \
         Load Balancer, or Network Load Balancer target group.\n\
        \            \n\
        \             }\n\
        \        {-   [vpc-lattice] if [Identifier] is the ARN of a VPC Lattice target group.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Required if the identifier is the name of a Classic Load Balancer.\n\
        \   "]
}
[@@ocaml.doc "Describes the state of a traffic source.\n"]

type nonrec traffic_source_states = traffic_source_state list [@@ocaml.doc ""]

type nonrec describe_traffic_sources_response = {
  traffic_sources : traffic_source_states option;
      [@ocaml.doc "Information about the traffic sources.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "This string indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_traffic_sources_request = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  traffic_source_type : xml_string_max_len255 option;
      [@ocaml.doc
        "The traffic source type that you want to describe.\n\n\
        \ The following lists the valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-   [elb] if the traffic source is a Classic Load Balancer.\n\
        \            \n\
        \             }\n\
        \        {-   [elbv2] if the traffic source is a Application Load Balancer, Gateway Load \
         Balancer, or Network Load Balancer.\n\
        \            \n\
        \             }\n\
        \        {-   [vpc-lattice] if the traffic source is VPC Lattice.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The maximum value is [50].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_termination_policy_types_answer = {
  termination_policy_types : termination_policies option;
      [@ocaml.doc
        "The termination policies supported by Amazon EC2 Auto Scaling: [OldestInstance], \
         [OldestLaunchConfiguration], [NewestInstance], [ClosestToNextInstanceHour], [Default], \
         [OldestLaunchTemplate], and [AllocationStrategy].\n"]
}
[@@ocaml.doc ""]

type nonrec tags_type = {
  tags : tag_description_list option; [@ocaml.doc "One or more tags.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_tags_type = {
  filters : filters option;
      [@ocaml.doc
        "One or more filters to scope the tags to return. The maximum number of filters per filter \
         type (for example, [auto-scaling-group]) is 1000.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [50] and the \
         maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_update_group_action = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  scheduled_action_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the scheduled action.\n"]
  scheduled_action_ar_n : resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the scheduled action.\n"]
  time : timestamp_type option; [@ocaml.doc "This property is no longer used.\n"]
  start_time : timestamp_type option;
      [@ocaml.doc
        "The date and time in UTC for this action to start. For example, \
         [\"2019-06-01T00:00:00Z\"]. \n"]
  end_time : timestamp_type option;
      [@ocaml.doc
        "The date and time in UTC for the recurring schedule to end. For example, \
         [\"2019-06-01T00:00:00Z\"]. \n"]
  recurrence : xml_string_max_len255 option;
      [@ocaml.doc
        "The recurring schedule for the action, in Unix cron syntax format.\n\n\
        \ When [StartTime] and [EndTime] are specified with [Recurrence], they form the boundaries \
         of when the recurring action starts and stops.\n\
        \ "]
  min_size : auto_scaling_group_min_size option;
      [@ocaml.doc "The minimum size of the Auto Scaling group.\n"]
  max_size : auto_scaling_group_max_size option;
      [@ocaml.doc "The maximum size of the Auto Scaling group.\n"]
  desired_capacity : auto_scaling_group_desired_capacity option;
      [@ocaml.doc
        "The desired capacity is the initial capacity of the Auto Scaling group after the \
         scheduled action runs and the capacity it attempts to maintain.\n"]
  time_zone : xml_string_max_len255 option; [@ocaml.doc "The time zone for the cron expression.\n"]
}
[@@ocaml.doc "Describes a scheduled scaling action.\n"]

type nonrec scheduled_update_group_actions = scheduled_update_group_action list [@@ocaml.doc ""]

type nonrec scheduled_actions_type = {
  scheduled_update_group_actions : scheduled_update_group_actions option;
      [@ocaml.doc "The scheduled actions.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_action_names = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec describe_scheduled_actions_type = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  scheduled_action_names : scheduled_action_names option;
      [@ocaml.doc
        "The names of one or more scheduled actions. If you omit this property, all scheduled \
         actions are described. If you specify an unknown scheduled action, it is ignored with no \
         error.\n\n\
        \ Array Members: Maximum number of 50 actions.\n\
        \ "]
  start_time : timestamp_type option;
      [@ocaml.doc
        "The earliest scheduled start time to return. If scheduled action names are provided, this \
         property is ignored.\n"]
  end_time : timestamp_type option;
      [@ocaml.doc
        "The latest scheduled start time to return. If scheduled action names are provided, this \
         property is ignored.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [50] and the \
         maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec process_type = {
  process_name : xml_string_max_len255;
      [@ocaml.doc
        "One of the following processes:\n\n\
        \ {ul\n\
        \       {-   [Launch] \n\
        \           \n\
        \            }\n\
        \       {-   [Terminate] \n\
        \           \n\
        \            }\n\
        \       {-   [AddToLoadBalancer] \n\
        \           \n\
        \            }\n\
        \       {-   [AlarmNotification] \n\
        \           \n\
        \            }\n\
        \       {-   [AZRebalance] \n\
        \           \n\
        \            }\n\
        \       {-   [HealthCheck] \n\
        \           \n\
        \            }\n\
        \       {-   [InstanceRefresh] \n\
        \           \n\
        \            }\n\
        \       {-   [ReplaceUnhealthy] \n\
        \           \n\
        \            }\n\
        \       {-   [ScheduledActions] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Describes a process type.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-suspend-resume-processes.html#process-types}Types \
   of processes} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

type nonrec processes = process_type list [@@ocaml.doc ""]

type nonrec processes_type = {
  processes : processes option; [@ocaml.doc "The names of the process types.\n"]
}
[@@ocaml.doc ""]

type nonrec include_deleted_groups = bool [@@ocaml.doc ""]

type nonrec describe_scaling_activities_type = {
  activity_ids : activity_ids option;
      [@ocaml.doc
        " The activity IDs of the desired scaling activities. If unknown activity IDs are \
         requested, they are ignored with no error. Only activities started within the last six \
         weeks can be returned regardless of the activity IDs specified. If other filters are \
         specified with the request, only results matching all filter criteria can be returned. \n\n\
        \ Array Members: Maximum number of 50 IDs.\n\
        \ "]
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the Auto Scaling group.\n\n\
        \   Omitting this property performs an account-wide operation, which can result in slower \
         or timed-out requests. \n\
        \  \n\
        \   "]
  include_deleted_groups : include_deleted_groups option;
      [@ocaml.doc
        "Indicates whether to include scaling activity from deleted Auto Scaling groups.\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [100] and the \
         maximum value is [100].\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  filters : filters option;
      [@ocaml.doc
        " One or more filters to limit the results based on specific criteria. The following \
         filters are supported: \n\n\
        \ {ul\n\
        \       {-   [StartTimeLowerBound] - The earliest scaling activities to return based on \
         the activity start time. Scaling activities with a start time earlier than this value are \
         not included in the results. Only activities started within the last six weeks can be \
         returned regardless of the value specified. \n\
        \           \n\
        \            }\n\
        \       {-   [StartTimeUpperBound] - The latest scaling activities to return based on the \
         activity start time. Scaling activities with a start time later than this value are not \
         included in the results. Only activities started within the last six weeks can be \
         returned regardless of the value specified. \n\
        \           \n\
        \            }\n\
        \       {-   [Status] - The [StatusCode] value of the scaling activity. This filter can \
         only be used in combination with the [AutoScalingGroupName] parameter. For valid \
         [StatusCode] values, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_Activity.html}Activity} \
         in the {i Amazon EC2 Auto Scaling API Reference}. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    [StartTimeLowerBound] and [StartTimeUpperBound] accept ISO 8601 formatted timestamps. \
         Timestamps without a timezone offset are assumed to be UTC. \n\
        \   \n\
        \    {ul\n\
        \          {-   [2000-01-18T08:15:00Z] \n\
        \              \n\
        \               }\n\
        \          {-   [2000-01-18T16:15:00+08:00] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec scaling_policy = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  policy_name : xml_string_max_len255 option; [@ocaml.doc "The name of the scaling policy.\n"]
  policy_ar_n : resource_name option; [@ocaml.doc "The Amazon Resource Name (ARN) of the policy.\n"]
  policy_type : xml_string_max_len64 option;
      [@ocaml.doc
        "One of the following policy types: \n\n\
        \ {ul\n\
        \       {-   [TargetTrackingScaling] \n\
        \           \n\
        \            }\n\
        \       {-   [StepScaling] \n\
        \           \n\
        \            }\n\
        \       {-   [SimpleScaling] (default)\n\
        \           \n\
        \            }\n\
        \       {-   [PredictiveScaling] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-target-tracking.html}Target \
         tracking scaling policies} and \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-scaling-simple-step.html}Step \
         and simple scaling policies} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \   "]
  adjustment_type : xml_string_max_len255 option;
      [@ocaml.doc
        "Specifies how the scaling adjustment is interpreted (for example, an absolute number or a \
         percentage). The valid values are [ChangeInCapacity], [ExactCapacity], and \
         [PercentChangeInCapacity].\n"]
  min_adjustment_step : min_adjustment_step option;
      [@ocaml.doc "Available for backward compatibility. Use [MinAdjustmentMagnitude] instead.\n"]
  min_adjustment_magnitude : min_adjustment_magnitude option;
      [@ocaml.doc
        "The minimum value to scale by when the adjustment type is [PercentChangeInCapacity]. \n"]
  scaling_adjustment : policy_increment option;
      [@ocaml.doc
        "The amount by which to scale, based on the specified adjustment type. A positive value \
         adds to the current capacity while a negative number removes from the current capacity.\n"]
  cooldown : cooldown option;
      [@ocaml.doc "The duration of the policy's cooldown period, in seconds.\n"]
  step_adjustments : step_adjustments option;
      [@ocaml.doc
        "A set of adjustments that enable you to scale based on the size of the alarm breach.\n"]
  metric_aggregation_type : xml_string_max_len32 option;
      [@ocaml.doc
        "The aggregation type for the CloudWatch metrics. The valid values are [Minimum], \
         [Maximum], and [Average].\n"]
  estimated_instance_warmup : estimated_instance_warmup option;
      [@ocaml.doc
        "The estimated time, in seconds, until a newly launched instance can contribute to the \
         CloudWatch metrics.\n"]
  alarms : alarms option; [@ocaml.doc "The CloudWatch alarms related to the policy.\n"]
  target_tracking_configuration : target_tracking_configuration option;
      [@ocaml.doc "A target tracking scaling policy.\n"]
  enabled : scaling_policy_enabled option;
      [@ocaml.doc "Indicates whether the policy is enabled ([true]) or disabled ([false]).\n"]
  predictive_scaling_configuration : predictive_scaling_configuration option;
      [@ocaml.doc "A predictive scaling policy.\n"]
}
[@@ocaml.doc "Describes a scaling policy.\n"]

type nonrec scaling_policies = scaling_policy list [@@ocaml.doc ""]

type nonrec policies_type = {
  scaling_policies : scaling_policies option; [@ocaml.doc "The scaling policies.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_types = xml_string_max_len64 list [@@ocaml.doc ""]

type nonrec policy_names = resource_name list [@@ocaml.doc ""]

type nonrec describe_policies_type = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  policy_names : policy_names option;
      [@ocaml.doc
        "The names of one or more policies. If you omit this property, all policies are described. \
         If a group name is provided, the results are limited to that group. If you specify an \
         unknown policy name, it is ignored with no error.\n\n\
        \ Array Members: Maximum number of 50 items.\n\
        \ "]
  policy_types : policy_types option;
      [@ocaml.doc
        "One or more policy types. The valid values are [SimpleScaling], [StepScaling], \
         [TargetTrackingScaling], and [PredictiveScaling].\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to be returned with each call. The default value is [50] and \
         the maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec notification_configuration = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  topic_ar_n : xml_string_max_len255 option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon SNS topic.\n"]
  notification_type : xml_string_max_len255 option;
      [@ocaml.doc
        "One of the following event notification types:\n\n\
        \ {ul\n\
        \       {-   [autoscaling:EC2_INSTANCE_LAUNCH] \n\
        \           \n\
        \            }\n\
        \       {-   [autoscaling:EC2_INSTANCE_LAUNCH_ERROR] \n\
        \           \n\
        \            }\n\
        \       {-   [autoscaling:EC2_INSTANCE_TERMINATE] \n\
        \           \n\
        \            }\n\
        \       {-   [autoscaling:EC2_INSTANCE_TERMINATE_ERROR] \n\
        \           \n\
        \            }\n\
        \       {-   [autoscaling:TEST_NOTIFICATION] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Describes a notification.\n"]

type nonrec notification_configurations = notification_configuration list [@@ocaml.doc ""]

type nonrec describe_notification_configurations_answer = {
  notification_configurations : notification_configurations;
      [@ocaml.doc "The notification configurations.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_notification_configurations_type = {
  auto_scaling_group_names : auto_scaling_group_names option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [50] and the \
         maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec metric_granularity_type = {
  granularity : xml_string_max_len255 option;
      [@ocaml.doc "The granularity. The only valid value is [1Minute].\n"]
}
[@@ocaml.doc "Describes a granularity of a metric.\n"]

type nonrec metric_granularity_types = metric_granularity_type list [@@ocaml.doc ""]

type nonrec metric_collection_type = {
  metric : xml_string_max_len255 option;
      [@ocaml.doc
        "One of the following metrics:\n\n\
        \ {ul\n\
        \       {-   [GroupMinSize] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupMaxSize] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupDesiredCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupInServiceInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupPendingInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupStandbyInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTerminatingInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTotalInstances] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupInServiceCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupPendingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupStandbyCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTerminatingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupTotalCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolDesiredCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolWarmedCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolPendingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolTerminatingCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [WarmPoolTotalCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupAndWarmPoolDesiredCapacity] \n\
        \           \n\
        \            }\n\
        \       {-   [GroupAndWarmPoolTotalCapacity] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Describes a metric.\n"]

type nonrec metric_collection_types = metric_collection_type list [@@ocaml.doc ""]

type nonrec describe_metric_collection_types_answer = {
  metrics : metric_collection_types option; [@ocaml.doc "The metrics.\n"]
  granularities : metric_granularity_types option;
      [@ocaml.doc "The granularities for the metrics.\n"]
}
[@@ocaml.doc ""]

type nonrec load_balancer_target_group_state = {
  load_balancer_target_group_ar_n : xml_string_max_len511 option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target group.\n"]
  state : xml_string_max_len255 option;
      [@ocaml.doc
        "The state of the target group.\n\n\
        \ {ul\n\
        \       {-   [Adding] - The Auto Scaling instances are being registered with the target \
         group.\n\
        \           \n\
        \            }\n\
        \       {-   [Added] - All Auto Scaling instances are registered with the target group.\n\
        \           \n\
        \            }\n\
        \       {-   [InService] - At least one Auto Scaling instance passed an [ELB] health check.\n\
        \           \n\
        \            }\n\
        \       {-   [Removing] - The Auto Scaling instances are being deregistered from the \
         target group. If connection draining is enabled, Elastic Load Balancing waits for \
         in-flight requests to complete before deregistering the instances.\n\
        \           \n\
        \            }\n\
        \       {-   [Removed] - All Auto Scaling instances are deregistered from the target group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Describes the state of a target group.\n"]

type nonrec load_balancer_target_group_states = load_balancer_target_group_state list
[@@ocaml.doc ""]

type nonrec describe_load_balancer_target_groups_response = {
  load_balancer_target_groups : load_balancer_target_group_states option;
      [@ocaml.doc "Information about the target groups.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_load_balancer_target_groups_request = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [100] and the \
         maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec load_balancer_state = {
  load_balancer_name : xml_string_max_len255 option; [@ocaml.doc "The name of the load balancer.\n"]
  state : xml_string_max_len255 option;
      [@ocaml.doc
        "One of the following load balancer states:\n\n\
        \ {ul\n\
        \       {-   [Adding] - The Auto Scaling instances are being registered with the load \
         balancer.\n\
        \           \n\
        \            }\n\
        \       {-   [Added] - All Auto Scaling instances are registered with the load balancer.\n\
        \           \n\
        \            }\n\
        \       {-   [InService] - At least one Auto Scaling instance passed an [ELB] health check.\n\
        \           \n\
        \            }\n\
        \       {-   [Removing] - The Auto Scaling instances are being deregistered from the load \
         balancer. If connection draining is enabled, Elastic Load Balancing waits for in-flight \
         requests to complete before deregistering the instances.\n\
        \           \n\
        \            }\n\
        \       {-   [Removed] - All Auto Scaling instances are deregistered from the load balancer.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Describes the state of a Classic Load Balancer.\n"]

type nonrec load_balancer_states = load_balancer_state list [@@ocaml.doc ""]

type nonrec describe_load_balancers_response = {
  load_balancers : load_balancer_states option; [@ocaml.doc "The load balancers.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_load_balancers_request = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [100] and the \
         maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_lifecycle_hook_types_answer = {
  lifecycle_hook_types : auto_scaling_notification_types option;
      [@ocaml.doc "The lifecycle hook types.\n"]
}
[@@ocaml.doc ""]

type nonrec global_timeout = int [@@ocaml.doc ""]

type nonrec lifecycle_hook = {
  lifecycle_hook_name : ascii_string_max_len255 option;
      [@ocaml.doc "The name of the lifecycle hook.\n"]
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group for the lifecycle hook.\n"]
  lifecycle_transition : lifecycle_transition option;
      [@ocaml.doc
        "The lifecycle transition.\n\n\
        \ Valid values: [autoscaling:EC2_INSTANCE_LAUNCHING] | \
         [autoscaling:EC2_INSTANCE_TERMINATING] \n\
        \ "]
  notification_target_ar_n : notification_target_resource_name option;
      [@ocaml.doc
        "The ARN of the target that Amazon EC2 Auto Scaling sends notifications to when an \
         instance is in a wait state for the lifecycle hook.\n"]
  role_ar_n : xml_string_max_len255 option;
      [@ocaml.doc
        "The ARN of the IAM role that allows the Auto Scaling group to publish to the specified \
         notification target (an Amazon SNS topic or an Amazon SQS queue).\n"]
  notification_metadata : any_printable_ascii_string_max_len4000 option;
      [@ocaml.doc
        "Additional information that is included any time Amazon EC2 Auto Scaling sends a message \
         to the notification target.\n"]
  heartbeat_timeout : heartbeat_timeout option;
      [@ocaml.doc
        "The maximum time, in seconds, that can elapse before the lifecycle hook times out. If the \
         lifecycle hook times out, Amazon EC2 Auto Scaling performs the action that you specified \
         in the [DefaultResult] property.\n"]
  global_timeout : global_timeout option;
      [@ocaml.doc
        "The maximum time, in seconds, that an instance can remain in a wait state. The maximum is \
         172800 seconds (48 hours) or 100 times [HeartbeatTimeout], whichever is smaller.\n"]
  default_result : lifecycle_action_result option;
      [@ocaml.doc
        "The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an \
         unexpected failure occurs.\n\n\
        \ Valid values: [CONTINUE] | [ABANDON] \n\
        \ "]
}
[@@ocaml.doc
  "Describes a lifecycle hook. A lifecycle hook lets you create solutions that are aware of events \
   in the Auto Scaling instance lifecycle, and then perform a custom action on instances when the \
   corresponding lifecycle event occurs.\n"]

type nonrec lifecycle_hooks = lifecycle_hook list [@@ocaml.doc ""]

type nonrec describe_lifecycle_hooks_answer = {
  lifecycle_hooks : lifecycle_hooks option;
      [@ocaml.doc "The lifecycle hooks for the specified group.\n"]
}
[@@ocaml.doc ""]

type nonrec lifecycle_hook_names = ascii_string_max_len255 list [@@ocaml.doc ""]

type nonrec describe_lifecycle_hooks_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  lifecycle_hook_names : lifecycle_hook_names option;
      [@ocaml.doc
        "The names of one or more lifecycle hooks. If you omit this property, all lifecycle hooks \
         are described.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_metadata_endpoint_state = Disabled [@ocaml.doc ""] | Enabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_metadata_http_put_response_hop_limit = int [@@ocaml.doc ""]

type nonrec instance_metadata_http_tokens_state =
  | Optional [@ocaml.doc ""]
  | Required [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_metadata_options = {
  http_tokens : instance_metadata_http_tokens_state option;
      [@ocaml.doc
        "The state of token usage for your instance metadata requests. If the parameter is not \
         specified in the request, the default state is [optional].\n\n\
        \ If the state is [optional], you can choose to retrieve instance metadata with or without \
         a signed token header on your request. If you retrieve the IAM role credentials without a \
         token, the version 1.0 role credentials are returned. If you retrieve the IAM role \
         credentials using a valid signed token, the version 2.0 role credentials are returned.\n\
        \ \n\
        \  If the state is [required], you must send a signed token header with any instance \
         metadata retrieval requests. In this state, retrieving the IAM role credentials always \
         returns the version 2.0 credentials; the version 1.0 credentials are not available.\n\
        \  "]
  http_put_response_hop_limit : instance_metadata_http_put_response_hop_limit option;
      [@ocaml.doc
        "The desired HTTP PUT response hop limit for instance metadata requests. The larger the \
         number, the further instance metadata requests can travel.\n\n\
        \ Default: 1\n\
        \ "]
  http_endpoint : instance_metadata_endpoint_state option;
      [@ocaml.doc
        "This parameter enables or disables the HTTP metadata endpoint on your instances. If the \
         parameter is not specified, the default state is [enabled].\n\n\
        \  If you specify a value of [disabled], you will not be able to access your instance \
         metadata. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The metadata options for the instances. For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds}Configure \
   the instance metadata options} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]

type nonrec ebs_optimized = bool [@@ocaml.doc ""]

type nonrec spot_price = string [@@ocaml.doc ""]

type nonrec monitoring_enabled = bool [@@ocaml.doc ""]

type nonrec instance_monitoring = {
  enabled : monitoring_enabled option;
      [@ocaml.doc
        "If [true], detailed monitoring is enabled. Otherwise, basic monitoring is enabled.\n"]
}
[@@ocaml.doc "Describes whether detailed monitoring is enabled for the Auto Scaling instances.\n"]

type nonrec no_device = bool [@@ocaml.doc ""]

type nonrec block_device_ebs_throughput = int [@@ocaml.doc ""]

type nonrec block_device_ebs_encrypted = bool [@@ocaml.doc ""]

type nonrec block_device_ebs_iops = int [@@ocaml.doc ""]

type nonrec block_device_ebs_delete_on_termination = bool [@@ocaml.doc ""]

type nonrec block_device_ebs_volume_type = string [@@ocaml.doc ""]

type nonrec block_device_ebs_volume_size = int [@@ocaml.doc ""]

type nonrec ebs = {
  snapshot_id : xml_string_max_len255 option;
      [@ocaml.doc
        "The snapshot ID of the volume to use.\n\n\
        \ You must specify either a [VolumeSize] or a [SnapshotId].\n\
        \ "]
  volume_size : block_device_ebs_volume_size option;
      [@ocaml.doc
        "The volume size, in GiBs. The following are the supported volumes sizes for each volume \
         type: \n\n\
        \ {ul\n\
        \       {-   [gp2] and [gp3]: 1-16,384\n\
        \           \n\
        \            }\n\
        \       {-   [io1]: 4-16,384\n\
        \           \n\
        \            }\n\
        \       {-   [st1] and [sc1]: 125-16,384\n\
        \           \n\
        \            }\n\
        \       {-   [standard]: 1-1,024\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   You must specify either a [SnapshotId] or a [VolumeSize]. If you specify both \
         [SnapshotId] and [VolumeSize], the volume size must be equal or greater than the size of \
         the snapshot.\n\
        \   "]
  volume_type : block_device_ebs_volume_type option;
      [@ocaml.doc
        "The volume type. For more information, see \
         {{:https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volume-types.html}Amazon EBS \
         volume types} in the {i Amazon EBS User Guide}.\n\n\
        \ Valid values: [standard] | [io1] | [gp2] | [st1] | [sc1] | [gp3] \n\
        \ "]
  delete_on_termination : block_device_ebs_delete_on_termination option;
      [@ocaml.doc
        "Indicates whether the volume is deleted on instance termination. For Amazon EC2 Auto \
         Scaling, the default value is [true].\n"]
  iops : block_device_ebs_iops option;
      [@ocaml.doc
        "The number of input/output (I/O) operations per second (IOPS) to provision for the \
         volume. For [gp3] and [io1] volumes, this represents the number of IOPS that are \
         provisioned for the volume. For [gp2] volumes, this represents the baseline performance \
         of the volume and the rate at which the volume accumulates I/O credits for bursting. \n\n\
        \ The following are the supported values for each volume type: \n\
        \ \n\
        \  {ul\n\
        \        {-   [gp3]: 3,000-16,000 IOPS\n\
        \            \n\
        \             }\n\
        \        {-   [io1]: 100-64,000 IOPS\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For [io1] volumes, we guarantee 64,000 IOPS only for \
         {{:https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-nitro-instances.html}Instances \
         built on the Amazon Web Services Nitro System}. Other instance families guarantee \
         performance up to 32,000 IOPS. \n\
        \   \n\
        \     [Iops] is supported when the volume type is [gp3] or [io1] and required only when \
         the volume type is [io1]. (Not used with [standard], [gp2], [st1], or [sc1] volumes.) \n\
        \    "]
  encrypted : block_device_ebs_encrypted option;
      [@ocaml.doc
        "Specifies whether the volume should be encrypted. Encrypted EBS volumes can only be \
         attached to instances that support Amazon EBS encryption. For more information, see \
         {{:https://docs.aws.amazon.com/ebs/latest/userguide/ebs-encryption-requirements.html}Requirements \
         for Amazon EBS encryption} in the {i Amazon EBS User Guide}. If your AMI uses encrypted \
         volumes, you can also only launch it on supported instance types.\n\n\
        \  If you are creating a volume from a snapshot, you cannot create an unencrypted volume \
         from an encrypted snapshot. Also, you cannot specify a KMS key ID when using a launch \
         configuration.\n\
        \  \n\
        \   If you enable encryption by default, the EBS volumes that you create are always \
         encrypted, either using the Amazon Web Services managed KMS key or a customer-managed KMS \
         key, regardless of whether the snapshot was encrypted. \n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-data-protection.html#encryption}Use \
         Amazon Web Services KMS keys to encrypt Amazon EBS volumes} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n\
        \    \n\
        \     "]
  throughput : block_device_ebs_throughput option;
      [@ocaml.doc "The throughput (MiBps) to provision for a [gp3] volume.\n"]
}
[@@ocaml.doc
  "Describes information used to set up an Amazon EBS volume specified in a block device mapping.\n"]

type nonrec block_device_mapping = {
  virtual_name : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the instance store volume (virtual device) to attach to an instance at \
         launch. The name must be in the form ephemeral{i X} where {i X} is a number starting from \
         zero (0), for example, [ephemeral0].\n"]
  device_name : xml_string_max_len255;
      [@ocaml.doc
        "The device name assigned to the volume (for example, [/dev/sdh] or [xvdh]). For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html}Device naming \
         on Linux instances} in the {i Amazon EC2 User Guide}.\n\n\
        \  To define a block device mapping, set the device name and exactly one of the following \
         properties: [Ebs], [NoDevice], or [VirtualName].\n\
        \  \n\
        \   "]
  ebs : ebs option; [@ocaml.doc "Information to attach an EBS volume to an instance at launch.\n"]
  no_device : no_device option;
      [@ocaml.doc
        "Setting this value to [true] prevents a volume that is included in the block device \
         mapping of the AMI from being mapped to the specified device name at launch.\n\n\
        \ If [NoDevice] is [true] for the root device, instances might fail the EC2 health check. \
         In that case, Amazon EC2 Auto Scaling launches replacement instances.\n\
        \ "]
}
[@@ocaml.doc "Describes a block device mapping.\n"]

type nonrec block_device_mappings = block_device_mapping list [@@ocaml.doc ""]

type nonrec xml_string_user_data = string [@@ocaml.doc ""]

type nonrec classic_link_vpc_security_groups = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec security_groups = xml_string list [@@ocaml.doc ""]

type nonrec launch_configuration = {
  launch_configuration_name : xml_string_max_len255;
      [@ocaml.doc "The name of the launch configuration.\n"]
  launch_configuration_ar_n : resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the launch configuration.\n"]
  image_id : xml_string_max_len255;
      [@ocaml.doc
        "The ID of the Amazon Machine Image (AMI) to use to launch your EC2 instances. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html}Find a Linux \
         AMI} in the {i Amazon EC2 User Guide}.\n"]
  key_name : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the key pair.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html}Amazon EC2 key \
         pairs and Amazon EC2 instances} in the {i Amazon EC2 User Guide}.\n\
        \ "]
  security_groups : security_groups option;
      [@ocaml.doc
        "A list that contains the security groups to assign to the instances in the Auto Scaling \
         group. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html}Control \
         traffic to your Amazon Web Services resources using security groups} in the {i Amazon \
         Virtual Private Cloud User Guide}.\n"]
  classic_link_vpc_id : xml_string_max_len255 option;
      [@ocaml.doc "Available for backward compatibility.\n"]
  classic_link_vpc_security_groups : classic_link_vpc_security_groups option;
      [@ocaml.doc "Available for backward compatibility.\n"]
  user_data : xml_string_user_data option;
      [@ocaml.doc
        "The user data to make available to the launched EC2 instances. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html}Instance \
         metadata and user data} in the {i Amazon EC2 User Guide}. If you are using a command line \
         tool, base64-encoding is performed for you, and you can load the text from a file. \
         Otherwise, you must provide base64-encoded text. User data is limited to 16 KB.\n"]
  instance_type : xml_string_max_len255;
      [@ocaml.doc
        "The instance type for the instances. For information about available instance types, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes}Available \
         instance types} in the {i Amazon EC2 User Guide}.\n"]
  kernel_id : xml_string_max_len255 option;
      [@ocaml.doc "The ID of the kernel associated with the AMI.\n"]
  ramdisk_id : xml_string_max_len255 option;
      [@ocaml.doc "The ID of the RAM disk associated with the AMI.\n"]
  block_device_mappings : block_device_mappings option;
      [@ocaml.doc
        "The block device mapping entries that define the block devices to attach to the instances \
         at launch. By default, the block devices specified in the block device mapping for the \
         AMI are used. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html}Block \
         device mappings} in the {i Amazon EC2 User Guide}.\n"]
  instance_monitoring : instance_monitoring option;
      [@ocaml.doc
        "Controls whether instances in this group are launched with detailed ([true]) or basic \
         ([false]) monitoring.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html}Configure \
         monitoring for Auto Scaling instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ "]
  spot_price : spot_price option;
      [@ocaml.doc
        "The maximum hourly price to be paid for any Spot Instance launched to fulfill the \
         request. Spot Instances are launched when the price you specify exceeds the current Spot \
         price. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-template-spot-instances.html}Requesting \
         Spot Instances for fault-tolerant and flexible applications} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n"]
  iam_instance_profile : xml_string_max_len1600 option;
      [@ocaml.doc
        "The name or the Amazon Resource Name (ARN) of the instance profile associated with the \
         IAM role for the instance. The instance profile contains the IAM role. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html}IAM role for \
         applications that run on Amazon EC2 instances} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n"]
  created_time : timestamp_type;
      [@ocaml.doc "The creation date and time for the launch configuration.\n"]
  ebs_optimized : ebs_optimized option;
      [@ocaml.doc
        "Specifies whether the launch configuration is optimized for EBS I/O ([true]) or not \
         ([false]). For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html}Amazon \
         EBS-optimized instances} in the {i Amazon EC2 User Guide}.\n"]
  associate_public_ip_address : associate_public_ip_address option;
      [@ocaml.doc
        "Specifies whether to assign a public IPv4 address to the group's instances. If the \
         instance is launched into a default subnet, the default is to assign a public IPv4 \
         address, unless you disabled the option to assign a public IPv4 address on the subnet. If \
         the instance is launched into a nondefault subnet, the default is not to assign a public \
         IPv4 address, unless you enabled the option to assign a public IPv4 address on the \
         subnet. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html}Provide network \
         connectivity for your Auto Scaling instances using Amazon VPC} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n"]
  placement_tenancy : xml_string_max_len64 option;
      [@ocaml.doc
        "The tenancy of the instance, either [default] or [dedicated]. An instance with \
         [dedicated] tenancy runs on isolated, single-tenant hardware and can only be launched \
         into a VPC.\n"]
  metadata_options : instance_metadata_options option;
      [@ocaml.doc
        "The metadata options for the instances. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds}Configure \
         the instance metadata options} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
}
[@@ocaml.doc "Describes a launch configuration.\n"]

type nonrec launch_configurations = launch_configuration list [@@ocaml.doc ""]

type nonrec launch_configurations_type = {
  launch_configurations : launch_configurations; [@ocaml.doc "The launch configurations.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec launch_configuration_names = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec launch_configuration_names_type = {
  launch_configuration_names : launch_configuration_names option;
      [@ocaml.doc
        "The launch configuration names. If you omit this property, all launch configurations are \
         described.\n\n\
        \ Array Members: Maximum number of 50 items.\n\
        \ "]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [50] and the \
         maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec instances_to_update = int [@@ocaml.doc ""]

type nonrec instance_refresh_warm_pool_progress = {
  percentage_complete : int_percent option;
      [@ocaml.doc
        "The percentage of instances in the warm pool that have been replaced. For each instance \
         replacement, Amazon EC2 Auto Scaling tracks the instance's health status and warm-up \
         time. When the instance's health status changes to healthy and the specified warm-up time \
         passes, the instance is considered updated and is added to the percentage complete.\n"]
  instances_to_update : instances_to_update option;
      [@ocaml.doc "The number of instances remaining to update.\n"]
}
[@@ocaml.doc "Reports progress on replacing instances that are in the warm pool.\n"]

type nonrec instance_refresh_live_pool_progress = {
  percentage_complete : int_percent option;
      [@ocaml.doc
        "The percentage of instances in the Auto Scaling group that have been replaced. For each \
         instance replacement, Amazon EC2 Auto Scaling tracks the instance's health status and \
         warm-up time. When the instance's health status changes to healthy and the specified \
         warm-up time passes, the instance is considered updated and is added to the percentage \
         complete.\n"]
  instances_to_update : instances_to_update option;
      [@ocaml.doc "The number of instances remaining to update.\n"]
}
[@@ocaml.doc "Reports progress on replacing instances that are in the Auto Scaling group.\n"]

type nonrec instance_refresh_progress_details = {
  live_pool_progress : instance_refresh_live_pool_progress option;
      [@ocaml.doc "Reports progress on replacing instances that are in the Auto Scaling group.\n"]
  warm_pool_progress : instance_refresh_warm_pool_progress option;
      [@ocaml.doc "Reports progress on replacing instances that are in the warm pool.\n"]
}
[@@ocaml.doc
  "Reports progress on replacing instances in an Auto Scaling group that has a warm pool. This \
   includes separate details for instances in the warm pool and instances in the Auto Scaling \
   group (the live pool).\n"]

type nonrec rollback_details = {
  rollback_reason : xml_string_max_len1023 option;
      [@ocaml.doc
        "The reason for this instance refresh rollback (for example, whether a manual or automatic \
         rollback was initiated).\n"]
  rollback_start_time : timestamp_type option;
      [@ocaml.doc "The date and time at which the rollback began.\n"]
  percentage_complete_on_rollback : int_percent option;
      [@ocaml.doc "Indicates the value of [PercentageComplete] at the time the rollback started.\n"]
  instances_to_update_on_rollback : instances_to_update option;
      [@ocaml.doc "Indicates the value of [InstancesToUpdate] at the time the rollback started.\n"]
  progress_details_on_rollback : instance_refresh_progress_details option;
      [@ocaml.doc
        "Reports progress on replacing instances in an Auto Scaling group that has a warm pool. \
         This includes separate details for instances in the warm pool and instances in the Auto \
         Scaling group (the live pool).\n"]
}
[@@ocaml.doc "Details about an instance refresh rollback.\n"]

type nonrec instance_refresh_status =
  | Pending [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
  | Successful [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | Cancelling [@ocaml.doc ""]
  | Cancelled [@ocaml.doc ""]
  | RollbackInProgress [@ocaml.doc ""]
  | RollbackFailed [@ocaml.doc ""]
  | RollbackSuccessful [@ocaml.doc ""]
  | Baking [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_refresh = {
  instance_refresh_id : xml_string_max_len255 option; [@ocaml.doc "The instance refresh ID.\n"]
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  status : instance_refresh_status option;
      [@ocaml.doc
        "The current status for the instance refresh operation:\n\n\
        \ {ul\n\
        \       {-   [Pending] - The request was created, but the instance refresh has not started.\n\
        \           \n\
        \            }\n\
        \       {-   [InProgress] - An instance refresh is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [Successful] - An instance refresh completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [Failed] - An instance refresh failed to complete. You can troubleshoot using \
         the status reason and the scaling activities. \n\
        \           \n\
        \            }\n\
        \       {-   [Cancelling] - An ongoing instance refresh is being cancelled.\n\
        \           \n\
        \            }\n\
        \       {-   [Cancelled] - The instance refresh is cancelled. \n\
        \           \n\
        \            }\n\
        \       {-   [RollbackInProgress] - An instance refresh is being rolled back.\n\
        \           \n\
        \            }\n\
        \       {-   [RollbackFailed] - The rollback failed to complete. You can troubleshoot \
         using the status reason and the scaling activities.\n\
        \           \n\
        \            }\n\
        \       {-   [RollbackSuccessful] - The rollback completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [Baking] - Waiting the specified bake time after an instance refresh has \
         finished updating instances.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_reason : xml_string_max_len1023 option;
      [@ocaml.doc "The explanation for the specific status assigned to this operation.\n"]
  start_time : timestamp_type option;
      [@ocaml.doc "The date and time at which the instance refresh began.\n"]
  end_time : timestamp_type option;
      [@ocaml.doc "The date and time at which the instance refresh ended.\n"]
  percentage_complete : int_percent option;
      [@ocaml.doc
        "The percentage of the instance refresh that is complete. For each instance replacement, \
         Amazon EC2 Auto Scaling tracks the instance's health status and warm-up time. When the \
         instance's health status changes to healthy and the specified warm-up time passes, the \
         instance is considered updated and is added to the percentage complete.\n\n\
        \   [PercentageComplete] does not include instances that are replaced during a rollback. \
         This value gradually goes back down to zero during a rollback.\n\
        \  \n\
        \   "]
  instances_to_update : instances_to_update option;
      [@ocaml.doc
        "The number of instances remaining to update before the instance refresh is complete.\n\n\
        \  If you roll back the instance refresh, [InstancesToUpdate] shows you the number of \
         instances that were not yet updated by the instance refresh. Therefore, these instances \
         don't need to be replaced as part of the rollback.\n\
        \  \n\
        \   "]
  progress_details : instance_refresh_progress_details option;
      [@ocaml.doc "Additional progress details for an Auto Scaling group that has a warm pool.\n"]
  preferences : refresh_preferences option;
      [@ocaml.doc "The preferences for an instance refresh.\n"]
  desired_configuration : desired_configuration option;
      [@ocaml.doc "Describes the desired configuration for the instance refresh.\n"]
  rollback_details : rollback_details option; [@ocaml.doc "The rollback details.\n"]
  strategy : refresh_strategy option;
      [@ocaml.doc
        " The strategy to use for the instance refresh. This determines how instances in the Auto \
         Scaling group are updated. Default is Rolling. \n\n\
        \ {ul\n\
        \       {-   [Rolling] \226\128\147 Terminates instances and launches replacements in \
         batches\n\
        \           \n\
        \            }\n\
        \       {-   [ReplaceRootVolume] \226\128\147 Updates instances by replacing only the root \
         volume without terminating the instance\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Describes an instance refresh for an Auto Scaling group. \n"]

type nonrec instance_refreshes = instance_refresh list [@@ocaml.doc ""]

type nonrec describe_instance_refreshes_answer = {
  instance_refreshes : instance_refreshes option;
      [@ocaml.doc
        "The instance refreshes for the specified group, sorted by creation timestamp in \
         descending order.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "A string that indicates that the response contains more items than can be returned in a \
         single response. To receive additional items, specify this string for the [NextToken] \
         value when requesting the next set of items. This value is null when there are no more \
         items to return.\n"]
}
[@@ocaml.doc ""]

type nonrec instance_refresh_ids = xml_string_max_len255 list [@@ocaml.doc ""]

type nonrec describe_instance_refreshes_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  instance_refresh_ids : instance_refresh_ids option;
      [@ocaml.doc "One or more instance refresh IDs.\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [50] and the \
         maximum value is [100].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_auto_scaling_notification_types_answer = {
  auto_scaling_notification_types : auto_scaling_notification_types option;
      [@ocaml.doc "The notification types.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_auto_scaling_instances_type = {
  instance_ids : instance_ids option;
      [@ocaml.doc
        "The IDs of the instances. If you omit this property, all Auto Scaling instances are \
         described. If you specify an ID that does not exist, it is ignored with no error.\n\n\
        \ Array Members: Maximum number of 50 items.\n\
        \ "]
  max_records : max_records option;
      [@ocaml.doc
        "The maximum number of items to return with this call. The default value is [50] and the \
         maximum value is [50].\n"]
  next_token : xml_string option;
      [@ocaml.doc
        "The token for the next set of items to return. (You received this token from a previous \
         call.)\n"]
}
[@@ocaml.doc ""]

type nonrec describe_adjustment_types_answer = {
  adjustment_types : adjustment_types option; [@ocaml.doc "The policy adjustment types.\n"]
}
[@@ocaml.doc ""]

type nonrec number_of_launch_configurations = int [@@ocaml.doc ""]

type nonrec number_of_auto_scaling_groups = int [@@ocaml.doc ""]

type nonrec max_number_of_launch_configurations = int [@@ocaml.doc ""]

type nonrec max_number_of_auto_scaling_groups = int [@@ocaml.doc ""]

type nonrec describe_account_limits_answer = {
  max_number_of_auto_scaling_groups : max_number_of_auto_scaling_groups option;
      [@ocaml.doc
        "The maximum number of groups allowed for your account. The default is 200 groups per \
         Region.\n"]
  max_number_of_launch_configurations : max_number_of_launch_configurations option;
      [@ocaml.doc
        "The maximum number of launch configurations allowed for your account. The default is 200 \
         launch configurations per Region.\n"]
  number_of_auto_scaling_groups : number_of_auto_scaling_groups option;
      [@ocaml.doc "The current number of groups for your account.\n"]
  number_of_launch_configurations : number_of_launch_configurations option;
      [@ocaml.doc "The current number of launch configurations for your account.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_warm_pool_answer = unit [@@ocaml.doc ""]

type nonrec force_delete = bool [@@ocaml.doc ""]

type nonrec delete_warm_pool_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  force_delete : force_delete option;
      [@ocaml.doc
        "Specifies that the warm pool is to be deleted along with all of its associated instances, \
         without waiting for all instances to be terminated. This parameter also deletes any \
         outstanding lifecycle actions associated with the warm pool instances.\n"]
}
[@@ocaml.doc ""]

type nonrec tag = {
  resource_id : xml_string option; [@ocaml.doc "The name of the Auto Scaling group.\n"]
  resource_type : xml_string option;
      [@ocaml.doc "The type of resource. The only supported value is [auto-scaling-group].\n"]
  key : tag_key; [@ocaml.doc "The tag key.\n"]
  value : tag_value option; [@ocaml.doc "The tag value.\n"]
  propagate_at_launch : propagate_at_launch option;
      [@ocaml.doc
        "Determines whether the tag is added to new instances as they are launched in the group.\n"]
}
[@@ocaml.doc "Describes a tag for an Auto Scaling group.\n"]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec delete_tags_type = { tags : tags [@ocaml.doc "One or more tags.\n"] } [@@ocaml.doc ""]

type nonrec delete_scheduled_action_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  scheduled_action_name : xml_string_max_len255; [@ocaml.doc "The name of the action to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_policy_type = {
  auto_scaling_group_name : xml_string_max_len255 option;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  policy_name : resource_name; [@ocaml.doc "The name or Amazon Resource Name (ARN) of the policy.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_notification_configuration_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  topic_ar_n : xml_string_max_len255;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon SNS topic.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_lifecycle_hook_answer = unit [@@ocaml.doc ""]

type nonrec delete_lifecycle_hook_type = {
  lifecycle_hook_name : ascii_string_max_len255; [@ocaml.doc "The name of the lifecycle hook.\n"]
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
}
[@@ocaml.doc ""]

type nonrec launch_configuration_name_type = {
  launch_configuration_name : xml_string_max_len255;
      [@ocaml.doc "The name of the launch configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_auto_scaling_group_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  force_delete : force_delete option;
      [@ocaml.doc
        "Specifies that the group is to be deleted along with all instances associated with the \
         group, without waiting for all instances to be terminated. This action also deletes any \
         outstanding lifecycle actions associated with the group.\n"]
}
[@@ocaml.doc ""]

type nonrec create_or_update_tags_type = { tags : tags [@ocaml.doc "One or more tags.\n"] }
[@@ocaml.doc ""]

type nonrec create_launch_configuration_type = {
  launch_configuration_name : xml_string_max_len255;
      [@ocaml.doc
        "The name of the launch configuration. This name must be unique per Region per account.\n"]
  image_id : xml_string_max_len255 option;
      [@ocaml.doc
        "The ID of the Amazon Machine Image (AMI) that was assigned during registration. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html}Find a Linux \
         AMI} in the {i Amazon EC2 User Guide}.\n\n\
        \ If you specify [InstanceId], an [ImageId] is not required.\n\
        \ "]
  key_name : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the key pair. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html}Amazon EC2 key \
         pairs and Amazon EC2 instances} in the {i Amazon EC2 User Guide}.\n"]
  security_groups : security_groups option;
      [@ocaml.doc
        "A list that contains the security group IDs to assign to the instances in the Auto \
         Scaling group. For more information, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/vpc-security-groups.html}Control \
         traffic to your Amazon Web Services resources using security groups} in the {i Amazon \
         Virtual Private Cloud User Guide}.\n"]
  classic_link_vpc_id : xml_string_max_len255 option;
      [@ocaml.doc "Available for backward compatibility.\n"]
  classic_link_vpc_security_groups : classic_link_vpc_security_groups option;
      [@ocaml.doc "Available for backward compatibility.\n"]
  user_data : xml_string_user_data option;
      [@ocaml.doc
        "The user data to make available to the launched EC2 instances. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html}Instance \
         metadata and user data} (Linux) and \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-metadata.html}Instance \
         metadata and user data} (Windows). If you are using a command line tool, base64-encoding \
         is performed for you, and you can load the text from a file. Otherwise, you must provide \
         base64-encoded text. User data is limited to 16 KB.\n"]
  instance_id : xml_string_max_len19 option;
      [@ocaml.doc
        "The ID of the instance to use to create the launch configuration. The new launch \
         configuration derives attributes from the instance, except for the block device mapping.\n\n\
        \ To create a launch configuration with a block device mapping or override any other \
         instance attributes, specify them as part of the same request.\n\
        \ \n\
        \  For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html}Create \
         a launch configuration} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \  "]
  instance_type : xml_string_max_len255 option;
      [@ocaml.doc
        "Specifies the instance type of the EC2 instance. For information about available instance \
         types, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#AvailableInstanceTypes}Available \
         instance types} in the {i Amazon EC2 User Guide}.\n\n\
        \ If you specify [InstanceId], an [InstanceType] is not required.\n\
        \ "]
  kernel_id : xml_string_max_len255 option;
      [@ocaml.doc
        "The ID of the kernel associated with the AMI.\n\n\
        \  We recommend that you use PV-GRUB instead of kernels and RAM disks. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html}User \
         provided kernels} in the {i Amazon EC2 User Guide}.\n\
        \  \n\
        \   "]
  ramdisk_id : xml_string_max_len255 option;
      [@ocaml.doc
        "The ID of the RAM disk to select.\n\n\
        \  We recommend that you use PV-GRUB instead of kernels and RAM disks. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/UserProvidedKernels.html}User \
         provided kernels} in the {i Amazon EC2 User Guide}.\n\
        \  \n\
        \   "]
  block_device_mappings : block_device_mappings option;
      [@ocaml.doc
        "The block device mapping entries that define the block devices to attach to the instances \
         at launch. By default, the block devices specified in the block device mapping for the \
         AMI are used. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html}Block \
         device mappings} in the {i Amazon EC2 User Guide}.\n"]
  instance_monitoring : instance_monitoring option;
      [@ocaml.doc
        "Controls whether instances in this group are launched with detailed ([true]) or basic \
         ([false]) monitoring.\n\n\
        \ The default value is [true] (enabled).\n\
        \ \n\
        \   When detailed monitoring is enabled, Amazon CloudWatch generates metrics every minute \
         and your account is charged a fee. When you disable detailed monitoring, CloudWatch \
         generates metrics every 5 minutes. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/latest/userguide/enable-as-instance-metrics.html}Configure \
         monitoring for Auto Scaling instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \   \n\
        \    "]
  spot_price : spot_price option;
      [@ocaml.doc
        "The maximum hourly price to be paid for any Spot Instance launched to fulfill the \
         request. Spot Instances are launched when the price you specify exceeds the current Spot \
         price. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/launch-template-spot-instances.html}Request \
         Spot Instances for fault-tolerant and flexible applications} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n\n\
        \ Valid Range: Minimum value of 0.001\n\
        \ \n\
        \   When you change your maximum price by creating a new launch configuration, running \
         instances will continue to run as long as the maximum price for those running instances \
         is higher than the current Spot price.\n\
        \   \n\
        \    "]
  iam_instance_profile : xml_string_max_len1600 option;
      [@ocaml.doc
        "The name or the Amazon Resource Name (ARN) of the instance profile associated with the \
         IAM role for the instance. The instance profile contains the IAM role. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/us-iam-role.html}IAM role for \
         applications that run on Amazon EC2 instances} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n"]
  ebs_optimized : ebs_optimized option;
      [@ocaml.doc
        "Specifies whether the launch configuration is optimized for EBS I/O ([true]) or not \
         ([false]). The optimization provides dedicated throughput to Amazon EBS and an optimized \
         configuration stack to provide optimal I/O performance. This optimization is not \
         available with all instance types. Additional fees are incurred when you enable EBS \
         optimization for an instance type that is not EBS-optimized by default. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-optimized.html}Amazon \
         EBS-optimized instances} in the {i Amazon EC2 User Guide}.\n\n\
        \ The default value is [false].\n\
        \ "]
  associate_public_ip_address : associate_public_ip_address option;
      [@ocaml.doc
        "Specifies whether to assign a public IPv4 address to the group's instances. If the \
         instance is launched into a default subnet, the default is to assign a public IPv4 \
         address, unless you disabled the option to assign a public IPv4 address on the subnet. If \
         the instance is launched into a nondefault subnet, the default is not to assign a public \
         IPv4 address, unless you enabled the option to assign a public IPv4 address on the \
         subnet.\n\n\
        \ If you specify [true], each instance in the Auto Scaling group receives a unique public \
         IPv4 address. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-in-vpc.html}Provide network \
         connectivity for your Auto Scaling instances using Amazon VPC} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n\
        \ \n\
        \  If you specify this property, you must specify at least one subnet for \
         [VPCZoneIdentifier] when you create your group.\n\
        \  "]
  placement_tenancy : xml_string_max_len64 option;
      [@ocaml.doc
        "The tenancy of the instance, either [default] or [dedicated]. An instance with \
         [dedicated] tenancy runs on isolated, single-tenant hardware and can only be launched \
         into a VPC. To launch dedicated instances into a shared tenancy VPC (a VPC with the \
         instance placement tenancy attribute set to [default]), you must set the value of this \
         property to [dedicated].\n\n\
        \ If you specify [PlacementTenancy], you must specify at least one subnet for \
         [VPCZoneIdentifier] when you create your group.\n\
        \ \n\
        \  Valid values: [default] | [dedicated] \n\
        \  "]
  metadata_options : instance_metadata_options option;
      [@ocaml.doc
        "The metadata options for the instances. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-config.html#launch-configurations-imds}Configure \
         the instance metadata options} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec lifecycle_hook_specification = {
  lifecycle_hook_name : ascii_string_max_len255; [@ocaml.doc "The name of the lifecycle hook.\n"]
  lifecycle_transition : lifecycle_transition;
      [@ocaml.doc
        "The lifecycle transition. For Auto Scaling groups, there are two major lifecycle \
         transitions.\n\n\
        \ {ul\n\
        \       {-  To create a lifecycle hook for scale-out events, specify \
         [autoscaling:EC2_INSTANCE_LAUNCHING].\n\
        \           \n\
        \            }\n\
        \       {-  To create a lifecycle hook for scale-in events, specify \
         [autoscaling:EC2_INSTANCE_TERMINATING].\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  notification_metadata : any_printable_ascii_string_max_len4000 option;
      [@ocaml.doc
        "Additional information that you want to include any time Amazon EC2 Auto Scaling sends a \
         message to the notification target.\n"]
  heartbeat_timeout : heartbeat_timeout option;
      [@ocaml.doc
        "The maximum time, in seconds, that can elapse before the lifecycle hook times out. The \
         range is from [30] to [7200] seconds. The default value is [3600] seconds (1 hour).\n"]
  default_result : lifecycle_action_result option;
      [@ocaml.doc
        "The action the Auto Scaling group takes when the lifecycle hook timeout elapses or if an \
         unexpected failure occurs. The default value is [ABANDON].\n\n\
        \ Valid values: [CONTINUE] | [ABANDON] \n\
        \ "]
  notification_target_ar_n : notification_target_resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the notification target that Amazon EC2 Auto Scaling \
         sends notifications to when an instance is in a wait state for the lifecycle hook. You \
         can specify an Amazon SNS topic or an Amazon SQS queue.\n"]
  role_ar_n : xml_string_max_len255 option;
      [@ocaml.doc
        "The ARN of the IAM role that allows the Auto Scaling group to publish to the specified \
         notification target. For information about creating this role, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/prepare-for-lifecycle-notifications.html}Prepare \
         to add a lifecycle hook to your Auto Scaling group} in the {i Amazon EC2 Auto Scaling \
         User Guide}.\n\n\
        \ Valid only if the notification target is an Amazon SNS topic or an Amazon SQS queue.\n\
        \ "]
}
[@@ocaml.doc
  "Describes information used to specify a lifecycle hook for an Auto Scaling group.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/lifecycle-hooks.html}Amazon EC2 Auto \
   Scaling lifecycle hooks} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
  \ "]

type nonrec lifecycle_hook_specifications = lifecycle_hook_specification list [@@ocaml.doc ""]

type nonrec create_auto_scaling_group_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc
        "The name of the Auto Scaling group. This name must be unique per Region per account.\n\n\
        \ The name can contain any ASCII character 33 to 126 including most punctuation \
         characters, digits, and upper and lowercased letters.\n\
        \ \n\
        \   You cannot use a colon (:) in the name.\n\
        \   \n\
        \    "]
  launch_configuration_name : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the launch configuration to use to launch instances. \n\n\
        \ Conditional: You must specify either a launch template ([LaunchTemplate] or \
         [MixedInstancesPolicy]) or a launch configuration ([LaunchConfigurationName] or \
         [InstanceId]).\n\
        \ "]
  launch_template : launch_template_specification option;
      [@ocaml.doc
        "Information used to specify the launch template and version to use to launch instances. \n\n\
        \ Conditional: You must specify either a launch template ([LaunchTemplate] or \
         [MixedInstancesPolicy]) or a launch configuration ([LaunchConfigurationName] or \
         [InstanceId]).\n\
        \ \n\
        \   The launch template that is specified must be configured for use with an Auto Scaling \
         group. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html}Create \
         a launch template for an Auto Scaling group} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\
        \   \n\
        \    "]
  mixed_instances_policy : mixed_instances_policy option;
      [@ocaml.doc
        "The mixed instances policy. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-mixed-instances-groups.html}Auto \
         Scaling groups with multiple instance types and purchase options} in the {i Amazon EC2 \
         Auto Scaling User Guide}.\n"]
  instance_id : xml_string_max_len19 option;
      [@ocaml.doc
        "The ID of the instance used to base the launch configuration on. If specified, Amazon EC2 \
         Auto Scaling uses the configuration values from the specified instance to create a new \
         launch configuration. To get the instance ID, use the Amazon EC2 \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html}DescribeInstances} \
         API operation. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-asg-from-instance.html}Create \
         an Auto Scaling group using parameters from an existing instance} in the {i Amazon EC2 \
         Auto Scaling User Guide}.\n"]
  min_size : auto_scaling_group_min_size; [@ocaml.doc "The minimum size of the group.\n"]
  max_size : auto_scaling_group_max_size;
      [@ocaml.doc
        "The maximum size of the group.\n\n\
        \  With a mixed instances policy that uses instance weighting, Amazon EC2 Auto Scaling may \
         need to go above [MaxSize] to meet your capacity requirements. In this event, Amazon EC2 \
         Auto Scaling will never go above [MaxSize] by more than your largest instance weight \
         (weights that define how many units each instance contributes to the desired capacity of \
         the group).\n\
        \  \n\
        \   "]
  desired_capacity : auto_scaling_group_desired_capacity option;
      [@ocaml.doc
        "The desired capacity is the initial capacity of the Auto Scaling group at the time of its \
         creation and the capacity it attempts to maintain. It can scale beyond this capacity if \
         you configure auto scaling. This number must be greater than or equal to the minimum size \
         of the group and less than or equal to the maximum size of the group. If you do not \
         specify a desired capacity, the default is the minimum size of the group.\n"]
  default_cooldown : cooldown option;
      [@ocaml.doc
        " {i Only needed if you use simple scaling policies.} \n\n\
        \ The amount of time, in seconds, between one scaling activity ending and another one \
         starting due to simple scaling policies. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-scaling-cooldowns.html}Scaling \
         cooldowns for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User Guide}.\n\
        \ \n\
        \  Default: [300] seconds\n\
        \  "]
  availability_zones : availability_zones option;
      [@ocaml.doc
        "A list of Availability Zones where instances in the Auto Scaling group can be created. \
         Used for launching into the default VPC subnet in each Availability Zone when not using \
         the [VPCZoneIdentifier] property, or for attaching a network interface when an existing \
         network interface ID is specified in a launch template.\n"]
  availability_zone_ids : availability_zone_ids option;
      [@ocaml.doc
        " A list of Availability Zone IDs where the Auto Scaling group can launch instances. You \
         cannot specify both AvailabilityZones and AvailabilityZoneIds in the same request. \n"]
  load_balancer_names : load_balancer_names option;
      [@ocaml.doc
        "A list of Classic Load Balancers associated with this Auto Scaling group. For Application \
         Load Balancers, Network Load Balancers, and Gateway Load Balancers, specify the \
         [TargetGroupARNs] property instead.\n"]
  target_group_ar_ns : target_group_ar_ns option;
      [@ocaml.doc
        "The Amazon Resource Names (ARN) of the Elastic Load Balancing target groups to associate \
         with the Auto Scaling group. Instances are registered as targets with the target groups. \
         The target groups receive incoming traffic and route requests to one or more registered \
         targets. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-load-balancer.html}Use \
         Elastic Load Balancing to distribute traffic across the instances in your Auto Scaling \
         group} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  health_check_type : xml_string_max_len32 option;
      [@ocaml.doc
        "A comma-separated value string of one or more health check types.\n\n\
        \ The valid values are [EC2], [EBS], [ELB], and [VPC_LATTICE]. [EC2] is the default health \
         check and cannot be disabled. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-health-checks.html}Health \
         checks for instances in an Auto Scaling group} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\
        \ \n\
        \  Only specify [EC2] if you must clear a value that was previously set.\n\
        \  "]
  health_check_grace_period : health_check_grace_period option;
      [@ocaml.doc
        "The amount of time, in seconds, that Amazon EC2 Auto Scaling waits before checking the \
         health status of an EC2 instance that has come into service and marking it unhealthy due \
         to a failed health check. This is useful if your instances do not immediately pass their \
         health checks after they enter the [InService] state. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/health-check-grace-period.html}Set \
         the health check grace period for an Auto Scaling group} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n\n\
        \ Default: [0] seconds\n\
        \ "]
  placement_group : xml_string_max_len255 option;
      [@ocaml.doc
        "The name of the placement group into which to launch your instances. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html}Placement \
         groups} in the {i Amazon EC2 User Guide}.\n\n\
        \  A {i cluster} placement group is a logical grouping of instances within a single \
         Availability Zone. You cannot specify multiple Availability Zones and a cluster placement \
         group. \n\
        \  \n\
        \   "]
  vpc_zone_identifier : xml_string_max_len5000 option;
      [@ocaml.doc
        "A comma-separated list of subnet IDs for a virtual private cloud (VPC) where instances in \
         the Auto Scaling group can be created. If you specify [VPCZoneIdentifier] with \
         [AvailabilityZones], the subnets that you specify must reside in those Availability Zones.\n"]
  termination_policies : termination_policies option;
      [@ocaml.doc
        "A policy or a list of policies that are used to select the instance to terminate. These \
         policies are executed in the order that you list them. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-termination-policies.html}Configure \
         termination policies for Amazon EC2 Auto Scaling} in the {i Amazon EC2 Auto Scaling User \
         Guide}.\n\n\
        \ Valid values: [Default] | [AllocationStrategy] | [ClosestToNextInstanceHour] | \
         [NewestInstance] | [OldestInstance] | [OldestLaunchConfiguration] | \
         [OldestLaunchTemplate] | [arn:aws:lambda:region:account-id:function:my-function:my-alias] \n\
        \ "]
  new_instances_protected_from_scale_in : instance_protected option;
      [@ocaml.doc
        "Indicates whether newly launched instances are protected from termination by Amazon EC2 \
         Auto Scaling when scaling in. For more information about preventing instances from \
         terminating on scale in, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-protection.html}Use \
         instance scale-in protection} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  capacity_rebalance : capacity_rebalance_enabled option;
      [@ocaml.doc
        "Indicates whether Capacity Rebalancing is enabled. Otherwise, Capacity Rebalancing is \
         disabled. When you turn on Capacity Rebalancing, Amazon EC2 Auto Scaling attempts to \
         launch a Spot Instance whenever Amazon EC2 notifies that a Spot Instance is at an \
         elevated risk of interruption. After launching a new instance, it then terminates an old \
         instance. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-capacity-rebalancing.html}Use \
         Capacity Rebalancing to handle Amazon EC2 Spot Interruptions} in the in the {i Amazon EC2 \
         Auto Scaling User Guide}.\n"]
  lifecycle_hook_specification_list : lifecycle_hook_specifications option;
      [@ocaml.doc
        "One or more lifecycle hooks to add to the Auto Scaling group before instances are launched.\n"]
  deletion_protection : deletion_protection option;
      [@ocaml.doc
        " The deletion protection setting for the Auto Scaling group. This setting helps safeguard \
         your Auto Scaling group and its instances by controlling whether the \
         [DeleteAutoScalingGroup] operation is allowed. When deletion protection is enabled, users \
         cannot delete the Auto Scaling group according to the specified protection level until \
         the setting is changed back to a less restrictive level. \n\n\
        \  The valid values are [none], [prevent-force-deletion], and [prevent-all-deletion]. \n\
        \ \n\
        \   Default: [none] \n\
        \  \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/resource-deletion-protection.html} \
         Configure deletion protection for your Amazon EC2 Auto Scaling resources} in the {i \
         Amazon EC2 Auto Scaling User Guide}. \n\
        \   "]
  tags : tags option;
      [@ocaml.doc
        "One or more tags. You can tag your Auto Scaling group and propagate the tags to the \
         Amazon EC2 instances it launches. Tags are not propagated to Amazon EBS volumes. To add \
         tags to Amazon EBS volumes, specify the tags in a launch template but use caution. If the \
         launch template specifies an instance tag with a key that is also specified for the Auto \
         Scaling group, Amazon EC2 Auto Scaling overrides the value of that instance tag with the \
         value specified by the Auto Scaling group. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-tagging.html}Tag \
         Auto Scaling groups and instances} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  service_linked_role_ar_n : resource_name option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the service-linked role that the Auto Scaling group \
         uses to call other Amazon Web Services service on your behalf. By default, Amazon EC2 \
         Auto Scaling uses a service-linked role named [AWSServiceRoleForAutoScaling], which it \
         creates if it does not exist. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/autoscaling-service-linked-role.html}Service-linked \
         roles} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  max_instance_lifetime : max_instance_lifetime option;
      [@ocaml.doc
        "The maximum amount of time, in seconds, that an instance can be in service. The default \
         is null. If specified, the value must be either 0 or a number equal to or greater than \
         86,400 seconds (1 day). For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-max-instance-lifetime.html}Replace \
         Auto Scaling instances based on maximum instance lifetime} in the {i Amazon EC2 Auto \
         Scaling User Guide}.\n"]
  context : context option; [@ocaml.doc "Reserved.\n"]
  desired_capacity_type : xml_string_max_len255 option;
      [@ocaml.doc
        "The unit of measurement for the value specified for desired capacity. Amazon EC2 Auto \
         Scaling supports [DesiredCapacityType] for attribute-based instance type selection only. \
         For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-mixed-instances-group-attribute-based-instance-type-selection.html}Create \
         a mixed instances group using attribute-based instance type selection} in the {i Amazon \
         EC2 Auto Scaling User Guide}.\n\n\
        \ By default, Amazon EC2 Auto Scaling specifies [units], which translates into number of \
         instances.\n\
        \ \n\
        \  Valid values: [units] | [vcpu] | [memory-mib] \n\
        \  "]
  default_instance_warmup : default_instance_warmup option;
      [@ocaml.doc
        "The amount of time, in seconds, until a new instance is considered to have finished \
         initializing and resource consumption to become stable after it enters the [InService] \
         state. \n\n\
        \ During an instance refresh, Amazon EC2 Auto Scaling waits for the warm-up period after \
         it replaces an instance before it moves on to replacing the next instance. Amazon EC2 \
         Auto Scaling also waits for the warm-up period before aggregating the metrics for new \
         instances with existing instances in the Amazon CloudWatch metrics that are used for \
         scaling, resulting in more reliable usage data. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-default-instance-warmup.html}Set \
         the default instance warmup for an Auto Scaling group} in the {i Amazon EC2 Auto Scaling \
         User Guide}.\n\
        \ \n\
        \   To manage various warm-up settings at the group level, we recommend that you set the \
         default instance warmup, {i even if it is set to 0 seconds}. To remove a value that you \
         previously set, include the property but specify [-1] for the value. However, we strongly \
         recommend keeping the default instance warmup enabled by specifying a value of [0] or \
         other nominal value.\n\
        \   \n\
        \     Default: None \n\
        \     "]
  traffic_sources : traffic_sources option;
      [@ocaml.doc
        "The list of traffic sources to attach to this Auto Scaling group. You can use any of the \
         following as traffic sources for an Auto Scaling group: Classic Load Balancer, \
         Application Load Balancer, Gateway Load Balancer, Network Load Balancer, and VPC Lattice.\n"]
  instance_maintenance_policy : instance_maintenance_policy option;
      [@ocaml.doc
        "An instance maintenance policy. For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-instance-maintenance-policy.html}Set \
         instance maintenance policy} in the {i Amazon EC2 Auto Scaling User Guide}.\n"]
  availability_zone_distribution : availability_zone_distribution option;
      [@ocaml.doc "The instance capacity distribution across Availability Zones.\n"]
  availability_zone_impairment_policy : availability_zone_impairment_policy option;
      [@ocaml.doc " The policy for Availability Zone impairment. \n"]
  skip_zonal_shift_validation : skip_zonal_shift_validation option;
      [@ocaml.doc
        " If you enable zonal shift with cross-zone disabled load balancers, capacity could become \
         imbalanced across Availability Zones. To skip the validation, specify [true]. For more \
         information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/ec2-auto-scaling-zonal-shift.html}Auto \
         Scaling group zonal shift} in the {i Amazon EC2 Auto Scaling User Guide}. \n"]
  capacity_reservation_specification : capacity_reservation_specification option;
      [@ocaml.doc " The capacity reservation specification for the Auto Scaling group. \n"]
  instance_lifecycle_policy : instance_lifecycle_policy option;
      [@ocaml.doc
        " The instance lifecycle policy for the Auto Scaling group. This policy controls instance \
         behavior when an instance transitions through its lifecycle states. Configure retention \
         triggers to specify when instances should move to a [Retained] state instead of automatic \
         termination. \n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/instance-lifecycle-policy.html} \
         Control instance retention with instance lifecycle policies} in the {i Amazon EC2 Auto \
         Scaling User Guide}. \n\
        \ \n\
        \   Instances in a Retained state will continue to incur standard EC2 charges until \
         terminated.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec complete_lifecycle_action_answer = unit [@@ocaml.doc ""]

type nonrec complete_lifecycle_action_type = {
  lifecycle_hook_name : ascii_string_max_len255; [@ocaml.doc "The name of the lifecycle hook.\n"]
  auto_scaling_group_name : resource_name; [@ocaml.doc "The name of the Auto Scaling group.\n"]
  lifecycle_action_token : lifecycle_action_token option;
      [@ocaml.doc
        "A universally unique identifier (UUID) that identifies a specific lifecycle action \
         associated with an instance. Amazon EC2 Auto Scaling sends this token to the notification \
         target you specified when you created the lifecycle hook.\n"]
  lifecycle_action_result : lifecycle_action_result;
      [@ocaml.doc
        "The action for the group to take. You can specify either [CONTINUE] or [ABANDON].\n"]
  instance_id : xml_string_max_len19 option; [@ocaml.doc "The ID of the instance.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_instance_refresh_answer = {
  instance_refresh_id : xml_string_max_len255 option;
      [@ocaml.doc
        "The instance refresh ID associated with the request. This is the unique ID assigned to \
         the instance refresh when it was started.\n"]
}
[@@ocaml.doc ""]

type nonrec boolean_type = bool [@@ocaml.doc ""]

type nonrec cancel_instance_refresh_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  wait_for_transitioning_instances : boolean_type option;
      [@ocaml.doc
        "When cancelling an instance refresh, this indicates whether to wait for in-flight \
         launches and terminations to complete. The default is true.\n\n\
        \ When set to false, Amazon EC2 Auto Scaling cancels the instance refresh without waiting \
         for any pending launches or terminations to complete.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec failed_scheduled_update_group_action_request = {
  scheduled_action_name : xml_string_max_len255; [@ocaml.doc "The name of the scheduled action.\n"]
  error_code : xml_string_max_len64 option; [@ocaml.doc "The error code.\n"]
  error_message : xml_string option; [@ocaml.doc "The error message accompanying the error code.\n"]
}
[@@ocaml.doc "Describes a scheduled action that could not be created, updated, or deleted.\n"]

type nonrec failed_scheduled_update_group_action_requests =
  failed_scheduled_update_group_action_request list
[@@ocaml.doc ""]

type nonrec batch_put_scheduled_update_group_action_answer = {
  failed_scheduled_update_group_actions : failed_scheduled_update_group_action_requests option;
      [@ocaml.doc
        "The names of the scheduled actions that could not be created or updated, including an \
         error message.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_update_group_action_request = {
  scheduled_action_name : xml_string_max_len255; [@ocaml.doc "The name of the scaling action.\n"]
  start_time : timestamp_type option;
      [@ocaml.doc
        "The date and time for the action to start, in YYYY-MM-DDThh:mm:ssZ format in UTC/GMT only \
         and in quotes (for example, [\"2019-06-01T00:00:00Z\"]).\n\n\
        \ If you specify [Recurrence] and [StartTime], Amazon EC2 Auto Scaling performs the action \
         at this time, and then performs the action based on the specified recurrence.\n\
        \ \n\
        \  If you try to schedule the action in the past, Amazon EC2 Auto Scaling returns an error \
         message.\n\
        \  "]
  end_time : timestamp_type option;
      [@ocaml.doc "The date and time for the recurring schedule to end, in UTC.\n"]
  recurrence : xml_string_max_len255 option;
      [@ocaml.doc
        "The recurring schedule for the action, in Unix cron syntax format. This format consists \
         of five fields separated by white spaces: \\[Minute\\] \\[Hour\\] \\[Day_of_Month\\] \
         \\[Month_of_Year\\] \\[Day_of_Week\\]. The value must be in quotes (for example, [\"30 0 1\n\
        \                1,6,12 *\"]). For more information about this format, see \
         {{:http://crontab.org}Crontab}.\n\n\
        \ When [StartTime] and [EndTime] are specified with [Recurrence], they form the boundaries \
         of when the recurring action starts and stops.\n\
        \ \n\
        \  Cron expressions use Universal Coordinated Time (UTC) by default.\n\
        \  "]
  min_size : auto_scaling_group_min_size option;
      [@ocaml.doc "The minimum size of the Auto Scaling group.\n"]
  max_size : auto_scaling_group_max_size option;
      [@ocaml.doc "The maximum size of the Auto Scaling group.\n"]
  desired_capacity : auto_scaling_group_desired_capacity option;
      [@ocaml.doc
        "The desired capacity is the initial capacity of the Auto Scaling group after the \
         scheduled action runs and the capacity it attempts to maintain.\n"]
  time_zone : xml_string_max_len255 option;
      [@ocaml.doc
        "Specifies the time zone for a cron expression. If a time zone is not provided, UTC is \
         used by default. \n\n\
        \ Valid values are the canonical names of the IANA time zones, derived from the IANA Time \
         Zone Database (such as [Etc/GMT+9] or [Pacific/Tahiti]). For more information, see \
         {{:https://en.wikipedia.org/wiki/List_of_tz_database_time_zones}https://en.wikipedia.org/wiki/List_of_tz_database_time_zones}.\n\
        \ "]
}
[@@ocaml.doc
  "Describes information used for one or more scheduled scaling action updates in a \
   {{:https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_BatchPutScheduledUpdateGroupAction.html}BatchPutScheduledUpdateGroupAction} \
   operation.\n"]

type nonrec scheduled_update_group_action_requests = scheduled_update_group_action_request list
[@@ocaml.doc ""]

type nonrec batch_put_scheduled_update_group_action_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  scheduled_update_group_actions : scheduled_update_group_action_requests;
      [@ocaml.doc "One or more scheduled actions. The maximum number allowed is 50.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_scheduled_action_answer = {
  failed_scheduled_actions : failed_scheduled_update_group_action_requests option;
      [@ocaml.doc
        "The names of the scheduled actions that could not be deleted, including an error message.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_scheduled_action_type = {
  auto_scaling_group_name : xml_string_max_len255;
      [@ocaml.doc "The name of the Auto Scaling group.\n"]
  scheduled_action_names : scheduled_action_names;
      [@ocaml.doc
        "The names of the scheduled actions to delete. The maximum number allowed is 50. \n"]
}
[@@ocaml.doc ""]
