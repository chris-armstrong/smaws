open Types

let make_authentication ?password_count:(password_count_ : integer_optional option)
    ?type_:(type__ : authentication_type option) () =
  ({ password_count = password_count_; type_ = type__ } : authentication)

let make_user ?ar_n:(ar_n_ : string_ option)
    ?authentication:(authentication_ : authentication option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?acl_names:(acl_names_ : acl_name_list option) ?access_string:(access_string_ : string_ option)
    ?status:(status_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     ar_n = ar_n_;
     authentication = authentication_;
     minimum_engine_version = minimum_engine_version_;
     acl_names = acl_names_;
     access_string = access_string_;
     status = status_;
     name = name_;
   }
    : user)

let make_update_user_response ?user:(user_ : user option) () =
  ({ user = user_ } : update_user_response)

let make_authentication_mode ?passwords:(passwords_ : password_list_input option)
    ?type_:(type__ : input_authentication_type option) () =
  ({ passwords = passwords_; type_ = type__ } : authentication_mode)

let make_update_user_request ?access_string:(access_string_ : access_string option)
    ?authentication_mode:(authentication_mode_ : authentication_mode option)
    ~user_name:(user_name_ : user_name) () =
  ({
     access_string = access_string_;
     authentication_mode = authentication_mode_;
     user_name = user_name_;
   }
    : update_user_request)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?supported_network_types:(supported_network_types_ : network_type_list option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?identifier:(identifier_ : string_ option) () =
  ({
     supported_network_types = supported_network_types_;
     availability_zone = availability_zone_;
     identifier = identifier_;
   }
    : subnet)

let make_subnet_group ?supported_network_types:(supported_network_types_ : network_type_list option)
    ?ar_n:(ar_n_ : string_ option) ?subnets:(subnets_ : subnet_list option)
    ?vpc_id:(vpc_id_ : string_ option) ?description:(description_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     supported_network_types = supported_network_types_;
     ar_n = ar_n_;
     subnets = subnets_;
     vpc_id = vpc_id_;
     description = description_;
     name = name_;
   }
    : subnet_group)

let make_update_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : update_subnet_group_response)

let make_update_subnet_group_request ?subnet_ids:(subnet_ids_ : subnet_identifier_list option)
    ?description:(description_ : string_ option) ~subnet_group_name:(subnet_group_name_ : string_)
    () =
  ({ subnet_ids = subnet_ids_; description = description_; subnet_group_name = subnet_group_name_ }
    : update_subnet_group_request)

let make_parameter_group ?ar_n:(ar_n_ : string_ option) ?description:(description_ : string_ option)
    ?family:(family_ : string_ option) ?name:(name_ : string_ option) () =
  ({ ar_n = ar_n_; description = description_; family = family_; name = name_ } : parameter_group)

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

let make_regional_cluster ?ar_n:(ar_n_ : string_ option) ?status:(status_ : string_ option)
    ?region:(region_ : string_ option) ?cluster_name:(cluster_name_ : string_ option) () =
  ({ ar_n = ar_n_; status = status_; region = region_; cluster_name = cluster_name_ }
    : regional_cluster)

