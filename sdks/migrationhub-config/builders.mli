open Types

val make_target : ?id:target_id -> type_:target_type -> unit -> target

val make_home_region_control :
  ?requested_time:requested_time ->
  ?target:target ->
  ?home_region:home_region ->
  ?control_id:control_id ->
  unit ->
  home_region_control

val make_get_home_region_request : unit -> unit

val make_describe_home_region_controls_request :
  ?next_token:token ->
  ?max_results:describe_home_region_controls_max_results ->
  ?target:target ->
  ?home_region:home_region ->
  ?control_id:control_id ->
  unit ->
  describe_home_region_controls_request

val make_delete_home_region_control_request :
  control_id:control_id -> unit -> delete_home_region_control_request

val make_create_home_region_control_request :
  ?dry_run:dry_run ->
  target:target ->
  home_region:home_region ->
  unit ->
  create_home_region_control_request
