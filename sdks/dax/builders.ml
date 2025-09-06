open Types

let make_subnet ?subnet_availability_zone:(subnet_availability_zone_ : string_ option)
    ?subnet_identifier:(subnet_identifier_ : string_ option) () =
  ({ subnet_availability_zone = subnet_availability_zone_; subnet_identifier = subnet_identifier_ }
    : subnet)

let make_subnet_group ?subnets:(subnets_ : subnet_list option) ?vpc_id:(vpc_id_ : string_ option)
    ?description:(description_ : string_ option)
    ?subnet_group_name:(subnet_group_name_ : string_ option) () =
  ({
     subnets = subnets_;
     vpc_id = vpc_id_;
     description = description_;
     subnet_group_name = subnet_group_name_;
   }
    : subnet_group)

let make_update_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : update_subnet_group_response)

let make_update_subnet_group_request ?subnet_ids:(subnet_ids_ : subnet_identifier_list option)
    ?description:(description_ : string_ option) ~subnet_group_name:(subnet_group_name_ : string_)
    () =
  ({ subnet_ids = subnet_ids_; description = description_; subnet_group_name = subnet_group_name_ }
    : update_subnet_group_request)

let make_parameter_group ?description:(description_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option) () =
  ({ description = description_; parameter_group_name = parameter_group_name_ } : parameter_group)

let make_update_parameter_group_response
    ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : update_parameter_group_response)

let make_parameter_name_value ?parameter_value:(parameter_value_ : string_ option)
    ?parameter_name:(parameter_name_ : string_ option) () =
  ({ parameter_value = parameter_value_; parameter_name = parameter_name_ } : parameter_name_value)

let make_update_parameter_group_request
    ~parameter_name_values:(parameter_name_values_ : parameter_name_value_list)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({ parameter_name_values = parameter_name_values_; parameter_group_name = parameter_group_name_ }
    : update_parameter_group_request)

let make_endpoint ?ur_l:(ur_l_ : string_ option) ?port:(port_ : integer option)
    ?address:(address_ : string_ option) () =
  ({ ur_l = ur_l_; port = port_; address = address_ } : endpoint)

