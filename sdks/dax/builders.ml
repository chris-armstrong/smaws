open Types

let make_subnet ?subnet_identifier:(subnet_identifier_ : string_ option)
    ?subnet_availability_zone:(subnet_availability_zone_ : string_ option)
    ?supported_network_types:(supported_network_types_ : network_type_list option) () =
  ({
     subnet_identifier = subnet_identifier_;
     subnet_availability_zone = subnet_availability_zone_;
     supported_network_types = supported_network_types_;
   }
    : subnet)

let make_subnet_group ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?description:(description_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?subnets:(subnets_ : subnet_list option)
    ?supported_network_types:(supported_network_types_ : network_type_list option) () =
  ({
     subnet_group_name = subnet_group_name_;
     description = description_;
     vpc_id = vpc_id_;
     subnets = subnets_;
     supported_network_types = supported_network_types_;
   }
    : subnet_group)

let make_update_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : update_subnet_group_response)

let make_update_subnet_group_request ?description:(description_ : string_ option)
    ?subnet_ids:(subnet_ids_ : subnet_identifier_list option)
    ~subnet_group_name:(subnet_group_name_ : string_) () =
  ({ subnet_group_name = subnet_group_name_; description = description_; subnet_ids = subnet_ids_ }
    : update_subnet_group_request)

let make_parameter_group ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?description:(description_ : string_ option) () =
  ({ parameter_group_name = parameter_group_name_; description = description_ } : parameter_group)

let make_update_parameter_group_response
    ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : update_parameter_group_response)

let make_parameter_name_value ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_value:(parameter_value_ : string_ option) () =
  ({ parameter_name = parameter_name_; parameter_value = parameter_value_ } : parameter_name_value)

let make_update_parameter_group_request ~parameter_group_name:(parameter_group_name_ : string_)
    ~parameter_name_values:(parameter_name_values_ : parameter_name_value_list) () =
  ({ parameter_group_name = parameter_group_name_; parameter_name_values = parameter_name_values_ }
    : update_parameter_group_request)

let make_sse_description ?status:(status_ : sse_status option) () =
  ({ status = status_ } : sse_description)

let make_parameter_group_status ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?parameter_apply_status:(parameter_apply_status_ : string_ option)
    ?node_ids_to_reboot:(node_ids_to_reboot_ : node_identifier_list option) () =
  ({
     parameter_group_name = parameter_group_name_;
     parameter_apply_status = parameter_apply_status_;
     node_ids_to_reboot = node_ids_to_reboot_;
   }
    : parameter_group_status)

let make_security_group_membership
    ?security_group_identifier:(security_group_identifier_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ security_group_identifier = security_group_identifier_; status = status_ }
    : security_group_membership)

let make_notification_configuration ?topic_arn:(topic_arn_ : string_ option)
    ?topic_status:(topic_status_ : string_ option) () =
  ({ topic_arn = topic_arn_; topic_status = topic_status_ } : notification_configuration)

let make_endpoint ?address:(address_ : string_ option) ?port:(port_ : integer option)
    ?ur_l:(ur_l_ : string_ option) () =
  ({ address = address_; port = port_; ur_l = ur_l_ } : endpoint)

