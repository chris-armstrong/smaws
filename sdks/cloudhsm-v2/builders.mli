open Types

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_key_list:tag_key_list -> resource_id:resource_id -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tag_list:tag_list -> resource_id:resource_id -> unit -> tag_resource_request

val make_backup :
  ?mode:cluster_mode ->
  ?hsm_type:hsm_type ->
  ?tag_list:tag_list ->
  ?delete_timestamp:timestamp ->
  ?source_cluster:cluster_id ->
  ?source_backup:backup_id ->
  ?source_region:region ->
  ?never_expires:boolean_ ->
  ?copy_timestamp:timestamp ->
  ?create_timestamp:timestamp ->
  ?cluster_id:cluster_id ->
  ?backup_state:backup_state ->
  ?backup_arn:backup_arn ->
  backup_id:backup_id ->
  unit ->
  backup

val make_restore_backup_response : ?backup:backup -> unit -> restore_backup_response
val make_restore_backup_request : backup_id:backup_id -> unit -> restore_backup_request

val make_put_resource_policy_response :
  ?policy:resource_policy -> ?resource_arn:cloud_hsm_arn -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?policy:resource_policy -> ?resource_arn:cloud_hsm_arn -> unit -> put_resource_policy_request

val make_backup_retention_policy :
  ?value:backup_retention_value -> ?type_:backup_retention_type -> unit -> backup_retention_policy

val make_hsm :
  ?state_message:string_ ->
  ?state:hsm_state ->
  ?hsm_type:hsm_type ->
  ?eni_ip_v6:ip_v6_address ->
  ?eni_ip:ip_address ->
  ?eni_id:eni_id ->
  ?subnet_id:subnet_id ->
  ?cluster_id:cluster_id ->
  ?availability_zone:external_az ->
  hsm_id:hsm_id ->
  unit ->
  hsm

val make_certificates :
  ?cluster_certificate:cert ->
  ?manufacturer_hardware_certificate:cert ->
  ?aws_hardware_certificate:cert ->
  ?hsm_certificate:cert ->
  ?cluster_csr:cert ->
  unit ->
  certificates

val make_cluster :
  ?mode:cluster_mode ->
  ?tag_list:tag_list ->
  ?certificates:certificates ->
  ?network_type:network_type ->
  ?vpc_id:vpc_id ->
  ?subnet_mapping:external_subnet_mapping ->
  ?state_message:state_message ->
  ?state:cluster_state ->
  ?source_backup_id:backup_id ->
  ?security_group:security_group ->
  ?pre_co_password:pre_co_password ->
  ?hsm_type_rollback_expiration:timestamp ->
  ?hsm_type:hsm_type ->
  ?hsms:hsms ->
  ?create_timestamp:timestamp ->
  ?cluster_id:cluster_id ->
  ?backup_retention_policy:backup_retention_policy ->
  ?backup_policy:backup_policy ->
  unit ->
  cluster

val make_modify_cluster_response : ?cluster:cluster -> unit -> modify_cluster_response

val make_modify_cluster_request :
  ?backup_retention_policy:backup_retention_policy ->
  ?hsm_type:hsm_type ->
  cluster_id:cluster_id ->
  unit ->
  modify_cluster_request

val make_modify_backup_attributes_response :
  ?backup:backup -> unit -> modify_backup_attributes_response

val make_modify_backup_attributes_request :
  never_expires:boolean_ -> backup_id:backup_id -> unit -> modify_backup_attributes_request

val make_list_tags_response :
  ?next_token:next_token -> tag_list:tag_list -> unit -> list_tags_response

val make_list_tags_request :
  ?max_results:max_size ->
  ?next_token:next_token ->
  resource_id:resource_id ->
  unit ->
  list_tags_request

val make_initialize_cluster_response :
  ?state_message:state_message -> ?state:cluster_state -> unit -> initialize_cluster_response

val make_initialize_cluster_request :
  trust_anchor:cert ->
  signed_cert:cert ->
  cluster_id:cluster_id ->
  unit ->
  initialize_cluster_request

val make_get_resource_policy_response :
  ?policy:resource_policy -> unit -> get_resource_policy_response

val make_get_resource_policy_request :
  ?resource_arn:cloud_hsm_arn -> unit -> get_resource_policy_request

val make_destination_backup :
  ?source_cluster:cluster_id ->
  ?source_backup:backup_id ->
  ?source_region:region ->
  ?create_timestamp:timestamp ->
  unit ->
  destination_backup

val make_describe_clusters_response :
  ?next_token:next_token -> ?clusters:clusters -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?max_results:clusters_max_size ->
  ?next_token:next_token ->
  ?filters:filters ->
  unit ->
  describe_clusters_request

val make_describe_backups_response :
  ?next_token:next_token -> ?backups:backups -> unit -> describe_backups_response

val make_describe_backups_request :
  ?sort_ascending:boolean_ ->
  ?shared:boolean_ ->
  ?filters:filters ->
  ?max_results:backups_max_size ->
  ?next_token:next_token ->
  unit ->
  describe_backups_request

val make_delete_resource_policy_response :
  ?policy:resource_policy -> ?resource_arn:cloud_hsm_arn -> unit -> delete_resource_policy_response

val make_delete_resource_policy_request :
  ?resource_arn:cloud_hsm_arn -> unit -> delete_resource_policy_request

val make_delete_hsm_response : ?hsm_id:hsm_id -> unit -> delete_hsm_response

val make_delete_hsm_request :
  ?eni_ip:ip_address ->
  ?eni_id:eni_id ->
  ?hsm_id:hsm_id ->
  cluster_id:cluster_id ->
  unit ->
  delete_hsm_request

val make_delete_cluster_response : ?cluster:cluster -> unit -> delete_cluster_response
val make_delete_cluster_request : cluster_id:cluster_id -> unit -> delete_cluster_request
val make_delete_backup_response : ?backup:backup -> unit -> delete_backup_response
val make_delete_backup_request : backup_id:backup_id -> unit -> delete_backup_request
val make_create_hsm_response : ?hsm:hsm -> unit -> create_hsm_response

val make_create_hsm_request :
  ?ip_address:ip_address ->
  availability_zone:external_az ->
  cluster_id:cluster_id ->
  unit ->
  create_hsm_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_create_cluster_request :
  ?mode:cluster_mode ->
  ?tag_list:tag_list ->
  ?network_type:network_type ->
  ?source_backup_id:backup_arn ->
  ?backup_retention_policy:backup_retention_policy ->
  subnet_ids:subnet_ids ->
  hsm_type:hsm_type ->
  unit ->
  create_cluster_request

val make_copy_backup_to_region_response :
  ?destination_backup:destination_backup -> unit -> copy_backup_to_region_response

val make_copy_backup_to_region_request :
  ?tag_list:tag_list ->
  backup_id:backup_id ->
  destination_region:region ->
  unit ->
  copy_backup_to_region_request
