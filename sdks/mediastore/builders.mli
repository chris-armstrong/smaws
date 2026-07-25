open Types

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
