type nonrec integer = int [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec too_many_requests_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "Too many service requests were made over the given time period.\n"]

type nonrec not_found_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "The target resource cannot be found.\n"]

type nonrec limit_exceeded_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "A service limit was exceeded.\n"]

type nonrec internal_server_error_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "An internal server error occurred.\n"]

type nonrec forbidden_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "An access permissions issue occurred.\n"]

type nonrec conflict_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "A conflict occurred.\n"]

type nonrec bad_request_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "The target request is invalid.\n"]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec environment_id = string [@@ocaml.doc ""]

type nonrec user_arn = string [@@ocaml.doc ""]

type nonrec permissions =
  | OWNER [@ocaml.doc ""]
  | READ_WRITE [@ocaml.doc ""]
  | READ_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_member = {
  permissions : permissions;
      [@ocaml.doc
        "The type of environment member permissions associated with this environment member. \
         Available values include:\n\n\
        \ {ul\n\
        \       {-   [owner]: Owns the environment.\n\
        \           \n\
        \            }\n\
        \       {-   [read-only]: Has read-only access to the environment.\n\
        \           \n\
        \            }\n\
        \       {-   [read-write]: Has read-write access to the environment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  user_id : string_;
      [@ocaml.doc
        "The user ID in Identity and Access Management (IAM) of the environment member.\n"]
  user_arn : user_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the environment member.\n"]
  environment_id : environment_id;
      [@ocaml.doc "The ID of the environment for the environment member.\n"]
  last_access : timestamp option;
      [@ocaml.doc
        "The time, expressed in epoch time format, when the environment member last opened the \
         environment.\n"]
}
[@@ocaml.doc "Information about an environment member for an Cloud9 development environment.\n"]

type nonrec update_environment_membership_result = {
  membership : environment_member option;
      [@ocaml.doc "Information about the environment member whose settings were changed.\n"]
}
[@@ocaml.doc ""]

type nonrec member_permissions = READ_WRITE [@ocaml.doc ""] | READ_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_environment_membership_request = {
  environment_id : environment_id;
      [@ocaml.doc
        "The ID of the environment for the environment member whose settings you want to change.\n"]
  user_arn : user_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the environment member whose settings you want to change.\n"]
  permissions : member_permissions;
      [@ocaml.doc
        "The replacement type of environment member permissions you want to associate with this \
         environment member. Available values include:\n\n\
        \ {ul\n\
        \       {-   [read-only]: Has read-only access to the environment.\n\
        \           \n\
        \            }\n\
        \       {-   [read-write]: Has read-write access to the environment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_environment_result = unit [@@ocaml.doc ""]

type nonrec managed_credentials_action = ENABLE [@ocaml.doc ""] | DISABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_description = string [@@ocaml.doc ""]

type nonrec environment_name = string [@@ocaml.doc ""]

type nonrec update_environment_request = {
  environment_id : environment_id; [@ocaml.doc "The ID of the environment to change settings.\n"]
  name : environment_name option; [@ocaml.doc "A replacement name for the environment.\n"]
  description : environment_description option;
      [@ocaml.doc "Any new or replacement description for the environment.\n"]
  managed_credentials_action : managed_credentials_action option;
      [@ocaml.doc
        "Allows the environment owner to turn on or turn off the Amazon Web Services managed \
         temporary credentials for an Cloud9 environment by using one of the following values:\n\n\
        \ {ul\n\
        \       {-   [ENABLE] \n\
        \           \n\
        \            }\n\
        \       {-   [DISABLE] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Only the environment owner can change the status of managed temporary credentials. An \
         [AccessDeniedException] is thrown if an attempt to turn on or turn off managed temporary \
         credentials is made by an account that's not the environment owner.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec concurrent_access_exception = {
  message : string_ option; [@ocaml.doc ""]
  class_name : string_ option; [@ocaml.doc ""]
  code : integer option; [@ocaml.doc ""]
}
[@@ocaml.doc "A concurrent access issue occurred.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec environment_arn = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : environment_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Cloud9 development environment to remove tags from.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        "The tag names of the tags to remove from the given Cloud9 development environment.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The {b name} part of a tag.\n"]
  value : tag_value; [@ocaml.doc "The {b value} part of a tag.\n"]
}
[@@ocaml.doc
  "Metadata that is associated with Amazon Web Services resources. In particular, a name-value \
   pair that can be associated with an Cloud9 development environment. There are two types of \
   tags: {i user tags} and {i system tags}. A user tag is created by the user. A system tag is \
   automatically created by Amazon Web Services services. A system tag is prefixed with [\"aws:\"] \
   and cannot be modified by the user.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : environment_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Cloud9 development environment to add tags to.\n"]
  tags : tag_list;
      [@ocaml.doc "The list of tags to add to the given Cloud9 development environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option;
      [@ocaml.doc "The list of tags associated with the Cloud9 development environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : environment_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Cloud9 development environment to get the tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec environment_id_list = environment_id list [@@ocaml.doc ""]

type nonrec list_environments_result = {
  next_token : string_ option;
      [@ocaml.doc
        "If there are more than 25 items in the list, only the first 25 items are returned, along \
         with a unique string called a {i next token}. To get the next batch of items in the list, \
         call this operation again, adding the next token to the call.\n"]
  environment_ids : environment_id_list option; [@ocaml.doc "The list of environment identifiers.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_environments_request = {
  next_token : string_ option;
      [@ocaml.doc
        "During a previous call, if there are more than 25 items in the list, only the first 25 \
         items are returned, along with a unique string called a {i next token}. To get the next \
         batch of items in the list, call this operation again, adding the next token to the call. \
         To get all of the items in the list, keep calling this operation with each subsequent \
         next token that is returned, until no more next tokens are returned.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of environments to get identifiers for.\n"]
}
[@@ocaml.doc ""]

type nonrec environment_status =
  | ERROR [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | CONNECTING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | STOPPED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_environment_status_result = {
  status : environment_status;
      [@ocaml.doc
        "The status of the environment. Available values include:\n\n\
        \ {ul\n\
        \       {-   [connecting]: The environment is connecting.\n\
        \           \n\
        \            }\n\
        \       {-   [creating]: The environment is being created.\n\
        \           \n\
        \            }\n\
        \       {-   [deleting]: The environment is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [error]: The environment is in an error state.\n\
        \           \n\
        \            }\n\
        \       {-   [ready]: The environment is ready.\n\
        \           \n\
        \            }\n\
        \       {-   [stopped]: The environment is stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [stopping]: The environment is stopping.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  message : string_; [@ocaml.doc "Any informational message about the status of the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_environment_status_request = {
  environment_id : environment_id;
      [@ocaml.doc "The ID of the environment to get status information about.\n"]
}
[@@ocaml.doc ""]

type nonrec managed_credentials_status =
  | ENABLED_ON_CREATE [@ocaml.doc ""]
  | ENABLED_BY_OWNER [@ocaml.doc ""]
  | DISABLED_BY_DEFAULT [@ocaml.doc ""]
  | DISABLED_BY_OWNER [@ocaml.doc ""]
  | DISABLED_BY_COLLABORATOR [@ocaml.doc ""]
  | PENDING_REMOVAL_BY_COLLABORATOR [@ocaml.doc ""]
  | PENDING_START_REMOVAL_BY_COLLABORATOR [@ocaml.doc ""]
  | PENDING_REMOVAL_BY_OWNER [@ocaml.doc ""]
  | PENDING_START_REMOVAL_BY_OWNER [@ocaml.doc ""]
  | FAILED_REMOVAL_BY_COLLABORATOR [@ocaml.doc ""]
  | FAILED_REMOVAL_BY_OWNER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_lifecycle_status =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_lifecycle = {
  status : environment_lifecycle_status option;
      [@ocaml.doc
        "The current creation or deletion lifecycle state of the environment.\n\n\
        \ {ul\n\
        \       {-   [CREATING]: The environment is in the process of being created.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATED]: The environment was successfully created.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATE_FAILED]: The environment failed to be created.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETING]: The environment is in the process of being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_FAILED]: The environment failed to delete.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  reason : string_ option;
      [@ocaml.doc "Any informational message about the lifecycle state of the environment.\n"]
  failure_resource : string_ option;
      [@ocaml.doc
        "If the environment failed to delete, the Amazon Resource Name (ARN) of the related Amazon \
         Web Services resource.\n"]
}
[@@ocaml.doc
  "Information about the current creation or deletion lifecycle state of an Cloud9 development \
   environment.\n"]

type nonrec connection_type = CONNECT_SSH [@ocaml.doc ""] | CONNECT_SSM [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment_type = SSH [@ocaml.doc ""] | EC2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec environment = {
  id : environment_id option; [@ocaml.doc "The ID of the environment.\n"]
  name : environment_name option; [@ocaml.doc "The name of the environment.\n"]
  description : environment_description option;
      [@ocaml.doc "The description for the environment.\n"]
  type_ : environment_type;
      [@ocaml.doc
        "The type of environment. Valid values include the following:\n\n\
        \ {ul\n\
        \       {-   [ec2]: An Amazon Elastic Compute Cloud (Amazon EC2) instance connects to the \
         environment.\n\
        \           \n\
        \            }\n\
        \       {-   [ssh]: Your own server connects to the environment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  connection_type : connection_type option;
      [@ocaml.doc
        "The connection type used for connecting to an Amazon EC2 environment. [CONNECT_SSH] is \
         selected by default.\n"]
  arn : string_; [@ocaml.doc "The Amazon Resource Name (ARN) of the environment.\n"]
  owner_arn : string_; [@ocaml.doc "The Amazon Resource Name (ARN) of the environment owner.\n"]
  lifecycle : environment_lifecycle option;
      [@ocaml.doc "The state of the environment in its creation or deletion lifecycle.\n"]
  managed_credentials_status : managed_credentials_status option;
      [@ocaml.doc
        "Describes the status of Amazon Web Services managed temporary credentials for the Cloud9 \
         environment. Available values are:\n\n\
        \ {ul\n\
        \       {-   [ENABLED_ON_CREATE] \n\
        \           \n\
        \            }\n\
        \       {-   [ENABLED_BY_OWNER] \n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED_BY_DEFAULT] \n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED_BY_OWNER] \n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED_BY_COLLABORATOR] \n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_REMOVAL_BY_COLLABORATOR] \n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_REMOVAL_BY_OWNER] \n\
        \           \n\
        \            }\n\
        \       {-   [FAILED_REMOVAL_BY_COLLABORATOR] \n\
        \           \n\
        \            }\n\
        \       {-   [ENABLED_BY_OWNER] \n\
        \           \n\
        \            }\n\
        \       {-   [DISABLED_BY_DEFAULT] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about an Cloud9 development environment.\n"]

type nonrec environment_list = environment list [@@ocaml.doc ""]

type nonrec describe_environments_result = {
  environments : environment_list option;
      [@ocaml.doc "Information about the environments that are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec bounded_environment_id_list = environment_id list [@@ocaml.doc ""]

type nonrec describe_environments_request = {
  environment_ids : bounded_environment_id_list;
      [@ocaml.doc "The IDs of individual environments to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec environment_members_list = environment_member list [@@ocaml.doc ""]

type nonrec describe_environment_memberships_result = {
  memberships : environment_members_list option;
      [@ocaml.doc "Information about the environment members for the environment.\n"]
  next_token : string_ option;
      [@ocaml.doc
        "If there are more than 25 items in the list, only the first 25 items are returned, along \
         with a unique string called a {i next token}. To get the next batch of items in the list, \
         call this operation again, adding the next token to the call.\n"]
}
[@@ocaml.doc ""]

type nonrec permissions_list = permissions list [@@ocaml.doc ""]

type nonrec describe_environment_memberships_request = {
  user_arn : user_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an individual environment member to get information \
         about. If no value is specified, information about all environment members are returned.\n"]
  environment_id : environment_id option;
      [@ocaml.doc "The ID of the environment to get environment member information about.\n"]
  permissions : permissions_list option;
      [@ocaml.doc
        "The type of environment member permissions to get information about. Available values \
         include:\n\n\
        \ {ul\n\
        \       {-   [owner]: Owns the environment.\n\
        \           \n\
        \            }\n\
        \       {-   [read-only]: Has read-only access to the environment.\n\
        \           \n\
        \            }\n\
        \       {-   [read-write]: Has read-write access to the environment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If no value is specified, information about all environment members are returned.\n\
        \   "]
  next_token : string_ option;
      [@ocaml.doc
        "During a previous call, if there are more than 25 items in the list, only the first 25 \
         items are returned, along with a unique string called a {i next token}. To get the next \
         batch of items in the list, call this operation again, adding the next token to the call. \
         To get all of the items in the list, keep calling this operation with each subsequent \
         next token that is returned, until no more next tokens are returned.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of environment members to get information about.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_membership_result = unit [@@ocaml.doc ""]

type nonrec delete_environment_membership_request = {
  environment_id : environment_id;
      [@ocaml.doc "The ID of the environment to delete the environment member from.\n"]
  user_arn : user_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the environment member to delete from the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_result = unit [@@ocaml.doc ""]

type nonrec delete_environment_request = {
  environment_id : environment_id; [@ocaml.doc "The ID of the environment to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec create_environment_membership_result = {
  membership : environment_member;
      [@ocaml.doc "Information about the environment member that was added.\n"]
}
[@@ocaml.doc ""]

type nonrec create_environment_membership_request = {
  environment_id : environment_id;
      [@ocaml.doc
        "The ID of the environment that contains the environment member you want to add.\n"]
  user_arn : user_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the environment member you want to add.\n"]
  permissions : member_permissions;
      [@ocaml.doc
        "The type of environment member permissions you want to associate with this environment \
         member. Available values include:\n\n\
        \ {ul\n\
        \       {-   [read-only]: Has read-only access to the environment.\n\
        \           \n\
        \            }\n\
        \       {-   [read-write]: Has read-write access to the environment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_environment_ec2_result = {
  environment_id : environment_id option;
      [@ocaml.doc "The ID of the environment that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec nullable_boolean = bool [@@ocaml.doc ""]

type nonrec automatic_stop_time_minutes = int [@@ocaml.doc ""]

type nonrec image_id = string [@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec instance_type = string [@@ocaml.doc ""]

type nonrec client_request_token = string [@@ocaml.doc ""]

type nonrec create_environment_ec2_request = {
  name : environment_name;
      [@ocaml.doc
        "The name of the environment to create.\n\n\
        \ This name is visible to other IAM users in the same Amazon Web Services account.\n\
        \ "]
  description : environment_description option;
      [@ocaml.doc "The description of the environment to create.\n"]
  client_request_token : client_request_token option;
      [@ocaml.doc
        "A unique, case-sensitive string that helps Cloud9 to ensure this operation completes no \
         more than one time.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html}Client \
         Tokens} in the {i Amazon EC2 API Reference}.\n\
        \ "]
  instance_type : instance_type;
      [@ocaml.doc "The type of instance to connect to the environment (for example, [t2.micro]).\n"]
  subnet_id : subnet_id option;
      [@ocaml.doc
        "The ID of the subnet in Amazon VPC that Cloud9 will use to communicate with the Amazon \
         EC2 instance.\n"]
  image_id : image_id;
      [@ocaml.doc
        "The identifier for the Amazon Machine Image (AMI) that's used to create the EC2 instance. \
         To choose an AMI for the instance, you must specify a valid AMI alias or a valid Amazon \
         EC2 Systems Manager (SSM) path.\n\n\
        \ \n\
        \ \n\
        \  We recommend using Amazon Linux 2023 as the AMI to create your environment as it is \
         fully supported.\n\
        \  \n\
        \   From December 16, 2024, Ubuntu 18.04 will be removed from the list of available \
         [imageIds] for Cloud9. This change is necessary as Ubuntu 18.04 has ended standard \
         support on May 31, 2023. This change will only affect direct API consumers, and not \
         Cloud9 console users.\n\
        \   \n\
        \    Since Ubuntu 18.04 has ended standard support as of May 31, 2023, we recommend you \
         choose Ubuntu 22.04.\n\
        \    \n\
        \      {b AMI aliases } \n\
        \     \n\
        \      {ul\n\
        \            {-  Amazon Linux 2023 (recommended): [amazonlinux-2023-x86_64] \n\
        \                \n\
        \                 }\n\
        \            {-  Ubuntu 22.04: [ubuntu-22.04-x86_64] \n\
        \                \n\
        \                 }\n\
        \            }\n\
        \    {b SSM paths} \n\
        \   \n\
        \    {ul\n\
        \          {-  Amazon Linux 2023 (recommended): \
         [resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2023-x86_64] \n\
        \              \n\
        \               }\n\
        \          {-  Ubuntu 22.04: [resolve:ssm:/aws/service/cloud9/amis/ubuntu-22.04-x86_64] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  automatic_stop_time_minutes : automatic_stop_time_minutes option;
      [@ocaml.doc
        "The number of minutes until the running instance is shut down after the environment has \
         last been used.\n"]
  owner_arn : user_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the environment owner. This ARN can be the ARN of any \
         IAM principal. If this value is not specified, the ARN defaults to this environment's \
         creator.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "An array of key-value pairs that will be associated with the new Cloud9 development \
         environment.\n"]
  connection_type : connection_type option;
      [@ocaml.doc
        "The connection type used for connecting to an Amazon EC2 environment. Valid values are \
         [CONNECT_SSH] (default) and [CONNECT_SSM] (connected through Amazon EC2 Systems \
         Manager).\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/cloud9/latest/user-guide/ec2-ssm.html}Accessing no-ingress \
         EC2 instances with Amazon EC2 Systems Manager} in the {i Cloud9 User Guide}.\n\
        \ "]
  dry_run : nullable_boolean option;
      [@ocaml.doc
        "Checks whether you have the required permissions for the action, without actually making \
         the request, and provides an error response. If you have the required permissions, the \
         error response is [DryRunOperation]. Otherwise, it is [UnauthorizedOperation].\n"]
}
[@@ocaml.doc ""]
