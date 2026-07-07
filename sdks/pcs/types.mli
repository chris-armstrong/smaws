type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The message body of the exception.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name of the exception.\n"]
}
[@@ocaml.doc "Stores information about a field in a request that caused an exception.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  field_list : validation_exception_field_list option;
      [@ocaml.doc " A list of fields or properties that failed validation. \n"]
  reason : validation_exception_reason;
      [@ocaml.doc " The specific reason or cause of the validation error. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request isn't valid.\n\n\
  \  Examples \n\
  \ \n\
  \  {ul\n\
  \        {-  Your request contains malformed JSON or unsupported characters.\n\
  \            \n\
  \             }\n\
  \        {-  The scheduler version isn't supported.\n\
  \            \n\
  \             }\n\
  \        {-  There are networking related errors, such as network validation failure.\n\
  \            \n\
  \             }\n\
  \        {-  AMI type is [CUSTOM] and the launch template doesn't define the AMI ID, or the AMI \
   type is AL2 and the launch template defines the AMI.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec slurm_rest_mode = NONE [@ocaml.doc ""] | STANDARD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_slurm_rest_request = {
  mode : slurm_rest_mode option;
      [@ocaml.doc
        "The default value for [mode] is [NONE]. A value of [STANDARD] means the Slurm REST API is \
         enabled.\n"]
}
[@@ocaml.doc
  "The Slurm REST API configuration includes settings for enabling and configuring the Slurm REST \
   API.\n"]

type nonrec update_scheduler_request = {
  version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Slurm version to upgrade the cluster to. You can only upgrade to a newer version. For \
         more information about supported versions and upgrade paths, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/working-with_clusters_upgrade.html}Upgrading \
         the Slurm version on a cluster} in the {i PCS User Guide}.\n\n\
        \ Valid Values: [24.05 | 24.11 | 25.05 | 25.11] \n\
        \ "]
}
[@@ocaml.doc
  "The scheduler configuration for updating a cluster. Use this to specify the Slurm version to \
   upgrade to.\n"]

type nonrec slurm_custom_setting = {
  parameter_value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The values for the configured Slurm settings.\n"]
  parameter_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "PCS supports custom Slurm settings for clusters, compute node groups, and queues. For \
         more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-custom-settings.html}Configuring \
         custom Slurm settings in PCS} in the {i PCS User Guide}.\n"]
}
[@@ocaml.doc
  "Additional settings that directly map to Slurm settings.\n\n\
  \  PCS supports a subset of Slurm settings. For more information, see \
   {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-custom-settings.html}Configuring \
   custom Slurm settings in PCS} in the {i PCS User Guide}.\n\
  \  \n\
  \   "]

type nonrec slurm_custom_settings = slurm_custom_setting list [@@ocaml.doc ""]

