open Types

val make_subnet :
  ?subnet_identifier:string_ ->
  ?subnet_availability_zone:string_ ->
  ?supported_network_types:network_type_list ->
  unit ->
  subnet

val make_subnet_group :
  ?subnet_group_name:string_ ->
  ?description:string_ ->
  ?vpc_id:string_ ->
  ?subnets:subnet_list ->
  ?supported_network_types:network_type_list ->
  unit ->
  subnet_group

val make_update_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> update_subnet_group_response

val make_update_subnet_group_request :
  ?description:string_ ->
  ?subnet_ids:subnet_identifier_list ->
  subnet_group_name:string_ ->
  unit ->
  update_subnet_group_request

val make_parameter_group :
  ?parameter_group_name:string_ -> ?description:string_ -> unit -> parameter_group

val make_update_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> update_parameter_group_response

val make_parameter_name_value :
  ?parameter_name:string_ -> ?parameter_value:string_ -> unit -> parameter_name_value

val make_update_parameter_group_request :
  parameter_group_name:string_ ->
  parameter_name_values:parameter_name_value_list ->
  unit ->
  update_parameter_group_request

val make_sse_description : ?status:sse_status -> unit -> sse_description

val make_parameter_group_status :
  ?parameter_group_name:string_ ->
  ?parameter_apply_status:string_ ->
  ?node_ids_to_reboot:node_identifier_list ->
  unit ->
  parameter_group_status

val make_security_group_membership :
  ?security_group_identifier:string_ -> ?status:string_ -> unit -> security_group_membership

val make_notification_configuration :
  ?topic_arn:string_ -> ?topic_status:string_ -> unit -> notification_configuration

val make_endpoint : ?address:string_ -> ?port:integer -> ?ur_l:string_ -> unit -> endpoint

val make_node :
  ?node_id:string_ ->
  ?endpoint:endpoint ->
  ?node_create_time:t_stamp ->
  ?availability_zone:string_ ->
  ?node_status:string_ ->
  ?parameter_group_status:string_ ->
  unit ->
  node

val make_cluster :
  ?cluster_name:string_ ->
  ?description:string_ ->
  ?cluster_arn:string_ ->
  ?total_nodes:integer_optional ->
  ?active_nodes:integer_optional ->
  ?node_type:string_ ->
  ?status:string_ ->
  ?cluster_discovery_endpoint:endpoint ->
  ?node_ids_to_remove:node_identifier_list ->
  ?nodes:node_list ->
  ?preferred_maintenance_window:string_ ->
  ?notification_configuration:notification_configuration ->
  ?subnet_group:string_ ->
  ?security_groups:security_group_membership_list ->
  ?iam_role_arn:string_ ->
  ?parameter_group:parameter_group_status ->
  ?sse_description:sse_description ->
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?network_type:network_type ->
  unit ->
  cluster

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_update_cluster_request :
  ?description:string_ ->
  ?preferred_maintenance_window:string_ ->
  ?notification_topic_arn:string_ ->
  ?notification_topic_status:string_ ->
  ?parameter_group_name:string_ ->
  ?security_group_ids:security_group_identifier_list ->
  cluster_name:string_ ->
  unit ->
  update_cluster_request

val make_tag : ?key:string_ -> ?value:string_ -> unit -> tag
val make_untag_resource_response : ?tags:tag_list -> unit -> untag_resource_response

val make_untag_resource_request :
  resource_name:string_ -> tag_keys:key_list -> unit -> untag_resource_request

val make_tag_resource_response : ?tags:tag_list -> unit -> tag_resource_response

val make_tag_resource_request :
  resource_name:string_ -> tags:tag_list -> unit -> tag_resource_request

val make_reboot_node_response : ?cluster:cluster -> unit -> reboot_node_response

val make_reboot_node_request :
  cluster_name:string_ -> node_id:string_ -> unit -> reboot_node_request

val make_list_tags_response : ?tags:tag_list -> ?next_token:string_ -> unit -> list_tags_response

val make_list_tags_request :
  ?next_token:string_ -> resource_name:string_ -> unit -> list_tags_request

val make_increase_replication_factor_response :
  ?cluster:cluster -> unit -> increase_replication_factor_response