let make_multi_region_cluster ?ar_n:(ar_n_ : string_ option)
    ?tls_enabled:(tls_enabled_ : boolean_optional option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?clusters:(clusters_ : regional_cluster_list option)
    ?number_of_shards:(number_of_shards_ : integer_optional option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?status:(status_ : string_ option)
    ?description:(description_ : string_ option)
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option) () =
  ({
     ar_n = ar_n_;
     tls_enabled = tls_enabled_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     clusters = clusters_;
     number_of_shards = number_of_shards_;
     engine_version = engine_version_;
     engine = engine_;
     node_type = node_type_;
     status = status_;
     description = description_;
     multi_region_cluster_name = multi_region_cluster_name_;
   }
    : multi_region_cluster)

let make_update_multi_region_cluster_response
    ?multi_region_cluster:(multi_region_cluster_ : multi_region_cluster option) () =
  ({ multi_region_cluster = multi_region_cluster_ } : update_multi_region_cluster_response)

let make_shard_configuration_request ?shard_count:(shard_count_ : integer option) () =
  ({ shard_count = shard_count_ } : shard_configuration_request)

let make_update_multi_region_cluster_request
    ?update_strategy:(update_strategy_ : update_strategy option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?shard_configuration:(shard_configuration_ : shard_configuration_request option)
    ?engine_version:(engine_version_ : string_ option) ?description:(description_ : string_ option)
    ?node_type:(node_type_ : string_ option)
    ~multi_region_cluster_name:(multi_region_cluster_name_ : string_) () =
  ({
     update_strategy = update_strategy_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     shard_configuration = shard_configuration_;
     engine_version = engine_version_;
     description = description_;
     node_type = node_type_;
     multi_region_cluster_name = multi_region_cluster_name_;
   }
    : update_multi_region_cluster_request)

let make_slot_migration ?progress_percentage:(progress_percentage_ : double option) () =
  ({ progress_percentage = progress_percentage_ } : slot_migration)

let make_resharding_status ?slot_migration:(slot_migration_ : slot_migration option) () =
  ({ slot_migration = slot_migration_ } : resharding_status)

let make_ac_ls_update_status ?acl_to_apply:(acl_to_apply_ : acl_name option) () =
  ({ acl_to_apply = acl_to_apply_ } : ac_ls_update_status)

let make_pending_modified_service_update ?status:(status_ : service_update_status option)
    ?service_update_name:(service_update_name_ : string_ option) () =
  ({ status = status_; service_update_name = service_update_name_ }
    : pending_modified_service_update)

let make_cluster_pending_updates
    ?service_updates:(service_updates_ : pending_modified_service_update_list option)
    ?ac_ls:(ac_ls_ : ac_ls_update_status option)
    ?resharding:(resharding_ : resharding_status option) () =
  ({ service_updates = service_updates_; ac_ls = ac_ls_; resharding = resharding_ }
    : cluster_pending_updates)

let make_endpoint ?port:(port_ : integer option) ?address:(address_ : string_ option) () =
  ({ port = port_; address = address_ } : endpoint)

let make_node ?endpoint:(endpoint_ : endpoint option) ?create_time:(create_time_ : t_stamp option)
    ?availability_zone:(availability_zone_ : string_ option) ?status:(status_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     endpoint = endpoint_;
     create_time = create_time_;
     availability_zone = availability_zone_;
     status = status_;
     name = name_;
   }
    : node)

let make_shard ?number_of_nodes:(number_of_nodes_ : integer_optional option)
    ?nodes:(nodes_ : node_list option) ?slots:(slots_ : string_ option)
    ?status:(status_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     number_of_nodes = number_of_nodes_;
     nodes = nodes_;
     slots = slots_;
     status = status_;
     name = name_;
   }
    : shard)

let make_security_group_membership ?status:(status_ : string_ option)
    ?security_group_id:(security_group_id_ : string_ option) () =
  ({ status = status_; security_group_id = security_group_id_ } : security_group_membership)

