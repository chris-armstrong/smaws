open Types

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_backup :
  ?backup_arn:backup_arn ->
  ?backup_state:backup_state ->
  ?cluster_id:cluster_id ->
  ?create_timestamp:timestamp ->
  ?copy_timestamp:timestamp ->
  ?never_expires:boolean_ ->
  ?source_region:region ->
  ?source_backup:backup_id ->
  ?source_cluster:cluster_id ->
  ?delete_timestamp:timestamp ->
  ?tag_list:tag_list ->
  ?hsm_type:hsm_type ->
  ?mode:cluster_mode ->
  backup_id:backup_id ->
  unit ->
  backup

val make_backup_retention_policy :
  ?type_:backup_retention_type -> ?value:backup_retention_value -> unit -> backup_retention_policy

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_id:resource_id -> tag_key_list:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_id:resource_id -> tag_list:tag_list -> unit -> tag_resource_request

val make_restore_backup_response : ?backup:backup -> unit -> restore_backup_response
val make_restore_backup_request : backup_id:backup_id -> unit -> restore_backup_request

val make_put_resource_policy_response :
  ?resource_arn:cloud_hsm_arn -> ?policy:resource_policy -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?resource_arn:cloud_hsm_arn -> ?policy:resource_policy -> unit -> put_resource_policy_request

val make_certificates :
  ?cluster_csr:cert ->
  ?hsm_certificate:cert ->
  ?aws_hardware_certificate:cert ->
  ?manufacturer_hardware_certificate:cert ->
  ?cluster_certificate:cert ->
  unit ->
  certificates

val make_hsm :
  ?availability_zone:external_az ->
  ?cluster_id:cluster_id ->
  ?subnet_id:subnet_id ->
  ?eni_id:eni_id ->
  ?eni_ip:ip_address ->
  ?eni_ip_v6:ip_v6_address ->
  ?hsm_type:hsm_type ->
  ?state:hsm_state ->
  ?state_message:string_ ->
  hsm_id:hsm_id ->
  unit ->
  hsm

val make_cluster :
  ?backup_policy:backup_policy ->
  ?backup_retention_policy:backup_retention_policy ->
  ?cluster_id:cluster_id ->
  ?create_timestamp:timestamp ->
  ?hsms:hsms ->
  ?hsm_type:hsm_type ->
  ?hsm_type_rollback_expiration:timestamp ->
  ?pre_co_password:pre_co_password ->
  ?security_group:security_group ->
  ?source_backup_id:backup_id ->
  ?state:cluster_state ->
  ?state_message:state_message ->
  ?subnet_mapping:external_subnet_mapping ->
  ?vpc_id:vpc_id ->
  ?network_type:network_type ->
  ?certificates:certificates ->
  ?tag_list:tag_list ->
  ?mode:cluster_mode ->
  unit ->
  cluster

val make_modify_cluster_response : ?cluster:cluster -> unit -> modify_cluster_response

val make_modify_cluster_request :
  ?hsm_type:hsm_type ->
  ?backup_retention_policy:backup_retention_policy ->
  cluster_id:cluster_id ->
  unit ->
  modify_cluster_request

val make_modify_backup_attributes_response :
  ?backup:backup -> unit -> modify_backup_attributes_response

val make_modify_backup_attributes_request :
  backup_id:backup_id -> never_expires:boolean_ -> unit -> modify_backup_attributes_request

val make_list_tags_response :
  ?next_token:next_token -> tag_list:tag_list -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:next_token ->
  ?max_results:max_size ->
  resource_id:resource_id ->
  unit ->
  list_tags_request

val make_initialize_cluster_response :
  ?state:cluster_state -> ?state_message:state_message -> unit -> initialize_cluster_response

val make_initialize_cluster_request :
  cluster_id:cluster_id ->
  signed_cert:cert ->
  trust_anchor:cert ->
  unit ->
  initialize_cluster_request

val make_get_resource_policy_response :
  ?policy:resource_policy -> unit -> get_resource_policy_response

val make_get_resource_policy_request :
  ?resource_arn:cloud_hsm_arn -> unit -> get_resource_policy_request

val make_describe_clusters_response :
  ?clusters:clusters -> ?next_token:next_token -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?filters:filters ->
  ?next_token:next_token ->
  ?max_results:clusters_max_size ->
  unit ->
  describe_clusters_request

val make_describe_backups_response :
  ?backups:backups -> ?next_token:next_token -> unit -> describe_backups_response

val make_describe_backups_request :
  ?next_token:next_token ->
  ?max_results:backups_max_size ->
  ?filters:filters ->
  ?shared:boolean_ ->
  ?sort_ascending:boolean_ ->
  unit ->
  describe_backups_request

val make_delete_resource_policy_response :
  ?resource_arn:cloud_hsm_arn -> ?policy:resource_policy -> unit -> delete_resource_policy_response

val make_delete_resource_policy_request :
  ?resource_arn:cloud_hsm_arn -> unit -> delete_resource_policy_request

val make_delete_hsm_response : ?hsm_id:hsm_id -> unit -> delete_hsm_response

val make_delete_hsm_request :
  ?hsm_id:hsm_id ->
  ?eni_id:eni_id ->
  ?eni_ip:ip_address ->
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
  cluster_id:cluster_id ->
  availability_zone:external_az ->
  unit ->
  create_hsm_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_create_cluster_request :
  ?backup_retention_policy:backup_retention_policy ->
  ?source_backup_id:backup_arn ->
  ?network_type:network_type ->
  ?tag_list:tag_list ->
  ?mode:cluster_mode ->
  hsm_type:hsm_type ->
  subnet_ids:subnet_ids ->
  unit ->
  create_cluster_request

val make_destination_backup :
  ?create_timestamp:timestamp ->
  ?source_region:region ->
  ?source_backup:backup_id ->
  ?source_cluster:cluster_id ->
  unit ->
  destination_backup

val make_copy_backup_to_region_response :
  ?destination_backup:destination_backup -> unit -> copy_backup_to_region_response

val make_copy_backup_to_region_request :
  ?tag_list:tag_list ->
  destination_region:region ->
  backup_id:backup_id ->
  unit ->
  copy_backup_to_region_request