let make_node ?node_id:(node_id_ : string_ option) ?endpoint:(endpoint_ : endpoint option)
    ?node_create_time:(node_create_time_ : t_stamp option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?node_status:(node_status_ : string_ option)
    ?parameter_group_status:(parameter_group_status_ : string_ option) () =
  ({
     node_id = node_id_;
     endpoint = endpoint_;
     node_create_time = node_create_time_;
     availability_zone = availability_zone_;
     node_status = node_status_;
     parameter_group_status = parameter_group_status_;
   }
    : node)

let make_cluster ?cluster_name:(cluster_name_ : string_ option)
    ?description:(description_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?total_nodes:(total_nodes_ : integer_optional option)
    ?active_nodes:(active_nodes_ : integer_optional option) ?node_type:(node_type_ : string_ option)
    ?status:(status_ : string_ option)
    ?cluster_discovery_endpoint:(cluster_discovery_endpoint_ : endpoint option)
    ?node_ids_to_remove:(node_ids_to_remove_ : node_identifier_list option)
    ?nodes:(nodes_ : node_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?subnet_group:(subnet_group_ : string_ option)
    ?security_groups:(security_groups_ : security_group_membership_list option)
    ?iam_role_arn:(iam_role_arn_ : string_ option)
    ?parameter_group:(parameter_group_ : parameter_group_status option)
    ?sse_description:(sse_description_ : sse_description option)
    ?cluster_endpoint_encryption_type:
      (cluster_endpoint_encryption_type_ : cluster_endpoint_encryption_type option)
    ?network_type:(network_type_ : network_type option) () =
  ({
     cluster_name = cluster_name_;
     description = description_;
     cluster_arn = cluster_arn_;
     total_nodes = total_nodes_;
     active_nodes = active_nodes_;
     node_type = node_type_;
     status = status_;
     cluster_discovery_endpoint = cluster_discovery_endpoint_;
     node_ids_to_remove = node_ids_to_remove_;
     nodes = nodes_;
     preferred_maintenance_window = preferred_maintenance_window_;
     notification_configuration = notification_configuration_;
     subnet_group = subnet_group_;
     security_groups = security_groups_;
     iam_role_arn = iam_role_arn_;
     parameter_group = parameter_group_;
     sse_description = sse_description_;
     cluster_endpoint_encryption_type = cluster_endpoint_encryption_type_;
     network_type = network_type_;
   }
    : cluster)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_update_cluster_request ?description:(description_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?notification_topic_status:(notification_topic_status_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_identifier_list option)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     cluster_name = cluster_name_;
     description = description_;
     preferred_maintenance_window = preferred_maintenance_window_;
     notification_topic_arn = notification_topic_arn_;
     notification_topic_status = notification_topic_status_;
     parameter_group_name = parameter_group_name_;
     security_group_ids = security_group_ids_;
   }
    : update_cluster_request)

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_untag_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : untag_resource_response)

let make_untag_resource_request ~resource_name:(resource_name_ : string_)
    ~tag_keys:(tag_keys_ : key_list) () =
  ({ resource_name = resource_name_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : tag_resource_response)

let make_tag_resource_request ~resource_name:(resource_name_ : string_) ~tags:(tags_ : tag_list) ()
    =
  ({ resource_name = resource_name_; tags = tags_ } : tag_resource_request)

let make_reboot_node_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : reboot_node_response)

let make_reboot_node_request ~cluster_name:(cluster_name_ : string_) ~node_id:(node_id_ : string_)
    () =
  ({ cluster_name = cluster_name_; node_id = node_id_ } : reboot_node_request)

let make_list_tags_response ?tags:(tags_ : tag_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ tags = tags_; next_token = next_token_ } : list_tags_response)

let make_list_tags_request ?next_token:(next_token_ : string_ option)
    ~resource_name:(resource_name_ : string_) () =
  ({ resource_name = resource_name_; next_token = next_token_ } : list_tags_request)

let make_increase_replication_factor_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : increase_replication_factor_response)

let make_increase_replication_factor_request
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ~cluster_name:(cluster_name_ : string_)
    ~new_replication_factor:(new_replication_factor_ : integer) () =
  ({
     cluster_name = cluster_name_;
     new_replication_factor = new_replication_factor_;
     availability_zones = availability_zones_;
   }
    : increase_replication_factor_request)

let make_describe_subnet_groups_response ?next_token:(next_token_ : string_ option)
    ?subnet_groups:(subnet_groups_ : subnet_group_list option) () =
  ({ next_token = next_token_; subnet_groups = subnet_groups_ } : describe_subnet_groups_response)

let make_describe_subnet_groups_request
    ?subnet_group_names:(subnet_group_names_ : subnet_group_name_list option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     subnet_group_names = subnet_group_names_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_subnet_groups_request)

let make_node_type_specific_value ?node_type:(node_type_ : string_ option)
    ?value:(value_ : string_ option) () =
  ({ node_type = node_type_; value = value_ } : node_type_specific_value)

let make_parameter ?parameter_name:(parameter_name_ : string_ option)
    ?parameter_type:(parameter_type_ : parameter_type option)
    ?parameter_value:(parameter_value_ : string_ option)
    ?node_type_specific_values:(node_type_specific_values_ : node_type_specific_value_list option)
    ?description:(description_ : string_ option) ?source:(source_ : string_ option)
    ?data_type:(data_type_ : string_ option) ?allowed_values:(allowed_values_ : string_ option)
    ?is_modifiable:(is_modifiable_ : is_modifiable option)
    ?change_type:(change_type_ : change_type option) () =
  ({
     parameter_name = parameter_name_;
     parameter_type = parameter_type_;
     parameter_value = parameter_value_;
     node_type_specific_values = node_type_specific_values_;
     description = description_;
     source = source_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     is_modifiable = is_modifiable_;
     change_type = change_type_;
   }
    : parameter)

let make_describe_parameters_response ?next_token:(next_token_ : string_ option)
    ?parameters:(parameters_ : parameter_list option) () =
  ({ next_token = next_token_; parameters = parameters_ } : describe_parameters_response)

let make_describe_parameters_request ?source:(source_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     parameter_group_name = parameter_group_name_;
     source = source_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_parameters_request)

let make_describe_parameter_groups_response ?next_token:(next_token_ : string_ option)
    ?parameter_groups:(parameter_groups_ : parameter_group_list option) () =
  ({ next_token = next_token_; parameter_groups = parameter_groups_ }
    : describe_parameter_groups_response)

let make_describe_parameter_groups_request
    ?parameter_group_names:(parameter_group_names_ : parameter_group_name_list option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     parameter_group_names = parameter_group_names_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_parameter_groups_request)