let make_cluster ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?network_type:(network_type_ : network_type option)
    ?data_tiering:(data_tiering_ : data_tiering_status option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?acl_name:(acl_name_ : acl_name option) ?snapshot_window:(snapshot_window_ : string_ option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?sns_topic_status:(sns_topic_status_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option) ?ar_n:(ar_n_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tls_enabled:(tls_enabled_ : boolean_optional option)
    ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?security_groups:(security_groups_ : security_group_membership_list option)
    ?parameter_group_status:(parameter_group_status_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?engine_patch_version:(engine_patch_version_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?cluster_endpoint:(cluster_endpoint_ : endpoint option)
    ?availability_mode:(availability_mode_ : az_status option) ?shards:(shards_ : shard_list option)
    ?number_of_shards:(number_of_shards_ : integer_optional option)
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ?pending_updates:(pending_updates_ : cluster_pending_updates option)
    ?status:(status_ : string_ option) ?description:(description_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     ip_discovery = ip_discovery_;
     network_type = network_type_;
     data_tiering = data_tiering_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     acl_name = acl_name_;
     snapshot_window = snapshot_window_;
     maintenance_window = maintenance_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     sns_topic_status = sns_topic_status_;
     sns_topic_arn = sns_topic_arn_;
     ar_n = ar_n_;
     kms_key_id = kms_key_id_;
     tls_enabled = tls_enabled_;
     subnet_group_name = subnet_group_name_;
     security_groups = security_groups_;
     parameter_group_status = parameter_group_status_;
     parameter_group_name = parameter_group_name_;
     engine_patch_version = engine_patch_version_;
     engine_version = engine_version_;
     engine = engine_;
     node_type = node_type_;
     cluster_endpoint = cluster_endpoint_;
     availability_mode = availability_mode_;
     shards = shards_;
     number_of_shards = number_of_shards_;
     multi_region_cluster_name = multi_region_cluster_name_;
     pending_updates = pending_updates_;
     status = status_;
     description = description_;
     name = name_;
   }
    : cluster)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_replica_configuration_request ?replica_count:(replica_count_ : integer option) () =
  ({ replica_count = replica_count_ } : replica_configuration_request)

let make_update_cluster_request ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?acl_name:(acl_name_ : acl_name option)
    ?shard_configuration:(shard_configuration_ : shard_configuration_request option)
    ?replica_configuration:(replica_configuration_ : replica_configuration_request option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?node_type:(node_type_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?sns_topic_status:(sns_topic_status_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?description:(description_ : string_ option) ~cluster_name:(cluster_name_ : string_) () =
  ({
     ip_discovery = ip_discovery_;
     acl_name = acl_name_;
     shard_configuration = shard_configuration_;
     replica_configuration = replica_configuration_;
     engine_version = engine_version_;
     engine = engine_;
     node_type = node_type_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     parameter_group_name = parameter_group_name_;
     sns_topic_status = sns_topic_status_;
     sns_topic_arn = sns_topic_arn_;
     maintenance_window = maintenance_window_;
     security_group_ids = security_group_ids_;
     description = description_;
     cluster_name = cluster_name_;
   }
    : update_cluster_request)

let make_acl_pending_changes ?user_names_to_add:(user_names_to_add_ : user_name_list option)
    ?user_names_to_remove:(user_names_to_remove_ : user_name_list option) () =
  ({ user_names_to_add = user_names_to_add_; user_names_to_remove = user_names_to_remove_ }
    : acl_pending_changes)

let make_ac_l ?ar_n:(ar_n_ : string_ option) ?clusters:(clusters_ : acl_cluster_name_list option)
    ?pending_changes:(pending_changes_ : acl_pending_changes option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?user_names:(user_names_ : user_name_list option) ?status:(status_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     ar_n = ar_n_;
     clusters = clusters_;
     pending_changes = pending_changes_;
     minimum_engine_version = minimum_engine_version_;
     user_names = user_names_;
     status = status_;
     name = name_;
   }
    : ac_l)

let make_update_acl_response ?ac_l:(ac_l_ : ac_l option) () =
  ({ ac_l = ac_l_ } : update_acl_response)

let make_update_acl_request
    ?user_names_to_remove:(user_names_to_remove_ : user_name_list_input option)
    ?user_names_to_add:(user_names_to_add_ : user_name_list_input option)
    ~acl_name:(acl_name_ : string_) () =
  ({
     user_names_to_remove = user_names_to_remove_;
     user_names_to_add = user_names_to_add_;
     acl_name = acl_name_;
   }
    : update_acl_request)

let make_tag ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : tag)

let make_untag_resource_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : untag_resource_response)

let make_untag_resource_request ~tag_keys:(tag_keys_ : key_list)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_unprocessed_cluster ?error_message:(error_message_ : string_ option)
    ?error_type:(error_type_ : string_ option) ?cluster_name:(cluster_name_ : string_ option) () =
  ({ error_message = error_message_; error_type = error_type_; cluster_name = cluster_name_ }
    : unprocessed_cluster)

let make_tag_resource_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : tag_resource_response)

let make_tag_resource_request ~tags:(tags_ : tag_list) ~resource_arn:(resource_arn_ : string_) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_shard_configuration ?replica_count:(replica_count_ : integer_optional option)
    ?slots:(slots_ : string_ option) () =
  ({ replica_count = replica_count_; slots = slots_ } : shard_configuration)

let make_shard_detail ?snapshot_creation_time:(snapshot_creation_time_ : t_stamp option)
    ?size:(size_ : string_ option) ?configuration:(configuration_ : shard_configuration option)
    ?name:(name_ : string_ option) () =
  ({
     snapshot_creation_time = snapshot_creation_time_;
     size = size_;
     configuration = configuration_;
     name = name_;
   }
    : shard_detail)

let make_cluster_configuration
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?shards:(shards_ : shard_details option) ?num_shards:(num_shards_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?vpc_id:(vpc_id_ : string_ option) ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?port:(port_ : integer_optional option) ?topic_arn:(topic_arn_ : string_ option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?description:(description_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     multi_region_cluster_name = multi_region_cluster_name_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     shards = shards_;
     num_shards = num_shards_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     vpc_id = vpc_id_;
     subnet_group_name = subnet_group_name_;
     parameter_group_name = parameter_group_name_;
     port = port_;
     topic_arn = topic_arn_;
     maintenance_window = maintenance_window_;
     engine_version = engine_version_;
     engine = engine_;
     node_type = node_type_;
     description = description_;
     name = name_;
   }
    : cluster_configuration)

let make_snapshot ?data_tiering:(data_tiering_ : data_tiering_status option)
    ?cluster_configuration:(cluster_configuration_ : cluster_configuration option)
    ?ar_n:(ar_n_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?source:(source_ : string_ option) ?status:(status_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     data_tiering = data_tiering_;
     cluster_configuration = cluster_configuration_;
     ar_n = ar_n_;
     kms_key_id = kms_key_id_;
     source = source_;
     status = status_;
     name = name_;
   }
    : snapshot)

let make_service_update_request
    ?service_update_name_to_apply:(service_update_name_to_apply_ : string_ option) () =
  ({ service_update_name_to_apply = service_update_name_to_apply_ } : service_update_request)

let make_service_update ?auto_update_start_date:(auto_update_start_date_ : t_stamp option)
    ?nodes_updated:(nodes_updated_ : string_ option) ?engine:(engine_ : string_ option)
    ?type_:(type__ : service_update_type option) ?status:(status_ : service_update_status option)
    ?description:(description_ : string_ option) ?release_date:(release_date_ : t_stamp option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?cluster_name:(cluster_name_ : string_ option) () =
  ({
     auto_update_start_date = auto_update_start_date_;
     nodes_updated = nodes_updated_;
     engine = engine_;
     type_ = type__;
     status = status_;
     description = description_;
     release_date = release_date_;
     service_update_name = service_update_name_;
     cluster_name = cluster_name_;
   }
    : service_update)

let make_reset_parameter_group_response ?parameter_group:(parameter_group_ : parameter_group option)
    () =
  ({ parameter_group = parameter_group_ } : reset_parameter_group_response)

let make_reset_parameter_group_request
    ?parameter_names:(parameter_names_ : parameter_name_list option)
    ?all_parameters:(all_parameters_ : boolean_ option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     parameter_names = parameter_names_;
     all_parameters = all_parameters_;
     parameter_group_name = parameter_group_name_;
   }
    : reset_parameter_group_request)

let make_recurring_charge ?recurring_charge_frequency:(recurring_charge_frequency_ : string_ option)
    ?recurring_charge_amount:(recurring_charge_amount_ : double option) () =
  ({
     recurring_charge_frequency = recurring_charge_frequency_;
     recurring_charge_amount = recurring_charge_amount_;
   }
    : recurring_charge)

let make_reserved_nodes_offering
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?offering_type:(offering_type_ : string_ option) ?fixed_price:(fixed_price_ : double option)
    ?duration:(duration_ : integer option) ?node_type:(node_type_ : string_ option)
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option) () =
  ({
     recurring_charges = recurring_charges_;
     offering_type = offering_type_;
     fixed_price = fixed_price_;
     duration = duration_;
     node_type = node_type_;
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
   }
    : reserved_nodes_offering)

let make_reserved_node ?ar_n:(ar_n_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?state:(state_ : string_ option) ?offering_type:(offering_type_ : string_ option)
    ?node_count:(node_count_ : integer option) ?fixed_price:(fixed_price_ : double option)
    ?duration:(duration_ : integer option) ?start_time:(start_time_ : t_stamp option)
    ?node_type:(node_type_ : string_ option)
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option)
    ?reservation_id:(reservation_id_ : string_ option) () =
  ({
     ar_n = ar_n_;
     recurring_charges = recurring_charges_;
     state = state_;
     offering_type = offering_type_;
     node_count = node_count_;
     fixed_price = fixed_price_;
     duration = duration_;
     start_time = start_time_;
     node_type = node_type_;
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
     reservation_id = reservation_id_;
   }
    : reserved_node)

let make_purchase_reserved_nodes_offering_response
    ?reserved_node:(reserved_node_ : reserved_node option) () =
  ({ reserved_node = reserved_node_ } : purchase_reserved_nodes_offering_response)

let make_purchase_reserved_nodes_offering_request ?tags:(tags_ : tag_list option)
    ?node_count:(node_count_ : integer_optional option)
    ?reservation_id:(reservation_id_ : string_ option)
    ~reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_) () =
  ({
     tags = tags_;
     node_count = node_count_;
     reservation_id = reservation_id_;
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
   }
    : purchase_reserved_nodes_offering_request)

let make_parameter ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?description:(description_ : string_ option) ?value:(value_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     minimum_engine_version = minimum_engine_version_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     description = description_;
     value = value_;
     name = name_;
   }
    : parameter)

let make_multi_region_parameter ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?source:(source_ : string_ option) ?description:(description_ : string_ option)
    ?value:(value_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     minimum_engine_version = minimum_engine_version_;
     allowed_values = allowed_values_;
     data_type = data_type_;
     source = source_;
     description = description_;
     value = value_;
     name = name_;
   }
    : multi_region_parameter)

let make_multi_region_parameter_group ?ar_n:(ar_n_ : string_ option)
    ?description:(description_ : string_ option) ?family:(family_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ ar_n = ar_n_; description = description_; family = family_; name = name_ }
    : multi_region_parameter_group)

