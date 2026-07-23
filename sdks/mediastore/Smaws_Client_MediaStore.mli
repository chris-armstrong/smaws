(** MediaStore client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_container :
  ?endpoint:endpoint ->
  ?creation_time:time_stamp ->
  ?ar_n:container_ar_n ->
  ?name:container_name ->
  ?status:container_status ->
  ?access_logging_enabled:container_access_logging_enabled ->
  unit ->
  container

val make_cors_rule :
  ?allowed_methods:allowed_methods ->
  ?max_age_seconds:max_age_seconds ->
  ?expose_headers:expose_headers ->
  allowed_origins:allowed_origins ->
  allowed_headers:allowed_headers ->
  unit ->
  cors_rule

val make_create_container_output : container:container -> unit -> create_container_output
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_create_container_input :
  ?tags:tag_list -> container_name:container_name -> unit -> create_container_input

val make_delete_container_output : unit -> unit
val make_delete_container_input : container_name:container_name -> unit -> delete_container_input
val make_delete_container_policy_output : unit -> unit

val make_delete_container_policy_input :
  container_name:container_name -> unit -> delete_container_policy_input

val make_delete_cors_policy_output : unit -> unit

val make_delete_cors_policy_input :
  container_name:container_name -> unit -> delete_cors_policy_input

val make_delete_lifecycle_policy_output : unit -> unit

val make_delete_lifecycle_policy_input :
  container_name:container_name -> unit -> delete_lifecycle_policy_input

val make_delete_metric_policy_output : unit -> unit

val make_delete_metric_policy_input :
  container_name:container_name -> unit -> delete_metric_policy_input

val make_describe_container_output : ?container:container -> unit -> describe_container_output

val make_describe_container_input :
  ?container_name:container_name -> unit -> describe_container_input

val make_get_container_policy_output :
  policy:container_policy -> unit -> get_container_policy_output

val make_get_container_policy_input :
  container_name:container_name -> unit -> get_container_policy_input

val make_get_cors_policy_output : cors_policy:cors_policy -> unit -> get_cors_policy_output
val make_get_cors_policy_input : container_name:container_name -> unit -> get_cors_policy_input

val make_get_lifecycle_policy_output :
  lifecycle_policy:lifecycle_policy -> unit -> get_lifecycle_policy_output

val make_get_lifecycle_policy_input :
  container_name:container_name -> unit -> get_lifecycle_policy_input

val make_metric_policy_rule :
  object_group:object_group -> object_group_name:object_group_name -> unit -> metric_policy_rule

val make_metric_policy :
  ?metric_policy_rules:metric_policy_rules ->
  container_level_metrics:container_level_metrics ->
  unit ->
  metric_policy

val make_get_metric_policy_output : metric_policy:metric_policy -> unit -> get_metric_policy_output
val make_get_metric_policy_input : container_name:container_name -> unit -> get_metric_policy_input

val make_list_containers_output :
  ?next_token:pagination_token -> containers:container_list -> unit -> list_containers_output

val make_list_containers_input :
  ?next_token:pagination_token -> ?max_results:container_list_limit -> unit -> list_containers_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource:container_ar_n -> unit -> list_tags_for_resource_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource:container_ar_n -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag_resource_input : resource:container_ar_n -> tags:tag_list -> unit -> tag_resource_input
val make_stop_access_logging_output : unit -> unit

val make_stop_access_logging_input :
  container_name:container_name -> unit -> stop_access_logging_input

val make_start_access_logging_output : unit -> unit

val make_start_access_logging_input :
  container_name:container_name -> unit -> start_access_logging_input

val make_put_metric_policy_output : unit -> unit

val make_put_metric_policy_input :
  container_name:container_name -> metric_policy:metric_policy -> unit -> put_metric_policy_input

val make_put_lifecycle_policy_output : unit -> unit

val make_put_lifecycle_policy_input :
  container_name:container_name ->
  lifecycle_policy:lifecycle_policy ->
  unit ->
  put_lifecycle_policy_input

val make_put_cors_policy_output : unit -> unit

val make_put_cors_policy_input :
  container_name:container_name -> cors_policy:cors_policy -> unit -> put_cors_policy_input

val make_put_container_policy_output : unit -> unit

val make_put_container_policy_input :
  container_name:container_name -> policy:container_policy -> unit -> put_container_policy_input
(** {1:operations Operations} *)

module PutContainerPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_container_policy_input ->
    ( put_container_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_container_policy_input ->
    ( put_container_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an access policy for the specified container to restrict the users and clients that can \
   access it. For information about the data that is included in an access policy, see the \
   {{:https://aws.amazon.com/documentation/iam/}AWS Identity and Access Management User Guide}.\n\n\
  \ For this release of the REST API, you can create only one policy for a container. If you enter \
   [PutContainerPolicy] twice, the second command modifies the existing policy. \n\
  \ "]

module PutCorsPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_cors_policy_input ->
    ( put_cors_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_cors_policy_input ->
    ( put_cors_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the cross-origin resource sharing (CORS) configuration on a container so that the \
   container can service cross-origin requests. For example, you might want to enable a request \
   whose origin is http://www.example.com to access your AWS Elemental MediaStore container at \
   my.example.container.com by using the browser's XMLHttpRequest capability.\n\n\
  \ To enable CORS on a container, you attach a CORS policy to the container. In the CORS policy, \
   you configure rules that identify origins and the HTTP methods that can be executed on your \
   container. The policy can contain up to 398,000 characters. You can add up to 100 rules to a \
   CORS policy. If more than one rule applies, the service uses the first applicable rule listed.\n\
  \ \n\
  \  To learn more about CORS, see \
   {{:https://docs.aws.amazon.com/mediastore/latest/ug/cors-policy.html}Cross-Origin Resource \
   Sharing (CORS) in AWS Elemental MediaStore}.\n\
  \  "]

module PutLifecyclePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_policy_input ->
    ( put_lifecycle_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_lifecycle_policy_input ->
    ( put_lifecycle_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Writes an object lifecycle policy to a container. If the container already has an object \
   lifecycle policy, the service replaces the existing policy with the new policy. It takes up to \
   20 minutes for the change to take effect.\n\n\
  \ For information about how to construct an object lifecycle policy, see \
   {{:https://docs.aws.amazon.com/mediastore/latest/ug/policies-object-lifecycle-components.html}Components \
   of an Object Lifecycle Policy}.\n\
  \ "]

module PutMetricPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_metric_policy_input ->
    ( put_metric_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_metric_policy_input ->
    ( put_metric_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "The metric policy that you want to add to the container. A metric policy allows AWS Elemental \
   MediaStore to send metrics to Amazon CloudWatch. It takes up to 20 minutes for the new policy \
   to take effect.\n"]

module StartAccessLogging : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_access_logging_input ->
    ( start_access_logging_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_access_logging_input ->
    ( start_access_logging_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts access logging on the specified container. When you enable access logging on a \
   container, MediaStore delivers access logs for objects stored in that container to Amazon \
   CloudWatch Logs.\n"]

module StopAccessLogging : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_access_logging_input ->
    ( stop_access_logging_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_access_logging_input ->
    ( stop_access_logging_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops access logging on the specified container. When you stop access logging on a container, \
   MediaStore stops sending access logs to Amazon CloudWatch Logs. These access logs are not saved \
   and are not retrievable.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds tags to the specified AWS Elemental MediaStore container. Tags are key:value pairs that \
   you can associate with AWS resources. For example, the tag key might be \"customer\" and the \
   tag value might be \"companyA.\" You can specify one or more tags to add to each container. You \
   can add up to 50 tags to each container. For more information about tagging, including naming \
   and usage conventions, see \
   {{:https://docs.aws.amazon.com/mediastore/latest/ug/tagging.html}Tagging Resources in \
   MediaStore}.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags from the specified container. You can specify one or more tags to remove. \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of the tags assigned to the specified container. \n"]

module ListContainers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_containers_input ->
    ( list_containers_output,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_containers_input ->
    ( list_containers_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the properties of all containers in AWS Elemental MediaStore. \n\n\
  \ You can query to receive all the containers in one response. Or you can include the \
   [MaxResults] parameter to receive a limited number of containers in each response. In this \
   case, the response includes a token. To get the next set of containers, send the command again, \
   this time with the [NextToken] parameter (with the returned token as its value). The next set \
   of responses appears, with a token if there are still more containers to receive. \n\
  \ \n\
  \  See also [DescribeContainer], which gets the properties of one container. \n\
  \  "]

module GetMetricPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_metric_policy_input ->
    ( get_metric_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_metric_policy_input ->
    ( get_metric_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the metric policy for the specified container. \n"]

module GetLifecyclePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_lifecycle_policy_input ->
    ( get_lifecycle_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_lifecycle_policy_input ->
    ( get_lifecycle_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the object lifecycle policy that is assigned to a container.\n"]

module GetCorsPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `CorsPolicyNotFoundException of cors_policy_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_cors_policy_input ->
    ( get_cors_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `CorsPolicyNotFoundException of cors_policy_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_cors_policy_input ->
    ( get_cors_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `CorsPolicyNotFoundException of cors_policy_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the cross-origin resource sharing (CORS) configuration information that is set for the \
   container.\n\n\
  \ To use this operation, you must have permission to perform the [MediaStore:GetCorsPolicy] \
   action. By default, the container owner has this permission and can grant it to others.\n\
  \ "]

module GetContainerPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_container_policy_input ->
    ( get_container_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_container_policy_input ->
    ( get_container_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the access policy for the specified container. For information about the data that is \
   included in an access policy, see the {{:https://aws.amazon.com/documentation/iam/}AWS Identity \
   and Access Management User Guide}.\n"]

module DescribeContainer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_container_input ->
    ( describe_container_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_container_input ->
    ( describe_container_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the properties of the requested container. This request is commonly used to retrieve \
   the endpoint of a container. An endpoint is a value assigned by the service when a new \
   container is created. A container's endpoint does not change after it has been assigned. The \
   [DescribeContainer] request returns a single [Container] object based on [ContainerName]. To \
   return all [Container] objects that are associated with a specified AWS account, use \
   [ListContainers].\n"]

module DeleteMetricPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_policy_input ->
    ( delete_metric_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_policy_input ->
    ( delete_metric_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the metric policy that is associated with the specified container. If there is no \
   metric policy associated with the container, MediaStore doesn't send metrics to CloudWatch.\n"]

module DeleteLifecyclePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_policy_input ->
    ( delete_lifecycle_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_lifecycle_policy_input ->
    ( delete_lifecycle_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes an object lifecycle policy from a container. It takes up to 20 minutes for the change \
   to take effect.\n"]

module DeleteCorsPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `CorsPolicyNotFoundException of cors_policy_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_cors_policy_input ->
    ( delete_cors_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `CorsPolicyNotFoundException of cors_policy_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_cors_policy_input ->
    ( delete_cors_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `CorsPolicyNotFoundException of cors_policy_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the cross-origin resource sharing (CORS) configuration information that is set for the \
   container.\n\n\
  \ To use this operation, you must have permission to perform the [MediaStore:DeleteCorsPolicy] \
   action. The container owner has this permission by default and can grant this permission to \
   others.\n\
  \ "]

module DeleteContainerPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_container_policy_input ->
    ( delete_container_policy_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_container_policy_input ->
    ( delete_container_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the access policy that is associated with the specified container.\n"]

module DeleteContainer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `ContainerNotFoundException of container_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_container_input ->
    ( delete_container_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_container_input ->
    ( delete_container_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `ContainerNotFoundException of container_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified container. Before you make a [DeleteContainer] request, delete any \
   objects in the container or in any folders in the container. You can delete only empty \
   containers. \n"]

(** {1:Serialization and Deserialization} *)
module CreateContainer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ContainerInUseException of container_in_use_exception
    | `InternalServerError of internal_server_error
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_container_input ->
    ( create_container_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `InternalServerError of internal_server_error
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_container_input ->
    ( create_container_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ContainerInUseException of container_in_use_exception
      | `InternalServerError of internal_server_error
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a storage container to hold objects. A container is similar to a bucket in the Amazon \
   S3 service.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
