(** Cloud9 client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_environment_request :
  ?managed_credentials_action:managed_credentials_action ->
  ?description:environment_description ->
  ?name:environment_name ->
  environment_id:environment_id ->
  unit ->
  update_environment_request

val make_environment_member :
  ?last_access:timestamp ->
  environment_id:environment_id ->
  user_arn:user_arn ->
  user_id:string_ ->
  permissions:permissions ->
  unit ->
  environment_member

val make_update_environment_membership_request :
  permissions:member_permissions ->
  user_arn:user_arn ->
  environment_id:environment_id ->
  unit ->
  update_environment_membership_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:environment_arn -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:environment_arn -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:environment_arn -> unit -> list_tags_for_resource_request

val make_list_environments_request :
  ?max_results:max_results -> ?next_token:string_ -> unit -> list_environments_request

val make_environment_lifecycle :
  ?failure_resource:string_ ->
  ?reason:string_ ->
  ?status:environment_lifecycle_status ->
  unit ->
  environment_lifecycle

val make_environment :
  ?managed_credentials_status:managed_credentials_status ->
  ?lifecycle:environment_lifecycle ->
  ?connection_type:connection_type ->
  ?description:environment_description ->
  ?name:environment_name ->
  ?id:environment_id ->
  owner_arn:string_ ->
  arn:string_ ->
  type_:environment_type ->
  unit ->
  environment

val make_describe_environments_request :
  environment_ids:bounded_environment_id_list -> unit -> describe_environments_request

val make_describe_environment_status_request :
  environment_id:environment_id -> unit -> describe_environment_status_request

val make_describe_environment_memberships_request :
  ?max_results:max_results ->
  ?next_token:string_ ->
  ?permissions:permissions_list ->
  ?environment_id:environment_id ->
  ?user_arn:user_arn ->
  unit ->
  describe_environment_memberships_request

val make_delete_environment_request :
  environment_id:environment_id -> unit -> delete_environment_request

val make_delete_environment_membership_request :
  user_arn:user_arn ->
  environment_id:environment_id ->
  unit ->
  delete_environment_membership_request

val make_create_environment_membership_request :
  permissions:member_permissions ->
  user_arn:user_arn ->
  environment_id:environment_id ->
  unit ->
  create_environment_membership_request

val make_create_environment_ec2_request :
  ?dry_run:nullable_boolean ->
  ?connection_type:connection_type ->
  ?tags:tag_list ->
  ?owner_arn:user_arn ->
  ?automatic_stop_time_minutes:automatic_stop_time_minutes ->
  ?subnet_id:subnet_id ->
  ?client_request_token:client_request_token ->
  ?description:environment_description ->
  image_id:image_id ->
  instance_type:instance_type ->
  name:environment_name ->
  unit ->
  create_environment_ec2_request
(** {1:operations Operations} *)

module CreateEnvironmentEC2 : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_ec2_request ->
    ( create_environment_ec2_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_environment_ec2_request ->
    ( create_environment_ec2_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Cloud9 development environment, launches an Amazon Elastic Compute Cloud (Amazon \
   EC2) instance, and then connects from the instance to the environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module CreateEnvironmentMembership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_environment_membership_request ->
    ( create_environment_membership_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_environment_membership_request ->
    ( create_environment_membership_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an environment member to an Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module DeleteEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_request ->
    ( delete_environment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_request ->
    ( delete_environment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Cloud9 development environment. If an Amazon EC2 instance is connected to the \
   environment, also terminates the instance.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module DeleteEnvironmentMembership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_membership_request ->
    ( delete_environment_membership_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_environment_membership_request ->
    ( delete_environment_membership_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an environment member from a development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module DescribeEnvironmentMemberships : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_memberships_request ->
    ( describe_environment_memberships_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_memberships_request ->
    ( describe_environment_memberships_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about environment members for an Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module DescribeEnvironmentStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_status_request ->
    ( describe_environment_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environment_status_request ->
    ( describe_environment_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets status information for an Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module DescribeEnvironments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_environments_request ->
    ( describe_environments_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_environments_request ->
    ( describe_environments_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about Cloud9 development environments.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module ListEnvironments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_environments_request ->
    ( list_environments_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_environments_request ->
    ( list_environments_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of Cloud9 development environment identifiers.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \     Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue \
   to use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \     \n\
  \      "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the tags associated with an Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConcurrentAccessException of concurrent_access_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to an Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \     Tags that you add to an Cloud9 environment by using this method will NOT be automatically \
   propagated to underlying resources.\n\
  \     \n\
  \      "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConcurrentAccessException of concurrent_access_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `NotFoundException of not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `NotFoundException of not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConcurrentAccessException of concurrent_access_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `NotFoundException of not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags from an Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module UpdateEnvironment : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_request ->
    ( update_environment_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_environment_request ->
    ( update_environment_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the settings of an existing Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

(** {1:Serialization and Deserialization} *)
module UpdateEnvironmentMembership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `BadRequestException of bad_request_exception
    | `ConflictException of conflict_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerErrorException of internal_server_error_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NotFoundException of not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_environment_membership_request ->
    ( update_environment_membership_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_environment_membership_request ->
    ( update_environment_membership_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `BadRequestException of bad_request_exception
      | `ConflictException of conflict_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerErrorException of internal_server_error_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NotFoundException of not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the settings of an existing environment member for an Cloud9 development environment.\n\n\
  \  Cloud9 is no longer available to new customers. Existing customers of Cloud9 can continue to \
   use the service as normal. \
   {{:http://aws.amazon.com/blogs/devops/how-to-migrate-from-aws-cloud9-to-aws-ide-toolkits-or-aws-cloudshell/}Learn \
   more\"} \n\
  \  \n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