let make_list_tags_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_response)

let make_list_tags_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : list_tags_request)

let make_list_allowed_node_type_updates_response
    ?scale_down_node_types:(scale_down_node_types_ : node_type_list option)
    ?scale_up_node_types:(scale_up_node_types_ : node_type_list option) () =
  ({ scale_down_node_types = scale_down_node_types_; scale_up_node_types = scale_up_node_types_ }
    : list_allowed_node_type_updates_response)

let make_list_allowed_node_type_updates_request ~cluster_name:(cluster_name_ : string_) () =
  ({ cluster_name = cluster_name_ } : list_allowed_node_type_updates_request)

let make_list_allowed_multi_region_cluster_updates_response
    ?scale_down_node_types:(scale_down_node_types_ : node_type_list option)
    ?scale_up_node_types:(scale_up_node_types_ : node_type_list option) () =
  ({ scale_down_node_types = scale_down_node_types_; scale_up_node_types = scale_up_node_types_ }
    : list_allowed_multi_region_cluster_updates_response)

let make_list_allowed_multi_region_cluster_updates_request
    ~multi_region_cluster_name:(multi_region_cluster_name_ : string_) () =
  ({ multi_region_cluster_name = multi_region_cluster_name_ }
    : list_allowed_multi_region_cluster_updates_request)