type nonrec update_queue_slurm_configuration_request = {
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec queue_name = string [@@ocaml.doc ""]

type nonrec queue_status =
  | RESUMING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | SUSPENDING [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec compute_node_group_configuration = {
  compute_node_group_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The compute node group ID for the compute node group configuration.\n"]
}
[@@ocaml.doc "The compute node group configuration for a queue.\n"]

type nonrec compute_node_group_configuration_list = compute_node_group_configuration list
[@@ocaml.doc ""]

type nonrec queue_slurm_configuration = {
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec error_info = {
  message : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The detailed error information.\n"]
  code : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "The short-form error code.\n"]
}
[@@ocaml.doc "An error that occurred during resource creation.\n"]

type nonrec error_info_list = error_info list [@@ocaml.doc ""]

type nonrec queue = {
  error_info : error_info_list option;
      [@ocaml.doc "The list of errors that occurred during queue provisioning.\n"]
  slurm_configuration : queue_slurm_configuration option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  compute_node_group_configurations : compute_node_group_configuration_list;
      [@ocaml.doc
        "The list of compute node group configurations associated with the queue. Queues assign \
         jobs to associated compute node groups.\n"]
  status : queue_status;
      [@ocaml.doc
        "The provisioning status of the queue.\n\n\
        \  The provisioning status doesn't indicate the overall health of the queue.\n\
        \  \n\
        \     The resource enters the [SUSPENDING] and [SUSPENDED] states when the scheduler is \
         beyond end of life and we have suspended the cluster. When in these states, you can't use \
         the cluster. The cluster controller is down and all compute instances are terminated. The \
         resources still count toward your service quotas. You can delete a resource if its status \
         is [SUSPENDED]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html}Frequently \
         asked questions about Slurm versions in PCS} in the {i PCS User Guide}.\n\
        \     \n\
        \      "]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was modified.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was created.\n"]
  cluster_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the cluster of the queue.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the queue.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The generated unique ID of the queue.\n"]
  name : queue_name; [@ocaml.doc "The name that identifies the queue.\n"]
}
[@@ocaml.doc "A queue resource.\n"]

type nonrec update_queue_response = { queue : queue option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec cluster_identifier = string [@@ocaml.doc ""]

type nonrec queue_identifier = string [@@ocaml.doc ""]

type nonrec sb_client_token = string [@@ocaml.doc ""]

type nonrec update_queue_request = {
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  slurm_configuration : update_queue_slurm_configuration_request option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  compute_node_group_configurations : compute_node_group_configuration_list option;
      [@ocaml.doc
        "The list of compute node group configurations to associate with the queue. Queues assign \
         jobs to associated compute node groups.\n"]
  queue_identifier : queue_identifier; [@ocaml.doc "The name or ID of the queue.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster of the queue.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc " The number of seconds to wait before retrying the request. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Your request exceeded a request rate quota. Check the resource's request rate quota and try \
   again.\n"]

type nonrec service_quota_exceeded_exception = {
  quota_code : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The {b quota code} of the service quota that was exceeded. \n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The type or category of the resource that caused the quota to be exceeded. \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The unique identifier of the resource that caused the quota to be exceeded. \n"]
  service_code : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The service code associated with the quota that was exceeded. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You exceeded your service quota. Service quotas, also referred to as limits, are the maximum \
   number of service resources or operations for your Amazon Web Services account. To learn how to \
   increase your service quota, see \
   {{:https://docs.aws.amazon.com/servicequotas/latest/userguide/request-quota-increase.html}Requesting \
   a quota increase} in the {i Service Quotas User Guide} \n\n\
  \  Examples \n\
  \ \n\
  \  {ul\n\
  \        {-  The max number of clusters or queues has been reached for the account.\n\
  \            \n\
  \             }\n\
  \        {-  The max number of compute node groups has been reached for the associated cluster.\n\
  \            \n\
  \             }\n\
  \        {-  The total of [maxInstances] across all compute node groups has been reached for \
   associated cluster.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec resource_not_found_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The type or category of the resource that was not found. \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The unique identifier of the resource that was not found. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested resource can't be found. The cluster, node group, or queue you're attempting to \
   get, update, list, or delete doesn't exist.\n\n\
  \  Examples \n\
  \ "]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc "PCS can't process your request right now. Try again later.\n"]

type nonrec conflict_exception = {
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The type or category of the resource that caused the conflict exception.\" \n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " The unique identifier of the resource that caused the conflict exception. \n"]
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Your request has conflicting operations. This can occur if you're trying to perform more than 1 \
   operation on the same resource at the same time.\n\n\
  \  Examples \n\
  \ \n\
  \  {ul\n\
  \        {-  A cluster with the same name already exists.\n\
  \            \n\
  \             }\n\
  \        {-  A cluster isn't in [ACTIVE] status.\n\
  \            \n\
  \             }\n\
  \        {-  A cluster to delete is in an unstable state. For example, because it still has \
   [ACTIVE] node groups or queues.\n\
  \            \n\
  \             }\n\
  \        {-  A queue already exists in a cluster.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec access_denied_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You don't have permission to perform the action.\n\n\
  \  Examples \n\
  \ \n\
  \  {ul\n\
  \        {-  The launch template instance profile doesn't pass [iam:PassRole] verification.\n\
  \            \n\
  \             }\n\
  \        {-  There is a mismatch between the account ID and cluster ID.\n\
  \            \n\
  \             }\n\
  \        {-  The cluster ID doesn't exist.\n\
  \            \n\
  \             }\n\
  \        {-  The EC2 instance isn't present.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec update_compute_node_group_slurm_configuration_request = {
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
  scale_down_idle_time_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time (in seconds) before an idle node is scaled down. If not specified, the \
         cluster-level setting applies. This overrides the cluster-level \
         [scaleDownIdleTimeInSeconds] setting. A value of [-1] removes the override and applies \
         the cluster-level setting to this compute node group. Requires Slurm version 25.11 or \
         later.\n"]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec compute_node_group_name = string [@@ocaml.doc ""]

type nonrec compute_node_group_status =
  | RESUMING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | SUSPENDING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ami_id = string [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnet_id_list = subnet_id list [@@ocaml.doc ""]

type nonrec purchase_option =
  | INTERRUPTIBLE_CAPACITY_RESERVATION [@ocaml.doc ""]
  | CAPACITY_BLOCK [@ocaml.doc ""]
  | SPOT [@ocaml.doc ""]
  | ONDEMAND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec custom_launch_template = {
  version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The version of the EC2 launch template to use to provision instances.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The ID of the EC2 launch template to use to provision instances.\n\n\
        \  Example: [lt-xxxx] \n\
        \ "]
}
[@@ocaml.doc "An Amazon EC2 launch template PCS uses to launch compute nodes.\n"]

type nonrec instance_profile_arn = string [@@ocaml.doc ""]

type nonrec scaling_configuration = {
  max_instance_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The upper bound of the number of instances allowed in the compute fleet.\n"]
  min_instance_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The lower bound of the number of instances allowed in the compute fleet.\n"]
}
[@@ocaml.doc "Specifies the boundaries of the compute node group auto scaling.\n"]

type nonrec instance_config = {
  instance_type : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The EC2 instance type that PCS can provision in the compute node group.\n\n\
        \  Example: [t2.xlarge] \n\
        \ "]
}
[@@ocaml.doc "An EC2 instance configuration PCS uses to launch compute nodes.\n"]

type nonrec instance_list = instance_config list [@@ocaml.doc ""]

type nonrec spot_allocation_strategy =
  | PRICE_CAPACITY_OPTIMIZED [@ocaml.doc ""]
  | CAPACITY_OPTIMIZED [@ocaml.doc ""]
  | LOWEST_PRICE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec spot_options = {
  allocation_strategy : spot_allocation_strategy option;
      [@ocaml.doc
        "The Amazon EC2 allocation strategy PCS uses to provision EC2 instances. PCS supports {b \
         lowest price}, {b capacity optimized}, and {b price capacity optimized}. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet-allocation-strategy.html}Use \
         allocation strategies to determine how EC2 Fleet or Spot Fleet fulfills Spot and \
         On-Demand capacity} in the {i Amazon Elastic Compute Cloud User Guide}. If you don't \
         provide this option, it defaults to {b price capacity optimized}.\n"]
}
[@@ocaml.doc
  "Additional configuration when you specify [SPOT] as the [purchaseOption] for the \
   [CreateComputeNodeGroup] API action.\n"]

type nonrec compute_node_group_slurm_configuration = {
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
  scale_down_idle_time_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time (in seconds) before an idle node is scaled down. If not specified, the \
         cluster-level setting applies. This overrides the cluster-level \
         [scaleDownIdleTimeInSeconds] setting. A value of [-1] removes the override and applies \
         the cluster-level setting to this compute node group. Requires Slurm version 25.11 or \
         later.\n"]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec compute_node_group = {
  error_info : error_info_list option;
      [@ocaml.doc "The list of errors that occurred during compute node group provisioning.\n"]
  slurm_configuration : compute_node_group_slurm_configuration option; [@ocaml.doc ""]
  spot_options : spot_options option; [@ocaml.doc ""]
  instance_configs : instance_list;
      [@ocaml.doc
        "A list of EC2 instance configurations that PCS can provision in the compute node group.\n"]
  scaling_configuration : scaling_configuration; [@ocaml.doc ""]
  iam_instance_profile_arn : instance_profile_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM instance profile used to pass an IAM role when \
         launching EC2 instances. The role contained in your instance profile must have the \
         [pcs:RegisterComputeNodeGroupInstance] permission and the role name must start with \
         [AWSPCS] or must have the path [/aws-pcs/]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/security-instance-profiles.html}IAM \
         instance profiles for PCS} in the {i PCS User Guide}.\n"]
  custom_launch_template : custom_launch_template; [@ocaml.doc ""]
  purchase_option : purchase_option option;
      [@ocaml.doc
        "Specifies how EC2 instances are purchased on your behalf. PCS supports On-Demand \
         Instances, Spot Instances, Interruptible Capacity Reservations, On-Demand Capacity \
         Reservations, and Amazon EC2 Capacity Blocks for ML. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html}Amazon \
         EC2 billing and purchasing options} in the {i Amazon Elastic Compute Cloud User Guide}. \
         For more information about PCS support for Capacity Blocks, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-blocks.html}Using Amazon EC2 \
         Capacity Blocks for ML with PCS} in the {i PCS User Guide}. For more information about \
         PCS support for interruptible capacity reservations, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-iodcr.html}Using \
         I-ODCRs with PCS} in the {i PCS User Guide}. Choose On-Demand if you plan to use an \
         On-Demand Capacity Reservation (ODCR). For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-odcr.html}Using \
         ODCRs with PCS}. If you don't provide this option, it defaults to On-Demand.\n"]
  subnet_ids : subnet_id_list;
      [@ocaml.doc
        "The list of subnet IDs where instances are provisioned by the compute node group. The \
         subnets must be in the same VPC as the cluster.\n"]
  ami_id : ami_id option;
      [@ocaml.doc
        "The ID of the Amazon Machine Image (AMI) that PCS uses to launch instances. If not \
         provided, PCS uses the AMI ID specified in the custom launch template.\n"]
  status : compute_node_group_status;
      [@ocaml.doc
        "The provisioning status of the compute node group.\n\n\
        \  The provisioning status doesn't indicate the overall health of the compute node group.\n\
        \  \n\
        \     The resource enters the [SUSPENDING] and [SUSPENDED] states when the scheduler is \
         beyond end of life and we have suspended the cluster. When in these states, you can't use \
         the cluster. The cluster controller is down and all compute instances are terminated. The \
         resources still count toward your service quotas. You can delete a resource if its status \
         is [SUSPENDED]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html}Frequently \
         asked questions about Slurm versions in PCS} in the {i PCS User Guide}.\n\
        \     \n\
        \      "]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was modified.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was created.\n"]
  cluster_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the cluster of the compute node group.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the compute node group.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The generated unique ID of the compute node group.\n"]
  name : compute_node_group_name; [@ocaml.doc "The name that identifies the compute node group.\n"]
}
[@@ocaml.doc "A compute node group associated with a cluster.\n"]

type nonrec update_compute_node_group_response = {
  compute_node_group : compute_node_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec compute_node_group_identifier = string [@@ocaml.doc ""]

type nonrec string_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec scaling_configuration_request = {
  max_instance_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The upper bound of the number of instances allowed in the compute fleet.\n"]
  min_instance_count : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The lower bound of the number of instances allowed in the compute fleet.\n"]
}
[@@ocaml.doc "Specifies the boundaries of the compute node group auto scaling.\n"]

type nonrec update_compute_node_group_request = {
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  slurm_configuration : update_compute_node_group_slurm_configuration_request option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  iam_instance_profile_arn : instance_profile_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM instance profile used to pass an IAM role when \
         launching EC2 instances. The role contained in your instance profile must have the \
         [pcs:RegisterComputeNodeGroupInstance] permission and the role name must start with \
         [AWSPCS] or must have the path [/aws-pcs/]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/security-instance-profiles.html}IAM \
         instance profiles for PCS} in the {i PCS User Guide}.\n"]
  scaling_configuration : scaling_configuration_request option;
      [@ocaml.doc "Specifies the boundaries of the compute node group auto scaling.\n"]
  spot_options : spot_options option; [@ocaml.doc ""]
  purchase_option : purchase_option option;
      [@ocaml.doc
        "Specifies how EC2 instances are purchased on your behalf. PCS supports On-Demand \
         Instances, Spot Instances, Interruptible Capacity Reservations, On-Demand Capacity \
         Reservations, and Amazon EC2 Capacity Blocks for ML. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html}Amazon \
         EC2 billing and purchasing options} in the {i Amazon Elastic Compute Cloud User Guide}. \
         For more information about PCS support for Capacity Blocks, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-blocks.html}Using Amazon EC2 \
         Capacity Blocks for ML with PCS} in the {i PCS User Guide}. For more information about \
         PCS support for interruptible capacity reservations, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-iodcr.html}Using \
         I-ODCRs with PCS} in the {i PCS User Guide}. Choose On-Demand if you plan to use an \
         On-Demand Capacity Reservation (ODCR). For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-odcr.html}Using \
         ODCRs with PCS}. If you don't provide this option, it defaults to On-Demand.\n"]
  custom_launch_template : custom_launch_template option; [@ocaml.doc ""]
  subnet_ids : string_list option;
      [@ocaml.doc
        "The list of subnet IDs where the compute node group provisions instances. The subnets \
         must be in the same VPC as the cluster.\n"]
  ami_id : ami_id option;
      [@ocaml.doc
        "The ID of the Amazon Machine Image (AMI) that PCS uses to launch instances. If not \
         provided, PCS uses the AMI ID specified in the custom launch template.\n"]
  compute_node_group_identifier : compute_node_group_identifier;
      [@ocaml.doc "The name or ID of the compute node group.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster of the compute node group.\n"]
}
[@@ocaml.doc ""]

type nonrec slurmdbd_custom_setting = {
  parameter_value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The values for the configured SlurmDBD settings.\n"]
  parameter_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "PCS supports custom SlurmDBD settings for clusters. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurmdbd-custom-settings.html}Configuring \
         custom SlurmDBD settings in PCS} in the {i PCS User Guide}.\n"]
}
[@@ocaml.doc
  "Additional settings that directly map to SlurmDBD settings.\n\n\
  \  PCS supports a subset of SlurmDBD settings. For more information, see \
   {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurmdbd-custom-settings.html}Configuring \
   custom SlurmDBD settings in PCS} in the {i PCS User Guide}.\n\
  \  \n\
  \   "]

type nonrec slurmdbd_custom_settings = slurmdbd_custom_setting list [@@ocaml.doc ""]

type nonrec cgroup_custom_setting = {
  parameter_value : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The values for the configured Cgroup settings.\n"]
  parameter_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "PCS supports custom Cgroup settings for clusters. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/cgroup-custom-settings.html}Configuring \
         custom Cgroup settings in PCS} in the {i PCS User Guide}.\n"]
}
[@@ocaml.doc
  "Additional settings that directly map to Cgroup settings.\n\n\
  \  PCS supports a subset of Cgroup settings. For more information, see \
   {{:https://docs.aws.amazon.com/pcs/latest/userguide/cgroup-custom-settings.html}Configuring \
   custom Cgroup settings in PCS} in the {i PCS User Guide}.\n\
  \  \n\
  \   "]

type nonrec cgroup_custom_settings = cgroup_custom_setting list [@@ocaml.doc ""]

type nonrec accounting_mode = NONE [@ocaml.doc ""] | STANDARD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_accounting_request = {
  mode : accounting_mode option;
      [@ocaml.doc
        "The default value for [mode] is [NONE]. A value of [STANDARD] means Slurm accounting is \
         enabled.\n"]
  default_purge_time_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The default value for all purge settings for [slurmdbd.conf]. For more information, see \
         the {{:https://slurm.schedmd.com/slurmdbd.conf.html}slurmdbd.conf documentation at \
         SchedMD}.\n\n\
        \ The default value for [defaultPurgeTimeInDays] is [-1].\n\
        \ \n\
        \  A value of [-1] means there is no purge time and records persist as long as the cluster \
         exists.\n\
        \  \n\
        \     [0] isn't a valid value.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc "The accounting configuration includes configurable settings for Slurm accounting.\n"]

type nonrec update_cluster_slurm_configuration_request = {
  slurm_rest : update_slurm_rest_request option;
      [@ocaml.doc "The Slurm REST API configuration for the cluster.\n"]
  accounting : update_accounting_request option;
      [@ocaml.doc
        "The accounting configuration includes configurable settings for Slurm accounting.\n"]
  cgroup_custom_settings : cgroup_custom_settings option;
      [@ocaml.doc
        "Additional Cgroup-specific configuration that directly maps to Cgroup settings.\n"]
  slurmdbd_custom_settings : slurmdbd_custom_settings option;
      [@ocaml.doc
        "Additional SlurmDBD-specific configuration that directly maps to SlurmDBD settings.\n"]
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
  scale_down_idle_time_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time (in seconds) before an idle node is scaled down.\n\n Default: [600] \n "]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec cluster_status =
  | RESUMING [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | SUSPENDING [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scheduler_type = SLURM [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scheduler = {
  version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The version of the specified scheduling software that PCS uses to manage cluster scaling \
         and job scheduling. You can upgrade this version using the [UpdateCluster] API action. \
         For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/working-with_clusters_upgrade.html}Upgrading \
         the Slurm version on a cluster} and \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions.html}Slurm versions in \
         PCS} in the {i PCS User Guide}.\n\n\
        \ Valid Values: [23.11 | 24.05 | 24.11 | 25.05 | 25.11] \n\
        \ "]
  type_ : scheduler_type;
      [@ocaml.doc "The software PCS uses to manage cluster scaling and job scheduling.\n"]
}
[@@ocaml.doc "The cluster management and job scheduling software associated with the cluster.\n"]

type nonrec size = LARGE [@ocaml.doc ""] | MEDIUM [@ocaml.doc ""] | SMALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec slurm_auth_key = {
  secret_version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The version of the shared Slurm key.\n"]
  secret_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the shared Slurm key.\n"]
}
[@@ocaml.doc "The shared Slurm key for authentication, also known as the {b cluster secret}.\n"]

type nonrec jwt_key = {
  secret_version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The version of the Amazon Web Services Secrets Manager secret containing the JWT key.\n"]
  secret_arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret \
         containing the JWT key.\n"]
}
[@@ocaml.doc
  "The JWT key stored in Amazon Web Services Secrets Manager for Slurm REST API authentication.\n"]

type nonrec jwt_auth = {
  jwt_key : jwt_key option; [@ocaml.doc "The JWT key for Slurm REST API authentication.\n"]
}
[@@ocaml.doc "The JWT authentication configuration for Slurm REST API access.\n"]

type nonrec accounting = {
  mode : accounting_mode;
      [@ocaml.doc
        "The default value for [mode] is [NONE]. A value of [STANDARD] means Slurm accounting is \
         enabled.\n"]
  default_purge_time_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The default value for all purge settings for [slurmdbd.conf]. For more information, see \
         the {{:https://slurm.schedmd.com/slurmdbd.conf.html}slurmdbd.conf documentation at \
         SchedMD}.\n\n\
        \ The default value for [defaultPurgeTimeInDays] is [-1].\n\
        \ \n\
        \  A value of [-1] means there is no purge time and records persist as long as the cluster \
         exists.\n\
        \  \n\
        \     [0] isn't a valid value.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "The accounting configuration includes configurable settings for Slurm accounting. It's a \
   property of the {b ClusterSlurmConfiguration} object.\n"]

type nonrec slurm_rest = {
  mode : slurm_rest_mode;
      [@ocaml.doc
        "The default value for [mode] is [NONE]. A value of [STANDARD] means the Slurm REST API is \
         enabled.\n"]
}
[@@ocaml.doc
  "The Slurm REST API configuration includes settings for enabling and configuring the Slurm REST \
   API. It's a property of the {b ClusterSlurmConfiguration} object.\n"]

type nonrec cluster_slurm_configuration = {
  slurm_rest : slurm_rest option; [@ocaml.doc "The Slurm REST API configuration for the cluster.\n"]
  accounting : accounting option;
      [@ocaml.doc
        "The accounting configuration includes configurable settings for Slurm accounting.\n"]
  jwt_auth : jwt_auth option;
      [@ocaml.doc "The JWT authentication configuration for Slurm REST API access.\n"]
  auth_key : slurm_auth_key option;
      [@ocaml.doc
        "The shared Slurm key for authentication, also known as the {b cluster secret}.\n"]
  cgroup_custom_settings : cgroup_custom_settings option;
      [@ocaml.doc
        "Additional Cgroup-specific configuration that directly maps to Cgroup settings.\n"]
  slurmdbd_custom_settings : slurmdbd_custom_settings option;
      [@ocaml.doc
        "Additional SlurmDBD-specific configuration that directly maps to SlurmDBD settings.\n"]
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
  scale_down_idle_time_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time (in seconds) before an idle node is scaled down.\n\n Default: [600] \n "]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_group_id_list = security_group_id list [@@ocaml.doc ""]

type nonrec network_type = IPV6 [@ocaml.doc ""] | IPV4 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec networking = {
  network_type : network_type option;
      [@ocaml.doc "The IP address version the cluster uses. The default is [IPV4].\n"]
  security_group_ids : security_group_id_list option;
      [@ocaml.doc
        "The list of security group IDs associated with the Elastic Network Interface (ENI) \
         created in subnets.\n\n\
        \ The following rules are required:\n\
        \ \n\
        \  {ul\n\
        \        {-  Inbound rule 1\n\
        \            \n\
        \             {ul\n\
        \                   {-  Protocol: All\n\
        \                       \n\
        \                        }\n\
        \                   {-  Ports: All\n\
        \                       \n\
        \                        }\n\
        \                   {-  Source: Self\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Outbound rule 1\n\
        \            \n\
        \             {ul\n\
        \                   {-  Protocol: All\n\
        \                       \n\
        \                        }\n\
        \                   {-  Ports: All\n\
        \                       \n\
        \                        }\n\
        \                   {-  Destination: 0.0.0.0/0 (IPv4) or ::/0 (IPv6)\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Outbound rule 2\n\
        \            \n\
        \             {ul\n\
        \                   {-  Protocol: All\n\
        \                       \n\
        \                        }\n\
        \                   {-  Ports: All\n\
        \                       \n\
        \                        }\n\
        \                   {-  Destination: Self\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        }\n\
        \  "]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc
        "The ID of the subnet where PCS creates an Elastic Network Interface (ENI) to enable \
         communication between managed controllers and PCS resources. The subnet must have an \
         available IP address, cannot reside in Outposts, Wavelength, or an Amazon Web Services \
         Local Zone.\n\n\
        \  Example: [subnet-abcd1234] \n\
        \ "]
}
[@@ocaml.doc "The networking configuration for the cluster's control plane.\n"]

type nonrec endpoint_type =
  | SLURMRESTD [@ocaml.doc ""]
  | SLURMDBD [@ocaml.doc ""]
  | SLURMCTLD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec endpoint = {
  port : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The endpoint's connection port number.\n\n  Example: [1234] \n "]
  ipv6_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint's IPv6 address.\n\n Example: [2001:db8::1] \n "]
  public_ip_address : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The endpoint's public IP address.\n\n Example: [192.0.2.1] \n "]
  private_ip_address : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "For clusters that use IPv4, this is the endpoint's private IP address.\n\n\
        \ Example: [10.1.2.3] \n\
        \ \n\
        \  For clusters configured to use IPv6, this is an empty string.\n\
        \  "]
  type_ : endpoint_type;
      [@ocaml.doc "Indicates the type of endpoint running at the specific IP address.\n"]
}
[@@ocaml.doc "An endpoint available for interaction with the scheduler.\n"]

type nonrec endpoints = endpoint list [@@ocaml.doc ""]

type nonrec cluster = {
  error_info : error_info_list option;
      [@ocaml.doc "The list of errors that occurred during cluster provisioning.\n"]
  endpoints : endpoints option;
      [@ocaml.doc "The list of endpoints available for interaction with the scheduler.\n"]
  networking : networking; [@ocaml.doc ""]
  slurm_configuration : cluster_slurm_configuration option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  size : size;
      [@ocaml.doc
        "The size of the cluster.\n\n\
        \ {ul\n\
        \       {-   [SMALL]: 32 compute nodes and 256 jobs\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: 512 compute nodes and 8192 jobs\n\
        \           \n\
        \            }\n\
        \       {-   [LARGE]: 2048 compute nodes and 16,384 jobs\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scheduler : scheduler; [@ocaml.doc ""]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was modified.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was created.\n"]
  status : cluster_status;
      [@ocaml.doc
        "The provisioning status of the cluster.\n\n\
        \  The provisioning status doesn't indicate the overall health of the cluster.\n\
        \  \n\
        \     The resource enters the [SUSPENDING] and [SUSPENDED] states when the scheduler is \
         beyond end of life and we have suspended the cluster. When in these states, you can't use \
         the cluster. The cluster controller is down and all compute instances are terminated. The \
         resources still count toward your service quotas. You can delete a resource if its status \
         is [SUSPENDED]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html}Frequently \
         asked questions about Slurm versions in PCS} in the {i PCS User Guide}.\n\
        \     \n\
        \      "]
  arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the cluster.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The generated unique ID of the cluster.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name that identifies the cluster.\n"]
}
[@@ocaml.doc "The cluster resource and configuration.\n"]

type nonrec update_cluster_response = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec update_cluster_request = {
  scheduler : update_scheduler_request option;
      [@ocaml.doc
        "The scheduler configuration to update for the cluster. Use this to upgrade the Slurm \
         version. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/working-with_clusters_upgrade.html}Upgrading \
         the Slurm version on a cluster} in the {i PCS User Guide}.\n"]
  slurm_configuration : update_cluster_slurm_configuration_request option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  cluster_identifier : cluster_identifier; [@ocaml.doc "The name or ID of the cluster to update.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_keys;
      [@ocaml.doc
        "1 or more tag keys to remove from the resource. Specify only tag keys and not tag values.\n"]
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec request_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : request_tag_map;
      [@ocaml.doc
        "1 or more tags added to the resource. Each tag consists of a tag key and tag value. The \
         tag value is optional and can be an empty string.\n"]
  resource_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec slurm_rest_request = {
  mode : slurm_rest_mode;
      [@ocaml.doc
        "The default value for [mode] is [NONE]. A value of [STANDARD] means the Slurm REST API is \
         enabled.\n"]
}
[@@ocaml.doc
  "The Slurm REST API configuration includes settings for enabling and configuring the Slurm REST \
   API. It's a property of the {b ClusterSlurmConfiguration} object.\n"]

type nonrec shared_secret = string [@@ocaml.doc ""]

type nonrec scheduler_request = {
  version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The version of the specified scheduling software that PCS uses to manage cluster scaling \
         and job scheduling. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions.html}Slurm versions in \
         PCS} in the {i PCS User Guide}.\n\n\
        \ Valid Values: [24.11 | 25.05 | 25.11] \n\
        \ "]
  type_ : scheduler_type;
      [@ocaml.doc "The software PCS uses to manage cluster scaling and job scheduling.\n"]
}
[@@ocaml.doc "The cluster management and job scheduling software associated with the cluster.\n"]

type nonrec response_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec register_compute_node_group_instance_response = {
  endpoints : endpoints;
      [@ocaml.doc "The list of endpoints available for interaction with the scheduler.\n"]
  shared_secret : shared_secret;
      [@ocaml.doc
        "For the Slurm scheduler, this is the shared Munge key the scheduler uses to authenticate \
         compute node group instances.\n"]
  node_i_d : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The scheduler node ID for this instance.\n"]
}
[@@ocaml.doc ""]

type nonrec bootstrap_id = string [@@ocaml.doc ""]

type nonrec register_compute_node_group_instance_request = {
  bootstrap_id : bootstrap_id; [@ocaml.doc "The client-generated token to allow for retries.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster to register the compute node group instance in.\n"]
}
[@@ocaml.doc ""]

type nonrec queue_summary = {
  status : queue_status;
      [@ocaml.doc
        "The provisioning status of the queue.\n\n\
        \   The provisioning status doesn't indicate the overall health of the queue.\n\
        \  \n\
        \     The resource enters the [SUSPENDING] and [SUSPENDED] states when the scheduler is \
         beyond end of life and we have suspended the cluster. When in these states, you can't use \
         the cluster. The cluster controller is down and all compute instances are terminated. The \
         resources still count toward your service quotas. You can delete a resource if its status \
         is [SUSPENDED]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html}Frequently \
         asked questions about Slurm versions in PCS} in the {i PCS User Guide}.\n\
        \     \n\
        \      "]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was modified.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was created.\n"]
  cluster_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the cluster of the queue.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the queue.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The generated unique ID of the queue.\n"]
  name : queue_name; [@ocaml.doc "The name that identifies the queue.\n"]
}
[@@ocaml.doc "The object returned by the [ListQueues] API action.\n"]

type nonrec queue_slurm_configuration_request = {
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec queue_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec queue_list = queue_summary list [@@ocaml.doc ""]

type nonrec networking_request = {
  network_type : network_type option;
      [@ocaml.doc "The IP address version the cluster uses. The default is [IPV4].\n"]
  security_group_ids : security_group_id_list option;
      [@ocaml.doc
        "A list of security group IDs associated with the Elastic Network Interface (ENI) created \
         in subnets.\n"]
  subnet_ids : subnet_id_list option;
      [@ocaml.doc
        "The list of subnet IDs where PCS creates an Elastic Network Interface (ENI) to enable \
         communication between managed controllers and PCS resources. Subnet IDs have the form \
         [subnet-0123456789abcdef0].\n\n\
        \ Subnets can't be in Outposts, Wavelength or an Amazon Web Services Local Zone.\n\
        \ \n\
        \   PCS currently supports only 1 subnet in this list.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc "The networking configuration for the cluster's control plane.\n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : response_tag_map option;
      [@ocaml.doc
        "1 or more tags added to the resource. Each tag consists of a tag key and tag value. The \
         tag value is optional and can be an empty string.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource for which to list tags.\n"]
}
[@@ocaml.doc ""]

type nonrec list_queues_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The value of [nextToken] is a unique pagination token for each page of results returned. \
         If [nextToken] is returned, there are more results available. Make the call again using \
         the returned token to retrieve the next page. Keep all other arguments unchanged. Each \
         pagination token expires after 24 hours. Using an expired pagination token returns an \
         [HTTP 400 InvalidToken] error.\n"]
  queues : queue_list; [@ocaml.doc "The list of queues associated with the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec list_queues_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [nextToken] to \
         obtain further pages of results. The default is 10 results, and the maximum allowed page \
         size is 100 results. A value of 0 uses the default.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The value of [nextToken] is a unique pagination token for each page of results returned. \
         If [nextToken] is returned, there are more results available. Make the call again using \
         the returned token to retrieve the next page. Keep all other arguments unchanged. Each \
         pagination token expires after 24 hours. Using an expired pagination token returns an \
         [HTTP 400 InvalidToken] error.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster to list queues for.\n"]
}
[@@ocaml.doc ""]

type nonrec compute_node_group_summary = {
  status : compute_node_group_status;
      [@ocaml.doc
        "The provisioning status of the compute node group.\n\n\
        \  The provisioning status doesn't indicate the overall health of the compute node group.\n\
        \  \n\
        \     The resource enters the [SUSPENDING] and [SUSPENDED] states when the scheduler is \
         beyond end of life and we have suspended the cluster. When in these states, you can't use \
         the cluster. The cluster controller is down and all compute instances are terminated. The \
         resources still count toward your service quotas. You can delete a resource if its status \
         is [SUSPENDED]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html}Frequently \
         asked questions about Slurm versions in PCS} in the {i PCS User Guide}.\n\
        \     \n\
        \      "]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was modified.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was created.\n"]
  cluster_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the cluster of the compute node group.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the compute node group.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The generated unique ID of the compute node group.\n"]
  name : compute_node_group_name; [@ocaml.doc "The name that identifies the compute node group.\n"]
}
[@@ocaml.doc "The object returned by the [ListComputeNodeGroups] API action.\n"]

type nonrec compute_node_group_list = compute_node_group_summary list [@@ocaml.doc ""]

type nonrec list_compute_node_groups_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The value of [nextToken] is a unique pagination token for each page of results returned. \
         If [nextToken] is returned, there are more results available. Make the call again using \
         the returned token to retrieve the next page. Keep all other arguments unchanged. Each \
         pagination token expires after 24 hours. Using an expired pagination token returns an \
         [HTTP 400 InvalidToken] error.\n"]
  compute_node_groups : compute_node_group_list;
      [@ocaml.doc "The list of compute node groups for the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec list_compute_node_groups_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [nextToken] to \
         obtain further pages of results. The default is 10 results, and the maximum allowed page \
         size is 100 results. A value of 0 uses the default.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The value of [nextToken] is a unique pagination token for each page of results returned. \
         If [nextToken] is returned, there are more results available. Make the call again using \
         the returned token to retrieve the next page. Keep all other arguments unchanged. Each \
         pagination token expires after 24 hours. Using an expired pagination token returns an \
         [HTTP 400 InvalidToken] error.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster to list compute node groups for.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_summary = {
  status : cluster_status;
      [@ocaml.doc
        "The provisioning status of the cluster.\n\n\
        \  The provisioning status doesn't indicate the overall health of the cluster.\n\
        \  \n\
        \     The resource enters the [SUSPENDING] and [SUSPENDED] states when the scheduler is \
         beyond end of life and we have suspended the cluster. When in these states, you can't use \
         the cluster. The cluster controller is down and all compute instances are terminated. The \
         resources still count toward your service quotas. You can delete a resource if its status \
         is [SUSPENDED]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/slurm-versions_faq.html}Frequently \
         asked questions about Slurm versions in PCS} in the {i PCS User Guide}.\n\
        \     \n\
        \      "]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was modified.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc "The date and time the resource was created.\n"]
  arn : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The unique Amazon Resource Name (ARN) of the cluster.\n"]
  id : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The generated unique ID of the cluster.\n"]
  name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The name that identifies the cluster.\n"]
}
[@@ocaml.doc "The object returned by the [ListClusters] API action.\n"]

type nonrec cluster_list = cluster_summary list [@@ocaml.doc ""]

type nonrec list_clusters_response = {
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The value of [nextToken] is a unique pagination token for each page of results returned. \
         If [nextToken] is returned, there are more results available. Make the call again using \
         the returned token to retrieve the next page. Keep all other arguments unchanged. Each \
         pagination token expires after 24 hours. Using an expired pagination token returns an \
         [HTTP 400 InvalidToken] error.\n"]
  clusters : cluster_list; [@ocaml.doc "The list of clusters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_clusters_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results that are returned per call. You can use [nextToken] to \
         obtain further pages of results. The default is 10 results, and the maximum allowed page \
         size is 100 results. A value of 0 uses the default.\n"]
  next_token : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The value of [nextToken] is a unique pagination token for each page of results returned. \
         If [nextToken] is returned, there are more results available. Make the call again using \
         the returned token to retrieve the next page. Keep all other arguments unchanged. Each \
         pagination token expires after 24 hours. Using an expired pagination token returns an \
         [HTTP 400 InvalidToken] error.\n"]
}
[@@ocaml.doc ""]

type nonrec get_queue_response = { queue : queue option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec get_queue_request = {
  queue_identifier : queue_identifier; [@ocaml.doc "The name or ID of the queue.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster of the queue.\n"]
}
[@@ocaml.doc ""]

type nonrec get_compute_node_group_response = {
  compute_node_group : compute_node_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec get_compute_node_group_request = {
  compute_node_group_identifier : compute_node_group_identifier;
      [@ocaml.doc "The name or ID of the compute node group.\n"]
  cluster_identifier : cluster_identifier; [@ocaml.doc "The name or ID of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cluster_response = {
  cluster : cluster option; [@ocaml.doc "The cluster resource.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cluster_request = {
  cluster_identifier : cluster_identifier; [@ocaml.doc "The name or ID of the cluster.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_queue_response = unit [@@ocaml.doc ""]

type nonrec delete_queue_request = {
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  queue_identifier : queue_identifier; [@ocaml.doc "The name or ID of the queue to delete.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster of the queue.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_compute_node_group_response = unit [@@ocaml.doc ""]

type nonrec delete_compute_node_group_request = {
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  compute_node_group_identifier : compute_node_group_identifier;
      [@ocaml.doc "The name or ID of the compute node group to delete.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster of the compute node group.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_response = unit [@@ocaml.doc ""]

type nonrec delete_cluster_request = {
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  cluster_identifier : cluster_identifier; [@ocaml.doc "The name or ID of the cluster to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_queue_response = { queue : queue option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec create_queue_request = {
  tags : request_tag_map option;
      [@ocaml.doc
        "1 or more tags added to the resource. Each tag consists of a tag key and tag value. The \
         tag value is optional and can be an empty string.\n"]
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  slurm_configuration : queue_slurm_configuration_request option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  compute_node_group_configurations : compute_node_group_configuration_list option;
      [@ocaml.doc
        "The list of compute node group configurations to associate with the queue. Queues assign \
         jobs to associated compute node groups.\n"]
  queue_name : queue_name; [@ocaml.doc "A name to identify the queue.\n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster for which to create a queue.\n"]
}
[@@ocaml.doc ""]

type nonrec create_compute_node_group_response = {
  compute_node_group : compute_node_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec compute_node_group_slurm_configuration_request = {
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
  scale_down_idle_time_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time (in seconds) before an idle node is scaled down. If not specified, the \
         cluster-level setting applies. This overrides the cluster-level \
         [scaleDownIdleTimeInSeconds] setting. A value of [-1] removes the override and applies \
         the cluster-level setting to this compute node group. Requires Slurm version 25.11 or \
         later.\n"]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec create_compute_node_group_request = {
  tags : request_tag_map option;
      [@ocaml.doc
        "1 or more tags added to the resource. Each tag consists of a tag key and tag value. The \
         tag value is optional and can be an empty string.\n"]
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  slurm_configuration : compute_node_group_slurm_configuration_request option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  spot_options : spot_options option; [@ocaml.doc ""]
  instance_configs : instance_list;
      [@ocaml.doc
        "A list of EC2 instance configurations that PCS can provision in the compute node group.\n"]
  scaling_configuration : scaling_configuration_request;
      [@ocaml.doc "Specifies the boundaries of the compute node group auto scaling.\n"]
  iam_instance_profile_arn : instance_profile_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM instance profile used to pass an IAM role when \
         launching EC2 instances. The role contained in your instance profile must have the \
         [pcs:RegisterComputeNodeGroupInstance] permission and the role name must start with \
         [AWSPCS] or must have the path [/aws-pcs/]. For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/security-instance-profiles.html}IAM \
         instance profiles for PCS} in the {i PCS User Guide}.\n"]
  custom_launch_template : custom_launch_template; [@ocaml.doc ""]
  purchase_option : purchase_option option;
      [@ocaml.doc
        "Specifies how EC2 instances are purchased on your behalf. PCS supports On-Demand \
         Instances, Spot Instances, Interruptible Capacity Reservations, On-Demand Capacity \
         Reservations, and Amazon EC2 Capacity Blocks for ML. For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html}Amazon \
         EC2 billing and purchasing options} in the {i Amazon Elastic Compute Cloud User Guide}. \
         For more information about PCS support for Capacity Blocks, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-blocks.html}Using Amazon EC2 \
         Capacity Blocks for ML with PCS} in the {i PCS User Guide}. For more information about \
         PCS support for interruptible capacity reservations, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-iodcr.html}Using \
         I-ODCRs with PCS} in the {i PCS User Guide}. Choose On-Demand if you plan to use an \
         On-Demand Capacity Reservation (ODCR). For more information, see \
         {{:https://docs.aws.amazon.com/pcs/latest/userguide/capacity-reservations-odcr.html}Using \
         ODCRs with PCS}. If you don't provide this option, it defaults to On-Demand.\n"]
  subnet_ids : string_list;
      [@ocaml.doc
        "The list of subnet IDs where the compute node group launches instances. Subnets must be \
         in the same VPC as the cluster.\n"]
  ami_id : ami_id option;
      [@ocaml.doc
        " The ID of the Amazon Machine Image (AMI) that PCS uses to launch compute nodes (Amazon \
         EC2 instances). If you don't provide this value, PCS uses the AMI ID specified in the \
         custom launch template.\n"]
  compute_node_group_name : compute_node_group_name;
      [@ocaml.doc "A name to identify the cluster. Example: [MyCluster] \n"]
  cluster_identifier : cluster_identifier;
      [@ocaml.doc "The name or ID of the cluster to create a compute node group in.\n"]
}
[@@ocaml.doc ""]

type nonrec create_cluster_response = {
  cluster : cluster option; [@ocaml.doc "The cluster resource.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_name = string [@@ocaml.doc ""]

type nonrec accounting_request = {
  mode : accounting_mode;
      [@ocaml.doc
        "The default value for [mode] is [NONE]. A value of [STANDARD] means Slurm accounting is \
         enabled.\n"]
  default_purge_time_in_days : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The default value for all purge settings for [slurmdbd.conf]. For more information, see \
         the {{:https://slurm.schedmd.com/slurmdbd.conf.html}slurmdbd.conf documentation at \
         SchedMD}.\n\n\
        \ The default value for [defaultPurgeTimeInDays] is [-1].\n\
        \ \n\
        \  A value of [-1] means there is no purge time and records persist as long as the cluster \
         exists.\n\
        \  \n\
        \     [0] isn't a valid value.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "The accounting configuration includes configurable settings for Slurm accounting. It's a \
   property of the {b ClusterSlurmConfiguration} object.\n"]

type nonrec cluster_slurm_configuration_request = {
  slurm_rest : slurm_rest_request option;
      [@ocaml.doc "The Slurm REST API configuration for the cluster.\n"]
  accounting : accounting_request option;
      [@ocaml.doc
        "The accounting configuration includes configurable settings for Slurm accounting.\n"]
  cgroup_custom_settings : cgroup_custom_settings option;
      [@ocaml.doc
        "Additional Cgroup-specific configuration that directly maps to Cgroup settings.\n"]
  slurmdbd_custom_settings : slurmdbd_custom_settings option;
      [@ocaml.doc
        "Additional SlurmDBD-specific configuration that directly maps to SlurmDBD settings.\n"]
  slurm_custom_settings : slurm_custom_settings option;
      [@ocaml.doc "Additional Slurm-specific configuration that directly maps to Slurm settings.\n"]
  scale_down_idle_time_in_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The time (in seconds) before an idle node is scaled down.\n\n Default: [600] \n "]
}
[@@ocaml.doc "Additional options related to the Slurm scheduler.\n"]

type nonrec create_cluster_request = {
  tags : request_tag_map option;
      [@ocaml.doc
        "1 or more tags added to the resource. Each tag consists of a tag key and tag value. The \
         tag value is optional and can be an empty string.\n"]
  client_token : sb_client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request. Idempotency ensures that an API request completes only once. With an idempotent \
         request, if the original request completes successfully, the subsequent retries with the \
         same client token return the result from the original successful request and they have no \
         additional effect. If you don't specify a client token, the CLI and SDK automatically \
         generate 1 for you.\n"]
  slurm_configuration : cluster_slurm_configuration_request option;
      [@ocaml.doc "Additional options related to the Slurm scheduler.\n"]
  networking : networking_request;
      [@ocaml.doc "The networking configuration used to set up the cluster's control plane.\n"]
  size : size;
      [@ocaml.doc
        "A value that determines the maximum number of compute nodes in the cluster and the \
         maximum number of jobs (active and queued).\n\n\
        \ {ul\n\
        \       {-   [SMALL]: 32 compute nodes and 256 jobs\n\
        \           \n\
        \            }\n\
        \       {-   [MEDIUM]: 512 compute nodes and 8192 jobs\n\
        \           \n\
        \            }\n\
        \       {-   [LARGE]: 2048 compute nodes and 16,384 jobs\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scheduler : scheduler_request;
      [@ocaml.doc
        "The cluster management and job scheduling software associated with the cluster.\n"]
  cluster_name : cluster_name; [@ocaml.doc "A name to identify the cluster. Example: [MyCluster] \n"]
}
[@@ocaml.doc ""]

type nonrec compute_node_group_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec cluster_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]
