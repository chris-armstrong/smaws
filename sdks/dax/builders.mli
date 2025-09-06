open Types

val make_subnet : ?subnet_availability_zone:string_ -> ?subnet_identifier:string_ -> unit -> subnet

val make_subnet_group :
  ?subnets:subnet_list ->
  ?vpc_id:string_ ->
  ?description:string_ ->
  ?subnet_group_name:string_ ->
  unit ->
  subnet_group

val make_update_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> update_subnet_group_response

val make_update_subnet_group_request :
  ?subnet_ids:subnet_identifier_list ->
  ?description:string_ ->
  subnet_group_name:string_ ->
  unit ->
  update_subnet_group_request

val make_parameter_group :
  ?description:string_ -> ?parameter_group_name:string_ -> unit -> parameter_group

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> update_parameter_group_response

val make_parameter_name_value :
  ?parameter_value:string_ -> ?parameter_name:string_ -> unit -> parameter_name_value

val make_update_parameter_group_request :
  parameter_name_values:parameter_name_value_list ->
  parameter_group_name:string_ ->
  unit ->
  update_parameter_group_request

val make_endpoint : ?ur_l:string_ -> ?port:integer -> ?address:string_ -> unit -> endpoint

val make_node :
  ?parameter_group_status:string_ ->
  ?node_status:string_ ->
  ?availability_zone:string_ ->
  ?node_create_time:t_stamp ->
  ?endpoint:endpoint ->
  ?node_id:string_ ->
  unit ->
  node

val make_notification_configuration :
  ?topic_status:string_ -> ?topic_arn:string_ -> unit -> notification_configuration

val make_security_group_membership :
  ?status:string_ -> ?security_group_identifier:string_ -> unit -> security_group_membership

val make_parameter_group_status :
  ?node_ids_to_reboot:node_identifier_list ->
  ?parameter_apply_status:string_ ->
  ?parameter_group_name:string_ ->
  unit ->
  parameter_group_status

val make_sse_description : ?status:sse_status -> unit -> sse_description

val make_cluster :
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?sse_description:sse_description ->
  ?parameter_group:parameter_group_status ->
  ?iam_role_arn:string_ ->
  ?security_groups:security_group_membership_list ->
  ?subnet_group:string_ ->
  ?notification_configuration:notification_configuration ->
  ?preferred_maintenance_window:string_ ->
  ?nodes:node_list ->
  ?node_ids_to_remove:node_identifier_list ->
  ?cluster_discovery_endpoint:endpoint ->
  ?status:string_ ->
  ?node_type:string_ ->
  ?active_nodes:integer_optional ->
  ?total_nodes:integer_optional ->
  ?cluster_arn:string_ ->
  ?description:string_ ->
  ?cluster_name:string_ ->
  unit ->
  cluster

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_update_cluster_request :
  ?security_group_ids:security_group_identifier_list ->
  ?parameter_group_name:string_ ->
  ?notification_topic_status:string_ ->
  ?notification_topic_arn:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?description:string_ ->
  cluster_name:string_ ->
  unit ->
  update_cluster_request

val make_tag : ?value:string_ -> ?key:string_ -> unit -> tag
val make_untag_resource_response : ?tags:tag_list -> unit -> untag_resource_response

val make_untag_resource_request :
  tag_keys:key_list -> resource_name:string_ -> unit -> untag_resource_request

val make_tag_resource_response : ?tags:tag_list -> unit -> tag_resource_response

val make_tag_resource_request :
  tags:tag_list -> resource_name:string_ -> unit -> tag_resource_request

val make_sse_specification : enabled:sse_enabled -> unit -> sse_specification
val make_reboot_node_response : ?cluster:cluster -> unit -> reboot_node_response

val make_reboot_node_request :
  node_id:string_ -> cluster_name:string_ -> unit -> reboot_node_request

val make_node_type_specific_value :
  ?value:string_ -> ?node_type:string_ -> unit -> node_type_specific_value

val make_parameter :
  ?change_type:change_type ->
  ?is_modifiable:is_modifiable ->
  ?allowed_values:string_ ->
  ?data_type:string_ ->
  ?source:string_ ->
  ?description:string_ ->
  ?node_type_specific_values:node_type_specific_value_list ->
  ?parameter_value:string_ ->
  ?parameter_type:parameter_type ->
  ?parameter_name:string_ ->
  unit ->
  parameter