let make_filter ~values:(values_ : filter_value_list) ~name:(name_ : filter_name) () =
  ({ values = values_; name = name_ } : filter)

let make_failover_shard_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : failover_shard_response)

let make_failover_shard_request ~shard_name:(shard_name_ : string_)
    ~cluster_name:(cluster_name_ : string_) () =
  ({ shard_name = shard_name_; cluster_name = cluster_name_ } : failover_shard_request)

let make_event ?date:(date_ : t_stamp option) ?message:(message_ : string_ option)
    ?source_type:(source_type_ : source_type option) ?source_name:(source_name_ : string_ option) ()
    =
  ({ date = date_; message = message_; source_type = source_type_; source_name = source_name_ }
    : event)

let make_engine_version_info ?parameter_group_family:(parameter_group_family_ : string_ option)
    ?engine_patch_version:(engine_patch_version_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     parameter_group_family = parameter_group_family_;
     engine_patch_version = engine_patch_version_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : engine_version_info)

let make_describe_users_response ?next_token:(next_token_ : string_ option)
    ?users:(users_ : user_list option) () =
  ({ next_token = next_token_; users = users_ } : describe_users_response)

let make_describe_users_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?filters:(filters_ : filter_list option)
    ?user_name:(user_name_ : user_name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     user_name = user_name_;
   }
    : describe_users_request)

let make_describe_subnet_groups_response ?subnet_groups:(subnet_groups_ : subnet_group_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ subnet_groups = subnet_groups_; next_token = next_token_ } : describe_subnet_groups_response)

let make_describe_subnet_groups_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?subnet_group_name:(subnet_group_name_ : string_ option) () =
  ({ next_token = next_token_; max_results = max_results_; subnet_group_name = subnet_group_name_ }
    : describe_subnet_groups_request)

let make_describe_snapshots_response ?snapshots:(snapshots_ : snapshot_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ snapshots = snapshots_; next_token = next_token_ } : describe_snapshots_response)