let make_event ?source_name:(source_name_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?message:(message_ : string_ option)
    ?date:(date_ : t_stamp option) () =
  ({ source_name = source_name_; source_type = source_type_; message = message_; date = date_ }
    : event)

let make_describe_events_response ?next_token:(next_token_ : string_ option)
    ?events:(events_ : event_list option) () =
  ({ next_token = next_token_; events = events_ } : describe_events_response)

let make_describe_events_request ?source_name:(source_name_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?start_time:(start_time_ : t_stamp option)
    ?end_time:(end_time_ : t_stamp option) ?duration:(duration_ : integer_optional option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     source_name = source_name_;
     source_type = source_type_;
     start_time = start_time_;
     end_time = end_time_;
     duration = duration_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_events_request)

let make_describe_default_parameters_response ?next_token:(next_token_ : string_ option)
    ?parameters:(parameters_ : parameter_list option) () =
  ({ next_token = next_token_; parameters = parameters_ } : describe_default_parameters_response)

let make_describe_default_parameters_request ?max_results:(max_results_ : integer_optional option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_default_parameters_request)

let make_describe_clusters_response ?next_token:(next_token_ : string_ option)
    ?clusters:(clusters_ : cluster_list option) () =
  ({ next_token = next_token_; clusters = clusters_ } : describe_clusters_response)

let make_describe_clusters_request ?cluster_names:(cluster_names_ : cluster_name_list option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ cluster_names = cluster_names_; max_results = max_results_; next_token = next_token_ }
    : describe_clusters_request)

let make_delete_subnet_group_response ?deletion_message:(deletion_message_ : string_ option) () =
  ({ deletion_message = deletion_message_ } : delete_subnet_group_response)

let make_delete_subnet_group_request ~subnet_group_name:(subnet_group_name_ : string_) () =
  ({ subnet_group_name = subnet_group_name_ } : delete_subnet_group_request)

let make_delete_parameter_group_response ?deletion_message:(deletion_message_ : string_ option) () =
  ({ deletion_message = deletion_message_ } : delete_parameter_group_response)

let make_delete_parameter_group_request ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({ parameter_group_name = parameter_group_name_ } : delete_parameter_group_request)

let make_delete_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : delete_cluster_response)

let make_delete_cluster_request ~cluster_name:(cluster_name_ : string_) () =
  ({ cluster_name = cluster_name_ } : delete_cluster_request)

let make_decrease_replication_factor_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : decrease_replication_factor_response)

let make_decrease_replication_factor_request
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?node_ids_to_remove:(node_ids_to_remove_ : node_identifier_list option)
    ~cluster_name:(cluster_name_ : string_)
    ~new_replication_factor:(new_replication_factor_ : integer) () =
  ({
     cluster_name = cluster_name_;
     new_replication_factor = new_replication_factor_;
     availability_zones = availability_zones_;
     node_ids_to_remove = node_ids_to_remove_;
   }
    : decrease_replication_factor_request)

let make_create_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : create_subnet_group_response)

let make_create_subnet_group_request ?description:(description_ : string_ option)
    ~subnet_group_name:(subnet_group_name_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({ subnet_group_name = subnet_group_name_; description = description_; subnet_ids = subnet_ids_ }
    : create_subnet_group_request)

let make_create_parameter_group_response
    ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : create_parameter_group_response)

let make_create_parameter_group_request ?description:(description_ : string_ option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({ parameter_group_name = parameter_group_name_; description = description_ }
    : create_parameter_group_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_sse_specification ~enabled:(enabled_ : sse_enabled) () =
  ({ enabled = enabled_ } : sse_specification)

let make_create_cluster_request ?description:(description_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_identifier_list option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option) ?tags:(tags_ : tag_list option)
    ?sse_specification:(sse_specification_ : sse_specification option)
    ?cluster_endpoint_encryption_type:
      (cluster_endpoint_encryption_type_ : cluster_endpoint_encryption_type option)
    ?network_type:(network_type_ : network_type option) ~cluster_name:(cluster_name_ : string_)
    ~node_type:(node_type_ : string_) ~replication_factor:(replication_factor_ : integer)
    ~iam_role_arn:(iam_role_arn_ : string_) () =
  ({
     cluster_name = cluster_name_;
     node_type = node_type_;
     description = description_;
     replication_factor = replication_factor_;
     availability_zones = availability_zones_;
     subnet_group_name = subnet_group_name_;
     security_group_ids = security_group_ids_;
     preferred_maintenance_window = preferred_maintenance_window_;
     notification_topic_arn = notification_topic_arn_;
     iam_role_arn = iam_role_arn_;
     parameter_group_name = parameter_group_name_;
     tags = tags_;
     sse_specification = sse_specification_;
     cluster_endpoint_encryption_type = cluster_endpoint_encryption_type_;
     network_type = network_type_;
   }
    : create_cluster_request)