val make_list_tags_response : ?next_token:string_ -> ?tags:tag_list -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:string_ -> resource_name:string_ -> unit -> list_tags_request

val make_increase_replication_factor_response :
  ?cluster:cluster -> unit -> increase_replication_factor_response

val make_increase_replication_factor_request :
  ?availability_zones:availability_zone_list ->
  new_replication_factor:integer ->
  cluster_name:string_ ->
  unit ->
  increase_replication_factor_request

val make_event :
  ?date:t_stamp ->
  ?message:string_ ->
  ?source_type:source_type ->
  ?source_name:string_ ->
  unit ->
  event

val make_describe_subnet_groups_response :
  ?subnet_groups:subnet_group_list -> ?next_token:string_ -> unit -> describe_subnet_groups_response

val make_describe_subnet_groups_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?subnet_group_names:subnet_group_name_list ->
  unit ->
  describe_subnet_groups_request

val make_describe_parameters_response :
  ?parameters:parameter_list -> ?next_token:string_ -> unit -> describe_parameters_response

val make_describe_parameters_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?source:string_ ->
  parameter_group_name:string_ ->
  unit ->
  describe_parameters_request

val make_describe_parameter_groups_response :
  ?parameter_groups:parameter_group_list ->
  ?next_token:string_ ->
  unit ->
  describe_parameter_groups_response

val make_describe_parameter_groups_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?parameter_group_names:parameter_group_name_list ->
  unit ->
  describe_parameter_groups_request

val make_describe_events_response :
  ?events:event_list -> ?next_token:string_ -> unit -> describe_events_response

val make_describe_events_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?duration:integer_optional ->
  ?end_time:t_stamp ->
  ?start_time:t_stamp ->
  ?source_type:source_type ->
  ?source_name:string_ ->
  unit ->
  describe_events_request

val make_describe_default_parameters_response :
  ?parameters:parameter_list -> ?next_token:string_ -> unit -> describe_default_parameters_response

val make_describe_default_parameters_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  unit ->
  describe_default_parameters_request

val make_describe_clusters_response :
  ?clusters:cluster_list -> ?next_token:string_ -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?next_token:string_ ->
  ?max_results:integer_optional ->
  ?cluster_names:cluster_name_list ->
  unit ->
  describe_clusters_request

val make_delete_subnet_group_response :
  ?deletion_message:string_ -> unit -> delete_subnet_group_response

val make_delete_subnet_group_request :
  subnet_group_name:string_ -> unit -> delete_subnet_group_request

val make_delete_parameter_group_response :
  ?deletion_message:string_ -> unit -> delete_parameter_group_response

val make_delete_parameter_group_request :
  parameter_group_name:string_ -> unit -> delete_parameter_group_request

val make_delete_cluster_response : ?cluster:cluster -> unit -> delete_cluster_response
val make_delete_cluster_request : cluster_name:string_ -> unit -> delete_cluster_request

val make_decrease_replication_factor_response :
  ?cluster:cluster -> unit -> decrease_replication_factor_response

val make_decrease_replication_factor_request :
  ?node_ids_to_remove:node_identifier_list ->
  ?availability_zones:availability_zone_list ->
  new_replication_factor:integer ->
  cluster_name:string_ ->
  unit ->
  decrease_replication_factor_request

val make_create_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> create_subnet_group_response

val make_create_subnet_group_request :
  ?description:string_ ->
  subnet_ids:subnet_identifier_list ->
  subnet_group_name:string_ ->
  unit ->
  create_subnet_group_request

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> create_parameter_group_response

val make_create_parameter_group_request :
  ?description:string_ -> parameter_group_name:string_ -> unit -> create_parameter_group_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_create_cluster_request :
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?sse_specification:sse_specification ->
  ?tags:tag_list ->
  ?parameter_group_name:string_ ->
  ?notification_topic_arn:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?security_group_ids:security_group_identifier_list ->
  ?subnet_group_name:string_ ->
  ?availability_zones:availability_zone_list ->
  ?description:string_ ->
  iam_role_arn:string_ ->
  replication_factor:integer ->
  node_type:string_ ->
  cluster_name:string_ ->
  unit ->
  create_cluster_request