let make_node ?parameter_group_status:(parameter_group_status_ : string_ option)
    ?node_status:(node_status_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?node_create_time:(node_create_time_ : t_stamp option) ?endpoint:(endpoint_ : endpoint option)
    ?node_id:(node_id_ : string_ option) () =
  ({
     parameter_group_status = parameter_group_status_;
     node_status = node_status_;
     availability_zone = availability_zone_;
     node_create_time = node_create_time_;
     endpoint = endpoint_;
     node_id = node_id_;
   }
    : node)

let make_notification_configuration ?topic_status:(topic_status_ : string_ option)
    ?topic_arn:(topic_arn_ : string_ option) () =
  ({ topic_status = topic_status_; topic_arn = topic_arn_ } : notification_configuration)

let make_security_group_membership ?status:(status_ : string_ option)
    ?security_group_identifier:(security_group_identifier_ : string_ option) () =
  ({ status = status_; security_group_identifier = security_group_identifier_ }
    : security_group_membership)

let make_parameter_group_status
    ?node_ids_to_reboot:(node_ids_to_reboot_ : node_identifier_list option)
    ?parameter_apply_status:(parameter_apply_status_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option) () =
  ({
     node_ids_to_reboot = node_ids_to_reboot_;
     parameter_apply_status = parameter_apply_status_;
     parameter_group_name = parameter_group_name_;
   }
    : parameter_group_status)

let make_sse_description ?status:(status_ : sse_status option) () =
  ({ status = status_ } : sse_description)

let make_cluster
    ?cluster_endpoint_encryption_type:
      (cluster_endpoint_encryption_type_ : cluster_endpoint_encryption_type option)
    ?sse_description:(sse_description_ : sse_description option)
    ?parameter_group:(parameter_group_ : parameter_group_status option)
    ?iam_role_arn:(iam_role_arn_ : string_ option)
    ?security_groups:(security_groups_ : security_group_membership_list option)
    ?subnet_group:(subnet_group_ : string_ option)
    ?notification_configuration:(notification_configuration_ : notification_configuration option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?nodes:(nodes_ : node_list option)
    ?node_ids_to_remove:(node_ids_to_remove_ : node_identifier_list option)
    ?cluster_discovery_endpoint:(cluster_discovery_endpoint_ : endpoint option)
    ?status:(status_ : string_ option) ?node_type:(node_type_ : string_ option)
    ?active_nodes:(active_nodes_ : integer_optional option)
    ?total_nodes:(total_nodes_ : integer_optional option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?description:(description_ : string_ option)
    ?cluster_name:(cluster_name_ : string_ option) () =
  ({
     cluster_endpoint_encryption_type = cluster_endpoint_encryption_type_;
     sse_description = sse_description_;
     parameter_group = parameter_group_;
     iam_role_arn = iam_role_arn_;
     security_groups = security_groups_;
     subnet_group = subnet_group_;
     notification_configuration = notification_configuration_;
     preferred_maintenance_window = preferred_maintenance_window_;
     nodes = nodes_;
     node_ids_to_remove = node_ids_to_remove_;
     cluster_discovery_endpoint = cluster_discovery_endpoint_;
     status = status_;
     node_type = node_type_;
     active_nodes = active_nodes_;
     total_nodes = total_nodes_;
     cluster_arn = cluster_arn_;
     description = description_;
     cluster_name = cluster_name_;
   }
    : cluster)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_update_cluster_request
    ?security_group_ids:(security_group_ids_ : security_group_identifier_list option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?notification_topic_status:(notification_topic_status_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?description:(description_ : string_ option) ~cluster_name:(cluster_name_ : string_) () =
  ({
     security_group_ids = security_group_ids_;
     parameter_group_name = parameter_group_name_;
     notification_topic_status = notification_topic_status_;
     notification_topic_arn = notification_topic_arn_;
     preferred_maintenance_window = preferred_maintenance_window_;
     description = description_;
     cluster_name = cluster_name_;
   }
    : update_cluster_request)

let make_tag ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : tag)

let make_untag_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : untag_resource_response)

let make_untag_resource_request ~tag_keys:(tag_keys_ : key_list)
    ~resource_name:(resource_name_ : string_) () =
  ({ tag_keys = tag_keys_; resource_name = resource_name_ } : untag_resource_request)

let make_tag_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : tag_resource_response)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_name:(resource_name_ : string_) ()
    =
  ({ tags = tags_; resource_name = resource_name_ } : tag_resource_request)

let make_sse_specification ~enabled:(enabled_ : sse_enabled) () =
  ({ enabled = enabled_ } : sse_specification)

let make_reboot_node_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : reboot_node_response)

let make_reboot_node_request ~node_id:(node_id_ : string_) ~cluster_name:(cluster_name_ : string_)
    () =
  ({ node_id = node_id_; cluster_name = cluster_name_ } : reboot_node_request)

let make_node_type_specific_value ?value:(value_ : string_ option)
    ?node_type:(node_type_ : string_ option) () =
  ({ value = value_; node_type = node_type_ } : node_type_specific_value)

let make_parameter ?change_type:(change_type_ : change_type option)
    ?is_modifiable:(is_modifiable_ : is_modifiable option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?source:(source_ : string_ option) ?description:(description_ : string_ option)
    ?node_type_specific_values:(node_type_specific_values_ : node_type_specific_value_list option)
    ?parameter_value:(parameter_value_ : string_ option)
    ?parameter_type:(parameter_type_ : parameter_type option)
    ?parameter_name:(parameter_name_ : string_ option) () =
  ({
     change_type = change_type_;
     is_modifiable = is_modifiable_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     source = source_;
     description = description_;
     node_type_specific_values = node_type_specific_values_;
     parameter_value = parameter_value_;
     parameter_type = parameter_type_;
     parameter_name = parameter_name_;
   }
    : parameter)

let make_list_tags_response ?next_token:(next_token_ : string_ option)
    ?tags:(tags_ : tag_list option) () =
  ({ next_token = next_token_; tags = tags_ } : list_tags_response)

let make_list_tags_request ?next_token:(next_token_ : string_ option)
    ~resource_name:(resource_name_ : string_) () =
  ({ next_token = next_token_; resource_name = resource_name_ } : list_tags_request)

let make_increase_replication_factor_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : increase_replication_factor_response)

let make_increase_replication_factor_request
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ~new_replication_factor:(new_replication_factor_ : integer)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     availability_zones = availability_zones_;
     new_replication_factor = new_replication_factor_;
     cluster_name = cluster_name_;
   }
    : increase_replication_factor_request)

let make_event ?date:(date_ : t_stamp option) ?message:(message_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?source_name:(source_name_ : string_ option) ()
    =
  ({ date = date_; message = message_; source_type = source_type_; source_name = source_name_ }
    : event)

let make_describe_subnet_groups_response ?subnet_groups:(subnet_groups_ : subnet_group_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ subnet_groups = subnet_groups_; next_token = next_token_ } : describe_subnet_groups_response)

