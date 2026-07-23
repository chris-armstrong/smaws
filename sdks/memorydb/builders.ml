open Types

let make_acl_pending_changes ?user_names_to_remove:(user_names_to_remove_ : user_name_list option)
    ?user_names_to_add:(user_names_to_add_ : user_name_list option) () =
  ({ user_names_to_remove = user_names_to_remove_; user_names_to_add = user_names_to_add_ }
    : acl_pending_changes)

let make_ac_l ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?user_names:(user_names_ : user_name_list option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?pending_changes:(pending_changes_ : acl_pending_changes option)
    ?clusters:(clusters_ : acl_cluster_name_list option) ?ar_n:(ar_n_ : string_ option) () =
  ({
     name = name_;
     status = status_;
     user_names = user_names_;
     minimum_engine_version = minimum_engine_version_;
     pending_changes = pending_changes_;
     clusters = clusters_;
     ar_n = ar_n_;
   }
    : ac_l)

let make_ac_ls_update_status ?acl_to_apply:(acl_to_apply_ : acl_name option) () =
  ({ acl_to_apply = acl_to_apply_ } : ac_ls_update_status)

let make_authentication ?type_:(type__ : authentication_type option)
    ?password_count:(password_count_ : integer_optional option) () =
  ({ type_ = type__; password_count = password_count_ } : authentication)

let make_user ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?access_string:(access_string_ : string_ option) ?acl_names:(acl_names_ : acl_name_list option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option)
    ?authentication:(authentication_ : authentication option) ?ar_n:(ar_n_ : string_ option) () =
  ({
     name = name_;
     status = status_;
     access_string = access_string_;
     acl_names = acl_names_;
     minimum_engine_version = minimum_engine_version_;
     authentication = authentication_;
     ar_n = ar_n_;
   }
    : user)

let make_update_user_response ?user:(user_ : user option) () =
  ({ user = user_ } : update_user_response)

let make_authentication_mode ?type_:(type__ : input_authentication_type option)
    ?passwords:(passwords_ : password_list_input option) () =
  ({ type_ = type__; passwords = passwords_ } : authentication_mode)

let make_update_user_request
    ?authentication_mode:(authentication_mode_ : authentication_mode option)
    ?access_string:(access_string_ : access_string option) ~user_name:(user_name_ : user_name) () =
  ({
     user_name = user_name_;
     authentication_mode = authentication_mode_;
     access_string = access_string_;
   }
    : update_user_request)

let make_availability_zone ?name:(name_ : string_ option) () =
  ({ name = name_ } : availability_zone)

let make_subnet ?identifier:(identifier_ : string_ option)
    ?availability_zone:(availability_zone_ : availability_zone option)
    ?supported_network_types:(supported_network_types_ : network_type_list option) () =
  ({
     identifier = identifier_;
     availability_zone = availability_zone_;
     supported_network_types = supported_network_types_;
   }
    : subnet)

let make_subnet_group ?name:(name_ : string_ option) ?description:(description_ : string_ option)
    ?vpc_id:(vpc_id_ : string_ option) ?subnets:(subnets_ : subnet_list option)
    ?ar_n:(ar_n_ : string_ option)
    ?supported_network_types:(supported_network_types_ : network_type_list option) () =
  ({
     name = name_;
     description = description_;
     vpc_id = vpc_id_;
     subnets = subnets_;
     ar_n = ar_n_;
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

let make_parameter_group ?name:(name_ : string_ option) ?family:(family_ : string_ option)
    ?description:(description_ : string_ option) ?ar_n:(ar_n_ : string_ option) () =
  ({ name = name_; family = family_; description = description_; ar_n = ar_n_ } : parameter_group)

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

let make_regional_cluster ?cluster_name:(cluster_name_ : string_ option)
    ?region:(region_ : string_ option) ?status:(status_ : string_ option)
    ?ar_n:(ar_n_ : string_ option) () =
  ({ cluster_name = cluster_name_; region = region_; status = status_; ar_n = ar_n_ }
    : regional_cluster)

let make_multi_region_cluster
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ?description:(description_ : string_ option) ?status:(status_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?number_of_shards:(number_of_shards_ : integer_optional option)
    ?clusters:(clusters_ : regional_cluster_list option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?tls_enabled:(tls_enabled_ : boolean_optional option) ?ar_n:(ar_n_ : string_ option) () =
  ({
     multi_region_cluster_name = multi_region_cluster_name_;
     description = description_;
     status = status_;
     node_type = node_type_;
     engine = engine_;
     engine_version = engine_version_;
     number_of_shards = number_of_shards_;
     clusters = clusters_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     tls_enabled = tls_enabled_;
     ar_n = ar_n_;
   }
    : multi_region_cluster)

let make_update_multi_region_cluster_response
    ?multi_region_cluster:(multi_region_cluster_ : multi_region_cluster option) () =
  ({ multi_region_cluster = multi_region_cluster_ } : update_multi_region_cluster_response)

let make_shard_configuration_request ?shard_count:(shard_count_ : integer option) () =
  ({ shard_count = shard_count_ } : shard_configuration_request)

let make_update_multi_region_cluster_request ?node_type:(node_type_ : string_ option)
    ?description:(description_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?shard_configuration:(shard_configuration_ : shard_configuration_request option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?update_strategy:(update_strategy_ : update_strategy option)
    ~multi_region_cluster_name:(multi_region_cluster_name_ : string_) () =
  ({
     multi_region_cluster_name = multi_region_cluster_name_;
     node_type = node_type_;
     description = description_;
     engine_version = engine_version_;
     shard_configuration = shard_configuration_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     update_strategy = update_strategy_;
   }
    : update_multi_region_cluster_request)

let make_security_group_membership ?security_group_id:(security_group_id_ : string_ option)
    ?status:(status_ : string_ option) () =
  ({ security_group_id = security_group_id_; status = status_ } : security_group_membership)

let make_endpoint ?address:(address_ : string_ option) ?port:(port_ : integer option) () =
  ({ address = address_; port = port_ } : endpoint)

let make_node ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?create_time:(create_time_ : t_stamp option) ?endpoint:(endpoint_ : endpoint option) () =
  ({
     name = name_;
     status = status_;
     availability_zone = availability_zone_;
     create_time = create_time_;
     endpoint = endpoint_;
   }
    : node)

let make_shard ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?slots:(slots_ : string_ option) ?nodes:(nodes_ : node_list option)
    ?number_of_nodes:(number_of_nodes_ : integer_optional option) () =
  ({
     name = name_;
     status = status_;
     slots = slots_;
     nodes = nodes_;
     number_of_nodes = number_of_nodes_;
   }
    : shard)

let make_pending_modified_service_update
    ?service_update_name:(service_update_name_ : string_ option)
    ?status:(status_ : service_update_status option) () =
  ({ service_update_name = service_update_name_; status = status_ }
    : pending_modified_service_update)

let make_slot_migration ?progress_percentage:(progress_percentage_ : double option) () =
  ({ progress_percentage = progress_percentage_ } : slot_migration)

let make_resharding_status ?slot_migration:(slot_migration_ : slot_migration option) () =
  ({ slot_migration = slot_migration_ } : resharding_status)

let make_cluster_pending_updates ?resharding:(resharding_ : resharding_status option)
    ?ac_ls:(ac_ls_ : ac_ls_update_status option)
    ?service_updates:(service_updates_ : pending_modified_service_update_list option) () =
  ({ resharding = resharding_; ac_ls = ac_ls_; service_updates = service_updates_ }
    : cluster_pending_updates)

let make_cluster ?name:(name_ : string_ option) ?description:(description_ : string_ option)
    ?status:(status_ : string_ option)
    ?pending_updates:(pending_updates_ : cluster_pending_updates option)
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ?number_of_shards:(number_of_shards_ : integer_optional option)
    ?shards:(shards_ : shard_list option) ?availability_mode:(availability_mode_ : az_status option)
    ?cluster_endpoint:(cluster_endpoint_ : endpoint option) ?node_type:(node_type_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?engine_patch_version:(engine_patch_version_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?parameter_group_status:(parameter_group_status_ : string_ option)
    ?security_groups:(security_groups_ : security_group_membership_list option)
    ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?tls_enabled:(tls_enabled_ : boolean_optional option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?ar_n:(ar_n_ : string_ option) ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?sns_topic_status:(sns_topic_status_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?snapshot_window:(snapshot_window_ : string_ option) ?acl_name:(acl_name_ : acl_name option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?data_tiering:(data_tiering_ : data_tiering_status option)
    ?network_type:(network_type_ : network_type option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option) () =
  ({
     name = name_;
     description = description_;
     status = status_;
     pending_updates = pending_updates_;
     multi_region_cluster_name = multi_region_cluster_name_;
     number_of_shards = number_of_shards_;
     shards = shards_;
     availability_mode = availability_mode_;
     cluster_endpoint = cluster_endpoint_;
     node_type = node_type_;
     engine = engine_;
     engine_version = engine_version_;
     engine_patch_version = engine_patch_version_;
     parameter_group_name = parameter_group_name_;
     parameter_group_status = parameter_group_status_;
     security_groups = security_groups_;
     subnet_group_name = subnet_group_name_;
     tls_enabled = tls_enabled_;
     kms_key_id = kms_key_id_;
     ar_n = ar_n_;
     sns_topic_arn = sns_topic_arn_;
     sns_topic_status = sns_topic_status_;
     snapshot_retention_limit = snapshot_retention_limit_;
     maintenance_window = maintenance_window_;
     snapshot_window = snapshot_window_;
     acl_name = acl_name_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     data_tiering = data_tiering_;
     network_type = network_type_;
     ip_discovery = ip_discovery_;
   }
    : cluster)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_replica_configuration_request ?replica_count:(replica_count_ : integer option) () =
  ({ replica_count = replica_count_ } : replica_configuration_request)

let make_update_cluster_request ?description:(description_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?sns_topic_status:(sns_topic_status_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?node_type:(node_type_ : string_ option) ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?replica_configuration:(replica_configuration_ : replica_configuration_request option)
    ?shard_configuration:(shard_configuration_ : shard_configuration_request option)
    ?acl_name:(acl_name_ : acl_name option) ?ip_discovery:(ip_discovery_ : ip_discovery option)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     cluster_name = cluster_name_;
     description = description_;
     security_group_ids = security_group_ids_;
     maintenance_window = maintenance_window_;
     sns_topic_arn = sns_topic_arn_;
     sns_topic_status = sns_topic_status_;
     parameter_group_name = parameter_group_name_;
     snapshot_window = snapshot_window_;
     snapshot_retention_limit = snapshot_retention_limit_;
     node_type = node_type_;
     engine = engine_;
     engine_version = engine_version_;
     replica_configuration = replica_configuration_;
     shard_configuration = shard_configuration_;
     acl_name = acl_name_;
     ip_discovery = ip_discovery_;
   }
    : update_cluster_request)

let make_update_acl_response ?ac_l:(ac_l_ : ac_l option) () =
  ({ ac_l = ac_l_ } : update_acl_response)

let make_update_acl_request ?user_names_to_add:(user_names_to_add_ : user_name_list_input option)
    ?user_names_to_remove:(user_names_to_remove_ : user_name_list_input option)
    ~acl_name:(acl_name_ : string_) () =
  ({
     acl_name = acl_name_;
     user_names_to_add = user_names_to_add_;
     user_names_to_remove = user_names_to_remove_;
   }
    : update_acl_request)

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_untag_resource_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : untag_resource_response)

let make_untag_resource_request ~resource_arn:(resource_arn_ : string_)
    ~tag_keys:(tag_keys_ : key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : tag_resource_response)

let make_tag_resource_request ~resource_arn:(resource_arn_ : string_) ~tags:(tags_ : tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_reset_parameter_group_response ?parameter_group:(parameter_group_ : parameter_group option)
    () =
  ({ parameter_group = parameter_group_ } : reset_parameter_group_response)

let make_reset_parameter_group_request ?all_parameters:(all_parameters_ : boolean_ option)
    ?parameter_names:(parameter_names_ : parameter_name_list option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     parameter_group_name = parameter_group_name_;
     all_parameters = all_parameters_;
     parameter_names = parameter_names_;
   }
    : reset_parameter_group_request)

let make_recurring_charge ?recurring_charge_amount:(recurring_charge_amount_ : double option)
    ?recurring_charge_frequency:(recurring_charge_frequency_ : string_ option) () =
  ({
     recurring_charge_amount = recurring_charge_amount_;
     recurring_charge_frequency = recurring_charge_frequency_;
   }
    : recurring_charge)

let make_reserved_node ?reservation_id:(reservation_id_ : string_ option)
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?start_time:(start_time_ : t_stamp option)
    ?duration:(duration_ : integer option) ?fixed_price:(fixed_price_ : double option)
    ?node_count:(node_count_ : integer option) ?offering_type:(offering_type_ : string_ option)
    ?state:(state_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option)
    ?ar_n:(ar_n_ : string_ option) () =
  ({
     reservation_id = reservation_id_;
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
     node_type = node_type_;
     start_time = start_time_;
     duration = duration_;
     fixed_price = fixed_price_;
     node_count = node_count_;
     offering_type = offering_type_;
     state = state_;
     recurring_charges = recurring_charges_;
     ar_n = ar_n_;
   }
    : reserved_node)

let make_purchase_reserved_nodes_offering_response
    ?reserved_node:(reserved_node_ : reserved_node option) () =
  ({ reserved_node = reserved_node_ } : purchase_reserved_nodes_offering_response)

let make_purchase_reserved_nodes_offering_request ?reservation_id:(reservation_id_ : string_ option)
    ?node_count:(node_count_ : integer_optional option) ?tags:(tags_ : tag_list option)
    ~reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_) () =
  ({
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
     reservation_id = reservation_id_;
     node_count = node_count_;
     tags = tags_;
   }
    : purchase_reserved_nodes_offering_request)

let make_list_tags_response ?tag_list:(tag_list_ : tag_list option) () =
  ({ tag_list = tag_list_ } : list_tags_response)

let make_list_tags_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : list_tags_request)

let make_list_allowed_node_type_updates_response
    ?scale_up_node_types:(scale_up_node_types_ : node_type_list option)
    ?scale_down_node_types:(scale_down_node_types_ : node_type_list option) () =
  ({ scale_up_node_types = scale_up_node_types_; scale_down_node_types = scale_down_node_types_ }
    : list_allowed_node_type_updates_response)

let make_list_allowed_node_type_updates_request ~cluster_name:(cluster_name_ : string_) () =
  ({ cluster_name = cluster_name_ } : list_allowed_node_type_updates_request)

let make_list_allowed_multi_region_cluster_updates_response
    ?scale_up_node_types:(scale_up_node_types_ : node_type_list option)
    ?scale_down_node_types:(scale_down_node_types_ : node_type_list option) () =
  ({ scale_up_node_types = scale_up_node_types_; scale_down_node_types = scale_down_node_types_ }
    : list_allowed_multi_region_cluster_updates_response)

let make_list_allowed_multi_region_cluster_updates_request
    ~multi_region_cluster_name:(multi_region_cluster_name_ : string_) () =
  ({ multi_region_cluster_name = multi_region_cluster_name_ }
    : list_allowed_multi_region_cluster_updates_request)

let make_failover_shard_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : failover_shard_response)

let make_failover_shard_request ~cluster_name:(cluster_name_ : string_)
    ~shard_name:(shard_name_ : string_) () =
  ({ cluster_name = cluster_name_; shard_name = shard_name_ } : failover_shard_request)

let make_describe_users_response ?users:(users_ : user_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ users = users_; next_token = next_token_ } : describe_users_response)

let make_filter ~name:(name_ : filter_name) ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : filter)

let make_describe_users_request ?user_name:(user_name_ : user_name option)
    ?filters:(filters_ : filter_list option) ?max_results:(max_results_ : integer_optional option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     user_name = user_name_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_users_request)

let make_describe_subnet_groups_response ?next_token:(next_token_ : string_ option)
    ?subnet_groups:(subnet_groups_ : subnet_group_list option) () =
  ({ next_token = next_token_; subnet_groups = subnet_groups_ } : describe_subnet_groups_response)

let make_describe_subnet_groups_request ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ subnet_group_name = subnet_group_name_; max_results = max_results_; next_token = next_token_ }
    : describe_subnet_groups_request)

let make_shard_configuration ?slots:(slots_ : string_ option)
    ?replica_count:(replica_count_ : integer_optional option) () =
  ({ slots = slots_; replica_count = replica_count_ } : shard_configuration)

let make_shard_detail ?name:(name_ : string_ option)
    ?configuration:(configuration_ : shard_configuration option) ?size:(size_ : string_ option)
    ?snapshot_creation_time:(snapshot_creation_time_ : t_stamp option) () =
  ({
     name = name_;
     configuration = configuration_;
     size = size_;
     snapshot_creation_time = snapshot_creation_time_;
   }
    : shard_detail)

let make_cluster_configuration ?name:(name_ : string_ option)
    ?description:(description_ : string_ option) ?node_type:(node_type_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?topic_arn:(topic_arn_ : string_ option) ?port:(port_ : integer_optional option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?subnet_group_name:(subnet_group_name_ : string_ option) ?vpc_id:(vpc_id_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?snapshot_window:(snapshot_window_ : string_ option)
    ?num_shards:(num_shards_ : integer_optional option) ?shards:(shards_ : shard_details option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option) () =
  ({
     name = name_;
     description = description_;
     node_type = node_type_;
     engine = engine_;
     engine_version = engine_version_;
     maintenance_window = maintenance_window_;
     topic_arn = topic_arn_;
     port = port_;
     parameter_group_name = parameter_group_name_;
     subnet_group_name = subnet_group_name_;
     vpc_id = vpc_id_;
     snapshot_retention_limit = snapshot_retention_limit_;
     snapshot_window = snapshot_window_;
     num_shards = num_shards_;
     shards = shards_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     multi_region_cluster_name = multi_region_cluster_name_;
   }
    : cluster_configuration)

let make_snapshot ?name:(name_ : string_ option) ?status:(status_ : string_ option)
    ?source:(source_ : string_ option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?ar_n:(ar_n_ : string_ option)
    ?cluster_configuration:(cluster_configuration_ : cluster_configuration option)
    ?data_tiering:(data_tiering_ : data_tiering_status option) () =
  ({
     name = name_;
     status = status_;
     source = source_;
     kms_key_id = kms_key_id_;
     ar_n = ar_n_;
     cluster_configuration = cluster_configuration_;
     data_tiering = data_tiering_;
   }
    : snapshot)

let make_describe_snapshots_response ?next_token:(next_token_ : string_ option)
    ?snapshots:(snapshots_ : snapshot_list option) () =
  ({ next_token = next_token_; snapshots = snapshots_ } : describe_snapshots_response)

let make_describe_snapshots_request ?cluster_name:(cluster_name_ : string_ option)
    ?snapshot_name:(snapshot_name_ : string_ option) ?source:(source_ : string_ option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer_optional option)
    ?show_detail:(show_detail_ : boolean_optional option) () =
  ({
     cluster_name = cluster_name_;
     snapshot_name = snapshot_name_;
     source = source_;
     next_token = next_token_;
     max_results = max_results_;
     show_detail = show_detail_;
   }
    : describe_snapshots_request)

let make_service_update ?cluster_name:(cluster_name_ : string_ option)
    ?service_update_name:(service_update_name_ : string_ option)
    ?release_date:(release_date_ : t_stamp option) ?description:(description_ : string_ option)
    ?status:(status_ : service_update_status option) ?type_:(type__ : service_update_type option)
    ?engine:(engine_ : string_ option) ?nodes_updated:(nodes_updated_ : string_ option)
    ?auto_update_start_date:(auto_update_start_date_ : t_stamp option) () =
  ({
     cluster_name = cluster_name_;
     service_update_name = service_update_name_;
     release_date = release_date_;
     description = description_;
     status = status_;
     type_ = type__;
     engine = engine_;
     nodes_updated = nodes_updated_;
     auto_update_start_date = auto_update_start_date_;
   }
    : service_update)

let make_describe_service_updates_response ?next_token:(next_token_ : string_ option)
    ?service_updates:(service_updates_ : service_update_list option) () =
  ({ next_token = next_token_; service_updates = service_updates_ }
    : describe_service_updates_response)

let make_describe_service_updates_request
    ?service_update_name:(service_update_name_ : string_ option)
    ?cluster_names:(cluster_names_ : cluster_name_list option)
    ?status:(status_ : service_update_status_list option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     service_update_name = service_update_name_;
     cluster_names = cluster_names_;
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_service_updates_request)

let make_reserved_nodes_offering
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?duration:(duration_ : integer option)
    ?fixed_price:(fixed_price_ : double option) ?offering_type:(offering_type_ : string_ option)
    ?recurring_charges:(recurring_charges_ : recurring_charge_list option) () =
  ({
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
     node_type = node_type_;
     duration = duration_;
     fixed_price = fixed_price_;
     offering_type = offering_type_;
     recurring_charges = recurring_charges_;
   }
    : reserved_nodes_offering)

let make_describe_reserved_nodes_offerings_response ?next_token:(next_token_ : string_ option)
    ?reserved_nodes_offerings:(reserved_nodes_offerings_ : reserved_nodes_offering_list option) () =
  ({ next_token = next_token_; reserved_nodes_offerings = reserved_nodes_offerings_ }
    : describe_reserved_nodes_offerings_response)

let make_describe_reserved_nodes_offerings_request
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?duration:(duration_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
     node_type = node_type_;
     duration = duration_;
     offering_type = offering_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_reserved_nodes_offerings_request)

let make_describe_reserved_nodes_response ?next_token:(next_token_ : string_ option)
    ?reserved_nodes:(reserved_nodes_ : reserved_node_list option) () =
  ({ next_token = next_token_; reserved_nodes = reserved_nodes_ }
    : describe_reserved_nodes_response)

let make_describe_reserved_nodes_request ?reservation_id:(reservation_id_ : string_ option)
    ?reserved_nodes_offering_id:(reserved_nodes_offering_id_ : string_ option)
    ?node_type:(node_type_ : string_ option) ?duration:(duration_ : string_ option)
    ?offering_type:(offering_type_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     reservation_id = reservation_id_;
     reserved_nodes_offering_id = reserved_nodes_offering_id_;
     node_type = node_type_;
     duration = duration_;
     offering_type = offering_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_reserved_nodes_request)

let make_parameter ?name:(name_ : string_ option) ?value:(value_ : string_ option)
    ?description:(description_ : string_ option) ?data_type:(data_type_ : string_ option)
    ?allowed_values:(allowed_values_ : string_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option) () =
  ({
     name = name_;
     value = value_;
     description = description_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     minimum_engine_version = minimum_engine_version_;
   }
    : parameter)

let make_describe_parameters_response ?next_token:(next_token_ : string_ option)
    ?parameters:(parameters_ : parameters_list option) () =
  ({ next_token = next_token_; parameters = parameters_ } : describe_parameters_response)

let make_describe_parameters_request ?max_results:(max_results_ : integer_optional option)
    ?next_token:(next_token_ : string_ option)
    ~parameter_group_name:(parameter_group_name_ : string_) () =
  ({
     parameter_group_name = parameter_group_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_parameters_request)

let make_describe_parameter_groups_response ?next_token:(next_token_ : string_ option)
    ?parameter_groups:(parameter_groups_ : parameter_group_list option) () =
  ({ next_token = next_token_; parameter_groups = parameter_groups_ }
    : describe_parameter_groups_response)

let make_describe_parameter_groups_request
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     parameter_group_name = parameter_group_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_parameter_groups_request)

let make_multi_region_parameter ?name:(name_ : string_ option) ?value:(value_ : string_ option)
    ?description:(description_ : string_ option) ?source:(source_ : string_ option)
    ?data_type:(data_type_ : string_ option) ?allowed_values:(allowed_values_ : string_ option)
    ?minimum_engine_version:(minimum_engine_version_ : string_ option) () =
  ({
     name = name_;
     value = value_;
     description = description_;
     source = source_;
     data_type = data_type_;
     allowed_values = allowed_values_;
     minimum_engine_version = minimum_engine_version_;
   }
    : multi_region_parameter)

let make_describe_multi_region_parameters_response ?next_token:(next_token_ : string_ option)
    ?multi_region_parameters:(multi_region_parameters_ : multi_region_parameters_list option) () =
  ({ next_token = next_token_; multi_region_parameters = multi_region_parameters_ }
    : describe_multi_region_parameters_response)

let make_describe_multi_region_parameters_request ?source:(source_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    ~multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_) () =
  ({
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     source = source_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_multi_region_parameters_request)

let make_multi_region_parameter_group ?name:(name_ : string_ option)
    ?family:(family_ : string_ option) ?description:(description_ : string_ option)
    ?ar_n:(ar_n_ : string_ option) () =
  ({ name = name_; family = family_; description = description_; ar_n = ar_n_ }
    : multi_region_parameter_group)

let make_describe_multi_region_parameter_groups_response ?next_token:(next_token_ : string_ option)
    ?multi_region_parameter_groups:
      (multi_region_parameter_groups_ : multi_region_parameter_group_list option) () =
  ({ next_token = next_token_; multi_region_parameter_groups = multi_region_parameter_groups_ }
    : describe_multi_region_parameter_groups_response)

let make_describe_multi_region_parameter_groups_request
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_multi_region_parameter_groups_request)

let make_describe_multi_region_clusters_response ?next_token:(next_token_ : string_ option)
    ?multi_region_clusters:(multi_region_clusters_ : multi_region_cluster_list option) () =
  ({ next_token = next_token_; multi_region_clusters = multi_region_clusters_ }
    : describe_multi_region_clusters_response)

let make_describe_multi_region_clusters_request
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    ?show_cluster_details:(show_cluster_details_ : boolean_optional option) () =
  ({
     multi_region_cluster_name = multi_region_cluster_name_;
     max_results = max_results_;
     next_token = next_token_;
     show_cluster_details = show_cluster_details_;
   }
    : describe_multi_region_clusters_request)

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

let make_engine_version_info ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?engine_patch_version:(engine_patch_version_ : string_ option)
    ?parameter_group_family:(parameter_group_family_ : string_ option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     engine_patch_version = engine_patch_version_;
     parameter_group_family = parameter_group_family_;
   }
    : engine_version_info)

let make_describe_engine_versions_response ?next_token:(next_token_ : string_ option)
    ?engine_versions:(engine_versions_ : engine_version_info_list option) () =
  ({ next_token = next_token_; engine_versions = engine_versions_ }
    : describe_engine_versions_response)

let make_describe_engine_versions_request ?engine:(engine_ : string_ option)
    ?engine_version:(engine_version_ : string_ option)
    ?parameter_group_family:(parameter_group_family_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    ?default_only:(default_only_ : boolean_ option) () =
  ({
     engine = engine_;
     engine_version = engine_version_;
     parameter_group_family = parameter_group_family_;
     max_results = max_results_;
     next_token = next_token_;
     default_only = default_only_;
   }
    : describe_engine_versions_request)

let make_describe_clusters_response ?next_token:(next_token_ : string_ option)
    ?clusters:(clusters_ : cluster_list option) () =
  ({ next_token = next_token_; clusters = clusters_ } : describe_clusters_response)

let make_describe_clusters_request ?cluster_name:(cluster_name_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    ?show_shard_details:(show_shard_details_ : boolean_optional option) () =
  ({
     cluster_name = cluster_name_;
     max_results = max_results_;
     next_token = next_token_;
     show_shard_details = show_shard_details_;
   }
    : describe_clusters_request)

let make_describe_ac_ls_response ?ac_ls:(ac_ls_ : acl_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ ac_ls = ac_ls_; next_token = next_token_ } : describe_ac_ls_response)

let make_describe_ac_ls_request ?acl_name:(acl_name_ : string_ option)
    ?max_results:(max_results_ : integer_optional option) ?next_token:(next_token_ : string_ option)
    () =
  ({ acl_name = acl_name_; max_results = max_results_; next_token = next_token_ }
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

let make_delete_cluster_request
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ?final_snapshot_name:(final_snapshot_name_ : string_ option)
    ~cluster_name:(cluster_name_ : string_) () =
  ({
     cluster_name = cluster_name_;
     multi_region_cluster_name = multi_region_cluster_name_;
     final_snapshot_name = final_snapshot_name_;
   }
    : delete_cluster_request)

let make_delete_acl_response ?ac_l:(ac_l_ : ac_l option) () =
  ({ ac_l = ac_l_ } : delete_acl_response)

let make_delete_acl_request ~acl_name:(acl_name_ : string_) () =
  ({ acl_name = acl_name_ } : delete_acl_request)

let make_create_user_response ?user:(user_ : user option) () =
  ({ user = user_ } : create_user_response)

let make_create_user_request ?tags:(tags_ : tag_list option) ~user_name:(user_name_ : user_name)
    ~authentication_mode:(authentication_mode_ : authentication_mode)
    ~access_string:(access_string_ : access_string) () =
  ({
     user_name = user_name_;
     authentication_mode = authentication_mode_;
     access_string = access_string_;
     tags = tags_;
   }
    : create_user_request)

let make_create_subnet_group_response ?subnet_group:(subnet_group_ : subnet_group option) () =
  ({ subnet_group = subnet_group_ } : create_subnet_group_response)

let make_create_subnet_group_request ?description:(description_ : string_ option)
    ?tags:(tags_ : tag_list option) ~subnet_group_name:(subnet_group_name_ : string_)
    ~subnet_ids:(subnet_ids_ : subnet_identifier_list) () =
  ({
     subnet_group_name = subnet_group_name_;
     description = description_;
     subnet_ids = subnet_ids_;
     tags = tags_;
   }
    : create_subnet_group_request)

let make_create_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : create_snapshot_response)

let make_create_snapshot_request ?kms_key_id:(kms_key_id_ : string_ option)
    ?tags:(tags_ : tag_list option) ~cluster_name:(cluster_name_ : string_)
    ~snapshot_name:(snapshot_name_ : string_) () =
  ({
     cluster_name = cluster_name_;
     snapshot_name = snapshot_name_;
     kms_key_id = kms_key_id_;
     tags = tags_;
   }
    : create_snapshot_request)

let make_create_parameter_group_response
    ?parameter_group:(parameter_group_ : parameter_group option) () =
  ({ parameter_group = parameter_group_ } : create_parameter_group_response)

let make_create_parameter_group_request ?description:(description_ : string_ option)
    ?tags:(tags_ : tag_list option) ~parameter_group_name:(parameter_group_name_ : string_)
    ~family:(family_ : string_) () =
  ({
     parameter_group_name = parameter_group_name_;
     family = family_;
     description = description_;
     tags = tags_;
   }
    : create_parameter_group_request)

let make_create_multi_region_cluster_response
    ?multi_region_cluster:(multi_region_cluster_ : multi_region_cluster option) () =
  ({ multi_region_cluster = multi_region_cluster_ } : create_multi_region_cluster_response)

let make_create_multi_region_cluster_request ?description:(description_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?multi_region_parameter_group_name:(multi_region_parameter_group_name_ : string_ option)
    ?num_shards:(num_shards_ : integer_optional option)
    ?tls_enabled:(tls_enabled_ : boolean_optional option) ?tags:(tags_ : tag_list option)
    ~multi_region_cluster_name_suffix:(multi_region_cluster_name_suffix_ : string_)
    ~node_type:(node_type_ : string_) () =
  ({
     multi_region_cluster_name_suffix = multi_region_cluster_name_suffix_;
     description = description_;
     engine = engine_;
     engine_version = engine_version_;
     node_type = node_type_;
     multi_region_parameter_group_name = multi_region_parameter_group_name_;
     num_shards = num_shards_;
     tls_enabled = tls_enabled_;
     tags = tags_;
   }
    : create_multi_region_cluster_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_create_cluster_request
    ?multi_region_cluster_name:(multi_region_cluster_name_ : string_ option)
    ?parameter_group_name:(parameter_group_name_ : string_ option)
    ?description:(description_ : string_ option) ?num_shards:(num_shards_ : integer_optional option)
    ?num_replicas_per_shard:(num_replicas_per_shard_ : integer_optional option)
    ?subnet_group_name:(subnet_group_name_ : string_ option)
    ?security_group_ids:(security_group_ids_ : security_group_ids_list option)
    ?maintenance_window:(maintenance_window_ : string_ option)
    ?port:(port_ : integer_optional option) ?sns_topic_arn:(sns_topic_arn_ : string_ option)
    ?tls_enabled:(tls_enabled_ : boolean_optional option) ?kms_key_id:(kms_key_id_ : string_ option)
    ?snapshot_arns:(snapshot_arns_ : snapshot_arns_list option)
    ?snapshot_name:(snapshot_name_ : string_ option)
    ?snapshot_retention_limit:(snapshot_retention_limit_ : integer_optional option)
    ?tags:(tags_ : tag_list option) ?snapshot_window:(snapshot_window_ : string_ option)
    ?engine:(engine_ : string_ option) ?engine_version:(engine_version_ : string_ option)
    ?auto_minor_version_upgrade:(auto_minor_version_upgrade_ : boolean_optional option)
    ?data_tiering:(data_tiering_ : boolean_optional option)
    ?network_type:(network_type_ : network_type option)
    ?ip_discovery:(ip_discovery_ : ip_discovery option) ~cluster_name:(cluster_name_ : string_)
    ~node_type:(node_type_ : string_) ~acl_name:(acl_name_ : acl_name) () =
  ({
     cluster_name = cluster_name_;
     node_type = node_type_;
     multi_region_cluster_name = multi_region_cluster_name_;
     parameter_group_name = parameter_group_name_;
     description = description_;
     num_shards = num_shards_;
     num_replicas_per_shard = num_replicas_per_shard_;
     subnet_group_name = subnet_group_name_;
     security_group_ids = security_group_ids_;
     maintenance_window = maintenance_window_;
     port = port_;
     sns_topic_arn = sns_topic_arn_;
     tls_enabled = tls_enabled_;
     kms_key_id = kms_key_id_;
     snapshot_arns = snapshot_arns_;
     snapshot_name = snapshot_name_;
     snapshot_retention_limit = snapshot_retention_limit_;
     tags = tags_;
     snapshot_window = snapshot_window_;
     acl_name = acl_name_;
     engine = engine_;
     engine_version = engine_version_;
     auto_minor_version_upgrade = auto_minor_version_upgrade_;
     data_tiering = data_tiering_;
     network_type = network_type_;
     ip_discovery = ip_discovery_;
   }
    : create_cluster_request)

let make_create_acl_response ?ac_l:(ac_l_ : ac_l option) () =
  ({ ac_l = ac_l_ } : create_acl_response)

let make_create_acl_request ?user_names:(user_names_ : user_name_list_input option)
    ?tags:(tags_ : tag_list option) ~acl_name:(acl_name_ : string_) () =
  ({ acl_name = acl_name_; user_names = user_names_; tags = tags_ } : create_acl_request)

let make_copy_snapshot_response ?snapshot:(snapshot_ : snapshot option) () =
  ({ snapshot = snapshot_ } : copy_snapshot_response)

let make_copy_snapshot_request ?target_bucket:(target_bucket_ : target_bucket option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?tags:(tags_ : tag_list option)
    ~source_snapshot_name:(source_snapshot_name_ : string_)
    ~target_snapshot_name:(target_snapshot_name_ : string_) () =
  ({
     source_snapshot_name = source_snapshot_name_;
     target_snapshot_name = target_snapshot_name_;
     target_bucket = target_bucket_;
     kms_key_id = kms_key_id_;
     tags = tags_;
   }
    : copy_snapshot_request)

let make_unprocessed_cluster ?cluster_name:(cluster_name_ : string_ option)
    ?error_type:(error_type_ : string_ option) ?error_message:(error_message_ : string_ option) () =
  ({ cluster_name = cluster_name_; error_type = error_type_; error_message = error_message_ }
    : unprocessed_cluster)

let make_batch_update_cluster_response
    ?processed_clusters:(processed_clusters_ : cluster_list option)
    ?unprocessed_clusters:(unprocessed_clusters_ : unprocessed_cluster_list option) () =
  ({ processed_clusters = processed_clusters_; unprocessed_clusters = unprocessed_clusters_ }
    : batch_update_cluster_response)

let make_service_update_request
    ?service_update_name_to_apply:(service_update_name_to_apply_ : string_ option) () =
  ({ service_update_name_to_apply = service_update_name_to_apply_ } : service_update_request)

let make_batch_update_cluster_request
    ?service_update:(service_update_ : service_update_request option)
    ~cluster_names:(cluster_names_ : cluster_name_list) () =
  ({ cluster_names = cluster_names_; service_update = service_update_ }
    : batch_update_cluster_request)