let make_describe_snapshots_request ?show_detail:(show_detail_ : boolean_optional option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    ?source:(source_ : string_ option) ?snapshot_name:(snapshot_name_ : string_ option)
    ?cluster_name:(cluster_name_ : string_ option) () =
  ({
     show_detail = show_detail_;
     max_results = max_results_;
     next_token = next_token_;
     source = source_;
     snapshot_name = snapshot_name_;
     cluster_name = cluster_name_;
   }
    : describe_snapshots_request)

let make_describe_service_updates_response
    ?service_updates:(service_updates_ : service_update_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ service_updates = service_updates_; next_token = next_token_ }
    : describe_service_updates_response)

let make_describe_service_updates_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?status:(status_ : service_update_status_list option)
    ?cluster_names:(cluster_names_ : cluster_name_list option)
    ?service_update_name:(service_update_name_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
     cluster_names = cluster_names_;
     service_update_name = service_update_name_;
   }
    : describe_service_updates_request)

let make_describe_reserved_nodes_response
    ?reserved_nodes:(reserved_nodes_ : reserved_node_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ reserved_nodes = reserved_nodes_; next_token = next_token_ }
    : describe_reserved_nodes_response)

let make_describe_reserved_nodes_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?offering_type:(offering_type_ : string_ option) ?duration:(duration_ : string_ option)
    ?node_type:(node_type_ : string_ option)
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option)
    ?reservation_id:(reservation_id_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     offering_type = offering_type_;
     duration = duration_;
     node_type = node_type_;
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
     reservation_id = reservation_id_;
   }
    : describe_reserved_nodes_request)

let make_describe_reserved_nodes_offerings_response
    ?reserved_nodes_offerings:(reserved_nodes_offerings_ : reserved_nodes_offering_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ reserved_nodes_offerings = reserved_nodes_offerings_; next_token = next_token_ }
    : describe_reserved_nodes_offerings_response)

let make_describe_reserved_nodes_offerings_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?offering_type:(offering_type_ : string_ option) ?duration:(duration_ : string_ option)
    ?node_type:(node_type_ : string_ option)
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     offering_type = offering_type_;
     duration = duration_;
     node_type = node_type_;
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
   }
    : describe_reserved_nodes_offerings_request)

let make_describe_parameters_response ?parameters:(parameters_ : parameters_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ parameters = parameters_; next_token = next_token_ } : describe_parameters_response)

let make_describe_parameters_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
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
    ?parameter_group_name:(parameter_group_name_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     parameter_group_name = parameter_group_name_;
   }
    : describe_parameter_groups_request)

let make_describe_multi_region_parameters_response
    ?multi_region_parameters:(multi_region_parameters_ : multi_region_parameters_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ multi_region_parameters = multi_region_parameters_; next_token = next_token_ }
    : describe_multi_region_parameters_response)

let make_describe_multi_region_parameters_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?source:(source_ : string_ option)
    ~multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     source = source_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
   }
    : describe_multi_region_parameters_request)

let make_describe_multi_region_parameter_groups_response
    ?multi_region_parameter_groups:
      (multi_region_parameter_groups_ : multi_region_parameter_group_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ multi_region_parameter_groups = multi_region_parameter_groups_; next_token = next_token_ }
    : describe_multi_region_parameter_groups_response)

let make_describe_multi_region_parameter_groups_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
   }
    : describe_multi_region_parameter_groups_request)

let make_describe_multi_region_clusters_response
    ?multi_region_clusters:(multi_region_clusters_ : multi_region_cluster_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ multi_region_clusters = multi_region_clusters_; next_token = next_token_ }
    : describe_multi_region_clusters_response)

let make_describe_multi_region_clusters_request
    ?show_cluster_details:(show_cluster_details_ : boolean_optional option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer_optional option)
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option) () =
  ({
     show_cluster_details = show_cluster_details_;
     next_token = next_token_;
     max_results = max_results_;
     multi_region_cluster_name = multi_region_cluster_name_;
   }
    : describe_multi_region_clusters_request)

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

let make_describe_engine_versions_response
    ?engine_versions:(engine_versions_ : engine_version_info_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ engine_versions = engine_versions_; next_token = next_token_ }
    : describe_engine_versions_response)

let make_describe_engine_versions_request ?default_only:(default_only_ : boolean_ option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer_optional option)
    ?parameter_group_family:(parameter_group_family_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option) () =
  ({
     default_only = default_only_;
     next_token = next_token_;
     max_results = max_results_;
     parameter_group_family = parameter_group_family_;
     engine_version = engine_version_;
     engine = engine_;
   }
    : describe_engine_versions_request)

