type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec unsupported_operation_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested operation isn't supported.\n"]

type nonrec reserved_node_offering_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Specified offering does not exist.\n"]

type nonrec reserved_node_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified reserved compute node not found.\n"]

type nonrec reserved_node_already_migrated_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the reserved node has already been exchanged.\n"]

type nonrec reserved_node_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "User already has a reservation with the given identifier.\n"]

type nonrec invalid_reserved_node_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Indicates that the Reserved Node being exchanged is not in an active state.\n"]

type nonrec dependent_service_unavailable_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Your request cannot be completed because a dependent internal service is temporarily \
   unavailable. Wait 30 to 60 seconds and try again.\n"]

type nonrec reserved_node_offering_type = Regular [@ocaml.doc ""] | Upgradable [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec double = float [@@ocaml.doc ""]

type nonrec recurring_charge = {
  recurring_charge_amount : double option;
      [@ocaml.doc
        "The amount charged per the period of time specified by the recurring charge frequency.\n"]
  recurring_charge_frequency : string_ option;
      [@ocaml.doc "The frequency at which the recurring charge amount is applied.\n"]
}
[@@ocaml.doc "Describes a recurring charge.\n"]

type nonrec recurring_charge_list = recurring_charge list [@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec t_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec reserved_node = {
  reserved_node_id : string_ option; [@ocaml.doc "The unique identifier for the reservation.\n"]
  reserved_node_offering_id : string_ option;
      [@ocaml.doc "The identifier for the reserved node offering.\n"]
  node_type : string_ option; [@ocaml.doc "The node type of the reserved node.\n"]
  start_time : t_stamp option;
      [@ocaml.doc
        "The time the reservation started. You purchase a reserved node offering for a duration. \
         This is the start time of that duration.\n"]
  duration : integer option; [@ocaml.doc "The duration of the node reservation in seconds.\n"]
  fixed_price : double option;
      [@ocaml.doc "The fixed cost Amazon Redshift charges you for this reserved node.\n"]
  usage_price : double option;
      [@ocaml.doc "The hourly rate Amazon Redshift charges you for this reserved node.\n"]
  currency_code : string_ option; [@ocaml.doc "The currency code for the reserved cluster.\n"]
  node_count : integer option; [@ocaml.doc "The number of reserved compute nodes.\n"]
  state : string_ option;
      [@ocaml.doc
        "The state of the reserved compute node.\n\n\
        \ Possible Values:\n\
        \ \n\
        \  {ul\n\
        \        {-  pending-payment-This reserved node has recently been purchased, and the sale \
         has been approved, but payment has not yet been confirmed.\n\
        \            \n\
        \             }\n\
        \        {-  active-This reserved node is owned by the caller and is available for use.\n\
        \            \n\
        \             }\n\
        \        {-  payment-failed-Payment failed for the purchase attempt.\n\
        \            \n\
        \             }\n\
        \        {-  retired-The reserved node is no longer available. \n\
        \            \n\
        \             }\n\
        \        {-  exchanging-The owner is exchanging the reserved node for another reserved node.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  offering_type : string_ option;
      [@ocaml.doc
        "The anticipated utilization of the reserved node, as defined in the reserved node offering.\n"]
  recurring_charges : recurring_charge_list option;
      [@ocaml.doc "The recurring charges for the reserved node.\n"]
  reserved_node_offering_type : reserved_node_offering_type option; [@ocaml.doc "\n"]
}
[@@ocaml.doc
  "Describes a reserved node. You can call the [DescribeReservedNodeOfferings] API to obtain the \
   available reserved node offerings. \n"]

type nonrec accept_reserved_node_exchange_output_message = {
  exchanged_reserved_node : reserved_node option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec accept_reserved_node_exchange_input_message = {
  reserved_node_id : string_;
      [@ocaml.doc
        "A string representing the node identifier of the DC1 Reserved Node to be exchanged.\n"]
  target_reserved_node_offering_id : string_;
      [@ocaml.doc
        "The unique identifier of the DC2 Reserved Node offering to be used for the exchange. You \
         can obtain the value for the parameter by calling [GetReservedNodeExchangeOfferings] \n"]
}
[@@ocaml.doc ""]

type nonrec access_to_cluster_denied_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You are not authorized to access the cluster.\n"]

type nonrec access_to_snapshot_denied_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The owner of the specified snapshot has not authorized your account to access the snapshot.\n"]

type nonrec attribute_value_target = {
  attribute_value : string_ option; [@ocaml.doc "The value of the attribute.\n"]
}
[@@ocaml.doc "Describes an attribute value.\n"]

type nonrec attribute_value_list = attribute_value_target list [@@ocaml.doc ""]

type nonrec account_attribute = {
  attribute_name : string_ option; [@ocaml.doc "The name of the attribute.\n"]
  attribute_values : attribute_value_list option; [@ocaml.doc "A list of attribute values.\n"]
}
[@@ocaml.doc "A name value pair that describes an aspect of an account. \n"]

type nonrec attribute_list = account_attribute list [@@ocaml.doc ""]

type nonrec account_attribute_list = {
  account_attributes : attribute_list option;
      [@ocaml.doc "A list of attributes assigned to an account.\n"]
}
[@@ocaml.doc ""]

type nonrec account_with_restore_access = {
  account_id : string_ option;
      [@ocaml.doc
        "The identifier of an Amazon Web Services account authorized to restore a snapshot.\n"]
  account_alias : string_ option;
      [@ocaml.doc
        "The identifier of an Amazon Web Services support account authorized to restore a \
         snapshot. For Amazon Web Services Support, the identifier is [amazon-redshift-support]. \n"]
}
[@@ocaml.doc "Describes an Amazon Web Services account authorized to restore a snapshot.\n"]

type nonrec accounts_with_restore_access_list = account_with_restore_access list [@@ocaml.doc ""]

type nonrec action_type =
  | RESTORE_CLUSTER [@ocaml.doc ""]
  | RECOMMEND_NODE_CONFIG [@ocaml.doc ""]
  | RESIZE_CLUSTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec unauthorized_partner_integration_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The partner integration is not authorized.\n"]

type nonrec partner_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The name of the partner was not found.\n"]

type nonrec cluster_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The [ClusterIdentifier] parameter does not refer to an existing cluster. \n"]

type nonrec partner_integration_partner_name = string [@@ocaml.doc ""]

type nonrec partner_integration_database_name = string [@@ocaml.doc ""]

type nonrec partner_integration_output_message = {
  database_name : partner_integration_database_name option;
      [@ocaml.doc "The name of the database that receives data from the partner.\n"]
  partner_name : partner_integration_partner_name option;
      [@ocaml.doc "The name of the partner that is authorized to send data.\n"]
}
[@@ocaml.doc ""]

type nonrec partner_integration_cluster_identifier = string [@@ocaml.doc ""]

type nonrec partner_integration_account_id = string [@@ocaml.doc ""]

type nonrec partner_integration_input_message = {
  account_id : partner_integration_account_id;
      [@ocaml.doc "The Amazon Web Services account ID that owns the cluster.\n"]
  cluster_identifier : partner_integration_cluster_identifier;
      [@ocaml.doc "The cluster identifier of the cluster that receives data from the partner.\n"]
  database_name : partner_integration_database_name;
      [@ocaml.doc "The name of the database that receives data from the partner.\n"]
  partner_name : partner_integration_partner_name;
      [@ocaml.doc "The name of the partner that is authorized to send data.\n"]
}
[@@ocaml.doc ""]

type nonrec application_type = NONE [@ocaml.doc ""] | LAKEHOUSE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec aqua_configuration_status =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | AUTO [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aqua_status =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | APPLYING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec aqua_configuration = {
  aqua_status : aqua_status option;
      [@ocaml.doc
        "This field is retired. Amazon Redshift automatically determines whether to use AQUA \
         (Advanced Query Accelerator).\n"]
  aqua_configuration_status : aqua_configuration_status option;
      [@ocaml.doc
        "This field is retired. Amazon Redshift automatically determines whether to use AQUA \
         (Advanced Query Accelerator).\n"]
}
[@@ocaml.doc
  "The operation that uses this structure is retired. Amazon Redshift automatically determines \
   whether to use AQUA (Advanced Query Accelerator).\n"]

type nonrec invalid_namespace_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The namespace isn't valid because the namespace doesn't exist. Provide a valid namespace.\n"]

type nonrec invalid_data_share_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "There is an error with the datashare.\n"]

type nonrec data_share_type = INTERNAL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec boolean_optional = bool [@@ocaml.doc ""]

type nonrec data_share_status =
  | ACTIVE [@ocaml.doc ""]
  | PENDING_AUTHORIZATION [@ocaml.doc ""]
  | AUTHORIZED [@ocaml.doc ""]
  | DEAUTHORIZED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_share_association = {
  consumer_identifier : string_ option;
      [@ocaml.doc
        "The name of the consumer accounts that have an association with a producer datashare.\n"]
  status : data_share_status option;
      [@ocaml.doc "The status of the datashare that is associated.\n"]
  consumer_region : string_ option;
      [@ocaml.doc
        "The Amazon Web Services Region of the consumer accounts that have an association with a \
         producer datashare.\n"]
  created_date : t_stamp option;
      [@ocaml.doc "The creation date of the datashare that is associated.\n"]
  status_change_date : t_stamp option;
      [@ocaml.doc "The status change data of the datashare that is associated.\n"]
  producer_allowed_writes : boolean_optional option;
      [@ocaml.doc
        "Specifies whether write operations were allowed during data share authorization.\n"]
  consumer_accepted_writes : boolean_optional option;
      [@ocaml.doc
        "Specifies whether write operations were allowed during data share association.\n"]
}
[@@ocaml.doc "The association of a datashare from a producer account with a data consumer. \n"]

type nonrec data_share_association_list = data_share_association list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec data_share = {
  data_share_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the datashare that the consumer is to use.\n"]
  producer_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the producer namespace.\n"]
  allow_publicly_accessible_consumers : boolean_ option;
      [@ocaml.doc
        "A value that specifies whether the datashare can be shared to a publicly accessible \
         cluster.\n"]
  data_share_associations : data_share_association_list option;
      [@ocaml.doc
        "A value that specifies when the datashare has an association between producer and data \
         consumers.\n"]
  managed_by : string_ option;
      [@ocaml.doc "The identifier of a datashare to show its managing entity.\n"]
  data_share_type : data_share_type option;
      [@ocaml.doc " The type of the datashare created by RegisterNamespace.\n"]
}
[@@ocaml.doc ""]

type nonrec associate_data_share_consumer_message = {
  data_share_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the datashare that the consumer is to use.\n"]
  associate_entire_account : boolean_optional option;
      [@ocaml.doc
        "A value that specifies whether the datashare is associated with the entire account.\n"]
  consumer_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the consumer namespace associated with the datashare.\n"]
  consumer_region : string_ option;
      [@ocaml.doc
        "From a datashare consumer account, associates a datashare with all existing and future \
         namespaces in the specified Amazon Web Services Region.\n"]
  allow_writes : boolean_optional option;
      [@ocaml.doc "If set to true, allows write operations for a datashare.\n"]
}
[@@ocaml.doc ""]

type nonrec schedule_state =
  | MODIFYING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec cluster_associated_to_schedule = {
  cluster_identifier : string_ option; [@ocaml.doc "\n"]
  schedule_association_state : schedule_state option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec associated_cluster_list = cluster_associated_to_schedule list [@@ocaml.doc ""]

type nonrec certificate_association = {
  custom_domain_name : string_ option;
      [@ocaml.doc "The custom domain name for the certificate association.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc "The cluster identifier for the certificate association.\n"]
}
[@@ocaml.doc
  "A cluster ID and custom domain name tied to a specific certificate. These are typically \
   returned in a list.\n"]

type nonrec certificate_association_list = certificate_association list [@@ocaml.doc ""]

type nonrec association = {
  custom_domain_certificate_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the certificate associated with the custom domain.\n"]
  custom_domain_certificate_expiry_date : t_stamp option;
      [@ocaml.doc "The expiration date for the certificate.\n"]
  certificate_associations : certificate_association_list option;
      [@ocaml.doc
        "A list of all associated clusters and domain names tied to a specific certificate.\n"]
}
[@@ocaml.doc "Contains information about the custom domain name association.\n"]

type nonrec association_list = association list [@@ocaml.doc ""]

type nonrec attribute_name_list = string_ list [@@ocaml.doc ""]

type nonrec authentication_profile_name_string = string [@@ocaml.doc ""]

type nonrec authentication_profile = {
  authentication_profile_name : authentication_profile_name_string option;
      [@ocaml.doc "The name of the authentication profile.\n"]
  authentication_profile_content : string_ option;
      [@ocaml.doc
        "The content of the authentication profile in JSON format. The maximum length of the JSON \
         string is determined by a quota for your account.\n"]
}
[@@ocaml.doc "Describes an authentication profile.\n"]

type nonrec authentication_profile_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The authentication profile already exists.\n"]

type nonrec authentication_profile_list = authentication_profile list [@@ocaml.doc ""]

type nonrec authentication_profile_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The authentication profile can't be found.\n"]

type nonrec authentication_profile_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The size or number of authentication profiles has exceeded the quota. The maximum length of the \
   JSON string and maximum number of authentication profiles is determined by a quota for your \
   account.\n"]

type nonrec authorization_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified CIDR block or EC2 security group is already authorized for the specified cluster \
   security group.\n"]

type nonrec authorization_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified CIDR IP range or EC2 security group is not authorized for the specified cluster \
   security group.\n"]

type nonrec authorization_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The authorization quota for the cluster security group has been reached.\n"]

type nonrec authorization_status = AUTHORIZED [@ocaml.doc ""] | REVOKING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invalid_cluster_security_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The state of the cluster security group is not [available]. \n"]

type nonrec cluster_security_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The cluster security group name does not refer to an existing cluster security group.\n"]

type nonrec tag = {
  key : string_ option; [@ocaml.doc "The key, or name, for the resource tag.\n"]
  value : string_ option; [@ocaml.doc "The value for the resource tag.\n"]
}
[@@ocaml.doc "A tag consisting of a name/value pair for a resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec ip_range = {
  status : string_ option; [@ocaml.doc "The status of the IP range, for example, \"authorized\".\n"]
  cidri_p : string_ option;
      [@ocaml.doc "The IP range in Classless Inter-Domain Routing (CIDR) notation.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the IP range.\n"]
}
[@@ocaml.doc "Describes an IP range used in a security group.\n"]

type nonrec ip_range_list = ip_range list [@@ocaml.doc ""]

type nonrec ec2_security_group = {
  status : string_ option; [@ocaml.doc "The status of the EC2 security group.\n"]
  ec2_security_group_name : string_ option; [@ocaml.doc "The name of the EC2 Security Group.\n"]
  ec2_security_group_owner_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account ID of the owner of the EC2 security group specified in \
         the [EC2SecurityGroupName] field. \n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the EC2 security group.\n"]
}
[@@ocaml.doc "Describes an Amazon EC2 security group.\n"]

type nonrec ec2_security_group_list = ec2_security_group list [@@ocaml.doc ""]

type nonrec cluster_security_group = {
  cluster_security_group_name : string_ option;
      [@ocaml.doc "The name of the cluster security group to which the operation was applied.\n"]
  description : string_ option; [@ocaml.doc "A description of the security group.\n"]
  ec2_security_groups : ec2_security_group_list option;
      [@ocaml.doc
        "A list of EC2 security groups that are permitted to access clusters associated with this \
         cluster security group.\n"]
  ip_ranges : ip_range_list option;
      [@ocaml.doc
        "A list of IP ranges (CIDR blocks) that are permitted to access clusters associated with \
         this cluster security group.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the cluster security group.\n"]
}
[@@ocaml.doc "Describes a security group.\n"]

type nonrec authorize_cluster_security_group_ingress_result = {
  cluster_security_group : cluster_security_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec authorize_cluster_security_group_ingress_message = {
  cluster_security_group_name : string_;
      [@ocaml.doc "The name of the security group to which the ingress rule is added.\n"]
  cidri_p : string_ option;
      [@ocaml.doc "The IP range to be added the Amazon Redshift security group.\n"]
  ec2_security_group_name : string_ option;
      [@ocaml.doc "The EC2 security group to be added the Amazon Redshift security group.\n"]
  ec2_security_group_owner_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account number of the owner of the security group specified by \
         the {i EC2SecurityGroupName} parameter. The Amazon Web Services Access Key ID is not an \
         acceptable value. \n\n\
        \ Example: [111122223333] \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec authorize_data_share_message = {
  data_share_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the datashare namespace that producers are to authorize \
         sharing for.\n"]
  consumer_identifier : string_;
      [@ocaml.doc
        "The identifier of the data consumer that is authorized to access the datashare. This \
         identifier is an Amazon Web Services account ID or a keyword, such as ADX.\n"]
  allow_writes : boolean_optional option;
      [@ocaml.doc "If set to true, allows write operations for a datashare.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_cluster_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified cluster is not in the [available] state. \n"]

type nonrec invalid_authorization_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The status of the authorization is not valid.\n"]

type nonrec endpoint_authorizations_per_cluster_limit_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The number of endpoint authorizations per cluster has exceeded its limit.\n"]

type nonrec endpoint_authorization_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The authorization already exists for this endpoint.\n"]

type nonrec vpc_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec endpoint_authorization = {
  grantor : string_ option;
      [@ocaml.doc "The Amazon Web Services account ID of the cluster owner.\n"]
  grantee : string_ option;
      [@ocaml.doc "The Amazon Web Services account ID of the grantee of the cluster.\n"]
  cluster_identifier : string_ option; [@ocaml.doc "The cluster identifier.\n"]
  authorize_time : t_stamp option;
      [@ocaml.doc "The time (UTC) when the authorization was created.\n"]
  cluster_status : string_ option; [@ocaml.doc "The status of the cluster.\n"]
  status : authorization_status option; [@ocaml.doc "The status of the authorization action.\n"]
  allowed_all_vp_cs : boolean_ option;
      [@ocaml.doc
        "Indicates whether all VPCs in the grantee account are allowed access to the cluster.\n"]
  allowed_vp_cs : vpc_identifier_list option;
      [@ocaml.doc "The VPCs allowed access to the cluster.\n"]
  endpoint_count : integer option;
      [@ocaml.doc "The number of Redshift-managed VPC endpoints created for the authorization.\n"]
}
[@@ocaml.doc
  "Describes an endpoint authorization for authorizing Redshift-managed VPC endpoint access to a \
   cluster across Amazon Web Services accounts.\n"]

type nonrec authorize_endpoint_access_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc "The cluster identifier of the cluster to grant access to.\n"]
  account : string_; [@ocaml.doc "The Amazon Web Services account ID to grant access to.\n"]
  vpc_ids : vpc_identifier_list option;
      [@ocaml.doc "The virtual private cloud (VPC) identifiers to grant access to.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The encryption key has exceeded its grant limit in Amazon Web Services KMS.\n"]

type nonrec invalid_cluster_snapshot_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified cluster snapshot is not in the [available] state, or other accounts are \
   authorized to access the snapshot. \n"]

type nonrec dependent_service_request_throttling_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request cannot be completed because a dependent service is throttling requests made by \
   Amazon Redshift on your behalf. Wait and retry the request.\n"]

type nonrec cluster_snapshot_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The snapshot identifier does not refer to an existing cluster snapshot.\n"]

type nonrec integer_optional = int [@@ocaml.doc ""]

type nonrec restorable_node_type_list = string_ list [@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec snapshot = {
  snapshot_identifier : string_ option;
      [@ocaml.doc "The snapshot identifier that is provided in the request.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc "The identifier of the cluster for which the snapshot was taken.\n"]
  snapshot_create_time : t_stamp option;
      [@ocaml.doc
        "The time (in UTC format) when Amazon Redshift began the snapshot. A snapshot contains a \
         copy of the cluster data as of this exact time.\n"]
  status : string_ option;
      [@ocaml.doc
        "The snapshot status. The value of the status depends on the API operation used: \n\n\
        \ {ul\n\
        \       {-   [CreateClusterSnapshot] and [CopyClusterSnapshot] returns status as \
         \"creating\". \n\
        \           \n\
        \            }\n\
        \       {-   [DescribeClusterSnapshots] returns status as \"creating\", \"available\", \
         \"final snapshot\", or \"failed\".\n\
        \           \n\
        \            }\n\
        \       {-   [DeleteClusterSnapshot] returns status as \"deleted\".\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  port : integer option; [@ocaml.doc "The port that the cluster is listening on.\n"]
  availability_zone : string_ option;
      [@ocaml.doc "The Availability Zone in which the cluster was created.\n"]
  cluster_create_time : t_stamp option;
      [@ocaml.doc "The time (UTC) when the cluster was originally created.\n"]
  master_username : string_ option; [@ocaml.doc "The admin user name for the cluster.\n"]
  cluster_version : string_ option;
      [@ocaml.doc "The version ID of the Amazon Redshift engine that is running on the cluster.\n"]
  engine_full_version : string_ option;
      [@ocaml.doc
        "The cluster version of the cluster used to create the snapshot. For example, 1.0.15503. \n"]
  snapshot_type : string_ option;
      [@ocaml.doc
        "The snapshot type. Snapshots created using [CreateClusterSnapshot] and \
         [CopyClusterSnapshot] are of type \"manual\". \n"]
  node_type : string_ option; [@ocaml.doc "The node type of the nodes in the cluster.\n"]
  number_of_nodes : integer option; [@ocaml.doc "The number of nodes in the cluster.\n"]
  db_name : string_ option;
      [@ocaml.doc "The name of the database that was created when the cluster was created.\n"]
  vpc_id : string_ option;
      [@ocaml.doc
        "The VPC identifier of the cluster if the snapshot is from a cluster in a VPC. Otherwise, \
         this field is not in the output.\n"]
  encrypted : boolean_ option;
      [@ocaml.doc "If [true], the data in the snapshot is encrypted at rest.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Key Management Service (KMS) key ID of the encryption key that was used to encrypt \
         data in the cluster from which the snapshot was taken.\n"]
  encrypted_with_hs_m : boolean_ option;
      [@ocaml.doc
        "A boolean that indicates whether the snapshot data is encrypted using the HSM keys of the \
         source cluster. [true] indicates that the data is encrypted using HSM keys.\n"]
  accounts_with_restore_access : accounts_with_restore_access_list option;
      [@ocaml.doc
        "A list of the Amazon Web Services accounts authorized to restore the snapshot. Returns \
         [null] if no accounts are authorized. Visible only to the snapshot owner. \n"]
  owner_account : string_ option;
      [@ocaml.doc
        "For manual snapshots, the Amazon Web Services account used to create or copy the \
         snapshot. For automatic snapshots, the owner of the cluster. The owner can perform all \
         snapshot actions, such as sharing a manual snapshot.\n"]
  total_backup_size_in_mega_bytes : double option;
      [@ocaml.doc
        "The size of the complete set of backup data that would be used to restore the cluster.\n"]
  actual_incremental_backup_size_in_mega_bytes : double option;
      [@ocaml.doc "The size of the incremental backup.\n"]
  backup_progress_in_mega_bytes : double option;
      [@ocaml.doc "The number of megabytes that have been transferred to the snapshot backup.\n"]
  current_backup_rate_in_mega_bytes_per_second : double option;
      [@ocaml.doc
        "The number of megabytes per second being transferred to the snapshot backup. Returns [0] \
         for a completed backup. \n"]
  estimated_seconds_to_completion : long option;
      [@ocaml.doc
        "The estimate of the time remaining before the snapshot backup will complete. Returns [0] \
         for a completed backup. \n"]
  elapsed_time_in_seconds : long option;
      [@ocaml.doc
        "The amount of time an in-progress snapshot backup has been running, or the amount of time \
         it took a completed backup to finish.\n"]
  source_region : string_ option;
      [@ocaml.doc "The source region from which the snapshot was copied.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the cluster snapshot.\n"]
  restorable_node_types : restorable_node_type_list option;
      [@ocaml.doc "The list of node types that this cluster snapshot is able to restore into.\n"]
  enhanced_vpc_routing : boolean_ option;
      [@ocaml.doc
        "An option that specifies whether to create the cluster with enhanced VPC routing enabled. \
         To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For \
         more information, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html}Enhanced \
         VPC Routing} in the Amazon Redshift Cluster Management Guide.\n\n\
        \ If this option is [true], enhanced VPC routing is enabled. \n\
        \ \n\
        \  Default: false\n\
        \  "]
  maintenance_track_name : string_ option;
      [@ocaml.doc "The name of the maintenance track for the snapshot.\n"]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that a manual snapshot is retained. If the value is -1, the manual \
         snapshot is retained indefinitely. \n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ "]
  manual_snapshot_remaining_days : integer_optional option;
      [@ocaml.doc "The number of days until a manual snapshot will pass its retention period.\n"]
  snapshot_retention_start_time : t_stamp option;
      [@ocaml.doc "A timestamp representing the start of the retention period for the snapshot.\n"]
  master_password_secret_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the cluster's admin user credentials secret.\n"]
  master_password_secret_kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's \
         admin credentials secret.\n"]
  snapshot_arn : string_ option; [@ocaml.doc "The Amazon Resource Name (ARN) of the snapshot.\n"]
}
[@@ocaml.doc "Describes a snapshot.\n"]

type nonrec authorize_snapshot_access_result = { snapshot : snapshot option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec authorize_snapshot_access_message = {
  snapshot_identifier : string_ option;
      [@ocaml.doc "The identifier of the snapshot the account is authorized to restore.\n"]
  snapshot_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the snapshot to authorize access to.\n"]
  snapshot_cluster_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the cluster the snapshot was created from.\n\n\
        \ {ul\n\
        \       {-   {i If the snapshot to access doesn't exist and the associated IAM policy \
         doesn't allow access to all (*) snapshots} - This parameter is required. Otherwise, \
         permissions aren't available to check if the snapshot exists.\n\
        \           \n\
        \            }\n\
        \       {-   {i If the snapshot to access exists} - This parameter isn't required. \
         Redshift can retrieve the cluster identifier and use it to validate snapshot \
         authorization.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  account_with_restore_access : string_;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account authorized to restore the specified \
         snapshot.\n\n\
        \ To share a snapshot with Amazon Web Services Support, specify amazon-redshift-support.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec authorized_audience_list = string_ list [@@ocaml.doc ""]

type nonrec authorized_token_issuer = {
  trusted_token_issuer_arn : string_ option;
      [@ocaml.doc
        "The ARN for the authorized token issuer for integrating Amazon Redshift with IDC Identity \
         Center.\n"]
  authorized_audiences_list : authorized_audience_list option;
      [@ocaml.doc
        "The list of audiences for the authorized token issuer for integrating Amazon Redshift \
         with IDC Identity Center.\n"]
}
[@@ocaml.doc
  "The authorized token issuer for the Amazon Redshift IAM Identity Center application.\n"]

type nonrec authorized_token_issuer_list = authorized_token_issuer list [@@ocaml.doc ""]

type nonrec supported_platform = { name : string_ option [@ocaml.doc "\n"] }
[@@ocaml.doc "A list of supported platforms for orderable clusters.\n"]

type nonrec supported_platforms_list = supported_platform list [@@ocaml.doc ""]

type nonrec availability_zone = {
  name : string_ option; [@ocaml.doc "The name of the availability zone.\n"]
  supported_platforms : supported_platforms_list option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "Describes an availability zone.\n"]

type nonrec availability_zone_list = availability_zone list [@@ocaml.doc ""]

type nonrec batch_delete_request_size_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The maximum number for a batch delete of snapshots has been reached. The limit is 100. \n"]

type nonrec snapshot_error_message = {
  snapshot_identifier : string_ option;
      [@ocaml.doc "A unique identifier for the snapshot returning the error.\n"]
  snapshot_cluster_identifier : string_ option;
      [@ocaml.doc "A unique identifier for the cluster.\n"]
  failure_code : string_ option; [@ocaml.doc "The failure code for the error.\n"]
  failure_reason : string_ option; [@ocaml.doc "The text message describing the error.\n"]
}
[@@ocaml.doc "Describes the errors returned by a snapshot.\n"]

type nonrec batch_snapshot_operation_error_list = snapshot_error_message list [@@ocaml.doc ""]

type nonrec snapshot_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec batch_delete_cluster_snapshots_result = {
  resources : snapshot_identifier_list option;
      [@ocaml.doc "A list of the snapshot identifiers that were deleted. \n"]
  errors : batch_snapshot_operation_error_list option;
      [@ocaml.doc "A list of any errors returned.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_snapshot_message = {
  snapshot_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the manual snapshot to be deleted.\n\n\
        \ Constraints: Must be the name of an existing snapshot that is in the [available], \
         [failed], or [cancelled] state.\n\
        \ "]
  snapshot_cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier of the cluster the snapshot was created from. This parameter is \
         required if your IAM user has a policy containing a snapshot resource element that \
         specifies anything other than * for the cluster name.\n\n\
        \ Constraints: Must be the name of valid cluster.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec delete_cluster_snapshot_message_list = delete_cluster_snapshot_message list
[@@ocaml.doc ""]

type nonrec batch_delete_cluster_snapshots_request = {
  identifiers : delete_cluster_snapshot_message_list;
      [@ocaml.doc "A list of identifiers for the snapshots that you want to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_retention_period_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The retention period specified is either in the past or is not a valid value.\n\n\
  \ The value must be either -1 or an integer between 1 and 3,653.\n\
  \ "]

type nonrec batch_modify_cluster_snapshots_limit_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The maximum number for snapshot identifiers has been reached. The limit is 100. \n"]

type nonrec batch_snapshot_operation_errors = snapshot_error_message list [@@ocaml.doc ""]

type nonrec batch_modify_cluster_snapshots_output_message = {
  resources : snapshot_identifier_list option;
      [@ocaml.doc "A list of the snapshots that were modified.\n"]
  errors : batch_snapshot_operation_errors option; [@ocaml.doc "A list of any errors returned.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_modify_cluster_snapshots_message = {
  snapshot_identifier_list : snapshot_identifier_list;
      [@ocaml.doc "A list of snapshot identifiers you want to modify.\n"]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that a manual snapshot is retained. If you specify the value -1, the \
         manual snapshot is retained indefinitely.\n\n\
        \ The number must be either -1 or an integer between 1 and 3,653.\n\
        \ \n\
        \  If you decrease the manual snapshot retention period from its current value, existing \
         manual snapshots that fall outside of the new retention period will return an error. If \
         you want to suppress the errors and delete the snapshots, use the force option. \n\
        \  "]
  force : boolean_ option;
      [@ocaml.doc
        "A boolean value indicating whether to override an exception if the retention period has \
         passed. \n"]
}
[@@ocaml.doc ""]

type nonrec bucket_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Could not find the specified S3 bucket.\n"]

type nonrec resize_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A resize operation for the specified cluster is not found.\n"]

type nonrec double_optional = float [@@ocaml.doc ""]

type nonrec long_optional = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec import_tables_not_started = string_ list [@@ocaml.doc ""]

type nonrec import_tables_in_progress = string_ list [@@ocaml.doc ""]

type nonrec import_tables_completed = string_ list [@@ocaml.doc ""]

type nonrec resize_progress_message = {
  target_node_type : string_ option;
      [@ocaml.doc
        "The node type that the cluster will have after the resize operation is complete.\n"]
  target_number_of_nodes : integer_optional option;
      [@ocaml.doc
        "The number of nodes that the cluster will have after the resize operation is complete.\n"]
  target_cluster_type : string_ option;
      [@ocaml.doc
        "The cluster type after the resize operation is complete.\n\n\
        \ Valid Values: [multi-node] | [single-node] \n\
        \ "]
  status : string_ option;
      [@ocaml.doc
        "The status of the resize operation.\n\n\
        \ Valid Values: [NONE] | [IN_PROGRESS] | [FAILED] | [SUCCEEDED] | [CANCELLING] \n\
        \ "]
  import_tables_completed : import_tables_completed option;
      [@ocaml.doc
        "The names of tables that have been completely imported .\n\n\
        \ Valid Values: List of table names.\n\
        \ "]
  import_tables_in_progress : import_tables_in_progress option;
      [@ocaml.doc
        "The names of tables that are being currently imported.\n\n\
        \ Valid Values: List of table names.\n\
        \ "]
  import_tables_not_started : import_tables_not_started option;
      [@ocaml.doc
        "The names of tables that have not been yet imported.\n\n\
        \ Valid Values: List of table names\n\
        \ "]
  avg_resize_rate_in_mega_bytes_per_second : double_optional option;
      [@ocaml.doc
        "The average rate of the resize operation over the last few minutes, measured in megabytes \
         per second. After the resize operation completes, this value shows the average rate of \
         the entire resize operation.\n"]
  total_resize_data_in_mega_bytes : long_optional option;
      [@ocaml.doc
        "The estimated total amount of data, in megabytes, on the cluster before the resize \
         operation began.\n"]
  progress_in_mega_bytes : long_optional option;
      [@ocaml.doc
        "While the resize operation is in progress, this value shows the current amount of data, \
         in megabytes, that has been processed so far. When the resize operation is complete, this \
         value shows the total amount of data, in megabytes, on the cluster, which may be more or \
         less than TotalResizeDataInMegaBytes (the estimated total amount of data before resize).\n"]
  elapsed_time_in_seconds : long_optional option;
      [@ocaml.doc
        "The amount of seconds that have elapsed since the resize operation began. After the \
         resize operation completes, this value shows the total actual time, in seconds, for the \
         resize operation.\n"]
  estimated_time_to_completion_in_seconds : long_optional option;
      [@ocaml.doc
        "The estimated time remaining, in seconds, until the resize operation is complete. This \
         value is calculated based on the average resize rate and the estimated amount of data \
         remaining to be processed. Once the resize operation is complete, this value will be 0.\n"]
  resize_type : string_ option;
      [@ocaml.doc
        "An enum with possible values of [ClassicResize] and [ElasticResize]. These values \
         describe the type of resize operation being performed. \n"]
  message : string_ option;
      [@ocaml.doc "An optional string to provide additional details about the resize action.\n"]
  target_encryption_type : string_ option;
      [@ocaml.doc
        "The type of encryption for the cluster after the resize is complete.\n\n\
        \ Possible values are [KMS] and [None]. \n\
        \ "]
  data_transfer_progress_percent : double_optional option;
      [@ocaml.doc "The percent of data transferred from source cluster to target cluster.\n"]
}
[@@ocaml.doc "Describes the result of a cluster resize operation.\n"]

type nonrec cancel_resize_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier for the cluster that you want to cancel a resize operation for.\n"]
}
[@@ocaml.doc ""]

type nonrec catalog_name_string = string [@@ocaml.doc ""]

type nonrec cluster_node = {
  node_role : string_ option; [@ocaml.doc "Whether the node is a leader node or a compute node.\n"]
  private_ip_address : string_ option;
      [@ocaml.doc "The private IP address of a node within a cluster.\n"]
  public_ip_address : string_ option;
      [@ocaml.doc "The public IP address of a node within a cluster.\n"]
}
[@@ocaml.doc "The identifier of a node in a cluster.\n"]

type nonrec cluster_nodes_list = cluster_node list [@@ocaml.doc ""]

type nonrec secondary_cluster_info = {
  availability_zone : string_ option;
      [@ocaml.doc
        "The name of the Availability Zone in which the secondary compute unit of the cluster is \
         located.\n"]
  cluster_nodes : cluster_nodes_list option;
      [@ocaml.doc "The nodes in the secondary compute unit.\n"]
}
[@@ocaml.doc "The AvailabilityZone and ClusterNodes information of the secondary compute unit.\n"]

type nonrec reserved_node_exchange_status_type =
  | REQUESTED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | RETRYING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reserved_node_exchange_status = {
  reserved_node_exchange_request_id : string_ option;
      [@ocaml.doc "The identifier of the reserved-node exchange request.\n"]
  status : reserved_node_exchange_status_type option;
      [@ocaml.doc
        "The status of the reserved-node exchange request. Statuses include in-progress and \
         requested.\n"]
  request_time : t_stamp option;
      [@ocaml.doc "A date and time that indicate when the reserved-node exchange was requested.\n"]
  source_reserved_node_id : string_ option;
      [@ocaml.doc "The identifier of the source reserved node.\n"]
  source_reserved_node_type : string_ option;
      [@ocaml.doc "The source reserved-node type, for example ra3.4xlarge.\n"]
  source_reserved_node_count : integer option;
      [@ocaml.doc "The source reserved-node count in the cluster.\n"]
  target_reserved_node_offering_id : string_ option;
      [@ocaml.doc "The identifier of the target reserved node offering.\n"]
  target_reserved_node_type : string_ option;
      [@ocaml.doc "The node type of the target reserved node, for example ra3.4xlarge.\n"]
  target_reserved_node_count : integer option;
      [@ocaml.doc "The count of target reserved nodes in the cluster.\n"]
}
[@@ocaml.doc
  "Reserved-node status details, such as the source reserved-node identifier, the target \
   reserved-node identifier, the node type, the node count, and other details.\n"]

type nonrec resize_info = {
  resize_type : string_ option; [@ocaml.doc "Returns the value [ClassicResize].\n"]
  allow_cancel_resize : boolean_ option;
      [@ocaml.doc "A boolean value indicating if the resize operation can be cancelled.\n"]
}
[@@ocaml.doc "Describes a resize operation.\n"]

type nonrec deferred_maintenance_window = {
  defer_maintenance_identifier : string_ option;
      [@ocaml.doc "A unique identifier for the maintenance window.\n"]
  defer_maintenance_start_time : t_stamp option;
      [@ocaml.doc " A timestamp for the beginning of the time period when we defer maintenance.\n"]
  defer_maintenance_end_time : t_stamp option;
      [@ocaml.doc " A timestamp for the end of the time period when we defer maintenance.\n"]
}
[@@ocaml.doc "Describes a deferred maintenance window\n"]

type nonrec deferred_maintenance_windows_list = deferred_maintenance_window list [@@ocaml.doc ""]

type nonrec pending_actions_list = string_ list [@@ocaml.doc ""]

type nonrec cluster_iam_role = {
  iam_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role, for example, \
         [arn:aws:iam::123456789012:role/RedshiftCopyUnload]. \n"]
  apply_status : string_ option;
      [@ocaml.doc
        "A value that describes the status of the IAM role's association with an Amazon Redshift \
         cluster.\n\n\
        \ The following are possible statuses and descriptions.\n\
        \ \n\
        \  {ul\n\
        \        {-   [in-sync]: The role is available for use by the cluster.\n\
        \            \n\
        \             }\n\
        \        {-   [adding]: The role is in the process of being associated with the cluster.\n\
        \            \n\
        \             }\n\
        \        {-   [removing]: The role is in the process of being disassociated with the \
         cluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "An Identity and Access Management (IAM) role that can be used by the associated Amazon Redshift \
   cluster to access other Amazon Web Services services.\n"]

type nonrec cluster_iam_role_list = cluster_iam_role list [@@ocaml.doc ""]

type nonrec elastic_ip_status = {
  elastic_ip : string_ option; [@ocaml.doc "The elastic IP (EIP) address for the cluster.\n"]
  status : string_ option; [@ocaml.doc "The status of the elastic IP (EIP) address.\n"]
}
[@@ocaml.doc "Describes the status of the elastic IP (EIP) address.\n"]

type nonrec cluster_snapshot_copy_status = {
  destination_region : string_ option;
      [@ocaml.doc
        "The destination region that snapshots are automatically copied to when cross-region \
         snapshot copy is enabled.\n"]
  retention_period : long option;
      [@ocaml.doc
        "The number of days that automated snapshots are retained in the destination region after \
         they are copied from a source region.\n"]
  manual_snapshot_retention_period : integer option;
      [@ocaml.doc
        "The number of days that automated snapshots are retained in the destination region after \
         they are copied from a source region. If the value is -1, the manual snapshot is retained \
         indefinitely. \n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ "]
  snapshot_copy_grant_name : string_ option; [@ocaml.doc "The name of the snapshot copy grant.\n"]
}
[@@ocaml.doc
  "Returns the destination region and retention period that are configured for cross-region \
   snapshot copy.\n"]

type nonrec hsm_status = {
  hsm_client_certificate_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to \
         retrieve the data encryption keys stored in an HSM.\n"]
  hsm_configuration_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM configuration that contains the information the Amazon \
         Redshift cluster can use to retrieve and store keys in an HSM.\n"]
  status : string_ option;
      [@ocaml.doc
        "Reports whether the Amazon Redshift cluster has finished applying any HSM settings \
         changes specified in a modify cluster command.\n\n\
        \ Values: active, applying\n\
        \ "]
}
[@@ocaml.doc "Describes the status of changes to HSM settings.\n"]

type nonrec data_transfer_progress = {
  status : string_ option;
      [@ocaml.doc
        "Describes the status of the cluster. While the transfer is in progress the status is \
         [transferringdata].\n"]
  current_rate_in_mega_bytes_per_second : double_optional option;
      [@ocaml.doc "Describes the data transfer rate in MB's per second.\n"]
  total_data_in_mega_bytes : long option;
      [@ocaml.doc "Describes the total amount of data to be transfered in megabytes.\n"]
  data_transferred_in_mega_bytes : long option;
      [@ocaml.doc "Describes the total amount of data that has been transfered in MB's.\n"]
  estimated_time_to_completion_in_seconds : long_optional option;
      [@ocaml.doc "Describes the estimated number of seconds remaining to complete the transfer.\n"]
  elapsed_time_in_seconds : long_optional option;
      [@ocaml.doc "Describes the number of seconds that have elapsed during the data transfer.\n"]
}
[@@ocaml.doc
  "Describes the status of a cluster while it is in the process of resizing with an incremental \
   resize.\n"]

type nonrec restore_status = {
  status : string_ option;
      [@ocaml.doc
        "The status of the restore action. Returns starting, restoring, completed, or failed.\n"]
  current_restore_rate_in_mega_bytes_per_second : double option;
      [@ocaml.doc
        "The number of megabytes per second being transferred from the backup storage. Returns the \
         average rate for a completed backup. This field is only updated when you restore to DC2 \
         node types. \n"]
  snapshot_size_in_mega_bytes : long option;
      [@ocaml.doc
        "The size of the set of snapshot data used to restore the cluster. This field is only \
         updated when you restore to DC2 node types. \n"]
  progress_in_mega_bytes : long option;
      [@ocaml.doc
        "The number of megabytes that have been transferred from snapshot storage. This field is \
         only updated when you restore to DC2 node types. \n"]
  elapsed_time_in_seconds : long option;
      [@ocaml.doc
        "The amount of time an in-progress restore has been running, or the amount of time it took \
         a completed restore to finish. This field is only updated when you restore to DC2 node \
         types. \n"]
  estimated_time_to_completion_in_seconds : long option;
      [@ocaml.doc
        "The estimate of the time remaining before the restore will complete. Returns 0 for a \
         completed restore. This field is only updated when you restore to DC2 node types. \n"]
}
[@@ocaml.doc
  "Describes the status of a cluster restore action. Returns null if the cluster was not created \
   by restoring a snapshot.\n"]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec pending_modified_values = {
  master_user_password : sensitive_string option;
      [@ocaml.doc "The pending or in-progress change of the admin user password for the cluster.\n"]
  node_type : string_ option;
      [@ocaml.doc "The pending or in-progress change of the cluster's node type.\n"]
  number_of_nodes : integer_optional option;
      [@ocaml.doc "The pending or in-progress change of the number of nodes in the cluster.\n"]
  cluster_type : string_ option;
      [@ocaml.doc "The pending or in-progress change of the cluster type.\n"]
  cluster_version : string_ option;
      [@ocaml.doc "The pending or in-progress change of the service version.\n"]
  automated_snapshot_retention_period : integer_optional option;
      [@ocaml.doc "The pending or in-progress change of the automated snapshot retention period.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc "The pending or in-progress change of the new identifier for the cluster.\n"]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "The pending or in-progress change of the ability to connect to the cluster from the \
         public network.\n"]
  enhanced_vpc_routing : boolean_optional option;
      [@ocaml.doc
        "An option that specifies whether to create the cluster with enhanced VPC routing enabled. \
         To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For \
         more information, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html}Enhanced \
         VPC Routing} in the Amazon Redshift Cluster Management Guide.\n\n\
        \ If this option is [true], enhanced VPC routing is enabled. \n\
        \ \n\
        \  Default: false\n\
        \  "]
  maintenance_track_name : string_ option;
      [@ocaml.doc
        "The name of the maintenance track that the cluster will change to during the next \
         maintenance window.\n"]
  encryption_type : string_ option;
      [@ocaml.doc "The encryption type for a cluster. Possible values are: KMS and None. \n"]
}
[@@ocaml.doc
  "Describes cluster attributes that are in a pending state. A change to one or more the \
   attributes was requested and is in progress or will be applied.\n"]

type nonrec cluster_parameter_status = {
  parameter_name : string_ option; [@ocaml.doc "The name of the parameter.\n"]
  parameter_apply_status : string_ option;
      [@ocaml.doc
        "The status of the parameter that indicates whether the parameter is in sync with the \
         database, waiting for a cluster reboot, or encountered an error when being applied.\n\n\
        \ The following are possible statuses and descriptions.\n\
        \ \n\
        \  {ul\n\
        \        {-   [in-sync]: The parameter value is in sync with the database.\n\
        \            \n\
        \             }\n\
        \        {-   [pending-reboot]: The parameter value will be applied after the cluster \
         reboots.\n\
        \            \n\
        \             }\n\
        \        {-   [applying]: The parameter value is being applied to the database.\n\
        \            \n\
        \             }\n\
        \        {-   [invalid-parameter]: Cannot apply the parameter value because it has an \
         invalid value or syntax.\n\
        \            \n\
        \             }\n\
        \        {-   [apply-deferred]: The parameter contains static property changes. The \
         changes are deferred until the cluster reboots.\n\
        \            \n\
        \             }\n\
        \        {-   [apply-error]: Cannot connect to the cluster. The parameter change will be \
         applied after the cluster reboots.\n\
        \            \n\
        \             }\n\
        \        {-   [unknown-error]: Cannot apply the parameter change right now. The change \
         will be applied after the cluster reboots.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  parameter_apply_error_description : string_ option;
      [@ocaml.doc "The error that prevented the parameter from being applied to the database.\n"]
}
[@@ocaml.doc "Describes the status of a parameter group.\n"]

type nonrec cluster_parameter_status_list = cluster_parameter_status list [@@ocaml.doc ""]

type nonrec cluster_parameter_group_status = {
  parameter_group_name : string_ option; [@ocaml.doc "The name of the cluster parameter group.\n"]
  parameter_apply_status : string_ option; [@ocaml.doc "The status of parameter updates.\n"]
  cluster_parameter_status_list : cluster_parameter_status_list option;
      [@ocaml.doc
        "The list of parameter statuses.\n\n\
        \  For more information about parameters and parameter groups, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
         Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
        \ "]
}
[@@ocaml.doc "Describes the status of a parameter group.\n"]

type nonrec cluster_parameter_group_status_list = cluster_parameter_group_status list
[@@ocaml.doc ""]

type nonrec vpc_security_group_membership = {
  vpc_security_group_id : string_ option; [@ocaml.doc "The identifier of the VPC security group.\n"]
  status : string_ option; [@ocaml.doc "The status of the VPC security group.\n"]
}
[@@ocaml.doc "Describes the members of a VPC security group.\n"]

type nonrec vpc_security_group_membership_list = vpc_security_group_membership list [@@ocaml.doc ""]

type nonrec cluster_security_group_membership = {
  cluster_security_group_name : string_ option;
      [@ocaml.doc "The name of the cluster security group.\n"]
  status : string_ option; [@ocaml.doc "The status of the cluster security group.\n"]
}
[@@ocaml.doc "Describes a cluster security group.\n"]

type nonrec cluster_security_group_membership_list = cluster_security_group_membership list
[@@ocaml.doc ""]

type nonrec network_interface = {
  network_interface_id : string_ option; [@ocaml.doc "The network interface identifier. \n"]
  subnet_id : string_ option; [@ocaml.doc "The subnet identifier. \n"]
  private_ip_address : string_ option;
      [@ocaml.doc "The IPv4 address of the network interface within the subnet. \n"]
  availability_zone : string_ option; [@ocaml.doc "The Availability Zone. \n"]
  ipv6_address : string_ option;
      [@ocaml.doc "The IPv6 address of the network interface within the subnet. \n"]
}
[@@ocaml.doc "Describes a network interface. \n"]

type nonrec network_interface_list = network_interface list [@@ocaml.doc ""]

type nonrec vpc_endpoint = {
  vpc_endpoint_id : string_ option;
      [@ocaml.doc
        "The connection endpoint ID for connecting an Amazon Redshift cluster through the proxy.\n"]
  vpc_id : string_ option; [@ocaml.doc "The VPC identifier that the endpoint is associated. \n"]
  network_interfaces : network_interface_list option;
      [@ocaml.doc
        "One or more network interfaces of the endpoint. Also known as an interface endpoint. \n"]
}
[@@ocaml.doc
  "The connection endpoint for connecting to an Amazon Redshift cluster through the proxy.\n"]

type nonrec vpc_endpoints_list = vpc_endpoint list [@@ocaml.doc ""]

type nonrec endpoint = {
  address : string_ option; [@ocaml.doc "The DNS address of the Cluster.\n"]
  port : integer option; [@ocaml.doc "The port that the database engine is listening on.\n"]
  vpc_endpoints : vpc_endpoints_list option; [@ocaml.doc "Describes a connection endpoint.\n"]
}
[@@ocaml.doc "Describes a connection endpoint.\n"]

type nonrec cluster = {
  cluster_identifier : string_ option; [@ocaml.doc "The unique identifier of the cluster.\n"]
  node_type : string_ option; [@ocaml.doc "The node type for the nodes in the cluster.\n"]
  cluster_status : string_ option;
      [@ocaml.doc
        " The current state of the cluster. Possible values are the following:\n\n\
        \ {ul\n\
        \       {-   [available] \n\
        \           \n\
        \            }\n\
        \       {-   [available, prep-for-resize] \n\
        \           \n\
        \            }\n\
        \       {-   [available, resize-cleanup] \n\
        \           \n\
        \            }\n\
        \       {-   [cancelling-resize] \n\
        \           \n\
        \            }\n\
        \       {-   [creating] \n\
        \           \n\
        \            }\n\
        \       {-   [deleting] \n\
        \           \n\
        \            }\n\
        \       {-   [final-snapshot] \n\
        \           \n\
        \            }\n\
        \       {-   [hardware-failure] \n\
        \           \n\
        \            }\n\
        \       {-   [incompatible-hsm] \n\
        \           \n\
        \            }\n\
        \       {-   [incompatible-network] \n\
        \           \n\
        \            }\n\
        \       {-   [incompatible-parameters] \n\
        \           \n\
        \            }\n\
        \       {-   [incompatible-restore] \n\
        \           \n\
        \            }\n\
        \       {-   [modifying] \n\
        \           \n\
        \            }\n\
        \       {-   [paused] \n\
        \           \n\
        \            }\n\
        \       {-   [rebooting] \n\
        \           \n\
        \            }\n\
        \       {-   [renaming] \n\
        \           \n\
        \            }\n\
        \       {-   [resizing] \n\
        \           \n\
        \            }\n\
        \       {-   [rotating-keys] \n\
        \           \n\
        \            }\n\
        \       {-   [storage-full] \n\
        \           \n\
        \            }\n\
        \       {-   [updating-hsm] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  cluster_availability_status : string_ option;
      [@ocaml.doc
        "The availability status of the cluster for queries. Possible values are the following:\n\n\
        \ {ul\n\
        \       {-  Available - The cluster is available for queries. \n\
        \           \n\
        \            }\n\
        \       {-  Unavailable - The cluster is not available for queries.\n\
        \           \n\
        \            }\n\
        \       {-  Maintenance - The cluster is intermittently available for queries due to \
         maintenance activities.\n\
        \           \n\
        \            }\n\
        \       {-  Modifying - The cluster is intermittently available for queries due to changes \
         that modify the cluster.\n\
        \           \n\
        \            }\n\
        \       {-  Failed - The cluster failed and is not available for queries.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  modify_status : string_ option;
      [@ocaml.doc "The status of a modify operation, if any, initiated for the cluster.\n"]
  master_username : string_ option;
      [@ocaml.doc
        "The admin user name for the cluster. This name is used to connect to the database that is \
         specified in the {b DBName} parameter. \n"]
  db_name : string_ option;
      [@ocaml.doc
        "The name of the initial database that was created when the cluster was created. This same \
         name is returned for the life of the cluster. If an initial database was not specified, a \
         database named [dev]dev was created by default. \n"]
  endpoint : endpoint option; [@ocaml.doc "The connection endpoint.\n"]
  cluster_create_time : t_stamp option;
      [@ocaml.doc "The date and time that the cluster was created.\n"]
  automated_snapshot_retention_period : integer option;
      [@ocaml.doc "The number of days that automatic cluster snapshots are retained.\n"]
  manual_snapshot_retention_period : integer option;
      [@ocaml.doc
        "The default number of days to retain a manual snapshot. If the value is -1, the snapshot \
         is retained indefinitely. This setting doesn't change the retention period of existing \
         snapshots.\n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ "]
  cluster_security_groups : cluster_security_group_membership_list option;
      [@ocaml.doc
        "A list of cluster security group that are associated with the cluster. Each security \
         group is represented by an element that contains [ClusterSecurityGroup.Name] and \
         [ClusterSecurityGroup.Status] subelements. \n\n\
        \ Cluster security groups are used when the cluster is not created in an Amazon Virtual \
         Private Cloud (VPC). Clusters that are created in a VPC use VPC security groups, which \
         are listed by the {b VpcSecurityGroups} parameter. \n\
        \ "]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc
        "A list of Amazon Virtual Private Cloud (Amazon VPC) security groups that are associated \
         with the cluster. This parameter is returned only if the cluster is in a VPC.\n"]
  cluster_parameter_groups : cluster_parameter_group_status_list option;
      [@ocaml.doc
        "The list of cluster parameter groups that are associated with this cluster. Each \
         parameter group in the list is returned with its status.\n"]
  cluster_subnet_group_name : string_ option;
      [@ocaml.doc
        "The name of the subnet group that is associated with the cluster. This parameter is valid \
         only when the cluster is in a VPC.\n"]
  vpc_id : string_ option;
      [@ocaml.doc "The identifier of the VPC the cluster is in, if the cluster is in a VPC.\n"]
  availability_zone : string_ option;
      [@ocaml.doc "The name of the Availability Zone in which the cluster is located.\n"]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range, in Universal Coordinated Time (UTC), during which system \
         maintenance can occur.\n"]
  pending_modified_values : pending_modified_values option;
      [@ocaml.doc
        "A value that, if present, indicates that changes to the cluster are pending. Specific \
         pending changes are identified by subelements.\n"]
  cluster_version : string_ option;
      [@ocaml.doc "The version ID of the Amazon Redshift engine that is running on the cluster.\n"]
  allow_version_upgrade : boolean_ option;
      [@ocaml.doc
        "A boolean value that, if [true], indicates that major version upgrades will be applied \
         automatically to the cluster during the maintenance window. \n"]
  number_of_nodes : integer option; [@ocaml.doc "The number of compute nodes in the cluster.\n"]
  publicly_accessible : boolean_ option;
      [@ocaml.doc
        "A boolean value that, if [true], indicates that the cluster can be accessed from a public \
         network.\n\n\
        \ Default: false\n\
        \ "]
  encrypted : boolean_ option;
      [@ocaml.doc
        "A boolean value that, if [true], indicates that data in the cluster is encrypted at rest.\n"]
  restore_status : restore_status option;
      [@ocaml.doc
        "A value that describes the status of a cluster restore action. This parameter returns \
         null if the cluster was not created by restoring a snapshot.\n"]
  data_transfer_progress : data_transfer_progress option; [@ocaml.doc "\n"]
  hsm_status : hsm_status option;
      [@ocaml.doc
        "A value that reports whether the Amazon Redshift cluster has finished applying any \
         hardware security module (HSM) settings changes specified in a modify cluster command.\n\n\
        \ Values: active, applying\n\
        \ "]
  cluster_snapshot_copy_status : cluster_snapshot_copy_status option;
      [@ocaml.doc
        "A value that returns the destination region and retention period that are configured for \
         cross-region snapshot copy.\n"]
  cluster_public_key : string_ option; [@ocaml.doc "The public key for the cluster.\n"]
  cluster_nodes : cluster_nodes_list option; [@ocaml.doc "The nodes in the cluster.\n"]
  elastic_ip_status : elastic_ip_status option;
      [@ocaml.doc "The status of the elastic IP (EIP) address.\n"]
  cluster_revision_number : string_ option;
      [@ocaml.doc "The specific revision number of the database in the cluster.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the cluster.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Key Management Service (KMS) key ID of the encryption key used to encrypt data in the \
         cluster.\n"]
  enhanced_vpc_routing : boolean_ option;
      [@ocaml.doc
        "An option that specifies whether to create the cluster with enhanced VPC routing enabled. \
         To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For \
         more information, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html}Enhanced \
         VPC Routing} in the Amazon Redshift Cluster Management Guide.\n\n\
        \ If this option is [true], enhanced VPC routing is enabled. \n\
        \ \n\
        \  Default: false\n\
        \  "]
  iam_roles : cluster_iam_role_list option;
      [@ocaml.doc
        "A list of Identity and Access Management (IAM) roles that can be used by the cluster to \
         access other Amazon Web Services services.\n"]
  pending_actions : pending_actions_list option;
      [@ocaml.doc "Cluster operations that are waiting to be started.\n"]
  maintenance_track_name : string_ option;
      [@ocaml.doc "The name of the maintenance track for the cluster.\n"]
  elastic_resize_number_of_node_options : string_ option;
      [@ocaml.doc
        "The number of nodes that you can resize the cluster to with the elastic resize method. \n"]
  deferred_maintenance_windows : deferred_maintenance_windows_list option;
      [@ocaml.doc "Describes a group of [DeferredMaintenanceWindow] objects.\n"]
  snapshot_schedule_identifier : string_ option;
      [@ocaml.doc "A unique identifier for the cluster snapshot schedule.\n"]
  snapshot_schedule_state : schedule_state option;
      [@ocaml.doc "The current state of the cluster snapshot schedule.\n"]
  expected_next_snapshot_schedule_time : t_stamp option;
      [@ocaml.doc
        "The date and time when the next snapshot is expected to be taken for clusters with a \
         valid snapshot schedule and backups enabled. \n"]
  expected_next_snapshot_schedule_time_status : string_ option;
      [@ocaml.doc
        " The status of next expected snapshot for clusters having a valid snapshot schedule and \
         backups enabled. Possible values are the following:\n\n\
        \ {ul\n\
        \       {-  OnTrack - The next snapshot is expected to be taken on time. \n\
        \           \n\
        \            }\n\
        \       {-  Pending - The next snapshot is pending to be taken. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_maintenance_window_start_time : t_stamp option;
      [@ocaml.doc "The date and time in UTC when system maintenance can begin.\n"]
  resize_info : resize_info option;
      [@ocaml.doc
        "Returns the following:\n\n\
        \ {ul\n\
        \       {-  AllowCancelResize: a boolean value indicating if the resize operation can be \
         cancelled.\n\
        \           \n\
        \            }\n\
        \       {-  ResizeType: Returns ClassicResize\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  availability_zone_relocation_status : string_ option;
      [@ocaml.doc "Describes the status of the Availability Zone relocation operation.\n"]
  cluster_namespace_arn : string_ option;
      [@ocaml.doc "The namespace Amazon Resource Name (ARN) of the cluster.\n"]
  total_storage_capacity_in_mega_bytes : long_optional option;
      [@ocaml.doc "The total storage capacity of the cluster in megabytes. \n"]
  aqua_configuration : aqua_configuration option;
      [@ocaml.doc
        "This field is retired. Amazon Redshift automatically determines whether to use AQUA \
         (Advanced Query Accelerator).\n"]
  default_iam_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM role set as default for the cluster.\n"]
  reserved_node_exchange_status : reserved_node_exchange_status option;
      [@ocaml.doc
        "The status of the reserved-node exchange request. Statuses include in-progress and \
         requested.\n"]
  custom_domain_name : string_ option;
      [@ocaml.doc "The custom domain name associated with the cluster.\n"]
  custom_domain_certificate_arn : string_ option;
      [@ocaml.doc "The certificate Amazon Resource Name (ARN) for the custom domain name.\n"]
  custom_domain_certificate_expiry_date : t_stamp option;
      [@ocaml.doc
        "The expiration date for the certificate associated with the custom domain name.\n"]
  master_password_secret_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the cluster's admin user credentials secret.\n"]
  master_password_secret_kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's \
         admin credentials secret.\n"]
  ip_address_type : string_ option;
      [@ocaml.doc
        "The IP address type for the cluster. Possible values are [ipv4] and [dualstack].\n"]
  multi_a_z : string_ option;
      [@ocaml.doc
        "A boolean value that, if true, indicates that the cluster is deployed in two Availability \
         Zones.\n"]
  multi_az_secondary : secondary_cluster_info option;
      [@ocaml.doc "The secondary compute unit of a cluster, if Multi-AZ deployment is turned on.\n"]
  lakehouse_registration_status : string_ option;
      [@ocaml.doc
        "The status of the lakehouse registration for the cluster. Indicates whether the cluster \
         is successfully registered with Amazon Redshift federated permissions.\n"]
  catalog_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Glue data catalog associated with the cluster \
         enabled with Amazon Redshift federated permissions.\n"]
  extra_compute_for_automatic_optimization : string_ option;
      [@ocaml.doc
        "A boolean value that, if [true], indicates that the cluster allocates additional compute \
         resources to run automatic optimization operations.\n\n\
        \ Default: false\n\
        \ "]
}
[@@ocaml.doc "Describes a cluster.\n"]

type nonrec cluster_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The account already has a cluster with the given identifier.\n"]

type nonrec cluster_credentials = {
  db_user : string_ option;
      [@ocaml.doc
        "A database user name that is authorized to log on to the database [DbName] using the \
         password [DbPassword]. If the specified DbUser exists in the database, the new user name \
         has the same database permissions as the the user named in DbUser. By default, the user \
         is added to PUBLIC. If the [DbGroups] parameter is specifed, [DbUser] is added to the \
         listed groups for any sessions created using these credentials.\n"]
  db_password : sensitive_string option;
      [@ocaml.doc
        "A temporary password that authorizes the user name returned by [DbUser] to log on to the \
         database [DbName]. \n"]
  expiration : t_stamp option;
      [@ocaml.doc "The date and time the password in [DbPassword] expires.\n"]
}
[@@ocaml.doc
  "Temporary credentials with authorization to log on to an Amazon Redshift database. \n"]

type nonrec revision_target = {
  database_revision : string_ option;
      [@ocaml.doc
        "A unique string that identifies the version to update the cluster to. You can use this \
         value in [ModifyClusterDbRevision].\n"]
  description : string_ option;
      [@ocaml.doc
        "A string that describes the changes and features that will be applied to the cluster when \
         it is updated to the corresponding [ClusterDbRevision].\n"]
  database_revision_release_date : t_stamp option;
      [@ocaml.doc "The date on which the database revision was released.\n"]
}
[@@ocaml.doc "Describes a [RevisionTarget].\n"]

type nonrec revision_targets_list = revision_target list [@@ocaml.doc ""]

type nonrec cluster_db_revision = {
  cluster_identifier : string_ option; [@ocaml.doc "The unique identifier of the cluster.\n"]
  current_database_revision : string_ option;
      [@ocaml.doc "A string representing the current cluster version.\n"]
  database_revision_release_date : t_stamp option;
      [@ocaml.doc "The date on which the database revision was released.\n"]
  revision_targets : revision_targets_list option;
      [@ocaml.doc
        "A list of [RevisionTarget] objects, where each object describes the database revision \
         that a cluster can be updated to.\n"]
}
[@@ocaml.doc "Describes a [ClusterDbRevision].\n"]

type nonrec cluster_db_revisions_list = cluster_db_revision list [@@ocaml.doc ""]

type nonrec cluster_db_revisions_message = {
  marker : string_ option;
      [@ocaml.doc
        "A string representing the starting point for the next set of revisions. If a value is \
         returned in a response, you can retrieve the next set of revisions by providing the value \
         in the [marker] parameter and retrying the command. If the [marker] field is empty, all \
         revisions have already been returned.\n"]
  cluster_db_revisions : cluster_db_revisions_list option; [@ocaml.doc "A list of revisions.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_extended_credentials = {
  db_user : string_ option;
      [@ocaml.doc
        "A database user name that you provide when you connect to a database. The database user \
         is mapped 1:1 to the source IAM identity. \n"]
  db_password : sensitive_string option;
      [@ocaml.doc "A temporary password that you provide when you connect to a database.\n"]
  expiration : t_stamp option;
      [@ocaml.doc
        "The time (UTC) when the temporary password expires. After this timestamp, a log in with \
         the temporary password fails.\n"]
  next_refresh_time : t_stamp option; [@ocaml.doc "Reserved for future use.\n"]
}
[@@ocaml.doc ""]

type nonrec cluster_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec cluster_list = cluster list [@@ocaml.doc ""]

type nonrec cluster_on_latest_revision_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Cluster is already on the latest database revision.\n"]

type nonrec cluster_parameter_group = {
  parameter_group_name : string_ option; [@ocaml.doc "The name of the cluster parameter group.\n"]
  parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of the cluster parameter group family that this cluster parameter group is \
         compatible with.\n"]
  description : string_ option; [@ocaml.doc "The description of the parameter group.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the cluster parameter group.\n"]
}
[@@ocaml.doc "Describes a parameter group.\n"]

type nonrec cluster_parameter_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A cluster parameter group with the same name already exists.\n"]

type nonrec parameter_apply_type = Static [@ocaml.doc ""] | Dynamic [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parameter = {
  parameter_name : string_ option; [@ocaml.doc "The name of the parameter.\n"]
  parameter_value : string_ option;
      [@ocaml.doc
        "The value of the parameter. If [ParameterName] is [wlm_json_configuration], then the \
         maximum size of [ParameterValue] is 8000 characters.\n"]
  description : string_ option; [@ocaml.doc "A description of the parameter.\n"]
  source : string_ option;
      [@ocaml.doc "The source of the parameter value, such as \"engine-default\" or \"user\".\n"]
  data_type : string_ option; [@ocaml.doc "The data type of the parameter.\n"]
  allowed_values : string_ option; [@ocaml.doc "The valid range of values for the parameter.\n"]
  apply_type : parameter_apply_type option;
      [@ocaml.doc
        "Specifies how to apply the WLM configuration parameter. Some properties can be applied \
         dynamically, while other properties require that any associated clusters be rebooted for \
         the configuration changes to be applied. For more information about parameters and \
         parameter groups, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
         Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n"]
  is_modifiable : boolean_ option;
      [@ocaml.doc
        "If [true], the parameter can be modified. Some parameters have security or operational \
         implications that prevent them from being changed. \n"]
  minimum_engine_version : string_ option;
      [@ocaml.doc "The earliest engine version to which the parameter can apply.\n"]
}
[@@ocaml.doc "Describes a parameter in a cluster parameter group.\n"]

type nonrec parameters_list = parameter list [@@ocaml.doc ""]

type nonrec cluster_parameter_group_details = {
  parameters : parameters_list option;
      [@ocaml.doc
        "A list of [Parameter] instances. Each instance lists the parameters of one cluster \
         parameter group. \n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc "Contains the output from the [DescribeClusterParameters] action. \n"]

type nonrec cluster_parameter_group_name_message = {
  parameter_group_name : string_ option; [@ocaml.doc "The name of the cluster parameter group.\n"]
  parameter_group_status : string_ option;
      [@ocaml.doc
        "The status of the parameter group. For example, if you made a change to a parameter group \
         name-value pair, then the change could be pending a reboot of an associated cluster.\n"]
}
[@@ocaml.doc "\n"]

type nonrec cluster_parameter_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The parameter group name does not refer to an existing parameter group.\n"]

type nonrec cluster_parameter_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request would result in the user exceeding the allowed number of cluster parameter groups. \
   For information about increasing your quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec parameter_group_list = cluster_parameter_group list [@@ocaml.doc ""]

type nonrec cluster_parameter_groups_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  parameter_groups : parameter_group_list option;
      [@ocaml.doc
        "A list of [ClusterParameterGroup] instances. Each instance describes one cluster \
         parameter group. \n"]
}
[@@ocaml.doc "Contains the output from the [DescribeClusterParameterGroups] action. \n"]

type nonrec cluster_quota_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request would exceed the allowed number of cluster instances for this account. For \
   information about increasing your quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec cluster_security_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A cluster security group with the same name already exists.\n"]

type nonrec cluster_security_groups = cluster_security_group list [@@ocaml.doc ""]

type nonrec cluster_security_group_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  cluster_security_groups : cluster_security_groups option;
      [@ocaml.doc "A list of [ClusterSecurityGroup] instances. \n"]
}
[@@ocaml.doc "\n"]

type nonrec cluster_security_group_name_list = string_ list [@@ocaml.doc ""]

type nonrec cluster_security_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request would result in the user exceeding the allowed number of cluster security groups. \
   For information about increasing your quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec cluster_snapshot_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The value specified as a snapshot identifier is already used by an existing snapshot.\n"]

type nonrec cluster_snapshot_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request would result in the user exceeding the allowed number of cluster snapshots.\n"]

type nonrec value_string_list = string_ list [@@ocaml.doc ""]

type nonrec subnet = {
  subnet_identifier : string_ option; [@ocaml.doc "The identifier of the subnet.\n"]
  subnet_availability_zone : availability_zone option; [@ocaml.doc "\n"]
  subnet_status : string_ option; [@ocaml.doc "The status of the subnet.\n"]
}
[@@ocaml.doc "Describes a subnet.\n"]

type nonrec subnet_list = subnet list [@@ocaml.doc ""]

type nonrec cluster_subnet_group = {
  cluster_subnet_group_name : string_ option; [@ocaml.doc "The name of the cluster subnet group.\n"]
  description : string_ option; [@ocaml.doc "The description of the cluster subnet group.\n"]
  vpc_id : string_ option; [@ocaml.doc "The VPC ID of the cluster subnet group.\n"]
  subnet_group_status : string_ option;
      [@ocaml.doc
        "The status of the cluster subnet group. Possible values are [Complete], [Incomplete] and \
         [Invalid]. \n"]
  subnets : subnet_list option; [@ocaml.doc "A list of the VPC [Subnet] elements. \n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the cluster subnet group.\n"]
  supported_cluster_ip_address_types : value_string_list option;
      [@ocaml.doc
        "The IP address types supported by this cluster subnet group. Possible values are [ipv4] \
         and [dualstack].\n"]
}
[@@ocaml.doc "Describes a subnet group.\n"]

type nonrec cluster_subnet_group_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A {i ClusterSubnetGroupName} is already used by an existing cluster subnet group. \n"]

type nonrec cluster_subnet_groups = cluster_subnet_group list [@@ocaml.doc ""]

type nonrec cluster_subnet_group_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  cluster_subnet_groups : cluster_subnet_groups option;
      [@ocaml.doc "A list of [ClusterSubnetGroup] instances. \n"]
}
[@@ocaml.doc "Contains the output from the [DescribeClusterSubnetGroups] action. \n"]

type nonrec cluster_subnet_group_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The cluster subnet group name does not refer to an existing cluster subnet group.\n"]

type nonrec cluster_subnet_group_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request would result in user exceeding the allowed number of cluster subnet groups. For \
   information about increasing your quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec cluster_subnet_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request would result in user exceeding the allowed number of subnets in a cluster subnet \
   groups. For information about increasing your quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec cluster_version = {
  cluster_version : string_ option; [@ocaml.doc "The version number used by the cluster.\n"]
  cluster_parameter_group_family : string_ option;
      [@ocaml.doc "The name of the cluster parameter group family for the cluster.\n"]
  description : string_ option; [@ocaml.doc "The description of the cluster version.\n"]
}
[@@ocaml.doc
  "Describes a cluster version, including the parameter group family and description of the version.\n"]

type nonrec cluster_version_list = cluster_version list [@@ocaml.doc ""]

type nonrec cluster_versions_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  cluster_versions : cluster_version_list option; [@ocaml.doc "A list of [Version] elements. \n"]
}
[@@ocaml.doc "Contains the output from the [DescribeClusterVersions] action. \n"]

type nonrec clusters_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  clusters : cluster_list option;
      [@ocaml.doc "A list of [Cluster] objects, where each object describes one cluster. \n"]
}
[@@ocaml.doc "Contains the output from the [DescribeClusters] action. \n"]

type nonrec conflict_policy_update_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "There is a conflict while updating the resource policy.\n"]

type nonrec service_authorization = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connect = {
  authorization : service_authorization;
      [@ocaml.doc
        "Determines whether the Amazon Redshift connect integration is enabled or disabled for the \
         application.\n"]
}
[@@ocaml.doc "A structure that defines the Amazon Redshift connect service integration scope.\n"]

type nonrec consumer_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec copy_cluster_snapshot_result = { snapshot : snapshot option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec copy_cluster_snapshot_message = {
  source_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier for the source snapshot.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be the identifier for a valid automated snapshot whose state is \
         [available].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  source_snapshot_cluster_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the cluster the source snapshot was created from. This parameter is \
         required if your IAM user has a policy containing a snapshot resource element that \
         specifies anything other than * for the cluster name.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be the identifier for a valid cluster.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  target_snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier given to the new manual snapshot.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cannot be null, empty, or blank.\n\
        \            \n\
        \             }\n\
        \        {-  Must contain from 1 to 255 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique for the Amazon Web Services account that is making the request.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that a manual snapshot is retained. If the value is -1, the manual \
         snapshot is retained indefinitely. \n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ \n\
        \  The default value is -1.\n\
        \  "]
}
[@@ocaml.doc "\n"]

type nonrec copy_to_region_disabled_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Cross-region snapshot copy was temporarily disabled. Try your request again.\n"]

type nonrec invalid_authentication_profile_request_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The authentication profile request is not valid. The profile name can't be null or empty. The \
   authentication profile API operation must be available in the Amazon Web Services Region.\n"]

type nonrec create_authentication_profile_result = {
  authentication_profile_name : authentication_profile_name_string option;
      [@ocaml.doc "The name of the authentication profile that was created.\n"]
  authentication_profile_content : string_ option;
      [@ocaml.doc "The content of the authentication profile in JSON format.\n"]
}
[@@ocaml.doc ""]

type nonrec create_authentication_profile_message = {
  authentication_profile_name : authentication_profile_name_string;
      [@ocaml.doc "The name of the authentication profile to be created.\n"]
  authentication_profile_content : string_;
      [@ocaml.doc
        "The content of the authentication profile in JSON format. The maximum length of the JSON \
         string is determined by a quota for your account.\n"]
}
[@@ocaml.doc ""]

type nonrec unauthorized_operation = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Your account is not authorized to perform the requested operation.\n"]

type nonrec tag_limit_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You have exceeded the number of tags allowed.\n"]

type nonrec snapshot_schedule_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "We could not find the specified snapshot schedule. \n"]

type nonrec redshift_idc_application_not_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The application you attempted to find doesn't exist.\n"]

type nonrec number_of_nodes_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation would exceed the number of nodes allotted to the account. For information about \
   increasing your quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec number_of_nodes_per_cluster_limit_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation would exceed the number of nodes allowed for a cluster.\n"]

type nonrec ipv6_cidr_block_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "There are no subnets in your VPC with associated IPv6 CIDR blocks. To use dual-stack mode, \
   associate an IPv6 CIDR block with each subnet in your VPC.\n"]

type nonrec invalid_vpc_network_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The cluster subnet group does not cover all Availability Zones.\n"]

type nonrec invalid_tag_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The tag is invalid.\n"]

type nonrec invalid_subnet = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The requested subnet is not valid, or not all of the subnets are in the same VPC.\n"]

type nonrec invalid_elastic_ip_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The Elastic IP (EIP) is invalid or cannot be found.\n"]

type nonrec invalid_cluster_track_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The provided cluster track name is not valid.\n"]

type nonrec invalid_cluster_subnet_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The cluster subnet group cannot be deleted because it is in use.\n"]

type nonrec insufficient_cluster_capacity_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The number of nodes specified exceeds the allotted capacity of the cluster.\n"]

type nonrec hsm_configuration_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "There is no Amazon Redshift HSM configuration with the specified identifier.\n"]

type nonrec hsm_client_certificate_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "There is no Amazon Redshift HSM client certificate with the specified identifier.\n"]

type nonrec dependent_service_access_denied_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "A dependent service denied access for the integration.\n"]

type nonrec create_cluster_result = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec iam_role_arn_list = string_ list [@@ocaml.doc ""]

type nonrec vpc_security_group_id_list = string_ list [@@ocaml.doc ""]

type nonrec create_cluster_message = {
  db_name : string_ option;
      [@ocaml.doc
        "The name of the first database to be created when the cluster is created.\n\n\
        \ To create additional databases after the cluster is created, connect to the cluster with \
         a SQL client and use SQL commands to create a database. For more information, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/t_creating_database.html}Create a \
         Database} in the Amazon Redshift Database Developer Guide. \n\
        \ \n\
        \  Default: [dev] \n\
        \  \n\
        \   Constraints:\n\
        \   \n\
        \    {ul\n\
        \          {-  Must contain 1 to 64 alphanumeric characters.\n\
        \              \n\
        \               }\n\
        \          {-  Must contain only lowercase letters.\n\
        \              \n\
        \               }\n\
        \          {-  Cannot be a word that is reserved by the service. A list of reserved words \
         can be found in \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html}Reserved Words} in \
         the Amazon Redshift Database Developer Guide. \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  cluster_identifier : string_;
      [@ocaml.doc
        "A unique identifier for the cluster. You use this identifier to refer to the cluster for \
         any subsequent cluster operations such as deleting or modifying. The identifier also \
         appears in the Amazon Redshift console.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Alphabetic characters must be lowercase.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique for all clusters within an Amazon Web Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [myexamplecluster] \n\
        \   "]
  cluster_type : string_ option;
      [@ocaml.doc
        "The type of the cluster. When cluster type is specified as\n\n\
        \ {ul\n\
        \       {-   [single-node], the {b NumberOfNodes} parameter is not required.\n\
        \           \n\
        \            }\n\
        \       {-   [multi-node], the {b NumberOfNodes} parameter is required.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Valid Values: [multi-node] | [single-node] \n\
        \   \n\
        \    Default: [multi-node] \n\
        \    "]
  node_type : string_;
      [@ocaml.doc
        "The node type to be provisioned for the cluster. For information about node types, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes} \
         Working with Clusters} in the {i Amazon Redshift Cluster Management Guide}. \n\n\
        \ Valid Values: [dc2.large] | [dc2.8xlarge]| [rg.xlarge] | [rg.4xlarge] | [ra3.large] | \
         [ra3.xlplus] | [ra3.4xlarge] | [ra3.16xlarge] \n\
        \ "]
  master_username : string_;
      [@ocaml.doc
        "The user name associated with the admin user account for the cluster that is being \
         created.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 - 128 alphanumeric characters or hyphens. The user name can't be \
         [PUBLIC].\n\
        \            \n\
        \             }\n\
        \        {-  Must contain only lowercase letters, numbers, underscore, plus sign, period \
         (dot), at symbol (\\@), or hyphen.\n\
        \            \n\
        \             }\n\
        \        {-  The first character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Must not contain a colon (:) or a slash (/).\n\
        \            \n\
        \             }\n\
        \        {-  Cannot be a reserved word. A list of reserved words can be found in \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html}Reserved Words} in \
         the Amazon Redshift Database Developer Guide. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  master_user_password : sensitive_string option;
      [@ocaml.doc
        "The password associated with the admin user account for the cluster that is being \
         created.\n\n\
        \ You can't use [MasterUserPassword] if [ManageMasterPassword] is [true].\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be between 8 and 64 characters in length.\n\
        \             \n\
        \              }\n\
        \         {-  Must contain at least one uppercase letter.\n\
        \             \n\
        \              }\n\
        \         {-  Must contain at least one lowercase letter.\n\
        \             \n\
        \              }\n\
        \         {-  Must contain one number.\n\
        \             \n\
        \              }\n\
        \         {-  Can be any printable ASCII character (ASCII code 33-126) except ['] (single \
         quote), [\"] (double quote), [\\], [/], or [@].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  cluster_security_groups : cluster_security_group_name_list option;
      [@ocaml.doc
        "A list of security groups to be associated with this cluster.\n\n\
        \ Default: The default cluster security group for Amazon Redshift.\n\
        \ "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster.\n\n\
        \ Default: The default VPC security group is associated with the cluster.\n\
        \ "]
  cluster_subnet_group_name : string_ option;
      [@ocaml.doc
        "The name of a cluster subnet group to be associated with this cluster.\n\n\
        \ If this parameter is not provided the resulting cluster will be deployed outside virtual \
         private cloud (VPC).\n\
        \ "]
  availability_zone : string_ option;
      [@ocaml.doc
        "The EC2 Availability Zone (AZ) in which you want Amazon Redshift to provision the \
         cluster. For example, if you have several EC2 instances running in a specific \
         Availability Zone, then you might want the cluster to be provisioned in the same zone in \
         order to decrease network latency.\n\n\
        \ Default: A random, system-chosen Availability Zone in the region that is specified by \
         the endpoint.\n\
        \ \n\
        \  Example: [us-east-2d] \n\
        \  \n\
        \   Constraint: The specified Availability Zone must be in the same region as the current \
         endpoint.\n\
        \   "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range (in UTC) during which automated cluster maintenance can occur.\n\n\
        \  Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \ \n\
        \   Default: A 30-minute window selected at random from an 8-hour block of time per \
         region, occurring on a random day of the week. For more information about the time blocks \
         for each region, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows}Maintenance \
         Windows} in Amazon Redshift Cluster Management Guide.\n\
        \  \n\
        \   Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the parameter group to be associated with this cluster.\n\n\
        \ Default: The default Amazon Redshift cluster parameter group. For information about the \
         default parameter group, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Working \
         with Amazon Redshift Parameter Groups} \n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be 1 to 255 alphanumeric characters or hyphens.\n\
        \             \n\
        \              }\n\
        \         {-  First character must be a letter.\n\
        \             \n\
        \              }\n\
        \         {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  automated_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that automated snapshots are retained. If the value is 0, automated \
         snapshots are disabled. Even if automated snapshots are disabled, you can still create \
         manual snapshots when you want with [CreateClusterSnapshot]. \n\n\
        \ You can't disable automated snapshots for RG or RA3 node types. Set the automated \
         retention period from 1-35 days.\n\
        \ \n\
        \  Default: [1] \n\
        \  \n\
        \   Constraints: Must be a value from 0 to 35.\n\
        \   "]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The default number of days to retain a manual snapshot. If the value is -1, the snapshot \
         is retained indefinitely. This setting doesn't change the retention period of existing \
         snapshots.\n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ "]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the cluster accepts incoming connections.\n\n\
        \ The cluster is accessible only via the JDBC and ODBC connection strings. Part of the \
         connection string requires the port on which the cluster will listen for incoming \
         connections.\n\
        \ \n\
        \  Default: [5439] \n\
        \  \n\
        \   Valid Values: \n\
        \   \n\
        \    {ul\n\
        \          {-  For clusters with RG or RA3 nodes - Select a port within the ranges \
         [5431-5455] or [8191-8215]. (If you have an existing cluster with RG or RA3 nodes, it \
         isn't required that you change the port to these ranges.)\n\
        \              \n\
        \               }\n\
        \          {-  For clusters with dc2 nodes - Select a port within the range [1150-65535].\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  cluster_version : string_ option;
      [@ocaml.doc
        "The version of the Amazon Redshift engine software that you want to deploy on the \
         cluster.\n\n\
        \ The version selected runs on all the nodes in the cluster.\n\
        \ \n\
        \  Constraints: Only version 1.0 is currently available.\n\
        \  \n\
        \   Example: [1.0] \n\
        \   "]
  allow_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "If [true], major version upgrades can be applied during the maintenance window to the \
         Amazon Redshift engine that is running on the cluster.\n\n\
        \ When a new major version of the Amazon Redshift engine is released, you can request that \
         the service automatically apply upgrades during the maintenance window to the Amazon \
         Redshift engine that is running on your cluster.\n\
        \ \n\
        \  Default: [true] \n\
        \  "]
  number_of_nodes : integer_optional option;
      [@ocaml.doc
        "The number of compute nodes in the cluster. This parameter is required when the {b \
         ClusterType} parameter is specified as [multi-node]. \n\n\
        \ For information about determining how many nodes you need, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#how-many-nodes} \
         Working with Clusters} in the {i Amazon Redshift Cluster Management Guide}. \n\
        \ \n\
        \  If you don't specify this parameter, you get a single-node cluster. When requesting a \
         multi-node cluster, you must specify the number of nodes that you want in the cluster.\n\
        \  \n\
        \   Default: [1] \n\
        \   \n\
        \    Constraints: Value must be at least 1 and no more than 100.\n\
        \    "]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "If [true], the cluster can be accessed from a public network. \n\n Default: false\n "]
  encrypted : boolean_optional option;
      [@ocaml.doc
        "If [true], the data in the cluster is encrypted at rest. If you set the value on this \
         parameter to [false], the request will fail.\n\n\
        \ Default: true\n\
        \ "]
  hsm_client_certificate_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to \
         retrieve the data encryption keys stored in an HSM.\n"]
  hsm_configuration_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM configuration that contains the information the Amazon \
         Redshift cluster can use to retrieve and store keys in an HSM.\n"]
  elastic_ip : string_ option;
      [@ocaml.doc
        "The Elastic IP (EIP) address for the cluster.\n\n\
        \ Constraints: The cluster must be provisioned in EC2-VPC and publicly-accessible through \
         an Internet gateway. Don't specify the Elastic IP address for a publicly accessible \
         cluster with availability zone relocation turned on. For more information about \
         provisioning clusters in EC2-VPC, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms}Supported \
         Platforms to Launch Your Cluster} in the Amazon Redshift Cluster Management Guide.\n\
        \ "]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Key Management Service (KMS) key ID of the encryption key that you want to use to \
         encrypt data in the cluster.\n"]
  enhanced_vpc_routing : boolean_optional option;
      [@ocaml.doc
        "An option that specifies whether to create the cluster with enhanced VPC routing enabled. \
         To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For \
         more information, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html}Enhanced \
         VPC Routing} in the Amazon Redshift Cluster Management Guide.\n\n\
        \ If this option is [true], enhanced VPC routing is enabled. \n\
        \ \n\
        \  Default: false\n\
        \  "]
  additional_info : string_ option; [@ocaml.doc "Reserved.\n"]
  iam_roles : iam_role_arn_list option;
      [@ocaml.doc
        "A list of Identity and Access Management (IAM) roles that can be used by the cluster to \
         access other Amazon Web Services services. You must supply the IAM roles in their Amazon \
         Resource Name (ARN) format. \n\n\
        \ The maximum number of IAM roles that you can associate is subject to a quota. For more \
         information, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Quotas \
         and limits} in the {i Amazon Redshift Cluster Management Guide}.\n\
        \ "]
  maintenance_track_name : string_ option;
      [@ocaml.doc
        "An optional parameter for the name of the maintenance track for the cluster. If you don't \
         provide a maintenance track name, the cluster is assigned to the [current] track.\n"]
  snapshot_schedule_identifier : string_ option;
      [@ocaml.doc "A unique identifier for the snapshot schedule.\n"]
  availability_zone_relocation : boolean_optional option;
      [@ocaml.doc
        "The option to enable relocation for an Amazon Redshift cluster between Availability Zones \
         after the cluster is created.\n"]
  aqua_configuration_status : aqua_configuration_status option;
      [@ocaml.doc
        "This parameter is retired. It does not set the AQUA configuration status. Amazon Redshift \
         automatically determines whether to use AQUA (Advanced Query Accelerator).\n"]
  default_iam_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster \
         when the cluster was created. \n"]
  load_sample_data : string_ option;
      [@ocaml.doc
        "A flag that specifies whether to load sample data once the cluster is created.\n"]
  manage_master_password : boolean_optional option;
      [@ocaml.doc
        "If [true], Amazon Redshift uses Secrets Manager to manage this cluster's admin \
         credentials. You can't use [MasterUserPassword] if [ManageMasterPassword] is true. If \
         [ManageMasterPassword] is false or not set, Amazon Redshift uses [MasterUserPassword] for \
         the admin user account's password. \n"]
  master_password_secret_kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's \
         admin credentials secret. You can only use this parameter if [ManageMasterPassword] is \
         true.\n"]
  ip_address_type : string_ option;
      [@ocaml.doc
        "The IP address types that the cluster supports. Possible values are [ipv4] and [dualstack].\n"]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        "If true, Amazon Redshift will deploy the cluster in two Availability Zones (AZ).\n"]
  redshift_idc_application_arn : string_ option;
      [@ocaml.doc
        "The Amazon resource name (ARN) of the Amazon Redshift IAM Identity Center application.\n"]
  catalog_name : catalog_name_string option;
      [@ocaml.doc
        "The name of the Glue data catalog that will be associated with the cluster enabled with \
         Amazon Redshift federated permissions.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain at least one lowercase letter.\n\
        \            \n\
        \             }\n\
        \        {-  Can only contain lowercase letters (a-z), numbers (0-9), underscores (_), and \
         hyphens (-).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Pattern: [^\\[a-z0-9_-\\]*\\[a-z\\]+\\[a-z0-9_-\\]*$] \n\
        \   \n\
        \    Example: [my-catalog_01] \n\
        \    "]
  extra_compute_for_automatic_optimization : boolean_optional option;
      [@ocaml.doc
        "If [true], allocates additional compute resources for running automatic optimization \
         operations.\n\n\
        \ Default: false\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec create_cluster_parameter_group_result = {
  cluster_parameter_group : cluster_parameter_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_cluster_parameter_group_message = {
  parameter_group_name : string_;
      [@ocaml.doc
        "The name of the cluster parameter group.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 255 alphanumeric characters or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique withing your Amazon Web Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    This value is stored as a lower-case string.\n\
        \    \n\
        \     "]
  parameter_group_family : string_;
      [@ocaml.doc
        "The Amazon Redshift engine version to which the cluster parameter group applies. The \
         cluster engine version determines the set of parameters.\n\n\
        \ To get a list of valid parameter group family names, you can call \
         [DescribeClusterParameterGroups]. By default, Amazon Redshift returns a list of all the \
         parameter groups that are owned by your Amazon Web Services account, including the \
         default parameter groups for each Amazon Redshift engine version. The parameter group \
         family names associated with the default parameter groups provide you the valid values. \
         For example, a valid family name is \"redshift-1.0\". \n\
        \ "]
  description : string_; [@ocaml.doc "A description of the parameter group.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_cluster_security_group_result = {
  cluster_security_group : cluster_security_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_cluster_security_group_message = {
  cluster_security_group_name : string_;
      [@ocaml.doc
        "The name for the security group. Amazon Redshift stores the value as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain no more than 255 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must not be \"Default\".\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique for all security groups that are created by your Amazon Web \
         Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [examplesecuritygroup] \n\
        \   "]
  description : string_; [@ocaml.doc "A description for the security group.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_cluster_snapshot_result = { snapshot : snapshot option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec create_cluster_snapshot_message = {
  snapshot_identifier : string_;
      [@ocaml.doc
        "A unique identifier for the snapshot that you are requesting. This identifier must be \
         unique for all snapshots within the Amazon Web Services account.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cannot be null, empty, or blank\n\
        \            \n\
        \             }\n\
        \        {-  Must contain from 1 to 255 alphanumeric characters or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [my-snapshot-id] \n\
        \   "]
  cluster_identifier : string_;
      [@ocaml.doc "The cluster identifier for which you want a snapshot.\n"]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that a manual snapshot is retained. If the value is -1, the manual \
         snapshot is retained indefinitely. \n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ \n\
        \  The default value is -1.\n\
        \  "]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "\n"]

type nonrec create_cluster_subnet_group_result = {
  cluster_subnet_group : cluster_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec subnet_identifier_list = string_ list [@@ocaml.doc ""]

type nonrec create_cluster_subnet_group_message = {
  cluster_subnet_group_name : string_;
      [@ocaml.doc
        "The name for the subnet group. Amazon Redshift stores the value as a lowercase string.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain no more than 255 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must not be \"Default\".\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique for all subnet groups that are created by your Amazon Web \
         Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [examplesubnetgroup] \n\
        \   "]
  description : string_; [@ocaml.doc "A description for the subnet group.\n"]
  subnet_ids : subnet_identifier_list;
      [@ocaml.doc
        "An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a single request.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "\n"]

type nonrec custom_cname_association_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An error occurred when an attempt was made to change the custom domain association.\n"]

type nonrec custom_domain_certificate_arn_string = string [@@ocaml.doc ""]

type nonrec custom_domain_name_string = string [@@ocaml.doc ""]

type nonrec create_custom_domain_association_result = {
  custom_domain_name : custom_domain_name_string option;
      [@ocaml.doc "The custom domain name for the association result.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the certificate associated with the custom domain name.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc "The identifier of the cluster that the custom domain is associated with.\n"]
  custom_domain_cert_expiry_time : string_ option;
      [@ocaml.doc "The expiration time for the certificate for the custom domain.\n"]
}
[@@ocaml.doc ""]

type nonrec create_custom_domain_association_message = {
  custom_domain_name : custom_domain_name_string;
      [@ocaml.doc "The custom domain name for a custom domain association.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string;
      [@ocaml.doc
        "The certificate Amazon Resource Name (ARN) for the custom domain name association.\n"]
  cluster_identifier : string_;
      [@ocaml.doc "The cluster identifier that the custom domain is associated with.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoints_per_cluster_limit_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The number of Redshift-managed VPC endpoints per cluster has exceeded its limit.\n"]

type nonrec endpoints_per_authorization_limit_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The number of Redshift-managed VPC endpoints per authorization has exceeded its limit.\n"]

type nonrec endpoint_already_exists_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The account already has a Redshift-managed VPC endpoint with the given identifier.\n"]

type nonrec endpoint_access = {
  cluster_identifier : string_ option;
      [@ocaml.doc "The cluster identifier of the cluster associated with the endpoint.\n"]
  resource_owner : string_ option;
      [@ocaml.doc "The Amazon Web Services account ID of the owner of the cluster.\n"]
  subnet_group_name : string_ option;
      [@ocaml.doc "The subnet group name where Amazon Redshift chooses to deploy the endpoint.\n"]
  endpoint_status : string_ option; [@ocaml.doc "The status of the endpoint.\n"]
  endpoint_name : string_ option; [@ocaml.doc "The name of the endpoint.\n"]
  endpoint_create_time : t_stamp option;
      [@ocaml.doc "The time (UTC) that the endpoint was created.\n"]
  port : integer option;
      [@ocaml.doc "The port number on which the cluster accepts incoming connections.\n"]
  address : string_ option; [@ocaml.doc "The DNS address of the endpoint.\n"]
  vpc_security_groups : vpc_security_group_membership_list option;
      [@ocaml.doc "The security groups associated with the endpoint.\n"]
  vpc_endpoint : vpc_endpoint option; [@ocaml.doc ""]
}
[@@ocaml.doc "Describes a Redshift-managed VPC endpoint.\n"]

type nonrec create_endpoint_access_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc "The cluster identifier of the cluster to access.\n"]
  resource_owner : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account ID of the owner of the cluster. This is only required if \
         the cluster is in another Amazon Web Services account.\n"]
  endpoint_name : string_;
      [@ocaml.doc
        "The Redshift-managed VPC endpoint name.\n\n\
        \ An endpoint name must contain 1-30 characters. Valid characters are A-Z, a-z, 0-9, and \
         hyphen(-). The first character must be a letter. The name can't contain two consecutive \
         hyphens or end with a hyphen.\n\
        \ "]
  subnet_group_name : string_;
      [@ocaml.doc
        "The subnet group from which Amazon Redshift chooses the subnet to deploy the endpoint.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "The security group that defines the ports, protocols, and sources for inbound traffic \
         that you are authorizing into your endpoint.\n"]
}
[@@ocaml.doc ""]

type nonrec subscription_severity_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The value specified for the event severity was not one of the allowed values, or it specified a \
   severity that does not apply to the specified source type. The allowed values are ERROR and \
   INFO.\n"]

type nonrec subscription_event_id_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "An Amazon Redshift event with the specified event ID does not exist.\n"]

type nonrec subscription_category_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The value specified for the event category was not one of the allowed values, or it specified a \
   category that does not apply to the specified source type. The allowed values are \
   Configuration, Management, Monitoring, and Security.\n"]

type nonrec subscription_already_exist_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "There is already an existing event notification subscription with the specified name.\n"]

type nonrec source_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified Amazon Redshift event source could not be found.\n"]

type nonrec sns_topic_arn_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "An Amazon SNS topic with the specified Amazon Resource Name (ARN) does not exist.\n"]

type nonrec sns_no_authorization_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have permission to publish to the specified Amazon SNS topic.\n"]

type nonrec sns_invalid_topic_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Amazon SNS has responded that there is a problem with the specified Amazon SNS topic.\n"]

type nonrec event_subscription_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request would exceed the allowed number of event subscriptions for this account. For \
   information about increasing your quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec event_categories_list = string_ list [@@ocaml.doc ""]

type nonrec source_ids_list = string_ list [@@ocaml.doc ""]

type nonrec event_subscription = {
  customer_aws_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account associated with the Amazon Redshift event notification \
         subscription.\n"]
  cust_subscription_id : string_ option;
      [@ocaml.doc "The name of the Amazon Redshift event notification subscription.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic used by the event notification \
         subscription.\n"]
  status : string_ option;
      [@ocaml.doc
        "The status of the Amazon Redshift event notification subscription.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Can be one of the following: active | no-permission | topic-not-exist\n\
        \            \n\
        \             }\n\
        \        {-  The status \"no-permission\" indicates that Amazon Redshift no longer has \
         permission to post to the Amazon SNS topic. The status \"topic-not-exist\" indicates that \
         the topic was deleted after the subscription was created.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  subscription_creation_time : t_stamp option;
      [@ocaml.doc
        "The date and time the Amazon Redshift event notification subscription was created.\n"]
  source_type : string_ option;
      [@ocaml.doc
        "The source type of the events returned by the Amazon Redshift event notification, such as \
         cluster, cluster-snapshot, cluster-parameter-group, cluster-security-group, or \
         scheduled-action. \n"]
  source_ids_list : source_ids_list option;
      [@ocaml.doc
        "A list of the sources that publish events to the Amazon Redshift event notification \
         subscription.\n"]
  event_categories_list : event_categories_list option;
      [@ocaml.doc
        "The list of Amazon Redshift event categories specified in the event notification \
         subscription.\n\n\
        \ Values: Configuration, Management, Monitoring, Security, Pending\n\
        \ "]
  severity : string_ option;
      [@ocaml.doc
        "The event severity specified in the Amazon Redshift event notification subscription.\n\n\
        \ Values: ERROR, INFO\n\
        \ "]
  enabled : boolean_ option;
      [@ocaml.doc
        "A boolean value indicating whether the subscription is enabled; [true] indicates that the \
         subscription is enabled.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the event subscription.\n"]
}
[@@ocaml.doc "Describes event subscriptions.\n"]

type nonrec create_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the event subscription to be created.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Cannot be null, empty, or blank.\n\
        \            \n\
        \             }\n\
        \        {-  Must contain from 1 to 255 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  sns_topic_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon SNS topic used to transmit the event \
         notifications. The ARN is created by Amazon SNS when you create a topic and subscribe to \
         it.\n"]
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that will be generating the events. For example, if you want to be \
         notified of events generated by a cluster, you would set this parameter to cluster. If \
         this value is not specified, events are returned for all Amazon Redshift objects in your \
         Amazon Web Services account. You must specify a source type in order to specify source \
         IDs.\n\n\
        \ Valid values: cluster, cluster-parameter-group, cluster-security-group, \
         cluster-snapshot, and scheduled-action.\n\
        \ "]
  source_ids : source_ids_list option;
      [@ocaml.doc
        "A list of one or more identifiers of Amazon Redshift source objects. All of the objects \
         must be of the same type as was specified in the source type parameter. The event \
         subscription will return only events generated by the specified objects. If not \
         specified, then events are returned for all objects within the source type specified.\n\n\
        \ Example: my-cluster-1, my-cluster-2\n\
        \ \n\
        \  Example: my-snapshot-20131010\n\
        \  "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        "Specifies the Amazon Redshift event categories to be published by the event notification \
         subscription.\n\n\
        \ Values: configuration, management, monitoring, security, pending\n\
        \ "]
  severity : string_ option;
      [@ocaml.doc
        "Specifies the Amazon Redshift event severity to be published by the event notification \
         subscription.\n\n\
        \ Values: ERROR, INFO\n\
        \ "]
  enabled : boolean_optional option;
      [@ocaml.doc
        "A boolean value; set to [true] to activate the subscription, and set to [false] to create \
         the subscription but not activate it. \n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "\n"]

type nonrec hsm_client_certificate_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The quota for HSM client certificates has been reached. For information about increasing your \
   quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec hsm_client_certificate_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "There is already an existing Amazon Redshift HSM client certificate with the specified \
   identifier.\n"]

type nonrec hsm_client_certificate = {
  hsm_client_certificate_identifier : string_ option;
      [@ocaml.doc "The identifier of the HSM client certificate.\n"]
  hsm_client_certificate_public_key : string_ option;
      [@ocaml.doc
        "The public key that the Amazon Redshift cluster will use to connect to the HSM. You must \
         register the public key in the HSM.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the HSM client certificate.\n"]
}
[@@ocaml.doc
  "Returns information about an HSM client certificate. The certificate is stored in a secure \
   Hardware Storage Module (HSM), and used by the Amazon Redshift cluster to encrypt data files.\n"]

type nonrec create_hsm_client_certificate_result = {
  hsm_client_certificate : hsm_client_certificate option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_hsm_client_certificate_message = {
  hsm_client_certificate_identifier : string_;
      [@ocaml.doc
        "The identifier to be assigned to the new HSM client certificate that the cluster will use \
         to connect to the HSM to use the database encryption keys.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "\n"]

type nonrec hsm_configuration_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The quota for HSM configurations has been reached. For information about increasing your quota, \
   go to {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec hsm_configuration_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "There is already an existing Amazon Redshift HSM configuration with the specified identifier.\n"]

type nonrec hsm_configuration = {
  hsm_configuration_identifier : string_ option;
      [@ocaml.doc "The name of the Amazon Redshift HSM configuration.\n"]
  description : string_ option; [@ocaml.doc "A text description of the HSM configuration.\n"]
  hsm_ip_address : string_ option;
      [@ocaml.doc "The IP address that the Amazon Redshift cluster must use to access the HSM.\n"]
  hsm_partition_name : string_ option;
      [@ocaml.doc
        "The name of the partition in the HSM where the Amazon Redshift clusters will store their \
         database encryption keys.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags for the HSM configuration.\n"]
}
[@@ocaml.doc
  "Returns information about an HSM configuration, which is an object that describes to Amazon \
   Redshift clusters the information they require to connect to an HSM where they can store \
   database encryption keys.\n"]

type nonrec create_hsm_configuration_result = {
  hsm_configuration : hsm_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_hsm_configuration_message = {
  hsm_configuration_identifier : string_;
      [@ocaml.doc "The identifier to be assigned to the new Amazon Redshift HSM configuration.\n"]
  description : string_; [@ocaml.doc "A text description of the HSM configuration to be created.\n"]
  hsm_ip_address : string_;
      [@ocaml.doc "The IP address that the Amazon Redshift cluster must use to access the HSM.\n"]
  hsm_partition_name : string_;
      [@ocaml.doc
        "The name of the partition in the HSM where the Amazon Redshift clusters will store their \
         database encryption keys.\n"]
  hsm_partition_password : string_;
      [@ocaml.doc "The password required to access the HSM partition.\n"]
  hsm_server_public_certificate : string_;
      [@ocaml.doc
        "The HSMs public certificate file. When using Cloud HSM, the file name is server.pem.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "\n"]

type nonrec integration_target_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified integration target can't be found.\n"]

type nonrec integration_source_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified integration source can't be found.\n"]

type nonrec integration_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You can't create any more zero-ETL or S3 event integrations because the quota has been reached.\n"]

type nonrec integration_conflict_operation_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A conflicting conditional operation is currently in progress against this resource. This \
   typically occurs when there are multiple requests being made to the same resource at the same \
   time, and these requests conflict with each other.\n"]

type nonrec integration_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The integration you are trying to create already exists.\n"]

type nonrec encryption_context_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec integration_error = {
  error_code : string_; [@ocaml.doc "The error code of an inbound integration error.\n"]
  error_message : string_ option; [@ocaml.doc "The error message of an inbound integration error.\n"]
}
[@@ocaml.doc "The error of an inbound integration.\n"]

type nonrec integration_error_list = integration_error list [@@ocaml.doc ""]

type nonrec zero_etl_integration_status =
  | CREATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | MODIFYING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | SYNCING [@ocaml.doc ""]
  | NEEDS_ATTENTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_arn = string [@@ocaml.doc ""]

type nonrec source_arn = string [@@ocaml.doc ""]

type nonrec integration_name = string [@@ocaml.doc ""]

type nonrec integration_arn = string [@@ocaml.doc ""]

type nonrec integration = {
  integration_arn : integration_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the integration.\n"]
  integration_name : integration_name option; [@ocaml.doc "The name of the integration.\n"]
  source_arn : source_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the database used as the source for replication.\n"]
  target_arn : target_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Redshift data warehouse to use as the target \
         for replication.\n"]
  status : zero_etl_integration_status option;
      [@ocaml.doc "The current status of the integration.\n"]
  errors : integration_error_list option;
      [@ocaml.doc "Any errors associated with the integration.\n"]
  create_time : t_stamp option; [@ocaml.doc "The time (UTC) when the integration was created.\n"]
  description : description option; [@ocaml.doc "The description of the integration.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Key Management Service (KMS) key identifier for the key used to encrypt the \
         integration.\n"]
  additional_encryption_context : encryption_context_map option;
      [@ocaml.doc
        "The encryption context for the integration. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption \
         context} in the {i Amazon Web Services Key Management Service Developer Guide}.\n"]
  tags : tag_list option; [@ocaml.doc "The list of tags associated with the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec integration_description = string [@@ocaml.doc ""]

type nonrec create_integration_message = {
  source_arn : source_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the database to use as the source for replication.\n"]
  target_arn : target_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Redshift data warehouse to use as the target \
         for replication.\n"]
  integration_name : integration_name; [@ocaml.doc "The name of the integration.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "An Key Management Service (KMS) key identifier for the key to use to encrypt the \
         integration. If you don't specify an encryption key, the default Amazon Web Services \
         owned key is used.\n"]
  tag_list : tag_list option; [@ocaml.doc "A list of tags.\n"]
  additional_encryption_context : encryption_context_map option;
      [@ocaml.doc
        "An optional set of non-secret key\226\128\147value pairs that contains additional \
         contextual information about the data. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#encrypt_context}Encryption \
         context} in the {i Amazon Web Services Key Management Service Developer Guide}.\n\n\
        \ You can only include this parameter if you specify the [KMSKeyId] parameter.\n\
        \ "]
  description : integration_description option; [@ocaml.doc "A description of the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec redshift_idc_application_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The maximum number of Redshift IAM Identity Center applications was exceeded.\n"]

type nonrec redshift_idc_application_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The application you attempted to add already exists.\n"]

type nonrec tag_key_list = string_ list [@@ocaml.doc ""]

type nonrec redshift_scope_union =
  | Connect of connect
      [@ocaml.doc
        "The Amazon Redshift connect integration scope configuration. Defines authorization \
         settings for Amazon Redshift connect service integration.\n"]
[@@ocaml.doc
  "A union structure that defines the scope of Amazon Redshift service integrations. Contains \
   configuration for different integration types such as Amazon Redshift.\n"]

type nonrec redshift_service_integrations = redshift_scope_union list [@@ocaml.doc ""]

type nonrec read_write_access = {
  authorization : service_authorization;
      [@ocaml.doc "Determines whether the read/write scope is enabled or disabled.\n"]
}
[@@ocaml.doc "The S3 Access Grants scope.\n"]

type nonrec s3_access_grants_scope_union =
  | ReadWriteAccess of read_write_access [@ocaml.doc "The S3 Access Grants scope.\n"]
[@@ocaml.doc "A list of scopes set up for S3 Access Grants integration.\n"]

type nonrec s3_access_grants_service_integrations = s3_access_grants_scope_union list
[@@ocaml.doc ""]

type nonrec lake_formation_query = {
  authorization : service_authorization;
      [@ocaml.doc "Determines whether the query scope is enabled or disabled.\n"]
}
[@@ocaml.doc "The Lake Formation scope.\n"]

type nonrec lake_formation_scope_union =
  | LakeFormationQuery of lake_formation_query [@ocaml.doc "The Lake Formation scope.\n"]
[@@ocaml.doc "A list of scopes set up for Lake Formation integration.\n"]

type nonrec lake_formation_service_integrations = lake_formation_scope_union list [@@ocaml.doc ""]

type nonrec service_integrations_union =
  | LakeFormation of lake_formation_service_integrations
      [@ocaml.doc "A list of scopes set up for Lake Formation integration.\n"]
  | S3AccessGrants of s3_access_grants_service_integrations
      [@ocaml.doc "A list of scopes set up for S3 Access Grants integration.\n"]
  | Redshift of redshift_service_integrations
      [@ocaml.doc "A list of scopes set up for Amazon Redshift integration.\n"]
[@@ocaml.doc "A list of service integrations.\n"]

type nonrec service_integration_list = service_integrations_union list [@@ocaml.doc ""]

type nonrec idc_display_name_string = string [@@ocaml.doc ""]

type nonrec identity_namespace_string = string [@@ocaml.doc ""]

type nonrec redshift_idc_application_name = string [@@ocaml.doc ""]

type nonrec redshift_idc_application = {
  idc_instance_arn : string_ option;
      [@ocaml.doc "The ARN for the IAM Identity Center instance that Redshift integrates with.\n"]
  redshift_idc_application_name : redshift_idc_application_name option;
      [@ocaml.doc "The name of the Redshift application in IAM Identity Center.\n"]
  redshift_idc_application_arn : string_ option;
      [@ocaml.doc
        "The ARN for the Redshift application that integrates with IAM Identity Center.\n"]
  identity_namespace : identity_namespace_string option;
      [@ocaml.doc
        "The identity namespace for the Amazon Redshift IAM Identity Center application. It \
         determines which managed application verifies the connection token.\n"]
  idc_display_name : idc_display_name_string option;
      [@ocaml.doc
        "The display name for the Amazon Redshift IAM Identity Center application. It appears on \
         the console.\n"]
  iam_role_arn : string_ option;
      [@ocaml.doc
        "The ARN for the Amazon Redshift IAM Identity Center application. It has the required \
         permissions to be assumed and invoke the IDC Identity Center API.\n"]
  idc_managed_application_arn : string_ option;
      [@ocaml.doc "The ARN for the Amazon Redshift IAM Identity Center application.\n"]
  idc_onboard_status : string_ option;
      [@ocaml.doc
        "The onboarding status for the Amazon Redshift IAM Identity Center application.\n"]
  authorized_token_issuer_list : authorized_token_issuer_list option;
      [@ocaml.doc
        "The authorized token issuer list for the Amazon Redshift IAM Identity Center application.\n"]
  service_integrations : service_integration_list option;
      [@ocaml.doc
        "A list of service integrations for the Redshift IAM Identity Center application.\n"]
  application_type : application_type option;
      [@ocaml.doc
        "The type of application being created. Valid values are [None] or [Lakehouse]. Use \
         [Lakehouse] to enable Amazon Redshift federated permissions on cluster.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags.\n"]
  sso_tag_keys : tag_key_list option;
      [@ocaml.doc
        "A list of tags keys that Redshift Identity Center applications copy to IAM Identity \
         Center. For each input key, the tag corresponding to the key-value pair is propagated.\n"]
}
[@@ocaml.doc "Contains properties for the Redshift IDC application.\n"]

type nonrec create_redshift_idc_application_result = {
  redshift_idc_application : redshift_idc_application option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_redshift_idc_application_message = {
  idc_instance_arn : string_;
      [@ocaml.doc
        "The Amazon resource name (ARN) of the IAM Identity Center instance where Amazon Redshift \
         creates a new managed application.\n"]
  redshift_idc_application_name : redshift_idc_application_name;
      [@ocaml.doc "The name of the Redshift application in IAM Identity Center.\n"]
  identity_namespace : identity_namespace_string option;
      [@ocaml.doc
        "The namespace for the Amazon Redshift IAM Identity Center application instance. It \
         determines which managed application verifies the connection token.\n"]
  idc_display_name : idc_display_name_string;
      [@ocaml.doc
        "The display name for the Amazon Redshift IAM Identity Center application instance. It \
         appears in the console.\n"]
  iam_role_arn : string_;
      [@ocaml.doc
        "The IAM role ARN for the Amazon Redshift IAM Identity Center application instance. It has \
         the required permissions to be assumed and invoke the IDC Identity Center API.\n"]
  authorized_token_issuer_list : authorized_token_issuer_list option;
      [@ocaml.doc
        "The token issuer list for the Amazon Redshift IAM Identity Center application instance.\n"]
  service_integrations : service_integration_list option;
      [@ocaml.doc
        "A collection of service integrations for the Redshift IAM Identity Center application.\n"]
  application_type : application_type option;
      [@ocaml.doc
        "The type of application being created. Valid values are [None] or [Lakehouse]. Use \
         [Lakehouse] to enable Amazon Redshift federated permissions on cluster.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tags.\n"]
  sso_tag_keys : tag_key_list option;
      [@ocaml.doc
        "A list of tags keys that Redshift Identity Center applications copy to IAM Identity \
         Center. For each input key, the tag corresponding to the key-value pair is propagated.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_action_type_unsupported_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The action type specified for a scheduled action is not supported. \n"]

type nonrec scheduled_action_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The quota for scheduled actions exceeded. \n"]

type nonrec scheduled_action_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The scheduled action already exists. \n"]

type nonrec invalid_schedule_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The schedule you submitted isn't valid.\n"]

type nonrec invalid_scheduled_action_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The scheduled action is not valid. \n"]

type nonrec scheduled_action_time_list = t_stamp list [@@ocaml.doc ""]

type nonrec scheduled_action_state = ACTIVE [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resume_cluster_message = {
  cluster_identifier : string_; [@ocaml.doc "The identifier of the cluster to be resumed.\n"]
}
[@@ocaml.doc
  "Describes a resume cluster operation. For example, a scheduled action to run the \
   [ResumeCluster] API operation. \n"]

type nonrec pause_cluster_message = {
  cluster_identifier : string_; [@ocaml.doc "The identifier of the cluster to be paused.\n"]
}
[@@ocaml.doc
  "Describes a pause cluster operation. For example, a scheduled action to run the [PauseCluster] \
   API operation. \n"]

type nonrec resize_cluster_message = {
  cluster_identifier : string_; [@ocaml.doc "The unique identifier for the cluster to resize.\n"]
  cluster_type : string_ option; [@ocaml.doc "The new cluster type for the specified cluster.\n"]
  node_type : string_ option;
      [@ocaml.doc
        "The new node type for the nodes you are adding. If not specified, the cluster's current \
         node type is used.\n"]
  number_of_nodes : integer_optional option;
      [@ocaml.doc
        "The new number of nodes for the cluster. If not specified, the cluster's current number \
         of nodes is used.\n"]
  classic : boolean_optional option;
      [@ocaml.doc
        "A boolean value indicating whether the resize operation is using the classic resize \
         process. If you don't provide this parameter or set the value to [false], the resize type \
         is elastic. \n"]
  reserved_node_id : string_ option; [@ocaml.doc "The identifier of the reserved node.\n"]
  target_reserved_node_offering_id : string_ option;
      [@ocaml.doc "The identifier of the target reserved node offering.\n"]
}
[@@ocaml.doc
  "Describes a resize cluster operation. For example, a scheduled action to run the \
   [ResizeCluster] API operation. \n"]

type nonrec scheduled_action_type = {
  resize_cluster : resize_cluster_message option;
      [@ocaml.doc "An action that runs a [ResizeCluster] API operation. \n"]
  pause_cluster : pause_cluster_message option;
      [@ocaml.doc "An action that runs a [PauseCluster] API operation. \n"]
  resume_cluster : resume_cluster_message option;
      [@ocaml.doc "An action that runs a [ResumeCluster] API operation. \n"]
}
[@@ocaml.doc
  "The action type that specifies an Amazon Redshift API operation that is supported by the Amazon \
   Redshift scheduler. \n"]

type nonrec scheduled_action = {
  scheduled_action_name : string_ option; [@ocaml.doc "The name of the scheduled action. \n"]
  target_action : scheduled_action_type option;
      [@ocaml.doc
        "A JSON format string of the Amazon Redshift API operation with input parameters. \n\n\
        \ \
         \"[{\\\"ResizeCluster\\\":{\\\"NodeType\\\":\\\"ra3.4xlarge\\\",\\\"ClusterIdentifier\\\":\\\"my-test-cluster\\\",\\\"NumberOfNodes\\\":3}}]\". \n\
        \ "]
  schedule : string_ option;
      [@ocaml.doc
        "The schedule for a one-time (at format) or recurring (cron format) scheduled action. \
         Schedule invocations must be separated by at least one hour.\n\n\
        \ Format of at expressions is \"[at(yyyy-mm-ddThh:mm:ss)]\". For example, \
         \"[at(2016-03-04T17:27:00)]\".\n\
        \ \n\
        \  Format of cron expressions is \"[cron(Minutes Hours Day-of-month Month Day-of-week \
         Year)]\". For example, \"[cron(0 10 ? * MON *)]\". For more information, see \
         {{:https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions}Cron \
         Expressions} in the {i Amazon CloudWatch Events User Guide}.\n\
        \  "]
  iam_role : string_ option;
      [@ocaml.doc
        "The IAM role to assume to run the scheduled action. This IAM role must have permission to \
         run the Amazon Redshift API operation in the scheduled action. This IAM role must allow \
         the Amazon Redshift scheduler (Principal scheduler.redshift.amazonaws.com) to assume \
         permissions on your behalf. For more information about the IAM role to use with the \
         Amazon Redshift scheduler, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-identity-based.html}Using \
         Identity-Based Policies for Amazon Redshift} in the {i Amazon Redshift Cluster Management \
         Guide}. \n"]
  scheduled_action_description : string_ option;
      [@ocaml.doc "The description of the scheduled action. \n"]
  state : scheduled_action_state option;
      [@ocaml.doc "The state of the scheduled action. For example, [DISABLED]. \n"]
  next_invocations : scheduled_action_time_list option;
      [@ocaml.doc "List of times when the scheduled action will run. \n"]
  start_time : t_stamp option;
      [@ocaml.doc
        "The start time in UTC when the schedule is active. Before this time, the scheduled action \
         does not trigger. \n"]
  end_time : t_stamp option;
      [@ocaml.doc
        "The end time in UTC when the schedule is no longer active. After this time, the scheduled \
         action does not trigger. \n"]
}
[@@ocaml.doc
  "Describes a scheduled action. You can use a scheduled action to trigger some Amazon Redshift \
   API operations on a schedule. For information about which API operations can be scheduled, see \
   [ScheduledActionType]. \n"]

type nonrec create_scheduled_action_message = {
  scheduled_action_name : string_;
      [@ocaml.doc
        "The name of the scheduled action. The name must be unique within an account. For more \
         information about this parameter, see [ScheduledAction]. \n"]
  target_action : scheduled_action_type;
      [@ocaml.doc
        "A JSON format string of the Amazon Redshift API operation with input parameters. For more \
         information about this parameter, see [ScheduledAction]. \n"]
  schedule : string_;
      [@ocaml.doc
        "The schedule in [at( )] or [cron( )] format. For more information about this parameter, \
         see [ScheduledAction].\n"]
  iam_role : string_;
      [@ocaml.doc
        "The IAM role to assume to run the target action. For more information about this \
         parameter, see [ScheduledAction]. \n"]
  scheduled_action_description : string_ option;
      [@ocaml.doc "The description of the scheduled action. \n"]
  start_time : t_stamp option;
      [@ocaml.doc
        "The start time in UTC of the scheduled action. Before this time, the scheduled action \
         does not trigger. For more information about this parameter, see [ScheduledAction].\n"]
  end_time : t_stamp option;
      [@ocaml.doc
        "The end time in UTC of the scheduled action. After this time, the scheduled action does \
         not trigger. For more information about this parameter, see [ScheduledAction]. \n"]
  enable : boolean_optional option;
      [@ocaml.doc
        "If true, the schedule is enabled. If false, the scheduled action does not trigger. For \
         more information about [state] of the scheduled action, see [ScheduledAction]. \n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_copy_grant_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The Amazon Web Services account has exceeded the maximum number of snapshot copy grants in this \
   region.\n"]

type nonrec snapshot_copy_grant_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The snapshot copy grant can't be created because a grant with the same name already exists.\n"]

type nonrec snapshot_copy_grant = {
  snapshot_copy_grant_name : string_ option; [@ocaml.doc "The name of the snapshot copy grant.\n"]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The unique identifier of the encrypted symmetric key in Amazon Web Services KMS to which \
         Amazon Redshift is granted permission.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc
  "The snapshot copy grant that grants Amazon Redshift permission to encrypt copied snapshots with \
   the specified encrypted symmetric key from Amazon Web Services KMS in the destination region.\n\n\
  \  For more information about managing snapshot copy grants, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-db-encryption.html}Amazon \
   Redshift Database Encryption} in the {i Amazon Redshift Cluster Management Guide}. \n\
  \ "]

type nonrec create_snapshot_copy_grant_result = {
  snapshot_copy_grant : snapshot_copy_grant option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec create_snapshot_copy_grant_message = {
  snapshot_copy_grant_name : string_;
      [@ocaml.doc
        "The name of the snapshot copy grant. This name must be unique in the region for the \
         Amazon Web Services account.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Alphabetic characters must be lowercase.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique for all clusters within an Amazon Web Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The unique identifier of the encrypted symmetric key to which to grant Amazon Redshift \
         permission. If no key is specified, the default key is used.\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "The result of the [CreateSnapshotCopyGrant] action.\n"]

type nonrec snapshot_schedule_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You have exceeded the quota of snapshot schedules. \n"]

type nonrec snapshot_schedule_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified snapshot schedule already exists. \n"]

type nonrec schedule_definition_type_unsupported_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The definition you submitted is not supported.\n"]

type nonrec scheduled_snapshot_time_list = t_stamp list [@@ocaml.doc ""]

type nonrec schedule_definition_list = string_ list [@@ocaml.doc ""]

type nonrec snapshot_schedule = {
  schedule_definitions : schedule_definition_list option;
      [@ocaml.doc "A list of ScheduleDefinitions.\n"]
  schedule_identifier : string_ option; [@ocaml.doc "A unique identifier for the schedule.\n"]
  schedule_description : string_ option; [@ocaml.doc "The description of the schedule.\n"]
  tags : tag_list option; [@ocaml.doc "An optional set of tags describing the schedule.\n"]
  next_invocations : scheduled_snapshot_time_list option; [@ocaml.doc "\n"]
  associated_cluster_count : integer_optional option;
      [@ocaml.doc "The number of clusters associated with the schedule.\n"]
  associated_clusters : associated_cluster_list option;
      [@ocaml.doc
        "A list of clusters associated with the schedule. A maximum of 100 clusters is returned.\n"]
}
[@@ocaml.doc
  "Describes a snapshot schedule. You can set a regular interval for creating snapshots of a \
   cluster. You can also schedule snapshots for specific dates. \n"]

type nonrec create_snapshot_schedule_message = {
  schedule_definitions : schedule_definition_list option;
      [@ocaml.doc
        "The definition of the snapshot schedule. The definition is made up of schedule \
         expressions, for example \"cron(30 12 *)\" or \"rate(12 hours)\". \n"]
  schedule_identifier : string_ option;
      [@ocaml.doc
        "A unique identifier for a snapshot schedule. Only alphanumeric characters are allowed for \
         the identifier.\n"]
  schedule_description : string_ option; [@ocaml.doc "The description of the snapshot schedule.\n"]
  tags : tag_list option;
      [@ocaml.doc "An optional set of tags you can use to search for the schedule.\n"]
  dry_run : boolean_optional option; [@ocaml.doc "\n"]
  next_invocations : integer_optional option; [@ocaml.doc "\n"]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource could not be found.\n"]

type nonrec create_tags_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) to which you want to add the tag or tags. For example, \
         [arn:aws:redshift:us-east-2:123456789:cluster:t1]. \n"]
  tags : tag_list;
      [@ocaml.doc
        "One or more name/value pairs to add as tags to the specified resource. Each tag name is \
         passed in with the parameter [Key] and the corresponding value is passed in with the \
         parameter [Value]. The [Key] and [Value] parameters are separated by a comma (,). \
         Separate multiple tags with a space. For example, [--tags \
         \"Key\"=\"owner\",\"Value\"=\"admin\"\n\
        \                \"Key\"=\"environment\",\"Value\"=\"test\" \
         \"Key\"=\"version\",\"Value\"=\"1.0\"]. \n"]
}
[@@ocaml.doc "Contains the output from the [CreateTags] action. \n"]

type nonrec usage_limit_already_exists_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The usage limit already exists. \n"]

type nonrec invalid_usage_limit_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The usage limit is not valid.\n"]

type nonrec usage_limit_breach_action =
  | LOG [@ocaml.doc ""]
  | EMIT_METRIC [@ocaml.doc ""]
  | DISABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_limit_period =
  | DAILY [@ocaml.doc ""]
  | WEEKLY [@ocaml.doc ""]
  | MONTHLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_limit_limit_type = TIME [@ocaml.doc ""] | DATA_SCANNED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_limit_feature_type =
  | SPECTRUM [@ocaml.doc ""]
  | CONCURRENCY_SCALING [@ocaml.doc ""]
  | CROSS_REGION_DATASHARING [@ocaml.doc ""]
  | EXTRA_COMPUTE_FOR_AUTOMATIC_OPTIMIZATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec usage_limit = {
  usage_limit_id : string_ option; [@ocaml.doc "The identifier of the usage limit.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc "The identifier of the cluster with a usage limit.\n"]
  feature_type : usage_limit_feature_type option;
      [@ocaml.doc "The Amazon Redshift feature to which the limit applies.\n"]
  limit_type : usage_limit_limit_type option;
      [@ocaml.doc
        "The type of limit. Depending on the feature type, this can be based on a time duration or \
         data size.\n"]
  amount : long option;
      [@ocaml.doc
        "The limit amount. If time-based, this amount is in minutes. If data-based, this amount is \
         in terabytes (TB).\n"]
  period : usage_limit_period option;
      [@ocaml.doc
        "The time period that the amount applies to. A [weekly] period begins on Sunday. The \
         default is [monthly]. \n"]
  breach_action : usage_limit_breach_action option;
      [@ocaml.doc
        "The action that Amazon Redshift takes when the limit is reached. Possible values are: \n\n\
        \ {ul\n\
        \       {-   {b log} - To log an event in a system table. The default is log.\n\
        \           \n\
        \            }\n\
        \       {-   {b emit-metric} - To emit CloudWatch metrics.\n\
        \           \n\
        \            }\n\
        \       {-   {b disable} - To disable the feature until the next usage period begins.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc "Describes a usage limit object for a cluster. \n"]

type nonrec create_usage_limit_message = {
  cluster_identifier : string_;
      [@ocaml.doc "The identifier of the cluster that you want to limit usage.\n"]
  feature_type : usage_limit_feature_type;
      [@ocaml.doc "The Amazon Redshift feature that you want to limit.\n"]
  limit_type : usage_limit_limit_type;
      [@ocaml.doc
        "The type of limit. Depending on the feature type, this can be based on a time duration or \
         data size. If [FeatureType] is [spectrum], then [LimitType] must be [data-scanned]. If \
         [FeatureType] is [concurrency-scaling], then [LimitType] must be [time]. If [FeatureType] \
         is [cross-region-datasharing], then [LimitType] must be [data-scanned]. If [FeatureType] \
         is [extra-compute-for-automatic-optimization], then [LimitType] must be [time]. \n"]
  amount : long;
      [@ocaml.doc
        "The limit amount. If time-based, this amount is in minutes. If data-based, this amount is \
         in terabytes (TB). The value must be a positive number. \n"]
  period : usage_limit_period option;
      [@ocaml.doc
        "The time period that the amount applies to. A [weekly] period begins on Sunday. The \
         default is [monthly]. \n"]
  breach_action : usage_limit_breach_action option;
      [@ocaml.doc
        "The action that Amazon Redshift takes when the limit is reached. The default is log. For \
         more information about this parameter, see [UsageLimit].\n"]
  tags : tag_list option; [@ocaml.doc "A list of tag instances.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_domain_association_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "An error occurred. The custom domain name couldn't be found.\n"]

type nonrec custom_domain_associations_message = {
  marker : string_ option; [@ocaml.doc "The marker for the custom domain association.\n"]
  associations : association_list option; [@ocaml.doc "The associations for the custom domain.\n"]
}
[@@ocaml.doc ""]

type nonrec customer_storage_message = {
  total_backup_size_in_mega_bytes : double option;
      [@ocaml.doc "The total amount of storage currently used for snapshots.\n"]
  total_provisioned_storage_in_mega_bytes : double option;
      [@ocaml.doc "The total amount of storage currently provisioned.\n"]
}
[@@ocaml.doc ""]

type nonrec data_share_list = data_share list [@@ocaml.doc ""]

type nonrec data_share_status_for_consumer = ACTIVE [@ocaml.doc ""] | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_share_status_for_producer =
  | ACTIVE [@ocaml.doc ""]
  | AUTHORIZED [@ocaml.doc ""]
  | PENDING_AUTHORIZATION [@ocaml.doc ""]
  | DEAUTHORIZED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec db_group_list = string_ list [@@ocaml.doc ""]

type nonrec deauthorize_data_share_message = {
  data_share_arn : string_;
      [@ocaml.doc
        "The namespace Amazon Resource Name (ARN) of the datashare to remove authorization from.\n"]
  consumer_identifier : string_;
      [@ocaml.doc
        "The identifier of the data consumer that is to have authorization removed from the \
         datashare. This identifier is an Amazon Web Services account ID or a keyword, such as ADX.\n"]
}
[@@ocaml.doc ""]

type nonrec default_cluster_parameters = {
  parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of the cluster parameter group family to which the engine default parameters \
         apply.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  parameters : parameters_list option; [@ocaml.doc "The list of cluster default parameters.\n"]
}
[@@ocaml.doc "Describes the default cluster parameters for a parameter group family.\n"]

type nonrec delete_authentication_profile_result = {
  authentication_profile_name : authentication_profile_name_string option;
      [@ocaml.doc "The name of the authentication profile that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_authentication_profile_message = {
  authentication_profile_name : authentication_profile_name_string;
      [@ocaml.doc "The name of the authentication profile to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cluster_result = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec delete_cluster_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster to be deleted.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain lowercase characters.\n\
        \            \n\
        \             }\n\
        \        {-  Must contain from 1 to 63 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  skip_final_cluster_snapshot : boolean_ option;
      [@ocaml.doc
        "Determines whether a final snapshot of the cluster is created before Amazon Redshift \
         deletes the cluster. If [true], a final cluster snapshot is not created. If [false], a \
         final cluster snapshot is created before the cluster is deleted. \n\n\
        \  The {i FinalClusterSnapshotIdentifier} parameter must be specified if {i \
         SkipFinalClusterSnapshot} is [false].\n\
        \  \n\
        \    Default: [false] \n\
        \    "]
  final_cluster_snapshot_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the final snapshot that is to be created immediately before deleting \
         the cluster. If this parameter is provided, {i SkipFinalClusterSnapshot} must be [false]. \
         \n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 255 alphanumeric characters.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  final_cluster_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that a manual snapshot is retained. If the value is -1, the manual \
         snapshot is retained indefinitely.\n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ \n\
        \  The default value is -1.\n\
        \  "]
}
[@@ocaml.doc "\n"]

type nonrec invalid_cluster_parameter_group_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The cluster parameter group action can not be completed because another task is in progress \
   that involves the parameter group. Wait a few moments and try the operation again.\n"]

type nonrec delete_cluster_parameter_group_message = {
  parameter_group_name : string_;
      [@ocaml.doc
        "The name of the parameter group to be deleted.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be the name of an existing cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot delete a default cluster parameter group.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "\n"]

type nonrec delete_cluster_security_group_message = {
  cluster_security_group_name : string_;
      [@ocaml.doc "The name of the cluster security group to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_cluster_snapshot_result = { snapshot : snapshot option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec invalid_cluster_subnet_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The state of the subnet is invalid.\n"]

type nonrec delete_cluster_subnet_group_message = {
  cluster_subnet_group_name : string_;
      [@ocaml.doc "The name of the cluster subnet group name to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec delete_custom_domain_association_message = {
  cluster_identifier : string_;
      [@ocaml.doc "The identifier of the cluster to delete a custom domain association for.\n"]
  custom_domain_name : custom_domain_name_string;
      [@ocaml.doc "The custom domain name for the custom domain association.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_endpoint_state_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The status of the endpoint is not valid.\n"]

type nonrec endpoint_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The endpoint name doesn't refer to an existing endpoint.\n"]

type nonrec delete_endpoint_access_message = {
  endpoint_name : string_; [@ocaml.doc "The Redshift-managed VPC endpoint to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec subscription_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An Amazon Redshift event notification subscription with the specified name does not exist.\n"]

type nonrec invalid_subscription_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The subscription request is invalid because it is a duplicate request. This subscription \
   request is already in progress.\n"]

type nonrec delete_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc
        "The name of the Amazon Redshift event notification subscription to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec invalid_hsm_client_certificate_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified HSM client certificate is not in the [available] state, or it is still in use by \
   one or more Amazon Redshift clusters.\n"]

type nonrec delete_hsm_client_certificate_message = {
  hsm_client_certificate_identifier : string_;
      [@ocaml.doc "The identifier of the HSM client certificate to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec invalid_hsm_configuration_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified HSM configuration is not in the [available] state, or it is still in use by one \
   or more Amazon Redshift clusters.\n"]

type nonrec delete_hsm_configuration_message = {
  hsm_configuration_identifier : string_;
      [@ocaml.doc "The identifier of the Amazon Redshift HSM configuration to be deleted.\n"]
}
[@@ocaml.doc "\n"]

type nonrec integration_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The integration can't be found.\n"]

type nonrec integration_conflict_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The integration is in an invalid state and can't perform the requested operation.\n"]

type nonrec delete_integration_message = {
  integration_arn : integration_arn;
      [@ocaml.doc "The unique identifier of the integration to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_redshift_idc_application_message = {
  redshift_idc_application_arn : string_;
      [@ocaml.doc "The ARN for a deleted Amazon Redshift IAM Identity Center application.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_message = {
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource of which its resource policy is deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_action_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The scheduled action cannot be found. \n"]

type nonrec delete_scheduled_action_message = {
  scheduled_action_name : string_; [@ocaml.doc "The name of the scheduled action to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_copy_grant_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified snapshot copy grant can't be found. Make sure that the name is typed correctly \
   and that the grant exists in the destination region.\n"]

type nonrec invalid_snapshot_copy_grant_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The snapshot copy grant can't be deleted because it is used by one or more clusters.\n"]

type nonrec delete_snapshot_copy_grant_message = {
  snapshot_copy_grant_name : string_; [@ocaml.doc "The name of the snapshot copy grant to delete.\n"]
}
[@@ocaml.doc "The result of the [DeleteSnapshotCopyGrant] action.\n"]

type nonrec invalid_cluster_snapshot_schedule_state_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The cluster snapshot schedule state is not valid.\n"]

type nonrec delete_snapshot_schedule_message = {
  schedule_identifier : string_;
      [@ocaml.doc "A unique identifier of the snapshot schedule to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_tags_message = {
  resource_name : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) from which you want to remove the tag or tags. For \
         example, [arn:aws:redshift:us-east-2:123456789:cluster:t1]. \n"]
  tag_keys : tag_key_list; [@ocaml.doc "The tag key that you want to delete.\n"]
}
[@@ocaml.doc "Contains the output from the [DeleteTags] action. \n"]

type nonrec usage_limit_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The usage limit identifier can't be found.\n"]

type nonrec delete_usage_limit_message = {
  usage_limit_id : string_; [@ocaml.doc "The identifier of the usage limit to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec namespace_registration_status =
  | REGISTERING [@ocaml.doc ""]
  | DEREGISTERING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deregister_namespace_output_message = {
  status : namespace_registration_status option;
      [@ocaml.doc "The registration status of the cluster or serverless namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec provisioned_identifier = {
  cluster_identifier : string_; [@ocaml.doc "The unique identifier for the provisioned cluster.\n"]
}
[@@ocaml.doc "The identifier for a provisioned cluster.\n"]

type nonrec serverless_identifier = {
  namespace_identifier : string_;
      [@ocaml.doc "The unique identifier for the serverless namespace.\n"]
  workgroup_identifier : string_;
      [@ocaml.doc
        "The unique identifier for the workgroup associated with the serverless namespace.\n"]
}
[@@ocaml.doc "The identifier for a serverless namespace.\n"]

type nonrec namespace_identifier_union =
  | ServerlessIdentifier of serverless_identifier
      [@ocaml.doc "The identifier for a serverless namespace.\n"]
  | ProvisionedIdentifier of provisioned_identifier
      [@ocaml.doc "The identifier for a provisioned cluster.\n"]
[@@ocaml.doc
  "Object to store union of values for a provisioned cluster or serverless namespace\226\128\153s \
   identifier.\n"]

type nonrec deregister_namespace_input_message = {
  namespace_identifier : namespace_identifier_union;
      [@ocaml.doc
        "The unique identifier of the cluster or serverless namespace that you want to deregister.\n"]
  consumer_identifiers : consumer_identifier_list;
      [@ocaml.doc
        "An array containing the ID of the consumer account that you want to deregister the \
         cluster or serverless namespace from.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_attributes_message = {
  attribute_names : attribute_name_list option; [@ocaml.doc "A list of attribute names.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_authentication_profiles_result = {
  authentication_profiles : authentication_profile_list option;
      [@ocaml.doc "The list of authentication profiles.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_authentication_profiles_message = {
  authentication_profile_name : authentication_profile_name_string option;
      [@ocaml.doc
        "The name of the authentication profile to describe. If not specified then all \
         authentication profiles owned by the account are listed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cluster_db_revisions_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc
        "A unique identifier for a cluster whose [ClusterDbRevisions] you are requesting. This \
         parameter is case sensitive. All clusters defined for an account are returned by default.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified MaxRecords value, a value is returned in the \
         [marker] field of the response. You can retrieve the next set of response records by \
         providing the returned [marker] value in the [marker] parameter and retrying the request. \
         \n\n\
        \ Default: 100\n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point for returning a set of response \
         records. When the results of a [DescribeClusterDbRevisions] request exceed the value \
         specified in [MaxRecords], Amazon Redshift returns a value in the [marker] field of the \
         response. You can retrieve the next set of response records by providing the returned \
         [marker] value in the [marker] parameter and retrying the request. \n\n\
        \ Constraints: You can specify either the [ClusterIdentifier] parameter, or the [marker] \
         parameter, but not both.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec tag_value_list = string_ list [@@ocaml.doc ""]

type nonrec describe_cluster_parameter_groups_message = {
  parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of a specific parameter group for which to return details. By default, details \
         about all parameter groups and the default parameter group are returned.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusterParameterGroups] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching cluster parameter groups that \
         are associated with the specified key or keys. For example, suppose that you have \
         parameter groups that are tagged with keys called [owner] and [environment]. If you \
         specify both of these tag keys in the request, Amazon Redshift returns a response with \
         the parameter groups that have either or both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching cluster parameter groups \
         that are associated with the specified tag value or values. For example, suppose that you \
         have parameter groups that are tagged with values called [admin] and [test]. If you \
         specify both of these tag values in the request, Amazon Redshift returns a response with \
         the parameter groups that have either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_cluster_parameters_message = {
  parameter_group_name : string_;
      [@ocaml.doc "The name of a cluster parameter group for which to return details.\n"]
  source : string_ option;
      [@ocaml.doc
        "The parameter types to return. Specify [user] to show parameters that are different form \
         the default. Similarly, specify [engine-default] to show parameters that are the same as \
         the default parameter group. \n\n\
        \ Default: All parameter types returned.\n\
        \ \n\
        \  Valid Values: [user] | [engine-default] \n\
        \  "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusterParameters] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_cluster_security_groups_message = {
  cluster_security_group_name : string_ option;
      [@ocaml.doc
        "The name of a cluster security group for which you are requesting details. You must \
         specify either the {b Marker} parameter or a {b ClusterSecurityGroupName} parameter, but \
         not both. \n\n\
        \  Example: [securitygroup1] \n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusterSecurityGroups] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n\n\
        \ Constraints: You must specify either the {b ClusterSecurityGroupName} parameter or the \
         {b Marker} parameter, but not both. \n\
        \ "]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching cluster security groups that \
         are associated with the specified key or keys. For example, suppose that you have \
         security groups that are tagged with keys called [owner] and [environment]. If you \
         specify both of these tag keys in the request, Amazon Redshift returns a response with \
         the security groups that have either or both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching cluster security groups \
         that are associated with the specified tag value or values. For example, suppose that you \
         have security groups that are tagged with values called [admin] and [test]. If you \
         specify both of these tag values in the request, Amazon Redshift returns a response with \
         the security groups that have either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec snapshot_list = snapshot list [@@ocaml.doc ""]

type nonrec snapshot_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  snapshots : snapshot_list option; [@ocaml.doc "A list of [Snapshot] instances. \n"]
}
[@@ocaml.doc "Contains the output from the [DescribeClusterSnapshots] action. \n"]

type nonrec sort_by_order = ASCENDING [@ocaml.doc ""] | DESCENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snapshot_attribute_to_sort_by =
  | SOURCE_TYPE [@ocaml.doc ""]
  | TOTAL_SIZE [@ocaml.doc ""]
  | CREATE_TIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snapshot_sorting_entity = {
  attribute : snapshot_attribute_to_sort_by;
      [@ocaml.doc "The category for sorting the snapshots.\n"]
  sort_order : sort_by_order option; [@ocaml.doc "The order for listing the attributes.\n"]
}
[@@ocaml.doc "Describes a sorting entity\n"]

type nonrec snapshot_sorting_entity_list = snapshot_sorting_entity list [@@ocaml.doc ""]

type nonrec describe_cluster_snapshots_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc "The identifier of the cluster which generated the requested snapshots.\n"]
  snapshot_identifier : string_ option;
      [@ocaml.doc "The snapshot identifier of the snapshot about which to return information.\n"]
  snapshot_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the snapshot associated with the message to describe \
         cluster snapshots.\n"]
  snapshot_type : string_ option;
      [@ocaml.doc
        "The type of snapshots for which you are requesting information. By default, snapshots of \
         all types are returned.\n\n\
        \ Valid Values: [automated] | [manual] \n\
        \ "]
  start_time : t_stamp option;
      [@ocaml.doc
        "A value that requests only snapshots created at or after the specified time. The time \
         value is specified in ISO 8601 format. For more information about ISO 8601, go to the \
         {{:http://en.wikipedia.org/wiki/ISO_8601}ISO8601 Wikipedia page.} \n\n\
        \ Example: [2012-07-16T18:00:00Z] \n\
        \ "]
  end_time : t_stamp option;
      [@ocaml.doc
        "A time value that requests only snapshots created at or before the specified time. The \
         time value is specified in ISO 8601 format. For more information about ISO 8601, go to \
         the {{:http://en.wikipedia.org/wiki/ISO_8601}ISO8601 Wikipedia page.} \n\n\
        \ Example: [2012-07-16T18:00:00Z] \n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusterSnapshots] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  owner_account : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account used to create or copy the snapshot. Use this field to \
         filter the results to snapshots owned by a particular account. To describe snapshots you \
         own, either specify your Amazon Web Services account, or do not specify the parameter.\n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching cluster snapshots that are \
         associated with the specified key or keys. For example, suppose that you have snapshots \
         that are tagged with keys called [owner] and [environment]. If you specify both of these \
         tag keys in the request, Amazon Redshift returns a response with the snapshots that have \
         either or both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching cluster snapshots that \
         are associated with the specified tag value or values. For example, suppose that you have \
         snapshots that are tagged with values called [admin] and [test]. If you specify both of \
         these tag values in the request, Amazon Redshift returns a response with the snapshots \
         that have either or both of these tag values associated with them.\n"]
  cluster_exists : boolean_optional option;
      [@ocaml.doc
        "A value that indicates whether to return snapshots only for an existing cluster. You can \
         perform table-level restore only by using a snapshot of an existing cluster, that is, a \
         cluster that has not been deleted. Values for this parameter work as follows: \n\n\
        \ {ul\n\
        \       {-  If [ClusterExists] is set to [true], [ClusterIdentifier] is required.\n\
        \           \n\
        \            }\n\
        \       {-  If [ClusterExists] is set to [false] and [ClusterIdentifier] isn't specified, \
         all snapshots associated with deleted clusters (orphaned snapshots) are returned. \n\
        \           \n\
        \            }\n\
        \       {-  If [ClusterExists] is set to [false] and [ClusterIdentifier] is specified for \
         a deleted cluster, snapshots associated with that cluster are returned.\n\
        \           \n\
        \            }\n\
        \       {-  If [ClusterExists] is set to [false] and [ClusterIdentifier] is specified for \
         an existing cluster, no snapshots are returned. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  sorting_entities : snapshot_sorting_entity_list option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_cluster_subnet_groups_message = {
  cluster_subnet_group_name : string_ option;
      [@ocaml.doc "The name of the cluster subnet group for which information is requested.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusterSubnetGroups] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching cluster subnet groups that \
         are associated with the specified key or keys. For example, suppose that you have subnet \
         groups that are tagged with keys called [owner] and [environment]. If you specify both of \
         these tag keys in the request, Amazon Redshift returns a response with the subnet groups \
         that have either or both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching cluster subnet groups \
         that are associated with the specified tag value or values. For example, suppose that you \
         have subnet groups that are tagged with values called [admin] and [test]. If you specify \
         both of these tag values in the request, Amazon Redshift returns a response with the \
         subnet groups that have either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec supported_operation = {
  operation_name : string_ option; [@ocaml.doc "A list of the supported operations.\n"]
}
[@@ocaml.doc "Describes the operations that are allowed on a maintenance track.\n"]

type nonrec supported_operation_list = supported_operation list [@@ocaml.doc ""]

type nonrec update_target = {
  maintenance_track_name : string_ option; [@ocaml.doc "The name of the new maintenance track.\n"]
  database_version : string_ option;
      [@ocaml.doc "The cluster version for the new maintenance track.\n"]
  supported_operations : supported_operation_list option;
      [@ocaml.doc "A list of operations supported by the maintenance track.\n"]
}
[@@ocaml.doc "A maintenance track that you can switch the current track to.\n"]

type nonrec eligible_tracks_to_update_list = update_target list [@@ocaml.doc ""]

type nonrec maintenance_track = {
  maintenance_track_name : string_ option;
      [@ocaml.doc
        "The name of the maintenance track. Possible values are [current] and [trailing].\n"]
  database_version : string_ option; [@ocaml.doc "The version number for the cluster release.\n"]
  update_targets : eligible_tracks_to_update_list option;
      [@ocaml.doc "An array of [UpdateTarget] objects to update with the maintenance track. \n"]
}
[@@ocaml.doc
  "Defines a maintenance track that determines which Amazon Redshift version to apply during a \
   maintenance window. If the value for [MaintenanceTrack] is [current], the cluster is updated to \
   the most recently certified maintenance release. If the value is [trailing], the cluster is \
   updated to the previously certified maintenance release. \n"]

type nonrec track_list = maintenance_track list [@@ocaml.doc ""]

type nonrec track_list_message = {
  maintenance_tracks : track_list option;
      [@ocaml.doc
        "A list of maintenance tracks output by the [DescribeClusterTracks] operation. \n"]
  marker : string_ option;
      [@ocaml.doc
        "The starting point to return a set of response tracklist records. You can retrieve the \
         next set of response records by providing the returned marker value in the [Marker] \
         parameter and retrying the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_cluster_tracks_message = {
  maintenance_track_name : string_ option; [@ocaml.doc "The name of the maintenance track. \n"]
  max_records : integer_optional option;
      [@ocaml.doc "An integer value for the maximum number of maintenance tracks to return.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusterTracks] request exceed the value specified \
         in [MaxRecords], Amazon Redshift returns a value in the [Marker] field of the response. \
         You can retrieve the next set of response records by providing the returned marker value \
         in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_cluster_versions_message = {
  cluster_version : string_ option;
      [@ocaml.doc "The specific cluster version to return.\n\n Example: [1.0] \n "]
  cluster_parameter_group_family : string_ option;
      [@ocaml.doc
        "The name of a specific cluster parameter group family to return details for.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 255 alphanumeric characters\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusterVersions] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_clusters_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier of a cluster whose properties you are requesting. This parameter is \
         case sensitive.\n\n\
        \ The default is that all clusters defined for an account are returned.\n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeClusters] request exceed the value specified in \
         [MaxRecords], Amazon Web Services returns a value in the [Marker] field of the response. \
         You can retrieve the next set of response records by providing the returned marker value \
         in the [Marker] parameter and retrying the request. \n\n\
        \ Constraints: You can specify either the {b ClusterIdentifier} parameter or the {b \
         Marker} parameter, but not both. \n\
        \ "]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching clusters that are associated \
         with the specified key or keys. For example, suppose that you have clusters that are \
         tagged with keys called [owner] and [environment]. If you specify both of these tag keys \
         in the request, Amazon Redshift returns a response with the clusters that have either or \
         both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching clusters that are \
         associated with the specified tag value or values. For example, suppose that you have \
         clusters that are tagged with values called [admin] and [test]. If you specify both of \
         these tag values in the request, Amazon Redshift returns a response with the clusters \
         that have either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_custom_domain_associations_message = {
  custom_domain_name : custom_domain_name_string option;
      [@ocaml.doc "The custom domain name for the custom domain association.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc "The certificate Amazon Resource Name (ARN) for the custom domain association.\n"]
  max_records : integer_optional option;
      [@ocaml.doc "The maximum records setting for the associated custom domain.\n"]
  marker : string_ option; [@ocaml.doc "The marker for the custom domain association.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_shares_result = {
  data_shares : data_share_list option;
      [@ocaml.doc "The results returned from describing datashares.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeDataShares] request exceed the value specified in \
         [MaxRecords], Amazon Web Services returns a value in the [Marker] field of the response. \
         You can retrieve the next set of response records by providing the returned marker value \
         in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_shares_message = {
  data_share_arn : string_ option;
      [@ocaml.doc "The Amazon resource name (ARN) of the datashare to describe details of.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeDataShares] request exceed the value specified in \
         [MaxRecords], Amazon Web Services returns a value in the [Marker] field of the response. \
         You can retrieve the next set of response records by providing the returned marker value \
         in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_shares_for_consumer_result = {
  data_shares : data_share_list option;
      [@ocaml.doc "Shows the results of datashares available for consumers.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeDataSharesForConsumer] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_shares_for_consumer_message = {
  consumer_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the consumer namespace that returns in the list of \
         datashares.\n"]
  status : data_share_status_for_consumer option;
      [@ocaml.doc
        "An identifier giving the status of a datashare in the consumer cluster. If this field is \
         specified, Amazon Redshift returns the list of datashares that have the specified status.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeDataSharesForConsumer] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_shares_for_producer_result = {
  data_shares : data_share_list option;
      [@ocaml.doc "Shows the results of datashares available for producers.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeDataSharesForProducer] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_shares_for_producer_message = {
  producer_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the producer namespace that returns in the list of \
         datashares.\n"]
  status : data_share_status_for_producer option;
      [@ocaml.doc
        "An identifier giving the status of a datashare in the producer. If this field is \
         specified, Amazon Redshift returns the list of datashares that have the specified status.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeDataSharesForProducer] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_default_cluster_parameters_result = {
  default_cluster_parameters : default_cluster_parameters option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec describe_default_cluster_parameters_message = {
  parameter_group_family : string_; [@ocaml.doc "The name of the cluster parameter group family.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeDefaultClusterParameters] request exceed the \
         value specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] \
         field of the response. You can retrieve the next set of response records by providing the \
         returned marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec endpoint_accesses = endpoint_access list [@@ocaml.doc ""]

type nonrec endpoint_access_list = {
  endpoint_access_list : endpoint_accesses option;
      [@ocaml.doc "The list of endpoints with access to the cluster.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeEndpointAccess] request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by the [MaxRecords] parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoint_access_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc "The cluster identifier associated with the described endpoint.\n"]
  resource_owner : string_ option;
      [@ocaml.doc "The Amazon Web Services account ID of the owner of the cluster.\n"]
  endpoint_name : string_ option; [@ocaml.doc "The name of the endpoint to be described.\n"]
  vpc_id : string_ option;
      [@ocaml.doc "The virtual private cloud (VPC) identifier with access to the cluster.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a [Marker] is included in the \
         response so that the remaining results can be retrieved.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeEndpointAccess] request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by the [MaxRecords] parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint_authorizations = endpoint_authorization list [@@ocaml.doc ""]

type nonrec endpoint_authorization_list = {
  endpoint_authorization_list : endpoint_authorizations option;
      [@ocaml.doc "The authorizations to an endpoint.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeEndpointAuthorization] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by the [MaxRecords] parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_endpoint_authorization_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc "The cluster identifier of the cluster to access.\n"]
  account : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account ID of either the cluster owner (grantor) or grantee. If \
         [Grantee] parameter is true, then the [Account] value is of the grantor.\n"]
  grantee : boolean_optional option;
      [@ocaml.doc
        "Indicates whether to check authorization from a grantor or grantee point of view. If \
         true, Amazon Redshift returns endpoint authorizations that you've been granted. If false \
         (default), checks authorization from a grantor point of view.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a [Marker] is included in the \
         response so that the remaining results can be retrieved.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeEndpointAuthorization] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by the [MaxRecords] parameter.\n"]
}
[@@ocaml.doc ""]

type nonrec event_info_map = {
  event_id : string_ option; [@ocaml.doc "The identifier of an Amazon Redshift event.\n"]
  event_categories : event_categories_list option;
      [@ocaml.doc "The category of an Amazon Redshift event.\n"]
  event_description : string_ option; [@ocaml.doc "The description of an Amazon Redshift event.\n"]
  severity : string_ option; [@ocaml.doc "The severity of the event.\n\n Values: ERROR, INFO\n "]
}
[@@ocaml.doc "Describes event information.\n"]

type nonrec event_info_map_list = event_info_map list [@@ocaml.doc ""]

type nonrec event_categories_map = {
  source_type : string_ option;
      [@ocaml.doc
        "The source type, such as cluster or cluster-snapshot, that the returned categories belong \
         to.\n"]
  events : event_info_map_list option; [@ocaml.doc "The events in the event category.\n"]
}
[@@ocaml.doc "Describes event categories.\n"]

type nonrec event_categories_map_list = event_categories_map list [@@ocaml.doc ""]

type nonrec event_categories_message = {
  event_categories_map_list : event_categories_map_list option;
      [@ocaml.doc "A list of event categories descriptions.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_event_categories_message = {
  source_type : string_ option;
      [@ocaml.doc
        "The source type, such as cluster or parameter group, to which the described event \
         categories apply.\n\n\
        \ Valid values: cluster, cluster-snapshot, cluster-parameter-group, \
         cluster-security-group, and scheduled-action.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec event_subscriptions_list = event_subscription list [@@ocaml.doc ""]

type nonrec event_subscriptions_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  event_subscriptions_list : event_subscriptions_list option;
      [@ocaml.doc "A list of event subscriptions.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_event_subscriptions_message = {
  subscription_name : string_ option;
      [@ocaml.doc
        "The name of the Amazon Redshift event notification subscription to be described.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a DescribeEventSubscriptions request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching event notification \
         subscriptions that are associated with the specified key or keys. For example, suppose \
         that you have subscriptions that are tagged with keys called [owner] and [environment]. \
         If you specify both of these tag keys in the request, Amazon Redshift returns a response \
         with the subscriptions that have either or both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching event notification \
         subscriptions that are associated with the specified tag value or values. For example, \
         suppose that you have subscriptions that are tagged with values called [admin] and \
         [test]. If you specify both of these tag values in the request, Amazon Redshift returns a \
         response with the subscriptions that have either or both of these tag values associated \
         with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec source_type =
  | Cluster [@ocaml.doc ""]
  | Cluster_parameter_group [@ocaml.doc ""]
  | Cluster_security_group [@ocaml.doc ""]
  | Cluster_snapshot [@ocaml.doc ""]
  | Scheduled_action [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event = {
  source_identifier : string_ option; [@ocaml.doc "The identifier for the source of the event.\n"]
  source_type : source_type option; [@ocaml.doc "The source type for this event.\n"]
  message : string_ option; [@ocaml.doc "The text of this event.\n"]
  event_categories : event_categories_list option;
      [@ocaml.doc
        "A list of the event categories.\n\n\
        \ Values: Configuration, Management, Monitoring, Security, Pending\n\
        \ "]
  severity : string_ option; [@ocaml.doc "The severity of the event.\n\n Values: ERROR, INFO\n "]
  date : t_stamp option; [@ocaml.doc "The date and time of the event.\n"]
  event_id : string_ option; [@ocaml.doc "The identifier of the event.\n"]
}
[@@ocaml.doc "Describes an event.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec events_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  events : event_list option; [@ocaml.doc "A list of [Event] instances. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_events_message = {
  source_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the event source for which events will be returned. If this parameter \
         is not specified, then all sources are included in the response.\n\n\
        \ Constraints:\n\
        \ \n\
        \  If {i SourceIdentifier} is supplied, {i SourceType} must also be provided.\n\
        \  \n\
        \   {ul\n\
        \         {-  Specify a cluster identifier when {i SourceType} is [cluster].\n\
        \             \n\
        \              }\n\
        \         {-  Specify a cluster security group name when {i SourceType} is \
         [cluster-security-group].\n\
        \             \n\
        \              }\n\
        \         {-  Specify a cluster parameter group name when {i SourceType} is \
         [cluster-parameter-group].\n\
        \             \n\
        \              }\n\
        \         {-  Specify a cluster snapshot identifier when {i SourceType} is \
         [cluster-snapshot].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  source_type : source_type option;
      [@ocaml.doc
        "The event source to retrieve events for. If no value is specified, all events are \
         returned.\n\n\
        \ Constraints:\n\
        \ \n\
        \  If {i SourceType} is supplied, {i SourceIdentifier} must also be provided.\n\
        \  \n\
        \   {ul\n\
        \         {-  Specify [cluster] when {i SourceIdentifier} is a cluster identifier.\n\
        \             \n\
        \              }\n\
        \         {-  Specify [cluster-security-group] when {i SourceIdentifier} is a cluster \
         security group name.\n\
        \             \n\
        \              }\n\
        \         {-  Specify [cluster-parameter-group] when {i SourceIdentifier} is a cluster \
         parameter group name.\n\
        \             \n\
        \              }\n\
        \         {-  Specify [cluster-snapshot] when {i SourceIdentifier} is a cluster snapshot \
         identifier.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  start_time : t_stamp option;
      [@ocaml.doc
        "The beginning of the time interval to retrieve events for, specified in ISO 8601 format. \
         For more information about ISO 8601, go to the \
         {{:http://en.wikipedia.org/wiki/ISO_8601}ISO8601 Wikipedia page.} \n\n\
        \ Example: [2009-07-08T18:00Z] \n\
        \ "]
  end_time : t_stamp option;
      [@ocaml.doc
        "The end of the time interval for which to retrieve events, specified in ISO 8601 format. \
         For more information about ISO 8601, go to the \
         {{:http://en.wikipedia.org/wiki/ISO_8601}ISO8601 Wikipedia page.} \n\n\
        \ Example: [2009-07-08T18:00Z] \n\
        \ "]
  duration : integer_optional option;
      [@ocaml.doc
        "The number of minutes prior to the time of the request for which to retrieve events. For \
         example, if the request is sent at 18:00 and you specify a duration of 60, then only \
         events which have occurred after 17:00 will be returned.\n\n\
        \ Default: [60] \n\
        \ "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeEvents] request exceed the value specified in \
         [MaxRecords], Amazon Web Services returns a value in the [Marker] field of the response. \
         You can retrieve the next set of response records by providing the returned marker value \
         in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec hsm_client_certificate_list = hsm_client_certificate list [@@ocaml.doc ""]

type nonrec hsm_client_certificate_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  hsm_client_certificates : hsm_client_certificate_list option;
      [@ocaml.doc
        "A list of the identifiers for one or more HSM client certificates used by Amazon Redshift \
         clusters to store and retrieve database encryption keys in an HSM.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_hsm_client_certificates_message = {
  hsm_client_certificate_identifier : string_ option;
      [@ocaml.doc
        "The identifier of a specific HSM client certificate for which you want information. If no \
         identifier is specified, information is returned for all HSM client certificates owned by \
         your Amazon Web Services account.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeHsmClientCertificates] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching HSM client certificates that \
         are associated with the specified key or keys. For example, suppose that you have HSM \
         client certificates that are tagged with keys called [owner] and [environment]. If you \
         specify both of these tag keys in the request, Amazon Redshift returns a response with \
         the HSM client certificates that have either or both of these tag keys associated with \
         them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching HSM client certificates \
         that are associated with the specified tag value or values. For example, suppose that you \
         have HSM client certificates that are tagged with values called [admin] and [test]. If \
         you specify both of these tag values in the request, Amazon Redshift returns a response \
         with the HSM client certificates that have either or both of these tag values associated \
         with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec hsm_configuration_list = hsm_configuration list [@@ocaml.doc ""]

type nonrec hsm_configuration_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  hsm_configurations : hsm_configuration_list option;
      [@ocaml.doc "A list of [HsmConfiguration] objects.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_hsm_configurations_message = {
  hsm_configuration_identifier : string_ option;
      [@ocaml.doc
        "The identifier of a specific Amazon Redshift HSM configuration to be described. If no \
         identifier is specified, information is returned for all HSM configurations owned by your \
         Amazon Web Services account.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeHsmConfigurations] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching HSM configurations that are \
         associated with the specified key or keys. For example, suppose that you have HSM \
         configurations that are tagged with keys called [owner] and [environment]. If you specify \
         both of these tag keys in the request, Amazon Redshift returns a response with the HSM \
         configurations that have either or both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching HSM configurations that \
         are associated with the specified tag value or values. For example, suppose that you have \
         HSM configurations that are tagged with values called [admin] and [test]. If you specify \
         both of these tag values in the request, Amazon Redshift returns a response with the HSM \
         configurations that have either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec inbound_integration_arn = string [@@ocaml.doc ""]

type nonrec inbound_integration = {
  integration_arn : inbound_integration_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of an inbound integration.\n"]
  source_arn : string_ option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the source of an inbound integration.\n"]
  target_arn : target_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target of an inbound integration.\n"]
  status : zero_etl_integration_status option;
      [@ocaml.doc "The status of an inbound integration.\n"]
  errors : integration_error_list option;
      [@ocaml.doc
        "The outstanding errors of an inbound integration. Each item is an \"IntegrationError\". \
         This is null if there is no error.\n"]
  create_time : t_stamp option; [@ocaml.doc "The creation time of an inbound integration.\n"]
}
[@@ocaml.doc "The content of an inbound integration.\n"]

type nonrec inbound_integration_list = inbound_integration list [@@ocaml.doc ""]

type nonrec inbound_integrations_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  inbound_integrations : inbound_integration_list option;
      [@ocaml.doc "A list of [InboundIntegration] instances.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_inbound_integrations_message = {
  integration_arn : inbound_integration_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the inbound integration.\n"]
  target_arn : target_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the target of an inbound integration.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeInboundIntegrations] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc ""]

type nonrec integration_list = integration list [@@ocaml.doc ""]

type nonrec integrations_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request.\n"]
  integrations : integration_list option; [@ocaml.doc "List of integrations that are described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_integrations_filter_value_list = string_ list [@@ocaml.doc ""]

type nonrec describe_integrations_filter_name =
  | INTEGRATION_ARN [@ocaml.doc ""]
  | SOURCE_ARN [@ocaml.doc ""]
  | SOURCE_TYPES [@ocaml.doc ""]
  | STATUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_integrations_filter = {
  name : describe_integrations_filter_name;
      [@ocaml.doc "Specifies the type of integration filter.\n"]
  values : describe_integrations_filter_value_list;
      [@ocaml.doc "Specifies the values to filter on.\n"]
}
[@@ocaml.doc "A set of elements to filter the returned integrations.\n"]

type nonrec describe_integrations_filter_list = describe_integrations_filter list [@@ocaml.doc ""]

type nonrec describe_integrations_message = {
  integration_arn : integration_arn option;
      [@ocaml.doc "The unique identifier of the integration.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeIntegrations] request. If \
         this parameter is specified, the response includes only records beyond the marker, up to \
         the value specified by [MaxRecords].\n"]
  filters : describe_integrations_filter_list option;
      [@ocaml.doc "A filter that specifies one or more resources to return.\n"]
}
[@@ocaml.doc ""]

type nonrec log_type_list = string_ list [@@ocaml.doc ""]

type nonrec log_destination_type = S3 [@ocaml.doc ""] | CLOUDWATCH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec s3_key_prefix_value = string [@@ocaml.doc ""]

type nonrec logging_status = {
  logging_enabled : boolean_ option;
      [@ocaml.doc " [true] if logging is on, [false] if logging is off.\n"]
  bucket_name : string_ option;
      [@ocaml.doc "The name of the S3 bucket where the log files are stored.\n"]
  s3_key_prefix : s3_key_prefix_value option;
      [@ocaml.doc "The prefix applied to the log file names.\n"]
  last_successful_delivery_time : t_stamp option;
      [@ocaml.doc "The last time that logs were delivered.\n"]
  last_failure_time : t_stamp option;
      [@ocaml.doc "The last time when logs failed to be delivered.\n"]
  last_failure_message : string_ option;
      [@ocaml.doc "The message indicating that logs failed to be delivered.\n"]
  log_destination_type : log_destination_type option;
      [@ocaml.doc
        "The log destination type. An enum with possible values of [s3] and [cloudwatch].\n"]
  log_exports : log_type_list option;
      [@ocaml.doc
        "The collection of exported log types. Possible values are [connectionlog], \
         [useractivitylog], and [userlog].\n"]
}
[@@ocaml.doc "Describes the status of logging for a cluster.\n"]

type nonrec describe_logging_status_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster from which to get the logging status.\n\n\
        \ Example: [examplecluster] \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec mode = STANDARD [@ocaml.doc ""] | HIGH_PERFORMANCE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec node_configuration_option = {
  node_type : string_ option; [@ocaml.doc "The node type, such as, \"ra3.4xlarge\".\n"]
  number_of_nodes : integer option; [@ocaml.doc "The number of nodes.\n"]
  estimated_disk_utilization_percent : double_optional option;
      [@ocaml.doc "The estimated disk utilizaton percentage.\n"]
  mode : mode option; [@ocaml.doc "The category of the node configuration recommendation.\n"]
}
[@@ocaml.doc "A list of node configurations.\n"]

type nonrec node_configuration_option_list = node_configuration_option list [@@ocaml.doc ""]

type nonrec node_configuration_options_message = {
  node_configuration_option_list : node_configuration_option_list option;
      [@ocaml.doc "A list of valid node configurations.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc ""]

type nonrec operator_type =
  | EQ [@ocaml.doc ""]
  | LT [@ocaml.doc ""]
  | GT [@ocaml.doc ""]
  | LE [@ocaml.doc ""]
  | GE [@ocaml.doc ""]
  | IN [@ocaml.doc ""]
  | BETWEEN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec node_configuration_options_filter_name =
  | NODE_TYPE [@ocaml.doc ""]
  | NUM_NODES [@ocaml.doc ""]
  | ESTIMATED_DISK_UTILIZATION_PERCENT [@ocaml.doc ""]
  | MODE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec node_configuration_options_filter = {
  name : node_configuration_options_filter_name option;
      [@ocaml.doc "The name of the element to filter.\n"]
  operator : operator_type option;
      [@ocaml.doc
        "The filter operator. If filter Name is NodeType only the 'in' operator is supported. \
         Provide one value to evaluate for 'eq', 'lt', 'le', 'gt', and 'ge'. Provide two values to \
         evaluate for 'between'. Provide a list of values for 'in'.\n"]
  values : value_string_list option;
      [@ocaml.doc
        "List of values. Compare Name using Operator to Values. If filter Name is NumberOfNodes, \
         then values can range from 0 to 200. If filter Name is EstimatedDiskUtilizationPercent, \
         then values can range from 0 to 100. For example, filter NumberOfNodes (name) GT \
         (operator) 3 (values).\n"]
}
[@@ocaml.doc "A set of elements to filter the returned node configurations.\n"]

type nonrec node_configuration_options_filter_list = node_configuration_options_filter list
[@@ocaml.doc ""]

type nonrec describe_node_configuration_options_message = {
  action_type : action_type;
      [@ocaml.doc
        "The action type to evaluate for possible node configurations. Specify \"restore-cluster\" \
         to get configuration combinations based on an existing snapshot. Specify \
         \"recommend-node-config\" to get configuration recommendations based on an existing \
         cluster or snapshot. Specify \"resize-cluster\" to get configuration combinations for \
         elastic resize based on an existing cluster. \n"]
  cluster_identifier : string_ option;
      [@ocaml.doc "The identifier of the cluster to evaluate for possible node configurations.\n"]
  snapshot_identifier : string_ option;
      [@ocaml.doc "The identifier of the snapshot to evaluate for possible node configurations.\n"]
  snapshot_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the snapshot associated with the message to describe \
         node configuration.\n"]
  owner_account : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account used to create or copy the snapshot. Required if you are \
         restoring a snapshot you do not own, optional if you own the snapshot.\n"]
  filters : node_configuration_options_filter_list option;
      [@ocaml.doc "A set of name, operator, and value items to filter the results.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeNodeConfigurationOptions] request exceed the \
         value specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] \
         field of the response. You can retrieve the next set of response records by providing the \
         returned marker value in the [Marker] parameter and retrying the request. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [500] \n\
        \ \n\
        \  Constraints: minimum 100, maximum 500.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec orderable_cluster_option = {
  cluster_version : string_ option; [@ocaml.doc "The version of the orderable cluster.\n"]
  cluster_type : string_ option; [@ocaml.doc "The cluster type, for example [multi-node]. \n"]
  node_type : string_ option; [@ocaml.doc "The node type for the orderable cluster.\n"]
  availability_zones : availability_zone_list option;
      [@ocaml.doc "A list of availability zones for the orderable cluster.\n"]
}
[@@ocaml.doc "Describes an orderable cluster option.\n"]

type nonrec orderable_cluster_options_list = orderable_cluster_option list [@@ocaml.doc ""]

type nonrec orderable_cluster_options_message = {
  orderable_cluster_options : orderable_cluster_options_list option;
      [@ocaml.doc
        "An [OrderableClusterOption] structure containing information about orderable options for \
         the cluster.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc "Contains the output from the [DescribeOrderableClusterOptions] action. \n"]

type nonrec describe_orderable_cluster_options_message = {
  cluster_version : string_ option;
      [@ocaml.doc
        "The version filter value. Specify this parameter to show only the available offerings \
         matching the specified version.\n\n\
        \ Default: All versions.\n\
        \ \n\
        \  Constraints: Must be one of the version returned from [DescribeClusterVersions].\n\
        \  "]
  node_type : string_ option;
      [@ocaml.doc
        "The node type filter value. Specify this parameter to show only the available offerings \
         matching the specified node type.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeOrderableClusterOptions] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec partner_integration_status_message = string [@@ocaml.doc ""]

type nonrec partner_integration_status =
  | Active [@ocaml.doc ""]
  | Inactive [@ocaml.doc ""]
  | RuntimeFailure [@ocaml.doc ""]
  | ConnectionFailure [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec partner_integration_info = {
  database_name : partner_integration_database_name option;
      [@ocaml.doc "The name of the database that receives data from a partner.\n"]
  partner_name : partner_integration_partner_name option; [@ocaml.doc "The name of the partner.\n"]
  status : partner_integration_status option; [@ocaml.doc "The partner integration status.\n"]
  status_message : partner_integration_status_message option;
      [@ocaml.doc "The status message provided by the partner.\n"]
  created_at : t_stamp option;
      [@ocaml.doc "The date (UTC) that the partner integration was created.\n"]
  updated_at : t_stamp option;
      [@ocaml.doc
        "The date (UTC) that the partner integration status was last updated by the partner.\n"]
}
[@@ocaml.doc "Describes a partner integration.\n"]

type nonrec partner_integration_info_list = partner_integration_info list [@@ocaml.doc ""]

type nonrec describe_partners_output_message = {
  partner_integration_info_list : partner_integration_info_list option;
      [@ocaml.doc "A list of partner integrations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_partners_input_message = {
  account_id : partner_integration_account_id;
      [@ocaml.doc "The Amazon Web Services account ID that owns the cluster.\n"]
  cluster_identifier : partner_integration_cluster_identifier;
      [@ocaml.doc
        "The cluster identifier of the cluster whose partner integration is being described.\n"]
  database_name : partner_integration_database_name option;
      [@ocaml.doc
        "The name of the database whose partner integration is being described. If database name \
         is not specified, then all databases in the cluster are described.\n"]
  partner_name : partner_integration_partner_name option;
      [@ocaml.doc
        "The name of the partner that is being described. If partner name is not specified, then \
         all partner integrations are described.\n"]
}
[@@ocaml.doc ""]

type nonrec redshift_idc_application_list = redshift_idc_application list [@@ocaml.doc ""]

type nonrec describe_redshift_idc_applications_result = {
  redshift_idc_applications : redshift_idc_application_list option;
      [@ocaml.doc "The list of Amazon Redshift IAM Identity Center applications.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the Marker parameter and retrying \
         the command. If the Marker field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_redshift_idc_applications_message = {
  redshift_idc_application_arn : string_ option;
      [@ocaml.doc
        "The ARN for the Redshift application that integrates with IAM Identity Center.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified MaxRecords value, a value is returned in a marker \
         field of the response. You can retrieve the next set of records by retrying the command \
         with the returned marker value.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the Marker parameter and retrying \
         the command. If the Marker field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc ""]

type nonrec reserved_node_exchange_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The reserved-node exchange status wasn't found.\n"]

type nonrec reserved_node_exchange_status_list = reserved_node_exchange_status list [@@ocaml.doc ""]

type nonrec describe_reserved_node_exchange_status_output_message = {
  reserved_node_exchange_status_details : reserved_node_exchange_status_list option;
      [@ocaml.doc
        "The details of the reserved-node exchange request, including the status, request time, \
         source reserved-node identifier, and additional details.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A pagination token provided by a previous [DescribeReservedNodeExchangeStatus] request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_reserved_node_exchange_status_input_message = {
  reserved_node_id : string_ option;
      [@ocaml.doc
        "The identifier of the source reserved node in a reserved-node exchange request.\n"]
  reserved_node_exchange_request_id : string_ option;
      [@ocaml.doc "The identifier of the reserved-node exchange request.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [Marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeReservedNodeExchangeStatus] \
         request. If this parameter is specified, the response includes only records beyond the \
         marker, up to the value specified by the [MaxRecords] parameter. You can retrieve the \
         next set of response records by providing the returned marker value in the [Marker] \
         parameter and retrying the request.\n"]
}
[@@ocaml.doc ""]

type nonrec reserved_node_offering = {
  reserved_node_offering_id : string_ option; [@ocaml.doc "The offering identifier.\n"]
  node_type : string_ option; [@ocaml.doc "The node type offered by the reserved node offering.\n"]
  duration : integer option;
      [@ocaml.doc "The duration, in seconds, for which the offering will reserve the node.\n"]
  fixed_price : double option;
      [@ocaml.doc
        "The upfront fixed charge you will pay to purchase the specific reserved node offering.\n"]
  usage_price : double option;
      [@ocaml.doc
        "The rate you are charged for each hour the cluster that is using the offering is running.\n"]
  currency_code : string_ option; [@ocaml.doc "The currency code for the compute nodes offering.\n"]
  offering_type : string_ option;
      [@ocaml.doc
        "The anticipated utilization of the reserved node, as defined in the reserved node offering.\n"]
  recurring_charges : recurring_charge_list option;
      [@ocaml.doc
        "The charge to your account regardless of whether you are creating any clusters using the \
         node offering. Recurring charges are only in effect for heavy-utilization reserved nodes.\n"]
  reserved_node_offering_type : reserved_node_offering_type option; [@ocaml.doc "\n"]
}
[@@ocaml.doc "Describes a reserved node offering.\n"]

type nonrec reserved_node_offering_list = reserved_node_offering list [@@ocaml.doc ""]

type nonrec reserved_node_offerings_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  reserved_node_offerings : reserved_node_offering_list option;
      [@ocaml.doc "A list of [ReservedNodeOffering] objects.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_reserved_node_offerings_message = {
  reserved_node_offering_id : string_ option;
      [@ocaml.doc "The unique identifier for the offering.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeReservedNodeOfferings] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec reserved_node_list = reserved_node list [@@ocaml.doc ""]

type nonrec reserved_nodes_message = {
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  reserved_nodes : reserved_node_list option; [@ocaml.doc "The list of [ReservedNode] objects.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_reserved_nodes_message = {
  reserved_node_id : string_ option; [@ocaml.doc "Identifier for the node reservation.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeReservedNodes] request exceed the value specified \
         in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of the \
         response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_resize_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of a cluster whose resize progress you are requesting. This \
         parameter is case-sensitive.\n\n\
        \ By default, resize operations for all clusters defined for an Amazon Web Services \
         account are returned.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec scheduled_action_list = scheduled_action list [@@ocaml.doc ""]

type nonrec scheduled_actions_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeScheduledActions] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  scheduled_actions : scheduled_action_list option;
      [@ocaml.doc "List of retrieved scheduled actions. \n"]
}
[@@ocaml.doc ""]

type nonrec scheduled_action_filter_name =
  | CLUSTER_IDENTIFIER [@ocaml.doc ""]
  | IAM_ROLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scheduled_action_filter = {
  name : scheduled_action_filter_name; [@ocaml.doc "The type of element to filter. \n"]
  values : value_string_list;
      [@ocaml.doc
        "List of values. Compare if the value (of type defined by [Name]) equals an item in the \
         list of scheduled actions. \n"]
}
[@@ocaml.doc "A set of elements to filter the returned scheduled actions. \n"]

type nonrec scheduled_action_filter_list = scheduled_action_filter list [@@ocaml.doc ""]

type nonrec scheduled_action_type_values =
  | RESIZE_CLUSTER [@ocaml.doc ""]
  | PAUSE_CLUSTER [@ocaml.doc ""]
  | RESUME_CLUSTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_scheduled_actions_message = {
  scheduled_action_name : string_ option;
      [@ocaml.doc "The name of the scheduled action to retrieve. \n"]
  target_action_type : scheduled_action_type_values option;
      [@ocaml.doc "The type of the scheduled actions to retrieve. \n"]
  start_time : t_stamp option;
      [@ocaml.doc
        "The start time in UTC of the scheduled actions to retrieve. Only active scheduled actions \
         that have invocations after this time are retrieved.\n"]
  end_time : t_stamp option;
      [@ocaml.doc
        "The end time in UTC of the scheduled action to retrieve. Only active scheduled actions \
         that have invocations before this time are retrieved.\n"]
  active : boolean_optional option;
      [@ocaml.doc
        "If true, retrieve only active scheduled actions. If false, retrieve only disabled \
         scheduled actions. \n"]
  filters : scheduled_action_filter_list option; [@ocaml.doc "List of scheduled action filters. \n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeScheduledActions] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec snapshot_copy_grant_list = snapshot_copy_grant list [@@ocaml.doc ""]

type nonrec snapshot_copy_grant_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeSnapshotCopyGrant] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n\n\
        \ Constraints: You can specify either the {b SnapshotCopyGrantName} parameter or the {b \
         Marker} parameter, but not both. \n\
        \ "]
  snapshot_copy_grants : snapshot_copy_grant_list option;
      [@ocaml.doc "The list of [SnapshotCopyGrant] objects.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_snapshot_copy_grants_message = {
  snapshot_copy_grant_name : string_ option; [@ocaml.doc "The name of the snapshot copy grant.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeSnapshotCopyGrant] request exceed the value \
         specified in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of \
         the response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n\n\
        \ Constraints: You can specify either the {b SnapshotCopyGrantName} parameter or the {b \
         Marker} parameter, but not both. \n\
        \ "]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching resources that are associated \
         with the specified key or keys. For example, suppose that you have resources tagged with \
         keys called [owner] and [environment]. If you specify both of these tag keys in the \
         request, Amazon Redshift returns a response with all resources that have either or both \
         of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching resources that are \
         associated with the specified value or values. For example, suppose that you have \
         resources tagged with values called [admin] and [test]. If you specify both of these tag \
         values in the request, Amazon Redshift returns a response with all resources that have \
         either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc "The result of the [DescribeSnapshotCopyGrants] action.\n"]

type nonrec snapshot_schedule_list = snapshot_schedule list [@@ocaml.doc ""]

type nonrec describe_snapshot_schedules_output_message = {
  snapshot_schedules : snapshot_schedule_list option; [@ocaml.doc "A list of SnapshotSchedules.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [marker] parameter and retrying \
         the command. If the [marker] field is empty, all response records have been retrieved for \
         the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_snapshot_schedules_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier for the cluster whose snapshot schedules you want to view.\n"]
  schedule_identifier : string_ option;
      [@ocaml.doc "A unique identifier for a snapshot schedule.\n"]
  tag_keys : tag_key_list option; [@ocaml.doc "The key value for a snapshot schedule tag.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc "The value corresponding to the key of the snapshot schedule tag.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [marker] parameter and retrying \
         the command. If the [marker] field is empty, all response records have been retrieved for \
         the request.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number or response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned [marker] value.\n"]
}
[@@ocaml.doc ""]

type nonrec table_restore_not_found_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified [TableRestoreRequestId] value was not found.\n"]

type nonrec table_restore_status_type =
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table_restore_status = {
  table_restore_request_id : string_ option;
      [@ocaml.doc "The unique identifier for the table restore request.\n"]
  status : table_restore_status_type option;
      [@ocaml.doc
        "A value that describes the current state of the table restore request.\n\n\
        \ Valid Values: [SUCCEEDED], [FAILED], [CANCELED], [PENDING], [IN_PROGRESS] \n\
        \ "]
  message : string_ option;
      [@ocaml.doc
        "A description of the status of the table restore request. Status values include \
         [SUCCEEDED], [FAILED], [CANCELED], [PENDING], [IN_PROGRESS].\n"]
  request_time : t_stamp option;
      [@ocaml.doc
        "The time that the table restore request was made, in Universal Coordinated Time (UTC).\n"]
  progress_in_mega_bytes : long_optional option;
      [@ocaml.doc "The amount of data restored to the new table so far, in megabytes (MB).\n"]
  total_data_in_mega_bytes : long_optional option;
      [@ocaml.doc "The total amount of data to restore to the new table, in megabytes (MB).\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the Amazon Redshift cluster that the table is being restored to.\n"]
  snapshot_identifier : string_ option;
      [@ocaml.doc "The identifier of the snapshot that the table is being restored from.\n"]
  source_database_name : string_ option;
      [@ocaml.doc "The name of the source database that contains the table being restored.\n"]
  source_schema_name : string_ option;
      [@ocaml.doc "The name of the source schema that contains the table being restored.\n"]
  source_table_name : string_ option; [@ocaml.doc "The name of the source table being restored.\n"]
  target_database_name : string_ option;
      [@ocaml.doc "The name of the database to restore the table to.\n"]
  target_schema_name : string_ option;
      [@ocaml.doc "The name of the schema to restore the table to.\n"]
  new_table_name : string_ option;
      [@ocaml.doc "The name of the table to create as a result of the table restore request.\n"]
}
[@@ocaml.doc "Describes the status of a [RestoreTableFromClusterSnapshot] operation.\n"]

type nonrec table_restore_status_list = table_restore_status list [@@ocaml.doc ""]

type nonrec table_restore_status_message = {
  table_restore_status_details : table_restore_status_list option;
      [@ocaml.doc "A list of status details for one or more table restore requests.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A pagination token that can be used in a subsequent [DescribeTableRestoreStatus] request.\n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_table_restore_status_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc "The Amazon Redshift cluster that the table is being restored to.\n"]
  table_restore_request_id : string_ option;
      [@ocaml.doc
        "The identifier of the table restore request to return status for. If you don't specify a \
         [TableRestoreRequestId] value, then [DescribeTableRestoreStatus] returns the status of \
         all in-progress table restore requests.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of records to include in the response. If more records exist than the \
         specified [MaxRecords] value, a pagination token called a marker is included in the \
         response so that the remaining results can be retrieved.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous [DescribeTableRestoreStatus] request. \
         If this parameter is specified, the response includes only records beyond the marker, up \
         to the value specified by the [MaxRecords] parameter.\n"]
}
[@@ocaml.doc "\n"]

type nonrec tagged_resource = {
  tag : tag option; [@ocaml.doc "The tag for the resource.\n"]
  resource_name : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) with which the tag is associated, for example: \
         [arn:aws:redshift:us-east-2:123456789:cluster:t1].\n"]
  resource_type : string_ option;
      [@ocaml.doc
        "The type of resource with which the tag is associated. Valid resource types are: \n\n\
        \ {ul\n\
        \       {-  Cluster\n\
        \           \n\
        \            }\n\
        \       {-  CIDR/IP\n\
        \           \n\
        \            }\n\
        \       {-  EC2 security group\n\
        \           \n\
        \            }\n\
        \       {-  Snapshot\n\
        \           \n\
        \            }\n\
        \       {-  Cluster security group\n\
        \           \n\
        \            }\n\
        \       {-  Subnet group\n\
        \           \n\
        \            }\n\
        \       {-  HSM connection\n\
        \           \n\
        \            }\n\
        \       {-  HSM certificate\n\
        \           \n\
        \            }\n\
        \       {-  Parameter group\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For more information about Amazon Redshift resource types and constructing ARNs, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions}Constructing \
         an Amazon Redshift Amazon Resource Name (ARN)} in the Amazon Redshift Cluster Management \
         Guide. \n\
        \   "]
}
[@@ocaml.doc "A tag and its associated resource.\n"]

type nonrec tagged_resource_list = tagged_resource list [@@ocaml.doc ""]

type nonrec tagged_resource_list_message = {
  tagged_resources : tagged_resource_list option;
      [@ocaml.doc "A list of tags with their associated resources.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc "\n"]

type nonrec describe_tags_message = {
  resource_name : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for which you want to describe the tag or tags. For \
         example, [arn:aws:redshift:us-east-2:123456789:cluster:t1]. \n"]
  resource_type : string_ option;
      [@ocaml.doc
        "The type of resource with which you want to view tags. Valid resource types are: \n\n\
        \ {ul\n\
        \       {-  Cluster\n\
        \           \n\
        \            }\n\
        \       {-  CIDR/IP\n\
        \           \n\
        \            }\n\
        \       {-  EC2 security group\n\
        \           \n\
        \            }\n\
        \       {-  Snapshot\n\
        \           \n\
        \            }\n\
        \       {-  Cluster security group\n\
        \           \n\
        \            }\n\
        \       {-  Subnet group\n\
        \           \n\
        \            }\n\
        \       {-  HSM connection\n\
        \           \n\
        \            }\n\
        \       {-  HSM certificate\n\
        \           \n\
        \            }\n\
        \       {-  Parameter group\n\
        \           \n\
        \            }\n\
        \       {-  Snapshot copy grant\n\
        \           \n\
        \            }\n\
        \       {-  Integration (zero-ETL integration or S3 event integration)\n\
        \           \n\
        \             To describe the tags associated with an [integration], don't specify \
         [ResourceType], instead specify the [ResourceName] of the integration.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \   For more information about Amazon Redshift resource types and constructing ARNs, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/redshift-iam-access-control-overview.html#redshift-iam-access-control-specify-actions}Specifying \
         Policy Elements: Actions, Effects, Resources, and Principals} in the Amazon Redshift \
         Cluster Management Guide. \n\
        \   "]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number or response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned [marker] value. \n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [marker] parameter and retrying \
         the command. If the [marker] field is empty, all response records have been retrieved for \
         the request. \n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching resources that are associated \
         with the specified key or keys. For example, suppose that you have resources tagged with \
         keys called [owner] and [environment]. If you specify both of these tag keys in the \
         request, Amazon Redshift returns a response with all resources that have either or both \
         of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching resources that are \
         associated with the specified value or values. For example, suppose that you have \
         resources tagged with values called [admin] and [test]. If you specify both of these tag \
         values in the request, Amazon Redshift returns a response with all resources that have \
         either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc "\n"]

type nonrec usage_limits = usage_limit list [@@ocaml.doc ""]

type nonrec usage_limit_list = {
  usage_limits : usage_limits option;
      [@ocaml.doc "Contains the output from the [DescribeUsageLimits] action. \n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the [Marker] parameter and retrying \
         the command. If the [Marker] field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_usage_limits_message = {
  usage_limit_id : string_ option; [@ocaml.doc "The identifier of the usage limit to describe.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc "The identifier of the cluster for which you want to describe usage limits.\n"]
  feature_type : usage_limit_feature_type option;
      [@ocaml.doc "The feature type for which you want to describe usage limits.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value. \n\n\
        \ Default: [100] \n\
        \ \n\
        \  Constraints: minimum 20, maximum 100.\n\
        \  "]
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point to return a set of response \
         records. When the results of a [DescribeUsageLimits] request exceed the value specified \
         in [MaxRecords], Amazon Web Services returns a value in the [Marker] field of the \
         response. You can retrieve the next set of response records by providing the returned \
         marker value in the [Marker] parameter and retrying the request. \n"]
  tag_keys : tag_key_list option;
      [@ocaml.doc
        "A tag key or keys for which you want to return all matching usage limit objects that are \
         associated with the specified key or keys. For example, suppose that you have parameter \
         groups that are tagged with keys called [owner] and [environment]. If you specify both of \
         these tag keys in the request, Amazon Redshift returns a response with the usage limit \
         objects have either or both of these tag keys associated with them.\n"]
  tag_values : tag_value_list option;
      [@ocaml.doc
        "A tag value or values for which you want to return all matching usage limit objects that \
         are associated with the specified tag value or values. For example, suppose that you have \
         parameter groups that are tagged with values called [admin] and [test]. If you specify \
         both of these tag values in the request, Amazon Redshift returns a response with the \
         usage limit objects that have either or both of these tag values associated with them.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_logging_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster on which logging is to be stopped.\n\n\
        \ Example: [examplecluster] \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec snapshot_copy_already_disabled_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The cluster already has cross-region snapshot copy disabled.\n"]

type nonrec disable_snapshot_copy_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec disable_snapshot_copy_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the source cluster that you want to disable copying of snapshots \
         to a destination region.\n\n\
        \ Constraints: Must be the valid name of an existing cluster that has cross-region \
         snapshot copy enabled.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec disassociate_data_share_consumer_message = {
  data_share_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the datashare to remove association for.\n"]
  disassociate_entire_account : boolean_optional option;
      [@ocaml.doc
        "A value that specifies whether association for the datashare is removed from the entire \
         account.\n"]
  consumer_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the consumer namespace that association for the \
         datashare is removed from.\n"]
  consumer_region : string_ option;
      [@ocaml.doc
        "From a datashare consumer account, removes association of a datashare from all the \
         existing and future namespaces in the specified Amazon Web Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_s3_key_prefix_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The string specified for the logging S3 key prefix does not comply with the documented \
   constraints.\n"]

type nonrec invalid_s3_bucket_name_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The S3 bucket name is invalid. For more information about naming rules, go to \
   {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/BucketRestrictions.html}Bucket Restrictions \
   and Limitations} in the Amazon Simple Storage Service (S3) Developer Guide.\n"]

type nonrec insufficient_s3_bucket_policy_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The cluster does not have read bucket or put object permissions on the S3 bucket specified when \
   enabling logging.\n"]

type nonrec enable_logging_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster on which logging is to be started.\n\n\
        \ Example: [examplecluster] \n\
        \ "]
  bucket_name : string_ option;
      [@ocaml.doc
        "The name of an existing S3 bucket where the log files are to be stored.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be in the same region as the cluster\n\
        \            \n\
        \             }\n\
        \        {-  The cluster must have read bucket and put object permissions\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  s3_key_prefix : s3_key_prefix_value option;
      [@ocaml.doc
        "The prefix applied to the log file names.\n\n\
        \ Valid characters are any letter from any language, any whitespace character, any numeric \
         character, and the following characters: underscore ([_]), period ([.]), colon ([:]), \
         slash ([/]), equal ([=]), plus ([+]), backslash ([\\]), hyphen ([-]), at symbol ([@]).\n\
        \ "]
  log_destination_type : log_destination_type option;
      [@ocaml.doc
        "The log destination type. An enum with possible values of [s3] and [cloudwatch].\n"]
  log_exports : log_type_list option;
      [@ocaml.doc
        "The collection of exported log types. Possible values are [connectionlog], \
         [useractivitylog], and [userlog].\n"]
}
[@@ocaml.doc "\n"]

type nonrec unknown_snapshot_copy_region_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified region is incorrect or does not exist.\n"]

type nonrec snapshot_copy_already_enabled_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The cluster already has cross-region snapshot copy enabled.\n"]

type nonrec incompatible_orderable_options = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified options are incompatible.\n"]

type nonrec enable_snapshot_copy_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec enable_snapshot_copy_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the source cluster to copy snapshots from.\n\n\
        \ Constraints: Must be the valid name of an existing cluster that does not already have \
         cross-region snapshot copy enabled.\n\
        \ "]
  destination_region : string_;
      [@ocaml.doc
        "The destination Amazon Web Services Region that you want to copy snapshots to.\n\n\
        \ Constraints: Must be the name of a valid Amazon Web Services Region. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#redshift_region}Regions and \
         Endpoints} in the Amazon Web Services General Reference. \n\
        \ "]
  retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days to retain automated snapshots in the destination region after they are \
         copied from the source region.\n\n\
        \ Default: 7.\n\
        \ \n\
        \  Constraints: Must be at least 1 and no more than 35.\n\
        \  "]
  snapshot_copy_grant_name : string_ option;
      [@ocaml.doc
        "The name of the snapshot copy grant to use when snapshots of an Amazon Web Services \
         KMS-encrypted cluster are copied to the destination region.\n"]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days to retain newly copied snapshots in the destination Amazon Web \
         Services Region after they are copied from the source Amazon Web Services Region. If the \
         value is -1, the manual snapshot is retained indefinitely. \n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec endpoint_authorization_not_found_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The authorization for this endpoint can't be found.\n"]

type nonrec failover_primary_compute_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec failover_primary_compute_input_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the cluster for which the primary compute unit will be failed \
         over to another Availability Zone.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cluster_credentials_message = {
  db_user : string_;
      [@ocaml.doc
        "The name of a database user. If a user name matching [DbUser] exists in the database, the \
         temporary user credentials have the same permissions as the existing user. If [DbUser] \
         doesn't exist in the database and [Autocreate] is [True], a new user is created using the \
         value for [DbUser] with PUBLIC permissions. If a database user matching the value for \
         [DbUser] doesn't exist and [Autocreate] is [False], then the command succeeds but the \
         connection attempt will fail because the user doesn't exist in the database.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/r_CREATE_USER.html}CREATE USER} in the \
         Amazon Redshift Database Developer Guide. \n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be 1 to 64 alphanumeric characters or hyphens. The user name can't be \
         [PUBLIC].\n\
        \             \n\
        \              }\n\
        \         {-  Must contain uppercase or lowercase letters, numbers, underscore, plus sign, \
         period (dot), at symbol (\\@), or hyphen.\n\
        \             \n\
        \              }\n\
        \         {-  First character must be a letter.\n\
        \             \n\
        \              }\n\
        \         {-  Must not contain a colon ( : ) or slash ( / ). \n\
        \             \n\
        \              }\n\
        \         {-  Cannot be a reserved word. A list of reserved words can be found in \
         {{:http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html}Reserved Words} in \
         the Amazon Redshift Database Developer Guide.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  db_name : string_ option;
      [@ocaml.doc
        "The name of a database that [DbUser] is authorized to log on to. If [DbName] is not \
         specified, [DbUser] can log on to any existing database.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 64 alphanumeric characters or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  Must contain uppercase or lowercase letters, numbers, underscore, plus sign, \
         period (dot), at symbol (\\@), or hyphen.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Must not contain a colon ( : ) or slash ( / ). \n\
        \            \n\
        \             }\n\
        \        {-  Cannot be a reserved word. A list of reserved words can be found in \
         {{:http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html}Reserved Words} in \
         the Amazon Redshift Database Developer Guide.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier of the cluster that contains the database for which you are \
         requesting credentials. This parameter is case sensitive.\n"]
  duration_seconds : integer_optional option;
      [@ocaml.doc
        "The number of seconds until the returned temporary password expires.\n\n\
        \ Constraint: minimum 900, maximum 3600.\n\
        \ \n\
        \  Default: 900\n\
        \  "]
  auto_create : boolean_optional option;
      [@ocaml.doc
        "Create a database user with the name specified for the user named in [DbUser] if one does \
         not exist.\n"]
  db_groups : db_group_list option;
      [@ocaml.doc
        "A list of the names of existing database groups that the user named in [DbUser] will join \
         for the current session, in addition to any group memberships for an existing user. If \
         not specified, a new user is added only to PUBLIC.\n\n\
        \ Database group name constraints\n\
        \ \n\
        \  {ul\n\
        \        {-  Must be 1 to 64 alphanumeric characters or hyphens\n\
        \            \n\
        \             }\n\
        \        {-  Must contain only lowercase letters, numbers, underscore, plus sign, period \
         (dot), at symbol (\\@), or hyphen.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Must not contain a colon ( : ) or slash ( / ). \n\
        \            \n\
        \             }\n\
        \        {-  Cannot be a reserved word. A list of reserved words can be found in \
         {{:http://docs.aws.amazon.com/redshift/latest/dg/r_pg_keywords.html}Reserved Words} in \
         the Amazon Redshift Database Developer Guide.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  custom_domain_name : string_ option;
      [@ocaml.doc "The custom domain name for the cluster credentials.\n"]
}
[@@ocaml.doc "The request parameters to get cluster credentials.\n"]

type nonrec get_cluster_credentials_with_iam_message = {
  db_name : string_ option;
      [@ocaml.doc
        "The name of the database for which you are requesting credentials. If the database name \
         is specified, the IAM policy must allow access to the resource [dbname] for the specified \
         database name. If the database name is not specified, access to all databases is allowed.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier of the cluster that contains the database for which you are \
         requesting credentials. \n"]
  duration_seconds : integer_optional option;
      [@ocaml.doc
        "The number of seconds until the returned temporary password expires.\n\n\
        \ Range: 900-3600. Default: 900.\n\
        \ "]
  custom_domain_name : string_ option;
      [@ocaml.doc "The custom domain name for the IAM message cluster credentials.\n"]
}
[@@ocaml.doc ""]

type nonrec redshift_invalid_parameter_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The request contains one or more invalid parameters. This error occurs when required parameters \
   are missing, parameter values are outside acceptable ranges, or parameter formats are incorrect.\n"]

type nonrec get_identity_center_auth_token_response = {
  token : sensitive_string option;
      [@ocaml.doc
        "The encrypted authentication token containing the caller's Amazon Web Services IAM \
         Identity Center identity information. This token is encrypted using Key Management \
         Service and can only be decrypted by the specified Amazon Redshift clusters. Use this \
         token with Amazon Redshift drivers to authenticate using your Amazon Web Services IAM \
         Identity Center identity.\n"]
  expiration_time : t_stamp option;
      [@ocaml.doc
        "The time (UTC) when the token expires. After this timestamp, the token will no longer be \
         valid for authentication.\n"]
}
[@@ocaml.doc
  "The response from GetIdentityCenterAuthToken containing the encrypted authentication token and \
   expiration time.\n"]

type nonrec get_identity_center_auth_token_request = {
  cluster_ids : cluster_identifier_list;
      [@ocaml.doc
        "A list of cluster identifiers that the generated token can be used with. The token will \
         be scoped to only allow authentication to the specified clusters.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ClusterIds] must contain at least 1 cluster identifier.\n\
        \            \n\
        \             }\n\
        \        {-   [ClusterIds] can hold a maximum of 20 cluster identifiers.\n\
        \            \n\
        \             }\n\
        \        {-  Cluster identifiers must be 1 to 63 characters in length.\n\
        \            \n\
        \             }\n\
        \        {-  The characters accepted for cluster identifiers are the following:\n\
        \            \n\
        \             {ul\n\
        \                   {-  Alphanumeric characters\n\
        \                       \n\
        \                        }\n\
        \                   {-  Hyphens\n\
        \                       \n\
        \                        }\n\
        \                   \n\
        \         }\n\
        \          }\n\
        \        {-  Cluster identifiers must start with a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cluster identifiers can't end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "The request parameters for [GetIdentityCenterAuthToken].\n"]

type nonrec reserved_node_configuration_option = {
  source_reserved_node : reserved_node option; [@ocaml.doc ""]
  target_reserved_node_count : integer option; [@ocaml.doc "The target reserved-node count.\n"]
  target_reserved_node_offering : reserved_node_offering option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Details for a reserved-node exchange. Examples include the node type for a reserved node, the \
   price for a node, the node's state, and other details.\n"]

type nonrec reserved_node_configuration_option_list = reserved_node_configuration_option list
[@@ocaml.doc ""]

type nonrec get_reserved_node_exchange_configuration_options_output_message = {
  marker : string_ option;
      [@ocaml.doc
        "A pagination token provided by a previous [GetReservedNodeExchangeConfigurationOptions] \
         request.\n"]
  reserved_node_configuration_option_list : reserved_node_configuration_option_list option;
      [@ocaml.doc
        "the configuration options for the reserved-node exchange. These options include \
         information about the source reserved node and target reserved node. Details include the \
         node type, the price, the node count, and the offering type.\n"]
}
[@@ocaml.doc ""]

type nonrec reserved_node_exchange_action_type =
  | RESTORE_CLUSTER [@ocaml.doc ""]
  | RESIZE_CLUSTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_reserved_node_exchange_configuration_options_input_message = {
  action_type : reserved_node_exchange_action_type;
      [@ocaml.doc
        "The action type of the reserved-node configuration. The action type can be an exchange \
         initiated from either a snapshot or a resize.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The identifier for the cluster that is the source for a reserved-node exchange.\n"]
  snapshot_identifier : string_ option;
      [@ocaml.doc
        "The identifier for the snapshot that is the source for the reserved-node exchange.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified [MaxRecords] value, a value is returned in a \
         [Marker] field of the response. You can retrieve the next set of records by retrying the \
         command with the returned marker value.\n"]
  marker : string_ option;
      [@ocaml.doc
        "An optional pagination token provided by a previous \
         [GetReservedNodeExchangeConfigurationOptions] request. If this parameter is specified, \
         the response includes only records beyond the marker, up to the value specified by the \
         [MaxRecords] parameter. You can retrieve the next set of response records by providing \
         the returned marker value in the [Marker] parameter and retrying the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reserved_node_exchange_offerings_output_message = {
  marker : string_ option;
      [@ocaml.doc
        "An optional parameter that specifies the starting point for returning a set of response \
         records. When the results of a [GetReservedNodeExchangeOfferings] request exceed the \
         value specified in MaxRecords, Amazon Redshift returns a value in the marker field of the \
         response. You can retrieve the next set of response records by providing the returned \
         marker value in the marker parameter and retrying the request. \n"]
  reserved_node_offerings : reserved_node_offering_list option;
      [@ocaml.doc "Returns an array of [ReservedNodeOffering] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec get_reserved_node_exchange_offerings_input_message = {
  reserved_node_id : string_;
      [@ocaml.doc
        "A string representing the node identifier for the DC1 Reserved Node to be exchanged.\n"]
  max_records : integer_optional option;
      [@ocaml.doc "An integer setting the maximum number of ReservedNodeOfferings to retrieve.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of ReservedNodeOfferings.\n"]
}
[@@ocaml.doc "\n"]

type nonrec invalid_policy_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource policy isn't valid.\n"]

type nonrec resource_policy = {
  resource_arn : string_ option; [@ocaml.doc "The resources that a policy is attached to.\n"]
  policy : string_ option; [@ocaml.doc "The content of a resource policy.\n"]
}
[@@ocaml.doc "The policy that is attached to a resource.\n"]

type nonrec get_resource_policy_result = {
  resource_policy : resource_policy option; [@ocaml.doc "The content of the resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_message = {
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource of which its resource policy is fetched.\n"]
}
[@@ocaml.doc ""]

type nonrec impact_ranking_type =
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec in_progress_table_restore_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You have exceeded the allowed number of table restore requests. Wait for your current table \
   restore requests to complete before making a new request.\n"]

type nonrec invalid_restore_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The restore is invalid.\n"]

type nonrec invalid_table_restore_argument_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The value specified for the [sourceDatabaseName], [sourceSchemaName], or [sourceTableName] \
   parameter, or a combination of these, doesn't exist in the snapshot.\n"]

type nonrec lakehouse_configuration = {
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier of the cluster associated with this lakehouse configuration.\n"]
  lakehouse_idc_application_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling \
         Amazon Web Services IAM Identity Center trusted identity propagation on a cluster enabled \
         with Amazon Redshift federated permissions.\n"]
  lakehouse_registration_status : string_ option;
      [@ocaml.doc
        "The current status of the lakehouse registration. Indicates whether the cluster is \
         successfully registered with the lakehouse.\n"]
  catalog_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Glue data catalog associated with the lakehouse \
         configuration.\n"]
}
[@@ocaml.doc
  "Contains configuration information for lakehouse integration, including the cluster identifier, \
   catalog ARN, and registration status.\n"]

type nonrec lakehouse_idc_registration = ASSOCIATE [@ocaml.doc ""] | DISASSOCIATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lakehouse_registration = REGISTER [@ocaml.doc ""] | DEREGISTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec reference_link = {
  text : string_ option;
      [@ocaml.doc "The hyperlink text that describes the link to more information.\n"]
  link : string_ option; [@ocaml.doc "The URL address to find more information.\n"]
}
[@@ocaml.doc
  "A link to an Amazon Redshift Advisor reference for more information about a recommendation.\n"]

type nonrec reference_link_list = reference_link list [@@ocaml.doc ""]

type nonrec recommended_action_type = SQL [@ocaml.doc ""] | CLI [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec recommended_action = {
  text : string_ option; [@ocaml.doc "The specific instruction about the command.\n"]
  database : string_ option;
      [@ocaml.doc
        "The database name to perform the action on. Only applicable if the type of command is SQL.\n"]
  command : string_ option; [@ocaml.doc "The command to run.\n"]
  type_ : recommended_action_type option; [@ocaml.doc "The type of command.\n"]
}
[@@ocaml.doc "The recommended action from the Amazon Redshift Advisor recommendation.\n"]

type nonrec recommended_action_list = recommended_action list [@@ocaml.doc ""]

type nonrec recommendation = {
  id : string_ option; [@ocaml.doc "A unique identifier of the Advisor recommendation.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier of the cluster for which the recommendation is returned.\n"]
  namespace_arn : string_ option;
      [@ocaml.doc
        "The Amazon Redshift cluster namespace ARN for which the recommendations is returned.\n"]
  created_at : t_stamp option;
      [@ocaml.doc "The date and time (UTC) that the recommendation was created.\n"]
  recommendation_type : string_ option; [@ocaml.doc "The type of Advisor recommendation.\n"]
  title : string_ option; [@ocaml.doc "The title of the recommendation.\n"]
  description : string_ option; [@ocaml.doc "The description of the recommendation.\n"]
  observation : string_ option;
      [@ocaml.doc "The description of what was observed about your cluster.\n"]
  impact_ranking : impact_ranking_type option;
      [@ocaml.doc
        "The scale of the impact that the Advisor recommendation has to the performance and cost \
         of the cluster.\n"]
  recommendation_text : string_ option; [@ocaml.doc "The description of the recommendation.\n"]
  recommended_actions : recommended_action_list option;
      [@ocaml.doc "List of Amazon Redshift recommended actions.\n"]
  reference_links : reference_link_list option;
      [@ocaml.doc "List of helpful links for more information about the Advisor recommendation.\n"]
}
[@@ocaml.doc "An Amazon Redshift Advisor recommended action on the Amazon Redshift cluster.\n"]

type nonrec recommendation_list = recommendation list [@@ocaml.doc ""]

type nonrec list_recommendations_result = {
  recommendations : recommendation_list option;
      [@ocaml.doc "The Advisor recommendations for action on the Amazon Redshift cluster.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the Marker parameter and retrying \
         the command. If the Marker field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc ""]

type nonrec list_recommendations_message = {
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The unique identifier of the Amazon Redshift cluster for which the list of Advisor \
         recommendations is returned. If the neither the cluster identifier and the cluster \
         namespace ARN parameters are specified, then recommendations for all clusters in the \
         account are returned.\n"]
  namespace_arn : string_ option;
      [@ocaml.doc
        "The Amazon Redshift cluster namespace Amazon Resource Name (ARN) for which the list of \
         Advisor recommendations is returned. If the neither the cluster identifier and the \
         cluster namespace ARN parameters are specified, then recommendations for all clusters in \
         the account are returned.\n"]
  max_records : integer_optional option;
      [@ocaml.doc
        "The maximum number of response records to return in each call. If the number of remaining \
         response records exceeds the specified MaxRecords value, a value is returned in a marker \
         field of the response. You can retrieve the next set of records by retrying the command \
         with the returned marker value.\n"]
  marker : string_ option;
      [@ocaml.doc
        "A value that indicates the starting point for the next set of response records in a \
         subsequent request. If a value is returned in a response, you can retrieve the next set \
         of records by providing this returned marker value in the Marker parameter and retrying \
         the command. If the Marker field is empty, all response records have been retrieved for \
         the request. \n"]
}
[@@ocaml.doc ""]

type nonrec modify_aqua_output_message = {
  aqua_configuration : aqua_configuration option;
      [@ocaml.doc
        "This parameter is retired. Amazon Redshift automatically determines whether to use AQUA \
         (Advanced Query Accelerator). \n"]
}
[@@ocaml.doc ""]

type nonrec modify_aqua_input_message = {
  cluster_identifier : string_; [@ocaml.doc "The identifier of the cluster to be modified.\n"]
  aqua_configuration_status : aqua_configuration_status option;
      [@ocaml.doc
        "This parameter is retired. Amazon Redshift automatically determines whether to use AQUA \
         (Advanced Query Accelerator).\n"]
}
[@@ocaml.doc ""]

type nonrec modify_authentication_profile_result = {
  authentication_profile_name : authentication_profile_name_string option;
      [@ocaml.doc "The name of the authentication profile that was replaced.\n"]
  authentication_profile_content : string_ option;
      [@ocaml.doc "The updated content of the authentication profile in JSON format.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_authentication_profile_message = {
  authentication_profile_name : authentication_profile_name_string;
      [@ocaml.doc "The name of the authentication profile to replace.\n"]
  authentication_profile_content : string_;
      [@ocaml.doc
        "The new content of the authentication profile in JSON format. The maximum length of the \
         JSON string is determined by a quota for your account.\n"]
}
[@@ocaml.doc ""]

type nonrec unsupported_option_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A request option was specified that is not supported.\n"]

type nonrec table_limit_exceeded_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The number of tables in the cluster exceeds the limit for the requested new cluster node type. \n"]

type nonrec modify_cluster_result = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec modify_cluster_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the cluster to be modified.\n\n Example: [examplecluster] \n "]
  cluster_type : string_ option;
      [@ocaml.doc
        "The new cluster type.\n\n\
        \ When you submit your cluster resize request, your existing cluster goes into a read-only \
         mode. After Amazon Redshift provisions a new cluster based on your resize requirements, \
         there will be outage for a period while the old cluster is deleted and your connection is \
         switched to the new cluster. You can use [DescribeResize] to track the progress of the \
         resize request. \n\
        \ \n\
        \  Valid Values: [ multi-node | single-node ] \n\
        \  "]
  node_type : string_ option;
      [@ocaml.doc
        "The new node type of the cluster. If you specify a new node type, you must also specify \
         the number of nodes parameter.\n\n\
        \  For more information about resizing clusters, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/rs-resize-tutorial.html}Resizing \
         Clusters in Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}.\n\
        \ \n\
        \  Valid Values: [dc2.large] | [dc2.8xlarge]| [rg.xlarge] | [rg.4xlarge] | [ra3.large] | \
         [ra3.xlplus] | [ra3.4xlarge] | [ra3.16xlarge] \n\
        \  "]
  number_of_nodes : integer_optional option;
      [@ocaml.doc
        "The new number of nodes of the cluster. If you specify a new number of nodes, you must \
         also specify the node type parameter.\n\n\
        \  For more information about resizing clusters, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/rs-resize-tutorial.html}Resizing \
         Clusters in Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}.\n\
        \ \n\
        \  Valid Values: Integer greater than [0].\n\
        \  "]
  cluster_security_groups : cluster_security_group_name_list option;
      [@ocaml.doc
        "A list of cluster security groups to be authorized on this cluster. This change is \
         asynchronously applied as soon as possible.\n\n\
        \ Security groups currently associated with the cluster, and not in the list of groups to \
         apply, will be revoked from the cluster.\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be 1 to 255 alphanumeric characters or hyphens\n\
        \             \n\
        \              }\n\
        \         {-  First character must be a letter\n\
        \             \n\
        \              }\n\
        \         {-  Cannot end with a hyphen or contain two consecutive hyphens\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "A list of virtual private cloud (VPC) security groups to be associated with the cluster. \
         This change is asynchronously applied as soon as possible.\n"]
  master_user_password : sensitive_string option;
      [@ocaml.doc
        "The new password for the cluster admin user. This change is asynchronously applied as \
         soon as possible. Between the time of the request and the completion of the request, the \
         [MasterUserPassword] element exists in the [PendingModifiedValues] element of the \
         operation response. \n\n\
        \ You can't use [MasterUserPassword] if [ManageMasterPassword] is [true].\n\
        \ \n\
        \   Operations never return the password, so this operation provides a way to regain \
         access to the admin user account for a cluster if the password is lost.\n\
        \   \n\
        \     Default: Uses existing setting.\n\
        \     \n\
        \      Constraints:\n\
        \      \n\
        \       {ul\n\
        \             {-  Must be between 8 and 64 characters in length.\n\
        \                 \n\
        \                  }\n\
        \             {-  Must contain at least one uppercase letter.\n\
        \                 \n\
        \                  }\n\
        \             {-  Must contain at least one lowercase letter.\n\
        \                 \n\
        \                  }\n\
        \             {-  Must contain one number.\n\
        \                 \n\
        \                  }\n\
        \             {-  Can be any printable ASCII character (ASCII code 33-126) except ['] \
         (single quote), [\"] (double quote), [\\], [/], or [@].\n\
        \                 \n\
        \                  }\n\
        \             }\n\
        \  "]
  cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the cluster parameter group to apply to this cluster. This change is applied \
         only after the cluster is rebooted. To reboot a cluster use [RebootCluster]. \n\n\
        \ Default: Uses existing setting.\n\
        \ \n\
        \  Constraints: The cluster parameter group must be in the same parameter group family \
         that matches the cluster version.\n\
        \  "]
  automated_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that automated snapshots are retained. If the value is 0, automated \
         snapshots are disabled. Even if automated snapshots are disabled, you can still create \
         manual snapshots when you want with [CreateClusterSnapshot]. \n\n\
        \ If you decrease the automated snapshot retention period from its current value, existing \
         automated snapshots that fall outside of the new retention period will be immediately \
         deleted.\n\
        \ \n\
        \  You can't disable automated snapshots for RG or RA3 node types. Set the automated \
         retention period from 1-35 days.\n\
        \  \n\
        \   Default: Uses existing setting.\n\
        \   \n\
        \    Constraints: Must be a value from 0 to 35.\n\
        \    "]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The default for number of days that a newly created manual snapshot is retained. If the \
         value is -1, the manual snapshot is retained indefinitely. This value doesn't \
         retroactively change the retention periods of existing manual snapshots.\n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ \n\
        \  The default value is -1.\n\
        \  "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range (in UTC) during which system maintenance can occur, if necessary. \
         If system maintenance is necessary during the window, it may result in an outage.\n\n\
        \ This maintenance window change is made immediately. If the new maintenance window \
         indicates the current time, there must be at least 120 minutes between the current time \
         and end of the window in order to ensure that pending changes are applied.\n\
        \ \n\
        \  Default: Uses existing setting.\n\
        \  \n\
        \   Format: ddd:hh24:mi-ddd:hh24:mi, for example [wed:07:30-wed:08:00].\n\
        \   \n\
        \    Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun\n\
        \    \n\
        \     Constraints: Must be at least 30 minutes.\n\
        \     "]
  cluster_version : string_ option;
      [@ocaml.doc
        "The new version number of the Amazon Redshift engine to upgrade to.\n\n\
        \ For major version upgrades, if a non-default cluster parameter group is currently in \
         use, a new cluster parameter group in the cluster parameter group family for the new \
         version must be specified. The new cluster parameter group can be the default for that \
         cluster parameter group family. For more information about parameters and parameter \
         groups, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Amazon \
         Redshift Parameter Groups} in the {i Amazon Redshift Cluster Management Guide}.\n\
        \ \n\
        \  Example: [1.0] \n\
        \  "]
  allow_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "If [true], major version upgrades will be applied automatically to the cluster during the \
         maintenance window. \n\n\
        \ Default: [false] \n\
        \ "]
  hsm_client_certificate_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to \
         retrieve the data encryption keys stored in an HSM.\n"]
  hsm_configuration_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM configuration that contains the information the Amazon \
         Redshift cluster can use to retrieve and store keys in an HSM.\n"]
  new_cluster_identifier : string_ option;
      [@ocaml.doc
        "The new identifier for the cluster.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Alphabetic characters must be lowercase.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique for all clusters within an Amazon Web Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Example: [examplecluster] \n\
        \   "]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "If [true], the cluster can be accessed from a public network. Only clusters in VPCs can \
         be set to be publicly available.\n\n\
        \ Default: false\n\
        \ "]
  elastic_ip : string_ option;
      [@ocaml.doc
        "The Elastic IP (EIP) address for the cluster.\n\n\
        \ Constraints: The cluster must be provisioned in EC2-VPC and publicly-accessible through \
         an Internet gateway. For more information about provisioning clusters in EC2-VPC, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#cluster-platforms}Supported \
         Platforms to Launch Your Cluster} in the Amazon Redshift Cluster Management Guide.\n\
        \ "]
  enhanced_vpc_routing : boolean_optional option;
      [@ocaml.doc
        "An option that specifies whether to create the cluster with enhanced VPC routing enabled. \
         To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For \
         more information, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html}Enhanced \
         VPC Routing} in the Amazon Redshift Cluster Management Guide.\n\n\
        \ If this option is [true], enhanced VPC routing is enabled. \n\
        \ \n\
        \  Default: false\n\
        \  "]
  maintenance_track_name : string_ option;
      [@ocaml.doc
        "The name for the maintenance track that you want to assign for the cluster. This name \
         change is asynchronous. The new track name stays in the [PendingModifiedValues] for the \
         cluster until the next maintenance window. When the maintenance track changes, the \
         cluster is switched to the latest cluster release available for the maintenance track. At \
         this point, the maintenance track name is applied.\n"]
  encrypted : boolean_optional option;
      [@ocaml.doc
        "Indicates whether the cluster is encrypted. If the value is encrypted (true) and you \
         provide a value for the [KmsKeyId] parameter, we encrypt the cluster with the provided \
         [KmsKeyId]. If you don't provide a [KmsKeyId], we encrypt with the default key. \n\n\
        \ If the value is not encrypted (false), then the cluster is decrypted. \n\
        \ "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Key Management Service (KMS) key ID of the encryption key that you want to use to \
         encrypt data in the cluster.\n"]
  availability_zone_relocation : boolean_optional option;
      [@ocaml.doc
        "The option to enable relocation for an Amazon Redshift cluster between Availability Zones \
         after the cluster modification is complete.\n"]
  availability_zone : string_ option;
      [@ocaml.doc
        "The option to initiate relocation for an Amazon Redshift cluster to the target \
         Availability Zone.\n"]
  port : integer_optional option;
      [@ocaml.doc
        "The option to change the port of an Amazon Redshift cluster.\n\n\
        \ Valid Values: \n\
        \ \n\
        \  {ul\n\
        \        {-  For clusters with RG or RA3 nodes - Select a port within the ranges \
         [5431-5455] or [8191-8215]. (If you have an existing cluster with RG or RA3 nodes, it \
         isn't required that you change the port to these ranges.)\n\
        \            \n\
        \             }\n\
        \        {-  For clusters with dc2 nodes - Select a port within the range [1150-65535].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  manage_master_password : boolean_optional option;
      [@ocaml.doc
        "If [true], Amazon Redshift uses Secrets Manager to manage this cluster's admin \
         credentials. You can't use [MasterUserPassword] if [ManageMasterPassword] is true. If \
         [ManageMasterPassword] is false or not set, Amazon Redshift uses [MasterUserPassword] for \
         the admin user account's password. \n"]
  master_password_secret_kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's \
         admin credentials secret. You can only use this parameter if [ManageMasterPassword] is \
         true.\n"]
  ip_address_type : string_ option;
      [@ocaml.doc
        "The IP address types that the cluster supports. Possible values are [ipv4] and [dualstack].\n"]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        "If true and the cluster is currently only deployed in a single Availability Zone, the \
         cluster will be modified to be deployed in two Availability Zones.\n"]
  extra_compute_for_automatic_optimization : boolean_optional option;
      [@ocaml.doc
        "If [true], allocates additional compute resources for running automatic optimization \
         operations.\n\n\
        \ Default: false\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec modify_cluster_db_revision_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec modify_cluster_db_revision_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of a cluster whose database revision you want to modify. \n\n\
        \ Example: [examplecluster] \n\
        \ "]
  revision_target : string_;
      [@ocaml.doc
        "The identifier of the database revision. You can retrieve this value from the response to \
         the [DescribeClusterDbRevisions] request.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_cluster_iam_roles_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec modify_cluster_iam_roles_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the cluster for which you want to associate or disassociate IAM \
         roles.\n"]
  add_iam_roles : iam_role_arn_list option;
      [@ocaml.doc
        "Zero or more IAM roles to associate with the cluster. The roles must be in their Amazon \
         Resource Name (ARN) format. \n"]
  remove_iam_roles : iam_role_arn_list option;
      [@ocaml.doc "Zero or more IAM roles in ARN format to disassociate from the cluster. \n"]
  default_iam_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster \
         when the cluster was last modified.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_cluster_maintenance_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec modify_cluster_maintenance_message = {
  cluster_identifier : string_; [@ocaml.doc "A unique identifier for the cluster.\n"]
  defer_maintenance : boolean_optional option;
      [@ocaml.doc "A boolean indicating whether to enable the deferred maintenance window. \n"]
  defer_maintenance_identifier : string_ option;
      [@ocaml.doc "A unique identifier for the deferred maintenance window.\n"]
  defer_maintenance_start_time : t_stamp option;
      [@ocaml.doc "A timestamp indicating the start time for the deferred maintenance window.\n"]
  defer_maintenance_end_time : t_stamp option;
      [@ocaml.doc
        "A timestamp indicating end time for the deferred maintenance window. If you specify an \
         end time, you can't specify a duration.\n"]
  defer_maintenance_duration : integer_optional option;
      [@ocaml.doc
        "An integer indicating the duration of the maintenance window in days. If you specify a \
         duration, you can't specify an end time. The duration must be 60 days or less.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_cluster_parameter_group_message = {
  parameter_group_name : string_; [@ocaml.doc "The name of the parameter group to be modified.\n"]
  parameters : parameters_list;
      [@ocaml.doc
        "An array of parameters to be modified. A maximum of 20 parameters can be modified in a \
         single request.\n\n\
        \ For each parameter to be modified, you must supply at least the parameter name and \
         parameter value; other name-value pairs of the parameter are optional.\n\
        \ \n\
        \  For the workload management (WLM) configuration, you must supply all the name-value \
         pairs in the wlm_json_configuration parameter.\n\
        \  "]
}
[@@ocaml.doc "Describes a modify cluster parameter group operation. \n"]

type nonrec modify_cluster_snapshot_result = { snapshot : snapshot option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec modify_cluster_snapshot_message = {
  snapshot_identifier : string_;
      [@ocaml.doc "The identifier of the snapshot whose setting you want to modify.\n"]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that a manual snapshot is retained. If the value is -1, the manual \
         snapshot is retained indefinitely.\n\n\
        \ If the manual snapshot falls outside of the new retention period, you can specify the \
         force option to immediately delete the snapshot.\n\
        \ \n\
        \  The value must be either -1 or an integer between 1 and 3,653.\n\
        \  "]
  force : boolean_ option;
      [@ocaml.doc
        "A Boolean option to override an exception if the retention period has already passed.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_cluster_snapshot_schedule_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "A unique identifier for the cluster whose snapshot schedule you want to modify. \n"]
  schedule_identifier : string_ option;
      [@ocaml.doc
        "A unique alphanumeric identifier for the schedule that you want to associate with the \
         cluster.\n"]
  disassociate_schedule : boolean_optional option;
      [@ocaml.doc
        "A boolean to indicate whether to remove the assoiciation between the cluster and the \
         schedule.\n"]
}
[@@ocaml.doc ""]

type nonrec subnet_already_in_use = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A specified subnet is already in use by another cluster.\n"]

type nonrec modify_cluster_subnet_group_result = {
  cluster_subnet_group : cluster_subnet_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_cluster_subnet_group_message = {
  cluster_subnet_group_name : string_; [@ocaml.doc "The name of the subnet group to be modified.\n"]
  description : string_ option;
      [@ocaml.doc "A text description of the subnet group to be modified.\n"]
  subnet_ids : subnet_identifier_list;
      [@ocaml.doc
        "An array of VPC subnet IDs. A maximum of 20 subnets can be modified in a single request.\n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_custom_domain_association_result = {
  custom_domain_name : custom_domain_name_string option;
      [@ocaml.doc
        "The custom domain name associated with the result for the changed custom domain \
         association.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string option;
      [@ocaml.doc
        "The certificate Amazon Resource Name (ARN) associated with the result for the changed \
         custom domain association.\n"]
  cluster_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the cluster associated with the result for the changed custom domain \
         association.\n"]
  custom_domain_cert_expiry_time : string_ option;
      [@ocaml.doc
        "The certificate expiration time associated with the result for the changed custom domain \
         association.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_custom_domain_association_message = {
  custom_domain_name : custom_domain_name_string;
      [@ocaml.doc "The custom domain name for a changed custom domain association.\n"]
  custom_domain_certificate_arn : custom_domain_certificate_arn_string;
      [@ocaml.doc
        "The certificate Amazon Resource Name (ARN) for the changed custom domain association.\n"]
  cluster_identifier : string_;
      [@ocaml.doc "The identifier of the cluster to change a custom domain association for.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_endpoint_access_message = {
  endpoint_name : string_; [@ocaml.doc "The endpoint to be modified.\n"]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "The complete list of VPC security groups associated with the endpoint after the endpoint \
         is modified.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_event_subscription_result = {
  event_subscription : event_subscription option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_event_subscription_message = {
  subscription_name : string_;
      [@ocaml.doc "The name of the modified Amazon Redshift event notification subscription.\n"]
  sns_topic_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the SNS topic to be used by the event notification \
         subscription.\n"]
  source_type : string_ option;
      [@ocaml.doc
        "The type of source that will be generating the events. For example, if you want to be \
         notified of events generated by a cluster, you would set this parameter to cluster. If \
         this value is not specified, events are returned for all Amazon Redshift objects in your \
         Amazon Web Services account. You must specify a source type in order to specify source \
         IDs.\n\n\
        \ Valid values: cluster, cluster-parameter-group, cluster-security-group, \
         cluster-snapshot, and scheduled-action.\n\
        \ "]
  source_ids : source_ids_list option;
      [@ocaml.doc
        "A list of one or more identifiers of Amazon Redshift source objects. All of the objects \
         must be of the same type as was specified in the source type parameter. The event \
         subscription will return only events generated by the specified objects. If not \
         specified, then events are returned for all objects within the source type specified.\n\n\
        \ Example: my-cluster-1, my-cluster-2\n\
        \ \n\
        \  Example: my-snapshot-20131010\n\
        \  "]
  event_categories : event_categories_list option;
      [@ocaml.doc
        "Specifies the Amazon Redshift event categories to be published by the event notification \
         subscription.\n\n\
        \ Values: configuration, management, monitoring, security, pending\n\
        \ "]
  severity : string_ option;
      [@ocaml.doc
        "Specifies the Amazon Redshift event severity to be published by the event notification \
         subscription.\n\n\
        \ Values: ERROR, INFO\n\
        \ "]
  enabled : boolean_optional option;
      [@ocaml.doc
        "A Boolean value indicating if the subscription is enabled. [true] indicates the \
         subscription is enabled \n"]
}
[@@ocaml.doc "\n"]

type nonrec modify_integration_message = {
  integration_arn : integration_arn;
      [@ocaml.doc "The unique identifier of the integration to modify.\n"]
  description : integration_description option;
      [@ocaml.doc "A new description for the integration.\n"]
  integration_name : integration_name option; [@ocaml.doc "A new name for the integration.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_lakehouse_configuration_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the cluster whose lakehouse configuration you want to modify.\n"]
  lakehouse_registration : lakehouse_registration option;
      [@ocaml.doc
        "Specifies whether to register or deregister the cluster with Amazon Redshift federated \
         permissions. Valid values are [Register] or [Deregister].\n"]
  catalog_name : catalog_name_string option;
      [@ocaml.doc
        "The name of the Glue data catalog that will be associated with the cluster enabled with \
         Amazon Redshift federated permissions.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain at least one lowercase letter.\n\
        \            \n\
        \             }\n\
        \        {-  Can only contain lowercase letters (a-z), numbers (0-9), underscores (_), and \
         hyphens (-).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Pattern: [^\\[a-z0-9_-\\]*\\[a-z\\]+\\[a-z0-9_-\\]*$] \n\
        \   \n\
        \    Example: [my-catalog_01] \n\
        \    "]
  lakehouse_idc_registration : lakehouse_idc_registration option;
      [@ocaml.doc
        "Modifies the Amazon Web Services IAM Identity Center trusted identity propagation on a \
         cluster enabled with Amazon Redshift federated permissions. Valid values are [Associate] \
         or [Disassociate].\n"]
  lakehouse_idc_application_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling \
         Amazon Web Services IAM Identity Center trusted identity propagation on a cluster enabled \
         with Amazon Redshift federated permissions.\n"]
  dry_run : boolean_optional option;
      [@ocaml.doc
        "A boolean value that, if [true], validates the request without actually modifying the \
         lakehouse configuration. Use this to check for errors before making changes.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_redshift_idc_application_result = {
  redshift_idc_application : redshift_idc_application option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_redshift_idc_application_message = {
  redshift_idc_application_arn : string_;
      [@ocaml.doc
        "The ARN for the Redshift application that integrates with IAM Identity Center.\n"]
  identity_namespace : identity_namespace_string option;
      [@ocaml.doc
        "The namespace for the Amazon Redshift IAM Identity Center application to change. It \
         determines which managed application verifies the connection token.\n"]
  iam_role_arn : string_ option;
      [@ocaml.doc
        "The IAM role ARN associated with the Amazon Redshift IAM Identity Center application to \
         change. It has the required permissions to be assumed and invoke the IDC Identity Center \
         API.\n"]
  idc_display_name : idc_display_name_string option;
      [@ocaml.doc
        "The display name for the Amazon Redshift IAM Identity Center application to change. It \
         appears on the console.\n"]
  authorized_token_issuer_list : authorized_token_issuer_list option;
      [@ocaml.doc
        "The authorized token issuer list for the Amazon Redshift IAM Identity Center application \
         to change.\n"]
  service_integrations : service_integration_list option;
      [@ocaml.doc "A collection of service integrations associated with the application.\n"]
}
[@@ocaml.doc ""]

type nonrec modify_scheduled_action_message = {
  scheduled_action_name : string_; [@ocaml.doc "The name of the scheduled action to modify. \n"]
  target_action : scheduled_action_type option;
      [@ocaml.doc
        "A modified JSON format of the scheduled action. For more information about this \
         parameter, see [ScheduledAction]. \n"]
  schedule : string_ option;
      [@ocaml.doc
        "A modified schedule in either [at( )] or [cron( )] format. For more information about \
         this parameter, see [ScheduledAction].\n"]
  iam_role : string_ option;
      [@ocaml.doc
        "A different IAM role to assume to run the target action. For more information about this \
         parameter, see [ScheduledAction].\n"]
  scheduled_action_description : string_ option;
      [@ocaml.doc "A modified description of the scheduled action. \n"]
  start_time : t_stamp option;
      [@ocaml.doc
        "A modified start time of the scheduled action. For more information about this parameter, \
         see [ScheduledAction]. \n"]
  end_time : t_stamp option;
      [@ocaml.doc
        "A modified end time of the scheduled action. For more information about this parameter, \
         see [ScheduledAction]. \n"]
  enable : boolean_optional option;
      [@ocaml.doc
        "A modified enable flag of the scheduled action. If true, the scheduled action is active. \
         If false, the scheduled action is disabled. \n"]
}
[@@ocaml.doc ""]

type nonrec snapshot_copy_disabled_fault = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Cross-region snapshot copy was temporarily disabled. Try your request again.\n"]

type nonrec modify_snapshot_copy_retention_period_result = {
  cluster : cluster option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec modify_snapshot_copy_retention_period_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the cluster for which you want to change the retention period \
         for either automated or manual snapshots that are copied to a destination Amazon Web \
         Services Region.\n\n\
        \ Constraints: Must be the valid name of an existing cluster that has cross-region \
         snapshot copy enabled.\n\
        \ "]
  retention_period : integer;
      [@ocaml.doc
        "The number of days to retain automated snapshots in the destination Amazon Web Services \
         Region after they are copied from the source Amazon Web Services Region.\n\n\
        \ By default, this only changes the retention period of copied automated snapshots. \n\
        \ \n\
        \  If you decrease the retention period for automated snapshots that are copied to a \
         destination Amazon Web Services Region, Amazon Redshift deletes any existing automated \
         snapshots that were copied to the destination Amazon Web Services Region and that fall \
         outside of the new retention period.\n\
        \  \n\
        \   Constraints: Must be at least 1 and no more than 35 for automated snapshots. \n\
        \   \n\
        \    If you specify the [manual] option, only newly copied manual snapshots will have the \
         new retention period. \n\
        \    \n\
        \     If you specify the value of -1 newly copied manual snapshots are retained \
         indefinitely.\n\
        \     \n\
        \      Constraints: The number of days must be either -1 or an integer between 1 and 3,653 \
         for manual snapshots.\n\
        \      "]
  manual : boolean_ option;
      [@ocaml.doc
        "Indicates whether to apply the snapshot retention period to newly copied manual snapshots \
         instead of automated snapshots.\n"]
}
[@@ocaml.doc "\n"]

type nonrec snapshot_schedule_update_in_progress_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified snapshot schedule is already being updated.\n"]

type nonrec modify_snapshot_schedule_message = {
  schedule_identifier : string_;
      [@ocaml.doc "A unique alphanumeric identifier of the schedule to modify.\n"]
  schedule_definitions : schedule_definition_list;
      [@ocaml.doc
        "An updated list of schedule definitions. A schedule definition is made up of schedule \
         expressions, for example, \"cron(30 12 *)\" or \"rate(12 hours)\".\n"]
}
[@@ocaml.doc ""]

type nonrec modify_usage_limit_message = {
  usage_limit_id : string_; [@ocaml.doc "The identifier of the usage limit to modify.\n"]
  amount : long_optional option;
      [@ocaml.doc
        "The new limit amount. For more information about this parameter, see [UsageLimit]. \n"]
  breach_action : usage_limit_breach_action option;
      [@ocaml.doc
        "The new action that Amazon Redshift takes when the limit is reached. For more information \
         about this parameter, see [UsageLimit]. \n"]
}
[@@ocaml.doc ""]

type nonrec pause_cluster_result = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec reserved_node_quota_exceeded_fault = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Request would exceed the user's compute node quota. For information about increasing your \
   quota, go to \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Limits in \
   Amazon Redshift} in the {i Amazon Redshift Cluster Management Guide}. \n"]

type nonrec purchase_reserved_node_offering_result = {
  reserved_node : reserved_node option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec purchase_reserved_node_offering_message = {
  reserved_node_offering_id : string_;
      [@ocaml.doc "The unique identifier of the reserved node offering you want to purchase.\n"]
  node_count : integer_optional option;
      [@ocaml.doc "The number of reserved nodes that you want to purchase.\n\n Default: [1] \n "]
}
[@@ocaml.doc "\n"]

type nonrec put_resource_policy_result = {
  resource_policy : resource_policy option;
      [@ocaml.doc "The content of the updated resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_message = {
  resource_arn : string_;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource of which its resource policy is updated.\n"]
  policy : string_; [@ocaml.doc "The content of the resource policy being updated.\n"]
}
[@@ocaml.doc ""]

type nonrec reboot_cluster_result = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec reboot_cluster_message = {
  cluster_identifier : string_; [@ocaml.doc "The cluster identifier.\n"]
}
[@@ocaml.doc "\n"]

type nonrec update_partner_status_input_message = {
  account_id : partner_integration_account_id;
      [@ocaml.doc "The Amazon Web Services account ID that owns the cluster.\n"]
  cluster_identifier : partner_integration_cluster_identifier;
      [@ocaml.doc
        "The cluster identifier of the cluster whose partner integration status is being updated.\n"]
  database_name : partner_integration_database_name;
      [@ocaml.doc "The name of the database whose partner integration status is being updated.\n"]
  partner_name : partner_integration_partner_name;
      [@ocaml.doc "The name of the partner whose integration status is being updated.\n"]
  status : partner_integration_status; [@ocaml.doc "The value of the updated status.\n"]
  status_message : partner_integration_status_message option;
      [@ocaml.doc "The status message provided by the partner.\n"]
}
[@@ocaml.doc ""]

type nonrec rotate_encryption_key_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec rotate_encryption_key_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The unique identifier of the cluster that you want to rotate the encryption keys for.\n\n\
        \ Constraints: Must be the name of valid cluster that has encryption enabled.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec revoke_snapshot_access_result = { snapshot : snapshot option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec revoke_snapshot_access_message = {
  snapshot_identifier : string_ option;
      [@ocaml.doc "The identifier of the snapshot that the account can no longer access.\n"]
  snapshot_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the snapshot associated with the message to revoke \
         access.\n"]
  snapshot_cluster_identifier : string_ option;
      [@ocaml.doc
        "The identifier of the cluster the snapshot was created from. This parameter is required \
         if your IAM user has a policy containing a snapshot resource element that specifies \
         anything other than * for the cluster name.\n"]
  account_with_restore_access : string_;
      [@ocaml.doc
        "The identifier of the Amazon Web Services account that can no longer restore the \
         specified snapshot.\n"]
}
[@@ocaml.doc "\n"]

type nonrec revoke_endpoint_access_message = {
  cluster_identifier : string_ option; [@ocaml.doc "The cluster to revoke access from.\n"]
  account : string_ option;
      [@ocaml.doc "The Amazon Web Services account ID whose access is to be revoked.\n"]
  vpc_ids : vpc_identifier_list option;
      [@ocaml.doc
        "The virtual private cloud (VPC) identifiers for which access is to be revoked.\n"]
  force : boolean_ option;
      [@ocaml.doc
        "Indicates whether to force the revoke action. If true, the Redshift-managed VPC endpoints \
         associated with the endpoint authorization are also deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec revoke_cluster_security_group_ingress_result = {
  cluster_security_group : cluster_security_group option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec revoke_cluster_security_group_ingress_message = {
  cluster_security_group_name : string_;
      [@ocaml.doc "The name of the security Group from which to revoke the ingress rule.\n"]
  cidri_p : string_ option;
      [@ocaml.doc
        "The IP range for which to revoke access. This range must be a valid Classless \
         Inter-Domain Routing (CIDR) block of IP addresses. If [CIDRIP] is specified, \
         [EC2SecurityGroupName] and [EC2SecurityGroupOwnerId] cannot be provided. \n"]
  ec2_security_group_name : string_ option;
      [@ocaml.doc
        "The name of the EC2 Security Group whose access is to be revoked. If \
         [EC2SecurityGroupName] is specified, [EC2SecurityGroupOwnerId] must also be provided and \
         [CIDRIP] cannot be provided. \n"]
  ec2_security_group_owner_id : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account number of the owner of the security group specified in \
         the [EC2SecurityGroupName] parameter. The Amazon Web Services access key ID is not an \
         acceptable value. If [EC2SecurityGroupOwnerId] is specified, [EC2SecurityGroupName] must \
         also be provided. and [CIDRIP] cannot be provided. \n\n\
        \ Example: [111122223333] \n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec resume_cluster_result = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec restore_table_from_cluster_snapshot_result = {
  table_restore_status : table_restore_status option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec restore_table_from_cluster_snapshot_message = {
  cluster_identifier : string_;
      [@ocaml.doc "The identifier of the Amazon Redshift cluster to restore the table to.\n"]
  snapshot_identifier : string_;
      [@ocaml.doc
        "The identifier of the snapshot to restore the table from. This snapshot must have been \
         created from the Amazon Redshift cluster specified by the [ClusterIdentifier] parameter.\n"]
  source_database_name : string_;
      [@ocaml.doc "The name of the source database that contains the table to restore from.\n"]
  source_schema_name : string_ option;
      [@ocaml.doc
        "The name of the source schema that contains the table to restore from. If you do not \
         specify a [SourceSchemaName] value, the default is [public].\n"]
  source_table_name : string_; [@ocaml.doc "The name of the source table to restore from.\n"]
  target_database_name : string_ option;
      [@ocaml.doc "The name of the database to restore the table to.\n"]
  target_schema_name : string_ option;
      [@ocaml.doc "The name of the schema to restore the table to.\n"]
  new_table_name : string_;
      [@ocaml.doc "The name of the table to create as a result of the current request.\n"]
  enable_case_sensitive_identifier : boolean_optional option;
      [@ocaml.doc
        "Indicates whether name identifiers for database, schema, and table are case sensitive. If \
         [true], the names are case sensitive. If [false] (default), the names are not case \
         sensitive.\n"]
}
[@@ocaml.doc "\n"]

type nonrec restore_from_cluster_snapshot_result = { cluster : cluster option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec restore_from_cluster_snapshot_message = {
  cluster_identifier : string_;
      [@ocaml.doc
        "The identifier of the cluster that will be created from restoring the snapshot.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain from 1 to 63 alphanumeric characters or hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Alphabetic characters must be lowercase.\n\
        \            \n\
        \             }\n\
        \        {-  First character must be a letter.\n\
        \            \n\
        \             }\n\
        \        {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \            \n\
        \             }\n\
        \        {-  Must be unique for all clusters within an Amazon Web Services account.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  snapshot_identifier : string_ option;
      [@ocaml.doc
        "The name of the snapshot from which to create the new cluster. This parameter isn't case \
         sensitive. You must specify this parameter or [snapshotArn], but not both.\n\n\
        \ Example: [my-snapshot-id] \n\
        \ "]
  snapshot_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the snapshot associated with the message to restore \
         from a cluster. You must specify this parameter or [snapshotIdentifier], but not both.\n"]
  snapshot_cluster_identifier : string_ option;
      [@ocaml.doc
        "The name of the cluster the source snapshot was created from. This parameter is required \
         if your IAM user has a policy containing a snapshot resource element that specifies \
         anything other than * for the cluster name.\n"]
  port : integer_optional option;
      [@ocaml.doc
        "The port number on which the cluster accepts connections.\n\n\
        \ Default: The same port as the original cluster.\n\
        \ \n\
        \  Valid values: For clusters with DC2 nodes, must be within the range [1150]-[65535]. For \
         clusters with RG or RA3 nodes, must be within the ranges [5431]-[5455] or [8191]-[8215].\n\
        \  "]
  availability_zone : string_ option;
      [@ocaml.doc
        "The Amazon EC2 Availability Zone in which to restore the cluster.\n\n\
        \ Default: A random, system-chosen Availability Zone.\n\
        \ \n\
        \  Example: [us-east-2a] \n\
        \  "]
  allow_version_upgrade : boolean_optional option;
      [@ocaml.doc
        "If [true], major version upgrades can be applied during the maintenance window to the \
         Amazon Redshift engine that is running on the cluster. \n\n\
        \ Default: [true] \n\
        \ "]
  cluster_subnet_group_name : string_ option;
      [@ocaml.doc
        "The name of the subnet group where you want to cluster restored.\n\n\
        \ A snapshot of cluster in VPC can be restored only in VPC. Therefore, you must provide \
         subnet group name where you want the cluster restored.\n\
        \ "]
  publicly_accessible : boolean_optional option;
      [@ocaml.doc
        "If [true], the cluster can be accessed from a public network. \n\n Default: false\n "]
  owner_account : string_ option;
      [@ocaml.doc
        "The Amazon Web Services account used to create or copy the snapshot. Required if you are \
         restoring a snapshot you do not own, optional if you own the snapshot.\n"]
  hsm_client_certificate_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM client certificate the Amazon Redshift cluster uses to \
         retrieve the data encryption keys stored in an HSM.\n"]
  hsm_configuration_identifier : string_ option;
      [@ocaml.doc
        "Specifies the name of the HSM configuration that contains the information the Amazon \
         Redshift cluster can use to retrieve and store keys in an HSM.\n"]
  elastic_ip : string_ option;
      [@ocaml.doc
        "The Elastic IP (EIP) address for the cluster. Don't specify the Elastic IP address for a \
         publicly accessible cluster with availability zone relocation turned on.\n"]
  cluster_parameter_group_name : string_ option;
      [@ocaml.doc
        "The name of the parameter group to be associated with this cluster.\n\n\
        \ Default: The default Amazon Redshift cluster parameter group. For information about the \
         default parameter group, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-parameter-groups.html}Working \
         with Amazon Redshift Parameter Groups}.\n\
        \ \n\
        \  Constraints:\n\
        \  \n\
        \   {ul\n\
        \         {-  Must be 1 to 255 alphanumeric characters or hyphens.\n\
        \             \n\
        \              }\n\
        \         {-  First character must be a letter.\n\
        \             \n\
        \              }\n\
        \         {-  Cannot end with a hyphen or contain two consecutive hyphens.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  cluster_security_groups : cluster_security_group_name_list option;
      [@ocaml.doc
        "A list of security groups to be associated with this cluster.\n\n\
        \ Default: The default cluster security group for Amazon Redshift.\n\
        \ \n\
        \  Cluster security groups only apply to clusters outside of VPCs.\n\
        \  "]
  vpc_security_group_ids : vpc_security_group_id_list option;
      [@ocaml.doc
        "A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster.\n\n\
        \ Default: The default VPC security group is associated with the cluster.\n\
        \ \n\
        \  VPC security groups only apply to clusters in VPCs.\n\
        \  "]
  preferred_maintenance_window : string_ option;
      [@ocaml.doc
        "The weekly time range (in UTC) during which automated cluster maintenance can occur.\n\n\
        \  Format: [ddd:hh24:mi-ddd:hh24:mi] \n\
        \ \n\
        \   Default: The value selected for the cluster from which the snapshot was taken. For \
         more information about the time blocks for each region, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-maintenance-windows}Maintenance \
         Windows} in Amazon Redshift Cluster Management Guide. \n\
        \  \n\
        \   Valid Days: Mon | Tue | Wed | Thu | Fri | Sat | Sun\n\
        \   \n\
        \    Constraints: Minimum 30-minute window.\n\
        \    "]
  automated_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The number of days that automated snapshots are retained. If the value is 0, automated \
         snapshots are disabled. Even if automated snapshots are disabled, you can still create \
         manual snapshots when you want with [CreateClusterSnapshot]. \n\n\
        \ You can't disable automated snapshots for RG or RA3 node types. Set the automated \
         retention period from 1-35 days.\n\
        \ \n\
        \  Default: The value selected for the cluster from which the snapshot was taken.\n\
        \  \n\
        \   Constraints: Must be a value from 0 to 35.\n\
        \   "]
  manual_snapshot_retention_period : integer_optional option;
      [@ocaml.doc
        "The default number of days to retain a manual snapshot. If the value is -1, the snapshot \
         is retained indefinitely. This setting doesn't change the retention period of existing \
         snapshots.\n\n\
        \ The value must be either -1 or an integer between 1 and 3,653.\n\
        \ "]
  kms_key_id : string_ option;
      [@ocaml.doc
        "The Key Management Service (KMS) key ID of the encryption key that encrypts data in the \
         cluster restored from a shared snapshot. You can also provide the key ID when you restore \
         from an unencrypted snapshot to an encrypted cluster in the same account. Additionally, \
         you can specify a new KMS key ID when you restore from an encrypted snapshot in the same \
         account in order to change it. In that case, the restored cluster is encrypted with the \
         new KMS key ID.\n"]
  node_type : string_ option;
      [@ocaml.doc
        "The node type that the restored cluster will be provisioned with.\n\n\
        \ If you have a DC instance type, you must restore into that same instance type and size. \
         In other words, you can only restore a dc2.large node type into another dc2 type. For \
         more information about node types, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-clusters.html#rs-about-clusters-and-nodes} \
         About Clusters and Nodes} in the {i Amazon Redshift Cluster Management Guide}. \n\
        \ "]
  enhanced_vpc_routing : boolean_optional option;
      [@ocaml.doc
        "An option that specifies whether to create the cluster with enhanced VPC routing enabled. \
         To create a cluster that uses enhanced VPC routing, the cluster must be in a VPC. For \
         more information, see \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/enhanced-vpc-routing.html}Enhanced \
         VPC Routing} in the Amazon Redshift Cluster Management Guide.\n\n\
        \ If this option is [true], enhanced VPC routing is enabled. \n\
        \ \n\
        \  Default: false\n\
        \  "]
  additional_info : string_ option; [@ocaml.doc "Reserved.\n"]
  iam_roles : iam_role_arn_list option;
      [@ocaml.doc
        "A list of Identity and Access Management (IAM) roles that can be used by the cluster to \
         access other Amazon Web Services services. You must supply the IAM roles in their Amazon \
         Resource Name (ARN) format. \n\n\
        \ The maximum number of IAM roles that you can associate is subject to a quota. For more \
         information, go to \
         {{:https://docs.aws.amazon.com/redshift/latest/mgmt/amazon-redshift-limits.html}Quotas \
         and limits} in the {i Amazon Redshift Cluster Management Guide}.\n\
        \ "]
  maintenance_track_name : string_ option;
      [@ocaml.doc
        "The name of the maintenance track for the restored cluster. When you take a snapshot, the \
         snapshot inherits the [MaintenanceTrack] value from the cluster. The snapshot might be on \
         a different track than the cluster that was the source for the snapshot. For example, \
         suppose that you take a snapshot of a cluster that is on the current track and then \
         change the cluster to be on the trailing track. In this case, the snapshot and the source \
         cluster are on different tracks.\n"]
  snapshot_schedule_identifier : string_ option;
      [@ocaml.doc "A unique identifier for the snapshot schedule.\n"]
  number_of_nodes : integer_optional option;
      [@ocaml.doc "The number of nodes specified when provisioning the restored cluster.\n"]
  availability_zone_relocation : boolean_optional option;
      [@ocaml.doc
        "The option to enable relocation for an Amazon Redshift cluster between Availability Zones \
         after the cluster is restored.\n"]
  aqua_configuration_status : aqua_configuration_status option;
      [@ocaml.doc
        "This parameter is retired. It does not set the AQUA configuration status. Amazon Redshift \
         automatically determines whether to use AQUA (Advanced Query Accelerator).\n"]
  default_iam_role_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the IAM role that was set as default for the cluster \
         when the cluster was last modified while it was restored from a snapshot.\n"]
  reserved_node_id : string_ option;
      [@ocaml.doc "The identifier of the target reserved node offering.\n"]
  target_reserved_node_offering_id : string_ option;
      [@ocaml.doc "The identifier of the target reserved node offering.\n"]
  encrypted : boolean_optional option;
      [@ocaml.doc
        "Enables support for restoring an unencrypted snapshot to a cluster encrypted with Key \
         Management Service (KMS) and a customer managed key.\n"]
  manage_master_password : boolean_optional option;
      [@ocaml.doc
        "If [true], Amazon Redshift uses Secrets Manager to manage the restored cluster's admin \
         credentials. If [ManageMasterPassword] is false or not set, Amazon Redshift uses the \
         admin credentials the cluster had at the time the snapshot was taken.\n"]
  master_password_secret_kms_key_id : string_ option;
      [@ocaml.doc
        "The ID of the Key Management Service (KMS) key used to encrypt and store the cluster's \
         admin credentials secret. You can only use this parameter if [ManageMasterPassword] is \
         true.\n"]
  ip_address_type : string_ option;
      [@ocaml.doc
        "The IP address type for the cluster. Possible values are [ipv4] and [dualstack].\n"]
  multi_a_z : boolean_optional option;
      [@ocaml.doc
        "If true, the snapshot will be restored to a cluster deployed in two Availability Zones.\n"]
  catalog_name : catalog_name_string option;
      [@ocaml.doc
        "The name of the Glue Data Catalog that will be associated with the cluster enabled with \
         Amazon Redshift federated permissions.\n\n\
        \ Constraints:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must contain at least one lowercase letter.\n\
        \            \n\
        \             }\n\
        \        {-  Can only contain lowercase letters (a-z), numbers (0-9), underscores (_), and \
         hyphens (-).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   Pattern: [^\\[a-z0-9_-\\]*\\[a-z\\]+\\[a-z0-9_-\\]*$] \n\
        \   \n\
        \    Example: [my-catalog_01] \n\
        \    "]
  redshift_idc_application_arn : string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Identity Center application used for enabling \
         Amazon Web Services IAM Identity Center trusted identity propagation on a cluster enabled \
         with Amazon Redshift federated permissions.\n"]
}
[@@ocaml.doc "\n"]

type nonrec resize_cluster_result = { cluster : cluster option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec reset_cluster_parameter_group_message = {
  parameter_group_name : string_;
      [@ocaml.doc "The name of the cluster parameter group to be reset.\n"]
  reset_all_parameters : boolean_ option;
      [@ocaml.doc
        "If [true], all parameters in the specified parameter group will be reset to their default \
         values. \n\n\
        \ Default: [true] \n\
        \ "]
  parameters : parameters_list option;
      [@ocaml.doc
        "An array of names of parameters to be reset. If {i ResetAllParameters} option is not \
         used, then at least one parameter name must be supplied. \n\n\
        \ Constraints: A maximum of 20 parameters can be reset in a single request.\n\
        \ "]
}
[@@ocaml.doc "\n"]

type nonrec reject_data_share_message = {
  data_share_arn : string_;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the datashare to reject.\n"]
}
[@@ocaml.doc ""]

type nonrec register_namespace_output_message = {
  status : namespace_registration_status option;
      [@ocaml.doc "The registration status of the cluster or serverless namespace.\n"]
}
[@@ocaml.doc ""]

type nonrec register_namespace_input_message = {
  namespace_identifier : namespace_identifier_union;
      [@ocaml.doc
        "The unique identifier of the cluster or serverless namespace that you want to register. \n"]
  consumer_identifiers : consumer_identifier_list;
      [@ocaml.doc
        "An array containing the ID of the consumer account that you want to register the \
         namespace to.\n"]
}
[@@ocaml.doc ""]
