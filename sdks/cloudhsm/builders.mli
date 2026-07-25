open Types

val make_add_tags_to_resource_response : status:string_ -> unit -> add_tags_to_resource_response
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_add_tags_to_resource_request :
  resource_arn:string_ -> tag_list:tag_list -> unit -> add_tags_to_resource_request

val make_remove_tags_from_resource_response :
  status:string_ -> unit -> remove_tags_from_resource_response

val make_remove_tags_from_resource_request :
  resource_arn:string_ -> tag_key_list:tag_key_list -> unit -> remove_tags_from_resource_request

val make_modify_luna_client_response : ?client_arn:client_arn -> unit -> modify_luna_client_response

val make_modify_luna_client_request :
  client_arn:client_arn -> certificate:certificate -> unit -> modify_luna_client_request

val make_modify_hsm_response : ?hsm_arn:hsm_arn -> unit -> modify_hsm_response

val make_modify_hsm_request :
  ?subnet_id:subnet_id ->
  ?eni_ip:ip_address ->
  ?iam_role_arn:iam_role_arn ->
  ?external_id:external_id ->
  ?syslog_ip:ip_address ->
  hsm_arn:hsm_arn ->
  unit ->
  modify_hsm_request

val make_modify_hapg_response : ?hapg_arn:hapg_arn -> unit -> modify_hapg_response

val make_modify_hapg_request :
  ?label:label ->
  ?partition_serial_list:partition_serial_list ->
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
  ?hsm_list:hsm_list -> ?next_token:pagination_token -> unit -> list_hsms_response

val make_list_hsms_request : ?next_token:pagination_token -> unit -> list_hsms_request

val make_list_hapgs_response :
  ?next_token:pagination_token -> hapg_list:hapg_list -> unit -> list_hapgs_response

val make_list_hapgs_request : ?next_token:pagination_token -> unit -> list_hapgs_request
val make_list_available_zones_response : ?az_list:az_list -> unit -> list_available_zones_response
val make_list_available_zones_request : unit -> unit

val make_get_config_response :
  ?config_type:string_ ->
  ?config_file:string_ ->
  ?config_cred:string_ ->
  unit ->
  get_config_response

val make_get_config_request :
  client_arn:client_arn ->
  client_version:client_version ->
  hapg_list:hapg_list ->
  unit ->
  get_config_request

val make_describe_luna_client_response :
  ?client_arn:client_arn ->
  ?certificate:certificate ->
  ?certificate_fingerprint:certificate_fingerprint ->
  ?last_modified_timestamp:timestamp ->
  ?label:label ->
  unit ->
  describe_luna_client_response

val make_describe_luna_client_request :
  ?client_arn:client_arn ->
  ?certificate_fingerprint:certificate_fingerprint ->
  unit ->
  describe_luna_client_request

val make_describe_hsm_response :
  ?hsm_arn:hsm_arn ->
  ?status:hsm_status ->
  ?status_details:string_ ->
  ?availability_zone:a_z ->
  ?eni_id:eni_id ->
  ?eni_ip:ip_address ->
  ?subscription_type:subscription_type ->
  ?subscription_start_date:timestamp ->
  ?subscription_end_date:timestamp ->
  ?vpc_id:vpc_id ->
  ?subnet_id:subnet_id ->
  ?iam_role_arn:iam_role_arn ->
  ?serial_number:hsm_serial_number ->
  ?vendor_name:string_ ->
  ?hsm_type:string_ ->
  ?software_version:string_ ->
  ?ssh_public_key:ssh_key ->
  ?ssh_key_last_updated:timestamp ->
  ?server_cert_uri:string_ ->
  ?server_cert_last_updated:timestamp ->
  ?partitions:partition_list ->
  unit ->
  describe_hsm_response

val make_describe_hsm_request :
  ?hsm_arn:hsm_arn -> ?hsm_serial_number:hsm_serial_number -> unit -> describe_hsm_request

val make_describe_hapg_response :
  ?hapg_arn:hapg_arn ->
  ?hapg_serial:string_ ->
  ?hsms_last_action_failed:hsm_list ->
  ?hsms_pending_deletion:hsm_list ->
  ?hsms_pending_registration:hsm_list ->
  ?label:label ->
  ?last_modified_timestamp:timestamp ->
  ?partition_serial_list:partition_serial_list ->
  ?state:cloud_hsm_object_state ->
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
  ?eni_ip:ip_address ->
  ?external_id:external_id ->
  ?client_token:client_token ->
  ?syslog_ip:ip_address ->
  subnet_id:subnet_id ->
  ssh_key:ssh_key ->
  iam_role_arn:iam_role_arn ->
  subscription_type:subscription_type ->
  unit ->
  create_hsm_request

val make_create_hapg_response : ?hapg_arn:hapg_arn -> unit -> create_hapg_response
val make_create_hapg_request : label:label -> unit -> create_hapg_request
