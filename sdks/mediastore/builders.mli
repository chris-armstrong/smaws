open Types

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource:container_ar_n -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_input : tags:tag_list -> resource:container_ar_n -> unit -> tag_resource_input
val make_stop_access_logging_output : unit -> unit

val make_stop_access_logging_input :
  container_name:container_name -> unit -> stop_access_logging_input

val make_start_access_logging_output : unit -> unit

val make_start_access_logging_input :
  container_name:container_name -> unit -> start_access_logging_input

val make_put_metric_policy_output : unit -> unit

val make_metric_policy_rule :
  object_group_name:object_group_name -> object_group:object_group -> unit -> metric_policy_rule

val make_metric_policy :
  ?metric_policy_rules:metric_policy_rules ->
  container_level_metrics:container_level_metrics ->
  unit ->
  metric_policy

val make_put_metric_policy_input :
  metric_policy:metric_policy -> container_name:container_name -> unit -> put_metric_policy_input

val make_put_lifecycle_policy_output : unit -> unit

val make_put_lifecycle_policy_input :
  lifecycle_policy:lifecycle_policy ->
  container_name:container_name ->
  unit ->
  put_lifecycle_policy_input

val make_put_cors_policy_output : unit -> unit

val make_cors_rule :
  ?expose_headers:expose_headers ->
  ?max_age_seconds:max_age_seconds ->
  ?allowed_methods:allowed_methods ->
  allowed_headers:allowed_headers ->
  allowed_origins:allowed_origins ->
  unit ->
  cors_rule

val make_put_cors_policy_input :
  cors_policy:cors_policy -> container_name:container_name -> unit -> put_cors_policy_input

val make_put_container_policy_output : unit -> unit

val make_put_container_policy_input :
  policy:container_policy -> container_name:container_name -> unit -> put_container_policy_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  resource:container_ar_n -> unit -> list_tags_for_resource_input

val make_container :
  ?access_logging_enabled:container_access_logging_enabled ->
  ?status:container_status ->
  ?name:container_name ->
  ?ar_n:container_ar_n ->
  ?creation_time:time_stamp ->
  ?endpoint:endpoint ->
  unit ->
  container

val make_list_containers_output :
  ?next_token:pagination_token -> containers:container_list -> unit -> list_containers_output

val make_list_containers_input :
  ?max_results:container_list_limit -> ?next_token:pagination_token -> unit -> list_containers_input

val make_get_metric_policy_output : metric_policy:metric_policy -> unit -> get_metric_policy_output
val make_get_metric_policy_input : container_name:container_name -> unit -> get_metric_policy_input

val make_get_lifecycle_policy_output :
  lifecycle_policy:lifecycle_policy -> unit -> get_lifecycle_policy_output

val make_get_lifecycle_policy_input :
  container_name:container_name -> unit -> get_lifecycle_policy_input

val make_get_cors_policy_output : cors_policy:cors_policy -> unit -> get_cors_policy_output
val make_get_cors_policy_input : container_name:container_name -> unit -> get_cors_policy_input

val make_get_container_policy_output :
  policy:container_policy -> unit -> get_container_policy_output

val make_get_container_policy_input :
  container_name:container_name -> unit -> get_container_policy_input

val make_describe_container_output : ?container:container -> unit -> describe_container_output

val make_describe_container_input :
  ?container_name:container_name -> unit -> describe_container_input

val make_delete_metric_policy_output : unit -> unit

val make_delete_metric_policy_input :
  container_name:container_name -> unit -> delete_metric_policy_input

val make_delete_lifecycle_policy_output : unit -> unit

val make_delete_lifecycle_policy_input :
  container_name:container_name -> unit -> delete_lifecycle_policy_input

val make_delete_cors_policy_output : unit -> unit

val make_delete_cors_policy_input :
  container_name:container_name -> unit -> delete_cors_policy_input

val make_delete_container_policy_output : unit -> unit

val make_delete_container_policy_input :
  container_name:container_name -> unit -> delete_container_policy_input

val make_delete_container_output : unit -> unit
val make_delete_container_input : container_name:container_name -> unit -> delete_container_input
val make_create_container_output : container:container -> unit -> create_container_output

val make_create_container_input :
  ?tags:tag_list -> container_name:container_name -> unit -> create_container_input
