open Types

module ConvertRecoveryPointToSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    convert_recovery_point_to_snapshot_request ->
    ( convert_recovery_point_to_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    convert_recovery_point_to_snapshot_request ->
    ( convert_recovery_point_to_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Converts a recovery point to a snapshot. For more information about recovery points and \
   snapshots, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-snapshots-recovery-points.html}Working \
   with snapshots and recovery points}.\n"]

module CreateEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_access_request ->
    ( create_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_endpoint_access_request ->
    ( create_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an Amazon Redshift Serverless managed VPC endpoint.\n"]

module CreateNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_namespace_request ->
    ( create_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_namespace_request ->
    ( create_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a namespace in Amazon Redshift Serverless.\n"]

module CreateReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_reservation_request ->
    ( create_reservation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_reservation_request ->
    ( create_reservation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Redshift Serverless reservation, which gives you the option to commit to a \
   specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless \
   on-demand (OD) rates.\n"]

module CreateScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_action_request ->
    ( create_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_scheduled_action_request ->
    ( create_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a scheduled action. A scheduled action contains a schedule and an Amazon Redshift API \
   action. For example, you can create a schedule of when to run the [CreateSnapshot] API \
   operation.\n"]

module CreateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_request ->
    ( create_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot of all databases in a namespace. For more information about snapshots, see \
   {{:https://docs.aws.amazon.com/redshift/latest/mgmt/serverless-snapshots-recovery-points.html} \
   Working with snapshots and recovery points}.\n"]

module CreateSnapshotCopyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_copy_configuration_request ->
    ( create_snapshot_copy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_snapshot_copy_configuration_request ->
    ( create_snapshot_copy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a snapshot copy configuration that lets you copy snapshots to another Amazon Web \
   Services Region.\n"]

module CreateUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_usage_limit_request ->
    ( create_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_usage_limit_request ->
    ( create_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a usage limit for a specified Amazon Redshift Serverless usage type. The usage limit is \
   identified by the returned usage limit identifier. \n"]

module CreateWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerException of internal_server_exception
    | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_workgroup_request ->
    ( create_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_workgroup_request ->
    ( create_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an workgroup in Amazon Redshift Serverless.\n\n\
  \ VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own \
   in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a workgroup is in an account with VPC BPA turned on, the \
   following capabilities are blocked: \n\
  \ \n\
  \  {ul\n\
  \        {-  Creating a public access workgroup\n\
  \            \n\
  \             }\n\
  \        {-  Modifying a private workgroup to public\n\
  \            \n\
  \             }\n\
  \        {-  Adding a subnet with VPC BPA turned on to the workgroup when the workgroup is public\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   "]

module DeleteEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_access_request ->
    ( delete_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_endpoint_access_request ->
    ( delete_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon Redshift Serverless managed VPC endpoint.\n"]

module DeleteNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_namespace_request ->
    ( delete_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_namespace_request ->
    ( delete_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a namespace from Amazon Redshift Serverless. Before you delete the namespace, you can \
   create a final snapshot that has all of the data within the namespace.\n"]

module DeleteScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_request ->
    ( delete_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_scheduled_action_request ->
    ( delete_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a scheduled action.\n"]

module DeleteSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_request ->
    ( delete_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a snapshot from Amazon Redshift Serverless.\n"]

module DeleteSnapshotCopyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_copy_configuration_request ->
    ( delete_snapshot_copy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_snapshot_copy_configuration_request ->
    ( delete_snapshot_copy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a snapshot copy configuration\n"]

module DeleteUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_limit_request ->
    ( delete_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_limit_request ->
    ( delete_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a usage limit from Amazon Redshift Serverless.\n"]

module DeleteWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_workgroup_request ->
    ( delete_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_workgroup_request ->
    ( delete_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a workgroup.\n"]

module GetEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_endpoint_access_request ->
    ( get_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_endpoint_access_request ->
    ( get_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information, such as the name, about a VPC endpoint.\n"]

module GetNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_namespace_request ->
    ( get_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_namespace_request ->
    ( get_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a namespace in Amazon Redshift Serverless.\n"]

module GetRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_recovery_point_request ->
    ( get_recovery_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_recovery_point_request ->
    ( get_recovery_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a recovery point.\n"]

module GetReservation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_request ->
    ( get_reservation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_request ->
    ( get_reservation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets an Amazon Redshift Serverless reservation. A reservation gives you the option to commit to \
   a specified number of Redshift Processing Units (RPUs) for a year at a discount from Serverless \
   on-demand (OD) rates.\n"]

module GetReservationOffering : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_offering_request ->
    ( get_reservation_offering_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_reservation_offering_request ->
    ( get_reservation_offering_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the reservation offering. The offering determines the payment schedule for the \
   reservation.\n"]

module GetScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_action_request ->
    ( get_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_scheduled_action_request ->
    ( get_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a scheduled action.\n"]

module GetSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_request ->
    ( get_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_snapshot_request ->
    ( get_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a specific snapshot.\n"]

module GetTableRestoreStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_table_restore_status_request ->
    ( get_table_restore_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_table_restore_status_request ->
    ( get_table_restore_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a [TableRestoreStatus] object.\n"]

module GetUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_usage_limit_request ->
    ( get_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_usage_limit_request ->
    ( get_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a usage limit.\n"]

module GetWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_workgroup_request ->
    ( get_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_workgroup_request ->
    ( get_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a specific workgroup.\n"]

module ListEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_access_request ->
    ( list_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_endpoint_access_request ->
    ( list_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an array of [EndpointAccess] objects and relevant information.\n"]

module ListManagedWorkgroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_managed_workgroups_request ->
    ( list_managed_workgroups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_managed_workgroups_request ->
    ( list_managed_workgroups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a list of specified managed workgroups in your account.\n"]

module ListNamespaces : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_namespaces_request ->
    ( list_namespaces_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_namespaces_request ->
    ( list_namespaces_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a list of specified namespaces.\n"]

module ListRecoveryPoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recovery_points_request ->
    ( list_recovery_points_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recovery_points_request ->
    ( list_recovery_points_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an array of recovery points.\n"]

module ListReservationOfferings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_reservation_offerings_request ->
    ( list_reservation_offerings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_reservation_offerings_request ->
    ( list_reservation_offerings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the current reservation offerings in your account.\n"]

module ListReservations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_reservations_request ->
    ( list_reservations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_reservations_request ->
    ( list_reservations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of Reservation objects.\n"]

module ListScheduledActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_actions_request ->
    ( list_scheduled_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_scheduled_actions_request ->
    ( list_scheduled_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of scheduled actions. You can use the flags to filter the list of returned \
   scheduled actions.\n"]

module ListSnapshotCopyConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_snapshot_copy_configurations_request ->
    ( list_snapshot_copy_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_snapshot_copy_configurations_request ->
    ( list_snapshot_copy_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of snapshot copy configurations.\n"]

module ListSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_snapshots_request ->
    ( list_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_snapshots_request ->
    ( list_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of snapshots.\n"]

module ListTableRestoreStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_table_restore_status_request ->
    ( list_table_restore_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_table_restore_status_request ->
    ( list_table_restore_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about an array of [TableRestoreStatus] objects.\n"]

module ListUsageLimits : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_usage_limits_request ->
    ( list_usage_limits_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_usage_limits_request ->
    ( list_usage_limits_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all usage limits within Amazon Redshift Serverless.\n"]

module ListWorkgroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_workgroups_request ->
    ( list_workgroups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_workgroups_request ->
    ( list_workgroups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a list of specified workgroups.\n"]

module CreateCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_domain_association_request ->
    ( create_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_domain_association_request ->
    ( create_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a custom domain association for Amazon Redshift Serverless.\n"]

module DeleteCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_domain_association_request ->
    ( delete_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_domain_association_request ->
    ( delete_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a custom domain association for Amazon Redshift Serverless.\n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified resource policy.\n"]

module GetCredentials : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_credentials_request ->
    ( get_credentials_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_credentials_request ->
    ( get_credentials_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a database user name and temporary password with temporary authorization to log in to \
   Amazon Redshift Serverless.\n\n\
  \ By default, the temporary credentials expire in 900 seconds. You can optionally specify a \
   duration between 900 seconds (15 minutes) and 3600 seconds (60 minutes).\n\
  \ \n\
  \  The Identity and Access Management (IAM) user or role that runs GetCredentials must have an \
   IAM policy attached that allows access to all necessary actions and resources.\n\
  \  \n\
  \   If the [DbName] parameter is specified, the IAM policy must allow access to the resource \
   dbname for the specified database name.\n\
  \   "]

module GetCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_custom_domain_association_request ->
    ( get_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_custom_domain_association_request ->
    ( get_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a specific custom domain association.\n"]

module GetIdentityCenterAuthToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `DryRunException of dry_run_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_identity_center_auth_token_request ->
    ( get_identity_center_auth_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_identity_center_auth_token_request ->
    ( get_identity_center_auth_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns an Identity Center authentication token for accessing Amazon Redshift Serverless \
   workgroups.\n\n\
  \ The token provides secure access to data within the specified workgroups using Identity Center \
   identity propagation. The token expires after a specified duration and must be refreshed for \
   continued access.\n\
  \ \n\
  \  The Identity and Access Management (IAM) user or role that runs GetIdentityCenterAuthToken \
   must have appropriate permissions to access the specified workgroups and Identity Center \
   integration must be configured for the workgroups.\n\
  \  "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a resource policy.\n"]

module GetTrack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `DryRunException of dry_run_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_track_request ->
    ( get_track_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_track_request ->
    ( get_track_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get the Redshift Serverless version for a specified track.\n"]

module ListCustomDomainAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_custom_domain_associations_request ->
    ( list_custom_domain_associations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_custom_domain_associations_request ->
    ( list_custom_domain_associations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists custom domain associations for Amazon Redshift Serverless.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags assigned to a resource.\n"]

module ListTracks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidPaginationException of invalid_pagination_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tracks_request ->
    ( list_tracks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tracks_request ->
    ( list_tracks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidPaginationException of invalid_pagination_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the Amazon Redshift Serverless versions.\n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a resource policy. Currently, you can use policies to share snapshots across \
   Amazon Web Services accounts.\n"]

module RestoreFromRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_from_recovery_point_request ->
    ( restore_from_recovery_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_from_recovery_point_request ->
    ( restore_from_recovery_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Restore the data from a recovery point.\n"]

module RestoreFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_from_snapshot_request ->
    ( restore_from_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Restores a namespace from a snapshot.\n"]

module RestoreTableFromRecoveryPoint : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_recovery_point_request ->
    ( restore_table_from_recovery_point_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_recovery_point_request ->
    ( restore_table_from_recovery_point_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a table from a recovery point to your Amazon Redshift Serverless instance. You can't \
   use this operation to restore tables with interleaved sort keys.\n"]

module RestoreTableFromSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_snapshot_request ->
    ( restore_table_from_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_table_from_snapshot_request ->
    ( restore_table_from_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Restores a table from a snapshot to your Amazon Redshift Serverless instance. You can't use \
   this operation to restore tables with \
   {{:https://docs.aws.amazon.com/redshift/latest/dg/t_Sorting_data.html#t_Sorting_data-interleaved}interleaved \
   sort keys}.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Assigns one or more tags to a resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a tag or set of tags from a resource.\n"]

module UpdateCustomDomainAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_custom_domain_association_request ->
    ( update_custom_domain_association_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_custom_domain_association_request ->
    ( update_custom_domain_association_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an Amazon Redshift Serverless certificate associated with a custom domain.\n"]

module UpdateEndpointAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_access_request ->
    ( update_endpoint_access_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_endpoint_access_request ->
    ( update_endpoint_access_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an Amazon Redshift Serverless managed endpoint.\n"]

module UpdateLakehouseConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DryRunException of dry_run_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_lakehouse_configuration_request ->
    ( update_lakehouse_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_lakehouse_configuration_request ->
    ( update_lakehouse_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DryRunException of dry_run_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the lakehouse configuration for a namespace. This operation allows you to manage \
   Amazon Redshift federated permissions and Amazon Web Services IAM Identity Center trusted \
   identity propagation.\n"]

module UpdateNamespace : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_namespace_request ->
    ( update_namespace_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_namespace_request ->
    ( update_namespace_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a namespace with the specified settings. Unless required, you can't update multiple \
   parameters in one request. For example, you must specify both [adminUsername] and \
   [adminUserPassword] to update either field, but you can't update both [kmsKeyId] and \
   [logExports] in a single request.\n"]

module UpdateScheduledAction : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_action_request ->
    ( update_scheduled_action_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_scheduled_action_request ->
    ( update_scheduled_action_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a scheduled action.\n"]

module UpdateSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_request ->
    ( update_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a snapshot.\n"]

module UpdateSnapshotCopyConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_copy_configuration_request ->
    ( update_snapshot_copy_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_snapshot_copy_configuration_request ->
    ( update_snapshot_copy_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a snapshot copy configuration.\n"]

module UpdateUsageLimit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_usage_limit_request ->
    ( update_usage_limit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_usage_limit_request ->
    ( update_usage_limit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a usage limit in Amazon Redshift Serverless. You can't update the usage type or period \
   of a usage limit.\n"]

module UpdateWorkgroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `InsufficientCapacityException of insufficient_capacity_exception
    | `InternalServerException of internal_server_exception
    | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_workgroup_request ->
    ( update_workgroup_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_workgroup_request ->
    ( update_workgroup_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientCapacityException of insufficient_capacity_exception
      | `InternalServerException of internal_server_exception
      | `Ipv6CidrBlockNotFoundException of ipv6_cidr_block_not_found_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a workgroup with the specified configuration settings. You can't update multiple \
   parameters in one request. For example, you can update [baseCapacity] or [port] in a single \
   request, but you can't update both in the same request.\n\n\
  \ VPC Block Public Access (BPA) enables you to block resources in VPCs and subnets that you own \
   in a Region from reaching or being reached from the internet through internet gateways and \
   egress-only internet gateways. If a workgroup is in an account with VPC BPA turned on, the \
   following capabilities are blocked: \n\
  \ \n\
  \  {ul\n\
  \        {-  Creating a public access workgroup\n\
  \            \n\
  \             }\n\
  \        {-  Modifying a private workgroup to public\n\
  \            \n\
  \             }\n\
  \        {-  Adding a subnet with VPC BPA turned on to the workgroup when the workgroup is public\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information about VPC BPA, see \
   {{:https://docs.aws.amazon.com/vpc/latest/userguide/security-vpc-bpa.html}Block public access \
   to VPCs and subnets} in the {i Amazon VPC User Guide}.\n\
  \   "]
