open Types

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_remove_tags_from_resource_response :
  status:string_ -> unit -> remove_tags_from_resource_response

val make_remove_tags_from_resource_request :
  tag_key_list:tag_key_list -> resource_arn:string_ -> unit -> remove_tags_from_resource_request

val make_modify_luna_client_response : ?client_arn:client_arn -> unit -> modify_luna_client_response

val make_modify_luna_client_request :
  certificate:certificate -> client_arn:client_arn -> unit -> modify_luna_client_request

val make_modify_hsm_response : ?hsm_arn:hsm_arn -> unit -> modify_hsm_response

val make_modify_hsm_request :
  ?syslog_ip:ip_address ->
  ?external_id:external_id ->
  ?iam_role_arn:iam_role_arn ->
  ?eni_ip:ip_address ->
  ?subnet_id:subnet_id ->
  hsm_arn:hsm_arn ->
  unit ->
  modify_hsm_request

val make_modify_hapg_response : ?hapg_arn:hapg_arn -> unit -> modify_hapg_response

val make_modify_hapg_request :
  ?partition_serial_list:partition_serial_list ->
  ?label:label ->
  hapg_arn:hapg_arn ->
  unit ->
  modify_hapg_request

val make_list_tags_for_resource_response :
  tag_list:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:string_ -> unit -> list_tags_for_resource_request

val make_list_luna_clients_response :
  ?next_token:pagination_token -> client_list:client_list -> unit -> list_luna_clients_response

val make_list_luna_clients_request :
  ?next_token:pagination_token -> unit -> list_luna_clients_request

val make_list_hsms_response :
  ?next_token:pagination_token -> ?hsm_list:hsm_list -> unit -> list_hsms_response

val make_list_hsms_request : ?next_token:pagination_token -> unit -> list_hsms_request

val make_list_hapgs_response :
  ?next_token:pagination_token -> hapg_list:hapg_list -> unit -> list_hapgs_response

val make_list_hapgs_request : ?next_token:pagination_token -> unit -> list_hapgs_request
val make_list_available_zones_response : ?az_list:az_list -> unit -> list_available_zones_response
val make_list_available_zones_request : unit -> unit

val make_get_config_response :
  ?config_cred:string_ ->
  ?config_file:string_ ->
  ?config_type:string_ ->
  unit ->
  get_config_response

val make_get_config_request :
  hapg_list:hapg_list ->
  client_version:client_version ->
  client_arn:client_arn ->
  unit ->
  get_config_request

val make_describe_luna_client_response :
  ?label:label ->
  ?last_modified_timestamp:timestamp ->
  ?certificate_fingerprint:certificate_fingerprint ->
  ?certificate:certificate ->
  ?client_arn:client_arn ->
  unit ->
  describe_luna_client_response

val make_describe_luna_client_request :
  ?certificate_fingerprint:certificate_fingerprint ->
  ?client_arn:client_arn ->
  unit ->
  describe_luna_client_request

val make_describe_hsm_response :
  ?partitions:partition_list ->
  ?server_cert_last_updated:timestamp ->
  ?server_cert_uri:string_ ->
  ?ssh_key_last_updated:timestamp ->
  ?ssh_public_key:ssh_key ->
  ?software_version:string_ ->
  ?hsm_type:string_ ->
  ?vendor_name:string_ ->
  ?serial_number:hsm_serial_number ->
  ?iam_role_arn:iam_role_arn ->
  ?subnet_id:subnet_id ->
  ?vpc_id:vpc_id ->
  ?subscription_end_date:timestamp ->
  ?subscription_start_date:timestamp ->
  ?subscription_type:subscription_type ->
  ?eni_ip:ip_address ->
  ?eni_id:eni_id ->
  ?availability_zone:a_z ->
  ?status_details:string_ ->
  ?status:hsm_status ->
  ?hsm_arn:hsm_arn ->
  unit ->
  describe_hsm_response

val make_describe_hsm_request :
  ?hsm_serial_number:hsm_serial_number -> ?hsm_arn:hsm_arn -> unit -> describe_hsm_request

val make_describe_hapg_response :
  ?state:cloud_hsm_object_state ->
  ?partition_serial_list:partition_serial_list ->
  ?last_modified_timestamp:timestamp ->
  ?label:label ->
  ?hsms_pending_registration:hsm_list ->
  ?hsms_pending_deletion:hsm_list ->
  ?hsms_last_action_failed:hsm_list ->
  ?hapg_serial:string_ ->
  ?hapg_arn:hapg_arn ->
  unit ->
  describe_hapg_response

val make_describe_hapg_request : hapg_arn:hapg_arn -> unit -> describe_hapg_request
val make_delete_luna_client_response : status:string_ -> unit -> delete_luna_client_response
val make_delete_luna_client_request : client_arn:client_arn -> unit -> delete_luna_client_request
val make_delete_hsm_response : status:string_ -> unit -> delete_hsm_response
val make_delete_hsm_request : hsm_arn:hsm_arn -> unit -> delete_hsm_request
val make_delete_hapg_response : status:string_ -> unit -> delete_hapg_response
val make_delete_hapg_request : hapg_arn:hapg_arn -> unit -> delete_hapg_request
val make_create_luna_client_response : ?client_arn:client_arn -> unit -> create_luna_client_response

val make_create_luna_client_request :
  ?label:client_label -> certificate:certificate -> unit -> create_luna_client_request

val make_create_hsm_response : ?hsm_arn:hsm_arn -> unit -> create_hsm_response

val make_create_hsm_request :
  ?syslog_ip:ip_address ->
  ?client_token:client_token ->
  ?external_id:external_id ->
  ?eni_ip:ip_address ->
  subscription_type:subscription_type ->
  iam_role_arn:iam_role_arn ->
  ssh_key:ssh_key ->
  subnet_id:subnet_id ->
  unit ->
  create_hsm_request

val make_create_hapg_response : ?hapg_arn:hapg_arn -> unit -> create_hapg_response
val make_create_hapg_request : label:label -> unit -> create_hapg_request
val make_add_tags_to_resource_response : status:string_ -> unit -> add_tags_to_resource_response

val make_add_tags_to_resource_request :
  tag_list:tag_list -> resource_arn:string_ -> unit -> add_tags_to_resource_request
