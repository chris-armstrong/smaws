open Types

val make_get_home_region_request : unit -> unit
val make_target : ?id:target_id -> type_:target_type -> unit -> target

val make_home_region_control :
  ?control_id:control_id ->
  ?home_region:home_region ->
  ?target:target ->
  ?requested_time:requested_time ->
  unit ->
  home_region_control

val make_describe_home_region_controls_request :
  ?control_id:control_id ->
  ?home_region:home_region ->
  ?target:target ->
  ?max_results:describe_home_region_controls_max_results ->
  ?next_token:token ->
  unit ->
  describe_home_region_controls_request

val make_delete_home_region_control_request :
  control_id:control_id -> unit -> delete_home_region_control_request

val make_create_home_region_control_request :
  ?dry_run:dry_run ->
  home_region:home_region ->
  target:target ->
  unit ->
  create_home_region_control_request