let make_describe_subnet_groups_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?subnet_group_names:(subnet_group_names_ : subnet_group_name_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     subnet_group_names = subnet_group_names_;
   }
    : describe_subnet_groups_request)

let make_describe_parameters_response ?parameters:(parameters_ : parameter_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ parameters = parameters_; next_token = next_token_ } : describe_parameters_response)

let make_describe_parameters_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?source:(source_ : string_ option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     source = source_;
     parameter_group_name = parameter_group_name_;
   }
    : describe_parameters_request)

let make_describe_parameter_groups_response
    ?parameter_groups:(parameter_groups_ : parameter_group_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ parameter_groups = parameter_groups_; next_token = next_token_ }
    : describe_parameter_groups_response)

let make_describe_parameter_groups_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?parameter_group_names:(parameter_group_names_ : parameter_group_name_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     parameter_group_names = parameter_group_names_;
   }
    : describe_parameter_groups_request)

let make_describe_events_response ?events:(events_ : event_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ events = events_; next_token = next_token_ } : describe_events_response)

let make_describe_events_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?duration:(duration_ : integer_optional option) ?end_time:(end_time_ : t_stamp option)
    ?start_time:(start_time_ : t_stamp option) ?source_type:(source_type_ : source_type option)
    ?source_name:(source_name_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     duration = duration_;
     end_time = end_time_;
     start_time = start_time_;
     source_type = source_type_;
     source_name = source_name_;
   }
    : describe_events_request)

let make_describe_default_parameters_response ?parameters:(parameters_ : parameter_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ parameters = parameters_; next_token = next_token_ } : describe_default_parameters_response)

let make_describe_default_parameters_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_default_parameters_request)

let make_describe_clusters_response ?clusters:(clusters_ : cluster_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ clusters = clusters_; next_token = next_token_ } : describe_clusters_response)

let make_describe_clusters_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?cluster_names:(cluster_names_ : cluster_name_list option) () =
  ({ next_token = next_token_; max_results = max_results_; cluster_names = cluster_names_ }
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
    ?node_ids_to_remove:(node_ids_to_remove_ : node_identifier_list option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ~new_replication_factor:(new_replication_factor_ : integer)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     node_ids_to_remove = node_ids_to_remove_;
     availability_zones = availability_zones_;
     new_replication_factor = new_replication_factor_;
     cluster_name = cluster_name_;
   }
    : decrease_replication_factor_request)

let make_create_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : create_subnet_group_response)

let make_create_subnet_group_request ?description:(description_ : string_ option)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list)
    ~subnet_group_name:(subnet_group_name_ : string_) () =
  ({ subnet_ids = subnet_ids_; description = description_; subnet_group_name = subnet_group_name_ }
    : create_subnet_group_request)

let make_create_parameter_group_response
    ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : create_parameter_group_response)

let make_create_parameter_group_request ?description:(description_ : string_ option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({ description = description_; parameter_group_name = parameter_group_name_ }
    : create_parameter_group_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_create_cluster_request
    ?cluster_endpoint_encryption_type:
      (cluster_endpoint_encryption_type_ : cluster_endpoint_encryption_type option)
    ?sse_specification:(sse_specification_ : sse_specification option)
    ?tags:(tags_ : tag_list option) ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?notification_topic_arn:(notification_topic_arn_ : string_ option)
    ?preferred_maintenance_window:(preferred_maintenance_window_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_identifier_list option)
    ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?availability_zones:(availability_zones_ : availability_zone_list option)
    ?description:(description_ : string_ option) ~iam_role_arn:(iam_role_arn_ : string_)
    ~replication_factor:(replication_factor_ : integer) ~node_type:(node_type_ : string_)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     cluster_endpoint_encryption_type = cluster_endpoint_encryption_type_;
     sse_specification = sse_specification_;
     tags = tags_;
     parameter_group_name = parameter_group_name_;
     iam_role_arn = iam_role_arn_;
     notification_topic_arn = notification_topic_arn_;
     preferred_maintenance_window = preferred_maintenance_window_;
     security_group_ids = security_group_ids_;
     subnet_group_name = subnet_group_name_;
     availability_zones = availability_zones_;
     replication_factor = replication_factor_;
     description = description_;
     node_type = node_type_;
     cluster_name = cluster_name_;
   }
    : create_cluster_request)