let make_describe_clusters_response ?clusters:(clusters_ : cluster_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ clusters = clusters_; next_token = next_token_ } : describe_clusters_response)

let make_describe_clusters_request
    ?show_shard_details:(show_shard_details_ : boolean_optional option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer_optional option)
    ?cluster_name:(cluster_name_ : string_ option) () =
  ({
     show_shard_details = show_shard_details_;
     next_token = next_token_;
     max_results = max_results_;
     cluster_name = cluster_name_;
   }
    : describe_clusters_request)

let make_describe_ac_ls_response ?next_token:(next_token_ : string_ option)
    ?ac_ls:(ac_ls_ : acl_list option) () =
  ({ next_token = next_token_; ac_ls = ac_ls_ } : describe_ac_ls_response)

let make_describe_ac_ls_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?acl_name:(acl_name_ : string_ option) ()
    =
  ({ next_token = next_token_; max_results = max_results_; acl_name = acl_name_ }
    : describe_ac_ls_request)

let make_delete_user_response ?user:(user_ : user option) () =
  ({ user = user_ } : delete_user_response)

let make_delete_user_request ~user_name:(user_name_ : user_name) () =
  ({ user_name = user_name_ } : delete_user_request)

let make_delete_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : delete_subnet_group_response)

let make_delete_subnet_group_request ~subnet_group_name:(subnet_group_name_ : string_) () =
  ({ subnet_group_name = subnet_group_name_ } : delete_subnet_group_request)

let make_delete_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : delete_snapshot_response)

let make_delete_snapshot_request ~snapshot_name:(snapshot_name_ : string_) () =
  ({ snapshot_name = snapshot_name_ } : delete_snapshot_request)

let make_delete_parameter_group_response
    ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : delete_parameter_group_response)

let make_delete_parameter_group_request ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({ parameter_group_name = parameter_group_name_ } : delete_parameter_group_request)

let make_delete_multi_region_cluster_response
    ?multi_region_cluster:(multi_region_cluster_ : multi_region_cluster option) () =
  ({ multi_region_cluster = multi_region_cluster_ } : delete_multi_region_cluster_response)

let make_delete_multi_region_cluster_request
    ~multi_region_cluster_name:(multi_region_cluster_name_ : string_) () =
  ({ multi_region_cluster_name = multi_region_cluster_name_ } : delete_multi_region_cluster_request)

let make_delete_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : delete_cluster_response)

let make_delete_cluster_request ?final_snapshot_name:(final_snapshot_name_ : string_ option)
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     final_snapshot_name = final_snapshot_name_;
     multi_region_cluster_name = multi_region_cluster_name_;
     cluster_name = cluster_name_;
   }
    : delete_cluster_request)

let make_delete_acl_response ?ac_l:(ac_l_ : ac_l option) () =
  ({ ac_l = ac_l_ } : delete_acl_response)

let make_delete_acl_request ~acl_name:(acl_name_ : string_) () =
  ({ acl_name = acl_name_ } : delete_acl_request)

let make_create_user_response ?user:(user_ : user option) () =
  ({ user = user_ } : create_user_response)

let make_create_user_request ?tags:(tags_ : tag_list option)
    ~access_string:(access_string_ : access_string)
    ~authentication_mode:(authentication_mode_ : authentication_mode)
    ~user_name:(user_name_ : user_name) () =
  ({
     tags = tags_;
     access_string = access_string_;
     authentication_mode = authentication_mode_;
     user_name = user_name_;
   }
    : create_user_request)

let make_create_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : create_subnet_group_response)

let make_create_subnet_group_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : string_ option) ~subnet_ids:(subnet_ids_ : subnet_identifier_list)
    ~subnet_group_name:(subnet_group_name_ : string_) () =
  ({
     tags = tags_;
     subnet_ids = subnet_ids_;
     description = description_;
     subnet_group_name = subnet_group_name_;
   }
    : create_subnet_group_request)

let make_create_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : create_snapshot_response)

let make_create_snapshot_request ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_ option) ~snapshot_name:(snapshot_name_ : string_)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     tags = tags_;
     kms_key_id = kms_key_id_;
     snapshot_name = snapshot_name_;
     cluster_name = cluster_name_;
   }
    : create_snapshot_request)

let make_create_parameter_group_response
    ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : create_parameter_group_response)

let make_create_parameter_group_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : string_ option) ~family:(family_ : string_)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     tags = tags_;
     description = description_;
     family = family_;
     parameter_group_name = parameter_group_name_;
   }
    : create_parameter_group_request)