val make_increase_replication_factor_request :
  ?availability_zones:availability_zone_list ->
  cluster_name:string_ ->
  new_replication_factor:integer ->
  unit ->
  increase_replication_factor_request

val make_describe_subnet_groups_response :
  ?next_token:string_ -> ?subnet_groups:subnet_group_list -> unit -> describe_subnet_groups_response

val make_describe_subnet_groups_request :
  ?subnet_group_names:subnet_group_name_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_subnet_groups_request

val make_node_type_specific_value :
  ?node_type:string_ -> ?value:string_ -> unit -> node_type_specific_value

val make_parameter :
  ?parameter_name:string_ ->
  ?parameter_type:parameter_type ->
  ?parameter_value:string_ ->
  ?node_type_specific_values:node_type_specific_value_list ->
  ?description:string_ ->
  ?source:string_ ->
  ?data_type:string_ ->
  ?allowed_values:string_ ->
  ?is_modifiable:is_modifiable ->
  ?change_type:change_type ->
  unit ->
  parameter

val make_describe_parameters_response :
  ?next_token:string_ -> ?parameters:parameter_list -> unit -> describe_parameters_response

val make_describe_parameters_request :
  ?source:string_ ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  parameter_group_name:string_ ->
  unit ->
  describe_parameters_request

val make_describe_parameter_groups_response :
  ?next_token:string_ ->
  ?parameter_groups:parameter_group_list ->
  unit ->
  describe_parameter_groups_response

val make_describe_parameter_groups_request :
  ?parameter_group_names:parameter_group_name_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_parameter_groups_request

val make_event :
  ?source_name:string_ ->
  ?source_type:source_type ->
  ?message:string_ ->
  ?date:t_stamp ->
  unit ->
  event

val make_describe_events_response :
  ?next_token:string_ -> ?events:event_list -> unit -> describe_events_response

val make_describe_events_request :
  ?source_name:string_ ->
  ?source_type:source_type ->
  ?start_time:t_stamp ->
  ?end_time:t_stamp ->
  ?duration:integer_optional ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_events_request

val make_describe_default_parameters_response :
  ?next_token:string_ -> ?parameters:parameter_list -> unit -> describe_default_parameters_response

val make_describe_default_parameters_request :
  ?max_results:integer_optional ->
  ?next_token:string_ ->
  unit ->
  describe_default_parameters_request

val make_describe_clusters_response :
  ?next_token:string_ -> ?clusters:cluster_list -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?cluster_names:cluster_name_list ->
  ?max_results:integer_optional ->
  ?next_token:string_ ->
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
  ?availability_zones:availability_zone_list ->
  ?node_ids_to_remove:node_identifier_list ->
  cluster_name:string_ ->
  new_replication_factor:integer ->
  unit ->
  decrease_replication_factor_request

val make_create_subnet_group_response :
  ?subnet_group:subnet_group -> unit -> create_subnet_group_response

val make_create_subnet_group_request :
  ?description:string_ ->
  subnet_group_name:string_ ->
  subnet_ids:subnet_identifier_list ->
  unit ->
  create_subnet_group_request

val make_create_parameter_group_response :
  ?parameter_group:parameter_group -> unit -> create_parameter_group_response

val make_create_parameter_group_request :
  ?description:string_ -> parameter_group_name:string_ -> unit -> create_parameter_group_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response
val make_sse_specification : enabled:sse_enabled -> unit -> sse_specification

val make_create_cluster_request :
  ?description:string_ ->
  ?availability_zones:availability_zone_list ->
  ?subnet_group_name:string_ ->
  ?security_group_ids:security_group_identifier_list ->
  ?preferred_maintenance_window:string_ ->
  ?notification_topic_arn:string_ ->
  ?parameter_group_name:string_ ->
  ?tags:tag_list ->
  ?sse_specification:sse_specification ->
  ?cluster_endpoint_encryption_type:cluster_endpoint_encryption_type ->
  ?network_type:network_type ->
  cluster_name:string_ ->
  node_type:string_ ->
  replication_factor:integer ->
  iam_role_arn:string_ ->
  unit ->
  create_cluster_request