let make_create_multi_region_cluster_response
    ?multi_region_cluster:(multi_region_cluster_ : multi_region_cluster option) () =
  ({ multi_region_cluster = multi_region_cluster_ } : create_multi_region_cluster_response)

let make_create_multi_region_cluster_request ?tags:(tags_ : tag_list option)
    ?tls_enabled:(tls_enabled_ : boolean_optional option)
    ?num_shards:(num_shards_ : integer_optional option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?description:(description_ : string_ option) ~node_type:(node_type_ : string_)
    ~multi_region_cluster_name_suffix:(multi_region_cluster_name_suffix_ : string_) () =
  ({
     tags = tags_;
     tls_enabled = tls_enabled_;
     num_shards = num_shards_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     node_type = node_type_;
     engine_version = engine_version_;
     engine = engine_;
     description = description_;
     multi_region_cluster_name_suffix = multi_region_cluster_name_suffix_;
   }
    : create_multi_region_cluster_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_create_cluster_request ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ?network_type:(network_type_ : network_type option)
    ?data_tiering:(data_tiering_ : boolean_optional option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?engine_version:(engine_version_ : string_ option) ?engine:(engine_ : string_ option)
    ?snapshot_window:(snapshot_window_ : string_ option) ?tags:(tags_ : tag_list option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?snapshot_arns:(snapshot_arns_ : snapshot_arns_list option)
    ?kms_key_id:(kms_key_id_ : string_ option) ?tls_enabled:(tls_enabled_ : boolean_optional option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option) ?port:(port_ : integer_optional option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?num_replicas_per_shard:(num_replicas_per_shard_ : integer_optional option)
    ?num_shards:(num_shards_ : integer_optional option) ?description:(description_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ~acl_name:(acl_name_ : acl_name) ~node_type:(node_type_ : string_)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     ip_discovery = ip_discovery_;
     network_type = network_type_;
     data_tiering = data_tiering_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     engine_version = engine_version_;
     engine = engine_;
     acl_name = acl_name_;
     snapshot_window = snapshot_window_;
     tags = tags_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_name = snapshot_name_;
     snapshot_arns = snapshot_arns_;
     kms_key_id = kms_key_id_;
     tls_enabled = tls_enabled_;
     sns_topic_arn = sns_topic_arn_;
     port = port_;
     maintenance_window = maintenance_window_;
     security_group_ids = security_group_ids_;
     subnet_group_name = subnet_group_name_;
     num_replicas_per_shard = num_replicas_per_shard_;
     num_shards = num_shards_;
     description = description_;
     parameter_group_name = parameter_group_name_;
     multi_region_cluster_name = multi_region_cluster_name_;
     node_type = node_type_;
     cluster_name = cluster_name_;
   }
    : create_cluster_request)

let make_create_acl_response ?ac_l:(ac_l_ : ac_l option) () =
  ({ ac_l = ac_l_ } : create_acl_response)

let make_create_acl_request ?tags:(tags_ : tag_list option)
    ?user_names:(user_names_ : user_name_list_input option) ~acl_name:(acl_name_ : string_) () =
  ({ tags = tags_; user_names = user_names_; acl_name = acl_name_ } : create_acl_request)

let make_copy_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : copy_snapshot_response)

let make_copy_snapshot_request ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?target_bucket:(target_bucket_ : target_bucket option)
    ~target_snapshot_name:(target_snapshot_name_ : string_)
    ~source_snapshot_name:(source_snapshot_name_ : string_) () =
  ({
     tags = tags_;
     kms_key_id = kms_key_id_;
     target_bucket = target_bucket_;
     target_snapshot_name = target_snapshot_name_;
     source_snapshot_name = source_snapshot_name_;
   }
    : copy_snapshot_request)

let make_batch_update_cluster_response
    ?unprocessed_clusters:(unprocessed_clusters_ : unprocessed_cluster_list option)
    ?processed_clusters:(processed_clusters_ : cluster_list option) () =
  ({ unprocessed_clusters = unprocessed_clusters_; processed_clusters = processed_clusters_ }
    : batch_update_cluster_response)

let make_batch_update_cluster_request
    ?service_update:(service_update_ : service_update_request option)
    ~cluster_names:(cluster_names_ : cluster_name_list) () =
  ({ service_update = service_update_; cluster_names = cluster_names_ }
    : batch_update_cluster_request)
